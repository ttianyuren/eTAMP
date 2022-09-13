;15:10:41 13/09

;Skeleton_SN = 0

(define (problem put-wuti_propo_reorder)
   (:domain pr2-tamp_propo_reorder)

   (:objects
          q976 - config
          o2 o3 o4 o5 o6 o7 o8 - wuti
          'left' 'right' - arm
          p408 p504 p744 p840 - pose
          _p0 _p1 _p10 _p11 _p12 _p13 _p14 _p15 _p16 _p17 _p18 _p19 _p2 _p20 _p21 _p22 _p23 _p24 _p25 _p26 _p27 _p28 _p29 _p3 _p30 _p31 _p32 _p33 _p34 _p35 _p36 _p37 _p4 _p5 _p6 _p7 _p8 _p9 - propo_action
          _s1 _s10 _s11 _s115 _s12 _s13 _s14 _s141 _s15 _s151 _s17 _s18 _s19 _s195 _s2 _s20 _s206 _s22 _s23 _s249 _s25 _s254 _s26 _s28 _s29 _s303 _s307 _s31 _s32 _s34 _s4 _s5 _s55 _s7 _s75 _s8 _s95 - propo_stream
   )

   (:init
          (atbconf q976)
          (atpose o5 p408)
          (atpose o6 p504)
          (atpose o7 p744)
          (atpose o8 p840)
          (canmove)
          (canoperate)
          (controllable 'left')
          (graspable o5)
          (graspable o6)
          (graspable o7)
          (graspable o8)
          (handempty 'left')
          (handempty 'right')
          (isarm 'left')
          (isarm 'right')
          (isbconf q976)
          (ispose o5 p408)
          (ispose o6 p504)
          (ispose o7 p744)
          (ispose o8 p840)
          (sink o3)
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
          (stove o4)
          (supported o5 p408 o2)
          (supported o6 p504 o2)
          (supported o7 p744 o2)
          (supported o8 p840 o2)
          (_applicable _p0)
   )

   (:goal
        (_applicable _p37)
   )

)
