;18:47:23 07/09

;Skeleton_SN = 46

(define (domain pick-and-place_propo_reorder)
   (:requirements :strips :equality :action-costs)

   (:types
          wuti grasp_dir grasp config pose trajectory propo_action propo_stream
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
          (_unused ?_s - propo_stream)
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
          :parameters (q608 #q2 #t33)
          :precondition (and (isfreemotion q608 #t33 #q2) (atconf q608) (handempty) (canmove) (_applicable _p0))
          :effect (and (atconf #q2) (not (atconf q608)) (not (canmove)) (canpick) (increase (total-cost) 100) (not (_applicable _p0)) (not (_unused _s27)) (not (_unused _s57)) (when (and (not (_unused _s1)) (not (_unused _s3)) (not (_unused _s4)) (not (_unused _s6)) (not (_unused _s7)) (not (_unused _s8)) (not (_unused _s16)) (not (_unused _s17)) (not (_unused _s18)) (not (_unused _s25)) (not (_unused _s26)) (not (_unused _s29)) (not (_unused _s31)) (not (_unused _s32)) (not (_unused _s104)) (not (_unused _s125)) (not (_unused _s136)) (not (_unused _s286)) (not (_unused _s395)) (not (_unused _s495))) (_applicable _p1)) (not (_unused _s27)) (not (_unused _s57)) (when (and (not (_unused _s1)) (not (_unused _s3)) (not (_unused _s4)) (not (_unused _s6)) (not (_unused _s7)) (not (_unused _s8)) (not (_unused _s16)) (not (_unused _s17)) (not (_unused _s18)) (not (_unused _s25)) (not (_unused _s26)) (not (_unused _s29)) (not (_unused _s31)) (not (_unused _s32)) (not (_unused _s104)) (not (_unused _s125)) (not (_unused _s136)) (not (_unused _s286)) (not (_unused _s395)) (not (_unused _s495))) (_applicable _p1)))
   )
   (:action a1_pick
          :parameters (o10 p608 #g2 #q2 #t3)
          :precondition (and (iskin o10 p608 #g2 #q2 #t3) (atpose o10 p608) (handempty) (atconf #q2) (canpick) (not (usedgrasp o10 p608 #g2)) (graspatpose #g2 p608) (_applicable _p1))
          :effect (and (atgrasp o10 #g2) (canmove) (not (atpose o10 p608)) (not (handempty)) (increase (total-cost) 100) (not (_applicable _p1)) (not (_unused _s27)) (not (_unused _s18)) (when (and (not (_unused _s1)) (not (_unused _s3)) (not (_unused _s4)) (not (_unused _s6)) (not (_unused _s7)) (not (_unused _s8)) (not (_unused _s16)) (not (_unused _s17)) (not (_unused _s25)) (not (_unused _s26)) (not (_unused _s29)) (not (_unused _s31)) (not (_unused _s32)) (not (_unused _s57)) (not (_unused _s104)) (not (_unused _s125)) (not (_unused _s136)) (not (_unused _s286)) (not (_unused _s395)) (not (_unused _s495))) (_applicable _p2)) (not (_unused _s27)) (not (_unused _s18)) (when (and (not (_unused _s1)) (not (_unused _s3)) (not (_unused _s4)) (not (_unused _s6)) (not (_unused _s7)) (not (_unused _s8)) (not (_unused _s16)) (not (_unused _s17)) (not (_unused _s25)) (not (_unused _s26)) (not (_unused _s29)) (not (_unused _s31)) (not (_unused _s32)) (not (_unused _s57)) (not (_unused _s104)) (not (_unused _s125)) (not (_unused _s136)) (not (_unused _s286)) (not (_unused _s395)) (not (_unused _s495))) (_applicable _p2)))
   )
   (:action a2_move_holding
          :parameters (#q2 #q7 o10 #g2 #t471)
          :precondition (and (isholdingmotion #q2 #t471 #q7 o10 #g2) (atconf #q2) (atgrasp o10 #g2) (canmove) (_applicable _p2))
          :effect (and (atconf #q7) (not (atconf #q2)) (not (canmove)) (canpick) (canplace) (increase (total-cost) 100) (not (_applicable _p2)) (not (_unused _s495)) (not (_unused _s27)) (not (_unused _s18)) (not (_unused _s32)) (when (and (not (_unused _s1)) (not (_unused _s3)) (not (_unused _s4)) (not (_unused _s6)) (not (_unused _s7)) (not (_unused _s8)) (not (_unused _s16)) (not (_unused _s17)) (not (_unused _s25)) (not (_unused _s26)) (not (_unused _s29)) (not (_unused _s31)) (not (_unused _s57)) (not (_unused _s104)) (not (_unused _s125)) (not (_unused _s136)) (not (_unused _s286)) (not (_unused _s395))) (_applicable _p3)) (not (_unused _s495)) (not (_unused _s27)) (not (_unused _s18)) (not (_unused _s32)) (when (and (not (_unused _s1)) (not (_unused _s3)) (not (_unused _s4)) (not (_unused _s6)) (not (_unused _s7)) (not (_unused _s8)) (not (_unused _s16)) (not (_unused _s17)) (not (_unused _s25)) (not (_unused _s26)) (not (_unused _s29)) (not (_unused _s31)) (not (_unused _s57)) (not (_unused _s104)) (not (_unused _s125)) (not (_unused _s136)) (not (_unused _s286)) (not (_unused _s395))) (_applicable _p3)))
   )
   (:action a3_place
          :parameters (o10 #p4 o6 #g2 #q7 #t8)
          :precondition (and (iskin o10 #p4 #g2 #q7 #t8) (issupport o10 #p4 o6) (atgrasp o10 #g2) (atconf #q7) (graspable o10) (fixed o6) (canplace) (_applicable _p3))
          :effect (and (atpose o10 #p4) (handempty) (canmove) (not (atgrasp o10 #g2)) (not (canpick)) (not (canplace)) (increase (total-cost) 100) (allowlocate) (not (located o10 #p4)) (usedgrasp o10 #p4 #g2) (not (_applicable _p3)) (not (_unused _s32)) (not (_unused _s18)) (not (_unused _s4)) (when (and (not (_unused _s1)) (not (_unused _s3)) (not (_unused _s6)) (not (_unused _s7)) (not (_unused _s8)) (not (_unused _s16)) (not (_unused _s17)) (not (_unused _s25)) (not (_unused _s26)) (not (_unused _s27)) (not (_unused _s29)) (not (_unused _s31)) (not (_unused _s57)) (not (_unused _s104)) (not (_unused _s125)) (not (_unused _s136)) (not (_unused _s286)) (not (_unused _s395)) (not (_unused _s495))) (_applicable _p4)) (not (_unused _s32)) (not (_unused _s18)) (not (_unused _s4)) (when (and (not (_unused _s1)) (not (_unused _s3)) (not (_unused _s6)) (not (_unused _s7)) (not (_unused _s8)) (not (_unused _s16)) (not (_unused _s17)) (not (_unused _s25)) (not (_unused _s26)) (not (_unused _s27)) (not (_unused _s29)) (not (_unused _s31)) (not (_unused _s57)) (not (_unused _s104)) (not (_unused _s125)) (not (_unused _s136)) (not (_unused _s286)) (not (_unused _s395)) (not (_unused _s495))) (_applicable _p4)))
   )
   (:action a4_move_free
          :parameters (#q7 #q1 #t112)
          :precondition (and (isfreemotion #q7 #t112 #q1) (atconf #q7) (handempty) (canmove) (_applicable _p4))
          :effect (and (atconf #q1) (not (atconf #q7)) (not (canmove)) (canpick) (increase (total-cost) 100) (not (_applicable _p4)) (not (_unused _s32)) (not (_unused _s136)) (not (_unused _s26)) (when (and (not (_unused _s1)) (not (_unused _s3)) (not (_unused _s4)) (not (_unused _s6)) (not (_unused _s7)) (not (_unused _s8)) (not (_unused _s16)) (not (_unused _s17)) (not (_unused _s18)) (not (_unused _s25)) (not (_unused _s27)) (not (_unused _s29)) (not (_unused _s31)) (not (_unused _s57)) (not (_unused _s104)) (not (_unused _s125)) (not (_unused _s286)) (not (_unused _s395)) (not (_unused _s495))) (_applicable _p5)) (not (_unused _s32)) (not (_unused _s136)) (not (_unused _s26)) (when (and (not (_unused _s1)) (not (_unused _s3)) (not (_unused _s4)) (not (_unused _s6)) (not (_unused _s7)) (not (_unused _s8)) (not (_unused _s16)) (not (_unused _s17)) (not (_unused _s18)) (not (_unused _s25)) (not (_unused _s27)) (not (_unused _s29)) (not (_unused _s31)) (not (_unused _s57)) (not (_unused _s104)) (not (_unused _s125)) (not (_unused _s286)) (not (_unused _s395)) (not (_unused _s495))) (_applicable _p5)))
   )
   (:action a5_pick
          :parameters (o9 p424 #g1 #q1 #t2)
          :precondition (and (iskin o9 p424 #g1 #q1 #t2) (atpose o9 p424) (handempty) (atconf #q1) (canpick) (not (usedgrasp o9 p424 #g1)) (graspatpose #g1 p424) (_applicable _p5))
          :effect (and (atgrasp o9 #g1) (canmove) (not (atpose o9 p424)) (not (handempty)) (increase (total-cost) 100) (not (_applicable _p5)) (not (_unused _s26)) (not (_unused _s17)) (when (and (not (_unused _s1)) (not (_unused _s3)) (not (_unused _s4)) (not (_unused _s6)) (not (_unused _s7)) (not (_unused _s8)) (not (_unused _s16)) (not (_unused _s18)) (not (_unused _s25)) (not (_unused _s27)) (not (_unused _s29)) (not (_unused _s31)) (not (_unused _s32)) (not (_unused _s57)) (not (_unused _s104)) (not (_unused _s125)) (not (_unused _s136)) (not (_unused _s286)) (not (_unused _s395)) (not (_unused _s495))) (_applicable _p6)) (not (_unused _s26)) (not (_unused _s17)) (when (and (not (_unused _s1)) (not (_unused _s3)) (not (_unused _s4)) (not (_unused _s6)) (not (_unused _s7)) (not (_unused _s8)) (not (_unused _s16)) (not (_unused _s18)) (not (_unused _s25)) (not (_unused _s27)) (not (_unused _s29)) (not (_unused _s31)) (not (_unused _s32)) (not (_unused _s57)) (not (_unused _s104)) (not (_unused _s125)) (not (_unused _s136)) (not (_unused _s286)) (not (_unused _s395)) (not (_unused _s495))) (_applicable _p6)))
   )
   (:action a6_move_holding
          :parameters (#q1 #q6 o9 #g1 #t371)
          :precondition (and (isholdingmotion #q1 #t371 #q6 o9 #g1) (atconf #q1) (atgrasp o9 #g1) (canmove) (_applicable _p6))
          :effect (and (atconf #q6) (not (atconf #q1)) (not (canmove)) (canpick) (canplace) (increase (total-cost) 100) (not (_applicable _p6)) (not (_unused _s395)) (not (_unused _s31)) (not (_unused _s26)) (not (_unused _s17)) (when (and (not (_unused _s1)) (not (_unused _s3)) (not (_unused _s4)) (not (_unused _s6)) (not (_unused _s7)) (not (_unused _s8)) (not (_unused _s16)) (not (_unused _s18)) (not (_unused _s25)) (not (_unused _s27)) (not (_unused _s29)) (not (_unused _s32)) (not (_unused _s57)) (not (_unused _s104)) (not (_unused _s125)) (not (_unused _s136)) (not (_unused _s286)) (not (_unused _s495))) (_applicable _p7)) (not (_unused _s395)) (not (_unused _s31)) (not (_unused _s26)) (not (_unused _s17)) (when (and (not (_unused _s1)) (not (_unused _s3)) (not (_unused _s4)) (not (_unused _s6)) (not (_unused _s7)) (not (_unused _s8)) (not (_unused _s16)) (not (_unused _s18)) (not (_unused _s25)) (not (_unused _s27)) (not (_unused _s29)) (not (_unused _s32)) (not (_unused _s57)) (not (_unused _s104)) (not (_unused _s125)) (not (_unused _s136)) (not (_unused _s286)) (not (_unused _s495))) (_applicable _p7)))
   )
   (:action a7_place
          :parameters (o9 #p3 o7 #g1 #q6 #t7)
          :precondition (and (iskin o9 #p3 #g1 #q6 #t7) (issupport o9 #p3 o7) (atgrasp o9 #g1) (atconf #q6) (graspable o9) (fixed o7) (canplace) (_applicable _p7))
          :effect (and (atpose o9 #p3) (handempty) (canmove) (not (atgrasp o9 #g1)) (not (canpick)) (not (canplace)) (increase (total-cost) 100) (allowlocate) (not (located o9 #p3)) (usedgrasp o9 #p3 #g1) (not (_applicable _p7)) (not (_unused _s3)) (not (_unused _s31)) (not (_unused _s17)) (when (and (not (_unused _s1)) (not (_unused _s4)) (not (_unused _s6)) (not (_unused _s7)) (not (_unused _s8)) (not (_unused _s16)) (not (_unused _s18)) (not (_unused _s25)) (not (_unused _s26)) (not (_unused _s27)) (not (_unused _s29)) (not (_unused _s32)) (not (_unused _s57)) (not (_unused _s104)) (not (_unused _s125)) (not (_unused _s136)) (not (_unused _s286)) (not (_unused _s395)) (not (_unused _s495))) (_applicable _p8)) (not (_unused _s3)) (not (_unused _s31)) (not (_unused _s17)) (when (and (not (_unused _s1)) (not (_unused _s4)) (not (_unused _s6)) (not (_unused _s7)) (not (_unused _s8)) (not (_unused _s16)) (not (_unused _s18)) (not (_unused _s25)) (not (_unused _s26)) (not (_unused _s27)) (not (_unused _s29)) (not (_unused _s32)) (not (_unused _s57)) (not (_unused _s104)) (not (_unused _s125)) (not (_unused _s136)) (not (_unused _s286)) (not (_unused _s395)) (not (_unused _s495))) (_applicable _p8)))
   )
   (:action a8_move_free
          :parameters (#q6 #q0 #t101)
          :precondition (and (isfreemotion #q6 #t101 #q0) (atconf #q6) (handempty) (canmove) (_applicable _p8))
          :effect (and (atconf #q0) (not (atconf #q6)) (not (canmove)) (canpick) (increase (total-cost) 100) (not (_applicable _p8)) (not (_unused _s31)) (not (_unused _s125)) (not (_unused _s25)) (when (and (not (_unused _s1)) (not (_unused _s3)) (not (_unused _s4)) (not (_unused _s6)) (not (_unused _s7)) (not (_unused _s8)) (not (_unused _s16)) (not (_unused _s17)) (not (_unused _s18)) (not (_unused _s26)) (not (_unused _s27)) (not (_unused _s29)) (not (_unused _s32)) (not (_unused _s57)) (not (_unused _s104)) (not (_unused _s136)) (not (_unused _s286)) (not (_unused _s395)) (not (_unused _s495))) (_applicable _p9)) (not (_unused _s31)) (not (_unused _s125)) (not (_unused _s25)) (when (and (not (_unused _s1)) (not (_unused _s3)) (not (_unused _s4)) (not (_unused _s6)) (not (_unused _s7)) (not (_unused _s8)) (not (_unused _s16)) (not (_unused _s17)) (not (_unused _s18)) (not (_unused _s26)) (not (_unused _s27)) (not (_unused _s29)) (not (_unused _s32)) (not (_unused _s57)) (not (_unused _s104)) (not (_unused _s136)) (not (_unused _s286)) (not (_unused _s395)) (not (_unused _s495))) (_applicable _p9)))
   )
   (:action a9_pick
          :parameters (o8 p632 #g0 #q0 #t1)
          :precondition (and (iskin o8 p632 #g0 #q0 #t1) (atpose o8 p632) (handempty) (atconf #q0) (canpick) (not (usedgrasp o8 p632 #g0)) (graspatpose #g0 p632) (_applicable _p9))
          :effect (and (atgrasp o8 #g0) (canmove) (not (atpose o8 p632)) (not (handempty)) (increase (total-cost) 100) (not (_applicable _p9)) (not (_unused _s25)) (not (_unused _s16)) (when (and (not (_unused _s1)) (not (_unused _s3)) (not (_unused _s4)) (not (_unused _s6)) (not (_unused _s7)) (not (_unused _s8)) (not (_unused _s17)) (not (_unused _s18)) (not (_unused _s26)) (not (_unused _s27)) (not (_unused _s29)) (not (_unused _s31)) (not (_unused _s32)) (not (_unused _s57)) (not (_unused _s104)) (not (_unused _s125)) (not (_unused _s136)) (not (_unused _s286)) (not (_unused _s395)) (not (_unused _s495))) (_applicable _p10)) (not (_unused _s25)) (not (_unused _s16)) (when (and (not (_unused _s1)) (not (_unused _s3)) (not (_unused _s4)) (not (_unused _s6)) (not (_unused _s7)) (not (_unused _s8)) (not (_unused _s17)) (not (_unused _s18)) (not (_unused _s26)) (not (_unused _s27)) (not (_unused _s29)) (not (_unused _s31)) (not (_unused _s32)) (not (_unused _s57)) (not (_unused _s104)) (not (_unused _s125)) (not (_unused _s136)) (not (_unused _s286)) (not (_unused _s395)) (not (_unused _s495))) (_applicable _p10)))
   )
   (:action a10_move_holding
          :parameters (#q0 #q4 o8 #g0 #t262)
          :precondition (and (isholdingmotion #q0 #t262 #q4 o8 #g0) (atconf #q0) (atgrasp o8 #g0) (canmove) (_applicable _p10))
          :effect (and (atconf #q4) (not (atconf #q0)) (not (canmove)) (canpick) (canplace) (increase (total-cost) 100) (not (_applicable _p10)) (not (_unused _s29)) (not (_unused _s25)) (not (_unused _s16)) (not (_unused _s286)) (when (and (not (_unused _s1)) (not (_unused _s3)) (not (_unused _s4)) (not (_unused _s6)) (not (_unused _s7)) (not (_unused _s8)) (not (_unused _s17)) (not (_unused _s18)) (not (_unused _s26)) (not (_unused _s27)) (not (_unused _s31)) (not (_unused _s32)) (not (_unused _s57)) (not (_unused _s104)) (not (_unused _s125)) (not (_unused _s136)) (not (_unused _s395)) (not (_unused _s495))) (_applicable _p11)) (not (_unused _s29)) (not (_unused _s25)) (not (_unused _s16)) (not (_unused _s286)) (when (and (not (_unused _s1)) (not (_unused _s3)) (not (_unused _s4)) (not (_unused _s6)) (not (_unused _s7)) (not (_unused _s8)) (not (_unused _s17)) (not (_unused _s18)) (not (_unused _s26)) (not (_unused _s27)) (not (_unused _s31)) (not (_unused _s32)) (not (_unused _s57)) (not (_unused _s104)) (not (_unused _s125)) (not (_unused _s136)) (not (_unused _s395)) (not (_unused _s495))) (_applicable _p11)))
   )
   (:action a11_place
          :parameters (o8 #p1 o7 #g0 #q4 #t5)
          :precondition (and (iskin o8 #p1 #g0 #q4 #t5) (issupport o8 #p1 o7) (atgrasp o8 #g0) (atconf #q4) (graspable o8) (fixed o7) (canplace) (_applicable _p11))
          :effect (and (atpose o8 #p1) (handempty) (canmove) (not (atgrasp o8 #g0)) (not (canpick)) (not (canplace)) (increase (total-cost) 100) (allowlocate) (not (located o8 #p1)) (usedgrasp o8 #p1 #g0) (not (_applicable _p11)) (not (_unused _s29)) (not (_unused _s1)) (not (_unused _s16)) (when (and (not (_unused _s3)) (not (_unused _s4)) (not (_unused _s6)) (not (_unused _s7)) (not (_unused _s8)) (not (_unused _s17)) (not (_unused _s18)) (not (_unused _s25)) (not (_unused _s26)) (not (_unused _s27)) (not (_unused _s31)) (not (_unused _s32)) (not (_unused _s57)) (not (_unused _s104)) (not (_unused _s125)) (not (_unused _s136)) (not (_unused _s286)) (not (_unused _s395)) (not (_unused _s495))) (_applicable _p12)) (not (_unused _s29)) (not (_unused _s1)) (not (_unused _s16)) (when (and (not (_unused _s3)) (not (_unused _s4)) (not (_unused _s6)) (not (_unused _s7)) (not (_unused _s8)) (not (_unused _s17)) (not (_unused _s18)) (not (_unused _s25)) (not (_unused _s26)) (not (_unused _s27)) (not (_unused _s31)) (not (_unused _s32)) (not (_unused _s57)) (not (_unused _s104)) (not (_unused _s125)) (not (_unused _s136)) (not (_unused _s286)) (not (_unused _s395)) (not (_unused _s495))) (_applicable _p12)))
   )
   (:action a12_move_free
          :parameters (#q4 q608 #t80)
          :precondition (and (isfreemotion #q4 #t80 q608) (atconf #q4) (handempty) (canmove) (_applicable _p12))
          :effect (and (atconf q608) (not (atconf #q4)) (not (canmove)) (canpick) (increase (total-cost) 100) (not (_applicable _p12)) (not (_unused _s29)) (not (_unused _s104)) (when (and (not (_unused _s1)) (not (_unused _s3)) (not (_unused _s4)) (not (_unused _s6)) (not (_unused _s7)) (not (_unused _s8)) (not (_unused _s16)) (not (_unused _s17)) (not (_unused _s18)) (not (_unused _s25)) (not (_unused _s26)) (not (_unused _s27)) (not (_unused _s31)) (not (_unused _s32)) (not (_unused _s57)) (not (_unused _s125)) (not (_unused _s136)) (not (_unused _s286)) (not (_unused _s395)) (not (_unused _s495))) (_applicable _p13)) (not (_unused _s29)) (not (_unused _s104)) (when (and (not (_unused _s1)) (not (_unused _s3)) (not (_unused _s4)) (not (_unused _s6)) (not (_unused _s7)) (not (_unused _s8)) (not (_unused _s16)) (not (_unused _s17)) (not (_unused _s18)) (not (_unused _s25)) (not (_unused _s26)) (not (_unused _s27)) (not (_unused _s31)) (not (_unused _s32)) (not (_unused _s57)) (not (_unused _s125)) (not (_unused _s136)) (not (_unused _s286)) (not (_unused _s395)) (not (_unused _s495))) (_applicable _p13)))
   )
   (:action s1_sample-place
          :parameters (o8 o7)
          :precondition (stackable o8 o7)
          :effect (and (ispose o8 #p1) (issupport o8 #p1 o7) (_unused _s1))
   )
   (:action s3_sample-place
          :parameters (o9 o7)
          :precondition (stackable o9 o7)
          :effect (and (ispose o9 #p3) (issupport o9 #p3 o7) (_unused _s3))
   )
   (:action s4_sample-place
          :parameters (o10 o6)
          :precondition (stackable o10 o6)
          :effect (and (ispose o10 #p4) (issupport o10 #p4 o6) (_unused _s4))
   )
   (:action s6_sample-grasp-dir
          :parameters (o8 p632)
          :precondition (and (graspable o8) (ispose o8 p632))
          :effect (and (isgraspdir o8 p632 #d0) (_unused _s6))
   )
   (:action s7_sample-grasp-dir
          :parameters (o9 p424)
          :precondition (and (graspable o9) (ispose o9 p424))
          :effect (and (isgraspdir o9 p424 #d1) (_unused _s7))
   )
   (:action s8_sample-grasp-dir
          :parameters (o10 p608)
          :precondition (and (graspable o10) (ispose o10 p608))
          :effect (and (isgraspdir o10 p608 #d2) (_unused _s8))
   )
   (:action s16_sample-grasp
          :parameters (o8 p632 #d0)
          :precondition (isgraspdir o8 p632 #d0)
          :effect (and (graspatpose #g0 p632) (isgrasp o8 #g0) (not (_unused _s6)) (_unused _s16))
   )
   (:action s17_sample-grasp
          :parameters (o9 p424 #d1)
          :precondition (isgraspdir o9 p424 #d1)
          :effect (and (graspatpose #g1 p424) (isgrasp o9 #g1) (not (_unused _s7)) (_unused _s17))
   )
   (:action s18_sample-grasp
          :parameters (o10 p608 #d2)
          :precondition (isgraspdir o10 p608 #d2)
          :effect (and (graspatpose #g2 p608) (isgrasp o10 #g2) (not (_unused _s8)) (_unused _s18))
   )
   (:action s25_inverse-kinematics
          :parameters (o8 p632 #g0)
          :precondition (and (ispose o8 p632) (isgrasp o8 #g0))
          :effect (and (isconf #q0) (istraj #t1) (iskin o8 p632 #g0 #q0 #t1) (not (_unused _s16)) (_unused _s25))
   )
   (:action s26_inverse-kinematics
          :parameters (o9 p424 #g1)
          :precondition (and (ispose o9 p424) (isgrasp o9 #g1))
          :effect (and (isconf #q1) (istraj #t2) (iskin o9 p424 #g1 #q1 #t2) (not (_unused _s17)) (_unused _s26))
   )
   (:action s27_inverse-kinematics
          :parameters (o10 p608 #g2)
          :precondition (and (ispose o10 p608) (isgrasp o10 #g2))
          :effect (and (isconf #q2) (istraj #t3) (iskin o10 p608 #g2 #q2 #t3) (not (_unused _s18)) (_unused _s27))
   )
   (:action s29_inverse-kinematics
          :parameters (o8 #p1 #g0)
          :precondition (and (ispose o8 #p1) (isgrasp o8 #g0))
          :effect (and (isconf #q4) (istraj #t5) (iskin o8 #p1 #g0 #q4 #t5) (not (_unused _s1)) (not (_unused _s16)) (_unused _s29))
   )
   (:action s31_inverse-kinematics
          :parameters (o9 #p3 #g1)
          :precondition (and (ispose o9 #p3) (isgrasp o9 #g1))
          :effect (and (isconf #q6) (istraj #t7) (iskin o9 #p3 #g1 #q6 #t7) (not (_unused _s3)) (not (_unused _s17)) (_unused _s31))
   )
   (:action s32_inverse-kinematics
          :parameters (o10 #p4 #g2)
          :precondition (and (ispose o10 #p4) (isgrasp o10 #g2))
          :effect (and (isconf #q7) (istraj #t8) (iskin o10 #p4 #g2 #q7 #t8) (not (_unused _s18)) (not (_unused _s4)) (_unused _s32))
   )
   (:action s57_plan-free-motion
          :parameters (q608 #q2)
          :precondition (and (isconf q608) (isconf #q2))
          :effect (and (isfreemotion q608 #t33 #q2) (not (_unused _s27)) (_unused _s57))
   )
   (:action s104_plan-free-motion
          :parameters (#q4 q608)
          :precondition (and (isconf #q4) (isconf q608))
          :effect (and (isfreemotion #q4 #t80 q608) (not (_unused _s29)) (_unused _s104))
   )
   (:action s125_plan-free-motion
          :parameters (#q6 #q0)
          :precondition (and (isconf #q6) (isconf #q0))
          :effect (and (isfreemotion #q6 #t101 #q0) (not (_unused _s31)) (not (_unused _s25)) (_unused _s125))
   )
   (:action s136_plan-free-motion
          :parameters (#q7 #q1)
          :precondition (and (isconf #q7) (isconf #q1))
          :effect (and (isfreemotion #q7 #t112 #q1) (not (_unused _s32)) (not (_unused _s26)) (_unused _s136))
   )
   (:action s286_plan-holding-motion
          :parameters (#q0 #q4 o8 #g0)
          :precondition (and (isconf #q0) (isconf #q4) (isgrasp o8 #g0))
          :effect (and (isholdingmotion #q0 #t262 #q4 o8 #g0) (not (_unused _s29)) (not (_unused _s25)) (not (_unused _s16)) (_unused _s286))
   )
   (:action s395_plan-holding-motion
          :parameters (#q1 #q6 o9 #g1)
          :precondition (and (isconf #q1) (isconf #q6) (isgrasp o9 #g1))
          :effect (and (isholdingmotion #q1 #t371 #q6 o9 #g1) (not (_unused _s31)) (not (_unused _s26)) (not (_unused _s17)) (_unused _s395))
   )
   (:action s495_plan-holding-motion
          :parameters (#q2 #q7 o10 #g2)
          :precondition (and (isconf #q2) (isconf #q7) (isgrasp o10 #g2))
          :effect (and (isholdingmotion #q2 #t471 #q7 o10 #g2) (not (_unused _s27)) (not (_unused _s18)) (not (_unused _s32)) (_unused _s495))
   )
)
