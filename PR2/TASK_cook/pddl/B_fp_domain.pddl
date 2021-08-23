;17:18:50 23/08

;Skeleton_SN = 0

(define (domain pr2-tamp_propo)
   (:requirements :strips :equality :action-costs)

   (:types
          arm wuti grasp config pose trajectory propo_action
   )

   (:constants
          #p0 #p1 #p10 #p11 #p12 #p13 #p14 #p15 #p16 #p17 #p18 #p19 #p2 #p20 #p21 #p22 #p23 #p24 #p25 #p26 #p3 #p4 #p5 #p6 #p7 #p8 #p9 - pose
          #g0 #g1 #g2 #g3 #g4 #g5 #g6 #g7 #g8 - grasp
          #t0 #t1 #t10 #t100 #t1000 #t1001 #t1002 #t1003 #t1004 #t1005 #t1006 #t1007 #t1008 #t1009 #t101 #t1010 #t1011 #t1012 #t1013 #t1014 #t1015 #t1016 #t1017 #t1018 #t1019 #t102 #t1020 #t1021 #t1022 #t1023 #t1024 #t1025 #t1026 #t1027 #t1028 #t1029 #t103 #t1030 #t1031 #t1032 #t1033 #t1034 #t1035 #t1036 #t1037 #t1038 #t1039 #t104 #t1040 #t1041 #t1042 #t1043 #t1044 #t1045 #t1046 #t1047 #t1048 #t1049 #t105 #t1050 #t1051 #t1052 #t1053 #t1054 #t1055 #t1056 #t1057 #t1058 #t1059 #t106 #t1060 #t1061 #t1062 #t1063 #t1064 #t1065 #t1066 #t1067 #t1068 #t1069 #t107 #t1070 #t1071 #t1072 #t1073 #t1074 #t1075 #t1076 #t1077 #t1078 #t1079 #t108 #t1080 #t1081 #t1082 #t1083 #t1084 #t1085 #t1086 #t1087 #t1088 #t1089 #t109 #t1090 #t1091 #t1092 #t1093 #t1094 #t1095 #t1096 #t1097 #t1098 #t1099 #t11 #t110 #t1100 #t1101 #t1102 #t1103 #t1104 #t1105 #t1106 #t1107 #t1108 #t1109 #t111 #t1110 #t1111 #t1112 #t1113 #t1114 #t1115 #t1116 #t1117 #t1118 #t1119 #t112 #t1120 #t1121 #t1122 #t1123 #t1124 #t1125 #t1126 #t1127 #t1128 #t1129 #t113 #t1130 #t1131 #t1132 #t1133 #t1134 #t1135 #t1136 #t1137 #t1138 #t1139 #t114 #t1140 #t1141 #t1142 #t1143 #t1144 #t1145 #t1146 #t1147 #t1148 #t1149 #t115 #t1150 #t1151 #t1152 #t1153 #t1154 #t1155 #t1156 #t1157 #t1158 #t1159 #t116 #t1160 #t1161 #t1162 #t1163 #t1164 #t1165 #t1166 #t1167 #t1168 #t1169 #t117 #t1170 #t1171 #t1172 #t1173 #t1174 #t1175 #t1176 #t1177 #t1178 #t1179 #t118 #t1180 #t1181 #t1182 #t1183 #t1184 #t1185 #t1186 #t1187 #t1188 #t1189 #t119 #t1190 #t1191 #t1192 #t1193 #t1194 #t1195 #t1196 #t1197 #t1198 #t1199 #t12 #t120 #t1200 #t1201 #t1202 #t1203 #t1204 #t1205 #t1206 #t1207 #t1208 #t1209 #t121 #t1210 #t1211 #t1212 #t1213 #t1214 #t1215 #t1216 #t1217 #t1218 #t1219 #t122 #t1220 #t1221 #t1222 #t1223 #t1224 #t1225 #t1226 #t1227 #t1228 #t1229 #t123 #t1230 #t1231 #t1232 #t1233 #t1234 #t1235 #t1236 #t1237 #t1238 #t1239 #t124 #t1240 #t1241 #t1242 #t1243 #t1244 #t1245 #t1246 #t1247 #t1248 #t1249 #t125 #t1250 #t1251 #t1252 #t1253 #t1254 #t1255 #t1256 #t1257 #t1258 #t1259 #t126 #t1260 #t1261 #t1262 #t1263 #t1264 #t1265 #t1266 #t1267 #t1268 #t1269 #t127 #t1270 #t1271 #t1272 #t1273 #t1274 #t1275 #t1276 #t1277 #t1278 #t1279 #t128 #t1280 #t1281 #t1282 #t1283 #t1284 #t1285 #t1286 #t1287 #t1288 #t1289 #t129 #t1290 #t1291 #t1292 #t1293 #t1294 #t1295 #t1296 #t1297 #t1298 #t1299 #t13 #t130 #t1300 #t1301 #t1302 #t1303 #t1304 #t1305 #t1306 #t1307 #t1308 #t1309 #t131 #t1310 #t1311 #t1312 #t1313 #t1314 #t1315 #t1316 #t1317 #t1318 #t1319 #t132 #t1320 #t1321 #t1322 #t1323 #t1324 #t1325 #t1326 #t1327 #t1328 #t1329 #t133 #t1330 #t1331 #t1332 #t1333 #t1334 #t1335 #t1336 #t1337 #t1338 #t1339 #t134 #t1340 #t1341 #t1342 #t1343 #t1344 #t1345 #t1346 #t1347 #t1348 #t1349 #t135 #t1350 #t1351 #t1352 #t1353 #t1354 #t1355 #t1356 #t1357 #t1358 #t1359 #t136 #t1360 #t1361 #t1362 #t1363 #t1364 #t1365 #t1366 #t1367 #t1368 #t1369 #t137 #t1370 #t1371 #t1372 #t1373 #t1374 #t1375 #t1376 #t1377 #t1378 #t1379 #t138 #t1380 #t1381 #t1382 #t1383 #t1384 #t1385 #t1386 #t1387 #t1388 #t1389 #t139 #t1390 #t1391 #t1392 #t1393 #t1394 #t1395 #t1396 #t1397 #t1398 #t1399 #t14 #t140 #t1400 #t1401 #t1402 #t1403 #t1404 #t141 #t142 #t143 #t144 #t145 #t146 #t147 #t148 #t149 #t15 #t150 #t151 #t152 #t153 #t154 #t155 #t156 #t157 #t158 #t159 #t16 #t160 #t161 #t162 #t163 #t164 #t165 #t166 #t167 #t168 #t169 #t17 #t170 #t171 #t172 #t173 #t174 #t175 #t176 #t177 #t178 #t179 #t18 #t180 #t181 #t182 #t183 #t184 #t185 #t186 #t187 #t188 #t189 #t19 #t190 #t191 #t192 #t193 #t194 #t195 #t196 #t197 #t198 #t199 #t2 #t20 #t200 #t201 #t202 #t203 #t204 #t205 #t206 #t207 #t208 #t209 #t21 #t210 #t211 #t212 #t213 #t214 #t215 #t216 #t217 #t218 #t219 #t22 #t220 #t221 #t222 #t223 #t224 #t225 #t226 #t227 #t228 #t229 #t23 #t230 #t231 #t232 #t233 #t234 #t235 #t236 #t237 #t238 #t239 #t24 #t240 #t241 #t242 #t243 #t244 #t245 #t246 #t247 #t248 #t249 #t25 #t250 #t251 #t252 #t253 #t254 #t255 #t256 #t257 #t258 #t259 #t26 #t260 #t261 #t262 #t263 #t264 #t265 #t266 #t267 #t268 #t269 #t27 #t270 #t271 #t272 #t273 #t274 #t275 #t276 #t277 #t278 #t279 #t28 #t280 #t281 #t282 #t283 #t284 #t285 #t286 #t287 #t288 #t289 #t29 #t290 #t291 #t292 #t293 #t294 #t295 #t296 #t297 #t298 #t299 #t3 #t30 #t300 #t301 #t302 #t303 #t304 #t305 #t306 #t307 #t308 #t309 #t31 #t310 #t311 #t312 #t313 #t314 #t315 #t316 #t317 #t318 #t319 #t32 #t320 #t321 #t322 #t323 #t324 #t325 #t326 #t327 #t328 #t329 #t33 #t330 #t331 #t332 #t333 #t334 #t335 #t336 #t337 #t338 #t339 #t34 #t340 #t341 #t342 #t343 #t344 #t345 #t346 #t347 #t348 #t349 #t35 #t350 #t351 #t352 #t353 #t354 #t355 #t356 #t357 #t358 #t359 #t36 #t360 #t361 #t362 #t363 #t364 #t365 #t366 #t367 #t368 #t369 #t37 #t370 #t371 #t372 #t373 #t374 #t375 #t376 #t377 #t378 #t379 #t38 #t380 #t381 #t382 #t383 #t384 #t385 #t386 #t387 #t388 #t389 #t39 #t390 #t391 #t392 #t393 #t394 #t395 #t396 #t397 #t398 #t399 #t4 #t40 #t400 #t401 #t402 #t403 #t404 #t405 #t406 #t407 #t408 #t409 #t41 #t410 #t411 #t412 #t413 #t414 #t415 #t416 #t417 #t418 #t419 #t42 #t420 #t421 #t422 #t423 #t424 #t425 #t426 #t427 #t428 #t429 #t43 #t430 #t431 #t432 #t433 #t434 #t435 #t436 #t437 #t438 #t439 #t44 #t440 #t441 #t442 #t443 #t444 #t445 #t446 #t447 #t448 #t449 #t45 #t450 #t451 #t452 #t453 #t454 #t455 #t456 #t457 #t458 #t459 #t46 #t460 #t461 #t462 #t463 #t464 #t465 #t466 #t467 #t468 #t469 #t47 #t470 #t471 #t472 #t473 #t474 #t475 #t476 #t477 #t478 #t479 #t48 #t480 #t481 #t482 #t483 #t484 #t485 #t486 #t487 #t488 #t489 #t49 #t490 #t491 #t492 #t493 #t494 #t495 #t496 #t497 #t498 #t499 #t5 #t50 #t500 #t501 #t502 #t503 #t504 #t505 #t506 #t507 #t508 #t509 #t51 #t510 #t511 #t512 #t513 #t514 #t515 #t516 #t517 #t518 #t519 #t52 #t520 #t521 #t522 #t523 #t524 #t525 #t526 #t527 #t528 #t529 #t53 #t530 #t531 #t532 #t533 #t534 #t535 #t536 #t537 #t538 #t539 #t54 #t540 #t541 #t542 #t543 #t544 #t545 #t546 #t547 #t548 #t549 #t55 #t550 #t551 #t552 #t553 #t554 #t555 #t556 #t557 #t558 #t559 #t56 #t560 #t561 #t562 #t563 #t564 #t565 #t566 #t567 #t568 #t569 #t57 #t570 #t571 #t572 #t573 #t574 #t575 #t576 #t577 #t578 #t579 #t58 #t580 #t581 #t582 #t583 #t584 #t585 #t586 #t587 #t588 #t589 #t59 #t590 #t591 #t592 #t593 #t594 #t595 #t596 #t597 #t598 #t599 #t6 #t60 #t600 #t601 #t602 #t603 #t604 #t605 #t606 #t607 #t608 #t609 #t61 #t610 #t611 #t612 #t613 #t614 #t615 #t616 #t617 #t618 #t619 #t62 #t620 #t621 #t622 #t623 #t624 #t625 #t626 #t627 #t628 #t629 #t63 #t630 #t631 #t632 #t633 #t634 #t635 #t636 #t637 #t638 #t639 #t64 #t640 #t641 #t642 #t643 #t644 #t645 #t646 #t647 #t648 #t649 #t65 #t650 #t651 #t652 #t653 #t654 #t655 #t656 #t657 #t658 #t659 #t66 #t660 #t661 #t662 #t663 #t664 #t665 #t666 #t667 #t668 #t669 #t67 #t670 #t671 #t672 #t673 #t674 #t675 #t676 #t677 #t678 #t679 #t68 #t680 #t681 #t682 #t683 #t684 #t685 #t686 #t687 #t688 #t689 #t69 #t690 #t691 #t692 #t693 #t694 #t695 #t696 #t697 #t698 #t699 #t7 #t70 #t700 #t701 #t702 #t703 #t704 #t705 #t706 #t707 #t708 #t709 #t71 #t710 #t711 #t712 #t713 #t714 #t715 #t716 #t717 #t718 #t719 #t72 #t720 #t721 #t722 #t723 #t724 #t725 #t726 #t727 #t728 #t729 #t73 #t730 #t731 #t732 #t733 #t734 #t735 #t736 #t737 #t738 #t739 #t74 #t740 #t741 #t742 #t743 #t744 #t745 #t746 #t747 #t748 #t749 #t75 #t750 #t751 #t752 #t753 #t754 #t755 #t756 #t757 #t758 #t759 #t76 #t760 #t761 #t762 #t763 #t764 #t765 #t766 #t767 #t768 #t769 #t77 #t770 #t771 #t772 #t773 #t774 #t775 #t776 #t777 #t778 #t779 #t78 #t780 #t781 #t782 #t783 #t784 #t785 #t786 #t787 #t788 #t789 #t79 #t790 #t791 #t792 #t793 #t794 #t795 #t796 #t797 #t798 #t799 #t8 #t80 #t800 #t801 #t802 #t803 #t804 #t805 #t806 #t807 #t808 #t809 #t81 #t810 #t811 #t812 #t813 #t814 #t815 #t816 #t817 #t818 #t819 #t82 #t820 #t821 #t822 #t823 #t824 #t825 #t826 #t827 #t828 #t829 #t83 #t830 #t831 #t832 #t833 #t834 #t835 #t836 #t837 #t838 #t839 #t84 #t840 #t841 #t842 #t843 #t844 #t845 #t846 #t847 #t848 #t849 #t85 #t850 #t851 #t852 #t853 #t854 #t855 #t856 #t857 #t858 #t859 #t86 #t860 #t861 #t862 #t863 #t864 #t865 #t866 #t867 #t868 #t869 #t87 #t870 #t871 #t872 #t873 #t874 #t875 #t876 #t877 #t878 #t879 #t88 #t880 #t881 #t882 #t883 #t884 #t885 #t886 #t887 #t888 #t889 #t89 #t890 #t891 #t892 #t893 #t894 #t895 #t896 #t897 #t898 #t899 #t9 #t90 #t900 #t901 #t902 #t903 #t904 #t905 #t906 #t907 #t908 #t909 #t91 #t910 #t911 #t912 #t913 #t914 #t915 #t916 #t917 #t918 #t919 #t92 #t920 #t921 #t922 #t923 #t924 #t925 #t926 #t927 #t928 #t929 #t93 #t930 #t931 #t932 #t933 #t934 #t935 #t936 #t937 #t938 #t939 #t94 #t940 #t941 #t942 #t943 #t944 #t945 #t946 #t947 #t948 #t949 #t95 #t950 #t951 #t952 #t953 #t954 #t955 #t956 #t957 #t958 #t959 #t96 #t960 #t961 #t962 #t963 #t964 #t965 #t966 #t967 #t968 #t969 #t97 #t970 #t971 #t972 #t973 #t974 #t975 #t976 #t977 #t978 #t979 #t98 #t980 #t981 #t982 #t983 #t984 #t985 #t986 #t987 #t988 #t989 #t99 #t990 #t991 #t992 #t993 #t994 #t995 #t996 #t997 #t998 #t999 - trajectory
          #q0 #q1 #q10 #q11 #q12 #q13 #q14 #q15 #q16 #q17 #q18 #q19 #q2 #q20 #q21 #q22 #q23 #q24 #q25 #q26 #q27 #q28 #q29 #q3 #q30 #q31 #q32 #q33 #q34 #q35 #q4 #q5 #q6 #q7 #q8 #q9 - config
   )

   (:predicates
          (isarm ?a - arm)
          (controllable ?a - arm)
          (stackable ?o - wuti ?r - wuti)
          (sink ?r - wuti)
          (stove ?r - wuti)
          (ispose ?o - wuti ?p - pose)
          (isgrasp ?o - wuti ?g - grasp)
          (kin ?a - arm ?o - wuti ?p - pose ?g - grasp ?q - config ?t - trajectory)
          (basemotion ?q1 - config ?t - trajectory ?q2 - config)
          (supported ?o - wuti ?p - pose ?r - wuti)
          (atpose ?o - wuti ?p - pose)
          (atgrasp ?a - arm ?o - wuti ?g - grasp)
          (graspable ?o - wuti)
          (handempty ?a - arm)
          (atbconf ?q - config)
          (isbconf ?q - config)
          (canmove)
          (cleaned ?o - wuti)
          (cooked ?o - wuti)
          (canoperate)
          (on ?o - wuti ?r - wuti)
          (holding ?a - arm ?o - wuti)
          (_applicable ?_p - propo_action)
   )

   (:derived (on ?o - wuti ?r - wuti)
          (exists (?p) (and (supported ?o ?p ?r) (atpose ?o ?p)))
   )
   (:derived (holding ?a - arm ?o - wuti)
          (exists (?g) (and (isarm ?a) (isgrasp ?o ?g) (atgrasp ?a ?o ?g)))
   )

   (:action a0_move_base
          :parameters (q976 #q1 #t38)
          :precondition (and (basemotion q976 #t38 #q1) (atbconf q976) (canmove) (_applicable _p0))
          :effect (and (atbconf #q1) (not (atbconf q976)) (not (canmove)) (increase (total-cost) 200) (not (canoperate)) (not (_applicable _p0)) (_applicable _p1))
   )
   (:action a1_pick
          :parameters ('left' o6 p168 #g1 #q1 #t2)
          :precondition (and (kin 'left' o6 p168 #g1 #q1 #t2) (atpose o6 p168) (handempty 'left') (atbconf #q1) (_applicable _p1))
          :effect (and (atgrasp 'left' o6 #g1) (canmove) (not (atpose o6 p168)) (not (handempty 'left')) (increase (total-cost) 100) (not (canoperate)) (not (_applicable _p1)) (_applicable _p2))
   )
   (:action a2_move_base
          :parameters (#q1 #q13 #t124)
          :precondition (and (basemotion #q1 #t124 #q13) (atbconf #q1) (canmove) (_applicable _p2))
          :effect (and (atbconf #q13) (not (atbconf #q1)) (not (canmove)) (increase (total-cost) 200) (not (canoperate)) (not (_applicable _p2)) (_applicable _p3))
   )
   (:action a3_place
          :parameters ('left' o6 #p4 #g1 #q13 #t14)
          :precondition (and (kin 'left' o6 #p4 #g1 #q13 #t14) (atgrasp 'left' o6 #g1) (atbconf #q13) (_applicable _p3))
          :effect (and (atpose o6 #p4) (handempty 'left') (canmove) (not (atgrasp 'left' o6 #g1)) (increase (total-cost) 100) (canoperate) (not (_applicable _p3)) (_applicable _p4))
   )
   (:action a4_clean
          :parameters (o6 o3)
          :precondition (and (stackable o6 o3) (sink o3) (on o6 o3) (canoperate) (_applicable _p4))
          :effect (and (cleaned o6) (increase (total-cost) 50) (not (canoperate)) (not (_applicable _p4)) (_applicable _p5))
   )
   (:action a5_pick
          :parameters ('left' o6 #p4 #g1 #q13 #t14)
          :precondition (and (kin 'left' o6 #p4 #g1 #q13 #t14) (atpose o6 #p4) (handempty 'left') (atbconf #q13) (_applicable _p5))
          :effect (and (atgrasp 'left' o6 #g1) (canmove) (not (atpose o6 #p4)) (not (handempty 'left')) (increase (total-cost) 100) (not (canoperate)) (not (_applicable _p5)) (_applicable _p6))
   )
   (:action a6_move_base
          :parameters (#q13 #q14 #t569)
          :precondition (and (basemotion #q13 #t569 #q14) (atbconf #q13) (canmove) (_applicable _p6))
          :effect (and (atbconf #q14) (not (atbconf #q13)) (not (canmove)) (increase (total-cost) 200) (not (canoperate)) (not (_applicable _p6)) (_applicable _p7))
   )
   (:action a7_place
          :parameters ('left' o6 #p5 #g1 #q14 #t15)
          :precondition (and (kin 'left' o6 #p5 #g1 #q14 #t15) (atgrasp 'left' o6 #g1) (atbconf #q14) (_applicable _p7))
          :effect (and (atpose o6 #p5) (handempty 'left') (canmove) (not (atgrasp 'left' o6 #g1)) (increase (total-cost) 100) (canoperate) (not (_applicable _p7)) (_applicable _p8))
   )
   (:action a8_cook
          :parameters (o6 o4)
          :precondition (and (stackable o6 o4) (stove o4) (on o6 o4) (cleaned o6) (canoperate) (_applicable _p8))
          :effect (and (cooked o6) (not (cleaned o6)) (increase (total-cost) 50) (not (canoperate)) (not (_applicable _p8)) (_applicable _p9))
   )
   (:action a9_move_base
          :parameters (#q14 #q0 #t592)
          :precondition (and (basemotion #q14 #t592 #q0) (atbconf #q14) (canmove) (_applicable _p9))
          :effect (and (atbconf #q0) (not (atbconf #q14)) (not (canmove)) (increase (total-cost) 200) (not (canoperate)) (not (_applicable _p9)) (_applicable _p10))
   )
   (:action a10_pick
          :parameters ('left' o5 p0 #g0 #q0 #t1)
          :precondition (and (kin 'left' o5 p0 #g0 #q0 #t1) (atpose o5 p0) (handempty 'left') (atbconf #q0) (_applicable _p10))
          :effect (and (atgrasp 'left' o5 #g0) (canmove) (not (atpose o5 p0)) (not (handempty 'left')) (increase (total-cost) 100) (not (canoperate)) (not (_applicable _p10)) (_applicable _p11))
   )
   (:action a11_move_base
          :parameters (#q0 #q10 #t84)
          :precondition (and (basemotion #q0 #t84 #q10) (atbconf #q0) (canmove) (_applicable _p11))
          :effect (and (atbconf #q10) (not (atbconf #q0)) (not (canmove)) (increase (total-cost) 200) (not (canoperate)) (not (_applicable _p11)) (_applicable _p12))
   )
   (:action a12_place
          :parameters ('left' o5 #p1 #g0 #q10 #t11)
          :precondition (and (kin 'left' o5 #p1 #g0 #q10 #t11) (atgrasp 'left' o5 #g0) (atbconf #q10) (_applicable _p12))
          :effect (and (atpose o5 #p1) (handempty 'left') (canmove) (not (atgrasp 'left' o5 #g0)) (increase (total-cost) 100) (canoperate) (not (_applicable _p12)) (_applicable _p13))
   )
   (:action a13_clean
          :parameters (o5 o3)
          :precondition (and (stackable o5 o3) (sink o3) (on o5 o3) (canoperate) (_applicable _p13))
          :effect (and (cleaned o5) (increase (total-cost) 50) (not (canoperate)) (not (_applicable _p13)) (_applicable _p14))
   )
   (:action a14_pick
          :parameters ('left' o5 #p1 #g0 #q10 #t11)
          :precondition (and (kin 'left' o5 #p1 #g0 #q10 #t11) (atpose o5 #p1) (handempty 'left') (atbconf #q10) (_applicable _p14))
          :effect (and (atgrasp 'left' o5 #g0) (canmove) (not (atpose o5 #p1)) (not (handempty 'left')) (increase (total-cost) 100) (not (canoperate)) (not (_applicable _p14)) (_applicable _p15))
   )
   (:action a15_move_base
          :parameters (#q10 #q11 #t455)
          :precondition (and (basemotion #q10 #t455 #q11) (atbconf #q10) (canmove) (_applicable _p15))
          :effect (and (atbconf #q11) (not (atbconf #q10)) (not (canmove)) (increase (total-cost) 200) (not (canoperate)) (not (_applicable _p15)) (_applicable _p16))
   )
   (:action a16_place
          :parameters ('left' o5 #p2 #g0 #q11 #t12)
          :precondition (and (kin 'left' o5 #p2 #g0 #q11 #t12) (atgrasp 'left' o5 #g0) (atbconf #q11) (_applicable _p16))
          :effect (and (atpose o5 #p2) (handempty 'left') (canmove) (not (atgrasp 'left' o5 #g0)) (increase (total-cost) 100) (canoperate) (not (_applicable _p16)) (_applicable _p17))
   )
   (:action a17_cook
          :parameters (o5 o4)
          :precondition (and (stackable o5 o4) (stove o4) (on o5 o4) (cleaned o5) (canoperate) (_applicable _p17))
          :effect (and (cooked o5) (not (cleaned o5)) (increase (total-cost) 50) (not (canoperate)) (not (_applicable _p17)) (_applicable _p18))
   )
   (:action a18_move_base
          :parameters (#q11 q976 #t480)
          :precondition (and (basemotion #q11 #t480 q976) (atbconf #q11) (canmove) (_applicable _p18))
          :effect (and (atbconf q976) (not (atbconf #q11)) (not (canmove)) (increase (total-cost) 200) (not (canoperate)) (not (_applicable _p18)) (_applicable _p19))
   )
   (:action s0_sample-place
          :parameters (o5 o2)
          :precondition (stackable o5 o2)
          :effect (and (ispose o5 #p0) (supported o5 #p0 o2))
   )
   (:action s1_sample-place
          :parameters (o5 o3)
          :precondition (stackable o5 o3)
          :effect (and (ispose o5 #p1) (supported o5 #p1 o3))
   )
   (:action s2_sample-place
          :parameters (o5 o4)
          :precondition (stackable o5 o4)
          :effect (and (ispose o5 #p2) (supported o5 #p2 o4))
   )
   (:action s3_sample-place
          :parameters (o6 o2)
          :precondition (stackable o6 o2)
          :effect (and (ispose o6 #p3) (supported o6 #p3 o2))
   )
   (:action s4_sample-place
          :parameters (o6 o3)
          :precondition (stackable o6 o3)
          :effect (and (ispose o6 #p4) (supported o6 #p4 o3))
   )
   (:action s5_sample-place
          :parameters (o6 o4)
          :precondition (stackable o6 o4)
          :effect (and (ispose o6 #p5) (supported o6 #p5 o4))
   )
   (:action s6_sample-place
          :parameters (o7 o2)
          :precondition (stackable o7 o2)
          :effect (and (ispose o7 #p6) (supported o7 #p6 o2))
   )
   (:action s7_sample-place
          :parameters (o7 o3)
          :precondition (stackable o7 o3)
          :effect (and (ispose o7 #p7) (supported o7 #p7 o3))
   )
   (:action s8_sample-place
          :parameters (o7 o4)
          :precondition (stackable o7 o4)
          :effect (and (ispose o7 #p8) (supported o7 #p8 o4))
   )
   (:action s9_sample-place
          :parameters (o8 o2)
          :precondition (stackable o8 o2)
          :effect (and (ispose o8 #p9) (supported o8 #p9 o2))
   )
   (:action s10_sample-place
          :parameters (o8 o3)
          :precondition (stackable o8 o3)
          :effect (and (ispose o8 #p10) (supported o8 #p10 o3))
   )
   (:action s11_sample-place
          :parameters (o8 o4)
          :precondition (stackable o8 o4)
          :effect (and (ispose o8 #p11) (supported o8 #p11 o4))
   )
   (:action s12_sample-place
          :parameters (o9 o2)
          :precondition (stackable o9 o2)
          :effect (and (ispose o9 #p12) (supported o9 #p12 o2))
   )
   (:action s13_sample-place
          :parameters (o9 o3)
          :precondition (stackable o9 o3)
          :effect (and (ispose o9 #p13) (supported o9 #p13 o3))
   )
   (:action s14_sample-place
          :parameters (o9 o4)
          :precondition (stackable o9 o4)
          :effect (and (ispose o9 #p14) (supported o9 #p14 o4))
   )
   (:action s15_sample-place
          :parameters (o10 o2)
          :precondition (stackable o10 o2)
          :effect (and (ispose o10 #p15) (supported o10 #p15 o2))
   )
   (:action s16_sample-place
          :parameters (o10 o3)
          :precondition (stackable o10 o3)
          :effect (and (ispose o10 #p16) (supported o10 #p16 o3))
   )
   (:action s17_sample-place
          :parameters (o10 o4)
          :precondition (stackable o10 o4)
          :effect (and (ispose o10 #p17) (supported o10 #p17 o4))
   )
   (:action s18_sample-place
          :parameters (o11 o2)
          :precondition (stackable o11 o2)
          :effect (and (ispose o11 #p18) (supported o11 #p18 o2))
   )
   (:action s19_sample-place
          :parameters (o11 o3)
          :precondition (stackable o11 o3)
          :effect (and (ispose o11 #p19) (supported o11 #p19 o3))
   )
   (:action s20_sample-place
          :parameters (o11 o4)
          :precondition (stackable o11 o4)
          :effect (and (ispose o11 #p20) (supported o11 #p20 o4))
   )
   (:action s21_sample-place
          :parameters (o12 o2)
          :precondition (stackable o12 o2)
          :effect (and (ispose o12 #p21) (supported o12 #p21 o2))
   )
   (:action s22_sample-place
          :parameters (o12 o3)
          :precondition (stackable o12 o3)
          :effect (and (ispose o12 #p22) (supported o12 #p22 o3))
   )
   (:action s23_sample-place
          :parameters (o12 o4)
          :precondition (stackable o12 o4)
          :effect (and (ispose o12 #p23) (supported o12 #p23 o4))
   )
   (:action s24_sample-place
          :parameters (o13 o2)
          :precondition (stackable o13 o2)
          :effect (and (ispose o13 #p24) (supported o13 #p24 o2))
   )
   (:action s25_sample-place
          :parameters (o13 o3)
          :precondition (stackable o13 o3)
          :effect (and (ispose o13 #p25) (supported o13 #p25 o3))
   )
   (:action s26_sample-place
          :parameters (o13 o4)
          :precondition (stackable o13 o4)
          :effect (and (ispose o13 #p26) (supported o13 #p26 o4))
   )
   (:action s27_sample-grasp
          :parameters (o5)
          :precondition (graspable o5)
          :effect (isgrasp o5 #g0)
   )
   (:action s28_sample-grasp
          :parameters (o6)
          :precondition (graspable o6)
          :effect (isgrasp o6 #g1)
   )
   (:action s29_sample-grasp
          :parameters (o7)
          :precondition (graspable o7)
          :effect (isgrasp o7 #g2)
   )
   (:action s30_sample-grasp
          :parameters (o8)
          :precondition (graspable o8)
          :effect (isgrasp o8 #g3)
   )
   (:action s31_sample-grasp
          :parameters (o9)
          :precondition (graspable o9)
          :effect (isgrasp o9 #g4)
   )
   (:action s32_sample-grasp
          :parameters (o10)
          :precondition (graspable o10)
          :effect (isgrasp o10 #g5)
   )
   (:action s33_sample-grasp
          :parameters (o11)
          :precondition (graspable o11)
          :effect (isgrasp o11 #g6)
   )
   (:action s34_sample-grasp
          :parameters (o12)
          :precondition (graspable o12)
          :effect (isgrasp o12 #g7)
   )
   (:action s35_sample-grasp
          :parameters (o13)
          :precondition (graspable o13)
          :effect (isgrasp o13 #g8)
   )
   (:action s36_plan-base-motion
          :parameters (q976 q976)
          :precondition (and (isbconf q976) (isbconf q976))
          :effect (basemotion q976 #t0 q976)
   )
   (:action s37_inverse-kinematics
          :parameters ('left' o5 p0 #g0)
          :precondition (and (controllable 'left') (ispose o5 p0) (isgrasp o5 #g0))
          :effect (and (isbconf #q0) (kin 'left' o5 p0 #g0 #q0 #t1))
   )
   (:action s38_inverse-kinematics
          :parameters ('left' o6 p168 #g1)
          :precondition (and (controllable 'left') (ispose o6 p168) (isgrasp o6 #g1))
          :effect (and (isbconf #q1) (kin 'left' o6 p168 #g1 #q1 #t2))
   )
   (:action s39_inverse-kinematics
          :parameters ('left' o7 p56 #g2)
          :precondition (and (controllable 'left') (ispose o7 p56) (isgrasp o7 #g2))
          :effect (and (isbconf #q2) (kin 'left' o7 p56 #g2 #q2 #t3))
   )
   (:action s40_inverse-kinematics
          :parameters ('left' o8 p224 #g3)
          :precondition (and (controllable 'left') (ispose o8 p224) (isgrasp o8 #g3))
          :effect (and (isbconf #q3) (kin 'left' o8 p224 #g3 #q3 #t4))
   )
   (:action s41_inverse-kinematics
          :parameters ('left' o9 p280 #g4)
          :precondition (and (controllable 'left') (ispose o9 p280) (isgrasp o9 #g4))
          :effect (and (isbconf #q4) (kin 'left' o9 p280 #g4 #q4 #t5))
   )
   (:action s42_inverse-kinematics
          :parameters ('left' o10 p336 #g5)
          :precondition (and (controllable 'left') (ispose o10 p336) (isgrasp o10 #g5))
          :effect (and (isbconf #q5) (kin 'left' o10 p336 #g5 #q5 #t6))
   )
   (:action s43_inverse-kinematics
          :parameters ('left' o11 p392 #g6)
          :precondition (and (controllable 'left') (ispose o11 p392) (isgrasp o11 #g6))
          :effect (and (isbconf #q6) (kin 'left' o11 p392 #g6 #q6 #t7))
   )
   (:action s44_inverse-kinematics
          :parameters ('left' o12 p448 #g7)
          :precondition (and (controllable 'left') (ispose o12 p448) (isgrasp o12 #g7))
          :effect (and (isbconf #q7) (kin 'left' o12 p448 #g7 #q7 #t8))
   )
   (:action s45_inverse-kinematics
          :parameters ('left' o13 p504 #g8)
          :precondition (and (controllable 'left') (ispose o13 p504) (isgrasp o13 #g8))
          :effect (and (isbconf #q8) (kin 'left' o13 p504 #g8 #q8 #t9))
   )
   (:action s46_inverse-kinematics
          :parameters ('left' o5 #p0 #g0)
          :precondition (and (controllable 'left') (ispose o5 #p0) (isgrasp o5 #g0))
          :effect (and (isbconf #q9) (kin 'left' o5 #p0 #g0 #q9 #t10))
   )
   (:action s47_inverse-kinematics
          :parameters ('left' o5 #p1 #g0)
          :precondition (and (controllable 'left') (ispose o5 #p1) (isgrasp o5 #g0))
          :effect (and (isbconf #q10) (kin 'left' o5 #p1 #g0 #q10 #t11))
   )
   (:action s48_inverse-kinematics
          :parameters ('left' o5 #p2 #g0)
          :precondition (and (controllable 'left') (ispose o5 #p2) (isgrasp o5 #g0))
          :effect (and (isbconf #q11) (kin 'left' o5 #p2 #g0 #q11 #t12))
   )
   (:action s49_inverse-kinematics
          :parameters ('left' o6 #p3 #g1)
          :precondition (and (controllable 'left') (ispose o6 #p3) (isgrasp o6 #g1))
          :effect (and (isbconf #q12) (kin 'left' o6 #p3 #g1 #q12 #t13))
   )
   (:action s50_inverse-kinematics
          :parameters ('left' o6 #p4 #g1)
          :precondition (and (controllable 'left') (ispose o6 #p4) (isgrasp o6 #g1))
          :effect (and (isbconf #q13) (kin 'left' o6 #p4 #g1 #q13 #t14))
   )
   (:action s51_inverse-kinematics
          :parameters ('left' o6 #p5 #g1)
          :precondition (and (controllable 'left') (ispose o6 #p5) (isgrasp o6 #g1))
          :effect (and (isbconf #q14) (kin 'left' o6 #p5 #g1 #q14 #t15))
   )
   (:action s52_inverse-kinematics
          :parameters ('left' o7 #p6 #g2)
          :precondition (and (controllable 'left') (ispose o7 #p6) (isgrasp o7 #g2))
          :effect (and (isbconf #q15) (kin 'left' o7 #p6 #g2 #q15 #t16))
   )
   (:action s53_inverse-kinematics
          :parameters ('left' o7 #p7 #g2)
          :precondition (and (controllable 'left') (ispose o7 #p7) (isgrasp o7 #g2))
          :effect (and (isbconf #q16) (kin 'left' o7 #p7 #g2 #q16 #t17))
   )
   (:action s54_inverse-kinematics
          :parameters ('left' o7 #p8 #g2)
          :precondition (and (controllable 'left') (ispose o7 #p8) (isgrasp o7 #g2))
          :effect (and (isbconf #q17) (kin 'left' o7 #p8 #g2 #q17 #t18))
   )
   (:action s55_inverse-kinematics
          :parameters ('left' o8 #p9 #g3)
          :precondition (and (controllable 'left') (ispose o8 #p9) (isgrasp o8 #g3))
          :effect (and (isbconf #q18) (kin 'left' o8 #p9 #g3 #q18 #t19))
   )
   (:action s56_inverse-kinematics
          :parameters ('left' o8 #p10 #g3)
          :precondition (and (controllable 'left') (ispose o8 #p10) (isgrasp o8 #g3))
          :effect (and (isbconf #q19) (kin 'left' o8 #p10 #g3 #q19 #t20))
   )
   (:action s57_inverse-kinematics
          :parameters ('left' o8 #p11 #g3)
          :precondition (and (controllable 'left') (ispose o8 #p11) (isgrasp o8 #g3))
          :effect (and (isbconf #q20) (kin 'left' o8 #p11 #g3 #q20 #t21))
   )
   (:action s58_inverse-kinematics
          :parameters ('left' o9 #p12 #g4)
          :precondition (and (controllable 'left') (ispose o9 #p12) (isgrasp o9 #g4))
          :effect (and (isbconf #q21) (kin 'left' o9 #p12 #g4 #q21 #t22))
   )
   (:action s59_inverse-kinematics
          :parameters ('left' o9 #p13 #g4)
          :precondition (and (controllable 'left') (ispose o9 #p13) (isgrasp o9 #g4))
          :effect (and (isbconf #q22) (kin 'left' o9 #p13 #g4 #q22 #t23))
   )
   (:action s60_inverse-kinematics
          :parameters ('left' o9 #p14 #g4)
          :precondition (and (controllable 'left') (ispose o9 #p14) (isgrasp o9 #g4))
          :effect (and (isbconf #q23) (kin 'left' o9 #p14 #g4 #q23 #t24))
   )
   (:action s61_inverse-kinematics
          :parameters ('left' o10 #p15 #g5)
          :precondition (and (controllable 'left') (ispose o10 #p15) (isgrasp o10 #g5))
          :effect (and (isbconf #q24) (kin 'left' o10 #p15 #g5 #q24 #t25))
   )
   (:action s62_inverse-kinematics
          :parameters ('left' o10 #p16 #g5)
          :precondition (and (controllable 'left') (ispose o10 #p16) (isgrasp o10 #g5))
          :effect (and (isbconf #q25) (kin 'left' o10 #p16 #g5 #q25 #t26))
   )
   (:action s63_inverse-kinematics
          :parameters ('left' o10 #p17 #g5)
          :precondition (and (controllable 'left') (ispose o10 #p17) (isgrasp o10 #g5))
          :effect (and (isbconf #q26) (kin 'left' o10 #p17 #g5 #q26 #t27))
   )
   (:action s64_inverse-kinematics
          :parameters ('left' o11 #p18 #g6)
          :precondition (and (controllable 'left') (ispose o11 #p18) (isgrasp o11 #g6))
          :effect (and (isbconf #q27) (kin 'left' o11 #p18 #g6 #q27 #t28))
   )
   (:action s65_inverse-kinematics
          :parameters ('left' o11 #p19 #g6)
          :precondition (and (controllable 'left') (ispose o11 #p19) (isgrasp o11 #g6))
          :effect (and (isbconf #q28) (kin 'left' o11 #p19 #g6 #q28 #t29))
   )
   (:action s66_inverse-kinematics
          :parameters ('left' o11 #p20 #g6)
          :precondition (and (controllable 'left') (ispose o11 #p20) (isgrasp o11 #g6))
          :effect (and (isbconf #q29) (kin 'left' o11 #p20 #g6 #q29 #t30))
   )
   (:action s67_inverse-kinematics
          :parameters ('left' o12 #p21 #g7)
          :precondition (and (controllable 'left') (ispose o12 #p21) (isgrasp o12 #g7))
          :effect (and (isbconf #q30) (kin 'left' o12 #p21 #g7 #q30 #t31))
   )
   (:action s68_inverse-kinematics
          :parameters ('left' o12 #p22 #g7)
          :precondition (and (controllable 'left') (ispose o12 #p22) (isgrasp o12 #g7))
          :effect (and (isbconf #q31) (kin 'left' o12 #p22 #g7 #q31 #t32))
   )
   (:action s69_inverse-kinematics
          :parameters ('left' o12 #p23 #g7)
          :precondition (and (controllable 'left') (ispose o12 #p23) (isgrasp o12 #g7))
          :effect (and (isbconf #q32) (kin 'left' o12 #p23 #g7 #q32 #t33))
   )
   (:action s70_inverse-kinematics
          :parameters ('left' o13 #p24 #g8)
          :precondition (and (controllable 'left') (ispose o13 #p24) (isgrasp o13 #g8))
          :effect (and (isbconf #q33) (kin 'left' o13 #p24 #g8 #q33 #t34))
   )
   (:action s71_inverse-kinematics
          :parameters ('left' o13 #p25 #g8)
          :precondition (and (controllable 'left') (ispose o13 #p25) (isgrasp o13 #g8))
          :effect (and (isbconf #q34) (kin 'left' o13 #p25 #g8 #q34 #t35))
   )
   (:action s72_inverse-kinematics
          :parameters ('left' o13 #p26 #g8)
          :precondition (and (controllable 'left') (ispose o13 #p26) (isgrasp o13 #g8))
          :effect (and (isbconf #q35) (kin 'left' o13 #p26 #g8 #q35 #t36))
   )
   (:action s73_plan-base-motion
          :parameters (q976 #q0)
          :precondition (and (isbconf q976) (isbconf #q0))
          :effect (basemotion q976 #t37 #q0)
   )
   (:action s74_plan-base-motion
          :parameters (q976 #q1)
          :precondition (and (isbconf q976) (isbconf #q1))
          :effect (basemotion q976 #t38 #q1)
   )
   (:action s75_plan-base-motion
          :parameters (q976 #q2)
          :precondition (and (isbconf q976) (isbconf #q2))
          :effect (basemotion q976 #t39 #q2)
   )
   (:action s76_plan-base-motion
          :parameters (q976 #q3)
          :precondition (and (isbconf q976) (isbconf #q3))
          :effect (basemotion q976 #t40 #q3)
   )
   (:action s77_plan-base-motion
          :parameters (q976 #q4)
          :precondition (and (isbconf q976) (isbconf #q4))
          :effect (basemotion q976 #t41 #q4)
   )
   (:action s78_plan-base-motion
          :parameters (q976 #q5)
          :precondition (and (isbconf q976) (isbconf #q5))
          :effect (basemotion q976 #t42 #q5)
   )
   (:action s79_plan-base-motion
          :parameters (q976 #q6)
          :precondition (and (isbconf q976) (isbconf #q6))
          :effect (basemotion q976 #t43 #q6)
   )
   (:action s80_plan-base-motion
          :parameters (q976 #q7)
          :precondition (and (isbconf q976) (isbconf #q7))
          :effect (basemotion q976 #t44 #q7)
   )
   (:action s81_plan-base-motion
          :parameters (q976 #q8)
          :precondition (and (isbconf q976) (isbconf #q8))
          :effect (basemotion q976 #t45 #q8)
   )
   (:action s82_plan-base-motion
          :parameters (q976 #q9)
          :precondition (and (isbconf q976) (isbconf #q9))
          :effect (basemotion q976 #t46 #q9)
   )
   (:action s83_plan-base-motion
          :parameters (q976 #q10)
          :precondition (and (isbconf q976) (isbconf #q10))
          :effect (basemotion q976 #t47 #q10)
   )
   (:action s84_plan-base-motion
          :parameters (q976 #q11)
          :precondition (and (isbconf q976) (isbconf #q11))
          :effect (basemotion q976 #t48 #q11)
   )
   (:action s85_plan-base-motion
          :parameters (q976 #q12)
          :precondition (and (isbconf q976) (isbconf #q12))
          :effect (basemotion q976 #t49 #q12)
   )
   (:action s86_plan-base-motion
          :parameters (q976 #q13)
          :precondition (and (isbconf q976) (isbconf #q13))
          :effect (basemotion q976 #t50 #q13)
   )
   (:action s87_plan-base-motion
          :parameters (q976 #q14)
          :precondition (and (isbconf q976) (isbconf #q14))
          :effect (basemotion q976 #t51 #q14)
   )
   (:action s88_plan-base-motion
          :parameters (q976 #q15)
          :precondition (and (isbconf q976) (isbconf #q15))
          :effect (basemotion q976 #t52 #q15)
   )
   (:action s89_plan-base-motion
          :parameters (q976 #q16)
          :precondition (and (isbconf q976) (isbconf #q16))
          :effect (basemotion q976 #t53 #q16)
   )
   (:action s90_plan-base-motion
          :parameters (q976 #q17)
          :precondition (and (isbconf q976) (isbconf #q17))
          :effect (basemotion q976 #t54 #q17)
   )
   (:action s91_plan-base-motion
          :parameters (q976 #q18)
          :precondition (and (isbconf q976) (isbconf #q18))
          :effect (basemotion q976 #t55 #q18)
   )
   (:action s92_plan-base-motion
          :parameters (q976 #q19)
          :precondition (and (isbconf q976) (isbconf #q19))
          :effect (basemotion q976 #t56 #q19)
   )
   (:action s93_plan-base-motion
          :parameters (q976 #q20)
          :precondition (and (isbconf q976) (isbconf #q20))
          :effect (basemotion q976 #t57 #q20)
   )
   (:action s94_plan-base-motion
          :parameters (q976 #q21)
          :precondition (and (isbconf q976) (isbconf #q21))
          :effect (basemotion q976 #t58 #q21)
   )
   (:action s95_plan-base-motion
          :parameters (q976 #q22)
          :precondition (and (isbconf q976) (isbconf #q22))
          :effect (basemotion q976 #t59 #q22)
   )
   (:action s96_plan-base-motion
          :parameters (q976 #q23)
          :precondition (and (isbconf q976) (isbconf #q23))
          :effect (basemotion q976 #t60 #q23)
   )
   (:action s97_plan-base-motion
          :parameters (q976 #q24)
          :precondition (and (isbconf q976) (isbconf #q24))
          :effect (basemotion q976 #t61 #q24)
   )
   (:action s98_plan-base-motion
          :parameters (q976 #q25)
          :precondition (and (isbconf q976) (isbconf #q25))
          :effect (basemotion q976 #t62 #q25)
   )
   (:action s99_plan-base-motion
          :parameters (q976 #q26)
          :precondition (and (isbconf q976) (isbconf #q26))
          :effect (basemotion q976 #t63 #q26)
   )
   (:action s100_plan-base-motion
          :parameters (q976 #q27)
          :precondition (and (isbconf q976) (isbconf #q27))
          :effect (basemotion q976 #t64 #q27)
   )
   (:action s101_plan-base-motion
          :parameters (q976 #q28)
          :precondition (and (isbconf q976) (isbconf #q28))
          :effect (basemotion q976 #t65 #q28)
   )
   (:action s102_plan-base-motion
          :parameters (q976 #q29)
          :precondition (and (isbconf q976) (isbconf #q29))
          :effect (basemotion q976 #t66 #q29)
   )
   (:action s103_plan-base-motion
          :parameters (q976 #q30)
          :precondition (and (isbconf q976) (isbconf #q30))
          :effect (basemotion q976 #t67 #q30)
   )
   (:action s104_plan-base-motion
          :parameters (q976 #q31)
          :precondition (and (isbconf q976) (isbconf #q31))
          :effect (basemotion q976 #t68 #q31)
   )
   (:action s105_plan-base-motion
          :parameters (q976 #q32)
          :precondition (and (isbconf q976) (isbconf #q32))
          :effect (basemotion q976 #t69 #q32)
   )
   (:action s106_plan-base-motion
          :parameters (q976 #q33)
          :precondition (and (isbconf q976) (isbconf #q33))
          :effect (basemotion q976 #t70 #q33)
   )
   (:action s107_plan-base-motion
          :parameters (q976 #q34)
          :precondition (and (isbconf q976) (isbconf #q34))
          :effect (basemotion q976 #t71 #q34)
   )
   (:action s108_plan-base-motion
          :parameters (q976 #q35)
          :precondition (and (isbconf q976) (isbconf #q35))
          :effect (basemotion q976 #t72 #q35)
   )
   (:action s109_plan-base-motion
          :parameters (#q0 q976)
          :precondition (and (isbconf #q0) (isbconf q976))
          :effect (basemotion #q0 #t73 q976)
   )
   (:action s110_plan-base-motion
          :parameters (#q0 #q0)
          :precondition (and (isbconf #q0) (isbconf #q0))
          :effect (basemotion #q0 #t74 #q0)
   )
   (:action s111_plan-base-motion
          :parameters (#q0 #q1)
          :precondition (and (isbconf #q0) (isbconf #q1))
          :effect (basemotion #q0 #t75 #q1)
   )
   (:action s112_plan-base-motion
          :parameters (#q0 #q2)
          :precondition (and (isbconf #q0) (isbconf #q2))
          :effect (basemotion #q0 #t76 #q2)
   )
   (:action s113_plan-base-motion
          :parameters (#q0 #q3)
          :precondition (and (isbconf #q0) (isbconf #q3))
          :effect (basemotion #q0 #t77 #q3)
   )
   (:action s114_plan-base-motion
          :parameters (#q0 #q4)
          :precondition (and (isbconf #q0) (isbconf #q4))
          :effect (basemotion #q0 #t78 #q4)
   )
   (:action s115_plan-base-motion
          :parameters (#q0 #q5)
          :precondition (and (isbconf #q0) (isbconf #q5))
          :effect (basemotion #q0 #t79 #q5)
   )
   (:action s116_plan-base-motion
          :parameters (#q0 #q6)
          :precondition (and (isbconf #q0) (isbconf #q6))
          :effect (basemotion #q0 #t80 #q6)
   )
   (:action s117_plan-base-motion
          :parameters (#q0 #q7)
          :precondition (and (isbconf #q0) (isbconf #q7))
          :effect (basemotion #q0 #t81 #q7)
   )
   (:action s118_plan-base-motion
          :parameters (#q0 #q8)
          :precondition (and (isbconf #q0) (isbconf #q8))
          :effect (basemotion #q0 #t82 #q8)
   )
   (:action s119_plan-base-motion
          :parameters (#q0 #q9)
          :precondition (and (isbconf #q0) (isbconf #q9))
          :effect (basemotion #q0 #t83 #q9)
   )
   (:action s120_plan-base-motion
          :parameters (#q0 #q10)
          :precondition (and (isbconf #q0) (isbconf #q10))
          :effect (basemotion #q0 #t84 #q10)
   )
   (:action s121_plan-base-motion
          :parameters (#q0 #q11)
          :precondition (and (isbconf #q0) (isbconf #q11))
          :effect (basemotion #q0 #t85 #q11)
   )
   (:action s122_plan-base-motion
          :parameters (#q0 #q12)
          :precondition (and (isbconf #q0) (isbconf #q12))
          :effect (basemotion #q0 #t86 #q12)
   )
   (:action s123_plan-base-motion
          :parameters (#q0 #q13)
          :precondition (and (isbconf #q0) (isbconf #q13))
          :effect (basemotion #q0 #t87 #q13)
   )
   (:action s124_plan-base-motion
          :parameters (#q0 #q14)
          :precondition (and (isbconf #q0) (isbconf #q14))
          :effect (basemotion #q0 #t88 #q14)
   )
   (:action s125_plan-base-motion
          :parameters (#q0 #q15)
          :precondition (and (isbconf #q0) (isbconf #q15))
          :effect (basemotion #q0 #t89 #q15)
   )
   (:action s126_plan-base-motion
          :parameters (#q0 #q16)
          :precondition (and (isbconf #q0) (isbconf #q16))
          :effect (basemotion #q0 #t90 #q16)
   )
   (:action s127_plan-base-motion
          :parameters (#q0 #q17)
          :precondition (and (isbconf #q0) (isbconf #q17))
          :effect (basemotion #q0 #t91 #q17)
   )
   (:action s128_plan-base-motion
          :parameters (#q0 #q18)
          :precondition (and (isbconf #q0) (isbconf #q18))
          :effect (basemotion #q0 #t92 #q18)
   )
   (:action s129_plan-base-motion
          :parameters (#q0 #q19)
          :precondition (and (isbconf #q0) (isbconf #q19))
          :effect (basemotion #q0 #t93 #q19)
   )
   (:action s130_plan-base-motion
          :parameters (#q0 #q20)
          :precondition (and (isbconf #q0) (isbconf #q20))
          :effect (basemotion #q0 #t94 #q20)
   )
   (:action s131_plan-base-motion
          :parameters (#q0 #q21)
          :precondition (and (isbconf #q0) (isbconf #q21))
          :effect (basemotion #q0 #t95 #q21)
   )
   (:action s132_plan-base-motion
          :parameters (#q0 #q22)
          :precondition (and (isbconf #q0) (isbconf #q22))
          :effect (basemotion #q0 #t96 #q22)
   )
   (:action s133_plan-base-motion
          :parameters (#q0 #q23)
          :precondition (and (isbconf #q0) (isbconf #q23))
          :effect (basemotion #q0 #t97 #q23)
   )
   (:action s134_plan-base-motion
          :parameters (#q0 #q24)
          :precondition (and (isbconf #q0) (isbconf #q24))
          :effect (basemotion #q0 #t98 #q24)
   )
   (:action s135_plan-base-motion
          :parameters (#q0 #q25)
          :precondition (and (isbconf #q0) (isbconf #q25))
          :effect (basemotion #q0 #t99 #q25)
   )
   (:action s136_plan-base-motion
          :parameters (#q0 #q26)
          :precondition (and (isbconf #q0) (isbconf #q26))
          :effect (basemotion #q0 #t100 #q26)
   )
   (:action s137_plan-base-motion
          :parameters (#q0 #q27)
          :precondition (and (isbconf #q0) (isbconf #q27))
          :effect (basemotion #q0 #t101 #q27)
   )
   (:action s138_plan-base-motion
          :parameters (#q0 #q28)
          :precondition (and (isbconf #q0) (isbconf #q28))
          :effect (basemotion #q0 #t102 #q28)
   )
   (:action s139_plan-base-motion
          :parameters (#q0 #q29)
          :precondition (and (isbconf #q0) (isbconf #q29))
          :effect (basemotion #q0 #t103 #q29)
   )
   (:action s140_plan-base-motion
          :parameters (#q0 #q30)
          :precondition (and (isbconf #q0) (isbconf #q30))
          :effect (basemotion #q0 #t104 #q30)
   )
   (:action s141_plan-base-motion
          :parameters (#q0 #q31)
          :precondition (and (isbconf #q0) (isbconf #q31))
          :effect (basemotion #q0 #t105 #q31)
   )
   (:action s142_plan-base-motion
          :parameters (#q0 #q32)
          :precondition (and (isbconf #q0) (isbconf #q32))
          :effect (basemotion #q0 #t106 #q32)
   )
   (:action s143_plan-base-motion
          :parameters (#q0 #q33)
          :precondition (and (isbconf #q0) (isbconf #q33))
          :effect (basemotion #q0 #t107 #q33)
   )
   (:action s144_plan-base-motion
          :parameters (#q0 #q34)
          :precondition (and (isbconf #q0) (isbconf #q34))
          :effect (basemotion #q0 #t108 #q34)
   )
   (:action s145_plan-base-motion
          :parameters (#q0 #q35)
          :precondition (and (isbconf #q0) (isbconf #q35))
          :effect (basemotion #q0 #t109 #q35)
   )
   (:action s146_plan-base-motion
          :parameters (#q1 q976)
          :precondition (and (isbconf #q1) (isbconf q976))
          :effect (basemotion #q1 #t110 q976)
   )
   (:action s147_plan-base-motion
          :parameters (#q1 #q0)
          :precondition (and (isbconf #q1) (isbconf #q0))
          :effect (basemotion #q1 #t111 #q0)
   )
   (:action s148_plan-base-motion
          :parameters (#q1 #q1)
          :precondition (and (isbconf #q1) (isbconf #q1))
          :effect (basemotion #q1 #t112 #q1)
   )
   (:action s149_plan-base-motion
          :parameters (#q1 #q2)
          :precondition (and (isbconf #q1) (isbconf #q2))
          :effect (basemotion #q1 #t113 #q2)
   )
   (:action s150_plan-base-motion
          :parameters (#q1 #q3)
          :precondition (and (isbconf #q1) (isbconf #q3))
          :effect (basemotion #q1 #t114 #q3)
   )
   (:action s151_plan-base-motion
          :parameters (#q1 #q4)
          :precondition (and (isbconf #q1) (isbconf #q4))
          :effect (basemotion #q1 #t115 #q4)
   )
   (:action s152_plan-base-motion
          :parameters (#q1 #q5)
          :precondition (and (isbconf #q1) (isbconf #q5))
          :effect (basemotion #q1 #t116 #q5)
   )
   (:action s153_plan-base-motion
          :parameters (#q1 #q6)
          :precondition (and (isbconf #q1) (isbconf #q6))
          :effect (basemotion #q1 #t117 #q6)
   )
   (:action s154_plan-base-motion
          :parameters (#q1 #q7)
          :precondition (and (isbconf #q1) (isbconf #q7))
          :effect (basemotion #q1 #t118 #q7)
   )
   (:action s155_plan-base-motion
          :parameters (#q1 #q8)
          :precondition (and (isbconf #q1) (isbconf #q8))
          :effect (basemotion #q1 #t119 #q8)
   )
   (:action s156_plan-base-motion
          :parameters (#q1 #q9)
          :precondition (and (isbconf #q1) (isbconf #q9))
          :effect (basemotion #q1 #t120 #q9)
   )
   (:action s157_plan-base-motion
          :parameters (#q1 #q10)
          :precondition (and (isbconf #q1) (isbconf #q10))
          :effect (basemotion #q1 #t121 #q10)
   )
   (:action s158_plan-base-motion
          :parameters (#q1 #q11)
          :precondition (and (isbconf #q1) (isbconf #q11))
          :effect (basemotion #q1 #t122 #q11)
   )
   (:action s159_plan-base-motion
          :parameters (#q1 #q12)
          :precondition (and (isbconf #q1) (isbconf #q12))
          :effect (basemotion #q1 #t123 #q12)
   )
   (:action s160_plan-base-motion
          :parameters (#q1 #q13)
          :precondition (and (isbconf #q1) (isbconf #q13))
          :effect (basemotion #q1 #t124 #q13)
   )
   (:action s161_plan-base-motion
          :parameters (#q1 #q14)
          :precondition (and (isbconf #q1) (isbconf #q14))
          :effect (basemotion #q1 #t125 #q14)
   )
   (:action s162_plan-base-motion
          :parameters (#q1 #q15)
          :precondition (and (isbconf #q1) (isbconf #q15))
          :effect (basemotion #q1 #t126 #q15)
   )
   (:action s163_plan-base-motion
          :parameters (#q1 #q16)
          :precondition (and (isbconf #q1) (isbconf #q16))
          :effect (basemotion #q1 #t127 #q16)
   )
   (:action s164_plan-base-motion
          :parameters (#q1 #q17)
          :precondition (and (isbconf #q1) (isbconf #q17))
          :effect (basemotion #q1 #t128 #q17)
   )
   (:action s165_plan-base-motion
          :parameters (#q1 #q18)
          :precondition (and (isbconf #q1) (isbconf #q18))
          :effect (basemotion #q1 #t129 #q18)
   )
   (:action s166_plan-base-motion
          :parameters (#q1 #q19)
          :precondition (and (isbconf #q1) (isbconf #q19))
          :effect (basemotion #q1 #t130 #q19)
   )
   (:action s167_plan-base-motion
          :parameters (#q1 #q20)
          :precondition (and (isbconf #q1) (isbconf #q20))
          :effect (basemotion #q1 #t131 #q20)
   )
   (:action s168_plan-base-motion
          :parameters (#q1 #q21)
          :precondition (and (isbconf #q1) (isbconf #q21))
          :effect (basemotion #q1 #t132 #q21)
   )
   (:action s169_plan-base-motion
          :parameters (#q1 #q22)
          :precondition (and (isbconf #q1) (isbconf #q22))
          :effect (basemotion #q1 #t133 #q22)
   )
   (:action s170_plan-base-motion
          :parameters (#q1 #q23)
          :precondition (and (isbconf #q1) (isbconf #q23))
          :effect (basemotion #q1 #t134 #q23)
   )
   (:action s171_plan-base-motion
          :parameters (#q1 #q24)
          :precondition (and (isbconf #q1) (isbconf #q24))
          :effect (basemotion #q1 #t135 #q24)
   )
   (:action s172_plan-base-motion
          :parameters (#q1 #q25)
          :precondition (and (isbconf #q1) (isbconf #q25))
          :effect (basemotion #q1 #t136 #q25)
   )
   (:action s173_plan-base-motion
          :parameters (#q1 #q26)
          :precondition (and (isbconf #q1) (isbconf #q26))
          :effect (basemotion #q1 #t137 #q26)
   )
   (:action s174_plan-base-motion
          :parameters (#q1 #q27)
          :precondition (and (isbconf #q1) (isbconf #q27))
          :effect (basemotion #q1 #t138 #q27)
   )
   (:action s175_plan-base-motion
          :parameters (#q1 #q28)
          :precondition (and (isbconf #q1) (isbconf #q28))
          :effect (basemotion #q1 #t139 #q28)
   )
   (:action s176_plan-base-motion
          :parameters (#q1 #q29)
          :precondition (and (isbconf #q1) (isbconf #q29))
          :effect (basemotion #q1 #t140 #q29)
   )
   (:action s177_plan-base-motion
          :parameters (#q1 #q30)
          :precondition (and (isbconf #q1) (isbconf #q30))
          :effect (basemotion #q1 #t141 #q30)
   )
   (:action s178_plan-base-motion
          :parameters (#q1 #q31)
          :precondition (and (isbconf #q1) (isbconf #q31))
          :effect (basemotion #q1 #t142 #q31)
   )
   (:action s179_plan-base-motion
          :parameters (#q1 #q32)
          :precondition (and (isbconf #q1) (isbconf #q32))
          :effect (basemotion #q1 #t143 #q32)
   )
   (:action s180_plan-base-motion
          :parameters (#q1 #q33)
          :precondition (and (isbconf #q1) (isbconf #q33))
          :effect (basemotion #q1 #t144 #q33)
   )
   (:action s181_plan-base-motion
          :parameters (#q1 #q34)
          :precondition (and (isbconf #q1) (isbconf #q34))
          :effect (basemotion #q1 #t145 #q34)
   )
   (:action s182_plan-base-motion
          :parameters (#q1 #q35)
          :precondition (and (isbconf #q1) (isbconf #q35))
          :effect (basemotion #q1 #t146 #q35)
   )
   (:action s183_plan-base-motion
          :parameters (#q2 q976)
          :precondition (and (isbconf #q2) (isbconf q976))
          :effect (basemotion #q2 #t147 q976)
   )
   (:action s184_plan-base-motion
          :parameters (#q2 #q0)
          :precondition (and (isbconf #q2) (isbconf #q0))
          :effect (basemotion #q2 #t148 #q0)
   )
   (:action s185_plan-base-motion
          :parameters (#q2 #q1)
          :precondition (and (isbconf #q2) (isbconf #q1))
          :effect (basemotion #q2 #t149 #q1)
   )
   (:action s186_plan-base-motion
          :parameters (#q2 #q2)
          :precondition (and (isbconf #q2) (isbconf #q2))
          :effect (basemotion #q2 #t150 #q2)
   )
   (:action s187_plan-base-motion
          :parameters (#q2 #q3)
          :precondition (and (isbconf #q2) (isbconf #q3))
          :effect (basemotion #q2 #t151 #q3)
   )
   (:action s188_plan-base-motion
          :parameters (#q2 #q4)
          :precondition (and (isbconf #q2) (isbconf #q4))
          :effect (basemotion #q2 #t152 #q4)
   )
   (:action s189_plan-base-motion
          :parameters (#q2 #q5)
          :precondition (and (isbconf #q2) (isbconf #q5))
          :effect (basemotion #q2 #t153 #q5)
   )
   (:action s190_plan-base-motion
          :parameters (#q2 #q6)
          :precondition (and (isbconf #q2) (isbconf #q6))
          :effect (basemotion #q2 #t154 #q6)
   )
   (:action s191_plan-base-motion
          :parameters (#q2 #q7)
          :precondition (and (isbconf #q2) (isbconf #q7))
          :effect (basemotion #q2 #t155 #q7)
   )
   (:action s192_plan-base-motion
          :parameters (#q2 #q8)
          :precondition (and (isbconf #q2) (isbconf #q8))
          :effect (basemotion #q2 #t156 #q8)
   )
   (:action s193_plan-base-motion
          :parameters (#q2 #q9)
          :precondition (and (isbconf #q2) (isbconf #q9))
          :effect (basemotion #q2 #t157 #q9)
   )
   (:action s194_plan-base-motion
          :parameters (#q2 #q10)
          :precondition (and (isbconf #q2) (isbconf #q10))
          :effect (basemotion #q2 #t158 #q10)
   )
   (:action s195_plan-base-motion
          :parameters (#q2 #q11)
          :precondition (and (isbconf #q2) (isbconf #q11))
          :effect (basemotion #q2 #t159 #q11)
   )
   (:action s196_plan-base-motion
          :parameters (#q2 #q12)
          :precondition (and (isbconf #q2) (isbconf #q12))
          :effect (basemotion #q2 #t160 #q12)
   )
   (:action s197_plan-base-motion
          :parameters (#q2 #q13)
          :precondition (and (isbconf #q2) (isbconf #q13))
          :effect (basemotion #q2 #t161 #q13)
   )
   (:action s198_plan-base-motion
          :parameters (#q2 #q14)
          :precondition (and (isbconf #q2) (isbconf #q14))
          :effect (basemotion #q2 #t162 #q14)
   )
   (:action s199_plan-base-motion
          :parameters (#q2 #q15)
          :precondition (and (isbconf #q2) (isbconf #q15))
          :effect (basemotion #q2 #t163 #q15)
   )
   (:action s200_plan-base-motion
          :parameters (#q2 #q16)
          :precondition (and (isbconf #q2) (isbconf #q16))
          :effect (basemotion #q2 #t164 #q16)
   )
   (:action s201_plan-base-motion
          :parameters (#q2 #q17)
          :precondition (and (isbconf #q2) (isbconf #q17))
          :effect (basemotion #q2 #t165 #q17)
   )
   (:action s202_plan-base-motion
          :parameters (#q2 #q18)
          :precondition (and (isbconf #q2) (isbconf #q18))
          :effect (basemotion #q2 #t166 #q18)
   )
   (:action s203_plan-base-motion
          :parameters (#q2 #q19)
          :precondition (and (isbconf #q2) (isbconf #q19))
          :effect (basemotion #q2 #t167 #q19)
   )
   (:action s204_plan-base-motion
          :parameters (#q2 #q20)
          :precondition (and (isbconf #q2) (isbconf #q20))
          :effect (basemotion #q2 #t168 #q20)
   )
   (:action s205_plan-base-motion
          :parameters (#q2 #q21)
          :precondition (and (isbconf #q2) (isbconf #q21))
          :effect (basemotion #q2 #t169 #q21)
   )
   (:action s206_plan-base-motion
          :parameters (#q2 #q22)
          :precondition (and (isbconf #q2) (isbconf #q22))
          :effect (basemotion #q2 #t170 #q22)
   )
   (:action s207_plan-base-motion
          :parameters (#q2 #q23)
          :precondition (and (isbconf #q2) (isbconf #q23))
          :effect (basemotion #q2 #t171 #q23)
   )
   (:action s208_plan-base-motion
          :parameters (#q2 #q24)
          :precondition (and (isbconf #q2) (isbconf #q24))
          :effect (basemotion #q2 #t172 #q24)
   )
   (:action s209_plan-base-motion
          :parameters (#q2 #q25)
          :precondition (and (isbconf #q2) (isbconf #q25))
          :effect (basemotion #q2 #t173 #q25)
   )
   (:action s210_plan-base-motion
          :parameters (#q2 #q26)
          :precondition (and (isbconf #q2) (isbconf #q26))
          :effect (basemotion #q2 #t174 #q26)
   )
   (:action s211_plan-base-motion
          :parameters (#q2 #q27)
          :precondition (and (isbconf #q2) (isbconf #q27))
          :effect (basemotion #q2 #t175 #q27)
   )
   (:action s212_plan-base-motion
          :parameters (#q2 #q28)
          :precondition (and (isbconf #q2) (isbconf #q28))
          :effect (basemotion #q2 #t176 #q28)
   )
   (:action s213_plan-base-motion
          :parameters (#q2 #q29)
          :precondition (and (isbconf #q2) (isbconf #q29))
          :effect (basemotion #q2 #t177 #q29)
   )
   (:action s214_plan-base-motion
          :parameters (#q2 #q30)
          :precondition (and (isbconf #q2) (isbconf #q30))
          :effect (basemotion #q2 #t178 #q30)
   )
   (:action s215_plan-base-motion
          :parameters (#q2 #q31)
          :precondition (and (isbconf #q2) (isbconf #q31))
          :effect (basemotion #q2 #t179 #q31)
   )
   (:action s216_plan-base-motion
          :parameters (#q2 #q32)
          :precondition (and (isbconf #q2) (isbconf #q32))
          :effect (basemotion #q2 #t180 #q32)
   )
   (:action s217_plan-base-motion
          :parameters (#q2 #q33)
          :precondition (and (isbconf #q2) (isbconf #q33))
          :effect (basemotion #q2 #t181 #q33)
   )
   (:action s218_plan-base-motion
          :parameters (#q2 #q34)
          :precondition (and (isbconf #q2) (isbconf #q34))
          :effect (basemotion #q2 #t182 #q34)
   )
   (:action s219_plan-base-motion
          :parameters (#q2 #q35)
          :precondition (and (isbconf #q2) (isbconf #q35))
          :effect (basemotion #q2 #t183 #q35)
   )
   (:action s220_plan-base-motion
          :parameters (#q3 q976)
          :precondition (and (isbconf #q3) (isbconf q976))
          :effect (basemotion #q3 #t184 q976)
   )
   (:action s221_plan-base-motion
          :parameters (#q3 #q0)
          :precondition (and (isbconf #q3) (isbconf #q0))
          :effect (basemotion #q3 #t185 #q0)
   )
   (:action s222_plan-base-motion
          :parameters (#q3 #q1)
          :precondition (and (isbconf #q3) (isbconf #q1))
          :effect (basemotion #q3 #t186 #q1)
   )
   (:action s223_plan-base-motion
          :parameters (#q3 #q2)
          :precondition (and (isbconf #q3) (isbconf #q2))
          :effect (basemotion #q3 #t187 #q2)
   )
   (:action s224_plan-base-motion
          :parameters (#q3 #q3)
          :precondition (and (isbconf #q3) (isbconf #q3))
          :effect (basemotion #q3 #t188 #q3)
   )
   (:action s225_plan-base-motion
          :parameters (#q3 #q4)
          :precondition (and (isbconf #q3) (isbconf #q4))
          :effect (basemotion #q3 #t189 #q4)
   )
   (:action s226_plan-base-motion
          :parameters (#q3 #q5)
          :precondition (and (isbconf #q3) (isbconf #q5))
          :effect (basemotion #q3 #t190 #q5)
   )
   (:action s227_plan-base-motion
          :parameters (#q3 #q6)
          :precondition (and (isbconf #q3) (isbconf #q6))
          :effect (basemotion #q3 #t191 #q6)
   )
   (:action s228_plan-base-motion
          :parameters (#q3 #q7)
          :precondition (and (isbconf #q3) (isbconf #q7))
          :effect (basemotion #q3 #t192 #q7)
   )
   (:action s229_plan-base-motion
          :parameters (#q3 #q8)
          :precondition (and (isbconf #q3) (isbconf #q8))
          :effect (basemotion #q3 #t193 #q8)
   )
   (:action s230_plan-base-motion
          :parameters (#q3 #q9)
          :precondition (and (isbconf #q3) (isbconf #q9))
          :effect (basemotion #q3 #t194 #q9)
   )
   (:action s231_plan-base-motion
          :parameters (#q3 #q10)
          :precondition (and (isbconf #q3) (isbconf #q10))
          :effect (basemotion #q3 #t195 #q10)
   )
   (:action s232_plan-base-motion
          :parameters (#q3 #q11)
          :precondition (and (isbconf #q3) (isbconf #q11))
          :effect (basemotion #q3 #t196 #q11)
   )
   (:action s233_plan-base-motion
          :parameters (#q3 #q12)
          :precondition (and (isbconf #q3) (isbconf #q12))
          :effect (basemotion #q3 #t197 #q12)
   )
   (:action s234_plan-base-motion
          :parameters (#q3 #q13)
          :precondition (and (isbconf #q3) (isbconf #q13))
          :effect (basemotion #q3 #t198 #q13)
   )
   (:action s235_plan-base-motion
          :parameters (#q3 #q14)
          :precondition (and (isbconf #q3) (isbconf #q14))
          :effect (basemotion #q3 #t199 #q14)
   )
   (:action s236_plan-base-motion
          :parameters (#q3 #q15)
          :precondition (and (isbconf #q3) (isbconf #q15))
          :effect (basemotion #q3 #t200 #q15)
   )
   (:action s237_plan-base-motion
          :parameters (#q3 #q16)
          :precondition (and (isbconf #q3) (isbconf #q16))
          :effect (basemotion #q3 #t201 #q16)
   )
   (:action s238_plan-base-motion
          :parameters (#q3 #q17)
          :precondition (and (isbconf #q3) (isbconf #q17))
          :effect (basemotion #q3 #t202 #q17)
   )
   (:action s239_plan-base-motion
          :parameters (#q3 #q18)
          :precondition (and (isbconf #q3) (isbconf #q18))
          :effect (basemotion #q3 #t203 #q18)
   )
   (:action s240_plan-base-motion
          :parameters (#q3 #q19)
          :precondition (and (isbconf #q3) (isbconf #q19))
          :effect (basemotion #q3 #t204 #q19)
   )
   (:action s241_plan-base-motion
          :parameters (#q3 #q20)
          :precondition (and (isbconf #q3) (isbconf #q20))
          :effect (basemotion #q3 #t205 #q20)
   )
   (:action s242_plan-base-motion
          :parameters (#q3 #q21)
          :precondition (and (isbconf #q3) (isbconf #q21))
          :effect (basemotion #q3 #t206 #q21)
   )
   (:action s243_plan-base-motion
          :parameters (#q3 #q22)
          :precondition (and (isbconf #q3) (isbconf #q22))
          :effect (basemotion #q3 #t207 #q22)
   )
   (:action s244_plan-base-motion
          :parameters (#q3 #q23)
          :precondition (and (isbconf #q3) (isbconf #q23))
          :effect (basemotion #q3 #t208 #q23)
   )
   (:action s245_plan-base-motion
          :parameters (#q3 #q24)
          :precondition (and (isbconf #q3) (isbconf #q24))
          :effect (basemotion #q3 #t209 #q24)
   )
   (:action s246_plan-base-motion
          :parameters (#q3 #q25)
          :precondition (and (isbconf #q3) (isbconf #q25))
          :effect (basemotion #q3 #t210 #q25)
   )
   (:action s247_plan-base-motion
          :parameters (#q3 #q26)
          :precondition (and (isbconf #q3) (isbconf #q26))
          :effect (basemotion #q3 #t211 #q26)
   )
   (:action s248_plan-base-motion
          :parameters (#q3 #q27)
          :precondition (and (isbconf #q3) (isbconf #q27))
          :effect (basemotion #q3 #t212 #q27)
   )
   (:action s249_plan-base-motion
          :parameters (#q3 #q28)
          :precondition (and (isbconf #q3) (isbconf #q28))
          :effect (basemotion #q3 #t213 #q28)
   )
   (:action s250_plan-base-motion
          :parameters (#q3 #q29)
          :precondition (and (isbconf #q3) (isbconf #q29))
          :effect (basemotion #q3 #t214 #q29)
   )
   (:action s251_plan-base-motion
          :parameters (#q3 #q30)
          :precondition (and (isbconf #q3) (isbconf #q30))
          :effect (basemotion #q3 #t215 #q30)
   )
   (:action s252_plan-base-motion
          :parameters (#q3 #q31)
          :precondition (and (isbconf #q3) (isbconf #q31))
          :effect (basemotion #q3 #t216 #q31)
   )
   (:action s253_plan-base-motion
          :parameters (#q3 #q32)
          :precondition (and (isbconf #q3) (isbconf #q32))
          :effect (basemotion #q3 #t217 #q32)
   )
   (:action s254_plan-base-motion
          :parameters (#q3 #q33)
          :precondition (and (isbconf #q3) (isbconf #q33))
          :effect (basemotion #q3 #t218 #q33)
   )
   (:action s255_plan-base-motion
          :parameters (#q3 #q34)
          :precondition (and (isbconf #q3) (isbconf #q34))
          :effect (basemotion #q3 #t219 #q34)
   )
   (:action s256_plan-base-motion
          :parameters (#q3 #q35)
          :precondition (and (isbconf #q3) (isbconf #q35))
          :effect (basemotion #q3 #t220 #q35)
   )
   (:action s257_plan-base-motion
          :parameters (#q4 q976)
          :precondition (and (isbconf #q4) (isbconf q976))
          :effect (basemotion #q4 #t221 q976)
   )
   (:action s258_plan-base-motion
          :parameters (#q4 #q0)
          :precondition (and (isbconf #q4) (isbconf #q0))
          :effect (basemotion #q4 #t222 #q0)
   )
   (:action s259_plan-base-motion
          :parameters (#q4 #q1)
          :precondition (and (isbconf #q4) (isbconf #q1))
          :effect (basemotion #q4 #t223 #q1)
   )
   (:action s260_plan-base-motion
          :parameters (#q4 #q2)
          :precondition (and (isbconf #q4) (isbconf #q2))
          :effect (basemotion #q4 #t224 #q2)
   )
   (:action s261_plan-base-motion
          :parameters (#q4 #q3)
          :precondition (and (isbconf #q4) (isbconf #q3))
          :effect (basemotion #q4 #t225 #q3)
   )
   (:action s262_plan-base-motion
          :parameters (#q4 #q4)
          :precondition (and (isbconf #q4) (isbconf #q4))
          :effect (basemotion #q4 #t226 #q4)
   )
   (:action s263_plan-base-motion
          :parameters (#q4 #q5)
          :precondition (and (isbconf #q4) (isbconf #q5))
          :effect (basemotion #q4 #t227 #q5)
   )
   (:action s264_plan-base-motion
          :parameters (#q4 #q6)
          :precondition (and (isbconf #q4) (isbconf #q6))
          :effect (basemotion #q4 #t228 #q6)
   )
   (:action s265_plan-base-motion
          :parameters (#q4 #q7)
          :precondition (and (isbconf #q4) (isbconf #q7))
          :effect (basemotion #q4 #t229 #q7)
   )
   (:action s266_plan-base-motion
          :parameters (#q4 #q8)
          :precondition (and (isbconf #q4) (isbconf #q8))
          :effect (basemotion #q4 #t230 #q8)
   )
   (:action s267_plan-base-motion
          :parameters (#q4 #q9)
          :precondition (and (isbconf #q4) (isbconf #q9))
          :effect (basemotion #q4 #t231 #q9)
   )
   (:action s268_plan-base-motion
          :parameters (#q4 #q10)
          :precondition (and (isbconf #q4) (isbconf #q10))
          :effect (basemotion #q4 #t232 #q10)
   )
   (:action s269_plan-base-motion
          :parameters (#q4 #q11)
          :precondition (and (isbconf #q4) (isbconf #q11))
          :effect (basemotion #q4 #t233 #q11)
   )
   (:action s270_plan-base-motion
          :parameters (#q4 #q12)
          :precondition (and (isbconf #q4) (isbconf #q12))
          :effect (basemotion #q4 #t234 #q12)
   )
   (:action s271_plan-base-motion
          :parameters (#q4 #q13)
          :precondition (and (isbconf #q4) (isbconf #q13))
          :effect (basemotion #q4 #t235 #q13)
   )
   (:action s272_plan-base-motion
          :parameters (#q4 #q14)
          :precondition (and (isbconf #q4) (isbconf #q14))
          :effect (basemotion #q4 #t236 #q14)
   )
   (:action s273_plan-base-motion
          :parameters (#q4 #q15)
          :precondition (and (isbconf #q4) (isbconf #q15))
          :effect (basemotion #q4 #t237 #q15)
   )
   (:action s274_plan-base-motion
          :parameters (#q4 #q16)
          :precondition (and (isbconf #q4) (isbconf #q16))
          :effect (basemotion #q4 #t238 #q16)
   )
   (:action s275_plan-base-motion
          :parameters (#q4 #q17)
          :precondition (and (isbconf #q4) (isbconf #q17))
          :effect (basemotion #q4 #t239 #q17)
   )
   (:action s276_plan-base-motion
          :parameters (#q4 #q18)
          :precondition (and (isbconf #q4) (isbconf #q18))
          :effect (basemotion #q4 #t240 #q18)
   )
   (:action s277_plan-base-motion
          :parameters (#q4 #q19)
          :precondition (and (isbconf #q4) (isbconf #q19))
          :effect (basemotion #q4 #t241 #q19)
   )
   (:action s278_plan-base-motion
          :parameters (#q4 #q20)
          :precondition (and (isbconf #q4) (isbconf #q20))
          :effect (basemotion #q4 #t242 #q20)
   )
   (:action s279_plan-base-motion
          :parameters (#q4 #q21)
          :precondition (and (isbconf #q4) (isbconf #q21))
          :effect (basemotion #q4 #t243 #q21)
   )
   (:action s280_plan-base-motion
          :parameters (#q4 #q22)
          :precondition (and (isbconf #q4) (isbconf #q22))
          :effect (basemotion #q4 #t244 #q22)
   )
   (:action s281_plan-base-motion
          :parameters (#q4 #q23)
          :precondition (and (isbconf #q4) (isbconf #q23))
          :effect (basemotion #q4 #t245 #q23)
   )
   (:action s282_plan-base-motion
          :parameters (#q4 #q24)
          :precondition (and (isbconf #q4) (isbconf #q24))
          :effect (basemotion #q4 #t246 #q24)
   )
   (:action s283_plan-base-motion
          :parameters (#q4 #q25)
          :precondition (and (isbconf #q4) (isbconf #q25))
          :effect (basemotion #q4 #t247 #q25)
   )
   (:action s284_plan-base-motion
          :parameters (#q4 #q26)
          :precondition (and (isbconf #q4) (isbconf #q26))
          :effect (basemotion #q4 #t248 #q26)
   )
   (:action s285_plan-base-motion
          :parameters (#q4 #q27)
          :precondition (and (isbconf #q4) (isbconf #q27))
          :effect (basemotion #q4 #t249 #q27)
   )
   (:action s286_plan-base-motion
          :parameters (#q4 #q28)
          :precondition (and (isbconf #q4) (isbconf #q28))
          :effect (basemotion #q4 #t250 #q28)
   )
   (:action s287_plan-base-motion
          :parameters (#q4 #q29)
          :precondition (and (isbconf #q4) (isbconf #q29))
          :effect (basemotion #q4 #t251 #q29)
   )
   (:action s288_plan-base-motion
          :parameters (#q4 #q30)
          :precondition (and (isbconf #q4) (isbconf #q30))
          :effect (basemotion #q4 #t252 #q30)
   )
   (:action s289_plan-base-motion
          :parameters (#q4 #q31)
          :precondition (and (isbconf #q4) (isbconf #q31))
          :effect (basemotion #q4 #t253 #q31)
   )
   (:action s290_plan-base-motion
          :parameters (#q4 #q32)
          :precondition (and (isbconf #q4) (isbconf #q32))
          :effect (basemotion #q4 #t254 #q32)
   )
   (:action s291_plan-base-motion
          :parameters (#q4 #q33)
          :precondition (and (isbconf #q4) (isbconf #q33))
          :effect (basemotion #q4 #t255 #q33)
   )
   (:action s292_plan-base-motion
          :parameters (#q4 #q34)
          :precondition (and (isbconf #q4) (isbconf #q34))
          :effect (basemotion #q4 #t256 #q34)
   )
   (:action s293_plan-base-motion
          :parameters (#q4 #q35)
          :precondition (and (isbconf #q4) (isbconf #q35))
          :effect (basemotion #q4 #t257 #q35)
   )
   (:action s294_plan-base-motion
          :parameters (#q5 q976)
          :precondition (and (isbconf #q5) (isbconf q976))
          :effect (basemotion #q5 #t258 q976)
   )
   (:action s295_plan-base-motion
          :parameters (#q5 #q0)
          :precondition (and (isbconf #q5) (isbconf #q0))
          :effect (basemotion #q5 #t259 #q0)
   )
   (:action s296_plan-base-motion
          :parameters (#q5 #q1)
          :precondition (and (isbconf #q5) (isbconf #q1))
          :effect (basemotion #q5 #t260 #q1)
   )
   (:action s297_plan-base-motion
          :parameters (#q5 #q2)
          :precondition (and (isbconf #q5) (isbconf #q2))
          :effect (basemotion #q5 #t261 #q2)
   )
   (:action s298_plan-base-motion
          :parameters (#q5 #q3)
          :precondition (and (isbconf #q5) (isbconf #q3))
          :effect (basemotion #q5 #t262 #q3)
   )
   (:action s299_plan-base-motion
          :parameters (#q5 #q4)
          :precondition (and (isbconf #q5) (isbconf #q4))
          :effect (basemotion #q5 #t263 #q4)
   )
   (:action s300_plan-base-motion
          :parameters (#q5 #q5)
          :precondition (and (isbconf #q5) (isbconf #q5))
          :effect (basemotion #q5 #t264 #q5)
   )
   (:action s301_plan-base-motion
          :parameters (#q5 #q6)
          :precondition (and (isbconf #q5) (isbconf #q6))
          :effect (basemotion #q5 #t265 #q6)
   )
   (:action s302_plan-base-motion
          :parameters (#q5 #q7)
          :precondition (and (isbconf #q5) (isbconf #q7))
          :effect (basemotion #q5 #t266 #q7)
   )
   (:action s303_plan-base-motion
          :parameters (#q5 #q8)
          :precondition (and (isbconf #q5) (isbconf #q8))
          :effect (basemotion #q5 #t267 #q8)
   )
   (:action s304_plan-base-motion
          :parameters (#q5 #q9)
          :precondition (and (isbconf #q5) (isbconf #q9))
          :effect (basemotion #q5 #t268 #q9)
   )
   (:action s305_plan-base-motion
          :parameters (#q5 #q10)
          :precondition (and (isbconf #q5) (isbconf #q10))
          :effect (basemotion #q5 #t269 #q10)
   )
   (:action s306_plan-base-motion
          :parameters (#q5 #q11)
          :precondition (and (isbconf #q5) (isbconf #q11))
          :effect (basemotion #q5 #t270 #q11)
   )
   (:action s307_plan-base-motion
          :parameters (#q5 #q12)
          :precondition (and (isbconf #q5) (isbconf #q12))
          :effect (basemotion #q5 #t271 #q12)
   )
   (:action s308_plan-base-motion
          :parameters (#q5 #q13)
          :precondition (and (isbconf #q5) (isbconf #q13))
          :effect (basemotion #q5 #t272 #q13)
   )
   (:action s309_plan-base-motion
          :parameters (#q5 #q14)
          :precondition (and (isbconf #q5) (isbconf #q14))
          :effect (basemotion #q5 #t273 #q14)
   )
   (:action s310_plan-base-motion
          :parameters (#q5 #q15)
          :precondition (and (isbconf #q5) (isbconf #q15))
          :effect (basemotion #q5 #t274 #q15)
   )
   (:action s311_plan-base-motion
          :parameters (#q5 #q16)
          :precondition (and (isbconf #q5) (isbconf #q16))
          :effect (basemotion #q5 #t275 #q16)
   )
   (:action s312_plan-base-motion
          :parameters (#q5 #q17)
          :precondition (and (isbconf #q5) (isbconf #q17))
          :effect (basemotion #q5 #t276 #q17)
   )
   (:action s313_plan-base-motion
          :parameters (#q5 #q18)
          :precondition (and (isbconf #q5) (isbconf #q18))
          :effect (basemotion #q5 #t277 #q18)
   )
   (:action s314_plan-base-motion
          :parameters (#q5 #q19)
          :precondition (and (isbconf #q5) (isbconf #q19))
          :effect (basemotion #q5 #t278 #q19)
   )
   (:action s315_plan-base-motion
          :parameters (#q5 #q20)
          :precondition (and (isbconf #q5) (isbconf #q20))
          :effect (basemotion #q5 #t279 #q20)
   )
   (:action s316_plan-base-motion
          :parameters (#q5 #q21)
          :precondition (and (isbconf #q5) (isbconf #q21))
          :effect (basemotion #q5 #t280 #q21)
   )
   (:action s317_plan-base-motion
          :parameters (#q5 #q22)
          :precondition (and (isbconf #q5) (isbconf #q22))
          :effect (basemotion #q5 #t281 #q22)
   )
   (:action s318_plan-base-motion
          :parameters (#q5 #q23)
          :precondition (and (isbconf #q5) (isbconf #q23))
          :effect (basemotion #q5 #t282 #q23)
   )
   (:action s319_plan-base-motion
          :parameters (#q5 #q24)
          :precondition (and (isbconf #q5) (isbconf #q24))
          :effect (basemotion #q5 #t283 #q24)
   )
   (:action s320_plan-base-motion
          :parameters (#q5 #q25)
          :precondition (and (isbconf #q5) (isbconf #q25))
          :effect (basemotion #q5 #t284 #q25)
   )
   (:action s321_plan-base-motion
          :parameters (#q5 #q26)
          :precondition (and (isbconf #q5) (isbconf #q26))
          :effect (basemotion #q5 #t285 #q26)
   )
   (:action s322_plan-base-motion
          :parameters (#q5 #q27)
          :precondition (and (isbconf #q5) (isbconf #q27))
          :effect (basemotion #q5 #t286 #q27)
   )
   (:action s323_plan-base-motion
          :parameters (#q5 #q28)
          :precondition (and (isbconf #q5) (isbconf #q28))
          :effect (basemotion #q5 #t287 #q28)
   )
   (:action s324_plan-base-motion
          :parameters (#q5 #q29)
          :precondition (and (isbconf #q5) (isbconf #q29))
          :effect (basemotion #q5 #t288 #q29)
   )
   (:action s325_plan-base-motion
          :parameters (#q5 #q30)
          :precondition (and (isbconf #q5) (isbconf #q30))
          :effect (basemotion #q5 #t289 #q30)
   )
   (:action s326_plan-base-motion
          :parameters (#q5 #q31)
          :precondition (and (isbconf #q5) (isbconf #q31))
          :effect (basemotion #q5 #t290 #q31)
   )
   (:action s327_plan-base-motion
          :parameters (#q5 #q32)
          :precondition (and (isbconf #q5) (isbconf #q32))
          :effect (basemotion #q5 #t291 #q32)
   )
   (:action s328_plan-base-motion
          :parameters (#q5 #q33)
          :precondition (and (isbconf #q5) (isbconf #q33))
          :effect (basemotion #q5 #t292 #q33)
   )
   (:action s329_plan-base-motion
          :parameters (#q5 #q34)
          :precondition (and (isbconf #q5) (isbconf #q34))
          :effect (basemotion #q5 #t293 #q34)
   )
   (:action s330_plan-base-motion
          :parameters (#q5 #q35)
          :precondition (and (isbconf #q5) (isbconf #q35))
          :effect (basemotion #q5 #t294 #q35)
   )
   (:action s331_plan-base-motion
          :parameters (#q6 q976)
          :precondition (and (isbconf #q6) (isbconf q976))
          :effect (basemotion #q6 #t295 q976)
   )
   (:action s332_plan-base-motion
          :parameters (#q6 #q0)
          :precondition (and (isbconf #q6) (isbconf #q0))
          :effect (basemotion #q6 #t296 #q0)
   )
   (:action s333_plan-base-motion
          :parameters (#q6 #q1)
          :precondition (and (isbconf #q6) (isbconf #q1))
          :effect (basemotion #q6 #t297 #q1)
   )
   (:action s334_plan-base-motion
          :parameters (#q6 #q2)
          :precondition (and (isbconf #q6) (isbconf #q2))
          :effect (basemotion #q6 #t298 #q2)
   )
   (:action s335_plan-base-motion
          :parameters (#q6 #q3)
          :precondition (and (isbconf #q6) (isbconf #q3))
          :effect (basemotion #q6 #t299 #q3)
   )
   (:action s336_plan-base-motion
          :parameters (#q6 #q4)
          :precondition (and (isbconf #q6) (isbconf #q4))
          :effect (basemotion #q6 #t300 #q4)
   )
   (:action s337_plan-base-motion
          :parameters (#q6 #q5)
          :precondition (and (isbconf #q6) (isbconf #q5))
          :effect (basemotion #q6 #t301 #q5)
   )
   (:action s338_plan-base-motion
          :parameters (#q6 #q6)
          :precondition (and (isbconf #q6) (isbconf #q6))
          :effect (basemotion #q6 #t302 #q6)
   )
   (:action s339_plan-base-motion
          :parameters (#q6 #q7)
          :precondition (and (isbconf #q6) (isbconf #q7))
          :effect (basemotion #q6 #t303 #q7)
   )
   (:action s340_plan-base-motion
          :parameters (#q6 #q8)
          :precondition (and (isbconf #q6) (isbconf #q8))
          :effect (basemotion #q6 #t304 #q8)
   )
   (:action s341_plan-base-motion
          :parameters (#q6 #q9)
          :precondition (and (isbconf #q6) (isbconf #q9))
          :effect (basemotion #q6 #t305 #q9)
   )
   (:action s342_plan-base-motion
          :parameters (#q6 #q10)
          :precondition (and (isbconf #q6) (isbconf #q10))
          :effect (basemotion #q6 #t306 #q10)
   )
   (:action s343_plan-base-motion
          :parameters (#q6 #q11)
          :precondition (and (isbconf #q6) (isbconf #q11))
          :effect (basemotion #q6 #t307 #q11)
   )
   (:action s344_plan-base-motion
          :parameters (#q6 #q12)
          :precondition (and (isbconf #q6) (isbconf #q12))
          :effect (basemotion #q6 #t308 #q12)
   )
   (:action s345_plan-base-motion
          :parameters (#q6 #q13)
          :precondition (and (isbconf #q6) (isbconf #q13))
          :effect (basemotion #q6 #t309 #q13)
   )
   (:action s346_plan-base-motion
          :parameters (#q6 #q14)
          :precondition (and (isbconf #q6) (isbconf #q14))
          :effect (basemotion #q6 #t310 #q14)
   )
   (:action s347_plan-base-motion
          :parameters (#q6 #q15)
          :precondition (and (isbconf #q6) (isbconf #q15))
          :effect (basemotion #q6 #t311 #q15)
   )
   (:action s348_plan-base-motion
          :parameters (#q6 #q16)
          :precondition (and (isbconf #q6) (isbconf #q16))
          :effect (basemotion #q6 #t312 #q16)
   )
   (:action s349_plan-base-motion
          :parameters (#q6 #q17)
          :precondition (and (isbconf #q6) (isbconf #q17))
          :effect (basemotion #q6 #t313 #q17)
   )
   (:action s350_plan-base-motion
          :parameters (#q6 #q18)
          :precondition (and (isbconf #q6) (isbconf #q18))
          :effect (basemotion #q6 #t314 #q18)
   )
   (:action s351_plan-base-motion
          :parameters (#q6 #q19)
          :precondition (and (isbconf #q6) (isbconf #q19))
          :effect (basemotion #q6 #t315 #q19)
   )
   (:action s352_plan-base-motion
          :parameters (#q6 #q20)
          :precondition (and (isbconf #q6) (isbconf #q20))
          :effect (basemotion #q6 #t316 #q20)
   )
   (:action s353_plan-base-motion
          :parameters (#q6 #q21)
          :precondition (and (isbconf #q6) (isbconf #q21))
          :effect (basemotion #q6 #t317 #q21)
   )
   (:action s354_plan-base-motion
          :parameters (#q6 #q22)
          :precondition (and (isbconf #q6) (isbconf #q22))
          :effect (basemotion #q6 #t318 #q22)
   )
   (:action s355_plan-base-motion
          :parameters (#q6 #q23)
          :precondition (and (isbconf #q6) (isbconf #q23))
          :effect (basemotion #q6 #t319 #q23)
   )
   (:action s356_plan-base-motion
          :parameters (#q6 #q24)
          :precondition (and (isbconf #q6) (isbconf #q24))
          :effect (basemotion #q6 #t320 #q24)
   )
   (:action s357_plan-base-motion
          :parameters (#q6 #q25)
          :precondition (and (isbconf #q6) (isbconf #q25))
          :effect (basemotion #q6 #t321 #q25)
   )
   (:action s358_plan-base-motion
          :parameters (#q6 #q26)
          :precondition (and (isbconf #q6) (isbconf #q26))
          :effect (basemotion #q6 #t322 #q26)
   )
   (:action s359_plan-base-motion
          :parameters (#q6 #q27)
          :precondition (and (isbconf #q6) (isbconf #q27))
          :effect (basemotion #q6 #t323 #q27)
   )
   (:action s360_plan-base-motion
          :parameters (#q6 #q28)
          :precondition (and (isbconf #q6) (isbconf #q28))
          :effect (basemotion #q6 #t324 #q28)
   )
   (:action s361_plan-base-motion
          :parameters (#q6 #q29)
          :precondition (and (isbconf #q6) (isbconf #q29))
          :effect (basemotion #q6 #t325 #q29)
   )
   (:action s362_plan-base-motion
          :parameters (#q6 #q30)
          :precondition (and (isbconf #q6) (isbconf #q30))
          :effect (basemotion #q6 #t326 #q30)
   )
   (:action s363_plan-base-motion
          :parameters (#q6 #q31)
          :precondition (and (isbconf #q6) (isbconf #q31))
          :effect (basemotion #q6 #t327 #q31)
   )
   (:action s364_plan-base-motion
          :parameters (#q6 #q32)
          :precondition (and (isbconf #q6) (isbconf #q32))
          :effect (basemotion #q6 #t328 #q32)
   )
   (:action s365_plan-base-motion
          :parameters (#q6 #q33)
          :precondition (and (isbconf #q6) (isbconf #q33))
          :effect (basemotion #q6 #t329 #q33)
   )
   (:action s366_plan-base-motion
          :parameters (#q6 #q34)
          :precondition (and (isbconf #q6) (isbconf #q34))
          :effect (basemotion #q6 #t330 #q34)
   )
   (:action s367_plan-base-motion
          :parameters (#q6 #q35)
          :precondition (and (isbconf #q6) (isbconf #q35))
          :effect (basemotion #q6 #t331 #q35)
   )
   (:action s368_plan-base-motion
          :parameters (#q7 q976)
          :precondition (and (isbconf #q7) (isbconf q976))
          :effect (basemotion #q7 #t332 q976)
   )
   (:action s369_plan-base-motion
          :parameters (#q7 #q0)
          :precondition (and (isbconf #q7) (isbconf #q0))
          :effect (basemotion #q7 #t333 #q0)
   )
   (:action s370_plan-base-motion
          :parameters (#q7 #q1)
          :precondition (and (isbconf #q7) (isbconf #q1))
          :effect (basemotion #q7 #t334 #q1)
   )
   (:action s371_plan-base-motion
          :parameters (#q7 #q2)
          :precondition (and (isbconf #q7) (isbconf #q2))
          :effect (basemotion #q7 #t335 #q2)
   )
   (:action s372_plan-base-motion
          :parameters (#q7 #q3)
          :precondition (and (isbconf #q7) (isbconf #q3))
          :effect (basemotion #q7 #t336 #q3)
   )
   (:action s373_plan-base-motion
          :parameters (#q7 #q4)
          :precondition (and (isbconf #q7) (isbconf #q4))
          :effect (basemotion #q7 #t337 #q4)
   )
   (:action s374_plan-base-motion
          :parameters (#q7 #q5)
          :precondition (and (isbconf #q7) (isbconf #q5))
          :effect (basemotion #q7 #t338 #q5)
   )
   (:action s375_plan-base-motion
          :parameters (#q7 #q6)
          :precondition (and (isbconf #q7) (isbconf #q6))
          :effect (basemotion #q7 #t339 #q6)
   )
   (:action s376_plan-base-motion
          :parameters (#q7 #q7)
          :precondition (and (isbconf #q7) (isbconf #q7))
          :effect (basemotion #q7 #t340 #q7)
   )
   (:action s377_plan-base-motion
          :parameters (#q7 #q8)
          :precondition (and (isbconf #q7) (isbconf #q8))
          :effect (basemotion #q7 #t341 #q8)
   )
   (:action s378_plan-base-motion
          :parameters (#q7 #q9)
          :precondition (and (isbconf #q7) (isbconf #q9))
          :effect (basemotion #q7 #t342 #q9)
   )
   (:action s379_plan-base-motion
          :parameters (#q7 #q10)
          :precondition (and (isbconf #q7) (isbconf #q10))
          :effect (basemotion #q7 #t343 #q10)
   )
   (:action s380_plan-base-motion
          :parameters (#q7 #q11)
          :precondition (and (isbconf #q7) (isbconf #q11))
          :effect (basemotion #q7 #t344 #q11)
   )
   (:action s381_plan-base-motion
          :parameters (#q7 #q12)
          :precondition (and (isbconf #q7) (isbconf #q12))
          :effect (basemotion #q7 #t345 #q12)
   )
   (:action s382_plan-base-motion
          :parameters (#q7 #q13)
          :precondition (and (isbconf #q7) (isbconf #q13))
          :effect (basemotion #q7 #t346 #q13)
   )
   (:action s383_plan-base-motion
          :parameters (#q7 #q14)
          :precondition (and (isbconf #q7) (isbconf #q14))
          :effect (basemotion #q7 #t347 #q14)
   )
   (:action s384_plan-base-motion
          :parameters (#q7 #q15)
          :precondition (and (isbconf #q7) (isbconf #q15))
          :effect (basemotion #q7 #t348 #q15)
   )
   (:action s385_plan-base-motion
          :parameters (#q7 #q16)
          :precondition (and (isbconf #q7) (isbconf #q16))
          :effect (basemotion #q7 #t349 #q16)
   )
   (:action s386_plan-base-motion
          :parameters (#q7 #q17)
          :precondition (and (isbconf #q7) (isbconf #q17))
          :effect (basemotion #q7 #t350 #q17)
   )
   (:action s387_plan-base-motion
          :parameters (#q7 #q18)
          :precondition (and (isbconf #q7) (isbconf #q18))
          :effect (basemotion #q7 #t351 #q18)
   )
   (:action s388_plan-base-motion
          :parameters (#q7 #q19)
          :precondition (and (isbconf #q7) (isbconf #q19))
          :effect (basemotion #q7 #t352 #q19)
   )
   (:action s389_plan-base-motion
          :parameters (#q7 #q20)
          :precondition (and (isbconf #q7) (isbconf #q20))
          :effect (basemotion #q7 #t353 #q20)
   )
   (:action s390_plan-base-motion
          :parameters (#q7 #q21)
          :precondition (and (isbconf #q7) (isbconf #q21))
          :effect (basemotion #q7 #t354 #q21)
   )
   (:action s391_plan-base-motion
          :parameters (#q7 #q22)
          :precondition (and (isbconf #q7) (isbconf #q22))
          :effect (basemotion #q7 #t355 #q22)
   )
   (:action s392_plan-base-motion
          :parameters (#q7 #q23)
          :precondition (and (isbconf #q7) (isbconf #q23))
          :effect (basemotion #q7 #t356 #q23)
   )
   (:action s393_plan-base-motion
          :parameters (#q7 #q24)
          :precondition (and (isbconf #q7) (isbconf #q24))
          :effect (basemotion #q7 #t357 #q24)
   )
   (:action s394_plan-base-motion
          :parameters (#q7 #q25)
          :precondition (and (isbconf #q7) (isbconf #q25))
          :effect (basemotion #q7 #t358 #q25)
   )
   (:action s395_plan-base-motion
          :parameters (#q7 #q26)
          :precondition (and (isbconf #q7) (isbconf #q26))
          :effect (basemotion #q7 #t359 #q26)
   )
   (:action s396_plan-base-motion
          :parameters (#q7 #q27)
          :precondition (and (isbconf #q7) (isbconf #q27))
          :effect (basemotion #q7 #t360 #q27)
   )
   (:action s397_plan-base-motion
          :parameters (#q7 #q28)
          :precondition (and (isbconf #q7) (isbconf #q28))
          :effect (basemotion #q7 #t361 #q28)
   )
   (:action s398_plan-base-motion
          :parameters (#q7 #q29)
          :precondition (and (isbconf #q7) (isbconf #q29))
          :effect (basemotion #q7 #t362 #q29)
   )
   (:action s399_plan-base-motion
          :parameters (#q7 #q30)
          :precondition (and (isbconf #q7) (isbconf #q30))
          :effect (basemotion #q7 #t363 #q30)
   )
   (:action s400_plan-base-motion
          :parameters (#q7 #q31)
          :precondition (and (isbconf #q7) (isbconf #q31))
          :effect (basemotion #q7 #t364 #q31)
   )
   (:action s401_plan-base-motion
          :parameters (#q7 #q32)
          :precondition (and (isbconf #q7) (isbconf #q32))
          :effect (basemotion #q7 #t365 #q32)
   )
   (:action s402_plan-base-motion
          :parameters (#q7 #q33)
          :precondition (and (isbconf #q7) (isbconf #q33))
          :effect (basemotion #q7 #t366 #q33)
   )
   (:action s403_plan-base-motion
          :parameters (#q7 #q34)
          :precondition (and (isbconf #q7) (isbconf #q34))
          :effect (basemotion #q7 #t367 #q34)
   )
   (:action s404_plan-base-motion
          :parameters (#q7 #q35)
          :precondition (and (isbconf #q7) (isbconf #q35))
          :effect (basemotion #q7 #t368 #q35)
   )
   (:action s405_plan-base-motion
          :parameters (#q8 q976)
          :precondition (and (isbconf #q8) (isbconf q976))
          :effect (basemotion #q8 #t369 q976)
   )
   (:action s406_plan-base-motion
          :parameters (#q8 #q0)
          :precondition (and (isbconf #q8) (isbconf #q0))
          :effect (basemotion #q8 #t370 #q0)
   )
   (:action s407_plan-base-motion
          :parameters (#q8 #q1)
          :precondition (and (isbconf #q8) (isbconf #q1))
          :effect (basemotion #q8 #t371 #q1)
   )
   (:action s408_plan-base-motion
          :parameters (#q8 #q2)
          :precondition (and (isbconf #q8) (isbconf #q2))
          :effect (basemotion #q8 #t372 #q2)
   )
   (:action s409_plan-base-motion
          :parameters (#q8 #q3)
          :precondition (and (isbconf #q8) (isbconf #q3))
          :effect (basemotion #q8 #t373 #q3)
   )
   (:action s410_plan-base-motion
          :parameters (#q8 #q4)
          :precondition (and (isbconf #q8) (isbconf #q4))
          :effect (basemotion #q8 #t374 #q4)
   )
   (:action s411_plan-base-motion
          :parameters (#q8 #q5)
          :precondition (and (isbconf #q8) (isbconf #q5))
          :effect (basemotion #q8 #t375 #q5)
   )
   (:action s412_plan-base-motion
          :parameters (#q8 #q6)
          :precondition (and (isbconf #q8) (isbconf #q6))
          :effect (basemotion #q8 #t376 #q6)
   )
   (:action s413_plan-base-motion
          :parameters (#q8 #q7)
          :precondition (and (isbconf #q8) (isbconf #q7))
          :effect (basemotion #q8 #t377 #q7)
   )
   (:action s414_plan-base-motion
          :parameters (#q8 #q8)
          :precondition (and (isbconf #q8) (isbconf #q8))
          :effect (basemotion #q8 #t378 #q8)
   )
   (:action s415_plan-base-motion
          :parameters (#q8 #q9)
          :precondition (and (isbconf #q8) (isbconf #q9))
          :effect (basemotion #q8 #t379 #q9)
   )
   (:action s416_plan-base-motion
          :parameters (#q8 #q10)
          :precondition (and (isbconf #q8) (isbconf #q10))
          :effect (basemotion #q8 #t380 #q10)
   )
   (:action s417_plan-base-motion
          :parameters (#q8 #q11)
          :precondition (and (isbconf #q8) (isbconf #q11))
          :effect (basemotion #q8 #t381 #q11)
   )
   (:action s418_plan-base-motion
          :parameters (#q8 #q12)
          :precondition (and (isbconf #q8) (isbconf #q12))
          :effect (basemotion #q8 #t382 #q12)
   )
   (:action s419_plan-base-motion
          :parameters (#q8 #q13)
          :precondition (and (isbconf #q8) (isbconf #q13))
          :effect (basemotion #q8 #t383 #q13)
   )
   (:action s420_plan-base-motion
          :parameters (#q8 #q14)
          :precondition (and (isbconf #q8) (isbconf #q14))
          :effect (basemotion #q8 #t384 #q14)
   )
   (:action s421_plan-base-motion
          :parameters (#q8 #q15)
          :precondition (and (isbconf #q8) (isbconf #q15))
          :effect (basemotion #q8 #t385 #q15)
   )
   (:action s422_plan-base-motion
          :parameters (#q8 #q16)
          :precondition (and (isbconf #q8) (isbconf #q16))
          :effect (basemotion #q8 #t386 #q16)
   )
   (:action s423_plan-base-motion
          :parameters (#q8 #q17)
          :precondition (and (isbconf #q8) (isbconf #q17))
          :effect (basemotion #q8 #t387 #q17)
   )
   (:action s424_plan-base-motion
          :parameters (#q8 #q18)
          :precondition (and (isbconf #q8) (isbconf #q18))
          :effect (basemotion #q8 #t388 #q18)
   )
   (:action s425_plan-base-motion
          :parameters (#q8 #q19)
          :precondition (and (isbconf #q8) (isbconf #q19))
          :effect (basemotion #q8 #t389 #q19)
   )
   (:action s426_plan-base-motion
          :parameters (#q8 #q20)
          :precondition (and (isbconf #q8) (isbconf #q20))
          :effect (basemotion #q8 #t390 #q20)
   )
   (:action s427_plan-base-motion
          :parameters (#q8 #q21)
          :precondition (and (isbconf #q8) (isbconf #q21))
          :effect (basemotion #q8 #t391 #q21)
   )
   (:action s428_plan-base-motion
          :parameters (#q8 #q22)
          :precondition (and (isbconf #q8) (isbconf #q22))
          :effect (basemotion #q8 #t392 #q22)
   )
   (:action s429_plan-base-motion
          :parameters (#q8 #q23)
          :precondition (and (isbconf #q8) (isbconf #q23))
          :effect (basemotion #q8 #t393 #q23)
   )
   (:action s430_plan-base-motion
          :parameters (#q8 #q24)
          :precondition (and (isbconf #q8) (isbconf #q24))
          :effect (basemotion #q8 #t394 #q24)
   )
   (:action s431_plan-base-motion
          :parameters (#q8 #q25)
          :precondition (and (isbconf #q8) (isbconf #q25))
          :effect (basemotion #q8 #t395 #q25)
   )
   (:action s432_plan-base-motion
          :parameters (#q8 #q26)
          :precondition (and (isbconf #q8) (isbconf #q26))
          :effect (basemotion #q8 #t396 #q26)
   )
   (:action s433_plan-base-motion
          :parameters (#q8 #q27)
          :precondition (and (isbconf #q8) (isbconf #q27))
          :effect (basemotion #q8 #t397 #q27)
   )
   (:action s434_plan-base-motion
          :parameters (#q8 #q28)
          :precondition (and (isbconf #q8) (isbconf #q28))
          :effect (basemotion #q8 #t398 #q28)
   )
   (:action s435_plan-base-motion
          :parameters (#q8 #q29)
          :precondition (and (isbconf #q8) (isbconf #q29))
          :effect (basemotion #q8 #t399 #q29)
   )
   (:action s436_plan-base-motion
          :parameters (#q8 #q30)
          :precondition (and (isbconf #q8) (isbconf #q30))
          :effect (basemotion #q8 #t400 #q30)
   )
   (:action s437_plan-base-motion
          :parameters (#q8 #q31)
          :precondition (and (isbconf #q8) (isbconf #q31))
          :effect (basemotion #q8 #t401 #q31)
   )
   (:action s438_plan-base-motion
          :parameters (#q8 #q32)
          :precondition (and (isbconf #q8) (isbconf #q32))
          :effect (basemotion #q8 #t402 #q32)
   )
   (:action s439_plan-base-motion
          :parameters (#q8 #q33)
          :precondition (and (isbconf #q8) (isbconf #q33))
          :effect (basemotion #q8 #t403 #q33)
   )
   (:action s440_plan-base-motion
          :parameters (#q8 #q34)
          :precondition (and (isbconf #q8) (isbconf #q34))
          :effect (basemotion #q8 #t404 #q34)
   )
   (:action s441_plan-base-motion
          :parameters (#q8 #q35)
          :precondition (and (isbconf #q8) (isbconf #q35))
          :effect (basemotion #q8 #t405 #q35)
   )
   (:action s442_plan-base-motion
          :parameters (#q9 q976)
          :precondition (and (isbconf #q9) (isbconf q976))
          :effect (basemotion #q9 #t406 q976)
   )
   (:action s443_plan-base-motion
          :parameters (#q9 #q0)
          :precondition (and (isbconf #q9) (isbconf #q0))
          :effect (basemotion #q9 #t407 #q0)
   )
   (:action s444_plan-base-motion
          :parameters (#q9 #q1)
          :precondition (and (isbconf #q9) (isbconf #q1))
          :effect (basemotion #q9 #t408 #q1)
   )
   (:action s445_plan-base-motion
          :parameters (#q9 #q2)
          :precondition (and (isbconf #q9) (isbconf #q2))
          :effect (basemotion #q9 #t409 #q2)
   )
   (:action s446_plan-base-motion
          :parameters (#q9 #q3)
          :precondition (and (isbconf #q9) (isbconf #q3))
          :effect (basemotion #q9 #t410 #q3)
   )
   (:action s447_plan-base-motion
          :parameters (#q9 #q4)
          :precondition (and (isbconf #q9) (isbconf #q4))
          :effect (basemotion #q9 #t411 #q4)
   )
   (:action s448_plan-base-motion
          :parameters (#q9 #q5)
          :precondition (and (isbconf #q9) (isbconf #q5))
          :effect (basemotion #q9 #t412 #q5)
   )
   (:action s449_plan-base-motion
          :parameters (#q9 #q6)
          :precondition (and (isbconf #q9) (isbconf #q6))
          :effect (basemotion #q9 #t413 #q6)
   )
   (:action s450_plan-base-motion
          :parameters (#q9 #q7)
          :precondition (and (isbconf #q9) (isbconf #q7))
          :effect (basemotion #q9 #t414 #q7)
   )
   (:action s451_plan-base-motion
          :parameters (#q9 #q8)
          :precondition (and (isbconf #q9) (isbconf #q8))
          :effect (basemotion #q9 #t415 #q8)
   )
   (:action s452_plan-base-motion
          :parameters (#q9 #q9)
          :precondition (and (isbconf #q9) (isbconf #q9))
          :effect (basemotion #q9 #t416 #q9)
   )
   (:action s453_plan-base-motion
          :parameters (#q9 #q10)
          :precondition (and (isbconf #q9) (isbconf #q10))
          :effect (basemotion #q9 #t417 #q10)
   )
   (:action s454_plan-base-motion
          :parameters (#q9 #q11)
          :precondition (and (isbconf #q9) (isbconf #q11))
          :effect (basemotion #q9 #t418 #q11)
   )
   (:action s455_plan-base-motion
          :parameters (#q9 #q12)
          :precondition (and (isbconf #q9) (isbconf #q12))
          :effect (basemotion #q9 #t419 #q12)
   )
   (:action s456_plan-base-motion
          :parameters (#q9 #q13)
          :precondition (and (isbconf #q9) (isbconf #q13))
          :effect (basemotion #q9 #t420 #q13)
   )
   (:action s457_plan-base-motion
          :parameters (#q9 #q14)
          :precondition (and (isbconf #q9) (isbconf #q14))
          :effect (basemotion #q9 #t421 #q14)
   )
   (:action s458_plan-base-motion
          :parameters (#q9 #q15)
          :precondition (and (isbconf #q9) (isbconf #q15))
          :effect (basemotion #q9 #t422 #q15)
   )
   (:action s459_plan-base-motion
          :parameters (#q9 #q16)
          :precondition (and (isbconf #q9) (isbconf #q16))
          :effect (basemotion #q9 #t423 #q16)
   )
   (:action s460_plan-base-motion
          :parameters (#q9 #q17)
          :precondition (and (isbconf #q9) (isbconf #q17))
          :effect (basemotion #q9 #t424 #q17)
   )
   (:action s461_plan-base-motion
          :parameters (#q9 #q18)
          :precondition (and (isbconf #q9) (isbconf #q18))
          :effect (basemotion #q9 #t425 #q18)
   )
   (:action s462_plan-base-motion
          :parameters (#q9 #q19)
          :precondition (and (isbconf #q9) (isbconf #q19))
          :effect (basemotion #q9 #t426 #q19)
   )
   (:action s463_plan-base-motion
          :parameters (#q9 #q20)
          :precondition (and (isbconf #q9) (isbconf #q20))
          :effect (basemotion #q9 #t427 #q20)
   )
   (:action s464_plan-base-motion
          :parameters (#q9 #q21)
          :precondition (and (isbconf #q9) (isbconf #q21))
          :effect (basemotion #q9 #t428 #q21)
   )
   (:action s465_plan-base-motion
          :parameters (#q9 #q22)
          :precondition (and (isbconf #q9) (isbconf #q22))
          :effect (basemotion #q9 #t429 #q22)
   )
   (:action s466_plan-base-motion
          :parameters (#q9 #q23)
          :precondition (and (isbconf #q9) (isbconf #q23))
          :effect (basemotion #q9 #t430 #q23)
   )
   (:action s467_plan-base-motion
          :parameters (#q9 #q24)
          :precondition (and (isbconf #q9) (isbconf #q24))
          :effect (basemotion #q9 #t431 #q24)
   )
   (:action s468_plan-base-motion
          :parameters (#q9 #q25)
          :precondition (and (isbconf #q9) (isbconf #q25))
          :effect (basemotion #q9 #t432 #q25)
   )
   (:action s469_plan-base-motion
          :parameters (#q9 #q26)
          :precondition (and (isbconf #q9) (isbconf #q26))
          :effect (basemotion #q9 #t433 #q26)
   )
   (:action s470_plan-base-motion
          :parameters (#q9 #q27)
          :precondition (and (isbconf #q9) (isbconf #q27))
          :effect (basemotion #q9 #t434 #q27)
   )
   (:action s471_plan-base-motion
          :parameters (#q9 #q28)
          :precondition (and (isbconf #q9) (isbconf #q28))
          :effect (basemotion #q9 #t435 #q28)
   )
   (:action s472_plan-base-motion
          :parameters (#q9 #q29)
          :precondition (and (isbconf #q9) (isbconf #q29))
          :effect (basemotion #q9 #t436 #q29)
   )
   (:action s473_plan-base-motion
          :parameters (#q9 #q30)
          :precondition (and (isbconf #q9) (isbconf #q30))
          :effect (basemotion #q9 #t437 #q30)
   )
   (:action s474_plan-base-motion
          :parameters (#q9 #q31)
          :precondition (and (isbconf #q9) (isbconf #q31))
          :effect (basemotion #q9 #t438 #q31)
   )
   (:action s475_plan-base-motion
          :parameters (#q9 #q32)
          :precondition (and (isbconf #q9) (isbconf #q32))
          :effect (basemotion #q9 #t439 #q32)
   )
   (:action s476_plan-base-motion
          :parameters (#q9 #q33)
          :precondition (and (isbconf #q9) (isbconf #q33))
          :effect (basemotion #q9 #t440 #q33)
   )
   (:action s477_plan-base-motion
          :parameters (#q9 #q34)
          :precondition (and (isbconf #q9) (isbconf #q34))
          :effect (basemotion #q9 #t441 #q34)
   )
   (:action s478_plan-base-motion
          :parameters (#q9 #q35)
          :precondition (and (isbconf #q9) (isbconf #q35))
          :effect (basemotion #q9 #t442 #q35)
   )
   (:action s479_plan-base-motion
          :parameters (#q10 q976)
          :precondition (and (isbconf #q10) (isbconf q976))
          :effect (basemotion #q10 #t443 q976)
   )
   (:action s480_plan-base-motion
          :parameters (#q10 #q0)
          :precondition (and (isbconf #q10) (isbconf #q0))
          :effect (basemotion #q10 #t444 #q0)
   )
   (:action s481_plan-base-motion
          :parameters (#q10 #q1)
          :precondition (and (isbconf #q10) (isbconf #q1))
          :effect (basemotion #q10 #t445 #q1)
   )
   (:action s482_plan-base-motion
          :parameters (#q10 #q2)
          :precondition (and (isbconf #q10) (isbconf #q2))
          :effect (basemotion #q10 #t446 #q2)
   )
   (:action s483_plan-base-motion
          :parameters (#q10 #q3)
          :precondition (and (isbconf #q10) (isbconf #q3))
          :effect (basemotion #q10 #t447 #q3)
   )
   (:action s484_plan-base-motion
          :parameters (#q10 #q4)
          :precondition (and (isbconf #q10) (isbconf #q4))
          :effect (basemotion #q10 #t448 #q4)
   )
   (:action s485_plan-base-motion
          :parameters (#q10 #q5)
          :precondition (and (isbconf #q10) (isbconf #q5))
          :effect (basemotion #q10 #t449 #q5)
   )
   (:action s486_plan-base-motion
          :parameters (#q10 #q6)
          :precondition (and (isbconf #q10) (isbconf #q6))
          :effect (basemotion #q10 #t450 #q6)
   )
   (:action s487_plan-base-motion
          :parameters (#q10 #q7)
          :precondition (and (isbconf #q10) (isbconf #q7))
          :effect (basemotion #q10 #t451 #q7)
   )
   (:action s488_plan-base-motion
          :parameters (#q10 #q8)
          :precondition (and (isbconf #q10) (isbconf #q8))
          :effect (basemotion #q10 #t452 #q8)
   )
   (:action s489_plan-base-motion
          :parameters (#q10 #q9)
          :precondition (and (isbconf #q10) (isbconf #q9))
          :effect (basemotion #q10 #t453 #q9)
   )
   (:action s490_plan-base-motion
          :parameters (#q10 #q10)
          :precondition (and (isbconf #q10) (isbconf #q10))
          :effect (basemotion #q10 #t454 #q10)
   )
   (:action s491_plan-base-motion
          :parameters (#q10 #q11)
          :precondition (and (isbconf #q10) (isbconf #q11))
          :effect (basemotion #q10 #t455 #q11)
   )
   (:action s492_plan-base-motion
          :parameters (#q10 #q12)
          :precondition (and (isbconf #q10) (isbconf #q12))
          :effect (basemotion #q10 #t456 #q12)
   )
   (:action s493_plan-base-motion
          :parameters (#q10 #q13)
          :precondition (and (isbconf #q10) (isbconf #q13))
          :effect (basemotion #q10 #t457 #q13)
   )
   (:action s494_plan-base-motion
          :parameters (#q10 #q14)
          :precondition (and (isbconf #q10) (isbconf #q14))
          :effect (basemotion #q10 #t458 #q14)
   )
   (:action s495_plan-base-motion
          :parameters (#q10 #q15)
          :precondition (and (isbconf #q10) (isbconf #q15))
          :effect (basemotion #q10 #t459 #q15)
   )
   (:action s496_plan-base-motion
          :parameters (#q10 #q16)
          :precondition (and (isbconf #q10) (isbconf #q16))
          :effect (basemotion #q10 #t460 #q16)
   )
   (:action s497_plan-base-motion
          :parameters (#q10 #q17)
          :precondition (and (isbconf #q10) (isbconf #q17))
          :effect (basemotion #q10 #t461 #q17)
   )
   (:action s498_plan-base-motion
          :parameters (#q10 #q18)
          :precondition (and (isbconf #q10) (isbconf #q18))
          :effect (basemotion #q10 #t462 #q18)
   )
   (:action s499_plan-base-motion
          :parameters (#q10 #q19)
          :precondition (and (isbconf #q10) (isbconf #q19))
          :effect (basemotion #q10 #t463 #q19)
   )
   (:action s500_plan-base-motion
          :parameters (#q10 #q20)
          :precondition (and (isbconf #q10) (isbconf #q20))
          :effect (basemotion #q10 #t464 #q20)
   )
   (:action s501_plan-base-motion
          :parameters (#q10 #q21)
          :precondition (and (isbconf #q10) (isbconf #q21))
          :effect (basemotion #q10 #t465 #q21)
   )
   (:action s502_plan-base-motion
          :parameters (#q10 #q22)
          :precondition (and (isbconf #q10) (isbconf #q22))
          :effect (basemotion #q10 #t466 #q22)
   )
   (:action s503_plan-base-motion
          :parameters (#q10 #q23)
          :precondition (and (isbconf #q10) (isbconf #q23))
          :effect (basemotion #q10 #t467 #q23)
   )
   (:action s504_plan-base-motion
          :parameters (#q10 #q24)
          :precondition (and (isbconf #q10) (isbconf #q24))
          :effect (basemotion #q10 #t468 #q24)
   )
   (:action s505_plan-base-motion
          :parameters (#q10 #q25)
          :precondition (and (isbconf #q10) (isbconf #q25))
          :effect (basemotion #q10 #t469 #q25)
   )
   (:action s506_plan-base-motion
          :parameters (#q10 #q26)
          :precondition (and (isbconf #q10) (isbconf #q26))
          :effect (basemotion #q10 #t470 #q26)
   )
   (:action s507_plan-base-motion
          :parameters (#q10 #q27)
          :precondition (and (isbconf #q10) (isbconf #q27))
          :effect (basemotion #q10 #t471 #q27)
   )
   (:action s508_plan-base-motion
          :parameters (#q10 #q28)
          :precondition (and (isbconf #q10) (isbconf #q28))
          :effect (basemotion #q10 #t472 #q28)
   )
   (:action s509_plan-base-motion
          :parameters (#q10 #q29)
          :precondition (and (isbconf #q10) (isbconf #q29))
          :effect (basemotion #q10 #t473 #q29)
   )
   (:action s510_plan-base-motion
          :parameters (#q10 #q30)
          :precondition (and (isbconf #q10) (isbconf #q30))
          :effect (basemotion #q10 #t474 #q30)
   )
   (:action s511_plan-base-motion
          :parameters (#q10 #q31)
          :precondition (and (isbconf #q10) (isbconf #q31))
          :effect (basemotion #q10 #t475 #q31)
   )
   (:action s512_plan-base-motion
          :parameters (#q10 #q32)
          :precondition (and (isbconf #q10) (isbconf #q32))
          :effect (basemotion #q10 #t476 #q32)
   )
   (:action s513_plan-base-motion
          :parameters (#q10 #q33)
          :precondition (and (isbconf #q10) (isbconf #q33))
          :effect (basemotion #q10 #t477 #q33)
   )
   (:action s514_plan-base-motion
          :parameters (#q10 #q34)
          :precondition (and (isbconf #q10) (isbconf #q34))
          :effect (basemotion #q10 #t478 #q34)
   )
   (:action s515_plan-base-motion
          :parameters (#q10 #q35)
          :precondition (and (isbconf #q10) (isbconf #q35))
          :effect (basemotion #q10 #t479 #q35)
   )
   (:action s516_plan-base-motion
          :parameters (#q11 q976)
          :precondition (and (isbconf #q11) (isbconf q976))
          :effect (basemotion #q11 #t480 q976)
   )
   (:action s517_plan-base-motion
          :parameters (#q11 #q0)
          :precondition (and (isbconf #q11) (isbconf #q0))
          :effect (basemotion #q11 #t481 #q0)
   )
   (:action s518_plan-base-motion
          :parameters (#q11 #q1)
          :precondition (and (isbconf #q11) (isbconf #q1))
          :effect (basemotion #q11 #t482 #q1)
   )
   (:action s519_plan-base-motion
          :parameters (#q11 #q2)
          :precondition (and (isbconf #q11) (isbconf #q2))
          :effect (basemotion #q11 #t483 #q2)
   )
   (:action s520_plan-base-motion
          :parameters (#q11 #q3)
          :precondition (and (isbconf #q11) (isbconf #q3))
          :effect (basemotion #q11 #t484 #q3)
   )
   (:action s521_plan-base-motion
          :parameters (#q11 #q4)
          :precondition (and (isbconf #q11) (isbconf #q4))
          :effect (basemotion #q11 #t485 #q4)
   )
   (:action s522_plan-base-motion
          :parameters (#q11 #q5)
          :precondition (and (isbconf #q11) (isbconf #q5))
          :effect (basemotion #q11 #t486 #q5)
   )
   (:action s523_plan-base-motion
          :parameters (#q11 #q6)
          :precondition (and (isbconf #q11) (isbconf #q6))
          :effect (basemotion #q11 #t487 #q6)
   )
   (:action s524_plan-base-motion
          :parameters (#q11 #q7)
          :precondition (and (isbconf #q11) (isbconf #q7))
          :effect (basemotion #q11 #t488 #q7)
   )
   (:action s525_plan-base-motion
          :parameters (#q11 #q8)
          :precondition (and (isbconf #q11) (isbconf #q8))
          :effect (basemotion #q11 #t489 #q8)
   )
   (:action s526_plan-base-motion
          :parameters (#q11 #q9)
          :precondition (and (isbconf #q11) (isbconf #q9))
          :effect (basemotion #q11 #t490 #q9)
   )
   (:action s527_plan-base-motion
          :parameters (#q11 #q10)
          :precondition (and (isbconf #q11) (isbconf #q10))
          :effect (basemotion #q11 #t491 #q10)
   )
   (:action s528_plan-base-motion
          :parameters (#q11 #q11)
          :precondition (and (isbconf #q11) (isbconf #q11))
          :effect (basemotion #q11 #t492 #q11)
   )
   (:action s529_plan-base-motion
          :parameters (#q11 #q12)
          :precondition (and (isbconf #q11) (isbconf #q12))
          :effect (basemotion #q11 #t493 #q12)
   )
   (:action s530_plan-base-motion
          :parameters (#q11 #q13)
          :precondition (and (isbconf #q11) (isbconf #q13))
          :effect (basemotion #q11 #t494 #q13)
   )
   (:action s531_plan-base-motion
          :parameters (#q11 #q14)
          :precondition (and (isbconf #q11) (isbconf #q14))
          :effect (basemotion #q11 #t495 #q14)
   )
   (:action s532_plan-base-motion
          :parameters (#q11 #q15)
          :precondition (and (isbconf #q11) (isbconf #q15))
          :effect (basemotion #q11 #t496 #q15)
   )
   (:action s533_plan-base-motion
          :parameters (#q11 #q16)
          :precondition (and (isbconf #q11) (isbconf #q16))
          :effect (basemotion #q11 #t497 #q16)
   )
   (:action s534_plan-base-motion
          :parameters (#q11 #q17)
          :precondition (and (isbconf #q11) (isbconf #q17))
          :effect (basemotion #q11 #t498 #q17)
   )
   (:action s535_plan-base-motion
          :parameters (#q11 #q18)
          :precondition (and (isbconf #q11) (isbconf #q18))
          :effect (basemotion #q11 #t499 #q18)
   )
   (:action s536_plan-base-motion
          :parameters (#q11 #q19)
          :precondition (and (isbconf #q11) (isbconf #q19))
          :effect (basemotion #q11 #t500 #q19)
   )
   (:action s537_plan-base-motion
          :parameters (#q11 #q20)
          :precondition (and (isbconf #q11) (isbconf #q20))
          :effect (basemotion #q11 #t501 #q20)
   )
   (:action s538_plan-base-motion
          :parameters (#q11 #q21)
          :precondition (and (isbconf #q11) (isbconf #q21))
          :effect (basemotion #q11 #t502 #q21)
   )
   (:action s539_plan-base-motion
          :parameters (#q11 #q22)
          :precondition (and (isbconf #q11) (isbconf #q22))
          :effect (basemotion #q11 #t503 #q22)
   )
   (:action s540_plan-base-motion
          :parameters (#q11 #q23)
          :precondition (and (isbconf #q11) (isbconf #q23))
          :effect (basemotion #q11 #t504 #q23)
   )
   (:action s541_plan-base-motion
          :parameters (#q11 #q24)
          :precondition (and (isbconf #q11) (isbconf #q24))
          :effect (basemotion #q11 #t505 #q24)
   )
   (:action s542_plan-base-motion
          :parameters (#q11 #q25)
          :precondition (and (isbconf #q11) (isbconf #q25))
          :effect (basemotion #q11 #t506 #q25)
   )
   (:action s543_plan-base-motion
          :parameters (#q11 #q26)
          :precondition (and (isbconf #q11) (isbconf #q26))
          :effect (basemotion #q11 #t507 #q26)
   )
   (:action s544_plan-base-motion
          :parameters (#q11 #q27)
          :precondition (and (isbconf #q11) (isbconf #q27))
          :effect (basemotion #q11 #t508 #q27)
   )
   (:action s545_plan-base-motion
          :parameters (#q11 #q28)
          :precondition (and (isbconf #q11) (isbconf #q28))
          :effect (basemotion #q11 #t509 #q28)
   )
   (:action s546_plan-base-motion
          :parameters (#q11 #q29)
          :precondition (and (isbconf #q11) (isbconf #q29))
          :effect (basemotion #q11 #t510 #q29)
   )
   (:action s547_plan-base-motion
          :parameters (#q11 #q30)
          :precondition (and (isbconf #q11) (isbconf #q30))
          :effect (basemotion #q11 #t511 #q30)
   )
   (:action s548_plan-base-motion
          :parameters (#q11 #q31)
          :precondition (and (isbconf #q11) (isbconf #q31))
          :effect (basemotion #q11 #t512 #q31)
   )
   (:action s549_plan-base-motion
          :parameters (#q11 #q32)
          :precondition (and (isbconf #q11) (isbconf #q32))
          :effect (basemotion #q11 #t513 #q32)
   )
   (:action s550_plan-base-motion
          :parameters (#q11 #q33)
          :precondition (and (isbconf #q11) (isbconf #q33))
          :effect (basemotion #q11 #t514 #q33)
   )
   (:action s551_plan-base-motion
          :parameters (#q11 #q34)
          :precondition (and (isbconf #q11) (isbconf #q34))
          :effect (basemotion #q11 #t515 #q34)
   )
   (:action s552_plan-base-motion
          :parameters (#q11 #q35)
          :precondition (and (isbconf #q11) (isbconf #q35))
          :effect (basemotion #q11 #t516 #q35)
   )
   (:action s553_plan-base-motion
          :parameters (#q12 q976)
          :precondition (and (isbconf #q12) (isbconf q976))
          :effect (basemotion #q12 #t517 q976)
   )
   (:action s554_plan-base-motion
          :parameters (#q12 #q0)
          :precondition (and (isbconf #q12) (isbconf #q0))
          :effect (basemotion #q12 #t518 #q0)
   )
   (:action s555_plan-base-motion
          :parameters (#q12 #q1)
          :precondition (and (isbconf #q12) (isbconf #q1))
          :effect (basemotion #q12 #t519 #q1)
   )
   (:action s556_plan-base-motion
          :parameters (#q12 #q2)
          :precondition (and (isbconf #q12) (isbconf #q2))
          :effect (basemotion #q12 #t520 #q2)
   )
   (:action s557_plan-base-motion
          :parameters (#q12 #q3)
          :precondition (and (isbconf #q12) (isbconf #q3))
          :effect (basemotion #q12 #t521 #q3)
   )
   (:action s558_plan-base-motion
          :parameters (#q12 #q4)
          :precondition (and (isbconf #q12) (isbconf #q4))
          :effect (basemotion #q12 #t522 #q4)
   )
   (:action s559_plan-base-motion
          :parameters (#q12 #q5)
          :precondition (and (isbconf #q12) (isbconf #q5))
          :effect (basemotion #q12 #t523 #q5)
   )
   (:action s560_plan-base-motion
          :parameters (#q12 #q6)
          :precondition (and (isbconf #q12) (isbconf #q6))
          :effect (basemotion #q12 #t524 #q6)
   )
   (:action s561_plan-base-motion
          :parameters (#q12 #q7)
          :precondition (and (isbconf #q12) (isbconf #q7))
          :effect (basemotion #q12 #t525 #q7)
   )
   (:action s562_plan-base-motion
          :parameters (#q12 #q8)
          :precondition (and (isbconf #q12) (isbconf #q8))
          :effect (basemotion #q12 #t526 #q8)
   )
   (:action s563_plan-base-motion
          :parameters (#q12 #q9)
          :precondition (and (isbconf #q12) (isbconf #q9))
          :effect (basemotion #q12 #t527 #q9)
   )
   (:action s564_plan-base-motion
          :parameters (#q12 #q10)
          :precondition (and (isbconf #q12) (isbconf #q10))
          :effect (basemotion #q12 #t528 #q10)
   )
   (:action s565_plan-base-motion
          :parameters (#q12 #q11)
          :precondition (and (isbconf #q12) (isbconf #q11))
          :effect (basemotion #q12 #t529 #q11)
   )
   (:action s566_plan-base-motion
          :parameters (#q12 #q12)
          :precondition (and (isbconf #q12) (isbconf #q12))
          :effect (basemotion #q12 #t530 #q12)
   )
   (:action s567_plan-base-motion
          :parameters (#q12 #q13)
          :precondition (and (isbconf #q12) (isbconf #q13))
          :effect (basemotion #q12 #t531 #q13)
   )
   (:action s568_plan-base-motion
          :parameters (#q12 #q14)
          :precondition (and (isbconf #q12) (isbconf #q14))
          :effect (basemotion #q12 #t532 #q14)
   )
   (:action s569_plan-base-motion
          :parameters (#q12 #q15)
          :precondition (and (isbconf #q12) (isbconf #q15))
          :effect (basemotion #q12 #t533 #q15)
   )
   (:action s570_plan-base-motion
          :parameters (#q12 #q16)
          :precondition (and (isbconf #q12) (isbconf #q16))
          :effect (basemotion #q12 #t534 #q16)
   )
   (:action s571_plan-base-motion
          :parameters (#q12 #q17)
          :precondition (and (isbconf #q12) (isbconf #q17))
          :effect (basemotion #q12 #t535 #q17)
   )
   (:action s572_plan-base-motion
          :parameters (#q12 #q18)
          :precondition (and (isbconf #q12) (isbconf #q18))
          :effect (basemotion #q12 #t536 #q18)
   )
   (:action s573_plan-base-motion
          :parameters (#q12 #q19)
          :precondition (and (isbconf #q12) (isbconf #q19))
          :effect (basemotion #q12 #t537 #q19)
   )
   (:action s574_plan-base-motion
          :parameters (#q12 #q20)
          :precondition (and (isbconf #q12) (isbconf #q20))
          :effect (basemotion #q12 #t538 #q20)
   )
   (:action s575_plan-base-motion
          :parameters (#q12 #q21)
          :precondition (and (isbconf #q12) (isbconf #q21))
          :effect (basemotion #q12 #t539 #q21)
   )
   (:action s576_plan-base-motion
          :parameters (#q12 #q22)
          :precondition (and (isbconf #q12) (isbconf #q22))
          :effect (basemotion #q12 #t540 #q22)
   )
   (:action s577_plan-base-motion
          :parameters (#q12 #q23)
          :precondition (and (isbconf #q12) (isbconf #q23))
          :effect (basemotion #q12 #t541 #q23)
   )
   (:action s578_plan-base-motion
          :parameters (#q12 #q24)
          :precondition (and (isbconf #q12) (isbconf #q24))
          :effect (basemotion #q12 #t542 #q24)
   )
   (:action s579_plan-base-motion
          :parameters (#q12 #q25)
          :precondition (and (isbconf #q12) (isbconf #q25))
          :effect (basemotion #q12 #t543 #q25)
   )
   (:action s580_plan-base-motion
          :parameters (#q12 #q26)
          :precondition (and (isbconf #q12) (isbconf #q26))
          :effect (basemotion #q12 #t544 #q26)
   )
   (:action s581_plan-base-motion
          :parameters (#q12 #q27)
          :precondition (and (isbconf #q12) (isbconf #q27))
          :effect (basemotion #q12 #t545 #q27)
   )
   (:action s582_plan-base-motion
          :parameters (#q12 #q28)
          :precondition (and (isbconf #q12) (isbconf #q28))
          :effect (basemotion #q12 #t546 #q28)
   )
   (:action s583_plan-base-motion
          :parameters (#q12 #q29)
          :precondition (and (isbconf #q12) (isbconf #q29))
          :effect (basemotion #q12 #t547 #q29)
   )
   (:action s584_plan-base-motion
          :parameters (#q12 #q30)
          :precondition (and (isbconf #q12) (isbconf #q30))
          :effect (basemotion #q12 #t548 #q30)
   )
   (:action s585_plan-base-motion
          :parameters (#q12 #q31)
          :precondition (and (isbconf #q12) (isbconf #q31))
          :effect (basemotion #q12 #t549 #q31)
   )
   (:action s586_plan-base-motion
          :parameters (#q12 #q32)
          :precondition (and (isbconf #q12) (isbconf #q32))
          :effect (basemotion #q12 #t550 #q32)
   )
   (:action s587_plan-base-motion
          :parameters (#q12 #q33)
          :precondition (and (isbconf #q12) (isbconf #q33))
          :effect (basemotion #q12 #t551 #q33)
   )
   (:action s588_plan-base-motion
          :parameters (#q12 #q34)
          :precondition (and (isbconf #q12) (isbconf #q34))
          :effect (basemotion #q12 #t552 #q34)
   )
   (:action s589_plan-base-motion
          :parameters (#q12 #q35)
          :precondition (and (isbconf #q12) (isbconf #q35))
          :effect (basemotion #q12 #t553 #q35)
   )
   (:action s590_plan-base-motion
          :parameters (#q13 q976)
          :precondition (and (isbconf #q13) (isbconf q976))
          :effect (basemotion #q13 #t554 q976)
   )
   (:action s591_plan-base-motion
          :parameters (#q13 #q0)
          :precondition (and (isbconf #q13) (isbconf #q0))
          :effect (basemotion #q13 #t555 #q0)
   )
   (:action s592_plan-base-motion
          :parameters (#q13 #q1)
          :precondition (and (isbconf #q13) (isbconf #q1))
          :effect (basemotion #q13 #t556 #q1)
   )
   (:action s593_plan-base-motion
          :parameters (#q13 #q2)
          :precondition (and (isbconf #q13) (isbconf #q2))
          :effect (basemotion #q13 #t557 #q2)
   )
   (:action s594_plan-base-motion
          :parameters (#q13 #q3)
          :precondition (and (isbconf #q13) (isbconf #q3))
          :effect (basemotion #q13 #t558 #q3)
   )
   (:action s595_plan-base-motion
          :parameters (#q13 #q4)
          :precondition (and (isbconf #q13) (isbconf #q4))
          :effect (basemotion #q13 #t559 #q4)
   )
   (:action s596_plan-base-motion
          :parameters (#q13 #q5)
          :precondition (and (isbconf #q13) (isbconf #q5))
          :effect (basemotion #q13 #t560 #q5)
   )
   (:action s597_plan-base-motion
          :parameters (#q13 #q6)
          :precondition (and (isbconf #q13) (isbconf #q6))
          :effect (basemotion #q13 #t561 #q6)
   )
   (:action s598_plan-base-motion
          :parameters (#q13 #q7)
          :precondition (and (isbconf #q13) (isbconf #q7))
          :effect (basemotion #q13 #t562 #q7)
   )
   (:action s599_plan-base-motion
          :parameters (#q13 #q8)
          :precondition (and (isbconf #q13) (isbconf #q8))
          :effect (basemotion #q13 #t563 #q8)
   )
   (:action s600_plan-base-motion
          :parameters (#q13 #q9)
          :precondition (and (isbconf #q13) (isbconf #q9))
          :effect (basemotion #q13 #t564 #q9)
   )
   (:action s601_plan-base-motion
          :parameters (#q13 #q10)
          :precondition (and (isbconf #q13) (isbconf #q10))
          :effect (basemotion #q13 #t565 #q10)
   )
   (:action s602_plan-base-motion
          :parameters (#q13 #q11)
          :precondition (and (isbconf #q13) (isbconf #q11))
          :effect (basemotion #q13 #t566 #q11)
   )
   (:action s603_plan-base-motion
          :parameters (#q13 #q12)
          :precondition (and (isbconf #q13) (isbconf #q12))
          :effect (basemotion #q13 #t567 #q12)
   )
   (:action s604_plan-base-motion
          :parameters (#q13 #q13)
          :precondition (and (isbconf #q13) (isbconf #q13))
          :effect (basemotion #q13 #t568 #q13)
   )
   (:action s605_plan-base-motion
          :parameters (#q13 #q14)
          :precondition (and (isbconf #q13) (isbconf #q14))
          :effect (basemotion #q13 #t569 #q14)
   )
   (:action s606_plan-base-motion
          :parameters (#q13 #q15)
          :precondition (and (isbconf #q13) (isbconf #q15))
          :effect (basemotion #q13 #t570 #q15)
   )
   (:action s607_plan-base-motion
          :parameters (#q13 #q16)
          :precondition (and (isbconf #q13) (isbconf #q16))
          :effect (basemotion #q13 #t571 #q16)
   )
   (:action s608_plan-base-motion
          :parameters (#q13 #q17)
          :precondition (and (isbconf #q13) (isbconf #q17))
          :effect (basemotion #q13 #t572 #q17)
   )
   (:action s609_plan-base-motion
          :parameters (#q13 #q18)
          :precondition (and (isbconf #q13) (isbconf #q18))
          :effect (basemotion #q13 #t573 #q18)
   )
   (:action s610_plan-base-motion
          :parameters (#q13 #q19)
          :precondition (and (isbconf #q13) (isbconf #q19))
          :effect (basemotion #q13 #t574 #q19)
   )
   (:action s611_plan-base-motion
          :parameters (#q13 #q20)
          :precondition (and (isbconf #q13) (isbconf #q20))
          :effect (basemotion #q13 #t575 #q20)
   )
   (:action s612_plan-base-motion
          :parameters (#q13 #q21)
          :precondition (and (isbconf #q13) (isbconf #q21))
          :effect (basemotion #q13 #t576 #q21)
   )
   (:action s613_plan-base-motion
          :parameters (#q13 #q22)
          :precondition (and (isbconf #q13) (isbconf #q22))
          :effect (basemotion #q13 #t577 #q22)
   )
   (:action s614_plan-base-motion
          :parameters (#q13 #q23)
          :precondition (and (isbconf #q13) (isbconf #q23))
          :effect (basemotion #q13 #t578 #q23)
   )
   (:action s615_plan-base-motion
          :parameters (#q13 #q24)
          :precondition (and (isbconf #q13) (isbconf #q24))
          :effect (basemotion #q13 #t579 #q24)
   )
   (:action s616_plan-base-motion
          :parameters (#q13 #q25)
          :precondition (and (isbconf #q13) (isbconf #q25))
          :effect (basemotion #q13 #t580 #q25)
   )
   (:action s617_plan-base-motion
          :parameters (#q13 #q26)
          :precondition (and (isbconf #q13) (isbconf #q26))
          :effect (basemotion #q13 #t581 #q26)
   )
   (:action s618_plan-base-motion
          :parameters (#q13 #q27)
          :precondition (and (isbconf #q13) (isbconf #q27))
          :effect (basemotion #q13 #t582 #q27)
   )
   (:action s619_plan-base-motion
          :parameters (#q13 #q28)
          :precondition (and (isbconf #q13) (isbconf #q28))
          :effect (basemotion #q13 #t583 #q28)
   )
   (:action s620_plan-base-motion
          :parameters (#q13 #q29)
          :precondition (and (isbconf #q13) (isbconf #q29))
          :effect (basemotion #q13 #t584 #q29)
   )
   (:action s621_plan-base-motion
          :parameters (#q13 #q30)
          :precondition (and (isbconf #q13) (isbconf #q30))
          :effect (basemotion #q13 #t585 #q30)
   )
   (:action s622_plan-base-motion
          :parameters (#q13 #q31)
          :precondition (and (isbconf #q13) (isbconf #q31))
          :effect (basemotion #q13 #t586 #q31)
   )
   (:action s623_plan-base-motion
          :parameters (#q13 #q32)
          :precondition (and (isbconf #q13) (isbconf #q32))
          :effect (basemotion #q13 #t587 #q32)
   )
   (:action s624_plan-base-motion
          :parameters (#q13 #q33)
          :precondition (and (isbconf #q13) (isbconf #q33))
          :effect (basemotion #q13 #t588 #q33)
   )
   (:action s625_plan-base-motion
          :parameters (#q13 #q34)
          :precondition (and (isbconf #q13) (isbconf #q34))
          :effect (basemotion #q13 #t589 #q34)
   )
   (:action s626_plan-base-motion
          :parameters (#q13 #q35)
          :precondition (and (isbconf #q13) (isbconf #q35))
          :effect (basemotion #q13 #t590 #q35)
   )
   (:action s627_plan-base-motion
          :parameters (#q14 q976)
          :precondition (and (isbconf #q14) (isbconf q976))
          :effect (basemotion #q14 #t591 q976)
   )
   (:action s628_plan-base-motion
          :parameters (#q14 #q0)
          :precondition (and (isbconf #q14) (isbconf #q0))
          :effect (basemotion #q14 #t592 #q0)
   )
   (:action s629_plan-base-motion
          :parameters (#q14 #q1)
          :precondition (and (isbconf #q14) (isbconf #q1))
          :effect (basemotion #q14 #t593 #q1)
   )
   (:action s630_plan-base-motion
          :parameters (#q14 #q2)
          :precondition (and (isbconf #q14) (isbconf #q2))
          :effect (basemotion #q14 #t594 #q2)
   )
   (:action s631_plan-base-motion
          :parameters (#q14 #q3)
          :precondition (and (isbconf #q14) (isbconf #q3))
          :effect (basemotion #q14 #t595 #q3)
   )
   (:action s632_plan-base-motion
          :parameters (#q14 #q4)
          :precondition (and (isbconf #q14) (isbconf #q4))
          :effect (basemotion #q14 #t596 #q4)
   )
   (:action s633_plan-base-motion
          :parameters (#q14 #q5)
          :precondition (and (isbconf #q14) (isbconf #q5))
          :effect (basemotion #q14 #t597 #q5)
   )
   (:action s634_plan-base-motion
          :parameters (#q14 #q6)
          :precondition (and (isbconf #q14) (isbconf #q6))
          :effect (basemotion #q14 #t598 #q6)
   )
   (:action s635_plan-base-motion
          :parameters (#q14 #q7)
          :precondition (and (isbconf #q14) (isbconf #q7))
          :effect (basemotion #q14 #t599 #q7)
   )
   (:action s636_plan-base-motion
          :parameters (#q14 #q8)
          :precondition (and (isbconf #q14) (isbconf #q8))
          :effect (basemotion #q14 #t600 #q8)
   )
   (:action s637_plan-base-motion
          :parameters (#q14 #q9)
          :precondition (and (isbconf #q14) (isbconf #q9))
          :effect (basemotion #q14 #t601 #q9)
   )
   (:action s638_plan-base-motion
          :parameters (#q14 #q10)
          :precondition (and (isbconf #q14) (isbconf #q10))
          :effect (basemotion #q14 #t602 #q10)
   )
   (:action s639_plan-base-motion
          :parameters (#q14 #q11)
          :precondition (and (isbconf #q14) (isbconf #q11))
          :effect (basemotion #q14 #t603 #q11)
   )
   (:action s640_plan-base-motion
          :parameters (#q14 #q12)
          :precondition (and (isbconf #q14) (isbconf #q12))
          :effect (basemotion #q14 #t604 #q12)
   )
   (:action s641_plan-base-motion
          :parameters (#q14 #q13)
          :precondition (and (isbconf #q14) (isbconf #q13))
          :effect (basemotion #q14 #t605 #q13)
   )
   (:action s642_plan-base-motion
          :parameters (#q14 #q14)
          :precondition (and (isbconf #q14) (isbconf #q14))
          :effect (basemotion #q14 #t606 #q14)
   )
   (:action s643_plan-base-motion
          :parameters (#q14 #q15)
          :precondition (and (isbconf #q14) (isbconf #q15))
          :effect (basemotion #q14 #t607 #q15)
   )
   (:action s644_plan-base-motion
          :parameters (#q14 #q16)
          :precondition (and (isbconf #q14) (isbconf #q16))
          :effect (basemotion #q14 #t608 #q16)
   )
   (:action s645_plan-base-motion
          :parameters (#q14 #q17)
          :precondition (and (isbconf #q14) (isbconf #q17))
          :effect (basemotion #q14 #t609 #q17)
   )
   (:action s646_plan-base-motion
          :parameters (#q14 #q18)
          :precondition (and (isbconf #q14) (isbconf #q18))
          :effect (basemotion #q14 #t610 #q18)
   )
   (:action s647_plan-base-motion
          :parameters (#q14 #q19)
          :precondition (and (isbconf #q14) (isbconf #q19))
          :effect (basemotion #q14 #t611 #q19)
   )
   (:action s648_plan-base-motion
          :parameters (#q14 #q20)
          :precondition (and (isbconf #q14) (isbconf #q20))
          :effect (basemotion #q14 #t612 #q20)
   )
   (:action s649_plan-base-motion
          :parameters (#q14 #q21)
          :precondition (and (isbconf #q14) (isbconf #q21))
          :effect (basemotion #q14 #t613 #q21)
   )
   (:action s650_plan-base-motion
          :parameters (#q14 #q22)
          :precondition (and (isbconf #q14) (isbconf #q22))
          :effect (basemotion #q14 #t614 #q22)
   )
   (:action s651_plan-base-motion
          :parameters (#q14 #q23)
          :precondition (and (isbconf #q14) (isbconf #q23))
          :effect (basemotion #q14 #t615 #q23)
   )
   (:action s652_plan-base-motion
          :parameters (#q14 #q24)
          :precondition (and (isbconf #q14) (isbconf #q24))
          :effect (basemotion #q14 #t616 #q24)
   )
   (:action s653_plan-base-motion
          :parameters (#q14 #q25)
          :precondition (and (isbconf #q14) (isbconf #q25))
          :effect (basemotion #q14 #t617 #q25)
   )
   (:action s654_plan-base-motion
          :parameters (#q14 #q26)
          :precondition (and (isbconf #q14) (isbconf #q26))
          :effect (basemotion #q14 #t618 #q26)
   )
   (:action s655_plan-base-motion
          :parameters (#q14 #q27)
          :precondition (and (isbconf #q14) (isbconf #q27))
          :effect (basemotion #q14 #t619 #q27)
   )
   (:action s656_plan-base-motion
          :parameters (#q14 #q28)
          :precondition (and (isbconf #q14) (isbconf #q28))
          :effect (basemotion #q14 #t620 #q28)
   )
   (:action s657_plan-base-motion
          :parameters (#q14 #q29)
          :precondition (and (isbconf #q14) (isbconf #q29))
          :effect (basemotion #q14 #t621 #q29)
   )
   (:action s658_plan-base-motion
          :parameters (#q14 #q30)
          :precondition (and (isbconf #q14) (isbconf #q30))
          :effect (basemotion #q14 #t622 #q30)
   )
   (:action s659_plan-base-motion
          :parameters (#q14 #q31)
          :precondition (and (isbconf #q14) (isbconf #q31))
          :effect (basemotion #q14 #t623 #q31)
   )
   (:action s660_plan-base-motion
          :parameters (#q14 #q32)
          :precondition (and (isbconf #q14) (isbconf #q32))
          :effect (basemotion #q14 #t624 #q32)
   )
   (:action s661_plan-base-motion
          :parameters (#q14 #q33)
          :precondition (and (isbconf #q14) (isbconf #q33))
          :effect (basemotion #q14 #t625 #q33)
   )
   (:action s662_plan-base-motion
          :parameters (#q14 #q34)
          :precondition (and (isbconf #q14) (isbconf #q34))
          :effect (basemotion #q14 #t626 #q34)
   )
   (:action s663_plan-base-motion
          :parameters (#q14 #q35)
          :precondition (and (isbconf #q14) (isbconf #q35))
          :effect (basemotion #q14 #t627 #q35)
   )
   (:action s664_plan-base-motion
          :parameters (#q15 q976)
          :precondition (and (isbconf #q15) (isbconf q976))
          :effect (basemotion #q15 #t628 q976)
   )
   (:action s665_plan-base-motion
          :parameters (#q15 #q0)
          :precondition (and (isbconf #q15) (isbconf #q0))
          :effect (basemotion #q15 #t629 #q0)
   )
   (:action s666_plan-base-motion
          :parameters (#q15 #q1)
          :precondition (and (isbconf #q15) (isbconf #q1))
          :effect (basemotion #q15 #t630 #q1)
   )
   (:action s667_plan-base-motion
          :parameters (#q15 #q2)
          :precondition (and (isbconf #q15) (isbconf #q2))
          :effect (basemotion #q15 #t631 #q2)
   )
   (:action s668_plan-base-motion
          :parameters (#q15 #q3)
          :precondition (and (isbconf #q15) (isbconf #q3))
          :effect (basemotion #q15 #t632 #q3)
   )
   (:action s669_plan-base-motion
          :parameters (#q15 #q4)
          :precondition (and (isbconf #q15) (isbconf #q4))
          :effect (basemotion #q15 #t633 #q4)
   )
   (:action s670_plan-base-motion
          :parameters (#q15 #q5)
          :precondition (and (isbconf #q15) (isbconf #q5))
          :effect (basemotion #q15 #t634 #q5)
   )
   (:action s671_plan-base-motion
          :parameters (#q15 #q6)
          :precondition (and (isbconf #q15) (isbconf #q6))
          :effect (basemotion #q15 #t635 #q6)
   )
   (:action s672_plan-base-motion
          :parameters (#q15 #q7)
          :precondition (and (isbconf #q15) (isbconf #q7))
          :effect (basemotion #q15 #t636 #q7)
   )
   (:action s673_plan-base-motion
          :parameters (#q15 #q8)
          :precondition (and (isbconf #q15) (isbconf #q8))
          :effect (basemotion #q15 #t637 #q8)
   )
   (:action s674_plan-base-motion
          :parameters (#q15 #q9)
          :precondition (and (isbconf #q15) (isbconf #q9))
          :effect (basemotion #q15 #t638 #q9)
   )
   (:action s675_plan-base-motion
          :parameters (#q15 #q10)
          :precondition (and (isbconf #q15) (isbconf #q10))
          :effect (basemotion #q15 #t639 #q10)
   )
   (:action s676_plan-base-motion
          :parameters (#q15 #q11)
          :precondition (and (isbconf #q15) (isbconf #q11))
          :effect (basemotion #q15 #t640 #q11)
   )
   (:action s677_plan-base-motion
          :parameters (#q15 #q12)
          :precondition (and (isbconf #q15) (isbconf #q12))
          :effect (basemotion #q15 #t641 #q12)
   )
   (:action s678_plan-base-motion
          :parameters (#q15 #q13)
          :precondition (and (isbconf #q15) (isbconf #q13))
          :effect (basemotion #q15 #t642 #q13)
   )
   (:action s679_plan-base-motion
          :parameters (#q15 #q14)
          :precondition (and (isbconf #q15) (isbconf #q14))
          :effect (basemotion #q15 #t643 #q14)
   )
   (:action s680_plan-base-motion
          :parameters (#q15 #q15)
          :precondition (and (isbconf #q15) (isbconf #q15))
          :effect (basemotion #q15 #t644 #q15)
   )
   (:action s681_plan-base-motion
          :parameters (#q15 #q16)
          :precondition (and (isbconf #q15) (isbconf #q16))
          :effect (basemotion #q15 #t645 #q16)
   )
   (:action s682_plan-base-motion
          :parameters (#q15 #q17)
          :precondition (and (isbconf #q15) (isbconf #q17))
          :effect (basemotion #q15 #t646 #q17)
   )
   (:action s683_plan-base-motion
          :parameters (#q15 #q18)
          :precondition (and (isbconf #q15) (isbconf #q18))
          :effect (basemotion #q15 #t647 #q18)
   )
   (:action s684_plan-base-motion
          :parameters (#q15 #q19)
          :precondition (and (isbconf #q15) (isbconf #q19))
          :effect (basemotion #q15 #t648 #q19)
   )
   (:action s685_plan-base-motion
          :parameters (#q15 #q20)
          :precondition (and (isbconf #q15) (isbconf #q20))
          :effect (basemotion #q15 #t649 #q20)
   )
   (:action s686_plan-base-motion
          :parameters (#q15 #q21)
          :precondition (and (isbconf #q15) (isbconf #q21))
          :effect (basemotion #q15 #t650 #q21)
   )
   (:action s687_plan-base-motion
          :parameters (#q15 #q22)
          :precondition (and (isbconf #q15) (isbconf #q22))
          :effect (basemotion #q15 #t651 #q22)
   )
   (:action s688_plan-base-motion
          :parameters (#q15 #q23)
          :precondition (and (isbconf #q15) (isbconf #q23))
          :effect (basemotion #q15 #t652 #q23)
   )
   (:action s689_plan-base-motion
          :parameters (#q15 #q24)
          :precondition (and (isbconf #q15) (isbconf #q24))
          :effect (basemotion #q15 #t653 #q24)
   )
   (:action s690_plan-base-motion
          :parameters (#q15 #q25)
          :precondition (and (isbconf #q15) (isbconf #q25))
          :effect (basemotion #q15 #t654 #q25)
   )
   (:action s691_plan-base-motion
          :parameters (#q15 #q26)
          :precondition (and (isbconf #q15) (isbconf #q26))
          :effect (basemotion #q15 #t655 #q26)
   )
   (:action s692_plan-base-motion
          :parameters (#q15 #q27)
          :precondition (and (isbconf #q15) (isbconf #q27))
          :effect (basemotion #q15 #t656 #q27)
   )
   (:action s693_plan-base-motion
          :parameters (#q15 #q28)
          :precondition (and (isbconf #q15) (isbconf #q28))
          :effect (basemotion #q15 #t657 #q28)
   )
   (:action s694_plan-base-motion
          :parameters (#q15 #q29)
          :precondition (and (isbconf #q15) (isbconf #q29))
          :effect (basemotion #q15 #t658 #q29)
   )
   (:action s695_plan-base-motion
          :parameters (#q15 #q30)
          :precondition (and (isbconf #q15) (isbconf #q30))
          :effect (basemotion #q15 #t659 #q30)
   )
   (:action s696_plan-base-motion
          :parameters (#q15 #q31)
          :precondition (and (isbconf #q15) (isbconf #q31))
          :effect (basemotion #q15 #t660 #q31)
   )
   (:action s697_plan-base-motion
          :parameters (#q15 #q32)
          :precondition (and (isbconf #q15) (isbconf #q32))
          :effect (basemotion #q15 #t661 #q32)
   )
   (:action s698_plan-base-motion
          :parameters (#q15 #q33)
          :precondition (and (isbconf #q15) (isbconf #q33))
          :effect (basemotion #q15 #t662 #q33)
   )
   (:action s699_plan-base-motion
          :parameters (#q15 #q34)
          :precondition (and (isbconf #q15) (isbconf #q34))
          :effect (basemotion #q15 #t663 #q34)
   )
   (:action s700_plan-base-motion
          :parameters (#q15 #q35)
          :precondition (and (isbconf #q15) (isbconf #q35))
          :effect (basemotion #q15 #t664 #q35)
   )
   (:action s701_plan-base-motion
          :parameters (#q16 q976)
          :precondition (and (isbconf #q16) (isbconf q976))
          :effect (basemotion #q16 #t665 q976)
   )
   (:action s702_plan-base-motion
          :parameters (#q16 #q0)
          :precondition (and (isbconf #q16) (isbconf #q0))
          :effect (basemotion #q16 #t666 #q0)
   )
   (:action s703_plan-base-motion
          :parameters (#q16 #q1)
          :precondition (and (isbconf #q16) (isbconf #q1))
          :effect (basemotion #q16 #t667 #q1)
   )
   (:action s704_plan-base-motion
          :parameters (#q16 #q2)
          :precondition (and (isbconf #q16) (isbconf #q2))
          :effect (basemotion #q16 #t668 #q2)
   )
   (:action s705_plan-base-motion
          :parameters (#q16 #q3)
          :precondition (and (isbconf #q16) (isbconf #q3))
          :effect (basemotion #q16 #t669 #q3)
   )
   (:action s706_plan-base-motion
          :parameters (#q16 #q4)
          :precondition (and (isbconf #q16) (isbconf #q4))
          :effect (basemotion #q16 #t670 #q4)
   )
   (:action s707_plan-base-motion
          :parameters (#q16 #q5)
          :precondition (and (isbconf #q16) (isbconf #q5))
          :effect (basemotion #q16 #t671 #q5)
   )
   (:action s708_plan-base-motion
          :parameters (#q16 #q6)
          :precondition (and (isbconf #q16) (isbconf #q6))
          :effect (basemotion #q16 #t672 #q6)
   )
   (:action s709_plan-base-motion
          :parameters (#q16 #q7)
          :precondition (and (isbconf #q16) (isbconf #q7))
          :effect (basemotion #q16 #t673 #q7)
   )
   (:action s710_plan-base-motion
          :parameters (#q16 #q8)
          :precondition (and (isbconf #q16) (isbconf #q8))
          :effect (basemotion #q16 #t674 #q8)
   )
   (:action s711_plan-base-motion
          :parameters (#q16 #q9)
          :precondition (and (isbconf #q16) (isbconf #q9))
          :effect (basemotion #q16 #t675 #q9)
   )
   (:action s712_plan-base-motion
          :parameters (#q16 #q10)
          :precondition (and (isbconf #q16) (isbconf #q10))
          :effect (basemotion #q16 #t676 #q10)
   )
   (:action s713_plan-base-motion
          :parameters (#q16 #q11)
          :precondition (and (isbconf #q16) (isbconf #q11))
          :effect (basemotion #q16 #t677 #q11)
   )
   (:action s714_plan-base-motion
          :parameters (#q16 #q12)
          :precondition (and (isbconf #q16) (isbconf #q12))
          :effect (basemotion #q16 #t678 #q12)
   )
   (:action s715_plan-base-motion
          :parameters (#q16 #q13)
          :precondition (and (isbconf #q16) (isbconf #q13))
          :effect (basemotion #q16 #t679 #q13)
   )
   (:action s716_plan-base-motion
          :parameters (#q16 #q14)
          :precondition (and (isbconf #q16) (isbconf #q14))
          :effect (basemotion #q16 #t680 #q14)
   )
   (:action s717_plan-base-motion
          :parameters (#q16 #q15)
          :precondition (and (isbconf #q16) (isbconf #q15))
          :effect (basemotion #q16 #t681 #q15)
   )
   (:action s718_plan-base-motion
          :parameters (#q16 #q16)
          :precondition (and (isbconf #q16) (isbconf #q16))
          :effect (basemotion #q16 #t682 #q16)
   )
   (:action s719_plan-base-motion
          :parameters (#q16 #q17)
          :precondition (and (isbconf #q16) (isbconf #q17))
          :effect (basemotion #q16 #t683 #q17)
   )
   (:action s720_plan-base-motion
          :parameters (#q16 #q18)
          :precondition (and (isbconf #q16) (isbconf #q18))
          :effect (basemotion #q16 #t684 #q18)
   )
   (:action s721_plan-base-motion
          :parameters (#q16 #q19)
          :precondition (and (isbconf #q16) (isbconf #q19))
          :effect (basemotion #q16 #t685 #q19)
   )
   (:action s722_plan-base-motion
          :parameters (#q16 #q20)
          :precondition (and (isbconf #q16) (isbconf #q20))
          :effect (basemotion #q16 #t686 #q20)
   )
   (:action s723_plan-base-motion
          :parameters (#q16 #q21)
          :precondition (and (isbconf #q16) (isbconf #q21))
          :effect (basemotion #q16 #t687 #q21)
   )
   (:action s724_plan-base-motion
          :parameters (#q16 #q22)
          :precondition (and (isbconf #q16) (isbconf #q22))
          :effect (basemotion #q16 #t688 #q22)
   )
   (:action s725_plan-base-motion
          :parameters (#q16 #q23)
          :precondition (and (isbconf #q16) (isbconf #q23))
          :effect (basemotion #q16 #t689 #q23)
   )
   (:action s726_plan-base-motion
          :parameters (#q16 #q24)
          :precondition (and (isbconf #q16) (isbconf #q24))
          :effect (basemotion #q16 #t690 #q24)
   )
   (:action s727_plan-base-motion
          :parameters (#q16 #q25)
          :precondition (and (isbconf #q16) (isbconf #q25))
          :effect (basemotion #q16 #t691 #q25)
   )
   (:action s728_plan-base-motion
          :parameters (#q16 #q26)
          :precondition (and (isbconf #q16) (isbconf #q26))
          :effect (basemotion #q16 #t692 #q26)
   )
   (:action s729_plan-base-motion
          :parameters (#q16 #q27)
          :precondition (and (isbconf #q16) (isbconf #q27))
          :effect (basemotion #q16 #t693 #q27)
   )
   (:action s730_plan-base-motion
          :parameters (#q16 #q28)
          :precondition (and (isbconf #q16) (isbconf #q28))
          :effect (basemotion #q16 #t694 #q28)
   )
   (:action s731_plan-base-motion
          :parameters (#q16 #q29)
          :precondition (and (isbconf #q16) (isbconf #q29))
          :effect (basemotion #q16 #t695 #q29)
   )
   (:action s732_plan-base-motion
          :parameters (#q16 #q30)
          :precondition (and (isbconf #q16) (isbconf #q30))
          :effect (basemotion #q16 #t696 #q30)
   )
   (:action s733_plan-base-motion
          :parameters (#q16 #q31)
          :precondition (and (isbconf #q16) (isbconf #q31))
          :effect (basemotion #q16 #t697 #q31)
   )
   (:action s734_plan-base-motion
          :parameters (#q16 #q32)
          :precondition (and (isbconf #q16) (isbconf #q32))
          :effect (basemotion #q16 #t698 #q32)
   )
   (:action s735_plan-base-motion
          :parameters (#q16 #q33)
          :precondition (and (isbconf #q16) (isbconf #q33))
          :effect (basemotion #q16 #t699 #q33)
   )
   (:action s736_plan-base-motion
          :parameters (#q16 #q34)
          :precondition (and (isbconf #q16) (isbconf #q34))
          :effect (basemotion #q16 #t700 #q34)
   )
   (:action s737_plan-base-motion
          :parameters (#q16 #q35)
          :precondition (and (isbconf #q16) (isbconf #q35))
          :effect (basemotion #q16 #t701 #q35)
   )
   (:action s738_plan-base-motion
          :parameters (#q17 q976)
          :precondition (and (isbconf #q17) (isbconf q976))
          :effect (basemotion #q17 #t702 q976)
   )
   (:action s739_plan-base-motion
          :parameters (#q17 #q0)
          :precondition (and (isbconf #q17) (isbconf #q0))
          :effect (basemotion #q17 #t703 #q0)
   )
   (:action s740_plan-base-motion
          :parameters (#q17 #q1)
          :precondition (and (isbconf #q17) (isbconf #q1))
          :effect (basemotion #q17 #t704 #q1)
   )
   (:action s741_plan-base-motion
          :parameters (#q17 #q2)
          :precondition (and (isbconf #q17) (isbconf #q2))
          :effect (basemotion #q17 #t705 #q2)
   )
   (:action s742_plan-base-motion
          :parameters (#q17 #q3)
          :precondition (and (isbconf #q17) (isbconf #q3))
          :effect (basemotion #q17 #t706 #q3)
   )
   (:action s743_plan-base-motion
          :parameters (#q17 #q4)
          :precondition (and (isbconf #q17) (isbconf #q4))
          :effect (basemotion #q17 #t707 #q4)
   )
   (:action s744_plan-base-motion
          :parameters (#q17 #q5)
          :precondition (and (isbconf #q17) (isbconf #q5))
          :effect (basemotion #q17 #t708 #q5)
   )
   (:action s745_plan-base-motion
          :parameters (#q17 #q6)
          :precondition (and (isbconf #q17) (isbconf #q6))
          :effect (basemotion #q17 #t709 #q6)
   )
   (:action s746_plan-base-motion
          :parameters (#q17 #q7)
          :precondition (and (isbconf #q17) (isbconf #q7))
          :effect (basemotion #q17 #t710 #q7)
   )
   (:action s747_plan-base-motion
          :parameters (#q17 #q8)
          :precondition (and (isbconf #q17) (isbconf #q8))
          :effect (basemotion #q17 #t711 #q8)
   )
   (:action s748_plan-base-motion
          :parameters (#q17 #q9)
          :precondition (and (isbconf #q17) (isbconf #q9))
          :effect (basemotion #q17 #t712 #q9)
   )
   (:action s749_plan-base-motion
          :parameters (#q17 #q10)
          :precondition (and (isbconf #q17) (isbconf #q10))
          :effect (basemotion #q17 #t713 #q10)
   )
   (:action s750_plan-base-motion
          :parameters (#q17 #q11)
          :precondition (and (isbconf #q17) (isbconf #q11))
          :effect (basemotion #q17 #t714 #q11)
   )
   (:action s751_plan-base-motion
          :parameters (#q17 #q12)
          :precondition (and (isbconf #q17) (isbconf #q12))
          :effect (basemotion #q17 #t715 #q12)
   )
   (:action s752_plan-base-motion
          :parameters (#q17 #q13)
          :precondition (and (isbconf #q17) (isbconf #q13))
          :effect (basemotion #q17 #t716 #q13)
   )
   (:action s753_plan-base-motion
          :parameters (#q17 #q14)
          :precondition (and (isbconf #q17) (isbconf #q14))
          :effect (basemotion #q17 #t717 #q14)
   )
   (:action s754_plan-base-motion
          :parameters (#q17 #q15)
          :precondition (and (isbconf #q17) (isbconf #q15))
          :effect (basemotion #q17 #t718 #q15)
   )
   (:action s755_plan-base-motion
          :parameters (#q17 #q16)
          :precondition (and (isbconf #q17) (isbconf #q16))
          :effect (basemotion #q17 #t719 #q16)
   )
   (:action s756_plan-base-motion
          :parameters (#q17 #q17)
          :precondition (and (isbconf #q17) (isbconf #q17))
          :effect (basemotion #q17 #t720 #q17)
   )
   (:action s757_plan-base-motion
          :parameters (#q17 #q18)
          :precondition (and (isbconf #q17) (isbconf #q18))
          :effect (basemotion #q17 #t721 #q18)
   )
   (:action s758_plan-base-motion
          :parameters (#q17 #q19)
          :precondition (and (isbconf #q17) (isbconf #q19))
          :effect (basemotion #q17 #t722 #q19)
   )
   (:action s759_plan-base-motion
          :parameters (#q17 #q20)
          :precondition (and (isbconf #q17) (isbconf #q20))
          :effect (basemotion #q17 #t723 #q20)
   )
   (:action s760_plan-base-motion
          :parameters (#q17 #q21)
          :precondition (and (isbconf #q17) (isbconf #q21))
          :effect (basemotion #q17 #t724 #q21)
   )
   (:action s761_plan-base-motion
          :parameters (#q17 #q22)
          :precondition (and (isbconf #q17) (isbconf #q22))
          :effect (basemotion #q17 #t725 #q22)
   )
   (:action s762_plan-base-motion
          :parameters (#q17 #q23)
          :precondition (and (isbconf #q17) (isbconf #q23))
          :effect (basemotion #q17 #t726 #q23)
   )
   (:action s763_plan-base-motion
          :parameters (#q17 #q24)
          :precondition (and (isbconf #q17) (isbconf #q24))
          :effect (basemotion #q17 #t727 #q24)
   )
   (:action s764_plan-base-motion
          :parameters (#q17 #q25)
          :precondition (and (isbconf #q17) (isbconf #q25))
          :effect (basemotion #q17 #t728 #q25)
   )
   (:action s765_plan-base-motion
          :parameters (#q17 #q26)
          :precondition (and (isbconf #q17) (isbconf #q26))
          :effect (basemotion #q17 #t729 #q26)
   )
   (:action s766_plan-base-motion
          :parameters (#q17 #q27)
          :precondition (and (isbconf #q17) (isbconf #q27))
          :effect (basemotion #q17 #t730 #q27)
   )
   (:action s767_plan-base-motion
          :parameters (#q17 #q28)
          :precondition (and (isbconf #q17) (isbconf #q28))
          :effect (basemotion #q17 #t731 #q28)
   )
   (:action s768_plan-base-motion
          :parameters (#q17 #q29)
          :precondition (and (isbconf #q17) (isbconf #q29))
          :effect (basemotion #q17 #t732 #q29)
   )
   (:action s769_plan-base-motion
          :parameters (#q17 #q30)
          :precondition (and (isbconf #q17) (isbconf #q30))
          :effect (basemotion #q17 #t733 #q30)
   )
   (:action s770_plan-base-motion
          :parameters (#q17 #q31)
          :precondition (and (isbconf #q17) (isbconf #q31))
          :effect (basemotion #q17 #t734 #q31)
   )
   (:action s771_plan-base-motion
          :parameters (#q17 #q32)
          :precondition (and (isbconf #q17) (isbconf #q32))
          :effect (basemotion #q17 #t735 #q32)
   )
   (:action s772_plan-base-motion
          :parameters (#q17 #q33)
          :precondition (and (isbconf #q17) (isbconf #q33))
          :effect (basemotion #q17 #t736 #q33)
   )
   (:action s773_plan-base-motion
          :parameters (#q17 #q34)
          :precondition (and (isbconf #q17) (isbconf #q34))
          :effect (basemotion #q17 #t737 #q34)
   )
   (:action s774_plan-base-motion
          :parameters (#q17 #q35)
          :precondition (and (isbconf #q17) (isbconf #q35))
          :effect (basemotion #q17 #t738 #q35)
   )
   (:action s775_plan-base-motion
          :parameters (#q18 q976)
          :precondition (and (isbconf #q18) (isbconf q976))
          :effect (basemotion #q18 #t739 q976)
   )
   (:action s776_plan-base-motion
          :parameters (#q18 #q0)
          :precondition (and (isbconf #q18) (isbconf #q0))
          :effect (basemotion #q18 #t740 #q0)
   )
   (:action s777_plan-base-motion
          :parameters (#q18 #q1)
          :precondition (and (isbconf #q18) (isbconf #q1))
          :effect (basemotion #q18 #t741 #q1)
   )
   (:action s778_plan-base-motion
          :parameters (#q18 #q2)
          :precondition (and (isbconf #q18) (isbconf #q2))
          :effect (basemotion #q18 #t742 #q2)
   )
   (:action s779_plan-base-motion
          :parameters (#q18 #q3)
          :precondition (and (isbconf #q18) (isbconf #q3))
          :effect (basemotion #q18 #t743 #q3)
   )
   (:action s780_plan-base-motion
          :parameters (#q18 #q4)
          :precondition (and (isbconf #q18) (isbconf #q4))
          :effect (basemotion #q18 #t744 #q4)
   )
   (:action s781_plan-base-motion
          :parameters (#q18 #q5)
          :precondition (and (isbconf #q18) (isbconf #q5))
          :effect (basemotion #q18 #t745 #q5)
   )
   (:action s782_plan-base-motion
          :parameters (#q18 #q6)
          :precondition (and (isbconf #q18) (isbconf #q6))
          :effect (basemotion #q18 #t746 #q6)
   )
   (:action s783_plan-base-motion
          :parameters (#q18 #q7)
          :precondition (and (isbconf #q18) (isbconf #q7))
          :effect (basemotion #q18 #t747 #q7)
   )
   (:action s784_plan-base-motion
          :parameters (#q18 #q8)
          :precondition (and (isbconf #q18) (isbconf #q8))
          :effect (basemotion #q18 #t748 #q8)
   )
   (:action s785_plan-base-motion
          :parameters (#q18 #q9)
          :precondition (and (isbconf #q18) (isbconf #q9))
          :effect (basemotion #q18 #t749 #q9)
   )
   (:action s786_plan-base-motion
          :parameters (#q18 #q10)
          :precondition (and (isbconf #q18) (isbconf #q10))
          :effect (basemotion #q18 #t750 #q10)
   )
   (:action s787_plan-base-motion
          :parameters (#q18 #q11)
          :precondition (and (isbconf #q18) (isbconf #q11))
          :effect (basemotion #q18 #t751 #q11)
   )
   (:action s788_plan-base-motion
          :parameters (#q18 #q12)
          :precondition (and (isbconf #q18) (isbconf #q12))
          :effect (basemotion #q18 #t752 #q12)
   )
   (:action s789_plan-base-motion
          :parameters (#q18 #q13)
          :precondition (and (isbconf #q18) (isbconf #q13))
          :effect (basemotion #q18 #t753 #q13)
   )
   (:action s790_plan-base-motion
          :parameters (#q18 #q14)
          :precondition (and (isbconf #q18) (isbconf #q14))
          :effect (basemotion #q18 #t754 #q14)
   )
   (:action s791_plan-base-motion
          :parameters (#q18 #q15)
          :precondition (and (isbconf #q18) (isbconf #q15))
          :effect (basemotion #q18 #t755 #q15)
   )
   (:action s792_plan-base-motion
          :parameters (#q18 #q16)
          :precondition (and (isbconf #q18) (isbconf #q16))
          :effect (basemotion #q18 #t756 #q16)
   )
   (:action s793_plan-base-motion
          :parameters (#q18 #q17)
          :precondition (and (isbconf #q18) (isbconf #q17))
          :effect (basemotion #q18 #t757 #q17)
   )
   (:action s794_plan-base-motion
          :parameters (#q18 #q18)
          :precondition (and (isbconf #q18) (isbconf #q18))
          :effect (basemotion #q18 #t758 #q18)
   )
   (:action s795_plan-base-motion
          :parameters (#q18 #q19)
          :precondition (and (isbconf #q18) (isbconf #q19))
          :effect (basemotion #q18 #t759 #q19)
   )
   (:action s796_plan-base-motion
          :parameters (#q18 #q20)
          :precondition (and (isbconf #q18) (isbconf #q20))
          :effect (basemotion #q18 #t760 #q20)
   )
   (:action s797_plan-base-motion
          :parameters (#q18 #q21)
          :precondition (and (isbconf #q18) (isbconf #q21))
          :effect (basemotion #q18 #t761 #q21)
   )
   (:action s798_plan-base-motion
          :parameters (#q18 #q22)
          :precondition (and (isbconf #q18) (isbconf #q22))
          :effect (basemotion #q18 #t762 #q22)
   )
   (:action s799_plan-base-motion
          :parameters (#q18 #q23)
          :precondition (and (isbconf #q18) (isbconf #q23))
          :effect (basemotion #q18 #t763 #q23)
   )
   (:action s800_plan-base-motion
          :parameters (#q18 #q24)
          :precondition (and (isbconf #q18) (isbconf #q24))
          :effect (basemotion #q18 #t764 #q24)
   )
   (:action s801_plan-base-motion
          :parameters (#q18 #q25)
          :precondition (and (isbconf #q18) (isbconf #q25))
          :effect (basemotion #q18 #t765 #q25)
   )
   (:action s802_plan-base-motion
          :parameters (#q18 #q26)
          :precondition (and (isbconf #q18) (isbconf #q26))
          :effect (basemotion #q18 #t766 #q26)
   )
   (:action s803_plan-base-motion
          :parameters (#q18 #q27)
          :precondition (and (isbconf #q18) (isbconf #q27))
          :effect (basemotion #q18 #t767 #q27)
   )
   (:action s804_plan-base-motion
          :parameters (#q18 #q28)
          :precondition (and (isbconf #q18) (isbconf #q28))
          :effect (basemotion #q18 #t768 #q28)
   )
   (:action s805_plan-base-motion
          :parameters (#q18 #q29)
          :precondition (and (isbconf #q18) (isbconf #q29))
          :effect (basemotion #q18 #t769 #q29)
   )
   (:action s806_plan-base-motion
          :parameters (#q18 #q30)
          :precondition (and (isbconf #q18) (isbconf #q30))
          :effect (basemotion #q18 #t770 #q30)
   )
   (:action s807_plan-base-motion
          :parameters (#q18 #q31)
          :precondition (and (isbconf #q18) (isbconf #q31))
          :effect (basemotion #q18 #t771 #q31)
   )
   (:action s808_plan-base-motion
          :parameters (#q18 #q32)
          :precondition (and (isbconf #q18) (isbconf #q32))
          :effect (basemotion #q18 #t772 #q32)
   )
   (:action s809_plan-base-motion
          :parameters (#q18 #q33)
          :precondition (and (isbconf #q18) (isbconf #q33))
          :effect (basemotion #q18 #t773 #q33)
   )
   (:action s810_plan-base-motion
          :parameters (#q18 #q34)
          :precondition (and (isbconf #q18) (isbconf #q34))
          :effect (basemotion #q18 #t774 #q34)
   )
   (:action s811_plan-base-motion
          :parameters (#q18 #q35)
          :precondition (and (isbconf #q18) (isbconf #q35))
          :effect (basemotion #q18 #t775 #q35)
   )
   (:action s812_plan-base-motion
          :parameters (#q19 q976)
          :precondition (and (isbconf #q19) (isbconf q976))
          :effect (basemotion #q19 #t776 q976)
   )
   (:action s813_plan-base-motion
          :parameters (#q19 #q0)
          :precondition (and (isbconf #q19) (isbconf #q0))
          :effect (basemotion #q19 #t777 #q0)
   )
   (:action s814_plan-base-motion
          :parameters (#q19 #q1)
          :precondition (and (isbconf #q19) (isbconf #q1))
          :effect (basemotion #q19 #t778 #q1)
   )
   (:action s815_plan-base-motion
          :parameters (#q19 #q2)
          :precondition (and (isbconf #q19) (isbconf #q2))
          :effect (basemotion #q19 #t779 #q2)
   )
   (:action s816_plan-base-motion
          :parameters (#q19 #q3)
          :precondition (and (isbconf #q19) (isbconf #q3))
          :effect (basemotion #q19 #t780 #q3)
   )
   (:action s817_plan-base-motion
          :parameters (#q19 #q4)
          :precondition (and (isbconf #q19) (isbconf #q4))
          :effect (basemotion #q19 #t781 #q4)
   )
   (:action s818_plan-base-motion
          :parameters (#q19 #q5)
          :precondition (and (isbconf #q19) (isbconf #q5))
          :effect (basemotion #q19 #t782 #q5)
   )
   (:action s819_plan-base-motion
          :parameters (#q19 #q6)
          :precondition (and (isbconf #q19) (isbconf #q6))
          :effect (basemotion #q19 #t783 #q6)
   )
   (:action s820_plan-base-motion
          :parameters (#q19 #q7)
          :precondition (and (isbconf #q19) (isbconf #q7))
          :effect (basemotion #q19 #t784 #q7)
   )
   (:action s821_plan-base-motion
          :parameters (#q19 #q8)
          :precondition (and (isbconf #q19) (isbconf #q8))
          :effect (basemotion #q19 #t785 #q8)
   )
   (:action s822_plan-base-motion
          :parameters (#q19 #q9)
          :precondition (and (isbconf #q19) (isbconf #q9))
          :effect (basemotion #q19 #t786 #q9)
   )
   (:action s823_plan-base-motion
          :parameters (#q19 #q10)
          :precondition (and (isbconf #q19) (isbconf #q10))
          :effect (basemotion #q19 #t787 #q10)
   )
   (:action s824_plan-base-motion
          :parameters (#q19 #q11)
          :precondition (and (isbconf #q19) (isbconf #q11))
          :effect (basemotion #q19 #t788 #q11)
   )
   (:action s825_plan-base-motion
          :parameters (#q19 #q12)
          :precondition (and (isbconf #q19) (isbconf #q12))
          :effect (basemotion #q19 #t789 #q12)
   )
   (:action s826_plan-base-motion
          :parameters (#q19 #q13)
          :precondition (and (isbconf #q19) (isbconf #q13))
          :effect (basemotion #q19 #t790 #q13)
   )
   (:action s827_plan-base-motion
          :parameters (#q19 #q14)
          :precondition (and (isbconf #q19) (isbconf #q14))
          :effect (basemotion #q19 #t791 #q14)
   )
   (:action s828_plan-base-motion
          :parameters (#q19 #q15)
          :precondition (and (isbconf #q19) (isbconf #q15))
          :effect (basemotion #q19 #t792 #q15)
   )
   (:action s829_plan-base-motion
          :parameters (#q19 #q16)
          :precondition (and (isbconf #q19) (isbconf #q16))
          :effect (basemotion #q19 #t793 #q16)
   )
   (:action s830_plan-base-motion
          :parameters (#q19 #q17)
          :precondition (and (isbconf #q19) (isbconf #q17))
          :effect (basemotion #q19 #t794 #q17)
   )
   (:action s831_plan-base-motion
          :parameters (#q19 #q18)
          :precondition (and (isbconf #q19) (isbconf #q18))
          :effect (basemotion #q19 #t795 #q18)
   )
   (:action s832_plan-base-motion
          :parameters (#q19 #q19)
          :precondition (and (isbconf #q19) (isbconf #q19))
          :effect (basemotion #q19 #t796 #q19)
   )
   (:action s833_plan-base-motion
          :parameters (#q19 #q20)
          :precondition (and (isbconf #q19) (isbconf #q20))
          :effect (basemotion #q19 #t797 #q20)
   )
   (:action s834_plan-base-motion
          :parameters (#q19 #q21)
          :precondition (and (isbconf #q19) (isbconf #q21))
          :effect (basemotion #q19 #t798 #q21)
   )
   (:action s835_plan-base-motion
          :parameters (#q19 #q22)
          :precondition (and (isbconf #q19) (isbconf #q22))
          :effect (basemotion #q19 #t799 #q22)
   )
   (:action s836_plan-base-motion
          :parameters (#q19 #q23)
          :precondition (and (isbconf #q19) (isbconf #q23))
          :effect (basemotion #q19 #t800 #q23)
   )
   (:action s837_plan-base-motion
          :parameters (#q19 #q24)
          :precondition (and (isbconf #q19) (isbconf #q24))
          :effect (basemotion #q19 #t801 #q24)
   )
   (:action s838_plan-base-motion
          :parameters (#q19 #q25)
          :precondition (and (isbconf #q19) (isbconf #q25))
          :effect (basemotion #q19 #t802 #q25)
   )
   (:action s839_plan-base-motion
          :parameters (#q19 #q26)
          :precondition (and (isbconf #q19) (isbconf #q26))
          :effect (basemotion #q19 #t803 #q26)
   )
   (:action s840_plan-base-motion
          :parameters (#q19 #q27)
          :precondition (and (isbconf #q19) (isbconf #q27))
          :effect (basemotion #q19 #t804 #q27)
   )
   (:action s841_plan-base-motion
          :parameters (#q19 #q28)
          :precondition (and (isbconf #q19) (isbconf #q28))
          :effect (basemotion #q19 #t805 #q28)
   )
   (:action s842_plan-base-motion
          :parameters (#q19 #q29)
          :precondition (and (isbconf #q19) (isbconf #q29))
          :effect (basemotion #q19 #t806 #q29)
   )
   (:action s843_plan-base-motion
          :parameters (#q19 #q30)
          :precondition (and (isbconf #q19) (isbconf #q30))
          :effect (basemotion #q19 #t807 #q30)
   )
   (:action s844_plan-base-motion
          :parameters (#q19 #q31)
          :precondition (and (isbconf #q19) (isbconf #q31))
          :effect (basemotion #q19 #t808 #q31)
   )
   (:action s845_plan-base-motion
          :parameters (#q19 #q32)
          :precondition (and (isbconf #q19) (isbconf #q32))
          :effect (basemotion #q19 #t809 #q32)
   )
   (:action s846_plan-base-motion
          :parameters (#q19 #q33)
          :precondition (and (isbconf #q19) (isbconf #q33))
          :effect (basemotion #q19 #t810 #q33)
   )
   (:action s847_plan-base-motion
          :parameters (#q19 #q34)
          :precondition (and (isbconf #q19) (isbconf #q34))
          :effect (basemotion #q19 #t811 #q34)
   )
   (:action s848_plan-base-motion
          :parameters (#q19 #q35)
          :precondition (and (isbconf #q19) (isbconf #q35))
          :effect (basemotion #q19 #t812 #q35)
   )
   (:action s849_plan-base-motion
          :parameters (#q20 q976)
          :precondition (and (isbconf #q20) (isbconf q976))
          :effect (basemotion #q20 #t813 q976)
   )
   (:action s850_plan-base-motion
          :parameters (#q20 #q0)
          :precondition (and (isbconf #q20) (isbconf #q0))
          :effect (basemotion #q20 #t814 #q0)
   )
   (:action s851_plan-base-motion
          :parameters (#q20 #q1)
          :precondition (and (isbconf #q20) (isbconf #q1))
          :effect (basemotion #q20 #t815 #q1)
   )
   (:action s852_plan-base-motion
          :parameters (#q20 #q2)
          :precondition (and (isbconf #q20) (isbconf #q2))
          :effect (basemotion #q20 #t816 #q2)
   )
   (:action s853_plan-base-motion
          :parameters (#q20 #q3)
          :precondition (and (isbconf #q20) (isbconf #q3))
          :effect (basemotion #q20 #t817 #q3)
   )
   (:action s854_plan-base-motion
          :parameters (#q20 #q4)
          :precondition (and (isbconf #q20) (isbconf #q4))
          :effect (basemotion #q20 #t818 #q4)
   )
   (:action s855_plan-base-motion
          :parameters (#q20 #q5)
          :precondition (and (isbconf #q20) (isbconf #q5))
          :effect (basemotion #q20 #t819 #q5)
   )
   (:action s856_plan-base-motion
          :parameters (#q20 #q6)
          :precondition (and (isbconf #q20) (isbconf #q6))
          :effect (basemotion #q20 #t820 #q6)
   )
   (:action s857_plan-base-motion
          :parameters (#q20 #q7)
          :precondition (and (isbconf #q20) (isbconf #q7))
          :effect (basemotion #q20 #t821 #q7)
   )
   (:action s858_plan-base-motion
          :parameters (#q20 #q8)
          :precondition (and (isbconf #q20) (isbconf #q8))
          :effect (basemotion #q20 #t822 #q8)
   )
   (:action s859_plan-base-motion
          :parameters (#q20 #q9)
          :precondition (and (isbconf #q20) (isbconf #q9))
          :effect (basemotion #q20 #t823 #q9)
   )
   (:action s860_plan-base-motion
          :parameters (#q20 #q10)
          :precondition (and (isbconf #q20) (isbconf #q10))
          :effect (basemotion #q20 #t824 #q10)
   )
   (:action s861_plan-base-motion
          :parameters (#q20 #q11)
          :precondition (and (isbconf #q20) (isbconf #q11))
          :effect (basemotion #q20 #t825 #q11)
   )
   (:action s862_plan-base-motion
          :parameters (#q20 #q12)
          :precondition (and (isbconf #q20) (isbconf #q12))
          :effect (basemotion #q20 #t826 #q12)
   )
   (:action s863_plan-base-motion
          :parameters (#q20 #q13)
          :precondition (and (isbconf #q20) (isbconf #q13))
          :effect (basemotion #q20 #t827 #q13)
   )
   (:action s864_plan-base-motion
          :parameters (#q20 #q14)
          :precondition (and (isbconf #q20) (isbconf #q14))
          :effect (basemotion #q20 #t828 #q14)
   )
   (:action s865_plan-base-motion
          :parameters (#q20 #q15)
          :precondition (and (isbconf #q20) (isbconf #q15))
          :effect (basemotion #q20 #t829 #q15)
   )
   (:action s866_plan-base-motion
          :parameters (#q20 #q16)
          :precondition (and (isbconf #q20) (isbconf #q16))
          :effect (basemotion #q20 #t830 #q16)
   )
   (:action s867_plan-base-motion
          :parameters (#q20 #q17)
          :precondition (and (isbconf #q20) (isbconf #q17))
          :effect (basemotion #q20 #t831 #q17)
   )
   (:action s868_plan-base-motion
          :parameters (#q20 #q18)
          :precondition (and (isbconf #q20) (isbconf #q18))
          :effect (basemotion #q20 #t832 #q18)
   )
   (:action s869_plan-base-motion
          :parameters (#q20 #q19)
          :precondition (and (isbconf #q20) (isbconf #q19))
          :effect (basemotion #q20 #t833 #q19)
   )
   (:action s870_plan-base-motion
          :parameters (#q20 #q20)
          :precondition (and (isbconf #q20) (isbconf #q20))
          :effect (basemotion #q20 #t834 #q20)
   )
   (:action s871_plan-base-motion
          :parameters (#q20 #q21)
          :precondition (and (isbconf #q20) (isbconf #q21))
          :effect (basemotion #q20 #t835 #q21)
   )
   (:action s872_plan-base-motion
          :parameters (#q20 #q22)
          :precondition (and (isbconf #q20) (isbconf #q22))
          :effect (basemotion #q20 #t836 #q22)
   )
   (:action s873_plan-base-motion
          :parameters (#q20 #q23)
          :precondition (and (isbconf #q20) (isbconf #q23))
          :effect (basemotion #q20 #t837 #q23)
   )
   (:action s874_plan-base-motion
          :parameters (#q20 #q24)
          :precondition (and (isbconf #q20) (isbconf #q24))
          :effect (basemotion #q20 #t838 #q24)
   )
   (:action s875_plan-base-motion
          :parameters (#q20 #q25)
          :precondition (and (isbconf #q20) (isbconf #q25))
          :effect (basemotion #q20 #t839 #q25)
   )
   (:action s876_plan-base-motion
          :parameters (#q20 #q26)
          :precondition (and (isbconf #q20) (isbconf #q26))
          :effect (basemotion #q20 #t840 #q26)
   )
   (:action s877_plan-base-motion
          :parameters (#q20 #q27)
          :precondition (and (isbconf #q20) (isbconf #q27))
          :effect (basemotion #q20 #t841 #q27)
   )
   (:action s878_plan-base-motion
          :parameters (#q20 #q28)
          :precondition (and (isbconf #q20) (isbconf #q28))
          :effect (basemotion #q20 #t842 #q28)
   )
   (:action s879_plan-base-motion
          :parameters (#q20 #q29)
          :precondition (and (isbconf #q20) (isbconf #q29))
          :effect (basemotion #q20 #t843 #q29)
   )
   (:action s880_plan-base-motion
          :parameters (#q20 #q30)
          :precondition (and (isbconf #q20) (isbconf #q30))
          :effect (basemotion #q20 #t844 #q30)
   )
   (:action s881_plan-base-motion
          :parameters (#q20 #q31)
          :precondition (and (isbconf #q20) (isbconf #q31))
          :effect (basemotion #q20 #t845 #q31)
   )
   (:action s882_plan-base-motion
          :parameters (#q20 #q32)
          :precondition (and (isbconf #q20) (isbconf #q32))
          :effect (basemotion #q20 #t846 #q32)
   )
   (:action s883_plan-base-motion
          :parameters (#q20 #q33)
          :precondition (and (isbconf #q20) (isbconf #q33))
          :effect (basemotion #q20 #t847 #q33)
   )
   (:action s884_plan-base-motion
          :parameters (#q20 #q34)
          :precondition (and (isbconf #q20) (isbconf #q34))
          :effect (basemotion #q20 #t848 #q34)
   )
   (:action s885_plan-base-motion
          :parameters (#q20 #q35)
          :precondition (and (isbconf #q20) (isbconf #q35))
          :effect (basemotion #q20 #t849 #q35)
   )
   (:action s886_plan-base-motion
          :parameters (#q21 q976)
          :precondition (and (isbconf #q21) (isbconf q976))
          :effect (basemotion #q21 #t850 q976)
   )
   (:action s887_plan-base-motion
          :parameters (#q21 #q0)
          :precondition (and (isbconf #q21) (isbconf #q0))
          :effect (basemotion #q21 #t851 #q0)
   )
   (:action s888_plan-base-motion
          :parameters (#q21 #q1)
          :precondition (and (isbconf #q21) (isbconf #q1))
          :effect (basemotion #q21 #t852 #q1)
   )
   (:action s889_plan-base-motion
          :parameters (#q21 #q2)
          :precondition (and (isbconf #q21) (isbconf #q2))
          :effect (basemotion #q21 #t853 #q2)
   )
   (:action s890_plan-base-motion
          :parameters (#q21 #q3)
          :precondition (and (isbconf #q21) (isbconf #q3))
          :effect (basemotion #q21 #t854 #q3)
   )
   (:action s891_plan-base-motion
          :parameters (#q21 #q4)
          :precondition (and (isbconf #q21) (isbconf #q4))
          :effect (basemotion #q21 #t855 #q4)
   )
   (:action s892_plan-base-motion
          :parameters (#q21 #q5)
          :precondition (and (isbconf #q21) (isbconf #q5))
          :effect (basemotion #q21 #t856 #q5)
   )
   (:action s893_plan-base-motion
          :parameters (#q21 #q6)
          :precondition (and (isbconf #q21) (isbconf #q6))
          :effect (basemotion #q21 #t857 #q6)
   )
   (:action s894_plan-base-motion
          :parameters (#q21 #q7)
          :precondition (and (isbconf #q21) (isbconf #q7))
          :effect (basemotion #q21 #t858 #q7)
   )
   (:action s895_plan-base-motion
          :parameters (#q21 #q8)
          :precondition (and (isbconf #q21) (isbconf #q8))
          :effect (basemotion #q21 #t859 #q8)
   )
   (:action s896_plan-base-motion
          :parameters (#q21 #q9)
          :precondition (and (isbconf #q21) (isbconf #q9))
          :effect (basemotion #q21 #t860 #q9)
   )
   (:action s897_plan-base-motion
          :parameters (#q21 #q10)
          :precondition (and (isbconf #q21) (isbconf #q10))
          :effect (basemotion #q21 #t861 #q10)
   )
   (:action s898_plan-base-motion
          :parameters (#q21 #q11)
          :precondition (and (isbconf #q21) (isbconf #q11))
          :effect (basemotion #q21 #t862 #q11)
   )
   (:action s899_plan-base-motion
          :parameters (#q21 #q12)
          :precondition (and (isbconf #q21) (isbconf #q12))
          :effect (basemotion #q21 #t863 #q12)
   )
   (:action s900_plan-base-motion
          :parameters (#q21 #q13)
          :precondition (and (isbconf #q21) (isbconf #q13))
          :effect (basemotion #q21 #t864 #q13)
   )
   (:action s901_plan-base-motion
          :parameters (#q21 #q14)
          :precondition (and (isbconf #q21) (isbconf #q14))
          :effect (basemotion #q21 #t865 #q14)
   )
   (:action s902_plan-base-motion
          :parameters (#q21 #q15)
          :precondition (and (isbconf #q21) (isbconf #q15))
          :effect (basemotion #q21 #t866 #q15)
   )
   (:action s903_plan-base-motion
          :parameters (#q21 #q16)
          :precondition (and (isbconf #q21) (isbconf #q16))
          :effect (basemotion #q21 #t867 #q16)
   )
   (:action s904_plan-base-motion
          :parameters (#q21 #q17)
          :precondition (and (isbconf #q21) (isbconf #q17))
          :effect (basemotion #q21 #t868 #q17)
   )
   (:action s905_plan-base-motion
          :parameters (#q21 #q18)
          :precondition (and (isbconf #q21) (isbconf #q18))
          :effect (basemotion #q21 #t869 #q18)
   )
   (:action s906_plan-base-motion
          :parameters (#q21 #q19)
          :precondition (and (isbconf #q21) (isbconf #q19))
          :effect (basemotion #q21 #t870 #q19)
   )
   (:action s907_plan-base-motion
          :parameters (#q21 #q20)
          :precondition (and (isbconf #q21) (isbconf #q20))
          :effect (basemotion #q21 #t871 #q20)
   )
   (:action s908_plan-base-motion
          :parameters (#q21 #q21)
          :precondition (and (isbconf #q21) (isbconf #q21))
          :effect (basemotion #q21 #t872 #q21)
   )
   (:action s909_plan-base-motion
          :parameters (#q21 #q22)
          :precondition (and (isbconf #q21) (isbconf #q22))
          :effect (basemotion #q21 #t873 #q22)
   )
   (:action s910_plan-base-motion
          :parameters (#q21 #q23)
          :precondition (and (isbconf #q21) (isbconf #q23))
          :effect (basemotion #q21 #t874 #q23)
   )
   (:action s911_plan-base-motion
          :parameters (#q21 #q24)
          :precondition (and (isbconf #q21) (isbconf #q24))
          :effect (basemotion #q21 #t875 #q24)
   )
   (:action s912_plan-base-motion
          :parameters (#q21 #q25)
          :precondition (and (isbconf #q21) (isbconf #q25))
          :effect (basemotion #q21 #t876 #q25)
   )
   (:action s913_plan-base-motion
          :parameters (#q21 #q26)
          :precondition (and (isbconf #q21) (isbconf #q26))
          :effect (basemotion #q21 #t877 #q26)
   )
   (:action s914_plan-base-motion
          :parameters (#q21 #q27)
          :precondition (and (isbconf #q21) (isbconf #q27))
          :effect (basemotion #q21 #t878 #q27)
   )
   (:action s915_plan-base-motion
          :parameters (#q21 #q28)
          :precondition (and (isbconf #q21) (isbconf #q28))
          :effect (basemotion #q21 #t879 #q28)
   )
   (:action s916_plan-base-motion
          :parameters (#q21 #q29)
          :precondition (and (isbconf #q21) (isbconf #q29))
          :effect (basemotion #q21 #t880 #q29)
   )
   (:action s917_plan-base-motion
          :parameters (#q21 #q30)
          :precondition (and (isbconf #q21) (isbconf #q30))
          :effect (basemotion #q21 #t881 #q30)
   )
   (:action s918_plan-base-motion
          :parameters (#q21 #q31)
          :precondition (and (isbconf #q21) (isbconf #q31))
          :effect (basemotion #q21 #t882 #q31)
   )
   (:action s919_plan-base-motion
          :parameters (#q21 #q32)
          :precondition (and (isbconf #q21) (isbconf #q32))
          :effect (basemotion #q21 #t883 #q32)
   )
   (:action s920_plan-base-motion
          :parameters (#q21 #q33)
          :precondition (and (isbconf #q21) (isbconf #q33))
          :effect (basemotion #q21 #t884 #q33)
   )
   (:action s921_plan-base-motion
          :parameters (#q21 #q34)
          :precondition (and (isbconf #q21) (isbconf #q34))
          :effect (basemotion #q21 #t885 #q34)
   )
   (:action s922_plan-base-motion
          :parameters (#q21 #q35)
          :precondition (and (isbconf #q21) (isbconf #q35))
          :effect (basemotion #q21 #t886 #q35)
   )
   (:action s923_plan-base-motion
          :parameters (#q22 q976)
          :precondition (and (isbconf #q22) (isbconf q976))
          :effect (basemotion #q22 #t887 q976)
   )
   (:action s924_plan-base-motion
          :parameters (#q22 #q0)
          :precondition (and (isbconf #q22) (isbconf #q0))
          :effect (basemotion #q22 #t888 #q0)
   )
   (:action s925_plan-base-motion
          :parameters (#q22 #q1)
          :precondition (and (isbconf #q22) (isbconf #q1))
          :effect (basemotion #q22 #t889 #q1)
   )
   (:action s926_plan-base-motion
          :parameters (#q22 #q2)
          :precondition (and (isbconf #q22) (isbconf #q2))
          :effect (basemotion #q22 #t890 #q2)
   )
   (:action s927_plan-base-motion
          :parameters (#q22 #q3)
          :precondition (and (isbconf #q22) (isbconf #q3))
          :effect (basemotion #q22 #t891 #q3)
   )
   (:action s928_plan-base-motion
          :parameters (#q22 #q4)
          :precondition (and (isbconf #q22) (isbconf #q4))
          :effect (basemotion #q22 #t892 #q4)
   )
   (:action s929_plan-base-motion
          :parameters (#q22 #q5)
          :precondition (and (isbconf #q22) (isbconf #q5))
          :effect (basemotion #q22 #t893 #q5)
   )
   (:action s930_plan-base-motion
          :parameters (#q22 #q6)
          :precondition (and (isbconf #q22) (isbconf #q6))
          :effect (basemotion #q22 #t894 #q6)
   )
   (:action s931_plan-base-motion
          :parameters (#q22 #q7)
          :precondition (and (isbconf #q22) (isbconf #q7))
          :effect (basemotion #q22 #t895 #q7)
   )
   (:action s932_plan-base-motion
          :parameters (#q22 #q8)
          :precondition (and (isbconf #q22) (isbconf #q8))
          :effect (basemotion #q22 #t896 #q8)
   )
   (:action s933_plan-base-motion
          :parameters (#q22 #q9)
          :precondition (and (isbconf #q22) (isbconf #q9))
          :effect (basemotion #q22 #t897 #q9)
   )
   (:action s934_plan-base-motion
          :parameters (#q22 #q10)
          :precondition (and (isbconf #q22) (isbconf #q10))
          :effect (basemotion #q22 #t898 #q10)
   )
   (:action s935_plan-base-motion
          :parameters (#q22 #q11)
          :precondition (and (isbconf #q22) (isbconf #q11))
          :effect (basemotion #q22 #t899 #q11)
   )
   (:action s936_plan-base-motion
          :parameters (#q22 #q12)
          :precondition (and (isbconf #q22) (isbconf #q12))
          :effect (basemotion #q22 #t900 #q12)
   )
   (:action s937_plan-base-motion
          :parameters (#q22 #q13)
          :precondition (and (isbconf #q22) (isbconf #q13))
          :effect (basemotion #q22 #t901 #q13)
   )
   (:action s938_plan-base-motion
          :parameters (#q22 #q14)
          :precondition (and (isbconf #q22) (isbconf #q14))
          :effect (basemotion #q22 #t902 #q14)
   )
   (:action s939_plan-base-motion
          :parameters (#q22 #q15)
          :precondition (and (isbconf #q22) (isbconf #q15))
          :effect (basemotion #q22 #t903 #q15)
   )
   (:action s940_plan-base-motion
          :parameters (#q22 #q16)
          :precondition (and (isbconf #q22) (isbconf #q16))
          :effect (basemotion #q22 #t904 #q16)
   )
   (:action s941_plan-base-motion
          :parameters (#q22 #q17)
          :precondition (and (isbconf #q22) (isbconf #q17))
          :effect (basemotion #q22 #t905 #q17)
   )
   (:action s942_plan-base-motion
          :parameters (#q22 #q18)
          :precondition (and (isbconf #q22) (isbconf #q18))
          :effect (basemotion #q22 #t906 #q18)
   )
   (:action s943_plan-base-motion
          :parameters (#q22 #q19)
          :precondition (and (isbconf #q22) (isbconf #q19))
          :effect (basemotion #q22 #t907 #q19)
   )
   (:action s944_plan-base-motion
          :parameters (#q22 #q20)
          :precondition (and (isbconf #q22) (isbconf #q20))
          :effect (basemotion #q22 #t908 #q20)
   )
   (:action s945_plan-base-motion
          :parameters (#q22 #q21)
          :precondition (and (isbconf #q22) (isbconf #q21))
          :effect (basemotion #q22 #t909 #q21)
   )
   (:action s946_plan-base-motion
          :parameters (#q22 #q22)
          :precondition (and (isbconf #q22) (isbconf #q22))
          :effect (basemotion #q22 #t910 #q22)
   )
   (:action s947_plan-base-motion
          :parameters (#q22 #q23)
          :precondition (and (isbconf #q22) (isbconf #q23))
          :effect (basemotion #q22 #t911 #q23)
   )
   (:action s948_plan-base-motion
          :parameters (#q22 #q24)
          :precondition (and (isbconf #q22) (isbconf #q24))
          :effect (basemotion #q22 #t912 #q24)
   )
   (:action s949_plan-base-motion
          :parameters (#q22 #q25)
          :precondition (and (isbconf #q22) (isbconf #q25))
          :effect (basemotion #q22 #t913 #q25)
   )
   (:action s950_plan-base-motion
          :parameters (#q22 #q26)
          :precondition (and (isbconf #q22) (isbconf #q26))
          :effect (basemotion #q22 #t914 #q26)
   )
   (:action s951_plan-base-motion
          :parameters (#q22 #q27)
          :precondition (and (isbconf #q22) (isbconf #q27))
          :effect (basemotion #q22 #t915 #q27)
   )
   (:action s952_plan-base-motion
          :parameters (#q22 #q28)
          :precondition (and (isbconf #q22) (isbconf #q28))
          :effect (basemotion #q22 #t916 #q28)
   )
   (:action s953_plan-base-motion
          :parameters (#q22 #q29)
          :precondition (and (isbconf #q22) (isbconf #q29))
          :effect (basemotion #q22 #t917 #q29)
   )
   (:action s954_plan-base-motion
          :parameters (#q22 #q30)
          :precondition (and (isbconf #q22) (isbconf #q30))
          :effect (basemotion #q22 #t918 #q30)
   )
   (:action s955_plan-base-motion
          :parameters (#q22 #q31)
          :precondition (and (isbconf #q22) (isbconf #q31))
          :effect (basemotion #q22 #t919 #q31)
   )
   (:action s956_plan-base-motion
          :parameters (#q22 #q32)
          :precondition (and (isbconf #q22) (isbconf #q32))
          :effect (basemotion #q22 #t920 #q32)
   )
   (:action s957_plan-base-motion
          :parameters (#q22 #q33)
          :precondition (and (isbconf #q22) (isbconf #q33))
          :effect (basemotion #q22 #t921 #q33)
   )
   (:action s958_plan-base-motion
          :parameters (#q22 #q34)
          :precondition (and (isbconf #q22) (isbconf #q34))
          :effect (basemotion #q22 #t922 #q34)
   )
   (:action s959_plan-base-motion
          :parameters (#q22 #q35)
          :precondition (and (isbconf #q22) (isbconf #q35))
          :effect (basemotion #q22 #t923 #q35)
   )
   (:action s960_plan-base-motion
          :parameters (#q23 q976)
          :precondition (and (isbconf #q23) (isbconf q976))
          :effect (basemotion #q23 #t924 q976)
   )
   (:action s961_plan-base-motion
          :parameters (#q23 #q0)
          :precondition (and (isbconf #q23) (isbconf #q0))
          :effect (basemotion #q23 #t925 #q0)
   )
   (:action s962_plan-base-motion
          :parameters (#q23 #q1)
          :precondition (and (isbconf #q23) (isbconf #q1))
          :effect (basemotion #q23 #t926 #q1)
   )
   (:action s963_plan-base-motion
          :parameters (#q23 #q2)
          :precondition (and (isbconf #q23) (isbconf #q2))
          :effect (basemotion #q23 #t927 #q2)
   )
   (:action s964_plan-base-motion
          :parameters (#q23 #q3)
          :precondition (and (isbconf #q23) (isbconf #q3))
          :effect (basemotion #q23 #t928 #q3)
   )
   (:action s965_plan-base-motion
          :parameters (#q23 #q4)
          :precondition (and (isbconf #q23) (isbconf #q4))
          :effect (basemotion #q23 #t929 #q4)
   )
   (:action s966_plan-base-motion
          :parameters (#q23 #q5)
          :precondition (and (isbconf #q23) (isbconf #q5))
          :effect (basemotion #q23 #t930 #q5)
   )
   (:action s967_plan-base-motion
          :parameters (#q23 #q6)
          :precondition (and (isbconf #q23) (isbconf #q6))
          :effect (basemotion #q23 #t931 #q6)
   )
   (:action s968_plan-base-motion
          :parameters (#q23 #q7)
          :precondition (and (isbconf #q23) (isbconf #q7))
          :effect (basemotion #q23 #t932 #q7)
   )
   (:action s969_plan-base-motion
          :parameters (#q23 #q8)
          :precondition (and (isbconf #q23) (isbconf #q8))
          :effect (basemotion #q23 #t933 #q8)
   )
   (:action s970_plan-base-motion
          :parameters (#q23 #q9)
          :precondition (and (isbconf #q23) (isbconf #q9))
          :effect (basemotion #q23 #t934 #q9)
   )
   (:action s971_plan-base-motion
          :parameters (#q23 #q10)
          :precondition (and (isbconf #q23) (isbconf #q10))
          :effect (basemotion #q23 #t935 #q10)
   )
   (:action s972_plan-base-motion
          :parameters (#q23 #q11)
          :precondition (and (isbconf #q23) (isbconf #q11))
          :effect (basemotion #q23 #t936 #q11)
   )
   (:action s973_plan-base-motion
          :parameters (#q23 #q12)
          :precondition (and (isbconf #q23) (isbconf #q12))
          :effect (basemotion #q23 #t937 #q12)
   )
   (:action s974_plan-base-motion
          :parameters (#q23 #q13)
          :precondition (and (isbconf #q23) (isbconf #q13))
          :effect (basemotion #q23 #t938 #q13)
   )
   (:action s975_plan-base-motion
          :parameters (#q23 #q14)
          :precondition (and (isbconf #q23) (isbconf #q14))
          :effect (basemotion #q23 #t939 #q14)
   )
   (:action s976_plan-base-motion
          :parameters (#q23 #q15)
          :precondition (and (isbconf #q23) (isbconf #q15))
          :effect (basemotion #q23 #t940 #q15)
   )
   (:action s977_plan-base-motion
          :parameters (#q23 #q16)
          :precondition (and (isbconf #q23) (isbconf #q16))
          :effect (basemotion #q23 #t941 #q16)
   )
   (:action s978_plan-base-motion
          :parameters (#q23 #q17)
          :precondition (and (isbconf #q23) (isbconf #q17))
          :effect (basemotion #q23 #t942 #q17)
   )
   (:action s979_plan-base-motion
          :parameters (#q23 #q18)
          :precondition (and (isbconf #q23) (isbconf #q18))
          :effect (basemotion #q23 #t943 #q18)
   )
   (:action s980_plan-base-motion
          :parameters (#q23 #q19)
          :precondition (and (isbconf #q23) (isbconf #q19))
          :effect (basemotion #q23 #t944 #q19)
   )
   (:action s981_plan-base-motion
          :parameters (#q23 #q20)
          :precondition (and (isbconf #q23) (isbconf #q20))
          :effect (basemotion #q23 #t945 #q20)
   )
   (:action s982_plan-base-motion
          :parameters (#q23 #q21)
          :precondition (and (isbconf #q23) (isbconf #q21))
          :effect (basemotion #q23 #t946 #q21)
   )
   (:action s983_plan-base-motion
          :parameters (#q23 #q22)
          :precondition (and (isbconf #q23) (isbconf #q22))
          :effect (basemotion #q23 #t947 #q22)
   )
   (:action s984_plan-base-motion
          :parameters (#q23 #q23)
          :precondition (and (isbconf #q23) (isbconf #q23))
          :effect (basemotion #q23 #t948 #q23)
   )
   (:action s985_plan-base-motion
          :parameters (#q23 #q24)
          :precondition (and (isbconf #q23) (isbconf #q24))
          :effect (basemotion #q23 #t949 #q24)
   )
   (:action s986_plan-base-motion
          :parameters (#q23 #q25)
          :precondition (and (isbconf #q23) (isbconf #q25))
          :effect (basemotion #q23 #t950 #q25)
   )
   (:action s987_plan-base-motion
          :parameters (#q23 #q26)
          :precondition (and (isbconf #q23) (isbconf #q26))
          :effect (basemotion #q23 #t951 #q26)
   )
   (:action s988_plan-base-motion
          :parameters (#q23 #q27)
          :precondition (and (isbconf #q23) (isbconf #q27))
          :effect (basemotion #q23 #t952 #q27)
   )
   (:action s989_plan-base-motion
          :parameters (#q23 #q28)
          :precondition (and (isbconf #q23) (isbconf #q28))
          :effect (basemotion #q23 #t953 #q28)
   )
   (:action s990_plan-base-motion
          :parameters (#q23 #q29)
          :precondition (and (isbconf #q23) (isbconf #q29))
          :effect (basemotion #q23 #t954 #q29)
   )
   (:action s991_plan-base-motion
          :parameters (#q23 #q30)
          :precondition (and (isbconf #q23) (isbconf #q30))
          :effect (basemotion #q23 #t955 #q30)
   )
   (:action s992_plan-base-motion
          :parameters (#q23 #q31)
          :precondition (and (isbconf #q23) (isbconf #q31))
          :effect (basemotion #q23 #t956 #q31)
   )
   (:action s993_plan-base-motion
          :parameters (#q23 #q32)
          :precondition (and (isbconf #q23) (isbconf #q32))
          :effect (basemotion #q23 #t957 #q32)
   )
   (:action s994_plan-base-motion
          :parameters (#q23 #q33)
          :precondition (and (isbconf #q23) (isbconf #q33))
          :effect (basemotion #q23 #t958 #q33)
   )
   (:action s995_plan-base-motion
          :parameters (#q23 #q34)
          :precondition (and (isbconf #q23) (isbconf #q34))
          :effect (basemotion #q23 #t959 #q34)
   )
   (:action s996_plan-base-motion
          :parameters (#q23 #q35)
          :precondition (and (isbconf #q23) (isbconf #q35))
          :effect (basemotion #q23 #t960 #q35)
   )
   (:action s997_plan-base-motion
          :parameters (#q24 q976)
          :precondition (and (isbconf #q24) (isbconf q976))
          :effect (basemotion #q24 #t961 q976)
   )
   (:action s998_plan-base-motion
          :parameters (#q24 #q0)
          :precondition (and (isbconf #q24) (isbconf #q0))
          :effect (basemotion #q24 #t962 #q0)
   )
   (:action s999_plan-base-motion
          :parameters (#q24 #q1)
          :precondition (and (isbconf #q24) (isbconf #q1))
          :effect (basemotion #q24 #t963 #q1)
   )
   (:action s1000_plan-base-motion
          :parameters (#q24 #q2)
          :precondition (and (isbconf #q24) (isbconf #q2))
          :effect (basemotion #q24 #t964 #q2)
   )
   (:action s1001_plan-base-motion
          :parameters (#q24 #q3)
          :precondition (and (isbconf #q24) (isbconf #q3))
          :effect (basemotion #q24 #t965 #q3)
   )
   (:action s1002_plan-base-motion
          :parameters (#q24 #q4)
          :precondition (and (isbconf #q24) (isbconf #q4))
          :effect (basemotion #q24 #t966 #q4)
   )
   (:action s1003_plan-base-motion
          :parameters (#q24 #q5)
          :precondition (and (isbconf #q24) (isbconf #q5))
          :effect (basemotion #q24 #t967 #q5)
   )
   (:action s1004_plan-base-motion
          :parameters (#q24 #q6)
          :precondition (and (isbconf #q24) (isbconf #q6))
          :effect (basemotion #q24 #t968 #q6)
   )
   (:action s1005_plan-base-motion
          :parameters (#q24 #q7)
          :precondition (and (isbconf #q24) (isbconf #q7))
          :effect (basemotion #q24 #t969 #q7)
   )
   (:action s1006_plan-base-motion
          :parameters (#q24 #q8)
          :precondition (and (isbconf #q24) (isbconf #q8))
          :effect (basemotion #q24 #t970 #q8)
   )
   (:action s1007_plan-base-motion
          :parameters (#q24 #q9)
          :precondition (and (isbconf #q24) (isbconf #q9))
          :effect (basemotion #q24 #t971 #q9)
   )
   (:action s1008_plan-base-motion
          :parameters (#q24 #q10)
          :precondition (and (isbconf #q24) (isbconf #q10))
          :effect (basemotion #q24 #t972 #q10)
   )
   (:action s1009_plan-base-motion
          :parameters (#q24 #q11)
          :precondition (and (isbconf #q24) (isbconf #q11))
          :effect (basemotion #q24 #t973 #q11)
   )
   (:action s1010_plan-base-motion
          :parameters (#q24 #q12)
          :precondition (and (isbconf #q24) (isbconf #q12))
          :effect (basemotion #q24 #t974 #q12)
   )
   (:action s1011_plan-base-motion
          :parameters (#q24 #q13)
          :precondition (and (isbconf #q24) (isbconf #q13))
          :effect (basemotion #q24 #t975 #q13)
   )
   (:action s1012_plan-base-motion
          :parameters (#q24 #q14)
          :precondition (and (isbconf #q24) (isbconf #q14))
          :effect (basemotion #q24 #t976 #q14)
   )
   (:action s1013_plan-base-motion
          :parameters (#q24 #q15)
          :precondition (and (isbconf #q24) (isbconf #q15))
          :effect (basemotion #q24 #t977 #q15)
   )
   (:action s1014_plan-base-motion
          :parameters (#q24 #q16)
          :precondition (and (isbconf #q24) (isbconf #q16))
          :effect (basemotion #q24 #t978 #q16)
   )
   (:action s1015_plan-base-motion
          :parameters (#q24 #q17)
          :precondition (and (isbconf #q24) (isbconf #q17))
          :effect (basemotion #q24 #t979 #q17)
   )
   (:action s1016_plan-base-motion
          :parameters (#q24 #q18)
          :precondition (and (isbconf #q24) (isbconf #q18))
          :effect (basemotion #q24 #t980 #q18)
   )
   (:action s1017_plan-base-motion
          :parameters (#q24 #q19)
          :precondition (and (isbconf #q24) (isbconf #q19))
          :effect (basemotion #q24 #t981 #q19)
   )
   (:action s1018_plan-base-motion
          :parameters (#q24 #q20)
          :precondition (and (isbconf #q24) (isbconf #q20))
          :effect (basemotion #q24 #t982 #q20)
   )
   (:action s1019_plan-base-motion
          :parameters (#q24 #q21)
          :precondition (and (isbconf #q24) (isbconf #q21))
          :effect (basemotion #q24 #t983 #q21)
   )
   (:action s1020_plan-base-motion
          :parameters (#q24 #q22)
          :precondition (and (isbconf #q24) (isbconf #q22))
          :effect (basemotion #q24 #t984 #q22)
   )
   (:action s1021_plan-base-motion
          :parameters (#q24 #q23)
          :precondition (and (isbconf #q24) (isbconf #q23))
          :effect (basemotion #q24 #t985 #q23)
   )
   (:action s1022_plan-base-motion
          :parameters (#q24 #q24)
          :precondition (and (isbconf #q24) (isbconf #q24))
          :effect (basemotion #q24 #t986 #q24)
   )
   (:action s1023_plan-base-motion
          :parameters (#q24 #q25)
          :precondition (and (isbconf #q24) (isbconf #q25))
          :effect (basemotion #q24 #t987 #q25)
   )
   (:action s1024_plan-base-motion
          :parameters (#q24 #q26)
          :precondition (and (isbconf #q24) (isbconf #q26))
          :effect (basemotion #q24 #t988 #q26)
   )
   (:action s1025_plan-base-motion
          :parameters (#q24 #q27)
          :precondition (and (isbconf #q24) (isbconf #q27))
          :effect (basemotion #q24 #t989 #q27)
   )
   (:action s1026_plan-base-motion
          :parameters (#q24 #q28)
          :precondition (and (isbconf #q24) (isbconf #q28))
          :effect (basemotion #q24 #t990 #q28)
   )
   (:action s1027_plan-base-motion
          :parameters (#q24 #q29)
          :precondition (and (isbconf #q24) (isbconf #q29))
          :effect (basemotion #q24 #t991 #q29)
   )
   (:action s1028_plan-base-motion
          :parameters (#q24 #q30)
          :precondition (and (isbconf #q24) (isbconf #q30))
          :effect (basemotion #q24 #t992 #q30)
   )
   (:action s1029_plan-base-motion
          :parameters (#q24 #q31)
          :precondition (and (isbconf #q24) (isbconf #q31))
          :effect (basemotion #q24 #t993 #q31)
   )
   (:action s1030_plan-base-motion
          :parameters (#q24 #q32)
          :precondition (and (isbconf #q24) (isbconf #q32))
          :effect (basemotion #q24 #t994 #q32)
   )
   (:action s1031_plan-base-motion
          :parameters (#q24 #q33)
          :precondition (and (isbconf #q24) (isbconf #q33))
          :effect (basemotion #q24 #t995 #q33)
   )
   (:action s1032_plan-base-motion
          :parameters (#q24 #q34)
          :precondition (and (isbconf #q24) (isbconf #q34))
          :effect (basemotion #q24 #t996 #q34)
   )
   (:action s1033_plan-base-motion
          :parameters (#q24 #q35)
          :precondition (and (isbconf #q24) (isbconf #q35))
          :effect (basemotion #q24 #t997 #q35)
   )
   (:action s1034_plan-base-motion
          :parameters (#q25 q976)
          :precondition (and (isbconf #q25) (isbconf q976))
          :effect (basemotion #q25 #t998 q976)
   )
   (:action s1035_plan-base-motion
          :parameters (#q25 #q0)
          :precondition (and (isbconf #q25) (isbconf #q0))
          :effect (basemotion #q25 #t999 #q0)
   )
   (:action s1036_plan-base-motion
          :parameters (#q25 #q1)
          :precondition (and (isbconf #q25) (isbconf #q1))
          :effect (basemotion #q25 #t1000 #q1)
   )
   (:action s1037_plan-base-motion
          :parameters (#q25 #q2)
          :precondition (and (isbconf #q25) (isbconf #q2))
          :effect (basemotion #q25 #t1001 #q2)
   )
   (:action s1038_plan-base-motion
          :parameters (#q25 #q3)
          :precondition (and (isbconf #q25) (isbconf #q3))
          :effect (basemotion #q25 #t1002 #q3)
   )
   (:action s1039_plan-base-motion
          :parameters (#q25 #q4)
          :precondition (and (isbconf #q25) (isbconf #q4))
          :effect (basemotion #q25 #t1003 #q4)
   )
   (:action s1040_plan-base-motion
          :parameters (#q25 #q5)
          :precondition (and (isbconf #q25) (isbconf #q5))
          :effect (basemotion #q25 #t1004 #q5)
   )
   (:action s1041_plan-base-motion
          :parameters (#q25 #q6)
          :precondition (and (isbconf #q25) (isbconf #q6))
          :effect (basemotion #q25 #t1005 #q6)
   )
   (:action s1042_plan-base-motion
          :parameters (#q25 #q7)
          :precondition (and (isbconf #q25) (isbconf #q7))
          :effect (basemotion #q25 #t1006 #q7)
   )
   (:action s1043_plan-base-motion
          :parameters (#q25 #q8)
          :precondition (and (isbconf #q25) (isbconf #q8))
          :effect (basemotion #q25 #t1007 #q8)
   )
   (:action s1044_plan-base-motion
          :parameters (#q25 #q9)
          :precondition (and (isbconf #q25) (isbconf #q9))
          :effect (basemotion #q25 #t1008 #q9)
   )
   (:action s1045_plan-base-motion
          :parameters (#q25 #q10)
          :precondition (and (isbconf #q25) (isbconf #q10))
          :effect (basemotion #q25 #t1009 #q10)
   )
   (:action s1046_plan-base-motion
          :parameters (#q25 #q11)
          :precondition (and (isbconf #q25) (isbconf #q11))
          :effect (basemotion #q25 #t1010 #q11)
   )
   (:action s1047_plan-base-motion
          :parameters (#q25 #q12)
          :precondition (and (isbconf #q25) (isbconf #q12))
          :effect (basemotion #q25 #t1011 #q12)
   )
   (:action s1048_plan-base-motion
          :parameters (#q25 #q13)
          :precondition (and (isbconf #q25) (isbconf #q13))
          :effect (basemotion #q25 #t1012 #q13)
   )
   (:action s1049_plan-base-motion
          :parameters (#q25 #q14)
          :precondition (and (isbconf #q25) (isbconf #q14))
          :effect (basemotion #q25 #t1013 #q14)
   )
   (:action s1050_plan-base-motion
          :parameters (#q25 #q15)
          :precondition (and (isbconf #q25) (isbconf #q15))
          :effect (basemotion #q25 #t1014 #q15)
   )
   (:action s1051_plan-base-motion
          :parameters (#q25 #q16)
          :precondition (and (isbconf #q25) (isbconf #q16))
          :effect (basemotion #q25 #t1015 #q16)
   )
   (:action s1052_plan-base-motion
          :parameters (#q25 #q17)
          :precondition (and (isbconf #q25) (isbconf #q17))
          :effect (basemotion #q25 #t1016 #q17)
   )
   (:action s1053_plan-base-motion
          :parameters (#q25 #q18)
          :precondition (and (isbconf #q25) (isbconf #q18))
          :effect (basemotion #q25 #t1017 #q18)
   )
   (:action s1054_plan-base-motion
          :parameters (#q25 #q19)
          :precondition (and (isbconf #q25) (isbconf #q19))
          :effect (basemotion #q25 #t1018 #q19)
   )
   (:action s1055_plan-base-motion
          :parameters (#q25 #q20)
          :precondition (and (isbconf #q25) (isbconf #q20))
          :effect (basemotion #q25 #t1019 #q20)
   )
   (:action s1056_plan-base-motion
          :parameters (#q25 #q21)
          :precondition (and (isbconf #q25) (isbconf #q21))
          :effect (basemotion #q25 #t1020 #q21)
   )
   (:action s1057_plan-base-motion
          :parameters (#q25 #q22)
          :precondition (and (isbconf #q25) (isbconf #q22))
          :effect (basemotion #q25 #t1021 #q22)
   )
   (:action s1058_plan-base-motion
          :parameters (#q25 #q23)
          :precondition (and (isbconf #q25) (isbconf #q23))
          :effect (basemotion #q25 #t1022 #q23)
   )
   (:action s1059_plan-base-motion
          :parameters (#q25 #q24)
          :precondition (and (isbconf #q25) (isbconf #q24))
          :effect (basemotion #q25 #t1023 #q24)
   )
   (:action s1060_plan-base-motion
          :parameters (#q25 #q25)
          :precondition (and (isbconf #q25) (isbconf #q25))
          :effect (basemotion #q25 #t1024 #q25)
   )
   (:action s1061_plan-base-motion
          :parameters (#q25 #q26)
          :precondition (and (isbconf #q25) (isbconf #q26))
          :effect (basemotion #q25 #t1025 #q26)
   )
   (:action s1062_plan-base-motion
          :parameters (#q25 #q27)
          :precondition (and (isbconf #q25) (isbconf #q27))
          :effect (basemotion #q25 #t1026 #q27)
   )
   (:action s1063_plan-base-motion
          :parameters (#q25 #q28)
          :precondition (and (isbconf #q25) (isbconf #q28))
          :effect (basemotion #q25 #t1027 #q28)
   )
   (:action s1064_plan-base-motion
          :parameters (#q25 #q29)
          :precondition (and (isbconf #q25) (isbconf #q29))
          :effect (basemotion #q25 #t1028 #q29)
   )
   (:action s1065_plan-base-motion
          :parameters (#q25 #q30)
          :precondition (and (isbconf #q25) (isbconf #q30))
          :effect (basemotion #q25 #t1029 #q30)
   )
   (:action s1066_plan-base-motion
          :parameters (#q25 #q31)
          :precondition (and (isbconf #q25) (isbconf #q31))
          :effect (basemotion #q25 #t1030 #q31)
   )
   (:action s1067_plan-base-motion
          :parameters (#q25 #q32)
          :precondition (and (isbconf #q25) (isbconf #q32))
          :effect (basemotion #q25 #t1031 #q32)
   )
   (:action s1068_plan-base-motion
          :parameters (#q25 #q33)
          :precondition (and (isbconf #q25) (isbconf #q33))
          :effect (basemotion #q25 #t1032 #q33)
   )
   (:action s1069_plan-base-motion
          :parameters (#q25 #q34)
          :precondition (and (isbconf #q25) (isbconf #q34))
          :effect (basemotion #q25 #t1033 #q34)
   )
   (:action s1070_plan-base-motion
          :parameters (#q25 #q35)
          :precondition (and (isbconf #q25) (isbconf #q35))
          :effect (basemotion #q25 #t1034 #q35)
   )
   (:action s1071_plan-base-motion
          :parameters (#q26 q976)
          :precondition (and (isbconf #q26) (isbconf q976))
          :effect (basemotion #q26 #t1035 q976)
   )
   (:action s1072_plan-base-motion
          :parameters (#q26 #q0)
          :precondition (and (isbconf #q26) (isbconf #q0))
          :effect (basemotion #q26 #t1036 #q0)
   )
   (:action s1073_plan-base-motion
          :parameters (#q26 #q1)
          :precondition (and (isbconf #q26) (isbconf #q1))
          :effect (basemotion #q26 #t1037 #q1)
   )
   (:action s1074_plan-base-motion
          :parameters (#q26 #q2)
          :precondition (and (isbconf #q26) (isbconf #q2))
          :effect (basemotion #q26 #t1038 #q2)
   )
   (:action s1075_plan-base-motion
          :parameters (#q26 #q3)
          :precondition (and (isbconf #q26) (isbconf #q3))
          :effect (basemotion #q26 #t1039 #q3)
   )
   (:action s1076_plan-base-motion
          :parameters (#q26 #q4)
          :precondition (and (isbconf #q26) (isbconf #q4))
          :effect (basemotion #q26 #t1040 #q4)
   )
   (:action s1077_plan-base-motion
          :parameters (#q26 #q5)
          :precondition (and (isbconf #q26) (isbconf #q5))
          :effect (basemotion #q26 #t1041 #q5)
   )
   (:action s1078_plan-base-motion
          :parameters (#q26 #q6)
          :precondition (and (isbconf #q26) (isbconf #q6))
          :effect (basemotion #q26 #t1042 #q6)
   )
   (:action s1079_plan-base-motion
          :parameters (#q26 #q7)
          :precondition (and (isbconf #q26) (isbconf #q7))
          :effect (basemotion #q26 #t1043 #q7)
   )
   (:action s1080_plan-base-motion
          :parameters (#q26 #q8)
          :precondition (and (isbconf #q26) (isbconf #q8))
          :effect (basemotion #q26 #t1044 #q8)
   )
   (:action s1081_plan-base-motion
          :parameters (#q26 #q9)
          :precondition (and (isbconf #q26) (isbconf #q9))
          :effect (basemotion #q26 #t1045 #q9)
   )
   (:action s1082_plan-base-motion
          :parameters (#q26 #q10)
          :precondition (and (isbconf #q26) (isbconf #q10))
          :effect (basemotion #q26 #t1046 #q10)
   )
   (:action s1083_plan-base-motion
          :parameters (#q26 #q11)
          :precondition (and (isbconf #q26) (isbconf #q11))
          :effect (basemotion #q26 #t1047 #q11)
   )
   (:action s1084_plan-base-motion
          :parameters (#q26 #q12)
          :precondition (and (isbconf #q26) (isbconf #q12))
          :effect (basemotion #q26 #t1048 #q12)
   )
   (:action s1085_plan-base-motion
          :parameters (#q26 #q13)
          :precondition (and (isbconf #q26) (isbconf #q13))
          :effect (basemotion #q26 #t1049 #q13)
   )
   (:action s1086_plan-base-motion
          :parameters (#q26 #q14)
          :precondition (and (isbconf #q26) (isbconf #q14))
          :effect (basemotion #q26 #t1050 #q14)
   )
   (:action s1087_plan-base-motion
          :parameters (#q26 #q15)
          :precondition (and (isbconf #q26) (isbconf #q15))
          :effect (basemotion #q26 #t1051 #q15)
   )
   (:action s1088_plan-base-motion
          :parameters (#q26 #q16)
          :precondition (and (isbconf #q26) (isbconf #q16))
          :effect (basemotion #q26 #t1052 #q16)
   )
   (:action s1089_plan-base-motion
          :parameters (#q26 #q17)
          :precondition (and (isbconf #q26) (isbconf #q17))
          :effect (basemotion #q26 #t1053 #q17)
   )
   (:action s1090_plan-base-motion
          :parameters (#q26 #q18)
          :precondition (and (isbconf #q26) (isbconf #q18))
          :effect (basemotion #q26 #t1054 #q18)
   )
   (:action s1091_plan-base-motion
          :parameters (#q26 #q19)
          :precondition (and (isbconf #q26) (isbconf #q19))
          :effect (basemotion #q26 #t1055 #q19)
   )
   (:action s1092_plan-base-motion
          :parameters (#q26 #q20)
          :precondition (and (isbconf #q26) (isbconf #q20))
          :effect (basemotion #q26 #t1056 #q20)
   )
   (:action s1093_plan-base-motion
          :parameters (#q26 #q21)
          :precondition (and (isbconf #q26) (isbconf #q21))
          :effect (basemotion #q26 #t1057 #q21)
   )
   (:action s1094_plan-base-motion
          :parameters (#q26 #q22)
          :precondition (and (isbconf #q26) (isbconf #q22))
          :effect (basemotion #q26 #t1058 #q22)
   )
   (:action s1095_plan-base-motion
          :parameters (#q26 #q23)
          :precondition (and (isbconf #q26) (isbconf #q23))
          :effect (basemotion #q26 #t1059 #q23)
   )
   (:action s1096_plan-base-motion
          :parameters (#q26 #q24)
          :precondition (and (isbconf #q26) (isbconf #q24))
          :effect (basemotion #q26 #t1060 #q24)
   )
   (:action s1097_plan-base-motion
          :parameters (#q26 #q25)
          :precondition (and (isbconf #q26) (isbconf #q25))
          :effect (basemotion #q26 #t1061 #q25)
   )
   (:action s1098_plan-base-motion
          :parameters (#q26 #q26)
          :precondition (and (isbconf #q26) (isbconf #q26))
          :effect (basemotion #q26 #t1062 #q26)
   )
   (:action s1099_plan-base-motion
          :parameters (#q26 #q27)
          :precondition (and (isbconf #q26) (isbconf #q27))
          :effect (basemotion #q26 #t1063 #q27)
   )
   (:action s1100_plan-base-motion
          :parameters (#q26 #q28)
          :precondition (and (isbconf #q26) (isbconf #q28))
          :effect (basemotion #q26 #t1064 #q28)
   )
   (:action s1101_plan-base-motion
          :parameters (#q26 #q29)
          :precondition (and (isbconf #q26) (isbconf #q29))
          :effect (basemotion #q26 #t1065 #q29)
   )
   (:action s1102_plan-base-motion
          :parameters (#q26 #q30)
          :precondition (and (isbconf #q26) (isbconf #q30))
          :effect (basemotion #q26 #t1066 #q30)
   )
   (:action s1103_plan-base-motion
          :parameters (#q26 #q31)
          :precondition (and (isbconf #q26) (isbconf #q31))
          :effect (basemotion #q26 #t1067 #q31)
   )
   (:action s1104_plan-base-motion
          :parameters (#q26 #q32)
          :precondition (and (isbconf #q26) (isbconf #q32))
          :effect (basemotion #q26 #t1068 #q32)
   )
   (:action s1105_plan-base-motion
          :parameters (#q26 #q33)
          :precondition (and (isbconf #q26) (isbconf #q33))
          :effect (basemotion #q26 #t1069 #q33)
   )
   (:action s1106_plan-base-motion
          :parameters (#q26 #q34)
          :precondition (and (isbconf #q26) (isbconf #q34))
          :effect (basemotion #q26 #t1070 #q34)
   )
   (:action s1107_plan-base-motion
          :parameters (#q26 #q35)
          :precondition (and (isbconf #q26) (isbconf #q35))
          :effect (basemotion #q26 #t1071 #q35)
   )
   (:action s1108_plan-base-motion
          :parameters (#q27 q976)
          :precondition (and (isbconf #q27) (isbconf q976))
          :effect (basemotion #q27 #t1072 q976)
   )
   (:action s1109_plan-base-motion
          :parameters (#q27 #q0)
          :precondition (and (isbconf #q27) (isbconf #q0))
          :effect (basemotion #q27 #t1073 #q0)
   )
   (:action s1110_plan-base-motion
          :parameters (#q27 #q1)
          :precondition (and (isbconf #q27) (isbconf #q1))
          :effect (basemotion #q27 #t1074 #q1)
   )
   (:action s1111_plan-base-motion
          :parameters (#q27 #q2)
          :precondition (and (isbconf #q27) (isbconf #q2))
          :effect (basemotion #q27 #t1075 #q2)
   )
   (:action s1112_plan-base-motion
          :parameters (#q27 #q3)
          :precondition (and (isbconf #q27) (isbconf #q3))
          :effect (basemotion #q27 #t1076 #q3)
   )
   (:action s1113_plan-base-motion
          :parameters (#q27 #q4)
          :precondition (and (isbconf #q27) (isbconf #q4))
          :effect (basemotion #q27 #t1077 #q4)
   )
   (:action s1114_plan-base-motion
          :parameters (#q27 #q5)
          :precondition (and (isbconf #q27) (isbconf #q5))
          :effect (basemotion #q27 #t1078 #q5)
   )
   (:action s1115_plan-base-motion
          :parameters (#q27 #q6)
          :precondition (and (isbconf #q27) (isbconf #q6))
          :effect (basemotion #q27 #t1079 #q6)
   )
   (:action s1116_plan-base-motion
          :parameters (#q27 #q7)
          :precondition (and (isbconf #q27) (isbconf #q7))
          :effect (basemotion #q27 #t1080 #q7)
   )
   (:action s1117_plan-base-motion
          :parameters (#q27 #q8)
          :precondition (and (isbconf #q27) (isbconf #q8))
          :effect (basemotion #q27 #t1081 #q8)
   )
   (:action s1118_plan-base-motion
          :parameters (#q27 #q9)
          :precondition (and (isbconf #q27) (isbconf #q9))
          :effect (basemotion #q27 #t1082 #q9)
   )
   (:action s1119_plan-base-motion
          :parameters (#q27 #q10)
          :precondition (and (isbconf #q27) (isbconf #q10))
          :effect (basemotion #q27 #t1083 #q10)
   )
   (:action s1120_plan-base-motion
          :parameters (#q27 #q11)
          :precondition (and (isbconf #q27) (isbconf #q11))
          :effect (basemotion #q27 #t1084 #q11)
   )
   (:action s1121_plan-base-motion
          :parameters (#q27 #q12)
          :precondition (and (isbconf #q27) (isbconf #q12))
          :effect (basemotion #q27 #t1085 #q12)
   )
   (:action s1122_plan-base-motion
          :parameters (#q27 #q13)
          :precondition (and (isbconf #q27) (isbconf #q13))
          :effect (basemotion #q27 #t1086 #q13)
   )
   (:action s1123_plan-base-motion
          :parameters (#q27 #q14)
          :precondition (and (isbconf #q27) (isbconf #q14))
          :effect (basemotion #q27 #t1087 #q14)
   )
   (:action s1124_plan-base-motion
          :parameters (#q27 #q15)
          :precondition (and (isbconf #q27) (isbconf #q15))
          :effect (basemotion #q27 #t1088 #q15)
   )
   (:action s1125_plan-base-motion
          :parameters (#q27 #q16)
          :precondition (and (isbconf #q27) (isbconf #q16))
          :effect (basemotion #q27 #t1089 #q16)
   )
   (:action s1126_plan-base-motion
          :parameters (#q27 #q17)
          :precondition (and (isbconf #q27) (isbconf #q17))
          :effect (basemotion #q27 #t1090 #q17)
   )
   (:action s1127_plan-base-motion
          :parameters (#q27 #q18)
          :precondition (and (isbconf #q27) (isbconf #q18))
          :effect (basemotion #q27 #t1091 #q18)
   )
   (:action s1128_plan-base-motion
          :parameters (#q27 #q19)
          :precondition (and (isbconf #q27) (isbconf #q19))
          :effect (basemotion #q27 #t1092 #q19)
   )
   (:action s1129_plan-base-motion
          :parameters (#q27 #q20)
          :precondition (and (isbconf #q27) (isbconf #q20))
          :effect (basemotion #q27 #t1093 #q20)
   )
   (:action s1130_plan-base-motion
          :parameters (#q27 #q21)
          :precondition (and (isbconf #q27) (isbconf #q21))
          :effect (basemotion #q27 #t1094 #q21)
   )
   (:action s1131_plan-base-motion
          :parameters (#q27 #q22)
          :precondition (and (isbconf #q27) (isbconf #q22))
          :effect (basemotion #q27 #t1095 #q22)
   )
   (:action s1132_plan-base-motion
          :parameters (#q27 #q23)
          :precondition (and (isbconf #q27) (isbconf #q23))
          :effect (basemotion #q27 #t1096 #q23)
   )
   (:action s1133_plan-base-motion
          :parameters (#q27 #q24)
          :precondition (and (isbconf #q27) (isbconf #q24))
          :effect (basemotion #q27 #t1097 #q24)
   )
   (:action s1134_plan-base-motion
          :parameters (#q27 #q25)
          :precondition (and (isbconf #q27) (isbconf #q25))
          :effect (basemotion #q27 #t1098 #q25)
   )
   (:action s1135_plan-base-motion
          :parameters (#q27 #q26)
          :precondition (and (isbconf #q27) (isbconf #q26))
          :effect (basemotion #q27 #t1099 #q26)
   )
   (:action s1136_plan-base-motion
          :parameters (#q27 #q27)
          :precondition (and (isbconf #q27) (isbconf #q27))
          :effect (basemotion #q27 #t1100 #q27)
   )
   (:action s1137_plan-base-motion
          :parameters (#q27 #q28)
          :precondition (and (isbconf #q27) (isbconf #q28))
          :effect (basemotion #q27 #t1101 #q28)
   )
   (:action s1138_plan-base-motion
          :parameters (#q27 #q29)
          :precondition (and (isbconf #q27) (isbconf #q29))
          :effect (basemotion #q27 #t1102 #q29)
   )
   (:action s1139_plan-base-motion
          :parameters (#q27 #q30)
          :precondition (and (isbconf #q27) (isbconf #q30))
          :effect (basemotion #q27 #t1103 #q30)
   )
   (:action s1140_plan-base-motion
          :parameters (#q27 #q31)
          :precondition (and (isbconf #q27) (isbconf #q31))
          :effect (basemotion #q27 #t1104 #q31)
   )
   (:action s1141_plan-base-motion
          :parameters (#q27 #q32)
          :precondition (and (isbconf #q27) (isbconf #q32))
          :effect (basemotion #q27 #t1105 #q32)
   )
   (:action s1142_plan-base-motion
          :parameters (#q27 #q33)
          :precondition (and (isbconf #q27) (isbconf #q33))
          :effect (basemotion #q27 #t1106 #q33)
   )
   (:action s1143_plan-base-motion
          :parameters (#q27 #q34)
          :precondition (and (isbconf #q27) (isbconf #q34))
          :effect (basemotion #q27 #t1107 #q34)
   )
   (:action s1144_plan-base-motion
          :parameters (#q27 #q35)
          :precondition (and (isbconf #q27) (isbconf #q35))
          :effect (basemotion #q27 #t1108 #q35)
   )
   (:action s1145_plan-base-motion
          :parameters (#q28 q976)
          :precondition (and (isbconf #q28) (isbconf q976))
          :effect (basemotion #q28 #t1109 q976)
   )
   (:action s1146_plan-base-motion
          :parameters (#q28 #q0)
          :precondition (and (isbconf #q28) (isbconf #q0))
          :effect (basemotion #q28 #t1110 #q0)
   )
   (:action s1147_plan-base-motion
          :parameters (#q28 #q1)
          :precondition (and (isbconf #q28) (isbconf #q1))
          :effect (basemotion #q28 #t1111 #q1)
   )
   (:action s1148_plan-base-motion
          :parameters (#q28 #q2)
          :precondition (and (isbconf #q28) (isbconf #q2))
          :effect (basemotion #q28 #t1112 #q2)
   )
   (:action s1149_plan-base-motion
          :parameters (#q28 #q3)
          :precondition (and (isbconf #q28) (isbconf #q3))
          :effect (basemotion #q28 #t1113 #q3)
   )
   (:action s1150_plan-base-motion
          :parameters (#q28 #q4)
          :precondition (and (isbconf #q28) (isbconf #q4))
          :effect (basemotion #q28 #t1114 #q4)
   )
   (:action s1151_plan-base-motion
          :parameters (#q28 #q5)
          :precondition (and (isbconf #q28) (isbconf #q5))
          :effect (basemotion #q28 #t1115 #q5)
   )
   (:action s1152_plan-base-motion
          :parameters (#q28 #q6)
          :precondition (and (isbconf #q28) (isbconf #q6))
          :effect (basemotion #q28 #t1116 #q6)
   )
   (:action s1153_plan-base-motion
          :parameters (#q28 #q7)
          :precondition (and (isbconf #q28) (isbconf #q7))
          :effect (basemotion #q28 #t1117 #q7)
   )
   (:action s1154_plan-base-motion
          :parameters (#q28 #q8)
          :precondition (and (isbconf #q28) (isbconf #q8))
          :effect (basemotion #q28 #t1118 #q8)
   )
   (:action s1155_plan-base-motion
          :parameters (#q28 #q9)
          :precondition (and (isbconf #q28) (isbconf #q9))
          :effect (basemotion #q28 #t1119 #q9)
   )
   (:action s1156_plan-base-motion
          :parameters (#q28 #q10)
          :precondition (and (isbconf #q28) (isbconf #q10))
          :effect (basemotion #q28 #t1120 #q10)
   )
   (:action s1157_plan-base-motion
          :parameters (#q28 #q11)
          :precondition (and (isbconf #q28) (isbconf #q11))
          :effect (basemotion #q28 #t1121 #q11)
   )
   (:action s1158_plan-base-motion
          :parameters (#q28 #q12)
          :precondition (and (isbconf #q28) (isbconf #q12))
          :effect (basemotion #q28 #t1122 #q12)
   )
   (:action s1159_plan-base-motion
          :parameters (#q28 #q13)
          :precondition (and (isbconf #q28) (isbconf #q13))
          :effect (basemotion #q28 #t1123 #q13)
   )
   (:action s1160_plan-base-motion
          :parameters (#q28 #q14)
          :precondition (and (isbconf #q28) (isbconf #q14))
          :effect (basemotion #q28 #t1124 #q14)
   )
   (:action s1161_plan-base-motion
          :parameters (#q28 #q15)
          :precondition (and (isbconf #q28) (isbconf #q15))
          :effect (basemotion #q28 #t1125 #q15)
   )
   (:action s1162_plan-base-motion
          :parameters (#q28 #q16)
          :precondition (and (isbconf #q28) (isbconf #q16))
          :effect (basemotion #q28 #t1126 #q16)
   )
   (:action s1163_plan-base-motion
          :parameters (#q28 #q17)
          :precondition (and (isbconf #q28) (isbconf #q17))
          :effect (basemotion #q28 #t1127 #q17)
   )
   (:action s1164_plan-base-motion
          :parameters (#q28 #q18)
          :precondition (and (isbconf #q28) (isbconf #q18))
          :effect (basemotion #q28 #t1128 #q18)
   )
   (:action s1165_plan-base-motion
          :parameters (#q28 #q19)
          :precondition (and (isbconf #q28) (isbconf #q19))
          :effect (basemotion #q28 #t1129 #q19)
   )
   (:action s1166_plan-base-motion
          :parameters (#q28 #q20)
          :precondition (and (isbconf #q28) (isbconf #q20))
          :effect (basemotion #q28 #t1130 #q20)
   )
   (:action s1167_plan-base-motion
          :parameters (#q28 #q21)
          :precondition (and (isbconf #q28) (isbconf #q21))
          :effect (basemotion #q28 #t1131 #q21)
   )
   (:action s1168_plan-base-motion
          :parameters (#q28 #q22)
          :precondition (and (isbconf #q28) (isbconf #q22))
          :effect (basemotion #q28 #t1132 #q22)
   )
   (:action s1169_plan-base-motion
          :parameters (#q28 #q23)
          :precondition (and (isbconf #q28) (isbconf #q23))
          :effect (basemotion #q28 #t1133 #q23)
   )
   (:action s1170_plan-base-motion
          :parameters (#q28 #q24)
          :precondition (and (isbconf #q28) (isbconf #q24))
          :effect (basemotion #q28 #t1134 #q24)
   )
   (:action s1171_plan-base-motion
          :parameters (#q28 #q25)
          :precondition (and (isbconf #q28) (isbconf #q25))
          :effect (basemotion #q28 #t1135 #q25)
   )
   (:action s1172_plan-base-motion
          :parameters (#q28 #q26)
          :precondition (and (isbconf #q28) (isbconf #q26))
          :effect (basemotion #q28 #t1136 #q26)
   )
   (:action s1173_plan-base-motion
          :parameters (#q28 #q27)
          :precondition (and (isbconf #q28) (isbconf #q27))
          :effect (basemotion #q28 #t1137 #q27)
   )
   (:action s1174_plan-base-motion
          :parameters (#q28 #q28)
          :precondition (and (isbconf #q28) (isbconf #q28))
          :effect (basemotion #q28 #t1138 #q28)
   )
   (:action s1175_plan-base-motion
          :parameters (#q28 #q29)
          :precondition (and (isbconf #q28) (isbconf #q29))
          :effect (basemotion #q28 #t1139 #q29)
   )
   (:action s1176_plan-base-motion
          :parameters (#q28 #q30)
          :precondition (and (isbconf #q28) (isbconf #q30))
          :effect (basemotion #q28 #t1140 #q30)
   )
   (:action s1177_plan-base-motion
          :parameters (#q28 #q31)
          :precondition (and (isbconf #q28) (isbconf #q31))
          :effect (basemotion #q28 #t1141 #q31)
   )
   (:action s1178_plan-base-motion
          :parameters (#q28 #q32)
          :precondition (and (isbconf #q28) (isbconf #q32))
          :effect (basemotion #q28 #t1142 #q32)
   )
   (:action s1179_plan-base-motion
          :parameters (#q28 #q33)
          :precondition (and (isbconf #q28) (isbconf #q33))
          :effect (basemotion #q28 #t1143 #q33)
   )
   (:action s1180_plan-base-motion
          :parameters (#q28 #q34)
          :precondition (and (isbconf #q28) (isbconf #q34))
          :effect (basemotion #q28 #t1144 #q34)
   )
   (:action s1181_plan-base-motion
          :parameters (#q28 #q35)
          :precondition (and (isbconf #q28) (isbconf #q35))
          :effect (basemotion #q28 #t1145 #q35)
   )
   (:action s1182_plan-base-motion
          :parameters (#q29 q976)
          :precondition (and (isbconf #q29) (isbconf q976))
          :effect (basemotion #q29 #t1146 q976)
   )
   (:action s1183_plan-base-motion
          :parameters (#q29 #q0)
          :precondition (and (isbconf #q29) (isbconf #q0))
          :effect (basemotion #q29 #t1147 #q0)
   )
   (:action s1184_plan-base-motion
          :parameters (#q29 #q1)
          :precondition (and (isbconf #q29) (isbconf #q1))
          :effect (basemotion #q29 #t1148 #q1)
   )
   (:action s1185_plan-base-motion
          :parameters (#q29 #q2)
          :precondition (and (isbconf #q29) (isbconf #q2))
          :effect (basemotion #q29 #t1149 #q2)
   )
   (:action s1186_plan-base-motion
          :parameters (#q29 #q3)
          :precondition (and (isbconf #q29) (isbconf #q3))
          :effect (basemotion #q29 #t1150 #q3)
   )
   (:action s1187_plan-base-motion
          :parameters (#q29 #q4)
          :precondition (and (isbconf #q29) (isbconf #q4))
          :effect (basemotion #q29 #t1151 #q4)
   )
   (:action s1188_plan-base-motion
          :parameters (#q29 #q5)
          :precondition (and (isbconf #q29) (isbconf #q5))
          :effect (basemotion #q29 #t1152 #q5)
   )
   (:action s1189_plan-base-motion
          :parameters (#q29 #q6)
          :precondition (and (isbconf #q29) (isbconf #q6))
          :effect (basemotion #q29 #t1153 #q6)
   )
   (:action s1190_plan-base-motion
          :parameters (#q29 #q7)
          :precondition (and (isbconf #q29) (isbconf #q7))
          :effect (basemotion #q29 #t1154 #q7)
   )
   (:action s1191_plan-base-motion
          :parameters (#q29 #q8)
          :precondition (and (isbconf #q29) (isbconf #q8))
          :effect (basemotion #q29 #t1155 #q8)
   )
   (:action s1192_plan-base-motion
          :parameters (#q29 #q9)
          :precondition (and (isbconf #q29) (isbconf #q9))
          :effect (basemotion #q29 #t1156 #q9)
   )
   (:action s1193_plan-base-motion
          :parameters (#q29 #q10)
          :precondition (and (isbconf #q29) (isbconf #q10))
          :effect (basemotion #q29 #t1157 #q10)
   )
   (:action s1194_plan-base-motion
          :parameters (#q29 #q11)
          :precondition (and (isbconf #q29) (isbconf #q11))
          :effect (basemotion #q29 #t1158 #q11)
   )
   (:action s1195_plan-base-motion
          :parameters (#q29 #q12)
          :precondition (and (isbconf #q29) (isbconf #q12))
          :effect (basemotion #q29 #t1159 #q12)
   )
   (:action s1196_plan-base-motion
          :parameters (#q29 #q13)
          :precondition (and (isbconf #q29) (isbconf #q13))
          :effect (basemotion #q29 #t1160 #q13)
   )
   (:action s1197_plan-base-motion
          :parameters (#q29 #q14)
          :precondition (and (isbconf #q29) (isbconf #q14))
          :effect (basemotion #q29 #t1161 #q14)
   )
   (:action s1198_plan-base-motion
          :parameters (#q29 #q15)
          :precondition (and (isbconf #q29) (isbconf #q15))
          :effect (basemotion #q29 #t1162 #q15)
   )
   (:action s1199_plan-base-motion
          :parameters (#q29 #q16)
          :precondition (and (isbconf #q29) (isbconf #q16))
          :effect (basemotion #q29 #t1163 #q16)
   )
   (:action s1200_plan-base-motion
          :parameters (#q29 #q17)
          :precondition (and (isbconf #q29) (isbconf #q17))
          :effect (basemotion #q29 #t1164 #q17)
   )
   (:action s1201_plan-base-motion
          :parameters (#q29 #q18)
          :precondition (and (isbconf #q29) (isbconf #q18))
          :effect (basemotion #q29 #t1165 #q18)
   )
   (:action s1202_plan-base-motion
          :parameters (#q29 #q19)
          :precondition (and (isbconf #q29) (isbconf #q19))
          :effect (basemotion #q29 #t1166 #q19)
   )
   (:action s1203_plan-base-motion
          :parameters (#q29 #q20)
          :precondition (and (isbconf #q29) (isbconf #q20))
          :effect (basemotion #q29 #t1167 #q20)
   )
   (:action s1204_plan-base-motion
          :parameters (#q29 #q21)
          :precondition (and (isbconf #q29) (isbconf #q21))
          :effect (basemotion #q29 #t1168 #q21)
   )
   (:action s1205_plan-base-motion
          :parameters (#q29 #q22)
          :precondition (and (isbconf #q29) (isbconf #q22))
          :effect (basemotion #q29 #t1169 #q22)
   )
   (:action s1206_plan-base-motion
          :parameters (#q29 #q23)
          :precondition (and (isbconf #q29) (isbconf #q23))
          :effect (basemotion #q29 #t1170 #q23)
   )
   (:action s1207_plan-base-motion
          :parameters (#q29 #q24)
          :precondition (and (isbconf #q29) (isbconf #q24))
          :effect (basemotion #q29 #t1171 #q24)
   )
   (:action s1208_plan-base-motion
          :parameters (#q29 #q25)
          :precondition (and (isbconf #q29) (isbconf #q25))
          :effect (basemotion #q29 #t1172 #q25)
   )
   (:action s1209_plan-base-motion
          :parameters (#q29 #q26)
          :precondition (and (isbconf #q29) (isbconf #q26))
          :effect (basemotion #q29 #t1173 #q26)
   )
   (:action s1210_plan-base-motion
          :parameters (#q29 #q27)
          :precondition (and (isbconf #q29) (isbconf #q27))
          :effect (basemotion #q29 #t1174 #q27)
   )
   (:action s1211_plan-base-motion
          :parameters (#q29 #q28)
          :precondition (and (isbconf #q29) (isbconf #q28))
          :effect (basemotion #q29 #t1175 #q28)
   )
   (:action s1212_plan-base-motion
          :parameters (#q29 #q29)
          :precondition (and (isbconf #q29) (isbconf #q29))
          :effect (basemotion #q29 #t1176 #q29)
   )
   (:action s1213_plan-base-motion
          :parameters (#q29 #q30)
          :precondition (and (isbconf #q29) (isbconf #q30))
          :effect (basemotion #q29 #t1177 #q30)
   )
   (:action s1214_plan-base-motion
          :parameters (#q29 #q31)
          :precondition (and (isbconf #q29) (isbconf #q31))
          :effect (basemotion #q29 #t1178 #q31)
   )
   (:action s1215_plan-base-motion
          :parameters (#q29 #q32)
          :precondition (and (isbconf #q29) (isbconf #q32))
          :effect (basemotion #q29 #t1179 #q32)
   )
   (:action s1216_plan-base-motion
          :parameters (#q29 #q33)
          :precondition (and (isbconf #q29) (isbconf #q33))
          :effect (basemotion #q29 #t1180 #q33)
   )
   (:action s1217_plan-base-motion
          :parameters (#q29 #q34)
          :precondition (and (isbconf #q29) (isbconf #q34))
          :effect (basemotion #q29 #t1181 #q34)
   )
   (:action s1218_plan-base-motion
          :parameters (#q29 #q35)
          :precondition (and (isbconf #q29) (isbconf #q35))
          :effect (basemotion #q29 #t1182 #q35)
   )
   (:action s1219_plan-base-motion
          :parameters (#q30 q976)
          :precondition (and (isbconf #q30) (isbconf q976))
          :effect (basemotion #q30 #t1183 q976)
   )
   (:action s1220_plan-base-motion
          :parameters (#q30 #q0)
          :precondition (and (isbconf #q30) (isbconf #q0))
          :effect (basemotion #q30 #t1184 #q0)
   )
   (:action s1221_plan-base-motion
          :parameters (#q30 #q1)
          :precondition (and (isbconf #q30) (isbconf #q1))
          :effect (basemotion #q30 #t1185 #q1)
   )
   (:action s1222_plan-base-motion
          :parameters (#q30 #q2)
          :precondition (and (isbconf #q30) (isbconf #q2))
          :effect (basemotion #q30 #t1186 #q2)
   )
   (:action s1223_plan-base-motion
          :parameters (#q30 #q3)
          :precondition (and (isbconf #q30) (isbconf #q3))
          :effect (basemotion #q30 #t1187 #q3)
   )
   (:action s1224_plan-base-motion
          :parameters (#q30 #q4)
          :precondition (and (isbconf #q30) (isbconf #q4))
          :effect (basemotion #q30 #t1188 #q4)
   )
   (:action s1225_plan-base-motion
          :parameters (#q30 #q5)
          :precondition (and (isbconf #q30) (isbconf #q5))
          :effect (basemotion #q30 #t1189 #q5)
   )
   (:action s1226_plan-base-motion
          :parameters (#q30 #q6)
          :precondition (and (isbconf #q30) (isbconf #q6))
          :effect (basemotion #q30 #t1190 #q6)
   )
   (:action s1227_plan-base-motion
          :parameters (#q30 #q7)
          :precondition (and (isbconf #q30) (isbconf #q7))
          :effect (basemotion #q30 #t1191 #q7)
   )
   (:action s1228_plan-base-motion
          :parameters (#q30 #q8)
          :precondition (and (isbconf #q30) (isbconf #q8))
          :effect (basemotion #q30 #t1192 #q8)
   )
   (:action s1229_plan-base-motion
          :parameters (#q30 #q9)
          :precondition (and (isbconf #q30) (isbconf #q9))
          :effect (basemotion #q30 #t1193 #q9)
   )
   (:action s1230_plan-base-motion
          :parameters (#q30 #q10)
          :precondition (and (isbconf #q30) (isbconf #q10))
          :effect (basemotion #q30 #t1194 #q10)
   )
   (:action s1231_plan-base-motion
          :parameters (#q30 #q11)
          :precondition (and (isbconf #q30) (isbconf #q11))
          :effect (basemotion #q30 #t1195 #q11)
   )
   (:action s1232_plan-base-motion
          :parameters (#q30 #q12)
          :precondition (and (isbconf #q30) (isbconf #q12))
          :effect (basemotion #q30 #t1196 #q12)
   )
   (:action s1233_plan-base-motion
          :parameters (#q30 #q13)
          :precondition (and (isbconf #q30) (isbconf #q13))
          :effect (basemotion #q30 #t1197 #q13)
   )
   (:action s1234_plan-base-motion
          :parameters (#q30 #q14)
          :precondition (and (isbconf #q30) (isbconf #q14))
          :effect (basemotion #q30 #t1198 #q14)
   )
   (:action s1235_plan-base-motion
          :parameters (#q30 #q15)
          :precondition (and (isbconf #q30) (isbconf #q15))
          :effect (basemotion #q30 #t1199 #q15)
   )
   (:action s1236_plan-base-motion
          :parameters (#q30 #q16)
          :precondition (and (isbconf #q30) (isbconf #q16))
          :effect (basemotion #q30 #t1200 #q16)
   )
   (:action s1237_plan-base-motion
          :parameters (#q30 #q17)
          :precondition (and (isbconf #q30) (isbconf #q17))
          :effect (basemotion #q30 #t1201 #q17)
   )
   (:action s1238_plan-base-motion
          :parameters (#q30 #q18)
          :precondition (and (isbconf #q30) (isbconf #q18))
          :effect (basemotion #q30 #t1202 #q18)
   )
   (:action s1239_plan-base-motion
          :parameters (#q30 #q19)
          :precondition (and (isbconf #q30) (isbconf #q19))
          :effect (basemotion #q30 #t1203 #q19)
   )
   (:action s1240_plan-base-motion
          :parameters (#q30 #q20)
          :precondition (and (isbconf #q30) (isbconf #q20))
          :effect (basemotion #q30 #t1204 #q20)
   )
   (:action s1241_plan-base-motion
          :parameters (#q30 #q21)
          :precondition (and (isbconf #q30) (isbconf #q21))
          :effect (basemotion #q30 #t1205 #q21)
   )
   (:action s1242_plan-base-motion
          :parameters (#q30 #q22)
          :precondition (and (isbconf #q30) (isbconf #q22))
          :effect (basemotion #q30 #t1206 #q22)
   )
   (:action s1243_plan-base-motion
          :parameters (#q30 #q23)
          :precondition (and (isbconf #q30) (isbconf #q23))
          :effect (basemotion #q30 #t1207 #q23)
   )
   (:action s1244_plan-base-motion
          :parameters (#q30 #q24)
          :precondition (and (isbconf #q30) (isbconf #q24))
          :effect (basemotion #q30 #t1208 #q24)
   )
   (:action s1245_plan-base-motion
          :parameters (#q30 #q25)
          :precondition (and (isbconf #q30) (isbconf #q25))
          :effect (basemotion #q30 #t1209 #q25)
   )
   (:action s1246_plan-base-motion
          :parameters (#q30 #q26)
          :precondition (and (isbconf #q30) (isbconf #q26))
          :effect (basemotion #q30 #t1210 #q26)
   )
   (:action s1247_plan-base-motion
          :parameters (#q30 #q27)
          :precondition (and (isbconf #q30) (isbconf #q27))
          :effect (basemotion #q30 #t1211 #q27)
   )
   (:action s1248_plan-base-motion
          :parameters (#q30 #q28)
          :precondition (and (isbconf #q30) (isbconf #q28))
          :effect (basemotion #q30 #t1212 #q28)
   )
   (:action s1249_plan-base-motion
          :parameters (#q30 #q29)
          :precondition (and (isbconf #q30) (isbconf #q29))
          :effect (basemotion #q30 #t1213 #q29)
   )
   (:action s1250_plan-base-motion
          :parameters (#q30 #q30)
          :precondition (and (isbconf #q30) (isbconf #q30))
          :effect (basemotion #q30 #t1214 #q30)
   )
   (:action s1251_plan-base-motion
          :parameters (#q30 #q31)
          :precondition (and (isbconf #q30) (isbconf #q31))
          :effect (basemotion #q30 #t1215 #q31)
   )
   (:action s1252_plan-base-motion
          :parameters (#q30 #q32)
          :precondition (and (isbconf #q30) (isbconf #q32))
          :effect (basemotion #q30 #t1216 #q32)
   )
   (:action s1253_plan-base-motion
          :parameters (#q30 #q33)
          :precondition (and (isbconf #q30) (isbconf #q33))
          :effect (basemotion #q30 #t1217 #q33)
   )
   (:action s1254_plan-base-motion
          :parameters (#q30 #q34)
          :precondition (and (isbconf #q30) (isbconf #q34))
          :effect (basemotion #q30 #t1218 #q34)
   )
   (:action s1255_plan-base-motion
          :parameters (#q30 #q35)
          :precondition (and (isbconf #q30) (isbconf #q35))
          :effect (basemotion #q30 #t1219 #q35)
   )
   (:action s1256_plan-base-motion
          :parameters (#q31 q976)
          :precondition (and (isbconf #q31) (isbconf q976))
          :effect (basemotion #q31 #t1220 q976)
   )
   (:action s1257_plan-base-motion
          :parameters (#q31 #q0)
          :precondition (and (isbconf #q31) (isbconf #q0))
          :effect (basemotion #q31 #t1221 #q0)
   )
   (:action s1258_plan-base-motion
          :parameters (#q31 #q1)
          :precondition (and (isbconf #q31) (isbconf #q1))
          :effect (basemotion #q31 #t1222 #q1)
   )
   (:action s1259_plan-base-motion
          :parameters (#q31 #q2)
          :precondition (and (isbconf #q31) (isbconf #q2))
          :effect (basemotion #q31 #t1223 #q2)
   )
   (:action s1260_plan-base-motion
          :parameters (#q31 #q3)
          :precondition (and (isbconf #q31) (isbconf #q3))
          :effect (basemotion #q31 #t1224 #q3)
   )
   (:action s1261_plan-base-motion
          :parameters (#q31 #q4)
          :precondition (and (isbconf #q31) (isbconf #q4))
          :effect (basemotion #q31 #t1225 #q4)
   )
   (:action s1262_plan-base-motion
          :parameters (#q31 #q5)
          :precondition (and (isbconf #q31) (isbconf #q5))
          :effect (basemotion #q31 #t1226 #q5)
   )
   (:action s1263_plan-base-motion
          :parameters (#q31 #q6)
          :precondition (and (isbconf #q31) (isbconf #q6))
          :effect (basemotion #q31 #t1227 #q6)
   )
   (:action s1264_plan-base-motion
          :parameters (#q31 #q7)
          :precondition (and (isbconf #q31) (isbconf #q7))
          :effect (basemotion #q31 #t1228 #q7)
   )
   (:action s1265_plan-base-motion
          :parameters (#q31 #q8)
          :precondition (and (isbconf #q31) (isbconf #q8))
          :effect (basemotion #q31 #t1229 #q8)
   )
   (:action s1266_plan-base-motion
          :parameters (#q31 #q9)
          :precondition (and (isbconf #q31) (isbconf #q9))
          :effect (basemotion #q31 #t1230 #q9)
   )
   (:action s1267_plan-base-motion
          :parameters (#q31 #q10)
          :precondition (and (isbconf #q31) (isbconf #q10))
          :effect (basemotion #q31 #t1231 #q10)
   )
   (:action s1268_plan-base-motion
          :parameters (#q31 #q11)
          :precondition (and (isbconf #q31) (isbconf #q11))
          :effect (basemotion #q31 #t1232 #q11)
   )
   (:action s1269_plan-base-motion
          :parameters (#q31 #q12)
          :precondition (and (isbconf #q31) (isbconf #q12))
          :effect (basemotion #q31 #t1233 #q12)
   )
   (:action s1270_plan-base-motion
          :parameters (#q31 #q13)
          :precondition (and (isbconf #q31) (isbconf #q13))
          :effect (basemotion #q31 #t1234 #q13)
   )
   (:action s1271_plan-base-motion
          :parameters (#q31 #q14)
          :precondition (and (isbconf #q31) (isbconf #q14))
          :effect (basemotion #q31 #t1235 #q14)
   )
   (:action s1272_plan-base-motion
          :parameters (#q31 #q15)
          :precondition (and (isbconf #q31) (isbconf #q15))
          :effect (basemotion #q31 #t1236 #q15)
   )
   (:action s1273_plan-base-motion
          :parameters (#q31 #q16)
          :precondition (and (isbconf #q31) (isbconf #q16))
          :effect (basemotion #q31 #t1237 #q16)
   )
   (:action s1274_plan-base-motion
          :parameters (#q31 #q17)
          :precondition (and (isbconf #q31) (isbconf #q17))
          :effect (basemotion #q31 #t1238 #q17)
   )
   (:action s1275_plan-base-motion
          :parameters (#q31 #q18)
          :precondition (and (isbconf #q31) (isbconf #q18))
          :effect (basemotion #q31 #t1239 #q18)
   )
   (:action s1276_plan-base-motion
          :parameters (#q31 #q19)
          :precondition (and (isbconf #q31) (isbconf #q19))
          :effect (basemotion #q31 #t1240 #q19)
   )
   (:action s1277_plan-base-motion
          :parameters (#q31 #q20)
          :precondition (and (isbconf #q31) (isbconf #q20))
          :effect (basemotion #q31 #t1241 #q20)
   )
   (:action s1278_plan-base-motion
          :parameters (#q31 #q21)
          :precondition (and (isbconf #q31) (isbconf #q21))
          :effect (basemotion #q31 #t1242 #q21)
   )
   (:action s1279_plan-base-motion
          :parameters (#q31 #q22)
          :precondition (and (isbconf #q31) (isbconf #q22))
          :effect (basemotion #q31 #t1243 #q22)
   )
   (:action s1280_plan-base-motion
          :parameters (#q31 #q23)
          :precondition (and (isbconf #q31) (isbconf #q23))
          :effect (basemotion #q31 #t1244 #q23)
   )
   (:action s1281_plan-base-motion
          :parameters (#q31 #q24)
          :precondition (and (isbconf #q31) (isbconf #q24))
          :effect (basemotion #q31 #t1245 #q24)
   )
   (:action s1282_plan-base-motion
          :parameters (#q31 #q25)
          :precondition (and (isbconf #q31) (isbconf #q25))
          :effect (basemotion #q31 #t1246 #q25)
   )
   (:action s1283_plan-base-motion
          :parameters (#q31 #q26)
          :precondition (and (isbconf #q31) (isbconf #q26))
          :effect (basemotion #q31 #t1247 #q26)
   )
   (:action s1284_plan-base-motion
          :parameters (#q31 #q27)
          :precondition (and (isbconf #q31) (isbconf #q27))
          :effect (basemotion #q31 #t1248 #q27)
   )
   (:action s1285_plan-base-motion
          :parameters (#q31 #q28)
          :precondition (and (isbconf #q31) (isbconf #q28))
          :effect (basemotion #q31 #t1249 #q28)
   )
   (:action s1286_plan-base-motion
          :parameters (#q31 #q29)
          :precondition (and (isbconf #q31) (isbconf #q29))
          :effect (basemotion #q31 #t1250 #q29)
   )
   (:action s1287_plan-base-motion
          :parameters (#q31 #q30)
          :precondition (and (isbconf #q31) (isbconf #q30))
          :effect (basemotion #q31 #t1251 #q30)
   )
   (:action s1288_plan-base-motion
          :parameters (#q31 #q31)
          :precondition (and (isbconf #q31) (isbconf #q31))
          :effect (basemotion #q31 #t1252 #q31)
   )
   (:action s1289_plan-base-motion
          :parameters (#q31 #q32)
          :precondition (and (isbconf #q31) (isbconf #q32))
          :effect (basemotion #q31 #t1253 #q32)
   )
   (:action s1290_plan-base-motion
          :parameters (#q31 #q33)
          :precondition (and (isbconf #q31) (isbconf #q33))
          :effect (basemotion #q31 #t1254 #q33)
   )
   (:action s1291_plan-base-motion
          :parameters (#q31 #q34)
          :precondition (and (isbconf #q31) (isbconf #q34))
          :effect (basemotion #q31 #t1255 #q34)
   )
   (:action s1292_plan-base-motion
          :parameters (#q31 #q35)
          :precondition (and (isbconf #q31) (isbconf #q35))
          :effect (basemotion #q31 #t1256 #q35)
   )
   (:action s1293_plan-base-motion
          :parameters (#q32 q976)
          :precondition (and (isbconf #q32) (isbconf q976))
          :effect (basemotion #q32 #t1257 q976)
   )
   (:action s1294_plan-base-motion
          :parameters (#q32 #q0)
          :precondition (and (isbconf #q32) (isbconf #q0))
          :effect (basemotion #q32 #t1258 #q0)
   )
   (:action s1295_plan-base-motion
          :parameters (#q32 #q1)
          :precondition (and (isbconf #q32) (isbconf #q1))
          :effect (basemotion #q32 #t1259 #q1)
   )
   (:action s1296_plan-base-motion
          :parameters (#q32 #q2)
          :precondition (and (isbconf #q32) (isbconf #q2))
          :effect (basemotion #q32 #t1260 #q2)
   )
   (:action s1297_plan-base-motion
          :parameters (#q32 #q3)
          :precondition (and (isbconf #q32) (isbconf #q3))
          :effect (basemotion #q32 #t1261 #q3)
   )
   (:action s1298_plan-base-motion
          :parameters (#q32 #q4)
          :precondition (and (isbconf #q32) (isbconf #q4))
          :effect (basemotion #q32 #t1262 #q4)
   )
   (:action s1299_plan-base-motion
          :parameters (#q32 #q5)
          :precondition (and (isbconf #q32) (isbconf #q5))
          :effect (basemotion #q32 #t1263 #q5)
   )
   (:action s1300_plan-base-motion
          :parameters (#q32 #q6)
          :precondition (and (isbconf #q32) (isbconf #q6))
          :effect (basemotion #q32 #t1264 #q6)
   )
   (:action s1301_plan-base-motion
          :parameters (#q32 #q7)
          :precondition (and (isbconf #q32) (isbconf #q7))
          :effect (basemotion #q32 #t1265 #q7)
   )
   (:action s1302_plan-base-motion
          :parameters (#q32 #q8)
          :precondition (and (isbconf #q32) (isbconf #q8))
          :effect (basemotion #q32 #t1266 #q8)
   )
   (:action s1303_plan-base-motion
          :parameters (#q32 #q9)
          :precondition (and (isbconf #q32) (isbconf #q9))
          :effect (basemotion #q32 #t1267 #q9)
   )
   (:action s1304_plan-base-motion
          :parameters (#q32 #q10)
          :precondition (and (isbconf #q32) (isbconf #q10))
          :effect (basemotion #q32 #t1268 #q10)
   )
   (:action s1305_plan-base-motion
          :parameters (#q32 #q11)
          :precondition (and (isbconf #q32) (isbconf #q11))
          :effect (basemotion #q32 #t1269 #q11)
   )
   (:action s1306_plan-base-motion
          :parameters (#q32 #q12)
          :precondition (and (isbconf #q32) (isbconf #q12))
          :effect (basemotion #q32 #t1270 #q12)
   )
   (:action s1307_plan-base-motion
          :parameters (#q32 #q13)
          :precondition (and (isbconf #q32) (isbconf #q13))
          :effect (basemotion #q32 #t1271 #q13)
   )
   (:action s1308_plan-base-motion
          :parameters (#q32 #q14)
          :precondition (and (isbconf #q32) (isbconf #q14))
          :effect (basemotion #q32 #t1272 #q14)
   )
   (:action s1309_plan-base-motion
          :parameters (#q32 #q15)
          :precondition (and (isbconf #q32) (isbconf #q15))
          :effect (basemotion #q32 #t1273 #q15)
   )
   (:action s1310_plan-base-motion
          :parameters (#q32 #q16)
          :precondition (and (isbconf #q32) (isbconf #q16))
          :effect (basemotion #q32 #t1274 #q16)
   )
   (:action s1311_plan-base-motion
          :parameters (#q32 #q17)
          :precondition (and (isbconf #q32) (isbconf #q17))
          :effect (basemotion #q32 #t1275 #q17)
   )
   (:action s1312_plan-base-motion
          :parameters (#q32 #q18)
          :precondition (and (isbconf #q32) (isbconf #q18))
          :effect (basemotion #q32 #t1276 #q18)
   )
   (:action s1313_plan-base-motion
          :parameters (#q32 #q19)
          :precondition (and (isbconf #q32) (isbconf #q19))
          :effect (basemotion #q32 #t1277 #q19)
   )
   (:action s1314_plan-base-motion
          :parameters (#q32 #q20)
          :precondition (and (isbconf #q32) (isbconf #q20))
          :effect (basemotion #q32 #t1278 #q20)
   )
   (:action s1315_plan-base-motion
          :parameters (#q32 #q21)
          :precondition (and (isbconf #q32) (isbconf #q21))
          :effect (basemotion #q32 #t1279 #q21)
   )
   (:action s1316_plan-base-motion
          :parameters (#q32 #q22)
          :precondition (and (isbconf #q32) (isbconf #q22))
          :effect (basemotion #q32 #t1280 #q22)
   )
   (:action s1317_plan-base-motion
          :parameters (#q32 #q23)
          :precondition (and (isbconf #q32) (isbconf #q23))
          :effect (basemotion #q32 #t1281 #q23)
   )
   (:action s1318_plan-base-motion
          :parameters (#q32 #q24)
          :precondition (and (isbconf #q32) (isbconf #q24))
          :effect (basemotion #q32 #t1282 #q24)
   )
   (:action s1319_plan-base-motion
          :parameters (#q32 #q25)
          :precondition (and (isbconf #q32) (isbconf #q25))
          :effect (basemotion #q32 #t1283 #q25)
   )
   (:action s1320_plan-base-motion
          :parameters (#q32 #q26)
          :precondition (and (isbconf #q32) (isbconf #q26))
          :effect (basemotion #q32 #t1284 #q26)
   )
   (:action s1321_plan-base-motion
          :parameters (#q32 #q27)
          :precondition (and (isbconf #q32) (isbconf #q27))
          :effect (basemotion #q32 #t1285 #q27)
   )
   (:action s1322_plan-base-motion
          :parameters (#q32 #q28)
          :precondition (and (isbconf #q32) (isbconf #q28))
          :effect (basemotion #q32 #t1286 #q28)
   )
   (:action s1323_plan-base-motion
          :parameters (#q32 #q29)
          :precondition (and (isbconf #q32) (isbconf #q29))
          :effect (basemotion #q32 #t1287 #q29)
   )
   (:action s1324_plan-base-motion
          :parameters (#q32 #q30)
          :precondition (and (isbconf #q32) (isbconf #q30))
          :effect (basemotion #q32 #t1288 #q30)
   )
   (:action s1325_plan-base-motion
          :parameters (#q32 #q31)
          :precondition (and (isbconf #q32) (isbconf #q31))
          :effect (basemotion #q32 #t1289 #q31)
   )
   (:action s1326_plan-base-motion
          :parameters (#q32 #q32)
          :precondition (and (isbconf #q32) (isbconf #q32))
          :effect (basemotion #q32 #t1290 #q32)
   )
   (:action s1327_plan-base-motion
          :parameters (#q32 #q33)
          :precondition (and (isbconf #q32) (isbconf #q33))
          :effect (basemotion #q32 #t1291 #q33)
   )
   (:action s1328_plan-base-motion
          :parameters (#q32 #q34)
          :precondition (and (isbconf #q32) (isbconf #q34))
          :effect (basemotion #q32 #t1292 #q34)
   )
   (:action s1329_plan-base-motion
          :parameters (#q32 #q35)
          :precondition (and (isbconf #q32) (isbconf #q35))
          :effect (basemotion #q32 #t1293 #q35)
   )
   (:action s1330_plan-base-motion
          :parameters (#q33 q976)
          :precondition (and (isbconf #q33) (isbconf q976))
          :effect (basemotion #q33 #t1294 q976)
   )
   (:action s1331_plan-base-motion
          :parameters (#q33 #q0)
          :precondition (and (isbconf #q33) (isbconf #q0))
          :effect (basemotion #q33 #t1295 #q0)
   )
   (:action s1332_plan-base-motion
          :parameters (#q33 #q1)
          :precondition (and (isbconf #q33) (isbconf #q1))
          :effect (basemotion #q33 #t1296 #q1)
   )
   (:action s1333_plan-base-motion
          :parameters (#q33 #q2)
          :precondition (and (isbconf #q33) (isbconf #q2))
          :effect (basemotion #q33 #t1297 #q2)
   )
   (:action s1334_plan-base-motion
          :parameters (#q33 #q3)
          :precondition (and (isbconf #q33) (isbconf #q3))
          :effect (basemotion #q33 #t1298 #q3)
   )
   (:action s1335_plan-base-motion
          :parameters (#q33 #q4)
          :precondition (and (isbconf #q33) (isbconf #q4))
          :effect (basemotion #q33 #t1299 #q4)
   )
   (:action s1336_plan-base-motion
          :parameters (#q33 #q5)
          :precondition (and (isbconf #q33) (isbconf #q5))
          :effect (basemotion #q33 #t1300 #q5)
   )
   (:action s1337_plan-base-motion
          :parameters (#q33 #q6)
          :precondition (and (isbconf #q33) (isbconf #q6))
          :effect (basemotion #q33 #t1301 #q6)
   )
   (:action s1338_plan-base-motion
          :parameters (#q33 #q7)
          :precondition (and (isbconf #q33) (isbconf #q7))
          :effect (basemotion #q33 #t1302 #q7)
   )
   (:action s1339_plan-base-motion
          :parameters (#q33 #q8)
          :precondition (and (isbconf #q33) (isbconf #q8))
          :effect (basemotion #q33 #t1303 #q8)
   )
   (:action s1340_plan-base-motion
          :parameters (#q33 #q9)
          :precondition (and (isbconf #q33) (isbconf #q9))
          :effect (basemotion #q33 #t1304 #q9)
   )
   (:action s1341_plan-base-motion
          :parameters (#q33 #q10)
          :precondition (and (isbconf #q33) (isbconf #q10))
          :effect (basemotion #q33 #t1305 #q10)
   )
   (:action s1342_plan-base-motion
          :parameters (#q33 #q11)
          :precondition (and (isbconf #q33) (isbconf #q11))
          :effect (basemotion #q33 #t1306 #q11)
   )
   (:action s1343_plan-base-motion
          :parameters (#q33 #q12)
          :precondition (and (isbconf #q33) (isbconf #q12))
          :effect (basemotion #q33 #t1307 #q12)
   )
   (:action s1344_plan-base-motion
          :parameters (#q33 #q13)
          :precondition (and (isbconf #q33) (isbconf #q13))
          :effect (basemotion #q33 #t1308 #q13)
   )
   (:action s1345_plan-base-motion
          :parameters (#q33 #q14)
          :precondition (and (isbconf #q33) (isbconf #q14))
          :effect (basemotion #q33 #t1309 #q14)
   )
   (:action s1346_plan-base-motion
          :parameters (#q33 #q15)
          :precondition (and (isbconf #q33) (isbconf #q15))
          :effect (basemotion #q33 #t1310 #q15)
   )
   (:action s1347_plan-base-motion
          :parameters (#q33 #q16)
          :precondition (and (isbconf #q33) (isbconf #q16))
          :effect (basemotion #q33 #t1311 #q16)
   )
   (:action s1348_plan-base-motion
          :parameters (#q33 #q17)
          :precondition (and (isbconf #q33) (isbconf #q17))
          :effect (basemotion #q33 #t1312 #q17)
   )
   (:action s1349_plan-base-motion
          :parameters (#q33 #q18)
          :precondition (and (isbconf #q33) (isbconf #q18))
          :effect (basemotion #q33 #t1313 #q18)
   )
   (:action s1350_plan-base-motion
          :parameters (#q33 #q19)
          :precondition (and (isbconf #q33) (isbconf #q19))
          :effect (basemotion #q33 #t1314 #q19)
   )
   (:action s1351_plan-base-motion
          :parameters (#q33 #q20)
          :precondition (and (isbconf #q33) (isbconf #q20))
          :effect (basemotion #q33 #t1315 #q20)
   )
   (:action s1352_plan-base-motion
          :parameters (#q33 #q21)
          :precondition (and (isbconf #q33) (isbconf #q21))
          :effect (basemotion #q33 #t1316 #q21)
   )
   (:action s1353_plan-base-motion
          :parameters (#q33 #q22)
          :precondition (and (isbconf #q33) (isbconf #q22))
          :effect (basemotion #q33 #t1317 #q22)
   )
   (:action s1354_plan-base-motion
          :parameters (#q33 #q23)
          :precondition (and (isbconf #q33) (isbconf #q23))
          :effect (basemotion #q33 #t1318 #q23)
   )
   (:action s1355_plan-base-motion
          :parameters (#q33 #q24)
          :precondition (and (isbconf #q33) (isbconf #q24))
          :effect (basemotion #q33 #t1319 #q24)
   )
   (:action s1356_plan-base-motion
          :parameters (#q33 #q25)
          :precondition (and (isbconf #q33) (isbconf #q25))
          :effect (basemotion #q33 #t1320 #q25)
   )
   (:action s1357_plan-base-motion
          :parameters (#q33 #q26)
          :precondition (and (isbconf #q33) (isbconf #q26))
          :effect (basemotion #q33 #t1321 #q26)
   )
   (:action s1358_plan-base-motion
          :parameters (#q33 #q27)
          :precondition (and (isbconf #q33) (isbconf #q27))
          :effect (basemotion #q33 #t1322 #q27)
   )
   (:action s1359_plan-base-motion
          :parameters (#q33 #q28)
          :precondition (and (isbconf #q33) (isbconf #q28))
          :effect (basemotion #q33 #t1323 #q28)
   )
   (:action s1360_plan-base-motion
          :parameters (#q33 #q29)
          :precondition (and (isbconf #q33) (isbconf #q29))
          :effect (basemotion #q33 #t1324 #q29)
   )
   (:action s1361_plan-base-motion
          :parameters (#q33 #q30)
          :precondition (and (isbconf #q33) (isbconf #q30))
          :effect (basemotion #q33 #t1325 #q30)
   )
   (:action s1362_plan-base-motion
          :parameters (#q33 #q31)
          :precondition (and (isbconf #q33) (isbconf #q31))
          :effect (basemotion #q33 #t1326 #q31)
   )
   (:action s1363_plan-base-motion
          :parameters (#q33 #q32)
          :precondition (and (isbconf #q33) (isbconf #q32))
          :effect (basemotion #q33 #t1327 #q32)
   )
   (:action s1364_plan-base-motion
          :parameters (#q33 #q33)
          :precondition (and (isbconf #q33) (isbconf #q33))
          :effect (basemotion #q33 #t1328 #q33)
   )
   (:action s1365_plan-base-motion
          :parameters (#q33 #q34)
          :precondition (and (isbconf #q33) (isbconf #q34))
          :effect (basemotion #q33 #t1329 #q34)
   )
   (:action s1366_plan-base-motion
          :parameters (#q33 #q35)
          :precondition (and (isbconf #q33) (isbconf #q35))
          :effect (basemotion #q33 #t1330 #q35)
   )
   (:action s1367_plan-base-motion
          :parameters (#q34 q976)
          :precondition (and (isbconf #q34) (isbconf q976))
          :effect (basemotion #q34 #t1331 q976)
   )
   (:action s1368_plan-base-motion
          :parameters (#q34 #q0)
          :precondition (and (isbconf #q34) (isbconf #q0))
          :effect (basemotion #q34 #t1332 #q0)
   )
   (:action s1369_plan-base-motion
          :parameters (#q34 #q1)
          :precondition (and (isbconf #q34) (isbconf #q1))
          :effect (basemotion #q34 #t1333 #q1)
   )
   (:action s1370_plan-base-motion
          :parameters (#q34 #q2)
          :precondition (and (isbconf #q34) (isbconf #q2))
          :effect (basemotion #q34 #t1334 #q2)
   )
   (:action s1371_plan-base-motion
          :parameters (#q34 #q3)
          :precondition (and (isbconf #q34) (isbconf #q3))
          :effect (basemotion #q34 #t1335 #q3)
   )
   (:action s1372_plan-base-motion
          :parameters (#q34 #q4)
          :precondition (and (isbconf #q34) (isbconf #q4))
          :effect (basemotion #q34 #t1336 #q4)
   )
   (:action s1373_plan-base-motion
          :parameters (#q34 #q5)
          :precondition (and (isbconf #q34) (isbconf #q5))
          :effect (basemotion #q34 #t1337 #q5)
   )
   (:action s1374_plan-base-motion
          :parameters (#q34 #q6)
          :precondition (and (isbconf #q34) (isbconf #q6))
          :effect (basemotion #q34 #t1338 #q6)
   )
   (:action s1375_plan-base-motion
          :parameters (#q34 #q7)
          :precondition (and (isbconf #q34) (isbconf #q7))
          :effect (basemotion #q34 #t1339 #q7)
   )
   (:action s1376_plan-base-motion
          :parameters (#q34 #q8)
          :precondition (and (isbconf #q34) (isbconf #q8))
          :effect (basemotion #q34 #t1340 #q8)
   )
   (:action s1377_plan-base-motion
          :parameters (#q34 #q9)
          :precondition (and (isbconf #q34) (isbconf #q9))
          :effect (basemotion #q34 #t1341 #q9)
   )
   (:action s1378_plan-base-motion
          :parameters (#q34 #q10)
          :precondition (and (isbconf #q34) (isbconf #q10))
          :effect (basemotion #q34 #t1342 #q10)
   )
   (:action s1379_plan-base-motion
          :parameters (#q34 #q11)
          :precondition (and (isbconf #q34) (isbconf #q11))
          :effect (basemotion #q34 #t1343 #q11)
   )
   (:action s1380_plan-base-motion
          :parameters (#q34 #q12)
          :precondition (and (isbconf #q34) (isbconf #q12))
          :effect (basemotion #q34 #t1344 #q12)
   )
   (:action s1381_plan-base-motion
          :parameters (#q34 #q13)
          :precondition (and (isbconf #q34) (isbconf #q13))
          :effect (basemotion #q34 #t1345 #q13)
   )
   (:action s1382_plan-base-motion
          :parameters (#q34 #q14)
          :precondition (and (isbconf #q34) (isbconf #q14))
          :effect (basemotion #q34 #t1346 #q14)
   )
   (:action s1383_plan-base-motion
          :parameters (#q34 #q15)
          :precondition (and (isbconf #q34) (isbconf #q15))
          :effect (basemotion #q34 #t1347 #q15)
   )
   (:action s1384_plan-base-motion
          :parameters (#q34 #q16)
          :precondition (and (isbconf #q34) (isbconf #q16))
          :effect (basemotion #q34 #t1348 #q16)
   )
   (:action s1385_plan-base-motion
          :parameters (#q34 #q17)
          :precondition (and (isbconf #q34) (isbconf #q17))
          :effect (basemotion #q34 #t1349 #q17)
   )
   (:action s1386_plan-base-motion
          :parameters (#q34 #q18)
          :precondition (and (isbconf #q34) (isbconf #q18))
          :effect (basemotion #q34 #t1350 #q18)
   )
   (:action s1387_plan-base-motion
          :parameters (#q34 #q19)
          :precondition (and (isbconf #q34) (isbconf #q19))
          :effect (basemotion #q34 #t1351 #q19)
   )
   (:action s1388_plan-base-motion
          :parameters (#q34 #q20)
          :precondition (and (isbconf #q34) (isbconf #q20))
          :effect (basemotion #q34 #t1352 #q20)
   )
   (:action s1389_plan-base-motion
          :parameters (#q34 #q21)
          :precondition (and (isbconf #q34) (isbconf #q21))
          :effect (basemotion #q34 #t1353 #q21)
   )
   (:action s1390_plan-base-motion
          :parameters (#q34 #q22)
          :precondition (and (isbconf #q34) (isbconf #q22))
          :effect (basemotion #q34 #t1354 #q22)
   )
   (:action s1391_plan-base-motion
          :parameters (#q34 #q23)
          :precondition (and (isbconf #q34) (isbconf #q23))
          :effect (basemotion #q34 #t1355 #q23)
   )
   (:action s1392_plan-base-motion
          :parameters (#q34 #q24)
          :precondition (and (isbconf #q34) (isbconf #q24))
          :effect (basemotion #q34 #t1356 #q24)
   )
   (:action s1393_plan-base-motion
          :parameters (#q34 #q25)
          :precondition (and (isbconf #q34) (isbconf #q25))
          :effect (basemotion #q34 #t1357 #q25)
   )
   (:action s1394_plan-base-motion
          :parameters (#q34 #q26)
          :precondition (and (isbconf #q34) (isbconf #q26))
          :effect (basemotion #q34 #t1358 #q26)
   )
   (:action s1395_plan-base-motion
          :parameters (#q34 #q27)
          :precondition (and (isbconf #q34) (isbconf #q27))
          :effect (basemotion #q34 #t1359 #q27)
   )
   (:action s1396_plan-base-motion
          :parameters (#q34 #q28)
          :precondition (and (isbconf #q34) (isbconf #q28))
          :effect (basemotion #q34 #t1360 #q28)
   )
   (:action s1397_plan-base-motion
          :parameters (#q34 #q29)
          :precondition (and (isbconf #q34) (isbconf #q29))
          :effect (basemotion #q34 #t1361 #q29)
   )
   (:action s1398_plan-base-motion
          :parameters (#q34 #q30)
          :precondition (and (isbconf #q34) (isbconf #q30))
          :effect (basemotion #q34 #t1362 #q30)
   )
   (:action s1399_plan-base-motion
          :parameters (#q34 #q31)
          :precondition (and (isbconf #q34) (isbconf #q31))
          :effect (basemotion #q34 #t1363 #q31)
   )
   (:action s1400_plan-base-motion
          :parameters (#q34 #q32)
          :precondition (and (isbconf #q34) (isbconf #q32))
          :effect (basemotion #q34 #t1364 #q32)
   )
   (:action s1401_plan-base-motion
          :parameters (#q34 #q33)
          :precondition (and (isbconf #q34) (isbconf #q33))
          :effect (basemotion #q34 #t1365 #q33)
   )
   (:action s1402_plan-base-motion
          :parameters (#q34 #q34)
          :precondition (and (isbconf #q34) (isbconf #q34))
          :effect (basemotion #q34 #t1366 #q34)
   )
   (:action s1403_plan-base-motion
          :parameters (#q34 #q35)
          :precondition (and (isbconf #q34) (isbconf #q35))
          :effect (basemotion #q34 #t1367 #q35)
   )
   (:action s1404_plan-base-motion
          :parameters (#q35 q976)
          :precondition (and (isbconf #q35) (isbconf q976))
          :effect (basemotion #q35 #t1368 q976)
   )
   (:action s1405_plan-base-motion
          :parameters (#q35 #q0)
          :precondition (and (isbconf #q35) (isbconf #q0))
          :effect (basemotion #q35 #t1369 #q0)
   )
   (:action s1406_plan-base-motion
          :parameters (#q35 #q1)
          :precondition (and (isbconf #q35) (isbconf #q1))
          :effect (basemotion #q35 #t1370 #q1)
   )
   (:action s1407_plan-base-motion
          :parameters (#q35 #q2)
          :precondition (and (isbconf #q35) (isbconf #q2))
          :effect (basemotion #q35 #t1371 #q2)
   )
   (:action s1408_plan-base-motion
          :parameters (#q35 #q3)
          :precondition (and (isbconf #q35) (isbconf #q3))
          :effect (basemotion #q35 #t1372 #q3)
   )
   (:action s1409_plan-base-motion
          :parameters (#q35 #q4)
          :precondition (and (isbconf #q35) (isbconf #q4))
          :effect (basemotion #q35 #t1373 #q4)
   )
   (:action s1410_plan-base-motion
          :parameters (#q35 #q5)
          :precondition (and (isbconf #q35) (isbconf #q5))
          :effect (basemotion #q35 #t1374 #q5)
   )
   (:action s1411_plan-base-motion
          :parameters (#q35 #q6)
          :precondition (and (isbconf #q35) (isbconf #q6))
          :effect (basemotion #q35 #t1375 #q6)
   )
   (:action s1412_plan-base-motion
          :parameters (#q35 #q7)
          :precondition (and (isbconf #q35) (isbconf #q7))
          :effect (basemotion #q35 #t1376 #q7)
   )
   (:action s1413_plan-base-motion
          :parameters (#q35 #q8)
          :precondition (and (isbconf #q35) (isbconf #q8))
          :effect (basemotion #q35 #t1377 #q8)
   )
   (:action s1414_plan-base-motion
          :parameters (#q35 #q9)
          :precondition (and (isbconf #q35) (isbconf #q9))
          :effect (basemotion #q35 #t1378 #q9)
   )
   (:action s1415_plan-base-motion
          :parameters (#q35 #q10)
          :precondition (and (isbconf #q35) (isbconf #q10))
          :effect (basemotion #q35 #t1379 #q10)
   )
   (:action s1416_plan-base-motion
          :parameters (#q35 #q11)
          :precondition (and (isbconf #q35) (isbconf #q11))
          :effect (basemotion #q35 #t1380 #q11)
   )
   (:action s1417_plan-base-motion
          :parameters (#q35 #q12)
          :precondition (and (isbconf #q35) (isbconf #q12))
          :effect (basemotion #q35 #t1381 #q12)
   )
   (:action s1418_plan-base-motion
          :parameters (#q35 #q13)
          :precondition (and (isbconf #q35) (isbconf #q13))
          :effect (basemotion #q35 #t1382 #q13)
   )
   (:action s1419_plan-base-motion
          :parameters (#q35 #q14)
          :precondition (and (isbconf #q35) (isbconf #q14))
          :effect (basemotion #q35 #t1383 #q14)
   )
   (:action s1420_plan-base-motion
          :parameters (#q35 #q15)
          :precondition (and (isbconf #q35) (isbconf #q15))
          :effect (basemotion #q35 #t1384 #q15)
   )
   (:action s1421_plan-base-motion
          :parameters (#q35 #q16)
          :precondition (and (isbconf #q35) (isbconf #q16))
          :effect (basemotion #q35 #t1385 #q16)
   )
   (:action s1422_plan-base-motion
          :parameters (#q35 #q17)
          :precondition (and (isbconf #q35) (isbconf #q17))
          :effect (basemotion #q35 #t1386 #q17)
   )
   (:action s1423_plan-base-motion
          :parameters (#q35 #q18)
          :precondition (and (isbconf #q35) (isbconf #q18))
          :effect (basemotion #q35 #t1387 #q18)
   )
   (:action s1424_plan-base-motion
          :parameters (#q35 #q19)
          :precondition (and (isbconf #q35) (isbconf #q19))
          :effect (basemotion #q35 #t1388 #q19)
   )
   (:action s1425_plan-base-motion
          :parameters (#q35 #q20)
          :precondition (and (isbconf #q35) (isbconf #q20))
          :effect (basemotion #q35 #t1389 #q20)
   )
   (:action s1426_plan-base-motion
          :parameters (#q35 #q21)
          :precondition (and (isbconf #q35) (isbconf #q21))
          :effect (basemotion #q35 #t1390 #q21)
   )
   (:action s1427_plan-base-motion
          :parameters (#q35 #q22)
          :precondition (and (isbconf #q35) (isbconf #q22))
          :effect (basemotion #q35 #t1391 #q22)
   )
   (:action s1428_plan-base-motion
          :parameters (#q35 #q23)
          :precondition (and (isbconf #q35) (isbconf #q23))
          :effect (basemotion #q35 #t1392 #q23)
   )
   (:action s1429_plan-base-motion
          :parameters (#q35 #q24)
          :precondition (and (isbconf #q35) (isbconf #q24))
          :effect (basemotion #q35 #t1393 #q24)
   )
   (:action s1430_plan-base-motion
          :parameters (#q35 #q25)
          :precondition (and (isbconf #q35) (isbconf #q25))
          :effect (basemotion #q35 #t1394 #q25)
   )
   (:action s1431_plan-base-motion
          :parameters (#q35 #q26)
          :precondition (and (isbconf #q35) (isbconf #q26))
          :effect (basemotion #q35 #t1395 #q26)
   )
   (:action s1432_plan-base-motion
          :parameters (#q35 #q27)
          :precondition (and (isbconf #q35) (isbconf #q27))
          :effect (basemotion #q35 #t1396 #q27)
   )
   (:action s1433_plan-base-motion
          :parameters (#q35 #q28)
          :precondition (and (isbconf #q35) (isbconf #q28))
          :effect (basemotion #q35 #t1397 #q28)
   )
   (:action s1434_plan-base-motion
          :parameters (#q35 #q29)
          :precondition (and (isbconf #q35) (isbconf #q29))
          :effect (basemotion #q35 #t1398 #q29)
   )
   (:action s1435_plan-base-motion
          :parameters (#q35 #q30)
          :precondition (and (isbconf #q35) (isbconf #q30))
          :effect (basemotion #q35 #t1399 #q30)
   )
   (:action s1436_plan-base-motion
          :parameters (#q35 #q31)
          :precondition (and (isbconf #q35) (isbconf #q31))
          :effect (basemotion #q35 #t1400 #q31)
   )
   (:action s1437_plan-base-motion
          :parameters (#q35 #q32)
          :precondition (and (isbconf #q35) (isbconf #q32))
          :effect (basemotion #q35 #t1401 #q32)
   )
   (:action s1438_plan-base-motion
          :parameters (#q35 #q33)
          :precondition (and (isbconf #q35) (isbconf #q33))
          :effect (basemotion #q35 #t1402 #q33)
   )
   (:action s1439_plan-base-motion
          :parameters (#q35 #q34)
          :precondition (and (isbconf #q35) (isbconf #q34))
          :effect (basemotion #q35 #t1403 #q34)
   )
   (:action s1440_plan-base-motion
          :parameters (#q35 #q35)
          :precondition (and (isbconf #q35) (isbconf #q35))
          :effect (basemotion #q35 #t1404 #q35)
   )
)
