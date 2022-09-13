;15:10:38 13/09

;Skeleton_SN = 0

(define (domain pr2-tamp_propo)
   (:requirements :strips :equality :action-costs)

   (:types
          arm wuti grasp config pose trajectory propo_action
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
          :effect (and (atbconf #q1) (not (atbconf q976)) (not (canmove)) (increase (total-cost) 200) (not (canoperate)) (not (_applicable _p0)) (_applicable _p1))
   )
   (:action a1_pick
          :parameters ('left' o6 p504 #g1 #q1 #t2)
          :precondition (and (kin 'left' o6 p504 #g1 #q1 #t2) (atpose o6 p504) (handempty 'left') (atbconf #q1) (_applicable _p1))
          :effect (and (atgrasp 'left' o6 #g1) (canmove) (not (atpose o6 p504)) (not (handempty 'left')) (increase (total-cost) 100) (not (canoperate)) (not (_applicable _p1)) (_applicable _p2))
   )
   (:action a2_move_base
          :parameters (#q1 #q8 #t59)
          :precondition (and (basemotion #q1 #t59 #q8) (atbconf #q1) (canmove) (_applicable _p2))
          :effect (and (atbconf #q8) (not (atbconf #q1)) (not (canmove)) (increase (total-cost) 200) (not (canoperate)) (not (_applicable _p2)) (_applicable _p3))
   )
   (:action a3_place
          :parameters ('left' o6 #p4 #g1 #q8 #t9)
          :precondition (and (kin 'left' o6 #p4 #g1 #q8 #t9) (atgrasp 'left' o6 #g1) (atbconf #q8) (_applicable _p3))
          :effect (and (atpose o6 #p4) (handempty 'left') (canmove) (not (atgrasp 'left' o6 #g1)) (increase (total-cost) 100) (canoperate) (not (_applicable _p3)) (_applicable _p4))
   )
   (:action a4_clean
          :parameters (o6 o3)
          :precondition (and (stackable o6 o3) (sink o3) (on o6 o3) (canoperate) (_applicable _p4))
          :effect (and (cleaned o6) (increase (total-cost) 50) (not (canoperate)) (not (_applicable _p4)) (_applicable _p5))
   )
   (:action a5_pick
          :parameters ('left' o6 #p4 #g1 #q8 #t9)
          :precondition (and (kin 'left' o6 #p4 #g1 #q8 #t9) (atpose o6 #p4) (handempty 'left') (atbconf #q8) (_applicable _p5))
          :effect (and (atgrasp 'left' o6 #g1) (canmove) (not (atpose o6 #p4)) (not (handempty 'left')) (increase (total-cost) 100) (not (canoperate)) (not (_applicable _p5)) (_applicable _p6))
   )
   (:action a6_move_base
          :parameters (#q8 #q9 #t179)
          :precondition (and (basemotion #q8 #t179 #q9) (atbconf #q8) (canmove) (_applicable _p6))
          :effect (and (atbconf #q9) (not (atbconf #q8)) (not (canmove)) (increase (total-cost) 200) (not (canoperate)) (not (_applicable _p6)) (_applicable _p7))
   )
   (:action a7_place
          :parameters ('left' o6 #p5 #g1 #q9 #t10)
          :precondition (and (kin 'left' o6 #p5 #g1 #q9 #t10) (atgrasp 'left' o6 #g1) (atbconf #q9) (_applicable _p7))
          :effect (and (atpose o6 #p5) (handempty 'left') (canmove) (not (atgrasp 'left' o6 #g1)) (increase (total-cost) 100) (canoperate) (not (_applicable _p7)) (_applicable _p8))
   )
   (:action a8_cook
          :parameters (o6 o4)
          :precondition (and (stackable o6 o4) (stove o4) (on o6 o4) (cleaned o6) (canoperate) (_applicable _p8))
          :effect (and (cooked o6) (not (cleaned o6)) (increase (total-cost) 50) (not (canoperate)) (not (_applicable _p8)) (_applicable _p9))
   )
   (:action a9_move_base
          :parameters (#q9 #q3 #t190)
          :precondition (and (basemotion #q9 #t190 #q3) (atbconf #q9) (canmove) (_applicable _p9))
          :effect (and (atbconf #q3) (not (atbconf #q9)) (not (canmove)) (increase (total-cost) 200) (not (canoperate)) (not (_applicable _p9)) (_applicable _p10))
   )
   (:action a10_pick
          :parameters ('left' o8 p840 #g3 #q3 #t4)
          :precondition (and (kin 'left' o8 p840 #g3 #q3 #t4) (atpose o8 p840) (handempty 'left') (atbconf #q3) (_applicable _p10))
          :effect (and (atgrasp 'left' o8 #g3) (canmove) (not (atpose o8 p840)) (not (handempty 'left')) (increase (total-cost) 100) (not (canoperate)) (not (_applicable _p10)) (_applicable _p11))
   )
   (:action a11_move_base
          :parameters (#q3 #q14 #t99)
          :precondition (and (basemotion #q3 #t99 #q14) (atbconf #q3) (canmove) (_applicable _p11))
          :effect (and (atbconf #q14) (not (atbconf #q3)) (not (canmove)) (increase (total-cost) 200) (not (canoperate)) (not (_applicable _p11)) (_applicable _p12))
   )
   (:action a12_place
          :parameters ('left' o8 #p10 #g3 #q14 #t15)
          :precondition (and (kin 'left' o8 #p10 #g3 #q14 #t15) (atgrasp 'left' o8 #g3) (atbconf #q14) (_applicable _p12))
          :effect (and (atpose o8 #p10) (handempty 'left') (canmove) (not (atgrasp 'left' o8 #g3)) (increase (total-cost) 100) (canoperate) (not (_applicable _p12)) (_applicable _p13))
   )
   (:action a13_clean
          :parameters (o8 o3)
          :precondition (and (stackable o8 o3) (sink o3) (on o8 o3) (canoperate) (_applicable _p13))
          :effect (and (cleaned o8) (increase (total-cost) 50) (not (canoperate)) (not (_applicable _p13)) (_applicable _p14))
   )
   (:action a14_pick
          :parameters ('left' o8 #p10 #g3 #q14 #t15)
          :precondition (and (kin 'left' o8 #p10 #g3 #q14 #t15) (atpose o8 #p10) (handempty 'left') (atbconf #q14) (_applicable _p14))
          :effect (and (atgrasp 'left' o8 #g3) (canmove) (not (atpose o8 #p10)) (not (handempty 'left')) (increase (total-cost) 100) (not (canoperate)) (not (_applicable _p14)) (_applicable _p15))
   )
   (:action a15_move_base
          :parameters (#q14 #q15 #t287)
          :precondition (and (basemotion #q14 #t287 #q15) (atbconf #q14) (canmove) (_applicable _p15))
          :effect (and (atbconf #q15) (not (atbconf #q14)) (not (canmove)) (increase (total-cost) 200) (not (canoperate)) (not (_applicable _p15)) (_applicable _p16))
   )
   (:action a16_place
          :parameters ('left' o8 #p11 #g3 #q15 #t16)
          :precondition (and (kin 'left' o8 #p11 #g3 #q15 #t16) (atgrasp 'left' o8 #g3) (atbconf #q15) (_applicable _p16))
          :effect (and (atpose o8 #p11) (handempty 'left') (canmove) (not (atgrasp 'left' o8 #g3)) (increase (total-cost) 100) (canoperate) (not (_applicable _p16)) (_applicable _p17))
   )
   (:action a17_cook
          :parameters (o8 o4)
          :precondition (and (stackable o8 o4) (stove o4) (on o8 o4) (cleaned o8) (canoperate) (_applicable _p17))
          :effect (and (cooked o8) (not (cleaned o8)) (increase (total-cost) 50) (not (canoperate)) (not (_applicable _p17)) (_applicable _p18))
   )
   (:action a18_move_base
          :parameters (#q15 #q2 #t291)
          :precondition (and (basemotion #q15 #t291 #q2) (atbconf #q15) (canmove) (_applicable _p18))
          :effect (and (atbconf #q2) (not (atbconf #q15)) (not (canmove)) (increase (total-cost) 200) (not (canoperate)) (not (_applicable _p18)) (_applicable _p19))
   )
   (:action a19_pick
          :parameters ('left' o7 p744 #g2 #q2 #t3)
          :precondition (and (kin 'left' o7 p744 #g2 #q2 #t3) (atpose o7 p744) (handempty 'left') (atbconf #q2) (_applicable _p19))
          :effect (and (atgrasp 'left' o7 #g2) (canmove) (not (atpose o7 p744)) (not (handempty 'left')) (increase (total-cost) 100) (not (canoperate)) (not (_applicable _p19)) (_applicable _p20))
   )
   (:action a20_move_base
          :parameters (#q2 #q11 #t79)
          :precondition (and (basemotion #q2 #t79 #q11) (atbconf #q2) (canmove) (_applicable _p20))
          :effect (and (atbconf #q11) (not (atbconf #q2)) (not (canmove)) (increase (total-cost) 200) (not (canoperate)) (not (_applicable _p20)) (_applicable _p21))
   )
   (:action a21_place
          :parameters ('left' o7 #p7 #g2 #q11 #t12)
          :precondition (and (kin 'left' o7 #p7 #g2 #q11 #t12) (atgrasp 'left' o7 #g2) (atbconf #q11) (_applicable _p21))
          :effect (and (atpose o7 #p7) (handempty 'left') (canmove) (not (atgrasp 'left' o7 #g2)) (increase (total-cost) 100) (canoperate) (not (_applicable _p21)) (_applicable _p22))
   )
   (:action a22_clean
          :parameters (o7 o3)
          :precondition (and (stackable o7 o3) (sink o3) (on o7 o3) (canoperate) (_applicable _p22))
          :effect (and (cleaned o7) (increase (total-cost) 50) (not (canoperate)) (not (_applicable _p22)) (_applicable _p23))
   )
   (:action a23_pick
          :parameters ('left' o7 #p7 #g2 #q11 #t12)
          :precondition (and (kin 'left' o7 #p7 #g2 #q11 #t12) (atpose o7 #p7) (handempty 'left') (atbconf #q11) (_applicable _p23))
          :effect (and (atgrasp 'left' o7 #g2) (canmove) (not (atpose o7 #p7)) (not (handempty 'left')) (increase (total-cost) 100) (not (canoperate)) (not (_applicable _p23)) (_applicable _p24))
   )
   (:action a24_move_base
          :parameters (#q11 #q12 #t233)
          :precondition (and (basemotion #q11 #t233 #q12) (atbconf #q11) (canmove) (_applicable _p24))
          :effect (and (atbconf #q12) (not (atbconf #q11)) (not (canmove)) (increase (total-cost) 200) (not (canoperate)) (not (_applicable _p24)) (_applicable _p25))
   )
   (:action a25_place
          :parameters ('left' o7 #p8 #g2 #q12 #t13)
          :precondition (and (kin 'left' o7 #p8 #g2 #q12 #t13) (atgrasp 'left' o7 #g2) (atbconf #q12) (_applicable _p25))
          :effect (and (atpose o7 #p8) (handempty 'left') (canmove) (not (atgrasp 'left' o7 #g2)) (increase (total-cost) 100) (canoperate) (not (_applicable _p25)) (_applicable _p26))
   )
   (:action a26_cook
          :parameters (o7 o4)
          :precondition (and (stackable o7 o4) (stove o4) (on o7 o4) (cleaned o7) (canoperate) (_applicable _p26))
          :effect (and (cooked o7) (not (cleaned o7)) (increase (total-cost) 50) (not (canoperate)) (not (_applicable _p26)) (_applicable _p27))
   )
   (:action a27_move_base
          :parameters (#q12 #q0 #t238)
          :precondition (and (basemotion #q12 #t238 #q0) (atbconf #q12) (canmove) (_applicable _p27))
          :effect (and (atbconf #q0) (not (atbconf #q12)) (not (canmove)) (increase (total-cost) 200) (not (canoperate)) (not (_applicable _p27)) (_applicable _p28))
   )
   (:action a28_pick
          :parameters ('left' o5 p408 #g0 #q0 #t1)
          :precondition (and (kin 'left' o5 p408 #g0 #q0 #t1) (atpose o5 p408) (handempty 'left') (atbconf #q0) (_applicable _p28))
          :effect (and (atgrasp 'left' o5 #g0) (canmove) (not (atpose o5 p408)) (not (handempty 'left')) (increase (total-cost) 100) (not (canoperate)) (not (_applicable _p28)) (_applicable _p29))
   )
   (:action a29_move_base
          :parameters (#q0 #q5 #t39)
          :precondition (and (basemotion #q0 #t39 #q5) (atbconf #q0) (canmove) (_applicable _p29))
          :effect (and (atbconf #q5) (not (atbconf #q0)) (not (canmove)) (increase (total-cost) 200) (not (canoperate)) (not (_applicable _p29)) (_applicable _p30))
   )
   (:action a30_place
          :parameters ('left' o5 #p1 #g0 #q5 #t6)
          :precondition (and (kin 'left' o5 #p1 #g0 #q5 #t6) (atgrasp 'left' o5 #g0) (atbconf #q5) (_applicable _p30))
          :effect (and (atpose o5 #p1) (handempty 'left') (canmove) (not (atgrasp 'left' o5 #g0)) (increase (total-cost) 100) (canoperate) (not (_applicable _p30)) (_applicable _p31))
   )
   (:action a31_clean
          :parameters (o5 o3)
          :precondition (and (stackable o5 o3) (sink o3) (on o5 o3) (canoperate) (_applicable _p31))
          :effect (and (cleaned o5) (increase (total-cost) 50) (not (canoperate)) (not (_applicable _p31)) (_applicable _p32))
   )
   (:action a32_pick
          :parameters ('left' o5 #p1 #g0 #q5 #t6)
          :precondition (and (kin 'left' o5 #p1 #g0 #q5 #t6) (atpose o5 #p1) (handempty 'left') (atbconf #q5) (_applicable _p32))
          :effect (and (atgrasp 'left' o5 #g0) (canmove) (not (atpose o5 #p1)) (not (handempty 'left')) (increase (total-cost) 100) (not (canoperate)) (not (_applicable _p32)) (_applicable _p33))
   )
   (:action a33_move_base
          :parameters (#q5 #q6 #t125)
          :precondition (and (basemotion #q5 #t125 #q6) (atbconf #q5) (canmove) (_applicable _p33))
          :effect (and (atbconf #q6) (not (atbconf #q5)) (not (canmove)) (increase (total-cost) 200) (not (canoperate)) (not (_applicable _p33)) (_applicable _p34))
   )
   (:action a34_place
          :parameters ('left' o5 #p2 #g0 #q6 #t7)
          :precondition (and (kin 'left' o5 #p2 #g0 #q6 #t7) (atgrasp 'left' o5 #g0) (atbconf #q6) (_applicable _p34))
          :effect (and (atpose o5 #p2) (handempty 'left') (canmove) (not (atgrasp 'left' o5 #g0)) (increase (total-cost) 100) (canoperate) (not (_applicable _p34)) (_applicable _p35))
   )
   (:action a35_cook
          :parameters (o5 o4)
          :precondition (and (stackable o5 o4) (stove o4) (on o5 o4) (cleaned o5) (canoperate) (_applicable _p35))
          :effect (and (cooked o5) (not (cleaned o5)) (increase (total-cost) 50) (not (canoperate)) (not (_applicable _p35)) (_applicable _p36))
   )
   (:action a36_move_base
          :parameters (#q6 q976 #t135)
          :precondition (and (basemotion #q6 #t135 q976) (atbconf #q6) (canmove) (_applicable _p36))
          :effect (and (atbconf q976) (not (atbconf #q6)) (not (canmove)) (increase (total-cost) 200) (not (canoperate)) (not (_applicable _p36)) (_applicable _p37))
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
   (:action s12_sample-grasp
          :parameters (o5)
          :precondition (graspable o5)
          :effect (isgrasp o5 #g0)
   )
   (:action s13_sample-grasp
          :parameters (o6)
          :precondition (graspable o6)
          :effect (isgrasp o6 #g1)
   )
   (:action s14_sample-grasp
          :parameters (o7)
          :precondition (graspable o7)
          :effect (isgrasp o7 #g2)
   )
   (:action s15_sample-grasp
          :parameters (o8)
          :precondition (graspable o8)
          :effect (isgrasp o8 #g3)
   )
   (:action s16_plan-base-motion
          :parameters (q976 q976)
          :precondition (and (isbconf q976) (isbconf q976))
          :effect (basemotion q976 #t0 q976)
   )
   (:action s17_inverse-kinematics
          :parameters ('left' o5 p408 #g0)
          :precondition (and (controllable 'left') (ispose o5 p408) (isgrasp o5 #g0))
          :effect (and (isbconf #q0) (kin 'left' o5 p408 #g0 #q0 #t1))
   )
   (:action s18_inverse-kinematics
          :parameters ('left' o6 p504 #g1)
          :precondition (and (controllable 'left') (ispose o6 p504) (isgrasp o6 #g1))
          :effect (and (isbconf #q1) (kin 'left' o6 p504 #g1 #q1 #t2))
   )
   (:action s19_inverse-kinematics
          :parameters ('left' o7 p744 #g2)
          :precondition (and (controllable 'left') (ispose o7 p744) (isgrasp o7 #g2))
          :effect (and (isbconf #q2) (kin 'left' o7 p744 #g2 #q2 #t3))
   )
   (:action s20_inverse-kinematics
          :parameters ('left' o8 p840 #g3)
          :precondition (and (controllable 'left') (ispose o8 p840) (isgrasp o8 #g3))
          :effect (and (isbconf #q3) (kin 'left' o8 p840 #g3 #q3 #t4))
   )
   (:action s21_inverse-kinematics
          :parameters ('left' o5 #p0 #g0)
          :precondition (and (controllable 'left') (ispose o5 #p0) (isgrasp o5 #g0))
          :effect (and (isbconf #q4) (kin 'left' o5 #p0 #g0 #q4 #t5))
   )
   (:action s22_inverse-kinematics
          :parameters ('left' o5 #p1 #g0)
          :precondition (and (controllable 'left') (ispose o5 #p1) (isgrasp o5 #g0))
          :effect (and (isbconf #q5) (kin 'left' o5 #p1 #g0 #q5 #t6))
   )
   (:action s23_inverse-kinematics
          :parameters ('left' o5 #p2 #g0)
          :precondition (and (controllable 'left') (ispose o5 #p2) (isgrasp o5 #g0))
          :effect (and (isbconf #q6) (kin 'left' o5 #p2 #g0 #q6 #t7))
   )
   (:action s24_inverse-kinematics
          :parameters ('left' o6 #p3 #g1)
          :precondition (and (controllable 'left') (ispose o6 #p3) (isgrasp o6 #g1))
          :effect (and (isbconf #q7) (kin 'left' o6 #p3 #g1 #q7 #t8))
   )
   (:action s25_inverse-kinematics
          :parameters ('left' o6 #p4 #g1)
          :precondition (and (controllable 'left') (ispose o6 #p4) (isgrasp o6 #g1))
          :effect (and (isbconf #q8) (kin 'left' o6 #p4 #g1 #q8 #t9))
   )
   (:action s26_inverse-kinematics
          :parameters ('left' o6 #p5 #g1)
          :precondition (and (controllable 'left') (ispose o6 #p5) (isgrasp o6 #g1))
          :effect (and (isbconf #q9) (kin 'left' o6 #p5 #g1 #q9 #t10))
   )
   (:action s27_inverse-kinematics
          :parameters ('left' o7 #p6 #g2)
          :precondition (and (controllable 'left') (ispose o7 #p6) (isgrasp o7 #g2))
          :effect (and (isbconf #q10) (kin 'left' o7 #p6 #g2 #q10 #t11))
   )
   (:action s28_inverse-kinematics
          :parameters ('left' o7 #p7 #g2)
          :precondition (and (controllable 'left') (ispose o7 #p7) (isgrasp o7 #g2))
          :effect (and (isbconf #q11) (kin 'left' o7 #p7 #g2 #q11 #t12))
   )
   (:action s29_inverse-kinematics
          :parameters ('left' o7 #p8 #g2)
          :precondition (and (controllable 'left') (ispose o7 #p8) (isgrasp o7 #g2))
          :effect (and (isbconf #q12) (kin 'left' o7 #p8 #g2 #q12 #t13))
   )
   (:action s30_inverse-kinematics
          :parameters ('left' o8 #p9 #g3)
          :precondition (and (controllable 'left') (ispose o8 #p9) (isgrasp o8 #g3))
          :effect (and (isbconf #q13) (kin 'left' o8 #p9 #g3 #q13 #t14))
   )
   (:action s31_inverse-kinematics
          :parameters ('left' o8 #p10 #g3)
          :precondition (and (controllable 'left') (ispose o8 #p10) (isgrasp o8 #g3))
          :effect (and (isbconf #q14) (kin 'left' o8 #p10 #g3 #q14 #t15))
   )
   (:action s32_inverse-kinematics
          :parameters ('left' o8 #p11 #g3)
          :precondition (and (controllable 'left') (ispose o8 #p11) (isgrasp o8 #g3))
          :effect (and (isbconf #q15) (kin 'left' o8 #p11 #g3 #q15 #t16))
   )
   (:action s33_plan-base-motion
          :parameters (q976 #q0)
          :precondition (and (isbconf q976) (isbconf #q0))
          :effect (basemotion q976 #t17 #q0)
   )
   (:action s34_plan-base-motion
          :parameters (q976 #q1)
          :precondition (and (isbconf q976) (isbconf #q1))
          :effect (basemotion q976 #t18 #q1)
   )
   (:action s35_plan-base-motion
          :parameters (q976 #q2)
          :precondition (and (isbconf q976) (isbconf #q2))
          :effect (basemotion q976 #t19 #q2)
   )
   (:action s36_plan-base-motion
          :parameters (q976 #q3)
          :precondition (and (isbconf q976) (isbconf #q3))
          :effect (basemotion q976 #t20 #q3)
   )
   (:action s37_plan-base-motion
          :parameters (q976 #q4)
          :precondition (and (isbconf q976) (isbconf #q4))
          :effect (basemotion q976 #t21 #q4)
   )
   (:action s38_plan-base-motion
          :parameters (q976 #q5)
          :precondition (and (isbconf q976) (isbconf #q5))
          :effect (basemotion q976 #t22 #q5)
   )
   (:action s39_plan-base-motion
          :parameters (q976 #q6)
          :precondition (and (isbconf q976) (isbconf #q6))
          :effect (basemotion q976 #t23 #q6)
   )
   (:action s40_plan-base-motion
          :parameters (q976 #q7)
          :precondition (and (isbconf q976) (isbconf #q7))
          :effect (basemotion q976 #t24 #q7)
   )
   (:action s41_plan-base-motion
          :parameters (q976 #q8)
          :precondition (and (isbconf q976) (isbconf #q8))
          :effect (basemotion q976 #t25 #q8)
   )
   (:action s42_plan-base-motion
          :parameters (q976 #q9)
          :precondition (and (isbconf q976) (isbconf #q9))
          :effect (basemotion q976 #t26 #q9)
   )
   (:action s43_plan-base-motion
          :parameters (q976 #q10)
          :precondition (and (isbconf q976) (isbconf #q10))
          :effect (basemotion q976 #t27 #q10)
   )
   (:action s44_plan-base-motion
          :parameters (q976 #q11)
          :precondition (and (isbconf q976) (isbconf #q11))
          :effect (basemotion q976 #t28 #q11)
   )
   (:action s45_plan-base-motion
          :parameters (q976 #q12)
          :precondition (and (isbconf q976) (isbconf #q12))
          :effect (basemotion q976 #t29 #q12)
   )
   (:action s46_plan-base-motion
          :parameters (q976 #q13)
          :precondition (and (isbconf q976) (isbconf #q13))
          :effect (basemotion q976 #t30 #q13)
   )
   (:action s47_plan-base-motion
          :parameters (q976 #q14)
          :precondition (and (isbconf q976) (isbconf #q14))
          :effect (basemotion q976 #t31 #q14)
   )
   (:action s48_plan-base-motion
          :parameters (q976 #q15)
          :precondition (and (isbconf q976) (isbconf #q15))
          :effect (basemotion q976 #t32 #q15)
   )
   (:action s49_plan-base-motion
          :parameters (#q0 q976)
          :precondition (and (isbconf #q0) (isbconf q976))
          :effect (basemotion #q0 #t33 q976)
   )
   (:action s50_plan-base-motion
          :parameters (#q0 #q0)
          :precondition (and (isbconf #q0) (isbconf #q0))
          :effect (basemotion #q0 #t34 #q0)
   )
   (:action s51_plan-base-motion
          :parameters (#q0 #q1)
          :precondition (and (isbconf #q0) (isbconf #q1))
          :effect (basemotion #q0 #t35 #q1)
   )
   (:action s52_plan-base-motion
          :parameters (#q0 #q2)
          :precondition (and (isbconf #q0) (isbconf #q2))
          :effect (basemotion #q0 #t36 #q2)
   )
   (:action s53_plan-base-motion
          :parameters (#q0 #q3)
          :precondition (and (isbconf #q0) (isbconf #q3))
          :effect (basemotion #q0 #t37 #q3)
   )
   (:action s54_plan-base-motion
          :parameters (#q0 #q4)
          :precondition (and (isbconf #q0) (isbconf #q4))
          :effect (basemotion #q0 #t38 #q4)
   )
   (:action s55_plan-base-motion
          :parameters (#q0 #q5)
          :precondition (and (isbconf #q0) (isbconf #q5))
          :effect (basemotion #q0 #t39 #q5)
   )
   (:action s56_plan-base-motion
          :parameters (#q0 #q6)
          :precondition (and (isbconf #q0) (isbconf #q6))
          :effect (basemotion #q0 #t40 #q6)
   )
   (:action s57_plan-base-motion
          :parameters (#q0 #q7)
          :precondition (and (isbconf #q0) (isbconf #q7))
          :effect (basemotion #q0 #t41 #q7)
   )
   (:action s58_plan-base-motion
          :parameters (#q0 #q8)
          :precondition (and (isbconf #q0) (isbconf #q8))
          :effect (basemotion #q0 #t42 #q8)
   )
   (:action s59_plan-base-motion
          :parameters (#q0 #q9)
          :precondition (and (isbconf #q0) (isbconf #q9))
          :effect (basemotion #q0 #t43 #q9)
   )
   (:action s60_plan-base-motion
          :parameters (#q0 #q10)
          :precondition (and (isbconf #q0) (isbconf #q10))
          :effect (basemotion #q0 #t44 #q10)
   )
   (:action s61_plan-base-motion
          :parameters (#q0 #q11)
          :precondition (and (isbconf #q0) (isbconf #q11))
          :effect (basemotion #q0 #t45 #q11)
   )
   (:action s62_plan-base-motion
          :parameters (#q0 #q12)
          :precondition (and (isbconf #q0) (isbconf #q12))
          :effect (basemotion #q0 #t46 #q12)
   )
   (:action s63_plan-base-motion
          :parameters (#q0 #q13)
          :precondition (and (isbconf #q0) (isbconf #q13))
          :effect (basemotion #q0 #t47 #q13)
   )
   (:action s64_plan-base-motion
          :parameters (#q0 #q14)
          :precondition (and (isbconf #q0) (isbconf #q14))
          :effect (basemotion #q0 #t48 #q14)
   )
   (:action s65_plan-base-motion
          :parameters (#q0 #q15)
          :precondition (and (isbconf #q0) (isbconf #q15))
          :effect (basemotion #q0 #t49 #q15)
   )
   (:action s66_plan-base-motion
          :parameters (#q1 q976)
          :precondition (and (isbconf #q1) (isbconf q976))
          :effect (basemotion #q1 #t50 q976)
   )
   (:action s67_plan-base-motion
          :parameters (#q1 #q0)
          :precondition (and (isbconf #q1) (isbconf #q0))
          :effect (basemotion #q1 #t51 #q0)
   )
   (:action s68_plan-base-motion
          :parameters (#q1 #q1)
          :precondition (and (isbconf #q1) (isbconf #q1))
          :effect (basemotion #q1 #t52 #q1)
   )
   (:action s69_plan-base-motion
          :parameters (#q1 #q2)
          :precondition (and (isbconf #q1) (isbconf #q2))
          :effect (basemotion #q1 #t53 #q2)
   )
   (:action s70_plan-base-motion
          :parameters (#q1 #q3)
          :precondition (and (isbconf #q1) (isbconf #q3))
          :effect (basemotion #q1 #t54 #q3)
   )
   (:action s71_plan-base-motion
          :parameters (#q1 #q4)
          :precondition (and (isbconf #q1) (isbconf #q4))
          :effect (basemotion #q1 #t55 #q4)
   )
   (:action s72_plan-base-motion
          :parameters (#q1 #q5)
          :precondition (and (isbconf #q1) (isbconf #q5))
          :effect (basemotion #q1 #t56 #q5)
   )
   (:action s73_plan-base-motion
          :parameters (#q1 #q6)
          :precondition (and (isbconf #q1) (isbconf #q6))
          :effect (basemotion #q1 #t57 #q6)
   )
   (:action s74_plan-base-motion
          :parameters (#q1 #q7)
          :precondition (and (isbconf #q1) (isbconf #q7))
          :effect (basemotion #q1 #t58 #q7)
   )
   (:action s75_plan-base-motion
          :parameters (#q1 #q8)
          :precondition (and (isbconf #q1) (isbconf #q8))
          :effect (basemotion #q1 #t59 #q8)
   )
   (:action s76_plan-base-motion
          :parameters (#q1 #q9)
          :precondition (and (isbconf #q1) (isbconf #q9))
          :effect (basemotion #q1 #t60 #q9)
   )
   (:action s77_plan-base-motion
          :parameters (#q1 #q10)
          :precondition (and (isbconf #q1) (isbconf #q10))
          :effect (basemotion #q1 #t61 #q10)
   )
   (:action s78_plan-base-motion
          :parameters (#q1 #q11)
          :precondition (and (isbconf #q1) (isbconf #q11))
          :effect (basemotion #q1 #t62 #q11)
   )
   (:action s79_plan-base-motion
          :parameters (#q1 #q12)
          :precondition (and (isbconf #q1) (isbconf #q12))
          :effect (basemotion #q1 #t63 #q12)
   )
   (:action s80_plan-base-motion
          :parameters (#q1 #q13)
          :precondition (and (isbconf #q1) (isbconf #q13))
          :effect (basemotion #q1 #t64 #q13)
   )
   (:action s81_plan-base-motion
          :parameters (#q1 #q14)
          :precondition (and (isbconf #q1) (isbconf #q14))
          :effect (basemotion #q1 #t65 #q14)
   )
   (:action s82_plan-base-motion
          :parameters (#q1 #q15)
          :precondition (and (isbconf #q1) (isbconf #q15))
          :effect (basemotion #q1 #t66 #q15)
   )
   (:action s83_plan-base-motion
          :parameters (#q2 q976)
          :precondition (and (isbconf #q2) (isbconf q976))
          :effect (basemotion #q2 #t67 q976)
   )
   (:action s84_plan-base-motion
          :parameters (#q2 #q0)
          :precondition (and (isbconf #q2) (isbconf #q0))
          :effect (basemotion #q2 #t68 #q0)
   )
   (:action s85_plan-base-motion
          :parameters (#q2 #q1)
          :precondition (and (isbconf #q2) (isbconf #q1))
          :effect (basemotion #q2 #t69 #q1)
   )
   (:action s86_plan-base-motion
          :parameters (#q2 #q2)
          :precondition (and (isbconf #q2) (isbconf #q2))
          :effect (basemotion #q2 #t70 #q2)
   )
   (:action s87_plan-base-motion
          :parameters (#q2 #q3)
          :precondition (and (isbconf #q2) (isbconf #q3))
          :effect (basemotion #q2 #t71 #q3)
   )
   (:action s88_plan-base-motion
          :parameters (#q2 #q4)
          :precondition (and (isbconf #q2) (isbconf #q4))
          :effect (basemotion #q2 #t72 #q4)
   )
   (:action s89_plan-base-motion
          :parameters (#q2 #q5)
          :precondition (and (isbconf #q2) (isbconf #q5))
          :effect (basemotion #q2 #t73 #q5)
   )
   (:action s90_plan-base-motion
          :parameters (#q2 #q6)
          :precondition (and (isbconf #q2) (isbconf #q6))
          :effect (basemotion #q2 #t74 #q6)
   )
   (:action s91_plan-base-motion
          :parameters (#q2 #q7)
          :precondition (and (isbconf #q2) (isbconf #q7))
          :effect (basemotion #q2 #t75 #q7)
   )
   (:action s92_plan-base-motion
          :parameters (#q2 #q8)
          :precondition (and (isbconf #q2) (isbconf #q8))
          :effect (basemotion #q2 #t76 #q8)
   )
   (:action s93_plan-base-motion
          :parameters (#q2 #q9)
          :precondition (and (isbconf #q2) (isbconf #q9))
          :effect (basemotion #q2 #t77 #q9)
   )
   (:action s94_plan-base-motion
          :parameters (#q2 #q10)
          :precondition (and (isbconf #q2) (isbconf #q10))
          :effect (basemotion #q2 #t78 #q10)
   )
   (:action s95_plan-base-motion
          :parameters (#q2 #q11)
          :precondition (and (isbconf #q2) (isbconf #q11))
          :effect (basemotion #q2 #t79 #q11)
   )
   (:action s96_plan-base-motion
          :parameters (#q2 #q12)
          :precondition (and (isbconf #q2) (isbconf #q12))
          :effect (basemotion #q2 #t80 #q12)
   )
   (:action s97_plan-base-motion
          :parameters (#q2 #q13)
          :precondition (and (isbconf #q2) (isbconf #q13))
          :effect (basemotion #q2 #t81 #q13)
   )
   (:action s98_plan-base-motion
          :parameters (#q2 #q14)
          :precondition (and (isbconf #q2) (isbconf #q14))
          :effect (basemotion #q2 #t82 #q14)
   )
   (:action s99_plan-base-motion
          :parameters (#q2 #q15)
          :precondition (and (isbconf #q2) (isbconf #q15))
          :effect (basemotion #q2 #t83 #q15)
   )
   (:action s100_plan-base-motion
          :parameters (#q3 q976)
          :precondition (and (isbconf #q3) (isbconf q976))
          :effect (basemotion #q3 #t84 q976)
   )
   (:action s101_plan-base-motion
          :parameters (#q3 #q0)
          :precondition (and (isbconf #q3) (isbconf #q0))
          :effect (basemotion #q3 #t85 #q0)
   )
   (:action s102_plan-base-motion
          :parameters (#q3 #q1)
          :precondition (and (isbconf #q3) (isbconf #q1))
          :effect (basemotion #q3 #t86 #q1)
   )
   (:action s103_plan-base-motion
          :parameters (#q3 #q2)
          :precondition (and (isbconf #q3) (isbconf #q2))
          :effect (basemotion #q3 #t87 #q2)
   )
   (:action s104_plan-base-motion
          :parameters (#q3 #q3)
          :precondition (and (isbconf #q3) (isbconf #q3))
          :effect (basemotion #q3 #t88 #q3)
   )
   (:action s105_plan-base-motion
          :parameters (#q3 #q4)
          :precondition (and (isbconf #q3) (isbconf #q4))
          :effect (basemotion #q3 #t89 #q4)
   )
   (:action s106_plan-base-motion
          :parameters (#q3 #q5)
          :precondition (and (isbconf #q3) (isbconf #q5))
          :effect (basemotion #q3 #t90 #q5)
   )
   (:action s107_plan-base-motion
          :parameters (#q3 #q6)
          :precondition (and (isbconf #q3) (isbconf #q6))
          :effect (basemotion #q3 #t91 #q6)
   )
   (:action s108_plan-base-motion
          :parameters (#q3 #q7)
          :precondition (and (isbconf #q3) (isbconf #q7))
          :effect (basemotion #q3 #t92 #q7)
   )
   (:action s109_plan-base-motion
          :parameters (#q3 #q8)
          :precondition (and (isbconf #q3) (isbconf #q8))
          :effect (basemotion #q3 #t93 #q8)
   )
   (:action s110_plan-base-motion
          :parameters (#q3 #q9)
          :precondition (and (isbconf #q3) (isbconf #q9))
          :effect (basemotion #q3 #t94 #q9)
   )
   (:action s111_plan-base-motion
          :parameters (#q3 #q10)
          :precondition (and (isbconf #q3) (isbconf #q10))
          :effect (basemotion #q3 #t95 #q10)
   )
   (:action s112_plan-base-motion
          :parameters (#q3 #q11)
          :precondition (and (isbconf #q3) (isbconf #q11))
          :effect (basemotion #q3 #t96 #q11)
   )
   (:action s113_plan-base-motion
          :parameters (#q3 #q12)
          :precondition (and (isbconf #q3) (isbconf #q12))
          :effect (basemotion #q3 #t97 #q12)
   )
   (:action s114_plan-base-motion
          :parameters (#q3 #q13)
          :precondition (and (isbconf #q3) (isbconf #q13))
          :effect (basemotion #q3 #t98 #q13)
   )
   (:action s115_plan-base-motion
          :parameters (#q3 #q14)
          :precondition (and (isbconf #q3) (isbconf #q14))
          :effect (basemotion #q3 #t99 #q14)
   )
   (:action s116_plan-base-motion
          :parameters (#q3 #q15)
          :precondition (and (isbconf #q3) (isbconf #q15))
          :effect (basemotion #q3 #t100 #q15)
   )
   (:action s117_plan-base-motion
          :parameters (#q4 q976)
          :precondition (and (isbconf #q4) (isbconf q976))
          :effect (basemotion #q4 #t101 q976)
   )
   (:action s118_plan-base-motion
          :parameters (#q4 #q0)
          :precondition (and (isbconf #q4) (isbconf #q0))
          :effect (basemotion #q4 #t102 #q0)
   )
   (:action s119_plan-base-motion
          :parameters (#q4 #q1)
          :precondition (and (isbconf #q4) (isbconf #q1))
          :effect (basemotion #q4 #t103 #q1)
   )
   (:action s120_plan-base-motion
          :parameters (#q4 #q2)
          :precondition (and (isbconf #q4) (isbconf #q2))
          :effect (basemotion #q4 #t104 #q2)
   )
   (:action s121_plan-base-motion
          :parameters (#q4 #q3)
          :precondition (and (isbconf #q4) (isbconf #q3))
          :effect (basemotion #q4 #t105 #q3)
   )
   (:action s122_plan-base-motion
          :parameters (#q4 #q4)
          :precondition (and (isbconf #q4) (isbconf #q4))
          :effect (basemotion #q4 #t106 #q4)
   )
   (:action s123_plan-base-motion
          :parameters (#q4 #q5)
          :precondition (and (isbconf #q4) (isbconf #q5))
          :effect (basemotion #q4 #t107 #q5)
   )
   (:action s124_plan-base-motion
          :parameters (#q4 #q6)
          :precondition (and (isbconf #q4) (isbconf #q6))
          :effect (basemotion #q4 #t108 #q6)
   )
   (:action s125_plan-base-motion
          :parameters (#q4 #q7)
          :precondition (and (isbconf #q4) (isbconf #q7))
          :effect (basemotion #q4 #t109 #q7)
   )
   (:action s126_plan-base-motion
          :parameters (#q4 #q8)
          :precondition (and (isbconf #q4) (isbconf #q8))
          :effect (basemotion #q4 #t110 #q8)
   )
   (:action s127_plan-base-motion
          :parameters (#q4 #q9)
          :precondition (and (isbconf #q4) (isbconf #q9))
          :effect (basemotion #q4 #t111 #q9)
   )
   (:action s128_plan-base-motion
          :parameters (#q4 #q10)
          :precondition (and (isbconf #q4) (isbconf #q10))
          :effect (basemotion #q4 #t112 #q10)
   )
   (:action s129_plan-base-motion
          :parameters (#q4 #q11)
          :precondition (and (isbconf #q4) (isbconf #q11))
          :effect (basemotion #q4 #t113 #q11)
   )
   (:action s130_plan-base-motion
          :parameters (#q4 #q12)
          :precondition (and (isbconf #q4) (isbconf #q12))
          :effect (basemotion #q4 #t114 #q12)
   )
   (:action s131_plan-base-motion
          :parameters (#q4 #q13)
          :precondition (and (isbconf #q4) (isbconf #q13))
          :effect (basemotion #q4 #t115 #q13)
   )
   (:action s132_plan-base-motion
          :parameters (#q4 #q14)
          :precondition (and (isbconf #q4) (isbconf #q14))
          :effect (basemotion #q4 #t116 #q14)
   )
   (:action s133_plan-base-motion
          :parameters (#q4 #q15)
          :precondition (and (isbconf #q4) (isbconf #q15))
          :effect (basemotion #q4 #t117 #q15)
   )
   (:action s134_plan-base-motion
          :parameters (#q5 q976)
          :precondition (and (isbconf #q5) (isbconf q976))
          :effect (basemotion #q5 #t118 q976)
   )
   (:action s135_plan-base-motion
          :parameters (#q5 #q0)
          :precondition (and (isbconf #q5) (isbconf #q0))
          :effect (basemotion #q5 #t119 #q0)
   )
   (:action s136_plan-base-motion
          :parameters (#q5 #q1)
          :precondition (and (isbconf #q5) (isbconf #q1))
          :effect (basemotion #q5 #t120 #q1)
   )
   (:action s137_plan-base-motion
          :parameters (#q5 #q2)
          :precondition (and (isbconf #q5) (isbconf #q2))
          :effect (basemotion #q5 #t121 #q2)
   )
   (:action s138_plan-base-motion
          :parameters (#q5 #q3)
          :precondition (and (isbconf #q5) (isbconf #q3))
          :effect (basemotion #q5 #t122 #q3)
   )
   (:action s139_plan-base-motion
          :parameters (#q5 #q4)
          :precondition (and (isbconf #q5) (isbconf #q4))
          :effect (basemotion #q5 #t123 #q4)
   )
   (:action s140_plan-base-motion
          :parameters (#q5 #q5)
          :precondition (and (isbconf #q5) (isbconf #q5))
          :effect (basemotion #q5 #t124 #q5)
   )
   (:action s141_plan-base-motion
          :parameters (#q5 #q6)
          :precondition (and (isbconf #q5) (isbconf #q6))
          :effect (basemotion #q5 #t125 #q6)
   )
   (:action s142_plan-base-motion
          :parameters (#q5 #q7)
          :precondition (and (isbconf #q5) (isbconf #q7))
          :effect (basemotion #q5 #t126 #q7)
   )
   (:action s143_plan-base-motion
          :parameters (#q5 #q8)
          :precondition (and (isbconf #q5) (isbconf #q8))
          :effect (basemotion #q5 #t127 #q8)
   )
   (:action s144_plan-base-motion
          :parameters (#q5 #q9)
          :precondition (and (isbconf #q5) (isbconf #q9))
          :effect (basemotion #q5 #t128 #q9)
   )
   (:action s145_plan-base-motion
          :parameters (#q5 #q10)
          :precondition (and (isbconf #q5) (isbconf #q10))
          :effect (basemotion #q5 #t129 #q10)
   )
   (:action s146_plan-base-motion
          :parameters (#q5 #q11)
          :precondition (and (isbconf #q5) (isbconf #q11))
          :effect (basemotion #q5 #t130 #q11)
   )
   (:action s147_plan-base-motion
          :parameters (#q5 #q12)
          :precondition (and (isbconf #q5) (isbconf #q12))
          :effect (basemotion #q5 #t131 #q12)
   )
   (:action s148_plan-base-motion
          :parameters (#q5 #q13)
          :precondition (and (isbconf #q5) (isbconf #q13))
          :effect (basemotion #q5 #t132 #q13)
   )
   (:action s149_plan-base-motion
          :parameters (#q5 #q14)
          :precondition (and (isbconf #q5) (isbconf #q14))
          :effect (basemotion #q5 #t133 #q14)
   )
   (:action s150_plan-base-motion
          :parameters (#q5 #q15)
          :precondition (and (isbconf #q5) (isbconf #q15))
          :effect (basemotion #q5 #t134 #q15)
   )
   (:action s151_plan-base-motion
          :parameters (#q6 q976)
          :precondition (and (isbconf #q6) (isbconf q976))
          :effect (basemotion #q6 #t135 q976)
   )
   (:action s152_plan-base-motion
          :parameters (#q6 #q0)
          :precondition (and (isbconf #q6) (isbconf #q0))
          :effect (basemotion #q6 #t136 #q0)
   )
   (:action s153_plan-base-motion
          :parameters (#q6 #q1)
          :precondition (and (isbconf #q6) (isbconf #q1))
          :effect (basemotion #q6 #t137 #q1)
   )
   (:action s154_plan-base-motion
          :parameters (#q6 #q2)
          :precondition (and (isbconf #q6) (isbconf #q2))
          :effect (basemotion #q6 #t138 #q2)
   )
   (:action s155_plan-base-motion
          :parameters (#q6 #q3)
          :precondition (and (isbconf #q6) (isbconf #q3))
          :effect (basemotion #q6 #t139 #q3)
   )
   (:action s156_plan-base-motion
          :parameters (#q6 #q4)
          :precondition (and (isbconf #q6) (isbconf #q4))
          :effect (basemotion #q6 #t140 #q4)
   )
   (:action s157_plan-base-motion
          :parameters (#q6 #q5)
          :precondition (and (isbconf #q6) (isbconf #q5))
          :effect (basemotion #q6 #t141 #q5)
   )
   (:action s158_plan-base-motion
          :parameters (#q6 #q6)
          :precondition (and (isbconf #q6) (isbconf #q6))
          :effect (basemotion #q6 #t142 #q6)
   )
   (:action s159_plan-base-motion
          :parameters (#q6 #q7)
          :precondition (and (isbconf #q6) (isbconf #q7))
          :effect (basemotion #q6 #t143 #q7)
   )
   (:action s160_plan-base-motion
          :parameters (#q6 #q8)
          :precondition (and (isbconf #q6) (isbconf #q8))
          :effect (basemotion #q6 #t144 #q8)
   )
   (:action s161_plan-base-motion
          :parameters (#q6 #q9)
          :precondition (and (isbconf #q6) (isbconf #q9))
          :effect (basemotion #q6 #t145 #q9)
   )
   (:action s162_plan-base-motion
          :parameters (#q6 #q10)
          :precondition (and (isbconf #q6) (isbconf #q10))
          :effect (basemotion #q6 #t146 #q10)
   )
   (:action s163_plan-base-motion
          :parameters (#q6 #q11)
          :precondition (and (isbconf #q6) (isbconf #q11))
          :effect (basemotion #q6 #t147 #q11)
   )
   (:action s164_plan-base-motion
          :parameters (#q6 #q12)
          :precondition (and (isbconf #q6) (isbconf #q12))
          :effect (basemotion #q6 #t148 #q12)
   )
   (:action s165_plan-base-motion
          :parameters (#q6 #q13)
          :precondition (and (isbconf #q6) (isbconf #q13))
          :effect (basemotion #q6 #t149 #q13)
   )
   (:action s166_plan-base-motion
          :parameters (#q6 #q14)
          :precondition (and (isbconf #q6) (isbconf #q14))
          :effect (basemotion #q6 #t150 #q14)
   )
   (:action s167_plan-base-motion
          :parameters (#q6 #q15)
          :precondition (and (isbconf #q6) (isbconf #q15))
          :effect (basemotion #q6 #t151 #q15)
   )
   (:action s168_plan-base-motion
          :parameters (#q7 q976)
          :precondition (and (isbconf #q7) (isbconf q976))
          :effect (basemotion #q7 #t152 q976)
   )
   (:action s169_plan-base-motion
          :parameters (#q7 #q0)
          :precondition (and (isbconf #q7) (isbconf #q0))
          :effect (basemotion #q7 #t153 #q0)
   )
   (:action s170_plan-base-motion
          :parameters (#q7 #q1)
          :precondition (and (isbconf #q7) (isbconf #q1))
          :effect (basemotion #q7 #t154 #q1)
   )
   (:action s171_plan-base-motion
          :parameters (#q7 #q2)
          :precondition (and (isbconf #q7) (isbconf #q2))
          :effect (basemotion #q7 #t155 #q2)
   )
   (:action s172_plan-base-motion
          :parameters (#q7 #q3)
          :precondition (and (isbconf #q7) (isbconf #q3))
          :effect (basemotion #q7 #t156 #q3)
   )
   (:action s173_plan-base-motion
          :parameters (#q7 #q4)
          :precondition (and (isbconf #q7) (isbconf #q4))
          :effect (basemotion #q7 #t157 #q4)
   )
   (:action s174_plan-base-motion
          :parameters (#q7 #q5)
          :precondition (and (isbconf #q7) (isbconf #q5))
          :effect (basemotion #q7 #t158 #q5)
   )
   (:action s175_plan-base-motion
          :parameters (#q7 #q6)
          :precondition (and (isbconf #q7) (isbconf #q6))
          :effect (basemotion #q7 #t159 #q6)
   )
   (:action s176_plan-base-motion
          :parameters (#q7 #q7)
          :precondition (and (isbconf #q7) (isbconf #q7))
          :effect (basemotion #q7 #t160 #q7)
   )
   (:action s177_plan-base-motion
          :parameters (#q7 #q8)
          :precondition (and (isbconf #q7) (isbconf #q8))
          :effect (basemotion #q7 #t161 #q8)
   )
   (:action s178_plan-base-motion
          :parameters (#q7 #q9)
          :precondition (and (isbconf #q7) (isbconf #q9))
          :effect (basemotion #q7 #t162 #q9)
   )
   (:action s179_plan-base-motion
          :parameters (#q7 #q10)
          :precondition (and (isbconf #q7) (isbconf #q10))
          :effect (basemotion #q7 #t163 #q10)
   )
   (:action s180_plan-base-motion
          :parameters (#q7 #q11)
          :precondition (and (isbconf #q7) (isbconf #q11))
          :effect (basemotion #q7 #t164 #q11)
   )
   (:action s181_plan-base-motion
          :parameters (#q7 #q12)
          :precondition (and (isbconf #q7) (isbconf #q12))
          :effect (basemotion #q7 #t165 #q12)
   )
   (:action s182_plan-base-motion
          :parameters (#q7 #q13)
          :precondition (and (isbconf #q7) (isbconf #q13))
          :effect (basemotion #q7 #t166 #q13)
   )
   (:action s183_plan-base-motion
          :parameters (#q7 #q14)
          :precondition (and (isbconf #q7) (isbconf #q14))
          :effect (basemotion #q7 #t167 #q14)
   )
   (:action s184_plan-base-motion
          :parameters (#q7 #q15)
          :precondition (and (isbconf #q7) (isbconf #q15))
          :effect (basemotion #q7 #t168 #q15)
   )
   (:action s185_plan-base-motion
          :parameters (#q8 q976)
          :precondition (and (isbconf #q8) (isbconf q976))
          :effect (basemotion #q8 #t169 q976)
   )
   (:action s186_plan-base-motion
          :parameters (#q8 #q0)
          :precondition (and (isbconf #q8) (isbconf #q0))
          :effect (basemotion #q8 #t170 #q0)
   )
   (:action s187_plan-base-motion
          :parameters (#q8 #q1)
          :precondition (and (isbconf #q8) (isbconf #q1))
          :effect (basemotion #q8 #t171 #q1)
   )
   (:action s188_plan-base-motion
          :parameters (#q8 #q2)
          :precondition (and (isbconf #q8) (isbconf #q2))
          :effect (basemotion #q8 #t172 #q2)
   )
   (:action s189_plan-base-motion
          :parameters (#q8 #q3)
          :precondition (and (isbconf #q8) (isbconf #q3))
          :effect (basemotion #q8 #t173 #q3)
   )
   (:action s190_plan-base-motion
          :parameters (#q8 #q4)
          :precondition (and (isbconf #q8) (isbconf #q4))
          :effect (basemotion #q8 #t174 #q4)
   )
   (:action s191_plan-base-motion
          :parameters (#q8 #q5)
          :precondition (and (isbconf #q8) (isbconf #q5))
          :effect (basemotion #q8 #t175 #q5)
   )
   (:action s192_plan-base-motion
          :parameters (#q8 #q6)
          :precondition (and (isbconf #q8) (isbconf #q6))
          :effect (basemotion #q8 #t176 #q6)
   )
   (:action s193_plan-base-motion
          :parameters (#q8 #q7)
          :precondition (and (isbconf #q8) (isbconf #q7))
          :effect (basemotion #q8 #t177 #q7)
   )
   (:action s194_plan-base-motion
          :parameters (#q8 #q8)
          :precondition (and (isbconf #q8) (isbconf #q8))
          :effect (basemotion #q8 #t178 #q8)
   )
   (:action s195_plan-base-motion
          :parameters (#q8 #q9)
          :precondition (and (isbconf #q8) (isbconf #q9))
          :effect (basemotion #q8 #t179 #q9)
   )
   (:action s196_plan-base-motion
          :parameters (#q8 #q10)
          :precondition (and (isbconf #q8) (isbconf #q10))
          :effect (basemotion #q8 #t180 #q10)
   )
   (:action s197_plan-base-motion
          :parameters (#q8 #q11)
          :precondition (and (isbconf #q8) (isbconf #q11))
          :effect (basemotion #q8 #t181 #q11)
   )
   (:action s198_plan-base-motion
          :parameters (#q8 #q12)
          :precondition (and (isbconf #q8) (isbconf #q12))
          :effect (basemotion #q8 #t182 #q12)
   )
   (:action s199_plan-base-motion
          :parameters (#q8 #q13)
          :precondition (and (isbconf #q8) (isbconf #q13))
          :effect (basemotion #q8 #t183 #q13)
   )
   (:action s200_plan-base-motion
          :parameters (#q8 #q14)
          :precondition (and (isbconf #q8) (isbconf #q14))
          :effect (basemotion #q8 #t184 #q14)
   )
   (:action s201_plan-base-motion
          :parameters (#q8 #q15)
          :precondition (and (isbconf #q8) (isbconf #q15))
          :effect (basemotion #q8 #t185 #q15)
   )
   (:action s202_plan-base-motion
          :parameters (#q9 q976)
          :precondition (and (isbconf #q9) (isbconf q976))
          :effect (basemotion #q9 #t186 q976)
   )
   (:action s203_plan-base-motion
          :parameters (#q9 #q0)
          :precondition (and (isbconf #q9) (isbconf #q0))
          :effect (basemotion #q9 #t187 #q0)
   )
   (:action s204_plan-base-motion
          :parameters (#q9 #q1)
          :precondition (and (isbconf #q9) (isbconf #q1))
          :effect (basemotion #q9 #t188 #q1)
   )
   (:action s205_plan-base-motion
          :parameters (#q9 #q2)
          :precondition (and (isbconf #q9) (isbconf #q2))
          :effect (basemotion #q9 #t189 #q2)
   )
   (:action s206_plan-base-motion
          :parameters (#q9 #q3)
          :precondition (and (isbconf #q9) (isbconf #q3))
          :effect (basemotion #q9 #t190 #q3)
   )
   (:action s207_plan-base-motion
          :parameters (#q9 #q4)
          :precondition (and (isbconf #q9) (isbconf #q4))
          :effect (basemotion #q9 #t191 #q4)
   )
   (:action s208_plan-base-motion
          :parameters (#q9 #q5)
          :precondition (and (isbconf #q9) (isbconf #q5))
          :effect (basemotion #q9 #t192 #q5)
   )
   (:action s209_plan-base-motion
          :parameters (#q9 #q6)
          :precondition (and (isbconf #q9) (isbconf #q6))
          :effect (basemotion #q9 #t193 #q6)
   )
   (:action s210_plan-base-motion
          :parameters (#q9 #q7)
          :precondition (and (isbconf #q9) (isbconf #q7))
          :effect (basemotion #q9 #t194 #q7)
   )
   (:action s211_plan-base-motion
          :parameters (#q9 #q8)
          :precondition (and (isbconf #q9) (isbconf #q8))
          :effect (basemotion #q9 #t195 #q8)
   )
   (:action s212_plan-base-motion
          :parameters (#q9 #q9)
          :precondition (and (isbconf #q9) (isbconf #q9))
          :effect (basemotion #q9 #t196 #q9)
   )
   (:action s213_plan-base-motion
          :parameters (#q9 #q10)
          :precondition (and (isbconf #q9) (isbconf #q10))
          :effect (basemotion #q9 #t197 #q10)
   )
   (:action s214_plan-base-motion
          :parameters (#q9 #q11)
          :precondition (and (isbconf #q9) (isbconf #q11))
          :effect (basemotion #q9 #t198 #q11)
   )
   (:action s215_plan-base-motion
          :parameters (#q9 #q12)
          :precondition (and (isbconf #q9) (isbconf #q12))
          :effect (basemotion #q9 #t199 #q12)
   )
   (:action s216_plan-base-motion
          :parameters (#q9 #q13)
          :precondition (and (isbconf #q9) (isbconf #q13))
          :effect (basemotion #q9 #t200 #q13)
   )
   (:action s217_plan-base-motion
          :parameters (#q9 #q14)
          :precondition (and (isbconf #q9) (isbconf #q14))
          :effect (basemotion #q9 #t201 #q14)
   )
   (:action s218_plan-base-motion
          :parameters (#q9 #q15)
          :precondition (and (isbconf #q9) (isbconf #q15))
          :effect (basemotion #q9 #t202 #q15)
   )
   (:action s219_plan-base-motion
          :parameters (#q10 q976)
          :precondition (and (isbconf #q10) (isbconf q976))
          :effect (basemotion #q10 #t203 q976)
   )
   (:action s220_plan-base-motion
          :parameters (#q10 #q0)
          :precondition (and (isbconf #q10) (isbconf #q0))
          :effect (basemotion #q10 #t204 #q0)
   )
   (:action s221_plan-base-motion
          :parameters (#q10 #q1)
          :precondition (and (isbconf #q10) (isbconf #q1))
          :effect (basemotion #q10 #t205 #q1)
   )
   (:action s222_plan-base-motion
          :parameters (#q10 #q2)
          :precondition (and (isbconf #q10) (isbconf #q2))
          :effect (basemotion #q10 #t206 #q2)
   )
   (:action s223_plan-base-motion
          :parameters (#q10 #q3)
          :precondition (and (isbconf #q10) (isbconf #q3))
          :effect (basemotion #q10 #t207 #q3)
   )
   (:action s224_plan-base-motion
          :parameters (#q10 #q4)
          :precondition (and (isbconf #q10) (isbconf #q4))
          :effect (basemotion #q10 #t208 #q4)
   )
   (:action s225_plan-base-motion
          :parameters (#q10 #q5)
          :precondition (and (isbconf #q10) (isbconf #q5))
          :effect (basemotion #q10 #t209 #q5)
   )
   (:action s226_plan-base-motion
          :parameters (#q10 #q6)
          :precondition (and (isbconf #q10) (isbconf #q6))
          :effect (basemotion #q10 #t210 #q6)
   )
   (:action s227_plan-base-motion
          :parameters (#q10 #q7)
          :precondition (and (isbconf #q10) (isbconf #q7))
          :effect (basemotion #q10 #t211 #q7)
   )
   (:action s228_plan-base-motion
          :parameters (#q10 #q8)
          :precondition (and (isbconf #q10) (isbconf #q8))
          :effect (basemotion #q10 #t212 #q8)
   )
   (:action s229_plan-base-motion
          :parameters (#q10 #q9)
          :precondition (and (isbconf #q10) (isbconf #q9))
          :effect (basemotion #q10 #t213 #q9)
   )
   (:action s230_plan-base-motion
          :parameters (#q10 #q10)
          :precondition (and (isbconf #q10) (isbconf #q10))
          :effect (basemotion #q10 #t214 #q10)
   )
   (:action s231_plan-base-motion
          :parameters (#q10 #q11)
          :precondition (and (isbconf #q10) (isbconf #q11))
          :effect (basemotion #q10 #t215 #q11)
   )
   (:action s232_plan-base-motion
          :parameters (#q10 #q12)
          :precondition (and (isbconf #q10) (isbconf #q12))
          :effect (basemotion #q10 #t216 #q12)
   )
   (:action s233_plan-base-motion
          :parameters (#q10 #q13)
          :precondition (and (isbconf #q10) (isbconf #q13))
          :effect (basemotion #q10 #t217 #q13)
   )
   (:action s234_plan-base-motion
          :parameters (#q10 #q14)
          :precondition (and (isbconf #q10) (isbconf #q14))
          :effect (basemotion #q10 #t218 #q14)
   )
   (:action s235_plan-base-motion
          :parameters (#q10 #q15)
          :precondition (and (isbconf #q10) (isbconf #q15))
          :effect (basemotion #q10 #t219 #q15)
   )
   (:action s236_plan-base-motion
          :parameters (#q11 q976)
          :precondition (and (isbconf #q11) (isbconf q976))
          :effect (basemotion #q11 #t220 q976)
   )
   (:action s237_plan-base-motion
          :parameters (#q11 #q0)
          :precondition (and (isbconf #q11) (isbconf #q0))
          :effect (basemotion #q11 #t221 #q0)
   )
   (:action s238_plan-base-motion
          :parameters (#q11 #q1)
          :precondition (and (isbconf #q11) (isbconf #q1))
          :effect (basemotion #q11 #t222 #q1)
   )
   (:action s239_plan-base-motion
          :parameters (#q11 #q2)
          :precondition (and (isbconf #q11) (isbconf #q2))
          :effect (basemotion #q11 #t223 #q2)
   )
   (:action s240_plan-base-motion
          :parameters (#q11 #q3)
          :precondition (and (isbconf #q11) (isbconf #q3))
          :effect (basemotion #q11 #t224 #q3)
   )
   (:action s241_plan-base-motion
          :parameters (#q11 #q4)
          :precondition (and (isbconf #q11) (isbconf #q4))
          :effect (basemotion #q11 #t225 #q4)
   )
   (:action s242_plan-base-motion
          :parameters (#q11 #q5)
          :precondition (and (isbconf #q11) (isbconf #q5))
          :effect (basemotion #q11 #t226 #q5)
   )
   (:action s243_plan-base-motion
          :parameters (#q11 #q6)
          :precondition (and (isbconf #q11) (isbconf #q6))
          :effect (basemotion #q11 #t227 #q6)
   )
   (:action s244_plan-base-motion
          :parameters (#q11 #q7)
          :precondition (and (isbconf #q11) (isbconf #q7))
          :effect (basemotion #q11 #t228 #q7)
   )
   (:action s245_plan-base-motion
          :parameters (#q11 #q8)
          :precondition (and (isbconf #q11) (isbconf #q8))
          :effect (basemotion #q11 #t229 #q8)
   )
   (:action s246_plan-base-motion
          :parameters (#q11 #q9)
          :precondition (and (isbconf #q11) (isbconf #q9))
          :effect (basemotion #q11 #t230 #q9)
   )
   (:action s247_plan-base-motion
          :parameters (#q11 #q10)
          :precondition (and (isbconf #q11) (isbconf #q10))
          :effect (basemotion #q11 #t231 #q10)
   )
   (:action s248_plan-base-motion
          :parameters (#q11 #q11)
          :precondition (and (isbconf #q11) (isbconf #q11))
          :effect (basemotion #q11 #t232 #q11)
   )
   (:action s249_plan-base-motion
          :parameters (#q11 #q12)
          :precondition (and (isbconf #q11) (isbconf #q12))
          :effect (basemotion #q11 #t233 #q12)
   )
   (:action s250_plan-base-motion
          :parameters (#q11 #q13)
          :precondition (and (isbconf #q11) (isbconf #q13))
          :effect (basemotion #q11 #t234 #q13)
   )
   (:action s251_plan-base-motion
          :parameters (#q11 #q14)
          :precondition (and (isbconf #q11) (isbconf #q14))
          :effect (basemotion #q11 #t235 #q14)
   )
   (:action s252_plan-base-motion
          :parameters (#q11 #q15)
          :precondition (and (isbconf #q11) (isbconf #q15))
          :effect (basemotion #q11 #t236 #q15)
   )
   (:action s253_plan-base-motion
          :parameters (#q12 q976)
          :precondition (and (isbconf #q12) (isbconf q976))
          :effect (basemotion #q12 #t237 q976)
   )
   (:action s254_plan-base-motion
          :parameters (#q12 #q0)
          :precondition (and (isbconf #q12) (isbconf #q0))
          :effect (basemotion #q12 #t238 #q0)
   )
   (:action s255_plan-base-motion
          :parameters (#q12 #q1)
          :precondition (and (isbconf #q12) (isbconf #q1))
          :effect (basemotion #q12 #t239 #q1)
   )
   (:action s256_plan-base-motion
          :parameters (#q12 #q2)
          :precondition (and (isbconf #q12) (isbconf #q2))
          :effect (basemotion #q12 #t240 #q2)
   )
   (:action s257_plan-base-motion
          :parameters (#q12 #q3)
          :precondition (and (isbconf #q12) (isbconf #q3))
          :effect (basemotion #q12 #t241 #q3)
   )
   (:action s258_plan-base-motion
          :parameters (#q12 #q4)
          :precondition (and (isbconf #q12) (isbconf #q4))
          :effect (basemotion #q12 #t242 #q4)
   )
   (:action s259_plan-base-motion
          :parameters (#q12 #q5)
          :precondition (and (isbconf #q12) (isbconf #q5))
          :effect (basemotion #q12 #t243 #q5)
   )
   (:action s260_plan-base-motion
          :parameters (#q12 #q6)
          :precondition (and (isbconf #q12) (isbconf #q6))
          :effect (basemotion #q12 #t244 #q6)
   )
   (:action s261_plan-base-motion
          :parameters (#q12 #q7)
          :precondition (and (isbconf #q12) (isbconf #q7))
          :effect (basemotion #q12 #t245 #q7)
   )
   (:action s262_plan-base-motion
          :parameters (#q12 #q8)
          :precondition (and (isbconf #q12) (isbconf #q8))
          :effect (basemotion #q12 #t246 #q8)
   )
   (:action s263_plan-base-motion
          :parameters (#q12 #q9)
          :precondition (and (isbconf #q12) (isbconf #q9))
          :effect (basemotion #q12 #t247 #q9)
   )
   (:action s264_plan-base-motion
          :parameters (#q12 #q10)
          :precondition (and (isbconf #q12) (isbconf #q10))
          :effect (basemotion #q12 #t248 #q10)
   )
   (:action s265_plan-base-motion
          :parameters (#q12 #q11)
          :precondition (and (isbconf #q12) (isbconf #q11))
          :effect (basemotion #q12 #t249 #q11)
   )
   (:action s266_plan-base-motion
          :parameters (#q12 #q12)
          :precondition (and (isbconf #q12) (isbconf #q12))
          :effect (basemotion #q12 #t250 #q12)
   )
   (:action s267_plan-base-motion
          :parameters (#q12 #q13)
          :precondition (and (isbconf #q12) (isbconf #q13))
          :effect (basemotion #q12 #t251 #q13)
   )
   (:action s268_plan-base-motion
          :parameters (#q12 #q14)
          :precondition (and (isbconf #q12) (isbconf #q14))
          :effect (basemotion #q12 #t252 #q14)
   )
   (:action s269_plan-base-motion
          :parameters (#q12 #q15)
          :precondition (and (isbconf #q12) (isbconf #q15))
          :effect (basemotion #q12 #t253 #q15)
   )
   (:action s270_plan-base-motion
          :parameters (#q13 q976)
          :precondition (and (isbconf #q13) (isbconf q976))
          :effect (basemotion #q13 #t254 q976)
   )
   (:action s271_plan-base-motion
          :parameters (#q13 #q0)
          :precondition (and (isbconf #q13) (isbconf #q0))
          :effect (basemotion #q13 #t255 #q0)
   )
   (:action s272_plan-base-motion
          :parameters (#q13 #q1)
          :precondition (and (isbconf #q13) (isbconf #q1))
          :effect (basemotion #q13 #t256 #q1)
   )
   (:action s273_plan-base-motion
          :parameters (#q13 #q2)
          :precondition (and (isbconf #q13) (isbconf #q2))
          :effect (basemotion #q13 #t257 #q2)
   )
   (:action s274_plan-base-motion
          :parameters (#q13 #q3)
          :precondition (and (isbconf #q13) (isbconf #q3))
          :effect (basemotion #q13 #t258 #q3)
   )
   (:action s275_plan-base-motion
          :parameters (#q13 #q4)
          :precondition (and (isbconf #q13) (isbconf #q4))
          :effect (basemotion #q13 #t259 #q4)
   )
   (:action s276_plan-base-motion
          :parameters (#q13 #q5)
          :precondition (and (isbconf #q13) (isbconf #q5))
          :effect (basemotion #q13 #t260 #q5)
   )
   (:action s277_plan-base-motion
          :parameters (#q13 #q6)
          :precondition (and (isbconf #q13) (isbconf #q6))
          :effect (basemotion #q13 #t261 #q6)
   )
   (:action s278_plan-base-motion
          :parameters (#q13 #q7)
          :precondition (and (isbconf #q13) (isbconf #q7))
          :effect (basemotion #q13 #t262 #q7)
   )
   (:action s279_plan-base-motion
          :parameters (#q13 #q8)
          :precondition (and (isbconf #q13) (isbconf #q8))
          :effect (basemotion #q13 #t263 #q8)
   )
   (:action s280_plan-base-motion
          :parameters (#q13 #q9)
          :precondition (and (isbconf #q13) (isbconf #q9))
          :effect (basemotion #q13 #t264 #q9)
   )
   (:action s281_plan-base-motion
          :parameters (#q13 #q10)
          :precondition (and (isbconf #q13) (isbconf #q10))
          :effect (basemotion #q13 #t265 #q10)
   )
   (:action s282_plan-base-motion
          :parameters (#q13 #q11)
          :precondition (and (isbconf #q13) (isbconf #q11))
          :effect (basemotion #q13 #t266 #q11)
   )
   (:action s283_plan-base-motion
          :parameters (#q13 #q12)
          :precondition (and (isbconf #q13) (isbconf #q12))
          :effect (basemotion #q13 #t267 #q12)
   )
   (:action s284_plan-base-motion
          :parameters (#q13 #q13)
          :precondition (and (isbconf #q13) (isbconf #q13))
          :effect (basemotion #q13 #t268 #q13)
   )
   (:action s285_plan-base-motion
          :parameters (#q13 #q14)
          :precondition (and (isbconf #q13) (isbconf #q14))
          :effect (basemotion #q13 #t269 #q14)
   )
   (:action s286_plan-base-motion
          :parameters (#q13 #q15)
          :precondition (and (isbconf #q13) (isbconf #q15))
          :effect (basemotion #q13 #t270 #q15)
   )
   (:action s287_plan-base-motion
          :parameters (#q14 q976)
          :precondition (and (isbconf #q14) (isbconf q976))
          :effect (basemotion #q14 #t271 q976)
   )
   (:action s288_plan-base-motion
          :parameters (#q14 #q0)
          :precondition (and (isbconf #q14) (isbconf #q0))
          :effect (basemotion #q14 #t272 #q0)
   )
   (:action s289_plan-base-motion
          :parameters (#q14 #q1)
          :precondition (and (isbconf #q14) (isbconf #q1))
          :effect (basemotion #q14 #t273 #q1)
   )
   (:action s290_plan-base-motion
          :parameters (#q14 #q2)
          :precondition (and (isbconf #q14) (isbconf #q2))
          :effect (basemotion #q14 #t274 #q2)
   )
   (:action s291_plan-base-motion
          :parameters (#q14 #q3)
          :precondition (and (isbconf #q14) (isbconf #q3))
          :effect (basemotion #q14 #t275 #q3)
   )
   (:action s292_plan-base-motion
          :parameters (#q14 #q4)
          :precondition (and (isbconf #q14) (isbconf #q4))
          :effect (basemotion #q14 #t276 #q4)
   )
   (:action s293_plan-base-motion
          :parameters (#q14 #q5)
          :precondition (and (isbconf #q14) (isbconf #q5))
          :effect (basemotion #q14 #t277 #q5)
   )
   (:action s294_plan-base-motion
          :parameters (#q14 #q6)
          :precondition (and (isbconf #q14) (isbconf #q6))
          :effect (basemotion #q14 #t278 #q6)
   )
   (:action s295_plan-base-motion
          :parameters (#q14 #q7)
          :precondition (and (isbconf #q14) (isbconf #q7))
          :effect (basemotion #q14 #t279 #q7)
   )
   (:action s296_plan-base-motion
          :parameters (#q14 #q8)
          :precondition (and (isbconf #q14) (isbconf #q8))
          :effect (basemotion #q14 #t280 #q8)
   )
   (:action s297_plan-base-motion
          :parameters (#q14 #q9)
          :precondition (and (isbconf #q14) (isbconf #q9))
          :effect (basemotion #q14 #t281 #q9)
   )
   (:action s298_plan-base-motion
          :parameters (#q14 #q10)
          :precondition (and (isbconf #q14) (isbconf #q10))
          :effect (basemotion #q14 #t282 #q10)
   )
   (:action s299_plan-base-motion
          :parameters (#q14 #q11)
          :precondition (and (isbconf #q14) (isbconf #q11))
          :effect (basemotion #q14 #t283 #q11)
   )
   (:action s300_plan-base-motion
          :parameters (#q14 #q12)
          :precondition (and (isbconf #q14) (isbconf #q12))
          :effect (basemotion #q14 #t284 #q12)
   )
   (:action s301_plan-base-motion
          :parameters (#q14 #q13)
          :precondition (and (isbconf #q14) (isbconf #q13))
          :effect (basemotion #q14 #t285 #q13)
   )
   (:action s302_plan-base-motion
          :parameters (#q14 #q14)
          :precondition (and (isbconf #q14) (isbconf #q14))
          :effect (basemotion #q14 #t286 #q14)
   )
   (:action s303_plan-base-motion
          :parameters (#q14 #q15)
          :precondition (and (isbconf #q14) (isbconf #q15))
          :effect (basemotion #q14 #t287 #q15)
   )
   (:action s304_plan-base-motion
          :parameters (#q15 q976)
          :precondition (and (isbconf #q15) (isbconf q976))
          :effect (basemotion #q15 #t288 q976)
   )
   (:action s305_plan-base-motion
          :parameters (#q15 #q0)
          :precondition (and (isbconf #q15) (isbconf #q0))
          :effect (basemotion #q15 #t289 #q0)
   )
   (:action s306_plan-base-motion
          :parameters (#q15 #q1)
          :precondition (and (isbconf #q15) (isbconf #q1))
          :effect (basemotion #q15 #t290 #q1)
   )
   (:action s307_plan-base-motion
          :parameters (#q15 #q2)
          :precondition (and (isbconf #q15) (isbconf #q2))
          :effect (basemotion #q15 #t291 #q2)
   )
   (:action s308_plan-base-motion
          :parameters (#q15 #q3)
          :precondition (and (isbconf #q15) (isbconf #q3))
          :effect (basemotion #q15 #t292 #q3)
   )
   (:action s309_plan-base-motion
          :parameters (#q15 #q4)
          :precondition (and (isbconf #q15) (isbconf #q4))
          :effect (basemotion #q15 #t293 #q4)
   )
   (:action s310_plan-base-motion
          :parameters (#q15 #q5)
          :precondition (and (isbconf #q15) (isbconf #q5))
          :effect (basemotion #q15 #t294 #q5)
   )
   (:action s311_plan-base-motion
          :parameters (#q15 #q6)
          :precondition (and (isbconf #q15) (isbconf #q6))
          :effect (basemotion #q15 #t295 #q6)
   )
   (:action s312_plan-base-motion
          :parameters (#q15 #q7)
          :precondition (and (isbconf #q15) (isbconf #q7))
          :effect (basemotion #q15 #t296 #q7)
   )
   (:action s313_plan-base-motion
          :parameters (#q15 #q8)
          :precondition (and (isbconf #q15) (isbconf #q8))
          :effect (basemotion #q15 #t297 #q8)
   )
   (:action s314_plan-base-motion
          :parameters (#q15 #q9)
          :precondition (and (isbconf #q15) (isbconf #q9))
          :effect (basemotion #q15 #t298 #q9)
   )
   (:action s315_plan-base-motion
          :parameters (#q15 #q10)
          :precondition (and (isbconf #q15) (isbconf #q10))
          :effect (basemotion #q15 #t299 #q10)
   )
   (:action s316_plan-base-motion
          :parameters (#q15 #q11)
          :precondition (and (isbconf #q15) (isbconf #q11))
          :effect (basemotion #q15 #t300 #q11)
   )
   (:action s317_plan-base-motion
          :parameters (#q15 #q12)
          :precondition (and (isbconf #q15) (isbconf #q12))
          :effect (basemotion #q15 #t301 #q12)
   )
   (:action s318_plan-base-motion
          :parameters (#q15 #q13)
          :precondition (and (isbconf #q15) (isbconf #q13))
          :effect (basemotion #q15 #t302 #q13)
   )
   (:action s319_plan-base-motion
          :parameters (#q15 #q14)
          :precondition (and (isbconf #q15) (isbconf #q14))
          :effect (basemotion #q15 #t303 #q14)
   )
   (:action s320_plan-base-motion
          :parameters (#q15 #q15)
          :precondition (and (isbconf #q15) (isbconf #q15))
          :effect (basemotion #q15 #t304 #q15)
   )
)
