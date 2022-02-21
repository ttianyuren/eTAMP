;10:00:46 21/02

;Skeleton_SN = 4

(define (problem put-wuti_propo)
   (:domain pick-and-place_propo)

   (:objects
          q344 - config
          o6 o7 o8 o9 - wuti
          p208 p40 - pose
          _p0 _p1 _p2 _p3 _p4 _p5 _p6 _p7 _p8 _p9 - propo_action
   )

   (:init
          (allowlocate)
          (atconf q344)
          (atpose o8 p40)
          (atpose o9 p208)
          (canmove)
          (canpick)
          (fixed o6)
          (fixed o7)
          (graspable o8)
          (graspable o9)
          (handempty)
          (isconf q344)
          (ispose o8 p40)
          (ispose o9 p208)
          (stackable o8 o6)
          (stackable o8 o7)
          (stackable o9 o6)
          (stackable o9 o7)
          (_applicable _p0)
   )

   (:goal
        (_applicable _p9)
   )

)
