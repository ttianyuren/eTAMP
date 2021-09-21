;21:48:14 20/09

;Skeleton_SN = 16

(define (problem put-wuti_propo_reorder)
   (:domain pr2-tamp_propo_reorder)

   (:objects
          o3 o4 o5 o6 o7 o8 - wuti
          p488 p592 p600 p656 p768 p968 - pose
          _p0 _p1 _p10 _p11 _p12 _p13 _p14 _p15 _p16 _p2 _p3 _p4 _p5 _p6 _p7 _p8 _p9 - propo_action
          _s0 _s1 _s104 _s1045 _s1079 _s1164 _s1200 _s127 _s1287 _s16 _s161 _s2 _s24 _s246 _s26 _s278 _s291 _s313 _s338 _s362 _s39 _s4 _s466 _s500 _s585 _s61 _s617 _s630 _s652 _s677 _s691 _s704 _s726 _s751 _s769 _s8 _s86 _s873 _s907 _s992 - propo_stream
   )

   (:init
          (atpose o3 p592)
          (atpose o4 p768)
          (atpose o5 p600)
          (atpose o6 p488)
          (atpose o7 p656)
          (atpose o8 p968)
          (canpick)
          (clear o4)
          (clear o5)
          (clear o6)
          (graspable o6)
          (graspable o7)
          (graspable o8)
          (ispose o3 p592)
          (ispose o4 p768)
          (ispose o5 p600)
          (ispose o6 p488)
          (ispose o7 p656)
          (ispose o8 p968)
          (issupport o6 p488 o7 p656)
          (issupport o7 p656 o8 p968)
          (issupport o8 p968 o3 p592)
          (on o6 o7)
          (on o7 o8)
          (on o8 o3)
          (smaller o6 o3)
          (smaller o6 o4)
          (smaller o6 o5)
          (smaller o6 o7)
          (smaller o6 o8)
          (smaller o7 o3)
          (smaller o7 o4)
          (smaller o7 o5)
          (smaller o7 o8)
          (smaller o8 o3)
          (smaller o8 o4)
          (smaller o8 o5)
          (_applicable _p0)
   )

   (:goal
        (_applicable _p16)
   )

)
