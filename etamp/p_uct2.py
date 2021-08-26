import time
from copy import deepcopy, copy
import numpy as np
import random
from pympler.asizeof import asizeof
from collections import namedtuple
from .pddlstream.language.constants import pAtom
from .stream import is_active_arg
from .pddlstream.language.object import Object, OptimisticObject, EXE_Object, EXE_OptimisticObject

import matplotlib.pyplot as plt
import networkx as nx
from networkx.drawing.nx_pydot import graphviz_layout
import pickle as pk
from .topk_skeleton import EXE_Action, EXE_Stream
from .tree_node2 import Node

# Continuous move: p1: seed_lower_bound, p2: seed_upper_bound
# Discrete move: p1: available_moves, p2: covariance matrix
Info = namedtuple('DepthInfo', ['value', 'discrete', 'p1', 'p2'])
ViablePlan = namedtuple('ViablePlan', ['reward', 'mapping'])

CONST_p = 10


def get_decision_alpha_e(d, dmax):
    a = 1 / (10 * (dmax - d) - 3)
    e = 1 / (2 * CONST_p) * (1 - 3 / (10 * (dmax - d)))

    return a, e


def get_transition_alpha(d, dmax):
    if d <= dmax - 1.5:
        return 3 / (10 * (dmax - d) - 3)
    else:
        return 1


def is_valid_old_new(old, new):
    return isinstance(old, EXE_OptimisticObject) and isinstance(new, EXE_Object)


def select_tree(dict_skeleton_tree, ucb_const=0.03):
    """UCB"""

    trees = [t for t in dict_skeleton_tree.values()]
    root_nodes = [t.root_node for t in trees]

    if len(root_nodes) == 0:
        return None

    best_node = None
    best_value = -np.inf

    num_total_child_visits = 0.0

    for node in root_nodes:
        num_total_child_visits += node.m_visits

    numerator = np.log(num_total_child_visits)

    for node in root_nodes:
        E_v = node.get_eval()
        denom = node.m_visits
        value = E_v + ucb_const * np.sqrt(numerator / denom)

        if value > best_value:
            best_value = value
            best_node = node

    assert best_node is not None
    return trees[root_nodes.index(best_node)]


def remap_action_args(action, mapping):
    def mapping_fn(o):
        if is_active_arg(o):
            return mapping[o]
        else:
            return o

    # mapping_fn = lambda o: mapping[o]
    name, optms_args, add_effects = action
    new_args = tuple(map(mapping_fn, optms_args))

    new_add_effects = []
    for patom in add_effects:
        new_patom = pAtom(patom.name, tuple(map(mapping_fn, patom.args)))
        new_add_effects.append(new_patom)

    return EXE_Action(name, new_args, new_add_effects)


def remap_fact_args(fact, mapping):
    def mapping_fn(o):
        if is_active_arg(o):
            return mapping[o]
        else:
            return o

    return tuple(map(mapping_fn, fact))


def safe_zip(sequence1, sequence2):
    assert len(sequence1) == len(sequence2)
    return zip(sequence1, sequence2)


def transform_patom_args(patom, mapping):
    mapping_fn = lambda o: mapping.get(o, o)
    name, optms_args = patom
    args = tuple(map(mapping_fn, optms_args))

    return pAtom(name, args)


class PlannerUCT(object):
    verbose = False

    def __init__(self, skeleton_env, ucb_const=0.03, pw_const=0.5):  # 0.03 0.5

        self.root_node = None
        self.num_playout = None

        self.ucb_const = ucb_const
        self.pw_const = pw_const

        self.list_vplan = []  # plans leading to task success

        self.env = skeleton_env

        self.time_comsuption = None

        self.num_call = 0

    @property
    def value(self):
        assert self.root_node is not None
        return self.root_node.value

    @property
    def visits(self):
        assert self.root_node is not None
        return self.root_node.visits

    @property
    def total_node(self):
        return len(self.id_to_node)

    def uct_score(self, num_total_child_visits):
        m = 1.1
        numerator = np.log(num_total_child_visits)
        return self.value + m * np.sqrt(numerator / self.visits)

    def reset(self):

        if self.num_call == 0:
            self.id_to_node = {}
            self.edges = []
            # root_state = self.env.get_root_state()
            self.root_node = Node(0, None, self.env)
            self.root_node.saved_world = self.env.get_saved_world()

            self.id_to_node[self.root_node.id] = self.root_node

        self.num_call += 1

    def save_nodes(self):
        save_dict = {}
        for id, node in self.id_to_node.items():
            save_dict[id] = node
        with open('tree_nodes.pk', 'wb') as f:
            pk.dump(save_dict, f)

    def update_graph(self, cur_node, next_node):
        self.id_to_node[next_node.id] = next_node
        self.edges.append((cur_node.id, next_node.id))

    def play_simulation(self, cur_node):
        """
        Kernel Regression UCT.
        cur_node (cur_state) -> [selected_node (selected_state)] or [expanded_node (expanded_state)]
        """
        cur_node.receive_visit(self.env)

        if cur_node.is_final:
            if cur_node.is_successful:
                self.list_vplan.append(ViablePlan(cur_node.value,
                                                  cur_node.var_mapping))
            self.reward_temp = copy(cur_node.value)
            return self.reward_temp

        if cur_node.is_decision_node:
            """Decision Node"""
            flag_pw = cur_node.visits > 0.3 * (len(cur_node.children) ** 2)  # 0.5
            if (flag_pw or (not cur_node.active_children)) and cur_node.is_expandable:
                """Update the environment state before making new decision"""
                next_node = Node(cur_node.depth + 1, cur_node, self.env)
                self.update_graph(cur_node, next_node)
                self.list_decision_temp.append((cur_node.depth, next_node.decision, 'new'))
                self.depth_to_decision_temp[cur_node.depth] = next_node.decision
            else:
                suggestion = None
                if self.env.use_bo:
                    suggestion = self.env.get_suggestion_CP_BO(cur_node)
                    print(f"SELECT---suggest {cur_node.depth}: {suggestion}")
                next_node = cur_node.select_child_ucb(ucb_const=0.04, suggestion=suggestion)  # 0.02
                self.list_decision_temp.append((cur_node.depth, next_node.decision, 'old'))
                self.depth_to_decision_temp[cur_node.depth] = next_node.decision
        else:
            """Transition Node"""
            flag_pw = cur_node.visits > 5.5 * (len(cur_node.children) ** 2)  # 5.5
            if flag_pw or (not cur_node.active_children):
                next_node = Node(cur_node.depth + 1, cur_node, self.env)
                self.update_graph(cur_node, next_node)
            else:
                next_node = cur_node.select_child_least()
                # next_node = cur_node.select_child_ucb(ucb_const=0.02)

        self.play_simulation(next_node)

    def give_best_plan(self):
        if self.list_vplan:
            best_idx = np.argmax([p.reward for p in self.list_vplan])
            vplan = self.list_vplan[best_idx]

            op_plan = self.env.op_plan
            list_paction = [remap_action_args(op, vplan.mapping)
                            for op in op_plan if isinstance(op, EXE_Action)]
            return list_paction

        return None

    def get_best_node(self):
        all_nodes = list(self.id_to_node.values())
        all_idxes = [n.depth if (not n.is_terminal) else -1 for n in all_nodes]
        best_idx = np.argmax(all_idxes)
        return all_nodes[best_idx]

    def think(self, num_playout=50, show_tree_nodes=True):
        self.reset()
        sd = np.random.randint(0, 1000, 1)[0]
        np.random.seed(sd)

        st = time.time()

        # print([self.env.op_plan[i] for i in self.env.decision_steps])

        for i in range(num_playout):
            self.env.receive_visit_sk()
            self.list_decision_temp = []
            self.depth_to_decision_temp = {}
            self.reward_temp = None
            self.play_simulation(self.root_node)
            assert self.reward_temp
            # print('rootSize: ', asizeof(self.root_node))
            # print('dict_Size: ', asizeof(self.id_to_node))
            self.env.xy_data_raw.append((self.depth_to_decision_temp, self.reward_temp))
            if i < 1000 and show_tree_nodes:
                self.visualization()
            print(f'===decisions {self.list_decision_temp}')
            print(
                'SK-{}, visits {}, value {:.3f}, nodes {}, playout {}/{}, max_depth {}/{}, p_stream {}'.format(
                    self.env.skeleton_id,
                    self.visits,
                    self.value,
                    self.total_node,
                    i, num_playout,
                    self.get_best_node().depth,
                    self.env.num_depth, self.env.problematic_streams[0] if self.env.problematic_streams else None))
            if self.list_vplan:
                thinking_time = time.time() - st
                # print('  Binding think_time: ', thinking_time)
                if i < 1000 and show_tree_nodes:
                    self.visualization()
                self.save_nodes()
                self.report_vnt = (self.visits, self.total_node, thinking_time)
                return self.give_best_plan()

        thinking_time = time.time() - st
        # print('Binding think_time: ', thinking_time)
        if num_playout < 1000 and show_tree_nodes:
            self.visualization()
        self.save_nodes()

        return self.give_best_plan()

    def visualization(self):
        graph = nx.Graph()
        color_map = []
        lable_map = {}

        plt.rcParams["figure.figsize"] = (16, 8)
        plt.clf()

        for edge in self.edges:
            graph.add_edge(*edge)

        for node_id in graph:
            node = self.id_to_node[node_id]

            if node.is_successful:
                color_map.append('yellowgreen')
                lable_map[node_id] = 'v {:.3f}\nn {:.2f}'.format(node.value, node.visits)
            elif node.is_terminal:
                color_map.append('mediumorchid')
                if node.decision is not None:
                    decision = np.array(node.decision)
                    lable_map[node_id] = 'd {}\nv {:.3f}\nn {:.2f}'.format(decision, node.value, node.visits)
                else:
                    lable_map[node_id] = 'v {:.3f}\nn {:.2f}'.format(node.value, node.visits)
            elif not node.is_decision_node:
                color_map.append('coral')
                decision = np.array(node.decision)
                np.set_printoptions(precision=2, suppress=True)
                lable_map[node_id] = 'd {}\nv {:.3f}\nn {:.2f}'.format(decision, node.value, node.visits)
            else:
                color_map.append('cornflowerblue')
                lable_map[node_id] = 'v {:.3f}\nn {:.2f}'.format(node.value, node.visits)

        dot_pos = graphviz_layout(graph, prog="dot")
        nx.draw(graph, dot_pos, node_color=color_map, with_labels=False)
        nx.draw_networkx_labels(graph, dot_pos, lable_map)
        plt.draw()
        plt.pause(0.001)

    def __repr__(self):
        return '{}, visit {}, {}/{}, {}'.format(self.env.skeleton_id, self.num_call,
                                                self.get_best_node().depth + 1,
                                                self.env.num_depth,
                                                self.env.get_problematic_streams[0])


if __name__ == '__main__':
    A = tuple([1, 2, 3, 4])
    B = [A, A, A, A, A]
    list_eff = [[atom for atom in a] for a in B]
    list_eff = sum(list_eff, [])
    print(list_eff)

    d = {'a': 1, 'b': 2, 'c': 3, 'd': 4}

    for k, v in d.items():
        print(k, v)

    for i in range(4, 20 + 1):
        print(i)
