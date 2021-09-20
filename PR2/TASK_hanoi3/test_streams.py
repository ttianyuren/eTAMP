#!/usr/bin/env python
from run_branch import *
from build_scenario import *
from utils.pybullet_tools.body_utils import draw_frame
from utils.pybullet_tools.utils import tform_from_pose, is_placement_hanoi

#######################################################


if __name__ == '__main__':

    connect(use_gui=True)

    scn = Scene_hanoi()
    scn.reset()

    f_place = sdg_sample_place_hanoi(scn)
    f_place((scn.bd_body['disc1'], scn.bd_body['peg3'], get_pose(scn.bd_body['peg3'])))
    f_place((scn.bd_body['disc2'], scn.bd_body['peg2'], get_pose(scn.bd_body['peg2'])))

    # body, region = scn.bd_body['disc1'], scn.bd_body['peg3']
    body, region = scn.bd_body['disc2'], scn.bd_body['peg2']


    pose0 = BodyPose(body, get_pose(body))
    inputs = (body, region, get_pose(region))
    pose1 = f_place(inputs)[0]

    set_pose(body, pose0.value)

    f_arm = sdg_sample_arm(scn)
    arm = f_arm((body, pose0, pose1), seed=(1,))[0]

    f_grasp = sdg_sample_grasp_hanoi(scn)
    grasp = f_grasp((body, pose0, pose1, arm), seed=(0.25,))[0]

    # set_pose(scn.bd_body['disc2'], grasp.value)
    f_ik = sdg_ik_arm_hanoi(scn)
    outputs = f_ik((body, pose0, None, grasp, arm))
    print(outputs)

    # enable_gravity()
    for i in range(50000):
        step_simulation()
        time.sleep(0.01)

    disconnect()
    print('Finished.')
