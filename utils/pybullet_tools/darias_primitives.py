import time
# dump_body(robot)
from .pr2_utils import get_top_grasps, get_side_grasps, get_sucker_grasps
from .utils import get_pose, set_pose, get_movable_joints, \
    set_joint_positions, add_fixed_constraint, enable_real_time, disable_real_time, joint_controller, \
    enable_gravity, get_refine_fn, user_input, wait_for_duration, link_from_name, get_body_name, sample_placement, \
    sample_placement_seed, \
    end_effector_from_body, approach_from_grasp, plan_joint_motion, GraspInfo, Pose, INF, Point, \
    inverse_kinematics, pairwise_collision, remove_fixed_constraint, Attachment, get_sample_fn, \
    step_simulation, refine_path, plan_direct_joint_motion, get_joint_positions, dump_world, \
    get_distance, get_links, get_links_movement, get_unit_vector, unit_quat, multiply

import random
import numpy as np

GRASP_INFO = {
    'top': GraspInfo(lambda body: get_top_grasps(body, under=True, tool_pose=Pose(), max_width=INF, grasp_length=0),
                     approach_pose=Pose(0.1 * Point(z=1))),
}

TOOL_FRAMES = {
    'iiwa14': 'iiwa_link_ee_kuka',  # iiwa_link_ee
}

DEBUG_FAILURE = False


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
    def __init__(self, body, grasp_pose, approach_pose, robot, link):
        self.body = body
        self.grasp_pose = grasp_pose
        self.approach_pose = approach_pose
        self.robot = robot
        self.link = link

    # def constraint(self):
    #    grasp_constraint()
    def attachment(self):
        return Attachment(self.robot, self.link, self.grasp_pose, self.body)

    def assign(self):
        return self.attachment().assign()

    def __repr__(self):
        return 'g{}'.format(id(self) % 1000)


class GraspDirection(object):
    def __init__(self, body, direction):
        if isinstance(body, tuple):
            body = body[0]
        self.body = body
        self.direction = direction

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

    def control(self, real_time=False, dt=0):
        # TODO: just waypoints
        if real_time:
            enable_real_time()
        else:
            disable_real_time()
        for values in self.path:
            for _ in joint_controller(self.body, self.joints, values):
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


#######################################################

class sdg_sample_place(object):
    def __init__(self, all_bodies=[]):
        self.all_bodies = all_bodies

    def __call__(self, input_tuple, seed=None):
        body, surface = input_tuple
        others = list(set(self.all_bodies) - {body, surface})
        """1) Generation"""
        pose = sample_placement_seed(body, surface, seed)
        """2) Validation"""
        if (pose is None) or any(pairwise_collision(body, b) for b in others):
            return None

        body_pose = BodyPose(body, pose)
        return (body_pose,)  # return a tuple


class sdg_sample_stack(object):
    def __init__(self, all_bodies=[]):
        self.all_bodies = all_bodies

    def __call__(self, input_tuple, seed=None):
        body, surface, surface_pose = input_tuple
        others = list(set(self.all_bodies) - {body, surface})
        """1) Generation"""
        pose = sample_placement_seed(body, surface, seed)
        """2) Validation"""
        if (pose is None) or any(pairwise_collision(body, b) for b in others):
            return None

        body_pose = BodyPose(body, pose)
        return (body_pose,)  # return a tuple


class sdg_sample_grasp_dir(object):
    def __init__(self):
        pass

    def __call__(self, input_tuple, seed=None):
        body = input_tuple

        list_available = [0, 1, 2, 3, 4]
        if seed is None:
            idx = random.sample(list_available, 1)[0]
        else:
            idx = np.array([seed]).flatten()[0]

        dir = list_available[idx]

        return (GraspDirection(body, dir),)


class sdg_sample_grasp(object):
    def __init__(self, robot):
        self.robot = robot
        self.end_effector_link = link_from_name(robot, TOOL_FRAMES[get_body_name(robot)])

    def __call__(self, input_tuple, seed=None):
        body, grasp_dir = input_tuple

        assert body == grasp_dir.body

        list_available = [0, 1, 2, 3, 4]

        grasp_poses = get_sucker_grasps(body, direction=grasp_dir.direction, under=True, tool_pose=Pose(),
                                        grasp_length=0)  # 0,3,4
        grasp_pose = random.sample(grasp_poses, 1)[0]

        approach_pose = Pose(0.1 * Point(z=-1))  # pose bias wrt end-effector frame
        body_grasp = BodyGrasp(body, grasp_pose, approach_pose, self.robot, self.end_effector_link)
        return (body_grasp,)  # return a tuple


class sdg_ik_grasp(object):
    def __init__(self, robot, all_bodies=[], teleport=False, num_attempts=200):
        self.all_bodies = all_bodies
        self.teleport = teleport
        self.num_attempts = num_attempts
        self.movable_joints = get_movable_joints(robot)
        self.sample_fn = get_sample_fn(robot, self.movable_joints)
        self.robot = robot

    def __call__(self, input_tuple, seed=None):
        body, pose, grasp = input_tuple

        obstacles = list(set(self.all_bodies) - {grasp.body})
        grasp_pose_ee = end_effector_from_body(pose.pose, grasp.grasp_pose)  # wrt world frame
        approach_pose_ee = multiply(grasp_pose_ee, grasp.approach_pose)  # 右乘,以当前ee坐标系为基准进行变换

        for _ in range(self.num_attempts):
            sampled_conf = self.sample_fn()
            set_joint_positions(self.robot, self.movable_joints, sampled_conf)  # Random seed
            q_approach = inverse_kinematics(self.robot, grasp.link, approach_pose_ee)
            if (q_approach is None) or any(pairwise_collision(self.robot, b) for b in obstacles):
                continue
            approach_conf = BodyConf(self.robot, q_approach)
            q_grasp = inverse_kinematics(self.robot, grasp.link, grasp_pose_ee)
            if (q_grasp is None) or any(pairwise_collision(self.robot, b) for b in obstacles):
                continue
            if self.teleport:
                path = [q_approach, q_grasp]
            else:
                approach_conf.assign()
                # The path from q_approach to q_grasp.
                path = plan_direct_joint_motion(self.robot, approach_conf.joints, q_grasp,
                                                obstacles=obstacles)
                if path is None:
                    if DEBUG_FAILURE:
                        user_input('Approach motion failed')
                    continue
            # Trajectory
            command = Command([BodyPath(self.robot, path),
                               Attach(body, self.robot, grasp.link),
                               BodyPath(self.robot, path[::-1], attachments=[grasp])])
            return approach_conf, command
            # TODO: holding collisions
        return None


class sdg_plan_free_motion(object):
    def __init__(self, robot, all_bodies=[], teleport=False, self_collisions=True):
        self.all_bodies = all_bodies
        self.teleport = teleport
        self.self_collisions = self_collisions
        self.robot = robot

    def __call__(self, input_tuple, seed=None):
        conf1, conf2 = input_tuple

        assert ((conf1.body == conf2.body) and (conf1.joints == conf2.joints))
        if self.teleport:
            path = [conf1.configuration, conf2.configuration]
        else:
            conf1.assign()
            # obstacles = fixed + assign_fluent_state(fluents)
            obstacles = self.all_bodies
            path = plan_joint_motion(self.robot, conf2.joints, conf2.configuration, obstacles=obstacles,
                                     self_collisions=self.self_collisions)
            if path is None:
                if DEBUG_FAILURE: user_input('Free motion failed')
                return None
        command = Command([BodyPath(self.robot, path, joints=conf2.joints)])
        return (command,)  # return a tuple


class sdg_plan_holding_motion(object):
    def __init__(self, robot, all_bodies=[], teleport=False, self_collisions=True):
        self.all_bodies = all_bodies
        self.teleport = teleport
        self.self_collisions = self_collisions
        self.robot = robot

    def __call__(self, input_tuple, seed=None):
        conf1, conf2, body, grasp = input_tuple

        assert ((conf1.body == conf2.body) and (conf1.joints == conf2.joints))
        if self.teleport:
            path = [conf1.configuration, conf2.configuration]
        else:
            conf1.assign()
            # obstacles = all_bodies + assign_fluent_state(fluents)
            obstacles = list(set(self.all_bodies) - {grasp.body})
            path = plan_joint_motion(self.robot, conf2.joints, conf2.configuration,
                                     obstacles=obstacles, attachments=[grasp.attachment()],
                                     self_collisions=self.self_collisions)
            if path is None:
                if DEBUG_FAILURE:
                    user_input('Holding motion failed')
                return None
        command = Command([BodyPath(self.robot, path, joints=conf2.joints, attachments=[grasp])])
        return (command,)  # return a tuple


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
