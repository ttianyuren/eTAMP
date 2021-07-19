# -*- coding: utf-8 -*-
from __future__ import print_function

import logging
import os
import sys
import shutil
from symk.driver import aliases
from symk.driver import arguments
from symk.driver import cleanup
from symk.driver import run_components


def remove_plan_folder():
    plan_dir = "found_plans"
    if os.path.exists(plan_dir):
        shutil.rmtree(plan_dir)
    os.makedirs(plan_dir)


def run_symk(domain_file='toy_domain.pddl', problem_file='toy_problem.pddl', plan_file='found_plans/sas_plan',
             num_plan=11):
    remove_plan_folder()
    args = arguments.parse_args([domain_file, problem_file,
                                 '--search',
                                 'symk-bd(plan_selection=top_k(num_plans={}))'.format(num_plan)])
    args.plan_file = plan_file
    args.log_level = 'WARNING'

    logging.basicConfig(level=getattr(logging, args.log_level.upper()),
                        format="%(levelname)-8s %(message)s",
                        stream=sys.stdout)
    logging.debug("processed args: %s" % args)

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
        print()
        print("{component} exit code: {exitcode}".format(**locals()))
        if not continue_execution:
            print("Driver aborting after {}".format(component))
            break
    # Exit with the exit code of the last component that ran successfully.
    # This means for example that if no plan was found, validate is not run,
    # and therefore the return code is that of the search.

    # sys.exit(exitcode)


if __name__ == "__main__":
    run_symk()
