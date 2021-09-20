;21:17:55 07/09

;Skeleton_SN = 34

(define (problem put-wuti_propo)
   (:domain pick-and-place_propo)

   (:objects
          q896 - config
          o10 o6 o7 o8 o9 - wuti
          p328 - pose
          _p0 _p1 _p10 _p11 _p12 _p13 _p14 _p15 _p16 _p17 _p18 _p19 _p2 _p20 _p21 _p22 _p23 _p24 _p25 _p26 _p3 _p4 _p5 _p6 _p7 _p8 _p9 - propo_action
   )

   (:init
          (allowlocate)
          (atconf q896)
          (atpose o10 p328)
          (canmove)
          (canpick)
          (fixed o6)
          (fixed o7)
          (fixed o8)
          (fixed o9)
          (graspable o10)
          (handempty)
          (isconf q896)
          (ispose o10 p328)
          (issensor o9)
          (stackable o10 o6)
          (stackable o10 o7)
          (stackable o10 o8)
          (_applicable _p0)
   )

   (:goal
        (_applicable _p26)
   )

)
