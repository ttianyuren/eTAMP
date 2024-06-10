## To start

1. `git clone --recurse-submodules https://github.com/ttianyuren/eTAMP.git`: to clone this repo with submodules
3. `cd eTAMP`
2. `sudo apt-get -y install cmake g++ make python3 autoconf automake`: to install dependencies for symk
3. `pip3 install -r requirements.txt`
4. `./symk/build.py `: to build the [symk](symk) planner
5. `export PYTHONPATH="[full path of the repo]`


## Run examples


### Kitchen

```console
python3 PR2/TASK_cook/run_eTAMP.py
```

![](docs/figures/cooking_5.gif)


### Unpacking

```console
python3 Darias/TASK_unpack/run_eTAMP.py
```

![](docs/figures/unpack_c2.gif)
![](docs/figures/unpack_c3.gif)

### Regrasping

```console
python3 Darias/TASK_regrasp/run_eTAMP.py
```

![](docs/figures/regrasp3.gif)


## References

### Main source

1. [eTAMP](https://arxiv.org/pdf/2103.05456.pdf): a integrated task and motion planner for robot applications
2. [CP-BO](https://arxiv.org/pdf/2201.09612.pdf): to accelerate eTAMP via geometric constraint learning

### Based on

1. [symk (based on fastdownward)](https://github.com/speckdavid/symk): a top-k symbolic planner (interchangeable)
2. [pddlstream](https://github.com/caelan/pddlstream): useful operator definitions and test environments

