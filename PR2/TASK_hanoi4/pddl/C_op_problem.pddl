;16:36:15 19/09

;Skeleton_SN = 0

(define (problem put-wuti_propo_reorder)
   (:domain pr2-tamp_propo_reorder)

   (:objects
          o4 o5 o6 o7 o8 o9 - wuti
          p200 p256 p312 p368 p424 p432 - pose
          _p0 _p1 _p10 _p11 _p12 _p13 _p14 _p2 _p3 _p4 _p5 _p6 _p7 _p8 _p9 - propo_action
          _s0 _s104 _s1045 _s1079 _s1164 _s1200 _s127 _s1287 _s16 _s161 _s2 _s24 _s246 _s27 _s279 _s313 _s338 _s362 _s4 _s466 _s500 _s585 _s61 _s618 _s652 _s677 _s692 _s726 _s751 _s769 _s8 _s86 _s873 _s907 _s992 - propo_stream
   )

   (:init
          (atpose o4 p432)
          (atpose o5 p200)
          (atpose o6 p256)
          (atpose o7 p312)
          (atpose o8 p368)
          (atpose o9 p424)
          (canpick)
          (clear o5)
          (clear o6)
          (clear o7)
          (graspable o7)
          (graspable o8)
          (graspable o9)
          (ispose o4 p432)
          (ispose o5 p200)
          (ispose o6 p256)
          (ispose o7 p312)
          (ispose o8 p368)
          (ispose o9 p424)
          (issupport o7 p312 o8 p368)
          (issupport o8 p368 o9 p424)
          (issupport o9 p424 o4 p432)
          (on o7 o8)
          (on o8 o9)
          (on o9 o4)
          (smaller o7 o4)
          (smaller o7 o5)
          (smaller o7 o6)
          (smaller o7 o8)
          (smaller o7 o9)
          (smaller o8 o4)
          (smaller o8 o5)
          (smaller o8 o6)
          (smaller o8 o9)
          (smaller o9 o4)
          (smaller o9 o5)
          (smaller o9 o6)
          (_applicable _p0)
   )

   (:goal
        (_applicable _p14)
   )

)
