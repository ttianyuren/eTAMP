from collections import namedtuple
from collections import defaultdict


ConditionalEffect = namedtuple('ConditionalEffect', ['conditions', 'effect'])


def str_from_object(obj):  # str_object
    if type(obj) in [list]:  # , np.ndarray):
        return '[{}]'.format(', '.join(str_from_object(item) for item in obj))
    if type(obj) == tuple:
        return '({})'.format(', '.join(str_from_object(item) for item in obj))
    # if isinstance(obj, dict):
    if type(obj) in [dict, defaultdict]:
        return '{{{}}}'.format(', '.join('{}: {}'.format(str_from_object(key), str_from_object(obj[key])) \
                                         for key in sorted(obj.keys(), key=lambda k: str_from_object(k))))
    if type(obj) in [set, frozenset]:
        return '{{{}}}'.format(', '.join(sorted(str_from_object(item) for item in obj)))
    # if type(obj) in (float, np.float64):
    #    obj = round(obj, 3)
    #    if obj == 0: obj = 0  # NOTE - catches -0.0 bug
    #    return '%.3f' % obj
    # if isinstance(obj, types.FunctionType):
    #    return obj.__name__
    return str(obj)
    # return repr(obj)

class ActionInfo(object):
    def __init__(self, optms_cost_fn=None, cost_fn=None, env_handle=None):
        self.optms_cost_fn = optms_cost_fn  # How to estimate the cost function
        self.cost_fn = cost_fn
        self.env_handle = env_handle  # How the action change the env

    def __repr__(self):
        if self.optms_cost_fn is None and self.cost_fn is None:
            return 'Null ActionInfo'
        else:
            return 'ActionInfo: {},{},{}'.format(str_from_object(self.optms_cost_fn),
                                                 str_from_object(self.cost_fn),
                                                 str_from_object(self.env_handle), )
