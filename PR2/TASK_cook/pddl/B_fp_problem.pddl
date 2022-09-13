;15:10:38 13/09

;Skeleton_SN = 0

(define (problem put-wuti_propo)
   (:domain pr2-tamp_propo)

   (:objects
          q976 - config
          o2 o3 o4 o5 o6 o7 o8 - wuti
          'left' 'right' - arm
          p408 p504 p744 p840 - pose
          _p0 _p1 _p10 _p11 _p12 _p13 _p14 _p15 _p16 _p17 _p18 _p19 _p2 _p20 _p21 _p22 _p23 _p24 _p25 _p26 _p27 _p28 _p29 _p3 _p30 _p31 _p32 _p33 _p34 _p35 _p36 _p37 _p4 _p5 _p6 _p7 _p8 _p9 - propo_action
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
