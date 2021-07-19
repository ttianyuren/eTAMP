from __future__ import print_function

from copy import deepcopy
from collections import defaultdict
from ..algorithms.common import add_fact, INTERNAL_EVALUATION
from ..algorithms.downward import make_predicate, make_preconditions, make_effects, add_predicate, \
    make_conditional_effect_conj, make_conditional_effect_disconj, make_preconditions_disconj, make_conditional_effect
from ..language.constants import Or, And, is_parameter, Equal, Not, str_from_plan, EQ
from ..language.object import Object, OptimisticObject
from ..utils import find_unique, safe_zip, str_from_object, INF, is_hashable

WILD = '*'
ASSIGNED_PREDICATE = '{}assigned'
GROUP_PREDICATE = '{}group'
ORDER_PREDICATE = '{}order'


class PlanConstraints(object):
    def __init__(self, plans=None, groups={}, exact=True, hint=False, max_cost=INF):
        self.plans = plans
        self.groups = groups  # Could make this a list of lists
        self.exact = exact
        self.hint = hint  # Search over skeletons first and then fall back
        self.max_cost = max_cost
        # self.max_length = max_length
        if self.hint:
            raise NotImplementedError()

    def dump(self):
        print('{}(exact={}, max_cost={})'.format(self.__class__.__name__, self.exact, self.max_cost))
        if self.plans is None:
            return
        for i, skeleton in enumerate(self.plans):
            print(i, str_from_plan(skeleton))

    def __repr__(self):
        return '{}{}'.format(self.__class__.__name__, str_from_object(self.__dict__))


# TODO: rename other costs to be terminate_cost (or decision cost)
# TODO: partially ordered plans, AND/OR tree

def to_constant(parameter):
    name = parameter[1:]
    return to_obj('@{}'.format(name))


def to_obj(value):
    # Allows both raw values as well as objects to be specified
    if any(isinstance(value, Class) for Class in [Object, OptimisticObject]):
        return value
    return Object.from_value(value)


##################################################

def make_assignment_facts(assigned_predicate, arg_to_para, args):
    return [(assigned_predicate, to_constant(arg), arg_to_para[arg])
            for arg in args]


def make_order_facts(order_predicate, start_idx, max_idx):
    return [(order_predicate, to_obj('n{}'.format(start_idx)), to_obj('t{}'.format(idx)))
            for idx in range(max_idx)]


def make_hold_fact(hold_predicate, step):
    return hold_predicate, to_obj('s{}'.format(step))


def get_internal_prefix(internal):
    return '_' if internal else ''


def add_plan_constraints(constraints, domain, evaluations, goal_exp, internal=False):
    if (constraints is None) or (constraints.plans is None):
        return goal_exp
    import pddl

    prefix = get_internal_prefix(internal)
    assigned_predicate = ASSIGNED_PREDICATE.format(prefix)
    group_predicate = GROUP_PREDICATE.format(prefix)
    order_predicate = ORDER_PREDICATE.format(prefix)

    for old_obj in constraints.groups:
        for new_obj in constraints.groups[old_obj]:
            # The fact to ensure consistancy in arguments.
            group_fact = (group_predicate, to_obj(old_obj), to_obj(new_obj))
            add_fact(evaluations, group_fact, result=INTERNAL_EVALUATION)
    new_actions = []
    new_goals = []
    for idx, action_plan in enumerate(constraints.plans):
        order_facts = make_order_facts(order_predicate, idx, len(action_plan) + 1)
        add_fact(evaluations, order_facts[0], result=INTERNAL_EVALUATION)
        new_goals.append(order_facts[-1])
        bound_parameters = set()
        for step, (name, args) in enumerate(action_plan):
            # TODO: could also just remove the free parameter from the action
            new_action = deepcopy(find_unique(lambda a: a.name == name, domain.actions))  # Get the action from domain.
            constant_pairs = [(arg, para.name) for arg, para in safe_zip(args, new_action.parameters)
                              if not is_parameter(arg) and arg != WILD]
            # skeleton_parameters = list(filter(is_parameter, args))
            plan_parameters = [arg for arg in args
                               if is_parameter(arg)]
            existing_parameters = [para for para in plan_parameters
                                   if para in bound_parameters]
            local_from_global = {arg: para.name for arg, para in safe_zip(args, new_action.parameters)
                                 if is_parameter(arg)}
            group_preconditions = [(group_predicate if is_hashable(arg) and (arg in constraints.groups) else EQ,
                                    to_obj(arg), para) for arg, para in constant_pairs]
            new_preconditions = make_assignment_facts(assigned_predicate, local_from_global, existing_parameters) + \
                                group_preconditions + [order_facts[step]]
            new_action.precondition = pddl.Conjunction(
                [new_action.precondition, make_preconditions(new_preconditions)]).simplified()

            new_effects = make_assignment_facts(assigned_predicate, local_from_global, plan_parameters) \
                          + [Not(order_facts[step]), order_facts[step + 1]]
            new_action.effects.extend(make_effects(new_effects))
            # TODO: should also negate the effects of all other sequences here

            new_actions.append(new_action)
            bound_parameters.update(plan_parameters)
            # new_action.dump()
    add_predicate(domain, make_predicate(order_predicate, ['?num', '?step']))
    if constraints.exact:
        domain.actions[:] = []
    domain.actions.extend(new_actions)
    new_goal_exp = And(goal_exp, Or(*new_goals))
    return new_goal_exp


def update_domain_problem(skeleton_id, skeleton, domain, goal_exp):
    hold_predicate = 'hold_{}_'.format(skeleton_id)
    followOld_fact = ('followold',)

    pre_hold_fact = None

    daction_to_disconjs = defaultdict(list)

    for step, (name, args) in enumerate(skeleton):
        # Get the action from domain.
        daction = find_unique(lambda a: a.name == name, domain.actions)

        arg_para_pairs = [(arg, para.name) for arg, para in safe_zip(args, daction.parameters)
                          if arg is not None]

        """Build an new cond_effects to add into this domain action"""
        seq_cond_facts = [(EQ, to_obj(arg), para) for arg, para in arg_para_pairs]
        seq_cond_facts.append(followOld_fact)
        if pre_hold_fact is not None:
            seq_cond_facts.append(pre_hold_fact)

        disconj = make_preconditions_disconj([Not(f) for f in seq_cond_facts])
        daction_to_disconjs[daction].append(disconj)

        # Add <Add effect>
        follow_cond_facts = [followOld_fact]
        if pre_hold_fact is not None:
            follow_cond_facts.append(pre_hold_fact)

        hold_fact = (hold_predicate + str(step),)

        add_cond_effect = make_conditional_effect_conj(follow_cond_facts,
                                                       hold_fact)
        daction.effects.append(add_cond_effect)
        pre_hold_fact = hold_fact

    for daction, disconjs in daction_to_disconjs.items():
        delete_cond_effect = make_conditional_effect(disconjs,
                                                     Not(followOld_fact))
        # Add <Delete effect>
        daction.effects.append(delete_cond_effect)

    new_goal_exp = And(goal_exp, Not(pre_hold_fact))

    return new_goal_exp
