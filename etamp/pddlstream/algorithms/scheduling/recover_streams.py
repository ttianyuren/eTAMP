from collections import namedtuple, defaultdict
from heapq import heappop, heappush

from ...language.conversion import is_negated_eval, fact_from_head, evaluation_from_fact
from ...language.statistics import check_effort
from ...utils import HeapElement, INF
from ...algorithms.common import EvaluationNode

Node = namedtuple('Node', ['effort', 'result'])  # TODO: include level
EFFORT_OP = sum  # max | sum
NULL_COND = (None,)


def get_achieving_streams(evaluations, optms_results, max_effort=INF, **effort_args):
    """
    get U{atom: ResultNode}
    """
    condFact_to_results = defaultdict(list)
    dict_fact_node = {NULL_COND: EvaluationNode(0, None)}  # All facts can be achieved.
    stream_to_conditions = {}
    stream_to_remaining = {}
    for result in optms_results:
        stream_to_conditions[result] = result.instance.get_domain() + (NULL_COND,)
        stream_to_remaining[result] = len(stream_to_conditions[result])
        for fact in stream_to_conditions[result]:
            condFact_to_results[fact].append(result)

    for e, node in evaluations.items():
        if not is_negated_eval(e):
            init_fact = fact_from_head(e)
            # assert init_fact[0].find('ax') == -1
            dict_fact_node[init_fact] = node

    queue = [HeapElement(key=node[0], value=fact)
             for fact, node in dict_fact_node.items()]
    while queue:
        fact = heappop(queue).value
        if fact not in condFact_to_results:
            continue
        for result in condFact_to_results[fact]:
            stream_to_remaining[result] -= 1
            """A: this result still has unresolved conditional facts"""
            if stream_to_remaining[result]:
                continue
            """B: this result has all conditional facts fulfilled, use it and get more certified facts"""
            effort = result.get_effort(**effort_args)
            this_effort = effort + EFFORT_OP(dict_fact_node[cond][0]
                                             for cond in stream_to_conditions[result])
            if max_effort <= this_effort:
                continue
            for effFact in result.get_certified():
                if (effFact not in dict_fact_node) or (this_effort < dict_fact_node[effFact].complexity):
                    dict_fact_node[effFact] = EvaluationNode(this_effort, result)
                    heappush(queue, HeapElement(this_effort, effFact))
        del condFact_to_results[fact]
    del dict_fact_node[NULL_COND]
    return dict_fact_node


def evaluations_from_stream_plan(evaluations, stream_results, max_effort=INF):
    opt_evaluations = set(evaluations)
    for result in stream_results:
        assert (not result.instance.disabled)
        assert (not result.instance.enumerated)
        domain = set(map(evaluation_from_fact, result.instance.get_domain()))
        assert (domain <= opt_evaluations)
        opt_evaluations.update(map(evaluation_from_fact, result.get_certified()))
    node_from_atom = get_achieving_streams(evaluations, stream_results)
    result_from_evaluation = {evaluation_from_fact(f): n.result for f, n in node_from_atom.items()
                              if check_effort(n.effort, max_effort)}
    return result_from_evaluation


def expand_evals_by_results(evaluations, stream_results, max_effort=INF):
    # accm_evaluations = set(evaluations)
    # for result in stream_results:
    #     assert (not result.instance.disabled)
    #     assert (not result.instance.enumerated)
    #     domain = set(map(evaluation_from_fact, result.instance.get_domain()))
    #     assert (domain <= accm_evaluations)
    #     accm_evaluations.update(map(evaluation_from_fact, result.get_certified()))
    atom_to_node = get_achieving_streams(evaluations, stream_results)
    new_evaluations = {}
    for f, n in atom_to_node.items():
        level = 0
        if n.result is not None and n.result is not False:
            level = n.result.level
        if level is None:
            level = 0
        new_evaluations[evaluation_from_fact(f)] = EvaluationNode(level, n.result)

    return new_evaluations


def extract_stream_plan(node_from_atom, target_facts, stream_plan,
                        fact_to_minIdx=None, stream_to_minIdx=None):
    """
    Generate a stream plan based on node_from_atom to achieve target facts: stream_plan
    Meanwhile generate a mapping from a stream to its minimum step index: streamResult_to_minIdx

    :param stream_plan: Output of the function
    :param stream_to_minIdx: Output of the function
    """
    for fact in target_facts:
        if fact not in node_from_atom:
            raise RuntimeError('Preimage fact {} is not achievable!'.format(fact))
        result = node_from_atom[fact].result
        if result is None or result is False:
            continue
        if fact_to_minIdx is not None:
            assert stream_to_minIdx is not None
            step = fact_to_minIdx[fact]  # if result.external.info.defer else 0
            """Assign minimum index to the <stream result>.
               Advance the result to where it is firstly demanded by the target fact in steps."""
            stream_to_minIdx[result] = min(step, stream_to_minIdx.get(result, INF))
            result.step_idx = stream_to_minIdx[result]
            for domain_fact in result.instance.get_domain():
                """Assign minimum index to the <domain fact>.
                   Defer the facts to where they are demanded by the stream in steps."""
                fact_to_minIdx[domain_fact] = min(stream_to_minIdx[result], stream_to_minIdx.get(result, INF))
        extract_stream_plan(node_from_atom, result.instance.get_domain(), stream_plan,
                            fact_to_minIdx, stream_to_minIdx)
        # TODO: dynamic programming version of this
        if result not in stream_plan:
            stream_plan.append(result)  # TODO: don't add if satisfied
