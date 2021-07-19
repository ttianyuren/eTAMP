import copy

from pddlstream.algorithms.downward import fact_from_fd
from pddlstream.algorithms.reorder import get_partial_orders
from pddlstream.language.conversion import pddl_from_object
from pddlstream.language.object import OptimisticObject, UniqueOptmsValue
from pddlstream.utils import neighbors_from_edges, get_mapping
from pddlstream.language.function import FunctionResult


def get_steps_from_stream(stream_plan, fact_to_step, fact_to_node):
    stream_to_steps = {}
    for result in reversed(stream_plan):
        stream_to_steps[result] = set()
        for fact in result.get_certified():
            if (fact in fact_to_step) and (fact_to_node[fact].result == result):
                stream_to_steps[result].update(fact_to_step[fact])
        for fact in result.instance.get_domain():
            fact_to_step[fact] = fact_to_step.get(fact, set()) | stream_to_steps[result]
            # TODO: apply this recursively
    return stream_to_steps


def convert_fluent_streams(stream_plan, real_states, action_plan, step_from_fact, node_from_atom):
    import pddl
    assert len(real_states) == len(action_plan) + 1
    stream_to_steps = get_steps_from_stream(stream_plan, step_from_fact, node_from_atom)

    # TODO: ensure that derived facts aren't in fluents?
    # TODO: handle case where costs depend on the outputs
    _, outgoing_edges = neighbors_from_edges(get_partial_orders(stream_plan, init_facts=map(
        fact_from_fd, filter(lambda f: isinstance(f, pddl.Atom), real_states[0]))))
    static_plan = []
    fluent_plan = []
    for result in stream_plan:
        external = result.external
        if isinstance(result, FunctionResult) or (result.opt_index != 0) or (not external.is_fluent()):
            static_plan.append(result)
            continue
        if outgoing_edges[result]:
            # No way of taking into account the binding of fluent inputs when preventing cycles
            raise NotImplementedError('Fluent stream is required for another stream: {}'.format(result))
        # if (len(steps_from_stream[result]) != 1) and result.output_objects:
        #    raise NotImplementedError('Fluent stream required in multiple states: {}'.format(result))
        for state_index in stream_to_steps[result]:
            new_output_objects = [OptimisticObject.from_optms(out.value,
                                                              UniqueOptmsValue(result.instance, object(), i))
                                  for i, out in enumerate(result.output_objects)]
            if new_output_objects and (state_index < len(action_plan)):
                # TODO: check that the objects aren't used in any effects
                propo_action = copy.copy(action_plan[state_index])
                action_plan[state_index] = propo_action
                output_mapping = get_mapping(list(map(pddl_from_object, result.output_objects)),
                                             list(map(pddl_from_object, new_output_objects)))
                propo_action.var_mapping = {p: output_mapping.get(v, v)
                                            for p, v in propo_action.var_mapping.items()}
            fluent_facts = list(map(fact_from_fd, filter(
                lambda f: isinstance(f, pddl.Atom) and (f.predicate in external.fluents), real_states[state_index])))
            new_instance = external.get_instance(result.instance.input_objects, fluent_facts=fluent_facts)
            # TODO: handle optimistic here
            new_result = new_instance.get_result(new_output_objects, opt_index=result.opt_index)
            new_result.level = result.level
            fluent_plan.append(new_result)
    return static_plan + fluent_plan
