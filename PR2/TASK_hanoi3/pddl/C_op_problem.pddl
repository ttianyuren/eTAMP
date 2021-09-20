;19:43:40 19/09

;Skeleton_SN = 31

(define (problem put-wuti_propo_reorder)
   (:domain pr2-tamp_propo_reorder)

   (:objects
          o3 o4 o5 o6 o7 o8 - wuti
          p312 p624 p752 p792 p808 p984 - pose
          _p0 _p1 _p10 _p11 _p12 _p13 _p14 _p15 _p16 _p17 _p18 _p2 _p3 _p4 _p5 _p6 _p7 _p8 _p9 - propo_action
          _s0 _s10 _s104 _s1059 _s1079 _s1164 _s1200 _s1287 _s141 _s16 _s161 _s2 _s24 _s246 _s28 _s280 _s299 _s303 _s313 _s338 _s362 _s4 _s47 _s480 _s500 _s51 _s585 _s61 _s619 _s638 _s642 _s652 _s677 _s693 _s712 _s716 _s726 _s751 _s769 _s8 _s86 _s887 _s9 _s907 _s992 - propo_stream
   )

   (:init
          (atpose o3 p752)
          (atpose o4 p792)
          (atpose o5 p312)
          (atpose o6 p624)
          (atpose o7 p984)
          (atpose o8 p808)
          (canpick)
          (clear o4)
          (clear o5)
          (clear o6)
          (graspable o6)
          (graspable o7)
          (graspable o8)
          (ispose o3 p752)
          (ispose o4 p792)
          (ispose o5 p312)
          (ispose o6 p624)
          (ispose o7 p984)
          (ispose o8 p808)
          (issupport o6 p624 o7 p984)
          (issupport o7 p984 o8 p808)
          (issupport o8 p808 o3 p752)
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
        (_applicable _p18)
   )

)
