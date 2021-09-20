;16:36:15 19/09

;Skeleton_SN = 0

(define (domain pr2-tamp_propo_reorder)
   (:requirements :strips :equality :action-costs)

   (:types
          arm wuti grasp config pose trajectory propo_action propo_stream
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
          (_unused ?_s - propo_stream)
   )


   (:action a0_pick
          :parameters (#a5 o7 p312 #g5 o8 #t8)
          :precondition (and (atpose o7 p312) (kinfrom o7 p312 #g5 #a5 #t8) (on o7 o8) (clear o7) (canpick) (graspable o7) (_applicable _p0))
          :effect (and (increase (total-cost) 100) (not (on o7 o8)) (clear o8) (not (canpick)) (atgrasp o7 #g5 #a5) (not (atpose o7 p312)) (not (_applicable _p0)) (not (_unused _s618)) (not (_unused _s279)) (not (_unused _s27)) (when (and (not (_unused _s0)) (not (_unused _s2)) (not (_unused _s4)) (not (_unused _s8)) (not (_unused _s16)) (not (_unused _s24)) (not (_unused _s61)) (not (_unused _s86)) (not (_unused _s104)) (not (_unused _s127)) (not (_unused _s161)) (not (_unused _s246)) (not (_unused _s313)) (not (_unused _s338)) (not (_unused _s362)) (not (_unused _s466)) (not (_unused _s500)) (not (_unused _s585)) (not (_unused _s652)) (not (_unused _s677)) (not (_unused _s692)) (not (_unused _s726)) (not (_unused _s751)) (not (_unused _s769)) (not (_unused _s873)) (not (_unused _s907)) (not (_unused _s992)) (not (_unused _s1045)) (not (_unused _s1079)) (not (_unused _s1164)) (not (_unused _s1200)) (not (_unused _s1287))) (_applicable _p1)) (not (_unused _s618)) (not (_unused _s279)) (not (_unused _s27)) (when (and (not (_unused _s0)) (not (_unused _s2)) (not (_unused _s4)) (not (_unused _s8)) (not (_unused _s16)) (not (_unused _s24)) (not (_unused _s61)) (not (_unused _s86)) (not (_unused _s104)) (not (_unused _s127)) (not (_unused _s161)) (not (_unused _s246)) (not (_unused _s313)) (not (_unused _s338)) (not (_unused _s362)) (not (_unused _s466)) (not (_unused _s500)) (not (_unused _s585)) (not (_unused _s652)) (not (_unused _s677)) (not (_unused _s692)) (not (_unused _s726)) (not (_unused _s751)) (not (_unused _s769)) (not (_unused _s873)) (not (_unused _s907)) (not (_unused _s992)) (not (_unused _s1045)) (not (_unused _s1079)) (not (_unused _s1164)) (not (_unused _s1200)) (not (_unused _s1287))) (_applicable _p1)))
   )
   (:action a1_place
          :parameters (#a5 o7 #p2 #g5 o6 p256 #t82)
          :precondition (and (kinto o7 #p2 #g5 #a5 #t82) (smaller o7 o6) (clear o6) (atgrasp o7 #g5 #a5) (atpose o6 p256) (issupport o7 #p2 o6 p256) (_applicable _p1))
          :effect (and (increase (total-cost) 100) (on o7 o6) (not (clear o6)) (canpick) (not (atgrasp o7 #g5 #a5)) (atpose o7 #p2) (not (_applicable _p1)) (not (_unused _s2)) (not (_unused _s692)) (not (_unused _s279)) (not (_unused _s27)) (when (and (not (_unused _s0)) (not (_unused _s4)) (not (_unused _s8)) (not (_unused _s16)) (not (_unused _s24)) (not (_unused _s61)) (not (_unused _s86)) (not (_unused _s104)) (not (_unused _s127)) (not (_unused _s161)) (not (_unused _s246)) (not (_unused _s313)) (not (_unused _s338)) (not (_unused _s362)) (not (_unused _s466)) (not (_unused _s500)) (not (_unused _s585)) (not (_unused _s618)) (not (_unused _s652)) (not (_unused _s677)) (not (_unused _s726)) (not (_unused _s751)) (not (_unused _s769)) (not (_unused _s873)) (not (_unused _s907)) (not (_unused _s992)) (not (_unused _s1045)) (not (_unused _s1079)) (not (_unused _s1164)) (not (_unused _s1200)) (not (_unused _s1287))) (_applicable _p2)) (not (_unused _s2)) (not (_unused _s692)) (not (_unused _s279)) (not (_unused _s27)) (when (and (not (_unused _s0)) (not (_unused _s4)) (not (_unused _s8)) (not (_unused _s16)) (not (_unused _s24)) (not (_unused _s61)) (not (_unused _s86)) (not (_unused _s104)) (not (_unused _s127)) (not (_unused _s161)) (not (_unused _s246)) (not (_unused _s313)) (not (_unused _s338)) (not (_unused _s362)) (not (_unused _s466)) (not (_unused _s500)) (not (_unused _s585)) (not (_unused _s618)) (not (_unused _s652)) (not (_unused _s677)) (not (_unused _s726)) (not (_unused _s751)) (not (_unused _s769)) (not (_unused _s873)) (not (_unused _s907)) (not (_unused _s992)) (not (_unused _s1045)) (not (_unused _s1079)) (not (_unused _s1164)) (not (_unused _s1200)) (not (_unused _s1287))) (_applicable _p2)))
   )
   (:action a2_pick
          :parameters (#a39 o8 p368 #g39 o9 #t42)
          :precondition (and (atpose o8 p368) (kinfrom o8 p368 #g39 #a39 #t42) (on o8 o9) (clear o8) (canpick) (graspable o8) (_applicable _p2))
          :effect (and (increase (total-cost) 100) (not (on o8 o9)) (clear o9) (not (canpick)) (atgrasp o8 #g39 #a39) (not (atpose o8 p368)) (not (_applicable _p2)) (not (_unused _s313)) (not (_unused _s652)) (not (_unused _s61)) (when (and (not (_unused _s0)) (not (_unused _s2)) (not (_unused _s4)) (not (_unused _s8)) (not (_unused _s16)) (not (_unused _s24)) (not (_unused _s27)) (not (_unused _s86)) (not (_unused _s104)) (not (_unused _s127)) (not (_unused _s161)) (not (_unused _s246)) (not (_unused _s279)) (not (_unused _s338)) (not (_unused _s362)) (not (_unused _s466)) (not (_unused _s500)) (not (_unused _s585)) (not (_unused _s618)) (not (_unused _s677)) (not (_unused _s692)) (not (_unused _s726)) (not (_unused _s751)) (not (_unused _s769)) (not (_unused _s873)) (not (_unused _s907)) (not (_unused _s992)) (not (_unused _s1045)) (not (_unused _s1079)) (not (_unused _s1164)) (not (_unused _s1200)) (not (_unused _s1287))) (_applicable _p3)) (not (_unused _s313)) (not (_unused _s652)) (not (_unused _s61)) (when (and (not (_unused _s0)) (not (_unused _s2)) (not (_unused _s4)) (not (_unused _s8)) (not (_unused _s16)) (not (_unused _s24)) (not (_unused _s27)) (not (_unused _s86)) (not (_unused _s104)) (not (_unused _s127)) (not (_unused _s161)) (not (_unused _s246)) (not (_unused _s279)) (not (_unused _s338)) (not (_unused _s362)) (not (_unused _s466)) (not (_unused _s500)) (not (_unused _s585)) (not (_unused _s618)) (not (_unused _s677)) (not (_unused _s692)) (not (_unused _s726)) (not (_unused _s751)) (not (_unused _s769)) (not (_unused _s873)) (not (_unused _s907)) (not (_unused _s992)) (not (_unused _s1045)) (not (_unused _s1079)) (not (_unused _s1164)) (not (_unused _s1200)) (not (_unused _s1287))) (_applicable _p3)))
   )
   (:action a3_place
          :parameters (#a39 o8 #p4 #g39 o5 p200 #t116)
          :precondition (and (kinto o8 #p4 #g39 #a39 #t116) (smaller o8 o5) (clear o5) (atgrasp o8 #g39 #a39) (atpose o5 p200) (issupport o8 #p4 o5 p200) (_applicable _p3))
          :effect (and (increase (total-cost) 100) (on o8 o5) (not (clear o5)) (canpick) (not (atgrasp o8 #g39 #a39)) (atpose o8 #p4) (not (_applicable _p3)) (not (_unused _s726)) (not (_unused _s4)) (not (_unused _s313)) (not (_unused _s61)) (when (and (not (_unused _s0)) (not (_unused _s2)) (not (_unused _s8)) (not (_unused _s16)) (not (_unused _s24)) (not (_unused _s27)) (not (_unused _s86)) (not (_unused _s104)) (not (_unused _s127)) (not (_unused _s161)) (not (_unused _s246)) (not (_unused _s279)) (not (_unused _s338)) (not (_unused _s362)) (not (_unused _s466)) (not (_unused _s500)) (not (_unused _s585)) (not (_unused _s618)) (not (_unused _s652)) (not (_unused _s677)) (not (_unused _s692)) (not (_unused _s751)) (not (_unused _s769)) (not (_unused _s873)) (not (_unused _s907)) (not (_unused _s992)) (not (_unused _s1045)) (not (_unused _s1079)) (not (_unused _s1164)) (not (_unused _s1200)) (not (_unused _s1287))) (_applicable _p4)) (not (_unused _s726)) (not (_unused _s4)) (not (_unused _s313)) (not (_unused _s61)) (when (and (not (_unused _s0)) (not (_unused _s2)) (not (_unused _s8)) (not (_unused _s16)) (not (_unused _s24)) (not (_unused _s27)) (not (_unused _s86)) (not (_unused _s104)) (not (_unused _s127)) (not (_unused _s161)) (not (_unused _s246)) (not (_unused _s279)) (not (_unused _s338)) (not (_unused _s362)) (not (_unused _s466)) (not (_unused _s500)) (not (_unused _s585)) (not (_unused _s618)) (not (_unused _s652)) (not (_unused _s677)) (not (_unused _s692)) (not (_unused _s751)) (not (_unused _s769)) (not (_unused _s873)) (not (_unused _s907)) (not (_unused _s992)) (not (_unused _s1045)) (not (_unused _s1079)) (not (_unused _s1164)) (not (_unused _s1200)) (not (_unused _s1287))) (_applicable _p4)))
   )
   (:action a4_pick
          :parameters (#a99 o7 #p2 #g99 o6 #t176)
          :precondition (and (atpose o7 #p2) (kinfrom o7 #p2 #g99 #a99 #t176) (on o7 o6) (clear o7) (canpick) (graspable o7) (_applicable _p4))
          :effect (and (increase (total-cost) 100) (not (on o7 o6)) (clear o6) (not (canpick)) (atgrasp o7 #g99 #a99) (not (atpose o7 #p2)) (not (_applicable _p4)) (not (_unused _s2)) (not (_unused _s127)) (not (_unused _s873)) (not (_unused _s466)) (when (and (not (_unused _s0)) (not (_unused _s4)) (not (_unused _s8)) (not (_unused _s16)) (not (_unused _s24)) (not (_unused _s27)) (not (_unused _s61)) (not (_unused _s86)) (not (_unused _s104)) (not (_unused _s161)) (not (_unused _s246)) (not (_unused _s279)) (not (_unused _s313)) (not (_unused _s338)) (not (_unused _s362)) (not (_unused _s500)) (not (_unused _s585)) (not (_unused _s618)) (not (_unused _s652)) (not (_unused _s677)) (not (_unused _s692)) (not (_unused _s726)) (not (_unused _s751)) (not (_unused _s769)) (not (_unused _s907)) (not (_unused _s992)) (not (_unused _s1045)) (not (_unused _s1079)) (not (_unused _s1164)) (not (_unused _s1200)) (not (_unused _s1287))) (_applicable _p5)) (not (_unused _s2)) (not (_unused _s127)) (not (_unused _s873)) (not (_unused _s466)) (when (and (not (_unused _s0)) (not (_unused _s4)) (not (_unused _s8)) (not (_unused _s16)) (not (_unused _s24)) (not (_unused _s27)) (not (_unused _s61)) (not (_unused _s86)) (not (_unused _s104)) (not (_unused _s161)) (not (_unused _s246)) (not (_unused _s279)) (not (_unused _s313)) (not (_unused _s338)) (not (_unused _s362)) (not (_unused _s500)) (not (_unused _s585)) (not (_unused _s618)) (not (_unused _s652)) (not (_unused _s677)) (not (_unused _s692)) (not (_unused _s726)) (not (_unused _s751)) (not (_unused _s769)) (not (_unused _s907)) (not (_unused _s992)) (not (_unused _s1045)) (not (_unused _s1079)) (not (_unused _s1164)) (not (_unused _s1200)) (not (_unused _s1287))) (_applicable _p5)))
   )
   (:action a5_place
          :parameters (#a99 o7 #p13 #g99 o8 #p4 #t348)
          :precondition (and (kinto o7 #p13 #g99 #a99 #t348) (smaller o7 o8) (clear o8) (atgrasp o7 #g99 #a99) (atpose o8 #p4) (issupport o7 #p13 o8 #p4) (_applicable _p5))
          :effect (and (increase (total-cost) 100) (on o7 o8) (not (clear o8)) (canpick) (not (atgrasp o7 #g99 #a99)) (atpose o7 #p13) (not (_applicable _p5)) (not (_unused _s127)) (not (_unused _s1045)) (not (_unused _s16)) (not (_unused _s4)) (not (_unused _s466)) (when (and (not (_unused _s0)) (not (_unused _s2)) (not (_unused _s8)) (not (_unused _s24)) (not (_unused _s27)) (not (_unused _s61)) (not (_unused _s86)) (not (_unused _s104)) (not (_unused _s161)) (not (_unused _s246)) (not (_unused _s279)) (not (_unused _s313)) (not (_unused _s338)) (not (_unused _s362)) (not (_unused _s500)) (not (_unused _s585)) (not (_unused _s618)) (not (_unused _s652)) (not (_unused _s677)) (not (_unused _s692)) (not (_unused _s726)) (not (_unused _s751)) (not (_unused _s769)) (not (_unused _s873)) (not (_unused _s907)) (not (_unused _s992)) (not (_unused _s1079)) (not (_unused _s1164)) (not (_unused _s1200)) (not (_unused _s1287))) (_applicable _p6)) (not (_unused _s127)) (not (_unused _s1045)) (not (_unused _s16)) (not (_unused _s4)) (not (_unused _s466)) (when (and (not (_unused _s0)) (not (_unused _s2)) (not (_unused _s8)) (not (_unused _s24)) (not (_unused _s27)) (not (_unused _s61)) (not (_unused _s86)) (not (_unused _s104)) (not (_unused _s161)) (not (_unused _s246)) (not (_unused _s279)) (not (_unused _s313)) (not (_unused _s338)) (not (_unused _s362)) (not (_unused _s500)) (not (_unused _s585)) (not (_unused _s618)) (not (_unused _s652)) (not (_unused _s677)) (not (_unused _s692)) (not (_unused _s726)) (not (_unused _s751)) (not (_unused _s769)) (not (_unused _s873)) (not (_unused _s907)) (not (_unused _s992)) (not (_unused _s1079)) (not (_unused _s1164)) (not (_unused _s1200)) (not (_unused _s1287))) (_applicable _p6)))
   )
   (:action a6_pick
          :parameters (#a64 o9 p424 #g64 o4 #t67)
          :precondition (and (atpose o9 p424) (kinfrom o9 p424 #g64 #a64 #t67) (on o9 o4) (clear o9) (canpick) (graspable o9) (_applicable _p6))
          :effect (and (increase (total-cost) 100) (not (on o9 o4)) (clear o4) (not (canpick)) (atgrasp o9 #g64 #a64) (not (atpose o9 p424)) (not (_applicable _p6)) (not (_unused _s86)) (not (_unused _s338)) (not (_unused _s677)) (when (and (not (_unused _s0)) (not (_unused _s2)) (not (_unused _s4)) (not (_unused _s8)) (not (_unused _s16)) (not (_unused _s24)) (not (_unused _s27)) (not (_unused _s61)) (not (_unused _s104)) (not (_unused _s127)) (not (_unused _s161)) (not (_unused _s246)) (not (_unused _s279)) (not (_unused _s313)) (not (_unused _s362)) (not (_unused _s466)) (not (_unused _s500)) (not (_unused _s585)) (not (_unused _s618)) (not (_unused _s652)) (not (_unused _s692)) (not (_unused _s726)) (not (_unused _s751)) (not (_unused _s769)) (not (_unused _s873)) (not (_unused _s907)) (not (_unused _s992)) (not (_unused _s1045)) (not (_unused _s1079)) (not (_unused _s1164)) (not (_unused _s1200)) (not (_unused _s1287))) (_applicable _p7)) (not (_unused _s86)) (not (_unused _s338)) (not (_unused _s677)) (when (and (not (_unused _s0)) (not (_unused _s2)) (not (_unused _s4)) (not (_unused _s8)) (not (_unused _s16)) (not (_unused _s24)) (not (_unused _s27)) (not (_unused _s61)) (not (_unused _s104)) (not (_unused _s127)) (not (_unused _s161)) (not (_unused _s246)) (not (_unused _s279)) (not (_unused _s313)) (not (_unused _s362)) (not (_unused _s466)) (not (_unused _s500)) (not (_unused _s585)) (not (_unused _s618)) (not (_unused _s652)) (not (_unused _s692)) (not (_unused _s726)) (not (_unused _s751)) (not (_unused _s769)) (not (_unused _s873)) (not (_unused _s907)) (not (_unused _s992)) (not (_unused _s1045)) (not (_unused _s1079)) (not (_unused _s1164)) (not (_unused _s1200)) (not (_unused _s1287))) (_applicable _p7)))
   )
   (:action a7_place
          :parameters (#a64 o9 #p8 #g64 o6 p256 #t141)
          :precondition (and (kinto o9 #p8 #g64 #a64 #t141) (smaller o9 o6) (clear o6) (atgrasp o9 #g64 #a64) (atpose o6 p256) (issupport o9 #p8 o6 p256) (_applicable _p7))
          :effect (and (increase (total-cost) 100) (on o9 o6) (not (clear o6)) (canpick) (not (atgrasp o9 #g64 #a64)) (atpose o9 #p8) (not (_applicable _p7)) (not (_unused _s86)) (not (_unused _s338)) (not (_unused _s8)) (not (_unused _s751)) (when (and (not (_unused _s0)) (not (_unused _s2)) (not (_unused _s4)) (not (_unused _s16)) (not (_unused _s24)) (not (_unused _s27)) (not (_unused _s61)) (not (_unused _s104)) (not (_unused _s127)) (not (_unused _s161)) (not (_unused _s246)) (not (_unused _s279)) (not (_unused _s313)) (not (_unused _s362)) (not (_unused _s466)) (not (_unused _s500)) (not (_unused _s585)) (not (_unused _s618)) (not (_unused _s652)) (not (_unused _s677)) (not (_unused _s692)) (not (_unused _s726)) (not (_unused _s769)) (not (_unused _s873)) (not (_unused _s907)) (not (_unused _s992)) (not (_unused _s1045)) (not (_unused _s1079)) (not (_unused _s1164)) (not (_unused _s1200)) (not (_unused _s1287))) (_applicable _p8)) (not (_unused _s86)) (not (_unused _s338)) (not (_unused _s8)) (not (_unused _s751)) (when (and (not (_unused _s0)) (not (_unused _s2)) (not (_unused _s4)) (not (_unused _s16)) (not (_unused _s24)) (not (_unused _s27)) (not (_unused _s61)) (not (_unused _s104)) (not (_unused _s127)) (not (_unused _s161)) (not (_unused _s246)) (not (_unused _s279)) (not (_unused _s313)) (not (_unused _s362)) (not (_unused _s466)) (not (_unused _s500)) (not (_unused _s585)) (not (_unused _s618)) (not (_unused _s652)) (not (_unused _s677)) (not (_unused _s692)) (not (_unused _s726)) (not (_unused _s769)) (not (_unused _s873)) (not (_unused _s907)) (not (_unused _s992)) (not (_unused _s1045)) (not (_unused _s1079)) (not (_unused _s1164)) (not (_unused _s1200)) (not (_unused _s1287))) (_applicable _p8)))
   )
   (:action a8_pick
          :parameters (#a133 o7 #p13 #g133 o8 #t210)
          :precondition (and (atpose o7 #p13) (kinfrom o7 #p13 #g133 #a133 #t210) (on o7 o8) (clear o7) (canpick) (graspable o7) (_applicable _p8))
          :effect (and (increase (total-cost) 100) (not (on o7 o8)) (clear o8) (not (canpick)) (atgrasp o7 #g133 #a133) (not (atpose o7 #p13)) (not (_applicable _p8)) (not (_unused _s907)) (not (_unused _s16)) (not (_unused _s500)) (not (_unused _s161)) (when (and (not (_unused _s0)) (not (_unused _s2)) (not (_unused _s4)) (not (_unused _s8)) (not (_unused _s24)) (not (_unused _s27)) (not (_unused _s61)) (not (_unused _s86)) (not (_unused _s104)) (not (_unused _s127)) (not (_unused _s246)) (not (_unused _s279)) (not (_unused _s313)) (not (_unused _s338)) (not (_unused _s362)) (not (_unused _s466)) (not (_unused _s585)) (not (_unused _s618)) (not (_unused _s652)) (not (_unused _s677)) (not (_unused _s692)) (not (_unused _s726)) (not (_unused _s751)) (not (_unused _s769)) (not (_unused _s873)) (not (_unused _s992)) (not (_unused _s1045)) (not (_unused _s1079)) (not (_unused _s1164)) (not (_unused _s1200)) (not (_unused _s1287))) (_applicable _p9)) (not (_unused _s907)) (not (_unused _s16)) (not (_unused _s500)) (not (_unused _s161)) (when (and (not (_unused _s0)) (not (_unused _s2)) (not (_unused _s4)) (not (_unused _s8)) (not (_unused _s24)) (not (_unused _s27)) (not (_unused _s61)) (not (_unused _s86)) (not (_unused _s104)) (not (_unused _s127)) (not (_unused _s246)) (not (_unused _s279)) (not (_unused _s313)) (not (_unused _s338)) (not (_unused _s362)) (not (_unused _s466)) (not (_unused _s585)) (not (_unused _s618)) (not (_unused _s652)) (not (_unused _s677)) (not (_unused _s692)) (not (_unused _s726)) (not (_unused _s751)) (not (_unused _s769)) (not (_unused _s873)) (not (_unused _s992)) (not (_unused _s1045)) (not (_unused _s1079)) (not (_unused _s1164)) (not (_unused _s1200)) (not (_unused _s1287))) (_applicable _p9)))
   )
   (:action a9_place
          :parameters (#a133 o7 #p0 #g133 o4 p432 #t382)
          :precondition (and (kinto o7 #p0 #g133 #a133 #t382) (smaller o7 o4) (clear o4) (atgrasp o7 #g133 #a133) (atpose o4 p432) (issupport o7 #p0 o4 p432) (_applicable _p9))
          :effect (and (increase (total-cost) 100) (on o7 o4) (not (clear o4)) (canpick) (not (atgrasp o7 #g133 #a133)) (atpose o7 #p0) (not (_applicable _p9)) (not (_unused _s0)) (not (_unused _s161)) (not (_unused _s1079)) (not (_unused _s500)) (when (and (not (_unused _s2)) (not (_unused _s4)) (not (_unused _s8)) (not (_unused _s16)) (not (_unused _s24)) (not (_unused _s27)) (not (_unused _s61)) (not (_unused _s86)) (not (_unused _s104)) (not (_unused _s127)) (not (_unused _s246)) (not (_unused _s279)) (not (_unused _s313)) (not (_unused _s338)) (not (_unused _s362)) (not (_unused _s466)) (not (_unused _s585)) (not (_unused _s618)) (not (_unused _s652)) (not (_unused _s677)) (not (_unused _s692)) (not (_unused _s726)) (not (_unused _s751)) (not (_unused _s769)) (not (_unused _s873)) (not (_unused _s907)) (not (_unused _s992)) (not (_unused _s1045)) (not (_unused _s1164)) (not (_unused _s1200)) (not (_unused _s1287))) (_applicable _p10)) (not (_unused _s0)) (not (_unused _s161)) (not (_unused _s1079)) (not (_unused _s500)) (when (and (not (_unused _s2)) (not (_unused _s4)) (not (_unused _s8)) (not (_unused _s16)) (not (_unused _s24)) (not (_unused _s27)) (not (_unused _s61)) (not (_unused _s86)) (not (_unused _s104)) (not (_unused _s127)) (not (_unused _s246)) (not (_unused _s279)) (not (_unused _s313)) (not (_unused _s338)) (not (_unused _s362)) (not (_unused _s466)) (not (_unused _s585)) (not (_unused _s618)) (not (_unused _s652)) (not (_unused _s677)) (not (_unused _s692)) (not (_unused _s726)) (not (_unused _s751)) (not (_unused _s769)) (not (_unused _s873)) (not (_unused _s907)) (not (_unused _s992)) (not (_unused _s1045)) (not (_unused _s1164)) (not (_unused _s1200)) (not (_unused _s1287))) (_applicable _p10)))
   )
   (:action a10_pick
          :parameters (#a218 o8 #p4 #g218 o5 #t295)
          :precondition (and (atpose o8 #p4) (kinfrom o8 #p4 #g218 #a218 #t295) (on o8 o5) (clear o8) (canpick) (graspable o8) (_applicable _p10))
          :effect (and (increase (total-cost) 100) (not (on o8 o5)) (clear o5) (not (canpick)) (atgrasp o8 #g218 #a218) (not (atpose o8 #p4)) (not (_applicable _p10)) (not (_unused _s585)) (not (_unused _s4)) (not (_unused _s246)) (not (_unused _s992)) (when (and (not (_unused _s0)) (not (_unused _s2)) (not (_unused _s8)) (not (_unused _s16)) (not (_unused _s24)) (not (_unused _s27)) (not (_unused _s61)) (not (_unused _s86)) (not (_unused _s104)) (not (_unused _s127)) (not (_unused _s161)) (not (_unused _s279)) (not (_unused _s313)) (not (_unused _s338)) (not (_unused _s362)) (not (_unused _s466)) (not (_unused _s500)) (not (_unused _s618)) (not (_unused _s652)) (not (_unused _s677)) (not (_unused _s692)) (not (_unused _s726)) (not (_unused _s751)) (not (_unused _s769)) (not (_unused _s873)) (not (_unused _s907)) (not (_unused _s1045)) (not (_unused _s1079)) (not (_unused _s1164)) (not (_unused _s1200)) (not (_unused _s1287))) (_applicable _p11)) (not (_unused _s585)) (not (_unused _s4)) (not (_unused _s246)) (not (_unused _s992)) (when (and (not (_unused _s0)) (not (_unused _s2)) (not (_unused _s8)) (not (_unused _s16)) (not (_unused _s24)) (not (_unused _s27)) (not (_unused _s61)) (not (_unused _s86)) (not (_unused _s104)) (not (_unused _s127)) (not (_unused _s161)) (not (_unused _s279)) (not (_unused _s313)) (not (_unused _s338)) (not (_unused _s362)) (not (_unused _s466)) (not (_unused _s500)) (not (_unused _s618)) (not (_unused _s652)) (not (_unused _s677)) (not (_unused _s692)) (not (_unused _s726)) (not (_unused _s751)) (not (_unused _s769)) (not (_unused _s873)) (not (_unused _s907)) (not (_unused _s1045)) (not (_unused _s1079)) (not (_unused _s1164)) (not (_unused _s1200)) (not (_unused _s1287))) (_applicable _p11)))
   )
   (:action a11_place
          :parameters (#a218 o8 #p21 #g218 o9 #p8 #t467)
          :precondition (and (kinto o8 #p21 #g218 #a218 #t467) (smaller o8 o9) (clear o9) (atgrasp o8 #g218 #a218) (atpose o9 #p8) (issupport o8 #p21 o9 #p8) (_applicable _p11))
          :effect (and (increase (total-cost) 100) (on o8 o9) (not (clear o9)) (canpick) (not (atgrasp o8 #g218 #a218)) (atpose o8 #p21) (not (_applicable _p11)) (not (_unused _s1164)) (not (_unused _s246)) (not (_unused _s585)) (not (_unused _s24)) (not (_unused _s8)) (when (and (not (_unused _s0)) (not (_unused _s2)) (not (_unused _s4)) (not (_unused _s16)) (not (_unused _s27)) (not (_unused _s61)) (not (_unused _s86)) (not (_unused _s104)) (not (_unused _s127)) (not (_unused _s161)) (not (_unused _s279)) (not (_unused _s313)) (not (_unused _s338)) (not (_unused _s362)) (not (_unused _s466)) (not (_unused _s500)) (not (_unused _s618)) (not (_unused _s652)) (not (_unused _s677)) (not (_unused _s692)) (not (_unused _s726)) (not (_unused _s751)) (not (_unused _s769)) (not (_unused _s873)) (not (_unused _s907)) (not (_unused _s992)) (not (_unused _s1045)) (not (_unused _s1079)) (not (_unused _s1200)) (not (_unused _s1287))) (_applicable _p12)) (not (_unused _s1164)) (not (_unused _s246)) (not (_unused _s585)) (not (_unused _s24)) (not (_unused _s8)) (when (and (not (_unused _s0)) (not (_unused _s2)) (not (_unused _s4)) (not (_unused _s16)) (not (_unused _s27)) (not (_unused _s61)) (not (_unused _s86)) (not (_unused _s104)) (not (_unused _s127)) (not (_unused _s161)) (not (_unused _s279)) (not (_unused _s313)) (not (_unused _s338)) (not (_unused _s362)) (not (_unused _s466)) (not (_unused _s500)) (not (_unused _s618)) (not (_unused _s652)) (not (_unused _s677)) (not (_unused _s692)) (not (_unused _s726)) (not (_unused _s751)) (not (_unused _s769)) (not (_unused _s873)) (not (_unused _s907)) (not (_unused _s992)) (not (_unused _s1045)) (not (_unused _s1079)) (not (_unused _s1200)) (not (_unused _s1287))) (_applicable _p12)))
   )
   (:action a12_pick
          :parameters (#a254 o7 #p0 #g254 o4 #t503)
          :precondition (and (atpose o7 #p0) (kinfrom o7 #p0 #g254 #a254 #t503) (on o7 o4) (clear o7) (canpick) (graspable o7) (_applicable _p12))
          :effect (and (increase (total-cost) 100) (not (on o7 o4)) (clear o4) (not (canpick)) (atgrasp o7 #g254 #a254) (not (atpose o7 #p0)) (not (_applicable _p12)) (not (_unused _s0)) (not (_unused _s362)) (not (_unused _s1200)) (not (_unused _s769)) (when (and (not (_unused _s2)) (not (_unused _s4)) (not (_unused _s8)) (not (_unused _s16)) (not (_unused _s24)) (not (_unused _s27)) (not (_unused _s61)) (not (_unused _s86)) (not (_unused _s104)) (not (_unused _s127)) (not (_unused _s161)) (not (_unused _s246)) (not (_unused _s279)) (not (_unused _s313)) (not (_unused _s338)) (not (_unused _s466)) (not (_unused _s500)) (not (_unused _s585)) (not (_unused _s618)) (not (_unused _s652)) (not (_unused _s677)) (not (_unused _s692)) (not (_unused _s726)) (not (_unused _s751)) (not (_unused _s873)) (not (_unused _s907)) (not (_unused _s992)) (not (_unused _s1045)) (not (_unused _s1079)) (not (_unused _s1164)) (not (_unused _s1287))) (_applicable _p13)) (not (_unused _s0)) (not (_unused _s362)) (not (_unused _s1200)) (not (_unused _s769)) (when (and (not (_unused _s2)) (not (_unused _s4)) (not (_unused _s8)) (not (_unused _s16)) (not (_unused _s24)) (not (_unused _s27)) (not (_unused _s61)) (not (_unused _s86)) (not (_unused _s104)) (not (_unused _s127)) (not (_unused _s161)) (not (_unused _s246)) (not (_unused _s279)) (not (_unused _s313)) (not (_unused _s338)) (not (_unused _s466)) (not (_unused _s500)) (not (_unused _s585)) (not (_unused _s618)) (not (_unused _s652)) (not (_unused _s677)) (not (_unused _s692)) (not (_unused _s726)) (not (_unused _s751)) (not (_unused _s873)) (not (_unused _s907)) (not (_unused _s992)) (not (_unused _s1045)) (not (_unused _s1079)) (not (_unused _s1164)) (not (_unused _s1287))) (_applicable _p13)))
   )
   (:action a13_place
          :parameters (#a254 o7 #p24 #g254 o8 #p21 #t590)
          :precondition (and (kinto o7 #p24 #g254 #a254 #t590) (smaller o7 o8) (clear o8) (atgrasp o7 #g254 #a254) (atpose o8 #p21) (issupport o7 #p24 o8 #p21) (_applicable _p13))
          :effect (and (increase (total-cost) 100) (on o7 o8) (not (clear o8)) (canpick) (not (atgrasp o7 #g254 #a254)) (atpose o7 #p24) (not (_applicable _p13)) (not (_unused _s104)) (not (_unused _s1287)) (not (_unused _s24)) (not (_unused _s362)) (not (_unused _s769)) (when (and (not (_unused _s0)) (not (_unused _s2)) (not (_unused _s4)) (not (_unused _s8)) (not (_unused _s16)) (not (_unused _s27)) (not (_unused _s61)) (not (_unused _s86)) (not (_unused _s127)) (not (_unused _s161)) (not (_unused _s246)) (not (_unused _s279)) (not (_unused _s313)) (not (_unused _s338)) (not (_unused _s466)) (not (_unused _s500)) (not (_unused _s585)) (not (_unused _s618)) (not (_unused _s652)) (not (_unused _s677)) (not (_unused _s692)) (not (_unused _s726)) (not (_unused _s751)) (not (_unused _s873)) (not (_unused _s907)) (not (_unused _s992)) (not (_unused _s1045)) (not (_unused _s1079)) (not (_unused _s1164)) (not (_unused _s1200))) (_applicable _p14)) (not (_unused _s104)) (not (_unused _s1287)) (not (_unused _s24)) (not (_unused _s362)) (not (_unused _s769)) (when (and (not (_unused _s0)) (not (_unused _s2)) (not (_unused _s4)) (not (_unused _s8)) (not (_unused _s16)) (not (_unused _s27)) (not (_unused _s61)) (not (_unused _s86)) (not (_unused _s127)) (not (_unused _s161)) (not (_unused _s246)) (not (_unused _s279)) (not (_unused _s313)) (not (_unused _s338)) (not (_unused _s466)) (not (_unused _s500)) (not (_unused _s585)) (not (_unused _s618)) (not (_unused _s652)) (not (_unused _s677)) (not (_unused _s692)) (not (_unused _s726)) (not (_unused _s751)) (not (_unused _s873)) (not (_unused _s907)) (not (_unused _s992)) (not (_unused _s1045)) (not (_unused _s1079)) (not (_unused _s1164)) (not (_unused _s1200))) (_applicable _p14)))
   )
   (:action s0_sample-place
          :parameters (o7 o4 p432)
          :precondition (and (smaller o7 o4) (graspable o7) (ispose o4 p432))
          :effect (and (ispose o7 #p0) (issupport o7 #p0 o4 p432) (_unused _s0))
   )
   (:action s2_sample-place
          :parameters (o7 o6 p256)
          :precondition (and (smaller o7 o6) (graspable o7) (ispose o6 p256))
          :effect (and (ispose o7 #p2) (issupport o7 #p2 o6 p256) (_unused _s2))
   )
   (:action s4_sample-place
          :parameters (o8 o5 p200)
          :precondition (and (smaller o8 o5) (graspable o8) (ispose o5 p200))
          :effect (and (ispose o8 #p4) (issupport o8 #p4 o5 p200) (_unused _s4))
   )
   (:action s8_sample-place
          :parameters (o9 o6 p256)
          :precondition (and (smaller o9 o6) (graspable o9) (ispose o6 p256))
          :effect (and (ispose o9 #p8) (issupport o9 #p8 o6 p256) (_unused _s8))
   )
   (:action s16_sample-place
          :parameters (o7 o8 #p4)
          :precondition (and (smaller o7 o8) (graspable o7) (ispose o8 #p4))
          :effect (and (ispose o7 #p13) (issupport o7 #p13 o8 #p4) (not (_unused _s4)) (_unused _s16))
   )
   (:action s24_sample-place
          :parameters (o8 o9 #p8)
          :precondition (and (smaller o8 o9) (graspable o8) (ispose o9 #p8))
          :effect (and (ispose o8 #p21) (issupport o8 #p21 o9 #p8) (not (_unused _s8)) (_unused _s24))
   )
   (:action s27_sample-arm
          :parameters (o7 p312 #p2)
          :precondition (and (graspable o7) (ispose o7 p312) (ispose o7 #p2))
          :effect (and (isarm #a5 o7 p312 #p2) (not (_unused _s2)) (_unused _s27))
   )
   (:action s61_sample-arm
          :parameters (o8 p368 #p4)
          :precondition (and (graspable o8) (ispose o8 p368) (ispose o8 #p4))
          :effect (and (isarm #a39 o8 p368 #p4) (not (_unused _s4)) (_unused _s61))
   )
   (:action s86_sample-arm
          :parameters (o9 p424 #p8)
          :precondition (and (graspable o9) (ispose o9 p424) (ispose o9 #p8))
          :effect (and (isarm #a64 o9 p424 #p8) (not (_unused _s8)) (_unused _s86))
   )
   (:action s104_sample-place
          :parameters (o7 o8 #p21)
          :precondition (and (smaller o7 o8) (graspable o7) (ispose o8 #p21))
          :effect (and (ispose o7 #p24) (issupport o7 #p24 o8 #p21) (not (_unused _s24)) (_unused _s104))
   )
   (:action s127_sample-arm
          :parameters (o7 #p2 #p13)
          :precondition (and (graspable o7) (ispose o7 #p2) (ispose o7 #p13))
          :effect (and (isarm #a99 o7 #p2 #p13) (not (_unused _s2)) (not (_unused _s16)) (_unused _s127))
   )
   (:action s161_sample-arm
          :parameters (o7 #p13 #p0)
          :precondition (and (graspable o7) (ispose o7 #p13) (ispose o7 #p0))
          :effect (and (isarm #a133 o7 #p13 #p0) (not (_unused _s0)) (not (_unused _s16)) (_unused _s161))
   )
   (:action s246_sample-arm
          :parameters (o8 #p4 #p21)
          :precondition (and (graspable o8) (ispose o8 #p4) (ispose o8 #p21))
          :effect (and (isarm #a218 o8 #p4 #p21) (not (_unused _s4)) (not (_unused _s24)) (_unused _s246))
   )
   (:action s279_sample-grasp
          :parameters (o7 p312 #p2 #a5)
          :precondition (isarm #a5 o7 p312 #p2)
          :effect (and (isgrasp o7 p312 #p2 #g5 #a5) (not (_unused _s2)) (not (_unused _s27)) (_unused _s279))
   )
   (:action s313_sample-grasp
          :parameters (o8 p368 #p4 #a39)
          :precondition (isarm #a39 o8 p368 #p4)
          :effect (and (isgrasp o8 p368 #p4 #g39 #a39) (not (_unused _s4)) (not (_unused _s61)) (_unused _s313))
   )
   (:action s338_sample-grasp
          :parameters (o9 p424 #p8 #a64)
          :precondition (isarm #a64 o9 p424 #p8)
          :effect (and (isgrasp o9 p424 #p8 #g64 #a64) (not (_unused _s86)) (not (_unused _s8)) (_unused _s338))
   )
   (:action s362_sample-arm
          :parameters (o7 #p0 #p24)
          :precondition (and (graspable o7) (ispose o7 #p0) (ispose o7 #p24))
          :effect (and (isarm #a254 o7 #p0 #p24) (not (_unused _s0)) (not (_unused _s104)) (_unused _s362))
   )
   (:action s466_sample-grasp
          :parameters (o7 #p2 #p13 #a99)
          :precondition (isarm #a99 o7 #p2 #p13)
          :effect (and (isgrasp o7 #p2 #p13 #g99 #a99) (not (_unused _s2)) (not (_unused _s16)) (not (_unused _s127)) (_unused _s466))
   )
   (:action s500_sample-grasp
          :parameters (o7 #p13 #p0 #a133)
          :precondition (isarm #a133 o7 #p13 #p0)
          :effect (and (isgrasp o7 #p13 #p0 #g133 #a133) (not (_unused _s0)) (not (_unused _s16)) (not (_unused _s161)) (_unused _s500))
   )
   (:action s585_sample-grasp
          :parameters (o8 #p4 #p21 #a218)
          :precondition (isarm #a218 o8 #p4 #p21)
          :effect (and (isgrasp o8 #p4 #p21 #g218 #a218) (not (_unused _s4)) (not (_unused _s24)) (not (_unused _s246)) (_unused _s585))
   )
   (:action s618_ik-arm-motion-from
          :parameters (o7 p312 #p2 #g5 #a5)
          :precondition (and (isgrasp o7 p312 #p2 #g5 #a5))
          :effect (and (kinfrom o7 p312 #g5 #a5 #t8) (not (_unused _s2)) (not (_unused _s279)) (not (_unused _s27)) (_unused _s618))
   )
   (:action s652_ik-arm-motion-from
          :parameters (o8 p368 #p4 #g39 #a39)
          :precondition (and (isgrasp o8 p368 #p4 #g39 #a39))
          :effect (and (kinfrom o8 p368 #g39 #a39 #t42) (not (_unused _s4)) (not (_unused _s313)) (not (_unused _s61)) (_unused _s652))
   )
   (:action s677_ik-arm-motion-from
          :parameters (o9 p424 #p8 #g64 #a64)
          :precondition (and (isgrasp o9 p424 #p8 #g64 #a64))
          :effect (and (kinfrom o9 p424 #g64 #a64 #t67) (not (_unused _s86)) (not (_unused _s338)) (not (_unused _s8)) (_unused _s677))
   )
   (:action s692_ik-arm-motion-to
          :parameters (o7 #p2 p312 #g5 #a5)
          :precondition (and (isgrasp o7 p312 #p2 #g5 #a5))
          :effect (and (kinto o7 #p2 #g5 #a5 #t82) (not (_unused _s2)) (not (_unused _s279)) (not (_unused _s27)) (_unused _s692))
   )
   (:action s726_ik-arm-motion-to
          :parameters (o8 #p4 p368 #g39 #a39)
          :precondition (and (isgrasp o8 p368 #p4 #g39 #a39))
          :effect (and (kinto o8 #p4 #g39 #a39 #t116) (not (_unused _s4)) (not (_unused _s313)) (not (_unused _s61)) (_unused _s726))
   )
   (:action s751_ik-arm-motion-to
          :parameters (o9 #p8 p424 #g64 #a64)
          :precondition (and (isgrasp o9 p424 #p8 #g64 #a64))
          :effect (and (kinto o9 #p8 #g64 #a64 #t141) (not (_unused _s86)) (not (_unused _s338)) (not (_unused _s8)) (_unused _s751))
   )
   (:action s769_sample-grasp
          :parameters (o7 #p0 #p24 #a254)
          :precondition (isarm #a254 o7 #p0 #p24)
          :effect (and (isgrasp o7 #p0 #p24 #g254 #a254) (not (_unused _s0)) (not (_unused _s362)) (not (_unused _s104)) (_unused _s769))
   )
   (:action s873_ik-arm-motion-from
          :parameters (o7 #p2 #p13 #g99 #a99)
          :precondition (and (isgrasp o7 #p2 #p13 #g99 #a99))
          :effect (and (kinfrom o7 #p2 #g99 #a99 #t176) (not (_unused _s2)) (not (_unused _s16)) (not (_unused _s127)) (not (_unused _s466)) (_unused _s873))
   )
   (:action s907_ik-arm-motion-from
          :parameters (o7 #p13 #p0 #g133 #a133)
          :precondition (and (isgrasp o7 #p13 #p0 #g133 #a133))
          :effect (and (kinfrom o7 #p13 #g133 #a133 #t210) (not (_unused _s0)) (not (_unused _s16)) (not (_unused _s500)) (not (_unused _s161)) (_unused _s907))
   )
   (:action s992_ik-arm-motion-from
          :parameters (o8 #p4 #p21 #g218 #a218)
          :precondition (and (isgrasp o8 #p4 #p21 #g218 #a218))
          :effect (and (kinfrom o8 #p4 #g218 #a218 #t295) (not (_unused _s585)) (not (_unused _s4)) (not (_unused _s24)) (not (_unused _s246)) (_unused _s992))
   )
   (:action s1045_ik-arm-motion-to
          :parameters (o7 #p13 #p2 #g99 #a99)
          :precondition (and (isgrasp o7 #p2 #p13 #g99 #a99))
          :effect (and (kinto o7 #p13 #g99 #a99 #t348) (not (_unused _s2)) (not (_unused _s16)) (not (_unused _s127)) (not (_unused _s466)) (_unused _s1045))
   )
   (:action s1079_ik-arm-motion-to
          :parameters (o7 #p0 #p13 #g133 #a133)
          :precondition (and (isgrasp o7 #p13 #p0 #g133 #a133))
          :effect (and (kinto o7 #p0 #g133 #a133 #t382) (not (_unused _s0)) (not (_unused _s16)) (not (_unused _s500)) (not (_unused _s161)) (_unused _s1079))
   )
   (:action s1164_ik-arm-motion-to
          :parameters (o8 #p21 #p4 #g218 #a218)
          :precondition (and (isgrasp o8 #p4 #p21 #g218 #a218))
          :effect (and (kinto o8 #p21 #g218 #a218 #t467) (not (_unused _s585)) (not (_unused _s4)) (not (_unused _s24)) (not (_unused _s246)) (_unused _s1164))
   )
   (:action s1200_ik-arm-motion-from
          :parameters (o7 #p0 #p24 #g254 #a254)
          :precondition (and (isgrasp o7 #p0 #p24 #g254 #a254))
          :effect (and (kinfrom o7 #p0 #g254 #a254 #t503) (not (_unused _s0)) (not (_unused _s362)) (not (_unused _s104)) (not (_unused _s769)) (_unused _s1200))
   )
   (:action s1287_ik-arm-motion-to
          :parameters (o7 #p24 #p0 #g254 #a254)
          :precondition (and (isgrasp o7 #p0 #p24 #g254 #a254))
          :effect (and (kinto o7 #p24 #g254 #a254 #t590) (not (_unused _s0)) (not (_unused _s362)) (not (_unused _s104)) (not (_unused _s769)) (_unused _s1287))
   )
)
