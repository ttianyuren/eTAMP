from collections import defaultdict, namedtuple, Sized
from heapq import heappush, heappop
from itertools import product

from .pddlstream.algorithms.common import COMPLEXITY_OP
from .pddlstream.language.constants import is_parameter
from .pddlstream.language.conversion import is_positive_evals, head_from_fact, fact_from_head
from .pddlstream.utils import safe_zip, HeapElement
from .pddlstream.language.object import OptimisticObject


# TODO: maybe store unit complexity here as well as a tiebreaker
Priority = namedtuple('Priority', ['level', 'num'])  # num ensures FIFO


def is_instance(atom, schema):
    return (atom.function == schema.function) and \
           all(is_parameter(b) or (a == b)
               for a, b in safe_zip(atom.args, schema.args))


def is_instance2(atom, schema):
    return (atom[0] == schema[0]) and \
           all(is_parameter(b) or (a == b)
               for a, b in safe_zip(atom[1:], schema[1:]))


def test_mapping(atoms1, atoms2):
    """
    :param atoms1: Head
    """
    mapping = {}
    for a1, a2 in safe_zip(atoms1, atoms2):
        assert a1.function == a2.function
        for arg1, arg2 in safe_zip(a1.args, a2.args):
            if mapping.get(arg1, arg2) == arg2:
                mapping[arg1] = arg2
            else:
                return None
    return mapping


def test_mapping2(atoms1, atoms2):
    """
    :param atoms1: Head
    """
    mapping = {}
    for a1, a2 in safe_zip(atoms1, atoms2):
        assert a1[0] == a2[0]
        for arg1, arg2 in safe_zip(a1[1:], a2[1:]):
            if mapping.get(arg1, arg2) == arg2:
                mapping[arg1] = arg2
            else:
                return None
    return mapping


##################################################

# http://citeseerx.ist.psu.edu/viewdoc/download?doi=10.1.1.43.7049&rep=rep1&type=pdf

class Instantiator(Sized):  # Dynamic Instantiator
    def __init__(self, streams, evaluations={}):
        # TODO: lazily instantiate upon demand
        self.streams = streams
        # self.streams_from_atom = defaultdict(list)
        self.queue = []
        self.num_pushes = 0  # shared between the queues
        # TODO: rename atom to head in most places
        self.head_to_level = {}
        self.atoms_from_domain = defaultdict(list)
        for stream in self.streams:
            if not stream.domain:
                assert not stream.inputs
                instance = stream.get_instance([])
                self.push_instance(instance)
        for atom, node in evaluations.items():
            self.add_atom(atom, node.complexity)
        # TODO: revisit deque and add functions to front

    #########################

    def __len__(self):
        return len(self.queue)

    def compute_complexity(self, instance):
        domain_complexity = COMPLEXITY_OP([self.head_to_level[head_from_fact(f)]
                                           for f in instance.get_domain()] + [0])
        return domain_complexity + instance.external.get_complexity(instance.num_calls)

    def push_instance(self, instance):
        # TODO: flush stale priorities?
        level = self.compute_complexity(instance)
        priority = Priority(level, self.num_pushes)
        heappush(self.queue, HeapElement(priority, instance))
        self.num_pushes += 1

    def pop_stream(self):
        priority, instance = heappop(self.queue)
        return instance

    def min_level(self):
        priority, _ = self.queue[0]
        return priority.level

    #########################

    def _add_combinations(self, stream, domain_atoms):
        if not all(domain_atoms):
            return
        """When all domain predicates of the stream have their own optimistic evaluations(facts)"""
        domain = list(map(head_from_fact, stream.domain))
        for combo in product(*domain_atoms):
            mapping = test_mapping(domain, combo)
            if mapping is not None:
                input_objects = tuple(mapping[para] for para in stream.inputs)
                instance = stream.get_instance(input_objects)
                self.push_instance(instance)

    def _add_new_instances(self, new_head):
        for s_idx, stream in enumerate(self.streams):
            for d_idx, domain_fact in enumerate(stream.domain):
                domain_head = head_from_fact(domain_fact)
                if is_instance(new_head, domain_head):
                    # TODO: handle domain constants more intelligently
                    self.atoms_from_domain[s_idx, d_idx].append(new_head)
                    domain_atoms = [self.atoms_from_domain[s_idx, d2_idx] if d_idx != d2_idx else [new_head]
                                    for d2_idx in range(len(stream.domain))]
                    self._add_combinations(stream, domain_atoms)
                    # self._add_combinations_relation(stream, atoms)

    def add_new_atom(self, new_head):
        for s_idx, stream in enumerate(self.streams):
            for d_idx, domain_fact in enumerate(stream.domain):
                domain_head = head_from_fact(domain_fact)
                if is_instance(new_head, domain_head):
                    # TODO: handle domain constants more intelligently
                    self.atoms_from_domain[s_idx, d_idx].append(new_head)

    def add_atom(self, evaluation, level):
        """
        Try to add new evaluations for stream domain facts.
        And thereafter add new instances for the stream
        Not ALL evaluations will be accepted!

        Return True if it is a new evaluation.

        :param evaluation: e.g., Evaluation(head=Head(function='conf', args=(q800,)), value=True)
        :param level: level of the input evaluation
        """
        if evaluation.value is False:
            return False
        head = evaluation.head
        if head in self.head_to_level:
            assert self.head_to_level[head] <= level
            return False
        self.head_to_level[head] = level
        self._add_new_instances(head)
        return True


class Instantiator2(object):  # Dynamic Instantiator
    def __init__(self, streams, evaluations={}):

        self.streams = streams

        for stream in streams:
            for k, v in stream.instances.items():
                del v
            stream.instances = {}
        OptimisticObject.reset()

        self.atoms_from_domain = defaultdict(list)

        self.new_results = []

        for head, node in evaluations.items():
            self.add_new_fact(fact_from_head(head))

        self.num_layer = 0

        self.instance_to_count = {}

    #########################

    def test_instance(self, instance):
        if not instance:
            return False

        if instance.num_optms_eval * instance.external.info.every_layer > self.num_layer:
            return False
        return True

    def add_combinations(self, stream, domain_atoms):
        instances = []
        if not all(domain_atoms):
            return []
        """When all domain predicates of the stream have their own optimistic evaluations(facts)"""
        domain = list(stream.domain)
        for combo in product(*domain_atoms):
            mapping = test_mapping2(domain, combo)
            if mapping is not None:
                input_objects = tuple(mapping[para] for para in stream.inputs)
                instance = stream.get_instance(input_objects)
                if self.test_instance(instance):
                    instances.append(instance)
        return instances

    def add_layer_instances(self):
        """Instances that will be used to generate new facts later"""
        instances = []
        for s_idx, stream in enumerate(self.streams):
            domain_atoms = [self.atoms_from_domain[s_idx, d_idx]
                            for d_idx in range(len(stream.domain))]
            instances.extend(self.add_combinations(stream, domain_atoms))
        return instances

    def add_new_fact(self, fact):
        for s_idx, stream in enumerate(self.streams):
            for d_idx, domain_fact in enumerate(stream.domain):
                if is_instance2(fact, domain_fact):
                    # TODO: handle domain constants more intelligently
                    self.atoms_from_domain[s_idx, d_idx].append(fact)

    def add_layer_atoms(self, instances):
        for instance in instances:
            instance.opt_index = 0
            results = instance.next_unique_optimistic()
            for result in results:
                for fact in result.get_certified():
                    self.add_new_fact(fact)
                self.new_results.append(result)

    def iterate(self, iteration=1):
        for i in range(iteration):
            instances = self.add_layer_instances()
            self.add_layer_atoms(instances)
            self.num_layer += 1

    def get_new_results(self):
        return self.new_results
