;09:54:52 10/09

;Skeleton_SN = 0

(define (problem put-wuti_propo)
   (:domain pr2-tamp_propo)

   (:objects
          q104 - config
          o2 o3 o4 o5 o6 o7 o8 - wuti
          'left' 'right' - arm
          p176 p232 p64 p8 - pose
          _p0 _p1 _p10 _p11 _p12 _p13 _p14 _p15 _p16 _p17 _p18 _p19 _p2 _p20 _p21 _p22 _p23 _p24 _p25 _p26 _p27 _p28 _p29 _p3 _p30 _p31 _p32 _p33 _p34 _p35 _p36 _p37 _p4 _p5 _p6 _p7 _p8 _p9 - propo_action
   )

   (:init
          (atbconf q104)
          (atpose o5 p8)
          (atpose o6 p176)
          (atpose o7 p64)
          (atpose o8 p232)
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
          (isbconf q104)
          (ispose o5 p8)
          (ispose o6 p176)
          (ispose o7 p64)
          (ispose o8 p232)
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
          (supported o5 p8 o2)
          (supported o6 p176 o2)
          (supported o7 p64 o2)
          (supported o8 p232 o2)
          (_applicable _p0)
   )

   (:goal
        (_applicable _p37)
   )

)
