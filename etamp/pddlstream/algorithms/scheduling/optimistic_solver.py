from __future__ import print_function
from instantiate import gen_inst_task
from pddlstream.algorithms.downward import get_problem, task_from_domain_problem, get_cost_scale, \
    scale_cost, fd_from_fact, make_domain, make_predicate, evaluation_from_fd, fact_from_fd, \
    get_preimage_literals_with_idxes
from pddlstream.algorithms.instantiate_task import instantiate_task, sas_from_instantiated
from pddlstream.algorithms.scheduling.apply_fluents import convert_fluent_streams
from pddlstream.algorithms.scheduling.negative import convert_negative, recover_preimage_plan
from pddlstream.algorithms.scheduling.postprocess import postprocess_stream_plan
from pddlstream.algorithms.scheduling.recover_axioms import recover_axioms_plans
from pddlstream.algorithms.scheduling.recover_functions import compute_function_plan
from pddlstream.algorithms.scheduling.recover_streams import extract_stream_plan
from etamp.pddlstream.algorithms.scheduling.utils import get_instance_facts
from pddlstream.algorithms.search import solve_from_task

from pddlstream.language.constants import Not, get_prefix, EQ, pAction, pA_info, pAtom
from pddlstream.language.conversion import transform_plan_args, transform_action_args, pddl2obj
from pddlstream.language.conversion import objects_from_evaluations
from pddlstream.language.optimizer import UNSATISFIABLE

from pddlstream.utils import Verbose, flatten
from itertools import product
from copy import copy
from collections import namedtuple
from etamp.pddlstream.algorithms.instantiation import Instantiator
from pddlstream.algorithms.scheduling.recover_streams import get_achieving_streams, \
    expand_evals_by_results
from pddlstream.algorithms.constraints import PlanConstraints, WILD
from pddlstream.language.constants import FAILED_LEVEL, INFEASIBLE_EVAL, is_plan
from pddlstream.language.conversion import evaluation_from_fact, substitute_expression
from pddlstream.language.function import FunctionResult, Function
from pddlstream.language.stream import StreamResult
from pddlstream.language.statistics import check_effort, compute_stream_plan_effort
from pddlstream.language.object import Object, OptimisticObject
from pddlstream.utils import safe_zip, get_mapping, implies, INF
from pddlstream.algorithms.scheduling.skeleton_batch import SkeletonBatch

CONSTRAIN_STREAMS = True
CONSTRAIN_PLANS = True  # False  True
MAX_DEPTH = INF  # 1 | INF

PREDICATE_ORDER = "_applicable"
PARA_PROPO = '_p'
TYPE_PROPO = 'propo_action'

NT_Domain = namedtuple('NT_Domain',
                       ['name', 'requirements', 'types', 'type_to_constants',
                        'predicates', 'predicate_to_typeList', 'derived', 'action'])
NT_Problem = namedtuple('NT_Problem',
                        ['name', 'domain', 'type_to_objects', 'init', 'goal'])
NT_Action = namedtuple('NT_Action', ['name', 'parameters', 'precondition', 'effect'])
NT_Stream = namedtuple('NT_Stream', ['name', 'inputs', 'domain', 'outputs', 'certified'])


def add_stream_effort_to_action(node_from_atom, instantiated_task, effort_weight, **kwargs):
    """
    Count the estimated stream_cost on its corresponding actions.
    """
    if effort_weight is None:
        return

    for action in instantiated_task.fluent_actions:
        # TODO: prune stream actions here?
        # TODO: round each effort individually to penalize multiple streams
        facts = get_instance_facts(action, node_from_atom)
        # effort = COMBINE_OP([0] + [node_from_atom[fact].effort for fact in facts])
        stream_plan = []
        extract_stream_plan(node_from_atom, facts, stream_plan)

        estimated_effort = compute_stream_plan_effort(stream_plan, **kwargs)
        stream_cost = scale_cost(effort_weight * estimated_effort)
        action.cost += stream_cost


##################################################

def rename_instantiated_actions(instantiated):
    # TODO: rename SAS instead?
    actions = instantiated.fluent_actions[:]
    renamed_actions = []
    action_from_name = {}
    for i, action in enumerate(actions):
        renamed_actions.append(copy(action))
        renamed_name = 'a{}'.format(i)
        renamed_actions[-1].name = '({})'.format(renamed_name)
        action_from_name[renamed_name] = action  # Change reachable_action_params?
    instantiated.fluent_actions[:] = renamed_actions
    return action_from_name


# def pddl_from_instance(instance):
#     action = instance.action
#     args = [instance.var_mapping[para.name]
#             for para in action.parameters[:action.num_external_parameters]]
#     pa_info = pA_info(action.info.cost_fn, None)
#     return pAction(action.name, args, pa_info)


def create_pAtom(atom):
    return pAtom(atom.predicate, atom.args)


def propoAction2pddl(propo_action):
    """
    Transform a propositional action into a namedtuple Action.
    """
    action = propo_action.action
    full_args = [propo_action.var_mapping[para.name]
                 for para in action.parameters[:action.num_external_parameters]]

    pa_info = pA_info(action.info.cost_fn, [create_pAtom(e.effect) for e in propo_action.add_effects], propo_action)
    pa_info = pA_info(action.info.cost_fn, [create_pAtom(e.effect) for e in propo_action.add_effects], None)

    return pAction(action.name, full_args, pa_info)


##################################################

def get_plan_cost(action_plan, cost_from_action):
    """
    Sum up the cost of all actions in the plan.
    """
    if action_plan is None:
        return INF
    # return sum([0.] + [instance.cost for instance in action_plan])
    scaled_cost = sum([0.] + [cost_from_action[action]
                              for action in action_plan])
    return scaled_cost / get_cost_scale()


def instantiate_optimizer_axioms(instantiated, domain, results):
    # Needed for instantiating axioms before adding stream action effects
    # Otherwise, FastDownward will prune these unreachable axioms
    # TODO: compute this first and then apply the eager actions
    stream_init = {fd_from_fact(result.stream_fact)
                   for result in results if isinstance(result, StreamResult)}
    evaluations = list(map(evaluation_from_fd, stream_init | instantiated.atoms))
    temp_domain = make_domain(predicates=[make_predicate(UNSATISFIABLE, [])],
                              axioms=[ax for ax in domain.axioms if ax.name == UNSATISFIABLE])
    temp_problem = get_problem(evaluations, Not((UNSATISFIABLE,)), temp_domain)
    # TODO: UNSATISFIABLE might be in atoms making the goal always infeasible
    with Verbose():
        # TODO: the FastDownward instantiation will prune static preconditions
        new_instantiated = instantiate_task(task_from_domain_problem(temp_domain, temp_problem),
                                            check_infeasible=False, prune_static=False)
        assert new_instantiated is not None
    instantiated.axioms.extend(new_instantiated.axioms)
    instantiated.atoms.update(new_instantiated.atoms)


##################################################

def retrace_stream_plan(original_evaluation, evaluation, optms_evaluation, goal_expression, domain,
                        dict_fact_node, fluent_action_plan, list_fluent_axiom_plan,
                        negative_predicates, replan_step):
    original_task = task_from_domain_problem(domain, get_problem(original_evaluation, goal_expression, domain))
    real_task = task_from_domain_problem(domain, get_problem(evaluation, goal_expression, domain))
    optms_task = task_from_domain_problem(domain,
                                          get_problem(optms_evaluation, goal_expression, domain))  # for the solver

    negname_to_pred = {predicate.name: predicate
                       for predicate in negative_predicates}

    list_step_inits, preimage_plan = recover_preimage_plan(real_task, optms_task,
                                                           list_fluent_axiom_plan, fluent_action_plan,
                                                           negname_to_pred)

    function_plan = compute_function_plan(optms_evaluation, fluent_action_plan)

    literal_to_steps = get_preimage_literals_with_idxes(preimage_plan, [])  # of the full preimage.
    # Full preimage literals required by the plan.
    full_preimage = set(literal_to_steps)
    # Preimage literals to come from streams.
    stream_preimage = full_preimage - set(original_task.init)
    negative_preimage = set([literal for literal in stream_preimage
                             if literal.predicate in negname_to_pred])
    positive_preimage = stream_preimage - negative_preimage

    function_plan.update(
        convert_negative(negative_preimage, negname_to_pred, literal_to_steps, list_step_inits))

    # A mapping from a non-negative preimage fact (from Atom only) to positions where it arises.
    dict_fact_steps = {fact_from_fd(literal): literal_to_steps[literal]
                       for literal in positive_preimage
                       if not literal.negated}
    target_facts = {fact for fact in dict_fact_steps.keys()
                    if get_prefix(fact) != EQ}

    fact_to_minIdx = {fact: min(dict_fact_steps[fact])
                      for fact in target_facts}

    stream_to_minIdx = {}
    stream_plan = []  # empty container
    """stream_plan is recursively extracted to fulfill target facts according to dict_fact_node.
       Streams are basically used to fulfill the static facts of the (full) action_plan.
       ALL streams even for previously added facts are included."""
    extract_stream_plan(dict_fact_node, target_facts, stream_plan,
                        fact_to_minIdx, stream_to_minIdx)

    """evaluation:            steam_plan将仅包括与此次optimistic facts有关的streamResults;
       original_evaluation:   steam_plan将包括所有所依赖streamResults(包括之前生成的)"""
    post_stream_plan = postprocess_stream_plan(original_evaluation, domain, stream_plan, target_facts)

    applied_stream_plan = []
    step_to_actions = {}
    for result in (post_stream_plan + list(function_plan)):
        if (result.opt_index != 0) or (stream_to_minIdx.get(result, 0) < replan_step):
            """
            If the (optimistic) result is not unique, or its step index < replan_step,,
            then count it as an item of the stream plan.
            """
            applied_stream_plan.append(result)
        else:
            """
            If the result is unique, and its step index >= replan_step, 
            then generate an action out of it. (Currently not used.)
            """
            step_to_actions.setdefault(stream_to_minIdx[result], []).append(result.get_action())
            assert len(step_to_actions) == 0

    # The stream plan with its streamResults grouped into static(s) and fluent(f)
    sf_stream_plan = convert_fluent_streams(applied_stream_plan, list_step_inits,
                                            fluent_action_plan, dict_fact_steps, dict_fact_node)
    # sf_stream_plan =applied_stream_plan

    """Generate an action plan, based on the fluent propositional action plan."""
    for index, fluent_action in enumerate(fluent_action_plan):
        paction = propoAction2pddl(fluent_action)
        paction_with_obj = transform_action_args(paction, pddl2obj)
        step_to_actions.setdefault(index, []).append(paction_with_obj)

    action_plan = list(flatten(step_to_actions[idx]
                               for idx in sorted(step_to_actions)))

    return sf_stream_plan, action_plan


##################################################


def solve_optimistic_sequential(instantiated_task, debug=False, max_cost=INF, **search_kwargs):
    action_from_name = rename_instantiated_actions(instantiated_task)
    with Verbose(debug):
        sas_task = sas_from_instantiated(instantiated_task)
        sas_task.metric = True

    # TODO: apply renaming to hierarchy as well
    # solve_from_task | serialized_solve_from_task | abstrips_solve_from_task | abstrips_solve_from_task_sequential
    renamed_plan, _ = solve_from_task(sas_task, debug=False,
                                      max_cost=max_cost, **search_kwargs)
    if renamed_plan is None:
        return None
    action_instances = [action_from_name[name]
                        for name, _, _ in renamed_plan]
    return action_instances


def is_refined(stream_plan):
    """
    This means that the results in stream_plan are refined,
    i.e., their input_objects are remapped to specifically adapt a existing plan.
    """
    # TODO: lazily expand the shared objects in some cases to prevent increase in size
    if not is_plan(stream_plan):
        return True
    # TODO: some of these opt_index equal None
    return all((result.opt_index is None) or (result.opt_index == 0)
               for result in stream_plan)


##################################################

def prune_high_effort_streams(streams, max_effort=INF, **effort_args):
    # TODO: convert streams to test streams with extremely high effort
    low_effort_streams = []
    for stream in streams:
        effort = stream.get_effort(**effort_args)
        if isinstance(stream, Function) or check_effort(effort, max_effort):
            low_effort_streams.append(stream)
    return low_effort_streams


def apply_streams(evaluations, streams, level_limit, **effort_args):
    pruned_streams = prune_high_effort_streams(streams, **effort_args)
    instantiator = Instantiator(pruned_streams)
    for evaluation, node in evaluations.items():
        if node.complexity <= level_limit:
            instantiator.add_atom(evaluation, node.complexity)
    optms_results = []

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
            if isinstance(result, FunctionResult) or new_facts:
                # assert not isinstance(result, FunctionResult)
                optms_results.append(result)

        # TODO: instantiate and solve to avoid repeated work
    """Indicates nothing left in the queue. 
       So higher level_limit will not enrich the optms results.
       Implies that the input evaluations are probably insufficient."""
    exhausted = not instantiator

    return optms_results, exhausted


##################################################


def is_plan(plan):
    """Return True
       if the plan is neither FAILED nor INFEASIBLE"""
    return plan not in [None, False]


def is_plan_certified(stream_plan):
    if stream_plan is None:
        return None

    # if all results in the stream plan is verified (optms_index=None or 0), then the plan is certified
    r = all((result.opt_index is None) or (result.opt_index == 0)
            for result in stream_plan)
    return r


def optimistic_stream_instantiation(instance, obj_mappings, evaluations, optms_evaluations, only_immediate=False):
    """
    Generating new instances by updating the input objects according to the sequence of stream_plan.
    For the new instance, reduce their optms_index and thereby make them more unique.
    They will be saved into their parent streams, and available for next Stream.get_instance()
    """
    new_instances = []
    for input_combo in product(*[obj_mappings.get(i, [i]) for i in instance.input_objects]):
        mapping = get_mapping(instance.input_objects, input_combo)
        domain_evaluations = set(map(evaluation_from_fact, substitute_expression(instance.get_domain(), mapping)))
        if domain_evaluations <= optms_evaluations:
            new_instance = instance.external.get_instance(input_combo)
            if (new_instance.opt_index != 0) and implies(only_immediate, domain_evaluations <= evaluations):
                # always -1
                new_instance.opt_index -= 1
            new_instances.append(new_instance)
    return new_instances


def optimistic_stream_evaluation(evaluations, stream_plan):
    """
    Generate new unique stream_results according to the new stream_instances from the given stream_plan.
    Those results are all related to the stream_plan.
    """
    evaluations = set(evaluations)  # For subset testing
    optms_evaluations = set(evaluations)
    related_results = []
    obj_mappings = {}  # the mapping from original outputs (optimistic) to stream-generated outputs
    active_streams = [s for s in stream_plan if not s.redundant]
    redundant_streams = [s for s in stream_plan if s.redundant]
    for result in active_streams:  # TODO: just refine the first step of the plan
        # unique instance
        new_instances = optimistic_stream_instantiation(result.instance, obj_mappings,
                                                        evaluations, optms_evaluations)
        for new_instance in new_instances:
            for new_result in new_instance.next_optimistic():
                optms_evaluations.update(map(evaluation_from_fact, new_result.get_certified()))
                new_result.level = result.level
                related_results.append(new_result)
                if isinstance(new_result, StreamResult):  # Could not add if same value
                    for old_obj, new_obj in safe_zip(result.output_objects, new_result.output_objects):
                        obj_mappings.setdefault(old_obj, []).append(new_obj)
    related_results.extend(redundant_streams)
    return related_results, obj_mappings


def compute_function_results(evaluations, related_results, externals, complexity_limit, **effort_args):
    # functions = list(filter(lambda s: type(s) is Function, externals))
    functions = [e for e in externals if type(e) is Function]
    extended_evaluations = expand_evals_by_results(evaluations, related_results)
    """Only functions are applied."""
    new_results, _ = apply_streams(extended_evaluations, functions, complexity_limit, **effort_args)
    return related_results + new_results


def compute_plan_constraints(action_plan, obj_mappings):
    """
    Generate an action plan with updated argument objects.
    And further generate a plan constraint.
    """
    new_plan = []
    groups = {old: news for old, news
              in obj_mappings.items() if len(news) != 1}
    for name, arg_tuple, _ in action_plan:
        new_arg_tuple = []
        for arg in arg_tuple:
            if isinstance(arg, Object):
                """For real object, arg remains."""
                new_arg_tuple.append(arg)
            elif isinstance(arg, OptimisticObject):
                assert obj_mappings.get(arg, [])
                if len(obj_mappings[arg]) == 1:
                    """For optm object with single mapping, arg updates."""
                    new_arg_tuple.append(obj_mappings[arg][0])
                else:
                    """For optm object with multiple mappings, arg remains/is marked as WILD."""
                    new_arg_tuple.append(WILD)
                    # new_arg_tuple.append(arg)
            else:
                raise ValueError(arg)
        new_plan.append((name, new_arg_tuple))
    # exact=False because we might need new actions
    return PlanConstraints(plans=[new_plan], groups=groups, exact=False, max_cost=INF)


def solve_and_refine(evaluations, externals, optms_results, optms_plan_solver, level_limit,
                     depth, constraints, **effort_args):
    """
    Plan refinement iteration
    """

    if MAX_DEPTH <= depth:
        return None, None, INF, depth

    stream_plan, action_plan, estimated_cost = optms_plan_solver(evaluations, optms_results,
                                                                 constraints)
    if estimated_cost == 0.514:
        return stream_plan, action_plan, estimated_cost, depth

    if not is_plan(action_plan):
        """Case1: None or False."""
        return stream_plan, action_plan, estimated_cost, depth

    if is_refined(stream_plan):
        """Case2: Already refined."""
        return stream_plan, action_plan, estimated_cost, depth

    related_results, obj_mappings = optimistic_stream_evaluation(evaluations, stream_plan)

    # next_results = compute_function_results(evaluations, related_results, externals, level_limit, **effort_args)

    next_constraints = compute_plan_constraints(action_plan, obj_mappings)

    """Re-run the plan solver with streams having refined stream instances."""
    return solve_and_refine(evaluations, externals, related_results, optms_plan_solver, level_limit,
                            depth + 1, next_constraints, **effort_args)


def plan_action_plan_stream(optms_plan_solver, evaluations, externals, level_limit, **effort_args):
    # externals = (streams + functions + optimizers)
    # Previously didn't have unique optimistic objects that could be constructed at arbitrary depths
    # evals = {e: n for e, n in evaluations.items() if n.complexity <= level_limit}
    evals = {e: n for e, n in evaluations.items()}
    assert len(evals) == len(evaluations)

    num_iterations = 0
    while True:
        num_iterations += 1

        optms_results, exhausted = apply_streams(evals, externals, level_limit, **effort_args)

        stream_plan, action_plan, cost, final_depth = solve_and_refine(evals, externals, optms_results.copy(),
                                                                       optms_plan_solver, level_limit,
                                                                       depth=0, constraints=None,
                                                                       **effort_args)
        print('  Attempt: {} | Results: {} | Depth: {} | Success: {}'.format(
            num_iterations, len(optms_results), final_depth, is_plan(action_plan)))

        if cost == 0.514:
            return stream_plan, action_plan, cost, exhausted

        if is_plan(action_plan):
            """
            Case2:
            """
            return stream_plan, action_plan, cost, exhausted
        """
        A: (final_depth==0 and not is_plan) concludes that at this level the solver cannot find any plausible plans.
           depth is the number of the refinement iteration.
        """
        if final_depth == 0:
            status = INFEASIBLE_EVAL if exhausted else FAILED_LEVEL
            """
            Case1:
            1) if exhausted, the search is failed due to the insufficiency of initial evaluations. -> INFEASIBLE
            2) if not, the search is failed due to the level limitation. -> FAILED
            """
            return status, status, cost, exhausted
        """
         B: Retry at current level
         """


class OptimisticPlanSolver(object):

    def __init__(self, goal_exp, domain, negative, search_kwargs, original_evaluation,
                 replan_actions=set(), max_effort=INF, effort_weight=None, dict_optms_cost={},
                 max_cost=INF):
        self.goal_exp = goal_exp
        self.domain = domain
        self.negative = negative  # negative predicates from the problem
        self.effort_weight = effort_weight
        self.max_effort = max_effort
        self.search_kwargs = search_kwargs
        self.replan_actions = replan_actions
        self.dict_optms_cost = dict_optms_cost
        self.original_evaluation = original_evaluation
        self.max_cost = max_cost

    def _planner_core(self, evaluations, optms_results, domain, goal_exp, max_cost):
        """
        Generate an action_plan with its stream_plan
        based on initial evaluations and all optimistic facts.
        """
        r_problem = get_problem(evaluations, goal_exp, domain)  # begin_metric
        original_init = r_problem.init
        original_goal = r_problem.goal

        dict_fact_node = get_achieving_streams(evaluations, optms_results,
                                               max_effort=self.max_effort)

        optms_evaluations = {evaluation_from_fact(f): n.result for f, n in dict_fact_node.items()}

        problem = get_problem(optms_evaluations, goal_exp, domain)  # begin_metric

        optms_init = problem.init

        if len(problem.init) > 300:
            sk_batch = SkeletonBatch('domain_p.pddl', original_init, original_goal, optms_results, optms_init)
            op_plan, results_for_step = sk_batch.get_next_operatorPlan()
            if op_plan:
                print('++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++')
                return op_plan, results_for_step, 0.514

        pddl_task = task_from_domain_problem(domain, problem)

        # Mapping from string in pddl to Object/OptimiticObject
        pddl_to_obj = {obj.pddl: obj
                       for obj in objects_from_evaluations(optms_evaluations)}

        instantiated_task = gen_inst_task(pddl_task, pddl_to_obj)

        if instantiated_task is None:
            return None, None, INF

        # Estimated cost for actions.
        add_stream_effort_to_action(dict_fact_node, instantiated_task, self.effort_weight)
        action_to_EstmCost = {action: action.cost
                              for action in instantiated_task.fluent_actions}

        fluent_action_plan = solve_optimistic_sequential(instantiated_task,
                                                         max_cost=max_cost, **self.search_kwargs)

        # _plan = solve_optimistic_symk('found_plans/sas_plan.1')
        #
        # prop_action_plan = inst_task(_plan, pddl_task, pddl_to_obj)

        if fluent_action_plan is not None:
            print('')

        estimated_cost = get_plan_cost(fluent_action_plan, action_to_EstmCost)

        if fluent_action_plan is None:
            return None, None, estimated_cost

        list_fluent_axiom_plan = recover_axioms_plans(instantiated_task, fluent_action_plan)

        pddl_plan = transform_plan_args(map(propoAction2pddl, fluent_action_plan), pddl2obj)
        replan_step = min([step + 1 for step, action in enumerate(pddl_plan)
                           if action.name in self.replan_actions] or [len(pddl_plan)])

        stream_plan, action_plan = retrace_stream_plan(self.original_evaluation, evaluations, optms_evaluations,
                                                       goal_exp, domain, dict_fact_node, fluent_action_plan,
                                                       list_fluent_axiom_plan, self.negative, replan_step)

        return stream_plan, action_plan, estimated_cost

    def __call__(self, evaluations, optms_results, constraints):

        result = self._planner_core(evaluations, optms_results, self.domain, self.goal_exp, self.max_cost)

        return result
