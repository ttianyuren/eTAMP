#!/usr/bin/env python
from run_branch import *

#######################################################


if __name__ == '__main__':

    with open('exe_plan.pk', 'rb') as f:
        _, exe_plan = pk.load(f)

    connect(use_gui=True)

    scn = PlanningScenario()
    commands = postprocess_plan(scn, exe_plan)

    saved_world = WorldSaver()
    for i in range(100):
        saved_world.restore()
        time.sleep(3)
        play_commands(commands)
        time.sleep(1)

    disconnect()
