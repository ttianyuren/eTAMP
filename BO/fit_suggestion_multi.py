import pickle as pk
import copy
import numpy as np
from collections import defaultdict
from collections.abc import Iterable
import gpytorch
from gpytorch.models import ApproximateGP
from gpytorch.variational import CholeskyVariationalDistribution
from gpytorch.variational import UnwhitenedVariationalStrategy
from gpytorch.mlls.exact_marginal_log_likelihood import ExactMarginalLogLikelihood
import torch
from torch.distributions import Normal
from imblearn.over_sampling import SMOTE
from botorch import fit_gpytorch_model
from botorch.models.gp_regression import SingleTaskGP
from botorch.models.transforms.outcome import Standardize

from sklearn.metrics import pairwise_distances_argmin_min

from pymoo.model.problem import Problem
from pymoo.operators.mixed_variable_operator import MixedVariableSampling, MixedVariableMutation, MixedVariableCrossover
from pymoo.factory import get_sampling, get_crossover, get_mutation, get_termination
from pymoo.algorithms.nsga2 import NSGA2


def is_binary(dx):
    list_y = [p[-1] for p in dx if (p[-1] != 1 and p[-1] != -1)]
    test = len(list_y) == 0
    return test


def fit_initialize_model(train_x, train_obj):
    # define models for objective and constraint
    model = SingleTaskGP(train_x, train_obj, outcome_transform=Standardize(m=train_obj.shape[-1]))
    mll = ExactMarginalLogLikelihood(model.likelihood, model)
    fit_gpytorch_model(mll)
    return mll.eval(), model.eval()


class GPClassificationModel(ApproximateGP):
    def __init__(self, train_x):
        variational_distribution = CholeskyVariationalDistribution(train_x.size(0))
        variational_strategy = UnwhitenedVariationalStrategy(
            self, train_x, variational_distribution, learn_inducing_locations=False
        )
        super(GPClassificationModel, self).__init__(variational_strategy)
        self.mean_module = gpytorch.means.ConstantMean()
        self.covar_module = gpytorch.kernels.ScaleKernel(gpytorch.kernels.RBFKernel())

    def forward(self, x):
        mean_x = self.mean_module(x)
        covar_x = self.covar_module(x)
        latent_pred = gpytorch.distributions.MultivariateNormal(mean_x, covar_x)
        return latent_pred


# initialize likelihood and model
# we let the DirichletClassificationLikelihood compute the targets for us
def fit_initialize_model_binary(train_x, train_y):
    # Initialize model and likelihood
    model = GPClassificationModel(train_x)
    likelihood = gpytorch.likelihoods.BernoulliLikelihood()
    training_iterations = 1000

    # Find optimal model hyperparameters
    model.train()
    likelihood.train()

    # Use the adam optimizer
    optimizer = torch.optim.Adam(model.parameters(), lr=0.1)

    # "Loss" for GPs - the marginal log likelihood
    # num_data refers to the number of training datapoints
    mll = gpytorch.mlls.VariationalELBO(likelihood, model, train_y.numel())
    loss_best = np.inf
    state_dict_best = mll.state_dict()
    for i in range(training_iterations):
        # Zero backpropped gradients from previous iteration
        optimizer.zero_grad()
        # Get predictive output
        output = model(train_x)
        # Calc loss and backprop gradients
        loss = -mll(output, train_y.squeeze())
        loss.backward()
        # print('Iter %d/%d - Loss: %.3f' % (i + 1, training_iterations, loss.item()))
        optimizer.step()
        if loss.item() < loss_best:
            loss_best = loss.item()
            state_dict_best = mll.state_dict()
    print(f'Load Best State Dict at Loss {loss_best}')
    mll.load_state_dict(state_dict_best)
    return mll.eval(), model.eval()


def get_mask(sample_input):
    torch_types = [torch.tensor(a).dtype for a in sample_input if a != None]
    torch_vals = [a for a in sample_input if a != None]
    mask_by_var = []
    mask_by_input = []
    for typed, gb_elem in zip(torch_types, torch_vals):
        if gb_elem == None:
            next
        try:
            if typed is torch.float64:
                mask_by_var += ['real'] * len(gb_elem)
                mask_by_input += ['real']
        except:
            mask_by_var += ['real'] * 1
            mask_by_input += ['real']

        try:
            if typed is torch.int64:
                mask_by_var += ['int'] * len(gb_elem)
                mask_by_input += ['int']
        except:
            mask_by_var += ['int'] * 1
            mask_by_input += ['int']

    return mask_by_var, mask_by_input


def get_cdf_normal(posterior, input_m, best_f, maximize=False):
    mean, sigma = posterior.mean, posterior.variance.sqrt()
    sigma = posterior.variance.sqrt().clamp_min(1e-9)
    u = (mean - best_f.expand_as(mean)) / sigma
    if not maximize:
        u = -u
    normal = Normal(torch.zeros_like(u), torch.ones_like(u))
    return normal.cdf(u).detach().flatten().numpy()


def get_lcb(posterior, input_m, best_f, maximize=False, kappa=2.0):
    mean, sigma = posterior.mean, posterior.variance.sqrt()
    sigma.clamp_min_(1e-9)
    u = mean - kappa * sigma
    return u.detach().flatten().numpy()


def inputs_to_vars(vals_by_input, idxsInput_by_ctype, fix_by_input):
    dimVar_by_input = []
    for vals in vals_by_input:
        if vals:
            dim = len(vals[0])
        else:
            dim = 0
        dimVar_by_input.append(dim)

    vals_by_var = []
    idxInput_to_idxsVar = defaultdict(list)
    c_var = 0
    for idxInput, dimVar in enumerate(dimVar_by_input):
        for idxVar in range(dimVar):
            vals = [v[idxVar] for v in vals_by_input[idxInput]]
            vals_by_var.append(vals)
            idxInput_to_idxsVar[idxInput].append(c_var)
            c_var += 1

    idxsVar_by_ctype = []
    for _, idxsInput in enumerate(idxsInput_by_ctype):
        idxsVar = []
        for i, idxInput in enumerate(idxsInput):
            idxsVar += idxInput_to_idxsVar[idxInput]
        idxsVar_by_ctype.append(idxsVar)

    fix_by_var = []
    for idxInput, fixs in enumerate(fix_by_input):
        if fixs:
            if isinstance(fixs, Iterable):
                for f in fixs:
                    fix_by_var.append(f)
            else:
                fix_by_var.append(fixs)
        else:
            for d in idxInput_to_idxsVar[idxInput]:
                fix_by_var.append(None)

    return vals_by_var, idxsVar_by_ctype, dimVar_by_input, idxInput_to_idxsVar, fix_by_var


def suggest_from_CP(data_by_ctype, idxsInput_by_ctype, bi_by_ctype, fix_by_input=None, range_by_input=None):
    """
       The interface to TAMP.
       """
    sd = np.random.randint(0, 1000, 1)[0]
    np.random.seed(sd)
    torch.random.manual_seed(sd)
    min_datasize = 4
    worst_acq = 0
    assert data_by_ctype

    dim_inputs = len(data_by_ctype[0][0]) - 1
    # num_obj = len(data_by_ctype)
    xy_by_ctype = []
    inputDims = []
    vals_by_input = [[] for _ in range(dim_inputs)]
    """Preprocess data =========================================================================="""
    for d_x, bi in zip(data_by_ctype, bi_by_ctype):
        for i, point in enumerate(d_x):  # replace with g_a, g_b, g_c, g_d, g_e, g_f
            if not i:
                trainxy = torch.cat([torch.tensor(a).reshape(-1) for a in point if a != None]).unsqueeze(0)
            else:
                a = torch.cat([torch.tensor(a).reshape(-1) for a in point if a != None])
                trainxy = torch.cat([trainxy, a.unsqueeze(0)], 0)
            for iv, val in enumerate(point[:-1]):
                if val:
                    vals_by_input[iv].append(val)

        # if sum(test_by_ctype) < len(test_by_ctype):
        #     return None, None

        train_x = trainxy[:, :-1]
        labels_x = trainxy[:, -1].unsqueeze(1)
        if bi:
            try:
                oversample = SMOTE()
                train_x, labels_x = oversample.fit_resample(train_x, labels_x)
                train_x, labels_x = torch.from_numpy(train_x), torch.from_numpy(labels_x)
                # print('After Resample')
                # print(train_x.shape, labels_x.shape)
            except:
                # print('Before Resample')
                # print(train_x.shape, labels_x.shape)
                # print("Error with oversampling e")
                pass
        else:
            # print('Cont Shape')
            # print(train_x.shape, labels_x.shape)
            pass
        inputDims.append(train_x.shape[1])
        xy_by_ctype.append((train_x, labels_x))

    """suggestion starts if only enough data points are collected"""
    dataSize_by_input = [len(vals) for vals in vals_by_input if vals]
    dataSize_by_ctype = [len(d) for d in data_by_ctype]
    bestLabel_by_ctype = [min([p[-1] for p in points]) for points in data_by_ctype]  # ideally <0
    test_by_ctype = []

    for s, l, bi in zip(dataSize_by_ctype, bestLabel_by_ctype, bi_by_ctype):
        if s >= min_datasize and l <= 0. and bi and False:
            test_by_ctype.append(1)
        elif not bi and s >= min_datasize:
            test_by_ctype.append(1)
        else:
            test_by_ctype.append(0)
    if sum(test_by_ctype) < 1:
        return None, None

    if fix_by_input is None:
        fix_by_input = [None for i in vals_by_input]
    assert dim_inputs == len(vals_by_input)

    sample_input = []
    for vals in vals_by_input:
        if vals:
            sample_input.append(vals[0])
    mask_by_var, mask_by_input = get_mask(sample_input)

    sample_input = []
    for vals, fix in zip(vals_by_input, fix_by_input):
        if vals and fix is None:
            sample_input.append(vals[0])
    mask_by_X, mask_by_inputX = get_mask(sample_input)

    vals_by_var, idxsVar_by_ctype, dimVar_by_input, idxInput_to_idxsVar, fix_by_var = inputs_to_vars(vals_by_input,
                                                                                                     idxsInput_by_ctype,
                                                                                                     fix_by_input)

    disable_dimVar = []
    for idxInput, fix in enumerate(fix_by_input):
        if fix:
            disable_dimVar.extend(idxInput_to_idxsVar[idxInput])
    X_in_var = list(range(len(vals_by_var)))
    X_in_var = [dim for dim in X_in_var if dim not in disable_dimVar]

    lower_by_var = [min(lv) for lv in vals_by_var]
    upper_by_var = [max(lv) for lv in vals_by_var]
    dim_vars = len(vals_by_var)

    lower_by_X = np.array(lower_by_var)[X_in_var]
    upper_by_X = np.array(upper_by_var)[X_in_var]
    dim_by_inputX = []

    # Replace with correct variable ranges if available
    if range_by_input is not None:
        offset = 0
        for key, (lb, ub), fix, varDIM in zip(idxInput_to_idxsVar.keys(), range_by_input, fix_by_input,
                                              dimVar_by_input):
            if fix is None:
                dim_by_inputX.append(varDIM)
                varIDX = idxInput_to_idxsVar[key]
                for iDX in varIDX:
                    lower_by_X[iDX - offset] = lb
                    upper_by_X[iDX - offset] = ub
            else:
                offset += varDIM

    upper_by_X = upper_by_X.tolist()
    lower_by_X = lower_by_X.tolist()

    dim_X = dim_vars - len(disable_dimVar)

    mll_model_by_ctype = []
    """Fit models for constraint types =========================================================================="""
    for xy, bi, test in zip(xy_by_ctype, bi_by_ctype, test_by_ctype):
        if test > 0:
            train_x, labels_x = xy
            if bi:
                mll, model = fit_initialize_model_binary(train_x.float(), labels_x.float())
            else:
                mll, model = fit_initialize_model(train_x.float(), labels_x.float())
        else:
            mll, model = None, None

        mll_model_by_ctype.append((mll, model))

    """Find feasible region =========================================================================="""
    # until the termination criterion has not been met

    # Probability that constraint is predicted to be 1.0, we wanna decrease it
    likelihood_bern = gpytorch.likelihoods.BernoulliLikelihood()

    crossover = MixedVariableCrossover(mask_by_X, {
        'real': get_crossover('real_sbx', eta=15, prob=0.9),
        'int': get_crossover('int_sbx', eta=15, prob=0.9)
    })

    mutation = MixedVariableMutation(mask_by_X, {
        'real': get_mutation('real_pm', eta=20),
        'int': get_mutation('int_pm', eta=20)
    })

    num_obj = int(np.sum(test_by_ctype))

    class TempConstraintProblem(Problem):

        def __init__(self, n_var=0, n_obj=0, n_constr=0, xl=[], xu=[], use_ent=False):
            super().__init__(n_var=n_var,
                             n_obj=n_obj,
                             n_constr=n_constr,
                             xl=xl,
                             xu=xu)
            self.use_ent = use_ent

        def _evaluate(self, X, out, *args, **kwargs):
            # Here we have a GP for each constraint.
            # If one constraint is binary, see below.

            X = np.array(X).astype(float)
            var = np.empty((X.shape[0], dim_vars))

            for d in range(dim_vars):
                fix = fix_by_var[d]
                if fix:
                    var[:, d] = fix * np.ones((X.shape[0],))
                else:
                    var[:, d] = X[:, X_in_var.index(d)]

            # for d,fix in enumerate(fix_by_var):
            # print(np.isnan(X).any())
            # print(X)

            var = torch.from_numpy(np.array(var).astype(float)).float()

            list_g = []

            for idxs, mll_model, bi, test, inDIMS in zip(idxsVar_by_ctype, mll_model_by_ctype, bi_by_ctype,
                                                         test_by_ctype, inputDims):
                mll, model = mll_model
                xg = var[:, idxs
                     ]
                if xg.ndim <= 1:
                    xg = xg.unsqueeze(1)
                assert xg.shape[
                           1] == inDIMS, f"Input dimension for GP is {inDIMS} but you tried feeding a tensor of size {xg.shape[1]} with idx's {idxs}"

                if test > 0:
                    if bi:
                        g = likelihood_bern(model(xg)).probs.detach().flatten().numpy()
                        # Multiply by -1 as we minimise
                        p1 = g
                        p0 = (1.0 - g)
                        if self.use_ent:
                            g = p1 * np.log(p1) + p0 * np.log(p0)
                        else:
                            g = -p0
                    else:
                        target_satisfiable = torch.zeros(1)
                        # if worst_acq:
                        g = -get_cdf_normal(model(xg), xg, target_satisfiable)
                        # g = get_lcb(model(xg), xg, target_satisfiable)
                        # else:
                        #     g = get_lcb(model(xg), xg, target_satisfiable)

                else:
                    g = None
                if g is not None:
                    list_g.append(g)

            if worst_acq:
                # Take max as max is worse,  min is better
                g_out = np.column_stack(list_g).max(1)
            else:
                g_out = np.column_stack(list_g)

            out["F"] = g_out

    if worst_acq:
        # Take min of satisfiable probabilities (worst case)
        problem = TempConstraintProblem(n_var=dim_X, n_obj=1, n_constr=0, xl=lower_by_X, xu=upper_by_X)
    else:
        # Get pareto front
        problem = TempConstraintProblem(n_var=dim_X, n_obj=num_obj, n_constr=0, xl=lower_by_X, xu=upper_by_X)

    # problem = TempConstraintProblem(n_var=dim_X, n_obj=num_obj, n_constr=0, xl=lower_by_X, xu=upper_by_X)

    vals_by_inputX = [vals for vals, fix in zip(vals_by_input, fix_by_input) if fix is None]
    mask_by_inputX = [mask for mask, fix in zip(mask_by_input, fix_by_input) if fix is None]
    range_by_inputX = [rng for rng, fix in zip(range_by_input, fix_by_input) if fix is None]

    def get_init_pop(pop):
        ## TODO: Returns starting random samples of population size: Tianyu to finish
        # return initial_random_samples

        samples_by_X = np.zeros((pop, dim_X))
        offset = 0
        for vals, mask, rng, dim in zip(vals_by_inputX, mask_by_inputX, range_by_inputX, dim_by_inputX):
            samples = np.zeros((pop, dim))
            existings = np.array(vals)
            for i in range(pop):
                if mask == 'int':
                    all_choice = list(range(rng[0], rng[-1] + 1))
                    unvisits = [c for c in all_choice if c not in existings]
                    if unvisits:
                        d = np.random.choice(unvisits)
                    else:
                        d = np.random.choice(all_choice)
                else:
                    n_sample = 10
                    candidates = [np.random.uniform(rng[0], rng[-1], dim)
                                  for i in range(n_sample * dim)]
                    candidates = np.array(candidates)
                    if len(existings) == 0:
                        d = candidates[0]
                    else:
                        _, list_min_dist = pairwise_distances_argmin_min(candidates, existings)
                        best_idx = np.argmax(list_min_dist)
                        d = candidates[best_idx]
                d = np.array(d).reshape((1, -1))
                existings = np.concatenate((existings, d), axis=0)
                samples[i, :] = d
            samples_by_X[:, offset:offset + dim] = samples
            offset += dim
        return samples_by_X

    pop = 100

    # Old init method
    # sampling = MixedVariableSampling(mask_by_X, {
    #     "real": get_sampling("real_lhs"),
    #     "int": get_sampling("int_random")
    # })
    sampling = get_init_pop(pop)
    # print(f'Using Vertebi Initalisation {sampling}')

    algorithm = NSGA2(
        pop_size=pop,  # change start children
        n_offsprings=pop,  # change the number of end children
        sampling=sampling,  # TODO: can replace with get_init_pop(pop) once made
        crossover=crossover,
        mutation=mutation,
        eliminate_duplicates=True
    )

    # perform a copy of the algorithm to ensure reproducibility
    obj = copy.deepcopy(algorithm)
    N_iterations = 100
    termination = get_termination("n_gen", N_iterations)
    # let the algorithm know what problem we are intending to solve and provide other attributes

    # obj.setup(problem, termination=termination, seed=1)
    obj.setup(problem, termination=termination, seed=sd)
    i = 0
    # try:
    if True:
        while obj.has_next():
            i += 1
            # print(f'iteration {i}')
            # perform an iteration of the algorithm
            obj.next()

            # access the algorithm to print some intermediate outputs
            # print(
            #     f"gen: {obj.n_gen} n_nds: {len(obj.opt)} constr: {obj.opt.get('CV').min()} ideal: {np.abs(obj.opt.get('F')).prod(1).max(axis=0)}")

            # Get highest probability of feasible region
            # print(np.abs(obj.opt.get('F')).prod(1).max(0))
            # if max_prob is not None and np.abs(obj.opt.get('F')).prod(1).max(0) > max_prob:
            # Stop when all constraints are below 0
            #   break

        # finally obtain the result object
        result = obj.result()
        # print(result.X)
        if len(result.X.shape) == 1:
            satisfiable_X = result.X
        else:
            # Randomly Select Pareto Front
            ind_satisfiable = np.random.randint(0, obj.opt.get('F').shape[0], 1)[0]
            # Pick Most Likely Point on Pareto
            # ind_satisfiable = np.abs(obj.opt.get('F')).prod(1).argmax()
            satisfiable_X = result.X[ind_satisfiable]

        if not isinstance(satisfiable_X, Iterable):
            satisfiable_X = np.array([satisfiable_X])
    # except:
    #     print("BO failed. Return random suggestions instead.")
    #     satisfiable_X = sampling[0, :]

    """Final X Which has highest probability of all objectives being satisfied (<0)"""
    # print(f"vector: {satisfiable_X} \n with product probability {np.abs(obj.opt.get('F')).prod(1).max()}")

    satisfiable_var = np.empty((dim_vars,))
    for d in range(dim_vars):
        fix = fix_by_var[d]
        if fix:
            satisfiable_var[d] = fix
        else:
            satisfiable_var[d] = satisfiable_X[X_in_var.index(d)]

    inputs_next = []
    for i in range(dim_inputs):
        idxsVar = idxInput_to_idxsVar[i]
        assert idxsVar is not None
        dim_input = []
        for iv in idxsVar:
            value = satisfiable_var[iv]
            if np.isnan(value):
                return None, None
            if mask_by_var[iv] == 'int':
                dim_input.append(int(value))
            else:
                dim_input.append(float(value))
        inputs_next.append(tuple(dim_input))

    info_by_input = dataSize_by_input
    return inputs_next, info_by_input


def read_list_input_output():
    with open('list_bo_input_output.pk', 'rb') as f:
        list_input_output = pk.load(f)
    return list_input_output


if __name__ == '__main__':
    # with open('data0.pk', 'rb') as f:
    #     data = pk.load(f)
    # idxsInput_by_ctype = [[0, 1],
    #                       [0],
    #                       [0],
    #                       [0, 1],
    #                       [0, 1],
    #                       [0]]
    # fix_by_input = [(1,), None]
    # inputs_next, info_by_input = suggest_from_data(data, idxsInput_by_ctype)

    # print(gpytorch.__version__)

    # =========================================================================
    with open('debugDataset.pk', 'rb') as f:
        data_by_ctype, idxs_by_ctype, bi_by_ctype, fix_by_input, range_by_input, constraint_by_ctype = pk.load(f)

    inputs_next, info_by_input = suggest_from_CP(data_by_ctype, idxs_by_ctype, bi_by_ctype, fix_by_input,
                                                 range_by_input)
    print(inputs_next)

    # list_input_output = read_list_input_output()
    # for i, (boInput, boOutput) in enumerate(list_input_output):
    #     data_by_ctype, idxsInput_by_ctype, bi_by_ctype, fix_by_input, range_by_input = boInput
    #     inputs_next, info_by_input = suggest_from_data(data_by_ctype, idxsInput_by_ctype, bi_by_ctype, fix_by_input,
    #
    #                                                    range_by_input)
    #     print('data')
    #     for data in data_by_ctype:
    #         print(data)
    #     print("suggestion")
    #     print(inputs_next)

    # # ======================================================
    # list_input_output = read_list_input_output()
    # (boInput, boOutput) = list_input_output[-1]
    # data_by_ctype, idxsInput_by_ctype, bi_by_ctype, fix_by_input, range_by_input = boInput
    # inputs_next, info_by_input = suggest_from_data(data_by_ctype, idxsInput_by_ctype, bi_by_ctype, fix_by_input,
    #
    #                                                range_by_input)
    # print('data')
    # for data in data_by_ctype:
    #     print(data)
    # print("suggestion")
    # print(inputs_next)
