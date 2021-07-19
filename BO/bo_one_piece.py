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


def fit_initialize_model(train_x, train_obj):
    # define models for objective and constraint
    model = SingleTaskGP(train_x, train_obj, outcome_transform=Standardize(m=train_obj.shape[-1]))
    mll = ExactMarginalLogLikelihood(model.likelihood, model)
    fit_gpytorch_model(mll)
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
            if typed is torch.float64 or typed is torch.float32:
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


def get_ucb(posterior, kappa=2.0):
    mean, sigma = posterior.mean, posterior.variance.sqrt()
    sigma.clamp_min_(1e-9)
    kappa = torch.ones_like(sigma) * kappa
    u = mean + kappa * sigma
    return u.detach().flatten().numpy()


def suggest_from_MCTS(data, range_by_input, fix_by_input=None):
    """
    The interface to TAMP.
    """
    sd = np.random.randint(0, 1000, 1)[0]
    np.random.seed(sd)
    torch.random.manual_seed(sd)
    min_datasize = 4

    if not data or len(data) == 0:
        return None

    dim_inputs = len(data[0]) - 1

    vals_by_input = [[] for _ in range(dim_inputs)]
    xdata = []
    ydata = []

    """Preprocess data =========================================================================="""
    for i, point in enumerate(data):  # replace with g_a, g_b, g_c, g_d, g_e, g_f
        for iv, val in enumerate(point[:-1]):
            if val:
                vals_by_input[iv].append(val)

        x = point[:-1]
        y = point[-1]

        xdata.append(x)
        ydata.append(y)

    for i, point in enumerate(data):  # replace with g_a, g_b, g_c, g_d, g_e, g_f
        if not i:
            trainxy = torch.cat([torch.tensor(a).reshape(-1) for a in point if a != None]).unsqueeze(0)
        else:
            a = torch.cat([torch.tensor(a).reshape(-1) for a in point if a != None])
            trainxy = torch.cat([trainxy, a.unsqueeze(0)], 0)
        for iv, val in enumerate(point[:-1]):
            if val:
                vals_by_input[iv].append(val)

    train_x = trainxy[:, :-1]
    labels_x = trainxy[:, -1].unsqueeze(1)

    sample_input = []
    for vals in vals_by_input:
        if vals:
            sample_input.append(vals[0])
    mask_by_var, mask_by_input = get_mask(sample_input)

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

    dim_vars = len(vals_by_var)

    if fix_by_input is None:
        fix_by_input = [None for i in vals_by_input]
    assert dim_inputs == len(vals_by_input)

    disable_dimVar = []
    for idxInput, fix in enumerate(fix_by_input):
        if fix:
            disable_dimVar.extend(idxInput_to_idxsVar[idxInput])
    X_in_var = list(range(len(vals_by_var)))
    X_in_var = [dim for dim in X_in_var if dim not in disable_dimVar]
    dim_X = dim_vars - len(disable_dimVar)

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

    sample_input = []
    for vals, fix in zip(vals_by_input, fix_by_input):
        if vals and fix is None:
            sample_input.append(vals[0])
    mask_by_X, mask_by_inputX = get_mask(sample_input)

    mll, model = fit_initialize_model(train_x.float(), labels_x.float())

    crossover = MixedVariableCrossover(mask_by_X, {
        'real': get_crossover('real_sbx', eta=15, prob=0.9),
        'int': get_crossover('int_sbx', eta=15, prob=0.9)
    })

    mutation = MixedVariableMutation(mask_by_X, {
        'real': get_mutation('real_pm', eta=20),
        'int': get_mutation('int_pm', eta=20)
    })

    num_obj = 1

    class TempConstraintProblem(Problem):

        def __init__(self, n_var=0, n_obj=0, n_constr=0, xl=[], xu=[]):
            super().__init__(n_var=n_var,
                             n_obj=n_obj,
                             n_constr=n_constr,
                             xl=xl,
                             xu=xu)

        def _evaluate(self, X, out, *args, **kwargs):
            # Here we have a GP for each constraint.
            # If one constraint is binary, see below.

            X = np.array(X).astype(float)
            var = np.empty((X.shape[0], dim_vars))

            for d in range(dim_vars):
                fix = fix_by_var[d]
                if fix is not None:
                    var[:, d] = fix * np.ones((X.shape[0],))
                else:
                    var[:, d] = X[:, X_in_var.index(d)]

            xg = torch.from_numpy(np.array(var).astype(float)).float()

            if xg.ndim <= 1:
                xg = xg.unsqueeze(1)

            # As UCB is positive the higher the better,
            ## so we turn it into minimisation problem to max reward
            out["F"] = -1.0 * get_ucb(model(xg))

    problem = TempConstraintProblem(n_var=dim_X, n_obj=num_obj, n_constr=0, xl=lower_by_X, xu=upper_by_X)

    vals_by_inputX = [vals for vals, fix in zip(vals_by_input, fix_by_input) if fix is None]
    mask_by_inputX = [mask for mask, fix in zip(mask_by_input, fix_by_input) if fix is None]
    range_by_inputX = [rng for rng, fix in zip(range_by_input, fix_by_input) if fix is None]

    def get_init_pop(pop):

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

    sampling = get_init_pop(pop)

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
            # ind_satisfiable = np.random.randint(0, obj.opt.get('F').shape[0], 1)[0]
            # Pick Most Likely Point on Pareto
            ind_satisfiable = np.abs(obj.opt.get('F')).argmax()
            satisfiable_X = result.X[ind_satisfiable]

        if not isinstance(satisfiable_X, Iterable):
            satisfiable_X = np.array([satisfiable_X])

    # satisfiable_X = sampling[0]

    satisfiable_var = np.empty((dim_vars,))
    for d in range(dim_vars):
        fix = fix_by_var[d]
        if fix is not None:
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

    return inputs_next


def read_list_input_output():
    with open('list_bo_input_output.pk', 'rb') as f:
        list_input_output = pk.load(f)
    return list_input_output


if __name__ == '__main__':
    data = [[(0,), (0.9, 0.2, 0.9), 0.05],
            [(0,), (0.5, 0.5, 0.5), 1.2],
            [(1,), (0.7, 0.1, 0.5), 0.01],
            [(2,), (0.1, 0.1, 0.5), 0.2],
            [(2,), (0.9, 0.4, 0.3), 0.2],
            [(3,), (0.2, 0.1, 0.5), 0.01],
            [(4,), (0.1, 0.8, 0.5), 0.01], ]

    range_by_input = [(0, 4), (0, 1)]

    fix_by_input = [(3,), None]
    # fix_by_input = [None, None]
    # fix_by_input = [None, (0.1, 0.1, 0.6)]

    inputs_next = suggest_from_MCTS(data, range_by_input, fix_by_input)
    print(inputs_next)