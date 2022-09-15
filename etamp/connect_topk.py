# -*- coding: utf-8 -*-
from __future__ import print_function

import logging
import os
import sys
import shutil
from symk.driver import aliases, arguments, cleanup, run_components


def remove_plan_folder(plan_dir):
    if os.path.exists(plan_dir):
        shutil.rmtree(plan_dir)
    os.makedirs(plan_dir)


def run_symk(domain_file='testIO_symk/domain.pddl', problem_file='testIO_symk/prob01.pddl',
             plan_file='testIO_symk/found_plans/sas_plan', num_plan=11):
    plan_dir = os.path.dirname(plan_file)
    remove_plan_folder(plan_dir)
    """Generate args"""
    sys.argv = ['', domain_file, problem_file,
                '--search', 'symk-bd(plan_selection=top_k(num_plans={:d}))'.format(num_plan)]
    args = arguments.parse_args()
    args.plan_file = plan_file

    logging.basicConfig(level=getattr(logging, args.log_level.upper()),
                        format="%(levelname)-8s %(message)s",
                        stream=sys.stdout)
    logging.debug("processed args: %s" % args)
    # run_symk('/home/tianyu/MyAPP/eTAMP/PR2/TASK_cook/pddl/C_op_domain.pddl',
    #          '/home/tianyu/MyAPP/eTAMP/PR2/TASK_cook/pddl/C_op_problem.pddl')
    if args.show_aliases:
        aliases.show_aliases()
        sys.exit()

    if args.cleanup:
        cleanup.cleanup_temporary_files(args)
        sys.exit()

    exitcode = None
    for component in args.components:
        if component == "translate":
            (exitcode, continue_execution) = run_components.run_translate(args)
        elif component == "preprocess":
            (exitcode, continue_execution) = run_components.run_preprocess(args)
        elif component == "search":
            (exitcode, continue_execution) = run_components.run_search(args)
            if not args.keep_sas_file:
                print("Remove intermediate file {}".format(args.sas_file))
                os.remove(args.sas_file)
        elif component == "validate":
            (exitcode, continue_execution) = run_components.run_validate(args)
        else:
            assert False, "Error: unhandled component: {}".format(component)
        print("{component} exit code: {exitcode}".format(**locals()))
        print()
        if not continue_execution:
            print("Driver aborting after {}".format(component))
            break
    # Exit with the exit code of the last component that ran successfully.
    # This means for example that if no plan was found, validate is not run,
    # and therefore the return code is that of the search.
    # sys.exit(exitcode)
    result_files = [plan_dir + '/' + file for file in os.listdir(plan_dir)]

    list_id = [int(file.split('.')[1]) for file in result_files]
    result_files_sorted = []  # sorted result files by name
    for i in range(len(list_id)):
        result_files_sorted.append(result_files[list_id.index(i + 1)])

    return result_files_sorted


if __name__ == "__main__":
    run_symk('/home/tianyu/MyAPP/eTAMP/PR2/TASK_cook/pddl/A_ap_domain0.pddl',
             '/home/tianyu/MyAPP/eTAMP/PR2/TASK_cook/pddl/A_ap_problem0.pddl',
             '/home/tianyu/MyAPP/eTAMP/PR2/TASK_cook/A_actionPlans/A_ap_sas',
             num_plan=75)
    # run_symk('/home/tianyu/MyAPP/eTAMP/PR2/TASK_cook/pddl/A_ap_domain.pddl',
    #          '/home/tianyu/MyAPP/eTAMP/PR2/TASK_cook/pddl/A_ap_problem.pddl')
    # run_symk('/home/tianyu/MyAPP/eTAMP/PR2/TASK_cook/pddl/B_fp_domain.pddl',
    #          '/home/tianyu/MyAPP/eTAMP/PR2/TASK_cook/pddl/B_fp_problem.pddl')
    # run_symk('/home/tianyu/MyAPP/eTAMP/PR2/TASK_cook/pddl/C_op_domain.pddl',
    #          '/home/tianyu/MyAPP/eTAMP/PR2/TASK_cook/pddl/C_op_problem.pddl')
