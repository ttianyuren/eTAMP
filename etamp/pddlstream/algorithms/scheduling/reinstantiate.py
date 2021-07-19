from pddlstream.algorithms.downward import get_fluents, apply_propo_action, has_conditional_effects, \
    get_conjunctive_parts, make_preconditions
from pddlstream.algorithms.instantiate_task import get_goal_instance
from pddlstream.utils import MockSet
from pddlstream.language.optimizer import UNSATISFIABLE

from collections import defaultdict
import pddl
from instantiate import get_type2objects,get_predicate2atoms
from pddl.effects import QuatEffect


def reinstantiate_action(init_facts, fluent_action, negname_to_pred={}):
    """
    Return a new propo_action with full literals (fluent and static)
    in both its <precondition> and <effects>, based on the fluent propo_action.
    All condition of <effects> should be moved to <precondition>.
    """
    action = fluent_action.action
    # Mapping: all params -> all args of the action
    var_mapping = fluent_action.var_mapping

    # Using pseudo-facts so that:
    # <item in pseudo_init_facts> is False for any items;
    # <item in pseudo_fluent_facts> is True for any items
    pseudo_init_facts = set()
    pseudo_fluent_facts = MockSet()

    full_precond_literals = []
    try:
        """Get the full literals (fluent and static) in precondition"""
        action.precondition.instantiate(var_mapping, pseudo_init_facts, pseudo_fluent_facts,
                                        full_precond_literals)
    except pddl.conditions.Impossible:
        return None

    fluentLiteral_to_effect = {eff_literal: (effect, eff_var_mapping)
                               for _, eff_literal, effect, eff_var_mapping
                               in fluent_action.quat_effects}

    for effect in action.effects:
        if effect.literal.predicate == UNSATISFIABLE:
            """
            Usually not used. Relates to has_optimizers
            """
            cond_literals = set(get_conjunctive_parts(effect.condition))
            negative_literals = {literal for literal in cond_literals
                                 if literal.predicate in negname_to_pred}
            if not negative_literals:
                continue

            assert len(negative_literals) == 1

            normal_conjunction = pddl.Conjunction(parts=cond_literals - negative_literals)
            normal_effect = pddl.Effect(effect.parameters, normal_conjunction, effect.literal)

            type_to_objects = get_type2objects([], [])
            predicate_to_atoms = get_predicate2atoms(init_facts)

            # Get the conditional effect without negative literals in its condition
            quat_effs = []
            normal_effect.instantiate(var_mapping, init_facts, {effect.literal},
                                      type_to_objects, predicate_to_atoms, quat_effs)
            _, _, _, eff_var_mapping = quat_effs[0]

            # Add the negative literals in the preconditon of the action
            for neg_literal in negative_literals:
                new_literal = neg_literal.rename_variables(eff_var_mapping).negate()
                assert (not new_literal.free_variables())
                full_precond_literals.append(new_literal)

    quat_effects = []
    """Only achievable effects will be added to the new action."""
    for literal in fluent_action.achv_eff_literals:
        effect, eff_var_mapping = fluentLiteral_to_effect[literal]
        if effect is None:
            continue
        else:
            """Get the <quat effect> with full literals (fluent and static)"""
            effect._instantiate(eff_var_mapping, pseudo_init_facts, pseudo_fluent_facts, quat_effects)

    """Move all condition literals of the <quat effects> to the action precondition."""
    new_quat_effects = []
    for cond_literals, effect_literal, effect, eff_var_mapping in quat_effects:
        full_precond_literals.extend(cond_literals)
        new_quat_effects.append(QuatEffect([], effect_literal, effect, eff_var_mapping))

    return pddl.PropositionalAction(fluent_action.name, full_precond_literals, new_quat_effects,
                                    fluent_action.cost, action, var_mapping)


def reinstantiate_action_instances(pddl_task, fluent_action_plan, negname_to_pred={}):
    """
    Update each action with full literals (fluent and static) in its precondition and effects.
    Return a plan of new actions.
    """
    init_facts = set(pddl_task.init)  # Optimistic
    full_action_plan = []
    for fluent_action in fluent_action_plan:
        full_action = reinstantiate_action(init_facts, fluent_action, negname_to_pred)
        assert (full_action is not None)
        full_action_plan.append(full_action)
        apply_propo_action(init_facts, full_action)
    full_action_plan.append(get_goal_instance(pddl_task.goal))
    return full_action_plan


def reinstantiate_axiom_instances(fluent_axiom_plan):
    """
    Update each axiom with full literals (fluent and static) in its condition and effect.
    Return a plan of new axioms.
    """
    pseudo_init_facts = set()
    pseudo_fluent_facts = MockSet()
    full_axiom_plan = []
    for fluent_axiom in fluent_axiom_plan:
        axiom = fluent_axiom.axiom
        var_mapping = fluent_axiom.var_mapping
        full_axiom = axiom.instantiate(var_mapping, pseudo_init_facts, pseudo_fluent_facts)
        assert (full_axiom is not None)
        full_axiom_plan.append(full_axiom)
    return full_axiom_plan
