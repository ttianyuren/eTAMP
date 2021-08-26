;15:15:16 26/08

;Skeleton_SN = 1

(define (domain pr2-tamp_propo)
   (:requirements :strips :equality :action-costs)

   (:types
          arm wuti grasp config pose trajectory propo_action
   )

   (:constants
          #p0 #p1 #p10 #p11 #p12 #p13 #p14 #p15 #p16 #p17 #p2 #p3 #p4 #p5 #p6 #p7 #p8 #p9 - pose
          #g0 #g1 #g2 #g3 #g4 #g5 - grasp
          #t0 #t1 #t10 #t100 #t101 #t102 #t103 #t104 #t105 #t106 #t107 #t108 #t109 #t11 #t110 #t111 #t112 #t113 #t114 #t115 #t116 #t117 #t118 #t119 #t12 #t120 #t121 #t122 #t123 #t124 #t125 #t126 #t127 #t128 #t129 #t13 #t130 #t131 #t132 #t133 #t134 #t135 #t136 #t137 #t138 #t139 #t14 #t140 #t141 #t142 #t143 #t144 #t145 #t146 #t147 #t148 #t149 #t15 #t150 #t151 #t152 #t153 #t154 #t155 #t156 #t157 #t158 #t159 #t16 #t160 #t161 #t162 #t163 #t164 #t165 #t166 #t167 #t168 #t169 #t17 #t170 #t171 #t172 #t173 #t174 #t175 #t176 #t177 #t178 #t179 #t18 #t180 #t181 #t182 #t183 #t184 #t185 #t186 #t187 #t188 #t189 #t19 #t190 #t191 #t192 #t193 #t194 #t195 #t196 #t197 #t198 #t199 #t2 #t20 #t200 #t201 #t202 #t203 #t204 #t205 #t206 #t207 #t208 #t209 #t21 #t210 #t211 #t212 #t213 #t214 #t215 #t216 #t217 #t218 #t219 #t22 #t220 #t221 #t222 #t223 #t224 #t225 #t226 #t227 #t228 #t229 #t23 #t230 #t231 #t232 #t233 #t234 #t235 #t236 #t237 #t238 #t239 #t24 #t240 #t241 #t242 #t243 #t244 #t245 #t246 #t247 #t248 #t249 #t25 #t250 #t251 #t252 #t253 #t254 #t255 #t256 #t257 #t258 #t259 #t26 #t260 #t261 #t262 #t263 #t264 #t265 #t266 #t267 #t268 #t269 #t27 #t270 #t271 #t272 #t273 #t274 #t275 #t276 #t277 #t278 #t279 #t28 #t280 #t281 #t282 #t283 #t284 #t285 #t286 #t287 #t288 #t289 #t29 #t290 #t291 #t292 #t293 #t294 #t295 #t296 #t297 #t298 #t299 #t3 #t30 #t300 #t301 #t302 #t303 #t304 #t305 #t306 #t307 #t308 #t309 #t31 #t310 #t311 #t312 #t313 #t314 #t315 #t316 #t317 #t318 #t319 #t32 #t320 #t321 #t322 #t323 #t324 #t325 #t326 #t327 #t328 #t329 #t33 #t330 #t331 #t332 #t333 #t334 #t335 #t336 #t337 #t338 #t339 #t34 #t340 #t341 #t342 #t343 #t344 #t345 #t346 #t347 #t348 #t349 #t35 #t350 #t351 #t352 #t353 #t354 #t355 #t356 #t357 #t358 #t359 #t36 #t360 #t361 #t362 #t363 #t364 #t365 #t366 #t367 #t368 #t369 #t37 #t370 #t371 #t372 #t373 #t374 #t375 #t376 #t377 #t378 #t379 #t38 #t380 #t381 #t382 #t383 #t384 #t385 #t386 #t387 #t388 #t389 #t39 #t390 #t391 #t392 #t393 #t394 #t395 #t396 #t397 #t398 #t399 #t4 #t40 #t400 #t401 #t402 #t403 #t404 #t405 #t406 #t407 #t408 #t409 #t41 #t410 #t411 #t412 #t413 #t414 #t415 #t416 #t417 #t418 #t419 #t42 #t420 #t421 #t422 #t423 #t424 #t425 #t426 #t427 #t428 #t429 #t43 #t430 #t431 #t432 #t433 #t434 #t435 #t436 #t437 #t438 #t439 #t44 #t440 #t441 #t442 #t443 #t444 #t445 #t446 #t447 #t448 #t449 #t45 #t450 #t451 #t452 #t453 #t454 #t455 #t456 #t457 #t458 #t459 #t46 #t460 #t461 #t462 #t463 #t464 #t465 #t466 #t467 #t468 #t469 #t47 #t470 #t471 #t472 #t473 #t474 #t475 #t476 #t477 #t478 #t479 #t48 #t480 #t481 #t482 #t483 #t484 #t485 #t486 #t487 #t488 #t489 #t49 #t490 #t491 #t492 #t493 #t494 #t495 #t496 #t497 #t498 #t499 #t5 #t50 #t500 #t501 #t502 #t503 #t504 #t505 #t506 #t507 #t508 #t509 #t51 #t510 #t511 #t512 #t513 #t514 #t515 #t516 #t517 #t518 #t519 #t52 #t520 #t521 #t522 #t523 #t524 #t525 #t526 #t527 #t528 #t529 #t53 #t530 #t531 #t532 #t533 #t534 #t535 #t536 #t537 #t538 #t539 #t54 #t540 #t541 #t542 #t543 #t544 #t545 #t546 #t547 #t548 #t549 #t55 #t550 #t551 #t552 #t553 #t554 #t555 #t556 #t557 #t558 #t559 #t56 #t560 #t561 #t562 #t563 #t564 #t565 #t566 #t567 #t568 #t569 #t57 #t570 #t571 #t572 #t573 #t574 #t575 #t576 #t577 #t578 #t579 #t58 #t580 #t581 #t582 #t583 #t584 #t585 #t586 #t587 #t588 #t589 #t59 #t590 #t591 #t592 #t593 #t594 #t595 #t596 #t597 #t598 #t599 #t6 #t60 #t600 #t601 #t602 #t603 #t604 #t605 #t606 #t607 #t608 #t609 #t61 #t610 #t611 #t612 #t613 #t614 #t615 #t616 #t617 #t618 #t619 #t62 #t620 #t621 #t622 #t623 #t624 #t625 #t626 #t627 #t628 #t629 #t63 #t630 #t631 #t632 #t633 #t634 #t635 #t636 #t637 #t638 #t639 #t64 #t640 #t641 #t642 #t643 #t644 #t645 #t646 #t647 #t648 #t65 #t66 #t67 #t68 #t69 #t7 #t70 #t71 #t72 #t73 #t74 #t75 #t76 #t77 #t78 #t79 #t8 #t80 #t81 #t82 #t83 #t84 #t85 #t86 #t87 #t88 #t89 #t9 #t90 #t91 #t92 #t93 #t94 #t95 #t96 #t97 #t98 #t99 - trajectory
          #q0 #q1 #q10 #q11 #q12 #q13 #q14 #q15 #q16 #q17 #q18 #q19 #q2 #q20 #q21 #q22 #q23 #q3 #q4 #q5 #q6 #q7 #q8 #q9 - config
   )

   (:predicates
          (isarm ?a - arm)
          (controllable ?a - arm)
          (stackable ?o - wuti ?r - wuti)
          (sink ?r - wuti)
          (stove ?r - wuti)
          (ispose ?o - wuti ?p - pose)
          (isgrasp ?o - wuti ?g - grasp)
          (kin ?a - arm ?o - wuti ?p - pose ?g - grasp ?q - config ?t - trajectory)
          (basemotion ?q1 - config ?t - trajectory ?q2 - config)
          (supported ?o - wuti ?p - pose ?r - wuti)
          (atpose ?o - wuti ?p - pose)
          (atgrasp ?a - arm ?o - wuti ?g - grasp)
          (graspable ?o - wuti)
          (handempty ?a - arm)
          (atbconf ?q - config)
          (isbconf ?q - config)
          (canmove)
          (cleaned ?o - wuti)
          (cooked ?o - wuti)
          (canoperate)
          (on ?o - wuti ?r - wuti)
          (holding ?a - arm ?o - wuti)
          (_applicable ?_p - propo_action)
   )

   (:derived (on ?o - wuti ?r - wuti)
          (exists (?p) (and (supported ?o ?p ?r) (atpose ?o ?p)))
   )
   (:derived (holding ?a - arm ?o - wuti)
          (exists (?g) (and (isarm ?a) (isgrasp ?o ?g) (atgrasp ?a ?o ?g)))
   )

   (:action a0_move_base
          :parameters (q8 #q3 #t28)
          :precondition (and (basemotion q8 #t28 #q3) (atbconf q8) (canmove) (_applicable _p0))
          :effect (and (atbconf #q3) (not (atbconf q8)) (not (canmove)) (increase (total-cost) 200) (not (canoperate)) (not (_applicable _p0)) (_applicable _p1))
   )
   (:action a1_pick
          :parameters ('left' o8 p480 #g3 #q3 #t4)
          :precondition (and (kin 'left' o8 p480 #g3 #q3 #t4) (atpose o8 p480) (handempty 'left') (atbconf #q3) (_applicable _p1))
          :effect (and (atgrasp 'left' o8 #g3) (canmove) (not (atpose o8 p480)) (not (handempty 'left')) (increase (total-cost) 100) (not (canoperate)) (not (_applicable _p1)) (_applicable _p2))
   )
   (:action a2_move_base
          :parameters (#q3 #q16 #t141)
          :precondition (and (basemotion #q3 #t141 #q16) (atbconf #q3) (canmove) (_applicable _p2))
          :effect (and (atbconf #q16) (not (atbconf #q3)) (not (canmove)) (increase (total-cost) 200) (not (canoperate)) (not (_applicable _p2)) (_applicable _p3))
   )
   (:action a3_place
          :parameters ('left' o8 #p10 #g3 #q16 #t17)
          :precondition (and (kin 'left' o8 #p10 #g3 #q16 #t17) (atgrasp 'left' o8 #g3) (atbconf #q16) (_applicable _p3))
          :effect (and (atpose o8 #p10) (handempty 'left') (canmove) (not (atgrasp 'left' o8 #g3)) (increase (total-cost) 100) (canoperate) (not (_applicable _p3)) (_applicable _p4))
   )
   (:action a4_clean
          :parameters (o8 o3)
          :precondition (and (stackable o8 o3) (sink o3) (on o8 o3) (canoperate) (_applicable _p4))
          :effect (and (cleaned o8) (increase (total-cost) 50) (not (canoperate)) (not (_applicable _p4)) (_applicable _p5))
   )
   (:action a5_pick
          :parameters ('left' o8 #p10 #g3 #q16 #t17)
          :precondition (and (kin 'left' o8 #p10 #g3 #q16 #t17) (atpose o8 #p10) (handempty 'left') (atbconf #q16) (_applicable _p5))
          :effect (and (atgrasp 'left' o8 #g3) (canmove) (not (atpose o8 #p10)) (not (handempty 'left')) (increase (total-cost) 100) (not (canoperate)) (not (_applicable _p5)) (_applicable _p6))
   )
   (:action a6_move_base
          :parameters (#q16 #q17 #t467)
          :precondition (and (basemotion #q16 #t467 #q17) (atbconf #q16) (canmove) (_applicable _p6))
          :effect (and (atbconf #q17) (not (atbconf #q16)) (not (canmove)) (increase (total-cost) 200) (not (canoperate)) (not (_applicable _p6)) (_applicable _p7))
   )
   (:action a7_place
          :parameters ('left' o8 #p11 #g3 #q17 #t18)
          :precondition (and (kin 'left' o8 #p11 #g3 #q17 #t18) (atgrasp 'left' o8 #g3) (atbconf #q17) (_applicable _p7))
          :effect (and (atpose o8 #p11) (handempty 'left') (canmove) (not (atgrasp 'left' o8 #g3)) (increase (total-cost) 100) (canoperate) (not (_applicable _p7)) (_applicable _p8))
   )
   (:action a8_cook
          :parameters (o8 o4)
          :precondition (and (stackable o8 o4) (stove o4) (on o8 o4) (cleaned o8) (canoperate) (_applicable _p8))
          :effect (and (cooked o8) (not (cleaned o8)) (increase (total-cost) 50) (not (canoperate)) (not (_applicable _p8)) (_applicable _p9))
   )
   (:action a9_move_base
          :parameters (#q17 #q0 #t475)
          :precondition (and (basemotion #q17 #t475 #q0) (atbconf #q17) (canmove) (_applicable _p9))
          :effect (and (atbconf #q0) (not (atbconf #q17)) (not (canmove)) (increase (total-cost) 200) (not (canoperate)) (not (_applicable _p9)) (_applicable _p10))
   )
   (:action a10_pick
          :parameters ('left' o5 p800 #g0 #q0 #t1)
          :precondition (and (kin 'left' o5 p800 #g0 #q0 #t1) (atpose o5 p800) (handempty 'left') (atbconf #q0) (_applicable _p10))
          :effect (and (atgrasp 'left' o5 #g0) (canmove) (not (atpose o5 p800)) (not (handempty 'left')) (increase (total-cost) 100) (not (canoperate)) (not (_applicable _p10)) (_applicable _p11))
   )
   (:action a11_move_base
          :parameters (#q0 #q7 #t57)
          :precondition (and (basemotion #q0 #t57 #q7) (atbconf #q0) (canmove) (_applicable _p11))
          :effect (and (atbconf #q7) (not (atbconf #q0)) (not (canmove)) (increase (total-cost) 200) (not (canoperate)) (not (_applicable _p11)) (_applicable _p12))
   )
   (:action a12_place
          :parameters ('left' o5 #p1 #g0 #q7 #t8)
          :precondition (and (kin 'left' o5 #p1 #g0 #q7 #t8) (atgrasp 'left' o5 #g0) (atbconf #q7) (_applicable _p12))
          :effect (and (atpose o5 #p1) (handempty 'left') (canmove) (not (atgrasp 'left' o5 #g0)) (increase (total-cost) 100) (canoperate) (not (_applicable _p12)) (_applicable _p13))
   )
   (:action a13_clean
          :parameters (o5 o3)
          :precondition (and (stackable o5 o3) (sink o3) (on o5 o3) (canoperate) (_applicable _p13))
          :effect (and (cleaned o5) (increase (total-cost) 50) (not (canoperate)) (not (_applicable _p13)) (_applicable _p14))
   )
   (:action a14_pick
          :parameters ('left' o5 #p1 #g0 #q7 #t8)
          :precondition (and (kin 'left' o5 #p1 #g0 #q7 #t8) (atpose o5 #p1) (handempty 'left') (atbconf #q7) (_applicable _p14))
          :effect (and (atgrasp 'left' o5 #g0) (canmove) (not (atpose o5 #p1)) (not (handempty 'left')) (increase (total-cost) 100) (not (canoperate)) (not (_applicable _p14)) (_applicable _p15))
   )
   (:action a15_move_base
          :parameters (#q7 #q8 #t233)
          :precondition (and (basemotion #q7 #t233 #q8) (atbconf #q7) (canmove) (_applicable _p15))
          :effect (and (atbconf #q8) (not (atbconf #q7)) (not (canmove)) (increase (total-cost) 200) (not (canoperate)) (not (_applicable _p15)) (_applicable _p16))
   )
   (:action a16_place
          :parameters ('left' o5 #p2 #g0 #q8 #t9)
          :precondition (and (kin 'left' o5 #p2 #g0 #q8 #t9) (atgrasp 'left' o5 #g0) (atbconf #q8) (_applicable _p16))
          :effect (and (atpose o5 #p2) (handempty 'left') (canmove) (not (atgrasp 'left' o5 #g0)) (increase (total-cost) 100) (canoperate) (not (_applicable _p16)) (_applicable _p17))
   )
   (:action a17_cook
          :parameters (o5 o4)
          :precondition (and (stackable o5 o4) (stove o4) (on o5 o4) (cleaned o5) (canoperate) (_applicable _p17))
          :effect (and (cooked o5) (not (cleaned o5)) (increase (total-cost) 50) (not (canoperate)) (not (_applicable _p17)) (_applicable _p18))
   )
   (:action a18_move_base
          :parameters (#q8 #q2 #t252)
          :precondition (and (basemotion #q8 #t252 #q2) (atbconf #q8) (canmove) (_applicable _p18))
          :effect (and (atbconf #q2) (not (atbconf #q8)) (not (canmove)) (increase (total-cost) 200) (not (canoperate)) (not (_applicable _p18)) (_applicable _p19))
   )
   (:action a19_pick
          :parameters ('left' o7 p624 #g2 #q2 #t3)
          :precondition (and (kin 'left' o7 p624 #g2 #q2 #t3) (atpose o7 p624) (handempty 'left') (atbconf #q2) (_applicable _p19))
          :effect (and (atgrasp 'left' o7 #g2) (canmove) (not (atpose o7 p624)) (not (handempty 'left')) (increase (total-cost) 100) (not (canoperate)) (not (_applicable _p19)) (_applicable _p20))
   )
   (:action a20_move_base
          :parameters (#q2 #q13 #t113)
          :precondition (and (basemotion #q2 #t113 #q13) (atbconf #q2) (canmove) (_applicable _p20))
          :effect (and (atbconf #q13) (not (atbconf #q2)) (not (canmove)) (increase (total-cost) 200) (not (canoperate)) (not (_applicable _p20)) (_applicable _p21))
   )
   (:action a21_place
          :parameters ('left' o7 #p7 #g2 #q13 #t14)
          :precondition (and (kin 'left' o7 #p7 #g2 #q13 #t14) (atgrasp 'left' o7 #g2) (atbconf #q13) (_applicable _p21))
          :effect (and (atpose o7 #p7) (handempty 'left') (canmove) (not (atgrasp 'left' o7 #g2)) (increase (total-cost) 100) (canoperate) (not (_applicable _p21)) (_applicable _p22))
   )
   (:action a22_clean
          :parameters (o7 o3)
          :precondition (and (stackable o7 o3) (sink o3) (on o7 o3) (canoperate) (_applicable _p22))
          :effect (and (cleaned o7) (increase (total-cost) 50) (not (canoperate)) (not (_applicable _p22)) (_applicable _p23))
   )
   (:action a23_pick
          :parameters ('left' o7 #p7 #g2 #q13 #t14)
          :precondition (and (kin 'left' o7 #p7 #g2 #q13 #t14) (atpose o7 #p7) (handempty 'left') (atbconf #q13) (_applicable _p23))
          :effect (and (atgrasp 'left' o7 #g2) (canmove) (not (atpose o7 #p7)) (not (handempty 'left')) (increase (total-cost) 100) (not (canoperate)) (not (_applicable _p23)) (_applicable _p24))
   )
   (:action a24_move_base
          :parameters (#q13 #q14 #t389)
          :precondition (and (basemotion #q13 #t389 #q14) (atbconf #q13) (canmove) (_applicable _p24))
          :effect (and (atbconf #q14) (not (atbconf #q13)) (not (canmove)) (increase (total-cost) 200) (not (canoperate)) (not (_applicable _p24)) (_applicable _p25))
   )
   (:action a25_place
          :parameters ('left' o7 #p8 #g2 #q14 #t15)
          :precondition (and (kin 'left' o7 #p8 #g2 #q14 #t15) (atgrasp 'left' o7 #g2) (atbconf #q14) (_applicable _p25))
          :effect (and (atpose o7 #p8) (handempty 'left') (canmove) (not (atgrasp 'left' o7 #g2)) (increase (total-cost) 100) (canoperate) (not (_applicable _p25)) (_applicable _p26))
   )
   (:action a26_cook
          :parameters (o7 o4)
          :precondition (and (stackable o7 o4) (stove o4) (on o7 o4) (cleaned o7) (canoperate) (_applicable _p26))
          :effect (and (cooked o7) (not (cleaned o7)) (increase (total-cost) 50) (not (canoperate)) (not (_applicable _p26)) (_applicable _p27))
   )
   (:action a27_move_base
          :parameters (#q14 #q1 #t401)
          :precondition (and (basemotion #q14 #t401 #q1) (atbconf #q14) (canmove) (_applicable _p27))
          :effect (and (atbconf #q1) (not (atbconf #q14)) (not (canmove)) (increase (total-cost) 200) (not (canoperate)) (not (_applicable _p27)) (_applicable _p28))
   )
   (:action a28_pick
          :parameters ('left' o6 p224 #g1 #q1 #t2)
          :precondition (and (kin 'left' o6 p224 #g1 #q1 #t2) (atpose o6 p224) (handempty 'left') (atbconf #q1) (_applicable _p28))
          :effect (and (atgrasp 'left' o6 #g1) (canmove) (not (atpose o6 p224)) (not (handempty 'left')) (increase (total-cost) 100) (not (canoperate)) (not (_applicable _p28)) (_applicable _p29))
   )
   (:action a29_move_base
          :parameters (#q1 #q10 #t85)
          :precondition (and (basemotion #q1 #t85 #q10) (atbconf #q1) (canmove) (_applicable _p29))
          :effect (and (atbconf #q10) (not (atbconf #q1)) (not (canmove)) (increase (total-cost) 200) (not (canoperate)) (not (_applicable _p29)) (_applicable _p30))
   )
   (:action a30_place
          :parameters ('left' o6 #p4 #g1 #q10 #t11)
          :precondition (and (kin 'left' o6 #p4 #g1 #q10 #t11) (atgrasp 'left' o6 #g1) (atbconf #q10) (_applicable _p30))
          :effect (and (atpose o6 #p4) (handempty 'left') (canmove) (not (atgrasp 'left' o6 #g1)) (increase (total-cost) 100) (canoperate) (not (_applicable _p30)) (_applicable _p31))
   )
   (:action a31_clean
          :parameters (o6 o3)
          :precondition (and (stackable o6 o3) (sink o3) (on o6 o3) (canoperate) (_applicable _p31))
          :effect (and (cleaned o6) (increase (total-cost) 50) (not (canoperate)) (not (_applicable _p31)) (_applicable _p32))
   )
   (:action a32_pick
          :parameters ('left' o6 #p4 #g1 #q10 #t11)
          :precondition (and (kin 'left' o6 #p4 #g1 #q10 #t11) (atpose o6 #p4) (handempty 'left') (atbconf #q10) (_applicable _p32))
          :effect (and (atgrasp 'left' o6 #g1) (canmove) (not (atpose o6 #p4)) (not (handempty 'left')) (increase (total-cost) 100) (not (canoperate)) (not (_applicable _p32)) (_applicable _p33))
   )
   (:action a33_move_base
          :parameters (#q10 #q11 #t311)
          :precondition (and (basemotion #q10 #t311 #q11) (atbconf #q10) (canmove) (_applicable _p33))
          :effect (and (atbconf #q11) (not (atbconf #q10)) (not (canmove)) (increase (total-cost) 200) (not (canoperate)) (not (_applicable _p33)) (_applicable _p34))
   )
   (:action a34_place
          :parameters ('left' o6 #p5 #g1 #q11 #t12)
          :precondition (and (kin 'left' o6 #p5 #g1 #q11 #t12) (atgrasp 'left' o6 #g1) (atbconf #q11) (_applicable _p34))
          :effect (and (atpose o6 #p5) (handempty 'left') (canmove) (not (atgrasp 'left' o6 #g1)) (increase (total-cost) 100) (canoperate) (not (_applicable _p34)) (_applicable _p35))
   )
   (:action a35_cook
          :parameters (o6 o4)
          :precondition (and (stackable o6 o4) (stove o4) (on o6 o4) (cleaned o6) (canoperate) (_applicable _p35))
          :effect (and (cooked o6) (not (cleaned o6)) (increase (total-cost) 50) (not (canoperate)) (not (_applicable _p35)) (_applicable _p36))
   )
   (:action a36_move_base
          :parameters (#q11 q8 #t324)
          :precondition (and (basemotion #q11 #t324 q8) (atbconf #q11) (canmove) (_applicable _p36))
          :effect (and (atbconf q8) (not (atbconf #q11)) (not (canmove)) (increase (total-cost) 200) (not (canoperate)) (not (_applicable _p36)) (_applicable _p37))
   )
   (:action s0_sample-place
          :parameters (o5 o2)
          :precondition (stackable o5 o2)
          :effect (and (ispose o5 #p0) (supported o5 #p0 o2))
   )
   (:action s1_sample-place
          :parameters (o5 o3)
          :precondition (stackable o5 o3)
          :effect (and (ispose o5 #p1) (supported o5 #p1 o3))
   )
   (:action s2_sample-place
          :parameters (o5 o4)
          :precondition (stackable o5 o4)
          :effect (and (ispose o5 #p2) (supported o5 #p2 o4))
   )
   (:action s3_sample-place
          :parameters (o6 o2)
          :precondition (stackable o6 o2)
          :effect (and (ispose o6 #p3) (supported o6 #p3 o2))
   )
   (:action s4_sample-place
          :parameters (o6 o3)
          :precondition (stackable o6 o3)
          :effect (and (ispose o6 #p4) (supported o6 #p4 o3))
   )
   (:action s5_sample-place
          :parameters (o6 o4)
          :precondition (stackable o6 o4)
          :effect (and (ispose o6 #p5) (supported o6 #p5 o4))
   )
   (:action s6_sample-place
          :parameters (o7 o2)
          :precondition (stackable o7 o2)
          :effect (and (ispose o7 #p6) (supported o7 #p6 o2))
   )
   (:action s7_sample-place
          :parameters (o7 o3)
          :precondition (stackable o7 o3)
          :effect (and (ispose o7 #p7) (supported o7 #p7 o3))
   )
   (:action s8_sample-place
          :parameters (o7 o4)
          :precondition (stackable o7 o4)
          :effect (and (ispose o7 #p8) (supported o7 #p8 o4))
   )
   (:action s9_sample-place
          :parameters (o8 o2)
          :precondition (stackable o8 o2)
          :effect (and (ispose o8 #p9) (supported o8 #p9 o2))
   )
   (:action s10_sample-place
          :parameters (o8 o3)
          :precondition (stackable o8 o3)
          :effect (and (ispose o8 #p10) (supported o8 #p10 o3))
   )
   (:action s11_sample-place
          :parameters (o8 o4)
          :precondition (stackable o8 o4)
          :effect (and (ispose o8 #p11) (supported o8 #p11 o4))
   )
   (:action s12_sample-place
          :parameters (o9 o2)
          :precondition (stackable o9 o2)
          :effect (and (ispose o9 #p12) (supported o9 #p12 o2))
   )
   (:action s13_sample-place
          :parameters (o9 o3)
          :precondition (stackable o9 o3)
          :effect (and (ispose o9 #p13) (supported o9 #p13 o3))
   )
   (:action s14_sample-place
          :parameters (o9 o4)
          :precondition (stackable o9 o4)
          :effect (and (ispose o9 #p14) (supported o9 #p14 o4))
   )
   (:action s15_sample-place
          :parameters (o10 o2)
          :precondition (stackable o10 o2)
          :effect (and (ispose o10 #p15) (supported o10 #p15 o2))
   )
   (:action s16_sample-place
          :parameters (o10 o3)
          :precondition (stackable o10 o3)
          :effect (and (ispose o10 #p16) (supported o10 #p16 o3))
   )
   (:action s17_sample-place
          :parameters (o10 o4)
          :precondition (stackable o10 o4)
          :effect (and (ispose o10 #p17) (supported o10 #p17 o4))
   )
   (:action s18_sample-grasp
          :parameters (o5)
          :precondition (graspable o5)
          :effect (isgrasp o5 #g0)
   )
   (:action s19_sample-grasp
          :parameters (o6)
          :precondition (graspable o6)
          :effect (isgrasp o6 #g1)
   )
   (:action s20_sample-grasp
          :parameters (o7)
          :precondition (graspable o7)
          :effect (isgrasp o7 #g2)
   )
   (:action s21_sample-grasp
          :parameters (o8)
          :precondition (graspable o8)
          :effect (isgrasp o8 #g3)
   )
   (:action s22_sample-grasp
          :parameters (o9)
          :precondition (graspable o9)
          :effect (isgrasp o9 #g4)
   )
   (:action s23_sample-grasp
          :parameters (o10)
          :precondition (graspable o10)
          :effect (isgrasp o10 #g5)
   )
   (:action s24_plan-base-motion
          :parameters (q8 q8)
          :precondition (and (isbconf q8) (isbconf q8))
          :effect (basemotion q8 #t0 q8)
   )
   (:action s25_inverse-kinematics
          :parameters ('left' o5 p800 #g0)
          :precondition (and (controllable 'left') (ispose o5 p800) (isgrasp o5 #g0))
          :effect (and (isbconf #q0) (kin 'left' o5 p800 #g0 #q0 #t1))
   )
   (:action s26_inverse-kinematics
          :parameters ('left' o6 p224 #g1)
          :precondition (and (controllable 'left') (ispose o6 p224) (isgrasp o6 #g1))
          :effect (and (isbconf #q1) (kin 'left' o6 p224 #g1 #q1 #t2))
   )
   (:action s27_inverse-kinematics
          :parameters ('left' o7 p624 #g2)
          :precondition (and (controllable 'left') (ispose o7 p624) (isgrasp o7 #g2))
          :effect (and (isbconf #q2) (kin 'left' o7 p624 #g2 #q2 #t3))
   )
   (:action s28_inverse-kinematics
          :parameters ('left' o8 p480 #g3)
          :precondition (and (controllable 'left') (ispose o8 p480) (isgrasp o8 #g3))
          :effect (and (isbconf #q3) (kin 'left' o8 p480 #g3 #q3 #t4))
   )
   (:action s29_inverse-kinematics
          :parameters ('left' o9 p536 #g4)
          :precondition (and (controllable 'left') (ispose o9 p536) (isgrasp o9 #g4))
          :effect (and (isbconf #q4) (kin 'left' o9 p536 #g4 #q4 #t5))
   )
   (:action s30_inverse-kinematics
          :parameters ('left' o10 p592 #g5)
          :precondition (and (controllable 'left') (ispose o10 p592) (isgrasp o10 #g5))
          :effect (and (isbconf #q5) (kin 'left' o10 p592 #g5 #q5 #t6))
   )
   (:action s31_inverse-kinematics
          :parameters ('left' o5 #p0 #g0)
          :precondition (and (controllable 'left') (ispose o5 #p0) (isgrasp o5 #g0))
          :effect (and (isbconf #q6) (kin 'left' o5 #p0 #g0 #q6 #t7))
   )
   (:action s32_inverse-kinematics
          :parameters ('left' o5 #p1 #g0)
          :precondition (and (controllable 'left') (ispose o5 #p1) (isgrasp o5 #g0))
          :effect (and (isbconf #q7) (kin 'left' o5 #p1 #g0 #q7 #t8))
   )
   (:action s33_inverse-kinematics
          :parameters ('left' o5 #p2 #g0)
          :precondition (and (controllable 'left') (ispose o5 #p2) (isgrasp o5 #g0))
          :effect (and (isbconf #q8) (kin 'left' o5 #p2 #g0 #q8 #t9))
   )
   (:action s34_inverse-kinematics
          :parameters ('left' o6 #p3 #g1)
          :precondition (and (controllable 'left') (ispose o6 #p3) (isgrasp o6 #g1))
          :effect (and (isbconf #q9) (kin 'left' o6 #p3 #g1 #q9 #t10))
   )
   (:action s35_inverse-kinematics
          :parameters ('left' o6 #p4 #g1)
          :precondition (and (controllable 'left') (ispose o6 #p4) (isgrasp o6 #g1))
          :effect (and (isbconf #q10) (kin 'left' o6 #p4 #g1 #q10 #t11))
   )
   (:action s36_inverse-kinematics
          :parameters ('left' o6 #p5 #g1)
          :precondition (and (controllable 'left') (ispose o6 #p5) (isgrasp o6 #g1))
          :effect (and (isbconf #q11) (kin 'left' o6 #p5 #g1 #q11 #t12))
   )
   (:action s37_inverse-kinematics
          :parameters ('left' o7 #p6 #g2)
          :precondition (and (controllable 'left') (ispose o7 #p6) (isgrasp o7 #g2))
          :effect (and (isbconf #q12) (kin 'left' o7 #p6 #g2 #q12 #t13))
   )
   (:action s38_inverse-kinematics
          :parameters ('left' o7 #p7 #g2)
          :precondition (and (controllable 'left') (ispose o7 #p7) (isgrasp o7 #g2))
          :effect (and (isbconf #q13) (kin 'left' o7 #p7 #g2 #q13 #t14))
   )
   (:action s39_inverse-kinematics
          :parameters ('left' o7 #p8 #g2)
          :precondition (and (controllable 'left') (ispose o7 #p8) (isgrasp o7 #g2))
          :effect (and (isbconf #q14) (kin 'left' o7 #p8 #g2 #q14 #t15))
   )
   (:action s40_inverse-kinematics
          :parameters ('left' o8 #p9 #g3)
          :precondition (and (controllable 'left') (ispose o8 #p9) (isgrasp o8 #g3))
          :effect (and (isbconf #q15) (kin 'left' o8 #p9 #g3 #q15 #t16))
   )
   (:action s41_inverse-kinematics
          :parameters ('left' o8 #p10 #g3)
          :precondition (and (controllable 'left') (ispose o8 #p10) (isgrasp o8 #g3))
          :effect (and (isbconf #q16) (kin 'left' o8 #p10 #g3 #q16 #t17))
   )
   (:action s42_inverse-kinematics
          :parameters ('left' o8 #p11 #g3)
          :precondition (and (controllable 'left') (ispose o8 #p11) (isgrasp o8 #g3))
          :effect (and (isbconf #q17) (kin 'left' o8 #p11 #g3 #q17 #t18))
   )
   (:action s43_inverse-kinematics
          :parameters ('left' o9 #p12 #g4)
          :precondition (and (controllable 'left') (ispose o9 #p12) (isgrasp o9 #g4))
          :effect (and (isbconf #q18) (kin 'left' o9 #p12 #g4 #q18 #t19))
   )
   (:action s44_inverse-kinematics
          :parameters ('left' o9 #p13 #g4)
          :precondition (and (controllable 'left') (ispose o9 #p13) (isgrasp o9 #g4))
          :effect (and (isbconf #q19) (kin 'left' o9 #p13 #g4 #q19 #t20))
   )
   (:action s45_inverse-kinematics
          :parameters ('left' o9 #p14 #g4)
          :precondition (and (controllable 'left') (ispose o9 #p14) (isgrasp o9 #g4))
          :effect (and (isbconf #q20) (kin 'left' o9 #p14 #g4 #q20 #t21))
   )
   (:action s46_inverse-kinematics
          :parameters ('left' o10 #p15 #g5)
          :precondition (and (controllable 'left') (ispose o10 #p15) (isgrasp o10 #g5))
          :effect (and (isbconf #q21) (kin 'left' o10 #p15 #g5 #q21 #t22))
   )
   (:action s47_inverse-kinematics
          :parameters ('left' o10 #p16 #g5)
          :precondition (and (controllable 'left') (ispose o10 #p16) (isgrasp o10 #g5))
          :effect (and (isbconf #q22) (kin 'left' o10 #p16 #g5 #q22 #t23))
   )
   (:action s48_inverse-kinematics
          :parameters ('left' o10 #p17 #g5)
          :precondition (and (controllable 'left') (ispose o10 #p17) (isgrasp o10 #g5))
          :effect (and (isbconf #q23) (kin 'left' o10 #p17 #g5 #q23 #t24))
   )
   (:action s49_plan-base-motion
          :parameters (q8 #q0)
          :precondition (and (isbconf q8) (isbconf #q0))
          :effect (basemotion q8 #t25 #q0)
   )
   (:action s50_plan-base-motion
          :parameters (q8 #q1)
          :precondition (and (isbconf q8) (isbconf #q1))
          :effect (basemotion q8 #t26 #q1)
   )
   (:action s51_plan-base-motion
          :parameters (q8 #q2)
          :precondition (and (isbconf q8) (isbconf #q2))
          :effect (basemotion q8 #t27 #q2)
   )
   (:action s52_plan-base-motion
          :parameters (q8 #q3)
          :precondition (and (isbconf q8) (isbconf #q3))
          :effect (basemotion q8 #t28 #q3)
   )
   (:action s53_plan-base-motion
          :parameters (q8 #q4)
          :precondition (and (isbconf q8) (isbconf #q4))
          :effect (basemotion q8 #t29 #q4)
   )
   (:action s54_plan-base-motion
          :parameters (q8 #q5)
          :precondition (and (isbconf q8) (isbconf #q5))
          :effect (basemotion q8 #t30 #q5)
   )
   (:action s55_plan-base-motion
          :parameters (q8 #q6)
          :precondition (and (isbconf q8) (isbconf #q6))
          :effect (basemotion q8 #t31 #q6)
   )
   (:action s56_plan-base-motion
          :parameters (q8 #q7)
          :precondition (and (isbconf q8) (isbconf #q7))
          :effect (basemotion q8 #t32 #q7)
   )
   (:action s57_plan-base-motion
          :parameters (q8 #q8)
          :precondition (and (isbconf q8) (isbconf #q8))
          :effect (basemotion q8 #t33 #q8)
   )
   (:action s58_plan-base-motion
          :parameters (q8 #q9)
          :precondition (and (isbconf q8) (isbconf #q9))
          :effect (basemotion q8 #t34 #q9)
   )
   (:action s59_plan-base-motion
          :parameters (q8 #q10)
          :precondition (and (isbconf q8) (isbconf #q10))
          :effect (basemotion q8 #t35 #q10)
   )
   (:action s60_plan-base-motion
          :parameters (q8 #q11)
          :precondition (and (isbconf q8) (isbconf #q11))
          :effect (basemotion q8 #t36 #q11)
   )
   (:action s61_plan-base-motion
          :parameters (q8 #q12)
          :precondition (and (isbconf q8) (isbconf #q12))
          :effect (basemotion q8 #t37 #q12)
   )
   (:action s62_plan-base-motion
          :parameters (q8 #q13)
          :precondition (and (isbconf q8) (isbconf #q13))
          :effect (basemotion q8 #t38 #q13)
   )
   (:action s63_plan-base-motion
          :parameters (q8 #q14)
          :precondition (and (isbconf q8) (isbconf #q14))
          :effect (basemotion q8 #t39 #q14)
   )
   (:action s64_plan-base-motion
          :parameters (q8 #q15)
          :precondition (and (isbconf q8) (isbconf #q15))
          :effect (basemotion q8 #t40 #q15)
   )
   (:action s65_plan-base-motion
          :parameters (q8 #q16)
          :precondition (and (isbconf q8) (isbconf #q16))
          :effect (basemotion q8 #t41 #q16)
   )
   (:action s66_plan-base-motion
          :parameters (q8 #q17)
          :precondition (and (isbconf q8) (isbconf #q17))
          :effect (basemotion q8 #t42 #q17)
   )
   (:action s67_plan-base-motion
          :parameters (q8 #q18)
          :precondition (and (isbconf q8) (isbconf #q18))
          :effect (basemotion q8 #t43 #q18)
   )
   (:action s68_plan-base-motion
          :parameters (q8 #q19)
          :precondition (and (isbconf q8) (isbconf #q19))
          :effect (basemotion q8 #t44 #q19)
   )
   (:action s69_plan-base-motion
          :parameters (q8 #q20)
          :precondition (and (isbconf q8) (isbconf #q20))
          :effect (basemotion q8 #t45 #q20)
   )
   (:action s70_plan-base-motion
          :parameters (q8 #q21)
          :precondition (and (isbconf q8) (isbconf #q21))
          :effect (basemotion q8 #t46 #q21)
   )
   (:action s71_plan-base-motion
          :parameters (q8 #q22)
          :precondition (and (isbconf q8) (isbconf #q22))
          :effect (basemotion q8 #t47 #q22)
   )
   (:action s72_plan-base-motion
          :parameters (q8 #q23)
          :precondition (and (isbconf q8) (isbconf #q23))
          :effect (basemotion q8 #t48 #q23)
   )
   (:action s73_plan-base-motion
          :parameters (#q0 q8)
          :precondition (and (isbconf #q0) (isbconf q8))
          :effect (basemotion #q0 #t49 q8)
   )
   (:action s74_plan-base-motion
          :parameters (#q0 #q0)
          :precondition (and (isbconf #q0) (isbconf #q0))
          :effect (basemotion #q0 #t50 #q0)
   )
   (:action s75_plan-base-motion
          :parameters (#q0 #q1)
          :precondition (and (isbconf #q0) (isbconf #q1))
          :effect (basemotion #q0 #t51 #q1)
   )
   (:action s76_plan-base-motion
          :parameters (#q0 #q2)
          :precondition (and (isbconf #q0) (isbconf #q2))
          :effect (basemotion #q0 #t52 #q2)
   )
   (:action s77_plan-base-motion
          :parameters (#q0 #q3)
          :precondition (and (isbconf #q0) (isbconf #q3))
          :effect (basemotion #q0 #t53 #q3)
   )
   (:action s78_plan-base-motion
          :parameters (#q0 #q4)
          :precondition (and (isbconf #q0) (isbconf #q4))
          :effect (basemotion #q0 #t54 #q4)
   )
   (:action s79_plan-base-motion
          :parameters (#q0 #q5)
          :precondition (and (isbconf #q0) (isbconf #q5))
          :effect (basemotion #q0 #t55 #q5)
   )
   (:action s80_plan-base-motion
          :parameters (#q0 #q6)
          :precondition (and (isbconf #q0) (isbconf #q6))
          :effect (basemotion #q0 #t56 #q6)
   )
   (:action s81_plan-base-motion
          :parameters (#q0 #q7)
          :precondition (and (isbconf #q0) (isbconf #q7))
          :effect (basemotion #q0 #t57 #q7)
   )
   (:action s82_plan-base-motion
          :parameters (#q0 #q8)
          :precondition (and (isbconf #q0) (isbconf #q8))
          :effect (basemotion #q0 #t58 #q8)
   )
   (:action s83_plan-base-motion
          :parameters (#q0 #q9)
          :precondition (and (isbconf #q0) (isbconf #q9))
          :effect (basemotion #q0 #t59 #q9)
   )
   (:action s84_plan-base-motion
          :parameters (#q0 #q10)
          :precondition (and (isbconf #q0) (isbconf #q10))
          :effect (basemotion #q0 #t60 #q10)
   )
   (:action s85_plan-base-motion
          :parameters (#q0 #q11)
          :precondition (and (isbconf #q0) (isbconf #q11))
          :effect (basemotion #q0 #t61 #q11)
   )
   (:action s86_plan-base-motion
          :parameters (#q0 #q12)
          :precondition (and (isbconf #q0) (isbconf #q12))
          :effect (basemotion #q0 #t62 #q12)
   )
   (:action s87_plan-base-motion
          :parameters (#q0 #q13)
          :precondition (and (isbconf #q0) (isbconf #q13))
          :effect (basemotion #q0 #t63 #q13)
   )
   (:action s88_plan-base-motion
          :parameters (#q0 #q14)
          :precondition (and (isbconf #q0) (isbconf #q14))
          :effect (basemotion #q0 #t64 #q14)
   )
   (:action s89_plan-base-motion
          :parameters (#q0 #q15)
          :precondition (and (isbconf #q0) (isbconf #q15))
          :effect (basemotion #q0 #t65 #q15)
   )
   (:action s90_plan-base-motion
          :parameters (#q0 #q16)
          :precondition (and (isbconf #q0) (isbconf #q16))
          :effect (basemotion #q0 #t66 #q16)
   )
   (:action s91_plan-base-motion
          :parameters (#q0 #q17)
          :precondition (and (isbconf #q0) (isbconf #q17))
          :effect (basemotion #q0 #t67 #q17)
   )
   (:action s92_plan-base-motion
          :parameters (#q0 #q18)
          :precondition (and (isbconf #q0) (isbconf #q18))
          :effect (basemotion #q0 #t68 #q18)
   )
   (:action s93_plan-base-motion
          :parameters (#q0 #q19)
          :precondition (and (isbconf #q0) (isbconf #q19))
          :effect (basemotion #q0 #t69 #q19)
   )
   (:action s94_plan-base-motion
          :parameters (#q0 #q20)
          :precondition (and (isbconf #q0) (isbconf #q20))
          :effect (basemotion #q0 #t70 #q20)
   )
   (:action s95_plan-base-motion
          :parameters (#q0 #q21)
          :precondition (and (isbconf #q0) (isbconf #q21))
          :effect (basemotion #q0 #t71 #q21)
   )
   (:action s96_plan-base-motion
          :parameters (#q0 #q22)
          :precondition (and (isbconf #q0) (isbconf #q22))
          :effect (basemotion #q0 #t72 #q22)
   )
   (:action s97_plan-base-motion
          :parameters (#q0 #q23)
          :precondition (and (isbconf #q0) (isbconf #q23))
          :effect (basemotion #q0 #t73 #q23)
   )
   (:action s98_plan-base-motion
          :parameters (#q1 q8)
          :precondition (and (isbconf #q1) (isbconf q8))
          :effect (basemotion #q1 #t74 q8)
   )
   (:action s99_plan-base-motion
          :parameters (#q1 #q0)
          :precondition (and (isbconf #q1) (isbconf #q0))
          :effect (basemotion #q1 #t75 #q0)
   )
   (:action s100_plan-base-motion
          :parameters (#q1 #q1)
          :precondition (and (isbconf #q1) (isbconf #q1))
          :effect (basemotion #q1 #t76 #q1)
   )
   (:action s101_plan-base-motion
          :parameters (#q1 #q2)
          :precondition (and (isbconf #q1) (isbconf #q2))
          :effect (basemotion #q1 #t77 #q2)
   )
   (:action s102_plan-base-motion
          :parameters (#q1 #q3)
          :precondition (and (isbconf #q1) (isbconf #q3))
          :effect (basemotion #q1 #t78 #q3)
   )
   (:action s103_plan-base-motion
          :parameters (#q1 #q4)
          :precondition (and (isbconf #q1) (isbconf #q4))
          :effect (basemotion #q1 #t79 #q4)
   )
   (:action s104_plan-base-motion
          :parameters (#q1 #q5)
          :precondition (and (isbconf #q1) (isbconf #q5))
          :effect (basemotion #q1 #t80 #q5)
   )
   (:action s105_plan-base-motion
          :parameters (#q1 #q6)
          :precondition (and (isbconf #q1) (isbconf #q6))
          :effect (basemotion #q1 #t81 #q6)
   )
   (:action s106_plan-base-motion
          :parameters (#q1 #q7)
          :precondition (and (isbconf #q1) (isbconf #q7))
          :effect (basemotion #q1 #t82 #q7)
   )
   (:action s107_plan-base-motion
          :parameters (#q1 #q8)
          :precondition (and (isbconf #q1) (isbconf #q8))
          :effect (basemotion #q1 #t83 #q8)
   )
   (:action s108_plan-base-motion
          :parameters (#q1 #q9)
          :precondition (and (isbconf #q1) (isbconf #q9))
          :effect (basemotion #q1 #t84 #q9)
   )
   (:action s109_plan-base-motion
          :parameters (#q1 #q10)
          :precondition (and (isbconf #q1) (isbconf #q10))
          :effect (basemotion #q1 #t85 #q10)
   )
   (:action s110_plan-base-motion
          :parameters (#q1 #q11)
          :precondition (and (isbconf #q1) (isbconf #q11))
          :effect (basemotion #q1 #t86 #q11)
   )
   (:action s111_plan-base-motion
          :parameters (#q1 #q12)
          :precondition (and (isbconf #q1) (isbconf #q12))
          :effect (basemotion #q1 #t87 #q12)
   )
   (:action s112_plan-base-motion
          :parameters (#q1 #q13)
          :precondition (and (isbconf #q1) (isbconf #q13))
          :effect (basemotion #q1 #t88 #q13)
   )
   (:action s113_plan-base-motion
          :parameters (#q1 #q14)
          :precondition (and (isbconf #q1) (isbconf #q14))
          :effect (basemotion #q1 #t89 #q14)
   )
   (:action s114_plan-base-motion
          :parameters (#q1 #q15)
          :precondition (and (isbconf #q1) (isbconf #q15))
          :effect (basemotion #q1 #t90 #q15)
   )
   (:action s115_plan-base-motion
          :parameters (#q1 #q16)
          :precondition (and (isbconf #q1) (isbconf #q16))
          :effect (basemotion #q1 #t91 #q16)
   )
   (:action s116_plan-base-motion
          :parameters (#q1 #q17)
          :precondition (and (isbconf #q1) (isbconf #q17))
          :effect (basemotion #q1 #t92 #q17)
   )
   (:action s117_plan-base-motion
          :parameters (#q1 #q18)
          :precondition (and (isbconf #q1) (isbconf #q18))
          :effect (basemotion #q1 #t93 #q18)
   )
   (:action s118_plan-base-motion
          :parameters (#q1 #q19)
          :precondition (and (isbconf #q1) (isbconf #q19))
          :effect (basemotion #q1 #t94 #q19)
   )
   (:action s119_plan-base-motion
          :parameters (#q1 #q20)
          :precondition (and (isbconf #q1) (isbconf #q20))
          :effect (basemotion #q1 #t95 #q20)
   )
   (:action s120_plan-base-motion
          :parameters (#q1 #q21)
          :precondition (and (isbconf #q1) (isbconf #q21))
          :effect (basemotion #q1 #t96 #q21)
   )
   (:action s121_plan-base-motion
          :parameters (#q1 #q22)
          :precondition (and (isbconf #q1) (isbconf #q22))
          :effect (basemotion #q1 #t97 #q22)
   )
   (:action s122_plan-base-motion
          :parameters (#q1 #q23)
          :precondition (and (isbconf #q1) (isbconf #q23))
          :effect (basemotion #q1 #t98 #q23)
   )
   (:action s123_plan-base-motion
          :parameters (#q2 q8)
          :precondition (and (isbconf #q2) (isbconf q8))
          :effect (basemotion #q2 #t99 q8)
   )
   (:action s124_plan-base-motion
          :parameters (#q2 #q0)
          :precondition (and (isbconf #q2) (isbconf #q0))
          :effect (basemotion #q2 #t100 #q0)
   )
   (:action s125_plan-base-motion
          :parameters (#q2 #q1)
          :precondition (and (isbconf #q2) (isbconf #q1))
          :effect (basemotion #q2 #t101 #q1)
   )
   (:action s126_plan-base-motion
          :parameters (#q2 #q2)
          :precondition (and (isbconf #q2) (isbconf #q2))
          :effect (basemotion #q2 #t102 #q2)
   )
   (:action s127_plan-base-motion
          :parameters (#q2 #q3)
          :precondition (and (isbconf #q2) (isbconf #q3))
          :effect (basemotion #q2 #t103 #q3)
   )
   (:action s128_plan-base-motion
          :parameters (#q2 #q4)
          :precondition (and (isbconf #q2) (isbconf #q4))
          :effect (basemotion #q2 #t104 #q4)
   )
   (:action s129_plan-base-motion
          :parameters (#q2 #q5)
          :precondition (and (isbconf #q2) (isbconf #q5))
          :effect (basemotion #q2 #t105 #q5)
   )
   (:action s130_plan-base-motion
          :parameters (#q2 #q6)
          :precondition (and (isbconf #q2) (isbconf #q6))
          :effect (basemotion #q2 #t106 #q6)
   )
   (:action s131_plan-base-motion
          :parameters (#q2 #q7)
          :precondition (and (isbconf #q2) (isbconf #q7))
          :effect (basemotion #q2 #t107 #q7)
   )
   (:action s132_plan-base-motion
          :parameters (#q2 #q8)
          :precondition (and (isbconf #q2) (isbconf #q8))
          :effect (basemotion #q2 #t108 #q8)
   )
   (:action s133_plan-base-motion
          :parameters (#q2 #q9)
          :precondition (and (isbconf #q2) (isbconf #q9))
          :effect (basemotion #q2 #t109 #q9)
   )
   (:action s134_plan-base-motion
          :parameters (#q2 #q10)
          :precondition (and (isbconf #q2) (isbconf #q10))
          :effect (basemotion #q2 #t110 #q10)
   )
   (:action s135_plan-base-motion
          :parameters (#q2 #q11)
          :precondition (and (isbconf #q2) (isbconf #q11))
          :effect (basemotion #q2 #t111 #q11)
   )
   (:action s136_plan-base-motion
          :parameters (#q2 #q12)
          :precondition (and (isbconf #q2) (isbconf #q12))
          :effect (basemotion #q2 #t112 #q12)
   )
   (:action s137_plan-base-motion
          :parameters (#q2 #q13)
          :precondition (and (isbconf #q2) (isbconf #q13))
          :effect (basemotion #q2 #t113 #q13)
   )
   (:action s138_plan-base-motion
          :parameters (#q2 #q14)
          :precondition (and (isbconf #q2) (isbconf #q14))
          :effect (basemotion #q2 #t114 #q14)
   )
   (:action s139_plan-base-motion
          :parameters (#q2 #q15)
          :precondition (and (isbconf #q2) (isbconf #q15))
          :effect (basemotion #q2 #t115 #q15)
   )
   (:action s140_plan-base-motion
          :parameters (#q2 #q16)
          :precondition (and (isbconf #q2) (isbconf #q16))
          :effect (basemotion #q2 #t116 #q16)
   )
   (:action s141_plan-base-motion
          :parameters (#q2 #q17)
          :precondition (and (isbconf #q2) (isbconf #q17))
          :effect (basemotion #q2 #t117 #q17)
   )
   (:action s142_plan-base-motion
          :parameters (#q2 #q18)
          :precondition (and (isbconf #q2) (isbconf #q18))
          :effect (basemotion #q2 #t118 #q18)
   )
   (:action s143_plan-base-motion
          :parameters (#q2 #q19)
          :precondition (and (isbconf #q2) (isbconf #q19))
          :effect (basemotion #q2 #t119 #q19)
   )
   (:action s144_plan-base-motion
          :parameters (#q2 #q20)
          :precondition (and (isbconf #q2) (isbconf #q20))
          :effect (basemotion #q2 #t120 #q20)
   )
   (:action s145_plan-base-motion
          :parameters (#q2 #q21)
          :precondition (and (isbconf #q2) (isbconf #q21))
          :effect (basemotion #q2 #t121 #q21)
   )
   (:action s146_plan-base-motion
          :parameters (#q2 #q22)
          :precondition (and (isbconf #q2) (isbconf #q22))
          :effect (basemotion #q2 #t122 #q22)
   )
   (:action s147_plan-base-motion
          :parameters (#q2 #q23)
          :precondition (and (isbconf #q2) (isbconf #q23))
          :effect (basemotion #q2 #t123 #q23)
   )
   (:action s148_plan-base-motion
          :parameters (#q3 q8)
          :precondition (and (isbconf #q3) (isbconf q8))
          :effect (basemotion #q3 #t124 q8)
   )
   (:action s149_plan-base-motion
          :parameters (#q3 #q0)
          :precondition (and (isbconf #q3) (isbconf #q0))
          :effect (basemotion #q3 #t125 #q0)
   )
   (:action s150_plan-base-motion
          :parameters (#q3 #q1)
          :precondition (and (isbconf #q3) (isbconf #q1))
          :effect (basemotion #q3 #t126 #q1)
   )
   (:action s151_plan-base-motion
          :parameters (#q3 #q2)
          :precondition (and (isbconf #q3) (isbconf #q2))
          :effect (basemotion #q3 #t127 #q2)
   )
   (:action s152_plan-base-motion
          :parameters (#q3 #q3)
          :precondition (and (isbconf #q3) (isbconf #q3))
          :effect (basemotion #q3 #t128 #q3)
   )
   (:action s153_plan-base-motion
          :parameters (#q3 #q4)
          :precondition (and (isbconf #q3) (isbconf #q4))
          :effect (basemotion #q3 #t129 #q4)
   )
   (:action s154_plan-base-motion
          :parameters (#q3 #q5)
          :precondition (and (isbconf #q3) (isbconf #q5))
          :effect (basemotion #q3 #t130 #q5)
   )
   (:action s155_plan-base-motion
          :parameters (#q3 #q6)
          :precondition (and (isbconf #q3) (isbconf #q6))
          :effect (basemotion #q3 #t131 #q6)
   )
   (:action s156_plan-base-motion
          :parameters (#q3 #q7)
          :precondition (and (isbconf #q3) (isbconf #q7))
          :effect (basemotion #q3 #t132 #q7)
   )
   (:action s157_plan-base-motion
          :parameters (#q3 #q8)
          :precondition (and (isbconf #q3) (isbconf #q8))
          :effect (basemotion #q3 #t133 #q8)
   )
   (:action s158_plan-base-motion
          :parameters (#q3 #q9)
          :precondition (and (isbconf #q3) (isbconf #q9))
          :effect (basemotion #q3 #t134 #q9)
   )
   (:action s159_plan-base-motion
          :parameters (#q3 #q10)
          :precondition (and (isbconf #q3) (isbconf #q10))
          :effect (basemotion #q3 #t135 #q10)
   )
   (:action s160_plan-base-motion
          :parameters (#q3 #q11)
          :precondition (and (isbconf #q3) (isbconf #q11))
          :effect (basemotion #q3 #t136 #q11)
   )
   (:action s161_plan-base-motion
          :parameters (#q3 #q12)
          :precondition (and (isbconf #q3) (isbconf #q12))
          :effect (basemotion #q3 #t137 #q12)
   )
   (:action s162_plan-base-motion
          :parameters (#q3 #q13)
          :precondition (and (isbconf #q3) (isbconf #q13))
          :effect (basemotion #q3 #t138 #q13)
   )
   (:action s163_plan-base-motion
          :parameters (#q3 #q14)
          :precondition (and (isbconf #q3) (isbconf #q14))
          :effect (basemotion #q3 #t139 #q14)
   )
   (:action s164_plan-base-motion
          :parameters (#q3 #q15)
          :precondition (and (isbconf #q3) (isbconf #q15))
          :effect (basemotion #q3 #t140 #q15)
   )
   (:action s165_plan-base-motion
          :parameters (#q3 #q16)
          :precondition (and (isbconf #q3) (isbconf #q16))
          :effect (basemotion #q3 #t141 #q16)
   )
   (:action s166_plan-base-motion
          :parameters (#q3 #q17)
          :precondition (and (isbconf #q3) (isbconf #q17))
          :effect (basemotion #q3 #t142 #q17)
   )
   (:action s167_plan-base-motion
          :parameters (#q3 #q18)
          :precondition (and (isbconf #q3) (isbconf #q18))
          :effect (basemotion #q3 #t143 #q18)
   )
   (:action s168_plan-base-motion
          :parameters (#q3 #q19)
          :precondition (and (isbconf #q3) (isbconf #q19))
          :effect (basemotion #q3 #t144 #q19)
   )
   (:action s169_plan-base-motion
          :parameters (#q3 #q20)
          :precondition (and (isbconf #q3) (isbconf #q20))
          :effect (basemotion #q3 #t145 #q20)
   )
   (:action s170_plan-base-motion
          :parameters (#q3 #q21)
          :precondition (and (isbconf #q3) (isbconf #q21))
          :effect (basemotion #q3 #t146 #q21)
   )
   (:action s171_plan-base-motion
          :parameters (#q3 #q22)
          :precondition (and (isbconf #q3) (isbconf #q22))
          :effect (basemotion #q3 #t147 #q22)
   )
   (:action s172_plan-base-motion
          :parameters (#q3 #q23)
          :precondition (and (isbconf #q3) (isbconf #q23))
          :effect (basemotion #q3 #t148 #q23)
   )
   (:action s173_plan-base-motion
          :parameters (#q4 q8)
          :precondition (and (isbconf #q4) (isbconf q8))
          :effect (basemotion #q4 #t149 q8)
   )
   (:action s174_plan-base-motion
          :parameters (#q4 #q0)
          :precondition (and (isbconf #q4) (isbconf #q0))
          :effect (basemotion #q4 #t150 #q0)
   )
   (:action s175_plan-base-motion
          :parameters (#q4 #q1)
          :precondition (and (isbconf #q4) (isbconf #q1))
          :effect (basemotion #q4 #t151 #q1)
   )
   (:action s176_plan-base-motion
          :parameters (#q4 #q2)
          :precondition (and (isbconf #q4) (isbconf #q2))
          :effect (basemotion #q4 #t152 #q2)
   )
   (:action s177_plan-base-motion
          :parameters (#q4 #q3)
          :precondition (and (isbconf #q4) (isbconf #q3))
          :effect (basemotion #q4 #t153 #q3)
   )
   (:action s178_plan-base-motion
          :parameters (#q4 #q4)
          :precondition (and (isbconf #q4) (isbconf #q4))
          :effect (basemotion #q4 #t154 #q4)
   )
   (:action s179_plan-base-motion
          :parameters (#q4 #q5)
          :precondition (and (isbconf #q4) (isbconf #q5))
          :effect (basemotion #q4 #t155 #q5)
   )
   (:action s180_plan-base-motion
          :parameters (#q4 #q6)
          :precondition (and (isbconf #q4) (isbconf #q6))
          :effect (basemotion #q4 #t156 #q6)
   )
   (:action s181_plan-base-motion
          :parameters (#q4 #q7)
          :precondition (and (isbconf #q4) (isbconf #q7))
          :effect (basemotion #q4 #t157 #q7)
   )
   (:action s182_plan-base-motion
          :parameters (#q4 #q8)
          :precondition (and (isbconf #q4) (isbconf #q8))
          :effect (basemotion #q4 #t158 #q8)
   )
   (:action s183_plan-base-motion
          :parameters (#q4 #q9)
          :precondition (and (isbconf #q4) (isbconf #q9))
          :effect (basemotion #q4 #t159 #q9)
   )
   (:action s184_plan-base-motion
          :parameters (#q4 #q10)
          :precondition (and (isbconf #q4) (isbconf #q10))
          :effect (basemotion #q4 #t160 #q10)
   )
   (:action s185_plan-base-motion
          :parameters (#q4 #q11)
          :precondition (and (isbconf #q4) (isbconf #q11))
          :effect (basemotion #q4 #t161 #q11)
   )
   (:action s186_plan-base-motion
          :parameters (#q4 #q12)
          :precondition (and (isbconf #q4) (isbconf #q12))
          :effect (basemotion #q4 #t162 #q12)
   )
   (:action s187_plan-base-motion
          :parameters (#q4 #q13)
          :precondition (and (isbconf #q4) (isbconf #q13))
          :effect (basemotion #q4 #t163 #q13)
   )
   (:action s188_plan-base-motion
          :parameters (#q4 #q14)
          :precondition (and (isbconf #q4) (isbconf #q14))
          :effect (basemotion #q4 #t164 #q14)
   )
   (:action s189_plan-base-motion
          :parameters (#q4 #q15)
          :precondition (and (isbconf #q4) (isbconf #q15))
          :effect (basemotion #q4 #t165 #q15)
   )
   (:action s190_plan-base-motion
          :parameters (#q4 #q16)
          :precondition (and (isbconf #q4) (isbconf #q16))
          :effect (basemotion #q4 #t166 #q16)
   )
   (:action s191_plan-base-motion
          :parameters (#q4 #q17)
          :precondition (and (isbconf #q4) (isbconf #q17))
          :effect (basemotion #q4 #t167 #q17)
   )
   (:action s192_plan-base-motion
          :parameters (#q4 #q18)
          :precondition (and (isbconf #q4) (isbconf #q18))
          :effect (basemotion #q4 #t168 #q18)
   )
   (:action s193_plan-base-motion
          :parameters (#q4 #q19)
          :precondition (and (isbconf #q4) (isbconf #q19))
          :effect (basemotion #q4 #t169 #q19)
   )
   (:action s194_plan-base-motion
          :parameters (#q4 #q20)
          :precondition (and (isbconf #q4) (isbconf #q20))
          :effect (basemotion #q4 #t170 #q20)
   )
   (:action s195_plan-base-motion
          :parameters (#q4 #q21)
          :precondition (and (isbconf #q4) (isbconf #q21))
          :effect (basemotion #q4 #t171 #q21)
   )
   (:action s196_plan-base-motion
          :parameters (#q4 #q22)
          :precondition (and (isbconf #q4) (isbconf #q22))
          :effect (basemotion #q4 #t172 #q22)
   )
   (:action s197_plan-base-motion
          :parameters (#q4 #q23)
          :precondition (and (isbconf #q4) (isbconf #q23))
          :effect (basemotion #q4 #t173 #q23)
   )
   (:action s198_plan-base-motion
          :parameters (#q5 q8)
          :precondition (and (isbconf #q5) (isbconf q8))
          :effect (basemotion #q5 #t174 q8)
   )
   (:action s199_plan-base-motion
          :parameters (#q5 #q0)
          :precondition (and (isbconf #q5) (isbconf #q0))
          :effect (basemotion #q5 #t175 #q0)
   )
   (:action s200_plan-base-motion
          :parameters (#q5 #q1)
          :precondition (and (isbconf #q5) (isbconf #q1))
          :effect (basemotion #q5 #t176 #q1)
   )
   (:action s201_plan-base-motion
          :parameters (#q5 #q2)
          :precondition (and (isbconf #q5) (isbconf #q2))
          :effect (basemotion #q5 #t177 #q2)
   )
   (:action s202_plan-base-motion
          :parameters (#q5 #q3)
          :precondition (and (isbconf #q5) (isbconf #q3))
          :effect (basemotion #q5 #t178 #q3)
   )
   (:action s203_plan-base-motion
          :parameters (#q5 #q4)
          :precondition (and (isbconf #q5) (isbconf #q4))
          :effect (basemotion #q5 #t179 #q4)
   )
   (:action s204_plan-base-motion
          :parameters (#q5 #q5)
          :precondition (and (isbconf #q5) (isbconf #q5))
          :effect (basemotion #q5 #t180 #q5)
   )
   (:action s205_plan-base-motion
          :parameters (#q5 #q6)
          :precondition (and (isbconf #q5) (isbconf #q6))
          :effect (basemotion #q5 #t181 #q6)
   )
   (:action s206_plan-base-motion
          :parameters (#q5 #q7)
          :precondition (and (isbconf #q5) (isbconf #q7))
          :effect (basemotion #q5 #t182 #q7)
   )
   (:action s207_plan-base-motion
          :parameters (#q5 #q8)
          :precondition (and (isbconf #q5) (isbconf #q8))
          :effect (basemotion #q5 #t183 #q8)
   )
   (:action s208_plan-base-motion
          :parameters (#q5 #q9)
          :precondition (and (isbconf #q5) (isbconf #q9))
          :effect (basemotion #q5 #t184 #q9)
   )
   (:action s209_plan-base-motion
          :parameters (#q5 #q10)
          :precondition (and (isbconf #q5) (isbconf #q10))
          :effect (basemotion #q5 #t185 #q10)
   )
   (:action s210_plan-base-motion
          :parameters (#q5 #q11)
          :precondition (and (isbconf #q5) (isbconf #q11))
          :effect (basemotion #q5 #t186 #q11)
   )
   (:action s211_plan-base-motion
          :parameters (#q5 #q12)
          :precondition (and (isbconf #q5) (isbconf #q12))
          :effect (basemotion #q5 #t187 #q12)
   )
   (:action s212_plan-base-motion
          :parameters (#q5 #q13)
          :precondition (and (isbconf #q5) (isbconf #q13))
          :effect (basemotion #q5 #t188 #q13)
   )
   (:action s213_plan-base-motion
          :parameters (#q5 #q14)
          :precondition (and (isbconf #q5) (isbconf #q14))
          :effect (basemotion #q5 #t189 #q14)
   )
   (:action s214_plan-base-motion
          :parameters (#q5 #q15)
          :precondition (and (isbconf #q5) (isbconf #q15))
          :effect (basemotion #q5 #t190 #q15)
   )
   (:action s215_plan-base-motion
          :parameters (#q5 #q16)
          :precondition (and (isbconf #q5) (isbconf #q16))
          :effect (basemotion #q5 #t191 #q16)
   )
   (:action s216_plan-base-motion
          :parameters (#q5 #q17)
          :precondition (and (isbconf #q5) (isbconf #q17))
          :effect (basemotion #q5 #t192 #q17)
   )
   (:action s217_plan-base-motion
          :parameters (#q5 #q18)
          :precondition (and (isbconf #q5) (isbconf #q18))
          :effect (basemotion #q5 #t193 #q18)
   )
   (:action s218_plan-base-motion
          :parameters (#q5 #q19)
          :precondition (and (isbconf #q5) (isbconf #q19))
          :effect (basemotion #q5 #t194 #q19)
   )
   (:action s219_plan-base-motion
          :parameters (#q5 #q20)
          :precondition (and (isbconf #q5) (isbconf #q20))
          :effect (basemotion #q5 #t195 #q20)
   )
   (:action s220_plan-base-motion
          :parameters (#q5 #q21)
          :precondition (and (isbconf #q5) (isbconf #q21))
          :effect (basemotion #q5 #t196 #q21)
   )
   (:action s221_plan-base-motion
          :parameters (#q5 #q22)
          :precondition (and (isbconf #q5) (isbconf #q22))
          :effect (basemotion #q5 #t197 #q22)
   )
   (:action s222_plan-base-motion
          :parameters (#q5 #q23)
          :precondition (and (isbconf #q5) (isbconf #q23))
          :effect (basemotion #q5 #t198 #q23)
   )
   (:action s223_plan-base-motion
          :parameters (#q6 q8)
          :precondition (and (isbconf #q6) (isbconf q8))
          :effect (basemotion #q6 #t199 q8)
   )
   (:action s224_plan-base-motion
          :parameters (#q6 #q0)
          :precondition (and (isbconf #q6) (isbconf #q0))
          :effect (basemotion #q6 #t200 #q0)
   )
   (:action s225_plan-base-motion
          :parameters (#q6 #q1)
          :precondition (and (isbconf #q6) (isbconf #q1))
          :effect (basemotion #q6 #t201 #q1)
   )
   (:action s226_plan-base-motion
          :parameters (#q6 #q2)
          :precondition (and (isbconf #q6) (isbconf #q2))
          :effect (basemotion #q6 #t202 #q2)
   )
   (:action s227_plan-base-motion
          :parameters (#q6 #q3)
          :precondition (and (isbconf #q6) (isbconf #q3))
          :effect (basemotion #q6 #t203 #q3)
   )
   (:action s228_plan-base-motion
          :parameters (#q6 #q4)
          :precondition (and (isbconf #q6) (isbconf #q4))
          :effect (basemotion #q6 #t204 #q4)
   )
   (:action s229_plan-base-motion
          :parameters (#q6 #q5)
          :precondition (and (isbconf #q6) (isbconf #q5))
          :effect (basemotion #q6 #t205 #q5)
   )
   (:action s230_plan-base-motion
          :parameters (#q6 #q6)
          :precondition (and (isbconf #q6) (isbconf #q6))
          :effect (basemotion #q6 #t206 #q6)
   )
   (:action s231_plan-base-motion
          :parameters (#q6 #q7)
          :precondition (and (isbconf #q6) (isbconf #q7))
          :effect (basemotion #q6 #t207 #q7)
   )
   (:action s232_plan-base-motion
          :parameters (#q6 #q8)
          :precondition (and (isbconf #q6) (isbconf #q8))
          :effect (basemotion #q6 #t208 #q8)
   )
   (:action s233_plan-base-motion
          :parameters (#q6 #q9)
          :precondition (and (isbconf #q6) (isbconf #q9))
          :effect (basemotion #q6 #t209 #q9)
   )
   (:action s234_plan-base-motion
          :parameters (#q6 #q10)
          :precondition (and (isbconf #q6) (isbconf #q10))
          :effect (basemotion #q6 #t210 #q10)
   )
   (:action s235_plan-base-motion
          :parameters (#q6 #q11)
          :precondition (and (isbconf #q6) (isbconf #q11))
          :effect (basemotion #q6 #t211 #q11)
   )
   (:action s236_plan-base-motion
          :parameters (#q6 #q12)
          :precondition (and (isbconf #q6) (isbconf #q12))
          :effect (basemotion #q6 #t212 #q12)
   )
   (:action s237_plan-base-motion
          :parameters (#q6 #q13)
          :precondition (and (isbconf #q6) (isbconf #q13))
          :effect (basemotion #q6 #t213 #q13)
   )
   (:action s238_plan-base-motion
          :parameters (#q6 #q14)
          :precondition (and (isbconf #q6) (isbconf #q14))
          :effect (basemotion #q6 #t214 #q14)
   )
   (:action s239_plan-base-motion
          :parameters (#q6 #q15)
          :precondition (and (isbconf #q6) (isbconf #q15))
          :effect (basemotion #q6 #t215 #q15)
   )
   (:action s240_plan-base-motion
          :parameters (#q6 #q16)
          :precondition (and (isbconf #q6) (isbconf #q16))
          :effect (basemotion #q6 #t216 #q16)
   )
   (:action s241_plan-base-motion
          :parameters (#q6 #q17)
          :precondition (and (isbconf #q6) (isbconf #q17))
          :effect (basemotion #q6 #t217 #q17)
   )
   (:action s242_plan-base-motion
          :parameters (#q6 #q18)
          :precondition (and (isbconf #q6) (isbconf #q18))
          :effect (basemotion #q6 #t218 #q18)
   )
   (:action s243_plan-base-motion
          :parameters (#q6 #q19)
          :precondition (and (isbconf #q6) (isbconf #q19))
          :effect (basemotion #q6 #t219 #q19)
   )
   (:action s244_plan-base-motion
          :parameters (#q6 #q20)
          :precondition (and (isbconf #q6) (isbconf #q20))
          :effect (basemotion #q6 #t220 #q20)
   )
   (:action s245_plan-base-motion
          :parameters (#q6 #q21)
          :precondition (and (isbconf #q6) (isbconf #q21))
          :effect (basemotion #q6 #t221 #q21)
   )
   (:action s246_plan-base-motion
          :parameters (#q6 #q22)
          :precondition (and (isbconf #q6) (isbconf #q22))
          :effect (basemotion #q6 #t222 #q22)
   )
   (:action s247_plan-base-motion
          :parameters (#q6 #q23)
          :precondition (and (isbconf #q6) (isbconf #q23))
          :effect (basemotion #q6 #t223 #q23)
   )
   (:action s248_plan-base-motion
          :parameters (#q7 q8)
          :precondition (and (isbconf #q7) (isbconf q8))
          :effect (basemotion #q7 #t224 q8)
   )
   (:action s249_plan-base-motion
          :parameters (#q7 #q0)
          :precondition (and (isbconf #q7) (isbconf #q0))
          :effect (basemotion #q7 #t225 #q0)
   )
   (:action s250_plan-base-motion
          :parameters (#q7 #q1)
          :precondition (and (isbconf #q7) (isbconf #q1))
          :effect (basemotion #q7 #t226 #q1)
   )
   (:action s251_plan-base-motion
          :parameters (#q7 #q2)
          :precondition (and (isbconf #q7) (isbconf #q2))
          :effect (basemotion #q7 #t227 #q2)
   )
   (:action s252_plan-base-motion
          :parameters (#q7 #q3)
          :precondition (and (isbconf #q7) (isbconf #q3))
          :effect (basemotion #q7 #t228 #q3)
   )
   (:action s253_plan-base-motion
          :parameters (#q7 #q4)
          :precondition (and (isbconf #q7) (isbconf #q4))
          :effect (basemotion #q7 #t229 #q4)
   )
   (:action s254_plan-base-motion
          :parameters (#q7 #q5)
          :precondition (and (isbconf #q7) (isbconf #q5))
          :effect (basemotion #q7 #t230 #q5)
   )
   (:action s255_plan-base-motion
          :parameters (#q7 #q6)
          :precondition (and (isbconf #q7) (isbconf #q6))
          :effect (basemotion #q7 #t231 #q6)
   )
   (:action s256_plan-base-motion
          :parameters (#q7 #q7)
          :precondition (and (isbconf #q7) (isbconf #q7))
          :effect (basemotion #q7 #t232 #q7)
   )
   (:action s257_plan-base-motion
          :parameters (#q7 #q8)
          :precondition (and (isbconf #q7) (isbconf #q8))
          :effect (basemotion #q7 #t233 #q8)
   )
   (:action s258_plan-base-motion
          :parameters (#q7 #q9)
          :precondition (and (isbconf #q7) (isbconf #q9))
          :effect (basemotion #q7 #t234 #q9)
   )
   (:action s259_plan-base-motion
          :parameters (#q7 #q10)
          :precondition (and (isbconf #q7) (isbconf #q10))
          :effect (basemotion #q7 #t235 #q10)
   )
   (:action s260_plan-base-motion
          :parameters (#q7 #q11)
          :precondition (and (isbconf #q7) (isbconf #q11))
          :effect (basemotion #q7 #t236 #q11)
   )
   (:action s261_plan-base-motion
          :parameters (#q7 #q12)
          :precondition (and (isbconf #q7) (isbconf #q12))
          :effect (basemotion #q7 #t237 #q12)
   )
   (:action s262_plan-base-motion
          :parameters (#q7 #q13)
          :precondition (and (isbconf #q7) (isbconf #q13))
          :effect (basemotion #q7 #t238 #q13)
   )
   (:action s263_plan-base-motion
          :parameters (#q7 #q14)
          :precondition (and (isbconf #q7) (isbconf #q14))
          :effect (basemotion #q7 #t239 #q14)
   )
   (:action s264_plan-base-motion
          :parameters (#q7 #q15)
          :precondition (and (isbconf #q7) (isbconf #q15))
          :effect (basemotion #q7 #t240 #q15)
   )
   (:action s265_plan-base-motion
          :parameters (#q7 #q16)
          :precondition (and (isbconf #q7) (isbconf #q16))
          :effect (basemotion #q7 #t241 #q16)
   )
   (:action s266_plan-base-motion
          :parameters (#q7 #q17)
          :precondition (and (isbconf #q7) (isbconf #q17))
          :effect (basemotion #q7 #t242 #q17)
   )
   (:action s267_plan-base-motion
          :parameters (#q7 #q18)
          :precondition (and (isbconf #q7) (isbconf #q18))
          :effect (basemotion #q7 #t243 #q18)
   )
   (:action s268_plan-base-motion
          :parameters (#q7 #q19)
          :precondition (and (isbconf #q7) (isbconf #q19))
          :effect (basemotion #q7 #t244 #q19)
   )
   (:action s269_plan-base-motion
          :parameters (#q7 #q20)
          :precondition (and (isbconf #q7) (isbconf #q20))
          :effect (basemotion #q7 #t245 #q20)
   )
   (:action s270_plan-base-motion
          :parameters (#q7 #q21)
          :precondition (and (isbconf #q7) (isbconf #q21))
          :effect (basemotion #q7 #t246 #q21)
   )
   (:action s271_plan-base-motion
          :parameters (#q7 #q22)
          :precondition (and (isbconf #q7) (isbconf #q22))
          :effect (basemotion #q7 #t247 #q22)
   )
   (:action s272_plan-base-motion
          :parameters (#q7 #q23)
          :precondition (and (isbconf #q7) (isbconf #q23))
          :effect (basemotion #q7 #t248 #q23)
   )
   (:action s273_plan-base-motion
          :parameters (#q8 q8)
          :precondition (and (isbconf #q8) (isbconf q8))
          :effect (basemotion #q8 #t249 q8)
   )
   (:action s274_plan-base-motion
          :parameters (#q8 #q0)
          :precondition (and (isbconf #q8) (isbconf #q0))
          :effect (basemotion #q8 #t250 #q0)
   )
   (:action s275_plan-base-motion
          :parameters (#q8 #q1)
          :precondition (and (isbconf #q8) (isbconf #q1))
          :effect (basemotion #q8 #t251 #q1)
   )
   (:action s276_plan-base-motion
          :parameters (#q8 #q2)
          :precondition (and (isbconf #q8) (isbconf #q2))
          :effect (basemotion #q8 #t252 #q2)
   )
   (:action s277_plan-base-motion
          :parameters (#q8 #q3)
          :precondition (and (isbconf #q8) (isbconf #q3))
          :effect (basemotion #q8 #t253 #q3)
   )
   (:action s278_plan-base-motion
          :parameters (#q8 #q4)
          :precondition (and (isbconf #q8) (isbconf #q4))
          :effect (basemotion #q8 #t254 #q4)
   )
   (:action s279_plan-base-motion
          :parameters (#q8 #q5)
          :precondition (and (isbconf #q8) (isbconf #q5))
          :effect (basemotion #q8 #t255 #q5)
   )
   (:action s280_plan-base-motion
          :parameters (#q8 #q6)
          :precondition (and (isbconf #q8) (isbconf #q6))
          :effect (basemotion #q8 #t256 #q6)
   )
   (:action s281_plan-base-motion
          :parameters (#q8 #q7)
          :precondition (and (isbconf #q8) (isbconf #q7))
          :effect (basemotion #q8 #t257 #q7)
   )
   (:action s282_plan-base-motion
          :parameters (#q8 #q8)
          :precondition (and (isbconf #q8) (isbconf #q8))
          :effect (basemotion #q8 #t258 #q8)
   )
   (:action s283_plan-base-motion
          :parameters (#q8 #q9)
          :precondition (and (isbconf #q8) (isbconf #q9))
          :effect (basemotion #q8 #t259 #q9)
   )
   (:action s284_plan-base-motion
          :parameters (#q8 #q10)
          :precondition (and (isbconf #q8) (isbconf #q10))
          :effect (basemotion #q8 #t260 #q10)
   )
   (:action s285_plan-base-motion
          :parameters (#q8 #q11)
          :precondition (and (isbconf #q8) (isbconf #q11))
          :effect (basemotion #q8 #t261 #q11)
   )
   (:action s286_plan-base-motion
          :parameters (#q8 #q12)
          :precondition (and (isbconf #q8) (isbconf #q12))
          :effect (basemotion #q8 #t262 #q12)
   )
   (:action s287_plan-base-motion
          :parameters (#q8 #q13)
          :precondition (and (isbconf #q8) (isbconf #q13))
          :effect (basemotion #q8 #t263 #q13)
   )
   (:action s288_plan-base-motion
          :parameters (#q8 #q14)
          :precondition (and (isbconf #q8) (isbconf #q14))
          :effect (basemotion #q8 #t264 #q14)
   )
   (:action s289_plan-base-motion
          :parameters (#q8 #q15)
          :precondition (and (isbconf #q8) (isbconf #q15))
          :effect (basemotion #q8 #t265 #q15)
   )
   (:action s290_plan-base-motion
          :parameters (#q8 #q16)
          :precondition (and (isbconf #q8) (isbconf #q16))
          :effect (basemotion #q8 #t266 #q16)
   )
   (:action s291_plan-base-motion
          :parameters (#q8 #q17)
          :precondition (and (isbconf #q8) (isbconf #q17))
          :effect (basemotion #q8 #t267 #q17)
   )
   (:action s292_plan-base-motion
          :parameters (#q8 #q18)
          :precondition (and (isbconf #q8) (isbconf #q18))
          :effect (basemotion #q8 #t268 #q18)
   )
   (:action s293_plan-base-motion
          :parameters (#q8 #q19)
          :precondition (and (isbconf #q8) (isbconf #q19))
          :effect (basemotion #q8 #t269 #q19)
   )
   (:action s294_plan-base-motion
          :parameters (#q8 #q20)
          :precondition (and (isbconf #q8) (isbconf #q20))
          :effect (basemotion #q8 #t270 #q20)
   )
   (:action s295_plan-base-motion
          :parameters (#q8 #q21)
          :precondition (and (isbconf #q8) (isbconf #q21))
          :effect (basemotion #q8 #t271 #q21)
   )
   (:action s296_plan-base-motion
          :parameters (#q8 #q22)
          :precondition (and (isbconf #q8) (isbconf #q22))
          :effect (basemotion #q8 #t272 #q22)
   )
   (:action s297_plan-base-motion
          :parameters (#q8 #q23)
          :precondition (and (isbconf #q8) (isbconf #q23))
          :effect (basemotion #q8 #t273 #q23)
   )
   (:action s298_plan-base-motion
          :parameters (#q9 q8)
          :precondition (and (isbconf #q9) (isbconf q8))
          :effect (basemotion #q9 #t274 q8)
   )
   (:action s299_plan-base-motion
          :parameters (#q9 #q0)
          :precondition (and (isbconf #q9) (isbconf #q0))
          :effect (basemotion #q9 #t275 #q0)
   )
   (:action s300_plan-base-motion
          :parameters (#q9 #q1)
          :precondition (and (isbconf #q9) (isbconf #q1))
          :effect (basemotion #q9 #t276 #q1)
   )
   (:action s301_plan-base-motion
          :parameters (#q9 #q2)
          :precondition (and (isbconf #q9) (isbconf #q2))
          :effect (basemotion #q9 #t277 #q2)
   )
   (:action s302_plan-base-motion
          :parameters (#q9 #q3)
          :precondition (and (isbconf #q9) (isbconf #q3))
          :effect (basemotion #q9 #t278 #q3)
   )
   (:action s303_plan-base-motion
          :parameters (#q9 #q4)
          :precondition (and (isbconf #q9) (isbconf #q4))
          :effect (basemotion #q9 #t279 #q4)
   )
   (:action s304_plan-base-motion
          :parameters (#q9 #q5)
          :precondition (and (isbconf #q9) (isbconf #q5))
          :effect (basemotion #q9 #t280 #q5)
   )
   (:action s305_plan-base-motion
          :parameters (#q9 #q6)
          :precondition (and (isbconf #q9) (isbconf #q6))
          :effect (basemotion #q9 #t281 #q6)
   )
   (:action s306_plan-base-motion
          :parameters (#q9 #q7)
          :precondition (and (isbconf #q9) (isbconf #q7))
          :effect (basemotion #q9 #t282 #q7)
   )
   (:action s307_plan-base-motion
          :parameters (#q9 #q8)
          :precondition (and (isbconf #q9) (isbconf #q8))
          :effect (basemotion #q9 #t283 #q8)
   )
   (:action s308_plan-base-motion
          :parameters (#q9 #q9)
          :precondition (and (isbconf #q9) (isbconf #q9))
          :effect (basemotion #q9 #t284 #q9)
   )
   (:action s309_plan-base-motion
          :parameters (#q9 #q10)
          :precondition (and (isbconf #q9) (isbconf #q10))
          :effect (basemotion #q9 #t285 #q10)
   )
   (:action s310_plan-base-motion
          :parameters (#q9 #q11)
          :precondition (and (isbconf #q9) (isbconf #q11))
          :effect (basemotion #q9 #t286 #q11)
   )
   (:action s311_plan-base-motion
          :parameters (#q9 #q12)
          :precondition (and (isbconf #q9) (isbconf #q12))
          :effect (basemotion #q9 #t287 #q12)
   )
   (:action s312_plan-base-motion
          :parameters (#q9 #q13)
          :precondition (and (isbconf #q9) (isbconf #q13))
          :effect (basemotion #q9 #t288 #q13)
   )
   (:action s313_plan-base-motion
          :parameters (#q9 #q14)
          :precondition (and (isbconf #q9) (isbconf #q14))
          :effect (basemotion #q9 #t289 #q14)
   )
   (:action s314_plan-base-motion
          :parameters (#q9 #q15)
          :precondition (and (isbconf #q9) (isbconf #q15))
          :effect (basemotion #q9 #t290 #q15)
   )
   (:action s315_plan-base-motion
          :parameters (#q9 #q16)
          :precondition (and (isbconf #q9) (isbconf #q16))
          :effect (basemotion #q9 #t291 #q16)
   )
   (:action s316_plan-base-motion
          :parameters (#q9 #q17)
          :precondition (and (isbconf #q9) (isbconf #q17))
          :effect (basemotion #q9 #t292 #q17)
   )
   (:action s317_plan-base-motion
          :parameters (#q9 #q18)
          :precondition (and (isbconf #q9) (isbconf #q18))
          :effect (basemotion #q9 #t293 #q18)
   )
   (:action s318_plan-base-motion
          :parameters (#q9 #q19)
          :precondition (and (isbconf #q9) (isbconf #q19))
          :effect (basemotion #q9 #t294 #q19)
   )
   (:action s319_plan-base-motion
          :parameters (#q9 #q20)
          :precondition (and (isbconf #q9) (isbconf #q20))
          :effect (basemotion #q9 #t295 #q20)
   )
   (:action s320_plan-base-motion
          :parameters (#q9 #q21)
          :precondition (and (isbconf #q9) (isbconf #q21))
          :effect (basemotion #q9 #t296 #q21)
   )
   (:action s321_plan-base-motion
          :parameters (#q9 #q22)
          :precondition (and (isbconf #q9) (isbconf #q22))
          :effect (basemotion #q9 #t297 #q22)
   )
   (:action s322_plan-base-motion
          :parameters (#q9 #q23)
          :precondition (and (isbconf #q9) (isbconf #q23))
          :effect (basemotion #q9 #t298 #q23)
   )
   (:action s323_plan-base-motion
          :parameters (#q10 q8)
          :precondition (and (isbconf #q10) (isbconf q8))
          :effect (basemotion #q10 #t299 q8)
   )
   (:action s324_plan-base-motion
          :parameters (#q10 #q0)
          :precondition (and (isbconf #q10) (isbconf #q0))
          :effect (basemotion #q10 #t300 #q0)
   )
   (:action s325_plan-base-motion
          :parameters (#q10 #q1)
          :precondition (and (isbconf #q10) (isbconf #q1))
          :effect (basemotion #q10 #t301 #q1)
   )
   (:action s326_plan-base-motion
          :parameters (#q10 #q2)
          :precondition (and (isbconf #q10) (isbconf #q2))
          :effect (basemotion #q10 #t302 #q2)
   )
   (:action s327_plan-base-motion
          :parameters (#q10 #q3)
          :precondition (and (isbconf #q10) (isbconf #q3))
          :effect (basemotion #q10 #t303 #q3)
   )
   (:action s328_plan-base-motion
          :parameters (#q10 #q4)
          :precondition (and (isbconf #q10) (isbconf #q4))
          :effect (basemotion #q10 #t304 #q4)
   )
   (:action s329_plan-base-motion
          :parameters (#q10 #q5)
          :precondition (and (isbconf #q10) (isbconf #q5))
          :effect (basemotion #q10 #t305 #q5)
   )
   (:action s330_plan-base-motion
          :parameters (#q10 #q6)
          :precondition (and (isbconf #q10) (isbconf #q6))
          :effect (basemotion #q10 #t306 #q6)
   )
   (:action s331_plan-base-motion
          :parameters (#q10 #q7)
          :precondition (and (isbconf #q10) (isbconf #q7))
          :effect (basemotion #q10 #t307 #q7)
   )
   (:action s332_plan-base-motion
          :parameters (#q10 #q8)
          :precondition (and (isbconf #q10) (isbconf #q8))
          :effect (basemotion #q10 #t308 #q8)
   )
   (:action s333_plan-base-motion
          :parameters (#q10 #q9)
          :precondition (and (isbconf #q10) (isbconf #q9))
          :effect (basemotion #q10 #t309 #q9)
   )
   (:action s334_plan-base-motion
          :parameters (#q10 #q10)
          :precondition (and (isbconf #q10) (isbconf #q10))
          :effect (basemotion #q10 #t310 #q10)
   )
   (:action s335_plan-base-motion
          :parameters (#q10 #q11)
          :precondition (and (isbconf #q10) (isbconf #q11))
          :effect (basemotion #q10 #t311 #q11)
   )
   (:action s336_plan-base-motion
          :parameters (#q10 #q12)
          :precondition (and (isbconf #q10) (isbconf #q12))
          :effect (basemotion #q10 #t312 #q12)
   )
   (:action s337_plan-base-motion
          :parameters (#q10 #q13)
          :precondition (and (isbconf #q10) (isbconf #q13))
          :effect (basemotion #q10 #t313 #q13)
   )
   (:action s338_plan-base-motion
          :parameters (#q10 #q14)
          :precondition (and (isbconf #q10) (isbconf #q14))
          :effect (basemotion #q10 #t314 #q14)
   )
   (:action s339_plan-base-motion
          :parameters (#q10 #q15)
          :precondition (and (isbconf #q10) (isbconf #q15))
          :effect (basemotion #q10 #t315 #q15)
   )
   (:action s340_plan-base-motion
          :parameters (#q10 #q16)
          :precondition (and (isbconf #q10) (isbconf #q16))
          :effect (basemotion #q10 #t316 #q16)
   )
   (:action s341_plan-base-motion
          :parameters (#q10 #q17)
          :precondition (and (isbconf #q10) (isbconf #q17))
          :effect (basemotion #q10 #t317 #q17)
   )
   (:action s342_plan-base-motion
          :parameters (#q10 #q18)
          :precondition (and (isbconf #q10) (isbconf #q18))
          :effect (basemotion #q10 #t318 #q18)
   )
   (:action s343_plan-base-motion
          :parameters (#q10 #q19)
          :precondition (and (isbconf #q10) (isbconf #q19))
          :effect (basemotion #q10 #t319 #q19)
   )
   (:action s344_plan-base-motion
          :parameters (#q10 #q20)
          :precondition (and (isbconf #q10) (isbconf #q20))
          :effect (basemotion #q10 #t320 #q20)
   )
   (:action s345_plan-base-motion
          :parameters (#q10 #q21)
          :precondition (and (isbconf #q10) (isbconf #q21))
          :effect (basemotion #q10 #t321 #q21)
   )
   (:action s346_plan-base-motion
          :parameters (#q10 #q22)
          :precondition (and (isbconf #q10) (isbconf #q22))
          :effect (basemotion #q10 #t322 #q22)
   )
   (:action s347_plan-base-motion
          :parameters (#q10 #q23)
          :precondition (and (isbconf #q10) (isbconf #q23))
          :effect (basemotion #q10 #t323 #q23)
   )
   (:action s348_plan-base-motion
          :parameters (#q11 q8)
          :precondition (and (isbconf #q11) (isbconf q8))
          :effect (basemotion #q11 #t324 q8)
   )
   (:action s349_plan-base-motion
          :parameters (#q11 #q0)
          :precondition (and (isbconf #q11) (isbconf #q0))
          :effect (basemotion #q11 #t325 #q0)
   )
   (:action s350_plan-base-motion
          :parameters (#q11 #q1)
          :precondition (and (isbconf #q11) (isbconf #q1))
          :effect (basemotion #q11 #t326 #q1)
   )
   (:action s351_plan-base-motion
          :parameters (#q11 #q2)
          :precondition (and (isbconf #q11) (isbconf #q2))
          :effect (basemotion #q11 #t327 #q2)
   )
   (:action s352_plan-base-motion
          :parameters (#q11 #q3)
          :precondition (and (isbconf #q11) (isbconf #q3))
          :effect (basemotion #q11 #t328 #q3)
   )
   (:action s353_plan-base-motion
          :parameters (#q11 #q4)
          :precondition (and (isbconf #q11) (isbconf #q4))
          :effect (basemotion #q11 #t329 #q4)
   )
   (:action s354_plan-base-motion
          :parameters (#q11 #q5)
          :precondition (and (isbconf #q11) (isbconf #q5))
          :effect (basemotion #q11 #t330 #q5)
   )
   (:action s355_plan-base-motion
          :parameters (#q11 #q6)
          :precondition (and (isbconf #q11) (isbconf #q6))
          :effect (basemotion #q11 #t331 #q6)
   )
   (:action s356_plan-base-motion
          :parameters (#q11 #q7)
          :precondition (and (isbconf #q11) (isbconf #q7))
          :effect (basemotion #q11 #t332 #q7)
   )
   (:action s357_plan-base-motion
          :parameters (#q11 #q8)
          :precondition (and (isbconf #q11) (isbconf #q8))
          :effect (basemotion #q11 #t333 #q8)
   )
   (:action s358_plan-base-motion
          :parameters (#q11 #q9)
          :precondition (and (isbconf #q11) (isbconf #q9))
          :effect (basemotion #q11 #t334 #q9)
   )
   (:action s359_plan-base-motion
          :parameters (#q11 #q10)
          :precondition (and (isbconf #q11) (isbconf #q10))
          :effect (basemotion #q11 #t335 #q10)
   )
   (:action s360_plan-base-motion
          :parameters (#q11 #q11)
          :precondition (and (isbconf #q11) (isbconf #q11))
          :effect (basemotion #q11 #t336 #q11)
   )
   (:action s361_plan-base-motion
          :parameters (#q11 #q12)
          :precondition (and (isbconf #q11) (isbconf #q12))
          :effect (basemotion #q11 #t337 #q12)
   )
   (:action s362_plan-base-motion
          :parameters (#q11 #q13)
          :precondition (and (isbconf #q11) (isbconf #q13))
          :effect (basemotion #q11 #t338 #q13)
   )
   (:action s363_plan-base-motion
          :parameters (#q11 #q14)
          :precondition (and (isbconf #q11) (isbconf #q14))
          :effect (basemotion #q11 #t339 #q14)
   )
   (:action s364_plan-base-motion
          :parameters (#q11 #q15)
          :precondition (and (isbconf #q11) (isbconf #q15))
          :effect (basemotion #q11 #t340 #q15)
   )
   (:action s365_plan-base-motion
          :parameters (#q11 #q16)
          :precondition (and (isbconf #q11) (isbconf #q16))
          :effect (basemotion #q11 #t341 #q16)
   )
   (:action s366_plan-base-motion
          :parameters (#q11 #q17)
          :precondition (and (isbconf #q11) (isbconf #q17))
          :effect (basemotion #q11 #t342 #q17)
   )
   (:action s367_plan-base-motion
          :parameters (#q11 #q18)
          :precondition (and (isbconf #q11) (isbconf #q18))
          :effect (basemotion #q11 #t343 #q18)
   )
   (:action s368_plan-base-motion
          :parameters (#q11 #q19)
          :precondition (and (isbconf #q11) (isbconf #q19))
          :effect (basemotion #q11 #t344 #q19)
   )
   (:action s369_plan-base-motion
          :parameters (#q11 #q20)
          :precondition (and (isbconf #q11) (isbconf #q20))
          :effect (basemotion #q11 #t345 #q20)
   )
   (:action s370_plan-base-motion
          :parameters (#q11 #q21)
          :precondition (and (isbconf #q11) (isbconf #q21))
          :effect (basemotion #q11 #t346 #q21)
   )
   (:action s371_plan-base-motion
          :parameters (#q11 #q22)
          :precondition (and (isbconf #q11) (isbconf #q22))
          :effect (basemotion #q11 #t347 #q22)
   )
   (:action s372_plan-base-motion
          :parameters (#q11 #q23)
          :precondition (and (isbconf #q11) (isbconf #q23))
          :effect (basemotion #q11 #t348 #q23)
   )
   (:action s373_plan-base-motion
          :parameters (#q12 q8)
          :precondition (and (isbconf #q12) (isbconf q8))
          :effect (basemotion #q12 #t349 q8)
   )
   (:action s374_plan-base-motion
          :parameters (#q12 #q0)
          :precondition (and (isbconf #q12) (isbconf #q0))
          :effect (basemotion #q12 #t350 #q0)
   )
   (:action s375_plan-base-motion
          :parameters (#q12 #q1)
          :precondition (and (isbconf #q12) (isbconf #q1))
          :effect (basemotion #q12 #t351 #q1)
   )
   (:action s376_plan-base-motion
          :parameters (#q12 #q2)
          :precondition (and (isbconf #q12) (isbconf #q2))
          :effect (basemotion #q12 #t352 #q2)
   )
   (:action s377_plan-base-motion
          :parameters (#q12 #q3)
          :precondition (and (isbconf #q12) (isbconf #q3))
          :effect (basemotion #q12 #t353 #q3)
   )
   (:action s378_plan-base-motion
          :parameters (#q12 #q4)
          :precondition (and (isbconf #q12) (isbconf #q4))
          :effect (basemotion #q12 #t354 #q4)
   )
   (:action s379_plan-base-motion
          :parameters (#q12 #q5)
          :precondition (and (isbconf #q12) (isbconf #q5))
          :effect (basemotion #q12 #t355 #q5)
   )
   (:action s380_plan-base-motion
          :parameters (#q12 #q6)
          :precondition (and (isbconf #q12) (isbconf #q6))
          :effect (basemotion #q12 #t356 #q6)
   )
   (:action s381_plan-base-motion
          :parameters (#q12 #q7)
          :precondition (and (isbconf #q12) (isbconf #q7))
          :effect (basemotion #q12 #t357 #q7)
   )
   (:action s382_plan-base-motion
          :parameters (#q12 #q8)
          :precondition (and (isbconf #q12) (isbconf #q8))
          :effect (basemotion #q12 #t358 #q8)
   )
   (:action s383_plan-base-motion
          :parameters (#q12 #q9)
          :precondition (and (isbconf #q12) (isbconf #q9))
          :effect (basemotion #q12 #t359 #q9)
   )
   (:action s384_plan-base-motion
          :parameters (#q12 #q10)
          :precondition (and (isbconf #q12) (isbconf #q10))
          :effect (basemotion #q12 #t360 #q10)
   )
   (:action s385_plan-base-motion
          :parameters (#q12 #q11)
          :precondition (and (isbconf #q12) (isbconf #q11))
          :effect (basemotion #q12 #t361 #q11)
   )
   (:action s386_plan-base-motion
          :parameters (#q12 #q12)
          :precondition (and (isbconf #q12) (isbconf #q12))
          :effect (basemotion #q12 #t362 #q12)
   )
   (:action s387_plan-base-motion
          :parameters (#q12 #q13)
          :precondition (and (isbconf #q12) (isbconf #q13))
          :effect (basemotion #q12 #t363 #q13)
   )
   (:action s388_plan-base-motion
          :parameters (#q12 #q14)
          :precondition (and (isbconf #q12) (isbconf #q14))
          :effect (basemotion #q12 #t364 #q14)
   )
   (:action s389_plan-base-motion
          :parameters (#q12 #q15)
          :precondition (and (isbconf #q12) (isbconf #q15))
          :effect (basemotion #q12 #t365 #q15)
   )
   (:action s390_plan-base-motion
          :parameters (#q12 #q16)
          :precondition (and (isbconf #q12) (isbconf #q16))
          :effect (basemotion #q12 #t366 #q16)
   )
   (:action s391_plan-base-motion
          :parameters (#q12 #q17)
          :precondition (and (isbconf #q12) (isbconf #q17))
          :effect (basemotion #q12 #t367 #q17)
   )
   (:action s392_plan-base-motion
          :parameters (#q12 #q18)
          :precondition (and (isbconf #q12) (isbconf #q18))
          :effect (basemotion #q12 #t368 #q18)
   )
   (:action s393_plan-base-motion
          :parameters (#q12 #q19)
          :precondition (and (isbconf #q12) (isbconf #q19))
          :effect (basemotion #q12 #t369 #q19)
   )
   (:action s394_plan-base-motion
          :parameters (#q12 #q20)
          :precondition (and (isbconf #q12) (isbconf #q20))
          :effect (basemotion #q12 #t370 #q20)
   )
   (:action s395_plan-base-motion
          :parameters (#q12 #q21)
          :precondition (and (isbconf #q12) (isbconf #q21))
          :effect (basemotion #q12 #t371 #q21)
   )
   (:action s396_plan-base-motion
          :parameters (#q12 #q22)
          :precondition (and (isbconf #q12) (isbconf #q22))
          :effect (basemotion #q12 #t372 #q22)
   )
   (:action s397_plan-base-motion
          :parameters (#q12 #q23)
          :precondition (and (isbconf #q12) (isbconf #q23))
          :effect (basemotion #q12 #t373 #q23)
   )
   (:action s398_plan-base-motion
          :parameters (#q13 q8)
          :precondition (and (isbconf #q13) (isbconf q8))
          :effect (basemotion #q13 #t374 q8)
   )
   (:action s399_plan-base-motion
          :parameters (#q13 #q0)
          :precondition (and (isbconf #q13) (isbconf #q0))
          :effect (basemotion #q13 #t375 #q0)
   )
   (:action s400_plan-base-motion
          :parameters (#q13 #q1)
          :precondition (and (isbconf #q13) (isbconf #q1))
          :effect (basemotion #q13 #t376 #q1)
   )
   (:action s401_plan-base-motion
          :parameters (#q13 #q2)
          :precondition (and (isbconf #q13) (isbconf #q2))
          :effect (basemotion #q13 #t377 #q2)
   )
   (:action s402_plan-base-motion
          :parameters (#q13 #q3)
          :precondition (and (isbconf #q13) (isbconf #q3))
          :effect (basemotion #q13 #t378 #q3)
   )
   (:action s403_plan-base-motion
          :parameters (#q13 #q4)
          :precondition (and (isbconf #q13) (isbconf #q4))
          :effect (basemotion #q13 #t379 #q4)
   )
   (:action s404_plan-base-motion
          :parameters (#q13 #q5)
          :precondition (and (isbconf #q13) (isbconf #q5))
          :effect (basemotion #q13 #t380 #q5)
   )
   (:action s405_plan-base-motion
          :parameters (#q13 #q6)
          :precondition (and (isbconf #q13) (isbconf #q6))
          :effect (basemotion #q13 #t381 #q6)
   )
   (:action s406_plan-base-motion
          :parameters (#q13 #q7)
          :precondition (and (isbconf #q13) (isbconf #q7))
          :effect (basemotion #q13 #t382 #q7)
   )
   (:action s407_plan-base-motion
          :parameters (#q13 #q8)
          :precondition (and (isbconf #q13) (isbconf #q8))
          :effect (basemotion #q13 #t383 #q8)
   )
   (:action s408_plan-base-motion
          :parameters (#q13 #q9)
          :precondition (and (isbconf #q13) (isbconf #q9))
          :effect (basemotion #q13 #t384 #q9)
   )
   (:action s409_plan-base-motion
          :parameters (#q13 #q10)
          :precondition (and (isbconf #q13) (isbconf #q10))
          :effect (basemotion #q13 #t385 #q10)
   )
   (:action s410_plan-base-motion
          :parameters (#q13 #q11)
          :precondition (and (isbconf #q13) (isbconf #q11))
          :effect (basemotion #q13 #t386 #q11)
   )
   (:action s411_plan-base-motion
          :parameters (#q13 #q12)
          :precondition (and (isbconf #q13) (isbconf #q12))
          :effect (basemotion #q13 #t387 #q12)
   )
   (:action s412_plan-base-motion
          :parameters (#q13 #q13)
          :precondition (and (isbconf #q13) (isbconf #q13))
          :effect (basemotion #q13 #t388 #q13)
   )
   (:action s413_plan-base-motion
          :parameters (#q13 #q14)
          :precondition (and (isbconf #q13) (isbconf #q14))
          :effect (basemotion #q13 #t389 #q14)
   )
   (:action s414_plan-base-motion
          :parameters (#q13 #q15)
          :precondition (and (isbconf #q13) (isbconf #q15))
          :effect (basemotion #q13 #t390 #q15)
   )
   (:action s415_plan-base-motion
          :parameters (#q13 #q16)
          :precondition (and (isbconf #q13) (isbconf #q16))
          :effect (basemotion #q13 #t391 #q16)
   )
   (:action s416_plan-base-motion
          :parameters (#q13 #q17)
          :precondition (and (isbconf #q13) (isbconf #q17))
          :effect (basemotion #q13 #t392 #q17)
   )
   (:action s417_plan-base-motion
          :parameters (#q13 #q18)
          :precondition (and (isbconf #q13) (isbconf #q18))
          :effect (basemotion #q13 #t393 #q18)
   )
   (:action s418_plan-base-motion
          :parameters (#q13 #q19)
          :precondition (and (isbconf #q13) (isbconf #q19))
          :effect (basemotion #q13 #t394 #q19)
   )
   (:action s419_plan-base-motion
          :parameters (#q13 #q20)
          :precondition (and (isbconf #q13) (isbconf #q20))
          :effect (basemotion #q13 #t395 #q20)
   )
   (:action s420_plan-base-motion
          :parameters (#q13 #q21)
          :precondition (and (isbconf #q13) (isbconf #q21))
          :effect (basemotion #q13 #t396 #q21)
   )
   (:action s421_plan-base-motion
          :parameters (#q13 #q22)
          :precondition (and (isbconf #q13) (isbconf #q22))
          :effect (basemotion #q13 #t397 #q22)
   )
   (:action s422_plan-base-motion
          :parameters (#q13 #q23)
          :precondition (and (isbconf #q13) (isbconf #q23))
          :effect (basemotion #q13 #t398 #q23)
   )
   (:action s423_plan-base-motion
          :parameters (#q14 q8)
          :precondition (and (isbconf #q14) (isbconf q8))
          :effect (basemotion #q14 #t399 q8)
   )
   (:action s424_plan-base-motion
          :parameters (#q14 #q0)
          :precondition (and (isbconf #q14) (isbconf #q0))
          :effect (basemotion #q14 #t400 #q0)
   )
   (:action s425_plan-base-motion
          :parameters (#q14 #q1)
          :precondition (and (isbconf #q14) (isbconf #q1))
          :effect (basemotion #q14 #t401 #q1)
   )
   (:action s426_plan-base-motion
          :parameters (#q14 #q2)
          :precondition (and (isbconf #q14) (isbconf #q2))
          :effect (basemotion #q14 #t402 #q2)
   )
   (:action s427_plan-base-motion
          :parameters (#q14 #q3)
          :precondition (and (isbconf #q14) (isbconf #q3))
          :effect (basemotion #q14 #t403 #q3)
   )
   (:action s428_plan-base-motion
          :parameters (#q14 #q4)
          :precondition (and (isbconf #q14) (isbconf #q4))
          :effect (basemotion #q14 #t404 #q4)
   )
   (:action s429_plan-base-motion
          :parameters (#q14 #q5)
          :precondition (and (isbconf #q14) (isbconf #q5))
          :effect (basemotion #q14 #t405 #q5)
   )
   (:action s430_plan-base-motion
          :parameters (#q14 #q6)
          :precondition (and (isbconf #q14) (isbconf #q6))
          :effect (basemotion #q14 #t406 #q6)
   )
   (:action s431_plan-base-motion
          :parameters (#q14 #q7)
          :precondition (and (isbconf #q14) (isbconf #q7))
          :effect (basemotion #q14 #t407 #q7)
   )
   (:action s432_plan-base-motion
          :parameters (#q14 #q8)
          :precondition (and (isbconf #q14) (isbconf #q8))
          :effect (basemotion #q14 #t408 #q8)
   )
   (:action s433_plan-base-motion
          :parameters (#q14 #q9)
          :precondition (and (isbconf #q14) (isbconf #q9))
          :effect (basemotion #q14 #t409 #q9)
   )
   (:action s434_plan-base-motion
          :parameters (#q14 #q10)
          :precondition (and (isbconf #q14) (isbconf #q10))
          :effect (basemotion #q14 #t410 #q10)
   )
   (:action s435_plan-base-motion
          :parameters (#q14 #q11)
          :precondition (and (isbconf #q14) (isbconf #q11))
          :effect (basemotion #q14 #t411 #q11)
   )
   (:action s436_plan-base-motion
          :parameters (#q14 #q12)
          :precondition (and (isbconf #q14) (isbconf #q12))
          :effect (basemotion #q14 #t412 #q12)
   )
   (:action s437_plan-base-motion
          :parameters (#q14 #q13)
          :precondition (and (isbconf #q14) (isbconf #q13))
          :effect (basemotion #q14 #t413 #q13)
   )
   (:action s438_plan-base-motion
          :parameters (#q14 #q14)
          :precondition (and (isbconf #q14) (isbconf #q14))
          :effect (basemotion #q14 #t414 #q14)
   )
   (:action s439_plan-base-motion
          :parameters (#q14 #q15)
          :precondition (and (isbconf #q14) (isbconf #q15))
          :effect (basemotion #q14 #t415 #q15)
   )
   (:action s440_plan-base-motion
          :parameters (#q14 #q16)
          :precondition (and (isbconf #q14) (isbconf #q16))
          :effect (basemotion #q14 #t416 #q16)
   )
   (:action s441_plan-base-motion
          :parameters (#q14 #q17)
          :precondition (and (isbconf #q14) (isbconf #q17))
          :effect (basemotion #q14 #t417 #q17)
   )
   (:action s442_plan-base-motion
          :parameters (#q14 #q18)
          :precondition (and (isbconf #q14) (isbconf #q18))
          :effect (basemotion #q14 #t418 #q18)
   )
   (:action s443_plan-base-motion
          :parameters (#q14 #q19)
          :precondition (and (isbconf #q14) (isbconf #q19))
          :effect (basemotion #q14 #t419 #q19)
   )
   (:action s444_plan-base-motion
          :parameters (#q14 #q20)
          :precondition (and (isbconf #q14) (isbconf #q20))
          :effect (basemotion #q14 #t420 #q20)
   )
   (:action s445_plan-base-motion
          :parameters (#q14 #q21)
          :precondition (and (isbconf #q14) (isbconf #q21))
          :effect (basemotion #q14 #t421 #q21)
   )
   (:action s446_plan-base-motion
          :parameters (#q14 #q22)
          :precondition (and (isbconf #q14) (isbconf #q22))
          :effect (basemotion #q14 #t422 #q22)
   )
   (:action s447_plan-base-motion
          :parameters (#q14 #q23)
          :precondition (and (isbconf #q14) (isbconf #q23))
          :effect (basemotion #q14 #t423 #q23)
   )
   (:action s448_plan-base-motion
          :parameters (#q15 q8)
          :precondition (and (isbconf #q15) (isbconf q8))
          :effect (basemotion #q15 #t424 q8)
   )
   (:action s449_plan-base-motion
          :parameters (#q15 #q0)
          :precondition (and (isbconf #q15) (isbconf #q0))
          :effect (basemotion #q15 #t425 #q0)
   )
   (:action s450_plan-base-motion
          :parameters (#q15 #q1)
          :precondition (and (isbconf #q15) (isbconf #q1))
          :effect (basemotion #q15 #t426 #q1)
   )
   (:action s451_plan-base-motion
          :parameters (#q15 #q2)
          :precondition (and (isbconf #q15) (isbconf #q2))
          :effect (basemotion #q15 #t427 #q2)
   )
   (:action s452_plan-base-motion
          :parameters (#q15 #q3)
          :precondition (and (isbconf #q15) (isbconf #q3))
          :effect (basemotion #q15 #t428 #q3)
   )
   (:action s453_plan-base-motion
          :parameters (#q15 #q4)
          :precondition (and (isbconf #q15) (isbconf #q4))
          :effect (basemotion #q15 #t429 #q4)
   )
   (:action s454_plan-base-motion
          :parameters (#q15 #q5)
          :precondition (and (isbconf #q15) (isbconf #q5))
          :effect (basemotion #q15 #t430 #q5)
   )
   (:action s455_plan-base-motion
          :parameters (#q15 #q6)
          :precondition (and (isbconf #q15) (isbconf #q6))
          :effect (basemotion #q15 #t431 #q6)
   )
   (:action s456_plan-base-motion
          :parameters (#q15 #q7)
          :precondition (and (isbconf #q15) (isbconf #q7))
          :effect (basemotion #q15 #t432 #q7)
   )
   (:action s457_plan-base-motion
          :parameters (#q15 #q8)
          :precondition (and (isbconf #q15) (isbconf #q8))
          :effect (basemotion #q15 #t433 #q8)
   )
   (:action s458_plan-base-motion
          :parameters (#q15 #q9)
          :precondition (and (isbconf #q15) (isbconf #q9))
          :effect (basemotion #q15 #t434 #q9)
   )
   (:action s459_plan-base-motion
          :parameters (#q15 #q10)
          :precondition (and (isbconf #q15) (isbconf #q10))
          :effect (basemotion #q15 #t435 #q10)
   )
   (:action s460_plan-base-motion
          :parameters (#q15 #q11)
          :precondition (and (isbconf #q15) (isbconf #q11))
          :effect (basemotion #q15 #t436 #q11)
   )
   (:action s461_plan-base-motion
          :parameters (#q15 #q12)
          :precondition (and (isbconf #q15) (isbconf #q12))
          :effect (basemotion #q15 #t437 #q12)
   )
   (:action s462_plan-base-motion
          :parameters (#q15 #q13)
          :precondition (and (isbconf #q15) (isbconf #q13))
          :effect (basemotion #q15 #t438 #q13)
   )
   (:action s463_plan-base-motion
          :parameters (#q15 #q14)
          :precondition (and (isbconf #q15) (isbconf #q14))
          :effect (basemotion #q15 #t439 #q14)
   )
   (:action s464_plan-base-motion
          :parameters (#q15 #q15)
          :precondition (and (isbconf #q15) (isbconf #q15))
          :effect (basemotion #q15 #t440 #q15)
   )
   (:action s465_plan-base-motion
          :parameters (#q15 #q16)
          :precondition (and (isbconf #q15) (isbconf #q16))
          :effect (basemotion #q15 #t441 #q16)
   )
   (:action s466_plan-base-motion
          :parameters (#q15 #q17)
          :precondition (and (isbconf #q15) (isbconf #q17))
          :effect (basemotion #q15 #t442 #q17)
   )
   (:action s467_plan-base-motion
          :parameters (#q15 #q18)
          :precondition (and (isbconf #q15) (isbconf #q18))
          :effect (basemotion #q15 #t443 #q18)
   )
   (:action s468_plan-base-motion
          :parameters (#q15 #q19)
          :precondition (and (isbconf #q15) (isbconf #q19))
          :effect (basemotion #q15 #t444 #q19)
   )
   (:action s469_plan-base-motion
          :parameters (#q15 #q20)
          :precondition (and (isbconf #q15) (isbconf #q20))
          :effect (basemotion #q15 #t445 #q20)
   )
   (:action s470_plan-base-motion
          :parameters (#q15 #q21)
          :precondition (and (isbconf #q15) (isbconf #q21))
          :effect (basemotion #q15 #t446 #q21)
   )
   (:action s471_plan-base-motion
          :parameters (#q15 #q22)
          :precondition (and (isbconf #q15) (isbconf #q22))
          :effect (basemotion #q15 #t447 #q22)
   )
   (:action s472_plan-base-motion
          :parameters (#q15 #q23)
          :precondition (and (isbconf #q15) (isbconf #q23))
          :effect (basemotion #q15 #t448 #q23)
   )
   (:action s473_plan-base-motion
          :parameters (#q16 q8)
          :precondition (and (isbconf #q16) (isbconf q8))
          :effect (basemotion #q16 #t449 q8)
   )
   (:action s474_plan-base-motion
          :parameters (#q16 #q0)
          :precondition (and (isbconf #q16) (isbconf #q0))
          :effect (basemotion #q16 #t450 #q0)
   )
   (:action s475_plan-base-motion
          :parameters (#q16 #q1)
          :precondition (and (isbconf #q16) (isbconf #q1))
          :effect (basemotion #q16 #t451 #q1)
   )
   (:action s476_plan-base-motion
          :parameters (#q16 #q2)
          :precondition (and (isbconf #q16) (isbconf #q2))
          :effect (basemotion #q16 #t452 #q2)
   )
   (:action s477_plan-base-motion
          :parameters (#q16 #q3)
          :precondition (and (isbconf #q16) (isbconf #q3))
          :effect (basemotion #q16 #t453 #q3)
   )
   (:action s478_plan-base-motion
          :parameters (#q16 #q4)
          :precondition (and (isbconf #q16) (isbconf #q4))
          :effect (basemotion #q16 #t454 #q4)
   )
   (:action s479_plan-base-motion
          :parameters (#q16 #q5)
          :precondition (and (isbconf #q16) (isbconf #q5))
          :effect (basemotion #q16 #t455 #q5)
   )
   (:action s480_plan-base-motion
          :parameters (#q16 #q6)
          :precondition (and (isbconf #q16) (isbconf #q6))
          :effect (basemotion #q16 #t456 #q6)
   )
   (:action s481_plan-base-motion
          :parameters (#q16 #q7)
          :precondition (and (isbconf #q16) (isbconf #q7))
          :effect (basemotion #q16 #t457 #q7)
   )
   (:action s482_plan-base-motion
          :parameters (#q16 #q8)
          :precondition (and (isbconf #q16) (isbconf #q8))
          :effect (basemotion #q16 #t458 #q8)
   )
   (:action s483_plan-base-motion
          :parameters (#q16 #q9)
          :precondition (and (isbconf #q16) (isbconf #q9))
          :effect (basemotion #q16 #t459 #q9)
   )
   (:action s484_plan-base-motion
          :parameters (#q16 #q10)
          :precondition (and (isbconf #q16) (isbconf #q10))
          :effect (basemotion #q16 #t460 #q10)
   )
   (:action s485_plan-base-motion
          :parameters (#q16 #q11)
          :precondition (and (isbconf #q16) (isbconf #q11))
          :effect (basemotion #q16 #t461 #q11)
   )
   (:action s486_plan-base-motion
          :parameters (#q16 #q12)
          :precondition (and (isbconf #q16) (isbconf #q12))
          :effect (basemotion #q16 #t462 #q12)
   )
   (:action s487_plan-base-motion
          :parameters (#q16 #q13)
          :precondition (and (isbconf #q16) (isbconf #q13))
          :effect (basemotion #q16 #t463 #q13)
   )
   (:action s488_plan-base-motion
          :parameters (#q16 #q14)
          :precondition (and (isbconf #q16) (isbconf #q14))
          :effect (basemotion #q16 #t464 #q14)
   )
   (:action s489_plan-base-motion
          :parameters (#q16 #q15)
          :precondition (and (isbconf #q16) (isbconf #q15))
          :effect (basemotion #q16 #t465 #q15)
   )
   (:action s490_plan-base-motion
          :parameters (#q16 #q16)
          :precondition (and (isbconf #q16) (isbconf #q16))
          :effect (basemotion #q16 #t466 #q16)
   )
   (:action s491_plan-base-motion
          :parameters (#q16 #q17)
          :precondition (and (isbconf #q16) (isbconf #q17))
          :effect (basemotion #q16 #t467 #q17)
   )
   (:action s492_plan-base-motion
          :parameters (#q16 #q18)
          :precondition (and (isbconf #q16) (isbconf #q18))
          :effect (basemotion #q16 #t468 #q18)
   )
   (:action s493_plan-base-motion
          :parameters (#q16 #q19)
          :precondition (and (isbconf #q16) (isbconf #q19))
          :effect (basemotion #q16 #t469 #q19)
   )
   (:action s494_plan-base-motion
          :parameters (#q16 #q20)
          :precondition (and (isbconf #q16) (isbconf #q20))
          :effect (basemotion #q16 #t470 #q20)
   )
   (:action s495_plan-base-motion
          :parameters (#q16 #q21)
          :precondition (and (isbconf #q16) (isbconf #q21))
          :effect (basemotion #q16 #t471 #q21)
   )
   (:action s496_plan-base-motion
          :parameters (#q16 #q22)
          :precondition (and (isbconf #q16) (isbconf #q22))
          :effect (basemotion #q16 #t472 #q22)
   )
   (:action s497_plan-base-motion
          :parameters (#q16 #q23)
          :precondition (and (isbconf #q16) (isbconf #q23))
          :effect (basemotion #q16 #t473 #q23)
   )
   (:action s498_plan-base-motion
          :parameters (#q17 q8)
          :precondition (and (isbconf #q17) (isbconf q8))
          :effect (basemotion #q17 #t474 q8)
   )
   (:action s499_plan-base-motion
          :parameters (#q17 #q0)
          :precondition (and (isbconf #q17) (isbconf #q0))
          :effect (basemotion #q17 #t475 #q0)
   )
   (:action s500_plan-base-motion
          :parameters (#q17 #q1)
          :precondition (and (isbconf #q17) (isbconf #q1))
          :effect (basemotion #q17 #t476 #q1)
   )
   (:action s501_plan-base-motion
          :parameters (#q17 #q2)
          :precondition (and (isbconf #q17) (isbconf #q2))
          :effect (basemotion #q17 #t477 #q2)
   )
   (:action s502_plan-base-motion
          :parameters (#q17 #q3)
          :precondition (and (isbconf #q17) (isbconf #q3))
          :effect (basemotion #q17 #t478 #q3)
   )
   (:action s503_plan-base-motion
          :parameters (#q17 #q4)
          :precondition (and (isbconf #q17) (isbconf #q4))
          :effect (basemotion #q17 #t479 #q4)
   )
   (:action s504_plan-base-motion
          :parameters (#q17 #q5)
          :precondition (and (isbconf #q17) (isbconf #q5))
          :effect (basemotion #q17 #t480 #q5)
   )
   (:action s505_plan-base-motion
          :parameters (#q17 #q6)
          :precondition (and (isbconf #q17) (isbconf #q6))
          :effect (basemotion #q17 #t481 #q6)
   )
   (:action s506_plan-base-motion
          :parameters (#q17 #q7)
          :precondition (and (isbconf #q17) (isbconf #q7))
          :effect (basemotion #q17 #t482 #q7)
   )
   (:action s507_plan-base-motion
          :parameters (#q17 #q8)
          :precondition (and (isbconf #q17) (isbconf #q8))
          :effect (basemotion #q17 #t483 #q8)
   )
   (:action s508_plan-base-motion
          :parameters (#q17 #q9)
          :precondition (and (isbconf #q17) (isbconf #q9))
          :effect (basemotion #q17 #t484 #q9)
   )
   (:action s509_plan-base-motion
          :parameters (#q17 #q10)
          :precondition (and (isbconf #q17) (isbconf #q10))
          :effect (basemotion #q17 #t485 #q10)
   )
   (:action s510_plan-base-motion
          :parameters (#q17 #q11)
          :precondition (and (isbconf #q17) (isbconf #q11))
          :effect (basemotion #q17 #t486 #q11)
   )
   (:action s511_plan-base-motion
          :parameters (#q17 #q12)
          :precondition (and (isbconf #q17) (isbconf #q12))
          :effect (basemotion #q17 #t487 #q12)
   )
   (:action s512_plan-base-motion
          :parameters (#q17 #q13)
          :precondition (and (isbconf #q17) (isbconf #q13))
          :effect (basemotion #q17 #t488 #q13)
   )
   (:action s513_plan-base-motion
          :parameters (#q17 #q14)
          :precondition (and (isbconf #q17) (isbconf #q14))
          :effect (basemotion #q17 #t489 #q14)
   )
   (:action s514_plan-base-motion
          :parameters (#q17 #q15)
          :precondition (and (isbconf #q17) (isbconf #q15))
          :effect (basemotion #q17 #t490 #q15)
   )
   (:action s515_plan-base-motion
          :parameters (#q17 #q16)
          :precondition (and (isbconf #q17) (isbconf #q16))
          :effect (basemotion #q17 #t491 #q16)
   )
   (:action s516_plan-base-motion
          :parameters (#q17 #q17)
          :precondition (and (isbconf #q17) (isbconf #q17))
          :effect (basemotion #q17 #t492 #q17)
   )
   (:action s517_plan-base-motion
          :parameters (#q17 #q18)
          :precondition (and (isbconf #q17) (isbconf #q18))
          :effect (basemotion #q17 #t493 #q18)
   )
   (:action s518_plan-base-motion
          :parameters (#q17 #q19)
          :precondition (and (isbconf #q17) (isbconf #q19))
          :effect (basemotion #q17 #t494 #q19)
   )
   (:action s519_plan-base-motion
          :parameters (#q17 #q20)
          :precondition (and (isbconf #q17) (isbconf #q20))
          :effect (basemotion #q17 #t495 #q20)
   )
   (:action s520_plan-base-motion
          :parameters (#q17 #q21)
          :precondition (and (isbconf #q17) (isbconf #q21))
          :effect (basemotion #q17 #t496 #q21)
   )
   (:action s521_plan-base-motion
          :parameters (#q17 #q22)
          :precondition (and (isbconf #q17) (isbconf #q22))
          :effect (basemotion #q17 #t497 #q22)
   )
   (:action s522_plan-base-motion
          :parameters (#q17 #q23)
          :precondition (and (isbconf #q17) (isbconf #q23))
          :effect (basemotion #q17 #t498 #q23)
   )
   (:action s523_plan-base-motion
          :parameters (#q18 q8)
          :precondition (and (isbconf #q18) (isbconf q8))
          :effect (basemotion #q18 #t499 q8)
   )
   (:action s524_plan-base-motion
          :parameters (#q18 #q0)
          :precondition (and (isbconf #q18) (isbconf #q0))
          :effect (basemotion #q18 #t500 #q0)
   )
   (:action s525_plan-base-motion
          :parameters (#q18 #q1)
          :precondition (and (isbconf #q18) (isbconf #q1))
          :effect (basemotion #q18 #t501 #q1)
   )
   (:action s526_plan-base-motion
          :parameters (#q18 #q2)
          :precondition (and (isbconf #q18) (isbconf #q2))
          :effect (basemotion #q18 #t502 #q2)
   )
   (:action s527_plan-base-motion
          :parameters (#q18 #q3)
          :precondition (and (isbconf #q18) (isbconf #q3))
          :effect (basemotion #q18 #t503 #q3)
   )
   (:action s528_plan-base-motion
          :parameters (#q18 #q4)
          :precondition (and (isbconf #q18) (isbconf #q4))
          :effect (basemotion #q18 #t504 #q4)
   )
   (:action s529_plan-base-motion
          :parameters (#q18 #q5)
          :precondition (and (isbconf #q18) (isbconf #q5))
          :effect (basemotion #q18 #t505 #q5)
   )
   (:action s530_plan-base-motion
          :parameters (#q18 #q6)
          :precondition (and (isbconf #q18) (isbconf #q6))
          :effect (basemotion #q18 #t506 #q6)
   )
   (:action s531_plan-base-motion
          :parameters (#q18 #q7)
          :precondition (and (isbconf #q18) (isbconf #q7))
          :effect (basemotion #q18 #t507 #q7)
   )
   (:action s532_plan-base-motion
          :parameters (#q18 #q8)
          :precondition (and (isbconf #q18) (isbconf #q8))
          :effect (basemotion #q18 #t508 #q8)
   )
   (:action s533_plan-base-motion
          :parameters (#q18 #q9)
          :precondition (and (isbconf #q18) (isbconf #q9))
          :effect (basemotion #q18 #t509 #q9)
   )
   (:action s534_plan-base-motion
          :parameters (#q18 #q10)
          :precondition (and (isbconf #q18) (isbconf #q10))
          :effect (basemotion #q18 #t510 #q10)
   )
   (:action s535_plan-base-motion
          :parameters (#q18 #q11)
          :precondition (and (isbconf #q18) (isbconf #q11))
          :effect (basemotion #q18 #t511 #q11)
   )
   (:action s536_plan-base-motion
          :parameters (#q18 #q12)
          :precondition (and (isbconf #q18) (isbconf #q12))
          :effect (basemotion #q18 #t512 #q12)
   )
   (:action s537_plan-base-motion
          :parameters (#q18 #q13)
          :precondition (and (isbconf #q18) (isbconf #q13))
          :effect (basemotion #q18 #t513 #q13)
   )
   (:action s538_plan-base-motion
          :parameters (#q18 #q14)
          :precondition (and (isbconf #q18) (isbconf #q14))
          :effect (basemotion #q18 #t514 #q14)
   )
   (:action s539_plan-base-motion
          :parameters (#q18 #q15)
          :precondition (and (isbconf #q18) (isbconf #q15))
          :effect (basemotion #q18 #t515 #q15)
   )
   (:action s540_plan-base-motion
          :parameters (#q18 #q16)
          :precondition (and (isbconf #q18) (isbconf #q16))
          :effect (basemotion #q18 #t516 #q16)
   )
   (:action s541_plan-base-motion
          :parameters (#q18 #q17)
          :precondition (and (isbconf #q18) (isbconf #q17))
          :effect (basemotion #q18 #t517 #q17)
   )
   (:action s542_plan-base-motion
          :parameters (#q18 #q18)
          :precondition (and (isbconf #q18) (isbconf #q18))
          :effect (basemotion #q18 #t518 #q18)
   )
   (:action s543_plan-base-motion
          :parameters (#q18 #q19)
          :precondition (and (isbconf #q18) (isbconf #q19))
          :effect (basemotion #q18 #t519 #q19)
   )
   (:action s544_plan-base-motion
          :parameters (#q18 #q20)
          :precondition (and (isbconf #q18) (isbconf #q20))
          :effect (basemotion #q18 #t520 #q20)
   )
   (:action s545_plan-base-motion
          :parameters (#q18 #q21)
          :precondition (and (isbconf #q18) (isbconf #q21))
          :effect (basemotion #q18 #t521 #q21)
   )
   (:action s546_plan-base-motion
          :parameters (#q18 #q22)
          :precondition (and (isbconf #q18) (isbconf #q22))
          :effect (basemotion #q18 #t522 #q22)
   )
   (:action s547_plan-base-motion
          :parameters (#q18 #q23)
          :precondition (and (isbconf #q18) (isbconf #q23))
          :effect (basemotion #q18 #t523 #q23)
   )
   (:action s548_plan-base-motion
          :parameters (#q19 q8)
          :precondition (and (isbconf #q19) (isbconf q8))
          :effect (basemotion #q19 #t524 q8)
   )
   (:action s549_plan-base-motion
          :parameters (#q19 #q0)
          :precondition (and (isbconf #q19) (isbconf #q0))
          :effect (basemotion #q19 #t525 #q0)
   )
   (:action s550_plan-base-motion
          :parameters (#q19 #q1)
          :precondition (and (isbconf #q19) (isbconf #q1))
          :effect (basemotion #q19 #t526 #q1)
   )
   (:action s551_plan-base-motion
          :parameters (#q19 #q2)
          :precondition (and (isbconf #q19) (isbconf #q2))
          :effect (basemotion #q19 #t527 #q2)
   )
   (:action s552_plan-base-motion
          :parameters (#q19 #q3)
          :precondition (and (isbconf #q19) (isbconf #q3))
          :effect (basemotion #q19 #t528 #q3)
   )
   (:action s553_plan-base-motion
          :parameters (#q19 #q4)
          :precondition (and (isbconf #q19) (isbconf #q4))
          :effect (basemotion #q19 #t529 #q4)
   )
   (:action s554_plan-base-motion
          :parameters (#q19 #q5)
          :precondition (and (isbconf #q19) (isbconf #q5))
          :effect (basemotion #q19 #t530 #q5)
   )
   (:action s555_plan-base-motion
          :parameters (#q19 #q6)
          :precondition (and (isbconf #q19) (isbconf #q6))
          :effect (basemotion #q19 #t531 #q6)
   )
   (:action s556_plan-base-motion
          :parameters (#q19 #q7)
          :precondition (and (isbconf #q19) (isbconf #q7))
          :effect (basemotion #q19 #t532 #q7)
   )
   (:action s557_plan-base-motion
          :parameters (#q19 #q8)
          :precondition (and (isbconf #q19) (isbconf #q8))
          :effect (basemotion #q19 #t533 #q8)
   )
   (:action s558_plan-base-motion
          :parameters (#q19 #q9)
          :precondition (and (isbconf #q19) (isbconf #q9))
          :effect (basemotion #q19 #t534 #q9)
   )
   (:action s559_plan-base-motion
          :parameters (#q19 #q10)
          :precondition (and (isbconf #q19) (isbconf #q10))
          :effect (basemotion #q19 #t535 #q10)
   )
   (:action s560_plan-base-motion
          :parameters (#q19 #q11)
          :precondition (and (isbconf #q19) (isbconf #q11))
          :effect (basemotion #q19 #t536 #q11)
   )
   (:action s561_plan-base-motion
          :parameters (#q19 #q12)
          :precondition (and (isbconf #q19) (isbconf #q12))
          :effect (basemotion #q19 #t537 #q12)
   )
   (:action s562_plan-base-motion
          :parameters (#q19 #q13)
          :precondition (and (isbconf #q19) (isbconf #q13))
          :effect (basemotion #q19 #t538 #q13)
   )
   (:action s563_plan-base-motion
          :parameters (#q19 #q14)
          :precondition (and (isbconf #q19) (isbconf #q14))
          :effect (basemotion #q19 #t539 #q14)
   )
   (:action s564_plan-base-motion
          :parameters (#q19 #q15)
          :precondition (and (isbconf #q19) (isbconf #q15))
          :effect (basemotion #q19 #t540 #q15)
   )
   (:action s565_plan-base-motion
          :parameters (#q19 #q16)
          :precondition (and (isbconf #q19) (isbconf #q16))
          :effect (basemotion #q19 #t541 #q16)
   )
   (:action s566_plan-base-motion
          :parameters (#q19 #q17)
          :precondition (and (isbconf #q19) (isbconf #q17))
          :effect (basemotion #q19 #t542 #q17)
   )
   (:action s567_plan-base-motion
          :parameters (#q19 #q18)
          :precondition (and (isbconf #q19) (isbconf #q18))
          :effect (basemotion #q19 #t543 #q18)
   )
   (:action s568_plan-base-motion
          :parameters (#q19 #q19)
          :precondition (and (isbconf #q19) (isbconf #q19))
          :effect (basemotion #q19 #t544 #q19)
   )
   (:action s569_plan-base-motion
          :parameters (#q19 #q20)
          :precondition (and (isbconf #q19) (isbconf #q20))
          :effect (basemotion #q19 #t545 #q20)
   )
   (:action s570_plan-base-motion
          :parameters (#q19 #q21)
          :precondition (and (isbconf #q19) (isbconf #q21))
          :effect (basemotion #q19 #t546 #q21)
   )
   (:action s571_plan-base-motion
          :parameters (#q19 #q22)
          :precondition (and (isbconf #q19) (isbconf #q22))
          :effect (basemotion #q19 #t547 #q22)
   )
   (:action s572_plan-base-motion
          :parameters (#q19 #q23)
          :precondition (and (isbconf #q19) (isbconf #q23))
          :effect (basemotion #q19 #t548 #q23)
   )
   (:action s573_plan-base-motion
          :parameters (#q20 q8)
          :precondition (and (isbconf #q20) (isbconf q8))
          :effect (basemotion #q20 #t549 q8)
   )
   (:action s574_plan-base-motion
          :parameters (#q20 #q0)
          :precondition (and (isbconf #q20) (isbconf #q0))
          :effect (basemotion #q20 #t550 #q0)
   )
   (:action s575_plan-base-motion
          :parameters (#q20 #q1)
          :precondition (and (isbconf #q20) (isbconf #q1))
          :effect (basemotion #q20 #t551 #q1)
   )
   (:action s576_plan-base-motion
          :parameters (#q20 #q2)
          :precondition (and (isbconf #q20) (isbconf #q2))
          :effect (basemotion #q20 #t552 #q2)
   )
   (:action s577_plan-base-motion
          :parameters (#q20 #q3)
          :precondition (and (isbconf #q20) (isbconf #q3))
          :effect (basemotion #q20 #t553 #q3)
   )
   (:action s578_plan-base-motion
          :parameters (#q20 #q4)
          :precondition (and (isbconf #q20) (isbconf #q4))
          :effect (basemotion #q20 #t554 #q4)
   )
   (:action s579_plan-base-motion
          :parameters (#q20 #q5)
          :precondition (and (isbconf #q20) (isbconf #q5))
          :effect (basemotion #q20 #t555 #q5)
   )
   (:action s580_plan-base-motion
          :parameters (#q20 #q6)
          :precondition (and (isbconf #q20) (isbconf #q6))
          :effect (basemotion #q20 #t556 #q6)
   )
   (:action s581_plan-base-motion
          :parameters (#q20 #q7)
          :precondition (and (isbconf #q20) (isbconf #q7))
          :effect (basemotion #q20 #t557 #q7)
   )
   (:action s582_plan-base-motion
          :parameters (#q20 #q8)
          :precondition (and (isbconf #q20) (isbconf #q8))
          :effect (basemotion #q20 #t558 #q8)
   )
   (:action s583_plan-base-motion
          :parameters (#q20 #q9)
          :precondition (and (isbconf #q20) (isbconf #q9))
          :effect (basemotion #q20 #t559 #q9)
   )
   (:action s584_plan-base-motion
          :parameters (#q20 #q10)
          :precondition (and (isbconf #q20) (isbconf #q10))
          :effect (basemotion #q20 #t560 #q10)
   )
   (:action s585_plan-base-motion
          :parameters (#q20 #q11)
          :precondition (and (isbconf #q20) (isbconf #q11))
          :effect (basemotion #q20 #t561 #q11)
   )
   (:action s586_plan-base-motion
          :parameters (#q20 #q12)
          :precondition (and (isbconf #q20) (isbconf #q12))
          :effect (basemotion #q20 #t562 #q12)
   )
   (:action s587_plan-base-motion
          :parameters (#q20 #q13)
          :precondition (and (isbconf #q20) (isbconf #q13))
          :effect (basemotion #q20 #t563 #q13)
   )
   (:action s588_plan-base-motion
          :parameters (#q20 #q14)
          :precondition (and (isbconf #q20) (isbconf #q14))
          :effect (basemotion #q20 #t564 #q14)
   )
   (:action s589_plan-base-motion
          :parameters (#q20 #q15)
          :precondition (and (isbconf #q20) (isbconf #q15))
          :effect (basemotion #q20 #t565 #q15)
   )
   (:action s590_plan-base-motion
          :parameters (#q20 #q16)
          :precondition (and (isbconf #q20) (isbconf #q16))
          :effect (basemotion #q20 #t566 #q16)
   )
   (:action s591_plan-base-motion
          :parameters (#q20 #q17)
          :precondition (and (isbconf #q20) (isbconf #q17))
          :effect (basemotion #q20 #t567 #q17)
   )
   (:action s592_plan-base-motion
          :parameters (#q20 #q18)
          :precondition (and (isbconf #q20) (isbconf #q18))
          :effect (basemotion #q20 #t568 #q18)
   )
   (:action s593_plan-base-motion
          :parameters (#q20 #q19)
          :precondition (and (isbconf #q20) (isbconf #q19))
          :effect (basemotion #q20 #t569 #q19)
   )
   (:action s594_plan-base-motion
          :parameters (#q20 #q20)
          :precondition (and (isbconf #q20) (isbconf #q20))
          :effect (basemotion #q20 #t570 #q20)
   )
   (:action s595_plan-base-motion
          :parameters (#q20 #q21)
          :precondition (and (isbconf #q20) (isbconf #q21))
          :effect (basemotion #q20 #t571 #q21)
   )
   (:action s596_plan-base-motion
          :parameters (#q20 #q22)
          :precondition (and (isbconf #q20) (isbconf #q22))
          :effect (basemotion #q20 #t572 #q22)
   )
   (:action s597_plan-base-motion
          :parameters (#q20 #q23)
          :precondition (and (isbconf #q20) (isbconf #q23))
          :effect (basemotion #q20 #t573 #q23)
   )
   (:action s598_plan-base-motion
          :parameters (#q21 q8)
          :precondition (and (isbconf #q21) (isbconf q8))
          :effect (basemotion #q21 #t574 q8)
   )
   (:action s599_plan-base-motion
          :parameters (#q21 #q0)
          :precondition (and (isbconf #q21) (isbconf #q0))
          :effect (basemotion #q21 #t575 #q0)
   )
   (:action s600_plan-base-motion
          :parameters (#q21 #q1)
          :precondition (and (isbconf #q21) (isbconf #q1))
          :effect (basemotion #q21 #t576 #q1)
   )
   (:action s601_plan-base-motion
          :parameters (#q21 #q2)
          :precondition (and (isbconf #q21) (isbconf #q2))
          :effect (basemotion #q21 #t577 #q2)
   )
   (:action s602_plan-base-motion
          :parameters (#q21 #q3)
          :precondition (and (isbconf #q21) (isbconf #q3))
          :effect (basemotion #q21 #t578 #q3)
   )
   (:action s603_plan-base-motion
          :parameters (#q21 #q4)
          :precondition (and (isbconf #q21) (isbconf #q4))
          :effect (basemotion #q21 #t579 #q4)
   )
   (:action s604_plan-base-motion
          :parameters (#q21 #q5)
          :precondition (and (isbconf #q21) (isbconf #q5))
          :effect (basemotion #q21 #t580 #q5)
   )
   (:action s605_plan-base-motion
          :parameters (#q21 #q6)
          :precondition (and (isbconf #q21) (isbconf #q6))
          :effect (basemotion #q21 #t581 #q6)
   )
   (:action s606_plan-base-motion
          :parameters (#q21 #q7)
          :precondition (and (isbconf #q21) (isbconf #q7))
          :effect (basemotion #q21 #t582 #q7)
   )
   (:action s607_plan-base-motion
          :parameters (#q21 #q8)
          :precondition (and (isbconf #q21) (isbconf #q8))
          :effect (basemotion #q21 #t583 #q8)
   )
   (:action s608_plan-base-motion
          :parameters (#q21 #q9)
          :precondition (and (isbconf #q21) (isbconf #q9))
          :effect (basemotion #q21 #t584 #q9)
   )
   (:action s609_plan-base-motion
          :parameters (#q21 #q10)
          :precondition (and (isbconf #q21) (isbconf #q10))
          :effect (basemotion #q21 #t585 #q10)
   )
   (:action s610_plan-base-motion
          :parameters (#q21 #q11)
          :precondition (and (isbconf #q21) (isbconf #q11))
          :effect (basemotion #q21 #t586 #q11)
   )
   (:action s611_plan-base-motion
          :parameters (#q21 #q12)
          :precondition (and (isbconf #q21) (isbconf #q12))
          :effect (basemotion #q21 #t587 #q12)
   )
   (:action s612_plan-base-motion
          :parameters (#q21 #q13)
          :precondition (and (isbconf #q21) (isbconf #q13))
          :effect (basemotion #q21 #t588 #q13)
   )
   (:action s613_plan-base-motion
          :parameters (#q21 #q14)
          :precondition (and (isbconf #q21) (isbconf #q14))
          :effect (basemotion #q21 #t589 #q14)
   )
   (:action s614_plan-base-motion
          :parameters (#q21 #q15)
          :precondition (and (isbconf #q21) (isbconf #q15))
          :effect (basemotion #q21 #t590 #q15)
   )
   (:action s615_plan-base-motion
          :parameters (#q21 #q16)
          :precondition (and (isbconf #q21) (isbconf #q16))
          :effect (basemotion #q21 #t591 #q16)
   )
   (:action s616_plan-base-motion
          :parameters (#q21 #q17)
          :precondition (and (isbconf #q21) (isbconf #q17))
          :effect (basemotion #q21 #t592 #q17)
   )
   (:action s617_plan-base-motion
          :parameters (#q21 #q18)
          :precondition (and (isbconf #q21) (isbconf #q18))
          :effect (basemotion #q21 #t593 #q18)
   )
   (:action s618_plan-base-motion
          :parameters (#q21 #q19)
          :precondition (and (isbconf #q21) (isbconf #q19))
          :effect (basemotion #q21 #t594 #q19)
   )
   (:action s619_plan-base-motion
          :parameters (#q21 #q20)
          :precondition (and (isbconf #q21) (isbconf #q20))
          :effect (basemotion #q21 #t595 #q20)
   )
   (:action s620_plan-base-motion
          :parameters (#q21 #q21)
          :precondition (and (isbconf #q21) (isbconf #q21))
          :effect (basemotion #q21 #t596 #q21)
   )
   (:action s621_plan-base-motion
          :parameters (#q21 #q22)
          :precondition (and (isbconf #q21) (isbconf #q22))
          :effect (basemotion #q21 #t597 #q22)
   )
   (:action s622_plan-base-motion
          :parameters (#q21 #q23)
          :precondition (and (isbconf #q21) (isbconf #q23))
          :effect (basemotion #q21 #t598 #q23)
   )
   (:action s623_plan-base-motion
          :parameters (#q22 q8)
          :precondition (and (isbconf #q22) (isbconf q8))
          :effect (basemotion #q22 #t599 q8)
   )
   (:action s624_plan-base-motion
          :parameters (#q22 #q0)
          :precondition (and (isbconf #q22) (isbconf #q0))
          :effect (basemotion #q22 #t600 #q0)
   )
   (:action s625_plan-base-motion
          :parameters (#q22 #q1)
          :precondition (and (isbconf #q22) (isbconf #q1))
          :effect (basemotion #q22 #t601 #q1)
   )
   (:action s626_plan-base-motion
          :parameters (#q22 #q2)
          :precondition (and (isbconf #q22) (isbconf #q2))
          :effect (basemotion #q22 #t602 #q2)
   )
   (:action s627_plan-base-motion
          :parameters (#q22 #q3)
          :precondition (and (isbconf #q22) (isbconf #q3))
          :effect (basemotion #q22 #t603 #q3)
   )
   (:action s628_plan-base-motion
          :parameters (#q22 #q4)
          :precondition (and (isbconf #q22) (isbconf #q4))
          :effect (basemotion #q22 #t604 #q4)
   )
   (:action s629_plan-base-motion
          :parameters (#q22 #q5)
          :precondition (and (isbconf #q22) (isbconf #q5))
          :effect (basemotion #q22 #t605 #q5)
   )
   (:action s630_plan-base-motion
          :parameters (#q22 #q6)
          :precondition (and (isbconf #q22) (isbconf #q6))
          :effect (basemotion #q22 #t606 #q6)
   )
   (:action s631_plan-base-motion
          :parameters (#q22 #q7)
          :precondition (and (isbconf #q22) (isbconf #q7))
          :effect (basemotion #q22 #t607 #q7)
   )
   (:action s632_plan-base-motion
          :parameters (#q22 #q8)
          :precondition (and (isbconf #q22) (isbconf #q8))
          :effect (basemotion #q22 #t608 #q8)
   )
   (:action s633_plan-base-motion
          :parameters (#q22 #q9)
          :precondition (and (isbconf #q22) (isbconf #q9))
          :effect (basemotion #q22 #t609 #q9)
   )
   (:action s634_plan-base-motion
          :parameters (#q22 #q10)
          :precondition (and (isbconf #q22) (isbconf #q10))
          :effect (basemotion #q22 #t610 #q10)
   )
   (:action s635_plan-base-motion
          :parameters (#q22 #q11)
          :precondition (and (isbconf #q22) (isbconf #q11))
          :effect (basemotion #q22 #t611 #q11)
   )
   (:action s636_plan-base-motion
          :parameters (#q22 #q12)
          :precondition (and (isbconf #q22) (isbconf #q12))
          :effect (basemotion #q22 #t612 #q12)
   )
   (:action s637_plan-base-motion
          :parameters (#q22 #q13)
          :precondition (and (isbconf #q22) (isbconf #q13))
          :effect (basemotion #q22 #t613 #q13)
   )
   (:action s638_plan-base-motion
          :parameters (#q22 #q14)
          :precondition (and (isbconf #q22) (isbconf #q14))
          :effect (basemotion #q22 #t614 #q14)
   )
   (:action s639_plan-base-motion
          :parameters (#q22 #q15)
          :precondition (and (isbconf #q22) (isbconf #q15))
          :effect (basemotion #q22 #t615 #q15)
   )
   (:action s640_plan-base-motion
          :parameters (#q22 #q16)
          :precondition (and (isbconf #q22) (isbconf #q16))
          :effect (basemotion #q22 #t616 #q16)
   )
   (:action s641_plan-base-motion
          :parameters (#q22 #q17)
          :precondition (and (isbconf #q22) (isbconf #q17))
          :effect (basemotion #q22 #t617 #q17)
   )
   (:action s642_plan-base-motion
          :parameters (#q22 #q18)
          :precondition (and (isbconf #q22) (isbconf #q18))
          :effect (basemotion #q22 #t618 #q18)
   )
   (:action s643_plan-base-motion
          :parameters (#q22 #q19)
          :precondition (and (isbconf #q22) (isbconf #q19))
          :effect (basemotion #q22 #t619 #q19)
   )
   (:action s644_plan-base-motion
          :parameters (#q22 #q20)
          :precondition (and (isbconf #q22) (isbconf #q20))
          :effect (basemotion #q22 #t620 #q20)
   )
   (:action s645_plan-base-motion
          :parameters (#q22 #q21)
          :precondition (and (isbconf #q22) (isbconf #q21))
          :effect (basemotion #q22 #t621 #q21)
   )
   (:action s646_plan-base-motion
          :parameters (#q22 #q22)
          :precondition (and (isbconf #q22) (isbconf #q22))
          :effect (basemotion #q22 #t622 #q22)
   )
   (:action s647_plan-base-motion
          :parameters (#q22 #q23)
          :precondition (and (isbconf #q22) (isbconf #q23))
          :effect (basemotion #q22 #t623 #q23)
   )
   (:action s648_plan-base-motion
          :parameters (#q23 q8)
          :precondition (and (isbconf #q23) (isbconf q8))
          :effect (basemotion #q23 #t624 q8)
   )
   (:action s649_plan-base-motion
          :parameters (#q23 #q0)
          :precondition (and (isbconf #q23) (isbconf #q0))
          :effect (basemotion #q23 #t625 #q0)
   )
   (:action s650_plan-base-motion
          :parameters (#q23 #q1)
          :precondition (and (isbconf #q23) (isbconf #q1))
          :effect (basemotion #q23 #t626 #q1)
   )
   (:action s651_plan-base-motion
          :parameters (#q23 #q2)
          :precondition (and (isbconf #q23) (isbconf #q2))
          :effect (basemotion #q23 #t627 #q2)
   )
   (:action s652_plan-base-motion
          :parameters (#q23 #q3)
          :precondition (and (isbconf #q23) (isbconf #q3))
          :effect (basemotion #q23 #t628 #q3)
   )
   (:action s653_plan-base-motion
          :parameters (#q23 #q4)
          :precondition (and (isbconf #q23) (isbconf #q4))
          :effect (basemotion #q23 #t629 #q4)
   )
   (:action s654_plan-base-motion
          :parameters (#q23 #q5)
          :precondition (and (isbconf #q23) (isbconf #q5))
          :effect (basemotion #q23 #t630 #q5)
   )
   (:action s655_plan-base-motion
          :parameters (#q23 #q6)
          :precondition (and (isbconf #q23) (isbconf #q6))
          :effect (basemotion #q23 #t631 #q6)
   )
   (:action s656_plan-base-motion
          :parameters (#q23 #q7)
          :precondition (and (isbconf #q23) (isbconf #q7))
          :effect (basemotion #q23 #t632 #q7)
   )
   (:action s657_plan-base-motion
          :parameters (#q23 #q8)
          :precondition (and (isbconf #q23) (isbconf #q8))
          :effect (basemotion #q23 #t633 #q8)
   )
   (:action s658_plan-base-motion
          :parameters (#q23 #q9)
          :precondition (and (isbconf #q23) (isbconf #q9))
          :effect (basemotion #q23 #t634 #q9)
   )
   (:action s659_plan-base-motion
          :parameters (#q23 #q10)
          :precondition (and (isbconf #q23) (isbconf #q10))
          :effect (basemotion #q23 #t635 #q10)
   )
   (:action s660_plan-base-motion
          :parameters (#q23 #q11)
          :precondition (and (isbconf #q23) (isbconf #q11))
          :effect (basemotion #q23 #t636 #q11)
   )
   (:action s661_plan-base-motion
          :parameters (#q23 #q12)
          :precondition (and (isbconf #q23) (isbconf #q12))
          :effect (basemotion #q23 #t637 #q12)
   )
   (:action s662_plan-base-motion
          :parameters (#q23 #q13)
          :precondition (and (isbconf #q23) (isbconf #q13))
          :effect (basemotion #q23 #t638 #q13)
   )
   (:action s663_plan-base-motion
          :parameters (#q23 #q14)
          :precondition (and (isbconf #q23) (isbconf #q14))
          :effect (basemotion #q23 #t639 #q14)
   )
   (:action s664_plan-base-motion
          :parameters (#q23 #q15)
          :precondition (and (isbconf #q23) (isbconf #q15))
          :effect (basemotion #q23 #t640 #q15)
   )
   (:action s665_plan-base-motion
          :parameters (#q23 #q16)
          :precondition (and (isbconf #q23) (isbconf #q16))
          :effect (basemotion #q23 #t641 #q16)
   )
   (:action s666_plan-base-motion
          :parameters (#q23 #q17)
          :precondition (and (isbconf #q23) (isbconf #q17))
          :effect (basemotion #q23 #t642 #q17)
   )
   (:action s667_plan-base-motion
          :parameters (#q23 #q18)
          :precondition (and (isbconf #q23) (isbconf #q18))
          :effect (basemotion #q23 #t643 #q18)
   )
   (:action s668_plan-base-motion
          :parameters (#q23 #q19)
          :precondition (and (isbconf #q23) (isbconf #q19))
          :effect (basemotion #q23 #t644 #q19)
   )
   (:action s669_plan-base-motion
          :parameters (#q23 #q20)
          :precondition (and (isbconf #q23) (isbconf #q20))
          :effect (basemotion #q23 #t645 #q20)
   )
   (:action s670_plan-base-motion
          :parameters (#q23 #q21)
          :precondition (and (isbconf #q23) (isbconf #q21))
          :effect (basemotion #q23 #t646 #q21)
   )
   (:action s671_plan-base-motion
          :parameters (#q23 #q22)
          :precondition (and (isbconf #q23) (isbconf #q22))
          :effect (basemotion #q23 #t647 #q22)
   )
   (:action s672_plan-base-motion
          :parameters (#q23 #q23)
          :precondition (and (isbconf #q23) (isbconf #q23))
          :effect (basemotion #q23 #t648 #q23)
   )
)
