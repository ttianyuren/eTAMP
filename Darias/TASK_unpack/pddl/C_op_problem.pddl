;10:10:11 15/09

;Skeleton_SN = 1

(define (problem put-wuti_propo_reorder)
   (:domain pick-and-place_propo_reorder)

   (:objects
          q80 - config
          o6 o7 o8 o9 - wuti
          p864 p912 - pose
          _p0 _p1 _p2 _p3 _p4 _p5 _p6 _p7 - propo_action
          _s1 _s11 _s12 _s149 _s168 _s17 _s18 _s20 _s37 _s4 _s5 _s66 - propo_stream
   )

   (:init
          (allowlocate)
          (atconf q80)
          (atpose o8 p912)
          (atpose o9 p864)
          (canmove)
          (canpick)
          (fixed o6)
          (fixed o7)
          (graspable o8)
          (graspable o9)
          (handempty)
          (isconf q80)
          (ispose o8 p912)
          (ispose o9 p864)
          (stackable o8 o6)
          (stackable o8 o7)
          (stackable o9 o6)
          (stackable o9 o7)
          (_applicable _p0)
   )

   (:goal
        (_applicable _p7)
   )

)
