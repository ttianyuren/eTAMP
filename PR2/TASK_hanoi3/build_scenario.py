#!/usr/bin/env python

from __future__ import print_function
import numpy as np

import time
from utils.pybullet_tools.utils import WorldSaver, connect, dump_world, get_pose, set_pose, Pose, \
    Point, set_default_camera, stable_z, disconnect, get_bodies, HideOutput, \
    create_box, \
    load_pybullet, step_simulation, Euler, get_links, get_link_info, get_movable_joints, set_joint_positions, \
    set_camera, get_center_extent, tform_from_pose, attach_viewcone, LockRenderer, load_model, set_point, enable_gravity

from utils.pybullet_tools.body_utils import draw_frame
from utils.pybullet_tools.pr2_utils import set_arm_conf, REST_LEFT_ARM, open_arm, \
    close_arm, get_carry_conf, arm_conf, get_other_arm, set_group_conf, PR2_URDF, DRAKE_PR2_URDF, create_gripper

from copy import copy


class Scene_hanoi(object):
    def __init__(self):
        with HideOutput():
            with LockRenderer():
                self.grasp_type = 'side'

                self.arm0 = 'arm0'
                self.arm1 = 'arm1'

                self.pr2 = load_pybullet("../pr2_description/urdf/pr2_simplified.urdf",
                                         fixed_base=True)

                self.arms = [self.arm0, self.arm1]

                w = .22
                h = .7
                self.h = h

                mass = 1

                self.bd_body = {
                    "floor": load_pybullet("../scenario_description/plane.urdf", fixed_base=True),
                    "table": load_pybullet("../scenario_description/hanoi/table_narrow.urdf", fixed_base=True),
                    "peg1": load_pybullet("../scenario_description/hanoi/rod.urdf", fixed_base=True),
                    "peg2": load_pybullet("../scenario_description/hanoi/rod.urdf", fixed_base=True),
                    "peg3": load_pybullet("../scenario_description/hanoi/rod.urdf", fixed_base=True),
                    "disc1": load_pybullet("../scenario_description/hanoi/cylinder1.urdf", fixed_base=False),
                    "disc2": load_pybullet("../scenario_description/hanoi/cylinder2.urdf", fixed_base=False),
                    "disc3": load_pybullet("../scenario_description/hanoi/cylinder3.urdf", fixed_base=False),
                }
                self.bd_body.update(dict((self.bd_body[k], k) for k in self.bd_body))

                self.dict_arm = {'arm0': 'left', 'arm1': 'right', 'arm2': 'left'}
                self.arm_to_robot = {self.arm0: self.pr2, self.arm1: self.pr2}

                init_conf_0 = [0.5, 0.0, 0.0, -0.16, 0.0, -0.11, 0.0]
                set_arm_conf(self.pr2, self.dict_arm[self.arm0], init_conf_0)
                # open_arm(self.pr2, self.arm_left)
                init_conf_1 = [-0.5, 0.0, 0.0, -0.16, 0.0, -0.11, 0.0]
                set_arm_conf(self.pr2, self.dict_arm[self.arm1], init_conf_1)
                # close_arm(self.pr2, self.arm_right)
                set_group_conf(self.pr2, 'torso', [0.15])

                self.dict_init_config = {self.arm0: init_conf_0, self.arm1: init_conf_1, }

                # self.pos_table = np.array([1.2, 0, h / 2])
                # set_point(self.bd_body['box5'], (self.pos_table[0] - 0.0, self.pos_table[1] - 0.0, self.h + .1 / 2))
                # set_point(self.bd_body['box6'], (self.pos_table[0] + 0.12, self.pos_table[1] - 0.0, self.h + .1 / 2))
                # set_point(self.bd_body['box7'], (self.pos_table[0] - 0.12, self.pos_table[1] + 0.12, self.h + .1 / 2))
                # set_point(self.bd_body['box8'], (self.pos_table[0] - 0.0, self.pos_table[1] + 0.12, self.h + .1 / 2))
                # set_point(self.bd_body['box9'], (self.pos_table[0] + 0.12, self.pos_table[1] + 0.12, self.h + .1 / 2))
                set_point(self.pr2, (0, 0, 0))

                # p1 = (0.62, 0.075)
                # p2 = (0.72, 0.0)
                # p3 = (0.62, -0.075)

                p1 = (0.61, 0.075)
                p2 = (0.71, 0.0)
                p3 = (0.61, -0.075)
                self.peg_pos = {p1: 'peg1', p2: 'peg2', p3: 'peg3', }

                set_point(self.bd_body['table'], (0.9, -0.4, 0))
                set_point(self.bd_body['peg1'], (p1[0], p1[1], 0.77))
                set_point(self.bd_body['peg2'], (p2[0], p2[1], 0.77))
                set_point(self.bd_body['peg3'], (p3[0], p3[1], 0.77))
                set_point(self.bd_body['disc1'], (p1[0], p1[1], 0.915))
                set_point(self.bd_body['disc2'], (p1[0], p1[1], 0.845))
                set_point(self.bd_body['disc3'], (p1[0], p1[1], 0.775))

                # set_point(self.bd_body['disc1'], (p3[0], p3[1], 0.775))
                # set_point(self.bd_body['disc2'], (p2[0], p2[1], 0.775))
                # set_point(self.bd_body['disc3'], (p1[0], p1[1], 0.775))

                set_camera(75, -55, 1.8, Point(y=0.2))

                # set_camera(75, -90, 1.5, Point(x=0.6))


            # set_pose(box1, Pose(Point(x=0.25, y=0.80, z=stable_z(box1, region2))))

        self.movable_bodies = [self.bd_body['disc1'],
                               self.bd_body['disc2'],
                               self.bd_body['disc3'],
                               ]
        self.env_bodies = [self.bd_body['floor'],
                           self.bd_body['table']
                           ]
        self.regions = [self.bd_body['peg1'],
                        self.bd_body['peg2'],
                        self.bd_body['peg3'],
                        ]

        self.all_bodies = list(set(self.movable_bodies) | set(self.env_bodies) | set(self.regions))

        self.sensors = []

        self.robots = [self.pr2]

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

    scn = Scene_hanoi()
    scn.reset()

    # enable_gravity()
    for i in range(50000):
        step_simulation()
        time.sleep(0.01)

    disconnect()
    print('Finished.')


if __name__ == '__main__':
    display_scenario()
