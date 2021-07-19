# PROCESS DATA

import pickle as pk
import gpytorch
import torch
import botorch
from imblearn.over_sampling import SMOTE

with open('data.pk', 'rb') as f:
    data = pk.load(f)

g_a, g_b, g_c, g_d, g_e, g_f = data

for i, point in enumerate(g_a):  # replace with g_a, g_b, g_c, g_d, g_e, g_f
    if not i:
        trainxy = torch.cat([torch.tensor(a).reshape(-1) for a in point if a != None]).unsqueeze(0)
    else:
        a = torch.cat([torch.tensor(a).reshape(-1) for a in point if a != None])
        trainxy = torch.cat([trainxy, a.unsqueeze(0)], 0)
train_a = trainxy[:, :-1]
labels_a = trainxy[:, -1].unsqueeze(1)
print(train_a.shape, labels_a.shape)

for i, point in enumerate(g_b):  # replace with g_a, g_b, g_c, g_d, g_e, g_f
    if not i:
        trainxy = torch.cat([torch.tensor(a).reshape(-1) for a in point if a != None]).unsqueeze(0)
    else:
        a = torch.cat([torch.tensor(a).reshape(-1) for a in point if a != None])
        trainxy = torch.cat([trainxy, a.unsqueeze(0)], 0)
train_b = trainxy[:, :-1]
labels_b = trainxy[:, -1].unsqueeze(1)
print(train_b.shape, labels_b.shape)

for i, point in enumerate(g_c):  # replace with g_a, g_b, g_c, g_d, g_e, g_f
    if not i:
        trainxy = torch.cat([torch.tensor(a).reshape(-1) for a in point if a != None]).unsqueeze(0)
    else:
        a = torch.cat([torch.tensor(a).reshape(-1) for a in point if a != None])
        trainxy = torch.cat([trainxy, a.unsqueeze(0)], 0)
train_c = trainxy[:, :-1]
labels_c = trainxy[:, -1].unsqueeze(1)
print(train_c.shape, labels_c.shape)

for i, point in enumerate(g_d):  # replace with g_a, g_b, g_c, g_d, g_e, g_f
    if not i:
        trainxy = torch.cat([torch.tensor(a).reshape(-1) for a in point if a != None]).unsqueeze(0)
    else:
        a = torch.cat([torch.tensor(a).reshape(-1) for a in point if a != None])
        trainxy = torch.cat([trainxy, a.unsqueeze(0)], 0)
train_d = trainxy[:, :-1]
labels_d = trainxy[:, -1].unsqueeze(1)
print(train_d.shape, labels_d.shape)

for i, point in enumerate(g_e):  # replace with g_a, g_b, g_c, g_d, g_e, g_f
    if not i:
        trainxy = torch.cat([torch.tensor(a).reshape(-1) for a in point if a != None]).unsqueeze(0)
    else:
        a = torch.cat([torch.tensor(a).reshape(-1) for a in point if a != None])
        trainxy = torch.cat([trainxy, a.unsqueeze(0)], 0)

train_e = trainxy[:, :-1]
labels_e = trainxy[:, -1].unsqueeze(1)
try:
    print('Before Resample')
    print(train_e.shape, labels_e.shape)
    oversample = SMOTE()
    train_e, labels_e = oversample.fit_resample(train_e, labels_e)
    train_e, labels_e = torch.from_numpy(train_e), torch.from_numpy(labels_e)
    print('After Resample')
    print(train_e.shape, labels_e.shape)
except:
    print("Error with oversampling e")

for i, point in enumerate(g_f):  # replace with g_a, g_b, g_c, g_d, g_e, g_f
    if not i:
        trainxy = torch.cat([torch.tensor(a).reshape(-1) for a in point if a != None]).unsqueeze(0)
    else:
        a = torch.cat([torch.tensor(a).reshape(-1) for a in point if a != None])
        trainxy = torch.cat([trainxy, a.unsqueeze(0)], 0)
train_f = trainxy[:, :-1]
labels_f = trainxy[:, -1].unsqueeze(1)
try:
    oversample = SMOTE()
    train_f, labels_f = oversample.fit_resample(train_f, labels_f)
    train_f, labels_f = torch.from_numpy(train_f), torch.from_numpy(labels_f)
    print('After Resample')
    print(train_f.shape, labels_f.shape)
except:
    print('Before Resample')
    print(train_f.shape, labels_f.shape)
    print("Error with oversampling e")
# {-1 or r>0}: g_a, g_b, g_c, g_d
# {-1 or 1}:   g_e, g_f

# TRAIN GP's =============================================================================================================

import numpy as np
from botorch.models.gp_regression import SingleTaskGP
from botorch.models.transforms.outcome import Standardize
from gpytorch.mlls.exact_marginal_log_likelihood import ExactMarginalLogLikelihood
from botorch.utils.transforms import unnormalize
from botorch.utils.sampling import draw_sobol_samples
from botorch import fit_gpytorch_model


def fit_initialize_model(train_x, train_obj):
    # define models for objective and constraint
    model = SingleTaskGP(train_x, train_obj, outcome_transform=Standardize(m=train_obj.shape[-1]))
    mll = ExactMarginalLogLikelihood(model.likelihood, model)
    fit_gpytorch_model(mll)
    return mll.eval(), model.eval()


# ---------------------------------------------------------------------------------------------------
# Deal with discrete prediction using below GP
from gpytorch.models import ExactGP
from gpytorch.likelihoods import BernoulliLikelihood
from gpytorch.means import ConstantMean
from gpytorch.kernels import ScaleKernel, RBFKernel

from gpytorch.models import ApproximateGP
from gpytorch.variational import CholeskyVariationalDistribution
from gpytorch.variational import UnwhitenedVariationalStrategy


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
        print('Iter %d/%d - Loss: %.3f' % (i + 1, training_iterations, loss.item()))
        optimizer.step()
        if loss.item() < loss_best:
            loss_best = loss.item()
            state_dict_best = mll.state_dict()
    print(f'Load Best State Dict at Loss {loss_best}')
    mll.load_state_dict(state_dict_best)
    return mll.eval(), model.eval()


# ---------------------------------------------------------------------------------------------------

mlla, modela = fit_initialize_model(train_a.float(), labels_a.float())
mllb, modelb = fit_initialize_model(train_b.float(), labels_b.float())
mllc, modelc = fit_initialize_model(train_c.float(), labels_c.float())
mlld, modeld = fit_initialize_model(train_d.float(), labels_d.float())

mlle, modele = fit_initialize_model_binary(train_e.float(), labels_e.float())
mllf, modelf = fit_initialize_model_binary(train_f.float(), labels_f.float())


def get_mask(g_x):
    torch_types = [torch.tensor(a).dtype for a in g_x[0] if a != None]
    torch_vals = [a for a in g_x[0] if a != None][:-1]
    mask = []
    for typed, gb_elem in zip(torch_types, torch_vals):
        if gb_elem == None:
            next
        try:
            if typed is torch.float64:
                mask += ['real'] * len(gb_elem)
        except:
            mask += ['real'] * 1
        try:
            if typed is torch.int64:
                mask += ['int'] * len(gb_elem)
        except:
            mask += ['int'] * 1

    return mask


# FIND FEASIBLE REGION ==========================================================================

# until the termination criterion has not been met
max_prob = 0.99
N_iterations = 1
mask = get_mask(g_a)  # get the variable mask from a constraint which depends on 2 variables.
# maska = get_mask(g_a)
# maska = get_mask(g_a)
# maska = get_mask(g_a)
# maska = get_mask(g_a)
# mask = get_mask(g_f)

from torch import Tensor
from torch.distributions import Normal
from pymoo.factory import get_sampling, get_crossover, get_mutation
from pymoo.operators.mixed_variable_operator import MixedVariableSampling, MixedVariableMutation, MixedVariableCrossover

likelihood_bern = gpytorch.likelihoods.BernoulliLikelihood()

sampling = MixedVariableSampling(mask, {
    "real": get_sampling("real_random"),
    "int": get_sampling("int_random")
})

crossover = MixedVariableCrossover(mask, {
    "real": get_crossover("real_sbx", prob=1.0, eta=3.0),
    "int": get_crossover("int_sbx", prob=1.0, eta=3.0)
})

mutation = MixedVariableMutation(mask, {
    "real": get_mutation("real_pm", eta=3.0),
    "int": get_mutation("int_pm", eta=3.0)
})

import numpy as np
from pymoo.model.problem import Problem


def get_cdf_normal(posterior, input_m, best_f, maximize=False):
    mean, sigma = posterior.mean, posterior.variance.sqrt()
    sigma = posterior.variance.sqrt().clamp_min(1e-9)
    u = (mean - best_f.expand_as(mean)) / sigma
    if not maximize:
        u = -u
    normal = Normal(torch.zeros_like(u), torch.ones_like(u))
    return normal.cdf(u).detach().flatten().numpy()


class RoboticConstraintProblem(Problem):

    def __init__(self, train_x):
        super().__init__(n_var=train_x.shape[1],
                         n_obj=6,
                         n_constr=0,
                         xl=train_x.min(0).values.detach().numpy(),  # PUT TRUE VARIABLE LOWER BOUND HERE
                         xu=train_x.max(0).values.detach().numpy())  # PUT TRUE VARIABLE UPPER BOUND HERE
        mn = train_x.min(0).values.detach().numpy()
        mx = train_x.max(0).values.detach().numpy()
        n_var=train_x.shape[1]

        print(f'min {train_x.min(0).values.detach().numpy()}')
        print(f'max {train_x.max(0).values.detach().numpy()}')

    def _evaluate(self, X, out, *args, **kwargs):
        # Here we have a GP for each constraint.
        # If one constraint is binary, see below.
        X = torch.from_numpy(np.array(X).astype(float)).float()
        x1 = X[:, 0].unsqueeze(1)

        target_satisfiable = torch.zeros(1)

        # Continous prediction p(y<0)
        g1 = get_cdf_normal(modela(X), X, target_satisfiable)
        g2 = get_cdf_normal(modelb(x1), x1, target_satisfiable)
        g3 = get_cdf_normal(modelc(x1), x1, target_satisfiable)
        g4 = get_cdf_normal(modeld(X), X, target_satisfiable)

        # Discrete prediction p(y==0)
        g5 = likelihood_bern(modele(X)).probs.detach().flatten().numpy()
        g6 = likelihood_bern(modelf(x1)).probs.detach().flatten().numpy()

        out["F"] = -1.0 * np.column_stack([g1, g2, g3, g4, g5, g6])


class RoboticConstraintProblem2(Problem):

    def __init__(self, train_x):
        super().__init__(n_var=train_x.shape[1],
                         n_obj=6,
                         n_constr=0,
                         xl=train_x.min(0).values.detach().numpy(),  # PUT TRUE VARIABLE LOWER BOUND HERE
                         xu=train_x.max(0).values.detach().numpy())  # PUT TRUE VARIABLE UPPER BOUND HERE
        print(f'min {train_x.min(0).values.detach().numpy()}')
        print(f'max {train_x.max(0).values.detach().numpy()}')

    def _evaluate(self, X, out, *args, **kwargs):
        # Here we have a GP for each constraint.
        # If one constraint is binary, see below.
        X = torch.from_numpy(np.array(X).astype(float)).float()
        x1 = X

        target_satisfiable = torch.zeros(1)

        # Continous prediction p(y<0)

        g2 = get_cdf_normal(modelb(x1), x1, target_satisfiable)
        g3 = get_cdf_normal(modelc(x1), x1, target_satisfiable)

        g6 = likelihood_bern(modelf(x1)).probs.detach().flatten().numpy()

        out["F"] = -1.0 * np.column_stack([g2, g3, g6])


# problem = RoboticConstraintProblem(train_a)
problem = RoboticConstraintProblem(train_a)
# problem = RoboticConstraintProblem2(train_f)


from pymoo.algorithms.nsga2 import NSGA2
from pymoo.factory import get_sampling, get_crossover, get_mutation, get_termination

algorithm = NSGA2(
    pop_size=200,  # change start children
    n_offsprings=200,  # change the number of end children
    sampling=sampling,
    crossover=crossover,
    mutation=mutation,
    eliminate_duplicates=True
)

import copy

# perform a copy of the algorithm to ensure reproducibility
obj = copy.deepcopy(algorithm)
termination = get_termination("n_gen", N_iterations)
# let the algorithm know what problem we are intending to solve and provide other attributes
obj.setup(problem, termination=termination, seed=1)
i = 0
while obj.has_next():
    i += 1
    print(f'iteration {i}')
    # perform an iteration of the algorithm
    obj.next()

    # access the algorithm to print some intermediate outputs
    print(
        f"gen: {obj.n_gen} n_nds: {len(obj.opt)} constr: {obj.opt.get('CV').min()} ideal: {np.abs(obj.opt.get('F')).prod(1).max(axis=0)}")

#     # COMMENT IN TO TERMINATE WHEN MAX PROB ABOVE THRESH

#     # Get highest probability of feasible region
#     if np.abs(obj.opt.get('F')).prod(1).max(0)>max_prob: #Stop when all constraints are below 0
#         ind_satisfiable = np.abs(obj.opt.get('F')).prod(1).argmax()
#         break
# finally obtain the result object
ind_satisfiable = np.abs(obj.opt.get('F')).prod(1).argmax()
result = obj.result()
satisfiable_x = result.X[ind_satisfiable]
print('Final X Which has highest probability of all objectives being satisfied (<0)')
print(f"vector: {satisfiable_x} \n with product probability {np.abs(obj.opt.get('F')).prod(1).max()}")
