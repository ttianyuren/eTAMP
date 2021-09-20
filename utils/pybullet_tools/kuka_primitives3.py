import time
# dump_body(robot)
from .pr2_utils import get_top_grasps, get_side_grasps, get_sucker_grasps2, get_sucker_grasp_top, \
    get_top_cylinder_grasps
from .utils import get_pose, set_pose, get_movable_joints, \
    set_joint_positions, add_fixed_constraint, enable_real_time, disable_real_time, joint_controller, \
    enable_gravity, get_refine_fn, user_input, Attachment, wait_for_duration, link_from_name, get_body_name, \
    sample_placement, \
    sample_placement_seed, \
    end_effector_from_body, approach_from_grasp, plan_joint_motion, GraspInfo, Pose, INF, Point, \
    inverse_kinematics, pairwise_collision, remove_fixed_constraint, get_sample_fn, \
    step_simulation, refine_path, plan_direct_joint_motion, get_joint_positions, dump_world, \
    get_distance, get_links, get_links_movement, get_unit_vector, unit_quat, multiply, get_link_pose, tform_from_pose, \
    add_line, get_joint_info, invert, get_detection_cone, create_mesh, apply_alpha, GREEN, RED, attach_viewcone, \
    collision_dist, control_joints

from utils.pybullet_tools.body_utils import *
from utils.pybullet_tools.utils import SDG_MSG

import random
import numpy as np
import pybullet as p

GRASP_INFO = {
    'top': GraspInfo(lambda body: get_top_grasps(body, under=True, tool_pose=Pose(), max_width=INF, grasp_length=0),
                     approach_pose=Pose(0.1 * Point(z=1))),
}

DEBUG_FAILURE = False

DISABLED_COLLISION_PAIR = {(5, 7)}

MAX_DISTANCE = -0.0

GRASP_DIR = {0: (1., 0., 0.), 1: (0., 1., 0.), 2: (0., 0., 1.), 3: (-1., 0., 0.), 4: (0., -1., 0.)}


##################################################

class BodyPose(object):
    def __init__(self, body, pose=None):
        if pose is None:
            pose = get_pose(body)
        self.body = body
        self.pose = pose

    def assign(self):
        set_pose(self.body, self.pose)
        return self.pose

    def get_modified_version(self, d_xyz_rpy):
        m_pose = Pose(d_xyz_rpy[0:3], d_xyz_rpy[3:6])
        new_pose = multiply(m_pose, self.pose)
        return BodyPose(self.body, new_pose)

    def __repr__(self):
        return 'p{}'.format(id(self) % 1000)


class BodyGrasp(object):
    def __init__(self, body, grasp_pose, approach_pose, robot, attach_link):
        self.body = body
        self.grasp_pose = grasp_pose  # ee_frame in the measure_frame of the body
        self.approach_pose = approach_pose
        self.robot = robot
        self.link = attach_link

    # def constraint(self):
    #    grasp_constraint()
    def attachment(self):
        attach_pose = invert(self.grasp_pose)  # measure_frame in the ee_frame
        return Attachment(self.robot, self.link, attach_pose, self.body)

    def assign(self):
        return self.attachment().assign()

    def __repr__(self):
        return 'g{}'.format(id(self) % 1000)


def grasp_dir_o2e(direction_o, robot, body, pose, body_info):
    ellipsoid_frame, _, _, _, _ = get_ellipsoid_frame(body, body_info, robot)
    object_frame = tform_from_pose(pose)
    dirVector_world = np.dot(object_frame[:3, :3], np.array(GRASP_DIR[int(direction_o)]))
    dirVector_ellipsoid = np.dot(np.linalg.inv(ellipsoid_frame[:3, :3]), dirVector_world)
    best_match = -1
    direction_e = None
    for dirc, vec in GRASP_DIR.items():
        match = np.dot(dirVector_ellipsoid, np.array(vec))
        if match > best_match:
            direction_e = dirc
            best_match = match
    return int(direction_e)


def grasp_dir_e2o(direction_e, robot, body, pose, body_info):
    ellipsoid_frame, _, _, _, _ = get_ellipsoid_frame(body, body_info, robot)
    object_frame = tform_from_pose(pose)
    dirVector_world = np.dot(ellipsoid_frame[:3, :3], np.array(GRASP_DIR[int(direction_e)]))
    dirVector_object = np.dot(np.linalg.inv(object_frame[:3, :3]), dirVector_world)
    best_match = -1
    direction_o = None
    for dirc, vec in GRASP_DIR.items():
        match = np.dot(dirVector_object, np.array(vec))
        if match > best_match:
            direction_o = dirc
            best_match = match
    return int(direction_o)


class trans_grasp_dir(object):
    def __init__(self, body, pose, robot, dic_body_info):
        self.body = body
        self.pose = pose
        self.robot = robot
        self.body_info = dic_body_info[body]
        self.ellipsoid_frame, self.obj_extent, _, _, _ = get_ellipsoid_frame(body, self.body_info,
                                                                             self.robot)

    def o2e(self, direction_o):
        object_frame = tform_from_pose(self.pose.pose)
        dirVector_world = np.dot(object_frame[:3, :3], np.array(GRASP_DIR[int(direction_o)]))
        dirVector_ellipsoid = np.dot(np.linalg.inv(self.ellipsoid_frame[:3, :3]), dirVector_world)
        best_match = -1
        direction_e = None
        for dirc, vec in GRASP_DIR.items():
            match = np.dot(dirVector_ellipsoid, np.array(vec))
            if match > best_match:
                direction_e = dirc
                best_match = match
        return int(direction_e)


class GraspDirection(object):
    def __init__(self, body, pose, direction, robot, dic_body_info):
        if isinstance(body, tuple):
            body = body[0]
        self.body = body
        self.pose = pose
        self.direction = direction  # in ellipsoid frame
        self.robot = robot
        self.body_info = dic_body_info[body]
        self.ellipsoid_frame, self.obj_extent, _, _, _ = get_ellipsoid_frame(body, self.body_info,
                                                                             self.robot)

        self.direction_o = self.ellipsoid_to_object(self.direction)

    def object_to_ellipsoid(self, direction_o):
        object_frame = tform_from_pose(self.pose.pose)
        dirVector_world = np.dot(object_frame[:3, :3], np.array(GRASP_DIR[int(direction_o)]))
        dirVector_ellipsoid = np.dot(np.linalg.inv(self.ellipsoid_frame[:3, :3]), dirVector_world)
        best_match = -1
        direction_e = None
        for dirc, vec in GRASP_DIR.items():
            match = np.dot(dirVector_ellipsoid, np.array(vec))
            if match > best_match:
                direction_e = dirc
                best_match = match
        return int(direction_e)

    def ellipsoid_to_object(self, direction_e):
        object_frame = tform_from_pose(self.pose.pose)
        dirVector_world = np.dot(self.ellipsoid_frame[:3, :3], np.array(GRASP_DIR[int(direction_e)]))
        dirVector_object = np.dot(np.linalg.inv(object_frame[:3, :3]), dirVector_world)
        best_match = -1
        direction_o = None
        for dirc, vec in GRASP_DIR.items():
            match = np.dot(dirVector_object, np.array(vec))
            if match > best_match:
                direction_o = dirc
                best_match = match
        return int(direction_o)

    def __repr__(self):
        return 'gd{}'.format(id(self) % 1000)


class BodyConf(object):
    def __init__(self, body, configuration=None, joints=None):
        if joints is None:
            joints = get_movable_joints(body)
        if configuration is None:
            configuration = get_joint_positions(body, joints)
        self.body = body
        self.joints = joints
        self.configuration = configuration

    def assign(self):
        set_joint_positions(self.body, self.joints, self.configuration)
        return self.configuration

    def __repr__(self):
        return 'q{}'.format(id(self) % 1000)


class BodyPath(object):
    def __init__(self, body, path, joints=None, attachments=[]):
        if joints is None:
            joints = get_movable_joints(body)
        self.body = body  # robot
        self.path = path
        self.joints = joints
        self.attachments = attachments

    def bodies(self):
        return set([self.body] + [attachment.body for attachment in self.attachments])

    def iterator(self):
        # TODO: compute and cache these
        # TODO: compute bounding boxes as well
        for i, configuration in enumerate(self.path):
            set_joint_positions(self.body, self.joints, configuration)
            for grasp in self.attachments:
                grasp.assign()
            yield i

    def control0(self, real_time=False, dt=0):
        # TODO: just waypoints
        if real_time:
            enable_real_time()
        else:
            disable_real_time()
        for i, values in enumerate(self.path):
            for _ in joint_controller(self.body, self.joints, values):
                enable_gravity()
                if not real_time:
                    step_simulation()
                time.sleep(dt)

    def control(self, real_time=True, dt=0):
        # TODO: just waypoints
        if real_time:
            enable_real_time()
        else:
            disable_real_time()
        for i, values in enumerate(self.path):
            control_joints(self.body, self.joints, values)
            enable_gravity()
            if not real_time:
                step_simulation()
            time.sleep(dt)

    # def full_path(self, q0=None):
    #     # TODO: could produce sequence of savers
    def refine(self, num_steps=0):
        return self.__class__(self.body, refine_path(self.body, self.joints, self.path, num_steps), self.joints,
                              self.attachments)

    def reverse(self):
        return self.__class__(self.body, self.path[::-1], self.joints, self.attachments)

    def distance(self):
        """
        Return the trip summed up with of each selected link during the path.
        """
        robot = self.body
        total = 0.
        for q1, q2 in zip(self.path, self.path[1:]):
            # total += distance_fn(q1.values, q2.values)
            links = list(get_links(robot))
            total += get_links_movement(robot, links[3:9], q1, q2)

        return total

    def __repr__(self):
        return '{}({},{},{},{})'.format(self.__class__.__name__, self.body, len(self.joints), len(self.path),
                                        len(self.attachments))


##################################################

class ApplyForce(object):
    def __init__(self, body, robot, link):
        self.body = body
        self.robot = robot
        self.link = link

    def bodies(self):
        return {self.body, self.robot}

    def iterator(self, **kwargs):
        return []

    def refine(self, **kwargs):
        return self

    def __repr__(self):
        return '{}({},{})'.format(self.__class__.__name__, self.robot, self.body)


class Attach(ApplyForce):
    def control(self, **kwargs):
        # TODO: store the constraint_id?
        # return
        add_fixed_constraint(self.body, self.robot, self.link)

    def reverse(self):
        return Detach(self.body, self.robot, self.link)


class Detach(ApplyForce):
    def control(self, **kwargs):
        remove_fixed_constraint(self.body, self.robot, self.link)

    def reverse(self):
        return Attach(self.body, self.robot, self.link)


class Command(object):
    def __init__(self, body_paths):
        self.body_paths = body_paths

    # def full_path(self, q0=None):
    #     if q0 is None:
    #         q0 = Conf(self.tree)
    #     new_path = [q0]
    #     for partial_path in self.body_paths:
    #         new_path += partial_path.full_path(new_path[-1])[1:]
    #     return new_path

    def step(self):
        for i, body_path in enumerate(self.body_paths):
            for j in body_path.iterator():
                msg = '{},{}) step?'.format(i, j)
                user_input(msg)
                # print(msg)

    def execute(self, time_step=0.05):
        for i, body_path in enumerate(self.body_paths):
            for j in body_path.iterator():
                # time.sleep(time_step)
                wait_for_duration(time_step)

    def control(self, real_time=False, dt=0):  # TODO: real_time
        for body_path in self.body_paths:
            body_path.control(real_time=real_time, dt=dt)

    def refine(self, **kwargs):
        return self.__class__([body_path.refine(**kwargs)
                               for body_path in self.body_paths])

    def reverse(self):
        return self.__class__([body_path.reverse() for body_path in reversed(self.body_paths)])

    def __repr__(self):
        return 'c{}'.format(id(self) % 1000)


class Register(object):
    _duration = 1.0

    def __init__(self, camera, body):
        self.camera = camera
        self.body = body

    def control(self, **kwargs):
        # TODO: filter for target object and location?
        self.iterator()

    def refine(self, **kwargs):
        return self

    def apply(self, lifeTime=2):
        mesh, view_pose = get_detection_cone(self.camera, self.body)

        cone = create_mesh(mesh, color=apply_alpha(GREEN, 0.5), allow_collision=False)
        set_pose(cone, get_pose(self.camera))
        wait_for_duration(lifeTime)
        remove_body(cone)
        # yield

    def iterator(self, lifeTime=2):
        cone_life = lifeTime * 0.7

        mesh, view_pose = get_detection_cone(self.camera, self.body)
        attach_viewcone(self.camera, depth=1.5, lifetime=lifeTime)
        wait_for_duration(lifeTime - cone_life)
        cone = create_mesh(mesh, color=apply_alpha(RED, 0.3), allow_collision=False)
        set_pose(cone, get_pose(self.camera))
        wait_for_duration(cone_life)
        remove_body(cone)
        yield

    def show(self):
        mesh, view_pose = get_detection_cone(self.camera, self.body)

        cone = create_mesh(mesh, color=apply_alpha(GREEN, 0.5), allow_collision=False)
        set_pose(cone, get_pose(self.camera))


#######################################################


class sdg_sample_place(object):
    def __init__(self, all_bodies=[]):
        self.all_bodies = all_bodies
        self.msg_generator = None
        self.msg_obstacle = None

    def __call__(self, input_tuple, seed=None):
        self.msg_yg = 0  # Collision distance
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


class sdg_measure_pose(object):
    def __init__(self, all_bodies=[]):
        self.all_bodies = all_bodies

    def __call__(self, input_tuple, seed=None):
        body, sensor = input_tuple

        pose = get_pose(body)

        body_pose = BodyPose(body, pose)
        return (body_pose,)  # return a tuple


class sdg_sample_stack(object):
    def __init__(self, all_bodies=[]):
        self.all_bodies = all_bodies
        self.msg_generator = None
        self.msg_obstacle = None

    def __call__(self, input_tuple, seed=None):
        self.msg_yg = 0  # Collision distance
        self.msg_bi = False

        body, surface, surface_pose = input_tuple
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

        self.msg_obstacle = max(list_collision_obstacle, key=list_collision_obstacle.count)
        if (pose is None) or (not list_collision_obstacle):
            return None

        body_pose = BodyPose(body, pose)
        return (body_pose,)  # return a tuple

    def get_error_message(self):
        return SDG_MSG(self.msg_generator, self.msg_obstacle, self.msg_yg, self.msg_bi)


class sdg_sample_grasp_dir(object):
    def __init__(self, robot, dic_body_info):
        self.robot = robot
        self.dic_body_info = dic_body_info

    def __call__(self, input_tuple, seed=None):
        body, pose = input_tuple

        list_available = [0, 1, 2, 3, 4]
        if seed is None:
            idx = random.sample(list_available, 1)[0]
        else:
            idx = np.array([seed]).flatten()[0]

        direction = list_available[int(idx)]

        return (GraspDirection(body, pose, direction, self.robot, self.dic_body_info),)


class sdg_sample_grasp0(object):
    def __init__(self, robot):
        self.robot = robot
        self.end_effector_link = link_from_name(robot, TOOL_FRAMES[get_body_name(robot)])

    def __call__(self, input_tuple, seed=None):
        body, grasp_dir = input_tuple

        assert body == grasp_dir.body

        list_available = [0, 1, 2, 3, 4]

        grasp_poses = get_sucker_grasps2(body, direction=grasp_dir.direction, under=True, tool_pose=Pose(),
                                         grasp_length=0)  # 0,3,4
        grasp_pose = random.sample(grasp_poses, 1)[0]

        approach_pose = Pose(0.1 * Point(z=-1))  # pose bias wrt end-effector frame
        body_grasp = BodyGrasp(body, grasp_pose, approach_pose, self.robot, self.end_effector_link)
        return (body_grasp,)  # return a tuple


class sdg_sample_grasp(object):
    def __init__(self, robot):
        self.robot = robot
        self.end_effector_link = link_from_name(robot, TOOL_FRAMES[get_body_name(robot)])

    def search(self, input_tuple, seed=None):
        """return the ee_frame wrt the object_frame of the object"""
        body, pose, grasp_dir = input_tuple  # grasp_dir defined in ellipsoid_frame of the body

        assert body == grasp_dir.body
        ellipsoid_frame, obj_extent, direction = grasp_dir.ellipsoid_frame, grasp_dir.obj_extent, grasp_dir.direction

        ex, ey, ez = obj_extent

        translate_z = Pose(point=[0, 0, -0.001])
        list_grasp = []
        if direction == 0:
            """ee at +X of the ellipsoid_frame"""
            swap_z = Pose(euler=[0, -np.pi / 2, 0])  # direct +z to -x
            # translate_point: choose from the grasping surface with 2 dof
            d1, d2 = 0., 0.  # [-0.5, 0.5]
            translate_point = Pose(point=[ex / 2, 0 + d1 * ey, ez / 2 + d2 * ez])
            for j in range(2):
                rotate_z = Pose(euler=[0, 0, j * np.pi])  # gripper open with +Y direction
                grasp = multiply(translate_point, swap_z, rotate_z, translate_z)
                list_grasp.append(grasp)

        elif direction == 1:
            """ee at +Y"""
            swap_z = Pose(euler=[np.pi / 2, 0, 0])  # direct +z to -y
            d1, d2 = 0., 0.  # [-0.5, 0.5]
            translate_point = Pose(point=[0 - d1 * ex, ey / 2, ez / 2 + d2 * ez])
            for j in range(2):
                rotate_z = Pose(euler=[0, 0, j * np.pi + np.pi / 2])
                grasp = multiply(translate_point, swap_z, rotate_z, translate_z)
                list_grasp.append(grasp)

        elif direction == 2:
            """ee at +Z"""
            swap_z = Pose(euler=[0, np.pi, 0])  # direct +z to -z
            d1, d2 = 0., 0.  # [-0.5, 0.5]
            translate_point = Pose(point=[0 - d2 * ex, 0 + d1 * ey, ez])
            for j in range(4):
                rotate_z = Pose(euler=[0, 0, j * np.pi / 2])
                grasp = multiply(translate_point, swap_z, rotate_z, translate_z)
                list_grasp.append(grasp)

        elif direction == 3:
            """ee at -X"""
            swap_z = Pose(euler=[0, np.pi / 2, 0])
            d1, d2 = 0., 0.  # [-0.5, 0.5]
            translate_point = Pose(point=[-ex / 2, 0 - d1 * ey, ez / 2 + d2 * ez])
            for j in range(2):
                rotate_z = Pose(euler=[0, 0, j * np.pi + np.pi])
                grasp = multiply(translate_point, swap_z, rotate_z, translate_z)
                list_grasp.append(grasp)

        elif direction == 4:
            """ee at -Y"""
            swap_z = Pose(euler=[-np.pi / 2, 0, 0])
            d1, d2 = 0., 0.  # [-0.5, 0.5]
            translate_point = Pose(point=[0 + d1 * ex, -ey / 2, ez / 2 + d2 * ez])
            for j in range(2):
                rotate_z = Pose(euler=[0, 0, j * np.pi - np.pi / 2])
                grasp = multiply(translate_point, swap_z, rotate_z, translate_z)
                list_grasp.append(grasp)

        """ee_frame wrt ellipsoid_frame"""
        grasp_pose = random.sample(list_grasp, 1)[0]
        """ee_frame wrt object_frame: get_pose()"""
        grasp_pose = multiply(invert(get_pose(body)), pose_from_tform(ellipsoid_frame), grasp_pose)

        approach_pose = Pose(0.1 * Point(z=-1))  # pose bias wrt end-effector frame
        body_grasp = BodyGrasp(body, grasp_pose, approach_pose, self.robot, self.end_effector_link)
        return (body_grasp,)  # return a tuple

    def __call__(self, input_tuple, seed=None):
        return self.search(input_tuple, seed=None)


class sdg_ik_grasp(object):
    def __init__(self, robot, all_bodies=[], teleport=False, num_attempts=5):
        self.all_bodies = all_bodies
        self.teleport = teleport
        self.num_attempts = num_attempts
        self.movable_joints = get_movable_joints(robot)
        self.sample_fn = get_sample_fn(robot, self.movable_joints)
        self.robot = robot
        self.visualization_collision = False
        self.max_distance = MAX_DISTANCE

    def search(self, input_tuple, seed=None):
        body, pose, grasp = input_tuple  # pose is measured by get_pose()

        self.msg_yg = 0  # Collision distance of IK error
        self.msg_generator = False
        self.msg_obstacle = None
        self.msg_bi = False

        set_pose(body, pose.pose)

        obstacles = self.all_bodies

        grasp_pose_ee = multiply(pose.pose, grasp.grasp_pose)  # in world frame
        approach_pose_ee = multiply(grasp_pose_ee, grasp.approach_pose)  # 右乘,以当前ee坐标系为基准进行变换

        list_q_approach = []
        list_q_grasp = []
        list_command_approach = []
        list_collision_obstacle = []

        for _ in range(self.num_attempts):
            sampled_conf = self.sample_fn()
            set_joint_positions(self.robot, self.movable_joints, sampled_conf)  # Random seed

            q_approach = inverse_kinematics(self.robot, grasp.link, approach_pose_ee)
            if not q_approach:
                point, quat = get_link_pose(self.robot, grasp.link)
                target_point, target_quat = approach_pose_ee
                error_dist = np.linalg.norm(np.array(point) - np.array(target_point)) + np.linalg.norm(
                    np.array(quat) - np.array(target_quat))
                if error_dist > self.msg_yg:
                    self.msg_yg = error_dist

            q_grasp = inverse_kinematics(self.robot, grasp.link, grasp_pose_ee)
            if not q_grasp:
                point, quat = get_link_pose(self.robot, grasp.link)
                target_point, target_quat = grasp_pose_ee
                error_dist = np.linalg.norm(np.array(point) - np.array(target_point)) + np.linalg.norm(
                    np.array(quat) - np.array(target_quat))
                if error_dist > self.msg_yg:
                    self.msg_yg = error_dist

            if q_approach and q_grasp:
                """If it is reachable"""
                self.msg_generator = True
                list_q_approach.append(q_approach)
                list_q_grasp.append(q_grasp)
                set_joint_positions(self.robot, self.movable_joints, q_approach)
                no_collision = True
                for b in obstacles:
                    if pairwise_collision(self.robot, b,
                                          visualization=self.visualization_collision,
                                          max_distance=self.max_distance):
                        no_collision = False
                        list_collision_obstacle.append(b)
                        c_dist = collision_dist(self.robot, b,
                                                visualization=self.visualization_collision,
                                                max_distance=self.max_distance)
                        if c_dist and c_dist > self.msg_yg:
                            self.msg_yg = c_dist
                set_joint_positions(self.robot, self.movable_joints, q_grasp)
                for b in obstacles:
                    if pairwise_collision(self.robot, b,
                                          visualization=self.visualization_collision,
                                          max_distance=self.max_distance):
                        no_collision = False
                        list_collision_obstacle.append(b)
                        c_dist = collision_dist(self.robot, b,
                                                visualization=self.visualization_collision,
                                                max_distance=self.max_distance)
                        if c_dist and c_dist > self.msg_yg:
                            self.msg_yg = c_dist
                command = None
                approach_conf = None
                if no_collision:
                    """If there is no collision"""
                    approach_conf = BodyConf(self.robot, q_approach)
                    if self.teleport:
                        path = [q_approach, q_grasp]
                    else:
                        approach_conf.assign()
                        # The path from q_approach to q_grasp.
                        path = plan_direct_joint_motion(self.robot, approach_conf.joints, q_grasp,
                                                        obstacles=obstacles,
                                                        disabled_collisions=DISABLED_COLLISION_PAIR,
                                                        max_distance=self.max_distance)
                        if path:
                            command = Command([BodyPath(self.robot, path),
                                               Attach(body, self.robot, grasp.link),
                                               BodyPath(self.robot, path[::-1], attachments=[grasp])])
                list_command_approach.append(command)
                if command:
                    set_joint_positions(self.robot, self.movable_joints, list_q_grasp[0])
                    return approach_conf, command, q_approach, q_grasp
                """Find the obstacle with the maximum occurrence"""
                if list_collision_obstacle:
                    self.msg_obstacle = max(list_collision_obstacle, key=list_collision_obstacle.count)
        # jp = get_joint_positions(self.robot, self.movable_joints)
        # ee_pose = get_link_pose(self.robot, grasp.link)
        #
        # err1 = np.array(ee_pose[0]) - np.array(grasp_pose_ee[0])
        # err2 = np.array(ee_pose[0]) - np.array(approach_pose_ee[0])

        if list_q_approach and list_q_grasp:
            set_joint_positions(self.robot, self.movable_joints, list_q_grasp[0])
            return None, None, list_q_approach[0], list_q_grasp[0]
        return None, None, None, None

    def __call__(self, input_tuple, seed=None):
        approach_conf, command, q_approach, q_grasp = self.search(input_tuple, seed=None)

        if command is None:
            return None
        else:
            return approach_conf, command

    def get_error_message(self):
        return SDG_MSG(self.msg_generator, self.msg_obstacle, self.msg_yg, self.msg_bi)


class sdg_plan_free_motion(object):
    def __init__(self, robot, all_bodies=[], teleport=False, self_collisions=True):
        self.all_bodies = all_bodies
        self.teleport = teleport
        self.self_collisions = self_collisions
        self.robot = robot
        self.max_distance = MAX_DISTANCE

    def __call__(self, input_tuple, seed=None):
        conf1, conf2 = input_tuple

        self.msg_yg = 0  # Collision distance of IK error
        self.msg_generator = False
        self.msg_obstacle = None
        self.msg_bi = True

        assert ((conf1.body == conf2.body) and (conf1.joints == conf2.joints))
        if self.teleport:
            path = [conf1.configuration, conf2.configuration]
        else:
            conf1.assign()
            # obstacles = fixed + assign_fluent_state(fluents)
            obstacles = self.all_bodies
            path = plan_joint_motion(self.robot, conf2.joints, conf2.configuration, obstacles=obstacles,
                                     self_collisions=self.self_collisions, disabled_collisions=DISABLED_COLLISION_PAIR,
                                     max_distance=self.max_distance)
            if path is None:
                if DEBUG_FAILURE:
                    user_input('Free motion failed')
                self.msg_yg = 1
                return None
        command = Command([BodyPath(self.robot, path, joints=conf2.joints)])
        return (command,)  # return a tuple

    def get_error_message(self):
        return SDG_MSG(self.msg_generator, self.msg_obstacle, self.msg_yg, self.msg_bi)


class sdg_plan_holding_motion(object):
    def __init__(self, robot, all_bodies=[], teleport=False, self_collisions=True):
        self.all_bodies = all_bodies
        self.teleport = teleport
        self.self_collisions = self_collisions
        self.robot = robot
        self.max_distance = MAX_DISTANCE

    def __call__(self, input_tuple, seed=None):
        conf1, conf2, body, grasp = input_tuple

        self.msg_yg = 0  # Collision distance of IK error
        self.msg_generator = False
        self.msg_obstacle = None
        self.msg_bi = True

        assert ((conf1.body == conf2.body) and (conf1.joints == conf2.joints))
        if self.teleport:
            path = [conf1.configuration, conf2.configuration]
        else:
            conf1.assign()
            # obstacles = all_bodies + assign_fluent_state(fluents)
            obstacles = list(set(self.all_bodies) - {grasp.body})
            path = plan_joint_motion(self.robot, conf2.joints, conf2.configuration,
                                     obstacles=obstacles, attachments=[grasp.attachment()],
                                     self_collisions=self.self_collisions, disabled_collisions=DISABLED_COLLISION_PAIR,
                                     max_distance=self.max_distance)
            if path is None:
                if DEBUG_FAILURE:
                    user_input('Holding motion failed')
                self.msg_yg = 1
                return None
        command = Command([BodyPath(self.robot, path, joints=conf2.joints, attachments=[grasp])])
        return (command,)  # return a tuple

    def get_error_message(self):
        return SDG_MSG(self.msg_generator, self.msg_obstacle, self.msg_yg, self.msg_bi)


#######################################################

def get_grasp_gen0(robot, grasp_name):
    grasp_info = GRASP_INFO[grasp_name]
    end_effector_link = link_from_name(robot, TOOL_FRAMES[get_body_name(robot)])

    def gen(body):
        grasp_poses = grasp_info.get_grasps(body)

        for grasp_pose in grasp_poses:
            approach_pose = grasp_info.approach_pose
            body_grasp = BodyGrasp(body, grasp_pose, approach_pose,
                                   robot, end_effector_link)
            yield (body_grasp,)

    return gen


def get_grasp_gen(robot, grasp_name):
    grasp_info = GRASP_INFO[grasp_name]
    end_effector_link = link_from_name(robot, TOOL_FRAMES[get_body_name(robot)])

    def gen(body, grasp_dir):
        # grasp_poses = grasp_info.get_grasps(body)
        # grasp_poses = get_top_grasps(body, under=True, tool_pose=Pose(), max_width=INF, grasp_length=0)
        # grasp_poses = get_side_grasps(body, under=True, tool_pose=Pose(), max_width=INF, grasp_length=0)

        assert body == grasp_dir.body
        grasp_poses = get_sucker_grasps(body, direction=grasp_dir.direction, under=True, tool_pose=Pose(),
                                        grasp_length=0)  # 0,3,4

        for grasp_pose in grasp_poses:
            # approach_vector = 0.1 * get_unit_vector([0, 0, 1])
            # approach_pose = multiply(Pose(0.1 * Point(z=1)), grasp_pose)
            approach_pose = Pose(0.1 * Point(z=-1))  # pose bias wrt end-effector frame
            body_grasp = BodyGrasp(body, grasp_pose, approach_pose,
                                   robot, end_effector_link)
            yield (body_grasp,)

    return gen


def get_grasp_dir_gen():
    def fn(body):
        direction = random.sample([0], 1)[0]  # [0,3,4]

        return (GraspDirection(body, direction),)

    return fn


def get_stable_gen(all_bodies=[]):  # TODO: continuous set of grasps
    def gen(body, surface, *args):
        others = list(set(all_bodies) - {body, surface})
        while True:
            pose = sample_placement(body, surface)
            if (pose is None) or any(pairwise_collision(body, b) for b in others):
                continue
            body_pose = BodyPose(body, pose)
            yield (body_pose,)
            # TODO: check collisions

    return gen


def get_ik_grasp_fn(robot, all_bodies=[], teleport=False, num_attempts=200):
    movable_joints = get_movable_joints(robot)
    sample_fn = get_sample_fn(robot, movable_joints)

    def fn(body, pose, grasp):
        """
        :param pose: the pose of the object (body)
        """
        obstacles = list(set(all_bodies) - {grasp.body})
        grasp_pose_ee = end_effector_from_body(pose.pose, grasp.grasp_pose)  # wrt world frame
        approach_pose_ee = multiply(grasp_pose_ee, grasp.approach_pose)  # 右乘,以当前ee坐标系为基准进行变换

        # approach_pose_ee = end_effector_from_body(pose.pose, grasp.approach_pose)

        for _ in range(num_attempts):
            sampled_conf = sample_fn()
            set_joint_positions(robot, movable_joints, sampled_conf)  # Random seed
            q_approach = inverse_kinematics(robot, grasp.link, approach_pose_ee)
            if (q_approach is None) or any(pairwise_collision(robot, b) for b in obstacles):
                continue
            approach_conf = BodyConf(robot, q_approach)
            q_grasp = inverse_kinematics(robot, grasp.link, grasp_pose_ee)
            if (q_grasp is None) or any(pairwise_collision(robot, b) for b in obstacles):
                continue
            if teleport:
                path = [q_approach, q_grasp]
            else:
                approach_conf.assign()
                # The path from q_approach to q_grasp.
                path = plan_direct_joint_motion(robot, approach_conf.joints, q_grasp,
                                                obstacles=obstacles)
                if path is None:
                    if DEBUG_FAILURE:
                        user_input('Approach motion failed')
                    continue
            command = Command([BodyPath(robot, path),
                               Attach(body, robot, grasp.link),
                               BodyPath(robot, path[::-1], attachments=[grasp])])
            return approach_conf, command
            # TODO: holding collisions
        return None

    return fn


##################################################

def assign_fluent_state(fluents):
    obstacles = []
    for fluent in fluents:
        name, args = fluent[0], fluent[1:]
        if name == 'atpose':
            o, p = args
            obstacles.append(o)
            p.assign()
        else:
            raise ValueError(name)
    return obstacles


def get_free_motion_gen(robot, fixed=[], teleport=False, self_collisions=True):
    def fn(conf1, conf2, fluents=[]):
        assert ((conf1.body == conf2.body) and (conf1.joints == conf2.joints))
        if teleport:
            path = [conf1.configuration, conf2.configuration]
        else:
            conf1.assign()
            # obstacles = fixed + assign_fluent_state(fluents)
            obstacles = fixed
            path = plan_joint_motion(robot, conf2.joints, conf2.configuration, obstacles=obstacles,
                                     self_collisions=self_collisions)
            if path is None:
                if DEBUG_FAILURE: user_input('Free motion failed')
                return None
        command = Command([BodyPath(robot, path, joints=conf2.joints)])
        return (command,)

    return fn


def get_holding_motion_gen(robot, all_bodies=[], teleport=False, self_collisions=True):
    def fn(conf1, conf2, body, grasp, fluents=[]):
        assert ((conf1.body == conf2.body) and (conf1.joints == conf2.joints))
        if teleport:
            path = [conf1.configuration, conf2.configuration]
        else:
            conf1.assign()
            # obstacles = all_bodies + assign_fluent_state(fluents)
            obstacles = list(set(all_bodies) - {grasp.body})
            path = plan_joint_motion(robot, conf2.joints, conf2.configuration,
                                     obstacles=obstacles, attachments=[grasp.attachment()],
                                     self_collisions=self_collisions)
            if path is None:
                if DEBUG_FAILURE:
                    user_input('Holding motion failed')
                return None
        command = Command([BodyPath(robot, path, joints=conf2.joints, attachments=[grasp])])
        return (command,)

    return fn


##################################################

def get_movable_collision_test():
    def test(command, body, pose):
        pose.assign()
        for path in command.body_paths:
            moving = path.bodies()
            if body in moving:
                # TODO: cannot collide with itself
                continue
            for _ in path.iterator():
                # TODO: could shuffle this
                if any(pairwise_collision(mov, body) for mov in moving):
                    if DEBUG_FAILURE: user_input('Movable collision')
                    return True
        return False

    return test
