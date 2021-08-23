#!/usr/bin/env python

from __future__ import print_function
import numpy as np

import time
from utils.pybullet_tools.kuka_primitives3 import BodyPose, BodyConf, Register
from utils.pybullet_tools.utils import WorldSaver, connect, dump_world, get_pose, set_pose, Pose, \
    Point, set_default_camera, stable_z, disconnect, get_bodies, HideOutput, \
    create_box, \
    load_pybullet, step_simulation, Euler, get_links, get_link_info, get_movable_joints, set_joint_positions, \
    set_camera, get_center_extent, tform_from_pose, attach_viewcone, LockRenderer

from utils.pybullet_tools.body_utils import draw_frame

from copy import copy


class PlanningScenario(object):
    def __init__(self):
        with HideOutput():
            with LockRenderer():
                self.arm_left = load_pybullet("../darias_description/urdf/darias_L_primitive_collision.urdf",
                                              fixed_base=True)
                self.arm_base = load_pybullet("../darias_description/urdf/darias_base.urdf", fixed_base=True)

                self.bd_body = {
                    'floor': load_pybullet("../scenario_description/floor.urdf", fixed_base=True),
                    'cabinet_shelf': load_pybullet(
                        "../scenario_description/manipulation_worlds/urdf/cabinet_shelf.urdf",
                        fixed_base=True),
                    'drawer_shelf': load_pybullet(
                        "../scenario_description/manipulation_worlds/urdf/drawer_shelf.urdf",
                        fixed_base=True),
                    'pegboard': load_pybullet(
                        "../scenario_description/manipulation_worlds/urdf/pegboard.urdf",
                        fixed_base=True),
                    'region1': load_pybullet("../scenario_description/region.urdf", fixed_base=True),
                    'region2': load_pybullet("../scenario_description/region_big.urdf",
                                             fixed_base=True),
                    'c1': load_pybullet("../scenario_description/boxCm.urdf", fixed_base=False),
                    'c2': load_pybullet("../scenario_description/boxC.urdf", fixed_base=False),
                    'c3': load_pybullet("../scenario_description/boxCx.urdf", fixed_base=False),
                }
                self.bd_body.update(dict((self.bd_body[k], k) for k in self.bd_body))

                self.drawer_links = get_links(self.bd_body['drawer_shelf'])
                cabinet_links = get_links(self.bd_body['cabinet_shelf'])

                set_pose(self.bd_body['cabinet_shelf'],
                         Pose(Point(x=-0.45, y=-0.8, z=stable_z(self.bd_body['cabinet_shelf'], self.bd_body['floor']))))
                set_pose(self.bd_body['drawer_shelf'],
                         Pose(Point(x=-0.45, y=0.8, z=stable_z(self.bd_body['drawer_shelf'], self.bd_body['floor']))))
                set_pose(self.bd_body['pegboard'],
                         Pose(Point(x=-0.60, y=0, z=stable_z(self.bd_body['pegboard'], self.bd_body['floor']))))
                set_pose(self.bd_body['region1'],
                         Pose(Point(x=0.35, y=0.9, z=stable_z(self.bd_body['region1'], self.bd_body['floor']))))
                set_pose(self.bd_body['region2'],
                         Pose(Point(x=0.05, y=0.8, z=stable_z(self.bd_body['region2'], self.bd_body['floor']))))

                self.movable_bodies = [self.bd_body['c1'], self.bd_body['c2'], self.bd_body['c3']]
                self.env_bodies = [self.arm_base, self.bd_body['floor'], self.bd_body['cabinet_shelf'],
                                   self.bd_body['drawer_shelf'], self.bd_body['pegboard']]
                self.regions = [self.bd_body['region1'], self.bd_body['region2']]

                self.all_bodies = list(set(self.movable_bodies) | set(self.env_bodies) | set(self.regions))

                self.sensors = []

                self.robots = [self.arm_left]

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

                self.reset()

    def reset(self):
        with HideOutput():
            with LockRenderer():
                # initial_jts = np.array([0.8, 0.75, 0.4, -1.8, 0.8, -1.5, 0])
                initial_jts = np.array([0.1, 1.4, 1, 1.7, 0, 0, 0])
                config_left = BodyConf(self.arm_left, initial_jts)
                config_left.assign()

                movable_door = get_movable_joints(self.bd_body['cabinet_shelf'])
                set_joint_positions(self.bd_body['cabinet_shelf'], movable_door, [-0.])

                set_pose(self.bd_body['c1'],
                         Pose(Point(x=0.375, y=0.9, z=stable_z(self.bd_body['c1'], self.bd_body['region1']))))
                set_pose(self.bd_body['c2'],
                         Pose(Point(x=0.32, y=0.9, z=stable_z(self.bd_body['c2'], self.bd_body['region1']))))
                set_pose(self.bd_body['c3'],
                         Pose(Point(x=0.34, y=0.845, z=stable_z(self.bd_body['c3'], self.bd_body['region1']))))

                set_camera(150, -35, 1.6, Point(-0.1, 0.1, -0.1))

    def get_elemetns(self):
        self.reset()
        return self.arm_left, self.movable_bodies, self.regions


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
