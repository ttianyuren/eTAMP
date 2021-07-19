import time
from collections import Counter, defaultdict, namedtuple, Sequence
from itertools import count

from .pddlstream.language.constants import AND, get_prefix, get_args, is_parameter, Fact, concatenate, StreamAction
from .pddlstream.language.conversion import list_from_conjunction, substitute_expression, \
    get_formula_operators, values_from_objects, obj_from_value_expression, evaluation_from_fact
from .pddlstream.language.external import ExternalInfo, Result, Instance, External, parse_lisp_list
from .pddlstream.language.generator import get_next, from_fn
from .pddlstream.language.object import Object, OptimisticObject, UniqueOptmsValue, EXE_OptimisticObject, EXE_Object
from .pddlstream.utils import str_from_object, get_mapping, irange, apply_mapping, INF

VERBOSE_FAILURES = True
VERBOSE_WILD = False
DEFAULT_UNIQUE = False
NEGATIVE_BLOCKED = True
NEGATIVE_SUFFIX = '-negative'


# TODO: could also make only wild facts and automatically identify output tuples satisfying certified
# TODO: default effort cost of streams with more inputs to be higher (but negated are free)
# TODO: automatically convert to test streams on inputs

def get_empty_fn():
    return lambda *input_values: None


def get_constant_fn(constant):
    return lambda *input_values: constant


def get_identity_fn(indices):
    return lambda *input_values: tuple(input_values[i] for i in indices)


def is_active_arg(a):
    r = isinstance(a, OptimisticObject) or (isinstance(a, Object) and a.from_pps) or isinstance(a, EXE_OptimisticObject)
    return r


##################################################

# TODO: make wild the default output

class WildOutput(object):
    def __init__(self, values=[], facts=[], enumerated=False, replan=False):
        self.values = values
        self.facts = facts
        self.enumerated = enumerated
        self.replan = replan  # Reports back whether the problem has changed substantially

    def __iter__(self):
        return iter([self.values, self.facts])


class OptmsValue(namedtuple('OptmsValue', ['stream', 'inputs', 'input_objects', 'output'])):
    """
    A general key to an optimistic output object.
    stream: the name of the stream.
    inputs: the selected input parameters.
    input_objects: the arguments according to the inputs.
    output: The corresponding output parameter.
    """

    @property
    def values(self):
        return values_from_objects(self.input_objects)


class PartialInputs(object):
    def __init__(self, inputs='', unique=DEFAULT_UNIQUE):  # , num=1):
        """
        :param inputs: A subset of input parameters.
                       In not-unique setting, they are used to distinguish outputs under different inputs.
                       By default it is null, indicates that all optms outputs of a stream share the same object.
        """
        self.inputs = tuple(inputs.split())
        self.unique = unique
        # self.num = num

    def get_opt_gen_fn(self, stream_instance):
        stream = stream_instance.external
        _inputs = stream.inputs if self.unique else self.inputs
        assert set(_inputs) <= set(stream.inputs)

        # TODO: ensure no scoping errors with inputs
        def gen_fn(*input_values):
            input_objects = stream_instance.input_objects
            mapping = get_mapping(stream.inputs, input_objects)
            _objects = tuple(mapping[inp] for inp in _inputs)
            # for _ in irange(self.num):
            for _ in irange(stream_instance.num_optimistic):
                yield [tuple(OptmsValue(stream.name, _inputs, _objects, out)
                             for out in stream.outputs)]

        return gen_fn

    def __repr__(self):
        return repr(self.__dict__)


def get_constant_gen_fn(stream, constant):
    def gen_fn(*input_values):
        assert (len(stream.inputs) == len(input_values))
        yield [tuple(constant for _ in range(len(stream.outputs)))]

    return gen_fn


##################################################

def get_debug_gen_fn(stream):
    return from_fn(lambda *args: tuple(DebugValue(stream.name, args, o) for o in stream.outputs))


class DebugValue(object):  # TODO: could just do an object
    _output_counts = defaultdict(count)
    _prefix = '@'  # $ | @

    def __init__(self, stream, input_values, output_parameter):
        self.stream = stream
        self.input_values = input_values
        self.output_parameter = output_parameter
        self.index = next(self._output_counts[output_parameter])

    def __repr__(self):
        # Can also just return first letter of the prefix
        return '{}{}{}'.format(self._prefix, self.output_parameter[1:], self.index)


##################################################

class StreamInfo(ExternalInfo):
    def __init__(self, opt_gen_fn=PartialInputs(), negate=False, simultaneous=False, defer=False,
                 seed_gen_fn=None, free_generator=False, discrete=None, p1=None, p2=None, every_layer=100,
                 **kwargs):
        # TODO: could change frequency/priority for the incremental algorithm
        super(StreamInfo, self).__init__(**kwargs)
        self.opt_gen_fn = opt_gen_fn  # TODO: call this an abstraction instead
        self.negate = negate
        self.simultaneous = simultaneous
        self.defer = defer

        self.seed_gen_fn = seed_gen_fn
        """parameters for UCT planner"""
        self.free_generator = free_generator
        if free_generator:
            assert (discrete is not None) and (p1 is not None) and (p2 is not None)
        self.discrete = discrete
        self.p1 = p1  # continuous: weights            discrete: all choices
        self.p2 = p2  # continuous: exploration std    discrete: probabilities for each choice

        if self.discrete:
            assert self.p1
            if not self.p2:
                self.p2 = [1 for i in self.p1]

        # during optimistic evaluation, a new result will be generate every (*) layers.
        self.every_layer = every_layer


##################################################


class StreamResult(Result):
    """
    A Stream with optimistic inputs and optimistic outputs.
    """

    def __init__(self, instance, output_objects, opt_index=None,
                 call_index=None, list_index=None, optimistic=True):
        super(StreamResult, self).__init__(instance, opt_index, call_index, optimistic)
        self.output_objects = tuple(output_objects)
        assert len(self.output_objects) == len(self.external.outputs)
        self.list_index = list_index
        self._mapping = None
        self._certified = None
        self._stream_fact = None
        self.step_idx = None
        self.redundant = False

    @property
    def free_generator(self):
        return self.instance.external.info.free_generator

    @property
    def discrete(self):
        return self.instance.external.info.discrete

    @property
    def p1(self):
        return self.instance.external.info.p1

    @property
    def p2(self):
        return self.instance.external.info.p2

    @property
    def input_objects(self):
        return self.instance.input_objects

    @property
    def mapping(self):
        if self._mapping is None:
            self._mapping = get_mapping(self.external.outputs, self.output_objects)
            self._mapping.update(self.instance.get_mapping())
        return self._mapping

    def get_mapping(self):
        return self.mapping

    @property
    def stream_fact(self):
        if self._stream_fact is None:
            self._stream_fact = substitute_expression(self.external.stream_fact, self.mapping)
        return self._stream_fact

    @property
    def certified(self):
        if self._certified is None:
            self._certified = substitute_expression(self.external.certified, self.get_mapping())
        return self._certified

    def get_certified(self):
        return self.certified

    def get_action(self):
        return StreamAction(self.external.name, self.input_objects, self.output_objects)

    def remap_inputs(self, bindings):
        # TODO: speed this procedure up
        # if not any(o in bindings for o in self.instance.get_objects()):
        #    return self
        input_objects = apply_mapping(self.input_objects, bindings)
        fluent_facts = [Fact(get_prefix(f), apply_mapping(get_args(f), bindings))
                        for f in self.instance.fluent_facts]
        new_instance = self.external.get_instance(input_objects, fluent_facts=fluent_facts)
        new_instance.opt_index = self.instance.opt_index
        return self.__class__(new_instance, self.output_objects, self.opt_index,
                              self.call_index, self.list_index, self.optimistic)

    def remap_inputs_outputs_pps(self, mapping):
        # TODO: speed this procedure up
        # if not any(o in bindings for o in self.instance.get_objects()):
        #    return self
        input_objects = apply_mapping(self.input_objects, mapping)
        output_objects = apply_mapping(self.output_objects, mapping)
        fluent_facts = [Fact(get_prefix(f), apply_mapping(get_args(f), mapping))
                        for f in self.instance.fluent_facts]
        new_instance = self.external.get_instance(input_objects, fluent_facts=fluent_facts)
        new_instance.opt_index = self.instance.opt_index
        new_result = self.__class__(new_instance, output_objects, self.opt_index,
                                    self.call_index, self.list_index, self.optimistic)
        new_result.level = self.level
        return new_result

    def remap_inputs2(self, mapping):
        # TODO: speed this procedure up
        # if not any(o in bindings for o in self.instance.get_objects()):
        #    return self
        def mapping_fn(o):
            if is_active_arg(o):
                return mapping[o]
            else:
                return o

        input_objects = tuple(map(mapping_fn, self.input_objects))
        fluent_facts = [Fact(get_prefix(f), apply_mapping(get_args(f), mapping))
                        for f in self.instance.fluent_facts]
        new_instance = self.external.get_instance(input_objects, fluent_facts=fluent_facts)
        new_instance.opt_index = self.instance.opt_index
        return self.__class__(new_instance, self.output_objects, self.opt_index,
                              self.call_index, self.list_index, self.optimistic)

    def is_successful(self):
        return True

    def __repr__(self):
        return '{}:{}->{}'.format(self.external.name,
                                  str_from_object(self.instance.input_objects),
                                  str_from_object(self.output_objects))


class StreamInstance(Instance):
    _Result = StreamResult

    def __init__(self, stream, input_objects, fluent_facts):
        super(StreamInstance, self).__init__(stream, input_objects)
        self._generator = None
        self.opt_index = stream.num_opt_fns
        self.fluent_facts = frozenset(fluent_facts)
        opt_gen_fn = self.external.info.opt_gen_fn
        if isinstance(opt_gen_fn, PartialInputs):
            self.opt_gen_fn = opt_gen_fn.get_opt_gen_fn(self)  # by default,
        else:
            self.opt_gen_fn = opt_gen_fn  # or specified by the user.
        self.num_optimistic = 1  # indicate how many optms output tuples will be generated.
        self.previous_outputs = set()
        self._axiom_predicate = None
        self._disabled_axiom = None
        self.num_optms_eval = 0
        # TODO: keep track of unique outputs to prune repeated ones

    def _check_output_values(self, new_values):
        if not isinstance(new_values, Sequence):
            raise ValueError(
                'An output list for stream [{}] is not a sequence: {}'.format(self.external.name, new_values))
        for output_values in new_values:
            if not isinstance(output_values, Sequence):
                raise ValueError('An output tuple for stream [{}] is not a sequence: {}'.format(
                    self.external.name, output_values))
            if len(output_values) != len(self.external.outputs):
                raise ValueError('An output tuple for stream [{}] has length {} instead of {}: {}'.format(
                    self.external.name, len(output_values), len(self.external.outputs), output_values))

    def get_result(self, output_objects, opt_index=None, list_index=None, optimistic=True):
        # TODO: ideally would increment a flag per stream for each failure
        call_index = self.num_calls
        # call_index = self.successes # Only counts iterations that return results for complexity
        return self._Result(self, tuple(output_objects), opt_index=opt_index,
                            call_index=call_index, list_index=list_index, optimistic=optimistic)

    def use_unique(self):
        # return True
        return self.opt_index == 0

    def get_objects(self):  # TODO: lazily compute
        return set(self.input_objects) | {o for f in self.fluent_facts for o in get_args(f)}

    def generate_from_seed_pps(self, seed):
        input_tuple = self.get_input_values()  # gives condition of the generator
        output_value_tuple = self.external.info.seed_gen_fn(input_tuple, seed)
        # if not isinstance(outputs, WildOutput):
        #     outputs = WildOutput(outputs, [])
        # self._check_output_values(outputs)
        output_obj_tuple = None
        if output_value_tuple is not None:
            output_obj_tuple = tuple(map(Object.from_value_pps, output_value_tuple))
        # new_object = Object.from_value(output_tuple)
        return output_obj_tuple

    def next_unique_optimistic(self):

        optms_results = []
        output_set = set()
        # Length of the for-loop depends on instance.num_optimistic.
        for list_outputs in self.opt_gen_fn(*self.get_input_values()):
            self._check_output_values(list_outputs)
            # Length of list_outputs = 1 by default.
            for i, output_tuple in enumerate(list_outputs):
                outputs = []
                for output_index, optms_value in enumerate(output_tuple):
                    general_key = optms_value
                    unique_key = UniqueOptmsValue(self, self.num_optms_eval, output_index)
                    obj = OptimisticObject.from_optms(general_key, unique_key)
                    outputs.append(obj)
                outputs = tuple(outputs)
                if outputs not in output_set:
                    output_set.add(outputs)  # Avoid duplication
                    optms_results.append(self._Result(self, outputs, opt_index=self.opt_index,
                                                      call_index=self.num_optms_eval, list_index=0))
        self.num_optms_eval += 1
        return optms_results

    def __repr__(self):
        return '{}:{}->{},{}'.format(self.external.name, self.input_objects, self.external.outputs, self.opt_index)


##################################################

class Stream(External):
    _Instance = StreamInstance

    def __init__(self, name, inputs, domain, outputs, certified, info, fluents=[],
                 input_types=[], output_types=[]):
        super(Stream, self).__init__(name, info, inputs, domain)
        self.outputs = tuple(outputs)
        self.certified = tuple(certified)
        self.constants.update(a for i in certified for a in get_args(i) if not is_parameter(a))

        for p, c in Counter(self.outputs).items():
            if not is_parameter(p):
                raise ValueError('Output [{}] for stream [{}] is not a parameter'.format(p, name))
            if c != 1:
                raise ValueError('Output [{}] for stream [{}] is not unique'.format(p, name))
        for p in set(self.inputs) & set(self.outputs):
            raise ValueError('Parameter [{}] for stream [{}] is both an input and output'.format(p, name))
        certified_parameters = {a for i in certified for a in get_args(i) if is_parameter(a)}
        for p in (certified_parameters - set(self.inputs + self.outputs)):
            raise ValueError('Parameter [{}] for stream [{}] is not included within outputs'.format(p, name))
        for p in (set(self.outputs) - certified_parameters):
            print('Warning! Output [{}] for stream [{}] is not covered by a certified condition'.format(p, name))

        self.num_opt_fns = 1 if self.outputs else 0  # Always unique if no outputs
        if isinstance(self.info.opt_gen_fn, PartialInputs) and self.info.opt_gen_fn.unique:
            self.num_opt_fns = 0
        # self.bound_list_fn = None # TODO: generalize to a hierarchical sequence
        # self.opt_fns = [get_unique_fn(self), get_shared_fn(self)] # get_unique_fn | get_shared_fn

        if NEGATIVE_BLOCKED:
            self.blocked_predicate = '~{}{}'.format(self.name, NEGATIVE_SUFFIX)  # Args are self.inputs
        else:
            self.blocked_predicate = '~{}'.format(self.name)
        self.disabled_instances = []
        self.stream_fact = Fact('_{}'.format(name), concatenate(inputs, outputs))  # TODO: just add to certified?

        if input_types:
            self.input_types = tuple(input_types)
            assert len(self.input_types) == len(self.inputs)
        if output_types:
            self.output_types = tuple(output_types)
            assert len(self.output_types) == len(self.outputs)

        if self.is_negated():
            if self.outputs:
                raise ValueError('Negated streams cannot have outputs: {}'.format(self.outputs))
            # assert len(self.certified) == 1 # TODO: is it okay to have more than one fact?
            for certified in self.certified:
                if not (set(self.inputs) <= set(get_args(certified))):
                    raise ValueError('Negated streams must have certified facts including all input parameters')

    def is_negated(self):
        return self.info.negate

    def get_complexity(self, num_calls):
        # if self.is_negated():
        #    return INF
        return 1 + num_calls

    def is_special(self):
        return self.is_fluent() or self.is_negated()

    def get_instance(self, input_objects, fluent_facts=frozenset()):
        assert all(isinstance(obj, Object) or isinstance(obj, OptimisticObject) for obj in input_objects)
        key = (tuple(input_objects), frozenset(fluent_facts))
        if key not in self.instances:
            self.instances[key] = self._Instance(self, input_objects, fluent_facts)
        return self.instances[key]

    # TODO: method that converts a stream into a test stream

    def __repr__(self):
        return '{}:{}->{}'.format(self.name, self.inputs, self.outputs)


##################################################

class TypedObject(object):
    def __init__(self, name, type_name):
        self.name = name
        self.type_name = type_name

    def __hash__(self):
        return hash((self.name, self.type_name))

    def __eq__(self, other):
        return self.name == other.name and self.type_name == other.type_name

    def __ne__(self, other):
        return not self == other

    def __str__(self):
        return "%s: %s" % (self.name, self.type_name)

    def __repr__(self):
        return "<TypedObject %s: %s>" % (self.name, self.type_name)


def parse_typed_list(alist, only_variables=False,
                     constructor=TypedObject,
                     default_type="object"):
    result = []
    while alist:
        try:
            separator_position = alist.index("-")
        except ValueError:
            items = alist
            _type = default_type
            alist = []
        else:
            items = alist[:separator_position]
            _type = alist[separator_position + 1]
            alist = alist[separator_position + 2:]
        for item in items:
            assert not only_variables or item.startswith("?"), \
                "Expected item to be a variable: %s in (%s)" % (
                    item, " ".join(items))
            entry = constructor(item, _type)
            result.append(entry)
    return result


def parse_stream(lisp_list, stream_info):
    value_from_attribute = parse_lisp_list(lisp_list)
    assert set(value_from_attribute) <= {':stream', ':inputs', ':domain', ':fluents', ':outputs', ':certified'}
    name = value_from_attribute[':stream']
    domain = value_from_attribute.get(':domain', None)
    # TODO: dnf_from_positive_formula(value_from_attribute.get(':domain', []))
    if not (get_formula_operators(domain) <= {AND}):
        # TODO: allow positive DNF
        raise ValueError('Stream [{}] domain must be a conjunction'.format(name))
    certified = value_from_attribute.get(':certified', None)
    if not (get_formula_operators(certified) <= {AND}):
        raise ValueError('Stream [{}] certified must be a conjunction'.format(name))
    # name, gen_fn, inputs, domain, outputs, certified, info, fluents=[]):
    typed_inputs = parse_typed_list(value_from_attribute.get(':inputs', []))
    typed_outputs = parse_typed_list(value_from_attribute.get(':outputs', []))

    return Stream(name, inputs=[i.name for i in typed_inputs],
                  domain=list_from_conjunction(domain),
                  outputs=[o.name for o in typed_outputs],
                  certified=list_from_conjunction(certified),
                  info=stream_info.get(name, StreamInfo()),
                  fluents=value_from_attribute.get(':fluents', []),
                  input_types=[i.type_name for i in typed_inputs],
                  output_types=[o.type_name for o in typed_outputs])
