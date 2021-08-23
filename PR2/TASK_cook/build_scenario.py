#!/usr/bin/env python

from __future__ import print_function
import numpy as np

import time
from utils.pybullet_tools.kuka_primitives3 import BodyPose, BodyConf, Register
from utils.pybullet_tools.utils import WorldSaver, connect, dump_world, get_pose, set_pose, Pose, \
    Point, set_default_camera, stable_z, disconnect, get_bodies, HideOutput, \
    create_box, \
    load_pybullet, step_simulation, Euler, get_links, get_link_info, get_movable_joints, set_joint_positions, \
    set_camera, get_center_extent, tform_from_pose, attach_viewcone, LockRenderer, load_model, set_point

from utils.pybullet_tools.body_utils import draw_frame
from utils.pybullet_tools.pr2_utils import set_arm_conf, REST_LEFT_ARM, open_arm, \
    close_arm, get_carry_conf, arm_conf, get_other_arm, set_group_conf, PR2_URDF, DRAKE_PR2_URDF, create_gripper

from copy import copy


class PlanningScenario(object):
    def __init__(self):
        with HideOutput():
            with LockRenderer():
                self.arm_left = 'left'
                self.grasp_type = 'top'
                self.arm_right = get_other_arm(self.arm_left)

                self.pr2 = load_pybullet("../pr2_description/urdf/pr2_simplified.urdf",
                                         fixed_base=True)

                w = .31
                h = .7
                self.h = h

                mass = 1

                self.bd_body = {
                    "floor": load_pybullet("../scenario_description/plane.urdf", fixed_base=True),
                    "table": create_box(w, w, h, color=(.75, .75, .75, 1)),
                    "sink": create_box(w, w, h, color=(.25, .25, .75, 1)),
                    "stove": create_box(w, w, h, color=(.75, .25, .25, 1)),
                    "box1": create_box(.07, .07, .1, mass=mass, color=(1, 0, 0, 1)),
                    "box2": create_box(.07, .07, .1, mass=mass, color=(0, 1, 0, 1)),
                    "box3": create_box(.07, .07, .1, mass=mass, color=(0, 0, 1, 1)),
                    "box4": create_box(.07, .07, .1, mass=mass, color=(0, 0.7, 0.7, 1)),
                    "box5": create_box(.07, .07, .1, mass=mass, color=(0.7, 0, 0.7, 1)),
                    "box6": create_box(.07, .07, .1, mass=mass, color=(0.7, 0.7, 0, 1)),
                    "box7": create_box(.07, .07, .1, mass=mass, color=(0, 0.8, 0.6, 1)),
                    "box8": create_box(.07, .07, .1, mass=mass, color=(0.8, 0, 0.6, 1)),
                    "box9": create_box(.07, .07, .1, mass=mass, color=(0.6, 0.8, 0, 1)),

                }
                self.bd_body.update(dict((self.bd_body[k], k) for k in self.bd_body))

                initial_conf = get_carry_conf(self.arm_left, self.grasp_type)
                set_arm_conf(self.pr2, self.arm_left, initial_conf)
                open_arm(self.pr2, self.arm_left)
                set_arm_conf(self.pr2, self.arm_right, arm_conf(self.arm_right, REST_LEFT_ARM))
                close_arm(self.pr2, self.arm_right)
                set_group_conf(self.pr2, 'torso', [0.2])

                self.pos_table = np.array([1.2, 0, h / 2])
                set_point(self.bd_body['table'], self.pos_table)
                set_point(self.bd_body['sink'], (0, 1.0, h / 2))
                set_point(self.bd_body['stove'], (0, -1., h / 2))
                set_point(self.bd_body['box1'], (self.pos_table[0] - 0.12, self.pos_table[1] - 0.12, self.h + .1 / 2))
                set_point(self.bd_body['box2'], (self.pos_table[0] - 0.0, self.pos_table[1] - 0.12, self.h + .1 / 2))
                set_point(self.bd_body['box3'], (self.pos_table[0] + 0.12, self.pos_table[1] - 0.12, self.h + .1 / 2))
                set_point(self.bd_body['box4'], (self.pos_table[0] - 0.12, self.pos_table[1] - 0.0, self.h + .1 / 2))
                set_point(self.bd_body['box5'], (self.pos_table[0] - 0.0, self.pos_table[1] - 0.0, self.h + .1 / 2))
                set_point(self.bd_body['box6'], (self.pos_table[0] + 0.12, self.pos_table[1] - 0.0, self.h + .1 / 2))
                set_point(self.bd_body['box7'], (self.pos_table[0] - 0.12, self.pos_table[1] + 0.12, self.h + .1 / 2))
                set_point(self.bd_body['box8'], (self.pos_table[0] - 0.0, self.pos_table[1] + 0.12, self.h + .1 / 2))
                set_point(self.bd_body['box9'], (self.pos_table[0] + 0.12, self.pos_table[1] + 0.12, self.h + .1 / 2))

                set_camera(75, -45, 2.7, Point())

            # set_pose(box1, Pose(Point(x=0.25, y=0.80, z=stable_z(box1, region2))))

        self.movable_bodies = [self.bd_body['box1'], self.bd_body['box2'], self.bd_body['box3'],
                               self.bd_body['box4'], self.bd_body['box5'], self.bd_body['box6'],
                               self.bd_body['box7'], self.bd_body['box8'], self.bd_body['box9'], ]
        self.env_bodies = [self.bd_body['floor']]
        self.regions = [self.bd_body['table'], self.bd_body['sink'], self.bd_body['stove']]

        self.all_bodies = list(set(self.movable_bodies) | set(self.env_bodies) | set(self.regions))

        self.sensors = []

        self.robots = [self.pr2]
        self.arms = [self.arm_left, self.arm_right]
        self.controllable = [self.arm_left]

        self.gripper = None

        self.dic_body_info = {}
        for b in self.movable_bodies:
            obj_center, obj_extent = get_center_extent(b)
            body_pose = get_pose(b)
            body_frame = tform_from_pose(body_pose)
            bottom_center = copy(obj_center)
            bottom_center[2] = bottom_center[2] - obj_extent[2] / 2
            bottom_frame = tform_from_pose((bottom_center, body_pose[1]))
            relative_frame_bottom = np.dot(bottom_frame, np.linalg.inv(body_frame))  # from pose to bottom
            center_frame = tform_from_pose((obj_center, body_pose[1]))
            relative_frame_center = np.dot(center_frame, np.linalg.inv(body_frame))

            self.dic_body_info[b] = (obj_extent, relative_frame_bottom, relative_frame_center)

        self.saved_world = WorldSaver()

    def get_gripper(self, arm='left'):
        # upper = get_max_limit(problem.robot, get_gripper_joints(problem.robot, 'left')[0])
        # set_configuration(gripper, [0]*4)
        # dump_body(gripper)
        if self.gripper is None:
            self.gripper = create_gripper(self.pr2, arm=arm)
        return self.gripper

    def reset(self):
        self.saved_world.restore()


#######################################################

def display_scenario():
    connect(use_gui=True)

    scn = PlanningScenario()
    scn.reset()

    for i in range(10000):
        step_simulation()
        time.sleep(0.1)

    disconnect()
    print('Finished.')


if __name__ == '__main__':
    display_scenario()
