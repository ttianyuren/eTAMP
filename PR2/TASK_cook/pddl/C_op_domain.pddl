;15:10:41 13/09

;Skeleton_SN = 0

(define (domain pr2-tamp_propo_reorder)
   (:requirements :strips :equality :action-costs)

   (:types
          arm wuti grasp config pose trajectory propo_action propo_stream
   )

   (:constants
          #p0 #p1 #p10 #p11 #p2 #p3 #p4 #p5 #p6 #p7 #p8 #p9 - pose
          #g0 #g1 #g2 #g3 - grasp
          #t0 #t1 #t10 #t100 #t101 #t102 #t103 #t104 #t105 #t106 #t107 #t108 #t109 #t11 #t110 #t111 #t112 #t113 #t114 #t115 #t116 #t117 #t118 #t119 #t12 #t120 #t121 #t122 #t123 #t124 #t125 #t126 #t127 #t128 #t129 #t13 #t130 #t131 #t132 #t133 #t134 #t135 #t136 #t137 #t138 #t139 #t14 #t140 #t141 #t142 #t143 #t144 #t145 #t146 #t147 #t148 #t149 #t15 #t150 #t151 #t152 #t153 #t154 #t155 #t156 #t157 #t158 #t159 #t16 #t160 #t161 #t162 #t163 #t164 #t165 #t166 #t167 #t168 #t169 #t17 #t170 #t171 #t172 #t173 #t174 #t175 #t176 #t177 #t178 #t179 #t18 #t180 #t181 #t182 #t183 #t184 #t185 #t186 #t187 #t188 #t189 #t19 #t190 #t191 #t192 #t193 #t194 #t195 #t196 #t197 #t198 #t199 #t2 #t20 #t200 #t201 #t202 #t203 #t204 #t205 #t206 #t207 #t208 #t209 #t21 #t210 #t211 #t212 #t213 #t214 #t215 #t216 #t217 #t218 #t219 #t22 #t220 #t221 #t222 #t223 #t224 #t225 #t226 #t227 #t228 #t229 #t23 #t230 #t231 #t232 #t233 #t234 #t235 #t236 #t237 #t238 #t239 #t24 #t240 #t241 #t242 #t243 #t244 #t245 #t246 #t247 #t248 #t249 #t25 #t250 #t251 #t252 #t253 #t254 #t255 #t256 #t257 #t258 #t259 #t26 #t260 #t261 #t262 #t263 #t264 #t265 #t266 #t267 #t268 #t269 #t27 #t270 #t271 #t272 #t273 #t274 #t275 #t276 #t277 #t278 #t279 #t28 #t280 #t281 #t282 #t283 #t284 #t285 #t286 #t287 #t288 #t289 #t29 #t290 #t291 #t292 #t293 #t294 #t295 #t296 #t297 #t298 #t299 #t3 #t30 #t300 #t301 #t302 #t303 #t304 #t31 #t32 #t33 #t34 #t35 #t36 #t37 #t38 #t39 #t4 #t40 #t41 #t42 #t43 #t44 #t45 #t46 #t47 #t48 #t49 #t5 #t50 #t51 #t52 #t53 #t54 #t55 #t56 #t57 #t58 #t59 #t6 #t60 #t61 #t62 #t63 #t64 #t65 #t66 #t67 #t68 #t69 #t7 #t70 #t71 #t72 #t73 #t74 #t75 #t76 #t77 #t78 #t79 #t8 #t80 #t81 #t82 #t83 #t84 #t85 #t86 #t87 #t88 #t89 #t9 #t90 #t91 #t92 #t93 #t94 #t95 #t96 #t97 #t98 #t99 - trajectory
          #q0 #q1 #q10 #q11 #q12 #q13 #q14 #q15 #q2 #q3 #q4 #q5 #q6 #q7 #q8 #q9 - config
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
          (_unused ?_s - propo_stream)
   )

   (:derived (on ?o - wuti ?r - wuti)
          (exists (?p) (and (supported ?o ?p ?r) (atpose ?o ?p)))
   )
   (:derived (holding ?a - arm ?o - wuti)
          (exists (?g) (and (isarm ?a) (isgrasp ?o ?g) (atgrasp ?a ?o ?g)))
   )

   (:action a0_move_base
          :parameters (q976 #q1 #t18)
          :precondition (and (basemotion q976 #t18 #q1) (atbconf q976) (canmove) (_applicable _p0))
          :effect (and (atbconf #q1) (not (atbconf q976)) (not (canmove)) (increase (total-cost) 200) (not (canoperate)) (not (_applicable _p0)) (not (_unused _s18)) (not (_unused _s34)) (when (and (not (_unused _s1)) (not (_unused _s2)) (not (_unused _s4)) (not (_unused _s5)) (not (_unused _s7)) (not (_unused _s8)) (not (_unused _s10)) (not (_unused _s11)) (not (_unused _s12)) (not (_unused _s13)) (not (_unused _s14)) (not (_unused _s15)) (not (_unused _s17)) (not (_unused _s19)) (not (_unused _s20)) (not (_unused _s22)) (not (_unused _s23)) (not (_unused _s25)) (not (_unused _s26)) (not (_unused _s28)) (not (_unused _s29)) (not (_unused _s31)) (not (_unused _s32)) (not (_unused _s55)) (not (_unused _s75)) (not (_unused _s95)) (not (_unused _s115)) (not (_unused _s141)) (not (_unused _s151)) (not (_unused _s195)) (not (_unused _s206)) (not (_unused _s249)) (not (_unused _s254)) (not (_unused _s303)) (not (_unused _s307))) (_applicable _p1)) (not (_unused _s18)) (not (_unused _s34)) (when (and (not (_unused _s1)) (not (_unused _s2)) (not (_unused _s4)) (not (_unused _s5)) (not (_unused _s7)) (not (_unused _s8)) (not (_unused _s10)) (not (_unused _s11)) (not (_unused _s12)) (not (_unused _s13)) (not (_unused _s14)) (not (_unused _s15)) (not (_unused _s17)) (not (_unused _s19)) (not (_unused _s20)) (not (_unused _s22)) (not (_unused _s23)) (not (_unused _s25)) (not (_unused _s26)) (not (_unused _s28)) (not (_unused _s29)) (not (_unused _s31)) (not (_unused _s32)) (not (_unused _s55)) (not (_unused _s75)) (not (_unused _s95)) (not (_unused _s115)) (not (_unused _s141)) (not (_unused _s151)) (not (_unused _s195)) (not (_unused _s206)) (not (_unused _s249)) (not (_unused _s254)) (not (_unused _s303)) (not (_unused _s307))) (_applicable _p1)))
   )
   (:action a1_pick
          :parameters ('left' o6 p504 #g1 #q1 #t2)
          :precondition (and (kin 'left' o6 p504 #g1 #q1 #t2) (atpose o6 p504) (handempty 'left') (atbconf #q1) (_applicable _p1))
          :effect (and (atgrasp 'left' o6 #g1) (canmove) (not (atpose o6 p504)) (not (handempty 'left')) (increase (total-cost) 100) (not (canoperate)) (not (_applicable _p1)) (not (_unused _s13)) (not (_unused _s18)) (when (and (not (_unused _s1)) (not (_unused _s2)) (not (_unused _s4)) (not (_unused _s5)) (not (_unused _s7)) (not (_unused _s8)) (not (_unused _s10)) (not (_unused _s11)) (not (_unused _s12)) (not (_unused _s14)) (not (_unused _s15)) (not (_unused _s17)) (not (_unused _s19)) (not (_unused _s20)) (not (_unused _s22)) (not (_unused _s23)) (not (_unused _s25)) (not (_unused _s26)) (not (_unused _s28)) (not (_unused _s29)) (not (_unused _s31)) (not (_unused _s32)) (not (_unused _s34)) (not (_unused _s55)) (not (_unused _s75)) (not (_unused _s95)) (not (_unused _s115)) (not (_unused _s141)) (not (_unused _s151)) (not (_unused _s195)) (not (_unused _s206)) (not (_unused _s249)) (not (_unused _s254)) (not (_unused _s303)) (not (_unused _s307))) (_applicable _p2)) (not (_unused _s13)) (not (_unused _s18)) (when (and (not (_unused _s1)) (not (_unused _s2)) (not (_unused _s4)) (not (_unused _s5)) (not (_unused _s7)) (not (_unused _s8)) (not (_unused _s10)) (not (_unused _s11)) (not (_unused _s12)) (not (_unused _s14)) (not (_unused _s15)) (not (_unused _s17)) (not (_unused _s19)) (not (_unused _s20)) (not (_unused _s22)) (not (_unused _s23)) (not (_unused _s25)) (not (_unused _s26)) (not (_unused _s28)) (not (_unused _s29)) (not (_unused _s31)) (not (_unused _s32)) (not (_unused _s34)) (not (_unused _s55)) (not (_unused _s75)) (not (_unused _s95)) (not (_unused _s115)) (not (_unused _s141)) (not (_unused _s151)) (not (_unused _s195)) (not (_unused _s206)) (not (_unused _s249)) (not (_unused _s254)) (not (_unused _s303)) (not (_unused _s307))) (_applicable _p2)))
   )
   (:action a2_move_base
          :parameters (#q1 #q8 #t59)
          :precondition (and (basemotion #q1 #t59 #q8) (atbconf #q1) (canmove) (_applicable _p2))
          :effect (and (atbconf #q8) (not (atbconf #q1)) (not (canmove)) (increase (total-cost) 200) (not (canoperate)) (not (_applicable _p2)) (not (_unused _s18)) (not (_unused _s75)) (not (_unused _s25)) (when (and (not (_unused _s1)) (not (_unused _s2)) (not (_unused _s4)) (not (_unused _s5)) (not (_unused _s7)) (not (_unused _s8)) (not (_unused _s10)) (not (_unused _s11)) (not (_unused _s12)) (not (_unused _s13)) (not (_unused _s14)) (not (_unused _s15)) (not (_unused _s17)) (not (_unused _s19)) (not (_unused _s20)) (not (_unused _s22)) (not (_unused _s23)) (not (_unused _s26)) (not (_unused _s28)) (not (_unused _s29)) (not (_unused _s31)) (not (_unused _s32)) (not (_unused _s34)) (not (_unused _s55)) (not (_unused _s95)) (not (_unused _s115)) (not (_unused _s141)) (not (_unused _s151)) (not (_unused _s195)) (not (_unused _s206)) (not (_unused _s249)) (not (_unused _s254)) (not (_unused _s303)) (not (_unused _s307))) (_applicable _p3)) (not (_unused _s18)) (not (_unused _s75)) (not (_unused _s25)) (when (and (not (_unused _s1)) (not (_unused _s2)) (not (_unused _s4)) (not (_unused _s5)) (not (_unused _s7)) (not (_unused _s8)) (not (_unused _s10)) (not (_unused _s11)) (not (_unused _s12)) (not (_unused _s13)) (not (_unused _s14)) (not (_unused _s15)) (not (_unused _s17)) (not (_unused _s19)) (not (_unused _s20)) (not (_unused _s22)) (not (_unused _s23)) (not (_unused _s26)) (not (_unused _s28)) (not (_unused _s29)) (not (_unused _s31)) (not (_unused _s32)) (not (_unused _s34)) (not (_unused _s55)) (not (_unused _s95)) (not (_unused _s115)) (not (_unused _s141)) (not (_unused _s151)) (not (_unused _s195)) (not (_unused _s206)) (not (_unused _s249)) (not (_unused _s254)) (not (_unused _s303)) (not (_unused _s307))) (_applicable _p3)))
   )
   (:action a3_place
          :parameters ('left' o6 #p4 #g1 #q8 #t9)
          :precondition (and (kin 'left' o6 #p4 #g1 #q8 #t9) (atgrasp 'left' o6 #g1) (atbconf #q8) (_applicable _p3))
          :effect (and (atpose o6 #p4) (handempty 'left') (canmove) (not (atgrasp 'left' o6 #g1)) (increase (total-cost) 100) (canoperate) (not (_applicable _p3)) (not (_unused _s13)) (not (_unused _s4)) (not (_unused _s25)) (when (and (not (_unused _s1)) (not (_unused _s2)) (not (_unused _s5)) (not (_unused _s7)) (not (_unused _s8)) (not (_unused _s10)) (not (_unused _s11)) (not (_unused _s12)) (not (_unused _s14)) (not (_unused _s15)) (not (_unused _s17)) (not (_unused _s18)) (not (_unused _s19)) (not (_unused _s20)) (not (_unused _s22)) (not (_unused _s23)) (not (_unused _s26)) (not (_unused _s28)) (not (_unused _s29)) (not (_unused _s31)) (not (_unused _s32)) (not (_unused _s34)) (not (_unused _s55)) (not (_unused _s75)) (not (_unused _s95)) (not (_unused _s115)) (not (_unused _s141)) (not (_unused _s151)) (not (_unused _s195)) (not (_unused _s206)) (not (_unused _s249)) (not (_unused _s254)) (not (_unused _s303)) (not (_unused _s307))) (_applicable _p4)) (not (_unused _s13)) (not (_unused _s4)) (not (_unused _s25)) (when (and (not (_unused _s1)) (not (_unused _s2)) (not (_unused _s5)) (not (_unused _s7)) (not (_unused _s8)) (not (_unused _s10)) (not (_unused _s11)) (not (_unused _s12)) (not (_unused _s14)) (not (_unused _s15)) (not (_unused _s17)) (not (_unused _s18)) (not (_unused _s19)) (not (_unused _s20)) (not (_unused _s22)) (not (_unused _s23)) (not (_unused _s26)) (not (_unused _s28)) (not (_unused _s29)) (not (_unused _s31)) (not (_unused _s32)) (not (_unused _s34)) (not (_unused _s55)) (not (_unused _s75)) (not (_unused _s95)) (not (_unused _s115)) (not (_unused _s141)) (not (_unused _s151)) (not (_unused _s195)) (not (_unused _s206)) (not (_unused _s249)) (not (_unused _s254)) (not (_unused _s303)) (not (_unused _s307))) (_applicable _p4)))
   )
   (:action a4_clean
          :parameters (o6 o3)
          :precondition (and (stackable o6 o3) (sink o3) (on o6 o3) (canoperate) (_applicable _p4))
          :effect (and (cleaned o6) (increase (total-cost) 50) (not (canoperate)) (not (_applicable _p4)) (when (and (not (_unused _s1)) (not (_unused _s2)) (not (_unused _s4)) (not (_unused _s5)) (not (_unused _s7)) (not (_unused _s8)) (not (_unused _s10)) (not (_unused _s11)) (not (_unused _s12)) (not (_unused _s13)) (not (_unused _s14)) (not (_unused _s15)) (not (_unused _s17)) (not (_unused _s18)) (not (_unused _s19)) (not (_unused _s20)) (not (_unused _s22)) (not (_unused _s23)) (not (_unused _s25)) (not (_unused _s26)) (not (_unused _s28)) (not (_unused _s29)) (not (_unused _s31)) (not (_unused _s32)) (not (_unused _s34)) (not (_unused _s55)) (not (_unused _s75)) (not (_unused _s95)) (not (_unused _s115)) (not (_unused _s141)) (not (_unused _s151)) (not (_unused _s195)) (not (_unused _s206)) (not (_unused _s249)) (not (_unused _s254)) (not (_unused _s303)) (not (_unused _s307))) (_applicable _p5)) (when (and (not (_unused _s1)) (not (_unused _s2)) (not (_unused _s4)) (not (_unused _s5)) (not (_unused _s7)) (not (_unused _s8)) (not (_unused _s10)) (not (_unused _s11)) (not (_unused _s12)) (not (_unused _s13)) (not (_unused _s14)) (not (_unused _s15)) (not (_unused _s17)) (not (_unused _s18)) (not (_unused _s19)) (not (_unused _s20)) (not (_unused _s22)) (not (_unused _s23)) (not (_unused _s25)) (not (_unused _s26)) (not (_unused _s28)) (not (_unused _s29)) (not (_unused _s31)) (not (_unused _s32)) (not (_unused _s34)) (not (_unused _s55)) (not (_unused _s75)) (not (_unused _s95)) (not (_unused _s115)) (not (_unused _s141)) (not (_unused _s151)) (not (_unused _s195)) (not (_unused _s206)) (not (_unused _s249)) (not (_unused _s254)) (not (_unused _s303)) (not (_unused _s307))) (_applicable _p5)))
   )
   (:action a5_pick
          :parameters ('left' o6 #p4 #g1 #q8 #t9)
          :precondition (and (kin 'left' o6 #p4 #g1 #q8 #t9) (atpose o6 #p4) (handempty 'left') (atbconf #q8) (_applicable _p5))
          :effect (and (atgrasp 'left' o6 #g1) (canmove) (not (atpose o6 #p4)) (not (handempty 'left')) (increase (total-cost) 100) (not (canoperate)) (not (_applicable _p5)) (not (_unused _s13)) (not (_unused _s4)) (not (_unused _s25)) (when (and (not (_unused _s1)) (not (_unused _s2)) (not (_unused _s5)) (not (_unused _s7)) (not (_unused _s8)) (not (_unused _s10)) (not (_unused _s11)) (not (_unused _s12)) (not (_unused _s14)) (not (_unused _s15)) (not (_unused _s17)) (not (_unused _s18)) (not (_unused _s19)) (not (_unused _s20)) (not (_unused _s22)) (not (_unused _s23)) (not (_unused _s26)) (not (_unused _s28)) (not (_unused _s29)) (not (_unused _s31)) (not (_unused _s32)) (not (_unused _s34)) (not (_unused _s55)) (not (_unused _s75)) (not (_unused _s95)) (not (_unused _s115)) (not (_unused _s141)) (not (_unused _s151)) (not (_unused _s195)) (not (_unused _s206)) (not (_unused _s249)) (not (_unused _s254)) (not (_unused _s303)) (not (_unused _s307))) (_applicable _p6)) (not (_unused _s13)) (not (_unused _s4)) (not (_unused _s25)) (when (and (not (_unused _s1)) (not (_unused _s2)) (not (_unused _s5)) (not (_unused _s7)) (not (_unused _s8)) (not (_unused _s10)) (not (_unused _s11)) (not (_unused _s12)) (not (_unused _s14)) (not (_unused _s15)) (not (_unused _s17)) (not (_unused _s18)) (not (_unused _s19)) (not (_unused _s20)) (not (_unused _s22)) (not (_unused _s23)) (not (_unused _s26)) (not (_unused _s28)) (not (_unused _s29)) (not (_unused _s31)) (not (_unused _s32)) (not (_unused _s34)) (not (_unused _s55)) (not (_unused _s75)) (not (_unused _s95)) (not (_unused _s115)) (not (_unused _s141)) (not (_unused _s151)) (not (_unused _s195)) (not (_unused _s206)) (not (_unused _s249)) (not (_unused _s254)) (not (_unused _s303)) (not (_unused _s307))) (_applicable _p6)))
   )
   (:action a6_move_base
          :parameters (#q8 #q9 #t179)
          :precondition (and (basemotion #q8 #t179 #q9) (atbconf #q8) (canmove) (_applicable _p6))
          :effect (and (atbconf #q9) (not (atbconf #q8)) (not (canmove)) (increase (total-cost) 200) (not (canoperate)) (not (_applicable _p6)) (not (_unused _s25)) (not (_unused _s195)) (not (_unused _s26)) (when (and (not (_unused _s1)) (not (_unused _s2)) (not (_unused _s4)) (not (_unused _s5)) (not (_unused _s7)) (not (_unused _s8)) (not (_unused _s10)) (not (_unused _s11)) (not (_unused _s12)) (not (_unused _s13)) (not (_unused _s14)) (not (_unused _s15)) (not (_unused _s17)) (not (_unused _s18)) (not (_unused _s19)) (not (_unused _s20)) (not (_unused _s22)) (not (_unused _s23)) (not (_unused _s28)) (not (_unused _s29)) (not (_unused _s31)) (not (_unused _s32)) (not (_unused _s34)) (not (_unused _s55)) (not (_unused _s75)) (not (_unused _s95)) (not (_unused _s115)) (not (_unused _s141)) (not (_unused _s151)) (not (_unused _s206)) (not (_unused _s249)) (not (_unused _s254)) (not (_unused _s303)) (not (_unused _s307))) (_applicable _p7)) (not (_unused _s25)) (not (_unused _s195)) (not (_unused _s26)) (when (and (not (_unused _s1)) (not (_unused _s2)) (not (_unused _s4)) (not (_unused _s5)) (not (_unused _s7)) (not (_unused _s8)) (not (_unused _s10)) (not (_unused _s11)) (not (_unused _s12)) (not (_unused _s13)) (not (_unused _s14)) (not (_unused _s15)) (not (_unused _s17)) (not (_unused _s18)) (not (_unused _s19)) (not (_unused _s20)) (not (_unused _s22)) (not (_unused _s23)) (not (_unused _s28)) (not (_unused _s29)) (not (_unused _s31)) (not (_unused _s32)) (not (_unused _s34)) (not (_unused _s55)) (not (_unused _s75)) (not (_unused _s95)) (not (_unused _s115)) (not (_unused _s141)) (not (_unused _s151)) (not (_unused _s206)) (not (_unused _s249)) (not (_unused _s254)) (not (_unused _s303)) (not (_unused _s307))) (_applicable _p7)))
   )
   (:action a7_place
          :parameters ('left' o6 #p5 #g1 #q9 #t10)
          :precondition (and (kin 'left' o6 #p5 #g1 #q9 #t10) (atgrasp 'left' o6 #g1) (atbconf #q9) (_applicable _p7))
          :effect (and (atpose o6 #p5) (handempty 'left') (canmove) (not (atgrasp 'left' o6 #g1)) (increase (total-cost) 100) (canoperate) (not (_applicable _p7)) (not (_unused _s13)) (not (_unused _s26)) (not (_unused _s5)) (when (and (not (_unused _s1)) (not (_unused _s2)) (not (_unused _s4)) (not (_unused _s7)) (not (_unused _s8)) (not (_unused _s10)) (not (_unused _s11)) (not (_unused _s12)) (not (_unused _s14)) (not (_unused _s15)) (not (_unused _s17)) (not (_unused _s18)) (not (_unused _s19)) (not (_unused _s20)) (not (_unused _s22)) (not (_unused _s23)) (not (_unused _s25)) (not (_unused _s28)) (not (_unused _s29)) (not (_unused _s31)) (not (_unused _s32)) (not (_unused _s34)) (not (_unused _s55)) (not (_unused _s75)) (not (_unused _s95)) (not (_unused _s115)) (not (_unused _s141)) (not (_unused _s151)) (not (_unused _s195)) (not (_unused _s206)) (not (_unused _s249)) (not (_unused _s254)) (not (_unused _s303)) (not (_unused _s307))) (_applicable _p8)) (not (_unused _s13)) (not (_unused _s26)) (not (_unused _s5)) (when (and (not (_unused _s1)) (not (_unused _s2)) (not (_unused _s4)) (not (_unused _s7)) (not (_unused _s8)) (not (_unused _s10)) (not (_unused _s11)) (not (_unused _s12)) (not (_unused _s14)) (not (_unused _s15)) (not (_unused _s17)) (not (_unused _s18)) (not (_unused _s19)) (not (_unused _s20)) (not (_unused _s22)) (not (_unused _s23)) (not (_unused _s25)) (not (_unused _s28)) (not (_unused _s29)) (not (_unused _s31)) (not (_unused _s32)) (not (_unused _s34)) (not (_unused _s55)) (not (_unused _s75)) (not (_unused _s95)) (not (_unused _s115)) (not (_unused _s141)) (not (_unused _s151)) (not (_unused _s195)) (not (_unused _s206)) (not (_unused _s249)) (not (_unused _s254)) (not (_unused _s303)) (not (_unused _s307))) (_applicable _p8)))
   )
   (:action a8_cook
          :parameters (o6 o4)
          :precondition (and (stackable o6 o4) (stove o4) (on o6 o4) (cleaned o6) (canoperate) (_applicable _p8))
          :effect (and (cooked o6) (not (cleaned o6)) (increase (total-cost) 50) (not (canoperate)) (not (_applicable _p8)) (when (and (not (_unused _s1)) (not (_unused _s2)) (not (_unused _s4)) (not (_unused _s5)) (not (_unused _s7)) (not (_unused _s8)) (not (_unused _s10)) (not (_unused _s11)) (not (_unused _s12)) (not (_unused _s13)) (not (_unused _s14)) (not (_unused _s15)) (not (_unused _s17)) (not (_unused _s18)) (not (_unused _s19)) (not (_unused _s20)) (not (_unused _s22)) (not (_unused _s23)) (not (_unused _s25)) (not (_unused _s26)) (not (_unused _s28)) (not (_unused _s29)) (not (_unused _s31)) (not (_unused _s32)) (not (_unused _s34)) (not (_unused _s55)) (not (_unused _s75)) (not (_unused _s95)) (not (_unused _s115)) (not (_unused _s141)) (not (_unused _s151)) (not (_unused _s195)) (not (_unused _s206)) (not (_unused _s249)) (not (_unused _s254)) (not (_unused _s303)) (not (_unused _s307))) (_applicable _p9)) (when (and (not (_unused _s1)) (not (_unused _s2)) (not (_unused _s4)) (not (_unused _s5)) (not (_unused _s7)) (not (_unused _s8)) (not (_unused _s10)) (not (_unused _s11)) (not (_unused _s12)) (not (_unused _s13)) (not (_unused _s14)) (not (_unused _s15)) (not (_unused _s17)) (not (_unused _s18)) (not (_unused _s19)) (not (_unused _s20)) (not (_unused _s22)) (not (_unused _s23)) (not (_unused _s25)) (not (_unused _s26)) (not (_unused _s28)) (not (_unused _s29)) (not (_unused _s31)) (not (_unused _s32)) (not (_unused _s34)) (not (_unused _s55)) (not (_unused _s75)) (not (_unused _s95)) (not (_unused _s115)) (not (_unused _s141)) (not (_unused _s151)) (not (_unused _s195)) (not (_unused _s206)) (not (_unused _s249)) (not (_unused _s254)) (not (_unused _s303)) (not (_unused _s307))) (_applicable _p9)))
   )
   (:action a9_move_base
          :parameters (#q9 #q3 #t190)
          :precondition (and (basemotion #q9 #t190 #q3) (atbconf #q9) (canmove) (_applicable _p9))
          :effect (and (atbconf #q3) (not (atbconf #q9)) (not (canmove)) (increase (total-cost) 200) (not (canoperate)) (not (_applicable _p9)) (not (_unused _s206)) (not (_unused _s20)) (not (_unused _s26)) (when (and (not (_unused _s1)) (not (_unused _s2)) (not (_unused _s4)) (not (_unused _s5)) (not (_unused _s7)) (not (_unused _s8)) (not (_unused _s10)) (not (_unused _s11)) (not (_unused _s12)) (not (_unused _s13)) (not (_unused _s14)) (not (_unused _s15)) (not (_unused _s17)) (not (_unused _s18)) (not (_unused _s19)) (not (_unused _s22)) (not (_unused _s23)) (not (_unused _s25)) (not (_unused _s28)) (not (_unused _s29)) (not (_unused _s31)) (not (_unused _s32)) (not (_unused _s34)) (not (_unused _s55)) (not (_unused _s75)) (not (_unused _s95)) (not (_unused _s115)) (not (_unused _s141)) (not (_unused _s151)) (not (_unused _s195)) (not (_unused _s249)) (not (_unused _s254)) (not (_unused _s303)) (not (_unused _s307))) (_applicable _p10)) (not (_unused _s206)) (not (_unused _s20)) (not (_unused _s26)) (when (and (not (_unused _s1)) (not (_unused _s2)) (not (_unused _s4)) (not (_unused _s5)) (not (_unused _s7)) (not (_unused _s8)) (not (_unused _s10)) (not (_unused _s11)) (not (_unused _s12)) (not (_unused _s13)) (not (_unused _s14)) (not (_unused _s15)) (not (_unused _s17)) (not (_unused _s18)) (not (_unused _s19)) (not (_unused _s22)) (not (_unused _s23)) (not (_unused _s25)) (not (_unused _s28)) (not (_unused _s29)) (not (_unused _s31)) (not (_unused _s32)) (not (_unused _s34)) (not (_unused _s55)) (not (_unused _s75)) (not (_unused _s95)) (not (_unused _s115)) (not (_unused _s141)) (not (_unused _s151)) (not (_unused _s195)) (not (_unused _s249)) (not (_unused _s254)) (not (_unused _s303)) (not (_unused _s307))) (_applicable _p10)))
   )
   (:action a10_pick
          :parameters ('left' o8 p840 #g3 #q3 #t4)
          :precondition (and (kin 'left' o8 p840 #g3 #q3 #t4) (atpose o8 p840) (handempty 'left') (atbconf #q3) (_applicable _p10))
          :effect (and (atgrasp 'left' o8 #g3) (canmove) (not (atpose o8 p840)) (not (handempty 'left')) (increase (total-cost) 100) (not (canoperate)) (not (_applicable _p10)) (not (_unused _s20)) (not (_unused _s15)) (when (and (not (_unused _s1)) (not (_unused _s2)) (not (_unused _s4)) (not (_unused _s5)) (not (_unused _s7)) (not (_unused _s8)) (not (_unused _s10)) (not (_unused _s11)) (not (_unused _s12)) (not (_unused _s13)) (not (_unused _s14)) (not (_unused _s17)) (not (_unused _s18)) (not (_unused _s19)) (not (_unused _s22)) (not (_unused _s23)) (not (_unused _s25)) (not (_unused _s26)) (not (_unused _s28)) (not (_unused _s29)) (not (_unused _s31)) (not (_unused _s32)) (not (_unused _s34)) (not (_unused _s55)) (not (_unused _s75)) (not (_unused _s95)) (not (_unused _s115)) (not (_unused _s141)) (not (_unused _s151)) (not (_unused _s195)) (not (_unused _s206)) (not (_unused _s249)) (not (_unused _s254)) (not (_unused _s303)) (not (_unused _s307))) (_applicable _p11)) (not (_unused _s20)) (not (_unused _s15)) (when (and (not (_unused _s1)) (not (_unused _s2)) (not (_unused _s4)) (not (_unused _s5)) (not (_unused _s7)) (not (_unused _s8)) (not (_unused _s10)) (not (_unused _s11)) (not (_unused _s12)) (not (_unused _s13)) (not (_unused _s14)) (not (_unused _s17)) (not (_unused _s18)) (not (_unused _s19)) (not (_unused _s22)) (not (_unused _s23)) (not (_unused _s25)) (not (_unused _s26)) (not (_unused _s28)) (not (_unused _s29)) (not (_unused _s31)) (not (_unused _s32)) (not (_unused _s34)) (not (_unused _s55)) (not (_unused _s75)) (not (_unused _s95)) (not (_unused _s115)) (not (_unused _s141)) (not (_unused _s151)) (not (_unused _s195)) (not (_unused _s206)) (not (_unused _s249)) (not (_unused _s254)) (not (_unused _s303)) (not (_unused _s307))) (_applicable _p11)))
   )
   (:action a11_move_base
          :parameters (#q3 #q14 #t99)
          :precondition (and (basemotion #q3 #t99 #q14) (atbconf #q3) (canmove) (_applicable _p11))
          :effect (and (atbconf #q14) (not (atbconf #q3)) (not (canmove)) (increase (total-cost) 200) (not (canoperate)) (not (_applicable _p11)) (not (_unused _s115)) (not (_unused _s20)) (not (_unused _s31)) (when (and (not (_unused _s1)) (not (_unused _s2)) (not (_unused _s4)) (not (_unused _s5)) (not (_unused _s7)) (not (_unused _s8)) (not (_unused _s10)) (not (_unused _s11)) (not (_unused _s12)) (not (_unused _s13)) (not (_unused _s14)) (not (_unused _s15)) (not (_unused _s17)) (not (_unused _s18)) (not (_unused _s19)) (not (_unused _s22)) (not (_unused _s23)) (not (_unused _s25)) (not (_unused _s26)) (not (_unused _s28)) (not (_unused _s29)) (not (_unused _s32)) (not (_unused _s34)) (not (_unused _s55)) (not (_unused _s75)) (not (_unused _s95)) (not (_unused _s141)) (not (_unused _s151)) (not (_unused _s195)) (not (_unused _s206)) (not (_unused _s249)) (not (_unused _s254)) (not (_unused _s303)) (not (_unused _s307))) (_applicable _p12)) (not (_unused _s115)) (not (_unused _s20)) (not (_unused _s31)) (when (and (not (_unused _s1)) (not (_unused _s2)) (not (_unused _s4)) (not (_unused _s5)) (not (_unused _s7)) (not (_unused _s8)) (not (_unused _s10)) (not (_unused _s11)) (not (_unused _s12)) (not (_unused _s13)) (not (_unused _s14)) (not (_unused _s15)) (not (_unused _s17)) (not (_unused _s18)) (not (_unused _s19)) (not (_unused _s22)) (not (_unused _s23)) (not (_unused _s25)) (not (_unused _s26)) (not (_unused _s28)) (not (_unused _s29)) (not (_unused _s32)) (not (_unused _s34)) (not (_unused _s55)) (not (_unused _s75)) (not (_unused _s95)) (not (_unused _s141)) (not (_unused _s151)) (not (_unused _s195)) (not (_unused _s206)) (not (_unused _s249)) (not (_unused _s254)) (not (_unused _s303)) (not (_unused _s307))) (_applicable _p12)))
   )
   (:action a12_place
          :parameters ('left' o8 #p10 #g3 #q14 #t15)
          :precondition (and (kin 'left' o8 #p10 #g3 #q14 #t15) (atgrasp 'left' o8 #g3) (atbconf #q14) (_applicable _p12))
          :effect (and (atpose o8 #p10) (handempty 'left') (canmove) (not (atgrasp 'left' o8 #g3)) (increase (total-cost) 100) (canoperate) (not (_applicable _p12)) (not (_unused _s15)) (not (_unused _s31)) (not (_unused _s10)) (when (and (not (_unused _s1)) (not (_unused _s2)) (not (_unused _s4)) (not (_unused _s5)) (not (_unused _s7)) (not (_unused _s8)) (not (_unused _s11)) (not (_unused _s12)) (not (_unused _s13)) (not (_unused _s14)) (not (_unused _s17)) (not (_unused _s18)) (not (_unused _s19)) (not (_unused _s20)) (not (_unused _s22)) (not (_unused _s23)) (not (_unused _s25)) (not (_unused _s26)) (not (_unused _s28)) (not (_unused _s29)) (not (_unused _s32)) (not (_unused _s34)) (not (_unused _s55)) (not (_unused _s75)) (not (_unused _s95)) (not (_unused _s115)) (not (_unused _s141)) (not (_unused _s151)) (not (_unused _s195)) (not (_unused _s206)) (not (_unused _s249)) (not (_unused _s254)) (not (_unused _s303)) (not (_unused _s307))) (_applicable _p13)) (not (_unused _s15)) (not (_unused _s31)) (not (_unused _s10)) (when (and (not (_unused _s1)) (not (_unused _s2)) (not (_unused _s4)) (not (_unused _s5)) (not (_unused _s7)) (not (_unused _s8)) (not (_unused _s11)) (not (_unused _s12)) (not (_unused _s13)) (not (_unused _s14)) (not (_unused _s17)) (not (_unused _s18)) (not (_unused _s19)) (not (_unused _s20)) (not (_unused _s22)) (not (_unused _s23)) (not (_unused _s25)) (not (_unused _s26)) (not (_unused _s28)) (not (_unused _s29)) (not (_unused _s32)) (not (_unused _s34)) (not (_unused _s55)) (not (_unused _s75)) (not (_unused _s95)) (not (_unused _s115)) (not (_unused _s141)) (not (_unused _s151)) (not (_unused _s195)) (not (_unused _s206)) (not (_unused _s249)) (not (_unused _s254)) (not (_unused _s303)) (not (_unused _s307))) (_applicable _p13)))
   )
   (:action a13_clean
          :parameters (o8 o3)
          :precondition (and (stackable o8 o3) (sink o3) (on o8 o3) (canoperate) (_applicable _p13))
          :effect (and (cleaned o8) (increase (total-cost) 50) (not (canoperate)) (not (_applicable _p13)) (when (and (not (_unused _s1)) (not (_unused _s2)) (not (_unused _s4)) (not (_unused _s5)) (not (_unused _s7)) (not (_unused _s8)) (not (_unused _s10)) (not (_unused _s11)) (not (_unused _s12)) (not (_unused _s13)) (not (_unused _s14)) (not (_unused _s15)) (not (_unused _s17)) (not (_unused _s18)) (not (_unused _s19)) (not (_unused _s20)) (not (_unused _s22)) (not (_unused _s23)) (not (_unused _s25)) (not (_unused _s26)) (not (_unused _s28)) (not (_unused _s29)) (not (_unused _s31)) (not (_unused _s32)) (not (_unused _s34)) (not (_unused _s55)) (not (_unused _s75)) (not (_unused _s95)) (not (_unused _s115)) (not (_unused _s141)) (not (_unused _s151)) (not (_unused _s195)) (not (_unused _s206)) (not (_unused _s249)) (not (_unused _s254)) (not (_unused _s303)) (not (_unused _s307))) (_applicable _p14)) (when (and (not (_unused _s1)) (not (_unused _s2)) (not (_unused _s4)) (not (_unused _s5)) (not (_unused _s7)) (not (_unused _s8)) (not (_unused _s10)) (not (_unused _s11)) (not (_unused _s12)) (not (_unused _s13)) (not (_unused _s14)) (not (_unused _s15)) (not (_unused _s17)) (not (_unused _s18)) (not (_unused _s19)) (not (_unused _s20)) (not (_unused _s22)) (not (_unused _s23)) (not (_unused _s25)) (not (_unused _s26)) (not (_unused _s28)) (not (_unused _s29)) (not (_unused _s31)) (not (_unused _s32)) (not (_unused _s34)) (not (_unused _s55)) (not (_unused _s75)) (not (_unused _s95)) (not (_unused _s115)) (not (_unused _s141)) (not (_unused _s151)) (not (_unused _s195)) (not (_unused _s206)) (not (_unused _s249)) (not (_unused _s254)) (not (_unused _s303)) (not (_unused _s307))) (_applicable _p14)))
   )
   (:action a14_pick
          :parameters ('left' o8 #p10 #g3 #q14 #t15)
          :precondition (and (kin 'left' o8 #p10 #g3 #q14 #t15) (atpose o8 #p10) (handempty 'left') (atbconf #q14) (_applicable _p14))
          :effect (and (atgrasp 'left' o8 #g3) (canmove) (not (atpose o8 #p10)) (not (handempty 'left')) (increase (total-cost) 100) (not (canoperate)) (not (_applicable _p14)) (not (_unused _s15)) (not (_unused _s31)) (not (_unused _s10)) (when (and (not (_unused _s1)) (not (_unused _s2)) (not (_unused _s4)) (not (_unused _s5)) (not (_unused _s7)) (not (_unused _s8)) (not (_unused _s11)) (not (_unused _s12)) (not (_unused _s13)) (not (_unused _s14)) (not (_unused _s17)) (not (_unused _s18)) (not (_unused _s19)) (not (_unused _s20)) (not (_unused _s22)) (not (_unused _s23)) (not (_unused _s25)) (not (_unused _s26)) (not (_unused _s28)) (not (_unused _s29)) (not (_unused _s32)) (not (_unused _s34)) (not (_unused _s55)) (not (_unused _s75)) (not (_unused _s95)) (not (_unused _s115)) (not (_unused _s141)) (not (_unused _s151)) (not (_unused _s195)) (not (_unused _s206)) (not (_unused _s249)) (not (_unused _s254)) (not (_unused _s303)) (not (_unused _s307))) (_applicable _p15)) (not (_unused _s15)) (not (_unused _s31)) (not (_unused _s10)) (when (and (not (_unused _s1)) (not (_unused _s2)) (not (_unused _s4)) (not (_unused _s5)) (not (_unused _s7)) (not (_unused _s8)) (not (_unused _s11)) (not (_unused _s12)) (not (_unused _s13)) (not (_unused _s14)) (not (_unused _s17)) (not (_unused _s18)) (not (_unused _s19)) (not (_unused _s20)) (not (_unused _s22)) (not (_unused _s23)) (not (_unused _s25)) (not (_unused _s26)) (not (_unused _s28)) (not (_unused _s29)) (not (_unused _s32)) (not (_unused _s34)) (not (_unused _s55)) (not (_unused _s75)) (not (_unused _s95)) (not (_unused _s115)) (not (_unused _s141)) (not (_unused _s151)) (not (_unused _s195)) (not (_unused _s206)) (not (_unused _s249)) (not (_unused _s254)) (not (_unused _s303)) (not (_unused _s307))) (_applicable _p15)))
   )
   (:action a15_move_base
          :parameters (#q14 #q15 #t287)
          :precondition (and (basemotion #q14 #t287 #q15) (atbconf #q14) (canmove) (_applicable _p15))
          :effect (and (atbconf #q15) (not (atbconf #q14)) (not (canmove)) (increase (total-cost) 200) (not (canoperate)) (not (_applicable _p15)) (not (_unused _s32)) (not (_unused _s303)) (not (_unused _s31)) (when (and (not (_unused _s1)) (not (_unused _s2)) (not (_unused _s4)) (not (_unused _s5)) (not (_unused _s7)) (not (_unused _s8)) (not (_unused _s10)) (not (_unused _s11)) (not (_unused _s12)) (not (_unused _s13)) (not (_unused _s14)) (not (_unused _s15)) (not (_unused _s17)) (not (_unused _s18)) (not (_unused _s19)) (not (_unused _s20)) (not (_unused _s22)) (not (_unused _s23)) (not (_unused _s25)) (not (_unused _s26)) (not (_unused _s28)) (not (_unused _s29)) (not (_unused _s34)) (not (_unused _s55)) (not (_unused _s75)) (not (_unused _s95)) (not (_unused _s115)) (not (_unused _s141)) (not (_unused _s151)) (not (_unused _s195)) (not (_unused _s206)) (not (_unused _s249)) (not (_unused _s254)) (not (_unused _s307))) (_applicable _p16)) (not (_unused _s32)) (not (_unused _s303)) (not (_unused _s31)) (when (and (not (_unused _s1)) (not (_unused _s2)) (not (_unused _s4)) (not (_unused _s5)) (not (_unused _s7)) (not (_unused _s8)) (not (_unused _s10)) (not (_unused _s11)) (not (_unused _s12)) (not (_unused _s13)) (not (_unused _s14)) (not (_unused _s15)) (not (_unused _s17)) (not (_unused _s18)) (not (_unused _s19)) (not (_unused _s20)) (not (_unused _s22)) (not (_unused _s23)) (not (_unused _s25)) (not (_unused _s26)) (not (_unused _s28)) (not (_unused _s29)) (not (_unused _s34)) (not (_unused _s55)) (not (_unused _s75)) (not (_unused _s95)) (not (_unused _s115)) (not (_unused _s141)) (not (_unused _s151)) (not (_unused _s195)) (not (_unused _s206)) (not (_unused _s249)) (not (_unused _s254)) (not (_unused _s307))) (_applicable _p16)))
   )
   (:action a16_place
          :parameters ('left' o8 #p11 #g3 #q15 #t16)
          :precondition (and (kin 'left' o8 #p11 #g3 #q15 #t16) (atgrasp 'left' o8 #g3) (atbconf #q15) (_applicable _p16))
          :effect (and (atpose o8 #p11) (handempty 'left') (canmove) (not (atgrasp 'left' o8 #g3)) (increase (total-cost) 100) (canoperate) (not (_applicable _p16)) (not (_unused _s15)) (not (_unused _s32)) (not (_unused _s11)) (when (and (not (_unused _s1)) (not (_unused _s2)) (not (_unused _s4)) (not (_unused _s5)) (not (_unused _s7)) (not (_unused _s8)) (not (_unused _s10)) (not (_unused _s12)) (not (_unused _s13)) (not (_unused _s14)) (not (_unused _s17)) (not (_unused _s18)) (not (_unused _s19)) (not (_unused _s20)) (not (_unused _s22)) (not (_unused _s23)) (not (_unused _s25)) (not (_unused _s26)) (not (_unused _s28)) (not (_unused _s29)) (not (_unused _s31)) (not (_unused _s34)) (not (_unused _s55)) (not (_unused _s75)) (not (_unused _s95)) (not (_unused _s115)) (not (_unused _s141)) (not (_unused _s151)) (not (_unused _s195)) (not (_unused _s206)) (not (_unused _s249)) (not (_unused _s254)) (not (_unused _s303)) (not (_unused _s307))) (_applicable _p17)) (not (_unused _s15)) (not (_unused _s32)) (not (_unused _s11)) (when (and (not (_unused _s1)) (not (_unused _s2)) (not (_unused _s4)) (not (_unused _s5)) (not (_unused _s7)) (not (_unused _s8)) (not (_unused _s10)) (not (_unused _s12)) (not (_unused _s13)) (not (_unused _s14)) (not (_unused _s17)) (not (_unused _s18)) (not (_unused _s19)) (not (_unused _s20)) (not (_unused _s22)) (not (_unused _s23)) (not (_unused _s25)) (not (_unused _s26)) (not (_unused _s28)) (not (_unused _s29)) (not (_unused _s31)) (not (_unused _s34)) (not (_unused _s55)) (not (_unused _s75)) (not (_unused _s95)) (not (_unused _s115)) (not (_unused _s141)) (not (_unused _s151)) (not (_unused _s195)) (not (_unused _s206)) (not (_unused _s249)) (not (_unused _s254)) (not (_unused _s303)) (not (_unused _s307))) (_applicable _p17)))
   )
   (:action a17_cook
          :parameters (o8 o4)
          :precondition (and (stackable o8 o4) (stove o4) (on o8 o4) (cleaned o8) (canoperate) (_applicable _p17))
          :effect (and (cooked o8) (not (cleaned o8)) (increase (total-cost) 50) (not (canoperate)) (not (_applicable _p17)) (when (and (not (_unused _s1)) (not (_unused _s2)) (not (_unused _s4)) (not (_unused _s5)) (not (_unused _s7)) (not (_unused _s8)) (not (_unused _s10)) (not (_unused _s11)) (not (_unused _s12)) (not (_unused _s13)) (not (_unused _s14)) (not (_unused _s15)) (not (_unused _s17)) (not (_unused _s18)) (not (_unused _s19)) (not (_unused _s20)) (not (_unused _s22)) (not (_unused _s23)) (not (_unused _s25)) (not (_unused _s26)) (not (_unused _s28)) (not (_unused _s29)) (not (_unused _s31)) (not (_unused _s32)) (not (_unused _s34)) (not (_unused _s55)) (not (_unused _s75)) (not (_unused _s95)) (not (_unused _s115)) (not (_unused _s141)) (not (_unused _s151)) (not (_unused _s195)) (not (_unused _s206)) (not (_unused _s249)) (not (_unused _s254)) (not (_unused _s303)) (not (_unused _s307))) (_applicable _p18)) (when (and (not (_unused _s1)) (not (_unused _s2)) (not (_unused _s4)) (not (_unused _s5)) (not (_unused _s7)) (not (_unused _s8)) (not (_unused _s10)) (not (_unused _s11)) (not (_unused _s12)) (not (_unused _s13)) (not (_unused _s14)) (not (_unused _s15)) (not (_unused _s17)) (not (_unused _s18)) (not (_unused _s19)) (not (_unused _s20)) (not (_unused _s22)) (not (_unused _s23)) (not (_unused _s25)) (not (_unused _s26)) (not (_unused _s28)) (not (_unused _s29)) (not (_unused _s31)) (not (_unused _s32)) (not (_unused _s34)) (not (_unused _s55)) (not (_unused _s75)) (not (_unused _s95)) (not (_unused _s115)) (not (_unused _s141)) (not (_unused _s151)) (not (_unused _s195)) (not (_unused _s206)) (not (_unused _s249)) (not (_unused _s254)) (not (_unused _s303)) (not (_unused _s307))) (_applicable _p18)))
   )
   (:action a18_move_base
          :parameters (#q15 #q2 #t291)
          :precondition (and (basemotion #q15 #t291 #q2) (atbconf #q15) (canmove) (_applicable _p18))
          :effect (and (atbconf #q2) (not (atbconf #q15)) (not (canmove)) (increase (total-cost) 200) (not (canoperate)) (not (_applicable _p18)) (not (_unused _s19)) (not (_unused _s307)) (not (_unused _s32)) (when (and (not (_unused _s1)) (not (_unused _s2)) (not (_unused _s4)) (not (_unused _s5)) (not (_unused _s7)) (not (_unused _s8)) (not (_unused _s10)) (not (_unused _s11)) (not (_unused _s12)) (not (_unused _s13)) (not (_unused _s14)) (not (_unused _s15)) (not (_unused _s17)) (not (_unused _s18)) (not (_unused _s20)) (not (_unused _s22)) (not (_unused _s23)) (not (_unused _s25)) (not (_unused _s26)) (not (_unused _s28)) (not (_unused _s29)) (not (_unused _s31)) (not (_unused _s34)) (not (_unused _s55)) (not (_unused _s75)) (not (_unused _s95)) (not (_unused _s115)) (not (_unused _s141)) (not (_unused _s151)) (not (_unused _s195)) (not (_unused _s206)) (not (_unused _s249)) (not (_unused _s254)) (not (_unused _s303))) (_applicable _p19)) (not (_unused _s19)) (not (_unused _s307)) (not (_unused _s32)) (when (and (not (_unused _s1)) (not (_unused _s2)) (not (_unused _s4)) (not (_unused _s5)) (not (_unused _s7)) (not (_unused _s8)) (not (_unused _s10)) (not (_unused _s11)) (not (_unused _s12)) (not (_unused _s13)) (not (_unused _s14)) (not (_unused _s15)) (not (_unused _s17)) (not (_unused _s18)) (not (_unused _s20)) (not (_unused _s22)) (not (_unused _s23)) (not (_unused _s25)) (not (_unused _s26)) (not (_unused _s28)) (not (_unused _s29)) (not (_unused _s31)) (not (_unused _s34)) (not (_unused _s55)) (not (_unused _s75)) (not (_unused _s95)) (not (_unused _s115)) (not (_unused _s141)) (not (_unused _s151)) (not (_unused _s195)) (not (_unused _s206)) (not (_unused _s249)) (not (_unused _s254)) (not (_unused _s303))) (_applicable _p19)))
   )
   (:action a19_pick
          :parameters ('left' o7 p744 #g2 #q2 #t3)
          :precondition (and (kin 'left' o7 p744 #g2 #q2 #t3) (atpose o7 p744) (handempty 'left') (atbconf #q2) (_applicable _p19))
          :effect (and (atgrasp 'left' o7 #g2) (canmove) (not (atpose o7 p744)) (not (handempty 'left')) (increase (total-cost) 100) (not (canoperate)) (not (_applicable _p19)) (not (_unused _s19)) (not (_unused _s14)) (when (and (not (_unused _s1)) (not (_unused _s2)) (not (_unused _s4)) (not (_unused _s5)) (not (_unused _s7)) (not (_unused _s8)) (not (_unused _s10)) (not (_unused _s11)) (not (_unused _s12)) (not (_unused _s13)) (not (_unused _s15)) (not (_unused _s17)) (not (_unused _s18)) (not (_unused _s20)) (not (_unused _s22)) (not (_unused _s23)) (not (_unused _s25)) (not (_unused _s26)) (not (_unused _s28)) (not (_unused _s29)) (not (_unused _s31)) (not (_unused _s32)) (not (_unused _s34)) (not (_unused _s55)) (not (_unused _s75)) (not (_unused _s95)) (not (_unused _s115)) (not (_unused _s141)) (not (_unused _s151)) (not (_unused _s195)) (not (_unused _s206)) (not (_unused _s249)) (not (_unused _s254)) (not (_unused _s303)) (not (_unused _s307))) (_applicable _p20)) (not (_unused _s19)) (not (_unused _s14)) (when (and (not (_unused _s1)) (not (_unused _s2)) (not (_unused _s4)) (not (_unused _s5)) (not (_unused _s7)) (not (_unused _s8)) (not (_unused _s10)) (not (_unused _s11)) (not (_unused _s12)) (not (_unused _s13)) (not (_unused _s15)) (not (_unused _s17)) (not (_unused _s18)) (not (_unused _s20)) (not (_unused _s22)) (not (_unused _s23)) (not (_unused _s25)) (not (_unused _s26)) (not (_unused _s28)) (not (_unused _s29)) (not (_unused _s31)) (not (_unused _s32)) (not (_unused _s34)) (not (_unused _s55)) (not (_unused _s75)) (not (_unused _s95)) (not (_unused _s115)) (not (_unused _s141)) (not (_unused _s151)) (not (_unused _s195)) (not (_unused _s206)) (not (_unused _s249)) (not (_unused _s254)) (not (_unused _s303)) (not (_unused _s307))) (_applicable _p20)))
   )
   (:action a20_move_base
          :parameters (#q2 #q11 #t79)
          :precondition (and (basemotion #q2 #t79 #q11) (atbconf #q2) (canmove) (_applicable _p20))
          :effect (and (atbconf #q11) (not (atbconf #q2)) (not (canmove)) (increase (total-cost) 200) (not (canoperate)) (not (_applicable _p20)) (not (_unused _s19)) (not (_unused _s28)) (not (_unused _s95)) (when (and (not (_unused _s1)) (not (_unused _s2)) (not (_unused _s4)) (not (_unused _s5)) (not (_unused _s7)) (not (_unused _s8)) (not (_unused _s10)) (not (_unused _s11)) (not (_unused _s12)) (not (_unused _s13)) (not (_unused _s14)) (not (_unused _s15)) (not (_unused _s17)) (not (_unused _s18)) (not (_unused _s20)) (not (_unused _s22)) (not (_unused _s23)) (not (_unused _s25)) (not (_unused _s26)) (not (_unused _s29)) (not (_unused _s31)) (not (_unused _s32)) (not (_unused _s34)) (not (_unused _s55)) (not (_unused _s75)) (not (_unused _s115)) (not (_unused _s141)) (not (_unused _s151)) (not (_unused _s195)) (not (_unused _s206)) (not (_unused _s249)) (not (_unused _s254)) (not (_unused _s303)) (not (_unused _s307))) (_applicable _p21)) (not (_unused _s19)) (not (_unused _s28)) (not (_unused _s95)) (when (and (not (_unused _s1)) (not (_unused _s2)) (not (_unused _s4)) (not (_unused _s5)) (not (_unused _s7)) (not (_unused _s8)) (not (_unused _s10)) (not (_unused _s11)) (not (_unused _s12)) (not (_unused _s13)) (not (_unused _s14)) (not (_unused _s15)) (not (_unused _s17)) (not (_unused _s18)) (not (_unused _s20)) (not (_unused _s22)) (not (_unused _s23)) (not (_unused _s25)) (not (_unused _s26)) (not (_unused _s29)) (not (_unused _s31)) (not (_unused _s32)) (not (_unused _s34)) (not (_unused _s55)) (not (_unused _s75)) (not (_unused _s115)) (not (_unused _s141)) (not (_unused _s151)) (not (_unused _s195)) (not (_unused _s206)) (not (_unused _s249)) (not (_unused _s254)) (not (_unused _s303)) (not (_unused _s307))) (_applicable _p21)))
   )
   (:action a21_place
          :parameters ('left' o7 #p7 #g2 #q11 #t12)
          :precondition (and (kin 'left' o7 #p7 #g2 #q11 #t12) (atgrasp 'left' o7 #g2) (atbconf #q11) (_applicable _p21))
          :effect (and (atpose o7 #p7) (handempty 'left') (canmove) (not (atgrasp 'left' o7 #g2)) (increase (total-cost) 100) (canoperate) (not (_applicable _p21)) (not (_unused _s28)) (not (_unused _s14)) (not (_unused _s7)) (when (and (not (_unused _s1)) (not (_unused _s2)) (not (_unused _s4)) (not (_unused _s5)) (not (_unused _s8)) (not (_unused _s10)) (not (_unused _s11)) (not (_unused _s12)) (not (_unused _s13)) (not (_unused _s15)) (not (_unused _s17)) (not (_unused _s18)) (not (_unused _s19)) (not (_unused _s20)) (not (_unused _s22)) (not (_unused _s23)) (not (_unused _s25)) (not (_unused _s26)) (not (_unused _s29)) (not (_unused _s31)) (not (_unused _s32)) (not (_unused _s34)) (not (_unused _s55)) (not (_unused _s75)) (not (_unused _s95)) (not (_unused _s115)) (not (_unused _s141)) (not (_unused _s151)) (not (_unused _s195)) (not (_unused _s206)) (not (_unused _s249)) (not (_unused _s254)) (not (_unused _s303)) (not (_unused _s307))) (_applicable _p22)) (not (_unused _s28)) (not (_unused _s14)) (not (_unused _s7)) (when (and (not (_unused _s1)) (not (_unused _s2)) (not (_unused _s4)) (not (_unused _s5)) (not (_unused _s8)) (not (_unused _s10)) (not (_unused _s11)) (not (_unused _s12)) (not (_unused _s13)) (not (_unused _s15)) (not (_unused _s17)) (not (_unused _s18)) (not (_unused _s19)) (not (_unused _s20)) (not (_unused _s22)) (not (_unused _s23)) (not (_unused _s25)) (not (_unused _s26)) (not (_unused _s29)) (not (_unused _s31)) (not (_unused _s32)) (not (_unused _s34)) (not (_unused _s55)) (not (_unused _s75)) (not (_unused _s95)) (not (_unused _s115)) (not (_unused _s141)) (not (_unused _s151)) (not (_unused _s195)) (not (_unused _s206)) (not (_unused _s249)) (not (_unused _s254)) (not (_unused _s303)) (not (_unused _s307))) (_applicable _p22)))
   )
   (:action a22_clean
          :parameters (o7 o3)
          :precondition (and (stackable o7 o3) (sink o3) (on o7 o3) (canoperate) (_applicable _p22))
          :effect (and (cleaned o7) (increase (total-cost) 50) (not (canoperate)) (not (_applicable _p22)) (when (and (not (_unused _s1)) (not (_unused _s2)) (not (_unused _s4)) (not (_unused _s5)) (not (_unused _s7)) (not (_unused _s8)) (not (_unused _s10)) (not (_unused _s11)) (not (_unused _s12)) (not (_unused _s13)) (not (_unused _s14)) (not (_unused _s15)) (not (_unused _s17)) (not (_unused _s18)) (not (_unused _s19)) (not (_unused _s20)) (not (_unused _s22)) (not (_unused _s23)) (not (_unused _s25)) (not (_unused _s26)) (not (_unused _s28)) (not (_unused _s29)) (not (_unused _s31)) (not (_unused _s32)) (not (_unused _s34)) (not (_unused _s55)) (not (_unused _s75)) (not (_unused _s95)) (not (_unused _s115)) (not (_unused _s141)) (not (_unused _s151)) (not (_unused _s195)) (not (_unused _s206)) (not (_unused _s249)) (not (_unused _s254)) (not (_unused _s303)) (not (_unused _s307))) (_applicable _p23)) (when (and (not (_unused _s1)) (not (_unused _s2)) (not (_unused _s4)) (not (_unused _s5)) (not (_unused _s7)) (not (_unused _s8)) (not (_unused _s10)) (not (_unused _s11)) (not (_unused _s12)) (not (_unused _s13)) (not (_unused _s14)) (not (_unused _s15)) (not (_unused _s17)) (not (_unused _s18)) (not (_unused _s19)) (not (_unused _s20)) (not (_unused _s22)) (not (_unused _s23)) (not (_unused _s25)) (not (_unused _s26)) (not (_unused _s28)) (not (_unused _s29)) (not (_unused _s31)) (not (_unused _s32)) (not (_unused _s34)) (not (_unused _s55)) (not (_unused _s75)) (not (_unused _s95)) (not (_unused _s115)) (not (_unused _s141)) (not (_unused _s151)) (not (_unused _s195)) (not (_unused _s206)) (not (_unused _s249)) (not (_unused _s254)) (not (_unused _s303)) (not (_unused _s307))) (_applicable _p23)))
   )
   (:action a23_pick
          :parameters ('left' o7 #p7 #g2 #q11 #t12)
          :precondition (and (kin 'left' o7 #p7 #g2 #q11 #t12) (atpose o7 #p7) (handempty 'left') (atbconf #q11) (_applicable _p23))
          :effect (and (atgrasp 'left' o7 #g2) (canmove) (not (atpose o7 #p7)) (not (handempty 'left')) (increase (total-cost) 100) (not (canoperate)) (not (_applicable _p23)) (not (_unused _s28)) (not (_unused _s14)) (not (_unused _s7)) (when (and (not (_unused _s1)) (not (_unused _s2)) (not (_unused _s4)) (not (_unused _s5)) (not (_unused _s8)) (not (_unused _s10)) (not (_unused _s11)) (not (_unused _s12)) (not (_unused _s13)) (not (_unused _s15)) (not (_unused _s17)) (not (_unused _s18)) (not (_unused _s19)) (not (_unused _s20)) (not (_unused _s22)) (not (_unused _s23)) (not (_unused _s25)) (not (_unused _s26)) (not (_unused _s29)) (not (_unused _s31)) (not (_unused _s32)) (not (_unused _s34)) (not (_unused _s55)) (not (_unused _s75)) (not (_unused _s95)) (not (_unused _s115)) (not (_unused _s141)) (not (_unused _s151)) (not (_unused _s195)) (not (_unused _s206)) (not (_unused _s249)) (not (_unused _s254)) (not (_unused _s303)) (not (_unused _s307))) (_applicable _p24)) (not (_unused _s28)) (not (_unused _s14)) (not (_unused _s7)) (when (and (not (_unused _s1)) (not (_unused _s2)) (not (_unused _s4)) (not (_unused _s5)) (not (_unused _s8)) (not (_unused _s10)) (not (_unused _s11)) (not (_unused _s12)) (not (_unused _s13)) (not (_unused _s15)) (not (_unused _s17)) (not (_unused _s18)) (not (_unused _s19)) (not (_unused _s20)) (not (_unused _s22)) (not (_unused _s23)) (not (_unused _s25)) (not (_unused _s26)) (not (_unused _s29)) (not (_unused _s31)) (not (_unused _s32)) (not (_unused _s34)) (not (_unused _s55)) (not (_unused _s75)) (not (_unused _s95)) (not (_unused _s115)) (not (_unused _s141)) (not (_unused _s151)) (not (_unused _s195)) (not (_unused _s206)) (not (_unused _s249)) (not (_unused _s254)) (not (_unused _s303)) (not (_unused _s307))) (_applicable _p24)))
   )
   (:action a24_move_base
          :parameters (#q11 #q12 #t233)
          :precondition (and (basemotion #q11 #t233 #q12) (atbconf #q11) (canmove) (_applicable _p24))
          :effect (and (atbconf #q12) (not (atbconf #q11)) (not (canmove)) (increase (total-cost) 200) (not (canoperate)) (not (_applicable _p24)) (not (_unused _s249)) (not (_unused _s29)) (not (_unused _s28)) (when (and (not (_unused _s1)) (not (_unused _s2)) (not (_unused _s4)) (not (_unused _s5)) (not (_unused _s7)) (not (_unused _s8)) (not (_unused _s10)) (not (_unused _s11)) (not (_unused _s12)) (not (_unused _s13)) (not (_unused _s14)) (not (_unused _s15)) (not (_unused _s17)) (not (_unused _s18)) (not (_unused _s19)) (not (_unused _s20)) (not (_unused _s22)) (not (_unused _s23)) (not (_unused _s25)) (not (_unused _s26)) (not (_unused _s31)) (not (_unused _s32)) (not (_unused _s34)) (not (_unused _s55)) (not (_unused _s75)) (not (_unused _s95)) (not (_unused _s115)) (not (_unused _s141)) (not (_unused _s151)) (not (_unused _s195)) (not (_unused _s206)) (not (_unused _s254)) (not (_unused _s303)) (not (_unused _s307))) (_applicable _p25)) (not (_unused _s249)) (not (_unused _s29)) (not (_unused _s28)) (when (and (not (_unused _s1)) (not (_unused _s2)) (not (_unused _s4)) (not (_unused _s5)) (not (_unused _s7)) (not (_unused _s8)) (not (_unused _s10)) (not (_unused _s11)) (not (_unused _s12)) (not (_unused _s13)) (not (_unused _s14)) (not (_unused _s15)) (not (_unused _s17)) (not (_unused _s18)) (not (_unused _s19)) (not (_unused _s20)) (not (_unused _s22)) (not (_unused _s23)) (not (_unused _s25)) (not (_unused _s26)) (not (_unused _s31)) (not (_unused _s32)) (not (_unused _s34)) (not (_unused _s55)) (not (_unused _s75)) (not (_unused _s95)) (not (_unused _s115)) (not (_unused _s141)) (not (_unused _s151)) (not (_unused _s195)) (not (_unused _s206)) (not (_unused _s254)) (not (_unused _s303)) (not (_unused _s307))) (_applicable _p25)))
   )
   (:action a25_place
          :parameters ('left' o7 #p8 #g2 #q12 #t13)
          :precondition (and (kin 'left' o7 #p8 #g2 #q12 #t13) (atgrasp 'left' o7 #g2) (atbconf #q12) (_applicable _p25))
          :effect (and (atpose o7 #p8) (handempty 'left') (canmove) (not (atgrasp 'left' o7 #g2)) (increase (total-cost) 100) (canoperate) (not (_applicable _p25)) (not (_unused _s8)) (not (_unused _s29)) (not (_unused _s14)) (when (and (not (_unused _s1)) (not (_unused _s2)) (not (_unused _s4)) (not (_unused _s5)) (not (_unused _s7)) (not (_unused _s10)) (not (_unused _s11)) (not (_unused _s12)) (not (_unused _s13)) (not (_unused _s15)) (not (_unused _s17)) (not (_unused _s18)) (not (_unused _s19)) (not (_unused _s20)) (not (_unused _s22)) (not (_unused _s23)) (not (_unused _s25)) (not (_unused _s26)) (not (_unused _s28)) (not (_unused _s31)) (not (_unused _s32)) (not (_unused _s34)) (not (_unused _s55)) (not (_unused _s75)) (not (_unused _s95)) (not (_unused _s115)) (not (_unused _s141)) (not (_unused _s151)) (not (_unused _s195)) (not (_unused _s206)) (not (_unused _s249)) (not (_unused _s254)) (not (_unused _s303)) (not (_unused _s307))) (_applicable _p26)) (not (_unused _s8)) (not (_unused _s29)) (not (_unused _s14)) (when (and (not (_unused _s1)) (not (_unused _s2)) (not (_unused _s4)) (not (_unused _s5)) (not (_unused _s7)) (not (_unused _s10)) (not (_unused _s11)) (not (_unused _s12)) (not (_unused _s13)) (not (_unused _s15)) (not (_unused _s17)) (not (_unused _s18)) (not (_unused _s19)) (not (_unused _s20)) (not (_unused _s22)) (not (_unused _s23)) (not (_unused _s25)) (not (_unused _s26)) (not (_unused _s28)) (not (_unused _s31)) (not (_unused _s32)) (not (_unused _s34)) (not (_unused _s55)) (not (_unused _s75)) (not (_unused _s95)) (not (_unused _s115)) (not (_unused _s141)) (not (_unused _s151)) (not (_unused _s195)) (not (_unused _s206)) (not (_unused _s249)) (not (_unused _s254)) (not (_unused _s303)) (not (_unused _s307))) (_applicable _p26)))
   )
   (:action a26_cook
          :parameters (o7 o4)
          :precondition (and (stackable o7 o4) (stove o4) (on o7 o4) (cleaned o7) (canoperate) (_applicable _p26))
          :effect (and (cooked o7) (not (cleaned o7)) (increase (total-cost) 50) (not (canoperate)) (not (_applicable _p26)) (when (and (not (_unused _s1)) (not (_unused _s2)) (not (_unused _s4)) (not (_unused _s5)) (not (_unused _s7)) (not (_unused _s8)) (not (_unused _s10)) (not (_unused _s11)) (not (_unused _s12)) (not (_unused _s13)) (not (_unused _s14)) (not (_unused _s15)) (not (_unused _s17)) (not (_unused _s18)) (not (_unused _s19)) (not (_unused _s20)) (not (_unused _s22)) (not (_unused _s23)) (not (_unused _s25)) (not (_unused _s26)) (not (_unused _s28)) (not (_unused _s29)) (not (_unused _s31)) (not (_unused _s32)) (not (_unused _s34)) (not (_unused _s55)) (not (_unused _s75)) (not (_unused _s95)) (not (_unused _s115)) (not (_unused _s141)) (not (_unused _s151)) (not (_unused _s195)) (not (_unused _s206)) (not (_unused _s249)) (not (_unused _s254)) (not (_unused _s303)) (not (_unused _s307))) (_applicable _p27)) (when (and (not (_unused _s1)) (not (_unused _s2)) (not (_unused _s4)) (not (_unused _s5)) (not (_unused _s7)) (not (_unused _s8)) (not (_unused _s10)) (not (_unused _s11)) (not (_unused _s12)) (not (_unused _s13)) (not (_unused _s14)) (not (_unused _s15)) (not (_unused _s17)) (not (_unused _s18)) (not (_unused _s19)) (not (_unused _s20)) (not (_unused _s22)) (not (_unused _s23)) (not (_unused _s25)) (not (_unused _s26)) (not (_unused _s28)) (not (_unused _s29)) (not (_unused _s31)) (not (_unused _s32)) (not (_unused _s34)) (not (_unused _s55)) (not (_unused _s75)) (not (_unused _s95)) (not (_unused _s115)) (not (_unused _s141)) (not (_unused _s151)) (not (_unused _s195)) (not (_unused _s206)) (not (_unused _s249)) (not (_unused _s254)) (not (_unused _s303)) (not (_unused _s307))) (_applicable _p27)))
   )
   (:action a27_move_base
          :parameters (#q12 #q0 #t238)
          :precondition (and (basemotion #q12 #t238 #q0) (atbconf #q12) (canmove) (_applicable _p27))
          :effect (and (atbconf #q0) (not (atbconf #q12)) (not (canmove)) (increase (total-cost) 200) (not (canoperate)) (not (_applicable _p27)) (not (_unused _s254)) (not (_unused _s29)) (not (_unused _s17)) (when (and (not (_unused _s1)) (not (_unused _s2)) (not (_unused _s4)) (not (_unused _s5)) (not (_unused _s7)) (not (_unused _s8)) (not (_unused _s10)) (not (_unused _s11)) (not (_unused _s12)) (not (_unused _s13)) (not (_unused _s14)) (not (_unused _s15)) (not (_unused _s18)) (not (_unused _s19)) (not (_unused _s20)) (not (_unused _s22)) (not (_unused _s23)) (not (_unused _s25)) (not (_unused _s26)) (not (_unused _s28)) (not (_unused _s31)) (not (_unused _s32)) (not (_unused _s34)) (not (_unused _s55)) (not (_unused _s75)) (not (_unused _s95)) (not (_unused _s115)) (not (_unused _s141)) (not (_unused _s151)) (not (_unused _s195)) (not (_unused _s206)) (not (_unused _s249)) (not (_unused _s303)) (not (_unused _s307))) (_applicable _p28)) (not (_unused _s254)) (not (_unused _s29)) (not (_unused _s17)) (when (and (not (_unused _s1)) (not (_unused _s2)) (not (_unused _s4)) (not (_unused _s5)) (not (_unused _s7)) (not (_unused _s8)) (not (_unused _s10)) (not (_unused _s11)) (not (_unused _s12)) (not (_unused _s13)) (not (_unused _s14)) (not (_unused _s15)) (not (_unused _s18)) (not (_unused _s19)) (not (_unused _s20)) (not (_unused _s22)) (not (_unused _s23)) (not (_unused _s25)) (not (_unused _s26)) (not (_unused _s28)) (not (_unused _s31)) (not (_unused _s32)) (not (_unused _s34)) (not (_unused _s55)) (not (_unused _s75)) (not (_unused _s95)) (not (_unused _s115)) (not (_unused _s141)) (not (_unused _s151)) (not (_unused _s195)) (not (_unused _s206)) (not (_unused _s249)) (not (_unused _s303)) (not (_unused _s307))) (_applicable _p28)))
   )
   (:action a28_pick
          :parameters ('left' o5 p408 #g0 #q0 #t1)
          :precondition (and (kin 'left' o5 p408 #g0 #q0 #t1) (atpose o5 p408) (handempty 'left') (atbconf #q0) (_applicable _p28))
          :effect (and (atgrasp 'left' o5 #g0) (canmove) (not (atpose o5 p408)) (not (handempty 'left')) (increase (total-cost) 100) (not (canoperate)) (not (_applicable _p28)) (not (_unused _s17)) (not (_unused _s12)) (when (and (not (_unused _s1)) (not (_unused _s2)) (not (_unused _s4)) (not (_unused _s5)) (not (_unused _s7)) (not (_unused _s8)) (not (_unused _s10)) (not (_unused _s11)) (not (_unused _s13)) (not (_unused _s14)) (not (_unused _s15)) (not (_unused _s18)) (not (_unused _s19)) (not (_unused _s20)) (not (_unused _s22)) (not (_unused _s23)) (not (_unused _s25)) (not (_unused _s26)) (not (_unused _s28)) (not (_unused _s29)) (not (_unused _s31)) (not (_unused _s32)) (not (_unused _s34)) (not (_unused _s55)) (not (_unused _s75)) (not (_unused _s95)) (not (_unused _s115)) (not (_unused _s141)) (not (_unused _s151)) (not (_unused _s195)) (not (_unused _s206)) (not (_unused _s249)) (not (_unused _s254)) (not (_unused _s303)) (not (_unused _s307))) (_applicable _p29)) (not (_unused _s17)) (not (_unused _s12)) (when (and (not (_unused _s1)) (not (_unused _s2)) (not (_unused _s4)) (not (_unused _s5)) (not (_unused _s7)) (not (_unused _s8)) (not (_unused _s10)) (not (_unused _s11)) (not (_unused _s13)) (not (_unused _s14)) (not (_unused _s15)) (not (_unused _s18)) (not (_unused _s19)) (not (_unused _s20)) (not (_unused _s22)) (not (_unused _s23)) (not (_unused _s25)) (not (_unused _s26)) (not (_unused _s28)) (not (_unused _s29)) (not (_unused _s31)) (not (_unused _s32)) (not (_unused _s34)) (not (_unused _s55)) (not (_unused _s75)) (not (_unused _s95)) (not (_unused _s115)) (not (_unused _s141)) (not (_unused _s151)) (not (_unused _s195)) (not (_unused _s206)) (not (_unused _s249)) (not (_unused _s254)) (not (_unused _s303)) (not (_unused _s307))) (_applicable _p29)))
   )
   (:action a29_move_base
          :parameters (#q0 #q5 #t39)
          :precondition (and (basemotion #q0 #t39 #q5) (atbconf #q0) (canmove) (_applicable _p29))
          :effect (and (atbconf #q5) (not (atbconf #q0)) (not (canmove)) (increase (total-cost) 200) (not (canoperate)) (not (_applicable _p29)) (not (_unused _s55)) (not (_unused _s22)) (not (_unused _s17)) (when (and (not (_unused _s1)) (not (_unused _s2)) (not (_unused _s4)) (not (_unused _s5)) (not (_unused _s7)) (not (_unused _s8)) (not (_unused _s10)) (not (_unused _s11)) (not (_unused _s12)) (not (_unused _s13)) (not (_unused _s14)) (not (_unused _s15)) (not (_unused _s18)) (not (_unused _s19)) (not (_unused _s20)) (not (_unused _s23)) (not (_unused _s25)) (not (_unused _s26)) (not (_unused _s28)) (not (_unused _s29)) (not (_unused _s31)) (not (_unused _s32)) (not (_unused _s34)) (not (_unused _s75)) (not (_unused _s95)) (not (_unused _s115)) (not (_unused _s141)) (not (_unused _s151)) (not (_unused _s195)) (not (_unused _s206)) (not (_unused _s249)) (not (_unused _s254)) (not (_unused _s303)) (not (_unused _s307))) (_applicable _p30)) (not (_unused _s55)) (not (_unused _s22)) (not (_unused _s17)) (when (and (not (_unused _s1)) (not (_unused _s2)) (not (_unused _s4)) (not (_unused _s5)) (not (_unused _s7)) (not (_unused _s8)) (not (_unused _s10)) (not (_unused _s11)) (not (_unused _s12)) (not (_unused _s13)) (not (_unused _s14)) (not (_unused _s15)) (not (_unused _s18)) (not (_unused _s19)) (not (_unused _s20)) (not (_unused _s23)) (not (_unused _s25)) (not (_unused _s26)) (not (_unused _s28)) (not (_unused _s29)) (not (_unused _s31)) (not (_unused _s32)) (not (_unused _s34)) (not (_unused _s75)) (not (_unused _s95)) (not (_unused _s115)) (not (_unused _s141)) (not (_unused _s151)) (not (_unused _s195)) (not (_unused _s206)) (not (_unused _s249)) (not (_unused _s254)) (not (_unused _s303)) (not (_unused _s307))) (_applicable _p30)))
   )
   (:action a30_place
          :parameters ('left' o5 #p1 #g0 #q5 #t6)
          :precondition (and (kin 'left' o5 #p1 #g0 #q5 #t6) (atgrasp 'left' o5 #g0) (atbconf #q5) (_applicable _p30))
          :effect (and (atpose o5 #p1) (handempty 'left') (canmove) (not (atgrasp 'left' o5 #g0)) (increase (total-cost) 100) (canoperate) (not (_applicable _p30)) (not (_unused _s22)) (not (_unused _s1)) (not (_unused _s12)) (when (and (not (_unused _s2)) (not (_unused _s4)) (not (_unused _s5)) (not (_unused _s7)) (not (_unused _s8)) (not (_unused _s10)) (not (_unused _s11)) (not (_unused _s13)) (not (_unused _s14)) (not (_unused _s15)) (not (_unused _s17)) (not (_unused _s18)) (not (_unused _s19)) (not (_unused _s20)) (not (_unused _s23)) (not (_unused _s25)) (not (_unused _s26)) (not (_unused _s28)) (not (_unused _s29)) (not (_unused _s31)) (not (_unused _s32)) (not (_unused _s34)) (not (_unused _s55)) (not (_unused _s75)) (not (_unused _s95)) (not (_unused _s115)) (not (_unused _s141)) (not (_unused _s151)) (not (_unused _s195)) (not (_unused _s206)) (not (_unused _s249)) (not (_unused _s254)) (not (_unused _s303)) (not (_unused _s307))) (_applicable _p31)) (not (_unused _s22)) (not (_unused _s1)) (not (_unused _s12)) (when (and (not (_unused _s2)) (not (_unused _s4)) (not (_unused _s5)) (not (_unused _s7)) (not (_unused _s8)) (not (_unused _s10)) (not (_unused _s11)) (not (_unused _s13)) (not (_unused _s14)) (not (_unused _s15)) (not (_unused _s17)) (not (_unused _s18)) (not (_unused _s19)) (not (_unused _s20)) (not (_unused _s23)) (not (_unused _s25)) (not (_unused _s26)) (not (_unused _s28)) (not (_unused _s29)) (not (_unused _s31)) (not (_unused _s32)) (not (_unused _s34)) (not (_unused _s55)) (not (_unused _s75)) (not (_unused _s95)) (not (_unused _s115)) (not (_unused _s141)) (not (_unused _s151)) (not (_unused _s195)) (not (_unused _s206)) (not (_unused _s249)) (not (_unused _s254)) (not (_unused _s303)) (not (_unused _s307))) (_applicable _p31)))
   )
   (:action a31_clean
          :parameters (o5 o3)
          :precondition (and (stackable o5 o3) (sink o3) (on o5 o3) (canoperate) (_applicable _p31))
          :effect (and (cleaned o5) (increase (total-cost) 50) (not (canoperate)) (not (_applicable _p31)) (when (and (not (_unused _s1)) (not (_unused _s2)) (not (_unused _s4)) (not (_unused _s5)) (not (_unused _s7)) (not (_unused _s8)) (not (_unused _s10)) (not (_unused _s11)) (not (_unused _s12)) (not (_unused _s13)) (not (_unused _s14)) (not (_unused _s15)) (not (_unused _s17)) (not (_unused _s18)) (not (_unused _s19)) (not (_unused _s20)) (not (_unused _s22)) (not (_unused _s23)) (not (_unused _s25)) (not (_unused _s26)) (not (_unused _s28)) (not (_unused _s29)) (not (_unused _s31)) (not (_unused _s32)) (not (_unused _s34)) (not (_unused _s55)) (not (_unused _s75)) (not (_unused _s95)) (not (_unused _s115)) (not (_unused _s141)) (not (_unused _s151)) (not (_unused _s195)) (not (_unused _s206)) (not (_unused _s249)) (not (_unused _s254)) (not (_unused _s303)) (not (_unused _s307))) (_applicable _p32)) (when (and (not (_unused _s1)) (not (_unused _s2)) (not (_unused _s4)) (not (_unused _s5)) (not (_unused _s7)) (not (_unused _s8)) (not (_unused _s10)) (not (_unused _s11)) (not (_unused _s12)) (not (_unused _s13)) (not (_unused _s14)) (not (_unused _s15)) (not (_unused _s17)) (not (_unused _s18)) (not (_unused _s19)) (not (_unused _s20)) (not (_unused _s22)) (not (_unused _s23)) (not (_unused _s25)) (not (_unused _s26)) (not (_unused _s28)) (not (_unused _s29)) (not (_unused _s31)) (not (_unused _s32)) (not (_unused _s34)) (not (_unused _s55)) (not (_unused _s75)) (not (_unused _s95)) (not (_unused _s115)) (not (_unused _s141)) (not (_unused _s151)) (not (_unused _s195)) (not (_unused _s206)) (not (_unused _s249)) (not (_unused _s254)) (not (_unused _s303)) (not (_unused _s307))) (_applicable _p32)))
   )
   (:action a32_pick
          :parameters ('left' o5 #p1 #g0 #q5 #t6)
          :precondition (and (kin 'left' o5 #p1 #g0 #q5 #t6) (atpose o5 #p1) (handempty 'left') (atbconf #q5) (_applicable _p32))
          :effect (and (atgrasp 'left' o5 #g0) (canmove) (not (atpose o5 #p1)) (not (handempty 'left')) (increase (total-cost) 100) (not (canoperate)) (not (_applicable _p32)) (not (_unused _s22)) (not (_unused _s1)) (not (_unused _s12)) (when (and (not (_unused _s2)) (not (_unused _s4)) (not (_unused _s5)) (not (_unused _s7)) (not (_unused _s8)) (not (_unused _s10)) (not (_unused _s11)) (not (_unused _s13)) (not (_unused _s14)) (not (_unused _s15)) (not (_unused _s17)) (not (_unused _s18)) (not (_unused _s19)) (not (_unused _s20)) (not (_unused _s23)) (not (_unused _s25)) (not (_unused _s26)) (not (_unused _s28)) (not (_unused _s29)) (not (_unused _s31)) (not (_unused _s32)) (not (_unused _s34)) (not (_unused _s55)) (not (_unused _s75)) (not (_unused _s95)) (not (_unused _s115)) (not (_unused _s141)) (not (_unused _s151)) (not (_unused _s195)) (not (_unused _s206)) (not (_unused _s249)) (not (_unused _s254)) (not (_unused _s303)) (not (_unused _s307))) (_applicable _p33)) (not (_unused _s22)) (not (_unused _s1)) (not (_unused _s12)) (when (and (not (_unused _s2)) (not (_unused _s4)) (not (_unused _s5)) (not (_unused _s7)) (not (_unused _s8)) (not (_unused _s10)) (not (_unused _s11)) (not (_unused _s13)) (not (_unused _s14)) (not (_unused _s15)) (not (_unused _s17)) (not (_unused _s18)) (not (_unused _s19)) (not (_unused _s20)) (not (_unused _s23)) (not (_unused _s25)) (not (_unused _s26)) (not (_unused _s28)) (not (_unused _s29)) (not (_unused _s31)) (not (_unused _s32)) (not (_unused _s34)) (not (_unused _s55)) (not (_unused _s75)) (not (_unused _s95)) (not (_unused _s115)) (not (_unused _s141)) (not (_unused _s151)) (not (_unused _s195)) (not (_unused _s206)) (not (_unused _s249)) (not (_unused _s254)) (not (_unused _s303)) (not (_unused _s307))) (_applicable _p33)))
   )
   (:action a33_move_base
          :parameters (#q5 #q6 #t125)
          :precondition (and (basemotion #q5 #t125 #q6) (atbconf #q5) (canmove) (_applicable _p33))
          :effect (and (atbconf #q6) (not (atbconf #q5)) (not (canmove)) (increase (total-cost) 200) (not (canoperate)) (not (_applicable _p33)) (not (_unused _s22)) (not (_unused _s23)) (not (_unused _s141)) (when (and (not (_unused _s1)) (not (_unused _s2)) (not (_unused _s4)) (not (_unused _s5)) (not (_unused _s7)) (not (_unused _s8)) (not (_unused _s10)) (not (_unused _s11)) (not (_unused _s12)) (not (_unused _s13)) (not (_unused _s14)) (not (_unused _s15)) (not (_unused _s17)) (not (_unused _s18)) (not (_unused _s19)) (not (_unused _s20)) (not (_unused _s25)) (not (_unused _s26)) (not (_unused _s28)) (not (_unused _s29)) (not (_unused _s31)) (not (_unused _s32)) (not (_unused _s34)) (not (_unused _s55)) (not (_unused _s75)) (not (_unused _s95)) (not (_unused _s115)) (not (_unused _s151)) (not (_unused _s195)) (not (_unused _s206)) (not (_unused _s249)) (not (_unused _s254)) (not (_unused _s303)) (not (_unused _s307))) (_applicable _p34)) (not (_unused _s22)) (not (_unused _s23)) (not (_unused _s141)) (when (and (not (_unused _s1)) (not (_unused _s2)) (not (_unused _s4)) (not (_unused _s5)) (not (_unused _s7)) (not (_unused _s8)) (not (_unused _s10)) (not (_unused _s11)) (not (_unused _s12)) (not (_unused _s13)) (not (_unused _s14)) (not (_unused _s15)) (not (_unused _s17)) (not (_unused _s18)) (not (_unused _s19)) (not (_unused _s20)) (not (_unused _s25)) (not (_unused _s26)) (not (_unused _s28)) (not (_unused _s29)) (not (_unused _s31)) (not (_unused _s32)) (not (_unused _s34)) (not (_unused _s55)) (not (_unused _s75)) (not (_unused _s95)) (not (_unused _s115)) (not (_unused _s151)) (not (_unused _s195)) (not (_unused _s206)) (not (_unused _s249)) (not (_unused _s254)) (not (_unused _s303)) (not (_unused _s307))) (_applicable _p34)))
   )
   (:action a34_place
          :parameters ('left' o5 #p2 #g0 #q6 #t7)
          :precondition (and (kin 'left' o5 #p2 #g0 #q6 #t7) (atgrasp 'left' o5 #g0) (atbconf #q6) (_applicable _p34))
          :effect (and (atpose o5 #p2) (handempty 'left') (canmove) (not (atgrasp 'left' o5 #g0)) (increase (total-cost) 100) (canoperate) (not (_applicable _p34)) (not (_unused _s2)) (not (_unused _s23)) (not (_unused _s12)) (when (and (not (_unused _s1)) (not (_unused _s4)) (not (_unused _s5)) (not (_unused _s7)) (not (_unused _s8)) (not (_unused _s10)) (not (_unused _s11)) (not (_unused _s13)) (not (_unused _s14)) (not (_unused _s15)) (not (_unused _s17)) (not (_unused _s18)) (not (_unused _s19)) (not (_unused _s20)) (not (_unused _s22)) (not (_unused _s25)) (not (_unused _s26)) (not (_unused _s28)) (not (_unused _s29)) (not (_unused _s31)) (not (_unused _s32)) (not (_unused _s34)) (not (_unused _s55)) (not (_unused _s75)) (not (_unused _s95)) (not (_unused _s115)) (not (_unused _s141)) (not (_unused _s151)) (not (_unused _s195)) (not (_unused _s206)) (not (_unused _s249)) (not (_unused _s254)) (not (_unused _s303)) (not (_unused _s307))) (_applicable _p35)) (not (_unused _s2)) (not (_unused _s23)) (not (_unused _s12)) (when (and (not (_unused _s1)) (not (_unused _s4)) (not (_unused _s5)) (not (_unused _s7)) (not (_unused _s8)) (not (_unused _s10)) (not (_unused _s11)) (not (_unused _s13)) (not (_unused _s14)) (not (_unused _s15)) (not (_unused _s17)) (not (_unused _s18)) (not (_unused _s19)) (not (_unused _s20)) (not (_unused _s22)) (not (_unused _s25)) (not (_unused _s26)) (not (_unused _s28)) (not (_unused _s29)) (not (_unused _s31)) (not (_unused _s32)) (not (_unused _s34)) (not (_unused _s55)) (not (_unused _s75)) (not (_unused _s95)) (not (_unused _s115)) (not (_unused _s141)) (not (_unused _s151)) (not (_unused _s195)) (not (_unused _s206)) (not (_unused _s249)) (not (_unused _s254)) (not (_unused _s303)) (not (_unused _s307))) (_applicable _p35)))
   )
   (:action a35_cook
          :parameters (o5 o4)
          :precondition (and (stackable o5 o4) (stove o4) (on o5 o4) (cleaned o5) (canoperate) (_applicable _p35))
          :effect (and (cooked o5) (not (cleaned o5)) (increase (total-cost) 50) (not (canoperate)) (not (_applicable _p35)) (when (and (not (_unused _s1)) (not (_unused _s2)) (not (_unused _s4)) (not (_unused _s5)) (not (_unused _s7)) (not (_unused _s8)) (not (_unused _s10)) (not (_unused _s11)) (not (_unused _s12)) (not (_unused _s13)) (not (_unused _s14)) (not (_unused _s15)) (not (_unused _s17)) (not (_unused _s18)) (not (_unused _s19)) (not (_unused _s20)) (not (_unused _s22)) (not (_unused _s23)) (not (_unused _s25)) (not (_unused _s26)) (not (_unused _s28)) (not (_unused _s29)) (not (_unused _s31)) (not (_unused _s32)) (not (_unused _s34)) (not (_unused _s55)) (not (_unused _s75)) (not (_unused _s95)) (not (_unused _s115)) (not (_unused _s141)) (not (_unused _s151)) (not (_unused _s195)) (not (_unused _s206)) (not (_unused _s249)) (not (_unused _s254)) (not (_unused _s303)) (not (_unused _s307))) (_applicable _p36)) (when (and (not (_unused _s1)) (not (_unused _s2)) (not (_unused _s4)) (not (_unused _s5)) (not (_unused _s7)) (not (_unused _s8)) (not (_unused _s10)) (not (_unused _s11)) (not (_unused _s12)) (not (_unused _s13)) (not (_unused _s14)) (not (_unused _s15)) (not (_unused _s17)) (not (_unused _s18)) (not (_unused _s19)) (not (_unused _s20)) (not (_unused _s22)) (not (_unused _s23)) (not (_unused _s25)) (not (_unused _s26)) (not (_unused _s28)) (not (_unused _s29)) (not (_unused _s31)) (not (_unused _s32)) (not (_unused _s34)) (not (_unused _s55)) (not (_unused _s75)) (not (_unused _s95)) (not (_unused _s115)) (not (_unused _s141)) (not (_unused _s151)) (not (_unused _s195)) (not (_unused _s206)) (not (_unused _s249)) (not (_unused _s254)) (not (_unused _s303)) (not (_unused _s307))) (_applicable _p36)))
   )
   (:action a36_move_base
          :parameters (#q6 q976 #t135)
          :precondition (and (basemotion #q6 #t135 q976) (atbconf #q6) (canmove) (_applicable _p36))
          :effect (and (atbconf q976) (not (atbconf #q6)) (not (canmove)) (increase (total-cost) 200) (not (canoperate)) (not (_applicable _p36)) (not (_unused _s151)) (not (_unused _s23)) (when (and (not (_unused _s1)) (not (_unused _s2)) (not (_unused _s4)) (not (_unused _s5)) (not (_unused _s7)) (not (_unused _s8)) (not (_unused _s10)) (not (_unused _s11)) (not (_unused _s12)) (not (_unused _s13)) (not (_unused _s14)) (not (_unused _s15)) (not (_unused _s17)) (not (_unused _s18)) (not (_unused _s19)) (not (_unused _s20)) (not (_unused _s22)) (not (_unused _s25)) (not (_unused _s26)) (not (_unused _s28)) (not (_unused _s29)) (not (_unused _s31)) (not (_unused _s32)) (not (_unused _s34)) (not (_unused _s55)) (not (_unused _s75)) (not (_unused _s95)) (not (_unused _s115)) (not (_unused _s141)) (not (_unused _s195)) (not (_unused _s206)) (not (_unused _s249)) (not (_unused _s254)) (not (_unused _s303)) (not (_unused _s307))) (_applicable _p37)) (not (_unused _s151)) (not (_unused _s23)) (when (and (not (_unused _s1)) (not (_unused _s2)) (not (_unused _s4)) (not (_unused _s5)) (not (_unused _s7)) (not (_unused _s8)) (not (_unused _s10)) (not (_unused _s11)) (not (_unused _s12)) (not (_unused _s13)) (not (_unused _s14)) (not (_unused _s15)) (not (_unused _s17)) (not (_unused _s18)) (not (_unused _s19)) (not (_unused _s20)) (not (_unused _s22)) (not (_unused _s25)) (not (_unused _s26)) (not (_unused _s28)) (not (_unused _s29)) (not (_unused _s31)) (not (_unused _s32)) (not (_unused _s34)) (not (_unused _s55)) (not (_unused _s75)) (not (_unused _s95)) (not (_unused _s115)) (not (_unused _s141)) (not (_unused _s195)) (not (_unused _s206)) (not (_unused _s249)) (not (_unused _s254)) (not (_unused _s303)) (not (_unused _s307))) (_applicable _p37)))
   )
   (:action s1_sample-place
          :parameters (o5 o3)
          :precondition (stackable o5 o3)
          :effect (and (ispose o5 #p1) (supported o5 #p1 o3) (_unused _s1))
   )
   (:action s2_sample-place
          :parameters (o5 o4)
          :precondition (stackable o5 o4)
          :effect (and (ispose o5 #p2) (supported o5 #p2 o4) (_unused _s2))
   )
   (:action s4_sample-place
          :parameters (o6 o3)
          :precondition (stackable o6 o3)
          :effect (and (ispose o6 #p4) (supported o6 #p4 o3) (_unused _s4))
   )
   (:action s5_sample-place
          :parameters (o6 o4)
          :precondition (stackable o6 o4)
          :effect (and (ispose o6 #p5) (supported o6 #p5 o4) (_unused _s5))
   )
   (:action s7_sample-place
          :parameters (o7 o3)
          :precondition (stackable o7 o3)
          :effect (and (ispose o7 #p7) (supported o7 #p7 o3) (_unused _s7))
   )
   (:action s8_sample-place
          :parameters (o7 o4)
          :precondition (stackable o7 o4)
          :effect (and (ispose o7 #p8) (supported o7 #p8 o4) (_unused _s8))
   )
   (:action s10_sample-place
          :parameters (o8 o3)
          :precondition (stackable o8 o3)
          :effect (and (ispose o8 #p10) (supported o8 #p10 o3) (_unused _s10))
   )
   (:action s11_sample-place
          :parameters (o8 o4)
          :precondition (stackable o8 o4)
          :effect (and (ispose o8 #p11) (supported o8 #p11 o4) (_unused _s11))
   )
   (:action s12_sample-grasp
          :parameters (o5)
          :precondition (graspable o5)
          :effect (and (isgrasp o5 #g0) (_unused _s12))
   )
   (:action s13_sample-grasp
          :parameters (o6)
          :precondition (graspable o6)
          :effect (and (isgrasp o6 #g1) (_unused _s13))
   )
   (:action s14_sample-grasp
          :parameters (o7)
          :precondition (graspable o7)
          :effect (and (isgrasp o7 #g2) (_unused _s14))
   )
   (:action s15_sample-grasp
          :parameters (o8)
          :precondition (graspable o8)
          :effect (and (isgrasp o8 #g3) (_unused _s15))
   )
   (:action s17_inverse-kinematics
          :parameters ('left' o5 p408 #g0)
          :precondition (and (controllable 'left') (ispose o5 p408) (isgrasp o5 #g0))
          :effect (and (isbconf #q0) (kin 'left' o5 p408 #g0 #q0 #t1) (not (_unused _s12)) (_unused _s17))
   )
   (:action s18_inverse-kinematics
          :parameters ('left' o6 p504 #g1)
          :precondition (and (controllable 'left') (ispose o6 p504) (isgrasp o6 #g1))
          :effect (and (isbconf #q1) (kin 'left' o6 p504 #g1 #q1 #t2) (not (_unused _s13)) (_unused _s18))
   )
   (:action s19_inverse-kinematics
          :parameters ('left' o7 p744 #g2)
          :precondition (and (controllable 'left') (ispose o7 p744) (isgrasp o7 #g2))
          :effect (and (isbconf #q2) (kin 'left' o7 p744 #g2 #q2 #t3) (not (_unused _s14)) (_unused _s19))
   )
   (:action s20_inverse-kinematics
          :parameters ('left' o8 p840 #g3)
          :precondition (and (controllable 'left') (ispose o8 p840) (isgrasp o8 #g3))
          :effect (and (isbconf #q3) (kin 'left' o8 p840 #g3 #q3 #t4) (not (_unused _s15)) (_unused _s20))
   )
   (:action s22_inverse-kinematics
          :parameters ('left' o5 #p1 #g0)
          :precondition (and (controllable 'left') (ispose o5 #p1) (isgrasp o5 #g0))
          :effect (and (isbconf #q5) (kin 'left' o5 #p1 #g0 #q5 #t6) (not (_unused _s1)) (not (_unused _s12)) (_unused _s22))
   )
   (:action s23_inverse-kinematics
          :parameters ('left' o5 #p2 #g0)
          :precondition (and (controllable 'left') (ispose o5 #p2) (isgrasp o5 #g0))
          :effect (and (isbconf #q6) (kin 'left' o5 #p2 #g0 #q6 #t7) (not (_unused _s2)) (not (_unused _s12)) (_unused _s23))
   )
   (:action s25_inverse-kinematics
          :parameters ('left' o6 #p4 #g1)
          :precondition (and (controllable 'left') (ispose o6 #p4) (isgrasp o6 #g1))
          :effect (and (isbconf #q8) (kin 'left' o6 #p4 #g1 #q8 #t9) (not (_unused _s13)) (not (_unused _s4)) (_unused _s25))
   )
   (:action s26_inverse-kinematics
          :parameters ('left' o6 #p5 #g1)
          :precondition (and (controllable 'left') (ispose o6 #p5) (isgrasp o6 #g1))
          :effect (and (isbconf #q9) (kin 'left' o6 #p5 #g1 #q9 #t10) (not (_unused _s13)) (not (_unused _s5)) (_unused _s26))
   )
   (:action s28_inverse-kinematics
          :parameters ('left' o7 #p7 #g2)
          :precondition (and (controllable 'left') (ispose o7 #p7) (isgrasp o7 #g2))
          :effect (and (isbconf #q11) (kin 'left' o7 #p7 #g2 #q11 #t12) (not (_unused _s14)) (not (_unused _s7)) (_unused _s28))
   )
   (:action s29_inverse-kinematics
          :parameters ('left' o7 #p8 #g2)
          :precondition (and (controllable 'left') (ispose o7 #p8) (isgrasp o7 #g2))
          :effect (and (isbconf #q12) (kin 'left' o7 #p8 #g2 #q12 #t13) (not (_unused _s8)) (not (_unused _s14)) (_unused _s29))
   )
   (:action s31_inverse-kinematics
          :parameters ('left' o8 #p10 #g3)
          :precondition (and (controllable 'left') (ispose o8 #p10) (isgrasp o8 #g3))
          :effect (and (isbconf #q14) (kin 'left' o8 #p10 #g3 #q14 #t15) (not (_unused _s15)) (not (_unused _s10)) (_unused _s31))
   )
   (:action s32_inverse-kinematics
          :parameters ('left' o8 #p11 #g3)
          :precondition (and (controllable 'left') (ispose o8 #p11) (isgrasp o8 #g3))
          :effect (and (isbconf #q15) (kin 'left' o8 #p11 #g3 #q15 #t16) (not (_unused _s15)) (not (_unused _s11)) (_unused _s32))
   )
   (:action s34_plan-base-motion
          :parameters (q976 #q1)
          :precondition (and (isbconf q976) (isbconf #q1))
          :effect (and (basemotion q976 #t18 #q1) (not (_unused _s18)) (_unused _s34))
   )
   (:action s55_plan-base-motion
          :parameters (#q0 #q5)
          :precondition (and (isbconf #q0) (isbconf #q5))
          :effect (and (basemotion #q0 #t39 #q5) (not (_unused _s22)) (not (_unused _s17)) (_unused _s55))
   )
   (:action s75_plan-base-motion
          :parameters (#q1 #q8)
          :precondition (and (isbconf #q1) (isbconf #q8))
          :effect (and (basemotion #q1 #t59 #q8) (not (_unused _s18)) (not (_unused _s25)) (_unused _s75))
   )
   (:action s95_plan-base-motion
          :parameters (#q2 #q11)
          :precondition (and (isbconf #q2) (isbconf #q11))
          :effect (and (basemotion #q2 #t79 #q11) (not (_unused _s19)) (not (_unused _s28)) (_unused _s95))
   )
   (:action s115_plan-base-motion
          :parameters (#q3 #q14)
          :precondition (and (isbconf #q3) (isbconf #q14))
          :effect (and (basemotion #q3 #t99 #q14) (not (_unused _s20)) (not (_unused _s31)) (_unused _s115))
   )
   (:action s141_plan-base-motion
          :parameters (#q5 #q6)
          :precondition (and (isbconf #q5) (isbconf #q6))
          :effect (and (basemotion #q5 #t125 #q6) (not (_unused _s22)) (not (_unused _s23)) (_unused _s141))
   )
   (:action s151_plan-base-motion
          :parameters (#q6 q976)
          :precondition (and (isbconf #q6) (isbconf q976))
          :effect (and (basemotion #q6 #t135 q976) (not (_unused _s23)) (_unused _s151))
   )
   (:action s195_plan-base-motion
          :parameters (#q8 #q9)
          :precondition (and (isbconf #q8) (isbconf #q9))
          :effect (and (basemotion #q8 #t179 #q9) (not (_unused _s25)) (not (_unused _s26)) (_unused _s195))
   )
   (:action s206_plan-base-motion
          :parameters (#q9 #q3)
          :precondition (and (isbconf #q9) (isbconf #q3))
          :effect (and (basemotion #q9 #t190 #q3) (not (_unused _s20)) (not (_unused _s26)) (_unused _s206))
   )
   (:action s249_plan-base-motion
          :parameters (#q11 #q12)
          :precondition (and (isbconf #q11) (isbconf #q12))
          :effect (and (basemotion #q11 #t233 #q12) (not (_unused _s29)) (not (_unused _s28)) (_unused _s249))
   )
   (:action s254_plan-base-motion
          :parameters (#q12 #q0)
          :precondition (and (isbconf #q12) (isbconf #q0))
          :effect (and (basemotion #q12 #t238 #q0) (not (_unused _s29)) (not (_unused _s17)) (_unused _s254))
   )
   (:action s303_plan-base-motion
          :parameters (#q14 #q15)
          :precondition (and (isbconf #q14) (isbconf #q15))
          :effect (and (basemotion #q14 #t287 #q15) (not (_unused _s32)) (not (_unused _s31)) (_unused _s303))
   )
   (:action s307_plan-base-motion
          :parameters (#q15 #q2)
          :precondition (and (isbconf #q15) (isbconf #q2))
          :effect (and (basemotion #q15 #t291 #q2) (not (_unused _s19)) (not (_unused _s32)) (_unused _s307))
   )
)
