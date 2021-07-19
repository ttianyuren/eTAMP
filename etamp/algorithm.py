from collections import Counter

from .pddlstream.algorithms.common import evaluations_from_init, SOLUTIONS
from .pddlstream.algorithms.downward import parse_lisp, parse_goal, make_cost, Domain
from .pddlstream.language.constants import get_prefix, get_args
from .pddlstream.language.conversion import obj_from_value_expression
from .pddlstream.language.function import parse_function, parse_predicate, Function
from .pddlstream.language.object import Object, OptimisticObject
from .pddlstream.utils import find_unique, get_mapping, INF

from .stream import Stream, StreamInstance, parse_stream

# from symk.src.translate.pddl_parser.parsing_functions import parse_domain_pddl
# from pddl_parser.parsing_functions import parse_domain_pddl
from .pddlstream.algorithms.downward import parse_domain_pddl

# from ...pddl.translate.pddl_parser.parsing_functions import parse_domain_pddl


UNIVERSAL_TO_CONDITIONAL = False



# TODO: rename to parsing

def parse_constants(domain, constant_map):
    obj_from_constant = {}
    for constant in domain.constants:
        if constant.name.startswith(Object._prefix):  # TODO: check other prefixes
            raise NotImplementedError('Constants are not currently allowed to begin with {}'.format(Object._prefix))
        if constant.name not in constant_map:
            raise ValueError('Undefined constant {}'.format(constant.name))
        value = constant_map.get(constant.name, constant.name)
        obj_from_constant[constant.name] = Object(value, name=constant.name)  # TODO: remap names
        # TODO: add object predicate
    for name in constant_map:
        for constant in domain.constants:
            if constant.name == name:
                break
        else:
            raise ValueError('Constant map value {} not mentioned in domain :constants'.format(name))
    del domain.constants[:]  # So not set twice
    return obj_from_constant


def check_problem(domain, streams, obj_from_constant):
    for action in domain.actions + domain.axioms:
        for p, c in Counter(action.parameters).items():
            if c != 1:
                raise ValueError('Parameter [{}] for action [{}] is not unique'.format(p.name, action.name))
        # TODO: check that no undeclared parameters & constants
        # action.dump()
    undeclared_predicates = set()
    for stream in streams:
        # TODO: domain.functions
        facts = list(stream.domain)
        if isinstance(stream, Stream):
            facts.extend(stream.certified)
        for fact in facts:
            name = get_prefix(fact)
            if name not in domain.predicate_dict:
                undeclared_predicates.add(name)
            elif len(get_args(fact)) != domain.predicate_dict[name].get_arity():  # predicate used with wrong arity: {}
                print('Warning! predicate used with wrong arity in stream [{}]: {}'.format(stream.name, fact))
        for constant in stream.constants:
            if constant not in obj_from_constant:
                raise ValueError('Undefined constant in stream [{}]: {}'.format(stream.name, constant))
    if undeclared_predicates:
        print('Warning! Undeclared predicates: {}'.format(
            sorted(undeclared_predicates)))  # Undeclared predicate: {}


def set_unit_costs(domain):
    # Cost of None becomes zero if metric = True
    set_cost_scale(1)
    for action in domain.actions:
        action.cost = make_cost(1)


def reset_globals():
    # TODO: maintain these dictionaries in an object
    Object.reset()
    OptimisticObject.reset()
    SOLUTIONS[:] = []


def parse_sequential_domain(domain_pddl, action_info={}):
    if isinstance(domain_pddl, Domain):
        return domain_pddl
    iter_domain_pddl = parse_domain_pddl(parse_lisp(domain_pddl))
    domain = Domain(*iter_domain_pddl)
    return domain


def parse_problem(problem,  constraints=None, unit_costs=False, unit_efforts=False):
    # TODO: just return the problem if already written programmatically
    # reset_globals() # Prevents use of satisfaction.py
    domain_pddl, stream_pddl, init, goal,stream_info, action_info = problem
    # domain = parse_domain(domain_pddl, action_info)
    domain = parse_sequential_domain(domain_pddl, action_info)
    # domain = domain_pddl
    if not isinstance(domain, Domain):
        # assert isinstance(domain, str) # raw PDDL is returned
        obj_from_constant = {name: Object(value, name=name)
                             for name, value in {}.items()}
        streams = parse_stream_pddl(stream_pddl, stream_info=stream_info,
                                    unit_costs=unit_costs, unit_efforts=unit_efforts)
        evaluations = evaluations_from_init(init)
        goal_exp = obj_from_value_expression(goal)
        return evaluations, goal_exp, domain, streams
    # if len(domain.types) != 1:
    #     raise NotImplementedError('Types are not currently supported')
    if unit_costs:
        set_unit_costs(domain)
    obj_from_constant = parse_constants(domain, {})
    streams = parse_stream_pddl(stream_pddl, stream_info=stream_info,
                                unit_costs=unit_costs, unit_efforts=unit_efforts)
    check_problem(domain, streams, obj_from_constant)

    evaluations = evaluations_from_init(init)
    goal_exp = obj_from_value_expression(goal)
    # normalize_domain_goal(domain, goal_expression)

    parse_goal(goal_exp, domain)  # Just to check that it parses

    return evaluations, goal_exp, domain, streams


##################################################

def get_predicates(expression):
    import pddl.conditions
    if isinstance(expression, pddl.conditions.ConstantCondition):
        return set()
    if isinstance(expression, pddl.conditions.JunctorCondition) or \
            isinstance(expression, pddl.conditions.QuantifiedCondition):
        predicates = set()
        for part in expression.parts:
            predicates.update(get_predicates(part))
        return predicates
    if isinstance(expression, pddl.conditions.Literal):
        return {expression.predicate}
    raise ValueError(expression)


##################################################

def get_domain_predicates(external):
    return set(map(get_prefix, external.domain))


def get_certified_predicates(external):
    if isinstance(external, Stream):
        return set(map(get_prefix, external.certified))
    if isinstance(external, Function):
        return {get_prefix(external.head)}
    raise ValueError(external)


def get_non_producers(externals):
    # TODO: handle case where no domain conditions
    pairs = set()
    for external1 in externals:
        for external2 in externals:
            if get_certified_predicates(external1) & get_domain_predicates(external2):
                pairs.add((external1, external2))
    producers = {e1 for e1, _ in pairs}
    non_producers = set(externals) - producers
    # TODO: these are streams that be evaluated at the end as tests
    return non_producers


##################################################

def parse_streams(streams, rules, stream_pddl, stream_info, use_functions=True):
    """
    :param stream_map: a dictionary for name (stream, function, predicate) to executable generation function.
    :param stream_info: a dictionary for name to stream_info (including opt_gen_fn, negate, defer).
    """
    stream_iter = iter(parse_lisp(stream_pddl))
    assert ('define' == next(stream_iter))
    pddl_type, pddl_name = next(stream_iter)
    assert ('stream' == pddl_type)
    for lisp_list in stream_iter:
        name = lisp_list[0]  # TODO: refactor at this point
        if name in (':stream', ':wild-stream'):
            externals = [parse_stream(lisp_list, stream_info)]
        elif name == ':function':
            if not use_functions:
                continue
            externals = [parse_function(lisp_list, stream_info)]
        elif name == ':predicate':  # Cannot just use args if want a bound
            externals = [parse_predicate(lisp_list, stream_info)]
        else:
            raise ValueError(name)
        for external in externals:
            if any(e.name == external.name for e in streams):
                raise ValueError('Stream [{}] is not unique'.format(external.name))
            if name == ':rule':
                rules.append(external)
            external.pddl_name = pddl_name  # TODO: move within constructors
            streams.append(external)


def set_unit_efforts(externals):
    for external in externals:
        if external.get_effort() < INF:
            external.info.effort = 1


def parse_stream_pddl(pddl_list, stream_info={}, unit_costs=False, unit_efforts=False):
    externals = []
    if pddl_list is None:
        return externals
    if isinstance(pddl_list, str):
        pddl_list = [pddl_list]
    # if all(isinstance(e, External) for e in stream_pddl):
    #    return stream_pddl

    stream_info = {key.lower(): value for key, value in stream_info.items()}
    rules = []
    for pddl in pddl_list:
        # TODO: check which functions are actually used and prune the rest
        parse_streams(externals, rules, pddl, stream_info, use_functions=not unit_costs)
    if unit_efforts:
        set_unit_efforts(externals)
    return externals


##################################################

def remove_blocked(evaluations, instance, new_results):
    # TODO: finish refactoring this
    if new_results and isinstance(instance, StreamInstance):
        instance.enable(evaluations)
