;19:09:28 23/07

;Skeleton_SN = 3

(define (problem put-wuti_propo_reorder)
   (:domain pick-and-place_propo_reorder)

   (:objects
          q288 - config
          o10 o6 o7 o8 o9 - wuti
          p256 - pose
          _p0 _p1 _p10 _p11 _p2 _p3 _p4 _p5 _p6 _p7 _p8 _p9 - propo_action
          _s0 _s11 _s12 _s1447 _s15 _s2 _s211 _s22 _s28 _s29 _s297 _s3 _s7 _s8 _s88 - propo_stream
   )

   (:init
          (allowlocate)
          (atconf q288)
          (atpose o10 p256)
          (canmove)
          (canpick)
          (fixed o6)
          (fixed o7)
          (fixed o8)
          (fixed o9)
          (graspable o10)
          (handempty)
          (isconf q288)
          (ispose o10 p256)
          (issensor o9)
          (stackable o10 o6)
          (stackable o10 o7)
          (stackable o10 o8)
          (_applicable _p0)
   )

   (:goal
        (_applicable _p11)
   )

)
