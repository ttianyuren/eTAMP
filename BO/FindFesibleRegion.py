import pickle as pk
import gpytorch
import torch
import botorch

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
print(train_e.shape, labels_e.shape)

for i, point in enumerate(g_f):  # replace with g_a, g_b, g_c, g_d, g_e, g_f
    if not i:
        trainxy = torch.cat([torch.tensor(a).reshape(-1) for a in point if a != None]).unsqueeze(0)
    else:
        a = torch.cat([torch.tensor(a).reshape(-1) for a in point if a != None])
        trainxy = torch.cat([trainxy, a.unsqueeze(0)], 0)
train_f = trainxy[:, :-1]
labels_f = trainxy[:, -1].unsqueeze(1)
print(train_f.shape, labels_f.shape)

# {-1 or r>0}: g_a, g_b, g_c, g_d
# {-1 or 1}:   g_e, g_f

from botorch.models.gp_regression import SingleTaskGP
from botorch.models.transforms.outcome import Standardize
from gpytorch.mlls.exact_marginal_log_likelihood import ExactMarginalLogLikelihood
from botorch.utils.transforms import unnormalize
from botorch.utils.sampling import draw_sobol_samples


def initialize_model(train_x, train_obj):
    # define models for objective and constraint
    model = SingleTaskGP(train_x, train_obj, outcome_transform=Standardize(m=train_obj.shape[-1]))
    mll = ExactMarginalLogLikelihood(model.likelihood, model)
    return mll, model


# ---------------------------------------------------------------------------------------------------
# Deal with discrete prediction using below GP
from gpytorch.models import ExactGP
from gpytorch.likelihoods import DirichletClassificationLikelihood
from gpytorch.means import ConstantMean
from gpytorch.kernels import ScaleKernel, RBFKernel


# We will use the simplest form of GP model, exact inference
class DirichletGPModel(ExactGP):
    def __init__(self, train_x, train_y, likelihood, num_classes):
        super(DirichletGPModel, self).__init__(train_x, train_y, likelihood)
        self.mean_module = ConstantMean(batch_shape=torch.Size((num_classes,)))
        self.covar_module = ScaleKernel(
            RBFKernel(batch_shape=torch.Size((num_classes,))),
            batch_shape=torch.Size((num_classes,)),
        )

    def forward(self, x):
        mean_x = self.mean_module(x)
        covar_x = self.covar_module(x)
        return gpytorch.distributions.MultivariateNormal(mean_x, covar_x)


# initialize likelihood and model
# we let the DirichletClassificationLikelihood compute the targets for us
def initialize_model_binary(train_x, train_obj):
    likelihood = DirichletClassificationLikelihood(train_obj, learn_additional_noise=True)
    model = DirichletGPModel(train_x, likelihood.transformed_targets, likelihood, num_classes=likelihood.num_classes)

    return likelihood, model


# ---------------------------------------------------------------------------------------------------

# g_x, train_x, labels_x = g_b, train_b, labels_b
# g_x, train_x, labels_x = g_a, train_a, labels_a
g_x, train_x, labels_x = g_e, train_e, labels_e

# mll1, model1 = initialize_model(train_x.float(), labels_x.float())
mll1, model1 = initialize_model_binary(train_x.float(), labels_x.float())

from botorch import fit_gpytorch_model

fit_gpytorch_model(mll1)


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


mask = get_mask(g_x)

from pymoo.factory import get_sampling, get_crossover, get_mutation
from pymoo.operators.mixed_variable_operator import MixedVariableSampling, MixedVariableMutation, MixedVariableCrossover

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


class RoboticConstraintProblem(Problem):

    def __init__(self, train_x):
        super().__init__(n_var=train_x.shape[1],
                         n_obj=2,
                         n_constr=0,
                         xl=train_x.min(0).values.detach().numpy(),  # PUT TRUE VARIABLE LOWER BOUND HERE
                         xu=train_x.max(0).values.detach().numpy())  # PUT TRUE VARIABLE UPPER BOUND HERE
        print(f'min {train_b.min(0).values.detach().numpy()}')
        print(f'max {train_b.max(0).values.detach().numpy()}')

    def _evaluate(self, X, out, *args, **kwargs):
        # Here we have a GP for each constraint.
        # If one constraint is binary, see below.
        g1 = model1(torch.from_numpy(np.array(X).astype(float)).float()).mean.detach().flatten().numpy()
        g2 = model1(torch.from_numpy(np.array(X).astype(float)).float()).mean.detach().flatten().numpy()
        out["F"] = np.column_stack([g1, g2])


problem = RoboticConstraintProblem(train_x)
from pymoo.algorithms.nsga2 import NSGA2
from pymoo.factory import get_sampling, get_crossover, get_mutation, get_termination

algorithm = NSGA2(
    pop_size=10,  # change start children
    n_offsprings=1,  # change the number of end children
    sampling=sampling,
    crossover=crossover,
    mutation=mutation,
    eliminate_duplicates=True
)

import copy

# perform a copy of the algorithm to ensure reproducibility
obj = copy.deepcopy(algorithm)
termination = get_termination("n_gen", 1000)
# let the algorithm know what problem we are intending to solve and provide other attributes
obj.setup(problem, termination=termination, seed=1)
i = 0
# until the termination criterion has not been met
while obj.has_next():
    i += 1
    print(f'iteration {i}')
    # perform an iteration of the algorithm
    obj.next()

    # access the algorithm to print some intermediate outputs
    print(
        f"gen: {obj.n_gen} n_nds: {len(obj.opt)} constr: {obj.opt.get('CV').min()} ideal: {obj.opt.get('F').min(axis=0)}")

    if (obj.opt.get('F').min(axis=0) < 0).all():
        break
# finally obtain the result object
result = obj.result()
satisfiable_x = result.X
print('Final X Which meets all objectives is below')
print(satisfiable_x)
