from copy import deepcopy, copy
import numpy as np
import scipy.spatial.distance as spdist
from sklearn.metrics import pairwise_distances_argmin_min
from .topk_skeleton import EXE_Action, EXE_Stream, remap_action_args
from .constraint_graph import Constraint

# Continuous move: p1: seed_lower_bound, p2: seed_upper_bound
# Discrete move: p1: available_moves, p2: covariance matrix
# DecisionInfo = namedtuple('DecisionInfo', ['discrete', 'p1', 'p2', 'sampler', 'list_constraint'])
pose_generation_streams = ['sample-place', 'sample-stack']


class DecisionInfo(object):
    def __init__(self, op_name, step, discrete, p1, p2, sampler, roles_as_culprit=None):
        self.op_name = op_name
        self.step = step
        self.discrete = discrete
        self.p1 = p1
        self.p2 = p2
        self.sampler = sampler
        self.visit_to_suggestion = {}
        self.dtuple_to_suggestion = {}  # map from decisions of previous depths to the decision of this depth
        if roles_as_culprit is None:
            self.roles_as_culprit = []

    def add_culprit_role(self, ctype, decision_id):
        role = (ctype, decision_id)
        if role not in self.roles_as_culprit:
            self.roles_as_culprit.append(role)

    def __repr__(self):
        return f'{self.step}_{self.op_name}_c={len(self.roles_as_culprit)}'


def remap_action_with_uncertainty(action, mapping):
    concrete_action = remap_action_args(action, mapping)

    name, optms_args, optms_add_effects = action
    _, concrete_args, concrete_add_effects = concrete_action

    new_mapping = copy(mapping)
    if name == 'place':
        new_mapping[optms_args[1]] = concrete_args[1]

    realistic_action = remap_action_args(action, new_mapping)

    return realistic_action, new_mapping


def dist_m(m0, m1, weights):
    weights = np.array(weights)
    m0 = np.array([m0]) * weights
    m1 = np.array([m1]) * weights

    dist = spdist.cdist(m0, m1, 'sqeuclidean')[0][0]

    return dist


def format_continous(input):
    if input is None:
        return input
    return tuple(np.array([input]).astype(float).flatten())


def format_discrete(input):
    if input is None:
        return input
    return tuple(np.array([input]).astype(int).flatten())


class SamplerContinuous(object):
    lower = 0
    upper = 1

    voronoi = True

    def __init__(self, weights, exporation_std, number_sample=10):
        self.weights = np.array(weights)
        self.exporation_std = np.array(exporation_std)
        self.dim = self.exporation_std.shape[0]
        self.number_sample = number_sample

    def __call__(self, existing_decisions, suggestion=None):
        # return np.array([0.9172110753318543, 0.7107272212050124, 0.5546258821576704])
        # return np.array([0.6089764797831964, 0.11843086694924787, 0.5291371039655447])
        # return np.array([0.6882321241415496, 0.9025295354445673, 0.4050595650046644])
        # return np.array([0.6446691904304015, 0.055930328612136246, 0.4763052803691022])

        if suggestion:
            """Prioritize the suggestions from BO"""
            return format_continous(suggestion)

        candidates = [np.random.uniform(0, 1, self.dim)
                      for i in range(self.number_sample * self.dim)]
        candidates = np.array(candidates)

        if not SamplerContinuous.voronoi:
            return format_continous(candidates[0])

        if len(existing_decisions) == 0:
            return format_continous(candidates[0])

        existing_decisions = np.array(existing_decisions)

        _, list_min_dist = pairwise_distances_argmin_min(candidates, existing_decisions)

        best_idx = np.argmax(list_min_dist)

        # return np.array([0.2973888958848264, 0.027592383191802575, 0.5940861289369127])

        return format_continous(candidates[best_idx])


class SamplerDiscrete(object):
    voronoi = True

    def __init__(self, all_choice, list_p):
        self.all_choice = format_discrete(all_choice)
        self.list_p = np.array(list_p)
        self.list_p = self.list_p / sum(list_p)

        self.num_decisions = len(list_p)

    def __call__(self, existing_decisions, suggestion=None):
        # return 1

        if suggestion and suggestion not in existing_decisions:
            """Prioritize the suggestions from BO"""
            return format_discrete(suggestion)

        # if suggestion is not None:
        #     print('reject suggestion')
        if not SamplerDiscrete.voronoi:
            choice = np.random.choice(self.all_choice)
            return format_discrete(choice)

        candidates = [c for c in self.all_choice if c not in existing_decisions]
        assert candidates
        list_p = [self.list_p[self.all_choice.index(c)] for c in candidates]
        list_p = np.array(list_p)
        list_p = list_p / sum(list_p)
        choice = np.random.choice(candidates, p=list_p)
        return format_discrete(choice)
