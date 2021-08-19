;16:02:20 19/08

;Skeleton_SN = 0

(define (problem put-wuti_propo_reorder)
   (:domain pick-and-place_propo_reorder)

   (:objects
          q112 - config
          o10 o6 o7 o8 o9 - wuti
          p720 - pose
          _p0 _p1 _p2 _p3 _p4 _p5 _p6 - propo_action
          _s0 _s12 _s13 _s29 _s3 _s38 _s8 _s80 - propo_stream
   )

   (:init
          (allowlocate)
          (atconf q112)
          (atpose o10 p720)
          (canmove)
          (canpick)
          (fixed o6)
          (fixed o7)
          (fixed o8)
          (fixed o9)
          (graspable o10)
          (handempty)
          (isconf q112)
          (ispose o10 p720)
          (issensor o9)
          (stackable o10 o6)
          (stackable o10 o7)
          (stackable o10 o8)
          (_applicable _p0)
   )

   (:goal
        (_applicable _p6)
   )

)
