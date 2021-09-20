from __future__ import print_function

import copy
import pybullet as p
import random
import time
from itertools import islice
from utils.pybullet_tools.utils import SDG_MSG
import numpy as np
from utils.pybullet_tools.body_utils import draw_frame

from .ikfast.pr2.ik import is_ik_compiled, pr2_inverse_kinematics
from .ikfast.utils import USE_CURRENT, USE_ALL
from .pr2_problems import get_fixed_bodies
from .pr2_utils import TOP_HOLDING_LEFT_ARM, SIDE_HOLDING_LEFT_ARM, SIDE_HOLDING_RIGHT_ARM, GET_GRASPS, \
    get_gripper_joints, \
    get_carry_conf, get_top_grasps, get_side_grasps, open_arm, close_arm, arm_conf, get_gripper_link, get_arm_joints, \
    learned_pose_generator, PR2_TOOL_FRAMES, get_x_presses, PR2_GROUPS, joints_from_names, \
    is_drake_pr2, get_group_joints, get_group_conf, compute_grasp_width, PR2_GRIPPER_ROOTS, get_side_grasps_hanoi
from .utils import *

BASE_EXTENT = 3.5  # 2.5
BASE_LIMITS = (-BASE_EXTENT * np.ones(2), BASE_EXTENT * np.ones(2))
GRASP_LENGTH = 0.03
APPROACH_DISTANCE = 0.1 + GRASP_LENGTH
SELF_COLLISIONS = False


##################################################


def get_base_limits(robot):
    if is_drake_pr2(robot):
        joints = get_group_joints(robot, 'base')[:2]
        lower = [get_min_limit(robot, j) for j in joints]
        upper = [get_max_limit(robot, j) for j in joints]
        return lower, upper
    return BASE_LIMITS


##################################################

class BodyPose(object):
    # def __init__(self, position, orientation):
    #    self.position = position
    #    self.orientation = orientation
    def __init__(self, body, value=None, support=None, init=False):
        self.body = body
        if value is None:
            value = get_pose(self.body)
        self.value = tuple(value)
        self.support = support
        self.init = init

    def assign(self):
        set_pose(self.body, self.value)

    def iterate(self):
        yield self

    def to_base_conf(self):
        values = base_values_from_pose(self.value)
        return Conf(self.body, range(len(values)), values)

    def __repr__(self):
        return 'p{}'.format(id(self) % 1000)


class Grasp(object):
    def __init__(self, grasp_type, body, value, approach, carry):
        self.grasp_type = grasp_type
        self.body = body
        self.value = tuple(value)  # gripper_from_object
        self.approach = tuple(approach)
        self.carry = tuple(carry)

    def attachment(self, robot, arm):
        tool_link = link_from_name(robot, PR2_TOOL_FRAMES[arm])
        return Attachment(robot, tool_link, self.value, self.body)

    def __repr__(self):
        return 'g{}'.format(id(self) % 1000)


class Conf(object):
    def __init__(self, body, joints, values=None, init=False):
        self.body = body
        self.joints = joints
        if values is None:
            values = get_joint_positions(self.body, self.joints)
        self.values = tuple(values)
        self.init = init

    def assign(self):
        set_joint_positions(self.body, self.joints, self.values)

    def iterate(self):
        yield self

    def __repr__(self):
        return 'q{}'.format(id(self) % 1000)


#####################################

class Command(object):
    def control(self, dt=0):
        raise NotImplementedError()

    def apply(self, state, **kwargs):
        raise NotImplementedError()

    def iterate(self):
        raise NotImplementedError()


class Commands(object):
    def __init__(self, state, savers=[], commands=[]):
        self.state = state
        self.savers = tuple(savers)
        self.commands = tuple(commands)

    def assign(self):
        for saver in self.savers:
            saver.restore()
        return copy.copy(self.state)

    def apply(self, state, **kwargs):
        for command in self.commands:
            for result in command.apply(state, **kwargs):
                yield result

    def __repr__(self):
        return 'c{}'.format(id(self) % 1000)


#####################################

class Trajectory(Command):
    _draw = False

    def __init__(self, path):
        self.path = tuple(path)
        # TODO: constructor that takes in this info

    def apply(self, state, sample=1):
        handles = add_segments(self.to_points()) if self._draw and has_gui() else []
        for conf in self.path[::sample]:
            conf.assign()
            yield
        end_conf = self.path[-1]
        if isinstance(end_conf, BodyPose):
            state.poses[end_conf.body] = end_conf
        for handle in handles:
            remove_debug(handle)

    def control(self, dt=0, **kwargs):
        # TODO: just waypoints
        for conf in self.path:
            if isinstance(conf, BodyPose):
                conf = conf.to_base_conf()
            for _ in joint_controller_hold(conf.body, conf.joints, conf.values):
                step_simulation()
                time.sleep(dt)

    def to_points(self, link=BASE_LINK):
        # TODO: this is computationally expensive
        points = []
        for conf in self.path:
            with BodySaver(conf.body):
                conf.assign()
                # point = np.array(point_from_pose(get_link_pose(conf.body, link)))
                point = np.array(get_group_conf(conf.body, 'base'))
                point[2] = 0
                point += 1e-2 * np.array([0, 0, 1])
                if not (points and np.allclose(points[-1], point, atol=1e-3, rtol=0)):
                    points.append(point)
        points = get_target_path(self)
        return waypoints_from_path(points)

    def distance(self, distance_fn=get_distance):
        total = 0.
        for q1, q2 in zip(self.path, self.path[1:]):
            total += distance_fn(q1.values, q2.values)
        return total

    def iterate(self):
        for conf in self.path:
            yield conf

    def reverse(self):
        return Trajectory(reversed(self.path))

    # def __repr__(self):
    #    return 't{}'.format(id(self) % 1000)
    def __repr__(self):
        d = 0
        if self.path:
            conf = self.path[0]
            d = 3 if isinstance(conf, BodyPose) else len(conf.joints)
        return 't({},{})'.format(d, len(self.path))


def create_trajectory(robot, joints, path):
    return Trajectory(Conf(robot, joints, q) for q in path)


##################################################

class GripperCommand(Command):
    def __init__(self, robot, arm, position, teleport=False):
        self.robot = robot
        self.arm = arm
        self.position = position
        self.teleport = teleport

    def apply(self, state, **kwargs):
        joints = get_gripper_joints(self.robot, self.arm)
        start_conf = get_joint_positions(self.robot, joints)
        end_conf = [self.position] * len(joints)
        if self.teleport:
            path = [start_conf, end_conf]
        else:
            extend_fn = get_extend_fn(self.robot, joints)
            path = [start_conf] + list(extend_fn(start_conf, end_conf))
        for positions in path:
            set_joint_positions(self.robot, joints, positions)
            yield positions

    def control(self, **kwargs):
        joints = get_gripper_joints(self.robot, self.arm)
        positions = [self.position] * len(joints)
        for _ in joint_controller_hold(self.robot, joints, positions):
            yield

    def __repr__(self):
        return '{}({},{},{})'.format(self.__class__.__name__, get_body_name(self.robot),
                                     self.arm, self.position)


class Attach(Command):
    vacuum = True

    def __init__(self, robot, arm, grasp, body):
        self.robot = robot
        self.arm = arm
        self.grasp = grasp
        self.body = body
        self.link = link_from_name(self.robot, PR2_TOOL_FRAMES.get(self.arm, self.arm))
        # self.attachment = None

    def assign(self):
        gripper_pose = get_link_pose(self.robot, self.link)
        body_pose = multiply(gripper_pose, self.grasp.value)
        set_pose(self.body, body_pose)

    def apply(self, state, **kwargs):
        state.attachments[self.body] = create_attachment(self.robot, self.link, self.body)
        state.grasps[self.body] = self.grasp
        del state.poses[self.body]
        yield

    def control(self, dt=0, **kwargs):
        if self.vacuum:
            add_fixed_constraint(self.body, self.robot, self.link)
            # add_fixed_constraint(self.body, self.robot, self.link, max_force=1) # Less force makes it easier to pick
        else:
            # TODO: the gripper doesn't quite work yet
            gripper_name = '{}_gripper'.format(self.arm)
            joints = joints_from_names(self.robot, PR2_GROUPS[gripper_name])
            values = [get_min_limit(self.robot, joint) for joint in joints]  # Closed
            for _ in joint_controller_hold(self.robot, joints, values):
                step_simulation()
                time.sleep(dt)

    def __repr__(self):
        return '{}({},{},{})'.format(self.__class__.__name__, get_body_name(self.robot),
                                     self.arm, get_name(self.body))


class Detach(Command):
    def __init__(self, robot, arm, body):
        self.robot = robot
        self.arm = arm
        self.body = body
        self.link = link_from_name(self.robot, PR2_TOOL_FRAMES.get(self.arm, self.arm))
        # TODO: pose argument to maintain same object

    def apply(self, state, **kwargs):
        del state.attachments[self.body]
        state.poses[self.body] = BodyPose(self.body, get_pose(self.body))
        del state.grasps[self.body]
        yield

    def control(self, **kwargs):
        remove_fixed_constraint(self.body, self.robot, self.link)

    def __repr__(self):
        return '{}({},{},{})'.format(self.__class__.__name__, get_body_name(self.robot),
                                     self.arm, get_name(self.body))


##################################################

class Clean(Command):
    def __init__(self, body):
        self.body = body

    def apply(self, state, **kwargs):
        state.cleaned.add(self.body)
        self.control()
        yield

    def control(self, **kwargs):
        p.addUserDebugText('Cleaned', textPosition=(0, 0, .25), textColorRGB=(0, 0, 1),  # textSize=1,
                           lifeTime=0, parentObjectUniqueId=self.body)
        # p.setDebugObjectColor(self.body, 0, objectDebugColorRGB=(0,0,1))

    def __repr__(self):
        return '{}({})'.format(self.__class__.__name__, self.body)


class Cook(Command):
    # TODO: global state here?
    def __init__(self, body):
        self.body = body

    def apply(self, state, **kwargs):
        state.cleaned.remove(self.body)
        state.cooked.add(self.body)
        self.control()
        yield

    def control(self, **kwargs):
        # changeVisualShape
        # setDebugObjectColor
        # p.removeUserDebugItem # TODO: remove cleaned
        p.addUserDebugText('Cooked', textPosition=(0, 0, .5), textColorRGB=(1, 0, 0),  # textSize=1,
                           lifeTime=0, parentObjectUniqueId=self.body)
        # p.setDebugObjectColor(self.body, 0, objectDebugColorRGB=(1,0,0))

    def __repr__(self):
        return '{}({})'.format(self.__class__.__name__, self.body)


##################################################

def get_grasp_gen(problem, collisions=False, randomize=True):
    for grasp_type in problem.grasp_types:
        if grasp_type not in GET_GRASPS:
            raise ValueError('Unexpected grasp type:', grasp_type)

    def fn(body):
        # TODO: max_grasps
        # TODO: return grasps one by one
        grasps = []
        arm = 'left'
        # carry_conf = get_carry_conf(arm, 'top')
        if 'top' in problem.grasp_types:
            approach_vector = APPROACH_DISTANCE * get_unit_vector([1, 0, 0])
            grasps.extend(Grasp('top', body, g, multiply((approach_vector, unit_quat()), g), TOP_HOLDING_LEFT_ARM)
                          for g in get_top_grasps(body, grasp_length=GRASP_LENGTH))
        if 'side' in problem.grasp_types:
            approach_vector = APPROACH_DISTANCE * get_unit_vector([2, 0, -1])
            grasps.extend(Grasp('side', body, g, multiply((approach_vector, unit_quat()), g), SIDE_HOLDING_LEFT_ARM)
                          for g in get_side_grasps(body, grasp_length=GRASP_LENGTH))
        filtered_grasps = []
        for grasp in grasps:
            grasp_width = compute_grasp_width(problem.robot, arm, body, grasp.value) if collisions else 0.0
            if grasp_width is not None:
                grasp.grasp_width = grasp_width
                filtered_grasps.append(grasp)
        if randomize:
            random.shuffle(filtered_grasps)
        return [(g,) for g in filtered_grasps]
        # for g in filtered_grasps:
        #    yield (g,)

    return fn


##################################################

def accelerate_gen_fn(gen_fn, max_attempts=1):
    def new_gen_fn(*inputs):
        generator = gen_fn(*inputs)
        while True:
            for i in range(max_attempts):
                try:
                    output = next(generator)
                except StopIteration:
                    return
                if output is not None:
                    print(gen_fn.__name__, i)
                    yield output
                    break

    return new_gen_fn


def get_stable_gen(problem, collisions=True):
    obstacles = problem.fixed if collisions else []

    def gen(body, surface):
        # TODO: surface poses are being sampled in pr2_belief
        if surface is None:
            surfaces = problem.surfaces
        else:
            surfaces = [surface]
        while True:
            surface = random.choice(surfaces)
            body_pose = sample_placement(body, surface)
            if body_pose is None:
                break
            p = BodyPose(body, body_pose, surface)
            p.assign()
            if not any(pairwise_collision(body, obst) for obst in obstacles if obst not in {body, surface}):
                yield (p,)

    # TODO: apply the acceleration technique here
    return gen


##################################################

def iterate_approach_path(robot, arm, gripper, pose, grasp, body=None):
    root_link = link_from_name(robot, PR2_GRIPPER_ROOTS[arm])
    tool_link = link_from_name(robot, PR2_TOOL_FRAMES[arm])
    tool_from_root = multiply(invert(get_link_pose(robot, tool_link)),
                              get_link_pose(robot, root_link))
    grasp_pose = multiply(pose.value, invert(grasp.value))
    approach_pose = multiply(pose.value, invert(grasp.approach))
    for tool_pose in interpolate_poses(grasp_pose, approach_pose):
        set_pose(gripper, multiply(tool_pose, tool_from_root))
        if body is not None:
            set_pose(body, multiply(tool_pose, grasp.value))
        yield


def get_ir_sampler(scn, custom_limits={}, max_attempts=25, collisions=True, learned=True):
    robot = scn.pr2
    fixed_movable = scn.all_bodies
    gripper = scn.get_gripper()

    def gen_fn(arm, obj, pose, grasp):
        obstacles = list(set(fixed_movable) - {obj})
        pose.assign()
        approach_obstacles = {obst for obst in obstacles if (not is_placement(obj, obst))}
        for _ in iterate_approach_path(robot, arm, gripper, pose, grasp, body=obj):
            if any(pairwise_collision(gripper, b) or pairwise_collision(obj, b) for b in approach_obstacles):
                return
        gripper_pose = multiply(pose.value, invert(grasp.value))  # w_f_g = w_f_o * (g_f_o)^-1
        default_conf = arm_conf(arm, grasp.carry)
        arm_joints = get_arm_joints(robot, arm)
        base_joints = get_group_joints(robot, 'base')
        if learned:
            base_generator = learned_pose_generator(robot, gripper_pose, arm=arm, grasp_type=grasp.grasp_type)
        else:
            base_generator = uniform_pose_generator(robot, gripper_pose)
        lower_limits, upper_limits = get_custom_limits(robot, base_joints, custom_limits)
        while True:
            count = 0
            for base_conf in islice(base_generator, max_attempts):
                count += 1
                if not all_between(lower_limits, base_conf, upper_limits):
                    continue
                bq = Conf(robot, base_joints, base_conf)
                pose.assign()
                bq.assign()
                set_joint_positions(robot, arm_joints, default_conf)
                if any(pairwise_collision(robot, b) for b in obstacles + [obj]):
                    continue
                # print('IR attempts:', count)
                yield (bq,)
                break
            else:
                yield None

    return gen_fn


##################################################
class sdg_ik_arm_hanoi(object):
    counter = 0

    def __init__(self, scn, max_attempts=5, apply_rotation=False, custom_limits={}, collisions=True, teleport=False):

        self.msg_generator = None
        self.msg_obstacle = None

        self.arm_to_robot = scn.arm_to_robot

        self.teleport = teleport
        self.max_attempts = max_attempts

        self.fixed_movable = scn.all_bodies
        self.dict_arm = scn.dict_arm

        self.custom_limits = custom_limits

        self.dict_init_config = scn.dict_init_config
        self.apply_rotation = apply_rotation

        if is_ik_compiled():
            print('Using ikfast for inverse kinematics')
        else:
            print('Using pybullet for inverse kinematics')

    def search(self, input_tuple, seed=None):
        body, pose, _, grasp, _arm = input_tuple

        self.msg_yg = 1  # Collision distance
        self.msg_bi = True

        robot = self.arm_to_robot[_arm]
        arm = self.dict_arm[_arm]

        stp = False
        if _arm == "arm1":
            sdg_ik_arm_hanoi.counter += 1
            if sdg_ik_arm_hanoi.counter > 10:
                stp = True

        ee_link = get_gripper_link(robot, arm)
        arm_joints = get_arm_joints(robot, arm)

        # if arm == 'left':
        #     armbase_link_name = 'l_shoulder_pan_link'
        # else:
        #     armbase_link_name = 'r_shoulder_pan_link'
        #
        # armbase_link = link_from_name(robot, armbase_link_name)
        # armbase_pose = get_link_pose(robot, armbase_link)
        # draw_frame(tform_from_pose(multiply(Pose(point=(0, 0, 0.5)), armbase_pose)), life_time=0.5)
        #
        # v_oa = np.array(pose.value[0]) - np.array(armbase_pose[0])
        # a_oa = np.arctan2(v_oa[1], v_oa[0])
        # # Pose of the target object whose -x is pointing to the arm base
        # pose_oa = Pose(point=pose.value[0], euler=Euler(yaw=a_oa))
        # # draw_frame(tform_from_pose(pose_oa), life_time=0.5)
        # if self.apply_rotation:
        #     pose_oa = multiply(pose_oa, ((0, 0, 0), pose.value[1]))

        pose_oa = pose.value

        obstacles = list(set(self.fixed_movable) - {body})
        approach_obstacles = {obst for obst in obstacles if not is_placement_hanoi(body, obst)}
        gripper_pose = multiply(pose_oa, invert(grasp.value))  # w_f_g = w_f_o * (g_f_o)^-1
        draw_frame(tform_from_pose(gripper_pose), life_time=0.3)

        # approach_pose = multiply(grasp.approach, gripper_pose)
        approach_pose = multiply(pose_oa, invert(grasp.approach))
        # draw_frame(tform_from_pose(approach_pose), life_time=0.3)

        # tool_link = link_from_name(robot, PR2_TOOL_FRAMES[arm])
        # tool_pose = get_link_pose(robot, tool_link)
        # draw_frame(tform_from_pose(tool_pose), life_time=0.5)

        sample_fn = get_sample_fn(robot, arm_joints)

        default_conf = self.dict_init_config[_arm]

        pose.assign()
        open_arm(robot, arm, e=0.6)
        # close_arm(self.robot, arm)

        ik_found = False

        with LockRenderer():
            for i in range(self.max_attempts):
                temp_conf = sample_fn()
                # temp_conf = default_conf
                set_joint_positions(robot, arm_joints, temp_conf)  # default_conf | sample_fn()

                grasp_conf = pr2_inverse_kinematics(robot, arm, gripper_pose,
                                                    custom_limits=self.custom_limits)  # , upper_limits=USE_CURRENT)

                # nearby_conf=USE_CURRENT) # upper_limits=USE_CURRENT,
                is_collision = any(pairwise_collision(robot, b) for b in obstacles)

                if not ((grasp_conf is None) or is_collision):  # [obj]

                    if is_collision:
                        print('is_collision')
                    approach_conf = sub_inverse_kinematics(robot, arm_joints[0], ee_link, approach_pose,
                                                           custom_limits=self.custom_limits)
                    # approach_conf = inverse_kinematics(robot, arm_link, approach_pose)

                    if not ((approach_conf is None) or any(
                            pairwise_collision(robot, b) for b in obstacles + [body])):
                        # print('Approach IK failure', approach_conf)
                        # wait_for_user()
                        ik_found = True
                        break

        if not ik_found:
            with LockRenderer():
                set_joint_positions(robot, arm_joints, default_conf)
            print('IK failure: ', gripper_pose)
            return None

        approach_conf = get_joint_positions(robot, arm_joints)
        attachment = grasp.attachment(robot, arm)
        attachments = {attachment.child: attachment}

        # time.sleep(1)
        #
        # set_joint_positions(robot, arm_joints, grasp_conf)
        # time.sleep(1)
        #
        # set_joint_positions(robot, arm_joints, approach_conf)
        # time.sleep(1)

        if self.teleport:
            path = [default_conf, approach_conf, grasp_conf]
        else:
            resolutions = 0.05 ** np.ones(len(arm_joints))
            grasp_path = plan_direct_joint_motion(robot, arm_joints, grasp_conf, attachments=attachments.values(),
                                                  obstacles=approach_obstacles, self_collisions=SELF_COLLISIONS,
                                                  custom_limits=self.custom_limits, resolutions=resolutions / 2.)
            if grasp_path is None:
                print('Grasp path failure')
                with LockRenderer():
                    set_joint_positions(robot, arm_joints, default_conf)
                return None

            set_joint_positions(robot, arm_joints, default_conf)
            approach_path = plan_joint_motion(robot, arm_joints, approach_conf, attachments=attachments.values(),
                                              obstacles=obstacles, self_collisions=SELF_COLLISIONS,
                                              custom_limits=self.custom_limits, resolutions=resolutions,
                                              restarts=2, iterations=25, smooth=25)
            if approach_path is None:
                print('Approach path failure')
                with LockRenderer():
                    set_joint_positions(robot, arm_joints, default_conf)
                return None
            path = approach_path + grasp_path
        mt = create_trajectory(robot, arm_joints, path)
        cmd = Commands(State(attachments=attachments), savers=[BodySaver(robot)], commands=[mt])
        with LockRenderer():
            set_joint_positions(robot, arm_joints, default_conf)
        return (cmd,)

    def __call__(self, input_tuple, seed=None):
        result = self.search(input_tuple, seed=None)

        return result

    def get_error_message(self):
        return SDG_MSG(self.msg_generator, self.msg_obstacle, self.msg_yg, self.msg_bi)


class sdg_ik_arm(object):

    def __init__(self, scn, max_attempts=5, custom_limits={}, collisions=True, teleport=False):

        self.msg_generator = None
        self.msg_obstacle = None

        self.teleport = teleport
        self.max_attempts = max_attempts

        self.robot = scn.pr2
        self.fixed_movable = scn.all_bodies

        self.custom_limits = custom_limits

        if is_ik_compiled():
            print('Using ikfast for inverse kinematics')
        else:
            print('Using pybullet for inverse kinematics')

    def search(self, input_tuple, seed=None):
        arm, body, pose, grasp, base_conf = input_tuple

        self.msg_yg = 1  # Collision distance
        self.msg_bi = True

        obstacles = list(set(self.fixed_movable) - {body})
        approach_obstacles = {obst for obst in obstacles if not is_placement(body, obst)}
        gripper_pose = multiply(pose.value, invert(grasp.value))  # w_f_g = w_f_o * (g_f_o)^-1
        # draw_frame(tform_from_pose(gripper_pose), life_time=3)

        # approach_pose = multiply(grasp.approach, gripper_pose)
        approach_pose = multiply(pose.value, invert(grasp.approach))
        # draw_frame(tform_from_pose(approach_pose), life_time=3)

        arm_link = get_gripper_link(self.robot, arm)
        arm_joints = get_arm_joints(self.robot, arm)

        default_conf = arm_conf(arm, grasp.carry)

        # sample_fn = get_sample_fn(robot, arm_joints)
        # default_conf = arm_conf(arm, grasp.carry)
        pose.assign()
        base_conf.assign()
        open_arm(self.robot, arm)
        # close_arm(self.robot, arm)
        set_joint_positions(self.robot, arm_joints, default_conf)  # default_conf | sample_fn()
        grasp_conf = pr2_inverse_kinematics(self.robot, arm, gripper_pose,
                                            custom_limits=self.custom_limits)  # , upper_limits=USE_CURRENT)
        # nearby_conf=USE_CURRENT) # upper_limits=USE_CURRENT,
        if (grasp_conf is None) or any(pairwise_collision(self.robot, b) for b in obstacles):  # [obj]
            # print('Grasp IK failure', grasp_conf)
            # if grasp_conf is not None:
            #    print(grasp_conf)
            #    #wait_for_user()
            return None
        # approach_conf = pr2_inverse_kinematics(robot, arm, approach_pose, custom_limits=custom_limits,
        #                                       upper_limits=USE_CURRENT, nearby_conf=USE_CURRENT)
        approach_conf = sub_inverse_kinematics(self.robot, arm_joints[0], arm_link, approach_pose,
                                               custom_limits=self.custom_limits)
        if (approach_conf is None) or any(pairwise_collision(self.robot, b) for b in obstacles + [body]):
            # print('Approach IK failure', approach_conf)
            # wait_for_user()
            return None
        approach_conf = get_joint_positions(self.robot, arm_joints)
        attachment = grasp.attachment(self.robot, arm)
        attachments = {attachment.child: attachment}
        if self.teleport:
            path = [default_conf, approach_conf, grasp_conf]
        else:
            resolutions = 0.05 ** np.ones(len(arm_joints))
            grasp_path = plan_direct_joint_motion(self.robot, arm_joints, grasp_conf, attachments=attachments.values(),
                                                  obstacles=approach_obstacles, self_collisions=SELF_COLLISIONS,
                                                  custom_limits=self.custom_limits, resolutions=resolutions / 2.)
            if grasp_path is None:
                print('Grasp path failure')
                return None
            set_joint_positions(self.robot, arm_joints, default_conf)
            approach_path = plan_joint_motion(self.robot, arm_joints, approach_conf, attachments=attachments.values(),
                                              obstacles=obstacles, self_collisions=SELF_COLLISIONS,
                                              custom_limits=self.custom_limits, resolutions=resolutions,
                                              restarts=2, iterations=25, smooth=25)
            if approach_path is None:
                print('Approach path failure')
                return None
            path = approach_path + grasp_path
        mt = create_trajectory(self.robot, arm_joints, path)
        cmd = Commands(State(attachments=attachments), savers=[BodySaver(self.robot)], commands=[mt])
        return (cmd,)

    def __call__(self, input_tuple, seed=None):
        return self.search(input_tuple, seed=None)

    def get_error_message(self):
        return SDG_MSG(self.msg_generator, self.msg_obstacle, self.msg_yg, self.msg_bi)


##################################################

def get_ik_ir_gen(scn, max_attempts=25, learned=True, teleport=False, **kwargs):
    # TODO: compose using general fn
    ir_sampler = get_ir_sampler(scn, learned=learned, max_attempts=1, **kwargs)
    ik_fn = sdg_ik_arm(scn, max_attempts=1, teleport=teleport, **kwargs)

    def gen(*inputs):
        b, a, p, g = inputs
        ir_generator = ir_sampler(*inputs)
        attempts = 0
        while True:
            if max_attempts <= attempts:
                if not p.init:
                    return
                attempts = 0
                yield None
            attempts += 1
            try:
                ir_outputs = next(ir_generator)
            except StopIteration:
                return
            if ir_outputs is None:
                continue
            ik_outputs = ik_fn(*(inputs + ir_outputs))
            if ik_outputs is None:
                continue
            print('IK attempts:', attempts)
            yield ir_outputs + ik_outputs
            return
            # if not p.init:
            #    return

    return gen


##################################################

def get_motion_gen(problem, custom_limits={}, collisions=True, teleport=False):
    # TODO: include fluents
    robot = problem.robot
    saver = BodySaver(robot)
    obstacles = problem.fixed if collisions else []

    def fn(bq1, bq2):
        saver.restore()
        bq1.assign()
        if teleport:
            path = [bq1, bq2]
        elif is_drake_pr2(robot):
            raw_path = plan_joint_motion(robot, bq2.joints, bq2.values, attachments=[],
                                         obstacles=obstacles, custom_limits=custom_limits,
                                         self_collisions=SELF_COLLISIONS,
                                         restarts=4, iterations=50, smooth=50)
            if raw_path is None:
                print('Failed motion plan!')
                # set_renderer(True)
                # for bq in [bq1, bq2]:
                #    bq.assign()
                #    wait_for_user()
                return None
            path = [Conf(robot, bq2.joints, q) for q in raw_path]
        else:
            goal_conf = base_values_from_pose(bq2.value)
            raw_path = plan_base_motion(robot, goal_conf, BASE_LIMITS, obstacles=obstacles)
            if raw_path is None:
                print('Failed motion plan!')
                return None
            path = [Pose(robot, pose_from_base_values(q, bq1.value)) for q in raw_path]
        bt = Trajectory(path)
        cmd = Commands(State(), savers=[BodySaver(robot)], commands=[bt])
        return (cmd,)

    return fn


##################################################

def get_press_gen(problem, max_attempts=25, learned=True, teleport=False):
    robot = problem.robot
    fixed = get_fixed_bodies(problem)

    def gen(arm, button):
        fixed_wo_button = list(filter(lambda b: b != button, fixed))
        pose = get_pose(button)
        grasp_type = 'side'

        link = get_gripper_link(robot, arm)
        default_conf = get_carry_conf(arm, grasp_type)
        joints = get_arm_joints(robot, arm)

        presses = get_x_presses(button)
        approach = ((APPROACH_DISTANCE, 0, 0), unit_quat())
        while True:
            for _ in range(max_attempts):
                press_pose = random.choice(presses)
                gripper_pose = multiply(pose, invert(press_pose))  # w_f_g = w_f_o * (g_f_o)^-1
                # approach_pose = gripper_pose # w_f_g * g_f_o * o_f_a = w_f_a
                approach_pose = multiply(gripper_pose, invert(multiply(press_pose, approach)))

                if learned:
                    base_generator = learned_pose_generator(robot, gripper_pose, arm=arm, grasp_type=grasp_type)
                else:
                    base_generator = uniform_pose_generator(robot, gripper_pose)
                set_joint_positions(robot, joints, default_conf)
                set_pose(robot, next(base_generator))
                raise NotImplementedError('Need to change this')
                if any(pairwise_collision(robot, b) for b in fixed):
                    continue

                approach_movable_conf = sub_inverse_kinematics(robot, joints[0], link, approach_pose)
                # approach_movable_conf = inverse_kinematics(robot, link, approach_pose)
                if (approach_movable_conf is None) or any(pairwise_collision(robot, b) for b in fixed):
                    continue
                approach_conf = get_joint_positions(robot, joints)

                gripper_movable_conf = sub_inverse_kinematics(robot, joints[0], link, gripper_pose)
                # gripper_movable_conf = inverse_kinematics(robot, link, gripper_pose)
                if (gripper_movable_conf is None) or any(pairwise_collision(robot, b) for b in fixed_wo_button):
                    continue
                grasp_conf = get_joint_positions(robot, joints)
                bp = Pose(robot, get_pose(robot))  # TODO: don't use this

                if teleport:
                    path = [default_conf, approach_conf, grasp_conf]
                else:
                    control_path = plan_direct_joint_motion(robot, joints, approach_conf,
                                                            obstacles=fixed_wo_button, self_collisions=SELF_COLLISIONS)
                    if control_path is None: continue
                    set_joint_positions(robot, joints, approach_conf)
                    retreat_path = plan_joint_motion(robot, joints, default_conf,
                                                     obstacles=fixed, self_collisions=SELF_COLLISIONS)
                    if retreat_path is None: continue
                    path = retreat_path[::-1] + control_path[::-1]
                mt = Trajectory(Conf(robot, joints, q) for q in path)
                yield (bp, mt)
                break
            else:
                yield None

    return gen


#####################################

def control_commands(commands, **kwargs):
    user_input('Control?')
    disable_real_time()
    enable_gravity()
    for i, command in enumerate(commands):
        print(i, command)
        command.control(*kwargs)


class State(object):
    def __init__(self, attachments={}, cleaned=set(), cooked=set()):
        self.poses = {body: BodyPose(body, get_pose(body))
                      for body in get_bodies() if body not in attachments}
        self.grasps = {}
        self.attachments = attachments
        self.cleaned = cleaned
        self.cooked = cooked

    def assign(self):
        for attachment in self.attachments.values():
            # attach.attachment.assign()
            attachment.assign()


def apply_commands(state, commands, time_step=None, pause=False, **kwargs):
    # user_input('Apply?')
    for i, command in enumerate(commands):
        print(i, command)
        for j, _ in enumerate(command.apply(state, **kwargs)):
            state.assign()
            if j == 0:
                continue
            if time_step is None:
                wait_for_duration(1e-2)
                user_input('Command {}, Step {}) Next?'.format(i, j))
            else:
                wait_for_duration(time_step)
        if pause:
            wait_for_user()


#####################################

def get_target_point(conf):
    # TODO: use full body aabb
    robot = conf.body
    link = link_from_name(robot, 'torso_lift_link')
    # link = BASE_LINK
    # TODO: center of mass instead?
    # TODO: look such that cone bottom touches at bottom
    # TODO: the target isn't the center which causes it to drift
    with BodySaver(conf.body):
        conf.assign()
        lower, upper = get_aabb(robot, link)
        center = np.average([lower, upper], axis=0)
        point = np.array(get_group_conf(conf.body, 'base'))
        # point[2] = upper[2]
        point[2] = center[2]
        # center, _ = get_center_extent(conf.body)
        return point


def get_target_path(trajectory):
    # TODO: only do bounding boxes for moving links on the trajectory
    return [get_target_point(conf) for conf in trajectory.path]


#######################################################


class sdg_sample_place(object):
    def __init__(self, scn):
        self.all_bodies = scn.all_bodies
        self.msg_generator = None
        self.msg_obstacle = None

    def __call__(self, input_tuple, seed=None):
        self.msg_yg = -1  # Collision distance
        self.msg_bi = False

        body, surface = input_tuple
        others = list(set(self.all_bodies) - {body, surface})
        """1) Generation"""
        pose = sample_placement_seed(body, surface, seed)
        self.msg_generator = (pose is not None)
        """2) Validation"""
        list_collision_obstacle = []
        for b in others:
            if pairwise_collision(body, b):
                list_collision_obstacle.append(b)

                c_dist = collision_dist(body, b)
                if c_dist and c_dist > self.msg_yg:
                    self.msg_yg = c_dist

        if list_collision_obstacle:
            self.msg_obstacle = max(list_collision_obstacle, key=list_collision_obstacle.count)
        if (pose is None) or list_collision_obstacle:
            return None

        body_pose = BodyPose(body, pose)
        return (body_pose,)  # return a tuple

    def get_error_message(self):
        return SDG_MSG(self.msg_generator, self.msg_obstacle, self.msg_yg, self.msg_bi)


class sdg_sample_place_hanoi(object):
    def __init__(self, scn):
        self.all_bodies = scn.all_bodies
        self.msg_generator = None
        self.msg_obstacle = None

    def __call__(self, input_tuple, seed=None):
        self.msg_yg = -1  # Collision distance
        self.msg_bi = False

        body, bottom_body, pose_bottom = input_tuple
        others = list(set(self.all_bodies) - {body, bottom_body})
        """1) Generation"""
        point = get_placement_point_hanoi(bottom_body)
        if seed is None:
            a = np.random.uniform(0, 1)
        else:
            a = np.array([seed]).flatten()[0]

        # pose0 = get_pose(body)

        # pose = multiply((point, pose0[1]), )
        pose = Pose(point=point)
        #
        # incr_Ori = Pose(euler=Euler(yaw=2. * np.pi * (a - 0.5)))[1]
        # pose = (point, incr_Ori)

        set_pose(body, pose)

        self.msg_generator = (pose is not None)
        """2) Validation"""
        list_collision_obstacle = []
        for b in others:
            if pairwise_collision(body, b):
                list_collision_obstacle.append(b)

                c_dist = collision_dist(body, b)
                if c_dist and c_dist > self.msg_yg:
                    self.msg_yg = c_dist

        if list_collision_obstacle:
            self.msg_obstacle = max(list_collision_obstacle, key=list_collision_obstacle.count)
        if (pose is None) or list_collision_obstacle:
            return None

        body_pose = BodyPose(body, pose)
        return (body_pose,)  # return a tuple

    def get_error_message(self):
        return SDG_MSG(self.msg_generator, self.msg_obstacle, self.msg_yg, self.msg_bi)


class sdg_sample_grasp(object):
    def __init__(self, scn):
        self.robot, self.arm, self.grasp_type = scn.pr2, scn.arms[0], scn.grasp_type

    def search(self, input_tuple, seed=None):
        """return the ee_frame wrt the measure_frame of the object"""
        body, = input_tuple  # grasp_dir defined in ellipsoid_frame of the body

        grasps = []

        if 'top' == self.grasp_type:
            approach_vector = APPROACH_DISTANCE * get_unit_vector([1, 0, 0])
            grasps.extend(Grasp('top', body, g, multiply((approach_vector, unit_quat()), g), TOP_HOLDING_LEFT_ARM)
                          for g in get_top_grasps(body, grasp_length=GRASP_LENGTH))
        if 'side' == self.grasp_type:
            approach_vector = APPROACH_DISTANCE * get_unit_vector([2, 0, -1])
            grasps.extend(Grasp('side', body, g, multiply((approach_vector, unit_quat()), g), SIDE_HOLDING_LEFT_ARM)
                          for g in get_side_grasps(body, grasp_length=GRASP_LENGTH))
        filtered_grasps = []
        for grasp in grasps:
            grasp_width = 0.0
            if grasp_width is not None:
                grasp.grasp_width = grasp_width
                filtered_grasps.append(grasp)

        random.shuffle(filtered_grasps)
        body_grasp = filtered_grasps[0]

        return (body_grasp,)  # return a tuple

    def __call__(self, input_tuple, seed=None):
        return self.search(input_tuple, seed=None)


class sdg_sample_grasp_hanoi(object):
    def __init__(self, scn):
        self.grasp_type = scn.grasp_type

        self.dict_arm = scn.dict_arm
        assert self.grasp_type == "side"

    def search(self, input_tuple, seed=None):
        """return the ee_frame wrt the measure_frame of the object"""
        body, pose1, pose2, arm = input_tuple  # grasp_dir defined in ellipsoid_frame of the body

        approach_vector = 0.065 * get_unit_vector([0, 0, -1])

        if self.dict_arm[arm] == 'left':
            side_holding = SIDE_HOLDING_LEFT_ARM
        else:
            side_holding = SIDE_HOLDING_RIGHT_ARM

        tool_pose = Pose(euler=Euler(pitch=np.pi / 2))
        body_pose = unit_pose()
        top_offset = 0.03
        grasp_length = 0.02

        center, (w, l, h) = approximate_as_prism(body, body_pose=body_pose)
        translate_center = Pose(point=point_from_pose(body_pose) - center)
        x_offset = h / 2 - top_offset

        if seed is None:
            a = np.random.uniform(0, 1)
        else:
            a = np.array([seed]).flatten()[0]
            assert 0 <= a <= 1

        # if arm == 'arm1':
        #     a = a * (0.62 - 0.37) + 0.37
        # if arm == 'arm2':
        #     a = a * (0.98 - 0.68) + 0.68

        swap_xz = Pose(euler=[0, -math.pi / 2, 0])
        translate_z = Pose(point=[x_offset, 0, l / 2 - grasp_length])
        rotate_z = Pose(euler=[2. * math.pi * (a - 0.5), 0, 0])

        g = multiply(tool_pose, translate_z, rotate_z, swap_xz,
                     translate_center, body_pose)  # , np.array([w])

        body_grasp = Grasp('side', body, g, multiply((approach_vector, unit_quat()), g), side_holding)
        return (body_grasp,)  # return a tuple

    def __call__(self, input_tuple, seed=None):
        return self.search(input_tuple, seed=seed)


class sdg_sample_arm(object):
    """conditional generator"""
    def __init__(self, scn):
        self.arm_to_robot = scn.arm_to_robot
        self.peg_pos = scn.peg_pos

    def __call__(self, input_tuple, seed=None):
        body, pose1, pose2 = input_tuple

        list_available = ['arm0', 'arm1', 'arm2']
        if seed is None:
            idx = random.sample([0, 1, 2], 1)[0]
        else:
            idx = np.array([seed]).flatten()[0]
        arm = list_available[int(idx)]
        # arm = 'arm0'

        pos1 = self.peg_pos[tuple(pose1.value[0][:2])]
        pos2 = self.peg_pos[tuple(pose2.value[0][:2])]

        # arm = random.sample(list_available, 1)[0]
        #
        if (pos1 == 'peg1' and pos2 == 'peg2') or (
                pos1 == 'peg2' and pos2 == 'peg1'):
            arm = 'arm0'
        elif (pos1 == 'peg2' and pos2 == 'peg3') or (
                pos1 == 'peg3' and pos2 == 'peg2'):
            arm = 'arm1'
        elif (pos1 == 'peg1' and pos2 == 'peg3') or (
                pos1 == 'peg3' and pos2 == 'peg1'):
            arm = 'arm0'

        arm = 'arm0'

        return (arm,)


class sdg_ir_ik_grasp(object):
    def __init__(self, scn, max_attempts=5, learned=True, teleport=False, **kwargs):
        self.max_attempts = max_attempts

        self.ir_sampler = get_ir_sampler(scn, learned=learned, max_attempts=1, **kwargs)
        self.ik_fn = sdg_ik_arm(scn, teleport=teleport, **kwargs)

        self.msg_generator = None
        self.msg_obstacle = None

    def search(self, input_tuple, seed=None):
        b, a, p, g = input_tuple
        ir_generator = self.ir_sampler(*input_tuple)
        attempts = 0

        self.msg_yg = 1  # Collision distance
        self.msg_bi = True

        for i in range(self.max_attempts):
            try:
                ir_outputs = next(ir_generator)
            except StopIteration:
                return None
            if ir_outputs is None:
                continue
            ik_outputs = self.ik_fn(input_tuple + ir_outputs, seed)
            if ik_outputs is None:
                continue
            # print('IK attempts:', attempts)
            result = ir_outputs + ik_outputs
            self.msg_yg = 0
            return result

        return None

    def __call__(self, input_tuple, seed=None):
        return self.search(input_tuple, seed=None)

    def get_error_message(self):
        return SDG_MSG(self.msg_generator, self.msg_obstacle, self.msg_yg, self.msg_bi)


class sdg_motion_base_joint(object):
    def __init__(self, scn, max_attempts=25, custom_limits={}, teleport=False, **kwargs):
        self.max_attempts = max_attempts
        self.teleport = teleport
        self.custom_limits = custom_limits

        self.robot = scn.pr2
        self.obstacles = list(set(scn.env_bodies) | set(scn.regions))

        self.saver = BodySaver(self.robot)

    def search(self, input_tuple, seed=None):
        bq1, bq2 = input_tuple
        self.saver.restore()
        bq1.assign()

        for i in range(self.max_attempts):
            if self.teleport:
                path = [bq1, bq2]
            elif is_drake_pr2(self.robot):
                raw_path = plan_joint_motion(self.robot, bq2.joints, bq2.values, attachments=[],
                                             obstacles=self.obstacles, custom_limits=self.custom_limits,
                                             self_collisions=SELF_COLLISIONS,
                                             restarts=4, iterations=50, smooth=50)
                if raw_path is None:
                    print('Failed motion plan!')
                    continue
                path = [Conf(self.robot, bq2.joints, q) for q in raw_path]
            else:
                goal_conf = base_values_from_pose(bq2.value)
                raw_path = plan_base_motion(self.robot, goal_conf, BASE_LIMITS, obstacles=self.obstacles)
                if raw_path is None:
                    print('Failed motion plan!')
                    continue
                path = [BodyPose(self.robot, pose_from_base_values(q, bq1.value)) for q in raw_path]
            bt = Trajectory(path)
            cmd = Commands(State(), savers=[BodySaver(self.robot)], commands=[bt])
            return (cmd,)
        return None

    def __call__(self, input_tuple, seed=None):
        return self.search(input_tuple, seed=None)

#######################################################
