;16:02:20 19/08

;Skeleton_SN = 0

(define (domain pick-and-place_propo_reorder)
   (:requirements :strips :equality :action-costs)

   (:types
          wuti grasp_dir grasp config pose trajectory propo_action propo_stream
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
          (_unused ?_s - propo_stream)
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
          :parameters (o10 p720 o9)
          :precondition (and (graspable o10) (allowlocate) (issensor o9) (canmove) (_applicable _p0))
          :effect (and (located o10 p720) (not (allowlocate)) (increase (total-cost) 50) (not (_applicable _p0)) (when (and (not (_unused _s0)) (not (_unused _s3)) (not (_unused _s8)) (not (_unused _s12)) (not (_unused _s13)) (not (_unused _s29)) (not (_unused _s38)) (not (_unused _s80))) (_applicable _p1)) (when (and (not (_unused _s0)) (not (_unused _s3)) (not (_unused _s8)) (not (_unused _s12)) (not (_unused _s13)) (not (_unused _s29)) (not (_unused _s38)) (not (_unused _s80))) (_applicable _p1)))
   )
   (:action a1_move_free
          :parameters (q112 #q0 #t18)
          :precondition (and (isfreemotion q112 #t18 #q0) (atconf q112) (handempty) (canmove) (_applicable _p1))
          :effect (and (atconf #q0) (not (atconf q112)) (not (canmove)) (canpick) (increase (total-cost) 100) (not (_applicable _p1)) (not (_unused _s29)) (not (_unused _s12)) (when (and (not (_unused _s0)) (not (_unused _s3)) (not (_unused _s8)) (not (_unused _s13)) (not (_unused _s38)) (not (_unused _s80))) (_applicable _p2)) (not (_unused _s29)) (not (_unused _s12)) (when (and (not (_unused _s0)) (not (_unused _s3)) (not (_unused _s8)) (not (_unused _s13)) (not (_unused _s38)) (not (_unused _s80))) (_applicable _p2)))
   )
   (:action a2_pick
          :parameters (o10 p720 #g0 #q0 #t1)
          :precondition (and (iskin o10 p720 #g0 #q0 #t1) (atpose o10 p720) (handempty) (atconf #q0) (canpick) (located o10 p720) (not (usedgrasp o10 p720 #g0)) (graspatpose #g0 p720) (_applicable _p2))
          :effect (and (atgrasp o10 #g0) (canmove) (not (atpose o10 p720)) (not (handempty)) (increase (total-cost) 100) (not (_applicable _p2)) (not (_unused _s8)) (not (_unused _s12)) (when (and (not (_unused _s0)) (not (_unused _s3)) (not (_unused _s13)) (not (_unused _s29)) (not (_unused _s38)) (not (_unused _s80))) (_applicable _p3)) (not (_unused _s8)) (not (_unused _s12)) (when (and (not (_unused _s0)) (not (_unused _s3)) (not (_unused _s13)) (not (_unused _s29)) (not (_unused _s38)) (not (_unused _s80))) (_applicable _p3)))
   )
   (:action a3_move_holding
          :parameters (#q0 #q1 o10 #g0 #t69)
          :precondition (and (isholdingmotion #q0 #t69 #q1 o10 #g0) (atconf #q0) (atgrasp o10 #g0) (canmove) (_applicable _p3))
          :effect (and (atconf #q1) (not (atconf #q0)) (not (canmove)) (canpick) (canplace) (increase (total-cost) 100) (not (_applicable _p3)) (not (_unused _s8)) (not (_unused _s13)) (not (_unused _s80)) (not (_unused _s12)) (when (and (not (_unused _s0)) (not (_unused _s3)) (not (_unused _s29)) (not (_unused _s38))) (_applicable _p4)) (not (_unused _s8)) (not (_unused _s13)) (not (_unused _s80)) (not (_unused _s12)) (when (and (not (_unused _s0)) (not (_unused _s3)) (not (_unused _s29)) (not (_unused _s38))) (_applicable _p4)))
   )
   (:action a4_place
          :parameters (o10 #p0 o6 #g0 #q1 #t2)
          :precondition (and (iskin o10 #p0 #g0 #q1 #t2) (issupport o10 #p0 o6) (atgrasp o10 #g0) (atconf #q1) (graspable o10) (fixed o6) (canplace) (_applicable _p4))
          :effect (and (atpose o10 #p0) (handempty) (canmove) (not (atgrasp o10 #g0)) (not (canpick)) (not (canplace)) (increase (total-cost) 100) (allowlocate) (not (located o10 #p0)) (usedgrasp o10 #p0 #g0) (not (_applicable _p4)) (not (_unused _s8)) (not (_unused _s0)) (not (_unused _s13)) (when (and (not (_unused _s3)) (not (_unused _s12)) (not (_unused _s29)) (not (_unused _s38)) (not (_unused _s80))) (_applicable _p5)) (not (_unused _s8)) (not (_unused _s0)) (not (_unused _s13)) (when (and (not (_unused _s3)) (not (_unused _s12)) (not (_unused _s29)) (not (_unused _s38)) (not (_unused _s80))) (_applicable _p5)))
   )
   (:action a5_move_free
          :parameters (#q1 q112 #t27)
          :precondition (and (isfreemotion #q1 #t27 q112) (atconf #q1) (handempty) (canmove) (_applicable _p5))
          :effect (and (atconf q112) (not (atconf #q1)) (not (canmove)) (canpick) (increase (total-cost) 100) (not (_applicable _p5)) (not (_unused _s13)) (not (_unused _s38)) (when (and (not (_unused _s0)) (not (_unused _s3)) (not (_unused _s8)) (not (_unused _s12)) (not (_unused _s29)) (not (_unused _s80))) (_applicable _p6)) (not (_unused _s13)) (not (_unused _s38)) (when (and (not (_unused _s0)) (not (_unused _s3)) (not (_unused _s8)) (not (_unused _s12)) (not (_unused _s29)) (not (_unused _s80))) (_applicable _p6)))
   )
   (:action s0_sample-place
          :parameters (o10 o6)
          :precondition (stackable o10 o6)
          :effect (and (ispose o10 #p0) (issupport o10 #p0 o6) (_unused _s0))
   )
   (:action s3_sample-grasp-dir
          :parameters (o10 p720)
          :precondition (and (graspable o10) (ispose o10 p720))
          :effect (and (isgraspdir o10 p720 #d0) (_unused _s3))
   )
   (:action s8_sample-grasp
          :parameters (o10 p720 #d0)
          :precondition (isgraspdir o10 p720 #d0)
          :effect (and (graspatpose #g0 p720) (isgrasp o10 #g0) (not (_unused _s3)) (_unused _s8))
   )
   (:action s12_inverse-kinematics
          :parameters (o10 p720 #g0)
          :precondition (and (ispose o10 p720) (isgrasp o10 #g0))
          :effect (and (isconf #q0) (istraj #t1) (iskin o10 p720 #g0 #q0 #t1) (not (_unused _s8)) (_unused _s12))
   )
   (:action s13_inverse-kinematics
          :parameters (o10 #p0 #g0)
          :precondition (and (ispose o10 #p0) (isgrasp o10 #g0))
          :effect (and (isconf #q1) (istraj #t2) (iskin o10 #p0 #g0 #q1 #t2) (not (_unused _s8)) (not (_unused _s0)) (_unused _s13))
   )
   (:action s29_plan-free-motion
          :parameters (q112 #q0)
          :precondition (and (isconf q112) (isconf #q0))
          :effect (and (isfreemotion q112 #t18 #q0) (not (_unused _s12)) (_unused _s29))
   )
   (:action s38_plan-free-motion
          :parameters (#q1 q112)
          :precondition (and (isconf #q1) (isconf q112))
          :effect (and (isfreemotion #q1 #t27 q112) (not (_unused _s13)) (_unused _s38))
   )
   (:action s80_plan-holding-motion
          :parameters (#q0 #q1 o10 #g0)
          :precondition (and (isconf #q0) (isconf #q1) (isgrasp o10 #g0))
          :effect (and (isholdingmotion #q0 #t69 #q1 o10 #g0) (not (_unused _s8)) (not (_unused _s13)) (not (_unused _s12)) (_unused _s80))
   )
)
