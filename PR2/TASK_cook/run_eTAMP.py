#!/usr/bin/env python
from run_branch import *


#######################################################

def exp():
    visualization = 0
    connect(use_gui=visualization)

    scn = PlanningScenario()

    pddlstream_problem = get_pddlstream_problem(scn)
    _, _, _, _, stream_info, action_info = pddlstream_problem

    # pr = cProfile.Profile()
    # pr.enable()

    st = time.time()

    sk_batch = solve_progressive2(pddlstream_problem,
                                  num_optms_init=80, target_sk=20)

    e_root = ExtendedNode()

    concrete_plan = None
    num_attempts = 0
    thinking_time = 0
    while concrete_plan is None and thinking_time < 60 * 20:
        # Progressive Widening
        e_root.visits += 1
        # alpha = 0.3
        # need_expansion = np.floor(e_root.visits ** alpha) > np.floor(
        #     (e_root.visits - 1) ** alpha)
        flag_pw = e_root.visits > 8.5 * (len(e_root.children) ** 2)
        need_expansion = e_root.num_children < 1 or flag_pw
        need_expansion = need_expansion and (e_root.num_children < sk_batch.num_ap)
        if need_expansion:
            op_plan = sk_batch.get_next_operatorPlan()
            assert op_plan is not None
            skeleton_env = SkeletonEnv(e_root.num_children, op_plan,
                                       get_update_env_reward_fn(scn, action_info), stream_info, scn)
            selected_branch = PlannerUCT(skeleton_env)
            e_root.add_child(selected_branch)
        else:
            selected_branch = e_root.select_child_ucb()
        concrete_plan = selected_branch.think(1, visualization)
        # print('total_node: ', e_root.total_node)
        num_attempts += 1
        thinking_time = time.time() - st
    print('think time: ' + str(thinking_time))
    # e_root.save_the_tree(idx)

    disconnect()

    if concrete_plan is None:
        print('TAMP is failed.', concrete_plan)
        return -1, -1, thinking_time, -1
    print('TAMP is successful.', concrete_plan)

    return e_root.num_total_child_visits, e_root.total_node, thinking_time, len(e_root.children)


if __name__ == '__main__':
    list_report_vnts = []
    for i in range(100):
        print(f'exp {i} -------------------------------------------------------------------')
        result_vnts = exp()
        list_report_vnts.append(result_vnts)

        print('======================')
        for vnt in list_report_vnts:
            print(vnt)
        print('======================')

        data1 = [c[0] for c in list_report_vnts]
        data2 = [c[1] for c in list_report_vnts]
        data3 = [c[2] for c in list_report_vnts]
        data4 = [c[3] for c in list_report_vnts]
        np.savetxt("result_vnts.csv", np.column_stack((data1, data2, data3, data4)), delimiter=",", fmt='%s')
