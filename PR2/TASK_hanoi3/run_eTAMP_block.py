#!/usr/bin/env python
from run_branch import *
import os
from etamp.block_skeleton import *


#######################################################


def eTAMP_session():
    visualization = 0
    connect(use_gui=visualization)

    scn = Scene_hanoi()

    pddlstream_problem = get_pddlstream_problem(scn)
    _, _, _, _, stream_info, action_info = pddlstream_problem

    st = time.time()

    sk_batch = solve_progressive2(pddlstream_problem,
                                  num_optms_init=80, target_sk=50)

    e_root = ExtendedNode()

    concrete_plan = None
    num_attempts = 0
    thinking_time = 0

    """Any skeleton starting with some essenceJam will be prevented from motion planning until this essenceJam is broken through."""
    sk_to_essenceJam = {}  # mapping from skeleton_id to its resultant essenceList

    essenceJam_to_sks = defaultdict(set)

    id_to_actionEssence = {}
    id_to_branch = {}

    queue_candidate_sk = list(range(sk_batch.num_ap))

    while concrete_plan is None and thinking_time < 500:
        e_root.visits += 1
        # Progressive Widening
        # alpha = 0.3
        # need_expansion = np.floor(e_root.visits ** alpha) > np.floor(
        #     (e_root.visits - 1) ** alpha)
        flag_pw = e_root.visits > 3 * (len(e_root.children) ** 2)  # 8.5 6
        need_expansion = e_root.num_children < 1 or flag_pw
        need_expansion = need_expansion and (len(queue_candidate_sk) > 0)
        # need_expansion = e_root.num_children < 1
        cur_branch = None

        if need_expansion:
            sk_id = queue_candidate_sk.pop(0)

            if sk_id not in id_to_actionEssence:
                actionEssence = sk_batch.get_actionEssence(sk_id)
                assert actionEssence is not None
                id_to_actionEssence[sk_id] = actionEssence
            else:
                actionEssence = id_to_actionEssence[sk_id]

            blocking_sk = None  # the skeleton that blocks other sks from motion planning
            for sk_id0, essenceJam in sk_to_essenceJam.items():
                if sk_id0 != sk_id and test_essenceJam(actionEssence, essenceJam):
                    # essenceJam_to_sks[essenceJam].add(sk_id)
                    blocking_sk = sk_id0
            if blocking_sk is None:
                # if sk_id not in id_to_branch:
                #     op_plan = sk_batch.generate_operatorPlan(sk_id)
                #     skeleton_env = SkeletonEnv(sk_id, op_plan,
                #                                get_update_env_reward_fn(scn, action_info),
                #                                stream_info, scn, use_bo=False)
                #     cur_branch = PlannerUCT(skeleton_env)
                #     id_to_branch[sk_id] = cur_branch
                # else:
                #     cur_branch = id_to_branch[sk_id]

                op_plan = sk_batch.generate_operatorPlan(sk_id)
                skeleton_env = SkeletonEnv(sk_id, op_plan,
                                           get_update_env_reward_fn(scn, action_info),
                                           stream_info, scn, use_bo=False)
                cur_branch = PlannerUCT(skeleton_env, pw_const=5, ucb_const=0.001)
                id_to_branch[sk_id] = cur_branch
                e_root.add_child(cur_branch)
            else:
                e_root.visits -= 1
                assert sk_id not in queue_candidate_sk
                queue_candidate_sk.append(sk_id)
                print('\n $$ Skeleton {} is blocked by {}.\n'.format(sk_id,
                                                                     blocking_sk))

        if cur_branch is None:
            # continue
            cur_branch = e_root.select_child_ucb()

        concrete_plan = cur_branch.think(1, 0)

        if concrete_plan is None:
            essenceJam = cur_branch.get_actionEssenceJam()
            """If this essenceJam has been met"""
            # if cur_branch.env.skeleton_id in sk_to_essenceJam:
            #     old_essenceJam = sk_to_essenceJam[cur_branch.env.skeleton_id]
            #     if len(essenceJam) > len(old_essenceJam):
            #         to_recover = []
            #         for blocked_id in essenceJam_to_sks[old_essenceJam]:
            #             if not test_essenceJam(id_to_actionEssence[blocked_id], essenceJam):
            #                 """Unlock the sk"""
            #                 to_recover.append(blocked_id)
            #         for blocked_id in to_recover:
            #             print('\n $$ Skeleton {} is unlocked by {}.\n'.format(blocked_id,
            #                                                                   cur_branch.env.skeleton_id))
            #             essenceJam_to_sks[old_essenceJam].remove(blocked_id)
            sk_to_essenceJam[cur_branch.env.skeleton_id] = essenceJam

        # print('total_node: ', e_root.total_node)
        num_attempts += 1
        thinking_time = time.time() - st

        # if (e_root.visits + 1) % 10 == 0:
        #     with open('ctype_to_constraints.pk', 'wb') as f:
        #         pk.dump(Constraint.ctype_to_constraints, f)
        #         for ctype, cs in Constraint.ctype_to_constraints.items():
        #             print(f"#{ctype}# {cs[0]}: {len([c for c in cs if c.yg <= 0])}-{len([c for c in cs if c.yg > 0])}")

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
        result_vnts = eTAMP_session()
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
