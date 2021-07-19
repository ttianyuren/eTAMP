from collections import namedtuple
from itertools import count
from .constants import get_parameter_name
from ..utils import str_from_object, is_hashable
import hashlib

USE_HASH = True
USE_OBJ_STR = True
USE_OPT_STR = True
OPT_PREFIX = '#'


# EXE_Object = namedtuple('EXE_Object', ['pddl', 'value'])  # objects
# EXE_OptimisticObject = namedtuple('EXE_OptimisticObject', ['pddl', 'value', 'repr_name'])  # objects

def get_hash(str):
    return int(hashlib.sha256(str.encode('utf-8')).hexdigest(), 16) % 10 ** 8


class EXE_Object(object):
    _obj_from_value = {}
    _obj_from_pddl = {}

    def __init__(self, pddl, value):
        self.pddl = pddl
        self.value = value
        EXE_Object._obj_from_value[self.value] = self
        EXE_Object._obj_from_pddl[self.pddl] = self

    def __iter__(self):
        for o in [self.pddl, self.value]:
            yield o

    def __repr__(self):
        return f"{self.value}"

    def __eq__(self, other):
        if not isinstance(other, EXE_Object):
            # don't attempt to compare against unrelated types
            return NotImplemented

        return self.pddl == other.pddl

    def __hash__(self):
        return get_hash(self.pddl)


class EXE_OptimisticObject(object):
    _obj_from_value = {}
    _obj_from_pddl = {}

    def __init__(self, pddl, value, repr_name):
        self.pddl = pddl
        self.value = value
        self.repr_name = repr_name
        EXE_OptimisticObject._obj_from_value[self.value] = self
        EXE_OptimisticObject._obj_from_pddl[self.pddl] = self

    def __iter__(self):
        for o in [self.pddl, self.value, self.repr_name]:
            yield o

    def __repr__(self):
        return f"{self.pddl}"

    def __eq__(self, other):
        if not isinstance(other, EXE_OptimisticObject):
            # don't attempt to compare against unrelated types
            return NotImplemented

        return self.pddl == other.pddl

    def __hash__(self):
        return get_hash(self.pddl)


#
# class EXE_Object(object):
#     __slots__ = 'pddl', 'value'
#
#     def __init__(self, pddl, value):
#         self.pddl = pddl
#         self.value = value

def is_number(str):
    try:
        # 因为使用float有一个例外是'NaN'
        if str == 'NaN':
            return False
        float(str)
        return True
    except ValueError:
        return False


def get_new_optmsEXE_obj():
    pddl = '#od{}'.format(OptimisticObject.count)
    OptimisticObject.count += 1
    return EXE_OptimisticObject(pddl, pddl, pddl)


class Object(object):
    _prefix = 'v'
    _obj_from_id = {}
    _obj_from_value = {}
    _obj_from_name = {}  # Mapping from name(or pddl) to OptimisticObject

    def __init__(self, value, stream_instance=None, name=None):
        self.value = value
        self.index = len(Object._obj_from_name)
        if name is None:
            try:
                name = value.__repr__()
                if is_number(name):
                    name = 'o' + name
            except:
                name = '{}{}'.format(self._prefix, self.index)
        self.pddl = name
        self.stream_instance = stream_instance  # TODO: store first created stream instance
        self.from_pps = False
        Object._obj_from_id[id(self.value)] = self
        Object._obj_from_name[self.pddl] = self
        if is_hashable(value):
            Object._obj_from_value[self.value] = self

    @staticmethod
    def from_id(value):
        if id(value) not in Object._obj_from_id:
            return Object(value)
        return Object._obj_from_id[id(value)]

    @staticmethod
    def has_value(value):
        if USE_HASH and not is_hashable(value):
            return id(value) in Object._obj_from_id
        return value in Object._obj_from_value

    @staticmethod
    def from_value(value):
        if USE_HASH and not is_hashable(value):
            return Object.from_id(value)
        if value not in Object._obj_from_value:
            return Object(value)
        return Object._obj_from_value[value]

    @staticmethod
    def from_value_pps(value):
        if USE_HASH and not is_hashable(value):
            r = Object.from_id(value)
            r.from_pps = True
            return r
        if value not in Object._obj_from_value:
            r = Object(value)
            r.from_pps = True
            return r
        r = Object._obj_from_value[value]
        r.from_pps = True
        return r

    @staticmethod
    def from_name(name):
        return Object._obj_from_name[name]

    @staticmethod
    def reset():
        Object._obj_from_id.clear()
        Object._obj_from_value.clear()
        Object._obj_from_name.clear()

    def get_EXE(self):
        return EXE_Object(self.pddl, self.value)

    def __lt__(self, other):  # For heapq on python3
        return self.index < other.index

    def __repr__(self):
        if USE_OBJ_STR:
            return str_from_object(self.value)  # str
        return self.pddl


# TODO: just one object class or have Optimistic extend Object
# TODO: make a parameter class that has access to some underlying value

UniqueOptmsValue = namedtuple('UniqueOptms', ['instance', 'sequence_index', 'output_index'])


class OptimisticObject(object):
    _prefix = '{}o'.format(OPT_PREFIX)  # $ % #
    """Global dictionaries."""
    _obj_from_inputs = {}
    _obj_from_name = {}  # Mapping from name(or pddl) to OptimisticObject
    _count_from_prefix = {}
    count = 0

    def __init__(self, value, param):
        # TODO: store first created instance
        self.value = value
        self.param = param
        self.index = len(OptimisticObject._obj_from_inputs)
        self.pddl = '{}{}'.format(self._prefix, self.index)
        self.repr_name = self.pddl
        if USE_OPT_STR and isinstance(self.param, UniqueOptmsValue):
            # TODO: instead just endow UniqueOptValue with a string function
            parameter = self.param.instance.external.outputs[self.param.output_index]
            prefix = get_parameter_name(parameter)[:1]
            var_index = next(self._count_from_prefix.setdefault(prefix, count()))
            self.repr_name = '{}{}{}'.format(OPT_PREFIX, prefix, var_index)  # self.index)
            self.pddl = self.repr_name
        OptimisticObject._obj_from_inputs[(value, param)] = self
        OptimisticObject._obj_from_name[self.pddl] = self

    @staticmethod
    def from_optms(value, param):
        # TODO: make param have a default value?
        key = (value, param)
        if key not in OptimisticObject._obj_from_inputs:
            return OptimisticObject(value, param)
        return OptimisticObject._obj_from_inputs[key]

    @staticmethod
    def from_name(name):
        return OptimisticObject._obj_from_name[name]

    @staticmethod
    def reset():
        OptimisticObject._obj_from_inputs.clear()
        OptimisticObject._obj_from_name.clear()
        OptimisticObject._count_from_prefix.clear()

    def get_EXE(self):
        return EXE_OptimisticObject(self.pddl, None, self.repr_name)

    def __lt__(self, other):  # For heapq on python3
        return self.index < other.index

    def __repr__(self):
        return self.repr_name
        # return repr(self.repr_name) # Prints in quotations
