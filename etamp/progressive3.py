from __future__ import print_function

import sys
import time
from .algorithm import parse_problem

from .instantiation import *

from .stream import Stream, is_active_arg

from .topk_skeleton import TopkSkeleton

from .pddlstream.algorithms.scheduling.recover_streams import get_achieving_streams
from .pddlstream.utils import INF, elapsed_time, implies
from .pddlstream.language.conversion import evaluation_from_fact
from .pddlstream.algorithms.downward import get_problem
from .pddlstream.language.constants import pAction
from .pddlstream.algorithms.constraints import PlanConstraints, update_domain_problem


def get_plan_skeleton(action_plan):
    action_plan = [a for a in action_plan if isinstance(a, pAction)]

    skeleton = []
    for a in action_plan:
        args = []
        for arg in a.args:
            if is_active_arg(arg):
                args.append(None)
            else:
                args.append(arg)
        args = tuple(args)
        skeleton.append((a.name, args))
    skeleton = tuple(skeleton)
    return skeleton


def apply_streams(evaluations, streams, level_limit):
    instantiator = Instantiator(streams)
    for evaluation, node in evaluations.items():
        if node.complexity <= level_limit:
            instantiator.add_atom(evaluation, node.complexity)
    optms_results = []

    # inst2 = Instantiator2(streams, evaluations)
    # inst2.iterate(10)
    # results2 = inst2.get_new_results()

    while instantiator and (instantiator.min_level() <= level_limit):
        instance = instantiator.pop_stream()
        instance.opt_index = 0
        results = instance.next_optimistic()  # depending on if the instance is marked as refined, if it is, get an unique optimistic object

        for result in results:
            new_facts = False
            level = instantiator.compute_complexity(instance)
            result.level = level

            for fact in result.get_certified():
                new_facts |= instantiator.add_atom(evaluation_from_fact(fact), level)
            if new_facts:
                # assert not isinstance(result, FunctionResult)
                optms_results.append(result)

        # TODO: instantiate and solve to avoid repeated work
    """Indicates nothing left in the queue. 
       So higher level_limit will not enrich the optms results.
       Implies that the input evaluations are probably insufficient."""
    exhausted = not instantiator

    return optms_results, exhausted


def apply_streams2(evaluations, streams, level_limit):
    inst2 = Instantiator2(streams, evaluations)
    inst2.iterate(level_limit)

    optms_results = inst2.get_new_results()

    return optms_results, False


def solve_progressive(problem, constraints=PlanConstraints(), stream_info={}, action_info={},
                      max_iterations=INF, initial_level=0, level_step=1,
                      unit_costs=False, unit_efforts=False, num_optms_init=300, target_sk=100):
    num_iterations = search_time = sample_time = 0
    level_limit = initial_level

    evaluations, goal_exp, domain, externals = parse_problem(problem,
                                                             stream_info=stream_info, action_info=action_info,
                                                             constraints=constraints, unit_costs=unit_costs,
                                                             unit_efforts=unit_efforts)

    while num_iterations < max_iterations:
        start_time = time.time()
        num_iterations += 1
        evals = {e: n for e, n in evaluations.items()}
        assert len(evals) == len(evaluations)

        optms_results, exhausted = apply_streams(evals, externals, level_limit)
        # optms_results, exhausted = apply_streams(evals, externals, level_limit)

        r_problem = get_problem(evaluations, goal_exp, domain)  # begin_metric
        original_init = r_problem.init
        original_goal = r_problem.goal

        dict_fact_node = get_achieving_streams(evaluations, optms_results)

        optms_evaluations = {evaluation_from_fact(f): n.result for f, n in dict_fact_node.items()}

        problem = get_problem(optms_evaluations, goal_exp, domain)  # begin_metric

        optms_init = problem.init

        print('\nIteration: {} | Level: {} | Inits: {}'.format(num_iterations, level_limit, len(problem.init)))

        if len(problem.init) > num_optms_init:
            sk_batch = TopkSkeleton('pddl/domain.pddl', 'pddl/stream.pddl',
                                    original_init, original_goal, optms_results, optms_init,
                                    target_num=target_sk)
            if sk_batch.num_ap >= target_sk:
                print('++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++\n')
                return sk_batch

        search_time += elapsed_time(start_time)

        level_limit += level_step

        sample_time += elapsed_time(start_time)


def solve_progressive2(problem, constraints=PlanConstraints(), max_iterations=INF, initial_level=0, level_step=1,
                       unit_costs=False, unit_efforts=False, num_optms_init=300, target_sk=100,
                       path_domain_file='pddl/domain.pddl', path_stream_file='pddl/stream.pddl'):

    # print(path_domain_file,path_stream_file)

    num_iterations = search_time = sample_time = 0
    level_limit = initial_level

    evaluations, goal_exp, domain, externals = parse_problem(problem,
                                                             constraints=constraints, unit_costs=unit_costs,
                                                             unit_efforts=unit_efforts)

    while num_iterations < max_iterations:
        start_time = time.time()
        num_iterations += 1
        evals = {e: n for e, n in evaluations.items()}
        assert len(evals) == len(evaluations)

        optms_results, exhausted = apply_streams2(evals, externals, level_limit)
        # optms_results, exhausted = apply_streams(evals, externals, level_limit)

        r_problem = get_problem(evaluations, goal_exp, domain)  # begin_metric
        original_init = r_problem.init
        original_goal = r_problem.goal

        dict_fact_node = get_achieving_streams(evaluations, optms_results)

        optms_evaluations = {evaluation_from_fact(f): n.result for f, n in dict_fact_node.items()}

        problem = get_problem(optms_evaluations, goal_exp, domain)  # begin_metric

        optms_init = problem.init

        print('\nIteration: {} | Level: {} | Inits: {}'.format(num_iterations, level_limit, len(problem.init)))

        if len(problem.init) > num_optms_init:
            sk_batch = TopkSkeleton(path_domain_file, path_stream_file,
                                    original_init, original_goal, optms_results, optms_init,
                                    target_num=target_sk)
            if sk_batch.num_ap >= target_sk:
                print('++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++\n')
                return sk_batch

        search_time += elapsed_time(start_time)

        level_limit += level_step

        sample_time += elapsed_time(start_time)
