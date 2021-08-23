;17:16:12 23/08

;Skeleton_SN = 5

(define (problem put-wuti_propo_reorder)
   (:domain pick-and-place_propo_reorder)

   (:objects
          q40 - config
          o10 o6 o7 o8 o9 - wuti
          p248 p736 p848 - pose
          _p0 _p1 _p2 _p3 _p4 _p5 _p6 _p7 _p8 _p9 - propo_action
          _s1 _s106 _s124 _s16 _s17 _s25 _s26 _s286 _s29 _s3 _s31 _s395 _s55 _s6 _s7 - propo_stream
   )

   (:init
          (allowlocate)
          (atconf q40)
          (atpose o10 p248)
          (atpose o8 p736)
          (atpose o9 p848)
          (canmove)
          (canpick)
          (fixed o6)
          (fixed o7)
          (graspable o10)
          (graspable o8)
          (graspable o9)
          (handempty)
          (isconf q40)
          (ispose o10 p248)
          (ispose o8 p736)
          (ispose o9 p848)
          (issupport o10 p248 o6)
          (stackable o10 o6)
          (stackable o10 o7)
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
