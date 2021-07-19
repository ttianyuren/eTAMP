#!/usr/bin/env python
from run_branch_desk import *
import os

#######################################################


if __name__ == '__main__':

    append_data = 1
    fname = 'ctype_to_constraints_p1_p4_p3.pk'
    if append_data and os.path.isfile(fname):
        with open(fname, 'rb') as f:
            Constraint.ctype_to_constraints = pk.load(f)
            for ctype, cs in Constraint.ctype_to_constraints.items():
                print(f"#{ctype}# {cs[0]}: {len([c for c in cs if c.yg <= 0])}-{len([c for c in cs if c.yg > 0])}")

    list_visits = []
    for i in range(30):
        print(f'exp {i} -------------------------------------------------------------------')
        sk_visits = main(visualization=0, new_problem=0, use_bo=1)
        list_visits.append(int(sk_visits))

        with open(fname, 'wb') as f:
            pk.dump(Constraint.ctype_to_constraints, f)
            for ctype, cs in Constraint.ctype_to_constraints.items():
                print(f"#{ctype}# {cs[0]}: {len([c for c in cs if c.yg <= 0])}-{len([c for c in cs if c.yg > 0])}")

        print(list_visits)
        a = np.asarray(list_visits).astype(int)
        np.savetxt("list_visits_seq.csv", a, delimiter=",")
