import pandas as pd
import numpy  as np
from hebo.design_space.design_space import DesignSpace
from hebo.optimizers.hebo import HEBO


def obj(params: pd.DataFrame) -> np.ndarray:
    return ((params.values - 0.37) ** 2).sum(axis=1).reshape(-1, 1)


space = DesignSpace().parse([{'name': 'x1', 'type': 'num', 'lb': -3, 'ub':  3},
                             {'name': 'x2', 'type': 'num', 'lb': -3, 'ub':  3},
                             {'name': 'x3', 'type': 'num', 'lb': -3, 'ub':  3},])
opt = HEBO(space)
for i in range(5):
    rec = opt.suggest(n_suggestions=10)
    opt.observe(rec, obj(rec))
    print('After %d iterations, best obj is %.2f' % (i, opt.y.min()))
