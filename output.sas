begin_version
3
end_version
begin_metric
1
end_metric
15
begin_variable
var0
-1
2
Atom located(o10, p360)
NegatedAtom located(o10, p360)
end_variable
begin_variable
var1
-1
2
Atom usedgrasp(o10, #p0, #g1)
NegatedAtom usedgrasp(o10, #p0, #g1)
end_variable
begin_variable
var2
-1
2
Atom usedgrasp(o10, #p1, #g2)
NegatedAtom usedgrasp(o10, #p1, #g2)
end_variable
begin_variable
var3
-1
2
Atom usedgrasp(o10, #p2, #g3)
NegatedAtom usedgrasp(o10, #p2, #g3)
end_variable
begin_variable
var4
-1
2
Atom located(o10, #p0)
NegatedAtom located(o10, #p0)
end_variable
begin_variable
var5
-1
2
Atom located(o10, #p1)
NegatedAtom located(o10, #p1)
end_variable
begin_variable
var6
-1
2
Atom located(o10, #p2)
NegatedAtom located(o10, #p2)
end_variable
begin_variable
var7
-1
8
Atom atgrasp(o10, #g0)
Atom atgrasp(o10, #g1)
Atom atgrasp(o10, #g2)
Atom atgrasp(o10, #g3)
Atom atpose(o10, #p0)
Atom atpose(o10, #p1)
Atom atpose(o10, #p2)
Atom atpose(o10, p360)
end_variable
begin_variable
var8
-1
2
Atom handempty()
NegatedAtom handempty()
end_variable
begin_variable
var9
-1
2
Atom canmove()
NegatedAtom canmove()
end_variable
begin_variable
var10
-1
2
Atom canplace()
NegatedAtom canplace()
end_variable
begin_variable
var11
-1
2
Atom canpick()
NegatedAtom canpick()
end_variable
begin_variable
var12
-1
17
Atom atconf(#q0)
Atom atconf(#q1)
Atom atconf(#q10)
Atom atconf(#q11)
Atom atconf(#q12)
Atom atconf(#q13)
Atom atconf(#q14)
Atom atconf(#q15)
Atom atconf(#q2)
Atom atconf(#q3)
Atom atconf(#q4)
Atom atconf(#q5)
Atom atconf(#q6)
Atom atconf(#q7)
Atom atconf(#q8)
Atom atconf(#q9)
Atom atconf(q616)
end_variable
begin_variable
var13
-1
2
Atom allowlocate()
NegatedAtom allowlocate()
end_variable
begin_variable
var14
0
2
Atom on(o10, o6)
NegatedAtom on(o10, o6)
end_variable
0
begin_state
1
1
1
1
1
1
1
7
0
0
1
0
16
0
1
end_state
begin_goal
3
12 16
13 0
14 0
end_goal
1465
begin_operator
locate_body o10 #p0 o9
1
9 0
2
0 13 0 1
0 4 -1 0
50
end_operator
begin_operator
locate_body o10 #p1 o9
1
9 0
2
0 13 0 1
0 5 -1 0
50
end_operator
begin_operator
locate_body o10 #p2 o9
1
9 0
2
0 13 0 1
0 6 -1 0
50
end_operator
begin_operator
locate_body o10 p360 o9
1
9 0
2
0 13 0 1
0 0 -1 0
50
end_operator
begin_operator
move_free #q0 #q0 #t23
2
12 0
8 0
2
0 9 0 1
0 11 -1 0
100
end_operator
begin_operator
move_free #q0 #q1 #t24
1
8 0
3
0 12 0 1
0 9 0 1
0 11 -1 0
100
end_operator
begin_operator
move_free #q0 #q10 #t159
1
8 0
3
0 12 0 2
0 9 0 1
0 11 -1 0
100
end_operator
begin_operator
move_free #q0 #q11 #t160
1
8 0
3
0 12 0 3
0 9 0 1
0 11 -1 0
100
end_operator
begin_operator
move_free #q0 #q12 #t161
1
8 0
3
0 12 0 4
0 9 0 1
0 11 -1 0
100
end_operator
begin_operator
move_free #q0 #q13 #t162
1
8 0
3
0 12 0 5
0 9 0 1
0 11 -1 0
100
end_operator
begin_operator
move_free #q0 #q14 #t163
1
8 0
3
0 12 0 6
0 9 0 1
0 11 -1 0
100
end_operator
begin_operator
move_free #q0 #q15 #t164
1
8 0
3
0 12 0 7
0 9 0 1
0 11 -1 0
100
end_operator
begin_operator
move_free #q0 #q2 #t25
1
8 0
3
0 12 0 8
0 9 0 1
0 11 -1 0
100
end_operator
begin_operator
move_free #q0 #q3 #t26
1
8 0
3
0 12 0 9
0 9 0 1
0 11 -1 0
100
end_operator
begin_operator
move_free #q0 #q4 #t153
1
8 0
3
0 12 0 10
0 9 0 1
0 11 -1 0
100
end_operator
begin_operator
move_free #q0 #q5 #t154
1
8 0
3
0 12 0 11
0 9 0 1
0 11 -1 0
100
end_operator
begin_operator
move_free #q0 #q6 #t155
1
8 0
3
0 12 0 12
0 9 0 1
0 11 -1 0
100
end_operator
begin_operator
move_free #q0 #q7 #t156
1
8 0
3
0 12 0 13
0 9 0 1
0 11 -1 0
100
end_operator
begin_operator
move_free #q0 #q8 #t157
1
8 0
3
0 12 0 14
0 9 0 1
0 11 -1 0
100
end_operator
begin_operator
move_free #q0 #q9 #t158
1
8 0
3
0 12 0 15
0 9 0 1
0 11 -1 0
100
end_operator
begin_operator
move_free #q0 q616 #t22
1
8 0
3
0 12 0 16
0 9 0 1
0 11 -1 0
100
end_operator
begin_operator
move_free #q1 #q0 #t28
1
8 0
3
0 12 1 0
0 9 0 1
0 11 -1 0
100
end_operator
begin_operator
move_free #q1 #q1 #t29
2
12 1
8 0
2
0 9 0 1
0 11 -1 0
100
end_operator
begin_operator
move_free #q1 #q10 #t171
1
8 0
3
0 12 1 2
0 9 0 1
0 11 -1 0
100
end_operator
begin_operator
move_free #q1 #q11 #t172
1
8 0
3
0 12 1 3
0 9 0 1
0 11 -1 0
100
end_operator
begin_operator
move_free #q1 #q12 #t173
1
8 0
3
0 12 1 4
0 9 0 1
0 11 -1 0
100
end_operator
begin_operator
move_free #q1 #q13 #t174
1
8 0
3
0 12 1 5
0 9 0 1
0 11 -1 0
100
end_operator
begin_operator
move_free #q1 #q14 #t175
1
8 0
3
0 12 1 6
0 9 0 1
0 11 -1 0
100
end_operator
begin_operator
move_free #q1 #q15 #t176
1
8 0
3
0 12 1 7
0 9 0 1
0 11 -1 0
100
end_operator
begin_operator
move_free #q1 #q2 #t30
1
8 0
3
0 12 1 8
0 9 0 1
0 11 -1 0
100
end_operator
begin_operator
move_free #q1 #q3 #t31
1
8 0
3
0 12 1 9
0 9 0 1
0 11 -1 0
100
end_operator
begin_operator
move_free #q1 #q4 #t165
1
8 0
3
0 12 1 10
0 9 0 1
0 11 -1 0
100
end_operator
begin_operator
move_free #q1 #q5 #t166
1
8 0
3
0 12 1 11
0 9 0 1
0 11 -1 0
100
end_operator
begin_operator
move_free #q1 #q6 #t167
1
8 0
3
0 12 1 12
0 9 0 1
0 11 -1 0
100
end_operator
begin_operator
move_free #q1 #q7 #t168
1
8 0
3
0 12 1 13
0 9 0 1
0 11 -1 0
100
end_operator
begin_operator
move_free #q1 #q8 #t169
1
8 0
3
0 12 1 14
0 9 0 1
0 11 -1 0
100
end_operator
begin_operator
move_free #q1 #q9 #t170
1
8 0
3
0 12 1 15
0 9 0 1
0 11 -1 0
100
end_operator
begin_operator
move_free #q1 q616 #t27
1
8 0
3
0 12 1 16
0 9 0 1
0 11 -1 0
100
end_operator
begin_operator
move_free #q10 #q0 #t304
1
8 0
3
0 12 2 0
0 9 0 1
0 11 -1 0
100
end_operator
begin_operator
move_free #q10 #q1 #t305
1
8 0
3
0 12 2 1
0 9 0 1
0 11 -1 0
100
end_operator
begin_operator
move_free #q10 #q10 #t314
2
12 2
8 0
2
0 9 0 1
0 11 -1 0
100
end_operator
begin_operator
move_free #q10 #q11 #t315
1
8 0
3
0 12 2 3
0 9 0 1
0 11 -1 0
100
end_operator
begin_operator
move_free #q10 #q12 #t316
1
8 0
3
0 12 2 4
0 9 0 1
0 11 -1 0
100
end_operator
begin_operator
move_free #q10 #q13 #t317
1
8 0
3
0 12 2 5
0 9 0 1
0 11 -1 0
100
end_operator
begin_operator
move_free #q10 #q14 #t318
1
8 0
3
0 12 2 6
0 9 0 1
0 11 -1 0
100
end_operator
begin_operator
move_free #q10 #q15 #t319
1
8 0
3
0 12 2 7
0 9 0 1
0 11 -1 0
100
end_operator
begin_operator
move_free #q10 #q2 #t306
1
8 0
3
0 12 2 8
0 9 0 1
0 11 -1 0
100
end_operator
begin_operator
move_free #q10 #q3 #t307
1
8 0
3
0 12 2 9
0 9 0 1
0 11 -1 0
100
end_operator
begin_operator
move_free #q10 #q4 #t308
1
8 0
3
0 12 2 10
0 9 0 1
0 11 -1 0
100
end_operator
begin_operator
move_free #q10 #q5 #t309
1
8 0
3
0 12 2 11
0 9 0 1
0 11 -1 0
100
end_operator
begin_operator
move_free #q10 #q6 #t310
1
8 0
3
0 12 2 12
0 9 0 1
0 11 -1 0
100
end_operator
begin_operator
move_free #q10 #q7 #t311
1
8 0
3
0 12 2 13
0 9 0 1
0 11 -1 0
100
end_operator
begin_operator
move_free #q10 #q8 #t312
1
8 0
3
0 12 2 14
0 9 0 1
0 11 -1 0
100
end_operator
begin_operator
move_free #q10 #q9 #t313
1
8 0
3
0 12 2 15
0 9 0 1
0 11 -1 0
100
end_operator
begin_operator
move_free #q10 q616 #t303
1
8 0
3
0 12 2 16
0 9 0 1
0 11 -1 0
100
end_operator
begin_operator
move_free #q11 #q0 #t321
1
8 0
3
0 12 3 0
0 9 0 1
0 11 -1 0
100
end_operator
begin_operator
move_free #q11 #q1 #t322
1
8 0
3
0 12 3 1
0 9 0 1
0 11 -1 0
100
end_operator
begin_operator
move_free #q11 #q10 #t331
1
8 0
3
0 12 3 2
0 9 0 1
0 11 -1 0
100
end_operator
begin_operator
move_free #q11 #q11 #t332
2
12 3
8 0
2
0 9 0 1
0 11 -1 0
100
end_operator
begin_operator
move_free #q11 #q12 #t333
1
8 0
3
0 12 3 4
0 9 0 1
0 11 -1 0
100
end_operator
begin_operator
move_free #q11 #q13 #t334
1
8 0
3
0 12 3 5
0 9 0 1
0 11 -1 0
100
end_operator
begin_operator
move_free #q11 #q14 #t335
1
8 0
3
0 12 3 6
0 9 0 1
0 11 -1 0
100
end_operator
begin_operator
move_free #q11 #q15 #t336
1
8 0
3
0 12 3 7
0 9 0 1
0 11 -1 0
100
end_operator
begin_operator
move_free #q11 #q2 #t323
1
8 0
3
0 12 3 8
0 9 0 1
0 11 -1 0
100
end_operator
begin_operator
move_free #q11 #q3 #t324
1
8 0
3
0 12 3 9
0 9 0 1
0 11 -1 0
100
end_operator
begin_operator
move_free #q11 #q4 #t325
1
8 0
3
0 12 3 10
0 9 0 1
0 11 -1 0
100
end_operator
begin_operator
move_free #q11 #q5 #t326
1
8 0
3
0 12 3 11
0 9 0 1
0 11 -1 0
100
end_operator
begin_operator
move_free #q11 #q6 #t327
1
8 0
3
0 12 3 12
0 9 0 1
0 11 -1 0
100
end_operator
begin_operator
move_free #q11 #q7 #t328
1
8 0
3
0 12 3 13
0 9 0 1
0 11 -1 0
100
end_operator
begin_operator
move_free #q11 #q8 #t329
1
8 0
3
0 12 3 14
0 9 0 1
0 11 -1 0
100
end_operator
begin_operator
move_free #q11 #q9 #t330
1
8 0
3
0 12 3 15
0 9 0 1
0 11 -1 0
100
end_operator
begin_operator
move_free #q11 q616 #t320
1
8 0
3
0 12 3 16
0 9 0 1
0 11 -1 0
100
end_operator
begin_operator
move_free #q12 #q0 #t338
1
8 0
3
0 12 4 0
0 9 0 1
0 11 -1 0
100
end_operator
begin_operator
move_free #q12 #q1 #t339
1
8 0
3
0 12 4 1
0 9 0 1
0 11 -1 0
100
end_operator
begin_operator
move_free #q12 #q10 #t348
1
8 0
3
0 12 4 2
0 9 0 1
0 11 -1 0
100
end_operator
begin_operator
move_free #q12 #q11 #t349
1
8 0
3
0 12 4 3
0 9 0 1
0 11 -1 0
100
end_operator
begin_operator
move_free #q12 #q12 #t350
2
12 4
8 0
2
0 9 0 1
0 11 -1 0
100
end_operator
begin_operator
move_free #q12 #q13 #t351
1
8 0
3
0 12 4 5
0 9 0 1
0 11 -1 0
100
end_operator
begin_operator
move_free #q12 #q14 #t352
1
8 0
3
0 12 4 6
0 9 0 1
0 11 -1 0
100
end_operator
begin_operator
move_free #q12 #q15 #t353
1
8 0
3
0 12 4 7
0 9 0 1
0 11 -1 0
100
end_operator
begin_operator
move_free #q12 #q2 #t340
1
8 0
3
0 12 4 8
0 9 0 1
0 11 -1 0
100
end_operator
begin_operator
move_free #q12 #q3 #t341
1
8 0
3
0 12 4 9
0 9 0 1
0 11 -1 0
100
end_operator
begin_operator
move_free #q12 #q4 #t342
1
8 0
3
0 12 4 10
0 9 0 1
0 11 -1 0
100
end_operator
begin_operator
move_free #q12 #q5 #t343
1
8 0
3
0 12 4 11
0 9 0 1
0 11 -1 0
100
end_operator
begin_operator
move_free #q12 #q6 #t344
1
8 0
3
0 12 4 12
0 9 0 1
0 11 -1 0
100
end_operator
begin_operator
move_free #q12 #q7 #t345
1
8 0
3
0 12 4 13
0 9 0 1
0 11 -1 0
100
end_operator
begin_operator
move_free #q12 #q8 #t346
1
8 0
3
0 12 4 14
0 9 0 1
0 11 -1 0
100
end_operator
begin_operator
move_free #q12 #q9 #t347
1
8 0
3
0 12 4 15
0 9 0 1
0 11 -1 0
100
end_operator
begin_operator
move_free #q12 q616 #t337
1
8 0
3
0 12 4 16
0 9 0 1
0 11 -1 0
100
end_operator
begin_operator
move_free #q13 #q0 #t355
1
8 0
3
0 12 5 0
0 9 0 1
0 11 -1 0
100
end_operator
begin_operator
move_free #q13 #q1 #t356
1
8 0
3
0 12 5 1
0 9 0 1
0 11 -1 0
100
end_operator
begin_operator
move_free #q13 #q10 #t365
1
8 0
3
0 12 5 2
0 9 0 1
0 11 -1 0
100
end_operator
begin_operator
move_free #q13 #q11 #t366
1
8 0
3
0 12 5 3
0 9 0 1
0 11 -1 0
100
end_operator
begin_operator
move_free #q13 #q12 #t367
1
8 0
3
0 12 5 4
0 9 0 1
0 11 -1 0
100
end_operator
begin_operator
move_free #q13 #q13 #t368
2
12 5
8 0
2
0 9 0 1
0 11 -1 0
100
end_operator
begin_operator
move_free #q13 #q14 #t369
1
8 0
3
0 12 5 6
0 9 0 1
0 11 -1 0
100
end_operator
begin_operator
move_free #q13 #q15 #t370
1
8 0
3
0 12 5 7
0 9 0 1
0 11 -1 0
100
end_operator
begin_operator
move_free #q13 #q2 #t357
1
8 0
3
0 12 5 8
0 9 0 1
0 11 -1 0
100
end_operator
begin_operator
move_free #q13 #q3 #t358
1
8 0
3
0 12 5 9
0 9 0 1
0 11 -1 0
100
end_operator
begin_operator
move_free #q13 #q4 #t359
1
8 0
3
0 12 5 10
0 9 0 1
0 11 -1 0
100
end_operator
begin_operator
move_free #q13 #q5 #t360
1
8 0
3
0 12 5 11
0 9 0 1
0 11 -1 0
100
end_operator
begin_operator
move_free #q13 #q6 #t361
1
8 0
3
0 12 5 12
0 9 0 1
0 11 -1 0
100
end_operator
begin_operator
move_free #q13 #q7 #t362
1
8 0
3
0 12 5 13
0 9 0 1
0 11 -1 0
100
end_operator
begin_operator
move_free #q13 #q8 #t363
1
8 0
3
0 12 5 14
0 9 0 1
0 11 -1 0
100
end_operator
begin_operator
move_free #q13 #q9 #t364
1
8 0
3
0 12 5 15
0 9 0 1
0 11 -1 0
100
end_operator
begin_operator
move_free #q13 q616 #t354
1
8 0
3
0 12 5 16
0 9 0 1
0 11 -1 0
100
end_operator
begin_operator
move_free #q14 #q0 #t372
1
8 0
3
0 12 6 0
0 9 0 1
0 11 -1 0
100
end_operator
begin_operator
move_free #q14 #q1 #t373
1
8 0
3
0 12 6 1
0 9 0 1
0 11 -1 0
100
end_operator
begin_operator
move_free #q14 #q10 #t382
1
8 0
3
0 12 6 2
0 9 0 1
0 11 -1 0
100
end_operator
begin_operator
move_free #q14 #q11 #t383
1
8 0
3
0 12 6 3
0 9 0 1
0 11 -1 0
100
end_operator
begin_operator
move_free #q14 #q12 #t384
1
8 0
3
0 12 6 4
0 9 0 1
0 11 -1 0
100
end_operator
begin_operator
move_free #q14 #q13 #t385
1
8 0
3
0 12 6 5
0 9 0 1
0 11 -1 0
100
end_operator
begin_operator
move_free #q14 #q14 #t386
2
12 6
8 0
2
0 9 0 1
0 11 -1 0
100
end_operator
begin_operator
move_free #q14 #q15 #t387
1
8 0
3
0 12 6 7
0 9 0 1
0 11 -1 0
100
end_operator
begin_operator
move_free #q14 #q2 #t374
1
8 0
3
0 12 6 8
0 9 0 1
0 11 -1 0
100
end_operator
begin_operator
move_free #q14 #q3 #t375
1
8 0
3
0 12 6 9
0 9 0 1
0 11 -1 0
100
end_operator
begin_operator
move_free #q14 #q4 #t376
1
8 0
3
0 12 6 10
0 9 0 1
0 11 -1 0
100
end_operator
begin_operator
move_free #q14 #q5 #t377
1
8 0
3
0 12 6 11
0 9 0 1
0 11 -1 0
100
end_operator
begin_operator
move_free #q14 #q6 #t378
1
8 0
3
0 12 6 12
0 9 0 1
0 11 -1 0
100
end_operator
begin_operator
move_free #q14 #q7 #t379
1
8 0
3
0 12 6 13
0 9 0 1
0 11 -1 0
100
end_operator
begin_operator
move_free #q14 #q8 #t380
1
8 0
3
0 12 6 14
0 9 0 1
0 11 -1 0
100
end_operator
begin_operator
move_free #q14 #q9 #t381
1
8 0
3
0 12 6 15
0 9 0 1
0 11 -1 0
100
end_operator
begin_operator
move_free #q14 q616 #t371
1
8 0
3
0 12 6 16
0 9 0 1
0 11 -1 0
100
end_operator
begin_operator
move_free #q15 #q0 #t389
1
8 0
3
0 12 7 0
0 9 0 1
0 11 -1 0
100
end_operator
begin_operator
move_free #q15 #q1 #t390
1
8 0
3
0 12 7 1
0 9 0 1
0 11 -1 0
100
end_operator
begin_operator
move_free #q15 #q10 #t399
1
8 0
3
0 12 7 2
0 9 0 1
0 11 -1 0
100
end_operator
begin_operator
move_free #q15 #q11 #t400
1
8 0
3
0 12 7 3
0 9 0 1
0 11 -1 0
100
end_operator
begin_operator
move_free #q15 #q12 #t401
1
8 0
3
0 12 7 4
0 9 0 1
0 11 -1 0
100
end_operator
begin_operator
move_free #q15 #q13 #t402
1
8 0
3
0 12 7 5
0 9 0 1
0 11 -1 0
100
end_operator
begin_operator
move_free #q15 #q14 #t403
1
8 0
3
0 12 7 6
0 9 0 1
0 11 -1 0
100
end_operator
begin_operator
move_free #q15 #q15 #t404
2
12 7
8 0
2
0 9 0 1
0 11 -1 0
100
end_operator
begin_operator
move_free #q15 #q2 #t391
1
8 0
3
0 12 7 8
0 9 0 1
0 11 -1 0
100
end_operator
begin_operator
move_free #q15 #q3 #t392
1
8 0
3
0 12 7 9
0 9 0 1
0 11 -1 0
100
end_operator
begin_operator
move_free #q15 #q4 #t393
1
8 0
3
0 12 7 10
0 9 0 1
0 11 -1 0
100
end_operator
begin_operator
move_free #q15 #q5 #t394
1
8 0
3
0 12 7 11
0 9 0 1
0 11 -1 0
100
end_operator
begin_operator
move_free #q15 #q6 #t395
1
8 0
3
0 12 7 12
0 9 0 1
0 11 -1 0
100
end_operator
begin_operator
move_free #q15 #q7 #t396
1
8 0
3
0 12 7 13
0 9 0 1
0 11 -1 0
100
end_operator
begin_operator
move_free #q15 #q8 #t397
1
8 0
3
0 12 7 14
0 9 0 1
0 11 -1 0
100
end_operator
begin_operator
move_free #q15 #q9 #t398
1
8 0
3
0 12 7 15
0 9 0 1
0 11 -1 0
100
end_operator
begin_operator
move_free #q15 q616 #t388
1
8 0
3
0 12 7 16
0 9 0 1
0 11 -1 0
100
end_operator
begin_operator
move_free #q2 #q0 #t33
1
8 0
3
0 12 8 0
0 9 0 1
0 11 -1 0
100
end_operator
begin_operator
move_free #q2 #q1 #t34
1
8 0
3
0 12 8 1
0 9 0 1
0 11 -1 0
100
end_operator
begin_operator
move_free #q2 #q10 #t183
1
8 0
3
0 12 8 2
0 9 0 1
0 11 -1 0
100
end_operator
begin_operator
move_free #q2 #q11 #t184
1
8 0
3
0 12 8 3
0 9 0 1
0 11 -1 0
100
end_operator
begin_operator
move_free #q2 #q12 #t185
1
8 0
3
0 12 8 4
0 9 0 1
0 11 -1 0
100
end_operator
begin_operator
move_free #q2 #q13 #t186
1
8 0
3
0 12 8 5
0 9 0 1
0 11 -1 0
100
end_operator
begin_operator
move_free #q2 #q14 #t187
1
8 0
3
0 12 8 6
0 9 0 1
0 11 -1 0
100
end_operator
begin_operator
move_free #q2 #q15 #t188
1
8 0
3
0 12 8 7
0 9 0 1
0 11 -1 0
100
end_operator
begin_operator
move_free #q2 #q2 #t35
2
12 8
8 0
2
0 9 0 1
0 11 -1 0
100
end_operator
begin_operator
move_free #q2 #q3 #t36
1
8 0
3
0 12 8 9
0 9 0 1
0 11 -1 0
100
end_operator
begin_operator
move_free #q2 #q4 #t177
1
8 0
3
0 12 8 10
0 9 0 1
0 11 -1 0
100
end_operator
begin_operator
move_free #q2 #q5 #t178
1
8 0
3
0 12 8 11
0 9 0 1
0 11 -1 0
100
end_operator
begin_operator
move_free #q2 #q6 #t179
1
8 0
3
0 12 8 12
0 9 0 1
0 11 -1 0
100
end_operator
begin_operator
move_free #q2 #q7 #t180
1
8 0
3
0 12 8 13
0 9 0 1
0 11 -1 0
100
end_operator
begin_operator
move_free #q2 #q8 #t181
1
8 0
3
0 12 8 14
0 9 0 1
0 11 -1 0
100
end_operator
begin_operator
move_free #q2 #q9 #t182
1
8 0
3
0 12 8 15
0 9 0 1
0 11 -1 0
100
end_operator
begin_operator
move_free #q2 q616 #t32
1
8 0
3
0 12 8 16
0 9 0 1
0 11 -1 0
100
end_operator
begin_operator
move_free #q3 #q0 #t38
1
8 0
3
0 12 9 0
0 9 0 1
0 11 -1 0
100
end_operator
begin_operator
move_free #q3 #q1 #t39
1
8 0
3
0 12 9 1
0 9 0 1
0 11 -1 0
100
end_operator
begin_operator
move_free #q3 #q10 #t195
1
8 0
3
0 12 9 2
0 9 0 1
0 11 -1 0
100
end_operator
begin_operator
move_free #q3 #q11 #t196
1
8 0
3
0 12 9 3
0 9 0 1
0 11 -1 0
100
end_operator
begin_operator
move_free #q3 #q12 #t197
1
8 0
3
0 12 9 4
0 9 0 1
0 11 -1 0
100
end_operator
begin_operator
move_free #q3 #q13 #t198
1
8 0
3
0 12 9 5
0 9 0 1
0 11 -1 0
100
end_operator
begin_operator
move_free #q3 #q14 #t199
1
8 0
3
0 12 9 6
0 9 0 1
0 11 -1 0
100
end_operator
begin_operator
move_free #q3 #q15 #t200
1
8 0
3
0 12 9 7
0 9 0 1
0 11 -1 0
100
end_operator
begin_operator
move_free #q3 #q2 #t40
1
8 0
3
0 12 9 8
0 9 0 1
0 11 -1 0
100
end_operator
begin_operator
move_free #q3 #q3 #t41
2
12 9
8 0
2
0 9 0 1
0 11 -1 0
100
end_operator
begin_operator
move_free #q3 #q4 #t189
1
8 0
3
0 12 9 10
0 9 0 1
0 11 -1 0
100
end_operator
begin_operator
move_free #q3 #q5 #t190
1
8 0
3
0 12 9 11
0 9 0 1
0 11 -1 0
100
end_operator
begin_operator
move_free #q3 #q6 #t191
1
8 0
3
0 12 9 12
0 9 0 1
0 11 -1 0
100
end_operator
begin_operator
move_free #q3 #q7 #t192
1
8 0
3
0 12 9 13
0 9 0 1
0 11 -1 0
100
end_operator
begin_operator
move_free #q3 #q8 #t193
1
8 0
3
0 12 9 14
0 9 0 1
0 11 -1 0
100
end_operator
begin_operator
move_free #q3 #q9 #t194
1
8 0
3
0 12 9 15
0 9 0 1
0 11 -1 0
100
end_operator
begin_operator
move_free #q3 q616 #t37
1
8 0
3
0 12 9 16
0 9 0 1
0 11 -1 0
100
end_operator
begin_operator
move_free #q4 #q0 #t202
1
8 0
3
0 12 10 0
0 9 0 1
0 11 -1 0
100
end_operator
begin_operator
move_free #q4 #q1 #t203
1
8 0
3
0 12 10 1
0 9 0 1
0 11 -1 0
100
end_operator
begin_operator
move_free #q4 #q10 #t212
1
8 0
3
0 12 10 2
0 9 0 1
0 11 -1 0
100
end_operator
begin_operator
move_free #q4 #q11 #t213
1
8 0
3
0 12 10 3
0 9 0 1
0 11 -1 0
100
end_operator
begin_operator
move_free #q4 #q12 #t214
1
8 0
3
0 12 10 4
0 9 0 1
0 11 -1 0
100
end_operator
begin_operator
move_free #q4 #q13 #t215
1
8 0
3
0 12 10 5
0 9 0 1
0 11 -1 0
100
end_operator
begin_operator
move_free #q4 #q14 #t216
1
8 0
3
0 12 10 6
0 9 0 1
0 11 -1 0
100
end_operator
begin_operator
move_free #q4 #q15 #t217
1
8 0
3
0 12 10 7
0 9 0 1
0 11 -1 0
100
end_operator
begin_operator
move_free #q4 #q2 #t204
1
8 0
3
0 12 10 8
0 9 0 1
0 11 -1 0
100
end_operator
begin_operator
move_free #q4 #q3 #t205
1
8 0
3
0 12 10 9
0 9 0 1
0 11 -1 0
100
end_operator
begin_operator
move_free #q4 #q4 #t206
2
12 10
8 0
2
0 9 0 1
0 11 -1 0
100
end_operator
begin_operator
move_free #q4 #q5 #t207
1
8 0
3
0 12 10 11
0 9 0 1
0 11 -1 0
100
end_operator
begin_operator
move_free #q4 #q6 #t208
1
8 0
3
0 12 10 12
0 9 0 1
0 11 -1 0
100
end_operator
begin_operator
move_free #q4 #q7 #t209
1
8 0
3
0 12 10 13
0 9 0 1
0 11 -1 0
100
end_operator
begin_operator
move_free #q4 #q8 #t210
1
8 0
3
0 12 10 14
0 9 0 1
0 11 -1 0
100
end_operator
begin_operator
move_free #q4 #q9 #t211
1
8 0
3
0 12 10 15
0 9 0 1
0 11 -1 0
100
end_operator
begin_operator
move_free #q4 q616 #t201
1
8 0
3
0 12 10 16
0 9 0 1
0 11 -1 0
100
end_operator
begin_operator
move_free #q5 #q0 #t219
1
8 0
3
0 12 11 0
0 9 0 1
0 11 -1 0
100
end_operator
begin_operator
move_free #q5 #q1 #t220
1
8 0
3
0 12 11 1
0 9 0 1
0 11 -1 0
100
end_operator
begin_operator
move_free #q5 #q10 #t229
1
8 0
3
0 12 11 2
0 9 0 1
0 11 -1 0
100
end_operator
begin_operator
move_free #q5 #q11 #t230
1
8 0
3
0 12 11 3
0 9 0 1
0 11 -1 0
100
end_operator
begin_operator
move_free #q5 #q12 #t231
1
8 0
3
0 12 11 4
0 9 0 1
0 11 -1 0
100
end_operator
begin_operator
move_free #q5 #q13 #t232
1
8 0
3
0 12 11 5
0 9 0 1
0 11 -1 0
100
end_operator
begin_operator
move_free #q5 #q14 #t233
1
8 0
3
0 12 11 6
0 9 0 1
0 11 -1 0
100
end_operator
begin_operator
move_free #q5 #q15 #t234
1
8 0
3
0 12 11 7
0 9 0 1
0 11 -1 0
100
end_operator
begin_operator
move_free #q5 #q2 #t221
1
8 0
3
0 12 11 8
0 9 0 1
0 11 -1 0
100
end_operator
begin_operator
move_free #q5 #q3 #t222
1
8 0
3
0 12 11 9
0 9 0 1
0 11 -1 0
100
end_operator
begin_operator
move_free #q5 #q4 #t223
1
8 0
3
0 12 11 10
0 9 0 1
0 11 -1 0
100
end_operator
begin_operator
move_free #q5 #q5 #t224
2
12 11
8 0
2
0 9 0 1
0 11 -1 0
100
end_operator
begin_operator
move_free #q5 #q6 #t225
1
8 0
3
0 12 11 12
0 9 0 1
0 11 -1 0
100
end_operator
begin_operator
move_free #q5 #q7 #t226
1
8 0
3
0 12 11 13
0 9 0 1
0 11 -1 0
100
end_operator
begin_operator
move_free #q5 #q8 #t227
1
8 0
3
0 12 11 14
0 9 0 1
0 11 -1 0
100
end_operator
begin_operator
move_free #q5 #q9 #t228
1
8 0
3
0 12 11 15
0 9 0 1
0 11 -1 0
100
end_operator
begin_operator
move_free #q5 q616 #t218
1
8 0
3
0 12 11 16
0 9 0 1
0 11 -1 0
100
end_operator
begin_operator
move_free #q6 #q0 #t236
1
8 0
3
0 12 12 0
0 9 0 1
0 11 -1 0
100
end_operator
begin_operator
move_free #q6 #q1 #t237
1
8 0
3
0 12 12 1
0 9 0 1
0 11 -1 0
100
end_operator
begin_operator
move_free #q6 #q10 #t246
1
8 0
3
0 12 12 2
0 9 0 1
0 11 -1 0
100
end_operator
begin_operator
move_free #q6 #q11 #t247
1
8 0
3
0 12 12 3
0 9 0 1
0 11 -1 0
100
end_operator
begin_operator
move_free #q6 #q12 #t248
1
8 0
3
0 12 12 4
0 9 0 1
0 11 -1 0
100
end_operator
begin_operator
move_free #q6 #q13 #t249
1
8 0
3
0 12 12 5
0 9 0 1
0 11 -1 0
100
end_operator
begin_operator
move_free #q6 #q14 #t250
1
8 0
3
0 12 12 6
0 9 0 1
0 11 -1 0
100
end_operator
begin_operator
move_free #q6 #q15 #t251
1
8 0
3
0 12 12 7
0 9 0 1
0 11 -1 0
100
end_operator
begin_operator
move_free #q6 #q2 #t238
1
8 0
3
0 12 12 8
0 9 0 1
0 11 -1 0
100
end_operator
begin_operator
move_free #q6 #q3 #t239
1
8 0
3
0 12 12 9
0 9 0 1
0 11 -1 0
100
end_operator
begin_operator
move_free #q6 #q4 #t240
1
8 0
3
0 12 12 10
0 9 0 1
0 11 -1 0
100
end_operator
begin_operator
move_free #q6 #q5 #t241
1
8 0
3
0 12 12 11
0 9 0 1
0 11 -1 0
100
end_operator
begin_operator
move_free #q6 #q6 #t242
2
12 12
8 0
2
0 9 0 1
0 11 -1 0
100
end_operator
begin_operator
move_free #q6 #q7 #t243
1
8 0
3
0 12 12 13
0 9 0 1
0 11 -1 0
100
end_operator
begin_operator
move_free #q6 #q8 #t244
1
8 0
3
0 12 12 14
0 9 0 1
0 11 -1 0
100
end_operator
begin_operator
move_free #q6 #q9 #t245
1
8 0
3
0 12 12 15
0 9 0 1
0 11 -1 0
100
end_operator
begin_operator
move_free #q6 q616 #t235
1
8 0
3
0 12 12 16
0 9 0 1
0 11 -1 0
100
end_operator
begin_operator
move_free #q7 #q0 #t253
1
8 0
3
0 12 13 0
0 9 0 1
0 11 -1 0
100
end_operator
begin_operator
move_free #q7 #q1 #t254
1
8 0
3
0 12 13 1
0 9 0 1
0 11 -1 0
100
end_operator
begin_operator
move_free #q7 #q10 #t263
1
8 0
3
0 12 13 2
0 9 0 1
0 11 -1 0
100
end_operator
begin_operator
move_free #q7 #q11 #t264
1
8 0
3
0 12 13 3
0 9 0 1
0 11 -1 0
100
end_operator
begin_operator
move_free #q7 #q12 #t265
1
8 0
3
0 12 13 4
0 9 0 1
0 11 -1 0
100
end_operator
begin_operator
move_free #q7 #q13 #t266
1
8 0
3
0 12 13 5
0 9 0 1
0 11 -1 0
100
end_operator
begin_operator
move_free #q7 #q14 #t267
1
8 0
3
0 12 13 6
0 9 0 1
0 11 -1 0
100
end_operator
begin_operator
move_free #q7 #q15 #t268
1
8 0
3
0 12 13 7
0 9 0 1
0 11 -1 0
100
end_operator
begin_operator
move_free #q7 #q2 #t255
1
8 0
3
0 12 13 8
0 9 0 1
0 11 -1 0
100
end_operator
begin_operator
move_free #q7 #q3 #t256
1
8 0
3
0 12 13 9
0 9 0 1
0 11 -1 0
100
end_operator
begin_operator
move_free #q7 #q4 #t257
1
8 0
3
0 12 13 10
0 9 0 1
0 11 -1 0
100
end_operator
begin_operator
move_free #q7 #q5 #t258
1
8 0
3
0 12 13 11
0 9 0 1
0 11 -1 0
100
end_operator
begin_operator
move_free #q7 #q6 #t259
1
8 0
3
0 12 13 12
0 9 0 1
0 11 -1 0
100
end_operator
begin_operator
move_free #q7 #q7 #t260
2
12 13
8 0
2
0 9 0 1
0 11 -1 0
100
end_operator
begin_operator
move_free #q7 #q8 #t261
1
8 0
3
0 12 13 14
0 9 0 1
0 11 -1 0
100
end_operator
begin_operator
move_free #q7 #q9 #t262
1
8 0
3
0 12 13 15
0 9 0 1
0 11 -1 0
100
end_operator
begin_operator
move_free #q7 q616 #t252
1
8 0
3
0 12 13 16
0 9 0 1
0 11 -1 0
100
end_operator
begin_operator
move_free #q8 #q0 #t270
1
8 0
3
0 12 14 0
0 9 0 1
0 11 -1 0
100
end_operator
begin_operator
move_free #q8 #q1 #t271
1
8 0
3
0 12 14 1
0 9 0 1
0 11 -1 0
100
end_operator
begin_operator
move_free #q8 #q10 #t280
1
8 0
3
0 12 14 2
0 9 0 1
0 11 -1 0
100
end_operator
begin_operator
move_free #q8 #q11 #t281
1
8 0
3
0 12 14 3
0 9 0 1
0 11 -1 0
100
end_operator
begin_operator
move_free #q8 #q12 #t282
1
8 0
3
0 12 14 4
0 9 0 1
0 11 -1 0
100
end_operator
begin_operator
move_free #q8 #q13 #t283
1
8 0
3
0 12 14 5
0 9 0 1
0 11 -1 0
100
end_operator
begin_operator
move_free #q8 #q14 #t284
1
8 0
3
0 12 14 6
0 9 0 1
0 11 -1 0
100
end_operator
begin_operator
move_free #q8 #q15 #t285
1
8 0
3
0 12 14 7
0 9 0 1
0 11 -1 0
100
end_operator
begin_operator
move_free #q8 #q2 #t272
1
8 0
3
0 12 14 8
0 9 0 1
0 11 -1 0
100
end_operator
begin_operator
move_free #q8 #q3 #t273
1
8 0
3
0 12 14 9
0 9 0 1
0 11 -1 0
100
end_operator
begin_operator
move_free #q8 #q4 #t274
1
8 0
3
0 12 14 10
0 9 0 1
0 11 -1 0
100
end_operator
begin_operator
move_free #q8 #q5 #t275
1
8 0
3
0 12 14 11
0 9 0 1
0 11 -1 0
100
end_operator
begin_operator
move_free #q8 #q6 #t276
1
8 0
3
0 12 14 12
0 9 0 1
0 11 -1 0
100
end_operator
begin_operator
move_free #q8 #q7 #t277
1
8 0
3
0 12 14 13
0 9 0 1
0 11 -1 0
100
end_operator
begin_operator
move_free #q8 #q8 #t278
2
12 14
8 0
2
0 9 0 1
0 11 -1 0
100
end_operator
begin_operator
move_free #q8 #q9 #t279
1
8 0
3
0 12 14 15
0 9 0 1
0 11 -1 0
100
end_operator
begin_operator
move_free #q8 q616 #t269
1
8 0
3
0 12 14 16
0 9 0 1
0 11 -1 0
100
end_operator
begin_operator
move_free #q9 #q0 #t287
1
8 0
3
0 12 15 0
0 9 0 1
0 11 -1 0
100
end_operator
begin_operator
move_free #q9 #q1 #t288
1
8 0
3
0 12 15 1
0 9 0 1
0 11 -1 0
100
end_operator
begin_operator
move_free #q9 #q10 #t297
1
8 0
3
0 12 15 2
0 9 0 1
0 11 -1 0
100
end_operator
begin_operator
move_free #q9 #q11 #t298
1
8 0
3
0 12 15 3
0 9 0 1
0 11 -1 0
100
end_operator
begin_operator
move_free #q9 #q12 #t299
1
8 0
3
0 12 15 4
0 9 0 1
0 11 -1 0
100
end_operator
begin_operator
move_free #q9 #q13 #t300
1
8 0
3
0 12 15 5
0 9 0 1
0 11 -1 0
100
end_operator
begin_operator
move_free #q9 #q14 #t301
1
8 0
3
0 12 15 6
0 9 0 1
0 11 -1 0
100
end_operator
begin_operator
move_free #q9 #q15 #t302
1
8 0
3
0 12 15 7
0 9 0 1
0 11 -1 0
100
end_operator
begin_operator
move_free #q9 #q2 #t289
1
8 0
3
0 12 15 8
0 9 0 1
0 11 -1 0
100
end_operator
begin_operator
move_free #q9 #q3 #t290
1
8 0
3
0 12 15 9
0 9 0 1
0 11 -1 0
100
end_operator
begin_operator
move_free #q9 #q4 #t291
1
8 0
3
0 12 15 10
0 9 0 1
0 11 -1 0
100
end_operator
begin_operator
move_free #q9 #q5 #t292
1
8 0
3
0 12 15 11
0 9 0 1
0 11 -1 0
100
end_operator
begin_operator
move_free #q9 #q6 #t293
1
8 0
3
0 12 15 12
0 9 0 1
0 11 -1 0
100
end_operator
begin_operator
move_free #q9 #q7 #t294
1
8 0
3
0 12 15 13
0 9 0 1
0 11 -1 0
100
end_operator
begin_operator
move_free #q9 #q8 #t295
1
8 0
3
0 12 15 14
0 9 0 1
0 11 -1 0
100
end_operator
begin_operator
move_free #q9 #q9 #t296
2
12 15
8 0
2
0 9 0 1
0 11 -1 0
100
end_operator
begin_operator
move_free #q9 q616 #t286
1
8 0
3
0 12 15 16
0 9 0 1
0 11 -1 0
100
end_operator
begin_operator
move_free q616 #q0 #t18
1
8 0
3
0 12 16 0
0 9 0 1
0 11 -1 0
100
end_operator
begin_operator
move_free q616 #q1 #t19
1
8 0
3
0 12 16 1
0 9 0 1
0 11 -1 0
100
end_operator
begin_operator
move_free q616 #q10 #t147
1
8 0
3
0 12 16 2
0 9 0 1
0 11 -1 0
100
end_operator
begin_operator
move_free q616 #q11 #t148
1
8 0
3
0 12 16 3
0 9 0 1
0 11 -1 0
100
end_operator
begin_operator
move_free q616 #q12 #t149
1
8 0
3
0 12 16 4
0 9 0 1
0 11 -1 0
100
end_operator
begin_operator
move_free q616 #q13 #t150
1
8 0
3
0 12 16 5
0 9 0 1
0 11 -1 0
100
end_operator
begin_operator
move_free q616 #q14 #t151
1
8 0
3
0 12 16 6
0 9 0 1
0 11 -1 0
100
end_operator
begin_operator
move_free q616 #q15 #t152
1
8 0
3
0 12 16 7
0 9 0 1
0 11 -1 0
100
end_operator
begin_operator
move_free q616 #q2 #t20
1
8 0
3
0 12 16 8
0 9 0 1
0 11 -1 0
100
end_operator
begin_operator
move_free q616 #q3 #t21
1
8 0
3
0 12 16 9
0 9 0 1
0 11 -1 0
100
end_operator
begin_operator
move_free q616 #q4 #t141
1
8 0
3
0 12 16 10
0 9 0 1
0 11 -1 0
100
end_operator
begin_operator
move_free q616 #q5 #t142
1
8 0
3
0 12 16 11
0 9 0 1
0 11 -1 0
100
end_operator
begin_operator
move_free q616 #q6 #t143
1
8 0
3
0 12 16 12
0 9 0 1
0 11 -1 0
100
end_operator
begin_operator
move_free q616 #q7 #t144
1
8 0
3
0 12 16 13
0 9 0 1
0 11 -1 0
100
end_operator
begin_operator
move_free q616 #q8 #t145
1
8 0
3
0 12 16 14
0 9 0 1
0 11 -1 0
100
end_operator
begin_operator
move_free q616 #q9 #t146
1
8 0
3
0 12 16 15
0 9 0 1
0 11 -1 0
100
end_operator
begin_operator
move_free q616 q616 #t0
2
12 16
8 0
2
0 9 0 1
0 11 -1 0
100
end_operator
begin_operator
move_holding #q0 #q0 o10 #g0 #t65
2
12 0
7 0
3
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q0 #q0 o10 #g1 #t66
2
12 0
7 1
3
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q0 #q0 o10 #g2 #t67
2
12 0
7 2
3
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q0 #q0 o10 #g3 #t68
2
12 0
7 3
3
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q0 #q1 o10 #g0 #t69
1
7 0
4
0 12 0 1
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q0 #q1 o10 #g1 #t70
1
7 1
4
0 12 0 1
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q0 #q1 o10 #g2 #t71
1
7 2
4
0 12 0 1
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q0 #q1 o10 #g3 #t72
1
7 3
4
0 12 0 1
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q0 #q10 o10 #g0 #t477
1
7 0
4
0 12 0 2
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q0 #q10 o10 #g1 #t478
1
7 1
4
0 12 0 2
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q0 #q10 o10 #g2 #t479
1
7 2
4
0 12 0 2
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q0 #q10 o10 #g3 #t480
1
7 3
4
0 12 0 2
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q0 #q11 o10 #g0 #t481
1
7 0
4
0 12 0 3
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q0 #q11 o10 #g1 #t482
1
7 1
4
0 12 0 3
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q0 #q11 o10 #g2 #t483
1
7 2
4
0 12 0 3
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q0 #q11 o10 #g3 #t484
1
7 3
4
0 12 0 3
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q0 #q12 o10 #g0 #t485
1
7 0
4
0 12 0 4
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q0 #q12 o10 #g1 #t486
1
7 1
4
0 12 0 4
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q0 #q12 o10 #g2 #t487
1
7 2
4
0 12 0 4
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q0 #q12 o10 #g3 #t488
1
7 3
4
0 12 0 4
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q0 #q13 o10 #g0 #t489
1
7 0
4
0 12 0 5
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q0 #q13 o10 #g1 #t490
1
7 1
4
0 12 0 5
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q0 #q13 o10 #g2 #t491
1
7 2
4
0 12 0 5
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q0 #q13 o10 #g3 #t492
1
7 3
4
0 12 0 5
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q0 #q14 o10 #g0 #t493
1
7 0
4
0 12 0 6
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q0 #q14 o10 #g1 #t494
1
7 1
4
0 12 0 6
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q0 #q14 o10 #g2 #t495
1
7 2
4
0 12 0 6
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q0 #q14 o10 #g3 #t496
1
7 3
4
0 12 0 6
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q0 #q15 o10 #g0 #t497
1
7 0
4
0 12 0 7
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q0 #q15 o10 #g1 #t498
1
7 1
4
0 12 0 7
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q0 #q15 o10 #g2 #t499
1
7 2
4
0 12 0 7
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q0 #q15 o10 #g3 #t500
1
7 3
4
0 12 0 7
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q0 #q2 o10 #g0 #t73
1
7 0
4
0 12 0 8
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q0 #q2 o10 #g1 #t74
1
7 1
4
0 12 0 8
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q0 #q2 o10 #g2 #t75
1
7 2
4
0 12 0 8
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q0 #q2 o10 #g3 #t76
1
7 3
4
0 12 0 8
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q0 #q3 o10 #g0 #t77
1
7 0
4
0 12 0 9
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q0 #q3 o10 #g1 #t78
1
7 1
4
0 12 0 9
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q0 #q3 o10 #g2 #t79
1
7 2
4
0 12 0 9
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q0 #q3 o10 #g3 #t80
1
7 3
4
0 12 0 9
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q0 #q4 o10 #g0 #t453
1
7 0
4
0 12 0 10
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q0 #q4 o10 #g1 #t454
1
7 1
4
0 12 0 10
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q0 #q4 o10 #g2 #t455
1
7 2
4
0 12 0 10
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q0 #q4 o10 #g3 #t456
1
7 3
4
0 12 0 10
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q0 #q5 o10 #g0 #t457
1
7 0
4
0 12 0 11
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q0 #q5 o10 #g1 #t458
1
7 1
4
0 12 0 11
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q0 #q5 o10 #g2 #t459
1
7 2
4
0 12 0 11
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q0 #q5 o10 #g3 #t460
1
7 3
4
0 12 0 11
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q0 #q6 o10 #g0 #t461
1
7 0
4
0 12 0 12
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q0 #q6 o10 #g1 #t462
1
7 1
4
0 12 0 12
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q0 #q6 o10 #g2 #t463
1
7 2
4
0 12 0 12
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q0 #q6 o10 #g3 #t464
1
7 3
4
0 12 0 12
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q0 #q7 o10 #g0 #t465
1
7 0
4
0 12 0 13
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q0 #q7 o10 #g1 #t466
1
7 1
4
0 12 0 13
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q0 #q7 o10 #g2 #t467
1
7 2
4
0 12 0 13
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q0 #q7 o10 #g3 #t468
1
7 3
4
0 12 0 13
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q0 #q8 o10 #g0 #t469
1
7 0
4
0 12 0 14
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q0 #q8 o10 #g1 #t470
1
7 1
4
0 12 0 14
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q0 #q8 o10 #g2 #t471
1
7 2
4
0 12 0 14
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q0 #q8 o10 #g3 #t472
1
7 3
4
0 12 0 14
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q0 #q9 o10 #g0 #t473
1
7 0
4
0 12 0 15
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q0 #q9 o10 #g1 #t474
1
7 1
4
0 12 0 15
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q0 #q9 o10 #g2 #t475
1
7 2
4
0 12 0 15
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q0 #q9 o10 #g3 #t476
1
7 3
4
0 12 0 15
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q0 q616 o10 #g0 #t61
1
7 0
4
0 12 0 16
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q0 q616 o10 #g1 #t62
1
7 1
4
0 12 0 16
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q0 q616 o10 #g2 #t63
1
7 2
4
0 12 0 16
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q0 q616 o10 #g3 #t64
1
7 3
4
0 12 0 16
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q1 #q0 o10 #g0 #t85
1
7 0
4
0 12 1 0
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q1 #q0 o10 #g1 #t86
1
7 1
4
0 12 1 0
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q1 #q0 o10 #g2 #t87
1
7 2
4
0 12 1 0
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q1 #q0 o10 #g3 #t88
1
7 3
4
0 12 1 0
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q1 #q1 o10 #g0 #t89
2
12 1
7 0
3
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q1 #q1 o10 #g1 #t90
2
12 1
7 1
3
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q1 #q1 o10 #g2 #t91
2
12 1
7 2
3
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q1 #q1 o10 #g3 #t92
2
12 1
7 3
3
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q1 #q10 o10 #g0 #t525
1
7 0
4
0 12 1 2
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q1 #q10 o10 #g1 #t526
1
7 1
4
0 12 1 2
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q1 #q10 o10 #g2 #t527
1
7 2
4
0 12 1 2
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q1 #q10 o10 #g3 #t528
1
7 3
4
0 12 1 2
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q1 #q11 o10 #g0 #t529
1
7 0
4
0 12 1 3
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q1 #q11 o10 #g1 #t530
1
7 1
4
0 12 1 3
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q1 #q11 o10 #g2 #t531
1
7 2
4
0 12 1 3
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q1 #q11 o10 #g3 #t532
1
7 3
4
0 12 1 3
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q1 #q12 o10 #g0 #t533
1
7 0
4
0 12 1 4
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q1 #q12 o10 #g1 #t534
1
7 1
4
0 12 1 4
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q1 #q12 o10 #g2 #t535
1
7 2
4
0 12 1 4
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q1 #q12 o10 #g3 #t536
1
7 3
4
0 12 1 4
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q1 #q13 o10 #g0 #t537
1
7 0
4
0 12 1 5
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q1 #q13 o10 #g1 #t538
1
7 1
4
0 12 1 5
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q1 #q13 o10 #g2 #t539
1
7 2
4
0 12 1 5
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q1 #q13 o10 #g3 #t540
1
7 3
4
0 12 1 5
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q1 #q14 o10 #g0 #t541
1
7 0
4
0 12 1 6
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q1 #q14 o10 #g1 #t542
1
7 1
4
0 12 1 6
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q1 #q14 o10 #g2 #t543
1
7 2
4
0 12 1 6
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q1 #q14 o10 #g3 #t544
1
7 3
4
0 12 1 6
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q1 #q15 o10 #g0 #t545
1
7 0
4
0 12 1 7
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q1 #q15 o10 #g1 #t546
1
7 1
4
0 12 1 7
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q1 #q15 o10 #g2 #t547
1
7 2
4
0 12 1 7
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q1 #q15 o10 #g3 #t548
1
7 3
4
0 12 1 7
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q1 #q2 o10 #g0 #t93
1
7 0
4
0 12 1 8
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q1 #q2 o10 #g1 #t94
1
7 1
4
0 12 1 8
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q1 #q2 o10 #g2 #t95
1
7 2
4
0 12 1 8
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q1 #q2 o10 #g3 #t96
1
7 3
4
0 12 1 8
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q1 #q3 o10 #g0 #t97
1
7 0
4
0 12 1 9
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q1 #q3 o10 #g1 #t98
1
7 1
4
0 12 1 9
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q1 #q3 o10 #g2 #t99
1
7 2
4
0 12 1 9
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q1 #q3 o10 #g3 #t100
1
7 3
4
0 12 1 9
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q1 #q4 o10 #g0 #t501
1
7 0
4
0 12 1 10
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q1 #q4 o10 #g1 #t502
1
7 1
4
0 12 1 10
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q1 #q4 o10 #g2 #t503
1
7 2
4
0 12 1 10
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q1 #q4 o10 #g3 #t504
1
7 3
4
0 12 1 10
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q1 #q5 o10 #g0 #t505
1
7 0
4
0 12 1 11
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q1 #q5 o10 #g1 #t506
1
7 1
4
0 12 1 11
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q1 #q5 o10 #g2 #t507
1
7 2
4
0 12 1 11
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q1 #q5 o10 #g3 #t508
1
7 3
4
0 12 1 11
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q1 #q6 o10 #g0 #t509
1
7 0
4
0 12 1 12
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q1 #q6 o10 #g1 #t510
1
7 1
4
0 12 1 12
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q1 #q6 o10 #g2 #t511
1
7 2
4
0 12 1 12
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q1 #q6 o10 #g3 #t512
1
7 3
4
0 12 1 12
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q1 #q7 o10 #g0 #t513
1
7 0
4
0 12 1 13
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q1 #q7 o10 #g1 #t514
1
7 1
4
0 12 1 13
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q1 #q7 o10 #g2 #t515
1
7 2
4
0 12 1 13
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q1 #q7 o10 #g3 #t516
1
7 3
4
0 12 1 13
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q1 #q8 o10 #g0 #t517
1
7 0
4
0 12 1 14
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q1 #q8 o10 #g1 #t518
1
7 1
4
0 12 1 14
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q1 #q8 o10 #g2 #t519
1
7 2
4
0 12 1 14
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q1 #q8 o10 #g3 #t520
1
7 3
4
0 12 1 14
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q1 #q9 o10 #g0 #t521
1
7 0
4
0 12 1 15
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q1 #q9 o10 #g1 #t522
1
7 1
4
0 12 1 15
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q1 #q9 o10 #g2 #t523
1
7 2
4
0 12 1 15
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q1 #q9 o10 #g3 #t524
1
7 3
4
0 12 1 15
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q1 q616 o10 #g0 #t81
1
7 0
4
0 12 1 16
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q1 q616 o10 #g1 #t82
1
7 1
4
0 12 1 16
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q1 q616 o10 #g2 #t83
1
7 2
4
0 12 1 16
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q1 q616 o10 #g3 #t84
1
7 3
4
0 12 1 16
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q10 #q0 o10 #g0 #t1057
1
7 0
4
0 12 2 0
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q10 #q0 o10 #g1 #t1058
1
7 1
4
0 12 2 0
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q10 #q0 o10 #g2 #t1059
1
7 2
4
0 12 2 0
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q10 #q0 o10 #g3 #t1060
1
7 3
4
0 12 2 0
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q10 #q1 o10 #g0 #t1061
1
7 0
4
0 12 2 1
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q10 #q1 o10 #g1 #t1062
1
7 1
4
0 12 2 1
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q10 #q1 o10 #g2 #t1063
1
7 2
4
0 12 2 1
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q10 #q1 o10 #g3 #t1064
1
7 3
4
0 12 2 1
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q10 #q10 o10 #g0 #t1097
2
12 2
7 0
3
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q10 #q10 o10 #g1 #t1098
2
12 2
7 1
3
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q10 #q10 o10 #g2 #t1099
2
12 2
7 2
3
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q10 #q10 o10 #g3 #t1100
2
12 2
7 3
3
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q10 #q11 o10 #g0 #t1101
1
7 0
4
0 12 2 3
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q10 #q11 o10 #g1 #t1102
1
7 1
4
0 12 2 3
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q10 #q11 o10 #g2 #t1103
1
7 2
4
0 12 2 3
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q10 #q11 o10 #g3 #t1104
1
7 3
4
0 12 2 3
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q10 #q12 o10 #g0 #t1105
1
7 0
4
0 12 2 4
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q10 #q12 o10 #g1 #t1106
1
7 1
4
0 12 2 4
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q10 #q12 o10 #g2 #t1107
1
7 2
4
0 12 2 4
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q10 #q12 o10 #g3 #t1108
1
7 3
4
0 12 2 4
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q10 #q13 o10 #g0 #t1109
1
7 0
4
0 12 2 5
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q10 #q13 o10 #g1 #t1110
1
7 1
4
0 12 2 5
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q10 #q13 o10 #g2 #t1111
1
7 2
4
0 12 2 5
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q10 #q13 o10 #g3 #t1112
1
7 3
4
0 12 2 5
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q10 #q14 o10 #g0 #t1113
1
7 0
4
0 12 2 6
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q10 #q14 o10 #g1 #t1114
1
7 1
4
0 12 2 6
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q10 #q14 o10 #g2 #t1115
1
7 2
4
0 12 2 6
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q10 #q14 o10 #g3 #t1116
1
7 3
4
0 12 2 6
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q10 #q15 o10 #g0 #t1117
1
7 0
4
0 12 2 7
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q10 #q15 o10 #g1 #t1118
1
7 1
4
0 12 2 7
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q10 #q15 o10 #g2 #t1119
1
7 2
4
0 12 2 7
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q10 #q15 o10 #g3 #t1120
1
7 3
4
0 12 2 7
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q10 #q2 o10 #g0 #t1065
1
7 0
4
0 12 2 8
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q10 #q2 o10 #g1 #t1066
1
7 1
4
0 12 2 8
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q10 #q2 o10 #g2 #t1067
1
7 2
4
0 12 2 8
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q10 #q2 o10 #g3 #t1068
1
7 3
4
0 12 2 8
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q10 #q3 o10 #g0 #t1069
1
7 0
4
0 12 2 9
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q10 #q3 o10 #g1 #t1070
1
7 1
4
0 12 2 9
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q10 #q3 o10 #g2 #t1071
1
7 2
4
0 12 2 9
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q10 #q3 o10 #g3 #t1072
1
7 3
4
0 12 2 9
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q10 #q4 o10 #g0 #t1073
1
7 0
4
0 12 2 10
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q10 #q4 o10 #g1 #t1074
1
7 1
4
0 12 2 10
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q10 #q4 o10 #g2 #t1075
1
7 2
4
0 12 2 10
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q10 #q4 o10 #g3 #t1076
1
7 3
4
0 12 2 10
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q10 #q5 o10 #g0 #t1077
1
7 0
4
0 12 2 11
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q10 #q5 o10 #g1 #t1078
1
7 1
4
0 12 2 11
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q10 #q5 o10 #g2 #t1079
1
7 2
4
0 12 2 11
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q10 #q5 o10 #g3 #t1080
1
7 3
4
0 12 2 11
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q10 #q6 o10 #g0 #t1081
1
7 0
4
0 12 2 12
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q10 #q6 o10 #g1 #t1082
1
7 1
4
0 12 2 12
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q10 #q6 o10 #g2 #t1083
1
7 2
4
0 12 2 12
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q10 #q6 o10 #g3 #t1084
1
7 3
4
0 12 2 12
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q10 #q7 o10 #g0 #t1085
1
7 0
4
0 12 2 13
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q10 #q7 o10 #g1 #t1086
1
7 1
4
0 12 2 13
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q10 #q7 o10 #g2 #t1087
1
7 2
4
0 12 2 13
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q10 #q7 o10 #g3 #t1088
1
7 3
4
0 12 2 13
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q10 #q8 o10 #g0 #t1089
1
7 0
4
0 12 2 14
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q10 #q8 o10 #g1 #t1090
1
7 1
4
0 12 2 14
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q10 #q8 o10 #g2 #t1091
1
7 2
4
0 12 2 14
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q10 #q8 o10 #g3 #t1092
1
7 3
4
0 12 2 14
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q10 #q9 o10 #g0 #t1093
1
7 0
4
0 12 2 15
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q10 #q9 o10 #g1 #t1094
1
7 1
4
0 12 2 15
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q10 #q9 o10 #g2 #t1095
1
7 2
4
0 12 2 15
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q10 #q9 o10 #g3 #t1096
1
7 3
4
0 12 2 15
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q10 q616 o10 #g0 #t1053
1
7 0
4
0 12 2 16
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q10 q616 o10 #g1 #t1054
1
7 1
4
0 12 2 16
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q10 q616 o10 #g2 #t1055
1
7 2
4
0 12 2 16
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q10 q616 o10 #g3 #t1056
1
7 3
4
0 12 2 16
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q11 #q0 o10 #g0 #t1125
1
7 0
4
0 12 3 0
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q11 #q0 o10 #g1 #t1126
1
7 1
4
0 12 3 0
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q11 #q0 o10 #g2 #t1127
1
7 2
4
0 12 3 0
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q11 #q0 o10 #g3 #t1128
1
7 3
4
0 12 3 0
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q11 #q1 o10 #g0 #t1129
1
7 0
4
0 12 3 1
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q11 #q1 o10 #g1 #t1130
1
7 1
4
0 12 3 1
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q11 #q1 o10 #g2 #t1131
1
7 2
4
0 12 3 1
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q11 #q1 o10 #g3 #t1132
1
7 3
4
0 12 3 1
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q11 #q10 o10 #g0 #t1165
1
7 0
4
0 12 3 2
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q11 #q10 o10 #g1 #t1166
1
7 1
4
0 12 3 2
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q11 #q10 o10 #g2 #t1167
1
7 2
4
0 12 3 2
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q11 #q10 o10 #g3 #t1168
1
7 3
4
0 12 3 2
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q11 #q11 o10 #g0 #t1169
2
12 3
7 0
3
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q11 #q11 o10 #g1 #t1170
2
12 3
7 1
3
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q11 #q11 o10 #g2 #t1171
2
12 3
7 2
3
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q11 #q11 o10 #g3 #t1172
2
12 3
7 3
3
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q11 #q12 o10 #g0 #t1173
1
7 0
4
0 12 3 4
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q11 #q12 o10 #g1 #t1174
1
7 1
4
0 12 3 4
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q11 #q12 o10 #g2 #t1175
1
7 2
4
0 12 3 4
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q11 #q12 o10 #g3 #t1176
1
7 3
4
0 12 3 4
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q11 #q13 o10 #g0 #t1177
1
7 0
4
0 12 3 5
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q11 #q13 o10 #g1 #t1178
1
7 1
4
0 12 3 5
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q11 #q13 o10 #g2 #t1179
1
7 2
4
0 12 3 5
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q11 #q13 o10 #g3 #t1180
1
7 3
4
0 12 3 5
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q11 #q14 o10 #g0 #t1181
1
7 0
4
0 12 3 6
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q11 #q14 o10 #g1 #t1182
1
7 1
4
0 12 3 6
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q11 #q14 o10 #g2 #t1183
1
7 2
4
0 12 3 6
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q11 #q14 o10 #g3 #t1184
1
7 3
4
0 12 3 6
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q11 #q15 o10 #g0 #t1185
1
7 0
4
0 12 3 7
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q11 #q15 o10 #g1 #t1186
1
7 1
4
0 12 3 7
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q11 #q15 o10 #g2 #t1187
1
7 2
4
0 12 3 7
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q11 #q15 o10 #g3 #t1188
1
7 3
4
0 12 3 7
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q11 #q2 o10 #g0 #t1133
1
7 0
4
0 12 3 8
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q11 #q2 o10 #g1 #t1134
1
7 1
4
0 12 3 8
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q11 #q2 o10 #g2 #t1135
1
7 2
4
0 12 3 8
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q11 #q2 o10 #g3 #t1136
1
7 3
4
0 12 3 8
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q11 #q3 o10 #g0 #t1137
1
7 0
4
0 12 3 9
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q11 #q3 o10 #g1 #t1138
1
7 1
4
0 12 3 9
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q11 #q3 o10 #g2 #t1139
1
7 2
4
0 12 3 9
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q11 #q3 o10 #g3 #t1140
1
7 3
4
0 12 3 9
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q11 #q4 o10 #g0 #t1141
1
7 0
4
0 12 3 10
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q11 #q4 o10 #g1 #t1142
1
7 1
4
0 12 3 10
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q11 #q4 o10 #g2 #t1143
1
7 2
4
0 12 3 10
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q11 #q4 o10 #g3 #t1144
1
7 3
4
0 12 3 10
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q11 #q5 o10 #g0 #t1145
1
7 0
4
0 12 3 11
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q11 #q5 o10 #g1 #t1146
1
7 1
4
0 12 3 11
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q11 #q5 o10 #g2 #t1147
1
7 2
4
0 12 3 11
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q11 #q5 o10 #g3 #t1148
1
7 3
4
0 12 3 11
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q11 #q6 o10 #g0 #t1149
1
7 0
4
0 12 3 12
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q11 #q6 o10 #g1 #t1150
1
7 1
4
0 12 3 12
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q11 #q6 o10 #g2 #t1151
1
7 2
4
0 12 3 12
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q11 #q6 o10 #g3 #t1152
1
7 3
4
0 12 3 12
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q11 #q7 o10 #g0 #t1153
1
7 0
4
0 12 3 13
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q11 #q7 o10 #g1 #t1154
1
7 1
4
0 12 3 13
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q11 #q7 o10 #g2 #t1155
1
7 2
4
0 12 3 13
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q11 #q7 o10 #g3 #t1156
1
7 3
4
0 12 3 13
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q11 #q8 o10 #g0 #t1157
1
7 0
4
0 12 3 14
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q11 #q8 o10 #g1 #t1158
1
7 1
4
0 12 3 14
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q11 #q8 o10 #g2 #t1159
1
7 2
4
0 12 3 14
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q11 #q8 o10 #g3 #t1160
1
7 3
4
0 12 3 14
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q11 #q9 o10 #g0 #t1161
1
7 0
4
0 12 3 15
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q11 #q9 o10 #g1 #t1162
1
7 1
4
0 12 3 15
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q11 #q9 o10 #g2 #t1163
1
7 2
4
0 12 3 15
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q11 #q9 o10 #g3 #t1164
1
7 3
4
0 12 3 15
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q11 q616 o10 #g0 #t1121
1
7 0
4
0 12 3 16
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q11 q616 o10 #g1 #t1122
1
7 1
4
0 12 3 16
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q11 q616 o10 #g2 #t1123
1
7 2
4
0 12 3 16
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q11 q616 o10 #g3 #t1124
1
7 3
4
0 12 3 16
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q12 #q0 o10 #g0 #t1193
1
7 0
4
0 12 4 0
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q12 #q0 o10 #g1 #t1194
1
7 1
4
0 12 4 0
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q12 #q0 o10 #g2 #t1195
1
7 2
4
0 12 4 0
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q12 #q0 o10 #g3 #t1196
1
7 3
4
0 12 4 0
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q12 #q1 o10 #g0 #t1197
1
7 0
4
0 12 4 1
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q12 #q1 o10 #g1 #t1198
1
7 1
4
0 12 4 1
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q12 #q1 o10 #g2 #t1199
1
7 2
4
0 12 4 1
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q12 #q1 o10 #g3 #t1200
1
7 3
4
0 12 4 1
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q12 #q10 o10 #g0 #t1233
1
7 0
4
0 12 4 2
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q12 #q10 o10 #g1 #t1234
1
7 1
4
0 12 4 2
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q12 #q10 o10 #g2 #t1235
1
7 2
4
0 12 4 2
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q12 #q10 o10 #g3 #t1236
1
7 3
4
0 12 4 2
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q12 #q11 o10 #g0 #t1237
1
7 0
4
0 12 4 3
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q12 #q11 o10 #g1 #t1238
1
7 1
4
0 12 4 3
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q12 #q11 o10 #g2 #t1239
1
7 2
4
0 12 4 3
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q12 #q11 o10 #g3 #t1240
1
7 3
4
0 12 4 3
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q12 #q12 o10 #g0 #t1241
2
12 4
7 0
3
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q12 #q12 o10 #g1 #t1242
2
12 4
7 1
3
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q12 #q12 o10 #g2 #t1243
2
12 4
7 2
3
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q12 #q12 o10 #g3 #t1244
2
12 4
7 3
3
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q12 #q13 o10 #g0 #t1245
1
7 0
4
0 12 4 5
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q12 #q13 o10 #g1 #t1246
1
7 1
4
0 12 4 5
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q12 #q13 o10 #g2 #t1247
1
7 2
4
0 12 4 5
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q12 #q13 o10 #g3 #t1248
1
7 3
4
0 12 4 5
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q12 #q14 o10 #g0 #t1249
1
7 0
4
0 12 4 6
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q12 #q14 o10 #g1 #t1250
1
7 1
4
0 12 4 6
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q12 #q14 o10 #g2 #t1251
1
7 2
4
0 12 4 6
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q12 #q14 o10 #g3 #t1252
1
7 3
4
0 12 4 6
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q12 #q15 o10 #g0 #t1253
1
7 0
4
0 12 4 7
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q12 #q15 o10 #g1 #t1254
1
7 1
4
0 12 4 7
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q12 #q15 o10 #g2 #t1255
1
7 2
4
0 12 4 7
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q12 #q15 o10 #g3 #t1256
1
7 3
4
0 12 4 7
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q12 #q2 o10 #g0 #t1201
1
7 0
4
0 12 4 8
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q12 #q2 o10 #g1 #t1202
1
7 1
4
0 12 4 8
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q12 #q2 o10 #g2 #t1203
1
7 2
4
0 12 4 8
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q12 #q2 o10 #g3 #t1204
1
7 3
4
0 12 4 8
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q12 #q3 o10 #g0 #t1205
1
7 0
4
0 12 4 9
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q12 #q3 o10 #g1 #t1206
1
7 1
4
0 12 4 9
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q12 #q3 o10 #g2 #t1207
1
7 2
4
0 12 4 9
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q12 #q3 o10 #g3 #t1208
1
7 3
4
0 12 4 9
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q12 #q4 o10 #g0 #t1209
1
7 0
4
0 12 4 10
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q12 #q4 o10 #g1 #t1210
1
7 1
4
0 12 4 10
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q12 #q4 o10 #g2 #t1211
1
7 2
4
0 12 4 10
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q12 #q4 o10 #g3 #t1212
1
7 3
4
0 12 4 10
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q12 #q5 o10 #g0 #t1213
1
7 0
4
0 12 4 11
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q12 #q5 o10 #g1 #t1214
1
7 1
4
0 12 4 11
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q12 #q5 o10 #g2 #t1215
1
7 2
4
0 12 4 11
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q12 #q5 o10 #g3 #t1216
1
7 3
4
0 12 4 11
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q12 #q6 o10 #g0 #t1217
1
7 0
4
0 12 4 12
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q12 #q6 o10 #g1 #t1218
1
7 1
4
0 12 4 12
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q12 #q6 o10 #g2 #t1219
1
7 2
4
0 12 4 12
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q12 #q6 o10 #g3 #t1220
1
7 3
4
0 12 4 12
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q12 #q7 o10 #g0 #t1221
1
7 0
4
0 12 4 13
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q12 #q7 o10 #g1 #t1222
1
7 1
4
0 12 4 13
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q12 #q7 o10 #g2 #t1223
1
7 2
4
0 12 4 13
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q12 #q7 o10 #g3 #t1224
1
7 3
4
0 12 4 13
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q12 #q8 o10 #g0 #t1225
1
7 0
4
0 12 4 14
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q12 #q8 o10 #g1 #t1226
1
7 1
4
0 12 4 14
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q12 #q8 o10 #g2 #t1227
1
7 2
4
0 12 4 14
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q12 #q8 o10 #g3 #t1228
1
7 3
4
0 12 4 14
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q12 #q9 o10 #g0 #t1229
1
7 0
4
0 12 4 15
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q12 #q9 o10 #g1 #t1230
1
7 1
4
0 12 4 15
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q12 #q9 o10 #g2 #t1231
1
7 2
4
0 12 4 15
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q12 #q9 o10 #g3 #t1232
1
7 3
4
0 12 4 15
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q12 q616 o10 #g0 #t1189
1
7 0
4
0 12 4 16
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q12 q616 o10 #g1 #t1190
1
7 1
4
0 12 4 16
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q12 q616 o10 #g2 #t1191
1
7 2
4
0 12 4 16
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q12 q616 o10 #g3 #t1192
1
7 3
4
0 12 4 16
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q13 #q0 o10 #g0 #t1261
1
7 0
4
0 12 5 0
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q13 #q0 o10 #g1 #t1262
1
7 1
4
0 12 5 0
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q13 #q0 o10 #g2 #t1263
1
7 2
4
0 12 5 0
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q13 #q0 o10 #g3 #t1264
1
7 3
4
0 12 5 0
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q13 #q1 o10 #g0 #t1265
1
7 0
4
0 12 5 1
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q13 #q1 o10 #g1 #t1266
1
7 1
4
0 12 5 1
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q13 #q1 o10 #g2 #t1267
1
7 2
4
0 12 5 1
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q13 #q1 o10 #g3 #t1268
1
7 3
4
0 12 5 1
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q13 #q10 o10 #g0 #t1301
1
7 0
4
0 12 5 2
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q13 #q10 o10 #g1 #t1302
1
7 1
4
0 12 5 2
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q13 #q10 o10 #g2 #t1303
1
7 2
4
0 12 5 2
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q13 #q10 o10 #g3 #t1304
1
7 3
4
0 12 5 2
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q13 #q11 o10 #g0 #t1305
1
7 0
4
0 12 5 3
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q13 #q11 o10 #g1 #t1306
1
7 1
4
0 12 5 3
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q13 #q11 o10 #g2 #t1307
1
7 2
4
0 12 5 3
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q13 #q11 o10 #g3 #t1308
1
7 3
4
0 12 5 3
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q13 #q12 o10 #g0 #t1309
1
7 0
4
0 12 5 4
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q13 #q12 o10 #g1 #t1310
1
7 1
4
0 12 5 4
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q13 #q12 o10 #g2 #t1311
1
7 2
4
0 12 5 4
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q13 #q12 o10 #g3 #t1312
1
7 3
4
0 12 5 4
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q13 #q13 o10 #g0 #t1313
2
12 5
7 0
3
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q13 #q13 o10 #g1 #t1314
2
12 5
7 1
3
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q13 #q13 o10 #g2 #t1315
2
12 5
7 2
3
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q13 #q13 o10 #g3 #t1316
2
12 5
7 3
3
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q13 #q14 o10 #g0 #t1317
1
7 0
4
0 12 5 6
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q13 #q14 o10 #g1 #t1318
1
7 1
4
0 12 5 6
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q13 #q14 o10 #g2 #t1319
1
7 2
4
0 12 5 6
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q13 #q14 o10 #g3 #t1320
1
7 3
4
0 12 5 6
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q13 #q15 o10 #g0 #t1321
1
7 0
4
0 12 5 7
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q13 #q15 o10 #g1 #t1322
1
7 1
4
0 12 5 7
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q13 #q15 o10 #g2 #t1323
1
7 2
4
0 12 5 7
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q13 #q15 o10 #g3 #t1324
1
7 3
4
0 12 5 7
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q13 #q2 o10 #g0 #t1269
1
7 0
4
0 12 5 8
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q13 #q2 o10 #g1 #t1270
1
7 1
4
0 12 5 8
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q13 #q2 o10 #g2 #t1271
1
7 2
4
0 12 5 8
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q13 #q2 o10 #g3 #t1272
1
7 3
4
0 12 5 8
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q13 #q3 o10 #g0 #t1273
1
7 0
4
0 12 5 9
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q13 #q3 o10 #g1 #t1274
1
7 1
4
0 12 5 9
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q13 #q3 o10 #g2 #t1275
1
7 2
4
0 12 5 9
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q13 #q3 o10 #g3 #t1276
1
7 3
4
0 12 5 9
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q13 #q4 o10 #g0 #t1277
1
7 0
4
0 12 5 10
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q13 #q4 o10 #g1 #t1278
1
7 1
4
0 12 5 10
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q13 #q4 o10 #g2 #t1279
1
7 2
4
0 12 5 10
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q13 #q4 o10 #g3 #t1280
1
7 3
4
0 12 5 10
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q13 #q5 o10 #g0 #t1281
1
7 0
4
0 12 5 11
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q13 #q5 o10 #g1 #t1282
1
7 1
4
0 12 5 11
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q13 #q5 o10 #g2 #t1283
1
7 2
4
0 12 5 11
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q13 #q5 o10 #g3 #t1284
1
7 3
4
0 12 5 11
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q13 #q6 o10 #g0 #t1285
1
7 0
4
0 12 5 12
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q13 #q6 o10 #g1 #t1286
1
7 1
4
0 12 5 12
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q13 #q6 o10 #g2 #t1287
1
7 2
4
0 12 5 12
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q13 #q6 o10 #g3 #t1288
1
7 3
4
0 12 5 12
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q13 #q7 o10 #g0 #t1289
1
7 0
4
0 12 5 13
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q13 #q7 o10 #g1 #t1290
1
7 1
4
0 12 5 13
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q13 #q7 o10 #g2 #t1291
1
7 2
4
0 12 5 13
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q13 #q7 o10 #g3 #t1292
1
7 3
4
0 12 5 13
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q13 #q8 o10 #g0 #t1293
1
7 0
4
0 12 5 14
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q13 #q8 o10 #g1 #t1294
1
7 1
4
0 12 5 14
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q13 #q8 o10 #g2 #t1295
1
7 2
4
0 12 5 14
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q13 #q8 o10 #g3 #t1296
1
7 3
4
0 12 5 14
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q13 #q9 o10 #g0 #t1297
1
7 0
4
0 12 5 15
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q13 #q9 o10 #g1 #t1298
1
7 1
4
0 12 5 15
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q13 #q9 o10 #g2 #t1299
1
7 2
4
0 12 5 15
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q13 #q9 o10 #g3 #t1300
1
7 3
4
0 12 5 15
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q13 q616 o10 #g0 #t1257
1
7 0
4
0 12 5 16
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q13 q616 o10 #g1 #t1258
1
7 1
4
0 12 5 16
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q13 q616 o10 #g2 #t1259
1
7 2
4
0 12 5 16
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q13 q616 o10 #g3 #t1260
1
7 3
4
0 12 5 16
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q14 #q0 o10 #g0 #t1329
1
7 0
4
0 12 6 0
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q14 #q0 o10 #g1 #t1330
1
7 1
4
0 12 6 0
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q14 #q0 o10 #g2 #t1331
1
7 2
4
0 12 6 0
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q14 #q0 o10 #g3 #t1332
1
7 3
4
0 12 6 0
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q14 #q1 o10 #g0 #t1333
1
7 0
4
0 12 6 1
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q14 #q1 o10 #g1 #t1334
1
7 1
4
0 12 6 1
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q14 #q1 o10 #g2 #t1335
1
7 2
4
0 12 6 1
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q14 #q1 o10 #g3 #t1336
1
7 3
4
0 12 6 1
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q14 #q10 o10 #g0 #t1369
1
7 0
4
0 12 6 2
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q14 #q10 o10 #g1 #t1370
1
7 1
4
0 12 6 2
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q14 #q10 o10 #g2 #t1371
1
7 2
4
0 12 6 2
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q14 #q10 o10 #g3 #t1372
1
7 3
4
0 12 6 2
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q14 #q11 o10 #g0 #t1373
1
7 0
4
0 12 6 3
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q14 #q11 o10 #g1 #t1374
1
7 1
4
0 12 6 3
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q14 #q11 o10 #g2 #t1375
1
7 2
4
0 12 6 3
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q14 #q11 o10 #g3 #t1376
1
7 3
4
0 12 6 3
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q14 #q12 o10 #g0 #t1377
1
7 0
4
0 12 6 4
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q14 #q12 o10 #g1 #t1378
1
7 1
4
0 12 6 4
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q14 #q12 o10 #g2 #t1379
1
7 2
4
0 12 6 4
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q14 #q12 o10 #g3 #t1380
1
7 3
4
0 12 6 4
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q14 #q13 o10 #g0 #t1381
1
7 0
4
0 12 6 5
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q14 #q13 o10 #g1 #t1382
1
7 1
4
0 12 6 5
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q14 #q13 o10 #g2 #t1383
1
7 2
4
0 12 6 5
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q14 #q13 o10 #g3 #t1384
1
7 3
4
0 12 6 5
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q14 #q14 o10 #g0 #t1385
2
12 6
7 0
3
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q14 #q14 o10 #g1 #t1386
2
12 6
7 1
3
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q14 #q14 o10 #g2 #t1387
2
12 6
7 2
3
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q14 #q14 o10 #g3 #t1388
2
12 6
7 3
3
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q14 #q15 o10 #g0 #t1389
1
7 0
4
0 12 6 7
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q14 #q15 o10 #g1 #t1390
1
7 1
4
0 12 6 7
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q14 #q15 o10 #g2 #t1391
1
7 2
4
0 12 6 7
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q14 #q15 o10 #g3 #t1392
1
7 3
4
0 12 6 7
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q14 #q2 o10 #g0 #t1337
1
7 0
4
0 12 6 8
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q14 #q2 o10 #g1 #t1338
1
7 1
4
0 12 6 8
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q14 #q2 o10 #g2 #t1339
1
7 2
4
0 12 6 8
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q14 #q2 o10 #g3 #t1340
1
7 3
4
0 12 6 8
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q14 #q3 o10 #g0 #t1341
1
7 0
4
0 12 6 9
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q14 #q3 o10 #g1 #t1342
1
7 1
4
0 12 6 9
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q14 #q3 o10 #g2 #t1343
1
7 2
4
0 12 6 9
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q14 #q3 o10 #g3 #t1344
1
7 3
4
0 12 6 9
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q14 #q4 o10 #g0 #t1345
1
7 0
4
0 12 6 10
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q14 #q4 o10 #g1 #t1346
1
7 1
4
0 12 6 10
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q14 #q4 o10 #g2 #t1347
1
7 2
4
0 12 6 10
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q14 #q4 o10 #g3 #t1348
1
7 3
4
0 12 6 10
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q14 #q5 o10 #g0 #t1349
1
7 0
4
0 12 6 11
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q14 #q5 o10 #g1 #t1350
1
7 1
4
0 12 6 11
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q14 #q5 o10 #g2 #t1351
1
7 2
4
0 12 6 11
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q14 #q5 o10 #g3 #t1352
1
7 3
4
0 12 6 11
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q14 #q6 o10 #g0 #t1353
1
7 0
4
0 12 6 12
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q14 #q6 o10 #g1 #t1354
1
7 1
4
0 12 6 12
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q14 #q6 o10 #g2 #t1355
1
7 2
4
0 12 6 12
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q14 #q6 o10 #g3 #t1356
1
7 3
4
0 12 6 12
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q14 #q7 o10 #g0 #t1357
1
7 0
4
0 12 6 13
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q14 #q7 o10 #g1 #t1358
1
7 1
4
0 12 6 13
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q14 #q7 o10 #g2 #t1359
1
7 2
4
0 12 6 13
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q14 #q7 o10 #g3 #t1360
1
7 3
4
0 12 6 13
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q14 #q8 o10 #g0 #t1361
1
7 0
4
0 12 6 14
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q14 #q8 o10 #g1 #t1362
1
7 1
4
0 12 6 14
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q14 #q8 o10 #g2 #t1363
1
7 2
4
0 12 6 14
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q14 #q8 o10 #g3 #t1364
1
7 3
4
0 12 6 14
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q14 #q9 o10 #g0 #t1365
1
7 0
4
0 12 6 15
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q14 #q9 o10 #g1 #t1366
1
7 1
4
0 12 6 15
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q14 #q9 o10 #g2 #t1367
1
7 2
4
0 12 6 15
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q14 #q9 o10 #g3 #t1368
1
7 3
4
0 12 6 15
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q14 q616 o10 #g0 #t1325
1
7 0
4
0 12 6 16
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q14 q616 o10 #g1 #t1326
1
7 1
4
0 12 6 16
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q14 q616 o10 #g2 #t1327
1
7 2
4
0 12 6 16
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q14 q616 o10 #g3 #t1328
1
7 3
4
0 12 6 16
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q15 #q0 o10 #g0 #t1397
1
7 0
4
0 12 7 0
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q15 #q0 o10 #g1 #t1398
1
7 1
4
0 12 7 0
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q15 #q0 o10 #g2 #t1399
1
7 2
4
0 12 7 0
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q15 #q0 o10 #g3 #t1400
1
7 3
4
0 12 7 0
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q15 #q1 o10 #g0 #t1401
1
7 0
4
0 12 7 1
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q15 #q1 o10 #g1 #t1402
1
7 1
4
0 12 7 1
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q15 #q1 o10 #g2 #t1403
1
7 2
4
0 12 7 1
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q15 #q1 o10 #g3 #t1404
1
7 3
4
0 12 7 1
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q15 #q10 o10 #g0 #t1437
1
7 0
4
0 12 7 2
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q15 #q10 o10 #g1 #t1438
1
7 1
4
0 12 7 2
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q15 #q10 o10 #g2 #t1439
1
7 2
4
0 12 7 2
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q15 #q10 o10 #g3 #t1440
1
7 3
4
0 12 7 2
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q15 #q11 o10 #g0 #t1441
1
7 0
4
0 12 7 3
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q15 #q11 o10 #g1 #t1442
1
7 1
4
0 12 7 3
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q15 #q11 o10 #g2 #t1443
1
7 2
4
0 12 7 3
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q15 #q11 o10 #g3 #t1444
1
7 3
4
0 12 7 3
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q15 #q12 o10 #g0 #t1445
1
7 0
4
0 12 7 4
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q15 #q12 o10 #g1 #t1446
1
7 1
4
0 12 7 4
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q15 #q12 o10 #g2 #t1447
1
7 2
4
0 12 7 4
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q15 #q12 o10 #g3 #t1448
1
7 3
4
0 12 7 4
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q15 #q13 o10 #g0 #t1449
1
7 0
4
0 12 7 5
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q15 #q13 o10 #g1 #t1450
1
7 1
4
0 12 7 5
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q15 #q13 o10 #g2 #t1451
1
7 2
4
0 12 7 5
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q15 #q13 o10 #g3 #t1452
1
7 3
4
0 12 7 5
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q15 #q14 o10 #g0 #t1453
1
7 0
4
0 12 7 6
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q15 #q14 o10 #g1 #t1454
1
7 1
4
0 12 7 6
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q15 #q14 o10 #g2 #t1455
1
7 2
4
0 12 7 6
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q15 #q14 o10 #g3 #t1456
1
7 3
4
0 12 7 6
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q15 #q15 o10 #g0 #t1457
2
12 7
7 0
3
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q15 #q15 o10 #g1 #t1458
2
12 7
7 1
3
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q15 #q15 o10 #g2 #t1459
2
12 7
7 2
3
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q15 #q15 o10 #g3 #t1460
2
12 7
7 3
3
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q15 #q2 o10 #g0 #t1405
1
7 0
4
0 12 7 8
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q15 #q2 o10 #g1 #t1406
1
7 1
4
0 12 7 8
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q15 #q2 o10 #g2 #t1407
1
7 2
4
0 12 7 8
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q15 #q2 o10 #g3 #t1408
1
7 3
4
0 12 7 8
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q15 #q3 o10 #g0 #t1409
1
7 0
4
0 12 7 9
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q15 #q3 o10 #g1 #t1410
1
7 1
4
0 12 7 9
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q15 #q3 o10 #g2 #t1411
1
7 2
4
0 12 7 9
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q15 #q3 o10 #g3 #t1412
1
7 3
4
0 12 7 9
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q15 #q4 o10 #g0 #t1413
1
7 0
4
0 12 7 10
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q15 #q4 o10 #g1 #t1414
1
7 1
4
0 12 7 10
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q15 #q4 o10 #g2 #t1415
1
7 2
4
0 12 7 10
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q15 #q4 o10 #g3 #t1416
1
7 3
4
0 12 7 10
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q15 #q5 o10 #g0 #t1417
1
7 0
4
0 12 7 11
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q15 #q5 o10 #g1 #t1418
1
7 1
4
0 12 7 11
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q15 #q5 o10 #g2 #t1419
1
7 2
4
0 12 7 11
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q15 #q5 o10 #g3 #t1420
1
7 3
4
0 12 7 11
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q15 #q6 o10 #g0 #t1421
1
7 0
4
0 12 7 12
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q15 #q6 o10 #g1 #t1422
1
7 1
4
0 12 7 12
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q15 #q6 o10 #g2 #t1423
1
7 2
4
0 12 7 12
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q15 #q6 o10 #g3 #t1424
1
7 3
4
0 12 7 12
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q15 #q7 o10 #g0 #t1425
1
7 0
4
0 12 7 13
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q15 #q7 o10 #g1 #t1426
1
7 1
4
0 12 7 13
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q15 #q7 o10 #g2 #t1427
1
7 2
4
0 12 7 13
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q15 #q7 o10 #g3 #t1428
1
7 3
4
0 12 7 13
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q15 #q8 o10 #g0 #t1429
1
7 0
4
0 12 7 14
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q15 #q8 o10 #g1 #t1430
1
7 1
4
0 12 7 14
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q15 #q8 o10 #g2 #t1431
1
7 2
4
0 12 7 14
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q15 #q8 o10 #g3 #t1432
1
7 3
4
0 12 7 14
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q15 #q9 o10 #g0 #t1433
1
7 0
4
0 12 7 15
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q15 #q9 o10 #g1 #t1434
1
7 1
4
0 12 7 15
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q15 #q9 o10 #g2 #t1435
1
7 2
4
0 12 7 15
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q15 #q9 o10 #g3 #t1436
1
7 3
4
0 12 7 15
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q15 q616 o10 #g0 #t1393
1
7 0
4
0 12 7 16
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q15 q616 o10 #g1 #t1394
1
7 1
4
0 12 7 16
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q15 q616 o10 #g2 #t1395
1
7 2
4
0 12 7 16
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q15 q616 o10 #g3 #t1396
1
7 3
4
0 12 7 16
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q2 #q0 o10 #g0 #t105
1
7 0
4
0 12 8 0
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q2 #q0 o10 #g1 #t106
1
7 1
4
0 12 8 0
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q2 #q0 o10 #g2 #t107
1
7 2
4
0 12 8 0
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q2 #q0 o10 #g3 #t108
1
7 3
4
0 12 8 0
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q2 #q1 o10 #g0 #t109
1
7 0
4
0 12 8 1
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q2 #q1 o10 #g1 #t110
1
7 1
4
0 12 8 1
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q2 #q1 o10 #g2 #t111
1
7 2
4
0 12 8 1
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q2 #q1 o10 #g3 #t112
1
7 3
4
0 12 8 1
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q2 #q10 o10 #g0 #t573
1
7 0
4
0 12 8 2
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q2 #q10 o10 #g1 #t574
1
7 1
4
0 12 8 2
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q2 #q10 o10 #g2 #t575
1
7 2
4
0 12 8 2
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q2 #q10 o10 #g3 #t576
1
7 3
4
0 12 8 2
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q2 #q11 o10 #g0 #t577
1
7 0
4
0 12 8 3
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q2 #q11 o10 #g1 #t578
1
7 1
4
0 12 8 3
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q2 #q11 o10 #g2 #t579
1
7 2
4
0 12 8 3
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q2 #q11 o10 #g3 #t580
1
7 3
4
0 12 8 3
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q2 #q12 o10 #g0 #t581
1
7 0
4
0 12 8 4
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q2 #q12 o10 #g1 #t582
1
7 1
4
0 12 8 4
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q2 #q12 o10 #g2 #t583
1
7 2
4
0 12 8 4
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q2 #q12 o10 #g3 #t584
1
7 3
4
0 12 8 4
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q2 #q13 o10 #g0 #t585
1
7 0
4
0 12 8 5
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q2 #q13 o10 #g1 #t586
1
7 1
4
0 12 8 5
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q2 #q13 o10 #g2 #t587
1
7 2
4
0 12 8 5
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q2 #q13 o10 #g3 #t588
1
7 3
4
0 12 8 5
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q2 #q14 o10 #g0 #t589
1
7 0
4
0 12 8 6
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q2 #q14 o10 #g1 #t590
1
7 1
4
0 12 8 6
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q2 #q14 o10 #g2 #t591
1
7 2
4
0 12 8 6
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q2 #q14 o10 #g3 #t592
1
7 3
4
0 12 8 6
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q2 #q15 o10 #g0 #t593
1
7 0
4
0 12 8 7
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q2 #q15 o10 #g1 #t594
1
7 1
4
0 12 8 7
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q2 #q15 o10 #g2 #t595
1
7 2
4
0 12 8 7
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q2 #q15 o10 #g3 #t596
1
7 3
4
0 12 8 7
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q2 #q2 o10 #g0 #t113
2
12 8
7 0
3
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q2 #q2 o10 #g1 #t114
2
12 8
7 1
3
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q2 #q2 o10 #g2 #t115
2
12 8
7 2
3
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q2 #q2 o10 #g3 #t116
2
12 8
7 3
3
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q2 #q3 o10 #g0 #t117
1
7 0
4
0 12 8 9
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q2 #q3 o10 #g1 #t118
1
7 1
4
0 12 8 9
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q2 #q3 o10 #g2 #t119
1
7 2
4
0 12 8 9
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q2 #q3 o10 #g3 #t120
1
7 3
4
0 12 8 9
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q2 #q4 o10 #g0 #t549
1
7 0
4
0 12 8 10
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q2 #q4 o10 #g1 #t550
1
7 1
4
0 12 8 10
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q2 #q4 o10 #g2 #t551
1
7 2
4
0 12 8 10
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q2 #q4 o10 #g3 #t552
1
7 3
4
0 12 8 10
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q2 #q5 o10 #g0 #t553
1
7 0
4
0 12 8 11
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q2 #q5 o10 #g1 #t554
1
7 1
4
0 12 8 11
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q2 #q5 o10 #g2 #t555
1
7 2
4
0 12 8 11
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q2 #q5 o10 #g3 #t556
1
7 3
4
0 12 8 11
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q2 #q6 o10 #g0 #t557
1
7 0
4
0 12 8 12
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q2 #q6 o10 #g1 #t558
1
7 1
4
0 12 8 12
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q2 #q6 o10 #g2 #t559
1
7 2
4
0 12 8 12
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q2 #q6 o10 #g3 #t560
1
7 3
4
0 12 8 12
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q2 #q7 o10 #g0 #t561
1
7 0
4
0 12 8 13
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q2 #q7 o10 #g1 #t562
1
7 1
4
0 12 8 13
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q2 #q7 o10 #g2 #t563
1
7 2
4
0 12 8 13
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q2 #q7 o10 #g3 #t564
1
7 3
4
0 12 8 13
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q2 #q8 o10 #g0 #t565
1
7 0
4
0 12 8 14
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q2 #q8 o10 #g1 #t566
1
7 1
4
0 12 8 14
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q2 #q8 o10 #g2 #t567
1
7 2
4
0 12 8 14
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q2 #q8 o10 #g3 #t568
1
7 3
4
0 12 8 14
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q2 #q9 o10 #g0 #t569
1
7 0
4
0 12 8 15
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q2 #q9 o10 #g1 #t570
1
7 1
4
0 12 8 15
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q2 #q9 o10 #g2 #t571
1
7 2
4
0 12 8 15
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q2 #q9 o10 #g3 #t572
1
7 3
4
0 12 8 15
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q2 q616 o10 #g0 #t101
1
7 0
4
0 12 8 16
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q2 q616 o10 #g1 #t102
1
7 1
4
0 12 8 16
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q2 q616 o10 #g2 #t103
1
7 2
4
0 12 8 16
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q2 q616 o10 #g3 #t104
1
7 3
4
0 12 8 16
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q3 #q0 o10 #g0 #t125
1
7 0
4
0 12 9 0
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q3 #q0 o10 #g1 #t126
1
7 1
4
0 12 9 0
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q3 #q0 o10 #g2 #t127
1
7 2
4
0 12 9 0
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q3 #q0 o10 #g3 #t128
1
7 3
4
0 12 9 0
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q3 #q1 o10 #g0 #t129
1
7 0
4
0 12 9 1
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q3 #q1 o10 #g1 #t130
1
7 1
4
0 12 9 1
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q3 #q1 o10 #g2 #t131
1
7 2
4
0 12 9 1
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q3 #q1 o10 #g3 #t132
1
7 3
4
0 12 9 1
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q3 #q10 o10 #g0 #t621
1
7 0
4
0 12 9 2
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q3 #q10 o10 #g1 #t622
1
7 1
4
0 12 9 2
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q3 #q10 o10 #g2 #t623
1
7 2
4
0 12 9 2
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q3 #q10 o10 #g3 #t624
1
7 3
4
0 12 9 2
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q3 #q11 o10 #g0 #t625
1
7 0
4
0 12 9 3
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q3 #q11 o10 #g1 #t626
1
7 1
4
0 12 9 3
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q3 #q11 o10 #g2 #t627
1
7 2
4
0 12 9 3
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q3 #q11 o10 #g3 #t628
1
7 3
4
0 12 9 3
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q3 #q12 o10 #g0 #t629
1
7 0
4
0 12 9 4
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q3 #q12 o10 #g1 #t630
1
7 1
4
0 12 9 4
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q3 #q12 o10 #g2 #t631
1
7 2
4
0 12 9 4
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q3 #q12 o10 #g3 #t632
1
7 3
4
0 12 9 4
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q3 #q13 o10 #g0 #t633
1
7 0
4
0 12 9 5
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q3 #q13 o10 #g1 #t634
1
7 1
4
0 12 9 5
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q3 #q13 o10 #g2 #t635
1
7 2
4
0 12 9 5
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q3 #q13 o10 #g3 #t636
1
7 3
4
0 12 9 5
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q3 #q14 o10 #g0 #t637
1
7 0
4
0 12 9 6
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q3 #q14 o10 #g1 #t638
1
7 1
4
0 12 9 6
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q3 #q14 o10 #g2 #t639
1
7 2
4
0 12 9 6
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q3 #q14 o10 #g3 #t640
1
7 3
4
0 12 9 6
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q3 #q15 o10 #g0 #t641
1
7 0
4
0 12 9 7
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q3 #q15 o10 #g1 #t642
1
7 1
4
0 12 9 7
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q3 #q15 o10 #g2 #t643
1
7 2
4
0 12 9 7
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q3 #q15 o10 #g3 #t644
1
7 3
4
0 12 9 7
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q3 #q2 o10 #g0 #t133
1
7 0
4
0 12 9 8
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q3 #q2 o10 #g1 #t134
1
7 1
4
0 12 9 8
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q3 #q2 o10 #g2 #t135
1
7 2
4
0 12 9 8
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q3 #q2 o10 #g3 #t136
1
7 3
4
0 12 9 8
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q3 #q3 o10 #g0 #t137
2
12 9
7 0
3
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q3 #q3 o10 #g1 #t138
2
12 9
7 1
3
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q3 #q3 o10 #g2 #t139
2
12 9
7 2
3
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q3 #q3 o10 #g3 #t140
2
12 9
7 3
3
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q3 #q4 o10 #g0 #t597
1
7 0
4
0 12 9 10
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q3 #q4 o10 #g1 #t598
1
7 1
4
0 12 9 10
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q3 #q4 o10 #g2 #t599
1
7 2
4
0 12 9 10
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q3 #q4 o10 #g3 #t600
1
7 3
4
0 12 9 10
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q3 #q5 o10 #g0 #t601
1
7 0
4
0 12 9 11
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q3 #q5 o10 #g1 #t602
1
7 1
4
0 12 9 11
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q3 #q5 o10 #g2 #t603
1
7 2
4
0 12 9 11
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q3 #q5 o10 #g3 #t604
1
7 3
4
0 12 9 11
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q3 #q6 o10 #g0 #t605
1
7 0
4
0 12 9 12
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q3 #q6 o10 #g1 #t606
1
7 1
4
0 12 9 12
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q3 #q6 o10 #g2 #t607
1
7 2
4
0 12 9 12
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q3 #q6 o10 #g3 #t608
1
7 3
4
0 12 9 12
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q3 #q7 o10 #g0 #t609
1
7 0
4
0 12 9 13
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q3 #q7 o10 #g1 #t610
1
7 1
4
0 12 9 13
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q3 #q7 o10 #g2 #t611
1
7 2
4
0 12 9 13
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q3 #q7 o10 #g3 #t612
1
7 3
4
0 12 9 13
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q3 #q8 o10 #g0 #t613
1
7 0
4
0 12 9 14
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q3 #q8 o10 #g1 #t614
1
7 1
4
0 12 9 14
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q3 #q8 o10 #g2 #t615
1
7 2
4
0 12 9 14
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q3 #q8 o10 #g3 #t616
1
7 3
4
0 12 9 14
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q3 #q9 o10 #g0 #t617
1
7 0
4
0 12 9 15
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q3 #q9 o10 #g1 #t618
1
7 1
4
0 12 9 15
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q3 #q9 o10 #g2 #t619
1
7 2
4
0 12 9 15
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q3 #q9 o10 #g3 #t620
1
7 3
4
0 12 9 15
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q3 q616 o10 #g0 #t121
1
7 0
4
0 12 9 16
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q3 q616 o10 #g1 #t122
1
7 1
4
0 12 9 16
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q3 q616 o10 #g2 #t123
1
7 2
4
0 12 9 16
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q3 q616 o10 #g3 #t124
1
7 3
4
0 12 9 16
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q4 #q0 o10 #g0 #t649
1
7 0
4
0 12 10 0
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q4 #q0 o10 #g1 #t650
1
7 1
4
0 12 10 0
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q4 #q0 o10 #g2 #t651
1
7 2
4
0 12 10 0
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q4 #q0 o10 #g3 #t652
1
7 3
4
0 12 10 0
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q4 #q1 o10 #g0 #t653
1
7 0
4
0 12 10 1
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q4 #q1 o10 #g1 #t654
1
7 1
4
0 12 10 1
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q4 #q1 o10 #g2 #t655
1
7 2
4
0 12 10 1
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q4 #q1 o10 #g3 #t656
1
7 3
4
0 12 10 1
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q4 #q10 o10 #g0 #t689
1
7 0
4
0 12 10 2
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q4 #q10 o10 #g1 #t690
1
7 1
4
0 12 10 2
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q4 #q10 o10 #g2 #t691
1
7 2
4
0 12 10 2
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q4 #q10 o10 #g3 #t692
1
7 3
4
0 12 10 2
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q4 #q11 o10 #g0 #t693
1
7 0
4
0 12 10 3
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q4 #q11 o10 #g1 #t694
1
7 1
4
0 12 10 3
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q4 #q11 o10 #g2 #t695
1
7 2
4
0 12 10 3
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q4 #q11 o10 #g3 #t696
1
7 3
4
0 12 10 3
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q4 #q12 o10 #g0 #t697
1
7 0
4
0 12 10 4
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q4 #q12 o10 #g1 #t698
1
7 1
4
0 12 10 4
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q4 #q12 o10 #g2 #t699
1
7 2
4
0 12 10 4
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q4 #q12 o10 #g3 #t700
1
7 3
4
0 12 10 4
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q4 #q13 o10 #g0 #t701
1
7 0
4
0 12 10 5
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q4 #q13 o10 #g1 #t702
1
7 1
4
0 12 10 5
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q4 #q13 o10 #g2 #t703
1
7 2
4
0 12 10 5
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q4 #q13 o10 #g3 #t704
1
7 3
4
0 12 10 5
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q4 #q14 o10 #g0 #t705
1
7 0
4
0 12 10 6
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q4 #q14 o10 #g1 #t706
1
7 1
4
0 12 10 6
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q4 #q14 o10 #g2 #t707
1
7 2
4
0 12 10 6
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q4 #q14 o10 #g3 #t708
1
7 3
4
0 12 10 6
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q4 #q15 o10 #g0 #t709
1
7 0
4
0 12 10 7
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q4 #q15 o10 #g1 #t710
1
7 1
4
0 12 10 7
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q4 #q15 o10 #g2 #t711
1
7 2
4
0 12 10 7
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q4 #q15 o10 #g3 #t712
1
7 3
4
0 12 10 7
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q4 #q2 o10 #g0 #t657
1
7 0
4
0 12 10 8
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q4 #q2 o10 #g1 #t658
1
7 1
4
0 12 10 8
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q4 #q2 o10 #g2 #t659
1
7 2
4
0 12 10 8
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q4 #q2 o10 #g3 #t660
1
7 3
4
0 12 10 8
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q4 #q3 o10 #g0 #t661
1
7 0
4
0 12 10 9
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q4 #q3 o10 #g1 #t662
1
7 1
4
0 12 10 9
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q4 #q3 o10 #g2 #t663
1
7 2
4
0 12 10 9
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q4 #q3 o10 #g3 #t664
1
7 3
4
0 12 10 9
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q4 #q4 o10 #g0 #t665
2
12 10
7 0
3
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q4 #q4 o10 #g1 #t666
2
12 10
7 1
3
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q4 #q4 o10 #g2 #t667
2
12 10
7 2
3
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q4 #q4 o10 #g3 #t668
2
12 10
7 3
3
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q4 #q5 o10 #g0 #t669
1
7 0
4
0 12 10 11
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q4 #q5 o10 #g1 #t670
1
7 1
4
0 12 10 11
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q4 #q5 o10 #g2 #t671
1
7 2
4
0 12 10 11
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q4 #q5 o10 #g3 #t672
1
7 3
4
0 12 10 11
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q4 #q6 o10 #g0 #t673
1
7 0
4
0 12 10 12
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q4 #q6 o10 #g1 #t674
1
7 1
4
0 12 10 12
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q4 #q6 o10 #g2 #t675
1
7 2
4
0 12 10 12
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q4 #q6 o10 #g3 #t676
1
7 3
4
0 12 10 12
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q4 #q7 o10 #g0 #t677
1
7 0
4
0 12 10 13
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q4 #q7 o10 #g1 #t678
1
7 1
4
0 12 10 13
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q4 #q7 o10 #g2 #t679
1
7 2
4
0 12 10 13
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q4 #q7 o10 #g3 #t680
1
7 3
4
0 12 10 13
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q4 #q8 o10 #g0 #t681
1
7 0
4
0 12 10 14
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q4 #q8 o10 #g1 #t682
1
7 1
4
0 12 10 14
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q4 #q8 o10 #g2 #t683
1
7 2
4
0 12 10 14
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q4 #q8 o10 #g3 #t684
1
7 3
4
0 12 10 14
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q4 #q9 o10 #g0 #t685
1
7 0
4
0 12 10 15
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q4 #q9 o10 #g1 #t686
1
7 1
4
0 12 10 15
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q4 #q9 o10 #g2 #t687
1
7 2
4
0 12 10 15
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q4 #q9 o10 #g3 #t688
1
7 3
4
0 12 10 15
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q4 q616 o10 #g0 #t645
1
7 0
4
0 12 10 16
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q4 q616 o10 #g1 #t646
1
7 1
4
0 12 10 16
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q4 q616 o10 #g2 #t647
1
7 2
4
0 12 10 16
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q4 q616 o10 #g3 #t648
1
7 3
4
0 12 10 16
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q5 #q0 o10 #g0 #t717
1
7 0
4
0 12 11 0
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q5 #q0 o10 #g1 #t718
1
7 1
4
0 12 11 0
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q5 #q0 o10 #g2 #t719
1
7 2
4
0 12 11 0
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q5 #q0 o10 #g3 #t720
1
7 3
4
0 12 11 0
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q5 #q1 o10 #g0 #t721
1
7 0
4
0 12 11 1
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q5 #q1 o10 #g1 #t722
1
7 1
4
0 12 11 1
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q5 #q1 o10 #g2 #t723
1
7 2
4
0 12 11 1
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q5 #q1 o10 #g3 #t724
1
7 3
4
0 12 11 1
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q5 #q10 o10 #g0 #t757
1
7 0
4
0 12 11 2
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q5 #q10 o10 #g1 #t758
1
7 1
4
0 12 11 2
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q5 #q10 o10 #g2 #t759
1
7 2
4
0 12 11 2
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q5 #q10 o10 #g3 #t760
1
7 3
4
0 12 11 2
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q5 #q11 o10 #g0 #t761
1
7 0
4
0 12 11 3
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q5 #q11 o10 #g1 #t762
1
7 1
4
0 12 11 3
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q5 #q11 o10 #g2 #t763
1
7 2
4
0 12 11 3
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q5 #q11 o10 #g3 #t764
1
7 3
4
0 12 11 3
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q5 #q12 o10 #g0 #t765
1
7 0
4
0 12 11 4
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q5 #q12 o10 #g1 #t766
1
7 1
4
0 12 11 4
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q5 #q12 o10 #g2 #t767
1
7 2
4
0 12 11 4
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q5 #q12 o10 #g3 #t768
1
7 3
4
0 12 11 4
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q5 #q13 o10 #g0 #t769
1
7 0
4
0 12 11 5
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q5 #q13 o10 #g1 #t770
1
7 1
4
0 12 11 5
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q5 #q13 o10 #g2 #t771
1
7 2
4
0 12 11 5
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q5 #q13 o10 #g3 #t772
1
7 3
4
0 12 11 5
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q5 #q14 o10 #g0 #t773
1
7 0
4
0 12 11 6
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q5 #q14 o10 #g1 #t774
1
7 1
4
0 12 11 6
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q5 #q14 o10 #g2 #t775
1
7 2
4
0 12 11 6
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q5 #q14 o10 #g3 #t776
1
7 3
4
0 12 11 6
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q5 #q15 o10 #g0 #t777
1
7 0
4
0 12 11 7
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q5 #q15 o10 #g1 #t778
1
7 1
4
0 12 11 7
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q5 #q15 o10 #g2 #t779
1
7 2
4
0 12 11 7
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q5 #q15 o10 #g3 #t780
1
7 3
4
0 12 11 7
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q5 #q2 o10 #g0 #t725
1
7 0
4
0 12 11 8
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q5 #q2 o10 #g1 #t726
1
7 1
4
0 12 11 8
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q5 #q2 o10 #g2 #t727
1
7 2
4
0 12 11 8
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q5 #q2 o10 #g3 #t728
1
7 3
4
0 12 11 8
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q5 #q3 o10 #g0 #t729
1
7 0
4
0 12 11 9
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q5 #q3 o10 #g1 #t730
1
7 1
4
0 12 11 9
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q5 #q3 o10 #g2 #t731
1
7 2
4
0 12 11 9
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q5 #q3 o10 #g3 #t732
1
7 3
4
0 12 11 9
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q5 #q4 o10 #g0 #t733
1
7 0
4
0 12 11 10
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q5 #q4 o10 #g1 #t734
1
7 1
4
0 12 11 10
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q5 #q4 o10 #g2 #t735
1
7 2
4
0 12 11 10
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q5 #q4 o10 #g3 #t736
1
7 3
4
0 12 11 10
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q5 #q5 o10 #g0 #t737
2
12 11
7 0
3
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q5 #q5 o10 #g1 #t738
2
12 11
7 1
3
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q5 #q5 o10 #g2 #t739
2
12 11
7 2
3
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q5 #q5 o10 #g3 #t740
2
12 11
7 3
3
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q5 #q6 o10 #g0 #t741
1
7 0
4
0 12 11 12
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q5 #q6 o10 #g1 #t742
1
7 1
4
0 12 11 12
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q5 #q6 o10 #g2 #t743
1
7 2
4
0 12 11 12
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q5 #q6 o10 #g3 #t744
1
7 3
4
0 12 11 12
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q5 #q7 o10 #g0 #t745
1
7 0
4
0 12 11 13
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q5 #q7 o10 #g1 #t746
1
7 1
4
0 12 11 13
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q5 #q7 o10 #g2 #t747
1
7 2
4
0 12 11 13
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q5 #q7 o10 #g3 #t748
1
7 3
4
0 12 11 13
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q5 #q8 o10 #g0 #t749
1
7 0
4
0 12 11 14
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q5 #q8 o10 #g1 #t750
1
7 1
4
0 12 11 14
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q5 #q8 o10 #g2 #t751
1
7 2
4
0 12 11 14
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q5 #q8 o10 #g3 #t752
1
7 3
4
0 12 11 14
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q5 #q9 o10 #g0 #t753
1
7 0
4
0 12 11 15
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q5 #q9 o10 #g1 #t754
1
7 1
4
0 12 11 15
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q5 #q9 o10 #g2 #t755
1
7 2
4
0 12 11 15
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q5 #q9 o10 #g3 #t756
1
7 3
4
0 12 11 15
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q5 q616 o10 #g0 #t713
1
7 0
4
0 12 11 16
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q5 q616 o10 #g1 #t714
1
7 1
4
0 12 11 16
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q5 q616 o10 #g2 #t715
1
7 2
4
0 12 11 16
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q5 q616 o10 #g3 #t716
1
7 3
4
0 12 11 16
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q6 #q0 o10 #g0 #t785
1
7 0
4
0 12 12 0
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q6 #q0 o10 #g1 #t786
1
7 1
4
0 12 12 0
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q6 #q0 o10 #g2 #t787
1
7 2
4
0 12 12 0
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q6 #q0 o10 #g3 #t788
1
7 3
4
0 12 12 0
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q6 #q1 o10 #g0 #t789
1
7 0
4
0 12 12 1
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q6 #q1 o10 #g1 #t790
1
7 1
4
0 12 12 1
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q6 #q1 o10 #g2 #t791
1
7 2
4
0 12 12 1
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q6 #q1 o10 #g3 #t792
1
7 3
4
0 12 12 1
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q6 #q10 o10 #g0 #t825
1
7 0
4
0 12 12 2
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q6 #q10 o10 #g1 #t826
1
7 1
4
0 12 12 2
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q6 #q10 o10 #g2 #t827
1
7 2
4
0 12 12 2
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q6 #q10 o10 #g3 #t828
1
7 3
4
0 12 12 2
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q6 #q11 o10 #g0 #t829
1
7 0
4
0 12 12 3
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q6 #q11 o10 #g1 #t830
1
7 1
4
0 12 12 3
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q6 #q11 o10 #g2 #t831
1
7 2
4
0 12 12 3
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q6 #q11 o10 #g3 #t832
1
7 3
4
0 12 12 3
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q6 #q12 o10 #g0 #t833
1
7 0
4
0 12 12 4
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q6 #q12 o10 #g1 #t834
1
7 1
4
0 12 12 4
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q6 #q12 o10 #g2 #t835
1
7 2
4
0 12 12 4
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q6 #q12 o10 #g3 #t836
1
7 3
4
0 12 12 4
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q6 #q13 o10 #g0 #t837
1
7 0
4
0 12 12 5
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q6 #q13 o10 #g1 #t838
1
7 1
4
0 12 12 5
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q6 #q13 o10 #g2 #t839
1
7 2
4
0 12 12 5
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q6 #q13 o10 #g3 #t840
1
7 3
4
0 12 12 5
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q6 #q14 o10 #g0 #t841
1
7 0
4
0 12 12 6
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q6 #q14 o10 #g1 #t842
1
7 1
4
0 12 12 6
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q6 #q14 o10 #g2 #t843
1
7 2
4
0 12 12 6
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q6 #q14 o10 #g3 #t844
1
7 3
4
0 12 12 6
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q6 #q15 o10 #g0 #t845
1
7 0
4
0 12 12 7
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q6 #q15 o10 #g1 #t846
1
7 1
4
0 12 12 7
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q6 #q15 o10 #g2 #t847
1
7 2
4
0 12 12 7
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q6 #q15 o10 #g3 #t848
1
7 3
4
0 12 12 7
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q6 #q2 o10 #g0 #t793
1
7 0
4
0 12 12 8
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q6 #q2 o10 #g1 #t794
1
7 1
4
0 12 12 8
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q6 #q2 o10 #g2 #t795
1
7 2
4
0 12 12 8
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q6 #q2 o10 #g3 #t796
1
7 3
4
0 12 12 8
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q6 #q3 o10 #g0 #t797
1
7 0
4
0 12 12 9
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q6 #q3 o10 #g1 #t798
1
7 1
4
0 12 12 9
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q6 #q3 o10 #g2 #t799
1
7 2
4
0 12 12 9
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q6 #q3 o10 #g3 #t800
1
7 3
4
0 12 12 9
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q6 #q4 o10 #g0 #t801
1
7 0
4
0 12 12 10
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q6 #q4 o10 #g1 #t802
1
7 1
4
0 12 12 10
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q6 #q4 o10 #g2 #t803
1
7 2
4
0 12 12 10
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q6 #q4 o10 #g3 #t804
1
7 3
4
0 12 12 10
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q6 #q5 o10 #g0 #t805
1
7 0
4
0 12 12 11
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q6 #q5 o10 #g1 #t806
1
7 1
4
0 12 12 11
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q6 #q5 o10 #g2 #t807
1
7 2
4
0 12 12 11
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q6 #q5 o10 #g3 #t808
1
7 3
4
0 12 12 11
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q6 #q6 o10 #g0 #t809
2
12 12
7 0
3
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q6 #q6 o10 #g1 #t810
2
12 12
7 1
3
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q6 #q6 o10 #g2 #t811
2
12 12
7 2
3
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q6 #q6 o10 #g3 #t812
2
12 12
7 3
3
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q6 #q7 o10 #g0 #t813
1
7 0
4
0 12 12 13
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q6 #q7 o10 #g1 #t814
1
7 1
4
0 12 12 13
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q6 #q7 o10 #g2 #t815
1
7 2
4
0 12 12 13
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q6 #q7 o10 #g3 #t816
1
7 3
4
0 12 12 13
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q6 #q8 o10 #g0 #t817
1
7 0
4
0 12 12 14
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q6 #q8 o10 #g1 #t818
1
7 1
4
0 12 12 14
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q6 #q8 o10 #g2 #t819
1
7 2
4
0 12 12 14
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q6 #q8 o10 #g3 #t820
1
7 3
4
0 12 12 14
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q6 #q9 o10 #g0 #t821
1
7 0
4
0 12 12 15
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q6 #q9 o10 #g1 #t822
1
7 1
4
0 12 12 15
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q6 #q9 o10 #g2 #t823
1
7 2
4
0 12 12 15
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q6 #q9 o10 #g3 #t824
1
7 3
4
0 12 12 15
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q6 q616 o10 #g0 #t781
1
7 0
4
0 12 12 16
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q6 q616 o10 #g1 #t782
1
7 1
4
0 12 12 16
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q6 q616 o10 #g2 #t783
1
7 2
4
0 12 12 16
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q6 q616 o10 #g3 #t784
1
7 3
4
0 12 12 16
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q7 #q0 o10 #g0 #t853
1
7 0
4
0 12 13 0
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q7 #q0 o10 #g1 #t854
1
7 1
4
0 12 13 0
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q7 #q0 o10 #g2 #t855
1
7 2
4
0 12 13 0
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q7 #q0 o10 #g3 #t856
1
7 3
4
0 12 13 0
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q7 #q1 o10 #g0 #t857
1
7 0
4
0 12 13 1
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q7 #q1 o10 #g1 #t858
1
7 1
4
0 12 13 1
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q7 #q1 o10 #g2 #t859
1
7 2
4
0 12 13 1
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q7 #q1 o10 #g3 #t860
1
7 3
4
0 12 13 1
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q7 #q10 o10 #g0 #t893
1
7 0
4
0 12 13 2
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q7 #q10 o10 #g1 #t894
1
7 1
4
0 12 13 2
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q7 #q10 o10 #g2 #t895
1
7 2
4
0 12 13 2
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q7 #q10 o10 #g3 #t896
1
7 3
4
0 12 13 2
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q7 #q11 o10 #g0 #t897
1
7 0
4
0 12 13 3
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q7 #q11 o10 #g1 #t898
1
7 1
4
0 12 13 3
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q7 #q11 o10 #g2 #t899
1
7 2
4
0 12 13 3
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q7 #q11 o10 #g3 #t900
1
7 3
4
0 12 13 3
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q7 #q12 o10 #g0 #t901
1
7 0
4
0 12 13 4
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q7 #q12 o10 #g1 #t902
1
7 1
4
0 12 13 4
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q7 #q12 o10 #g2 #t903
1
7 2
4
0 12 13 4
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q7 #q12 o10 #g3 #t904
1
7 3
4
0 12 13 4
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q7 #q13 o10 #g0 #t905
1
7 0
4
0 12 13 5
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q7 #q13 o10 #g1 #t906
1
7 1
4
0 12 13 5
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q7 #q13 o10 #g2 #t907
1
7 2
4
0 12 13 5
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q7 #q13 o10 #g3 #t908
1
7 3
4
0 12 13 5
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q7 #q14 o10 #g0 #t909
1
7 0
4
0 12 13 6
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q7 #q14 o10 #g1 #t910
1
7 1
4
0 12 13 6
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q7 #q14 o10 #g2 #t911
1
7 2
4
0 12 13 6
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q7 #q14 o10 #g3 #t912
1
7 3
4
0 12 13 6
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q7 #q15 o10 #g0 #t913
1
7 0
4
0 12 13 7
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q7 #q15 o10 #g1 #t914
1
7 1
4
0 12 13 7
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q7 #q15 o10 #g2 #t915
1
7 2
4
0 12 13 7
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q7 #q15 o10 #g3 #t916
1
7 3
4
0 12 13 7
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q7 #q2 o10 #g0 #t861
1
7 0
4
0 12 13 8
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q7 #q2 o10 #g1 #t862
1
7 1
4
0 12 13 8
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q7 #q2 o10 #g2 #t863
1
7 2
4
0 12 13 8
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q7 #q2 o10 #g3 #t864
1
7 3
4
0 12 13 8
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q7 #q3 o10 #g0 #t865
1
7 0
4
0 12 13 9
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q7 #q3 o10 #g1 #t866
1
7 1
4
0 12 13 9
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q7 #q3 o10 #g2 #t867
1
7 2
4
0 12 13 9
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q7 #q3 o10 #g3 #t868
1
7 3
4
0 12 13 9
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q7 #q4 o10 #g0 #t869
1
7 0
4
0 12 13 10
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q7 #q4 o10 #g1 #t870
1
7 1
4
0 12 13 10
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q7 #q4 o10 #g2 #t871
1
7 2
4
0 12 13 10
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q7 #q4 o10 #g3 #t872
1
7 3
4
0 12 13 10
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q7 #q5 o10 #g0 #t873
1
7 0
4
0 12 13 11
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q7 #q5 o10 #g1 #t874
1
7 1
4
0 12 13 11
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q7 #q5 o10 #g2 #t875
1
7 2
4
0 12 13 11
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q7 #q5 o10 #g3 #t876
1
7 3
4
0 12 13 11
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q7 #q6 o10 #g0 #t877
1
7 0
4
0 12 13 12
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q7 #q6 o10 #g1 #t878
1
7 1
4
0 12 13 12
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q7 #q6 o10 #g2 #t879
1
7 2
4
0 12 13 12
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q7 #q6 o10 #g3 #t880
1
7 3
4
0 12 13 12
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q7 #q7 o10 #g0 #t881
2
12 13
7 0
3
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q7 #q7 o10 #g1 #t882
2
12 13
7 1
3
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q7 #q7 o10 #g2 #t883
2
12 13
7 2
3
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q7 #q7 o10 #g3 #t884
2
12 13
7 3
3
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q7 #q8 o10 #g0 #t885
1
7 0
4
0 12 13 14
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q7 #q8 o10 #g1 #t886
1
7 1
4
0 12 13 14
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q7 #q8 o10 #g2 #t887
1
7 2
4
0 12 13 14
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q7 #q8 o10 #g3 #t888
1
7 3
4
0 12 13 14
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q7 #q9 o10 #g0 #t889
1
7 0
4
0 12 13 15
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q7 #q9 o10 #g1 #t890
1
7 1
4
0 12 13 15
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q7 #q9 o10 #g2 #t891
1
7 2
4
0 12 13 15
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q7 #q9 o10 #g3 #t892
1
7 3
4
0 12 13 15
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q7 q616 o10 #g0 #t849
1
7 0
4
0 12 13 16
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q7 q616 o10 #g1 #t850
1
7 1
4
0 12 13 16
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q7 q616 o10 #g2 #t851
1
7 2
4
0 12 13 16
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q7 q616 o10 #g3 #t852
1
7 3
4
0 12 13 16
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q8 #q0 o10 #g0 #t921
1
7 0
4
0 12 14 0
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q8 #q0 o10 #g1 #t922
1
7 1
4
0 12 14 0
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q8 #q0 o10 #g2 #t923
1
7 2
4
0 12 14 0
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q8 #q0 o10 #g3 #t924
1
7 3
4
0 12 14 0
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q8 #q1 o10 #g0 #t925
1
7 0
4
0 12 14 1
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q8 #q1 o10 #g1 #t926
1
7 1
4
0 12 14 1
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q8 #q1 o10 #g2 #t927
1
7 2
4
0 12 14 1
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q8 #q1 o10 #g3 #t928
1
7 3
4
0 12 14 1
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q8 #q10 o10 #g0 #t961
1
7 0
4
0 12 14 2
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q8 #q10 o10 #g1 #t962
1
7 1
4
0 12 14 2
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q8 #q10 o10 #g2 #t963
1
7 2
4
0 12 14 2
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q8 #q10 o10 #g3 #t964
1
7 3
4
0 12 14 2
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q8 #q11 o10 #g0 #t965
1
7 0
4
0 12 14 3
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q8 #q11 o10 #g1 #t966
1
7 1
4
0 12 14 3
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q8 #q11 o10 #g2 #t967
1
7 2
4
0 12 14 3
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q8 #q11 o10 #g3 #t968
1
7 3
4
0 12 14 3
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q8 #q12 o10 #g0 #t969
1
7 0
4
0 12 14 4
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q8 #q12 o10 #g1 #t970
1
7 1
4
0 12 14 4
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q8 #q12 o10 #g2 #t971
1
7 2
4
0 12 14 4
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q8 #q12 o10 #g3 #t972
1
7 3
4
0 12 14 4
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q8 #q13 o10 #g0 #t973
1
7 0
4
0 12 14 5
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q8 #q13 o10 #g1 #t974
1
7 1
4
0 12 14 5
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q8 #q13 o10 #g2 #t975
1
7 2
4
0 12 14 5
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q8 #q13 o10 #g3 #t976
1
7 3
4
0 12 14 5
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q8 #q14 o10 #g0 #t977
1
7 0
4
0 12 14 6
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q8 #q14 o10 #g1 #t978
1
7 1
4
0 12 14 6
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q8 #q14 o10 #g2 #t979
1
7 2
4
0 12 14 6
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q8 #q14 o10 #g3 #t980
1
7 3
4
0 12 14 6
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q8 #q15 o10 #g0 #t981
1
7 0
4
0 12 14 7
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q8 #q15 o10 #g1 #t982
1
7 1
4
0 12 14 7
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q8 #q15 o10 #g2 #t983
1
7 2
4
0 12 14 7
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q8 #q15 o10 #g3 #t984
1
7 3
4
0 12 14 7
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q8 #q2 o10 #g0 #t929
1
7 0
4
0 12 14 8
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q8 #q2 o10 #g1 #t930
1
7 1
4
0 12 14 8
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q8 #q2 o10 #g2 #t931
1
7 2
4
0 12 14 8
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q8 #q2 o10 #g3 #t932
1
7 3
4
0 12 14 8
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q8 #q3 o10 #g0 #t933
1
7 0
4
0 12 14 9
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q8 #q3 o10 #g1 #t934
1
7 1
4
0 12 14 9
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q8 #q3 o10 #g2 #t935
1
7 2
4
0 12 14 9
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q8 #q3 o10 #g3 #t936
1
7 3
4
0 12 14 9
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q8 #q4 o10 #g0 #t937
1
7 0
4
0 12 14 10
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q8 #q4 o10 #g1 #t938
1
7 1
4
0 12 14 10
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q8 #q4 o10 #g2 #t939
1
7 2
4
0 12 14 10
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q8 #q4 o10 #g3 #t940
1
7 3
4
0 12 14 10
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q8 #q5 o10 #g0 #t941
1
7 0
4
0 12 14 11
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q8 #q5 o10 #g1 #t942
1
7 1
4
0 12 14 11
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q8 #q5 o10 #g2 #t943
1
7 2
4
0 12 14 11
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q8 #q5 o10 #g3 #t944
1
7 3
4
0 12 14 11
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q8 #q6 o10 #g0 #t945
1
7 0
4
0 12 14 12
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q8 #q6 o10 #g1 #t946
1
7 1
4
0 12 14 12
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q8 #q6 o10 #g2 #t947
1
7 2
4
0 12 14 12
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q8 #q6 o10 #g3 #t948
1
7 3
4
0 12 14 12
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q8 #q7 o10 #g0 #t949
1
7 0
4
0 12 14 13
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q8 #q7 o10 #g1 #t950
1
7 1
4
0 12 14 13
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q8 #q7 o10 #g2 #t951
1
7 2
4
0 12 14 13
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q8 #q7 o10 #g3 #t952
1
7 3
4
0 12 14 13
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q8 #q8 o10 #g0 #t953
2
12 14
7 0
3
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q8 #q8 o10 #g1 #t954
2
12 14
7 1
3
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q8 #q8 o10 #g2 #t955
2
12 14
7 2
3
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q8 #q8 o10 #g3 #t956
2
12 14
7 3
3
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q8 #q9 o10 #g0 #t957
1
7 0
4
0 12 14 15
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q8 #q9 o10 #g1 #t958
1
7 1
4
0 12 14 15
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q8 #q9 o10 #g2 #t959
1
7 2
4
0 12 14 15
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q8 #q9 o10 #g3 #t960
1
7 3
4
0 12 14 15
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q8 q616 o10 #g0 #t917
1
7 0
4
0 12 14 16
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q8 q616 o10 #g1 #t918
1
7 1
4
0 12 14 16
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q8 q616 o10 #g2 #t919
1
7 2
4
0 12 14 16
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q8 q616 o10 #g3 #t920
1
7 3
4
0 12 14 16
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q9 #q0 o10 #g0 #t989
1
7 0
4
0 12 15 0
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q9 #q0 o10 #g1 #t990
1
7 1
4
0 12 15 0
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q9 #q0 o10 #g2 #t991
1
7 2
4
0 12 15 0
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q9 #q0 o10 #g3 #t992
1
7 3
4
0 12 15 0
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q9 #q1 o10 #g0 #t993
1
7 0
4
0 12 15 1
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q9 #q1 o10 #g1 #t994
1
7 1
4
0 12 15 1
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q9 #q1 o10 #g2 #t995
1
7 2
4
0 12 15 1
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q9 #q1 o10 #g3 #t996
1
7 3
4
0 12 15 1
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q9 #q10 o10 #g0 #t1029
1
7 0
4
0 12 15 2
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q9 #q10 o10 #g1 #t1030
1
7 1
4
0 12 15 2
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q9 #q10 o10 #g2 #t1031
1
7 2
4
0 12 15 2
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q9 #q10 o10 #g3 #t1032
1
7 3
4
0 12 15 2
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q9 #q11 o10 #g0 #t1033
1
7 0
4
0 12 15 3
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q9 #q11 o10 #g1 #t1034
1
7 1
4
0 12 15 3
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q9 #q11 o10 #g2 #t1035
1
7 2
4
0 12 15 3
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q9 #q11 o10 #g3 #t1036
1
7 3
4
0 12 15 3
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q9 #q12 o10 #g0 #t1037
1
7 0
4
0 12 15 4
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q9 #q12 o10 #g1 #t1038
1
7 1
4
0 12 15 4
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q9 #q12 o10 #g2 #t1039
1
7 2
4
0 12 15 4
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q9 #q12 o10 #g3 #t1040
1
7 3
4
0 12 15 4
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q9 #q13 o10 #g0 #t1041
1
7 0
4
0 12 15 5
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q9 #q13 o10 #g1 #t1042
1
7 1
4
0 12 15 5
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q9 #q13 o10 #g2 #t1043
1
7 2
4
0 12 15 5
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q9 #q13 o10 #g3 #t1044
1
7 3
4
0 12 15 5
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q9 #q14 o10 #g0 #t1045
1
7 0
4
0 12 15 6
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q9 #q14 o10 #g1 #t1046
1
7 1
4
0 12 15 6
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q9 #q14 o10 #g2 #t1047
1
7 2
4
0 12 15 6
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q9 #q14 o10 #g3 #t1048
1
7 3
4
0 12 15 6
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q9 #q15 o10 #g0 #t1049
1
7 0
4
0 12 15 7
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q9 #q15 o10 #g1 #t1050
1
7 1
4
0 12 15 7
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q9 #q15 o10 #g2 #t1051
1
7 2
4
0 12 15 7
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q9 #q15 o10 #g3 #t1052
1
7 3
4
0 12 15 7
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q9 #q2 o10 #g0 #t997
1
7 0
4
0 12 15 8
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q9 #q2 o10 #g1 #t998
1
7 1
4
0 12 15 8
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q9 #q2 o10 #g2 #t999
1
7 2
4
0 12 15 8
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q9 #q2 o10 #g3 #t1000
1
7 3
4
0 12 15 8
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q9 #q3 o10 #g0 #t1001
1
7 0
4
0 12 15 9
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q9 #q3 o10 #g1 #t1002
1
7 1
4
0 12 15 9
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q9 #q3 o10 #g2 #t1003
1
7 2
4
0 12 15 9
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q9 #q3 o10 #g3 #t1004
1
7 3
4
0 12 15 9
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q9 #q4 o10 #g0 #t1005
1
7 0
4
0 12 15 10
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q9 #q4 o10 #g1 #t1006
1
7 1
4
0 12 15 10
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q9 #q4 o10 #g2 #t1007
1
7 2
4
0 12 15 10
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q9 #q4 o10 #g3 #t1008
1
7 3
4
0 12 15 10
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q9 #q5 o10 #g0 #t1009
1
7 0
4
0 12 15 11
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q9 #q5 o10 #g1 #t1010
1
7 1
4
0 12 15 11
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q9 #q5 o10 #g2 #t1011
1
7 2
4
0 12 15 11
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q9 #q5 o10 #g3 #t1012
1
7 3
4
0 12 15 11
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q9 #q6 o10 #g0 #t1013
1
7 0
4
0 12 15 12
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q9 #q6 o10 #g1 #t1014
1
7 1
4
0 12 15 12
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q9 #q6 o10 #g2 #t1015
1
7 2
4
0 12 15 12
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q9 #q6 o10 #g3 #t1016
1
7 3
4
0 12 15 12
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q9 #q7 o10 #g0 #t1017
1
7 0
4
0 12 15 13
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q9 #q7 o10 #g1 #t1018
1
7 1
4
0 12 15 13
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q9 #q7 o10 #g2 #t1019
1
7 2
4
0 12 15 13
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q9 #q7 o10 #g3 #t1020
1
7 3
4
0 12 15 13
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q9 #q8 o10 #g0 #t1021
1
7 0
4
0 12 15 14
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q9 #q8 o10 #g1 #t1022
1
7 1
4
0 12 15 14
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q9 #q8 o10 #g2 #t1023
1
7 2
4
0 12 15 14
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q9 #q8 o10 #g3 #t1024
1
7 3
4
0 12 15 14
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q9 #q9 o10 #g0 #t1025
2
12 15
7 0
3
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q9 #q9 o10 #g1 #t1026
2
12 15
7 1
3
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q9 #q9 o10 #g2 #t1027
2
12 15
7 2
3
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q9 #q9 o10 #g3 #t1028
2
12 15
7 3
3
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q9 q616 o10 #g0 #t985
1
7 0
4
0 12 15 16
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q9 q616 o10 #g1 #t986
1
7 1
4
0 12 15 16
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q9 q616 o10 #g2 #t987
1
7 2
4
0 12 15 16
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding #q9 q616 o10 #g3 #t988
1
7 3
4
0 12 15 16
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding q616 #q0 o10 #g0 #t45
1
7 0
4
0 12 16 0
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding q616 #q0 o10 #g1 #t46
1
7 1
4
0 12 16 0
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding q616 #q0 o10 #g2 #t47
1
7 2
4
0 12 16 0
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding q616 #q0 o10 #g3 #t48
1
7 3
4
0 12 16 0
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding q616 #q1 o10 #g0 #t49
1
7 0
4
0 12 16 1
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding q616 #q1 o10 #g1 #t50
1
7 1
4
0 12 16 1
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding q616 #q1 o10 #g2 #t51
1
7 2
4
0 12 16 1
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding q616 #q1 o10 #g3 #t52
1
7 3
4
0 12 16 1
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding q616 #q10 o10 #g0 #t429
1
7 0
4
0 12 16 2
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding q616 #q10 o10 #g1 #t430
1
7 1
4
0 12 16 2
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding q616 #q10 o10 #g2 #t431
1
7 2
4
0 12 16 2
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding q616 #q10 o10 #g3 #t432
1
7 3
4
0 12 16 2
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding q616 #q11 o10 #g0 #t433
1
7 0
4
0 12 16 3
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding q616 #q11 o10 #g1 #t434
1
7 1
4
0 12 16 3
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding q616 #q11 o10 #g2 #t435
1
7 2
4
0 12 16 3
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding q616 #q11 o10 #g3 #t436
1
7 3
4
0 12 16 3
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding q616 #q12 o10 #g0 #t437
1
7 0
4
0 12 16 4
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding q616 #q12 o10 #g1 #t438
1
7 1
4
0 12 16 4
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding q616 #q12 o10 #g2 #t439
1
7 2
4
0 12 16 4
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding q616 #q12 o10 #g3 #t440
1
7 3
4
0 12 16 4
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding q616 #q13 o10 #g0 #t441
1
7 0
4
0 12 16 5
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding q616 #q13 o10 #g1 #t442
1
7 1
4
0 12 16 5
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding q616 #q13 o10 #g2 #t443
1
7 2
4
0 12 16 5
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding q616 #q13 o10 #g3 #t444
1
7 3
4
0 12 16 5
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding q616 #q14 o10 #g0 #t445
1
7 0
4
0 12 16 6
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding q616 #q14 o10 #g1 #t446
1
7 1
4
0 12 16 6
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding q616 #q14 o10 #g2 #t447
1
7 2
4
0 12 16 6
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding q616 #q14 o10 #g3 #t448
1
7 3
4
0 12 16 6
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding q616 #q15 o10 #g0 #t449
1
7 0
4
0 12 16 7
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding q616 #q15 o10 #g1 #t450
1
7 1
4
0 12 16 7
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding q616 #q15 o10 #g2 #t451
1
7 2
4
0 12 16 7
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding q616 #q15 o10 #g3 #t452
1
7 3
4
0 12 16 7
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding q616 #q2 o10 #g0 #t53
1
7 0
4
0 12 16 8
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding q616 #q2 o10 #g1 #t54
1
7 1
4
0 12 16 8
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding q616 #q2 o10 #g2 #t55
1
7 2
4
0 12 16 8
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding q616 #q2 o10 #g3 #t56
1
7 3
4
0 12 16 8
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding q616 #q3 o10 #g0 #t57
1
7 0
4
0 12 16 9
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding q616 #q3 o10 #g1 #t58
1
7 1
4
0 12 16 9
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding q616 #q3 o10 #g2 #t59
1
7 2
4
0 12 16 9
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding q616 #q3 o10 #g3 #t60
1
7 3
4
0 12 16 9
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding q616 #q4 o10 #g0 #t405
1
7 0
4
0 12 16 10
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding q616 #q4 o10 #g1 #t406
1
7 1
4
0 12 16 10
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding q616 #q4 o10 #g2 #t407
1
7 2
4
0 12 16 10
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding q616 #q4 o10 #g3 #t408
1
7 3
4
0 12 16 10
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding q616 #q5 o10 #g0 #t409
1
7 0
4
0 12 16 11
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding q616 #q5 o10 #g1 #t410
1
7 1
4
0 12 16 11
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding q616 #q5 o10 #g2 #t411
1
7 2
4
0 12 16 11
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding q616 #q5 o10 #g3 #t412
1
7 3
4
0 12 16 11
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding q616 #q6 o10 #g0 #t413
1
7 0
4
0 12 16 12
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding q616 #q6 o10 #g1 #t414
1
7 1
4
0 12 16 12
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding q616 #q6 o10 #g2 #t415
1
7 2
4
0 12 16 12
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding q616 #q6 o10 #g3 #t416
1
7 3
4
0 12 16 12
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding q616 #q7 o10 #g0 #t417
1
7 0
4
0 12 16 13
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding q616 #q7 o10 #g1 #t418
1
7 1
4
0 12 16 13
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding q616 #q7 o10 #g2 #t419
1
7 2
4
0 12 16 13
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding q616 #q7 o10 #g3 #t420
1
7 3
4
0 12 16 13
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding q616 #q8 o10 #g0 #t421
1
7 0
4
0 12 16 14
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding q616 #q8 o10 #g1 #t422
1
7 1
4
0 12 16 14
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding q616 #q8 o10 #g2 #t423
1
7 2
4
0 12 16 14
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding q616 #q8 o10 #g3 #t424
1
7 3
4
0 12 16 14
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding q616 #q9 o10 #g0 #t425
1
7 0
4
0 12 16 15
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding q616 #q9 o10 #g1 #t426
1
7 1
4
0 12 16 15
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding q616 #q9 o10 #g2 #t427
1
7 2
4
0 12 16 15
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding q616 #q9 o10 #g3 #t428
1
7 3
4
0 12 16 15
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding q616 q616 o10 #g0 #t5
2
12 16
7 0
3
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding q616 q616 o10 #g1 #t42
2
12 16
7 1
3
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding q616 q616 o10 #g2 #t43
2
12 16
7 2
3
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
move_holding q616 q616 o10 #g3 #t44
2
12 16
7 3
3
0 9 0 1
0 11 -1 0
0 10 -1 0
100
end_operator
begin_operator
pick o10 #p0 #g1 #q7 #t9
4
12 13
11 0
4 0
1 1
3
0 7 4 1
0 9 -1 0
0 8 0 1
100
end_operator
begin_operator
pick o10 #p1 #g2 #q11 #t13
4
12 3
11 0
5 0
2 1
3
0 7 5 2
0 9 -1 0
0 8 0 1
100
end_operator
begin_operator
pick o10 #p2 #g3 #q15 #t17
4
12 7
11 0
6 0
3 1
3
0 7 6 3
0 9 -1 0
0 8 0 1
100
end_operator
begin_operator
pick o10 p360 #g0 #q0 #t1
3
12 0
11 0
0 0
3
0 7 7 0
0 9 -1 0
0 8 0 1
100
end_operator
begin_operator
place o10 #p0 o6 #g0 #q1 #t2
1
12 1
7
0 13 -1 0
0 7 0 4
0 9 -1 0
0 11 -1 1
0 10 0 1
0 8 -1 0
0 4 -1 1
100
end_operator
begin_operator
place o10 #p0 o6 #g1 #q7 #t9
1
12 13
8
0 13 -1 0
0 7 1 4
0 9 -1 0
0 11 -1 1
0 10 0 1
0 8 -1 0
0 4 -1 1
0 1 -1 0
100
end_operator
begin_operator
place o10 #p0 o6 #g2 #q8 #t10
1
12 14
7
0 13 -1 0
0 7 2 4
0 9 -1 0
0 11 -1 1
0 10 0 1
0 8 -1 0
0 4 -1 1
100
end_operator
begin_operator
place o10 #p0 o6 #g3 #q9 #t11
1
12 15
7
0 13 -1 0
0 7 3 4
0 9 -1 0
0 11 -1 1
0 10 0 1
0 8 -1 0
0 4 -1 1
100
end_operator
begin_operator
place o10 #p1 o8 #g0 #q2 #t3
1
12 8
7
0 13 -1 0
0 7 0 5
0 9 -1 0
0 11 -1 1
0 10 0 1
0 8 -1 0
0 5 -1 1
100
end_operator
begin_operator
place o10 #p1 o8 #g1 #q10 #t12
1
12 2
7
0 13 -1 0
0 7 1 5
0 9 -1 0
0 11 -1 1
0 10 0 1
0 8 -1 0
0 5 -1 1
100
end_operator
begin_operator
place o10 #p1 o8 #g2 #q11 #t13
1
12 3
8
0 13 -1 0
0 7 2 5
0 9 -1 0
0 11 -1 1
0 10 0 1
0 8 -1 0
0 5 -1 1
0 2 -1 0
100
end_operator
begin_operator
place o10 #p1 o8 #g3 #q12 #t14
1
12 4
7
0 13 -1 0
0 7 3 5
0 9 -1 0
0 11 -1 1
0 10 0 1
0 8 -1 0
0 5 -1 1
100
end_operator
begin_operator
place o10 #p2 o7 #g0 #q3 #t4
1
12 9
7
0 13 -1 0
0 7 0 6
0 9 -1 0
0 11 -1 1
0 10 0 1
0 8 -1 0
0 6 -1 1
100
end_operator
begin_operator
place o10 #p2 o7 #g1 #q13 #t15
1
12 5
7
0 13 -1 0
0 7 1 6
0 9 -1 0
0 11 -1 1
0 10 0 1
0 8 -1 0
0 6 -1 1
100
end_operator
begin_operator
place o10 #p2 o7 #g2 #q14 #t16
1
12 6
7
0 13 -1 0
0 7 2 6
0 9 -1 0
0 11 -1 1
0 10 0 1
0 8 -1 0
0 6 -1 1
100
end_operator
begin_operator
place o10 #p2 o7 #g3 #q15 #t17
1
12 7
8
0 13 -1 0
0 7 3 6
0 9 -1 0
0 11 -1 1
0 10 0 1
0 8 -1 0
0 6 -1 1
0 3 -1 0
100
end_operator
1
begin_rule
1
7 4
14 1 0
end_rule
begin_SG
switch 0
check 0
switch 7
check 0
check 0
check 0
check 0
check 0
check 0
check 0
check 0
switch 8
check 0
switch 11
check 0
switch 12
check 0
check 1
1452
check 0
check 0
check 0
check 0
check 0
check 0
check 0
check 0
check 0
check 0
check 0
check 0
check 0
check 0
check 0
check 0
check 0
check 0
check 0
check 0
check 0
check 0
check 0
switch 1
check 0
check 0
switch 4
check 0
switch 7
check 0
check 0
check 0
check 0
check 0
switch 8
check 0
switch 11
check 0
switch 12
check 0
check 0
check 0
check 0
check 0
check 0
check 0
check 0
check 0
check 0
check 0
check 0
check 0
check 0
check 1
1449
check 0
check 0
check 0
check 0
check 0
check 0
check 0
check 0
check 0
check 0
check 0
check 0
check 0
check 0
switch 2
check 0
check 0
switch 5
check 0
switch 7
check 0
check 0
check 0
check 0
check 0
check 0
switch 8
check 0
switch 11
check 0
switch 12
check 0
check 0
check 0
check 0
check 1
1450
check 0
check 0
check 0
check 0
check 0
check 0
check 0
check 0
check 0
check 0
check 0
check 0
check 0
check 0
check 0
check 0
check 0
check 0
check 0
check 0
check 0
check 0
check 0
switch 3
check 0
check 0
switch 6
check 0
switch 7
check 0
check 0
check 0
check 0
check 0
check 0
check 0
switch 8
check 0
switch 11
check 0
switch 12
check 0
check 0
check 0
check 0
check 0
check 0
check 0
check 0
check 1
1451
check 0
check 0
check 0
check 0
check 0
check 0
check 0
check 0
check 0
check 0
check 0
check 0
check 0
check 0
check 0
check 0
check 0
check 0
switch 7
check 0
switch 9
check 0
switch 12
check 0
check 17
293
297
301
305
309
313
317
321
325
329
333
337
341
345
349
353
357
check 17
361
365
369
373
377
381
385
389
393
397
401
405
409
413
417
421
425
check 17
429
433
437
441
445
449
453
457
461
465
469
473
477
481
485
489
493
check 17
497
501
505
509
513
517
521
525
529
533
537
541
545
549
553
557
561
check 17
565
569
573
577
581
585
589
593
597
601
605
609
613
617
621
625
629
check 17
633
637
641
645
649
653
657
661
665
669
673
677
681
685
689
693
697
check 17
701
705
709
713
717
721
725
729
733
737
741
745
749
753
757
761
765
check 17
769
773
777
781
785
789
793
797
801
805
809
813
817
821
825
829
833
check 17
837
841
845
849
853
857
861
865
869
873
877
881
885
889
893
897
901
check 17
905
909
913
917
921
925
929
933
937
941
945
949
953
957
961
965
969
check 17
973
977
981
985
989
993
997
1001
1005
1009
1013
1017
1021
1025
1029
1033
1037
check 17
1041
1045
1049
1053
1057
1061
1065
1069
1073
1077
1081
1085
1089
1093
1097
1101
1105
check 17
1109
1113
1117
1121
1125
1129
1133
1137
1141
1145
1149
1153
1157
1161
1165
1169
1173
check 17
1177
1181
1185
1189
1193
1197
1201
1205
1209
1213
1217
1221
1225
1229
1233
1237
1241
check 17
1245
1249
1253
1257
1261
1265
1269
1273
1277
1281
1285
1289
1293
1297
1301
1305
1309
check 17
1313
1317
1321
1325
1329
1333
1337
1341
1345
1349
1353
1357
1361
1365
1369
1373
1377
check 17
1381
1385
1389
1393
1397
1401
1405
1409
1413
1417
1421
1425
1429
1433
1437
1441
1445
check 0
check 0
switch 10
check 0
switch 12
check 0
check 0
check 1
1453
check 0
check 0
check 0
check 0
check 0
check 0
check 1
1457
check 1
1461
check 0
check 0
check 0
check 0
check 0
check 0
check 0
check 0
check 0
check 0
switch 9
check 0
switch 12
check 0
check 17
294
298
302
306
310
314
318
322
326
330
334
338
342
346
350
354
358
check 17
362
366
370
374
378
382
386
390
394
398
402
406
410
414
418
422
426
check 17
430
434
438
442
446
450
454
458
462
466
470
474
478
482
486
490
494
check 17
498
502
506
510
514
518
522
526
530
534
538
542
546
550
554
558
562
check 17
566
570
574
578
582
586
590
594
598
602
606
610
614
618
622
626
630
check 17
634
638
642
646
650
654
658
662
666
670
674
678
682
686
690
694
698
check 17
702
706
710
714
718
722
726
730
734
738
742
746
750
754
758
762
766
check 17
770
774
778
782
786
790
794
798
802
806
810
814
818
822
826
830
834
check 17
838
842
846
850
854
858
862
866
870
874
878
882
886
890
894
898
902
check 17
906
910
914
918
922
926
930
934
938
942
946
950
954
958
962
966
970
check 17
974
978
982
986
990
994
998
1002
1006
1010
1014
1018
1022
1026
1030
1034
1038
check 17
1042
1046
1050
1054
1058
1062
1066
1070
1074
1078
1082
1086
1090
1094
1098
1102
1106
check 17
1110
1114
1118
1122
1126
1130
1134
1138
1142
1146
1150
1154
1158
1162
1166
1170
1174
check 17
1178
1182
1186
1190
1194
1198
1202
1206
1210
1214
1218
1222
1226
1230
1234
1238
1242
check 17
1246
1250
1254
1258
1262
1266
1270
1274
1278
1282
1286
1290
1294
1298
1302
1306
1310
check 17
1314
1318
1322
1326
1330
1334
1338
1342
1346
1350
1354
1358
1362
1366
1370
1374
1378
check 17
1382
1386
1390
1394
1398
1402
1406
1410
1414
1418
1422
1426
1430
1434
1438
1442
1446
check 0
check 0
switch 10
check 0
switch 12
check 0
check 0
check 0
check 1
1458
check 0
check 0
check 1
1462
check 0
check 0
check 0
check 0
check 0
check 0
check 0
check 1
1454
check 0
check 0
check 0
check 0
check 0
check 0
switch 9
check 0
switch 12
check 0
check 17
295
299
303
307
311
315
319
323
327
331
335
339
343
347
351
355
359
check 17
363
367
371
375
379
383
387
391
395
399
403
407
411
415
419
423
427
check 17
431
435
439
443
447
451
455
459
463
467
471
475
479
483
487
491
495
check 17
499
503
507
511
515
519
523
527
531
535
539
543
547
551
555
559
563
check 17
567
571
575
579
583
587
591
595
599
603
607
611
615
619
623
627
631
check 17
635
639
643
647
651
655
659
663
667
671
675
679
683
687
691
695
699
check 17
703
707
711
715
719
723
727
731
735
739
743
747
751
755
759
763
767
check 17
771
775
779
783
787
791
795
799
803
807
811
815
819
823
827
831
835
check 17
839
843
847
851
855
859
863
867
871
875
879
883
887
891
895
899
903
check 17
907
911
915
919
923
927
931
935
939
943
947
951
955
959
963
967
971
check 17
975
979
983
987
991
995
999
1003
1007
1011
1015
1019
1023
1027
1031
1035
1039
check 17
1043
1047
1051
1055
1059
1063
1067
1071
1075
1079
1083
1087
1091
1095
1099
1103
1107
check 17
1111
1115
1119
1123
1127
1131
1135
1139
1143
1147
1151
1155
1159
1163
1167
1171
1175
check 17
1179
1183
1187
1191
1195
1199
1203
1207
1211
1215
1219
1223
1227
1231
1235
1239
1243
check 17
1247
1251
1255
1259
1263
1267
1271
1275
1279
1283
1287
1291
1295
1299
1303
1307
1311
check 17
1315
1319
1323
1327
1331
1335
1339
1343
1347
1351
1355
1359
1363
1367
1371
1375
1379
check 17
1383
1387
1391
1395
1399
1403
1407
1411
1415
1419
1423
1427
1431
1435
1439
1443
1447
check 0
check 0
switch 10
check 0
switch 12
check 0
check 0
check 0
check 0
check 1
1459
check 0
check 0
check 1
1463
check 0
check 0
check 0
check 0
check 0
check 0
check 0
check 1
1455
check 0
check 0
check 0
check 0
check 0
switch 9
check 0
switch 12
check 0
check 17
296
300
304
308
312
316
320
324
328
332
336
340
344
348
352
356
360
check 17
364
368
372
376
380
384
388
392
396
400
404
408
412
416
420
424
428
check 17
432
436
440
444
448
452
456
460
464
468
472
476
480
484
488
492
496
check 17
500
504
508
512
516
520
524
528
532
536
540
544
548
552
556
560
564
check 17
568
572
576
580
584
588
592
596
600
604
608
612
616
620
624
628
632
check 17
636
640
644
648
652
656
660
664
668
672
676
680
684
688
692
696
700
check 17
704
708
712
716
720
724
728
732
736
740
744
748
752
756
760
764
768
check 17
772
776
780
784
788
792
796
800
804
808
812
816
820
824
828
832
836
check 17
840
844
848
852
856
860
864
868
872
876
880
884
888
892
896
900
904
check 17
908
912
916
920
924
928
932
936
940
944
948
952
956
960
964
968
972
check 17
976
980
984
988
992
996
1000
1004
1008
1012
1016
1020
1024
1028
1032
1036
1040
check 17
1044
1048
1052
1056
1060
1064
1068
1072
1076
1080
1084
1088
1092
1096
1100
1104
1108
check 17
1112
1116
1120
1124
1128
1132
1136
1140
1144
1148
1152
1156
1160
1164
1168
1172
1176
check 17
1180
1184
1188
1192
1196
1200
1204
1208
1212
1216
1220
1224
1228
1232
1236
1240
1244
check 17
1248
1252
1256
1260
1264
1268
1272
1276
1280
1284
1288
1292
1296
1300
1304
1308
1312
check 17
1316
1320
1324
1328
1332
1336
1340
1344
1348
1352
1356
1360
1364
1368
1372
1376
1380
check 17
1384
1388
1392
1396
1400
1404
1408
1412
1416
1420
1424
1428
1432
1436
1440
1444
1448
check 0
check 0
switch 10
check 0
switch 12
check 0
check 0
check 0
check 0
check 0
check 1
1460
check 0
check 0
check 1
1464
check 0
check 0
check 0
check 0
check 0
check 0
check 0
check 1
1456
check 0
check 0
check 0
check 0
check 0
check 0
check 0
check 0
switch 8
check 0
switch 9
check 0
switch 12
check 0
check 17
4
5
6
7
8
9
10
11
12
13
14
15
16
17
18
19
20
check 17
21
22
23
24
25
26
27
28
29
30
31
32
33
34
35
36
37
check 17
38
39
40
41
42
43
44
45
46
47
48
49
50
51
52
53
54
check 17
55
56
57
58
59
60
61
62
63
64
65
66
67
68
69
70
71
check 17
72
73
74
75
76
77
78
79
80
81
82
83
84
85
86
87
88
check 17
89
90
91
92
93
94
95
96
97
98
99
100
101
102
103
104
105
check 17
106
107
108
109
110
111
112
113
114
115
116
117
118
119
120
121
122
check 17
123
124
125
126
127
128
129
130
131
132
133
134
135
136
137
138
139
check 17
140
141
142
143
144
145
146
147
148
149
150
151
152
153
154
155
156
check 17
157
158
159
160
161
162
163
164
165
166
167
168
169
170
171
172
173
check 17
174
175
176
177
178
179
180
181
182
183
184
185
186
187
188
189
190
check 17
191
192
193
194
195
196
197
198
199
200
201
202
203
204
205
206
207
check 17
208
209
210
211
212
213
214
215
216
217
218
219
220
221
222
223
224
check 17
225
226
227
228
229
230
231
232
233
234
235
236
237
238
239
240
241
check 17
242
243
244
245
246
247
248
249
250
251
252
253
254
255
256
257
258
check 17
259
260
261
262
263
264
265
266
267
268
269
270
271
272
273
274
275
check 17
276
277
278
279
280
281
282
283
284
285
286
287
288
289
290
291
292
check 0
check 0
check 0
check 0
switch 9
check 0
switch 13
check 0
check 4
0
1
2
3
check 0
check 0
check 0
check 0
end_SG
begin_DTG
0
1
0
3
2
9 0
13 0
end_DTG
begin_DTG
0
1
0
1454
3
7 1
10 0
12 13
end_DTG
begin_DTG
0
1
0
1459
3
7 2
10 0
12 3
end_DTG
begin_DTG
0
1
0
1464
3
7 3
10 0
12 7
end_DTG
begin_DTG
4
1
1453
3
7 0
10 0
12 1
1
1454
3
7 1
10 0
12 13
1
1455
3
7 2
10 0
12 14
1
1456
3
7 3
10 0
12 15
1
0
0
2
9 0
13 0
end_DTG
begin_DTG
4
1
1457
3
7 0
10 0
12 8
1
1458
3
7 1
10 0
12 2
1
1459
3
7 2
10 0
12 3
1
1460
3
7 3
10 0
12 4
1
0
1
2
9 0
13 0
end_DTG
begin_DTG
4
1
1461
3
7 0
10 0
12 9
1
1462
3
7 1
10 0
12 5
1
1463
3
7 2
10 0
12 6
1
1464
3
7 3
10 0
12 7
1
0
2
2
9 0
13 0
end_DTG
begin_DTG
3
4
1453
2
10 0
12 1
5
1457
2
10 0
12 8
6
1461
2
10 0
12 9
3
4
1454
2
10 0
12 13
5
1458
2
10 0
12 2
6
1462
2
10 0
12 5
3
4
1455
2
10 0
12 14
5
1459
2
10 0
12 3
6
1463
2
10 0
12 6
3
4
1456
2
10 0
12 15
5
1460
2
10 0
12 4
6
1464
2
10 0
12 7
1
1
1449
5
1 1
4 0
8 0
11 0
12 13
1
2
1450
5
2 1
5 0
8 0
11 0
12 3
1
3
1451
5
3 1
6 0
8 0
11 0
12 7
1
0
1452
4
0 0
8 0
11 0
12 0
end_DTG
begin_DTG
4
1
1452
4
0 0
7 7
11 0
12 0
1
1449
5
1 1
4 0
7 4
11 0
12 13
1
1450
5
2 1
5 0
7 5
11 0
12 3
1
1451
5
3 1
6 0
7 6
11 0
12 7
12
0
1453
3
7 0
10 0
12 1
0
1454
3
7 1
10 0
12 13
0
1455
3
7 2
10 0
12 14
0
1456
3
7 3
10 0
12 15
0
1457
3
7 0
10 0
12 8
0
1458
3
7 1
10 0
12 2
0
1459
3
7 2
10 0
12 3
0
1460
3
7 3
10 0
12 4
0
1461
3
7 0
10 0
12 9
0
1462
3
7 1
10 0
12 5
0
1463
3
7 2
10 0
12 6
0
1464
3
7 3
10 0
12 7
end_DTG
begin_DTG
85
1
963
2
7 2
12 9
1
974
2
7 1
12 10
1
973
2
7 0
12 10
1
972
2
7 3
12 9
1
970
2
7 1
12 9
1
969
2
7 0
12 9
1
975
2
7 2
12 10
1
996
2
7 3
12 10
1
1054
2
7 1
12 11
1
1065
2
7 0
12 11
1
1064
2
7 3
12 11
1
1063
2
7 2
12 11
1
782
2
7 1
12 7
1
793
2
7 0
12 7
1
792
2
7 3
12 7
1
791
2
7 2
12 7
1
737
2
7 0
12 6
1
748
2
7 3
12 6
1
747
2
7 2
12 6
1
746
2
7 1
12 6
1
873
2
7 0
12 8
1
884
2
7 3
12 8
1
883
2
7 2
12 8
1
882
2
7 1
12 8
1
1324
2
7 3
12 15
1
1335
2
7 2
12 15
1
1334
2
7 1
12 15
1
1333
2
7 0
12 15
1
1279
2
7 2
12 14
1
1290
2
7 1
12 14
1
1289
2
7 0
12 14
1
1288
2
7 3
12 14
1
1415
2
7 2
12 16
1
1426
2
7 1
12 16
1
1425
2
7 0
12 16
1
1424
2
7 3
12 16
1
1144
2
7 3
12 12
1
1155
2
7 2
12 12
1
1154
2
7 1
12 12
1
1153
2
7 0
12 12
1
1177
2
7 0
12 13
1
1178
2
7 1
12 13
1
1244
2
7 3
12 13
1
1243
2
7 2
12 13
1
240
2
8 0
12 13
1
251
2
8 0
12 14
1
263
2
8 0
12 15
1
195
2
8 0
12 11
1
190
2
8 0
12 10
1
218
2
8 0
12 12
1
331
2
7 2
12 0
1
342
2
7 1
12 0
1
341
2
7 0
12 0
1
340
2
7 3
12 0
1
364
2
7 3
12 1
1
363
2
7 2
12 1
1
362
2
7 1
12 1
1
361
2
7 0
12 1
1
286
2
8 0
12 16
1
60
2
8 0
12 3
1
72
2
8 0
12 4
1
54
2
8 0
12 2
1
93
2
8 0
12 5
1
15
2
8 0
12 0
1
26
2
8 0
12 1
1
150
2
8 0
12 8
1
161
2
8 0
12 9
1
139
2
8 0
12 7
1
116
2
8 0
12 6
1
601
2
7 0
12 4
1
612
2
7 3
12 4
1
611
2
7 2
12 4
1
610
2
7 1
12 4
1
635
2
7 2
12 5
1
634
2
7 1
12 5
1
633
2
7 0
12 5
1
556
2
7 3
12 3
1
563
2
7 2
12 3
1
562
2
7 1
12 3
1
561
2
7 0
12 3
1
636
2
7 3
12 5
1
432
2
7 3
12 2
1
431
2
7 2
12 2
1
430
2
7 1
12 2
1
429
2
7 0
12 2
16
0
1453
3
7 0
10 0
12 1
0
1454
3
7 1
10 0
12 13
0
1455
3
7 2
10 0
12 14
0
1456
3
7 3
10 0
12 15
0
1457
3
7 0
10 0
12 8
0
1458
3
7 1
10 0
12 2
0
1459
3
7 2
10 0
12 3
0
1460
3
7 3
10 0
12 4
0
1461
3
7 0
10 0
12 9
0
1462
3
7 1
10 0
12 5
0
1463
3
7 2
10 0
12 6
0
1464
3
7 3
10 0
12 7
0
1452
5
0 0
7 7
8 0
11 0
12 0
0
1449
6
1 1
4 0
7 4
8 0
11 0
12 13
0
1450
6
2 1
5 0
7 5
8 0
11 0
12 3
0
1451
6
3 1
6 0
7 6
8 0
11 0
12 7
end_DTG
begin_DTG
12
1
1453
2
7 0
12 1
1
1454
2
7 1
12 13
1
1455
2
7 2
12 14
1
1456
2
7 3
12 15
1
1457
2
7 0
12 8
1
1458
2
7 1
12 2
1
1459
2
7 2
12 3
1
1460
2
7 3
12 4
1
1461
2
7 0
12 9
1
1462
2
7 1
12 5
1
1463
2
7 2
12 6
1
1464
2
7 3
12 7
68
0
1060
3
7 3
9 0
12 11
0
1069
3
7 0
9 0
12 11
0
1067
3
7 2
9 0
12 11
0
1066
3
7 1
9 0
12 11
0
1024
3
7 3
9 0
12 10
0
1031
3
7 2
9 0
12 10
0
1030
3
7 1
9 0
12 10
0
1029
3
7 0
9 0
12 10
0
1133
3
7 0
9 0
12 12
0
1140
3
7 3
9 0
12 12
0
1139
3
7 2
9 0
12 12
0
1138
3
7 1
9 0
12 12
0
916
3
7 3
9 0
12 9
0
923
3
7 2
9 0
12 9
0
922
3
7 1
9 0
12 9
0
921
3
7 0
9 0
12 9
0
880
3
7 3
9 0
12 8
0
887
3
7 2
9 0
12 8
0
886
3
7 1
9 0
12 8
0
885
3
7 0
9 0
12 8
0
1349
3
7 0
9 0
12 15
0
1358
3
7 1
9 0
12 15
0
1356
3
7 3
9 0
12 15
0
1355
3
7 2
9 0
12 15
0
1312
3
7 3
9 0
12 14
0
1311
3
7 2
9 0
12 14
0
1310
3
7 1
9 0
12 14
0
1309
3
7 0
9 0
12 14
0
1422
3
7 1
9 0
12 16
0
1429
3
7 0
9 0
12 16
0
1428
3
7 3
9 0
12 16
0
1427
3
7 2
9 0
12 16
0
1205
3
7 0
9 0
12 13
0
1212
3
7 3
9 0
12 13
0
1211
3
7 2
9 0
12 13
0
1210
3
7 1
9 0
12 13
0
482
3
7 1
9 0
12 2
0
491
3
7 2
9 0
12 2
0
489
3
7 0
9 0
12 2
0
488
3
7 3
9 0
12 2
0
501
3
7 0
9 0
12 3
0
508
3
7 3
9 0
12 3
0
507
3
7 2
9 0
12 3
0
506
3
7 1
9 0
12 3
0
573
3
7 0
9 0
12 4
0
580
3
7 3
9 0
12 4
0
579
3
7 2
9 0
12 4
0
578
3
7 1
9 0
12 4
0
338
3
7 1
9 0
12 0
0
345
3
7 0
9 0
12 0
0
344
3
7 3
9 0
12 0
0
343
3
7 2
9 0
12 0
0
364
3
7 3
9 0
12 1
0
363
3
7 2
9 0
12 1
0
362
3
7 1
9 0
12 1
0
361
3
7 0
9 0
12 1
0
771
3
7 2
9 0
12 7
0
780
3
7 3
9 0
12 7
0
778
3
7 1
9 0
12 7
0
777
3
7 0
9 0
12 7
0
768
3
7 3
9 0
12 6
0
767
3
7 2
9 0
12 6
0
766
3
7 1
9 0
12 6
0
765
3
7 0
9 0
12 6
0
635
3
7 2
9 0
12 5
0
634
3
7 1
9 0
12 5
0
633
3
7 0
9 0
12 5
0
636
3
7 3
9 0
12 5
end_DTG
begin_DTG
12
1
1453
3
7 0
10 0
12 1
1
1454
3
7 1
10 0
12 13
1
1455
3
7 2
10 0
12 14
1
1456
3
7 3
10 0
12 15
1
1457
3
7 0
10 0
12 8
1
1458
3
7 1
10 0
12 2
1
1459
3
7 2
10 0
12 3
1
1460
3
7 3
10 0
12 4
1
1461
3
7 0
10 0
12 9
1
1462
3
7 1
10 0
12 5
1
1463
3
7 2
10 0
12 6
1
1464
3
7 3
10 0
12 7
85
0
963
3
7 2
9 0
12 9
0
974
3
7 1
9 0
12 10
0
973
3
7 0
9 0
12 10
0
972
3
7 3
9 0
12 9
0
970
3
7 1
9 0
12 9
0
969
3
7 0
9 0
12 9
0
975
3
7 2
9 0
12 10
0
996
3
7 3
9 0
12 10
0
1054
3
7 1
9 0
12 11
0
1065
3
7 0
9 0
12 11
0
1064
3
7 3
9 0
12 11
0
1063
3
7 2
9 0
12 11
0
782
3
7 1
9 0
12 7
0
793
3
7 0
9 0
12 7
0
792
3
7 3
9 0
12 7
0
791
3
7 2
9 0
12 7
0
737
3
7 0
9 0
12 6
0
748
3
7 3
9 0
12 6
0
747
3
7 2
9 0
12 6
0
746
3
7 1
9 0
12 6
0
873
3
7 0
9 0
12 8
0
884
3
7 3
9 0
12 8
0
883
3
7 2
9 0
12 8
0
882
3
7 1
9 0
12 8
0
1324
3
7 3
9 0
12 15
0
1335
3
7 2
9 0
12 15
0
1334
3
7 1
9 0
12 15
0
1333
3
7 0
9 0
12 15
0
1279
3
7 2
9 0
12 14
0
1290
3
7 1
9 0
12 14
0
1289
3
7 0
9 0
12 14
0
1288
3
7 3
9 0
12 14
0
1415
3
7 2
9 0
12 16
0
1426
3
7 1
9 0
12 16
0
1425
3
7 0
9 0
12 16
0
1424
3
7 3
9 0
12 16
0
1144
3
7 3
9 0
12 12
0
1155
3
7 2
9 0
12 12
0
1154
3
7 1
9 0
12 12
0
1153
3
7 0
9 0
12 12
0
1177
3
7 0
9 0
12 13
0
1178
3
7 1
9 0
12 13
0
1244
3
7 3
9 0
12 13
0
1243
3
7 2
9 0
12 13
0
240
3
8 0
9 0
12 13
0
251
3
8 0
9 0
12 14
0
263
3
8 0
9 0
12 15
0
195
3
8 0
9 0
12 11
0
190
3
8 0
9 0
12 10
0
218
3
8 0
9 0
12 12
0
331
3
7 2
9 0
12 0
0
342
3
7 1
9 0
12 0
0
341
3
7 0
9 0
12 0
0
340
3
7 3
9 0
12 0
0
364
3
7 3
9 0
12 1
0
363
3
7 2
9 0
12 1
0
362
3
7 1
9 0
12 1
0
361
3
7 0
9 0
12 1
0
286
3
8 0
9 0
12 16
0
60
3
8 0
9 0
12 3
0
72
3
8 0
9 0
12 4
0
54
3
8 0
9 0
12 2
0
93
3
8 0
9 0
12 5
0
15
3
8 0
9 0
12 0
0
26
3
8 0
9 0
12 1
0
150
3
8 0
9 0
12 8
0
161
3
8 0
9 0
12 9
0
139
3
8 0
9 0
12 7
0
116
3
8 0
9 0
12 6
0
601
3
7 0
9 0
12 4
0
612
3
7 3
9 0
12 4
0
611
3
7 2
9 0
12 4
0
610
3
7 1
9 0
12 4
0
635
3
7 2
9 0
12 5
0
634
3
7 1
9 0
12 5
0
633
3
7 0
9 0
12 5
0
556
3
7 3
9 0
12 3
0
563
3
7 2
9 0
12 3
0
562
3
7 1
9 0
12 3
0
561
3
7 0
9 0
12 3
0
636
3
7 3
9 0
12 5
0
432
3
7 3
9 0
12 2
0
431
3
7 2
9 0
12 2
0
430
3
7 1
9 0
12 2
0
429
3
7 0
9 0
12 2
end_DTG
begin_DTG
80
1
300
2
7 3
9 0
1
299
2
7 2
9 0
1
298
2
7 1
9 0
1
297
2
7 0
9 0
1
5
2
8 0
9 0
2
6
2
8 0
9 0
2
304
2
7 3
9 0
2
303
2
7 2
9 0
2
302
2
7 1
9 0
2
301
2
7 0
9 0
3
308
2
7 3
9 0
3
307
2
7 2
9 0
3
306
2
7 1
9 0
3
305
2
7 0
9 0
3
7
2
8 0
9 0
4
312
2
7 3
9 0
4
311
2
7 2
9 0
4
310
2
7 1
9 0
4
309
2
7 0
9 0
4
8
2
8 0
9 0
5
314
2
7 1
9 0
5
313
2
7 0
9 0
5
9
2
8 0
9 0
5
315
2
7 2
9 0
5
316
2
7 3
9 0
6
10
2
8 0
9 0
6
317
2
7 0
9 0
6
318
2
7 1
9 0
6
319
2
7 2
9 0
6
320
2
7 3
9 0
7
321
2
7 0
9 0
7
324
2
7 3
9 0
7
323
2
7 2
9 0
7
322
2
7 1
9 0
7
11
2
8 0
9 0
8
328
2
7 3
9 0
8
327
2
7 2
9 0
8
12
2
8 0
9 0
8
325
2
7 0
9 0
8
326
2
7 1
9 0
9
332
2
7 3
9 0
9
331
2
7 2
9 0
9
330
2
7 1
9 0
9
329
2
7 0
9 0
9
13
2
8 0
9 0
10
333
2
7 0
9 0
10
14
2
8 0
9 0
10
334
2
7 1
9 0
10
335
2
7 2
9 0
10
336
2
7 3
9 0
11
337
2
7 0
9 0
11
338
2
7 1
9 0
11
339
2
7 2
9 0
11
15
2
8 0
9 0
11
340
2
7 3
9 0
12
341
2
7 0
9 0
12
342
2
7 1
9 0
12
343
2
7 2
9 0
12
344
2
7 3
9 0
12
16
2
8 0
9 0
13
345
2
7 0
9 0
13
346
2
7 1
9 0
13
347
2
7 2
9 0
13
348
2
7 3
9 0
13
17
2
8 0
9 0
14
350
2
7 1
9 0
14
351
2
7 2
9 0
14
352
2
7 3
9 0
14
349
2
7 0
9 0
14
18
2
8 0
9 0
15
19
2
8 0
9 0
15
355
2
7 2
9 0
15
356
2
7 3
9 0
15
354
2
7 1
9 0
15
353
2
7 0
9 0
16
20
2
8 0
9 0
16
357
2
7 0
9 0
16
358
2
7 1
9 0
16
359
2
7 2
9 0
16
360
2
7 3
9 0
80
0
364
2
7 3
9 0
0
363
2
7 2
9 0
0
362
2
7 1
9 0
0
361
2
7 0
9 0
0
21
2
8 0
9 0
2
23
2
8 0
9 0
2
372
2
7 3
9 0
2
371
2
7 2
9 0
2
370
2
7 1
9 0
2
369
2
7 0
9 0
3
376
2
7 3
9 0
3
375
2
7 2
9 0
3
374
2
7 1
9 0
3
373
2
7 0
9 0
3
24
2
8 0
9 0
4
380
2
7 3
9 0
4
379
2
7 2
9 0
4
378
2
7 1
9 0
4
377
2
7 0
9 0
4
25
2
8 0
9 0
5
382
2
7 1
9 0
5
381
2
7 0
9 0
5
26
2
8 0
9 0
5
383
2
7 2
9 0
5
384
2
7 3
9 0
6
27
2
8 0
9 0
6
385
2
7 0
9 0
6
386
2
7 1
9 0
6
387
2
7 2
9 0
6
388
2
7 3
9 0
7
389
2
7 0
9 0
7
392
2
7 3
9 0
7
391
2
7 2
9 0
7
390
2
7 1
9 0
7
28
2
8 0
9 0
8
396
2
7 3
9 0
8
395
2
7 2
9 0
8
29
2
8 0
9 0
8
393
2
7 0
9 0
8
394
2
7 1
9 0
9
400
2
7 3
9 0
9
399
2
7 2
9 0
9
398
2
7 1
9 0
9
397
2
7 0
9 0
9
30
2
8 0
9 0
10
401
2
7 0
9 0
10
31
2
8 0
9 0
10
402
2
7 1
9 0
10
403
2
7 2
9 0
10
404
2
7 3
9 0
11
405
2
7 0
9 0
11
406
2
7 1
9 0
11
407
2
7 2
9 0
11
32
2
8 0
9 0
11
408
2
7 3
9 0
12
409
2
7 0
9 0
12
410
2
7 1
9 0
12
411
2
7 2
9 0
12
412
2
7 3
9 0
12
33
2
8 0
9 0
13
413
2
7 0
9 0
13
414
2
7 1
9 0
13
415
2
7 2
9 0
13
416
2
7 3
9 0
13
34
2
8 0
9 0
14
418
2
7 1
9 0
14
419
2
7 2
9 0
14
420
2
7 3
9 0
14
417
2
7 0
9 0
14
35
2
8 0
9 0
15
36
2
8 0
9 0
15
423
2
7 2
9 0
15
424
2
7 3
9 0
15
422
2
7 1
9 0
15
421
2
7 0
9 0
16
37
2
8 0
9 0
16
425
2
7 0
9 0
16
426
2
7 1
9 0
16
427
2
7 2
9 0
16
428
2
7 3
9 0
80
0
432
2
7 3
9 0
0
431
2
7 2
9 0
0
430
2
7 1
9 0
0
429
2
7 0
9 0
0
38
2
8 0
9 0
1
39
2
8 0
9 0
1
436
2
7 3
9 0
1
435
2
7 2
9 0
1
434
2
7 1
9 0
1
433
2
7 0
9 0
3
444
2
7 3
9 0
3
443
2
7 2
9 0
3
442
2
7 1
9 0
3
441
2
7 0
9 0
3
41
2
8 0
9 0
4
448
2
7 3
9 0
4
447
2
7 2
9 0
4
446
2
7 1
9 0
4
445
2
7 0
9 0
4
42
2
8 0
9 0
5
450
2
7 1
9 0
5
449
2
7 0
9 0
5
43
2
8 0
9 0
5
451
2
7 2
9 0
5
452
2
7 3
9 0
6
44
2
8 0
9 0
6
453
2
7 0
9 0
6
454
2
7 1
9 0
6
455
2
7 2
9 0
6
456
2
7 3
9 0
7
457
2
7 0
9 0
7
460
2
7 3
9 0
7
459
2
7 2
9 0
7
458
2
7 1
9 0
7
45
2
8 0
9 0
8
464
2
7 3
9 0
8
463
2
7 2
9 0
8
46
2
8 0
9 0
8
461
2
7 0
9 0
8
462
2
7 1
9 0
9
468
2
7 3
9 0
9
467
2
7 2
9 0
9
466
2
7 1
9 0
9
465
2
7 0
9 0
9
47
2
8 0
9 0
10
469
2
7 0
9 0
10
48
2
8 0
9 0
10
470
2
7 1
9 0
10
471
2
7 2
9 0
10
472
2
7 3
9 0
11
473
2
7 0
9 0
11
474
2
7 1
9 0
11
475
2
7 2
9 0
11
49
2
8 0
9 0
11
476
2
7 3
9 0
12
477
2
7 0
9 0
12
478
2
7 1
9 0
12
479
2
7 2
9 0
12
480
2
7 3
9 0
12
50
2
8 0
9 0
13
481
2
7 0
9 0
13
482
2
7 1
9 0
13
483
2
7 2
9 0
13
484
2
7 3
9 0
13
51
2
8 0
9 0
14
486
2
7 1
9 0
14
487
2
7 2
9 0
14
488
2
7 3
9 0
14
485
2
7 0
9 0
14
52
2
8 0
9 0
15
53
2
8 0
9 0
15
491
2
7 2
9 0
15
492
2
7 3
9 0
15
490
2
7 1
9 0
15
489
2
7 0
9 0
16
54
2
8 0
9 0
16
493
2
7 0
9 0
16
494
2
7 1
9 0
16
495
2
7 2
9 0
16
496
2
7 3
9 0
80
0
500
2
7 3
9 0
0
499
2
7 2
9 0
0
498
2
7 1
9 0
0
497
2
7 0
9 0
0
55
2
8 0
9 0
1
56
2
8 0
9 0
1
504
2
7 3
9 0
1
503
2
7 2
9 0
1
502
2
7 1
9 0
1
501
2
7 0
9 0
2
508
2
7 3
9 0
2
507
2
7 2
9 0
2
506
2
7 1
9 0
2
505
2
7 0
9 0
2
57
2
8 0
9 0
4
516
2
7 3
9 0
4
515
2
7 2
9 0
4
514
2
7 1
9 0
4
513
2
7 0
9 0
4
59
2
8 0
9 0
5
518
2
7 1
9 0
5
517
2
7 0
9 0
5
60
2
8 0
9 0
5
519
2
7 2
9 0
5
520
2
7 3
9 0
6
61
2
8 0
9 0
6
521
2
7 0
9 0
6
522
2
7 1
9 0
6
523
2
7 2
9 0
6
524
2
7 3
9 0
7
525
2
7 0
9 0
7
528
2
7 3
9 0
7
527
2
7 2
9 0
7
526
2
7 1
9 0
7
62
2
8 0
9 0
8
532
2
7 3
9 0
8
531
2
7 2
9 0
8
63
2
8 0
9 0
8
529
2
7 0
9 0
8
530
2
7 1
9 0
9
536
2
7 3
9 0
9
535
2
7 2
9 0
9
534
2
7 1
9 0
9
533
2
7 0
9 0
9
64
2
8 0
9 0
10
537
2
7 0
9 0
10
65
2
8 0
9 0
10
538
2
7 1
9 0
10
539
2
7 2
9 0
10
540
2
7 3
9 0
11
541
2
7 0
9 0
11
542
2
7 1
9 0
11
543
2
7 2
9 0
11
66
2
8 0
9 0
11
544
2
7 3
9 0
12
545
2
7 0
9 0
12
546
2
7 1
9 0
12
547
2
7 2
9 0
12
548
2
7 3
9 0
12
67
2
8 0
9 0
13
549
2
7 0
9 0
13
550
2
7 1
9 0
13
551
2
7 2
9 0
13
552
2
7 3
9 0
13
68
2
8 0
9 0
14
554
2
7 1
9 0
14
555
2
7 2
9 0
14
556
2
7 3
9 0
14
553
2
7 0
9 0
14
69
2
8 0
9 0
15
70
2
8 0
9 0
15
559
2
7 2
9 0
15
560
2
7 3
9 0
15
558
2
7 1
9 0
15
557
2
7 0
9 0
16
71
2
8 0
9 0
16
561
2
7 0
9 0
16
562
2
7 1
9 0
16
563
2
7 2
9 0
16
564
2
7 3
9 0
80
0
568
2
7 3
9 0
0
567
2
7 2
9 0
0
566
2
7 1
9 0
0
565
2
7 0
9 0
0
72
2
8 0
9 0
1
73
2
8 0
9 0
1
572
2
7 3
9 0
1
571
2
7 2
9 0
1
570
2
7 1
9 0
1
569
2
7 0
9 0
2
576
2
7 3
9 0
2
575
2
7 2
9 0
2
574
2
7 1
9 0
2
573
2
7 0
9 0
2
74
2
8 0
9 0
3
580
2
7 3
9 0
3
579
2
7 2
9 0
3
578
2
7 1
9 0
3
577
2
7 0
9 0
3
75
2
8 0
9 0
5
586
2
7 1
9 0
5
585
2
7 0
9 0
5
77
2
8 0
9 0
5
587
2
7 2
9 0
5
588
2
7 3
9 0
6
78
2
8 0
9 0
6
589
2
7 0
9 0
6
590
2
7 1
9 0
6
591
2
7 2
9 0
6
592
2
7 3
9 0
7
593
2
7 0
9 0
7
596
2
7 3
9 0
7
595
2
7 2
9 0
7
594
2
7 1
9 0
7
79
2
8 0
9 0
8
600
2
7 3
9 0
8
599
2
7 2
9 0
8
80
2
8 0
9 0
8
597
2
7 0
9 0
8
598
2
7 1
9 0
9
604
2
7 3
9 0
9
603
2
7 2
9 0
9
602
2
7 1
9 0
9
601
2
7 0
9 0
9
81
2
8 0
9 0
10
605
2
7 0
9 0
10
82
2
8 0
9 0
10
606
2
7 1
9 0
10
607
2
7 2
9 0
10
608
2
7 3
9 0
11
609
2
7 0
9 0
11
610
2
7 1
9 0
11
611
2
7 2
9 0
11
83
2
8 0
9 0
11
612
2
7 3
9 0
12
613
2
7 0
9 0
12
614
2
7 1
9 0
12
615
2
7 2
9 0
12
616
2
7 3
9 0
12
84
2
8 0
9 0
13
617
2
7 0
9 0
13
618
2
7 1
9 0
13
619
2
7 2
9 0
13
620
2
7 3
9 0
13
85
2
8 0
9 0
14
622
2
7 1
9 0
14
623
2
7 2
9 0
14
624
2
7 3
9 0
14
621
2
7 0
9 0
14
86
2
8 0
9 0
15
87
2
8 0
9 0
15
627
2
7 2
9 0
15
628
2
7 3
9 0
15
626
2
7 1
9 0
15
625
2
7 0
9 0
16
88
2
8 0
9 0
16
629
2
7 0
9 0
16
630
2
7 1
9 0
16
631
2
7 2
9 0
16
632
2
7 3
9 0
80
0
636
2
7 3
9 0
0
635
2
7 2
9 0
0
634
2
7 1
9 0
0
633
2
7 0
9 0
0
89
2
8 0
9 0
1
90
2
8 0
9 0
1
640
2
7 3
9 0
1
639
2
7 2
9 0
1
638
2
7 1
9 0
1
637
2
7 0
9 0
2
644
2
7 3
9 0
2
643
2
7 2
9 0
2
642
2
7 1
9 0
2
641
2
7 0
9 0
2
91
2
8 0
9 0
3
648
2
7 3
9 0
3
647
2
7 2
9 0
3
646
2
7 1
9 0
3
645
2
7 0
9 0
3
92
2
8 0
9 0
4
650
2
7 1
9 0
4
649
2
7 0
9 0
4
93
2
8 0
9 0
4
651
2
7 2
9 0
4
652
2
7 3
9 0
6
95
2
8 0
9 0
6
657
2
7 0
9 0
6
658
2
7 1
9 0
6
659
2
7 2
9 0
6
660
2
7 3
9 0
7
661
2
7 0
9 0
7
664
2
7 3
9 0
7
663
2
7 2
9 0
7
662
2
7 1
9 0
7
96
2
8 0
9 0
8
668
2
7 3
9 0
8
667
2
7 2
9 0
8
97
2
8 0
9 0
8
665
2
7 0
9 0
8
666
2
7 1
9 0
9
672
2
7 3
9 0
9
671
2
7 2
9 0
9
670
2
7 1
9 0
9
669
2
7 0
9 0
9
98
2
8 0
9 0
10
673
2
7 0
9 0
10
99
2
8 0
9 0
10
674
2
7 1
9 0
10
675
2
7 2
9 0
10
676
2
7 3
9 0
11
677
2
7 0
9 0
11
678
2
7 1
9 0
11
679
2
7 2
9 0
11
100
2
8 0
9 0
11
680
2
7 3
9 0
12
681
2
7 0
9 0
12
682
2
7 1
9 0
12
683
2
7 2
9 0
12
684
2
7 3
9 0
12
101
2
8 0
9 0
13
685
2
7 0
9 0
13
686
2
7 1
9 0
13
687
2
7 2
9 0
13
688
2
7 3
9 0
13
102
2
8 0
9 0
14
690
2
7 1
9 0
14
691
2
7 2
9 0
14
692
2
7 3
9 0
14
689
2
7 0
9 0
14
103
2
8 0
9 0
15
104
2
8 0
9 0
15
695
2
7 2
9 0
15
696
2
7 3
9 0
15
694
2
7 1
9 0
15
693
2
7 0
9 0
16
105
2
8 0
9 0
16
697
2
7 0
9 0
16
698
2
7 1
9 0
16
699
2
7 2
9 0
16
700
2
7 3
9 0
80
0
704
2
7 3
9 0
0
703
2
7 2
9 0
0
702
2
7 1
9 0
0
701
2
7 0
9 0
0
106
2
8 0
9 0
1
107
2
8 0
9 0
1
708
2
7 3
9 0
1
707
2
7 2
9 0
1
706
2
7 1
9 0
1
705
2
7 0
9 0
2
712
2
7 3
9 0
2
711
2
7 2
9 0
2
710
2
7 1
9 0
2
709
2
7 0
9 0
2
108
2
8 0
9 0
3
716
2
7 3
9 0
3
715
2
7 2
9 0
3
714
2
7 1
9 0
3
713
2
7 0
9 0
3
109
2
8 0
9 0
4
718
2
7 1
9 0
4
717
2
7 0
9 0
4
110
2
8 0
9 0
4
719
2
7 2
9 0
4
720
2
7 3
9 0
5
111
2
8 0
9 0
5
721
2
7 0
9 0
5
722
2
7 1
9 0
5
723
2
7 2
9 0
5
724
2
7 3
9 0
7
729
2
7 0
9 0
7
732
2
7 3
9 0
7
731
2
7 2
9 0
7
730
2
7 1
9 0
7
113
2
8 0
9 0
8
736
2
7 3
9 0
8
735
2
7 2
9 0
8
114
2
8 0
9 0
8
733
2
7 0
9 0
8
734
2
7 1
9 0
9
740
2
7 3
9 0
9
739
2
7 2
9 0
9
738
2
7 1
9 0
9
737
2
7 0
9 0
9
115
2
8 0
9 0
10
741
2
7 0
9 0
10
116
2
8 0
9 0
10
742
2
7 1
9 0
10
743
2
7 2
9 0
10
744
2
7 3
9 0
11
745
2
7 0
9 0
11
746
2
7 1
9 0
11
747
2
7 2
9 0
11
117
2
8 0
9 0
11
748
2
7 3
9 0
12
749
2
7 0
9 0
12
750
2
7 1
9 0
12
751
2
7 2
9 0
12
752
2
7 3
9 0
12
118
2
8 0
9 0
13
753
2
7 0
9 0
13
754
2
7 1
9 0
13
755
2
7 2
9 0
13
756
2
7 3
9 0
13
119
2
8 0
9 0
14
758
2
7 1
9 0
14
759
2
7 2
9 0
14
760
2
7 3
9 0
14
757
2
7 0
9 0
14
120
2
8 0
9 0
15
121
2
8 0
9 0
15
763
2
7 2
9 0
15
764
2
7 3
9 0
15
762
2
7 1
9 0
15
761
2
7 0
9 0
16
122
2
8 0
9 0
16
765
2
7 0
9 0
16
766
2
7 1
9 0
16
767
2
7 2
9 0
16
768
2
7 3
9 0
80
0
772
2
7 3
9 0
0
771
2
7 2
9 0
0
770
2
7 1
9 0
0
769
2
7 0
9 0
0
123
2
8 0
9 0
1
124
2
8 0
9 0
1
776
2
7 3
9 0
1
775
2
7 2
9 0
1
774
2
7 1
9 0
1
773
2
7 0
9 0
2
780
2
7 3
9 0
2
779
2
7 2
9 0
2
778
2
7 1
9 0
2
777
2
7 0
9 0
2
125
2
8 0
9 0
3
784
2
7 3
9 0
3
783
2
7 2
9 0
3
782
2
7 1
9 0
3
781
2
7 0
9 0
3
126
2
8 0
9 0
4
786
2
7 1
9 0
4
785
2
7 0
9 0
4
127
2
8 0
9 0
4
787
2
7 2
9 0
4
788
2
7 3
9 0
5
128
2
8 0
9 0
5
789
2
7 0
9 0
5
790
2
7 1
9 0
5
791
2
7 2
9 0
5
792
2
7 3
9 0
6
793
2
7 0
9 0
6
796
2
7 3
9 0
6
795
2
7 2
9 0
6
794
2
7 1
9 0
6
129
2
8 0
9 0
8
804
2
7 3
9 0
8
803
2
7 2
9 0
8
131
2
8 0
9 0
8
801
2
7 0
9 0
8
802
2
7 1
9 0
9
808
2
7 3
9 0
9
807
2
7 2
9 0
9
806
2
7 1
9 0
9
805
2
7 0
9 0
9
132
2
8 0
9 0
10
809
2
7 0
9 0
10
133
2
8 0
9 0
10
810
2
7 1
9 0
10
811
2
7 2
9 0
10
812
2
7 3
9 0
11
813
2
7 0
9 0
11
814
2
7 1
9 0
11
815
2
7 2
9 0
11
134
2
8 0
9 0
11
816
2
7 3
9 0
12
817
2
7 0
9 0
12
818
2
7 1
9 0
12
819
2
7 2
9 0
12
820
2
7 3
9 0
12
135
2
8 0
9 0
13
821
2
7 0
9 0
13
822
2
7 1
9 0
13
823
2
7 2
9 0
13
824
2
7 3
9 0
13
136
2
8 0
9 0
14
826
2
7 1
9 0
14
827
2
7 2
9 0
14
828
2
7 3
9 0
14
825
2
7 0
9 0
14
137
2
8 0
9 0
15
138
2
8 0
9 0
15
831
2
7 2
9 0
15
832
2
7 3
9 0
15
830
2
7 1
9 0
15
829
2
7 0
9 0
16
139
2
8 0
9 0
16
833
2
7 0
9 0
16
834
2
7 1
9 0
16
835
2
7 2
9 0
16
836
2
7 3
9 0
80
0
840
2
7 3
9 0
0
839
2
7 2
9 0
0
838
2
7 1
9 0
0
837
2
7 0
9 0
0
140
2
8 0
9 0
1
141
2
8 0
9 0
1
844
2
7 3
9 0
1
843
2
7 2
9 0
1
842
2
7 1
9 0
1
841
2
7 0
9 0
2
848
2
7 3
9 0
2
847
2
7 2
9 0
2
846
2
7 1
9 0
2
845
2
7 0
9 0
2
142
2
8 0
9 0
3
852
2
7 3
9 0
3
851
2
7 2
9 0
3
850
2
7 1
9 0
3
849
2
7 0
9 0
3
143
2
8 0
9 0
4
854
2
7 1
9 0
4
853
2
7 0
9 0
4
144
2
8 0
9 0
4
855
2
7 2
9 0
4
856
2
7 3
9 0
5
145
2
8 0
9 0
5
857
2
7 0
9 0
5
858
2
7 1
9 0
5
859
2
7 2
9 0
5
860
2
7 3
9 0
6
861
2
7 0
9 0
6
864
2
7 3
9 0
6
863
2
7 2
9 0
6
862
2
7 1
9 0
6
146
2
8 0
9 0
7
868
2
7 3
9 0
7
867
2
7 2
9 0
7
147
2
8 0
9 0
7
865
2
7 0
9 0
7
866
2
7 1
9 0
9
876
2
7 3
9 0
9
875
2
7 2
9 0
9
874
2
7 1
9 0
9
873
2
7 0
9 0
9
149
2
8 0
9 0
10
877
2
7 0
9 0
10
150
2
8 0
9 0
10
878
2
7 1
9 0
10
879
2
7 2
9 0
10
880
2
7 3
9 0
11
881
2
7 0
9 0
11
882
2
7 1
9 0
11
883
2
7 2
9 0
11
151
2
8 0
9 0
11
884
2
7 3
9 0
12
885
2
7 0
9 0
12
886
2
7 1
9 0
12
887
2
7 2
9 0
12
888
2
7 3
9 0
12
152
2
8 0
9 0
13
889
2
7 0
9 0
13
890
2
7 1
9 0
13
891
2
7 2
9 0
13
892
2
7 3
9 0
13
153
2
8 0
9 0
14
894
2
7 1
9 0
14
895
2
7 2
9 0
14
896
2
7 3
9 0
14
893
2
7 0
9 0
14
154
2
8 0
9 0
15
155
2
8 0
9 0
15
899
2
7 2
9 0
15
900
2
7 3
9 0
15
898
2
7 1
9 0
15
897
2
7 0
9 0
16
156
2
8 0
9 0
16
901
2
7 0
9 0
16
902
2
7 1
9 0
16
903
2
7 2
9 0
16
904
2
7 3
9 0
80
0
908
2
7 3
9 0
0
907
2
7 2
9 0
0
906
2
7 1
9 0
0
905
2
7 0
9 0
0
157
2
8 0
9 0
1
158
2
8 0
9 0
1
912
2
7 3
9 0
1
911
2
7 2
9 0
1
910
2
7 1
9 0
1
909
2
7 0
9 0
2
916
2
7 3
9 0
2
915
2
7 2
9 0
2
914
2
7 1
9 0
2
913
2
7 0
9 0
2
159
2
8 0
9 0
3
920
2
7 3
9 0
3
919
2
7 2
9 0
3
918
2
7 1
9 0
3
917
2
7 0
9 0
3
160
2
8 0
9 0
4
922
2
7 1
9 0
4
921
2
7 0
9 0
4
161
2
8 0
9 0
4
923
2
7 2
9 0
4
924
2
7 3
9 0
5
162
2
8 0
9 0
5
925
2
7 0
9 0
5
926
2
7 1
9 0
5
927
2
7 2
9 0
5
928
2
7 3
9 0
6
929
2
7 0
9 0
6
932
2
7 3
9 0
6
931
2
7 2
9 0
6
930
2
7 1
9 0
6
163
2
8 0
9 0
7
936
2
7 3
9 0
7
935
2
7 2
9 0
7
164
2
8 0
9 0
7
933
2
7 0
9 0
7
934
2
7 1
9 0
8
940
2
7 3
9 0
8
939
2
7 2
9 0
8
938
2
7 1
9 0
8
937
2
7 0
9 0
8
165
2
8 0
9 0
10
945
2
7 0
9 0
10
167
2
8 0
9 0
10
946
2
7 1
9 0
10
947
2
7 2
9 0
10
948
2
7 3
9 0
11
949
2
7 0
9 0
11
950
2
7 1
9 0
11
951
2
7 2
9 0
11
168
2
8 0
9 0
11
952
2
7 3
9 0
12
953
2
7 0
9 0
12
954
2
7 1
9 0
12
955
2
7 2
9 0
12
956
2
7 3
9 0
12
169
2
8 0
9 0
13
957
2
7 0
9 0
13
958
2
7 1
9 0
13
959
2
7 2
9 0
13
960
2
7 3
9 0
13
170
2
8 0
9 0
14
962
2
7 1
9 0
14
963
2
7 2
9 0
14
964
2
7 3
9 0
14
961
2
7 0
9 0
14
171
2
8 0
9 0
15
172
2
8 0
9 0
15
967
2
7 2
9 0
15
968
2
7 3
9 0
15
966
2
7 1
9 0
15
965
2
7 0
9 0
16
173
2
8 0
9 0
16
969
2
7 0
9 0
16
970
2
7 1
9 0
16
971
2
7 2
9 0
16
972
2
7 3
9 0
80
0
976
2
