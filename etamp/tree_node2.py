from copy import deepcopy, copy
import numpy as np
import scipy.spatial.distance as spdist
from collections import namedtuple
import pickle as pk
from .constraint_graph import Constraint, update_constraint_dict, get_op_to_decision, rename_stream, update_constraint
from collections import defaultdict
from BO.fit_suggestion import suggest_from_CP

# Continuous move: p1: seed_lower_bound, p2: seed_upper_bound
# Discrete move: p1: available_moves, p2: covariance matrix
ViablePlan = namedtuple('ViablePlan', ['reward', 'mapping'])
NodeCore = namedtuple('NodeCore', ['sn', 'id', 'parent_id', 'depth', 'value', 'visits', 'var_mapping', 'steps',
                                   'is_leaf', 'is_root', 'is_decision_node', 'is_discrete', 'is_final', 'is_terminal'])


class ExtendedNode(object):
    """
    The extended root.
    """

    def __init__(self):
        self.children = []
        self.visits = 0

    def select_child_ucb(self):
        scores = [c.uct_score(self.num_total_child_visits) for c in self.children]
        idx_max = scores.index(max(scores))
        child_selected = self.children[idx_max]
        return child_selected

    def add_child(self, sk_branch):
        self.children.append(sk_branch)

    def save_the_tree(self, append_name=''):
        list_branch = []
        for b in self.children:
            list_branch.append(b.id_to_node)
        file_name = 'ext_tree_nodes_' + str(append_name) + '.pk'
        with open(file_name, 'wb') as f:
            pk.dump(list_branch, f)

    @property
    def op_set(self):
        return set([c.env.op_plan for c in self.children])

    @property
    def num_total_child_visits(self):
        num_total_child_visits = 0
        for child in self.children:
            num_total_child_visits += child.visits
        return num_total_child_visits

    @property
    def num_children(self):
        return len(self.children)

    @property
    def total_node(self):
        return sum([c.total_node for c in self.children])


def get_decision_list(node):
    d_list = []
    n = node
    while not n.is_root:
        if n.decision is not None:
            d_list.append(n.decision)
        n = n.parent
    d_list.reverse()
    return d_list


class Node(object):
    """
    Each node corresponds to a state stream (free generator), starting from the parent node.
    """

    def __init__(self, depth, parent, env):
        self.depth = depth
        self.parent = parent
        self.steps, ops = env.get_steps_ops(self.depth)
        pddl = "("
        for op in ops:
            pddl += op.name + ', '
        pddl += ")"
        self.pddl = pddl

        self.env_num_decision = env.num_decision
        if self.parent is None:
            self.sn = 0
            self.id = (self.sn,)
        else:
            self.sn = len(self.parent.children)
            self.id = self.parent.id + (self.sn,)
        self.children = []
        self.value = 0
        self.visits = 0

        """1. Initialize basic properties."""
        self.is_leaf = (not self.steps)
        self.is_root = (self.depth < 1) and (self.parent is None)
        self.is_decision_node = (self.depth in env.depth_to_decision_info)
        self.is_terminal = False
        self.cgraph = None
        self.is_final = False
        self.is_successful = False
        self.action_reward = None
        self.decision = None
        self.add_mapping = None
        self.is_discrete = None
        self.available_actions = None
        if self.is_decision_node and not self.is_leaf:
            self.decision_info = env.depth_to_decision_info[self.depth]
            self.is_discrete = self.decision_info.discrete
            if self.is_discrete:
                self.available_actions = self.decision_info.p1
        if self.is_root:
            return
        """2. Try to concrete its parent node."""
        self.parent.restore_world()  # restore the world state
        if self.parent.is_decision_node:
            self.decision = self.parent.sample_new_decision(env)
            # print(self.decision)
            self.add_mapping, self.step_terminal, digraph, sdg_msg = env.apply_decision(self.parent.depth,
                                                                                        self.parent.var_mapping,
                                                                                        self.decision)
        else:
            # the world state will be changed here
            self.add_mapping, self.step_terminal, self.action_reward, digraph, sdg_msg = env.apply_transition(
                self.parent.depth,
                self.parent.var_mapping)

        self.is_terminal = (self.step_terminal is not None)
        self.is_final = self.is_terminal or self.is_leaf
        self.is_successful = self.is_leaf and not self.is_terminal

        self.saved_world = None  # for the root node, it is the initial environment state
        if not self.is_terminal and not self.is_decision_node:
            # if the world state is changed successfully, save it.
            self.saved_world = env.get_saved_world()

        self.parent.children.append(self)

        update_constraint(self, env, digraph, sdg_msg)

    """Both Nodes"""

    def restore_world(self):
        if self.saved_world:
            self.saved_world.restore()
        else:
            node = self
            while node.saved_world is None:
                node = node.parent
            node.restore_world()

    @property
    def var_mapping(self):
        if self.is_root:
            return {}
        if self.is_terminal:
            return self.parent.var_mapping
        total_mapping = {}
        total_mapping.update(self.add_mapping)
        total_mapping.update(self.parent.var_mapping)
        return total_mapping

    @property
    def decision_list(self):
        return get_decision_list(self)

    def receive_visit(self, env):
        self.visits += 1
        if self.is_terminal:
            self.value = 0.1 * self.step_terminal / env.op_length
        elif self.is_successful:
            self.value = 1 + self.get_acc_action_reward()
            print('PPS- A solution is found!')
            print(f'    reward  {self.value}')

        if self.is_final:
            self.back_propagate()
        # else:
        #     """set the environment"""
        #     if self.is_root:
        #         env.scene_reset_fn()
        #     else:
        #         env.set_env_depth(self.parent.depth, self.var_mapping)

    @property
    def active_children(self):
        return [c for c in self.children if not c.is_final]

    def get_acc_action_reward(self):
        """Accumulated reward up to current node."""
        acc_reward = 0
        node = self
        while not node.is_root:
            if node.action_reward:
                acc_reward += node.action_reward
            node = node.parent

        return acc_reward

    def back_propagate(self):
        node = self
        while not node.is_root:
            if node.parent.is_decision_node:
                bp_value = max([c.value for c in node.parent.children])
            else:
                nu = sum([c.value * c.visits for c in node.parent.children])
                de = sum([c.visits for c in node.parent.children])
                bp_value = nu / de
            node.parent.value = bp_value
            node = node.parent

    """Decision Node only"""

    @property
    def is_expandable(self):
        assert self.is_decision_node and not self.is_leaf
        if not self.is_discrete:
            return True
        else:
            return len(self.children) < len(self.available_actions)

    def sample_new_decision(self, env):
        assert self.is_decision_node
        existing_decisions = [c.decision for c in self.children]

        suggestion = env.get_suggestion_CP_BO(self)
        # suggestion = env.get_suggestion_MCTS_BO(self)

        print(f"---suggest {self.depth}: {suggestion}")

        return self.decision_info.sampler(existing_decisions, suggestion)

    def select_child_ucb(self, ucb_const, suggestion=None, sug_const=0.03):
        # assert self.is_decision_node
        ucb_scores = [c.uct_score(ucb_const) for c in self.children]
        sug_scores = [c.suggestion_score(suggestion) for c in self.children]
        scores = []
        for ucb, sug in zip(ucb_scores, sug_scores):
            score = ucb + sug * sug_const
            scores.append(score)
        idx_max = scores.index(max(scores))
        child_selected = self.children[idx_max]
        return child_selected

    """Transition Node only"""

    def uct_score(self, ucb_const):
        # assert self.parent.is_decision_node

        numerator = np.log(self.parent.visits)
        return self.value + ucb_const * np.sqrt(numerator / self.visits)

    def suggestion_score(self, suggestion=None):
        # assert self.parent.is_decision_node
        if suggestion is None:
            return 0.
        assert self.parent.is_discrete is not None
        if self.parent.is_discrete:
            if int(suggestion[0]) == int(self.decision[0]):
                return 1.
            else:
                return 0.
        else:
            a = np.array(suggestion)
            b = np.array(self.decision)
            cosab = a.dot(b) / (np.linalg.norm(a) * np.linalg.norm(b))
            return cosab

    def select_child_least(self):
        # assert not self.is_decision_node
        scores = [c.visits for c in self.children]
        idx_min = scores.index(min(scores))
        child_selected = self.children[idx_min]
        return child_selected

    def __repr__(self):
        return '{} - {}{}: {}'.format(self.depth, self.sn,
                                      ' - F' if self.is_final else '', self.pddl)


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
