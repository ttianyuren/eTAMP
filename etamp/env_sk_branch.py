from copy import deepcopy, copy
import numpy as np
import pickle as pk
import scipy.spatial.distance as spdist
from collections import namedtuple
from .stream import is_active_arg
from .pddlstream.language.object import Object, OptimisticObject, EXE_Object, EXE_OptimisticObject, get_hash
from sklearn.metrics import pairwise_distances_argmin_min
from .topk_skeleton import EXE_Action, EXE_Stream, remap_action_args
from utils.pybullet_tools.utils import get_center_extent, WorldSaver
from utils.pybullet_tools.kuka_primitives3 import GraspDirection
from .decision_sampler import DecisionInfo, SamplerContinuous, SamplerDiscrete, format_continous
from .constraint_graph import Constraint
from collections import defaultdict
import networkx as nx

# from BO.bo_one_piece import suggest_from_MCTS

# from BO.fit_suggestion_prod import suggest_from_CP
# from BO.fit_suggestion_multi import suggest_from_CP
# from BO.fit_suggestion_multi import suggest_from_CP as suggest_from_CP_multi

# from BO.fit_suggestion9 import suggest_from_data


# Continuous move: p1: seed_lower_bound, p2: seed_upper_bound
# Discrete move: p1: available_moves, p2: covariance matrix
# DecisionInfo = namedtuple('DecisionInfo', ['discrete', 'p1', 'p2', 'sampler', 'list_constraint'])
pose_generation_streams = ['sample-place', 'sample-stack']
grasp_dir_streams = ['sample-grasp-dir', 'sample-grasp']
fname_debugDataset = 'debugDataset.pk'


def remap_action_with_uncertainty(action, mapping):
    concrete_action = remap_action_args(action, mapping)

    name, optms_args, optms_add_effects = action
    _, concrete_args, concrete_add_effects = concrete_action

    new_mapping = copy(mapping)
    if name == 'place':
        new_mapping[optms_args[1]] = concrete_args[1]

    realistic_action = remap_action_args(action, new_mapping)

    return realistic_action, new_mapping


def dist_m(m0, m1, weights):
    weights = np.array(weights)
    m0 = np.array([m0]) * weights
    m1 = np.array([m1]) * weights

    dist = spdist.cdist(m0, m1, 'sqeuclidean')[0][0]

    return dist


def get_stream_inputs(stream, mapping):
    def mapping_fn(o):
        if is_active_arg(o):
            t = []
            for i in mapping.items():
                t.append(i)

            return mapping[o]
        else:
            return o

    new_inputs = tuple(map(mapping_fn, stream.inputs))
    input_tuple = tuple(obj.value for obj in new_inputs)
    return input_tuple


def pre_dict_decision(node):
    depth_to_decision = {}
    n = node
    while not n.is_root:
        if n.decision is not None:
            depth_to_decision[n.parent.depth] = n.decision
        n = n.parent
    return depth_to_decision


class SkeletonEnv(object):
    alg_CP_BO = None

    def __init__(self, skeleton_id, op_plan, update_env_reward_fn, stream_info, scn, use_bo=False):

        self.skeleton_id = skeleton_id
        self.update_env_reward_fn = update_env_reward_fn
        self.stream_info = stream_info
        self.op_plan = op_plan  # [StreamResult_1.1, StreamResult_1.2, pAction_1, StreamResult_2.1, pAction_2,...]
        self.decision_steps = []  # wrt. op_plan
        self.action_steps = []
        self.scene_reset_fn = scn.reset

        self.bd_body = scn.bd_body
        self.scn = scn

        self.failure_log = {}

        self.depth_to_decision_info = {}
        self.depth_to_steps = {}
        self.step_to_victim_roles = defaultdict(list)  # step -> ctypes
        self.ctype_to_constraint = {}  # ctype -> an example constraint defined in current skeleton
        self.dtuple_to_decision_o = {}  # map from [visits, previous decisions in constraints] to [decision]

        # for GP-BO method
        self.dtuple_to_decision = {}
        self.xy_data_raw = []
        self.xy_data = []

        self.digraph = None  # the last constraint encountered
        self.bodyid_to_obj = {}
        self.visits = 0
        self.use_bo = use_bo

        self.msg_yg = None
        self.msg_bi = None

        self.list_bo_input_output = []

        depth = 0
        steps = []
        for step, op in enumerate(op_plan):
            if isinstance(op, EXE_Stream):
                op_info = self.get_op_info(op)
                """decision node"""
                if op_info.free_generator:
                    if steps:
                        self.depth_to_steps[depth] = tuple(steps)
                        depth += 1
                    self.decision_steps.append(step)

                    if op_info.discrete:
                        sampler = SamplerDiscrete(op_info.p1, op_info.p2)
                    else:
                        sampler = SamplerContinuous(op_info.p1, op_info.p2)

                    self.depth_to_decision_info[depth] = DecisionInfo(op.name, step, op_info.discrete,
                                                                      op_info.p1, op_info.p2,
                                                                      sampler)
                    self.depth_to_steps[depth] = (step,)
                    depth += 1
                    steps = []
                else:
                    steps.append(step)

            elif isinstance(op, EXE_Action):
                self.action_steps.append(step)
                steps.append(step)

        self.depth_to_steps[depth] = steps
        self.step_to_depth = {}
        for d, s_tuple in self.depth_to_steps.items():
            for s in s_tuple:
                self.step_to_depth[s] = d

        if not self.decision_steps:
            raise Warning('Invalid op_plan!')

        self.num_decision = len(self.decision_steps)
        self.op_length = len(self.op_plan)
        self.num_depth = len(self.depth_to_steps)

        self.dict_decision_info = {}
        self.dict_transition_info = {}

    def add_victim_role(self, step, ctype, exp_constraint):
        if ctype not in self.step_to_victim_roles[step]:
            self.step_to_victim_roles[step].append(ctype)
            self.ctype_to_constraint[ctype] = exp_constraint

    def get_op_info(self, op):
        return self.stream_info[op.name]

    @property
    def start_with_transition_node(self):
        if not self.decision_steps:
            return True
        if self.decision_steps[0] != 0:
            return True
        return False

    def receive_visit_sk(self):
        self.visits += 1
        self.scene_reset_fn()
        # self.load_suggestions_bo()

    def get_suggestion_MCTS_BO(self, cur_node):
        """
        Use MCTS-BO
        """
        if not self.use_bo:
            return None

        depth_to_decision = pre_dict_decision(cur_node)

        cur_depth = cur_node.depth

        steps, ops = self.get_steps_ops(cur_depth)
        stream_inputs = get_stream_inputs(ops[0], cur_node.var_mapping)

        depth_by_input = []  # one dim of the inputs should be one depth of stream
        depth_to_index = {}

        for d, dinfo in self.depth_to_decision_info.items():
            depth_by_input.append(d)
            idxInput = len(depth_by_input) - 1
            depth_to_index[d] = idxInput

        depth_by_input.sort()
        if cur_depth not in depth_by_input:
            return None

        data = []
        for p in self.xy_data_raw:
            d_to_decision, final_reward = p
            point = []
            for d in depth_by_input:
                if d in d_to_decision:
                    point.append(d_to_decision[d])
                else:
                    dinfo = self.depth_to_decision_info[d]
                    point.append(dinfo.sampler([]))
            point.append(final_reward)
            data.append(point)

        range_by_input = []
        discrete_by_input = []
        for d in depth_by_input:
            dinfo = self.depth_to_decision_info[d]
            discrete_by_input.append(dinfo.discrete)
            if dinfo.discrete:
                range_by_input.append((min(dinfo.p1), max(dinfo.p1)))
            else:
                range_by_input.append((0, 1))

        list_decision = []
        for i, depth in enumerate(depth_by_input):
            if depth in depth_to_decision:
                d = depth_to_decision[depth]
                list_decision.append(d)

        dtuple = tuple([self.visits] + list_decision)
        if dtuple in self.dtuple_to_decision:
            new_decision = self.dtuple_to_decision[dtuple]
            return new_decision

        fix_by_input = [None for _ in depth_by_input]
        for i, fix in enumerate(list_decision):
            fix_by_input[i] = fix

        """suggestions defined in global measurement frame"""
        try:
            inputs_next = suggest_from_MCTS(self.xy_data, fix_by_input, range_by_input)
        except:
            inputs_next = None
            print("BO error. debugDataset is saved. ================================================")
            with open(fname_debugDataset, 'wb') as f:
                pk.dump((self.xy_data, fix_by_input, range_by_input), f)

        # inputs_next = suggest_bo(data, range_by_input, fix_by_input)

        if not inputs_next:
            return None

        temp_list_decision = []
        for i, d in enumerate(inputs_next):
            temp_dtuple = tuple([self.visits] + temp_list_decision)
            self.dtuple_to_decision[temp_dtuple] = d
            temp_list_decision.append(d)

        new_decision = self.dtuple_to_decision[dtuple]
        return new_decision

    def get_suggestion_CP_BO(self, cur_node):
        """
        Use CP-BO
        list_decision: upstream decisions, made before current depth
        """
        if not self.use_bo:
            return None

        if SkeletonEnv.alg_CP_BO is None:
            from BO.fit_suggestion import suggest_from_CP
        elif SkeletonEnv.alg_CP_BO == 'prod':
            from BO.fit_suggestion_prod import suggest_from_CP
        elif SkeletonEnv.alg_CP_BO == 'multi':
            from BO.fit_suggestion_multi import suggest_from_CP

        depth_to_decision = pre_dict_decision(cur_node)

        cur_depth = cur_node.depth

        steps, ops = self.get_steps_ops(cur_depth)
        stream_inputs = get_stream_inputs(ops[0], cur_node.var_mapping)

        depth_by_input = []  # one dim of the inputs should be one depth of stream
        decisionKey_to_depth = {}
        ctype_to_bi = {}
        ctype_to_depths = defaultdict(list)
        ctype_to_indexes = defaultdict(list)  # index of the input vector

        depth_to_index = {}

        for d, dinfo in self.depth_to_decision_info.items():
            if dinfo.roles_as_culprit:
                depth_by_input.append(d)
                for ctype, decision_id in dinfo.roles_as_culprit:
                    decisionKey_to_depth[(ctype, decision_id)] = d
                    ctype_to_depths[ctype].append(d)
                    idxInput = len(depth_by_input) - 1
                    ctype_to_indexes[ctype].append(idxInput)
                    depth_to_index[d] = idxInput
                    ctype_to_bi[ctype] = self.ctype_to_constraint[ctype].bi
        depth_by_input.sort()
        if cur_depth not in depth_by_input:
            return None

        range_by_input = []
        discrete_by_input = []
        for d in depth_by_input:
            dinfo = self.depth_to_decision_info[d]
            discrete_by_input.append(dinfo.discrete)
            if dinfo.discrete:
                range_by_input.append((min(dinfo.p1), max(dinfo.p1)))
            else:
                range_by_input.append((0, 1))

        gd = None
        if cur_node.pddl == '(sample-grasp-dir, )':
            body, pose = stream_inputs
            gd = GraspDirection(body, pose, 0, self.scn.robots[0], self.scn.dic_body_info)

        def f_e2o(depth, de):
            dinfo = self.depth_to_decision_info[depth]
            if dinfo.op_name == 'sample-grasp-dir':
                if gd is not None and depth == cur_node.depth:
                    do = gd.ellipsoid_to_object(de[0])
                else:
                    n = cur_node
                    grasp_dir = None
                    while not n.is_root:
                        if n.parent.pddl == '(sample-grasp-dir, )':
                            grasp_dir = list(n.add_mapping.values())[0].value
                            break
                        n = n.parent
                    assert grasp_dir is not None
                    do = grasp_dir.ellipsoid_to_object(de[0])
                do = (do,)
            else:
                do = de
            return do

        def trans_o2e(do, depth):
            dinfo = self.depth_to_decision_info[depth]
            if dinfo.op_name == 'sample-grasp-dir':
                if gd is not None and depth == cur_node.depth:
                    de = gd.object_to_ellipsoid(do[0])
                else:
                    n = cur_node
                    grasp_dir = None
                    while not n.is_root:
                        if n.parent.pddl == '(sample-grasp-dir, )':
                            grasp_dir = list(n.add_mapping.values())[0].value
                            break
                        n = n.parent
                    assert grasp_dir is not None
                    de = grasp_dir.object_to_ellipsoid(do[0])
                de = (de,)
            else:
                de = do

            return de

        list_decision_o = []  # upstream decisions that are involved in constraints
        list_decision_e = []
        for i, depth in enumerate(depth_by_input):
            if depth in depth_to_decision:
                de = depth_to_decision[depth]
                list_decision_o.append(f_e2o(depth, de))
                list_decision_e.append(de)

        dtuple_o = tuple([self.visits] + list_decision_o)
        if dtuple_o in self.dtuple_to_decision_o:
            new_decision = trans_o2e(self.dtuple_to_decision_o[dtuple_o], cur_depth)
            return new_decision

        data_by_ctype = []
        idxs_by_ctype = []
        bi_by_ctype = []
        constraint_by_ctype = []
        for ctype in ctype_to_depths:
            """for each ctype"""
            cs = Constraint.ctype_to_constraints[ctype]
            points = []
            for c in cs:
                """for each point"""
                # label = 1 if c.yg >= 0 else -1
                label = c.yg
                point = [None for _ in depth_by_input] + [label]
                for _, v in c.culprits.items():
                    c_step, decision, decision_id = v
                    # c_depth = self.step_to_depth[c_step]
                    c_depth = decisionKey_to_depth[(ctype, decision_id)]
                    idxInput = depth_by_input.index(c_depth)
                    point[idxInput] = decision
                points.append(point)
            if len(cs) >= 1:
                constraint_by_ctype.append(cs[0])
            else:
                constraint_by_ctype.append(None)
            data_by_ctype.append(points)
            idxs_by_ctype.append(ctype_to_indexes[ctype])
            bi_by_ctype.append(ctype_to_bi[ctype])

        if not data_by_ctype:
            return None

        fix_by_input = [None for _ in depth_by_input]
        for i, fix in enumerate(list_decision_o):
            fix_by_input[i] = fix

        """suggestions defined in global measurement frame"""
        # inputs_next, info_by_input = suggest_from_CP(data_by_ctype, idxs_by_ctype, bi_by_ctype,
        #                                              fix_by_input, range_by_input)
        try:
            inputs_next, info_by_input = suggest_from_CP(data_by_ctype, idxs_by_ctype, bi_by_ctype,
                                                         fix_by_input, range_by_input)
        except:
            inputs_next, info_by_input = None, None
            print("BO error. debugDataset is saved. ================================================")
            with open(fname_debugDataset, 'wb') as f:
                pk.dump((data_by_ctype, idxs_by_ctype, bi_by_ctype,
                         fix_by_input, range_by_input, constraint_by_ctype), f)

        if not inputs_next:
            return None

        # boInput = (data_by_ctype, idxs_by_ctype, bi_by_ctype,
        #            fix_by_input, range_by_input)
        # boOutput = (inputs_next, info_by_input)
        # self.list_bo_input_output.append((boInput, boOutput))
        # with open('list_bo_input_output.pk', 'wb') as f:
        #     pk.dump(self.list_bo_input_output, f)

        temp_list_decision_o = []
        for i, do in enumerate(inputs_next):
            temp_dtuple = tuple([self.visits] + temp_list_decision_o)
            self.dtuple_to_decision_o[temp_dtuple] = do
            temp_list_decision_o.append(do)

        new_decision = trans_o2e(self.dtuple_to_decision_o[dtuple_o], cur_depth)
        return new_decision

    def get_steps_ops(self, depth):
        if depth == self.num_depth:
            return (), ()

        steps = self.depth_to_steps[depth]

        return steps, tuple([self.op_plan[s] for s in steps])

    def apply_decision(self, depth, mapping, decision):
        """
        """
        assert depth in self.depth_to_decision_info
        steps, ops = self.get_steps_ops(depth)
        add_mapping, digraph, sdg_msg = self._apply_stream(ops[0], mapping, decision)
        if add_mapping is None:
            return None, steps[0], digraph, sdg_msg  # updated_mapping, termial_step
        else:
            return add_mapping, None, None, None

    def apply_transition(self, depth, mapping):
        assert depth not in self.depth_to_decision_info

        steps, ops = self.get_steps_ops(depth)

        sum_action_reward = 0
        net_add_mapping = {}
        total_mapping = {}
        total_mapping.update(mapping)
        yg = None
        for step, op in zip(steps, ops):
            op = self.op_plan[step]
            if isinstance(op, EXE_Stream):
                assert not self.get_op_info(op).free_generator

                add_mapping, digraph, sdg_msg = self._apply_stream(op, total_mapping)
                if add_mapping is None:
                    return None, step, sum_action_reward, digraph, sdg_msg
                net_add_mapping.update(add_mapping)
                total_mapping.update(add_mapping)
            elif isinstance(op, EXE_Action):
                action_reward = self._simulate_action(op, total_mapping)
                if action_reward is None:
                    return None, step, sum_action_reward, yg
                sum_action_reward += action_reward

        return net_add_mapping, None, sum_action_reward, None, None

    def get_digraph(self):
        list_node = list(self.digraph)
        set_node = set(list_node)
        assert len(list_node) == len(set_node)

        return self.digraph

    def _extend_digraph(self, vertex, digraph, step):
        """

        """
        list_op = self.op_plan[:step]
        list_op.reverse()
        if isinstance(vertex, EXE_Stream):
            for i, p in enumerate(vertex.inputs):
                digraph.add_edge(p, vertex, weight=1)  # duplicate edges will be ignored
                if not (i == 0 and vertex.name in pose_generation_streams) \
                        and not (i == 1 and vertex.name in grasp_dir_streams):
                    self._extend_digraph(p, digraph, step)
            if vertex in list(digraph):
                step = self.op_plan.index(vertex)
                digraph.nodes[vertex]['step'] = step
        elif isinstance(vertex, EXE_OptimisticObject):
            for op in list_op:
                if isinstance(op, EXE_Stream):
                    if vertex in op.outputs:
                        step = self.op_plan.index(op)
                        digraph.add_edge(op, vertex, weight=1)
                        digraph.nodes[op]['step'] = step
                        self._extend_digraph(op, digraph, step)
                        s = digraph.nodes[op]['step']
                        break
        elif isinstance(vertex, EXE_Object):
            if isinstance(vertex.value, int):
                # predecessors = list(self.digraph.predecessors(vertex))
                in_edges = list(digraph.in_edges(vertex, data=False))
                if not in_edges:
                    find_parent = False
                    for op in list_op:
                        if isinstance(op, EXE_Stream):
                            if op.name in pose_generation_streams:
                                if vertex.value == op.inputs[0].value:
                                    digraph.add_edge(op.outputs[0], vertex, weight=1)
                                    step = self.op_plan.index(op)
                                    digraph.add_edge(op, op.outputs[0], weight=10)
                                    digraph.nodes[op]['step'] = step
                                    self._extend_digraph(op, digraph, step)
                                    find_parent = True
                                    break
                    if not find_parent:
                        obj_center, obj_extent = get_center_extent(vertex.value)
                        digraph.add_edge(tuple(obj_center), vertex, weight=1)

    def build_digraph(self, stream, seed_gen_fn):
        """
        Build a directional graph to indicate a constraint responsible for the failure in a stream evaluation.
        :param stream: the stream that is failed
        """
        digraph = None
        sdg_msg = None

        try:
            sdg_msg = seed_gen_fn.get_error_message()
        except AttributeError:
            pass

        if sdg_msg is not None:
            digraph = nx.DiGraph()
            self._extend_digraph(stream, digraph, self.op_plan.index(stream))
            if sdg_msg.msg_obstacle:
                collision_obj = EXE_Object('temp_o' + str(sdg_msg.msg_obstacle), sdg_msg.msg_obstacle)
                digraph.add_edge(collision_obj, stream, weight=10)
                if stream.name in pose_generation_streams:
                    digraph.add_edge(collision_obj, stream.inputs[0], weight=1)
                self._extend_digraph(collision_obj, digraph, self.op_plan.index(stream))

        return digraph, sdg_msg

    def _apply_stream(self, stream, mapping, seed=None):
        """
        :param stream: EXE_Stream to be applied
        :param seed: the move(output of a stream generator) suggested by node.
        """

        input_tuple = get_stream_inputs(stream, mapping)

        seed_gen_fn = self.get_op_info(stream).seed_gen_fn
        output_tuple = seed_gen_fn(input_tuple=input_tuple, seed=seed)  # tuple, can be None

        if stream.name == 'plan-free-motion':
            if isinstance(stream.inputs[0], EXE_OptimisticObject):
                print()

        if not output_tuple:
            digraph, sdg_msg = self.build_digraph(stream, seed_gen_fn)

            if stream.name not in self.failure_log:
                self.failure_log[stream.name] = 1
            else:
                self.failure_log[stream.name] += 1
            return None, digraph, sdg_msg

        old_objects = stream.outputs  # tuple
        new_objects = None
        if output_tuple:
            new_objects = tuple(EXE_Object(o.pddl, v) for o, v in zip(old_objects, output_tuple))

        add_mapping = {}
        for v, c in zip(old_objects, new_objects):
            add_mapping[v] = c

        return add_mapping, None, None

    def _simulate_action(self, action, mapping):
        """
        update environment by the action, and return the execution result
        """

        concrete_action = remap_action_args(action, mapping)

        list_action = [concrete_action]

        action_reward = self.update_env_reward_fn(list_action)

        """Apply action uncertainties for specific actions."""
        if action.name == 'pick' and action.parameters[0].value == 1 and 0:
            if np.random.uniform() > 0.5:
                action_reward = None

        return action_reward

    def set_env_depth(self, depth, mapping):
        """
        set the environment as described by mapping
        """
        if depth in self.depth_to_decision_info:
            return
        """when depth is for transition node"""
        steps, ops = self.get_steps_ops(depth)

        mapping = copy(mapping)
        for step, op in zip(steps, ops):
            if isinstance(op, EXE_Action):
                concrete_action = remap_action_args(op, mapping)
                self.update_env_reward_fn([concrete_action])

    def get_saved_world(self):
        saved_world = WorldSaver()
        return saved_world

    @property
    def problematic_streams(self):
        """Return streams that are most likely to fail"""
        self.failure_log = {k: v for k, v in
                            sorted(self.failure_log.items(),
                                   key=lambda item: item[1])}
        result = [s for s in self.failure_log]
        result.reverse()
        return result

    def __repr__(self):
        return '{}'.format(self.op_plan)


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
