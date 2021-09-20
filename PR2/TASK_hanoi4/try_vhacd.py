import pybullet as p
import pybullet_data as pd
import os

p.connect(p.DIRECT)
name_in = "../scenario_description/hanoi/cylinder6.obj"
name_out = "cylinder6.obj"
name_log = "log.txt"
p.vhacd(name_in, name_out, name_log)
