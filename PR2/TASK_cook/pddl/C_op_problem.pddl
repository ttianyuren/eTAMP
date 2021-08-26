;15:15:18 26/08

;Skeleton_SN = 1

(define (problem put-wuti_propo_reorder)
   (:domain pr2-tamp_propo_reorder)

   (:objects
          q8 - config
          o10 o2 o3 o4 o5 o6 o7 o8 o9 - wuti
          'left' 'right' - arm
          p224 p480 p536 p592 p624 p800 - pose
          _p0 _p1 _p10 _p11 _p12 _p13 _p14 _p15 _p16 _p17 _p18 _p19 _p2 _p20 _p21 _p22 _p23 _p24 _p25 _p26 _p27 _p28 _p29 _p3 _p30 _p31 _p32 _p33 _p34 _p35 _p36 _p37 _p4 _p5 _p6 _p7 _p8 _p9 - propo_action
          _s1 _s10 _s109 _s11 _s137 _s165 _s18 _s19 _s2 _s20 _s21 _s25 _s257 _s26 _s27 _s276 _s28 _s32 _s33 _s335 _s348 _s35 _s36 _s38 _s39 _s4 _s41 _s413 _s42 _s425 _s491 _s499 _s5 _s52 _s7 _s8 _s81 - propo_stream
   )

   (:init
          (atbconf q8)
          (atpose o10 p592)
          (atpose o5 p800)
          (atpose o6 p224)
          (atpose o7 p624)
          (atpose o8 p480)
          (atpose o9 p536)
          (canmove)
          (canoperate)
          (controllable 'left')
          (graspable o10)
          (graspable o5)
          (graspable o6)
          (graspable o7)
          (graspable o8)
          (graspable o9)
          (handempty 'left')
          (handempty 'right')
          (isarm 'left')
          (isarm 'right')
          (isbconf q8)
          (ispose o10 p592)
          (ispose o5 p800)
          (ispose o6 p224)
          (ispose o7 p624)
          (ispose o8 p480)
          (ispose o9 p536)
          (sink o3)
          (stackable o10 o2)
          (stackable o10 o3)
          (stackable o10 o4)
          (stackable o5 o2)
          (stackable o5 o3)
          (stackable o5 o4)
          (stackable o6 o2)
          (stackable o6 o3)
          (stackable o6 o4)
          (stackable o7 o2)
          (stackable o7 o3)
          (stackable o7 o4)
          (stackable o8 o2)
          (stackable o8 o3)
          (stackable o8 o4)
          (stackable o9 o2)
          (stackable o9 o3)
          (stackable o9 o4)
          (stove o4)
          (supported o10 p592 o2)
          (supported o5 p800 o2)
          (supported o6 p224 o2)
          (supported o7 p624 o2)
          (supported o8 p480 o2)
          (supported o9 p536 o2)
          (_applicable _p0)
   )

   (:goal
        (_applicable _p37)
   )

)
