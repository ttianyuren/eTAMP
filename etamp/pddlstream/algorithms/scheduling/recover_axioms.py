from collections import defaultdict

from pddlstream.algorithms.downward import get_literals, apply_propo_action, \
    get_name2axioms, literal_holds, GOAL_NAME, get_precondition
from pddlstream.algorithms.instantiate_task import get_goal_instance, filter_negated, \
    get_achievable_literal_with_operator
from pddlstream.language.constants import is_parameter
from pddlstream.utils import Verbose, MockSet, safe_zip, flatten
from pddl.actions import ConditionalEffect

import pddl
import axiom_rules


def get_necessary_axioms(target_literals, init_axioms, negname_to_pred):
    """
    Generate a set of Actions out of initial axioms to fulfill the target literals.
    target_literals: is the intersection of requiring preimage and the initial axioms.
    """
    if not target_literals or not init_axioms:
        return {}
    dict_pred_axioms = get_name2axioms(init_axioms)
    target_atom_queue = []
    processed_atoms = set()

    def add_literals(literals):
        for lit in literals:
            atom = lit.positive()
            if atom not in processed_atoms:
                target_atom_queue.append(atom)
                processed_atoms.add(atom)

    # Initialize the queue.
    add_literals(target_literals)

    dict_action_axiom = {}
    partial_instantiations = set()
    while target_atom_queue:
        atom = target_atom_queue.pop()
        for init_axiom in dict_pred_axioms[atom.predicate]:
            """For each axiom that leads to the target atom"""
            axiom_params = init_axiom.parameters[:init_axiom.num_external_params]
            # Partial mapping from axiom parameter to atom argument
            var_mapping = {para.name: arg
                           for para, arg in zip(axiom_params, atom.args)
                           if not is_parameter(arg)}

            key = (init_axiom, frozenset(var_mapping.items()))
            if key in partial_instantiations:
                continue
            partial_instantiations.add(key)

            # Non-negative condition literals of the axiom,
            cond_literals = [literal.rename_variables(var_mapping)
                             for literal in get_literals(init_axiom.condition)
                             if literal.predicate not in negname_to_pred]
            effect_args = [var_mapping.get(para.name, para.name)
                           for para in axiom_params]
            new_effect = pddl.Effect(parameters=[], condition=pddl.Truth(),
                                     literal=pddl.conditions.Atom(init_axiom.name, effect_args))
            free_parameters = [para for para in init_axiom.parameters
                               if para.name not in var_mapping]
            new_action = pddl.Action(init_axiom.name, free_parameters, len(free_parameters),
                                     pddl.Conjunction(cond_literals), [new_effect], None)
            # Creating actions so I can partially instantiate (impossible with axioms)
            dict_action_axiom[new_action] = (init_axiom, var_mapping)
            add_literals(cond_literals)
    return dict_action_axiom


##################################################

def instantiate_necessary_axioms(model, static_facts, fluent_facts, axiom_remap={}):
    instantiated_axioms = []
    for atom in model:
        if isinstance(atom.predicate, pddl.Action):
            action = atom.predicate
            var_mapping = {p.name: a for p, a in zip(action.parameters, atom.args)}
            axiom, existing_var_mapping = axiom_remap[action]
            var_mapping.update(existing_var_mapping)
            inst_axiom = axiom.get_instantiation(var_mapping, static_facts, fluent_facts)
            if inst_axiom:
                instantiated_axioms.append(inst_axiom)
    return instantiated_axioms


##################################################


def extract_axioms(init_facts, achvLiteral_to_axiom, precondition, axiom_plan,
                   negated_from_name={}):
    """
    Recursively generate a sequence of axiom (no duplicates) to fulfill the precondition,
    where the condition of the later axioms should be satisfied by the former ones.
    """
    is_successful = True
    for literal in filter_negated(precondition, negated_from_name):
        if literal_holds(init_facts, literal):
            continue
        if literal not in achvLiteral_to_axiom:
            is_successful = False
            continue
        """When current literal can be reached though an axiom."""
        axiom = achvLiteral_to_axiom[literal]
        if (axiom is None) or (axiom in axiom_plan):
            continue
        extract_axioms(init_facts, achvLiteral_to_axiom, axiom.condition, axiom_plan,
                       negated_from_name=negated_from_name)
        axiom_plan.append(axiom)
    return is_successful


##################################################

def is_useful_atom(atom, conditions_from_predicate):
    # TODO: this is currently a bottleneck. Instantiate for all actions along the plan first? (apply before checking)
    if not isinstance(atom, pddl.Atom):
        return False
    for atom2 in conditions_from_predicate[atom.predicate]:
        if all(is_parameter(a2) or (a1 == a2) for a1, a2 in safe_zip(atom.args, atom2.args)):
            return True
    return False


def extraction_helper(state, instantiated_axioms, goals, negative_from_name={}):
    # TODO: filter instantiated_axioms that aren't applicable?
    with Verbose(False):
        helpful_axioms, axiom_init, _ = axiom_rules.handle_axioms(
            [], instantiated_axioms, goals)
    axiom_init = set(axiom_init)
    axiom_effects = {axiom.effect for axiom in helpful_axioms}
    # assert len(axiom_effects) == len(axiom_init)
    for pre in list(goals) + list(axiom_effects):
        if pre.positive() not in axiom_init:
            axiom_init.add(pre.positive().get_negate())
    goal_action = pddl.PropositionalAction(GOAL_NAME, goals, [], None)
    axiom_from_atom, _ = get_achievable_literal_with_operator(state | axiom_init, helpful_axioms + [goal_action],
                                                              negative_from_name)
    axiom_plan = []  # Could always add all conditions
    success = extract_axioms(state | axiom_init, axiom_from_atom, goals, axiom_plan, negative_from_name)
    if not success:
        print('Warning! Could not extract an axiom plan')
        # return None
    return axiom_plan


def extract_axiom_plan(optms_task, preimage_literals, negname_to_pred, static_state=set()):
    """
    Get a axiom plan for each stepaa, to fulfill its preimage.
    """
    import pddl_to_prolog
    import build_model
    import instantiate

    if not negname_to_pred:
        return []

    dict_predicate_axiom = get_name2axioms(optms_task.axioms)
    # Preimage literals which may be derived by the task.axioms
    preimage_axiom_literals = {literal for literal in preimage_literals
                               if literal.predicate in dict_predicate_axiom}

    """The preimage literals should be either given by the initial facts, 
       or could potentially be derived by task.axioms."""
    assert all(literal_holds(optms_task.init, literal)
               for literal in set(preimage_literals) - preimage_axiom_literals)

    # Actions out of axioms which may contribute to the target literals.
    dict_action_axiom = get_necessary_axioms(preimage_axiom_literals, optms_task.axioms, negname_to_pred)
    if not dict_action_axiom:
        """Usually return here."""
        return []

    conditions_from_predicate = defaultdict(set)
    for axiom, var_mapping in dict_action_axiom.values():
        for literal in get_literals(axiom.condition):
            conditions_from_predicate[literal.predicate].add(literal.rename_variables(var_mapping))

    original_init = optms_task.init
    original_actions = optms_task.actions
    original_axioms = optms_task.axioms
    # TODO: retrieve initial state based on if helpful
    optms_task.init = {atom for atom in optms_task.init if is_useful_atom(atom, conditions_from_predicate)}
    # TODO: store map from predicate to atom
    optms_task.actions = dict_action_axiom.keys()
    optms_task.axioms = []
    # TODO: maybe it would just be better to drop the negative throughout this process until this end
    with Verbose(False):
        model = build_model.compute_model(pddl_to_prolog.translate(optms_task))  # Changes based on init
    opt_facts = instantiate.get_fluent_atoms(optms_task, model) | (optms_task.init - static_state)
    mock_fluent = MockSet(lambda item: (item.predicate in negname_to_pred) or (item in opt_facts))
    instantiated_axioms = instantiate_necessary_axioms(model, static_state, mock_fluent, dict_action_axiom)
    axiom_plan = extraction_helper(optms_task.init, instantiated_axioms, preimage_axiom_literals,
                                   negname_to_pred)
    optms_task.init = original_init
    optms_task.actions = original_actions
    optms_task.axioms = original_axioms
    return axiom_plan


##################################################

def backtrack_axioms(target_atoms, dict_atom_axiom, visited_atoms):
    """
    Find all axioms demanded by the target atoms, based on dict_atom_axiom.
    """
    related_axioms = []
    for atom in target_atoms:

        """Skip the atom already processed."""
        if atom in visited_atoms:
            continue
        visited_atoms.add(atom)

        for axiom in dict_atom_axiom[atom]:
            # Add an axiom related directly to target atom
            related_axioms.append(axiom)
            # Add axioms related to the condition of the added axiom recursively
            related_axioms.extend(backtrack_axioms(axiom.condition, dict_atom_axiom, visited_atoms))

    return related_axioms


def recover_axioms_plans(inst_task, fluent_action_plan):
    """
    Generate a list of axiom_plans,
    each axiom_plan should be able to fulfill all precondition of an action (step) in the action_plan,
    based only on the <initial facts of that step>.
    The <initial facts of that step> is determined by both <task initial facts> and <actions in previous steps>.

    An axiom plan: is a sequence of axioms where the condition of the later axioms
                   should be fulfilled by the former ones.

    An axiom(公理): is a mapping from condition facts set(A) to effect fact B.
    """

    axioms = inst_task.fluent_axioms
    # Get the 1-n mapping for all fluent axioms
    dict_atom_axioms = defaultdict(list)
    for axiom in axioms:
        dict_atom_axioms[axiom.effect].append(axiom)

    init_facts = set(inst_task.task.init)  # Optimistic
    # Consider goal also as a propo action.
    goal_instance = get_goal_instance(inst_task.task.goal)

    list_axiom_plan = []
    for action in fluent_action_plan + [goal_instance]:
        # Precondition atoms for action.
        action_precond = list(get_precondition(action))
        # Condition atoms for the action's conditional effects. Usually is null.
        conditional_effs = action.add_effects + action.del_effects
        eff_conditions = list(flatten(cond for cond, _
                                      in conditional_effs))
        # All conditions demanded by current action (step).
        all_conditions = action_precond + eff_conditions

        # Get all related axioms of these conditions
        related_axioms = backtrack_axioms(all_conditions, dict_atom_axioms, set())
        # Get all achievable literals with their causal axioms, out of related axioms
        achvLiteral_to_axiom, _ = get_achievable_literal_with_operator(init_facts, related_axioms)

        action.achv_eff_literals = []

        """For <add_effects> and <del_effects>"""
        for conditional_effs in [action.add_effects, action.del_effects]:
            is_negate = conditional_effs is action.del_effects
            """For each effect in <add_effects> or <del_effects>"""
            for idx, (eff_conds, eff_literal) in reversed(list(enumerate(conditional_effs))):
                if all(literal_holds(init_facts, literal) or (literal in achvLiteral_to_axiom)
                       for literal in eff_conds):
                    """
                    If all conditions of a conditional effect are satisfied,
                    then move them to the precondition of its container action.
                    And add this effect into achv_eff_literals.
                    """
                    action.precondition.extend(eff_conds)
                    conditional_effs[idx] = ConditionalEffect(conditions=[], effect=eff_literal)
                    action.achv_eff_literals.append(eff_literal.negate() if is_negate
                                                    else eff_literal)
                else:
                    """
                    Else, removes the conditional effect from add_effects/del_effects list.
                    (Currently not used)
                    """
                    conditional_effs.pop(idx)

        """Find an axiom_plan to fulfill the new <action.precondition> 
           and append it to the list."""
        list_axiom_plan.append([])
        is_successful = extract_axioms(init_facts, achvLiteral_to_axiom,
                                       action.precondition, list_axiom_plan[-1])
        assert is_successful

        # Expend the init_facts for the next step.
        apply_propo_action(init_facts, action)

    """An empty axiom_plan (or []) in the list means that 
       no axioms are needed to achieve the action of that step."""
    return list_axiom_plan
