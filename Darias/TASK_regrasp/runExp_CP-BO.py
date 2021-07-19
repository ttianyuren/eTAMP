#!/usr/bin/env python
from run_branch_regrasp import *
from etamp.constraint_graph import reset_constraint_dict
from etamp.decision_sampler import SamplerContinuous, SamplerDiscrete

#######################################################


if __name__ == '__main__':

    N = 1000

    list_visits_bo = []
    list_visits_voronoi = []
    list_visits_random = []

    for i in range(N):
        print(f'exp {i} -------------------------------------------------------------------')

        # BO
        print("BO")
        SamplerContinuous.voronoi = True
        SamplerDiscrete.voronoi = True
        reset_constraint_dict()
        sk_visits = main(use_bo=1, visualization=0, new_problem=0, alg_CP_BO='multi')
        list_visits_bo.append(int(sk_visits))
        print(list_visits_bo)
        a = np.asarray(list_visits_bo).astype(int)
        np.savetxt("list_visits_bo_multi.csv", a, delimiter=",")

        if i > 100:
            continue

        # # BO
        # print("BO")
        # SamplerContinuous.voronoi = True
        # SamplerDiscrete.voronoi = True
        # reset_constraint_dict()
        # sk_visits = main(use_bo=1, visualization=0, new_problem=0, alg_CP_BO='prod')
        # list_visits_bo.append(int(sk_visits))
        # print(list_visits_bo)
        # a = np.asarray(list_visits_bo).astype(int)
        # np.savetxt("list_visits_bo_prod.csv", a, delimiter=",")

        # # Voronoi
        # print("Voronoi")
        # SamplerContinuous.voronoi = True
        # sk_visits = main(use_bo=0, visualization=0, new_problem=0)
        # list_visits_voronoi.append(int(sk_visits))
        # print(list_visits_voronoi)
        # a = np.asarray(list_visits_voronoi).astype(int)
        # np.savetxt("list_visits_voronoi.csv", a, delimiter=",")
        #

        # Random
        print("Random")
        SamplerContinuous.voronoi = False
        SamplerContinuous.voronoi = False
        sk_visits = main(use_bo=0, visualization=0, new_problem=0)
        list_visits_random.append(int(sk_visits))
        print(list_visits_random)
        a = np.asarray(list_visits_random).astype(int)
        np.savetxt("list_visits_random.csv", a, delimiter=",")
