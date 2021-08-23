;17:12:10 23/08

;Skeleton_SN = 0

(define (domain pick-and-place_propo)
   (:requirements :strips :equality :action-costs)

   (:types
          wuti grasp_dir grasp config pose trajectory propo_action
   )

   (:constants
          #p0 #p1 #p2 - pose
          #d0 #d1 #d2 #d3 - grasp_dir
          #t0 #t1 #t10 #t100 #t1000 #t1001 #t1002 #t1003 #t1004 #t1005 #t1006 #t1007 #t1008 #t1009 #t101 #t1010 #t1011 #t1012 #t1013 #t1014 #t1015 #t1016 #t1017 #t1018 #t1019 #t102 #t1020 #t1021 #t1022 #t1023 #t1024 #t1025 #t1026 #t1027 #t1028 #t1029 #t103 #t1030 #t1031 #t1032 #t1033 #t1034 #t1035 #t1036 #t1037 #t1038 #t1039 #t104 #t1040 #t1041 #t1042 #t1043 #t1044 #t1045 #t1046 #t1047 #t1048 #t1049 #t105 #t1050 #t1051 #t1052 #t1053 #t1054 #t1055 #t1056 #t1057 #t1058 #t1059 #t106 #t1060 #t1061 #t1062 #t1063 #t1064 #t1065 #t1066 #t1067 #t1068 #t1069 #t107 #t1070 #t1071 #t1072 #t1073 #t1074 #t1075 #t1076 #t1077 #t1078 #t1079 #t108 #t1080 #t1081 #t1082 #t1083 #t1084 #t1085 #t1086 #t1087 #t1088 #t1089 #t109 #t1090 #t1091 #t1092 #t1093 #t1094 #t1095 #t1096 #t1097 #t1098 #t1099 #t11 #t110 #t1100 #t1101 #t1102 #t1103 #t1104 #t1105 #t1106 #t1107 #t1108 #t1109 #t111 #t1110 #t1111 #t1112 #t1113 #t1114 #t1115 #t1116 #t1117 #t1118 #t1119 #t112 #t1120 #t1121 #t1122 #t1123 #t1124 #t1125 #t1126 #t1127 #t1128 #t1129 #t113 #t1130 #t1131 #t1132 #t1133 #t1134 #t1135 #t1136 #t1137 #t1138 #t1139 #t114 #t1140 #t1141 #t1142 #t1143 #t1144 #t1145 #t1146 #t1147 #t1148 #t1149 #t115 #t1150 #t1151 #t1152 #t1153 #t1154 #t1155 #t1156 #t1157 #t1158 #t1159 #t116 #t1160 #t1161 #t1162 #t1163 #t1164 #t1165 #t1166 #t1167 #t1168 #t1169 #t117 #t1170 #t1171 #t1172 #t1173 #t1174 #t1175 #t1176 #t1177 #t1178 #t1179 #t118 #t1180 #t1181 #t1182 #t1183 #t1184 #t1185 #t1186 #t1187 #t1188 #t1189 #t119 #t1190 #t1191 #t1192 #t1193 #t1194 #t1195 #t1196 #t1197 #t1198 #t1199 #t12 #t120 #t1200 #t1201 #t1202 #t1203 #t1204 #t1205 #t1206 #t1207 #t1208 #t1209 #t121 #t1210 #t1211 #t1212 #t1213 #t1214 #t1215 #t1216 #t1217 #t1218 #t1219 #t122 #t1220 #t1221 #t1222 #t1223 #t1224 #t1225 #t1226 #t1227 #t1228 #t1229 #t123 #t1230 #t1231 #t1232 #t1233 #t1234 #t1235 #t1236 #t1237 #t1238 #t1239 #t124 #t1240 #t1241 #t1242 #t1243 #t1244 #t1245 #t1246 #t1247 #t1248 #t1249 #t125 #t1250 #t1251 #t1252 #t1253 #t1254 #t1255 #t1256 #t1257 #t1258 #t1259 #t126 #t1260 #t1261 #t1262 #t1263 #t1264 #t1265 #t1266 #t1267 #t1268 #t1269 #t127 #t1270 #t1271 #t1272 #t1273 #t1274 #t1275 #t1276 #t1277 #t1278 #t1279 #t128 #t1280 #t1281 #t1282 #t1283 #t1284 #t1285 #t1286 #t1287 #t1288 #t1289 #t129 #t1290 #t1291 #t1292 #t1293 #t1294 #t1295 #t1296 #t1297 #t1298 #t1299 #t13 #t130 #t1300 #t1301 #t1302 #t1303 #t1304 #t1305 #t1306 #t1307 #t1308 #t1309 #t131 #t1310 #t1311 #t1312 #t1313 #t1314 #t1315 #t1316 #t1317 #t1318 #t1319 #t132 #t1320 #t1321 #t1322 #t1323 #t1324 #t1325 #t1326 #t1327 #t1328 #t1329 #t133 #t1330 #t1331 #t1332 #t1333 #t1334 #t1335 #t1336 #t1337 #t1338 #t1339 #t134 #t1340 #t1341 #t1342 #t1343 #t1344 #t1345 #t1346 #t1347 #t1348 #t1349 #t135 #t1350 #t1351 #t1352 #t1353 #t1354 #t1355 #t1356 #t1357 #t1358 #t1359 #t136 #t1360 #t1361 #t1362 #t1363 #t1364 #t1365 #t1366 #t1367 #t1368 #t1369 #t137 #t1370 #t1371 #t1372 #t1373 #t1374 #t1375 #t1376 #t1377 #t1378 #t1379 #t138 #t1380 #t1381 #t1382 #t1383 #t1384 #t1385 #t1386 #t1387 #t1388 #t1389 #t139 #t1390 #t1391 #t1392 #t1393 #t1394 #t1395 #t1396 #t1397 #t1398 #t1399 #t14 #t140 #t1400 #t1401 #t1402 #t1403 #t1404 #t1405 #t1406 #t1407 #t1408 #t1409 #t141 #t1410 #t1411 #t1412 #t1413 #t1414 #t1415 #t1416 #t1417 #t1418 #t1419 #t142 #t1420 #t1421 #t1422 #t1423 #t1424 #t1425 #t1426 #t1427 #t1428 #t1429 #t143 #t1430 #t1431 #t1432 #t1433 #t1434 #t1435 #t1436 #t1437 #t1438 #t1439 #t144 #t1440 #t1441 #t1442 #t1443 #t1444 #t1445 #t1446 #t1447 #t1448 #t1449 #t145 #t1450 #t1451 #t1452 #t1453 #t1454 #t1455 #t1456 #t1457 #t1458 #t1459 #t146 #t1460 #t147 #t148 #t149 #t15 #t150 #t151 #t152 #t153 #t154 #t155 #t156 #t157 #t158 #t159 #t16 #t160 #t161 #t162 #t163 #t164 #t165 #t166 #t167 #t168 #t169 #t17 #t170 #t171 #t172 #t173 #t174 #t175 #t176 #t177 #t178 #t179 #t18 #t180 #t181 #t182 #t183 #t184 #t185 #t186 #t187 #t188 #t189 #t19 #t190 #t191 #t192 #t193 #t194 #t195 #t196 #t197 #t198 #t199 #t2 #t20 #t200 #t201 #t202 #t203 #t204 #t205 #t206 #t207 #t208 #t209 #t21 #t210 #t211 #t212 #t213 #t214 #t215 #t216 #t217 #t218 #t219 #t22 #t220 #t221 #t222 #t223 #t224 #t225 #t226 #t227 #t228 #t229 #t23 #t230 #t231 #t232 #t233 #t234 #t235 #t236 #t237 #t238 #t239 #t24 #t240 #t241 #t242 #t243 #t244 #t245 #t246 #t247 #t248 #t249 #t25 #t250 #t251 #t252 #t253 #t254 #t255 #t256 #t257 #t258 #t259 #t26 #t260 #t261 #t262 #t263 #t264 #t265 #t266 #t267 #t268 #t269 #t27 #t270 #t271 #t272 #t273 #t274 #t275 #t276 #t277 #t278 #t279 #t28 #t280 #t281 #t282 #t283 #t284 #t285 #t286 #t287 #t288 #t289 #t29 #t290 #t291 #t292 #t293 #t294 #t295 #t296 #t297 #t298 #t299 #t3 #t30 #t300 #t301 #t302 #t303 #t304 #t305 #t306 #t307 #t308 #t309 #t31 #t310 #t311 #t312 #t313 #t314 #t315 #t316 #t317 #t318 #t319 #t32 #t320 #t321 #t322 #t323 #t324 #t325 #t326 #t327 #t328 #t329 #t33 #t330 #t331 #t332 #t333 #t334 #t335 #t336 #t337 #t338 #t339 #t34 #t340 #t341 #t342 #t343 #t344 #t345 #t346 #t347 #t348 #t349 #t35 #t350 #t351 #t352 #t353 #t354 #t355 #t356 #t357 #t358 #t359 #t36 #t360 #t361 #t362 #t363 #t364 #t365 #t366 #t367 #t368 #t369 #t37 #t370 #t371 #t372 #t373 #t374 #t375 #t376 #t377 #t378 #t379 #t38 #t380 #t381 #t382 #t383 #t384 #t385 #t386 #t387 #t388 #t389 #t39 #t390 #t391 #t392 #t393 #t394 #t395 #t396 #t397 #t398 #t399 #t4 #t40 #t400 #t401 #t402 #t403 #t404 #t405 #t406 #t407 #t408 #t409 #t41 #t410 #t411 #t412 #t413 #t414 #t415 #t416 #t417 #t418 #t419 #t42 #t420 #t421 #t422 #t423 #t424 #t425 #t426 #t427 #t428 #t429 #t43 #t430 #t431 #t432 #t433 #t434 #t435 #t436 #t437 #t438 #t439 #t44 #t440 #t441 #t442 #t443 #t444 #t445 #t446 #t447 #t448 #t449 #t45 #t450 #t451 #t452 #t453 #t454 #t455 #t456 #t457 #t458 #t459 #t46 #t460 #t461 #t462 #t463 #t464 #t465 #t466 #t467 #t468 #t469 #t47 #t470 #t471 #t472 #t473 #t474 #t475 #t476 #t477 #t478 #t479 #t48 #t480 #t481 #t482 #t483 #t484 #t485 #t486 #t487 #t488 #t489 #t49 #t490 #t491 #t492 #t493 #t494 #t495 #t496 #t497 #t498 #t499 #t5 #t50 #t500 #t501 #t502 #t503 #t504 #t505 #t506 #t507 #t508 #t509 #t51 #t510 #t511 #t512 #t513 #t514 #t515 #t516 #t517 #t518 #t519 #t52 #t520 #t521 #t522 #t523 #t524 #t525 #t526 #t527 #t528 #t529 #t53 #t530 #t531 #t532 #t533 #t534 #t535 #t536 #t537 #t538 #t539 #t54 #t540 #t541 #t542 #t543 #t544 #t545 #t546 #t547 #t548 #t549 #t55 #t550 #t551 #t552 #t553 #t554 #t555 #t556 #t557 #t558 #t559 #t56 #t560 #t561 #t562 #t563 #t564 #t565 #t566 #t567 #t568 #t569 #t57 #t570 #t571 #t572 #t573 #t574 #t575 #t576 #t577 #t578 #t579 #t58 #t580 #t581 #t582 #t583 #t584 #t585 #t586 #t587 #t588 #t589 #t59 #t590 #t591 #t592 #t593 #t594 #t595 #t596 #t597 #t598 #t599 #t6 #t60 #t600 #t601 #t602 #t603 #t604 #t605 #t606 #t607 #t608 #t609 #t61 #t610 #t611 #t612 #t613 #t614 #t615 #t616 #t617 #t618 #t619 #t62 #t620 #t621 #t622 #t623 #t624 #t625 #t626 #t627 #t628 #t629 #t63 #t630 #t631 #t632 #t633 #t634 #t635 #t636 #t637 #t638 #t639 #t64 #t640 #t641 #t642 #t643 #t644 #t645 #t646 #t647 #t648 #t649 #t65 #t650 #t651 #t652 #t653 #t654 #t655 #t656 #t657 #t658 #t659 #t66 #t660 #t661 #t662 #t663 #t664 #t665 #t666 #t667 #t668 #t669 #t67 #t670 #t671 #t672 #t673 #t674 #t675 #t676 #t677 #t678 #t679 #t68 #t680 #t681 #t682 #t683 #t684 #t685 #t686 #t687 #t688 #t689 #t69 #t690 #t691 #t692 #t693 #t694 #t695 #t696 #t697 #t698 #t699 #t7 #t70 #t700 #t701 #t702 #t703 #t704 #t705 #t706 #t707 #t708 #t709 #t71 #t710 #t711 #t712 #t713 #t714 #t715 #t716 #t717 #t718 #t719 #t72 #t720 #t721 #t722 #t723 #t724 #t725 #t726 #t727 #t728 #t729 #t73 #t730 #t731 #t732 #t733 #t734 #t735 #t736 #t737 #t738 #t739 #t74 #t740 #t741 #t742 #t743 #t744 #t745 #t746 #t747 #t748 #t749 #t75 #t750 #t751 #t752 #t753 #t754 #t755 #t756 #t757 #t758 #t759 #t76 #t760 #t761 #t762 #t763 #t764 #t765 #t766 #t767 #t768 #t769 #t77 #t770 #t771 #t772 #t773 #t774 #t775 #t776 #t777 #t778 #t779 #t78 #t780 #t781 #t782 #t783 #t784 #t785 #t786 #t787 #t788 #t789 #t79 #t790 #t791 #t792 #t793 #t794 #t795 #t796 #t797 #t798 #t799 #t8 #t80 #t800 #t801 #t802 #t803 #t804 #t805 #t806 #t807 #t808 #t809 #t81 #t810 #t811 #t812 #t813 #t814 #t815 #t816 #t817 #t818 #t819 #t82 #t820 #t821 #t822 #t823 #t824 #t825 #t826 #t827 #t828 #t829 #t83 #t830 #t831 #t832 #t833 #t834 #t835 #t836 #t837 #t838 #t839 #t84 #t840 #t841 #t842 #t843 #t844 #t845 #t846 #t847 #t848 #t849 #t85 #t850 #t851 #t852 #t853 #t854 #t855 #t856 #t857 #t858 #t859 #t86 #t860 #t861 #t862 #t863 #t864 #t865 #t866 #t867 #t868 #t869 #t87 #t870 #t871 #t872 #t873 #t874 #t875 #t876 #t877 #t878 #t879 #t88 #t880 #t881 #t882 #t883 #t884 #t885 #t886 #t887 #t888 #t889 #t89 #t890 #t891 #t892 #t893 #t894 #t895 #t896 #t897 #t898 #t899 #t9 #t90 #t900 #t901 #t902 #t903 #t904 #t905 #t906 #t907 #t908 #t909 #t91 #t910 #t911 #t912 #t913 #t914 #t915 #t916 #t917 #t918 #t919 #t92 #t920 #t921 #t922 #t923 #t924 #t925 #t926 #t927 #t928 #t929 #t93 #t930 #t931 #t932 #t933 #t934 #t935 #t936 #t937 #t938 #t939 #t94 #t940 #t941 #t942 #t943 #t944 #t945 #t946 #t947 #t948 #t949 #t95 #t950 #t951 #t952 #t953 #t954 #t955 #t956 #t957 #t958 #t959 #t96 #t960 #t961 #t962 #t963 #t964 #t965 #t966 #t967 #t968 #t969 #t97 #t970 #t971 #t972 #t973 #t974 #t975 #t976 #t977 #t978 #t979 #t98 #t980 #t981 #t982 #t983 #t984 #t985 #t986 #t987 #t988 #t989 #t99 #t990 #t991 #t992 #t993 #t994 #t995 #t996 #t997 #t998 #t999 - trajectory
          #g0 #g1 #g2 #g3 - grasp
          #q0 #q1 #q10 #q11 #q12 #q13 #q14 #q15 #q2 #q3 #q4 #q5 #q6 #q7 #q8 #q9 - config
   )

   (:predicates
          (issink ?r - wuti)
          (isstove ?r - wuti)
          (fixed ?r - wuti)
          (graspable ?o - wuti)
          (isgraspdir ?o - wuti ?p - pose ?dg - grasp_dir)
          (isgrasp ?o - wuti ?g - grasp)
          (graspatpose ?g - grasp ?p - pose)
          (stackable ?o - wuti ?r - wuti)
          (ispose ?o - wuti ?p - pose)
          (isconf ?q - config)
          (istraj ?t - trajectory)
          (iskin ?o - wuti ?p - pose ?g - grasp ?q - config ?t - trajectory)
          (isfreemotion ?q1 - config ?t - trajectory ?q2 - config)
          (isholdingmotion ?q1 - config ?t - trajectory ?q2 - config ?o - wuti ?g - grasp)
          (trajcollision ?t - trajectory ?o2 - wuti ?p2 - pose)
          (issupport ?o - wuti ?p - pose ?r - wuti)
          (isstacksupport ?ou - wuti ?pu - pose ?os - wuti ?ps - pose)
          (atpose ?o - wuti ?p - pose)
          (atgrasp ?o - wuti ?g - grasp)
          (handempty)
          (atconf ?q - config)
          (canmove)
          (cleaned ?o - wuti)
          (cooked ?o - wuti)
          (on ?o - wuti ?r - wuti)
          (occupied ?o - wuti)
          (holding ?o - wuti)
          (usedgrasp ?g)
          (canpick)
          (canplace)
          (ismeasuredpose ?o - wuti ?p - pose)
          (located ?o - wuti ?p - pose)
          (allowlocate)
          (issensor ?o - wuti)
          (usedgrasp ?o - wuti ?p - pose ?g - grasp)
          (_applicable ?_p - propo_action)
   )

   (:derived (on ?ou - wuti ?os - wuti)
          (or (exists (?pu) (and (issupport ?ou ?pu ?os) (atpose ?ou ?pu))) (exists (?pu ?ps) (and (isstacksupport ?ou ?pu ?os ?ps) (atpose ?ou ?pu) (atpose ?os ?ps))))
   )
   (:derived (occupied ?os - wuti)
          (exists (?ou) (on ?ou ?os))
   )
   (:derived (holding ?o - wuti)
          (exists (?g) (and (isgrasp ?o ?g) (atgrasp ?o ?g)))
   )

   (:action a0_locate_body
          :parameters (o10 p928 o9)
          :precondition (and (graspable o10) (allowlocate) (issensor o9) (canmove) (_applicable _p0))
          :effect (and (located o10 p928) (not (allowlocate)) (increase (total-cost) 50) (not (_applicable _p0)) (_applicable _p1))
   )
   (:action a1_move_free
          :parameters (q224 #q0 #t18)
          :precondition (and (isfreemotion q224 #t18 #q0) (atconf q224) (handempty) (canmove) (_applicable _p1))
          :effect (and (atconf #q0) (not (atconf q224)) (not (canmove)) (canpick) (increase (total-cost) 100) (not (_applicable _p1)) (_applicable _p2))
   )
   (:action a2_pick
          :parameters (o10 p928 #g0 #q0 #t1)
          :precondition (and (iskin o10 p928 #g0 #q0 #t1) (atpose o10 p928) (handempty) (atconf #q0) (canpick) (located o10 p928) (not (usedgrasp o10 p928 #g0)) (graspatpose #g0 p928) (_applicable _p2))
          :effect (and (atgrasp o10 #g0) (canmove) (not (atpose o10 p928)) (not (handempty)) (increase (total-cost) 100) (not (_applicable _p2)) (_applicable _p3))
   )
   (:action a3_move_holding
          :parameters (#q0 #q1 o10 #g0 #t69)
          :precondition (and (isholdingmotion #q0 #t69 #q1 o10 #g0) (atconf #q0) (atgrasp o10 #g0) (canmove) (_applicable _p3))
          :effect (and (atconf #q1) (not (atconf #q0)) (not (canmove)) (canpick) (canplace) (increase (total-cost) 100) (not (_applicable _p3)) (_applicable _p4))
   )
   (:action a4_place
          :parameters (o10 #p0 o6 #g0 #q1 #t2)
          :precondition (and (iskin o10 #p0 #g0 #q1 #t2) (issupport o10 #p0 o6) (atgrasp o10 #g0) (atconf #q1) (graspable o10) (fixed o6) (canplace) (_applicable _p4))
          :effect (and (atpose o10 #p0) (handempty) (canmove) (not (atgrasp o10 #g0)) (not (canpick)) (not (canplace)) (increase (total-cost) 100) (allowlocate) (not (located o10 #p0)) (usedgrasp o10 #p0 #g0) (not (_applicable _p4)) (_applicable _p5))
   )
   (:action a5_move_free
          :parameters (#q1 q224 #t27)
          :precondition (and (isfreemotion #q1 #t27 q224) (atconf #q1) (handempty) (canmove) (_applicable _p5))
          :effect (and (atconf q224) (not (atconf #q1)) (not (canmove)) (canpick) (increase (total-cost) 100) (not (_applicable _p5)) (_applicable _p6))
   )
   (:action s0_sample-place
          :parameters (o10 o6)
          :precondition (stackable o10 o6)
          :effect (and (ispose o10 #p0) (issupport o10 #p0 o6))
   )
   (:action s1_sample-place
          :parameters (o10 o8)
          :precondition (stackable o10 o8)
          :effect (and (ispose o10 #p1) (issupport o10 #p1 o8))
   )
   (:action s2_sample-place
          :parameters (o10 o7)
          :precondition (stackable o10 o7)
          :effect (and (ispose o10 #p2) (issupport o10 #p2 o7))
   )
   (:action s3_sample-grasp-dir
          :parameters (o10 p928)
          :precondition (and (graspable o10) (ispose o10 p928))
          :effect (isgraspdir o10 p928 #d0)
   )
   (:action s4_plan-free-motion
          :parameters (q224 q224)
          :precondition (and (isconf q224) (isconf q224))
          :effect (isfreemotion q224 #t0 q224)
   )
   (:action s5_sample-grasp-dir
          :parameters (o10 #p0)
          :precondition (and (graspable o10) (ispose o10 #p0))
          :effect (isgraspdir o10 #p0 #d1)
   )
   (:action s6_sample-grasp-dir
          :parameters (o10 #p1)
          :precondition (and (graspable o10) (ispose o10 #p1))
          :effect (isgraspdir o10 #p1 #d2)
   )
   (:action s7_sample-grasp-dir
          :parameters (o10 #p2)
          :precondition (and (graspable o10) (ispose o10 #p2))
          :effect (isgraspdir o10 #p2 #d3)
   )
   (:action s8_sample-grasp
          :parameters (o10 p928 #d0)
          :precondition (isgraspdir o10 p928 #d0)
          :effect (and (graspatpose #g0 p928) (isgrasp o10 #g0))
   )
   (:action s9_sample-grasp
          :parameters (o10 #p0 #d1)
          :precondition (isgraspdir o10 #p0 #d1)
          :effect (and (graspatpose #g1 #p0) (isgrasp o10 #g1))
   )
   (:action s10_sample-grasp
          :parameters (o10 #p1 #d2)
          :precondition (isgraspdir o10 #p1 #d2)
          :effect (and (graspatpose #g2 #p1) (isgrasp o10 #g2))
   )
   (:action s11_sample-grasp
          :parameters (o10 #p2 #d3)
          :precondition (isgraspdir o10 #p2 #d3)
          :effect (and (graspatpose #g3 #p2) (isgrasp o10 #g3))
   )
   (:action s12_inverse-kinematics
          :parameters (o10 p928 #g0)
          :precondition (and (ispose o10 p928) (isgrasp o10 #g0))
          :effect (and (isconf #q0) (istraj #t1) (iskin o10 p928 #g0 #q0 #t1))
   )
   (:action s13_inverse-kinematics
          :parameters (o10 #p0 #g0)
          :precondition (and (ispose o10 #p0) (isgrasp o10 #g0))
          :effect (and (isconf #q1) (istraj #t2) (iskin o10 #p0 #g0 #q1 #t2))
   )
   (:action s14_inverse-kinematics
          :parameters (o10 #p1 #g0)
          :precondition (and (ispose o10 #p1) (isgrasp o10 #g0))
          :effect (and (isconf #q2) (istraj #t3) (iskin o10 #p1 #g0 #q2 #t3))
   )
   (:action s15_inverse-kinematics
          :parameters (o10 #p2 #g0)
          :precondition (and (ispose o10 #p2) (isgrasp o10 #g0))
          :effect (and (isconf #q3) (istraj #t4) (iskin o10 #p2 #g0 #q3 #t4))
   )
   (:action s16_plan-holding-motion
          :parameters (q224 q224 o10 #g0)
          :precondition (and (isconf q224) (isconf q224) (isgrasp o10 #g0))
          :effect (isholdingmotion q224 #t5 q224 o10 #g0)
   )
   (:action s17_inverse-kinematics
          :parameters (o10 p928 #g1)
          :precondition (and (ispose o10 p928) (isgrasp o10 #g1))
          :effect (and (isconf #q4) (istraj #t6) (iskin o10 p928 #g1 #q4 #t6))
   )
   (:action s18_inverse-kinematics
          :parameters (o10 p928 #g2)
          :precondition (and (ispose o10 p928) (isgrasp o10 #g2))
          :effect (and (isconf #q5) (istraj #t7) (iskin o10 p928 #g2 #q5 #t7))
   )
   (:action s19_inverse-kinematics
          :parameters (o10 p928 #g3)
          :precondition (and (ispose o10 p928) (isgrasp o10 #g3))
          :effect (and (isconf #q6) (istraj #t8) (iskin o10 p928 #g3 #q6 #t8))
   )
   (:action s20_inverse-kinematics
          :parameters (o10 #p0 #g1)
          :precondition (and (ispose o10 #p0) (isgrasp o10 #g1))
          :effect (and (isconf #q7) (istraj #t9) (iskin o10 #p0 #g1 #q7 #t9))
   )
   (:action s21_inverse-kinematics
          :parameters (o10 #p0 #g2)
          :precondition (and (ispose o10 #p0) (isgrasp o10 #g2))
          :effect (and (isconf #q8) (istraj #t10) (iskin o10 #p0 #g2 #q8 #t10))
   )
   (:action s22_inverse-kinematics
          :parameters (o10 #p0 #g3)
          :precondition (and (ispose o10 #p0) (isgrasp o10 #g3))
          :effect (and (isconf #q9) (istraj #t11) (iskin o10 #p0 #g3 #q9 #t11))
   )
   (:action s23_inverse-kinematics
          :parameters (o10 #p1 #g1)
          :precondition (and (ispose o10 #p1) (isgrasp o10 #g1))
          :effect (and (isconf #q10) (istraj #t12) (iskin o10 #p1 #g1 #q10 #t12))
   )
   (:action s24_inverse-kinematics
          :parameters (o10 #p1 #g2)
          :precondition (and (ispose o10 #p1) (isgrasp o10 #g2))
          :effect (and (isconf #q11) (istraj #t13) (iskin o10 #p1 #g2 #q11 #t13))
   )
   (:action s25_inverse-kinematics
          :parameters (o10 #p1 #g3)
          :precondition (and (ispose o10 #p1) (isgrasp o10 #g3))
          :effect (and (isconf #q12) (istraj #t14) (iskin o10 #p1 #g3 #q12 #t14))
   )
   (:action s26_inverse-kinematics
          :parameters (o10 #p2 #g1)
          :precondition (and (ispose o10 #p2) (isgrasp o10 #g1))
          :effect (and (isconf #q13) (istraj #t15) (iskin o10 #p2 #g1 #q13 #t15))
   )
   (:action s27_inverse-kinematics
          :parameters (o10 #p2 #g2)
          :precondition (and (ispose o10 #p2) (isgrasp o10 #g2))
          :effect (and (isconf #q14) (istraj #t16) (iskin o10 #p2 #g2 #q14 #t16))
   )
   (:action s28_inverse-kinematics
          :parameters (o10 #p2 #g3)
          :precondition (and (ispose o10 #p2) (isgrasp o10 #g3))
          :effect (and (isconf #q15) (istraj #t17) (iskin o10 #p2 #g3 #q15 #t17))
   )
   (:action s29_plan-free-motion
          :parameters (q224 #q0)
          :precondition (and (isconf q224) (isconf #q0))
          :effect (isfreemotion q224 #t18 #q0)
   )
   (:action s30_plan-free-motion
          :parameters (q224 #q1)
          :precondition (and (isconf q224) (isconf #q1))
          :effect (isfreemotion q224 #t19 #q1)
   )
   (:action s31_plan-free-motion
          :parameters (q224 #q2)
          :precondition (and (isconf q224) (isconf #q2))
          :effect (isfreemotion q224 #t20 #q2)
   )
   (:action s32_plan-free-motion
          :parameters (q224 #q3)
          :precondition (and (isconf q224) (isconf #q3))
          :effect (isfreemotion q224 #t21 #q3)
   )
   (:action s33_plan-free-motion
          :parameters (#q0 q224)
          :precondition (and (isconf #q0) (isconf q224))
          :effect (isfreemotion #q0 #t22 q224)
   )
   (:action s34_plan-free-motion
          :parameters (#q0 #q0)
          :precondition (and (isconf #q0) (isconf #q0))
          :effect (isfreemotion #q0 #t23 #q0)
   )
   (:action s35_plan-free-motion
          :parameters (#q0 #q1)
          :precondition (and (isconf #q0) (isconf #q1))
          :effect (isfreemotion #q0 #t24 #q1)
   )
   (:action s36_plan-free-motion
          :parameters (#q0 #q2)
          :precondition (and (isconf #q0) (isconf #q2))
          :effect (isfreemotion #q0 #t25 #q2)
   )
   (:action s37_plan-free-motion
          :parameters (#q0 #q3)
          :precondition (and (isconf #q0) (isconf #q3))
          :effect (isfreemotion #q0 #t26 #q3)
   )
   (:action s38_plan-free-motion
          :parameters (#q1 q224)
          :precondition (and (isconf #q1) (isconf q224))
          :effect (isfreemotion #q1 #t27 q224)
   )
   (:action s39_plan-free-motion
          :parameters (#q1 #q0)
          :precondition (and (isconf #q1) (isconf #q0))
          :effect (isfreemotion #q1 #t28 #q0)
   )
   (:action s40_plan-free-motion
          :parameters (#q1 #q1)
          :precondition (and (isconf #q1) (isconf #q1))
          :effect (isfreemotion #q1 #t29 #q1)
   )
   (:action s41_plan-free-motion
          :parameters (#q1 #q2)
          :precondition (and (isconf #q1) (isconf #q2))
          :effect (isfreemotion #q1 #t30 #q2)
   )
   (:action s42_plan-free-motion
          :parameters (#q1 #q3)
          :precondition (and (isconf #q1) (isconf #q3))
          :effect (isfreemotion #q1 #t31 #q3)
   )
   (:action s43_plan-free-motion
          :parameters (#q2 q224)
          :precondition (and (isconf #q2) (isconf q224))
          :effect (isfreemotion #q2 #t32 q224)
   )
   (:action s44_plan-free-motion
          :parameters (#q2 #q0)
          :precondition (and (isconf #q2) (isconf #q0))
          :effect (isfreemotion #q2 #t33 #q0)
   )
   (:action s45_plan-free-motion
          :parameters (#q2 #q1)
          :precondition (and (isconf #q2) (isconf #q1))
          :effect (isfreemotion #q2 #t34 #q1)
   )
   (:action s46_plan-free-motion
          :parameters (#q2 #q2)
          :precondition (and (isconf #q2) (isconf #q2))
          :effect (isfreemotion #q2 #t35 #q2)
   )
   (:action s47_plan-free-motion
          :parameters (#q2 #q3)
          :precondition (and (isconf #q2) (isconf #q3))
          :effect (isfreemotion #q2 #t36 #q3)
   )
   (:action s48_plan-free-motion
          :parameters (#q3 q224)
          :precondition (and (isconf #q3) (isconf q224))
          :effect (isfreemotion #q3 #t37 q224)
   )
   (:action s49_plan-free-motion
          :parameters (#q3 #q0)
          :precondition (and (isconf #q3) (isconf #q0))
          :effect (isfreemotion #q3 #t38 #q0)
   )
   (:action s50_plan-free-motion
          :parameters (#q3 #q1)
          :precondition (and (isconf #q3) (isconf #q1))
          :effect (isfreemotion #q3 #t39 #q1)
   )
   (:action s51_plan-free-motion
          :parameters (#q3 #q2)
          :precondition (and (isconf #q3) (isconf #q2))
          :effect (isfreemotion #q3 #t40 #q2)
   )
   (:action s52_plan-free-motion
          :parameters (#q3 #q3)
          :precondition (and (isconf #q3) (isconf #q3))
          :effect (isfreemotion #q3 #t41 #q3)
   )
   (:action s53_plan-holding-motion
          :parameters (q224 q224 o10 #g1)
          :precondition (and (isconf q224) (isconf q224) (isgrasp o10 #g1))
          :effect (isholdingmotion q224 #t42 q224 o10 #g1)
   )
   (:action s54_plan-holding-motion
          :parameters (q224 q224 o10 #g2)
          :precondition (and (isconf q224) (isconf q224) (isgrasp o10 #g2))
          :effect (isholdingmotion q224 #t43 q224 o10 #g2)
   )
   (:action s55_plan-holding-motion
          :parameters (q224 q224 o10 #g3)
          :precondition (and (isconf q224) (isconf q224) (isgrasp o10 #g3))
          :effect (isholdingmotion q224 #t44 q224 o10 #g3)
   )
   (:action s56_plan-holding-motion
          :parameters (q224 #q0 o10 #g0)
          :precondition (and (isconf q224) (isconf #q0) (isgrasp o10 #g0))
          :effect (isholdingmotion q224 #t45 #q0 o10 #g0)
   )
   (:action s57_plan-holding-motion
          :parameters (q224 #q0 o10 #g1)
          :precondition (and (isconf q224) (isconf #q0) (isgrasp o10 #g1))
          :effect (isholdingmotion q224 #t46 #q0 o10 #g1)
   )
   (:action s58_plan-holding-motion
          :parameters (q224 #q0 o10 #g2)
          :precondition (and (isconf q224) (isconf #q0) (isgrasp o10 #g2))
          :effect (isholdingmotion q224 #t47 #q0 o10 #g2)
   )
   (:action s59_plan-holding-motion
          :parameters (q224 #q0 o10 #g3)
          :precondition (and (isconf q224) (isconf #q0) (isgrasp o10 #g3))
          :effect (isholdingmotion q224 #t48 #q0 o10 #g3)
   )
   (:action s60_plan-holding-motion
          :parameters (q224 #q1 o10 #g0)
          :precondition (and (isconf q224) (isconf #q1) (isgrasp o10 #g0))
          :effect (isholdingmotion q224 #t49 #q1 o10 #g0)
   )
   (:action s61_plan-holding-motion
          :parameters (q224 #q1 o10 #g1)
          :precondition (and (isconf q224) (isconf #q1) (isgrasp o10 #g1))
          :effect (isholdingmotion q224 #t50 #q1 o10 #g1)
   )
   (:action s62_plan-holding-motion
          :parameters (q224 #q1 o10 #g2)
          :precondition (and (isconf q224) (isconf #q1) (isgrasp o10 #g2))
          :effect (isholdingmotion q224 #t51 #q1 o10 #g2)
   )
   (:action s63_plan-holding-motion
          :parameters (q224 #q1 o10 #g3)
          :precondition (and (isconf q224) (isconf #q1) (isgrasp o10 #g3))
          :effect (isholdingmotion q224 #t52 #q1 o10 #g3)
   )
   (:action s64_plan-holding-motion
          :parameters (q224 #q2 o10 #g0)
          :precondition (and (isconf q224) (isconf #q2) (isgrasp o10 #g0))
          :effect (isholdingmotion q224 #t53 #q2 o10 #g0)
   )
   (:action s65_plan-holding-motion
          :parameters (q224 #q2 o10 #g1)
          :precondition (and (isconf q224) (isconf #q2) (isgrasp o10 #g1))
          :effect (isholdingmotion q224 #t54 #q2 o10 #g1)
   )
   (:action s66_plan-holding-motion
          :parameters (q224 #q2 o10 #g2)
          :precondition (and (isconf q224) (isconf #q2) (isgrasp o10 #g2))
          :effect (isholdingmotion q224 #t55 #q2 o10 #g2)
   )
   (:action s67_plan-holding-motion
          :parameters (q224 #q2 o10 #g3)
          :precondition (and (isconf q224) (isconf #q2) (isgrasp o10 #g3))
          :effect (isholdingmotion q224 #t56 #q2 o10 #g3)
   )
   (:action s68_plan-holding-motion
          :parameters (q224 #q3 o10 #g0)
          :precondition (and (isconf q224) (isconf #q3) (isgrasp o10 #g0))
          :effect (isholdingmotion q224 #t57 #q3 o10 #g0)
   )
   (:action s69_plan-holding-motion
          :parameters (q224 #q3 o10 #g1)
          :precondition (and (isconf q224) (isconf #q3) (isgrasp o10 #g1))
          :effect (isholdingmotion q224 #t58 #q3 o10 #g1)
   )
   (:action s70_plan-holding-motion
          :parameters (q224 #q3 o10 #g2)
          :precondition (and (isconf q224) (isconf #q3) (isgrasp o10 #g2))
          :effect (isholdingmotion q224 #t59 #q3 o10 #g2)
   )
   (:action s71_plan-holding-motion
          :parameters (q224 #q3 o10 #g3)
          :precondition (and (isconf q224) (isconf #q3) (isgrasp o10 #g3))
          :effect (isholdingmotion q224 #t60 #q3 o10 #g3)
   )
   (:action s72_plan-holding-motion
          :parameters (#q0 q224 o10 #g0)
          :precondition (and (isconf #q0) (isconf q224) (isgrasp o10 #g0))
          :effect (isholdingmotion #q0 #t61 q224 o10 #g0)
   )
   (:action s73_plan-holding-motion
          :parameters (#q0 q224 o10 #g1)
          :precondition (and (isconf #q0) (isconf q224) (isgrasp o10 #g1))
          :effect (isholdingmotion #q0 #t62 q224 o10 #g1)
   )
   (:action s74_plan-holding-motion
          :parameters (#q0 q224 o10 #g2)
          :precondition (and (isconf #q0) (isconf q224) (isgrasp o10 #g2))
          :effect (isholdingmotion #q0 #t63 q224 o10 #g2)
   )
   (:action s75_plan-holding-motion
          :parameters (#q0 q224 o10 #g3)
          :precondition (and (isconf #q0) (isconf q224) (isgrasp o10 #g3))
          :effect (isholdingmotion #q0 #t64 q224 o10 #g3)
   )
   (:action s76_plan-holding-motion
          :parameters (#q0 #q0 o10 #g0)
          :precondition (and (isconf #q0) (isconf #q0) (isgrasp o10 #g0))
          :effect (isholdingmotion #q0 #t65 #q0 o10 #g0)
   )
   (:action s77_plan-holding-motion
          :parameters (#q0 #q0 o10 #g1)
          :precondition (and (isconf #q0) (isconf #q0) (isgrasp o10 #g1))
          :effect (isholdingmotion #q0 #t66 #q0 o10 #g1)
   )
   (:action s78_plan-holding-motion
          :parameters (#q0 #q0 o10 #g2)
          :precondition (and (isconf #q0) (isconf #q0) (isgrasp o10 #g2))
          :effect (isholdingmotion #q0 #t67 #q0 o10 #g2)
   )
   (:action s79_plan-holding-motion
          :parameters (#q0 #q0 o10 #g3)
          :precondition (and (isconf #q0) (isconf #q0) (isgrasp o10 #g3))
          :effect (isholdingmotion #q0 #t68 #q0 o10 #g3)
   )
   (:action s80_plan-holding-motion
          :parameters (#q0 #q1 o10 #g0)
          :precondition (and (isconf #q0) (isconf #q1) (isgrasp o10 #g0))
          :effect (isholdingmotion #q0 #t69 #q1 o10 #g0)
   )
   (:action s81_plan-holding-motion
          :parameters (#q0 #q1 o10 #g1)
          :precondition (and (isconf #q0) (isconf #q1) (isgrasp o10 #g1))
          :effect (isholdingmotion #q0 #t70 #q1 o10 #g1)
   )
   (:action s82_plan-holding-motion
          :parameters (#q0 #q1 o10 #g2)
          :precondition (and (isconf #q0) (isconf #q1) (isgrasp o10 #g2))
          :effect (isholdingmotion #q0 #t71 #q1 o10 #g2)
   )
   (:action s83_plan-holding-motion
          :parameters (#q0 #q1 o10 #g3)
          :precondition (and (isconf #q0) (isconf #q1) (isgrasp o10 #g3))
          :effect (isholdingmotion #q0 #t72 #q1 o10 #g3)
   )
   (:action s84_plan-holding-motion
          :parameters (#q0 #q2 o10 #g0)
          :precondition (and (isconf #q0) (isconf #q2) (isgrasp o10 #g0))
          :effect (isholdingmotion #q0 #t73 #q2 o10 #g0)
   )
   (:action s85_plan-holding-motion
          :parameters (#q0 #q2 o10 #g1)
          :precondition (and (isconf #q0) (isconf #q2) (isgrasp o10 #g1))
          :effect (isholdingmotion #q0 #t74 #q2 o10 #g1)
   )
   (:action s86_plan-holding-motion
          :parameters (#q0 #q2 o10 #g2)
          :precondition (and (isconf #q0) (isconf #q2) (isgrasp o10 #g2))
          :effect (isholdingmotion #q0 #t75 #q2 o10 #g2)
   )
   (:action s87_plan-holding-motion
          :parameters (#q0 #q2 o10 #g3)
          :precondition (and (isconf #q0) (isconf #q2) (isgrasp o10 #g3))
          :effect (isholdingmotion #q0 #t76 #q2 o10 #g3)
   )
   (:action s88_plan-holding-motion
          :parameters (#q0 #q3 o10 #g0)
          :precondition (and (isconf #q0) (isconf #q3) (isgrasp o10 #g0))
          :effect (isholdingmotion #q0 #t77 #q3 o10 #g0)
   )
   (:action s89_plan-holding-motion
          :parameters (#q0 #q3 o10 #g1)
          :precondition (and (isconf #q0) (isconf #q3) (isgrasp o10 #g1))
          :effect (isholdingmotion #q0 #t78 #q3 o10 #g1)
   )
   (:action s90_plan-holding-motion
          :parameters (#q0 #q3 o10 #g2)
          :precondition (and (isconf #q0) (isconf #q3) (isgrasp o10 #g2))
          :effect (isholdingmotion #q0 #t79 #q3 o10 #g2)
   )
   (:action s91_plan-holding-motion
          :parameters (#q0 #q3 o10 #g3)
          :precondition (and (isconf #q0) (isconf #q3) (isgrasp o10 #g3))
          :effect (isholdingmotion #q0 #t80 #q3 o10 #g3)
   )
   (:action s92_plan-holding-motion
          :parameters (#q1 q224 o10 #g0)
          :precondition (and (isconf #q1) (isconf q224) (isgrasp o10 #g0))
          :effect (isholdingmotion #q1 #t81 q224 o10 #g0)
   )
   (:action s93_plan-holding-motion
          :parameters (#q1 q224 o10 #g1)
          :precondition (and (isconf #q1) (isconf q224) (isgrasp o10 #g1))
          :effect (isholdingmotion #q1 #t82 q224 o10 #g1)
   )
   (:action s94_plan-holding-motion
          :parameters (#q1 q224 o10 #g2)
          :precondition (and (isconf #q1) (isconf q224) (isgrasp o10 #g2))
          :effect (isholdingmotion #q1 #t83 q224 o10 #g2)
   )
   (:action s95_plan-holding-motion
          :parameters (#q1 q224 o10 #g3)
          :precondition (and (isconf #q1) (isconf q224) (isgrasp o10 #g3))
          :effect (isholdingmotion #q1 #t84 q224 o10 #g3)
   )
   (:action s96_plan-holding-motion
          :parameters (#q1 #q0 o10 #g0)
          :precondition (and (isconf #q1) (isconf #q0) (isgrasp o10 #g0))
          :effect (isholdingmotion #q1 #t85 #q0 o10 #g0)
   )
   (:action s97_plan-holding-motion
          :parameters (#q1 #q0 o10 #g1)
          :precondition (and (isconf #q1) (isconf #q0) (isgrasp o10 #g1))
          :effect (isholdingmotion #q1 #t86 #q0 o10 #g1)
   )
   (:action s98_plan-holding-motion
          :parameters (#q1 #q0 o10 #g2)
          :precondition (and (isconf #q1) (isconf #q0) (isgrasp o10 #g2))
          :effect (isholdingmotion #q1 #t87 #q0 o10 #g2)
   )
   (:action s99_plan-holding-motion
          :parameters (#q1 #q0 o10 #g3)
          :precondition (and (isconf #q1) (isconf #q0) (isgrasp o10 #g3))
          :effect (isholdingmotion #q1 #t88 #q0 o10 #g3)
   )
   (:action s100_plan-holding-motion
          :parameters (#q1 #q1 o10 #g0)
          :precondition (and (isconf #q1) (isconf #q1) (isgrasp o10 #g0))
          :effect (isholdingmotion #q1 #t89 #q1 o10 #g0)
   )
   (:action s101_plan-holding-motion
          :parameters (#q1 #q1 o10 #g1)
          :precondition (and (isconf #q1) (isconf #q1) (isgrasp o10 #g1))
          :effect (isholdingmotion #q1 #t90 #q1 o10 #g1)
   )
   (:action s102_plan-holding-motion
          :parameters (#q1 #q1 o10 #g2)
          :precondition (and (isconf #q1) (isconf #q1) (isgrasp o10 #g2))
          :effect (isholdingmotion #q1 #t91 #q1 o10 #g2)
   )
   (:action s103_plan-holding-motion
          :parameters (#q1 #q1 o10 #g3)
          :precondition (and (isconf #q1) (isconf #q1) (isgrasp o10 #g3))
          :effect (isholdingmotion #q1 #t92 #q1 o10 #g3)
   )
   (:action s104_plan-holding-motion
          :parameters (#q1 #q2 o10 #g0)
          :precondition (and (isconf #q1) (isconf #q2) (isgrasp o10 #g0))
          :effect (isholdingmotion #q1 #t93 #q2 o10 #g0)
   )
   (:action s105_plan-holding-motion
          :parameters (#q1 #q2 o10 #g1)
          :precondition (and (isconf #q1) (isconf #q2) (isgrasp o10 #g1))
          :effect (isholdingmotion #q1 #t94 #q2 o10 #g1)
   )
   (:action s106_plan-holding-motion
          :parameters (#q1 #q2 o10 #g2)
          :precondition (and (isconf #q1) (isconf #q2) (isgrasp o10 #g2))
          :effect (isholdingmotion #q1 #t95 #q2 o10 #g2)
   )
   (:action s107_plan-holding-motion
          :parameters (#q1 #q2 o10 #g3)
          :precondition (and (isconf #q1) (isconf #q2) (isgrasp o10 #g3))
          :effect (isholdingmotion #q1 #t96 #q2 o10 #g3)
   )
   (:action s108_plan-holding-motion
          :parameters (#q1 #q3 o10 #g0)
          :precondition (and (isconf #q1) (isconf #q3) (isgrasp o10 #g0))
          :effect (isholdingmotion #q1 #t97 #q3 o10 #g0)
   )
   (:action s109_plan-holding-motion
          :parameters (#q1 #q3 o10 #g1)
          :precondition (and (isconf #q1) (isconf #q3) (isgrasp o10 #g1))
          :effect (isholdingmotion #q1 #t98 #q3 o10 #g1)
   )
   (:action s110_plan-holding-motion
          :parameters (#q1 #q3 o10 #g2)
          :precondition (and (isconf #q1) (isconf #q3) (isgrasp o10 #g2))
          :effect (isholdingmotion #q1 #t99 #q3 o10 #g2)
   )
   (:action s111_plan-holding-motion
          :parameters (#q1 #q3 o10 #g3)
          :precondition (and (isconf #q1) (isconf #q3) (isgrasp o10 #g3))
          :effect (isholdingmotion #q1 #t100 #q3 o10 #g3)
   )
   (:action s112_plan-holding-motion
          :parameters (#q2 q224 o10 #g0)
          :precondition (and (isconf #q2) (isconf q224) (isgrasp o10 #g0))
          :effect (isholdingmotion #q2 #t101 q224 o10 #g0)
   )
   (:action s113_plan-holding-motion
          :parameters (#q2 q224 o10 #g1)
          :precondition (and (isconf #q2) (isconf q224) (isgrasp o10 #g1))
          :effect (isholdingmotion #q2 #t102 q224 o10 #g1)
   )
   (:action s114_plan-holding-motion
          :parameters (#q2 q224 o10 #g2)
          :precondition (and (isconf #q2) (isconf q224) (isgrasp o10 #g2))
          :effect (isholdingmotion #q2 #t103 q224 o10 #g2)
   )
   (:action s115_plan-holding-motion
          :parameters (#q2 q224 o10 #g3)
          :precondition (and (isconf #q2) (isconf q224) (isgrasp o10 #g3))
          :effect (isholdingmotion #q2 #t104 q224 o10 #g3)
   )
   (:action s116_plan-holding-motion
          :parameters (#q2 #q0 o10 #g0)
          :precondition (and (isconf #q2) (isconf #q0) (isgrasp o10 #g0))
          :effect (isholdingmotion #q2 #t105 #q0 o10 #g0)
   )
   (:action s117_plan-holding-motion
          :parameters (#q2 #q0 o10 #g1)
          :precondition (and (isconf #q2) (isconf #q0) (isgrasp o10 #g1))
          :effect (isholdingmotion #q2 #t106 #q0 o10 #g1)
   )
   (:action s118_plan-holding-motion
          :parameters (#q2 #q0 o10 #g2)
          :precondition (and (isconf #q2) (isconf #q0) (isgrasp o10 #g2))
          :effect (isholdingmotion #q2 #t107 #q0 o10 #g2)
   )
   (:action s119_plan-holding-motion
          :parameters (#q2 #q0 o10 #g3)
          :precondition (and (isconf #q2) (isconf #q0) (isgrasp o10 #g3))
          :effect (isholdingmotion #q2 #t108 #q0 o10 #g3)
   )
   (:action s120_plan-holding-motion
          :parameters (#q2 #q1 o10 #g0)
          :precondition (and (isconf #q2) (isconf #q1) (isgrasp o10 #g0))
          :effect (isholdingmotion #q2 #t109 #q1 o10 #g0)
   )
   (:action s121_plan-holding-motion
          :parameters (#q2 #q1 o10 #g1)
          :precondition (and (isconf #q2) (isconf #q1) (isgrasp o10 #g1))
          :effect (isholdingmotion #q2 #t110 #q1 o10 #g1)
   )
   (:action s122_plan-holding-motion
          :parameters (#q2 #q1 o10 #g2)
          :precondition (and (isconf #q2) (isconf #q1) (isgrasp o10 #g2))
          :effect (isholdingmotion #q2 #t111 #q1 o10 #g2)
   )
   (:action s123_plan-holding-motion
          :parameters (#q2 #q1 o10 #g3)
          :precondition (and (isconf #q2) (isconf #q1) (isgrasp o10 #g3))
          :effect (isholdingmotion #q2 #t112 #q1 o10 #g3)
   )
   (:action s124_plan-holding-motion
          :parameters (#q2 #q2 o10 #g0)
          :precondition (and (isconf #q2) (isconf #q2) (isgrasp o10 #g0))
          :effect (isholdingmotion #q2 #t113 #q2 o10 #g0)
   )
   (:action s125_plan-holding-motion
          :parameters (#q2 #q2 o10 #g1)
          :precondition (and (isconf #q2) (isconf #q2) (isgrasp o10 #g1))
          :effect (isholdingmotion #q2 #t114 #q2 o10 #g1)
   )
   (:action s126_plan-holding-motion
          :parameters (#q2 #q2 o10 #g2)
          :precondition (and (isconf #q2) (isconf #q2) (isgrasp o10 #g2))
          :effect (isholdingmotion #q2 #t115 #q2 o10 #g2)
   )
   (:action s127_plan-holding-motion
          :parameters (#q2 #q2 o10 #g3)
          :precondition (and (isconf #q2) (isconf #q2) (isgrasp o10 #g3))
          :effect (isholdingmotion #q2 #t116 #q2 o10 #g3)
   )
   (:action s128_plan-holding-motion
          :parameters (#q2 #q3 o10 #g0)
          :precondition (and (isconf #q2) (isconf #q3) (isgrasp o10 #g0))
          :effect (isholdingmotion #q2 #t117 #q3 o10 #g0)
   )
   (:action s129_plan-holding-motion
          :parameters (#q2 #q3 o10 #g1)
          :precondition (and (isconf #q2) (isconf #q3) (isgrasp o10 #g1))
          :effect (isholdingmotion #q2 #t118 #q3 o10 #g1)
   )
   (:action s130_plan-holding-motion
          :parameters (#q2 #q3 o10 #g2)
          :precondition (and (isconf #q2) (isconf #q3) (isgrasp o10 #g2))
          :effect (isholdingmotion #q2 #t119 #q3 o10 #g2)
   )
   (:action s131_plan-holding-motion
          :parameters (#q2 #q3 o10 #g3)
          :precondition (and (isconf #q2) (isconf #q3) (isgrasp o10 #g3))
          :effect (isholdingmotion #q2 #t120 #q3 o10 #g3)
   )
   (:action s132_plan-holding-motion
          :parameters (#q3 q224 o10 #g0)
          :precondition (and (isconf #q3) (isconf q224) (isgrasp o10 #g0))
          :effect (isholdingmotion #q3 #t121 q224 o10 #g0)
   )
   (:action s133_plan-holding-motion
          :parameters (#q3 q224 o10 #g1)
          :precondition (and (isconf #q3) (isconf q224) (isgrasp o10 #g1))
          :effect (isholdingmotion #q3 #t122 q224 o10 #g1)
   )
   (:action s134_plan-holding-motion
          :parameters (#q3 q224 o10 #g2)
          :precondition (and (isconf #q3) (isconf q224) (isgrasp o10 #g2))
          :effect (isholdingmotion #q3 #t123 q224 o10 #g2)
   )
   (:action s135_plan-holding-motion
          :parameters (#q3 q224 o10 #g3)
          :precondition (and (isconf #q3) (isconf q224) (isgrasp o10 #g3))
          :effect (isholdingmotion #q3 #t124 q224 o10 #g3)
   )
   (:action s136_plan-holding-motion
          :parameters (#q3 #q0 o10 #g0)
          :precondition (and (isconf #q3) (isconf #q0) (isgrasp o10 #g0))
          :effect (isholdingmotion #q3 #t125 #q0 o10 #g0)
   )
   (:action s137_plan-holding-motion
          :parameters (#q3 #q0 o10 #g1)
          :precondition (and (isconf #q3) (isconf #q0) (isgrasp o10 #g1))
          :effect (isholdingmotion #q3 #t126 #q0 o10 #g1)
   )
   (:action s138_plan-holding-motion
          :parameters (#q3 #q0 o10 #g2)
          :precondition (and (isconf #q3) (isconf #q0) (isgrasp o10 #g2))
          :effect (isholdingmotion #q3 #t127 #q0 o10 #g2)
   )
   (:action s139_plan-holding-motion
          :parameters (#q3 #q0 o10 #g3)
          :precondition (and (isconf #q3) (isconf #q0) (isgrasp o10 #g3))
          :effect (isholdingmotion #q3 #t128 #q0 o10 #g3)
   )
   (:action s140_plan-holding-motion
          :parameters (#q3 #q1 o10 #g0)
          :precondition (and (isconf #q3) (isconf #q1) (isgrasp o10 #g0))
          :effect (isholdingmotion #q3 #t129 #q1 o10 #g0)
   )
   (:action s141_plan-holding-motion
          :parameters (#q3 #q1 o10 #g1)
          :precondition (and (isconf #q3) (isconf #q1) (isgrasp o10 #g1))
          :effect (isholdingmotion #q3 #t130 #q1 o10 #g1)
   )
   (:action s142_plan-holding-motion
          :parameters (#q3 #q1 o10 #g2)
          :precondition (and (isconf #q3) (isconf #q1) (isgrasp o10 #g2))
          :effect (isholdingmotion #q3 #t131 #q1 o10 #g2)
   )
   (:action s143_plan-holding-motion
          :parameters (#q3 #q1 o10 #g3)
          :precondition (and (isconf #q3) (isconf #q1) (isgrasp o10 #g3))
          :effect (isholdingmotion #q3 #t132 #q1 o10 #g3)
   )
   (:action s144_plan-holding-motion
          :parameters (#q3 #q2 o10 #g0)
          :precondition (and (isconf #q3) (isconf #q2) (isgrasp o10 #g0))
          :effect (isholdingmotion #q3 #t133 #q2 o10 #g0)
   )
   (:action s145_plan-holding-motion
          :parameters (#q3 #q2 o10 #g1)
          :precondition (and (isconf #q3) (isconf #q2) (isgrasp o10 #g1))
          :effect (isholdingmotion #q3 #t134 #q2 o10 #g1)
   )
   (:action s146_plan-holding-motion
          :parameters (#q3 #q2 o10 #g2)
          :precondition (and (isconf #q3) (isconf #q2) (isgrasp o10 #g2))
          :effect (isholdingmotion #q3 #t135 #q2 o10 #g2)
   )
   (:action s147_plan-holding-motion
          :parameters (#q3 #q2 o10 #g3)
          :precondition (and (isconf #q3) (isconf #q2) (isgrasp o10 #g3))
          :effect (isholdingmotion #q3 #t136 #q2 o10 #g3)
   )
   (:action s148_plan-holding-motion
          :parameters (#q3 #q3 o10 #g0)
          :precondition (and (isconf #q3) (isconf #q3) (isgrasp o10 #g0))
          :effect (isholdingmotion #q3 #t137 #q3 o10 #g0)
   )
   (:action s149_plan-holding-motion
          :parameters (#q3 #q3 o10 #g1)
          :precondition (and (isconf #q3) (isconf #q3) (isgrasp o10 #g1))
          :effect (isholdingmotion #q3 #t138 #q3 o10 #g1)
   )
   (:action s150_plan-holding-motion
          :parameters (#q3 #q3 o10 #g2)
          :precondition (and (isconf #q3) (isconf #q3) (isgrasp o10 #g2))
          :effect (isholdingmotion #q3 #t139 #q3 o10 #g2)
   )
   (:action s151_plan-holding-motion
          :parameters (#q3 #q3 o10 #g3)
          :precondition (and (isconf #q3) (isconf #q3) (isgrasp o10 #g3))
          :effect (isholdingmotion #q3 #t140 #q3 o10 #g3)
   )
   (:action s152_plan-free-motion
          :parameters (q224 #q4)
          :precondition (and (isconf q224) (isconf #q4))
          :effect (isfreemotion q224 #t141 #q4)
   )
   (:action s153_plan-free-motion
          :parameters (q224 #q5)
          :precondition (and (isconf q224) (isconf #q5))
          :effect (isfreemotion q224 #t142 #q5)
   )
   (:action s154_plan-free-motion
          :parameters (q224 #q6)
          :precondition (and (isconf q224) (isconf #q6))
          :effect (isfreemotion q224 #t143 #q6)
   )
   (:action s155_plan-free-motion
          :parameters (q224 #q7)
          :precondition (and (isconf q224) (isconf #q7))
          :effect (isfreemotion q224 #t144 #q7)
   )
   (:action s156_plan-free-motion
          :parameters (q224 #q8)
          :precondition (and (isconf q224) (isconf #q8))
          :effect (isfreemotion q224 #t145 #q8)
   )
   (:action s157_plan-free-motion
          :parameters (q224 #q9)
          :precondition (and (isconf q224) (isconf #q9))
          :effect (isfreemotion q224 #t146 #q9)
   )
   (:action s158_plan-free-motion
          :parameters (q224 #q10)
          :precondition (and (isconf q224) (isconf #q10))
          :effect (isfreemotion q224 #t147 #q10)
   )
   (:action s159_plan-free-motion
          :parameters (q224 #q11)
          :precondition (and (isconf q224) (isconf #q11))
          :effect (isfreemotion q224 #t148 #q11)
   )
   (:action s160_plan-free-motion
          :parameters (q224 #q12)
          :precondition (and (isconf q224) (isconf #q12))
          :effect (isfreemotion q224 #t149 #q12)
   )
   (:action s161_plan-free-motion
          :parameters (q224 #q13)
          :precondition (and (isconf q224) (isconf #q13))
          :effect (isfreemotion q224 #t150 #q13)
   )
   (:action s162_plan-free-motion
          :parameters (q224 #q14)
          :precondition (and (isconf q224) (isconf #q14))
          :effect (isfreemotion q224 #t151 #q14)
   )
   (:action s163_plan-free-motion
          :parameters (q224 #q15)
          :precondition (and (isconf q224) (isconf #q15))
          :effect (isfreemotion q224 #t152 #q15)
   )
   (:action s164_plan-free-motion
          :parameters (#q0 #q4)
          :precondition (and (isconf #q0) (isconf #q4))
          :effect (isfreemotion #q0 #t153 #q4)
   )
   (:action s165_plan-free-motion
          :parameters (#q0 #q5)
          :precondition (and (isconf #q0) (isconf #q5))
          :effect (isfreemotion #q0 #t154 #q5)
   )
   (:action s166_plan-free-motion
          :parameters (#q0 #q6)
          :precondition (and (isconf #q0) (isconf #q6))
          :effect (isfreemotion #q0 #t155 #q6)
   )
   (:action s167_plan-free-motion
          :parameters (#q0 #q7)
          :precondition (and (isconf #q0) (isconf #q7))
          :effect (isfreemotion #q0 #t156 #q7)
   )
   (:action s168_plan-free-motion
          :parameters (#q0 #q8)
          :precondition (and (isconf #q0) (isconf #q8))
          :effect (isfreemotion #q0 #t157 #q8)
   )
   (:action s169_plan-free-motion
          :parameters (#q0 #q9)
          :precondition (and (isconf #q0) (isconf #q9))
          :effect (isfreemotion #q0 #t158 #q9)
   )
   (:action s170_plan-free-motion
          :parameters (#q0 #q10)
          :precondition (and (isconf #q0) (isconf #q10))
          :effect (isfreemotion #q0 #t159 #q10)
   )
   (:action s171_plan-free-motion
          :parameters (#q0 #q11)
          :precondition (and (isconf #q0) (isconf #q11))
          :effect (isfreemotion #q0 #t160 #q11)
   )
   (:action s172_plan-free-motion
          :parameters (#q0 #q12)
          :precondition (and (isconf #q0) (isconf #q12))
          :effect (isfreemotion #q0 #t161 #q12)
   )
   (:action s173_plan-free-motion
          :parameters (#q0 #q13)
          :precondition (and (isconf #q0) (isconf #q13))
          :effect (isfreemotion #q0 #t162 #q13)
   )
   (:action s174_plan-free-motion
          :parameters (#q0 #q14)
          :precondition (and (isconf #q0) (isconf #q14))
          :effect (isfreemotion #q0 #t163 #q14)
   )
   (:action s175_plan-free-motion
          :parameters (#q0 #q15)
          :precondition (and (isconf #q0) (isconf #q15))
          :effect (isfreemotion #q0 #t164 #q15)
   )
   (:action s176_plan-free-motion
          :parameters (#q1 #q4)
          :precondition (and (isconf #q1) (isconf #q4))
          :effect (isfreemotion #q1 #t165 #q4)
   )
   (:action s177_plan-free-motion
          :parameters (#q1 #q5)
          :precondition (and (isconf #q1) (isconf #q5))
          :effect (isfreemotion #q1 #t166 #q5)
   )
   (:action s178_plan-free-motion
          :parameters (#q1 #q6)
          :precondition (and (isconf #q1) (isconf #q6))
          :effect (isfreemotion #q1 #t167 #q6)
   )
   (:action s179_plan-free-motion
          :parameters (#q1 #q7)
          :precondition (and (isconf #q1) (isconf #q7))
          :effect (isfreemotion #q1 #t168 #q7)
   )
   (:action s180_plan-free-motion
          :parameters (#q1 #q8)
          :precondition (and (isconf #q1) (isconf #q8))
          :effect (isfreemotion #q1 #t169 #q8)
   )
   (:action s181_plan-free-motion
          :parameters (#q1 #q9)
          :precondition (and (isconf #q1) (isconf #q9))
          :effect (isfreemotion #q1 #t170 #q9)
   )
   (:action s182_plan-free-motion
          :parameters (#q1 #q10)
          :precondition (and (isconf #q1) (isconf #q10))
          :effect (isfreemotion #q1 #t171 #q10)
   )
   (:action s183_plan-free-motion
          :parameters (#q1 #q11)
          :precondition (and (isconf #q1) (isconf #q11))
          :effect (isfreemotion #q1 #t172 #q11)
   )
   (:action s184_plan-free-motion
          :parameters (#q1 #q12)
          :precondition (and (isconf #q1) (isconf #q12))
          :effect (isfreemotion #q1 #t173 #q12)
   )
   (:action s185_plan-free-motion
          :parameters (#q1 #q13)
          :precondition (and (isconf #q1) (isconf #q13))
          :effect (isfreemotion #q1 #t174 #q13)
   )
   (:action s186_plan-free-motion
          :parameters (#q1 #q14)
          :precondition (and (isconf #q1) (isconf #q14))
          :effect (isfreemotion #q1 #t175 #q14)
   )
   (:action s187_plan-free-motion
          :parameters (#q1 #q15)
          :precondition (and (isconf #q1) (isconf #q15))
          :effect (isfreemotion #q1 #t176 #q15)
   )
   (:action s188_plan-free-motion
          :parameters (#q2 #q4)
          :precondition (and (isconf #q2) (isconf #q4))
          :effect (isfreemotion #q2 #t177 #q4)
   )
   (:action s189_plan-free-motion
          :parameters (#q2 #q5)
          :precondition (and (isconf #q2) (isconf #q5))
          :effect (isfreemotion #q2 #t178 #q5)
   )
   (:action s190_plan-free-motion
          :parameters (#q2 #q6)
          :precondition (and (isconf #q2) (isconf #q6))
          :effect (isfreemotion #q2 #t179 #q6)
   )
   (:action s191_plan-free-motion
          :parameters (#q2 #q7)
          :precondition (and (isconf #q2) (isconf #q7))
          :effect (isfreemotion #q2 #t180 #q7)
   )
   (:action s192_plan-free-motion
          :parameters (#q2 #q8)
          :precondition (and (isconf #q2) (isconf #q8))
          :effect (isfreemotion #q2 #t181 #q8)
   )
   (:action s193_plan-free-motion
          :parameters (#q2 #q9)
          :precondition (and (isconf #q2) (isconf #q9))
          :effect (isfreemotion #q2 #t182 #q9)
   )
   (:action s194_plan-free-motion
          :parameters (#q2 #q10)
          :precondition (and (isconf #q2) (isconf #q10))
          :effect (isfreemotion #q2 #t183 #q10)
   )
   (:action s195_plan-free-motion
          :parameters (#q2 #q11)
          :precondition (and (isconf #q2) (isconf #q11))
          :effect (isfreemotion #q2 #t184 #q11)
   )
   (:action s196_plan-free-motion
          :parameters (#q2 #q12)
          :precondition (and (isconf #q2) (isconf #q12))
          :effect (isfreemotion #q2 #t185 #q12)
   )
   (:action s197_plan-free-motion
          :parameters (#q2 #q13)
          :precondition (and (isconf #q2) (isconf #q13))
          :effect (isfreemotion #q2 #t186 #q13)
   )
   (:action s198_plan-free-motion
          :parameters (#q2 #q14)
          :precondition (and (isconf #q2) (isconf #q14))
          :effect (isfreemotion #q2 #t187 #q14)
   )
   (:action s199_plan-free-motion
          :parameters (#q2 #q15)
          :precondition (and (isconf #q2) (isconf #q15))
          :effect (isfreemotion #q2 #t188 #q15)
   )
   (:action s200_plan-free-motion
          :parameters (#q3 #q4)
          :precondition (and (isconf #q3) (isconf #q4))
          :effect (isfreemotion #q3 #t189 #q4)
   )
   (:action s201_plan-free-motion
          :parameters (#q3 #q5)
          :precondition (and (isconf #q3) (isconf #q5))
          :effect (isfreemotion #q3 #t190 #q5)
   )
   (:action s202_plan-free-motion
          :parameters (#q3 #q6)
          :precondition (and (isconf #q3) (isconf #q6))
          :effect (isfreemotion #q3 #t191 #q6)
   )
   (:action s203_plan-free-motion
          :parameters (#q3 #q7)
          :precondition (and (isconf #q3) (isconf #q7))
          :effect (isfreemotion #q3 #t192 #q7)
   )
   (:action s204_plan-free-motion
          :parameters (#q3 #q8)
          :precondition (and (isconf #q3) (isconf #q8))
          :effect (isfreemotion #q3 #t193 #q8)
   )
   (:action s205_plan-free-motion
          :parameters (#q3 #q9)
          :precondition (and (isconf #q3) (isconf #q9))
          :effect (isfreemotion #q3 #t194 #q9)
   )
   (:action s206_plan-free-motion
          :parameters (#q3 #q10)
          :precondition (and (isconf #q3) (isconf #q10))
          :effect (isfreemotion #q3 #t195 #q10)
   )
   (:action s207_plan-free-motion
          :parameters (#q3 #q11)
          :precondition (and (isconf #q3) (isconf #q11))
          :effect (isfreemotion #q3 #t196 #q11)
   )
   (:action s208_plan-free-motion
          :parameters (#q3 #q12)
          :precondition (and (isconf #q3) (isconf #q12))
          :effect (isfreemotion #q3 #t197 #q12)
   )
   (:action s209_plan-free-motion
          :parameters (#q3 #q13)
          :precondition (and (isconf #q3) (isconf #q13))
          :effect (isfreemotion #q3 #t198 #q13)
   )
   (:action s210_plan-free-motion
          :parameters (#q3 #q14)
          :precondition (and (isconf #q3) (isconf #q14))
          :effect (isfreemotion #q3 #t199 #q14)
   )
   (:action s211_plan-free-motion
          :parameters (#q3 #q15)
          :precondition (and (isconf #q3) (isconf #q15))
          :effect (isfreemotion #q3 #t200 #q15)
   )
   (:action s212_plan-free-motion
          :parameters (#q4 q224)
          :precondition (and (isconf #q4) (isconf q224))
          :effect (isfreemotion #q4 #t201 q224)
   )
   (:action s213_plan-free-motion
          :parameters (#q4 #q0)
          :precondition (and (isconf #q4) (isconf #q0))
          :effect (isfreemotion #q4 #t202 #q0)
   )
   (:action s214_plan-free-motion
          :parameters (#q4 #q1)
          :precondition (and (isconf #q4) (isconf #q1))
          :effect (isfreemotion #q4 #t203 #q1)
   )
   (:action s215_plan-free-motion
          :parameters (#q4 #q2)
          :precondition (and (isconf #q4) (isconf #q2))
          :effect (isfreemotion #q4 #t204 #q2)
   )
   (:action s216_plan-free-motion
          :parameters (#q4 #q3)
          :precondition (and (isconf #q4) (isconf #q3))
          :effect (isfreemotion #q4 #t205 #q3)
   )
   (:action s217_plan-free-motion
          :parameters (#q4 #q4)
          :precondition (and (isconf #q4) (isconf #q4))
          :effect (isfreemotion #q4 #t206 #q4)
   )
   (:action s218_plan-free-motion
          :parameters (#q4 #q5)
          :precondition (and (isconf #q4) (isconf #q5))
          :effect (isfreemotion #q4 #t207 #q5)
   )
   (:action s219_plan-free-motion
          :parameters (#q4 #q6)
          :precondition (and (isconf #q4) (isconf #q6))
          :effect (isfreemotion #q4 #t208 #q6)
   )
   (:action s220_plan-free-motion
          :parameters (#q4 #q7)
          :precondition (and (isconf #q4) (isconf #q7))
          :effect (isfreemotion #q4 #t209 #q7)
   )
   (:action s221_plan-free-motion
          :parameters (#q4 #q8)
          :precondition (and (isconf #q4) (isconf #q8))
          :effect (isfreemotion #q4 #t210 #q8)
   )
   (:action s222_plan-free-motion
          :parameters (#q4 #q9)
          :precondition (and (isconf #q4) (isconf #q9))
          :effect (isfreemotion #q4 #t211 #q9)
   )
   (:action s223_plan-free-motion
          :parameters (#q4 #q10)
          :precondition (and (isconf #q4) (isconf #q10))
          :effect (isfreemotion #q4 #t212 #q10)
   )
   (:action s224_plan-free-motion
          :parameters (#q4 #q11)
          :precondition (and (isconf #q4) (isconf #q11))
          :effect (isfreemotion #q4 #t213 #q11)
   )
   (:action s225_plan-free-motion
          :parameters (#q4 #q12)
          :precondition (and (isconf #q4) (isconf #q12))
          :effect (isfreemotion #q4 #t214 #q12)
   )
   (:action s226_plan-free-motion
          :parameters (#q4 #q13)
          :precondition (and (isconf #q4) (isconf #q13))
          :effect (isfreemotion #q4 #t215 #q13)
   )
   (:action s227_plan-free-motion
          :parameters (#q4 #q14)
          :precondition (and (isconf #q4) (isconf #q14))
          :effect (isfreemotion #q4 #t216 #q14)
   )
   (:action s228_plan-free-motion
          :parameters (#q4 #q15)
          :precondition (and (isconf #q4) (isconf #q15))
          :effect (isfreemotion #q4 #t217 #q15)
   )
   (:action s229_plan-free-motion
          :parameters (#q5 q224)
          :precondition (and (isconf #q5) (isconf q224))
          :effect (isfreemotion #q5 #t218 q224)
   )
   (:action s230_plan-free-motion
          :parameters (#q5 #q0)
          :precondition (and (isconf #q5) (isconf #q0))
          :effect (isfreemotion #q5 #t219 #q0)
   )
   (:action s231_plan-free-motion
          :parameters (#q5 #q1)
          :precondition (and (isconf #q5) (isconf #q1))
          :effect (isfreemotion #q5 #t220 #q1)
   )
   (:action s232_plan-free-motion
          :parameters (#q5 #q2)
          :precondition (and (isconf #q5) (isconf #q2))
          :effect (isfreemotion #q5 #t221 #q2)
   )
   (:action s233_plan-free-motion
          :parameters (#q5 #q3)
          :precondition (and (isconf #q5) (isconf #q3))
          :effect (isfreemotion #q5 #t222 #q3)
   )
   (:action s234_plan-free-motion
          :parameters (#q5 #q4)
          :precondition (and (isconf #q5) (isconf #q4))
          :effect (isfreemotion #q5 #t223 #q4)
   )
   (:action s235_plan-free-motion
          :parameters (#q5 #q5)
          :precondition (and (isconf #q5) (isconf #q5))
          :effect (isfreemotion #q5 #t224 #q5)
   )
   (:action s236_plan-free-motion
          :parameters (#q5 #q6)
          :precondition (and (isconf #q5) (isconf #q6))
          :effect (isfreemotion #q5 #t225 #q6)
   )
   (:action s237_plan-free-motion
          :parameters (#q5 #q7)
          :precondition (and (isconf #q5) (isconf #q7))
          :effect (isfreemotion #q5 #t226 #q7)
   )
   (:action s238_plan-free-motion
          :parameters (#q5 #q8)
          :precondition (and (isconf #q5) (isconf #q8))
          :effect (isfreemotion #q5 #t227 #q8)
   )
   (:action s239_plan-free-motion
          :parameters (#q5 #q9)
          :precondition (and (isconf #q5) (isconf #q9))
          :effect (isfreemotion #q5 #t228 #q9)
   )
   (:action s240_plan-free-motion
          :parameters (#q5 #q10)
          :precondition (and (isconf #q5) (isconf #q10))
          :effect (isfreemotion #q5 #t229 #q10)
   )
   (:action s241_plan-free-motion
          :parameters (#q5 #q11)
          :precondition (and (isconf #q5) (isconf #q11))
          :effect (isfreemotion #q5 #t230 #q11)
   )
   (:action s242_plan-free-motion
          :parameters (#q5 #q12)
          :precondition (and (isconf #q5) (isconf #q12))
          :effect (isfreemotion #q5 #t231 #q12)
   )
   (:action s243_plan-free-motion
          :parameters (#q5 #q13)
          :precondition (and (isconf #q5) (isconf #q13))
          :effect (isfreemotion #q5 #t232 #q13)
   )
   (:action s244_plan-free-motion
          :parameters (#q5 #q14)
          :precondition (and (isconf #q5) (isconf #q14))
          :effect (isfreemotion #q5 #t233 #q14)
   )
   (:action s245_plan-free-motion
          :parameters (#q5 #q15)
          :precondition (and (isconf #q5) (isconf #q15))
          :effect (isfreemotion #q5 #t234 #q15)
   )
   (:action s246_plan-free-motion
          :parameters (#q6 q224)
          :precondition (and (isconf #q6) (isconf q224))
          :effect (isfreemotion #q6 #t235 q224)
   )
   (:action s247_plan-free-motion
          :parameters (#q6 #q0)
          :precondition (and (isconf #q6) (isconf #q0))
          :effect (isfreemotion #q6 #t236 #q0)
   )
   (:action s248_plan-free-motion
          :parameters (#q6 #q1)
          :precondition (and (isconf #q6) (isconf #q1))
          :effect (isfreemotion #q6 #t237 #q1)
   )
   (:action s249_plan-free-motion
          :parameters (#q6 #q2)
          :precondition (and (isconf #q6) (isconf #q2))
          :effect (isfreemotion #q6 #t238 #q2)
   )
   (:action s250_plan-free-motion
          :parameters (#q6 #q3)
          :precondition (and (isconf #q6) (isconf #q3))
          :effect (isfreemotion #q6 #t239 #q3)
   )
   (:action s251_plan-free-motion
          :parameters (#q6 #q4)
          :precondition (and (isconf #q6) (isconf #q4))
          :effect (isfreemotion #q6 #t240 #q4)
   )
   (:action s252_plan-free-motion
          :parameters (#q6 #q5)
          :precondition (and (isconf #q6) (isconf #q5))
          :effect (isfreemotion #q6 #t241 #q5)
   )
   (:action s253_plan-free-motion
          :parameters (#q6 #q6)
          :precondition (and (isconf #q6) (isconf #q6))
          :effect (isfreemotion #q6 #t242 #q6)
   )
   (:action s254_plan-free-motion
          :parameters (#q6 #q7)
          :precondition (and (isconf #q6) (isconf #q7))
          :effect (isfreemotion #q6 #t243 #q7)
   )
   (:action s255_plan-free-motion
          :parameters (#q6 #q8)
          :precondition (and (isconf #q6) (isconf #q8))
          :effect (isfreemotion #q6 #t244 #q8)
   )
   (:action s256_plan-free-motion
          :parameters (#q6 #q9)
          :precondition (and (isconf #q6) (isconf #q9))
          :effect (isfreemotion #q6 #t245 #q9)
   )
   (:action s257_plan-free-motion
          :parameters (#q6 #q10)
          :precondition (and (isconf #q6) (isconf #q10))
          :effect (isfreemotion #q6 #t246 #q10)
   )
   (:action s258_plan-free-motion
          :parameters (#q6 #q11)
          :precondition (and (isconf #q6) (isconf #q11))
          :effect (isfreemotion #q6 #t247 #q11)
   )
   (:action s259_plan-free-motion
          :parameters (#q6 #q12)
          :precondition (and (isconf #q6) (isconf #q12))
          :effect (isfreemotion #q6 #t248 #q12)
   )
   (:action s260_plan-free-motion
          :parameters (#q6 #q13)
          :precondition (and (isconf #q6) (isconf #q13))
          :effect (isfreemotion #q6 #t249 #q13)
   )
   (:action s261_plan-free-motion
          :parameters (#q6 #q14)
          :precondition (and (isconf #q6) (isconf #q14))
          :effect (isfreemotion #q6 #t250 #q14)
   )
   (:action s262_plan-free-motion
          :parameters (#q6 #q15)
          :precondition (and (isconf #q6) (isconf #q15))
          :effect (isfreemotion #q6 #t251 #q15)
   )
   (:action s263_plan-free-motion
          :parameters (#q7 q224)
          :precondition (and (isconf #q7) (isconf q224))
          :effect (isfreemotion #q7 #t252 q224)
   )
   (:action s264_plan-free-motion
          :parameters (#q7 #q0)
          :precondition (and (isconf #q7) (isconf #q0))
          :effect (isfreemotion #q7 #t253 #q0)
   )
   (:action s265_plan-free-motion
          :parameters (#q7 #q1)
          :precondition (and (isconf #q7) (isconf #q1))
          :effect (isfreemotion #q7 #t254 #q1)
   )
   (:action s266_plan-free-motion
          :parameters (#q7 #q2)
          :precondition (and (isconf #q7) (isconf #q2))
          :effect (isfreemotion #q7 #t255 #q2)
   )
   (:action s267_plan-free-motion
          :parameters (#q7 #q3)
          :precondition (and (isconf #q7) (isconf #q3))
          :effect (isfreemotion #q7 #t256 #q3)
   )
   (:action s268_plan-free-motion
          :parameters (#q7 #q4)
          :precondition (and (isconf #q7) (isconf #q4))
          :effect (isfreemotion #q7 #t257 #q4)
   )
   (:action s269_plan-free-motion
          :parameters (#q7 #q5)
          :precondition (and (isconf #q7) (isconf #q5))
          :effect (isfreemotion #q7 #t258 #q5)
   )
   (:action s270_plan-free-motion
          :parameters (#q7 #q6)
          :precondition (and (isconf #q7) (isconf #q6))
          :effect (isfreemotion #q7 #t259 #q6)
   )
   (:action s271_plan-free-motion
          :parameters (#q7 #q7)
          :precondition (and (isconf #q7) (isconf #q7))
          :effect (isfreemotion #q7 #t260 #q7)
   )
   (:action s272_plan-free-motion
          :parameters (#q7 #q8)
          :precondition (and (isconf #q7) (isconf #q8))
          :effect (isfreemotion #q7 #t261 #q8)
   )
   (:action s273_plan-free-motion
          :parameters (#q7 #q9)
          :precondition (and (isconf #q7) (isconf #q9))
          :effect (isfreemotion #q7 #t262 #q9)
   )
   (:action s274_plan-free-motion
          :parameters (#q7 #q10)
          :precondition (and (isconf #q7) (isconf #q10))
          :effect (isfreemotion #q7 #t263 #q10)
   )
   (:action s275_plan-free-motion
          :parameters (#q7 #q11)
          :precondition (and (isconf #q7) (isconf #q11))
          :effect (isfreemotion #q7 #t264 #q11)
   )
   (:action s276_plan-free-motion
          :parameters (#q7 #q12)
          :precondition (and (isconf #q7) (isconf #q12))
          :effect (isfreemotion #q7 #t265 #q12)
   )
   (:action s277_plan-free-motion
          :parameters (#q7 #q13)
          :precondition (and (isconf #q7) (isconf #q13))
          :effect (isfreemotion #q7 #t266 #q13)
   )
   (:action s278_plan-free-motion
          :parameters (#q7 #q14)
          :precondition (and (isconf #q7) (isconf #q14))
          :effect (isfreemotion #q7 #t267 #q14)
   )
   (:action s279_plan-free-motion
          :parameters (#q7 #q15)
          :precondition (and (isconf #q7) (isconf #q15))
          :effect (isfreemotion #q7 #t268 #q15)
   )
   (:action s280_plan-free-motion
          :parameters (#q8 q224)
          :precondition (and (isconf #q8) (isconf q224))
          :effect (isfreemotion #q8 #t269 q224)
   )
   (:action s281_plan-free-motion
          :parameters (#q8 #q0)
          :precondition (and (isconf #q8) (isconf #q0))
          :effect (isfreemotion #q8 #t270 #q0)
   )
   (:action s282_plan-free-motion
          :parameters (#q8 #q1)
          :precondition (and (isconf #q8) (isconf #q1))
          :effect (isfreemotion #q8 #t271 #q1)
   )
   (:action s283_plan-free-motion
          :parameters (#q8 #q2)
          :precondition (and (isconf #q8) (isconf #q2))
          :effect (isfreemotion #q8 #t272 #q2)
   )
   (:action s284_plan-free-motion
          :parameters (#q8 #q3)
          :precondition (and (isconf #q8) (isconf #q3))
          :effect (isfreemotion #q8 #t273 #q3)
   )
   (:action s285_plan-free-motion
          :parameters (#q8 #q4)
          :precondition (and (isconf #q8) (isconf #q4))
          :effect (isfreemotion #q8 #t274 #q4)
   )
   (:action s286_plan-free-motion
          :parameters (#q8 #q5)
          :precondition (and (isconf #q8) (isconf #q5))
          :effect (isfreemotion #q8 #t275 #q5)
   )
   (:action s287_plan-free-motion
          :parameters (#q8 #q6)
          :precondition (and (isconf #q8) (isconf #q6))
          :effect (isfreemotion #q8 #t276 #q6)
   )
   (:action s288_plan-free-motion
          :parameters (#q8 #q7)
          :precondition (and (isconf #q8) (isconf #q7))
          :effect (isfreemotion #q8 #t277 #q7)
   )
   (:action s289_plan-free-motion
          :parameters (#q8 #q8)
          :precondition (and (isconf #q8) (isconf #q8))
          :effect (isfreemotion #q8 #t278 #q8)
   )
   (:action s290_plan-free-motion
          :parameters (#q8 #q9)
          :precondition (and (isconf #q8) (isconf #q9))
          :effect (isfreemotion #q8 #t279 #q9)
   )
   (:action s291_plan-free-motion
          :parameters (#q8 #q10)
          :precondition (and (isconf #q8) (isconf #q10))
          :effect (isfreemotion #q8 #t280 #q10)
   )
   (:action s292_plan-free-motion
          :parameters (#q8 #q11)
          :precondition (and (isconf #q8) (isconf #q11))
          :effect (isfreemotion #q8 #t281 #q11)
   )
   (:action s293_plan-free-motion
          :parameters (#q8 #q12)
          :precondition (and (isconf #q8) (isconf #q12))
          :effect (isfreemotion #q8 #t282 #q12)
   )
   (:action s294_plan-free-motion
          :parameters (#q8 #q13)
          :precondition (and (isconf #q8) (isconf #q13))
          :effect (isfreemotion #q8 #t283 #q13)
   )
   (:action s295_plan-free-motion
          :parameters (#q8 #q14)
          :precondition (and (isconf #q8) (isconf #q14))
          :effect (isfreemotion #q8 #t284 #q14)
   )
   (:action s296_plan-free-motion
          :parameters (#q8 #q15)
          :precondition (and (isconf #q8) (isconf #q15))
          :effect (isfreemotion #q8 #t285 #q15)
   )
   (:action s297_plan-free-motion
          :parameters (#q9 q224)
          :precondition (and (isconf #q9) (isconf q224))
          :effect (isfreemotion #q9 #t286 q224)
   )
   (:action s298_plan-free-motion
          :parameters (#q9 #q0)
          :precondition (and (isconf #q9) (isconf #q0))
          :effect (isfreemotion #q9 #t287 #q0)
   )
   (:action s299_plan-free-motion
          :parameters (#q9 #q1)
          :precondition (and (isconf #q9) (isconf #q1))
          :effect (isfreemotion #q9 #t288 #q1)
   )
   (:action s300_plan-free-motion
          :parameters (#q9 #q2)
          :precondition (and (isconf #q9) (isconf #q2))
          :effect (isfreemotion #q9 #t289 #q2)
   )
   (:action s301_plan-free-motion
          :parameters (#q9 #q3)
          :precondition (and (isconf #q9) (isconf #q3))
          :effect (isfreemotion #q9 #t290 #q3)
   )
   (:action s302_plan-free-motion
          :parameters (#q9 #q4)
          :precondition (and (isconf #q9) (isconf #q4))
          :effect (isfreemotion #q9 #t291 #q4)
   )
   (:action s303_plan-free-motion
          :parameters (#q9 #q5)
          :precondition (and (isconf #q9) (isconf #q5))
          :effect (isfreemotion #q9 #t292 #q5)
   )
   (:action s304_plan-free-motion
          :parameters (#q9 #q6)
          :precondition (and (isconf #q9) (isconf #q6))
          :effect (isfreemotion #q9 #t293 #q6)
   )
   (:action s305_plan-free-motion
          :parameters (#q9 #q7)
          :precondition (and (isconf #q9) (isconf #q7))
          :effect (isfreemotion #q9 #t294 #q7)
   )
   (:action s306_plan-free-motion
          :parameters (#q9 #q8)
          :precondition (and (isconf #q9) (isconf #q8))
          :effect (isfreemotion #q9 #t295 #q8)
   )
   (:action s307_plan-free-motion
          :parameters (#q9 #q9)
          :precondition (and (isconf #q9) (isconf #q9))
          :effect (isfreemotion #q9 #t296 #q9)
   )
   (:action s308_plan-free-motion
          :parameters (#q9 #q10)
          :precondition (and (isconf #q9) (isconf #q10))
          :effect (isfreemotion #q9 #t297 #q10)
   )
   (:action s309_plan-free-motion
          :parameters (#q9 #q11)
          :precondition (and (isconf #q9) (isconf #q11))
          :effect (isfreemotion #q9 #t298 #q11)
   )
   (:action s310_plan-free-motion
          :parameters (#q9 #q12)
          :precondition (and (isconf #q9) (isconf #q12))
          :effect (isfreemotion #q9 #t299 #q12)
   )
   (:action s311_plan-free-motion
          :parameters (#q9 #q13)
          :precondition (and (isconf #q9) (isconf #q13))
          :effect (isfreemotion #q9 #t300 #q13)
   )
   (:action s312_plan-free-motion
          :parameters (#q9 #q14)
          :precondition (and (isconf #q9) (isconf #q14))
          :effect (isfreemotion #q9 #t301 #q14)
   )
   (:action s313_plan-free-motion
          :parameters (#q9 #q15)
          :precondition (and (isconf #q9) (isconf #q15))
          :effect (isfreemotion #q9 #t302 #q15)
   )
   (:action s314_plan-free-motion
          :parameters (#q10 q224)
          :precondition (and (isconf #q10) (isconf q224))
          :effect (isfreemotion #q10 #t303 q224)
   )
   (:action s315_plan-free-motion
          :parameters (#q10 #q0)
          :precondition (and (isconf #q10) (isconf #q0))
          :effect (isfreemotion #q10 #t304 #q0)
   )
   (:action s316_plan-free-motion
          :parameters (#q10 #q1)
          :precondition (and (isconf #q10) (isconf #q1))
          :effect (isfreemotion #q10 #t305 #q1)
   )
   (:action s317_plan-free-motion
          :parameters (#q10 #q2)
          :precondition (and (isconf #q10) (isconf #q2))
          :effect (isfreemotion #q10 #t306 #q2)
   )
   (:action s318_plan-free-motion
          :parameters (#q10 #q3)
          :precondition (and (isconf #q10) (isconf #q3))
          :effect (isfreemotion #q10 #t307 #q3)
   )
   (:action s319_plan-free-motion
          :parameters (#q10 #q4)
          :precondition (and (isconf #q10) (isconf #q4))
          :effect (isfreemotion #q10 #t308 #q4)
   )
   (:action s320_plan-free-motion
          :parameters (#q10 #q5)
          :precondition (and (isconf #q10) (isconf #q5))
          :effect (isfreemotion #q10 #t309 #q5)
   )
   (:action s321_plan-free-motion
          :parameters (#q10 #q6)
          :precondition (and (isconf #q10) (isconf #q6))
          :effect (isfreemotion #q10 #t310 #q6)
   )
   (:action s322_plan-free-motion
          :parameters (#q10 #q7)
          :precondition (and (isconf #q10) (isconf #q7))
          :effect (isfreemotion #q10 #t311 #q7)
   )
   (:action s323_plan-free-motion
          :parameters (#q10 #q8)
          :precondition (and (isconf #q10) (isconf #q8))
          :effect (isfreemotion #q10 #t312 #q8)
   )
   (:action s324_plan-free-motion
          :parameters (#q10 #q9)
          :precondition (and (isconf #q10) (isconf #q9))
          :effect (isfreemotion #q10 #t313 #q9)
   )
   (:action s325_plan-free-motion
          :parameters (#q10 #q10)
          :precondition (and (isconf #q10) (isconf #q10))
          :effect (isfreemotion #q10 #t314 #q10)
   )
   (:action s326_plan-free-motion
          :parameters (#q10 #q11)
          :precondition (and (isconf #q10) (isconf #q11))
          :effect (isfreemotion #q10 #t315 #q11)
   )
   (:action s327_plan-free-motion
          :parameters (#q10 #q12)
          :precondition (and (isconf #q10) (isconf #q12))
          :effect (isfreemotion #q10 #t316 #q12)
   )
   (:action s328_plan-free-motion
          :parameters (#q10 #q13)
          :precondition (and (isconf #q10) (isconf #q13))
          :effect (isfreemotion #q10 #t317 #q13)
   )
   (:action s329_plan-free-motion
          :parameters (#q10 #q14)
          :precondition (and (isconf #q10) (isconf #q14))
          :effect (isfreemotion #q10 #t318 #q14)
   )
   (:action s330_plan-free-motion
          :parameters (#q10 #q15)
          :precondition (and (isconf #q10) (isconf #q15))
          :effect (isfreemotion #q10 #t319 #q15)
   )
   (:action s331_plan-free-motion
          :parameters (#q11 q224)
          :precondition (and (isconf #q11) (isconf q224))
          :effect (isfreemotion #q11 #t320 q224)
   )
   (:action s332_plan-free-motion
          :parameters (#q11 #q0)
          :precondition (and (isconf #q11) (isconf #q0))
          :effect (isfreemotion #q11 #t321 #q0)
   )
   (:action s333_plan-free-motion
          :parameters (#q11 #q1)
          :precondition (and (isconf #q11) (isconf #q1))
          :effect (isfreemotion #q11 #t322 #q1)
   )
   (:action s334_plan-free-motion
          :parameters (#q11 #q2)
          :precondition (and (isconf #q11) (isconf #q2))
          :effect (isfreemotion #q11 #t323 #q2)
   )
   (:action s335_plan-free-motion
          :parameters (#q11 #q3)
          :precondition (and (isconf #q11) (isconf #q3))
          :effect (isfreemotion #q11 #t324 #q3)
   )
   (:action s336_plan-free-motion
          :parameters (#q11 #q4)
          :precondition (and (isconf #q11) (isconf #q4))
          :effect (isfreemotion #q11 #t325 #q4)
   )
   (:action s337_plan-free-motion
          :parameters (#q11 #q5)
          :precondition (and (isconf #q11) (isconf #q5))
          :effect (isfreemotion #q11 #t326 #q5)
   )
   (:action s338_plan-free-motion
          :parameters (#q11 #q6)
          :precondition (and (isconf #q11) (isconf #q6))
          :effect (isfreemotion #q11 #t327 #q6)
   )
   (:action s339_plan-free-motion
          :parameters (#q11 #q7)
          :precondition (and (isconf #q11) (isconf #q7))
          :effect (isfreemotion #q11 #t328 #q7)
   )
   (:action s340_plan-free-motion
          :parameters (#q11 #q8)
          :precondition (and (isconf #q11) (isconf #q8))
          :effect (isfreemotion #q11 #t329 #q8)
   )
   (:action s341_plan-free-motion
          :parameters (#q11 #q9)
          :precondition (and (isconf #q11) (isconf #q9))
          :effect (isfreemotion #q11 #t330 #q9)
   )
   (:action s342_plan-free-motion
          :parameters (#q11 #q10)
          :precondition (and (isconf #q11) (isconf #q10))
          :effect (isfreemotion #q11 #t331 #q10)
   )
   (:action s343_plan-free-motion
          :parameters (#q11 #q11)
          :precondition (and (isconf #q11) (isconf #q11))
          :effect (isfreemotion #q11 #t332 #q11)
   )
   (:action s344_plan-free-motion
          :parameters (#q11 #q12)
          :precondition (and (isconf #q11) (isconf #q12))
          :effect (isfreemotion #q11 #t333 #q12)
   )
   (:action s345_plan-free-motion
          :parameters (#q11 #q13)
          :precondition (and (isconf #q11) (isconf #q13))
          :effect (isfreemotion #q11 #t334 #q13)
   )
   (:action s346_plan-free-motion
          :parameters (#q11 #q14)
          :precondition (and (isconf #q11) (isconf #q14))
          :effect (isfreemotion #q11 #t335 #q14)
   )
   (:action s347_plan-free-motion
          :parameters (#q11 #q15)
          :precondition (and (isconf #q11) (isconf #q15))
          :effect (isfreemotion #q11 #t336 #q15)
   )
   (:action s348_plan-free-motion
          :parameters (#q12 q224)
          :precondition (and (isconf #q12) (isconf q224))
          :effect (isfreemotion #q12 #t337 q224)
   )
   (:action s349_plan-free-motion
          :parameters (#q12 #q0)
          :precondition (and (isconf #q12) (isconf #q0))
          :effect (isfreemotion #q12 #t338 #q0)
   )
   (:action s350_plan-free-motion
          :parameters (#q12 #q1)
          :precondition (and (isconf #q12) (isconf #q1))
          :effect (isfreemotion #q12 #t339 #q1)
   )
   (:action s351_plan-free-motion
          :parameters (#q12 #q2)
          :precondition (and (isconf #q12) (isconf #q2))
          :effect (isfreemotion #q12 #t340 #q2)
   )
   (:action s352_plan-free-motion
          :parameters (#q12 #q3)
          :precondition (and (isconf #q12) (isconf #q3))
          :effect (isfreemotion #q12 #t341 #q3)
   )
   (:action s353_plan-free-motion
          :parameters (#q12 #q4)
          :precondition (and (isconf #q12) (isconf #q4))
          :effect (isfreemotion #q12 #t342 #q4)
   )
   (:action s354_plan-free-motion
          :parameters (#q12 #q5)
          :precondition (and (isconf #q12) (isconf #q5))
          :effect (isfreemotion #q12 #t343 #q5)
   )
   (:action s355_plan-free-motion
          :parameters (#q12 #q6)
          :precondition (and (isconf #q12) (isconf #q6))
          :effect (isfreemotion #q12 #t344 #q6)
   )
   (:action s356_plan-free-motion
          :parameters (#q12 #q7)
          :precondition (and (isconf #q12) (isconf #q7))
          :effect (isfreemotion #q12 #t345 #q7)
   )
   (:action s357_plan-free-motion
          :parameters (#q12 #q8)
          :precondition (and (isconf #q12) (isconf #q8))
          :effect (isfreemotion #q12 #t346 #q8)
   )
   (:action s358_plan-free-motion
          :parameters (#q12 #q9)
          :precondition (and (isconf #q12) (isconf #q9))
          :effect (isfreemotion #q12 #t347 #q9)
   )
   (:action s359_plan-free-motion
          :parameters (#q12 #q10)
          :precondition (and (isconf #q12) (isconf #q10))
          :effect (isfreemotion #q12 #t348 #q10)
   )
   (:action s360_plan-free-motion
          :parameters (#q12 #q11)
          :precondition (and (isconf #q12) (isconf #q11))
          :effect (isfreemotion #q12 #t349 #q11)
   )
   (:action s361_plan-free-motion
          :parameters (#q12 #q12)
          :precondition (and (isconf #q12) (isconf #q12))
          :effect (isfreemotion #q12 #t350 #q12)
   )
   (:action s362_plan-free-motion
          :parameters (#q12 #q13)
          :precondition (and (isconf #q12) (isconf #q13))
          :effect (isfreemotion #q12 #t351 #q13)
   )
   (:action s363_plan-free-motion
          :parameters (#q12 #q14)
          :precondition (and (isconf #q12) (isconf #q14))
          :effect (isfreemotion #q12 #t352 #q14)
   )
   (:action s364_plan-free-motion
          :parameters (#q12 #q15)
          :precondition (and (isconf #q12) (isconf #q15))
          :effect (isfreemotion #q12 #t353 #q15)
   )
   (:action s365_plan-free-motion
          :parameters (#q13 q224)
          :precondition (and (isconf #q13) (isconf q224))
          :effect (isfreemotion #q13 #t354 q224)
   )
   (:action s366_plan-free-motion
          :parameters (#q13 #q0)
          :precondition (and (isconf #q13) (isconf #q0))
          :effect (isfreemotion #q13 #t355 #q0)
   )
   (:action s367_plan-free-motion
          :parameters (#q13 #q1)
          :precondition (and (isconf #q13) (isconf #q1))
          :effect (isfreemotion #q13 #t356 #q1)
   )
   (:action s368_plan-free-motion
          :parameters (#q13 #q2)
          :precondition (and (isconf #q13) (isconf #q2))
          :effect (isfreemotion #q13 #t357 #q2)
   )
   (:action s369_plan-free-motion
          :parameters (#q13 #q3)
          :precondition (and (isconf #q13) (isconf #q3))
          :effect (isfreemotion #q13 #t358 #q3)
   )
   (:action s370_plan-free-motion
          :parameters (#q13 #q4)
          :precondition (and (isconf #q13) (isconf #q4))
          :effect (isfreemotion #q13 #t359 #q4)
   )
   (:action s371_plan-free-motion
          :parameters (#q13 #q5)
          :precondition (and (isconf #q13) (isconf #q5))
          :effect (isfreemotion #q13 #t360 #q5)
   )
   (:action s372_plan-free-motion
          :parameters (#q13 #q6)
          :precondition (and (isconf #q13) (isconf #q6))
          :effect (isfreemotion #q13 #t361 #q6)
   )
   (:action s373_plan-free-motion
          :parameters (#q13 #q7)
          :precondition (and (isconf #q13) (isconf #q7))
          :effect (isfreemotion #q13 #t362 #q7)
   )
   (:action s374_plan-free-motion
          :parameters (#q13 #q8)
          :precondition (and (isconf #q13) (isconf #q8))
          :effect (isfreemotion #q13 #t363 #q8)
   )
   (:action s375_plan-free-motion
          :parameters (#q13 #q9)
          :precondition (and (isconf #q13) (isconf #q9))
          :effect (isfreemotion #q13 #t364 #q9)
   )
   (:action s376_plan-free-motion
          :parameters (#q13 #q10)
          :precondition (and (isconf #q13) (isconf #q10))
          :effect (isfreemotion #q13 #t365 #q10)
   )
   (:action s377_plan-free-motion
          :parameters (#q13 #q11)
          :precondition (and (isconf #q13) (isconf #q11))
          :effect (isfreemotion #q13 #t366 #q11)
   )
   (:action s378_plan-free-motion
          :parameters (#q13 #q12)
          :precondition (and (isconf #q13) (isconf #q12))
          :effect (isfreemotion #q13 #t367 #q12)
   )
   (:action s379_plan-free-motion
          :parameters (#q13 #q13)
          :precondition (and (isconf #q13) (isconf #q13))
          :effect (isfreemotion #q13 #t368 #q13)
   )
   (:action s380_plan-free-motion
          :parameters (#q13 #q14)
          :precondition (and (isconf #q13) (isconf #q14))
          :effect (isfreemotion #q13 #t369 #q14)
   )
   (:action s381_plan-free-motion
          :parameters (#q13 #q15)
          :precondition (and (isconf #q13) (isconf #q15))
          :effect (isfreemotion #q13 #t370 #q15)
   )
   (:action s382_plan-free-motion
          :parameters (#q14 q224)
          :precondition (and (isconf #q14) (isconf q224))
          :effect (isfreemotion #q14 #t371 q224)
   )
   (:action s383_plan-free-motion
          :parameters (#q14 #q0)
          :precondition (and (isconf #q14) (isconf #q0))
          :effect (isfreemotion #q14 #t372 #q0)
   )
   (:action s384_plan-free-motion
          :parameters (#q14 #q1)
          :precondition (and (isconf #q14) (isconf #q1))
          :effect (isfreemotion #q14 #t373 #q1)
   )
   (:action s385_plan-free-motion
          :parameters (#q14 #q2)
          :precondition (and (isconf #q14) (isconf #q2))
          :effect (isfreemotion #q14 #t374 #q2)
   )
   (:action s386_plan-free-motion
          :parameters (#q14 #q3)
          :precondition (and (isconf #q14) (isconf #q3))
          :effect (isfreemotion #q14 #t375 #q3)
   )
   (:action s387_plan-free-motion
          :parameters (#q14 #q4)
          :precondition (and (isconf #q14) (isconf #q4))
          :effect (isfreemotion #q14 #t376 #q4)
   )
   (:action s388_plan-free-motion
          :parameters (#q14 #q5)
          :precondition (and (isconf #q14) (isconf #q5))
          :effect (isfreemotion #q14 #t377 #q5)
   )
   (:action s389_plan-free-motion
          :parameters (#q14 #q6)
          :precondition (and (isconf #q14) (isconf #q6))
          :effect (isfreemotion #q14 #t378 #q6)
   )
   (:action s390_plan-free-motion
          :parameters (#q14 #q7)
          :precondition (and (isconf #q14) (isconf #q7))
          :effect (isfreemotion #q14 #t379 #q7)
   )
   (:action s391_plan-free-motion
          :parameters (#q14 #q8)
          :precondition (and (isconf #q14) (isconf #q8))
          :effect (isfreemotion #q14 #t380 #q8)
   )
   (:action s392_plan-free-motion
          :parameters (#q14 #q9)
          :precondition (and (isconf #q14) (isconf #q9))
          :effect (isfreemotion #q14 #t381 #q9)
   )
   (:action s393_plan-free-motion
          :parameters (#q14 #q10)
          :precondition (and (isconf #q14) (isconf #q10))
          :effect (isfreemotion #q14 #t382 #q10)
   )
   (:action s394_plan-free-motion
          :parameters (#q14 #q11)
          :precondition (and (isconf #q14) (isconf #q11))
          :effect (isfreemotion #q14 #t383 #q11)
   )
   (:action s395_plan-free-motion
          :parameters (#q14 #q12)
          :precondition (and (isconf #q14) (isconf #q12))
          :effect (isfreemotion #q14 #t384 #q12)
   )
   (:action s396_plan-free-motion
          :parameters (#q14 #q13)
          :precondition (and (isconf #q14) (isconf #q13))
          :effect (isfreemotion #q14 #t385 #q13)
   )
   (:action s397_plan-free-motion
          :parameters (#q14 #q14)
          :precondition (and (isconf #q14) (isconf #q14))
          :effect (isfreemotion #q14 #t386 #q14)
   )
   (:action s398_plan-free-motion
          :parameters (#q14 #q15)
          :precondition (and (isconf #q14) (isconf #q15))
          :effect (isfreemotion #q14 #t387 #q15)
   )
   (:action s399_plan-free-motion
          :parameters (#q15 q224)
          :precondition (and (isconf #q15) (isconf q224))
          :effect (isfreemotion #q15 #t388 q224)
   )
   (:action s400_plan-free-motion
          :parameters (#q15 #q0)
          :precondition (and (isconf #q15) (isconf #q0))
          :effect (isfreemotion #q15 #t389 #q0)
   )
   (:action s401_plan-free-motion
          :parameters (#q15 #q1)
          :precondition (and (isconf #q15) (isconf #q1))
          :effect (isfreemotion #q15 #t390 #q1)
   )
   (:action s402_plan-free-motion
          :parameters (#q15 #q2)
          :precondition (and (isconf #q15) (isconf #q2))
          :effect (isfreemotion #q15 #t391 #q2)
   )
   (:action s403_plan-free-motion
          :parameters (#q15 #q3)
          :precondition (and (isconf #q15) (isconf #q3))
          :effect (isfreemotion #q15 #t392 #q3)
   )
   (:action s404_plan-free-motion
          :parameters (#q15 #q4)
          :precondition (and (isconf #q15) (isconf #q4))
          :effect (isfreemotion #q15 #t393 #q4)
   )
   (:action s405_plan-free-motion
          :parameters (#q15 #q5)
          :precondition (and (isconf #q15) (isconf #q5))
          :effect (isfreemotion #q15 #t394 #q5)
   )
   (:action s406_plan-free-motion
          :parameters (#q15 #q6)
          :precondition (and (isconf #q15) (isconf #q6))
          :effect (isfreemotion #q15 #t395 #q6)
   )
   (:action s407_plan-free-motion
          :parameters (#q15 #q7)
          :precondition (and (isconf #q15) (isconf #q7))
          :effect (isfreemotion #q15 #t396 #q7)
   )
   (:action s408_plan-free-motion
          :parameters (#q15 #q8)
          :precondition (and (isconf #q15) (isconf #q8))
          :effect (isfreemotion #q15 #t397 #q8)
   )
   (:action s409_plan-free-motion
          :parameters (#q15 #q9)
          :precondition (and (isconf #q15) (isconf #q9))
          :effect (isfreemotion #q15 #t398 #q9)
   )
   (:action s410_plan-free-motion
          :parameters (#q15 #q10)
          :precondition (and (isconf #q15) (isconf #q10))
          :effect (isfreemotion #q15 #t399 #q10)
   )
   (:action s411_plan-free-motion
          :parameters (#q15 #q11)
          :precondition (and (isconf #q15) (isconf #q11))
          :effect (isfreemotion #q15 #t400 #q11)
   )
   (:action s412_plan-free-motion
          :parameters (#q15 #q12)
          :precondition (and (isconf #q15) (isconf #q12))
          :effect (isfreemotion #q15 #t401 #q12)
   )
   (:action s413_plan-free-motion
          :parameters (#q15 #q13)
          :precondition (and (isconf #q15) (isconf #q13))
          :effect (isfreemotion #q15 #t402 #q13)
   )
   (:action s414_plan-free-motion
          :parameters (#q15 #q14)
          :precondition (and (isconf #q15) (isconf #q14))
          :effect (isfreemotion #q15 #t403 #q14)
   )
   (:action s415_plan-free-motion
          :parameters (#q15 #q15)
          :precondition (and (isconf #q15) (isconf #q15))
          :effect (isfreemotion #q15 #t404 #q15)
   )
   (:action s416_plan-holding-motion
          :parameters (q224 #q4 o10 #g0)
          :precondition (and (isconf q224) (isconf #q4) (isgrasp o10 #g0))
          :effect (isholdingmotion q224 #t405 #q4 o10 #g0)
   )
   (:action s417_plan-holding-motion
          :parameters (q224 #q4 o10 #g1)
          :precondition (and (isconf q224) (isconf #q4) (isgrasp o10 #g1))
          :effect (isholdingmotion q224 #t406 #q4 o10 #g1)
   )
   (:action s418_plan-holding-motion
          :parameters (q224 #q4 o10 #g2)
          :precondition (and (isconf q224) (isconf #q4) (isgrasp o10 #g2))
          :effect (isholdingmotion q224 #t407 #q4 o10 #g2)
   )
   (:action s419_plan-holding-motion
          :parameters (q224 #q4 o10 #g3)
          :precondition (and (isconf q224) (isconf #q4) (isgrasp o10 #g3))
          :effect (isholdingmotion q224 #t408 #q4 o10 #g3)
   )
   (:action s420_plan-holding-motion
          :parameters (q224 #q5 o10 #g0)
          :precondition (and (isconf q224) (isconf #q5) (isgrasp o10 #g0))
          :effect (isholdingmotion q224 #t409 #q5 o10 #g0)
   )
   (:action s421_plan-holding-motion
          :parameters (q224 #q5 o10 #g1)
          :precondition (and (isconf q224) (isconf #q5) (isgrasp o10 #g1))
          :effect (isholdingmotion q224 #t410 #q5 o10 #g1)
   )
   (:action s422_plan-holding-motion
          :parameters (q224 #q5 o10 #g2)
          :precondition (and (isconf q224) (isconf #q5) (isgrasp o10 #g2))
          :effect (isholdingmotion q224 #t411 #q5 o10 #g2)
   )
   (:action s423_plan-holding-motion
          :parameters (q224 #q5 o10 #g3)
          :precondition (and (isconf q224) (isconf #q5) (isgrasp o10 #g3))
          :effect (isholdingmotion q224 #t412 #q5 o10 #g3)
   )
   (:action s424_plan-holding-motion
          :parameters (q224 #q6 o10 #g0)
          :precondition (and (isconf q224) (isconf #q6) (isgrasp o10 #g0))
          :effect (isholdingmotion q224 #t413 #q6 o10 #g0)
   )
   (:action s425_plan-holding-motion
          :parameters (q224 #q6 o10 #g1)
          :precondition (and (isconf q224) (isconf #q6) (isgrasp o10 #g1))
          :effect (isholdingmotion q224 #t414 #q6 o10 #g1)
   )
   (:action s426_plan-holding-motion
          :parameters (q224 #q6 o10 #g2)
          :precondition (and (isconf q224) (isconf #q6) (isgrasp o10 #g2))
          :effect (isholdingmotion q224 #t415 #q6 o10 #g2)
   )
   (:action s427_plan-holding-motion
          :parameters (q224 #q6 o10 #g3)
          :precondition (and (isconf q224) (isconf #q6) (isgrasp o10 #g3))
          :effect (isholdingmotion q224 #t416 #q6 o10 #g3)
   )
   (:action s428_plan-holding-motion
          :parameters (q224 #q7 o10 #g0)
          :precondition (and (isconf q224) (isconf #q7) (isgrasp o10 #g0))
          :effect (isholdingmotion q224 #t417 #q7 o10 #g0)
   )
   (:action s429_plan-holding-motion
          :parameters (q224 #q7 o10 #g1)
          :precondition (and (isconf q224) (isconf #q7) (isgrasp o10 #g1))
          :effect (isholdingmotion q224 #t418 #q7 o10 #g1)
   )
   (:action s430_plan-holding-motion
          :parameters (q224 #q7 o10 #g2)
          :precondition (and (isconf q224) (isconf #q7) (isgrasp o10 #g2))
          :effect (isholdingmotion q224 #t419 #q7 o10 #g2)
   )
   (:action s431_plan-holding-motion
          :parameters (q224 #q7 o10 #g3)
          :precondition (and (isconf q224) (isconf #q7) (isgrasp o10 #g3))
          :effect (isholdingmotion q224 #t420 #q7 o10 #g3)
   )
   (:action s432_plan-holding-motion
          :parameters (q224 #q8 o10 #g0)
          :precondition (and (isconf q224) (isconf #q8) (isgrasp o10 #g0))
          :effect (isholdingmotion q224 #t421 #q8 o10 #g0)
   )
   (:action s433_plan-holding-motion
          :parameters (q224 #q8 o10 #g1)
          :precondition (and (isconf q224) (isconf #q8) (isgrasp o10 #g1))
          :effect (isholdingmotion q224 #t422 #q8 o10 #g1)
   )
   (:action s434_plan-holding-motion
          :parameters (q224 #q8 o10 #g2)
          :precondition (and (isconf q224) (isconf #q8) (isgrasp o10 #g2))
          :effect (isholdingmotion q224 #t423 #q8 o10 #g2)
   )
   (:action s435_plan-holding-motion
          :parameters (q224 #q8 o10 #g3)
          :precondition (and (isconf q224) (isconf #q8) (isgrasp o10 #g3))
          :effect (isholdingmotion q224 #t424 #q8 o10 #g3)
   )
   (:action s436_plan-holding-motion
          :parameters (q224 #q9 o10 #g0)
          :precondition (and (isconf q224) (isconf #q9) (isgrasp o10 #g0))
          :effect (isholdingmotion q224 #t425 #q9 o10 #g0)
   )
   (:action s437_plan-holding-motion
          :parameters (q224 #q9 o10 #g1)
          :precondition (and (isconf q224) (isconf #q9) (isgrasp o10 #g1))
          :effect (isholdingmotion q224 #t426 #q9 o10 #g1)
   )
   (:action s438_plan-holding-motion
          :parameters (q224 #q9 o10 #g2)
          :precondition (and (isconf q224) (isconf #q9) (isgrasp o10 #g2))
          :effect (isholdingmotion q224 #t427 #q9 o10 #g2)
   )
   (:action s439_plan-holding-motion
          :parameters (q224 #q9 o10 #g3)
          :precondition (and (isconf q224) (isconf #q9) (isgrasp o10 #g3))
          :effect (isholdingmotion q224 #t428 #q9 o10 #g3)
   )
   (:action s440_plan-holding-motion
          :parameters (q224 #q10 o10 #g0)
          :precondition (and (isconf q224) (isconf #q10) (isgrasp o10 #g0))
          :effect (isholdingmotion q224 #t429 #q10 o10 #g0)
   )
   (:action s441_plan-holding-motion
          :parameters (q224 #q10 o10 #g1)
          :precondition (and (isconf q224) (isconf #q10) (isgrasp o10 #g1))
          :effect (isholdingmotion q224 #t430 #q10 o10 #g1)
   )
   (:action s442_plan-holding-motion
          :parameters (q224 #q10 o10 #g2)
          :precondition (and (isconf q224) (isconf #q10) (isgrasp o10 #g2))
          :effect (isholdingmotion q224 #t431 #q10 o10 #g2)
   )
   (:action s443_plan-holding-motion
          :parameters (q224 #q10 o10 #g3)
          :precondition (and (isconf q224) (isconf #q10) (isgrasp o10 #g3))
          :effect (isholdingmotion q224 #t432 #q10 o10 #g3)
   )
   (:action s444_plan-holding-motion
          :parameters (q224 #q11 o10 #g0)
          :precondition (and (isconf q224) (isconf #q11) (isgrasp o10 #g0))
          :effect (isholdingmotion q224 #t433 #q11 o10 #g0)
   )
   (:action s445_plan-holding-motion
          :parameters (q224 #q11 o10 #g1)
          :precondition (and (isconf q224) (isconf #q11) (isgrasp o10 #g1))
          :effect (isholdingmotion q224 #t434 #q11 o10 #g1)
   )
   (:action s446_plan-holding-motion
          :parameters (q224 #q11 o10 #g2)
          :precondition (and (isconf q224) (isconf #q11) (isgrasp o10 #g2))
          :effect (isholdingmotion q224 #t435 #q11 o10 #g2)
   )
   (:action s447_plan-holding-motion
          :parameters (q224 #q11 o10 #g3)
          :precondition (and (isconf q224) (isconf #q11) (isgrasp o10 #g3))
          :effect (isholdingmotion q224 #t436 #q11 o10 #g3)
   )
   (:action s448_plan-holding-motion
          :parameters (q224 #q12 o10 #g0)
          :precondition (and (isconf q224) (isconf #q12) (isgrasp o10 #g0))
          :effect (isholdingmotion q224 #t437 #q12 o10 #g0)
   )
   (:action s449_plan-holding-motion
          :parameters (q224 #q12 o10 #g1)
          :precondition (and (isconf q224) (isconf #q12) (isgrasp o10 #g1))
          :effect (isholdingmotion q224 #t438 #q12 o10 #g1)
   )
   (:action s450_plan-holding-motion
          :parameters (q224 #q12 o10 #g2)
          :precondition (and (isconf q224) (isconf #q12) (isgrasp o10 #g2))
          :effect (isholdingmotion q224 #t439 #q12 o10 #g2)
   )
   (:action s451_plan-holding-motion
          :parameters (q224 #q12 o10 #g3)
          :precondition (and (isconf q224) (isconf #q12) (isgrasp o10 #g3))
          :effect (isholdingmotion q224 #t440 #q12 o10 #g3)
   )
   (:action s452_plan-holding-motion
          :parameters (q224 #q13 o10 #g0)
          :precondition (and (isconf q224) (isconf #q13) (isgrasp o10 #g0))
          :effect (isholdingmotion q224 #t441 #q13 o10 #g0)
   )
   (:action s453_plan-holding-motion
          :parameters (q224 #q13 o10 #g1)
          :precondition (and (isconf q224) (isconf #q13) (isgrasp o10 #g1))
          :effect (isholdingmotion q224 #t442 #q13 o10 #g1)
   )
   (:action s454_plan-holding-motion
          :parameters (q224 #q13 o10 #g2)
          :precondition (and (isconf q224) (isconf #q13) (isgrasp o10 #g2))
          :effect (isholdingmotion q224 #t443 #q13 o10 #g2)
   )
   (:action s455_plan-holding-motion
          :parameters (q224 #q13 o10 #g3)
          :precondition (and (isconf q224) (isconf #q13) (isgrasp o10 #g3))
          :effect (isholdingmotion q224 #t444 #q13 o10 #g3)
   )
   (:action s456_plan-holding-motion
          :parameters (q224 #q14 o10 #g0)
          :precondition (and (isconf q224) (isconf #q14) (isgrasp o10 #g0))
          :effect (isholdingmotion q224 #t445 #q14 o10 #g0)
   )
   (:action s457_plan-holding-motion
          :parameters (q224 #q14 o10 #g1)
          :precondition (and (isconf q224) (isconf #q14) (isgrasp o10 #g1))
          :effect (isholdingmotion q224 #t446 #q14 o10 #g1)
   )
   (:action s458_plan-holding-motion
          :parameters (q224 #q14 o10 #g2)
          :precondition (and (isconf q224) (isconf #q14) (isgrasp o10 #g2))
          :effect (isholdingmotion q224 #t447 #q14 o10 #g2)
   )
   (:action s459_plan-holding-motion
          :parameters (q224 #q14 o10 #g3)
          :precondition (and (isconf q224) (isconf #q14) (isgrasp o10 #g3))
          :effect (isholdingmotion q224 #t448 #q14 o10 #g3)
   )
   (:action s460_plan-holding-motion
          :parameters (q224 #q15 o10 #g0)
          :precondition (and (isconf q224) (isconf #q15) (isgrasp o10 #g0))
          :effect (isholdingmotion q224 #t449 #q15 o10 #g0)
   )
   (:action s461_plan-holding-motion
          :parameters (q224 #q15 o10 #g1)
          :precondition (and (isconf q224) (isconf #q15) (isgrasp o10 #g1))
          :effect (isholdingmotion q224 #t450 #q15 o10 #g1)
   )
   (:action s462_plan-holding-motion
          :parameters (q224 #q15 o10 #g2)
          :precondition (and (isconf q224) (isconf #q15) (isgrasp o10 #g2))
          :effect (isholdingmotion q224 #t451 #q15 o10 #g2)
   )
   (:action s463_plan-holding-motion
          :parameters (q224 #q15 o10 #g3)
          :precondition (and (isconf q224) (isconf #q15) (isgrasp o10 #g3))
          :effect (isholdingmotion q224 #t452 #q15 o10 #g3)
   )
   (:action s464_plan-holding-motion
          :parameters (#q0 #q4 o10 #g0)
          :precondition (and (isconf #q0) (isconf #q4) (isgrasp o10 #g0))
          :effect (isholdingmotion #q0 #t453 #q4 o10 #g0)
   )
   (:action s465_plan-holding-motion
          :parameters (#q0 #q4 o10 #g1)
          :precondition (and (isconf #q0) (isconf #q4) (isgrasp o10 #g1))
          :effect (isholdingmotion #q0 #t454 #q4 o10 #g1)
   )
   (:action s466_plan-holding-motion
          :parameters (#q0 #q4 o10 #g2)
          :precondition (and (isconf #q0) (isconf #q4) (isgrasp o10 #g2))
          :effect (isholdingmotion #q0 #t455 #q4 o10 #g2)
   )
   (:action s467_plan-holding-motion
          :parameters (#q0 #q4 o10 #g3)
          :precondition (and (isconf #q0) (isconf #q4) (isgrasp o10 #g3))
          :effect (isholdingmotion #q0 #t456 #q4 o10 #g3)
   )
   (:action s468_plan-holding-motion
          :parameters (#q0 #q5 o10 #g0)
          :precondition (and (isconf #q0) (isconf #q5) (isgrasp o10 #g0))
          :effect (isholdingmotion #q0 #t457 #q5 o10 #g0)
   )
   (:action s469_plan-holding-motion
          :parameters (#q0 #q5 o10 #g1)
          :precondition (and (isconf #q0) (isconf #q5) (isgrasp o10 #g1))
          :effect (isholdingmotion #q0 #t458 #q5 o10 #g1)
   )
   (:action s470_plan-holding-motion
          :parameters (#q0 #q5 o10 #g2)
          :precondition (and (isconf #q0) (isconf #q5) (isgrasp o10 #g2))
          :effect (isholdingmotion #q0 #t459 #q5 o10 #g2)
   )
   (:action s471_plan-holding-motion
          :parameters (#q0 #q5 o10 #g3)
          :precondition (and (isconf #q0) (isconf #q5) (isgrasp o10 #g3))
          :effect (isholdingmotion #q0 #t460 #q5 o10 #g3)
   )
   (:action s472_plan-holding-motion
          :parameters (#q0 #q6 o10 #g0)
          :precondition (and (isconf #q0) (isconf #q6) (isgrasp o10 #g0))
          :effect (isholdingmotion #q0 #t461 #q6 o10 #g0)
   )
   (:action s473_plan-holding-motion
          :parameters (#q0 #q6 o10 #g1)
          :precondition (and (isconf #q0) (isconf #q6) (isgrasp o10 #g1))
          :effect (isholdingmotion #q0 #t462 #q6 o10 #g1)
   )
   (:action s474_plan-holding-motion
          :parameters (#q0 #q6 o10 #g2)
          :precondition (and (isconf #q0) (isconf #q6) (isgrasp o10 #g2))
          :effect (isholdingmotion #q0 #t463 #q6 o10 #g2)
   )
   (:action s475_plan-holding-motion
          :parameters (#q0 #q6 o10 #g3)
          :precondition (and (isconf #q0) (isconf #q6) (isgrasp o10 #g3))
          :effect (isholdingmotion #q0 #t464 #q6 o10 #g3)
   )
   (:action s476_plan-holding-motion
          :parameters (#q0 #q7 o10 #g0)
          :precondition (and (isconf #q0) (isconf #q7) (isgrasp o10 #g0))
          :effect (isholdingmotion #q0 #t465 #q7 o10 #g0)
   )
   (:action s477_plan-holding-motion
          :parameters (#q0 #q7 o10 #g1)
          :precondition (and (isconf #q0) (isconf #q7) (isgrasp o10 #g1))
          :effect (isholdingmotion #q0 #t466 #q7 o10 #g1)
   )
   (:action s478_plan-holding-motion
          :parameters (#q0 #q7 o10 #g2)
          :precondition (and (isconf #q0) (isconf #q7) (isgrasp o10 #g2))
          :effect (isholdingmotion #q0 #t467 #q7 o10 #g2)
   )
   (:action s479_plan-holding-motion
          :parameters (#q0 #q7 o10 #g3)
          :precondition (and (isconf #q0) (isconf #q7) (isgrasp o10 #g3))
          :effect (isholdingmotion #q0 #t468 #q7 o10 #g3)
   )
   (:action s480_plan-holding-motion
          :parameters (#q0 #q8 o10 #g0)
          :precondition (and (isconf #q0) (isconf #q8) (isgrasp o10 #g0))
          :effect (isholdingmotion #q0 #t469 #q8 o10 #g0)
   )
   (:action s481_plan-holding-motion
          :parameters (#q0 #q8 o10 #g1)
          :precondition (and (isconf #q0) (isconf #q8) (isgrasp o10 #g1))
          :effect (isholdingmotion #q0 #t470 #q8 o10 #g1)
   )
   (:action s482_plan-holding-motion
          :parameters (#q0 #q8 o10 #g2)
          :precondition (and (isconf #q0) (isconf #q8) (isgrasp o10 #g2))
          :effect (isholdingmotion #q0 #t471 #q8 o10 #g2)
   )
   (:action s483_plan-holding-motion
          :parameters (#q0 #q8 o10 #g3)
          :precondition (and (isconf #q0) (isconf #q8) (isgrasp o10 #g3))
          :effect (isholdingmotion #q0 #t472 #q8 o10 #g3)
   )
   (:action s484_plan-holding-motion
          :parameters (#q0 #q9 o10 #g0)
          :precondition (and (isconf #q0) (isconf #q9) (isgrasp o10 #g0))
          :effect (isholdingmotion #q0 #t473 #q9 o10 #g0)
   )
   (:action s485_plan-holding-motion
          :parameters (#q0 #q9 o10 #g1)
          :precondition (and (isconf #q0) (isconf #q9) (isgrasp o10 #g1))
          :effect (isholdingmotion #q0 #t474 #q9 o10 #g1)
   )
   (:action s486_plan-holding-motion
          :parameters (#q0 #q9 o10 #g2)
          :precondition (and (isconf #q0) (isconf #q9) (isgrasp o10 #g2))
          :effect (isholdingmotion #q0 #t475 #q9 o10 #g2)
   )
   (:action s487_plan-holding-motion
          :parameters (#q0 #q9 o10 #g3)
          :precondition (and (isconf #q0) (isconf #q9) (isgrasp o10 #g3))
          :effect (isholdingmotion #q0 #t476 #q9 o10 #g3)
   )
   (:action s488_plan-holding-motion
          :parameters (#q0 #q10 o10 #g0)
          :precondition (and (isconf #q0) (isconf #q10) (isgrasp o10 #g0))
          :effect (isholdingmotion #q0 #t477 #q10 o10 #g0)
   )
   (:action s489_plan-holding-motion
          :parameters (#q0 #q10 o10 #g1)
          :precondition (and (isconf #q0) (isconf #q10) (isgrasp o10 #g1))
          :effect (isholdingmotion #q0 #t478 #q10 o10 #g1)
   )
   (:action s490_plan-holding-motion
          :parameters (#q0 #q10 o10 #g2)
          :precondition (and (isconf #q0) (isconf #q10) (isgrasp o10 #g2))
          :effect (isholdingmotion #q0 #t479 #q10 o10 #g2)
   )
   (:action s491_plan-holding-motion
          :parameters (#q0 #q10 o10 #g3)
          :precondition (and (isconf #q0) (isconf #q10) (isgrasp o10 #g3))
          :effect (isholdingmotion #q0 #t480 #q10 o10 #g3)
   )
   (:action s492_plan-holding-motion
          :parameters (#q0 #q11 o10 #g0)
          :precondition (and (isconf #q0) (isconf #q11) (isgrasp o10 #g0))
          :effect (isholdingmotion #q0 #t481 #q11 o10 #g0)
   )
   (:action s493_plan-holding-motion
          :parameters (#q0 #q11 o10 #g1)
          :precondition (and (isconf #q0) (isconf #q11) (isgrasp o10 #g1))
          :effect (isholdingmotion #q0 #t482 #q11 o10 #g1)
   )
   (:action s494_plan-holding-motion
          :parameters (#q0 #q11 o10 #g2)
          :precondition (and (isconf #q0) (isconf #q11) (isgrasp o10 #g2))
          :effect (isholdingmotion #q0 #t483 #q11 o10 #g2)
   )
   (:action s495_plan-holding-motion
          :parameters (#q0 #q11 o10 #g3)
          :precondition (and (isconf #q0) (isconf #q11) (isgrasp o10 #g3))
          :effect (isholdingmotion #q0 #t484 #q11 o10 #g3)
   )
   (:action s496_plan-holding-motion
          :parameters (#q0 #q12 o10 #g0)
          :precondition (and (isconf #q0) (isconf #q12) (isgrasp o10 #g0))
          :effect (isholdingmotion #q0 #t485 #q12 o10 #g0)
   )
   (:action s497_plan-holding-motion
          :parameters (#q0 #q12 o10 #g1)
          :precondition (and (isconf #q0) (isconf #q12) (isgrasp o10 #g1))
          :effect (isholdingmotion #q0 #t486 #q12 o10 #g1)
   )
   (:action s498_plan-holding-motion
          :parameters (#q0 #q12 o10 #g2)
          :precondition (and (isconf #q0) (isconf #q12) (isgrasp o10 #g2))
          :effect (isholdingmotion #q0 #t487 #q12 o10 #g2)
   )
   (:action s499_plan-holding-motion
          :parameters (#q0 #q12 o10 #g3)
          :precondition (and (isconf #q0) (isconf #q12) (isgrasp o10 #g3))
          :effect (isholdingmotion #q0 #t488 #q12 o10 #g3)
   )
   (:action s500_plan-holding-motion
          :parameters (#q0 #q13 o10 #g0)
          :precondition (and (isconf #q0) (isconf #q13) (isgrasp o10 #g0))
          :effect (isholdingmotion #q0 #t489 #q13 o10 #g0)
   )
   (:action s501_plan-holding-motion
          :parameters (#q0 #q13 o10 #g1)
          :precondition (and (isconf #q0) (isconf #q13) (isgrasp o10 #g1))
          :effect (isholdingmotion #q0 #t490 #q13 o10 #g1)
   )
   (:action s502_plan-holding-motion
          :parameters (#q0 #q13 o10 #g2)
          :precondition (and (isconf #q0) (isconf #q13) (isgrasp o10 #g2))
          :effect (isholdingmotion #q0 #t491 #q13 o10 #g2)
   )
   (:action s503_plan-holding-motion
          :parameters (#q0 #q13 o10 #g3)
          :precondition (and (isconf #q0) (isconf #q13) (isgrasp o10 #g3))
          :effect (isholdingmotion #q0 #t492 #q13 o10 #g3)
   )
   (:action s504_plan-holding-motion
          :parameters (#q0 #q14 o10 #g0)
          :precondition (and (isconf #q0) (isconf #q14) (isgrasp o10 #g0))
          :effect (isholdingmotion #q0 #t493 #q14 o10 #g0)
   )
   (:action s505_plan-holding-motion
          :parameters (#q0 #q14 o10 #g1)
          :precondition (and (isconf #q0) (isconf #q14) (isgrasp o10 #g1))
          :effect (isholdingmotion #q0 #t494 #q14 o10 #g1)
   )
   (:action s506_plan-holding-motion
          :parameters (#q0 #q14 o10 #g2)
          :precondition (and (isconf #q0) (isconf #q14) (isgrasp o10 #g2))
          :effect (isholdingmotion #q0 #t495 #q14 o10 #g2)
   )
   (:action s507_plan-holding-motion
          :parameters (#q0 #q14 o10 #g3)
          :precondition (and (isconf #q0) (isconf #q14) (isgrasp o10 #g3))
          :effect (isholdingmotion #q0 #t496 #q14 o10 #g3)
   )
   (:action s508_plan-holding-motion
          :parameters (#q0 #q15 o10 #g0)
          :precondition (and (isconf #q0) (isconf #q15) (isgrasp o10 #g0))
          :effect (isholdingmotion #q0 #t497 #q15 o10 #g0)
   )
   (:action s509_plan-holding-motion
          :parameters (#q0 #q15 o10 #g1)
          :precondition (and (isconf #q0) (isconf #q15) (isgrasp o10 #g1))
          :effect (isholdingmotion #q0 #t498 #q15 o10 #g1)
   )
   (:action s510_plan-holding-motion
          :parameters (#q0 #q15 o10 #g2)
          :precondition (and (isconf #q0) (isconf #q15) (isgrasp o10 #g2))
          :effect (isholdingmotion #q0 #t499 #q15 o10 #g2)
   )
   (:action s511_plan-holding-motion
          :parameters (#q0 #q15 o10 #g3)
          :precondition (and (isconf #q0) (isconf #q15) (isgrasp o10 #g3))
          :effect (isholdingmotion #q0 #t500 #q15 o10 #g3)
   )
   (:action s512_plan-holding-motion
          :parameters (#q1 #q4 o10 #g0)
          :precondition (and (isconf #q1) (isconf #q4) (isgrasp o10 #g0))
          :effect (isholdingmotion #q1 #t501 #q4 o10 #g0)
   )
   (:action s513_plan-holding-motion
          :parameters (#q1 #q4 o10 #g1)
          :precondition (and (isconf #q1) (isconf #q4) (isgrasp o10 #g1))
          :effect (isholdingmotion #q1 #t502 #q4 o10 #g1)
   )
   (:action s514_plan-holding-motion
          :parameters (#q1 #q4 o10 #g2)
          :precondition (and (isconf #q1) (isconf #q4) (isgrasp o10 #g2))
          :effect (isholdingmotion #q1 #t503 #q4 o10 #g2)
   )
   (:action s515_plan-holding-motion
          :parameters (#q1 #q4 o10 #g3)
          :precondition (and (isconf #q1) (isconf #q4) (isgrasp o10 #g3))
          :effect (isholdingmotion #q1 #t504 #q4 o10 #g3)
   )
   (:action s516_plan-holding-motion
          :parameters (#q1 #q5 o10 #g0)
          :precondition (and (isconf #q1) (isconf #q5) (isgrasp o10 #g0))
          :effect (isholdingmotion #q1 #t505 #q5 o10 #g0)
   )
   (:action s517_plan-holding-motion
          :parameters (#q1 #q5 o10 #g1)
          :precondition (and (isconf #q1) (isconf #q5) (isgrasp o10 #g1))
          :effect (isholdingmotion #q1 #t506 #q5 o10 #g1)
   )
   (:action s518_plan-holding-motion
          :parameters (#q1 #q5 o10 #g2)
          :precondition (and (isconf #q1) (isconf #q5) (isgrasp o10 #g2))
          :effect (isholdingmotion #q1 #t507 #q5 o10 #g2)
   )
   (:action s519_plan-holding-motion
          :parameters (#q1 #q5 o10 #g3)
          :precondition (and (isconf #q1) (isconf #q5) (isgrasp o10 #g3))
          :effect (isholdingmotion #q1 #t508 #q5 o10 #g3)
   )
   (:action s520_plan-holding-motion
          :parameters (#q1 #q6 o10 #g0)
          :precondition (and (isconf #q1) (isconf #q6) (isgrasp o10 #g0))
          :effect (isholdingmotion #q1 #t509 #q6 o10 #g0)
   )
   (:action s521_plan-holding-motion
          :parameters (#q1 #q6 o10 #g1)
          :precondition (and (isconf #q1) (isconf #q6) (isgrasp o10 #g1))
          :effect (isholdingmotion #q1 #t510 #q6 o10 #g1)
   )
   (:action s522_plan-holding-motion
          :parameters (#q1 #q6 o10 #g2)
          :precondition (and (isconf #q1) (isconf #q6) (isgrasp o10 #g2))
          :effect (isholdingmotion #q1 #t511 #q6 o10 #g2)
   )
   (:action s523_plan-holding-motion
          :parameters (#q1 #q6 o10 #g3)
          :precondition (and (isconf #q1) (isconf #q6) (isgrasp o10 #g3))
          :effect (isholdingmotion #q1 #t512 #q6 o10 #g3)
   )
   (:action s524_plan-holding-motion
          :parameters (#q1 #q7 o10 #g0)
          :precondition (and (isconf #q1) (isconf #q7) (isgrasp o10 #g0))
          :effect (isholdingmotion #q1 #t513 #q7 o10 #g0)
   )
   (:action s525_plan-holding-motion
          :parameters (#q1 #q7 o10 #g1)
          :precondition (and (isconf #q1) (isconf #q7) (isgrasp o10 #g1))
          :effect (isholdingmotion #q1 #t514 #q7 o10 #g1)
   )
   (:action s526_plan-holding-motion
          :parameters (#q1 #q7 o10 #g2)
          :precondition (and (isconf #q1) (isconf #q7) (isgrasp o10 #g2))
          :effect (isholdingmotion #q1 #t515 #q7 o10 #g2)
   )
   (:action s527_plan-holding-motion
          :parameters (#q1 #q7 o10 #g3)
          :precondition (and (isconf #q1) (isconf #q7) (isgrasp o10 #g3))
          :effect (isholdingmotion #q1 #t516 #q7 o10 #g3)
   )
   (:action s528_plan-holding-motion
          :parameters (#q1 #q8 o10 #g0)
          :precondition (and (isconf #q1) (isconf #q8) (isgrasp o10 #g0))
          :effect (isholdingmotion #q1 #t517 #q8 o10 #g0)
   )
   (:action s529_plan-holding-motion
          :parameters (#q1 #q8 o10 #g1)
          :precondition (and (isconf #q1) (isconf #q8) (isgrasp o10 #g1))
          :effect (isholdingmotion #q1 #t518 #q8 o10 #g1)
   )
   (:action s530_plan-holding-motion
          :parameters (#q1 #q8 o10 #g2)
          :precondition (and (isconf #q1) (isconf #q8) (isgrasp o10 #g2))
          :effect (isholdingmotion #q1 #t519 #q8 o10 #g2)
   )
   (:action s531_plan-holding-motion
          :parameters (#q1 #q8 o10 #g3)
          :precondition (and (isconf #q1) (isconf #q8) (isgrasp o10 #g3))
          :effect (isholdingmotion #q1 #t520 #q8 o10 #g3)
   )
   (:action s532_plan-holding-motion
          :parameters (#q1 #q9 o10 #g0)
          :precondition (and (isconf #q1) (isconf #q9) (isgrasp o10 #g0))
          :effect (isholdingmotion #q1 #t521 #q9 o10 #g0)
   )
   (:action s533_plan-holding-motion
          :parameters (#q1 #q9 o10 #g1)
          :precondition (and (isconf #q1) (isconf #q9) (isgrasp o10 #g1))
          :effect (isholdingmotion #q1 #t522 #q9 o10 #g1)
   )
   (:action s534_plan-holding-motion
          :parameters (#q1 #q9 o10 #g2)
          :precondition (and (isconf #q1) (isconf #q9) (isgrasp o10 #g2))
          :effect (isholdingmotion #q1 #t523 #q9 o10 #g2)
   )
   (:action s535_plan-holding-motion
          :parameters (#q1 #q9 o10 #g3)
          :precondition (and (isconf #q1) (isconf #q9) (isgrasp o10 #g3))
          :effect (isholdingmotion #q1 #t524 #q9 o10 #g3)
   )
   (:action s536_plan-holding-motion
          :parameters (#q1 #q10 o10 #g0)
          :precondition (and (isconf #q1) (isconf #q10) (isgrasp o10 #g0))
          :effect (isholdingmotion #q1 #t525 #q10 o10 #g0)
   )
   (:action s537_plan-holding-motion
          :parameters (#q1 #q10 o10 #g1)
          :precondition (and (isconf #q1) (isconf #q10) (isgrasp o10 #g1))
          :effect (isholdingmotion #q1 #t526 #q10 o10 #g1)
   )
   (:action s538_plan-holding-motion
          :parameters (#q1 #q10 o10 #g2)
          :precondition (and (isconf #q1) (isconf #q10) (isgrasp o10 #g2))
          :effect (isholdingmotion #q1 #t527 #q10 o10 #g2)
   )
   (:action s539_plan-holding-motion
          :parameters (#q1 #q10 o10 #g3)
          :precondition (and (isconf #q1) (isconf #q10) (isgrasp o10 #g3))
          :effect (isholdingmotion #q1 #t528 #q10 o10 #g3)
   )
   (:action s540_plan-holding-motion
          :parameters (#q1 #q11 o10 #g0)
          :precondition (and (isconf #q1) (isconf #q11) (isgrasp o10 #g0))
          :effect (isholdingmotion #q1 #t529 #q11 o10 #g0)
   )
   (:action s541_plan-holding-motion
          :parameters (#q1 #q11 o10 #g1)
          :precondition (and (isconf #q1) (isconf #q11) (isgrasp o10 #g1))
          :effect (isholdingmotion #q1 #t530 #q11 o10 #g1)
   )
   (:action s542_plan-holding-motion
          :parameters (#q1 #q11 o10 #g2)
          :precondition (and (isconf #q1) (isconf #q11) (isgrasp o10 #g2))
          :effect (isholdingmotion #q1 #t531 #q11 o10 #g2)
   )
   (:action s543_plan-holding-motion
          :parameters (#q1 #q11 o10 #g3)
          :precondition (and (isconf #q1) (isconf #q11) (isgrasp o10 #g3))
          :effect (isholdingmotion #q1 #t532 #q11 o10 #g3)
   )
   (:action s544_plan-holding-motion
          :parameters (#q1 #q12 o10 #g0)
          :precondition (and (isconf #q1) (isconf #q12) (isgrasp o10 #g0))
          :effect (isholdingmotion #q1 #t533 #q12 o10 #g0)
   )
   (:action s545_plan-holding-motion
          :parameters (#q1 #q12 o10 #g1)
          :precondition (and (isconf #q1) (isconf #q12) (isgrasp o10 #g1))
          :effect (isholdingmotion #q1 #t534 #q12 o10 #g1)
   )
   (:action s546_plan-holding-motion
          :parameters (#q1 #q12 o10 #g2)
          :precondition (and (isconf #q1) (isconf #q12) (isgrasp o10 #g2))
          :effect (isholdingmotion #q1 #t535 #q12 o10 #g2)
   )
   (:action s547_plan-holding-motion
          :parameters (#q1 #q12 o10 #g3)
          :precondition (and (isconf #q1) (isconf #q12) (isgrasp o10 #g3))
          :effect (isholdingmotion #q1 #t536 #q12 o10 #g3)
   )
   (:action s548_plan-holding-motion
          :parameters (#q1 #q13 o10 #g0)
          :precondition (and (isconf #q1) (isconf #q13) (isgrasp o10 #g0))
          :effect (isholdingmotion #q1 #t537 #q13 o10 #g0)
   )
   (:action s549_plan-holding-motion
          :parameters (#q1 #q13 o10 #g1)
          :precondition (and (isconf #q1) (isconf #q13) (isgrasp o10 #g1))
          :effect (isholdingmotion #q1 #t538 #q13 o10 #g1)
   )
   (:action s550_plan-holding-motion
          :parameters (#q1 #q13 o10 #g2)
          :precondition (and (isconf #q1) (isconf #q13) (isgrasp o10 #g2))
          :effect (isholdingmotion #q1 #t539 #q13 o10 #g2)
   )
   (:action s551_plan-holding-motion
          :parameters (#q1 #q13 o10 #g3)
          :precondition (and (isconf #q1) (isconf #q13) (isgrasp o10 #g3))
          :effect (isholdingmotion #q1 #t540 #q13 o10 #g3)
   )
   (:action s552_plan-holding-motion
          :parameters (#q1 #q14 o10 #g0)
          :precondition (and (isconf #q1) (isconf #q14) (isgrasp o10 #g0))
          :effect (isholdingmotion #q1 #t541 #q14 o10 #g0)
   )
   (:action s553_plan-holding-motion
          :parameters (#q1 #q14 o10 #g1)
          :precondition (and (isconf #q1) (isconf #q14) (isgrasp o10 #g1))
          :effect (isholdingmotion #q1 #t542 #q14 o10 #g1)
   )
   (:action s554_plan-holding-motion
          :parameters (#q1 #q14 o10 #g2)
          :precondition (and (isconf #q1) (isconf #q14) (isgrasp o10 #g2))
          :effect (isholdingmotion #q1 #t543 #q14 o10 #g2)
   )
   (:action s555_plan-holding-motion
          :parameters (#q1 #q14 o10 #g3)
          :precondition (and (isconf #q1) (isconf #q14) (isgrasp o10 #g3))
          :effect (isholdingmotion #q1 #t544 #q14 o10 #g3)
   )
   (:action s556_plan-holding-motion
          :parameters (#q1 #q15 o10 #g0)
          :precondition (and (isconf #q1) (isconf #q15) (isgrasp o10 #g0))
          :effect (isholdingmotion #q1 #t545 #q15 o10 #g0)
   )
   (:action s557_plan-holding-motion
          :parameters (#q1 #q15 o10 #g1)
          :precondition (and (isconf #q1) (isconf #q15) (isgrasp o10 #g1))
          :effect (isholdingmotion #q1 #t546 #q15 o10 #g1)
   )
   (:action s558_plan-holding-motion
          :parameters (#q1 #q15 o10 #g2)
          :precondition (and (isconf #q1) (isconf #q15) (isgrasp o10 #g2))
          :effect (isholdingmotion #q1 #t547 #q15 o10 #g2)
   )
   (:action s559_plan-holding-motion
          :parameters (#q1 #q15 o10 #g3)
          :precondition (and (isconf #q1) (isconf #q15) (isgrasp o10 #g3))
          :effect (isholdingmotion #q1 #t548 #q15 o10 #g3)
   )
   (:action s560_plan-holding-motion
          :parameters (#q2 #q4 o10 #g0)
          :precondition (and (isconf #q2) (isconf #q4) (isgrasp o10 #g0))
          :effect (isholdingmotion #q2 #t549 #q4 o10 #g0)
   )
   (:action s561_plan-holding-motion
          :parameters (#q2 #q4 o10 #g1)
          :precondition (and (isconf #q2) (isconf #q4) (isgrasp o10 #g1))
          :effect (isholdingmotion #q2 #t550 #q4 o10 #g1)
   )
   (:action s562_plan-holding-motion
          :parameters (#q2 #q4 o10 #g2)
          :precondition (and (isconf #q2) (isconf #q4) (isgrasp o10 #g2))
          :effect (isholdingmotion #q2 #t551 #q4 o10 #g2)
   )
   (:action s563_plan-holding-motion
          :parameters (#q2 #q4 o10 #g3)
          :precondition (and (isconf #q2) (isconf #q4) (isgrasp o10 #g3))
          :effect (isholdingmotion #q2 #t552 #q4 o10 #g3)
   )
   (:action s564_plan-holding-motion
          :parameters (#q2 #q5 o10 #g0)
          :precondition (and (isconf #q2) (isconf #q5) (isgrasp o10 #g0))
          :effect (isholdingmotion #q2 #t553 #q5 o10 #g0)
   )
   (:action s565_plan-holding-motion
          :parameters (#q2 #q5 o10 #g1)
          :precondition (and (isconf #q2) (isconf #q5) (isgrasp o10 #g1))
          :effect (isholdingmotion #q2 #t554 #q5 o10 #g1)
   )
   (:action s566_plan-holding-motion
          :parameters (#q2 #q5 o10 #g2)
          :precondition (and (isconf #q2) (isconf #q5) (isgrasp o10 #g2))
          :effect (isholdingmotion #q2 #t555 #q5 o10 #g2)
   )
   (:action s567_plan-holding-motion
          :parameters (#q2 #q5 o10 #g3)
          :precondition (and (isconf #q2) (isconf #q5) (isgrasp o10 #g3))
          :effect (isholdingmotion #q2 #t556 #q5 o10 #g3)
   )
   (:action s568_plan-holding-motion
          :parameters (#q2 #q6 o10 #g0)
          :precondition (and (isconf #q2) (isconf #q6) (isgrasp o10 #g0))
          :effect (isholdingmotion #q2 #t557 #q6 o10 #g0)
   )
   (:action s569_plan-holding-motion
          :parameters (#q2 #q6 o10 #g1)
          :precondition (and (isconf #q2) (isconf #q6) (isgrasp o10 #g1))
          :effect (isholdingmotion #q2 #t558 #q6 o10 #g1)
   )
   (:action s570_plan-holding-motion
          :parameters (#q2 #q6 o10 #g2)
          :precondition (and (isconf #q2) (isconf #q6) (isgrasp o10 #g2))
          :effect (isholdingmotion #q2 #t559 #q6 o10 #g2)
   )
   (:action s571_plan-holding-motion
          :parameters (#q2 #q6 o10 #g3)
          :precondition (and (isconf #q2) (isconf #q6) (isgrasp o10 #g3))
          :effect (isholdingmotion #q2 #t560 #q6 o10 #g3)
   )
   (:action s572_plan-holding-motion
          :parameters (#q2 #q7 o10 #g0)
          :precondition (and (isconf #q2) (isconf #q7) (isgrasp o10 #g0))
          :effect (isholdingmotion #q2 #t561 #q7 o10 #g0)
   )
   (:action s573_plan-holding-motion
          :parameters (#q2 #q7 o10 #g1)
          :precondition (and (isconf #q2) (isconf #q7) (isgrasp o10 #g1))
          :effect (isholdingmotion #q2 #t562 #q7 o10 #g1)
   )
   (:action s574_plan-holding-motion
          :parameters (#q2 #q7 o10 #g2)
          :precondition (and (isconf #q2) (isconf #q7) (isgrasp o10 #g2))
          :effect (isholdingmotion #q2 #t563 #q7 o10 #g2)
   )
   (:action s575_plan-holding-motion
          :parameters (#q2 #q7 o10 #g3)
          :precondition (and (isconf #q2) (isconf #q7) (isgrasp o10 #g3))
          :effect (isholdingmotion #q2 #t564 #q7 o10 #g3)
   )
   (:action s576_plan-holding-motion
          :parameters (#q2 #q8 o10 #g0)
          :precondition (and (isconf #q2) (isconf #q8) (isgrasp o10 #g0))
          :effect (isholdingmotion #q2 #t565 #q8 o10 #g0)
   )
   (:action s577_plan-holding-motion
          :parameters (#q2 #q8 o10 #g1)
          :precondition (and (isconf #q2) (isconf #q8) (isgrasp o10 #g1))
          :effect (isholdingmotion #q2 #t566 #q8 o10 #g1)
   )
   (:action s578_plan-holding-motion
          :parameters (#q2 #q8 o10 #g2)
          :precondition (and (isconf #q2) (isconf #q8) (isgrasp o10 #g2))
          :effect (isholdingmotion #q2 #t567 #q8 o10 #g2)
   )
   (:action s579_plan-holding-motion
          :parameters (#q2 #q8 o10 #g3)
          :precondition (and (isconf #q2) (isconf #q8) (isgrasp o10 #g3))
          :effect (isholdingmotion #q2 #t568 #q8 o10 #g3)
   )
   (:action s580_plan-holding-motion
          :parameters (#q2 #q9 o10 #g0)
          :precondition (and (isconf #q2) (isconf #q9) (isgrasp o10 #g0))
          :effect (isholdingmotion #q2 #t569 #q9 o10 #g0)
   )
   (:action s581_plan-holding-motion
          :parameters (#q2 #q9 o10 #g1)
          :precondition (and (isconf #q2) (isconf #q9) (isgrasp o10 #g1))
          :effect (isholdingmotion #q2 #t570 #q9 o10 #g1)
   )
   (:action s582_plan-holding-motion
          :parameters (#q2 #q9 o10 #g2)
          :precondition (and (isconf #q2) (isconf #q9) (isgrasp o10 #g2))
          :effect (isholdingmotion #q2 #t571 #q9 o10 #g2)
   )
   (:action s583_plan-holding-motion
          :parameters (#q2 #q9 o10 #g3)
          :precondition (and (isconf #q2) (isconf #q9) (isgrasp o10 #g3))
          :effect (isholdingmotion #q2 #t572 #q9 o10 #g3)
   )
   (:action s584_plan-holding-motion
          :parameters (#q2 #q10 o10 #g0)
          :precondition (and (isconf #q2) (isconf #q10) (isgrasp o10 #g0))
          :effect (isholdingmotion #q2 #t573 #q10 o10 #g0)
   )
   (:action s585_plan-holding-motion
          :parameters (#q2 #q10 o10 #g1)
          :precondition (and (isconf #q2) (isconf #q10) (isgrasp o10 #g1))
          :effect (isholdingmotion #q2 #t574 #q10 o10 #g1)
   )
   (:action s586_plan-holding-motion
          :parameters (#q2 #q10 o10 #g2)
          :precondition (and (isconf #q2) (isconf #q10) (isgrasp o10 #g2))
          :effect (isholdingmotion #q2 #t575 #q10 o10 #g2)
   )
   (:action s587_plan-holding-motion
          :parameters (#q2 #q10 o10 #g3)
          :precondition (and (isconf #q2) (isconf #q10) (isgrasp o10 #g3))
          :effect (isholdingmotion #q2 #t576 #q10 o10 #g3)
   )
   (:action s588_plan-holding-motion
          :parameters (#q2 #q11 o10 #g0)
          :precondition (and (isconf #q2) (isconf #q11) (isgrasp o10 #g0))
          :effect (isholdingmotion #q2 #t577 #q11 o10 #g0)
   )
   (:action s589_plan-holding-motion
          :parameters (#q2 #q11 o10 #g1)
          :precondition (and (isconf #q2) (isconf #q11) (isgrasp o10 #g1))
          :effect (isholdingmotion #q2 #t578 #q11 o10 #g1)
   )
   (:action s590_plan-holding-motion
          :parameters (#q2 #q11 o10 #g2)
          :precondition (and (isconf #q2) (isconf #q11) (isgrasp o10 #g2))
          :effect (isholdingmotion #q2 #t579 #q11 o10 #g2)
   )
   (:action s591_plan-holding-motion
          :parameters (#q2 #q11 o10 #g3)
          :precondition (and (isconf #q2) (isconf #q11) (isgrasp o10 #g3))
          :effect (isholdingmotion #q2 #t580 #q11 o10 #g3)
   )
   (:action s592_plan-holding-motion
          :parameters (#q2 #q12 o10 #g0)
          :precondition (and (isconf #q2) (isconf #q12) (isgrasp o10 #g0))
          :effect (isholdingmotion #q2 #t581 #q12 o10 #g0)
   )
   (:action s593_plan-holding-motion
          :parameters (#q2 #q12 o10 #g1)
          :precondition (and (isconf #q2) (isconf #q12) (isgrasp o10 #g1))
          :effect (isholdingmotion #q2 #t582 #q12 o10 #g1)
   )
   (:action s594_plan-holding-motion
          :parameters (#q2 #q12 o10 #g2)
          :precondition (and (isconf #q2) (isconf #q12) (isgrasp o10 #g2))
          :effect (isholdingmotion #q2 #t583 #q12 o10 #g2)
   )
   (:action s595_plan-holding-motion
          :parameters (#q2 #q12 o10 #g3)
          :precondition (and (isconf #q2) (isconf #q12) (isgrasp o10 #g3))
          :effect (isholdingmotion #q2 #t584 #q12 o10 #g3)
   )
   (:action s596_plan-holding-motion
          :parameters (#q2 #q13 o10 #g0)
          :precondition (and (isconf #q2) (isconf #q13) (isgrasp o10 #g0))
          :effect (isholdingmotion #q2 #t585 #q13 o10 #g0)
   )
   (:action s597_plan-holding-motion
          :parameters (#q2 #q13 o10 #g1)
          :precondition (and (isconf #q2) (isconf #q13) (isgrasp o10 #g1))
          :effect (isholdingmotion #q2 #t586 #q13 o10 #g1)
   )
   (:action s598_plan-holding-motion
          :parameters (#q2 #q13 o10 #g2)
          :precondition (and (isconf #q2) (isconf #q13) (isgrasp o10 #g2))
          :effect (isholdingmotion #q2 #t587 #q13 o10 #g2)
   )
   (:action s599_plan-holding-motion
          :parameters (#q2 #q13 o10 #g3)
          :precondition (and (isconf #q2) (isconf #q13) (isgrasp o10 #g3))
          :effect (isholdingmotion #q2 #t588 #q13 o10 #g3)
   )
   (:action s600_plan-holding-motion
          :parameters (#q2 #q14 o10 #g0)
          :precondition (and (isconf #q2) (isconf #q14) (isgrasp o10 #g0))
          :effect (isholdingmotion #q2 #t589 #q14 o10 #g0)
   )
   (:action s601_plan-holding-motion
          :parameters (#q2 #q14 o10 #g1)
          :precondition (and (isconf #q2) (isconf #q14) (isgrasp o10 #g1))
          :effect (isholdingmotion #q2 #t590 #q14 o10 #g1)
   )
   (:action s602_plan-holding-motion
          :parameters (#q2 #q14 o10 #g2)
          :precondition (and (isconf #q2) (isconf #q14) (isgrasp o10 #g2))
          :effect (isholdingmotion #q2 #t591 #q14 o10 #g2)
   )
   (:action s603_plan-holding-motion
          :parameters (#q2 #q14 o10 #g3)
          :precondition (and (isconf #q2) (isconf #q14) (isgrasp o10 #g3))
          :effect (isholdingmotion #q2 #t592 #q14 o10 #g3)
   )
   (:action s604_plan-holding-motion
          :parameters (#q2 #q15 o10 #g0)
          :precondition (and (isconf #q2) (isconf #q15) (isgrasp o10 #g0))
          :effect (isholdingmotion #q2 #t593 #q15 o10 #g0)
   )
   (:action s605_plan-holding-motion
          :parameters (#q2 #q15 o10 #g1)
          :precondition (and (isconf #q2) (isconf #q15) (isgrasp o10 #g1))
          :effect (isholdingmotion #q2 #t594 #q15 o10 #g1)
   )
   (:action s606_plan-holding-motion
          :parameters (#q2 #q15 o10 #g2)
          :precondition (and (isconf #q2) (isconf #q15) (isgrasp o10 #g2))
          :effect (isholdingmotion #q2 #t595 #q15 o10 #g2)
   )
   (:action s607_plan-holding-motion
          :parameters (#q2 #q15 o10 #g3)
          :precondition (and (isconf #q2) (isconf #q15) (isgrasp o10 #g3))
          :effect (isholdingmotion #q2 #t596 #q15 o10 #g3)
   )
   (:action s608_plan-holding-motion
          :parameters (#q3 #q4 o10 #g0)
          :precondition (and (isconf #q3) (isconf #q4) (isgrasp o10 #g0))
          :effect (isholdingmotion #q3 #t597 #q4 o10 #g0)
   )
   (:action s609_plan-holding-motion
          :parameters (#q3 #q4 o10 #g1)
          :precondition (and (isconf #q3) (isconf #q4) (isgrasp o10 #g1))
          :effect (isholdingmotion #q3 #t598 #q4 o10 #g1)
   )
   (:action s610_plan-holding-motion
          :parameters (#q3 #q4 o10 #g2)
          :precondition (and (isconf #q3) (isconf #q4) (isgrasp o10 #g2))
          :effect (isholdingmotion #q3 #t599 #q4 o10 #g2)
   )
   (:action s611_plan-holding-motion
          :parameters (#q3 #q4 o10 #g3)
          :precondition (and (isconf #q3) (isconf #q4) (isgrasp o10 #g3))
          :effect (isholdingmotion #q3 #t600 #q4 o10 #g3)
   )
   (:action s612_plan-holding-motion
          :parameters (#q3 #q5 o10 #g0)
          :precondition (and (isconf #q3) (isconf #q5) (isgrasp o10 #g0))
          :effect (isholdingmotion #q3 #t601 #q5 o10 #g0)
   )
   (:action s613_plan-holding-motion
          :parameters (#q3 #q5 o10 #g1)
          :precondition (and (isconf #q3) (isconf #q5) (isgrasp o10 #g1))
          :effect (isholdingmotion #q3 #t602 #q5 o10 #g1)
   )
   (:action s614_plan-holding-motion
          :parameters (#q3 #q5 o10 #g2)
          :precondition (and (isconf #q3) (isconf #q5) (isgrasp o10 #g2))
          :effect (isholdingmotion #q3 #t603 #q5 o10 #g2)
   )
   (:action s615_plan-holding-motion
          :parameters (#q3 #q5 o10 #g3)
          :precondition (and (isconf #q3) (isconf #q5) (isgrasp o10 #g3))
          :effect (isholdingmotion #q3 #t604 #q5 o10 #g3)
   )
   (:action s616_plan-holding-motion
          :parameters (#q3 #q6 o10 #g0)
          :precondition (and (isconf #q3) (isconf #q6) (isgrasp o10 #g0))
          :effect (isholdingmotion #q3 #t605 #q6 o10 #g0)
   )
   (:action s617_plan-holding-motion
          :parameters (#q3 #q6 o10 #g1)
          :precondition (and (isconf #q3) (isconf #q6) (isgrasp o10 #g1))
          :effect (isholdingmotion #q3 #t606 #q6 o10 #g1)
   )
   (:action s618_plan-holding-motion
          :parameters (#q3 #q6 o10 #g2)
          :precondition (and (isconf #q3) (isconf #q6) (isgrasp o10 #g2))
          :effect (isholdingmotion #q3 #t607 #q6 o10 #g2)
   )
   (:action s619_plan-holding-motion
          :parameters (#q3 #q6 o10 #g3)
          :precondition (and (isconf #q3) (isconf #q6) (isgrasp o10 #g3))
          :effect (isholdingmotion #q3 #t608 #q6 o10 #g3)
   )
   (:action s620_plan-holding-motion
          :parameters (#q3 #q7 o10 #g0)
          :precondition (and (isconf #q3) (isconf #q7) (isgrasp o10 #g0))
          :effect (isholdingmotion #q3 #t609 #q7 o10 #g0)
   )
   (:action s621_plan-holding-motion
          :parameters (#q3 #q7 o10 #g1)
          :precondition (and (isconf #q3) (isconf #q7) (isgrasp o10 #g1))
          :effect (isholdingmotion #q3 #t610 #q7 o10 #g1)
   )
   (:action s622_plan-holding-motion
          :parameters (#q3 #q7 o10 #g2)
          :precondition (and (isconf #q3) (isconf #q7) (isgrasp o10 #g2))
          :effect (isholdingmotion #q3 #t611 #q7 o10 #g2)
   )
   (:action s623_plan-holding-motion
          :parameters (#q3 #q7 o10 #g3)
          :precondition (and (isconf #q3) (isconf #q7) (isgrasp o10 #g3))
          :effect (isholdingmotion #q3 #t612 #q7 o10 #g3)
   )
   (:action s624_plan-holding-motion
          :parameters (#q3 #q8 o10 #g0)
          :precondition (and (isconf #q3) (isconf #q8) (isgrasp o10 #g0))
          :effect (isholdingmotion #q3 #t613 #q8 o10 #g0)
   )
   (:action s625_plan-holding-motion
          :parameters (#q3 #q8 o10 #g1)
          :precondition (and (isconf #q3) (isconf #q8) (isgrasp o10 #g1))
          :effect (isholdingmotion #q3 #t614 #q8 o10 #g1)
   )
   (:action s626_plan-holding-motion
          :parameters (#q3 #q8 o10 #g2)
          :precondition (and (isconf #q3) (isconf #q8) (isgrasp o10 #g2))
          :effect (isholdingmotion #q3 #t615 #q8 o10 #g2)
   )
   (:action s627_plan-holding-motion
          :parameters (#q3 #q8 o10 #g3)
          :precondition (and (isconf #q3) (isconf #q8) (isgrasp o10 #g3))
          :effect (isholdingmotion #q3 #t616 #q8 o10 #g3)
   )
   (:action s628_plan-holding-motion
          :parameters (#q3 #q9 o10 #g0)
          :precondition (and (isconf #q3) (isconf #q9) (isgrasp o10 #g0))
          :effect (isholdingmotion #q3 #t617 #q9 o10 #g0)
   )
   (:action s629_plan-holding-motion
          :parameters (#q3 #q9 o10 #g1)
          :precondition (and (isconf #q3) (isconf #q9) (isgrasp o10 #g1))
          :effect (isholdingmotion #q3 #t618 #q9 o10 #g1)
   )
   (:action s630_plan-holding-motion
          :parameters (#q3 #q9 o10 #g2)
          :precondition (and (isconf #q3) (isconf #q9) (isgrasp o10 #g2))
          :effect (isholdingmotion #q3 #t619 #q9 o10 #g2)
   )
   (:action s631_plan-holding-motion
          :parameters (#q3 #q9 o10 #g3)
          :precondition (and (isconf #q3) (isconf #q9) (isgrasp o10 #g3))
          :effect (isholdingmotion #q3 #t620 #q9 o10 #g3)
   )
   (:action s632_plan-holding-motion
          :parameters (#q3 #q10 o10 #g0)
          :precondition (and (isconf #q3) (isconf #q10) (isgrasp o10 #g0))
          :effect (isholdingmotion #q3 #t621 #q10 o10 #g0)
   )
   (:action s633_plan-holding-motion
          :parameters (#q3 #q10 o10 #g1)
          :precondition (and (isconf #q3) (isconf #q10) (isgrasp o10 #g1))
          :effect (isholdingmotion #q3 #t622 #q10 o10 #g1)
   )
   (:action s634_plan-holding-motion
          :parameters (#q3 #q10 o10 #g2)
          :precondition (and (isconf #q3) (isconf #q10) (isgrasp o10 #g2))
          :effect (isholdingmotion #q3 #t623 #q10 o10 #g2)
   )
   (:action s635_plan-holding-motion
          :parameters (#q3 #q10 o10 #g3)
          :precondition (and (isconf #q3) (isconf #q10) (isgrasp o10 #g3))
          :effect (isholdingmotion #q3 #t624 #q10 o10 #g3)
   )
   (:action s636_plan-holding-motion
          :parameters (#q3 #q11 o10 #g0)
          :precondition (and (isconf #q3) (isconf #q11) (isgrasp o10 #g0))
          :effect (isholdingmotion #q3 #t625 #q11 o10 #g0)
   )
   (:action s637_plan-holding-motion
          :parameters (#q3 #q11 o10 #g1)
          :precondition (and (isconf #q3) (isconf #q11) (isgrasp o10 #g1))
          :effect (isholdingmotion #q3 #t626 #q11 o10 #g1)
   )
   (:action s638_plan-holding-motion
          :parameters (#q3 #q11 o10 #g2)
          :precondition (and (isconf #q3) (isconf #q11) (isgrasp o10 #g2))
          :effect (isholdingmotion #q3 #t627 #q11 o10 #g2)
   )
   (:action s639_plan-holding-motion
          :parameters (#q3 #q11 o10 #g3)
          :precondition (and (isconf #q3) (isconf #q11) (isgrasp o10 #g3))
          :effect (isholdingmotion #q3 #t628 #q11 o10 #g3)
   )
   (:action s640_plan-holding-motion
          :parameters (#q3 #q12 o10 #g0)
          :precondition (and (isconf #q3) (isconf #q12) (isgrasp o10 #g0))
          :effect (isholdingmotion #q3 #t629 #q12 o10 #g0)
   )
   (:action s641_plan-holding-motion
          :parameters (#q3 #q12 o10 #g1)
          :precondition (and (isconf #q3) (isconf #q12) (isgrasp o10 #g1))
          :effect (isholdingmotion #q3 #t630 #q12 o10 #g1)
   )
   (:action s642_plan-holding-motion
          :parameters (#q3 #q12 o10 #g2)
          :precondition (and (isconf #q3) (isconf #q12) (isgrasp o10 #g2))
          :effect (isholdingmotion #q3 #t631 #q12 o10 #g2)
   )
   (:action s643_plan-holding-motion
          :parameters (#q3 #q12 o10 #g3)
          :precondition (and (isconf #q3) (isconf #q12) (isgrasp o10 #g3))
          :effect (isholdingmotion #q3 #t632 #q12 o10 #g3)
   )
   (:action s644_plan-holding-motion
          :parameters (#q3 #q13 o10 #g0)
          :precondition (and (isconf #q3) (isconf #q13) (isgrasp o10 #g0))
          :effect (isholdingmotion #q3 #t633 #q13 o10 #g0)
   )
   (:action s645_plan-holding-motion
          :parameters (#q3 #q13 o10 #g1)
          :precondition (and (isconf #q3) (isconf #q13) (isgrasp o10 #g1))
          :effect (isholdingmotion #q3 #t634 #q13 o10 #g1)
   )
   (:action s646_plan-holding-motion
          :parameters (#q3 #q13 o10 #g2)
          :precondition (and (isconf #q3) (isconf #q13) (isgrasp o10 #g2))
          :effect (isholdingmotion #q3 #t635 #q13 o10 #g2)
   )
   (:action s647_plan-holding-motion
          :parameters (#q3 #q13 o10 #g3)
          :precondition (and (isconf #q3) (isconf #q13) (isgrasp o10 #g3))
          :effect (isholdingmotion #q3 #t636 #q13 o10 #g3)
   )
   (:action s648_plan-holding-motion
          :parameters (#q3 #q14 o10 #g0)
          :precondition (and (isconf #q3) (isconf #q14) (isgrasp o10 #g0))
          :effect (isholdingmotion #q3 #t637 #q14 o10 #g0)
   )
   (:action s649_plan-holding-motion
          :parameters (#q3 #q14 o10 #g1)
          :precondition (and (isconf #q3) (isconf #q14) (isgrasp o10 #g1))
          :effect (isholdingmotion #q3 #t638 #q14 o10 #g1)
   )
   (:action s650_plan-holding-motion
          :parameters (#q3 #q14 o10 #g2)
          :precondition (and (isconf #q3) (isconf #q14) (isgrasp o10 #g2))
          :effect (isholdingmotion #q3 #t639 #q14 o10 #g2)
   )
   (:action s651_plan-holding-motion
          :parameters (#q3 #q14 o10 #g3)
          :precondition (and (isconf #q3) (isconf #q14) (isgrasp o10 #g3))
          :effect (isholdingmotion #q3 #t640 #q14 o10 #g3)
   )
   (:action s652_plan-holding-motion
          :parameters (#q3 #q15 o10 #g0)
          :precondition (and (isconf #q3) (isconf #q15) (isgrasp o10 #g0))
          :effect (isholdingmotion #q3 #t641 #q15 o10 #g0)
   )
   (:action s653_plan-holding-motion
          :parameters (#q3 #q15 o10 #g1)
          :precondition (and (isconf #q3) (isconf #q15) (isgrasp o10 #g1))
          :effect (isholdingmotion #q3 #t642 #q15 o10 #g1)
   )
   (:action s654_plan-holding-motion
          :parameters (#q3 #q15 o10 #g2)
          :precondition (and (isconf #q3) (isconf #q15) (isgrasp o10 #g2))
          :effect (isholdingmotion #q3 #t643 #q15 o10 #g2)
   )
   (:action s655_plan-holding-motion
          :parameters (#q3 #q15 o10 #g3)
          :precondition (and (isconf #q3) (isconf #q15) (isgrasp o10 #g3))
          :effect (isholdingmotion #q3 #t644 #q15 o10 #g3)
   )
   (:action s656_plan-holding-motion
          :parameters (#q4 q224 o10 #g0)
          :precondition (and (isconf #q4) (isconf q224) (isgrasp o10 #g0))
          :effect (isholdingmotion #q4 #t645 q224 o10 #g0)
   )
   (:action s657_plan-holding-motion
          :parameters (#q4 q224 o10 #g1)
          :precondition (and (isconf #q4) (isconf q224) (isgrasp o10 #g1))
          :effect (isholdingmotion #q4 #t646 q224 o10 #g1)
   )
   (:action s658_plan-holding-motion
          :parameters (#q4 q224 o10 #g2)
          :precondition (and (isconf #q4) (isconf q224) (isgrasp o10 #g2))
          :effect (isholdingmotion #q4 #t647 q224 o10 #g2)
   )
   (:action s659_plan-holding-motion
          :parameters (#q4 q224 o10 #g3)
          :precondition (and (isconf #q4) (isconf q224) (isgrasp o10 #g3))
          :effect (isholdingmotion #q4 #t648 q224 o10 #g3)
   )
   (:action s660_plan-holding-motion
          :parameters (#q4 #q0 o10 #g0)
          :precondition (and (isconf #q4) (isconf #q0) (isgrasp o10 #g0))
          :effect (isholdingmotion #q4 #t649 #q0 o10 #g0)
   )
   (:action s661_plan-holding-motion
          :parameters (#q4 #q0 o10 #g1)
          :precondition (and (isconf #q4) (isconf #q0) (isgrasp o10 #g1))
          :effect (isholdingmotion #q4 #t650 #q0 o10 #g1)
   )
   (:action s662_plan-holding-motion
          :parameters (#q4 #q0 o10 #g2)
          :precondition (and (isconf #q4) (isconf #q0) (isgrasp o10 #g2))
          :effect (isholdingmotion #q4 #t651 #q0 o10 #g2)
   )
   (:action s663_plan-holding-motion
          :parameters (#q4 #q0 o10 #g3)
          :precondition (and (isconf #q4) (isconf #q0) (isgrasp o10 #g3))
          :effect (isholdingmotion #q4 #t652 #q0 o10 #g3)
   )
   (:action s664_plan-holding-motion
          :parameters (#q4 #q1 o10 #g0)
          :precondition (and (isconf #q4) (isconf #q1) (isgrasp o10 #g0))
          :effect (isholdingmotion #q4 #t653 #q1 o10 #g0)
   )
   (:action s665_plan-holding-motion
          :parameters (#q4 #q1 o10 #g1)
          :precondition (and (isconf #q4) (isconf #q1) (isgrasp o10 #g1))
          :effect (isholdingmotion #q4 #t654 #q1 o10 #g1)
   )
   (:action s666_plan-holding-motion
          :parameters (#q4 #q1 o10 #g2)
          :precondition (and (isconf #q4) (isconf #q1) (isgrasp o10 #g2))
          :effect (isholdingmotion #q4 #t655 #q1 o10 #g2)
   )
   (:action s667_plan-holding-motion
          :parameters (#q4 #q1 o10 #g3)
          :precondition (and (isconf #q4) (isconf #q1) (isgrasp o10 #g3))
          :effect (isholdingmotion #q4 #t656 #q1 o10 #g3)
   )
   (:action s668_plan-holding-motion
          :parameters (#q4 #q2 o10 #g0)
          :precondition (and (isconf #q4) (isconf #q2) (isgrasp o10 #g0))
          :effect (isholdingmotion #q4 #t657 #q2 o10 #g0)
   )
   (:action s669_plan-holding-motion
          :parameters (#q4 #q2 o10 #g1)
          :precondition (and (isconf #q4) (isconf #q2) (isgrasp o10 #g1))
          :effect (isholdingmotion #q4 #t658 #q2 o10 #g1)
   )
   (:action s670_plan-holding-motion
          :parameters (#q4 #q2 o10 #g2)
          :precondition (and (isconf #q4) (isconf #q2) (isgrasp o10 #g2))
          :effect (isholdingmotion #q4 #t659 #q2 o10 #g2)
   )
   (:action s671_plan-holding-motion
          :parameters (#q4 #q2 o10 #g3)
          :precondition (and (isconf #q4) (isconf #q2) (isgrasp o10 #g3))
          :effect (isholdingmotion #q4 #t660 #q2 o10 #g3)
   )
   (:action s672_plan-holding-motion
          :parameters (#q4 #q3 o10 #g0)
          :precondition (and (isconf #q4) (isconf #q3) (isgrasp o10 #g0))
          :effect (isholdingmotion #q4 #t661 #q3 o10 #g0)
   )
   (:action s673_plan-holding-motion
          :parameters (#q4 #q3 o10 #g1)
          :precondition (and (isconf #q4) (isconf #q3) (isgrasp o10 #g1))
          :effect (isholdingmotion #q4 #t662 #q3 o10 #g1)
   )
   (:action s674_plan-holding-motion
          :parameters (#q4 #q3 o10 #g2)
          :precondition (and (isconf #q4) (isconf #q3) (isgrasp o10 #g2))
          :effect (isholdingmotion #q4 #t663 #q3 o10 #g2)
   )
   (:action s675_plan-holding-motion
          :parameters (#q4 #q3 o10 #g3)
          :precondition (and (isconf #q4) (isconf #q3) (isgrasp o10 #g3))
          :effect (isholdingmotion #q4 #t664 #q3 o10 #g3)
   )
   (:action s676_plan-holding-motion
          :parameters (#q4 #q4 o10 #g0)
          :precondition (and (isconf #q4) (isconf #q4) (isgrasp o10 #g0))
          :effect (isholdingmotion #q4 #t665 #q4 o10 #g0)
   )
   (:action s677_plan-holding-motion
          :parameters (#q4 #q4 o10 #g1)
          :precondition (and (isconf #q4) (isconf #q4) (isgrasp o10 #g1))
          :effect (isholdingmotion #q4 #t666 #q4 o10 #g1)
   )
   (:action s678_plan-holding-motion
          :parameters (#q4 #q4 o10 #g2)
          :precondition (and (isconf #q4) (isconf #q4) (isgrasp o10 #g2))
          :effect (isholdingmotion #q4 #t667 #q4 o10 #g2)
   )
   (:action s679_plan-holding-motion
          :parameters (#q4 #q4 o10 #g3)
          :precondition (and (isconf #q4) (isconf #q4) (isgrasp o10 #g3))
          :effect (isholdingmotion #q4 #t668 #q4 o10 #g3)
   )
   (:action s680_plan-holding-motion
          :parameters (#q4 #q5 o10 #g0)
          :precondition (and (isconf #q4) (isconf #q5) (isgrasp o10 #g0))
          :effect (isholdingmotion #q4 #t669 #q5 o10 #g0)
   )
   (:action s681_plan-holding-motion
          :parameters (#q4 #q5 o10 #g1)
          :precondition (and (isconf #q4) (isconf #q5) (isgrasp o10 #g1))
          :effect (isholdingmotion #q4 #t670 #q5 o10 #g1)
   )
   (:action s682_plan-holding-motion
          :parameters (#q4 #q5 o10 #g2)
          :precondition (and (isconf #q4) (isconf #q5) (isgrasp o10 #g2))
          :effect (isholdingmotion #q4 #t671 #q5 o10 #g2)
   )
   (:action s683_plan-holding-motion
          :parameters (#q4 #q5 o10 #g3)
          :precondition (and (isconf #q4) (isconf #q5) (isgrasp o10 #g3))
          :effect (isholdingmotion #q4 #t672 #q5 o10 #g3)
   )
   (:action s684_plan-holding-motion
          :parameters (#q4 #q6 o10 #g0)
          :precondition (and (isconf #q4) (isconf #q6) (isgrasp o10 #g0))
          :effect (isholdingmotion #q4 #t673 #q6 o10 #g0)
   )
   (:action s685_plan-holding-motion
          :parameters (#q4 #q6 o10 #g1)
          :precondition (and (isconf #q4) (isconf #q6) (isgrasp o10 #g1))
          :effect (isholdingmotion #q4 #t674 #q6 o10 #g1)
   )
   (:action s686_plan-holding-motion
          :parameters (#q4 #q6 o10 #g2)
          :precondition (and (isconf #q4) (isconf #q6) (isgrasp o10 #g2))
          :effect (isholdingmotion #q4 #t675 #q6 o10 #g2)
   )
   (:action s687_plan-holding-motion
          :parameters (#q4 #q6 o10 #g3)
          :precondition (and (isconf #q4) (isconf #q6) (isgrasp o10 #g3))
          :effect (isholdingmotion #q4 #t676 #q6 o10 #g3)
   )
   (:action s688_plan-holding-motion
          :parameters (#q4 #q7 o10 #g0)
          :precondition (and (isconf #q4) (isconf #q7) (isgrasp o10 #g0))
          :effect (isholdingmotion #q4 #t677 #q7 o10 #g0)
   )
   (:action s689_plan-holding-motion
          :parameters (#q4 #q7 o10 #g1)
          :precondition (and (isconf #q4) (isconf #q7) (isgrasp o10 #g1))
          :effect (isholdingmotion #q4 #t678 #q7 o10 #g1)
   )
   (:action s690_plan-holding-motion
          :parameters (#q4 #q7 o10 #g2)
          :precondition (and (isconf #q4) (isconf #q7) (isgrasp o10 #g2))
          :effect (isholdingmotion #q4 #t679 #q7 o10 #g2)
   )
   (:action s691_plan-holding-motion
          :parameters (#q4 #q7 o10 #g3)
          :precondition (and (isconf #q4) (isconf #q7) (isgrasp o10 #g3))
          :effect (isholdingmotion #q4 #t680 #q7 o10 #g3)
   )
   (:action s692_plan-holding-motion
          :parameters (#q4 #q8 o10 #g0)
          :precondition (and (isconf #q4) (isconf #q8) (isgrasp o10 #g0))
          :effect (isholdingmotion #q4 #t681 #q8 o10 #g0)
   )
   (:action s693_plan-holding-motion
          :parameters (#q4 #q8 o10 #g1)
          :precondition (and (isconf #q4) (isconf #q8) (isgrasp o10 #g1))
          :effect (isholdingmotion #q4 #t682 #q8 o10 #g1)
   )
   (:action s694_plan-holding-motion
          :parameters (#q4 #q8 o10 #g2)
          :precondition (and (isconf #q4) (isconf #q8) (isgrasp o10 #g2))
          :effect (isholdingmotion #q4 #t683 #q8 o10 #g2)
   )
   (:action s695_plan-holding-motion
          :parameters (#q4 #q8 o10 #g3)
          :precondition (and (isconf #q4) (isconf #q8) (isgrasp o10 #g3))
          :effect (isholdingmotion #q4 #t684 #q8 o10 #g3)
   )
   (:action s696_plan-holding-motion
          :parameters (#q4 #q9 o10 #g0)
          :precondition (and (isconf #q4) (isconf #q9) (isgrasp o10 #g0))
          :effect (isholdingmotion #q4 #t685 #q9 o10 #g0)
   )
   (:action s697_plan-holding-motion
          :parameters (#q4 #q9 o10 #g1)
          :precondition (and (isconf #q4) (isconf #q9) (isgrasp o10 #g1))
          :effect (isholdingmotion #q4 #t686 #q9 o10 #g1)
   )
   (:action s698_plan-holding-motion
          :parameters (#q4 #q9 o10 #g2)
          :precondition (and (isconf #q4) (isconf #q9) (isgrasp o10 #g2))
          :effect (isholdingmotion #q4 #t687 #q9 o10 #g2)
   )
   (:action s699_plan-holding-motion
          :parameters (#q4 #q9 o10 #g3)
          :precondition (and (isconf #q4) (isconf #q9) (isgrasp o10 #g3))
          :effect (isholdingmotion #q4 #t688 #q9 o10 #g3)
   )
   (:action s700_plan-holding-motion
          :parameters (#q4 #q10 o10 #g0)
          :precondition (and (isconf #q4) (isconf #q10) (isgrasp o10 #g0))
          :effect (isholdingmotion #q4 #t689 #q10 o10 #g0)
   )
   (:action s701_plan-holding-motion
          :parameters (#q4 #q10 o10 #g1)
          :precondition (and (isconf #q4) (isconf #q10) (isgrasp o10 #g1))
          :effect (isholdingmotion #q4 #t690 #q10 o10 #g1)
   )
   (:action s702_plan-holding-motion
          :parameters (#q4 #q10 o10 #g2)
          :precondition (and (isconf #q4) (isconf #q10) (isgrasp o10 #g2))
          :effect (isholdingmotion #q4 #t691 #q10 o10 #g2)
   )
   (:action s703_plan-holding-motion
          :parameters (#q4 #q10 o10 #g3)
          :precondition (and (isconf #q4) (isconf #q10) (isgrasp o10 #g3))
          :effect (isholdingmotion #q4 #t692 #q10 o10 #g3)
   )
   (:action s704_plan-holding-motion
          :parameters (#q4 #q11 o10 #g0)
          :precondition (and (isconf #q4) (isconf #q11) (isgrasp o10 #g0))
          :effect (isholdingmotion #q4 #t693 #q11 o10 #g0)
   )
   (:action s705_plan-holding-motion
          :parameters (#q4 #q11 o10 #g1)
          :precondition (and (isconf #q4) (isconf #q11) (isgrasp o10 #g1))
          :effect (isholdingmotion #q4 #t694 #q11 o10 #g1)
   )
   (:action s706_plan-holding-motion
          :parameters (#q4 #q11 o10 #g2)
          :precondition (and (isconf #q4) (isconf #q11) (isgrasp o10 #g2))
          :effect (isholdingmotion #q4 #t695 #q11 o10 #g2)
   )
   (:action s707_plan-holding-motion
          :parameters (#q4 #q11 o10 #g3)
          :precondition (and (isconf #q4) (isconf #q11) (isgrasp o10 #g3))
          :effect (isholdingmotion #q4 #t696 #q11 o10 #g3)
   )
   (:action s708_plan-holding-motion
          :parameters (#q4 #q12 o10 #g0)
          :precondition (and (isconf #q4) (isconf #q12) (isgrasp o10 #g0))
          :effect (isholdingmotion #q4 #t697 #q12 o10 #g0)
   )
   (:action s709_plan-holding-motion
          :parameters (#q4 #q12 o10 #g1)
          :precondition (and (isconf #q4) (isconf #q12) (isgrasp o10 #g1))
          :effect (isholdingmotion #q4 #t698 #q12 o10 #g1)
   )
   (:action s710_plan-holding-motion
          :parameters (#q4 #q12 o10 #g2)
          :precondition (and (isconf #q4) (isconf #q12) (isgrasp o10 #g2))
          :effect (isholdingmotion #q4 #t699 #q12 o10 #g2)
   )
   (:action s711_plan-holding-motion
          :parameters (#q4 #q12 o10 #g3)
          :precondition (and (isconf #q4) (isconf #q12) (isgrasp o10 #g3))
          :effect (isholdingmotion #q4 #t700 #q12 o10 #g3)
   )
   (:action s712_plan-holding-motion
          :parameters (#q4 #q13 o10 #g0)
          :precondition (and (isconf #q4) (isconf #q13) (isgrasp o10 #g0))
          :effect (isholdingmotion #q4 #t701 #q13 o10 #g0)
   )
   (:action s713_plan-holding-motion
          :parameters (#q4 #q13 o10 #g1)
          :precondition (and (isconf #q4) (isconf #q13) (isgrasp o10 #g1))
          :effect (isholdingmotion #q4 #t702 #q13 o10 #g1)
   )
   (:action s714_plan-holding-motion
          :parameters (#q4 #q13 o10 #g2)
          :precondition (and (isconf #q4) (isconf #q13) (isgrasp o10 #g2))
          :effect (isholdingmotion #q4 #t703 #q13 o10 #g2)
   )
   (:action s715_plan-holding-motion
          :parameters (#q4 #q13 o10 #g3)
          :precondition (and (isconf #q4) (isconf #q13) (isgrasp o10 #g3))
          :effect (isholdingmotion #q4 #t704 #q13 o10 #g3)
   )
   (:action s716_plan-holding-motion
          :parameters (#q4 #q14 o10 #g0)
          :precondition (and (isconf #q4) (isconf #q14) (isgrasp o10 #g0))
          :effect (isholdingmotion #q4 #t705 #q14 o10 #g0)
   )
   (:action s717_plan-holding-motion
          :parameters (#q4 #q14 o10 #g1)
          :precondition (and (isconf #q4) (isconf #q14) (isgrasp o10 #g1))
          :effect (isholdingmotion #q4 #t706 #q14 o10 #g1)
   )
   (:action s718_plan-holding-motion
          :parameters (#q4 #q14 o10 #g2)
          :precondition (and (isconf #q4) (isconf #q14) (isgrasp o10 #g2))
          :effect (isholdingmotion #q4 #t707 #q14 o10 #g2)
   )
   (:action s719_plan-holding-motion
          :parameters (#q4 #q14 o10 #g3)
          :precondition (and (isconf #q4) (isconf #q14) (isgrasp o10 #g3))
          :effect (isholdingmotion #q4 #t708 #q14 o10 #g3)
   )
   (:action s720_plan-holding-motion
          :parameters (#q4 #q15 o10 #g0)
          :precondition (and (isconf #q4) (isconf #q15) (isgrasp o10 #g0))
          :effect (isholdingmotion #q4 #t709 #q15 o10 #g0)
   )
   (:action s721_plan-holding-motion
          :parameters (#q4 #q15 o10 #g1)
          :precondition (and (isconf #q4) (isconf #q15) (isgrasp o10 #g1))
          :effect (isholdingmotion #q4 #t710 #q15 o10 #g1)
   )
   (:action s722_plan-holding-motion
          :parameters (#q4 #q15 o10 #g2)
          :precondition (and (isconf #q4) (isconf #q15) (isgrasp o10 #g2))
          :effect (isholdingmotion #q4 #t711 #q15 o10 #g2)
   )
   (:action s723_plan-holding-motion
          :parameters (#q4 #q15 o10 #g3)
          :precondition (and (isconf #q4) (isconf #q15) (isgrasp o10 #g3))
          :effect (isholdingmotion #q4 #t712 #q15 o10 #g3)
   )
   (:action s724_plan-holding-motion
          :parameters (#q5 q224 o10 #g0)
          :precondition (and (isconf #q5) (isconf q224) (isgrasp o10 #g0))
          :effect (isholdingmotion #q5 #t713 q224 o10 #g0)
   )
   (:action s725_plan-holding-motion
          :parameters (#q5 q224 o10 #g1)
          :precondition (and (isconf #q5) (isconf q224) (isgrasp o10 #g1))
          :effect (isholdingmotion #q5 #t714 q224 o10 #g1)
   )
   (:action s726_plan-holding-motion
          :parameters (#q5 q224 o10 #g2)
          :precondition (and (isconf #q5) (isconf q224) (isgrasp o10 #g2))
          :effect (isholdingmotion #q5 #t715 q224 o10 #g2)
   )
   (:action s727_plan-holding-motion
          :parameters (#q5 q224 o10 #g3)
          :precondition (and (isconf #q5) (isconf q224) (isgrasp o10 #g3))
          :effect (isholdingmotion #q5 #t716 q224 o10 #g3)
   )
   (:action s728_plan-holding-motion
          :parameters (#q5 #q0 o10 #g0)
          :precondition (and (isconf #q5) (isconf #q0) (isgrasp o10 #g0))
          :effect (isholdingmotion #q5 #t717 #q0 o10 #g0)
   )
   (:action s729_plan-holding-motion
          :parameters (#q5 #q0 o10 #g1)
          :precondition (and (isconf #q5) (isconf #q0) (isgrasp o10 #g1))
          :effect (isholdingmotion #q5 #t718 #q0 o10 #g1)
   )
   (:action s730_plan-holding-motion
          :parameters (#q5 #q0 o10 #g2)
          :precondition (and (isconf #q5) (isconf #q0) (isgrasp o10 #g2))
          :effect (isholdingmotion #q5 #t719 #q0 o10 #g2)
   )
   (:action s731_plan-holding-motion
          :parameters (#q5 #q0 o10 #g3)
          :precondition (and (isconf #q5) (isconf #q0) (isgrasp o10 #g3))
          :effect (isholdingmotion #q5 #t720 #q0 o10 #g3)
   )
   (:action s732_plan-holding-motion
          :parameters (#q5 #q1 o10 #g0)
          :precondition (and (isconf #q5) (isconf #q1) (isgrasp o10 #g0))
          :effect (isholdingmotion #q5 #t721 #q1 o10 #g0)
   )
   (:action s733_plan-holding-motion
          :parameters (#q5 #q1 o10 #g1)
          :precondition (and (isconf #q5) (isconf #q1) (isgrasp o10 #g1))
          :effect (isholdingmotion #q5 #t722 #q1 o10 #g1)
   )
   (:action s734_plan-holding-motion
          :parameters (#q5 #q1 o10 #g2)
          :precondition (and (isconf #q5) (isconf #q1) (isgrasp o10 #g2))
          :effect (isholdingmotion #q5 #t723 #q1 o10 #g2)
   )
   (:action s735_plan-holding-motion
          :parameters (#q5 #q1 o10 #g3)
          :precondition (and (isconf #q5) (isconf #q1) (isgrasp o10 #g3))
          :effect (isholdingmotion #q5 #t724 #q1 o10 #g3)
   )
   (:action s736_plan-holding-motion
          :parameters (#q5 #q2 o10 #g0)
          :precondition (and (isconf #q5) (isconf #q2) (isgrasp o10 #g0))
          :effect (isholdingmotion #q5 #t725 #q2 o10 #g0)
   )
   (:action s737_plan-holding-motion
          :parameters (#q5 #q2 o10 #g1)
          :precondition (and (isconf #q5) (isconf #q2) (isgrasp o10 #g1))
          :effect (isholdingmotion #q5 #t726 #q2 o10 #g1)
   )
   (:action s738_plan-holding-motion
          :parameters (#q5 #q2 o10 #g2)
          :precondition (and (isconf #q5) (isconf #q2) (isgrasp o10 #g2))
          :effect (isholdingmotion #q5 #t727 #q2 o10 #g2)
   )
   (:action s739_plan-holding-motion
          :parameters (#q5 #q2 o10 #g3)
          :precondition (and (isconf #q5) (isconf #q2) (isgrasp o10 #g3))
          :effect (isholdingmotion #q5 #t728 #q2 o10 #g3)
   )
   (:action s740_plan-holding-motion
          :parameters (#q5 #q3 o10 #g0)
          :precondition (and (isconf #q5) (isconf #q3) (isgrasp o10 #g0))
          :effect (isholdingmotion #q5 #t729 #q3 o10 #g0)
   )
   (:action s741_plan-holding-motion
          :parameters (#q5 #q3 o10 #g1)
          :precondition (and (isconf #q5) (isconf #q3) (isgrasp o10 #g1))
          :effect (isholdingmotion #q5 #t730 #q3 o10 #g1)
   )
   (:action s742_plan-holding-motion
          :parameters (#q5 #q3 o10 #g2)
          :precondition (and (isconf #q5) (isconf #q3) (isgrasp o10 #g2))
          :effect (isholdingmotion #q5 #t731 #q3 o10 #g2)
   )
   (:action s743_plan-holding-motion
          :parameters (#q5 #q3 o10 #g3)
          :precondition (and (isconf #q5) (isconf #q3) (isgrasp o10 #g3))
          :effect (isholdingmotion #q5 #t732 #q3 o10 #g3)
   )
   (:action s744_plan-holding-motion
          :parameters (#q5 #q4 o10 #g0)
          :precondition (and (isconf #q5) (isconf #q4) (isgrasp o10 #g0))
          :effect (isholdingmotion #q5 #t733 #q4 o10 #g0)
   )
   (:action s745_plan-holding-motion
          :parameters (#q5 #q4 o10 #g1)
          :precondition (and (isconf #q5) (isconf #q4) (isgrasp o10 #g1))
          :effect (isholdingmotion #q5 #t734 #q4 o10 #g1)
   )
   (:action s746_plan-holding-motion
          :parameters (#q5 #q4 o10 #g2)
          :precondition (and (isconf #q5) (isconf #q4) (isgrasp o10 #g2))
          :effect (isholdingmotion #q5 #t735 #q4 o10 #g2)
   )
   (:action s747_plan-holding-motion
          :parameters (#q5 #q4 o10 #g3)
          :precondition (and (isconf #q5) (isconf #q4) (isgrasp o10 #g3))
          :effect (isholdingmotion #q5 #t736 #q4 o10 #g3)
   )
   (:action s748_plan-holding-motion
          :parameters (#q5 #q5 o10 #g0)
          :precondition (and (isconf #q5) (isconf #q5) (isgrasp o10 #g0))
          :effect (isholdingmotion #q5 #t737 #q5 o10 #g0)
   )
   (:action s749_plan-holding-motion
          :parameters (#q5 #q5 o10 #g1)
          :precondition (and (isconf #q5) (isconf #q5) (isgrasp o10 #g1))
          :effect (isholdingmotion #q5 #t738 #q5 o10 #g1)
   )
   (:action s750_plan-holding-motion
          :parameters (#q5 #q5 o10 #g2)
          :precondition (and (isconf #q5) (isconf #q5) (isgrasp o10 #g2))
          :effect (isholdingmotion #q5 #t739 #q5 o10 #g2)
   )
   (:action s751_plan-holding-motion
          :parameters (#q5 #q5 o10 #g3)
          :precondition (and (isconf #q5) (isconf #q5) (isgrasp o10 #g3))
          :effect (isholdingmotion #q5 #t740 #q5 o10 #g3)
   )
   (:action s752_plan-holding-motion
          :parameters (#q5 #q6 o10 #g0)
          :precondition (and (isconf #q5) (isconf #q6) (isgrasp o10 #g0))
          :effect (isholdingmotion #q5 #t741 #q6 o10 #g0)
   )
   (:action s753_plan-holding-motion
          :parameters (#q5 #q6 o10 #g1)
          :precondition (and (isconf #q5) (isconf #q6) (isgrasp o10 #g1))
          :effect (isholdingmotion #q5 #t742 #q6 o10 #g1)
   )
   (:action s754_plan-holding-motion
          :parameters (#q5 #q6 o10 #g2)
          :precondition (and (isconf #q5) (isconf #q6) (isgrasp o10 #g2))
          :effect (isholdingmotion #q5 #t743 #q6 o10 #g2)
   )
   (:action s755_plan-holding-motion
          :parameters (#q5 #q6 o10 #g3)
          :precondition (and (isconf #q5) (isconf #q6) (isgrasp o10 #g3))
          :effect (isholdingmotion #q5 #t744 #q6 o10 #g3)
   )
   (:action s756_plan-holding-motion
          :parameters (#q5 #q7 o10 #g0)
          :precondition (and (isconf #q5) (isconf #q7) (isgrasp o10 #g0))
          :effect (isholdingmotion #q5 #t745 #q7 o10 #g0)
   )
   (:action s757_plan-holding-motion
          :parameters (#q5 #q7 o10 #g1)
          :precondition (and (isconf #q5) (isconf #q7) (isgrasp o10 #g1))
          :effect (isholdingmotion #q5 #t746 #q7 o10 #g1)
   )
   (:action s758_plan-holding-motion
          :parameters (#q5 #q7 o10 #g2)
          :precondition (and (isconf #q5) (isconf #q7) (isgrasp o10 #g2))
          :effect (isholdingmotion #q5 #t747 #q7 o10 #g2)
   )
   (:action s759_plan-holding-motion
          :parameters (#q5 #q7 o10 #g3)
          :precondition (and (isconf #q5) (isconf #q7) (isgrasp o10 #g3))
          :effect (isholdingmotion #q5 #t748 #q7 o10 #g3)
   )
   (:action s760_plan-holding-motion
          :parameters (#q5 #q8 o10 #g0)
          :precondition (and (isconf #q5) (isconf #q8) (isgrasp o10 #g0))
          :effect (isholdingmotion #q5 #t749 #q8 o10 #g0)
   )
   (:action s761_plan-holding-motion
          :parameters (#q5 #q8 o10 #g1)
          :precondition (and (isconf #q5) (isconf #q8) (isgrasp o10 #g1))
          :effect (isholdingmotion #q5 #t750 #q8 o10 #g1)
   )
   (:action s762_plan-holding-motion
          :parameters (#q5 #q8 o10 #g2)
          :precondition (and (isconf #q5) (isconf #q8) (isgrasp o10 #g2))
          :effect (isholdingmotion #q5 #t751 #q8 o10 #g2)
   )
   (:action s763_plan-holding-motion
          :parameters (#q5 #q8 o10 #g3)
          :precondition (and (isconf #q5) (isconf #q8) (isgrasp o10 #g3))
          :effect (isholdingmotion #q5 #t752 #q8 o10 #g3)
   )
   (:action s764_plan-holding-motion
          :parameters (#q5 #q9 o10 #g0)
          :precondition (and (isconf #q5) (isconf #q9) (isgrasp o10 #g0))
          :effect (isholdingmotion #q5 #t753 #q9 o10 #g0)
   )
   (:action s765_plan-holding-motion
          :parameters (#q5 #q9 o10 #g1)
          :precondition (and (isconf #q5) (isconf #q9) (isgrasp o10 #g1))
          :effect (isholdingmotion #q5 #t754 #q9 o10 #g1)
   )
   (:action s766_plan-holding-motion
          :parameters (#q5 #q9 o10 #g2)
          :precondition (and (isconf #q5) (isconf #q9) (isgrasp o10 #g2))
          :effect (isholdingmotion #q5 #t755 #q9 o10 #g2)
   )
   (:action s767_plan-holding-motion
          :parameters (#q5 #q9 o10 #g3)
          :precondition (and (isconf #q5) (isconf #q9) (isgrasp o10 #g3))
          :effect (isholdingmotion #q5 #t756 #q9 o10 #g3)
   )
   (:action s768_plan-holding-motion
          :parameters (#q5 #q10 o10 #g0)
          :precondition (and (isconf #q5) (isconf #q10) (isgrasp o10 #g0))
          :effect (isholdingmotion #q5 #t757 #q10 o10 #g0)
   )
   (:action s769_plan-holding-motion
          :parameters (#q5 #q10 o10 #g1)
          :precondition (and (isconf #q5) (isconf #q10) (isgrasp o10 #g1))
          :effect (isholdingmotion #q5 #t758 #q10 o10 #g1)
   )
   (:action s770_plan-holding-motion
          :parameters (#q5 #q10 o10 #g2)
          :precondition (and (isconf #q5) (isconf #q10) (isgrasp o10 #g2))
          :effect (isholdingmotion #q5 #t759 #q10 o10 #g2)
   )
   (:action s771_plan-holding-motion
          :parameters (#q5 #q10 o10 #g3)
          :precondition (and (isconf #q5) (isconf #q10) (isgrasp o10 #g3))
          :effect (isholdingmotion #q5 #t760 #q10 o10 #g3)
   )
   (:action s772_plan-holding-motion
          :parameters (#q5 #q11 o10 #g0)
          :precondition (and (isconf #q5) (isconf #q11) (isgrasp o10 #g0))
          :effect (isholdingmotion #q5 #t761 #q11 o10 #g0)
   )
   (:action s773_plan-holding-motion
          :parameters (#q5 #q11 o10 #g1)
          :precondition (and (isconf #q5) (isconf #q11) (isgrasp o10 #g1))
          :effect (isholdingmotion #q5 #t762 #q11 o10 #g1)
   )
   (:action s774_plan-holding-motion
          :parameters (#q5 #q11 o10 #g2)
          :precondition (and (isconf #q5) (isconf #q11) (isgrasp o10 #g2))
          :effect (isholdingmotion #q5 #t763 #q11 o10 #g2)
   )
   (:action s775_plan-holding-motion
          :parameters (#q5 #q11 o10 #g3)
          :precondition (and (isconf #q5) (isconf #q11) (isgrasp o10 #g3))
          :effect (isholdingmotion #q5 #t764 #q11 o10 #g3)
   )
   (:action s776_plan-holding-motion
          :parameters (#q5 #q12 o10 #g0)
          :precondition (and (isconf #q5) (isconf #q12) (isgrasp o10 #g0))
          :effect (isholdingmotion #q5 #t765 #q12 o10 #g0)
   )
   (:action s777_plan-holding-motion
          :parameters (#q5 #q12 o10 #g1)
          :precondition (and (isconf #q5) (isconf #q12) (isgrasp o10 #g1))
          :effect (isholdingmotion #q5 #t766 #q12 o10 #g1)
   )
   (:action s778_plan-holding-motion
          :parameters (#q5 #q12 o10 #g2)
          :precondition (and (isconf #q5) (isconf #q12) (isgrasp o10 #g2))
          :effect (isholdingmotion #q5 #t767 #q12 o10 #g2)
   )
   (:action s779_plan-holding-motion
          :parameters (#q5 #q12 o10 #g3)
          :precondition (and (isconf #q5) (isconf #q12) (isgrasp o10 #g3))
          :effect (isholdingmotion #q5 #t768 #q12 o10 #g3)
   )
   (:action s780_plan-holding-motion
          :parameters (#q5 #q13 o10 #g0)
          :precondition (and (isconf #q5) (isconf #q13) (isgrasp o10 #g0))
          :effect (isholdingmotion #q5 #t769 #q13 o10 #g0)
   )
   (:action s781_plan-holding-motion
          :parameters (#q5 #q13 o10 #g1)
          :precondition (and (isconf #q5) (isconf #q13) (isgrasp o10 #g1))
          :effect (isholdingmotion #q5 #t770 #q13 o10 #g1)
   )
   (:action s782_plan-holding-motion
          :parameters (#q5 #q13 o10 #g2)
          :precondition (and (isconf #q5) (isconf #q13) (isgrasp o10 #g2))
          :effect (isholdingmotion #q5 #t771 #q13 o10 #g2)
   )
   (:action s783_plan-holding-motion
          :parameters (#q5 #q13 o10 #g3)
          :precondition (and (isconf #q5) (isconf #q13) (isgrasp o10 #g3))
          :effect (isholdingmotion #q5 #t772 #q13 o10 #g3)
   )
   (:action s784_plan-holding-motion
          :parameters (#q5 #q14 o10 #g0)
          :precondition (and (isconf #q5) (isconf #q14) (isgrasp o10 #g0))
          :effect (isholdingmotion #q5 #t773 #q14 o10 #g0)
   )
   (:action s785_plan-holding-motion
          :parameters (#q5 #q14 o10 #g1)
          :precondition (and (isconf #q5) (isconf #q14) (isgrasp o10 #g1))
          :effect (isholdingmotion #q5 #t774 #q14 o10 #g1)
   )
   (:action s786_plan-holding-motion
          :parameters (#q5 #q14 o10 #g2)
          :precondition (and (isconf #q5) (isconf #q14) (isgrasp o10 #g2))
          :effect (isholdingmotion #q5 #t775 #q14 o10 #g2)
   )
   (:action s787_plan-holding-motion
          :parameters (#q5 #q14 o10 #g3)
          :precondition (and (isconf #q5) (isconf #q14) (isgrasp o10 #g3))
          :effect (isholdingmotion #q5 #t776 #q14 o10 #g3)
   )
   (:action s788_plan-holding-motion
          :parameters (#q5 #q15 o10 #g0)
          :precondition (and (isconf #q5) (isconf #q15) (isgrasp o10 #g0))
          :effect (isholdingmotion #q5 #t777 #q15 o10 #g0)
   )
   (:action s789_plan-holding-motion
          :parameters (#q5 #q15 o10 #g1)
          :precondition (and (isconf #q5) (isconf #q15) (isgrasp o10 #g1))
          :effect (isholdingmotion #q5 #t778 #q15 o10 #g1)
   )
   (:action s790_plan-holding-motion
          :parameters (#q5 #q15 o10 #g2)
          :precondition (and (isconf #q5) (isconf #q15) (isgrasp o10 #g2))
          :effect (isholdingmotion #q5 #t779 #q15 o10 #g2)
   )
   (:action s791_plan-holding-motion
          :parameters (#q5 #q15 o10 #g3)
          :precondition (and (isconf #q5) (isconf #q15) (isgrasp o10 #g3))
          :effect (isholdingmotion #q5 #t780 #q15 o10 #g3)
   )
   (:action s792_plan-holding-motion
          :parameters (#q6 q224 o10 #g0)
          :precondition (and (isconf #q6) (isconf q224) (isgrasp o10 #g0))
          :effect (isholdingmotion #q6 #t781 q224 o10 #g0)
   )
   (:action s793_plan-holding-motion
          :parameters (#q6 q224 o10 #g1)
          :precondition (and (isconf #q6) (isconf q224) (isgrasp o10 #g1))
          :effect (isholdingmotion #q6 #t782 q224 o10 #g1)
   )
   (:action s794_plan-holding-motion
          :parameters (#q6 q224 o10 #g2)
          :precondition (and (isconf #q6) (isconf q224) (isgrasp o10 #g2))
          :effect (isholdingmotion #q6 #t783 q224 o10 #g2)
   )
   (:action s795_plan-holding-motion
          :parameters (#q6 q224 o10 #g3)
          :precondition (and (isconf #q6) (isconf q224) (isgrasp o10 #g3))
          :effect (isholdingmotion #q6 #t784 q224 o10 #g3)
   )
   (:action s796_plan-holding-motion
          :parameters (#q6 #q0 o10 #g0)
          :precondition (and (isconf #q6) (isconf #q0) (isgrasp o10 #g0))
          :effect (isholdingmotion #q6 #t785 #q0 o10 #g0)
   )
   (:action s797_plan-holding-motion
          :parameters (#q6 #q0 o10 #g1)
          :precondition (and (isconf #q6) (isconf #q0) (isgrasp o10 #g1))
          :effect (isholdingmotion #q6 #t786 #q0 o10 #g1)
   )
   (:action s798_plan-holding-motion
          :parameters (#q6 #q0 o10 #g2)
          :precondition (and (isconf #q6) (isconf #q0) (isgrasp o10 #g2))
          :effect (isholdingmotion #q6 #t787 #q0 o10 #g2)
   )
   (:action s799_plan-holding-motion
          :parameters (#q6 #q0 o10 #g3)
          :precondition (and (isconf #q6) (isconf #q0) (isgrasp o10 #g3))
          :effect (isholdingmotion #q6 #t788 #q0 o10 #g3)
   )
   (:action s800_plan-holding-motion
          :parameters (#q6 #q1 o10 #g0)
          :precondition (and (isconf #q6) (isconf #q1) (isgrasp o10 #g0))
          :effect (isholdingmotion #q6 #t789 #q1 o10 #g0)
   )
   (:action s801_plan-holding-motion
          :parameters (#q6 #q1 o10 #g1)
          :precondition (and (isconf #q6) (isconf #q1) (isgrasp o10 #g1))
          :effect (isholdingmotion #q6 #t790 #q1 o10 #g1)
   )
   (:action s802_plan-holding-motion
          :parameters (#q6 #q1 o10 #g2)
          :precondition (and (isconf #q6) (isconf #q1) (isgrasp o10 #g2))
          :effect (isholdingmotion #q6 #t791 #q1 o10 #g2)
   )
   (:action s803_plan-holding-motion
          :parameters (#q6 #q1 o10 #g3)
          :precondition (and (isconf #q6) (isconf #q1) (isgrasp o10 #g3))
          :effect (isholdingmotion #q6 #t792 #q1 o10 #g3)
   )
   (:action s804_plan-holding-motion
          :parameters (#q6 #q2 o10 #g0)
          :precondition (and (isconf #q6) (isconf #q2) (isgrasp o10 #g0))
          :effect (isholdingmotion #q6 #t793 #q2 o10 #g0)
   )
   (:action s805_plan-holding-motion
          :parameters (#q6 #q2 o10 #g1)
          :precondition (and (isconf #q6) (isconf #q2) (isgrasp o10 #g1))
          :effect (isholdingmotion #q6 #t794 #q2 o10 #g1)
   )
   (:action s806_plan-holding-motion
          :parameters (#q6 #q2 o10 #g2)
          :precondition (and (isconf #q6) (isconf #q2) (isgrasp o10 #g2))
          :effect (isholdingmotion #q6 #t795 #q2 o10 #g2)
   )
   (:action s807_plan-holding-motion
          :parameters (#q6 #q2 o10 #g3)
          :precondition (and (isconf #q6) (isconf #q2) (isgrasp o10 #g3))
          :effect (isholdingmotion #q6 #t796 #q2 o10 #g3)
   )
   (:action s808_plan-holding-motion
          :parameters (#q6 #q3 o10 #g0)
          :precondition (and (isconf #q6) (isconf #q3) (isgrasp o10 #g0))
          :effect (isholdingmotion #q6 #t797 #q3 o10 #g0)
   )
   (:action s809_plan-holding-motion
          :parameters (#q6 #q3 o10 #g1)
          :precondition (and (isconf #q6) (isconf #q3) (isgrasp o10 #g1))
          :effect (isholdingmotion #q6 #t798 #q3 o10 #g1)
   )
   (:action s810_plan-holding-motion
          :parameters (#q6 #q3 o10 #g2)
          :precondition (and (isconf #q6) (isconf #q3) (isgrasp o10 #g2))
          :effect (isholdingmotion #q6 #t799 #q3 o10 #g2)
   )
   (:action s811_plan-holding-motion
          :parameters (#q6 #q3 o10 #g3)
          :precondition (and (isconf #q6) (isconf #q3) (isgrasp o10 #g3))
          :effect (isholdingmotion #q6 #t800 #q3 o10 #g3)
   )
   (:action s812_plan-holding-motion
          :parameters (#q6 #q4 o10 #g0)
          :precondition (and (isconf #q6) (isconf #q4) (isgrasp o10 #g0))
          :effect (isholdingmotion #q6 #t801 #q4 o10 #g0)
   )
   (:action s813_plan-holding-motion
          :parameters (#q6 #q4 o10 #g1)
          :precondition (and (isconf #q6) (isconf #q4) (isgrasp o10 #g1))
          :effect (isholdingmotion #q6 #t802 #q4 o10 #g1)
   )
   (:action s814_plan-holding-motion
          :parameters (#q6 #q4 o10 #g2)
          :precondition (and (isconf #q6) (isconf #q4) (isgrasp o10 #g2))
          :effect (isholdingmotion #q6 #t803 #q4 o10 #g2)
   )
   (:action s815_plan-holding-motion
          :parameters (#q6 #q4 o10 #g3)
          :precondition (and (isconf #q6) (isconf #q4) (isgrasp o10 #g3))
          :effect (isholdingmotion #q6 #t804 #q4 o10 #g3)
   )
   (:action s816_plan-holding-motion
          :parameters (#q6 #q5 o10 #g0)
          :precondition (and (isconf #q6) (isconf #q5) (isgrasp o10 #g0))
          :effect (isholdingmotion #q6 #t805 #q5 o10 #g0)
   )
   (:action s817_plan-holding-motion
          :parameters (#q6 #q5 o10 #g1)
          :precondition (and (isconf #q6) (isconf #q5) (isgrasp o10 #g1))
          :effect (isholdingmotion #q6 #t806 #q5 o10 #g1)
   )
   (:action s818_plan-holding-motion
          :parameters (#q6 #q5 o10 #g2)
          :precondition (and (isconf #q6) (isconf #q5) (isgrasp o10 #g2))
          :effect (isholdingmotion #q6 #t807 #q5 o10 #g2)
   )
   (:action s819_plan-holding-motion
          :parameters (#q6 #q5 o10 #g3)
          :precondition (and (isconf #q6) (isconf #q5) (isgrasp o10 #g3))
          :effect (isholdingmotion #q6 #t808 #q5 o10 #g3)
   )
   (:action s820_plan-holding-motion
          :parameters (#q6 #q6 o10 #g0)
          :precondition (and (isconf #q6) (isconf #q6) (isgrasp o10 #g0))
          :effect (isholdingmotion #q6 #t809 #q6 o10 #g0)
   )
   (:action s821_plan-holding-motion
          :parameters (#q6 #q6 o10 #g1)
          :precondition (and (isconf #q6) (isconf #q6) (isgrasp o10 #g1))
          :effect (isholdingmotion #q6 #t810 #q6 o10 #g1)
   )
   (:action s822_plan-holding-motion
          :parameters (#q6 #q6 o10 #g2)
          :precondition (and (isconf #q6) (isconf #q6) (isgrasp o10 #g2))
          :effect (isholdingmotion #q6 #t811 #q6 o10 #g2)
   )
   (:action s823_plan-holding-motion
          :parameters (#q6 #q6 o10 #g3)
          :precondition (and (isconf #q6) (isconf #q6) (isgrasp o10 #g3))
          :effect (isholdingmotion #q6 #t812 #q6 o10 #g3)
   )
   (:action s824_plan-holding-motion
          :parameters (#q6 #q7 o10 #g0)
          :precondition (and (isconf #q6) (isconf #q7) (isgrasp o10 #g0))
          :effect (isholdingmotion #q6 #t813 #q7 o10 #g0)
   )
   (:action s825_plan-holding-motion
          :parameters (#q6 #q7 o10 #g1)
          :precondition (and (isconf #q6) (isconf #q7) (isgrasp o10 #g1))
          :effect (isholdingmotion #q6 #t814 #q7 o10 #g1)
   )
   (:action s826_plan-holding-motion
          :parameters (#q6 #q7 o10 #g2)
          :precondition (and (isconf #q6) (isconf #q7) (isgrasp o10 #g2))
          :effect (isholdingmotion #q6 #t815 #q7 o10 #g2)
   )
   (:action s827_plan-holding-motion
          :parameters (#q6 #q7 o10 #g3)
          :precondition (and (isconf #q6) (isconf #q7) (isgrasp o10 #g3))
          :effect (isholdingmotion #q6 #t816 #q7 o10 #g3)
   )
   (:action s828_plan-holding-motion
          :parameters (#q6 #q8 o10 #g0)
          :precondition (and (isconf #q6) (isconf #q8) (isgrasp o10 #g0))
          :effect (isholdingmotion #q6 #t817 #q8 o10 #g0)
   )
   (:action s829_plan-holding-motion
          :parameters (#q6 #q8 o10 #g1)
          :precondition (and (isconf #q6) (isconf #q8) (isgrasp o10 #g1))
          :effect (isholdingmotion #q6 #t818 #q8 o10 #g1)
   )
   (:action s830_plan-holding-motion
          :parameters (#q6 #q8 o10 #g2)
          :precondition (and (isconf #q6) (isconf #q8) (isgrasp o10 #g2))
          :effect (isholdingmotion #q6 #t819 #q8 o10 #g2)
   )
   (:action s831_plan-holding-motion
          :parameters (#q6 #q8 o10 #g3)
          :precondition (and (isconf #q6) (isconf #q8) (isgrasp o10 #g3))
          :effect (isholdingmotion #q6 #t820 #q8 o10 #g3)
   )
   (:action s832_plan-holding-motion
          :parameters (#q6 #q9 o10 #g0)
          :precondition (and (isconf #q6) (isconf #q9) (isgrasp o10 #g0))
          :effect (isholdingmotion #q6 #t821 #q9 o10 #g0)
   )
   (:action s833_plan-holding-motion
          :parameters (#q6 #q9 o10 #g1)
          :precondition (and (isconf #q6) (isconf #q9) (isgrasp o10 #g1))
          :effect (isholdingmotion #q6 #t822 #q9 o10 #g1)
   )
   (:action s834_plan-holding-motion
          :parameters (#q6 #q9 o10 #g2)
          :precondition (and (isconf #q6) (isconf #q9) (isgrasp o10 #g2))
          :effect (isholdingmotion #q6 #t823 #q9 o10 #g2)
   )
   (:action s835_plan-holding-motion
          :parameters (#q6 #q9 o10 #g3)
          :precondition (and (isconf #q6) (isconf #q9) (isgrasp o10 #g3))
          :effect (isholdingmotion #q6 #t824 #q9 o10 #g3)
   )
   (:action s836_plan-holding-motion
          :parameters (#q6 #q10 o10 #g0)
          :precondition (and (isconf #q6) (isconf #q10) (isgrasp o10 #g0))
          :effect (isholdingmotion #q6 #t825 #q10 o10 #g0)
   )
   (:action s837_plan-holding-motion
          :parameters (#q6 #q10 o10 #g1)
          :precondition (and (isconf #q6) (isconf #q10) (isgrasp o10 #g1))
          :effect (isholdingmotion #q6 #t826 #q10 o10 #g1)
   )
   (:action s838_plan-holding-motion
          :parameters (#q6 #q10 o10 #g2)
          :precondition (and (isconf #q6) (isconf #q10) (isgrasp o10 #g2))
          :effect (isholdingmotion #q6 #t827 #q10 o10 #g2)
   )
   (:action s839_plan-holding-motion
          :parameters (#q6 #q10 o10 #g3)
          :precondition (and (isconf #q6) (isconf #q10) (isgrasp o10 #g3))
          :effect (isholdingmotion #q6 #t828 #q10 o10 #g3)
   )
   (:action s840_plan-holding-motion
          :parameters (#q6 #q11 o10 #g0)
          :precondition (and (isconf #q6) (isconf #q11) (isgrasp o10 #g0))
          :effect (isholdingmotion #q6 #t829 #q11 o10 #g0)
   )
   (:action s841_plan-holding-motion
          :parameters (#q6 #q11 o10 #g1)
          :precondition (and (isconf #q6) (isconf #q11) (isgrasp o10 #g1))
          :effect (isholdingmotion #q6 #t830 #q11 o10 #g1)
   )
   (:action s842_plan-holding-motion
          :parameters (#q6 #q11 o10 #g2)
          :precondition (and (isconf #q6) (isconf #q11) (isgrasp o10 #g2))
          :effect (isholdingmotion #q6 #t831 #q11 o10 #g2)
   )
   (:action s843_plan-holding-motion
          :parameters (#q6 #q11 o10 #g3)
          :precondition (and (isconf #q6) (isconf #q11) (isgrasp o10 #g3))
          :effect (isholdingmotion #q6 #t832 #q11 o10 #g3)
   )
   (:action s844_plan-holding-motion
          :parameters (#q6 #q12 o10 #g0)
          :precondition (and (isconf #q6) (isconf #q12) (isgrasp o10 #g0))
          :effect (isholdingmotion #q6 #t833 #q12 o10 #g0)
   )
   (:action s845_plan-holding-motion
          :parameters (#q6 #q12 o10 #g1)
          :precondition (and (isconf #q6) (isconf #q12) (isgrasp o10 #g1))
          :effect (isholdingmotion #q6 #t834 #q12 o10 #g1)
   )
   (:action s846_plan-holding-motion
          :parameters (#q6 #q12 o10 #g2)
          :precondition (and (isconf #q6) (isconf #q12) (isgrasp o10 #g2))
          :effect (isholdingmotion #q6 #t835 #q12 o10 #g2)
   )
   (:action s847_plan-holding-motion
          :parameters (#q6 #q12 o10 #g3)
          :precondition (and (isconf #q6) (isconf #q12) (isgrasp o10 #g3))
          :effect (isholdingmotion #q6 #t836 #q12 o10 #g3)
   )
   (:action s848_plan-holding-motion
          :parameters (#q6 #q13 o10 #g0)
          :precondition (and (isconf #q6) (isconf #q13) (isgrasp o10 #g0))
          :effect (isholdingmotion #q6 #t837 #q13 o10 #g0)
   )
   (:action s849_plan-holding-motion
          :parameters (#q6 #q13 o10 #g1)
          :precondition (and (isconf #q6) (isconf #q13) (isgrasp o10 #g1))
          :effect (isholdingmotion #q6 #t838 #q13 o10 #g1)
   )
   (:action s850_plan-holding-motion
          :parameters (#q6 #q13 o10 #g2)
          :precondition (and (isconf #q6) (isconf #q13) (isgrasp o10 #g2))
          :effect (isholdingmotion #q6 #t839 #q13 o10 #g2)
   )
   (:action s851_plan-holding-motion
          :parameters (#q6 #q13 o10 #g3)
          :precondition (and (isconf #q6) (isconf #q13) (isgrasp o10 #g3))
          :effect (isholdingmotion #q6 #t840 #q13 o10 #g3)
   )
   (:action s852_plan-holding-motion
          :parameters (#q6 #q14 o10 #g0)
          :precondition (and (isconf #q6) (isconf #q14) (isgrasp o10 #g0))
          :effect (isholdingmotion #q6 #t841 #q14 o10 #g0)
   )
   (:action s853_plan-holding-motion
          :parameters (#q6 #q14 o10 #g1)
          :precondition (and (isconf #q6) (isconf #q14) (isgrasp o10 #g1))
          :effect (isholdingmotion #q6 #t842 #q14 o10 #g1)
   )
   (:action s854_plan-holding-motion
          :parameters (#q6 #q14 o10 #g2)
          :precondition (and (isconf #q6) (isconf #q14) (isgrasp o10 #g2))
          :effect (isholdingmotion #q6 #t843 #q14 o10 #g2)
   )
   (:action s855_plan-holding-motion
          :parameters (#q6 #q14 o10 #g3)
          :precondition (and (isconf #q6) (isconf #q14) (isgrasp o10 #g3))
          :effect (isholdingmotion #q6 #t844 #q14 o10 #g3)
   )
   (:action s856_plan-holding-motion
          :parameters (#q6 #q15 o10 #g0)
          :precondition (and (isconf #q6) (isconf #q15) (isgrasp o10 #g0))
          :effect (isholdingmotion #q6 #t845 #q15 o10 #g0)
   )
   (:action s857_plan-holding-motion
          :parameters (#q6 #q15 o10 #g1)
          :precondition (and (isconf #q6) (isconf #q15) (isgrasp o10 #g1))
          :effect (isholdingmotion #q6 #t846 #q15 o10 #g1)
   )
   (:action s858_plan-holding-motion
          :parameters (#q6 #q15 o10 #g2)
          :precondition (and (isconf #q6) (isconf #q15) (isgrasp o10 #g2))
          :effect (isholdingmotion #q6 #t847 #q15 o10 #g2)
   )
   (:action s859_plan-holding-motion
          :parameters (#q6 #q15 o10 #g3)
          :precondition (and (isconf #q6) (isconf #q15) (isgrasp o10 #g3))
          :effect (isholdingmotion #q6 #t848 #q15 o10 #g3)
   )
   (:action s860_plan-holding-motion
          :parameters (#q7 q224 o10 #g0)
          :precondition (and (isconf #q7) (isconf q224) (isgrasp o10 #g0))
          :effect (isholdingmotion #q7 #t849 q224 o10 #g0)
   )
   (:action s861_plan-holding-motion
          :parameters (#q7 q224 o10 #g1)
          :precondition (and (isconf #q7) (isconf q224) (isgrasp o10 #g1))
          :effect (isholdingmotion #q7 #t850 q224 o10 #g1)
   )
   (:action s862_plan-holding-motion
          :parameters (#q7 q224 o10 #g2)
          :precondition (and (isconf #q7) (isconf q224) (isgrasp o10 #g2))
          :effect (isholdingmotion #q7 #t851 q224 o10 #g2)
   )
   (:action s863_plan-holding-motion
          :parameters (#q7 q224 o10 #g3)
          :precondition (and (isconf #q7) (isconf q224) (isgrasp o10 #g3))
          :effect (isholdingmotion #q7 #t852 q224 o10 #g3)
   )
   (:action s864_plan-holding-motion
          :parameters (#q7 #q0 o10 #g0)
          :precondition (and (isconf #q7) (isconf #q0) (isgrasp o10 #g0))
          :effect (isholdingmotion #q7 #t853 #q0 o10 #g0)
   )
   (:action s865_plan-holding-motion
          :parameters (#q7 #q0 o10 #g1)
          :precondition (and (isconf #q7) (isconf #q0) (isgrasp o10 #g1))
          :effect (isholdingmotion #q7 #t854 #q0 o10 #g1)
   )
   (:action s866_plan-holding-motion
          :parameters (#q7 #q0 o10 #g2)
          :precondition (and (isconf #q7) (isconf #q0) (isgrasp o10 #g2))
          :effect (isholdingmotion #q7 #t855 #q0 o10 #g2)
   )
   (:action s867_plan-holding-motion
          :parameters (#q7 #q0 o10 #g3)
          :precondition (and (isconf #q7) (isconf #q0) (isgrasp o10 #g3))
          :effect (isholdingmotion #q7 #t856 #q0 o10 #g3)
   )
   (:action s868_plan-holding-motion
          :parameters (#q7 #q1 o10 #g0)
          :precondition (and (isconf #q7) (isconf #q1) (isgrasp o10 #g0))
          :effect (isholdingmotion #q7 #t857 #q1 o10 #g0)
   )
   (:action s869_plan-holding-motion
          :parameters (#q7 #q1 o10 #g1)
          :precondition (and (isconf #q7) (isconf #q1) (isgrasp o10 #g1))
          :effect (isholdingmotion #q7 #t858 #q1 o10 #g1)
   )
   (:action s870_plan-holding-motion
          :parameters (#q7 #q1 o10 #g2)
          :precondition (and (isconf #q7) (isconf #q1) (isgrasp o10 #g2))
          :effect (isholdingmotion #q7 #t859 #q1 o10 #g2)
   )
   (:action s871_plan-holding-motion
          :parameters (#q7 #q1 o10 #g3)
          :precondition (and (isconf #q7) (isconf #q1) (isgrasp o10 #g3))
          :effect (isholdingmotion #q7 #t860 #q1 o10 #g3)
   )
   (:action s872_plan-holding-motion
          :parameters (#q7 #q2 o10 #g0)
          :precondition (and (isconf #q7) (isconf #q2) (isgrasp o10 #g0))
          :effect (isholdingmotion #q7 #t861 #q2 o10 #g0)
   )
   (:action s873_plan-holding-motion
          :parameters (#q7 #q2 o10 #g1)
          :precondition (and (isconf #q7) (isconf #q2) (isgrasp o10 #g1))
          :effect (isholdingmotion #q7 #t862 #q2 o10 #g1)
   )
   (:action s874_plan-holding-motion
          :parameters (#q7 #q2 o10 #g2)
          :precondition (and (isconf #q7) (isconf #q2) (isgrasp o10 #g2))
          :effect (isholdingmotion #q7 #t863 #q2 o10 #g2)
   )
   (:action s875_plan-holding-motion
          :parameters (#q7 #q2 o10 #g3)
          :precondition (and (isconf #q7) (isconf #q2) (isgrasp o10 #g3))
          :effect (isholdingmotion #q7 #t864 #q2 o10 #g3)
   )
   (:action s876_plan-holding-motion
          :parameters (#q7 #q3 o10 #g0)
          :precondition (and (isconf #q7) (isconf #q3) (isgrasp o10 #g0))
          :effect (isholdingmotion #q7 #t865 #q3 o10 #g0)
   )
   (:action s877_plan-holding-motion
          :parameters (#q7 #q3 o10 #g1)
          :precondition (and (isconf #q7) (isconf #q3) (isgrasp o10 #g1))
          :effect (isholdingmotion #q7 #t866 #q3 o10 #g1)
   )
   (:action s878_plan-holding-motion
          :parameters (#q7 #q3 o10 #g2)
          :precondition (and (isconf #q7) (isconf #q3) (isgrasp o10 #g2))
          :effect (isholdingmotion #q7 #t867 #q3 o10 #g2)
   )
   (:action s879_plan-holding-motion
          :parameters (#q7 #q3 o10 #g3)
          :precondition (and (isconf #q7) (isconf #q3) (isgrasp o10 #g3))
          :effect (isholdingmotion #q7 #t868 #q3 o10 #g3)
   )
   (:action s880_plan-holding-motion
          :parameters (#q7 #q4 o10 #g0)
          :precondition (and (isconf #q7) (isconf #q4) (isgrasp o10 #g0))
          :effect (isholdingmotion #q7 #t869 #q4 o10 #g0)
   )
   (:action s881_plan-holding-motion
          :parameters (#q7 #q4 o10 #g1)
          :precondition (and (isconf #q7) (isconf #q4) (isgrasp o10 #g1))
          :effect (isholdingmotion #q7 #t870 #q4 o10 #g1)
   )
   (:action s882_plan-holding-motion
          :parameters (#q7 #q4 o10 #g2)
          :precondition (and (isconf #q7) (isconf #q4) (isgrasp o10 #g2))
          :effect (isholdingmotion #q7 #t871 #q4 o10 #g2)
   )
   (:action s883_plan-holding-motion
          :parameters (#q7 #q4 o10 #g3)
          :precondition (and (isconf #q7) (isconf #q4) (isgrasp o10 #g3))
          :effect (isholdingmotion #q7 #t872 #q4 o10 #g3)
   )
   (:action s884_plan-holding-motion
          :parameters (#q7 #q5 o10 #g0)
          :precondition (and (isconf #q7) (isconf #q5) (isgrasp o10 #g0))
          :effect (isholdingmotion #q7 #t873 #q5 o10 #g0)
   )
   (:action s885_plan-holding-motion
          :parameters (#q7 #q5 o10 #g1)
          :precondition (and (isconf #q7) (isconf #q5) (isgrasp o10 #g1))
          :effect (isholdingmotion #q7 #t874 #q5 o10 #g1)
   )
   (:action s886_plan-holding-motion
          :parameters (#q7 #q5 o10 #g2)
          :precondition (and (isconf #q7) (isconf #q5) (isgrasp o10 #g2))
          :effect (isholdingmotion #q7 #t875 #q5 o10 #g2)
   )
   (:action s887_plan-holding-motion
          :parameters (#q7 #q5 o10 #g3)
          :precondition (and (isconf #q7) (isconf #q5) (isgrasp o10 #g3))
          :effect (isholdingmotion #q7 #t876 #q5 o10 #g3)
   )
   (:action s888_plan-holding-motion
          :parameters (#q7 #q6 o10 #g0)
          :precondition (and (isconf #q7) (isconf #q6) (isgrasp o10 #g0))
          :effect (isholdingmotion #q7 #t877 #q6 o10 #g0)
   )
   (:action s889_plan-holding-motion
          :parameters (#q7 #q6 o10 #g1)
          :precondition (and (isconf #q7) (isconf #q6) (isgrasp o10 #g1))
          :effect (isholdingmotion #q7 #t878 #q6 o10 #g1)
   )
   (:action s890_plan-holding-motion
          :parameters (#q7 #q6 o10 #g2)
          :precondition (and (isconf #q7) (isconf #q6) (isgrasp o10 #g2))
          :effect (isholdingmotion #q7 #t879 #q6 o10 #g2)
   )
   (:action s891_plan-holding-motion
          :parameters (#q7 #q6 o10 #g3)
          :precondition (and (isconf #q7) (isconf #q6) (isgrasp o10 #g3))
          :effect (isholdingmotion #q7 #t880 #q6 o10 #g3)
   )
   (:action s892_plan-holding-motion
          :parameters (#q7 #q7 o10 #g0)
          :precondition (and (isconf #q7) (isconf #q7) (isgrasp o10 #g0))
          :effect (isholdingmotion #q7 #t881 #q7 o10 #g0)
   )
   (:action s893_plan-holding-motion
          :parameters (#q7 #q7 o10 #g1)
          :precondition (and (isconf #q7) (isconf #q7) (isgrasp o10 #g1))
          :effect (isholdingmotion #q7 #t882 #q7 o10 #g1)
   )
   (:action s894_plan-holding-motion
          :parameters (#q7 #q7 o10 #g2)
          :precondition (and (isconf #q7) (isconf #q7) (isgrasp o10 #g2))
          :effect (isholdingmotion #q7 #t883 #q7 o10 #g2)
   )
   (:action s895_plan-holding-motion
          :parameters (#q7 #q7 o10 #g3)
          :precondition (and (isconf #q7) (isconf #q7) (isgrasp o10 #g3))
          :effect (isholdingmotion #q7 #t884 #q7 o10 #g3)
   )
   (:action s896_plan-holding-motion
          :parameters (#q7 #q8 o10 #g0)
          :precondition (and (isconf #q7) (isconf #q8) (isgrasp o10 #g0))
          :effect (isholdingmotion #q7 #t885 #q8 o10 #g0)
   )
   (:action s897_plan-holding-motion
          :parameters (#q7 #q8 o10 #g1)
          :precondition (and (isconf #q7) (isconf #q8) (isgrasp o10 #g1))
          :effect (isholdingmotion #q7 #t886 #q8 o10 #g1)
   )
   (:action s898_plan-holding-motion
          :parameters (#q7 #q8 o10 #g2)
          :precondition (and (isconf #q7) (isconf #q8) (isgrasp o10 #g2))
          :effect (isholdingmotion #q7 #t887 #q8 o10 #g2)
   )
   (:action s899_plan-holding-motion
          :parameters (#q7 #q8 o10 #g3)
          :precondition (and (isconf #q7) (isconf #q8) (isgrasp o10 #g3))
          :effect (isholdingmotion #q7 #t888 #q8 o10 #g3)
   )
   (:action s900_plan-holding-motion
          :parameters (#q7 #q9 o10 #g0)
          :precondition (and (isconf #q7) (isconf #q9) (isgrasp o10 #g0))
          :effect (isholdingmotion #q7 #t889 #q9 o10 #g0)
   )
   (:action s901_plan-holding-motion
          :parameters (#q7 #q9 o10 #g1)
          :precondition (and (isconf #q7) (isconf #q9) (isgrasp o10 #g1))
          :effect (isholdingmotion #q7 #t890 #q9 o10 #g1)
   )
   (:action s902_plan-holding-motion
          :parameters (#q7 #q9 o10 #g2)
          :precondition (and (isconf #q7) (isconf #q9) (isgrasp o10 #g2))
          :effect (isholdingmotion #q7 #t891 #q9 o10 #g2)
   )
   (:action s903_plan-holding-motion
          :parameters (#q7 #q9 o10 #g3)
          :precondition (and (isconf #q7) (isconf #q9) (isgrasp o10 #g3))
          :effect (isholdingmotion #q7 #t892 #q9 o10 #g3)
   )
   (:action s904_plan-holding-motion
          :parameters (#q7 #q10 o10 #g0)
          :precondition (and (isconf #q7) (isconf #q10) (isgrasp o10 #g0))
          :effect (isholdingmotion #q7 #t893 #q10 o10 #g0)
   )
   (:action s905_plan-holding-motion
          :parameters (#q7 #q10 o10 #g1)
          :precondition (and (isconf #q7) (isconf #q10) (isgrasp o10 #g1))
          :effect (isholdingmotion #q7 #t894 #q10 o10 #g1)
   )
   (:action s906_plan-holding-motion
          :parameters (#q7 #q10 o10 #g2)
          :precondition (and (isconf #q7) (isconf #q10) (isgrasp o10 #g2))
          :effect (isholdingmotion #q7 #t895 #q10 o10 #g2)
   )
   (:action s907_plan-holding-motion
          :parameters (#q7 #q10 o10 #g3)
          :precondition (and (isconf #q7) (isconf #q10) (isgrasp o10 #g3))
          :effect (isholdingmotion #q7 #t896 #q10 o10 #g3)
   )
   (:action s908_plan-holding-motion
          :parameters (#q7 #q11 o10 #g0)
          :precondition (and (isconf #q7) (isconf #q11) (isgrasp o10 #g0))
          :effect (isholdingmotion #q7 #t897 #q11 o10 #g0)
   )
   (:action s909_plan-holding-motion
          :parameters (#q7 #q11 o10 #g1)
          :precondition (and (isconf #q7) (isconf #q11) (isgrasp o10 #g1))
          :effect (isholdingmotion #q7 #t898 #q11 o10 #g1)
   )
   (:action s910_plan-holding-motion
          :parameters (#q7 #q11 o10 #g2)
          :precondition (and (isconf #q7) (isconf #q11) (isgrasp o10 #g2))
          :effect (isholdingmotion #q7 #t899 #q11 o10 #g2)
   )
   (:action s911_plan-holding-motion
          :parameters (#q7 #q11 o10 #g3)
          :precondition (and (isconf #q7) (isconf #q11) (isgrasp o10 #g3))
          :effect (isholdingmotion #q7 #t900 #q11 o10 #g3)
   )
   (:action s912_plan-holding-motion
          :parameters (#q7 #q12 o10 #g0)
          :precondition (and (isconf #q7) (isconf #q12) (isgrasp o10 #g0))
          :effect (isholdingmotion #q7 #t901 #q12 o10 #g0)
   )
   (:action s913_plan-holding-motion
          :parameters (#q7 #q12 o10 #g1)
          :precondition (and (isconf #q7) (isconf #q12) (isgrasp o10 #g1))
          :effect (isholdingmotion #q7 #t902 #q12 o10 #g1)
   )
   (:action s914_plan-holding-motion
          :parameters (#q7 #q12 o10 #g2)
          :precondition (and (isconf #q7) (isconf #q12) (isgrasp o10 #g2))
          :effect (isholdingmotion #q7 #t903 #q12 o10 #g2)
   )
   (:action s915_plan-holding-motion
          :parameters (#q7 #q12 o10 #g3)
          :precondition (and (isconf #q7) (isconf #q12) (isgrasp o10 #g3))
          :effect (isholdingmotion #q7 #t904 #q12 o10 #g3)
   )
   (:action s916_plan-holding-motion
          :parameters (#q7 #q13 o10 #g0)
          :precondition (and (isconf #q7) (isconf #q13) (isgrasp o10 #g0))
          :effect (isholdingmotion #q7 #t905 #q13 o10 #g0)
   )
   (:action s917_plan-holding-motion
          :parameters (#q7 #q13 o10 #g1)
          :precondition (and (isconf #q7) (isconf #q13) (isgrasp o10 #g1))
          :effect (isholdingmotion #q7 #t906 #q13 o10 #g1)
   )
   (:action s918_plan-holding-motion
          :parameters (#q7 #q13 o10 #g2)
          :precondition (and (isconf #q7) (isconf #q13) (isgrasp o10 #g2))
          :effect (isholdingmotion #q7 #t907 #q13 o10 #g2)
   )
   (:action s919_plan-holding-motion
          :parameters (#q7 #q13 o10 #g3)
          :precondition (and (isconf #q7) (isconf #q13) (isgrasp o10 #g3))
          :effect (isholdingmotion #q7 #t908 #q13 o10 #g3)
   )
   (:action s920_plan-holding-motion
          :parameters (#q7 #q14 o10 #g0)
          :precondition (and (isconf #q7) (isconf #q14) (isgrasp o10 #g0))
          :effect (isholdingmotion #q7 #t909 #q14 o10 #g0)
   )
   (:action s921_plan-holding-motion
          :parameters (#q7 #q14 o10 #g1)
          :precondition (and (isconf #q7) (isconf #q14) (isgrasp o10 #g1))
          :effect (isholdingmotion #q7 #t910 #q14 o10 #g1)
   )
   (:action s922_plan-holding-motion
          :parameters (#q7 #q14 o10 #g2)
          :precondition (and (isconf #q7) (isconf #q14) (isgrasp o10 #g2))
          :effect (isholdingmotion #q7 #t911 #q14 o10 #g2)
   )
   (:action s923_plan-holding-motion
          :parameters (#q7 #q14 o10 #g3)
          :precondition (and (isconf #q7) (isconf #q14) (isgrasp o10 #g3))
          :effect (isholdingmotion #q7 #t912 #q14 o10 #g3)
   )
   (:action s924_plan-holding-motion
          :parameters (#q7 #q15 o10 #g0)
          :precondition (and (isconf #q7) (isconf #q15) (isgrasp o10 #g0))
          :effect (isholdingmotion #q7 #t913 #q15 o10 #g0)
   )
   (:action s925_plan-holding-motion
          :parameters (#q7 #q15 o10 #g1)
          :precondition (and (isconf #q7) (isconf #q15) (isgrasp o10 #g1))
          :effect (isholdingmotion #q7 #t914 #q15 o10 #g1)
   )
   (:action s926_plan-holding-motion
          :parameters (#q7 #q15 o10 #g2)
          :precondition (and (isconf #q7) (isconf #q15) (isgrasp o10 #g2))
          :effect (isholdingmotion #q7 #t915 #q15 o10 #g2)
   )
   (:action s927_plan-holding-motion
          :parameters (#q7 #q15 o10 #g3)
          :precondition (and (isconf #q7) (isconf #q15) (isgrasp o10 #g3))
          :effect (isholdingmotion #q7 #t916 #q15 o10 #g3)
   )
   (:action s928_plan-holding-motion
          :parameters (#q8 q224 o10 #g0)
          :precondition (and (isconf #q8) (isconf q224) (isgrasp o10 #g0))
          :effect (isholdingmotion #q8 #t917 q224 o10 #g0)
   )
   (:action s929_plan-holding-motion
          :parameters (#q8 q224 o10 #g1)
          :precondition (and (isconf #q8) (isconf q224) (isgrasp o10 #g1))
          :effect (isholdingmotion #q8 #t918 q224 o10 #g1)
   )
   (:action s930_plan-holding-motion
          :parameters (#q8 q224 o10 #g2)
          :precondition (and (isconf #q8) (isconf q224) (isgrasp o10 #g2))
          :effect (isholdingmotion #q8 #t919 q224 o10 #g2)
   )
   (:action s931_plan-holding-motion
          :parameters (#q8 q224 o10 #g3)
          :precondition (and (isconf #q8) (isconf q224) (isgrasp o10 #g3))
          :effect (isholdingmotion #q8 #t920 q224 o10 #g3)
   )
   (:action s932_plan-holding-motion
          :parameters (#q8 #q0 o10 #g0)
          :precondition (and (isconf #q8) (isconf #q0) (isgrasp o10 #g0))
          :effect (isholdingmotion #q8 #t921 #q0 o10 #g0)
   )
   (:action s933_plan-holding-motion
          :parameters (#q8 #q0 o10 #g1)
          :precondition (and (isconf #q8) (isconf #q0) (isgrasp o10 #g1))
          :effect (isholdingmotion #q8 #t922 #q0 o10 #g1)
   )
   (:action s934_plan-holding-motion
          :parameters (#q8 #q0 o10 #g2)
          :precondition (and (isconf #q8) (isconf #q0) (isgrasp o10 #g2))
          :effect (isholdingmotion #q8 #t923 #q0 o10 #g2)
   )
   (:action s935_plan-holding-motion
          :parameters (#q8 #q0 o10 #g3)
          :precondition (and (isconf #q8) (isconf #q0) (isgrasp o10 #g3))
          :effect (isholdingmotion #q8 #t924 #q0 o10 #g3)
   )
   (:action s936_plan-holding-motion
          :parameters (#q8 #q1 o10 #g0)
          :precondition (and (isconf #q8) (isconf #q1) (isgrasp o10 #g0))
          :effect (isholdingmotion #q8 #t925 #q1 o10 #g0)
   )
   (:action s937_plan-holding-motion
          :parameters (#q8 #q1 o10 #g1)
          :precondition (and (isconf #q8) (isconf #q1) (isgrasp o10 #g1))
          :effect (isholdingmotion #q8 #t926 #q1 o10 #g1)
   )
   (:action s938_plan-holding-motion
          :parameters (#q8 #q1 o10 #g2)
          :precondition (and (isconf #q8) (isconf #q1) (isgrasp o10 #g2))
          :effect (isholdingmotion #q8 #t927 #q1 o10 #g2)
   )
   (:action s939_plan-holding-motion
          :parameters (#q8 #q1 o10 #g3)
          :precondition (and (isconf #q8) (isconf #q1) (isgrasp o10 #g3))
          :effect (isholdingmotion #q8 #t928 #q1 o10 #g3)
   )
   (:action s940_plan-holding-motion
          :parameters (#q8 #q2 o10 #g0)
          :precondition (and (isconf #q8) (isconf #q2) (isgrasp o10 #g0))
          :effect (isholdingmotion #q8 #t929 #q2 o10 #g0)
   )
   (:action s941_plan-holding-motion
          :parameters (#q8 #q2 o10 #g1)
          :precondition (and (isconf #q8) (isconf #q2) (isgrasp o10 #g1))
          :effect (isholdingmotion #q8 #t930 #q2 o10 #g1)
   )
   (:action s942_plan-holding-motion
          :parameters (#q8 #q2 o10 #g2)
          :precondition (and (isconf #q8) (isconf #q2) (isgrasp o10 #g2))
          :effect (isholdingmotion #q8 #t931 #q2 o10 #g2)
   )
   (:action s943_plan-holding-motion
          :parameters (#q8 #q2 o10 #g3)
          :precondition (and (isconf #q8) (isconf #q2) (isgrasp o10 #g3))
          :effect (isholdingmotion #q8 #t932 #q2 o10 #g3)
   )
   (:action s944_plan-holding-motion
          :parameters (#q8 #q3 o10 #g0)
          :precondition (and (isconf #q8) (isconf #q3) (isgrasp o10 #g0))
          :effect (isholdingmotion #q8 #t933 #q3 o10 #g0)
   )
   (:action s945_plan-holding-motion
          :parameters (#q8 #q3 o10 #g1)
          :precondition (and (isconf #q8) (isconf #q3) (isgrasp o10 #g1))
          :effect (isholdingmotion #q8 #t934 #q3 o10 #g1)
   )
   (:action s946_plan-holding-motion
          :parameters (#q8 #q3 o10 #g2)
          :precondition (and (isconf #q8) (isconf #q3) (isgrasp o10 #g2))
          :effect (isholdingmotion #q8 #t935 #q3 o10 #g2)
   )
   (:action s947_plan-holding-motion
          :parameters (#q8 #q3 o10 #g3)
          :precondition (and (isconf #q8) (isconf #q3) (isgrasp o10 #g3))
          :effect (isholdingmotion #q8 #t936 #q3 o10 #g3)
   )
   (:action s948_plan-holding-motion
          :parameters (#q8 #q4 o10 #g0)
          :precondition (and (isconf #q8) (isconf #q4) (isgrasp o10 #g0))
          :effect (isholdingmotion #q8 #t937 #q4 o10 #g0)
   )
   (:action s949_plan-holding-motion
          :parameters (#q8 #q4 o10 #g1)
          :precondition (and (isconf #q8) (isconf #q4) (isgrasp o10 #g1))
          :effect (isholdingmotion #q8 #t938 #q4 o10 #g1)
   )
   (:action s950_plan-holding-motion
          :parameters (#q8 #q4 o10 #g2)
          :precondition (and (isconf #q8) (isconf #q4) (isgrasp o10 #g2))
          :effect (isholdingmotion #q8 #t939 #q4 o10 #g2)
   )
   (:action s951_plan-holding-motion
          :parameters (#q8 #q4 o10 #g3)
          :precondition (and (isconf #q8) (isconf #q4) (isgrasp o10 #g3))
          :effect (isholdingmotion #q8 #t940 #q4 o10 #g3)
   )
   (:action s952_plan-holding-motion
          :parameters (#q8 #q5 o10 #g0)
          :precondition (and (isconf #q8) (isconf #q5) (isgrasp o10 #g0))
          :effect (isholdingmotion #q8 #t941 #q5 o10 #g0)
   )
   (:action s953_plan-holding-motion
          :parameters (#q8 #q5 o10 #g1)
          :precondition (and (isconf #q8) (isconf #q5) (isgrasp o10 #g1))
          :effect (isholdingmotion #q8 #t942 #q5 o10 #g1)
   )
   (:action s954_plan-holding-motion
          :parameters (#q8 #q5 o10 #g2)
          :precondition (and (isconf #q8) (isconf #q5) (isgrasp o10 #g2))
          :effect (isholdingmotion #q8 #t943 #q5 o10 #g2)
   )
   (:action s955_plan-holding-motion
          :parameters (#q8 #q5 o10 #g3)
          :precondition (and (isconf #q8) (isconf #q5) (isgrasp o10 #g3))
          :effect (isholdingmotion #q8 #t944 #q5 o10 #g3)
   )
   (:action s956_plan-holding-motion
          :parameters (#q8 #q6 o10 #g0)
          :precondition (and (isconf #q8) (isconf #q6) (isgrasp o10 #g0))
          :effect (isholdingmotion #q8 #t945 #q6 o10 #g0)
   )
   (:action s957_plan-holding-motion
          :parameters (#q8 #q6 o10 #g1)
          :precondition (and (isconf #q8) (isconf #q6) (isgrasp o10 #g1))
          :effect (isholdingmotion #q8 #t946 #q6 o10 #g1)
   )
   (:action s958_plan-holding-motion
          :parameters (#q8 #q6 o10 #g2)
          :precondition (and (isconf #q8) (isconf #q6) (isgrasp o10 #g2))
          :effect (isholdingmotion #q8 #t947 #q6 o10 #g2)
   )
   (:action s959_plan-holding-motion
          :parameters (#q8 #q6 o10 #g3)
          :precondition (and (isconf #q8) (isconf #q6) (isgrasp o10 #g3))
          :effect (isholdingmotion #q8 #t948 #q6 o10 #g3)
   )
   (:action s960_plan-holding-motion
          :parameters (#q8 #q7 o10 #g0)
          :precondition (and (isconf #q8) (isconf #q7) (isgrasp o10 #g0))
          :effect (isholdingmotion #q8 #t949 #q7 o10 #g0)
   )
   (:action s961_plan-holding-motion
          :parameters (#q8 #q7 o10 #g1)
          :precondition (and (isconf #q8) (isconf #q7) (isgrasp o10 #g1))
          :effect (isholdingmotion #q8 #t950 #q7 o10 #g1)
   )
   (:action s962_plan-holding-motion
          :parameters (#q8 #q7 o10 #g2)
          :precondition (and (isconf #q8) (isconf #q7) (isgrasp o10 #g2))
          :effect (isholdingmotion #q8 #t951 #q7 o10 #g2)
   )
   (:action s963_plan-holding-motion
          :parameters (#q8 #q7 o10 #g3)
          :precondition (and (isconf #q8) (isconf #q7) (isgrasp o10 #g3))
          :effect (isholdingmotion #q8 #t952 #q7 o10 #g3)
   )
   (:action s964_plan-holding-motion
          :parameters (#q8 #q8 o10 #g0)
          :precondition (and (isconf #q8) (isconf #q8) (isgrasp o10 #g0))
          :effect (isholdingmotion #q8 #t953 #q8 o10 #g0)
   )
   (:action s965_plan-holding-motion
          :parameters (#q8 #q8 o10 #g1)
          :precondition (and (isconf #q8) (isconf #q8) (isgrasp o10 #g1))
          :effect (isholdingmotion #q8 #t954 #q8 o10 #g1)
   )
   (:action s966_plan-holding-motion
          :parameters (#q8 #q8 o10 #g2)
          :precondition (and (isconf #q8) (isconf #q8) (isgrasp o10 #g2))
          :effect (isholdingmotion #q8 #t955 #q8 o10 #g2)
   )
   (:action s967_plan-holding-motion
          :parameters (#q8 #q8 o10 #g3)
          :precondition (and (isconf #q8) (isconf #q8) (isgrasp o10 #g3))
          :effect (isholdingmotion #q8 #t956 #q8 o10 #g3)
   )
   (:action s968_plan-holding-motion
          :parameters (#q8 #q9 o10 #g0)
          :precondition (and (isconf #q8) (isconf #q9) (isgrasp o10 #g0))
          :effect (isholdingmotion #q8 #t957 #q9 o10 #g0)
   )
   (:action s969_plan-holding-motion
          :parameters (#q8 #q9 o10 #g1)
          :precondition (and (isconf #q8) (isconf #q9) (isgrasp o10 #g1))
          :effect (isholdingmotion #q8 #t958 #q9 o10 #g1)
   )
   (:action s970_plan-holding-motion
          :parameters (#q8 #q9 o10 #g2)
          :precondition (and (isconf #q8) (isconf #q9) (isgrasp o10 #g2))
          :effect (isholdingmotion #q8 #t959 #q9 o10 #g2)
   )
   (:action s971_plan-holding-motion
          :parameters (#q8 #q9 o10 #g3)
          :precondition (and (isconf #q8) (isconf #q9) (isgrasp o10 #g3))
          :effect (isholdingmotion #q8 #t960 #q9 o10 #g3)
   )
   (:action s972_plan-holding-motion
          :parameters (#q8 #q10 o10 #g0)
          :precondition (and (isconf #q8) (isconf #q10) (isgrasp o10 #g0))
          :effect (isholdingmotion #q8 #t961 #q10 o10 #g0)
   )
   (:action s973_plan-holding-motion
          :parameters (#q8 #q10 o10 #g1)
          :precondition (and (isconf #q8) (isconf #q10) (isgrasp o10 #g1))
          :effect (isholdingmotion #q8 #t962 #q10 o10 #g1)
   )
   (:action s974_plan-holding-motion
          :parameters (#q8 #q10 o10 #g2)
          :precondition (and (isconf #q8) (isconf #q10) (isgrasp o10 #g2))
          :effect (isholdingmotion #q8 #t963 #q10 o10 #g2)
   )
   (:action s975_plan-holding-motion
          :parameters (#q8 #q10 o10 #g3)
          :precondition (and (isconf #q8) (isconf #q10) (isgrasp o10 #g3))
          :effect (isholdingmotion #q8 #t964 #q10 o10 #g3)
   )
   (:action s976_plan-holding-motion
          :parameters (#q8 #q11 o10 #g0)
          :precondition (and (isconf #q8) (isconf #q11) (isgrasp o10 #g0))
          :effect (isholdingmotion #q8 #t965 #q11 o10 #g0)
   )
   (:action s977_plan-holding-motion
          :parameters (#q8 #q11 o10 #g1)
          :precondition (and (isconf #q8) (isconf #q11) (isgrasp o10 #g1))
          :effect (isholdingmotion #q8 #t966 #q11 o10 #g1)
   )
   (:action s978_plan-holding-motion
          :parameters (#q8 #q11 o10 #g2)
          :precondition (and (isconf #q8) (isconf #q11) (isgrasp o10 #g2))
          :effect (isholdingmotion #q8 #t967 #q11 o10 #g2)
   )
   (:action s979_plan-holding-motion
          :parameters (#q8 #q11 o10 #g3)
          :precondition (and (isconf #q8) (isconf #q11) (isgrasp o10 #g3))
          :effect (isholdingmotion #q8 #t968 #q11 o10 #g3)
   )
   (:action s980_plan-holding-motion
          :parameters (#q8 #q12 o10 #g0)
          :precondition (and (isconf #q8) (isconf #q12) (isgrasp o10 #g0))
          :effect (isholdingmotion #q8 #t969 #q12 o10 #g0)
   )
   (:action s981_plan-holding-motion
          :parameters (#q8 #q12 o10 #g1)
          :precondition (and (isconf #q8) (isconf #q12) (isgrasp o10 #g1))
          :effect (isholdingmotion #q8 #t970 #q12 o10 #g1)
   )
   (:action s982_plan-holding-motion
          :parameters (#q8 #q12 o10 #g2)
          :precondition (and (isconf #q8) (isconf #q12) (isgrasp o10 #g2))
          :effect (isholdingmotion #q8 #t971 #q12 o10 #g2)
   )
   (:action s983_plan-holding-motion
          :parameters (#q8 #q12 o10 #g3)
          :precondition (and (isconf #q8) (isconf #q12) (isgrasp o10 #g3))
          :effect (isholdingmotion #q8 #t972 #q12 o10 #g3)
   )
   (:action s984_plan-holding-motion
          :parameters (#q8 #q13 o10 #g0)
          :precondition (and (isconf #q8) (isconf #q13) (isgrasp o10 #g0))
          :effect (isholdingmotion #q8 #t973 #q13 o10 #g0)
   )
   (:action s985_plan-holding-motion
          :parameters (#q8 #q13 o10 #g1)
          :precondition (and (isconf #q8) (isconf #q13) (isgrasp o10 #g1))
          :effect (isholdingmotion #q8 #t974 #q13 o10 #g1)
   )
   (:action s986_plan-holding-motion
          :parameters (#q8 #q13 o10 #g2)
          :precondition (and (isconf #q8) (isconf #q13) (isgrasp o10 #g2))
          :effect (isholdingmotion #q8 #t975 #q13 o10 #g2)
   )
   (:action s987_plan-holding-motion
          :parameters (#q8 #q13 o10 #g3)
          :precondition (and (isconf #q8) (isconf #q13) (isgrasp o10 #g3))
          :effect (isholdingmotion #q8 #t976 #q13 o10 #g3)
   )
   (:action s988_plan-holding-motion
          :parameters (#q8 #q14 o10 #g0)
          :precondition (and (isconf #q8) (isconf #q14) (isgrasp o10 #g0))
          :effect (isholdingmotion #q8 #t977 #q14 o10 #g0)
   )
   (:action s989_plan-holding-motion
          :parameters (#q8 #q14 o10 #g1)
          :precondition (and (isconf #q8) (isconf #q14) (isgrasp o10 #g1))
          :effect (isholdingmotion #q8 #t978 #q14 o10 #g1)
   )
   (:action s990_plan-holding-motion
          :parameters (#q8 #q14 o10 #g2)
          :precondition (and (isconf #q8) (isconf #q14) (isgrasp o10 #g2))
          :effect (isholdingmotion #q8 #t979 #q14 o10 #g2)
   )
   (:action s991_plan-holding-motion
          :parameters (#q8 #q14 o10 #g3)
          :precondition (and (isconf #q8) (isconf #q14) (isgrasp o10 #g3))
          :effect (isholdingmotion #q8 #t980 #q14 o10 #g3)
   )
   (:action s992_plan-holding-motion
          :parameters (#q8 #q15 o10 #g0)
          :precondition (and (isconf #q8) (isconf #q15) (isgrasp o10 #g0))
          :effect (isholdingmotion #q8 #t981 #q15 o10 #g0)
   )
   (:action s993_plan-holding-motion
          :parameters (#q8 #q15 o10 #g1)
          :precondition (and (isconf #q8) (isconf #q15) (isgrasp o10 #g1))
          :effect (isholdingmotion #q8 #t982 #q15 o10 #g1)
   )
   (:action s994_plan-holding-motion
          :parameters (#q8 #q15 o10 #g2)
          :precondition (and (isconf #q8) (isconf #q15) (isgrasp o10 #g2))
          :effect (isholdingmotion #q8 #t983 #q15 o10 #g2)
   )
   (:action s995_plan-holding-motion
          :parameters (#q8 #q15 o10 #g3)
          :precondition (and (isconf #q8) (isconf #q15) (isgrasp o10 #g3))
          :effect (isholdingmotion #q8 #t984 #q15 o10 #g3)
   )
   (:action s996_plan-holding-motion
          :parameters (#q9 q224 o10 #g0)
          :precondition (and (isconf #q9) (isconf q224) (isgrasp o10 #g0))
          :effect (isholdingmotion #q9 #t985 q224 o10 #g0)
   )
   (:action s997_plan-holding-motion
          :parameters (#q9 q224 o10 #g1)
          :precondition (and (isconf #q9) (isconf q224) (isgrasp o10 #g1))
          :effect (isholdingmotion #q9 #t986 q224 o10 #g1)
   )
   (:action s998_plan-holding-motion
          :parameters (#q9 q224 o10 #g2)
          :precondition (and (isconf #q9) (isconf q224) (isgrasp o10 #g2))
          :effect (isholdingmotion #q9 #t987 q224 o10 #g2)
   )
   (:action s999_plan-holding-motion
          :parameters (#q9 q224 o10 #g3)
          :precondition (and (isconf #q9) (isconf q224) (isgrasp o10 #g3))
          :effect (isholdingmotion #q9 #t988 q224 o10 #g3)
   )
   (:action s1000_plan-holding-motion
          :parameters (#q9 #q0 o10 #g0)
          :precondition (and (isconf #q9) (isconf #q0) (isgrasp o10 #g0))
          :effect (isholdingmotion #q9 #t989 #q0 o10 #g0)
   )
   (:action s1001_plan-holding-motion
          :parameters (#q9 #q0 o10 #g1)
          :precondition (and (isconf #q9) (isconf #q0) (isgrasp o10 #g1))
          :effect (isholdingmotion #q9 #t990 #q0 o10 #g1)
   )
   (:action s1002_plan-holding-motion
          :parameters (#q9 #q0 o10 #g2)
          :precondition (and (isconf #q9) (isconf #q0) (isgrasp o10 #g2))
          :effect (isholdingmotion #q9 #t991 #q0 o10 #g2)
   )
   (:action s1003_plan-holding-motion
          :parameters (#q9 #q0 o10 #g3)
          :precondition (and (isconf #q9) (isconf #q0) (isgrasp o10 #g3))
          :effect (isholdingmotion #q9 #t992 #q0 o10 #g3)
   )
   (:action s1004_plan-holding-motion
          :parameters (#q9 #q1 o10 #g0)
          :precondition (and (isconf #q9) (isconf #q1) (isgrasp o10 #g0))
          :effect (isholdingmotion #q9 #t993 #q1 o10 #g0)
   )
   (:action s1005_plan-holding-motion
          :parameters (#q9 #q1 o10 #g1)
          :precondition (and (isconf #q9) (isconf #q1) (isgrasp o10 #g1))
          :effect (isholdingmotion #q9 #t994 #q1 o10 #g1)
   )
   (:action s1006_plan-holding-motion
          :parameters (#q9 #q1 o10 #g2)
          :precondition (and (isconf #q9) (isconf #q1) (isgrasp o10 #g2))
          :effect (isholdingmotion #q9 #t995 #q1 o10 #g2)
   )
   (:action s1007_plan-holding-motion
          :parameters (#q9 #q1 o10 #g3)
          :precondition (and (isconf #q9) (isconf #q1) (isgrasp o10 #g3))
          :effect (isholdingmotion #q9 #t996 #q1 o10 #g3)
   )
   (:action s1008_plan-holding-motion
          :parameters (#q9 #q2 o10 #g0)
          :precondition (and (isconf #q9) (isconf #q2) (isgrasp o10 #g0))
          :effect (isholdingmotion #q9 #t997 #q2 o10 #g0)
   )
   (:action s1009_plan-holding-motion
          :parameters (#q9 #q2 o10 #g1)
          :precondition (and (isconf #q9) (isconf #q2) (isgrasp o10 #g1))
          :effect (isholdingmotion #q9 #t998 #q2 o10 #g1)
   )
   (:action s1010_plan-holding-motion
          :parameters (#q9 #q2 o10 #g2)
          :precondition (and (isconf #q9) (isconf #q2) (isgrasp o10 #g2))
          :effect (isholdingmotion #q9 #t999 #q2 o10 #g2)
   )
   (:action s1011_plan-holding-motion
          :parameters (#q9 #q2 o10 #g3)
          :precondition (and (isconf #q9) (isconf #q2) (isgrasp o10 #g3))
          :effect (isholdingmotion #q9 #t1000 #q2 o10 #g3)
   )
   (:action s1012_plan-holding-motion
          :parameters (#q9 #q3 o10 #g0)
          :precondition (and (isconf #q9) (isconf #q3) (isgrasp o10 #g0))
          :effect (isholdingmotion #q9 #t1001 #q3 o10 #g0)
   )
   (:action s1013_plan-holding-motion
          :parameters (#q9 #q3 o10 #g1)
          :precondition (and (isconf #q9) (isconf #q3) (isgrasp o10 #g1))
          :effect (isholdingmotion #q9 #t1002 #q3 o10 #g1)
   )
   (:action s1014_plan-holding-motion
          :parameters (#q9 #q3 o10 #g2)
          :precondition (and (isconf #q9) (isconf #q3) (isgrasp o10 #g2))
          :effect (isholdingmotion #q9 #t1003 #q3 o10 #g2)
   )
   (:action s1015_plan-holding-motion
          :parameters (#q9 #q3 o10 #g3)
          :precondition (and (isconf #q9) (isconf #q3) (isgrasp o10 #g3))
          :effect (isholdingmotion #q9 #t1004 #q3 o10 #g3)
   )
   (:action s1016_plan-holding-motion
          :parameters (#q9 #q4 o10 #g0)
          :precondition (and (isconf #q9) (isconf #q4) (isgrasp o10 #g0))
          :effect (isholdingmotion #q9 #t1005 #q4 o10 #g0)
   )
   (:action s1017_plan-holding-motion
          :parameters (#q9 #q4 o10 #g1)
          :precondition (and (isconf #q9) (isconf #q4) (isgrasp o10 #g1))
          :effect (isholdingmotion #q9 #t1006 #q4 o10 #g1)
   )
   (:action s1018_plan-holding-motion
          :parameters (#q9 #q4 o10 #g2)
          :precondition (and (isconf #q9) (isconf #q4) (isgrasp o10 #g2))
          :effect (isholdingmotion #q9 #t1007 #q4 o10 #g2)
   )
   (:action s1019_plan-holding-motion
          :parameters (#q9 #q4 o10 #g3)
          :precondition (and (isconf #q9) (isconf #q4) (isgrasp o10 #g3))
          :effect (isholdingmotion #q9 #t1008 #q4 o10 #g3)
   )
   (:action s1020_plan-holding-motion
          :parameters (#q9 #q5 o10 #g0)
          :precondition (and (isconf #q9) (isconf #q5) (isgrasp o10 #g0))
          :effect (isholdingmotion #q9 #t1009 #q5 o10 #g0)
   )
   (:action s1021_plan-holding-motion
          :parameters (#q9 #q5 o10 #g1)
          :precondition (and (isconf #q9) (isconf #q5) (isgrasp o10 #g1))
          :effect (isholdingmotion #q9 #t1010 #q5 o10 #g1)
   )
   (:action s1022_plan-holding-motion
          :parameters (#q9 #q5 o10 #g2)
          :precondition (and (isconf #q9) (isconf #q5) (isgrasp o10 #g2))
          :effect (isholdingmotion #q9 #t1011 #q5 o10 #g2)
   )
   (:action s1023_plan-holding-motion
          :parameters (#q9 #q5 o10 #g3)
          :precondition (and (isconf #q9) (isconf #q5) (isgrasp o10 #g3))
          :effect (isholdingmotion #q9 #t1012 #q5 o10 #g3)
   )
   (:action s1024_plan-holding-motion
          :parameters (#q9 #q6 o10 #g0)
          :precondition (and (isconf #q9) (isconf #q6) (isgrasp o10 #g0))
          :effect (isholdingmotion #q9 #t1013 #q6 o10 #g0)
   )
   (:action s1025_plan-holding-motion
          :parameters (#q9 #q6 o10 #g1)
          :precondition (and (isconf #q9) (isconf #q6) (isgrasp o10 #g1))
          :effect (isholdingmotion #q9 #t1014 #q6 o10 #g1)
   )
   (:action s1026_plan-holding-motion
          :parameters (#q9 #q6 o10 #g2)
          :precondition (and (isconf #q9) (isconf #q6) (isgrasp o10 #g2))
          :effect (isholdingmotion #q9 #t1015 #q6 o10 #g2)
   )
   (:action s1027_plan-holding-motion
          :parameters (#q9 #q6 o10 #g3)
          :precondition (and (isconf #q9) (isconf #q6) (isgrasp o10 #g3))
          :effect (isholdingmotion #q9 #t1016 #q6 o10 #g3)
   )
   (:action s1028_plan-holding-motion
          :parameters (#q9 #q7 o10 #g0)
          :precondition (and (isconf #q9) (isconf #q7) (isgrasp o10 #g0))
          :effect (isholdingmotion #q9 #t1017 #q7 o10 #g0)
   )
   (:action s1029_plan-holding-motion
          :parameters (#q9 #q7 o10 #g1)
          :precondition (and (isconf #q9) (isconf #q7) (isgrasp o10 #g1))
          :effect (isholdingmotion #q9 #t1018 #q7 o10 #g1)
   )
   (:action s1030_plan-holding-motion
          :parameters (#q9 #q7 o10 #g2)
          :precondition (and (isconf #q9) (isconf #q7) (isgrasp o10 #g2))
          :effect (isholdingmotion #q9 #t1019 #q7 o10 #g2)
   )
   (:action s1031_plan-holding-motion
          :parameters (#q9 #q7 o10 #g3)
          :precondition (and (isconf #q9) (isconf #q7) (isgrasp o10 #g3))
          :effect (isholdingmotion #q9 #t1020 #q7 o10 #g3)
   )
   (:action s1032_plan-holding-motion
          :parameters (#q9 #q8 o10 #g0)
          :precondition (and (isconf #q9) (isconf #q8) (isgrasp o10 #g0))
          :effect (isholdingmotion #q9 #t1021 #q8 o10 #g0)
   )
   (:action s1033_plan-holding-motion
          :parameters (#q9 #q8 o10 #g1)
          :precondition (and (isconf #q9) (isconf #q8) (isgrasp o10 #g1))
          :effect (isholdingmotion #q9 #t1022 #q8 o10 #g1)
   )
   (:action s1034_plan-holding-motion
          :parameters (#q9 #q8 o10 #g2)
          :precondition (and (isconf #q9) (isconf #q8) (isgrasp o10 #g2))
          :effect (isholdingmotion #q9 #t1023 #q8 o10 #g2)
   )
   (:action s1035_plan-holding-motion
          :parameters (#q9 #q8 o10 #g3)
          :precondition (and (isconf #q9) (isconf #q8) (isgrasp o10 #g3))
          :effect (isholdingmotion #q9 #t1024 #q8 o10 #g3)
   )
   (:action s1036_plan-holding-motion
          :parameters (#q9 #q9 o10 #g0)
          :precondition (and (isconf #q9) (isconf #q9) (isgrasp o10 #g0))
          :effect (isholdingmotion #q9 #t1025 #q9 o10 #g0)
   )
   (:action s1037_plan-holding-motion
          :parameters (#q9 #q9 o10 #g1)
          :precondition (and (isconf #q9) (isconf #q9) (isgrasp o10 #g1))
          :effect (isholdingmotion #q9 #t1026 #q9 o10 #g1)
   )
   (:action s1038_plan-holding-motion
          :parameters (#q9 #q9 o10 #g2)
          :precondition (and (isconf #q9) (isconf #q9) (isgrasp o10 #g2))
          :effect (isholdingmotion #q9 #t1027 #q9 o10 #g2)
   )
   (:action s1039_plan-holding-motion
          :parameters (#q9 #q9 o10 #g3)
          :precondition (and (isconf #q9) (isconf #q9) (isgrasp o10 #g3))
          :effect (isholdingmotion #q9 #t1028 #q9 o10 #g3)
   )
   (:action s1040_plan-holding-motion
          :parameters (#q9 #q10 o10 #g0)
          :precondition (and (isconf #q9) (isconf #q10) (isgrasp o10 #g0))
          :effect (isholdingmotion #q9 #t1029 #q10 o10 #g0)
   )
   (:action s1041_plan-holding-motion
          :parameters (#q9 #q10 o10 #g1)
          :precondition (and (isconf #q9) (isconf #q10) (isgrasp o10 #g1))
          :effect (isholdingmotion #q9 #t1030 #q10 o10 #g1)
   )
   (:action s1042_plan-holding-motion
          :parameters (#q9 #q10 o10 #g2)
          :precondition (and (isconf #q9) (isconf #q10) (isgrasp o10 #g2))
          :effect (isholdingmotion #q9 #t1031 #q10 o10 #g2)
   )
   (:action s1043_plan-holding-motion
          :parameters (#q9 #q10 o10 #g3)
          :precondition (and (isconf #q9) (isconf #q10) (isgrasp o10 #g3))
          :effect (isholdingmotion #q9 #t1032 #q10 o10 #g3)
   )
   (:action s1044_plan-holding-motion
          :parameters (#q9 #q11 o10 #g0)
          :precondition (and (isconf #q9) (isconf #q11) (isgrasp o10 #g0))
          :effect (isholdingmotion #q9 #t1033 #q11 o10 #g0)
   )
   (:action s1045_plan-holding-motion
          :parameters (#q9 #q11 o10 #g1)
          :precondition (and (isconf #q9) (isconf #q11) (isgrasp o10 #g1))
          :effect (isholdingmotion #q9 #t1034 #q11 o10 #g1)
   )
   (:action s1046_plan-holding-motion
          :parameters (#q9 #q11 o10 #g2)
          :precondition (and (isconf #q9) (isconf #q11) (isgrasp o10 #g2))
          :effect (isholdingmotion #q9 #t1035 #q11 o10 #g2)
   )
   (:action s1047_plan-holding-motion
          :parameters (#q9 #q11 o10 #g3)
          :precondition (and (isconf #q9) (isconf #q11) (isgrasp o10 #g3))
          :effect (isholdingmotion #q9 #t1036 #q11 o10 #g3)
   )
   (:action s1048_plan-holding-motion
          :parameters (#q9 #q12 o10 #g0)
          :precondition (and (isconf #q9) (isconf #q12) (isgrasp o10 #g0))
          :effect (isholdingmotion #q9 #t1037 #q12 o10 #g0)
   )
   (:action s1049_plan-holding-motion
          :parameters (#q9 #q12 o10 #g1)
          :precondition (and (isconf #q9) (isconf #q12) (isgrasp o10 #g1))
          :effect (isholdingmotion #q9 #t1038 #q12 o10 #g1)
   )
   (:action s1050_plan-holding-motion
          :parameters (#q9 #q12 o10 #g2)
          :precondition (and (isconf #q9) (isconf #q12) (isgrasp o10 #g2))
          :effect (isholdingmotion #q9 #t1039 #q12 o10 #g2)
   )
   (:action s1051_plan-holding-motion
          :parameters (#q9 #q12 o10 #g3)
          :precondition (and (isconf #q9) (isconf #q12) (isgrasp o10 #g3))
          :effect (isholdingmotion #q9 #t1040 #q12 o10 #g3)
   )
   (:action s1052_plan-holding-motion
          :parameters (#q9 #q13 o10 #g0)
          :precondition (and (isconf #q9) (isconf #q13) (isgrasp o10 #g0))
          :effect (isholdingmotion #q9 #t1041 #q13 o10 #g0)
   )
   (:action s1053_plan-holding-motion
          :parameters (#q9 #q13 o10 #g1)
          :precondition (and (isconf #q9) (isconf #q13) (isgrasp o10 #g1))
          :effect (isholdingmotion #q9 #t1042 #q13 o10 #g1)
   )
   (:action s1054_plan-holding-motion
          :parameters (#q9 #q13 o10 #g2)
          :precondition (and (isconf #q9) (isconf #q13) (isgrasp o10 #g2))
          :effect (isholdingmotion #q9 #t1043 #q13 o10 #g2)
   )
   (:action s1055_plan-holding-motion
          :parameters (#q9 #q13 o10 #g3)
          :precondition (and (isconf #q9) (isconf #q13) (isgrasp o10 #g3))
          :effect (isholdingmotion #q9 #t1044 #q13 o10 #g3)
   )
   (:action s1056_plan-holding-motion
          :parameters (#q9 #q14 o10 #g0)
          :precondition (and (isconf #q9) (isconf #q14) (isgrasp o10 #g0))
          :effect (isholdingmotion #q9 #t1045 #q14 o10 #g0)
   )
   (:action s1057_plan-holding-motion
          :parameters (#q9 #q14 o10 #g1)
          :precondition (and (isconf #q9) (isconf #q14) (isgrasp o10 #g1))
          :effect (isholdingmotion #q9 #t1046 #q14 o10 #g1)
   )
   (:action s1058_plan-holding-motion
          :parameters (#q9 #q14 o10 #g2)
          :precondition (and (isconf #q9) (isconf #q14) (isgrasp o10 #g2))
          :effect (isholdingmotion #q9 #t1047 #q14 o10 #g2)
   )
   (:action s1059_plan-holding-motion
          :parameters (#q9 #q14 o10 #g3)
          :precondition (and (isconf #q9) (isconf #q14) (isgrasp o10 #g3))
          :effect (isholdingmotion #q9 #t1048 #q14 o10 #g3)
   )
   (:action s1060_plan-holding-motion
          :parameters (#q9 #q15 o10 #g0)
          :precondition (and (isconf #q9) (isconf #q15) (isgrasp o10 #g0))
          :effect (isholdingmotion #q9 #t1049 #q15 o10 #g0)
   )
   (:action s1061_plan-holding-motion
          :parameters (#q9 #q15 o10 #g1)
          :precondition (and (isconf #q9) (isconf #q15) (isgrasp o10 #g1))
          :effect (isholdingmotion #q9 #t1050 #q15 o10 #g1)
   )
   (:action s1062_plan-holding-motion
          :parameters (#q9 #q15 o10 #g2)
          :precondition (and (isconf #q9) (isconf #q15) (isgrasp o10 #g2))
          :effect (isholdingmotion #q9 #t1051 #q15 o10 #g2)
   )
   (:action s1063_plan-holding-motion
          :parameters (#q9 #q15 o10 #g3)
          :precondition (and (isconf #q9) (isconf #q15) (isgrasp o10 #g3))
          :effect (isholdingmotion #q9 #t1052 #q15 o10 #g3)
   )
   (:action s1064_plan-holding-motion
          :parameters (#q10 q224 o10 #g0)
          :precondition (and (isconf #q10) (isconf q224) (isgrasp o10 #g0))
          :effect (isholdingmotion #q10 #t1053 q224 o10 #g0)
   )
   (:action s1065_plan-holding-motion
          :parameters (#q10 q224 o10 #g1)
          :precondition (and (isconf #q10) (isconf q224) (isgrasp o10 #g1))
          :effect (isholdingmotion #q10 #t1054 q224 o10 #g1)
   )
   (:action s1066_plan-holding-motion
          :parameters (#q10 q224 o10 #g2)
          :precondition (and (isconf #q10) (isconf q224) (isgrasp o10 #g2))
          :effect (isholdingmotion #q10 #t1055 q224 o10 #g2)
   )
   (:action s1067_plan-holding-motion
          :parameters (#q10 q224 o10 #g3)
          :precondition (and (isconf #q10) (isconf q224) (isgrasp o10 #g3))
          :effect (isholdingmotion #q10 #t1056 q224 o10 #g3)
   )
   (:action s1068_plan-holding-motion
          :parameters (#q10 #q0 o10 #g0)
          :precondition (and (isconf #q10) (isconf #q0) (isgrasp o10 #g0))
          :effect (isholdingmotion #q10 #t1057 #q0 o10 #g0)
   )
   (:action s1069_plan-holding-motion
          :parameters (#q10 #q0 o10 #g1)
          :precondition (and (isconf #q10) (isconf #q0) (isgrasp o10 #g1))
          :effect (isholdingmotion #q10 #t1058 #q0 o10 #g1)
   )
   (:action s1070_plan-holding-motion
          :parameters (#q10 #q0 o10 #g2)
          :precondition (and (isconf #q10) (isconf #q0) (isgrasp o10 #g2))
          :effect (isholdingmotion #q10 #t1059 #q0 o10 #g2)
   )
   (:action s1071_plan-holding-motion
          :parameters (#q10 #q0 o10 #g3)
          :precondition (and (isconf #q10) (isconf #q0) (isgrasp o10 #g3))
          :effect (isholdingmotion #q10 #t1060 #q0 o10 #g3)
   )
   (:action s1072_plan-holding-motion
          :parameters (#q10 #q1 o10 #g0)
          :precondition (and (isconf #q10) (isconf #q1) (isgrasp o10 #g0))
          :effect (isholdingmotion #q10 #t1061 #q1 o10 #g0)
   )
   (:action s1073_plan-holding-motion
          :parameters (#q10 #q1 o10 #g1)
          :precondition (and (isconf #q10) (isconf #q1) (isgrasp o10 #g1))
          :effect (isholdingmotion #q10 #t1062 #q1 o10 #g1)
   )
   (:action s1074_plan-holding-motion
          :parameters (#q10 #q1 o10 #g2)
          :precondition (and (isconf #q10) (isconf #q1) (isgrasp o10 #g2))
          :effect (isholdingmotion #q10 #t1063 #q1 o10 #g2)
   )
   (:action s1075_plan-holding-motion
          :parameters (#q10 #q1 o10 #g3)
          :precondition (and (isconf #q10) (isconf #q1) (isgrasp o10 #g3))
          :effect (isholdingmotion #q10 #t1064 #q1 o10 #g3)
   )
   (:action s1076_plan-holding-motion
          :parameters (#q10 #q2 o10 #g0)
          :precondition (and (isconf #q10) (isconf #q2) (isgrasp o10 #g0))
          :effect (isholdingmotion #q10 #t1065 #q2 o10 #g0)
   )
   (:action s1077_plan-holding-motion
          :parameters (#q10 #q2 o10 #g1)
          :precondition (and (isconf #q10) (isconf #q2) (isgrasp o10 #g1))
          :effect (isholdingmotion #q10 #t1066 #q2 o10 #g1)
   )
   (:action s1078_plan-holding-motion
          :parameters (#q10 #q2 o10 #g2)
          :precondition (and (isconf #q10) (isconf #q2) (isgrasp o10 #g2))
          :effect (isholdingmotion #q10 #t1067 #q2 o10 #g2)
   )
   (:action s1079_plan-holding-motion
          :parameters (#q10 #q2 o10 #g3)
          :precondition (and (isconf #q10) (isconf #q2) (isgrasp o10 #g3))
          :effect (isholdingmotion #q10 #t1068 #q2 o10 #g3)
   )
   (:action s1080_plan-holding-motion
          :parameters (#q10 #q3 o10 #g0)
          :precondition (and (isconf #q10) (isconf #q3) (isgrasp o10 #g0))
          :effect (isholdingmotion #q10 #t1069 #q3 o10 #g0)
   )
   (:action s1081_plan-holding-motion
          :parameters (#q10 #q3 o10 #g1)
          :precondition (and (isconf #q10) (isconf #q3) (isgrasp o10 #g1))
          :effect (isholdingmotion #q10 #t1070 #q3 o10 #g1)
   )
   (:action s1082_plan-holding-motion
          :parameters (#q10 #q3 o10 #g2)
          :precondition (and (isconf #q10) (isconf #q3) (isgrasp o10 #g2))
          :effect (isholdingmotion #q10 #t1071 #q3 o10 #g2)
   )
   (:action s1083_plan-holding-motion
          :parameters (#q10 #q3 o10 #g3)
          :precondition (and (isconf #q10) (isconf #q3) (isgrasp o10 #g3))
          :effect (isholdingmotion #q10 #t1072 #q3 o10 #g3)
   )
   (:action s1084_plan-holding-motion
          :parameters (#q10 #q4 o10 #g0)
          :precondition (and (isconf #q10) (isconf #q4) (isgrasp o10 #g0))
          :effect (isholdingmotion #q10 #t1073 #q4 o10 #g0)
   )
   (:action s1085_plan-holding-motion
          :parameters (#q10 #q4 o10 #g1)
          :precondition (and (isconf #q10) (isconf #q4) (isgrasp o10 #g1))
          :effect (isholdingmotion #q10 #t1074 #q4 o10 #g1)
   )
   (:action s1086_plan-holding-motion
          :parameters (#q10 #q4 o10 #g2)
          :precondition (and (isconf #q10) (isconf #q4) (isgrasp o10 #g2))
          :effect (isholdingmotion #q10 #t1075 #q4 o10 #g2)
   )
   (:action s1087_plan-holding-motion
          :parameters (#q10 #q4 o10 #g3)
          :precondition (and (isconf #q10) (isconf #q4) (isgrasp o10 #g3))
          :effect (isholdingmotion #q10 #t1076 #q4 o10 #g3)
   )
   (:action s1088_plan-holding-motion
          :parameters (#q10 #q5 o10 #g0)
          :precondition (and (isconf #q10) (isconf #q5) (isgrasp o10 #g0))
          :effect (isholdingmotion #q10 #t1077 #q5 o10 #g0)
   )
   (:action s1089_plan-holding-motion
          :parameters (#q10 #q5 o10 #g1)
          :precondition (and (isconf #q10) (isconf #q5) (isgrasp o10 #g1))
          :effect (isholdingmotion #q10 #t1078 #q5 o10 #g1)
   )
   (:action s1090_plan-holding-motion
          :parameters (#q10 #q5 o10 #g2)
          :precondition (and (isconf #q10) (isconf #q5) (isgrasp o10 #g2))
          :effect (isholdingmotion #q10 #t1079 #q5 o10 #g2)
   )
   (:action s1091_plan-holding-motion
          :parameters (#q10 #q5 o10 #g3)
          :precondition (and (isconf #q10) (isconf #q5) (isgrasp o10 #g3))
          :effect (isholdingmotion #q10 #t1080 #q5 o10 #g3)
   )
   (:action s1092_plan-holding-motion
          :parameters (#q10 #q6 o10 #g0)
          :precondition (and (isconf #q10) (isconf #q6) (isgrasp o10 #g0))
          :effect (isholdingmotion #q10 #t1081 #q6 o10 #g0)
   )
   (:action s1093_plan-holding-motion
          :parameters (#q10 #q6 o10 #g1)
          :precondition (and (isconf #q10) (isconf #q6) (isgrasp o10 #g1))
          :effect (isholdingmotion #q10 #t1082 #q6 o10 #g1)
   )
   (:action s1094_plan-holding-motion
          :parameters (#q10 #q6 o10 #g2)
          :precondition (and (isconf #q10) (isconf #q6) (isgrasp o10 #g2))
          :effect (isholdingmotion #q10 #t1083 #q6 o10 #g2)
   )
   (:action s1095_plan-holding-motion
          :parameters (#q10 #q6 o10 #g3)
          :precondition (and (isconf #q10) (isconf #q6) (isgrasp o10 #g3))
          :effect (isholdingmotion #q10 #t1084 #q6 o10 #g3)
   )
   (:action s1096_plan-holding-motion
          :parameters (#q10 #q7 o10 #g0)
          :precondition (and (isconf #q10) (isconf #q7) (isgrasp o10 #g0))
          :effect (isholdingmotion #q10 #t1085 #q7 o10 #g0)
   )
   (:action s1097_plan-holding-motion
          :parameters (#q10 #q7 o10 #g1)
          :precondition (and (isconf #q10) (isconf #q7) (isgrasp o10 #g1))
          :effect (isholdingmotion #q10 #t1086 #q7 o10 #g1)
   )
   (:action s1098_plan-holding-motion
          :parameters (#q10 #q7 o10 #g2)
          :precondition (and (isconf #q10) (isconf #q7) (isgrasp o10 #g2))
          :effect (isholdingmotion #q10 #t1087 #q7 o10 #g2)
   )
   (:action s1099_plan-holding-motion
          :parameters (#q10 #q7 o10 #g3)
          :precondition (and (isconf #q10) (isconf #q7) (isgrasp o10 #g3))
          :effect (isholdingmotion #q10 #t1088 #q7 o10 #g3)
   )
   (:action s1100_plan-holding-motion
          :parameters (#q10 #q8 o10 #g0)
          :precondition (and (isconf #q10) (isconf #q8) (isgrasp o10 #g0))
          :effect (isholdingmotion #q10 #t1089 #q8 o10 #g0)
   )
   (:action s1101_plan-holding-motion
          :parameters (#q10 #q8 o10 #g1)
          :precondition (and (isconf #q10) (isconf #q8) (isgrasp o10 #g1))
          :effect (isholdingmotion #q10 #t1090 #q8 o10 #g1)
   )
   (:action s1102_plan-holding-motion
          :parameters (#q10 #q8 o10 #g2)
          :precondition (and (isconf #q10) (isconf #q8) (isgrasp o10 #g2))
          :effect (isholdingmotion #q10 #t1091 #q8 o10 #g2)
   )
   (:action s1103_plan-holding-motion
          :parameters (#q10 #q8 o10 #g3)
          :precondition (and (isconf #q10) (isconf #q8) (isgrasp o10 #g3))
          :effect (isholdingmotion #q10 #t1092 #q8 o10 #g3)
   )
   (:action s1104_plan-holding-motion
          :parameters (#q10 #q9 o10 #g0)
          :precondition (and (isconf #q10) (isconf #q9) (isgrasp o10 #g0))
          :effect (isholdingmotion #q10 #t1093 #q9 o10 #g0)
   )
   (:action s1105_plan-holding-motion
          :parameters (#q10 #q9 o10 #g1)
          :precondition (and (isconf #q10) (isconf #q9) (isgrasp o10 #g1))
          :effect (isholdingmotion #q10 #t1094 #q9 o10 #g1)
   )
   (:action s1106_plan-holding-motion
          :parameters (#q10 #q9 o10 #g2)
          :precondition (and (isconf #q10) (isconf #q9) (isgrasp o10 #g2))
          :effect (isholdingmotion #q10 #t1095 #q9 o10 #g2)
   )
   (:action s1107_plan-holding-motion
          :parameters (#q10 #q9 o10 #g3)
          :precondition (and (isconf #q10) (isconf #q9) (isgrasp o10 #g3))
          :effect (isholdingmotion #q10 #t1096 #q9 o10 #g3)
   )
   (:action s1108_plan-holding-motion
          :parameters (#q10 #q10 o10 #g0)
          :precondition (and (isconf #q10) (isconf #q10) (isgrasp o10 #g0))
          :effect (isholdingmotion #q10 #t1097 #q10 o10 #g0)
   )
   (:action s1109_plan-holding-motion
          :parameters (#q10 #q10 o10 #g1)
          :precondition (and (isconf #q10) (isconf #q10) (isgrasp o10 #g1))
          :effect (isholdingmotion #q10 #t1098 #q10 o10 #g1)
   )
   (:action s1110_plan-holding-motion
          :parameters (#q10 #q10 o10 #g2)
          :precondition (and (isconf #q10) (isconf #q10) (isgrasp o10 #g2))
          :effect (isholdingmotion #q10 #t1099 #q10 o10 #g2)
   )
   (:action s1111_plan-holding-motion
          :parameters (#q10 #q10 o10 #g3)
          :precondition (and (isconf #q10) (isconf #q10) (isgrasp o10 #g3))
          :effect (isholdingmotion #q10 #t1100 #q10 o10 #g3)
   )
   (:action s1112_plan-holding-motion
          :parameters (#q10 #q11 o10 #g0)
          :precondition (and (isconf #q10) (isconf #q11) (isgrasp o10 #g0))
          :effect (isholdingmotion #q10 #t1101 #q11 o10 #g0)
   )
   (:action s1113_plan-holding-motion
          :parameters (#q10 #q11 o10 #g1)
          :precondition (and (isconf #q10) (isconf #q11) (isgrasp o10 #g1))
          :effect (isholdingmotion #q10 #t1102 #q11 o10 #g1)
   )
   (:action s1114_plan-holding-motion
          :parameters (#q10 #q11 o10 #g2)
          :precondition (and (isconf #q10) (isconf #q11) (isgrasp o10 #g2))
          :effect (isholdingmotion #q10 #t1103 #q11 o10 #g2)
   )
   (:action s1115_plan-holding-motion
          :parameters (#q10 #q11 o10 #g3)
          :precondition (and (isconf #q10) (isconf #q11) (isgrasp o10 #g3))
          :effect (isholdingmotion #q10 #t1104 #q11 o10 #g3)
   )
   (:action s1116_plan-holding-motion
          :parameters (#q10 #q12 o10 #g0)
          :precondition (and (isconf #q10) (isconf #q12) (isgrasp o10 #g0))
          :effect (isholdingmotion #q10 #t1105 #q12 o10 #g0)
   )
   (:action s1117_plan-holding-motion
          :parameters (#q10 #q12 o10 #g1)
          :precondition (and (isconf #q10) (isconf #q12) (isgrasp o10 #g1))
          :effect (isholdingmotion #q10 #t1106 #q12 o10 #g1)
   )
   (:action s1118_plan-holding-motion
          :parameters (#q10 #q12 o10 #g2)
          :precondition (and (isconf #q10) (isconf #q12) (isgrasp o10 #g2))
          :effect (isholdingmotion #q10 #t1107 #q12 o10 #g2)
   )
   (:action s1119_plan-holding-motion
          :parameters (#q10 #q12 o10 #g3)
          :precondition (and (isconf #q10) (isconf #q12) (isgrasp o10 #g3))
          :effect (isholdingmotion #q10 #t1108 #q12 o10 #g3)
   )
   (:action s1120_plan-holding-motion
          :parameters (#q10 #q13 o10 #g0)
          :precondition (and (isconf #q10) (isconf #q13) (isgrasp o10 #g0))
          :effect (isholdingmotion #q10 #t1109 #q13 o10 #g0)
   )
   (:action s1121_plan-holding-motion
          :parameters (#q10 #q13 o10 #g1)
          :precondition (and (isconf #q10) (isconf #q13) (isgrasp o10 #g1))
          :effect (isholdingmotion #q10 #t1110 #q13 o10 #g1)
   )
   (:action s1122_plan-holding-motion
          :parameters (#q10 #q13 o10 #g2)
          :precondition (and (isconf #q10) (isconf #q13) (isgrasp o10 #g2))
          :effect (isholdingmotion #q10 #t1111 #q13 o10 #g2)
   )
   (:action s1123_plan-holding-motion
          :parameters (#q10 #q13 o10 #g3)
          :precondition (and (isconf #q10) (isconf #q13) (isgrasp o10 #g3))
          :effect (isholdingmotion #q10 #t1112 #q13 o10 #g3)
   )
   (:action s1124_plan-holding-motion
          :parameters (#q10 #q14 o10 #g0)
          :precondition (and (isconf #q10) (isconf #q14) (isgrasp o10 #g0))
          :effect (isholdingmotion #q10 #t1113 #q14 o10 #g0)
   )
   (:action s1125_plan-holding-motion
          :parameters (#q10 #q14 o10 #g1)
          :precondition (and (isconf #q10) (isconf #q14) (isgrasp o10 #g1))
          :effect (isholdingmotion #q10 #t1114 #q14 o10 #g1)
   )
   (:action s1126_plan-holding-motion
          :parameters (#q10 #q14 o10 #g2)
          :precondition (and (isconf #q10) (isconf #q14) (isgrasp o10 #g2))
          :effect (isholdingmotion #q10 #t1115 #q14 o10 #g2)
   )
   (:action s1127_plan-holding-motion
          :parameters (#q10 #q14 o10 #g3)
          :precondition (and (isconf #q10) (isconf #q14) (isgrasp o10 #g3))
          :effect (isholdingmotion #q10 #t1116 #q14 o10 #g3)
   )
   (:action s1128_plan-holding-motion
          :parameters (#q10 #q15 o10 #g0)
          :precondition (and (isconf #q10) (isconf #q15) (isgrasp o10 #g0))
          :effect (isholdingmotion #q10 #t1117 #q15 o10 #g0)
   )
   (:action s1129_plan-holding-motion
          :parameters (#q10 #q15 o10 #g1)
          :precondition (and (isconf #q10) (isconf #q15) (isgrasp o10 #g1))
          :effect (isholdingmotion #q10 #t1118 #q15 o10 #g1)
   )
   (:action s1130_plan-holding-motion
          :parameters (#q10 #q15 o10 #g2)
          :precondition (and (isconf #q10) (isconf #q15) (isgrasp o10 #g2))
          :effect (isholdingmotion #q10 #t1119 #q15 o10 #g2)
   )
   (:action s1131_plan-holding-motion
          :parameters (#q10 #q15 o10 #g3)
          :precondition (and (isconf #q10) (isconf #q15) (isgrasp o10 #g3))
          :effect (isholdingmotion #q10 #t1120 #q15 o10 #g3)
   )
   (:action s1132_plan-holding-motion
          :parameters (#q11 q224 o10 #g0)
          :precondition (and (isconf #q11) (isconf q224) (isgrasp o10 #g0))
          :effect (isholdingmotion #q11 #t1121 q224 o10 #g0)
   )
   (:action s1133_plan-holding-motion
          :parameters (#q11 q224 o10 #g1)
          :precondition (and (isconf #q11) (isconf q224) (isgrasp o10 #g1))
          :effect (isholdingmotion #q11 #t1122 q224 o10 #g1)
   )
   (:action s1134_plan-holding-motion
          :parameters (#q11 q224 o10 #g2)
          :precondition (and (isconf #q11) (isconf q224) (isgrasp o10 #g2))
          :effect (isholdingmotion #q11 #t1123 q224 o10 #g2)
   )
   (:action s1135_plan-holding-motion
          :parameters (#q11 q224 o10 #g3)
          :precondition (and (isconf #q11) (isconf q224) (isgrasp o10 #g3))
          :effect (isholdingmotion #q11 #t1124 q224 o10 #g3)
   )
   (:action s1136_plan-holding-motion
          :parameters (#q11 #q0 o10 #g0)
          :precondition (and (isconf #q11) (isconf #q0) (isgrasp o10 #g0))
          :effect (isholdingmotion #q11 #t1125 #q0 o10 #g0)
   )
   (:action s1137_plan-holding-motion
          :parameters (#q11 #q0 o10 #g1)
          :precondition (and (isconf #q11) (isconf #q0) (isgrasp o10 #g1))
          :effect (isholdingmotion #q11 #t1126 #q0 o10 #g1)
   )
   (:action s1138_plan-holding-motion
          :parameters (#q11 #q0 o10 #g2)
          :precondition (and (isconf #q11) (isconf #q0) (isgrasp o10 #g2))
          :effect (isholdingmotion #q11 #t1127 #q0 o10 #g2)
   )
   (:action s1139_plan-holding-motion
          :parameters (#q11 #q0 o10 #g3)
          :precondition (and (isconf #q11) (isconf #q0) (isgrasp o10 #g3))
          :effect (isholdingmotion #q11 #t1128 #q0 o10 #g3)
   )
   (:action s1140_plan-holding-motion
          :parameters (#q11 #q1 o10 #g0)
          :precondition (and (isconf #q11) (isconf #q1) (isgrasp o10 #g0))
          :effect (isholdingmotion #q11 #t1129 #q1 o10 #g0)
   )
   (:action s1141_plan-holding-motion
          :parameters (#q11 #q1 o10 #g1)
          :precondition (and (isconf #q11) (isconf #q1) (isgrasp o10 #g1))
          :effect (isholdingmotion #q11 #t1130 #q1 o10 #g1)
   )
   (:action s1142_plan-holding-motion
          :parameters (#q11 #q1 o10 #g2)
          :precondition (and (isconf #q11) (isconf #q1) (isgrasp o10 #g2))
          :effect (isholdingmotion #q11 #t1131 #q1 o10 #g2)
   )
   (:action s1143_plan-holding-motion
          :parameters (#q11 #q1 o10 #g3)
          :precondition (and (isconf #q11) (isconf #q1) (isgrasp o10 #g3))
          :effect (isholdingmotion #q11 #t1132 #q1 o10 #g3)
   )
   (:action s1144_plan-holding-motion
          :parameters (#q11 #q2 o10 #g0)
          :precondition (and (isconf #q11) (isconf #q2) (isgrasp o10 #g0))
          :effect (isholdingmotion #q11 #t1133 #q2 o10 #g0)
   )
   (:action s1145_plan-holding-motion
          :parameters (#q11 #q2 o10 #g1)
          :precondition (and (isconf #q11) (isconf #q2) (isgrasp o10 #g1))
          :effect (isholdingmotion #q11 #t1134 #q2 o10 #g1)
   )
   (:action s1146_plan-holding-motion
          :parameters (#q11 #q2 o10 #g2)
          :precondition (and (isconf #q11) (isconf #q2) (isgrasp o10 #g2))
          :effect (isholdingmotion #q11 #t1135 #q2 o10 #g2)
   )
   (:action s1147_plan-holding-motion
          :parameters (#q11 #q2 o10 #g3)
          :precondition (and (isconf #q11) (isconf #q2) (isgrasp o10 #g3))
          :effect (isholdingmotion #q11 #t1136 #q2 o10 #g3)
   )
   (:action s1148_plan-holding-motion
          :parameters (#q11 #q3 o10 #g0)
          :precondition (and (isconf #q11) (isconf #q3) (isgrasp o10 #g0))
          :effect (isholdingmotion #q11 #t1137 #q3 o10 #g0)
   )
   (:action s1149_plan-holding-motion
          :parameters (#q11 #q3 o10 #g1)
          :precondition (and (isconf #q11) (isconf #q3) (isgrasp o10 #g1))
          :effect (isholdingmotion #q11 #t1138 #q3 o10 #g1)
   )
   (:action s1150_plan-holding-motion
          :parameters (#q11 #q3 o10 #g2)
          :precondition (and (isconf #q11) (isconf #q3) (isgrasp o10 #g2))
          :effect (isholdingmotion #q11 #t1139 #q3 o10 #g2)
   )
   (:action s1151_plan-holding-motion
          :parameters (#q11 #q3 o10 #g3)
          :precondition (and (isconf #q11) (isconf #q3) (isgrasp o10 #g3))
          :effect (isholdingmotion #q11 #t1140 #q3 o10 #g3)
   )
   (:action s1152_plan-holding-motion
          :parameters (#q11 #q4 o10 #g0)
          :precondition (and (isconf #q11) (isconf #q4) (isgrasp o10 #g0))
          :effect (isholdingmotion #q11 #t1141 #q4 o10 #g0)
   )
   (:action s1153_plan-holding-motion
          :parameters (#q11 #q4 o10 #g1)
          :precondition (and (isconf #q11) (isconf #q4) (isgrasp o10 #g1))
          :effect (isholdingmotion #q11 #t1142 #q4 o10 #g1)
   )
   (:action s1154_plan-holding-motion
          :parameters (#q11 #q4 o10 #g2)
          :precondition (and (isconf #q11) (isconf #q4) (isgrasp o10 #g2))
          :effect (isholdingmotion #q11 #t1143 #q4 o10 #g2)
   )
   (:action s1155_plan-holding-motion
          :parameters (#q11 #q4 o10 #g3)
          :precondition (and (isconf #q11) (isconf #q4) (isgrasp o10 #g3))
          :effect (isholdingmotion #q11 #t1144 #q4 o10 #g3)
   )
   (:action s1156_plan-holding-motion
          :parameters (#q11 #q5 o10 #g0)
          :precondition (and (isconf #q11) (isconf #q5) (isgrasp o10 #g0))
          :effect (isholdingmotion #q11 #t1145 #q5 o10 #g0)
   )
   (:action s1157_plan-holding-motion
          :parameters (#q11 #q5 o10 #g1)
          :precondition (and (isconf #q11) (isconf #q5) (isgrasp o10 #g1))
          :effect (isholdingmotion #q11 #t1146 #q5 o10 #g1)
   )
   (:action s1158_plan-holding-motion
          :parameters (#q11 #q5 o10 #g2)
          :precondition (and (isconf #q11) (isconf #q5) (isgrasp o10 #g2))
          :effect (isholdingmotion #q11 #t1147 #q5 o10 #g2)
   )
   (:action s1159_plan-holding-motion
          :parameters (#q11 #q5 o10 #g3)
          :precondition (and (isconf #q11) (isconf #q5) (isgrasp o10 #g3))
          :effect (isholdingmotion #q11 #t1148 #q5 o10 #g3)
   )
   (:action s1160_plan-holding-motion
          :parameters (#q11 #q6 o10 #g0)
          :precondition (and (isconf #q11) (isconf #q6) (isgrasp o10 #g0))
          :effect (isholdingmotion #q11 #t1149 #q6 o10 #g0)
   )
   (:action s1161_plan-holding-motion
          :parameters (#q11 #q6 o10 #g1)
          :precondition (and (isconf #q11) (isconf #q6) (isgrasp o10 #g1))
          :effect (isholdingmotion #q11 #t1150 #q6 o10 #g1)
   )
   (:action s1162_plan-holding-motion
          :parameters (#q11 #q6 o10 #g2)
          :precondition (and (isconf #q11) (isconf #q6) (isgrasp o10 #g2))
          :effect (isholdingmotion #q11 #t1151 #q6 o10 #g2)
   )
   (:action s1163_plan-holding-motion
          :parameters (#q11 #q6 o10 #g3)
          :precondition (and (isconf #q11) (isconf #q6) (isgrasp o10 #g3))
          :effect (isholdingmotion #q11 #t1152 #q6 o10 #g3)
   )
   (:action s1164_plan-holding-motion
          :parameters (#q11 #q7 o10 #g0)
          :precondition (and (isconf #q11) (isconf #q7) (isgrasp o10 #g0))
          :effect (isholdingmotion #q11 #t1153 #q7 o10 #g0)
   )
   (:action s1165_plan-holding-motion
          :parameters (#q11 #q7 o10 #g1)
          :precondition (and (isconf #q11) (isconf #q7) (isgrasp o10 #g1))
          :effect (isholdingmotion #q11 #t1154 #q7 o10 #g1)
   )
   (:action s1166_plan-holding-motion
          :parameters (#q11 #q7 o10 #g2)
          :precondition (and (isconf #q11) (isconf #q7) (isgrasp o10 #g2))
          :effect (isholdingmotion #q11 #t1155 #q7 o10 #g2)
   )
   (:action s1167_plan-holding-motion
          :parameters (#q11 #q7 o10 #g3)
          :precondition (and (isconf #q11) (isconf #q7) (isgrasp o10 #g3))
          :effect (isholdingmotion #q11 #t1156 #q7 o10 #g3)
   )
   (:action s1168_plan-holding-motion
          :parameters (#q11 #q8 o10 #g0)
          :precondition (and (isconf #q11) (isconf #q8) (isgrasp o10 #g0))
          :effect (isholdingmotion #q11 #t1157 #q8 o10 #g0)
   )
   (:action s1169_plan-holding-motion
          :parameters (#q11 #q8 o10 #g1)
          :precondition (and (isconf #q11) (isconf #q8) (isgrasp o10 #g1))
          :effect (isholdingmotion #q11 #t1158 #q8 o10 #g1)
   )
   (:action s1170_plan-holding-motion
          :parameters (#q11 #q8 o10 #g2)
          :precondition (and (isconf #q11) (isconf #q8) (isgrasp o10 #g2))
          :effect (isholdingmotion #q11 #t1159 #q8 o10 #g2)
   )
   (:action s1171_plan-holding-motion
          :parameters (#q11 #q8 o10 #g3)
          :precondition (and (isconf #q11) (isconf #q8) (isgrasp o10 #g3))
          :effect (isholdingmotion #q11 #t1160 #q8 o10 #g3)
   )
   (:action s1172_plan-holding-motion
          :parameters (#q11 #q9 o10 #g0)
          :precondition (and (isconf #q11) (isconf #q9) (isgrasp o10 #g0))
          :effect (isholdingmotion #q11 #t1161 #q9 o10 #g0)
   )
   (:action s1173_plan-holding-motion
          :parameters (#q11 #q9 o10 #g1)
          :precondition (and (isconf #q11) (isconf #q9) (isgrasp o10 #g1))
          :effect (isholdingmotion #q11 #t1162 #q9 o10 #g1)
   )
   (:action s1174_plan-holding-motion
          :parameters (#q11 #q9 o10 #g2)
          :precondition (and (isconf #q11) (isconf #q9) (isgrasp o10 #g2))
          :effect (isholdingmotion #q11 #t1163 #q9 o10 #g2)
   )
   (:action s1175_plan-holding-motion
          :parameters (#q11 #q9 o10 #g3)
          :precondition (and (isconf #q11) (isconf #q9) (isgrasp o10 #g3))
          :effect (isholdingmotion #q11 #t1164 #q9 o10 #g3)
   )
   (:action s1176_plan-holding-motion
          :parameters (#q11 #q10 o10 #g0)
          :precondition (and (isconf #q11) (isconf #q10) (isgrasp o10 #g0))
          :effect (isholdingmotion #q11 #t1165 #q10 o10 #g0)
   )
   (:action s1177_plan-holding-motion
          :parameters (#q11 #q10 o10 #g1)
          :precondition (and (isconf #q11) (isconf #q10) (isgrasp o10 #g1))
          :effect (isholdingmotion #q11 #t1166 #q10 o10 #g1)
   )
   (:action s1178_plan-holding-motion
          :parameters (#q11 #q10 o10 #g2)
          :precondition (and (isconf #q11) (isconf #q10) (isgrasp o10 #g2))
          :effect (isholdingmotion #q11 #t1167 #q10 o10 #g2)
   )
   (:action s1179_plan-holding-motion
          :parameters (#q11 #q10 o10 #g3)
          :precondition (and (isconf #q11) (isconf #q10) (isgrasp o10 #g3))
          :effect (isholdingmotion #q11 #t1168 #q10 o10 #g3)
   )
   (:action s1180_plan-holding-motion
          :parameters (#q11 #q11 o10 #g0)
          :precondition (and (isconf #q11) (isconf #q11) (isgrasp o10 #g0))
          :effect (isholdingmotion #q11 #t1169 #q11 o10 #g0)
   )
   (:action s1181_plan-holding-motion
          :parameters (#q11 #q11 o10 #g1)
          :precondition (and (isconf #q11) (isconf #q11) (isgrasp o10 #g1))
          :effect (isholdingmotion #q11 #t1170 #q11 o10 #g1)
   )
   (:action s1182_plan-holding-motion
          :parameters (#q11 #q11 o10 #g2)
          :precondition (and (isconf #q11) (isconf #q11) (isgrasp o10 #g2))
          :effect (isholdingmotion #q11 #t1171 #q11 o10 #g2)
   )
   (:action s1183_plan-holding-motion
          :parameters (#q11 #q11 o10 #g3)
          :precondition (and (isconf #q11) (isconf #q11) (isgrasp o10 #g3))
          :effect (isholdingmotion #q11 #t1172 #q11 o10 #g3)
   )
   (:action s1184_plan-holding-motion
          :parameters (#q11 #q12 o10 #g0)
          :precondition (and (isconf #q11) (isconf #q12) (isgrasp o10 #g0))
          :effect (isholdingmotion #q11 #t1173 #q12 o10 #g0)
   )
   (:action s1185_plan-holding-motion
          :parameters (#q11 #q12 o10 #g1)
          :precondition (and (isconf #q11) (isconf #q12) (isgrasp o10 #g1))
          :effect (isholdingmotion #q11 #t1174 #q12 o10 #g1)
   )
   (:action s1186_plan-holding-motion
          :parameters (#q11 #q12 o10 #g2)
          :precondition (and (isconf #q11) (isconf #q12) (isgrasp o10 #g2))
          :effect (isholdingmotion #q11 #t1175 #q12 o10 #g2)
   )
   (:action s1187_plan-holding-motion
          :parameters (#q11 #q12 o10 #g3)
          :precondition (and (isconf #q11) (isconf #q12) (isgrasp o10 #g3))
          :effect (isholdingmotion #q11 #t1176 #q12 o10 #g3)
   )
   (:action s1188_plan-holding-motion
          :parameters (#q11 #q13 o10 #g0)
          :precondition (and (isconf #q11) (isconf #q13) (isgrasp o10 #g0))
          :effect (isholdingmotion #q11 #t1177 #q13 o10 #g0)
   )
   (:action s1189_plan-holding-motion
          :parameters (#q11 #q13 o10 #g1)
          :precondition (and (isconf #q11) (isconf #q13) (isgrasp o10 #g1))
          :effect (isholdingmotion #q11 #t1178 #q13 o10 #g1)
   )
   (:action s1190_plan-holding-motion
          :parameters (#q11 #q13 o10 #g2)
          :precondition (and (isconf #q11) (isconf #q13) (isgrasp o10 #g2))
          :effect (isholdingmotion #q11 #t1179 #q13 o10 #g2)
   )
   (:action s1191_plan-holding-motion
          :parameters (#q11 #q13 o10 #g3)
          :precondition (and (isconf #q11) (isconf #q13) (isgrasp o10 #g3))
          :effect (isholdingmotion #q11 #t1180 #q13 o10 #g3)
   )
   (:action s1192_plan-holding-motion
          :parameters (#q11 #q14 o10 #g0)
          :precondition (and (isconf #q11) (isconf #q14) (isgrasp o10 #g0))
          :effect (isholdingmotion #q11 #t1181 #q14 o10 #g0)
   )
   (:action s1193_plan-holding-motion
          :parameters (#q11 #q14 o10 #g1)
          :precondition (and (isconf #q11) (isconf #q14) (isgrasp o10 #g1))
          :effect (isholdingmotion #q11 #t1182 #q14 o10 #g1)
   )
   (:action s1194_plan-holding-motion
          :parameters (#q11 #q14 o10 #g2)
          :precondition (and (isconf #q11) (isconf #q14) (isgrasp o10 #g2))
          :effect (isholdingmotion #q11 #t1183 #q14 o10 #g2)
   )
   (:action s1195_plan-holding-motion
          :parameters (#q11 #q14 o10 #g3)
          :precondition (and (isconf #q11) (isconf #q14) (isgrasp o10 #g3))
          :effect (isholdingmotion #q11 #t1184 #q14 o10 #g3)
   )
   (:action s1196_plan-holding-motion
          :parameters (#q11 #q15 o10 #g0)
          :precondition (and (isconf #q11) (isconf #q15) (isgrasp o10 #g0))
          :effect (isholdingmotion #q11 #t1185 #q15 o10 #g0)
   )
   (:action s1197_plan-holding-motion
          :parameters (#q11 #q15 o10 #g1)
          :precondition (and (isconf #q11) (isconf #q15) (isgrasp o10 #g1))
          :effect (isholdingmotion #q11 #t1186 #q15 o10 #g1)
   )
   (:action s1198_plan-holding-motion
          :parameters (#q11 #q15 o10 #g2)
          :precondition (and (isconf #q11) (isconf #q15) (isgrasp o10 #g2))
          :effect (isholdingmotion #q11 #t1187 #q15 o10 #g2)
   )
   (:action s1199_plan-holding-motion
          :parameters (#q11 #q15 o10 #g3)
          :precondition (and (isconf #q11) (isconf #q15) (isgrasp o10 #g3))
          :effect (isholdingmotion #q11 #t1188 #q15 o10 #g3)
   )
   (:action s1200_plan-holding-motion
          :parameters (#q12 q224 o10 #g0)
          :precondition (and (isconf #q12) (isconf q224) (isgrasp o10 #g0))
          :effect (isholdingmotion #q12 #t1189 q224 o10 #g0)
   )
   (:action s1201_plan-holding-motion
          :parameters (#q12 q224 o10 #g1)
          :precondition (and (isconf #q12) (isconf q224) (isgrasp o10 #g1))
          :effect (isholdingmotion #q12 #t1190 q224 o10 #g1)
   )
   (:action s1202_plan-holding-motion
          :parameters (#q12 q224 o10 #g2)
          :precondition (and (isconf #q12) (isconf q224) (isgrasp o10 #g2))
          :effect (isholdingmotion #q12 #t1191 q224 o10 #g2)
   )
   (:action s1203_plan-holding-motion
          :parameters (#q12 q224 o10 #g3)
          :precondition (and (isconf #q12) (isconf q224) (isgrasp o10 #g3))
          :effect (isholdingmotion #q12 #t1192 q224 o10 #g3)
   )
   (:action s1204_plan-holding-motion
          :parameters (#q12 #q0 o10 #g0)
          :precondition (and (isconf #q12) (isconf #q0) (isgrasp o10 #g0))
          :effect (isholdingmotion #q12 #t1193 #q0 o10 #g0)
   )
   (:action s1205_plan-holding-motion
          :parameters (#q12 #q0 o10 #g1)
          :precondition (and (isconf #q12) (isconf #q0) (isgrasp o10 #g1))
          :effect (isholdingmotion #q12 #t1194 #q0 o10 #g1)
   )
   (:action s1206_plan-holding-motion
          :parameters (#q12 #q0 o10 #g2)
          :precondition (and (isconf #q12) (isconf #q0) (isgrasp o10 #g2))
          :effect (isholdingmotion #q12 #t1195 #q0 o10 #g2)
   )
   (:action s1207_plan-holding-motion
          :parameters (#q12 #q0 o10 #g3)
          :precondition (and (isconf #q12) (isconf #q0) (isgrasp o10 #g3))
          :effect (isholdingmotion #q12 #t1196 #q0 o10 #g3)
   )
   (:action s1208_plan-holding-motion
          :parameters (#q12 #q1 o10 #g0)
          :precondition (and (isconf #q12) (isconf #q1) (isgrasp o10 #g0))
          :effect (isholdingmotion #q12 #t1197 #q1 o10 #g0)
   )
   (:action s1209_plan-holding-motion
          :parameters (#q12 #q1 o10 #g1)
          :precondition (and (isconf #q12) (isconf #q1) (isgrasp o10 #g1))
          :effect (isholdingmotion #q12 #t1198 #q1 o10 #g1)
   )
   (:action s1210_plan-holding-motion
          :parameters (#q12 #q1 o10 #g2)
          :precondition (and (isconf #q12) (isconf #q1) (isgrasp o10 #g2))
          :effect (isholdingmotion #q12 #t1199 #q1 o10 #g2)
   )
   (:action s1211_plan-holding-motion
          :parameters (#q12 #q1 o10 #g3)
          :precondition (and (isconf #q12) (isconf #q1) (isgrasp o10 #g3))
          :effect (isholdingmotion #q12 #t1200 #q1 o10 #g3)
   )
   (:action s1212_plan-holding-motion
          :parameters (#q12 #q2 o10 #g0)
          :precondition (and (isconf #q12) (isconf #q2) (isgrasp o10 #g0))
          :effect (isholdingmotion #q12 #t1201 #q2 o10 #g0)
   )
   (:action s1213_plan-holding-motion
          :parameters (#q12 #q2 o10 #g1)
          :precondition (and (isconf #q12) (isconf #q2) (isgrasp o10 #g1))
          :effect (isholdingmotion #q12 #t1202 #q2 o10 #g1)
   )
   (:action s1214_plan-holding-motion
          :parameters (#q12 #q2 o10 #g2)
          :precondition (and (isconf #q12) (isconf #q2) (isgrasp o10 #g2))
          :effect (isholdingmotion #q12 #t1203 #q2 o10 #g2)
   )
   (:action s1215_plan-holding-motion
          :parameters (#q12 #q2 o10 #g3)
          :precondition (and (isconf #q12) (isconf #q2) (isgrasp o10 #g3))
          :effect (isholdingmotion #q12 #t1204 #q2 o10 #g3)
   )
   (:action s1216_plan-holding-motion
          :parameters (#q12 #q3 o10 #g0)
          :precondition (and (isconf #q12) (isconf #q3) (isgrasp o10 #g0))
          :effect (isholdingmotion #q12 #t1205 #q3 o10 #g0)
   )
   (:action s1217_plan-holding-motion
          :parameters (#q12 #q3 o10 #g1)
          :precondition (and (isconf #q12) (isconf #q3) (isgrasp o10 #g1))
          :effect (isholdingmotion #q12 #t1206 #q3 o10 #g1)
   )
   (:action s1218_plan-holding-motion
          :parameters (#q12 #q3 o10 #g2)
          :precondition (and (isconf #q12) (isconf #q3) (isgrasp o10 #g2))
          :effect (isholdingmotion #q12 #t1207 #q3 o10 #g2)
   )
   (:action s1219_plan-holding-motion
          :parameters (#q12 #q3 o10 #g3)
          :precondition (and (isconf #q12) (isconf #q3) (isgrasp o10 #g3))
          :effect (isholdingmotion #q12 #t1208 #q3 o10 #g3)
   )
   (:action s1220_plan-holding-motion
          :parameters (#q12 #q4 o10 #g0)
          :precondition (and (isconf #q12) (isconf #q4) (isgrasp o10 #g0))
          :effect (isholdingmotion #q12 #t1209 #q4 o10 #g0)
   )
   (:action s1221_plan-holding-motion
          :parameters (#q12 #q4 o10 #g1)
          :precondition (and (isconf #q12) (isconf #q4) (isgrasp o10 #g1))
          :effect (isholdingmotion #q12 #t1210 #q4 o10 #g1)
   )
   (:action s1222_plan-holding-motion
          :parameters (#q12 #q4 o10 #g2)
          :precondition (and (isconf #q12) (isconf #q4) (isgrasp o10 #g2))
          :effect (isholdingmotion #q12 #t1211 #q4 o10 #g2)
   )
   (:action s1223_plan-holding-motion
          :parameters (#q12 #q4 o10 #g3)
          :precondition (and (isconf #q12) (isconf #q4) (isgrasp o10 #g3))
          :effect (isholdingmotion #q12 #t1212 #q4 o10 #g3)
   )
   (:action s1224_plan-holding-motion
          :parameters (#q12 #q5 o10 #g0)
          :precondition (and (isconf #q12) (isconf #q5) (isgrasp o10 #g0))
          :effect (isholdingmotion #q12 #t1213 #q5 o10 #g0)
   )
   (:action s1225_plan-holding-motion
          :parameters (#q12 #q5 o10 #g1)
          :precondition (and (isconf #q12) (isconf #q5) (isgrasp o10 #g1))
          :effect (isholdingmotion #q12 #t1214 #q5 o10 #g1)
   )
   (:action s1226_plan-holding-motion
          :parameters (#q12 #q5 o10 #g2)
          :precondition (and (isconf #q12) (isconf #q5) (isgrasp o10 #g2))
          :effect (isholdingmotion #q12 #t1215 #q5 o10 #g2)
   )
   (:action s1227_plan-holding-motion
          :parameters (#q12 #q5 o10 #g3)
          :precondition (and (isconf #q12) (isconf #q5) (isgrasp o10 #g3))
          :effect (isholdingmotion #q12 #t1216 #q5 o10 #g3)
   )
   (:action s1228_plan-holding-motion
          :parameters (#q12 #q6 o10 #g0)
          :precondition (and (isconf #q12) (isconf #q6) (isgrasp o10 #g0))
          :effect (isholdingmotion #q12 #t1217 #q6 o10 #g0)
   )
   (:action s1229_plan-holding-motion
          :parameters (#q12 #q6 o10 #g1)
          :precondition (and (isconf #q12) (isconf #q6) (isgrasp o10 #g1))
          :effect (isholdingmotion #q12 #t1218 #q6 o10 #g1)
   )
   (:action s1230_plan-holding-motion
          :parameters (#q12 #q6 o10 #g2)
          :precondition (and (isconf #q12) (isconf #q6) (isgrasp o10 #g2))
          :effect (isholdingmotion #q12 #t1219 #q6 o10 #g2)
   )
   (:action s1231_plan-holding-motion
          :parameters (#q12 #q6 o10 #g3)
          :precondition (and (isconf #q12) (isconf #q6) (isgrasp o10 #g3))
          :effect (isholdingmotion #q12 #t1220 #q6 o10 #g3)
   )
   (:action s1232_plan-holding-motion
          :parameters (#q12 #q7 o10 #g0)
          :precondition (and (isconf #q12) (isconf #q7) (isgrasp o10 #g0))
          :effect (isholdingmotion #q12 #t1221 #q7 o10 #g0)
   )
   (:action s1233_plan-holding-motion
          :parameters (#q12 #q7 o10 #g1)
          :precondition (and (isconf #q12) (isconf #q7) (isgrasp o10 #g1))
          :effect (isholdingmotion #q12 #t1222 #q7 o10 #g1)
   )
   (:action s1234_plan-holding-motion
          :parameters (#q12 #q7 o10 #g2)
          :precondition (and (isconf #q12) (isconf #q7) (isgrasp o10 #g2))
          :effect (isholdingmotion #q12 #t1223 #q7 o10 #g2)
   )
   (:action s1235_plan-holding-motion
          :parameters (#q12 #q7 o10 #g3)
          :precondition (and (isconf #q12) (isconf #q7) (isgrasp o10 #g3))
          :effect (isholdingmotion #q12 #t1224 #q7 o10 #g3)
   )
   (:action s1236_plan-holding-motion
          :parameters (#q12 #q8 o10 #g0)
          :precondition (and (isconf #q12) (isconf #q8) (isgrasp o10 #g0))
          :effect (isholdingmotion #q12 #t1225 #q8 o10 #g0)
   )
   (:action s1237_plan-holding-motion
          :parameters (#q12 #q8 o10 #g1)
          :precondition (and (isconf #q12) (isconf #q8) (isgrasp o10 #g1))
          :effect (isholdingmotion #q12 #t1226 #q8 o10 #g1)
   )
   (:action s1238_plan-holding-motion
          :parameters (#q12 #q8 o10 #g2)
          :precondition (and (isconf #q12) (isconf #q8) (isgrasp o10 #g2))
          :effect (isholdingmotion #q12 #t1227 #q8 o10 #g2)
   )
   (:action s1239_plan-holding-motion
          :parameters (#q12 #q8 o10 #g3)
          :precondition (and (isconf #q12) (isconf #q8) (isgrasp o10 #g3))
          :effect (isholdingmotion #q12 #t1228 #q8 o10 #g3)
   )
   (:action s1240_plan-holding-motion
          :parameters (#q12 #q9 o10 #g0)
          :precondition (and (isconf #q12) (isconf #q9) (isgrasp o10 #g0))
          :effect (isholdingmotion #q12 #t1229 #q9 o10 #g0)
   )
   (:action s1241_plan-holding-motion
          :parameters (#q12 #q9 o10 #g1)
          :precondition (and (isconf #q12) (isconf #q9) (isgrasp o10 #g1))
          :effect (isholdingmotion #q12 #t1230 #q9 o10 #g1)
   )
   (:action s1242_plan-holding-motion
          :parameters (#q12 #q9 o10 #g2)
          :precondition (and (isconf #q12) (isconf #q9) (isgrasp o10 #g2))
          :effect (isholdingmotion #q12 #t1231 #q9 o10 #g2)
   )
   (:action s1243_plan-holding-motion
          :parameters (#q12 #q9 o10 #g3)
          :precondition (and (isconf #q12) (isconf #q9) (isgrasp o10 #g3))
          :effect (isholdingmotion #q12 #t1232 #q9 o10 #g3)
   )
   (:action s1244_plan-holding-motion
          :parameters (#q12 #q10 o10 #g0)
          :precondition (and (isconf #q12) (isconf #q10) (isgrasp o10 #g0))
          :effect (isholdingmotion #q12 #t1233 #q10 o10 #g0)
   )
   (:action s1245_plan-holding-motion
          :parameters (#q12 #q10 o10 #g1)
          :precondition (and (isconf #q12) (isconf #q10) (isgrasp o10 #g1))
          :effect (isholdingmotion #q12 #t1234 #q10 o10 #g1)
   )
   (:action s1246_plan-holding-motion
          :parameters (#q12 #q10 o10 #g2)
          :precondition (and (isconf #q12) (isconf #q10) (isgrasp o10 #g2))
          :effect (isholdingmotion #q12 #t1235 #q10 o10 #g2)
   )
   (:action s1247_plan-holding-motion
          :parameters (#q12 #q10 o10 #g3)
          :precondition (and (isconf #q12) (isconf #q10) (isgrasp o10 #g3))
          :effect (isholdingmotion #q12 #t1236 #q10 o10 #g3)
   )
   (:action s1248_plan-holding-motion
          :parameters (#q12 #q11 o10 #g0)
          :precondition (and (isconf #q12) (isconf #q11) (isgrasp o10 #g0))
          :effect (isholdingmotion #q12 #t1237 #q11 o10 #g0)
   )
   (:action s1249_plan-holding-motion
          :parameters (#q12 #q11 o10 #g1)
          :precondition (and (isconf #q12) (isconf #q11) (isgrasp o10 #g1))
          :effect (isholdingmotion #q12 #t1238 #q11 o10 #g1)
   )
   (:action s1250_plan-holding-motion
          :parameters (#q12 #q11 o10 #g2)
          :precondition (and (isconf #q12) (isconf #q11) (isgrasp o10 #g2))
          :effect (isholdingmotion #q12 #t1239 #q11 o10 #g2)
   )
   (:action s1251_plan-holding-motion
          :parameters (#q12 #q11 o10 #g3)
          :precondition (and (isconf #q12) (isconf #q11) (isgrasp o10 #g3))
          :effect (isholdingmotion #q12 #t1240 #q11 o10 #g3)
   )
   (:action s1252_plan-holding-motion
          :parameters (#q12 #q12 o10 #g0)
          :precondition (and (isconf #q12) (isconf #q12) (isgrasp o10 #g0))
          :effect (isholdingmotion #q12 #t1241 #q12 o10 #g0)
   )
   (:action s1253_plan-holding-motion
          :parameters (#q12 #q12 o10 #g1)
          :precondition (and (isconf #q12) (isconf #q12) (isgrasp o10 #g1))
          :effect (isholdingmotion #q12 #t1242 #q12 o10 #g1)
   )
   (:action s1254_plan-holding-motion
          :parameters (#q12 #q12 o10 #g2)
          :precondition (and (isconf #q12) (isconf #q12) (isgrasp o10 #g2))
          :effect (isholdingmotion #q12 #t1243 #q12 o10 #g2)
   )
   (:action s1255_plan-holding-motion
          :parameters (#q12 #q12 o10 #g3)
          :precondition (and (isconf #q12) (isconf #q12) (isgrasp o10 #g3))
          :effect (isholdingmotion #q12 #t1244 #q12 o10 #g3)
   )
   (:action s1256_plan-holding-motion
          :parameters (#q12 #q13 o10 #g0)
          :precondition (and (isconf #q12) (isconf #q13) (isgrasp o10 #g0))
          :effect (isholdingmotion #q12 #t1245 #q13 o10 #g0)
   )
   (:action s1257_plan-holding-motion
          :parameters (#q12 #q13 o10 #g1)
          :precondition (and (isconf #q12) (isconf #q13) (isgrasp o10 #g1))
          :effect (isholdingmotion #q12 #t1246 #q13 o10 #g1)
   )
   (:action s1258_plan-holding-motion
          :parameters (#q12 #q13 o10 #g2)
          :precondition (and (isconf #q12) (isconf #q13) (isgrasp o10 #g2))
          :effect (isholdingmotion #q12 #t1247 #q13 o10 #g2)
   )
   (:action s1259_plan-holding-motion
          :parameters (#q12 #q13 o10 #g3)
          :precondition (and (isconf #q12) (isconf #q13) (isgrasp o10 #g3))
          :effect (isholdingmotion #q12 #t1248 #q13 o10 #g3)
   )
   (:action s1260_plan-holding-motion
          :parameters (#q12 #q14 o10 #g0)
          :precondition (and (isconf #q12) (isconf #q14) (isgrasp o10 #g0))
          :effect (isholdingmotion #q12 #t1249 #q14 o10 #g0)
   )
   (:action s1261_plan-holding-motion
          :parameters (#q12 #q14 o10 #g1)
          :precondition (and (isconf #q12) (isconf #q14) (isgrasp o10 #g1))
          :effect (isholdingmotion #q12 #t1250 #q14 o10 #g1)
   )
   (:action s1262_plan-holding-motion
          :parameters (#q12 #q14 o10 #g2)
          :precondition (and (isconf #q12) (isconf #q14) (isgrasp o10 #g2))
          :effect (isholdingmotion #q12 #t1251 #q14 o10 #g2)
   )
   (:action s1263_plan-holding-motion
          :parameters (#q12 #q14 o10 #g3)
          :precondition (and (isconf #q12) (isconf #q14) (isgrasp o10 #g3))
          :effect (isholdingmotion #q12 #t1252 #q14 o10 #g3)
   )
   (:action s1264_plan-holding-motion
          :parameters (#q12 #q15 o10 #g0)
          :precondition (and (isconf #q12) (isconf #q15) (isgrasp o10 #g0))
          :effect (isholdingmotion #q12 #t1253 #q15 o10 #g0)
   )
   (:action s1265_plan-holding-motion
          :parameters (#q12 #q15 o10 #g1)
          :precondition (and (isconf #q12) (isconf #q15) (isgrasp o10 #g1))
          :effect (isholdingmotion #q12 #t1254 #q15 o10 #g1)
   )
   (:action s1266_plan-holding-motion
          :parameters (#q12 #q15 o10 #g2)
          :precondition (and (isconf #q12) (isconf #q15) (isgrasp o10 #g2))
          :effect (isholdingmotion #q12 #t1255 #q15 o10 #g2)
   )
   (:action s1267_plan-holding-motion
          :parameters (#q12 #q15 o10 #g3)
          :precondition (and (isconf #q12) (isconf #q15) (isgrasp o10 #g3))
          :effect (isholdingmotion #q12 #t1256 #q15 o10 #g3)
   )
   (:action s1268_plan-holding-motion
          :parameters (#q13 q224 o10 #g0)
          :precondition (and (isconf #q13) (isconf q224) (isgrasp o10 #g0))
          :effect (isholdingmotion #q13 #t1257 q224 o10 #g0)
   )
   (:action s1269_plan-holding-motion
          :parameters (#q13 q224 o10 #g1)
          :precondition (and (isconf #q13) (isconf q224) (isgrasp o10 #g1))
          :effect (isholdingmotion #q13 #t1258 q224 o10 #g1)
   )
   (:action s1270_plan-holding-motion
          :parameters (#q13 q224 o10 #g2)
          :precondition (and (isconf #q13) (isconf q224) (isgrasp o10 #g2))
          :effect (isholdingmotion #q13 #t1259 q224 o10 #g2)
   )
   (:action s1271_plan-holding-motion
          :parameters (#q13 q224 o10 #g3)
          :precondition (and (isconf #q13) (isconf q224) (isgrasp o10 #g3))
          :effect (isholdingmotion #q13 #t1260 q224 o10 #g3)
   )
   (:action s1272_plan-holding-motion
          :parameters (#q13 #q0 o10 #g0)
          :precondition (and (isconf #q13) (isconf #q0) (isgrasp o10 #g0))
          :effect (isholdingmotion #q13 #t1261 #q0 o10 #g0)
   )
   (:action s1273_plan-holding-motion
          :parameters (#q13 #q0 o10 #g1)
          :precondition (and (isconf #q13) (isconf #q0) (isgrasp o10 #g1))
          :effect (isholdingmotion #q13 #t1262 #q0 o10 #g1)
   )
   (:action s1274_plan-holding-motion
          :parameters (#q13 #q0 o10 #g2)
          :precondition (and (isconf #q13) (isconf #q0) (isgrasp o10 #g2))
          :effect (isholdingmotion #q13 #t1263 #q0 o10 #g2)
   )
   (:action s1275_plan-holding-motion
          :parameters (#q13 #q0 o10 #g3)
          :precondition (and (isconf #q13) (isconf #q0) (isgrasp o10 #g3))
          :effect (isholdingmotion #q13 #t1264 #q0 o10 #g3)
   )
   (:action s1276_plan-holding-motion
          :parameters (#q13 #q1 o10 #g0)
          :precondition (and (isconf #q13) (isconf #q1) (isgrasp o10 #g0))
          :effect (isholdingmotion #q13 #t1265 #q1 o10 #g0)
   )
   (:action s1277_plan-holding-motion
          :parameters (#q13 #q1 o10 #g1)
          :precondition (and (isconf #q13) (isconf #q1) (isgrasp o10 #g1))
          :effect (isholdingmotion #q13 #t1266 #q1 o10 #g1)
   )
   (:action s1278_plan-holding-motion
          :parameters (#q13 #q1 o10 #g2)
          :precondition (and (isconf #q13) (isconf #q1) (isgrasp o10 #g2))
          :effect (isholdingmotion #q13 #t1267 #q1 o10 #g2)
   )
   (:action s1279_plan-holding-motion
          :parameters (#q13 #q1 o10 #g3)
          :precondition (and (isconf #q13) (isconf #q1) (isgrasp o10 #g3))
          :effect (isholdingmotion #q13 #t1268 #q1 o10 #g3)
   )
   (:action s1280_plan-holding-motion
          :parameters (#q13 #q2 o10 #g0)
          :precondition (and (isconf #q13) (isconf #q2) (isgrasp o10 #g0))
          :effect (isholdingmotion #q13 #t1269 #q2 o10 #g0)
   )
   (:action s1281_plan-holding-motion
          :parameters (#q13 #q2 o10 #g1)
          :precondition (and (isconf #q13) (isconf #q2) (isgrasp o10 #g1))
          :effect (isholdingmotion #q13 #t1270 #q2 o10 #g1)
   )
   (:action s1282_plan-holding-motion
          :parameters (#q13 #q2 o10 #g2)
          :precondition (and (isconf #q13) (isconf #q2) (isgrasp o10 #g2))
          :effect (isholdingmotion #q13 #t1271 #q2 o10 #g2)
   )
   (:action s1283_plan-holding-motion
          :parameters (#q13 #q2 o10 #g3)
          :precondition (and (isconf #q13) (isconf #q2) (isgrasp o10 #g3))
          :effect (isholdingmotion #q13 #t1272 #q2 o10 #g3)
   )
   (:action s1284_plan-holding-motion
          :parameters (#q13 #q3 o10 #g0)
          :precondition (and (isconf #q13) (isconf #q3) (isgrasp o10 #g0))
          :effect (isholdingmotion #q13 #t1273 #q3 o10 #g0)
   )
   (:action s1285_plan-holding-motion
          :parameters (#q13 #q3 o10 #g1)
          :precondition (and (isconf #q13) (isconf #q3) (isgrasp o10 #g1))
          :effect (isholdingmotion #q13 #t1274 #q3 o10 #g1)
   )
   (:action s1286_plan-holding-motion
          :parameters (#q13 #q3 o10 #g2)
          :precondition (and (isconf #q13) (isconf #q3) (isgrasp o10 #g2))
          :effect (isholdingmotion #q13 #t1275 #q3 o10 #g2)
   )
   (:action s1287_plan-holding-motion
          :parameters (#q13 #q3 o10 #g3)
          :precondition (and (isconf #q13) (isconf #q3) (isgrasp o10 #g3))
          :effect (isholdingmotion #q13 #t1276 #q3 o10 #g3)
   )
   (:action s1288_plan-holding-motion
          :parameters (#q13 #q4 o10 #g0)
          :precondition (and (isconf #q13) (isconf #q4) (isgrasp o10 #g0))
          :effect (isholdingmotion #q13 #t1277 #q4 o10 #g0)
   )
   (:action s1289_plan-holding-motion
          :parameters (#q13 #q4 o10 #g1)
          :precondition (and (isconf #q13) (isconf #q4) (isgrasp o10 #g1))
          :effect (isholdingmotion #q13 #t1278 #q4 o10 #g1)
   )
   (:action s1290_plan-holding-motion
          :parameters (#q13 #q4 o10 #g2)
          :precondition (and (isconf #q13) (isconf #q4) (isgrasp o10 #g2))
          :effect (isholdingmotion #q13 #t1279 #q4 o10 #g2)
   )
   (:action s1291_plan-holding-motion
          :parameters (#q13 #q4 o10 #g3)
          :precondition (and (isconf #q13) (isconf #q4) (isgrasp o10 #g3))
          :effect (isholdingmotion #q13 #t1280 #q4 o10 #g3)
   )
   (:action s1292_plan-holding-motion
          :parameters (#q13 #q5 o10 #g0)
          :precondition (and (isconf #q13) (isconf #q5) (isgrasp o10 #g0))
          :effect (isholdingmotion #q13 #t1281 #q5 o10 #g0)
   )
   (:action s1293_plan-holding-motion
          :parameters (#q13 #q5 o10 #g1)
          :precondition (and (isconf #q13) (isconf #q5) (isgrasp o10 #g1))
          :effect (isholdingmotion #q13 #t1282 #q5 o10 #g1)
   )
   (:action s1294_plan-holding-motion
          :parameters (#q13 #q5 o10 #g2)
          :precondition (and (isconf #q13) (isconf #q5) (isgrasp o10 #g2))
          :effect (isholdingmotion #q13 #t1283 #q5 o10 #g2)
   )
   (:action s1295_plan-holding-motion
          :parameters (#q13 #q5 o10 #g3)
          :precondition (and (isconf #q13) (isconf #q5) (isgrasp o10 #g3))
          :effect (isholdingmotion #q13 #t1284 #q5 o10 #g3)
   )
   (:action s1296_plan-holding-motion
          :parameters (#q13 #q6 o10 #g0)
          :precondition (and (isconf #q13) (isconf #q6) (isgrasp o10 #g0))
          :effect (isholdingmotion #q13 #t1285 #q6 o10 #g0)
   )
   (:action s1297_plan-holding-motion
          :parameters (#q13 #q6 o10 #g1)
          :precondition (and (isconf #q13) (isconf #q6) (isgrasp o10 #g1))
          :effect (isholdingmotion #q13 #t1286 #q6 o10 #g1)
   )
   (:action s1298_plan-holding-motion
          :parameters (#q13 #q6 o10 #g2)
          :precondition (and (isconf #q13) (isconf #q6) (isgrasp o10 #g2))
          :effect (isholdingmotion #q13 #t1287 #q6 o10 #g2)
   )
   (:action s1299_plan-holding-motion
          :parameters (#q13 #q6 o10 #g3)
          :precondition (and (isconf #q13) (isconf #q6) (isgrasp o10 #g3))
          :effect (isholdingmotion #q13 #t1288 #q6 o10 #g3)
   )
   (:action s1300_plan-holding-motion
          :parameters (#q13 #q7 o10 #g0)
          :precondition (and (isconf #q13) (isconf #q7) (isgrasp o10 #g0))
          :effect (isholdingmotion #q13 #t1289 #q7 o10 #g0)
   )
   (:action s1301_plan-holding-motion
          :parameters (#q13 #q7 o10 #g1)
          :precondition (and (isconf #q13) (isconf #q7) (isgrasp o10 #g1))
          :effect (isholdingmotion #q13 #t1290 #q7 o10 #g1)
   )
   (:action s1302_plan-holding-motion
          :parameters (#q13 #q7 o10 #g2)
          :precondition (and (isconf #q13) (isconf #q7) (isgrasp o10 #g2))
          :effect (isholdingmotion #q13 #t1291 #q7 o10 #g2)
   )
   (:action s1303_plan-holding-motion
          :parameters (#q13 #q7 o10 #g3)
          :precondition (and (isconf #q13) (isconf #q7) (isgrasp o10 #g3))
          :effect (isholdingmotion #q13 #t1292 #q7 o10 #g3)
   )
   (:action s1304_plan-holding-motion
          :parameters (#q13 #q8 o10 #g0)
          :precondition (and (isconf #q13) (isconf #q8) (isgrasp o10 #g0))
          :effect (isholdingmotion #q13 #t1293 #q8 o10 #g0)
   )
   (:action s1305_plan-holding-motion
          :parameters (#q13 #q8 o10 #g1)
          :precondition (and (isconf #q13) (isconf #q8) (isgrasp o10 #g1))
          :effect (isholdingmotion #q13 #t1294 #q8 o10 #g1)
   )
   (:action s1306_plan-holding-motion
          :parameters (#q13 #q8 o10 #g2)
          :precondition (and (isconf #q13) (isconf #q8) (isgrasp o10 #g2))
          :effect (isholdingmotion #q13 #t1295 #q8 o10 #g2)
   )
   (:action s1307_plan-holding-motion
          :parameters (#q13 #q8 o10 #g3)
          :precondition (and (isconf #q13) (isconf #q8) (isgrasp o10 #g3))
          :effect (isholdingmotion #q13 #t1296 #q8 o10 #g3)
   )
   (:action s1308_plan-holding-motion
          :parameters (#q13 #q9 o10 #g0)
          :precondition (and (isconf #q13) (isconf #q9) (isgrasp o10 #g0))
          :effect (isholdingmotion #q13 #t1297 #q9 o10 #g0)
   )
   (:action s1309_plan-holding-motion
          :parameters (#q13 #q9 o10 #g1)
          :precondition (and (isconf #q13) (isconf #q9) (isgrasp o10 #g1))
          :effect (isholdingmotion #q13 #t1298 #q9 o10 #g1)
   )
   (:action s1310_plan-holding-motion
          :parameters (#q13 #q9 o10 #g2)
          :precondition (and (isconf #q13) (isconf #q9) (isgrasp o10 #g2))
          :effect (isholdingmotion #q13 #t1299 #q9 o10 #g2)
   )
   (:action s1311_plan-holding-motion
          :parameters (#q13 #q9 o10 #g3)
          :precondition (and (isconf #q13) (isconf #q9) (isgrasp o10 #g3))
          :effect (isholdingmotion #q13 #t1300 #q9 o10 #g3)
   )
   (:action s1312_plan-holding-motion
          :parameters (#q13 #q10 o10 #g0)
          :precondition (and (isconf #q13) (isconf #q10) (isgrasp o10 #g0))
          :effect (isholdingmotion #q13 #t1301 #q10 o10 #g0)
   )
   (:action s1313_plan-holding-motion
          :parameters (#q13 #q10 o10 #g1)
          :precondition (and (isconf #q13) (isconf #q10) (isgrasp o10 #g1))
          :effect (isholdingmotion #q13 #t1302 #q10 o10 #g1)
   )
   (:action s1314_plan-holding-motion
          :parameters (#q13 #q10 o10 #g2)
          :precondition (and (isconf #q13) (isconf #q10) (isgrasp o10 #g2))
          :effect (isholdingmotion #q13 #t1303 #q10 o10 #g2)
   )
   (:action s1315_plan-holding-motion
          :parameters (#q13 #q10 o10 #g3)
          :precondition (and (isconf #q13) (isconf #q10) (isgrasp o10 #g3))
          :effect (isholdingmotion #q13 #t1304 #q10 o10 #g3)
   )
   (:action s1316_plan-holding-motion
          :parameters (#q13 #q11 o10 #g0)
          :precondition (and (isconf #q13) (isconf #q11) (isgrasp o10 #g0))
          :effect (isholdingmotion #q13 #t1305 #q11 o10 #g0)
   )
   (:action s1317_plan-holding-motion
          :parameters (#q13 #q11 o10 #g1)
          :precondition (and (isconf #q13) (isconf #q11) (isgrasp o10 #g1))
          :effect (isholdingmotion #q13 #t1306 #q11 o10 #g1)
   )
   (:action s1318_plan-holding-motion
          :parameters (#q13 #q11 o10 #g2)
          :precondition (and (isconf #q13) (isconf #q11) (isgrasp o10 #g2))
          :effect (isholdingmotion #q13 #t1307 #q11 o10 #g2)
   )
   (:action s1319_plan-holding-motion
          :parameters (#q13 #q11 o10 #g3)
          :precondition (and (isconf #q13) (isconf #q11) (isgrasp o10 #g3))
          :effect (isholdingmotion #q13 #t1308 #q11 o10 #g3)
   )
   (:action s1320_plan-holding-motion
          :parameters (#q13 #q12 o10 #g0)
          :precondition (and (isconf #q13) (isconf #q12) (isgrasp o10 #g0))
          :effect (isholdingmotion #q13 #t1309 #q12 o10 #g0)
   )
   (:action s1321_plan-holding-motion
          :parameters (#q13 #q12 o10 #g1)
          :precondition (and (isconf #q13) (isconf #q12) (isgrasp o10 #g1))
          :effect (isholdingmotion #q13 #t1310 #q12 o10 #g1)
   )
   (:action s1322_plan-holding-motion
          :parameters (#q13 #q12 o10 #g2)
          :precondition (and (isconf #q13) (isconf #q12) (isgrasp o10 #g2))
          :effect (isholdingmotion #q13 #t1311 #q12 o10 #g2)
   )
   (:action s1323_plan-holding-motion
          :parameters (#q13 #q12 o10 #g3)
          :precondition (and (isconf #q13) (isconf #q12) (isgrasp o10 #g3))
          :effect (isholdingmotion #q13 #t1312 #q12 o10 #g3)
   )
   (:action s1324_plan-holding-motion
          :parameters (#q13 #q13 o10 #g0)
          :precondition (and (isconf #q13) (isconf #q13) (isgrasp o10 #g0))
          :effect (isholdingmotion #q13 #t1313 #q13 o10 #g0)
   )
   (:action s1325_plan-holding-motion
          :parameters (#q13 #q13 o10 #g1)
          :precondition (and (isconf #q13) (isconf #q13) (isgrasp o10 #g1))
          :effect (isholdingmotion #q13 #t1314 #q13 o10 #g1)
   )
   (:action s1326_plan-holding-motion
          :parameters (#q13 #q13 o10 #g2)
          :precondition (and (isconf #q13) (isconf #q13) (isgrasp o10 #g2))
          :effect (isholdingmotion #q13 #t1315 #q13 o10 #g2)
   )
   (:action s1327_plan-holding-motion
          :parameters (#q13 #q13 o10 #g3)
          :precondition (and (isconf #q13) (isconf #q13) (isgrasp o10 #g3))
          :effect (isholdingmotion #q13 #t1316 #q13 o10 #g3)
   )
   (:action s1328_plan-holding-motion
          :parameters (#q13 #q14 o10 #g0)
          :precondition (and (isconf #q13) (isconf #q14) (isgrasp o10 #g0))
          :effect (isholdingmotion #q13 #t1317 #q14 o10 #g0)
   )
   (:action s1329_plan-holding-motion
          :parameters (#q13 #q14 o10 #g1)
          :precondition (and (isconf #q13) (isconf #q14) (isgrasp o10 #g1))
          :effect (isholdingmotion #q13 #t1318 #q14 o10 #g1)
   )
   (:action s1330_plan-holding-motion
          :parameters (#q13 #q14 o10 #g2)
          :precondition (and (isconf #q13) (isconf #q14) (isgrasp o10 #g2))
          :effect (isholdingmotion #q13 #t1319 #q14 o10 #g2)
   )
   (:action s1331_plan-holding-motion
          :parameters (#q13 #q14 o10 #g3)
          :precondition (and (isconf #q13) (isconf #q14) (isgrasp o10 #g3))
          :effect (isholdingmotion #q13 #t1320 #q14 o10 #g3)
   )
   (:action s1332_plan-holding-motion
          :parameters (#q13 #q15 o10 #g0)
          :precondition (and (isconf #q13) (isconf #q15) (isgrasp o10 #g0))
          :effect (isholdingmotion #q13 #t1321 #q15 o10 #g0)
   )
   (:action s1333_plan-holding-motion
          :parameters (#q13 #q15 o10 #g1)
          :precondition (and (isconf #q13) (isconf #q15) (isgrasp o10 #g1))
          :effect (isholdingmotion #q13 #t1322 #q15 o10 #g1)
   )
   (:action s1334_plan-holding-motion
          :parameters (#q13 #q15 o10 #g2)
          :precondition (and (isconf #q13) (isconf #q15) (isgrasp o10 #g2))
          :effect (isholdingmotion #q13 #t1323 #q15 o10 #g2)
   )
   (:action s1335_plan-holding-motion
          :parameters (#q13 #q15 o10 #g3)
          :precondition (and (isconf #q13) (isconf #q15) (isgrasp o10 #g3))
          :effect (isholdingmotion #q13 #t1324 #q15 o10 #g3)
   )
   (:action s1336_plan-holding-motion
          :parameters (#q14 q224 o10 #g0)
          :precondition (and (isconf #q14) (isconf q224) (isgrasp o10 #g0))
          :effect (isholdingmotion #q14 #t1325 q224 o10 #g0)
   )
   (:action s1337_plan-holding-motion
          :parameters (#q14 q224 o10 #g1)
          :precondition (and (isconf #q14) (isconf q224) (isgrasp o10 #g1))
          :effect (isholdingmotion #q14 #t1326 q224 o10 #g1)
   )
   (:action s1338_plan-holding-motion
          :parameters (#q14 q224 o10 #g2)
          :precondition (and (isconf #q14) (isconf q224) (isgrasp o10 #g2))
          :effect (isholdingmotion #q14 #t1327 q224 o10 #g2)
   )
   (:action s1339_plan-holding-motion
          :parameters (#q14 q224 o10 #g3)
          :precondition (and (isconf #q14) (isconf q224) (isgrasp o10 #g3))
          :effect (isholdingmotion #q14 #t1328 q224 o10 #g3)
   )
   (:action s1340_plan-holding-motion
          :parameters (#q14 #q0 o10 #g0)
          :precondition (and (isconf #q14) (isconf #q0) (isgrasp o10 #g0))
          :effect (isholdingmotion #q14 #t1329 #q0 o10 #g0)
   )
   (:action s1341_plan-holding-motion
          :parameters (#q14 #q0 o10 #g1)
          :precondition (and (isconf #q14) (isconf #q0) (isgrasp o10 #g1))
          :effect (isholdingmotion #q14 #t1330 #q0 o10 #g1)
   )
   (:action s1342_plan-holding-motion
          :parameters (#q14 #q0 o10 #g2)
          :precondition (and (isconf #q14) (isconf #q0) (isgrasp o10 #g2))
          :effect (isholdingmotion #q14 #t1331 #q0 o10 #g2)
   )
   (:action s1343_plan-holding-motion
          :parameters (#q14 #q0 o10 #g3)
          :precondition (and (isconf #q14) (isconf #q0) (isgrasp o10 #g3))
          :effect (isholdingmotion #q14 #t1332 #q0 o10 #g3)
   )
   (:action s1344_plan-holding-motion
          :parameters (#q14 #q1 o10 #g0)
          :precondition (and (isconf #q14) (isconf #q1) (isgrasp o10 #g0))
          :effect (isholdingmotion #q14 #t1333 #q1 o10 #g0)
   )
   (:action s1345_plan-holding-motion
          :parameters (#q14 #q1 o10 #g1)
          :precondition (and (isconf #q14) (isconf #q1) (isgrasp o10 #g1))
          :effect (isholdingmotion #q14 #t1334 #q1 o10 #g1)
   )
   (:action s1346_plan-holding-motion
          :parameters (#q14 #q1 o10 #g2)
          :precondition (and (isconf #q14) (isconf #q1) (isgrasp o10 #g2))
          :effect (isholdingmotion #q14 #t1335 #q1 o10 #g2)
   )
   (:action s1347_plan-holding-motion
          :parameters (#q14 #q1 o10 #g3)
          :precondition (and (isconf #q14) (isconf #q1) (isgrasp o10 #g3))
          :effect (isholdingmotion #q14 #t1336 #q1 o10 #g3)
   )
   (:action s1348_plan-holding-motion
          :parameters (#q14 #q2 o10 #g0)
          :precondition (and (isconf #q14) (isconf #q2) (isgrasp o10 #g0))
          :effect (isholdingmotion #q14 #t1337 #q2 o10 #g0)
   )
   (:action s1349_plan-holding-motion
          :parameters (#q14 #q2 o10 #g1)
          :precondition (and (isconf #q14) (isconf #q2) (isgrasp o10 #g1))
          :effect (isholdingmotion #q14 #t1338 #q2 o10 #g1)
   )
   (:action s1350_plan-holding-motion
          :parameters (#q14 #q2 o10 #g2)
          :precondition (and (isconf #q14) (isconf #q2) (isgrasp o10 #g2))
          :effect (isholdingmotion #q14 #t1339 #q2 o10 #g2)
   )
   (:action s1351_plan-holding-motion
          :parameters (#q14 #q2 o10 #g3)
          :precondition (and (isconf #q14) (isconf #q2) (isgrasp o10 #g3))
          :effect (isholdingmotion #q14 #t1340 #q2 o10 #g3)
   )
   (:action s1352_plan-holding-motion
          :parameters (#q14 #q3 o10 #g0)
          :precondition (and (isconf #q14) (isconf #q3) (isgrasp o10 #g0))
          :effect (isholdingmotion #q14 #t1341 #q3 o10 #g0)
   )
   (:action s1353_plan-holding-motion
          :parameters (#q14 #q3 o10 #g1)
          :precondition (and (isconf #q14) (isconf #q3) (isgrasp o10 #g1))
          :effect (isholdingmotion #q14 #t1342 #q3 o10 #g1)
   )
   (:action s1354_plan-holding-motion
          :parameters (#q14 #q3 o10 #g2)
          :precondition (and (isconf #q14) (isconf #q3) (isgrasp o10 #g2))
          :effect (isholdingmotion #q14 #t1343 #q3 o10 #g2)
   )
   (:action s1355_plan-holding-motion
          :parameters (#q14 #q3 o10 #g3)
          :precondition (and (isconf #q14) (isconf #q3) (isgrasp o10 #g3))
          :effect (isholdingmotion #q14 #t1344 #q3 o10 #g3)
   )
   (:action s1356_plan-holding-motion
          :parameters (#q14 #q4 o10 #g0)
          :precondition (and (isconf #q14) (isconf #q4) (isgrasp o10 #g0))
          :effect (isholdingmotion #q14 #t1345 #q4 o10 #g0)
   )
   (:action s1357_plan-holding-motion
          :parameters (#q14 #q4 o10 #g1)
          :precondition (and (isconf #q14) (isconf #q4) (isgrasp o10 #g1))
          :effect (isholdingmotion #q14 #t1346 #q4 o10 #g1)
   )
   (:action s1358_plan-holding-motion
          :parameters (#q14 #q4 o10 #g2)
          :precondition (and (isconf #q14) (isconf #q4) (isgrasp o10 #g2))
          :effect (isholdingmotion #q14 #t1347 #q4 o10 #g2)
   )
   (:action s1359_plan-holding-motion
          :parameters (#q14 #q4 o10 #g3)
          :precondition (and (isconf #q14) (isconf #q4) (isgrasp o10 #g3))
          :effect (isholdingmotion #q14 #t1348 #q4 o10 #g3)
   )
   (:action s1360_plan-holding-motion
          :parameters (#q14 #q5 o10 #g0)
          :precondition (and (isconf #q14) (isconf #q5) (isgrasp o10 #g0))
          :effect (isholdingmotion #q14 #t1349 #q5 o10 #g0)
   )
   (:action s1361_plan-holding-motion
          :parameters (#q14 #q5 o10 #g1)
          :precondition (and (isconf #q14) (isconf #q5) (isgrasp o10 #g1))
          :effect (isholdingmotion #q14 #t1350 #q5 o10 #g1)
   )
   (:action s1362_plan-holding-motion
          :parameters (#q14 #q5 o10 #g2)
          :precondition (and (isconf #q14) (isconf #q5) (isgrasp o10 #g2))
          :effect (isholdingmotion #q14 #t1351 #q5 o10 #g2)
   )
   (:action s1363_plan-holding-motion
          :parameters (#q14 #q5 o10 #g3)
          :precondition (and (isconf #q14) (isconf #q5) (isgrasp o10 #g3))
          :effect (isholdingmotion #q14 #t1352 #q5 o10 #g3)
   )
   (:action s1364_plan-holding-motion
          :parameters (#q14 #q6 o10 #g0)
          :precondition (and (isconf #q14) (isconf #q6) (isgrasp o10 #g0))
          :effect (isholdingmotion #q14 #t1353 #q6 o10 #g0)
   )
   (:action s1365_plan-holding-motion
          :parameters (#q14 #q6 o10 #g1)
          :precondition (and (isconf #q14) (isconf #q6) (isgrasp o10 #g1))
          :effect (isholdingmotion #q14 #t1354 #q6 o10 #g1)
   )
   (:action s1366_plan-holding-motion
          :parameters (#q14 #q6 o10 #g2)
          :precondition (and (isconf #q14) (isconf #q6) (isgrasp o10 #g2))
          :effect (isholdingmotion #q14 #t1355 #q6 o10 #g2)
   )
   (:action s1367_plan-holding-motion
          :parameters (#q14 #q6 o10 #g3)
          :precondition (and (isconf #q14) (isconf #q6) (isgrasp o10 #g3))
          :effect (isholdingmotion #q14 #t1356 #q6 o10 #g3)
   )
   (:action s1368_plan-holding-motion
          :parameters (#q14 #q7 o10 #g0)
          :precondition (and (isconf #q14) (isconf #q7) (isgrasp o10 #g0))
          :effect (isholdingmotion #q14 #t1357 #q7 o10 #g0)
   )
   (:action s1369_plan-holding-motion
          :parameters (#q14 #q7 o10 #g1)
          :precondition (and (isconf #q14) (isconf #q7) (isgrasp o10 #g1))
          :effect (isholdingmotion #q14 #t1358 #q7 o10 #g1)
   )
   (:action s1370_plan-holding-motion
          :parameters (#q14 #q7 o10 #g2)
          :precondition (and (isconf #q14) (isconf #q7) (isgrasp o10 #g2))
          :effect (isholdingmotion #q14 #t1359 #q7 o10 #g2)
   )
   (:action s1371_plan-holding-motion
          :parameters (#q14 #q7 o10 #g3)
          :precondition (and (isconf #q14) (isconf #q7) (isgrasp o10 #g3))
          :effect (isholdingmotion #q14 #t1360 #q7 o10 #g3)
   )
   (:action s1372_plan-holding-motion
          :parameters (#q14 #q8 o10 #g0)
          :precondition (and (isconf #q14) (isconf #q8) (isgrasp o10 #g0))
          :effect (isholdingmotion #q14 #t1361 #q8 o10 #g0)
   )
   (:action s1373_plan-holding-motion
          :parameters (#q14 #q8 o10 #g1)
          :precondition (and (isconf #q14) (isconf #q8) (isgrasp o10 #g1))
          :effect (isholdingmotion #q14 #t1362 #q8 o10 #g1)
   )
   (:action s1374_plan-holding-motion
          :parameters (#q14 #q8 o10 #g2)
          :precondition (and (isconf #q14) (isconf #q8) (isgrasp o10 #g2))
          :effect (isholdingmotion #q14 #t1363 #q8 o10 #g2)
   )
   (:action s1375_plan-holding-motion
          :parameters (#q14 #q8 o10 #g3)
          :precondition (and (isconf #q14) (isconf #q8) (isgrasp o10 #g3))
          :effect (isholdingmotion #q14 #t1364 #q8 o10 #g3)
   )
   (:action s1376_plan-holding-motion
          :parameters (#q14 #q9 o10 #g0)
          :precondition (and (isconf #q14) (isconf #q9) (isgrasp o10 #g0))
          :effect (isholdingmotion #q14 #t1365 #q9 o10 #g0)
   )
   (:action s1377_plan-holding-motion
          :parameters (#q14 #q9 o10 #g1)
          :precondition (and (isconf #q14) (isconf #q9) (isgrasp o10 #g1))
          :effect (isholdingmotion #q14 #t1366 #q9 o10 #g1)
   )
   (:action s1378_plan-holding-motion
          :parameters (#q14 #q9 o10 #g2)
          :precondition (and (isconf #q14) (isconf #q9) (isgrasp o10 #g2))
          :effect (isholdingmotion #q14 #t1367 #q9 o10 #g2)
   )
   (:action s1379_plan-holding-motion
          :parameters (#q14 #q9 o10 #g3)
          :precondition (and (isconf #q14) (isconf #q9) (isgrasp o10 #g3))
          :effect (isholdingmotion #q14 #t1368 #q9 o10 #g3)
   )
   (:action s1380_plan-holding-motion
          :parameters (#q14 #q10 o10 #g0)
          :precondition (and (isconf #q14) (isconf #q10) (isgrasp o10 #g0))
          :effect (isholdingmotion #q14 #t1369 #q10 o10 #g0)
   )
   (:action s1381_plan-holding-motion
          :parameters (#q14 #q10 o10 #g1)
          :precondition (and (isconf #q14) (isconf #q10) (isgrasp o10 #g1))
          :effect (isholdingmotion #q14 #t1370 #q10 o10 #g1)
   )
   (:action s1382_plan-holding-motion
          :parameters (#q14 #q10 o10 #g2)
          :precondition (and (isconf #q14) (isconf #q10) (isgrasp o10 #g2))
          :effect (isholdingmotion #q14 #t1371 #q10 o10 #g2)
   )
   (:action s1383_plan-holding-motion
          :parameters (#q14 #q10 o10 #g3)
          :precondition (and (isconf #q14) (isconf #q10) (isgrasp o10 #g3))
          :effect (isholdingmotion #q14 #t1372 #q10 o10 #g3)
   )
   (:action s1384_plan-holding-motion
          :parameters (#q14 #q11 o10 #g0)
          :precondition (and (isconf #q14) (isconf #q11) (isgrasp o10 #g0))
          :effect (isholdingmotion #q14 #t1373 #q11 o10 #g0)
   )
   (:action s1385_plan-holding-motion
          :parameters (#q14 #q11 o10 #g1)
          :precondition (and (isconf #q14) (isconf #q11) (isgrasp o10 #g1))
          :effect (isholdingmotion #q14 #t1374 #q11 o10 #g1)
   )
   (:action s1386_plan-holding-motion
          :parameters (#q14 #q11 o10 #g2)
          :precondition (and (isconf #q14) (isconf #q11) (isgrasp o10 #g2))
          :effect (isholdingmotion #q14 #t1375 #q11 o10 #g2)
   )
   (:action s1387_plan-holding-motion
          :parameters (#q14 #q11 o10 #g3)
          :precondition (and (isconf #q14) (isconf #q11) (isgrasp o10 #g3))
          :effect (isholdingmotion #q14 #t1376 #q11 o10 #g3)
   )
   (:action s1388_plan-holding-motion
          :parameters (#q14 #q12 o10 #g0)
          :precondition (and (isconf #q14) (isconf #q12) (isgrasp o10 #g0))
          :effect (isholdingmotion #q14 #t1377 #q12 o10 #g0)
   )
   (:action s1389_plan-holding-motion
          :parameters (#q14 #q12 o10 #g1)
          :precondition (and (isconf #q14) (isconf #q12) (isgrasp o10 #g1))
          :effect (isholdingmotion #q14 #t1378 #q12 o10 #g1)
   )
   (:action s1390_plan-holding-motion
          :parameters (#q14 #q12 o10 #g2)
          :precondition (and (isconf #q14) (isconf #q12) (isgrasp o10 #g2))
          :effect (isholdingmotion #q14 #t1379 #q12 o10 #g2)
   )
   (:action s1391_plan-holding-motion
          :parameters (#q14 #q12 o10 #g3)
          :precondition (and (isconf #q14) (isconf #q12) (isgrasp o10 #g3))
          :effect (isholdingmotion #q14 #t1380 #q12 o10 #g3)
   )
   (:action s1392_plan-holding-motion
          :parameters (#q14 #q13 o10 #g0)
          :precondition (and (isconf #q14) (isconf #q13) (isgrasp o10 #g0))
          :effect (isholdingmotion #q14 #t1381 #q13 o10 #g0)
   )
   (:action s1393_plan-holding-motion
          :parameters (#q14 #q13 o10 #g1)
          :precondition (and (isconf #q14) (isconf #q13) (isgrasp o10 #g1))
          :effect (isholdingmotion #q14 #t1382 #q13 o10 #g1)
   )
   (:action s1394_plan-holding-motion
          :parameters (#q14 #q13 o10 #g2)
          :precondition (and (isconf #q14) (isconf #q13) (isgrasp o10 #g2))
          :effect (isholdingmotion #q14 #t1383 #q13 o10 #g2)
   )
   (:action s1395_plan-holding-motion
          :parameters (#q14 #q13 o10 #g3)
          :precondition (and (isconf #q14) (isconf #q13) (isgrasp o10 #g3))
          :effect (isholdingmotion #q14 #t1384 #q13 o10 #g3)
   )
   (:action s1396_plan-holding-motion
          :parameters (#q14 #q14 o10 #g0)
          :precondition (and (isconf #q14) (isconf #q14) (isgrasp o10 #g0))
          :effect (isholdingmotion #q14 #t1385 #q14 o10 #g0)
   )
   (:action s1397_plan-holding-motion
          :parameters (#q14 #q14 o10 #g1)
          :precondition (and (isconf #q14) (isconf #q14) (isgrasp o10 #g1))
          :effect (isholdingmotion #q14 #t1386 #q14 o10 #g1)
   )
   (:action s1398_plan-holding-motion
          :parameters (#q14 #q14 o10 #g2)
          :precondition (and (isconf #q14) (isconf #q14) (isgrasp o10 #g2))
          :effect (isholdingmotion #q14 #t1387 #q14 o10 #g2)
   )
   (:action s1399_plan-holding-motion
          :parameters (#q14 #q14 o10 #g3)
          :precondition (and (isconf #q14) (isconf #q14) (isgrasp o10 #g3))
          :effect (isholdingmotion #q14 #t1388 #q14 o10 #g3)
   )
   (:action s1400_plan-holding-motion
          :parameters (#q14 #q15 o10 #g0)
          :precondition (and (isconf #q14) (isconf #q15) (isgrasp o10 #g0))
          :effect (isholdingmotion #q14 #t1389 #q15 o10 #g0)
   )
   (:action s1401_plan-holding-motion
          :parameters (#q14 #q15 o10 #g1)
          :precondition (and (isconf #q14) (isconf #q15) (isgrasp o10 #g1))
          :effect (isholdingmotion #q14 #t1390 #q15 o10 #g1)
   )
   (:action s1402_plan-holding-motion
          :parameters (#q14 #q15 o10 #g2)
          :precondition (and (isconf #q14) (isconf #q15) (isgrasp o10 #g2))
          :effect (isholdingmotion #q14 #t1391 #q15 o10 #g2)
   )
   (:action s1403_plan-holding-motion
          :parameters (#q14 #q15 o10 #g3)
          :precondition (and (isconf #q14) (isconf #q15) (isgrasp o10 #g3))
          :effect (isholdingmotion #q14 #t1392 #q15 o10 #g3)
   )
   (:action s1404_plan-holding-motion
          :parameters (#q15 q224 o10 #g0)
          :precondition (and (isconf #q15) (isconf q224) (isgrasp o10 #g0))
          :effect (isholdingmotion #q15 #t1393 q224 o10 #g0)
   )
   (:action s1405_plan-holding-motion
          :parameters (#q15 q224 o10 #g1)
          :precondition (and (isconf #q15) (isconf q224) (isgrasp o10 #g1))
          :effect (isholdingmotion #q15 #t1394 q224 o10 #g1)
   )
   (:action s1406_plan-holding-motion
          :parameters (#q15 q224 o10 #g2)
          :precondition (and (isconf #q15) (isconf q224) (isgrasp o10 #g2))
          :effect (isholdingmotion #q15 #t1395 q224 o10 #g2)
   )
   (:action s1407_plan-holding-motion
          :parameters (#q15 q224 o10 #g3)
          :precondition (and (isconf #q15) (isconf q224) (isgrasp o10 #g3))
          :effect (isholdingmotion #q15 #t1396 q224 o10 #g3)
   )
   (:action s1408_plan-holding-motion
          :parameters (#q15 #q0 o10 #g0)
          :precondition (and (isconf #q15) (isconf #q0) (isgrasp o10 #g0))
          :effect (isholdingmotion #q15 #t1397 #q0 o10 #g0)
   )
   (:action s1409_plan-holding-motion
          :parameters (#q15 #q0 o10 #g1)
          :precondition (and (isconf #q15) (isconf #q0) (isgrasp o10 #g1))
          :effect (isholdingmotion #q15 #t1398 #q0 o10 #g1)
   )
   (:action s1410_plan-holding-motion
          :parameters (#q15 #q0 o10 #g2)
          :precondition (and (isconf #q15) (isconf #q0) (isgrasp o10 #g2))
          :effect (isholdingmotion #q15 #t1399 #q0 o10 #g2)
   )
   (:action s1411_plan-holding-motion
          :parameters (#q15 #q0 o10 #g3)
          :precondition (and (isconf #q15) (isconf #q0) (isgrasp o10 #g3))
          :effect (isholdingmotion #q15 #t1400 #q0 o10 #g3)
   )
   (:action s1412_plan-holding-motion
          :parameters (#q15 #q1 o10 #g0)
          :precondition (and (isconf #q15) (isconf #q1) (isgrasp o10 #g0))
          :effect (isholdingmotion #q15 #t1401 #q1 o10 #g0)
   )
   (:action s1413_plan-holding-motion
          :parameters (#q15 #q1 o10 #g1)
          :precondition (and (isconf #q15) (isconf #q1) (isgrasp o10 #g1))
          :effect (isholdingmotion #q15 #t1402 #q1 o10 #g1)
   )
   (:action s1414_plan-holding-motion
          :parameters (#q15 #q1 o10 #g2)
          :precondition (and (isconf #q15) (isconf #q1) (isgrasp o10 #g2))
          :effect (isholdingmotion #q15 #t1403 #q1 o10 #g2)
   )
   (:action s1415_plan-holding-motion
          :parameters (#q15 #q1 o10 #g3)
          :precondition (and (isconf #q15) (isconf #q1) (isgrasp o10 #g3))
          :effect (isholdingmotion #q15 #t1404 #q1 o10 #g3)
   )
   (:action s1416_plan-holding-motion
          :parameters (#q15 #q2 o10 #g0)
          :precondition (and (isconf #q15) (isconf #q2) (isgrasp o10 #g0))
          :effect (isholdingmotion #q15 #t1405 #q2 o10 #g0)
   )
   (:action s1417_plan-holding-motion
          :parameters (#q15 #q2 o10 #g1)
          :precondition (and (isconf #q15) (isconf #q2) (isgrasp o10 #g1))
          :effect (isholdingmotion #q15 #t1406 #q2 o10 #g1)
   )
   (:action s1418_plan-holding-motion
          :parameters (#q15 #q2 o10 #g2)
          :precondition (and (isconf #q15) (isconf #q2) (isgrasp o10 #g2))
          :effect (isholdingmotion #q15 #t1407 #q2 o10 #g2)
   )
   (:action s1419_plan-holding-motion
          :parameters (#q15 #q2 o10 #g3)
          :precondition (and (isconf #q15) (isconf #q2) (isgrasp o10 #g3))
          :effect (isholdingmotion #q15 #t1408 #q2 o10 #g3)
   )
   (:action s1420_plan-holding-motion
          :parameters (#q15 #q3 o10 #g0)
          :precondition (and (isconf #q15) (isconf #q3) (isgrasp o10 #g0))
          :effect (isholdingmotion #q15 #t1409 #q3 o10 #g0)
   )
   (:action s1421_plan-holding-motion
          :parameters (#q15 #q3 o10 #g1)
          :precondition (and (isconf #q15) (isconf #q3) (isgrasp o10 #g1))
          :effect (isholdingmotion #q15 #t1410 #q3 o10 #g1)
   )
   (:action s1422_plan-holding-motion
          :parameters (#q15 #q3 o10 #g2)
          :precondition (and (isconf #q15) (isconf #q3) (isgrasp o10 #g2))
          :effect (isholdingmotion #q15 #t1411 #q3 o10 #g2)
   )
   (:action s1423_plan-holding-motion
          :parameters (#q15 #q3 o10 #g3)
          :precondition (and (isconf #q15) (isconf #q3) (isgrasp o10 #g3))
          :effect (isholdingmotion #q15 #t1412 #q3 o10 #g3)
   )
   (:action s1424_plan-holding-motion
          :parameters (#q15 #q4 o10 #g0)
          :precondition (and (isconf #q15) (isconf #q4) (isgrasp o10 #g0))
          :effect (isholdingmotion #q15 #t1413 #q4 o10 #g0)
   )
   (:action s1425_plan-holding-motion
          :parameters (#q15 #q4 o10 #g1)
          :precondition (and (isconf #q15) (isconf #q4) (isgrasp o10 #g1))
          :effect (isholdingmotion #q15 #t1414 #q4 o10 #g1)
   )
   (:action s1426_plan-holding-motion
          :parameters (#q15 #q4 o10 #g2)
          :precondition (and (isconf #q15) (isconf #q4) (isgrasp o10 #g2))
          :effect (isholdingmotion #q15 #t1415 #q4 o10 #g2)
   )
   (:action s1427_plan-holding-motion
          :parameters (#q15 #q4 o10 #g3)
          :precondition (and (isconf #q15) (isconf #q4) (isgrasp o10 #g3))
          :effect (isholdingmotion #q15 #t1416 #q4 o10 #g3)
   )
   (:action s1428_plan-holding-motion
          :parameters (#q15 #q5 o10 #g0)
          :precondition (and (isconf #q15) (isconf #q5) (isgrasp o10 #g0))
          :effect (isholdingmotion #q15 #t1417 #q5 o10 #g0)
   )
   (:action s1429_plan-holding-motion
          :parameters (#q15 #q5 o10 #g1)
          :precondition (and (isconf #q15) (isconf #q5) (isgrasp o10 #g1))
          :effect (isholdingmotion #q15 #t1418 #q5 o10 #g1)
   )
   (:action s1430_plan-holding-motion
          :parameters (#q15 #q5 o10 #g2)
          :precondition (and (isconf #q15) (isconf #q5) (isgrasp o10 #g2))
          :effect (isholdingmotion #q15 #t1419 #q5 o10 #g2)
   )
   (:action s1431_plan-holding-motion
          :parameters (#q15 #q5 o10 #g3)
          :precondition (and (isconf #q15) (isconf #q5) (isgrasp o10 #g3))
          :effect (isholdingmotion #q15 #t1420 #q5 o10 #g3)
   )
   (:action s1432_plan-holding-motion
          :parameters (#q15 #q6 o10 #g0)
          :precondition (and (isconf #q15) (isconf #q6) (isgrasp o10 #g0))
          :effect (isholdingmotion #q15 #t1421 #q6 o10 #g0)
   )
   (:action s1433_plan-holding-motion
          :parameters (#q15 #q6 o10 #g1)
          :precondition (and (isconf #q15) (isconf #q6) (isgrasp o10 #g1))
          :effect (isholdingmotion #q15 #t1422 #q6 o10 #g1)
   )
   (:action s1434_plan-holding-motion
          :parameters (#q15 #q6 o10 #g2)
          :precondition (and (isconf #q15) (isconf #q6) (isgrasp o10 #g2))
          :effect (isholdingmotion #q15 #t1423 #q6 o10 #g2)
   )
   (:action s1435_plan-holding-motion
          :parameters (#q15 #q6 o10 #g3)
          :precondition (and (isconf #q15) (isconf #q6) (isgrasp o10 #g3))
          :effect (isholdingmotion #q15 #t1424 #q6 o10 #g3)
   )
   (:action s1436_plan-holding-motion
          :parameters (#q15 #q7 o10 #g0)
          :precondition (and (isconf #q15) (isconf #q7) (isgrasp o10 #g0))
          :effect (isholdingmotion #q15 #t1425 #q7 o10 #g0)
   )
   (:action s1437_plan-holding-motion
          :parameters (#q15 #q7 o10 #g1)
          :precondition (and (isconf #q15) (isconf #q7) (isgrasp o10 #g1))
          :effect (isholdingmotion #q15 #t1426 #q7 o10 #g1)
   )
   (:action s1438_plan-holding-motion
          :parameters (#q15 #q7 o10 #g2)
          :precondition (and (isconf #q15) (isconf #q7) (isgrasp o10 #g2))
          :effect (isholdingmotion #q15 #t1427 #q7 o10 #g2)
   )
   (:action s1439_plan-holding-motion
          :parameters (#q15 #q7 o10 #g3)
          :precondition (and (isconf #q15) (isconf #q7) (isgrasp o10 #g3))
          :effect (isholdingmotion #q15 #t1428 #q7 o10 #g3)
   )
   (:action s1440_plan-holding-motion
          :parameters (#q15 #q8 o10 #g0)
          :precondition (and (isconf #q15) (isconf #q8) (isgrasp o10 #g0))
          :effect (isholdingmotion #q15 #t1429 #q8 o10 #g0)
   )
   (:action s1441_plan-holding-motion
          :parameters (#q15 #q8 o10 #g1)
          :precondition (and (isconf #q15) (isconf #q8) (isgrasp o10 #g1))
          :effect (isholdingmotion #q15 #t1430 #q8 o10 #g1)
   )
   (:action s1442_plan-holding-motion
          :parameters (#q15 #q8 o10 #g2)
          :precondition (and (isconf #q15) (isconf #q8) (isgrasp o10 #g2))
          :effect (isholdingmotion #q15 #t1431 #q8 o10 #g2)
   )
   (:action s1443_plan-holding-motion
          :parameters (#q15 #q8 o10 #g3)
          :precondition (and (isconf #q15) (isconf #q8) (isgrasp o10 #g3))
          :effect (isholdingmotion #q15 #t1432 #q8 o10 #g3)
   )
   (:action s1444_plan-holding-motion
          :parameters (#q15 #q9 o10 #g0)
          :precondition (and (isconf #q15) (isconf #q9) (isgrasp o10 #g0))
          :effect (isholdingmotion #q15 #t1433 #q9 o10 #g0)
   )
   (:action s1445_plan-holding-motion
          :parameters (#q15 #q9 o10 #g1)
          :precondition (and (isconf #q15) (isconf #q9) (isgrasp o10 #g1))
          :effect (isholdingmotion #q15 #t1434 #q9 o10 #g1)
   )
   (:action s1446_plan-holding-motion
          :parameters (#q15 #q9 o10 #g2)
          :precondition (and (isconf #q15) (isconf #q9) (isgrasp o10 #g2))
          :effect (isholdingmotion #q15 #t1435 #q9 o10 #g2)
   )
   (:action s1447_plan-holding-motion
          :parameters (#q15 #q9 o10 #g3)
          :precondition (and (isconf #q15) (isconf #q9) (isgrasp o10 #g3))
          :effect (isholdingmotion #q15 #t1436 #q9 o10 #g3)
   )
   (:action s1448_plan-holding-motion
          :parameters (#q15 #q10 o10 #g0)
          :precondition (and (isconf #q15) (isconf #q10) (isgrasp o10 #g0))
          :effect (isholdingmotion #q15 #t1437 #q10 o10 #g0)
   )
   (:action s1449_plan-holding-motion
          :parameters (#q15 #q10 o10 #g1)
          :precondition (and (isconf #q15) (isconf #q10) (isgrasp o10 #g1))
          :effect (isholdingmotion #q15 #t1438 #q10 o10 #g1)
   )
   (:action s1450_plan-holding-motion
          :parameters (#q15 #q10 o10 #g2)
          :precondition (and (isconf #q15) (isconf #q10) (isgrasp o10 #g2))
          :effect (isholdingmotion #q15 #t1439 #q10 o10 #g2)
   )
   (:action s1451_plan-holding-motion
          :parameters (#q15 #q10 o10 #g3)
          :precondition (and (isconf #q15) (isconf #q10) (isgrasp o10 #g3))
          :effect (isholdingmotion #q15 #t1440 #q10 o10 #g3)
   )
   (:action s1452_plan-holding-motion
          :parameters (#q15 #q11 o10 #g0)
          :precondition (and (isconf #q15) (isconf #q11) (isgrasp o10 #g0))
          :effect (isholdingmotion #q15 #t1441 #q11 o10 #g0)
   )
   (:action s1453_plan-holding-motion
          :parameters (#q15 #q11 o10 #g1)
          :precondition (and (isconf #q15) (isconf #q11) (isgrasp o10 #g1))
          :effect (isholdingmotion #q15 #t1442 #q11 o10 #g1)
   )
   (:action s1454_plan-holding-motion
          :parameters (#q15 #q11 o10 #g2)
          :precondition (and (isconf #q15) (isconf #q11) (isgrasp o10 #g2))
          :effect (isholdingmotion #q15 #t1443 #q11 o10 #g2)
   )
   (:action s1455_plan-holding-motion
          :parameters (#q15 #q11 o10 #g3)
          :precondition (and (isconf #q15) (isconf #q11) (isgrasp o10 #g3))
          :effect (isholdingmotion #q15 #t1444 #q11 o10 #g3)
   )
   (:action s1456_plan-holding-motion
          :parameters (#q15 #q12 o10 #g0)
          :precondition (and (isconf #q15) (isconf #q12) (isgrasp o10 #g0))
          :effect (isholdingmotion #q15 #t1445 #q12 o10 #g0)
   )
   (:action s1457_plan-holding-motion
          :parameters (#q15 #q12 o10 #g1)
          :precondition (and (isconf #q15) (isconf #q12) (isgrasp o10 #g1))
          :effect (isholdingmotion #q15 #t1446 #q12 o10 #g1)
   )
   (:action s1458_plan-holding-motion
          :parameters (#q15 #q12 o10 #g2)
          :precondition (and (isconf #q15) (isconf #q12) (isgrasp o10 #g2))
          :effect (isholdingmotion #q15 #t1447 #q12 o10 #g2)
   )
   (:action s1459_plan-holding-motion
          :parameters (#q15 #q12 o10 #g3)
          :precondition (and (isconf #q15) (isconf #q12) (isgrasp o10 #g3))
          :effect (isholdingmotion #q15 #t1448 #q12 o10 #g3)
   )
   (:action s1460_plan-holding-motion
          :parameters (#q15 #q13 o10 #g0)
          :precondition (and (isconf #q15) (isconf #q13) (isgrasp o10 #g0))
          :effect (isholdingmotion #q15 #t1449 #q13 o10 #g0)
   )
   (:action s1461_plan-holding-motion
          :parameters (#q15 #q13 o10 #g1)
          :precondition (and (isconf #q15) (isconf #q13) (isgrasp o10 #g1))
          :effect (isholdingmotion #q15 #t1450 #q13 o10 #g1)
   )
   (:action s1462_plan-holding-motion
          :parameters (#q15 #q13 o10 #g2)
          :precondition (and (isconf #q15) (isconf #q13) (isgrasp o10 #g2))
          :effect (isholdingmotion #q15 #t1451 #q13 o10 #g2)
   )
   (:action s1463_plan-holding-motion
          :parameters (#q15 #q13 o10 #g3)
          :precondition (and (isconf #q15) (isconf #q13) (isgrasp o10 #g3))
          :effect (isholdingmotion #q15 #t1452 #q13 o10 #g3)
   )
   (:action s1464_plan-holding-motion
          :parameters (#q15 #q14 o10 #g0)
          :precondition (and (isconf #q15) (isconf #q14) (isgrasp o10 #g0))
          :effect (isholdingmotion #q15 #t1453 #q14 o10 #g0)
   )
   (:action s1465_plan-holding-motion
          :parameters (#q15 #q14 o10 #g1)
          :precondition (and (isconf #q15) (isconf #q14) (isgrasp o10 #g1))
          :effect (isholdingmotion #q15 #t1454 #q14 o10 #g1)
   )
   (:action s1466_plan-holding-motion
          :parameters (#q15 #q14 o10 #g2)
          :precondition (and (isconf #q15) (isconf #q14) (isgrasp o10 #g2))
          :effect (isholdingmotion #q15 #t1455 #q14 o10 #g2)
   )
   (:action s1467_plan-holding-motion
          :parameters (#q15 #q14 o10 #g3)
          :precondition (and (isconf #q15) (isconf #q14) (isgrasp o10 #g3))
          :effect (isholdingmotion #q15 #t1456 #q14 o10 #g3)
   )
   (:action s1468_plan-holding-motion
          :parameters (#q15 #q15 o10 #g0)
          :precondition (and (isconf #q15) (isconf #q15) (isgrasp o10 #g0))
          :effect (isholdingmotion #q15 #t1457 #q15 o10 #g0)
   )
   (:action s1469_plan-holding-motion
          :parameters (#q15 #q15 o10 #g1)
          :precondition (and (isconf #q15) (isconf #q15) (isgrasp o10 #g1))
          :effect (isholdingmotion #q15 #t1458 #q15 o10 #g1)
   )
   (:action s1470_plan-holding-motion
          :parameters (#q15 #q15 o10 #g2)
          :precondition (and (isconf #q15) (isconf #q15) (isgrasp o10 #g2))
          :effect (isholdingmotion #q15 #t1459 #q15 o10 #g2)
   )
   (:action s1471_plan-holding-motion
          :parameters (#q15 #q15 o10 #g3)
          :precondition (and (isconf #q15) (isconf #q15) (isgrasp o10 #g3))
          :effect (isholdingmotion #q15 #t1460 #q15 o10 #g3)
   )
)
