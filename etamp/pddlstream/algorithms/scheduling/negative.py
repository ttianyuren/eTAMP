from pddlstream.algorithms.downward import fact_from_fd, plan_preimage, apply_action, \
    GOAL_NAME, get_derived_predicates, literal_holds, get_preimage_literals_with_idxes
from pddlstream.algorithms.scheduling.recover_axioms import extract_axiom_plan
from pddlstream.algorithms.scheduling.reinstantiate import reinstantiate_action_instances, reinstantiate_axiom_instances
from pddlstream.language.conversion import pddl2obj
from pddlstream.language.function import Predicate, PredicateResult
from pddlstream.language.stream import Stream
from pddlstream.utils import safe_zip


def convert_negative_predicate(negative, literal, negative_plan):
    input_objects = tuple(map(pddl2obj, literal.args))  # Might be negative
    predicate_instance = negative.get_instance(input_objects)
    value = not literal.negated
    if predicate_instance.enumerated:
        assert (predicate_instance.value == value)
    else:
        negative_plan.add(PredicateResult(predicate_instance, value,
                                          opt_index=predicate_instance.opt_index))


def get_negative_result(negative, input_objects, fluent_facts=frozenset()):
    instance = negative.get_instance(input_objects, fluent_facts=fluent_facts)
    optimistic = not instance.successes  # TODO: clean this up
    return instance._Result(instance, output_objects=tuple(), opt_index=instance.opt_index,
                            call_index=instance.num_calls, optimistic=optimistic)


def convert_negative_stream(negative, literal, step_from_atom, real_states, negative_plan):
    import pddl
    # assert not negative.is_fluent()
    fluent_facts_list = []
    if negative.is_fluent():
        # TODO: ensure that only used once?
        for step in step_from_atom[literal]:
            fluent_facts_list.append(list(map(fact_from_fd, filter(
                lambda f: isinstance(f, pddl.Atom) and (f.predicate in negative.fluents), real_states[step]))))
    else:
        fluent_facts_list.append(frozenset())

    input_objects = tuple(map(pddl2obj, literal.args))  # Might be negative
    for fluent_facts in fluent_facts_list:
        result = get_negative_result(negative, input_objects, fluent_facts)
        # if not result.instance.successes: # Doesn't work with reachieve=True
        negative_plan.add(result)


def convert_negative(negative_preimage, negative_from_name, step_from_atom, real_states):
    negative_plan = set()
    for literal in negative_preimage:
        negative = negative_from_name[literal.predicate]
        if isinstance(negative, Predicate):
            convert_negative_predicate(negative, literal, negative_plan)
        elif isinstance(negative, Stream):
            convert_negative_stream(negative, literal, step_from_atom, real_states, negative_plan)
        else:
            raise ValueError(negative)
    return negative_plan


##################################################
def recover_preimage_plan(real_task, optms_task,
                          list_fluent_axiom_plan, fluent_action_plan, negname_to_pred):
    """
    1) Generate a preimage_plan, according to the fluent action_plan and fluent axiom_plan.
    2) Generate a list of <initial facts>,
       recording a gradual change of available <initial facts> for each step, due to the execution of actions.
    """
    # A full action_plan.
    action_plan = reinstantiate_action_instances(optms_task, fluent_action_plan,
                                                 negname_to_pred=negname_to_pred)
    # A list of full axiom_plan.
    list_axiom_plan = [reinstantiate_axiom_instances(axiom_plan)
                       for axiom_plan in list_fluent_axiom_plan]

    optms_task.init = set(optms_task.init)
    list_step_inits = [set(real_task.init)]
    """
    preimage_plan = [ axiom-0-0, axiom-0-1,..., axiom-0-k, action-0,     ->  stepaa-0 
                      axiom-1-0, axiom-1-1,..., axiom-1-k, action-1,     ->  stepaa-1
                      ...,                                                                       
                      axiom-x-0, axiom-x-1,..., axiom-x-k, action-x ]    ->  stepaa-x
    """
    preimage_plan = []

    for axiom_plan, propo_action in safe_zip(list_axiom_plan, action_plan):
        # stepaa for each step of the plan
        stepaa = axiom_plan + [propo_action]

        # Preimage literals of current step
        preimage_literals = get_preimage_literals_with_idxes(stepaa)

        """The preimage literals should be contained in the optimistic initial facts."""
        # assert all(literal_holds(optms_task.init, literal)
        #            for literal in preimage_literals)

        preimage_plan.extend(stepaa)

        if propo_action.name != GOAL_NAME:
            # Expand the optimistic initial facts
            apply_action(optms_task.init, propo_action)

            # Expand the real initial facts, and append it to list_real_init
            list_step_inits.append(set(list_step_inits[-1]))
            apply_action(list_step_inits[-1], propo_action)

    return list_step_inits, preimage_plan
