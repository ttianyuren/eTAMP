from __future__ import print_function

from copy import deepcopy, copy
from instantiate import gen_inst_task
from pddlstream.algorithms.downward import get_problem, task_from_domain_problem, get_cost_scale, \
    scale_cost, fd_from_fact, make_domain, make_predicate, evaluation_from_fd, plan_preimage, fact_from_fd, \
    get_preimage_literals_with_idxes
from pddlstream.algorithms.instantiate_task import instantiate_task, sas_from_instantiated
from pddlstream.algorithms.scheduling.apply_fluents import convert_fluent_streams
from pddlstream.algorithms.scheduling.negative import convert_negative, recover_preimage_plan
from pddlstream.algorithms.scheduling.postprocess import postprocess_stream_plan
from pddlstream.algorithms.scheduling.recover_axioms import recover_axioms_plans
from pddlstream.algorithms.scheduling.recover_functions import compute_function_plan
from pddlstream.algorithms.scheduling.recover_streams import get_achieving_streams, extract_stream_plan
from etamp.pddlstream.algorithms.scheduling.utils import get_instance_facts
from pddlstream.algorithms.search import solve_from_task
from pddlstream.language.constants import Not, get_prefix, EQ, pAction, pA_info, pAtom
from pddlstream.language.conversion import evaluation_from_fact, \
    transform_plan_args, transform_action_args, pddl2obj
from pddlstream.language.conversion import objects_from_evaluations
from pddlstream.language.stream import StreamResult
from pddlstream.language.optimizer import UNSATISFIABLE
from pddlstream.language.statistics import compute_stream_plan_effort
from pddlstream.utils import Verbose, INF, flatten
from pddlstream.algorithms.constraints import add_plan_constraints


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

        # All achievable facts with their stream-results.
        dict_fact_node = get_achieving_streams(evaluations, optms_results,
                                               max_effort=self.max_effort)

        optms_evaluations = {evaluation_from_fact(f): n.result
                             for f, n in dict_fact_node.items()}

        problem = get_problem(optms_evaluations, goal_exp, domain)  # begin_metric

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

        # if fluent_action_plan is not None:
        #     assert all([a.name.find("stack") == -1 for a in fluent_action_plan])

        err_evaluations = evaluations.items() - self.original_evaluation.items()

        # added_atom_to_node = {}
        # original_atoms = set(fd_from_evaluation(e) for e in self.original_evaluation)
        # original_args = set()
        # for atom in original_atoms:
        #     for arg in atom.args:
        #         original_args.add(arg)
        # for faction in fluent_action_plan:
        #     for atom in faction.precondition:
        #         # if atom not in original_atoms:
        #         #     eval = evaluation_from_fact(fact_from_fd(atom))
        #         #     added_atom_to_node[atom] = optms_evaluations[eval]
        #         print(atom, atom in original_atoms)
        #         # for arg in atom.args:
        #         #     print(arg, arg in original_args)

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

        if constraints is None:
            result = self._planner_core(evaluations, optms_results, self.domain, self.goal_exp, self.max_cost)
            return result
        else:
            new_evaluations = copy(evaluations)  # Initialize the container.
            new_domain = deepcopy(self.domain)  # Initialize the container.
            new_goal_exp = add_plan_constraints(constraints, new_domain, new_evaluations,
                                                self.goal_exp, internal=True)
            new_max_cost = self.max_cost if constraints is None else min(self.max_cost, constraints.max_cost)
            result = self._planner_core(new_evaluations, optms_results, new_domain, new_goal_exp, new_max_cost)
            return result
