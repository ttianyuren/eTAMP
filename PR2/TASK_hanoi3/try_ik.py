from build_scenario import *
from utils.pybullet_tools.pr2_primitives import *
from utils.pybullet_tools.pr2_utils import PR2_BASE_LINK

if __name__ == '__main__':
    connect(use_gui=True)

    scn = Scene_hanoi()
    scn.reset()

    robot = scn.pr2
    arm = 'arm1'

    # first_joint = 40
    # target_link = 52

    target_link = get_gripper_link(robot, scn.dict_arm[arm])
    first_joint = get_arm_joints(robot, scn.dict_arm[arm])[0]

    target_pose = ((0.6166505217552185, -0.08467887341976166, 0.868261992931366), (0.0, 0.0, 0.5782937407493591, 0.8158286809921265))

    draw_frame(tform_from_pose(target_pose), life_time=15)

    tool_link = link_from_name(robot, PR2_TOOL_FRAMES[scn.dict_arm[arm]])
    base_link = link_from_name(robot, PR2_BASE_LINK)

    torso_link = link_from_name(robot, "torso_lift_link")

    custom_limits = {}
    selected_links = get_link_subtree(robot, first_joint)  # TODO: child_link_from_joint?
    selected_movable_joints = prune_fixed_joints(robot, selected_links)

    lower_limits, upper_limits = get_custom_limits(robot, selected_movable_joints, custom_limits)

    assert (target_link in selected_links)
    selected_target_link = selected_links.index(target_link)

    with LockRenderer():

        saved_world = WorldSaver()

        pose0 = get_link_pose(robot, torso_link)
        c1 = p.createConstraint(parentBodyUniqueId=robot,
                                parentLinkIndex=torso_link,
                                childBodyUniqueId=-1,
                                childLinkIndex=-1,
                                jointType=p.JOINT_FIXED,
                                jointAxis=[0, 0, 0],
                                parentFramePosition=[0, 0, 0],
                                childFramePosition=pose0[0],
                                childFrameOrientation=pose0[1])

        c2 = p.createConstraint(parentBodyUniqueId=robot,
                                parentLinkIndex=target_link,
                                childBodyUniqueId=-1,
                                childLinkIndex=-1,
                                jointType=p.JOINT_FIXED,
                                jointAxis=[0, 0, 0],
                                parentFramePosition=[0, 0, 0],
                                childFramePosition=target_pose[0],
                                childFrameOrientation=target_pose[1])

        ji = p.getJointInfo(robot, first_joint)

        for i in range(100):
            step_simulation()
        p.removeConstraint(c2)
        for i in range(100):
            step_simulation()
        p.removeConstraint(c1)

        print('done')

        result_conf = get_joint_positions(robot, selected_movable_joints)

        saved_world.restore()
        set_joint_positions(robot, selected_movable_joints, result_conf)

    violate_limitation = all_between(lower_limits, result_conf, upper_limits)
    if not violate_limitation:
        print('pass')
    else:
        print('no')

    violate_collision = any(pairwise_collision(robot, b) for b in scn.all_bodies)
    if not violate_collision:
        print('pass')
    else:
        print('no')

    # contact_points = p.getContactPoints()
    # for p in contact_points:
    #     positionOnA = p[5]
    #     positionOnB = p[6]
    #     draw_point(positionOnA, 0.1, width=2, color=(1, 1, 0), lifetime=15)
    #     draw_point(positionOnB, 0.1, width=2, color=(0, 1, 1), lifetime=15)

    draw_contacts()

    for i in range(50000):
        # tool_pose = get_link_pose(robot, tool_link)
        # err_pos = np.array(target_pose[0]) - np.array(tool_pose[0])
        # p.applyExternalForce(robot, tool_link, 5000 * err_pos, [0, 0, 0], p.LINK_FRAME)
        step_simulation()
        time.sleep(0.01)

    disconnect()
    print('Finished.')
