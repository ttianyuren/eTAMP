from collections import defaultdict

from pddlstream.language.constants import is_parameter, Head
from pddlstream.language.conversion import pddl2obj


def extract_function_results(eval_to_results, action, pddl_args):
    """
    Get the instantiation of CostEffect from action.cost,
    then find function results fulfilling this cost instantiation.
    """
    import pddl
    if action.cost is None:
        return None
    expression = action.cost.expression
    if not isinstance(expression, pddl.PrimitiveNumericExpression):
        return None
    var_mapping = {p.name: a for p, a in zip(action.parameters, pddl_args)}
    obj_args = tuple(pddl2obj(var_mapping[p] if is_parameter(p) else p)
                     for p in expression.args)
    head = Head(expression.symbol, obj_args)
    [(_, result)] = eval_to_results[head]
    if result is None:
        return None
    return result


def compute_function_plan(optms_evaluations, action_plan):
    eval_to_results = defaultdict(list)
    for evaluation, stream_result in optms_evaluations.items():
        eval_to_results[evaluation.head].append((evaluation.value, stream_result))
    function_plan = set()
    for fluent_action in action_plan:
        action = fluent_action.action
        if action is None:
            continue
        args = [fluent_action.var_mapping[para.name]
                for para in action.parameters]
        function_result = extract_function_results(eval_to_results, action, args)
        if function_result is not None:
            function_plan.add(function_result)
    return function_plan