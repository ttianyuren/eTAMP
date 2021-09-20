;16:36:14 19/09

;Skeleton_SN = 0

(define (domain pr2-tamp_propo)
   (:requirements :strips :equality :action-costs)

   (:types
          arm wuti grasp config pose trajectory propo_action
   )

   (:constants
          #p0 #p1 #p10 #p11 #p12 #p13 #p14 #p15 #p16 #p17 #p18 #p19 #p2 #p20 #p21 #p22 #p23 #p24 #p3 #p4 #p5 #p6 #p7 #p8 #p9 - pose
          #a0 #a1 #a10 #a100 #a101 #a102 #a103 #a104 #a105 #a106 #a107 #a108 #a109 #a11 #a110 #a111 #a112 #a113 #a114 #a115 #a116 #a117 #a118 #a119 #a12 #a120 #a121 #a122 #a123 #a124 #a125 #a126 #a127 #a128 #a129 #a13 #a130 #a131 #a132 #a133 #a134 #a135 #a136 #a137 #a138 #a139 #a14 #a140 #a141 #a142 #a143 #a144 #a145 #a146 #a147 #a148 #a149 #a15 #a150 #a151 #a152 #a153 #a154 #a155 #a156 #a157 #a158 #a159 #a16 #a160 #a161 #a162 #a163 #a164 #a165 #a166 #a167 #a168 #a169 #a17 #a170 #a171 #a172 #a173 #a174 #a175 #a176 #a177 #a178 #a179 #a18 #a180 #a181 #a182 #a183 #a184 #a185 #a186 #a187 #a188 #a189 #a19 #a190 #a191 #a192 #a193 #a194 #a195 #a196 #a197 #a198 #a199 #a2 #a20 #a200 #a201 #a202 #a203 #a204 #a205 #a206 #a207 #a208 #a209 #a21 #a210 #a211 #a212 #a213 #a214 #a215 #a216 #a217 #a218 #a219 #a22 #a220 #a221 #a222 #a223 #a224 #a225 #a226 #a227 #a228 #a229 #a23 #a230 #a231 #a232 #a233 #a234 #a235 #a236 #a237 #a238 #a239 #a24 #a240 #a241 #a242 #a243 #a244 #a245 #a246 #a247 #a248 #a249 #a25 #a250 #a251 #a252 #a253 #a254 #a255 #a256 #a257 #a258 #a259 #a26 #a260 #a261 #a262 #a263 #a264 #a265 #a266 #a267 #a268 #a269 #a27 #a270 #a271 #a272 #a273 #a274 #a275 #a276 #a277 #a278 #a279 #a28 #a280 #a281 #a282 #a283 #a284 #a285 #a286 #a287 #a288 #a289 #a29 #a290 #a291 #a292 #a293 #a294 #a295 #a296 #a297 #a298 #a299 #a3 #a30 #a300 #a301 #a302 #a303 #a304 #a305 #a306 #a307 #a308 #a309 #a31 #a310 #a311 #a312 #a313 #a314 #a315 #a316 #a317 #a318 #a319 #a32 #a320 #a321 #a322 #a323 #a324 #a325 #a326 #a327 #a328 #a329 #a33 #a330 #a331 #a332 #a333 #a334 #a335 #a34 #a35 #a36 #a37 #a38 #a39 #a4 #a40 #a41 #a42 #a43 #a44 #a45 #a46 #a47 #a48 #a49 #a5 #a50 #a51 #a52 #a53 #a54 #a55 #a56 #a57 #a58 #a59 #a6 #a60 #a61 #a62 #a63 #a64 #a65 #a66 #a67 #a68 #a69 #a7 #a70 #a71 #a72 #a73 #a74 #a75 #a76 #a77 #a78 #a79 #a8 #a80 #a81 #a82 #a83 #a84 #a85 #a86 #a87 #a88 #a89 #a9 #a90 #a91 #a92 #a93 #a94 #a95 #a96 #a97 #a98 #a99 - arm
          #g0 #g1 #g10 #g100 #g101 #g102 #g103 #g104 #g105 #g106 #g107 #g108 #g109 #g11 #g110 #g111 #g112 #g113 #g114 #g115 #g116 #g117 #g118 #g119 #g12 #g120 #g121 #g122 #g123 #g124 #g125 #g126 #g127 #g128 #g129 #g13 #g130 #g131 #g132 #g133 #g134 #g135 #g136 #g137 #g138 #g139 #g14 #g140 #g141 #g142 #g143 #g144 #g145 #g146 #g147 #g148 #g149 #g15 #g150 #g151 #g152 #g153 #g154 #g155 #g156 #g157 #g158 #g159 #g16 #g160 #g161 #g162 #g163 #g164 #g165 #g166 #g167 #g168 #g169 #g17 #g170 #g171 #g172 #g173 #g174 #g175 #g176 #g177 #g178 #g179 #g18 #g180 #g181 #g182 #g183 #g184 #g185 #g186 #g187 #g188 #g189 #g19 #g190 #g191 #g192 #g193 #g194 #g195 #g196 #g197 #g198 #g199 #g2 #g20 #g200 #g201 #g202 #g203 #g204 #g205 #g206 #g207 #g208 #g209 #g21 #g210 #g211 #g212 #g213 #g214 #g215 #g216 #g217 #g218 #g219 #g22 #g220 #g221 #g222 #g223 #g224 #g225 #g226 #g227 #g228 #g229 #g23 #g230 #g231 #g232 #g233 #g234 #g235 #g236 #g237 #g238 #g239 #g24 #g240 #g241 #g242 #g243 #g244 #g245 #g246 #g247 #g248 #g249 #g25 #g250 #g251 #g252 #g253 #g254 #g255 #g256 #g257 #g258 #g259 #g26 #g260 #g261 #g262 #g263 #g264 #g265 #g266 #g267 #g268 #g269 #g27 #g270 #g271 #g272 #g273 #g274 #g275 #g276 #g277 #g278 #g279 #g28 #g280 #g281 #g282 #g283 #g284 #g285 #g286 #g287 #g288 #g289 #g29 #g290 #g291 #g292 #g293 #g294 #g295 #g296 #g297 #g298 #g299 #g3 #g30 #g300 #g301 #g302 #g303 #g304 #g305 #g306 #g307 #g308 #g309 #g31 #g310 #g311 #g312 #g313 #g314 #g315 #g316 #g317 #g318 #g319 #g32 #g320 #g321 #g322 #g323 #g324 #g325 #g326 #g327 #g328 #g329 #g33 #g330 #g331 #g332 #g333 #g334 #g335 #g34 #g35 #g36 #g37 #g38 #g39 #g4 #g40 #g41 #g42 #g43 #g44 #g45 #g46 #g47 #g48 #g49 #g5 #g50 #g51 #g52 #g53 #g54 #g55 #g56 #g57 #g58 #g59 #g6 #g60 #g61 #g62 #g63 #g64 #g65 #g66 #g67 #g68 #g69 #g7 #g70 #g71 #g72 #g73 #g74 #g75 #g76 #g77 #g78 #g79 #g8 #g80 #g81 #g82 #g83 #g84 #g85 #g86 #g87 #g88 #g89 #g9 #g90 #g91 #g92 #g93 #g94 #g95 #g96 #g97 #g98 #g99 - grasp
          #t0 #t1 #t10 #t100 #t101 #t102 #t103 #t104 #t105 #t106 #t107 #t108 #t109 #t11 #t110 #t111 #t112 #t113 #t114 #t115 #t116 #t117 #t118 #t119 #t12 #t120 #t121 #t122 #t123 #t124 #t125 #t126 #t127 #t128 #t129 #t13 #t130 #t131 #t132 #t133 #t134 #t135 #t136 #t137 #t138 #t139 #t14 #t140 #t141 #t142 #t143 #t144 #t145 #t146 #t147 #t148 #t149 #t15 #t150 #t151 #t152 #t153 #t154 #t155 #t156 #t157 #t158 #t159 #t16 #t160 #t161 #t162 #t163 #t164 #t165 #t166 #t167 #t168 #t169 #t17 #t170 #t171 #t172 #t173 #t174 #t175 #t176 #t177 #t178 #t179 #t18 #t180 #t181 #t182 #t183 #t184 #t185 #t186 #t187 #t188 #t189 #t19 #t190 #t191 #t192 #t193 #t194 #t195 #t196 #t197 #t198 #t199 #t2 #t20 #t200 #t201 #t202 #t203 #t204 #t205 #t206 #t207 #t208 #t209 #t21 #t210 #t211 #t212 #t213 #t214 #t215 #t216 #t217 #t218 #t219 #t22 #t220 #t221 #t222 #t223 #t224 #t225 #t226 #t227 #t228 #t229 #t23 #t230 #t231 #t232 #t233 #t234 #t235 #t236 #t237 #t238 #t239 #t24 #t240 #t241 #t242 #t243 #t244 #t245 #t246 #t247 #t248 #t249 #t25 #t250 #t251 #t252 #t253 #t254 #t255 #t256 #t257 #t258 #t259 #t26 #t260 #t261 #t262 #t263 #t264 #t265 #t266 #t267 #t268 #t269 #t27 #t270 #t271 #t272 #t273 #t274 #t275 #t276 #t277 #t278 #t279 #t28 #t280 #t281 #t282 #t283 #t284 #t285 #t286 #t287 #t288 #t289 #t29 #t290 #t291 #t292 #t293 #t294 #t295 #t296 #t297 #t298 #t299 #t3 #t30 #t300 #t301 #t302 #t303 #t304 #t305 #t306 #t307 #t308 #t309 #t31 #t310 #t311 #t312 #t313 #t314 #t315 #t316 #t317 #t318 #t319 #t32 #t320 #t321 #t322 #t323 #t324 #t325 #t326 #t327 #t328 #t329 #t33 #t330 #t331 #t332 #t333 #t334 #t335 #t336 #t337 #t338 #t339 #t34 #t340 #t341 #t342 #t343 #t344 #t345 #t346 #t347 #t348 #t349 #t35 #t350 #t351 #t352 #t353 #t354 #t355 #t356 #t357 #t358 #t359 #t36 #t360 #t361 #t362 #t363 #t364 #t365 #t366 #t367 #t368 #t369 #t37 #t370 #t371 #t372 #t373 #t374 #t375 #t376 #t377 #t378 #t379 #t38 #t380 #t381 #t382 #t383 #t384 #t385 #t386 #t387 #t388 #t389 #t39 #t390 #t391 #t392 #t393 #t394 #t395 #t396 #t397 #t398 #t399 #t4 #t40 #t400 #t401 #t402 #t403 #t404 #t405 #t406 #t407 #t408 #t409 #t41 #t410 #t411 #t412 #t413 #t414 #t415 #t416 #t417 #t418 #t419 #t42 #t420 #t421 #t422 #t423 #t424 #t425 #t426 #t427 #t428 #t429 #t43 #t430 #t431 #t432 #t433 #t434 #t435 #t436 #t437 #t438 #t439 #t44 #t440 #t441 #t442 #t443 #t444 #t445 #t446 #t447 #t448 #t449 #t45 #t450 #t451 #t452 #t453 #t454 #t455 #t456 #t457 #t458 #t459 #t46 #t460 #t461 #t462 #t463 #t464 #t465 #t466 #t467 #t468 #t469 #t47 #t470 #t471 #t472 #t473 #t474 #t475 #t476 #t477 #t478 #t479 #t48 #t480 #t481 #t482 #t483 #t484 #t485 #t486 #t487 #t488 #t489 #t49 #t490 #t491 #t492 #t493 #t494 #t495 #t496 #t497 #t498 #t499 #t5 #t50 #t500 #t501 #t502 #t503 #t504 #t505 #t506 #t507 #t508 #t509 #t51 #t510 #t511 #t512 #t513 #t514 #t515 #t516 #t517 #t518 #t519 #t52 #t520 #t521 #t522 #t523 #t524 #t525 #t526 #t527 #t528 #t529 #t53 #t530 #t531 #t532 #t533 #t534 #t535 #t536 #t537 #t538 #t539 #t54 #t540 #t541 #t542 #t543 #t544 #t545 #t546 #t547 #t548 #t549 #t55 #t550 #t551 #t552 #t553 #t554 #t555 #t556 #t557 #t558 #t559 #t56 #t560 #t561 #t562 #t563 #t564 #t565 #t566 #t567 #t568 #t569 #t57 #t570 #t571 #t572 #t573 #t574 #t575 #t576 #t577 #t578 #t579 #t58 #t580 #t581 #t582 #t583 #t584 #t585 #t586 #t587 #t588 #t589 #t59 #t590 #t591 #t592 #t593 #t594 #t595 #t596 #t597 #t598 #t599 #t6 #t60 #t600 #t601 #t602 #t603 #t604 #t605 #t606 #t607 #t608 #t609 #t61 #t610 #t611 #t612 #t613 #t614 #t615 #t616 #t617 #t618 #t619 #t62 #t620 #t621 #t622 #t623 #t624 #t625 #t626 #t627 #t628 #t629 #t63 #t630 #t631 #t632 #t633 #t634 #t635 #t636 #t637 #t638 #t639 #t64 #t640 #t641 #t642 #t643 #t644 #t645 #t646 #t647 #t648 #t649 #t65 #t650 #t651 #t652 #t653 #t654 #t655 #t656 #t657 #t658 #t659 #t66 #t660 #t661 #t662 #t663 #t664 #t665 #t666 #t667 #t668 #t669 #t67 #t670 #t671 #t68 #t69 #t7 #t70 #t71 #t72 #t73 #t74 #t75 #t76 #t77 #t78 #t79 #t8 #t80 #t81 #t82 #t83 #t84 #t85 #t86 #t87 #t88 #t89 #t9 #t90 #t91 #t92 #t93 #t94 #t95 #t96 #t97 #t98 #t99 - trajectory
   )

   (:predicates
          (ispose ?o - wuti ?p - pose)
          (isgrasp ?o - wuti ?p1 - pose ?p2 - pose ?g - grasp ?a - arm)
          (isarm ?a - arm ?o - wuti ?p1 - pose ?p2 - pose)
          (kinfrom ?o - wuti ?p - pose ?g - grasp ?a - arm ?t - trajectory)
          (kinto ?o - wuti ?p - pose ?g - grasp ?a - arm ?t - trajectory)
          (on ?o - wuti ?r - wuti)
          (graspable ?o - wuti)
          (atgrasp ?o - wuti ?g - grasp ?a - arm)
          (atpose ?o - wuti ?p - pose)
          (canpick)
          (smaller ?o - wuti ?r - wuti)
          (clear ?r - wuti)
          (issupport ?o - wuti ?p - pose ?r - wuti ?rp - pose)
          (_applicable ?_p - propo_action)
   )


   (:action a0_pick
          :parameters (#a5 o7 p312 #g5 o8 #t8)
          :precondition (and (atpose o7 p312) (kinfrom o7 p312 #g5 #a5 #t8) (on o7 o8) (clear o7) (canpick) (graspable o7) (_applicable _p0))
          :effect (and (increase (total-cost) 100) (not (on o7 o8)) (clear o8) (not (canpick)) (atgrasp o7 #g5 #a5) (not (atpose o7 p312)) (not (_applicable _p0)) (_applicable _p1))
   )
   (:action a1_place
          :parameters (#a5 o7 #p2 #g5 o6 p256 #t82)
          :precondition (and (kinto o7 #p2 #g5 #a5 #t82) (smaller o7 o6) (clear o6) (atgrasp o7 #g5 #a5) (atpose o6 p256) (issupport o7 #p2 o6 p256) (_applicable _p1))
          :effect (and (increase (total-cost) 100) (on o7 o6) (not (clear o6)) (canpick) (not (atgrasp o7 #g5 #a5)) (atpose o7 #p2) (not (_applicable _p1)) (_applicable _p2))
   )
   (:action a2_pick
          :parameters (#a39 o8 p368 #g39 o9 #t42)
          :precondition (and (atpose o8 p368) (kinfrom o8 p368 #g39 #a39 #t42) (on o8 o9) (clear o8) (canpick) (graspable o8) (_applicable _p2))
          :effect (and (increase (total-cost) 100) (not (on o8 o9)) (clear o9) (not (canpick)) (atgrasp o8 #g39 #a39) (not (atpose o8 p368)) (not (_applicable _p2)) (_applicable _p3))
   )
   (:action a3_place
          :parameters (#a39 o8 #p4 #g39 o5 p200 #t116)
          :precondition (and (kinto o8 #p4 #g39 #a39 #t116) (smaller o8 o5) (clear o5) (atgrasp o8 #g39 #a39) (atpose o5 p200) (issupport o8 #p4 o5 p200) (_applicable _p3))
          :effect (and (increase (total-cost) 100) (on o8 o5) (not (clear o5)) (canpick) (not (atgrasp o8 #g39 #a39)) (atpose o8 #p4) (not (_applicable _p3)) (_applicable _p4))
   )
   (:action a4_pick
          :parameters (#a99 o7 #p2 #g99 o6 #t176)
          :precondition (and (atpose o7 #p2) (kinfrom o7 #p2 #g99 #a99 #t176) (on o7 o6) (clear o7) (canpick) (graspable o7) (_applicable _p4))
          :effect (and (increase (total-cost) 100) (not (on o7 o6)) (clear o6) (not (canpick)) (atgrasp o7 #g99 #a99) (not (atpose o7 #p2)) (not (_applicable _p4)) (_applicable _p5))
   )
   (:action a5_place
          :parameters (#a99 o7 #p13 #g99 o8 #p4 #t348)
          :precondition (and (kinto o7 #p13 #g99 #a99 #t348) (smaller o7 o8) (clear o8) (atgrasp o7 #g99 #a99) (atpose o8 #p4) (issupport o7 #p13 o8 #p4) (_applicable _p5))
          :effect (and (increase (total-cost) 100) (on o7 o8) (not (clear o8)) (canpick) (not (atgrasp o7 #g99 #a99)) (atpose o7 #p13) (not (_applicable _p5)) (_applicable _p6))
   )
   (:action a6_pick
          :parameters (#a64 o9 p424 #g64 o4 #t67)
          :precondition (and (atpose o9 p424) (kinfrom o9 p424 #g64 #a64 #t67) (on o9 o4) (clear o9) (canpick) (graspable o9) (_applicable _p6))
          :effect (and (increase (total-cost) 100) (not (on o9 o4)) (clear o4) (not (canpick)) (atgrasp o9 #g64 #a64) (not (atpose o9 p424)) (not (_applicable _p6)) (_applicable _p7))
   )
   (:action a7_place
          :parameters (#a64 o9 #p8 #g64 o6 p256 #t141)
          :precondition (and (kinto o9 #p8 #g64 #a64 #t141) (smaller o9 o6) (clear o6) (atgrasp o9 #g64 #a64) (atpose o6 p256) (issupport o9 #p8 o6 p256) (_applicable _p7))
          :effect (and (increase (total-cost) 100) (on o9 o6) (not (clear o6)) (canpick) (not (atgrasp o9 #g64 #a64)) (atpose o9 #p8) (not (_applicable _p7)) (_applicable _p8))
   )
   (:action a8_pick
          :parameters (#a133 o7 #p13 #g133 o8 #t210)
          :precondition (and (atpose o7 #p13) (kinfrom o7 #p13 #g133 #a133 #t210) (on o7 o8) (clear o7) (canpick) (graspable o7) (_applicable _p8))
          :effect (and (increase (total-cost) 100) (not (on o7 o8)) (clear o8) (not (canpick)) (atgrasp o7 #g133 #a133) (not (atpose o7 #p13)) (not (_applicable _p8)) (_applicable _p9))
   )
   (:action a9_place
          :parameters (#a133 o7 #p0 #g133 o4 p432 #t382)
          :precondition (and (kinto o7 #p0 #g133 #a133 #t382) (smaller o7 o4) (clear o4) (atgrasp o7 #g133 #a133) (atpose o4 p432) (issupport o7 #p0 o4 p432) (_applicable _p9))
          :effect (and (increase (total-cost) 100) (on o7 o4) (not (clear o4)) (canpick) (not (atgrasp o7 #g133 #a133)) (atpose o7 #p0) (not (_applicable _p9)) (_applicable _p10))
   )
   (:action a10_pick
          :parameters (#a218 o8 #p4 #g218 o5 #t295)
          :precondition (and (atpose o8 #p4) (kinfrom o8 #p4 #g218 #a218 #t295) (on o8 o5) (clear o8) (canpick) (graspable o8) (_applicable _p10))
          :effect (and (increase (total-cost) 100) (not (on o8 o5)) (clear o5) (not (canpick)) (atgrasp o8 #g218 #a218) (not (atpose o8 #p4)) (not (_applicable _p10)) (_applicable _p11))
   )
   (:action a11_place
          :parameters (#a218 o8 #p21 #g218 o9 #p8 #t467)
          :precondition (and (kinto o8 #p21 #g218 #a218 #t467) (smaller o8 o9) (clear o9) (atgrasp o8 #g218 #a218) (atpose o9 #p8) (issupport o8 #p21 o9 #p8) (_applicable _p11))
          :effect (and (increase (total-cost) 100) (on o8 o9) (not (clear o9)) (canpick) (not (atgrasp o8 #g218 #a218)) (atpose o8 #p21) (not (_applicable _p11)) (_applicable _p12))
   )
   (:action a12_pick
          :parameters (#a254 o7 #p0 #g254 o4 #t503)
          :precondition (and (atpose o7 #p0) (kinfrom o7 #p0 #g254 #a254 #t503) (on o7 o4) (clear o7) (canpick) (graspable o7) (_applicable _p12))
          :effect (and (increase (total-cost) 100) (not (on o7 o4)) (clear o4) (not (canpick)) (atgrasp o7 #g254 #a254) (not (atpose o7 #p0)) (not (_applicable _p12)) (_applicable _p13))
   )
   (:action a13_place
          :parameters (#a254 o7 #p24 #g254 o8 #p21 #t590)
          :precondition (and (kinto o7 #p24 #g254 #a254 #t590) (smaller o7 o8) (clear o8) (atgrasp o7 #g254 #a254) (atpose o8 #p21) (issupport o7 #p24 o8 #p21) (_applicable _p13))
          :effect (and (increase (total-cost) 100) (on o7 o8) (not (clear o8)) (canpick) (not (atgrasp o7 #g254 #a254)) (atpose o7 #p24) (not (_applicable _p13)) (_applicable _p14))
   )
   (:action s0_sample-place
          :parameters (o7 o4 p432)
          :precondition (and (smaller o7 o4) (graspable o7) (ispose o4 p432))
          :effect (and (ispose o7 #p0) (issupport o7 #p0 o4 p432))
   )
   (:action s1_sample-place
          :parameters (o7 o5 p200)
          :precondition (and (smaller o7 o5) (graspable o7) (ispose o5 p200))
          :effect (and (ispose o7 #p1) (issupport o7 #p1 o5 p200))
   )
   (:action s2_sample-place
          :parameters (o7 o6 p256)
          :precondition (and (smaller o7 o6) (graspable o7) (ispose o6 p256))
          :effect (and (ispose o7 #p2) (issupport o7 #p2 o6 p256))
   )
   (:action s3_sample-place
          :parameters (o8 o4 p432)
          :precondition (and (smaller o8 o4) (graspable o8) (ispose o4 p432))
          :effect (and (ispose o8 #p3) (issupport o8 #p3 o4 p432))
   )
   (:action s4_sample-place
          :parameters (o8 o5 p200)
          :precondition (and (smaller o8 o5) (graspable o8) (ispose o5 p200))
          :effect (and (ispose o8 #p4) (issupport o8 #p4 o5 p200))
   )
   (:action s5_sample-place
          :parameters (o8 o6 p256)
          :precondition (and (smaller o8 o6) (graspable o8) (ispose o6 p256))
          :effect (and (ispose o8 #p5) (issupport o8 #p5 o6 p256))
   )
   (:action s6_sample-place
          :parameters (o9 o4 p432)
          :precondition (and (smaller o9 o4) (graspable o9) (ispose o4 p432))
          :effect (and (ispose o9 #p6) (issupport o9 #p6 o4 p432))
   )
   (:action s7_sample-place
          :parameters (o9 o5 p200)
          :precondition (and (smaller o9 o5) (graspable o9) (ispose o5 p200))
          :effect (and (ispose o9 #p7) (issupport o9 #p7 o5 p200))
   )
   (:action s8_sample-place
          :parameters (o9 o6 p256)
          :precondition (and (smaller o9 o6) (graspable o9) (ispose o6 p256))
          :effect (and (ispose o9 #p8) (issupport o9 #p8 o6 p256))
   )
   (:action s9_sample-place
          :parameters (o7 o8 p368)
          :precondition (and (smaller o7 o8) (graspable o7) (ispose o8 p368))
          :effect (and (ispose o7 #p9) (issupport o7 #p9 o8 p368))
   )
   (:action s10_sample-place
          :parameters (o7 o9 p424)
          :precondition (and (smaller o7 o9) (graspable o7) (ispose o9 p424))
          :effect (and (ispose o7 #p10) (issupport o7 #p10 o9 p424))
   )
   (:action s11_sample-place
          :parameters (o8 o9 p424)
          :precondition (and (smaller o8 o9) (graspable o8) (ispose o9 p424))
          :effect (and (ispose o8 #p11) (issupport o8 #p11 o9 p424))
   )
   (:action s12_sample-arm
          :parameters (o7 p312 p312)
          :precondition (and (graspable o7) (ispose o7 p312) (ispose o7 p312))
          :effect (and (isarm #a0 o7 p312 p312))
   )
   (:action s13_sample-arm
          :parameters (o8 p368 p368)
          :precondition (and (graspable o8) (ispose o8 p368) (ispose o8 p368))
          :effect (and (isarm #a1 o8 p368 p368))
   )
   (:action s14_sample-arm
          :parameters (o9 p424 p424)
          :precondition (and (graspable o9) (ispose o9 p424) (ispose o9 p424))
          :effect (and (isarm #a2 o9 p424 p424))
   )
   (:action s15_sample-place
          :parameters (o7 o8 #p3)
          :precondition (and (smaller o7 o8) (graspable o7) (ispose o8 #p3))
          :effect (and (ispose o7 #p12) (issupport o7 #p12 o8 #p3))
   )
   (:action s16_sample-place
          :parameters (o7 o8 #p4)
          :precondition (and (smaller o7 o8) (graspable o7) (ispose o8 #p4))
          :effect (and (ispose o7 #p13) (issupport o7 #p13 o8 #p4))
   )
   (:action s17_sample-place
          :parameters (o7 o8 #p5)
          :precondition (and (smaller o7 o8) (graspable o7) (ispose o8 #p5))
          :effect (and (ispose o7 #p14) (issupport o7 #p14 o8 #p5))
   )
   (:action s18_sample-place
          :parameters (o7 o8 #p11)
          :precondition (and (smaller o7 o8) (graspable o7) (ispose o8 #p11))
          :effect (and (ispose o7 #p15) (issupport o7 #p15 o8 #p11))
   )
   (:action s19_sample-place
          :parameters (o7 o9 #p6)
          :precondition (and (smaller o7 o9) (graspable o7) (ispose o9 #p6))
          :effect (and (ispose o7 #p16) (issupport o7 #p16 o9 #p6))
   )
   (:action s20_sample-place
          :parameters (o7 o9 #p7)
          :precondition (and (smaller o7 o9) (graspable o7) (ispose o9 #p7))
          :effect (and (ispose o7 #p17) (issupport o7 #p17 o9 #p7))
   )
   (:action s21_sample-place
          :parameters (o7 o9 #p8)
          :precondition (and (smaller o7 o9) (graspable o7) (ispose o9 #p8))
          :effect (and (ispose o7 #p18) (issupport o7 #p18 o9 #p8))
   )
   (:action s22_sample-place
          :parameters (o8 o9 #p6)
          :precondition (and (smaller o8 o9) (graspable o8) (ispose o9 #p6))
          :effect (and (ispose o8 #p19) (issupport o8 #p19 o9 #p6))
   )
   (:action s23_sample-place
          :parameters (o8 o9 #p7)
          :precondition (and (smaller o8 o9) (graspable o8) (ispose o9 #p7))
          :effect (and (ispose o8 #p20) (issupport o8 #p20 o9 #p7))
   )
   (:action s24_sample-place
          :parameters (o8 o9 #p8)
          :precondition (and (smaller o8 o9) (graspable o8) (ispose o9 #p8))
          :effect (and (ispose o8 #p21) (issupport o8 #p21 o9 #p8))
   )
   (:action s25_sample-arm
          :parameters (o7 p312 #p0)
          :precondition (and (graspable o7) (ispose o7 p312) (ispose o7 #p0))
          :effect (and (isarm #a3 o7 p312 #p0))
   )
   (:action s26_sample-arm
          :parameters (o7 p312 #p1)
          :precondition (and (graspable o7) (ispose o7 p312) (ispose o7 #p1))
          :effect (and (isarm #a4 o7 p312 #p1))
   )
   (:action s27_sample-arm
          :parameters (o7 p312 #p2)
          :precondition (and (graspable o7) (ispose o7 p312) (ispose o7 #p2))
          :effect (and (isarm #a5 o7 p312 #p2))
   )
   (:action s28_sample-arm
          :parameters (o7 p312 #p9)
          :precondition (and (graspable o7) (ispose o7 p312) (ispose o7 #p9))
          :effect (and (isarm #a6 o7 p312 #p9))
   )
   (:action s29_sample-arm
          :parameters (o7 p312 #p10)
          :precondition (and (graspable o7) (ispose o7 p312) (ispose o7 #p10))
          :effect (and (isarm #a7 o7 p312 #p10))
   )
   (:action s30_sample-arm
          :parameters (o7 #p0 p312)
          :precondition (and (graspable o7) (ispose o7 #p0) (ispose o7 p312))
          :effect (and (isarm #a8 o7 #p0 p312))
   )
   (:action s31_sample-arm
          :parameters (o7 #p0 #p0)
          :precondition (and (graspable o7) (ispose o7 #p0) (ispose o7 #p0))
          :effect (and (isarm #a9 o7 #p0 #p0))
   )
   (:action s32_sample-arm
          :parameters (o7 #p0 #p1)
          :precondition (and (graspable o7) (ispose o7 #p0) (ispose o7 #p1))
          :effect (and (isarm #a10 o7 #p0 #p1))
   )
   (:action s33_sample-arm
          :parameters (o7 #p0 #p2)
          :precondition (and (graspable o7) (ispose o7 #p0) (ispose o7 #p2))
          :effect (and (isarm #a11 o7 #p0 #p2))
   )
   (:action s34_sample-arm
          :parameters (o7 #p0 #p9)
          :precondition (and (graspable o7) (ispose o7 #p0) (ispose o7 #p9))
          :effect (and (isarm #a12 o7 #p0 #p9))
   )
   (:action s35_sample-arm
          :parameters (o7 #p0 #p10)
          :precondition (and (graspable o7) (ispose o7 #p0) (ispose o7 #p10))
          :effect (and (isarm #a13 o7 #p0 #p10))
   )
   (:action s36_sample-arm
          :parameters (o7 #p1 p312)
          :precondition (and (graspable o7) (ispose o7 #p1) (ispose o7 p312))
          :effect (and (isarm #a14 o7 #p1 p312))
   )
   (:action s37_sample-arm
          :parameters (o7 #p1 #p0)
          :precondition (and (graspable o7) (ispose o7 #p1) (ispose o7 #p0))
          :effect (and (isarm #a15 o7 #p1 #p0))
   )
   (:action s38_sample-arm
          :parameters (o7 #p1 #p1)
          :precondition (and (graspable o7) (ispose o7 #p1) (ispose o7 #p1))
          :effect (and (isarm #a16 o7 #p1 #p1))
   )
   (:action s39_sample-arm
          :parameters (o7 #p1 #p2)
          :precondition (and (graspable o7) (ispose o7 #p1) (ispose o7 #p2))
          :effect (and (isarm #a17 o7 #p1 #p2))
   )
   (:action s40_sample-arm
          :parameters (o7 #p1 #p9)
          :precondition (and (graspable o7) (ispose o7 #p1) (ispose o7 #p9))
          :effect (and (isarm #a18 o7 #p1 #p9))
   )
   (:action s41_sample-arm
          :parameters (o7 #p1 #p10)
          :precondition (and (graspable o7) (ispose o7 #p1) (ispose o7 #p10))
          :effect (and (isarm #a19 o7 #p1 #p10))
   )
   (:action s42_sample-arm
          :parameters (o7 #p2 p312)
          :precondition (and (graspable o7) (ispose o7 #p2) (ispose o7 p312))
          :effect (and (isarm #a20 o7 #p2 p312))
   )
   (:action s43_sample-arm
          :parameters (o7 #p2 #p0)
          :precondition (and (graspable o7) (ispose o7 #p2) (ispose o7 #p0))
          :effect (and (isarm #a21 o7 #p2 #p0))
   )
   (:action s44_sample-arm
          :parameters (o7 #p2 #p1)
          :precondition (and (graspable o7) (ispose o7 #p2) (ispose o7 #p1))
          :effect (and (isarm #a22 o7 #p2 #p1))
   )
   (:action s45_sample-arm
          :parameters (o7 #p2 #p2)
          :precondition (and (graspable o7) (ispose o7 #p2) (ispose o7 #p2))
          :effect (and (isarm #a23 o7 #p2 #p2))
   )
   (:action s46_sample-arm
          :parameters (o7 #p2 #p9)
          :precondition (and (graspable o7) (ispose o7 #p2) (ispose o7 #p9))
          :effect (and (isarm #a24 o7 #p2 #p9))
   )
   (:action s47_sample-arm
          :parameters (o7 #p2 #p10)
          :precondition (and (graspable o7) (ispose o7 #p2) (ispose o7 #p10))
          :effect (and (isarm #a25 o7 #p2 #p10))
   )
   (:action s48_sample-arm
          :parameters (o7 #p9 p312)
          :precondition (and (graspable o7) (ispose o7 #p9) (ispose o7 p312))
          :effect (and (isarm #a26 o7 #p9 p312))
   )
   (:action s49_sample-arm
          :parameters (o7 #p9 #p0)
          :precondition (and (graspable o7) (ispose o7 #p9) (ispose o7 #p0))
          :effect (and (isarm #a27 o7 #p9 #p0))
   )
   (:action s50_sample-arm
          :parameters (o7 #p9 #p1)
          :precondition (and (graspable o7) (ispose o7 #p9) (ispose o7 #p1))
          :effect (and (isarm #a28 o7 #p9 #p1))
   )
   (:action s51_sample-arm
          :parameters (o7 #p9 #p2)
          :precondition (and (graspable o7) (ispose o7 #p9) (ispose o7 #p2))
          :effect (and (isarm #a29 o7 #p9 #p2))
   )
   (:action s52_sample-arm
          :parameters (o7 #p9 #p9)
          :precondition (and (graspable o7) (ispose o7 #p9) (ispose o7 #p9))
          :effect (and (isarm #a30 o7 #p9 #p9))
   )
   (:action s53_sample-arm
          :parameters (o7 #p9 #p10)
          :precondition (and (graspable o7) (ispose o7 #p9) (ispose o7 #p10))
          :effect (and (isarm #a31 o7 #p9 #p10))
   )
   (:action s54_sample-arm
          :parameters (o7 #p10 p312)
          :precondition (and (graspable o7) (ispose o7 #p10) (ispose o7 p312))
          :effect (and (isarm #a32 o7 #p10 p312))
   )
   (:action s55_sample-arm
          :parameters (o7 #p10 #p0)
          :precondition (and (graspable o7) (ispose o7 #p10) (ispose o7 #p0))
          :effect (and (isarm #a33 o7 #p10 #p0))
   )
   (:action s56_sample-arm
          :parameters (o7 #p10 #p1)
          :precondition (and (graspable o7) (ispose o7 #p10) (ispose o7 #p1))
          :effect (and (isarm #a34 o7 #p10 #p1))
   )
   (:action s57_sample-arm
          :parameters (o7 #p10 #p2)
          :precondition (and (graspable o7) (ispose o7 #p10) (ispose o7 #p2))
          :effect (and (isarm #a35 o7 #p10 #p2))
   )
   (:action s58_sample-arm
          :parameters (o7 #p10 #p9)
          :precondition (and (graspable o7) (ispose o7 #p10) (ispose o7 #p9))
          :effect (and (isarm #a36 o7 #p10 #p9))
   )
   (:action s59_sample-arm
          :parameters (o7 #p10 #p10)
          :precondition (and (graspable o7) (ispose o7 #p10) (ispose o7 #p10))
          :effect (and (isarm #a37 o7 #p10 #p10))
   )
   (:action s60_sample-arm
          :parameters (o8 p368 #p3)
          :precondition (and (graspable o8) (ispose o8 p368) (ispose o8 #p3))
          :effect (and (isarm #a38 o8 p368 #p3))
   )
   (:action s61_sample-arm
          :parameters (o8 p368 #p4)
          :precondition (and (graspable o8) (ispose o8 p368) (ispose o8 #p4))
          :effect (and (isarm #a39 o8 p368 #p4))
   )
   (:action s62_sample-arm
          :parameters (o8 p368 #p5)
          :precondition (and (graspable o8) (ispose o8 p368) (ispose o8 #p5))
          :effect (and (isarm #a40 o8 p368 #p5))
   )
   (:action s63_sample-arm
          :parameters (o8 p368 #p11)
          :precondition (and (graspable o8) (ispose o8 p368) (ispose o8 #p11))
          :effect (and (isarm #a41 o8 p368 #p11))
   )
   (:action s64_sample-arm
          :parameters (o8 #p3 p368)
          :precondition (and (graspable o8) (ispose o8 #p3) (ispose o8 p368))
          :effect (and (isarm #a42 o8 #p3 p368))
   )
   (:action s65_sample-arm
          :parameters (o8 #p3 #p3)
          :precondition (and (graspable o8) (ispose o8 #p3) (ispose o8 #p3))
          :effect (and (isarm #a43 o8 #p3 #p3))
   )
   (:action s66_sample-arm
          :parameters (o8 #p3 #p4)
          :precondition (and (graspable o8) (ispose o8 #p3) (ispose o8 #p4))
          :effect (and (isarm #a44 o8 #p3 #p4))
   )
   (:action s67_sample-arm
          :parameters (o8 #p3 #p5)
          :precondition (and (graspable o8) (ispose o8 #p3) (ispose o8 #p5))
          :effect (and (isarm #a45 o8 #p3 #p5))
   )
   (:action s68_sample-arm
          :parameters (o8 #p3 #p11)
          :precondition (and (graspable o8) (ispose o8 #p3) (ispose o8 #p11))
          :effect (and (isarm #a46 o8 #p3 #p11))
   )
   (:action s69_sample-arm
          :parameters (o8 #p4 p368)
          :precondition (and (graspable o8) (ispose o8 #p4) (ispose o8 p368))
          :effect (and (isarm #a47 o8 #p4 p368))
   )
   (:action s70_sample-arm
          :parameters (o8 #p4 #p3)
          :precondition (and (graspable o8) (ispose o8 #p4) (ispose o8 #p3))
          :effect (and (isarm #a48 o8 #p4 #p3))
   )
   (:action s71_sample-arm
          :parameters (o8 #p4 #p4)
          :precondition (and (graspable o8) (ispose o8 #p4) (ispose o8 #p4))
          :effect (and (isarm #a49 o8 #p4 #p4))
   )
   (:action s72_sample-arm
          :parameters (o8 #p4 #p5)
          :precondition (and (graspable o8) (ispose o8 #p4) (ispose o8 #p5))
          :effect (and (isarm #a50 o8 #p4 #p5))
   )
   (:action s73_sample-arm
          :parameters (o8 #p4 #p11)
          :precondition (and (graspable o8) (ispose o8 #p4) (ispose o8 #p11))
          :effect (and (isarm #a51 o8 #p4 #p11))
   )
   (:action s74_sample-arm
          :parameters (o8 #p5 p368)
          :precondition (and (graspable o8) (ispose o8 #p5) (ispose o8 p368))
          :effect (and (isarm #a52 o8 #p5 p368))
   )
   (:action s75_sample-arm
          :parameters (o8 #p5 #p3)
          :precondition (and (graspable o8) (ispose o8 #p5) (ispose o8 #p3))
          :effect (and (isarm #a53 o8 #p5 #p3))
   )
   (:action s76_sample-arm
          :parameters (o8 #p5 #p4)
          :precondition (and (graspable o8) (ispose o8 #p5) (ispose o8 #p4))
          :effect (and (isarm #a54 o8 #p5 #p4))
   )
   (:action s77_sample-arm
          :parameters (o8 #p5 #p5)
          :precondition (and (graspable o8) (ispose o8 #p5) (ispose o8 #p5))
          :effect (and (isarm #a55 o8 #p5 #p5))
   )
   (:action s78_sample-arm
          :parameters (o8 #p5 #p11)
          :precondition (and (graspable o8) (ispose o8 #p5) (ispose o8 #p11))
          :effect (and (isarm #a56 o8 #p5 #p11))
   )
   (:action s79_sample-arm
          :parameters (o8 #p11 p368)
          :precondition (and (graspable o8) (ispose o8 #p11) (ispose o8 p368))
          :effect (and (isarm #a57 o8 #p11 p368))
   )
   (:action s80_sample-arm
          :parameters (o8 #p11 #p3)
          :precondition (and (graspable o8) (ispose o8 #p11) (ispose o8 #p3))
          :effect (and (isarm #a58 o8 #p11 #p3))
   )
   (:action s81_sample-arm
          :parameters (o8 #p11 #p4)
          :precondition (and (graspable o8) (ispose o8 #p11) (ispose o8 #p4))
          :effect (and (isarm #a59 o8 #p11 #p4))
   )
   (:action s82_sample-arm
          :parameters (o8 #p11 #p5)
          :precondition (and (graspable o8) (ispose o8 #p11) (ispose o8 #p5))
          :effect (and (isarm #a60 o8 #p11 #p5))
   )
   (:action s83_sample-arm
          :parameters (o8 #p11 #p11)
          :precondition (and (graspable o8) (ispose o8 #p11) (ispose o8 #p11))
          :effect (and (isarm #a61 o8 #p11 #p11))
   )
   (:action s84_sample-arm
          :parameters (o9 p424 #p6)
          :precondition (and (graspable o9) (ispose o9 p424) (ispose o9 #p6))
          :effect (and (isarm #a62 o9 p424 #p6))
   )
   (:action s85_sample-arm
          :parameters (o9 p424 #p7)
          :precondition (and (graspable o9) (ispose o9 p424) (ispose o9 #p7))
          :effect (and (isarm #a63 o9 p424 #p7))
   )
   (:action s86_sample-arm
          :parameters (o9 p424 #p8)
          :precondition (and (graspable o9) (ispose o9 p424) (ispose o9 #p8))
          :effect (and (isarm #a64 o9 p424 #p8))
   )
   (:action s87_sample-arm
          :parameters (o9 #p6 p424)
          :precondition (and (graspable o9) (ispose o9 #p6) (ispose o9 p424))
          :effect (and (isarm #a65 o9 #p6 p424))
   )
   (:action s88_sample-arm
          :parameters (o9 #p6 #p6)
          :precondition (and (graspable o9) (ispose o9 #p6) (ispose o9 #p6))
          :effect (and (isarm #a66 o9 #p6 #p6))
   )
   (:action s89_sample-arm
          :parameters (o9 #p6 #p7)
          :precondition (and (graspable o9) (ispose o9 #p6) (ispose o9 #p7))
          :effect (and (isarm #a67 o9 #p6 #p7))
   )
   (:action s90_sample-arm
          :parameters (o9 #p6 #p8)
          :precondition (and (graspable o9) (ispose o9 #p6) (ispose o9 #p8))
          :effect (and (isarm #a68 o9 #p6 #p8))
   )
   (:action s91_sample-arm
          :parameters (o9 #p7 p424)
          :precondition (and (graspable o9) (ispose o9 #p7) (ispose o9 p424))
          :effect (and (isarm #a69 o9 #p7 p424))
   )
   (:action s92_sample-arm
          :parameters (o9 #p7 #p6)
          :precondition (and (graspable o9) (ispose o9 #p7) (ispose o9 #p6))
          :effect (and (isarm #a70 o9 #p7 #p6))
   )
   (:action s93_sample-arm
          :parameters (o9 #p7 #p7)
          :precondition (and (graspable o9) (ispose o9 #p7) (ispose o9 #p7))
          :effect (and (isarm #a71 o9 #p7 #p7))
   )
   (:action s94_sample-arm
          :parameters (o9 #p7 #p8)
          :precondition (and (graspable o9) (ispose o9 #p7) (ispose o9 #p8))
          :effect (and (isarm #a72 o9 #p7 #p8))
   )
   (:action s95_sample-arm
          :parameters (o9 #p8 p424)
          :precondition (and (graspable o9) (ispose o9 #p8) (ispose o9 p424))
          :effect (and (isarm #a73 o9 #p8 p424))
   )
   (:action s96_sample-arm
          :parameters (o9 #p8 #p6)
          :precondition (and (graspable o9) (ispose o9 #p8) (ispose o9 #p6))
          :effect (and (isarm #a74 o9 #p8 #p6))
   )
   (:action s97_sample-arm
          :parameters (o9 #p8 #p7)
          :precondition (and (graspable o9) (ispose o9 #p8) (ispose o9 #p7))
          :effect (and (isarm #a75 o9 #p8 #p7))
   )
   (:action s98_sample-arm
          :parameters (o9 #p8 #p8)
          :precondition (and (graspable o9) (ispose o9 #p8) (ispose o9 #p8))
          :effect (and (isarm #a76 o9 #p8 #p8))
   )
   (:action s99_sample-grasp
          :parameters (o7 p312 p312 #a0)
          :precondition (isarm #a0 o7 p312 p312)
          :effect (and (isgrasp o7 p312 p312 #g0 #a0))
   )
   (:action s100_sample-grasp
          :parameters (o8 p368 p368 #a1)
          :precondition (isarm #a1 o8 p368 p368)
          :effect (and (isgrasp o8 p368 p368 #g1 #a1))
   )
   (:action s101_sample-grasp
          :parameters (o9 p424 p424 #a2)
          :precondition (isarm #a2 o9 p424 p424)
          :effect (and (isgrasp o9 p424 p424 #g2 #a2))
   )
   (:action s102_sample-place
          :parameters (o7 o8 #p19)
          :precondition (and (smaller o7 o8) (graspable o7) (ispose o8 #p19))
          :effect (and (ispose o7 #p22) (issupport o7 #p22 o8 #p19))
   )
   (:action s103_sample-place
          :parameters (o7 o8 #p20)
          :precondition (and (smaller o7 o8) (graspable o7) (ispose o8 #p20))
          :effect (and (ispose o7 #p23) (issupport o7 #p23 o8 #p20))
   )
   (:action s104_sample-place
          :parameters (o7 o8 #p21)
          :precondition (and (smaller o7 o8) (graspable o7) (ispose o8 #p21))
          :effect (and (ispose o7 #p24) (issupport o7 #p24 o8 #p21))
   )
   (:action s105_sample-arm
          :parameters (o7 p312 #p12)
          :precondition (and (graspable o7) (ispose o7 p312) (ispose o7 #p12))
          :effect (and (isarm #a77 o7 p312 #p12))
   )
   (:action s106_sample-arm
          :parameters (o7 p312 #p13)
          :precondition (and (graspable o7) (ispose o7 p312) (ispose o7 #p13))
          :effect (and (isarm #a78 o7 p312 #p13))
   )
   (:action s107_sample-arm
          :parameters (o7 p312 #p14)
          :precondition (and (graspable o7) (ispose o7 p312) (ispose o7 #p14))
          :effect (and (isarm #a79 o7 p312 #p14))
   )
   (:action s108_sample-arm
          :parameters (o7 p312 #p15)
          :precondition (and (graspable o7) (ispose o7 p312) (ispose o7 #p15))
          :effect (and (isarm #a80 o7 p312 #p15))
   )
   (:action s109_sample-arm
          :parameters (o7 p312 #p16)
          :precondition (and (graspable o7) (ispose o7 p312) (ispose o7 #p16))
          :effect (and (isarm #a81 o7 p312 #p16))
   )
   (:action s110_sample-arm
          :parameters (o7 p312 #p17)
          :precondition (and (graspable o7) (ispose o7 p312) (ispose o7 #p17))
          :effect (and (isarm #a82 o7 p312 #p17))
   )
   (:action s111_sample-arm
          :parameters (o7 p312 #p18)
          :precondition (and (graspable o7) (ispose o7 p312) (ispose o7 #p18))
          :effect (and (isarm #a83 o7 p312 #p18))
   )
   (:action s112_sample-arm
          :parameters (o7 #p0 #p12)
          :precondition (and (graspable o7) (ispose o7 #p0) (ispose o7 #p12))
          :effect (and (isarm #a84 o7 #p0 #p12))
   )
   (:action s113_sample-arm
          :parameters (o7 #p0 #p13)
          :precondition (and (graspable o7) (ispose o7 #p0) (ispose o7 #p13))
          :effect (and (isarm #a85 o7 #p0 #p13))
   )
   (:action s114_sample-arm
          :parameters (o7 #p0 #p14)
          :precondition (and (graspable o7) (ispose o7 #p0) (ispose o7 #p14))
          :effect (and (isarm #a86 o7 #p0 #p14))
   )
   (:action s115_sample-arm
          :parameters (o7 #p0 #p15)
          :precondition (and (graspable o7) (ispose o7 #p0) (ispose o7 #p15))
          :effect (and (isarm #a87 o7 #p0 #p15))
   )
   (:action s116_sample-arm
          :parameters (o7 #p0 #p16)
          :precondition (and (graspable o7) (ispose o7 #p0) (ispose o7 #p16))
          :effect (and (isarm #a88 o7 #p0 #p16))
   )
   (:action s117_sample-arm
          :parameters (o7 #p0 #p17)
          :precondition (and (graspable o7) (ispose o7 #p0) (ispose o7 #p17))
          :effect (and (isarm #a89 o7 #p0 #p17))
   )
   (:action s118_sample-arm
          :parameters (o7 #p0 #p18)
          :precondition (and (graspable o7) (ispose o7 #p0) (ispose o7 #p18))
          :effect (and (isarm #a90 o7 #p0 #p18))
   )
   (:action s119_sample-arm
          :parameters (o7 #p1 #p12)
          :precondition (and (graspable o7) (ispose o7 #p1) (ispose o7 #p12))
          :effect (and (isarm #a91 o7 #p1 #p12))
   )
   (:action s120_sample-arm
          :parameters (o7 #p1 #p13)
          :precondition (and (graspable o7) (ispose o7 #p1) (ispose o7 #p13))
          :effect (and (isarm #a92 o7 #p1 #p13))
   )
   (:action s121_sample-arm
          :parameters (o7 #p1 #p14)
          :precondition (and (graspable o7) (ispose o7 #p1) (ispose o7 #p14))
          :effect (and (isarm #a93 o7 #p1 #p14))
   )
   (:action s122_sample-arm
          :parameters (o7 #p1 #p15)
          :precondition (and (graspable o7) (ispose o7 #p1) (ispose o7 #p15))
          :effect (and (isarm #a94 o7 #p1 #p15))
   )
   (:action s123_sample-arm
          :parameters (o7 #p1 #p16)
          :precondition (and (graspable o7) (ispose o7 #p1) (ispose o7 #p16))
          :effect (and (isarm #a95 o7 #p1 #p16))
   )
   (:action s124_sample-arm
          :parameters (o7 #p1 #p17)
          :precondition (and (graspable o7) (ispose o7 #p1) (ispose o7 #p17))
          :effect (and (isarm #a96 o7 #p1 #p17))
   )
   (:action s125_sample-arm
          :parameters (o7 #p1 #p18)
          :precondition (and (graspable o7) (ispose o7 #p1) (ispose o7 #p18))
          :effect (and (isarm #a97 o7 #p1 #p18))
   )
   (:action s126_sample-arm
          :parameters (o7 #p2 #p12)
          :precondition (and (graspable o7) (ispose o7 #p2) (ispose o7 #p12))
          :effect (and (isarm #a98 o7 #p2 #p12))
   )
   (:action s127_sample-arm
          :parameters (o7 #p2 #p13)
          :precondition (and (graspable o7) (ispose o7 #p2) (ispose o7 #p13))
          :effect (and (isarm #a99 o7 #p2 #p13))
   )
   (:action s128_sample-arm
          :parameters (o7 #p2 #p14)
          :precondition (and (graspable o7) (ispose o7 #p2) (ispose o7 #p14))
          :effect (and (isarm #a100 o7 #p2 #p14))
   )
   (:action s129_sample-arm
          :parameters (o7 #p2 #p15)
          :precondition (and (graspable o7) (ispose o7 #p2) (ispose o7 #p15))
          :effect (and (isarm #a101 o7 #p2 #p15))
   )
   (:action s130_sample-arm
          :parameters (o7 #p2 #p16)
          :precondition (and (graspable o7) (ispose o7 #p2) (ispose o7 #p16))
          :effect (and (isarm #a102 o7 #p2 #p16))
   )
   (:action s131_sample-arm
          :parameters (o7 #p2 #p17)
          :precondition (and (graspable o7) (ispose o7 #p2) (ispose o7 #p17))
          :effect (and (isarm #a103 o7 #p2 #p17))
   )
   (:action s132_sample-arm
          :parameters (o7 #p2 #p18)
          :precondition (and (graspable o7) (ispose o7 #p2) (ispose o7 #p18))
          :effect (and (isarm #a104 o7 #p2 #p18))
   )
   (:action s133_sample-arm
          :parameters (o7 #p9 #p12)
          :precondition (and (graspable o7) (ispose o7 #p9) (ispose o7 #p12))
          :effect (and (isarm #a105 o7 #p9 #p12))
   )
   (:action s134_sample-arm
          :parameters (o7 #p9 #p13)
          :precondition (and (graspable o7) (ispose o7 #p9) (ispose o7 #p13))
          :effect (and (isarm #a106 o7 #p9 #p13))
   )
   (:action s135_sample-arm
          :parameters (o7 #p9 #p14)
          :precondition (and (graspable o7) (ispose o7 #p9) (ispose o7 #p14))
          :effect (and (isarm #a107 o7 #p9 #p14))
   )
   (:action s136_sample-arm
          :parameters (o7 #p9 #p15)
          :precondition (and (graspable o7) (ispose o7 #p9) (ispose o7 #p15))
          :effect (and (isarm #a108 o7 #p9 #p15))
   )
   (:action s137_sample-arm
          :parameters (o7 #p9 #p16)
          :precondition (and (graspable o7) (ispose o7 #p9) (ispose o7 #p16))
          :effect (and (isarm #a109 o7 #p9 #p16))
   )
   (:action s138_sample-arm
          :parameters (o7 #p9 #p17)
          :precondition (and (graspable o7) (ispose o7 #p9) (ispose o7 #p17))
          :effect (and (isarm #a110 o7 #p9 #p17))
   )
   (:action s139_sample-arm
          :parameters (o7 #p9 #p18)
          :precondition (and (graspable o7) (ispose o7 #p9) (ispose o7 #p18))
          :effect (and (isarm #a111 o7 #p9 #p18))
   )
   (:action s140_sample-arm
          :parameters (o7 #p10 #p12)
          :precondition (and (graspable o7) (ispose o7 #p10) (ispose o7 #p12))
          :effect (and (isarm #a112 o7 #p10 #p12))
   )
   (:action s141_sample-arm
          :parameters (o7 #p10 #p13)
          :precondition (and (graspable o7) (ispose o7 #p10) (ispose o7 #p13))
          :effect (and (isarm #a113 o7 #p10 #p13))
   )
   (:action s142_sample-arm
          :parameters (o7 #p10 #p14)
          :precondition (and (graspable o7) (ispose o7 #p10) (ispose o7 #p14))
          :effect (and (isarm #a114 o7 #p10 #p14))
   )
   (:action s143_sample-arm
          :parameters (o7 #p10 #p15)
          :precondition (and (graspable o7) (ispose o7 #p10) (ispose o7 #p15))
          :effect (and (isarm #a115 o7 #p10 #p15))
   )
   (:action s144_sample-arm
          :parameters (o7 #p10 #p16)
          :precondition (and (graspable o7) (ispose o7 #p10) (ispose o7 #p16))
          :effect (and (isarm #a116 o7 #p10 #p16))
   )
   (:action s145_sample-arm
          :parameters (o7 #p10 #p17)
          :precondition (and (graspable o7) (ispose o7 #p10) (ispose o7 #p17))
          :effect (and (isarm #a117 o7 #p10 #p17))
   )
   (:action s146_sample-arm
          :parameters (o7 #p10 #p18)
          :precondition (and (graspable o7) (ispose o7 #p10) (ispose o7 #p18))
          :effect (and (isarm #a118 o7 #p10 #p18))
   )
   (:action s147_sample-arm
          :parameters (o7 #p12 p312)
          :precondition (and (graspable o7) (ispose o7 #p12) (ispose o7 p312))
          :effect (and (isarm #a119 o7 #p12 p312))
   )
   (:action s148_sample-arm
          :parameters (o7 #p12 #p0)
          :precondition (and (graspable o7) (ispose o7 #p12) (ispose o7 #p0))
          :effect (and (isarm #a120 o7 #p12 #p0))
   )
   (:action s149_sample-arm
          :parameters (o7 #p12 #p1)
          :precondition (and (graspable o7) (ispose o7 #p12) (ispose o7 #p1))
          :effect (and (isarm #a121 o7 #p12 #p1))
   )
   (:action s150_sample-arm
          :parameters (o7 #p12 #p2)
          :precondition (and (graspable o7) (ispose o7 #p12) (ispose o7 #p2))
          :effect (and (isarm #a122 o7 #p12 #p2))
   )
   (:action s151_sample-arm
          :parameters (o7 #p12 #p9)
          :precondition (and (graspable o7) (ispose o7 #p12) (ispose o7 #p9))
          :effect (and (isarm #a123 o7 #p12 #p9))
   )
   (:action s152_sample-arm
          :parameters (o7 #p12 #p10)
          :precondition (and (graspable o7) (ispose o7 #p12) (ispose o7 #p10))
          :effect (and (isarm #a124 o7 #p12 #p10))
   )
   (:action s153_sample-arm
          :parameters (o7 #p12 #p12)
          :precondition (and (graspable o7) (ispose o7 #p12) (ispose o7 #p12))
          :effect (and (isarm #a125 o7 #p12 #p12))
   )
   (:action s154_sample-arm
          :parameters (o7 #p12 #p13)
          :precondition (and (graspable o7) (ispose o7 #p12) (ispose o7 #p13))
          :effect (and (isarm #a126 o7 #p12 #p13))
   )
   (:action s155_sample-arm
          :parameters (o7 #p12 #p14)
          :precondition (and (graspable o7) (ispose o7 #p12) (ispose o7 #p14))
          :effect (and (isarm #a127 o7 #p12 #p14))
   )
   (:action s156_sample-arm
          :parameters (o7 #p12 #p15)
          :precondition (and (graspable o7) (ispose o7 #p12) (ispose o7 #p15))
          :effect (and (isarm #a128 o7 #p12 #p15))
   )
   (:action s157_sample-arm
          :parameters (o7 #p12 #p16)
          :precondition (and (graspable o7) (ispose o7 #p12) (ispose o7 #p16))
          :effect (and (isarm #a129 o7 #p12 #p16))
   )
   (:action s158_sample-arm
          :parameters (o7 #p12 #p17)
          :precondition (and (graspable o7) (ispose o7 #p12) (ispose o7 #p17))
          :effect (and (isarm #a130 o7 #p12 #p17))
   )
   (:action s159_sample-arm
          :parameters (o7 #p12 #p18)
          :precondition (and (graspable o7) (ispose o7 #p12) (ispose o7 #p18))
          :effect (and (isarm #a131 o7 #p12 #p18))
   )
   (:action s160_sample-arm
          :parameters (o7 #p13 p312)
          :precondition (and (graspable o7) (ispose o7 #p13) (ispose o7 p312))
          :effect (and (isarm #a132 o7 #p13 p312))
   )
   (:action s161_sample-arm
          :parameters (o7 #p13 #p0)
          :precondition (and (graspable o7) (ispose o7 #p13) (ispose o7 #p0))
          :effect (and (isarm #a133 o7 #p13 #p0))
   )
   (:action s162_sample-arm
          :parameters (o7 #p13 #p1)
          :precondition (and (graspable o7) (ispose o7 #p13) (ispose o7 #p1))
          :effect (and (isarm #a134 o7 #p13 #p1))
   )
   (:action s163_sample-arm
          :parameters (o7 #p13 #p2)
          :precondition (and (graspable o7) (ispose o7 #p13) (ispose o7 #p2))
          :effect (and (isarm #a135 o7 #p13 #p2))
   )
   (:action s164_sample-arm
          :parameters (o7 #p13 #p9)
          :precondition (and (graspable o7) (ispose o7 #p13) (ispose o7 #p9))
          :effect (and (isarm #a136 o7 #p13 #p9))
   )
   (:action s165_sample-arm
          :parameters (o7 #p13 #p10)
          :precondition (and (graspable o7) (ispose o7 #p13) (ispose o7 #p10))
          :effect (and (isarm #a137 o7 #p13 #p10))
   )
   (:action s166_sample-arm
          :parameters (o7 #p13 #p12)
          :precondition (and (graspable o7) (ispose o7 #p13) (ispose o7 #p12))
          :effect (and (isarm #a138 o7 #p13 #p12))
   )
   (:action s167_sample-arm
          :parameters (o7 #p13 #p13)
          :precondition (and (graspable o7) (ispose o7 #p13) (ispose o7 #p13))
          :effect (and (isarm #a139 o7 #p13 #p13))
   )
   (:action s168_sample-arm
          :parameters (o7 #p13 #p14)
          :precondition (and (graspable o7) (ispose o7 #p13) (ispose o7 #p14))
          :effect (and (isarm #a140 o7 #p13 #p14))
   )
   (:action s169_sample-arm
          :parameters (o7 #p13 #p15)
          :precondition (and (graspable o7) (ispose o7 #p13) (ispose o7 #p15))
          :effect (and (isarm #a141 o7 #p13 #p15))
   )
   (:action s170_sample-arm
          :parameters (o7 #p13 #p16)
          :precondition (and (graspable o7) (ispose o7 #p13) (ispose o7 #p16))
          :effect (and (isarm #a142 o7 #p13 #p16))
   )
   (:action s171_sample-arm
          :parameters (o7 #p13 #p17)
          :precondition (and (graspable o7) (ispose o7 #p13) (ispose o7 #p17))
          :effect (and (isarm #a143 o7 #p13 #p17))
   )
   (:action s172_sample-arm
          :parameters (o7 #p13 #p18)
          :precondition (and (graspable o7) (ispose o7 #p13) (ispose o7 #p18))
          :effect (and (isarm #a144 o7 #p13 #p18))
   )
   (:action s173_sample-arm
          :parameters (o7 #p14 p312)
          :precondition (and (graspable o7) (ispose o7 #p14) (ispose o7 p312))
          :effect (and (isarm #a145 o7 #p14 p312))
   )
   (:action s174_sample-arm
          :parameters (o7 #p14 #p0)
          :precondition (and (graspable o7) (ispose o7 #p14) (ispose o7 #p0))
          :effect (and (isarm #a146 o7 #p14 #p0))
   )
   (:action s175_sample-arm
          :parameters (o7 #p14 #p1)
          :precondition (and (graspable o7) (ispose o7 #p14) (ispose o7 #p1))
          :effect (and (isarm #a147 o7 #p14 #p1))
   )
   (:action s176_sample-arm
          :parameters (o7 #p14 #p2)
          :precondition (and (graspable o7) (ispose o7 #p14) (ispose o7 #p2))
          :effect (and (isarm #a148 o7 #p14 #p2))
   )
   (:action s177_sample-arm
          :parameters (o7 #p14 #p9)
          :precondition (and (graspable o7) (ispose o7 #p14) (ispose o7 #p9))
          :effect (and (isarm #a149 o7 #p14 #p9))
   )
   (:action s178_sample-arm
          :parameters (o7 #p14 #p10)
          :precondition (and (graspable o7) (ispose o7 #p14) (ispose o7 #p10))
          :effect (and (isarm #a150 o7 #p14 #p10))
   )
   (:action s179_sample-arm
          :parameters (o7 #p14 #p12)
          :precondition (and (graspable o7) (ispose o7 #p14) (ispose o7 #p12))
          :effect (and (isarm #a151 o7 #p14 #p12))
   )
   (:action s180_sample-arm
          :parameters (o7 #p14 #p13)
          :precondition (and (graspable o7) (ispose o7 #p14) (ispose o7 #p13))
          :effect (and (isarm #a152 o7 #p14 #p13))
   )
   (:action s181_sample-arm
          :parameters (o7 #p14 #p14)
          :precondition (and (graspable o7) (ispose o7 #p14) (ispose o7 #p14))
          :effect (and (isarm #a153 o7 #p14 #p14))
   )
   (:action s182_sample-arm
          :parameters (o7 #p14 #p15)
          :precondition (and (graspable o7) (ispose o7 #p14) (ispose o7 #p15))
          :effect (and (isarm #a154 o7 #p14 #p15))
   )
   (:action s183_sample-arm
          :parameters (o7 #p14 #p16)
          :precondition (and (graspable o7) (ispose o7 #p14) (ispose o7 #p16))
          :effect (and (isarm #a155 o7 #p14 #p16))
   )
   (:action s184_sample-arm
          :parameters (o7 #p14 #p17)
          :precondition (and (graspable o7) (ispose o7 #p14) (ispose o7 #p17))
          :effect (and (isarm #a156 o7 #p14 #p17))
   )
   (:action s185_sample-arm
          :parameters (o7 #p14 #p18)
          :precondition (and (graspable o7) (ispose o7 #p14) (ispose o7 #p18))
          :effect (and (isarm #a157 o7 #p14 #p18))
   )
   (:action s186_sample-arm
          :parameters (o7 #p15 p312)
          :precondition (and (graspable o7) (ispose o7 #p15) (ispose o7 p312))
          :effect (and (isarm #a158 o7 #p15 p312))
   )
   (:action s187_sample-arm
          :parameters (o7 #p15 #p0)
          :precondition (and (graspable o7) (ispose o7 #p15) (ispose o7 #p0))
          :effect (and (isarm #a159 o7 #p15 #p0))
   )
   (:action s188_sample-arm
          :parameters (o7 #p15 #p1)
          :precondition (and (graspable o7) (ispose o7 #p15) (ispose o7 #p1))
          :effect (and (isarm #a160 o7 #p15 #p1))
   )
   (:action s189_sample-arm
          :parameters (o7 #p15 #p2)
          :precondition (and (graspable o7) (ispose o7 #p15) (ispose o7 #p2))
          :effect (and (isarm #a161 o7 #p15 #p2))
   )
   (:action s190_sample-arm
          :parameters (o7 #p15 #p9)
          :precondition (and (graspable o7) (ispose o7 #p15) (ispose o7 #p9))
          :effect (and (isarm #a162 o7 #p15 #p9))
   )
   (:action s191_sample-arm
          :parameters (o7 #p15 #p10)
          :precondition (and (graspable o7) (ispose o7 #p15) (ispose o7 #p10))
          :effect (and (isarm #a163 o7 #p15 #p10))
   )
   (:action s192_sample-arm
          :parameters (o7 #p15 #p12)
          :precondition (and (graspable o7) (ispose o7 #p15) (ispose o7 #p12))
          :effect (and (isarm #a164 o7 #p15 #p12))
   )
   (:action s193_sample-arm
          :parameters (o7 #p15 #p13)
          :precondition (and (graspable o7) (ispose o7 #p15) (ispose o7 #p13))
          :effect (and (isarm #a165 o7 #p15 #p13))
   )
   (:action s194_sample-arm
          :parameters (o7 #p15 #p14)
          :precondition (and (graspable o7) (ispose o7 #p15) (ispose o7 #p14))
          :effect (and (isarm #a166 o7 #p15 #p14))
   )
   (:action s195_sample-arm
          :parameters (o7 #p15 #p15)
          :precondition (and (graspable o7) (ispose o7 #p15) (ispose o7 #p15))
          :effect (and (isarm #a167 o7 #p15 #p15))
   )
   (:action s196_sample-arm
          :parameters (o7 #p15 #p16)
          :precondition (and (graspable o7) (ispose o7 #p15) (ispose o7 #p16))
          :effect (and (isarm #a168 o7 #p15 #p16))
   )
   (:action s197_sample-arm
          :parameters (o7 #p15 #p17)
          :precondition (and (graspable o7) (ispose o7 #p15) (ispose o7 #p17))
          :effect (and (isarm #a169 o7 #p15 #p17))
   )
   (:action s198_sample-arm
          :parameters (o7 #p15 #p18)
          :precondition (and (graspable o7) (ispose o7 #p15) (ispose o7 #p18))
          :effect (and (isarm #a170 o7 #p15 #p18))
   )
   (:action s199_sample-arm
          :parameters (o7 #p16 p312)
          :precondition (and (graspable o7) (ispose o7 #p16) (ispose o7 p312))
          :effect (and (isarm #a171 o7 #p16 p312))
   )
   (:action s200_sample-arm
          :parameters (o7 #p16 #p0)
          :precondition (and (graspable o7) (ispose o7 #p16) (ispose o7 #p0))
          :effect (and (isarm #a172 o7 #p16 #p0))
   )
   (:action s201_sample-arm
          :parameters (o7 #p16 #p1)
          :precondition (and (graspable o7) (ispose o7 #p16) (ispose o7 #p1))
          :effect (and (isarm #a173 o7 #p16 #p1))
   )
   (:action s202_sample-arm
          :parameters (o7 #p16 #p2)
          :precondition (and (graspable o7) (ispose o7 #p16) (ispose o7 #p2))
          :effect (and (isarm #a174 o7 #p16 #p2))
   )
   (:action s203_sample-arm
          :parameters (o7 #p16 #p9)
          :precondition (and (graspable o7) (ispose o7 #p16) (ispose o7 #p9))
          :effect (and (isarm #a175 o7 #p16 #p9))
   )
   (:action s204_sample-arm
          :parameters (o7 #p16 #p10)
          :precondition (and (graspable o7) (ispose o7 #p16) (ispose o7 #p10))
          :effect (and (isarm #a176 o7 #p16 #p10))
   )
   (:action s205_sample-arm
          :parameters (o7 #p16 #p12)
          :precondition (and (graspable o7) (ispose o7 #p16) (ispose o7 #p12))
          :effect (and (isarm #a177 o7 #p16 #p12))
   )
   (:action s206_sample-arm
          :parameters (o7 #p16 #p13)
          :precondition (and (graspable o7) (ispose o7 #p16) (ispose o7 #p13))
          :effect (and (isarm #a178 o7 #p16 #p13))
   )
   (:action s207_sample-arm
          :parameters (o7 #p16 #p14)
          :precondition (and (graspable o7) (ispose o7 #p16) (ispose o7 #p14))
          :effect (and (isarm #a179 o7 #p16 #p14))
   )
   (:action s208_sample-arm
          :parameters (o7 #p16 #p15)
          :precondition (and (graspable o7) (ispose o7 #p16) (ispose o7 #p15))
          :effect (and (isarm #a180 o7 #p16 #p15))
   )
   (:action s209_sample-arm
          :parameters (o7 #p16 #p16)
          :precondition (and (graspable o7) (ispose o7 #p16) (ispose o7 #p16))
          :effect (and (isarm #a181 o7 #p16 #p16))
   )
   (:action s210_sample-arm
          :parameters (o7 #p16 #p17)
          :precondition (and (graspable o7) (ispose o7 #p16) (ispose o7 #p17))
          :effect (and (isarm #a182 o7 #p16 #p17))
   )
   (:action s211_sample-arm
          :parameters (o7 #p16 #p18)
          :precondition (and (graspable o7) (ispose o7 #p16) (ispose o7 #p18))
          :effect (and (isarm #a183 o7 #p16 #p18))
   )
   (:action s212_sample-arm
          :parameters (o7 #p17 p312)
          :precondition (and (graspable o7) (ispose o7 #p17) (ispose o7 p312))
          :effect (and (isarm #a184 o7 #p17 p312))
   )
   (:action s213_sample-arm
          :parameters (o7 #p17 #p0)
          :precondition (and (graspable o7) (ispose o7 #p17) (ispose o7 #p0))
          :effect (and (isarm #a185 o7 #p17 #p0))
   )
   (:action s214_sample-arm
          :parameters (o7 #p17 #p1)
          :precondition (and (graspable o7) (ispose o7 #p17) (ispose o7 #p1))
          :effect (and (isarm #a186 o7 #p17 #p1))
   )
   (:action s215_sample-arm
          :parameters (o7 #p17 #p2)
          :precondition (and (graspable o7) (ispose o7 #p17) (ispose o7 #p2))
          :effect (and (isarm #a187 o7 #p17 #p2))
   )
   (:action s216_sample-arm
          :parameters (o7 #p17 #p9)
          :precondition (and (graspable o7) (ispose o7 #p17) (ispose o7 #p9))
          :effect (and (isarm #a188 o7 #p17 #p9))
   )
   (:action s217_sample-arm
          :parameters (o7 #p17 #p10)
          :precondition (and (graspable o7) (ispose o7 #p17) (ispose o7 #p10))
          :effect (and (isarm #a189 o7 #p17 #p10))
   )
   (:action s218_sample-arm
          :parameters (o7 #p17 #p12)
          :precondition (and (graspable o7) (ispose o7 #p17) (ispose o7 #p12))
          :effect (and (isarm #a190 o7 #p17 #p12))
   )
   (:action s219_sample-arm
          :parameters (o7 #p17 #p13)
          :precondition (and (graspable o7) (ispose o7 #p17) (ispose o7 #p13))
          :effect (and (isarm #a191 o7 #p17 #p13))
   )
   (:action s220_sample-arm
          :parameters (o7 #p17 #p14)
          :precondition (and (graspable o7) (ispose o7 #p17) (ispose o7 #p14))
          :effect (and (isarm #a192 o7 #p17 #p14))
   )
   (:action s221_sample-arm
          :parameters (o7 #p17 #p15)
          :precondition (and (graspable o7) (ispose o7 #p17) (ispose o7 #p15))
          :effect (and (isarm #a193 o7 #p17 #p15))
   )
   (:action s222_sample-arm
          :parameters (o7 #p17 #p16)
          :precondition (and (graspable o7) (ispose o7 #p17) (ispose o7 #p16))
          :effect (and (isarm #a194 o7 #p17 #p16))
   )
   (:action s223_sample-arm
          :parameters (o7 #p17 #p17)
          :precondition (and (graspable o7) (ispose o7 #p17) (ispose o7 #p17))
          :effect (and (isarm #a195 o7 #p17 #p17))
   )
   (:action s224_sample-arm
          :parameters (o7 #p17 #p18)
          :precondition (and (graspable o7) (ispose o7 #p17) (ispose o7 #p18))
          :effect (and (isarm #a196 o7 #p17 #p18))
   )
   (:action s225_sample-arm
          :parameters (o7 #p18 p312)
          :precondition (and (graspable o7) (ispose o7 #p18) (ispose o7 p312))
          :effect (and (isarm #a197 o7 #p18 p312))
   )
   (:action s226_sample-arm
          :parameters (o7 #p18 #p0)
          :precondition (and (graspable o7) (ispose o7 #p18) (ispose o7 #p0))
          :effect (and (isarm #a198 o7 #p18 #p0))
   )
   (:action s227_sample-arm
          :parameters (o7 #p18 #p1)
          :precondition (and (graspable o7) (ispose o7 #p18) (ispose o7 #p1))
          :effect (and (isarm #a199 o7 #p18 #p1))
   )
   (:action s228_sample-arm
          :parameters (o7 #p18 #p2)
          :precondition (and (graspable o7) (ispose o7 #p18) (ispose o7 #p2))
          :effect (and (isarm #a200 o7 #p18 #p2))
   )
   (:action s229_sample-arm
          :parameters (o7 #p18 #p9)
          :precondition (and (graspable o7) (ispose o7 #p18) (ispose o7 #p9))
          :effect (and (isarm #a201 o7 #p18 #p9))
   )
   (:action s230_sample-arm
          :parameters (o7 #p18 #p10)
          :precondition (and (graspable o7) (ispose o7 #p18) (ispose o7 #p10))
          :effect (and (isarm #a202 o7 #p18 #p10))
   )
   (:action s231_sample-arm
          :parameters (o7 #p18 #p12)
          :precondition (and (graspable o7) (ispose o7 #p18) (ispose o7 #p12))
          :effect (and (isarm #a203 o7 #p18 #p12))
   )
   (:action s232_sample-arm
          :parameters (o7 #p18 #p13)
          :precondition (and (graspable o7) (ispose o7 #p18) (ispose o7 #p13))
          :effect (and (isarm #a204 o7 #p18 #p13))
   )
   (:action s233_sample-arm
          :parameters (o7 #p18 #p14)
          :precondition (and (graspable o7) (ispose o7 #p18) (ispose o7 #p14))
          :effect (and (isarm #a205 o7 #p18 #p14))
   )
   (:action s234_sample-arm
          :parameters (o7 #p18 #p15)
          :precondition (and (graspable o7) (ispose o7 #p18) (ispose o7 #p15))
          :effect (and (isarm #a206 o7 #p18 #p15))
   )
   (:action s235_sample-arm
          :parameters (o7 #p18 #p16)
          :precondition (and (graspable o7) (ispose o7 #p18) (ispose o7 #p16))
          :effect (and (isarm #a207 o7 #p18 #p16))
   )
   (:action s236_sample-arm
          :parameters (o7 #p18 #p17)
          :precondition (and (graspable o7) (ispose o7 #p18) (ispose o7 #p17))
          :effect (and (isarm #a208 o7 #p18 #p17))
   )
   (:action s237_sample-arm
          :parameters (o7 #p18 #p18)
          :precondition (and (graspable o7) (ispose o7 #p18) (ispose o7 #p18))
          :effect (and (isarm #a209 o7 #p18 #p18))
   )
   (:action s238_sample-arm
          :parameters (o8 p368 #p19)
          :precondition (and (graspable o8) (ispose o8 p368) (ispose o8 #p19))
          :effect (and (isarm #a210 o8 p368 #p19))
   )
   (:action s239_sample-arm
          :parameters (o8 p368 #p20)
          :precondition (and (graspable o8) (ispose o8 p368) (ispose o8 #p20))
          :effect (and (isarm #a211 o8 p368 #p20))
   )
   (:action s240_sample-arm
          :parameters (o8 p368 #p21)
          :precondition (and (graspable o8) (ispose o8 p368) (ispose o8 #p21))
          :effect (and (isarm #a212 o8 p368 #p21))
   )
   (:action s241_sample-arm
          :parameters (o8 #p3 #p19)
          :precondition (and (graspable o8) (ispose o8 #p3) (ispose o8 #p19))
          :effect (and (isarm #a213 o8 #p3 #p19))
   )
   (:action s242_sample-arm
          :parameters (o8 #p3 #p20)
          :precondition (and (graspable o8) (ispose o8 #p3) (ispose o8 #p20))
          :effect (and (isarm #a214 o8 #p3 #p20))
   )
   (:action s243_sample-arm
          :parameters (o8 #p3 #p21)
          :precondition (and (graspable o8) (ispose o8 #p3) (ispose o8 #p21))
          :effect (and (isarm #a215 o8 #p3 #p21))
   )
   (:action s244_sample-arm
          :parameters (o8 #p4 #p19)
          :precondition (and (graspable o8) (ispose o8 #p4) (ispose o8 #p19))
          :effect (and (isarm #a216 o8 #p4 #p19))
   )
   (:action s245_sample-arm
          :parameters (o8 #p4 #p20)
          :precondition (and (graspable o8) (ispose o8 #p4) (ispose o8 #p20))
          :effect (and (isarm #a217 o8 #p4 #p20))
   )
   (:action s246_sample-arm
          :parameters (o8 #p4 #p21)
          :precondition (and (graspable o8) (ispose o8 #p4) (ispose o8 #p21))
          :effect (and (isarm #a218 o8 #p4 #p21))
   )
   (:action s247_sample-arm
          :parameters (o8 #p5 #p19)
          :precondition (and (graspable o8) (ispose o8 #p5) (ispose o8 #p19))
          :effect (and (isarm #a219 o8 #p5 #p19))
   )
   (:action s248_sample-arm
          :parameters (o8 #p5 #p20)
          :precondition (and (graspable o8) (ispose o8 #p5) (ispose o8 #p20))
          :effect (and (isarm #a220 o8 #p5 #p20))
   )
   (:action s249_sample-arm
          :parameters (o8 #p5 #p21)
          :precondition (and (graspable o8) (ispose o8 #p5) (ispose o8 #p21))
          :effect (and (isarm #a221 o8 #p5 #p21))
   )
   (:action s250_sample-arm
          :parameters (o8 #p11 #p19)
          :precondition (and (graspable o8) (ispose o8 #p11) (ispose o8 #p19))
          :effect (and (isarm #a222 o8 #p11 #p19))
   )
   (:action s251_sample-arm
          :parameters (o8 #p11 #p20)
          :precondition (and (graspable o8) (ispose o8 #p11) (ispose o8 #p20))
          :effect (and (isarm #a223 o8 #p11 #p20))
   )
   (:action s252_sample-arm
          :parameters (o8 #p11 #p21)
          :precondition (and (graspable o8) (ispose o8 #p11) (ispose o8 #p21))
          :effect (and (isarm #a224 o8 #p11 #p21))
   )
   (:action s253_sample-arm
          :parameters (o8 #p19 p368)
          :precondition (and (graspable o8) (ispose o8 #p19) (ispose o8 p368))
          :effect (and (isarm #a225 o8 #p19 p368))
   )
   (:action s254_sample-arm
          :parameters (o8 #p19 #p3)
          :precondition (and (graspable o8) (ispose o8 #p19) (ispose o8 #p3))
          :effect (and (isarm #a226 o8 #p19 #p3))
   )
   (:action s255_sample-arm
          :parameters (o8 #p19 #p4)
          :precondition (and (graspable o8) (ispose o8 #p19) (ispose o8 #p4))
          :effect (and (isarm #a227 o8 #p19 #p4))
   )
   (:action s256_sample-arm
          :parameters (o8 #p19 #p5)
          :precondition (and (graspable o8) (ispose o8 #p19) (ispose o8 #p5))
          :effect (and (isarm #a228 o8 #p19 #p5))
   )
   (:action s257_sample-arm
          :parameters (o8 #p19 #p11)
          :precondition (and (graspable o8) (ispose o8 #p19) (ispose o8 #p11))
          :effect (and (isarm #a229 o8 #p19 #p11))
   )
   (:action s258_sample-arm
          :parameters (o8 #p19 #p19)
          :precondition (and (graspable o8) (ispose o8 #p19) (ispose o8 #p19))
          :effect (and (isarm #a230 o8 #p19 #p19))
   )
   (:action s259_sample-arm
          :parameters (o8 #p19 #p20)
          :precondition (and (graspable o8) (ispose o8 #p19) (ispose o8 #p20))
          :effect (and (isarm #a231 o8 #p19 #p20))
   )
   (:action s260_sample-arm
          :parameters (o8 #p19 #p21)
          :precondition (and (graspable o8) (ispose o8 #p19) (ispose o8 #p21))
          :effect (and (isarm #a232 o8 #p19 #p21))
   )
   (:action s261_sample-arm
          :parameters (o8 #p20 p368)
          :precondition (and (graspable o8) (ispose o8 #p20) (ispose o8 p368))
          :effect (and (isarm #a233 o8 #p20 p368))
   )
   (:action s262_sample-arm
          :parameters (o8 #p20 #p3)
          :precondition (and (graspable o8) (ispose o8 #p20) (ispose o8 #p3))
          :effect (and (isarm #a234 o8 #p20 #p3))
   )
   (:action s263_sample-arm
          :parameters (o8 #p20 #p4)
          :precondition (and (graspable o8) (ispose o8 #p20) (ispose o8 #p4))
          :effect (and (isarm #a235 o8 #p20 #p4))
   )
   (:action s264_sample-arm
          :parameters (o8 #p20 #p5)
          :precondition (and (graspable o8) (ispose o8 #p20) (ispose o8 #p5))
          :effect (and (isarm #a236 o8 #p20 #p5))
   )
   (:action s265_sample-arm
          :parameters (o8 #p20 #p11)
          :precondition (and (graspable o8) (ispose o8 #p20) (ispose o8 #p11))
          :effect (and (isarm #a237 o8 #p20 #p11))
   )
   (:action s266_sample-arm
          :parameters (o8 #p20 #p19)
          :precondition (and (graspable o8) (ispose o8 #p20) (ispose o8 #p19))
          :effect (and (isarm #a238 o8 #p20 #p19))
   )
   (:action s267_sample-arm
          :parameters (o8 #p20 #p20)
          :precondition (and (graspable o8) (ispose o8 #p20) (ispose o8 #p20))
          :effect (and (isarm #a239 o8 #p20 #p20))
   )
   (:action s268_sample-arm
          :parameters (o8 #p20 #p21)
          :precondition (and (graspable o8) (ispose o8 #p20) (ispose o8 #p21))
          :effect (and (isarm #a240 o8 #p20 #p21))
   )
   (:action s269_sample-arm
          :parameters (o8 #p21 p368)
          :precondition (and (graspable o8) (ispose o8 #p21) (ispose o8 p368))
          :effect (and (isarm #a241 o8 #p21 p368))
   )
   (:action s270_sample-arm
          :parameters (o8 #p21 #p3)
          :precondition (and (graspable o8) (ispose o8 #p21) (ispose o8 #p3))
          :effect (and (isarm #a242 o8 #p21 #p3))
   )
   (:action s271_sample-arm
          :parameters (o8 #p21 #p4)
          :precondition (and (graspable o8) (ispose o8 #p21) (ispose o8 #p4))
          :effect (and (isarm #a243 o8 #p21 #p4))
   )
   (:action s272_sample-arm
          :parameters (o8 #p21 #p5)
          :precondition (and (graspable o8) (ispose o8 #p21) (ispose o8 #p5))
          :effect (and (isarm #a244 o8 #p21 #p5))
   )
   (:action s273_sample-arm
          :parameters (o8 #p21 #p11)
          :precondition (and (graspable o8) (ispose o8 #p21) (ispose o8 #p11))
          :effect (and (isarm #a245 o8 #p21 #p11))
   )
   (:action s274_sample-arm
          :parameters (o8 #p21 #p19)
          :precondition (and (graspable o8) (ispose o8 #p21) (ispose o8 #p19))
          :effect (and (isarm #a246 o8 #p21 #p19))
   )
   (:action s275_sample-arm
          :parameters (o8 #p21 #p20)
          :precondition (and (graspable o8) (ispose o8 #p21) (ispose o8 #p20))
          :effect (and (isarm #a247 o8 #p21 #p20))
   )
   (:action s276_sample-arm
          :parameters (o8 #p21 #p21)
          :precondition (and (graspable o8) (ispose o8 #p21) (ispose o8 #p21))
          :effect (and (isarm #a248 o8 #p21 #p21))
   )
   (:action s277_sample-grasp
          :parameters (o7 p312 #p0 #a3)
          :precondition (isarm #a3 o7 p312 #p0)
          :effect (and (isgrasp o7 p312 #p0 #g3 #a3))
   )
   (:action s278_sample-grasp
          :parameters (o7 p312 #p1 #a4)
          :precondition (isarm #a4 o7 p312 #p1)
          :effect (and (isgrasp o7 p312 #p1 #g4 #a4))
   )
   (:action s279_sample-grasp
          :parameters (o7 p312 #p2 #a5)
          :precondition (isarm #a5 o7 p312 #p2)
          :effect (and (isgrasp o7 p312 #p2 #g5 #a5))
   )
   (:action s280_sample-grasp
          :parameters (o7 p312 #p9 #a6)
          :precondition (isarm #a6 o7 p312 #p9)
          :effect (and (isgrasp o7 p312 #p9 #g6 #a6))
   )
   (:action s281_sample-grasp
          :parameters (o7 p312 #p10 #a7)
          :precondition (isarm #a7 o7 p312 #p10)
          :effect (and (isgrasp o7 p312 #p10 #g7 #a7))
   )
   (:action s282_sample-grasp
          :parameters (o7 #p0 p312 #a8)
          :precondition (isarm #a8 o7 #p0 p312)
          :effect (and (isgrasp o7 #p0 p312 #g8 #a8))
   )
   (:action s283_sample-grasp
          :parameters (o7 #p0 #p0 #a9)
          :precondition (isarm #a9 o7 #p0 #p0)
          :effect (and (isgrasp o7 #p0 #p0 #g9 #a9))
   )
   (:action s284_sample-grasp
          :parameters (o7 #p0 #p1 #a10)
          :precondition (isarm #a10 o7 #p0 #p1)
          :effect (and (isgrasp o7 #p0 #p1 #g10 #a10))
   )
   (:action s285_sample-grasp
          :parameters (o7 #p0 #p2 #a11)
          :precondition (isarm #a11 o7 #p0 #p2)
          :effect (and (isgrasp o7 #p0 #p2 #g11 #a11))
   )
   (:action s286_sample-grasp
          :parameters (o7 #p0 #p9 #a12)
          :precondition (isarm #a12 o7 #p0 #p9)
          :effect (and (isgrasp o7 #p0 #p9 #g12 #a12))
   )
   (:action s287_sample-grasp
          :parameters (o7 #p0 #p10 #a13)
          :precondition (isarm #a13 o7 #p0 #p10)
          :effect (and (isgrasp o7 #p0 #p10 #g13 #a13))
   )
   (:action s288_sample-grasp
          :parameters (o7 #p1 p312 #a14)
          :precondition (isarm #a14 o7 #p1 p312)
          :effect (and (isgrasp o7 #p1 p312 #g14 #a14))
   )
   (:action s289_sample-grasp
          :parameters (o7 #p1 #p0 #a15)
          :precondition (isarm #a15 o7 #p1 #p0)
          :effect (and (isgrasp o7 #p1 #p0 #g15 #a15))
   )
   (:action s290_sample-grasp
          :parameters (o7 #p1 #p1 #a16)
          :precondition (isarm #a16 o7 #p1 #p1)
          :effect (and (isgrasp o7 #p1 #p1 #g16 #a16))
   )
   (:action s291_sample-grasp
          :parameters (o7 #p1 #p2 #a17)
          :precondition (isarm #a17 o7 #p1 #p2)
          :effect (and (isgrasp o7 #p1 #p2 #g17 #a17))
   )
   (:action s292_sample-grasp
          :parameters (o7 #p1 #p9 #a18)
          :precondition (isarm #a18 o7 #p1 #p9)
          :effect (and (isgrasp o7 #p1 #p9 #g18 #a18))
   )
   (:action s293_sample-grasp
          :parameters (o7 #p1 #p10 #a19)
          :precondition (isarm #a19 o7 #p1 #p10)
          :effect (and (isgrasp o7 #p1 #p10 #g19 #a19))
   )
   (:action s294_sample-grasp
          :parameters (o7 #p2 p312 #a20)
          :precondition (isarm #a20 o7 #p2 p312)
          :effect (and (isgrasp o7 #p2 p312 #g20 #a20))
   )
   (:action s295_sample-grasp
          :parameters (o7 #p2 #p0 #a21)
          :precondition (isarm #a21 o7 #p2 #p0)
          :effect (and (isgrasp o7 #p2 #p0 #g21 #a21))
   )
   (:action s296_sample-grasp
          :parameters (o7 #p2 #p1 #a22)
          :precondition (isarm #a22 o7 #p2 #p1)
          :effect (and (isgrasp o7 #p2 #p1 #g22 #a22))
   )
   (:action s297_sample-grasp
          :parameters (o7 #p2 #p2 #a23)
          :precondition (isarm #a23 o7 #p2 #p2)
          :effect (and (isgrasp o7 #p2 #p2 #g23 #a23))
   )
   (:action s298_sample-grasp
          :parameters (o7 #p2 #p9 #a24)
          :precondition (isarm #a24 o7 #p2 #p9)
          :effect (and (isgrasp o7 #p2 #p9 #g24 #a24))
   )
   (:action s299_sample-grasp
          :parameters (o7 #p2 #p10 #a25)
          :precondition (isarm #a25 o7 #p2 #p10)
          :effect (and (isgrasp o7 #p2 #p10 #g25 #a25))
   )
   (:action s300_sample-grasp
          :parameters (o7 #p9 p312 #a26)
          :precondition (isarm #a26 o7 #p9 p312)
          :effect (and (isgrasp o7 #p9 p312 #g26 #a26))
   )
   (:action s301_sample-grasp
          :parameters (o7 #p9 #p0 #a27)
          :precondition (isarm #a27 o7 #p9 #p0)
          :effect (and (isgrasp o7 #p9 #p0 #g27 #a27))
   )
   (:action s302_sample-grasp
          :parameters (o7 #p9 #p1 #a28)
          :precondition (isarm #a28 o7 #p9 #p1)
          :effect (and (isgrasp o7 #p9 #p1 #g28 #a28))
   )
   (:action s303_sample-grasp
          :parameters (o7 #p9 #p2 #a29)
          :precondition (isarm #a29 o7 #p9 #p2)
          :effect (and (isgrasp o7 #p9 #p2 #g29 #a29))
   )
   (:action s304_sample-grasp
          :parameters (o7 #p9 #p9 #a30)
          :precondition (isarm #a30 o7 #p9 #p9)
          :effect (and (isgrasp o7 #p9 #p9 #g30 #a30))
   )
   (:action s305_sample-grasp
          :parameters (o7 #p9 #p10 #a31)
          :precondition (isarm #a31 o7 #p9 #p10)
          :effect (and (isgrasp o7 #p9 #p10 #g31 #a31))
   )
   (:action s306_sample-grasp
          :parameters (o7 #p10 p312 #a32)
          :precondition (isarm #a32 o7 #p10 p312)
          :effect (and (isgrasp o7 #p10 p312 #g32 #a32))
   )
   (:action s307_sample-grasp
          :parameters (o7 #p10 #p0 #a33)
          :precondition (isarm #a33 o7 #p10 #p0)
          :effect (and (isgrasp o7 #p10 #p0 #g33 #a33))
   )
   (:action s308_sample-grasp
          :parameters (o7 #p10 #p1 #a34)
          :precondition (isarm #a34 o7 #p10 #p1)
          :effect (and (isgrasp o7 #p10 #p1 #g34 #a34))
   )
   (:action s309_sample-grasp
          :parameters (o7 #p10 #p2 #a35)
          :precondition (isarm #a35 o7 #p10 #p2)
          :effect (and (isgrasp o7 #p10 #p2 #g35 #a35))
   )
   (:action s310_sample-grasp
          :parameters (o7 #p10 #p9 #a36)
          :precondition (isarm #a36 o7 #p10 #p9)
          :effect (and (isgrasp o7 #p10 #p9 #g36 #a36))
   )
   (:action s311_sample-grasp
          :parameters (o7 #p10 #p10 #a37)
          :precondition (isarm #a37 o7 #p10 #p10)
          :effect (and (isgrasp o7 #p10 #p10 #g37 #a37))
   )
   (:action s312_sample-grasp
          :parameters (o8 p368 #p3 #a38)
          :precondition (isarm #a38 o8 p368 #p3)
          :effect (and (isgrasp o8 p368 #p3 #g38 #a38))
   )
   (:action s313_sample-grasp
          :parameters (o8 p368 #p4 #a39)
          :precondition (isarm #a39 o8 p368 #p4)
          :effect (and (isgrasp o8 p368 #p4 #g39 #a39))
   )
   (:action s314_sample-grasp
          :parameters (o8 p368 #p5 #a40)
          :precondition (isarm #a40 o8 p368 #p5)
          :effect (and (isgrasp o8 p368 #p5 #g40 #a40))
   )
   (:action s315_sample-grasp
          :parameters (o8 p368 #p11 #a41)
          :precondition (isarm #a41 o8 p368 #p11)
          :effect (and (isgrasp o8 p368 #p11 #g41 #a41))
   )
   (:action s316_sample-grasp
          :parameters (o8 #p3 p368 #a42)
          :precondition (isarm #a42 o8 #p3 p368)
          :effect (and (isgrasp o8 #p3 p368 #g42 #a42))
   )
   (:action s317_sample-grasp
          :parameters (o8 #p3 #p3 #a43)
          :precondition (isarm #a43 o8 #p3 #p3)
          :effect (and (isgrasp o8 #p3 #p3 #g43 #a43))
   )
   (:action s318_sample-grasp
          :parameters (o8 #p3 #p4 #a44)
          :precondition (isarm #a44 o8 #p3 #p4)
          :effect (and (isgrasp o8 #p3 #p4 #g44 #a44))
   )
   (:action s319_sample-grasp
          :parameters (o8 #p3 #p5 #a45)
          :precondition (isarm #a45 o8 #p3 #p5)
          :effect (and (isgrasp o8 #p3 #p5 #g45 #a45))
   )
   (:action s320_sample-grasp
          :parameters (o8 #p3 #p11 #a46)
          :precondition (isarm #a46 o8 #p3 #p11)
          :effect (and (isgrasp o8 #p3 #p11 #g46 #a46))
   )
   (:action s321_sample-grasp
          :parameters (o8 #p4 p368 #a47)
          :precondition (isarm #a47 o8 #p4 p368)
          :effect (and (isgrasp o8 #p4 p368 #g47 #a47))
   )
   (:action s322_sample-grasp
          :parameters (o8 #p4 #p3 #a48)
          :precondition (isarm #a48 o8 #p4 #p3)
          :effect (and (isgrasp o8 #p4 #p3 #g48 #a48))
   )
   (:action s323_sample-grasp
          :parameters (o8 #p4 #p4 #a49)
          :precondition (isarm #a49 o8 #p4 #p4)
          :effect (and (isgrasp o8 #p4 #p4 #g49 #a49))
   )
   (:action s324_sample-grasp
          :parameters (o8 #p4 #p5 #a50)
          :precondition (isarm #a50 o8 #p4 #p5)
          :effect (and (isgrasp o8 #p4 #p5 #g50 #a50))
   )
   (:action s325_sample-grasp
          :parameters (o8 #p4 #p11 #a51)
          :precondition (isarm #a51 o8 #p4 #p11)
          :effect (and (isgrasp o8 #p4 #p11 #g51 #a51))
   )
   (:action s326_sample-grasp
          :parameters (o8 #p5 p368 #a52)
          :precondition (isarm #a52 o8 #p5 p368)
          :effect (and (isgrasp o8 #p5 p368 #g52 #a52))
   )
   (:action s327_sample-grasp
          :parameters (o8 #p5 #p3 #a53)
          :precondition (isarm #a53 o8 #p5 #p3)
          :effect (and (isgrasp o8 #p5 #p3 #g53 #a53))
   )
   (:action s328_sample-grasp
          :parameters (o8 #p5 #p4 #a54)
          :precondition (isarm #a54 o8 #p5 #p4)
          :effect (and (isgrasp o8 #p5 #p4 #g54 #a54))
   )
   (:action s329_sample-grasp
          :parameters (o8 #p5 #p5 #a55)
          :precondition (isarm #a55 o8 #p5 #p5)
          :effect (and (isgrasp o8 #p5 #p5 #g55 #a55))
   )
   (:action s330_sample-grasp
          :parameters (o8 #p5 #p11 #a56)
          :precondition (isarm #a56 o8 #p5 #p11)
          :effect (and (isgrasp o8 #p5 #p11 #g56 #a56))
   )
   (:action s331_sample-grasp
          :parameters (o8 #p11 p368 #a57)
          :precondition (isarm #a57 o8 #p11 p368)
          :effect (and (isgrasp o8 #p11 p368 #g57 #a57))
   )
   (:action s332_sample-grasp
          :parameters (o8 #p11 #p3 #a58)
          :precondition (isarm #a58 o8 #p11 #p3)
          :effect (and (isgrasp o8 #p11 #p3 #g58 #a58))
   )
   (:action s333_sample-grasp
          :parameters (o8 #p11 #p4 #a59)
          :precondition (isarm #a59 o8 #p11 #p4)
          :effect (and (isgrasp o8 #p11 #p4 #g59 #a59))
   )
   (:action s334_sample-grasp
          :parameters (o8 #p11 #p5 #a60)
          :precondition (isarm #a60 o8 #p11 #p5)
          :effect (and (isgrasp o8 #p11 #p5 #g60 #a60))
   )
   (:action s335_sample-grasp
          :parameters (o8 #p11 #p11 #a61)
          :precondition (isarm #a61 o8 #p11 #p11)
          :effect (and (isgrasp o8 #p11 #p11 #g61 #a61))
   )
   (:action s336_sample-grasp
          :parameters (o9 p424 #p6 #a62)
          :precondition (isarm #a62 o9 p424 #p6)
          :effect (and (isgrasp o9 p424 #p6 #g62 #a62))
   )
   (:action s337_sample-grasp
          :parameters (o9 p424 #p7 #a63)
          :precondition (isarm #a63 o9 p424 #p7)
          :effect (and (isgrasp o9 p424 #p7 #g63 #a63))
   )
   (:action s338_sample-grasp
          :parameters (o9 p424 #p8 #a64)
          :precondition (isarm #a64 o9 p424 #p8)
          :effect (and (isgrasp o9 p424 #p8 #g64 #a64))
   )
   (:action s339_sample-grasp
          :parameters (o9 #p6 p424 #a65)
          :precondition (isarm #a65 o9 #p6 p424)
          :effect (and (isgrasp o9 #p6 p424 #g65 #a65))
   )
   (:action s340_sample-grasp
          :parameters (o9 #p6 #p6 #a66)
          :precondition (isarm #a66 o9 #p6 #p6)
          :effect (and (isgrasp o9 #p6 #p6 #g66 #a66))
   )
   (:action s341_sample-grasp
          :parameters (o9 #p6 #p7 #a67)
          :precondition (isarm #a67 o9 #p6 #p7)
          :effect (and (isgrasp o9 #p6 #p7 #g67 #a67))
   )
   (:action s342_sample-grasp
          :parameters (o9 #p6 #p8 #a68)
          :precondition (isarm #a68 o9 #p6 #p8)
          :effect (and (isgrasp o9 #p6 #p8 #g68 #a68))
   )
   (:action s343_sample-grasp
          :parameters (o9 #p7 p424 #a69)
          :precondition (isarm #a69 o9 #p7 p424)
          :effect (and (isgrasp o9 #p7 p424 #g69 #a69))
   )
   (:action s344_sample-grasp
          :parameters (o9 #p7 #p6 #a70)
          :precondition (isarm #a70 o9 #p7 #p6)
          :effect (and (isgrasp o9 #p7 #p6 #g70 #a70))
   )
   (:action s345_sample-grasp
          :parameters (o9 #p7 #p7 #a71)
          :precondition (isarm #a71 o9 #p7 #p7)
          :effect (and (isgrasp o9 #p7 #p7 #g71 #a71))
   )
   (:action s346_sample-grasp
          :parameters (o9 #p7 #p8 #a72)
          :precondition (isarm #a72 o9 #p7 #p8)
          :effect (and (isgrasp o9 #p7 #p8 #g72 #a72))
   )
   (:action s347_sample-grasp
          :parameters (o9 #p8 p424 #a73)
          :precondition (isarm #a73 o9 #p8 p424)
          :effect (and (isgrasp o9 #p8 p424 #g73 #a73))
   )
   (:action s348_sample-grasp
          :parameters (o9 #p8 #p6 #a74)
          :precondition (isarm #a74 o9 #p8 #p6)
          :effect (and (isgrasp o9 #p8 #p6 #g74 #a74))
   )
   (:action s349_sample-grasp
          :parameters (o9 #p8 #p7 #a75)
          :precondition (isarm #a75 o9 #p8 #p7)
          :effect (and (isgrasp o9 #p8 #p7 #g75 #a75))
   )
   (:action s350_sample-grasp
          :parameters (o9 #p8 #p8 #a76)
          :precondition (isarm #a76 o9 #p8 #p8)
          :effect (and (isgrasp o9 #p8 #p8 #g76 #a76))
   )
   (:action s351_ik-arm-motion-from
          :parameters (o7 p312 p312 #g0 #a0)
          :precondition (and (isgrasp o7 p312 p312 #g0 #a0))
          :effect (kinfrom o7 p312 #g0 #a0 #t0)
   )
   (:action s352_ik-arm-motion-from
          :parameters (o8 p368 p368 #g1 #a1)
          :precondition (and (isgrasp o8 p368 p368 #g1 #a1))
          :effect (kinfrom o8 p368 #g1 #a1 #t1)
   )
   (:action s353_ik-arm-motion-from
          :parameters (o9 p424 p424 #g2 #a2)
          :precondition (and (isgrasp o9 p424 p424 #g2 #a2))
          :effect (kinfrom o9 p424 #g2 #a2 #t2)
   )
   (:action s354_ik-arm-motion-to
          :parameters (o7 p312 p312 #g0 #a0)
          :precondition (and (isgrasp o7 p312 p312 #g0 #a0))
          :effect (kinto o7 p312 #g0 #a0 #t3)
   )
   (:action s355_ik-arm-motion-to
          :parameters (o8 p368 p368 #g1 #a1)
          :precondition (and (isgrasp o8 p368 p368 #g1 #a1))
          :effect (kinto o8 p368 #g1 #a1 #t4)
   )
   (:action s356_ik-arm-motion-to
          :parameters (o9 p424 p424 #g2 #a2)
          :precondition (and (isgrasp o9 p424 p424 #g2 #a2))
          :effect (kinto o9 p424 #g2 #a2 #t5)
   )
   (:action s357_sample-arm
          :parameters (o7 p312 #p22)
          :precondition (and (graspable o7) (ispose o7 p312) (ispose o7 #p22))
          :effect (and (isarm #a249 o7 p312 #p22))
   )
   (:action s358_sample-arm
          :parameters (o7 p312 #p23)
          :precondition (and (graspable o7) (ispose o7 p312) (ispose o7 #p23))
          :effect (and (isarm #a250 o7 p312 #p23))
   )
   (:action s359_sample-arm
          :parameters (o7 p312 #p24)
          :precondition (and (graspable o7) (ispose o7 p312) (ispose o7 #p24))
          :effect (and (isarm #a251 o7 p312 #p24))
   )
   (:action s360_sample-arm
          :parameters (o7 #p0 #p22)
          :precondition (and (graspable o7) (ispose o7 #p0) (ispose o7 #p22))
          :effect (and (isarm #a252 o7 #p0 #p22))
   )
   (:action s361_sample-arm
          :parameters (o7 #p0 #p23)
          :precondition (and (graspable o7) (ispose o7 #p0) (ispose o7 #p23))
          :effect (and (isarm #a253 o7 #p0 #p23))
   )
   (:action s362_sample-arm
          :parameters (o7 #p0 #p24)
          :precondition (and (graspable o7) (ispose o7 #p0) (ispose o7 #p24))
          :effect (and (isarm #a254 o7 #p0 #p24))
   )
   (:action s363_sample-arm
          :parameters (o7 #p1 #p22)
          :precondition (and (graspable o7) (ispose o7 #p1) (ispose o7 #p22))
          :effect (and (isarm #a255 o7 #p1 #p22))
   )
   (:action s364_sample-arm
          :parameters (o7 #p1 #p23)
          :precondition (and (graspable o7) (ispose o7 #p1) (ispose o7 #p23))
          :effect (and (isarm #a256 o7 #p1 #p23))
   )
   (:action s365_sample-arm
          :parameters (o7 #p1 #p24)
          :precondition (and (graspable o7) (ispose o7 #p1) (ispose o7 #p24))
          :effect (and (isarm #a257 o7 #p1 #p24))
   )
   (:action s366_sample-arm
          :parameters (o7 #p2 #p22)
          :precondition (and (graspable o7) (ispose o7 #p2) (ispose o7 #p22))
          :effect (and (isarm #a258 o7 #p2 #p22))
   )
   (:action s367_sample-arm
          :parameters (o7 #p2 #p23)
          :precondition (and (graspable o7) (ispose o7 #p2) (ispose o7 #p23))
          :effect (and (isarm #a259 o7 #p2 #p23))
   )
   (:action s368_sample-arm
          :parameters (o7 #p2 #p24)
          :precondition (and (graspable o7) (ispose o7 #p2) (ispose o7 #p24))
          :effect (and (isarm #a260 o7 #p2 #p24))
   )
   (:action s369_sample-arm
          :parameters (o7 #p9 #p22)
          :precondition (and (graspable o7) (ispose o7 #p9) (ispose o7 #p22))
          :effect (and (isarm #a261 o7 #p9 #p22))
   )
   (:action s370_sample-arm
          :parameters (o7 #p9 #p23)
          :precondition (and (graspable o7) (ispose o7 #p9) (ispose o7 #p23))
          :effect (and (isarm #a262 o7 #p9 #p23))
   )
   (:action s371_sample-arm
          :parameters (o7 #p9 #p24)
          :precondition (and (graspable o7) (ispose o7 #p9) (ispose o7 #p24))
          :effect (and (isarm #a263 o7 #p9 #p24))
   )
   (:action s372_sample-arm
          :parameters (o7 #p10 #p22)
          :precondition (and (graspable o7) (ispose o7 #p10) (ispose o7 #p22))
          :effect (and (isarm #a264 o7 #p10 #p22))
   )
   (:action s373_sample-arm
          :parameters (o7 #p10 #p23)
          :precondition (and (graspable o7) (ispose o7 #p10) (ispose o7 #p23))
          :effect (and (isarm #a265 o7 #p10 #p23))
   )
   (:action s374_sample-arm
          :parameters (o7 #p10 #p24)
          :precondition (and (graspable o7) (ispose o7 #p10) (ispose o7 #p24))
          :effect (and (isarm #a266 o7 #p10 #p24))
   )
   (:action s375_sample-arm
          :parameters (o7 #p12 #p22)
          :precondition (and (graspable o7) (ispose o7 #p12) (ispose o7 #p22))
          :effect (and (isarm #a267 o7 #p12 #p22))
   )
   (:action s376_sample-arm
          :parameters (o7 #p12 #p23)
          :precondition (and (graspable o7) (ispose o7 #p12) (ispose o7 #p23))
          :effect (and (isarm #a268 o7 #p12 #p23))
   )
   (:action s377_sample-arm
          :parameters (o7 #p12 #p24)
          :precondition (and (graspable o7) (ispose o7 #p12) (ispose o7 #p24))
          :effect (and (isarm #a269 o7 #p12 #p24))
   )
   (:action s378_sample-arm
          :parameters (o7 #p13 #p22)
          :precondition (and (graspable o7) (ispose o7 #p13) (ispose o7 #p22))
          :effect (and (isarm #a270 o7 #p13 #p22))
   )
   (:action s379_sample-arm
          :parameters (o7 #p13 #p23)
          :precondition (and (graspable o7) (ispose o7 #p13) (ispose o7 #p23))
          :effect (and (isarm #a271 o7 #p13 #p23))
   )
   (:action s380_sample-arm
          :parameters (o7 #p13 #p24)
          :precondition (and (graspable o7) (ispose o7 #p13) (ispose o7 #p24))
          :effect (and (isarm #a272 o7 #p13 #p24))
   )
   (:action s381_sample-arm
          :parameters (o7 #p14 #p22)
          :precondition (and (graspable o7) (ispose o7 #p14) (ispose o7 #p22))
          :effect (and (isarm #a273 o7 #p14 #p22))
   )
   (:action s382_sample-arm
          :parameters (o7 #p14 #p23)
          :precondition (and (graspable o7) (ispose o7 #p14) (ispose o7 #p23))
          :effect (and (isarm #a274 o7 #p14 #p23))
   )
   (:action s383_sample-arm
          :parameters (o7 #p14 #p24)
          :precondition (and (graspable o7) (ispose o7 #p14) (ispose o7 #p24))
          :effect (and (isarm #a275 o7 #p14 #p24))
   )
   (:action s384_sample-arm
          :parameters (o7 #p15 #p22)
          :precondition (and (graspable o7) (ispose o7 #p15) (ispose o7 #p22))
          :effect (and (isarm #a276 o7 #p15 #p22))
   )
   (:action s385_sample-arm
          :parameters (o7 #p15 #p23)
          :precondition (and (graspable o7) (ispose o7 #p15) (ispose o7 #p23))
          :effect (and (isarm #a277 o7 #p15 #p23))
   )
   (:action s386_sample-arm
          :parameters (o7 #p15 #p24)
          :precondition (and (graspable o7) (ispose o7 #p15) (ispose o7 #p24))
          :effect (and (isarm #a278 o7 #p15 #p24))
   )
   (:action s387_sample-arm
          :parameters (o7 #p16 #p22)
          :precondition (and (graspable o7) (ispose o7 #p16) (ispose o7 #p22))
          :effect (and (isarm #a279 o7 #p16 #p22))
   )
   (:action s388_sample-arm
          :parameters (o7 #p16 #p23)
          :precondition (and (graspable o7) (ispose o7 #p16) (ispose o7 #p23))
          :effect (and (isarm #a280 o7 #p16 #p23))
   )
   (:action s389_sample-arm
          :parameters (o7 #p16 #p24)
          :precondition (and (graspable o7) (ispose o7 #p16) (ispose o7 #p24))
          :effect (and (isarm #a281 o7 #p16 #p24))
   )
   (:action s390_sample-arm
          :parameters (o7 #p17 #p22)
          :precondition (and (graspable o7) (ispose o7 #p17) (ispose o7 #p22))
          :effect (and (isarm #a282 o7 #p17 #p22))
   )
   (:action s391_sample-arm
          :parameters (o7 #p17 #p23)
          :precondition (and (graspable o7) (ispose o7 #p17) (ispose o7 #p23))
          :effect (and (isarm #a283 o7 #p17 #p23))
   )
   (:action s392_sample-arm
          :parameters (o7 #p17 #p24)
          :precondition (and (graspable o7) (ispose o7 #p17) (ispose o7 #p24))
          :effect (and (isarm #a284 o7 #p17 #p24))
   )
   (:action s393_sample-arm
          :parameters (o7 #p18 #p22)
          :precondition (and (graspable o7) (ispose o7 #p18) (ispose o7 #p22))
          :effect (and (isarm #a285 o7 #p18 #p22))
   )
   (:action s394_sample-arm
          :parameters (o7 #p18 #p23)
          :precondition (and (graspable o7) (ispose o7 #p18) (ispose o7 #p23))
          :effect (and (isarm #a286 o7 #p18 #p23))
   )
   (:action s395_sample-arm
          :parameters (o7 #p18 #p24)
          :precondition (and (graspable o7) (ispose o7 #p18) (ispose o7 #p24))
          :effect (and (isarm #a287 o7 #p18 #p24))
   )
   (:action s396_sample-arm
          :parameters (o7 #p22 p312)
          :precondition (and (graspable o7) (ispose o7 #p22) (ispose o7 p312))
          :effect (and (isarm #a288 o7 #p22 p312))
   )
   (:action s397_sample-arm
          :parameters (o7 #p22 #p0)
          :precondition (and (graspable o7) (ispose o7 #p22) (ispose o7 #p0))
          :effect (and (isarm #a289 o7 #p22 #p0))
   )
   (:action s398_sample-arm
          :parameters (o7 #p22 #p1)
          :precondition (and (graspable o7) (ispose o7 #p22) (ispose o7 #p1))
          :effect (and (isarm #a290 o7 #p22 #p1))
   )
   (:action s399_sample-arm
          :parameters (o7 #p22 #p2)
          :precondition (and (graspable o7) (ispose o7 #p22) (ispose o7 #p2))
          :effect (and (isarm #a291 o7 #p22 #p2))
   )
   (:action s400_sample-arm
          :parameters (o7 #p22 #p9)
          :precondition (and (graspable o7) (ispose o7 #p22) (ispose o7 #p9))
          :effect (and (isarm #a292 o7 #p22 #p9))
   )
   (:action s401_sample-arm
          :parameters (o7 #p22 #p10)
          :precondition (and (graspable o7) (ispose o7 #p22) (ispose o7 #p10))
          :effect (and (isarm #a293 o7 #p22 #p10))
   )
   (:action s402_sample-arm
          :parameters (o7 #p22 #p12)
          :precondition (and (graspable o7) (ispose o7 #p22) (ispose o7 #p12))
          :effect (and (isarm #a294 o7 #p22 #p12))
   )
   (:action s403_sample-arm
          :parameters (o7 #p22 #p13)
          :precondition (and (graspable o7) (ispose o7 #p22) (ispose o7 #p13))
          :effect (and (isarm #a295 o7 #p22 #p13))
   )
   (:action s404_sample-arm
          :parameters (o7 #p22 #p14)
          :precondition (and (graspable o7) (ispose o7 #p22) (ispose o7 #p14))
          :effect (and (isarm #a296 o7 #p22 #p14))
   )
   (:action s405_sample-arm
          :parameters (o7 #p22 #p15)
          :precondition (and (graspable o7) (ispose o7 #p22) (ispose o7 #p15))
          :effect (and (isarm #a297 o7 #p22 #p15))
   )
   (:action s406_sample-arm
          :parameters (o7 #p22 #p16)
          :precondition (and (graspable o7) (ispose o7 #p22) (ispose o7 #p16))
          :effect (and (isarm #a298 o7 #p22 #p16))
   )
   (:action s407_sample-arm
          :parameters (o7 #p22 #p17)
          :precondition (and (graspable o7) (ispose o7 #p22) (ispose o7 #p17))
          :effect (and (isarm #a299 o7 #p22 #p17))
   )
   (:action s408_sample-arm
          :parameters (o7 #p22 #p18)
          :precondition (and (graspable o7) (ispose o7 #p22) (ispose o7 #p18))
          :effect (and (isarm #a300 o7 #p22 #p18))
   )
   (:action s409_sample-arm
          :parameters (o7 #p22 #p22)
          :precondition (and (graspable o7) (ispose o7 #p22) (ispose o7 #p22))
          :effect (and (isarm #a301 o7 #p22 #p22))
   )
   (:action s410_sample-arm
          :parameters (o7 #p22 #p23)
          :precondition (and (graspable o7) (ispose o7 #p22) (ispose o7 #p23))
          :effect (and (isarm #a302 o7 #p22 #p23))
   )
   (:action s411_sample-arm
          :parameters (o7 #p22 #p24)
          :precondition (and (graspable o7) (ispose o7 #p22) (ispose o7 #p24))
          :effect (and (isarm #a303 o7 #p22 #p24))
   )
   (:action s412_sample-arm
          :parameters (o7 #p23 p312)
          :precondition (and (graspable o7) (ispose o7 #p23) (ispose o7 p312))
          :effect (and (isarm #a304 o7 #p23 p312))
   )
   (:action s413_sample-arm
          :parameters (o7 #p23 #p0)
          :precondition (and (graspable o7) (ispose o7 #p23) (ispose o7 #p0))
          :effect (and (isarm #a305 o7 #p23 #p0))
   )
   (:action s414_sample-arm
          :parameters (o7 #p23 #p1)
          :precondition (and (graspable o7) (ispose o7 #p23) (ispose o7 #p1))
          :effect (and (isarm #a306 o7 #p23 #p1))
   )
   (:action s415_sample-arm
          :parameters (o7 #p23 #p2)
          :precondition (and (graspable o7) (ispose o7 #p23) (ispose o7 #p2))
          :effect (and (isarm #a307 o7 #p23 #p2))
   )
   (:action s416_sample-arm
          :parameters (o7 #p23 #p9)
          :precondition (and (graspable o7) (ispose o7 #p23) (ispose o7 #p9))
          :effect (and (isarm #a308 o7 #p23 #p9))
   )
   (:action s417_sample-arm
          :parameters (o7 #p23 #p10)
          :precondition (and (graspable o7) (ispose o7 #p23) (ispose o7 #p10))
          :effect (and (isarm #a309 o7 #p23 #p10))
   )
   (:action s418_sample-arm
          :parameters (o7 #p23 #p12)
          :precondition (and (graspable o7) (ispose o7 #p23) (ispose o7 #p12))
          :effect (and (isarm #a310 o7 #p23 #p12))
   )
   (:action s419_sample-arm
          :parameters (o7 #p23 #p13)
          :precondition (and (graspable o7) (ispose o7 #p23) (ispose o7 #p13))
          :effect (and (isarm #a311 o7 #p23 #p13))
   )
   (:action s420_sample-arm
          :parameters (o7 #p23 #p14)
          :precondition (and (graspable o7) (ispose o7 #p23) (ispose o7 #p14))
          :effect (and (isarm #a312 o7 #p23 #p14))
   )
   (:action s421_sample-arm
          :parameters (o7 #p23 #p15)
          :precondition (and (graspable o7) (ispose o7 #p23) (ispose o7 #p15))
          :effect (and (isarm #a313 o7 #p23 #p15))
   )
   (:action s422_sample-arm
          :parameters (o7 #p23 #p16)
          :precondition (and (graspable o7) (ispose o7 #p23) (ispose o7 #p16))
          :effect (and (isarm #a314 o7 #p23 #p16))
   )
   (:action s423_sample-arm
          :parameters (o7 #p23 #p17)
          :precondition (and (graspable o7) (ispose o7 #p23) (ispose o7 #p17))
          :effect (and (isarm #a315 o7 #p23 #p17))
   )
   (:action s424_sample-arm
          :parameters (o7 #p23 #p18)
          :precondition (and (graspable o7) (ispose o7 #p23) (ispose o7 #p18))
          :effect (and (isarm #a316 o7 #p23 #p18))
   )
   (:action s425_sample-arm
          :parameters (o7 #p23 #p22)
          :precondition (and (graspable o7) (ispose o7 #p23) (ispose o7 #p22))
          :effect (and (isarm #a317 o7 #p23 #p22))
   )
   (:action s426_sample-arm
          :parameters (o7 #p23 #p23)
          :precondition (and (graspable o7) (ispose o7 #p23) (ispose o7 #p23))
          :effect (and (isarm #a318 o7 #p23 #p23))
   )
   (:action s427_sample-arm
          :parameters (o7 #p23 #p24)
          :precondition (and (graspable o7) (ispose o7 #p23) (ispose o7 #p24))
          :effect (and (isarm #a319 o7 #p23 #p24))
   )
   (:action s428_sample-arm
          :parameters (o7 #p24 p312)
          :precondition (and (graspable o7) (ispose o7 #p24) (ispose o7 p312))
          :effect (and (isarm #a320 o7 #p24 p312))
   )
   (:action s429_sample-arm
          :parameters (o7 #p24 #p0)
          :precondition (and (graspable o7) (ispose o7 #p24) (ispose o7 #p0))
          :effect (and (isarm #a321 o7 #p24 #p0))
   )
   (:action s430_sample-arm
          :parameters (o7 #p24 #p1)
          :precondition (and (graspable o7) (ispose o7 #p24) (ispose o7 #p1))
          :effect (and (isarm #a322 o7 #p24 #p1))
   )
   (:action s431_sample-arm
          :parameters (o7 #p24 #p2)
          :precondition (and (graspable o7) (ispose o7 #p24) (ispose o7 #p2))
          :effect (and (isarm #a323 o7 #p24 #p2))
   )
   (:action s432_sample-arm
          :parameters (o7 #p24 #p9)
          :precondition (and (graspable o7) (ispose o7 #p24) (ispose o7 #p9))
          :effect (and (isarm #a324 o7 #p24 #p9))
   )
   (:action s433_sample-arm
          :parameters (o7 #p24 #p10)
          :precondition (and (graspable o7) (ispose o7 #p24) (ispose o7 #p10))
          :effect (and (isarm #a325 o7 #p24 #p10))
   )
   (:action s434_sample-arm
          :parameters (o7 #p24 #p12)
          :precondition (and (graspable o7) (ispose o7 #p24) (ispose o7 #p12))
          :effect (and (isarm #a326 o7 #p24 #p12))
   )
   (:action s435_sample-arm
          :parameters (o7 #p24 #p13)
          :precondition (and (graspable o7) (ispose o7 #p24) (ispose o7 #p13))
          :effect (and (isarm #a327 o7 #p24 #p13))
   )
   (:action s436_sample-arm
          :parameters (o7 #p24 #p14)
          :precondition (and (graspable o7) (ispose o7 #p24) (ispose o7 #p14))
          :effect (and (isarm #a328 o7 #p24 #p14))
   )
   (:action s437_sample-arm
          :parameters (o7 #p24 #p15)
          :precondition (and (graspable o7) (ispose o7 #p24) (ispose o7 #p15))
          :effect (and (isarm #a329 o7 #p24 #p15))
   )
   (:action s438_sample-arm
          :parameters (o7 #p24 #p16)
          :precondition (and (graspable o7) (ispose o7 #p24) (ispose o7 #p16))
          :effect (and (isarm #a330 o7 #p24 #p16))
   )
   (:action s439_sample-arm
          :parameters (o7 #p24 #p17)
          :precondition (and (graspable o7) (ispose o7 #p24) (ispose o7 #p17))
          :effect (and (isarm #a331 o7 #p24 #p17))
   )
   (:action s440_sample-arm
          :parameters (o7 #p24 #p18)
          :precondition (and (graspable o7) (ispose o7 #p24) (ispose o7 #p18))
          :effect (and (isarm #a332 o7 #p24 #p18))
   )
   (:action s441_sample-arm
          :parameters (o7 #p24 #p22)
          :precondition (and (graspable o7) (ispose o7 #p24) (ispose o7 #p22))
          :effect (and (isarm #a333 o7 #p24 #p22))
   )
   (:action s442_sample-arm
          :parameters (o7 #p24 #p23)
          :precondition (and (graspable o7) (ispose o7 #p24) (ispose o7 #p23))
          :effect (and (isarm #a334 o7 #p24 #p23))
   )
   (:action s443_sample-arm
          :parameters (o7 #p24 #p24)
          :precondition (and (graspable o7) (ispose o7 #p24) (ispose o7 #p24))
          :effect (and (isarm #a335 o7 #p24 #p24))
   )
   (:action s444_sample-grasp
          :parameters (o7 p312 #p12 #a77)
          :precondition (isarm #a77 o7 p312 #p12)
          :effect (and (isgrasp o7 p312 #p12 #g77 #a77))
   )
   (:action s445_sample-grasp
          :parameters (o7 p312 #p13 #a78)
          :precondition (isarm #a78 o7 p312 #p13)
          :effect (and (isgrasp o7 p312 #p13 #g78 #a78))
   )
   (:action s446_sample-grasp
          :parameters (o7 p312 #p14 #a79)
          :precondition (isarm #a79 o7 p312 #p14)
          :effect (and (isgrasp o7 p312 #p14 #g79 #a79))
   )
   (:action s447_sample-grasp
          :parameters (o7 p312 #p15 #a80)
          :precondition (isarm #a80 o7 p312 #p15)
          :effect (and (isgrasp o7 p312 #p15 #g80 #a80))
   )
   (:action s448_sample-grasp
          :parameters (o7 p312 #p16 #a81)
          :precondition (isarm #a81 o7 p312 #p16)
          :effect (and (isgrasp o7 p312 #p16 #g81 #a81))
   )
   (:action s449_sample-grasp
          :parameters (o7 p312 #p17 #a82)
          :precondition (isarm #a82 o7 p312 #p17)
          :effect (and (isgrasp o7 p312 #p17 #g82 #a82))
   )
   (:action s450_sample-grasp
          :parameters (o7 p312 #p18 #a83)
          :precondition (isarm #a83 o7 p312 #p18)
          :effect (and (isgrasp o7 p312 #p18 #g83 #a83))
   )
   (:action s451_sample-grasp
          :parameters (o7 #p0 #p12 #a84)
          :precondition (isarm #a84 o7 #p0 #p12)
          :effect (and (isgrasp o7 #p0 #p12 #g84 #a84))
   )
   (:action s452_sample-grasp
          :parameters (o7 #p0 #p13 #a85)
          :precondition (isarm #a85 o7 #p0 #p13)
          :effect (and (isgrasp o7 #p0 #p13 #g85 #a85))
   )
   (:action s453_sample-grasp
          :parameters (o7 #p0 #p14 #a86)
          :precondition (isarm #a86 o7 #p0 #p14)
          :effect (and (isgrasp o7 #p0 #p14 #g86 #a86))
   )
   (:action s454_sample-grasp
          :parameters (o7 #p0 #p15 #a87)
          :precondition (isarm #a87 o7 #p0 #p15)
          :effect (and (isgrasp o7 #p0 #p15 #g87 #a87))
   )
   (:action s455_sample-grasp
          :parameters (o7 #p0 #p16 #a88)
          :precondition (isarm #a88 o7 #p0 #p16)
          :effect (and (isgrasp o7 #p0 #p16 #g88 #a88))
   )
   (:action s456_sample-grasp
          :parameters (o7 #p0 #p17 #a89)
          :precondition (isarm #a89 o7 #p0 #p17)
          :effect (and (isgrasp o7 #p0 #p17 #g89 #a89))
   )
   (:action s457_sample-grasp
          :parameters (o7 #p0 #p18 #a90)
          :precondition (isarm #a90 o7 #p0 #p18)
          :effect (and (isgrasp o7 #p0 #p18 #g90 #a90))
   )
   (:action s458_sample-grasp
          :parameters (o7 #p1 #p12 #a91)
          :precondition (isarm #a91 o7 #p1 #p12)
          :effect (and (isgrasp o7 #p1 #p12 #g91 #a91))
   )
   (:action s459_sample-grasp
          :parameters (o7 #p1 #p13 #a92)
          :precondition (isarm #a92 o7 #p1 #p13)
          :effect (and (isgrasp o7 #p1 #p13 #g92 #a92))
   )
   (:action s460_sample-grasp
          :parameters (o7 #p1 #p14 #a93)
          :precondition (isarm #a93 o7 #p1 #p14)
          :effect (and (isgrasp o7 #p1 #p14 #g93 #a93))
   )
   (:action s461_sample-grasp
          :parameters (o7 #p1 #p15 #a94)
          :precondition (isarm #a94 o7 #p1 #p15)
          :effect (and (isgrasp o7 #p1 #p15 #g94 #a94))
   )
   (:action s462_sample-grasp
          :parameters (o7 #p1 #p16 #a95)
          :precondition (isarm #a95 o7 #p1 #p16)
          :effect (and (isgrasp o7 #p1 #p16 #g95 #a95))
   )
   (:action s463_sample-grasp
          :parameters (o7 #p1 #p17 #a96)
          :precondition (isarm #a96 o7 #p1 #p17)
          :effect (and (isgrasp o7 #p1 #p17 #g96 #a96))
   )
   (:action s464_sample-grasp
          :parameters (o7 #p1 #p18 #a97)
          :precondition (isarm #a97 o7 #p1 #p18)
          :effect (and (isgrasp o7 #p1 #p18 #g97 #a97))
   )
   (:action s465_sample-grasp
          :parameters (o7 #p2 #p12 #a98)
          :precondition (isarm #a98 o7 #p2 #p12)
          :effect (and (isgrasp o7 #p2 #p12 #g98 #a98))
   )
   (:action s466_sample-grasp
          :parameters (o7 #p2 #p13 #a99)
          :precondition (isarm #a99 o7 #p2 #p13)
          :effect (and (isgrasp o7 #p2 #p13 #g99 #a99))
   )
   (:action s467_sample-grasp
          :parameters (o7 #p2 #p14 #a100)
          :precondition (isarm #a100 o7 #p2 #p14)
          :effect (and (isgrasp o7 #p2 #p14 #g100 #a100))
   )
   (:action s468_sample-grasp
          :parameters (o7 #p2 #p15 #a101)
          :precondition (isarm #a101 o7 #p2 #p15)
          :effect (and (isgrasp o7 #p2 #p15 #g101 #a101))
   )
   (:action s469_sample-grasp
          :parameters (o7 #p2 #p16 #a102)
          :precondition (isarm #a102 o7 #p2 #p16)
          :effect (and (isgrasp o7 #p2 #p16 #g102 #a102))
   )
   (:action s470_sample-grasp
          :parameters (o7 #p2 #p17 #a103)
          :precondition (isarm #a103 o7 #p2 #p17)
          :effect (and (isgrasp o7 #p2 #p17 #g103 #a103))
   )
   (:action s471_sample-grasp
          :parameters (o7 #p2 #p18 #a104)
          :precondition (isarm #a104 o7 #p2 #p18)
          :effect (and (isgrasp o7 #p2 #p18 #g104 #a104))
   )
   (:action s472_sample-grasp
          :parameters (o7 #p9 #p12 #a105)
          :precondition (isarm #a105 o7 #p9 #p12)
          :effect (and (isgrasp o7 #p9 #p12 #g105 #a105))
   )
   (:action s473_sample-grasp
          :parameters (o7 #p9 #p13 #a106)
          :precondition (isarm #a106 o7 #p9 #p13)
          :effect (and (isgrasp o7 #p9 #p13 #g106 #a106))
   )
   (:action s474_sample-grasp
          :parameters (o7 #p9 #p14 #a107)
          :precondition (isarm #a107 o7 #p9 #p14)
          :effect (and (isgrasp o7 #p9 #p14 #g107 #a107))
   )
   (:action s475_sample-grasp
          :parameters (o7 #p9 #p15 #a108)
          :precondition (isarm #a108 o7 #p9 #p15)
          :effect (and (isgrasp o7 #p9 #p15 #g108 #a108))
   )
   (:action s476_sample-grasp
          :parameters (o7 #p9 #p16 #a109)
          :precondition (isarm #a109 o7 #p9 #p16)
          :effect (and (isgrasp o7 #p9 #p16 #g109 #a109))
   )
   (:action s477_sample-grasp
          :parameters (o7 #p9 #p17 #a110)
          :precondition (isarm #a110 o7 #p9 #p17)
          :effect (and (isgrasp o7 #p9 #p17 #g110 #a110))
   )
   (:action s478_sample-grasp
          :parameters (o7 #p9 #p18 #a111)
          :precondition (isarm #a111 o7 #p9 #p18)
          :effect (and (isgrasp o7 #p9 #p18 #g111 #a111))
   )
   (:action s479_sample-grasp
          :parameters (o7 #p10 #p12 #a112)
          :precondition (isarm #a112 o7 #p10 #p12)
          :effect (and (isgrasp o7 #p10 #p12 #g112 #a112))
   )
   (:action s480_sample-grasp
          :parameters (o7 #p10 #p13 #a113)
          :precondition (isarm #a113 o7 #p10 #p13)
          :effect (and (isgrasp o7 #p10 #p13 #g113 #a113))
   )
   (:action s481_sample-grasp
          :parameters (o7 #p10 #p14 #a114)
          :precondition (isarm #a114 o7 #p10 #p14)
          :effect (and (isgrasp o7 #p10 #p14 #g114 #a114))
   )
   (:action s482_sample-grasp
          :parameters (o7 #p10 #p15 #a115)
          :precondition (isarm #a115 o7 #p10 #p15)
          :effect (and (isgrasp o7 #p10 #p15 #g115 #a115))
   )
   (:action s483_sample-grasp
          :parameters (o7 #p10 #p16 #a116)
          :precondition (isarm #a116 o7 #p10 #p16)
          :effect (and (isgrasp o7 #p10 #p16 #g116 #a116))
   )
   (:action s484_sample-grasp
          :parameters (o7 #p10 #p17 #a117)
          :precondition (isarm #a117 o7 #p10 #p17)
          :effect (and (isgrasp o7 #p10 #p17 #g117 #a117))
   )
   (:action s485_sample-grasp
          :parameters (o7 #p10 #p18 #a118)
          :precondition (isarm #a118 o7 #p10 #p18)
          :effect (and (isgrasp o7 #p10 #p18 #g118 #a118))
   )
   (:action s486_sample-grasp
          :parameters (o7 #p12 p312 #a119)
          :precondition (isarm #a119 o7 #p12 p312)
          :effect (and (isgrasp o7 #p12 p312 #g119 #a119))
   )
   (:action s487_sample-grasp
          :parameters (o7 #p12 #p0 #a120)
          :precondition (isarm #a120 o7 #p12 #p0)
          :effect (and (isgrasp o7 #p12 #p0 #g120 #a120))
   )
   (:action s488_sample-grasp
          :parameters (o7 #p12 #p1 #a121)
          :precondition (isarm #a121 o7 #p12 #p1)
          :effect (and (isgrasp o7 #p12 #p1 #g121 #a121))
   )
   (:action s489_sample-grasp
          :parameters (o7 #p12 #p2 #a122)
          :precondition (isarm #a122 o7 #p12 #p2)
          :effect (and (isgrasp o7 #p12 #p2 #g122 #a122))
   )
   (:action s490_sample-grasp
          :parameters (o7 #p12 #p9 #a123)
          :precondition (isarm #a123 o7 #p12 #p9)
          :effect (and (isgrasp o7 #p12 #p9 #g123 #a123))
   )
   (:action s491_sample-grasp
          :parameters (o7 #p12 #p10 #a124)
          :precondition (isarm #a124 o7 #p12 #p10)
          :effect (and (isgrasp o7 #p12 #p10 #g124 #a124))
   )
   (:action s492_sample-grasp
          :parameters (o7 #p12 #p12 #a125)
          :precondition (isarm #a125 o7 #p12 #p12)
          :effect (and (isgrasp o7 #p12 #p12 #g125 #a125))
   )
   (:action s493_sample-grasp
          :parameters (o7 #p12 #p13 #a126)
          :precondition (isarm #a126 o7 #p12 #p13)
          :effect (and (isgrasp o7 #p12 #p13 #g126 #a126))
   )
   (:action s494_sample-grasp
          :parameters (o7 #p12 #p14 #a127)
          :precondition (isarm #a127 o7 #p12 #p14)
          :effect (and (isgrasp o7 #p12 #p14 #g127 #a127))
   )
   (:action s495_sample-grasp
          :parameters (o7 #p12 #p15 #a128)
          :precondition (isarm #a128 o7 #p12 #p15)
          :effect (and (isgrasp o7 #p12 #p15 #g128 #a128))
   )
   (:action s496_sample-grasp
          :parameters (o7 #p12 #p16 #a129)
          :precondition (isarm #a129 o7 #p12 #p16)
          :effect (and (isgrasp o7 #p12 #p16 #g129 #a129))
   )
   (:action s497_sample-grasp
          :parameters (o7 #p12 #p17 #a130)
          :precondition (isarm #a130 o7 #p12 #p17)
          :effect (and (isgrasp o7 #p12 #p17 #g130 #a130))
   )
   (:action s498_sample-grasp
          :parameters (o7 #p12 #p18 #a131)
          :precondition (isarm #a131 o7 #p12 #p18)
          :effect (and (isgrasp o7 #p12 #p18 #g131 #a131))
   )
   (:action s499_sample-grasp
          :parameters (o7 #p13 p312 #a132)
          :precondition (isarm #a132 o7 #p13 p312)
          :effect (and (isgrasp o7 #p13 p312 #g132 #a132))
   )
   (:action s500_sample-grasp
          :parameters (o7 #p13 #p0 #a133)
          :precondition (isarm #a133 o7 #p13 #p0)
          :effect (and (isgrasp o7 #p13 #p0 #g133 #a133))
   )
   (:action s501_sample-grasp
          :parameters (o7 #p13 #p1 #a134)
          :precondition (isarm #a134 o7 #p13 #p1)
          :effect (and (isgrasp o7 #p13 #p1 #g134 #a134))
   )
   (:action s502_sample-grasp
          :parameters (o7 #p13 #p2 #a135)
          :precondition (isarm #a135 o7 #p13 #p2)
          :effect (and (isgrasp o7 #p13 #p2 #g135 #a135))
   )
   (:action s503_sample-grasp
          :parameters (o7 #p13 #p9 #a136)
          :precondition (isarm #a136 o7 #p13 #p9)
          :effect (and (isgrasp o7 #p13 #p9 #g136 #a136))
   )
   (:action s504_sample-grasp
          :parameters (o7 #p13 #p10 #a137)
          :precondition (isarm #a137 o7 #p13 #p10)
          :effect (and (isgrasp o7 #p13 #p10 #g137 #a137))
   )
   (:action s505_sample-grasp
          :parameters (o7 #p13 #p12 #a138)
          :precondition (isarm #a138 o7 #p13 #p12)
          :effect (and (isgrasp o7 #p13 #p12 #g138 #a138))
   )
   (:action s506_sample-grasp
          :parameters (o7 #p13 #p13 #a139)
          :precondition (isarm #a139 o7 #p13 #p13)
          :effect (and (isgrasp o7 #p13 #p13 #g139 #a139))
   )
   (:action s507_sample-grasp
          :parameters (o7 #p13 #p14 #a140)
          :precondition (isarm #a140 o7 #p13 #p14)
          :effect (and (isgrasp o7 #p13 #p14 #g140 #a140))
   )
   (:action s508_sample-grasp
          :parameters (o7 #p13 #p15 #a141)
          :precondition (isarm #a141 o7 #p13 #p15)
          :effect (and (isgrasp o7 #p13 #p15 #g141 #a141))
   )
   (:action s509_sample-grasp
          :parameters (o7 #p13 #p16 #a142)
          :precondition (isarm #a142 o7 #p13 #p16)
          :effect (and (isgrasp o7 #p13 #p16 #g142 #a142))
   )
   (:action s510_sample-grasp
          :parameters (o7 #p13 #p17 #a143)
          :precondition (isarm #a143 o7 #p13 #p17)
          :effect (and (isgrasp o7 #p13 #p17 #g143 #a143))
   )
   (:action s511_sample-grasp
          :parameters (o7 #p13 #p18 #a144)
          :precondition (isarm #a144 o7 #p13 #p18)
          :effect (and (isgrasp o7 #p13 #p18 #g144 #a144))
   )
   (:action s512_sample-grasp
          :parameters (o7 #p14 p312 #a145)
          :precondition (isarm #a145 o7 #p14 p312)
          :effect (and (isgrasp o7 #p14 p312 #g145 #a145))
   )
   (:action s513_sample-grasp
          :parameters (o7 #p14 #p0 #a146)
          :precondition (isarm #a146 o7 #p14 #p0)
          :effect (and (isgrasp o7 #p14 #p0 #g146 #a146))
   )
   (:action s514_sample-grasp
          :parameters (o7 #p14 #p1 #a147)
          :precondition (isarm #a147 o7 #p14 #p1)
          :effect (and (isgrasp o7 #p14 #p1 #g147 #a147))
   )
   (:action s515_sample-grasp
          :parameters (o7 #p14 #p2 #a148)
          :precondition (isarm #a148 o7 #p14 #p2)
          :effect (and (isgrasp o7 #p14 #p2 #g148 #a148))
   )
   (:action s516_sample-grasp
          :parameters (o7 #p14 #p9 #a149)
          :precondition (isarm #a149 o7 #p14 #p9)
          :effect (and (isgrasp o7 #p14 #p9 #g149 #a149))
   )
   (:action s517_sample-grasp
          :parameters (o7 #p14 #p10 #a150)
          :precondition (isarm #a150 o7 #p14 #p10)
          :effect (and (isgrasp o7 #p14 #p10 #g150 #a150))
   )
   (:action s518_sample-grasp
          :parameters (o7 #p14 #p12 #a151)
          :precondition (isarm #a151 o7 #p14 #p12)
          :effect (and (isgrasp o7 #p14 #p12 #g151 #a151))
   )
   (:action s519_sample-grasp
          :parameters (o7 #p14 #p13 #a152)
          :precondition (isarm #a152 o7 #p14 #p13)
          :effect (and (isgrasp o7 #p14 #p13 #g152 #a152))
   )
   (:action s520_sample-grasp
          :parameters (o7 #p14 #p14 #a153)
          :precondition (isarm #a153 o7 #p14 #p14)
          :effect (and (isgrasp o7 #p14 #p14 #g153 #a153))
   )
   (:action s521_sample-grasp
          :parameters (o7 #p14 #p15 #a154)
          :precondition (isarm #a154 o7 #p14 #p15)
          :effect (and (isgrasp o7 #p14 #p15 #g154 #a154))
   )
   (:action s522_sample-grasp
          :parameters (o7 #p14 #p16 #a155)
          :precondition (isarm #a155 o7 #p14 #p16)
          :effect (and (isgrasp o7 #p14 #p16 #g155 #a155))
   )
   (:action s523_sample-grasp
          :parameters (o7 #p14 #p17 #a156)
          :precondition (isarm #a156 o7 #p14 #p17)
          :effect (and (isgrasp o7 #p14 #p17 #g156 #a156))
   )
   (:action s524_sample-grasp
          :parameters (o7 #p14 #p18 #a157)
          :precondition (isarm #a157 o7 #p14 #p18)
          :effect (and (isgrasp o7 #p14 #p18 #g157 #a157))
   )
   (:action s525_sample-grasp
          :parameters (o7 #p15 p312 #a158)
          :precondition (isarm #a158 o7 #p15 p312)
          :effect (and (isgrasp o7 #p15 p312 #g158 #a158))
   )
   (:action s526_sample-grasp
          :parameters (o7 #p15 #p0 #a159)
          :precondition (isarm #a159 o7 #p15 #p0)
          :effect (and (isgrasp o7 #p15 #p0 #g159 #a159))
   )
   (:action s527_sample-grasp
          :parameters (o7 #p15 #p1 #a160)
          :precondition (isarm #a160 o7 #p15 #p1)
          :effect (and (isgrasp o7 #p15 #p1 #g160 #a160))
   )
   (:action s528_sample-grasp
          :parameters (o7 #p15 #p2 #a161)
          :precondition (isarm #a161 o7 #p15 #p2)
          :effect (and (isgrasp o7 #p15 #p2 #g161 #a161))
   )
   (:action s529_sample-grasp
          :parameters (o7 #p15 #p9 #a162)
          :precondition (isarm #a162 o7 #p15 #p9)
          :effect (and (isgrasp o7 #p15 #p9 #g162 #a162))
   )
   (:action s530_sample-grasp
          :parameters (o7 #p15 #p10 #a163)
          :precondition (isarm #a163 o7 #p15 #p10)
          :effect (and (isgrasp o7 #p15 #p10 #g163 #a163))
   )
   (:action s531_sample-grasp
          :parameters (o7 #p15 #p12 #a164)
          :precondition (isarm #a164 o7 #p15 #p12)
          :effect (and (isgrasp o7 #p15 #p12 #g164 #a164))
   )
   (:action s532_sample-grasp
          :parameters (o7 #p15 #p13 #a165)
          :precondition (isarm #a165 o7 #p15 #p13)
          :effect (and (isgrasp o7 #p15 #p13 #g165 #a165))
   )
   (:action s533_sample-grasp
          :parameters (o7 #p15 #p14 #a166)
          :precondition (isarm #a166 o7 #p15 #p14)
          :effect (and (isgrasp o7 #p15 #p14 #g166 #a166))
   )
   (:action s534_sample-grasp
          :parameters (o7 #p15 #p15 #a167)
          :precondition (isarm #a167 o7 #p15 #p15)
          :effect (and (isgrasp o7 #p15 #p15 #g167 #a167))
   )
   (:action s535_sample-grasp
          :parameters (o7 #p15 #p16 #a168)
          :precondition (isarm #a168 o7 #p15 #p16)
          :effect (and (isgrasp o7 #p15 #p16 #g168 #a168))
   )
   (:action s536_sample-grasp
          :parameters (o7 #p15 #p17 #a169)
          :precondition (isarm #a169 o7 #p15 #p17)
          :effect (and (isgrasp o7 #p15 #p17 #g169 #a169))
   )
   (:action s537_sample-grasp
          :parameters (o7 #p15 #p18 #a170)
          :precondition (isarm #a170 o7 #p15 #p18)
          :effect (and (isgrasp o7 #p15 #p18 #g170 #a170))
   )
   (:action s538_sample-grasp
          :parameters (o7 #p16 p312 #a171)
          :precondition (isarm #a171 o7 #p16 p312)
          :effect (and (isgrasp o7 #p16 p312 #g171 #a171))
   )
   (:action s539_sample-grasp
          :parameters (o7 #p16 #p0 #a172)
          :precondition (isarm #a172 o7 #p16 #p0)
          :effect (and (isgrasp o7 #p16 #p0 #g172 #a172))
   )
   (:action s540_sample-grasp
          :parameters (o7 #p16 #p1 #a173)
          :precondition (isarm #a173 o7 #p16 #p1)
          :effect (and (isgrasp o7 #p16 #p1 #g173 #a173))
   )
   (:action s541_sample-grasp
          :parameters (o7 #p16 #p2 #a174)
          :precondition (isarm #a174 o7 #p16 #p2)
          :effect (and (isgrasp o7 #p16 #p2 #g174 #a174))
   )
   (:action s542_sample-grasp
          :parameters (o7 #p16 #p9 #a175)
          :precondition (isarm #a175 o7 #p16 #p9)
          :effect (and (isgrasp o7 #p16 #p9 #g175 #a175))
   )
   (:action s543_sample-grasp
          :parameters (o7 #p16 #p10 #a176)
          :precondition (isarm #a176 o7 #p16 #p10)
          :effect (and (isgrasp o7 #p16 #p10 #g176 #a176))
   )
   (:action s544_sample-grasp
          :parameters (o7 #p16 #p12 #a177)
          :precondition (isarm #a177 o7 #p16 #p12)
          :effect (and (isgrasp o7 #p16 #p12 #g177 #a177))
   )
   (:action s545_sample-grasp
          :parameters (o7 #p16 #p13 #a178)
          :precondition (isarm #a178 o7 #p16 #p13)
          :effect (and (isgrasp o7 #p16 #p13 #g178 #a178))
   )
   (:action s546_sample-grasp
          :parameters (o7 #p16 #p14 #a179)
          :precondition (isarm #a179 o7 #p16 #p14)
          :effect (and (isgrasp o7 #p16 #p14 #g179 #a179))
   )
   (:action s547_sample-grasp
          :parameters (o7 #p16 #p15 #a180)
          :precondition (isarm #a180 o7 #p16 #p15)
          :effect (and (isgrasp o7 #p16 #p15 #g180 #a180))
   )
   (:action s548_sample-grasp
          :parameters (o7 #p16 #p16 #a181)
          :precondition (isarm #a181 o7 #p16 #p16)
          :effect (and (isgrasp o7 #p16 #p16 #g181 #a181))
   )
   (:action s549_sample-grasp
          :parameters (o7 #p16 #p17 #a182)
          :precondition (isarm #a182 o7 #p16 #p17)
          :effect (and (isgrasp o7 #p16 #p17 #g182 #a182))
   )
   (:action s550_sample-grasp
          :parameters (o7 #p16 #p18 #a183)
          :precondition (isarm #a183 o7 #p16 #p18)
          :effect (and (isgrasp o7 #p16 #p18 #g183 #a183))
   )
   (:action s551_sample-grasp
          :parameters (o7 #p17 p312 #a184)
          :precondition (isarm #a184 o7 #p17 p312)
          :effect (and (isgrasp o7 #p17 p312 #g184 #a184))
   )
   (:action s552_sample-grasp
          :parameters (o7 #p17 #p0 #a185)
          :precondition (isarm #a185 o7 #p17 #p0)
          :effect (and (isgrasp o7 #p17 #p0 #g185 #a185))
   )
   (:action s553_sample-grasp
          :parameters (o7 #p17 #p1 #a186)
          :precondition (isarm #a186 o7 #p17 #p1)
          :effect (and (isgrasp o7 #p17 #p1 #g186 #a186))
   )
   (:action s554_sample-grasp
          :parameters (o7 #p17 #p2 #a187)
          :precondition (isarm #a187 o7 #p17 #p2)
          :effect (and (isgrasp o7 #p17 #p2 #g187 #a187))
   )
   (:action s555_sample-grasp
          :parameters (o7 #p17 #p9 #a188)
          :precondition (isarm #a188 o7 #p17 #p9)
          :effect (and (isgrasp o7 #p17 #p9 #g188 #a188))
   )
   (:action s556_sample-grasp
          :parameters (o7 #p17 #p10 #a189)
          :precondition (isarm #a189 o7 #p17 #p10)
          :effect (and (isgrasp o7 #p17 #p10 #g189 #a189))
   )
   (:action s557_sample-grasp
          :parameters (o7 #p17 #p12 #a190)
          :precondition (isarm #a190 o7 #p17 #p12)
          :effect (and (isgrasp o7 #p17 #p12 #g190 #a190))
   )
   (:action s558_sample-grasp
          :parameters (o7 #p17 #p13 #a191)
          :precondition (isarm #a191 o7 #p17 #p13)
          :effect (and (isgrasp o7 #p17 #p13 #g191 #a191))
   )
   (:action s559_sample-grasp
          :parameters (o7 #p17 #p14 #a192)
          :precondition (isarm #a192 o7 #p17 #p14)
          :effect (and (isgrasp o7 #p17 #p14 #g192 #a192))
   )
   (:action s560_sample-grasp
          :parameters (o7 #p17 #p15 #a193)
          :precondition (isarm #a193 o7 #p17 #p15)
          :effect (and (isgrasp o7 #p17 #p15 #g193 #a193))
   )
   (:action s561_sample-grasp
          :parameters (o7 #p17 #p16 #a194)
          :precondition (isarm #a194 o7 #p17 #p16)
          :effect (and (isgrasp o7 #p17 #p16 #g194 #a194))
   )
   (:action s562_sample-grasp
          :parameters (o7 #p17 #p17 #a195)
          :precondition (isarm #a195 o7 #p17 #p17)
          :effect (and (isgrasp o7 #p17 #p17 #g195 #a195))
   )
   (:action s563_sample-grasp
          :parameters (o7 #p17 #p18 #a196)
          :precondition (isarm #a196 o7 #p17 #p18)
          :effect (and (isgrasp o7 #p17 #p18 #g196 #a196))
   )
   (:action s564_sample-grasp
          :parameters (o7 #p18 p312 #a197)
          :precondition (isarm #a197 o7 #p18 p312)
          :effect (and (isgrasp o7 #p18 p312 #g197 #a197))
   )
   (:action s565_sample-grasp
          :parameters (o7 #p18 #p0 #a198)
          :precondition (isarm #a198 o7 #p18 #p0)
          :effect (and (isgrasp o7 #p18 #p0 #g198 #a198))
   )
   (:action s566_sample-grasp
          :parameters (o7 #p18 #p1 #a199)
          :precondition (isarm #a199 o7 #p18 #p1)
          :effect (and (isgrasp o7 #p18 #p1 #g199 #a199))
   )
   (:action s567_sample-grasp
          :parameters (o7 #p18 #p2 #a200)
          :precondition (isarm #a200 o7 #p18 #p2)
          :effect (and (isgrasp o7 #p18 #p2 #g200 #a200))
   )
   (:action s568_sample-grasp
          :parameters (o7 #p18 #p9 #a201)
          :precondition (isarm #a201 o7 #p18 #p9)
          :effect (and (isgrasp o7 #p18 #p9 #g201 #a201))
   )
   (:action s569_sample-grasp
          :parameters (o7 #p18 #p10 #a202)
          :precondition (isarm #a202 o7 #p18 #p10)
          :effect (and (isgrasp o7 #p18 #p10 #g202 #a202))
   )
   (:action s570_sample-grasp
          :parameters (o7 #p18 #p12 #a203)
          :precondition (isarm #a203 o7 #p18 #p12)
          :effect (and (isgrasp o7 #p18 #p12 #g203 #a203))
   )
   (:action s571_sample-grasp
          :parameters (o7 #p18 #p13 #a204)
          :precondition (isarm #a204 o7 #p18 #p13)
          :effect (and (isgrasp o7 #p18 #p13 #g204 #a204))
   )
   (:action s572_sample-grasp
          :parameters (o7 #p18 #p14 #a205)
          :precondition (isarm #a205 o7 #p18 #p14)
          :effect (and (isgrasp o7 #p18 #p14 #g205 #a205))
   )
   (:action s573_sample-grasp
          :parameters (o7 #p18 #p15 #a206)
          :precondition (isarm #a206 o7 #p18 #p15)
          :effect (and (isgrasp o7 #p18 #p15 #g206 #a206))
   )
   (:action s574_sample-grasp
          :parameters (o7 #p18 #p16 #a207)
          :precondition (isarm #a207 o7 #p18 #p16)
          :effect (and (isgrasp o7 #p18 #p16 #g207 #a207))
   )
   (:action s575_sample-grasp
          :parameters (o7 #p18 #p17 #a208)
          :precondition (isarm #a208 o7 #p18 #p17)
          :effect (and (isgrasp o7 #p18 #p17 #g208 #a208))
   )
   (:action s576_sample-grasp
          :parameters (o7 #p18 #p18 #a209)
          :precondition (isarm #a209 o7 #p18 #p18)
          :effect (and (isgrasp o7 #p18 #p18 #g209 #a209))
   )
   (:action s577_sample-grasp
          :parameters (o8 p368 #p19 #a210)
          :precondition (isarm #a210 o8 p368 #p19)
          :effect (and (isgrasp o8 p368 #p19 #g210 #a210))
   )
   (:action s578_sample-grasp
          :parameters (o8 p368 #p20 #a211)
          :precondition (isarm #a211 o8 p368 #p20)
          :effect (and (isgrasp o8 p368 #p20 #g211 #a211))
   )
   (:action s579_sample-grasp
          :parameters (o8 p368 #p21 #a212)
          :precondition (isarm #a212 o8 p368 #p21)
          :effect (and (isgrasp o8 p368 #p21 #g212 #a212))
   )
   (:action s580_sample-grasp
          :parameters (o8 #p3 #p19 #a213)
          :precondition (isarm #a213 o8 #p3 #p19)
          :effect (and (isgrasp o8 #p3 #p19 #g213 #a213))
   )
   (:action s581_sample-grasp
          :parameters (o8 #p3 #p20 #a214)
          :precondition (isarm #a214 o8 #p3 #p20)
          :effect (and (isgrasp o8 #p3 #p20 #g214 #a214))
   )
   (:action s582_sample-grasp
          :parameters (o8 #p3 #p21 #a215)
          :precondition (isarm #a215 o8 #p3 #p21)
          :effect (and (isgrasp o8 #p3 #p21 #g215 #a215))
   )
   (:action s583_sample-grasp
          :parameters (o8 #p4 #p19 #a216)
          :precondition (isarm #a216 o8 #p4 #p19)
          :effect (and (isgrasp o8 #p4 #p19 #g216 #a216))
   )
   (:action s584_sample-grasp
          :parameters (o8 #p4 #p20 #a217)
          :precondition (isarm #a217 o8 #p4 #p20)
          :effect (and (isgrasp o8 #p4 #p20 #g217 #a217))
   )
   (:action s585_sample-grasp
          :parameters (o8 #p4 #p21 #a218)
          :precondition (isarm #a218 o8 #p4 #p21)
          :effect (and (isgrasp o8 #p4 #p21 #g218 #a218))
   )
   (:action s586_sample-grasp
          :parameters (o8 #p5 #p19 #a219)
          :precondition (isarm #a219 o8 #p5 #p19)
          :effect (and (isgrasp o8 #p5 #p19 #g219 #a219))
   )
   (:action s587_sample-grasp
          :parameters (o8 #p5 #p20 #a220)
          :precondition (isarm #a220 o8 #p5 #p20)
          :effect (and (isgrasp o8 #p5 #p20 #g220 #a220))
   )
   (:action s588_sample-grasp
          :parameters (o8 #p5 #p21 #a221)
          :precondition (isarm #a221 o8 #p5 #p21)
          :effect (and (isgrasp o8 #p5 #p21 #g221 #a221))
   )
   (:action s589_sample-grasp
          :parameters (o8 #p11 #p19 #a222)
          :precondition (isarm #a222 o8 #p11 #p19)
          :effect (and (isgrasp o8 #p11 #p19 #g222 #a222))
   )
   (:action s590_sample-grasp
          :parameters (o8 #p11 #p20 #a223)
          :precondition (isarm #a223 o8 #p11 #p20)
          :effect (and (isgrasp o8 #p11 #p20 #g223 #a223))
   )
   (:action s591_sample-grasp
          :parameters (o8 #p11 #p21 #a224)
          :precondition (isarm #a224 o8 #p11 #p21)
          :effect (and (isgrasp o8 #p11 #p21 #g224 #a224))
   )
   (:action s592_sample-grasp
          :parameters (o8 #p19 p368 #a225)
          :precondition (isarm #a225 o8 #p19 p368)
          :effect (and (isgrasp o8 #p19 p368 #g225 #a225))
   )
   (:action s593_sample-grasp
          :parameters (o8 #p19 #p3 #a226)
          :precondition (isarm #a226 o8 #p19 #p3)
          :effect (and (isgrasp o8 #p19 #p3 #g226 #a226))
   )
   (:action s594_sample-grasp
          :parameters (o8 #p19 #p4 #a227)
          :precondition (isarm #a227 o8 #p19 #p4)
          :effect (and (isgrasp o8 #p19 #p4 #g227 #a227))
   )
   (:action s595_sample-grasp
          :parameters (o8 #p19 #p5 #a228)
          :precondition (isarm #a228 o8 #p19 #p5)
          :effect (and (isgrasp o8 #p19 #p5 #g228 #a228))
   )
   (:action s596_sample-grasp
          :parameters (o8 #p19 #p11 #a229)
          :precondition (isarm #a229 o8 #p19 #p11)
          :effect (and (isgrasp o8 #p19 #p11 #g229 #a229))
   )
   (:action s597_sample-grasp
          :parameters (o8 #p19 #p19 #a230)
          :precondition (isarm #a230 o8 #p19 #p19)
          :effect (and (isgrasp o8 #p19 #p19 #g230 #a230))
   )
   (:action s598_sample-grasp
          :parameters (o8 #p19 #p20 #a231)
          :precondition (isarm #a231 o8 #p19 #p20)
          :effect (and (isgrasp o8 #p19 #p20 #g231 #a231))
   )
   (:action s599_sample-grasp
          :parameters (o8 #p19 #p21 #a232)
          :precondition (isarm #a232 o8 #p19 #p21)
          :effect (and (isgrasp o8 #p19 #p21 #g232 #a232))
   )
   (:action s600_sample-grasp
          :parameters (o8 #p20 p368 #a233)
          :precondition (isarm #a233 o8 #p20 p368)
          :effect (and (isgrasp o8 #p20 p368 #g233 #a233))
   )
   (:action s601_sample-grasp
          :parameters (o8 #p20 #p3 #a234)
          :precondition (isarm #a234 o8 #p20 #p3)
          :effect (and (isgrasp o8 #p20 #p3 #g234 #a234))
   )
   (:action s602_sample-grasp
          :parameters (o8 #p20 #p4 #a235)
          :precondition (isarm #a235 o8 #p20 #p4)
          :effect (and (isgrasp o8 #p20 #p4 #g235 #a235))
   )
   (:action s603_sample-grasp
          :parameters (o8 #p20 #p5 #a236)
          :precondition (isarm #a236 o8 #p20 #p5)
          :effect (and (isgrasp o8 #p20 #p5 #g236 #a236))
   )
   (:action s604_sample-grasp
          :parameters (o8 #p20 #p11 #a237)
          :precondition (isarm #a237 o8 #p20 #p11)
          :effect (and (isgrasp o8 #p20 #p11 #g237 #a237))
   )
   (:action s605_sample-grasp
          :parameters (o8 #p20 #p19 #a238)
          :precondition (isarm #a238 o8 #p20 #p19)
          :effect (and (isgrasp o8 #p20 #p19 #g238 #a238))
   )
   (:action s606_sample-grasp
          :parameters (o8 #p20 #p20 #a239)
          :precondition (isarm #a239 o8 #p20 #p20)
          :effect (and (isgrasp o8 #p20 #p20 #g239 #a239))
   )
   (:action s607_sample-grasp
          :parameters (o8 #p20 #p21 #a240)
          :precondition (isarm #a240 o8 #p20 #p21)
          :effect (and (isgrasp o8 #p20 #p21 #g240 #a240))
   )
   (:action s608_sample-grasp
          :parameters (o8 #p21 p368 #a241)
          :precondition (isarm #a241 o8 #p21 p368)
          :effect (and (isgrasp o8 #p21 p368 #g241 #a241))
   )
   (:action s609_sample-grasp
          :parameters (o8 #p21 #p3 #a242)
          :precondition (isarm #a242 o8 #p21 #p3)
          :effect (and (isgrasp o8 #p21 #p3 #g242 #a242))
   )
   (:action s610_sample-grasp
          :parameters (o8 #p21 #p4 #a243)
          :precondition (isarm #a243 o8 #p21 #p4)
          :effect (and (isgrasp o8 #p21 #p4 #g243 #a243))
   )
   (:action s611_sample-grasp
          :parameters (o8 #p21 #p5 #a244)
          :precondition (isarm #a244 o8 #p21 #p5)
          :effect (and (isgrasp o8 #p21 #p5 #g244 #a244))
   )
   (:action s612_sample-grasp
          :parameters (o8 #p21 #p11 #a245)
          :precondition (isarm #a245 o8 #p21 #p11)
          :effect (and (isgrasp o8 #p21 #p11 #g245 #a245))
   )
   (:action s613_sample-grasp
          :parameters (o8 #p21 #p19 #a246)
          :precondition (isarm #a246 o8 #p21 #p19)
          :effect (and (isgrasp o8 #p21 #p19 #g246 #a246))
   )
   (:action s614_sample-grasp
          :parameters (o8 #p21 #p20 #a247)
          :precondition (isarm #a247 o8 #p21 #p20)
          :effect (and (isgrasp o8 #p21 #p20 #g247 #a247))
   )
   (:action s615_sample-grasp
          :parameters (o8 #p21 #p21 #a248)
          :precondition (isarm #a248 o8 #p21 #p21)
          :effect (and (isgrasp o8 #p21 #p21 #g248 #a248))
   )
   (:action s616_ik-arm-motion-from
          :parameters (o7 p312 #p0 #g3 #a3)
          :precondition (and (isgrasp o7 p312 #p0 #g3 #a3))
          :effect (kinfrom o7 p312 #g3 #a3 #t6)
   )
   (:action s617_ik-arm-motion-from
          :parameters (o7 p312 #p1 #g4 #a4)
          :precondition (and (isgrasp o7 p312 #p1 #g4 #a4))
          :effect (kinfrom o7 p312 #g4 #a4 #t7)
   )
   (:action s618_ik-arm-motion-from
          :parameters (o7 p312 #p2 #g5 #a5)
          :precondition (and (isgrasp o7 p312 #p2 #g5 #a5))
          :effect (kinfrom o7 p312 #g5 #a5 #t8)
   )
   (:action s619_ik-arm-motion-from
          :parameters (o7 p312 #p9 #g6 #a6)
          :precondition (and (isgrasp o7 p312 #p9 #g6 #a6))
          :effect (kinfrom o7 p312 #g6 #a6 #t9)
   )
   (:action s620_ik-arm-motion-from
          :parameters (o7 p312 #p10 #g7 #a7)
          :precondition (and (isgrasp o7 p312 #p10 #g7 #a7))
          :effect (kinfrom o7 p312 #g7 #a7 #t10)
   )
   (:action s621_ik-arm-motion-from
          :parameters (o7 #p0 p312 #g8 #a8)
          :precondition (and (isgrasp o7 #p0 p312 #g8 #a8))
          :effect (kinfrom o7 #p0 #g8 #a8 #t11)
   )
   (:action s622_ik-arm-motion-from
          :parameters (o7 #p0 #p0 #g9 #a9)
          :precondition (and (isgrasp o7 #p0 #p0 #g9 #a9))
          :effect (kinfrom o7 #p0 #g9 #a9 #t12)
   )
   (:action s623_ik-arm-motion-from
          :parameters (o7 #p0 #p1 #g10 #a10)
          :precondition (and (isgrasp o7 #p0 #p1 #g10 #a10))
          :effect (kinfrom o7 #p0 #g10 #a10 #t13)
   )
   (:action s624_ik-arm-motion-from
          :parameters (o7 #p0 #p2 #g11 #a11)
          :precondition (and (isgrasp o7 #p0 #p2 #g11 #a11))
          :effect (kinfrom o7 #p0 #g11 #a11 #t14)
   )
   (:action s625_ik-arm-motion-from
          :parameters (o7 #p0 #p9 #g12 #a12)
          :precondition (and (isgrasp o7 #p0 #p9 #g12 #a12))
          :effect (kinfrom o7 #p0 #g12 #a12 #t15)
   )
   (:action s626_ik-arm-motion-from
          :parameters (o7 #p0 #p10 #g13 #a13)
          :precondition (and (isgrasp o7 #p0 #p10 #g13 #a13))
          :effect (kinfrom o7 #p0 #g13 #a13 #t16)
   )
   (:action s627_ik-arm-motion-from
          :parameters (o7 #p1 p312 #g14 #a14)
          :precondition (and (isgrasp o7 #p1 p312 #g14 #a14))
          :effect (kinfrom o7 #p1 #g14 #a14 #t17)
   )
   (:action s628_ik-arm-motion-from
          :parameters (o7 #p1 #p0 #g15 #a15)
          :precondition (and (isgrasp o7 #p1 #p0 #g15 #a15))
          :effect (kinfrom o7 #p1 #g15 #a15 #t18)
   )
   (:action s629_ik-arm-motion-from
          :parameters (o7 #p1 #p1 #g16 #a16)
          :precondition (and (isgrasp o7 #p1 #p1 #g16 #a16))
          :effect (kinfrom o7 #p1 #g16 #a16 #t19)
   )
   (:action s630_ik-arm-motion-from
          :parameters (o7 #p1 #p2 #g17 #a17)
          :precondition (and (isgrasp o7 #p1 #p2 #g17 #a17))
          :effect (kinfrom o7 #p1 #g17 #a17 #t20)
   )
   (:action s631_ik-arm-motion-from
          :parameters (o7 #p1 #p9 #g18 #a18)
          :precondition (and (isgrasp o7 #p1 #p9 #g18 #a18))
          :effect (kinfrom o7 #p1 #g18 #a18 #t21)
   )
   (:action s632_ik-arm-motion-from
          :parameters (o7 #p1 #p10 #g19 #a19)
          :precondition (and (isgrasp o7 #p1 #p10 #g19 #a19))
          :effect (kinfrom o7 #p1 #g19 #a19 #t22)
   )
   (:action s633_ik-arm-motion-from
          :parameters (o7 #p2 p312 #g20 #a20)
          :precondition (and (isgrasp o7 #p2 p312 #g20 #a20))
          :effect (kinfrom o7 #p2 #g20 #a20 #t23)
   )
   (:action s634_ik-arm-motion-from
          :parameters (o7 #p2 #p0 #g21 #a21)
          :precondition (and (isgrasp o7 #p2 #p0 #g21 #a21))
          :effect (kinfrom o7 #p2 #g21 #a21 #t24)
   )
   (:action s635_ik-arm-motion-from
          :parameters (o7 #p2 #p1 #g22 #a22)
          :precondition (and (isgrasp o7 #p2 #p1 #g22 #a22))
          :effect (kinfrom o7 #p2 #g22 #a22 #t25)
   )
   (:action s636_ik-arm-motion-from
          :parameters (o7 #p2 #p2 #g23 #a23)
          :precondition (and (isgrasp o7 #p2 #p2 #g23 #a23))
          :effect (kinfrom o7 #p2 #g23 #a23 #t26)
   )
   (:action s637_ik-arm-motion-from
          :parameters (o7 #p2 #p9 #g24 #a24)
          :precondition (and (isgrasp o7 #p2 #p9 #g24 #a24))
          :effect (kinfrom o7 #p2 #g24 #a24 #t27)
   )
   (:action s638_ik-arm-motion-from
          :parameters (o7 #p2 #p10 #g25 #a25)
          :precondition (and (isgrasp o7 #p2 #p10 #g25 #a25))
          :effect (kinfrom o7 #p2 #g25 #a25 #t28)
   )
   (:action s639_ik-arm-motion-from
          :parameters (o7 #p9 p312 #g26 #a26)
          :precondition (and (isgrasp o7 #p9 p312 #g26 #a26))
          :effect (kinfrom o7 #p9 #g26 #a26 #t29)
   )
   (:action s640_ik-arm-motion-from
          :parameters (o7 #p9 #p0 #g27 #a27)
          :precondition (and (isgrasp o7 #p9 #p0 #g27 #a27))
          :effect (kinfrom o7 #p9 #g27 #a27 #t30)
   )
   (:action s641_ik-arm-motion-from
          :parameters (o7 #p9 #p1 #g28 #a28)
          :precondition (and (isgrasp o7 #p9 #p1 #g28 #a28))
          :effect (kinfrom o7 #p9 #g28 #a28 #t31)
   )
   (:action s642_ik-arm-motion-from
          :parameters (o7 #p9 #p2 #g29 #a29)
          :precondition (and (isgrasp o7 #p9 #p2 #g29 #a29))
          :effect (kinfrom o7 #p9 #g29 #a29 #t32)
   )
   (:action s643_ik-arm-motion-from
          :parameters (o7 #p9 #p9 #g30 #a30)
          :precondition (and (isgrasp o7 #p9 #p9 #g30 #a30))
          :effect (kinfrom o7 #p9 #g30 #a30 #t33)
   )
   (:action s644_ik-arm-motion-from
          :parameters (o7 #p9 #p10 #g31 #a31)
          :precondition (and (isgrasp o7 #p9 #p10 #g31 #a31))
          :effect (kinfrom o7 #p9 #g31 #a31 #t34)
   )
   (:action s645_ik-arm-motion-from
          :parameters (o7 #p10 p312 #g32 #a32)
          :precondition (and (isgrasp o7 #p10 p312 #g32 #a32))
          :effect (kinfrom o7 #p10 #g32 #a32 #t35)
   )
   (:action s646_ik-arm-motion-from
          :parameters (o7 #p10 #p0 #g33 #a33)
          :precondition (and (isgrasp o7 #p10 #p0 #g33 #a33))
          :effect (kinfrom o7 #p10 #g33 #a33 #t36)
   )
   (:action s647_ik-arm-motion-from
          :parameters (o7 #p10 #p1 #g34 #a34)
          :precondition (and (isgrasp o7 #p10 #p1 #g34 #a34))
          :effect (kinfrom o7 #p10 #g34 #a34 #t37)
   )
   (:action s648_ik-arm-motion-from
          :parameters (o7 #p10 #p2 #g35 #a35)
          :precondition (and (isgrasp o7 #p10 #p2 #g35 #a35))
          :effect (kinfrom o7 #p10 #g35 #a35 #t38)
   )
   (:action s649_ik-arm-motion-from
          :parameters (o7 #p10 #p9 #g36 #a36)
          :precondition (and (isgrasp o7 #p10 #p9 #g36 #a36))
          :effect (kinfrom o7 #p10 #g36 #a36 #t39)
   )
   (:action s650_ik-arm-motion-from
          :parameters (o7 #p10 #p10 #g37 #a37)
          :precondition (and (isgrasp o7 #p10 #p10 #g37 #a37))
          :effect (kinfrom o7 #p10 #g37 #a37 #t40)
   )
   (:action s651_ik-arm-motion-from
          :parameters (o8 p368 #p3 #g38 #a38)
          :precondition (and (isgrasp o8 p368 #p3 #g38 #a38))
          :effect (kinfrom o8 p368 #g38 #a38 #t41)
   )
   (:action s652_ik-arm-motion-from
          :parameters (o8 p368 #p4 #g39 #a39)
          :precondition (and (isgrasp o8 p368 #p4 #g39 #a39))
          :effect (kinfrom o8 p368 #g39 #a39 #t42)
   )
   (:action s653_ik-arm-motion-from
          :parameters (o8 p368 #p5 #g40 #a40)
          :precondition (and (isgrasp o8 p368 #p5 #g40 #a40))
          :effect (kinfrom o8 p368 #g40 #a40 #t43)
   )
   (:action s654_ik-arm-motion-from
          :parameters (o8 p368 #p11 #g41 #a41)
          :precondition (and (isgrasp o8 p368 #p11 #g41 #a41))
          :effect (kinfrom o8 p368 #g41 #a41 #t44)
   )
   (:action s655_ik-arm-motion-from
          :parameters (o8 #p3 p368 #g42 #a42)
          :precondition (and (isgrasp o8 #p3 p368 #g42 #a42))
          :effect (kinfrom o8 #p3 #g42 #a42 #t45)
   )
   (:action s656_ik-arm-motion-from
          :parameters (o8 #p3 #p3 #g43 #a43)
          :precondition (and (isgrasp o8 #p3 #p3 #g43 #a43))
          :effect (kinfrom o8 #p3 #g43 #a43 #t46)
   )
   (:action s657_ik-arm-motion-from
          :parameters (o8 #p3 #p4 #g44 #a44)
          :precondition (and (isgrasp o8 #p3 #p4 #g44 #a44))
          :effect (kinfrom o8 #p3 #g44 #a44 #t47)
   )
   (:action s658_ik-arm-motion-from
          :parameters (o8 #p3 #p5 #g45 #a45)
          :precondition (and (isgrasp o8 #p3 #p5 #g45 #a45))
          :effect (kinfrom o8 #p3 #g45 #a45 #t48)
   )
   (:action s659_ik-arm-motion-from
          :parameters (o8 #p3 #p11 #g46 #a46)
          :precondition (and (isgrasp o8 #p3 #p11 #g46 #a46))
          :effect (kinfrom o8 #p3 #g46 #a46 #t49)
   )
   (:action s660_ik-arm-motion-from
          :parameters (o8 #p4 p368 #g47 #a47)
          :precondition (and (isgrasp o8 #p4 p368 #g47 #a47))
          :effect (kinfrom o8 #p4 #g47 #a47 #t50)
   )
   (:action s661_ik-arm-motion-from
          :parameters (o8 #p4 #p3 #g48 #a48)
          :precondition (and (isgrasp o8 #p4 #p3 #g48 #a48))
          :effect (kinfrom o8 #p4 #g48 #a48 #t51)
   )
   (:action s662_ik-arm-motion-from
          :parameters (o8 #p4 #p4 #g49 #a49)
          :precondition (and (isgrasp o8 #p4 #p4 #g49 #a49))
          :effect (kinfrom o8 #p4 #g49 #a49 #t52)
   )
   (:action s663_ik-arm-motion-from
          :parameters (o8 #p4 #p5 #g50 #a50)
          :precondition (and (isgrasp o8 #p4 #p5 #g50 #a50))
          :effect (kinfrom o8 #p4 #g50 #a50 #t53)
   )
   (:action s664_ik-arm-motion-from
          :parameters (o8 #p4 #p11 #g51 #a51)
          :precondition (and (isgrasp o8 #p4 #p11 #g51 #a51))
          :effect (kinfrom o8 #p4 #g51 #a51 #t54)
   )
   (:action s665_ik-arm-motion-from
          :parameters (o8 #p5 p368 #g52 #a52)
          :precondition (and (isgrasp o8 #p5 p368 #g52 #a52))
          :effect (kinfrom o8 #p5 #g52 #a52 #t55)
   )
   (:action s666_ik-arm-motion-from
          :parameters (o8 #p5 #p3 #g53 #a53)
          :precondition (and (isgrasp o8 #p5 #p3 #g53 #a53))
          :effect (kinfrom o8 #p5 #g53 #a53 #t56)
   )
   (:action s667_ik-arm-motion-from
          :parameters (o8 #p5 #p4 #g54 #a54)
          :precondition (and (isgrasp o8 #p5 #p4 #g54 #a54))
          :effect (kinfrom o8 #p5 #g54 #a54 #t57)
   )
   (:action s668_ik-arm-motion-from
          :parameters (o8 #p5 #p5 #g55 #a55)
          :precondition (and (isgrasp o8 #p5 #p5 #g55 #a55))
          :effect (kinfrom o8 #p5 #g55 #a55 #t58)
   )
   (:action s669_ik-arm-motion-from
          :parameters (o8 #p5 #p11 #g56 #a56)
          :precondition (and (isgrasp o8 #p5 #p11 #g56 #a56))
          :effect (kinfrom o8 #p5 #g56 #a56 #t59)
   )
   (:action s670_ik-arm-motion-from
          :parameters (o8 #p11 p368 #g57 #a57)
          :precondition (and (isgrasp o8 #p11 p368 #g57 #a57))
          :effect (kinfrom o8 #p11 #g57 #a57 #t60)
   )
   (:action s671_ik-arm-motion-from
          :parameters (o8 #p11 #p3 #g58 #a58)
          :precondition (and (isgrasp o8 #p11 #p3 #g58 #a58))
          :effect (kinfrom o8 #p11 #g58 #a58 #t61)
   )
   (:action s672_ik-arm-motion-from
          :parameters (o8 #p11 #p4 #g59 #a59)
          :precondition (and (isgrasp o8 #p11 #p4 #g59 #a59))
          :effect (kinfrom o8 #p11 #g59 #a59 #t62)
   )
   (:action s673_ik-arm-motion-from
          :parameters (o8 #p11 #p5 #g60 #a60)
          :precondition (and (isgrasp o8 #p11 #p5 #g60 #a60))
          :effect (kinfrom o8 #p11 #g60 #a60 #t63)
   )
   (:action s674_ik-arm-motion-from
          :parameters (o8 #p11 #p11 #g61 #a61)
          :precondition (and (isgrasp o8 #p11 #p11 #g61 #a61))
          :effect (kinfrom o8 #p11 #g61 #a61 #t64)
   )
   (:action s675_ik-arm-motion-from
          :parameters (o9 p424 #p6 #g62 #a62)
          :precondition (and (isgrasp o9 p424 #p6 #g62 #a62))
          :effect (kinfrom o9 p424 #g62 #a62 #t65)
   )
   (:action s676_ik-arm-motion-from
          :parameters (o9 p424 #p7 #g63 #a63)
          :precondition (and (isgrasp o9 p424 #p7 #g63 #a63))
          :effect (kinfrom o9 p424 #g63 #a63 #t66)
   )
   (:action s677_ik-arm-motion-from
          :parameters (o9 p424 #p8 #g64 #a64)
          :precondition (and (isgrasp o9 p424 #p8 #g64 #a64))
          :effect (kinfrom o9 p424 #g64 #a64 #t67)
   )
   (:action s678_ik-arm-motion-from
          :parameters (o9 #p6 p424 #g65 #a65)
          :precondition (and (isgrasp o9 #p6 p424 #g65 #a65))
          :effect (kinfrom o9 #p6 #g65 #a65 #t68)
   )
   (:action s679_ik-arm-motion-from
          :parameters (o9 #p6 #p6 #g66 #a66)
          :precondition (and (isgrasp o9 #p6 #p6 #g66 #a66))
          :effect (kinfrom o9 #p6 #g66 #a66 #t69)
   )
   (:action s680_ik-arm-motion-from
          :parameters (o9 #p6 #p7 #g67 #a67)
          :precondition (and (isgrasp o9 #p6 #p7 #g67 #a67))
          :effect (kinfrom o9 #p6 #g67 #a67 #t70)
   )
   (:action s681_ik-arm-motion-from
          :parameters (o9 #p6 #p8 #g68 #a68)
          :precondition (and (isgrasp o9 #p6 #p8 #g68 #a68))
          :effect (kinfrom o9 #p6 #g68 #a68 #t71)
   )
   (:action s682_ik-arm-motion-from
          :parameters (o9 #p7 p424 #g69 #a69)
          :precondition (and (isgrasp o9 #p7 p424 #g69 #a69))
          :effect (kinfrom o9 #p7 #g69 #a69 #t72)
   )
   (:action s683_ik-arm-motion-from
          :parameters (o9 #p7 #p6 #g70 #a70)
          :precondition (and (isgrasp o9 #p7 #p6 #g70 #a70))
          :effect (kinfrom o9 #p7 #g70 #a70 #t73)
   )
   (:action s684_ik-arm-motion-from
          :parameters (o9 #p7 #p7 #g71 #a71)
          :precondition (and (isgrasp o9 #p7 #p7 #g71 #a71))
          :effect (kinfrom o9 #p7 #g71 #a71 #t74)
   )
   (:action s685_ik-arm-motion-from
          :parameters (o9 #p7 #p8 #g72 #a72)
          :precondition (and (isgrasp o9 #p7 #p8 #g72 #a72))
          :effect (kinfrom o9 #p7 #g72 #a72 #t75)
   )
   (:action s686_ik-arm-motion-from
          :parameters (o9 #p8 p424 #g73 #a73)
          :precondition (and (isgrasp o9 #p8 p424 #g73 #a73))
          :effect (kinfrom o9 #p8 #g73 #a73 #t76)
   )
   (:action s687_ik-arm-motion-from
          :parameters (o9 #p8 #p6 #g74 #a74)
          :precondition (and (isgrasp o9 #p8 #p6 #g74 #a74))
          :effect (kinfrom o9 #p8 #g74 #a74 #t77)
   )
   (:action s688_ik-arm-motion-from
          :parameters (o9 #p8 #p7 #g75 #a75)
          :precondition (and (isgrasp o9 #p8 #p7 #g75 #a75))
          :effect (kinfrom o9 #p8 #g75 #a75 #t78)
   )
   (:action s689_ik-arm-motion-from
          :parameters (o9 #p8 #p8 #g76 #a76)
          :precondition (and (isgrasp o9 #p8 #p8 #g76 #a76))
          :effect (kinfrom o9 #p8 #g76 #a76 #t79)
   )
   (:action s690_ik-arm-motion-to
          :parameters (o7 #p0 p312 #g3 #a3)
          :precondition (and (isgrasp o7 p312 #p0 #g3 #a3))
          :effect (kinto o7 #p0 #g3 #a3 #t80)
   )
   (:action s691_ik-arm-motion-to
          :parameters (o7 #p1 p312 #g4 #a4)
          :precondition (and (isgrasp o7 p312 #p1 #g4 #a4))
          :effect (kinto o7 #p1 #g4 #a4 #t81)
   )
   (:action s692_ik-arm-motion-to
          :parameters (o7 #p2 p312 #g5 #a5)
          :precondition (and (isgrasp o7 p312 #p2 #g5 #a5))
          :effect (kinto o7 #p2 #g5 #a5 #t82)
   )
   (:action s693_ik-arm-motion-to
          :parameters (o7 #p9 p312 #g6 #a6)
          :precondition (and (isgrasp o7 p312 #p9 #g6 #a6))
          :effect (kinto o7 #p9 #g6 #a6 #t83)
   )
   (:action s694_ik-arm-motion-to
          :parameters (o7 #p10 p312 #g7 #a7)
          :precondition (and (isgrasp o7 p312 #p10 #g7 #a7))
          :effect (kinto o7 #p10 #g7 #a7 #t84)
   )
   (:action s695_ik-arm-motion-to
          :parameters (o7 p312 #p0 #g8 #a8)
          :precondition (and (isgrasp o7 #p0 p312 #g8 #a8))
          :effect (kinto o7 p312 #g8 #a8 #t85)
   )
   (:action s696_ik-arm-motion-to
          :parameters (o7 #p0 #p0 #g9 #a9)
          :precondition (and (isgrasp o7 #p0 #p0 #g9 #a9))
          :effect (kinto o7 #p0 #g9 #a9 #t86)
   )
   (:action s697_ik-arm-motion-to
          :parameters (o7 #p1 #p0 #g10 #a10)
          :precondition (and (isgrasp o7 #p0 #p1 #g10 #a10))
          :effect (kinto o7 #p1 #g10 #a10 #t87)
   )
   (:action s698_ik-arm-motion-to
          :parameters (o7 #p2 #p0 #g11 #a11)
          :precondition (and (isgrasp o7 #p0 #p2 #g11 #a11))
          :effect (kinto o7 #p2 #g11 #a11 #t88)
   )
   (:action s699_ik-arm-motion-to
          :parameters (o7 #p9 #p0 #g12 #a12)
          :precondition (and (isgrasp o7 #p0 #p9 #g12 #a12))
          :effect (kinto o7 #p9 #g12 #a12 #t89)
   )
   (:action s700_ik-arm-motion-to
          :parameters (o7 #p10 #p0 #g13 #a13)
          :precondition (and (isgrasp o7 #p0 #p10 #g13 #a13))
          :effect (kinto o7 #p10 #g13 #a13 #t90)
   )
   (:action s701_ik-arm-motion-to
          :parameters (o7 p312 #p1 #g14 #a14)
          :precondition (and (isgrasp o7 #p1 p312 #g14 #a14))
          :effect (kinto o7 p312 #g14 #a14 #t91)
   )
   (:action s702_ik-arm-motion-to
          :parameters (o7 #p0 #p1 #g15 #a15)
          :precondition (and (isgrasp o7 #p1 #p0 #g15 #a15))
          :effect (kinto o7 #p0 #g15 #a15 #t92)
   )
   (:action s703_ik-arm-motion-to
          :parameters (o7 #p1 #p1 #g16 #a16)
          :precondition (and (isgrasp o7 #p1 #p1 #g16 #a16))
          :effect (kinto o7 #p1 #g16 #a16 #t93)
   )
   (:action s704_ik-arm-motion-to
          :parameters (o7 #p2 #p1 #g17 #a17)
          :precondition (and (isgrasp o7 #p1 #p2 #g17 #a17))
          :effect (kinto o7 #p2 #g17 #a17 #t94)
   )
   (:action s705_ik-arm-motion-to
          :parameters (o7 #p9 #p1 #g18 #a18)
          :precondition (and (isgrasp o7 #p1 #p9 #g18 #a18))
          :effect (kinto o7 #p9 #g18 #a18 #t95)
   )
   (:action s706_ik-arm-motion-to
          :parameters (o7 #p10 #p1 #g19 #a19)
          :precondition (and (isgrasp o7 #p1 #p10 #g19 #a19))
          :effect (kinto o7 #p10 #g19 #a19 #t96)
   )
   (:action s707_ik-arm-motion-to
          :parameters (o7 p312 #p2 #g20 #a20)
          :precondition (and (isgrasp o7 #p2 p312 #g20 #a20))
          :effect (kinto o7 p312 #g20 #a20 #t97)
   )
   (:action s708_ik-arm-motion-to
          :parameters (o7 #p0 #p2 #g21 #a21)
          :precondition (and (isgrasp o7 #p2 #p0 #g21 #a21))
          :effect (kinto o7 #p0 #g21 #a21 #t98)
   )
   (:action s709_ik-arm-motion-to
          :parameters (o7 #p1 #p2 #g22 #a22)
          :precondition (and (isgrasp o7 #p2 #p1 #g22 #a22))
          :effect (kinto o7 #p1 #g22 #a22 #t99)
   )
   (:action s710_ik-arm-motion-to
          :parameters (o7 #p2 #p2 #g23 #a23)
          :precondition (and (isgrasp o7 #p2 #p2 #g23 #a23))
          :effect (kinto o7 #p2 #g23 #a23 #t100)
   )
   (:action s711_ik-arm-motion-to
          :parameters (o7 #p9 #p2 #g24 #a24)
          :precondition (and (isgrasp o7 #p2 #p9 #g24 #a24))
          :effect (kinto o7 #p9 #g24 #a24 #t101)
   )
   (:action s712_ik-arm-motion-to
          :parameters (o7 #p10 #p2 #g25 #a25)
          :precondition (and (isgrasp o7 #p2 #p10 #g25 #a25))
          :effect (kinto o7 #p10 #g25 #a25 #t102)
   )
   (:action s713_ik-arm-motion-to
          :parameters (o7 p312 #p9 #g26 #a26)
          :precondition (and (isgrasp o7 #p9 p312 #g26 #a26))
          :effect (kinto o7 p312 #g26 #a26 #t103)
   )
   (:action s714_ik-arm-motion-to
          :parameters (o7 #p0 #p9 #g27 #a27)
          :precondition (and (isgrasp o7 #p9 #p0 #g27 #a27))
          :effect (kinto o7 #p0 #g27 #a27 #t104)
   )
   (:action s715_ik-arm-motion-to
          :parameters (o7 #p1 #p9 #g28 #a28)
          :precondition (and (isgrasp o7 #p9 #p1 #g28 #a28))
          :effect (kinto o7 #p1 #g28 #a28 #t105)
   )
   (:action s716_ik-arm-motion-to
          :parameters (o7 #p2 #p9 #g29 #a29)
          :precondition (and (isgrasp o7 #p9 #p2 #g29 #a29))
          :effect (kinto o7 #p2 #g29 #a29 #t106)
   )
   (:action s717_ik-arm-motion-to
          :parameters (o7 #p9 #p9 #g30 #a30)
          :precondition (and (isgrasp o7 #p9 #p9 #g30 #a30))
          :effect (kinto o7 #p9 #g30 #a30 #t107)
   )
   (:action s718_ik-arm-motion-to
          :parameters (o7 #p10 #p9 #g31 #a31)
          :precondition (and (isgrasp o7 #p9 #p10 #g31 #a31))
          :effect (kinto o7 #p10 #g31 #a31 #t108)
   )
   (:action s719_ik-arm-motion-to
          :parameters (o7 p312 #p10 #g32 #a32)
          :precondition (and (isgrasp o7 #p10 p312 #g32 #a32))
          :effect (kinto o7 p312 #g32 #a32 #t109)
   )
   (:action s720_ik-arm-motion-to
          :parameters (o7 #p0 #p10 #g33 #a33)
          :precondition (and (isgrasp o7 #p10 #p0 #g33 #a33))
          :effect (kinto o7 #p0 #g33 #a33 #t110)
   )
   (:action s721_ik-arm-motion-to
          :parameters (o7 #p1 #p10 #g34 #a34)
          :precondition (and (isgrasp o7 #p10 #p1 #g34 #a34))
          :effect (kinto o7 #p1 #g34 #a34 #t111)
   )
   (:action s722_ik-arm-motion-to
          :parameters (o7 #p2 #p10 #g35 #a35)
          :precondition (and (isgrasp o7 #p10 #p2 #g35 #a35))
          :effect (kinto o7 #p2 #g35 #a35 #t112)
   )
   (:action s723_ik-arm-motion-to
          :parameters (o7 #p9 #p10 #g36 #a36)
          :precondition (and (isgrasp o7 #p10 #p9 #g36 #a36))
          :effect (kinto o7 #p9 #g36 #a36 #t113)
   )
   (:action s724_ik-arm-motion-to
          :parameters (o7 #p10 #p10 #g37 #a37)
          :precondition (and (isgrasp o7 #p10 #p10 #g37 #a37))
          :effect (kinto o7 #p10 #g37 #a37 #t114)
   )
   (:action s725_ik-arm-motion-to
          :parameters (o8 #p3 p368 #g38 #a38)
          :precondition (and (isgrasp o8 p368 #p3 #g38 #a38))
          :effect (kinto o8 #p3 #g38 #a38 #t115)
   )
   (:action s726_ik-arm-motion-to
          :parameters (o8 #p4 p368 #g39 #a39)
          :precondition (and (isgrasp o8 p368 #p4 #g39 #a39))
          :effect (kinto o8 #p4 #g39 #a39 #t116)
   )
   (:action s727_ik-arm-motion-to
          :parameters (o8 #p5 p368 #g40 #a40)
          :precondition (and (isgrasp o8 p368 #p5 #g40 #a40))
          :effect (kinto o8 #p5 #g40 #a40 #t117)
   )
   (:action s728_ik-arm-motion-to
          :parameters (o8 #p11 p368 #g41 #a41)
          :precondition (and (isgrasp o8 p368 #p11 #g41 #a41))
          :effect (kinto o8 #p11 #g41 #a41 #t118)
   )
   (:action s729_ik-arm-motion-to
          :parameters (o8 p368 #p3 #g42 #a42)
          :precondition (and (isgrasp o8 #p3 p368 #g42 #a42))
          :effect (kinto o8 p368 #g42 #a42 #t119)
   )
   (:action s730_ik-arm-motion-to
          :parameters (o8 #p3 #p3 #g43 #a43)
          :precondition (and (isgrasp o8 #p3 #p3 #g43 #a43))
          :effect (kinto o8 #p3 #g43 #a43 #t120)
   )
   (:action s731_ik-arm-motion-to
          :parameters (o8 #p4 #p3 #g44 #a44)
          :precondition (and (isgrasp o8 #p3 #p4 #g44 #a44))
          :effect (kinto o8 #p4 #g44 #a44 #t121)
   )
   (:action s732_ik-arm-motion-to
          :parameters (o8 #p5 #p3 #g45 #a45)
          :precondition (and (isgrasp o8 #p3 #p5 #g45 #a45))
          :effect (kinto o8 #p5 #g45 #a45 #t122)
   )
   (:action s733_ik-arm-motion-to
          :parameters (o8 #p11 #p3 #g46 #a46)
          :precondition (and (isgrasp o8 #p3 #p11 #g46 #a46))
          :effect (kinto o8 #p11 #g46 #a46 #t123)
   )
   (:action s734_ik-arm-motion-to
          :parameters (o8 p368 #p4 #g47 #a47)
          :precondition (and (isgrasp o8 #p4 p368 #g47 #a47))
          :effect (kinto o8 p368 #g47 #a47 #t124)
   )
   (:action s735_ik-arm-motion-to
          :parameters (o8 #p3 #p4 #g48 #a48)
          :precondition (and (isgrasp o8 #p4 #p3 #g48 #a48))
          :effect (kinto o8 #p3 #g48 #a48 #t125)
   )
   (:action s736_ik-arm-motion-to
          :parameters (o8 #p4 #p4 #g49 #a49)
          :precondition (and (isgrasp o8 #p4 #p4 #g49 #a49))
          :effect (kinto o8 #p4 #g49 #a49 #t126)
   )
   (:action s737_ik-arm-motion-to
          :parameters (o8 #p5 #p4 #g50 #a50)
          :precondition (and (isgrasp o8 #p4 #p5 #g50 #a50))
          :effect (kinto o8 #p5 #g50 #a50 #t127)
   )
   (:action s738_ik-arm-motion-to
          :parameters (o8 #p11 #p4 #g51 #a51)
          :precondition (and (isgrasp o8 #p4 #p11 #g51 #a51))
          :effect (kinto o8 #p11 #g51 #a51 #t128)
   )
   (:action s739_ik-arm-motion-to
          :parameters (o8 p368 #p5 #g52 #a52)
          :precondition (and (isgrasp o8 #p5 p368 #g52 #a52))
          :effect (kinto o8 p368 #g52 #a52 #t129)
   )
   (:action s740_ik-arm-motion-to
          :parameters (o8 #p3 #p5 #g53 #a53)
          :precondition (and (isgrasp o8 #p5 #p3 #g53 #a53))
          :effect (kinto o8 #p3 #g53 #a53 #t130)
   )
   (:action s741_ik-arm-motion-to
          :parameters (o8 #p4 #p5 #g54 #a54)
          :precondition (and (isgrasp o8 #p5 #p4 #g54 #a54))
          :effect (kinto o8 #p4 #g54 #a54 #t131)
   )
   (:action s742_ik-arm-motion-to
          :parameters (o8 #p5 #p5 #g55 #a55)
          :precondition (and (isgrasp o8 #p5 #p5 #g55 #a55))
          :effect (kinto o8 #p5 #g55 #a55 #t132)
   )
   (:action s743_ik-arm-motion-to
          :parameters (o8 #p11 #p5 #g56 #a56)
          :precondition (and (isgrasp o8 #p5 #p11 #g56 #a56))
          :effect (kinto o8 #p11 #g56 #a56 #t133)
   )
   (:action s744_ik-arm-motion-to
          :parameters (o8 p368 #p11 #g57 #a57)
          :precondition (and (isgrasp o8 #p11 p368 #g57 #a57))
          :effect (kinto o8 p368 #g57 #a57 #t134)
   )
   (:action s745_ik-arm-motion-to
          :parameters (o8 #p3 #p11 #g58 #a58)
          :precondition (and (isgrasp o8 #p11 #p3 #g58 #a58))
          :effect (kinto o8 #p3 #g58 #a58 #t135)
   )
   (:action s746_ik-arm-motion-to
          :parameters (o8 #p4 #p11 #g59 #a59)
          :precondition (and (isgrasp o8 #p11 #p4 #g59 #a59))
          :effect (kinto o8 #p4 #g59 #a59 #t136)
   )
   (:action s747_ik-arm-motion-to
          :parameters (o8 #p5 #p11 #g60 #a60)
          :precondition (and (isgrasp o8 #p11 #p5 #g60 #a60))
          :effect (kinto o8 #p5 #g60 #a60 #t137)
   )
   (:action s748_ik-arm-motion-to
          :parameters (o8 #p11 #p11 #g61 #a61)
          :precondition (and (isgrasp o8 #p11 #p11 #g61 #a61))
          :effect (kinto o8 #p11 #g61 #a61 #t138)
   )
   (:action s749_ik-arm-motion-to
          :parameters (o9 #p6 p424 #g62 #a62)
          :precondition (and (isgrasp o9 p424 #p6 #g62 #a62))
          :effect (kinto o9 #p6 #g62 #a62 #t139)
   )
   (:action s750_ik-arm-motion-to
          :parameters (o9 #p7 p424 #g63 #a63)
          :precondition (and (isgrasp o9 p424 #p7 #g63 #a63))
          :effect (kinto o9 #p7 #g63 #a63 #t140)
   )
   (:action s751_ik-arm-motion-to
          :parameters (o9 #p8 p424 #g64 #a64)
          :precondition (and (isgrasp o9 p424 #p8 #g64 #a64))
          :effect (kinto o9 #p8 #g64 #a64 #t141)
   )
   (:action s752_ik-arm-motion-to
          :parameters (o9 p424 #p6 #g65 #a65)
          :precondition (and (isgrasp o9 #p6 p424 #g65 #a65))
          :effect (kinto o9 p424 #g65 #a65 #t142)
   )
   (:action s753_ik-arm-motion-to
          :parameters (o9 #p6 #p6 #g66 #a66)
          :precondition (and (isgrasp o9 #p6 #p6 #g66 #a66))
          :effect (kinto o9 #p6 #g66 #a66 #t143)
   )
   (:action s754_ik-arm-motion-to
          :parameters (o9 #p7 #p6 #g67 #a67)
          :precondition (and (isgrasp o9 #p6 #p7 #g67 #a67))
          :effect (kinto o9 #p7 #g67 #a67 #t144)
   )
   (:action s755_ik-arm-motion-to
          :parameters (o9 #p8 #p6 #g68 #a68)
          :precondition (and (isgrasp o9 #p6 #p8 #g68 #a68))
          :effect (kinto o9 #p8 #g68 #a68 #t145)
   )
   (:action s756_ik-arm-motion-to
          :parameters (o9 p424 #p7 #g69 #a69)
          :precondition (and (isgrasp o9 #p7 p424 #g69 #a69))
          :effect (kinto o9 p424 #g69 #a69 #t146)
   )
   (:action s757_ik-arm-motion-to
          :parameters (o9 #p6 #p7 #g70 #a70)
          :precondition (and (isgrasp o9 #p7 #p6 #g70 #a70))
          :effect (kinto o9 #p6 #g70 #a70 #t147)
   )
   (:action s758_ik-arm-motion-to
          :parameters (o9 #p7 #p7 #g71 #a71)
          :precondition (and (isgrasp o9 #p7 #p7 #g71 #a71))
          :effect (kinto o9 #p7 #g71 #a71 #t148)
   )
   (:action s759_ik-arm-motion-to
          :parameters (o9 #p8 #p7 #g72 #a72)
          :precondition (and (isgrasp o9 #p7 #p8 #g72 #a72))
          :effect (kinto o9 #p8 #g72 #a72 #t149)
   )
   (:action s760_ik-arm-motion-to
          :parameters (o9 p424 #p8 #g73 #a73)
          :precondition (and (isgrasp o9 #p8 p424 #g73 #a73))
          :effect (kinto o9 p424 #g73 #a73 #t150)
   )
   (:action s761_ik-arm-motion-to
          :parameters (o9 #p6 #p8 #g74 #a74)
          :precondition (and (isgrasp o9 #p8 #p6 #g74 #a74))
          :effect (kinto o9 #p6 #g74 #a74 #t151)
   )
   (:action s762_ik-arm-motion-to
          :parameters (o9 #p7 #p8 #g75 #a75)
          :precondition (and (isgrasp o9 #p8 #p7 #g75 #a75))
          :effect (kinto o9 #p7 #g75 #a75 #t152)
   )
   (:action s763_ik-arm-motion-to
          :parameters (o9 #p8 #p8 #g76 #a76)
          :precondition (and (isgrasp o9 #p8 #p8 #g76 #a76))
          :effect (kinto o9 #p8 #g76 #a76 #t153)
   )
   (:action s764_sample-grasp
          :parameters (o7 p312 #p22 #a249)
          :precondition (isarm #a249 o7 p312 #p22)
          :effect (and (isgrasp o7 p312 #p22 #g249 #a249))
   )
   (:action s765_sample-grasp
          :parameters (o7 p312 #p23 #a250)
          :precondition (isarm #a250 o7 p312 #p23)
          :effect (and (isgrasp o7 p312 #p23 #g250 #a250))
   )
   (:action s766_sample-grasp
          :parameters (o7 p312 #p24 #a251)
          :precondition (isarm #a251 o7 p312 #p24)
          :effect (and (isgrasp o7 p312 #p24 #g251 #a251))
   )
   (:action s767_sample-grasp
          :parameters (o7 #p0 #p22 #a252)
          :precondition (isarm #a252 o7 #p0 #p22)
          :effect (and (isgrasp o7 #p0 #p22 #g252 #a252))
   )
   (:action s768_sample-grasp
          :parameters (o7 #p0 #p23 #a253)
          :precondition (isarm #a253 o7 #p0 #p23)
          :effect (and (isgrasp o7 #p0 #p23 #g253 #a253))
   )
   (:action s769_sample-grasp
          :parameters (o7 #p0 #p24 #a254)
          :precondition (isarm #a254 o7 #p0 #p24)
          :effect (and (isgrasp o7 #p0 #p24 #g254 #a254))
   )
   (:action s770_sample-grasp
          :parameters (o7 #p1 #p22 #a255)
          :precondition (isarm #a255 o7 #p1 #p22)
          :effect (and (isgrasp o7 #p1 #p22 #g255 #a255))
   )
   (:action s771_sample-grasp
          :parameters (o7 #p1 #p23 #a256)
          :precondition (isarm #a256 o7 #p1 #p23)
          :effect (and (isgrasp o7 #p1 #p23 #g256 #a256))
   )
   (:action s772_sample-grasp
          :parameters (o7 #p1 #p24 #a257)
          :precondition (isarm #a257 o7 #p1 #p24)
          :effect (and (isgrasp o7 #p1 #p24 #g257 #a257))
   )
   (:action s773_sample-grasp
          :parameters (o7 #p2 #p22 #a258)
          :precondition (isarm #a258 o7 #p2 #p22)
          :effect (and (isgrasp o7 #p2 #p22 #g258 #a258))
   )
   (:action s774_sample-grasp
          :parameters (o7 #p2 #p23 #a259)
          :precondition (isarm #a259 o7 #p2 #p23)
          :effect (and (isgrasp o7 #p2 #p23 #g259 #a259))
   )
   (:action s775_sample-grasp
          :parameters (o7 #p2 #p24 #a260)
          :precondition (isarm #a260 o7 #p2 #p24)
          :effect (and (isgrasp o7 #p2 #p24 #g260 #a260))
   )
   (:action s776_sample-grasp
          :parameters (o7 #p9 #p22 #a261)
          :precondition (isarm #a261 o7 #p9 #p22)
          :effect (and (isgrasp o7 #p9 #p22 #g261 #a261))
   )
   (:action s777_sample-grasp
          :parameters (o7 #p9 #p23 #a262)
          :precondition (isarm #a262 o7 #p9 #p23)
          :effect (and (isgrasp o7 #p9 #p23 #g262 #a262))
   )
   (:action s778_sample-grasp
          :parameters (o7 #p9 #p24 #a263)
          :precondition (isarm #a263 o7 #p9 #p24)
          :effect (and (isgrasp o7 #p9 #p24 #g263 #a263))
   )
   (:action s779_sample-grasp
          :parameters (o7 #p10 #p22 #a264)
          :precondition (isarm #a264 o7 #p10 #p22)
          :effect (and (isgrasp o7 #p10 #p22 #g264 #a264))
   )
   (:action s780_sample-grasp
          :parameters (o7 #p10 #p23 #a265)
          :precondition (isarm #a265 o7 #p10 #p23)
          :effect (and (isgrasp o7 #p10 #p23 #g265 #a265))
   )
   (:action s781_sample-grasp
          :parameters (o7 #p10 #p24 #a266)
          :precondition (isarm #a266 o7 #p10 #p24)
          :effect (and (isgrasp o7 #p10 #p24 #g266 #a266))
   )
   (:action s782_sample-grasp
          :parameters (o7 #p12 #p22 #a267)
          :precondition (isarm #a267 o7 #p12 #p22)
          :effect (and (isgrasp o7 #p12 #p22 #g267 #a267))
   )
   (:action s783_sample-grasp
          :parameters (o7 #p12 #p23 #a268)
          :precondition (isarm #a268 o7 #p12 #p23)
          :effect (and (isgrasp o7 #p12 #p23 #g268 #a268))
   )
   (:action s784_sample-grasp
          :parameters (o7 #p12 #p24 #a269)
          :precondition (isarm #a269 o7 #p12 #p24)
          :effect (and (isgrasp o7 #p12 #p24 #g269 #a269))
   )
   (:action s785_sample-grasp
          :parameters (o7 #p13 #p22 #a270)
          :precondition (isarm #a270 o7 #p13 #p22)
          :effect (and (isgrasp o7 #p13 #p22 #g270 #a270))
   )
   (:action s786_sample-grasp
          :parameters (o7 #p13 #p23 #a271)
          :precondition (isarm #a271 o7 #p13 #p23)
          :effect (and (isgrasp o7 #p13 #p23 #g271 #a271))
   )
   (:action s787_sample-grasp
          :parameters (o7 #p13 #p24 #a272)
          :precondition (isarm #a272 o7 #p13 #p24)
          :effect (and (isgrasp o7 #p13 #p24 #g272 #a272))
   )
   (:action s788_sample-grasp
          :parameters (o7 #p14 #p22 #a273)
          :precondition (isarm #a273 o7 #p14 #p22)
          :effect (and (isgrasp o7 #p14 #p22 #g273 #a273))
   )
   (:action s789_sample-grasp
          :parameters (o7 #p14 #p23 #a274)
          :precondition (isarm #a274 o7 #p14 #p23)
          :effect (and (isgrasp o7 #p14 #p23 #g274 #a274))
   )
   (:action s790_sample-grasp
          :parameters (o7 #p14 #p24 #a275)
          :precondition (isarm #a275 o7 #p14 #p24)
          :effect (and (isgrasp o7 #p14 #p24 #g275 #a275))
   )
   (:action s791_sample-grasp
          :parameters (o7 #p15 #p22 #a276)
          :precondition (isarm #a276 o7 #p15 #p22)
          :effect (and (isgrasp o7 #p15 #p22 #g276 #a276))
   )
   (:action s792_sample-grasp
          :parameters (o7 #p15 #p23 #a277)
          :precondition (isarm #a277 o7 #p15 #p23)
          :effect (and (isgrasp o7 #p15 #p23 #g277 #a277))
   )
   (:action s793_sample-grasp
          :parameters (o7 #p15 #p24 #a278)
          :precondition (isarm #a278 o7 #p15 #p24)
          :effect (and (isgrasp o7 #p15 #p24 #g278 #a278))
   )
   (:action s794_sample-grasp
          :parameters (o7 #p16 #p22 #a279)
          :precondition (isarm #a279 o7 #p16 #p22)
          :effect (and (isgrasp o7 #p16 #p22 #g279 #a279))
   )
   (:action s795_sample-grasp
          :parameters (o7 #p16 #p23 #a280)
          :precondition (isarm #a280 o7 #p16 #p23)
          :effect (and (isgrasp o7 #p16 #p23 #g280 #a280))
   )
   (:action s796_sample-grasp
          :parameters (o7 #p16 #p24 #a281)
          :precondition (isarm #a281 o7 #p16 #p24)
          :effect (and (isgrasp o7 #p16 #p24 #g281 #a281))
   )
   (:action s797_sample-grasp
          :parameters (o7 #p17 #p22 #a282)
          :precondition (isarm #a282 o7 #p17 #p22)
          :effect (and (isgrasp o7 #p17 #p22 #g282 #a282))
   )
   (:action s798_sample-grasp
          :parameters (o7 #p17 #p23 #a283)
          :precondition (isarm #a283 o7 #p17 #p23)
          :effect (and (isgrasp o7 #p17 #p23 #g283 #a283))
   )
   (:action s799_sample-grasp
          :parameters (o7 #p17 #p24 #a284)
          :precondition (isarm #a284 o7 #p17 #p24)
          :effect (and (isgrasp o7 #p17 #p24 #g284 #a284))
   )
   (:action s800_sample-grasp
          :parameters (o7 #p18 #p22 #a285)
          :precondition (isarm #a285 o7 #p18 #p22)
          :effect (and (isgrasp o7 #p18 #p22 #g285 #a285))
   )
   (:action s801_sample-grasp
          :parameters (o7 #p18 #p23 #a286)
          :precondition (isarm #a286 o7 #p18 #p23)
          :effect (and (isgrasp o7 #p18 #p23 #g286 #a286))
   )
   (:action s802_sample-grasp
          :parameters (o7 #p18 #p24 #a287)
          :precondition (isarm #a287 o7 #p18 #p24)
          :effect (and (isgrasp o7 #p18 #p24 #g287 #a287))
   )
   (:action s803_sample-grasp
          :parameters (o7 #p22 p312 #a288)
          :precondition (isarm #a288 o7 #p22 p312)
          :effect (and (isgrasp o7 #p22 p312 #g288 #a288))
   )
   (:action s804_sample-grasp
          :parameters (o7 #p22 #p0 #a289)
          :precondition (isarm #a289 o7 #p22 #p0)
          :effect (and (isgrasp o7 #p22 #p0 #g289 #a289))
   )
   (:action s805_sample-grasp
          :parameters (o7 #p22 #p1 #a290)
          :precondition (isarm #a290 o7 #p22 #p1)
          :effect (and (isgrasp o7 #p22 #p1 #g290 #a290))
   )
   (:action s806_sample-grasp
          :parameters (o7 #p22 #p2 #a291)
          :precondition (isarm #a291 o7 #p22 #p2)
          :effect (and (isgrasp o7 #p22 #p2 #g291 #a291))
   )
   (:action s807_sample-grasp
          :parameters (o7 #p22 #p9 #a292)
          :precondition (isarm #a292 o7 #p22 #p9)
          :effect (and (isgrasp o7 #p22 #p9 #g292 #a292))
   )
   (:action s808_sample-grasp
          :parameters (o7 #p22 #p10 #a293)
          :precondition (isarm #a293 o7 #p22 #p10)
          :effect (and (isgrasp o7 #p22 #p10 #g293 #a293))
   )
   (:action s809_sample-grasp
          :parameters (o7 #p22 #p12 #a294)
          :precondition (isarm #a294 o7 #p22 #p12)
          :effect (and (isgrasp o7 #p22 #p12 #g294 #a294))
   )
   (:action s810_sample-grasp
          :parameters (o7 #p22 #p13 #a295)
          :precondition (isarm #a295 o7 #p22 #p13)
          :effect (and (isgrasp o7 #p22 #p13 #g295 #a295))
   )
   (:action s811_sample-grasp
          :parameters (o7 #p22 #p14 #a296)
          :precondition (isarm #a296 o7 #p22 #p14)
          :effect (and (isgrasp o7 #p22 #p14 #g296 #a296))
   )
   (:action s812_sample-grasp
          :parameters (o7 #p22 #p15 #a297)
          :precondition (isarm #a297 o7 #p22 #p15)
          :effect (and (isgrasp o7 #p22 #p15 #g297 #a297))
   )
   (:action s813_sample-grasp
          :parameters (o7 #p22 #p16 #a298)
          :precondition (isarm #a298 o7 #p22 #p16)
          :effect (and (isgrasp o7 #p22 #p16 #g298 #a298))
   )
   (:action s814_sample-grasp
          :parameters (o7 #p22 #p17 #a299)
          :precondition (isarm #a299 o7 #p22 #p17)
          :effect (and (isgrasp o7 #p22 #p17 #g299 #a299))
   )
   (:action s815_sample-grasp
          :parameters (o7 #p22 #p18 #a300)
          :precondition (isarm #a300 o7 #p22 #p18)
          :effect (and (isgrasp o7 #p22 #p18 #g300 #a300))
   )
   (:action s816_sample-grasp
          :parameters (o7 #p22 #p22 #a301)
          :precondition (isarm #a301 o7 #p22 #p22)
          :effect (and (isgrasp o7 #p22 #p22 #g301 #a301))
   )
   (:action s817_sample-grasp
          :parameters (o7 #p22 #p23 #a302)
          :precondition (isarm #a302 o7 #p22 #p23)
          :effect (and (isgrasp o7 #p22 #p23 #g302 #a302))
   )
   (:action s818_sample-grasp
          :parameters (o7 #p22 #p24 #a303)
          :precondition (isarm #a303 o7 #p22 #p24)
          :effect (and (isgrasp o7 #p22 #p24 #g303 #a303))
   )
   (:action s819_sample-grasp
          :parameters (o7 #p23 p312 #a304)
          :precondition (isarm #a304 o7 #p23 p312)
          :effect (and (isgrasp o7 #p23 p312 #g304 #a304))
   )
   (:action s820_sample-grasp
          :parameters (o7 #p23 #p0 #a305)
          :precondition (isarm #a305 o7 #p23 #p0)
          :effect (and (isgrasp o7 #p23 #p0 #g305 #a305))
   )
   (:action s821_sample-grasp
          :parameters (o7 #p23 #p1 #a306)
          :precondition (isarm #a306 o7 #p23 #p1)
          :effect (and (isgrasp o7 #p23 #p1 #g306 #a306))
   )
   (:action s822_sample-grasp
          :parameters (o7 #p23 #p2 #a307)
          :precondition (isarm #a307 o7 #p23 #p2)
          :effect (and (isgrasp o7 #p23 #p2 #g307 #a307))
   )
   (:action s823_sample-grasp
          :parameters (o7 #p23 #p9 #a308)
          :precondition (isarm #a308 o7 #p23 #p9)
          :effect (and (isgrasp o7 #p23 #p9 #g308 #a308))
   )
   (:action s824_sample-grasp
          :parameters (o7 #p23 #p10 #a309)
          :precondition (isarm #a309 o7 #p23 #p10)
          :effect (and (isgrasp o7 #p23 #p10 #g309 #a309))
   )
   (:action s825_sample-grasp
          :parameters (o7 #p23 #p12 #a310)
          :precondition (isarm #a310 o7 #p23 #p12)
          :effect (and (isgrasp o7 #p23 #p12 #g310 #a310))
   )
   (:action s826_sample-grasp
          :parameters (o7 #p23 #p13 #a311)
          :precondition (isarm #a311 o7 #p23 #p13)
          :effect (and (isgrasp o7 #p23 #p13 #g311 #a311))
   )
   (:action s827_sample-grasp
          :parameters (o7 #p23 #p14 #a312)
          :precondition (isarm #a312 o7 #p23 #p14)
          :effect (and (isgrasp o7 #p23 #p14 #g312 #a312))
   )
   (:action s828_sample-grasp
          :parameters (o7 #p23 #p15 #a313)
          :precondition (isarm #a313 o7 #p23 #p15)
          :effect (and (isgrasp o7 #p23 #p15 #g313 #a313))
   )
   (:action s829_sample-grasp
          :parameters (o7 #p23 #p16 #a314)
          :precondition (isarm #a314 o7 #p23 #p16)
          :effect (and (isgrasp o7 #p23 #p16 #g314 #a314))
   )
   (:action s830_sample-grasp
          :parameters (o7 #p23 #p17 #a315)
          :precondition (isarm #a315 o7 #p23 #p17)
          :effect (and (isgrasp o7 #p23 #p17 #g315 #a315))
   )
   (:action s831_sample-grasp
          :parameters (o7 #p23 #p18 #a316)
          :precondition (isarm #a316 o7 #p23 #p18)
          :effect (and (isgrasp o7 #p23 #p18 #g316 #a316))
   )
   (:action s832_sample-grasp
          :parameters (o7 #p23 #p22 #a317)
          :precondition (isarm #a317 o7 #p23 #p22)
          :effect (and (isgrasp o7 #p23 #p22 #g317 #a317))
   )
   (:action s833_sample-grasp
          :parameters (o7 #p23 #p23 #a318)
          :precondition (isarm #a318 o7 #p23 #p23)
          :effect (and (isgrasp o7 #p23 #p23 #g318 #a318))
   )
   (:action s834_sample-grasp
          :parameters (o7 #p23 #p24 #a319)
          :precondition (isarm #a319 o7 #p23 #p24)
          :effect (and (isgrasp o7 #p23 #p24 #g319 #a319))
   )
   (:action s835_sample-grasp
          :parameters (o7 #p24 p312 #a320)
          :precondition (isarm #a320 o7 #p24 p312)
          :effect (and (isgrasp o7 #p24 p312 #g320 #a320))
   )
   (:action s836_sample-grasp
          :parameters (o7 #p24 #p0 #a321)
          :precondition (isarm #a321 o7 #p24 #p0)
          :effect (and (isgrasp o7 #p24 #p0 #g321 #a321))
   )
   (:action s837_sample-grasp
          :parameters (o7 #p24 #p1 #a322)
          :precondition (isarm #a322 o7 #p24 #p1)
          :effect (and (isgrasp o7 #p24 #p1 #g322 #a322))
   )
   (:action s838_sample-grasp
          :parameters (o7 #p24 #p2 #a323)
          :precondition (isarm #a323 o7 #p24 #p2)
          :effect (and (isgrasp o7 #p24 #p2 #g323 #a323))
   )
   (:action s839_sample-grasp
          :parameters (o7 #p24 #p9 #a324)
          :precondition (isarm #a324 o7 #p24 #p9)
          :effect (and (isgrasp o7 #p24 #p9 #g324 #a324))
   )
   (:action s840_sample-grasp
          :parameters (o7 #p24 #p10 #a325)
          :precondition (isarm #a325 o7 #p24 #p10)
          :effect (and (isgrasp o7 #p24 #p10 #g325 #a325))
   )
   (:action s841_sample-grasp
          :parameters (o7 #p24 #p12 #a326)
          :precondition (isarm #a326 o7 #p24 #p12)
          :effect (and (isgrasp o7 #p24 #p12 #g326 #a326))
   )
   (:action s842_sample-grasp
          :parameters (o7 #p24 #p13 #a327)
          :precondition (isarm #a327 o7 #p24 #p13)
          :effect (and (isgrasp o7 #p24 #p13 #g327 #a327))
   )
   (:action s843_sample-grasp
          :parameters (o7 #p24 #p14 #a328)
          :precondition (isarm #a328 o7 #p24 #p14)
          :effect (and (isgrasp o7 #p24 #p14 #g328 #a328))
   )
   (:action s844_sample-grasp
          :parameters (o7 #p24 #p15 #a329)
          :precondition (isarm #a329 o7 #p24 #p15)
          :effect (and (isgrasp o7 #p24 #p15 #g329 #a329))
   )
   (:action s845_sample-grasp
          :parameters (o7 #p24 #p16 #a330)
          :precondition (isarm #a330 o7 #p24 #p16)
          :effect (and (isgrasp o7 #p24 #p16 #g330 #a330))
   )
   (:action s846_sample-grasp
          :parameters (o7 #p24 #p17 #a331)
          :precondition (isarm #a331 o7 #p24 #p17)
          :effect (and (isgrasp o7 #p24 #p17 #g331 #a331))
   )
   (:action s847_sample-grasp
          :parameters (o7 #p24 #p18 #a332)
          :precondition (isarm #a332 o7 #p24 #p18)
          :effect (and (isgrasp o7 #p24 #p18 #g332 #a332))
   )
   (:action s848_sample-grasp
          :parameters (o7 #p24 #p22 #a333)
          :precondition (isarm #a333 o7 #p24 #p22)
          :effect (and (isgrasp o7 #p24 #p22 #g333 #a333))
   )
   (:action s849_sample-grasp
          :parameters (o7 #p24 #p23 #a334)
          :precondition (isarm #a334 o7 #p24 #p23)
          :effect (and (isgrasp o7 #p24 #p23 #g334 #a334))
   )
   (:action s850_sample-grasp
          :parameters (o7 #p24 #p24 #a335)
          :precondition (isarm #a335 o7 #p24 #p24)
          :effect (and (isgrasp o7 #p24 #p24 #g335 #a335))
   )
   (:action s851_ik-arm-motion-from
          :parameters (o7 p312 #p12 #g77 #a77)
          :precondition (and (isgrasp o7 p312 #p12 #g77 #a77))
          :effect (kinfrom o7 p312 #g77 #a77 #t154)
   )
   (:action s852_ik-arm-motion-from
          :parameters (o7 p312 #p13 #g78 #a78)
          :precondition (and (isgrasp o7 p312 #p13 #g78 #a78))
          :effect (kinfrom o7 p312 #g78 #a78 #t155)
   )
   (:action s853_ik-arm-motion-from
          :parameters (o7 p312 #p14 #g79 #a79)
          :precondition (and (isgrasp o7 p312 #p14 #g79 #a79))
          :effect (kinfrom o7 p312 #g79 #a79 #t156)
   )
   (:action s854_ik-arm-motion-from
          :parameters (o7 p312 #p15 #g80 #a80)
          :precondition (and (isgrasp o7 p312 #p15 #g80 #a80))
          :effect (kinfrom o7 p312 #g80 #a80 #t157)
   )
   (:action s855_ik-arm-motion-from
          :parameters (o7 p312 #p16 #g81 #a81)
          :precondition (and (isgrasp o7 p312 #p16 #g81 #a81))
          :effect (kinfrom o7 p312 #g81 #a81 #t158)
   )
   (:action s856_ik-arm-motion-from
          :parameters (o7 p312 #p17 #g82 #a82)
          :precondition (and (isgrasp o7 p312 #p17 #g82 #a82))
          :effect (kinfrom o7 p312 #g82 #a82 #t159)
   )
   (:action s857_ik-arm-motion-from
          :parameters (o7 p312 #p18 #g83 #a83)
          :precondition (and (isgrasp o7 p312 #p18 #g83 #a83))
          :effect (kinfrom o7 p312 #g83 #a83 #t160)
   )
   (:action s858_ik-arm-motion-from
          :parameters (o7 #p0 #p12 #g84 #a84)
          :precondition (and (isgrasp o7 #p0 #p12 #g84 #a84))
          :effect (kinfrom o7 #p0 #g84 #a84 #t161)
   )
   (:action s859_ik-arm-motion-from
          :parameters (o7 #p0 #p13 #g85 #a85)
          :precondition (and (isgrasp o7 #p0 #p13 #g85 #a85))
          :effect (kinfrom o7 #p0 #g85 #a85 #t162)
   )
   (:action s860_ik-arm-motion-from
          :parameters (o7 #p0 #p14 #g86 #a86)
          :precondition (and (isgrasp o7 #p0 #p14 #g86 #a86))
          :effect (kinfrom o7 #p0 #g86 #a86 #t163)
   )
   (:action s861_ik-arm-motion-from
          :parameters (o7 #p0 #p15 #g87 #a87)
          :precondition (and (isgrasp o7 #p0 #p15 #g87 #a87))
          :effect (kinfrom o7 #p0 #g87 #a87 #t164)
   )
   (:action s862_ik-arm-motion-from
          :parameters (o7 #p0 #p16 #g88 #a88)
          :precondition (and (isgrasp o7 #p0 #p16 #g88 #a88))
          :effect (kinfrom o7 #p0 #g88 #a88 #t165)
   )
   (:action s863_ik-arm-motion-from
          :parameters (o7 #p0 #p17 #g89 #a89)
          :precondition (and (isgrasp o7 #p0 #p17 #g89 #a89))
          :effect (kinfrom o7 #p0 #g89 #a89 #t166)
   )
   (:action s864_ik-arm-motion-from
          :parameters (o7 #p0 #p18 #g90 #a90)
          :precondition (and (isgrasp o7 #p0 #p18 #g90 #a90))
          :effect (kinfrom o7 #p0 #g90 #a90 #t167)
   )
   (:action s865_ik-arm-motion-from
          :parameters (o7 #p1 #p12 #g91 #a91)
          :precondition (and (isgrasp o7 #p1 #p12 #g91 #a91))
          :effect (kinfrom o7 #p1 #g91 #a91 #t168)
   )
   (:action s866_ik-arm-motion-from
          :parameters (o7 #p1 #p13 #g92 #a92)
          :precondition (and (isgrasp o7 #p1 #p13 #g92 #a92))
          :effect (kinfrom o7 #p1 #g92 #a92 #t169)
   )
   (:action s867_ik-arm-motion-from
          :parameters (o7 #p1 #p14 #g93 #a93)
          :precondition (and (isgrasp o7 #p1 #p14 #g93 #a93))
          :effect (kinfrom o7 #p1 #g93 #a93 #t170)
   )
   (:action s868_ik-arm-motion-from
          :parameters (o7 #p1 #p15 #g94 #a94)
          :precondition (and (isgrasp o7 #p1 #p15 #g94 #a94))
          :effect (kinfrom o7 #p1 #g94 #a94 #t171)
   )
   (:action s869_ik-arm-motion-from
          :parameters (o7 #p1 #p16 #g95 #a95)
          :precondition (and (isgrasp o7 #p1 #p16 #g95 #a95))
          :effect (kinfrom o7 #p1 #g95 #a95 #t172)
   )
   (:action s870_ik-arm-motion-from
          :parameters (o7 #p1 #p17 #g96 #a96)
          :precondition (and (isgrasp o7 #p1 #p17 #g96 #a96))
          :effect (kinfrom o7 #p1 #g96 #a96 #t173)
   )
   (:action s871_ik-arm-motion-from
          :parameters (o7 #p1 #p18 #g97 #a97)
          :precondition (and (isgrasp o7 #p1 #p18 #g97 #a97))
          :effect (kinfrom o7 #p1 #g97 #a97 #t174)
   )
   (:action s872_ik-arm-motion-from
          :parameters (o7 #p2 #p12 #g98 #a98)
          :precondition (and (isgrasp o7 #p2 #p12 #g98 #a98))
          :effect (kinfrom o7 #p2 #g98 #a98 #t175)
   )
   (:action s873_ik-arm-motion-from
          :parameters (o7 #p2 #p13 #g99 #a99)
          :precondition (and (isgrasp o7 #p2 #p13 #g99 #a99))
          :effect (kinfrom o7 #p2 #g99 #a99 #t176)
   )
   (:action s874_ik-arm-motion-from
          :parameters (o7 #p2 #p14 #g100 #a100)
          :precondition (and (isgrasp o7 #p2 #p14 #g100 #a100))
          :effect (kinfrom o7 #p2 #g100 #a100 #t177)
   )
   (:action s875_ik-arm-motion-from
          :parameters (o7 #p2 #p15 #g101 #a101)
          :precondition (and (isgrasp o7 #p2 #p15 #g101 #a101))
          :effect (kinfrom o7 #p2 #g101 #a101 #t178)
   )
   (:action s876_ik-arm-motion-from
          :parameters (o7 #p2 #p16 #g102 #a102)
          :precondition (and (isgrasp o7 #p2 #p16 #g102 #a102))
          :effect (kinfrom o7 #p2 #g102 #a102 #t179)
   )
   (:action s877_ik-arm-motion-from
          :parameters (o7 #p2 #p17 #g103 #a103)
          :precondition (and (isgrasp o7 #p2 #p17 #g103 #a103))
          :effect (kinfrom o7 #p2 #g103 #a103 #t180)
   )
   (:action s878_ik-arm-motion-from
          :parameters (o7 #p2 #p18 #g104 #a104)
          :precondition (and (isgrasp o7 #p2 #p18 #g104 #a104))
          :effect (kinfrom o7 #p2 #g104 #a104 #t181)
   )
   (:action s879_ik-arm-motion-from
          :parameters (o7 #p9 #p12 #g105 #a105)
          :precondition (and (isgrasp o7 #p9 #p12 #g105 #a105))
          :effect (kinfrom o7 #p9 #g105 #a105 #t182)
   )
   (:action s880_ik-arm-motion-from
          :parameters (o7 #p9 #p13 #g106 #a106)
          :precondition (and (isgrasp o7 #p9 #p13 #g106 #a106))
          :effect (kinfrom o7 #p9 #g106 #a106 #t183)
   )
   (:action s881_ik-arm-motion-from
          :parameters (o7 #p9 #p14 #g107 #a107)
          :precondition (and (isgrasp o7 #p9 #p14 #g107 #a107))
          :effect (kinfrom o7 #p9 #g107 #a107 #t184)
   )
   (:action s882_ik-arm-motion-from
          :parameters (o7 #p9 #p15 #g108 #a108)
          :precondition (and (isgrasp o7 #p9 #p15 #g108 #a108))
          :effect (kinfrom o7 #p9 #g108 #a108 #t185)
   )
   (:action s883_ik-arm-motion-from
          :parameters (o7 #p9 #p16 #g109 #a109)
          :precondition (and (isgrasp o7 #p9 #p16 #g109 #a109))
          :effect (kinfrom o7 #p9 #g109 #a109 #t186)
   )
   (:action s884_ik-arm-motion-from
          :parameters (o7 #p9 #p17 #g110 #a110)
          :precondition (and (isgrasp o7 #p9 #p17 #g110 #a110))
          :effect (kinfrom o7 #p9 #g110 #a110 #t187)
   )
   (:action s885_ik-arm-motion-from
          :parameters (o7 #p9 #p18 #g111 #a111)
          :precondition (and (isgrasp o7 #p9 #p18 #g111 #a111))
          :effect (kinfrom o7 #p9 #g111 #a111 #t188)
   )
   (:action s886_ik-arm-motion-from
          :parameters (o7 #p10 #p12 #g112 #a112)
          :precondition (and (isgrasp o7 #p10 #p12 #g112 #a112))
          :effect (kinfrom o7 #p10 #g112 #a112 #t189)
   )
   (:action s887_ik-arm-motion-from
          :parameters (o7 #p10 #p13 #g113 #a113)
          :precondition (and (isgrasp o7 #p10 #p13 #g113 #a113))
          :effect (kinfrom o7 #p10 #g113 #a113 #t190)
   )
   (:action s888_ik-arm-motion-from
          :parameters (o7 #p10 #p14 #g114 #a114)
          :precondition (and (isgrasp o7 #p10 #p14 #g114 #a114))
          :effect (kinfrom o7 #p10 #g114 #a114 #t191)
   )
   (:action s889_ik-arm-motion-from
          :parameters (o7 #p10 #p15 #g115 #a115)
          :precondition (and (isgrasp o7 #p10 #p15 #g115 #a115))
          :effect (kinfrom o7 #p10 #g115 #a115 #t192)
   )
   (:action s890_ik-arm-motion-from
          :parameters (o7 #p10 #p16 #g116 #a116)
          :precondition (and (isgrasp o7 #p10 #p16 #g116 #a116))
          :effect (kinfrom o7 #p10 #g116 #a116 #t193)
   )
   (:action s891_ik-arm-motion-from
          :parameters (o7 #p10 #p17 #g117 #a117)
          :precondition (and (isgrasp o7 #p10 #p17 #g117 #a117))
          :effect (kinfrom o7 #p10 #g117 #a117 #t194)
   )
   (:action s892_ik-arm-motion-from
          :parameters (o7 #p10 #p18 #g118 #a118)
          :precondition (and (isgrasp o7 #p10 #p18 #g118 #a118))
          :effect (kinfrom o7 #p10 #g118 #a118 #t195)
   )
   (:action s893_ik-arm-motion-from
          :parameters (o7 #p12 p312 #g119 #a119)
          :precondition (and (isgrasp o7 #p12 p312 #g119 #a119))
          :effect (kinfrom o7 #p12 #g119 #a119 #t196)
   )
   (:action s894_ik-arm-motion-from
          :parameters (o7 #p12 #p0 #g120 #a120)
          :precondition (and (isgrasp o7 #p12 #p0 #g120 #a120))
          :effect (kinfrom o7 #p12 #g120 #a120 #t197)
   )
   (:action s895_ik-arm-motion-from
          :parameters (o7 #p12 #p1 #g121 #a121)
          :precondition (and (isgrasp o7 #p12 #p1 #g121 #a121))
          :effect (kinfrom o7 #p12 #g121 #a121 #t198)
   )
   (:action s896_ik-arm-motion-from
          :parameters (o7 #p12 #p2 #g122 #a122)
          :precondition (and (isgrasp o7 #p12 #p2 #g122 #a122))
          :effect (kinfrom o7 #p12 #g122 #a122 #t199)
   )
   (:action s897_ik-arm-motion-from
          :parameters (o7 #p12 #p9 #g123 #a123)
          :precondition (and (isgrasp o7 #p12 #p9 #g123 #a123))
          :effect (kinfrom o7 #p12 #g123 #a123 #t200)
   )
   (:action s898_ik-arm-motion-from
          :parameters (o7 #p12 #p10 #g124 #a124)
          :precondition (and (isgrasp o7 #p12 #p10 #g124 #a124))
          :effect (kinfrom o7 #p12 #g124 #a124 #t201)
   )
   (:action s899_ik-arm-motion-from
          :parameters (o7 #p12 #p12 #g125 #a125)
          :precondition (and (isgrasp o7 #p12 #p12 #g125 #a125))
          :effect (kinfrom o7 #p12 #g125 #a125 #t202)
   )
   (:action s900_ik-arm-motion-from
          :parameters (o7 #p12 #p13 #g126 #a126)
          :precondition (and (isgrasp o7 #p12 #p13 #g126 #a126))
          :effect (kinfrom o7 #p12 #g126 #a126 #t203)
   )
   (:action s901_ik-arm-motion-from
          :parameters (o7 #p12 #p14 #g127 #a127)
          :precondition (and (isgrasp o7 #p12 #p14 #g127 #a127))
          :effect (kinfrom o7 #p12 #g127 #a127 #t204)
   )
   (:action s902_ik-arm-motion-from
          :parameters (o7 #p12 #p15 #g128 #a128)
          :precondition (and (isgrasp o7 #p12 #p15 #g128 #a128))
          :effect (kinfrom o7 #p12 #g128 #a128 #t205)
   )
   (:action s903_ik-arm-motion-from
          :parameters (o7 #p12 #p16 #g129 #a129)
          :precondition (and (isgrasp o7 #p12 #p16 #g129 #a129))
          :effect (kinfrom o7 #p12 #g129 #a129 #t206)
   )
   (:action s904_ik-arm-motion-from
          :parameters (o7 #p12 #p17 #g130 #a130)
          :precondition (and (isgrasp o7 #p12 #p17 #g130 #a130))
          :effect (kinfrom o7 #p12 #g130 #a130 #t207)
   )
   (:action s905_ik-arm-motion-from
          :parameters (o7 #p12 #p18 #g131 #a131)
          :precondition (and (isgrasp o7 #p12 #p18 #g131 #a131))
          :effect (kinfrom o7 #p12 #g131 #a131 #t208)
   )
   (:action s906_ik-arm-motion-from
          :parameters (o7 #p13 p312 #g132 #a132)
          :precondition (and (isgrasp o7 #p13 p312 #g132 #a132))
          :effect (kinfrom o7 #p13 #g132 #a132 #t209)
   )
   (:action s907_ik-arm-motion-from
          :parameters (o7 #p13 #p0 #g133 #a133)
          :precondition (and (isgrasp o7 #p13 #p0 #g133 #a133))
          :effect (kinfrom o7 #p13 #g133 #a133 #t210)
   )
   (:action s908_ik-arm-motion-from
          :parameters (o7 #p13 #p1 #g134 #a134)
          :precondition (and (isgrasp o7 #p13 #p1 #g134 #a134))
          :effect (kinfrom o7 #p13 #g134 #a134 #t211)
   )
   (:action s909_ik-arm-motion-from
          :parameters (o7 #p13 #p2 #g135 #a135)
          :precondition (and (isgrasp o7 #p13 #p2 #g135 #a135))
          :effect (kinfrom o7 #p13 #g135 #a135 #t212)
   )
   (:action s910_ik-arm-motion-from
          :parameters (o7 #p13 #p9 #g136 #a136)
          :precondition (and (isgrasp o7 #p13 #p9 #g136 #a136))
          :effect (kinfrom o7 #p13 #g136 #a136 #t213)
   )
   (:action s911_ik-arm-motion-from
          :parameters (o7 #p13 #p10 #g137 #a137)
          :precondition (and (isgrasp o7 #p13 #p10 #g137 #a137))
          :effect (kinfrom o7 #p13 #g137 #a137 #t214)
   )
   (:action s912_ik-arm-motion-from
          :parameters (o7 #p13 #p12 #g138 #a138)
          :precondition (and (isgrasp o7 #p13 #p12 #g138 #a138))
          :effect (kinfrom o7 #p13 #g138 #a138 #t215)
   )
   (:action s913_ik-arm-motion-from
          :parameters (o7 #p13 #p13 #g139 #a139)
          :precondition (and (isgrasp o7 #p13 #p13 #g139 #a139))
          :effect (kinfrom o7 #p13 #g139 #a139 #t216)
   )
   (:action s914_ik-arm-motion-from
          :parameters (o7 #p13 #p14 #g140 #a140)
          :precondition (and (isgrasp o7 #p13 #p14 #g140 #a140))
          :effect (kinfrom o7 #p13 #g140 #a140 #t217)
   )
   (:action s915_ik-arm-motion-from
          :parameters (o7 #p13 #p15 #g141 #a141)
          :precondition (and (isgrasp o7 #p13 #p15 #g141 #a141))
          :effect (kinfrom o7 #p13 #g141 #a141 #t218)
   )
   (:action s916_ik-arm-motion-from
          :parameters (o7 #p13 #p16 #g142 #a142)
          :precondition (and (isgrasp o7 #p13 #p16 #g142 #a142))
          :effect (kinfrom o7 #p13 #g142 #a142 #t219)
   )
   (:action s917_ik-arm-motion-from
          :parameters (o7 #p13 #p17 #g143 #a143)
          :precondition (and (isgrasp o7 #p13 #p17 #g143 #a143))
          :effect (kinfrom o7 #p13 #g143 #a143 #t220)
   )
   (:action s918_ik-arm-motion-from
          :parameters (o7 #p13 #p18 #g144 #a144)
          :precondition (and (isgrasp o7 #p13 #p18 #g144 #a144))
          :effect (kinfrom o7 #p13 #g144 #a144 #t221)
   )
   (:action s919_ik-arm-motion-from
          :parameters (o7 #p14 p312 #g145 #a145)
          :precondition (and (isgrasp o7 #p14 p312 #g145 #a145))
          :effect (kinfrom o7 #p14 #g145 #a145 #t222)
   )
   (:action s920_ik-arm-motion-from
          :parameters (o7 #p14 #p0 #g146 #a146)
          :precondition (and (isgrasp o7 #p14 #p0 #g146 #a146))
          :effect (kinfrom o7 #p14 #g146 #a146 #t223)
   )
   (:action s921_ik-arm-motion-from
          :parameters (o7 #p14 #p1 #g147 #a147)
          :precondition (and (isgrasp o7 #p14 #p1 #g147 #a147))
          :effect (kinfrom o7 #p14 #g147 #a147 #t224)
   )
   (:action s922_ik-arm-motion-from
          :parameters (o7 #p14 #p2 #g148 #a148)
          :precondition (and (isgrasp o7 #p14 #p2 #g148 #a148))
          :effect (kinfrom o7 #p14 #g148 #a148 #t225)
   )
   (:action s923_ik-arm-motion-from
          :parameters (o7 #p14 #p9 #g149 #a149)
          :precondition (and (isgrasp o7 #p14 #p9 #g149 #a149))
          :effect (kinfrom o7 #p14 #g149 #a149 #t226)
   )
   (:action s924_ik-arm-motion-from
          :parameters (o7 #p14 #p10 #g150 #a150)
          :precondition (and (isgrasp o7 #p14 #p10 #g150 #a150))
          :effect (kinfrom o7 #p14 #g150 #a150 #t227)
   )
   (:action s925_ik-arm-motion-from
          :parameters (o7 #p14 #p12 #g151 #a151)
          :precondition (and (isgrasp o7 #p14 #p12 #g151 #a151))
          :effect (kinfrom o7 #p14 #g151 #a151 #t228)
   )
   (:action s926_ik-arm-motion-from
          :parameters (o7 #p14 #p13 #g152 #a152)
          :precondition (and (isgrasp o7 #p14 #p13 #g152 #a152))
          :effect (kinfrom o7 #p14 #g152 #a152 #t229)
   )
   (:action s927_ik-arm-motion-from
          :parameters (o7 #p14 #p14 #g153 #a153)
          :precondition (and (isgrasp o7 #p14 #p14 #g153 #a153))
          :effect (kinfrom o7 #p14 #g153 #a153 #t230)
   )
   (:action s928_ik-arm-motion-from
          :parameters (o7 #p14 #p15 #g154 #a154)
          :precondition (and (isgrasp o7 #p14 #p15 #g154 #a154))
          :effect (kinfrom o7 #p14 #g154 #a154 #t231)
   )
   (:action s929_ik-arm-motion-from
          :parameters (o7 #p14 #p16 #g155 #a155)
          :precondition (and (isgrasp o7 #p14 #p16 #g155 #a155))
          :effect (kinfrom o7 #p14 #g155 #a155 #t232)
   )
   (:action s930_ik-arm-motion-from
          :parameters (o7 #p14 #p17 #g156 #a156)
          :precondition (and (isgrasp o7 #p14 #p17 #g156 #a156))
          :effect (kinfrom o7 #p14 #g156 #a156 #t233)
   )
   (:action s931_ik-arm-motion-from
          :parameters (o7 #p14 #p18 #g157 #a157)
          :precondition (and (isgrasp o7 #p14 #p18 #g157 #a157))
          :effect (kinfrom o7 #p14 #g157 #a157 #t234)
   )
   (:action s932_ik-arm-motion-from
          :parameters (o7 #p15 p312 #g158 #a158)
          :precondition (and (isgrasp o7 #p15 p312 #g158 #a158))
          :effect (kinfrom o7 #p15 #g158 #a158 #t235)
   )
   (:action s933_ik-arm-motion-from
          :parameters (o7 #p15 #p0 #g159 #a159)
          :precondition (and (isgrasp o7 #p15 #p0 #g159 #a159))
          :effect (kinfrom o7 #p15 #g159 #a159 #t236)
   )
   (:action s934_ik-arm-motion-from
          :parameters (o7 #p15 #p1 #g160 #a160)
          :precondition (and (isgrasp o7 #p15 #p1 #g160 #a160))
          :effect (kinfrom o7 #p15 #g160 #a160 #t237)
   )
   (:action s935_ik-arm-motion-from
          :parameters (o7 #p15 #p2 #g161 #a161)
          :precondition (and (isgrasp o7 #p15 #p2 #g161 #a161))
          :effect (kinfrom o7 #p15 #g161 #a161 #t238)
   )
   (:action s936_ik-arm-motion-from
          :parameters (o7 #p15 #p9 #g162 #a162)
          :precondition (and (isgrasp o7 #p15 #p9 #g162 #a162))
          :effect (kinfrom o7 #p15 #g162 #a162 #t239)
   )
   (:action s937_ik-arm-motion-from
          :parameters (o7 #p15 #p10 #g163 #a163)
          :precondition (and (isgrasp o7 #p15 #p10 #g163 #a163))
          :effect (kinfrom o7 #p15 #g163 #a163 #t240)
   )
   (:action s938_ik-arm-motion-from
          :parameters (o7 #p15 #p12 #g164 #a164)
          :precondition (and (isgrasp o7 #p15 #p12 #g164 #a164))
          :effect (kinfrom o7 #p15 #g164 #a164 #t241)
   )
   (:action s939_ik-arm-motion-from
          :parameters (o7 #p15 #p13 #g165 #a165)
          :precondition (and (isgrasp o7 #p15 #p13 #g165 #a165))
          :effect (kinfrom o7 #p15 #g165 #a165 #t242)
   )
   (:action s940_ik-arm-motion-from
          :parameters (o7 #p15 #p14 #g166 #a166)
          :precondition (and (isgrasp o7 #p15 #p14 #g166 #a166))
          :effect (kinfrom o7 #p15 #g166 #a166 #t243)
   )
   (:action s941_ik-arm-motion-from
          :parameters (o7 #p15 #p15 #g167 #a167)
          :precondition (and (isgrasp o7 #p15 #p15 #g167 #a167))
          :effect (kinfrom o7 #p15 #g167 #a167 #t244)
   )
   (:action s942_ik-arm-motion-from
          :parameters (o7 #p15 #p16 #g168 #a168)
          :precondition (and (isgrasp o7 #p15 #p16 #g168 #a168))
          :effect (kinfrom o7 #p15 #g168 #a168 #t245)
   )
   (:action s943_ik-arm-motion-from
          :parameters (o7 #p15 #p17 #g169 #a169)
          :precondition (and (isgrasp o7 #p15 #p17 #g169 #a169))
          :effect (kinfrom o7 #p15 #g169 #a169 #t246)
   )
   (:action s944_ik-arm-motion-from
          :parameters (o7 #p15 #p18 #g170 #a170)
          :precondition (and (isgrasp o7 #p15 #p18 #g170 #a170))
          :effect (kinfrom o7 #p15 #g170 #a170 #t247)
   )
   (:action s945_ik-arm-motion-from
          :parameters (o7 #p16 p312 #g171 #a171)
          :precondition (and (isgrasp o7 #p16 p312 #g171 #a171))
          :effect (kinfrom o7 #p16 #g171 #a171 #t248)
   )
   (:action s946_ik-arm-motion-from
          :parameters (o7 #p16 #p0 #g172 #a172)
          :precondition (and (isgrasp o7 #p16 #p0 #g172 #a172))
          :effect (kinfrom o7 #p16 #g172 #a172 #t249)
   )
   (:action s947_ik-arm-motion-from
          :parameters (o7 #p16 #p1 #g173 #a173)
          :precondition (and (isgrasp o7 #p16 #p1 #g173 #a173))
          :effect (kinfrom o7 #p16 #g173 #a173 #t250)
   )
   (:action s948_ik-arm-motion-from
          :parameters (o7 #p16 #p2 #g174 #a174)
          :precondition (and (isgrasp o7 #p16 #p2 #g174 #a174))
          :effect (kinfrom o7 #p16 #g174 #a174 #t251)
   )
   (:action s949_ik-arm-motion-from
          :parameters (o7 #p16 #p9 #g175 #a175)
          :precondition (and (isgrasp o7 #p16 #p9 #g175 #a175))
          :effect (kinfrom o7 #p16 #g175 #a175 #t252)
   )
   (:action s950_ik-arm-motion-from
          :parameters (o7 #p16 #p10 #g176 #a176)
          :precondition (and (isgrasp o7 #p16 #p10 #g176 #a176))
          :effect (kinfrom o7 #p16 #g176 #a176 #t253)
   )
   (:action s951_ik-arm-motion-from
          :parameters (o7 #p16 #p12 #g177 #a177)
          :precondition (and (isgrasp o7 #p16 #p12 #g177 #a177))
          :effect (kinfrom o7 #p16 #g177 #a177 #t254)
   )
   (:action s952_ik-arm-motion-from
          :parameters (o7 #p16 #p13 #g178 #a178)
          :precondition (and (isgrasp o7 #p16 #p13 #g178 #a178))
          :effect (kinfrom o7 #p16 #g178 #a178 #t255)
   )
   (:action s953_ik-arm-motion-from
          :parameters (o7 #p16 #p14 #g179 #a179)
          :precondition (and (isgrasp o7 #p16 #p14 #g179 #a179))
          :effect (kinfrom o7 #p16 #g179 #a179 #t256)
   )
   (:action s954_ik-arm-motion-from
          :parameters (o7 #p16 #p15 #g180 #a180)
          :precondition (and (isgrasp o7 #p16 #p15 #g180 #a180))
          :effect (kinfrom o7 #p16 #g180 #a180 #t257)
   )
   (:action s955_ik-arm-motion-from
          :parameters (o7 #p16 #p16 #g181 #a181)
          :precondition (and (isgrasp o7 #p16 #p16 #g181 #a181))
          :effect (kinfrom o7 #p16 #g181 #a181 #t258)
   )
   (:action s956_ik-arm-motion-from
          :parameters (o7 #p16 #p17 #g182 #a182)
          :precondition (and (isgrasp o7 #p16 #p17 #g182 #a182))
          :effect (kinfrom o7 #p16 #g182 #a182 #t259)
   )
   (:action s957_ik-arm-motion-from
          :parameters (o7 #p16 #p18 #g183 #a183)
          :precondition (and (isgrasp o7 #p16 #p18 #g183 #a183))
          :effect (kinfrom o7 #p16 #g183 #a183 #t260)
   )
   (:action s958_ik-arm-motion-from
          :parameters (o7 #p17 p312 #g184 #a184)
          :precondition (and (isgrasp o7 #p17 p312 #g184 #a184))
          :effect (kinfrom o7 #p17 #g184 #a184 #t261)
   )
   (:action s959_ik-arm-motion-from
          :parameters (o7 #p17 #p0 #g185 #a185)
          :precondition (and (isgrasp o7 #p17 #p0 #g185 #a185))
          :effect (kinfrom o7 #p17 #g185 #a185 #t262)
   )
   (:action s960_ik-arm-motion-from
          :parameters (o7 #p17 #p1 #g186 #a186)
          :precondition (and (isgrasp o7 #p17 #p1 #g186 #a186))
          :effect (kinfrom o7 #p17 #g186 #a186 #t263)
   )
   (:action s961_ik-arm-motion-from
          :parameters (o7 #p17 #p2 #g187 #a187)
          :precondition (and (isgrasp o7 #p17 #p2 #g187 #a187))
          :effect (kinfrom o7 #p17 #g187 #a187 #t264)
   )
   (:action s962_ik-arm-motion-from
          :parameters (o7 #p17 #p9 #g188 #a188)
          :precondition (and (isgrasp o7 #p17 #p9 #g188 #a188))
          :effect (kinfrom o7 #p17 #g188 #a188 #t265)
   )
   (:action s963_ik-arm-motion-from
          :parameters (o7 #p17 #p10 #g189 #a189)
          :precondition (and (isgrasp o7 #p17 #p10 #g189 #a189))
          :effect (kinfrom o7 #p17 #g189 #a189 #t266)
   )
   (:action s964_ik-arm-motion-from
          :parameters (o7 #p17 #p12 #g190 #a190)
          :precondition (and (isgrasp o7 #p17 #p12 #g190 #a190))
          :effect (kinfrom o7 #p17 #g190 #a190 #t267)
   )
   (:action s965_ik-arm-motion-from
          :parameters (o7 #p17 #p13 #g191 #a191)
          :precondition (and (isgrasp o7 #p17 #p13 #g191 #a191))
          :effect (kinfrom o7 #p17 #g191 #a191 #t268)
   )
   (:action s966_ik-arm-motion-from
          :parameters (o7 #p17 #p14 #g192 #a192)
          :precondition (and (isgrasp o7 #p17 #p14 #g192 #a192))
          :effect (kinfrom o7 #p17 #g192 #a192 #t269)
   )
   (:action s967_ik-arm-motion-from
          :parameters (o7 #p17 #p15 #g193 #a193)
          :precondition (and (isgrasp o7 #p17 #p15 #g193 #a193))
          :effect (kinfrom o7 #p17 #g193 #a193 #t270)
   )
   (:action s968_ik-arm-motion-from
          :parameters (o7 #p17 #p16 #g194 #a194)
          :precondition (and (isgrasp o7 #p17 #p16 #g194 #a194))
          :effect (kinfrom o7 #p17 #g194 #a194 #t271)
   )
   (:action s969_ik-arm-motion-from
          :parameters (o7 #p17 #p17 #g195 #a195)
          :precondition (and (isgrasp o7 #p17 #p17 #g195 #a195))
          :effect (kinfrom o7 #p17 #g195 #a195 #t272)
   )
   (:action s970_ik-arm-motion-from
          :parameters (o7 #p17 #p18 #g196 #a196)
          :precondition (and (isgrasp o7 #p17 #p18 #g196 #a196))
          :effect (kinfrom o7 #p17 #g196 #a196 #t273)
   )
   (:action s971_ik-arm-motion-from
          :parameters (o7 #p18 p312 #g197 #a197)
          :precondition (and (isgrasp o7 #p18 p312 #g197 #a197))
          :effect (kinfrom o7 #p18 #g197 #a197 #t274)
   )
   (:action s972_ik-arm-motion-from
          :parameters (o7 #p18 #p0 #g198 #a198)
          :precondition (and (isgrasp o7 #p18 #p0 #g198 #a198))
          :effect (kinfrom o7 #p18 #g198 #a198 #t275)
   )
   (:action s973_ik-arm-motion-from
          :parameters (o7 #p18 #p1 #g199 #a199)
          :precondition (and (isgrasp o7 #p18 #p1 #g199 #a199))
          :effect (kinfrom o7 #p18 #g199 #a199 #t276)
   )
   (:action s974_ik-arm-motion-from
          :parameters (o7 #p18 #p2 #g200 #a200)
          :precondition (and (isgrasp o7 #p18 #p2 #g200 #a200))
          :effect (kinfrom o7 #p18 #g200 #a200 #t277)
   )
   (:action s975_ik-arm-motion-from
          :parameters (o7 #p18 #p9 #g201 #a201)
          :precondition (and (isgrasp o7 #p18 #p9 #g201 #a201))
          :effect (kinfrom o7 #p18 #g201 #a201 #t278)
   )
   (:action s976_ik-arm-motion-from
          :parameters (o7 #p18 #p10 #g202 #a202)
          :precondition (and (isgrasp o7 #p18 #p10 #g202 #a202))
          :effect (kinfrom o7 #p18 #g202 #a202 #t279)
   )
   (:action s977_ik-arm-motion-from
          :parameters (o7 #p18 #p12 #g203 #a203)
          :precondition (and (isgrasp o7 #p18 #p12 #g203 #a203))
          :effect (kinfrom o7 #p18 #g203 #a203 #t280)
   )
   (:action s978_ik-arm-motion-from
          :parameters (o7 #p18 #p13 #g204 #a204)
          :precondition (and (isgrasp o7 #p18 #p13 #g204 #a204))
          :effect (kinfrom o7 #p18 #g204 #a204 #t281)
   )
   (:action s979_ik-arm-motion-from
          :parameters (o7 #p18 #p14 #g205 #a205)
          :precondition (and (isgrasp o7 #p18 #p14 #g205 #a205))
          :effect (kinfrom o7 #p18 #g205 #a205 #t282)
   )
   (:action s980_ik-arm-motion-from
          :parameters (o7 #p18 #p15 #g206 #a206)
          :precondition (and (isgrasp o7 #p18 #p15 #g206 #a206))
          :effect (kinfrom o7 #p18 #g206 #a206 #t283)
   )
   (:action s981_ik-arm-motion-from
          :parameters (o7 #p18 #p16 #g207 #a207)
          :precondition (and (isgrasp o7 #p18 #p16 #g207 #a207))
          :effect (kinfrom o7 #p18 #g207 #a207 #t284)
   )
   (:action s982_ik-arm-motion-from
          :parameters (o7 #p18 #p17 #g208 #a208)
          :precondition (and (isgrasp o7 #p18 #p17 #g208 #a208))
          :effect (kinfrom o7 #p18 #g208 #a208 #t285)
   )
   (:action s983_ik-arm-motion-from
          :parameters (o7 #p18 #p18 #g209 #a209)
          :precondition (and (isgrasp o7 #p18 #p18 #g209 #a209))
          :effect (kinfrom o7 #p18 #g209 #a209 #t286)
   )
   (:action s984_ik-arm-motion-from
          :parameters (o8 p368 #p19 #g210 #a210)
          :precondition (and (isgrasp o8 p368 #p19 #g210 #a210))
          :effect (kinfrom o8 p368 #g210 #a210 #t287)
   )
   (:action s985_ik-arm-motion-from
          :parameters (o8 p368 #p20 #g211 #a211)
          :precondition (and (isgrasp o8 p368 #p20 #g211 #a211))
          :effect (kinfrom o8 p368 #g211 #a211 #t288)
   )
   (:action s986_ik-arm-motion-from
          :parameters (o8 p368 #p21 #g212 #a212)
          :precondition (and (isgrasp o8 p368 #p21 #g212 #a212))
          :effect (kinfrom o8 p368 #g212 #a212 #t289)
   )
   (:action s987_ik-arm-motion-from
          :parameters (o8 #p3 #p19 #g213 #a213)
          :precondition (and (isgrasp o8 #p3 #p19 #g213 #a213))
          :effect (kinfrom o8 #p3 #g213 #a213 #t290)
   )
   (:action s988_ik-arm-motion-from
          :parameters (o8 #p3 #p20 #g214 #a214)
          :precondition (and (isgrasp o8 #p3 #p20 #g214 #a214))
          :effect (kinfrom o8 #p3 #g214 #a214 #t291)
   )
   (:action s989_ik-arm-motion-from
          :parameters (o8 #p3 #p21 #g215 #a215)
          :precondition (and (isgrasp o8 #p3 #p21 #g215 #a215))
          :effect (kinfrom o8 #p3 #g215 #a215 #t292)
   )
   (:action s990_ik-arm-motion-from
          :parameters (o8 #p4 #p19 #g216 #a216)
          :precondition (and (isgrasp o8 #p4 #p19 #g216 #a216))
          :effect (kinfrom o8 #p4 #g216 #a216 #t293)
   )
   (:action s991_ik-arm-motion-from
          :parameters (o8 #p4 #p20 #g217 #a217)
          :precondition (and (isgrasp o8 #p4 #p20 #g217 #a217))
          :effect (kinfrom o8 #p4 #g217 #a217 #t294)
   )
   (:action s992_ik-arm-motion-from
          :parameters (o8 #p4 #p21 #g218 #a218)
          :precondition (and (isgrasp o8 #p4 #p21 #g218 #a218))
          :effect (kinfrom o8 #p4 #g218 #a218 #t295)
   )
   (:action s993_ik-arm-motion-from
          :parameters (o8 #p5 #p19 #g219 #a219)
          :precondition (and (isgrasp o8 #p5 #p19 #g219 #a219))
          :effect (kinfrom o8 #p5 #g219 #a219 #t296)
   )
   (:action s994_ik-arm-motion-from
          :parameters (o8 #p5 #p20 #g220 #a220)
          :precondition (and (isgrasp o8 #p5 #p20 #g220 #a220))
          :effect (kinfrom o8 #p5 #g220 #a220 #t297)
   )
   (:action s995_ik-arm-motion-from
          :parameters (o8 #p5 #p21 #g221 #a221)
          :precondition (and (isgrasp o8 #p5 #p21 #g221 #a221))
          :effect (kinfrom o8 #p5 #g221 #a221 #t298)
   )
   (:action s996_ik-arm-motion-from
          :parameters (o8 #p11 #p19 #g222 #a222)
          :precondition (and (isgrasp o8 #p11 #p19 #g222 #a222))
          :effect (kinfrom o8 #p11 #g222 #a222 #t299)
   )
   (:action s997_ik-arm-motion-from
          :parameters (o8 #p11 #p20 #g223 #a223)
          :precondition (and (isgrasp o8 #p11 #p20 #g223 #a223))
          :effect (kinfrom o8 #p11 #g223 #a223 #t300)
   )
   (:action s998_ik-arm-motion-from
          :parameters (o8 #p11 #p21 #g224 #a224)
          :precondition (and (isgrasp o8 #p11 #p21 #g224 #a224))
          :effect (kinfrom o8 #p11 #g224 #a224 #t301)
   )
   (:action s999_ik-arm-motion-from
          :parameters (o8 #p19 p368 #g225 #a225)
          :precondition (and (isgrasp o8 #p19 p368 #g225 #a225))
          :effect (kinfrom o8 #p19 #g225 #a225 #t302)
   )
   (:action s1000_ik-arm-motion-from
          :parameters (o8 #p19 #p3 #g226 #a226)
          :precondition (and (isgrasp o8 #p19 #p3 #g226 #a226))
          :effect (kinfrom o8 #p19 #g226 #a226 #t303)
   )
   (:action s1001_ik-arm-motion-from
          :parameters (o8 #p19 #p4 #g227 #a227)
          :precondition (and (isgrasp o8 #p19 #p4 #g227 #a227))
          :effect (kinfrom o8 #p19 #g227 #a227 #t304)
   )
   (:action s1002_ik-arm-motion-from
          :parameters (o8 #p19 #p5 #g228 #a228)
          :precondition (and (isgrasp o8 #p19 #p5 #g228 #a228))
          :effect (kinfrom o8 #p19 #g228 #a228 #t305)
   )
   (:action s1003_ik-arm-motion-from
          :parameters (o8 #p19 #p11 #g229 #a229)
          :precondition (and (isgrasp o8 #p19 #p11 #g229 #a229))
          :effect (kinfrom o8 #p19 #g229 #a229 #t306)
   )
   (:action s1004_ik-arm-motion-from
          :parameters (o8 #p19 #p19 #g230 #a230)
          :precondition (and (isgrasp o8 #p19 #p19 #g230 #a230))
          :effect (kinfrom o8 #p19 #g230 #a230 #t307)
   )
   (:action s1005_ik-arm-motion-from
          :parameters (o8 #p19 #p20 #g231 #a231)
          :precondition (and (isgrasp o8 #p19 #p20 #g231 #a231))
          :effect (kinfrom o8 #p19 #g231 #a231 #t308)
   )
   (:action s1006_ik-arm-motion-from
          :parameters (o8 #p19 #p21 #g232 #a232)
          :precondition (and (isgrasp o8 #p19 #p21 #g232 #a232))
          :effect (kinfrom o8 #p19 #g232 #a232 #t309)
   )
   (:action s1007_ik-arm-motion-from
          :parameters (o8 #p20 p368 #g233 #a233)
          :precondition (and (isgrasp o8 #p20 p368 #g233 #a233))
          :effect (kinfrom o8 #p20 #g233 #a233 #t310)
   )
   (:action s1008_ik-arm-motion-from
          :parameters (o8 #p20 #p3 #g234 #a234)
          :precondition (and (isgrasp o8 #p20 #p3 #g234 #a234))
          :effect (kinfrom o8 #p20 #g234 #a234 #t311)
   )
   (:action s1009_ik-arm-motion-from
          :parameters (o8 #p20 #p4 #g235 #a235)
          :precondition (and (isgrasp o8 #p20 #p4 #g235 #a235))
          :effect (kinfrom o8 #p20 #g235 #a235 #t312)
   )
   (:action s1010_ik-arm-motion-from
          :parameters (o8 #p20 #p5 #g236 #a236)
          :precondition (and (isgrasp o8 #p20 #p5 #g236 #a236))
          :effect (kinfrom o8 #p20 #g236 #a236 #t313)
   )
   (:action s1011_ik-arm-motion-from
          :parameters (o8 #p20 #p11 #g237 #a237)
          :precondition (and (isgrasp o8 #p20 #p11 #g237 #a237))
          :effect (kinfrom o8 #p20 #g237 #a237 #t314)
   )
   (:action s1012_ik-arm-motion-from
          :parameters (o8 #p20 #p19 #g238 #a238)
          :precondition (and (isgrasp o8 #p20 #p19 #g238 #a238))
          :effect (kinfrom o8 #p20 #g238 #a238 #t315)
   )
   (:action s1013_ik-arm-motion-from
          :parameters (o8 #p20 #p20 #g239 #a239)
          :precondition (and (isgrasp o8 #p20 #p20 #g239 #a239))
          :effect (kinfrom o8 #p20 #g239 #a239 #t316)
   )
   (:action s1014_ik-arm-motion-from
          :parameters (o8 #p20 #p21 #g240 #a240)
          :precondition (and (isgrasp o8 #p20 #p21 #g240 #a240))
          :effect (kinfrom o8 #p20 #g240 #a240 #t317)
   )
   (:action s1015_ik-arm-motion-from
          :parameters (o8 #p21 p368 #g241 #a241)
          :precondition (and (isgrasp o8 #p21 p368 #g241 #a241))
          :effect (kinfrom o8 #p21 #g241 #a241 #t318)
   )
   (:action s1016_ik-arm-motion-from
          :parameters (o8 #p21 #p3 #g242 #a242)
          :precondition (and (isgrasp o8 #p21 #p3 #g242 #a242))
          :effect (kinfrom o8 #p21 #g242 #a242 #t319)
   )
   (:action s1017_ik-arm-motion-from
          :parameters (o8 #p21 #p4 #g243 #a243)
          :precondition (and (isgrasp o8 #p21 #p4 #g243 #a243))
          :effect (kinfrom o8 #p21 #g243 #a243 #t320)
   )
   (:action s1018_ik-arm-motion-from
          :parameters (o8 #p21 #p5 #g244 #a244)
          :precondition (and (isgrasp o8 #p21 #p5 #g244 #a244))
          :effect (kinfrom o8 #p21 #g244 #a244 #t321)
   )
   (:action s1019_ik-arm-motion-from
          :parameters (o8 #p21 #p11 #g245 #a245)
          :precondition (and (isgrasp o8 #p21 #p11 #g245 #a245))
          :effect (kinfrom o8 #p21 #g245 #a245 #t322)
   )
   (:action s1020_ik-arm-motion-from
          :parameters (o8 #p21 #p19 #g246 #a246)
          :precondition (and (isgrasp o8 #p21 #p19 #g246 #a246))
          :effect (kinfrom o8 #p21 #g246 #a246 #t323)
   )
   (:action s1021_ik-arm-motion-from
          :parameters (o8 #p21 #p20 #g247 #a247)
          :precondition (and (isgrasp o8 #p21 #p20 #g247 #a247))
          :effect (kinfrom o8 #p21 #g247 #a247 #t324)
   )
   (:action s1022_ik-arm-motion-from
          :parameters (o8 #p21 #p21 #g248 #a248)
          :precondition (and (isgrasp o8 #p21 #p21 #g248 #a248))
          :effect (kinfrom o8 #p21 #g248 #a248 #t325)
   )
   (:action s1023_ik-arm-motion-to
          :parameters (o7 #p12 p312 #g77 #a77)
          :precondition (and (isgrasp o7 p312 #p12 #g77 #a77))
          :effect (kinto o7 #p12 #g77 #a77 #t326)
   )
   (:action s1024_ik-arm-motion-to
          :parameters (o7 #p13 p312 #g78 #a78)
          :precondition (and (isgrasp o7 p312 #p13 #g78 #a78))
          :effect (kinto o7 #p13 #g78 #a78 #t327)
   )
   (:action s1025_ik-arm-motion-to
          :parameters (o7 #p14 p312 #g79 #a79)
          :precondition (and (isgrasp o7 p312 #p14 #g79 #a79))
          :effect (kinto o7 #p14 #g79 #a79 #t328)
   )
   (:action s1026_ik-arm-motion-to
          :parameters (o7 #p15 p312 #g80 #a80)
          :precondition (and (isgrasp o7 p312 #p15 #g80 #a80))
          :effect (kinto o7 #p15 #g80 #a80 #t329)
   )
   (:action s1027_ik-arm-motion-to
          :parameters (o7 #p16 p312 #g81 #a81)
          :precondition (and (isgrasp o7 p312 #p16 #g81 #a81))
          :effect (kinto o7 #p16 #g81 #a81 #t330)
   )
   (:action s1028_ik-arm-motion-to
          :parameters (o7 #p17 p312 #g82 #a82)
          :precondition (and (isgrasp o7 p312 #p17 #g82 #a82))
          :effect (kinto o7 #p17 #g82 #a82 #t331)
   )
   (:action s1029_ik-arm-motion-to
          :parameters (o7 #p18 p312 #g83 #a83)
          :precondition (and (isgrasp o7 p312 #p18 #g83 #a83))
          :effect (kinto o7 #p18 #g83 #a83 #t332)
   )
   (:action s1030_ik-arm-motion-to
          :parameters (o7 #p12 #p0 #g84 #a84)
          :precondition (and (isgrasp o7 #p0 #p12 #g84 #a84))
          :effect (kinto o7 #p12 #g84 #a84 #t333)
   )
   (:action s1031_ik-arm-motion-to
          :parameters (o7 #p13 #p0 #g85 #a85)
          :precondition (and (isgrasp o7 #p0 #p13 #g85 #a85))
          :effect (kinto o7 #p13 #g85 #a85 #t334)
   )
   (:action s1032_ik-arm-motion-to
          :parameters (o7 #p14 #p0 #g86 #a86)
          :precondition (and (isgrasp o7 #p0 #p14 #g86 #a86))
          :effect (kinto o7 #p14 #g86 #a86 #t335)
   )
   (:action s1033_ik-arm-motion-to
          :parameters (o7 #p15 #p0 #g87 #a87)
          :precondition (and (isgrasp o7 #p0 #p15 #g87 #a87))
          :effect (kinto o7 #p15 #g87 #a87 #t336)
   )
   (:action s1034_ik-arm-motion-to
          :parameters (o7 #p16 #p0 #g88 #a88)
          :precondition (and (isgrasp o7 #p0 #p16 #g88 #a88))
          :effect (kinto o7 #p16 #g88 #a88 #t337)
   )
   (:action s1035_ik-arm-motion-to
          :parameters (o7 #p17 #p0 #g89 #a89)
          :precondition (and (isgrasp o7 #p0 #p17 #g89 #a89))
          :effect (kinto o7 #p17 #g89 #a89 #t338)
   )
   (:action s1036_ik-arm-motion-to
          :parameters (o7 #p18 #p0 #g90 #a90)
          :precondition (and (isgrasp o7 #p0 #p18 #g90 #a90))
          :effect (kinto o7 #p18 #g90 #a90 #t339)
   )
   (:action s1037_ik-arm-motion-to
          :parameters (o7 #p12 #p1 #g91 #a91)
          :precondition (and (isgrasp o7 #p1 #p12 #g91 #a91))
          :effect (kinto o7 #p12 #g91 #a91 #t340)
   )
   (:action s1038_ik-arm-motion-to
          :parameters (o7 #p13 #p1 #g92 #a92)
          :precondition (and (isgrasp o7 #p1 #p13 #g92 #a92))
          :effect (kinto o7 #p13 #g92 #a92 #t341)
   )
   (:action s1039_ik-arm-motion-to
          :parameters (o7 #p14 #p1 #g93 #a93)
          :precondition (and (isgrasp o7 #p1 #p14 #g93 #a93))
          :effect (kinto o7 #p14 #g93 #a93 #t342)
   )
   (:action s1040_ik-arm-motion-to
          :parameters (o7 #p15 #p1 #g94 #a94)
          :precondition (and (isgrasp o7 #p1 #p15 #g94 #a94))
          :effect (kinto o7 #p15 #g94 #a94 #t343)
   )
   (:action s1041_ik-arm-motion-to
          :parameters (o7 #p16 #p1 #g95 #a95)
          :precondition (and (isgrasp o7 #p1 #p16 #g95 #a95))
          :effect (kinto o7 #p16 #g95 #a95 #t344)
   )
   (:action s1042_ik-arm-motion-to
          :parameters (o7 #p17 #p1 #g96 #a96)
          :precondition (and (isgrasp o7 #p1 #p17 #g96 #a96))
          :effect (kinto o7 #p17 #g96 #a96 #t345)
   )
   (:action s1043_ik-arm-motion-to
          :parameters (o7 #p18 #p1 #g97 #a97)
          :precondition (and (isgrasp o7 #p1 #p18 #g97 #a97))
          :effect (kinto o7 #p18 #g97 #a97 #t346)
   )
   (:action s1044_ik-arm-motion-to
          :parameters (o7 #p12 #p2 #g98 #a98)
          :precondition (and (isgrasp o7 #p2 #p12 #g98 #a98))
          :effect (kinto o7 #p12 #g98 #a98 #t347)
   )
   (:action s1045_ik-arm-motion-to
          :parameters (o7 #p13 #p2 #g99 #a99)
          :precondition (and (isgrasp o7 #p2 #p13 #g99 #a99))
          :effect (kinto o7 #p13 #g99 #a99 #t348)
   )
   (:action s1046_ik-arm-motion-to
          :parameters (o7 #p14 #p2 #g100 #a100)
          :precondition (and (isgrasp o7 #p2 #p14 #g100 #a100))
          :effect (kinto o7 #p14 #g100 #a100 #t349)
   )
   (:action s1047_ik-arm-motion-to
          :parameters (o7 #p15 #p2 #g101 #a101)
          :precondition (and (isgrasp o7 #p2 #p15 #g101 #a101))
          :effect (kinto o7 #p15 #g101 #a101 #t350)
   )
   (:action s1048_ik-arm-motion-to
          :parameters (o7 #p16 #p2 #g102 #a102)
          :precondition (and (isgrasp o7 #p2 #p16 #g102 #a102))
          :effect (kinto o7 #p16 #g102 #a102 #t351)
   )
   (:action s1049_ik-arm-motion-to
          :parameters (o7 #p17 #p2 #g103 #a103)
          :precondition (and (isgrasp o7 #p2 #p17 #g103 #a103))
          :effect (kinto o7 #p17 #g103 #a103 #t352)
   )
   (:action s1050_ik-arm-motion-to
          :parameters (o7 #p18 #p2 #g104 #a104)
          :precondition (and (isgrasp o7 #p2 #p18 #g104 #a104))
          :effect (kinto o7 #p18 #g104 #a104 #t353)
   )
   (:action s1051_ik-arm-motion-to
          :parameters (o7 #p12 #p9 #g105 #a105)
          :precondition (and (isgrasp o7 #p9 #p12 #g105 #a105))
          :effect (kinto o7 #p12 #g105 #a105 #t354)
   )
   (:action s1052_ik-arm-motion-to
          :parameters (o7 #p13 #p9 #g106 #a106)
          :precondition (and (isgrasp o7 #p9 #p13 #g106 #a106))
          :effect (kinto o7 #p13 #g106 #a106 #t355)
   )
   (:action s1053_ik-arm-motion-to
          :parameters (o7 #p14 #p9 #g107 #a107)
          :precondition (and (isgrasp o7 #p9 #p14 #g107 #a107))
          :effect (kinto o7 #p14 #g107 #a107 #t356)
   )
   (:action s1054_ik-arm-motion-to
          :parameters (o7 #p15 #p9 #g108 #a108)
          :precondition (and (isgrasp o7 #p9 #p15 #g108 #a108))
          :effect (kinto o7 #p15 #g108 #a108 #t357)
   )
   (:action s1055_ik-arm-motion-to
          :parameters (o7 #p16 #p9 #g109 #a109)
          :precondition (and (isgrasp o7 #p9 #p16 #g109 #a109))
          :effect (kinto o7 #p16 #g109 #a109 #t358)
   )
   (:action s1056_ik-arm-motion-to
          :parameters (o7 #p17 #p9 #g110 #a110)
          :precondition (and (isgrasp o7 #p9 #p17 #g110 #a110))
          :effect (kinto o7 #p17 #g110 #a110 #t359)
   )
   (:action s1057_ik-arm-motion-to
          :parameters (o7 #p18 #p9 #g111 #a111)
          :precondition (and (isgrasp o7 #p9 #p18 #g111 #a111))
          :effect (kinto o7 #p18 #g111 #a111 #t360)
   )
   (:action s1058_ik-arm-motion-to
          :parameters (o7 #p12 #p10 #g112 #a112)
          :precondition (and (isgrasp o7 #p10 #p12 #g112 #a112))
          :effect (kinto o7 #p12 #g112 #a112 #t361)
   )
   (:action s1059_ik-arm-motion-to
          :parameters (o7 #p13 #p10 #g113 #a113)
          :precondition (and (isgrasp o7 #p10 #p13 #g113 #a113))
          :effect (kinto o7 #p13 #g113 #a113 #t362)
   )
   (:action s1060_ik-arm-motion-to
          :parameters (o7 #p14 #p10 #g114 #a114)
          :precondition (and (isgrasp o7 #p10 #p14 #g114 #a114))
          :effect (kinto o7 #p14 #g114 #a114 #t363)
   )
   (:action s1061_ik-arm-motion-to
          :parameters (o7 #p15 #p10 #g115 #a115)
          :precondition (and (isgrasp o7 #p10 #p15 #g115 #a115))
          :effect (kinto o7 #p15 #g115 #a115 #t364)
   )
   (:action s1062_ik-arm-motion-to
          :parameters (o7 #p16 #p10 #g116 #a116)
          :precondition (and (isgrasp o7 #p10 #p16 #g116 #a116))
          :effect (kinto o7 #p16 #g116 #a116 #t365)
   )
   (:action s1063_ik-arm-motion-to
          :parameters (o7 #p17 #p10 #g117 #a117)
          :precondition (and (isgrasp o7 #p10 #p17 #g117 #a117))
          :effect (kinto o7 #p17 #g117 #a117 #t366)
   )
   (:action s1064_ik-arm-motion-to
          :parameters (o7 #p18 #p10 #g118 #a118)
          :precondition (and (isgrasp o7 #p10 #p18 #g118 #a118))
          :effect (kinto o7 #p18 #g118 #a118 #t367)
   )
   (:action s1065_ik-arm-motion-to
          :parameters (o7 p312 #p12 #g119 #a119)
          :precondition (and (isgrasp o7 #p12 p312 #g119 #a119))
          :effect (kinto o7 p312 #g119 #a119 #t368)
   )
   (:action s1066_ik-arm-motion-to
          :parameters (o7 #p0 #p12 #g120 #a120)
          :precondition (and (isgrasp o7 #p12 #p0 #g120 #a120))
          :effect (kinto o7 #p0 #g120 #a120 #t369)
   )
   (:action s1067_ik-arm-motion-to
          :parameters (o7 #p1 #p12 #g121 #a121)
          :precondition (and (isgrasp o7 #p12 #p1 #g121 #a121))
          :effect (kinto o7 #p1 #g121 #a121 #t370)
   )
   (:action s1068_ik-arm-motion-to
          :parameters (o7 #p2 #p12 #g122 #a122)
          :precondition (and (isgrasp o7 #p12 #p2 #g122 #a122))
          :effect (kinto o7 #p2 #g122 #a122 #t371)
   )
   (:action s1069_ik-arm-motion-to
          :parameters (o7 #p9 #p12 #g123 #a123)
          :precondition (and (isgrasp o7 #p12 #p9 #g123 #a123))
          :effect (kinto o7 #p9 #g123 #a123 #t372)
   )
   (:action s1070_ik-arm-motion-to
          :parameters (o7 #p10 #p12 #g124 #a124)
          :precondition (and (isgrasp o7 #p12 #p10 #g124 #a124))
          :effect (kinto o7 #p10 #g124 #a124 #t373)
   )
   (:action s1071_ik-arm-motion-to
          :parameters (o7 #p12 #p12 #g125 #a125)
          :precondition (and (isgrasp o7 #p12 #p12 #g125 #a125))
          :effect (kinto o7 #p12 #g125 #a125 #t374)
   )
   (:action s1072_ik-arm-motion-to
          :parameters (o7 #p13 #p12 #g126 #a126)
          :precondition (and (isgrasp o7 #p12 #p13 #g126 #a126))
          :effect (kinto o7 #p13 #g126 #a126 #t375)
   )
   (:action s1073_ik-arm-motion-to
          :parameters (o7 #p14 #p12 #g127 #a127)
          :precondition (and (isgrasp o7 #p12 #p14 #g127 #a127))
          :effect (kinto o7 #p14 #g127 #a127 #t376)
   )
   (:action s1074_ik-arm-motion-to
          :parameters (o7 #p15 #p12 #g128 #a128)
          :precondition (and (isgrasp o7 #p12 #p15 #g128 #a128))
          :effect (kinto o7 #p15 #g128 #a128 #t377)
   )
   (:action s1075_ik-arm-motion-to
          :parameters (o7 #p16 #p12 #g129 #a129)
          :precondition (and (isgrasp o7 #p12 #p16 #g129 #a129))
          :effect (kinto o7 #p16 #g129 #a129 #t378)
   )
   (:action s1076_ik-arm-motion-to
          :parameters (o7 #p17 #p12 #g130 #a130)
          :precondition (and (isgrasp o7 #p12 #p17 #g130 #a130))
          :effect (kinto o7 #p17 #g130 #a130 #t379)
   )
   (:action s1077_ik-arm-motion-to
          :parameters (o7 #p18 #p12 #g131 #a131)
          :precondition (and (isgrasp o7 #p12 #p18 #g131 #a131))
          :effect (kinto o7 #p18 #g131 #a131 #t380)
   )
   (:action s1078_ik-arm-motion-to
          :parameters (o7 p312 #p13 #g132 #a132)
          :precondition (and (isgrasp o7 #p13 p312 #g132 #a132))
          :effect (kinto o7 p312 #g132 #a132 #t381)
   )
   (:action s1079_ik-arm-motion-to
          :parameters (o7 #p0 #p13 #g133 #a133)
          :precondition (and (isgrasp o7 #p13 #p0 #g133 #a133))
          :effect (kinto o7 #p0 #g133 #a133 #t382)
   )
   (:action s1080_ik-arm-motion-to
          :parameters (o7 #p1 #p13 #g134 #a134)
          :precondition (and (isgrasp o7 #p13 #p1 #g134 #a134))
          :effect (kinto o7 #p1 #g134 #a134 #t383)
   )
   (:action s1081_ik-arm-motion-to
          :parameters (o7 #p2 #p13 #g135 #a135)
          :precondition (and (isgrasp o7 #p13 #p2 #g135 #a135))
          :effect (kinto o7 #p2 #g135 #a135 #t384)
   )
   (:action s1082_ik-arm-motion-to
          :parameters (o7 #p9 #p13 #g136 #a136)
          :precondition (and (isgrasp o7 #p13 #p9 #g136 #a136))
          :effect (kinto o7 #p9 #g136 #a136 #t385)
   )
   (:action s1083_ik-arm-motion-to
          :parameters (o7 #p10 #p13 #g137 #a137)
          :precondition (and (isgrasp o7 #p13 #p10 #g137 #a137))
          :effect (kinto o7 #p10 #g137 #a137 #t386)
   )
   (:action s1084_ik-arm-motion-to
          :parameters (o7 #p12 #p13 #g138 #a138)
          :precondition (and (isgrasp o7 #p13 #p12 #g138 #a138))
          :effect (kinto o7 #p12 #g138 #a138 #t387)
   )
   (:action s1085_ik-arm-motion-to
          :parameters (o7 #p13 #p13 #g139 #a139)
          :precondition (and (isgrasp o7 #p13 #p13 #g139 #a139))
          :effect (kinto o7 #p13 #g139 #a139 #t388)
   )
   (:action s1086_ik-arm-motion-to
          :parameters (o7 #p14 #p13 #g140 #a140)
          :precondition (and (isgrasp o7 #p13 #p14 #g140 #a140))
          :effect (kinto o7 #p14 #g140 #a140 #t389)
   )
   (:action s1087_ik-arm-motion-to
          :parameters (o7 #p15 #p13 #g141 #a141)
          :precondition (and (isgrasp o7 #p13 #p15 #g141 #a141))
          :effect (kinto o7 #p15 #g141 #a141 #t390)
   )
   (:action s1088_ik-arm-motion-to
          :parameters (o7 #p16 #p13 #g142 #a142)
          :precondition (and (isgrasp o7 #p13 #p16 #g142 #a142))
          :effect (kinto o7 #p16 #g142 #a142 #t391)
   )
   (:action s1089_ik-arm-motion-to
          :parameters (o7 #p17 #p13 #g143 #a143)
          :precondition (and (isgrasp o7 #p13 #p17 #g143 #a143))
          :effect (kinto o7 #p17 #g143 #a143 #t392)
   )
   (:action s1090_ik-arm-motion-to
          :parameters (o7 #p18 #p13 #g144 #a144)
          :precondition (and (isgrasp o7 #p13 #p18 #g144 #a144))
          :effect (kinto o7 #p18 #g144 #a144 #t393)
   )
   (:action s1091_ik-arm-motion-to
          :parameters (o7 p312 #p14 #g145 #a145)
          :precondition (and (isgrasp o7 #p14 p312 #g145 #a145))
          :effect (kinto o7 p312 #g145 #a145 #t394)
   )
   (:action s1092_ik-arm-motion-to
          :parameters (o7 #p0 #p14 #g146 #a146)
          :precondition (and (isgrasp o7 #p14 #p0 #g146 #a146))
          :effect (kinto o7 #p0 #g146 #a146 #t395)
   )
   (:action s1093_ik-arm-motion-to
          :parameters (o7 #p1 #p14 #g147 #a147)
          :precondition (and (isgrasp o7 #p14 #p1 #g147 #a147))
          :effect (kinto o7 #p1 #g147 #a147 #t396)
   )
   (:action s1094_ik-arm-motion-to
          :parameters (o7 #p2 #p14 #g148 #a148)
          :precondition (and (isgrasp o7 #p14 #p2 #g148 #a148))
          :effect (kinto o7 #p2 #g148 #a148 #t397)
   )
   (:action s1095_ik-arm-motion-to
          :parameters (o7 #p9 #p14 #g149 #a149)
          :precondition (and (isgrasp o7 #p14 #p9 #g149 #a149))
          :effect (kinto o7 #p9 #g149 #a149 #t398)
   )
   (:action s1096_ik-arm-motion-to
          :parameters (o7 #p10 #p14 #g150 #a150)
          :precondition (and (isgrasp o7 #p14 #p10 #g150 #a150))
          :effect (kinto o7 #p10 #g150 #a150 #t399)
   )
   (:action s1097_ik-arm-motion-to
          :parameters (o7 #p12 #p14 #g151 #a151)
          :precondition (and (isgrasp o7 #p14 #p12 #g151 #a151))
          :effect (kinto o7 #p12 #g151 #a151 #t400)
   )
   (:action s1098_ik-arm-motion-to
          :parameters (o7 #p13 #p14 #g152 #a152)
          :precondition (and (isgrasp o7 #p14 #p13 #g152 #a152))
          :effect (kinto o7 #p13 #g152 #a152 #t401)
   )
   (:action s1099_ik-arm-motion-to
          :parameters (o7 #p14 #p14 #g153 #a153)
          :precondition (and (isgrasp o7 #p14 #p14 #g153 #a153))
          :effect (kinto o7 #p14 #g153 #a153 #t402)
   )
   (:action s1100_ik-arm-motion-to
          :parameters (o7 #p15 #p14 #g154 #a154)
          :precondition (and (isgrasp o7 #p14 #p15 #g154 #a154))
          :effect (kinto o7 #p15 #g154 #a154 #t403)
   )
   (:action s1101_ik-arm-motion-to
          :parameters (o7 #p16 #p14 #g155 #a155)
          :precondition (and (isgrasp o7 #p14 #p16 #g155 #a155))
          :effect (kinto o7 #p16 #g155 #a155 #t404)
   )
   (:action s1102_ik-arm-motion-to
          :parameters (o7 #p17 #p14 #g156 #a156)
          :precondition (and (isgrasp o7 #p14 #p17 #g156 #a156))
          :effect (kinto o7 #p17 #g156 #a156 #t405)
   )
   (:action s1103_ik-arm-motion-to
          :parameters (o7 #p18 #p14 #g157 #a157)
          :precondition (and (isgrasp o7 #p14 #p18 #g157 #a157))
          :effect (kinto o7 #p18 #g157 #a157 #t406)
   )
   (:action s1104_ik-arm-motion-to
          :parameters (o7 p312 #p15 #g158 #a158)
          :precondition (and (isgrasp o7 #p15 p312 #g158 #a158))
          :effect (kinto o7 p312 #g158 #a158 #t407)
   )
   (:action s1105_ik-arm-motion-to
          :parameters (o7 #p0 #p15 #g159 #a159)
          :precondition (and (isgrasp o7 #p15 #p0 #g159 #a159))
          :effect (kinto o7 #p0 #g159 #a159 #t408)
   )
   (:action s1106_ik-arm-motion-to
          :parameters (o7 #p1 #p15 #g160 #a160)
          :precondition (and (isgrasp o7 #p15 #p1 #g160 #a160))
          :effect (kinto o7 #p1 #g160 #a160 #t409)
   )
   (:action s1107_ik-arm-motion-to
          :parameters (o7 #p2 #p15 #g161 #a161)
          :precondition (and (isgrasp o7 #p15 #p2 #g161 #a161))
          :effect (kinto o7 #p2 #g161 #a161 #t410)
   )
   (:action s1108_ik-arm-motion-to
          :parameters (o7 #p9 #p15 #g162 #a162)
          :precondition (and (isgrasp o7 #p15 #p9 #g162 #a162))
          :effect (kinto o7 #p9 #g162 #a162 #t411)
   )
   (:action s1109_ik-arm-motion-to
          :parameters (o7 #p10 #p15 #g163 #a163)
          :precondition (and (isgrasp o7 #p15 #p10 #g163 #a163))
          :effect (kinto o7 #p10 #g163 #a163 #t412)
   )
   (:action s1110_ik-arm-motion-to
          :parameters (o7 #p12 #p15 #g164 #a164)
          :precondition (and (isgrasp o7 #p15 #p12 #g164 #a164))
          :effect (kinto o7 #p12 #g164 #a164 #t413)
   )
   (:action s1111_ik-arm-motion-to
          :parameters (o7 #p13 #p15 #g165 #a165)
          :precondition (and (isgrasp o7 #p15 #p13 #g165 #a165))
          :effect (kinto o7 #p13 #g165 #a165 #t414)
   )
   (:action s1112_ik-arm-motion-to
          :parameters (o7 #p14 #p15 #g166 #a166)
          :precondition (and (isgrasp o7 #p15 #p14 #g166 #a166))
          :effect (kinto o7 #p14 #g166 #a166 #t415)
   )
   (:action s1113_ik-arm-motion-to
          :parameters (o7 #p15 #p15 #g167 #a167)
          :precondition (and (isgrasp o7 #p15 #p15 #g167 #a167))
          :effect (kinto o7 #p15 #g167 #a167 #t416)
   )
   (:action s1114_ik-arm-motion-to
          :parameters (o7 #p16 #p15 #g168 #a168)
          :precondition (and (isgrasp o7 #p15 #p16 #g168 #a168))
          :effect (kinto o7 #p16 #g168 #a168 #t417)
   )
   (:action s1115_ik-arm-motion-to
          :parameters (o7 #p17 #p15 #g169 #a169)
          :precondition (and (isgrasp o7 #p15 #p17 #g169 #a169))
          :effect (kinto o7 #p17 #g169 #a169 #t418)
   )
   (:action s1116_ik-arm-motion-to
          :parameters (o7 #p18 #p15 #g170 #a170)
          :precondition (and (isgrasp o7 #p15 #p18 #g170 #a170))
          :effect (kinto o7 #p18 #g170 #a170 #t419)
   )
   (:action s1117_ik-arm-motion-to
          :parameters (o7 p312 #p16 #g171 #a171)
          :precondition (and (isgrasp o7 #p16 p312 #g171 #a171))
          :effect (kinto o7 p312 #g171 #a171 #t420)
   )
   (:action s1118_ik-arm-motion-to
          :parameters (o7 #p0 #p16 #g172 #a172)
          :precondition (and (isgrasp o7 #p16 #p0 #g172 #a172))
          :effect (kinto o7 #p0 #g172 #a172 #t421)
   )
   (:action s1119_ik-arm-motion-to
          :parameters (o7 #p1 #p16 #g173 #a173)
          :precondition (and (isgrasp o7 #p16 #p1 #g173 #a173))
          :effect (kinto o7 #p1 #g173 #a173 #t422)
   )
   (:action s1120_ik-arm-motion-to
          :parameters (o7 #p2 #p16 #g174 #a174)
          :precondition (and (isgrasp o7 #p16 #p2 #g174 #a174))
          :effect (kinto o7 #p2 #g174 #a174 #t423)
   )
   (:action s1121_ik-arm-motion-to
          :parameters (o7 #p9 #p16 #g175 #a175)
          :precondition (and (isgrasp o7 #p16 #p9 #g175 #a175))
          :effect (kinto o7 #p9 #g175 #a175 #t424)
   )
   (:action s1122_ik-arm-motion-to
          :parameters (o7 #p10 #p16 #g176 #a176)
          :precondition (and (isgrasp o7 #p16 #p10 #g176 #a176))
          :effect (kinto o7 #p10 #g176 #a176 #t425)
   )
   (:action s1123_ik-arm-motion-to
          :parameters (o7 #p12 #p16 #g177 #a177)
          :precondition (and (isgrasp o7 #p16 #p12 #g177 #a177))
          :effect (kinto o7 #p12 #g177 #a177 #t426)
   )
   (:action s1124_ik-arm-motion-to
          :parameters (o7 #p13 #p16 #g178 #a178)
          :precondition (and (isgrasp o7 #p16 #p13 #g178 #a178))
          :effect (kinto o7 #p13 #g178 #a178 #t427)
   )
   (:action s1125_ik-arm-motion-to
          :parameters (o7 #p14 #p16 #g179 #a179)
          :precondition (and (isgrasp o7 #p16 #p14 #g179 #a179))
          :effect (kinto o7 #p14 #g179 #a179 #t428)
   )
   (:action s1126_ik-arm-motion-to
          :parameters (o7 #p15 #p16 #g180 #a180)
          :precondition (and (isgrasp o7 #p16 #p15 #g180 #a180))
          :effect (kinto o7 #p15 #g180 #a180 #t429)
   )
   (:action s1127_ik-arm-motion-to
          :parameters (o7 #p16 #p16 #g181 #a181)
          :precondition (and (isgrasp o7 #p16 #p16 #g181 #a181))
          :effect (kinto o7 #p16 #g181 #a181 #t430)
   )
   (:action s1128_ik-arm-motion-to
          :parameters (o7 #p17 #p16 #g182 #a182)
          :precondition (and (isgrasp o7 #p16 #p17 #g182 #a182))
          :effect (kinto o7 #p17 #g182 #a182 #t431)
   )
   (:action s1129_ik-arm-motion-to
          :parameters (o7 #p18 #p16 #g183 #a183)
          :precondition (and (isgrasp o7 #p16 #p18 #g183 #a183))
          :effect (kinto o7 #p18 #g183 #a183 #t432)
   )
   (:action s1130_ik-arm-motion-to
          :parameters (o7 p312 #p17 #g184 #a184)
          :precondition (and (isgrasp o7 #p17 p312 #g184 #a184))
          :effect (kinto o7 p312 #g184 #a184 #t433)
   )
   (:action s1131_ik-arm-motion-to
          :parameters (o7 #p0 #p17 #g185 #a185)
          :precondition (and (isgrasp o7 #p17 #p0 #g185 #a185))
          :effect (kinto o7 #p0 #g185 #a185 #t434)
   )
   (:action s1132_ik-arm-motion-to
          :parameters (o7 #p1 #p17 #g186 #a186)
          :precondition (and (isgrasp o7 #p17 #p1 #g186 #a186))
          :effect (kinto o7 #p1 #g186 #a186 #t435)
   )
   (:action s1133_ik-arm-motion-to
          :parameters (o7 #p2 #p17 #g187 #a187)
          :precondition (and (isgrasp o7 #p17 #p2 #g187 #a187))
          :effect (kinto o7 #p2 #g187 #a187 #t436)
   )
   (:action s1134_ik-arm-motion-to
          :parameters (o7 #p9 #p17 #g188 #a188)
          :precondition (and (isgrasp o7 #p17 #p9 #g188 #a188))
          :effect (kinto o7 #p9 #g188 #a188 #t437)
   )
   (:action s1135_ik-arm-motion-to
          :parameters (o7 #p10 #p17 #g189 #a189)
          :precondition (and (isgrasp o7 #p17 #p10 #g189 #a189))
          :effect (kinto o7 #p10 #g189 #a189 #t438)
   )
   (:action s1136_ik-arm-motion-to
          :parameters (o7 #p12 #p17 #g190 #a190)
          :precondition (and (isgrasp o7 #p17 #p12 #g190 #a190))
          :effect (kinto o7 #p12 #g190 #a190 #t439)
   )
   (:action s1137_ik-arm-motion-to
          :parameters (o7 #p13 #p17 #g191 #a191)
          :precondition (and (isgrasp o7 #p17 #p13 #g191 #a191))
          :effect (kinto o7 #p13 #g191 #a191 #t440)
   )
   (:action s1138_ik-arm-motion-to
          :parameters (o7 #p14 #p17 #g192 #a192)
          :precondition (and (isgrasp o7 #p17 #p14 #g192 #a192))
          :effect (kinto o7 #p14 #g192 #a192 #t441)
   )
   (:action s1139_ik-arm-motion-to
          :parameters (o7 #p15 #p17 #g193 #a193)
          :precondition (and (isgrasp o7 #p17 #p15 #g193 #a193))
          :effect (kinto o7 #p15 #g193 #a193 #t442)
   )
   (:action s1140_ik-arm-motion-to
          :parameters (o7 #p16 #p17 #g194 #a194)
          :precondition (and (isgrasp o7 #p17 #p16 #g194 #a194))
          :effect (kinto o7 #p16 #g194 #a194 #t443)
   )
   (:action s1141_ik-arm-motion-to
          :parameters (o7 #p17 #p17 #g195 #a195)
          :precondition (and (isgrasp o7 #p17 #p17 #g195 #a195))
          :effect (kinto o7 #p17 #g195 #a195 #t444)
   )
   (:action s1142_ik-arm-motion-to
          :parameters (o7 #p18 #p17 #g196 #a196)
          :precondition (and (isgrasp o7 #p17 #p18 #g196 #a196))
          :effect (kinto o7 #p18 #g196 #a196 #t445)
   )
   (:action s1143_ik-arm-motion-to
          :parameters (o7 p312 #p18 #g197 #a197)
          :precondition (and (isgrasp o7 #p18 p312 #g197 #a197))
          :effect (kinto o7 p312 #g197 #a197 #t446)
   )
   (:action s1144_ik-arm-motion-to
          :parameters (o7 #p0 #p18 #g198 #a198)
          :precondition (and (isgrasp o7 #p18 #p0 #g198 #a198))
          :effect (kinto o7 #p0 #g198 #a198 #t447)
   )
   (:action s1145_ik-arm-motion-to
          :parameters (o7 #p1 #p18 #g199 #a199)
          :precondition (and (isgrasp o7 #p18 #p1 #g199 #a199))
          :effect (kinto o7 #p1 #g199 #a199 #t448)
   )
   (:action s1146_ik-arm-motion-to
          :parameters (o7 #p2 #p18 #g200 #a200)
          :precondition (and (isgrasp o7 #p18 #p2 #g200 #a200))
          :effect (kinto o7 #p2 #g200 #a200 #t449)
   )
   (:action s1147_ik-arm-motion-to
          :parameters (o7 #p9 #p18 #g201 #a201)
          :precondition (and (isgrasp o7 #p18 #p9 #g201 #a201))
          :effect (kinto o7 #p9 #g201 #a201 #t450)
   )
   (:action s1148_ik-arm-motion-to
          :parameters (o7 #p10 #p18 #g202 #a202)
          :precondition (and (isgrasp o7 #p18 #p10 #g202 #a202))
          :effect (kinto o7 #p10 #g202 #a202 #t451)
   )
   (:action s1149_ik-arm-motion-to
          :parameters (o7 #p12 #p18 #g203 #a203)
          :precondition (and (isgrasp o7 #p18 #p12 #g203 #a203))
          :effect (kinto o7 #p12 #g203 #a203 #t452)
   )
   (:action s1150_ik-arm-motion-to
          :parameters (o7 #p13 #p18 #g204 #a204)
          :precondition (and (isgrasp o7 #p18 #p13 #g204 #a204))
          :effect (kinto o7 #p13 #g204 #a204 #t453)
   )
   (:action s1151_ik-arm-motion-to
          :parameters (o7 #p14 #p18 #g205 #a205)
          :precondition (and (isgrasp o7 #p18 #p14 #g205 #a205))
          :effect (kinto o7 #p14 #g205 #a205 #t454)
   )
   (:action s1152_ik-arm-motion-to
          :parameters (o7 #p15 #p18 #g206 #a206)
          :precondition (and (isgrasp o7 #p18 #p15 #g206 #a206))
          :effect (kinto o7 #p15 #g206 #a206 #t455)
   )
   (:action s1153_ik-arm-motion-to
          :parameters (o7 #p16 #p18 #g207 #a207)
          :precondition (and (isgrasp o7 #p18 #p16 #g207 #a207))
          :effect (kinto o7 #p16 #g207 #a207 #t456)
   )
   (:action s1154_ik-arm-motion-to
          :parameters (o7 #p17 #p18 #g208 #a208)
          :precondition (and (isgrasp o7 #p18 #p17 #g208 #a208))
          :effect (kinto o7 #p17 #g208 #a208 #t457)
   )
   (:action s1155_ik-arm-motion-to
          :parameters (o7 #p18 #p18 #g209 #a209)
          :precondition (and (isgrasp o7 #p18 #p18 #g209 #a209))
          :effect (kinto o7 #p18 #g209 #a209 #t458)
   )
   (:action s1156_ik-arm-motion-to
          :parameters (o8 #p19 p368 #g210 #a210)
          :precondition (and (isgrasp o8 p368 #p19 #g210 #a210))
          :effect (kinto o8 #p19 #g210 #a210 #t459)
   )
   (:action s1157_ik-arm-motion-to
          :parameters (o8 #p20 p368 #g211 #a211)
          :precondition (and (isgrasp o8 p368 #p20 #g211 #a211))
          :effect (kinto o8 #p20 #g211 #a211 #t460)
   )
   (:action s1158_ik-arm-motion-to
          :parameters (o8 #p21 p368 #g212 #a212)
          :precondition (and (isgrasp o8 p368 #p21 #g212 #a212))
          :effect (kinto o8 #p21 #g212 #a212 #t461)
   )
   (:action s1159_ik-arm-motion-to
          :parameters (o8 #p19 #p3 #g213 #a213)
          :precondition (and (isgrasp o8 #p3 #p19 #g213 #a213))
          :effect (kinto o8 #p19 #g213 #a213 #t462)
   )
   (:action s1160_ik-arm-motion-to
          :parameters (o8 #p20 #p3 #g214 #a214)
          :precondition (and (isgrasp o8 #p3 #p20 #g214 #a214))
          :effect (kinto o8 #p20 #g214 #a214 #t463)
   )
   (:action s1161_ik-arm-motion-to
          :parameters (o8 #p21 #p3 #g215 #a215)
          :precondition (and (isgrasp o8 #p3 #p21 #g215 #a215))
          :effect (kinto o8 #p21 #g215 #a215 #t464)
   )
   (:action s1162_ik-arm-motion-to
          :parameters (o8 #p19 #p4 #g216 #a216)
          :precondition (and (isgrasp o8 #p4 #p19 #g216 #a216))
          :effect (kinto o8 #p19 #g216 #a216 #t465)
   )
   (:action s1163_ik-arm-motion-to
          :parameters (o8 #p20 #p4 #g217 #a217)
          :precondition (and (isgrasp o8 #p4 #p20 #g217 #a217))
          :effect (kinto o8 #p20 #g217 #a217 #t466)
   )
   (:action s1164_ik-arm-motion-to
          :parameters (o8 #p21 #p4 #g218 #a218)
          :precondition (and (isgrasp o8 #p4 #p21 #g218 #a218))
          :effect (kinto o8 #p21 #g218 #a218 #t467)
   )
   (:action s1165_ik-arm-motion-to
          :parameters (o8 #p19 #p5 #g219 #a219)
          :precondition (and (isgrasp o8 #p5 #p19 #g219 #a219))
          :effect (kinto o8 #p19 #g219 #a219 #t468)
   )
   (:action s1166_ik-arm-motion-to
          :parameters (o8 #p20 #p5 #g220 #a220)
          :precondition (and (isgrasp o8 #p5 #p20 #g220 #a220))
          :effect (kinto o8 #p20 #g220 #a220 #t469)
   )
   (:action s1167_ik-arm-motion-to
          :parameters (o8 #p21 #p5 #g221 #a221)
          :precondition (and (isgrasp o8 #p5 #p21 #g221 #a221))
          :effect (kinto o8 #p21 #g221 #a221 #t470)
   )
   (:action s1168_ik-arm-motion-to
          :parameters (o8 #p19 #p11 #g222 #a222)
          :precondition (and (isgrasp o8 #p11 #p19 #g222 #a222))
          :effect (kinto o8 #p19 #g222 #a222 #t471)
   )
   (:action s1169_ik-arm-motion-to
          :parameters (o8 #p20 #p11 #g223 #a223)
          :precondition (and (isgrasp o8 #p11 #p20 #g223 #a223))
          :effect (kinto o8 #p20 #g223 #a223 #t472)
   )
   (:action s1170_ik-arm-motion-to
          :parameters (o8 #p21 #p11 #g224 #a224)
          :precondition (and (isgrasp o8 #p11 #p21 #g224 #a224))
          :effect (kinto o8 #p21 #g224 #a224 #t473)
   )
   (:action s1171_ik-arm-motion-to
          :parameters (o8 p368 #p19 #g225 #a225)
          :precondition (and (isgrasp o8 #p19 p368 #g225 #a225))
          :effect (kinto o8 p368 #g225 #a225 #t474)
   )
   (:action s1172_ik-arm-motion-to
          :parameters (o8 #p3 #p19 #g226 #a226)
          :precondition (and (isgrasp o8 #p19 #p3 #g226 #a226))
          :effect (kinto o8 #p3 #g226 #a226 #t475)
   )
   (:action s1173_ik-arm-motion-to
          :parameters (o8 #p4 #p19 #g227 #a227)
          :precondition (and (isgrasp o8 #p19 #p4 #g227 #a227))
          :effect (kinto o8 #p4 #g227 #a227 #t476)
   )
   (:action s1174_ik-arm-motion-to
          :parameters (o8 #p5 #p19 #g228 #a228)
          :precondition (and (isgrasp o8 #p19 #p5 #g228 #a228))
          :effect (kinto o8 #p5 #g228 #a228 #t477)
   )
   (:action s1175_ik-arm-motion-to
          :parameters (o8 #p11 #p19 #g229 #a229)
          :precondition (and (isgrasp o8 #p19 #p11 #g229 #a229))
          :effect (kinto o8 #p11 #g229 #a229 #t478)
   )
   (:action s1176_ik-arm-motion-to
          :parameters (o8 #p19 #p19 #g230 #a230)
          :precondition (and (isgrasp o8 #p19 #p19 #g230 #a230))
          :effect (kinto o8 #p19 #g230 #a230 #t479)
   )
   (:action s1177_ik-arm-motion-to
          :parameters (o8 #p20 #p19 #g231 #a231)
          :precondition (and (isgrasp o8 #p19 #p20 #g231 #a231))
          :effect (kinto o8 #p20 #g231 #a231 #t480)
   )
   (:action s1178_ik-arm-motion-to
          :parameters (o8 #p21 #p19 #g232 #a232)
          :precondition (and (isgrasp o8 #p19 #p21 #g232 #a232))
          :effect (kinto o8 #p21 #g232 #a232 #t481)
   )
   (:action s1179_ik-arm-motion-to
          :parameters (o8 p368 #p20 #g233 #a233)
          :precondition (and (isgrasp o8 #p20 p368 #g233 #a233))
          :effect (kinto o8 p368 #g233 #a233 #t482)
   )
   (:action s1180_ik-arm-motion-to
          :parameters (o8 #p3 #p20 #g234 #a234)
          :precondition (and (isgrasp o8 #p20 #p3 #g234 #a234))
          :effect (kinto o8 #p3 #g234 #a234 #t483)
   )
   (:action s1181_ik-arm-motion-to
          :parameters (o8 #p4 #p20 #g235 #a235)
          :precondition (and (isgrasp o8 #p20 #p4 #g235 #a235))
          :effect (kinto o8 #p4 #g235 #a235 #t484)
   )
   (:action s1182_ik-arm-motion-to
          :parameters (o8 #p5 #p20 #g236 #a236)
          :precondition (and (isgrasp o8 #p20 #p5 #g236 #a236))
          :effect (kinto o8 #p5 #g236 #a236 #t485)
   )
   (:action s1183_ik-arm-motion-to
          :parameters (o8 #p11 #p20 #g237 #a237)
          :precondition (and (isgrasp o8 #p20 #p11 #g237 #a237))
          :effect (kinto o8 #p11 #g237 #a237 #t486)
   )
   (:action s1184_ik-arm-motion-to
          :parameters (o8 #p19 #p20 #g238 #a238)
          :precondition (and (isgrasp o8 #p20 #p19 #g238 #a238))
          :effect (kinto o8 #p19 #g238 #a238 #t487)
   )
   (:action s1185_ik-arm-motion-to
          :parameters (o8 #p20 #p20 #g239 #a239)
          :precondition (and (isgrasp o8 #p20 #p20 #g239 #a239))
          :effect (kinto o8 #p20 #g239 #a239 #t488)
   )
   (:action s1186_ik-arm-motion-to
          :parameters (o8 #p21 #p20 #g240 #a240)
          :precondition (and (isgrasp o8 #p20 #p21 #g240 #a240))
          :effect (kinto o8 #p21 #g240 #a240 #t489)
   )
   (:action s1187_ik-arm-motion-to
          :parameters (o8 p368 #p21 #g241 #a241)
          :precondition (and (isgrasp o8 #p21 p368 #g241 #a241))
          :effect (kinto o8 p368 #g241 #a241 #t490)
   )
   (:action s1188_ik-arm-motion-to
          :parameters (o8 #p3 #p21 #g242 #a242)
          :precondition (and (isgrasp o8 #p21 #p3 #g242 #a242))
          :effect (kinto o8 #p3 #g242 #a242 #t491)
   )
   (:action s1189_ik-arm-motion-to
          :parameters (o8 #p4 #p21 #g243 #a243)
          :precondition (and (isgrasp o8 #p21 #p4 #g243 #a243))
          :effect (kinto o8 #p4 #g243 #a243 #t492)
   )
   (:action s1190_ik-arm-motion-to
          :parameters (o8 #p5 #p21 #g244 #a244)
          :precondition (and (isgrasp o8 #p21 #p5 #g244 #a244))
          :effect (kinto o8 #p5 #g244 #a244 #t493)
   )
   (:action s1191_ik-arm-motion-to
          :parameters (o8 #p11 #p21 #g245 #a245)
          :precondition (and (isgrasp o8 #p21 #p11 #g245 #a245))
          :effect (kinto o8 #p11 #g245 #a245 #t494)
   )
   (:action s1192_ik-arm-motion-to
          :parameters (o8 #p19 #p21 #g246 #a246)
          :precondition (and (isgrasp o8 #p21 #p19 #g246 #a246))
          :effect (kinto o8 #p19 #g246 #a246 #t495)
   )
   (:action s1193_ik-arm-motion-to
          :parameters (o8 #p20 #p21 #g247 #a247)
          :precondition (and (isgrasp o8 #p21 #p20 #g247 #a247))
          :effect (kinto o8 #p20 #g247 #a247 #t496)
   )
   (:action s1194_ik-arm-motion-to
          :parameters (o8 #p21 #p21 #g248 #a248)
          :precondition (and (isgrasp o8 #p21 #p21 #g248 #a248))
          :effect (kinto o8 #p21 #g248 #a248 #t497)
   )
   (:action s1195_ik-arm-motion-from
          :parameters (o7 p312 #p22 #g249 #a249)
          :precondition (and (isgrasp o7 p312 #p22 #g249 #a249))
          :effect (kinfrom o7 p312 #g249 #a249 #t498)
   )
   (:action s1196_ik-arm-motion-from
          :parameters (o7 p312 #p23 #g250 #a250)
          :precondition (and (isgrasp o7 p312 #p23 #g250 #a250))
          :effect (kinfrom o7 p312 #g250 #a250 #t499)
   )
   (:action s1197_ik-arm-motion-from
          :parameters (o7 p312 #p24 #g251 #a251)
          :precondition (and (isgrasp o7 p312 #p24 #g251 #a251))
          :effect (kinfrom o7 p312 #g251 #a251 #t500)
   )
   (:action s1198_ik-arm-motion-from
          :parameters (o7 #p0 #p22 #g252 #a252)
          :precondition (and (isgrasp o7 #p0 #p22 #g252 #a252))
          :effect (kinfrom o7 #p0 #g252 #a252 #t501)
   )
   (:action s1199_ik-arm-motion-from
          :parameters (o7 #p0 #p23 #g253 #a253)
          :precondition (and (isgrasp o7 #p0 #p23 #g253 #a253))
          :effect (kinfrom o7 #p0 #g253 #a253 #t502)
   )
   (:action s1200_ik-arm-motion-from
          :parameters (o7 #p0 #p24 #g254 #a254)
          :precondition (and (isgrasp o7 #p0 #p24 #g254 #a254))
          :effect (kinfrom o7 #p0 #g254 #a254 #t503)
   )
   (:action s1201_ik-arm-motion-from
          :parameters (o7 #p1 #p22 #g255 #a255)
          :precondition (and (isgrasp o7 #p1 #p22 #g255 #a255))
          :effect (kinfrom o7 #p1 #g255 #a255 #t504)
   )
   (:action s1202_ik-arm-motion-from
          :parameters (o7 #p1 #p23 #g256 #a256)
          :precondition (and (isgrasp o7 #p1 #p23 #g256 #a256))
          :effect (kinfrom o7 #p1 #g256 #a256 #t505)
   )
   (:action s1203_ik-arm-motion-from
          :parameters (o7 #p1 #p24 #g257 #a257)
          :precondition (and (isgrasp o7 #p1 #p24 #g257 #a257))
          :effect (kinfrom o7 #p1 #g257 #a257 #t506)
   )
   (:action s1204_ik-arm-motion-from
          :parameters (o7 #p2 #p22 #g258 #a258)
          :precondition (and (isgrasp o7 #p2 #p22 #g258 #a258))
          :effect (kinfrom o7 #p2 #g258 #a258 #t507)
   )
   (:action s1205_ik-arm-motion-from
          :parameters (o7 #p2 #p23 #g259 #a259)
          :precondition (and (isgrasp o7 #p2 #p23 #g259 #a259))
          :effect (kinfrom o7 #p2 #g259 #a259 #t508)
   )
   (:action s1206_ik-arm-motion-from
          :parameters (o7 #p2 #p24 #g260 #a260)
          :precondition (and (isgrasp o7 #p2 #p24 #g260 #a260))
          :effect (kinfrom o7 #p2 #g260 #a260 #t509)
   )
   (:action s1207_ik-arm-motion-from
          :parameters (o7 #p9 #p22 #g261 #a261)
          :precondition (and (isgrasp o7 #p9 #p22 #g261 #a261))
          :effect (kinfrom o7 #p9 #g261 #a261 #t510)
   )
   (:action s1208_ik-arm-motion-from
          :parameters (o7 #p9 #p23 #g262 #a262)
          :precondition (and (isgrasp o7 #p9 #p23 #g262 #a262))
          :effect (kinfrom o7 #p9 #g262 #a262 #t511)
   )
   (:action s1209_ik-arm-motion-from
          :parameters (o7 #p9 #p24 #g263 #a263)
          :precondition (and (isgrasp o7 #p9 #p24 #g263 #a263))
          :effect (kinfrom o7 #p9 #g263 #a263 #t512)
   )
   (:action s1210_ik-arm-motion-from
          :parameters (o7 #p10 #p22 #g264 #a264)
          :precondition (and (isgrasp o7 #p10 #p22 #g264 #a264))
          :effect (kinfrom o7 #p10 #g264 #a264 #t513)
   )
   (:action s1211_ik-arm-motion-from
          :parameters (o7 #p10 #p23 #g265 #a265)
          :precondition (and (isgrasp o7 #p10 #p23 #g265 #a265))
          :effect (kinfrom o7 #p10 #g265 #a265 #t514)
   )
   (:action s1212_ik-arm-motion-from
          :parameters (o7 #p10 #p24 #g266 #a266)
          :precondition (and (isgrasp o7 #p10 #p24 #g266 #a266))
          :effect (kinfrom o7 #p10 #g266 #a266 #t515)
   )
   (:action s1213_ik-arm-motion-from
          :parameters (o7 #p12 #p22 #g267 #a267)
          :precondition (and (isgrasp o7 #p12 #p22 #g267 #a267))
          :effect (kinfrom o7 #p12 #g267 #a267 #t516)
   )
   (:action s1214_ik-arm-motion-from
          :parameters (o7 #p12 #p23 #g268 #a268)
          :precondition (and (isgrasp o7 #p12 #p23 #g268 #a268))
          :effect (kinfrom o7 #p12 #g268 #a268 #t517)
   )
   (:action s1215_ik-arm-motion-from
          :parameters (o7 #p12 #p24 #g269 #a269)
          :precondition (and (isgrasp o7 #p12 #p24 #g269 #a269))
          :effect (kinfrom o7 #p12 #g269 #a269 #t518)
   )
   (:action s1216_ik-arm-motion-from
          :parameters (o7 #p13 #p22 #g270 #a270)
          :precondition (and (isgrasp o7 #p13 #p22 #g270 #a270))
          :effect (kinfrom o7 #p13 #g270 #a270 #t519)
   )
   (:action s1217_ik-arm-motion-from
          :parameters (o7 #p13 #p23 #g271 #a271)
          :precondition (and (isgrasp o7 #p13 #p23 #g271 #a271))
          :effect (kinfrom o7 #p13 #g271 #a271 #t520)
   )
   (:action s1218_ik-arm-motion-from
          :parameters (o7 #p13 #p24 #g272 #a272)
          :precondition (and (isgrasp o7 #p13 #p24 #g272 #a272))
          :effect (kinfrom o7 #p13 #g272 #a272 #t521)
   )
   (:action s1219_ik-arm-motion-from
          :parameters (o7 #p14 #p22 #g273 #a273)
          :precondition (and (isgrasp o7 #p14 #p22 #g273 #a273))
          :effect (kinfrom o7 #p14 #g273 #a273 #t522)
   )
   (:action s1220_ik-arm-motion-from
          :parameters (o7 #p14 #p23 #g274 #a274)
          :precondition (and (isgrasp o7 #p14 #p23 #g274 #a274))
          :effect (kinfrom o7 #p14 #g274 #a274 #t523)
   )
   (:action s1221_ik-arm-motion-from
          :parameters (o7 #p14 #p24 #g275 #a275)
          :precondition (and (isgrasp o7 #p14 #p24 #g275 #a275))
          :effect (kinfrom o7 #p14 #g275 #a275 #t524)
   )
   (:action s1222_ik-arm-motion-from
          :parameters (o7 #p15 #p22 #g276 #a276)
          :precondition (and (isgrasp o7 #p15 #p22 #g276 #a276))
          :effect (kinfrom o7 #p15 #g276 #a276 #t525)
   )
   (:action s1223_ik-arm-motion-from
          :parameters (o7 #p15 #p23 #g277 #a277)
          :precondition (and (isgrasp o7 #p15 #p23 #g277 #a277))
          :effect (kinfrom o7 #p15 #g277 #a277 #t526)
   )
   (:action s1224_ik-arm-motion-from
          :parameters (o7 #p15 #p24 #g278 #a278)
          :precondition (and (isgrasp o7 #p15 #p24 #g278 #a278))
          :effect (kinfrom o7 #p15 #g278 #a278 #t527)
   )
   (:action s1225_ik-arm-motion-from
          :parameters (o7 #p16 #p22 #g279 #a279)
          :precondition (and (isgrasp o7 #p16 #p22 #g279 #a279))
          :effect (kinfrom o7 #p16 #g279 #a279 #t528)
   )
   (:action s1226_ik-arm-motion-from
          :parameters (o7 #p16 #p23 #g280 #a280)
          :precondition (and (isgrasp o7 #p16 #p23 #g280 #a280))
          :effect (kinfrom o7 #p16 #g280 #a280 #t529)
   )
   (:action s1227_ik-arm-motion-from
          :parameters (o7 #p16 #p24 #g281 #a281)
          :precondition (and (isgrasp o7 #p16 #p24 #g281 #a281))
          :effect (kinfrom o7 #p16 #g281 #a281 #t530)
   )
   (:action s1228_ik-arm-motion-from
          :parameters (o7 #p17 #p22 #g282 #a282)
          :precondition (and (isgrasp o7 #p17 #p22 #g282 #a282))
          :effect (kinfrom o7 #p17 #g282 #a282 #t531)
   )
   (:action s1229_ik-arm-motion-from
          :parameters (o7 #p17 #p23 #g283 #a283)
          :precondition (and (isgrasp o7 #p17 #p23 #g283 #a283))
          :effect (kinfrom o7 #p17 #g283 #a283 #t532)
   )
   (:action s1230_ik-arm-motion-from
          :parameters (o7 #p17 #p24 #g284 #a284)
          :precondition (and (isgrasp o7 #p17 #p24 #g284 #a284))
          :effect (kinfrom o7 #p17 #g284 #a284 #t533)
   )
   (:action s1231_ik-arm-motion-from
          :parameters (o7 #p18 #p22 #g285 #a285)
          :precondition (and (isgrasp o7 #p18 #p22 #g285 #a285))
          :effect (kinfrom o7 #p18 #g285 #a285 #t534)
   )
   (:action s1232_ik-arm-motion-from
          :parameters (o7 #p18 #p23 #g286 #a286)
          :precondition (and (isgrasp o7 #p18 #p23 #g286 #a286))
          :effect (kinfrom o7 #p18 #g286 #a286 #t535)
   )
   (:action s1233_ik-arm-motion-from
          :parameters (o7 #p18 #p24 #g287 #a287)
          :precondition (and (isgrasp o7 #p18 #p24 #g287 #a287))
          :effect (kinfrom o7 #p18 #g287 #a287 #t536)
   )
   (:action s1234_ik-arm-motion-from
          :parameters (o7 #p22 p312 #g288 #a288)
          :precondition (and (isgrasp o7 #p22 p312 #g288 #a288))
          :effect (kinfrom o7 #p22 #g288 #a288 #t537)
   )
   (:action s1235_ik-arm-motion-from
          :parameters (o7 #p22 #p0 #g289 #a289)
          :precondition (and (isgrasp o7 #p22 #p0 #g289 #a289))
          :effect (kinfrom o7 #p22 #g289 #a289 #t538)
   )
   (:action s1236_ik-arm-motion-from
          :parameters (o7 #p22 #p1 #g290 #a290)
          :precondition (and (isgrasp o7 #p22 #p1 #g290 #a290))
          :effect (kinfrom o7 #p22 #g290 #a290 #t539)
   )
   (:action s1237_ik-arm-motion-from
          :parameters (o7 #p22 #p2 #g291 #a291)
          :precondition (and (isgrasp o7 #p22 #p2 #g291 #a291))
          :effect (kinfrom o7 #p22 #g291 #a291 #t540)
   )
   (:action s1238_ik-arm-motion-from
          :parameters (o7 #p22 #p9 #g292 #a292)
          :precondition (and (isgrasp o7 #p22 #p9 #g292 #a292))
          :effect (kinfrom o7 #p22 #g292 #a292 #t541)
   )
   (:action s1239_ik-arm-motion-from
          :parameters (o7 #p22 #p10 #g293 #a293)
          :precondition (and (isgrasp o7 #p22 #p10 #g293 #a293))
          :effect (kinfrom o7 #p22 #g293 #a293 #t542)
   )
   (:action s1240_ik-arm-motion-from
          :parameters (o7 #p22 #p12 #g294 #a294)
          :precondition (and (isgrasp o7 #p22 #p12 #g294 #a294))
          :effect (kinfrom o7 #p22 #g294 #a294 #t543)
   )
   (:action s1241_ik-arm-motion-from
          :parameters (o7 #p22 #p13 #g295 #a295)
          :precondition (and (isgrasp o7 #p22 #p13 #g295 #a295))
          :effect (kinfrom o7 #p22 #g295 #a295 #t544)
   )
   (:action s1242_ik-arm-motion-from
          :parameters (o7 #p22 #p14 #g296 #a296)
          :precondition (and (isgrasp o7 #p22 #p14 #g296 #a296))
          :effect (kinfrom o7 #p22 #g296 #a296 #t545)
   )
   (:action s1243_ik-arm-motion-from
          :parameters (o7 #p22 #p15 #g297 #a297)
          :precondition (and (isgrasp o7 #p22 #p15 #g297 #a297))
          :effect (kinfrom o7 #p22 #g297 #a297 #t546)
   )
   (:action s1244_ik-arm-motion-from
          :parameters (o7 #p22 #p16 #g298 #a298)
          :precondition (and (isgrasp o7 #p22 #p16 #g298 #a298))
          :effect (kinfrom o7 #p22 #g298 #a298 #t547)
   )
   (:action s1245_ik-arm-motion-from
          :parameters (o7 #p22 #p17 #g299 #a299)
          :precondition (and (isgrasp o7 #p22 #p17 #g299 #a299))
          :effect (kinfrom o7 #p22 #g299 #a299 #t548)
   )
   (:action s1246_ik-arm-motion-from
          :parameters (o7 #p22 #p18 #g300 #a300)
          :precondition (and (isgrasp o7 #p22 #p18 #g300 #a300))
          :effect (kinfrom o7 #p22 #g300 #a300 #t549)
   )
   (:action s1247_ik-arm-motion-from
          :parameters (o7 #p22 #p22 #g301 #a301)
          :precondition (and (isgrasp o7 #p22 #p22 #g301 #a301))
          :effect (kinfrom o7 #p22 #g301 #a301 #t550)
   )
   (:action s1248_ik-arm-motion-from
          :parameters (o7 #p22 #p23 #g302 #a302)
          :precondition (and (isgrasp o7 #p22 #p23 #g302 #a302))
          :effect (kinfrom o7 #p22 #g302 #a302 #t551)
   )
   (:action s1249_ik-arm-motion-from
          :parameters (o7 #p22 #p24 #g303 #a303)
          :precondition (and (isgrasp o7 #p22 #p24 #g303 #a303))
          :effect (kinfrom o7 #p22 #g303 #a303 #t552)
   )
   (:action s1250_ik-arm-motion-from
          :parameters (o7 #p23 p312 #g304 #a304)
          :precondition (and (isgrasp o7 #p23 p312 #g304 #a304))
          :effect (kinfrom o7 #p23 #g304 #a304 #t553)
   )
   (:action s1251_ik-arm-motion-from
          :parameters (o7 #p23 #p0 #g305 #a305)
          :precondition (and (isgrasp o7 #p23 #p0 #g305 #a305))
          :effect (kinfrom o7 #p23 #g305 #a305 #t554)
   )
   (:action s1252_ik-arm-motion-from
          :parameters (o7 #p23 #p1 #g306 #a306)
          :precondition (and (isgrasp o7 #p23 #p1 #g306 #a306))
          :effect (kinfrom o7 #p23 #g306 #a306 #t555)
   )
   (:action s1253_ik-arm-motion-from
          :parameters (o7 #p23 #p2 #g307 #a307)
          :precondition (and (isgrasp o7 #p23 #p2 #g307 #a307))
          :effect (kinfrom o7 #p23 #g307 #a307 #t556)
   )
   (:action s1254_ik-arm-motion-from
          :parameters (o7 #p23 #p9 #g308 #a308)
          :precondition (and (isgrasp o7 #p23 #p9 #g308 #a308))
          :effect (kinfrom o7 #p23 #g308 #a308 #t557)
   )
   (:action s1255_ik-arm-motion-from
          :parameters (o7 #p23 #p10 #g309 #a309)
          :precondition (and (isgrasp o7 #p23 #p10 #g309 #a309))
          :effect (kinfrom o7 #p23 #g309 #a309 #t558)
   )
   (:action s1256_ik-arm-motion-from
          :parameters (o7 #p23 #p12 #g310 #a310)
          :precondition (and (isgrasp o7 #p23 #p12 #g310 #a310))
          :effect (kinfrom o7 #p23 #g310 #a310 #t559)
   )
   (:action s1257_ik-arm-motion-from
          :parameters (o7 #p23 #p13 #g311 #a311)
          :precondition (and (isgrasp o7 #p23 #p13 #g311 #a311))
          :effect (kinfrom o7 #p23 #g311 #a311 #t560)
   )
   (:action s1258_ik-arm-motion-from
          :parameters (o7 #p23 #p14 #g312 #a312)
          :precondition (and (isgrasp o7 #p23 #p14 #g312 #a312))
          :effect (kinfrom o7 #p23 #g312 #a312 #t561)
   )
   (:action s1259_ik-arm-motion-from
          :parameters (o7 #p23 #p15 #g313 #a313)
          :precondition (and (isgrasp o7 #p23 #p15 #g313 #a313))
          :effect (kinfrom o7 #p23 #g313 #a313 #t562)
   )
   (:action s1260_ik-arm-motion-from
          :parameters (o7 #p23 #p16 #g314 #a314)
          :precondition (and (isgrasp o7 #p23 #p16 #g314 #a314))
          :effect (kinfrom o7 #p23 #g314 #a314 #t563)
   )
   (:action s1261_ik-arm-motion-from
          :parameters (o7 #p23 #p17 #g315 #a315)
          :precondition (and (isgrasp o7 #p23 #p17 #g315 #a315))
          :effect (kinfrom o7 #p23 #g315 #a315 #t564)
   )
   (:action s1262_ik-arm-motion-from
          :parameters (o7 #p23 #p18 #g316 #a316)
          :precondition (and (isgrasp o7 #p23 #p18 #g316 #a316))
          :effect (kinfrom o7 #p23 #g316 #a316 #t565)
   )
   (:action s1263_ik-arm-motion-from
          :parameters (o7 #p23 #p22 #g317 #a317)
          :precondition (and (isgrasp o7 #p23 #p22 #g317 #a317))
          :effect (kinfrom o7 #p23 #g317 #a317 #t566)
   )
   (:action s1264_ik-arm-motion-from
          :parameters (o7 #p23 #p23 #g318 #a318)
          :precondition (and (isgrasp o7 #p23 #p23 #g318 #a318))
          :effect (kinfrom o7 #p23 #g318 #a318 #t567)
   )
   (:action s1265_ik-arm-motion-from
          :parameters (o7 #p23 #p24 #g319 #a319)
          :precondition (and (isgrasp o7 #p23 #p24 #g319 #a319))
          :effect (kinfrom o7 #p23 #g319 #a319 #t568)
   )
   (:action s1266_ik-arm-motion-from
          :parameters (o7 #p24 p312 #g320 #a320)
          :precondition (and (isgrasp o7 #p24 p312 #g320 #a320))
          :effect (kinfrom o7 #p24 #g320 #a320 #t569)
   )
   (:action s1267_ik-arm-motion-from
          :parameters (o7 #p24 #p0 #g321 #a321)
          :precondition (and (isgrasp o7 #p24 #p0 #g321 #a321))
          :effect (kinfrom o7 #p24 #g321 #a321 #t570)
   )
   (:action s1268_ik-arm-motion-from
          :parameters (o7 #p24 #p1 #g322 #a322)
          :precondition (and (isgrasp o7 #p24 #p1 #g322 #a322))
          :effect (kinfrom o7 #p24 #g322 #a322 #t571)
   )
   (:action s1269_ik-arm-motion-from
          :parameters (o7 #p24 #p2 #g323 #a323)
          :precondition (and (isgrasp o7 #p24 #p2 #g323 #a323))
          :effect (kinfrom o7 #p24 #g323 #a323 #t572)
   )
   (:action s1270_ik-arm-motion-from
          :parameters (o7 #p24 #p9 #g324 #a324)
          :precondition (and (isgrasp o7 #p24 #p9 #g324 #a324))
          :effect (kinfrom o7 #p24 #g324 #a324 #t573)
   )
   (:action s1271_ik-arm-motion-from
          :parameters (o7 #p24 #p10 #g325 #a325)
          :precondition (and (isgrasp o7 #p24 #p10 #g325 #a325))
          :effect (kinfrom o7 #p24 #g325 #a325 #t574)
   )
   (:action s1272_ik-arm-motion-from
          :parameters (o7 #p24 #p12 #g326 #a326)
          :precondition (and (isgrasp o7 #p24 #p12 #g326 #a326))
          :effect (kinfrom o7 #p24 #g326 #a326 #t575)
   )
   (:action s1273_ik-arm-motion-from
          :parameters (o7 #p24 #p13 #g327 #a327)
          :precondition (and (isgrasp o7 #p24 #p13 #g327 #a327))
          :effect (kinfrom o7 #p24 #g327 #a327 #t576)
   )
   (:action s1274_ik-arm-motion-from
          :parameters (o7 #p24 #p14 #g328 #a328)
          :precondition (and (isgrasp o7 #p24 #p14 #g328 #a328))
          :effect (kinfrom o7 #p24 #g328 #a328 #t577)
   )
   (:action s1275_ik-arm-motion-from
          :parameters (o7 #p24 #p15 #g329 #a329)
          :precondition (and (isgrasp o7 #p24 #p15 #g329 #a329))
          :effect (kinfrom o7 #p24 #g329 #a329 #t578)
   )
   (:action s1276_ik-arm-motion-from
          :parameters (o7 #p24 #p16 #g330 #a330)
          :precondition (and (isgrasp o7 #p24 #p16 #g330 #a330))
          :effect (kinfrom o7 #p24 #g330 #a330 #t579)
   )
   (:action s1277_ik-arm-motion-from
          :parameters (o7 #p24 #p17 #g331 #a331)
          :precondition (and (isgrasp o7 #p24 #p17 #g331 #a331))
          :effect (kinfrom o7 #p24 #g331 #a331 #t580)
   )
   (:action s1278_ik-arm-motion-from
          :parameters (o7 #p24 #p18 #g332 #a332)
          :precondition (and (isgrasp o7 #p24 #p18 #g332 #a332))
          :effect (kinfrom o7 #p24 #g332 #a332 #t581)
   )
   (:action s1279_ik-arm-motion-from
          :parameters (o7 #p24 #p22 #g333 #a333)
          :precondition (and (isgrasp o7 #p24 #p22 #g333 #a333))
          :effect (kinfrom o7 #p24 #g333 #a333 #t582)
   )
   (:action s1280_ik-arm-motion-from
          :parameters (o7 #p24 #p23 #g334 #a334)
          :precondition (and (isgrasp o7 #p24 #p23 #g334 #a334))
          :effect (kinfrom o7 #p24 #g334 #a334 #t583)
   )
   (:action s1281_ik-arm-motion-from
          :parameters (o7 #p24 #p24 #g335 #a335)
          :precondition (and (isgrasp o7 #p24 #p24 #g335 #a335))
          :effect (kinfrom o7 #p24 #g335 #a335 #t584)
   )
   (:action s1282_ik-arm-motion-to
          :parameters (o7 #p22 p312 #g249 #a249)
          :precondition (and (isgrasp o7 p312 #p22 #g249 #a249))
          :effect (kinto o7 #p22 #g249 #a249 #t585)
   )
   (:action s1283_ik-arm-motion-to
          :parameters (o7 #p23 p312 #g250 #a250)
          :precondition (and (isgrasp o7 p312 #p23 #g250 #a250))
          :effect (kinto o7 #p23 #g250 #a250 #t586)
   )
   (:action s1284_ik-arm-motion-to
          :parameters (o7 #p24 p312 #g251 #a251)
          :precondition (and (isgrasp o7 p312 #p24 #g251 #a251))
          :effect (kinto o7 #p24 #g251 #a251 #t587)
   )
   (:action s1285_ik-arm-motion-to
          :parameters (o7 #p22 #p0 #g252 #a252)
          :precondition (and (isgrasp o7 #p0 #p22 #g252 #a252))
          :effect (kinto o7 #p22 #g252 #a252 #t588)
   )
   (:action s1286_ik-arm-motion-to
          :parameters (o7 #p23 #p0 #g253 #a253)
          :precondition (and (isgrasp o7 #p0 #p23 #g253 #a253))
          :effect (kinto o7 #p23 #g253 #a253 #t589)
   )
   (:action s1287_ik-arm-motion-to
          :parameters (o7 #p24 #p0 #g254 #a254)
          :precondition (and (isgrasp o7 #p0 #p24 #g254 #a254))
          :effect (kinto o7 #p24 #g254 #a254 #t590)
   )
   (:action s1288_ik-arm-motion-to
          :parameters (o7 #p22 #p1 #g255 #a255)
          :precondition (and (isgrasp o7 #p1 #p22 #g255 #a255))
          :effect (kinto o7 #p22 #g255 #a255 #t591)
   )
   (:action s1289_ik-arm-motion-to
          :parameters (o7 #p23 #p1 #g256 #a256)
          :precondition (and (isgrasp o7 #p1 #p23 #g256 #a256))
          :effect (kinto o7 #p23 #g256 #a256 #t592)
   )
   (:action s1290_ik-arm-motion-to
          :parameters (o7 #p24 #p1 #g257 #a257)
          :precondition (and (isgrasp o7 #p1 #p24 #g257 #a257))
          :effect (kinto o7 #p24 #g257 #a257 #t593)
   )
   (:action s1291_ik-arm-motion-to
          :parameters (o7 #p22 #p2 #g258 #a258)
          :precondition (and (isgrasp o7 #p2 #p22 #g258 #a258))
          :effect (kinto o7 #p22 #g258 #a258 #t594)
   )
   (:action s1292_ik-arm-motion-to
          :parameters (o7 #p23 #p2 #g259 #a259)
          :precondition (and (isgrasp o7 #p2 #p23 #g259 #a259))
          :effect (kinto o7 #p23 #g259 #a259 #t595)
   )
   (:action s1293_ik-arm-motion-to
          :parameters (o7 #p24 #p2 #g260 #a260)
          :precondition (and (isgrasp o7 #p2 #p24 #g260 #a260))
          :effect (kinto o7 #p24 #g260 #a260 #t596)
   )
   (:action s1294_ik-arm-motion-to
          :parameters (o7 #p22 #p9 #g261 #a261)
          :precondition (and (isgrasp o7 #p9 #p22 #g261 #a261))
          :effect (kinto o7 #p22 #g261 #a261 #t597)
   )
   (:action s1295_ik-arm-motion-to
          :parameters (o7 #p23 #p9 #g262 #a262)
          :precondition (and (isgrasp o7 #p9 #p23 #g262 #a262))
          :effect (kinto o7 #p23 #g262 #a262 #t598)
   )
   (:action s1296_ik-arm-motion-to
          :parameters (o7 #p24 #p9 #g263 #a263)
          :precondition (and (isgrasp o7 #p9 #p24 #g263 #a263))
          :effect (kinto o7 #p24 #g263 #a263 #t599)
   )
   (:action s1297_ik-arm-motion-to
          :parameters (o7 #p22 #p10 #g264 #a264)
          :precondition (and (isgrasp o7 #p10 #p22 #g264 #a264))
          :effect (kinto o7 #p22 #g264 #a264 #t600)
   )
   (:action s1298_ik-arm-motion-to
          :parameters (o7 #p23 #p10 #g265 #a265)
          :precondition (and (isgrasp o7 #p10 #p23 #g265 #a265))
          :effect (kinto o7 #p23 #g265 #a265 #t601)
   )
   (:action s1299_ik-arm-motion-to
          :parameters (o7 #p24 #p10 #g266 #a266)
          :precondition (and (isgrasp o7 #p10 #p24 #g266 #a266))
          :effect (kinto o7 #p24 #g266 #a266 #t602)
   )
   (:action s1300_ik-arm-motion-to
          :parameters (o7 #p22 #p12 #g267 #a267)
          :precondition (and (isgrasp o7 #p12 #p22 #g267 #a267))
          :effect (kinto o7 #p22 #g267 #a267 #t603)
   )
   (:action s1301_ik-arm-motion-to
          :parameters (o7 #p23 #p12 #g268 #a268)
          :precondition (and (isgrasp o7 #p12 #p23 #g268 #a268))
          :effect (kinto o7 #p23 #g268 #a268 #t604)
   )
   (:action s1302_ik-arm-motion-to
          :parameters (o7 #p24 #p12 #g269 #a269)
          :precondition (and (isgrasp o7 #p12 #p24 #g269 #a269))
          :effect (kinto o7 #p24 #g269 #a269 #t605)
   )
   (:action s1303_ik-arm-motion-to
          :parameters (o7 #p22 #p13 #g270 #a270)
          :precondition (and (isgrasp o7 #p13 #p22 #g270 #a270))
          :effect (kinto o7 #p22 #g270 #a270 #t606)
   )
   (:action s1304_ik-arm-motion-to
          :parameters (o7 #p23 #p13 #g271 #a271)
          :precondition (and (isgrasp o7 #p13 #p23 #g271 #a271))
          :effect (kinto o7 #p23 #g271 #a271 #t607)
   )
   (:action s1305_ik-arm-motion-to
          :parameters (o7 #p24 #p13 #g272 #a272)
          :precondition (and (isgrasp o7 #p13 #p24 #g272 #a272))
          :effect (kinto o7 #p24 #g272 #a272 #t608)
   )
   (:action s1306_ik-arm-motion-to
          :parameters (o7 #p22 #p14 #g273 #a273)
          :precondition (and (isgrasp o7 #p14 #p22 #g273 #a273))
          :effect (kinto o7 #p22 #g273 #a273 #t609)
   )
   (:action s1307_ik-arm-motion-to
          :parameters (o7 #p23 #p14 #g274 #a274)
          :precondition (and (isgrasp o7 #p14 #p23 #g274 #a274))
          :effect (kinto o7 #p23 #g274 #a274 #t610)
   )
   (:action s1308_ik-arm-motion-to
          :parameters (o7 #p24 #p14 #g275 #a275)
          :precondition (and (isgrasp o7 #p14 #p24 #g275 #a275))
          :effect (kinto o7 #p24 #g275 #a275 #t611)
   )
   (:action s1309_ik-arm-motion-to
          :parameters (o7 #p22 #p15 #g276 #a276)
          :precondition (and (isgrasp o7 #p15 #p22 #g276 #a276))
          :effect (kinto o7 #p22 #g276 #a276 #t612)
   )
   (:action s1310_ik-arm-motion-to
          :parameters (o7 #p23 #p15 #g277 #a277)
          :precondition (and (isgrasp o7 #p15 #p23 #g277 #a277))
          :effect (kinto o7 #p23 #g277 #a277 #t613)
   )
   (:action s1311_ik-arm-motion-to
          :parameters (o7 #p24 #p15 #g278 #a278)
          :precondition (and (isgrasp o7 #p15 #p24 #g278 #a278))
          :effect (kinto o7 #p24 #g278 #a278 #t614)
   )
   (:action s1312_ik-arm-motion-to
          :parameters (o7 #p22 #p16 #g279 #a279)
          :precondition (and (isgrasp o7 #p16 #p22 #g279 #a279))
          :effect (kinto o7 #p22 #g279 #a279 #t615)
   )
   (:action s1313_ik-arm-motion-to
          :parameters (o7 #p23 #p16 #g280 #a280)
          :precondition (and (isgrasp o7 #p16 #p23 #g280 #a280))
          :effect (kinto o7 #p23 #g280 #a280 #t616)
   )
   (:action s1314_ik-arm-motion-to
          :parameters (o7 #p24 #p16 #g281 #a281)
          :precondition (and (isgrasp o7 #p16 #p24 #g281 #a281))
          :effect (kinto o7 #p24 #g281 #a281 #t617)
   )
   (:action s1315_ik-arm-motion-to
          :parameters (o7 #p22 #p17 #g282 #a282)
          :precondition (and (isgrasp o7 #p17 #p22 #g282 #a282))
          :effect (kinto o7 #p22 #g282 #a282 #t618)
   )
   (:action s1316_ik-arm-motion-to
          :parameters (o7 #p23 #p17 #g283 #a283)
          :precondition (and (isgrasp o7 #p17 #p23 #g283 #a283))
          :effect (kinto o7 #p23 #g283 #a283 #t619)
   )
   (:action s1317_ik-arm-motion-to
          :parameters (o7 #p24 #p17 #g284 #a284)
          :precondition (and (isgrasp o7 #p17 #p24 #g284 #a284))
          :effect (kinto o7 #p24 #g284 #a284 #t620)
   )
   (:action s1318_ik-arm-motion-to
          :parameters (o7 #p22 #p18 #g285 #a285)
          :precondition (and (isgrasp o7 #p18 #p22 #g285 #a285))
          :effect (kinto o7 #p22 #g285 #a285 #t621)
   )
   (:action s1319_ik-arm-motion-to
          :parameters (o7 #p23 #p18 #g286 #a286)
          :precondition (and (isgrasp o7 #p18 #p23 #g286 #a286))
          :effect (kinto o7 #p23 #g286 #a286 #t622)
   )
   (:action s1320_ik-arm-motion-to
          :parameters (o7 #p24 #p18 #g287 #a287)
          :precondition (and (isgrasp o7 #p18 #p24 #g287 #a287))
          :effect (kinto o7 #p24 #g287 #a287 #t623)
   )
   (:action s1321_ik-arm-motion-to
          :parameters (o7 p312 #p22 #g288 #a288)
          :precondition (and (isgrasp o7 #p22 p312 #g288 #a288))
          :effect (kinto o7 p312 #g288 #a288 #t624)
   )
   (:action s1322_ik-arm-motion-to
          :parameters (o7 #p0 #p22 #g289 #a289)
          :precondition (and (isgrasp o7 #p22 #p0 #g289 #a289))
          :effect (kinto o7 #p0 #g289 #a289 #t625)
   )
   (:action s1323_ik-arm-motion-to
          :parameters (o7 #p1 #p22 #g290 #a290)
          :precondition (and (isgrasp o7 #p22 #p1 #g290 #a290))
          :effect (kinto o7 #p1 #g290 #a290 #t626)
   )
   (:action s1324_ik-arm-motion-to
          :parameters (o7 #p2 #p22 #g291 #a291)
          :precondition (and (isgrasp o7 #p22 #p2 #g291 #a291))
          :effect (kinto o7 #p2 #g291 #a291 #t627)
   )
   (:action s1325_ik-arm-motion-to
          :parameters (o7 #p9 #p22 #g292 #a292)
          :precondition (and (isgrasp o7 #p22 #p9 #g292 #a292))
          :effect (kinto o7 #p9 #g292 #a292 #t628)
   )
   (:action s1326_ik-arm-motion-to
          :parameters (o7 #p10 #p22 #g293 #a293)
          :precondition (and (isgrasp o7 #p22 #p10 #g293 #a293))
          :effect (kinto o7 #p10 #g293 #a293 #t629)
   )
   (:action s1327_ik-arm-motion-to
          :parameters (o7 #p12 #p22 #g294 #a294)
          :precondition (and (isgrasp o7 #p22 #p12 #g294 #a294))
          :effect (kinto o7 #p12 #g294 #a294 #t630)
   )
   (:action s1328_ik-arm-motion-to
          :parameters (o7 #p13 #p22 #g295 #a295)
          :precondition (and (isgrasp o7 #p22 #p13 #g295 #a295))
          :effect (kinto o7 #p13 #g295 #a295 #t631)
   )
   (:action s1329_ik-arm-motion-to
          :parameters (o7 #p14 #p22 #g296 #a296)
          :precondition (and (isgrasp o7 #p22 #p14 #g296 #a296))
          :effect (kinto o7 #p14 #g296 #a296 #t632)
   )
   (:action s1330_ik-arm-motion-to
          :parameters (o7 #p15 #p22 #g297 #a297)
          :precondition (and (isgrasp o7 #p22 #p15 #g297 #a297))
          :effect (kinto o7 #p15 #g297 #a297 #t633)
   )
   (:action s1331_ik-arm-motion-to
          :parameters (o7 #p16 #p22 #g298 #a298)
          :precondition (and (isgrasp o7 #p22 #p16 #g298 #a298))
          :effect (kinto o7 #p16 #g298 #a298 #t634)
   )
   (:action s1332_ik-arm-motion-to
          :parameters (o7 #p17 #p22 #g299 #a299)
          :precondition (and (isgrasp o7 #p22 #p17 #g299 #a299))
          :effect (kinto o7 #p17 #g299 #a299 #t635)
   )
   (:action s1333_ik-arm-motion-to
          :parameters (o7 #p18 #p22 #g300 #a300)
          :precondition (and (isgrasp o7 #p22 #p18 #g300 #a300))
          :effect (kinto o7 #p18 #g300 #a300 #t636)
   )
   (:action s1334_ik-arm-motion-to
          :parameters (o7 #p22 #p22 #g301 #a301)
          :precondition (and (isgrasp o7 #p22 #p22 #g301 #a301))
          :effect (kinto o7 #p22 #g301 #a301 #t637)
   )
   (:action s1335_ik-arm-motion-to
          :parameters (o7 #p23 #p22 #g302 #a302)
          :precondition (and (isgrasp o7 #p22 #p23 #g302 #a302))
          :effect (kinto o7 #p23 #g302 #a302 #t638)
   )
   (:action s1336_ik-arm-motion-to
          :parameters (o7 #p24 #p22 #g303 #a303)
          :precondition (and (isgrasp o7 #p22 #p24 #g303 #a303))
          :effect (kinto o7 #p24 #g303 #a303 #t639)
   )
   (:action s1337_ik-arm-motion-to
          :parameters (o7 p312 #p23 #g304 #a304)
          :precondition (and (isgrasp o7 #p23 p312 #g304 #a304))
          :effect (kinto o7 p312 #g304 #a304 #t640)
   )
   (:action s1338_ik-arm-motion-to
          :parameters (o7 #p0 #p23 #g305 #a305)
          :precondition (and (isgrasp o7 #p23 #p0 #g305 #a305))
          :effect (kinto o7 #p0 #g305 #a305 #t641)
   )
   (:action s1339_ik-arm-motion-to
          :parameters (o7 #p1 #p23 #g306 #a306)
          :precondition (and (isgrasp o7 #p23 #p1 #g306 #a306))
          :effect (kinto o7 #p1 #g306 #a306 #t642)
   )
   (:action s1340_ik-arm-motion-to
          :parameters (o7 #p2 #p23 #g307 #a307)
          :precondition (and (isgrasp o7 #p23 #p2 #g307 #a307))
          :effect (kinto o7 #p2 #g307 #a307 #t643)
   )
   (:action s1341_ik-arm-motion-to
          :parameters (o7 #p9 #p23 #g308 #a308)
          :precondition (and (isgrasp o7 #p23 #p9 #g308 #a308))
          :effect (kinto o7 #p9 #g308 #a308 #t644)
   )
   (:action s1342_ik-arm-motion-to
          :parameters (o7 #p10 #p23 #g309 #a309)
          :precondition (and (isgrasp o7 #p23 #p10 #g309 #a309))
          :effect (kinto o7 #p10 #g309 #a309 #t645)
   )
   (:action s1343_ik-arm-motion-to
          :parameters (o7 #p12 #p23 #g310 #a310)
          :precondition (and (isgrasp o7 #p23 #p12 #g310 #a310))
          :effect (kinto o7 #p12 #g310 #a310 #t646)
   )
   (:action s1344_ik-arm-motion-to
          :parameters (o7 #p13 #p23 #g311 #a311)
          :precondition (and (isgrasp o7 #p23 #p13 #g311 #a311))
          :effect (kinto o7 #p13 #g311 #a311 #t647)
   )
   (:action s1345_ik-arm-motion-to
          :parameters (o7 #p14 #p23 #g312 #a312)
          :precondition (and (isgrasp o7 #p23 #p14 #g312 #a312))
          :effect (kinto o7 #p14 #g312 #a312 #t648)
   )
   (:action s1346_ik-arm-motion-to
          :parameters (o7 #p15 #p23 #g313 #a313)
          :precondition (and (isgrasp o7 #p23 #p15 #g313 #a313))
          :effect (kinto o7 #p15 #g313 #a313 #t649)
   )
   (:action s1347_ik-arm-motion-to
          :parameters (o7 #p16 #p23 #g314 #a314)
          :precondition (and (isgrasp o7 #p23 #p16 #g314 #a314))
          :effect (kinto o7 #p16 #g314 #a314 #t650)
   )
   (:action s1348_ik-arm-motion-to
          :parameters (o7 #p17 #p23 #g315 #a315)
          :precondition (and (isgrasp o7 #p23 #p17 #g315 #a315))
          :effect (kinto o7 #p17 #g315 #a315 #t651)
   )
   (:action s1349_ik-arm-motion-to
          :parameters (o7 #p18 #p23 #g316 #a316)
          :precondition (and (isgrasp o7 #p23 #p18 #g316 #a316))
          :effect (kinto o7 #p18 #g316 #a316 #t652)
   )
   (:action s1350_ik-arm-motion-to
          :parameters (o7 #p22 #p23 #g317 #a317)
          :precondition (and (isgrasp o7 #p23 #p22 #g317 #a317))
          :effect (kinto o7 #p22 #g317 #a317 #t653)
   )
   (:action s1351_ik-arm-motion-to
          :parameters (o7 #p23 #p23 #g318 #a318)
          :precondition (and (isgrasp o7 #p23 #p23 #g318 #a318))
          :effect (kinto o7 #p23 #g318 #a318 #t654)
   )
   (:action s1352_ik-arm-motion-to
          :parameters (o7 #p24 #p23 #g319 #a319)
          :precondition (and (isgrasp o7 #p23 #p24 #g319 #a319))
          :effect (kinto o7 #p24 #g319 #a319 #t655)
   )
   (:action s1353_ik-arm-motion-to
          :parameters (o7 p312 #p24 #g320 #a320)
          :precondition (and (isgrasp o7 #p24 p312 #g320 #a320))
          :effect (kinto o7 p312 #g320 #a320 #t656)
   )
   (:action s1354_ik-arm-motion-to
          :parameters (o7 #p0 #p24 #g321 #a321)
          :precondition (and (isgrasp o7 #p24 #p0 #g321 #a321))
          :effect (kinto o7 #p0 #g321 #a321 #t657)
   )
   (:action s1355_ik-arm-motion-to
          :parameters (o7 #p1 #p24 #g322 #a322)
          :precondition (and (isgrasp o7 #p24 #p1 #g322 #a322))
          :effect (kinto o7 #p1 #g322 #a322 #t658)
   )
   (:action s1356_ik-arm-motion-to
          :parameters (o7 #p2 #p24 #g323 #a323)
          :precondition (and (isgrasp o7 #p24 #p2 #g323 #a323))
          :effect (kinto o7 #p2 #g323 #a323 #t659)
   )
   (:action s1357_ik-arm-motion-to
          :parameters (o7 #p9 #p24 #g324 #a324)
          :precondition (and (isgrasp o7 #p24 #p9 #g324 #a324))
          :effect (kinto o7 #p9 #g324 #a324 #t660)
   )
   (:action s1358_ik-arm-motion-to
          :parameters (o7 #p10 #p24 #g325 #a325)
          :precondition (and (isgrasp o7 #p24 #p10 #g325 #a325))
          :effect (kinto o7 #p10 #g325 #a325 #t661)
   )
   (:action s1359_ik-arm-motion-to
          :parameters (o7 #p12 #p24 #g326 #a326)
          :precondition (and (isgrasp o7 #p24 #p12 #g326 #a326))
          :effect (kinto o7 #p12 #g326 #a326 #t662)
   )
   (:action s1360_ik-arm-motion-to
          :parameters (o7 #p13 #p24 #g327 #a327)
          :precondition (and (isgrasp o7 #p24 #p13 #g327 #a327))
          :effect (kinto o7 #p13 #g327 #a327 #t663)
   )
   (:action s1361_ik-arm-motion-to
          :parameters (o7 #p14 #p24 #g328 #a328)
          :precondition (and (isgrasp o7 #p24 #p14 #g328 #a328))
          :effect (kinto o7 #p14 #g328 #a328 #t664)
   )
   (:action s1362_ik-arm-motion-to
          :parameters (o7 #p15 #p24 #g329 #a329)
          :precondition (and (isgrasp o7 #p24 #p15 #g329 #a329))
          :effect (kinto o7 #p15 #g329 #a329 #t665)
   )
   (:action s1363_ik-arm-motion-to
          :parameters (o7 #p16 #p24 #g330 #a330)
          :precondition (and (isgrasp o7 #p24 #p16 #g330 #a330))
          :effect (kinto o7 #p16 #g330 #a330 #t666)
   )
   (:action s1364_ik-arm-motion-to
          :parameters (o7 #p17 #p24 #g331 #a331)
          :precondition (and (isgrasp o7 #p24 #p17 #g331 #a331))
          :effect (kinto o7 #p17 #g331 #a331 #t667)
   )
   (:action s1365_ik-arm-motion-to
          :parameters (o7 #p18 #p24 #g332 #a332)
          :precondition (and (isgrasp o7 #p24 #p18 #g332 #a332))
          :effect (kinto o7 #p18 #g332 #a332 #t668)
   )
   (:action s1366_ik-arm-motion-to
          :parameters (o7 #p22 #p24 #g333 #a333)
          :precondition (and (isgrasp o7 #p24 #p22 #g333 #a333))
          :effect (kinto o7 #p22 #g333 #a333 #t669)
   )
   (:action s1367_ik-arm-motion-to
          :parameters (o7 #p23 #p24 #g334 #a334)
          :precondition (and (isgrasp o7 #p24 #p23 #g334 #a334))
          :effect (kinto o7 #p23 #g334 #a334 #t670)
   )
   (:action s1368_ik-arm-motion-to
          :parameters (o7 #p24 #p24 #g335 #a335)
          :precondition (and (isgrasp o7 #p24 #p24 #g335 #a335))
          :effect (kinto o7 #p24 #g335 #a335 #t671)
   )
)
