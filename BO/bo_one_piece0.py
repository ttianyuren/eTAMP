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


def suggest_bo(data, range_by_input, fix_by_input=None):
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
    xy_data = []
    """Preprocess data =========================================================================="""
    for i, point in enumerate(data):  # replace with g_a, g_b, g_c, g_d, g_e, g_f
        for iv, val in enumerate(point[:-1]):
            if val:
                vals_by_input[iv].append(val)

        x = point[:-1]
        y = point[-1]

        xy_data.append((x, y))

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

    dim_by_inputX = []

    for fix, varDIM in zip(fix_by_input, dimVar_by_input):
        if fix is None:
            dim_by_inputX.append(varDIM)

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
    satisfiable_X = sampling[0]

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

    inputs_next = suggest_bo(data, range_by_input, fix_by_input)
    print(inputs_next)
