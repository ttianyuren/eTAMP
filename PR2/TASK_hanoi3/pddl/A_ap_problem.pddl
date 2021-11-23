;09:27:57 01/10

(define (problem put-wuti)
   (:domain pr2-tamp)

   (:objects
          o3 o4 o5 o6 o7 o8 - wuti
          #p0 #p1 #p10 #p11 #p12 #p13 #p14 #p15 #p16 #p17 #p18 #p19 #p2 #p20 #p21 #p22 #p23 #p24 #p3 #p4 #p5 #p6 #p7 #p8 #p9 p648 p704 p760 p816 p872 p928 - pose
          #a0 #a1 #a10 #a100 #a101 #a102 #a103 #a104 #a105 #a106 #a107 #a108 #a109 #a11 #a110 #a111 #a112 #a113 #a114 #a115 #a116 #a117 #a118 #a119 #a12 #a120 #a121 #a122 #a123 #a124 #a125 #a126 #a127 #a128 #a129 #a13 #a130 #a131 #a132 #a133 #a134 #a135 #a136 #a137 #a138 #a139 #a14 #a140 #a141 #a142 #a143 #a144 #a145 #a146 #a147 #a148 #a149 #a15 #a150 #a151 #a152 #a153 #a154 #a155 #a156 #a157 #a158 #a159 #a16 #a160 #a161 #a162 #a163 #a164 #a165 #a166 #a167 #a168 #a169 #a17 #a170 #a171 #a172 #a173 #a174 #a175 #a176 #a177 #a178 #a179 #a18 #a180 #a181 #a182 #a183 #a184 #a185 #a186 #a187 #a188 #a189 #a19 #a190 #a191 #a192 #a193 #a194 #a195 #a196 #a197 #a198 #a199 #a2 #a20 #a200 #a201 #a202 #a203 #a204 #a205 #a206 #a207 #a208 #a209 #a21 #a210 #a211 #a212 #a213 #a214 #a215 #a216 #a217 #a218 #a219 #a22 #a220 #a221 #a222 #a223 #a224 #a225 #a226 #a227 #a228 #a229 #a23 #a230 #a231 #a232 #a233 #a234 #a235 #a236 #a237 #a238 #a239 #a24 #a240 #a241 #a242 #a243 #a244 #a245 #a246 #a247 #a248 #a249 #a25 #a250 #a251 #a252 #a253 #a254 #a255 #a256 #a257 #a258 #a259 #a26 #a260 #a261 #a262 #a263 #a264 #a265 #a266 #a267 #a268 #a269 #a27 #a270 #a271 #a272 #a273 #a274 #a275 #a276 #a277 #a278 #a279 #a28 #a280 #a281 #a282 #a283 #a284 #a285 #a286 #a287 #a288 #a289 #a29 #a290 #a291 #a292 #a293 #a294 #a295 #a296 #a297 #a298 #a299 #a3 #a30 #a300 #a301 #a302 #a303 #a304 #a305 #a306 #a307 #a308 #a309 #a31 #a310 #a311 #a312 #a313 #a314 #a315 #a316 #a317 #a318 #a319 #a32 #a320 #a321 #a322 #a323 #a324 #a325 #a326 #a327 #a328 #a329 #a33 #a330 #a331 #a332 #a333 #a334 #a335 #a34 #a35 #a36 #a37 #a38 #a39 #a4 #a40 #a41 #a42 #a43 #a44 #a45 #a46 #a47 #a48 #a49 #a5 #a50 #a51 #a52 #a53 #a54 #a55 #a56 #a57 #a58 #a59 #a6 #a60 #a61 #a62 #a63 #a64 #a65 #a66 #a67 #a68 #a69 #a7 #a70 #a71 #a72 #a73 #a74 #a75 #a76 #a77 #a78 #a79 #a8 #a80 #a81 #a82 #a83 #a84 #a85 #a86 #a87 #a88 #a89 #a9 #a90 #a91 #a92 #a93 #a94 #a95 #a96 #a97 #a98 #a99 - arm
          #g0 #g1 #g10 #g100 #g101 #g102 #g103 #g104 #g105 #g106 #g107 #g108 #g109 #g11 #g110 #g111 #g112 #g113 #g114 #g115 #g116 #g117 #g118 #g119 #g12 #g120 #g121 #g122 #g123 #g124 #g125 #g126 #g127 #g128 #g129 #g13 #g130 #g131 #g132 #g133 #g134 #g135 #g136 #g137 #g138 #g139 #g14 #g140 #g141 #g142 #g143 #g144 #g145 #g146 #g147 #g148 #g149 #g15 #g150 #g151 #g152 #g153 #g154 #g155 #g156 #g157 #g158 #g159 #g16 #g160 #g161 #g162 #g163 #g164 #g165 #g166 #g167 #g168 #g169 #g17 #g170 #g171 #g172 #g173 #g174 #g175 #g176 #g177 #g178 #g179 #g18 #g180 #g181 #g182 #g183 #g184 #g185 #g186 #g187 #g188 #g189 #g19 #g190 #g191 #g192 #g193 #g194 #g195 #g196 #g197 #g198 #g199 #g2 #g20 #g200 #g201 #g202 #g203 #g204 #g205 #g206 #g207 #g208 #g209 #g21 #g210 #g211 #g212 #g213 #g214 #g215 #g216 #g217 #g218 #g219 #g22 #g220 #g221 #g222 #g223 #g224 #g225 #g226 #g227 #g228 #g229 #g23 #g230 #g231 #g232 #g233 #g234 #g235 #g236 #g237 #g238 #g239 #g24 #g240 #g241 #g242 #g243 #g244 #g245 #g246 #g247 #g248 #g25 #g26 #g27 #g28 #g29 #g3 #g30 #g31 #g32 #g33 #g34 #g35 #g36 #g37 #g38 #g39 #g4 #g40 #g41 #g42 #g43 #g44 #g45 #g46 #g47 #g48 #g49 #g5 #g50 #g51 #g52 #g53 #g54 #g55 #g56 #g57 #g58 #g59 #g6 #g60 #g61 #g62 #g63 #g64 #g65 #g66 #g67 #g68 #g69 #g7 #g70 #g71 #g72 #g73 #g74 #g75 #g76 #g77 #g78 #g79 #g8 #g80 #g81 #g82 #g83 #g84 #g85 #g86 #g87 #g88 #g89 #g9 #g90 #g91 #g92 #g93 #g94 #g95 #g96 #g97 #g98 #g99 - grasp
          #t0 #t1 #t10 #t100 #t101 #t102 #t103 #t104 #t105 #t106 #t107 #t108 #t109 #t11 #t110 #t111 #t112 #t113 #t114 #t115 #t116 #t117 #t118 #t119 #t12 #t120 #t121 #t122 #t123 #t124 #t125 #t126 #t127 #t128 #t129 #t13 #t130 #t131 #t132 #t133 #t134 #t135 #t136 #t137 #t138 #t139 #t14 #t140 #t141 #t142 #t143 #t144 #t145 #t146 #t147 #t148 #t149 #t15 #t150 #t151 #t152 #t153 #t16 #t17 #t18 #t19 #t2 #t20 #t21 #t22 #t23 #t24 #t25 #t26 #t27 #t28 #t29 #t3 #t30 #t31 #t32 #t33 #t34 #t35 #t36 #t37 #t38 #t39 #t4 #t40 #t41 #t42 #t43 #t44 #t45 #t46 #t47 #t48 #t49 #t5 #t50 #t51 #t52 #t53 #t54 #t55 #t56 #t57 #t58 #t59 #t6 #t60 #t61 #t62 #t63 #t64 #t65 #t66 #t67 #t68 #t69 #t7 #t70 #t71 #t72 #t73 #t74 #t75 #t76 #t77 #t78 #t79 #t8 #t80 #t81 #t82 #t83 #t84 #t85 #t86 #t87 #t88 #t89 #t9 #t90 #t91 #t92 #t93 #t94 #t95 #t96 #t97 #t98 #t99 - trajectory
   )

   (:init
          (atpose o3 p648)
          (atpose o4 p704)
          (atpose o5 p760)
          (atpose o6 p816)
          (atpose o7 p872)
          (atpose o8 p928)
          (canpick)
          (clear o4)
          (clear o5)
          (clear o6)
          (graspable o6)
          (graspable o7)
          (graspable o8)
          (isarm #a0 o6 p816 p816)
          (isarm #a1 o7 p872 p872)
          (isarm #a10 o6 #p0 #p1)
          (isarm #a100 o6 #p2 #p14)
          (isarm #a101 o6 #p2 #p15)
          (isarm #a102 o6 #p2 #p16)
          (isarm #a103 o6 #p2 #p17)
          (isarm #a104 o6 #p2 #p18)
          (isarm #a105 o6 #p9 #p12)
          (isarm #a106 o6 #p9 #p13)
          (isarm #a107 o6 #p9 #p14)
          (isarm #a108 o6 #p9 #p15)
          (isarm #a109 o6 #p9 #p16)
          (isarm #a11 o6 #p0 #p2)
          (isarm #a110 o6 #p9 #p17)
          (isarm #a111 o6 #p9 #p18)
          (isarm #a112 o6 #p10 #p12)
          (isarm #a113 o6 #p10 #p13)
          (isarm #a114 o6 #p10 #p14)
          (isarm #a115 o6 #p10 #p15)
          (isarm #a116 o6 #p10 #p16)
          (isarm #a117 o6 #p10 #p17)
          (isarm #a118 o6 #p10 #p18)
          (isarm #a119 o6 #p12 p816)
          (isarm #a12 o6 #p0 #p9)
          (isarm #a120 o6 #p12 #p0)
          (isarm #a121 o6 #p12 #p1)
          (isarm #a122 o6 #p12 #p2)
          (isarm #a123 o6 #p12 #p9)
          (isarm #a124 o6 #p12 #p10)
          (isarm #a125 o6 #p12 #p12)
          (isarm #a126 o6 #p12 #p13)
          (isarm #a127 o6 #p12 #p14)
          (isarm #a128 o6 #p12 #p15)
          (isarm #a129 o6 #p12 #p16)
          (isarm #a13 o6 #p0 #p10)
          (isarm #a130 o6 #p12 #p17)
          (isarm #a131 o6 #p12 #p18)
          (isarm #a132 o6 #p13 p816)
          (isarm #a133 o6 #p13 #p0)
          (isarm #a134 o6 #p13 #p1)
          (isarm #a135 o6 #p13 #p2)
          (isarm #a136 o6 #p13 #p9)
          (isarm #a137 o6 #p13 #p10)
          (isarm #a138 o6 #p13 #p12)
          (isarm #a139 o6 #p13 #p13)
          (isarm #a14 o6 #p1 p816)
          (isarm #a140 o6 #p13 #p14)
          (isarm #a141 o6 #p13 #p15)
          (isarm #a142 o6 #p13 #p16)
          (isarm #a143 o6 #p13 #p17)
          (isarm #a144 o6 #p13 #p18)
          (isarm #a145 o6 #p14 p816)
          (isarm #a146 o6 #p14 #p0)
          (isarm #a147 o6 #p14 #p1)
          (isarm #a148 o6 #p14 #p2)
          (isarm #a149 o6 #p14 #p9)
          (isarm #a15 o6 #p1 #p0)
          (isarm #a150 o6 #p14 #p10)
          (isarm #a151 o6 #p14 #p12)
          (isarm #a152 o6 #p14 #p13)
          (isarm #a153 o6 #p14 #p14)
          (isarm #a154 o6 #p14 #p15)
          (isarm #a155 o6 #p14 #p16)
          (isarm #a156 o6 #p14 #p17)
          (isarm #a157 o6 #p14 #p18)
          (isarm #a158 o6 #p15 p816)
          (isarm #a159 o6 #p15 #p0)
          (isarm #a16 o6 #p1 #p1)
          (isarm #a160 o6 #p15 #p1)
          (isarm #a161 o6 #p15 #p2)
          (isarm #a162 o6 #p15 #p9)
          (isarm #a163 o6 #p15 #p10)
          (isarm #a164 o6 #p15 #p12)
          (isarm #a165 o6 #p15 #p13)
          (isarm #a166 o6 #p15 #p14)
          (isarm #a167 o6 #p15 #p15)
          (isarm #a168 o6 #p15 #p16)
          (isarm #a169 o6 #p15 #p17)
          (isarm #a17 o6 #p1 #p2)
          (isarm #a170 o6 #p15 #p18)
          (isarm #a171 o6 #p16 p816)
          (isarm #a172 o6 #p16 #p0)
          (isarm #a173 o6 #p16 #p1)
          (isarm #a174 o6 #p16 #p2)
          (isarm #a175 o6 #p16 #p9)
          (isarm #a176 o6 #p16 #p10)
          (isarm #a177 o6 #p16 #p12)
          (isarm #a178 o6 #p16 #p13)
          (isarm #a179 o6 #p16 #p14)
          (isarm #a18 o6 #p1 #p9)
          (isarm #a180 o6 #p16 #p15)
          (isarm #a181 o6 #p16 #p16)
          (isarm #a182 o6 #p16 #p17)
          (isarm #a183 o6 #p16 #p18)
          (isarm #a184 o6 #p17 p816)
          (isarm #a185 o6 #p17 #p0)
          (isarm #a186 o6 #p17 #p1)
          (isarm #a187 o6 #p17 #p2)
          (isarm #a188 o6 #p17 #p9)
          (isarm #a189 o6 #p17 #p10)
          (isarm #a19 o6 #p1 #p10)
          (isarm #a190 o6 #p17 #p12)
          (isarm #a191 o6 #p17 #p13)
          (isarm #a192 o6 #p17 #p14)
          (isarm #a193 o6 #p17 #p15)
          (isarm #a194 o6 #p17 #p16)
          (isarm #a195 o6 #p17 #p17)
          (isarm #a196 o6 #p17 #p18)
          (isarm #a197 o6 #p18 p816)
          (isarm #a198 o6 #p18 #p0)
          (isarm #a199 o6 #p18 #p1)
          (isarm #a2 o8 p928 p928)
          (isarm #a20 o6 #p2 p816)
          (isarm #a200 o6 #p18 #p2)
          (isarm #a201 o6 #p18 #p9)
          (isarm #a202 o6 #p18 #p10)
          (isarm #a203 o6 #p18 #p12)
          (isarm #a204 o6 #p18 #p13)
          (isarm #a205 o6 #p18 #p14)
          (isarm #a206 o6 #p18 #p15)
          (isarm #a207 o6 #p18 #p16)
          (isarm #a208 o6 #p18 #p17)
          (isarm #a209 o6 #p18 #p18)
          (isarm #a21 o6 #p2 #p0)
          (isarm #a210 o7 p872 #p19)
          (isarm #a211 o7 p872 #p20)
          (isarm #a212 o7 p872 #p21)
          (isarm #a213 o7 #p3 #p19)
          (isarm #a214 o7 #p3 #p20)
          (isarm #a215 o7 #p3 #p21)
          (isarm #a216 o7 #p4 #p19)
          (isarm #a217 o7 #p4 #p20)
          (isarm #a218 o7 #p4 #p21)
          (isarm #a219 o7 #p5 #p19)
          (isarm #a22 o6 #p2 #p1)
          (isarm #a220 o7 #p5 #p20)
          (isarm #a221 o7 #p5 #p21)
          (isarm #a222 o7 #p11 #p19)
          (isarm #a223 o7 #p11 #p20)
          (isarm #a224 o7 #p11 #p21)
          (isarm #a225 o7 #p19 p872)
          (isarm #a226 o7 #p19 #p3)
          (isarm #a227 o7 #p19 #p4)
          (isarm #a228 o7 #p19 #p5)
          (isarm #a229 o7 #p19 #p11)
          (isarm #a23 o6 #p2 #p2)
          (isarm #a230 o7 #p19 #p19)
          (isarm #a231 o7 #p19 #p20)
          (isarm #a232 o7 #p19 #p21)
          (isarm #a233 o7 #p20 p872)
          (isarm #a234 o7 #p20 #p3)
          (isarm #a235 o7 #p20 #p4)
          (isarm #a236 o7 #p20 #p5)
          (isarm #a237 o7 #p20 #p11)
          (isarm #a238 o7 #p20 #p19)
          (isarm #a239 o7 #p20 #p20)
          (isarm #a24 o6 #p2 #p9)
          (isarm #a240 o7 #p20 #p21)
          (isarm #a241 o7 #p21 p872)
          (isarm #a242 o7 #p21 #p3)
          (isarm #a243 o7 #p21 #p4)
          (isarm #a244 o7 #p21 #p5)
          (isarm #a245 o7 #p21 #p11)
          (isarm #a246 o7 #p21 #p19)
          (isarm #a247 o7 #p21 #p20)
          (isarm #a248 o7 #p21 #p21)
          (isarm #a249 o6 p816 #p22)
          (isarm #a25 o6 #p2 #p10)
          (isarm #a250 o6 p816 #p23)
          (isarm #a251 o6 p816 #p24)
          (isarm #a252 o6 #p0 #p22)
          (isarm #a253 o6 #p0 #p23)
          (isarm #a254 o6 #p0 #p24)
          (isarm #a255 o6 #p1 #p22)
          (isarm #a256 o6 #p1 #p23)
          (isarm #a257 o6 #p1 #p24)
          (isarm #a258 o6 #p2 #p22)
          (isarm #a259 o6 #p2 #p23)
          (isarm #a26 o6 #p9 p816)
          (isarm #a260 o6 #p2 #p24)
          (isarm #a261 o6 #p9 #p22)
          (isarm #a262 o6 #p9 #p23)
          (isarm #a263 o6 #p9 #p24)
          (isarm #a264 o6 #p10 #p22)
          (isarm #a265 o6 #p10 #p23)
          (isarm #a266 o6 #p10 #p24)
          (isarm #a267 o6 #p12 #p22)
          (isarm #a268 o6 #p12 #p23)
          (isarm #a269 o6 #p12 #p24)
          (isarm #a27 o6 #p9 #p0)
          (isarm #a270 o6 #p13 #p22)
          (isarm #a271 o6 #p13 #p23)
          (isarm #a272 o6 #p13 #p24)
          (isarm #a273 o6 #p14 #p22)
          (isarm #a274 o6 #p14 #p23)
          (isarm #a275 o6 #p14 #p24)
          (isarm #a276 o6 #p15 #p22)
          (isarm #a277 o6 #p15 #p23)
          (isarm #a278 o6 #p15 #p24)
          (isarm #a279 o6 #p16 #p22)
          (isarm #a28 o6 #p9 #p1)
          (isarm #a280 o6 #p16 #p23)
          (isarm #a281 o6 #p16 #p24)
          (isarm #a282 o6 #p17 #p22)
          (isarm #a283 o6 #p17 #p23)
          (isarm #a284 o6 #p17 #p24)
          (isarm #a285 o6 #p18 #p22)
          (isarm #a286 o6 #p18 #p23)
          (isarm #a287 o6 #p18 #p24)
          (isarm #a288 o6 #p22 p816)
          (isarm #a289 o6 #p22 #p0)
          (isarm #a29 o6 #p9 #p2)
          (isarm #a290 o6 #p22 #p1)
          (isarm #a291 o6 #p22 #p2)
          (isarm #a292 o6 #p22 #p9)
          (isarm #a293 o6 #p22 #p10)
          (isarm #a294 o6 #p22 #p12)
          (isarm #a295 o6 #p22 #p13)
          (isarm #a296 o6 #p22 #p14)
          (isarm #a297 o6 #p22 #p15)
          (isarm #a298 o6 #p22 #p16)
          (isarm #a299 o6 #p22 #p17)
          (isarm #a3 o6 p816 #p0)
          (isarm #a30 o6 #p9 #p9)
          (isarm #a300 o6 #p22 #p18)
          (isarm #a301 o6 #p22 #p22)
          (isarm #a302 o6 #p22 #p23)
          (isarm #a303 o6 #p22 #p24)
          (isarm #a304 o6 #p23 p816)
          (isarm #a305 o6 #p23 #p0)
          (isarm #a306 o6 #p23 #p1)
          (isarm #a307 o6 #p23 #p2)
          (isarm #a308 o6 #p23 #p9)
          (isarm #a309 o6 #p23 #p10)
          (isarm #a31 o6 #p9 #p10)
          (isarm #a310 o6 #p23 #p12)
          (isarm #a311 o6 #p23 #p13)
          (isarm #a312 o6 #p23 #p14)
          (isarm #a313 o6 #p23 #p15)
          (isarm #a314 o6 #p23 #p16)
          (isarm #a315 o6 #p23 #p17)
          (isarm #a316 o6 #p23 #p18)
          (isarm #a317 o6 #p23 #p22)
          (isarm #a318 o6 #p23 #p23)
          (isarm #a319 o6 #p23 #p24)
          (isarm #a32 o6 #p10 p816)
          (isarm #a320 o6 #p24 p816)
          (isarm #a321 o6 #p24 #p0)
          (isarm #a322 o6 #p24 #p1)
          (isarm #a323 o6 #p24 #p2)
          (isarm #a324 o6 #p24 #p9)
          (isarm #a325 o6 #p24 #p10)
          (isarm #a326 o6 #p24 #p12)
          (isarm #a327 o6 #p24 #p13)
          (isarm #a328 o6 #p24 #p14)
          (isarm #a329 o6 #p24 #p15)
          (isarm #a33 o6 #p10 #p0)
          (isarm #a330 o6 #p24 #p16)
          (isarm #a331 o6 #p24 #p17)
          (isarm #a332 o6 #p24 #p18)
          (isarm #a333 o6 #p24 #p22)
          (isarm #a334 o6 #p24 #p23)
          (isarm #a335 o6 #p24 #p24)
          (isarm #a34 o6 #p10 #p1)
          (isarm #a35 o6 #p10 #p2)
          (isarm #a36 o6 #p10 #p9)
          (isarm #a37 o6 #p10 #p10)
          (isarm #a38 o7 p872 #p3)
          (isarm #a39 o7 p872 #p4)
          (isarm #a4 o6 p816 #p1)
          (isarm #a40 o7 p872 #p5)
          (isarm #a41 o7 p872 #p11)
          (isarm #a42 o7 #p3 p872)
          (isarm #a43 o7 #p3 #p3)
          (isarm #a44 o7 #p3 #p4)
          (isarm #a45 o7 #p3 #p5)
          (isarm #a46 o7 #p3 #p11)
          (isarm #a47 o7 #p4 p872)
          (isarm #a48 o7 #p4 #p3)
          (isarm #a49 o7 #p4 #p4)
          (isarm #a5 o6 p816 #p2)
          (isarm #a50 o7 #p4 #p5)
          (isarm #a51 o7 #p4 #p11)
          (isarm #a52 o7 #p5 p872)
          (isarm #a53 o7 #p5 #p3)
          (isarm #a54 o7 #p5 #p4)
          (isarm #a55 o7 #p5 #p5)
          (isarm #a56 o7 #p5 #p11)
          (isarm #a57 o7 #p11 p872)
          (isarm #a58 o7 #p11 #p3)
          (isarm #a59 o7 #p11 #p4)
          (isarm #a6 o6 p816 #p9)
          (isarm #a60 o7 #p11 #p5)
          (isarm #a61 o7 #p11 #p11)
          (isarm #a62 o8 p928 #p6)
          (isarm #a63 o8 p928 #p7)
          (isarm #a64 o8 p928 #p8)
          (isarm #a65 o8 #p6 p928)
          (isarm #a66 o8 #p6 #p6)
          (isarm #a67 o8 #p6 #p7)
          (isarm #a68 o8 #p6 #p8)
          (isarm #a69 o8 #p7 p928)
          (isarm #a7 o6 p816 #p10)
          (isarm #a70 o8 #p7 #p6)
          (isarm #a71 o8 #p7 #p7)
          (isarm #a72 o8 #p7 #p8)
          (isarm #a73 o8 #p8 p928)
          (isarm #a74 o8 #p8 #p6)
          (isarm #a75 o8 #p8 #p7)
          (isarm #a76 o8 #p8 #p8)
          (isarm #a77 o6 p816 #p12)
          (isarm #a78 o6 p816 #p13)
          (isarm #a79 o6 p816 #p14)
          (isarm #a8 o6 #p0 p816)
          (isarm #a80 o6 p816 #p15)
          (isarm #a81 o6 p816 #p16)
          (isarm #a82 o6 p816 #p17)
          (isarm #a83 o6 p816 #p18)
          (isarm #a84 o6 #p0 #p12)
          (isarm #a85 o6 #p0 #p13)
          (isarm #a86 o6 #p0 #p14)
          (isarm #a87 o6 #p0 #p15)
          (isarm #a88 o6 #p0 #p16)
          (isarm #a89 o6 #p0 #p17)
          (isarm #a9 o6 #p0 #p0)
          (isarm #a90 o6 #p0 #p18)
          (isarm #a91 o6 #p1 #p12)
          (isarm #a92 o6 #p1 #p13)
          (isarm #a93 o6 #p1 #p14)
          (isarm #a94 o6 #p1 #p15)
          (isarm #a95 o6 #p1 #p16)
          (isarm #a96 o6 #p1 #p17)
          (isarm #a97 o6 #p1 #p18)
          (isarm #a98 o6 #p2 #p12)
          (isarm #a99 o6 #p2 #p13)
          (isgrasp o6 #p0 #p0 #g9 #a9)
          (isgrasp o6 #p0 #p1 #g10 #a10)
          (isgrasp o6 #p0 #p10 #g13 #a13)
          (isgrasp o6 #p0 #p12 #g84 #a84)
          (isgrasp o6 #p0 #p13 #g85 #a85)
          (isgrasp o6 #p0 #p14 #g86 #a86)
          (isgrasp o6 #p0 #p15 #g87 #a87)
          (isgrasp o6 #p0 #p16 #g88 #a88)
          (isgrasp o6 #p0 #p17 #g89 #a89)
          (isgrasp o6 #p0 #p18 #g90 #a90)
          (isgrasp o6 #p0 #p2 #g11 #a11)
          (isgrasp o6 #p0 #p9 #g12 #a12)
          (isgrasp o6 #p0 p816 #g8 #a8)
          (isgrasp o6 #p1 #p0 #g15 #a15)
          (isgrasp o6 #p1 #p1 #g16 #a16)
          (isgrasp o6 #p1 #p10 #g19 #a19)
          (isgrasp o6 #p1 #p12 #g91 #a91)
          (isgrasp o6 #p1 #p13 #g92 #a92)
          (isgrasp o6 #p1 #p14 #g93 #a93)
          (isgrasp o6 #p1 #p15 #g94 #a94)
          (isgrasp o6 #p1 #p16 #g95 #a95)
          (isgrasp o6 #p1 #p17 #g96 #a96)
          (isgrasp o6 #p1 #p18 #g97 #a97)
          (isgrasp o6 #p1 #p2 #g17 #a17)
          (isgrasp o6 #p1 #p9 #g18 #a18)
          (isgrasp o6 #p1 p816 #g14 #a14)
          (isgrasp o6 #p10 #p0 #g33 #a33)
          (isgrasp o6 #p10 #p1 #g34 #a34)
          (isgrasp o6 #p10 #p10 #g37 #a37)
          (isgrasp o6 #p10 #p12 #g112 #a112)
          (isgrasp o6 #p10 #p13 #g113 #a113)
          (isgrasp o6 #p10 #p14 #g114 #a114)
          (isgrasp o6 #p10 #p15 #g115 #a115)
          (isgrasp o6 #p10 #p16 #g116 #a116)
          (isgrasp o6 #p10 #p17 #g117 #a117)
          (isgrasp o6 #p10 #p18 #g118 #a118)
          (isgrasp o6 #p10 #p2 #g35 #a35)
          (isgrasp o6 #p10 #p9 #g36 #a36)
          (isgrasp o6 #p10 p816 #g32 #a32)
          (isgrasp o6 #p12 #p0 #g120 #a120)
          (isgrasp o6 #p12 #p1 #g121 #a121)
          (isgrasp o6 #p12 #p10 #g124 #a124)
          (isgrasp o6 #p12 #p12 #g125 #a125)
          (isgrasp o6 #p12 #p13 #g126 #a126)
          (isgrasp o6 #p12 #p14 #g127 #a127)
          (isgrasp o6 #p12 #p15 #g128 #a128)
          (isgrasp o6 #p12 #p16 #g129 #a129)
          (isgrasp o6 #p12 #p17 #g130 #a130)
          (isgrasp o6 #p12 #p18 #g131 #a131)
          (isgrasp o6 #p12 #p2 #g122 #a122)
          (isgrasp o6 #p12 #p9 #g123 #a123)
          (isgrasp o6 #p12 p816 #g119 #a119)
          (isgrasp o6 #p13 #p0 #g133 #a133)
          (isgrasp o6 #p13 #p1 #g134 #a134)
          (isgrasp o6 #p13 #p10 #g137 #a137)
          (isgrasp o6 #p13 #p12 #g138 #a138)
          (isgrasp o6 #p13 #p13 #g139 #a139)
          (isgrasp o6 #p13 #p14 #g140 #a140)
          (isgrasp o6 #p13 #p15 #g141 #a141)
          (isgrasp o6 #p13 #p16 #g142 #a142)
          (isgrasp o6 #p13 #p17 #g143 #a143)
          (isgrasp o6 #p13 #p18 #g144 #a144)
          (isgrasp o6 #p13 #p2 #g135 #a135)
          (isgrasp o6 #p13 #p9 #g136 #a136)
          (isgrasp o6 #p13 p816 #g132 #a132)
          (isgrasp o6 #p14 #p0 #g146 #a146)
          (isgrasp o6 #p14 #p1 #g147 #a147)
          (isgrasp o6 #p14 #p10 #g150 #a150)
          (isgrasp o6 #p14 #p12 #g151 #a151)
          (isgrasp o6 #p14 #p13 #g152 #a152)
          (isgrasp o6 #p14 #p14 #g153 #a153)
          (isgrasp o6 #p14 #p15 #g154 #a154)
          (isgrasp o6 #p14 #p16 #g155 #a155)
          (isgrasp o6 #p14 #p17 #g156 #a156)
          (isgrasp o6 #p14 #p18 #g157 #a157)
          (isgrasp o6 #p14 #p2 #g148 #a148)
          (isgrasp o6 #p14 #p9 #g149 #a149)
          (isgrasp o6 #p14 p816 #g145 #a145)
          (isgrasp o6 #p15 #p0 #g159 #a159)
          (isgrasp o6 #p15 #p1 #g160 #a160)
          (isgrasp o6 #p15 #p10 #g163 #a163)
          (isgrasp o6 #p15 #p12 #g164 #a164)
          (isgrasp o6 #p15 #p13 #g165 #a165)
          (isgrasp o6 #p15 #p14 #g166 #a166)
          (isgrasp o6 #p15 #p15 #g167 #a167)
          (isgrasp o6 #p15 #p16 #g168 #a168)
          (isgrasp o6 #p15 #p17 #g169 #a169)
          (isgrasp o6 #p15 #p18 #g170 #a170)
          (isgrasp o6 #p15 #p2 #g161 #a161)
          (isgrasp o6 #p15 #p9 #g162 #a162)
          (isgrasp o6 #p15 p816 #g158 #a158)
          (isgrasp o6 #p16 #p0 #g172 #a172)
          (isgrasp o6 #p16 #p1 #g173 #a173)
          (isgrasp o6 #p16 #p10 #g176 #a176)
          (isgrasp o6 #p16 #p12 #g177 #a177)
          (isgrasp o6 #p16 #p13 #g178 #a178)
          (isgrasp o6 #p16 #p14 #g179 #a179)
          (isgrasp o6 #p16 #p15 #g180 #a180)
          (isgrasp o6 #p16 #p16 #g181 #a181)
          (isgrasp o6 #p16 #p17 #g182 #a182)
          (isgrasp o6 #p16 #p18 #g183 #a183)
          (isgrasp o6 #p16 #p2 #g174 #a174)
          (isgrasp o6 #p16 #p9 #g175 #a175)
          (isgrasp o6 #p16 p816 #g171 #a171)
          (isgrasp o6 #p17 #p0 #g185 #a185)
          (isgrasp o6 #p17 #p1 #g186 #a186)
          (isgrasp o6 #p17 #p10 #g189 #a189)
          (isgrasp o6 #p17 #p12 #g190 #a190)
          (isgrasp o6 #p17 #p13 #g191 #a191)
          (isgrasp o6 #p17 #p14 #g192 #a192)
          (isgrasp o6 #p17 #p15 #g193 #a193)
          (isgrasp o6 #p17 #p16 #g194 #a194)
          (isgrasp o6 #p17 #p17 #g195 #a195)
          (isgrasp o6 #p17 #p18 #g196 #a196)
          (isgrasp o6 #p17 #p2 #g187 #a187)
          (isgrasp o6 #p17 #p9 #g188 #a188)
          (isgrasp o6 #p17 p816 #g184 #a184)
          (isgrasp o6 #p18 #p0 #g198 #a198)
          (isgrasp o6 #p18 #p1 #g199 #a199)
          (isgrasp o6 #p18 #p10 #g202 #a202)
          (isgrasp o6 #p18 #p12 #g203 #a203)
          (isgrasp o6 #p18 #p13 #g204 #a204)
          (isgrasp o6 #p18 #p14 #g205 #a205)
          (isgrasp o6 #p18 #p15 #g206 #a206)
          (isgrasp o6 #p18 #p16 #g207 #a207)
          (isgrasp o6 #p18 #p17 #g208 #a208)
          (isgrasp o6 #p18 #p18 #g209 #a209)
          (isgrasp o6 #p18 #p2 #g200 #a200)
          (isgrasp o6 #p18 #p9 #g201 #a201)
          (isgrasp o6 #p18 p816 #g197 #a197)
          (isgrasp o6 #p2 #p0 #g21 #a21)
          (isgrasp o6 #p2 #p1 #g22 #a22)
          (isgrasp o6 #p2 #p10 #g25 #a25)
          (isgrasp o6 #p2 #p12 #g98 #a98)
          (isgrasp o6 #p2 #p13 #g99 #a99)
          (isgrasp o6 #p2 #p14 #g100 #a100)
          (isgrasp o6 #p2 #p15 #g101 #a101)
          (isgrasp o6 #p2 #p16 #g102 #a102)
          (isgrasp o6 #p2 #p17 #g103 #a103)
          (isgrasp o6 #p2 #p18 #g104 #a104)
          (isgrasp o6 #p2 #p2 #g23 #a23)
          (isgrasp o6 #p2 #p9 #g24 #a24)
          (isgrasp o6 #p2 p816 #g20 #a20)
          (isgrasp o6 #p9 #p0 #g27 #a27)
          (isgrasp o6 #p9 #p1 #g28 #a28)
          (isgrasp o6 #p9 #p10 #g31 #a31)
          (isgrasp o6 #p9 #p12 #g105 #a105)
          (isgrasp o6 #p9 #p13 #g106 #a106)
          (isgrasp o6 #p9 #p14 #g107 #a107)
          (isgrasp o6 #p9 #p15 #g108 #a108)
          (isgrasp o6 #p9 #p16 #g109 #a109)
          (isgrasp o6 #p9 #p17 #g110 #a110)
          (isgrasp o6 #p9 #p18 #g111 #a111)
          (isgrasp o6 #p9 #p2 #g29 #a29)
          (isgrasp o6 #p9 #p9 #g30 #a30)
          (isgrasp o6 #p9 p816 #g26 #a26)
          (isgrasp o6 p816 #p0 #g3 #a3)
          (isgrasp o6 p816 #p1 #g4 #a4)
          (isgrasp o6 p816 #p10 #g7 #a7)
          (isgrasp o6 p816 #p12 #g77 #a77)
          (isgrasp o6 p816 #p13 #g78 #a78)
          (isgrasp o6 p816 #p14 #g79 #a79)
          (isgrasp o6 p816 #p15 #g80 #a80)
          (isgrasp o6 p816 #p16 #g81 #a81)
          (isgrasp o6 p816 #p17 #g82 #a82)
          (isgrasp o6 p816 #p18 #g83 #a83)
          (isgrasp o6 p816 #p2 #g5 #a5)
          (isgrasp o6 p816 #p9 #g6 #a6)
          (isgrasp o6 p816 p816 #g0 #a0)
          (isgrasp o7 #p11 #p11 #g61 #a61)
          (isgrasp o7 #p11 #p19 #g222 #a222)
          (isgrasp o7 #p11 #p20 #g223 #a223)
          (isgrasp o7 #p11 #p21 #g224 #a224)
          (isgrasp o7 #p11 #p3 #g58 #a58)
          (isgrasp o7 #p11 #p4 #g59 #a59)
          (isgrasp o7 #p11 #p5 #g60 #a60)
          (isgrasp o7 #p11 p872 #g57 #a57)
          (isgrasp o7 #p19 #p11 #g229 #a229)
          (isgrasp o7 #p19 #p19 #g230 #a230)
          (isgrasp o7 #p19 #p20 #g231 #a231)
          (isgrasp o7 #p19 #p21 #g232 #a232)
          (isgrasp o7 #p19 #p3 #g226 #a226)
          (isgrasp o7 #p19 #p4 #g227 #a227)
          (isgrasp o7 #p19 #p5 #g228 #a228)
          (isgrasp o7 #p19 p872 #g225 #a225)
          (isgrasp o7 #p20 #p11 #g237 #a237)
          (isgrasp o7 #p20 #p19 #g238 #a238)
          (isgrasp o7 #p20 #p20 #g239 #a239)
          (isgrasp o7 #p20 #p21 #g240 #a240)
          (isgrasp o7 #p20 #p3 #g234 #a234)
          (isgrasp o7 #p20 #p4 #g235 #a235)
          (isgrasp o7 #p20 #p5 #g236 #a236)
          (isgrasp o7 #p20 p872 #g233 #a233)
          (isgrasp o7 #p21 #p11 #g245 #a245)
          (isgrasp o7 #p21 #p19 #g246 #a246)
          (isgrasp o7 #p21 #p20 #g247 #a247)
          (isgrasp o7 #p21 #p21 #g248 #a248)
          (isgrasp o7 #p21 #p3 #g242 #a242)
          (isgrasp o7 #p21 #p4 #g243 #a243)
          (isgrasp o7 #p21 #p5 #g244 #a244)
          (isgrasp o7 #p21 p872 #g241 #a241)
          (isgrasp o7 #p3 #p11 #g46 #a46)
          (isgrasp o7 #p3 #p19 #g213 #a213)
          (isgrasp o7 #p3 #p20 #g214 #a214)
          (isgrasp o7 #p3 #p21 #g215 #a215)
          (isgrasp o7 #p3 #p3 #g43 #a43)
          (isgrasp o7 #p3 #p4 #g44 #a44)
          (isgrasp o7 #p3 #p5 #g45 #a45)
          (isgrasp o7 #p3 p872 #g42 #a42)
          (isgrasp o7 #p4 #p11 #g51 #a51)
          (isgrasp o7 #p4 #p19 #g216 #a216)
          (isgrasp o7 #p4 #p20 #g217 #a217)
          (isgrasp o7 #p4 #p21 #g218 #a218)
          (isgrasp o7 #p4 #p3 #g48 #a48)
          (isgrasp o7 #p4 #p4 #g49 #a49)
          (isgrasp o7 #p4 #p5 #g50 #a50)
          (isgrasp o7 #p4 p872 #g47 #a47)
          (isgrasp o7 #p5 #p11 #g56 #a56)
          (isgrasp o7 #p5 #p19 #g219 #a219)
          (isgrasp o7 #p5 #p20 #g220 #a220)
          (isgrasp o7 #p5 #p21 #g221 #a221)
          (isgrasp o7 #p5 #p3 #g53 #a53)
          (isgrasp o7 #p5 #p4 #g54 #a54)
          (isgrasp o7 #p5 #p5 #g55 #a55)
          (isgrasp o7 #p5 p872 #g52 #a52)
          (isgrasp o7 p872 #p11 #g41 #a41)
          (isgrasp o7 p872 #p19 #g210 #a210)
          (isgrasp o7 p872 #p20 #g211 #a211)
          (isgrasp o7 p872 #p21 #g212 #a212)
          (isgrasp o7 p872 #p3 #g38 #a38)
          (isgrasp o7 p872 #p4 #g39 #a39)
          (isgrasp o7 p872 #p5 #g40 #a40)
          (isgrasp o7 p872 p872 #g1 #a1)
          (isgrasp o8 #p6 #p6 #g66 #a66)
          (isgrasp o8 #p6 #p7 #g67 #a67)
          (isgrasp o8 #p6 #p8 #g68 #a68)
          (isgrasp o8 #p6 p928 #g65 #a65)
          (isgrasp o8 #p7 #p6 #g70 #a70)
          (isgrasp o8 #p7 #p7 #g71 #a71)
          (isgrasp o8 #p7 #p8 #g72 #a72)
          (isgrasp o8 #p7 p928 #g69 #a69)
          (isgrasp o8 #p8 #p6 #g74 #a74)
          (isgrasp o8 #p8 #p7 #g75 #a75)
          (isgrasp o8 #p8 #p8 #g76 #a76)
          (isgrasp o8 #p8 p928 #g73 #a73)
          (isgrasp o8 p928 #p6 #g62 #a62)
          (isgrasp o8 p928 #p7 #g63 #a63)
          (isgrasp o8 p928 #p8 #g64 #a64)
          (isgrasp o8 p928 p928 #g2 #a2)
          (ispose o3 p648)
          (ispose o4 p704)
          (ispose o5 p760)
          (ispose o6 #p0)
          (ispose o6 #p1)
          (ispose o6 #p10)
          (ispose o6 #p12)
          (ispose o6 #p13)
          (ispose o6 #p14)
          (ispose o6 #p15)
          (ispose o6 #p16)
          (ispose o6 #p17)
          (ispose o6 #p18)
          (ispose o6 #p2)
          (ispose o6 #p22)
          (ispose o6 #p23)
          (ispose o6 #p24)
          (ispose o6 #p9)
          (ispose o6 p816)
          (ispose o7 #p11)
          (ispose o7 #p19)
          (ispose o7 #p20)
          (ispose o7 #p21)
          (ispose o7 #p3)
          (ispose o7 #p4)
          (ispose o7 #p5)
          (ispose o7 p872)
          (ispose o8 #p6)
          (ispose o8 #p7)
          (ispose o8 #p8)
          (ispose o8 p928)
          (issupport o6 #p0 o3 p648)
          (issupport o6 #p1 o4 p704)
          (issupport o6 #p10 o8 p928)
          (issupport o6 #p12 o7 #p3)
          (issupport o6 #p13 o7 #p4)
          (issupport o6 #p14 o7 #p5)
          (issupport o6 #p15 o7 #p11)
          (issupport o6 #p16 o8 #p6)
          (issupport o6 #p17 o8 #p7)
          (issupport o6 #p18 o8 #p8)
          (issupport o6 #p2 o5 p760)
          (issupport o6 #p22 o7 #p19)
          (issupport o6 #p23 o7 #p20)
          (issupport o6 #p24 o7 #p21)
          (issupport o6 #p9 o7 p872)
          (issupport o6 p816 o7 p872)
          (issupport o7 #p11 o8 p928)
          (issupport o7 #p19 o8 #p6)
          (issupport o7 #p20 o8 #p7)
          (issupport o7 #p21 o8 #p8)
          (issupport o7 #p3 o3 p648)
          (issupport o7 #p4 o4 p704)
          (issupport o7 #p5 o5 p760)
          (issupport o7 p872 o8 p928)
          (issupport o8 #p6 o3 p648)
          (issupport o8 #p7 o4 p704)
          (issupport o8 #p8 o5 p760)
          (issupport o8 p928 o3 p648)
          (kinfrom o6 #p0 #g10 #a10 #t13)
          (kinfrom o6 #p0 #g11 #a11 #t14)
          (kinfrom o6 #p0 #g12 #a12 #t15)
          (kinfrom o6 #p0 #g13 #a13 #t16)
          (kinfrom o6 #p0 #g8 #a8 #t11)
          (kinfrom o6 #p0 #g9 #a9 #t12)
          (kinfrom o6 #p1 #g14 #a14 #t17)
          (kinfrom o6 #p1 #g15 #a15 #t18)
          (kinfrom o6 #p1 #g16 #a16 #t19)
          (kinfrom o6 #p1 #g17 #a17 #t20)
          (kinfrom o6 #p1 #g18 #a18 #t21)
          (kinfrom o6 #p1 #g19 #a19 #t22)
          (kinfrom o6 #p10 #g32 #a32 #t35)
          (kinfrom o6 #p10 #g33 #a33 #t36)
          (kinfrom o6 #p10 #g34 #a34 #t37)
          (kinfrom o6 #p10 #g35 #a35 #t38)
          (kinfrom o6 #p10 #g36 #a36 #t39)
          (kinfrom o6 #p10 #g37 #a37 #t40)
          (kinfrom o6 #p2 #g20 #a20 #t23)
          (kinfrom o6 #p2 #g21 #a21 #t24)
          (kinfrom o6 #p2 #g22 #a22 #t25)
          (kinfrom o6 #p2 #g23 #a23 #t26)
          (kinfrom o6 #p2 #g24 #a24 #t27)
          (kinfrom o6 #p2 #g25 #a25 #t28)
          (kinfrom o6 #p9 #g26 #a26 #t29)
          (kinfrom o6 #p9 #g27 #a27 #t30)
          (kinfrom o6 #p9 #g28 #a28 #t31)
          (kinfrom o6 #p9 #g29 #a29 #t32)
          (kinfrom o6 #p9 #g30 #a30 #t33)
          (kinfrom o6 #p9 #g31 #a31 #t34)
          (kinfrom o6 p816 #g0 #a0 #t0)
          (kinfrom o6 p816 #g3 #a3 #t6)
          (kinfrom o6 p816 #g4 #a4 #t7)
          (kinfrom o6 p816 #g5 #a5 #t8)
          (kinfrom o6 p816 #g6 #a6 #t9)
          (kinfrom o6 p816 #g7 #a7 #t10)
          (kinfrom o7 #p11 #g57 #a57 #t60)
          (kinfrom o7 #p11 #g58 #a58 #t61)
          (kinfrom o7 #p11 #g59 #a59 #t62)
          (kinfrom o7 #p11 #g60 #a60 #t63)
          (kinfrom o7 #p11 #g61 #a61 #t64)
          (kinfrom o7 #p3 #g42 #a42 #t45)
          (kinfrom o7 #p3 #g43 #a43 #t46)
          (kinfrom o7 #p3 #g44 #a44 #t47)
          (kinfrom o7 #p3 #g45 #a45 #t48)
          (kinfrom o7 #p3 #g46 #a46 #t49)
          (kinfrom o7 #p4 #g47 #a47 #t50)
          (kinfrom o7 #p4 #g48 #a48 #t51)
          (kinfrom o7 #p4 #g49 #a49 #t52)
          (kinfrom o7 #p4 #g50 #a50 #t53)
          (kinfrom o7 #p4 #g51 #a51 #t54)
          (kinfrom o7 #p5 #g52 #a52 #t55)
          (kinfrom o7 #p5 #g53 #a53 #t56)
          (kinfrom o7 #p5 #g54 #a54 #t57)
          (kinfrom o7 #p5 #g55 #a55 #t58)
          (kinfrom o7 #p5 #g56 #a56 #t59)
          (kinfrom o7 p872 #g1 #a1 #t1)
          (kinfrom o7 p872 #g38 #a38 #t41)
          (kinfrom o7 p872 #g39 #a39 #t42)
          (kinfrom o7 p872 #g40 #a40 #t43)
          (kinfrom o7 p872 #g41 #a41 #t44)
          (kinfrom o8 #p6 #g65 #a65 #t68)
          (kinfrom o8 #p6 #g66 #a66 #t69)
          (kinfrom o8 #p6 #g67 #a67 #t70)
          (kinfrom o8 #p6 #g68 #a68 #t71)
          (kinfrom o8 #p7 #g69 #a69 #t72)
          (kinfrom o8 #p7 #g70 #a70 #t73)
          (kinfrom o8 #p7 #g71 #a71 #t74)
          (kinfrom o8 #p7 #g72 #a72 #t75)
          (kinfrom o8 #p8 #g73 #a73 #t76)
          (kinfrom o8 #p8 #g74 #a74 #t77)
          (kinfrom o8 #p8 #g75 #a75 #t78)
          (kinfrom o8 #p8 #g76 #a76 #t79)
          (kinfrom o8 p928 #g2 #a2 #t2)
          (kinfrom o8 p928 #g62 #a62 #t65)
          (kinfrom o8 p928 #g63 #a63 #t66)
          (kinfrom o8 p928 #g64 #a64 #t67)
          (kinto o6 #p0 #g15 #a15 #t92)
          (kinto o6 #p0 #g21 #a21 #t98)
          (kinto o6 #p0 #g27 #a27 #t104)
          (kinto o6 #p0 #g3 #a3 #t80)
          (kinto o6 #p0 #g33 #a33 #t110)
          (kinto o6 #p0 #g9 #a9 #t86)
          (kinto o6 #p1 #g10 #a10 #t87)
          (kinto o6 #p1 #g16 #a16 #t93)
          (kinto o6 #p1 #g22 #a22 #t99)
          (kinto o6 #p1 #g28 #a28 #t105)
          (kinto o6 #p1 #g34 #a34 #t111)
          (kinto o6 #p1 #g4 #a4 #t81)
          (kinto o6 #p10 #g13 #a13 #t90)
          (kinto o6 #p10 #g19 #a19 #t96)
          (kinto o6 #p10 #g25 #a25 #t102)
          (kinto o6 #p10 #g31 #a31 #t108)
          (kinto o6 #p10 #g37 #a37 #t114)
          (kinto o6 #p10 #g7 #a7 #t84)
          (kinto o6 #p2 #g11 #a11 #t88)
          (kinto o6 #p2 #g17 #a17 #t94)
          (kinto o6 #p2 #g23 #a23 #t100)
          (kinto o6 #p2 #g29 #a29 #t106)
          (kinto o6 #p2 #g35 #a35 #t112)
          (kinto o6 #p2 #g5 #a5 #t82)
          (kinto o6 #p9 #g12 #a12 #t89)
          (kinto o6 #p9 #g18 #a18 #t95)
          (kinto o6 #p9 #g24 #a24 #t101)
          (kinto o6 #p9 #g30 #a30 #t107)
          (kinto o6 #p9 #g36 #a36 #t113)
          (kinto o6 #p9 #g6 #a6 #t83)
          (kinto o6 p816 #g0 #a0 #t3)
          (kinto o6 p816 #g14 #a14 #t91)
          (kinto o6 p816 #g20 #a20 #t97)
          (kinto o6 p816 #g26 #a26 #t103)
          (kinto o6 p816 #g32 #a32 #t109)
          (kinto o6 p816 #g8 #a8 #t85)
          (kinto o7 #p11 #g41 #a41 #t118)
          (kinto o7 #p11 #g46 #a46 #t123)
          (kinto o7 #p11 #g51 #a51 #t128)
          (kinto o7 #p11 #g56 #a56 #t133)
          (kinto o7 #p11 #g61 #a61 #t138)
          (kinto o7 #p3 #g38 #a38 #t115)
          (kinto o7 #p3 #g43 #a43 #t120)
          (kinto o7 #p3 #g48 #a48 #t125)
          (kinto o7 #p3 #g53 #a53 #t130)
          (kinto o7 #p3 #g58 #a58 #t135)
          (kinto o7 #p4 #g39 #a39 #t116)
          (kinto o7 #p4 #g44 #a44 #t121)
          (kinto o7 #p4 #g49 #a49 #t126)
          (kinto o7 #p4 #g54 #a54 #t131)
          (kinto o7 #p4 #g59 #a59 #t136)
          (kinto o7 #p5 #g40 #a40 #t117)
          (kinto o7 #p5 #g45 #a45 #t122)
          (kinto o7 #p5 #g50 #a50 #t127)
          (kinto o7 #p5 #g55 #a55 #t132)
          (kinto o7 #p5 #g60 #a60 #t137)
          (kinto o7 p872 #g1 #a1 #t4)
          (kinto o7 p872 #g42 #a42 #t119)
          (kinto o7 p872 #g47 #a47 #t124)
          (kinto o7 p872 #g52 #a52 #t129)
          (kinto o7 p872 #g57 #a57 #t134)
          (kinto o8 #p6 #g62 #a62 #t139)
          (kinto o8 #p6 #g66 #a66 #t143)
          (kinto o8 #p6 #g70 #a70 #t147)
          (kinto o8 #p6 #g74 #a74 #t151)
          (kinto o8 #p7 #g63 #a63 #t140)
          (kinto o8 #p7 #g67 #a67 #t144)
          (kinto o8 #p7 #g71 #a71 #t148)
          (kinto o8 #p7 #g75 #a75 #t152)
          (kinto o8 #p8 #g64 #a64 #t141)
          (kinto o8 #p8 #g68 #a68 #t145)
          (kinto o8 #p8 #g72 #a72 #t149)
          (kinto o8 #p8 #g76 #a76 #t153)
          (kinto o8 p928 #g2 #a2 #t5)
          (kinto o8 p928 #g65 #a65 #t142)
          (kinto o8 p928 #g69 #a69 #t146)
          (kinto o8 p928 #g73 #a73 #t150)
          (on o6 o7)
          (on o7 o8)
          (on o8 o3)
          (smaller o6 o3)
          (smaller o6 o4)
          (smaller o6 o5)
          (smaller o6 o7)
          (smaller o6 o8)
          (smaller o7 o3)
          (smaller o7 o4)
          (smaller o7 o5)
          (smaller o7 o8)
          (smaller o8 o3)
          (smaller o8 o4)
          (smaller o8 o5)
          (= (total-cost) 0)
   )

   (:goal
        (and (on o6 o7) (on o7 o8) (on o8 o5))
   )

   (:metric minimize (total-cost))

)
