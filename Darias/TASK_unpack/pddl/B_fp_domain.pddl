;17:16:15 23/08

;Skeleton_SN = 6

(define (domain pick-and-place_propo)
   (:requirements :strips :equality :action-costs)

   (:types
          wuti grasp_dir grasp config pose trajectory propo_action
   )

   (:constants
          #p0 #p1 #p2 #p3 #p4 #p5 - pose
          #d0 #d1 #d2 #d3 #d4 #d5 #d6 #d7 #d8 - grasp_dir
          #t0 #t1 #t10 #t100 #t1000 #t1001 #t1002 #t1003 #t1004 #t1005 #t1006 #t1007 #t1008 #t1009 #t101 #t1010 #t1011 #t1012 #t1013 #t1014 #t1015 #t1016 #t1017 #t1018 #t1019 #t102 #t1020 #t1021 #t1022 #t1023 #t1024 #t1025 #t1026 #t103 #t104 #t105 #t106 #t107 #t108 #t109 #t11 #t110 #t111 #t112 #t113 #t114 #t115 #t116 #t117 #t118 #t119 #t12 #t120 #t121 #t122 #t123 #t124 #t125 #t126 #t127 #t128 #t129 #t13 #t130 #t131 #t132 #t133 #t134 #t135 #t136 #t137 #t138 #t139 #t14 #t140 #t141 #t142 #t143 #t144 #t145 #t146 #t147 #t148 #t149 #t15 #t150 #t151 #t152 #t153 #t154 #t155 #t156 #t157 #t158 #t159 #t16 #t160 #t161 #t162 #t163 #t164 #t165 #t166 #t167 #t168 #t169 #t17 #t170 #t171 #t172 #t173 #t174 #t175 #t176 #t177 #t178 #t179 #t18 #t180 #t181 #t182 #t183 #t184 #t185 #t186 #t187 #t188 #t189 #t19 #t190 #t191 #t192 #t193 #t194 #t195 #t196 #t197 #t198 #t199 #t2 #t20 #t200 #t201 #t202 #t203 #t204 #t205 #t206 #t207 #t208 #t209 #t21 #t210 #t211 #t212 #t213 #t214 #t215 #t216 #t217 #t218 #t219 #t22 #t220 #t221 #t222 #t223 #t224 #t225 #t226 #t227 #t228 #t229 #t23 #t230 #t231 #t232 #t233 #t234 #t235 #t236 #t237 #t238 #t239 #t24 #t240 #t241 #t242 #t243 #t244 #t245 #t246 #t247 #t248 #t249 #t25 #t250 #t251 #t252 #t253 #t254 #t255 #t256 #t257 #t258 #t259 #t26 #t260 #t261 #t262 #t263 #t264 #t265 #t266 #t267 #t268 #t269 #t27 #t270 #t271 #t272 #t273 #t274 #t275 #t276 #t277 #t278 #t279 #t28 #t280 #t281 #t282 #t283 #t284 #t285 #t286 #t287 #t288 #t289 #t29 #t290 #t291 #t292 #t293 #t294 #t295 #t296 #t297 #t298 #t299 #t3 #t30 #t300 #t301 #t302 #t303 #t304 #t305 #t306 #t307 #t308 #t309 #t31 #t310 #t311 #t312 #t313 #t314 #t315 #t316 #t317 #t318 #t319 #t32 #t320 #t321 #t322 #t323 #t324 #t325 #t326 #t327 #t328 #t329 #t33 #t330 #t331 #t332 #t333 #t334 #t335 #t336 #t337 #t338 #t339 #t34 #t340 #t341 #t342 #t343 #t344 #t345 #t346 #t347 #t348 #t349 #t35 #t350 #t351 #t352 #t353 #t354 #t355 #t356 #t357 #t358 #t359 #t36 #t360 #t361 #t362 #t363 #t364 #t365 #t366 #t367 #t368 #t369 #t37 #t370 #t371 #t372 #t373 #t374 #t375 #t376 #t377 #t378 #t379 #t38 #t380 #t381 #t382 #t383 #t384 #t385 #t386 #t387 #t388 #t389 #t39 #t390 #t391 #t392 #t393 #t394 #t395 #t396 #t397 #t398 #t399 #t4 #t40 #t400 #t401 #t402 #t403 #t404 #t405 #t406 #t407 #t408 #t409 #t41 #t410 #t411 #t412 #t413 #t414 #t415 #t416 #t417 #t418 #t419 #t42 #t420 #t421 #t422 #t423 #t424 #t425 #t426 #t427 #t428 #t429 #t43 #t430 #t431 #t432 #t433 #t434 #t435 #t436 #t437 #t438 #t439 #t44 #t440 #t441 #t442 #t443 #t444 #t445 #t446 #t447 #t448 #t449 #t45 #t450 #t451 #t452 #t453 #t454 #t455 #t456 #t457 #t458 #t459 #t46 #t460 #t461 #t462 #t463 #t464 #t465 #t466 #t467 #t468 #t469 #t47 #t470 #t471 #t472 #t473 #t474 #t475 #t476 #t477 #t478 #t479 #t48 #t480 #t481 #t482 #t483 #t484 #t485 #t486 #t487 #t488 #t489 #t49 #t490 #t491 #t492 #t493 #t494 #t495 #t496 #t497 #t498 #t499 #t5 #t50 #t500 #t501 #t502 #t503 #t504 #t505 #t506 #t507 #t508 #t509 #t51 #t510 #t511 #t512 #t513 #t514 #t515 #t516 #t517 #t518 #t519 #t52 #t520 #t521 #t522 #t523 #t524 #t525 #t526 #t527 #t528 #t529 #t53 #t530 #t531 #t532 #t533 #t534 #t535 #t536 #t537 #t538 #t539 #t54 #t540 #t541 #t542 #t543 #t544 #t545 #t546 #t547 #t548 #t549 #t55 #t550 #t551 #t552 #t553 #t554 #t555 #t556 #t557 #t558 #t559 #t56 #t560 #t561 #t562 #t563 #t564 #t565 #t566 #t567 #t568 #t569 #t57 #t570 #t571 #t572 #t573 #t574 #t575 #t576 #t577 #t578 #t579 #t58 #t580 #t581 #t582 #t583 #t584 #t585 #t586 #t587 #t588 #t589 #t59 #t590 #t591 #t592 #t593 #t594 #t595 #t596 #t597 #t598 #t599 #t6 #t60 #t600 #t601 #t602 #t603 #t604 #t605 #t606 #t607 #t608 #t609 #t61 #t610 #t611 #t612 #t613 #t614 #t615 #t616 #t617 #t618 #t619 #t62 #t620 #t621 #t622 #t623 #t624 #t625 #t626 #t627 #t628 #t629 #t63 #t630 #t631 #t632 #t633 #t634 #t635 #t636 #t637 #t638 #t639 #t64 #t640 #t641 #t642 #t643 #t644 #t645 #t646 #t647 #t648 #t649 #t65 #t650 #t651 #t652 #t653 #t654 #t655 #t656 #t657 #t658 #t659 #t66 #t660 #t661 #t662 #t663 #t664 #t665 #t666 #t667 #t668 #t669 #t67 #t670 #t671 #t672 #t673 #t674 #t675 #t676 #t677 #t678 #t679 #t68 #t680 #t681 #t682 #t683 #t684 #t685 #t686 #t687 #t688 #t689 #t69 #t690 #t691 #t692 #t693 #t694 #t695 #t696 #t697 #t698 #t699 #t7 #t70 #t700 #t701 #t702 #t703 #t704 #t705 #t706 #t707 #t708 #t709 #t71 #t710 #t711 #t712 #t713 #t714 #t715 #t716 #t717 #t718 #t719 #t72 #t720 #t721 #t722 #t723 #t724 #t725 #t726 #t727 #t728 #t729 #t73 #t730 #t731 #t732 #t733 #t734 #t735 #t736 #t737 #t738 #t739 #t74 #t740 #t741 #t742 #t743 #t744 #t745 #t746 #t747 #t748 #t749 #t75 #t750 #t751 #t752 #t753 #t754 #t755 #t756 #t757 #t758 #t759 #t76 #t760 #t761 #t762 #t763 #t764 #t765 #t766 #t767 #t768 #t769 #t77 #t770 #t771 #t772 #t773 #t774 #t775 #t776 #t777 #t778 #t779 #t78 #t780 #t781 #t782 #t783 #t784 #t785 #t786 #t787 #t788 #t789 #t79 #t790 #t791 #t792 #t793 #t794 #t795 #t796 #t797 #t798 #t799 #t8 #t80 #t800 #t801 #t802 #t803 #t804 #t805 #t806 #t807 #t808 #t809 #t81 #t810 #t811 #t812 #t813 #t814 #t815 #t816 #t817 #t818 #t819 #t82 #t820 #t821 #t822 #t823 #t824 #t825 #t826 #t827 #t828 #t829 #t83 #t830 #t831 #t832 #t833 #t834 #t835 #t836 #t837 #t838 #t839 #t84 #t840 #t841 #t842 #t843 #t844 #t845 #t846 #t847 #t848 #t849 #t85 #t850 #t851 #t852 #t853 #t854 #t855 #t856 #t857 #t858 #t859 #t86 #t860 #t861 #t862 #t863 #t864 #t865 #t866 #t867 #t868 #t869 #t87 #t870 #t871 #t872 #t873 #t874 #t875 #t876 #t877 #t878 #t879 #t88 #t880 #t881 #t882 #t883 #t884 #t885 #t886 #t887 #t888 #t889 #t89 #t890 #t891 #t892 #t893 #t894 #t895 #t896 #t897 #t898 #t899 #t9 #t90 #t900 #t901 #t902 #t903 #t904 #t905 #t906 #t907 #t908 #t909 #t91 #t910 #t911 #t912 #t913 #t914 #t915 #t916 #t917 #t918 #t919 #t92 #t920 #t921 #t922 #t923 #t924 #t925 #t926 #t927 #t928 #t929 #t93 #t930 #t931 #t932 #t933 #t934 #t935 #t936 #t937 #t938 #t939 #t94 #t940 #t941 #t942 #t943 #t944 #t945 #t946 #t947 #t948 #t949 #t95 #t950 #t951 #t952 #t953 #t954 #t955 #t956 #t957 #t958 #t959 #t96 #t960 #t961 #t962 #t963 #t964 #t965 #t966 #t967 #t968 #t969 #t97 #t970 #t971 #t972 #t973 #t974 #t975 #t976 #t977 #t978 #t979 #t98 #t980 #t981 #t982 #t983 #t984 #t985 #t986 #t987 #t988 #t989 #t99 #t990 #t991 #t992 #t993 #t994 #t995 #t996 #t997 #t998 #t999 - trajectory
          #g0 #g1 #g2 #g3 #g4 #g5 #g6 #g7 #g8 - grasp
          #q0 #q1 #q10 #q11 #q12 #q13 #q14 #q15 #q16 #q17 #q18 #q19 #q2 #q20 #q21 #q22 #q23 #q24 #q25 #q26 #q3 #q4 #q5 #q6 #q7 #q8 #q9 - config
   )

   (:predicates
          (issink ?r - wuti)
          (isstove ?r - wuti)
          (fixed ?r - wuti)
          (graspable ?o - wuti)
          (isgraspdir ?o - wuti ?p - pose ?dg - grasp_dir)
          (isgrasp ?o - wuti ?g - grasp)
          (graspatpose ?g - grasp ?p - pose)
          (stackable ?o - wuti ?r - wuti)
          (ispose ?o - wuti ?p - pose)
          (isconf ?q - config)
          (istraj ?t - trajectory)
          (iskin ?o - wuti ?p - pose ?g - grasp ?q - config ?t - trajectory)
          (isfreemotion ?q1 - config ?t - trajectory ?q2 - config)
          (isholdingmotion ?q1 - config ?t - trajectory ?q2 - config ?o - wuti ?g - grasp)
          (trajcollision ?t - trajectory ?o2 - wuti ?p2 - pose)
          (issupport ?o - wuti ?p - pose ?r - wuti)
          (isstacksupport ?ou - wuti ?pu - pose ?os - wuti ?ps - pose)
          (atpose ?o - wuti ?p - pose)
          (atgrasp ?o - wuti ?g - grasp)
          (handempty)
          (atconf ?q - config)
          (canmove)
          (cleaned ?o - wuti)
          (cooked ?o - wuti)
          (on ?o - wuti ?r - wuti)
          (occupied ?o - wuti)
          (holding ?o - wuti)
          (usedgrasp ?g)
          (canpick)
          (canplace)
          (ismeasuredpose ?o - wuti ?p - pose)
          (located ?o - wuti ?p - pose)
          (allowlocate)
          (issensor ?o - wuti)
          (usedgrasp ?o - wuti ?p - pose ?g - grasp)
          (_applicable ?_p - propo_action)
   )

   (:derived (on ?ou - wuti ?os - wuti)
          (or (exists (?pu) (and (issupport ?ou ?pu ?os) (atpose ?ou ?pu))) (exists (?pu ?ps) (and (isstacksupport ?ou ?pu ?os ?ps) (atpose ?ou ?pu) (atpose ?os ?ps))))
   )
   (:derived (occupied ?os - wuti)
          (exists (?ou) (on ?ou ?os))
   )
   (:derived (holding ?o - wuti)
          (exists (?g) (and (isgrasp ?o ?g) (atgrasp ?o ?g)))
   )

   (:action a0_move_free
          :parameters (q40 #q0 #t31)
          :precondition (and (isfreemotion q40 #t31 #q0) (atconf q40) (handempty) (canmove) (_applicable _p0))
          :effect (and (atconf #q0) (not (atconf q40)) (not (canmove)) (canpick) (increase (total-cost) 100) (not (_applicable _p0)) (_applicable _p1))
   )
   (:action a1_pick
          :parameters (o8 p736 #g0 #q0 #t1)
          :precondition (and (iskin o8 p736 #g0 #q0 #t1) (atpose o8 p736) (handempty) (atconf #q0) (canpick) (not (usedgrasp o8 p736 #g0)) (graspatpose #g0 p736) (_applicable _p1))
          :effect (and (atgrasp o8 #g0) (canmove) (not (atpose o8 p736)) (not (handempty)) (increase (total-cost) 100) (not (_applicable _p1)) (_applicable _p2))
   )
   (:action a2_move_holding
          :parameters (#q0 #q4 o8 #g0 #t262)
          :precondition (and (isholdingmotion #q0 #t262 #q4 o8 #g0) (atconf #q0) (atgrasp o8 #g0) (canmove) (_applicable _p2))
          :effect (and (atconf #q4) (not (atconf #q0)) (not (canmove)) (canpick) (canplace) (increase (total-cost) 100) (not (_applicable _p2)) (_applicable _p3))
   )
   (:action a3_place
          :parameters (o8 #p1 o7 #g0 #q4 #t5)
          :precondition (and (iskin o8 #p1 #g0 #q4 #t5) (issupport o8 #p1 o7) (atgrasp o8 #g0) (atconf #q4) (graspable o8) (fixed o7) (canplace) (_applicable _p3))
          :effect (and (atpose o8 #p1) (handempty) (canmove) (not (atgrasp o8 #g0)) (not (canpick)) (not (canplace)) (increase (total-cost) 100) (allowlocate) (not (located o8 #p1)) (usedgrasp o8 #p1 #g0) (not (_applicable _p3)) (_applicable _p4))
   )
   (:action a4_move_free
          :parameters (#q4 #q2 #t83)
          :precondition (and (isfreemotion #q4 #t83 #q2) (atconf #q4) (handempty) (canmove) (_applicable _p4))
          :effect (and (atconf #q2) (not (atconf #q4)) (not (canmove)) (canpick) (increase (total-cost) 100) (not (_applicable _p4)) (_applicable _p5))
   )
   (:action a5_pick
          :parameters (o10 p248 #g2 #q2 #t3)
          :precondition (and (iskin o10 p248 #g2 #q2 #t3) (atpose o10 p248) (handempty) (atconf #q2) (canpick) (not (usedgrasp o10 p248 #g2)) (graspatpose #g2 p248) (_applicable _p5))
          :effect (and (atgrasp o10 #g2) (canmove) (not (atpose o10 p248)) (not (handempty)) (increase (total-cost) 100) (not (_applicable _p5)) (_applicable _p6))
   )
   (:action a6_move_holding
          :parameters (#q2 #q2 o10 #g2 #t426)
          :precondition (and (isholdingmotion #q2 #t426 #q2 o10 #g2) (atconf #q2) (atgrasp o10 #g2) (canmove) (_applicable _p6))
          :effect (and (atconf #q2) (not (atconf #q2)) (not (canmove)) (canpick) (canplace) (increase (total-cost) 100) (not (_applicable _p6)) (_applicable _p7))
   )
   (:action a7_place
          :parameters (o10 p248 o6 #g2 #q2 #t3)
          :precondition (and (iskin o10 p248 #g2 #q2 #t3) (issupport o10 p248 o6) (atgrasp o10 #g2) (atconf #q2) (graspable o10) (fixed o6) (canplace) (_applicable _p7))
          :effect (and (atpose o10 p248) (handempty) (canmove) (not (atgrasp o10 #g2)) (not (canpick)) (not (canplace)) (increase (total-cost) 100) (allowlocate) (not (located o10 p248)) (usedgrasp o10 p248 #g2) (not (_applicable _p7)) (_applicable _p8))
   )
   (:action a8_move_free
          :parameters (#q2 q40 #t60)
          :precondition (and (isfreemotion #q2 #t60 q40) (atconf #q2) (handempty) (canmove) (_applicable _p8))
          :effect (and (atconf q40) (not (atconf #q2)) (not (canmove)) (canpick) (increase (total-cost) 100) (not (_applicable _p8)) (_applicable _p9))
   )
   (:action s0_sample-place
          :parameters (o8 o6)
          :precondition (stackable o8 o6)
          :effect (and (ispose o8 #p0) (issupport o8 #p0 o6))
   )
   (:action s1_sample-place
          :parameters (o8 o7)
          :precondition (stackable o8 o7)
          :effect (and (ispose o8 #p1) (issupport o8 #p1 o7))
   )
   (:action s2_sample-place
          :parameters (o9 o6)
          :precondition (stackable o9 o6)
          :effect (and (ispose o9 #p2) (issupport o9 #p2 o6))
   )
   (:action s3_sample-place
          :parameters (o9 o7)
          :precondition (stackable o9 o7)
          :effect (and (ispose o9 #p3) (issupport o9 #p3 o7))
   )
   (:action s4_sample-place
          :parameters (o10 o6)
          :precondition (stackable o10 o6)
          :effect (and (ispose o10 #p4) (issupport o10 #p4 o6))
   )
   (:action s5_sample-place
          :parameters (o10 o7)
          :precondition (stackable o10 o7)
          :effect (and (ispose o10 #p5) (issupport o10 #p5 o7))
   )
   (:action s6_sample-grasp-dir
          :parameters (o8 p736)
          :precondition (and (graspable o8) (ispose o8 p736))
          :effect (isgraspdir o8 p736 #d0)
   )
   (:action s7_sample-grasp-dir
          :parameters (o9 p848)
          :precondition (and (graspable o9) (ispose o9 p848))
          :effect (isgraspdir o9 p848 #d1)
   )
   (:action s8_sample-grasp-dir
          :parameters (o10 p248)
          :precondition (and (graspable o10) (ispose o10 p248))
          :effect (isgraspdir o10 p248 #d2)
   )
   (:action s9_plan-free-motion
          :parameters (q40 q40)
          :precondition (and (isconf q40) (isconf q40))
          :effect (isfreemotion q40 #t0 q40)
   )
   (:action s10_sample-grasp-dir
          :parameters (o8 #p0)
          :precondition (and (graspable o8) (ispose o8 #p0))
          :effect (isgraspdir o8 #p0 #d3)
   )
   (:action s11_sample-grasp-dir
          :parameters (o8 #p1)
          :precondition (and (graspable o8) (ispose o8 #p1))
          :effect (isgraspdir o8 #p1 #d4)
   )
   (:action s12_sample-grasp-dir
          :parameters (o9 #p2)
          :precondition (and (graspable o9) (ispose o9 #p2))
          :effect (isgraspdir o9 #p2 #d5)
   )
   (:action s13_sample-grasp-dir
          :parameters (o9 #p3)
          :precondition (and (graspable o9) (ispose o9 #p3))
          :effect (isgraspdir o9 #p3 #d6)
   )
   (:action s14_sample-grasp-dir
          :parameters (o10 #p4)
          :precondition (and (graspable o10) (ispose o10 #p4))
          :effect (isgraspdir o10 #p4 #d7)
   )
   (:action s15_sample-grasp-dir
          :parameters (o10 #p5)
          :precondition (and (graspable o10) (ispose o10 #p5))
          :effect (isgraspdir o10 #p5 #d8)
   )
   (:action s16_sample-grasp
          :parameters (o8 p736 #d0)
          :precondition (isgraspdir o8 p736 #d0)
          :effect (and (graspatpose #g0 p736) (isgrasp o8 #g0))
   )
   (:action s17_sample-grasp
          :parameters (o9 p848 #d1)
          :precondition (isgraspdir o9 p848 #d1)
          :effect (and (graspatpose #g1 p848) (isgrasp o9 #g1))
   )
   (:action s18_sample-grasp
          :parameters (o10 p248 #d2)
          :precondition (isgraspdir o10 p248 #d2)
          :effect (and (graspatpose #g2 p248) (isgrasp o10 #g2))
   )
   (:action s19_sample-grasp
          :parameters (o8 #p0 #d3)
          :precondition (isgraspdir o8 #p0 #d3)
          :effect (and (graspatpose #g3 #p0) (isgrasp o8 #g3))
   )
   (:action s20_sample-grasp
          :parameters (o8 #p1 #d4)
          :precondition (isgraspdir o8 #p1 #d4)
          :effect (and (graspatpose #g4 #p1) (isgrasp o8 #g4))
   )
   (:action s21_sample-grasp
          :parameters (o9 #p2 #d5)
          :precondition (isgraspdir o9 #p2 #d5)
          :effect (and (graspatpose #g5 #p2) (isgrasp o9 #g5))
   )
   (:action s22_sample-grasp
          :parameters (o9 #p3 #d6)
          :precondition (isgraspdir o9 #p3 #d6)
          :effect (and (graspatpose #g6 #p3) (isgrasp o9 #g6))
   )
   (:action s23_sample-grasp
          :parameters (o10 #p4 #d7)
          :precondition (isgraspdir o10 #p4 #d7)
          :effect (and (graspatpose #g7 #p4) (isgrasp o10 #g7))
   )
   (:action s24_sample-grasp
          :parameters (o10 #p5 #d8)
          :precondition (isgraspdir o10 #p5 #d8)
          :effect (and (graspatpose #g8 #p5) (isgrasp o10 #g8))
   )
   (:action s25_inverse-kinematics
          :parameters (o8 p736 #g0)
          :precondition (and (ispose o8 p736) (isgrasp o8 #g0))
          :effect (and (isconf #q0) (istraj #t1) (iskin o8 p736 #g0 #q0 #t1))
   )
   (:action s26_inverse-kinematics
          :parameters (o9 p848 #g1)
          :precondition (and (ispose o9 p848) (isgrasp o9 #g1))
          :effect (and (isconf #q1) (istraj #t2) (iskin o9 p848 #g1 #q1 #t2))
   )
   (:action s27_inverse-kinematics
          :parameters (o10 p248 #g2)
          :precondition (and (ispose o10 p248) (isgrasp o10 #g2))
          :effect (and (isconf #q2) (istraj #t3) (iskin o10 p248 #g2 #q2 #t3))
   )
   (:action s28_inverse-kinematics
          :parameters (o8 #p0 #g0)
          :precondition (and (ispose o8 #p0) (isgrasp o8 #g0))
          :effect (and (isconf #q3) (istraj #t4) (iskin o8 #p0 #g0 #q3 #t4))
   )
   (:action s29_inverse-kinematics
          :parameters (o8 #p1 #g0)
          :precondition (and (ispose o8 #p1) (isgrasp o8 #g0))
          :effect (and (isconf #q4) (istraj #t5) (iskin o8 #p1 #g0 #q4 #t5))
   )
   (:action s30_inverse-kinematics
          :parameters (o9 #p2 #g1)
          :precondition (and (ispose o9 #p2) (isgrasp o9 #g1))
          :effect (and (isconf #q5) (istraj #t6) (iskin o9 #p2 #g1 #q5 #t6))
   )
   (:action s31_inverse-kinematics
          :parameters (o9 #p3 #g1)
          :precondition (and (ispose o9 #p3) (isgrasp o9 #g1))
          :effect (and (isconf #q6) (istraj #t7) (iskin o9 #p3 #g1 #q6 #t7))
   )
   (:action s32_inverse-kinematics
          :parameters (o10 #p4 #g2)
          :precondition (and (ispose o10 #p4) (isgrasp o10 #g2))
          :effect (and (isconf #q7) (istraj #t8) (iskin o10 #p4 #g2 #q7 #t8))
   )
   (:action s33_inverse-kinematics
          :parameters (o10 #p5 #g2)
          :precondition (and (ispose o10 #p5) (isgrasp o10 #g2))
          :effect (and (isconf #q8) (istraj #t9) (iskin o10 #p5 #g2 #q8 #t9))
   )
   (:action s34_plan-holding-motion
          :parameters (q40 q40 o8 #g0)
          :precondition (and (isconf q40) (isconf q40) (isgrasp o8 #g0))
          :effect (isholdingmotion q40 #t10 q40 o8 #g0)
   )
   (:action s35_plan-holding-motion
          :parameters (q40 q40 o9 #g1)
          :precondition (and (isconf q40) (isconf q40) (isgrasp o9 #g1))
          :effect (isholdingmotion q40 #t11 q40 o9 #g1)
   )
   (:action s36_plan-holding-motion
          :parameters (q40 q40 o10 #g2)
          :precondition (and (isconf q40) (isconf q40) (isgrasp o10 #g2))
          :effect (isholdingmotion q40 #t12 q40 o10 #g2)
   )
   (:action s37_inverse-kinematics
          :parameters (o8 p736 #g3)
          :precondition (and (ispose o8 p736) (isgrasp o8 #g3))
          :effect (and (isconf #q9) (istraj #t13) (iskin o8 p736 #g3 #q9 #t13))
   )
   (:action s38_inverse-kinematics
          :parameters (o8 p736 #g4)
          :precondition (and (ispose o8 p736) (isgrasp o8 #g4))
          :effect (and (isconf #q10) (istraj #t14) (iskin o8 p736 #g4 #q10 #t14))
   )
   (:action s39_inverse-kinematics
          :parameters (o9 p848 #g5)
          :precondition (and (ispose o9 p848) (isgrasp o9 #g5))
          :effect (and (isconf #q11) (istraj #t15) (iskin o9 p848 #g5 #q11 #t15))
   )
   (:action s40_inverse-kinematics
          :parameters (o9 p848 #g6)
          :precondition (and (ispose o9 p848) (isgrasp o9 #g6))
          :effect (and (isconf #q12) (istraj #t16) (iskin o9 p848 #g6 #q12 #t16))
   )
   (:action s41_inverse-kinematics
          :parameters (o10 p248 #g7)
          :precondition (and (ispose o10 p248) (isgrasp o10 #g7))
          :effect (and (isconf #q13) (istraj #t17) (iskin o10 p248 #g7 #q13 #t17))
   )
   (:action s42_inverse-kinematics
          :parameters (o10 p248 #g8)
          :precondition (and (ispose o10 p248) (isgrasp o10 #g8))
          :effect (and (isconf #q14) (istraj #t18) (iskin o10 p248 #g8 #q14 #t18))
   )
   (:action s43_inverse-kinematics
          :parameters (o8 #p0 #g3)
          :precondition (and (ispose o8 #p0) (isgrasp o8 #g3))
          :effect (and (isconf #q15) (istraj #t19) (iskin o8 #p0 #g3 #q15 #t19))
   )
   (:action s44_inverse-kinematics
          :parameters (o8 #p0 #g4)
          :precondition (and (ispose o8 #p0) (isgrasp o8 #g4))
          :effect (and (isconf #q16) (istraj #t20) (iskin o8 #p0 #g4 #q16 #t20))
   )
   (:action s45_inverse-kinematics
          :parameters (o8 #p1 #g3)
          :precondition (and (ispose o8 #p1) (isgrasp o8 #g3))
          :effect (and (isconf #q17) (istraj #t21) (iskin o8 #p1 #g3 #q17 #t21))
   )
   (:action s46_inverse-kinematics
          :parameters (o8 #p1 #g4)
          :precondition (and (ispose o8 #p1) (isgrasp o8 #g4))
          :effect (and (isconf #q18) (istraj #t22) (iskin o8 #p1 #g4 #q18 #t22))
   )
   (:action s47_inverse-kinematics
          :parameters (o9 #p2 #g5)
          :precondition (and (ispose o9 #p2) (isgrasp o9 #g5))
          :effect (and (isconf #q19) (istraj #t23) (iskin o9 #p2 #g5 #q19 #t23))
   )
   (:action s48_inverse-kinematics
          :parameters (o9 #p2 #g6)
          :precondition (and (ispose o9 #p2) (isgrasp o9 #g6))
          :effect (and (isconf #q20) (istraj #t24) (iskin o9 #p2 #g6 #q20 #t24))
   )
   (:action s49_inverse-kinematics
          :parameters (o9 #p3 #g5)
          :precondition (and (ispose o9 #p3) (isgrasp o9 #g5))
          :effect (and (isconf #q21) (istraj #t25) (iskin o9 #p3 #g5 #q21 #t25))
   )
   (:action s50_inverse-kinematics
          :parameters (o9 #p3 #g6)
          :precondition (and (ispose o9 #p3) (isgrasp o9 #g6))
          :effect (and (isconf #q22) (istraj #t26) (iskin o9 #p3 #g6 #q22 #t26))
   )
   (:action s51_inverse-kinematics
          :parameters (o10 #p4 #g7)
          :precondition (and (ispose o10 #p4) (isgrasp o10 #g7))
          :effect (and (isconf #q23) (istraj #t27) (iskin o10 #p4 #g7 #q23 #t27))
   )
   (:action s52_inverse-kinematics
          :parameters (o10 #p4 #g8)
          :precondition (and (ispose o10 #p4) (isgrasp o10 #g8))
          :effect (and (isconf #q24) (istraj #t28) (iskin o10 #p4 #g8 #q24 #t28))
   )
   (:action s53_inverse-kinematics
          :parameters (o10 #p5 #g7)
          :precondition (and (ispose o10 #p5) (isgrasp o10 #g7))
          :effect (and (isconf #q25) (istraj #t29) (iskin o10 #p5 #g7 #q25 #t29))
   )
   (:action s54_inverse-kinematics
          :parameters (o10 #p5 #g8)
          :precondition (and (ispose o10 #p5) (isgrasp o10 #g8))
          :effect (and (isconf #q26) (istraj #t30) (iskin o10 #p5 #g8 #q26 #t30))
   )
   (:action s55_plan-free-motion
          :parameters (q40 #q0)
          :precondition (and (isconf q40) (isconf #q0))
          :effect (isfreemotion q40 #t31 #q0)
   )
   (:action s56_plan-free-motion
          :parameters (q40 #q1)
          :precondition (and (isconf q40) (isconf #q1))
          :effect (isfreemotion q40 #t32 #q1)
   )
   (:action s57_plan-free-motion
          :parameters (q40 #q2)
          :precondition (and (isconf q40) (isconf #q2))
          :effect (isfreemotion q40 #t33 #q2)
   )
   (:action s58_plan-free-motion
          :parameters (q40 #q3)
          :precondition (and (isconf q40) (isconf #q3))
          :effect (isfreemotion q40 #t34 #q3)
   )
   (:action s59_plan-free-motion
          :parameters (q40 #q4)
          :precondition (and (isconf q40) (isconf #q4))
          :effect (isfreemotion q40 #t35 #q4)
   )
   (:action s60_plan-free-motion
          :parameters (q40 #q5)
          :precondition (and (isconf q40) (isconf #q5))
          :effect (isfreemotion q40 #t36 #q5)
   )
   (:action s61_plan-free-motion
          :parameters (q40 #q6)
          :precondition (and (isconf q40) (isconf #q6))
          :effect (isfreemotion q40 #t37 #q6)
   )
   (:action s62_plan-free-motion
          :parameters (q40 #q7)
          :precondition (and (isconf q40) (isconf #q7))
          :effect (isfreemotion q40 #t38 #q7)
   )
   (:action s63_plan-free-motion
          :parameters (q40 #q8)
          :precondition (and (isconf q40) (isconf #q8))
          :effect (isfreemotion q40 #t39 #q8)
   )
   (:action s64_plan-free-motion
          :parameters (#q0 q40)
          :precondition (and (isconf #q0) (isconf q40))
          :effect (isfreemotion #q0 #t40 q40)
   )
   (:action s65_plan-free-motion
          :parameters (#q0 #q0)
          :precondition (and (isconf #q0) (isconf #q0))
          :effect (isfreemotion #q0 #t41 #q0)
   )
   (:action s66_plan-free-motion
          :parameters (#q0 #q1)
          :precondition (and (isconf #q0) (isconf #q1))
          :effect (isfreemotion #q0 #t42 #q1)
   )
   (:action s67_plan-free-motion
          :parameters (#q0 #q2)
          :precondition (and (isconf #q0) (isconf #q2))
          :effect (isfreemotion #q0 #t43 #q2)
   )
   (:action s68_plan-free-motion
          :parameters (#q0 #q3)
          :precondition (and (isconf #q0) (isconf #q3))
          :effect (isfreemotion #q0 #t44 #q3)
   )
   (:action s69_plan-free-motion
          :parameters (#q0 #q4)
          :precondition (and (isconf #q0) (isconf #q4))
          :effect (isfreemotion #q0 #t45 #q4)
   )
   (:action s70_plan-free-motion
          :parameters (#q0 #q5)
          :precondition (and (isconf #q0) (isconf #q5))
          :effect (isfreemotion #q0 #t46 #q5)
   )
   (:action s71_plan-free-motion
          :parameters (#q0 #q6)
          :precondition (and (isconf #q0) (isconf #q6))
          :effect (isfreemotion #q0 #t47 #q6)
   )
   (:action s72_plan-free-motion
          :parameters (#q0 #q7)
          :precondition (and (isconf #q0) (isconf #q7))
          :effect (isfreemotion #q0 #t48 #q7)
   )
   (:action s73_plan-free-motion
          :parameters (#q0 #q8)
          :precondition (and (isconf #q0) (isconf #q8))
          :effect (isfreemotion #q0 #t49 #q8)
   )
   (:action s74_plan-free-motion
          :parameters (#q1 q40)
          :precondition (and (isconf #q1) (isconf q40))
          :effect (isfreemotion #q1 #t50 q40)
   )
   (:action s75_plan-free-motion
          :parameters (#q1 #q0)
          :precondition (and (isconf #q1) (isconf #q0))
          :effect (isfreemotion #q1 #t51 #q0)
   )
   (:action s76_plan-free-motion
          :parameters (#q1 #q1)
          :precondition (and (isconf #q1) (isconf #q1))
          :effect (isfreemotion #q1 #t52 #q1)
   )
   (:action s77_plan-free-motion
          :parameters (#q1 #q2)
          :precondition (and (isconf #q1) (isconf #q2))
          :effect (isfreemotion #q1 #t53 #q2)
   )
   (:action s78_plan-free-motion
          :parameters (#q1 #q3)
          :precondition (and (isconf #q1) (isconf #q3))
          :effect (isfreemotion #q1 #t54 #q3)
   )
   (:action s79_plan-free-motion
          :parameters (#q1 #q4)
          :precondition (and (isconf #q1) (isconf #q4))
          :effect (isfreemotion #q1 #t55 #q4)
   )
   (:action s80_plan-free-motion
          :parameters (#q1 #q5)
          :precondition (and (isconf #q1) (isconf #q5))
          :effect (isfreemotion #q1 #t56 #q5)
   )
   (:action s81_plan-free-motion
          :parameters (#q1 #q6)
          :precondition (and (isconf #q1) (isconf #q6))
          :effect (isfreemotion #q1 #t57 #q6)
   )
   (:action s82_plan-free-motion
          :parameters (#q1 #q7)
          :precondition (and (isconf #q1) (isconf #q7))
          :effect (isfreemotion #q1 #t58 #q7)
   )
   (:action s83_plan-free-motion
          :parameters (#q1 #q8)
          :precondition (and (isconf #q1) (isconf #q8))
          :effect (isfreemotion #q1 #t59 #q8)
   )
   (:action s84_plan-free-motion
          :parameters (#q2 q40)
          :precondition (and (isconf #q2) (isconf q40))
          :effect (isfreemotion #q2 #t60 q40)
   )
   (:action s85_plan-free-motion
          :parameters (#q2 #q0)
          :precondition (and (isconf #q2) (isconf #q0))
          :effect (isfreemotion #q2 #t61 #q0)
   )
   (:action s86_plan-free-motion
          :parameters (#q2 #q1)
          :precondition (and (isconf #q2) (isconf #q1))
          :effect (isfreemotion #q2 #t62 #q1)
   )
   (:action s87_plan-free-motion
          :parameters (#q2 #q2)
          :precondition (and (isconf #q2) (isconf #q2))
          :effect (isfreemotion #q2 #t63 #q2)
   )
   (:action s88_plan-free-motion
          :parameters (#q2 #q3)
          :precondition (and (isconf #q2) (isconf #q3))
          :effect (isfreemotion #q2 #t64 #q3)
   )
   (:action s89_plan-free-motion
          :parameters (#q2 #q4)
          :precondition (and (isconf #q2) (isconf #q4))
          :effect (isfreemotion #q2 #t65 #q4)
   )
   (:action s90_plan-free-motion
          :parameters (#q2 #q5)
          :precondition (and (isconf #q2) (isconf #q5))
          :effect (isfreemotion #q2 #t66 #q5)
   )
   (:action s91_plan-free-motion
          :parameters (#q2 #q6)
          :precondition (and (isconf #q2) (isconf #q6))
          :effect (isfreemotion #q2 #t67 #q6)
   )
   (:action s92_plan-free-motion
          :parameters (#q2 #q7)
          :precondition (and (isconf #q2) (isconf #q7))
          :effect (isfreemotion #q2 #t68 #q7)
   )
   (:action s93_plan-free-motion
          :parameters (#q2 #q8)
          :precondition (and (isconf #q2) (isconf #q8))
          :effect (isfreemotion #q2 #t69 #q8)
   )
   (:action s94_plan-free-motion
          :parameters (#q3 q40)
          :precondition (and (isconf #q3) (isconf q40))
          :effect (isfreemotion #q3 #t70 q40)
   )
   (:action s95_plan-free-motion
          :parameters (#q3 #q0)
          :precondition (and (isconf #q3) (isconf #q0))
          :effect (isfreemotion #q3 #t71 #q0)
   )
   (:action s96_plan-free-motion
          :parameters (#q3 #q1)
          :precondition (and (isconf #q3) (isconf #q1))
          :effect (isfreemotion #q3 #t72 #q1)
   )
   (:action s97_plan-free-motion
          :parameters (#q3 #q2)
          :precondition (and (isconf #q3) (isconf #q2))
          :effect (isfreemotion #q3 #t73 #q2)
   )
   (:action s98_plan-free-motion
          :parameters (#q3 #q3)
          :precondition (and (isconf #q3) (isconf #q3))
          :effect (isfreemotion #q3 #t74 #q3)
   )
   (:action s99_plan-free-motion
          :parameters (#q3 #q4)
          :precondition (and (isconf #q3) (isconf #q4))
          :effect (isfreemotion #q3 #t75 #q4)
   )
   (:action s100_plan-free-motion
          :parameters (#q3 #q5)
          :precondition (and (isconf #q3) (isconf #q5))
          :effect (isfreemotion #q3 #t76 #q5)
   )
   (:action s101_plan-free-motion
          :parameters (#q3 #q6)
          :precondition (and (isconf #q3) (isconf #q6))
          :effect (isfreemotion #q3 #t77 #q6)
   )
   (:action s102_plan-free-motion
          :parameters (#q3 #q7)
          :precondition (and (isconf #q3) (isconf #q7))
          :effect (isfreemotion #q3 #t78 #q7)
   )
   (:action s103_plan-free-motion
          :parameters (#q3 #q8)
          :precondition (and (isconf #q3) (isconf #q8))
          :effect (isfreemotion #q3 #t79 #q8)
   )
   (:action s104_plan-free-motion
          :parameters (#q4 q40)
          :precondition (and (isconf #q4) (isconf q40))
          :effect (isfreemotion #q4 #t80 q40)
   )
   (:action s105_plan-free-motion
          :parameters (#q4 #q0)
          :precondition (and (isconf #q4) (isconf #q0))
          :effect (isfreemotion #q4 #t81 #q0)
   )
   (:action s106_plan-free-motion
          :parameters (#q4 #q1)
          :precondition (and (isconf #q4) (isconf #q1))
          :effect (isfreemotion #q4 #t82 #q1)
   )
   (:action s107_plan-free-motion
          :parameters (#q4 #q2)
          :precondition (and (isconf #q4) (isconf #q2))
          :effect (isfreemotion #q4 #t83 #q2)
   )
   (:action s108_plan-free-motion
          :parameters (#q4 #q3)
          :precondition (and (isconf #q4) (isconf #q3))
          :effect (isfreemotion #q4 #t84 #q3)
   )
   (:action s109_plan-free-motion
          :parameters (#q4 #q4)
          :precondition (and (isconf #q4) (isconf #q4))
          :effect (isfreemotion #q4 #t85 #q4)
   )
   (:action s110_plan-free-motion
          :parameters (#q4 #q5)
          :precondition (and (isconf #q4) (isconf #q5))
          :effect (isfreemotion #q4 #t86 #q5)
   )
   (:action s111_plan-free-motion
          :parameters (#q4 #q6)
          :precondition (and (isconf #q4) (isconf #q6))
          :effect (isfreemotion #q4 #t87 #q6)
   )
   (:action s112_plan-free-motion
          :parameters (#q4 #q7)
          :precondition (and (isconf #q4) (isconf #q7))
          :effect (isfreemotion #q4 #t88 #q7)
   )
   (:action s113_plan-free-motion
          :parameters (#q4 #q8)
          :precondition (and (isconf #q4) (isconf #q8))
          :effect (isfreemotion #q4 #t89 #q8)
   )
   (:action s114_plan-free-motion
          :parameters (#q5 q40)
          :precondition (and (isconf #q5) (isconf q40))
          :effect (isfreemotion #q5 #t90 q40)
   )
   (:action s115_plan-free-motion
          :parameters (#q5 #q0)
          :precondition (and (isconf #q5) (isconf #q0))
          :effect (isfreemotion #q5 #t91 #q0)
   )
   (:action s116_plan-free-motion
          :parameters (#q5 #q1)
          :precondition (and (isconf #q5) (isconf #q1))
          :effect (isfreemotion #q5 #t92 #q1)
   )
   (:action s117_plan-free-motion
          :parameters (#q5 #q2)
          :precondition (and (isconf #q5) (isconf #q2))
          :effect (isfreemotion #q5 #t93 #q2)
   )
   (:action s118_plan-free-motion
          :parameters (#q5 #q3)
          :precondition (and (isconf #q5) (isconf #q3))
          :effect (isfreemotion #q5 #t94 #q3)
   )
   (:action s119_plan-free-motion
          :parameters (#q5 #q4)
          :precondition (and (isconf #q5) (isconf #q4))
          :effect (isfreemotion #q5 #t95 #q4)
   )
   (:action s120_plan-free-motion
          :parameters (#q5 #q5)
          :precondition (and (isconf #q5) (isconf #q5))
          :effect (isfreemotion #q5 #t96 #q5)
   )
   (:action s121_plan-free-motion
          :parameters (#q5 #q6)
          :precondition (and (isconf #q5) (isconf #q6))
          :effect (isfreemotion #q5 #t97 #q6)
   )
   (:action s122_plan-free-motion
          :parameters (#q5 #q7)
          :precondition (and (isconf #q5) (isconf #q7))
          :effect (isfreemotion #q5 #t98 #q7)
   )
   (:action s123_plan-free-motion
          :parameters (#q5 #q8)
          :precondition (and (isconf #q5) (isconf #q8))
          :effect (isfreemotion #q5 #t99 #q8)
   )
   (:action s124_plan-free-motion
          :parameters (#q6 q40)
          :precondition (and (isconf #q6) (isconf q40))
          :effect (isfreemotion #q6 #t100 q40)
   )
   (:action s125_plan-free-motion
          :parameters (#q6 #q0)
          :precondition (and (isconf #q6) (isconf #q0))
          :effect (isfreemotion #q6 #t101 #q0)
   )
   (:action s126_plan-free-motion
          :parameters (#q6 #q1)
          :precondition (and (isconf #q6) (isconf #q1))
          :effect (isfreemotion #q6 #t102 #q1)
   )
   (:action s127_plan-free-motion
          :parameters (#q6 #q2)
          :precondition (and (isconf #q6) (isconf #q2))
          :effect (isfreemotion #q6 #t103 #q2)
   )
   (:action s128_plan-free-motion
          :parameters (#q6 #q3)
          :precondition (and (isconf #q6) (isconf #q3))
          :effect (isfreemotion #q6 #t104 #q3)
   )
   (:action s129_plan-free-motion
          :parameters (#q6 #q4)
          :precondition (and (isconf #q6) (isconf #q4))
          :effect (isfreemotion #q6 #t105 #q4)
   )
   (:action s130_plan-free-motion
          :parameters (#q6 #q5)
          :precondition (and (isconf #q6) (isconf #q5))
          :effect (isfreemotion #q6 #t106 #q5)
   )
   (:action s131_plan-free-motion
          :parameters (#q6 #q6)
          :precondition (and (isconf #q6) (isconf #q6))
          :effect (isfreemotion #q6 #t107 #q6)
   )
   (:action s132_plan-free-motion
          :parameters (#q6 #q7)
          :precondition (and (isconf #q6) (isconf #q7))
          :effect (isfreemotion #q6 #t108 #q7)
   )
   (:action s133_plan-free-motion
          :parameters (#q6 #q8)
          :precondition (and (isconf #q6) (isconf #q8))
          :effect (isfreemotion #q6 #t109 #q8)
   )
   (:action s134_plan-free-motion
          :parameters (#q7 q40)
          :precondition (and (isconf #q7) (isconf q40))
          :effect (isfreemotion #q7 #t110 q40)
   )
   (:action s135_plan-free-motion
          :parameters (#q7 #q0)
          :precondition (and (isconf #q7) (isconf #q0))
          :effect (isfreemotion #q7 #t111 #q0)
   )
   (:action s136_plan-free-motion
          :parameters (#q7 #q1)
          :precondition (and (isconf #q7) (isconf #q1))
          :effect (isfreemotion #q7 #t112 #q1)
   )
   (:action s137_plan-free-motion
          :parameters (#q7 #q2)
          :precondition (and (isconf #q7) (isconf #q2))
          :effect (isfreemotion #q7 #t113 #q2)
   )
   (:action s138_plan-free-motion
          :parameters (#q7 #q3)
          :precondition (and (isconf #q7) (isconf #q3))
          :effect (isfreemotion #q7 #t114 #q3)
   )
   (:action s139_plan-free-motion
          :parameters (#q7 #q4)
          :precondition (and (isconf #q7) (isconf #q4))
          :effect (isfreemotion #q7 #t115 #q4)
   )
   (:action s140_plan-free-motion
          :parameters (#q7 #q5)
          :precondition (and (isconf #q7) (isconf #q5))
          :effect (isfreemotion #q7 #t116 #q5)
   )
   (:action s141_plan-free-motion
          :parameters (#q7 #q6)
          :precondition (and (isconf #q7) (isconf #q6))
          :effect (isfreemotion #q7 #t117 #q6)
   )
   (:action s142_plan-free-motion
          :parameters (#q7 #q7)
          :precondition (and (isconf #q7) (isconf #q7))
          :effect (isfreemotion #q7 #t118 #q7)
   )
   (:action s143_plan-free-motion
          :parameters (#q7 #q8)
          :precondition (and (isconf #q7) (isconf #q8))
          :effect (isfreemotion #q7 #t119 #q8)
   )
   (:action s144_plan-free-motion
          :parameters (#q8 q40)
          :precondition (and (isconf #q8) (isconf q40))
          :effect (isfreemotion #q8 #t120 q40)
   )
   (:action s145_plan-free-motion
          :parameters (#q8 #q0)
          :precondition (and (isconf #q8) (isconf #q0))
          :effect (isfreemotion #q8 #t121 #q0)
   )
   (:action s146_plan-free-motion
          :parameters (#q8 #q1)
          :precondition (and (isconf #q8) (isconf #q1))
          :effect (isfreemotion #q8 #t122 #q1)
   )
   (:action s147_plan-free-motion
          :parameters (#q8 #q2)
          :precondition (and (isconf #q8) (isconf #q2))
          :effect (isfreemotion #q8 #t123 #q2)
   )
   (:action s148_plan-free-motion
          :parameters (#q8 #q3)
          :precondition (and (isconf #q8) (isconf #q3))
          :effect (isfreemotion #q8 #t124 #q3)
   )
   (:action s149_plan-free-motion
          :parameters (#q8 #q4)
          :precondition (and (isconf #q8) (isconf #q4))
          :effect (isfreemotion #q8 #t125 #q4)
   )
   (:action s150_plan-free-motion
          :parameters (#q8 #q5)
          :precondition (and (isconf #q8) (isconf #q5))
          :effect (isfreemotion #q8 #t126 #q5)
   )
   (:action s151_plan-free-motion
          :parameters (#q8 #q6)
          :precondition (and (isconf #q8) (isconf #q6))
          :effect (isfreemotion #q8 #t127 #q6)
   )
   (:action s152_plan-free-motion
          :parameters (#q8 #q7)
          :precondition (and (isconf #q8) (isconf #q7))
          :effect (isfreemotion #q8 #t128 #q7)
   )
   (:action s153_plan-free-motion
          :parameters (#q8 #q8)
          :precondition (and (isconf #q8) (isconf #q8))
          :effect (isfreemotion #q8 #t129 #q8)
   )
   (:action s154_plan-holding-motion
          :parameters (q40 q40 o8 #g3)
          :precondition (and (isconf q40) (isconf q40) (isgrasp o8 #g3))
          :effect (isholdingmotion q40 #t130 q40 o8 #g3)
   )
   (:action s155_plan-holding-motion
          :parameters (q40 q40 o8 #g4)
          :precondition (and (isconf q40) (isconf q40) (isgrasp o8 #g4))
          :effect (isholdingmotion q40 #t131 q40 o8 #g4)
   )
   (:action s156_plan-holding-motion
          :parameters (q40 q40 o9 #g5)
          :precondition (and (isconf q40) (isconf q40) (isgrasp o9 #g5))
          :effect (isholdingmotion q40 #t132 q40 o9 #g5)
   )
   (:action s157_plan-holding-motion
          :parameters (q40 q40 o9 #g6)
          :precondition (and (isconf q40) (isconf q40) (isgrasp o9 #g6))
          :effect (isholdingmotion q40 #t133 q40 o9 #g6)
   )
   (:action s158_plan-holding-motion
          :parameters (q40 q40 o10 #g7)
          :precondition (and (isconf q40) (isconf q40) (isgrasp o10 #g7))
          :effect (isholdingmotion q40 #t134 q40 o10 #g7)
   )
   (:action s159_plan-holding-motion
          :parameters (q40 q40 o10 #g8)
          :precondition (and (isconf q40) (isconf q40) (isgrasp o10 #g8))
          :effect (isholdingmotion q40 #t135 q40 o10 #g8)
   )
   (:action s160_plan-holding-motion
          :parameters (q40 #q0 o8 #g0)
          :precondition (and (isconf q40) (isconf #q0) (isgrasp o8 #g0))
          :effect (isholdingmotion q40 #t136 #q0 o8 #g0)
   )
   (:action s161_plan-holding-motion
          :parameters (q40 #q0 o9 #g1)
          :precondition (and (isconf q40) (isconf #q0) (isgrasp o9 #g1))
          :effect (isholdingmotion q40 #t137 #q0 o9 #g1)
   )
   (:action s162_plan-holding-motion
          :parameters (q40 #q0 o10 #g2)
          :precondition (and (isconf q40) (isconf #q0) (isgrasp o10 #g2))
          :effect (isholdingmotion q40 #t138 #q0 o10 #g2)
   )
   (:action s163_plan-holding-motion
          :parameters (q40 #q0 o8 #g3)
          :precondition (and (isconf q40) (isconf #q0) (isgrasp o8 #g3))
          :effect (isholdingmotion q40 #t139 #q0 o8 #g3)
   )
   (:action s164_plan-holding-motion
          :parameters (q40 #q0 o8 #g4)
          :precondition (and (isconf q40) (isconf #q0) (isgrasp o8 #g4))
          :effect (isholdingmotion q40 #t140 #q0 o8 #g4)
   )
   (:action s165_plan-holding-motion
          :parameters (q40 #q0 o9 #g5)
          :precondition (and (isconf q40) (isconf #q0) (isgrasp o9 #g5))
          :effect (isholdingmotion q40 #t141 #q0 o9 #g5)
   )
   (:action s166_plan-holding-motion
          :parameters (q40 #q0 o9 #g6)
          :precondition (and (isconf q40) (isconf #q0) (isgrasp o9 #g6))
          :effect (isholdingmotion q40 #t142 #q0 o9 #g6)
   )
   (:action s167_plan-holding-motion
          :parameters (q40 #q0 o10 #g7)
          :precondition (and (isconf q40) (isconf #q0) (isgrasp o10 #g7))
          :effect (isholdingmotion q40 #t143 #q0 o10 #g7)
   )
   (:action s168_plan-holding-motion
          :parameters (q40 #q0 o10 #g8)
          :precondition (and (isconf q40) (isconf #q0) (isgrasp o10 #g8))
          :effect (isholdingmotion q40 #t144 #q0 o10 #g8)
   )
   (:action s169_plan-holding-motion
          :parameters (q40 #q1 o8 #g0)
          :precondition (and (isconf q40) (isconf #q1) (isgrasp o8 #g0))
          :effect (isholdingmotion q40 #t145 #q1 o8 #g0)
   )
   (:action s170_plan-holding-motion
          :parameters (q40 #q1 o9 #g1)
          :precondition (and (isconf q40) (isconf #q1) (isgrasp o9 #g1))
          :effect (isholdingmotion q40 #t146 #q1 o9 #g1)
   )
   (:action s171_plan-holding-motion
          :parameters (q40 #q1 o10 #g2)
          :precondition (and (isconf q40) (isconf #q1) (isgrasp o10 #g2))
          :effect (isholdingmotion q40 #t147 #q1 o10 #g2)
   )
   (:action s172_plan-holding-motion
          :parameters (q40 #q1 o8 #g3)
          :precondition (and (isconf q40) (isconf #q1) (isgrasp o8 #g3))
          :effect (isholdingmotion q40 #t148 #q1 o8 #g3)
   )
   (:action s173_plan-holding-motion
          :parameters (q40 #q1 o8 #g4)
          :precondition (and (isconf q40) (isconf #q1) (isgrasp o8 #g4))
          :effect (isholdingmotion q40 #t149 #q1 o8 #g4)
   )
   (:action s174_plan-holding-motion
          :parameters (q40 #q1 o9 #g5)
          :precondition (and (isconf q40) (isconf #q1) (isgrasp o9 #g5))
          :effect (isholdingmotion q40 #t150 #q1 o9 #g5)
   )
   (:action s175_plan-holding-motion
          :parameters (q40 #q1 o9 #g6)
          :precondition (and (isconf q40) (isconf #q1) (isgrasp o9 #g6))
          :effect (isholdingmotion q40 #t151 #q1 o9 #g6)
   )
   (:action s176_plan-holding-motion
          :parameters (q40 #q1 o10 #g7)
          :precondition (and (isconf q40) (isconf #q1) (isgrasp o10 #g7))
          :effect (isholdingmotion q40 #t152 #q1 o10 #g7)
   )
   (:action s177_plan-holding-motion
          :parameters (q40 #q1 o10 #g8)
          :precondition (and (isconf q40) (isconf #q1) (isgrasp o10 #g8))
          :effect (isholdingmotion q40 #t153 #q1 o10 #g8)
   )
   (:action s178_plan-holding-motion
          :parameters (q40 #q2 o8 #g0)
          :precondition (and (isconf q40) (isconf #q2) (isgrasp o8 #g0))
          :effect (isholdingmotion q40 #t154 #q2 o8 #g0)
   )
   (:action s179_plan-holding-motion
          :parameters (q40 #q2 o9 #g1)
          :precondition (and (isconf q40) (isconf #q2) (isgrasp o9 #g1))
          :effect (isholdingmotion q40 #t155 #q2 o9 #g1)
   )
   (:action s180_plan-holding-motion
          :parameters (q40 #q2 o10 #g2)
          :precondition (and (isconf q40) (isconf #q2) (isgrasp o10 #g2))
          :effect (isholdingmotion q40 #t156 #q2 o10 #g2)
   )
   (:action s181_plan-holding-motion
          :parameters (q40 #q2 o8 #g3)
          :precondition (and (isconf q40) (isconf #q2) (isgrasp o8 #g3))
          :effect (isholdingmotion q40 #t157 #q2 o8 #g3)
   )
   (:action s182_plan-holding-motion
          :parameters (q40 #q2 o8 #g4)
          :precondition (and (isconf q40) (isconf #q2) (isgrasp o8 #g4))
          :effect (isholdingmotion q40 #t158 #q2 o8 #g4)
   )
   (:action s183_plan-holding-motion
          :parameters (q40 #q2 o9 #g5)
          :precondition (and (isconf q40) (isconf #q2) (isgrasp o9 #g5))
          :effect (isholdingmotion q40 #t159 #q2 o9 #g5)
   )
   (:action s184_plan-holding-motion
          :parameters (q40 #q2 o9 #g6)
          :precondition (and (isconf q40) (isconf #q2) (isgrasp o9 #g6))
          :effect (isholdingmotion q40 #t160 #q2 o9 #g6)
   )
   (:action s185_plan-holding-motion
          :parameters (q40 #q2 o10 #g7)
          :precondition (and (isconf q40) (isconf #q2) (isgrasp o10 #g7))
          :effect (isholdingmotion q40 #t161 #q2 o10 #g7)
   )
   (:action s186_plan-holding-motion
          :parameters (q40 #q2 o10 #g8)
          :precondition (and (isconf q40) (isconf #q2) (isgrasp o10 #g8))
          :effect (isholdingmotion q40 #t162 #q2 o10 #g8)
   )
   (:action s187_plan-holding-motion
          :parameters (q40 #q3 o8 #g0)
          :precondition (and (isconf q40) (isconf #q3) (isgrasp o8 #g0))
          :effect (isholdingmotion q40 #t163 #q3 o8 #g0)
   )
   (:action s188_plan-holding-motion
          :parameters (q40 #q3 o9 #g1)
          :precondition (and (isconf q40) (isconf #q3) (isgrasp o9 #g1))
          :effect (isholdingmotion q40 #t164 #q3 o9 #g1)
   )
   (:action s189_plan-holding-motion
          :parameters (q40 #q3 o10 #g2)
          :precondition (and (isconf q40) (isconf #q3) (isgrasp o10 #g2))
          :effect (isholdingmotion q40 #t165 #q3 o10 #g2)
   )
   (:action s190_plan-holding-motion
          :parameters (q40 #q3 o8 #g3)
          :precondition (and (isconf q40) (isconf #q3) (isgrasp o8 #g3))
          :effect (isholdingmotion q40 #t166 #q3 o8 #g3)
   )
   (:action s191_plan-holding-motion
          :parameters (q40 #q3 o8 #g4)
          :precondition (and (isconf q40) (isconf #q3) (isgrasp o8 #g4))
          :effect (isholdingmotion q40 #t167 #q3 o8 #g4)
   )
   (:action s192_plan-holding-motion
          :parameters (q40 #q3 o9 #g5)
          :precondition (and (isconf q40) (isconf #q3) (isgrasp o9 #g5))
          :effect (isholdingmotion q40 #t168 #q3 o9 #g5)
   )
   (:action s193_plan-holding-motion
          :parameters (q40 #q3 o9 #g6)
          :precondition (and (isconf q40) (isconf #q3) (isgrasp o9 #g6))
          :effect (isholdingmotion q40 #t169 #q3 o9 #g6)
   )
   (:action s194_plan-holding-motion
          :parameters (q40 #q3 o10 #g7)
          :precondition (and (isconf q40) (isconf #q3) (isgrasp o10 #g7))
          :effect (isholdingmotion q40 #t170 #q3 o10 #g7)
   )
   (:action s195_plan-holding-motion
          :parameters (q40 #q3 o10 #g8)
          :precondition (and (isconf q40) (isconf #q3) (isgrasp o10 #g8))
          :effect (isholdingmotion q40 #t171 #q3 o10 #g8)
   )
   (:action s196_plan-holding-motion
          :parameters (q40 #q4 o8 #g0)
          :precondition (and (isconf q40) (isconf #q4) (isgrasp o8 #g0))
          :effect (isholdingmotion q40 #t172 #q4 o8 #g0)
   )
   (:action s197_plan-holding-motion
          :parameters (q40 #q4 o9 #g1)
          :precondition (and (isconf q40) (isconf #q4) (isgrasp o9 #g1))
          :effect (isholdingmotion q40 #t173 #q4 o9 #g1)
   )
   (:action s198_plan-holding-motion
          :parameters (q40 #q4 o10 #g2)
          :precondition (and (isconf q40) (isconf #q4) (isgrasp o10 #g2))
          :effect (isholdingmotion q40 #t174 #q4 o10 #g2)
   )
   (:action s199_plan-holding-motion
          :parameters (q40 #q4 o8 #g3)
          :precondition (and (isconf q40) (isconf #q4) (isgrasp o8 #g3))
          :effect (isholdingmotion q40 #t175 #q4 o8 #g3)
   )
   (:action s200_plan-holding-motion
          :parameters (q40 #q4 o8 #g4)
          :precondition (and (isconf q40) (isconf #q4) (isgrasp o8 #g4))
          :effect (isholdingmotion q40 #t176 #q4 o8 #g4)
   )
   (:action s201_plan-holding-motion
          :parameters (q40 #q4 o9 #g5)
          :precondition (and (isconf q40) (isconf #q4) (isgrasp o9 #g5))
          :effect (isholdingmotion q40 #t177 #q4 o9 #g5)
   )
   (:action s202_plan-holding-motion
          :parameters (q40 #q4 o9 #g6)
          :precondition (and (isconf q40) (isconf #q4) (isgrasp o9 #g6))
          :effect (isholdingmotion q40 #t178 #q4 o9 #g6)
   )
   (:action s203_plan-holding-motion
          :parameters (q40 #q4 o10 #g7)
          :precondition (and (isconf q40) (isconf #q4) (isgrasp o10 #g7))
          :effect (isholdingmotion q40 #t179 #q4 o10 #g7)
   )
   (:action s204_plan-holding-motion
          :parameters (q40 #q4 o10 #g8)
          :precondition (and (isconf q40) (isconf #q4) (isgrasp o10 #g8))
          :effect (isholdingmotion q40 #t180 #q4 o10 #g8)
   )
   (:action s205_plan-holding-motion
          :parameters (q40 #q5 o8 #g0)
          :precondition (and (isconf q40) (isconf #q5) (isgrasp o8 #g0))
          :effect (isholdingmotion q40 #t181 #q5 o8 #g0)
   )
   (:action s206_plan-holding-motion
          :parameters (q40 #q5 o9 #g1)
          :precondition (and (isconf q40) (isconf #q5) (isgrasp o9 #g1))
          :effect (isholdingmotion q40 #t182 #q5 o9 #g1)
   )
   (:action s207_plan-holding-motion
          :parameters (q40 #q5 o10 #g2)
          :precondition (and (isconf q40) (isconf #q5) (isgrasp o10 #g2))
          :effect (isholdingmotion q40 #t183 #q5 o10 #g2)
   )
   (:action s208_plan-holding-motion
          :parameters (q40 #q5 o8 #g3)
          :precondition (and (isconf q40) (isconf #q5) (isgrasp o8 #g3))
          :effect (isholdingmotion q40 #t184 #q5 o8 #g3)
   )
   (:action s209_plan-holding-motion
          :parameters (q40 #q5 o8 #g4)
          :precondition (and (isconf q40) (isconf #q5) (isgrasp o8 #g4))
          :effect (isholdingmotion q40 #t185 #q5 o8 #g4)
   )
   (:action s210_plan-holding-motion
          :parameters (q40 #q5 o9 #g5)
          :precondition (and (isconf q40) (isconf #q5) (isgrasp o9 #g5))
          :effect (isholdingmotion q40 #t186 #q5 o9 #g5)
   )
   (:action s211_plan-holding-motion
          :parameters (q40 #q5 o9 #g6)
          :precondition (and (isconf q40) (isconf #q5) (isgrasp o9 #g6))
          :effect (isholdingmotion q40 #t187 #q5 o9 #g6)
   )
   (:action s212_plan-holding-motion
          :parameters (q40 #q5 o10 #g7)
          :precondition (and (isconf q40) (isconf #q5) (isgrasp o10 #g7))
          :effect (isholdingmotion q40 #t188 #q5 o10 #g7)
   )
   (:action s213_plan-holding-motion
          :parameters (q40 #q5 o10 #g8)
          :precondition (and (isconf q40) (isconf #q5) (isgrasp o10 #g8))
          :effect (isholdingmotion q40 #t189 #q5 o10 #g8)
   )
   (:action s214_plan-holding-motion
          :parameters (q40 #q6 o8 #g0)
          :precondition (and (isconf q40) (isconf #q6) (isgrasp o8 #g0))
          :effect (isholdingmotion q40 #t190 #q6 o8 #g0)
   )
   (:action s215_plan-holding-motion
          :parameters (q40 #q6 o9 #g1)
          :precondition (and (isconf q40) (isconf #q6) (isgrasp o9 #g1))
          :effect (isholdingmotion q40 #t191 #q6 o9 #g1)
   )
   (:action s216_plan-holding-motion
          :parameters (q40 #q6 o10 #g2)
          :precondition (and (isconf q40) (isconf #q6) (isgrasp o10 #g2))
          :effect (isholdingmotion q40 #t192 #q6 o10 #g2)
   )
   (:action s217_plan-holding-motion
          :parameters (q40 #q6 o8 #g3)
          :precondition (and (isconf q40) (isconf #q6) (isgrasp o8 #g3))
          :effect (isholdingmotion q40 #t193 #q6 o8 #g3)
   )
   (:action s218_plan-holding-motion
          :parameters (q40 #q6 o8 #g4)
          :precondition (and (isconf q40) (isconf #q6) (isgrasp o8 #g4))
          :effect (isholdingmotion q40 #t194 #q6 o8 #g4)
   )
   (:action s219_plan-holding-motion
          :parameters (q40 #q6 o9 #g5)
          :precondition (and (isconf q40) (isconf #q6) (isgrasp o9 #g5))
          :effect (isholdingmotion q40 #t195 #q6 o9 #g5)
   )
   (:action s220_plan-holding-motion
          :parameters (q40 #q6 o9 #g6)
          :precondition (and (isconf q40) (isconf #q6) (isgrasp o9 #g6))
          :effect (isholdingmotion q40 #t196 #q6 o9 #g6)
   )
   (:action s221_plan-holding-motion
          :parameters (q40 #q6 o10 #g7)
          :precondition (and (isconf q40) (isconf #q6) (isgrasp o10 #g7))
          :effect (isholdingmotion q40 #t197 #q6 o10 #g7)
   )
   (:action s222_plan-holding-motion
          :parameters (q40 #q6 o10 #g8)
          :precondition (and (isconf q40) (isconf #q6) (isgrasp o10 #g8))
          :effect (isholdingmotion q40 #t198 #q6 o10 #g8)
   )
   (:action s223_plan-holding-motion
          :parameters (q40 #q7 o8 #g0)
          :precondition (and (isconf q40) (isconf #q7) (isgrasp o8 #g0))
          :effect (isholdingmotion q40 #t199 #q7 o8 #g0)
   )
   (:action s224_plan-holding-motion
          :parameters (q40 #q7 o9 #g1)
          :precondition (and (isconf q40) (isconf #q7) (isgrasp o9 #g1))
          :effect (isholdingmotion q40 #t200 #q7 o9 #g1)
   )
   (:action s225_plan-holding-motion
          :parameters (q40 #q7 o10 #g2)
          :precondition (and (isconf q40) (isconf #q7) (isgrasp o10 #g2))
          :effect (isholdingmotion q40 #t201 #q7 o10 #g2)
   )
   (:action s226_plan-holding-motion
          :parameters (q40 #q7 o8 #g3)
          :precondition (and (isconf q40) (isconf #q7) (isgrasp o8 #g3))
          :effect (isholdingmotion q40 #t202 #q7 o8 #g3)
   )
   (:action s227_plan-holding-motion
          :parameters (q40 #q7 o8 #g4)
          :precondition (and (isconf q40) (isconf #q7) (isgrasp o8 #g4))
          :effect (isholdingmotion q40 #t203 #q7 o8 #g4)
   )
   (:action s228_plan-holding-motion
          :parameters (q40 #q7 o9 #g5)
          :precondition (and (isconf q40) (isconf #q7) (isgrasp o9 #g5))
          :effect (isholdingmotion q40 #t204 #q7 o9 #g5)
   )
   (:action s229_plan-holding-motion
          :parameters (q40 #q7 o9 #g6)
          :precondition (and (isconf q40) (isconf #q7) (isgrasp o9 #g6))
          :effect (isholdingmotion q40 #t205 #q7 o9 #g6)
   )
   (:action s230_plan-holding-motion
          :parameters (q40 #q7 o10 #g7)
          :precondition (and (isconf q40) (isconf #q7) (isgrasp o10 #g7))
          :effect (isholdingmotion q40 #t206 #q7 o10 #g7)
   )
   (:action s231_plan-holding-motion
          :parameters (q40 #q7 o10 #g8)
          :precondition (and (isconf q40) (isconf #q7) (isgrasp o10 #g8))
          :effect (isholdingmotion q40 #t207 #q7 o10 #g8)
   )
   (:action s232_plan-holding-motion
          :parameters (q40 #q8 o8 #g0)
          :precondition (and (isconf q40) (isconf #q8) (isgrasp o8 #g0))
          :effect (isholdingmotion q40 #t208 #q8 o8 #g0)
   )
   (:action s233_plan-holding-motion
          :parameters (q40 #q8 o9 #g1)
          :precondition (and (isconf q40) (isconf #q8) (isgrasp o9 #g1))
          :effect (isholdingmotion q40 #t209 #q8 o9 #g1)
   )
   (:action s234_plan-holding-motion
          :parameters (q40 #q8 o10 #g2)
          :precondition (and (isconf q40) (isconf #q8) (isgrasp o10 #g2))
          :effect (isholdingmotion q40 #t210 #q8 o10 #g2)
   )
   (:action s235_plan-holding-motion
          :parameters (q40 #q8 o8 #g3)
          :precondition (and (isconf q40) (isconf #q8) (isgrasp o8 #g3))
          :effect (isholdingmotion q40 #t211 #q8 o8 #g3)
   )
   (:action s236_plan-holding-motion
          :parameters (q40 #q8 o8 #g4)
          :precondition (and (isconf q40) (isconf #q8) (isgrasp o8 #g4))
          :effect (isholdingmotion q40 #t212 #q8 o8 #g4)
   )
   (:action s237_plan-holding-motion
          :parameters (q40 #q8 o9 #g5)
          :precondition (and (isconf q40) (isconf #q8) (isgrasp o9 #g5))
          :effect (isholdingmotion q40 #t213 #q8 o9 #g5)
   )
   (:action s238_plan-holding-motion
          :parameters (q40 #q8 o9 #g6)
          :precondition (and (isconf q40) (isconf #q8) (isgrasp o9 #g6))
          :effect (isholdingmotion q40 #t214 #q8 o9 #g6)
   )
   (:action s239_plan-holding-motion
          :parameters (q40 #q8 o10 #g7)
          :precondition (and (isconf q40) (isconf #q8) (isgrasp o10 #g7))
          :effect (isholdingmotion q40 #t215 #q8 o10 #g7)
   )
   (:action s240_plan-holding-motion
          :parameters (q40 #q8 o10 #g8)
          :precondition (and (isconf q40) (isconf #q8) (isgrasp o10 #g8))
          :effect (isholdingmotion q40 #t216 #q8 o10 #g8)
   )
   (:action s241_plan-holding-motion
          :parameters (#q0 q40 o8 #g0)
          :precondition (and (isconf #q0) (isconf q40) (isgrasp o8 #g0))
          :effect (isholdingmotion #q0 #t217 q40 o8 #g0)
   )
   (:action s242_plan-holding-motion
          :parameters (#q0 q40 o9 #g1)
          :precondition (and (isconf #q0) (isconf q40) (isgrasp o9 #g1))
          :effect (isholdingmotion #q0 #t218 q40 o9 #g1)
   )
   (:action s243_plan-holding-motion
          :parameters (#q0 q40 o10 #g2)
          :precondition (and (isconf #q0) (isconf q40) (isgrasp o10 #g2))
          :effect (isholdingmotion #q0 #t219 q40 o10 #g2)
   )
   (:action s244_plan-holding-motion
          :parameters (#q0 q40 o8 #g3)
          :precondition (and (isconf #q0) (isconf q40) (isgrasp o8 #g3))
          :effect (isholdingmotion #q0 #t220 q40 o8 #g3)
   )
   (:action s245_plan-holding-motion
          :parameters (#q0 q40 o8 #g4)
          :precondition (and (isconf #q0) (isconf q40) (isgrasp o8 #g4))
          :effect (isholdingmotion #q0 #t221 q40 o8 #g4)
   )
   (:action s246_plan-holding-motion
          :parameters (#q0 q40 o9 #g5)
          :precondition (and (isconf #q0) (isconf q40) (isgrasp o9 #g5))
          :effect (isholdingmotion #q0 #t222 q40 o9 #g5)
   )
   (:action s247_plan-holding-motion
          :parameters (#q0 q40 o9 #g6)
          :precondition (and (isconf #q0) (isconf q40) (isgrasp o9 #g6))
          :effect (isholdingmotion #q0 #t223 q40 o9 #g6)
   )
   (:action s248_plan-holding-motion
          :parameters (#q0 q40 o10 #g7)
          :precondition (and (isconf #q0) (isconf q40) (isgrasp o10 #g7))
          :effect (isholdingmotion #q0 #t224 q40 o10 #g7)
   )
   (:action s249_plan-holding-motion
          :parameters (#q0 q40 o10 #g8)
          :precondition (and (isconf #q0) (isconf q40) (isgrasp o10 #g8))
          :effect (isholdingmotion #q0 #t225 q40 o10 #g8)
   )
   (:action s250_plan-holding-motion
          :parameters (#q0 #q0 o8 #g0)
          :precondition (and (isconf #q0) (isconf #q0) (isgrasp o8 #g0))
          :effect (isholdingmotion #q0 #t226 #q0 o8 #g0)
   )
   (:action s251_plan-holding-motion
          :parameters (#q0 #q0 o9 #g1)
          :precondition (and (isconf #q0) (isconf #q0) (isgrasp o9 #g1))
          :effect (isholdingmotion #q0 #t227 #q0 o9 #g1)
   )
   (:action s252_plan-holding-motion
          :parameters (#q0 #q0 o10 #g2)
          :precondition (and (isconf #q0) (isconf #q0) (isgrasp o10 #g2))
          :effect (isholdingmotion #q0 #t228 #q0 o10 #g2)
   )
   (:action s253_plan-holding-motion
          :parameters (#q0 #q0 o8 #g3)
          :precondition (and (isconf #q0) (isconf #q0) (isgrasp o8 #g3))
          :effect (isholdingmotion #q0 #t229 #q0 o8 #g3)
   )
   (:action s254_plan-holding-motion
          :parameters (#q0 #q0 o8 #g4)
          :precondition (and (isconf #q0) (isconf #q0) (isgrasp o8 #g4))
          :effect (isholdingmotion #q0 #t230 #q0 o8 #g4)
   )
   (:action s255_plan-holding-motion
          :parameters (#q0 #q0 o9 #g5)
          :precondition (and (isconf #q0) (isconf #q0) (isgrasp o9 #g5))
          :effect (isholdingmotion #q0 #t231 #q0 o9 #g5)
   )
   (:action s256_plan-holding-motion
          :parameters (#q0 #q0 o9 #g6)
          :precondition (and (isconf #q0) (isconf #q0) (isgrasp o9 #g6))
          :effect (isholdingmotion #q0 #t232 #q0 o9 #g6)
   )
   (:action s257_plan-holding-motion
          :parameters (#q0 #q0 o10 #g7)
          :precondition (and (isconf #q0) (isconf #q0) (isgrasp o10 #g7))
          :effect (isholdingmotion #q0 #t233 #q0 o10 #g7)
   )
   (:action s258_plan-holding-motion
          :parameters (#q0 #q0 o10 #g8)
          :precondition (and (isconf #q0) (isconf #q0) (isgrasp o10 #g8))
          :effect (isholdingmotion #q0 #t234 #q0 o10 #g8)
   )
   (:action s259_plan-holding-motion
          :parameters (#q0 #q1 o8 #g0)
          :precondition (and (isconf #q0) (isconf #q1) (isgrasp o8 #g0))
          :effect (isholdingmotion #q0 #t235 #q1 o8 #g0)
   )
   (:action s260_plan-holding-motion
          :parameters (#q0 #q1 o9 #g1)
          :precondition (and (isconf #q0) (isconf #q1) (isgrasp o9 #g1))
          :effect (isholdingmotion #q0 #t236 #q1 o9 #g1)
   )
   (:action s261_plan-holding-motion
          :parameters (#q0 #q1 o10 #g2)
          :precondition (and (isconf #q0) (isconf #q1) (isgrasp o10 #g2))
          :effect (isholdingmotion #q0 #t237 #q1 o10 #g2)
   )
   (:action s262_plan-holding-motion
          :parameters (#q0 #q1 o8 #g3)
          :precondition (and (isconf #q0) (isconf #q1) (isgrasp o8 #g3))
          :effect (isholdingmotion #q0 #t238 #q1 o8 #g3)
   )
   (:action s263_plan-holding-motion
          :parameters (#q0 #q1 o8 #g4)
          :precondition (and (isconf #q0) (isconf #q1) (isgrasp o8 #g4))
          :effect (isholdingmotion #q0 #t239 #q1 o8 #g4)
   )
   (:action s264_plan-holding-motion
          :parameters (#q0 #q1 o9 #g5)
          :precondition (and (isconf #q0) (isconf #q1) (isgrasp o9 #g5))
          :effect (isholdingmotion #q0 #t240 #q1 o9 #g5)
   )
   (:action s265_plan-holding-motion
          :parameters (#q0 #q1 o9 #g6)
          :precondition (and (isconf #q0) (isconf #q1) (isgrasp o9 #g6))
          :effect (isholdingmotion #q0 #t241 #q1 o9 #g6)
   )
   (:action s266_plan-holding-motion
          :parameters (#q0 #q1 o10 #g7)
          :precondition (and (isconf #q0) (isconf #q1) (isgrasp o10 #g7))
          :effect (isholdingmotion #q0 #t242 #q1 o10 #g7)
   )
   (:action s267_plan-holding-motion
          :parameters (#q0 #q1 o10 #g8)
          :precondition (and (isconf #q0) (isconf #q1) (isgrasp o10 #g8))
          :effect (isholdingmotion #q0 #t243 #q1 o10 #g8)
   )
   (:action s268_plan-holding-motion
          :parameters (#q0 #q2 o8 #g0)
          :precondition (and (isconf #q0) (isconf #q2) (isgrasp o8 #g0))
          :effect (isholdingmotion #q0 #t244 #q2 o8 #g0)
   )
   (:action s269_plan-holding-motion
          :parameters (#q0 #q2 o9 #g1)
          :precondition (and (isconf #q0) (isconf #q2) (isgrasp o9 #g1))
          :effect (isholdingmotion #q0 #t245 #q2 o9 #g1)
   )
   (:action s270_plan-holding-motion
          :parameters (#q0 #q2 o10 #g2)
          :precondition (and (isconf #q0) (isconf #q2) (isgrasp o10 #g2))
          :effect (isholdingmotion #q0 #t246 #q2 o10 #g2)
   )
   (:action s271_plan-holding-motion
          :parameters (#q0 #q2 o8 #g3)
          :precondition (and (isconf #q0) (isconf #q2) (isgrasp o8 #g3))
          :effect (isholdingmotion #q0 #t247 #q2 o8 #g3)
   )
   (:action s272_plan-holding-motion
          :parameters (#q0 #q2 o8 #g4)
          :precondition (and (isconf #q0) (isconf #q2) (isgrasp o8 #g4))
          :effect (isholdingmotion #q0 #t248 #q2 o8 #g4)
   )
   (:action s273_plan-holding-motion
          :parameters (#q0 #q2 o9 #g5)
          :precondition (and (isconf #q0) (isconf #q2) (isgrasp o9 #g5))
          :effect (isholdingmotion #q0 #t249 #q2 o9 #g5)
   )
   (:action s274_plan-holding-motion
          :parameters (#q0 #q2 o9 #g6)
          :precondition (and (isconf #q0) (isconf #q2) (isgrasp o9 #g6))
          :effect (isholdingmotion #q0 #t250 #q2 o9 #g6)
   )
   (:action s275_plan-holding-motion
          :parameters (#q0 #q2 o10 #g7)
          :precondition (and (isconf #q0) (isconf #q2) (isgrasp o10 #g7))
          :effect (isholdingmotion #q0 #t251 #q2 o10 #g7)
   )
   (:action s276_plan-holding-motion
          :parameters (#q0 #q2 o10 #g8)
          :precondition (and (isconf #q0) (isconf #q2) (isgrasp o10 #g8))
          :effect (isholdingmotion #q0 #t252 #q2 o10 #g8)
   )
   (:action s277_plan-holding-motion
          :parameters (#q0 #q3 o8 #g0)
          :precondition (and (isconf #q0) (isconf #q3) (isgrasp o8 #g0))
          :effect (isholdingmotion #q0 #t253 #q3 o8 #g0)
   )
   (:action s278_plan-holding-motion
          :parameters (#q0 #q3 o9 #g1)
          :precondition (and (isconf #q0) (isconf #q3) (isgrasp o9 #g1))
          :effect (isholdingmotion #q0 #t254 #q3 o9 #g1)
   )
   (:action s279_plan-holding-motion
          :parameters (#q0 #q3 o10 #g2)
          :precondition (and (isconf #q0) (isconf #q3) (isgrasp o10 #g2))
          :effect (isholdingmotion #q0 #t255 #q3 o10 #g2)
   )
   (:action s280_plan-holding-motion
          :parameters (#q0 #q3 o8 #g3)
          :precondition (and (isconf #q0) (isconf #q3) (isgrasp o8 #g3))
          :effect (isholdingmotion #q0 #t256 #q3 o8 #g3)
   )
   (:action s281_plan-holding-motion
          :parameters (#q0 #q3 o8 #g4)
          :precondition (and (isconf #q0) (isconf #q3) (isgrasp o8 #g4))
          :effect (isholdingmotion #q0 #t257 #q3 o8 #g4)
   )
   (:action s282_plan-holding-motion
          :parameters (#q0 #q3 o9 #g5)
          :precondition (and (isconf #q0) (isconf #q3) (isgrasp o9 #g5))
          :effect (isholdingmotion #q0 #t258 #q3 o9 #g5)
   )
   (:action s283_plan-holding-motion
          :parameters (#q0 #q3 o9 #g6)
          :precondition (and (isconf #q0) (isconf #q3) (isgrasp o9 #g6))
          :effect (isholdingmotion #q0 #t259 #q3 o9 #g6)
   )
   (:action s284_plan-holding-motion
          :parameters (#q0 #q3 o10 #g7)
          :precondition (and (isconf #q0) (isconf #q3) (isgrasp o10 #g7))
          :effect (isholdingmotion #q0 #t260 #q3 o10 #g7)
   )
   (:action s285_plan-holding-motion
          :parameters (#q0 #q3 o10 #g8)
          :precondition (and (isconf #q0) (isconf #q3) (isgrasp o10 #g8))
          :effect (isholdingmotion #q0 #t261 #q3 o10 #g8)
   )
   (:action s286_plan-holding-motion
          :parameters (#q0 #q4 o8 #g0)
          :precondition (and (isconf #q0) (isconf #q4) (isgrasp o8 #g0))
          :effect (isholdingmotion #q0 #t262 #q4 o8 #g0)
   )
   (:action s287_plan-holding-motion
          :parameters (#q0 #q4 o9 #g1)
          :precondition (and (isconf #q0) (isconf #q4) (isgrasp o9 #g1))
          :effect (isholdingmotion #q0 #t263 #q4 o9 #g1)
   )
   (:action s288_plan-holding-motion
          :parameters (#q0 #q4 o10 #g2)
          :precondition (and (isconf #q0) (isconf #q4) (isgrasp o10 #g2))
          :effect (isholdingmotion #q0 #t264 #q4 o10 #g2)
   )
   (:action s289_plan-holding-motion
          :parameters (#q0 #q4 o8 #g3)
          :precondition (and (isconf #q0) (isconf #q4) (isgrasp o8 #g3))
          :effect (isholdingmotion #q0 #t265 #q4 o8 #g3)
   )
   (:action s290_plan-holding-motion
          :parameters (#q0 #q4 o8 #g4)
          :precondition (and (isconf #q0) (isconf #q4) (isgrasp o8 #g4))
          :effect (isholdingmotion #q0 #t266 #q4 o8 #g4)
   )
   (:action s291_plan-holding-motion
          :parameters (#q0 #q4 o9 #g5)
          :precondition (and (isconf #q0) (isconf #q4) (isgrasp o9 #g5))
          :effect (isholdingmotion #q0 #t267 #q4 o9 #g5)
   )
   (:action s292_plan-holding-motion
          :parameters (#q0 #q4 o9 #g6)
          :precondition (and (isconf #q0) (isconf #q4) (isgrasp o9 #g6))
          :effect (isholdingmotion #q0 #t268 #q4 o9 #g6)
   )
   (:action s293_plan-holding-motion
          :parameters (#q0 #q4 o10 #g7)
          :precondition (and (isconf #q0) (isconf #q4) (isgrasp o10 #g7))
          :effect (isholdingmotion #q0 #t269 #q4 o10 #g7)
   )
   (:action s294_plan-holding-motion
          :parameters (#q0 #q4 o10 #g8)
          :precondition (and (isconf #q0) (isconf #q4) (isgrasp o10 #g8))
          :effect (isholdingmotion #q0 #t270 #q4 o10 #g8)
   )
   (:action s295_plan-holding-motion
          :parameters (#q0 #q5 o8 #g0)
          :precondition (and (isconf #q0) (isconf #q5) (isgrasp o8 #g0))
          :effect (isholdingmotion #q0 #t271 #q5 o8 #g0)
   )
   (:action s296_plan-holding-motion
          :parameters (#q0 #q5 o9 #g1)
          :precondition (and (isconf #q0) (isconf #q5) (isgrasp o9 #g1))
          :effect (isholdingmotion #q0 #t272 #q5 o9 #g1)
   )
   (:action s297_plan-holding-motion
          :parameters (#q0 #q5 o10 #g2)
          :precondition (and (isconf #q0) (isconf #q5) (isgrasp o10 #g2))
          :effect (isholdingmotion #q0 #t273 #q5 o10 #g2)
   )
   (:action s298_plan-holding-motion
          :parameters (#q0 #q5 o8 #g3)
          :precondition (and (isconf #q0) (isconf #q5) (isgrasp o8 #g3))
          :effect (isholdingmotion #q0 #t274 #q5 o8 #g3)
   )
   (:action s299_plan-holding-motion
          :parameters (#q0 #q5 o8 #g4)
          :precondition (and (isconf #q0) (isconf #q5) (isgrasp o8 #g4))
          :effect (isholdingmotion #q0 #t275 #q5 o8 #g4)
   )
   (:action s300_plan-holding-motion
          :parameters (#q0 #q5 o9 #g5)
          :precondition (and (isconf #q0) (isconf #q5) (isgrasp o9 #g5))
          :effect (isholdingmotion #q0 #t276 #q5 o9 #g5)
   )
   (:action s301_plan-holding-motion
          :parameters (#q0 #q5 o9 #g6)
          :precondition (and (isconf #q0) (isconf #q5) (isgrasp o9 #g6))
          :effect (isholdingmotion #q0 #t277 #q5 o9 #g6)
   )
   (:action s302_plan-holding-motion
          :parameters (#q0 #q5 o10 #g7)
          :precondition (and (isconf #q0) (isconf #q5) (isgrasp o10 #g7))
          :effect (isholdingmotion #q0 #t278 #q5 o10 #g7)
   )
   (:action s303_plan-holding-motion
          :parameters (#q0 #q5 o10 #g8)
          :precondition (and (isconf #q0) (isconf #q5) (isgrasp o10 #g8))
          :effect (isholdingmotion #q0 #t279 #q5 o10 #g8)
   )
   (:action s304_plan-holding-motion
          :parameters (#q0 #q6 o8 #g0)
          :precondition (and (isconf #q0) (isconf #q6) (isgrasp o8 #g0))
          :effect (isholdingmotion #q0 #t280 #q6 o8 #g0)
   )
   (:action s305_plan-holding-motion
          :parameters (#q0 #q6 o9 #g1)
          :precondition (and (isconf #q0) (isconf #q6) (isgrasp o9 #g1))
          :effect (isholdingmotion #q0 #t281 #q6 o9 #g1)
   )
   (:action s306_plan-holding-motion
          :parameters (#q0 #q6 o10 #g2)
          :precondition (and (isconf #q0) (isconf #q6) (isgrasp o10 #g2))
          :effect (isholdingmotion #q0 #t282 #q6 o10 #g2)
   )
   (:action s307_plan-holding-motion
          :parameters (#q0 #q6 o8 #g3)
          :precondition (and (isconf #q0) (isconf #q6) (isgrasp o8 #g3))
          :effect (isholdingmotion #q0 #t283 #q6 o8 #g3)
   )
   (:action s308_plan-holding-motion
          :parameters (#q0 #q6 o8 #g4)
          :precondition (and (isconf #q0) (isconf #q6) (isgrasp o8 #g4))
          :effect (isholdingmotion #q0 #t284 #q6 o8 #g4)
   )
   (:action s309_plan-holding-motion
          :parameters (#q0 #q6 o9 #g5)
          :precondition (and (isconf #q0) (isconf #q6) (isgrasp o9 #g5))
          :effect (isholdingmotion #q0 #t285 #q6 o9 #g5)
   )
   (:action s310_plan-holding-motion
          :parameters (#q0 #q6 o9 #g6)
          :precondition (and (isconf #q0) (isconf #q6) (isgrasp o9 #g6))
          :effect (isholdingmotion #q0 #t286 #q6 o9 #g6)
   )
   (:action s311_plan-holding-motion
          :parameters (#q0 #q6 o10 #g7)
          :precondition (and (isconf #q0) (isconf #q6) (isgrasp o10 #g7))
          :effect (isholdingmotion #q0 #t287 #q6 o10 #g7)
   )
   (:action s312_plan-holding-motion
          :parameters (#q0 #q6 o10 #g8)
          :precondition (and (isconf #q0) (isconf #q6) (isgrasp o10 #g8))
          :effect (isholdingmotion #q0 #t288 #q6 o10 #g8)
   )
   (:action s313_plan-holding-motion
          :parameters (#q0 #q7 o8 #g0)
          :precondition (and (isconf #q0) (isconf #q7) (isgrasp o8 #g0))
          :effect (isholdingmotion #q0 #t289 #q7 o8 #g0)
   )
   (:action s314_plan-holding-motion
          :parameters (#q0 #q7 o9 #g1)
          :precondition (and (isconf #q0) (isconf #q7) (isgrasp o9 #g1))
          :effect (isholdingmotion #q0 #t290 #q7 o9 #g1)
   )
   (:action s315_plan-holding-motion
          :parameters (#q0 #q7 o10 #g2)
          :precondition (and (isconf #q0) (isconf #q7) (isgrasp o10 #g2))
          :effect (isholdingmotion #q0 #t291 #q7 o10 #g2)
   )
   (:action s316_plan-holding-motion
          :parameters (#q0 #q7 o8 #g3)
          :precondition (and (isconf #q0) (isconf #q7) (isgrasp o8 #g3))
          :effect (isholdingmotion #q0 #t292 #q7 o8 #g3)
   )
   (:action s317_plan-holding-motion
          :parameters (#q0 #q7 o8 #g4)
          :precondition (and (isconf #q0) (isconf #q7) (isgrasp o8 #g4))
          :effect (isholdingmotion #q0 #t293 #q7 o8 #g4)
   )
   (:action s318_plan-holding-motion
          :parameters (#q0 #q7 o9 #g5)
          :precondition (and (isconf #q0) (isconf #q7) (isgrasp o9 #g5))
          :effect (isholdingmotion #q0 #t294 #q7 o9 #g5)
   )
   (:action s319_plan-holding-motion
          :parameters (#q0 #q7 o9 #g6)
          :precondition (and (isconf #q0) (isconf #q7) (isgrasp o9 #g6))
          :effect (isholdingmotion #q0 #t295 #q7 o9 #g6)
   )
   (:action s320_plan-holding-motion
          :parameters (#q0 #q7 o10 #g7)
          :precondition (and (isconf #q0) (isconf #q7) (isgrasp o10 #g7))
          :effect (isholdingmotion #q0 #t296 #q7 o10 #g7)
   )
   (:action s321_plan-holding-motion
          :parameters (#q0 #q7 o10 #g8)
          :precondition (and (isconf #q0) (isconf #q7) (isgrasp o10 #g8))
          :effect (isholdingmotion #q0 #t297 #q7 o10 #g8)
   )
   (:action s322_plan-holding-motion
          :parameters (#q0 #q8 o8 #g0)
          :precondition (and (isconf #q0) (isconf #q8) (isgrasp o8 #g0))
          :effect (isholdingmotion #q0 #t298 #q8 o8 #g0)
   )
   (:action s323_plan-holding-motion
          :parameters (#q0 #q8 o9 #g1)
          :precondition (and (isconf #q0) (isconf #q8) (isgrasp o9 #g1))
          :effect (isholdingmotion #q0 #t299 #q8 o9 #g1)
   )
   (:action s324_plan-holding-motion
          :parameters (#q0 #q8 o10 #g2)
          :precondition (and (isconf #q0) (isconf #q8) (isgrasp o10 #g2))
          :effect (isholdingmotion #q0 #t300 #q8 o10 #g2)
   )
   (:action s325_plan-holding-motion
          :parameters (#q0 #q8 o8 #g3)
          :precondition (and (isconf #q0) (isconf #q8) (isgrasp o8 #g3))
          :effect (isholdingmotion #q0 #t301 #q8 o8 #g3)
   )
   (:action s326_plan-holding-motion
          :parameters (#q0 #q8 o8 #g4)
          :precondition (and (isconf #q0) (isconf #q8) (isgrasp o8 #g4))
          :effect (isholdingmotion #q0 #t302 #q8 o8 #g4)
   )
   (:action s327_plan-holding-motion
          :parameters (#q0 #q8 o9 #g5)
          :precondition (and (isconf #q0) (isconf #q8) (isgrasp o9 #g5))
          :effect (isholdingmotion #q0 #t303 #q8 o9 #g5)
   )
   (:action s328_plan-holding-motion
          :parameters (#q0 #q8 o9 #g6)
          :precondition (and (isconf #q0) (isconf #q8) (isgrasp o9 #g6))
          :effect (isholdingmotion #q0 #t304 #q8 o9 #g6)
   )
   (:action s329_plan-holding-motion
          :parameters (#q0 #q8 o10 #g7)
          :precondition (and (isconf #q0) (isconf #q8) (isgrasp o10 #g7))
          :effect (isholdingmotion #q0 #t305 #q8 o10 #g7)
   )
   (:action s330_plan-holding-motion
          :parameters (#q0 #q8 o10 #g8)
          :precondition (and (isconf #q0) (isconf #q8) (isgrasp o10 #g8))
          :effect (isholdingmotion #q0 #t306 #q8 o10 #g8)
   )
   (:action s331_plan-holding-motion
          :parameters (#q1 q40 o8 #g0)
          :precondition (and (isconf #q1) (isconf q40) (isgrasp o8 #g0))
          :effect (isholdingmotion #q1 #t307 q40 o8 #g0)
   )
   (:action s332_plan-holding-motion
          :parameters (#q1 q40 o9 #g1)
          :precondition (and (isconf #q1) (isconf q40) (isgrasp o9 #g1))
          :effect (isholdingmotion #q1 #t308 q40 o9 #g1)
   )
   (:action s333_plan-holding-motion
          :parameters (#q1 q40 o10 #g2)
          :precondition (and (isconf #q1) (isconf q40) (isgrasp o10 #g2))
          :effect (isholdingmotion #q1 #t309 q40 o10 #g2)
   )
   (:action s334_plan-holding-motion
          :parameters (#q1 q40 o8 #g3)
          :precondition (and (isconf #q1) (isconf q40) (isgrasp o8 #g3))
          :effect (isholdingmotion #q1 #t310 q40 o8 #g3)
   )
   (:action s335_plan-holding-motion
          :parameters (#q1 q40 o8 #g4)
          :precondition (and (isconf #q1) (isconf q40) (isgrasp o8 #g4))
          :effect (isholdingmotion #q1 #t311 q40 o8 #g4)
   )
   (:action s336_plan-holding-motion
          :parameters (#q1 q40 o9 #g5)
          :precondition (and (isconf #q1) (isconf q40) (isgrasp o9 #g5))
          :effect (isholdingmotion #q1 #t312 q40 o9 #g5)
   )
   (:action s337_plan-holding-motion
          :parameters (#q1 q40 o9 #g6)
          :precondition (and (isconf #q1) (isconf q40) (isgrasp o9 #g6))
          :effect (isholdingmotion #q1 #t313 q40 o9 #g6)
   )
   (:action s338_plan-holding-motion
          :parameters (#q1 q40 o10 #g7)
          :precondition (and (isconf #q1) (isconf q40) (isgrasp o10 #g7))
          :effect (isholdingmotion #q1 #t314 q40 o10 #g7)
   )
   (:action s339_plan-holding-motion
          :parameters (#q1 q40 o10 #g8)
          :precondition (and (isconf #q1) (isconf q40) (isgrasp o10 #g8))
          :effect (isholdingmotion #q1 #t315 q40 o10 #g8)
   )
   (:action s340_plan-holding-motion
          :parameters (#q1 #q0 o8 #g0)
          :precondition (and (isconf #q1) (isconf #q0) (isgrasp o8 #g0))
          :effect (isholdingmotion #q1 #t316 #q0 o8 #g0)
   )
   (:action s341_plan-holding-motion
          :parameters (#q1 #q0 o9 #g1)
          :precondition (and (isconf #q1) (isconf #q0) (isgrasp o9 #g1))
          :effect (isholdingmotion #q1 #t317 #q0 o9 #g1)
   )
   (:action s342_plan-holding-motion
          :parameters (#q1 #q0 o10 #g2)
          :precondition (and (isconf #q1) (isconf #q0) (isgrasp o10 #g2))
          :effect (isholdingmotion #q1 #t318 #q0 o10 #g2)
   )
   (:action s343_plan-holding-motion
          :parameters (#q1 #q0 o8 #g3)
          :precondition (and (isconf #q1) (isconf #q0) (isgrasp o8 #g3))
          :effect (isholdingmotion #q1 #t319 #q0 o8 #g3)
   )
   (:action s344_plan-holding-motion
          :parameters (#q1 #q0 o8 #g4)
          :precondition (and (isconf #q1) (isconf #q0) (isgrasp o8 #g4))
          :effect (isholdingmotion #q1 #t320 #q0 o8 #g4)
   )
   (:action s345_plan-holding-motion
          :parameters (#q1 #q0 o9 #g5)
          :precondition (and (isconf #q1) (isconf #q0) (isgrasp o9 #g5))
          :effect (isholdingmotion #q1 #t321 #q0 o9 #g5)
   )
   (:action s346_plan-holding-motion
          :parameters (#q1 #q0 o9 #g6)
          :precondition (and (isconf #q1) (isconf #q0) (isgrasp o9 #g6))
          :effect (isholdingmotion #q1 #t322 #q0 o9 #g6)
   )
   (:action s347_plan-holding-motion
          :parameters (#q1 #q0 o10 #g7)
          :precondition (and (isconf #q1) (isconf #q0) (isgrasp o10 #g7))
          :effect (isholdingmotion #q1 #t323 #q0 o10 #g7)
   )
   (:action s348_plan-holding-motion
          :parameters (#q1 #q0 o10 #g8)
          :precondition (and (isconf #q1) (isconf #q0) (isgrasp o10 #g8))
          :effect (isholdingmotion #q1 #t324 #q0 o10 #g8)
   )
   (:action s349_plan-holding-motion
          :parameters (#q1 #q1 o8 #g0)
          :precondition (and (isconf #q1) (isconf #q1) (isgrasp o8 #g0))
          :effect (isholdingmotion #q1 #t325 #q1 o8 #g0)
   )
   (:action s350_plan-holding-motion
          :parameters (#q1 #q1 o9 #g1)
          :precondition (and (isconf #q1) (isconf #q1) (isgrasp o9 #g1))
          :effect (isholdingmotion #q1 #t326 #q1 o9 #g1)
   )
   (:action s351_plan-holding-motion
          :parameters (#q1 #q1 o10 #g2)
          :precondition (and (isconf #q1) (isconf #q1) (isgrasp o10 #g2))
          :effect (isholdingmotion #q1 #t327 #q1 o10 #g2)
   )
   (:action s352_plan-holding-motion
          :parameters (#q1 #q1 o8 #g3)
          :precondition (and (isconf #q1) (isconf #q1) (isgrasp o8 #g3))
          :effect (isholdingmotion #q1 #t328 #q1 o8 #g3)
   )
   (:action s353_plan-holding-motion
          :parameters (#q1 #q1 o8 #g4)
          :precondition (and (isconf #q1) (isconf #q1) (isgrasp o8 #g4))
          :effect (isholdingmotion #q1 #t329 #q1 o8 #g4)
   )
   (:action s354_plan-holding-motion
          :parameters (#q1 #q1 o9 #g5)
          :precondition (and (isconf #q1) (isconf #q1) (isgrasp o9 #g5))
          :effect (isholdingmotion #q1 #t330 #q1 o9 #g5)
   )
   (:action s355_plan-holding-motion
          :parameters (#q1 #q1 o9 #g6)
          :precondition (and (isconf #q1) (isconf #q1) (isgrasp o9 #g6))
          :effect (isholdingmotion #q1 #t331 #q1 o9 #g6)
   )
   (:action s356_plan-holding-motion
          :parameters (#q1 #q1 o10 #g7)
          :precondition (and (isconf #q1) (isconf #q1) (isgrasp o10 #g7))
          :effect (isholdingmotion #q1 #t332 #q1 o10 #g7)
   )
   (:action s357_plan-holding-motion
          :parameters (#q1 #q1 o10 #g8)
          :precondition (and (isconf #q1) (isconf #q1) (isgrasp o10 #g8))
          :effect (isholdingmotion #q1 #t333 #q1 o10 #g8)
   )
   (:action s358_plan-holding-motion
          :parameters (#q1 #q2 o8 #g0)
          :precondition (and (isconf #q1) (isconf #q2) (isgrasp o8 #g0))
          :effect (isholdingmotion #q1 #t334 #q2 o8 #g0)
   )
   (:action s359_plan-holding-motion
          :parameters (#q1 #q2 o9 #g1)
          :precondition (and (isconf #q1) (isconf #q2) (isgrasp o9 #g1))
          :effect (isholdingmotion #q1 #t335 #q2 o9 #g1)
   )
   (:action s360_plan-holding-motion
          :parameters (#q1 #q2 o10 #g2)
          :precondition (and (isconf #q1) (isconf #q2) (isgrasp o10 #g2))
          :effect (isholdingmotion #q1 #t336 #q2 o10 #g2)
   )
   (:action s361_plan-holding-motion
          :parameters (#q1 #q2 o8 #g3)
          :precondition (and (isconf #q1) (isconf #q2) (isgrasp o8 #g3))
          :effect (isholdingmotion #q1 #t337 #q2 o8 #g3)
   )
   (:action s362_plan-holding-motion
          :parameters (#q1 #q2 o8 #g4)
          :precondition (and (isconf #q1) (isconf #q2) (isgrasp o8 #g4))
          :effect (isholdingmotion #q1 #t338 #q2 o8 #g4)
   )
   (:action s363_plan-holding-motion
          :parameters (#q1 #q2 o9 #g5)
          :precondition (and (isconf #q1) (isconf #q2) (isgrasp o9 #g5))
          :effect (isholdingmotion #q1 #t339 #q2 o9 #g5)
   )
   (:action s364_plan-holding-motion
          :parameters (#q1 #q2 o9 #g6)
          :precondition (and (isconf #q1) (isconf #q2) (isgrasp o9 #g6))
          :effect (isholdingmotion #q1 #t340 #q2 o9 #g6)
   )
   (:action s365_plan-holding-motion
          :parameters (#q1 #q2 o10 #g7)
          :precondition (and (isconf #q1) (isconf #q2) (isgrasp o10 #g7))
          :effect (isholdingmotion #q1 #t341 #q2 o10 #g7)
   )
   (:action s366_plan-holding-motion
          :parameters (#q1 #q2 o10 #g8)
          :precondition (and (isconf #q1) (isconf #q2) (isgrasp o10 #g8))
          :effect (isholdingmotion #q1 #t342 #q2 o10 #g8)
   )
   (:action s367_plan-holding-motion
          :parameters (#q1 #q3 o8 #g0)
          :precondition (and (isconf #q1) (isconf #q3) (isgrasp o8 #g0))
          :effect (isholdingmotion #q1 #t343 #q3 o8 #g0)
   )
   (:action s368_plan-holding-motion
          :parameters (#q1 #q3 o9 #g1)
          :precondition (and (isconf #q1) (isconf #q3) (isgrasp o9 #g1))
          :effect (isholdingmotion #q1 #t344 #q3 o9 #g1)
   )
   (:action s369_plan-holding-motion
          :parameters (#q1 #q3 o10 #g2)
          :precondition (and (isconf #q1) (isconf #q3) (isgrasp o10 #g2))
          :effect (isholdingmotion #q1 #t345 #q3 o10 #g2)
   )
   (:action s370_plan-holding-motion
          :parameters (#q1 #q3 o8 #g3)
          :precondition (and (isconf #q1) (isconf #q3) (isgrasp o8 #g3))
          :effect (isholdingmotion #q1 #t346 #q3 o8 #g3)
   )
   (:action s371_plan-holding-motion
          :parameters (#q1 #q3 o8 #g4)
          :precondition (and (isconf #q1) (isconf #q3) (isgrasp o8 #g4))
          :effect (isholdingmotion #q1 #t347 #q3 o8 #g4)
   )
   (:action s372_plan-holding-motion
          :parameters (#q1 #q3 o9 #g5)
          :precondition (and (isconf #q1) (isconf #q3) (isgrasp o9 #g5))
          :effect (isholdingmotion #q1 #t348 #q3 o9 #g5)
   )
   (:action s373_plan-holding-motion
          :parameters (#q1 #q3 o9 #g6)
          :precondition (and (isconf #q1) (isconf #q3) (isgrasp o9 #g6))
          :effect (isholdingmotion #q1 #t349 #q3 o9 #g6)
   )
   (:action s374_plan-holding-motion
          :parameters (#q1 #q3 o10 #g7)
          :precondition (and (isconf #q1) (isconf #q3) (isgrasp o10 #g7))
          :effect (isholdingmotion #q1 #t350 #q3 o10 #g7)
   )
   (:action s375_plan-holding-motion
          :parameters (#q1 #q3 o10 #g8)
          :precondition (and (isconf #q1) (isconf #q3) (isgrasp o10 #g8))
          :effect (isholdingmotion #q1 #t351 #q3 o10 #g8)
   )
   (:action s376_plan-holding-motion
          :parameters (#q1 #q4 o8 #g0)
          :precondition (and (isconf #q1) (isconf #q4) (isgrasp o8 #g0))
          :effect (isholdingmotion #q1 #t352 #q4 o8 #g0)
   )
   (:action s377_plan-holding-motion
          :parameters (#q1 #q4 o9 #g1)
          :precondition (and (isconf #q1) (isconf #q4) (isgrasp o9 #g1))
          :effect (isholdingmotion #q1 #t353 #q4 o9 #g1)
   )
   (:action s378_plan-holding-motion
          :parameters (#q1 #q4 o10 #g2)
          :precondition (and (isconf #q1) (isconf #q4) (isgrasp o10 #g2))
          :effect (isholdingmotion #q1 #t354 #q4 o10 #g2)
   )
   (:action s379_plan-holding-motion
          :parameters (#q1 #q4 o8 #g3)
          :precondition (and (isconf #q1) (isconf #q4) (isgrasp o8 #g3))
          :effect (isholdingmotion #q1 #t355 #q4 o8 #g3)
   )
   (:action s380_plan-holding-motion
          :parameters (#q1 #q4 o8 #g4)
          :precondition (and (isconf #q1) (isconf #q4) (isgrasp o8 #g4))
          :effect (isholdingmotion #q1 #t356 #q4 o8 #g4)
   )
   (:action s381_plan-holding-motion
          :parameters (#q1 #q4 o9 #g5)
          :precondition (and (isconf #q1) (isconf #q4) (isgrasp o9 #g5))
          :effect (isholdingmotion #q1 #t357 #q4 o9 #g5)
   )
   (:action s382_plan-holding-motion
          :parameters (#q1 #q4 o9 #g6)
          :precondition (and (isconf #q1) (isconf #q4) (isgrasp o9 #g6))
          :effect (isholdingmotion #q1 #t358 #q4 o9 #g6)
   )
   (:action s383_plan-holding-motion
          :parameters (#q1 #q4 o10 #g7)
          :precondition (and (isconf #q1) (isconf #q4) (isgrasp o10 #g7))
          :effect (isholdingmotion #q1 #t359 #q4 o10 #g7)
   )
   (:action s384_plan-holding-motion
          :parameters (#q1 #q4 o10 #g8)
          :precondition (and (isconf #q1) (isconf #q4) (isgrasp o10 #g8))
          :effect (isholdingmotion #q1 #t360 #q4 o10 #g8)
   )
   (:action s385_plan-holding-motion
          :parameters (#q1 #q5 o8 #g0)
          :precondition (and (isconf #q1) (isconf #q5) (isgrasp o8 #g0))
          :effect (isholdingmotion #q1 #t361 #q5 o8 #g0)
   )
   (:action s386_plan-holding-motion
          :parameters (#q1 #q5 o9 #g1)
          :precondition (and (isconf #q1) (isconf #q5) (isgrasp o9 #g1))
          :effect (isholdingmotion #q1 #t362 #q5 o9 #g1)
   )
   (:action s387_plan-holding-motion
          :parameters (#q1 #q5 o10 #g2)
          :precondition (and (isconf #q1) (isconf #q5) (isgrasp o10 #g2))
          :effect (isholdingmotion #q1 #t363 #q5 o10 #g2)
   )
   (:action s388_plan-holding-motion
          :parameters (#q1 #q5 o8 #g3)
          :precondition (and (isconf #q1) (isconf #q5) (isgrasp o8 #g3))
          :effect (isholdingmotion #q1 #t364 #q5 o8 #g3)
   )
   (:action s389_plan-holding-motion
          :parameters (#q1 #q5 o8 #g4)
          :precondition (and (isconf #q1) (isconf #q5) (isgrasp o8 #g4))
          :effect (isholdingmotion #q1 #t365 #q5 o8 #g4)
   )
   (:action s390_plan-holding-motion
          :parameters (#q1 #q5 o9 #g5)
          :precondition (and (isconf #q1) (isconf #q5) (isgrasp o9 #g5))
          :effect (isholdingmotion #q1 #t366 #q5 o9 #g5)
   )
   (:action s391_plan-holding-motion
          :parameters (#q1 #q5 o9 #g6)
          :precondition (and (isconf #q1) (isconf #q5) (isgrasp o9 #g6))
          :effect (isholdingmotion #q1 #t367 #q5 o9 #g6)
   )
   (:action s392_plan-holding-motion
          :parameters (#q1 #q5 o10 #g7)
          :precondition (and (isconf #q1) (isconf #q5) (isgrasp o10 #g7))
          :effect (isholdingmotion #q1 #t368 #q5 o10 #g7)
   )
   (:action s393_plan-holding-motion
          :parameters (#q1 #q5 o10 #g8)
          :precondition (and (isconf #q1) (isconf #q5) (isgrasp o10 #g8))
          :effect (isholdingmotion #q1 #t369 #q5 o10 #g8)
   )
   (:action s394_plan-holding-motion
          :parameters (#q1 #q6 o8 #g0)
          :precondition (and (isconf #q1) (isconf #q6) (isgrasp o8 #g0))
          :effect (isholdingmotion #q1 #t370 #q6 o8 #g0)
   )
   (:action s395_plan-holding-motion
          :parameters (#q1 #q6 o9 #g1)
          :precondition (and (isconf #q1) (isconf #q6) (isgrasp o9 #g1))
          :effect (isholdingmotion #q1 #t371 #q6 o9 #g1)
   )
   (:action s396_plan-holding-motion
          :parameters (#q1 #q6 o10 #g2)
          :precondition (and (isconf #q1) (isconf #q6) (isgrasp o10 #g2))
          :effect (isholdingmotion #q1 #t372 #q6 o10 #g2)
   )
   (:action s397_plan-holding-motion
          :parameters (#q1 #q6 o8 #g3)
          :precondition (and (isconf #q1) (isconf #q6) (isgrasp o8 #g3))
          :effect (isholdingmotion #q1 #t373 #q6 o8 #g3)
   )
   (:action s398_plan-holding-motion
          :parameters (#q1 #q6 o8 #g4)
          :precondition (and (isconf #q1) (isconf #q6) (isgrasp o8 #g4))
          :effect (isholdingmotion #q1 #t374 #q6 o8 #g4)
   )
   (:action s399_plan-holding-motion
          :parameters (#q1 #q6 o9 #g5)
          :precondition (and (isconf #q1) (isconf #q6) (isgrasp o9 #g5))
          :effect (isholdingmotion #q1 #t375 #q6 o9 #g5)
   )
   (:action s400_plan-holding-motion
          :parameters (#q1 #q6 o9 #g6)
          :precondition (and (isconf #q1) (isconf #q6) (isgrasp o9 #g6))
          :effect (isholdingmotion #q1 #t376 #q6 o9 #g6)
   )
   (:action s401_plan-holding-motion
          :parameters (#q1 #q6 o10 #g7)
          :precondition (and (isconf #q1) (isconf #q6) (isgrasp o10 #g7))
          :effect (isholdingmotion #q1 #t377 #q6 o10 #g7)
   )
   (:action s402_plan-holding-motion
          :parameters (#q1 #q6 o10 #g8)
          :precondition (and (isconf #q1) (isconf #q6) (isgrasp o10 #g8))
          :effect (isholdingmotion #q1 #t378 #q6 o10 #g8)
   )
   (:action s403_plan-holding-motion
          :parameters (#q1 #q7 o8 #g0)
          :precondition (and (isconf #q1) (isconf #q7) (isgrasp o8 #g0))
          :effect (isholdingmotion #q1 #t379 #q7 o8 #g0)
   )
   (:action s404_plan-holding-motion
          :parameters (#q1 #q7 o9 #g1)
          :precondition (and (isconf #q1) (isconf #q7) (isgrasp o9 #g1))
          :effect (isholdingmotion #q1 #t380 #q7 o9 #g1)
   )
   (:action s405_plan-holding-motion
          :parameters (#q1 #q7 o10 #g2)
          :precondition (and (isconf #q1) (isconf #q7) (isgrasp o10 #g2))
          :effect (isholdingmotion #q1 #t381 #q7 o10 #g2)
   )
   (:action s406_plan-holding-motion
          :parameters (#q1 #q7 o8 #g3)
          :precondition (and (isconf #q1) (isconf #q7) (isgrasp o8 #g3))
          :effect (isholdingmotion #q1 #t382 #q7 o8 #g3)
   )
   (:action s407_plan-holding-motion
          :parameters (#q1 #q7 o8 #g4)
          :precondition (and (isconf #q1) (isconf #q7) (isgrasp o8 #g4))
          :effect (isholdingmotion #q1 #t383 #q7 o8 #g4)
   )
   (:action s408_plan-holding-motion
          :parameters (#q1 #q7 o9 #g5)
          :precondition (and (isconf #q1) (isconf #q7) (isgrasp o9 #g5))
          :effect (isholdingmotion #q1 #t384 #q7 o9 #g5)
   )
   (:action s409_plan-holding-motion
          :parameters (#q1 #q7 o9 #g6)
          :precondition (and (isconf #q1) (isconf #q7) (isgrasp o9 #g6))
          :effect (isholdingmotion #q1 #t385 #q7 o9 #g6)
   )
   (:action s410_plan-holding-motion
          :parameters (#q1 #q7 o10 #g7)
          :precondition (and (isconf #q1) (isconf #q7) (isgrasp o10 #g7))
          :effect (isholdingmotion #q1 #t386 #q7 o10 #g7)
   )
   (:action s411_plan-holding-motion
          :parameters (#q1 #q7 o10 #g8)
          :precondition (and (isconf #q1) (isconf #q7) (isgrasp o10 #g8))
          :effect (isholdingmotion #q1 #t387 #q7 o10 #g8)
   )
   (:action s412_plan-holding-motion
          :parameters (#q1 #q8 o8 #g0)
          :precondition (and (isconf #q1) (isconf #q8) (isgrasp o8 #g0))
          :effect (isholdingmotion #q1 #t388 #q8 o8 #g0)
   )
   (:action s413_plan-holding-motion
          :parameters (#q1 #q8 o9 #g1)
          :precondition (and (isconf #q1) (isconf #q8) (isgrasp o9 #g1))
          :effect (isholdingmotion #q1 #t389 #q8 o9 #g1)
   )
   (:action s414_plan-holding-motion
          :parameters (#q1 #q8 o10 #g2)
          :precondition (and (isconf #q1) (isconf #q8) (isgrasp o10 #g2))
          :effect (isholdingmotion #q1 #t390 #q8 o10 #g2)
   )
   (:action s415_plan-holding-motion
          :parameters (#q1 #q8 o8 #g3)
          :precondition (and (isconf #q1) (isconf #q8) (isgrasp o8 #g3))
          :effect (isholdingmotion #q1 #t391 #q8 o8 #g3)
   )
   (:action s416_plan-holding-motion
          :parameters (#q1 #q8 o8 #g4)
          :precondition (and (isconf #q1) (isconf #q8) (isgrasp o8 #g4))
          :effect (isholdingmotion #q1 #t392 #q8 o8 #g4)
   )
   (:action s417_plan-holding-motion
          :parameters (#q1 #q8 o9 #g5)
          :precondition (and (isconf #q1) (isconf #q8) (isgrasp o9 #g5))
          :effect (isholdingmotion #q1 #t393 #q8 o9 #g5)
   )
   (:action s418_plan-holding-motion
          :parameters (#q1 #q8 o9 #g6)
          :precondition (and (isconf #q1) (isconf #q8) (isgrasp o9 #g6))
          :effect (isholdingmotion #q1 #t394 #q8 o9 #g6)
   )
   (:action s419_plan-holding-motion
          :parameters (#q1 #q8 o10 #g7)
          :precondition (and (isconf #q1) (isconf #q8) (isgrasp o10 #g7))
          :effect (isholdingmotion #q1 #t395 #q8 o10 #g7)
   )
   (:action s420_plan-holding-motion
          :parameters (#q1 #q8 o10 #g8)
          :precondition (and (isconf #q1) (isconf #q8) (isgrasp o10 #g8))
          :effect (isholdingmotion #q1 #t396 #q8 o10 #g8)
   )
   (:action s421_plan-holding-motion
          :parameters (#q2 q40 o8 #g0)
          :precondition (and (isconf #q2) (isconf q40) (isgrasp o8 #g0))
          :effect (isholdingmotion #q2 #t397 q40 o8 #g0)
   )
   (:action s422_plan-holding-motion
          :parameters (#q2 q40 o9 #g1)
          :precondition (and (isconf #q2) (isconf q40) (isgrasp o9 #g1))
          :effect (isholdingmotion #q2 #t398 q40 o9 #g1)
   )
   (:action s423_plan-holding-motion
          :parameters (#q2 q40 o10 #g2)
          :precondition (and (isconf #q2) (isconf q40) (isgrasp o10 #g2))
          :effect (isholdingmotion #q2 #t399 q40 o10 #g2)
   )
   (:action s424_plan-holding-motion
          :parameters (#q2 q40 o8 #g3)
          :precondition (and (isconf #q2) (isconf q40) (isgrasp o8 #g3))
          :effect (isholdingmotion #q2 #t400 q40 o8 #g3)
   )
   (:action s425_plan-holding-motion
          :parameters (#q2 q40 o8 #g4)
          :precondition (and (isconf #q2) (isconf q40) (isgrasp o8 #g4))
          :effect (isholdingmotion #q2 #t401 q40 o8 #g4)
   )
   (:action s426_plan-holding-motion
          :parameters (#q2 q40 o9 #g5)
          :precondition (and (isconf #q2) (isconf q40) (isgrasp o9 #g5))
          :effect (isholdingmotion #q2 #t402 q40 o9 #g5)
   )
   (:action s427_plan-holding-motion
          :parameters (#q2 q40 o9 #g6)
          :precondition (and (isconf #q2) (isconf q40) (isgrasp o9 #g6))
          :effect (isholdingmotion #q2 #t403 q40 o9 #g6)
   )
   (:action s428_plan-holding-motion
          :parameters (#q2 q40 o10 #g7)
          :precondition (and (isconf #q2) (isconf q40) (isgrasp o10 #g7))
          :effect (isholdingmotion #q2 #t404 q40 o10 #g7)
   )
   (:action s429_plan-holding-motion
          :parameters (#q2 q40 o10 #g8)
          :precondition (and (isconf #q2) (isconf q40) (isgrasp o10 #g8))
          :effect (isholdingmotion #q2 #t405 q40 o10 #g8)
   )
   (:action s430_plan-holding-motion
          :parameters (#q2 #q0 o8 #g0)
          :precondition (and (isconf #q2) (isconf #q0) (isgrasp o8 #g0))
          :effect (isholdingmotion #q2 #t406 #q0 o8 #g0)
   )
   (:action s431_plan-holding-motion
          :parameters (#q2 #q0 o9 #g1)
          :precondition (and (isconf #q2) (isconf #q0) (isgrasp o9 #g1))
          :effect (isholdingmotion #q2 #t407 #q0 o9 #g1)
   )
   (:action s432_plan-holding-motion
          :parameters (#q2 #q0 o10 #g2)
          :precondition (and (isconf #q2) (isconf #q0) (isgrasp o10 #g2))
          :effect (isholdingmotion #q2 #t408 #q0 o10 #g2)
   )
   (:action s433_plan-holding-motion
          :parameters (#q2 #q0 o8 #g3)
          :precondition (and (isconf #q2) (isconf #q0) (isgrasp o8 #g3))
          :effect (isholdingmotion #q2 #t409 #q0 o8 #g3)
   )
   (:action s434_plan-holding-motion
          :parameters (#q2 #q0 o8 #g4)
          :precondition (and (isconf #q2) (isconf #q0) (isgrasp o8 #g4))
          :effect (isholdingmotion #q2 #t410 #q0 o8 #g4)
   )
   (:action s435_plan-holding-motion
          :parameters (#q2 #q0 o9 #g5)
          :precondition (and (isconf #q2) (isconf #q0) (isgrasp o9 #g5))
          :effect (isholdingmotion #q2 #t411 #q0 o9 #g5)
   )
   (:action s436_plan-holding-motion
          :parameters (#q2 #q0 o9 #g6)
          :precondition (and (isconf #q2) (isconf #q0) (isgrasp o9 #g6))
          :effect (isholdingmotion #q2 #t412 #q0 o9 #g6)
   )
   (:action s437_plan-holding-motion
          :parameters (#q2 #q0 o10 #g7)
          :precondition (and (isconf #q2) (isconf #q0) (isgrasp o10 #g7))
          :effect (isholdingmotion #q2 #t413 #q0 o10 #g7)
   )
   (:action s438_plan-holding-motion
          :parameters (#q2 #q0 o10 #g8)
          :precondition (and (isconf #q2) (isconf #q0) (isgrasp o10 #g8))
          :effect (isholdingmotion #q2 #t414 #q0 o10 #g8)
   )
   (:action s439_plan-holding-motion
          :parameters (#q2 #q1 o8 #g0)
          :precondition (and (isconf #q2) (isconf #q1) (isgrasp o8 #g0))
          :effect (isholdingmotion #q2 #t415 #q1 o8 #g0)
   )
   (:action s440_plan-holding-motion
          :parameters (#q2 #q1 o9 #g1)
          :precondition (and (isconf #q2) (isconf #q1) (isgrasp o9 #g1))
          :effect (isholdingmotion #q2 #t416 #q1 o9 #g1)
   )
   (:action s441_plan-holding-motion
          :parameters (#q2 #q1 o10 #g2)
          :precondition (and (isconf #q2) (isconf #q1) (isgrasp o10 #g2))
          :effect (isholdingmotion #q2 #t417 #q1 o10 #g2)
   )
   (:action s442_plan-holding-motion
          :parameters (#q2 #q1 o8 #g3)
          :precondition (and (isconf #q2) (isconf #q1) (isgrasp o8 #g3))
          :effect (isholdingmotion #q2 #t418 #q1 o8 #g3)
   )
   (:action s443_plan-holding-motion
          :parameters (#q2 #q1 o8 #g4)
          :precondition (and (isconf #q2) (isconf #q1) (isgrasp o8 #g4))
          :effect (isholdingmotion #q2 #t419 #q1 o8 #g4)
   )
   (:action s444_plan-holding-motion
          :parameters (#q2 #q1 o9 #g5)
          :precondition (and (isconf #q2) (isconf #q1) (isgrasp o9 #g5))
          :effect (isholdingmotion #q2 #t420 #q1 o9 #g5)
   )
   (:action s445_plan-holding-motion
          :parameters (#q2 #q1 o9 #g6)
          :precondition (and (isconf #q2) (isconf #q1) (isgrasp o9 #g6))
          :effect (isholdingmotion #q2 #t421 #q1 o9 #g6)
   )
   (:action s446_plan-holding-motion
          :parameters (#q2 #q1 o10 #g7)
          :precondition (and (isconf #q2) (isconf #q1) (isgrasp o10 #g7))
          :effect (isholdingmotion #q2 #t422 #q1 o10 #g7)
   )
   (:action s447_plan-holding-motion
          :parameters (#q2 #q1 o10 #g8)
          :precondition (and (isconf #q2) (isconf #q1) (isgrasp o10 #g8))
          :effect (isholdingmotion #q2 #t423 #q1 o10 #g8)
   )
   (:action s448_plan-holding-motion
          :parameters (#q2 #q2 o8 #g0)
          :precondition (and (isconf #q2) (isconf #q2) (isgrasp o8 #g0))
          :effect (isholdingmotion #q2 #t424 #q2 o8 #g0)
   )
   (:action s449_plan-holding-motion
          :parameters (#q2 #q2 o9 #g1)
          :precondition (and (isconf #q2) (isconf #q2) (isgrasp o9 #g1))
          :effect (isholdingmotion #q2 #t425 #q2 o9 #g1)
   )
   (:action s450_plan-holding-motion
          :parameters (#q2 #q2 o10 #g2)
          :precondition (and (isconf #q2) (isconf #q2) (isgrasp o10 #g2))
          :effect (isholdingmotion #q2 #t426 #q2 o10 #g2)
   )
   (:action s451_plan-holding-motion
          :parameters (#q2 #q2 o8 #g3)
          :precondition (and (isconf #q2) (isconf #q2) (isgrasp o8 #g3))
          :effect (isholdingmotion #q2 #t427 #q2 o8 #g3)
   )
   (:action s452_plan-holding-motion
          :parameters (#q2 #q2 o8 #g4)
          :precondition (and (isconf #q2) (isconf #q2) (isgrasp o8 #g4))
          :effect (isholdingmotion #q2 #t428 #q2 o8 #g4)
   )
   (:action s453_plan-holding-motion
          :parameters (#q2 #q2 o9 #g5)
          :precondition (and (isconf #q2) (isconf #q2) (isgrasp o9 #g5))
          :effect (isholdingmotion #q2 #t429 #q2 o9 #g5)
   )
   (:action s454_plan-holding-motion
          :parameters (#q2 #q2 o9 #g6)
          :precondition (and (isconf #q2) (isconf #q2) (isgrasp o9 #g6))
          :effect (isholdingmotion #q2 #t430 #q2 o9 #g6)
   )
   (:action s455_plan-holding-motion
          :parameters (#q2 #q2 o10 #g7)
          :precondition (and (isconf #q2) (isconf #q2) (isgrasp o10 #g7))
          :effect (isholdingmotion #q2 #t431 #q2 o10 #g7)
   )
   (:action s456_plan-holding-motion
          :parameters (#q2 #q2 o10 #g8)
          :precondition (and (isconf #q2) (isconf #q2) (isgrasp o10 #g8))
          :effect (isholdingmotion #q2 #t432 #q2 o10 #g8)
   )
   (:action s457_plan-holding-motion
          :parameters (#q2 #q3 o8 #g0)
          :precondition (and (isconf #q2) (isconf #q3) (isgrasp o8 #g0))
          :effect (isholdingmotion #q2 #t433 #q3 o8 #g0)
   )
   (:action s458_plan-holding-motion
          :parameters (#q2 #q3 o9 #g1)
          :precondition (and (isconf #q2) (isconf #q3) (isgrasp o9 #g1))
          :effect (isholdingmotion #q2 #t434 #q3 o9 #g1)
   )
   (:action s459_plan-holding-motion
          :parameters (#q2 #q3 o10 #g2)
          :precondition (and (isconf #q2) (isconf #q3) (isgrasp o10 #g2))
          :effect (isholdingmotion #q2 #t435 #q3 o10 #g2)
   )
   (:action s460_plan-holding-motion
          :parameters (#q2 #q3 o8 #g3)
          :precondition (and (isconf #q2) (isconf #q3) (isgrasp o8 #g3))
          :effect (isholdingmotion #q2 #t436 #q3 o8 #g3)
   )
   (:action s461_plan-holding-motion
          :parameters (#q2 #q3 o8 #g4)
          :precondition (and (isconf #q2) (isconf #q3) (isgrasp o8 #g4))
          :effect (isholdingmotion #q2 #t437 #q3 o8 #g4)
   )
   (:action s462_plan-holding-motion
          :parameters (#q2 #q3 o9 #g5)
          :precondition (and (isconf #q2) (isconf #q3) (isgrasp o9 #g5))
          :effect (isholdingmotion #q2 #t438 #q3 o9 #g5)
   )
   (:action s463_plan-holding-motion
          :parameters (#q2 #q3 o9 #g6)
          :precondition (and (isconf #q2) (isconf #q3) (isgrasp o9 #g6))
          :effect (isholdingmotion #q2 #t439 #q3 o9 #g6)
   )
   (:action s464_plan-holding-motion
          :parameters (#q2 #q3 o10 #g7)
          :precondition (and (isconf #q2) (isconf #q3) (isgrasp o10 #g7))
          :effect (isholdingmotion #q2 #t440 #q3 o10 #g7)
   )
   (:action s465_plan-holding-motion
          :parameters (#q2 #q3 o10 #g8)
          :precondition (and (isconf #q2) (isconf #q3) (isgrasp o10 #g8))
          :effect (isholdingmotion #q2 #t441 #q3 o10 #g8)
   )
   (:action s466_plan-holding-motion
          :parameters (#q2 #q4 o8 #g0)
          :precondition (and (isconf #q2) (isconf #q4) (isgrasp o8 #g0))
          :effect (isholdingmotion #q2 #t442 #q4 o8 #g0)
   )
   (:action s467_plan-holding-motion
          :parameters (#q2 #q4 o9 #g1)
          :precondition (and (isconf #q2) (isconf #q4) (isgrasp o9 #g1))
          :effect (isholdingmotion #q2 #t443 #q4 o9 #g1)
   )
   (:action s468_plan-holding-motion
          :parameters (#q2 #q4 o10 #g2)
          :precondition (and (isconf #q2) (isconf #q4) (isgrasp o10 #g2))
          :effect (isholdingmotion #q2 #t444 #q4 o10 #g2)
   )
   (:action s469_plan-holding-motion
          :parameters (#q2 #q4 o8 #g3)
          :precondition (and (isconf #q2) (isconf #q4) (isgrasp o8 #g3))
          :effect (isholdingmotion #q2 #t445 #q4 o8 #g3)
   )
   (:action s470_plan-holding-motion
          :parameters (#q2 #q4 o8 #g4)
          :precondition (and (isconf #q2) (isconf #q4) (isgrasp o8 #g4))
          :effect (isholdingmotion #q2 #t446 #q4 o8 #g4)
   )
   (:action s471_plan-holding-motion
          :parameters (#q2 #q4 o9 #g5)
          :precondition (and (isconf #q2) (isconf #q4) (isgrasp o9 #g5))
          :effect (isholdingmotion #q2 #t447 #q4 o9 #g5)
   )
   (:action s472_plan-holding-motion
          :parameters (#q2 #q4 o9 #g6)
          :precondition (and (isconf #q2) (isconf #q4) (isgrasp o9 #g6))
          :effect (isholdingmotion #q2 #t448 #q4 o9 #g6)
   )
   (:action s473_plan-holding-motion
          :parameters (#q2 #q4 o10 #g7)
          :precondition (and (isconf #q2) (isconf #q4) (isgrasp o10 #g7))
          :effect (isholdingmotion #q2 #t449 #q4 o10 #g7)
   )
   (:action s474_plan-holding-motion
          :parameters (#q2 #q4 o10 #g8)
          :precondition (and (isconf #q2) (isconf #q4) (isgrasp o10 #g8))
          :effect (isholdingmotion #q2 #t450 #q4 o10 #g8)
   )
   (:action s475_plan-holding-motion
          :parameters (#q2 #q5 o8 #g0)
          :precondition (and (isconf #q2) (isconf #q5) (isgrasp o8 #g0))
          :effect (isholdingmotion #q2 #t451 #q5 o8 #g0)
   )
   (:action s476_plan-holding-motion
          :parameters (#q2 #q5 o9 #g1)
          :precondition (and (isconf #q2) (isconf #q5) (isgrasp o9 #g1))
          :effect (isholdingmotion #q2 #t452 #q5 o9 #g1)
   )
   (:action s477_plan-holding-motion
          :parameters (#q2 #q5 o10 #g2)
          :precondition (and (isconf #q2) (isconf #q5) (isgrasp o10 #g2))
          :effect (isholdingmotion #q2 #t453 #q5 o10 #g2)
   )
   (:action s478_plan-holding-motion
          :parameters (#q2 #q5 o8 #g3)
          :precondition (and (isconf #q2) (isconf #q5) (isgrasp o8 #g3))
          :effect (isholdingmotion #q2 #t454 #q5 o8 #g3)
   )
   (:action s479_plan-holding-motion
          :parameters (#q2 #q5 o8 #g4)
          :precondition (and (isconf #q2) (isconf #q5) (isgrasp o8 #g4))
          :effect (isholdingmotion #q2 #t455 #q5 o8 #g4)
   )
   (:action s480_plan-holding-motion
          :parameters (#q2 #q5 o9 #g5)
          :precondition (and (isconf #q2) (isconf #q5) (isgrasp o9 #g5))
          :effect (isholdingmotion #q2 #t456 #q5 o9 #g5)
   )
   (:action s481_plan-holding-motion
          :parameters (#q2 #q5 o9 #g6)
          :precondition (and (isconf #q2) (isconf #q5) (isgrasp o9 #g6))
          :effect (isholdingmotion #q2 #t457 #q5 o9 #g6)
   )
   (:action s482_plan-holding-motion
          :parameters (#q2 #q5 o10 #g7)
          :precondition (and (isconf #q2) (isconf #q5) (isgrasp o10 #g7))
          :effect (isholdingmotion #q2 #t458 #q5 o10 #g7)
   )
   (:action s483_plan-holding-motion
          :parameters (#q2 #q5 o10 #g8)
          :precondition (and (isconf #q2) (isconf #q5) (isgrasp o10 #g8))
          :effect (isholdingmotion #q2 #t459 #q5 o10 #g8)
   )
   (:action s484_plan-holding-motion
          :parameters (#q2 #q6 o8 #g0)
          :precondition (and (isconf #q2) (isconf #q6) (isgrasp o8 #g0))
          :effect (isholdingmotion #q2 #t460 #q6 o8 #g0)
   )
   (:action s485_plan-holding-motion
          :parameters (#q2 #q6 o9 #g1)
          :precondition (and (isconf #q2) (isconf #q6) (isgrasp o9 #g1))
          :effect (isholdingmotion #q2 #t461 #q6 o9 #g1)
   )
   (:action s486_plan-holding-motion
          :parameters (#q2 #q6 o10 #g2)
          :precondition (and (isconf #q2) (isconf #q6) (isgrasp o10 #g2))
          :effect (isholdingmotion #q2 #t462 #q6 o10 #g2)
   )
   (:action s487_plan-holding-motion
          :parameters (#q2 #q6 o8 #g3)
          :precondition (and (isconf #q2) (isconf #q6) (isgrasp o8 #g3))
          :effect (isholdingmotion #q2 #t463 #q6 o8 #g3)
   )
   (:action s488_plan-holding-motion
          :parameters (#q2 #q6 o8 #g4)
          :precondition (and (isconf #q2) (isconf #q6) (isgrasp o8 #g4))
          :effect (isholdingmotion #q2 #t464 #q6 o8 #g4)
   )
   (:action s489_plan-holding-motion
          :parameters (#q2 #q6 o9 #g5)
          :precondition (and (isconf #q2) (isconf #q6) (isgrasp o9 #g5))
          :effect (isholdingmotion #q2 #t465 #q6 o9 #g5)
   )
   (:action s490_plan-holding-motion
          :parameters (#q2 #q6 o9 #g6)
          :precondition (and (isconf #q2) (isconf #q6) (isgrasp o9 #g6))
          :effect (isholdingmotion #q2 #t466 #q6 o9 #g6)
   )
   (:action s491_plan-holding-motion
          :parameters (#q2 #q6 o10 #g7)
          :precondition (and (isconf #q2) (isconf #q6) (isgrasp o10 #g7))
          :effect (isholdingmotion #q2 #t467 #q6 o10 #g7)
   )
   (:action s492_plan-holding-motion
          :parameters (#q2 #q6 o10 #g8)
          :precondition (and (isconf #q2) (isconf #q6) (isgrasp o10 #g8))
          :effect (isholdingmotion #q2 #t468 #q6 o10 #g8)
   )
   (:action s493_plan-holding-motion
          :parameters (#q2 #q7 o8 #g0)
          :precondition (and (isconf #q2) (isconf #q7) (isgrasp o8 #g0))
          :effect (isholdingmotion #q2 #t469 #q7 o8 #g0)
   )
   (:action s494_plan-holding-motion
          :parameters (#q2 #q7 o9 #g1)
          :precondition (and (isconf #q2) (isconf #q7) (isgrasp o9 #g1))
          :effect (isholdingmotion #q2 #t470 #q7 o9 #g1)
   )
   (:action s495_plan-holding-motion
          :parameters (#q2 #q7 o10 #g2)
          :precondition (and (isconf #q2) (isconf #q7) (isgrasp o10 #g2))
          :effect (isholdingmotion #q2 #t471 #q7 o10 #g2)
   )
   (:action s496_plan-holding-motion
          :parameters (#q2 #q7 o8 #g3)
          :precondition (and (isconf #q2) (isconf #q7) (isgrasp o8 #g3))
          :effect (isholdingmotion #q2 #t472 #q7 o8 #g3)
   )
   (:action s497_plan-holding-motion
          :parameters (#q2 #q7 o8 #g4)
          :precondition (and (isconf #q2) (isconf #q7) (isgrasp o8 #g4))
          :effect (isholdingmotion #q2 #t473 #q7 o8 #g4)
   )
   (:action s498_plan-holding-motion
          :parameters (#q2 #q7 o9 #g5)
          :precondition (and (isconf #q2) (isconf #q7) (isgrasp o9 #g5))
          :effect (isholdingmotion #q2 #t474 #q7 o9 #g5)
   )
   (:action s499_plan-holding-motion
          :parameters (#q2 #q7 o9 #g6)
          :precondition (and (isconf #q2) (isconf #q7) (isgrasp o9 #g6))
          :effect (isholdingmotion #q2 #t475 #q7 o9 #g6)
   )
   (:action s500_plan-holding-motion
          :parameters (#q2 #q7 o10 #g7)
          :precondition (and (isconf #q2) (isconf #q7) (isgrasp o10 #g7))
          :effect (isholdingmotion #q2 #t476 #q7 o10 #g7)
   )
   (:action s501_plan-holding-motion
          :parameters (#q2 #q7 o10 #g8)
          :precondition (and (isconf #q2) (isconf #q7) (isgrasp o10 #g8))
          :effect (isholdingmotion #q2 #t477 #q7 o10 #g8)
   )
   (:action s502_plan-holding-motion
          :parameters (#q2 #q8 o8 #g0)
          :precondition (and (isconf #q2) (isconf #q8) (isgrasp o8 #g0))
          :effect (isholdingmotion #q2 #t478 #q8 o8 #g0)
   )
   (:action s503_plan-holding-motion
          :parameters (#q2 #q8 o9 #g1)
          :precondition (and (isconf #q2) (isconf #q8) (isgrasp o9 #g1))
          :effect (isholdingmotion #q2 #t479 #q8 o9 #g1)
   )
   (:action s504_plan-holding-motion
          :parameters (#q2 #q8 o10 #g2)
          :precondition (and (isconf #q2) (isconf #q8) (isgrasp o10 #g2))
          :effect (isholdingmotion #q2 #t480 #q8 o10 #g2)
   )
   (:action s505_plan-holding-motion
          :parameters (#q2 #q8 o8 #g3)
          :precondition (and (isconf #q2) (isconf #q8) (isgrasp o8 #g3))
          :effect (isholdingmotion #q2 #t481 #q8 o8 #g3)
   )
   (:action s506_plan-holding-motion
          :parameters (#q2 #q8 o8 #g4)
          :precondition (and (isconf #q2) (isconf #q8) (isgrasp o8 #g4))
          :effect (isholdingmotion #q2 #t482 #q8 o8 #g4)
   )
   (:action s507_plan-holding-motion
          :parameters (#q2 #q8 o9 #g5)
          :precondition (and (isconf #q2) (isconf #q8) (isgrasp o9 #g5))
          :effect (isholdingmotion #q2 #t483 #q8 o9 #g5)
   )
   (:action s508_plan-holding-motion
          :parameters (#q2 #q8 o9 #g6)
          :precondition (and (isconf #q2) (isconf #q8) (isgrasp o9 #g6))
          :effect (isholdingmotion #q2 #t484 #q8 o9 #g6)
   )
   (:action s509_plan-holding-motion
          :parameters (#q2 #q8 o10 #g7)
          :precondition (and (isconf #q2) (isconf #q8) (isgrasp o10 #g7))
          :effect (isholdingmotion #q2 #t485 #q8 o10 #g7)
   )
   (:action s510_plan-holding-motion
          :parameters (#q2 #q8 o10 #g8)
          :precondition (and (isconf #q2) (isconf #q8) (isgrasp o10 #g8))
          :effect (isholdingmotion #q2 #t486 #q8 o10 #g8)
   )
   (:action s511_plan-holding-motion
          :parameters (#q3 q40 o8 #g0)
          :precondition (and (isconf #q3) (isconf q40) (isgrasp o8 #g0))
          :effect (isholdingmotion #q3 #t487 q40 o8 #g0)
   )
   (:action s512_plan-holding-motion
          :parameters (#q3 q40 o9 #g1)
          :precondition (and (isconf #q3) (isconf q40) (isgrasp o9 #g1))
          :effect (isholdingmotion #q3 #t488 q40 o9 #g1)
   )
   (:action s513_plan-holding-motion
          :parameters (#q3 q40 o10 #g2)
          :precondition (and (isconf #q3) (isconf q40) (isgrasp o10 #g2))
          :effect (isholdingmotion #q3 #t489 q40 o10 #g2)
   )
   (:action s514_plan-holding-motion
          :parameters (#q3 q40 o8 #g3)
          :precondition (and (isconf #q3) (isconf q40) (isgrasp o8 #g3))
          :effect (isholdingmotion #q3 #t490 q40 o8 #g3)
   )
   (:action s515_plan-holding-motion
          :parameters (#q3 q40 o8 #g4)
          :precondition (and (isconf #q3) (isconf q40) (isgrasp o8 #g4))
          :effect (isholdingmotion #q3 #t491 q40 o8 #g4)
   )
   (:action s516_plan-holding-motion
          :parameters (#q3 q40 o9 #g5)
          :precondition (and (isconf #q3) (isconf q40) (isgrasp o9 #g5))
          :effect (isholdingmotion #q3 #t492 q40 o9 #g5)
   )
   (:action s517_plan-holding-motion
          :parameters (#q3 q40 o9 #g6)
          :precondition (and (isconf #q3) (isconf q40) (isgrasp o9 #g6))
          :effect (isholdingmotion #q3 #t493 q40 o9 #g6)
   )
   (:action s518_plan-holding-motion
          :parameters (#q3 q40 o10 #g7)
          :precondition (and (isconf #q3) (isconf q40) (isgrasp o10 #g7))
          :effect (isholdingmotion #q3 #t494 q40 o10 #g7)
   )
   (:action s519_plan-holding-motion
          :parameters (#q3 q40 o10 #g8)
          :precondition (and (isconf #q3) (isconf q40) (isgrasp o10 #g8))
          :effect (isholdingmotion #q3 #t495 q40 o10 #g8)
   )
   (:action s520_plan-holding-motion
          :parameters (#q3 #q0 o8 #g0)
          :precondition (and (isconf #q3) (isconf #q0) (isgrasp o8 #g0))
          :effect (isholdingmotion #q3 #t496 #q0 o8 #g0)
   )
   (:action s521_plan-holding-motion
          :parameters (#q3 #q0 o9 #g1)
          :precondition (and (isconf #q3) (isconf #q0) (isgrasp o9 #g1))
          :effect (isholdingmotion #q3 #t497 #q0 o9 #g1)
   )
   (:action s522_plan-holding-motion
          :parameters (#q3 #q0 o10 #g2)
          :precondition (and (isconf #q3) (isconf #q0) (isgrasp o10 #g2))
          :effect (isholdingmotion #q3 #t498 #q0 o10 #g2)
   )
   (:action s523_plan-holding-motion
          :parameters (#q3 #q0 o8 #g3)
          :precondition (and (isconf #q3) (isconf #q0) (isgrasp o8 #g3))
          :effect (isholdingmotion #q3 #t499 #q0 o8 #g3)
   )
   (:action s524_plan-holding-motion
          :parameters (#q3 #q0 o8 #g4)
          :precondition (and (isconf #q3) (isconf #q0) (isgrasp o8 #g4))
          :effect (isholdingmotion #q3 #t500 #q0 o8 #g4)
   )
   (:action s525_plan-holding-motion
          :parameters (#q3 #q0 o9 #g5)
          :precondition (and (isconf #q3) (isconf #q0) (isgrasp o9 #g5))
          :effect (isholdingmotion #q3 #t501 #q0 o9 #g5)
   )
   (:action s526_plan-holding-motion
          :parameters (#q3 #q0 o9 #g6)
          :precondition (and (isconf #q3) (isconf #q0) (isgrasp o9 #g6))
          :effect (isholdingmotion #q3 #t502 #q0 o9 #g6)
   )
   (:action s527_plan-holding-motion
          :parameters (#q3 #q0 o10 #g7)
          :precondition (and (isconf #q3) (isconf #q0) (isgrasp o10 #g7))
          :effect (isholdingmotion #q3 #t503 #q0 o10 #g7)
   )
   (:action s528_plan-holding-motion
          :parameters (#q3 #q0 o10 #g8)
          :precondition (and (isconf #q3) (isconf #q0) (isgrasp o10 #g8))
          :effect (isholdingmotion #q3 #t504 #q0 o10 #g8)
   )
   (:action s529_plan-holding-motion
          :parameters (#q3 #q1 o8 #g0)
          :precondition (and (isconf #q3) (isconf #q1) (isgrasp o8 #g0))
          :effect (isholdingmotion #q3 #t505 #q1 o8 #g0)
   )
   (:action s530_plan-holding-motion
          :parameters (#q3 #q1 o9 #g1)
          :precondition (and (isconf #q3) (isconf #q1) (isgrasp o9 #g1))
          :effect (isholdingmotion #q3 #t506 #q1 o9 #g1)
   )
   (:action s531_plan-holding-motion
          :parameters (#q3 #q1 o10 #g2)
          :precondition (and (isconf #q3) (isconf #q1) (isgrasp o10 #g2))
          :effect (isholdingmotion #q3 #t507 #q1 o10 #g2)
   )
   (:action s532_plan-holding-motion
          :parameters (#q3 #q1 o8 #g3)
          :precondition (and (isconf #q3) (isconf #q1) (isgrasp o8 #g3))
          :effect (isholdingmotion #q3 #t508 #q1 o8 #g3)
   )
   (:action s533_plan-holding-motion
          :parameters (#q3 #q1 o8 #g4)
          :precondition (and (isconf #q3) (isconf #q1) (isgrasp o8 #g4))
          :effect (isholdingmotion #q3 #t509 #q1 o8 #g4)
   )
   (:action s534_plan-holding-motion
          :parameters (#q3 #q1 o9 #g5)
          :precondition (and (isconf #q3) (isconf #q1) (isgrasp o9 #g5))
          :effect (isholdingmotion #q3 #t510 #q1 o9 #g5)
   )
   (:action s535_plan-holding-motion
          :parameters (#q3 #q1 o9 #g6)
          :precondition (and (isconf #q3) (isconf #q1) (isgrasp o9 #g6))
          :effect (isholdingmotion #q3 #t511 #q1 o9 #g6)
   )
   (:action s536_plan-holding-motion
          :parameters (#q3 #q1 o10 #g7)
          :precondition (and (isconf #q3) (isconf #q1) (isgrasp o10 #g7))
          :effect (isholdingmotion #q3 #t512 #q1 o10 #g7)
   )
   (:action s537_plan-holding-motion
          :parameters (#q3 #q1 o10 #g8)
          :precondition (and (isconf #q3) (isconf #q1) (isgrasp o10 #g8))
          :effect (isholdingmotion #q3 #t513 #q1 o10 #g8)
   )
   (:action s538_plan-holding-motion
          :parameters (#q3 #q2 o8 #g0)
          :precondition (and (isconf #q3) (isconf #q2) (isgrasp o8 #g0))
          :effect (isholdingmotion #q3 #t514 #q2 o8 #g0)
   )
   (:action s539_plan-holding-motion
          :parameters (#q3 #q2 o9 #g1)
          :precondition (and (isconf #q3) (isconf #q2) (isgrasp o9 #g1))
          :effect (isholdingmotion #q3 #t515 #q2 o9 #g1)
   )
   (:action s540_plan-holding-motion
          :parameters (#q3 #q2 o10 #g2)
          :precondition (and (isconf #q3) (isconf #q2) (isgrasp o10 #g2))
          :effect (isholdingmotion #q3 #t516 #q2 o10 #g2)
   )
   (:action s541_plan-holding-motion
          :parameters (#q3 #q2 o8 #g3)
          :precondition (and (isconf #q3) (isconf #q2) (isgrasp o8 #g3))
          :effect (isholdingmotion #q3 #t517 #q2 o8 #g3)
   )
   (:action s542_plan-holding-motion
          :parameters (#q3 #q2 o8 #g4)
          :precondition (and (isconf #q3) (isconf #q2) (isgrasp o8 #g4))
          :effect (isholdingmotion #q3 #t518 #q2 o8 #g4)
   )
   (:action s543_plan-holding-motion
          :parameters (#q3 #q2 o9 #g5)
          :precondition (and (isconf #q3) (isconf #q2) (isgrasp o9 #g5))
          :effect (isholdingmotion #q3 #t519 #q2 o9 #g5)
   )
   (:action s544_plan-holding-motion
          :parameters (#q3 #q2 o9 #g6)
          :precondition (and (isconf #q3) (isconf #q2) (isgrasp o9 #g6))
          :effect (isholdingmotion #q3 #t520 #q2 o9 #g6)
   )
   (:action s545_plan-holding-motion
          :parameters (#q3 #q2 o10 #g7)
          :precondition (and (isconf #q3) (isconf #q2) (isgrasp o10 #g7))
          :effect (isholdingmotion #q3 #t521 #q2 o10 #g7)
   )
   (:action s546_plan-holding-motion
          :parameters (#q3 #q2 o10 #g8)
          :precondition (and (isconf #q3) (isconf #q2) (isgrasp o10 #g8))
          :effect (isholdingmotion #q3 #t522 #q2 o10 #g8)
   )
   (:action s547_plan-holding-motion
          :parameters (#q3 #q3 o8 #g0)
          :precondition (and (isconf #q3) (isconf #q3) (isgrasp o8 #g0))
          :effect (isholdingmotion #q3 #t523 #q3 o8 #g0)
   )
   (:action s548_plan-holding-motion
          :parameters (#q3 #q3 o9 #g1)
          :precondition (and (isconf #q3) (isconf #q3) (isgrasp o9 #g1))
          :effect (isholdingmotion #q3 #t524 #q3 o9 #g1)
   )
   (:action s549_plan-holding-motion
          :parameters (#q3 #q3 o10 #g2)
          :precondition (and (isconf #q3) (isconf #q3) (isgrasp o10 #g2))
          :effect (isholdingmotion #q3 #t525 #q3 o10 #g2)
   )
   (:action s550_plan-holding-motion
          :parameters (#q3 #q3 o8 #g3)
          :precondition (and (isconf #q3) (isconf #q3) (isgrasp o8 #g3))
          :effect (isholdingmotion #q3 #t526 #q3 o8 #g3)
   )
   (:action s551_plan-holding-motion
          :parameters (#q3 #q3 o8 #g4)
          :precondition (and (isconf #q3) (isconf #q3) (isgrasp o8 #g4))
          :effect (isholdingmotion #q3 #t527 #q3 o8 #g4)
   )
   (:action s552_plan-holding-motion
          :parameters (#q3 #q3 o9 #g5)
          :precondition (and (isconf #q3) (isconf #q3) (isgrasp o9 #g5))
          :effect (isholdingmotion #q3 #t528 #q3 o9 #g5)
   )
   (:action s553_plan-holding-motion
          :parameters (#q3 #q3 o9 #g6)
          :precondition (and (isconf #q3) (isconf #q3) (isgrasp o9 #g6))
          :effect (isholdingmotion #q3 #t529 #q3 o9 #g6)
   )
   (:action s554_plan-holding-motion
          :parameters (#q3 #q3 o10 #g7)
          :precondition (and (isconf #q3) (isconf #q3) (isgrasp o10 #g7))
          :effect (isholdingmotion #q3 #t530 #q3 o10 #g7)
   )
   (:action s555_plan-holding-motion
          :parameters (#q3 #q3 o10 #g8)
          :precondition (and (isconf #q3) (isconf #q3) (isgrasp o10 #g8))
          :effect (isholdingmotion #q3 #t531 #q3 o10 #g8)
   )
   (:action s556_plan-holding-motion
          :parameters (#q3 #q4 o8 #g0)
          :precondition (and (isconf #q3) (isconf #q4) (isgrasp o8 #g0))
          :effect (isholdingmotion #q3 #t532 #q4 o8 #g0)
   )
   (:action s557_plan-holding-motion
          :parameters (#q3 #q4 o9 #g1)
          :precondition (and (isconf #q3) (isconf #q4) (isgrasp o9 #g1))
          :effect (isholdingmotion #q3 #t533 #q4 o9 #g1)
   )
   (:action s558_plan-holding-motion
          :parameters (#q3 #q4 o10 #g2)
          :precondition (and (isconf #q3) (isconf #q4) (isgrasp o10 #g2))
          :effect (isholdingmotion #q3 #t534 #q4 o10 #g2)
   )
   (:action s559_plan-holding-motion
          :parameters (#q3 #q4 o8 #g3)
          :precondition (and (isconf #q3) (isconf #q4) (isgrasp o8 #g3))
          :effect (isholdingmotion #q3 #t535 #q4 o8 #g3)
   )
   (:action s560_plan-holding-motion
          :parameters (#q3 #q4 o8 #g4)
          :precondition (and (isconf #q3) (isconf #q4) (isgrasp o8 #g4))
          :effect (isholdingmotion #q3 #t536 #q4 o8 #g4)
   )
   (:action s561_plan-holding-motion
          :parameters (#q3 #q4 o9 #g5)
          :precondition (and (isconf #q3) (isconf #q4) (isgrasp o9 #g5))
          :effect (isholdingmotion #q3 #t537 #q4 o9 #g5)
   )
   (:action s562_plan-holding-motion
          :parameters (#q3 #q4 o9 #g6)
          :precondition (and (isconf #q3) (isconf #q4) (isgrasp o9 #g6))
          :effect (isholdingmotion #q3 #t538 #q4 o9 #g6)
   )
   (:action s563_plan-holding-motion
          :parameters (#q3 #q4 o10 #g7)
          :precondition (and (isconf #q3) (isconf #q4) (isgrasp o10 #g7))
          :effect (isholdingmotion #q3 #t539 #q4 o10 #g7)
   )
   (:action s564_plan-holding-motion
          :parameters (#q3 #q4 o10 #g8)
          :precondition (and (isconf #q3) (isconf #q4) (isgrasp o10 #g8))
          :effect (isholdingmotion #q3 #t540 #q4 o10 #g8)
   )
   (:action s565_plan-holding-motion
          :parameters (#q3 #q5 o8 #g0)
          :precondition (and (isconf #q3) (isconf #q5) (isgrasp o8 #g0))
          :effect (isholdingmotion #q3 #t541 #q5 o8 #g0)
   )
   (:action s566_plan-holding-motion
          :parameters (#q3 #q5 o9 #g1)
          :precondition (and (isconf #q3) (isconf #q5) (isgrasp o9 #g1))
          :effect (isholdingmotion #q3 #t542 #q5 o9 #g1)
   )
   (:action s567_plan-holding-motion
          :parameters (#q3 #q5 o10 #g2)
          :precondition (and (isconf #q3) (isconf #q5) (isgrasp o10 #g2))
          :effect (isholdingmotion #q3 #t543 #q5 o10 #g2)
   )
   (:action s568_plan-holding-motion
          :parameters (#q3 #q5 o8 #g3)
          :precondition (and (isconf #q3) (isconf #q5) (isgrasp o8 #g3))
          :effect (isholdingmotion #q3 #t544 #q5 o8 #g3)
   )
   (:action s569_plan-holding-motion
          :parameters (#q3 #q5 o8 #g4)
          :precondition (and (isconf #q3) (isconf #q5) (isgrasp o8 #g4))
          :effect (isholdingmotion #q3 #t545 #q5 o8 #g4)
   )
   (:action s570_plan-holding-motion
          :parameters (#q3 #q5 o9 #g5)
          :precondition (and (isconf #q3) (isconf #q5) (isgrasp o9 #g5))
          :effect (isholdingmotion #q3 #t546 #q5 o9 #g5)
   )
   (:action s571_plan-holding-motion
          :parameters (#q3 #q5 o9 #g6)
          :precondition (and (isconf #q3) (isconf #q5) (isgrasp o9 #g6))
          :effect (isholdingmotion #q3 #t547 #q5 o9 #g6)
   )
   (:action s572_plan-holding-motion
          :parameters (#q3 #q5 o10 #g7)
          :precondition (and (isconf #q3) (isconf #q5) (isgrasp o10 #g7))
          :effect (isholdingmotion #q3 #t548 #q5 o10 #g7)
   )
   (:action s573_plan-holding-motion
          :parameters (#q3 #q5 o10 #g8)
          :precondition (and (isconf #q3) (isconf #q5) (isgrasp o10 #g8))
          :effect (isholdingmotion #q3 #t549 #q5 o10 #g8)
   )
   (:action s574_plan-holding-motion
          :parameters (#q3 #q6 o8 #g0)
          :precondition (and (isconf #q3) (isconf #q6) (isgrasp o8 #g0))
          :effect (isholdingmotion #q3 #t550 #q6 o8 #g0)
   )
   (:action s575_plan-holding-motion
          :parameters (#q3 #q6 o9 #g1)
          :precondition (and (isconf #q3) (isconf #q6) (isgrasp o9 #g1))
          :effect (isholdingmotion #q3 #t551 #q6 o9 #g1)
   )
   (:action s576_plan-holding-motion
          :parameters (#q3 #q6 o10 #g2)
          :precondition (and (isconf #q3) (isconf #q6) (isgrasp o10 #g2))
          :effect (isholdingmotion #q3 #t552 #q6 o10 #g2)
   )
   (:action s577_plan-holding-motion
          :parameters (#q3 #q6 o8 #g3)
          :precondition (and (isconf #q3) (isconf #q6) (isgrasp o8 #g3))
          :effect (isholdingmotion #q3 #t553 #q6 o8 #g3)
   )
   (:action s578_plan-holding-motion
          :parameters (#q3 #q6 o8 #g4)
          :precondition (and (isconf #q3) (isconf #q6) (isgrasp o8 #g4))
          :effect (isholdingmotion #q3 #t554 #q6 o8 #g4)
   )
   (:action s579_plan-holding-motion
          :parameters (#q3 #q6 o9 #g5)
          :precondition (and (isconf #q3) (isconf #q6) (isgrasp o9 #g5))
          :effect (isholdingmotion #q3 #t555 #q6 o9 #g5)
   )
   (:action s580_plan-holding-motion
          :parameters (#q3 #q6 o9 #g6)
          :precondition (and (isconf #q3) (isconf #q6) (isgrasp o9 #g6))
          :effect (isholdingmotion #q3 #t556 #q6 o9 #g6)
   )
   (:action s581_plan-holding-motion
          :parameters (#q3 #q6 o10 #g7)
          :precondition (and (isconf #q3) (isconf #q6) (isgrasp o10 #g7))
          :effect (isholdingmotion #q3 #t557 #q6 o10 #g7)
   )
   (:action s582_plan-holding-motion
          :parameters (#q3 #q6 o10 #g8)
          :precondition (and (isconf #q3) (isconf #q6) (isgrasp o10 #g8))
          :effect (isholdingmotion #q3 #t558 #q6 o10 #g8)
   )
   (:action s583_plan-holding-motion
          :parameters (#q3 #q7 o8 #g0)
          :precondition (and (isconf #q3) (isconf #q7) (isgrasp o8 #g0))
          :effect (isholdingmotion #q3 #t559 #q7 o8 #g0)
   )
   (:action s584_plan-holding-motion
          :parameters (#q3 #q7 o9 #g1)
          :precondition (and (isconf #q3) (isconf #q7) (isgrasp o9 #g1))
          :effect (isholdingmotion #q3 #t560 #q7 o9 #g1)
   )
   (:action s585_plan-holding-motion
          :parameters (#q3 #q7 o10 #g2)
          :precondition (and (isconf #q3) (isconf #q7) (isgrasp o10 #g2))
          :effect (isholdingmotion #q3 #t561 #q7 o10 #g2)
   )
   (:action s586_plan-holding-motion
          :parameters (#q3 #q7 o8 #g3)
          :precondition (and (isconf #q3) (isconf #q7) (isgrasp o8 #g3))
          :effect (isholdingmotion #q3 #t562 #q7 o8 #g3)
   )
   (:action s587_plan-holding-motion
          :parameters (#q3 #q7 o8 #g4)
          :precondition (and (isconf #q3) (isconf #q7) (isgrasp o8 #g4))
          :effect (isholdingmotion #q3 #t563 #q7 o8 #g4)
   )
   (:action s588_plan-holding-motion
          :parameters (#q3 #q7 o9 #g5)
          :precondition (and (isconf #q3) (isconf #q7) (isgrasp o9 #g5))
          :effect (isholdingmotion #q3 #t564 #q7 o9 #g5)
   )
   (:action s589_plan-holding-motion
          :parameters (#q3 #q7 o9 #g6)
          :precondition (and (isconf #q3) (isconf #q7) (isgrasp o9 #g6))
          :effect (isholdingmotion #q3 #t565 #q7 o9 #g6)
   )
   (:action s590_plan-holding-motion
          :parameters (#q3 #q7 o10 #g7)
          :precondition (and (isconf #q3) (isconf #q7) (isgrasp o10 #g7))
          :effect (isholdingmotion #q3 #t566 #q7 o10 #g7)
   )
   (:action s591_plan-holding-motion
          :parameters (#q3 #q7 o10 #g8)
          :precondition (and (isconf #q3) (isconf #q7) (isgrasp o10 #g8))
          :effect (isholdingmotion #q3 #t567 #q7 o10 #g8)
   )
   (:action s592_plan-holding-motion
          :parameters (#q3 #q8 o8 #g0)
          :precondition (and (isconf #q3) (isconf #q8) (isgrasp o8 #g0))
          :effect (isholdingmotion #q3 #t568 #q8 o8 #g0)
   )
   (:action s593_plan-holding-motion
          :parameters (#q3 #q8 o9 #g1)
          :precondition (and (isconf #q3) (isconf #q8) (isgrasp o9 #g1))
          :effect (isholdingmotion #q3 #t569 #q8 o9 #g1)
   )
   (:action s594_plan-holding-motion
          :parameters (#q3 #q8 o10 #g2)
          :precondition (and (isconf #q3) (isconf #q8) (isgrasp o10 #g2))
          :effect (isholdingmotion #q3 #t570 #q8 o10 #g2)
   )
   (:action s595_plan-holding-motion
          :parameters (#q3 #q8 o8 #g3)
          :precondition (and (isconf #q3) (isconf #q8) (isgrasp o8 #g3))
          :effect (isholdingmotion #q3 #t571 #q8 o8 #g3)
   )
   (:action s596_plan-holding-motion
          :parameters (#q3 #q8 o8 #g4)
          :precondition (and (isconf #q3) (isconf #q8) (isgrasp o8 #g4))
          :effect (isholdingmotion #q3 #t572 #q8 o8 #g4)
   )
   (:action s597_plan-holding-motion
          :parameters (#q3 #q8 o9 #g5)
          :precondition (and (isconf #q3) (isconf #q8) (isgrasp o9 #g5))
          :effect (isholdingmotion #q3 #t573 #q8 o9 #g5)
   )
   (:action s598_plan-holding-motion
          :parameters (#q3 #q8 o9 #g6)
          :precondition (and (isconf #q3) (isconf #q8) (isgrasp o9 #g6))
          :effect (isholdingmotion #q3 #t574 #q8 o9 #g6)
   )
   (:action s599_plan-holding-motion
          :parameters (#q3 #q8 o10 #g7)
          :precondition (and (isconf #q3) (isconf #q8) (isgrasp o10 #g7))
          :effect (isholdingmotion #q3 #t575 #q8 o10 #g7)
   )
   (:action s600_plan-holding-motion
          :parameters (#q3 #q8 o10 #g8)
          :precondition (and (isconf #q3) (isconf #q8) (isgrasp o10 #g8))
          :effect (isholdingmotion #q3 #t576 #q8 o10 #g8)
   )
   (:action s601_plan-holding-motion
          :parameters (#q4 q40 o8 #g0)
          :precondition (and (isconf #q4) (isconf q40) (isgrasp o8 #g0))
          :effect (isholdingmotion #q4 #t577 q40 o8 #g0)
   )
   (:action s602_plan-holding-motion
          :parameters (#q4 q40 o9 #g1)
          :precondition (and (isconf #q4) (isconf q40) (isgrasp o9 #g1))
          :effect (isholdingmotion #q4 #t578 q40 o9 #g1)
   )
   (:action s603_plan-holding-motion
          :parameters (#q4 q40 o10 #g2)
          :precondition (and (isconf #q4) (isconf q40) (isgrasp o10 #g2))
          :effect (isholdingmotion #q4 #t579 q40 o10 #g2)
   )
   (:action s604_plan-holding-motion
          :parameters (#q4 q40 o8 #g3)
          :precondition (and (isconf #q4) (isconf q40) (isgrasp o8 #g3))
          :effect (isholdingmotion #q4 #t580 q40 o8 #g3)
   )
   (:action s605_plan-holding-motion
          :parameters (#q4 q40 o8 #g4)
          :precondition (and (isconf #q4) (isconf q40) (isgrasp o8 #g4))
          :effect (isholdingmotion #q4 #t581 q40 o8 #g4)
   )
   (:action s606_plan-holding-motion
          :parameters (#q4 q40 o9 #g5)
          :precondition (and (isconf #q4) (isconf q40) (isgrasp o9 #g5))
          :effect (isholdingmotion #q4 #t582 q40 o9 #g5)
   )
   (:action s607_plan-holding-motion
          :parameters (#q4 q40 o9 #g6)
          :precondition (and (isconf #q4) (isconf q40) (isgrasp o9 #g6))
          :effect (isholdingmotion #q4 #t583 q40 o9 #g6)
   )
   (:action s608_plan-holding-motion
          :parameters (#q4 q40 o10 #g7)
          :precondition (and (isconf #q4) (isconf q40) (isgrasp o10 #g7))
          :effect (isholdingmotion #q4 #t584 q40 o10 #g7)
   )
   (:action s609_plan-holding-motion
          :parameters (#q4 q40 o10 #g8)
          :precondition (and (isconf #q4) (isconf q40) (isgrasp o10 #g8))
          :effect (isholdingmotion #q4 #t585 q40 o10 #g8)
   )
   (:action s610_plan-holding-motion
          :parameters (#q4 #q0 o8 #g0)
          :precondition (and (isconf #q4) (isconf #q0) (isgrasp o8 #g0))
          :effect (isholdingmotion #q4 #t586 #q0 o8 #g0)
   )
   (:action s611_plan-holding-motion
          :parameters (#q4 #q0 o9 #g1)
          :precondition (and (isconf #q4) (isconf #q0) (isgrasp o9 #g1))
          :effect (isholdingmotion #q4 #t587 #q0 o9 #g1)
   )
   (:action s612_plan-holding-motion
          :parameters (#q4 #q0 o10 #g2)
          :precondition (and (isconf #q4) (isconf #q0) (isgrasp o10 #g2))
          :effect (isholdingmotion #q4 #t588 #q0 o10 #g2)
   )
   (:action s613_plan-holding-motion
          :parameters (#q4 #q0 o8 #g3)
          :precondition (and (isconf #q4) (isconf #q0) (isgrasp o8 #g3))
          :effect (isholdingmotion #q4 #t589 #q0 o8 #g3)
   )
   (:action s614_plan-holding-motion
          :parameters (#q4 #q0 o8 #g4)
          :precondition (and (isconf #q4) (isconf #q0) (isgrasp o8 #g4))
          :effect (isholdingmotion #q4 #t590 #q0 o8 #g4)
   )
   (:action s615_plan-holding-motion
          :parameters (#q4 #q0 o9 #g5)
          :precondition (and (isconf #q4) (isconf #q0) (isgrasp o9 #g5))
          :effect (isholdingmotion #q4 #t591 #q0 o9 #g5)
   )
   (:action s616_plan-holding-motion
          :parameters (#q4 #q0 o9 #g6)
          :precondition (and (isconf #q4) (isconf #q0) (isgrasp o9 #g6))
          :effect (isholdingmotion #q4 #t592 #q0 o9 #g6)
   )
   (:action s617_plan-holding-motion
          :parameters (#q4 #q0 o10 #g7)
          :precondition (and (isconf #q4) (isconf #q0) (isgrasp o10 #g7))
          :effect (isholdingmotion #q4 #t593 #q0 o10 #g7)
   )
   (:action s618_plan-holding-motion
          :parameters (#q4 #q0 o10 #g8)
          :precondition (and (isconf #q4) (isconf #q0) (isgrasp o10 #g8))
          :effect (isholdingmotion #q4 #t594 #q0 o10 #g8)
   )
   (:action s619_plan-holding-motion
          :parameters (#q4 #q1 o8 #g0)
          :precondition (and (isconf #q4) (isconf #q1) (isgrasp o8 #g0))
          :effect (isholdingmotion #q4 #t595 #q1 o8 #g0)
   )
   (:action s620_plan-holding-motion
          :parameters (#q4 #q1 o9 #g1)
          :precondition (and (isconf #q4) (isconf #q1) (isgrasp o9 #g1))
          :effect (isholdingmotion #q4 #t596 #q1 o9 #g1)
   )
   (:action s621_plan-holding-motion
          :parameters (#q4 #q1 o10 #g2)
          :precondition (and (isconf #q4) (isconf #q1) (isgrasp o10 #g2))
          :effect (isholdingmotion #q4 #t597 #q1 o10 #g2)
   )
   (:action s622_plan-holding-motion
          :parameters (#q4 #q1 o8 #g3)
          :precondition (and (isconf #q4) (isconf #q1) (isgrasp o8 #g3))
          :effect (isholdingmotion #q4 #t598 #q1 o8 #g3)
   )
   (:action s623_plan-holding-motion
          :parameters (#q4 #q1 o8 #g4)
          :precondition (and (isconf #q4) (isconf #q1) (isgrasp o8 #g4))
          :effect (isholdingmotion #q4 #t599 #q1 o8 #g4)
   )
   (:action s624_plan-holding-motion
          :parameters (#q4 #q1 o9 #g5)
          :precondition (and (isconf #q4) (isconf #q1) (isgrasp o9 #g5))
          :effect (isholdingmotion #q4 #t600 #q1 o9 #g5)
   )
   (:action s625_plan-holding-motion
          :parameters (#q4 #q1 o9 #g6)
          :precondition (and (isconf #q4) (isconf #q1) (isgrasp o9 #g6))
          :effect (isholdingmotion #q4 #t601 #q1 o9 #g6)
   )
   (:action s626_plan-holding-motion
          :parameters (#q4 #q1 o10 #g7)
          :precondition (and (isconf #q4) (isconf #q1) (isgrasp o10 #g7))
          :effect (isholdingmotion #q4 #t602 #q1 o10 #g7)
   )
   (:action s627_plan-holding-motion
          :parameters (#q4 #q1 o10 #g8)
          :precondition (and (isconf #q4) (isconf #q1) (isgrasp o10 #g8))
          :effect (isholdingmotion #q4 #t603 #q1 o10 #g8)
   )
   (:action s628_plan-holding-motion
          :parameters (#q4 #q2 o8 #g0)
          :precondition (and (isconf #q4) (isconf #q2) (isgrasp o8 #g0))
          :effect (isholdingmotion #q4 #t604 #q2 o8 #g0)
   )
   (:action s629_plan-holding-motion
          :parameters (#q4 #q2 o9 #g1)
          :precondition (and (isconf #q4) (isconf #q2) (isgrasp o9 #g1))
          :effect (isholdingmotion #q4 #t605 #q2 o9 #g1)
   )
   (:action s630_plan-holding-motion
          :parameters (#q4 #q2 o10 #g2)
          :precondition (and (isconf #q4) (isconf #q2) (isgrasp o10 #g2))
          :effect (isholdingmotion #q4 #t606 #q2 o10 #g2)
   )
   (:action s631_plan-holding-motion
          :parameters (#q4 #q2 o8 #g3)
          :precondition (and (isconf #q4) (isconf #q2) (isgrasp o8 #g3))
          :effect (isholdingmotion #q4 #t607 #q2 o8 #g3)
   )
   (:action s632_plan-holding-motion
          :parameters (#q4 #q2 o8 #g4)
          :precondition (and (isconf #q4) (isconf #q2) (isgrasp o8 #g4))
          :effect (isholdingmotion #q4 #t608 #q2 o8 #g4)
   )
   (:action s633_plan-holding-motion
          :parameters (#q4 #q2 o9 #g5)
          :precondition (and (isconf #q4) (isconf #q2) (isgrasp o9 #g5))
          :effect (isholdingmotion #q4 #t609 #q2 o9 #g5)
   )
   (:action s634_plan-holding-motion
          :parameters (#q4 #q2 o9 #g6)
          :precondition (and (isconf #q4) (isconf #q2) (isgrasp o9 #g6))
          :effect (isholdingmotion #q4 #t610 #q2 o9 #g6)
   )
   (:action s635_plan-holding-motion
          :parameters (#q4 #q2 o10 #g7)
          :precondition (and (isconf #q4) (isconf #q2) (isgrasp o10 #g7))
          :effect (isholdingmotion #q4 #t611 #q2 o10 #g7)
   )
   (:action s636_plan-holding-motion
          :parameters (#q4 #q2 o10 #g8)
          :precondition (and (isconf #q4) (isconf #q2) (isgrasp o10 #g8))
          :effect (isholdingmotion #q4 #t612 #q2 o10 #g8)
   )
   (:action s637_plan-holding-motion
          :parameters (#q4 #q3 o8 #g0)
          :precondition (and (isconf #q4) (isconf #q3) (isgrasp o8 #g0))
          :effect (isholdingmotion #q4 #t613 #q3 o8 #g0)
   )
   (:action s638_plan-holding-motion
          :parameters (#q4 #q3 o9 #g1)
          :precondition (and (isconf #q4) (isconf #q3) (isgrasp o9 #g1))
          :effect (isholdingmotion #q4 #t614 #q3 o9 #g1)
   )
   (:action s639_plan-holding-motion
          :parameters (#q4 #q3 o10 #g2)
          :precondition (and (isconf #q4) (isconf #q3) (isgrasp o10 #g2))
          :effect (isholdingmotion #q4 #t615 #q3 o10 #g2)
   )
   (:action s640_plan-holding-motion
          :parameters (#q4 #q3 o8 #g3)
          :precondition (and (isconf #q4) (isconf #q3) (isgrasp o8 #g3))
          :effect (isholdingmotion #q4 #t616 #q3 o8 #g3)
   )
   (:action s641_plan-holding-motion
          :parameters (#q4 #q3 o8 #g4)
          :precondition (and (isconf #q4) (isconf #q3) (isgrasp o8 #g4))
          :effect (isholdingmotion #q4 #t617 #q3 o8 #g4)
   )
   (:action s642_plan-holding-motion
          :parameters (#q4 #q3 o9 #g5)
          :precondition (and (isconf #q4) (isconf #q3) (isgrasp o9 #g5))
          :effect (isholdingmotion #q4 #t618 #q3 o9 #g5)
   )
   (:action s643_plan-holding-motion
          :parameters (#q4 #q3 o9 #g6)
          :precondition (and (isconf #q4) (isconf #q3) (isgrasp o9 #g6))
          :effect (isholdingmotion #q4 #t619 #q3 o9 #g6)
   )
   (:action s644_plan-holding-motion
          :parameters (#q4 #q3 o10 #g7)
          :precondition (and (isconf #q4) (isconf #q3) (isgrasp o10 #g7))
          :effect (isholdingmotion #q4 #t620 #q3 o10 #g7)
   )
   (:action s645_plan-holding-motion
          :parameters (#q4 #q3 o10 #g8)
          :precondition (and (isconf #q4) (isconf #q3) (isgrasp o10 #g8))
          :effect (isholdingmotion #q4 #t621 #q3 o10 #g8)
   )
   (:action s646_plan-holding-motion
          :parameters (#q4 #q4 o8 #g0)
          :precondition (and (isconf #q4) (isconf #q4) (isgrasp o8 #g0))
          :effect (isholdingmotion #q4 #t622 #q4 o8 #g0)
   )
   (:action s647_plan-holding-motion
          :parameters (#q4 #q4 o9 #g1)
          :precondition (and (isconf #q4) (isconf #q4) (isgrasp o9 #g1))
          :effect (isholdingmotion #q4 #t623 #q4 o9 #g1)
   )
   (:action s648_plan-holding-motion
          :parameters (#q4 #q4 o10 #g2)
          :precondition (and (isconf #q4) (isconf #q4) (isgrasp o10 #g2))
          :effect (isholdingmotion #q4 #t624 #q4 o10 #g2)
   )
   (:action s649_plan-holding-motion
          :parameters (#q4 #q4 o8 #g3)
          :precondition (and (isconf #q4) (isconf #q4) (isgrasp o8 #g3))
          :effect (isholdingmotion #q4 #t625 #q4 o8 #g3)
   )
   (:action s650_plan-holding-motion
          :parameters (#q4 #q4 o8 #g4)
          :precondition (and (isconf #q4) (isconf #q4) (isgrasp o8 #g4))
          :effect (isholdingmotion #q4 #t626 #q4 o8 #g4)
   )
   (:action s651_plan-holding-motion
          :parameters (#q4 #q4 o9 #g5)
          :precondition (and (isconf #q4) (isconf #q4) (isgrasp o9 #g5))
          :effect (isholdingmotion #q4 #t627 #q4 o9 #g5)
   )
   (:action s652_plan-holding-motion
          :parameters (#q4 #q4 o9 #g6)
          :precondition (and (isconf #q4) (isconf #q4) (isgrasp o9 #g6))
          :effect (isholdingmotion #q4 #t628 #q4 o9 #g6)
   )
   (:action s653_plan-holding-motion
          :parameters (#q4 #q4 o10 #g7)
          :precondition (and (isconf #q4) (isconf #q4) (isgrasp o10 #g7))
          :effect (isholdingmotion #q4 #t629 #q4 o10 #g7)
   )
   (:action s654_plan-holding-motion
          :parameters (#q4 #q4 o10 #g8)
          :precondition (and (isconf #q4) (isconf #q4) (isgrasp o10 #g8))
          :effect (isholdingmotion #q4 #t630 #q4 o10 #g8)
   )
   (:action s655_plan-holding-motion
          :parameters (#q4 #q5 o8 #g0)
          :precondition (and (isconf #q4) (isconf #q5) (isgrasp o8 #g0))
          :effect (isholdingmotion #q4 #t631 #q5 o8 #g0)
   )
   (:action s656_plan-holding-motion
          :parameters (#q4 #q5 o9 #g1)
          :precondition (and (isconf #q4) (isconf #q5) (isgrasp o9 #g1))
          :effect (isholdingmotion #q4 #t632 #q5 o9 #g1)
   )
   (:action s657_plan-holding-motion
          :parameters (#q4 #q5 o10 #g2)
          :precondition (and (isconf #q4) (isconf #q5) (isgrasp o10 #g2))
          :effect (isholdingmotion #q4 #t633 #q5 o10 #g2)
   )
   (:action s658_plan-holding-motion
          :parameters (#q4 #q5 o8 #g3)
          :precondition (and (isconf #q4) (isconf #q5) (isgrasp o8 #g3))
          :effect (isholdingmotion #q4 #t634 #q5 o8 #g3)
   )
   (:action s659_plan-holding-motion
          :parameters (#q4 #q5 o8 #g4)
          :precondition (and (isconf #q4) (isconf #q5) (isgrasp o8 #g4))
          :effect (isholdingmotion #q4 #t635 #q5 o8 #g4)
   )
   (:action s660_plan-holding-motion
          :parameters (#q4 #q5 o9 #g5)
          :precondition (and (isconf #q4) (isconf #q5) (isgrasp o9 #g5))
          :effect (isholdingmotion #q4 #t636 #q5 o9 #g5)
   )
   (:action s661_plan-holding-motion
          :parameters (#q4 #q5 o9 #g6)
          :precondition (and (isconf #q4) (isconf #q5) (isgrasp o9 #g6))
          :effect (isholdingmotion #q4 #t637 #q5 o9 #g6)
   )
   (:action s662_plan-holding-motion
          :parameters (#q4 #q5 o10 #g7)
          :precondition (and (isconf #q4) (isconf #q5) (isgrasp o10 #g7))
          :effect (isholdingmotion #q4 #t638 #q5 o10 #g7)
   )
   (:action s663_plan-holding-motion
          :parameters (#q4 #q5 o10 #g8)
          :precondition (and (isconf #q4) (isconf #q5) (isgrasp o10 #g8))
          :effect (isholdingmotion #q4 #t639 #q5 o10 #g8)
   )
   (:action s664_plan-holding-motion
          :parameters (#q4 #q6 o8 #g0)
          :precondition (and (isconf #q4) (isconf #q6) (isgrasp o8 #g0))
          :effect (isholdingmotion #q4 #t640 #q6 o8 #g0)
   )
   (:action s665_plan-holding-motion
          :parameters (#q4 #q6 o9 #g1)
          :precondition (and (isconf #q4) (isconf #q6) (isgrasp o9 #g1))
          :effect (isholdingmotion #q4 #t641 #q6 o9 #g1)
   )
   (:action s666_plan-holding-motion
          :parameters (#q4 #q6 o10 #g2)
          :precondition (and (isconf #q4) (isconf #q6) (isgrasp o10 #g2))
          :effect (isholdingmotion #q4 #t642 #q6 o10 #g2)
   )
   (:action s667_plan-holding-motion
          :parameters (#q4 #q6 o8 #g3)
          :precondition (and (isconf #q4) (isconf #q6) (isgrasp o8 #g3))
          :effect (isholdingmotion #q4 #t643 #q6 o8 #g3)
   )
   (:action s668_plan-holding-motion
          :parameters (#q4 #q6 o8 #g4)
          :precondition (and (isconf #q4) (isconf #q6) (isgrasp o8 #g4))
          :effect (isholdingmotion #q4 #t644 #q6 o8 #g4)
   )
   (:action s669_plan-holding-motion
          :parameters (#q4 #q6 o9 #g5)
          :precondition (and (isconf #q4) (isconf #q6) (isgrasp o9 #g5))
          :effect (isholdingmotion #q4 #t645 #q6 o9 #g5)
   )
   (:action s670_plan-holding-motion
          :parameters (#q4 #q6 o9 #g6)
          :precondition (and (isconf #q4) (isconf #q6) (isgrasp o9 #g6))
          :effect (isholdingmotion #q4 #t646 #q6 o9 #g6)
   )
   (:action s671_plan-holding-motion
          :parameters (#q4 #q6 o10 #g7)
          :precondition (and (isconf #q4) (isconf #q6) (isgrasp o10 #g7))
          :effect (isholdingmotion #q4 #t647 #q6 o10 #g7)
   )
   (:action s672_plan-holding-motion
          :parameters (#q4 #q6 o10 #g8)
          :precondition (and (isconf #q4) (isconf #q6) (isgrasp o10 #g8))
          :effect (isholdingmotion #q4 #t648 #q6 o10 #g8)
   )
   (:action s673_plan-holding-motion
          :parameters (#q4 #q7 o8 #g0)
          :precondition (and (isconf #q4) (isconf #q7) (isgrasp o8 #g0))
          :effect (isholdingmotion #q4 #t649 #q7 o8 #g0)
   )
   (:action s674_plan-holding-motion
          :parameters (#q4 #q7 o9 #g1)
          :precondition (and (isconf #q4) (isconf #q7) (isgrasp o9 #g1))
          :effect (isholdingmotion #q4 #t650 #q7 o9 #g1)
   )
   (:action s675_plan-holding-motion
          :parameters (#q4 #q7 o10 #g2)
          :precondition (and (isconf #q4) (isconf #q7) (isgrasp o10 #g2))
          :effect (isholdingmotion #q4 #t651 #q7 o10 #g2)
   )
   (:action s676_plan-holding-motion
          :parameters (#q4 #q7 o8 #g3)
          :precondition (and (isconf #q4) (isconf #q7) (isgrasp o8 #g3))
          :effect (isholdingmotion #q4 #t652 #q7 o8 #g3)
   )
   (:action s677_plan-holding-motion
          :parameters (#q4 #q7 o8 #g4)
          :precondition (and (isconf #q4) (isconf #q7) (isgrasp o8 #g4))
          :effect (isholdingmotion #q4 #t653 #q7 o8 #g4)
   )
   (:action s678_plan-holding-motion
          :parameters (#q4 #q7 o9 #g5)
          :precondition (and (isconf #q4) (isconf #q7) (isgrasp o9 #g5))
          :effect (isholdingmotion #q4 #t654 #q7 o9 #g5)
   )
   (:action s679_plan-holding-motion
          :parameters (#q4 #q7 o9 #g6)
          :precondition (and (isconf #q4) (isconf #q7) (isgrasp o9 #g6))
          :effect (isholdingmotion #q4 #t655 #q7 o9 #g6)
   )
   (:action s680_plan-holding-motion
          :parameters (#q4 #q7 o10 #g7)
          :precondition (and (isconf #q4) (isconf #q7) (isgrasp o10 #g7))
          :effect (isholdingmotion #q4 #t656 #q7 o10 #g7)
   )
   (:action s681_plan-holding-motion
          :parameters (#q4 #q7 o10 #g8)
          :precondition (and (isconf #q4) (isconf #q7) (isgrasp o10 #g8))
          :effect (isholdingmotion #q4 #t657 #q7 o10 #g8)
   )
   (:action s682_plan-holding-motion
          :parameters (#q4 #q8 o8 #g0)
          :precondition (and (isconf #q4) (isconf #q8) (isgrasp o8 #g0))
          :effect (isholdingmotion #q4 #t658 #q8 o8 #g0)
   )
   (:action s683_plan-holding-motion
          :parameters (#q4 #q8 o9 #g1)
          :precondition (and (isconf #q4) (isconf #q8) (isgrasp o9 #g1))
          :effect (isholdingmotion #q4 #t659 #q8 o9 #g1)
   )
   (:action s684_plan-holding-motion
          :parameters (#q4 #q8 o10 #g2)
          :precondition (and (isconf #q4) (isconf #q8) (isgrasp o10 #g2))
          :effect (isholdingmotion #q4 #t660 #q8 o10 #g2)
   )
   (:action s685_plan-holding-motion
          :parameters (#q4 #q8 o8 #g3)
          :precondition (and (isconf #q4) (isconf #q8) (isgrasp o8 #g3))
          :effect (isholdingmotion #q4 #t661 #q8 o8 #g3)
   )
   (:action s686_plan-holding-motion
          :parameters (#q4 #q8 o8 #g4)
          :precondition (and (isconf #q4) (isconf #q8) (isgrasp o8 #g4))
          :effect (isholdingmotion #q4 #t662 #q8 o8 #g4)
   )
   (:action s687_plan-holding-motion
          :parameters (#q4 #q8 o9 #g5)
          :precondition (and (isconf #q4) (isconf #q8) (isgrasp o9 #g5))
          :effect (isholdingmotion #q4 #t663 #q8 o9 #g5)
   )
   (:action s688_plan-holding-motion
          :parameters (#q4 #q8 o9 #g6)
          :precondition (and (isconf #q4) (isconf #q8) (isgrasp o9 #g6))
          :effect (isholdingmotion #q4 #t664 #q8 o9 #g6)
   )
   (:action s689_plan-holding-motion
          :parameters (#q4 #q8 o10 #g7)
          :precondition (and (isconf #q4) (isconf #q8) (isgrasp o10 #g7))
          :effect (isholdingmotion #q4 #t665 #q8 o10 #g7)
   )
   (:action s690_plan-holding-motion
          :parameters (#q4 #q8 o10 #g8)
          :precondition (and (isconf #q4) (isconf #q8) (isgrasp o10 #g8))
          :effect (isholdingmotion #q4 #t666 #q8 o10 #g8)
   )
   (:action s691_plan-holding-motion
          :parameters (#q5 q40 o8 #g0)
          :precondition (and (isconf #q5) (isconf q40) (isgrasp o8 #g0))
          :effect (isholdingmotion #q5 #t667 q40 o8 #g0)
   )
   (:action s692_plan-holding-motion
          :parameters (#q5 q40 o9 #g1)
          :precondition (and (isconf #q5) (isconf q40) (isgrasp o9 #g1))
          :effect (isholdingmotion #q5 #t668 q40 o9 #g1)
   )
   (:action s693_plan-holding-motion
          :parameters (#q5 q40 o10 #g2)
          :precondition (and (isconf #q5) (isconf q40) (isgrasp o10 #g2))
          :effect (isholdingmotion #q5 #t669 q40 o10 #g2)
   )
   (:action s694_plan-holding-motion
          :parameters (#q5 q40 o8 #g3)
          :precondition (and (isconf #q5) (isconf q40) (isgrasp o8 #g3))
          :effect (isholdingmotion #q5 #t670 q40 o8 #g3)
   )
   (:action s695_plan-holding-motion
          :parameters (#q5 q40 o8 #g4)
          :precondition (and (isconf #q5) (isconf q40) (isgrasp o8 #g4))
          :effect (isholdingmotion #q5 #t671 q40 o8 #g4)
   )
   (:action s696_plan-holding-motion
          :parameters (#q5 q40 o9 #g5)
          :precondition (and (isconf #q5) (isconf q40) (isgrasp o9 #g5))
          :effect (isholdingmotion #q5 #t672 q40 o9 #g5)
   )
   (:action s697_plan-holding-motion
          :parameters (#q5 q40 o9 #g6)
          :precondition (and (isconf #q5) (isconf q40) (isgrasp o9 #g6))
          :effect (isholdingmotion #q5 #t673 q40 o9 #g6)
   )
   (:action s698_plan-holding-motion
          :parameters (#q5 q40 o10 #g7)
          :precondition (and (isconf #q5) (isconf q40) (isgrasp o10 #g7))
          :effect (isholdingmotion #q5 #t674 q40 o10 #g7)
   )
   (:action s699_plan-holding-motion
          :parameters (#q5 q40 o10 #g8)
          :precondition (and (isconf #q5) (isconf q40) (isgrasp o10 #g8))
          :effect (isholdingmotion #q5 #t675 q40 o10 #g8)
   )
   (:action s700_plan-holding-motion
          :parameters (#q5 #q0 o8 #g0)
          :precondition (and (isconf #q5) (isconf #q0) (isgrasp o8 #g0))
          :effect (isholdingmotion #q5 #t676 #q0 o8 #g0)
   )
   (:action s701_plan-holding-motion
          :parameters (#q5 #q0 o9 #g1)
          :precondition (and (isconf #q5) (isconf #q0) (isgrasp o9 #g1))
          :effect (isholdingmotion #q5 #t677 #q0 o9 #g1)
   )
   (:action s702_plan-holding-motion
          :parameters (#q5 #q0 o10 #g2)
          :precondition (and (isconf #q5) (isconf #q0) (isgrasp o10 #g2))
          :effect (isholdingmotion #q5 #t678 #q0 o10 #g2)
   )
   (:action s703_plan-holding-motion
          :parameters (#q5 #q0 o8 #g3)
          :precondition (and (isconf #q5) (isconf #q0) (isgrasp o8 #g3))
          :effect (isholdingmotion #q5 #t679 #q0 o8 #g3)
   )
   (:action s704_plan-holding-motion
          :parameters (#q5 #q0 o8 #g4)
          :precondition (and (isconf #q5) (isconf #q0) (isgrasp o8 #g4))
          :effect (isholdingmotion #q5 #t680 #q0 o8 #g4)
   )
   (:action s705_plan-holding-motion
          :parameters (#q5 #q0 o9 #g5)
          :precondition (and (isconf #q5) (isconf #q0) (isgrasp o9 #g5))
          :effect (isholdingmotion #q5 #t681 #q0 o9 #g5)
   )
   (:action s706_plan-holding-motion
          :parameters (#q5 #q0 o9 #g6)
          :precondition (and (isconf #q5) (isconf #q0) (isgrasp o9 #g6))
          :effect (isholdingmotion #q5 #t682 #q0 o9 #g6)
   )
   (:action s707_plan-holding-motion
          :parameters (#q5 #q0 o10 #g7)
          :precondition (and (isconf #q5) (isconf #q0) (isgrasp o10 #g7))
          :effect (isholdingmotion #q5 #t683 #q0 o10 #g7)
   )
   (:action s708_plan-holding-motion
          :parameters (#q5 #q0 o10 #g8)
          :precondition (and (isconf #q5) (isconf #q0) (isgrasp o10 #g8))
          :effect (isholdingmotion #q5 #t684 #q0 o10 #g8)
   )
   (:action s709_plan-holding-motion
          :parameters (#q5 #q1 o8 #g0)
          :precondition (and (isconf #q5) (isconf #q1) (isgrasp o8 #g0))
          :effect (isholdingmotion #q5 #t685 #q1 o8 #g0)
   )
   (:action s710_plan-holding-motion
          :parameters (#q5 #q1 o9 #g1)
          :precondition (and (isconf #q5) (isconf #q1) (isgrasp o9 #g1))
          :effect (isholdingmotion #q5 #t686 #q1 o9 #g1)
   )
   (:action s711_plan-holding-motion
          :parameters (#q5 #q1 o10 #g2)
          :precondition (and (isconf #q5) (isconf #q1) (isgrasp o10 #g2))
          :effect (isholdingmotion #q5 #t687 #q1 o10 #g2)
   )
   (:action s712_plan-holding-motion
          :parameters (#q5 #q1 o8 #g3)
          :precondition (and (isconf #q5) (isconf #q1) (isgrasp o8 #g3))
          :effect (isholdingmotion #q5 #t688 #q1 o8 #g3)
   )
   (:action s713_plan-holding-motion
          :parameters (#q5 #q1 o8 #g4)
          :precondition (and (isconf #q5) (isconf #q1) (isgrasp o8 #g4))
          :effect (isholdingmotion #q5 #t689 #q1 o8 #g4)
   )
   (:action s714_plan-holding-motion
          :parameters (#q5 #q1 o9 #g5)
          :precondition (and (isconf #q5) (isconf #q1) (isgrasp o9 #g5))
          :effect (isholdingmotion #q5 #t690 #q1 o9 #g5)
   )
   (:action s715_plan-holding-motion
          :parameters (#q5 #q1 o9 #g6)
          :precondition (and (isconf #q5) (isconf #q1) (isgrasp o9 #g6))
          :effect (isholdingmotion #q5 #t691 #q1 o9 #g6)
   )
   (:action s716_plan-holding-motion
          :parameters (#q5 #q1 o10 #g7)
          :precondition (and (isconf #q5) (isconf #q1) (isgrasp o10 #g7))
          :effect (isholdingmotion #q5 #t692 #q1 o10 #g7)
   )
   (:action s717_plan-holding-motion
          :parameters (#q5 #q1 o10 #g8)
          :precondition (and (isconf #q5) (isconf #q1) (isgrasp o10 #g8))
          :effect (isholdingmotion #q5 #t693 #q1 o10 #g8)
   )
   (:action s718_plan-holding-motion
          :parameters (#q5 #q2 o8 #g0)
          :precondition (and (isconf #q5) (isconf #q2) (isgrasp o8 #g0))
          :effect (isholdingmotion #q5 #t694 #q2 o8 #g0)
   )
   (:action s719_plan-holding-motion
          :parameters (#q5 #q2 o9 #g1)
          :precondition (and (isconf #q5) (isconf #q2) (isgrasp o9 #g1))
          :effect (isholdingmotion #q5 #t695 #q2 o9 #g1)
   )
   (:action s720_plan-holding-motion
          :parameters (#q5 #q2 o10 #g2)
          :precondition (and (isconf #q5) (isconf #q2) (isgrasp o10 #g2))
          :effect (isholdingmotion #q5 #t696 #q2 o10 #g2)
   )
   (:action s721_plan-holding-motion
          :parameters (#q5 #q2 o8 #g3)
          :precondition (and (isconf #q5) (isconf #q2) (isgrasp o8 #g3))
          :effect (isholdingmotion #q5 #t697 #q2 o8 #g3)
   )
   (:action s722_plan-holding-motion
          :parameters (#q5 #q2 o8 #g4)
          :precondition (and (isconf #q5) (isconf #q2) (isgrasp o8 #g4))
          :effect (isholdingmotion #q5 #t698 #q2 o8 #g4)
   )
   (:action s723_plan-holding-motion
          :parameters (#q5 #q2 o9 #g5)
          :precondition (and (isconf #q5) (isconf #q2) (isgrasp o9 #g5))
          :effect (isholdingmotion #q5 #t699 #q2 o9 #g5)
   )
   (:action s724_plan-holding-motion
          :parameters (#q5 #q2 o9 #g6)
          :precondition (and (isconf #q5) (isconf #q2) (isgrasp o9 #g6))
          :effect (isholdingmotion #q5 #t700 #q2 o9 #g6)
   )
   (:action s725_plan-holding-motion
          :parameters (#q5 #q2 o10 #g7)
          :precondition (and (isconf #q5) (isconf #q2) (isgrasp o10 #g7))
          :effect (isholdingmotion #q5 #t701 #q2 o10 #g7)
   )
   (:action s726_plan-holding-motion
          :parameters (#q5 #q2 o10 #g8)
          :precondition (and (isconf #q5) (isconf #q2) (isgrasp o10 #g8))
          :effect (isholdingmotion #q5 #t702 #q2 o10 #g8)
   )
   (:action s727_plan-holding-motion
          :parameters (#q5 #q3 o8 #g0)
          :precondition (and (isconf #q5) (isconf #q3) (isgrasp o8 #g0))
          :effect (isholdingmotion #q5 #t703 #q3 o8 #g0)
   )
   (:action s728_plan-holding-motion
          :parameters (#q5 #q3 o9 #g1)
          :precondition (and (isconf #q5) (isconf #q3) (isgrasp o9 #g1))
          :effect (isholdingmotion #q5 #t704 #q3 o9 #g1)
   )
   (:action s729_plan-holding-motion
          :parameters (#q5 #q3 o10 #g2)
          :precondition (and (isconf #q5) (isconf #q3) (isgrasp o10 #g2))
          :effect (isholdingmotion #q5 #t705 #q3 o10 #g2)
   )
   (:action s730_plan-holding-motion
          :parameters (#q5 #q3 o8 #g3)
          :precondition (and (isconf #q5) (isconf #q3) (isgrasp o8 #g3))
          :effect (isholdingmotion #q5 #t706 #q3 o8 #g3)
   )
   (:action s731_plan-holding-motion
          :parameters (#q5 #q3 o8 #g4)
          :precondition (and (isconf #q5) (isconf #q3) (isgrasp o8 #g4))
          :effect (isholdingmotion #q5 #t707 #q3 o8 #g4)
   )
   (:action s732_plan-holding-motion
          :parameters (#q5 #q3 o9 #g5)
          :precondition (and (isconf #q5) (isconf #q3) (isgrasp o9 #g5))
          :effect (isholdingmotion #q5 #t708 #q3 o9 #g5)
   )
   (:action s733_plan-holding-motion
          :parameters (#q5 #q3 o9 #g6)
          :precondition (and (isconf #q5) (isconf #q3) (isgrasp o9 #g6))
          :effect (isholdingmotion #q5 #t709 #q3 o9 #g6)
   )
   (:action s734_plan-holding-motion
          :parameters (#q5 #q3 o10 #g7)
          :precondition (and (isconf #q5) (isconf #q3) (isgrasp o10 #g7))
          :effect (isholdingmotion #q5 #t710 #q3 o10 #g7)
   )
   (:action s735_plan-holding-motion
          :parameters (#q5 #q3 o10 #g8)
          :precondition (and (isconf #q5) (isconf #q3) (isgrasp o10 #g8))
          :effect (isholdingmotion #q5 #t711 #q3 o10 #g8)
   )
   (:action s736_plan-holding-motion
          :parameters (#q5 #q4 o8 #g0)
          :precondition (and (isconf #q5) (isconf #q4) (isgrasp o8 #g0))
          :effect (isholdingmotion #q5 #t712 #q4 o8 #g0)
   )
   (:action s737_plan-holding-motion
          :parameters (#q5 #q4 o9 #g1)
          :precondition (and (isconf #q5) (isconf #q4) (isgrasp o9 #g1))
          :effect (isholdingmotion #q5 #t713 #q4 o9 #g1)
   )
   (:action s738_plan-holding-motion
          :parameters (#q5 #q4 o10 #g2)
          :precondition (and (isconf #q5) (isconf #q4) (isgrasp o10 #g2))
          :effect (isholdingmotion #q5 #t714 #q4 o10 #g2)
   )
   (:action s739_plan-holding-motion
          :parameters (#q5 #q4 o8 #g3)
          :precondition (and (isconf #q5) (isconf #q4) (isgrasp o8 #g3))
          :effect (isholdingmotion #q5 #t715 #q4 o8 #g3)
   )
   (:action s740_plan-holding-motion
          :parameters (#q5 #q4 o8 #g4)
          :precondition (and (isconf #q5) (isconf #q4) (isgrasp o8 #g4))
          :effect (isholdingmotion #q5 #t716 #q4 o8 #g4)
   )
   (:action s741_plan-holding-motion
          :parameters (#q5 #q4 o9 #g5)
          :precondition (and (isconf #q5) (isconf #q4) (isgrasp o9 #g5))
          :effect (isholdingmotion #q5 #t717 #q4 o9 #g5)
   )
   (:action s742_plan-holding-motion
          :parameters (#q5 #q4 o9 #g6)
          :precondition (and (isconf #q5) (isconf #q4) (isgrasp o9 #g6))
          :effect (isholdingmotion #q5 #t718 #q4 o9 #g6)
   )
   (:action s743_plan-holding-motion
          :parameters (#q5 #q4 o10 #g7)
          :precondition (and (isconf #q5) (isconf #q4) (isgrasp o10 #g7))
          :effect (isholdingmotion #q5 #t719 #q4 o10 #g7)
   )
   (:action s744_plan-holding-motion
          :parameters (#q5 #q4 o10 #g8)
          :precondition (and (isconf #q5) (isconf #q4) (isgrasp o10 #g8))
          :effect (isholdingmotion #q5 #t720 #q4 o10 #g8)
   )
   (:action s745_plan-holding-motion
          :parameters (#q5 #q5 o8 #g0)
          :precondition (and (isconf #q5) (isconf #q5) (isgrasp o8 #g0))
          :effect (isholdingmotion #q5 #t721 #q5 o8 #g0)
   )
   (:action s746_plan-holding-motion
          :parameters (#q5 #q5 o9 #g1)
          :precondition (and (isconf #q5) (isconf #q5) (isgrasp o9 #g1))
          :effect (isholdingmotion #q5 #t722 #q5 o9 #g1)
   )
   (:action s747_plan-holding-motion
          :parameters (#q5 #q5 o10 #g2)
          :precondition (and (isconf #q5) (isconf #q5) (isgrasp o10 #g2))
          :effect (isholdingmotion #q5 #t723 #q5 o10 #g2)
   )
   (:action s748_plan-holding-motion
          :parameters (#q5 #q5 o8 #g3)
          :precondition (and (isconf #q5) (isconf #q5) (isgrasp o8 #g3))
          :effect (isholdingmotion #q5 #t724 #q5 o8 #g3)
   )
   (:action s749_plan-holding-motion
          :parameters (#q5 #q5 o8 #g4)
          :precondition (and (isconf #q5) (isconf #q5) (isgrasp o8 #g4))
          :effect (isholdingmotion #q5 #t725 #q5 o8 #g4)
   )
   (:action s750_plan-holding-motion
          :parameters (#q5 #q5 o9 #g5)
          :precondition (and (isconf #q5) (isconf #q5) (isgrasp o9 #g5))
          :effect (isholdingmotion #q5 #t726 #q5 o9 #g5)
   )
   (:action s751_plan-holding-motion
          :parameters (#q5 #q5 o9 #g6)
          :precondition (and (isconf #q5) (isconf #q5) (isgrasp o9 #g6))
          :effect (isholdingmotion #q5 #t727 #q5 o9 #g6)
   )
   (:action s752_plan-holding-motion
          :parameters (#q5 #q5 o10 #g7)
          :precondition (and (isconf #q5) (isconf #q5) (isgrasp o10 #g7))
          :effect (isholdingmotion #q5 #t728 #q5 o10 #g7)
   )
   (:action s753_plan-holding-motion
          :parameters (#q5 #q5 o10 #g8)
          :precondition (and (isconf #q5) (isconf #q5) (isgrasp o10 #g8))
          :effect (isholdingmotion #q5 #t729 #q5 o10 #g8)
   )
   (:action s754_plan-holding-motion
          :parameters (#q5 #q6 o8 #g0)
          :precondition (and (isconf #q5) (isconf #q6) (isgrasp o8 #g0))
          :effect (isholdingmotion #q5 #t730 #q6 o8 #g0)
   )
   (:action s755_plan-holding-motion
          :parameters (#q5 #q6 o9 #g1)
          :precondition (and (isconf #q5) (isconf #q6) (isgrasp o9 #g1))
          :effect (isholdingmotion #q5 #t731 #q6 o9 #g1)
   )
   (:action s756_plan-holding-motion
          :parameters (#q5 #q6 o10 #g2)
          :precondition (and (isconf #q5) (isconf #q6) (isgrasp o10 #g2))
          :effect (isholdingmotion #q5 #t732 #q6 o10 #g2)
   )
   (:action s757_plan-holding-motion
          :parameters (#q5 #q6 o8 #g3)
          :precondition (and (isconf #q5) (isconf #q6) (isgrasp o8 #g3))
          :effect (isholdingmotion #q5 #t733 #q6 o8 #g3)
   )
   (:action s758_plan-holding-motion
          :parameters (#q5 #q6 o8 #g4)
          :precondition (and (isconf #q5) (isconf #q6) (isgrasp o8 #g4))
          :effect (isholdingmotion #q5 #t734 #q6 o8 #g4)
   )
   (:action s759_plan-holding-motion
          :parameters (#q5 #q6 o9 #g5)
          :precondition (and (isconf #q5) (isconf #q6) (isgrasp o9 #g5))
          :effect (isholdingmotion #q5 #t735 #q6 o9 #g5)
   )
   (:action s760_plan-holding-motion
          :parameters (#q5 #q6 o9 #g6)
          :precondition (and (isconf #q5) (isconf #q6) (isgrasp o9 #g6))
          :effect (isholdingmotion #q5 #t736 #q6 o9 #g6)
   )
   (:action s761_plan-holding-motion
          :parameters (#q5 #q6 o10 #g7)
          :precondition (and (isconf #q5) (isconf #q6) (isgrasp o10 #g7))
          :effect (isholdingmotion #q5 #t737 #q6 o10 #g7)
   )
   (:action s762_plan-holding-motion
          :parameters (#q5 #q6 o10 #g8)
          :precondition (and (isconf #q5) (isconf #q6) (isgrasp o10 #g8))
          :effect (isholdingmotion #q5 #t738 #q6 o10 #g8)
   )
   (:action s763_plan-holding-motion
          :parameters (#q5 #q7 o8 #g0)
          :precondition (and (isconf #q5) (isconf #q7) (isgrasp o8 #g0))
          :effect (isholdingmotion #q5 #t739 #q7 o8 #g0)
   )
   (:action s764_plan-holding-motion
          :parameters (#q5 #q7 o9 #g1)
          :precondition (and (isconf #q5) (isconf #q7) (isgrasp o9 #g1))
          :effect (isholdingmotion #q5 #t740 #q7 o9 #g1)
   )
   (:action s765_plan-holding-motion
          :parameters (#q5 #q7 o10 #g2)
          :precondition (and (isconf #q5) (isconf #q7) (isgrasp o10 #g2))
          :effect (isholdingmotion #q5 #t741 #q7 o10 #g2)
   )
   (:action s766_plan-holding-motion
          :parameters (#q5 #q7 o8 #g3)
          :precondition (and (isconf #q5) (isconf #q7) (isgrasp o8 #g3))
          :effect (isholdingmotion #q5 #t742 #q7 o8 #g3)
   )
   (:action s767_plan-holding-motion
          :parameters (#q5 #q7 o8 #g4)
          :precondition (and (isconf #q5) (isconf #q7) (isgrasp o8 #g4))
          :effect (isholdingmotion #q5 #t743 #q7 o8 #g4)
   )
   (:action s768_plan-holding-motion
          :parameters (#q5 #q7 o9 #g5)
          :precondition (and (isconf #q5) (isconf #q7) (isgrasp o9 #g5))
          :effect (isholdingmotion #q5 #t744 #q7 o9 #g5)
   )
   (:action s769_plan-holding-motion
          :parameters (#q5 #q7 o9 #g6)
          :precondition (and (isconf #q5) (isconf #q7) (isgrasp o9 #g6))
          :effect (isholdingmotion #q5 #t745 #q7 o9 #g6)
   )
   (:action s770_plan-holding-motion
          :parameters (#q5 #q7 o10 #g7)
          :precondition (and (isconf #q5) (isconf #q7) (isgrasp o10 #g7))
          :effect (isholdingmotion #q5 #t746 #q7 o10 #g7)
   )
   (:action s771_plan-holding-motion
          :parameters (#q5 #q7 o10 #g8)
          :precondition (and (isconf #q5) (isconf #q7) (isgrasp o10 #g8))
          :effect (isholdingmotion #q5 #t747 #q7 o10 #g8)
   )
   (:action s772_plan-holding-motion
          :parameters (#q5 #q8 o8 #g0)
          :precondition (and (isconf #q5) (isconf #q8) (isgrasp o8 #g0))
          :effect (isholdingmotion #q5 #t748 #q8 o8 #g0)
   )
   (:action s773_plan-holding-motion
          :parameters (#q5 #q8 o9 #g1)
          :precondition (and (isconf #q5) (isconf #q8) (isgrasp o9 #g1))
          :effect (isholdingmotion #q5 #t749 #q8 o9 #g1)
   )
   (:action s774_plan-holding-motion
          :parameters (#q5 #q8 o10 #g2)
          :precondition (and (isconf #q5) (isconf #q8) (isgrasp o10 #g2))
          :effect (isholdingmotion #q5 #t750 #q8 o10 #g2)
   )
   (:action s775_plan-holding-motion
          :parameters (#q5 #q8 o8 #g3)
          :precondition (and (isconf #q5) (isconf #q8) (isgrasp o8 #g3))
          :effect (isholdingmotion #q5 #t751 #q8 o8 #g3)
   )
   (:action s776_plan-holding-motion
          :parameters (#q5 #q8 o8 #g4)
          :precondition (and (isconf #q5) (isconf #q8) (isgrasp o8 #g4))
          :effect (isholdingmotion #q5 #t752 #q8 o8 #g4)
   )
   (:action s777_plan-holding-motion
          :parameters (#q5 #q8 o9 #g5)
          :precondition (and (isconf #q5) (isconf #q8) (isgrasp o9 #g5))
          :effect (isholdingmotion #q5 #t753 #q8 o9 #g5)
   )
   (:action s778_plan-holding-motion
          :parameters (#q5 #q8 o9 #g6)
          :precondition (and (isconf #q5) (isconf #q8) (isgrasp o9 #g6))
          :effect (isholdingmotion #q5 #t754 #q8 o9 #g6)
   )
   (:action s779_plan-holding-motion
          :parameters (#q5 #q8 o10 #g7)
          :precondition (and (isconf #q5) (isconf #q8) (isgrasp o10 #g7))
          :effect (isholdingmotion #q5 #t755 #q8 o10 #g7)
   )
   (:action s780_plan-holding-motion
          :parameters (#q5 #q8 o10 #g8)
          :precondition (and (isconf #q5) (isconf #q8) (isgrasp o10 #g8))
          :effect (isholdingmotion #q5 #t756 #q8 o10 #g8)
   )
   (:action s781_plan-holding-motion
          :parameters (#q6 q40 o8 #g0)
          :precondition (and (isconf #q6) (isconf q40) (isgrasp o8 #g0))
          :effect (isholdingmotion #q6 #t757 q40 o8 #g0)
   )
   (:action s782_plan-holding-motion
          :parameters (#q6 q40 o9 #g1)
          :precondition (and (isconf #q6) (isconf q40) (isgrasp o9 #g1))
          :effect (isholdingmotion #q6 #t758 q40 o9 #g1)
   )
   (:action s783_plan-holding-motion
          :parameters (#q6 q40 o10 #g2)
          :precondition (and (isconf #q6) (isconf q40) (isgrasp o10 #g2))
          :effect (isholdingmotion #q6 #t759 q40 o10 #g2)
   )
   (:action s784_plan-holding-motion
          :parameters (#q6 q40 o8 #g3)
          :precondition (and (isconf #q6) (isconf q40) (isgrasp o8 #g3))
          :effect (isholdingmotion #q6 #t760 q40 o8 #g3)
   )
   (:action s785_plan-holding-motion
          :parameters (#q6 q40 o8 #g4)
          :precondition (and (isconf #q6) (isconf q40) (isgrasp o8 #g4))
          :effect (isholdingmotion #q6 #t761 q40 o8 #g4)
   )
   (:action s786_plan-holding-motion
          :parameters (#q6 q40 o9 #g5)
          :precondition (and (isconf #q6) (isconf q40) (isgrasp o9 #g5))
          :effect (isholdingmotion #q6 #t762 q40 o9 #g5)
   )
   (:action s787_plan-holding-motion
          :parameters (#q6 q40 o9 #g6)
          :precondition (and (isconf #q6) (isconf q40) (isgrasp o9 #g6))
          :effect (isholdingmotion #q6 #t763 q40 o9 #g6)
   )
   (:action s788_plan-holding-motion
          :parameters (#q6 q40 o10 #g7)
          :precondition (and (isconf #q6) (isconf q40) (isgrasp o10 #g7))
          :effect (isholdingmotion #q6 #t764 q40 o10 #g7)
   )
   (:action s789_plan-holding-motion
          :parameters (#q6 q40 o10 #g8)
          :precondition (and (isconf #q6) (isconf q40) (isgrasp o10 #g8))
          :effect (isholdingmotion #q6 #t765 q40 o10 #g8)
   )
   (:action s790_plan-holding-motion
          :parameters (#q6 #q0 o8 #g0)
          :precondition (and (isconf #q6) (isconf #q0) (isgrasp o8 #g0))
          :effect (isholdingmotion #q6 #t766 #q0 o8 #g0)
   )
   (:action s791_plan-holding-motion
          :parameters (#q6 #q0 o9 #g1)
          :precondition (and (isconf #q6) (isconf #q0) (isgrasp o9 #g1))
          :effect (isholdingmotion #q6 #t767 #q0 o9 #g1)
   )
   (:action s792_plan-holding-motion
          :parameters (#q6 #q0 o10 #g2)
          :precondition (and (isconf #q6) (isconf #q0) (isgrasp o10 #g2))
          :effect (isholdingmotion #q6 #t768 #q0 o10 #g2)
   )
   (:action s793_plan-holding-motion
          :parameters (#q6 #q0 o8 #g3)
          :precondition (and (isconf #q6) (isconf #q0) (isgrasp o8 #g3))
          :effect (isholdingmotion #q6 #t769 #q0 o8 #g3)
   )
   (:action s794_plan-holding-motion
          :parameters (#q6 #q0 o8 #g4)
          :precondition (and (isconf #q6) (isconf #q0) (isgrasp o8 #g4))
          :effect (isholdingmotion #q6 #t770 #q0 o8 #g4)
   )
   (:action s795_plan-holding-motion
          :parameters (#q6 #q0 o9 #g5)
          :precondition (and (isconf #q6) (isconf #q0) (isgrasp o9 #g5))
          :effect (isholdingmotion #q6 #t771 #q0 o9 #g5)
   )
   (:action s796_plan-holding-motion
          :parameters (#q6 #q0 o9 #g6)
          :precondition (and (isconf #q6) (isconf #q0) (isgrasp o9 #g6))
          :effect (isholdingmotion #q6 #t772 #q0 o9 #g6)
   )
   (:action s797_plan-holding-motion
          :parameters (#q6 #q0 o10 #g7)
          :precondition (and (isconf #q6) (isconf #q0) (isgrasp o10 #g7))
          :effect (isholdingmotion #q6 #t773 #q0 o10 #g7)
   )
   (:action s798_plan-holding-motion
          :parameters (#q6 #q0 o10 #g8)
          :precondition (and (isconf #q6) (isconf #q0) (isgrasp o10 #g8))
          :effect (isholdingmotion #q6 #t774 #q0 o10 #g8)
   )
   (:action s799_plan-holding-motion
          :parameters (#q6 #q1 o8 #g0)
          :precondition (and (isconf #q6) (isconf #q1) (isgrasp o8 #g0))
          :effect (isholdingmotion #q6 #t775 #q1 o8 #g0)
   )
   (:action s800_plan-holding-motion
          :parameters (#q6 #q1 o9 #g1)
          :precondition (and (isconf #q6) (isconf #q1) (isgrasp o9 #g1))
          :effect (isholdingmotion #q6 #t776 #q1 o9 #g1)
   )
   (:action s801_plan-holding-motion
          :parameters (#q6 #q1 o10 #g2)
          :precondition (and (isconf #q6) (isconf #q1) (isgrasp o10 #g2))
          :effect (isholdingmotion #q6 #t777 #q1 o10 #g2)
   )
   (:action s802_plan-holding-motion
          :parameters (#q6 #q1 o8 #g3)
          :precondition (and (isconf #q6) (isconf #q1) (isgrasp o8 #g3))
          :effect (isholdingmotion #q6 #t778 #q1 o8 #g3)
   )
   (:action s803_plan-holding-motion
          :parameters (#q6 #q1 o8 #g4)
          :precondition (and (isconf #q6) (isconf #q1) (isgrasp o8 #g4))
          :effect (isholdingmotion #q6 #t779 #q1 o8 #g4)
   )
   (:action s804_plan-holding-motion
          :parameters (#q6 #q1 o9 #g5)
          :precondition (and (isconf #q6) (isconf #q1) (isgrasp o9 #g5))
          :effect (isholdingmotion #q6 #t780 #q1 o9 #g5)
   )
   (:action s805_plan-holding-motion
          :parameters (#q6 #q1 o9 #g6)
          :precondition (and (isconf #q6) (isconf #q1) (isgrasp o9 #g6))
          :effect (isholdingmotion #q6 #t781 #q1 o9 #g6)
   )
   (:action s806_plan-holding-motion
          :parameters (#q6 #q1 o10 #g7)
          :precondition (and (isconf #q6) (isconf #q1) (isgrasp o10 #g7))
          :effect (isholdingmotion #q6 #t782 #q1 o10 #g7)
   )
   (:action s807_plan-holding-motion
          :parameters (#q6 #q1 o10 #g8)
          :precondition (and (isconf #q6) (isconf #q1) (isgrasp o10 #g8))
          :effect (isholdingmotion #q6 #t783 #q1 o10 #g8)
   )
   (:action s808_plan-holding-motion
          :parameters (#q6 #q2 o8 #g0)
          :precondition (and (isconf #q6) (isconf #q2) (isgrasp o8 #g0))
          :effect (isholdingmotion #q6 #t784 #q2 o8 #g0)
   )
   (:action s809_plan-holding-motion
          :parameters (#q6 #q2 o9 #g1)
          :precondition (and (isconf #q6) (isconf #q2) (isgrasp o9 #g1))
          :effect (isholdingmotion #q6 #t785 #q2 o9 #g1)
   )
   (:action s810_plan-holding-motion
          :parameters (#q6 #q2 o10 #g2)
          :precondition (and (isconf #q6) (isconf #q2) (isgrasp o10 #g2))
          :effect (isholdingmotion #q6 #t786 #q2 o10 #g2)
   )
   (:action s811_plan-holding-motion
          :parameters (#q6 #q2 o8 #g3)
          :precondition (and (isconf #q6) (isconf #q2) (isgrasp o8 #g3))
          :effect (isholdingmotion #q6 #t787 #q2 o8 #g3)
   )
   (:action s812_plan-holding-motion
          :parameters (#q6 #q2 o8 #g4)
          :precondition (and (isconf #q6) (isconf #q2) (isgrasp o8 #g4))
          :effect (isholdingmotion #q6 #t788 #q2 o8 #g4)
   )
   (:action s813_plan-holding-motion
          :parameters (#q6 #q2 o9 #g5)
          :precondition (and (isconf #q6) (isconf #q2) (isgrasp o9 #g5))
          :effect (isholdingmotion #q6 #t789 #q2 o9 #g5)
   )
   (:action s814_plan-holding-motion
          :parameters (#q6 #q2 o9 #g6)
          :precondition (and (isconf #q6) (isconf #q2) (isgrasp o9 #g6))
          :effect (isholdingmotion #q6 #t790 #q2 o9 #g6)
   )
   (:action s815_plan-holding-motion
          :parameters (#q6 #q2 o10 #g7)
          :precondition (and (isconf #q6) (isconf #q2) (isgrasp o10 #g7))
          :effect (isholdingmotion #q6 #t791 #q2 o10 #g7)
   )
   (:action s816_plan-holding-motion
          :parameters (#q6 #q2 o10 #g8)
          :precondition (and (isconf #q6) (isconf #q2) (isgrasp o10 #g8))
          :effect (isholdingmotion #q6 #t792 #q2 o10 #g8)
   )
   (:action s817_plan-holding-motion
          :parameters (#q6 #q3 o8 #g0)
          :precondition (and (isconf #q6) (isconf #q3) (isgrasp o8 #g0))
          :effect (isholdingmotion #q6 #t793 #q3 o8 #g0)
   )
   (:action s818_plan-holding-motion
          :parameters (#q6 #q3 o9 #g1)
          :precondition (and (isconf #q6) (isconf #q3) (isgrasp o9 #g1))
          :effect (isholdingmotion #q6 #t794 #q3 o9 #g1)
   )
   (:action s819_plan-holding-motion
          :parameters (#q6 #q3 o10 #g2)
          :precondition (and (isconf #q6) (isconf #q3) (isgrasp o10 #g2))
          :effect (isholdingmotion #q6 #t795 #q3 o10 #g2)
   )
   (:action s820_plan-holding-motion
          :parameters (#q6 #q3 o8 #g3)
          :precondition (and (isconf #q6) (isconf #q3) (isgrasp o8 #g3))
          :effect (isholdingmotion #q6 #t796 #q3 o8 #g3)
   )
   (:action s821_plan-holding-motion
          :parameters (#q6 #q3 o8 #g4)
          :precondition (and (isconf #q6) (isconf #q3) (isgrasp o8 #g4))
          :effect (isholdingmotion #q6 #t797 #q3 o8 #g4)
   )
   (:action s822_plan-holding-motion
          :parameters (#q6 #q3 o9 #g5)
          :precondition (and (isconf #q6) (isconf #q3) (isgrasp o9 #g5))
          :effect (isholdingmotion #q6 #t798 #q3 o9 #g5)
   )
   (:action s823_plan-holding-motion
          :parameters (#q6 #q3 o9 #g6)
          :precondition (and (isconf #q6) (isconf #q3) (isgrasp o9 #g6))
          :effect (isholdingmotion #q6 #t799 #q3 o9 #g6)
   )
   (:action s824_plan-holding-motion
          :parameters (#q6 #q3 o10 #g7)
          :precondition (and (isconf #q6) (isconf #q3) (isgrasp o10 #g7))
          :effect (isholdingmotion #q6 #t800 #q3 o10 #g7)
   )
   (:action s825_plan-holding-motion
          :parameters (#q6 #q3 o10 #g8)
          :precondition (and (isconf #q6) (isconf #q3) (isgrasp o10 #g8))
          :effect (isholdingmotion #q6 #t801 #q3 o10 #g8)
   )
   (:action s826_plan-holding-motion
          :parameters (#q6 #q4 o8 #g0)
          :precondition (and (isconf #q6) (isconf #q4) (isgrasp o8 #g0))
          :effect (isholdingmotion #q6 #t802 #q4 o8 #g0)
   )
   (:action s827_plan-holding-motion
          :parameters (#q6 #q4 o9 #g1)
          :precondition (and (isconf #q6) (isconf #q4) (isgrasp o9 #g1))
          :effect (isholdingmotion #q6 #t803 #q4 o9 #g1)
   )
   (:action s828_plan-holding-motion
          :parameters (#q6 #q4 o10 #g2)
          :precondition (and (isconf #q6) (isconf #q4) (isgrasp o10 #g2))
          :effect (isholdingmotion #q6 #t804 #q4 o10 #g2)
   )
   (:action s829_plan-holding-motion
          :parameters (#q6 #q4 o8 #g3)
          :precondition (and (isconf #q6) (isconf #q4) (isgrasp o8 #g3))
          :effect (isholdingmotion #q6 #t805 #q4 o8 #g3)
   )
   (:action s830_plan-holding-motion
          :parameters (#q6 #q4 o8 #g4)
          :precondition (and (isconf #q6) (isconf #q4) (isgrasp o8 #g4))
          :effect (isholdingmotion #q6 #t806 #q4 o8 #g4)
   )
   (:action s831_plan-holding-motion
          :parameters (#q6 #q4 o9 #g5)
          :precondition (and (isconf #q6) (isconf #q4) (isgrasp o9 #g5))
          :effect (isholdingmotion #q6 #t807 #q4 o9 #g5)
   )
   (:action s832_plan-holding-motion
          :parameters (#q6 #q4 o9 #g6)
          :precondition (and (isconf #q6) (isconf #q4) (isgrasp o9 #g6))
          :effect (isholdingmotion #q6 #t808 #q4 o9 #g6)
   )
   (:action s833_plan-holding-motion
          :parameters (#q6 #q4 o10 #g7)
          :precondition (and (isconf #q6) (isconf #q4) (isgrasp o10 #g7))
          :effect (isholdingmotion #q6 #t809 #q4 o10 #g7)
   )
   (:action s834_plan-holding-motion
          :parameters (#q6 #q4 o10 #g8)
          :precondition (and (isconf #q6) (isconf #q4) (isgrasp o10 #g8))
          :effect (isholdingmotion #q6 #t810 #q4 o10 #g8)
   )
   (:action s835_plan-holding-motion
          :parameters (#q6 #q5 o8 #g0)
          :precondition (and (isconf #q6) (isconf #q5) (isgrasp o8 #g0))
          :effect (isholdingmotion #q6 #t811 #q5 o8 #g0)
   )
   (:action s836_plan-holding-motion
          :parameters (#q6 #q5 o9 #g1)
          :precondition (and (isconf #q6) (isconf #q5) (isgrasp o9 #g1))
          :effect (isholdingmotion #q6 #t812 #q5 o9 #g1)
   )
   (:action s837_plan-holding-motion
          :parameters (#q6 #q5 o10 #g2)
          :precondition (and (isconf #q6) (isconf #q5) (isgrasp o10 #g2))
          :effect (isholdingmotion #q6 #t813 #q5 o10 #g2)
   )
   (:action s838_plan-holding-motion
          :parameters (#q6 #q5 o8 #g3)
          :precondition (and (isconf #q6) (isconf #q5) (isgrasp o8 #g3))
          :effect (isholdingmotion #q6 #t814 #q5 o8 #g3)
   )
   (:action s839_plan-holding-motion
          :parameters (#q6 #q5 o8 #g4)
          :precondition (and (isconf #q6) (isconf #q5) (isgrasp o8 #g4))
          :effect (isholdingmotion #q6 #t815 #q5 o8 #g4)
   )
   (:action s840_plan-holding-motion
          :parameters (#q6 #q5 o9 #g5)
          :precondition (and (isconf #q6) (isconf #q5) (isgrasp o9 #g5))
          :effect (isholdingmotion #q6 #t816 #q5 o9 #g5)
   )
   (:action s841_plan-holding-motion
          :parameters (#q6 #q5 o9 #g6)
          :precondition (and (isconf #q6) (isconf #q5) (isgrasp o9 #g6))
          :effect (isholdingmotion #q6 #t817 #q5 o9 #g6)
   )
   (:action s842_plan-holding-motion
          :parameters (#q6 #q5 o10 #g7)
          :precondition (and (isconf #q6) (isconf #q5) (isgrasp o10 #g7))
          :effect (isholdingmotion #q6 #t818 #q5 o10 #g7)
   )
   (:action s843_plan-holding-motion
          :parameters (#q6 #q5 o10 #g8)
          :precondition (and (isconf #q6) (isconf #q5) (isgrasp o10 #g8))
          :effect (isholdingmotion #q6 #t819 #q5 o10 #g8)
   )
   (:action s844_plan-holding-motion
          :parameters (#q6 #q6 o8 #g0)
          :precondition (and (isconf #q6) (isconf #q6) (isgrasp o8 #g0))
          :effect (isholdingmotion #q6 #t820 #q6 o8 #g0)
   )
   (:action s845_plan-holding-motion
          :parameters (#q6 #q6 o9 #g1)
          :precondition (and (isconf #q6) (isconf #q6) (isgrasp o9 #g1))
          :effect (isholdingmotion #q6 #t821 #q6 o9 #g1)
   )
   (:action s846_plan-holding-motion
          :parameters (#q6 #q6 o10 #g2)
          :precondition (and (isconf #q6) (isconf #q6) (isgrasp o10 #g2))
          :effect (isholdingmotion #q6 #t822 #q6 o10 #g2)
   )
   (:action s847_plan-holding-motion
          :parameters (#q6 #q6 o8 #g3)
          :precondition (and (isconf #q6) (isconf #q6) (isgrasp o8 #g3))
          :effect (isholdingmotion #q6 #t823 #q6 o8 #g3)
   )
   (:action s848_plan-holding-motion
          :parameters (#q6 #q6 o8 #g4)
          :precondition (and (isconf #q6) (isconf #q6) (isgrasp o8 #g4))
          :effect (isholdingmotion #q6 #t824 #q6 o8 #g4)
   )
   (:action s849_plan-holding-motion
          :parameters (#q6 #q6 o9 #g5)
          :precondition (and (isconf #q6) (isconf #q6) (isgrasp o9 #g5))
          :effect (isholdingmotion #q6 #t825 #q6 o9 #g5)
   )
   (:action s850_plan-holding-motion
          :parameters (#q6 #q6 o9 #g6)
          :precondition (and (isconf #q6) (isconf #q6) (isgrasp o9 #g6))
          :effect (isholdingmotion #q6 #t826 #q6 o9 #g6)
   )
   (:action s851_plan-holding-motion
          :parameters (#q6 #q6 o10 #g7)
          :precondition (and (isconf #q6) (isconf #q6) (isgrasp o10 #g7))
          :effect (isholdingmotion #q6 #t827 #q6 o10 #g7)
   )
   (:action s852_plan-holding-motion
          :parameters (#q6 #q6 o10 #g8)
          :precondition (and (isconf #q6) (isconf #q6) (isgrasp o10 #g8))
          :effect (isholdingmotion #q6 #t828 #q6 o10 #g8)
   )
   (:action s853_plan-holding-motion
          :parameters (#q6 #q7 o8 #g0)
          :precondition (and (isconf #q6) (isconf #q7) (isgrasp o8 #g0))
          :effect (isholdingmotion #q6 #t829 #q7 o8 #g0)
   )
   (:action s854_plan-holding-motion
          :parameters (#q6 #q7 o9 #g1)
          :precondition (and (isconf #q6) (isconf #q7) (isgrasp o9 #g1))
          :effect (isholdingmotion #q6 #t830 #q7 o9 #g1)
   )
   (:action s855_plan-holding-motion
          :parameters (#q6 #q7 o10 #g2)
          :precondition (and (isconf #q6) (isconf #q7) (isgrasp o10 #g2))
          :effect (isholdingmotion #q6 #t831 #q7 o10 #g2)
   )
   (:action s856_plan-holding-motion
          :parameters (#q6 #q7 o8 #g3)
          :precondition (and (isconf #q6) (isconf #q7) (isgrasp o8 #g3))
          :effect (isholdingmotion #q6 #t832 #q7 o8 #g3)
   )
   (:action s857_plan-holding-motion
          :parameters (#q6 #q7 o8 #g4)
          :precondition (and (isconf #q6) (isconf #q7) (isgrasp o8 #g4))
          :effect (isholdingmotion #q6 #t833 #q7 o8 #g4)
   )
   (:action s858_plan-holding-motion
          :parameters (#q6 #q7 o9 #g5)
          :precondition (and (isconf #q6) (isconf #q7) (isgrasp o9 #g5))
          :effect (isholdingmotion #q6 #t834 #q7 o9 #g5)
   )
   (:action s859_plan-holding-motion
          :parameters (#q6 #q7 o9 #g6)
          :precondition (and (isconf #q6) (isconf #q7) (isgrasp o9 #g6))
          :effect (isholdingmotion #q6 #t835 #q7 o9 #g6)
   )
   (:action s860_plan-holding-motion
          :parameters (#q6 #q7 o10 #g7)
          :precondition (and (isconf #q6) (isconf #q7) (isgrasp o10 #g7))
          :effect (isholdingmotion #q6 #t836 #q7 o10 #g7)
   )
   (:action s861_plan-holding-motion
          :parameters (#q6 #q7 o10 #g8)
          :precondition (and (isconf #q6) (isconf #q7) (isgrasp o10 #g8))
          :effect (isholdingmotion #q6 #t837 #q7 o10 #g8)
   )
   (:action s862_plan-holding-motion
          :parameters (#q6 #q8 o8 #g0)
          :precondition (and (isconf #q6) (isconf #q8) (isgrasp o8 #g0))
          :effect (isholdingmotion #q6 #t838 #q8 o8 #g0)
   )
   (:action s863_plan-holding-motion
          :parameters (#q6 #q8 o9 #g1)
          :precondition (and (isconf #q6) (isconf #q8) (isgrasp o9 #g1))
          :effect (isholdingmotion #q6 #t839 #q8 o9 #g1)
   )
   (:action s864_plan-holding-motion
          :parameters (#q6 #q8 o10 #g2)
          :precondition (and (isconf #q6) (isconf #q8) (isgrasp o10 #g2))
          :effect (isholdingmotion #q6 #t840 #q8 o10 #g2)
   )
   (:action s865_plan-holding-motion
          :parameters (#q6 #q8 o8 #g3)
          :precondition (and (isconf #q6) (isconf #q8) (isgrasp o8 #g3))
          :effect (isholdingmotion #q6 #t841 #q8 o8 #g3)
   )
   (:action s866_plan-holding-motion
          :parameters (#q6 #q8 o8 #g4)
          :precondition (and (isconf #q6) (isconf #q8) (isgrasp o8 #g4))
          :effect (isholdingmotion #q6 #t842 #q8 o8 #g4)
   )
   (:action s867_plan-holding-motion
          :parameters (#q6 #q8 o9 #g5)
          :precondition (and (isconf #q6) (isconf #q8) (isgrasp o9 #g5))
          :effect (isholdingmotion #q6 #t843 #q8 o9 #g5)
   )
   (:action s868_plan-holding-motion
          :parameters (#q6 #q8 o9 #g6)
          :precondition (and (isconf #q6) (isconf #q8) (isgrasp o9 #g6))
          :effect (isholdingmotion #q6 #t844 #q8 o9 #g6)
   )
   (:action s869_plan-holding-motion
          :parameters (#q6 #q8 o10 #g7)
          :precondition (and (isconf #q6) (isconf #q8) (isgrasp o10 #g7))
          :effect (isholdingmotion #q6 #t845 #q8 o10 #g7)
   )
   (:action s870_plan-holding-motion
          :parameters (#q6 #q8 o10 #g8)
          :precondition (and (isconf #q6) (isconf #q8) (isgrasp o10 #g8))
          :effect (isholdingmotion #q6 #t846 #q8 o10 #g8)
   )
   (:action s871_plan-holding-motion
          :parameters (#q7 q40 o8 #g0)
          :precondition (and (isconf #q7) (isconf q40) (isgrasp o8 #g0))
          :effect (isholdingmotion #q7 #t847 q40 o8 #g0)
   )
   (:action s872_plan-holding-motion
          :parameters (#q7 q40 o9 #g1)
          :precondition (and (isconf #q7) (isconf q40) (isgrasp o9 #g1))
          :effect (isholdingmotion #q7 #t848 q40 o9 #g1)
   )
   (:action s873_plan-holding-motion
          :parameters (#q7 q40 o10 #g2)
          :precondition (and (isconf #q7) (isconf q40) (isgrasp o10 #g2))
          :effect (isholdingmotion #q7 #t849 q40 o10 #g2)
   )
   (:action s874_plan-holding-motion
          :parameters (#q7 q40 o8 #g3)
          :precondition (and (isconf #q7) (isconf q40) (isgrasp o8 #g3))
          :effect (isholdingmotion #q7 #t850 q40 o8 #g3)
   )
   (:action s875_plan-holding-motion
          :parameters (#q7 q40 o8 #g4)
          :precondition (and (isconf #q7) (isconf q40) (isgrasp o8 #g4))
          :effect (isholdingmotion #q7 #t851 q40 o8 #g4)
   )
   (:action s876_plan-holding-motion
          :parameters (#q7 q40 o9 #g5)
          :precondition (and (isconf #q7) (isconf q40) (isgrasp o9 #g5))
          :effect (isholdingmotion #q7 #t852 q40 o9 #g5)
   )
   (:action s877_plan-holding-motion
          :parameters (#q7 q40 o9 #g6)
          :precondition (and (isconf #q7) (isconf q40) (isgrasp o9 #g6))
          :effect (isholdingmotion #q7 #t853 q40 o9 #g6)
   )
   (:action s878_plan-holding-motion
          :parameters (#q7 q40 o10 #g7)
          :precondition (and (isconf #q7) (isconf q40) (isgrasp o10 #g7))
          :effect (isholdingmotion #q7 #t854 q40 o10 #g7)
   )
   (:action s879_plan-holding-motion
          :parameters (#q7 q40 o10 #g8)
          :precondition (and (isconf #q7) (isconf q40) (isgrasp o10 #g8))
          :effect (isholdingmotion #q7 #t855 q40 o10 #g8)
   )
   (:action s880_plan-holding-motion
          :parameters (#q7 #q0 o8 #g0)
          :precondition (and (isconf #q7) (isconf #q0) (isgrasp o8 #g0))
          :effect (isholdingmotion #q7 #t856 #q0 o8 #g0)
   )
   (:action s881_plan-holding-motion
          :parameters (#q7 #q0 o9 #g1)
          :precondition (and (isconf #q7) (isconf #q0) (isgrasp o9 #g1))
          :effect (isholdingmotion #q7 #t857 #q0 o9 #g1)
   )
   (:action s882_plan-holding-motion
          :parameters (#q7 #q0 o10 #g2)
          :precondition (and (isconf #q7) (isconf #q0) (isgrasp o10 #g2))
          :effect (isholdingmotion #q7 #t858 #q0 o10 #g2)
   )
   (:action s883_plan-holding-motion
          :parameters (#q7 #q0 o8 #g3)
          :precondition (and (isconf #q7) (isconf #q0) (isgrasp o8 #g3))
          :effect (isholdingmotion #q7 #t859 #q0 o8 #g3)
   )
   (:action s884_plan-holding-motion
          :parameters (#q7 #q0 o8 #g4)
          :precondition (and (isconf #q7) (isconf #q0) (isgrasp o8 #g4))
          :effect (isholdingmotion #q7 #t860 #q0 o8 #g4)
   )
   (:action s885_plan-holding-motion
          :parameters (#q7 #q0 o9 #g5)
          :precondition (and (isconf #q7) (isconf #q0) (isgrasp o9 #g5))
          :effect (isholdingmotion #q7 #t861 #q0 o9 #g5)
   )
   (:action s886_plan-holding-motion
          :parameters (#q7 #q0 o9 #g6)
          :precondition (and (isconf #q7) (isconf #q0) (isgrasp o9 #g6))
          :effect (isholdingmotion #q7 #t862 #q0 o9 #g6)
   )
   (:action s887_plan-holding-motion
          :parameters (#q7 #q0 o10 #g7)
          :precondition (and (isconf #q7) (isconf #q0) (isgrasp o10 #g7))
          :effect (isholdingmotion #q7 #t863 #q0 o10 #g7)
   )
   (:action s888_plan-holding-motion
          :parameters (#q7 #q0 o10 #g8)
          :precondition (and (isconf #q7) (isconf #q0) (isgrasp o10 #g8))
          :effect (isholdingmotion #q7 #t864 #q0 o10 #g8)
   )
   (:action s889_plan-holding-motion
          :parameters (#q7 #q1 o8 #g0)
          :precondition (and (isconf #q7) (isconf #q1) (isgrasp o8 #g0))
          :effect (isholdingmotion #q7 #t865 #q1 o8 #g0)
   )
   (:action s890_plan-holding-motion
          :parameters (#q7 #q1 o9 #g1)
          :precondition (and (isconf #q7) (isconf #q1) (isgrasp o9 #g1))
          :effect (isholdingmotion #q7 #t866 #q1 o9 #g1)
   )
   (:action s891_plan-holding-motion
          :parameters (#q7 #q1 o10 #g2)
          :precondition (and (isconf #q7) (isconf #q1) (isgrasp o10 #g2))
          :effect (isholdingmotion #q7 #t867 #q1 o10 #g2)
   )
   (:action s892_plan-holding-motion
          :parameters (#q7 #q1 o8 #g3)
          :precondition (and (isconf #q7) (isconf #q1) (isgrasp o8 #g3))
          :effect (isholdingmotion #q7 #t868 #q1 o8 #g3)
   )
   (:action s893_plan-holding-motion
          :parameters (#q7 #q1 o8 #g4)
          :precondition (and (isconf #q7) (isconf #q1) (isgrasp o8 #g4))
          :effect (isholdingmotion #q7 #t869 #q1 o8 #g4)
   )
   (:action s894_plan-holding-motion
          :parameters (#q7 #q1 o9 #g5)
          :precondition (and (isconf #q7) (isconf #q1) (isgrasp o9 #g5))
          :effect (isholdingmotion #q7 #t870 #q1 o9 #g5)
   )
   (:action s895_plan-holding-motion
          :parameters (#q7 #q1 o9 #g6)
          :precondition (and (isconf #q7) (isconf #q1) (isgrasp o9 #g6))
          :effect (isholdingmotion #q7 #t871 #q1 o9 #g6)
   )
   (:action s896_plan-holding-motion
          :parameters (#q7 #q1 o10 #g7)
          :precondition (and (isconf #q7) (isconf #q1) (isgrasp o10 #g7))
          :effect (isholdingmotion #q7 #t872 #q1 o10 #g7)
   )
   (:action s897_plan-holding-motion
          :parameters (#q7 #q1 o10 #g8)
          :precondition (and (isconf #q7) (isconf #q1) (isgrasp o10 #g8))
          :effect (isholdingmotion #q7 #t873 #q1 o10 #g8)
   )
   (:action s898_plan-holding-motion
          :parameters (#q7 #q2 o8 #g0)
          :precondition (and (isconf #q7) (isconf #q2) (isgrasp o8 #g0))
          :effect (isholdingmotion #q7 #t874 #q2 o8 #g0)
   )
   (:action s899_plan-holding-motion
          :parameters (#q7 #q2 o9 #g1)
          :precondition (and (isconf #q7) (isconf #q2) (isgrasp o9 #g1))
          :effect (isholdingmotion #q7 #t875 #q2 o9 #g1)
   )
   (:action s900_plan-holding-motion
          :parameters (#q7 #q2 o10 #g2)
          :precondition (and (isconf #q7) (isconf #q2) (isgrasp o10 #g2))
          :effect (isholdingmotion #q7 #t876 #q2 o10 #g2)
   )
   (:action s901_plan-holding-motion
          :parameters (#q7 #q2 o8 #g3)
          :precondition (and (isconf #q7) (isconf #q2) (isgrasp o8 #g3))
          :effect (isholdingmotion #q7 #t877 #q2 o8 #g3)
   )
   (:action s902_plan-holding-motion
          :parameters (#q7 #q2 o8 #g4)
          :precondition (and (isconf #q7) (isconf #q2) (isgrasp o8 #g4))
          :effect (isholdingmotion #q7 #t878 #q2 o8 #g4)
   )
   (:action s903_plan-holding-motion
          :parameters (#q7 #q2 o9 #g5)
          :precondition (and (isconf #q7) (isconf #q2) (isgrasp o9 #g5))
          :effect (isholdingmotion #q7 #t879 #q2 o9 #g5)
   )
   (:action s904_plan-holding-motion
          :parameters (#q7 #q2 o9 #g6)
          :precondition (and (isconf #q7) (isconf #q2) (isgrasp o9 #g6))
          :effect (isholdingmotion #q7 #t880 #q2 o9 #g6)
   )
   (:action s905_plan-holding-motion
          :parameters (#q7 #q2 o10 #g7)
          :precondition (and (isconf #q7) (isconf #q2) (isgrasp o10 #g7))
          :effect (isholdingmotion #q7 #t881 #q2 o10 #g7)
   )
   (:action s906_plan-holding-motion
          :parameters (#q7 #q2 o10 #g8)
          :precondition (and (isconf #q7) (isconf #q2) (isgrasp o10 #g8))
          :effect (isholdingmotion #q7 #t882 #q2 o10 #g8)
   )
   (:action s907_plan-holding-motion
          :parameters (#q7 #q3 o8 #g0)
          :precondition (and (isconf #q7) (isconf #q3) (isgrasp o8 #g0))
          :effect (isholdingmotion #q7 #t883 #q3 o8 #g0)
   )
   (:action s908_plan-holding-motion
          :parameters (#q7 #q3 o9 #g1)
          :precondition (and (isconf #q7) (isconf #q3) (isgrasp o9 #g1))
          :effect (isholdingmotion #q7 #t884 #q3 o9 #g1)
   )
   (:action s909_plan-holding-motion
          :parameters (#q7 #q3 o10 #g2)
          :precondition (and (isconf #q7) (isconf #q3) (isgrasp o10 #g2))
          :effect (isholdingmotion #q7 #t885 #q3 o10 #g2)
   )
   (:action s910_plan-holding-motion
          :parameters (#q7 #q3 o8 #g3)
          :precondition (and (isconf #q7) (isconf #q3) (isgrasp o8 #g3))
          :effect (isholdingmotion #q7 #t886 #q3 o8 #g3)
   )
   (:action s911_plan-holding-motion
          :parameters (#q7 #q3 o8 #g4)
          :precondition (and (isconf #q7) (isconf #q3) (isgrasp o8 #g4))
          :effect (isholdingmotion #q7 #t887 #q3 o8 #g4)
   )
   (:action s912_plan-holding-motion
          :parameters (#q7 #q3 o9 #g5)
          :precondition (and (isconf #q7) (isconf #q3) (isgrasp o9 #g5))
          :effect (isholdingmotion #q7 #t888 #q3 o9 #g5)
   )
   (:action s913_plan-holding-motion
          :parameters (#q7 #q3 o9 #g6)
          :precondition (and (isconf #q7) (isconf #q3) (isgrasp o9 #g6))
          :effect (isholdingmotion #q7 #t889 #q3 o9 #g6)
   )
   (:action s914_plan-holding-motion
          :parameters (#q7 #q3 o10 #g7)
          :precondition (and (isconf #q7) (isconf #q3) (isgrasp o10 #g7))
          :effect (isholdingmotion #q7 #t890 #q3 o10 #g7)
   )
   (:action s915_plan-holding-motion
          :parameters (#q7 #q3 o10 #g8)
          :precondition (and (isconf #q7) (isconf #q3) (isgrasp o10 #g8))
          :effect (isholdingmotion #q7 #t891 #q3 o10 #g8)
   )
   (:action s916_plan-holding-motion
          :parameters (#q7 #q4 o8 #g0)
          :precondition (and (isconf #q7) (isconf #q4) (isgrasp o8 #g0))
          :effect (isholdingmotion #q7 #t892 #q4 o8 #g0)
   )
   (:action s917_plan-holding-motion
          :parameters (#q7 #q4 o9 #g1)
          :precondition (and (isconf #q7) (isconf #q4) (isgrasp o9 #g1))
          :effect (isholdingmotion #q7 #t893 #q4 o9 #g1)
   )
   (:action s918_plan-holding-motion
          :parameters (#q7 #q4 o10 #g2)
          :precondition (and (isconf #q7) (isconf #q4) (isgrasp o10 #g2))
          :effect (isholdingmotion #q7 #t894 #q4 o10 #g2)
   )
   (:action s919_plan-holding-motion
          :parameters (#q7 #q4 o8 #g3)
          :precondition (and (isconf #q7) (isconf #q4) (isgrasp o8 #g3))
          :effect (isholdingmotion #q7 #t895 #q4 o8 #g3)
   )
   (:action s920_plan-holding-motion
          :parameters (#q7 #q4 o8 #g4)
          :precondition (and (isconf #q7) (isconf #q4) (isgrasp o8 #g4))
          :effect (isholdingmotion #q7 #t896 #q4 o8 #g4)
   )
   (:action s921_plan-holding-motion
          :parameters (#q7 #q4 o9 #g5)
          :precondition (and (isconf #q7) (isconf #q4) (isgrasp o9 #g5))
          :effect (isholdingmotion #q7 #t897 #q4 o9 #g5)
   )
   (:action s922_plan-holding-motion
          :parameters (#q7 #q4 o9 #g6)
          :precondition (and (isconf #q7) (isconf #q4) (isgrasp o9 #g6))
          :effect (isholdingmotion #q7 #t898 #q4 o9 #g6)
   )
   (:action s923_plan-holding-motion
          :parameters (#q7 #q4 o10 #g7)
          :precondition (and (isconf #q7) (isconf #q4) (isgrasp o10 #g7))
          :effect (isholdingmotion #q7 #t899 #q4 o10 #g7)
   )
   (:action s924_plan-holding-motion
          :parameters (#q7 #q4 o10 #g8)
          :precondition (and (isconf #q7) (isconf #q4) (isgrasp o10 #g8))
          :effect (isholdingmotion #q7 #t900 #q4 o10 #g8)
   )
   (:action s925_plan-holding-motion
          :parameters (#q7 #q5 o8 #g0)
          :precondition (and (isconf #q7) (isconf #q5) (isgrasp o8 #g0))
          :effect (isholdingmotion #q7 #t901 #q5 o8 #g0)
   )
   (:action s926_plan-holding-motion
          :parameters (#q7 #q5 o9 #g1)
          :precondition (and (isconf #q7) (isconf #q5) (isgrasp o9 #g1))
          :effect (isholdingmotion #q7 #t902 #q5 o9 #g1)
   )
   (:action s927_plan-holding-motion
          :parameters (#q7 #q5 o10 #g2)
          :precondition (and (isconf #q7) (isconf #q5) (isgrasp o10 #g2))
          :effect (isholdingmotion #q7 #t903 #q5 o10 #g2)
   )
   (:action s928_plan-holding-motion
          :parameters (#q7 #q5 o8 #g3)
          :precondition (and (isconf #q7) (isconf #q5) (isgrasp o8 #g3))
          :effect (isholdingmotion #q7 #t904 #q5 o8 #g3)
   )
   (:action s929_plan-holding-motion
          :parameters (#q7 #q5 o8 #g4)
          :precondition (and (isconf #q7) (isconf #q5) (isgrasp o8 #g4))
          :effect (isholdingmotion #q7 #t905 #q5 o8 #g4)
   )
   (:action s930_plan-holding-motion
          :parameters (#q7 #q5 o9 #g5)
          :precondition (and (isconf #q7) (isconf #q5) (isgrasp o9 #g5))
          :effect (isholdingmotion #q7 #t906 #q5 o9 #g5)
   )
   (:action s931_plan-holding-motion
          :parameters (#q7 #q5 o9 #g6)
          :precondition (and (isconf #q7) (isconf #q5) (isgrasp o9 #g6))
          :effect (isholdingmotion #q7 #t907 #q5 o9 #g6)
   )
   (:action s932_plan-holding-motion
          :parameters (#q7 #q5 o10 #g7)
          :precondition (and (isconf #q7) (isconf #q5) (isgrasp o10 #g7))
          :effect (isholdingmotion #q7 #t908 #q5 o10 #g7)
   )
   (:action s933_plan-holding-motion
          :parameters (#q7 #q5 o10 #g8)
          :precondition (and (isconf #q7) (isconf #q5) (isgrasp o10 #g8))
          :effect (isholdingmotion #q7 #t909 #q5 o10 #g8)
   )
   (:action s934_plan-holding-motion
          :parameters (#q7 #q6 o8 #g0)
          :precondition (and (isconf #q7) (isconf #q6) (isgrasp o8 #g0))
          :effect (isholdingmotion #q7 #t910 #q6 o8 #g0)
   )
   (:action s935_plan-holding-motion
          :parameters (#q7 #q6 o9 #g1)
          :precondition (and (isconf #q7) (isconf #q6) (isgrasp o9 #g1))
          :effect (isholdingmotion #q7 #t911 #q6 o9 #g1)
   )
   (:action s936_plan-holding-motion
          :parameters (#q7 #q6 o10 #g2)
          :precondition (and (isconf #q7) (isconf #q6) (isgrasp o10 #g2))
          :effect (isholdingmotion #q7 #t912 #q6 o10 #g2)
   )
   (:action s937_plan-holding-motion
          :parameters (#q7 #q6 o8 #g3)
          :precondition (and (isconf #q7) (isconf #q6) (isgrasp o8 #g3))
          :effect (isholdingmotion #q7 #t913 #q6 o8 #g3)
   )
   (:action s938_plan-holding-motion
          :parameters (#q7 #q6 o8 #g4)
          :precondition (and (isconf #q7) (isconf #q6) (isgrasp o8 #g4))
          :effect (isholdingmotion #q7 #t914 #q6 o8 #g4)
   )
   (:action s939_plan-holding-motion
          :parameters (#q7 #q6 o9 #g5)
          :precondition (and (isconf #q7) (isconf #q6) (isgrasp o9 #g5))
          :effect (isholdingmotion #q7 #t915 #q6 o9 #g5)
   )
   (:action s940_plan-holding-motion
          :parameters (#q7 #q6 o9 #g6)
          :precondition (and (isconf #q7) (isconf #q6) (isgrasp o9 #g6))
          :effect (isholdingmotion #q7 #t916 #q6 o9 #g6)
   )
   (:action s941_plan-holding-motion
          :parameters (#q7 #q6 o10 #g7)
          :precondition (and (isconf #q7) (isconf #q6) (isgrasp o10 #g7))
          :effect (isholdingmotion #q7 #t917 #q6 o10 #g7)
   )
   (:action s942_plan-holding-motion
          :parameters (#q7 #q6 o10 #g8)
          :precondition (and (isconf #q7) (isconf #q6) (isgrasp o10 #g8))
          :effect (isholdingmotion #q7 #t918 #q6 o10 #g8)
   )
   (:action s943_plan-holding-motion
          :parameters (#q7 #q7 o8 #g0)
          :precondition (and (isconf #q7) (isconf #q7) (isgrasp o8 #g0))
          :effect (isholdingmotion #q7 #t919 #q7 o8 #g0)
   )
   (:action s944_plan-holding-motion
          :parameters (#q7 #q7 o9 #g1)
          :precondition (and (isconf #q7) (isconf #q7) (isgrasp o9 #g1))
          :effect (isholdingmotion #q7 #t920 #q7 o9 #g1)
   )
   (:action s945_plan-holding-motion
          :parameters (#q7 #q7 o10 #g2)
          :precondition (and (isconf #q7) (isconf #q7) (isgrasp o10 #g2))
          :effect (isholdingmotion #q7 #t921 #q7 o10 #g2)
   )
   (:action s946_plan-holding-motion
          :parameters (#q7 #q7 o8 #g3)
          :precondition (and (isconf #q7) (isconf #q7) (isgrasp o8 #g3))
          :effect (isholdingmotion #q7 #t922 #q7 o8 #g3)
   )
   (:action s947_plan-holding-motion
          :parameters (#q7 #q7 o8 #g4)
          :precondition (and (isconf #q7) (isconf #q7) (isgrasp o8 #g4))
          :effect (isholdingmotion #q7 #t923 #q7 o8 #g4)
   )
   (:action s948_plan-holding-motion
          :parameters (#q7 #q7 o9 #g5)
          :precondition (and (isconf #q7) (isconf #q7) (isgrasp o9 #g5))
          :effect (isholdingmotion #q7 #t924 #q7 o9 #g5)
   )
   (:action s949_plan-holding-motion
          :parameters (#q7 #q7 o9 #g6)
          :precondition (and (isconf #q7) (isconf #q7) (isgrasp o9 #g6))
          :effect (isholdingmotion #q7 #t925 #q7 o9 #g6)
   )
   (:action s950_plan-holding-motion
          :parameters (#q7 #q7 o10 #g7)
          :precondition (and (isconf #q7) (isconf #q7) (isgrasp o10 #g7))
          :effect (isholdingmotion #q7 #t926 #q7 o10 #g7)
   )
   (:action s951_plan-holding-motion
          :parameters (#q7 #q7 o10 #g8)
          :precondition (and (isconf #q7) (isconf #q7) (isgrasp o10 #g8))
          :effect (isholdingmotion #q7 #t927 #q7 o10 #g8)
   )
   (:action s952_plan-holding-motion
          :parameters (#q7 #q8 o8 #g0)
          :precondition (and (isconf #q7) (isconf #q8) (isgrasp o8 #g0))
          :effect (isholdingmotion #q7 #t928 #q8 o8 #g0)
   )
   (:action s953_plan-holding-motion
          :parameters (#q7 #q8 o9 #g1)
          :precondition (and (isconf #q7) (isconf #q8) (isgrasp o9 #g1))
          :effect (isholdingmotion #q7 #t929 #q8 o9 #g1)
   )
   (:action s954_plan-holding-motion
          :parameters (#q7 #q8 o10 #g2)
          :precondition (and (isconf #q7) (isconf #q8) (isgrasp o10 #g2))
          :effect (isholdingmotion #q7 #t930 #q8 o10 #g2)
   )
   (:action s955_plan-holding-motion
          :parameters (#q7 #q8 o8 #g3)
          :precondition (and (isconf #q7) (isconf #q8) (isgrasp o8 #g3))
          :effect (isholdingmotion #q7 #t931 #q8 o8 #g3)
   )
   (:action s956_plan-holding-motion
          :parameters (#q7 #q8 o8 #g4)
          :precondition (and (isconf #q7) (isconf #q8) (isgrasp o8 #g4))
          :effect (isholdingmotion #q7 #t932 #q8 o8 #g4)
   )
   (:action s957_plan-holding-motion
          :parameters (#q7 #q8 o9 #g5)
          :precondition (and (isconf #q7) (isconf #q8) (isgrasp o9 #g5))
          :effect (isholdingmotion #q7 #t933 #q8 o9 #g5)
   )
   (:action s958_plan-holding-motion
          :parameters (#q7 #q8 o9 #g6)
          :precondition (and (isconf #q7) (isconf #q8) (isgrasp o9 #g6))
          :effect (isholdingmotion #q7 #t934 #q8 o9 #g6)
   )
   (:action s959_plan-holding-motion
          :parameters (#q7 #q8 o10 #g7)
          :precondition (and (isconf #q7) (isconf #q8) (isgrasp o10 #g7))
          :effect (isholdingmotion #q7 #t935 #q8 o10 #g7)
   )
   (:action s960_plan-holding-motion
          :parameters (#q7 #q8 o10 #g8)
          :precondition (and (isconf #q7) (isconf #q8) (isgrasp o10 #g8))
          :effect (isholdingmotion #q7 #t936 #q8 o10 #g8)
   )
   (:action s961_plan-holding-motion
          :parameters (#q8 q40 o8 #g0)
          :precondition (and (isconf #q8) (isconf q40) (isgrasp o8 #g0))
          :effect (isholdingmotion #q8 #t937 q40 o8 #g0)
   )
   (:action s962_plan-holding-motion
          :parameters (#q8 q40 o9 #g1)
          :precondition (and (isconf #q8) (isconf q40) (isgrasp o9 #g1))
          :effect (isholdingmotion #q8 #t938 q40 o9 #g1)
   )
   (:action s963_plan-holding-motion
          :parameters (#q8 q40 o10 #g2)
          :precondition (and (isconf #q8) (isconf q40) (isgrasp o10 #g2))
          :effect (isholdingmotion #q8 #t939 q40 o10 #g2)
   )
   (:action s964_plan-holding-motion
          :parameters (#q8 q40 o8 #g3)
          :precondition (and (isconf #q8) (isconf q40) (isgrasp o8 #g3))
          :effect (isholdingmotion #q8 #t940 q40 o8 #g3)
   )
   (:action s965_plan-holding-motion
          :parameters (#q8 q40 o8 #g4)
          :precondition (and (isconf #q8) (isconf q40) (isgrasp o8 #g4))
          :effect (isholdingmotion #q8 #t941 q40 o8 #g4)
   )
   (:action s966_plan-holding-motion
          :parameters (#q8 q40 o9 #g5)
          :precondition (and (isconf #q8) (isconf q40) (isgrasp o9 #g5))
          :effect (isholdingmotion #q8 #t942 q40 o9 #g5)
   )
   (:action s967_plan-holding-motion
          :parameters (#q8 q40 o9 #g6)
          :precondition (and (isconf #q8) (isconf q40) (isgrasp o9 #g6))
          :effect (isholdingmotion #q8 #t943 q40 o9 #g6)
   )
   (:action s968_plan-holding-motion
          :parameters (#q8 q40 o10 #g7)
          :precondition (and (isconf #q8) (isconf q40) (isgrasp o10 #g7))
          :effect (isholdingmotion #q8 #t944 q40 o10 #g7)
   )
   (:action s969_plan-holding-motion
          :parameters (#q8 q40 o10 #g8)
          :precondition (and (isconf #q8) (isconf q40) (isgrasp o10 #g8))
          :effect (isholdingmotion #q8 #t945 q40 o10 #g8)
   )
   (:action s970_plan-holding-motion
          :parameters (#q8 #q0 o8 #g0)
          :precondition (and (isconf #q8) (isconf #q0) (isgrasp o8 #g0))
          :effect (isholdingmotion #q8 #t946 #q0 o8 #g0)
   )
   (:action s971_plan-holding-motion
          :parameters (#q8 #q0 o9 #g1)
          :precondition (and (isconf #q8) (isconf #q0) (isgrasp o9 #g1))
          :effect (isholdingmotion #q8 #t947 #q0 o9 #g1)
   )
   (:action s972_plan-holding-motion
          :parameters (#q8 #q0 o10 #g2)
          :precondition (and (isconf #q8) (isconf #q0) (isgrasp o10 #g2))
          :effect (isholdingmotion #q8 #t948 #q0 o10 #g2)
   )
   (:action s973_plan-holding-motion
          :parameters (#q8 #q0 o8 #g3)
          :precondition (and (isconf #q8) (isconf #q0) (isgrasp o8 #g3))
          :effect (isholdingmotion #q8 #t949 #q0 o8 #g3)
   )
   (:action s974_plan-holding-motion
          :parameters (#q8 #q0 o8 #g4)
          :precondition (and (isconf #q8) (isconf #q0) (isgrasp o8 #g4))
          :effect (isholdingmotion #q8 #t950 #q0 o8 #g4)
   )
   (:action s975_plan-holding-motion
          :parameters (#q8 #q0 o9 #g5)
          :precondition (and (isconf #q8) (isconf #q0) (isgrasp o9 #g5))
          :effect (isholdingmotion #q8 #t951 #q0 o9 #g5)
   )
   (:action s976_plan-holding-motion
          :parameters (#q8 #q0 o9 #g6)
          :precondition (and (isconf #q8) (isconf #q0) (isgrasp o9 #g6))
          :effect (isholdingmotion #q8 #t952 #q0 o9 #g6)
   )
   (:action s977_plan-holding-motion
          :parameters (#q8 #q0 o10 #g7)
          :precondition (and (isconf #q8) (isconf #q0) (isgrasp o10 #g7))
          :effect (isholdingmotion #q8 #t953 #q0 o10 #g7)
   )
   (:action s978_plan-holding-motion
          :parameters (#q8 #q0 o10 #g8)
          :precondition (and (isconf #q8) (isconf #q0) (isgrasp o10 #g8))
          :effect (isholdingmotion #q8 #t954 #q0 o10 #g8)
   )
   (:action s979_plan-holding-motion
          :parameters (#q8 #q1 o8 #g0)
          :precondition (and (isconf #q8) (isconf #q1) (isgrasp o8 #g0))
          :effect (isholdingmotion #q8 #t955 #q1 o8 #g0)
   )
   (:action s980_plan-holding-motion
          :parameters (#q8 #q1 o9 #g1)
          :precondition (and (isconf #q8) (isconf #q1) (isgrasp o9 #g1))
          :effect (isholdingmotion #q8 #t956 #q1 o9 #g1)
   )
   (:action s981_plan-holding-motion
          :parameters (#q8 #q1 o10 #g2)
          :precondition (and (isconf #q8) (isconf #q1) (isgrasp o10 #g2))
          :effect (isholdingmotion #q8 #t957 #q1 o10 #g2)
   )
   (:action s982_plan-holding-motion
          :parameters (#q8 #q1 o8 #g3)
          :precondition (and (isconf #q8) (isconf #q1) (isgrasp o8 #g3))
          :effect (isholdingmotion #q8 #t958 #q1 o8 #g3)
   )
   (:action s983_plan-holding-motion
          :parameters (#q8 #q1 o8 #g4)
          :precondition (and (isconf #q8) (isconf #q1) (isgrasp o8 #g4))
          :effect (isholdingmotion #q8 #t959 #q1 o8 #g4)
   )
   (:action s984_plan-holding-motion
          :parameters (#q8 #q1 o9 #g5)
          :precondition (and (isconf #q8) (isconf #q1) (isgrasp o9 #g5))
          :effect (isholdingmotion #q8 #t960 #q1 o9 #g5)
   )
   (:action s985_plan-holding-motion
          :parameters (#q8 #q1 o9 #g6)
          :precondition (and (isconf #q8) (isconf #q1) (isgrasp o9 #g6))
          :effect (isholdingmotion #q8 #t961 #q1 o9 #g6)
   )
   (:action s986_plan-holding-motion
          :parameters (#q8 #q1 o10 #g7)
          :precondition (and (isconf #q8) (isconf #q1) (isgrasp o10 #g7))
          :effect (isholdingmotion #q8 #t962 #q1 o10 #g7)
   )
   (:action s987_plan-holding-motion
          :parameters (#q8 #q1 o10 #g8)
          :precondition (and (isconf #q8) (isconf #q1) (isgrasp o10 #g8))
          :effect (isholdingmotion #q8 #t963 #q1 o10 #g8)
   )
   (:action s988_plan-holding-motion
          :parameters (#q8 #q2 o8 #g0)
          :precondition (and (isconf #q8) (isconf #q2) (isgrasp o8 #g0))
          :effect (isholdingmotion #q8 #t964 #q2 o8 #g0)
   )
   (:action s989_plan-holding-motion
          :parameters (#q8 #q2 o9 #g1)
          :precondition (and (isconf #q8) (isconf #q2) (isgrasp o9 #g1))
          :effect (isholdingmotion #q8 #t965 #q2 o9 #g1)
   )
   (:action s990_plan-holding-motion
          :parameters (#q8 #q2 o10 #g2)
          :precondition (and (isconf #q8) (isconf #q2) (isgrasp o10 #g2))
          :effect (isholdingmotion #q8 #t966 #q2 o10 #g2)
   )
   (:action s991_plan-holding-motion
          :parameters (#q8 #q2 o8 #g3)
          :precondition (and (isconf #q8) (isconf #q2) (isgrasp o8 #g3))
          :effect (isholdingmotion #q8 #t967 #q2 o8 #g3)
   )
   (:action s992_plan-holding-motion
          :parameters (#q8 #q2 o8 #g4)
          :precondition (and (isconf #q8) (isconf #q2) (isgrasp o8 #g4))
          :effect (isholdingmotion #q8 #t968 #q2 o8 #g4)
   )
   (:action s993_plan-holding-motion
          :parameters (#q8 #q2 o9 #g5)
          :precondition (and (isconf #q8) (isconf #q2) (isgrasp o9 #g5))
          :effect (isholdingmotion #q8 #t969 #q2 o9 #g5)
   )
   (:action s994_plan-holding-motion
          :parameters (#q8 #q2 o9 #g6)
          :precondition (and (isconf #q8) (isconf #q2) (isgrasp o9 #g6))
          :effect (isholdingmotion #q8 #t970 #q2 o9 #g6)
   )
   (:action s995_plan-holding-motion
          :parameters (#q8 #q2 o10 #g7)
          :precondition (and (isconf #q8) (isconf #q2) (isgrasp o10 #g7))
          :effect (isholdingmotion #q8 #t971 #q2 o10 #g7)
   )
   (:action s996_plan-holding-motion
          :parameters (#q8 #q2 o10 #g8)
          :precondition (and (isconf #q8) (isconf #q2) (isgrasp o10 #g8))
          :effect (isholdingmotion #q8 #t972 #q2 o10 #g8)
   )
   (:action s997_plan-holding-motion
          :parameters (#q8 #q3 o8 #g0)
          :precondition (and (isconf #q8) (isconf #q3) (isgrasp o8 #g0))
          :effect (isholdingmotion #q8 #t973 #q3 o8 #g0)
   )
   (:action s998_plan-holding-motion
          :parameters (#q8 #q3 o9 #g1)
          :precondition (and (isconf #q8) (isconf #q3) (isgrasp o9 #g1))
          :effect (isholdingmotion #q8 #t974 #q3 o9 #g1)
   )
   (:action s999_plan-holding-motion
          :parameters (#q8 #q3 o10 #g2)
          :precondition (and (isconf #q8) (isconf #q3) (isgrasp o10 #g2))
          :effect (isholdingmotion #q8 #t975 #q3 o10 #g2)
   )
   (:action s1000_plan-holding-motion
          :parameters (#q8 #q3 o8 #g3)
          :precondition (and (isconf #q8) (isconf #q3) (isgrasp o8 #g3))
          :effect (isholdingmotion #q8 #t976 #q3 o8 #g3)
   )
   (:action s1001_plan-holding-motion
          :parameters (#q8 #q3 o8 #g4)
          :precondition (and (isconf #q8) (isconf #q3) (isgrasp o8 #g4))
          :effect (isholdingmotion #q8 #t977 #q3 o8 #g4)
   )
   (:action s1002_plan-holding-motion
          :parameters (#q8 #q3 o9 #g5)
          :precondition (and (isconf #q8) (isconf #q3) (isgrasp o9 #g5))
          :effect (isholdingmotion #q8 #t978 #q3 o9 #g5)
   )
   (:action s1003_plan-holding-motion
          :parameters (#q8 #q3 o9 #g6)
          :precondition (and (isconf #q8) (isconf #q3) (isgrasp o9 #g6))
          :effect (isholdingmotion #q8 #t979 #q3 o9 #g6)
   )
   (:action s1004_plan-holding-motion
          :parameters (#q8 #q3 o10 #g7)
          :precondition (and (isconf #q8) (isconf #q3) (isgrasp o10 #g7))
          :effect (isholdingmotion #q8 #t980 #q3 o10 #g7)
   )
   (:action s1005_plan-holding-motion
          :parameters (#q8 #q3 o10 #g8)
          :precondition (and (isconf #q8) (isconf #q3) (isgrasp o10 #g8))
          :effect (isholdingmotion #q8 #t981 #q3 o10 #g8)
   )
   (:action s1006_plan-holding-motion
          :parameters (#q8 #q4 o8 #g0)
          :precondition (and (isconf #q8) (isconf #q4) (isgrasp o8 #g0))
          :effect (isholdingmotion #q8 #t982 #q4 o8 #g0)
   )
   (:action s1007_plan-holding-motion
          :parameters (#q8 #q4 o9 #g1)
          :precondition (and (isconf #q8) (isconf #q4) (isgrasp o9 #g1))
          :effect (isholdingmotion #q8 #t983 #q4 o9 #g1)
   )
   (:action s1008_plan-holding-motion
          :parameters (#q8 #q4 o10 #g2)
          :precondition (and (isconf #q8) (isconf #q4) (isgrasp o10 #g2))
          :effect (isholdingmotion #q8 #t984 #q4 o10 #g2)
   )
   (:action s1009_plan-holding-motion
          :parameters (#q8 #q4 o8 #g3)
          :precondition (and (isconf #q8) (isconf #q4) (isgrasp o8 #g3))
          :effect (isholdingmotion #q8 #t985 #q4 o8 #g3)
   )
   (:action s1010_plan-holding-motion
          :parameters (#q8 #q4 o8 #g4)
          :precondition (and (isconf #q8) (isconf #q4) (isgrasp o8 #g4))
          :effect (isholdingmotion #q8 #t986 #q4 o8 #g4)
   )
   (:action s1011_plan-holding-motion
          :parameters (#q8 #q4 o9 #g5)
          :precondition (and (isconf #q8) (isconf #q4) (isgrasp o9 #g5))
          :effect (isholdingmotion #q8 #t987 #q4 o9 #g5)
   )
   (:action s1012_plan-holding-motion
          :parameters (#q8 #q4 o9 #g6)
          :precondition (and (isconf #q8) (isconf #q4) (isgrasp o9 #g6))
          :effect (isholdingmotion #q8 #t988 #q4 o9 #g6)
   )
   (:action s1013_plan-holding-motion
          :parameters (#q8 #q4 o10 #g7)
          :precondition (and (isconf #q8) (isconf #q4) (isgrasp o10 #g7))
          :effect (isholdingmotion #q8 #t989 #q4 o10 #g7)
   )
   (:action s1014_plan-holding-motion
          :parameters (#q8 #q4 o10 #g8)
          :precondition (and (isconf #q8) (isconf #q4) (isgrasp o10 #g8))
          :effect (isholdingmotion #q8 #t990 #q4 o10 #g8)
   )
   (:action s1015_plan-holding-motion
          :parameters (#q8 #q5 o8 #g0)
          :precondition (and (isconf #q8) (isconf #q5) (isgrasp o8 #g0))
          :effect (isholdingmotion #q8 #t991 #q5 o8 #g0)
   )
   (:action s1016_plan-holding-motion
          :parameters (#q8 #q5 o9 #g1)
          :precondition (and (isconf #q8) (isconf #q5) (isgrasp o9 #g1))
          :effect (isholdingmotion #q8 #t992 #q5 o9 #g1)
   )
   (:action s1017_plan-holding-motion
          :parameters (#q8 #q5 o10 #g2)
          :precondition (and (isconf #q8) (isconf #q5) (isgrasp o10 #g2))
          :effect (isholdingmotion #q8 #t993 #q5 o10 #g2)
   )
   (:action s1018_plan-holding-motion
          :parameters (#q8 #q5 o8 #g3)
          :precondition (and (isconf #q8) (isconf #q5) (isgrasp o8 #g3))
          :effect (isholdingmotion #q8 #t994 #q5 o8 #g3)
   )
   (:action s1019_plan-holding-motion
          :parameters (#q8 #q5 o8 #g4)
          :precondition (and (isconf #q8) (isconf #q5) (isgrasp o8 #g4))
          :effect (isholdingmotion #q8 #t995 #q5 o8 #g4)
   )
   (:action s1020_plan-holding-motion
          :parameters (#q8 #q5 o9 #g5)
          :precondition (and (isconf #q8) (isconf #q5) (isgrasp o9 #g5))
          :effect (isholdingmotion #q8 #t996 #q5 o9 #g5)
   )
   (:action s1021_plan-holding-motion
          :parameters (#q8 #q5 o9 #g6)
          :precondition (and (isconf #q8) (isconf #q5) (isgrasp o9 #g6))
          :effect (isholdingmotion #q8 #t997 #q5 o9 #g6)
   )
   (:action s1022_plan-holding-motion
          :parameters (#q8 #q5 o10 #g7)
          :precondition (and (isconf #q8) (isconf #q5) (isgrasp o10 #g7))
          :effect (isholdingmotion #q8 #t998 #q5 o10 #g7)
   )
   (:action s1023_plan-holding-motion
          :parameters (#q8 #q5 o10 #g8)
          :precondition (and (isconf #q8) (isconf #q5) (isgrasp o10 #g8))
          :effect (isholdingmotion #q8 #t999 #q5 o10 #g8)
   )
   (:action s1024_plan-holding-motion
          :parameters (#q8 #q6 o8 #g0)
          :precondition (and (isconf #q8) (isconf #q6) (isgrasp o8 #g0))
          :effect (isholdingmotion #q8 #t1000 #q6 o8 #g0)
   )
   (:action s1025_plan-holding-motion
          :parameters (#q8 #q6 o9 #g1)
          :precondition (and (isconf #q8) (isconf #q6) (isgrasp o9 #g1))
          :effect (isholdingmotion #q8 #t1001 #q6 o9 #g1)
   )
   (:action s1026_plan-holding-motion
          :parameters (#q8 #q6 o10 #g2)
          :precondition (and (isconf #q8) (isconf #q6) (isgrasp o10 #g2))
          :effect (isholdingmotion #q8 #t1002 #q6 o10 #g2)
   )
   (:action s1027_plan-holding-motion
          :parameters (#q8 #q6 o8 #g3)
          :precondition (and (isconf #q8) (isconf #q6) (isgrasp o8 #g3))
          :effect (isholdingmotion #q8 #t1003 #q6 o8 #g3)
   )
   (:action s1028_plan-holding-motion
          :parameters (#q8 #q6 o8 #g4)
          :precondition (and (isconf #q8) (isconf #q6) (isgrasp o8 #g4))
          :effect (isholdingmotion #q8 #t1004 #q6 o8 #g4)
   )
   (:action s1029_plan-holding-motion
          :parameters (#q8 #q6 o9 #g5)
          :precondition (and (isconf #q8) (isconf #q6) (isgrasp o9 #g5))
          :effect (isholdingmotion #q8 #t1005 #q6 o9 #g5)
   )
   (:action s1030_plan-holding-motion
          :parameters (#q8 #q6 o9 #g6)
          :precondition (and (isconf #q8) (isconf #q6) (isgrasp o9 #g6))
          :effect (isholdingmotion #q8 #t1006 #q6 o9 #g6)
   )
   (:action s1031_plan-holding-motion
          :parameters (#q8 #q6 o10 #g7)
          :precondition (and (isconf #q8) (isconf #q6) (isgrasp o10 #g7))
          :effect (isholdingmotion #q8 #t1007 #q6 o10 #g7)
   )
   (:action s1032_plan-holding-motion
          :parameters (#q8 #q6 o10 #g8)
          :precondition (and (isconf #q8) (isconf #q6) (isgrasp o10 #g8))
          :effect (isholdingmotion #q8 #t1008 #q6 o10 #g8)
   )
   (:action s1033_plan-holding-motion
          :parameters (#q8 #q7 o8 #g0)
          :precondition (and (isconf #q8) (isconf #q7) (isgrasp o8 #g0))
          :effect (isholdingmotion #q8 #t1009 #q7 o8 #g0)
   )
   (:action s1034_plan-holding-motion
          :parameters (#q8 #q7 o9 #g1)
          :precondition (and (isconf #q8) (isconf #q7) (isgrasp o9 #g1))
          :effect (isholdingmotion #q8 #t1010 #q7 o9 #g1)
   )
   (:action s1035_plan-holding-motion
          :parameters (#q8 #q7 o10 #g2)
          :precondition (and (isconf #q8) (isconf #q7) (isgrasp o10 #g2))
          :effect (isholdingmotion #q8 #t1011 #q7 o10 #g2)
   )
   (:action s1036_plan-holding-motion
          :parameters (#q8 #q7 o8 #g3)
          :precondition (and (isconf #q8) (isconf #q7) (isgrasp o8 #g3))
          :effect (isholdingmotion #q8 #t1012 #q7 o8 #g3)
   )
   (:action s1037_plan-holding-motion
          :parameters (#q8 #q7 o8 #g4)
          :precondition (and (isconf #q8) (isconf #q7) (isgrasp o8 #g4))
          :effect (isholdingmotion #q8 #t1013 #q7 o8 #g4)
   )
   (:action s1038_plan-holding-motion
          :parameters (#q8 #q7 o9 #g5)
          :precondition (and (isconf #q8) (isconf #q7) (isgrasp o9 #g5))
          :effect (isholdingmotion #q8 #t1014 #q7 o9 #g5)
   )
   (:action s1039_plan-holding-motion
          :parameters (#q8 #q7 o9 #g6)
          :precondition (and (isconf #q8) (isconf #q7) (isgrasp o9 #g6))
          :effect (isholdingmotion #q8 #t1015 #q7 o9 #g6)
   )
   (:action s1040_plan-holding-motion
          :parameters (#q8 #q7 o10 #g7)
          :precondition (and (isconf #q8) (isconf #q7) (isgrasp o10 #g7))
          :effect (isholdingmotion #q8 #t1016 #q7 o10 #g7)
   )
   (:action s1041_plan-holding-motion
          :parameters (#q8 #q7 o10 #g8)
          :precondition (and (isconf #q8) (isconf #q7) (isgrasp o10 #g8))
          :effect (isholdingmotion #q8 #t1017 #q7 o10 #g8)
   )
   (:action s1042_plan-holding-motion
          :parameters (#q8 #q8 o8 #g0)
          :precondition (and (isconf #q8) (isconf #q8) (isgrasp o8 #g0))
          :effect (isholdingmotion #q8 #t1018 #q8 o8 #g0)
   )
   (:action s1043_plan-holding-motion
          :parameters (#q8 #q8 o9 #g1)
          :precondition (and (isconf #q8) (isconf #q8) (isgrasp o9 #g1))
          :effect (isholdingmotion #q8 #t1019 #q8 o9 #g1)
   )
   (:action s1044_plan-holding-motion
          :parameters (#q8 #q8 o10 #g2)
          :precondition (and (isconf #q8) (isconf #q8) (isgrasp o10 #g2))
          :effect (isholdingmotion #q8 #t1020 #q8 o10 #g2)
   )
   (:action s1045_plan-holding-motion
          :parameters (#q8 #q8 o8 #g3)
          :precondition (and (isconf #q8) (isconf #q8) (isgrasp o8 #g3))
          :effect (isholdingmotion #q8 #t1021 #q8 o8 #g3)
   )
   (:action s1046_plan-holding-motion
          :parameters (#q8 #q8 o8 #g4)
          :precondition (and (isconf #q8) (isconf #q8) (isgrasp o8 #g4))
          :effect (isholdingmotion #q8 #t1022 #q8 o8 #g4)
   )
   (:action s1047_plan-holding-motion
          :parameters (#q8 #q8 o9 #g5)
          :precondition (and (isconf #q8) (isconf #q8) (isgrasp o9 #g5))
          :effect (isholdingmotion #q8 #t1023 #q8 o9 #g5)
   )
   (:action s1048_plan-holding-motion
          :parameters (#q8 #q8 o9 #g6)
          :precondition (and (isconf #q8) (isconf #q8) (isgrasp o9 #g6))
          :effect (isholdingmotion #q8 #t1024 #q8 o9 #g6)
   )
   (:action s1049_plan-holding-motion
          :parameters (#q8 #q8 o10 #g7)
          :precondition (and (isconf #q8) (isconf #q8) (isgrasp o10 #g7))
          :effect (isholdingmotion #q8 #t1025 #q8 o10 #g7)
   )
   (:action s1050_plan-holding-motion
          :parameters (#q8 #q8 o10 #g8)
          :precondition (and (isconf #q8) (isconf #q8) (isgrasp o10 #g8))
          :effect (isholdingmotion #q8 #t1026 #q8 o10 #g8)
   )
)
