from collections import defaultdict


def test_essenceJam(actionEssence, essenceJam):
    """To test if this branch complies with the essenceJam"""

    if len(essenceJam) > len(actionEssence):
        return False

    for i, essence in enumerate(essenceJam):
        if essence != actionEssence[i]:
            return False

    return True