import os
import shutil
import pickle
from datetime import datetime
from collections import defaultdict, OrderedDict

from pddlstream.language.constants import pAction, pA_info, pAtom
from pddlstream.language.conversion import pddl2obj
from collections import namedtuple
from copy import deepcopy, copy
from pddlstream.language.stream import StreamResult
from pddlstream.language.object import Object, OptimisticObject, get_new_optmsEXE_obj
from pddlstream.utils import INF, safe_zip, get_mapping, implies, read, INF
from pddlstream.algorithms.downward import parse_lisp
import itertools
from symk.main import run_symk
from pddlstream.language.stream import is_active_arg
from utils.pybullet_tools.utils import HideOutput

CONSTRAIN_STREAMS = True
CONSTRAIN_PLANS = True  # False  True
MAX_DEPTH = INF  # 1 | INF

PDDL_DIR = 'pddl'

PREDICATE_ORDER = "_applicable"
PARA_PROPO = '_p'
TYPE_PROPO = 'propo_action'

PREDICATE_UNUSED = "_unused"
PARA_UNUSED = '_s'
TYPE_UNUSED = 'propo_stream'

NT_Domain = namedtuple('NT_Domain',
                       ['name', 'requirements', 'types', 'type_to_constants',
                        'predicates', 'predicate_to_typeList', 'derived', 'action', 'functions'])
NT_Problem = namedtuple('NT_Problem',
                        ['name', 'domain', 'type_to_objects', 'init', 'goal', 'metric'])
NT_Action = namedtuple('NT_Action', ['name', 'parameters', 'precondition', 'effect'])
NT_Stream = namedtuple('NT_Stream',
                       ['name', 'inputs', 'domain', 'outputs', 'certified', 'input_type_list', 'output_type_list'])

EXE_Action = namedtuple('EXE_Action', ['name', 'parameters', 'add_effects'])  # objects
EXE_Stream = namedtuple('EXE_Stream', ['name', 'inputs', 'outputs'])  # objects


# class EXE_Action(object):
#     def __init__(self, name, parameters, add_effects):
#         self.name = name
#         self.parameters = parameters
#         self.add_effects = add_effects
#
#     def __repr__(self):
#         return 'A-{}: {}'.format(self.name, self.parameters)
#
#
# class EXE_Stream(object):
#     def __init__(self, name, inputs, outputs):
#         self.name = name
#         self.inputs = inputs
#         self.outputs = outputs
#
#     def __repr__(self):
#         return 'S-{}: {} -> {}'.format(self.name, self.inputs, self.outputs)


def remap_action_args(action, mapping, all_para=False):
    def mapping_fn(o):
        if (is_active_arg(o) or all_para) and o in mapping:
            return mapping[o]
        else:
            return o

    # mapping_fn = lambda o: mapping[o]
    name, optms_args, add_effects = action.name, action.parameters, action.add_effects
    new_args = tuple(map(mapping_fn, optms_args))

    new_add_effects = []
    for patom in add_effects:
        new_patom = pAtom(patom.name, tuple(map(mapping_fn, patom.args)))
        new_add_effects.append(new_patom)

    return EXE_Action(name, new_args, new_add_effects)


def remap_stream_args(stream, mapping, all_para=False):
    def mapping_fn(o):
        if (is_active_arg(o) or all_para) and o in mapping:
            return mapping[o]
        else:
            return o

    new_inputs = tuple(map(mapping_fn, stream.inputs))
    new_outputs = tuple(map(mapping_fn, stream.outputs))

    return EXE_Stream(stream.name, new_inputs, new_outputs)


def get_original_name(propo_name):
    return propo_name[propo_name.index('_') + 1:]


def create_pAtom(atom):
    return pAtom(atom.predicate, [pddl2obj(a) for a in atom.args])


def get_pAtom_exe(patom):
    return pAtom(patom.name, tuple([o.get_EXE() for o in patom.args]))


def substitute_alist(alist, mapping):
    if isinstance(alist, list):
        return [substitute_alist(a, mapping) for a in alist]
    else:
        return mapping.get(alist, alist)


def alist_to_str(alist):
    if isinstance(alist, list):
        return '(' + ' '.join([alist_to_str(a) for a in alist]) + ')'
    else:
        return str(alist)


def remove_types(alist):
    new_list = []
    for i, a in enumerate(alist):
        if alist[i] == '-' or (i > 0 and alist[i - 1] == '-'):
            continue
        new_list.append(a)
    return new_list


def action_from_result(result, name_to_nt, propo_to_result, type_to_constants):
    nt_stream = name_to_nt[result.external.name]
    mapping = {}
    for k, v in result.mapping.items():
        mapping[k] = v.pddl

    name = 's' + str(len(propo_to_result)) + '_' + nt_stream.name
    parameters = substitute_alist(nt_stream.inputs, mapping)
    parameters = remove_types(parameters)
    precondition = substitute_alist(nt_stream.domain, mapping)
    effect = substitute_alist(nt_stream.certified, mapping)

    outputs = substitute_alist(nt_stream.outputs, mapping)
    outputs = remove_types(outputs)
    for i, t in enumerate(nt_stream.output_type_list):
        type_to_constants[t].add(outputs[i])

    propo_to_result[name] = result

    # s = alist_to_str(precondition)

    return NT_Action(name, parameters, precondition, effect), type_to_constants


def parse_type_group(alist):
    type_to_items = defaultdict(set)
    split_points = [i + 2 for i in range(len(alist)) if alist[i] == '-']
    list_tuple = []
    for i, point in enumerate(split_points):
        pre = 0
        if i > 0:
            pre = split_points[i - 1]
        list_tuple.append(alist[pre:point])
    for t in list_tuple:
        type_to_items[t[-1]] |= set(t[:-2])
    return type_to_items


def parse_type_couple(alist):
    list_couple = []
    split_points = [i + 2 for i in range(len(alist)) if alist[i] == '-']
    list_tuple = []
    for i, point in enumerate(split_points):
        pre = 0
        if i > 0:
            pre = split_points[i - 1]
        list_tuple.append(alist[pre:point])
    for t in list_tuple:
        for p in t[:-2]:
            list_couple.append((p, t[-1]))

    return list_couple


def build_nt_domain(pddl_path):
    domain_text = read(pddl_path)

    domain_blocks = parse_lisp(domain_text)

    name = ''
    action = []
    derived = []
    function = []
    requirements = []
    types = []
    constants = []
    type_to_constants = defaultdict(set)
    predicates = []
    predicate_to_typeList = defaultdict(list)

    for block in domain_blocks:
        if block[0] == 'domain':
            name = block[1]
        field = block[0][1:]
        if field in NT_Domain._fields:
            if field == 'action':
                nt_action = NT_Action(block[1],
                                      block[block.index(':parameters') + 1],
                                      block[block.index(':precondition') + 1],
                                      block[block.index(':effect') + 1])
                action.append(nt_action)
            elif field == 'functions':
                if ['total-cost'] in block[1:]:
                    function.append('(total-cost) - number')
            elif field == 'derived':
                derived.append(block[1:])
            elif field == 'requirements':
                requirements.extend(block[1:])
            elif field == 'types':
                types.extend(block[1:])
            elif field == 'constants':
                type_to_constants = parse_type_group(block[1:])
                constants.extend(block[1:])
            elif field == 'predicates':
                predicates.extend(block[1:])
                for prd in block[1:]:
                    list_couple = parse_type_couple(prd[1:])
                    predicate_to_typeList[prd[0]] = [c[1] for c in list_couple]

    nt_domain = NT_Domain(name, requirements, types, type_to_constants,
                          predicates, predicate_to_typeList, derived, action, function)

    return nt_domain


def build_nt_problem(nt_domain, _init, _goal):
    name = 'put-wuti'

    type_to_objects = defaultdict(set)

    init = []
    goal = set()

    for atom in _init:
        if atom.predicate not in nt_domain.predicate_to_typeList:
            continue
        # assert atom.predicate in nt_domain.predicate_to_typeList
        for i, arg in enumerate(atom.args):
            tp = nt_domain.predicate_to_typeList[atom.predicate][i]
            type_to_objects[tp].add(arg)

        # init.add(tuple([atom.predicate] + list(atom.args) if atom.args else []))
        init.append([atom.predicate] + list(atom.args))

    # init = list(init)
    # init = [list(i) for i in init if i]

    init.sort()
    for a in _goal.parts:
        goal.add(tuple([a.predicate] + list(a.args)))
    # goal = list(goal)
    goal = [list(i) for i in goal if i]
    goal.sort()
    goal = ['and'] + goal

    metric = []
    if any(['total-cost' in fn for fn in nt_domain.functions]):
        metric = '(:metric minimize (total-cost))'

    nt_problem = NT_Problem(name, nt_domain, type_to_objects, init, goal, metric)

    return nt_problem


def apply_streams_domain(nt_domain, optms_results, stream_file):
    """Add stream results into domain as actions"""

    stream_text = read(stream_file)

    stream_blocks = parse_lisp(stream_text)

    name_to_ntStream = {}

    for block in stream_blocks:
        if block[0] == ':stream':
            list_couple = parse_type_couple(block[block.index(':inputs') + 1])
            input_type_list = [c[1] for c in list_couple]
            list_couple = parse_type_couple(block[block.index(':outputs') + 1])
            output_type_list = [c[1] for c in list_couple]

            stream = NT_Stream(block[1],
                               block[block.index(':inputs') + 1],
                               block[block.index(':domain') + 1],
                               block[block.index(':outputs') + 1],
                               block[block.index(':certified') + 1],
                               input_type_list,
                               output_type_list)
            name_to_ntStream[block[1]] = stream

    inst_to_result = {}  # 1-1 mapping

    new_type_to_constants = nt_domain.type_to_constants

    new_actions = nt_domain.action

    for result in optms_results:
        new_action, new_type_to_constants = action_from_result(result, name_to_ntStream,
                                                               inst_to_result, new_type_to_constants)
        new_actions.append(new_action)
        inst_to_result[new_action.name] = result

    new_domain = NT_Domain(nt_domain.name, nt_domain.requirements, nt_domain.types, new_type_to_constants,
                           nt_domain.predicates,
                           nt_domain.predicate_to_typeList, nt_domain.derived, new_actions, [])

    return new_domain, inst_to_result


def dump_domain(nt_domain, file_name, comment=''):
    with open(file_name, 'w+') as f:

        f.write(';{}\n\n'.format(datetime.now().strftime("%H:%M:%S %d/%m")))

        if comment != '':
            f.write(';{}\n\n'.format(comment))

        f.write('(define (domain {})\n'.format(nt_domain.name))

        f.write('   (:requirements ' + ' '.join(nt_domain.requirements) + ')\n\n')

        f.write('   (:types\n')
        f.write('          ' + ' '.join(nt_domain.types) + '\n')
        f.write('   )\n\n')

        f.write('   (:constants\n')
        for t, cs in nt_domain.type_to_constants.items():
            cs = list(cs)
            cs.sort()
            f.write('          ' + ' '.join(cs) + ' - {}\n'.format(t))
        f.write('   )\n\n')

        f.write('   (:predicates\n')
        for p in nt_domain.predicates:
            f.write('          {}\n'.format(alist_to_str(p)))
        f.write('   )\n\n')

        if nt_domain.functions:
            f.write('   (:functions\n')
            for fn in nt_domain.functions:
                f.write('          {}\n'.format(fn))

            f.write('   )\n')
            f.write('\n')

        for d in nt_domain.derived:
            f.write('   (:derived {}\n'.format(alist_to_str(d[0])))
            f.write('          {}\n'.format(alist_to_str(d[1])))

            f.write('   )\n')
        f.write('\n')

        for a in nt_domain.action:
            f.write('   (:action {}\n'.format(a.name))
            f.write('          :parameters {}\n'.format(alist_to_str(a.parameters)))
            f.write('          :precondition {}\n'.format(alist_to_str(a.precondition)))
            f.write('          :effect {}\n'.format(alist_to_str(a.effect)))
            f.write('   )\n')

        f.write(')\n')


def dump_problem(nt_problem, file_name, comment=''):
    with open(file_name, 'w+') as f:

        f.write(';{}\n\n'.format(datetime.now().strftime("%H:%M:%S %d/%m")))

        if comment != '':
            f.write(';{}\n\n'.format(comment))

        f.write('(define (problem {})\n'.format(nt_problem.name))

        f.write('   (:domain {})\n\n'.format(nt_problem.domain.name))

        f.write('   (:objects\n')
        for tp, objs in nt_problem.type_to_objects.items():
            objs = list(objs)
            objs.sort()
            f.write('          ' + ' '.join(objs) + ' - {}\n'.format(tp))
        f.write('   )\n\n')

        f.write('   (:init\n')
        for a in nt_problem.init:
            f.write('          {}\n'.format(alist_to_str(a)))
        if nt_problem.metric:
            f.write('          {}\n'.format('(= (total-cost) 0)'))
        f.write('   )\n\n')

        f.write('   (:goal\n')
        f.write('        {}\n'.format(alist_to_str(nt_problem.goal)))
        f.write('   )\n\n')

        if nt_problem.metric:
            f.write('   {}\n\n'.format(nt_problem.metric))

        f.write(')\n')


def propo_domain_problem(original_domain, original_problem, optms_results, sas_file_path, stream_file):
    """For stream_plan retrace."""
    sas_plan_text = read(sas_file_path)

    action_lines = sas_plan_text.splitlines()
    action_lines = [l for l in action_lines if not l.startswith(';')]

    action_blocks = [l[1:-1].split(' ') for l in action_lines]

    """Domain"""
    new_actions = []
    for i, block in enumerate(action_blocks):
        name = block[0]
        args = block[1:]
        nt_action = [a for a in original_domain.action if a.name == name]
        assert len(nt_action) == 1
        nt_action = nt_action[0]
        parameters = remove_types(nt_action.parameters)
        mapping = {o: n for o, n in zip(parameters, args)}
        new_name = 'a' + str(i) + '_' + name
        new_parameters = substitute_alist(parameters, mapping)
        # new_parameters.append(PARA_PROPO + str(i))

        new_precondition = substitute_alist(nt_action.precondition, mapping)
        added_precond = [PREDICATE_ORDER, PARA_PROPO + str(i)]

        if new_precondition[0] != 'and':
            new_precondition = ['and', new_precondition]

        new_precondition.append(added_precond)

        new_effect = substitute_alist(nt_action.effect, mapping)
        added_effect0 = ['not', added_precond]
        added_effect1 = [PREDICATE_ORDER, PARA_PROPO + str(i + 1)]
        if new_effect[0] == 'and':
            new_effect.append(added_effect0)
            new_effect.append(added_effect1)
        else:
            new_effect = ['and', new_effect, added_effect0, added_effect1]

        new_nt = NT_Action(new_name, new_parameters, new_precondition, new_effect)
        new_actions.append(new_nt)

    new_predicates = original_domain.predicates + [[PREDICATE_ORDER, '?' + PARA_PROPO, '-', TYPE_PROPO]]
    new_types = original_domain.types + [TYPE_PROPO]

    new_domain = NT_Domain(original_domain.name + '_propo', original_domain.requirements,
                           new_types, original_domain.type_to_constants,
                           new_predicates, original_domain.predicate_to_typeList,
                           original_domain.derived, new_actions, [])
    """Problem"""
    new_type_to_objects = deepcopy(original_problem.type_to_objects)
    new_type_to_objects[TYPE_PROPO] |= set(PARA_PROPO + str(i) for i in range(len(new_actions) + 1))

    new_goal = [PREDICATE_ORDER, PARA_PROPO + str(len(new_actions))]

    new_init = deepcopy(original_problem.init)
    added_init = [PREDICATE_ORDER, PARA_PROPO + '0']
    new_init.append(added_init)

    new_problem = NT_Problem(original_problem.name + '_propo', new_domain,
                             new_type_to_objects, new_init, new_goal, None)

    new_domain, propo_to_stream = apply_streams_domain(new_domain, optms_results, stream_file)

    return new_domain, new_problem, propo_to_stream


def extract_args(alist):
    if isinstance(alist, list):
        if len(alist) == 1:
            return []
        else:
            result = []
            for l in alist[1:]:
                result += extract_args(l)
            return result
    else:
        return [alist]


def reorder_domain_problem(propo_domain, propo_problem, stream_names, action_names):
    """To find streams for each step."""

    """Domain"""
    list_ncp = []  # list of nt_action-consumed-produced
    stream_outs = set()

    for i, nt_action in enumerate(propo_domain.action):
        if nt_action.name[0] == 'a' and (nt_action.name in action_names):
            precondition_args = set(extract_args(nt_action.precondition))
            list_ncp.append([nt_action, precondition_args, set()])

        if nt_action.name[0] == 's' and (nt_action.name in stream_names):
            precondition_args = set(extract_args(nt_action.precondition))
            effect_args = set(extract_args(nt_action.effect))
            gen_args = effect_args - precondition_args
            stream_outs |= gen_args
            list_ncp.append([nt_action, precondition_args, gen_args])

    list_nd = []
    for ncp in list_ncp:
        ncp[1] = ncp[1] & stream_outs
        list_nd.append([ncp[0], set()])

    # list of nt_action-delete
    list_add_s = []

    for i in range(len(list_ncp)):
        ncp_a = list_ncp[i]
        # nt_action = ncp_a[0]
        # consumed = ncp_a[1]
        # produced = ncp_a[2]
        nd_a = list_nd[i]
        if ncp_a[0].name[0] == 's':
            list_add_s.append('_' + ncp_a[0].name.split('_')[0])

        for j in range(i + 1, len(list_ncp)):
            ncp_b = list_ncp[j]
            nd_b = list_nd[j]
            if ncp_b[2] & ncp_a[1]:
                nd_a[1].add('_' + ncp_b[0].name.split('_')[0])
            if ncp_a[2] & ncp_b[1]:
                nd_b[1].add('_' + ncp_a[0].name.split('_')[0])

    new_actions = []
    for nd in list_nd:
        nt_action = nd[0]
        deletes = nd[1]

        """add effect 1"""
        added_effect0 = []
        for d in deletes:
            added_effect0.append(['not', [PREDICATE_UNUSED, d]])

        new_effect = None
        added_effect1 = None
        if nt_action.name[0] == 'a':
            assert nt_action.effect[-1][0] == PREDICATE_ORDER and nt_action.effect[0] == 'and'
            """add effect 2"""
            effect_cond = ['and']
            for s in list_add_s:
                if s not in deletes:
                    effect_cond += [['not', [PREDICATE_UNUSED, s]]]

            added_effect1 = ['when', effect_cond, nt_action.effect[-1]]
            if len(effect_cond) == 1:
                added_effect1 = nt_action.effect[-1]
            if len(effect_cond) == 2:
                added_effect1 = ['when', effect_cond[1], nt_action.effect[-1]]

            new_effect = nt_action.effect[:-1]
            for e in added_effect0:
                new_effect.append(e)
            new_effect.append(added_effect1)

        if nt_action.name[0] == 's':
            add_s = '_' + nt_action.name.split('_')[0]
            """add effect 2"""
            added_effect1 = [PREDICATE_UNUSED, add_s]

            new_effect = nt_action.effect
            if new_effect[0] != 'and':
                new_effect = ['and', new_effect]

        assert new_effect is not None and added_effect1 is not None
        for e0 in added_effect0:
            new_effect.append(e0)
        new_effect.append(added_effect1)

        new_nt = NT_Action(nt_action.name, nt_action.parameters, nt_action.precondition, new_effect)
        new_actions.append(new_nt)

    new_types = deepcopy(propo_domain.types)
    new_types.append(TYPE_UNUSED)

    new_predicates = deepcopy(propo_domain.predicates)
    new_predicates.append([PREDICATE_UNUSED, '?' + PARA_UNUSED, '-', TYPE_UNUSED])

    new_domain = NT_Domain(propo_domain.name + '_reorder', propo_domain.requirements,
                           new_types, propo_domain.type_to_constants,
                           new_predicates, propo_domain.predicate_to_typeList,
                           propo_domain.derived, new_actions, [])
    """Problem"""
    new_type_to_objects = deepcopy(propo_problem.type_to_objects)
    new_type_to_objects[TYPE_UNUSED] |= set(list_add_s)

    new_problem = NT_Problem(propo_problem.name + '_reorder', new_domain,
                             new_type_to_objects, propo_problem.init, propo_problem.goal, None)

    return new_domain, new_problem


def run_pddl_planner(nt_domain, nt_problem, target_result_num, result_dir_name,
                     pddl_file_prefix='', pddl_comment=''):
    if os.path.isdir(result_dir_name):
        shutil.rmtree(result_dir_name)
    os.mkdir(result_dir_name)

    cur_dir = os.getcwd()

    domain_path = cur_dir + '/' + PDDL_DIR + '/' + pddl_file_prefix + '_domain.pddl'
    problem_path = cur_dir + '/' + PDDL_DIR + '/' + pddl_file_prefix + '_problem.pddl'
    result_path = cur_dir + '/' + result_dir_name + '/' + pddl_file_prefix + '_sas'

    dump_domain(nt_domain, domain_path, pddl_comment)
    dump_problem(nt_problem, problem_path, pddl_comment)

    with HideOutput():
        run_symk(domain_path, problem_path, result_path, num_plan=target_result_num)

    result_files = [cur_dir + '/' + result_dir_name + '/' + file
                    for file in os.listdir(result_dir_name)]
    list_id = [int(file.split('.')[1]) for file in result_files]
    list_files = []
    for i in range(len(list_id)):
        list_files.append(result_files[list_id.index(i + 1)])

    return list_files


def get_inst_action_mapping(file_path='instantiated_actions.pk'):
    with open(file_path, 'rb') as f:
        instantiated_actions = pickle.load(f)
    propo_to_action = {}
    for action in instantiated_actions:
        name = action.name[1:-1].split(' ')[0]
        propo_to_action[name] = action
    return propo_to_action


def extract_stream_action_plan(fp_path, propo_to_stream):
    with open('instantiated_actions.pk', 'rb') as f:
        instantiated_actions = pickle.load(f)
    propo_to_action = {}
    for action in instantiated_actions:
        name = action.name[1:-1].split(' ')[0]
        propo_to_action[name] = action

    op_plan_text = read(fp_path)
    op_lines = op_plan_text.splitlines()
    op_lines = [l for l in op_lines if not l.startswith(';')]

    op_blocks = [l[1:-1].split(' ') for l in op_lines]

    stream_plan = []
    action_plan = []

    for i, block in enumerate(op_blocks):
        name = block[0]
        original_name = get_original_name(name)

        args = block[1:-1]
        if name.startswith('s'):
            stream_plan.append(propo_to_stream[name])
        elif name.startswith('a'):
            inst_action = propo_to_action[name]

            full_args = [pddl2obj(arg) for arg in args]

            pa_info = pA_info(None, [create_pAtom(e[1]) for e in inst_action.add_effects],
                              inst_action)

            action_plan.append(pAction(original_name, full_args, pa_info))
    return stream_plan, action_plan


def build_op_plan(streams_for_step, list_action, propo_to_stream, propo_to_action):
    action_plan = []

    results_for_step = []

    op_plan = []

    for i, propo_a in enumerate(list_action):

        original_name = get_original_name(propo_a)
        inst_action = propo_to_action[propo_a]

        args = inst_action.name[1:-1].split(' ')[1:]

        full_args = [pddl2obj(arg) for arg in args]

        pa_info = pA_info(None, [create_pAtom(e[1]) for e in inst_action.add_effects
                                 if e[1].predicate != PREDICATE_ORDER],
                          inst_action)
        paction = pAction(original_name, full_args, pa_info)
        action_plan.append(paction)

        step_results = []
        for propo_s in streams_for_step[i]:
            step_results.append(propo_to_stream[propo_s])

        op_plan = op_plan + step_results + [paction]

        results_for_step.append(step_results)

    return op_plan, results_for_step


def get_result_action_list(fp_path):
    op_plan_text = read(fp_path)
    op_lines = op_plan_text.splitlines()
    op_lines = [l for l in op_lines if not l.startswith(';')]

    op_blocks = [l[1:-1].split(' ') for l in op_lines]

    list_stream_name = []
    list_action_name = []

    for line, block in zip(op_lines, op_blocks):
        name = block[0]
        if name.startswith('s'):
            list_stream_name.append(name)
        elif name.startswith('a'):
            list_action_name.append(name)
    return list_stream_name, list_action_name


def find_streams(targets, availabe_streams, existings):
    """
    Return a list of streams which fulfill the targets.
    The stream list is ordered.
    :param targets: Target optimistic objects to be achieved.
    :param availabe_streams: The streams (results) can be used.
    """
    # existings = list(set(existings))
    tp = []
    for i in existings:
        if i in tp:
            existings.remove(i)
        tp.append(i)

    targets = list(set(targets))
    targets = [t for t in targets if t not in existings]

    if not targets:
        # if len(results)>1:
        #     results = order_streams(results.copy())
        return []

    cur_target = targets[0]
    u_streams = [s for s in availabe_streams if cur_target in s.output_objects]
    if not u_streams:
        return False
    u_stream = u_streams[0]
    # availabe_streams.remove(u_stream)
    new_targets = targets[1:]
    for i in u_stream.input_objects:
        if isinstance(i, OptimisticObject):
            new_targets.append(i)
    for o in u_stream.output_objects:
        if isinstance(o, OptimisticObject):
            existings.append(o)

    return find_streams(new_targets, availabe_streams, existings) + [u_stream]


def log_fullPlan(op_plan, text_plan_path, exe_plan_path):
    optms_plan = []
    with open(text_plan_path, 'w+') as f:

        for op in op_plan:
            if isinstance(op, StreamResult):
                name = op.external.name
                inputs = op.instance.input_objects
                outputs = op.output_objects
                f.write('({} {} -> {})\n'.format(name,
                                                 ' '.join(str(o) for o in inputs),
                                                 ' '.join(str(o) for o in outputs)))
                optms_plan.append(EXE_Stream(name, tuple(o.get_EXE() for o in inputs),
                                             tuple(o.get_EXE() for o in outputs)))
                # exe_plan.append(EXE_Stream(name, inputs, outputs))
            if isinstance(op, pAction):
                name = op.name
                parameters = op.args
                f.write('({} {})\n'.format(name,
                                           ' '.join(str(o) for o in parameters)))

                add_effects = tuple(get_pAtom_exe(a) for a in op.pa_info[1])

                optms_plan.append(EXE_Action(name, tuple(o.get_EXE() for o in parameters), add_effects))
                # exe_plan.append(EXE_Action(name, parameters))

        now = datetime.now()
        f.write(';{}\n'.format(now.strftime("%H:%M:%S  %d/%m")))

    with open(exe_plan_path, 'wb') as f:
        pickle.dump(optms_plan, f)
        print('EXE_plan is saved to {}'.format(exe_plan_path))

    return optms_plan


def inconsistant_stream(op, grasp_to_ss):
    if not isinstance(op, EXE_Stream):
        return False
    if not op.name == "plan-holding-motion":
        return False
    grasp = op.inputs[3]
    q2 = op.inputs[1]
    if q2 in grasp_to_ss[grasp]:
        return False
    return True


def inconsistant_action(op, grasp_to_ss):
    if not isinstance(op, EXE_Action):
        return False
    if not op.name == "move_holding":
        return False
    grasp = op.parameters[3]
    q2 = op.parameters[1]
    if q2 in grasp_to_ss[grasp]:
        return False
    return True


def postprocess_opPlan(raw_plan):
    """Postprocess"""
    """1. from raw to exe_plan"""
    op_plan = []
    for op in raw_plan:
        if isinstance(op, StreamResult):
            name = op.external.name
            inputs = op.instance.input_objects
            outputs = op.output_objects
            op_plan.append(EXE_Stream(name, tuple(o.get_EXE() for o in inputs),
                                      tuple(o.get_EXE() for o in outputs)))
        if isinstance(op, pAction):
            name = op.name
            parameters = op.args
            add_effects = tuple(get_pAtom_exe(a) for a in op.pa_info[1])
            op_plan.append(EXE_Action(name, tuple(o.get_EXE() for o in parameters), add_effects))
    old = op_plan
    """2. diffpick"""
    op_plan = []
    obj_mapping = {}
    body_to_graspDir = {}
    body_to_grasp = {}
    body_to_conf = {}
    body_to_ikin = {}
    body_to_place = {}
    grasp_to_ss = defaultdict(list)
    conf_to_pose = {}
    wp_to_ct = {}
    move_free_Action = None
    move_holding_Action = None

    pickAction = None
    for op in old:
        if op.name == "sample-grasp-dir":
            body_to_graspDir[op.inputs[0]] = op.outputs[0]
        if op.name == "sample-grasp":
            body_to_grasp[op.inputs[0]] = op.outputs[0]
        if op.name == "inverse-kinematics":
            grasp_to_ss[op.inputs[2]].append(op.outputs[0])
            grasp_to_ss[op.inputs[2]].append(op.outputs[1])
            body_to_conf[op.inputs[0]] = op.outputs[0]
            body_to_ikin[op.inputs[0]] = op.outputs[1]
            conf_to_pose[op.outputs[0]] = op.inputs[1]
            wp_to_ct[op.inputs[0:2]] = op.outputs
        if op.name == "sample-place":
            body_to_place[op.inputs[0]] = op.outputs[0]
        if op.name == 'move_free':
            move_free_Action = op
        if op.name == 'move_holding':
            move_holding_Action = op
        if op.name == 'pick':
            pickAction = op

        if op.name == "diffpick":
            wuti = op.parameters[0]
            pose = op.parameters[1]
            q1 = op.parameters[3]
            grasp_0 = op.parameters[2]

            grasp_dir = get_new_optmsEXE_obj()
            grasp = body_to_grasp[wuti] = obj_mapping[grasp_0] = get_new_optmsEXE_obj()
            q2 = body_to_conf[wuti] = obj_mapping[q1] = get_new_optmsEXE_obj()
            grasp_to_ss[grasp].append(q2)
            traj_s = get_new_optmsEXE_obj()
            traj_move = get_new_optmsEXE_obj()
            op_plan.append(EXE_Stream('sample-grasp-dir', (wuti,), (grasp_dir,)))
            op_plan.append(EXE_Stream('sample-grasp', (wuti, grasp_dir), (grasp,)))
            op_plan.append(EXE_Stream('inverse-kinematics', (wuti, pose, grasp), (q2, traj_s)))
            op_plan.append(EXE_Stream('plan-free-motion', (q1, q2), (traj_move,)))
            wp_to_ct[(wuti, pose)] = (q2, traj_s)
            para_mapping = {}
            assert move_free_Action is not None
            para_mapping[move_free_Action.parameters[0]] = q1
            para_mapping[move_free_Action.parameters[1]] = q2
            para_mapping[move_free_Action.parameters[2]] = traj_move
            op_plan.append(remap_action_args(move_free_Action, para_mapping, True))
            para_mapping = {}
            para_mapping[pickAction.parameters[0]] = wuti
            para_mapping[pickAction.parameters[1]] = pose
            para_mapping[pickAction.parameters[2]] = grasp
            para_mapping[pickAction.parameters[3]] = q2
            para_mapping[pickAction.parameters[4]] = traj_s
            op_plan.append(remap_action_args(pickAction, para_mapping, True))
        else:
            new_op = None
            if isinstance(op, EXE_Stream):
                new_op = remap_stream_args(op, obj_mapping, True)
            elif isinstance(op, EXE_Action):
                new_op = remap_action_args(op, obj_mapping, True)
            if inconsistant_action(new_op, grasp_to_ss):
                assert inconsistant_stream(op_plan[-1], grasp_to_ss)
                wuti = op_plan[-1].inputs[2]
                q1 = new_op.parameters[0]
                q2_0 = new_op.parameters[1]
                grasp = new_op.parameters[3]
                if q2_0 in conf_to_pose:
                    pose = conf_to_pose[q2_0]
                    _, traj_s0 = wp_to_ct[(wuti, pose)]
                    q2 = obj_mapping[q2_0] = get_new_optmsEXE_obj()
                    traj_s = obj_mapping[traj_s0] = get_new_optmsEXE_obj()
                    wp_to_ct[(wuti, pose)] = (q2, traj_s)
                    traj_move = get_new_optmsEXE_obj()
                    op_plan[-1] = EXE_Stream('inverse-kinematics', (wuti, pose, grasp), (q2, traj_s))
                    op_plan.append(EXE_Stream('plan-holding-motion', (q1, q2, wuti, grasp), (traj_move,)))
                    para_mapping = {}
                    para_mapping[move_holding_Action.parameters[0]] = q1
                    para_mapping[move_holding_Action.parameters[1]] = q2
                    para_mapping[move_holding_Action.parameters[2]] = wuti
                    para_mapping[move_holding_Action.parameters[3]] = grasp
                    para_mapping[move_holding_Action.parameters[4]] = traj_move
                    op_plan.append(remap_action_args(move_holding_Action, para_mapping, True))
                else:
                    traj_move = get_new_optmsEXE_obj()
                    op_plan.append(EXE_Stream('plan-holding-motion', (q1, q2_0, wuti, grasp), (traj_move,)))
                    para_mapping = {}
                    para_mapping[move_holding_Action.parameters[0]] = q1
                    para_mapping[move_holding_Action.parameters[1]] = q2_0
                    para_mapping[move_holding_Action.parameters[2]] = wuti
                    para_mapping[move_holding_Action.parameters[3]] = grasp
                    para_mapping[move_holding_Action.parameters[4]] = traj_move
                    op_plan.append(remap_action_args(move_holding_Action, para_mapping, True))
            else:
                op_plan.append(new_op)

    return op_plan


def log_save_opPlan(op_plan, text_plan_path, exe_plan_path):
    with open(text_plan_path, 'w+') as f:
        for op in op_plan:
            if isinstance(op, EXE_Stream):
                name = op.name
                inputs = op.inputs
                outputs = op.outputs
                f.write('({} {} -> {})\n'.format(name,
                                                 ' '.join(o.pddl for o in inputs),
                                                 ' '.join(o.pddl for o in outputs)))

            if isinstance(op, EXE_Action):
                name = op.name
                parameters = op.parameters
                f.write('({} {})\n'.format(name,
                                           ' '.join(o.pddl for o in parameters)))

        now = datetime.now()
        f.write(';{}\n'.format(now.strftime("%H:%M:%S  %d/%m")))

    with open(exe_plan_path, 'wb') as f:
        pickle.dump(op_plan, f)
        print('EXE_plan is saved to {}'.format(exe_plan_path))

    return op_plan


def read_streams_with_action(plan_path):
    op_plan_text = read(plan_path)
    op_lines = op_plan_text.splitlines()
    op_lines = [l for l in op_lines if not l.startswith(';')]

    op_blocks = [l[1:-1].split(' ') for l in op_lines]

    list_action_name = []

    streams = []
    streams_for_step = []
    for line, block in zip(op_lines, op_blocks):
        name = block[0]
        if name.startswith('s'):
            streams.append(name)
        elif name.startswith('a'):
            list_action_name.append(name)
            streams_for_step.append(streams)
            streams = []
    return streams_for_step, list_action_name


def sk_from_file(path):
    f = open(path)
    actions = f.read().split('\n')[:-2]
    sk = []

    for a in actions:
        action = a[1:-1].split(' ')
        name = action[0]
        args = action[1:]
        sk_args = []
        for arg in args:
            if arg[0] == '#':
                sk_args.append('#')
            else:
                sk_args.append(arg)
        sk_action = tuple([name] + sk_args)
        sk.append(sk_action)
    sk = tuple(sk)

    return sk


def filter_skeleton(raw_files, target_num):
    new_files = []
    existing_sk = set()
    for f in raw_files:
        sk = sk_from_file(f)
        if sk in existing_sk or len(new_files) >= target_num:
            os.remove(f)
        else:
            existing_sk.add(sk)
            new_files.append(f)
    return new_files


class SkeletonBatch(object):

    def __init__(self, original_domain_file, stream_file, original_init, goal,
                 optms_results, optms_init, target_num=100):
        self.now = datetime.now()
        self.pddl_comment = self.now.strftime("%H:%M:%S %d/%m")
        self.batch_id = self.now.strftime("%H%M%S%d%m")

        self.stream_file = stream_file

        self.original_domain = build_nt_domain(original_domain_file)

        self.original_problem = build_nt_problem(self.original_domain, original_init, goal)
        self.optms_problem = build_nt_problem(self.original_domain, optms_init, goal)

        self.optms_results = optms_results
        self.optms_init = optms_init
        self.original_init = original_init
        self.goal = goal

        """Action plan: plans made up of only actions, the skeletons of the plans"""
        self.ap_files = []
        num_raw_target = round(target_num * 10.0)

        num_last = 0
        for i in range(10):
            """Raw solutions"""
            raw_solutions = run_pddl_planner(self.original_domain, self.optms_problem, num_raw_target, 'A_actionPlans',
                                             'A_ap', '')
            num_solution = len(raw_solutions)
            if num_solution < target_num or num_solution == num_last:
                print(f'Failed: in creating ap_files. {num_solution} raw_solutions are found.')
                break
            num_last = num_solution
            """Action plans"""
            self.ap_files = filter_skeleton(raw_solutions, target_num)
            if len(self.ap_files) >= target_num:
                print('Successful: in creating ap_files.')
                break
            else:
                num_raw_target = round(num_raw_target * 10)

        self.op_history = {}

    @property
    def num_ap(self):
        """
        Number of action plan
        """
        return len(self.ap_files)

    @property
    def pointer(self):
        return len(self.op_history)

    def generate_operatorPlan(self, pointer):
        if pointer >= self.num_ap:
            return None

        if pointer in self.op_history:
            return self.op_history[pointer]

        ap_file = self.ap_files[pointer]
        fp_domain, fp_problem, inst_to_stream = propo_domain_problem(self.original_domain,
                                                                     self.original_problem,
                                                                     self.optms_results, ap_file,
                                                                     self.stream_file)

        fp_files = run_pddl_planner(fp_domain, fp_problem, 1, 'B_fullPlans',
                                    'B_fp', 'Skeleton_SN = ' + str(pointer))
        if not fp_files:
            print('Failed: in creating fp_files. ap_file = ' + ap_file)
            return None
        fp_path = fp_files[0]

        # stream_plan, action_plan = extract_stream_action_plan(fp_path, propo_to_stream)

        """Find streams for each step of the action plan"""

        full_list_stream, full_list_action = get_result_action_list(fp_path)

        op_domain, op_problem = reorder_domain_problem(copy(fp_domain), copy(fp_problem), full_list_stream,
                                                       full_list_action)
        op_files = run_pddl_planner(op_domain, op_problem, 1, 'C_operatorPlans',
                                    'C_op', 'Skeleton_SN = ' + str(pointer))
        if not fp_files:
            print('Failed: in creating op_files.')
            return None
        op_path = op_files[0]

        streams_for_step, full_list_action = read_streams_with_action(op_path)

        """Text plan -> Object plan"""
        propo_to_action = get_inst_action_mapping()
        op_plan0, results_for_step = build_op_plan(streams_for_step, full_list_action, inst_to_stream, propo_to_action)

        plan_description_path = op_path + '.txt'
        exe_plan_path = op_path + '.pk'

        # optms_plan = log_fullPlan(op_plan, plan_description_path, exe_plan_path)

        op_plan = postprocess_opPlan(op_plan0)

        log_save_opPlan(op_plan, plan_description_path, exe_plan_path)

        self.op_history[pointer] = (op_path, plan_description_path, exe_plan_path)

        return op_plan

    def get_next_operatorPlan(self):
        return self.generate_operatorPlan(self.pointer)
