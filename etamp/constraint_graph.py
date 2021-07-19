from .pddlstream.language.object import Object, OptimisticObject, EXE_Object, EXE_OptimisticObject, get_hash
import matplotlib.pyplot as plt
import networkx as nx
from collections import defaultdict
from networkx.algorithms.graph_hashing import weisfeiler_lehman_graph_hash as ghash
from .topk_skeleton import EXE_Action, EXE_Stream, remap_action_args
from networkx.algorithms import isomorphism
from networkx.drawing.nx_pydot import graphviz_layout
from copy import copy, deepcopy
import numpy as np


def update_constraint_dict(new_c):
    # Constraint.ctype_to_constraints[new_c.ctype].append(new_c)

    existing_constraints = Constraint.ctype_to_constraints[new_c.ctype]
    if existing_constraints:
        """ctype exists"""
        replace_flag = False
        same_decision = False
        for c in existing_constraints:
            if new_c.decisions == c.decisions:
                same_decision = True
                if new_c.yg <= c.yg:
                    replace_flag = True
                else:
                    replace_flag = False

        if replace_flag or (not same_decision):
            Constraint.ctype_to_constraints[new_c.ctype].append(new_c)
    else:
        """register new ctype"""
        assert new_c.yg >= 0
        Constraint.ctype_to_constraints[new_c.ctype].append(new_c)
        # new_c.show()


def reset_constraint_dict():
    Constraint.ctype_to_constraints = defaultdict(list)


def get_op_to_decision(env, node):
    op_to_decision = {}
    cur_node = node
    while True:
        if cur_node.is_root:
            break
        if cur_node.parent.is_decision_node:
            _, ops = env.get_steps_ops(cur_node.parent.depth)
            assert isinstance(cur_node.decision, tuple)
            if cur_node.parent.pddl == '(sample-grasp-dir, )':
                """grasp_dir should be described in the object frame (of)"""
                direction_o = list(cur_node.add_mapping.values())[0].value.direction_o
                op_to_decision[ops[0]] = (direction_o,)
            else:
                op_to_decision[ops[0]] = copy(cur_node.decision)
        if cur_node.is_root:
            break
        else:
            cur_node = cur_node.parent

    return op_to_decision


def rename_stream(env, op_to_decision):
    new_op_to_decision = {}
    for v, value in op_to_decision.items():
        assert isinstance(v, EXE_Stream)
        arg_mapping = {}
        for p in v.inputs:
            if isinstance(p, EXE_Object):
                if isinstance(p.value, int):
                    arg_mapping[p] = EXE_Object(p.pddl, env.bd_body[p.value])
        if arg_mapping:
            new_op = EXE_Stream(v.name, tuple([arg_mapping.get(a, a) for a in v.inputs]), v.outputs)
        else:
            new_op = v
        new_op_to_decision[new_op] = value

    return new_op_to_decision


class Constraint(object):
    """
    A constraint based on directional graph
    """
    ctype_to_constraints = defaultdict(list)

    def __init__(self, raw_digraph, node, env, yg, bi):

        # self.digraph = nx.DiGraph()
        # self.digraph.add_nodes_from(digraph.nodes)
        # self.digraph.add_edges_from(digraph.edges)
        assert isinstance(raw_digraph, nx.DiGraph)
        self.skeleton_id = env.skeleton_id
        self.digraph = raw_digraph.copy()
        self.yg = yg
        self.bi = bi

        op_to_decision = get_op_to_decision(env, node)
        """Find the victim(stream)"""
        self.victim = (None, None)  # (step, op)
        for v in self.digraph:
            successors = list(self.digraph.successors(v))
            if not successors:
                self.victim = (self.digraph.nodes[v]['step'], v)
                break
        """Find culprits, and append their decision vertices"""
        self.culprits = {}  # a victim can itself be a culprit.
        self.decision_vertices = []
        vertices = list(self.digraph)
        for v in vertices:
            if isinstance(v, EXE_Stream):
                op_info = env.get_op_info(v)
                if op_info.free_generator:
                    decision = op_to_decision[v]
                    self.decision_vertices.append(decision)
                    self.culprits[v] = (self.digraph.nodes[v]['step'], decision)
                    self.digraph.add_edge(decision, v, weight=10)
        """Rename the vertices"""
        vertices = list(self.digraph)
        for v in vertices:
            if isinstance(v, EXE_Stream):
                arg_mapping = {}
                for p in v.inputs:
                    if isinstance(p, EXE_Object):
                        if isinstance(p.value, int):
                            arg_mapping[p] = EXE_Object(p.pddl, env.bd_body[p.value])
                if arg_mapping:
                    new_stream = EXE_Stream(v.name, tuple([arg_mapping.get(a, a) for a in v.inputs]), v.outputs)
                    mapping = {v: new_stream}
                    self.digraph = nx.relabel_nodes(self.digraph, mapping)
                    if v == self.victim[1]:
                        self.victim = (self.victim[0], new_stream)
                    if v in self.culprits:
                        self.culprits[new_stream] = self.culprits[v]
                        del self.culprits[v]
            if isinstance(v, EXE_Object):
                if isinstance(v.value, int):
                    mapping = {v: EXE_Object(v.pddl, env.bd_body[v.value])}
                    self.digraph = nx.relabel_nodes(self.digraph, mapping)
        """Extract decisions and conditions related to the current constraint"""
        self.dict_decision = {}  # decision_id to op
        self.dict_condition = {}  # condition_id to op
        id0_to_culprits = defaultdict(list)
        vertices = list(self.digraph)
        for v in vertices:
            if v in self.culprits:
                decision = [p for p in list(self.digraph.predecessors(v)) if isinstance(p, tuple)]
                assert len(decision) == 1, f'Cannot find the decision of culprit {v}'
                decision = decision[0]
                shortest_path = nx.shortest_path(self.digraph, source=v, target=self.victim[1])
                names_body = []
                for si in v.inputs:
                    if isinstance(si, EXE_Object):
                        if isinstance(si.value, str):
                            names_body.append(si.value)  # body_name
                names_body.sort()
                id0 = v.name + '_' + str(len(shortest_path) - 1) + '_' + '-'.join(names_body)
                id0_to_culprits[id0].append(v)
                decision_id = id0 + f'_{len(id0_to_culprits[id0])}'
                self.dict_decision[decision_id] = decision
                self.culprits[v] = (*self.culprits[v], decision_id)
            if isinstance(v, EXE_Object):
                if isinstance(v.value, str):
                    context = [p for p in list(self.digraph.predecessors(v)) if isinstance(p, tuple)]
                    if len(context) == 1:
                        context = context[0]
                        shortest_path = nx.shortest_path(self.digraph, source=v, target=self.victim[1])
                        self.dict_condition[v.value + '_' + str(len(shortest_path) - 1)] = context

        description = str(self.victim[1].name)
        for p in self.victim[1].inputs:
            if isinstance(p, EXE_Object):
                if isinstance(p.value, str):
                    description += p.value  # body_name
        dlist = list(self.dict_condition)
        dlist.sort()
        self.condition_names = '-'.join(dlist)
        description += '_' + self.condition_names

        dlist = list(self.dict_decision)
        dlist.sort()
        self.decision_names = '-'.join(dlist)
        description += '_' + self.decision_names

        self.description = description
        self.ctype = get_hash(description + ghash(self.digraph))

        update_constraint_dict(self)

        return

    @property
    def decisions(self):
        decisions = list(self.dict_decision.values())
        decisions.sort()
        decisions = tuple(decisions)
        return decisions

    @property
    def nodes(self):
        return list(self.digraph)

    @property
    def edges(self):
        return list(self.digraph.edges)

    def show(self):
        list_color = []
        lable_map = {}

        plt.rcParams["figure.figsize"] = (16, 8)
        plt.clf()

        for v in self.digraph:

            if v == self.victim[1]:
                list_color.append('coral')
                lable_map[v] = str(v)
            elif isinstance(v, EXE_Object) or isinstance(v, EXE_OptimisticObject):
                list_color.append('yellowgreen')
                lable_map[v] = str(v)
            elif isinstance(v, tuple):
                if v in self.decision_vertices:
                    list_color.append('cornflowerblue')
                else:
                    list_color.append('lightblue')
                lable_map[v] = '(' + ','.join([f'{i:.5f}' for i in v]) + ')'
            elif v in self.culprits:
                list_color.append('mediumorchid')
                lable_map[v] = str(v)
            else:
                list_color.append('yellowgreen')  # cornflowerblue
                lable_map[v] = str(v)

        dot_pos = graphviz_layout(self.digraph, prog="twopi")  # twopi sfdp circo
        # dot_pos = nx.spring_layout(self.digraph, scale=2)
        nx.draw(self.digraph, dot_pos, node_color=list_color, with_labels=False)
        nx.draw_networkx_labels(self.digraph, dot_pos, lable_map)
        plt.show()

        # plt.draw()
        # plt.pause(30)

    def __repr__(self):
        return f'{len(self.dict_decision)}_{len(self.dict_condition)}_{self.victim[1].name}{self.victim[1].inputs}_' + (
            f'{self.yg:.3f}' if self.yg > 0 else 'f')

    def get_copy(self):
        return deepcopy(self)


def update_constraint(cur_node, env, digraph, sdg_msg):
    if cur_node.is_terminal:
        """Add a negative point"""
        if sdg_msg is None or digraph is None:
            return
        cur_node.cgraph = Constraint(digraph, cur_node, env, 1., sdg_msg.msg_bi)
        # cur_node.cgraph = Constraint(digraph, cur_node, env, sdg_msg.msg_yg, sdg_msg.msg_bi)
        list_culprit = [t for t in cur_node.cgraph.culprits.values()]
        # if cur_node.cgraph.ctype == 80863776 or cur_node.cgraph.ctype == 69309116:
        #     print()
        for t in list_culprit:
            step_culprit, _, decision_id = t
            depth = env.step_to_depth[step_culprit]
            d_info = env.depth_to_decision_info[depth]
            d_info.add_culprit_role(cur_node.cgraph.ctype, decision_id)
        step_victim = cur_node.cgraph.victim[0]
        env.add_victim_role(step_victim, cur_node.cgraph.ctype, cur_node.cgraph)
    else:
        """Add a positive point to constraints"""
        for step in cur_node.parent.steps:
            for ctype in env.step_to_victim_roles[step]:
                exp_constraint = env.ctype_to_constraint[ctype]
                new_constraint = exp_constraint.get_copy()
                new_constraint.culprits = {}
                new_constraint.decision_vertices = []
                new_constraint.dict_decision = {}
                op_to_decision = rename_stream(env, get_op_to_decision(env, cur_node))
                for stream, t in exp_constraint.culprits.items():
                    decision = op_to_decision[stream]
                    new_constraint.culprits[stream] = (t[0], decision, t[2])
                    new_constraint.decision_vertices.append(decision)
                    new_constraint.dict_decision[t[2]] = decision
                if new_constraint.bi:
                    new_constraint.yg = 0
                else:
                    new_constraint.yg = -1
                update_constraint_dict(new_constraint)


if __name__ == '__main__':

    edges = [(('o_collision',), ('inv',)),
             (('o_target',), ('inv',)),
             (('p_target',), ('inv',)),
             (('g_target',), ('inv',)),
             (('o_collision',), ('o_target',)),
             (('p_collision',), ('o_collision',)),
             (('p_target',), ('o_target',)),
             (('o_target',), ('sample-grasp',)),
             (('p_target',), ('sample-grasp',)),
             (('dir_target',), ('sample-grasp',)),
             (('sample-grasp',), ('g_target',)),
             (('o_target',), ('sample-grasp-dir',)),
             (('p_target',), ('sample-grasp-dir',)),
             (('sample-grasp-dir',), ('dir_target',)),
             ]
    # edges = [(('a',), ('b',)),
    #          (('b',), ('c',)),
    #          (('c',), ('a',)),
    #          ]

    graph1 = nx.DiGraph()
    for edge in edges:
        graph1.add_edge(*edge, weight=10)

    nx.set_node_attributes(graph1, ('o_collision',), 'tag')

    label_map = {}
    for node_id in graph1:
        label = ''
        for i in node_id:
            label += str(i)

        label_map[node_id] = label

    v = ('o_collision',)
    nx.set_node_attributes(graph1, v, 'collision')

    edges = [(('o_drawer',), ('inv',)),
             (('p_red', 0), ('inv',)),
             (('o_red',), ('inv',)),
             (('g_red',), ('inv',)),
             (('o_drawer',), ('o_red',)),
             (('o_drawer',), ('o_red',)),
             (('p_drawer', 0), ('o_drawer',)),
             (('p_red', 0), ('o_red',)),
             (('o_red',), ('sample-grasp',)),
             (('dir_red',), ('sample-grasp',)),
             (('p_red', 0), ('sample-grasp',)),
             (('sample-grasp',), ('g_red',)),
             (('o_red',), ('sample-grasp-dir',)),
             (('p_red', 0), ('sample-grasp-dir',)),
             (('p_red', 0), ('sample-grasp-dir',)),
             (('sample-grasp-dir',), ('dir_red',)),
             ]
    # edges = [(('c1',), ('a1',)),
    #          (('a1',), ('b1',)),
    #          (('b1',), ('c1',)),
    #          ]
    graph2 = nx.DiGraph()
    for edge in edges:
        graph2.add_edge(*edge, weight=1)

    """Hashes are identical for isomorphic graphs and strong guarantees 
    that non-isomorphic graphs will get different hashes. """
    hg1 = ghash(graph1)
    hg2 = ghash(graph2)

    nodes1 = set(graph1.nodes)
    nodes2 = set(graph2.nodes)

    # nodes1 = {'1', '2', '3', '4'}
    # nodes2 = {'1', '2', '3', '4'}

    graph_match = isomorphism.GraphMatcher(graph1, graph2)

    print(hg1 == hg2)
    print(graph_match.is_isomorphic())
    print(graph_match.mapping)

    # print(nodes1)
    # print(nodes2)
    # print(nodes1 == nodes2)

    #
    nx.draw(graph1, with_labels=True)
    plt.show()

    a = [1, 2, 3, 4]

    a.reverse()

    print(str(a[:2]))
