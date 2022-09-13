;14:12:23 13/09

;Skeleton_SN = 0

(define (problem put-wuti_propo_reorder)
   (:domain pick-and-place_propo_reorder)

   (:objects
          q808 - config
          o6 o7 o8 o9 - wuti
          p288 p712 - pose
          _p0 _p1 _p2 _p3 _p4 _p5 - propo_action
          _s1 _s11 _s149 _s17 _s20 _s37 _s4 _s64 - propo_stream
   )

   (:init
          (allowlocate)
          (atconf q808)
          (atpose o8 p288)
          (atpose o9 p712)
          (canmove)
          (canpick)
          (fixed o6)
          (fixed o7)
          (graspable o8)
          (graspable o9)
          (handempty)
          (isconf q808)
          (ispose o8 p288)
          (ispose o9 p712)
          (stackable o8 o6)
          (stackable o8 o7)
          (stackable o9 o6)
          (stackable o9 o7)
          (_applicable _p0)
   )

   (:goal
        (_applicable _p5)
   )

)
