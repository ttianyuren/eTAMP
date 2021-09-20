;18:47:22 07/09

;Skeleton_SN = 46

(define (problem put-wuti_propo)
   (:domain pick-and-place_propo)

   (:objects
          q608 - config
          o10 o6 o7 o8 o9 - wuti
          p424 p608 p632 - pose
          _p0 _p1 _p10 _p11 _p12 _p13 _p2 _p3 _p4 _p5 _p6 _p7 _p8 _p9 - propo_action
   )

   (:init
          (allowlocate)
          (atconf q608)
          (atpose o10 p608)
          (atpose o8 p632)
          (atpose o9 p424)
          (canmove)
          (canpick)
          (fixed o6)
          (fixed o7)
          (graspable o10)
          (graspable o8)
          (graspable o9)
          (handempty)
          (isconf q608)
          (ispose o10 p608)
          (ispose o8 p632)
          (ispose o9 p424)
          (issupport o10 p608 o6)
          (stackable o10 o6)
          (stackable o10 o7)
          (stackable o8 o6)
          (stackable o8 o7)
          (stackable o9 o6)
          (stackable o9 o7)
          (_applicable _p0)
   )

   (:goal
        (_applicable _p13)
   )

)
