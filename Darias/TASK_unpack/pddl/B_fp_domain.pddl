;14:12:24 13/09

;Skeleton_SN = 1

(define (domain pick-and-place_propo)
   (:requirements :strips :equality :action-costs)

   (:types
          wuti grasp_dir grasp config pose trajectory propo_action
   )

   (:constants
          #p0 #p1 #p2 #p3 - pose
          #d0 #d1 #d2 #d3 #d4 #d5 - grasp_dir
          #t0 #t1 #t10 #t100 #t1000 #t1001 #t1002 #t1003 #t1004 #t1005 #t1006 #t1007 #t1008 #t1009 #t101 #t1010 #t1011 #t1012 #t1013 #t1014 #t1015 #t1016 #t1017 #t1018 #t1019 #t102 #t1020 #t1021 #t1022 #t1023 #t1024 #t1025 #t1026 #t1027 #t1028 #t1029 #t103 #t1030 #t1031 #t1032 #t1033 #t1034 #t1035 #t1036 #t1037 #t1038 #t1039 #t104 #t1040 #t1041 #t1042 #t1043 #t1044 #t1045 #t1046 #t1047 #t1048 #t1049 #t105 #t1050 #t1051 #t1052 #t1053 #t1054 #t1055 #t1056 #t1057 #t1058 #t1059 #t106 #t1060 #t1061 #t1062 #t1063 #t1064 #t1065 #t1066 #t1067 #t1068 #t1069 #t107 #t1070 #t1071 #t1072 #t1073 #t1074 #t1075 #t1076 #t1077 #t1078 #t1079 #t108 #t1080 #t1081 #t1082 #t1083 #t1084 #t1085 #t1086 #t1087 #t1088 #t1089 #t109 #t1090 #t1091 #t1092 #t1093 #t1094 #t1095 #t1096 #t1097 #t1098 #t1099 #t11 #t110 #t1100 #t1101 #t1102 #t1103 #t1104 #t1105 #t1106 #t1107 #t1108 #t1109 #t111 #t1110 #t1111 #t1112 #t1113 #t1114 #t1115 #t1116 #t1117 #t1118 #t1119 #t112 #t1120 #t1121 #t1122 #t1123 #t1124 #t1125 #t1126 #t1127 #t1128 #t1129 #t113 #t1130 #t1131 #t1132 #t1133 #t1134 #t1135 #t1136 #t1137 #t1138 #t1139 #t114 #t1140 #t1141 #t1142 #t1143 #t1144 #t1145 #t1146 #t1147 #t1148 #t1149 #t115 #t1150 #t1151 #t1152 #t1153 #t1154 #t1155 #t1156 #t1157 #t1158 #t1159 #t116 #t1160 #t1161 #t1162 #t1163 #t1164 #t1165 #t1166 #t1167 #t1168 #t1169 #t117 #t1170 #t1171 #t1172 #t1173 #t1174 #t1175 #t1176 #t1177 #t1178 #t1179 #t118 #t1180 #t1181 #t1182 #t1183 #t1184 #t1185 #t1186 #t1187 #t1188 #t1189 #t119 #t1190 #t1191 #t1192 #t1193 #t1194 #t1195 #t1196 #t1197 #t1198 #t1199 #t12 #t120 #t1200 #t1201 #t1202 #t1203 #t1204 #t1205 #t1206 #t1207 #t1208 #t1209 #t121 #t1210 #t1211 #t1212 #t1213 #t1214 #t1215 #t1216 #t1217 #t1218 #t1219 #t122 #t1220 #t1221 #t1222 #t1223 #t1224 #t1225 #t1226 #t1227 #t1228 #t1229 #t123 #t1230 #t1231 #t1232 #t1233 #t1234 #t1235 #t1236 #t1237 #t1238 #t1239 #t124 #t1240 #t1241 #t1242 #t1243 #t1244 #t1245 #t1246 #t1247 #t1248 #t1249 #t125 #t1250 #t1251 #t1252 #t1253 #t1254 #t1255 #t1256 #t1257 #t1258 #t1259 #t126 #t1260 #t1261 #t1262 #t1263 #t1264 #t1265 #t1266 #t1267 #t1268 #t1269 #t127 #t1270 #t1271 #t1272 #t1273 #t1274 #t1275 #t1276 #t1277 #t1278 #t1279 #t128 #t1280 #t1281 #t1282 #t1283 #t1284 #t1285 #t1286 #t1287 #t1288 #t1289 #t129 #t1290 #t1291 #t1292 #t1293 #t1294 #t1295 #t1296 #t1297 #t1298 #t1299 #t13 #t130 #t1300 #t1301 #t1302 #t1303 #t1304 #t1305 #t1306 #t1307 #t1308 #t1309 #t131 #t1310 #t1311 #t1312 #t1313 #t1314 #t1315 #t1316 #t1317 #t1318 #t1319 #t132 #t1320 #t1321 #t1322 #t1323 #t1324 #t1325 #t1326 #t1327 #t1328 #t1329 #t133 #t1330 #t1331 #t1332 #t1333 #t1334 #t1335 #t1336 #t1337 #t1338 #t1339 #t134 #t1340 #t1341 #t1342 #t1343 #t1344 #t1345 #t1346 #t1347 #t1348 #t1349 #t135 #t1350 #t1351 #t1352 #t1353 #t1354 #t1355 #t1356 #t1357 #t1358 #t1359 #t136 #t1360 #t1361 #t1362 #t1363 #t1364 #t1365 #t1366 #t1367 #t1368 #t1369 #t137 #t1370 #t1371 #t1372 #t1373 #t1374 #t1375 #t1376 #t1377 #t1378 #t1379 #t138 #t1380 #t1381 #t1382 #t1383 #t1384 #t1385 #t1386 #t1387 #t1388 #t1389 #t139 #t1390 #t1391 #t1392 #t1393 #t1394 #t1395 #t1396 #t1397 #t1398 #t1399 #t14 #t140 #t1400 #t1401 #t1402 #t1403 #t1404 #t1405 #t1406 #t1407 #t1408 #t1409 #t141 #t1410 #t1411 #t1412 #t1413 #t1414 #t1415 #t1416 #t1417 #t1418 #t1419 #t142 #t1420 #t1421 #t1422 #t1423 #t1424 #t1425 #t1426 #t1427 #t1428 #t1429 #t143 #t1430 #t1431 #t1432 #t1433 #t1434 #t1435 #t1436 #t1437 #t1438 #t1439 #t144 #t1440 #t1441 #t1442 #t1443 #t1444 #t1445 #t1446 #t1447 #t1448 #t1449 #t145 #t1450 #t1451 #t1452 #t1453 #t1454 #t1455 #t1456 #t1457 #t1458 #t1459 #t146 #t1460 #t1461 #t1462 #t1463 #t1464 #t1465 #t1466 #t1467 #t1468 #t1469 #t147 #t1470 #t1471 #t1472 #t1473 #t1474 #t1475 #t1476 #t1477 #t1478 #t1479 #t148 #t1480 #t1481 #t1482 #t1483 #t1484 #t1485 #t1486 #t1487 #t1488 #t1489 #t149 #t1490 #t1491 #t1492 #t1493 #t1494 #t1495 #t1496 #t1497 #t1498 #t1499 #t15 #t150 #t1500 #t1501 #t1502 #t1503 #t1504 #t1505 #t1506 #t1507 #t1508 #t1509 #t151 #t1510 #t1511 #t1512 #t1513 #t1514 #t1515 #t1516 #t1517 #t1518 #t1519 #t152 #t1520 #t1521 #t1522 #t1523 #t1524 #t1525 #t1526 #t1527 #t1528 #t1529 #t153 #t1530 #t1531 #t1532 #t1533 #t1534 #t1535 #t1536 #t1537 #t1538 #t1539 #t154 #t1540 #t1541 #t1542 #t1543 #t1544 #t1545 #t1546 #t1547 #t1548 #t1549 #t155 #t1550 #t1551 #t1552 #t1553 #t1554 #t1555 #t1556 #t1557 #t1558 #t1559 #t156 #t1560 #t1561 #t1562 #t1563 #t1564 #t1565 #t1566 #t1567 #t1568 #t1569 #t157 #t1570 #t1571 #t1572 #t1573 #t1574 #t1575 #t1576 #t1577 #t1578 #t1579 #t158 #t1580 #t1581 #t1582 #t1583 #t1584 #t1585 #t1586 #t1587 #t1588 #t1589 #t159 #t1590 #t1591 #t1592 #t1593 #t1594 #t1595 #t1596 #t1597 #t1598 #t1599 #t16 #t160 #t1600 #t1601 #t1602 #t1603 #t1604 #t1605 #t1606 #t1607 #t1608 #t1609 #t161 #t1610 #t1611 #t1612 #t1613 #t1614 #t1615 #t1616 #t1617 #t1618 #t1619 #t162 #t1620 #t1621 #t1622 #t1623 #t1624 #t1625 #t1626 #t1627 #t1628 #t1629 #t163 #t1630 #t1631 #t1632 #t1633 #t1634 #t1635 #t1636 #t1637 #t1638 #t1639 #t164 #t1640 #t1641 #t1642 #t1643 #t1644 #t1645 #t1646 #t1647 #t1648 #t1649 #t165 #t1650 #t1651 #t1652 #t1653 #t1654 #t1655 #t1656 #t1657 #t1658 #t1659 #t166 #t1660 #t1661 #t1662 #t1663 #t1664 #t1665 #t1666 #t1667 #t1668 #t1669 #t167 #t1670 #t1671 #t1672 #t1673 #t1674 #t1675 #t1676 #t1677 #t1678 #t1679 #t168 #t1680 #t1681 #t1682 #t1683 #t1684 #t1685 #t1686 #t1687 #t1688 #t1689 #t169 #t1690 #t1691 #t1692 #t1693 #t1694 #t1695 #t1696 #t1697 #t1698 #t1699 #t17 #t170 #t1700 #t1701 #t1702 #t1703 #t1704 #t1705 #t1706 #t1707 #t1708 #t1709 #t171 #t1710 #t1711 #t1712 #t1713 #t1714 #t1715 #t1716 #t1717 #t1718 #t1719 #t172 #t1720 #t1721 #t1722 #t1723 #t1724 #t1725 #t1726 #t1727 #t1728 #t1729 #t173 #t1730 #t1731 #t1732 #t1733 #t1734 #t1735 #t1736 #t1737 #t1738 #t1739 #t174 #t1740 #t1741 #t1742 #t1743 #t1744 #t1745 #t1746 #t1747 #t1748 #t1749 #t175 #t1750 #t1751 #t1752 #t1753 #t1754 #t1755 #t1756 #t1757 #t1758 #t1759 #t176 #t1760 #t1761 #t1762 #t1763 #t1764 #t1765 #t1766 #t1767 #t1768 #t1769 #t177 #t1770 #t1771 #t1772 #t1773 #t1774 #t1775 #t1776 #t1777 #t1778 #t1779 #t178 #t1780 #t1781 #t1782 #t1783 #t1784 #t1785 #t1786 #t1787 #t1788 #t1789 #t179 #t1790 #t1791 #t1792 #t1793 #t1794 #t1795 #t1796 #t1797 #t1798 #t1799 #t18 #t180 #t1800 #t1801 #t1802 #t1803 #t1804 #t1805 #t1806 #t1807 #t1808 #t1809 #t181 #t1810 #t1811 #t1812 #t1813 #t1814 #t1815 #t1816 #t1817 #t1818 #t1819 #t182 #t1820 #t1821 #t1822 #t1823 #t1824 #t1825 #t1826 #t1827 #t1828 #t1829 #t183 #t1830 #t1831 #t1832 #t1833 #t1834 #t1835 #t1836 #t1837 #t1838 #t1839 #t184 #t1840 #t1841 #t1842 #t1843 #t1844 #t1845 #t1846 #t1847 #t1848 #t1849 #t185 #t1850 #t1851 #t1852 #t1853 #t1854 #t1855 #t1856 #t1857 #t1858 #t1859 #t186 #t1860 #t1861 #t1862 #t1863 #t1864 #t1865 #t1866 #t1867 #t1868 #t1869 #t187 #t1870 #t1871 #t1872 #t1873 #t1874 #t1875 #t1876 #t1877 #t1878 #t1879 #t188 #t1880 #t1881 #t1882 #t1883 #t1884 #t1885 #t1886 #t1887 #t1888 #t1889 #t189 #t1890 #t1891 #t1892 #t1893 #t1894 #t1895 #t1896 #t1897 #t1898 #t1899 #t19 #t190 #t1900 #t1901 #t1902 #t1903 #t1904 #t1905 #t1906 #t1907 #t1908 #t1909 #t191 #t1910 #t1911 #t1912 #t1913 #t1914 #t1915 #t1916 #t1917 #t1918 #t1919 #t192 #t1920 #t1921 #t1922 #t1923 #t1924 #t1925 #t1926 #t1927 #t1928 #t1929 #t193 #t1930 #t1931 #t1932 #t1933 #t1934 #t1935 #t1936 #t1937 #t1938 #t1939 #t194 #t1940 #t1941 #t1942 #t1943 #t1944 #t1945 #t1946 #t1947 #t1948 #t1949 #t195 #t1950 #t1951 #t1952 #t1953 #t1954 #t1955 #t1956 #t1957 #t1958 #t1959 #t196 #t1960 #t1961 #t1962 #t1963 #t1964 #t1965 #t1966 #t1967 #t1968 #t1969 #t197 #t1970 #t1971 #t1972 #t1973 #t1974 #t1975 #t1976 #t1977 #t1978 #t1979 #t198 #t1980 #t1981 #t1982 #t1983 #t1984 #t1985 #t1986 #t1987 #t1988 #t1989 #t199 #t1990 #t1991 #t1992 #t1993 #t1994 #t1995 #t1996 #t1997 #t1998 #t1999 #t2 #t20 #t200 #t2000 #t2001 #t2002 #t2003 #t2004 #t2005 #t2006 #t2007 #t2008 #t2009 #t201 #t2010 #t2011 #t2012 #t2013 #t2014 #t2015 #t2016 #t2017 #t2018 #t2019 #t202 #t2020 #t2021 #t2022 #t2023 #t2024 #t2025 #t2026 #t2027 #t2028 #t2029 #t203 #t2030 #t2031 #t2032 #t2033 #t2034 #t2035 #t2036 #t2037 #t2038 #t2039 #t204 #t2040 #t2041 #t2042 #t2043 #t2044 #t2045 #t2046 #t2047 #t2048 #t2049 #t205 #t2050 #t2051 #t2052 #t2053 #t2054 #t2055 #t2056 #t2057 #t2058 #t2059 #t206 #t2060 #t2061 #t2062 #t2063 #t2064 #t2065 #t2066 #t2067 #t2068 #t2069 #t207 #t2070 #t2071 #t2072 #t2073 #t2074 #t2075 #t2076 #t2077 #t2078 #t2079 #t208 #t2080 #t2081 #t2082 #t2083 #t2084 #t2085 #t2086 #t2087 #t2088 #t2089 #t209 #t2090 #t2091 #t2092 #t2093 #t2094 #t2095 #t2096 #t2097 #t2098 #t2099 #t21 #t210 #t2100 #t2101 #t2102 #t2103 #t2104 #t2105 #t2106 #t2107 #t2108 #t2109 #t211 #t2110 #t2111 #t2112 #t2113 #t2114 #t2115 #t2116 #t2117 #t2118 #t2119 #t212 #t2120 #t2121 #t2122 #t2123 #t2124 #t2125 #t2126 #t2127 #t2128 #t2129 #t213 #t2130 #t2131 #t2132 #t2133 #t2134 #t2135 #t2136 #t2137 #t2138 #t2139 #t214 #t2140 #t2141 #t2142 #t2143 #t2144 #t2145 #t2146 #t2147 #t2148 #t2149 #t215 #t2150 #t2151 #t2152 #t2153 #t2154 #t2155 #t2156 #t2157 #t2158 #t2159 #t216 #t2160 #t2161 #t2162 #t2163 #t2164 #t2165 #t2166 #t2167 #t2168 #t2169 #t217 #t2170 #t2171 #t2172 #t2173 #t2174 #t2175 #t2176 #t2177 #t2178 #t2179 #t218 #t2180 #t2181 #t2182 #t2183 #t2184 #t2185 #t2186 #t2187 #t2188 #t2189 #t219 #t2190 #t2191 #t2192 #t2193 #t2194 #t2195 #t2196 #t2197 #t2198 #t2199 #t22 #t220 #t2200 #t2201 #t2202 #t2203 #t2204 #t2205 #t2206 #t2207 #t2208 #t2209 #t221 #t2210 #t2211 #t2212 #t2213 #t2214 #t2215 #t2216 #t2217 #t2218 #t2219 #t222 #t2220 #t2221 #t2222 #t2223 #t2224 #t2225 #t2226 #t2227 #t2228 #t2229 #t223 #t2230 #t2231 #t2232 #t2233 #t2234 #t2235 #t2236 #t2237 #t2238 #t2239 #t224 #t2240 #t2241 #t2242 #t2243 #t2244 #t2245 #t2246 #t2247 #t2248 #t2249 #t225 #t2250 #t2251 #t2252 #t2253 #t2254 #t2255 #t2256 #t2257 #t2258 #t2259 #t226 #t2260 #t2261 #t2262 #t2263 #t2264 #t2265 #t2266 #t2267 #t2268 #t2269 #t227 #t2270 #t2271 #t2272 #t2273 #t2274 #t2275 #t2276 #t2277 #t2278 #t2279 #t228 #t2280 #t2281 #t2282 #t2283 #t2284 #t2285 #t2286 #t2287 #t2288 #t2289 #t229 #t2290 #t2291 #t2292 #t2293 #t2294 #t2295 #t2296 #t2297 #t2298 #t2299 #t23 #t230 #t2300 #t2301 #t2302 #t2303 #t2304 #t2305 #t2306 #t2307 #t2308 #t2309 #t231 #t2310 #t2311 #t2312 #t2313 #t2314 #t2315 #t2316 #t2317 #t2318 #t2319 #t232 #t2320 #t2321 #t2322 #t2323 #t2324 #t2325 #t2326 #t2327 #t2328 #t2329 #t233 #t2330 #t2331 #t2332 #t2333 #t2334 #t2335 #t2336 #t2337 #t2338 #t2339 #t234 #t2340 #t2341 #t2342 #t2343 #t2344 #t2345 #t2346 #t2347 #t2348 #t2349 #t235 #t2350 #t2351 #t2352 #t2353 #t2354 #t2355 #t2356 #t2357 #t2358 #t2359 #t236 #t2360 #t2361 #t2362 #t2363 #t2364 #t2365 #t2366 #t2367 #t2368 #t2369 #t237 #t2370 #t2371 #t2372 #t2373 #t2374 #t2375 #t2376 #t2377 #t2378 #t2379 #t238 #t2380 #t2381 #t2382 #t2383 #t2384 #t2385 #t2386 #t2387 #t2388 #t2389 #t239 #t2390 #t2391 #t2392 #t2393 #t2394 #t2395 #t2396 #t2397 #t2398 #t2399 #t24 #t240 #t2400 #t2401 #t2402 #t2403 #t2404 #t2405 #t2406 #t2407 #t2408 #t2409 #t241 #t2410 #t2411 #t2412 #t2413 #t2414 #t2415 #t2416 #t2417 #t2418 #t2419 #t242 #t2420 #t2421 #t2422 #t2423 #t2424 #t2425 #t2426 #t2427 #t2428 #t2429 #t243 #t2430 #t2431 #t2432 #t2433 #t2434 #t2435 #t2436 #t2437 #t2438 #t2439 #t244 #t2440 #t2441 #t2442 #t2443 #t2444 #t2445 #t2446 #t2447 #t2448 #t2449 #t245 #t2450 #t2451 #t2452 #t2453 #t2454 #t2455 #t2456 #t2457 #t2458 #t2459 #t246 #t2460 #t2461 #t2462 #t2463 #t2464 #t2465 #t2466 #t2467 #t2468 #t2469 #t247 #t2470 #t2471 #t2472 #t2473 #t2474 #t2475 #t2476 #t2477 #t2478 #t2479 #t248 #t2480 #t2481 #t2482 #t2483 #t2484 #t2485 #t2486 #t2487 #t2488 #t2489 #t249 #t2490 #t2491 #t2492 #t2493 #t2494 #t2495 #t2496 #t2497 #t2498 #t2499 #t25 #t250 #t2500 #t2501 #t2502 #t2503 #t2504 #t2505 #t2506 #t2507 #t2508 #t2509 #t251 #t2510 #t2511 #t2512 #t2513 #t2514 #t2515 #t2516 #t2517 #t2518 #t2519 #t252 #t2520 #t2521 #t2522 #t2523 #t2524 #t2525 #t2526 #t2527 #t2528 #t2529 #t253 #t2530 #t2531 #t2532 #t2533 #t2534 #t2535 #t2536 #t2537 #t2538 #t2539 #t254 #t2540 #t2541 #t2542 #t2543 #t2544 #t255 #t256 #t257 #t258 #t259 #t26 #t260 #t261 #t262 #t263 #t264 #t265 #t266 #t267 #t268 #t269 #t27 #t270 #t271 #t272 #t273 #t274 #t275 #t276 #t277 #t278 #t279 #t28 #t280 #t281 #t282 #t283 #t284 #t285 #t286 #t287 #t288 #t289 #t29 #t290 #t291 #t292 #t293 #t294 #t295 #t296 #t297 #t298 #t299 #t3 #t30 #t300 #t301 #t302 #t303 #t304 #t305 #t306 #t307 #t308 #t309 #t31 #t310 #t311 #t312 #t313 #t314 #t315 #t316 #t317 #t318 #t319 #t32 #t320 #t321 #t322 #t323 #t324 #t325 #t326 #t327 #t328 #t329 #t33 #t330 #t331 #t332 #t333 #t334 #t335 #t336 #t337 #t338 #t339 #t34 #t340 #t341 #t342 #t343 #t344 #t345 #t346 #t347 #t348 #t349 #t35 #t350 #t351 #t352 #t353 #t354 #t355 #t356 #t357 #t358 #t359 #t36 #t360 #t361 #t362 #t363 #t364 #t365 #t366 #t367 #t368 #t369 #t37 #t370 #t371 #t372 #t373 #t374 #t375 #t376 #t377 #t378 #t379 #t38 #t380 #t381 #t382 #t383 #t384 #t385 #t386 #t387 #t388 #t389 #t39 #t390 #t391 #t392 #t393 #t394 #t395 #t396 #t397 #t398 #t399 #t4 #t40 #t400 #t401 #t402 #t403 #t404 #t405 #t406 #t407 #t408 #t409 #t41 #t410 #t411 #t412 #t413 #t414 #t415 #t416 #t417 #t418 #t419 #t42 #t420 #t421 #t422 #t423 #t424 #t425 #t426 #t427 #t428 #t429 #t43 #t430 #t431 #t432 #t433 #t434 #t435 #t436 #t437 #t438 #t439 #t44 #t440 #t441 #t442 #t443 #t444 #t445 #t446 #t447 #t448 #t449 #t45 #t450 #t451 #t452 #t453 #t454 #t455 #t456 #t457 #t458 #t459 #t46 #t460 #t461 #t462 #t463 #t464 #t465 #t466 #t467 #t468 #t469 #t47 #t470 #t471 #t472 #t473 #t474 #t475 #t476 #t477 #t478 #t479 #t48 #t480 #t481 #t482 #t483 #t484 #t485 #t486 #t487 #t488 #t489 #t49 #t490 #t491 #t492 #t493 #t494 #t495 #t496 #t497 #t498 #t499 #t5 #t50 #t500 #t501 #t502 #t503 #t504 #t505 #t506 #t507 #t508 #t509 #t51 #t510 #t511 #t512 #t513 #t514 #t515 #t516 #t517 #t518 #t519 #t52 #t520 #t521 #t522 #t523 #t524 #t525 #t526 #t527 #t528 #t529 #t53 #t530 #t531 #t532 #t533 #t534 #t535 #t536 #t537 #t538 #t539 #t54 #t540 #t541 #t542 #t543 #t544 #t545 #t546 #t547 #t548 #t549 #t55 #t550 #t551 #t552 #t553 #t554 #t555 #t556 #t557 #t558 #t559 #t56 #t560 #t561 #t562 #t563 #t564 #t565 #t566 #t567 #t568 #t569 #t57 #t570 #t571 #t572 #t573 #t574 #t575 #t576 #t577 #t578 #t579 #t58 #t580 #t581 #t582 #t583 #t584 #t585 #t586 #t587 #t588 #t589 #t59 #t590 #t591 #t592 #t593 #t594 #t595 #t596 #t597 #t598 #t599 #t6 #t60 #t600 #t601 #t602 #t603 #t604 #t605 #t606 #t607 #t608 #t609 #t61 #t610 #t611 #t612 #t613 #t614 #t615 #t616 #t617 #t618 #t619 #t62 #t620 #t621 #t622 #t623 #t624 #t625 #t626 #t627 #t628 #t629 #t63 #t630 #t631 #t632 #t633 #t634 #t635 #t636 #t637 #t638 #t639 #t64 #t640 #t641 #t642 #t643 #t644 #t645 #t646 #t647 #t648 #t649 #t65 #t650 #t651 #t652 #t653 #t654 #t655 #t656 #t657 #t658 #t659 #t66 #t660 #t661 #t662 #t663 #t664 #t665 #t666 #t667 #t668 #t669 #t67 #t670 #t671 #t672 #t673 #t674 #t675 #t676 #t677 #t678 #t679 #t68 #t680 #t681 #t682 #t683 #t684 #t685 #t686 #t687 #t688 #t689 #t69 #t690 #t691 #t692 #t693 #t694 #t695 #t696 #t697 #t698 #t699 #t7 #t70 #t700 #t701 #t702 #t703 #t704 #t705 #t706 #t707 #t708 #t709 #t71 #t710 #t711 #t712 #t713 #t714 #t715 #t716 #t717 #t718 #t719 #t72 #t720 #t721 #t722 #t723 #t724 #t725 #t726 #t727 #t728 #t729 #t73 #t730 #t731 #t732 #t733 #t734 #t735 #t736 #t737 #t738 #t739 #t74 #t740 #t741 #t742 #t743 #t744 #t745 #t746 #t747 #t748 #t749 #t75 #t750 #t751 #t752 #t753 #t754 #t755 #t756 #t757 #t758 #t759 #t76 #t760 #t761 #t762 #t763 #t764 #t765 #t766 #t767 #t768 #t769 #t77 #t770 #t771 #t772 #t773 #t774 #t775 #t776 #t777 #t778 #t779 #t78 #t780 #t781 #t782 #t783 #t784 #t785 #t786 #t787 #t788 #t789 #t79 #t790 #t791 #t792 #t793 #t794 #t795 #t796 #t797 #t798 #t799 #t8 #t80 #t800 #t801 #t802 #t803 #t804 #t805 #t806 #t807 #t808 #t809 #t81 #t810 #t811 #t812 #t813 #t814 #t815 #t816 #t817 #t818 #t819 #t82 #t820 #t821 #t822 #t823 #t824 #t825 #t826 #t827 #t828 #t829 #t83 #t830 #t831 #t832 #t833 #t834 #t835 #t836 #t837 #t838 #t839 #t84 #t840 #t841 #t842 #t843 #t844 #t845 #t846 #t847 #t848 #t849 #t85 #t850 #t851 #t852 #t853 #t854 #t855 #t856 #t857 #t858 #t859 #t86 #t860 #t861 #t862 #t863 #t864 #t865 #t866 #t867 #t868 #t869 #t87 #t870 #t871 #t872 #t873 #t874 #t875 #t876 #t877 #t878 #t879 #t88 #t880 #t881 #t882 #t883 #t884 #t885 #t886 #t887 #t888 #t889 #t89 #t890 #t891 #t892 #t893 #t894 #t895 #t896 #t897 #t898 #t899 #t9 #t90 #t900 #t901 #t902 #t903 #t904 #t905 #t906 #t907 #t908 #t909 #t91 #t910 #t911 #t912 #t913 #t914 #t915 #t916 #t917 #t918 #t919 #t92 #t920 #t921 #t922 #t923 #t924 #t925 #t926 #t927 #t928 #t929 #t93 #t930 #t931 #t932 #t933 #t934 #t935 #t936 #t937 #t938 #t939 #t94 #t940 #t941 #t942 #t943 #t944 #t945 #t946 #t947 #t948 #t949 #t95 #t950 #t951 #t952 #t953 #t954 #t955 #t956 #t957 #t958 #t959 #t96 #t960 #t961 #t962 #t963 #t964 #t965 #t966 #t967 #t968 #t969 #t97 #t970 #t971 #t972 #t973 #t974 #t975 #t976 #t977 #t978 #t979 #t98 #t980 #t981 #t982 #t983 #t984 #t985 #t986 #t987 #t988 #t989 #t99 #t990 #t991 #t992 #t993 #t994 #t995 #t996 #t997 #t998 #t999 - trajectory
          #g0 #g1 #g2 #g3 #g4 #g5 - grasp
          #q0 #q1 #q10 #q11 #q12 #q13 #q14 #q15 #q16 #q17 #q2 #q3 #q4 #q5 #q6 #q7 #q8 #q9 - config
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

   (:action a0_move_free
          :parameters (q808 #q0 #t21)
          :precondition (and (isfreemotion q808 #t21 #q0) (atconf q808) (handempty) (canmove) (_applicable _p0))
          :effect (and (atconf #q0) (not (atconf q808)) (not (canmove)) (canpick) (increase (total-cost) 100) (not (_applicable _p0)) (_applicable _p1))
   )
   (:action a1_pick
          :parameters (o8 p288 #g0 #q0 #t1)
          :precondition (and (iskin o8 p288 #g0 #q0 #t1) (atpose o8 p288) (handempty) (atconf #q0) (canpick) (not (usedgrasp o8 p288 #g0)) (graspatpose #g0 p288) (_applicable _p1))
          :effect (and (atgrasp o8 #g0) (canmove) (not (atpose o8 p288)) (not (handempty)) (increase (total-cost) 100) (not (_applicable _p1)) (_applicable _p2))
   )
   (:action a2_move_holding
          :parameters (#q0 #q3 o8 #g0 #t133)
          :precondition (and (isholdingmotion #q0 #t133 #q3 o8 #g0) (atconf #q0) (atgrasp o8 #g0) (canmove) (_applicable _p2))
          :effect (and (atconf #q3) (not (atconf #q0)) (not (canmove)) (canpick) (canplace) (increase (total-cost) 100) (not (_applicable _p2)) (_applicable _p3))
   )
   (:action a3_place
          :parameters (o8 #p1 o7 #g0 #q3 #t4)
          :precondition (and (iskin o8 #p1 #g0 #q3 #t4) (issupport o8 #p1 o7) (atgrasp o8 #g0) (atconf #q3) (graspable o8) (fixed o7) (canplace) (_applicable _p3))
          :effect (and (atpose o8 #p1) (handempty) (canmove) (not (atgrasp o8 #g0)) (not (canpick)) (not (canplace)) (increase (total-cost) 100) (allowlocate) (not (located o8 #p1)) (usedgrasp o8 #p1 #g0) (not (_applicable _p3)) (_applicable _p4))
   )
   (:action a4_move_free
          :parameters (#q3 #q1 #t50)
          :precondition (and (isfreemotion #q3 #t50 #q1) (atconf #q3) (handempty) (canmove) (_applicable _p4))
          :effect (and (atconf #q1) (not (atconf #q3)) (not (canmove)) (canpick) (increase (total-cost) 100) (not (_applicable _p4)) (_applicable _p5))
   )
   (:action a5_pick
          :parameters (o9 p712 #g1 #q1 #t2)
          :precondition (and (iskin o9 p712 #g1 #q1 #t2) (atpose o9 p712) (handempty) (atconf #q1) (canpick) (not (usedgrasp o9 p712 #g1)) (graspatpose #g1 p712) (_applicable _p5))
          :effect (and (atgrasp o9 #g1) (canmove) (not (atpose o9 p712)) (not (handempty)) (increase (total-cost) 100) (not (_applicable _p5)) (_applicable _p6))
   )
   (:action a6_move_holding
          :parameters (#q1 q808 o9 #g1 #t152)
          :precondition (and (isholdingmotion #q1 #t152 q808 o9 #g1) (atconf #q1) (atgrasp o9 #g1) (canmove) (_applicable _p6))
          :effect (and (atconf q808) (not (atconf #q1)) (not (canmove)) (canpick) (canplace) (increase (total-cost) 100) (not (_applicable _p6)) (_applicable _p7))
   )
   (:action s0_sample-place
          :parameters (o8 o6)
          :precondition (stackable o8 o6)
          :effect (and (ispose o8 #p0) (issupport o8 #p0 o6))
   )
   (:action s1_sample-place
          :parameters (o8 o7)
          :precondition (stackable o8 o7)
          :effect (and (ispose o8 #p1) (issupport o8 #p1 o7))
   )
   (:action s2_sample-place
          :parameters (o9 o6)
          :precondition (stackable o9 o6)
          :effect (and (ispose o9 #p2) (issupport o9 #p2 o6))
   )
   (:action s3_sample-place
          :parameters (o9 o7)
          :precondition (stackable o9 o7)
          :effect (and (ispose o9 #p3) (issupport o9 #p3 o7))
   )
   (:action s4_sample-grasp-dir
          :parameters (o8 p288)
          :precondition (and (graspable o8) (ispose o8 p288))
          :effect (isgraspdir o8 p288 #d0)
   )
   (:action s5_sample-grasp-dir
          :parameters (o9 p712)
          :precondition (and (graspable o9) (ispose o9 p712))
          :effect (isgraspdir o9 p712 #d1)
   )
   (:action s6_plan-free-motion
          :parameters (q808 q808)
          :precondition (and (isconf q808) (isconf q808))
          :effect (isfreemotion q808 #t0 q808)
   )
   (:action s7_sample-grasp-dir
          :parameters (o8 #p0)
          :precondition (and (graspable o8) (ispose o8 #p0))
          :effect (isgraspdir o8 #p0 #d2)
   )
   (:action s8_sample-grasp-dir
          :parameters (o8 #p1)
          :precondition (and (graspable o8) (ispose o8 #p1))
          :effect (isgraspdir o8 #p1 #d3)
   )
   (:action s9_sample-grasp-dir
          :parameters (o9 #p2)
          :precondition (and (graspable o9) (ispose o9 #p2))
          :effect (isgraspdir o9 #p2 #d4)
   )
   (:action s10_sample-grasp-dir
          :parameters (o9 #p3)
          :precondition (and (graspable o9) (ispose o9 #p3))
          :effect (isgraspdir o9 #p3 #d5)
   )
   (:action s11_sample-grasp
          :parameters (o8 p288 #d0)
          :precondition (isgraspdir o8 p288 #d0)
          :effect (and (graspatpose #g0 p288) (isgrasp o8 #g0))
   )
   (:action s12_sample-grasp
          :parameters (o9 p712 #d1)
          :precondition (isgraspdir o9 p712 #d1)
          :effect (and (graspatpose #g1 p712) (isgrasp o9 #g1))
   )
   (:action s13_sample-grasp
          :parameters (o8 #p0 #d2)
          :precondition (isgraspdir o8 #p0 #d2)
          :effect (and (graspatpose #g2 #p0) (isgrasp o8 #g2))
   )
   (:action s14_sample-grasp
          :parameters (o8 #p1 #d3)
          :precondition (isgraspdir o8 #p1 #d3)
          :effect (and (graspatpose #g3 #p1) (isgrasp o8 #g3))
   )
   (:action s15_sample-grasp
          :parameters (o9 #p2 #d4)
          :precondition (isgraspdir o9 #p2 #d4)
          :effect (and (graspatpose #g4 #p2) (isgrasp o9 #g4))
   )
   (:action s16_sample-grasp
          :parameters (o9 #p3 #d5)
          :precondition (isgraspdir o9 #p3 #d5)
          :effect (and (graspatpose #g5 #p3) (isgrasp o9 #g5))
   )
   (:action s17_inverse-kinematics
          :parameters (o8 p288 #g0)
          :precondition (and (ispose o8 p288) (isgrasp o8 #g0))
          :effect (and (isconf #q0) (istraj #t1) (iskin o8 p288 #g0 #q0 #t1))
   )
   (:action s18_inverse-kinematics
          :parameters (o9 p712 #g1)
          :precondition (and (ispose o9 p712) (isgrasp o9 #g1))
          :effect (and (isconf #q1) (istraj #t2) (iskin o9 p712 #g1 #q1 #t2))
   )
   (:action s19_inverse-kinematics
          :parameters (o8 #p0 #g0)
          :precondition (and (ispose o8 #p0) (isgrasp o8 #g0))
          :effect (and (isconf #q2) (istraj #t3) (iskin o8 #p0 #g0 #q2 #t3))
   )
   (:action s20_inverse-kinematics
          :parameters (o8 #p1 #g0)
          :precondition (and (ispose o8 #p1) (isgrasp o8 #g0))
          :effect (and (isconf #q3) (istraj #t4) (iskin o8 #p1 #g0 #q3 #t4))
   )
   (:action s21_inverse-kinematics
          :parameters (o9 #p2 #g1)
          :precondition (and (ispose o9 #p2) (isgrasp o9 #g1))
          :effect (and (isconf #q4) (istraj #t5) (iskin o9 #p2 #g1 #q4 #t5))
   )
   (:action s22_inverse-kinematics
          :parameters (o9 #p3 #g1)
          :precondition (and (ispose o9 #p3) (isgrasp o9 #g1))
          :effect (and (isconf #q5) (istraj #t6) (iskin o9 #p3 #g1 #q5 #t6))
   )
   (:action s23_plan-holding-motion
          :parameters (q808 q808 o8 #g0)
          :precondition (and (isconf q808) (isconf q808) (isgrasp o8 #g0))
          :effect (isholdingmotion q808 #t7 q808 o8 #g0)
   )
   (:action s24_plan-holding-motion
          :parameters (q808 q808 o9 #g1)
          :precondition (and (isconf q808) (isconf q808) (isgrasp o9 #g1))
          :effect (isholdingmotion q808 #t8 q808 o9 #g1)
   )
   (:action s25_inverse-kinematics
          :parameters (o8 p288 #g2)
          :precondition (and (ispose o8 p288) (isgrasp o8 #g2))
          :effect (and (isconf #q6) (istraj #t9) (iskin o8 p288 #g2 #q6 #t9))
   )
   (:action s26_inverse-kinematics
          :parameters (o8 p288 #g3)
          :precondition (and (ispose o8 p288) (isgrasp o8 #g3))
          :effect (and (isconf #q7) (istraj #t10) (iskin o8 p288 #g3 #q7 #t10))
   )
   (:action s27_inverse-kinematics
          :parameters (o9 p712 #g4)
          :precondition (and (ispose o9 p712) (isgrasp o9 #g4))
          :effect (and (isconf #q8) (istraj #t11) (iskin o9 p712 #g4 #q8 #t11))
   )
   (:action s28_inverse-kinematics
          :parameters (o9 p712 #g5)
          :precondition (and (ispose o9 p712) (isgrasp o9 #g5))
          :effect (and (isconf #q9) (istraj #t12) (iskin o9 p712 #g5 #q9 #t12))
   )
   (:action s29_inverse-kinematics
          :parameters (o8 #p0 #g2)
          :precondition (and (ispose o8 #p0) (isgrasp o8 #g2))
          :effect (and (isconf #q10) (istraj #t13) (iskin o8 #p0 #g2 #q10 #t13))
   )
   (:action s30_inverse-kinematics
          :parameters (o8 #p0 #g3)
          :precondition (and (ispose o8 #p0) (isgrasp o8 #g3))
          :effect (and (isconf #q11) (istraj #t14) (iskin o8 #p0 #g3 #q11 #t14))
   )
   (:action s31_inverse-kinematics
          :parameters (o8 #p1 #g2)
          :precondition (and (ispose o8 #p1) (isgrasp o8 #g2))
          :effect (and (isconf #q12) (istraj #t15) (iskin o8 #p1 #g2 #q12 #t15))
   )
   (:action s32_inverse-kinematics
          :parameters (o8 #p1 #g3)
          :precondition (and (ispose o8 #p1) (isgrasp o8 #g3))
          :effect (and (isconf #q13) (istraj #t16) (iskin o8 #p1 #g3 #q13 #t16))
   )
   (:action s33_inverse-kinematics
          :parameters (o9 #p2 #g4)
          :precondition (and (ispose o9 #p2) (isgrasp o9 #g4))
          :effect (and (isconf #q14) (istraj #t17) (iskin o9 #p2 #g4 #q14 #t17))
   )
   (:action s34_inverse-kinematics
          :parameters (o9 #p2 #g5)
          :precondition (and (ispose o9 #p2) (isgrasp o9 #g5))
          :effect (and (isconf #q15) (istraj #t18) (iskin o9 #p2 #g5 #q15 #t18))
   )
   (:action s35_inverse-kinematics
          :parameters (o9 #p3 #g4)
          :precondition (and (ispose o9 #p3) (isgrasp o9 #g4))
          :effect (and (isconf #q16) (istraj #t19) (iskin o9 #p3 #g4 #q16 #t19))
   )
   (:action s36_inverse-kinematics
          :parameters (o9 #p3 #g5)
          :precondition (and (ispose o9 #p3) (isgrasp o9 #g5))
          :effect (and (isconf #q17) (istraj #t20) (iskin o9 #p3 #g5 #q17 #t20))
   )
   (:action s37_plan-free-motion
          :parameters (q808 #q0)
          :precondition (and (isconf q808) (isconf #q0))
          :effect (isfreemotion q808 #t21 #q0)
   )
   (:action s38_plan-free-motion
          :parameters (q808 #q1)
          :precondition (and (isconf q808) (isconf #q1))
          :effect (isfreemotion q808 #t22 #q1)
   )
   (:action s39_plan-free-motion
          :parameters (q808 #q2)
          :precondition (and (isconf q808) (isconf #q2))
          :effect (isfreemotion q808 #t23 #q2)
   )
   (:action s40_plan-free-motion
          :parameters (q808 #q3)
          :precondition (and (isconf q808) (isconf #q3))
          :effect (isfreemotion q808 #t24 #q3)
   )
   (:action s41_plan-free-motion
          :parameters (q808 #q4)
          :precondition (and (isconf q808) (isconf #q4))
          :effect (isfreemotion q808 #t25 #q4)
   )
   (:action s42_plan-free-motion
          :parameters (q808 #q5)
          :precondition (and (isconf q808) (isconf #q5))
          :effect (isfreemotion q808 #t26 #q5)
   )
   (:action s43_plan-free-motion
          :parameters (#q0 q808)
          :precondition (and (isconf #q0) (isconf q808))
          :effect (isfreemotion #q0 #t27 q808)
   )
   (:action s44_plan-free-motion
          :parameters (#q0 #q0)
          :precondition (and (isconf #q0) (isconf #q0))
          :effect (isfreemotion #q0 #t28 #q0)
   )
   (:action s45_plan-free-motion
          :parameters (#q0 #q1)
          :precondition (and (isconf #q0) (isconf #q1))
          :effect (isfreemotion #q0 #t29 #q1)
   )
   (:action s46_plan-free-motion
          :parameters (#q0 #q2)
          :precondition (and (isconf #q0) (isconf #q2))
          :effect (isfreemotion #q0 #t30 #q2)
   )
   (:action s47_plan-free-motion
          :parameters (#q0 #q3)
          :precondition (and (isconf #q0) (isconf #q3))
          :effect (isfreemotion #q0 #t31 #q3)
   )
   (:action s48_plan-free-motion
          :parameters (#q0 #q4)
          :precondition (and (isconf #q0) (isconf #q4))
          :effect (isfreemotion #q0 #t32 #q4)
   )
   (:action s49_plan-free-motion
          :parameters (#q0 #q5)
          :precondition (and (isconf #q0) (isconf #q5))
          :effect (isfreemotion #q0 #t33 #q5)
   )
   (:action s50_plan-free-motion
          :parameters (#q1 q808)
          :precondition (and (isconf #q1) (isconf q808))
          :effect (isfreemotion #q1 #t34 q808)
   )
   (:action s51_plan-free-motion
          :parameters (#q1 #q0)
          :precondition (and (isconf #q1) (isconf #q0))
          :effect (isfreemotion #q1 #t35 #q0)
   )
   (:action s52_plan-free-motion
          :parameters (#q1 #q1)
          :precondition (and (isconf #q1) (isconf #q1))
          :effect (isfreemotion #q1 #t36 #q1)
   )
   (:action s53_plan-free-motion
          :parameters (#q1 #q2)
          :precondition (and (isconf #q1) (isconf #q2))
          :effect (isfreemotion #q1 #t37 #q2)
   )
   (:action s54_plan-free-motion
          :parameters (#q1 #q3)
          :precondition (and (isconf #q1) (isconf #q3))
          :effect (isfreemotion #q1 #t38 #q3)
   )
   (:action s55_plan-free-motion
          :parameters (#q1 #q4)
          :precondition (and (isconf #q1) (isconf #q4))
          :effect (isfreemotion #q1 #t39 #q4)
   )
   (:action s56_plan-free-motion
          :parameters (#q1 #q5)
          :precondition (and (isconf #q1) (isconf #q5))
          :effect (isfreemotion #q1 #t40 #q5)
   )
   (:action s57_plan-free-motion
          :parameters (#q2 q808)
          :precondition (and (isconf #q2) (isconf q808))
          :effect (isfreemotion #q2 #t41 q808)
   )
   (:action s58_plan-free-motion
          :parameters (#q2 #q0)
          :precondition (and (isconf #q2) (isconf #q0))
          :effect (isfreemotion #q2 #t42 #q0)
   )
   (:action s59_plan-free-motion
          :parameters (#q2 #q1)
          :precondition (and (isconf #q2) (isconf #q1))
          :effect (isfreemotion #q2 #t43 #q1)
   )
   (:action s60_plan-free-motion
          :parameters (#q2 #q2)
          :precondition (and (isconf #q2) (isconf #q2))
          :effect (isfreemotion #q2 #t44 #q2)
   )
   (:action s61_plan-free-motion
          :parameters (#q2 #q3)
          :precondition (and (isconf #q2) (isconf #q3))
          :effect (isfreemotion #q2 #t45 #q3)
   )
   (:action s62_plan-free-motion
          :parameters (#q2 #q4)
          :precondition (and (isconf #q2) (isconf #q4))
          :effect (isfreemotion #q2 #t46 #q4)
   )
   (:action s63_plan-free-motion
          :parameters (#q2 #q5)
          :precondition (and (isconf #q2) (isconf #q5))
          :effect (isfreemotion #q2 #t47 #q5)
   )
   (:action s64_plan-free-motion
          :parameters (#q3 q808)
          :precondition (and (isconf #q3) (isconf q808))
          :effect (isfreemotion #q3 #t48 q808)
   )
   (:action s65_plan-free-motion
          :parameters (#q3 #q0)
          :precondition (and (isconf #q3) (isconf #q0))
          :effect (isfreemotion #q3 #t49 #q0)
   )
   (:action s66_plan-free-motion
          :parameters (#q3 #q1)
          :precondition (and (isconf #q3) (isconf #q1))
          :effect (isfreemotion #q3 #t50 #q1)
   )
   (:action s67_plan-free-motion
          :parameters (#q3 #q2)
          :precondition (and (isconf #q3) (isconf #q2))
          :effect (isfreemotion #q3 #t51 #q2)
   )
   (:action s68_plan-free-motion
          :parameters (#q3 #q3)
          :precondition (and (isconf #q3) (isconf #q3))
          :effect (isfreemotion #q3 #t52 #q3)
   )
   (:action s69_plan-free-motion
          :parameters (#q3 #q4)
          :precondition (and (isconf #q3) (isconf #q4))
          :effect (isfreemotion #q3 #t53 #q4)
   )
   (:action s70_plan-free-motion
          :parameters (#q3 #q5)
          :precondition (and (isconf #q3) (isconf #q5))
          :effect (isfreemotion #q3 #t54 #q5)
   )
   (:action s71_plan-free-motion
          :parameters (#q4 q808)
          :precondition (and (isconf #q4) (isconf q808))
          :effect (isfreemotion #q4 #t55 q808)
   )
   (:action s72_plan-free-motion
          :parameters (#q4 #q0)
          :precondition (and (isconf #q4) (isconf #q0))
          :effect (isfreemotion #q4 #t56 #q0)
   )
   (:action s73_plan-free-motion
          :parameters (#q4 #q1)
          :precondition (and (isconf #q4) (isconf #q1))
          :effect (isfreemotion #q4 #t57 #q1)
   )
   (:action s74_plan-free-motion
          :parameters (#q4 #q2)
          :precondition (and (isconf #q4) (isconf #q2))
          :effect (isfreemotion #q4 #t58 #q2)
   )
   (:action s75_plan-free-motion
          :parameters (#q4 #q3)
          :precondition (and (isconf #q4) (isconf #q3))
          :effect (isfreemotion #q4 #t59 #q3)
   )
   (:action s76_plan-free-motion
          :parameters (#q4 #q4)
          :precondition (and (isconf #q4) (isconf #q4))
          :effect (isfreemotion #q4 #t60 #q4)
   )
   (:action s77_plan-free-motion
          :parameters (#q4 #q5)
          :precondition (and (isconf #q4) (isconf #q5))
          :effect (isfreemotion #q4 #t61 #q5)
   )
   (:action s78_plan-free-motion
          :parameters (#q5 q808)
          :precondition (and (isconf #q5) (isconf q808))
          :effect (isfreemotion #q5 #t62 q808)
   )
   (:action s79_plan-free-motion
          :parameters (#q5 #q0)
          :precondition (and (isconf #q5) (isconf #q0))
          :effect (isfreemotion #q5 #t63 #q0)
   )
   (:action s80_plan-free-motion
          :parameters (#q5 #q1)
          :precondition (and (isconf #q5) (isconf #q1))
          :effect (isfreemotion #q5 #t64 #q1)
   )
   (:action s81_plan-free-motion
          :parameters (#q5 #q2)
          :precondition (and (isconf #q5) (isconf #q2))
          :effect (isfreemotion #q5 #t65 #q2)
   )
   (:action s82_plan-free-motion
          :parameters (#q5 #q3)
          :precondition (and (isconf #q5) (isconf #q3))
          :effect (isfreemotion #q5 #t66 #q3)
   )
   (:action s83_plan-free-motion
          :parameters (#q5 #q4)
          :precondition (and (isconf #q5) (isconf #q4))
          :effect (isfreemotion #q5 #t67 #q4)
   )
   (:action s84_plan-free-motion
          :parameters (#q5 #q5)
          :precondition (and (isconf #q5) (isconf #q5))
          :effect (isfreemotion #q5 #t68 #q5)
   )
   (:action s85_plan-holding-motion
          :parameters (q808 q808 o8 #g2)
          :precondition (and (isconf q808) (isconf q808) (isgrasp o8 #g2))
          :effect (isholdingmotion q808 #t69 q808 o8 #g2)
   )
   (:action s86_plan-holding-motion
          :parameters (q808 q808 o8 #g3)
          :precondition (and (isconf q808) (isconf q808) (isgrasp o8 #g3))
          :effect (isholdingmotion q808 #t70 q808 o8 #g3)
   )
   (:action s87_plan-holding-motion
          :parameters (q808 q808 o9 #g4)
          :precondition (and (isconf q808) (isconf q808) (isgrasp o9 #g4))
          :effect (isholdingmotion q808 #t71 q808 o9 #g4)
   )
   (:action s88_plan-holding-motion
          :parameters (q808 q808 o9 #g5)
          :precondition (and (isconf q808) (isconf q808) (isgrasp o9 #g5))
          :effect (isholdingmotion q808 #t72 q808 o9 #g5)
   )
   (:action s89_plan-holding-motion
          :parameters (q808 #q0 o8 #g0)
          :precondition (and (isconf q808) (isconf #q0) (isgrasp o8 #g0))
          :effect (isholdingmotion q808 #t73 #q0 o8 #g0)
   )
   (:action s90_plan-holding-motion
          :parameters (q808 #q0 o9 #g1)
          :precondition (and (isconf q808) (isconf #q0) (isgrasp o9 #g1))
          :effect (isholdingmotion q808 #t74 #q0 o9 #g1)
   )
   (:action s91_plan-holding-motion
          :parameters (q808 #q0 o8 #g2)
          :precondition (and (isconf q808) (isconf #q0) (isgrasp o8 #g2))
          :effect (isholdingmotion q808 #t75 #q0 o8 #g2)
   )
   (:action s92_plan-holding-motion
          :parameters (q808 #q0 o8 #g3)
          :precondition (and (isconf q808) (isconf #q0) (isgrasp o8 #g3))
          :effect (isholdingmotion q808 #t76 #q0 o8 #g3)
   )
   (:action s93_plan-holding-motion
          :parameters (q808 #q0 o9 #g4)
          :precondition (and (isconf q808) (isconf #q0) (isgrasp o9 #g4))
          :effect (isholdingmotion q808 #t77 #q0 o9 #g4)
   )
   (:action s94_plan-holding-motion
          :parameters (q808 #q0 o9 #g5)
          :precondition (and (isconf q808) (isconf #q0) (isgrasp o9 #g5))
          :effect (isholdingmotion q808 #t78 #q0 o9 #g5)
   )
   (:action s95_plan-holding-motion
          :parameters (q808 #q1 o8 #g0)
          :precondition (and (isconf q808) (isconf #q1) (isgrasp o8 #g0))
          :effect (isholdingmotion q808 #t79 #q1 o8 #g0)
   )
   (:action s96_plan-holding-motion
          :parameters (q808 #q1 o9 #g1)
          :precondition (and (isconf q808) (isconf #q1) (isgrasp o9 #g1))
          :effect (isholdingmotion q808 #t80 #q1 o9 #g1)
   )
   (:action s97_plan-holding-motion
          :parameters (q808 #q1 o8 #g2)
          :precondition (and (isconf q808) (isconf #q1) (isgrasp o8 #g2))
          :effect (isholdingmotion q808 #t81 #q1 o8 #g2)
   )
   (:action s98_plan-holding-motion
          :parameters (q808 #q1 o8 #g3)
          :precondition (and (isconf q808) (isconf #q1) (isgrasp o8 #g3))
          :effect (isholdingmotion q808 #t82 #q1 o8 #g3)
   )
   (:action s99_plan-holding-motion
          :parameters (q808 #q1 o9 #g4)
          :precondition (and (isconf q808) (isconf #q1) (isgrasp o9 #g4))
          :effect (isholdingmotion q808 #t83 #q1 o9 #g4)
   )
   (:action s100_plan-holding-motion
          :parameters (q808 #q1 o9 #g5)
          :precondition (and (isconf q808) (isconf #q1) (isgrasp o9 #g5))
          :effect (isholdingmotion q808 #t84 #q1 o9 #g5)
   )
   (:action s101_plan-holding-motion
          :parameters (q808 #q2 o8 #g0)
          :precondition (and (isconf q808) (isconf #q2) (isgrasp o8 #g0))
          :effect (isholdingmotion q808 #t85 #q2 o8 #g0)
   )
   (:action s102_plan-holding-motion
          :parameters (q808 #q2 o9 #g1)
          :precondition (and (isconf q808) (isconf #q2) (isgrasp o9 #g1))
          :effect (isholdingmotion q808 #t86 #q2 o9 #g1)
   )
   (:action s103_plan-holding-motion
          :parameters (q808 #q2 o8 #g2)
          :precondition (and (isconf q808) (isconf #q2) (isgrasp o8 #g2))
          :effect (isholdingmotion q808 #t87 #q2 o8 #g2)
   )
   (:action s104_plan-holding-motion
          :parameters (q808 #q2 o8 #g3)
          :precondition (and (isconf q808) (isconf #q2) (isgrasp o8 #g3))
          :effect (isholdingmotion q808 #t88 #q2 o8 #g3)
   )
   (:action s105_plan-holding-motion
          :parameters (q808 #q2 o9 #g4)
          :precondition (and (isconf q808) (isconf #q2) (isgrasp o9 #g4))
          :effect (isholdingmotion q808 #t89 #q2 o9 #g4)
   )
   (:action s106_plan-holding-motion
          :parameters (q808 #q2 o9 #g5)
          :precondition (and (isconf q808) (isconf #q2) (isgrasp o9 #g5))
          :effect (isholdingmotion q808 #t90 #q2 o9 #g5)
   )
   (:action s107_plan-holding-motion
          :parameters (q808 #q3 o8 #g0)
          :precondition (and (isconf q808) (isconf #q3) (isgrasp o8 #g0))
          :effect (isholdingmotion q808 #t91 #q3 o8 #g0)
   )
   (:action s108_plan-holding-motion
          :parameters (q808 #q3 o9 #g1)
          :precondition (and (isconf q808) (isconf #q3) (isgrasp o9 #g1))
          :effect (isholdingmotion q808 #t92 #q3 o9 #g1)
   )
   (:action s109_plan-holding-motion
          :parameters (q808 #q3 o8 #g2)
          :precondition (and (isconf q808) (isconf #q3) (isgrasp o8 #g2))
          :effect (isholdingmotion q808 #t93 #q3 o8 #g2)
   )
   (:action s110_plan-holding-motion
          :parameters (q808 #q3 o8 #g3)
          :precondition (and (isconf q808) (isconf #q3) (isgrasp o8 #g3))
          :effect (isholdingmotion q808 #t94 #q3 o8 #g3)
   )
   (:action s111_plan-holding-motion
          :parameters (q808 #q3 o9 #g4)
          :precondition (and (isconf q808) (isconf #q3) (isgrasp o9 #g4))
          :effect (isholdingmotion q808 #t95 #q3 o9 #g4)
   )
   (:action s112_plan-holding-motion
          :parameters (q808 #q3 o9 #g5)
          :precondition (and (isconf q808) (isconf #q3) (isgrasp o9 #g5))
          :effect (isholdingmotion q808 #t96 #q3 o9 #g5)
   )
   (:action s113_plan-holding-motion
          :parameters (q808 #q4 o8 #g0)
          :precondition (and (isconf q808) (isconf #q4) (isgrasp o8 #g0))
          :effect (isholdingmotion q808 #t97 #q4 o8 #g0)
   )
   (:action s114_plan-holding-motion
          :parameters (q808 #q4 o9 #g1)
          :precondition (and (isconf q808) (isconf #q4) (isgrasp o9 #g1))
          :effect (isholdingmotion q808 #t98 #q4 o9 #g1)
   )
   (:action s115_plan-holding-motion
          :parameters (q808 #q4 o8 #g2)
          :precondition (and (isconf q808) (isconf #q4) (isgrasp o8 #g2))
          :effect (isholdingmotion q808 #t99 #q4 o8 #g2)
   )
   (:action s116_plan-holding-motion
          :parameters (q808 #q4 o8 #g3)
          :precondition (and (isconf q808) (isconf #q4) (isgrasp o8 #g3))
          :effect (isholdingmotion q808 #t100 #q4 o8 #g3)
   )
   (:action s117_plan-holding-motion
          :parameters (q808 #q4 o9 #g4)
          :precondition (and (isconf q808) (isconf #q4) (isgrasp o9 #g4))
          :effect (isholdingmotion q808 #t101 #q4 o9 #g4)
   )
   (:action s118_plan-holding-motion
          :parameters (q808 #q4 o9 #g5)
          :precondition (and (isconf q808) (isconf #q4) (isgrasp o9 #g5))
          :effect (isholdingmotion q808 #t102 #q4 o9 #g5)
   )
   (:action s119_plan-holding-motion
          :parameters (q808 #q5 o8 #g0)
          :precondition (and (isconf q808) (isconf #q5) (isgrasp o8 #g0))
          :effect (isholdingmotion q808 #t103 #q5 o8 #g0)
   )
   (:action s120_plan-holding-motion
          :parameters (q808 #q5 o9 #g1)
          :precondition (and (isconf q808) (isconf #q5) (isgrasp o9 #g1))
          :effect (isholdingmotion q808 #t104 #q5 o9 #g1)
   )
   (:action s121_plan-holding-motion
          :parameters (q808 #q5 o8 #g2)
          :precondition (and (isconf q808) (isconf #q5) (isgrasp o8 #g2))
          :effect (isholdingmotion q808 #t105 #q5 o8 #g2)
   )
   (:action s122_plan-holding-motion
          :parameters (q808 #q5 o8 #g3)
          :precondition (and (isconf q808) (isconf #q5) (isgrasp o8 #g3))
          :effect (isholdingmotion q808 #t106 #q5 o8 #g3)
   )
   (:action s123_plan-holding-motion
          :parameters (q808 #q5 o9 #g4)
          :precondition (and (isconf q808) (isconf #q5) (isgrasp o9 #g4))
          :effect (isholdingmotion q808 #t107 #q5 o9 #g4)
   )
   (:action s124_plan-holding-motion
          :parameters (q808 #q5 o9 #g5)
          :precondition (and (isconf q808) (isconf #q5) (isgrasp o9 #g5))
          :effect (isholdingmotion q808 #t108 #q5 o9 #g5)
   )
   (:action s125_plan-holding-motion
          :parameters (#q0 q808 o8 #g0)
          :precondition (and (isconf #q0) (isconf q808) (isgrasp o8 #g0))
          :effect (isholdingmotion #q0 #t109 q808 o8 #g0)
   )
   (:action s126_plan-holding-motion
          :parameters (#q0 q808 o9 #g1)
          :precondition (and (isconf #q0) (isconf q808) (isgrasp o9 #g1))
          :effect (isholdingmotion #q0 #t110 q808 o9 #g1)
   )
   (:action s127_plan-holding-motion
          :parameters (#q0 q808 o8 #g2)
          :precondition (and (isconf #q0) (isconf q808) (isgrasp o8 #g2))
          :effect (isholdingmotion #q0 #t111 q808 o8 #g2)
   )
   (:action s128_plan-holding-motion
          :parameters (#q0 q808 o8 #g3)
          :precondition (and (isconf #q0) (isconf q808) (isgrasp o8 #g3))
          :effect (isholdingmotion #q0 #t112 q808 o8 #g3)
   )
   (:action s129_plan-holding-motion
          :parameters (#q0 q808 o9 #g4)
          :precondition (and (isconf #q0) (isconf q808) (isgrasp o9 #g4))
          :effect (isholdingmotion #q0 #t113 q808 o9 #g4)
   )
   (:action s130_plan-holding-motion
          :parameters (#q0 q808 o9 #g5)
          :precondition (and (isconf #q0) (isconf q808) (isgrasp o9 #g5))
          :effect (isholdingmotion #q0 #t114 q808 o9 #g5)
   )
   (:action s131_plan-holding-motion
          :parameters (#q0 #q0 o8 #g0)
          :precondition (and (isconf #q0) (isconf #q0) (isgrasp o8 #g0))
          :effect (isholdingmotion #q0 #t115 #q0 o8 #g0)
   )
   (:action s132_plan-holding-motion
          :parameters (#q0 #q0 o9 #g1)
          :precondition (and (isconf #q0) (isconf #q0) (isgrasp o9 #g1))
          :effect (isholdingmotion #q0 #t116 #q0 o9 #g1)
   )
   (:action s133_plan-holding-motion
          :parameters (#q0 #q0 o8 #g2)
          :precondition (and (isconf #q0) (isconf #q0) (isgrasp o8 #g2))
          :effect (isholdingmotion #q0 #t117 #q0 o8 #g2)
   )
   (:action s134_plan-holding-motion
          :parameters (#q0 #q0 o8 #g3)
          :precondition (and (isconf #q0) (isconf #q0) (isgrasp o8 #g3))
          :effect (isholdingmotion #q0 #t118 #q0 o8 #g3)
   )
   (:action s135_plan-holding-motion
          :parameters (#q0 #q0 o9 #g4)
          :precondition (and (isconf #q0) (isconf #q0) (isgrasp o9 #g4))
          :effect (isholdingmotion #q0 #t119 #q0 o9 #g4)
   )
   (:action s136_plan-holding-motion
          :parameters (#q0 #q0 o9 #g5)
          :precondition (and (isconf #q0) (isconf #q0) (isgrasp o9 #g5))
          :effect (isholdingmotion #q0 #t120 #q0 o9 #g5)
   )
   (:action s137_plan-holding-motion
          :parameters (#q0 #q1 o8 #g0)
          :precondition (and (isconf #q0) (isconf #q1) (isgrasp o8 #g0))
          :effect (isholdingmotion #q0 #t121 #q1 o8 #g0)
   )
   (:action s138_plan-holding-motion
          :parameters (#q0 #q1 o9 #g1)
          :precondition (and (isconf #q0) (isconf #q1) (isgrasp o9 #g1))
          :effect (isholdingmotion #q0 #t122 #q1 o9 #g1)
   )
   (:action s139_plan-holding-motion
          :parameters (#q0 #q1 o8 #g2)
          :precondition (and (isconf #q0) (isconf #q1) (isgrasp o8 #g2))
          :effect (isholdingmotion #q0 #t123 #q1 o8 #g2)
   )
   (:action s140_plan-holding-motion
          :parameters (#q0 #q1 o8 #g3)
          :precondition (and (isconf #q0) (isconf #q1) (isgrasp o8 #g3))
          :effect (isholdingmotion #q0 #t124 #q1 o8 #g3)
   )
   (:action s141_plan-holding-motion
          :parameters (#q0 #q1 o9 #g4)
          :precondition (and (isconf #q0) (isconf #q1) (isgrasp o9 #g4))
          :effect (isholdingmotion #q0 #t125 #q1 o9 #g4)
   )
   (:action s142_plan-holding-motion
          :parameters (#q0 #q1 o9 #g5)
          :precondition (and (isconf #q0) (isconf #q1) (isgrasp o9 #g5))
          :effect (isholdingmotion #q0 #t126 #q1 o9 #g5)
   )
   (:action s143_plan-holding-motion
          :parameters (#q0 #q2 o8 #g0)
          :precondition (and (isconf #q0) (isconf #q2) (isgrasp o8 #g0))
          :effect (isholdingmotion #q0 #t127 #q2 o8 #g0)
   )
   (:action s144_plan-holding-motion
          :parameters (#q0 #q2 o9 #g1)
          :precondition (and (isconf #q0) (isconf #q2) (isgrasp o9 #g1))
          :effect (isholdingmotion #q0 #t128 #q2 o9 #g1)
   )
   (:action s145_plan-holding-motion
          :parameters (#q0 #q2 o8 #g2)
          :precondition (and (isconf #q0) (isconf #q2) (isgrasp o8 #g2))
          :effect (isholdingmotion #q0 #t129 #q2 o8 #g2)
   )
   (:action s146_plan-holding-motion
          :parameters (#q0 #q2 o8 #g3)
          :precondition (and (isconf #q0) (isconf #q2) (isgrasp o8 #g3))
          :effect (isholdingmotion #q0 #t130 #q2 o8 #g3)
   )
   (:action s147_plan-holding-motion
          :parameters (#q0 #q2 o9 #g4)
          :precondition (and (isconf #q0) (isconf #q2) (isgrasp o9 #g4))
          :effect (isholdingmotion #q0 #t131 #q2 o9 #g4)
   )
   (:action s148_plan-holding-motion
          :parameters (#q0 #q2 o9 #g5)
          :precondition (and (isconf #q0) (isconf #q2) (isgrasp o9 #g5))
          :effect (isholdingmotion #q0 #t132 #q2 o9 #g5)
   )
   (:action s149_plan-holding-motion
          :parameters (#q0 #q3 o8 #g0)
          :precondition (and (isconf #q0) (isconf #q3) (isgrasp o8 #g0))
          :effect (isholdingmotion #q0 #t133 #q3 o8 #g0)
   )
   (:action s150_plan-holding-motion
          :parameters (#q0 #q3 o9 #g1)
          :precondition (and (isconf #q0) (isconf #q3) (isgrasp o9 #g1))
          :effect (isholdingmotion #q0 #t134 #q3 o9 #g1)
   )
   (:action s151_plan-holding-motion
          :parameters (#q0 #q3 o8 #g2)
          :precondition (and (isconf #q0) (isconf #q3) (isgrasp o8 #g2))
          :effect (isholdingmotion #q0 #t135 #q3 o8 #g2)
   )
   (:action s152_plan-holding-motion
          :parameters (#q0 #q3 o8 #g3)
          :precondition (and (isconf #q0) (isconf #q3) (isgrasp o8 #g3))
          :effect (isholdingmotion #q0 #t136 #q3 o8 #g3)
   )
   (:action s153_plan-holding-motion
          :parameters (#q0 #q3 o9 #g4)
          :precondition (and (isconf #q0) (isconf #q3) (isgrasp o9 #g4))
          :effect (isholdingmotion #q0 #t137 #q3 o9 #g4)
   )
   (:action s154_plan-holding-motion
          :parameters (#q0 #q3 o9 #g5)
          :precondition (and (isconf #q0) (isconf #q3) (isgrasp o9 #g5))
          :effect (isholdingmotion #q0 #t138 #q3 o9 #g5)
   )
   (:action s155_plan-holding-motion
          :parameters (#q0 #q4 o8 #g0)
          :precondition (and (isconf #q0) (isconf #q4) (isgrasp o8 #g0))
          :effect (isholdingmotion #q0 #t139 #q4 o8 #g0)
   )
   (:action s156_plan-holding-motion
          :parameters (#q0 #q4 o9 #g1)
          :precondition (and (isconf #q0) (isconf #q4) (isgrasp o9 #g1))
          :effect (isholdingmotion #q0 #t140 #q4 o9 #g1)
   )
   (:action s157_plan-holding-motion
          :parameters (#q0 #q4 o8 #g2)
          :precondition (and (isconf #q0) (isconf #q4) (isgrasp o8 #g2))
          :effect (isholdingmotion #q0 #t141 #q4 o8 #g2)
   )
   (:action s158_plan-holding-motion
          :parameters (#q0 #q4 o8 #g3)
          :precondition (and (isconf #q0) (isconf #q4) (isgrasp o8 #g3))
          :effect (isholdingmotion #q0 #t142 #q4 o8 #g3)
   )
   (:action s159_plan-holding-motion
          :parameters (#q0 #q4 o9 #g4)
          :precondition (and (isconf #q0) (isconf #q4) (isgrasp o9 #g4))
          :effect (isholdingmotion #q0 #t143 #q4 o9 #g4)
   )
   (:action s160_plan-holding-motion
          :parameters (#q0 #q4 o9 #g5)
          :precondition (and (isconf #q0) (isconf #q4) (isgrasp o9 #g5))
          :effect (isholdingmotion #q0 #t144 #q4 o9 #g5)
   )
   (:action s161_plan-holding-motion
          :parameters (#q0 #q5 o8 #g0)
          :precondition (and (isconf #q0) (isconf #q5) (isgrasp o8 #g0))
          :effect (isholdingmotion #q0 #t145 #q5 o8 #g0)
   )
   (:action s162_plan-holding-motion
          :parameters (#q0 #q5 o9 #g1)
          :precondition (and (isconf #q0) (isconf #q5) (isgrasp o9 #g1))
          :effect (isholdingmotion #q0 #t146 #q5 o9 #g1)
   )
   (:action s163_plan-holding-motion
          :parameters (#q0 #q5 o8 #g2)
          :precondition (and (isconf #q0) (isconf #q5) (isgrasp o8 #g2))
          :effect (isholdingmotion #q0 #t147 #q5 o8 #g2)
   )
   (:action s164_plan-holding-motion
          :parameters (#q0 #q5 o8 #g3)
          :precondition (and (isconf #q0) (isconf #q5) (isgrasp o8 #g3))
          :effect (isholdingmotion #q0 #t148 #q5 o8 #g3)
   )
   (:action s165_plan-holding-motion
          :parameters (#q0 #q5 o9 #g4)
          :precondition (and (isconf #q0) (isconf #q5) (isgrasp o9 #g4))
          :effect (isholdingmotion #q0 #t149 #q5 o9 #g4)
   )
   (:action s166_plan-holding-motion
          :parameters (#q0 #q5 o9 #g5)
          :precondition (and (isconf #q0) (isconf #q5) (isgrasp o9 #g5))
          :effect (isholdingmotion #q0 #t150 #q5 o9 #g5)
   )
   (:action s167_plan-holding-motion
          :parameters (#q1 q808 o8 #g0)
          :precondition (and (isconf #q1) (isconf q808) (isgrasp o8 #g0))
          :effect (isholdingmotion #q1 #t151 q808 o8 #g0)
   )
   (:action s168_plan-holding-motion
          :parameters (#q1 q808 o9 #g1)
          :precondition (and (isconf #q1) (isconf q808) (isgrasp o9 #g1))
          :effect (isholdingmotion #q1 #t152 q808 o9 #g1)
   )
   (:action s169_plan-holding-motion
          :parameters (#q1 q808 o8 #g2)
          :precondition (and (isconf #q1) (isconf q808) (isgrasp o8 #g2))
          :effect (isholdingmotion #q1 #t153 q808 o8 #g2)
   )
   (:action s170_plan-holding-motion
          :parameters (#q1 q808 o8 #g3)
          :precondition (and (isconf #q1) (isconf q808) (isgrasp o8 #g3))
          :effect (isholdingmotion #q1 #t154 q808 o8 #g3)
   )
   (:action s171_plan-holding-motion
          :parameters (#q1 q808 o9 #g4)
          :precondition (and (isconf #q1) (isconf q808) (isgrasp o9 #g4))
          :effect (isholdingmotion #q1 #t155 q808 o9 #g4)
   )
   (:action s172_plan-holding-motion
          :parameters (#q1 q808 o9 #g5)
          :precondition (and (isconf #q1) (isconf q808) (isgrasp o9 #g5))
          :effect (isholdingmotion #q1 #t156 q808 o9 #g5)
   )
   (:action s173_plan-holding-motion
          :parameters (#q1 #q0 o8 #g0)
          :precondition (and (isconf #q1) (isconf #q0) (isgrasp o8 #g0))
          :effect (isholdingmotion #q1 #t157 #q0 o8 #g0)
   )
   (:action s174_plan-holding-motion
          :parameters (#q1 #q0 o9 #g1)
          :precondition (and (isconf #q1) (isconf #q0) (isgrasp o9 #g1))
          :effect (isholdingmotion #q1 #t158 #q0 o9 #g1)
   )
   (:action s175_plan-holding-motion
          :parameters (#q1 #q0 o8 #g2)
          :precondition (and (isconf #q1) (isconf #q0) (isgrasp o8 #g2))
          :effect (isholdingmotion #q1 #t159 #q0 o8 #g2)
   )
   (:action s176_plan-holding-motion
          :parameters (#q1 #q0 o8 #g3)
          :precondition (and (isconf #q1) (isconf #q0) (isgrasp o8 #g3))
          :effect (isholdingmotion #q1 #t160 #q0 o8 #g3)
   )
   (:action s177_plan-holding-motion
          :parameters (#q1 #q0 o9 #g4)
          :precondition (and (isconf #q1) (isconf #q0) (isgrasp o9 #g4))
          :effect (isholdingmotion #q1 #t161 #q0 o9 #g4)
   )
   (:action s178_plan-holding-motion
          :parameters (#q1 #q0 o9 #g5)
          :precondition (and (isconf #q1) (isconf #q0) (isgrasp o9 #g5))
          :effect (isholdingmotion #q1 #t162 #q0 o9 #g5)
   )
   (:action s179_plan-holding-motion
          :parameters (#q1 #q1 o8 #g0)
          :precondition (and (isconf #q1) (isconf #q1) (isgrasp o8 #g0))
          :effect (isholdingmotion #q1 #t163 #q1 o8 #g0)
   )
   (:action s180_plan-holding-motion
          :parameters (#q1 #q1 o9 #g1)
          :precondition (and (isconf #q1) (isconf #q1) (isgrasp o9 #g1))
          :effect (isholdingmotion #q1 #t164 #q1 o9 #g1)
   )
   (:action s181_plan-holding-motion
          :parameters (#q1 #q1 o8 #g2)
          :precondition (and (isconf #q1) (isconf #q1) (isgrasp o8 #g2))
          :effect (isholdingmotion #q1 #t165 #q1 o8 #g2)
   )
   (:action s182_plan-holding-motion
          :parameters (#q1 #q1 o8 #g3)
          :precondition (and (isconf #q1) (isconf #q1) (isgrasp o8 #g3))
          :effect (isholdingmotion #q1 #t166 #q1 o8 #g3)
   )
   (:action s183_plan-holding-motion
          :parameters (#q1 #q1 o9 #g4)
          :precondition (and (isconf #q1) (isconf #q1) (isgrasp o9 #g4))
          :effect (isholdingmotion #q1 #t167 #q1 o9 #g4)
   )
   (:action s184_plan-holding-motion
          :parameters (#q1 #q1 o9 #g5)
          :precondition (and (isconf #q1) (isconf #q1) (isgrasp o9 #g5))
          :effect (isholdingmotion #q1 #t168 #q1 o9 #g5)
   )
   (:action s185_plan-holding-motion
          :parameters (#q1 #q2 o8 #g0)
          :precondition (and (isconf #q1) (isconf #q2) (isgrasp o8 #g0))
          :effect (isholdingmotion #q1 #t169 #q2 o8 #g0)
   )
   (:action s186_plan-holding-motion
          :parameters (#q1 #q2 o9 #g1)
          :precondition (and (isconf #q1) (isconf #q2) (isgrasp o9 #g1))
          :effect (isholdingmotion #q1 #t170 #q2 o9 #g1)
   )
   (:action s187_plan-holding-motion
          :parameters (#q1 #q2 o8 #g2)
          :precondition (and (isconf #q1) (isconf #q2) (isgrasp o8 #g2))
          :effect (isholdingmotion #q1 #t171 #q2 o8 #g2)
   )
   (:action s188_plan-holding-motion
          :parameters (#q1 #q2 o8 #g3)
          :precondition (and (isconf #q1) (isconf #q2) (isgrasp o8 #g3))
          :effect (isholdingmotion #q1 #t172 #q2 o8 #g3)
   )
   (:action s189_plan-holding-motion
          :parameters (#q1 #q2 o9 #g4)
          :precondition (and (isconf #q1) (isconf #q2) (isgrasp o9 #g4))
          :effect (isholdingmotion #q1 #t173 #q2 o9 #g4)
   )
   (:action s190_plan-holding-motion
          :parameters (#q1 #q2 o9 #g5)
          :precondition (and (isconf #q1) (isconf #q2) (isgrasp o9 #g5))
          :effect (isholdingmotion #q1 #t174 #q2 o9 #g5)
   )
   (:action s191_plan-holding-motion
          :parameters (#q1 #q3 o8 #g0)
          :precondition (and (isconf #q1) (isconf #q3) (isgrasp o8 #g0))
          :effect (isholdingmotion #q1 #t175 #q3 o8 #g0)
   )
   (:action s192_plan-holding-motion
          :parameters (#q1 #q3 o9 #g1)
          :precondition (and (isconf #q1) (isconf #q3) (isgrasp o9 #g1))
          :effect (isholdingmotion #q1 #t176 #q3 o9 #g1)
   )
   (:action s193_plan-holding-motion
          :parameters (#q1 #q3 o8 #g2)
          :precondition (and (isconf #q1) (isconf #q3) (isgrasp o8 #g2))
          :effect (isholdingmotion #q1 #t177 #q3 o8 #g2)
   )
   (:action s194_plan-holding-motion
          :parameters (#q1 #q3 o8 #g3)
          :precondition (and (isconf #q1) (isconf #q3) (isgrasp o8 #g3))
          :effect (isholdingmotion #q1 #t178 #q3 o8 #g3)
   )
   (:action s195_plan-holding-motion
          :parameters (#q1 #q3 o9 #g4)
          :precondition (and (isconf #q1) (isconf #q3) (isgrasp o9 #g4))
          :effect (isholdingmotion #q1 #t179 #q3 o9 #g4)
   )
   (:action s196_plan-holding-motion
          :parameters (#q1 #q3 o9 #g5)
          :precondition (and (isconf #q1) (isconf #q3) (isgrasp o9 #g5))
          :effect (isholdingmotion #q1 #t180 #q3 o9 #g5)
   )
   (:action s197_plan-holding-motion
          :parameters (#q1 #q4 o8 #g0)
          :precondition (and (isconf #q1) (isconf #q4) (isgrasp o8 #g0))
          :effect (isholdingmotion #q1 #t181 #q4 o8 #g0)
   )
   (:action s198_plan-holding-motion
          :parameters (#q1 #q4 o9 #g1)
          :precondition (and (isconf #q1) (isconf #q4) (isgrasp o9 #g1))
          :effect (isholdingmotion #q1 #t182 #q4 o9 #g1)
   )
   (:action s199_plan-holding-motion
          :parameters (#q1 #q4 o8 #g2)
          :precondition (and (isconf #q1) (isconf #q4) (isgrasp o8 #g2))
          :effect (isholdingmotion #q1 #t183 #q4 o8 #g2)
   )
   (:action s200_plan-holding-motion
          :parameters (#q1 #q4 o8 #g3)
          :precondition (and (isconf #q1) (isconf #q4) (isgrasp o8 #g3))
          :effect (isholdingmotion #q1 #t184 #q4 o8 #g3)
   )
   (:action s201_plan-holding-motion
          :parameters (#q1 #q4 o9 #g4)
          :precondition (and (isconf #q1) (isconf #q4) (isgrasp o9 #g4))
          :effect (isholdingmotion #q1 #t185 #q4 o9 #g4)
   )
   (:action s202_plan-holding-motion
          :parameters (#q1 #q4 o9 #g5)
          :precondition (and (isconf #q1) (isconf #q4) (isgrasp o9 #g5))
          :effect (isholdingmotion #q1 #t186 #q4 o9 #g5)
   )
   (:action s203_plan-holding-motion
          :parameters (#q1 #q5 o8 #g0)
          :precondition (and (isconf #q1) (isconf #q5) (isgrasp o8 #g0))
          :effect (isholdingmotion #q1 #t187 #q5 o8 #g0)
   )
   (:action s204_plan-holding-motion
          :parameters (#q1 #q5 o9 #g1)
          :precondition (and (isconf #q1) (isconf #q5) (isgrasp o9 #g1))
          :effect (isholdingmotion #q1 #t188 #q5 o9 #g1)
   )
   (:action s205_plan-holding-motion
          :parameters (#q1 #q5 o8 #g2)
          :precondition (and (isconf #q1) (isconf #q5) (isgrasp o8 #g2))
          :effect (isholdingmotion #q1 #t189 #q5 o8 #g2)
   )
   (:action s206_plan-holding-motion
          :parameters (#q1 #q5 o8 #g3)
          :precondition (and (isconf #q1) (isconf #q5) (isgrasp o8 #g3))
          :effect (isholdingmotion #q1 #t190 #q5 o8 #g3)
   )
   (:action s207_plan-holding-motion
          :parameters (#q1 #q5 o9 #g4)
          :precondition (and (isconf #q1) (isconf #q5) (isgrasp o9 #g4))
          :effect (isholdingmotion #q1 #t191 #q5 o9 #g4)
   )
   (:action s208_plan-holding-motion
          :parameters (#q1 #q5 o9 #g5)
          :precondition (and (isconf #q1) (isconf #q5) (isgrasp o9 #g5))
          :effect (isholdingmotion #q1 #t192 #q5 o9 #g5)
   )
   (:action s209_plan-holding-motion
          :parameters (#q2 q808 o8 #g0)
          :precondition (and (isconf #q2) (isconf q808) (isgrasp o8 #g0))
          :effect (isholdingmotion #q2 #t193 q808 o8 #g0)
   )
   (:action s210_plan-holding-motion
          :parameters (#q2 q808 o9 #g1)
          :precondition (and (isconf #q2) (isconf q808) (isgrasp o9 #g1))
          :effect (isholdingmotion #q2 #t194 q808 o9 #g1)
   )
   (:action s211_plan-holding-motion
          :parameters (#q2 q808 o8 #g2)
          :precondition (and (isconf #q2) (isconf q808) (isgrasp o8 #g2))
          :effect (isholdingmotion #q2 #t195 q808 o8 #g2)
   )
   (:action s212_plan-holding-motion
          :parameters (#q2 q808 o8 #g3)
          :precondition (and (isconf #q2) (isconf q808) (isgrasp o8 #g3))
          :effect (isholdingmotion #q2 #t196 q808 o8 #g3)
   )
   (:action s213_plan-holding-motion
          :parameters (#q2 q808 o9 #g4)
          :precondition (and (isconf #q2) (isconf q808) (isgrasp o9 #g4))
          :effect (isholdingmotion #q2 #t197 q808 o9 #g4)
   )
   (:action s214_plan-holding-motion
          :parameters (#q2 q808 o9 #g5)
          :precondition (and (isconf #q2) (isconf q808) (isgrasp o9 #g5))
          :effect (isholdingmotion #q2 #t198 q808 o9 #g5)
   )
   (:action s215_plan-holding-motion
          :parameters (#q2 #q0 o8 #g0)
          :precondition (and (isconf #q2) (isconf #q0) (isgrasp o8 #g0))
          :effect (isholdingmotion #q2 #t199 #q0 o8 #g0)
   )
   (:action s216_plan-holding-motion
          :parameters (#q2 #q0 o9 #g1)
          :precondition (and (isconf #q2) (isconf #q0) (isgrasp o9 #g1))
          :effect (isholdingmotion #q2 #t200 #q0 o9 #g1)
   )
   (:action s217_plan-holding-motion
          :parameters (#q2 #q0 o8 #g2)
          :precondition (and (isconf #q2) (isconf #q0) (isgrasp o8 #g2))
          :effect (isholdingmotion #q2 #t201 #q0 o8 #g2)
   )
   (:action s218_plan-holding-motion
          :parameters (#q2 #q0 o8 #g3)
          :precondition (and (isconf #q2) (isconf #q0) (isgrasp o8 #g3))
          :effect (isholdingmotion #q2 #t202 #q0 o8 #g3)
   )
   (:action s219_plan-holding-motion
          :parameters (#q2 #q0 o9 #g4)
          :precondition (and (isconf #q2) (isconf #q0) (isgrasp o9 #g4))
          :effect (isholdingmotion #q2 #t203 #q0 o9 #g4)
   )
   (:action s220_plan-holding-motion
          :parameters (#q2 #q0 o9 #g5)
          :precondition (and (isconf #q2) (isconf #q0) (isgrasp o9 #g5))
          :effect (isholdingmotion #q2 #t204 #q0 o9 #g5)
   )
   (:action s221_plan-holding-motion
          :parameters (#q2 #q1 o8 #g0)
          :precondition (and (isconf #q2) (isconf #q1) (isgrasp o8 #g0))
          :effect (isholdingmotion #q2 #t205 #q1 o8 #g0)
   )
   (:action s222_plan-holding-motion
          :parameters (#q2 #q1 o9 #g1)
          :precondition (and (isconf #q2) (isconf #q1) (isgrasp o9 #g1))
          :effect (isholdingmotion #q2 #t206 #q1 o9 #g1)
   )
   (:action s223_plan-holding-motion
          :parameters (#q2 #q1 o8 #g2)
          :precondition (and (isconf #q2) (isconf #q1) (isgrasp o8 #g2))
          :effect (isholdingmotion #q2 #t207 #q1 o8 #g2)
   )
   (:action s224_plan-holding-motion
          :parameters (#q2 #q1 o8 #g3)
          :precondition (and (isconf #q2) (isconf #q1) (isgrasp o8 #g3))
          :effect (isholdingmotion #q2 #t208 #q1 o8 #g3)
   )
   (:action s225_plan-holding-motion
          :parameters (#q2 #q1 o9 #g4)
          :precondition (and (isconf #q2) (isconf #q1) (isgrasp o9 #g4))
          :effect (isholdingmotion #q2 #t209 #q1 o9 #g4)
   )
   (:action s226_plan-holding-motion
          :parameters (#q2 #q1 o9 #g5)
          :precondition (and (isconf #q2) (isconf #q1) (isgrasp o9 #g5))
          :effect (isholdingmotion #q2 #t210 #q1 o9 #g5)
   )
   (:action s227_plan-holding-motion
          :parameters (#q2 #q2 o8 #g0)
          :precondition (and (isconf #q2) (isconf #q2) (isgrasp o8 #g0))
          :effect (isholdingmotion #q2 #t211 #q2 o8 #g0)
   )
   (:action s228_plan-holding-motion
          :parameters (#q2 #q2 o9 #g1)
          :precondition (and (isconf #q2) (isconf #q2) (isgrasp o9 #g1))
          :effect (isholdingmotion #q2 #t212 #q2 o9 #g1)
   )
   (:action s229_plan-holding-motion
          :parameters (#q2 #q2 o8 #g2)
          :precondition (and (isconf #q2) (isconf #q2) (isgrasp o8 #g2))
          :effect (isholdingmotion #q2 #t213 #q2 o8 #g2)
   )
   (:action s230_plan-holding-motion
          :parameters (#q2 #q2 o8 #g3)
          :precondition (and (isconf #q2) (isconf #q2) (isgrasp o8 #g3))
          :effect (isholdingmotion #q2 #t214 #q2 o8 #g3)
   )
   (:action s231_plan-holding-motion
          :parameters (#q2 #q2 o9 #g4)
          :precondition (and (isconf #q2) (isconf #q2) (isgrasp o9 #g4))
          :effect (isholdingmotion #q2 #t215 #q2 o9 #g4)
   )
   (:action s232_plan-holding-motion
          :parameters (#q2 #q2 o9 #g5)
          :precondition (and (isconf #q2) (isconf #q2) (isgrasp o9 #g5))
          :effect (isholdingmotion #q2 #t216 #q2 o9 #g5)
   )
   (:action s233_plan-holding-motion
          :parameters (#q2 #q3 o8 #g0)
          :precondition (and (isconf #q2) (isconf #q3) (isgrasp o8 #g0))
          :effect (isholdingmotion #q2 #t217 #q3 o8 #g0)
   )
   (:action s234_plan-holding-motion
          :parameters (#q2 #q3 o9 #g1)
          :precondition (and (isconf #q2) (isconf #q3) (isgrasp o9 #g1))
          :effect (isholdingmotion #q2 #t218 #q3 o9 #g1)
   )
   (:action s235_plan-holding-motion
          :parameters (#q2 #q3 o8 #g2)
          :precondition (and (isconf #q2) (isconf #q3) (isgrasp o8 #g2))
          :effect (isholdingmotion #q2 #t219 #q3 o8 #g2)
   )
   (:action s236_plan-holding-motion
          :parameters (#q2 #q3 o8 #g3)
          :precondition (and (isconf #q2) (isconf #q3) (isgrasp o8 #g3))
          :effect (isholdingmotion #q2 #t220 #q3 o8 #g3)
   )
   (:action s237_plan-holding-motion
          :parameters (#q2 #q3 o9 #g4)
          :precondition (and (isconf #q2) (isconf #q3) (isgrasp o9 #g4))
          :effect (isholdingmotion #q2 #t221 #q3 o9 #g4)
   )
   (:action s238_plan-holding-motion
          :parameters (#q2 #q3 o9 #g5)
          :precondition (and (isconf #q2) (isconf #q3) (isgrasp o9 #g5))
          :effect (isholdingmotion #q2 #t222 #q3 o9 #g5)
   )
   (:action s239_plan-holding-motion
          :parameters (#q2 #q4 o8 #g0)
          :precondition (and (isconf #q2) (isconf #q4) (isgrasp o8 #g0))
          :effect (isholdingmotion #q2 #t223 #q4 o8 #g0)
   )
   (:action s240_plan-holding-motion
          :parameters (#q2 #q4 o9 #g1)
          :precondition (and (isconf #q2) (isconf #q4) (isgrasp o9 #g1))
          :effect (isholdingmotion #q2 #t224 #q4 o9 #g1)
   )
   (:action s241_plan-holding-motion
          :parameters (#q2 #q4 o8 #g2)
          :precondition (and (isconf #q2) (isconf #q4) (isgrasp o8 #g2))
          :effect (isholdingmotion #q2 #t225 #q4 o8 #g2)
   )
   (:action s242_plan-holding-motion
          :parameters (#q2 #q4 o8 #g3)
          :precondition (and (isconf #q2) (isconf #q4) (isgrasp o8 #g3))
          :effect (isholdingmotion #q2 #t226 #q4 o8 #g3)
   )
   (:action s243_plan-holding-motion
          :parameters (#q2 #q4 o9 #g4)
          :precondition (and (isconf #q2) (isconf #q4) (isgrasp o9 #g4))
          :effect (isholdingmotion #q2 #t227 #q4 o9 #g4)
   )
   (:action s244_plan-holding-motion
          :parameters (#q2 #q4 o9 #g5)
          :precondition (and (isconf #q2) (isconf #q4) (isgrasp o9 #g5))
          :effect (isholdingmotion #q2 #t228 #q4 o9 #g5)
   )
   (:action s245_plan-holding-motion
          :parameters (#q2 #q5 o8 #g0)
          :precondition (and (isconf #q2) (isconf #q5) (isgrasp o8 #g0))
          :effect (isholdingmotion #q2 #t229 #q5 o8 #g0)
   )
   (:action s246_plan-holding-motion
          :parameters (#q2 #q5 o9 #g1)
          :precondition (and (isconf #q2) (isconf #q5) (isgrasp o9 #g1))
          :effect (isholdingmotion #q2 #t230 #q5 o9 #g1)
   )
   (:action s247_plan-holding-motion
          :parameters (#q2 #q5 o8 #g2)
          :precondition (and (isconf #q2) (isconf #q5) (isgrasp o8 #g2))
          :effect (isholdingmotion #q2 #t231 #q5 o8 #g2)
   )
   (:action s248_plan-holding-motion
          :parameters (#q2 #q5 o8 #g3)
          :precondition (and (isconf #q2) (isconf #q5) (isgrasp o8 #g3))
          :effect (isholdingmotion #q2 #t232 #q5 o8 #g3)
   )
   (:action s249_plan-holding-motion
          :parameters (#q2 #q5 o9 #g4)
          :precondition (and (isconf #q2) (isconf #q5) (isgrasp o9 #g4))
          :effect (isholdingmotion #q2 #t233 #q5 o9 #g4)
   )
   (:action s250_plan-holding-motion
          :parameters (#q2 #q5 o9 #g5)
          :precondition (and (isconf #q2) (isconf #q5) (isgrasp o9 #g5))
          :effect (isholdingmotion #q2 #t234 #q5 o9 #g5)
   )
   (:action s251_plan-holding-motion
          :parameters (#q3 q808 o8 #g0)
          :precondition (and (isconf #q3) (isconf q808) (isgrasp o8 #g0))
          :effect (isholdingmotion #q3 #t235 q808 o8 #g0)
   )
   (:action s252_plan-holding-motion
          :parameters (#q3 q808 o9 #g1)
          :precondition (and (isconf #q3) (isconf q808) (isgrasp o9 #g1))
          :effect (isholdingmotion #q3 #t236 q808 o9 #g1)
   )
   (:action s253_plan-holding-motion
          :parameters (#q3 q808 o8 #g2)
          :precondition (and (isconf #q3) (isconf q808) (isgrasp o8 #g2))
          :effect (isholdingmotion #q3 #t237 q808 o8 #g2)
   )
   (:action s254_plan-holding-motion
          :parameters (#q3 q808 o8 #g3)
          :precondition (and (isconf #q3) (isconf q808) (isgrasp o8 #g3))
          :effect (isholdingmotion #q3 #t238 q808 o8 #g3)
   )
   (:action s255_plan-holding-motion
          :parameters (#q3 q808 o9 #g4)
          :precondition (and (isconf #q3) (isconf q808) (isgrasp o9 #g4))
          :effect (isholdingmotion #q3 #t239 q808 o9 #g4)
   )
   (:action s256_plan-holding-motion
          :parameters (#q3 q808 o9 #g5)
          :precondition (and (isconf #q3) (isconf q808) (isgrasp o9 #g5))
          :effect (isholdingmotion #q3 #t240 q808 o9 #g5)
   )
   (:action s257_plan-holding-motion
          :parameters (#q3 #q0 o8 #g0)
          :precondition (and (isconf #q3) (isconf #q0) (isgrasp o8 #g0))
          :effect (isholdingmotion #q3 #t241 #q0 o8 #g0)
   )
   (:action s258_plan-holding-motion
          :parameters (#q3 #q0 o9 #g1)
          :precondition (and (isconf #q3) (isconf #q0) (isgrasp o9 #g1))
          :effect (isholdingmotion #q3 #t242 #q0 o9 #g1)
   )
   (:action s259_plan-holding-motion
          :parameters (#q3 #q0 o8 #g2)
          :precondition (and (isconf #q3) (isconf #q0) (isgrasp o8 #g2))
          :effect (isholdingmotion #q3 #t243 #q0 o8 #g2)
   )
   (:action s260_plan-holding-motion
          :parameters (#q3 #q0 o8 #g3)
          :precondition (and (isconf #q3) (isconf #q0) (isgrasp o8 #g3))
          :effect (isholdingmotion #q3 #t244 #q0 o8 #g3)
   )
   (:action s261_plan-holding-motion
          :parameters (#q3 #q0 o9 #g4)
          :precondition (and (isconf #q3) (isconf #q0) (isgrasp o9 #g4))
          :effect (isholdingmotion #q3 #t245 #q0 o9 #g4)
   )
   (:action s262_plan-holding-motion
          :parameters (#q3 #q0 o9 #g5)
          :precondition (and (isconf #q3) (isconf #q0) (isgrasp o9 #g5))
          :effect (isholdingmotion #q3 #t246 #q0 o9 #g5)
   )
   (:action s263_plan-holding-motion
          :parameters (#q3 #q1 o8 #g0)
          :precondition (and (isconf #q3) (isconf #q1) (isgrasp o8 #g0))
          :effect (isholdingmotion #q3 #t247 #q1 o8 #g0)
   )
   (:action s264_plan-holding-motion
          :parameters (#q3 #q1 o9 #g1)
          :precondition (and (isconf #q3) (isconf #q1) (isgrasp o9 #g1))
          :effect (isholdingmotion #q3 #t248 #q1 o9 #g1)
   )
   (:action s265_plan-holding-motion
          :parameters (#q3 #q1 o8 #g2)
          :precondition (and (isconf #q3) (isconf #q1) (isgrasp o8 #g2))
          :effect (isholdingmotion #q3 #t249 #q1 o8 #g2)
   )
   (:action s266_plan-holding-motion
          :parameters (#q3 #q1 o8 #g3)
          :precondition (and (isconf #q3) (isconf #q1) (isgrasp o8 #g3))
          :effect (isholdingmotion #q3 #t250 #q1 o8 #g3)
   )
   (:action s267_plan-holding-motion
          :parameters (#q3 #q1 o9 #g4)
          :precondition (and (isconf #q3) (isconf #q1) (isgrasp o9 #g4))
          :effect (isholdingmotion #q3 #t251 #q1 o9 #g4)
   )
   (:action s268_plan-holding-motion
          :parameters (#q3 #q1 o9 #g5)
          :precondition (and (isconf #q3) (isconf #q1) (isgrasp o9 #g5))
          :effect (isholdingmotion #q3 #t252 #q1 o9 #g5)
   )
   (:action s269_plan-holding-motion
          :parameters (#q3 #q2 o8 #g0)
          :precondition (and (isconf #q3) (isconf #q2) (isgrasp o8 #g0))
          :effect (isholdingmotion #q3 #t253 #q2 o8 #g0)
   )
   (:action s270_plan-holding-motion
          :parameters (#q3 #q2 o9 #g1)
          :precondition (and (isconf #q3) (isconf #q2) (isgrasp o9 #g1))
          :effect (isholdingmotion #q3 #t254 #q2 o9 #g1)
   )
   (:action s271_plan-holding-motion
          :parameters (#q3 #q2 o8 #g2)
          :precondition (and (isconf #q3) (isconf #q2) (isgrasp o8 #g2))
          :effect (isholdingmotion #q3 #t255 #q2 o8 #g2)
   )
   (:action s272_plan-holding-motion
          :parameters (#q3 #q2 o8 #g3)
          :precondition (and (isconf #q3) (isconf #q2) (isgrasp o8 #g3))
          :effect (isholdingmotion #q3 #t256 #q2 o8 #g3)
   )
   (:action s273_plan-holding-motion
          :parameters (#q3 #q2 o9 #g4)
          :precondition (and (isconf #q3) (isconf #q2) (isgrasp o9 #g4))
          :effect (isholdingmotion #q3 #t257 #q2 o9 #g4)
   )
   (:action s274_plan-holding-motion
          :parameters (#q3 #q2 o9 #g5)
          :precondition (and (isconf #q3) (isconf #q2) (isgrasp o9 #g5))
          :effect (isholdingmotion #q3 #t258 #q2 o9 #g5)
   )
   (:action s275_plan-holding-motion
          :parameters (#q3 #q3 o8 #g0)
          :precondition (and (isconf #q3) (isconf #q3) (isgrasp o8 #g0))
          :effect (isholdingmotion #q3 #t259 #q3 o8 #g0)
   )
   (:action s276_plan-holding-motion
          :parameters (#q3 #q3 o9 #g1)
          :precondition (and (isconf #q3) (isconf #q3) (isgrasp o9 #g1))
          :effect (isholdingmotion #q3 #t260 #q3 o9 #g1)
   )
   (:action s277_plan-holding-motion
          :parameters (#q3 #q3 o8 #g2)
          :precondition (and (isconf #q3) (isconf #q3) (isgrasp o8 #g2))
          :effect (isholdingmotion #q3 #t261 #q3 o8 #g2)
   )
   (:action s278_plan-holding-motion
          :parameters (#q3 #q3 o8 #g3)
          :precondition (and (isconf #q3) (isconf #q3) (isgrasp o8 #g3))
          :effect (isholdingmotion #q3 #t262 #q3 o8 #g3)
   )
   (:action s279_plan-holding-motion
          :parameters (#q3 #q3 o9 #g4)
          :precondition (and (isconf #q3) (isconf #q3) (isgrasp o9 #g4))
          :effect (isholdingmotion #q3 #t263 #q3 o9 #g4)
   )
   (:action s280_plan-holding-motion
          :parameters (#q3 #q3 o9 #g5)
          :precondition (and (isconf #q3) (isconf #q3) (isgrasp o9 #g5))
          :effect (isholdingmotion #q3 #t264 #q3 o9 #g5)
   )
   (:action s281_plan-holding-motion
          :parameters (#q3 #q4 o8 #g0)
          :precondition (and (isconf #q3) (isconf #q4) (isgrasp o8 #g0))
          :effect (isholdingmotion #q3 #t265 #q4 o8 #g0)
   )
   (:action s282_plan-holding-motion
          :parameters (#q3 #q4 o9 #g1)
          :precondition (and (isconf #q3) (isconf #q4) (isgrasp o9 #g1))
          :effect (isholdingmotion #q3 #t266 #q4 o9 #g1)
   )
   (:action s283_plan-holding-motion
          :parameters (#q3 #q4 o8 #g2)
          :precondition (and (isconf #q3) (isconf #q4) (isgrasp o8 #g2))
          :effect (isholdingmotion #q3 #t267 #q4 o8 #g2)
   )
   (:action s284_plan-holding-motion
          :parameters (#q3 #q4 o8 #g3)
          :precondition (and (isconf #q3) (isconf #q4) (isgrasp o8 #g3))
          :effect (isholdingmotion #q3 #t268 #q4 o8 #g3)
   )
   (:action s285_plan-holding-motion
          :parameters (#q3 #q4 o9 #g4)
          :precondition (and (isconf #q3) (isconf #q4) (isgrasp o9 #g4))
          :effect (isholdingmotion #q3 #t269 #q4 o9 #g4)
   )
   (:action s286_plan-holding-motion
          :parameters (#q3 #q4 o9 #g5)
          :precondition (and (isconf #q3) (isconf #q4) (isgrasp o9 #g5))
          :effect (isholdingmotion #q3 #t270 #q4 o9 #g5)
   )
   (:action s287_plan-holding-motion
          :parameters (#q3 #q5 o8 #g0)
          :precondition (and (isconf #q3) (isconf #q5) (isgrasp o8 #g0))
          :effect (isholdingmotion #q3 #t271 #q5 o8 #g0)
   )
   (:action s288_plan-holding-motion
          :parameters (#q3 #q5 o9 #g1)
          :precondition (and (isconf #q3) (isconf #q5) (isgrasp o9 #g1))
          :effect (isholdingmotion #q3 #t272 #q5 o9 #g1)
   )
   (:action s289_plan-holding-motion
          :parameters (#q3 #q5 o8 #g2)
          :precondition (and (isconf #q3) (isconf #q5) (isgrasp o8 #g2))
          :effect (isholdingmotion #q3 #t273 #q5 o8 #g2)
   )
   (:action s290_plan-holding-motion
          :parameters (#q3 #q5 o8 #g3)
          :precondition (and (isconf #q3) (isconf #q5) (isgrasp o8 #g3))
          :effect (isholdingmotion #q3 #t274 #q5 o8 #g3)
   )
   (:action s291_plan-holding-motion
          :parameters (#q3 #q5 o9 #g4)
          :precondition (and (isconf #q3) (isconf #q5) (isgrasp o9 #g4))
          :effect (isholdingmotion #q3 #t275 #q5 o9 #g4)
   )
   (:action s292_plan-holding-motion
          :parameters (#q3 #q5 o9 #g5)
          :precondition (and (isconf #q3) (isconf #q5) (isgrasp o9 #g5))
          :effect (isholdingmotion #q3 #t276 #q5 o9 #g5)
   )
   (:action s293_plan-holding-motion
          :parameters (#q4 q808 o8 #g0)
          :precondition (and (isconf #q4) (isconf q808) (isgrasp o8 #g0))
          :effect (isholdingmotion #q4 #t277 q808 o8 #g0)
   )
   (:action s294_plan-holding-motion
          :parameters (#q4 q808 o9 #g1)
          :precondition (and (isconf #q4) (isconf q808) (isgrasp o9 #g1))
          :effect (isholdingmotion #q4 #t278 q808 o9 #g1)
   )
   (:action s295_plan-holding-motion
          :parameters (#q4 q808 o8 #g2)
          :precondition (and (isconf #q4) (isconf q808) (isgrasp o8 #g2))
          :effect (isholdingmotion #q4 #t279 q808 o8 #g2)
   )
   (:action s296_plan-holding-motion
          :parameters (#q4 q808 o8 #g3)
          :precondition (and (isconf #q4) (isconf q808) (isgrasp o8 #g3))
          :effect (isholdingmotion #q4 #t280 q808 o8 #g3)
   )
   (:action s297_plan-holding-motion
          :parameters (#q4 q808 o9 #g4)
          :precondition (and (isconf #q4) (isconf q808) (isgrasp o9 #g4))
          :effect (isholdingmotion #q4 #t281 q808 o9 #g4)
   )
   (:action s298_plan-holding-motion
          :parameters (#q4 q808 o9 #g5)
          :precondition (and (isconf #q4) (isconf q808) (isgrasp o9 #g5))
          :effect (isholdingmotion #q4 #t282 q808 o9 #g5)
   )
   (:action s299_plan-holding-motion
          :parameters (#q4 #q0 o8 #g0)
          :precondition (and (isconf #q4) (isconf #q0) (isgrasp o8 #g0))
          :effect (isholdingmotion #q4 #t283 #q0 o8 #g0)
   )
   (:action s300_plan-holding-motion
          :parameters (#q4 #q0 o9 #g1)
          :precondition (and (isconf #q4) (isconf #q0) (isgrasp o9 #g1))
          :effect (isholdingmotion #q4 #t284 #q0 o9 #g1)
   )
   (:action s301_plan-holding-motion
          :parameters (#q4 #q0 o8 #g2)
          :precondition (and (isconf #q4) (isconf #q0) (isgrasp o8 #g2))
          :effect (isholdingmotion #q4 #t285 #q0 o8 #g2)
   )
   (:action s302_plan-holding-motion
          :parameters (#q4 #q0 o8 #g3)
          :precondition (and (isconf #q4) (isconf #q0) (isgrasp o8 #g3))
          :effect (isholdingmotion #q4 #t286 #q0 o8 #g3)
   )
   (:action s303_plan-holding-motion
          :parameters (#q4 #q0 o9 #g4)
          :precondition (and (isconf #q4) (isconf #q0) (isgrasp o9 #g4))
          :effect (isholdingmotion #q4 #t287 #q0 o9 #g4)
   )
   (:action s304_plan-holding-motion
          :parameters (#q4 #q0 o9 #g5)
          :precondition (and (isconf #q4) (isconf #q0) (isgrasp o9 #g5))
          :effect (isholdingmotion #q4 #t288 #q0 o9 #g5)
   )
   (:action s305_plan-holding-motion
          :parameters (#q4 #q1 o8 #g0)
          :precondition (and (isconf #q4) (isconf #q1) (isgrasp o8 #g0))
          :effect (isholdingmotion #q4 #t289 #q1 o8 #g0)
   )
   (:action s306_plan-holding-motion
          :parameters (#q4 #q1 o9 #g1)
          :precondition (and (isconf #q4) (isconf #q1) (isgrasp o9 #g1))
          :effect (isholdingmotion #q4 #t290 #q1 o9 #g1)
   )
   (:action s307_plan-holding-motion
          :parameters (#q4 #q1 o8 #g2)
          :precondition (and (isconf #q4) (isconf #q1) (isgrasp o8 #g2))
          :effect (isholdingmotion #q4 #t291 #q1 o8 #g2)
   )
   (:action s308_plan-holding-motion
          :parameters (#q4 #q1 o8 #g3)
          :precondition (and (isconf #q4) (isconf #q1) (isgrasp o8 #g3))
          :effect (isholdingmotion #q4 #t292 #q1 o8 #g3)
   )
   (:action s309_plan-holding-motion
          :parameters (#q4 #q1 o9 #g4)
          :precondition (and (isconf #q4) (isconf #q1) (isgrasp o9 #g4))
          :effect (isholdingmotion #q4 #t293 #q1 o9 #g4)
   )
   (:action s310_plan-holding-motion
          :parameters (#q4 #q1 o9 #g5)
          :precondition (and (isconf #q4) (isconf #q1) (isgrasp o9 #g5))
          :effect (isholdingmotion #q4 #t294 #q1 o9 #g5)
   )
   (:action s311_plan-holding-motion
          :parameters (#q4 #q2 o8 #g0)
          :precondition (and (isconf #q4) (isconf #q2) (isgrasp o8 #g0))
          :effect (isholdingmotion #q4 #t295 #q2 o8 #g0)
   )
   (:action s312_plan-holding-motion
          :parameters (#q4 #q2 o9 #g1)
          :precondition (and (isconf #q4) (isconf #q2) (isgrasp o9 #g1))
          :effect (isholdingmotion #q4 #t296 #q2 o9 #g1)
   )
   (:action s313_plan-holding-motion
          :parameters (#q4 #q2 o8 #g2)
          :precondition (and (isconf #q4) (isconf #q2) (isgrasp o8 #g2))
          :effect (isholdingmotion #q4 #t297 #q2 o8 #g2)
   )
   (:action s314_plan-holding-motion
          :parameters (#q4 #q2 o8 #g3)
          :precondition (and (isconf #q4) (isconf #q2) (isgrasp o8 #g3))
          :effect (isholdingmotion #q4 #t298 #q2 o8 #g3)
   )
   (:action s315_plan-holding-motion
          :parameters (#q4 #q2 o9 #g4)
          :precondition (and (isconf #q4) (isconf #q2) (isgrasp o9 #g4))
          :effect (isholdingmotion #q4 #t299 #q2 o9 #g4)
   )
   (:action s316_plan-holding-motion
          :parameters (#q4 #q2 o9 #g5)
          :precondition (and (isconf #q4) (isconf #q2) (isgrasp o9 #g5))
          :effect (isholdingmotion #q4 #t300 #q2 o9 #g5)
   )
   (:action s317_plan-holding-motion
          :parameters (#q4 #q3 o8 #g0)
          :precondition (and (isconf #q4) (isconf #q3) (isgrasp o8 #g0))
          :effect (isholdingmotion #q4 #t301 #q3 o8 #g0)
   )
   (:action s318_plan-holding-motion
          :parameters (#q4 #q3 o9 #g1)
          :precondition (and (isconf #q4) (isconf #q3) (isgrasp o9 #g1))
          :effect (isholdingmotion #q4 #t302 #q3 o9 #g1)
   )
   (:action s319_plan-holding-motion
          :parameters (#q4 #q3 o8 #g2)
          :precondition (and (isconf #q4) (isconf #q3) (isgrasp o8 #g2))
          :effect (isholdingmotion #q4 #t303 #q3 o8 #g2)
   )
   (:action s320_plan-holding-motion
          :parameters (#q4 #q3 o8 #g3)
          :precondition (and (isconf #q4) (isconf #q3) (isgrasp o8 #g3))
          :effect (isholdingmotion #q4 #t304 #q3 o8 #g3)
   )
   (:action s321_plan-holding-motion
          :parameters (#q4 #q3 o9 #g4)
          :precondition (and (isconf #q4) (isconf #q3) (isgrasp o9 #g4))
          :effect (isholdingmotion #q4 #t305 #q3 o9 #g4)
   )
   (:action s322_plan-holding-motion
          :parameters (#q4 #q3 o9 #g5)
          :precondition (and (isconf #q4) (isconf #q3) (isgrasp o9 #g5))
          :effect (isholdingmotion #q4 #t306 #q3 o9 #g5)
   )
   (:action s323_plan-holding-motion
          :parameters (#q4 #q4 o8 #g0)
          :precondition (and (isconf #q4) (isconf #q4) (isgrasp o8 #g0))
          :effect (isholdingmotion #q4 #t307 #q4 o8 #g0)
   )
   (:action s324_plan-holding-motion
          :parameters (#q4 #q4 o9 #g1)
          :precondition (and (isconf #q4) (isconf #q4) (isgrasp o9 #g1))
          :effect (isholdingmotion #q4 #t308 #q4 o9 #g1)
   )
   (:action s325_plan-holding-motion
          :parameters (#q4 #q4 o8 #g2)
          :precondition (and (isconf #q4) (isconf #q4) (isgrasp o8 #g2))
          :effect (isholdingmotion #q4 #t309 #q4 o8 #g2)
   )
   (:action s326_plan-holding-motion
          :parameters (#q4 #q4 o8 #g3)
          :precondition (and (isconf #q4) (isconf #q4) (isgrasp o8 #g3))
          :effect (isholdingmotion #q4 #t310 #q4 o8 #g3)
   )
   (:action s327_plan-holding-motion
          :parameters (#q4 #q4 o9 #g4)
          :precondition (and (isconf #q4) (isconf #q4) (isgrasp o9 #g4))
          :effect (isholdingmotion #q4 #t311 #q4 o9 #g4)
   )
   (:action s328_plan-holding-motion
          :parameters (#q4 #q4 o9 #g5)
          :precondition (and (isconf #q4) (isconf #q4) (isgrasp o9 #g5))
          :effect (isholdingmotion #q4 #t312 #q4 o9 #g5)
   )
   (:action s329_plan-holding-motion
          :parameters (#q4 #q5 o8 #g0)
          :precondition (and (isconf #q4) (isconf #q5) (isgrasp o8 #g0))
          :effect (isholdingmotion #q4 #t313 #q5 o8 #g0)
   )
   (:action s330_plan-holding-motion
          :parameters (#q4 #q5 o9 #g1)
          :precondition (and (isconf #q4) (isconf #q5) (isgrasp o9 #g1))
          :effect (isholdingmotion #q4 #t314 #q5 o9 #g1)
   )
   (:action s331_plan-holding-motion
          :parameters (#q4 #q5 o8 #g2)
          :precondition (and (isconf #q4) (isconf #q5) (isgrasp o8 #g2))
          :effect (isholdingmotion #q4 #t315 #q5 o8 #g2)
   )
   (:action s332_plan-holding-motion
          :parameters (#q4 #q5 o8 #g3)
          :precondition (and (isconf #q4) (isconf #q5) (isgrasp o8 #g3))
          :effect (isholdingmotion #q4 #t316 #q5 o8 #g3)
   )
   (:action s333_plan-holding-motion
          :parameters (#q4 #q5 o9 #g4)
          :precondition (and (isconf #q4) (isconf #q5) (isgrasp o9 #g4))
          :effect (isholdingmotion #q4 #t317 #q5 o9 #g4)
   )
   (:action s334_plan-holding-motion
          :parameters (#q4 #q5 o9 #g5)
          :precondition (and (isconf #q4) (isconf #q5) (isgrasp o9 #g5))
          :effect (isholdingmotion #q4 #t318 #q5 o9 #g5)
   )
   (:action s335_plan-holding-motion
          :parameters (#q5 q808 o8 #g0)
          :precondition (and (isconf #q5) (isconf q808) (isgrasp o8 #g0))
          :effect (isholdingmotion #q5 #t319 q808 o8 #g0)
   )
   (:action s336_plan-holding-motion
          :parameters (#q5 q808 o9 #g1)
          :precondition (and (isconf #q5) (isconf q808) (isgrasp o9 #g1))
          :effect (isholdingmotion #q5 #t320 q808 o9 #g1)
   )
   (:action s337_plan-holding-motion
          :parameters (#q5 q808 o8 #g2)
          :precondition (and (isconf #q5) (isconf q808) (isgrasp o8 #g2))
          :effect (isholdingmotion #q5 #t321 q808 o8 #g2)
   )
   (:action s338_plan-holding-motion
          :parameters (#q5 q808 o8 #g3)
          :precondition (and (isconf #q5) (isconf q808) (isgrasp o8 #g3))
          :effect (isholdingmotion #q5 #t322 q808 o8 #g3)
   )
   (:action s339_plan-holding-motion
          :parameters (#q5 q808 o9 #g4)
          :precondition (and (isconf #q5) (isconf q808) (isgrasp o9 #g4))
          :effect (isholdingmotion #q5 #t323 q808 o9 #g4)
   )
   (:action s340_plan-holding-motion
          :parameters (#q5 q808 o9 #g5)
          :precondition (and (isconf #q5) (isconf q808) (isgrasp o9 #g5))
          :effect (isholdingmotion #q5 #t324 q808 o9 #g5)
   )
   (:action s341_plan-holding-motion
          :parameters (#q5 #q0 o8 #g0)
          :precondition (and (isconf #q5) (isconf #q0) (isgrasp o8 #g0))
          :effect (isholdingmotion #q5 #t325 #q0 o8 #g0)
   )
   (:action s342_plan-holding-motion
          :parameters (#q5 #q0 o9 #g1)
          :precondition (and (isconf #q5) (isconf #q0) (isgrasp o9 #g1))
          :effect (isholdingmotion #q5 #t326 #q0 o9 #g1)
   )
   (:action s343_plan-holding-motion
          :parameters (#q5 #q0 o8 #g2)
          :precondition (and (isconf #q5) (isconf #q0) (isgrasp o8 #g2))
          :effect (isholdingmotion #q5 #t327 #q0 o8 #g2)
   )
   (:action s344_plan-holding-motion
          :parameters (#q5 #q0 o8 #g3)
          :precondition (and (isconf #q5) (isconf #q0) (isgrasp o8 #g3))
          :effect (isholdingmotion #q5 #t328 #q0 o8 #g3)
   )
   (:action s345_plan-holding-motion
          :parameters (#q5 #q0 o9 #g4)
          :precondition (and (isconf #q5) (isconf #q0) (isgrasp o9 #g4))
          :effect (isholdingmotion #q5 #t329 #q0 o9 #g4)
   )
   (:action s346_plan-holding-motion
          :parameters (#q5 #q0 o9 #g5)
          :precondition (and (isconf #q5) (isconf #q0) (isgrasp o9 #g5))
          :effect (isholdingmotion #q5 #t330 #q0 o9 #g5)
   )
   (:action s347_plan-holding-motion
          :parameters (#q5 #q1 o8 #g0)
          :precondition (and (isconf #q5) (isconf #q1) (isgrasp o8 #g0))
          :effect (isholdingmotion #q5 #t331 #q1 o8 #g0)
   )
   (:action s348_plan-holding-motion
          :parameters (#q5 #q1 o9 #g1)
          :precondition (and (isconf #q5) (isconf #q1) (isgrasp o9 #g1))
          :effect (isholdingmotion #q5 #t332 #q1 o9 #g1)
   )
   (:action s349_plan-holding-motion
          :parameters (#q5 #q1 o8 #g2)
          :precondition (and (isconf #q5) (isconf #q1) (isgrasp o8 #g2))
          :effect (isholdingmotion #q5 #t333 #q1 o8 #g2)
   )
   (:action s350_plan-holding-motion
          :parameters (#q5 #q1 o8 #g3)
          :precondition (and (isconf #q5) (isconf #q1) (isgrasp o8 #g3))
          :effect (isholdingmotion #q5 #t334 #q1 o8 #g3)
   )
   (:action s351_plan-holding-motion
          :parameters (#q5 #q1 o9 #g4)
          :precondition (and (isconf #q5) (isconf #q1) (isgrasp o9 #g4))
          :effect (isholdingmotion #q5 #t335 #q1 o9 #g4)
   )
   (:action s352_plan-holding-motion
          :parameters (#q5 #q1 o9 #g5)
          :precondition (and (isconf #q5) (isconf #q1) (isgrasp o9 #g5))
          :effect (isholdingmotion #q5 #t336 #q1 o9 #g5)
   )
   (:action s353_plan-holding-motion
          :parameters (#q5 #q2 o8 #g0)
          :precondition (and (isconf #q5) (isconf #q2) (isgrasp o8 #g0))
          :effect (isholdingmotion #q5 #t337 #q2 o8 #g0)
   )
   (:action s354_plan-holding-motion
          :parameters (#q5 #q2 o9 #g1)
          :precondition (and (isconf #q5) (isconf #q2) (isgrasp o9 #g1))
          :effect (isholdingmotion #q5 #t338 #q2 o9 #g1)
   )
   (:action s355_plan-holding-motion
          :parameters (#q5 #q2 o8 #g2)
          :precondition (and (isconf #q5) (isconf #q2) (isgrasp o8 #g2))
          :effect (isholdingmotion #q5 #t339 #q2 o8 #g2)
   )
   (:action s356_plan-holding-motion
          :parameters (#q5 #q2 o8 #g3)
          :precondition (and (isconf #q5) (isconf #q2) (isgrasp o8 #g3))
          :effect (isholdingmotion #q5 #t340 #q2 o8 #g3)
   )
   (:action s357_plan-holding-motion
          :parameters (#q5 #q2 o9 #g4)
          :precondition (and (isconf #q5) (isconf #q2) (isgrasp o9 #g4))
          :effect (isholdingmotion #q5 #t341 #q2 o9 #g4)
   )
   (:action s358_plan-holding-motion
          :parameters (#q5 #q2 o9 #g5)
          :precondition (and (isconf #q5) (isconf #q2) (isgrasp o9 #g5))
          :effect (isholdingmotion #q5 #t342 #q2 o9 #g5)
   )
   (:action s359_plan-holding-motion
          :parameters (#q5 #q3 o8 #g0)
          :precondition (and (isconf #q5) (isconf #q3) (isgrasp o8 #g0))
          :effect (isholdingmotion #q5 #t343 #q3 o8 #g0)
   )
   (:action s360_plan-holding-motion
          :parameters (#q5 #q3 o9 #g1)
          :precondition (and (isconf #q5) (isconf #q3) (isgrasp o9 #g1))
          :effect (isholdingmotion #q5 #t344 #q3 o9 #g1)
   )
   (:action s361_plan-holding-motion
          :parameters (#q5 #q3 o8 #g2)
          :precondition (and (isconf #q5) (isconf #q3) (isgrasp o8 #g2))
          :effect (isholdingmotion #q5 #t345 #q3 o8 #g2)
   )
   (:action s362_plan-holding-motion
          :parameters (#q5 #q3 o8 #g3)
          :precondition (and (isconf #q5) (isconf #q3) (isgrasp o8 #g3))
          :effect (isholdingmotion #q5 #t346 #q3 o8 #g3)
   )
   (:action s363_plan-holding-motion
          :parameters (#q5 #q3 o9 #g4)
          :precondition (and (isconf #q5) (isconf #q3) (isgrasp o9 #g4))
          :effect (isholdingmotion #q5 #t347 #q3 o9 #g4)
   )
   (:action s364_plan-holding-motion
          :parameters (#q5 #q3 o9 #g5)
          :precondition (and (isconf #q5) (isconf #q3) (isgrasp o9 #g5))
          :effect (isholdingmotion #q5 #t348 #q3 o9 #g5)
   )
   (:action s365_plan-holding-motion
          :parameters (#q5 #q4 o8 #g0)
          :precondition (and (isconf #q5) (isconf #q4) (isgrasp o8 #g0))
          :effect (isholdingmotion #q5 #t349 #q4 o8 #g0)
   )
   (:action s366_plan-holding-motion
          :parameters (#q5 #q4 o9 #g1)
          :precondition (and (isconf #q5) (isconf #q4) (isgrasp o9 #g1))
          :effect (isholdingmotion #q5 #t350 #q4 o9 #g1)
   )
   (:action s367_plan-holding-motion
          :parameters (#q5 #q4 o8 #g2)
          :precondition (and (isconf #q5) (isconf #q4) (isgrasp o8 #g2))
          :effect (isholdingmotion #q5 #t351 #q4 o8 #g2)
   )
   (:action s368_plan-holding-motion
          :parameters (#q5 #q4 o8 #g3)
          :precondition (and (isconf #q5) (isconf #q4) (isgrasp o8 #g3))
          :effect (isholdingmotion #q5 #t352 #q4 o8 #g3)
   )
   (:action s369_plan-holding-motion
          :parameters (#q5 #q4 o9 #g4)
          :precondition (and (isconf #q5) (isconf #q4) (isgrasp o9 #g4))
          :effect (isholdingmotion #q5 #t353 #q4 o9 #g4)
   )
   (:action s370_plan-holding-motion
          :parameters (#q5 #q4 o9 #g5)
          :precondition (and (isconf #q5) (isconf #q4) (isgrasp o9 #g5))
          :effect (isholdingmotion #q5 #t354 #q4 o9 #g5)
   )
   (:action s371_plan-holding-motion
          :parameters (#q5 #q5 o8 #g0)
          :precondition (and (isconf #q5) (isconf #q5) (isgrasp o8 #g0))
          :effect (isholdingmotion #q5 #t355 #q5 o8 #g0)
   )
   (:action s372_plan-holding-motion
          :parameters (#q5 #q5 o9 #g1)
          :precondition (and (isconf #q5) (isconf #q5) (isgrasp o9 #g1))
          :effect (isholdingmotion #q5 #t356 #q5 o9 #g1)
   )
   (:action s373_plan-holding-motion
          :parameters (#q5 #q5 o8 #g2)
          :precondition (and (isconf #q5) (isconf #q5) (isgrasp o8 #g2))
          :effect (isholdingmotion #q5 #t357 #q5 o8 #g2)
   )
   (:action s374_plan-holding-motion
          :parameters (#q5 #q5 o8 #g3)
          :precondition (and (isconf #q5) (isconf #q5) (isgrasp o8 #g3))
          :effect (isholdingmotion #q5 #t358 #q5 o8 #g3)
   )
   (:action s375_plan-holding-motion
          :parameters (#q5 #q5 o9 #g4)
          :precondition (and (isconf #q5) (isconf #q5) (isgrasp o9 #g4))
          :effect (isholdingmotion #q5 #t359 #q5 o9 #g4)
   )
   (:action s376_plan-holding-motion
          :parameters (#q5 #q5 o9 #g5)
          :precondition (and (isconf #q5) (isconf #q5) (isgrasp o9 #g5))
          :effect (isholdingmotion #q5 #t360 #q5 o9 #g5)
   )
   (:action s377_plan-free-motion
          :parameters (q808 #q6)
          :precondition (and (isconf q808) (isconf #q6))
          :effect (isfreemotion q808 #t361 #q6)
   )
   (:action s378_plan-free-motion
          :parameters (q808 #q7)
          :precondition (and (isconf q808) (isconf #q7))
          :effect (isfreemotion q808 #t362 #q7)
   )
   (:action s379_plan-free-motion
          :parameters (q808 #q8)
          :precondition (and (isconf q808) (isconf #q8))
          :effect (isfreemotion q808 #t363 #q8)
   )
   (:action s380_plan-free-motion
          :parameters (q808 #q9)
          :precondition (and (isconf q808) (isconf #q9))
          :effect (isfreemotion q808 #t364 #q9)
   )
   (:action s381_plan-free-motion
          :parameters (q808 #q10)
          :precondition (and (isconf q808) (isconf #q10))
          :effect (isfreemotion q808 #t365 #q10)
   )
   (:action s382_plan-free-motion
          :parameters (q808 #q11)
          :precondition (and (isconf q808) (isconf #q11))
          :effect (isfreemotion q808 #t366 #q11)
   )
   (:action s383_plan-free-motion
          :parameters (q808 #q12)
          :precondition (and (isconf q808) (isconf #q12))
          :effect (isfreemotion q808 #t367 #q12)
   )
   (:action s384_plan-free-motion
          :parameters (q808 #q13)
          :precondition (and (isconf q808) (isconf #q13))
          :effect (isfreemotion q808 #t368 #q13)
   )
   (:action s385_plan-free-motion
          :parameters (q808 #q14)
          :precondition (and (isconf q808) (isconf #q14))
          :effect (isfreemotion q808 #t369 #q14)
   )
   (:action s386_plan-free-motion
          :parameters (q808 #q15)
          :precondition (and (isconf q808) (isconf #q15))
          :effect (isfreemotion q808 #t370 #q15)
   )
   (:action s387_plan-free-motion
          :parameters (q808 #q16)
          :precondition (and (isconf q808) (isconf #q16))
          :effect (isfreemotion q808 #t371 #q16)
   )
   (:action s388_plan-free-motion
          :parameters (q808 #q17)
          :precondition (and (isconf q808) (isconf #q17))
          :effect (isfreemotion q808 #t372 #q17)
   )
   (:action s389_plan-free-motion
          :parameters (#q0 #q6)
          :precondition (and (isconf #q0) (isconf #q6))
          :effect (isfreemotion #q0 #t373 #q6)
   )
   (:action s390_plan-free-motion
          :parameters (#q0 #q7)
          :precondition (and (isconf #q0) (isconf #q7))
          :effect (isfreemotion #q0 #t374 #q7)
   )
   (:action s391_plan-free-motion
          :parameters (#q0 #q8)
          :precondition (and (isconf #q0) (isconf #q8))
          :effect (isfreemotion #q0 #t375 #q8)
   )
   (:action s392_plan-free-motion
          :parameters (#q0 #q9)
          :precondition (and (isconf #q0) (isconf #q9))
          :effect (isfreemotion #q0 #t376 #q9)
   )
   (:action s393_plan-free-motion
          :parameters (#q0 #q10)
          :precondition (and (isconf #q0) (isconf #q10))
          :effect (isfreemotion #q0 #t377 #q10)
   )
   (:action s394_plan-free-motion
          :parameters (#q0 #q11)
          :precondition (and (isconf #q0) (isconf #q11))
          :effect (isfreemotion #q0 #t378 #q11)
   )
   (:action s395_plan-free-motion
          :parameters (#q0 #q12)
          :precondition (and (isconf #q0) (isconf #q12))
          :effect (isfreemotion #q0 #t379 #q12)
   )
   (:action s396_plan-free-motion
          :parameters (#q0 #q13)
          :precondition (and (isconf #q0) (isconf #q13))
          :effect (isfreemotion #q0 #t380 #q13)
   )
   (:action s397_plan-free-motion
          :parameters (#q0 #q14)
          :precondition (and (isconf #q0) (isconf #q14))
          :effect (isfreemotion #q0 #t381 #q14)
   )
   (:action s398_plan-free-motion
          :parameters (#q0 #q15)
          :precondition (and (isconf #q0) (isconf #q15))
          :effect (isfreemotion #q0 #t382 #q15)
   )
   (:action s399_plan-free-motion
          :parameters (#q0 #q16)
          :precondition (and (isconf #q0) (isconf #q16))
          :effect (isfreemotion #q0 #t383 #q16)
   )
   (:action s400_plan-free-motion
          :parameters (#q0 #q17)
          :precondition (and (isconf #q0) (isconf #q17))
          :effect (isfreemotion #q0 #t384 #q17)
   )
   (:action s401_plan-free-motion
          :parameters (#q1 #q6)
          :precondition (and (isconf #q1) (isconf #q6))
          :effect (isfreemotion #q1 #t385 #q6)
   )
   (:action s402_plan-free-motion
          :parameters (#q1 #q7)
          :precondition (and (isconf #q1) (isconf #q7))
          :effect (isfreemotion #q1 #t386 #q7)
   )
   (:action s403_plan-free-motion
          :parameters (#q1 #q8)
          :precondition (and (isconf #q1) (isconf #q8))
          :effect (isfreemotion #q1 #t387 #q8)
   )
   (:action s404_plan-free-motion
          :parameters (#q1 #q9)
          :precondition (and (isconf #q1) (isconf #q9))
          :effect (isfreemotion #q1 #t388 #q9)
   )
   (:action s405_plan-free-motion
          :parameters (#q1 #q10)
          :precondition (and (isconf #q1) (isconf #q10))
          :effect (isfreemotion #q1 #t389 #q10)
   )
   (:action s406_plan-free-motion
          :parameters (#q1 #q11)
          :precondition (and (isconf #q1) (isconf #q11))
          :effect (isfreemotion #q1 #t390 #q11)
   )
   (:action s407_plan-free-motion
          :parameters (#q1 #q12)
          :precondition (and (isconf #q1) (isconf #q12))
          :effect (isfreemotion #q1 #t391 #q12)
   )
   (:action s408_plan-free-motion
          :parameters (#q1 #q13)
          :precondition (and (isconf #q1) (isconf #q13))
          :effect (isfreemotion #q1 #t392 #q13)
   )
   (:action s409_plan-free-motion
          :parameters (#q1 #q14)
          :precondition (and (isconf #q1) (isconf #q14))
          :effect (isfreemotion #q1 #t393 #q14)
   )
   (:action s410_plan-free-motion
          :parameters (#q1 #q15)
          :precondition (and (isconf #q1) (isconf #q15))
          :effect (isfreemotion #q1 #t394 #q15)
   )
   (:action s411_plan-free-motion
          :parameters (#q1 #q16)
          :precondition (and (isconf #q1) (isconf #q16))
          :effect (isfreemotion #q1 #t395 #q16)
   )
   (:action s412_plan-free-motion
          :parameters (#q1 #q17)
          :precondition (and (isconf #q1) (isconf #q17))
          :effect (isfreemotion #q1 #t396 #q17)
   )
   (:action s413_plan-free-motion
          :parameters (#q2 #q6)
          :precondition (and (isconf #q2) (isconf #q6))
          :effect (isfreemotion #q2 #t397 #q6)
   )
   (:action s414_plan-free-motion
          :parameters (#q2 #q7)
          :precondition (and (isconf #q2) (isconf #q7))
          :effect (isfreemotion #q2 #t398 #q7)
   )
   (:action s415_plan-free-motion
          :parameters (#q2 #q8)
          :precondition (and (isconf #q2) (isconf #q8))
          :effect (isfreemotion #q2 #t399 #q8)
   )
   (:action s416_plan-free-motion
          :parameters (#q2 #q9)
          :precondition (and (isconf #q2) (isconf #q9))
          :effect (isfreemotion #q2 #t400 #q9)
   )
   (:action s417_plan-free-motion
          :parameters (#q2 #q10)
          :precondition (and (isconf #q2) (isconf #q10))
          :effect (isfreemotion #q2 #t401 #q10)
   )
   (:action s418_plan-free-motion
          :parameters (#q2 #q11)
          :precondition (and (isconf #q2) (isconf #q11))
          :effect (isfreemotion #q2 #t402 #q11)
   )
   (:action s419_plan-free-motion
          :parameters (#q2 #q12)
          :precondition (and (isconf #q2) (isconf #q12))
          :effect (isfreemotion #q2 #t403 #q12)
   )
   (:action s420_plan-free-motion
          :parameters (#q2 #q13)
          :precondition (and (isconf #q2) (isconf #q13))
          :effect (isfreemotion #q2 #t404 #q13)
   )
   (:action s421_plan-free-motion
          :parameters (#q2 #q14)
          :precondition (and (isconf #q2) (isconf #q14))
          :effect (isfreemotion #q2 #t405 #q14)
   )
   (:action s422_plan-free-motion
          :parameters (#q2 #q15)
          :precondition (and (isconf #q2) (isconf #q15))
          :effect (isfreemotion #q2 #t406 #q15)
   )
   (:action s423_plan-free-motion
          :parameters (#q2 #q16)
          :precondition (and (isconf #q2) (isconf #q16))
          :effect (isfreemotion #q2 #t407 #q16)
   )
   (:action s424_plan-free-motion
          :parameters (#q2 #q17)
          :precondition (and (isconf #q2) (isconf #q17))
          :effect (isfreemotion #q2 #t408 #q17)
   )
   (:action s425_plan-free-motion
          :parameters (#q3 #q6)
          :precondition (and (isconf #q3) (isconf #q6))
          :effect (isfreemotion #q3 #t409 #q6)
   )
   (:action s426_plan-free-motion
          :parameters (#q3 #q7)
          :precondition (and (isconf #q3) (isconf #q7))
          :effect (isfreemotion #q3 #t410 #q7)
   )
   (:action s427_plan-free-motion
          :parameters (#q3 #q8)
          :precondition (and (isconf #q3) (isconf #q8))
          :effect (isfreemotion #q3 #t411 #q8)
   )
   (:action s428_plan-free-motion
          :parameters (#q3 #q9)
          :precondition (and (isconf #q3) (isconf #q9))
          :effect (isfreemotion #q3 #t412 #q9)
   )
   (:action s429_plan-free-motion
          :parameters (#q3 #q10)
          :precondition (and (isconf #q3) (isconf #q10))
          :effect (isfreemotion #q3 #t413 #q10)
   )
   (:action s430_plan-free-motion
          :parameters (#q3 #q11)
          :precondition (and (isconf #q3) (isconf #q11))
          :effect (isfreemotion #q3 #t414 #q11)
   )
   (:action s431_plan-free-motion
          :parameters (#q3 #q12)
          :precondition (and (isconf #q3) (isconf #q12))
          :effect (isfreemotion #q3 #t415 #q12)
   )
   (:action s432_plan-free-motion
          :parameters (#q3 #q13)
          :precondition (and (isconf #q3) (isconf #q13))
          :effect (isfreemotion #q3 #t416 #q13)
   )
   (:action s433_plan-free-motion
          :parameters (#q3 #q14)
          :precondition (and (isconf #q3) (isconf #q14))
          :effect (isfreemotion #q3 #t417 #q14)
   )
   (:action s434_plan-free-motion
          :parameters (#q3 #q15)
          :precondition (and (isconf #q3) (isconf #q15))
          :effect (isfreemotion #q3 #t418 #q15)
   )
   (:action s435_plan-free-motion
          :parameters (#q3 #q16)
          :precondition (and (isconf #q3) (isconf #q16))
          :effect (isfreemotion #q3 #t419 #q16)
   )
   (:action s436_plan-free-motion
          :parameters (#q3 #q17)
          :precondition (and (isconf #q3) (isconf #q17))
          :effect (isfreemotion #q3 #t420 #q17)
   )
   (:action s437_plan-free-motion
          :parameters (#q4 #q6)
          :precondition (and (isconf #q4) (isconf #q6))
          :effect (isfreemotion #q4 #t421 #q6)
   )
   (:action s438_plan-free-motion
          :parameters (#q4 #q7)
          :precondition (and (isconf #q4) (isconf #q7))
          :effect (isfreemotion #q4 #t422 #q7)
   )
   (:action s439_plan-free-motion
          :parameters (#q4 #q8)
          :precondition (and (isconf #q4) (isconf #q8))
          :effect (isfreemotion #q4 #t423 #q8)
   )
   (:action s440_plan-free-motion
          :parameters (#q4 #q9)
          :precondition (and (isconf #q4) (isconf #q9))
          :effect (isfreemotion #q4 #t424 #q9)
   )
   (:action s441_plan-free-motion
          :parameters (#q4 #q10)
          :precondition (and (isconf #q4) (isconf #q10))
          :effect (isfreemotion #q4 #t425 #q10)
   )
   (:action s442_plan-free-motion
          :parameters (#q4 #q11)
          :precondition (and (isconf #q4) (isconf #q11))
          :effect (isfreemotion #q4 #t426 #q11)
   )
   (:action s443_plan-free-motion
          :parameters (#q4 #q12)
          :precondition (and (isconf #q4) (isconf #q12))
          :effect (isfreemotion #q4 #t427 #q12)
   )
   (:action s444_plan-free-motion
          :parameters (#q4 #q13)
          :precondition (and (isconf #q4) (isconf #q13))
          :effect (isfreemotion #q4 #t428 #q13)
   )
   (:action s445_plan-free-motion
          :parameters (#q4 #q14)
          :precondition (and (isconf #q4) (isconf #q14))
          :effect (isfreemotion #q4 #t429 #q14)
   )
   (:action s446_plan-free-motion
          :parameters (#q4 #q15)
          :precondition (and (isconf #q4) (isconf #q15))
          :effect (isfreemotion #q4 #t430 #q15)
   )
   (:action s447_plan-free-motion
          :parameters (#q4 #q16)
          :precondition (and (isconf #q4) (isconf #q16))
          :effect (isfreemotion #q4 #t431 #q16)
   )
   (:action s448_plan-free-motion
          :parameters (#q4 #q17)
          :precondition (and (isconf #q4) (isconf #q17))
          :effect (isfreemotion #q4 #t432 #q17)
   )
   (:action s449_plan-free-motion
          :parameters (#q5 #q6)
          :precondition (and (isconf #q5) (isconf #q6))
          :effect (isfreemotion #q5 #t433 #q6)
   )
   (:action s450_plan-free-motion
          :parameters (#q5 #q7)
          :precondition (and (isconf #q5) (isconf #q7))
          :effect (isfreemotion #q5 #t434 #q7)
   )
   (:action s451_plan-free-motion
          :parameters (#q5 #q8)
          :precondition (and (isconf #q5) (isconf #q8))
          :effect (isfreemotion #q5 #t435 #q8)
   )
   (:action s452_plan-free-motion
          :parameters (#q5 #q9)
          :precondition (and (isconf #q5) (isconf #q9))
          :effect (isfreemotion #q5 #t436 #q9)
   )
   (:action s453_plan-free-motion
          :parameters (#q5 #q10)
          :precondition (and (isconf #q5) (isconf #q10))
          :effect (isfreemotion #q5 #t437 #q10)
   )
   (:action s454_plan-free-motion
          :parameters (#q5 #q11)
          :precondition (and (isconf #q5) (isconf #q11))
          :effect (isfreemotion #q5 #t438 #q11)
   )
   (:action s455_plan-free-motion
          :parameters (#q5 #q12)
          :precondition (and (isconf #q5) (isconf #q12))
          :effect (isfreemotion #q5 #t439 #q12)
   )
   (:action s456_plan-free-motion
          :parameters (#q5 #q13)
          :precondition (and (isconf #q5) (isconf #q13))
          :effect (isfreemotion #q5 #t440 #q13)
   )
   (:action s457_plan-free-motion
          :parameters (#q5 #q14)
          :precondition (and (isconf #q5) (isconf #q14))
          :effect (isfreemotion #q5 #t441 #q14)
   )
   (:action s458_plan-free-motion
          :parameters (#q5 #q15)
          :precondition (and (isconf #q5) (isconf #q15))
          :effect (isfreemotion #q5 #t442 #q15)
   )
   (:action s459_plan-free-motion
          :parameters (#q5 #q16)
          :precondition (and (isconf #q5) (isconf #q16))
          :effect (isfreemotion #q5 #t443 #q16)
   )
   (:action s460_plan-free-motion
          :parameters (#q5 #q17)
          :precondition (and (isconf #q5) (isconf #q17))
          :effect (isfreemotion #q5 #t444 #q17)
   )
   (:action s461_plan-free-motion
          :parameters (#q6 q808)
          :precondition (and (isconf #q6) (isconf q808))
          :effect (isfreemotion #q6 #t445 q808)
   )
   (:action s462_plan-free-motion
          :parameters (#q6 #q0)
          :precondition (and (isconf #q6) (isconf #q0))
          :effect (isfreemotion #q6 #t446 #q0)
   )
   (:action s463_plan-free-motion
          :parameters (#q6 #q1)
          :precondition (and (isconf #q6) (isconf #q1))
          :effect (isfreemotion #q6 #t447 #q1)
   )
   (:action s464_plan-free-motion
          :parameters (#q6 #q2)
          :precondition (and (isconf #q6) (isconf #q2))
          :effect (isfreemotion #q6 #t448 #q2)
   )
   (:action s465_plan-free-motion
          :parameters (#q6 #q3)
          :precondition (and (isconf #q6) (isconf #q3))
          :effect (isfreemotion #q6 #t449 #q3)
   )
   (:action s466_plan-free-motion
          :parameters (#q6 #q4)
          :precondition (and (isconf #q6) (isconf #q4))
          :effect (isfreemotion #q6 #t450 #q4)
   )
   (:action s467_plan-free-motion
          :parameters (#q6 #q5)
          :precondition (and (isconf #q6) (isconf #q5))
          :effect (isfreemotion #q6 #t451 #q5)
   )
   (:action s468_plan-free-motion
          :parameters (#q6 #q6)
          :precondition (and (isconf #q6) (isconf #q6))
          :effect (isfreemotion #q6 #t452 #q6)
   )
   (:action s469_plan-free-motion
          :parameters (#q6 #q7)
          :precondition (and (isconf #q6) (isconf #q7))
          :effect (isfreemotion #q6 #t453 #q7)
   )
   (:action s470_plan-free-motion
          :parameters (#q6 #q8)
          :precondition (and (isconf #q6) (isconf #q8))
          :effect (isfreemotion #q6 #t454 #q8)
   )
   (:action s471_plan-free-motion
          :parameters (#q6 #q9)
          :precondition (and (isconf #q6) (isconf #q9))
          :effect (isfreemotion #q6 #t455 #q9)
   )
   (:action s472_plan-free-motion
          :parameters (#q6 #q10)
          :precondition (and (isconf #q6) (isconf #q10))
          :effect (isfreemotion #q6 #t456 #q10)
   )
   (:action s473_plan-free-motion
          :parameters (#q6 #q11)
          :precondition (and (isconf #q6) (isconf #q11))
          :effect (isfreemotion #q6 #t457 #q11)
   )
   (:action s474_plan-free-motion
          :parameters (#q6 #q12)
          :precondition (and (isconf #q6) (isconf #q12))
          :effect (isfreemotion #q6 #t458 #q12)
   )
   (:action s475_plan-free-motion
          :parameters (#q6 #q13)
          :precondition (and (isconf #q6) (isconf #q13))
          :effect (isfreemotion #q6 #t459 #q13)
   )
   (:action s476_plan-free-motion
          :parameters (#q6 #q14)
          :precondition (and (isconf #q6) (isconf #q14))
          :effect (isfreemotion #q6 #t460 #q14)
   )
   (:action s477_plan-free-motion
          :parameters (#q6 #q15)
          :precondition (and (isconf #q6) (isconf #q15))
          :effect (isfreemotion #q6 #t461 #q15)
   )
   (:action s478_plan-free-motion
          :parameters (#q6 #q16)
          :precondition (and (isconf #q6) (isconf #q16))
          :effect (isfreemotion #q6 #t462 #q16)
   )
   (:action s479_plan-free-motion
          :parameters (#q6 #q17)
          :precondition (and (isconf #q6) (isconf #q17))
          :effect (isfreemotion #q6 #t463 #q17)
   )
   (:action s480_plan-free-motion
          :parameters (#q7 q808)
          :precondition (and (isconf #q7) (isconf q808))
          :effect (isfreemotion #q7 #t464 q808)
   )
   (:action s481_plan-free-motion
          :parameters (#q7 #q0)
          :precondition (and (isconf #q7) (isconf #q0))
          :effect (isfreemotion #q7 #t465 #q0)
   )
   (:action s482_plan-free-motion
          :parameters (#q7 #q1)
          :precondition (and (isconf #q7) (isconf #q1))
          :effect (isfreemotion #q7 #t466 #q1)
   )
   (:action s483_plan-free-motion
          :parameters (#q7 #q2)
          :precondition (and (isconf #q7) (isconf #q2))
          :effect (isfreemotion #q7 #t467 #q2)
   )
   (:action s484_plan-free-motion
          :parameters (#q7 #q3)
          :precondition (and (isconf #q7) (isconf #q3))
          :effect (isfreemotion #q7 #t468 #q3)
   )
   (:action s485_plan-free-motion
          :parameters (#q7 #q4)
          :precondition (and (isconf #q7) (isconf #q4))
          :effect (isfreemotion #q7 #t469 #q4)
   )
   (:action s486_plan-free-motion
          :parameters (#q7 #q5)
          :precondition (and (isconf #q7) (isconf #q5))
          :effect (isfreemotion #q7 #t470 #q5)
   )
   (:action s487_plan-free-motion
          :parameters (#q7 #q6)
          :precondition (and (isconf #q7) (isconf #q6))
          :effect (isfreemotion #q7 #t471 #q6)
   )
   (:action s488_plan-free-motion
          :parameters (#q7 #q7)
          :precondition (and (isconf #q7) (isconf #q7))
          :effect (isfreemotion #q7 #t472 #q7)
   )
   (:action s489_plan-free-motion
          :parameters (#q7 #q8)
          :precondition (and (isconf #q7) (isconf #q8))
          :effect (isfreemotion #q7 #t473 #q8)
   )
   (:action s490_plan-free-motion
          :parameters (#q7 #q9)
          :precondition (and (isconf #q7) (isconf #q9))
          :effect (isfreemotion #q7 #t474 #q9)
   )
   (:action s491_plan-free-motion
          :parameters (#q7 #q10)
          :precondition (and (isconf #q7) (isconf #q10))
          :effect (isfreemotion #q7 #t475 #q10)
   )
   (:action s492_plan-free-motion
          :parameters (#q7 #q11)
          :precondition (and (isconf #q7) (isconf #q11))
          :effect (isfreemotion #q7 #t476 #q11)
   )
   (:action s493_plan-free-motion
          :parameters (#q7 #q12)
          :precondition (and (isconf #q7) (isconf #q12))
          :effect (isfreemotion #q7 #t477 #q12)
   )
   (:action s494_plan-free-motion
          :parameters (#q7 #q13)
          :precondition (and (isconf #q7) (isconf #q13))
          :effect (isfreemotion #q7 #t478 #q13)
   )
   (:action s495_plan-free-motion
          :parameters (#q7 #q14)
          :precondition (and (isconf #q7) (isconf #q14))
          :effect (isfreemotion #q7 #t479 #q14)
   )
   (:action s496_plan-free-motion
          :parameters (#q7 #q15)
          :precondition (and (isconf #q7) (isconf #q15))
          :effect (isfreemotion #q7 #t480 #q15)
   )
   (:action s497_plan-free-motion
          :parameters (#q7 #q16)
          :precondition (and (isconf #q7) (isconf #q16))
          :effect (isfreemotion #q7 #t481 #q16)
   )
   (:action s498_plan-free-motion
          :parameters (#q7 #q17)
          :precondition (and (isconf #q7) (isconf #q17))
          :effect (isfreemotion #q7 #t482 #q17)
   )
   (:action s499_plan-free-motion
          :parameters (#q8 q808)
          :precondition (and (isconf #q8) (isconf q808))
          :effect (isfreemotion #q8 #t483 q808)
   )
   (:action s500_plan-free-motion
          :parameters (#q8 #q0)
          :precondition (and (isconf #q8) (isconf #q0))
          :effect (isfreemotion #q8 #t484 #q0)
   )
   (:action s501_plan-free-motion
          :parameters (#q8 #q1)
          :precondition (and (isconf #q8) (isconf #q1))
          :effect (isfreemotion #q8 #t485 #q1)
   )
   (:action s502_plan-free-motion
          :parameters (#q8 #q2)
          :precondition (and (isconf #q8) (isconf #q2))
          :effect (isfreemotion #q8 #t486 #q2)
   )
   (:action s503_plan-free-motion
          :parameters (#q8 #q3)
          :precondition (and (isconf #q8) (isconf #q3))
          :effect (isfreemotion #q8 #t487 #q3)
   )
   (:action s504_plan-free-motion
          :parameters (#q8 #q4)
          :precondition (and (isconf #q8) (isconf #q4))
          :effect (isfreemotion #q8 #t488 #q4)
   )
   (:action s505_plan-free-motion
          :parameters (#q8 #q5)
          :precondition (and (isconf #q8) (isconf #q5))
          :effect (isfreemotion #q8 #t489 #q5)
   )
   (:action s506_plan-free-motion
          :parameters (#q8 #q6)
          :precondition (and (isconf #q8) (isconf #q6))
          :effect (isfreemotion #q8 #t490 #q6)
   )
   (:action s507_plan-free-motion
          :parameters (#q8 #q7)
          :precondition (and (isconf #q8) (isconf #q7))
          :effect (isfreemotion #q8 #t491 #q7)
   )
   (:action s508_plan-free-motion
          :parameters (#q8 #q8)
          :precondition (and (isconf #q8) (isconf #q8))
          :effect (isfreemotion #q8 #t492 #q8)
   )
   (:action s509_plan-free-motion
          :parameters (#q8 #q9)
          :precondition (and (isconf #q8) (isconf #q9))
          :effect (isfreemotion #q8 #t493 #q9)
   )
   (:action s510_plan-free-motion
          :parameters (#q8 #q10)
          :precondition (and (isconf #q8) (isconf #q10))
          :effect (isfreemotion #q8 #t494 #q10)
   )
   (:action s511_plan-free-motion
          :parameters (#q8 #q11)
          :precondition (and (isconf #q8) (isconf #q11))
          :effect (isfreemotion #q8 #t495 #q11)
   )
   (:action s512_plan-free-motion
          :parameters (#q8 #q12)
          :precondition (and (isconf #q8) (isconf #q12))
          :effect (isfreemotion #q8 #t496 #q12)
   )
   (:action s513_plan-free-motion
          :parameters (#q8 #q13)
          :precondition (and (isconf #q8) (isconf #q13))
          :effect (isfreemotion #q8 #t497 #q13)
   )
   (:action s514_plan-free-motion
          :parameters (#q8 #q14)
          :precondition (and (isconf #q8) (isconf #q14))
          :effect (isfreemotion #q8 #t498 #q14)
   )
   (:action s515_plan-free-motion
          :parameters (#q8 #q15)
          :precondition (and (isconf #q8) (isconf #q15))
          :effect (isfreemotion #q8 #t499 #q15)
   )
   (:action s516_plan-free-motion
          :parameters (#q8 #q16)
          :precondition (and (isconf #q8) (isconf #q16))
          :effect (isfreemotion #q8 #t500 #q16)
   )
   (:action s517_plan-free-motion
          :parameters (#q8 #q17)
          :precondition (and (isconf #q8) (isconf #q17))
          :effect (isfreemotion #q8 #t501 #q17)
   )
   (:action s518_plan-free-motion
          :parameters (#q9 q808)
          :precondition (and (isconf #q9) (isconf q808))
          :effect (isfreemotion #q9 #t502 q808)
   )
   (:action s519_plan-free-motion
          :parameters (#q9 #q0)
          :precondition (and (isconf #q9) (isconf #q0))
          :effect (isfreemotion #q9 #t503 #q0)
   )
   (:action s520_plan-free-motion
          :parameters (#q9 #q1)
          :precondition (and (isconf #q9) (isconf #q1))
          :effect (isfreemotion #q9 #t504 #q1)
   )
   (:action s521_plan-free-motion
          :parameters (#q9 #q2)
          :precondition (and (isconf #q9) (isconf #q2))
          :effect (isfreemotion #q9 #t505 #q2)
   )
   (:action s522_plan-free-motion
          :parameters (#q9 #q3)
          :precondition (and (isconf #q9) (isconf #q3))
          :effect (isfreemotion #q9 #t506 #q3)
   )
   (:action s523_plan-free-motion
          :parameters (#q9 #q4)
          :precondition (and (isconf #q9) (isconf #q4))
          :effect (isfreemotion #q9 #t507 #q4)
   )
   (:action s524_plan-free-motion
          :parameters (#q9 #q5)
          :precondition (and (isconf #q9) (isconf #q5))
          :effect (isfreemotion #q9 #t508 #q5)
   )
   (:action s525_plan-free-motion
          :parameters (#q9 #q6)
          :precondition (and (isconf #q9) (isconf #q6))
          :effect (isfreemotion #q9 #t509 #q6)
   )
   (:action s526_plan-free-motion
          :parameters (#q9 #q7)
          :precondition (and (isconf #q9) (isconf #q7))
          :effect (isfreemotion #q9 #t510 #q7)
   )
   (:action s527_plan-free-motion
          :parameters (#q9 #q8)
          :precondition (and (isconf #q9) (isconf #q8))
          :effect (isfreemotion #q9 #t511 #q8)
   )
   (:action s528_plan-free-motion
          :parameters (#q9 #q9)
          :precondition (and (isconf #q9) (isconf #q9))
          :effect (isfreemotion #q9 #t512 #q9)
   )
   (:action s529_plan-free-motion
          :parameters (#q9 #q10)
          :precondition (and (isconf #q9) (isconf #q10))
          :effect (isfreemotion #q9 #t513 #q10)
   )
   (:action s530_plan-free-motion
          :parameters (#q9 #q11)
          :precondition (and (isconf #q9) (isconf #q11))
          :effect (isfreemotion #q9 #t514 #q11)
   )
   (:action s531_plan-free-motion
          :parameters (#q9 #q12)
          :precondition (and (isconf #q9) (isconf #q12))
          :effect (isfreemotion #q9 #t515 #q12)
   )
   (:action s532_plan-free-motion
          :parameters (#q9 #q13)
          :precondition (and (isconf #q9) (isconf #q13))
          :effect (isfreemotion #q9 #t516 #q13)
   )
   (:action s533_plan-free-motion
          :parameters (#q9 #q14)
          :precondition (and (isconf #q9) (isconf #q14))
          :effect (isfreemotion #q9 #t517 #q14)
   )
   (:action s534_plan-free-motion
          :parameters (#q9 #q15)
          :precondition (and (isconf #q9) (isconf #q15))
          :effect (isfreemotion #q9 #t518 #q15)
   )
   (:action s535_plan-free-motion
          :parameters (#q9 #q16)
          :precondition (and (isconf #q9) (isconf #q16))
          :effect (isfreemotion #q9 #t519 #q16)
   )
   (:action s536_plan-free-motion
          :parameters (#q9 #q17)
          :precondition (and (isconf #q9) (isconf #q17))
          :effect (isfreemotion #q9 #t520 #q17)
   )
   (:action s537_plan-free-motion
          :parameters (#q10 q808)
          :precondition (and (isconf #q10) (isconf q808))
          :effect (isfreemotion #q10 #t521 q808)
   )
   (:action s538_plan-free-motion
          :parameters (#q10 #q0)
          :precondition (and (isconf #q10) (isconf #q0))
          :effect (isfreemotion #q10 #t522 #q0)
   )
   (:action s539_plan-free-motion
          :parameters (#q10 #q1)
          :precondition (and (isconf #q10) (isconf #q1))
          :effect (isfreemotion #q10 #t523 #q1)
   )
   (:action s540_plan-free-motion
          :parameters (#q10 #q2)
          :precondition (and (isconf #q10) (isconf #q2))
          :effect (isfreemotion #q10 #t524 #q2)
   )
   (:action s541_plan-free-motion
          :parameters (#q10 #q3)
          :precondition (and (isconf #q10) (isconf #q3))
          :effect (isfreemotion #q10 #t525 #q3)
   )
   (:action s542_plan-free-motion
          :parameters (#q10 #q4)
          :precondition (and (isconf #q10) (isconf #q4))
          :effect (isfreemotion #q10 #t526 #q4)
   )
   (:action s543_plan-free-motion
          :parameters (#q10 #q5)
          :precondition (and (isconf #q10) (isconf #q5))
          :effect (isfreemotion #q10 #t527 #q5)
   )
   (:action s544_plan-free-motion
          :parameters (#q10 #q6)
          :precondition (and (isconf #q10) (isconf #q6))
          :effect (isfreemotion #q10 #t528 #q6)
   )
   (:action s545_plan-free-motion
          :parameters (#q10 #q7)
          :precondition (and (isconf #q10) (isconf #q7))
          :effect (isfreemotion #q10 #t529 #q7)
   )
   (:action s546_plan-free-motion
          :parameters (#q10 #q8)
          :precondition (and (isconf #q10) (isconf #q8))
          :effect (isfreemotion #q10 #t530 #q8)
   )
   (:action s547_plan-free-motion
          :parameters (#q10 #q9)
          :precondition (and (isconf #q10) (isconf #q9))
          :effect (isfreemotion #q10 #t531 #q9)
   )
   (:action s548_plan-free-motion
          :parameters (#q10 #q10)
          :precondition (and (isconf #q10) (isconf #q10))
          :effect (isfreemotion #q10 #t532 #q10)
   )
   (:action s549_plan-free-motion
          :parameters (#q10 #q11)
          :precondition (and (isconf #q10) (isconf #q11))
          :effect (isfreemotion #q10 #t533 #q11)
   )
   (:action s550_plan-free-motion
          :parameters (#q10 #q12)
          :precondition (and (isconf #q10) (isconf #q12))
          :effect (isfreemotion #q10 #t534 #q12)
   )
   (:action s551_plan-free-motion
          :parameters (#q10 #q13)
          :precondition (and (isconf #q10) (isconf #q13))
          :effect (isfreemotion #q10 #t535 #q13)
   )
   (:action s552_plan-free-motion
          :parameters (#q10 #q14)
          :precondition (and (isconf #q10) (isconf #q14))
          :effect (isfreemotion #q10 #t536 #q14)
   )
   (:action s553_plan-free-motion
          :parameters (#q10 #q15)
          :precondition (and (isconf #q10) (isconf #q15))
          :effect (isfreemotion #q10 #t537 #q15)
   )
   (:action s554_plan-free-motion
          :parameters (#q10 #q16)
          :precondition (and (isconf #q10) (isconf #q16))
          :effect (isfreemotion #q10 #t538 #q16)
   )
   (:action s555_plan-free-motion
          :parameters (#q10 #q17)
          :precondition (and (isconf #q10) (isconf #q17))
          :effect (isfreemotion #q10 #t539 #q17)
   )
   (:action s556_plan-free-motion
          :parameters (#q11 q808)
          :precondition (and (isconf #q11) (isconf q808))
          :effect (isfreemotion #q11 #t540 q808)
   )
   (:action s557_plan-free-motion
          :parameters (#q11 #q0)
          :precondition (and (isconf #q11) (isconf #q0))
          :effect (isfreemotion #q11 #t541 #q0)
   )
   (:action s558_plan-free-motion
          :parameters (#q11 #q1)
          :precondition (and (isconf #q11) (isconf #q1))
          :effect (isfreemotion #q11 #t542 #q1)
   )
   (:action s559_plan-free-motion
          :parameters (#q11 #q2)
          :precondition (and (isconf #q11) (isconf #q2))
          :effect (isfreemotion #q11 #t543 #q2)
   )
   (:action s560_plan-free-motion
          :parameters (#q11 #q3)
          :precondition (and (isconf #q11) (isconf #q3))
          :effect (isfreemotion #q11 #t544 #q3)
   )
   (:action s561_plan-free-motion
          :parameters (#q11 #q4)
          :precondition (and (isconf #q11) (isconf #q4))
          :effect (isfreemotion #q11 #t545 #q4)
   )
   (:action s562_plan-free-motion
          :parameters (#q11 #q5)
          :precondition (and (isconf #q11) (isconf #q5))
          :effect (isfreemotion #q11 #t546 #q5)
   )
   (:action s563_plan-free-motion
          :parameters (#q11 #q6)
          :precondition (and (isconf #q11) (isconf #q6))
          :effect (isfreemotion #q11 #t547 #q6)
   )
   (:action s564_plan-free-motion
          :parameters (#q11 #q7)
          :precondition (and (isconf #q11) (isconf #q7))
          :effect (isfreemotion #q11 #t548 #q7)
   )
   (:action s565_plan-free-motion
          :parameters (#q11 #q8)
          :precondition (and (isconf #q11) (isconf #q8))
          :effect (isfreemotion #q11 #t549 #q8)
   )
   (:action s566_plan-free-motion
          :parameters (#q11 #q9)
          :precondition (and (isconf #q11) (isconf #q9))
          :effect (isfreemotion #q11 #t550 #q9)
   )
   (:action s567_plan-free-motion
          :parameters (#q11 #q10)
          :precondition (and (isconf #q11) (isconf #q10))
          :effect (isfreemotion #q11 #t551 #q10)
   )
   (:action s568_plan-free-motion
          :parameters (#q11 #q11)
          :precondition (and (isconf #q11) (isconf #q11))
          :effect (isfreemotion #q11 #t552 #q11)
   )
   (:action s569_plan-free-motion
          :parameters (#q11 #q12)
          :precondition (and (isconf #q11) (isconf #q12))
          :effect (isfreemotion #q11 #t553 #q12)
   )
   (:action s570_plan-free-motion
          :parameters (#q11 #q13)
          :precondition (and (isconf #q11) (isconf #q13))
          :effect (isfreemotion #q11 #t554 #q13)
   )
   (:action s571_plan-free-motion
          :parameters (#q11 #q14)
          :precondition (and (isconf #q11) (isconf #q14))
          :effect (isfreemotion #q11 #t555 #q14)
   )
   (:action s572_plan-free-motion
          :parameters (#q11 #q15)
          :precondition (and (isconf #q11) (isconf #q15))
          :effect (isfreemotion #q11 #t556 #q15)
   )
   (:action s573_plan-free-motion
          :parameters (#q11 #q16)
          :precondition (and (isconf #q11) (isconf #q16))
          :effect (isfreemotion #q11 #t557 #q16)
   )
   (:action s574_plan-free-motion
          :parameters (#q11 #q17)
          :precondition (and (isconf #q11) (isconf #q17))
          :effect (isfreemotion #q11 #t558 #q17)
   )
   (:action s575_plan-free-motion
          :parameters (#q12 q808)
          :precondition (and (isconf #q12) (isconf q808))
          :effect (isfreemotion #q12 #t559 q808)
   )
   (:action s576_plan-free-motion
          :parameters (#q12 #q0)
          :precondition (and (isconf #q12) (isconf #q0))
          :effect (isfreemotion #q12 #t560 #q0)
   )
   (:action s577_plan-free-motion
          :parameters (#q12 #q1)
          :precondition (and (isconf #q12) (isconf #q1))
          :effect (isfreemotion #q12 #t561 #q1)
   )
   (:action s578_plan-free-motion
          :parameters (#q12 #q2)
          :precondition (and (isconf #q12) (isconf #q2))
          :effect (isfreemotion #q12 #t562 #q2)
   )
   (:action s579_plan-free-motion
          :parameters (#q12 #q3)
          :precondition (and (isconf #q12) (isconf #q3))
          :effect (isfreemotion #q12 #t563 #q3)
   )
   (:action s580_plan-free-motion
          :parameters (#q12 #q4)
          :precondition (and (isconf #q12) (isconf #q4))
          :effect (isfreemotion #q12 #t564 #q4)
   )
   (:action s581_plan-free-motion
          :parameters (#q12 #q5)
          :precondition (and (isconf #q12) (isconf #q5))
          :effect (isfreemotion #q12 #t565 #q5)
   )
   (:action s582_plan-free-motion
          :parameters (#q12 #q6)
          :precondition (and (isconf #q12) (isconf #q6))
          :effect (isfreemotion #q12 #t566 #q6)
   )
   (:action s583_plan-free-motion
          :parameters (#q12 #q7)
          :precondition (and (isconf #q12) (isconf #q7))
          :effect (isfreemotion #q12 #t567 #q7)
   )
   (:action s584_plan-free-motion
          :parameters (#q12 #q8)
          :precondition (and (isconf #q12) (isconf #q8))
          :effect (isfreemotion #q12 #t568 #q8)
   )
   (:action s585_plan-free-motion
          :parameters (#q12 #q9)
          :precondition (and (isconf #q12) (isconf #q9))
          :effect (isfreemotion #q12 #t569 #q9)
   )
   (:action s586_plan-free-motion
          :parameters (#q12 #q10)
          :precondition (and (isconf #q12) (isconf #q10))
          :effect (isfreemotion #q12 #t570 #q10)
   )
   (:action s587_plan-free-motion
          :parameters (#q12 #q11)
          :precondition (and (isconf #q12) (isconf #q11))
          :effect (isfreemotion #q12 #t571 #q11)
   )
   (:action s588_plan-free-motion
          :parameters (#q12 #q12)
          :precondition (and (isconf #q12) (isconf #q12))
          :effect (isfreemotion #q12 #t572 #q12)
   )
   (:action s589_plan-free-motion
          :parameters (#q12 #q13)
          :precondition (and (isconf #q12) (isconf #q13))
          :effect (isfreemotion #q12 #t573 #q13)
   )
   (:action s590_plan-free-motion
          :parameters (#q12 #q14)
          :precondition (and (isconf #q12) (isconf #q14))
          :effect (isfreemotion #q12 #t574 #q14)
   )
   (:action s591_plan-free-motion
          :parameters (#q12 #q15)
          :precondition (and (isconf #q12) (isconf #q15))
          :effect (isfreemotion #q12 #t575 #q15)
   )
   (:action s592_plan-free-motion
          :parameters (#q12 #q16)
          :precondition (and (isconf #q12) (isconf #q16))
          :effect (isfreemotion #q12 #t576 #q16)
   )
   (:action s593_plan-free-motion
          :parameters (#q12 #q17)
          :precondition (and (isconf #q12) (isconf #q17))
          :effect (isfreemotion #q12 #t577 #q17)
   )
   (:action s594_plan-free-motion
          :parameters (#q13 q808)
          :precondition (and (isconf #q13) (isconf q808))
          :effect (isfreemotion #q13 #t578 q808)
   )
   (:action s595_plan-free-motion
          :parameters (#q13 #q0)
          :precondition (and (isconf #q13) (isconf #q0))
          :effect (isfreemotion #q13 #t579 #q0)
   )
   (:action s596_plan-free-motion
          :parameters (#q13 #q1)
          :precondition (and (isconf #q13) (isconf #q1))
          :effect (isfreemotion #q13 #t580 #q1)
   )
   (:action s597_plan-free-motion
          :parameters (#q13 #q2)
          :precondition (and (isconf #q13) (isconf #q2))
          :effect (isfreemotion #q13 #t581 #q2)
   )
   (:action s598_plan-free-motion
          :parameters (#q13 #q3)
          :precondition (and (isconf #q13) (isconf #q3))
          :effect (isfreemotion #q13 #t582 #q3)
   )
   (:action s599_plan-free-motion
          :parameters (#q13 #q4)
          :precondition (and (isconf #q13) (isconf #q4))
          :effect (isfreemotion #q13 #t583 #q4)
   )
   (:action s600_plan-free-motion
          :parameters (#q13 #q5)
          :precondition (and (isconf #q13) (isconf #q5))
          :effect (isfreemotion #q13 #t584 #q5)
   )
   (:action s601_plan-free-motion
          :parameters (#q13 #q6)
          :precondition (and (isconf #q13) (isconf #q6))
          :effect (isfreemotion #q13 #t585 #q6)
   )
   (:action s602_plan-free-motion
          :parameters (#q13 #q7)
          :precondition (and (isconf #q13) (isconf #q7))
          :effect (isfreemotion #q13 #t586 #q7)
   )
   (:action s603_plan-free-motion
          :parameters (#q13 #q8)
          :precondition (and (isconf #q13) (isconf #q8))
          :effect (isfreemotion #q13 #t587 #q8)
   )
   (:action s604_plan-free-motion
          :parameters (#q13 #q9)
          :precondition (and (isconf #q13) (isconf #q9))
          :effect (isfreemotion #q13 #t588 #q9)
   )
   (:action s605_plan-free-motion
          :parameters (#q13 #q10)
          :precondition (and (isconf #q13) (isconf #q10))
          :effect (isfreemotion #q13 #t589 #q10)
   )
   (:action s606_plan-free-motion
          :parameters (#q13 #q11)
          :precondition (and (isconf #q13) (isconf #q11))
          :effect (isfreemotion #q13 #t590 #q11)
   )
   (:action s607_plan-free-motion
          :parameters (#q13 #q12)
          :precondition (and (isconf #q13) (isconf #q12))
          :effect (isfreemotion #q13 #t591 #q12)
   )
   (:action s608_plan-free-motion
          :parameters (#q13 #q13)
          :precondition (and (isconf #q13) (isconf #q13))
          :effect (isfreemotion #q13 #t592 #q13)
   )
   (:action s609_plan-free-motion
          :parameters (#q13 #q14)
          :precondition (and (isconf #q13) (isconf #q14))
          :effect (isfreemotion #q13 #t593 #q14)
   )
   (:action s610_plan-free-motion
          :parameters (#q13 #q15)
          :precondition (and (isconf #q13) (isconf #q15))
          :effect (isfreemotion #q13 #t594 #q15)
   )
   (:action s611_plan-free-motion
          :parameters (#q13 #q16)
          :precondition (and (isconf #q13) (isconf #q16))
          :effect (isfreemotion #q13 #t595 #q16)
   )
   (:action s612_plan-free-motion
          :parameters (#q13 #q17)
          :precondition (and (isconf #q13) (isconf #q17))
          :effect (isfreemotion #q13 #t596 #q17)
   )
   (:action s613_plan-free-motion
          :parameters (#q14 q808)
          :precondition (and (isconf #q14) (isconf q808))
          :effect (isfreemotion #q14 #t597 q808)
   )
   (:action s614_plan-free-motion
          :parameters (#q14 #q0)
          :precondition (and (isconf #q14) (isconf #q0))
          :effect (isfreemotion #q14 #t598 #q0)
   )
   (:action s615_plan-free-motion
          :parameters (#q14 #q1)
          :precondition (and (isconf #q14) (isconf #q1))
          :effect (isfreemotion #q14 #t599 #q1)
   )
   (:action s616_plan-free-motion
          :parameters (#q14 #q2)
          :precondition (and (isconf #q14) (isconf #q2))
          :effect (isfreemotion #q14 #t600 #q2)
   )
   (:action s617_plan-free-motion
          :parameters (#q14 #q3)
          :precondition (and (isconf #q14) (isconf #q3))
          :effect (isfreemotion #q14 #t601 #q3)
   )
   (:action s618_plan-free-motion
          :parameters (#q14 #q4)
          :precondition (and (isconf #q14) (isconf #q4))
          :effect (isfreemotion #q14 #t602 #q4)
   )
   (:action s619_plan-free-motion
          :parameters (#q14 #q5)
          :precondition (and (isconf #q14) (isconf #q5))
          :effect (isfreemotion #q14 #t603 #q5)
   )
   (:action s620_plan-free-motion
          :parameters (#q14 #q6)
          :precondition (and (isconf #q14) (isconf #q6))
          :effect (isfreemotion #q14 #t604 #q6)
   )
   (:action s621_plan-free-motion
          :parameters (#q14 #q7)
          :precondition (and (isconf #q14) (isconf #q7))
          :effect (isfreemotion #q14 #t605 #q7)
   )
   (:action s622_plan-free-motion
          :parameters (#q14 #q8)
          :precondition (and (isconf #q14) (isconf #q8))
          :effect (isfreemotion #q14 #t606 #q8)
   )
   (:action s623_plan-free-motion
          :parameters (#q14 #q9)
          :precondition (and (isconf #q14) (isconf #q9))
          :effect (isfreemotion #q14 #t607 #q9)
   )
   (:action s624_plan-free-motion
          :parameters (#q14 #q10)
          :precondition (and (isconf #q14) (isconf #q10))
          :effect (isfreemotion #q14 #t608 #q10)
   )
   (:action s625_plan-free-motion
          :parameters (#q14 #q11)
          :precondition (and (isconf #q14) (isconf #q11))
          :effect (isfreemotion #q14 #t609 #q11)
   )
   (:action s626_plan-free-motion
          :parameters (#q14 #q12)
          :precondition (and (isconf #q14) (isconf #q12))
          :effect (isfreemotion #q14 #t610 #q12)
   )
   (:action s627_plan-free-motion
          :parameters (#q14 #q13)
          :precondition (and (isconf #q14) (isconf #q13))
          :effect (isfreemotion #q14 #t611 #q13)
   )
   (:action s628_plan-free-motion
          :parameters (#q14 #q14)
          :precondition (and (isconf #q14) (isconf #q14))
          :effect (isfreemotion #q14 #t612 #q14)
   )
   (:action s629_plan-free-motion
          :parameters (#q14 #q15)
          :precondition (and (isconf #q14) (isconf #q15))
          :effect (isfreemotion #q14 #t613 #q15)
   )
   (:action s630_plan-free-motion
          :parameters (#q14 #q16)
          :precondition (and (isconf #q14) (isconf #q16))
          :effect (isfreemotion #q14 #t614 #q16)
   )
   (:action s631_plan-free-motion
          :parameters (#q14 #q17)
          :precondition (and (isconf #q14) (isconf #q17))
          :effect (isfreemotion #q14 #t615 #q17)
   )
   (:action s632_plan-free-motion
          :parameters (#q15 q808)
          :precondition (and (isconf #q15) (isconf q808))
          :effect (isfreemotion #q15 #t616 q808)
   )
   (:action s633_plan-free-motion
          :parameters (#q15 #q0)
          :precondition (and (isconf #q15) (isconf #q0))
          :effect (isfreemotion #q15 #t617 #q0)
   )
   (:action s634_plan-free-motion
          :parameters (#q15 #q1)
          :precondition (and (isconf #q15) (isconf #q1))
          :effect (isfreemotion #q15 #t618 #q1)
   )
   (:action s635_plan-free-motion
          :parameters (#q15 #q2)
          :precondition (and (isconf #q15) (isconf #q2))
          :effect (isfreemotion #q15 #t619 #q2)
   )
   (:action s636_plan-free-motion
          :parameters (#q15 #q3)
          :precondition (and (isconf #q15) (isconf #q3))
          :effect (isfreemotion #q15 #t620 #q3)
   )
   (:action s637_plan-free-motion
          :parameters (#q15 #q4)
          :precondition (and (isconf #q15) (isconf #q4))
          :effect (isfreemotion #q15 #t621 #q4)
   )
   (:action s638_plan-free-motion
          :parameters (#q15 #q5)
          :precondition (and (isconf #q15) (isconf #q5))
          :effect (isfreemotion #q15 #t622 #q5)
   )
   (:action s639_plan-free-motion
          :parameters (#q15 #q6)
          :precondition (and (isconf #q15) (isconf #q6))
          :effect (isfreemotion #q15 #t623 #q6)
   )
   (:action s640_plan-free-motion
          :parameters (#q15 #q7)
          :precondition (and (isconf #q15) (isconf #q7))
          :effect (isfreemotion #q15 #t624 #q7)
   )
   (:action s641_plan-free-motion
          :parameters (#q15 #q8)
          :precondition (and (isconf #q15) (isconf #q8))
          :effect (isfreemotion #q15 #t625 #q8)
   )
   (:action s642_plan-free-motion
          :parameters (#q15 #q9)
          :precondition (and (isconf #q15) (isconf #q9))
          :effect (isfreemotion #q15 #t626 #q9)
   )
   (:action s643_plan-free-motion
          :parameters (#q15 #q10)
          :precondition (and (isconf #q15) (isconf #q10))
          :effect (isfreemotion #q15 #t627 #q10)
   )
   (:action s644_plan-free-motion
          :parameters (#q15 #q11)
          :precondition (and (isconf #q15) (isconf #q11))
          :effect (isfreemotion #q15 #t628 #q11)
   )
   (:action s645_plan-free-motion
          :parameters (#q15 #q12)
          :precondition (and (isconf #q15) (isconf #q12))
          :effect (isfreemotion #q15 #t629 #q12)
   )
   (:action s646_plan-free-motion
          :parameters (#q15 #q13)
          :precondition (and (isconf #q15) (isconf #q13))
          :effect (isfreemotion #q15 #t630 #q13)
   )
   (:action s647_plan-free-motion
          :parameters (#q15 #q14)
          :precondition (and (isconf #q15) (isconf #q14))
          :effect (isfreemotion #q15 #t631 #q14)
   )
   (:action s648_plan-free-motion
          :parameters (#q15 #q15)
          :precondition (and (isconf #q15) (isconf #q15))
          :effect (isfreemotion #q15 #t632 #q15)
   )
   (:action s649_plan-free-motion
          :parameters (#q15 #q16)
          :precondition (and (isconf #q15) (isconf #q16))
          :effect (isfreemotion #q15 #t633 #q16)
   )
   (:action s650_plan-free-motion
          :parameters (#q15 #q17)
          :precondition (and (isconf #q15) (isconf #q17))
          :effect (isfreemotion #q15 #t634 #q17)
   )
   (:action s651_plan-free-motion
          :parameters (#q16 q808)
          :precondition (and (isconf #q16) (isconf q808))
          :effect (isfreemotion #q16 #t635 q808)
   )
   (:action s652_plan-free-motion
          :parameters (#q16 #q0)
          :precondition (and (isconf #q16) (isconf #q0))
          :effect (isfreemotion #q16 #t636 #q0)
   )
   (:action s653_plan-free-motion
          :parameters (#q16 #q1)
          :precondition (and (isconf #q16) (isconf #q1))
          :effect (isfreemotion #q16 #t637 #q1)
   )
   (:action s654_plan-free-motion
          :parameters (#q16 #q2)
          :precondition (and (isconf #q16) (isconf #q2))
          :effect (isfreemotion #q16 #t638 #q2)
   )
   (:action s655_plan-free-motion
          :parameters (#q16 #q3)
          :precondition (and (isconf #q16) (isconf #q3))
          :effect (isfreemotion #q16 #t639 #q3)
   )
   (:action s656_plan-free-motion
          :parameters (#q16 #q4)
          :precondition (and (isconf #q16) (isconf #q4))
          :effect (isfreemotion #q16 #t640 #q4)
   )
   (:action s657_plan-free-motion
          :parameters (#q16 #q5)
          :precondition (and (isconf #q16) (isconf #q5))
          :effect (isfreemotion #q16 #t641 #q5)
   )
   (:action s658_plan-free-motion
          :parameters (#q16 #q6)
          :precondition (and (isconf #q16) (isconf #q6))
          :effect (isfreemotion #q16 #t642 #q6)
   )
   (:action s659_plan-free-motion
          :parameters (#q16 #q7)
          :precondition (and (isconf #q16) (isconf #q7))
          :effect (isfreemotion #q16 #t643 #q7)
   )
   (:action s660_plan-free-motion
          :parameters (#q16 #q8)
          :precondition (and (isconf #q16) (isconf #q8))
          :effect (isfreemotion #q16 #t644 #q8)
   )
   (:action s661_plan-free-motion
          :parameters (#q16 #q9)
          :precondition (and (isconf #q16) (isconf #q9))
          :effect (isfreemotion #q16 #t645 #q9)
   )
   (:action s662_plan-free-motion
          :parameters (#q16 #q10)
          :precondition (and (isconf #q16) (isconf #q10))
          :effect (isfreemotion #q16 #t646 #q10)
   )
   (:action s663_plan-free-motion
          :parameters (#q16 #q11)
          :precondition (and (isconf #q16) (isconf #q11))
          :effect (isfreemotion #q16 #t647 #q11)
   )
   (:action s664_plan-free-motion
          :parameters (#q16 #q12)
          :precondition (and (isconf #q16) (isconf #q12))
          :effect (isfreemotion #q16 #t648 #q12)
   )
   (:action s665_plan-free-motion
          :parameters (#q16 #q13)
          :precondition (and (isconf #q16) (isconf #q13))
          :effect (isfreemotion #q16 #t649 #q13)
   )
   (:action s666_plan-free-motion
          :parameters (#q16 #q14)
          :precondition (and (isconf #q16) (isconf #q14))
          :effect (isfreemotion #q16 #t650 #q14)
   )
   (:action s667_plan-free-motion
          :parameters (#q16 #q15)
          :precondition (and (isconf #q16) (isconf #q15))
          :effect (isfreemotion #q16 #t651 #q15)
   )
   (:action s668_plan-free-motion
          :parameters (#q16 #q16)
          :precondition (and (isconf #q16) (isconf #q16))
          :effect (isfreemotion #q16 #t652 #q16)
   )
   (:action s669_plan-free-motion
          :parameters (#q16 #q17)
          :precondition (and (isconf #q16) (isconf #q17))
          :effect (isfreemotion #q16 #t653 #q17)
   )
   (:action s670_plan-free-motion
          :parameters (#q17 q808)
          :precondition (and (isconf #q17) (isconf q808))
          :effect (isfreemotion #q17 #t654 q808)
   )
   (:action s671_plan-free-motion
          :parameters (#q17 #q0)
          :precondition (and (isconf #q17) (isconf #q0))
          :effect (isfreemotion #q17 #t655 #q0)
   )
   (:action s672_plan-free-motion
          :parameters (#q17 #q1)
          :precondition (and (isconf #q17) (isconf #q1))
          :effect (isfreemotion #q17 #t656 #q1)
   )
   (:action s673_plan-free-motion
          :parameters (#q17 #q2)
          :precondition (and (isconf #q17) (isconf #q2))
          :effect (isfreemotion #q17 #t657 #q2)
   )
   (:action s674_plan-free-motion
          :parameters (#q17 #q3)
          :precondition (and (isconf #q17) (isconf #q3))
          :effect (isfreemotion #q17 #t658 #q3)
   )
   (:action s675_plan-free-motion
          :parameters (#q17 #q4)
          :precondition (and (isconf #q17) (isconf #q4))
          :effect (isfreemotion #q17 #t659 #q4)
   )
   (:action s676_plan-free-motion
          :parameters (#q17 #q5)
          :precondition (and (isconf #q17) (isconf #q5))
          :effect (isfreemotion #q17 #t660 #q5)
   )
   (:action s677_plan-free-motion
          :parameters (#q17 #q6)
          :precondition (and (isconf #q17) (isconf #q6))
          :effect (isfreemotion #q17 #t661 #q6)
   )
   (:action s678_plan-free-motion
          :parameters (#q17 #q7)
          :precondition (and (isconf #q17) (isconf #q7))
          :effect (isfreemotion #q17 #t662 #q7)
   )
   (:action s679_plan-free-motion
          :parameters (#q17 #q8)
          :precondition (and (isconf #q17) (isconf #q8))
          :effect (isfreemotion #q17 #t663 #q8)
   )
   (:action s680_plan-free-motion
          :parameters (#q17 #q9)
          :precondition (and (isconf #q17) (isconf #q9))
          :effect (isfreemotion #q17 #t664 #q9)
   )
   (:action s681_plan-free-motion
          :parameters (#q17 #q10)
          :precondition (and (isconf #q17) (isconf #q10))
          :effect (isfreemotion #q17 #t665 #q10)
   )
   (:action s682_plan-free-motion
          :parameters (#q17 #q11)
          :precondition (and (isconf #q17) (isconf #q11))
          :effect (isfreemotion #q17 #t666 #q11)
   )
   (:action s683_plan-free-motion
          :parameters (#q17 #q12)
          :precondition (and (isconf #q17) (isconf #q12))
          :effect (isfreemotion #q17 #t667 #q12)
   )
   (:action s684_plan-free-motion
          :parameters (#q17 #q13)
          :precondition (and (isconf #q17) (isconf #q13))
          :effect (isfreemotion #q17 #t668 #q13)
   )
   (:action s685_plan-free-motion
          :parameters (#q17 #q14)
          :precondition (and (isconf #q17) (isconf #q14))
          :effect (isfreemotion #q17 #t669 #q14)
   )
   (:action s686_plan-free-motion
          :parameters (#q17 #q15)
          :precondition (and (isconf #q17) (isconf #q15))
          :effect (isfreemotion #q17 #t670 #q15)
   )
   (:action s687_plan-free-motion
          :parameters (#q17 #q16)
          :precondition (and (isconf #q17) (isconf #q16))
          :effect (isfreemotion #q17 #t671 #q16)
   )
   (:action s688_plan-free-motion
          :parameters (#q17 #q17)
          :precondition (and (isconf #q17) (isconf #q17))
          :effect (isfreemotion #q17 #t672 #q17)
   )
   (:action s689_plan-holding-motion
          :parameters (q808 #q6 o8 #g0)
          :precondition (and (isconf q808) (isconf #q6) (isgrasp o8 #g0))
          :effect (isholdingmotion q808 #t673 #q6 o8 #g0)
   )
   (:action s690_plan-holding-motion
          :parameters (q808 #q6 o9 #g1)
          :precondition (and (isconf q808) (isconf #q6) (isgrasp o9 #g1))
          :effect (isholdingmotion q808 #t674 #q6 o9 #g1)
   )
   (:action s691_plan-holding-motion
          :parameters (q808 #q6 o8 #g2)
          :precondition (and (isconf q808) (isconf #q6) (isgrasp o8 #g2))
          :effect (isholdingmotion q808 #t675 #q6 o8 #g2)
   )
   (:action s692_plan-holding-motion
          :parameters (q808 #q6 o8 #g3)
          :precondition (and (isconf q808) (isconf #q6) (isgrasp o8 #g3))
          :effect (isholdingmotion q808 #t676 #q6 o8 #g3)
   )
   (:action s693_plan-holding-motion
          :parameters (q808 #q6 o9 #g4)
          :precondition (and (isconf q808) (isconf #q6) (isgrasp o9 #g4))
          :effect (isholdingmotion q808 #t677 #q6 o9 #g4)
   )
   (:action s694_plan-holding-motion
          :parameters (q808 #q6 o9 #g5)
          :precondition (and (isconf q808) (isconf #q6) (isgrasp o9 #g5))
          :effect (isholdingmotion q808 #t678 #q6 o9 #g5)
   )
   (:action s695_plan-holding-motion
          :parameters (q808 #q7 o8 #g0)
          :precondition (and (isconf q808) (isconf #q7) (isgrasp o8 #g0))
          :effect (isholdingmotion q808 #t679 #q7 o8 #g0)
   )
   (:action s696_plan-holding-motion
          :parameters (q808 #q7 o9 #g1)
          :precondition (and (isconf q808) (isconf #q7) (isgrasp o9 #g1))
          :effect (isholdingmotion q808 #t680 #q7 o9 #g1)
   )
   (:action s697_plan-holding-motion
          :parameters (q808 #q7 o8 #g2)
          :precondition (and (isconf q808) (isconf #q7) (isgrasp o8 #g2))
          :effect (isholdingmotion q808 #t681 #q7 o8 #g2)
   )
   (:action s698_plan-holding-motion
          :parameters (q808 #q7 o8 #g3)
          :precondition (and (isconf q808) (isconf #q7) (isgrasp o8 #g3))
          :effect (isholdingmotion q808 #t682 #q7 o8 #g3)
   )
   (:action s699_plan-holding-motion
          :parameters (q808 #q7 o9 #g4)
          :precondition (and (isconf q808) (isconf #q7) (isgrasp o9 #g4))
          :effect (isholdingmotion q808 #t683 #q7 o9 #g4)
   )
   (:action s700_plan-holding-motion
          :parameters (q808 #q7 o9 #g5)
          :precondition (and (isconf q808) (isconf #q7) (isgrasp o9 #g5))
          :effect (isholdingmotion q808 #t684 #q7 o9 #g5)
   )
   (:action s701_plan-holding-motion
          :parameters (q808 #q8 o8 #g0)
          :precondition (and (isconf q808) (isconf #q8) (isgrasp o8 #g0))
          :effect (isholdingmotion q808 #t685 #q8 o8 #g0)
   )
   (:action s702_plan-holding-motion
          :parameters (q808 #q8 o9 #g1)
          :precondition (and (isconf q808) (isconf #q8) (isgrasp o9 #g1))
          :effect (isholdingmotion q808 #t686 #q8 o9 #g1)
   )
   (:action s703_plan-holding-motion
          :parameters (q808 #q8 o8 #g2)
          :precondition (and (isconf q808) (isconf #q8) (isgrasp o8 #g2))
          :effect (isholdingmotion q808 #t687 #q8 o8 #g2)
   )
   (:action s704_plan-holding-motion
          :parameters (q808 #q8 o8 #g3)
          :precondition (and (isconf q808) (isconf #q8) (isgrasp o8 #g3))
          :effect (isholdingmotion q808 #t688 #q8 o8 #g3)
   )
   (:action s705_plan-holding-motion
          :parameters (q808 #q8 o9 #g4)
          :precondition (and (isconf q808) (isconf #q8) (isgrasp o9 #g4))
          :effect (isholdingmotion q808 #t689 #q8 o9 #g4)
   )
   (:action s706_plan-holding-motion
          :parameters (q808 #q8 o9 #g5)
          :precondition (and (isconf q808) (isconf #q8) (isgrasp o9 #g5))
          :effect (isholdingmotion q808 #t690 #q8 o9 #g5)
   )
   (:action s707_plan-holding-motion
          :parameters (q808 #q9 o8 #g0)
          :precondition (and (isconf q808) (isconf #q9) (isgrasp o8 #g0))
          :effect (isholdingmotion q808 #t691 #q9 o8 #g0)
   )
   (:action s708_plan-holding-motion
          :parameters (q808 #q9 o9 #g1)
          :precondition (and (isconf q808) (isconf #q9) (isgrasp o9 #g1))
          :effect (isholdingmotion q808 #t692 #q9 o9 #g1)
   )
   (:action s709_plan-holding-motion
          :parameters (q808 #q9 o8 #g2)
          :precondition (and (isconf q808) (isconf #q9) (isgrasp o8 #g2))
          :effect (isholdingmotion q808 #t693 #q9 o8 #g2)
   )
   (:action s710_plan-holding-motion
          :parameters (q808 #q9 o8 #g3)
          :precondition (and (isconf q808) (isconf #q9) (isgrasp o8 #g3))
          :effect (isholdingmotion q808 #t694 #q9 o8 #g3)
   )
   (:action s711_plan-holding-motion
          :parameters (q808 #q9 o9 #g4)
          :precondition (and (isconf q808) (isconf #q9) (isgrasp o9 #g4))
          :effect (isholdingmotion q808 #t695 #q9 o9 #g4)
   )
   (:action s712_plan-holding-motion
          :parameters (q808 #q9 o9 #g5)
          :precondition (and (isconf q808) (isconf #q9) (isgrasp o9 #g5))
          :effect (isholdingmotion q808 #t696 #q9 o9 #g5)
   )
   (:action s713_plan-holding-motion
          :parameters (q808 #q10 o8 #g0)
          :precondition (and (isconf q808) (isconf #q10) (isgrasp o8 #g0))
          :effect (isholdingmotion q808 #t697 #q10 o8 #g0)
   )
   (:action s714_plan-holding-motion
          :parameters (q808 #q10 o9 #g1)
          :precondition (and (isconf q808) (isconf #q10) (isgrasp o9 #g1))
          :effect (isholdingmotion q808 #t698 #q10 o9 #g1)
   )
   (:action s715_plan-holding-motion
          :parameters (q808 #q10 o8 #g2)
          :precondition (and (isconf q808) (isconf #q10) (isgrasp o8 #g2))
          :effect (isholdingmotion q808 #t699 #q10 o8 #g2)
   )
   (:action s716_plan-holding-motion
          :parameters (q808 #q10 o8 #g3)
          :precondition (and (isconf q808) (isconf #q10) (isgrasp o8 #g3))
          :effect (isholdingmotion q808 #t700 #q10 o8 #g3)
   )
   (:action s717_plan-holding-motion
          :parameters (q808 #q10 o9 #g4)
          :precondition (and (isconf q808) (isconf #q10) (isgrasp o9 #g4))
          :effect (isholdingmotion q808 #t701 #q10 o9 #g4)
   )
   (:action s718_plan-holding-motion
          :parameters (q808 #q10 o9 #g5)
          :precondition (and (isconf q808) (isconf #q10) (isgrasp o9 #g5))
          :effect (isholdingmotion q808 #t702 #q10 o9 #g5)
   )
   (:action s719_plan-holding-motion
          :parameters (q808 #q11 o8 #g0)
          :precondition (and (isconf q808) (isconf #q11) (isgrasp o8 #g0))
          :effect (isholdingmotion q808 #t703 #q11 o8 #g0)
   )
   (:action s720_plan-holding-motion
          :parameters (q808 #q11 o9 #g1)
          :precondition (and (isconf q808) (isconf #q11) (isgrasp o9 #g1))
          :effect (isholdingmotion q808 #t704 #q11 o9 #g1)
   )
   (:action s721_plan-holding-motion
          :parameters (q808 #q11 o8 #g2)
          :precondition (and (isconf q808) (isconf #q11) (isgrasp o8 #g2))
          :effect (isholdingmotion q808 #t705 #q11 o8 #g2)
   )
   (:action s722_plan-holding-motion
          :parameters (q808 #q11 o8 #g3)
          :precondition (and (isconf q808) (isconf #q11) (isgrasp o8 #g3))
          :effect (isholdingmotion q808 #t706 #q11 o8 #g3)
   )
   (:action s723_plan-holding-motion
          :parameters (q808 #q11 o9 #g4)
          :precondition (and (isconf q808) (isconf #q11) (isgrasp o9 #g4))
          :effect (isholdingmotion q808 #t707 #q11 o9 #g4)
   )
   (:action s724_plan-holding-motion
          :parameters (q808 #q11 o9 #g5)
          :precondition (and (isconf q808) (isconf #q11) (isgrasp o9 #g5))
          :effect (isholdingmotion q808 #t708 #q11 o9 #g5)
   )
   (:action s725_plan-holding-motion
          :parameters (q808 #q12 o8 #g0)
          :precondition (and (isconf q808) (isconf #q12) (isgrasp o8 #g0))
          :effect (isholdingmotion q808 #t709 #q12 o8 #g0)
   )
   (:action s726_plan-holding-motion
          :parameters (q808 #q12 o9 #g1)
          :precondition (and (isconf q808) (isconf #q12) (isgrasp o9 #g1))
          :effect (isholdingmotion q808 #t710 #q12 o9 #g1)
   )
   (:action s727_plan-holding-motion
          :parameters (q808 #q12 o8 #g2)
          :precondition (and (isconf q808) (isconf #q12) (isgrasp o8 #g2))
          :effect (isholdingmotion q808 #t711 #q12 o8 #g2)
   )
   (:action s728_plan-holding-motion
          :parameters (q808 #q12 o8 #g3)
          :precondition (and (isconf q808) (isconf #q12) (isgrasp o8 #g3))
          :effect (isholdingmotion q808 #t712 #q12 o8 #g3)
   )
   (:action s729_plan-holding-motion
          :parameters (q808 #q12 o9 #g4)
          :precondition (and (isconf q808) (isconf #q12) (isgrasp o9 #g4))
          :effect (isholdingmotion q808 #t713 #q12 o9 #g4)
   )
   (:action s730_plan-holding-motion
          :parameters (q808 #q12 o9 #g5)
          :precondition (and (isconf q808) (isconf #q12) (isgrasp o9 #g5))
          :effect (isholdingmotion q808 #t714 #q12 o9 #g5)
   )
   (:action s731_plan-holding-motion
          :parameters (q808 #q13 o8 #g0)
          :precondition (and (isconf q808) (isconf #q13) (isgrasp o8 #g0))
          :effect (isholdingmotion q808 #t715 #q13 o8 #g0)
   )
   (:action s732_plan-holding-motion
          :parameters (q808 #q13 o9 #g1)
          :precondition (and (isconf q808) (isconf #q13) (isgrasp o9 #g1))
          :effect (isholdingmotion q808 #t716 #q13 o9 #g1)
   )
   (:action s733_plan-holding-motion
          :parameters (q808 #q13 o8 #g2)
          :precondition (and (isconf q808) (isconf #q13) (isgrasp o8 #g2))
          :effect (isholdingmotion q808 #t717 #q13 o8 #g2)
   )
   (:action s734_plan-holding-motion
          :parameters (q808 #q13 o8 #g3)
          :precondition (and (isconf q808) (isconf #q13) (isgrasp o8 #g3))
          :effect (isholdingmotion q808 #t718 #q13 o8 #g3)
   )
   (:action s735_plan-holding-motion
          :parameters (q808 #q13 o9 #g4)
          :precondition (and (isconf q808) (isconf #q13) (isgrasp o9 #g4))
          :effect (isholdingmotion q808 #t719 #q13 o9 #g4)
   )
   (:action s736_plan-holding-motion
          :parameters (q808 #q13 o9 #g5)
          :precondition (and (isconf q808) (isconf #q13) (isgrasp o9 #g5))
          :effect (isholdingmotion q808 #t720 #q13 o9 #g5)
   )
   (:action s737_plan-holding-motion
          :parameters (q808 #q14 o8 #g0)
          :precondition (and (isconf q808) (isconf #q14) (isgrasp o8 #g0))
          :effect (isholdingmotion q808 #t721 #q14 o8 #g0)
   )
   (:action s738_plan-holding-motion
          :parameters (q808 #q14 o9 #g1)
          :precondition (and (isconf q808) (isconf #q14) (isgrasp o9 #g1))
          :effect (isholdingmotion q808 #t722 #q14 o9 #g1)
   )
   (:action s739_plan-holding-motion
          :parameters (q808 #q14 o8 #g2)
          :precondition (and (isconf q808) (isconf #q14) (isgrasp o8 #g2))
          :effect (isholdingmotion q808 #t723 #q14 o8 #g2)
   )
   (:action s740_plan-holding-motion
          :parameters (q808 #q14 o8 #g3)
          :precondition (and (isconf q808) (isconf #q14) (isgrasp o8 #g3))
          :effect (isholdingmotion q808 #t724 #q14 o8 #g3)
   )
   (:action s741_plan-holding-motion
          :parameters (q808 #q14 o9 #g4)
          :precondition (and (isconf q808) (isconf #q14) (isgrasp o9 #g4))
          :effect (isholdingmotion q808 #t725 #q14 o9 #g4)
   )
   (:action s742_plan-holding-motion
          :parameters (q808 #q14 o9 #g5)
          :precondition (and (isconf q808) (isconf #q14) (isgrasp o9 #g5))
          :effect (isholdingmotion q808 #t726 #q14 o9 #g5)
   )
   (:action s743_plan-holding-motion
          :parameters (q808 #q15 o8 #g0)
          :precondition (and (isconf q808) (isconf #q15) (isgrasp o8 #g0))
          :effect (isholdingmotion q808 #t727 #q15 o8 #g0)
   )
   (:action s744_plan-holding-motion
          :parameters (q808 #q15 o9 #g1)
          :precondition (and (isconf q808) (isconf #q15) (isgrasp o9 #g1))
          :effect (isholdingmotion q808 #t728 #q15 o9 #g1)
   )
   (:action s745_plan-holding-motion
          :parameters (q808 #q15 o8 #g2)
          :precondition (and (isconf q808) (isconf #q15) (isgrasp o8 #g2))
          :effect (isholdingmotion q808 #t729 #q15 o8 #g2)
   )
   (:action s746_plan-holding-motion
          :parameters (q808 #q15 o8 #g3)
          :precondition (and (isconf q808) (isconf #q15) (isgrasp o8 #g3))
          :effect (isholdingmotion q808 #t730 #q15 o8 #g3)
   )
   (:action s747_plan-holding-motion
          :parameters (q808 #q15 o9 #g4)
          :precondition (and (isconf q808) (isconf #q15) (isgrasp o9 #g4))
          :effect (isholdingmotion q808 #t731 #q15 o9 #g4)
   )
   (:action s748_plan-holding-motion
          :parameters (q808 #q15 o9 #g5)
          :precondition (and (isconf q808) (isconf #q15) (isgrasp o9 #g5))
          :effect (isholdingmotion q808 #t732 #q15 o9 #g5)
   )
   (:action s749_plan-holding-motion
          :parameters (q808 #q16 o8 #g0)
          :precondition (and (isconf q808) (isconf #q16) (isgrasp o8 #g0))
          :effect (isholdingmotion q808 #t733 #q16 o8 #g0)
   )
   (:action s750_plan-holding-motion
          :parameters (q808 #q16 o9 #g1)
          :precondition (and (isconf q808) (isconf #q16) (isgrasp o9 #g1))
          :effect (isholdingmotion q808 #t734 #q16 o9 #g1)
   )
   (:action s751_plan-holding-motion
          :parameters (q808 #q16 o8 #g2)
          :precondition (and (isconf q808) (isconf #q16) (isgrasp o8 #g2))
          :effect (isholdingmotion q808 #t735 #q16 o8 #g2)
   )
   (:action s752_plan-holding-motion
          :parameters (q808 #q16 o8 #g3)
          :precondition (and (isconf q808) (isconf #q16) (isgrasp o8 #g3))
          :effect (isholdingmotion q808 #t736 #q16 o8 #g3)
   )
   (:action s753_plan-holding-motion
          :parameters (q808 #q16 o9 #g4)
          :precondition (and (isconf q808) (isconf #q16) (isgrasp o9 #g4))
          :effect (isholdingmotion q808 #t737 #q16 o9 #g4)
   )
   (:action s754_plan-holding-motion
          :parameters (q808 #q16 o9 #g5)
          :precondition (and (isconf q808) (isconf #q16) (isgrasp o9 #g5))
          :effect (isholdingmotion q808 #t738 #q16 o9 #g5)
   )
   (:action s755_plan-holding-motion
          :parameters (q808 #q17 o8 #g0)
          :precondition (and (isconf q808) (isconf #q17) (isgrasp o8 #g0))
          :effect (isholdingmotion q808 #t739 #q17 o8 #g0)
   )
   (:action s756_plan-holding-motion
          :parameters (q808 #q17 o9 #g1)
          :precondition (and (isconf q808) (isconf #q17) (isgrasp o9 #g1))
          :effect (isholdingmotion q808 #t740 #q17 o9 #g1)
   )
   (:action s757_plan-holding-motion
          :parameters (q808 #q17 o8 #g2)
          :precondition (and (isconf q808) (isconf #q17) (isgrasp o8 #g2))
          :effect (isholdingmotion q808 #t741 #q17 o8 #g2)
   )
   (:action s758_plan-holding-motion
          :parameters (q808 #q17 o8 #g3)
          :precondition (and (isconf q808) (isconf #q17) (isgrasp o8 #g3))
          :effect (isholdingmotion q808 #t742 #q17 o8 #g3)
   )
   (:action s759_plan-holding-motion
          :parameters (q808 #q17 o9 #g4)
          :precondition (and (isconf q808) (isconf #q17) (isgrasp o9 #g4))
          :effect (isholdingmotion q808 #t743 #q17 o9 #g4)
   )
   (:action s760_plan-holding-motion
          :parameters (q808 #q17 o9 #g5)
          :precondition (and (isconf q808) (isconf #q17) (isgrasp o9 #g5))
          :effect (isholdingmotion q808 #t744 #q17 o9 #g5)
   )
   (:action s761_plan-holding-motion
          :parameters (#q0 #q6 o8 #g0)
          :precondition (and (isconf #q0) (isconf #q6) (isgrasp o8 #g0))
          :effect (isholdingmotion #q0 #t745 #q6 o8 #g0)
   )
   (:action s762_plan-holding-motion
          :parameters (#q0 #q6 o9 #g1)
          :precondition (and (isconf #q0) (isconf #q6) (isgrasp o9 #g1))
          :effect (isholdingmotion #q0 #t746 #q6 o9 #g1)
   )
   (:action s763_plan-holding-motion
          :parameters (#q0 #q6 o8 #g2)
          :precondition (and (isconf #q0) (isconf #q6) (isgrasp o8 #g2))
          :effect (isholdingmotion #q0 #t747 #q6 o8 #g2)
   )
   (:action s764_plan-holding-motion
          :parameters (#q0 #q6 o8 #g3)
          :precondition (and (isconf #q0) (isconf #q6) (isgrasp o8 #g3))
          :effect (isholdingmotion #q0 #t748 #q6 o8 #g3)
   )
   (:action s765_plan-holding-motion
          :parameters (#q0 #q6 o9 #g4)
          :precondition (and (isconf #q0) (isconf #q6) (isgrasp o9 #g4))
          :effect (isholdingmotion #q0 #t749 #q6 o9 #g4)
   )
   (:action s766_plan-holding-motion
          :parameters (#q0 #q6 o9 #g5)
          :precondition (and (isconf #q0) (isconf #q6) (isgrasp o9 #g5))
          :effect (isholdingmotion #q0 #t750 #q6 o9 #g5)
   )
   (:action s767_plan-holding-motion
          :parameters (#q0 #q7 o8 #g0)
          :precondition (and (isconf #q0) (isconf #q7) (isgrasp o8 #g0))
          :effect (isholdingmotion #q0 #t751 #q7 o8 #g0)
   )
   (:action s768_plan-holding-motion
          :parameters (#q0 #q7 o9 #g1)
          :precondition (and (isconf #q0) (isconf #q7) (isgrasp o9 #g1))
          :effect (isholdingmotion #q0 #t752 #q7 o9 #g1)
   )
   (:action s769_plan-holding-motion
          :parameters (#q0 #q7 o8 #g2)
          :precondition (and (isconf #q0) (isconf #q7) (isgrasp o8 #g2))
          :effect (isholdingmotion #q0 #t753 #q7 o8 #g2)
   )
   (:action s770_plan-holding-motion
          :parameters (#q0 #q7 o8 #g3)
          :precondition (and (isconf #q0) (isconf #q7) (isgrasp o8 #g3))
          :effect (isholdingmotion #q0 #t754 #q7 o8 #g3)
   )
   (:action s771_plan-holding-motion
          :parameters (#q0 #q7 o9 #g4)
          :precondition (and (isconf #q0) (isconf #q7) (isgrasp o9 #g4))
          :effect (isholdingmotion #q0 #t755 #q7 o9 #g4)
   )
   (:action s772_plan-holding-motion
          :parameters (#q0 #q7 o9 #g5)
          :precondition (and (isconf #q0) (isconf #q7) (isgrasp o9 #g5))
          :effect (isholdingmotion #q0 #t756 #q7 o9 #g5)
   )
   (:action s773_plan-holding-motion
          :parameters (#q0 #q8 o8 #g0)
          :precondition (and (isconf #q0) (isconf #q8) (isgrasp o8 #g0))
          :effect (isholdingmotion #q0 #t757 #q8 o8 #g0)
   )
   (:action s774_plan-holding-motion
          :parameters (#q0 #q8 o9 #g1)
          :precondition (and (isconf #q0) (isconf #q8) (isgrasp o9 #g1))
          :effect (isholdingmotion #q0 #t758 #q8 o9 #g1)
   )
   (:action s775_plan-holding-motion
          :parameters (#q0 #q8 o8 #g2)
          :precondition (and (isconf #q0) (isconf #q8) (isgrasp o8 #g2))
          :effect (isholdingmotion #q0 #t759 #q8 o8 #g2)
   )
   (:action s776_plan-holding-motion
          :parameters (#q0 #q8 o8 #g3)
          :precondition (and (isconf #q0) (isconf #q8) (isgrasp o8 #g3))
          :effect (isholdingmotion #q0 #t760 #q8 o8 #g3)
   )
   (:action s777_plan-holding-motion
          :parameters (#q0 #q8 o9 #g4)
          :precondition (and (isconf #q0) (isconf #q8) (isgrasp o9 #g4))
          :effect (isholdingmotion #q0 #t761 #q8 o9 #g4)
   )
   (:action s778_plan-holding-motion
          :parameters (#q0 #q8 o9 #g5)
          :precondition (and (isconf #q0) (isconf #q8) (isgrasp o9 #g5))
          :effect (isholdingmotion #q0 #t762 #q8 o9 #g5)
   )
   (:action s779_plan-holding-motion
          :parameters (#q0 #q9 o8 #g0)
          :precondition (and (isconf #q0) (isconf #q9) (isgrasp o8 #g0))
          :effect (isholdingmotion #q0 #t763 #q9 o8 #g0)
   )
   (:action s780_plan-holding-motion
          :parameters (#q0 #q9 o9 #g1)
          :precondition (and (isconf #q0) (isconf #q9) (isgrasp o9 #g1))
          :effect (isholdingmotion #q0 #t764 #q9 o9 #g1)
   )
   (:action s781_plan-holding-motion
          :parameters (#q0 #q9 o8 #g2)
          :precondition (and (isconf #q0) (isconf #q9) (isgrasp o8 #g2))
          :effect (isholdingmotion #q0 #t765 #q9 o8 #g2)
   )
   (:action s782_plan-holding-motion
          :parameters (#q0 #q9 o8 #g3)
          :precondition (and (isconf #q0) (isconf #q9) (isgrasp o8 #g3))
          :effect (isholdingmotion #q0 #t766 #q9 o8 #g3)
   )
   (:action s783_plan-holding-motion
          :parameters (#q0 #q9 o9 #g4)
          :precondition (and (isconf #q0) (isconf #q9) (isgrasp o9 #g4))
          :effect (isholdingmotion #q0 #t767 #q9 o9 #g4)
   )
   (:action s784_plan-holding-motion
          :parameters (#q0 #q9 o9 #g5)
          :precondition (and (isconf #q0) (isconf #q9) (isgrasp o9 #g5))
          :effect (isholdingmotion #q0 #t768 #q9 o9 #g5)
   )
   (:action s785_plan-holding-motion
          :parameters (#q0 #q10 o8 #g0)
          :precondition (and (isconf #q0) (isconf #q10) (isgrasp o8 #g0))
          :effect (isholdingmotion #q0 #t769 #q10 o8 #g0)
   )
   (:action s786_plan-holding-motion
          :parameters (#q0 #q10 o9 #g1)
          :precondition (and (isconf #q0) (isconf #q10) (isgrasp o9 #g1))
          :effect (isholdingmotion #q0 #t770 #q10 o9 #g1)
   )
   (:action s787_plan-holding-motion
          :parameters (#q0 #q10 o8 #g2)
          :precondition (and (isconf #q0) (isconf #q10) (isgrasp o8 #g2))
          :effect (isholdingmotion #q0 #t771 #q10 o8 #g2)
   )
   (:action s788_plan-holding-motion
          :parameters (#q0 #q10 o8 #g3)
          :precondition (and (isconf #q0) (isconf #q10) (isgrasp o8 #g3))
          :effect (isholdingmotion #q0 #t772 #q10 o8 #g3)
   )
   (:action s789_plan-holding-motion
          :parameters (#q0 #q10 o9 #g4)
          :precondition (and (isconf #q0) (isconf #q10) (isgrasp o9 #g4))
          :effect (isholdingmotion #q0 #t773 #q10 o9 #g4)
   )
   (:action s790_plan-holding-motion
          :parameters (#q0 #q10 o9 #g5)
          :precondition (and (isconf #q0) (isconf #q10) (isgrasp o9 #g5))
          :effect (isholdingmotion #q0 #t774 #q10 o9 #g5)
   )
   (:action s791_plan-holding-motion
          :parameters (#q0 #q11 o8 #g0)
          :precondition (and (isconf #q0) (isconf #q11) (isgrasp o8 #g0))
          :effect (isholdingmotion #q0 #t775 #q11 o8 #g0)
   )
   (:action s792_plan-holding-motion
          :parameters (#q0 #q11 o9 #g1)
          :precondition (and (isconf #q0) (isconf #q11) (isgrasp o9 #g1))
          :effect (isholdingmotion #q0 #t776 #q11 o9 #g1)
   )
   (:action s793_plan-holding-motion
          :parameters (#q0 #q11 o8 #g2)
          :precondition (and (isconf #q0) (isconf #q11) (isgrasp o8 #g2))
          :effect (isholdingmotion #q0 #t777 #q11 o8 #g2)
   )
   (:action s794_plan-holding-motion
          :parameters (#q0 #q11 o8 #g3)
          :precondition (and (isconf #q0) (isconf #q11) (isgrasp o8 #g3))
          :effect (isholdingmotion #q0 #t778 #q11 o8 #g3)
   )
   (:action s795_plan-holding-motion
          :parameters (#q0 #q11 o9 #g4)
          :precondition (and (isconf #q0) (isconf #q11) (isgrasp o9 #g4))
          :effect (isholdingmotion #q0 #t779 #q11 o9 #g4)
   )
   (:action s796_plan-holding-motion
          :parameters (#q0 #q11 o9 #g5)
          :precondition (and (isconf #q0) (isconf #q11) (isgrasp o9 #g5))
          :effect (isholdingmotion #q0 #t780 #q11 o9 #g5)
   )
   (:action s797_plan-holding-motion
          :parameters (#q0 #q12 o8 #g0)
          :precondition (and (isconf #q0) (isconf #q12) (isgrasp o8 #g0))
          :effect (isholdingmotion #q0 #t781 #q12 o8 #g0)
   )
   (:action s798_plan-holding-motion
          :parameters (#q0 #q12 o9 #g1)
          :precondition (and (isconf #q0) (isconf #q12) (isgrasp o9 #g1))
          :effect (isholdingmotion #q0 #t782 #q12 o9 #g1)
   )
   (:action s799_plan-holding-motion
          :parameters (#q0 #q12 o8 #g2)
          :precondition (and (isconf #q0) (isconf #q12) (isgrasp o8 #g2))
          :effect (isholdingmotion #q0 #t783 #q12 o8 #g2)
   )
   (:action s800_plan-holding-motion
          :parameters (#q0 #q12 o8 #g3)
          :precondition (and (isconf #q0) (isconf #q12) (isgrasp o8 #g3))
          :effect (isholdingmotion #q0 #t784 #q12 o8 #g3)
   )
   (:action s801_plan-holding-motion
          :parameters (#q0 #q12 o9 #g4)
          :precondition (and (isconf #q0) (isconf #q12) (isgrasp o9 #g4))
          :effect (isholdingmotion #q0 #t785 #q12 o9 #g4)
   )
   (:action s802_plan-holding-motion
          :parameters (#q0 #q12 o9 #g5)
          :precondition (and (isconf #q0) (isconf #q12) (isgrasp o9 #g5))
          :effect (isholdingmotion #q0 #t786 #q12 o9 #g5)
   )
   (:action s803_plan-holding-motion
          :parameters (#q0 #q13 o8 #g0)
          :precondition (and (isconf #q0) (isconf #q13) (isgrasp o8 #g0))
          :effect (isholdingmotion #q0 #t787 #q13 o8 #g0)
   )
   (:action s804_plan-holding-motion
          :parameters (#q0 #q13 o9 #g1)
          :precondition (and (isconf #q0) (isconf #q13) (isgrasp o9 #g1))
          :effect (isholdingmotion #q0 #t788 #q13 o9 #g1)
   )
   (:action s805_plan-holding-motion
          :parameters (#q0 #q13 o8 #g2)
          :precondition (and (isconf #q0) (isconf #q13) (isgrasp o8 #g2))
          :effect (isholdingmotion #q0 #t789 #q13 o8 #g2)
   )
   (:action s806_plan-holding-motion
          :parameters (#q0 #q13 o8 #g3)
          :precondition (and (isconf #q0) (isconf #q13) (isgrasp o8 #g3))
          :effect (isholdingmotion #q0 #t790 #q13 o8 #g3)
   )
   (:action s807_plan-holding-motion
          :parameters (#q0 #q13 o9 #g4)
          :precondition (and (isconf #q0) (isconf #q13) (isgrasp o9 #g4))
          :effect (isholdingmotion #q0 #t791 #q13 o9 #g4)
   )
   (:action s808_plan-holding-motion
          :parameters (#q0 #q13 o9 #g5)
          :precondition (and (isconf #q0) (isconf #q13) (isgrasp o9 #g5))
          :effect (isholdingmotion #q0 #t792 #q13 o9 #g5)
   )
   (:action s809_plan-holding-motion
          :parameters (#q0 #q14 o8 #g0)
          :precondition (and (isconf #q0) (isconf #q14) (isgrasp o8 #g0))
          :effect (isholdingmotion #q0 #t793 #q14 o8 #g0)
   )
   (:action s810_plan-holding-motion
          :parameters (#q0 #q14 o9 #g1)
          :precondition (and (isconf #q0) (isconf #q14) (isgrasp o9 #g1))
          :effect (isholdingmotion #q0 #t794 #q14 o9 #g1)
   )
   (:action s811_plan-holding-motion
          :parameters (#q0 #q14 o8 #g2)
          :precondition (and (isconf #q0) (isconf #q14) (isgrasp o8 #g2))
          :effect (isholdingmotion #q0 #t795 #q14 o8 #g2)
   )
   (:action s812_plan-holding-motion
          :parameters (#q0 #q14 o8 #g3)
          :precondition (and (isconf #q0) (isconf #q14) (isgrasp o8 #g3))
          :effect (isholdingmotion #q0 #t796 #q14 o8 #g3)
   )
   (:action s813_plan-holding-motion
          :parameters (#q0 #q14 o9 #g4)
          :precondition (and (isconf #q0) (isconf #q14) (isgrasp o9 #g4))
          :effect (isholdingmotion #q0 #t797 #q14 o9 #g4)
   )
   (:action s814_plan-holding-motion
          :parameters (#q0 #q14 o9 #g5)
          :precondition (and (isconf #q0) (isconf #q14) (isgrasp o9 #g5))
          :effect (isholdingmotion #q0 #t798 #q14 o9 #g5)
   )
   (:action s815_plan-holding-motion
          :parameters (#q0 #q15 o8 #g0)
          :precondition (and (isconf #q0) (isconf #q15) (isgrasp o8 #g0))
          :effect (isholdingmotion #q0 #t799 #q15 o8 #g0)
   )
   (:action s816_plan-holding-motion
          :parameters (#q0 #q15 o9 #g1)
          :precondition (and (isconf #q0) (isconf #q15) (isgrasp o9 #g1))
          :effect (isholdingmotion #q0 #t800 #q15 o9 #g1)
   )
   (:action s817_plan-holding-motion
          :parameters (#q0 #q15 o8 #g2)
          :precondition (and (isconf #q0) (isconf #q15) (isgrasp o8 #g2))
          :effect (isholdingmotion #q0 #t801 #q15 o8 #g2)
   )
   (:action s818_plan-holding-motion
          :parameters (#q0 #q15 o8 #g3)
          :precondition (and (isconf #q0) (isconf #q15) (isgrasp o8 #g3))
          :effect (isholdingmotion #q0 #t802 #q15 o8 #g3)
   )
   (:action s819_plan-holding-motion
          :parameters (#q0 #q15 o9 #g4)
          :precondition (and (isconf #q0) (isconf #q15) (isgrasp o9 #g4))
          :effect (isholdingmotion #q0 #t803 #q15 o9 #g4)
   )
   (:action s820_plan-holding-motion
          :parameters (#q0 #q15 o9 #g5)
          :precondition (and (isconf #q0) (isconf #q15) (isgrasp o9 #g5))
          :effect (isholdingmotion #q0 #t804 #q15 o9 #g5)
   )
   (:action s821_plan-holding-motion
          :parameters (#q0 #q16 o8 #g0)
          :precondition (and (isconf #q0) (isconf #q16) (isgrasp o8 #g0))
          :effect (isholdingmotion #q0 #t805 #q16 o8 #g0)
   )
   (:action s822_plan-holding-motion
          :parameters (#q0 #q16 o9 #g1)
          :precondition (and (isconf #q0) (isconf #q16) (isgrasp o9 #g1))
          :effect (isholdingmotion #q0 #t806 #q16 o9 #g1)
   )
   (:action s823_plan-holding-motion
          :parameters (#q0 #q16 o8 #g2)
          :precondition (and (isconf #q0) (isconf #q16) (isgrasp o8 #g2))
          :effect (isholdingmotion #q0 #t807 #q16 o8 #g2)
   )
   (:action s824_plan-holding-motion
          :parameters (#q0 #q16 o8 #g3)
          :precondition (and (isconf #q0) (isconf #q16) (isgrasp o8 #g3))
          :effect (isholdingmotion #q0 #t808 #q16 o8 #g3)
   )
   (:action s825_plan-holding-motion
          :parameters (#q0 #q16 o9 #g4)
          :precondition (and (isconf #q0) (isconf #q16) (isgrasp o9 #g4))
          :effect (isholdingmotion #q0 #t809 #q16 o9 #g4)
   )
   (:action s826_plan-holding-motion
          :parameters (#q0 #q16 o9 #g5)
          :precondition (and (isconf #q0) (isconf #q16) (isgrasp o9 #g5))
          :effect (isholdingmotion #q0 #t810 #q16 o9 #g5)
   )
   (:action s827_plan-holding-motion
          :parameters (#q0 #q17 o8 #g0)
          :precondition (and (isconf #q0) (isconf #q17) (isgrasp o8 #g0))
          :effect (isholdingmotion #q0 #t811 #q17 o8 #g0)
   )
   (:action s828_plan-holding-motion
          :parameters (#q0 #q17 o9 #g1)
          :precondition (and (isconf #q0) (isconf #q17) (isgrasp o9 #g1))
          :effect (isholdingmotion #q0 #t812 #q17 o9 #g1)
   )
   (:action s829_plan-holding-motion
          :parameters (#q0 #q17 o8 #g2)
          :precondition (and (isconf #q0) (isconf #q17) (isgrasp o8 #g2))
          :effect (isholdingmotion #q0 #t813 #q17 o8 #g2)
   )
   (:action s830_plan-holding-motion
          :parameters (#q0 #q17 o8 #g3)
          :precondition (and (isconf #q0) (isconf #q17) (isgrasp o8 #g3))
          :effect (isholdingmotion #q0 #t814 #q17 o8 #g3)
   )
   (:action s831_plan-holding-motion
          :parameters (#q0 #q17 o9 #g4)
          :precondition (and (isconf #q0) (isconf #q17) (isgrasp o9 #g4))
          :effect (isholdingmotion #q0 #t815 #q17 o9 #g4)
   )
   (:action s832_plan-holding-motion
          :parameters (#q0 #q17 o9 #g5)
          :precondition (and (isconf #q0) (isconf #q17) (isgrasp o9 #g5))
          :effect (isholdingmotion #q0 #t816 #q17 o9 #g5)
   )
   (:action s833_plan-holding-motion
          :parameters (#q1 #q6 o8 #g0)
          :precondition (and (isconf #q1) (isconf #q6) (isgrasp o8 #g0))
          :effect (isholdingmotion #q1 #t817 #q6 o8 #g0)
   )
   (:action s834_plan-holding-motion
          :parameters (#q1 #q6 o9 #g1)
          :precondition (and (isconf #q1) (isconf #q6) (isgrasp o9 #g1))
          :effect (isholdingmotion #q1 #t818 #q6 o9 #g1)
   )
   (:action s835_plan-holding-motion
          :parameters (#q1 #q6 o8 #g2)
          :precondition (and (isconf #q1) (isconf #q6) (isgrasp o8 #g2))
          :effect (isholdingmotion #q1 #t819 #q6 o8 #g2)
   )
   (:action s836_plan-holding-motion
          :parameters (#q1 #q6 o8 #g3)
          :precondition (and (isconf #q1) (isconf #q6) (isgrasp o8 #g3))
          :effect (isholdingmotion #q1 #t820 #q6 o8 #g3)
   )
   (:action s837_plan-holding-motion
          :parameters (#q1 #q6 o9 #g4)
          :precondition (and (isconf #q1) (isconf #q6) (isgrasp o9 #g4))
          :effect (isholdingmotion #q1 #t821 #q6 o9 #g4)
   )
   (:action s838_plan-holding-motion
          :parameters (#q1 #q6 o9 #g5)
          :precondition (and (isconf #q1) (isconf #q6) (isgrasp o9 #g5))
          :effect (isholdingmotion #q1 #t822 #q6 o9 #g5)
   )
   (:action s839_plan-holding-motion
          :parameters (#q1 #q7 o8 #g0)
          :precondition (and (isconf #q1) (isconf #q7) (isgrasp o8 #g0))
          :effect (isholdingmotion #q1 #t823 #q7 o8 #g0)
   )
   (:action s840_plan-holding-motion
          :parameters (#q1 #q7 o9 #g1)
          :precondition (and (isconf #q1) (isconf #q7) (isgrasp o9 #g1))
          :effect (isholdingmotion #q1 #t824 #q7 o9 #g1)
   )
   (:action s841_plan-holding-motion
          :parameters (#q1 #q7 o8 #g2)
          :precondition (and (isconf #q1) (isconf #q7) (isgrasp o8 #g2))
          :effect (isholdingmotion #q1 #t825 #q7 o8 #g2)
   )
   (:action s842_plan-holding-motion
          :parameters (#q1 #q7 o8 #g3)
          :precondition (and (isconf #q1) (isconf #q7) (isgrasp o8 #g3))
          :effect (isholdingmotion #q1 #t826 #q7 o8 #g3)
   )
   (:action s843_plan-holding-motion
          :parameters (#q1 #q7 o9 #g4)
          :precondition (and (isconf #q1) (isconf #q7) (isgrasp o9 #g4))
          :effect (isholdingmotion #q1 #t827 #q7 o9 #g4)
   )
   (:action s844_plan-holding-motion
          :parameters (#q1 #q7 o9 #g5)
          :precondition (and (isconf #q1) (isconf #q7) (isgrasp o9 #g5))
          :effect (isholdingmotion #q1 #t828 #q7 o9 #g5)
   )
   (:action s845_plan-holding-motion
          :parameters (#q1 #q8 o8 #g0)
          :precondition (and (isconf #q1) (isconf #q8) (isgrasp o8 #g0))
          :effect (isholdingmotion #q1 #t829 #q8 o8 #g0)
   )
   (:action s846_plan-holding-motion
          :parameters (#q1 #q8 o9 #g1)
          :precondition (and (isconf #q1) (isconf #q8) (isgrasp o9 #g1))
          :effect (isholdingmotion #q1 #t830 #q8 o9 #g1)
   )
   (:action s847_plan-holding-motion
          :parameters (#q1 #q8 o8 #g2)
          :precondition (and (isconf #q1) (isconf #q8) (isgrasp o8 #g2))
          :effect (isholdingmotion #q1 #t831 #q8 o8 #g2)
   )
   (:action s848_plan-holding-motion
          :parameters (#q1 #q8 o8 #g3)
          :precondition (and (isconf #q1) (isconf #q8) (isgrasp o8 #g3))
          :effect (isholdingmotion #q1 #t832 #q8 o8 #g3)
   )
   (:action s849_plan-holding-motion
          :parameters (#q1 #q8 o9 #g4)
          :precondition (and (isconf #q1) (isconf #q8) (isgrasp o9 #g4))
          :effect (isholdingmotion #q1 #t833 #q8 o9 #g4)
   )
   (:action s850_plan-holding-motion
          :parameters (#q1 #q8 o9 #g5)
          :precondition (and (isconf #q1) (isconf #q8) (isgrasp o9 #g5))
          :effect (isholdingmotion #q1 #t834 #q8 o9 #g5)
   )
   (:action s851_plan-holding-motion
          :parameters (#q1 #q9 o8 #g0)
          :precondition (and (isconf #q1) (isconf #q9) (isgrasp o8 #g0))
          :effect (isholdingmotion #q1 #t835 #q9 o8 #g0)
   )
   (:action s852_plan-holding-motion
          :parameters (#q1 #q9 o9 #g1)
          :precondition (and (isconf #q1) (isconf #q9) (isgrasp o9 #g1))
          :effect (isholdingmotion #q1 #t836 #q9 o9 #g1)
   )
   (:action s853_plan-holding-motion
          :parameters (#q1 #q9 o8 #g2)
          :precondition (and (isconf #q1) (isconf #q9) (isgrasp o8 #g2))
          :effect (isholdingmotion #q1 #t837 #q9 o8 #g2)
   )
   (:action s854_plan-holding-motion
          :parameters (#q1 #q9 o8 #g3)
          :precondition (and (isconf #q1) (isconf #q9) (isgrasp o8 #g3))
          :effect (isholdingmotion #q1 #t838 #q9 o8 #g3)
   )
   (:action s855_plan-holding-motion
          :parameters (#q1 #q9 o9 #g4)
          :precondition (and (isconf #q1) (isconf #q9) (isgrasp o9 #g4))
          :effect (isholdingmotion #q1 #t839 #q9 o9 #g4)
   )
   (:action s856_plan-holding-motion
          :parameters (#q1 #q9 o9 #g5)
          :precondition (and (isconf #q1) (isconf #q9) (isgrasp o9 #g5))
          :effect (isholdingmotion #q1 #t840 #q9 o9 #g5)
   )
   (:action s857_plan-holding-motion
          :parameters (#q1 #q10 o8 #g0)
          :precondition (and (isconf #q1) (isconf #q10) (isgrasp o8 #g0))
          :effect (isholdingmotion #q1 #t841 #q10 o8 #g0)
   )
   (:action s858_plan-holding-motion
          :parameters (#q1 #q10 o9 #g1)
          :precondition (and (isconf #q1) (isconf #q10) (isgrasp o9 #g1))
          :effect (isholdingmotion #q1 #t842 #q10 o9 #g1)
   )
   (:action s859_plan-holding-motion
          :parameters (#q1 #q10 o8 #g2)
          :precondition (and (isconf #q1) (isconf #q10) (isgrasp o8 #g2))
          :effect (isholdingmotion #q1 #t843 #q10 o8 #g2)
   )
   (:action s860_plan-holding-motion
          :parameters (#q1 #q10 o8 #g3)
          :precondition (and (isconf #q1) (isconf #q10) (isgrasp o8 #g3))
          :effect (isholdingmotion #q1 #t844 #q10 o8 #g3)
   )
   (:action s861_plan-holding-motion
          :parameters (#q1 #q10 o9 #g4)
          :precondition (and (isconf #q1) (isconf #q10) (isgrasp o9 #g4))
          :effect (isholdingmotion #q1 #t845 #q10 o9 #g4)
   )
   (:action s862_plan-holding-motion
          :parameters (#q1 #q10 o9 #g5)
          :precondition (and (isconf #q1) (isconf #q10) (isgrasp o9 #g5))
          :effect (isholdingmotion #q1 #t846 #q10 o9 #g5)
   )
   (:action s863_plan-holding-motion
          :parameters (#q1 #q11 o8 #g0)
          :precondition (and (isconf #q1) (isconf #q11) (isgrasp o8 #g0))
          :effect (isholdingmotion #q1 #t847 #q11 o8 #g0)
   )
   (:action s864_plan-holding-motion
          :parameters (#q1 #q11 o9 #g1)
          :precondition (and (isconf #q1) (isconf #q11) (isgrasp o9 #g1))
          :effect (isholdingmotion #q1 #t848 #q11 o9 #g1)
   )
   (:action s865_plan-holding-motion
          :parameters (#q1 #q11 o8 #g2)
          :precondition (and (isconf #q1) (isconf #q11) (isgrasp o8 #g2))
          :effect (isholdingmotion #q1 #t849 #q11 o8 #g2)
   )
   (:action s866_plan-holding-motion
          :parameters (#q1 #q11 o8 #g3)
          :precondition (and (isconf #q1) (isconf #q11) (isgrasp o8 #g3))
          :effect (isholdingmotion #q1 #t850 #q11 o8 #g3)
   )
   (:action s867_plan-holding-motion
          :parameters (#q1 #q11 o9 #g4)
          :precondition (and (isconf #q1) (isconf #q11) (isgrasp o9 #g4))
          :effect (isholdingmotion #q1 #t851 #q11 o9 #g4)
   )
   (:action s868_plan-holding-motion
          :parameters (#q1 #q11 o9 #g5)
          :precondition (and (isconf #q1) (isconf #q11) (isgrasp o9 #g5))
          :effect (isholdingmotion #q1 #t852 #q11 o9 #g5)
   )
   (:action s869_plan-holding-motion
          :parameters (#q1 #q12 o8 #g0)
          :precondition (and (isconf #q1) (isconf #q12) (isgrasp o8 #g0))
          :effect (isholdingmotion #q1 #t853 #q12 o8 #g0)
   )
   (:action s870_plan-holding-motion
          :parameters (#q1 #q12 o9 #g1)
          :precondition (and (isconf #q1) (isconf #q12) (isgrasp o9 #g1))
          :effect (isholdingmotion #q1 #t854 #q12 o9 #g1)
   )
   (:action s871_plan-holding-motion
          :parameters (#q1 #q12 o8 #g2)
          :precondition (and (isconf #q1) (isconf #q12) (isgrasp o8 #g2))
          :effect (isholdingmotion #q1 #t855 #q12 o8 #g2)
   )
   (:action s872_plan-holding-motion
          :parameters (#q1 #q12 o8 #g3)
          :precondition (and (isconf #q1) (isconf #q12) (isgrasp o8 #g3))
          :effect (isholdingmotion #q1 #t856 #q12 o8 #g3)
   )
   (:action s873_plan-holding-motion
          :parameters (#q1 #q12 o9 #g4)
          :precondition (and (isconf #q1) (isconf #q12) (isgrasp o9 #g4))
          :effect (isholdingmotion #q1 #t857 #q12 o9 #g4)
   )
   (:action s874_plan-holding-motion
          :parameters (#q1 #q12 o9 #g5)
          :precondition (and (isconf #q1) (isconf #q12) (isgrasp o9 #g5))
          :effect (isholdingmotion #q1 #t858 #q12 o9 #g5)
   )
   (:action s875_plan-holding-motion
          :parameters (#q1 #q13 o8 #g0)
          :precondition (and (isconf #q1) (isconf #q13) (isgrasp o8 #g0))
          :effect (isholdingmotion #q1 #t859 #q13 o8 #g0)
   )
   (:action s876_plan-holding-motion
          :parameters (#q1 #q13 o9 #g1)
          :precondition (and (isconf #q1) (isconf #q13) (isgrasp o9 #g1))
          :effect (isholdingmotion #q1 #t860 #q13 o9 #g1)
   )
   (:action s877_plan-holding-motion
          :parameters (#q1 #q13 o8 #g2)
          :precondition (and (isconf #q1) (isconf #q13) (isgrasp o8 #g2))
          :effect (isholdingmotion #q1 #t861 #q13 o8 #g2)
   )
   (:action s878_plan-holding-motion
          :parameters (#q1 #q13 o8 #g3)
          :precondition (and (isconf #q1) (isconf #q13) (isgrasp o8 #g3))
          :effect (isholdingmotion #q1 #t862 #q13 o8 #g3)
   )
   (:action s879_plan-holding-motion
          :parameters (#q1 #q13 o9 #g4)
          :precondition (and (isconf #q1) (isconf #q13) (isgrasp o9 #g4))
          :effect (isholdingmotion #q1 #t863 #q13 o9 #g4)
   )
   (:action s880_plan-holding-motion
          :parameters (#q1 #q13 o9 #g5)
          :precondition (and (isconf #q1) (isconf #q13) (isgrasp o9 #g5))
          :effect (isholdingmotion #q1 #t864 #q13 o9 #g5)
   )
   (:action s881_plan-holding-motion
          :parameters (#q1 #q14 o8 #g0)
          :precondition (and (isconf #q1) (isconf #q14) (isgrasp o8 #g0))
          :effect (isholdingmotion #q1 #t865 #q14 o8 #g0)
   )
   (:action s882_plan-holding-motion
          :parameters (#q1 #q14 o9 #g1)
          :precondition (and (isconf #q1) (isconf #q14) (isgrasp o9 #g1))
          :effect (isholdingmotion #q1 #t866 #q14 o9 #g1)
   )
   (:action s883_plan-holding-motion
          :parameters (#q1 #q14 o8 #g2)
          :precondition (and (isconf #q1) (isconf #q14) (isgrasp o8 #g2))
          :effect (isholdingmotion #q1 #t867 #q14 o8 #g2)
   )
   (:action s884_plan-holding-motion
          :parameters (#q1 #q14 o8 #g3)
          :precondition (and (isconf #q1) (isconf #q14) (isgrasp o8 #g3))
          :effect (isholdingmotion #q1 #t868 #q14 o8 #g3)
   )
   (:action s885_plan-holding-motion
          :parameters (#q1 #q14 o9 #g4)
          :precondition (and (isconf #q1) (isconf #q14) (isgrasp o9 #g4))
          :effect (isholdingmotion #q1 #t869 #q14 o9 #g4)
   )
   (:action s886_plan-holding-motion
          :parameters (#q1 #q14 o9 #g5)
          :precondition (and (isconf #q1) (isconf #q14) (isgrasp o9 #g5))
          :effect (isholdingmotion #q1 #t870 #q14 o9 #g5)
   )
   (:action s887_plan-holding-motion
          :parameters (#q1 #q15 o8 #g0)
          :precondition (and (isconf #q1) (isconf #q15) (isgrasp o8 #g0))
          :effect (isholdingmotion #q1 #t871 #q15 o8 #g0)
   )
   (:action s888_plan-holding-motion
          :parameters (#q1 #q15 o9 #g1)
          :precondition (and (isconf #q1) (isconf #q15) (isgrasp o9 #g1))
          :effect (isholdingmotion #q1 #t872 #q15 o9 #g1)
   )
   (:action s889_plan-holding-motion
          :parameters (#q1 #q15 o8 #g2)
          :precondition (and (isconf #q1) (isconf #q15) (isgrasp o8 #g2))
          :effect (isholdingmotion #q1 #t873 #q15 o8 #g2)
   )
   (:action s890_plan-holding-motion
          :parameters (#q1 #q15 o8 #g3)
          :precondition (and (isconf #q1) (isconf #q15) (isgrasp o8 #g3))
          :effect (isholdingmotion #q1 #t874 #q15 o8 #g3)
   )
   (:action s891_plan-holding-motion
          :parameters (#q1 #q15 o9 #g4)
          :precondition (and (isconf #q1) (isconf #q15) (isgrasp o9 #g4))
          :effect (isholdingmotion #q1 #t875 #q15 o9 #g4)
   )
   (:action s892_plan-holding-motion
          :parameters (#q1 #q15 o9 #g5)
          :precondition (and (isconf #q1) (isconf #q15) (isgrasp o9 #g5))
          :effect (isholdingmotion #q1 #t876 #q15 o9 #g5)
   )
   (:action s893_plan-holding-motion
          :parameters (#q1 #q16 o8 #g0)
          :precondition (and (isconf #q1) (isconf #q16) (isgrasp o8 #g0))
          :effect (isholdingmotion #q1 #t877 #q16 o8 #g0)
   )
   (:action s894_plan-holding-motion
          :parameters (#q1 #q16 o9 #g1)
          :precondition (and (isconf #q1) (isconf #q16) (isgrasp o9 #g1))
          :effect (isholdingmotion #q1 #t878 #q16 o9 #g1)
   )
   (:action s895_plan-holding-motion
          :parameters (#q1 #q16 o8 #g2)
          :precondition (and (isconf #q1) (isconf #q16) (isgrasp o8 #g2))
          :effect (isholdingmotion #q1 #t879 #q16 o8 #g2)
   )
   (:action s896_plan-holding-motion
          :parameters (#q1 #q16 o8 #g3)
          :precondition (and (isconf #q1) (isconf #q16) (isgrasp o8 #g3))
          :effect (isholdingmotion #q1 #t880 #q16 o8 #g3)
   )
   (:action s897_plan-holding-motion
          :parameters (#q1 #q16 o9 #g4)
          :precondition (and (isconf #q1) (isconf #q16) (isgrasp o9 #g4))
          :effect (isholdingmotion #q1 #t881 #q16 o9 #g4)
   )
   (:action s898_plan-holding-motion
          :parameters (#q1 #q16 o9 #g5)
          :precondition (and (isconf #q1) (isconf #q16) (isgrasp o9 #g5))
          :effect (isholdingmotion #q1 #t882 #q16 o9 #g5)
   )
   (:action s899_plan-holding-motion
          :parameters (#q1 #q17 o8 #g0)
          :precondition (and (isconf #q1) (isconf #q17) (isgrasp o8 #g0))
          :effect (isholdingmotion #q1 #t883 #q17 o8 #g0)
   )
   (:action s900_plan-holding-motion
          :parameters (#q1 #q17 o9 #g1)
          :precondition (and (isconf #q1) (isconf #q17) (isgrasp o9 #g1))
          :effect (isholdingmotion #q1 #t884 #q17 o9 #g1)
   )
   (:action s901_plan-holding-motion
          :parameters (#q1 #q17 o8 #g2)
          :precondition (and (isconf #q1) (isconf #q17) (isgrasp o8 #g2))
          :effect (isholdingmotion #q1 #t885 #q17 o8 #g2)
   )
   (:action s902_plan-holding-motion
          :parameters (#q1 #q17 o8 #g3)
          :precondition (and (isconf #q1) (isconf #q17) (isgrasp o8 #g3))
          :effect (isholdingmotion #q1 #t886 #q17 o8 #g3)
   )
   (:action s903_plan-holding-motion
          :parameters (#q1 #q17 o9 #g4)
          :precondition (and (isconf #q1) (isconf #q17) (isgrasp o9 #g4))
          :effect (isholdingmotion #q1 #t887 #q17 o9 #g4)
   )
   (:action s904_plan-holding-motion
          :parameters (#q1 #q17 o9 #g5)
          :precondition (and (isconf #q1) (isconf #q17) (isgrasp o9 #g5))
          :effect (isholdingmotion #q1 #t888 #q17 o9 #g5)
   )
   (:action s905_plan-holding-motion
          :parameters (#q2 #q6 o8 #g0)
          :precondition (and (isconf #q2) (isconf #q6) (isgrasp o8 #g0))
          :effect (isholdingmotion #q2 #t889 #q6 o8 #g0)
   )
   (:action s906_plan-holding-motion
          :parameters (#q2 #q6 o9 #g1)
          :precondition (and (isconf #q2) (isconf #q6) (isgrasp o9 #g1))
          :effect (isholdingmotion #q2 #t890 #q6 o9 #g1)
   )
   (:action s907_plan-holding-motion
          :parameters (#q2 #q6 o8 #g2)
          :precondition (and (isconf #q2) (isconf #q6) (isgrasp o8 #g2))
          :effect (isholdingmotion #q2 #t891 #q6 o8 #g2)
   )
   (:action s908_plan-holding-motion
          :parameters (#q2 #q6 o8 #g3)
          :precondition (and (isconf #q2) (isconf #q6) (isgrasp o8 #g3))
          :effect (isholdingmotion #q2 #t892 #q6 o8 #g3)
   )
   (:action s909_plan-holding-motion
          :parameters (#q2 #q6 o9 #g4)
          :precondition (and (isconf #q2) (isconf #q6) (isgrasp o9 #g4))
          :effect (isholdingmotion #q2 #t893 #q6 o9 #g4)
   )
   (:action s910_plan-holding-motion
          :parameters (#q2 #q6 o9 #g5)
          :precondition (and (isconf #q2) (isconf #q6) (isgrasp o9 #g5))
          :effect (isholdingmotion #q2 #t894 #q6 o9 #g5)
   )
   (:action s911_plan-holding-motion
          :parameters (#q2 #q7 o8 #g0)
          :precondition (and (isconf #q2) (isconf #q7) (isgrasp o8 #g0))
          :effect (isholdingmotion #q2 #t895 #q7 o8 #g0)
   )
   (:action s912_plan-holding-motion
          :parameters (#q2 #q7 o9 #g1)
          :precondition (and (isconf #q2) (isconf #q7) (isgrasp o9 #g1))
          :effect (isholdingmotion #q2 #t896 #q7 o9 #g1)
   )
   (:action s913_plan-holding-motion
          :parameters (#q2 #q7 o8 #g2)
          :precondition (and (isconf #q2) (isconf #q7) (isgrasp o8 #g2))
          :effect (isholdingmotion #q2 #t897 #q7 o8 #g2)
   )
   (:action s914_plan-holding-motion
          :parameters (#q2 #q7 o8 #g3)
          :precondition (and (isconf #q2) (isconf #q7) (isgrasp o8 #g3))
          :effect (isholdingmotion #q2 #t898 #q7 o8 #g3)
   )
   (:action s915_plan-holding-motion
          :parameters (#q2 #q7 o9 #g4)
          :precondition (and (isconf #q2) (isconf #q7) (isgrasp o9 #g4))
          :effect (isholdingmotion #q2 #t899 #q7 o9 #g4)
   )
   (:action s916_plan-holding-motion
          :parameters (#q2 #q7 o9 #g5)
          :precondition (and (isconf #q2) (isconf #q7) (isgrasp o9 #g5))
          :effect (isholdingmotion #q2 #t900 #q7 o9 #g5)
   )
   (:action s917_plan-holding-motion
          :parameters (#q2 #q8 o8 #g0)
          :precondition (and (isconf #q2) (isconf #q8) (isgrasp o8 #g0))
          :effect (isholdingmotion #q2 #t901 #q8 o8 #g0)
   )
   (:action s918_plan-holding-motion
          :parameters (#q2 #q8 o9 #g1)
          :precondition (and (isconf #q2) (isconf #q8) (isgrasp o9 #g1))
          :effect (isholdingmotion #q2 #t902 #q8 o9 #g1)
   )
   (:action s919_plan-holding-motion
          :parameters (#q2 #q8 o8 #g2)
          :precondition (and (isconf #q2) (isconf #q8) (isgrasp o8 #g2))
          :effect (isholdingmotion #q2 #t903 #q8 o8 #g2)
   )
   (:action s920_plan-holding-motion
          :parameters (#q2 #q8 o8 #g3)
          :precondition (and (isconf #q2) (isconf #q8) (isgrasp o8 #g3))
          :effect (isholdingmotion #q2 #t904 #q8 o8 #g3)
   )
   (:action s921_plan-holding-motion
          :parameters (#q2 #q8 o9 #g4)
          :precondition (and (isconf #q2) (isconf #q8) (isgrasp o9 #g4))
          :effect (isholdingmotion #q2 #t905 #q8 o9 #g4)
   )
   (:action s922_plan-holding-motion
          :parameters (#q2 #q8 o9 #g5)
          :precondition (and (isconf #q2) (isconf #q8) (isgrasp o9 #g5))
          :effect (isholdingmotion #q2 #t906 #q8 o9 #g5)
   )
   (:action s923_plan-holding-motion
          :parameters (#q2 #q9 o8 #g0)
          :precondition (and (isconf #q2) (isconf #q9) (isgrasp o8 #g0))
          :effect (isholdingmotion #q2 #t907 #q9 o8 #g0)
   )
   (:action s924_plan-holding-motion
          :parameters (#q2 #q9 o9 #g1)
          :precondition (and (isconf #q2) (isconf #q9) (isgrasp o9 #g1))
          :effect (isholdingmotion #q2 #t908 #q9 o9 #g1)
   )
   (:action s925_plan-holding-motion
          :parameters (#q2 #q9 o8 #g2)
          :precondition (and (isconf #q2) (isconf #q9) (isgrasp o8 #g2))
          :effect (isholdingmotion #q2 #t909 #q9 o8 #g2)
   )
   (:action s926_plan-holding-motion
          :parameters (#q2 #q9 o8 #g3)
          :precondition (and (isconf #q2) (isconf #q9) (isgrasp o8 #g3))
          :effect (isholdingmotion #q2 #t910 #q9 o8 #g3)
   )
   (:action s927_plan-holding-motion
          :parameters (#q2 #q9 o9 #g4)
          :precondition (and (isconf #q2) (isconf #q9) (isgrasp o9 #g4))
          :effect (isholdingmotion #q2 #t911 #q9 o9 #g4)
   )
   (:action s928_plan-holding-motion
          :parameters (#q2 #q9 o9 #g5)
          :precondition (and (isconf #q2) (isconf #q9) (isgrasp o9 #g5))
          :effect (isholdingmotion #q2 #t912 #q9 o9 #g5)
   )
   (:action s929_plan-holding-motion
          :parameters (#q2 #q10 o8 #g0)
          :precondition (and (isconf #q2) (isconf #q10) (isgrasp o8 #g0))
          :effect (isholdingmotion #q2 #t913 #q10 o8 #g0)
   )
   (:action s930_plan-holding-motion
          :parameters (#q2 #q10 o9 #g1)
          :precondition (and (isconf #q2) (isconf #q10) (isgrasp o9 #g1))
          :effect (isholdingmotion #q2 #t914 #q10 o9 #g1)
   )
   (:action s931_plan-holding-motion
          :parameters (#q2 #q10 o8 #g2)
          :precondition (and (isconf #q2) (isconf #q10) (isgrasp o8 #g2))
          :effect (isholdingmotion #q2 #t915 #q10 o8 #g2)
   )
   (:action s932_plan-holding-motion
          :parameters (#q2 #q10 o8 #g3)
          :precondition (and (isconf #q2) (isconf #q10) (isgrasp o8 #g3))
          :effect (isholdingmotion #q2 #t916 #q10 o8 #g3)
   )
   (:action s933_plan-holding-motion
          :parameters (#q2 #q10 o9 #g4)
          :precondition (and (isconf #q2) (isconf #q10) (isgrasp o9 #g4))
          :effect (isholdingmotion #q2 #t917 #q10 o9 #g4)
   )
   (:action s934_plan-holding-motion
          :parameters (#q2 #q10 o9 #g5)
          :precondition (and (isconf #q2) (isconf #q10) (isgrasp o9 #g5))
          :effect (isholdingmotion #q2 #t918 #q10 o9 #g5)
   )
   (:action s935_plan-holding-motion
          :parameters (#q2 #q11 o8 #g0)
          :precondition (and (isconf #q2) (isconf #q11) (isgrasp o8 #g0))
          :effect (isholdingmotion #q2 #t919 #q11 o8 #g0)
   )
   (:action s936_plan-holding-motion
          :parameters (#q2 #q11 o9 #g1)
          :precondition (and (isconf #q2) (isconf #q11) (isgrasp o9 #g1))
          :effect (isholdingmotion #q2 #t920 #q11 o9 #g1)
   )
   (:action s937_plan-holding-motion
          :parameters (#q2 #q11 o8 #g2)
          :precondition (and (isconf #q2) (isconf #q11) (isgrasp o8 #g2))
          :effect (isholdingmotion #q2 #t921 #q11 o8 #g2)
   )
   (:action s938_plan-holding-motion
          :parameters (#q2 #q11 o8 #g3)
          :precondition (and (isconf #q2) (isconf #q11) (isgrasp o8 #g3))
          :effect (isholdingmotion #q2 #t922 #q11 o8 #g3)
   )
   (:action s939_plan-holding-motion
          :parameters (#q2 #q11 o9 #g4)
          :precondition (and (isconf #q2) (isconf #q11) (isgrasp o9 #g4))
          :effect (isholdingmotion #q2 #t923 #q11 o9 #g4)
   )
   (:action s940_plan-holding-motion
          :parameters (#q2 #q11 o9 #g5)
          :precondition (and (isconf #q2) (isconf #q11) (isgrasp o9 #g5))
          :effect (isholdingmotion #q2 #t924 #q11 o9 #g5)
   )
   (:action s941_plan-holding-motion
          :parameters (#q2 #q12 o8 #g0)
          :precondition (and (isconf #q2) (isconf #q12) (isgrasp o8 #g0))
          :effect (isholdingmotion #q2 #t925 #q12 o8 #g0)
   )
   (:action s942_plan-holding-motion
          :parameters (#q2 #q12 o9 #g1)
          :precondition (and (isconf #q2) (isconf #q12) (isgrasp o9 #g1))
          :effect (isholdingmotion #q2 #t926 #q12 o9 #g1)
   )
   (:action s943_plan-holding-motion
          :parameters (#q2 #q12 o8 #g2)
          :precondition (and (isconf #q2) (isconf #q12) (isgrasp o8 #g2))
          :effect (isholdingmotion #q2 #t927 #q12 o8 #g2)
   )
   (:action s944_plan-holding-motion
          :parameters (#q2 #q12 o8 #g3)
          :precondition (and (isconf #q2) (isconf #q12) (isgrasp o8 #g3))
          :effect (isholdingmotion #q2 #t928 #q12 o8 #g3)
   )
   (:action s945_plan-holding-motion
          :parameters (#q2 #q12 o9 #g4)
          :precondition (and (isconf #q2) (isconf #q12) (isgrasp o9 #g4))
          :effect (isholdingmotion #q2 #t929 #q12 o9 #g4)
   )
   (:action s946_plan-holding-motion
          :parameters (#q2 #q12 o9 #g5)
          :precondition (and (isconf #q2) (isconf #q12) (isgrasp o9 #g5))
          :effect (isholdingmotion #q2 #t930 #q12 o9 #g5)
   )
   (:action s947_plan-holding-motion
          :parameters (#q2 #q13 o8 #g0)
          :precondition (and (isconf #q2) (isconf #q13) (isgrasp o8 #g0))
          :effect (isholdingmotion #q2 #t931 #q13 o8 #g0)
   )
   (:action s948_plan-holding-motion
          :parameters (#q2 #q13 o9 #g1)
          :precondition (and (isconf #q2) (isconf #q13) (isgrasp o9 #g1))
          :effect (isholdingmotion #q2 #t932 #q13 o9 #g1)
   )
   (:action s949_plan-holding-motion
          :parameters (#q2 #q13 o8 #g2)
          :precondition (and (isconf #q2) (isconf #q13) (isgrasp o8 #g2))
          :effect (isholdingmotion #q2 #t933 #q13 o8 #g2)
   )
   (:action s950_plan-holding-motion
          :parameters (#q2 #q13 o8 #g3)
          :precondition (and (isconf #q2) (isconf #q13) (isgrasp o8 #g3))
          :effect (isholdingmotion #q2 #t934 #q13 o8 #g3)
   )
   (:action s951_plan-holding-motion
          :parameters (#q2 #q13 o9 #g4)
          :precondition (and (isconf #q2) (isconf #q13) (isgrasp o9 #g4))
          :effect (isholdingmotion #q2 #t935 #q13 o9 #g4)
   )
   (:action s952_plan-holding-motion
          :parameters (#q2 #q13 o9 #g5)
          :precondition (and (isconf #q2) (isconf #q13) (isgrasp o9 #g5))
          :effect (isholdingmotion #q2 #t936 #q13 o9 #g5)
   )
   (:action s953_plan-holding-motion
          :parameters (#q2 #q14 o8 #g0)
          :precondition (and (isconf #q2) (isconf #q14) (isgrasp o8 #g0))
          :effect (isholdingmotion #q2 #t937 #q14 o8 #g0)
   )
   (:action s954_plan-holding-motion
          :parameters (#q2 #q14 o9 #g1)
          :precondition (and (isconf #q2) (isconf #q14) (isgrasp o9 #g1))
          :effect (isholdingmotion #q2 #t938 #q14 o9 #g1)
   )
   (:action s955_plan-holding-motion
          :parameters (#q2 #q14 o8 #g2)
          :precondition (and (isconf #q2) (isconf #q14) (isgrasp o8 #g2))
          :effect (isholdingmotion #q2 #t939 #q14 o8 #g2)
   )
   (:action s956_plan-holding-motion
          :parameters (#q2 #q14 o8 #g3)
          :precondition (and (isconf #q2) (isconf #q14) (isgrasp o8 #g3))
          :effect (isholdingmotion #q2 #t940 #q14 o8 #g3)
   )
   (:action s957_plan-holding-motion
          :parameters (#q2 #q14 o9 #g4)
          :precondition (and (isconf #q2) (isconf #q14) (isgrasp o9 #g4))
          :effect (isholdingmotion #q2 #t941 #q14 o9 #g4)
   )
   (:action s958_plan-holding-motion
          :parameters (#q2 #q14 o9 #g5)
          :precondition (and (isconf #q2) (isconf #q14) (isgrasp o9 #g5))
          :effect (isholdingmotion #q2 #t942 #q14 o9 #g5)
   )
   (:action s959_plan-holding-motion
          :parameters (#q2 #q15 o8 #g0)
          :precondition (and (isconf #q2) (isconf #q15) (isgrasp o8 #g0))
          :effect (isholdingmotion #q2 #t943 #q15 o8 #g0)
   )
   (:action s960_plan-holding-motion
          :parameters (#q2 #q15 o9 #g1)
          :precondition (and (isconf #q2) (isconf #q15) (isgrasp o9 #g1))
          :effect (isholdingmotion #q2 #t944 #q15 o9 #g1)
   )
   (:action s961_plan-holding-motion
          :parameters (#q2 #q15 o8 #g2)
          :precondition (and (isconf #q2) (isconf #q15) (isgrasp o8 #g2))
          :effect (isholdingmotion #q2 #t945 #q15 o8 #g2)
   )
   (:action s962_plan-holding-motion
          :parameters (#q2 #q15 o8 #g3)
          :precondition (and (isconf #q2) (isconf #q15) (isgrasp o8 #g3))
          :effect (isholdingmotion #q2 #t946 #q15 o8 #g3)
   )
   (:action s963_plan-holding-motion
          :parameters (#q2 #q15 o9 #g4)
          :precondition (and (isconf #q2) (isconf #q15) (isgrasp o9 #g4))
          :effect (isholdingmotion #q2 #t947 #q15 o9 #g4)
   )
   (:action s964_plan-holding-motion
          :parameters (#q2 #q15 o9 #g5)
          :precondition (and (isconf #q2) (isconf #q15) (isgrasp o9 #g5))
          :effect (isholdingmotion #q2 #t948 #q15 o9 #g5)
   )
   (:action s965_plan-holding-motion
          :parameters (#q2 #q16 o8 #g0)
          :precondition (and (isconf #q2) (isconf #q16) (isgrasp o8 #g0))
          :effect (isholdingmotion #q2 #t949 #q16 o8 #g0)
   )
   (:action s966_plan-holding-motion
          :parameters (#q2 #q16 o9 #g1)
          :precondition (and (isconf #q2) (isconf #q16) (isgrasp o9 #g1))
          :effect (isholdingmotion #q2 #t950 #q16 o9 #g1)
   )
   (:action s967_plan-holding-motion
          :parameters (#q2 #q16 o8 #g2)
          :precondition (and (isconf #q2) (isconf #q16) (isgrasp o8 #g2))
          :effect (isholdingmotion #q2 #t951 #q16 o8 #g2)
   )
   (:action s968_plan-holding-motion
          :parameters (#q2 #q16 o8 #g3)
          :precondition (and (isconf #q2) (isconf #q16) (isgrasp o8 #g3))
          :effect (isholdingmotion #q2 #t952 #q16 o8 #g3)
   )
   (:action s969_plan-holding-motion
          :parameters (#q2 #q16 o9 #g4)
          :precondition (and (isconf #q2) (isconf #q16) (isgrasp o9 #g4))
          :effect (isholdingmotion #q2 #t953 #q16 o9 #g4)
   )
   (:action s970_plan-holding-motion
          :parameters (#q2 #q16 o9 #g5)
          :precondition (and (isconf #q2) (isconf #q16) (isgrasp o9 #g5))
          :effect (isholdingmotion #q2 #t954 #q16 o9 #g5)
   )
   (:action s971_plan-holding-motion
          :parameters (#q2 #q17 o8 #g0)
          :precondition (and (isconf #q2) (isconf #q17) (isgrasp o8 #g0))
          :effect (isholdingmotion #q2 #t955 #q17 o8 #g0)
   )
   (:action s972_plan-holding-motion
          :parameters (#q2 #q17 o9 #g1)
          :precondition (and (isconf #q2) (isconf #q17) (isgrasp o9 #g1))
          :effect (isholdingmotion #q2 #t956 #q17 o9 #g1)
   )
   (:action s973_plan-holding-motion
          :parameters (#q2 #q17 o8 #g2)
          :precondition (and (isconf #q2) (isconf #q17) (isgrasp o8 #g2))
          :effect (isholdingmotion #q2 #t957 #q17 o8 #g2)
   )
   (:action s974_plan-holding-motion
          :parameters (#q2 #q17 o8 #g3)
          :precondition (and (isconf #q2) (isconf #q17) (isgrasp o8 #g3))
          :effect (isholdingmotion #q2 #t958 #q17 o8 #g3)
   )
   (:action s975_plan-holding-motion
          :parameters (#q2 #q17 o9 #g4)
          :precondition (and (isconf #q2) (isconf #q17) (isgrasp o9 #g4))
          :effect (isholdingmotion #q2 #t959 #q17 o9 #g4)
   )
   (:action s976_plan-holding-motion
          :parameters (#q2 #q17 o9 #g5)
          :precondition (and (isconf #q2) (isconf #q17) (isgrasp o9 #g5))
          :effect (isholdingmotion #q2 #t960 #q17 o9 #g5)
   )
   (:action s977_plan-holding-motion
          :parameters (#q3 #q6 o8 #g0)
          :precondition (and (isconf #q3) (isconf #q6) (isgrasp o8 #g0))
          :effect (isholdingmotion #q3 #t961 #q6 o8 #g0)
   )
   (:action s978_plan-holding-motion
          :parameters (#q3 #q6 o9 #g1)
          :precondition (and (isconf #q3) (isconf #q6) (isgrasp o9 #g1))
          :effect (isholdingmotion #q3 #t962 #q6 o9 #g1)
   )
   (:action s979_plan-holding-motion
          :parameters (#q3 #q6 o8 #g2)
          :precondition (and (isconf #q3) (isconf #q6) (isgrasp o8 #g2))
          :effect (isholdingmotion #q3 #t963 #q6 o8 #g2)
   )
   (:action s980_plan-holding-motion
          :parameters (#q3 #q6 o8 #g3)
          :precondition (and (isconf #q3) (isconf #q6) (isgrasp o8 #g3))
          :effect (isholdingmotion #q3 #t964 #q6 o8 #g3)
   )
   (:action s981_plan-holding-motion
          :parameters (#q3 #q6 o9 #g4)
          :precondition (and (isconf #q3) (isconf #q6) (isgrasp o9 #g4))
          :effect (isholdingmotion #q3 #t965 #q6 o9 #g4)
   )
   (:action s982_plan-holding-motion
          :parameters (#q3 #q6 o9 #g5)
          :precondition (and (isconf #q3) (isconf #q6) (isgrasp o9 #g5))
          :effect (isholdingmotion #q3 #t966 #q6 o9 #g5)
   )
   (:action s983_plan-holding-motion
          :parameters (#q3 #q7 o8 #g0)
          :precondition (and (isconf #q3) (isconf #q7) (isgrasp o8 #g0))
          :effect (isholdingmotion #q3 #t967 #q7 o8 #g0)
   )
   (:action s984_plan-holding-motion
          :parameters (#q3 #q7 o9 #g1)
          :precondition (and (isconf #q3) (isconf #q7) (isgrasp o9 #g1))
          :effect (isholdingmotion #q3 #t968 #q7 o9 #g1)
   )
   (:action s985_plan-holding-motion
          :parameters (#q3 #q7 o8 #g2)
          :precondition (and (isconf #q3) (isconf #q7) (isgrasp o8 #g2))
          :effect (isholdingmotion #q3 #t969 #q7 o8 #g2)
   )
   (:action s986_plan-holding-motion
          :parameters (#q3 #q7 o8 #g3)
          :precondition (and (isconf #q3) (isconf #q7) (isgrasp o8 #g3))
          :effect (isholdingmotion #q3 #t970 #q7 o8 #g3)
   )
   (:action s987_plan-holding-motion
          :parameters (#q3 #q7 o9 #g4)
          :precondition (and (isconf #q3) (isconf #q7) (isgrasp o9 #g4))
          :effect (isholdingmotion #q3 #t971 #q7 o9 #g4)
   )
   (:action s988_plan-holding-motion
          :parameters (#q3 #q7 o9 #g5)
          :precondition (and (isconf #q3) (isconf #q7) (isgrasp o9 #g5))
          :effect (isholdingmotion #q3 #t972 #q7 o9 #g5)
   )
   (:action s989_plan-holding-motion
          :parameters (#q3 #q8 o8 #g0)
          :precondition (and (isconf #q3) (isconf #q8) (isgrasp o8 #g0))
          :effect (isholdingmotion #q3 #t973 #q8 o8 #g0)
   )
   (:action s990_plan-holding-motion
          :parameters (#q3 #q8 o9 #g1)
          :precondition (and (isconf #q3) (isconf #q8) (isgrasp o9 #g1))
          :effect (isholdingmotion #q3 #t974 #q8 o9 #g1)
   )
   (:action s991_plan-holding-motion
          :parameters (#q3 #q8 o8 #g2)
          :precondition (and (isconf #q3) (isconf #q8) (isgrasp o8 #g2))
          :effect (isholdingmotion #q3 #t975 #q8 o8 #g2)
   )
   (:action s992_plan-holding-motion
          :parameters (#q3 #q8 o8 #g3)
          :precondition (and (isconf #q3) (isconf #q8) (isgrasp o8 #g3))
          :effect (isholdingmotion #q3 #t976 #q8 o8 #g3)
   )
   (:action s993_plan-holding-motion
          :parameters (#q3 #q8 o9 #g4)
          :precondition (and (isconf #q3) (isconf #q8) (isgrasp o9 #g4))
          :effect (isholdingmotion #q3 #t977 #q8 o9 #g4)
   )
   (:action s994_plan-holding-motion
          :parameters (#q3 #q8 o9 #g5)
          :precondition (and (isconf #q3) (isconf #q8) (isgrasp o9 #g5))
          :effect (isholdingmotion #q3 #t978 #q8 o9 #g5)
   )
   (:action s995_plan-holding-motion
          :parameters (#q3 #q9 o8 #g0)
          :precondition (and (isconf #q3) (isconf #q9) (isgrasp o8 #g0))
          :effect (isholdingmotion #q3 #t979 #q9 o8 #g0)
   )
   (:action s996_plan-holding-motion
          :parameters (#q3 #q9 o9 #g1)
          :precondition (and (isconf #q3) (isconf #q9) (isgrasp o9 #g1))
          :effect (isholdingmotion #q3 #t980 #q9 o9 #g1)
   )
   (:action s997_plan-holding-motion
          :parameters (#q3 #q9 o8 #g2)
          :precondition (and (isconf #q3) (isconf #q9) (isgrasp o8 #g2))
          :effect (isholdingmotion #q3 #t981 #q9 o8 #g2)
   )
   (:action s998_plan-holding-motion
          :parameters (#q3 #q9 o8 #g3)
          :precondition (and (isconf #q3) (isconf #q9) (isgrasp o8 #g3))
          :effect (isholdingmotion #q3 #t982 #q9 o8 #g3)
   )
   (:action s999_plan-holding-motion
          :parameters (#q3 #q9 o9 #g4)
          :precondition (and (isconf #q3) (isconf #q9) (isgrasp o9 #g4))
          :effect (isholdingmotion #q3 #t983 #q9 o9 #g4)
   )
   (:action s1000_plan-holding-motion
          :parameters (#q3 #q9 o9 #g5)
          :precondition (and (isconf #q3) (isconf #q9) (isgrasp o9 #g5))
          :effect (isholdingmotion #q3 #t984 #q9 o9 #g5)
   )
   (:action s1001_plan-holding-motion
          :parameters (#q3 #q10 o8 #g0)
          :precondition (and (isconf #q3) (isconf #q10) (isgrasp o8 #g0))
          :effect (isholdingmotion #q3 #t985 #q10 o8 #g0)
   )
   (:action s1002_plan-holding-motion
          :parameters (#q3 #q10 o9 #g1)
          :precondition (and (isconf #q3) (isconf #q10) (isgrasp o9 #g1))
          :effect (isholdingmotion #q3 #t986 #q10 o9 #g1)
   )
   (:action s1003_plan-holding-motion
          :parameters (#q3 #q10 o8 #g2)
          :precondition (and (isconf #q3) (isconf #q10) (isgrasp o8 #g2))
          :effect (isholdingmotion #q3 #t987 #q10 o8 #g2)
   )
   (:action s1004_plan-holding-motion
          :parameters (#q3 #q10 o8 #g3)
          :precondition (and (isconf #q3) (isconf #q10) (isgrasp o8 #g3))
          :effect (isholdingmotion #q3 #t988 #q10 o8 #g3)
   )
   (:action s1005_plan-holding-motion
          :parameters (#q3 #q10 o9 #g4)
          :precondition (and (isconf #q3) (isconf #q10) (isgrasp o9 #g4))
          :effect (isholdingmotion #q3 #t989 #q10 o9 #g4)
   )
   (:action s1006_plan-holding-motion
          :parameters (#q3 #q10 o9 #g5)
          :precondition (and (isconf #q3) (isconf #q10) (isgrasp o9 #g5))
          :effect (isholdingmotion #q3 #t990 #q10 o9 #g5)
   )
   (:action s1007_plan-holding-motion
          :parameters (#q3 #q11 o8 #g0)
          :precondition (and (isconf #q3) (isconf #q11) (isgrasp o8 #g0))
          :effect (isholdingmotion #q3 #t991 #q11 o8 #g0)
   )
   (:action s1008_plan-holding-motion
          :parameters (#q3 #q11 o9 #g1)
          :precondition (and (isconf #q3) (isconf #q11) (isgrasp o9 #g1))
          :effect (isholdingmotion #q3 #t992 #q11 o9 #g1)
   )
   (:action s1009_plan-holding-motion
          :parameters (#q3 #q11 o8 #g2)
          :precondition (and (isconf #q3) (isconf #q11) (isgrasp o8 #g2))
          :effect (isholdingmotion #q3 #t993 #q11 o8 #g2)
   )
   (:action s1010_plan-holding-motion
          :parameters (#q3 #q11 o8 #g3)
          :precondition (and (isconf #q3) (isconf #q11) (isgrasp o8 #g3))
          :effect (isholdingmotion #q3 #t994 #q11 o8 #g3)
   )
   (:action s1011_plan-holding-motion
          :parameters (#q3 #q11 o9 #g4)
          :precondition (and (isconf #q3) (isconf #q11) (isgrasp o9 #g4))
          :effect (isholdingmotion #q3 #t995 #q11 o9 #g4)
   )
   (:action s1012_plan-holding-motion
          :parameters (#q3 #q11 o9 #g5)
          :precondition (and (isconf #q3) (isconf #q11) (isgrasp o9 #g5))
          :effect (isholdingmotion #q3 #t996 #q11 o9 #g5)
   )
   (:action s1013_plan-holding-motion
          :parameters (#q3 #q12 o8 #g0)
          :precondition (and (isconf #q3) (isconf #q12) (isgrasp o8 #g0))
          :effect (isholdingmotion #q3 #t997 #q12 o8 #g0)
   )
   (:action s1014_plan-holding-motion
          :parameters (#q3 #q12 o9 #g1)
          :precondition (and (isconf #q3) (isconf #q12) (isgrasp o9 #g1))
          :effect (isholdingmotion #q3 #t998 #q12 o9 #g1)
   )
   (:action s1015_plan-holding-motion
          :parameters (#q3 #q12 o8 #g2)
          :precondition (and (isconf #q3) (isconf #q12) (isgrasp o8 #g2))
          :effect (isholdingmotion #q3 #t999 #q12 o8 #g2)
   )
   (:action s1016_plan-holding-motion
          :parameters (#q3 #q12 o8 #g3)
          :precondition (and (isconf #q3) (isconf #q12) (isgrasp o8 #g3))
          :effect (isholdingmotion #q3 #t1000 #q12 o8 #g3)
   )
   (:action s1017_plan-holding-motion
          :parameters (#q3 #q12 o9 #g4)
          :precondition (and (isconf #q3) (isconf #q12) (isgrasp o9 #g4))
          :effect (isholdingmotion #q3 #t1001 #q12 o9 #g4)
   )
   (:action s1018_plan-holding-motion
          :parameters (#q3 #q12 o9 #g5)
          :precondition (and (isconf #q3) (isconf #q12) (isgrasp o9 #g5))
          :effect (isholdingmotion #q3 #t1002 #q12 o9 #g5)
   )
   (:action s1019_plan-holding-motion
          :parameters (#q3 #q13 o8 #g0)
          :precondition (and (isconf #q3) (isconf #q13) (isgrasp o8 #g0))
          :effect (isholdingmotion #q3 #t1003 #q13 o8 #g0)
   )
   (:action s1020_plan-holding-motion
          :parameters (#q3 #q13 o9 #g1)
          :precondition (and (isconf #q3) (isconf #q13) (isgrasp o9 #g1))
          :effect (isholdingmotion #q3 #t1004 #q13 o9 #g1)
   )
   (:action s1021_plan-holding-motion
          :parameters (#q3 #q13 o8 #g2)
          :precondition (and (isconf #q3) (isconf #q13) (isgrasp o8 #g2))
          :effect (isholdingmotion #q3 #t1005 #q13 o8 #g2)
   )
   (:action s1022_plan-holding-motion
          :parameters (#q3 #q13 o8 #g3)
          :precondition (and (isconf #q3) (isconf #q13) (isgrasp o8 #g3))
          :effect (isholdingmotion #q3 #t1006 #q13 o8 #g3)
   )
   (:action s1023_plan-holding-motion
          :parameters (#q3 #q13 o9 #g4)
          :precondition (and (isconf #q3) (isconf #q13) (isgrasp o9 #g4))
          :effect (isholdingmotion #q3 #t1007 #q13 o9 #g4)
   )
   (:action s1024_plan-holding-motion
          :parameters (#q3 #q13 o9 #g5)
          :precondition (and (isconf #q3) (isconf #q13) (isgrasp o9 #g5))
          :effect (isholdingmotion #q3 #t1008 #q13 o9 #g5)
   )
   (:action s1025_plan-holding-motion
          :parameters (#q3 #q14 o8 #g0)
          :precondition (and (isconf #q3) (isconf #q14) (isgrasp o8 #g0))
          :effect (isholdingmotion #q3 #t1009 #q14 o8 #g0)
   )
   (:action s1026_plan-holding-motion
          :parameters (#q3 #q14 o9 #g1)
          :precondition (and (isconf #q3) (isconf #q14) (isgrasp o9 #g1))
          :effect (isholdingmotion #q3 #t1010 #q14 o9 #g1)
   )
   (:action s1027_plan-holding-motion
          :parameters (#q3 #q14 o8 #g2)
          :precondition (and (isconf #q3) (isconf #q14) (isgrasp o8 #g2))
          :effect (isholdingmotion #q3 #t1011 #q14 o8 #g2)
   )
   (:action s1028_plan-holding-motion
          :parameters (#q3 #q14 o8 #g3)
          :precondition (and (isconf #q3) (isconf #q14) (isgrasp o8 #g3))
          :effect (isholdingmotion #q3 #t1012 #q14 o8 #g3)
   )
   (:action s1029_plan-holding-motion
          :parameters (#q3 #q14 o9 #g4)
          :precondition (and (isconf #q3) (isconf #q14) (isgrasp o9 #g4))
          :effect (isholdingmotion #q3 #t1013 #q14 o9 #g4)
   )
   (:action s1030_plan-holding-motion
          :parameters (#q3 #q14 o9 #g5)
          :precondition (and (isconf #q3) (isconf #q14) (isgrasp o9 #g5))
          :effect (isholdingmotion #q3 #t1014 #q14 o9 #g5)
   )
   (:action s1031_plan-holding-motion
          :parameters (#q3 #q15 o8 #g0)
          :precondition (and (isconf #q3) (isconf #q15) (isgrasp o8 #g0))
          :effect (isholdingmotion #q3 #t1015 #q15 o8 #g0)
   )
   (:action s1032_plan-holding-motion
          :parameters (#q3 #q15 o9 #g1)
          :precondition (and (isconf #q3) (isconf #q15) (isgrasp o9 #g1))
          :effect (isholdingmotion #q3 #t1016 #q15 o9 #g1)
   )
   (:action s1033_plan-holding-motion
          :parameters (#q3 #q15 o8 #g2)
          :precondition (and (isconf #q3) (isconf #q15) (isgrasp o8 #g2))
          :effect (isholdingmotion #q3 #t1017 #q15 o8 #g2)
   )
   (:action s1034_plan-holding-motion
          :parameters (#q3 #q15 o8 #g3)
          :precondition (and (isconf #q3) (isconf #q15) (isgrasp o8 #g3))
          :effect (isholdingmotion #q3 #t1018 #q15 o8 #g3)
   )
   (:action s1035_plan-holding-motion
          :parameters (#q3 #q15 o9 #g4)
          :precondition (and (isconf #q3) (isconf #q15) (isgrasp o9 #g4))
          :effect (isholdingmotion #q3 #t1019 #q15 o9 #g4)
   )
   (:action s1036_plan-holding-motion
          :parameters (#q3 #q15 o9 #g5)
          :precondition (and (isconf #q3) (isconf #q15) (isgrasp o9 #g5))
          :effect (isholdingmotion #q3 #t1020 #q15 o9 #g5)
   )
   (:action s1037_plan-holding-motion
          :parameters (#q3 #q16 o8 #g0)
          :precondition (and (isconf #q3) (isconf #q16) (isgrasp o8 #g0))
          :effect (isholdingmotion #q3 #t1021 #q16 o8 #g0)
   )
   (:action s1038_plan-holding-motion
          :parameters (#q3 #q16 o9 #g1)
          :precondition (and (isconf #q3) (isconf #q16) (isgrasp o9 #g1))
          :effect (isholdingmotion #q3 #t1022 #q16 o9 #g1)
   )
   (:action s1039_plan-holding-motion
          :parameters (#q3 #q16 o8 #g2)
          :precondition (and (isconf #q3) (isconf #q16) (isgrasp o8 #g2))
          :effect (isholdingmotion #q3 #t1023 #q16 o8 #g2)
   )
   (:action s1040_plan-holding-motion
          :parameters (#q3 #q16 o8 #g3)
          :precondition (and (isconf #q3) (isconf #q16) (isgrasp o8 #g3))
          :effect (isholdingmotion #q3 #t1024 #q16 o8 #g3)
   )
   (:action s1041_plan-holding-motion
          :parameters (#q3 #q16 o9 #g4)
          :precondition (and (isconf #q3) (isconf #q16) (isgrasp o9 #g4))
          :effect (isholdingmotion #q3 #t1025 #q16 o9 #g4)
   )
   (:action s1042_plan-holding-motion
          :parameters (#q3 #q16 o9 #g5)
          :precondition (and (isconf #q3) (isconf #q16) (isgrasp o9 #g5))
          :effect (isholdingmotion #q3 #t1026 #q16 o9 #g5)
   )
   (:action s1043_plan-holding-motion
          :parameters (#q3 #q17 o8 #g0)
          :precondition (and (isconf #q3) (isconf #q17) (isgrasp o8 #g0))
          :effect (isholdingmotion #q3 #t1027 #q17 o8 #g0)
   )
   (:action s1044_plan-holding-motion
          :parameters (#q3 #q17 o9 #g1)
          :precondition (and (isconf #q3) (isconf #q17) (isgrasp o9 #g1))
          :effect (isholdingmotion #q3 #t1028 #q17 o9 #g1)
   )
   (:action s1045_plan-holding-motion
          :parameters (#q3 #q17 o8 #g2)
          :precondition (and (isconf #q3) (isconf #q17) (isgrasp o8 #g2))
          :effect (isholdingmotion #q3 #t1029 #q17 o8 #g2)
   )
   (:action s1046_plan-holding-motion
          :parameters (#q3 #q17 o8 #g3)
          :precondition (and (isconf #q3) (isconf #q17) (isgrasp o8 #g3))
          :effect (isholdingmotion #q3 #t1030 #q17 o8 #g3)
   )
   (:action s1047_plan-holding-motion
          :parameters (#q3 #q17 o9 #g4)
          :precondition (and (isconf #q3) (isconf #q17) (isgrasp o9 #g4))
          :effect (isholdingmotion #q3 #t1031 #q17 o9 #g4)
   )
   (:action s1048_plan-holding-motion
          :parameters (#q3 #q17 o9 #g5)
          :precondition (and (isconf #q3) (isconf #q17) (isgrasp o9 #g5))
          :effect (isholdingmotion #q3 #t1032 #q17 o9 #g5)
   )
   (:action s1049_plan-holding-motion
          :parameters (#q4 #q6 o8 #g0)
          :precondition (and (isconf #q4) (isconf #q6) (isgrasp o8 #g0))
          :effect (isholdingmotion #q4 #t1033 #q6 o8 #g0)
   )
   (:action s1050_plan-holding-motion
          :parameters (#q4 #q6 o9 #g1)
          :precondition (and (isconf #q4) (isconf #q6) (isgrasp o9 #g1))
          :effect (isholdingmotion #q4 #t1034 #q6 o9 #g1)
   )
   (:action s1051_plan-holding-motion
          :parameters (#q4 #q6 o8 #g2)
          :precondition (and (isconf #q4) (isconf #q6) (isgrasp o8 #g2))
          :effect (isholdingmotion #q4 #t1035 #q6 o8 #g2)
   )
   (:action s1052_plan-holding-motion
          :parameters (#q4 #q6 o8 #g3)
          :precondition (and (isconf #q4) (isconf #q6) (isgrasp o8 #g3))
          :effect (isholdingmotion #q4 #t1036 #q6 o8 #g3)
   )
   (:action s1053_plan-holding-motion
          :parameters (#q4 #q6 o9 #g4)
          :precondition (and (isconf #q4) (isconf #q6) (isgrasp o9 #g4))
          :effect (isholdingmotion #q4 #t1037 #q6 o9 #g4)
   )
   (:action s1054_plan-holding-motion
          :parameters (#q4 #q6 o9 #g5)
          :precondition (and (isconf #q4) (isconf #q6) (isgrasp o9 #g5))
          :effect (isholdingmotion #q4 #t1038 #q6 o9 #g5)
   )
   (:action s1055_plan-holding-motion
          :parameters (#q4 #q7 o8 #g0)
          :precondition (and (isconf #q4) (isconf #q7) (isgrasp o8 #g0))
          :effect (isholdingmotion #q4 #t1039 #q7 o8 #g0)
   )
   (:action s1056_plan-holding-motion
          :parameters (#q4 #q7 o9 #g1)
          :precondition (and (isconf #q4) (isconf #q7) (isgrasp o9 #g1))
          :effect (isholdingmotion #q4 #t1040 #q7 o9 #g1)
   )
   (:action s1057_plan-holding-motion
          :parameters (#q4 #q7 o8 #g2)
          :precondition (and (isconf #q4) (isconf #q7) (isgrasp o8 #g2))
          :effect (isholdingmotion #q4 #t1041 #q7 o8 #g2)
   )
   (:action s1058_plan-holding-motion
          :parameters (#q4 #q7 o8 #g3)
          :precondition (and (isconf #q4) (isconf #q7) (isgrasp o8 #g3))
          :effect (isholdingmotion #q4 #t1042 #q7 o8 #g3)
   )
   (:action s1059_plan-holding-motion
          :parameters (#q4 #q7 o9 #g4)
          :precondition (and (isconf #q4) (isconf #q7) (isgrasp o9 #g4))
          :effect (isholdingmotion #q4 #t1043 #q7 o9 #g4)
   )
   (:action s1060_plan-holding-motion
          :parameters (#q4 #q7 o9 #g5)
          :precondition (and (isconf #q4) (isconf #q7) (isgrasp o9 #g5))
          :effect (isholdingmotion #q4 #t1044 #q7 o9 #g5)
   )
   (:action s1061_plan-holding-motion
          :parameters (#q4 #q8 o8 #g0)
          :precondition (and (isconf #q4) (isconf #q8) (isgrasp o8 #g0))
          :effect (isholdingmotion #q4 #t1045 #q8 o8 #g0)
   )
   (:action s1062_plan-holding-motion
          :parameters (#q4 #q8 o9 #g1)
          :precondition (and (isconf #q4) (isconf #q8) (isgrasp o9 #g1))
          :effect (isholdingmotion #q4 #t1046 #q8 o9 #g1)
   )
   (:action s1063_plan-holding-motion
          :parameters (#q4 #q8 o8 #g2)
          :precondition (and (isconf #q4) (isconf #q8) (isgrasp o8 #g2))
          :effect (isholdingmotion #q4 #t1047 #q8 o8 #g2)
   )
   (:action s1064_plan-holding-motion
          :parameters (#q4 #q8 o8 #g3)
          :precondition (and (isconf #q4) (isconf #q8) (isgrasp o8 #g3))
          :effect (isholdingmotion #q4 #t1048 #q8 o8 #g3)
   )
   (:action s1065_plan-holding-motion
          :parameters (#q4 #q8 o9 #g4)
          :precondition (and (isconf #q4) (isconf #q8) (isgrasp o9 #g4))
          :effect (isholdingmotion #q4 #t1049 #q8 o9 #g4)
   )
   (:action s1066_plan-holding-motion
          :parameters (#q4 #q8 o9 #g5)
          :precondition (and (isconf #q4) (isconf #q8) (isgrasp o9 #g5))
          :effect (isholdingmotion #q4 #t1050 #q8 o9 #g5)
   )
   (:action s1067_plan-holding-motion
          :parameters (#q4 #q9 o8 #g0)
          :precondition (and (isconf #q4) (isconf #q9) (isgrasp o8 #g0))
          :effect (isholdingmotion #q4 #t1051 #q9 o8 #g0)
   )
   (:action s1068_plan-holding-motion
          :parameters (#q4 #q9 o9 #g1)
          :precondition (and (isconf #q4) (isconf #q9) (isgrasp o9 #g1))
          :effect (isholdingmotion #q4 #t1052 #q9 o9 #g1)
   )
   (:action s1069_plan-holding-motion
          :parameters (#q4 #q9 o8 #g2)
          :precondition (and (isconf #q4) (isconf #q9) (isgrasp o8 #g2))
          :effect (isholdingmotion #q4 #t1053 #q9 o8 #g2)
   )
   (:action s1070_plan-holding-motion
          :parameters (#q4 #q9 o8 #g3)
          :precondition (and (isconf #q4) (isconf #q9) (isgrasp o8 #g3))
          :effect (isholdingmotion #q4 #t1054 #q9 o8 #g3)
   )
   (:action s1071_plan-holding-motion
          :parameters (#q4 #q9 o9 #g4)
          :precondition (and (isconf #q4) (isconf #q9) (isgrasp o9 #g4))
          :effect (isholdingmotion #q4 #t1055 #q9 o9 #g4)
   )
   (:action s1072_plan-holding-motion
          :parameters (#q4 #q9 o9 #g5)
          :precondition (and (isconf #q4) (isconf #q9) (isgrasp o9 #g5))
          :effect (isholdingmotion #q4 #t1056 #q9 o9 #g5)
   )
   (:action s1073_plan-holding-motion
          :parameters (#q4 #q10 o8 #g0)
          :precondition (and (isconf #q4) (isconf #q10) (isgrasp o8 #g0))
          :effect (isholdingmotion #q4 #t1057 #q10 o8 #g0)
   )
   (:action s1074_plan-holding-motion
          :parameters (#q4 #q10 o9 #g1)
          :precondition (and (isconf #q4) (isconf #q10) (isgrasp o9 #g1))
          :effect (isholdingmotion #q4 #t1058 #q10 o9 #g1)
   )
   (:action s1075_plan-holding-motion
          :parameters (#q4 #q10 o8 #g2)
          :precondition (and (isconf #q4) (isconf #q10) (isgrasp o8 #g2))
          :effect (isholdingmotion #q4 #t1059 #q10 o8 #g2)
   )
   (:action s1076_plan-holding-motion
          :parameters (#q4 #q10 o8 #g3)
          :precondition (and (isconf #q4) (isconf #q10) (isgrasp o8 #g3))
          :effect (isholdingmotion #q4 #t1060 #q10 o8 #g3)
   )
   (:action s1077_plan-holding-motion
          :parameters (#q4 #q10 o9 #g4)
          :precondition (and (isconf #q4) (isconf #q10) (isgrasp o9 #g4))
          :effect (isholdingmotion #q4 #t1061 #q10 o9 #g4)
   )
   (:action s1078_plan-holding-motion
          :parameters (#q4 #q10 o9 #g5)
          :precondition (and (isconf #q4) (isconf #q10) (isgrasp o9 #g5))
          :effect (isholdingmotion #q4 #t1062 #q10 o9 #g5)
   )
   (:action s1079_plan-holding-motion
          :parameters (#q4 #q11 o8 #g0)
          :precondition (and (isconf #q4) (isconf #q11) (isgrasp o8 #g0))
          :effect (isholdingmotion #q4 #t1063 #q11 o8 #g0)
   )
   (:action s1080_plan-holding-motion
          :parameters (#q4 #q11 o9 #g1)
          :precondition (and (isconf #q4) (isconf #q11) (isgrasp o9 #g1))
          :effect (isholdingmotion #q4 #t1064 #q11 o9 #g1)
   )
   (:action s1081_plan-holding-motion
          :parameters (#q4 #q11 o8 #g2)
          :precondition (and (isconf #q4) (isconf #q11) (isgrasp o8 #g2))
          :effect (isholdingmotion #q4 #t1065 #q11 o8 #g2)
   )
   (:action s1082_plan-holding-motion
          :parameters (#q4 #q11 o8 #g3)
          :precondition (and (isconf #q4) (isconf #q11) (isgrasp o8 #g3))
          :effect (isholdingmotion #q4 #t1066 #q11 o8 #g3)
   )
   (:action s1083_plan-holding-motion
          :parameters (#q4 #q11 o9 #g4)
          :precondition (and (isconf #q4) (isconf #q11) (isgrasp o9 #g4))
          :effect (isholdingmotion #q4 #t1067 #q11 o9 #g4)
   )
   (:action s1084_plan-holding-motion
          :parameters (#q4 #q11 o9 #g5)
          :precondition (and (isconf #q4) (isconf #q11) (isgrasp o9 #g5))
          :effect (isholdingmotion #q4 #t1068 #q11 o9 #g5)
   )
   (:action s1085_plan-holding-motion
          :parameters (#q4 #q12 o8 #g0)
          :precondition (and (isconf #q4) (isconf #q12) (isgrasp o8 #g0))
          :effect (isholdingmotion #q4 #t1069 #q12 o8 #g0)
   )
   (:action s1086_plan-holding-motion
          :parameters (#q4 #q12 o9 #g1)
          :precondition (and (isconf #q4) (isconf #q12) (isgrasp o9 #g1))
          :effect (isholdingmotion #q4 #t1070 #q12 o9 #g1)
   )
   (:action s1087_plan-holding-motion
          :parameters (#q4 #q12 o8 #g2)
          :precondition (and (isconf #q4) (isconf #q12) (isgrasp o8 #g2))
          :effect (isholdingmotion #q4 #t1071 #q12 o8 #g2)
   )
   (:action s1088_plan-holding-motion
          :parameters (#q4 #q12 o8 #g3)
          :precondition (and (isconf #q4) (isconf #q12) (isgrasp o8 #g3))
          :effect (isholdingmotion #q4 #t1072 #q12 o8 #g3)
   )
   (:action s1089_plan-holding-motion
          :parameters (#q4 #q12 o9 #g4)
          :precondition (and (isconf #q4) (isconf #q12) (isgrasp o9 #g4))
          :effect (isholdingmotion #q4 #t1073 #q12 o9 #g4)
   )
   (:action s1090_plan-holding-motion
          :parameters (#q4 #q12 o9 #g5)
          :precondition (and (isconf #q4) (isconf #q12) (isgrasp o9 #g5))
          :effect (isholdingmotion #q4 #t1074 #q12 o9 #g5)
   )
   (:action s1091_plan-holding-motion
          :parameters (#q4 #q13 o8 #g0)
          :precondition (and (isconf #q4) (isconf #q13) (isgrasp o8 #g0))
          :effect (isholdingmotion #q4 #t1075 #q13 o8 #g0)
   )
   (:action s1092_plan-holding-motion
          :parameters (#q4 #q13 o9 #g1)
          :precondition (and (isconf #q4) (isconf #q13) (isgrasp o9 #g1))
          :effect (isholdingmotion #q4 #t1076 #q13 o9 #g1)
   )
   (:action s1093_plan-holding-motion
          :parameters (#q4 #q13 o8 #g2)
          :precondition (and (isconf #q4) (isconf #q13) (isgrasp o8 #g2))
          :effect (isholdingmotion #q4 #t1077 #q13 o8 #g2)
   )
   (:action s1094_plan-holding-motion
          :parameters (#q4 #q13 o8 #g3)
          :precondition (and (isconf #q4) (isconf #q13) (isgrasp o8 #g3))
          :effect (isholdingmotion #q4 #t1078 #q13 o8 #g3)
   )
   (:action s1095_plan-holding-motion
          :parameters (#q4 #q13 o9 #g4)
          :precondition (and (isconf #q4) (isconf #q13) (isgrasp o9 #g4))
          :effect (isholdingmotion #q4 #t1079 #q13 o9 #g4)
   )
   (:action s1096_plan-holding-motion
          :parameters (#q4 #q13 o9 #g5)
          :precondition (and (isconf #q4) (isconf #q13) (isgrasp o9 #g5))
          :effect (isholdingmotion #q4 #t1080 #q13 o9 #g5)
   )
   (:action s1097_plan-holding-motion
          :parameters (#q4 #q14 o8 #g0)
          :precondition (and (isconf #q4) (isconf #q14) (isgrasp o8 #g0))
          :effect (isholdingmotion #q4 #t1081 #q14 o8 #g0)
   )
   (:action s1098_plan-holding-motion
          :parameters (#q4 #q14 o9 #g1)
          :precondition (and (isconf #q4) (isconf #q14) (isgrasp o9 #g1))
          :effect (isholdingmotion #q4 #t1082 #q14 o9 #g1)
   )
   (:action s1099_plan-holding-motion
          :parameters (#q4 #q14 o8 #g2)
          :precondition (and (isconf #q4) (isconf #q14) (isgrasp o8 #g2))
          :effect (isholdingmotion #q4 #t1083 #q14 o8 #g2)
   )
   (:action s1100_plan-holding-motion
          :parameters (#q4 #q14 o8 #g3)
          :precondition (and (isconf #q4) (isconf #q14) (isgrasp o8 #g3))
          :effect (isholdingmotion #q4 #t1084 #q14 o8 #g3)
   )
   (:action s1101_plan-holding-motion
          :parameters (#q4 #q14 o9 #g4)
          :precondition (and (isconf #q4) (isconf #q14) (isgrasp o9 #g4))
          :effect (isholdingmotion #q4 #t1085 #q14 o9 #g4)
   )
   (:action s1102_plan-holding-motion
          :parameters (#q4 #q14 o9 #g5)
          :precondition (and (isconf #q4) (isconf #q14) (isgrasp o9 #g5))
          :effect (isholdingmotion #q4 #t1086 #q14 o9 #g5)
   )
   (:action s1103_plan-holding-motion
          :parameters (#q4 #q15 o8 #g0)
          :precondition (and (isconf #q4) (isconf #q15) (isgrasp o8 #g0))
          :effect (isholdingmotion #q4 #t1087 #q15 o8 #g0)
   )
   (:action s1104_plan-holding-motion
          :parameters (#q4 #q15 o9 #g1)
          :precondition (and (isconf #q4) (isconf #q15) (isgrasp o9 #g1))
          :effect (isholdingmotion #q4 #t1088 #q15 o9 #g1)
   )
   (:action s1105_plan-holding-motion
          :parameters (#q4 #q15 o8 #g2)
          :precondition (and (isconf #q4) (isconf #q15) (isgrasp o8 #g2))
          :effect (isholdingmotion #q4 #t1089 #q15 o8 #g2)
   )
   (:action s1106_plan-holding-motion
          :parameters (#q4 #q15 o8 #g3)
          :precondition (and (isconf #q4) (isconf #q15) (isgrasp o8 #g3))
          :effect (isholdingmotion #q4 #t1090 #q15 o8 #g3)
   )
   (:action s1107_plan-holding-motion
          :parameters (#q4 #q15 o9 #g4)
          :precondition (and (isconf #q4) (isconf #q15) (isgrasp o9 #g4))
          :effect (isholdingmotion #q4 #t1091 #q15 o9 #g4)
   )
   (:action s1108_plan-holding-motion
          :parameters (#q4 #q15 o9 #g5)
          :precondition (and (isconf #q4) (isconf #q15) (isgrasp o9 #g5))
          :effect (isholdingmotion #q4 #t1092 #q15 o9 #g5)
   )
   (:action s1109_plan-holding-motion
          :parameters (#q4 #q16 o8 #g0)
          :precondition (and (isconf #q4) (isconf #q16) (isgrasp o8 #g0))
          :effect (isholdingmotion #q4 #t1093 #q16 o8 #g0)
   )
   (:action s1110_plan-holding-motion
          :parameters (#q4 #q16 o9 #g1)
          :precondition (and (isconf #q4) (isconf #q16) (isgrasp o9 #g1))
          :effect (isholdingmotion #q4 #t1094 #q16 o9 #g1)
   )
   (:action s1111_plan-holding-motion
          :parameters (#q4 #q16 o8 #g2)
          :precondition (and (isconf #q4) (isconf #q16) (isgrasp o8 #g2))
          :effect (isholdingmotion #q4 #t1095 #q16 o8 #g2)
   )
   (:action s1112_plan-holding-motion
          :parameters (#q4 #q16 o8 #g3)
          :precondition (and (isconf #q4) (isconf #q16) (isgrasp o8 #g3))
          :effect (isholdingmotion #q4 #t1096 #q16 o8 #g3)
   )
   (:action s1113_plan-holding-motion
          :parameters (#q4 #q16 o9 #g4)
          :precondition (and (isconf #q4) (isconf #q16) (isgrasp o9 #g4))
          :effect (isholdingmotion #q4 #t1097 #q16 o9 #g4)
   )
   (:action s1114_plan-holding-motion
          :parameters (#q4 #q16 o9 #g5)
          :precondition (and (isconf #q4) (isconf #q16) (isgrasp o9 #g5))
          :effect (isholdingmotion #q4 #t1098 #q16 o9 #g5)
   )
   (:action s1115_plan-holding-motion
          :parameters (#q4 #q17 o8 #g0)
          :precondition (and (isconf #q4) (isconf #q17) (isgrasp o8 #g0))
          :effect (isholdingmotion #q4 #t1099 #q17 o8 #g0)
   )
   (:action s1116_plan-holding-motion
          :parameters (#q4 #q17 o9 #g1)
          :precondition (and (isconf #q4) (isconf #q17) (isgrasp o9 #g1))
          :effect (isholdingmotion #q4 #t1100 #q17 o9 #g1)
   )
   (:action s1117_plan-holding-motion
          :parameters (#q4 #q17 o8 #g2)
          :precondition (and (isconf #q4) (isconf #q17) (isgrasp o8 #g2))
          :effect (isholdingmotion #q4 #t1101 #q17 o8 #g2)
   )
   (:action s1118_plan-holding-motion
          :parameters (#q4 #q17 o8 #g3)
          :precondition (and (isconf #q4) (isconf #q17) (isgrasp o8 #g3))
          :effect (isholdingmotion #q4 #t1102 #q17 o8 #g3)
   )
   (:action s1119_plan-holding-motion
          :parameters (#q4 #q17 o9 #g4)
          :precondition (and (isconf #q4) (isconf #q17) (isgrasp o9 #g4))
          :effect (isholdingmotion #q4 #t1103 #q17 o9 #g4)
   )
   (:action s1120_plan-holding-motion
          :parameters (#q4 #q17 o9 #g5)
          :precondition (and (isconf #q4) (isconf #q17) (isgrasp o9 #g5))
          :effect (isholdingmotion #q4 #t1104 #q17 o9 #g5)
   )
   (:action s1121_plan-holding-motion
          :parameters (#q5 #q6 o8 #g0)
          :precondition (and (isconf #q5) (isconf #q6) (isgrasp o8 #g0))
          :effect (isholdingmotion #q5 #t1105 #q6 o8 #g0)
   )
   (:action s1122_plan-holding-motion
          :parameters (#q5 #q6 o9 #g1)
          :precondition (and (isconf #q5) (isconf #q6) (isgrasp o9 #g1))
          :effect (isholdingmotion #q5 #t1106 #q6 o9 #g1)
   )
   (:action s1123_plan-holding-motion
          :parameters (#q5 #q6 o8 #g2)
          :precondition (and (isconf #q5) (isconf #q6) (isgrasp o8 #g2))
          :effect (isholdingmotion #q5 #t1107 #q6 o8 #g2)
   )
   (:action s1124_plan-holding-motion
          :parameters (#q5 #q6 o8 #g3)
          :precondition (and (isconf #q5) (isconf #q6) (isgrasp o8 #g3))
          :effect (isholdingmotion #q5 #t1108 #q6 o8 #g3)
   )
   (:action s1125_plan-holding-motion
          :parameters (#q5 #q6 o9 #g4)
          :precondition (and (isconf #q5) (isconf #q6) (isgrasp o9 #g4))
          :effect (isholdingmotion #q5 #t1109 #q6 o9 #g4)
   )
   (:action s1126_plan-holding-motion
          :parameters (#q5 #q6 o9 #g5)
          :precondition (and (isconf #q5) (isconf #q6) (isgrasp o9 #g5))
          :effect (isholdingmotion #q5 #t1110 #q6 o9 #g5)
   )
   (:action s1127_plan-holding-motion
          :parameters (#q5 #q7 o8 #g0)
          :precondition (and (isconf #q5) (isconf #q7) (isgrasp o8 #g0))
          :effect (isholdingmotion #q5 #t1111 #q7 o8 #g0)
   )
   (:action s1128_plan-holding-motion
          :parameters (#q5 #q7 o9 #g1)
          :precondition (and (isconf #q5) (isconf #q7) (isgrasp o9 #g1))
          :effect (isholdingmotion #q5 #t1112 #q7 o9 #g1)
   )
   (:action s1129_plan-holding-motion
          :parameters (#q5 #q7 o8 #g2)
          :precondition (and (isconf #q5) (isconf #q7) (isgrasp o8 #g2))
          :effect (isholdingmotion #q5 #t1113 #q7 o8 #g2)
   )
   (:action s1130_plan-holding-motion
          :parameters (#q5 #q7 o8 #g3)
          :precondition (and (isconf #q5) (isconf #q7) (isgrasp o8 #g3))
          :effect (isholdingmotion #q5 #t1114 #q7 o8 #g3)
   )
   (:action s1131_plan-holding-motion
          :parameters (#q5 #q7 o9 #g4)
          :precondition (and (isconf #q5) (isconf #q7) (isgrasp o9 #g4))
          :effect (isholdingmotion #q5 #t1115 #q7 o9 #g4)
   )
   (:action s1132_plan-holding-motion
          :parameters (#q5 #q7 o9 #g5)
          :precondition (and (isconf #q5) (isconf #q7) (isgrasp o9 #g5))
          :effect (isholdingmotion #q5 #t1116 #q7 o9 #g5)
   )
   (:action s1133_plan-holding-motion
          :parameters (#q5 #q8 o8 #g0)
          :precondition (and (isconf #q5) (isconf #q8) (isgrasp o8 #g0))
          :effect (isholdingmotion #q5 #t1117 #q8 o8 #g0)
   )
   (:action s1134_plan-holding-motion
          :parameters (#q5 #q8 o9 #g1)
          :precondition (and (isconf #q5) (isconf #q8) (isgrasp o9 #g1))
          :effect (isholdingmotion #q5 #t1118 #q8 o9 #g1)
   )
   (:action s1135_plan-holding-motion
          :parameters (#q5 #q8 o8 #g2)
          :precondition (and (isconf #q5) (isconf #q8) (isgrasp o8 #g2))
          :effect (isholdingmotion #q5 #t1119 #q8 o8 #g2)
   )
   (:action s1136_plan-holding-motion
          :parameters (#q5 #q8 o8 #g3)
          :precondition (and (isconf #q5) (isconf #q8) (isgrasp o8 #g3))
          :effect (isholdingmotion #q5 #t1120 #q8 o8 #g3)
   )
   (:action s1137_plan-holding-motion
          :parameters (#q5 #q8 o9 #g4)
          :precondition (and (isconf #q5) (isconf #q8) (isgrasp o9 #g4))
          :effect (isholdingmotion #q5 #t1121 #q8 o9 #g4)
   )
   (:action s1138_plan-holding-motion
          :parameters (#q5 #q8 o9 #g5)
          :precondition (and (isconf #q5) (isconf #q8) (isgrasp o9 #g5))
          :effect (isholdingmotion #q5 #t1122 #q8 o9 #g5)
   )
   (:action s1139_plan-holding-motion
          :parameters (#q5 #q9 o8 #g0)
          :precondition (and (isconf #q5) (isconf #q9) (isgrasp o8 #g0))
          :effect (isholdingmotion #q5 #t1123 #q9 o8 #g0)
   )
   (:action s1140_plan-holding-motion
          :parameters (#q5 #q9 o9 #g1)
          :precondition (and (isconf #q5) (isconf #q9) (isgrasp o9 #g1))
          :effect (isholdingmotion #q5 #t1124 #q9 o9 #g1)
   )
   (:action s1141_plan-holding-motion
          :parameters (#q5 #q9 o8 #g2)
          :precondition (and (isconf #q5) (isconf #q9) (isgrasp o8 #g2))
          :effect (isholdingmotion #q5 #t1125 #q9 o8 #g2)
   )
   (:action s1142_plan-holding-motion
          :parameters (#q5 #q9 o8 #g3)
          :precondition (and (isconf #q5) (isconf #q9) (isgrasp o8 #g3))
          :effect (isholdingmotion #q5 #t1126 #q9 o8 #g3)
   )
   (:action s1143_plan-holding-motion
          :parameters (#q5 #q9 o9 #g4)
          :precondition (and (isconf #q5) (isconf #q9) (isgrasp o9 #g4))
          :effect (isholdingmotion #q5 #t1127 #q9 o9 #g4)
   )
   (:action s1144_plan-holding-motion
          :parameters (#q5 #q9 o9 #g5)
          :precondition (and (isconf #q5) (isconf #q9) (isgrasp o9 #g5))
          :effect (isholdingmotion #q5 #t1128 #q9 o9 #g5)
   )
   (:action s1145_plan-holding-motion
          :parameters (#q5 #q10 o8 #g0)
          :precondition (and (isconf #q5) (isconf #q10) (isgrasp o8 #g0))
          :effect (isholdingmotion #q5 #t1129 #q10 o8 #g0)
   )
   (:action s1146_plan-holding-motion
          :parameters (#q5 #q10 o9 #g1)
          :precondition (and (isconf #q5) (isconf #q10) (isgrasp o9 #g1))
          :effect (isholdingmotion #q5 #t1130 #q10 o9 #g1)
   )
   (:action s1147_plan-holding-motion
          :parameters (#q5 #q10 o8 #g2)
          :precondition (and (isconf #q5) (isconf #q10) (isgrasp o8 #g2))
          :effect (isholdingmotion #q5 #t1131 #q10 o8 #g2)
   )
   (:action s1148_plan-holding-motion
          :parameters (#q5 #q10 o8 #g3)
          :precondition (and (isconf #q5) (isconf #q10) (isgrasp o8 #g3))
          :effect (isholdingmotion #q5 #t1132 #q10 o8 #g3)
   )
   (:action s1149_plan-holding-motion
          :parameters (#q5 #q10 o9 #g4)
          :precondition (and (isconf #q5) (isconf #q10) (isgrasp o9 #g4))
          :effect (isholdingmotion #q5 #t1133 #q10 o9 #g4)
   )
   (:action s1150_plan-holding-motion
          :parameters (#q5 #q10 o9 #g5)
          :precondition (and (isconf #q5) (isconf #q10) (isgrasp o9 #g5))
          :effect (isholdingmotion #q5 #t1134 #q10 o9 #g5)
   )
   (:action s1151_plan-holding-motion
          :parameters (#q5 #q11 o8 #g0)
          :precondition (and (isconf #q5) (isconf #q11) (isgrasp o8 #g0))
          :effect (isholdingmotion #q5 #t1135 #q11 o8 #g0)
   )
   (:action s1152_plan-holding-motion
          :parameters (#q5 #q11 o9 #g1)
          :precondition (and (isconf #q5) (isconf #q11) (isgrasp o9 #g1))
          :effect (isholdingmotion #q5 #t1136 #q11 o9 #g1)
   )
   (:action s1153_plan-holding-motion
          :parameters (#q5 #q11 o8 #g2)
          :precondition (and (isconf #q5) (isconf #q11) (isgrasp o8 #g2))
          :effect (isholdingmotion #q5 #t1137 #q11 o8 #g2)
   )
   (:action s1154_plan-holding-motion
          :parameters (#q5 #q11 o8 #g3)
          :precondition (and (isconf #q5) (isconf #q11) (isgrasp o8 #g3))
          :effect (isholdingmotion #q5 #t1138 #q11 o8 #g3)
   )
   (:action s1155_plan-holding-motion
          :parameters (#q5 #q11 o9 #g4)
          :precondition (and (isconf #q5) (isconf #q11) (isgrasp o9 #g4))
          :effect (isholdingmotion #q5 #t1139 #q11 o9 #g4)
   )
   (:action s1156_plan-holding-motion
          :parameters (#q5 #q11 o9 #g5)
          :precondition (and (isconf #q5) (isconf #q11) (isgrasp o9 #g5))
          :effect (isholdingmotion #q5 #t1140 #q11 o9 #g5)
   )
   (:action s1157_plan-holding-motion
          :parameters (#q5 #q12 o8 #g0)
          :precondition (and (isconf #q5) (isconf #q12) (isgrasp o8 #g0))
          :effect (isholdingmotion #q5 #t1141 #q12 o8 #g0)
   )
   (:action s1158_plan-holding-motion
          :parameters (#q5 #q12 o9 #g1)
          :precondition (and (isconf #q5) (isconf #q12) (isgrasp o9 #g1))
          :effect (isholdingmotion #q5 #t1142 #q12 o9 #g1)
   )
   (:action s1159_plan-holding-motion
          :parameters (#q5 #q12 o8 #g2)
          :precondition (and (isconf #q5) (isconf #q12) (isgrasp o8 #g2))
          :effect (isholdingmotion #q5 #t1143 #q12 o8 #g2)
   )
   (:action s1160_plan-holding-motion
          :parameters (#q5 #q12 o8 #g3)
          :precondition (and (isconf #q5) (isconf #q12) (isgrasp o8 #g3))
          :effect (isholdingmotion #q5 #t1144 #q12 o8 #g3)
   )
   (:action s1161_plan-holding-motion
          :parameters (#q5 #q12 o9 #g4)
          :precondition (and (isconf #q5) (isconf #q12) (isgrasp o9 #g4))
          :effect (isholdingmotion #q5 #t1145 #q12 o9 #g4)
   )
   (:action s1162_plan-holding-motion
          :parameters (#q5 #q12 o9 #g5)
          :precondition (and (isconf #q5) (isconf #q12) (isgrasp o9 #g5))
          :effect (isholdingmotion #q5 #t1146 #q12 o9 #g5)
   )
   (:action s1163_plan-holding-motion
          :parameters (#q5 #q13 o8 #g0)
          :precondition (and (isconf #q5) (isconf #q13) (isgrasp o8 #g0))
          :effect (isholdingmotion #q5 #t1147 #q13 o8 #g0)
   )
   (:action s1164_plan-holding-motion
          :parameters (#q5 #q13 o9 #g1)
          :precondition (and (isconf #q5) (isconf #q13) (isgrasp o9 #g1))
          :effect (isholdingmotion #q5 #t1148 #q13 o9 #g1)
   )
   (:action s1165_plan-holding-motion
          :parameters (#q5 #q13 o8 #g2)
          :precondition (and (isconf #q5) (isconf #q13) (isgrasp o8 #g2))
          :effect (isholdingmotion #q5 #t1149 #q13 o8 #g2)
   )
   (:action s1166_plan-holding-motion
          :parameters (#q5 #q13 o8 #g3)
          :precondition (and (isconf #q5) (isconf #q13) (isgrasp o8 #g3))
          :effect (isholdingmotion #q5 #t1150 #q13 o8 #g3)
   )
   (:action s1167_plan-holding-motion
          :parameters (#q5 #q13 o9 #g4)
          :precondition (and (isconf #q5) (isconf #q13) (isgrasp o9 #g4))
          :effect (isholdingmotion #q5 #t1151 #q13 o9 #g4)
   )
   (:action s1168_plan-holding-motion
          :parameters (#q5 #q13 o9 #g5)
          :precondition (and (isconf #q5) (isconf #q13) (isgrasp o9 #g5))
          :effect (isholdingmotion #q5 #t1152 #q13 o9 #g5)
   )
   (:action s1169_plan-holding-motion
          :parameters (#q5 #q14 o8 #g0)
          :precondition (and (isconf #q5) (isconf #q14) (isgrasp o8 #g0))
          :effect (isholdingmotion #q5 #t1153 #q14 o8 #g0)
   )
   (:action s1170_plan-holding-motion
          :parameters (#q5 #q14 o9 #g1)
          :precondition (and (isconf #q5) (isconf #q14) (isgrasp o9 #g1))
          :effect (isholdingmotion #q5 #t1154 #q14 o9 #g1)
   )
   (:action s1171_plan-holding-motion
          :parameters (#q5 #q14 o8 #g2)
          :precondition (and (isconf #q5) (isconf #q14) (isgrasp o8 #g2))
          :effect (isholdingmotion #q5 #t1155 #q14 o8 #g2)
   )
   (:action s1172_plan-holding-motion
          :parameters (#q5 #q14 o8 #g3)
          :precondition (and (isconf #q5) (isconf #q14) (isgrasp o8 #g3))
          :effect (isholdingmotion #q5 #t1156 #q14 o8 #g3)
   )
   (:action s1173_plan-holding-motion
          :parameters (#q5 #q14 o9 #g4)
          :precondition (and (isconf #q5) (isconf #q14) (isgrasp o9 #g4))
          :effect (isholdingmotion #q5 #t1157 #q14 o9 #g4)
   )
   (:action s1174_plan-holding-motion
          :parameters (#q5 #q14 o9 #g5)
          :precondition (and (isconf #q5) (isconf #q14) (isgrasp o9 #g5))
          :effect (isholdingmotion #q5 #t1158 #q14 o9 #g5)
   )
   (:action s1175_plan-holding-motion
          :parameters (#q5 #q15 o8 #g0)
          :precondition (and (isconf #q5) (isconf #q15) (isgrasp o8 #g0))
          :effect (isholdingmotion #q5 #t1159 #q15 o8 #g0)
   )
   (:action s1176_plan-holding-motion
          :parameters (#q5 #q15 o9 #g1)
          :precondition (and (isconf #q5) (isconf #q15) (isgrasp o9 #g1))
          :effect (isholdingmotion #q5 #t1160 #q15 o9 #g1)
   )
   (:action s1177_plan-holding-motion
          :parameters (#q5 #q15 o8 #g2)
          :precondition (and (isconf #q5) (isconf #q15) (isgrasp o8 #g2))
          :effect (isholdingmotion #q5 #t1161 #q15 o8 #g2)
   )
   (:action s1178_plan-holding-motion
          :parameters (#q5 #q15 o8 #g3)
          :precondition (and (isconf #q5) (isconf #q15) (isgrasp o8 #g3))
          :effect (isholdingmotion #q5 #t1162 #q15 o8 #g3)
   )
   (:action s1179_plan-holding-motion
          :parameters (#q5 #q15 o9 #g4)
          :precondition (and (isconf #q5) (isconf #q15) (isgrasp o9 #g4))
          :effect (isholdingmotion #q5 #t1163 #q15 o9 #g4)
   )
   (:action s1180_plan-holding-motion
          :parameters (#q5 #q15 o9 #g5)
          :precondition (and (isconf #q5) (isconf #q15) (isgrasp o9 #g5))
          :effect (isholdingmotion #q5 #t1164 #q15 o9 #g5)
   )
   (:action s1181_plan-holding-motion
          :parameters (#q5 #q16 o8 #g0)
          :precondition (and (isconf #q5) (isconf #q16) (isgrasp o8 #g0))
          :effect (isholdingmotion #q5 #t1165 #q16 o8 #g0)
   )
   (:action s1182_plan-holding-motion
          :parameters (#q5 #q16 o9 #g1)
          :precondition (and (isconf #q5) (isconf #q16) (isgrasp o9 #g1))
          :effect (isholdingmotion #q5 #t1166 #q16 o9 #g1)
   )
   (:action s1183_plan-holding-motion
          :parameters (#q5 #q16 o8 #g2)
          :precondition (and (isconf #q5) (isconf #q16) (isgrasp o8 #g2))
          :effect (isholdingmotion #q5 #t1167 #q16 o8 #g2)
   )
   (:action s1184_plan-holding-motion
          :parameters (#q5 #q16 o8 #g3)
          :precondition (and (isconf #q5) (isconf #q16) (isgrasp o8 #g3))
          :effect (isholdingmotion #q5 #t1168 #q16 o8 #g3)
   )
   (:action s1185_plan-holding-motion
          :parameters (#q5 #q16 o9 #g4)
          :precondition (and (isconf #q5) (isconf #q16) (isgrasp o9 #g4))
          :effect (isholdingmotion #q5 #t1169 #q16 o9 #g4)
   )
   (:action s1186_plan-holding-motion
          :parameters (#q5 #q16 o9 #g5)
          :precondition (and (isconf #q5) (isconf #q16) (isgrasp o9 #g5))
          :effect (isholdingmotion #q5 #t1170 #q16 o9 #g5)
   )
   (:action s1187_plan-holding-motion
          :parameters (#q5 #q17 o8 #g0)
          :precondition (and (isconf #q5) (isconf #q17) (isgrasp o8 #g0))
          :effect (isholdingmotion #q5 #t1171 #q17 o8 #g0)
   )
   (:action s1188_plan-holding-motion
          :parameters (#q5 #q17 o9 #g1)
          :precondition (and (isconf #q5) (isconf #q17) (isgrasp o9 #g1))
          :effect (isholdingmotion #q5 #t1172 #q17 o9 #g1)
   )
   (:action s1189_plan-holding-motion
          :parameters (#q5 #q17 o8 #g2)
          :precondition (and (isconf #q5) (isconf #q17) (isgrasp o8 #g2))
          :effect (isholdingmotion #q5 #t1173 #q17 o8 #g2)
   )
   (:action s1190_plan-holding-motion
          :parameters (#q5 #q17 o8 #g3)
          :precondition (and (isconf #q5) (isconf #q17) (isgrasp o8 #g3))
          :effect (isholdingmotion #q5 #t1174 #q17 o8 #g3)
   )
   (:action s1191_plan-holding-motion
          :parameters (#q5 #q17 o9 #g4)
          :precondition (and (isconf #q5) (isconf #q17) (isgrasp o9 #g4))
          :effect (isholdingmotion #q5 #t1175 #q17 o9 #g4)
   )
   (:action s1192_plan-holding-motion
          :parameters (#q5 #q17 o9 #g5)
          :precondition (and (isconf #q5) (isconf #q17) (isgrasp o9 #g5))
          :effect (isholdingmotion #q5 #t1176 #q17 o9 #g5)
   )
   (:action s1193_plan-holding-motion
          :parameters (#q6 q808 o8 #g0)
          :precondition (and (isconf #q6) (isconf q808) (isgrasp o8 #g0))
          :effect (isholdingmotion #q6 #t1177 q808 o8 #g0)
   )
   (:action s1194_plan-holding-motion
          :parameters (#q6 q808 o9 #g1)
          :precondition (and (isconf #q6) (isconf q808) (isgrasp o9 #g1))
          :effect (isholdingmotion #q6 #t1178 q808 o9 #g1)
   )
   (:action s1195_plan-holding-motion
          :parameters (#q6 q808 o8 #g2)
          :precondition (and (isconf #q6) (isconf q808) (isgrasp o8 #g2))
          :effect (isholdingmotion #q6 #t1179 q808 o8 #g2)
   )
   (:action s1196_plan-holding-motion
          :parameters (#q6 q808 o8 #g3)
          :precondition (and (isconf #q6) (isconf q808) (isgrasp o8 #g3))
          :effect (isholdingmotion #q6 #t1180 q808 o8 #g3)
   )
   (:action s1197_plan-holding-motion
          :parameters (#q6 q808 o9 #g4)
          :precondition (and (isconf #q6) (isconf q808) (isgrasp o9 #g4))
          :effect (isholdingmotion #q6 #t1181 q808 o9 #g4)
   )
   (:action s1198_plan-holding-motion
          :parameters (#q6 q808 o9 #g5)
          :precondition (and (isconf #q6) (isconf q808) (isgrasp o9 #g5))
          :effect (isholdingmotion #q6 #t1182 q808 o9 #g5)
   )
   (:action s1199_plan-holding-motion
          :parameters (#q6 #q0 o8 #g0)
          :precondition (and (isconf #q6) (isconf #q0) (isgrasp o8 #g0))
          :effect (isholdingmotion #q6 #t1183 #q0 o8 #g0)
   )
   (:action s1200_plan-holding-motion
          :parameters (#q6 #q0 o9 #g1)
          :precondition (and (isconf #q6) (isconf #q0) (isgrasp o9 #g1))
          :effect (isholdingmotion #q6 #t1184 #q0 o9 #g1)
   )
   (:action s1201_plan-holding-motion
          :parameters (#q6 #q0 o8 #g2)
          :precondition (and (isconf #q6) (isconf #q0) (isgrasp o8 #g2))
          :effect (isholdingmotion #q6 #t1185 #q0 o8 #g2)
   )
   (:action s1202_plan-holding-motion
          :parameters (#q6 #q0 o8 #g3)
          :precondition (and (isconf #q6) (isconf #q0) (isgrasp o8 #g3))
          :effect (isholdingmotion #q6 #t1186 #q0 o8 #g3)
   )
   (:action s1203_plan-holding-motion
          :parameters (#q6 #q0 o9 #g4)
          :precondition (and (isconf #q6) (isconf #q0) (isgrasp o9 #g4))
          :effect (isholdingmotion #q6 #t1187 #q0 o9 #g4)
   )
   (:action s1204_plan-holding-motion
          :parameters (#q6 #q0 o9 #g5)
          :precondition (and (isconf #q6) (isconf #q0) (isgrasp o9 #g5))
          :effect (isholdingmotion #q6 #t1188 #q0 o9 #g5)
   )
   (:action s1205_plan-holding-motion
          :parameters (#q6 #q1 o8 #g0)
          :precondition (and (isconf #q6) (isconf #q1) (isgrasp o8 #g0))
          :effect (isholdingmotion #q6 #t1189 #q1 o8 #g0)
   )
   (:action s1206_plan-holding-motion
          :parameters (#q6 #q1 o9 #g1)
          :precondition (and (isconf #q6) (isconf #q1) (isgrasp o9 #g1))
          :effect (isholdingmotion #q6 #t1190 #q1 o9 #g1)
   )
   (:action s1207_plan-holding-motion
          :parameters (#q6 #q1 o8 #g2)
          :precondition (and (isconf #q6) (isconf #q1) (isgrasp o8 #g2))
          :effect (isholdingmotion #q6 #t1191 #q1 o8 #g2)
   )
   (:action s1208_plan-holding-motion
          :parameters (#q6 #q1 o8 #g3)
          :precondition (and (isconf #q6) (isconf #q1) (isgrasp o8 #g3))
          :effect (isholdingmotion #q6 #t1192 #q1 o8 #g3)
   )
   (:action s1209_plan-holding-motion
          :parameters (#q6 #q1 o9 #g4)
          :precondition (and (isconf #q6) (isconf #q1) (isgrasp o9 #g4))
          :effect (isholdingmotion #q6 #t1193 #q1 o9 #g4)
   )
   (:action s1210_plan-holding-motion
          :parameters (#q6 #q1 o9 #g5)
          :precondition (and (isconf #q6) (isconf #q1) (isgrasp o9 #g5))
          :effect (isholdingmotion #q6 #t1194 #q1 o9 #g5)
   )
   (:action s1211_plan-holding-motion
          :parameters (#q6 #q2 o8 #g0)
          :precondition (and (isconf #q6) (isconf #q2) (isgrasp o8 #g0))
          :effect (isholdingmotion #q6 #t1195 #q2 o8 #g0)
   )
   (:action s1212_plan-holding-motion
          :parameters (#q6 #q2 o9 #g1)
          :precondition (and (isconf #q6) (isconf #q2) (isgrasp o9 #g1))
          :effect (isholdingmotion #q6 #t1196 #q2 o9 #g1)
   )
   (:action s1213_plan-holding-motion
          :parameters (#q6 #q2 o8 #g2)
          :precondition (and (isconf #q6) (isconf #q2) (isgrasp o8 #g2))
          :effect (isholdingmotion #q6 #t1197 #q2 o8 #g2)
   )
   (:action s1214_plan-holding-motion
          :parameters (#q6 #q2 o8 #g3)
          :precondition (and (isconf #q6) (isconf #q2) (isgrasp o8 #g3))
          :effect (isholdingmotion #q6 #t1198 #q2 o8 #g3)
   )
   (:action s1215_plan-holding-motion
          :parameters (#q6 #q2 o9 #g4)
          :precondition (and (isconf #q6) (isconf #q2) (isgrasp o9 #g4))
          :effect (isholdingmotion #q6 #t1199 #q2 o9 #g4)
   )
   (:action s1216_plan-holding-motion
          :parameters (#q6 #q2 o9 #g5)
          :precondition (and (isconf #q6) (isconf #q2) (isgrasp o9 #g5))
          :effect (isholdingmotion #q6 #t1200 #q2 o9 #g5)
   )
   (:action s1217_plan-holding-motion
          :parameters (#q6 #q3 o8 #g0)
          :precondition (and (isconf #q6) (isconf #q3) (isgrasp o8 #g0))
          :effect (isholdingmotion #q6 #t1201 #q3 o8 #g0)
   )
   (:action s1218_plan-holding-motion
          :parameters (#q6 #q3 o9 #g1)
          :precondition (and (isconf #q6) (isconf #q3) (isgrasp o9 #g1))
          :effect (isholdingmotion #q6 #t1202 #q3 o9 #g1)
   )
   (:action s1219_plan-holding-motion
          :parameters (#q6 #q3 o8 #g2)
          :precondition (and (isconf #q6) (isconf #q3) (isgrasp o8 #g2))
          :effect (isholdingmotion #q6 #t1203 #q3 o8 #g2)
   )
   (:action s1220_plan-holding-motion
          :parameters (#q6 #q3 o8 #g3)
          :precondition (and (isconf #q6) (isconf #q3) (isgrasp o8 #g3))
          :effect (isholdingmotion #q6 #t1204 #q3 o8 #g3)
   )
   (:action s1221_plan-holding-motion
          :parameters (#q6 #q3 o9 #g4)
          :precondition (and (isconf #q6) (isconf #q3) (isgrasp o9 #g4))
          :effect (isholdingmotion #q6 #t1205 #q3 o9 #g4)
   )
   (:action s1222_plan-holding-motion
          :parameters (#q6 #q3 o9 #g5)
          :precondition (and (isconf #q6) (isconf #q3) (isgrasp o9 #g5))
          :effect (isholdingmotion #q6 #t1206 #q3 o9 #g5)
   )
   (:action s1223_plan-holding-motion
          :parameters (#q6 #q4 o8 #g0)
          :precondition (and (isconf #q6) (isconf #q4) (isgrasp o8 #g0))
          :effect (isholdingmotion #q6 #t1207 #q4 o8 #g0)
   )
   (:action s1224_plan-holding-motion
          :parameters (#q6 #q4 o9 #g1)
          :precondition (and (isconf #q6) (isconf #q4) (isgrasp o9 #g1))
          :effect (isholdingmotion #q6 #t1208 #q4 o9 #g1)
   )
   (:action s1225_plan-holding-motion
          :parameters (#q6 #q4 o8 #g2)
          :precondition (and (isconf #q6) (isconf #q4) (isgrasp o8 #g2))
          :effect (isholdingmotion #q6 #t1209 #q4 o8 #g2)
   )
   (:action s1226_plan-holding-motion
          :parameters (#q6 #q4 o8 #g3)
          :precondition (and (isconf #q6) (isconf #q4) (isgrasp o8 #g3))
          :effect (isholdingmotion #q6 #t1210 #q4 o8 #g3)
   )
   (:action s1227_plan-holding-motion
          :parameters (#q6 #q4 o9 #g4)
          :precondition (and (isconf #q6) (isconf #q4) (isgrasp o9 #g4))
          :effect (isholdingmotion #q6 #t1211 #q4 o9 #g4)
   )
   (:action s1228_plan-holding-motion
          :parameters (#q6 #q4 o9 #g5)
          :precondition (and (isconf #q6) (isconf #q4) (isgrasp o9 #g5))
          :effect (isholdingmotion #q6 #t1212 #q4 o9 #g5)
   )
   (:action s1229_plan-holding-motion
          :parameters (#q6 #q5 o8 #g0)
          :precondition (and (isconf #q6) (isconf #q5) (isgrasp o8 #g0))
          :effect (isholdingmotion #q6 #t1213 #q5 o8 #g0)
   )
   (:action s1230_plan-holding-motion
          :parameters (#q6 #q5 o9 #g1)
          :precondition (and (isconf #q6) (isconf #q5) (isgrasp o9 #g1))
          :effect (isholdingmotion #q6 #t1214 #q5 o9 #g1)
   )
   (:action s1231_plan-holding-motion
          :parameters (#q6 #q5 o8 #g2)
          :precondition (and (isconf #q6) (isconf #q5) (isgrasp o8 #g2))
          :effect (isholdingmotion #q6 #t1215 #q5 o8 #g2)
   )
   (:action s1232_plan-holding-motion
          :parameters (#q6 #q5 o8 #g3)
          :precondition (and (isconf #q6) (isconf #q5) (isgrasp o8 #g3))
          :effect (isholdingmotion #q6 #t1216 #q5 o8 #g3)
   )
   (:action s1233_plan-holding-motion
          :parameters (#q6 #q5 o9 #g4)
          :precondition (and (isconf #q6) (isconf #q5) (isgrasp o9 #g4))
          :effect (isholdingmotion #q6 #t1217 #q5 o9 #g4)
   )
   (:action s1234_plan-holding-motion
          :parameters (#q6 #q5 o9 #g5)
          :precondition (and (isconf #q6) (isconf #q5) (isgrasp o9 #g5))
          :effect (isholdingmotion #q6 #t1218 #q5 o9 #g5)
   )
   (:action s1235_plan-holding-motion
          :parameters (#q6 #q6 o8 #g0)
          :precondition (and (isconf #q6) (isconf #q6) (isgrasp o8 #g0))
          :effect (isholdingmotion #q6 #t1219 #q6 o8 #g0)
   )
   (:action s1236_plan-holding-motion
          :parameters (#q6 #q6 o9 #g1)
          :precondition (and (isconf #q6) (isconf #q6) (isgrasp o9 #g1))
          :effect (isholdingmotion #q6 #t1220 #q6 o9 #g1)
   )
   (:action s1237_plan-holding-motion
          :parameters (#q6 #q6 o8 #g2)
          :precondition (and (isconf #q6) (isconf #q6) (isgrasp o8 #g2))
          :effect (isholdingmotion #q6 #t1221 #q6 o8 #g2)
   )
   (:action s1238_plan-holding-motion
          :parameters (#q6 #q6 o8 #g3)
          :precondition (and (isconf #q6) (isconf #q6) (isgrasp o8 #g3))
          :effect (isholdingmotion #q6 #t1222 #q6 o8 #g3)
   )
   (:action s1239_plan-holding-motion
          :parameters (#q6 #q6 o9 #g4)
          :precondition (and (isconf #q6) (isconf #q6) (isgrasp o9 #g4))
          :effect (isholdingmotion #q6 #t1223 #q6 o9 #g4)
   )
   (:action s1240_plan-holding-motion
          :parameters (#q6 #q6 o9 #g5)
          :precondition (and (isconf #q6) (isconf #q6) (isgrasp o9 #g5))
          :effect (isholdingmotion #q6 #t1224 #q6 o9 #g5)
   )
   (:action s1241_plan-holding-motion
          :parameters (#q6 #q7 o8 #g0)
          :precondition (and (isconf #q6) (isconf #q7) (isgrasp o8 #g0))
          :effect (isholdingmotion #q6 #t1225 #q7 o8 #g0)
   )
   (:action s1242_plan-holding-motion
          :parameters (#q6 #q7 o9 #g1)
          :precondition (and (isconf #q6) (isconf #q7) (isgrasp o9 #g1))
          :effect (isholdingmotion #q6 #t1226 #q7 o9 #g1)
   )
   (:action s1243_plan-holding-motion
          :parameters (#q6 #q7 o8 #g2)
          :precondition (and (isconf #q6) (isconf #q7) (isgrasp o8 #g2))
          :effect (isholdingmotion #q6 #t1227 #q7 o8 #g2)
   )
   (:action s1244_plan-holding-motion
          :parameters (#q6 #q7 o8 #g3)
          :precondition (and (isconf #q6) (isconf #q7) (isgrasp o8 #g3))
          :effect (isholdingmotion #q6 #t1228 #q7 o8 #g3)
   )
   (:action s1245_plan-holding-motion
          :parameters (#q6 #q7 o9 #g4)
          :precondition (and (isconf #q6) (isconf #q7) (isgrasp o9 #g4))
          :effect (isholdingmotion #q6 #t1229 #q7 o9 #g4)
   )
   (:action s1246_plan-holding-motion
          :parameters (#q6 #q7 o9 #g5)
          :precondition (and (isconf #q6) (isconf #q7) (isgrasp o9 #g5))
          :effect (isholdingmotion #q6 #t1230 #q7 o9 #g5)
   )
   (:action s1247_plan-holding-motion
          :parameters (#q6 #q8 o8 #g0)
          :precondition (and (isconf #q6) (isconf #q8) (isgrasp o8 #g0))
          :effect (isholdingmotion #q6 #t1231 #q8 o8 #g0)
   )
   (:action s1248_plan-holding-motion
          :parameters (#q6 #q8 o9 #g1)
          :precondition (and (isconf #q6) (isconf #q8) (isgrasp o9 #g1))
          :effect (isholdingmotion #q6 #t1232 #q8 o9 #g1)
   )
   (:action s1249_plan-holding-motion
          :parameters (#q6 #q8 o8 #g2)
          :precondition (and (isconf #q6) (isconf #q8) (isgrasp o8 #g2))
          :effect (isholdingmotion #q6 #t1233 #q8 o8 #g2)
   )
   (:action s1250_plan-holding-motion
          :parameters (#q6 #q8 o8 #g3)
          :precondition (and (isconf #q6) (isconf #q8) (isgrasp o8 #g3))
          :effect (isholdingmotion #q6 #t1234 #q8 o8 #g3)
   )
   (:action s1251_plan-holding-motion
          :parameters (#q6 #q8 o9 #g4)
          :precondition (and (isconf #q6) (isconf #q8) (isgrasp o9 #g4))
          :effect (isholdingmotion #q6 #t1235 #q8 o9 #g4)
   )
   (:action s1252_plan-holding-motion
          :parameters (#q6 #q8 o9 #g5)
          :precondition (and (isconf #q6) (isconf #q8) (isgrasp o9 #g5))
          :effect (isholdingmotion #q6 #t1236 #q8 o9 #g5)
   )
   (:action s1253_plan-holding-motion
          :parameters (#q6 #q9 o8 #g0)
          :precondition (and (isconf #q6) (isconf #q9) (isgrasp o8 #g0))
          :effect (isholdingmotion #q6 #t1237 #q9 o8 #g0)
   )
   (:action s1254_plan-holding-motion
          :parameters (#q6 #q9 o9 #g1)
          :precondition (and (isconf #q6) (isconf #q9) (isgrasp o9 #g1))
          :effect (isholdingmotion #q6 #t1238 #q9 o9 #g1)
   )
   (:action s1255_plan-holding-motion
          :parameters (#q6 #q9 o8 #g2)
          :precondition (and (isconf #q6) (isconf #q9) (isgrasp o8 #g2))
          :effect (isholdingmotion #q6 #t1239 #q9 o8 #g2)
   )
   (:action s1256_plan-holding-motion
          :parameters (#q6 #q9 o8 #g3)
          :precondition (and (isconf #q6) (isconf #q9) (isgrasp o8 #g3))
          :effect (isholdingmotion #q6 #t1240 #q9 o8 #g3)
   )
   (:action s1257_plan-holding-motion
          :parameters (#q6 #q9 o9 #g4)
          :precondition (and (isconf #q6) (isconf #q9) (isgrasp o9 #g4))
          :effect (isholdingmotion #q6 #t1241 #q9 o9 #g4)
   )
   (:action s1258_plan-holding-motion
          :parameters (#q6 #q9 o9 #g5)
          :precondition (and (isconf #q6) (isconf #q9) (isgrasp o9 #g5))
          :effect (isholdingmotion #q6 #t1242 #q9 o9 #g5)
   )
   (:action s1259_plan-holding-motion
          :parameters (#q6 #q10 o8 #g0)
          :precondition (and (isconf #q6) (isconf #q10) (isgrasp o8 #g0))
          :effect (isholdingmotion #q6 #t1243 #q10 o8 #g0)
   )
   (:action s1260_plan-holding-motion
          :parameters (#q6 #q10 o9 #g1)
          :precondition (and (isconf #q6) (isconf #q10) (isgrasp o9 #g1))
          :effect (isholdingmotion #q6 #t1244 #q10 o9 #g1)
   )
   (:action s1261_plan-holding-motion
          :parameters (#q6 #q10 o8 #g2)
          :precondition (and (isconf #q6) (isconf #q10) (isgrasp o8 #g2))
          :effect (isholdingmotion #q6 #t1245 #q10 o8 #g2)
   )
   (:action s1262_plan-holding-motion
          :parameters (#q6 #q10 o8 #g3)
          :precondition (and (isconf #q6) (isconf #q10) (isgrasp o8 #g3))
          :effect (isholdingmotion #q6 #t1246 #q10 o8 #g3)
   )
   (:action s1263_plan-holding-motion
          :parameters (#q6 #q10 o9 #g4)
          :precondition (and (isconf #q6) (isconf #q10) (isgrasp o9 #g4))
          :effect (isholdingmotion #q6 #t1247 #q10 o9 #g4)
   )
   (:action s1264_plan-holding-motion
          :parameters (#q6 #q10 o9 #g5)
          :precondition (and (isconf #q6) (isconf #q10) (isgrasp o9 #g5))
          :effect (isholdingmotion #q6 #t1248 #q10 o9 #g5)
   )
   (:action s1265_plan-holding-motion
          :parameters (#q6 #q11 o8 #g0)
          :precondition (and (isconf #q6) (isconf #q11) (isgrasp o8 #g0))
          :effect (isholdingmotion #q6 #t1249 #q11 o8 #g0)
   )
   (:action s1266_plan-holding-motion
          :parameters (#q6 #q11 o9 #g1)
          :precondition (and (isconf #q6) (isconf #q11) (isgrasp o9 #g1))
          :effect (isholdingmotion #q6 #t1250 #q11 o9 #g1)
   )
   (:action s1267_plan-holding-motion
          :parameters (#q6 #q11 o8 #g2)
          :precondition (and (isconf #q6) (isconf #q11) (isgrasp o8 #g2))
          :effect (isholdingmotion #q6 #t1251 #q11 o8 #g2)
   )
   (:action s1268_plan-holding-motion
          :parameters (#q6 #q11 o8 #g3)
          :precondition (and (isconf #q6) (isconf #q11) (isgrasp o8 #g3))
          :effect (isholdingmotion #q6 #t1252 #q11 o8 #g3)
   )
   (:action s1269_plan-holding-motion
          :parameters (#q6 #q11 o9 #g4)
          :precondition (and (isconf #q6) (isconf #q11) (isgrasp o9 #g4))
          :effect (isholdingmotion #q6 #t1253 #q11 o9 #g4)
   )
   (:action s1270_plan-holding-motion
          :parameters (#q6 #q11 o9 #g5)
          :precondition (and (isconf #q6) (isconf #q11) (isgrasp o9 #g5))
          :effect (isholdingmotion #q6 #t1254 #q11 o9 #g5)
   )
   (:action s1271_plan-holding-motion
          :parameters (#q6 #q12 o8 #g0)
          :precondition (and (isconf #q6) (isconf #q12) (isgrasp o8 #g0))
          :effect (isholdingmotion #q6 #t1255 #q12 o8 #g0)
   )
   (:action s1272_plan-holding-motion
          :parameters (#q6 #q12 o9 #g1)
          :precondition (and (isconf #q6) (isconf #q12) (isgrasp o9 #g1))
          :effect (isholdingmotion #q6 #t1256 #q12 o9 #g1)
   )
   (:action s1273_plan-holding-motion
          :parameters (#q6 #q12 o8 #g2)
          :precondition (and (isconf #q6) (isconf #q12) (isgrasp o8 #g2))
          :effect (isholdingmotion #q6 #t1257 #q12 o8 #g2)
   )
   (:action s1274_plan-holding-motion
          :parameters (#q6 #q12 o8 #g3)
          :precondition (and (isconf #q6) (isconf #q12) (isgrasp o8 #g3))
          :effect (isholdingmotion #q6 #t1258 #q12 o8 #g3)
   )
   (:action s1275_plan-holding-motion
          :parameters (#q6 #q12 o9 #g4)
          :precondition (and (isconf #q6) (isconf #q12) (isgrasp o9 #g4))
          :effect (isholdingmotion #q6 #t1259 #q12 o9 #g4)
   )
   (:action s1276_plan-holding-motion
          :parameters (#q6 #q12 o9 #g5)
          :precondition (and (isconf #q6) (isconf #q12) (isgrasp o9 #g5))
          :effect (isholdingmotion #q6 #t1260 #q12 o9 #g5)
   )
   (:action s1277_plan-holding-motion
          :parameters (#q6 #q13 o8 #g0)
          :precondition (and (isconf #q6) (isconf #q13) (isgrasp o8 #g0))
          :effect (isholdingmotion #q6 #t1261 #q13 o8 #g0)
   )
   (:action s1278_plan-holding-motion
          :parameters (#q6 #q13 o9 #g1)
          :precondition (and (isconf #q6) (isconf #q13) (isgrasp o9 #g1))
          :effect (isholdingmotion #q6 #t1262 #q13 o9 #g1)
   )
   (:action s1279_plan-holding-motion
          :parameters (#q6 #q13 o8 #g2)
          :precondition (and (isconf #q6) (isconf #q13) (isgrasp o8 #g2))
          :effect (isholdingmotion #q6 #t1263 #q13 o8 #g2)
   )
   (:action s1280_plan-holding-motion
          :parameters (#q6 #q13 o8 #g3)
          :precondition (and (isconf #q6) (isconf #q13) (isgrasp o8 #g3))
          :effect (isholdingmotion #q6 #t1264 #q13 o8 #g3)
   )
   (:action s1281_plan-holding-motion
          :parameters (#q6 #q13 o9 #g4)
          :precondition (and (isconf #q6) (isconf #q13) (isgrasp o9 #g4))
          :effect (isholdingmotion #q6 #t1265 #q13 o9 #g4)
   )
   (:action s1282_plan-holding-motion
          :parameters (#q6 #q13 o9 #g5)
          :precondition (and (isconf #q6) (isconf #q13) (isgrasp o9 #g5))
          :effect (isholdingmotion #q6 #t1266 #q13 o9 #g5)
   )
   (:action s1283_plan-holding-motion
          :parameters (#q6 #q14 o8 #g0)
          :precondition (and (isconf #q6) (isconf #q14) (isgrasp o8 #g0))
          :effect (isholdingmotion #q6 #t1267 #q14 o8 #g0)
   )
   (:action s1284_plan-holding-motion
          :parameters (#q6 #q14 o9 #g1)
          :precondition (and (isconf #q6) (isconf #q14) (isgrasp o9 #g1))
          :effect (isholdingmotion #q6 #t1268 #q14 o9 #g1)
   )
   (:action s1285_plan-holding-motion
          :parameters (#q6 #q14 o8 #g2)
          :precondition (and (isconf #q6) (isconf #q14) (isgrasp o8 #g2))
          :effect (isholdingmotion #q6 #t1269 #q14 o8 #g2)
   )
   (:action s1286_plan-holding-motion
          :parameters (#q6 #q14 o8 #g3)
          :precondition (and (isconf #q6) (isconf #q14) (isgrasp o8 #g3))
          :effect (isholdingmotion #q6 #t1270 #q14 o8 #g3)
   )
   (:action s1287_plan-holding-motion
          :parameters (#q6 #q14 o9 #g4)
          :precondition (and (isconf #q6) (isconf #q14) (isgrasp o9 #g4))
          :effect (isholdingmotion #q6 #t1271 #q14 o9 #g4)
   )
   (:action s1288_plan-holding-motion
          :parameters (#q6 #q14 o9 #g5)
          :precondition (and (isconf #q6) (isconf #q14) (isgrasp o9 #g5))
          :effect (isholdingmotion #q6 #t1272 #q14 o9 #g5)
   )
   (:action s1289_plan-holding-motion
          :parameters (#q6 #q15 o8 #g0)
          :precondition (and (isconf #q6) (isconf #q15) (isgrasp o8 #g0))
          :effect (isholdingmotion #q6 #t1273 #q15 o8 #g0)
   )
   (:action s1290_plan-holding-motion
          :parameters (#q6 #q15 o9 #g1)
          :precondition (and (isconf #q6) (isconf #q15) (isgrasp o9 #g1))
          :effect (isholdingmotion #q6 #t1274 #q15 o9 #g1)
   )
   (:action s1291_plan-holding-motion
          :parameters (#q6 #q15 o8 #g2)
          :precondition (and (isconf #q6) (isconf #q15) (isgrasp o8 #g2))
          :effect (isholdingmotion #q6 #t1275 #q15 o8 #g2)
   )
   (:action s1292_plan-holding-motion
          :parameters (#q6 #q15 o8 #g3)
          :precondition (and (isconf #q6) (isconf #q15) (isgrasp o8 #g3))
          :effect (isholdingmotion #q6 #t1276 #q15 o8 #g3)
   )
   (:action s1293_plan-holding-motion
          :parameters (#q6 #q15 o9 #g4)
          :precondition (and (isconf #q6) (isconf #q15) (isgrasp o9 #g4))
          :effect (isholdingmotion #q6 #t1277 #q15 o9 #g4)
   )
   (:action s1294_plan-holding-motion
          :parameters (#q6 #q15 o9 #g5)
          :precondition (and (isconf #q6) (isconf #q15) (isgrasp o9 #g5))
          :effect (isholdingmotion #q6 #t1278 #q15 o9 #g5)
   )
   (:action s1295_plan-holding-motion
          :parameters (#q6 #q16 o8 #g0)
          :precondition (and (isconf #q6) (isconf #q16) (isgrasp o8 #g0))
          :effect (isholdingmotion #q6 #t1279 #q16 o8 #g0)
   )
   (:action s1296_plan-holding-motion
          :parameters (#q6 #q16 o9 #g1)
          :precondition (and (isconf #q6) (isconf #q16) (isgrasp o9 #g1))
          :effect (isholdingmotion #q6 #t1280 #q16 o9 #g1)
   )
   (:action s1297_plan-holding-motion
          :parameters (#q6 #q16 o8 #g2)
          :precondition (and (isconf #q6) (isconf #q16) (isgrasp o8 #g2))
          :effect (isholdingmotion #q6 #t1281 #q16 o8 #g2)
   )
   (:action s1298_plan-holding-motion
          :parameters (#q6 #q16 o8 #g3)
          :precondition (and (isconf #q6) (isconf #q16) (isgrasp o8 #g3))
          :effect (isholdingmotion #q6 #t1282 #q16 o8 #g3)
   )
   (:action s1299_plan-holding-motion
          :parameters (#q6 #q16 o9 #g4)
          :precondition (and (isconf #q6) (isconf #q16) (isgrasp o9 #g4))
          :effect (isholdingmotion #q6 #t1283 #q16 o9 #g4)
   )
   (:action s1300_plan-holding-motion
          :parameters (#q6 #q16 o9 #g5)
          :precondition (and (isconf #q6) (isconf #q16) (isgrasp o9 #g5))
          :effect (isholdingmotion #q6 #t1284 #q16 o9 #g5)
   )
   (:action s1301_plan-holding-motion
          :parameters (#q6 #q17 o8 #g0)
          :precondition (and (isconf #q6) (isconf #q17) (isgrasp o8 #g0))
          :effect (isholdingmotion #q6 #t1285 #q17 o8 #g0)
   )
   (:action s1302_plan-holding-motion
          :parameters (#q6 #q17 o9 #g1)
          :precondition (and (isconf #q6) (isconf #q17) (isgrasp o9 #g1))
          :effect (isholdingmotion #q6 #t1286 #q17 o9 #g1)
   )
   (:action s1303_plan-holding-motion
          :parameters (#q6 #q17 o8 #g2)
          :precondition (and (isconf #q6) (isconf #q17) (isgrasp o8 #g2))
          :effect (isholdingmotion #q6 #t1287 #q17 o8 #g2)
   )
   (:action s1304_plan-holding-motion
          :parameters (#q6 #q17 o8 #g3)
          :precondition (and (isconf #q6) (isconf #q17) (isgrasp o8 #g3))
          :effect (isholdingmotion #q6 #t1288 #q17 o8 #g3)
   )
   (:action s1305_plan-holding-motion
          :parameters (#q6 #q17 o9 #g4)
          :precondition (and (isconf #q6) (isconf #q17) (isgrasp o9 #g4))
          :effect (isholdingmotion #q6 #t1289 #q17 o9 #g4)
   )
   (:action s1306_plan-holding-motion
          :parameters (#q6 #q17 o9 #g5)
          :precondition (and (isconf #q6) (isconf #q17) (isgrasp o9 #g5))
          :effect (isholdingmotion #q6 #t1290 #q17 o9 #g5)
   )
   (:action s1307_plan-holding-motion
          :parameters (#q7 q808 o8 #g0)
          :precondition (and (isconf #q7) (isconf q808) (isgrasp o8 #g0))
          :effect (isholdingmotion #q7 #t1291 q808 o8 #g0)
   )
   (:action s1308_plan-holding-motion
          :parameters (#q7 q808 o9 #g1)
          :precondition (and (isconf #q7) (isconf q808) (isgrasp o9 #g1))
          :effect (isholdingmotion #q7 #t1292 q808 o9 #g1)
   )
   (:action s1309_plan-holding-motion
          :parameters (#q7 q808 o8 #g2)
          :precondition (and (isconf #q7) (isconf q808) (isgrasp o8 #g2))
          :effect (isholdingmotion #q7 #t1293 q808 o8 #g2)
   )
   (:action s1310_plan-holding-motion
          :parameters (#q7 q808 o8 #g3)
          :precondition (and (isconf #q7) (isconf q808) (isgrasp o8 #g3))
          :effect (isholdingmotion #q7 #t1294 q808 o8 #g3)
   )
   (:action s1311_plan-holding-motion
          :parameters (#q7 q808 o9 #g4)
          :precondition (and (isconf #q7) (isconf q808) (isgrasp o9 #g4))
          :effect (isholdingmotion #q7 #t1295 q808 o9 #g4)
   )
   (:action s1312_plan-holding-motion
          :parameters (#q7 q808 o9 #g5)
          :precondition (and (isconf #q7) (isconf q808) (isgrasp o9 #g5))
          :effect (isholdingmotion #q7 #t1296 q808 o9 #g5)
   )
   (:action s1313_plan-holding-motion
          :parameters (#q7 #q0 o8 #g0)
          :precondition (and (isconf #q7) (isconf #q0) (isgrasp o8 #g0))
          :effect (isholdingmotion #q7 #t1297 #q0 o8 #g0)
   )
   (:action s1314_plan-holding-motion
          :parameters (#q7 #q0 o9 #g1)
          :precondition (and (isconf #q7) (isconf #q0) (isgrasp o9 #g1))
          :effect (isholdingmotion #q7 #t1298 #q0 o9 #g1)
   )
   (:action s1315_plan-holding-motion
          :parameters (#q7 #q0 o8 #g2)
          :precondition (and (isconf #q7) (isconf #q0) (isgrasp o8 #g2))
          :effect (isholdingmotion #q7 #t1299 #q0 o8 #g2)
   )
   (:action s1316_plan-holding-motion
          :parameters (#q7 #q0 o8 #g3)
          :precondition (and (isconf #q7) (isconf #q0) (isgrasp o8 #g3))
          :effect (isholdingmotion #q7 #t1300 #q0 o8 #g3)
   )
   (:action s1317_plan-holding-motion
          :parameters (#q7 #q0 o9 #g4)
          :precondition (and (isconf #q7) (isconf #q0) (isgrasp o9 #g4))
          :effect (isholdingmotion #q7 #t1301 #q0 o9 #g4)
   )
   (:action s1318_plan-holding-motion
          :parameters (#q7 #q0 o9 #g5)
          :precondition (and (isconf #q7) (isconf #q0) (isgrasp o9 #g5))
          :effect (isholdingmotion #q7 #t1302 #q0 o9 #g5)
   )
   (:action s1319_plan-holding-motion
          :parameters (#q7 #q1 o8 #g0)
          :precondition (and (isconf #q7) (isconf #q1) (isgrasp o8 #g0))
          :effect (isholdingmotion #q7 #t1303 #q1 o8 #g0)
   )
   (:action s1320_plan-holding-motion
          :parameters (#q7 #q1 o9 #g1)
          :precondition (and (isconf #q7) (isconf #q1) (isgrasp o9 #g1))
          :effect (isholdingmotion #q7 #t1304 #q1 o9 #g1)
   )
   (:action s1321_plan-holding-motion
          :parameters (#q7 #q1 o8 #g2)
          :precondition (and (isconf #q7) (isconf #q1) (isgrasp o8 #g2))
          :effect (isholdingmotion #q7 #t1305 #q1 o8 #g2)
   )
   (:action s1322_plan-holding-motion
          :parameters (#q7 #q1 o8 #g3)
          :precondition (and (isconf #q7) (isconf #q1) (isgrasp o8 #g3))
          :effect (isholdingmotion #q7 #t1306 #q1 o8 #g3)
   )
   (:action s1323_plan-holding-motion
          :parameters (#q7 #q1 o9 #g4)
          :precondition (and (isconf #q7) (isconf #q1) (isgrasp o9 #g4))
          :effect (isholdingmotion #q7 #t1307 #q1 o9 #g4)
   )
   (:action s1324_plan-holding-motion
          :parameters (#q7 #q1 o9 #g5)
          :precondition (and (isconf #q7) (isconf #q1) (isgrasp o9 #g5))
          :effect (isholdingmotion #q7 #t1308 #q1 o9 #g5)
   )
   (:action s1325_plan-holding-motion
          :parameters (#q7 #q2 o8 #g0)
          :precondition (and (isconf #q7) (isconf #q2) (isgrasp o8 #g0))
          :effect (isholdingmotion #q7 #t1309 #q2 o8 #g0)
   )
   (:action s1326_plan-holding-motion
          :parameters (#q7 #q2 o9 #g1)
          :precondition (and (isconf #q7) (isconf #q2) (isgrasp o9 #g1))
          :effect (isholdingmotion #q7 #t1310 #q2 o9 #g1)
   )
   (:action s1327_plan-holding-motion
          :parameters (#q7 #q2 o8 #g2)
          :precondition (and (isconf #q7) (isconf #q2) (isgrasp o8 #g2))
          :effect (isholdingmotion #q7 #t1311 #q2 o8 #g2)
   )
   (:action s1328_plan-holding-motion
          :parameters (#q7 #q2 o8 #g3)
          :precondition (and (isconf #q7) (isconf #q2) (isgrasp o8 #g3))
          :effect (isholdingmotion #q7 #t1312 #q2 o8 #g3)
   )
   (:action s1329_plan-holding-motion
          :parameters (#q7 #q2 o9 #g4)
          :precondition (and (isconf #q7) (isconf #q2) (isgrasp o9 #g4))
          :effect (isholdingmotion #q7 #t1313 #q2 o9 #g4)
   )
   (:action s1330_plan-holding-motion
          :parameters (#q7 #q2 o9 #g5)
          :precondition (and (isconf #q7) (isconf #q2) (isgrasp o9 #g5))
          :effect (isholdingmotion #q7 #t1314 #q2 o9 #g5)
   )
   (:action s1331_plan-holding-motion
          :parameters (#q7 #q3 o8 #g0)
          :precondition (and (isconf #q7) (isconf #q3) (isgrasp o8 #g0))
          :effect (isholdingmotion #q7 #t1315 #q3 o8 #g0)
   )
   (:action s1332_plan-holding-motion
          :parameters (#q7 #q3 o9 #g1)
          :precondition (and (isconf #q7) (isconf #q3) (isgrasp o9 #g1))
          :effect (isholdingmotion #q7 #t1316 #q3 o9 #g1)
   )
   (:action s1333_plan-holding-motion
          :parameters (#q7 #q3 o8 #g2)
          :precondition (and (isconf #q7) (isconf #q3) (isgrasp o8 #g2))
          :effect (isholdingmotion #q7 #t1317 #q3 o8 #g2)
   )
   (:action s1334_plan-holding-motion
          :parameters (#q7 #q3 o8 #g3)
          :precondition (and (isconf #q7) (isconf #q3) (isgrasp o8 #g3))
          :effect (isholdingmotion #q7 #t1318 #q3 o8 #g3)
   )
   (:action s1335_plan-holding-motion
          :parameters (#q7 #q3 o9 #g4)
          :precondition (and (isconf #q7) (isconf #q3) (isgrasp o9 #g4))
          :effect (isholdingmotion #q7 #t1319 #q3 o9 #g4)
   )
   (:action s1336_plan-holding-motion
          :parameters (#q7 #q3 o9 #g5)
          :precondition (and (isconf #q7) (isconf #q3) (isgrasp o9 #g5))
          :effect (isholdingmotion #q7 #t1320 #q3 o9 #g5)
   )
   (:action s1337_plan-holding-motion
          :parameters (#q7 #q4 o8 #g0)
          :precondition (and (isconf #q7) (isconf #q4) (isgrasp o8 #g0))
          :effect (isholdingmotion #q7 #t1321 #q4 o8 #g0)
   )
   (:action s1338_plan-holding-motion
          :parameters (#q7 #q4 o9 #g1)
          :precondition (and (isconf #q7) (isconf #q4) (isgrasp o9 #g1))
          :effect (isholdingmotion #q7 #t1322 #q4 o9 #g1)
   )
   (:action s1339_plan-holding-motion
          :parameters (#q7 #q4 o8 #g2)
          :precondition (and (isconf #q7) (isconf #q4) (isgrasp o8 #g2))
          :effect (isholdingmotion #q7 #t1323 #q4 o8 #g2)
   )
   (:action s1340_plan-holding-motion
          :parameters (#q7 #q4 o8 #g3)
          :precondition (and (isconf #q7) (isconf #q4) (isgrasp o8 #g3))
          :effect (isholdingmotion #q7 #t1324 #q4 o8 #g3)
   )
   (:action s1341_plan-holding-motion
          :parameters (#q7 #q4 o9 #g4)
          :precondition (and (isconf #q7) (isconf #q4) (isgrasp o9 #g4))
          :effect (isholdingmotion #q7 #t1325 #q4 o9 #g4)
   )
   (:action s1342_plan-holding-motion
          :parameters (#q7 #q4 o9 #g5)
          :precondition (and (isconf #q7) (isconf #q4) (isgrasp o9 #g5))
          :effect (isholdingmotion #q7 #t1326 #q4 o9 #g5)
   )
   (:action s1343_plan-holding-motion
          :parameters (#q7 #q5 o8 #g0)
          :precondition (and (isconf #q7) (isconf #q5) (isgrasp o8 #g0))
          :effect (isholdingmotion #q7 #t1327 #q5 o8 #g0)
   )
   (:action s1344_plan-holding-motion
          :parameters (#q7 #q5 o9 #g1)
          :precondition (and (isconf #q7) (isconf #q5) (isgrasp o9 #g1))
          :effect (isholdingmotion #q7 #t1328 #q5 o9 #g1)
   )
   (:action s1345_plan-holding-motion
          :parameters (#q7 #q5 o8 #g2)
          :precondition (and (isconf #q7) (isconf #q5) (isgrasp o8 #g2))
          :effect (isholdingmotion #q7 #t1329 #q5 o8 #g2)
   )
   (:action s1346_plan-holding-motion
          :parameters (#q7 #q5 o8 #g3)
          :precondition (and (isconf #q7) (isconf #q5) (isgrasp o8 #g3))
          :effect (isholdingmotion #q7 #t1330 #q5 o8 #g3)
   )
   (:action s1347_plan-holding-motion
          :parameters (#q7 #q5 o9 #g4)
          :precondition (and (isconf #q7) (isconf #q5) (isgrasp o9 #g4))
          :effect (isholdingmotion #q7 #t1331 #q5 o9 #g4)
   )
   (:action s1348_plan-holding-motion
          :parameters (#q7 #q5 o9 #g5)
          :precondition (and (isconf #q7) (isconf #q5) (isgrasp o9 #g5))
          :effect (isholdingmotion #q7 #t1332 #q5 o9 #g5)
   )
   (:action s1349_plan-holding-motion
          :parameters (#q7 #q6 o8 #g0)
          :precondition (and (isconf #q7) (isconf #q6) (isgrasp o8 #g0))
          :effect (isholdingmotion #q7 #t1333 #q6 o8 #g0)
   )
   (:action s1350_plan-holding-motion
          :parameters (#q7 #q6 o9 #g1)
          :precondition (and (isconf #q7) (isconf #q6) (isgrasp o9 #g1))
          :effect (isholdingmotion #q7 #t1334 #q6 o9 #g1)
   )
   (:action s1351_plan-holding-motion
          :parameters (#q7 #q6 o8 #g2)
          :precondition (and (isconf #q7) (isconf #q6) (isgrasp o8 #g2))
          :effect (isholdingmotion #q7 #t1335 #q6 o8 #g2)
   )
   (:action s1352_plan-holding-motion
          :parameters (#q7 #q6 o8 #g3)
          :precondition (and (isconf #q7) (isconf #q6) (isgrasp o8 #g3))
          :effect (isholdingmotion #q7 #t1336 #q6 o8 #g3)
   )
   (:action s1353_plan-holding-motion
          :parameters (#q7 #q6 o9 #g4)
          :precondition (and (isconf #q7) (isconf #q6) (isgrasp o9 #g4))
          :effect (isholdingmotion #q7 #t1337 #q6 o9 #g4)
   )
   (:action s1354_plan-holding-motion
          :parameters (#q7 #q6 o9 #g5)
          :precondition (and (isconf #q7) (isconf #q6) (isgrasp o9 #g5))
          :effect (isholdingmotion #q7 #t1338 #q6 o9 #g5)
   )
   (:action s1355_plan-holding-motion
          :parameters (#q7 #q7 o8 #g0)
          :precondition (and (isconf #q7) (isconf #q7) (isgrasp o8 #g0))
          :effect (isholdingmotion #q7 #t1339 #q7 o8 #g0)
   )
   (:action s1356_plan-holding-motion
          :parameters (#q7 #q7 o9 #g1)
          :precondition (and (isconf #q7) (isconf #q7) (isgrasp o9 #g1))
          :effect (isholdingmotion #q7 #t1340 #q7 o9 #g1)
   )
   (:action s1357_plan-holding-motion
          :parameters (#q7 #q7 o8 #g2)
          :precondition (and (isconf #q7) (isconf #q7) (isgrasp o8 #g2))
          :effect (isholdingmotion #q7 #t1341 #q7 o8 #g2)
   )
   (:action s1358_plan-holding-motion
          :parameters (#q7 #q7 o8 #g3)
          :precondition (and (isconf #q7) (isconf #q7) (isgrasp o8 #g3))
          :effect (isholdingmotion #q7 #t1342 #q7 o8 #g3)
   )
   (:action s1359_plan-holding-motion
          :parameters (#q7 #q7 o9 #g4)
          :precondition (and (isconf #q7) (isconf #q7) (isgrasp o9 #g4))
          :effect (isholdingmotion #q7 #t1343 #q7 o9 #g4)
   )
   (:action s1360_plan-holding-motion
          :parameters (#q7 #q7 o9 #g5)
          :precondition (and (isconf #q7) (isconf #q7) (isgrasp o9 #g5))
          :effect (isholdingmotion #q7 #t1344 #q7 o9 #g5)
   )
   (:action s1361_plan-holding-motion
          :parameters (#q7 #q8 o8 #g0)
          :precondition (and (isconf #q7) (isconf #q8) (isgrasp o8 #g0))
          :effect (isholdingmotion #q7 #t1345 #q8 o8 #g0)
   )
   (:action s1362_plan-holding-motion
          :parameters (#q7 #q8 o9 #g1)
          :precondition (and (isconf #q7) (isconf #q8) (isgrasp o9 #g1))
          :effect (isholdingmotion #q7 #t1346 #q8 o9 #g1)
   )
   (:action s1363_plan-holding-motion
          :parameters (#q7 #q8 o8 #g2)
          :precondition (and (isconf #q7) (isconf #q8) (isgrasp o8 #g2))
          :effect (isholdingmotion #q7 #t1347 #q8 o8 #g2)
   )
   (:action s1364_plan-holding-motion
          :parameters (#q7 #q8 o8 #g3)
          :precondition (and (isconf #q7) (isconf #q8) (isgrasp o8 #g3))
          :effect (isholdingmotion #q7 #t1348 #q8 o8 #g3)
   )
   (:action s1365_plan-holding-motion
          :parameters (#q7 #q8 o9 #g4)
          :precondition (and (isconf #q7) (isconf #q8) (isgrasp o9 #g4))
          :effect (isholdingmotion #q7 #t1349 #q8 o9 #g4)
   )
   (:action s1366_plan-holding-motion
          :parameters (#q7 #q8 o9 #g5)
          :precondition (and (isconf #q7) (isconf #q8) (isgrasp o9 #g5))
          :effect (isholdingmotion #q7 #t1350 #q8 o9 #g5)
   )
   (:action s1367_plan-holding-motion
          :parameters (#q7 #q9 o8 #g0)
          :precondition (and (isconf #q7) (isconf #q9) (isgrasp o8 #g0))
          :effect (isholdingmotion #q7 #t1351 #q9 o8 #g0)
   )
   (:action s1368_plan-holding-motion
          :parameters (#q7 #q9 o9 #g1)
          :precondition (and (isconf #q7) (isconf #q9) (isgrasp o9 #g1))
          :effect (isholdingmotion #q7 #t1352 #q9 o9 #g1)
   )
   (:action s1369_plan-holding-motion
          :parameters (#q7 #q9 o8 #g2)
          :precondition (and (isconf #q7) (isconf #q9) (isgrasp o8 #g2))
          :effect (isholdingmotion #q7 #t1353 #q9 o8 #g2)
   )
   (:action s1370_plan-holding-motion
          :parameters (#q7 #q9 o8 #g3)
          :precondition (and (isconf #q7) (isconf #q9) (isgrasp o8 #g3))
          :effect (isholdingmotion #q7 #t1354 #q9 o8 #g3)
   )
   (:action s1371_plan-holding-motion
          :parameters (#q7 #q9 o9 #g4)
          :precondition (and (isconf #q7) (isconf #q9) (isgrasp o9 #g4))
          :effect (isholdingmotion #q7 #t1355 #q9 o9 #g4)
   )
   (:action s1372_plan-holding-motion
          :parameters (#q7 #q9 o9 #g5)
          :precondition (and (isconf #q7) (isconf #q9) (isgrasp o9 #g5))
          :effect (isholdingmotion #q7 #t1356 #q9 o9 #g5)
   )
   (:action s1373_plan-holding-motion
          :parameters (#q7 #q10 o8 #g0)
          :precondition (and (isconf #q7) (isconf #q10) (isgrasp o8 #g0))
          :effect (isholdingmotion #q7 #t1357 #q10 o8 #g0)
   )
   (:action s1374_plan-holding-motion
          :parameters (#q7 #q10 o9 #g1)
          :precondition (and (isconf #q7) (isconf #q10) (isgrasp o9 #g1))
          :effect (isholdingmotion #q7 #t1358 #q10 o9 #g1)
   )
   (:action s1375_plan-holding-motion
          :parameters (#q7 #q10 o8 #g2)
          :precondition (and (isconf #q7) (isconf #q10) (isgrasp o8 #g2))
          :effect (isholdingmotion #q7 #t1359 #q10 o8 #g2)
   )
   (:action s1376_plan-holding-motion
          :parameters (#q7 #q10 o8 #g3)
          :precondition (and (isconf #q7) (isconf #q10) (isgrasp o8 #g3))
          :effect (isholdingmotion #q7 #t1360 #q10 o8 #g3)
   )
   (:action s1377_plan-holding-motion
          :parameters (#q7 #q10 o9 #g4)
          :precondition (and (isconf #q7) (isconf #q10) (isgrasp o9 #g4))
          :effect (isholdingmotion #q7 #t1361 #q10 o9 #g4)
   )
   (:action s1378_plan-holding-motion
          :parameters (#q7 #q10 o9 #g5)
          :precondition (and (isconf #q7) (isconf #q10) (isgrasp o9 #g5))
          :effect (isholdingmotion #q7 #t1362 #q10 o9 #g5)
   )
   (:action s1379_plan-holding-motion
          :parameters (#q7 #q11 o8 #g0)
          :precondition (and (isconf #q7) (isconf #q11) (isgrasp o8 #g0))
          :effect (isholdingmotion #q7 #t1363 #q11 o8 #g0)
   )
   (:action s1380_plan-holding-motion
          :parameters (#q7 #q11 o9 #g1)
          :precondition (and (isconf #q7) (isconf #q11) (isgrasp o9 #g1))
          :effect (isholdingmotion #q7 #t1364 #q11 o9 #g1)
   )
   (:action s1381_plan-holding-motion
          :parameters (#q7 #q11 o8 #g2)
          :precondition (and (isconf #q7) (isconf #q11) (isgrasp o8 #g2))
          :effect (isholdingmotion #q7 #t1365 #q11 o8 #g2)
   )
   (:action s1382_plan-holding-motion
          :parameters (#q7 #q11 o8 #g3)
          :precondition (and (isconf #q7) (isconf #q11) (isgrasp o8 #g3))
          :effect (isholdingmotion #q7 #t1366 #q11 o8 #g3)
   )
   (:action s1383_plan-holding-motion
          :parameters (#q7 #q11 o9 #g4)
          :precondition (and (isconf #q7) (isconf #q11) (isgrasp o9 #g4))
          :effect (isholdingmotion #q7 #t1367 #q11 o9 #g4)
   )
   (:action s1384_plan-holding-motion
          :parameters (#q7 #q11 o9 #g5)
          :precondition (and (isconf #q7) (isconf #q11) (isgrasp o9 #g5))
          :effect (isholdingmotion #q7 #t1368 #q11 o9 #g5)
   )
   (:action s1385_plan-holding-motion
          :parameters (#q7 #q12 o8 #g0)
          :precondition (and (isconf #q7) (isconf #q12) (isgrasp o8 #g0))
          :effect (isholdingmotion #q7 #t1369 #q12 o8 #g0)
   )
   (:action s1386_plan-holding-motion
          :parameters (#q7 #q12 o9 #g1)
          :precondition (and (isconf #q7) (isconf #q12) (isgrasp o9 #g1))
          :effect (isholdingmotion #q7 #t1370 #q12 o9 #g1)
   )
   (:action s1387_plan-holding-motion
          :parameters (#q7 #q12 o8 #g2)
          :precondition (and (isconf #q7) (isconf #q12) (isgrasp o8 #g2))
          :effect (isholdingmotion #q7 #t1371 #q12 o8 #g2)
   )
   (:action s1388_plan-holding-motion
          :parameters (#q7 #q12 o8 #g3)
          :precondition (and (isconf #q7) (isconf #q12) (isgrasp o8 #g3))
          :effect (isholdingmotion #q7 #t1372 #q12 o8 #g3)
   )
   (:action s1389_plan-holding-motion
          :parameters (#q7 #q12 o9 #g4)
          :precondition (and (isconf #q7) (isconf #q12) (isgrasp o9 #g4))
          :effect (isholdingmotion #q7 #t1373 #q12 o9 #g4)
   )
   (:action s1390_plan-holding-motion
          :parameters (#q7 #q12 o9 #g5)
          :precondition (and (isconf #q7) (isconf #q12) (isgrasp o9 #g5))
          :effect (isholdingmotion #q7 #t1374 #q12 o9 #g5)
   )
   (:action s1391_plan-holding-motion
          :parameters (#q7 #q13 o8 #g0)
          :precondition (and (isconf #q7) (isconf #q13) (isgrasp o8 #g0))
          :effect (isholdingmotion #q7 #t1375 #q13 o8 #g0)
   )
   (:action s1392_plan-holding-motion
          :parameters (#q7 #q13 o9 #g1)
          :precondition (and (isconf #q7) (isconf #q13) (isgrasp o9 #g1))
          :effect (isholdingmotion #q7 #t1376 #q13 o9 #g1)
   )
   (:action s1393_plan-holding-motion
          :parameters (#q7 #q13 o8 #g2)
          :precondition (and (isconf #q7) (isconf #q13) (isgrasp o8 #g2))
          :effect (isholdingmotion #q7 #t1377 #q13 o8 #g2)
   )
   (:action s1394_plan-holding-motion
          :parameters (#q7 #q13 o8 #g3)
          :precondition (and (isconf #q7) (isconf #q13) (isgrasp o8 #g3))
          :effect (isholdingmotion #q7 #t1378 #q13 o8 #g3)
   )
   (:action s1395_plan-holding-motion
          :parameters (#q7 #q13 o9 #g4)
          :precondition (and (isconf #q7) (isconf #q13) (isgrasp o9 #g4))
          :effect (isholdingmotion #q7 #t1379 #q13 o9 #g4)
   )
   (:action s1396_plan-holding-motion
          :parameters (#q7 #q13 o9 #g5)
          :precondition (and (isconf #q7) (isconf #q13) (isgrasp o9 #g5))
          :effect (isholdingmotion #q7 #t1380 #q13 o9 #g5)
   )
   (:action s1397_plan-holding-motion
          :parameters (#q7 #q14 o8 #g0)
          :precondition (and (isconf #q7) (isconf #q14) (isgrasp o8 #g0))
          :effect (isholdingmotion #q7 #t1381 #q14 o8 #g0)
   )
   (:action s1398_plan-holding-motion
          :parameters (#q7 #q14 o9 #g1)
          :precondition (and (isconf #q7) (isconf #q14) (isgrasp o9 #g1))
          :effect (isholdingmotion #q7 #t1382 #q14 o9 #g1)
   )
   (:action s1399_plan-holding-motion
          :parameters (#q7 #q14 o8 #g2)
          :precondition (and (isconf #q7) (isconf #q14) (isgrasp o8 #g2))
          :effect (isholdingmotion #q7 #t1383 #q14 o8 #g2)
   )
   (:action s1400_plan-holding-motion
          :parameters (#q7 #q14 o8 #g3)
          :precondition (and (isconf #q7) (isconf #q14) (isgrasp o8 #g3))
          :effect (isholdingmotion #q7 #t1384 #q14 o8 #g3)
   )
   (:action s1401_plan-holding-motion
          :parameters (#q7 #q14 o9 #g4)
          :precondition (and (isconf #q7) (isconf #q14) (isgrasp o9 #g4))
          :effect (isholdingmotion #q7 #t1385 #q14 o9 #g4)
   )
   (:action s1402_plan-holding-motion
          :parameters (#q7 #q14 o9 #g5)
          :precondition (and (isconf #q7) (isconf #q14) (isgrasp o9 #g5))
          :effect (isholdingmotion #q7 #t1386 #q14 o9 #g5)
   )
   (:action s1403_plan-holding-motion
          :parameters (#q7 #q15 o8 #g0)
          :precondition (and (isconf #q7) (isconf #q15) (isgrasp o8 #g0))
          :effect (isholdingmotion #q7 #t1387 #q15 o8 #g0)
   )
   (:action s1404_plan-holding-motion
          :parameters (#q7 #q15 o9 #g1)
          :precondition (and (isconf #q7) (isconf #q15) (isgrasp o9 #g1))
          :effect (isholdingmotion #q7 #t1388 #q15 o9 #g1)
   )
   (:action s1405_plan-holding-motion
          :parameters (#q7 #q15 o8 #g2)
          :precondition (and (isconf #q7) (isconf #q15) (isgrasp o8 #g2))
          :effect (isholdingmotion #q7 #t1389 #q15 o8 #g2)
   )
   (:action s1406_plan-holding-motion
          :parameters (#q7 #q15 o8 #g3)
          :precondition (and (isconf #q7) (isconf #q15) (isgrasp o8 #g3))
          :effect (isholdingmotion #q7 #t1390 #q15 o8 #g3)
   )
   (:action s1407_plan-holding-motion
          :parameters (#q7 #q15 o9 #g4)
          :precondition (and (isconf #q7) (isconf #q15) (isgrasp o9 #g4))
          :effect (isholdingmotion #q7 #t1391 #q15 o9 #g4)
   )
   (:action s1408_plan-holding-motion
          :parameters (#q7 #q15 o9 #g5)
          :precondition (and (isconf #q7) (isconf #q15) (isgrasp o9 #g5))
          :effect (isholdingmotion #q7 #t1392 #q15 o9 #g5)
   )
   (:action s1409_plan-holding-motion
          :parameters (#q7 #q16 o8 #g0)
          :precondition (and (isconf #q7) (isconf #q16) (isgrasp o8 #g0))
          :effect (isholdingmotion #q7 #t1393 #q16 o8 #g0)
   )
   (:action s1410_plan-holding-motion
          :parameters (#q7 #q16 o9 #g1)
          :precondition (and (isconf #q7) (isconf #q16) (isgrasp o9 #g1))
          :effect (isholdingmotion #q7 #t1394 #q16 o9 #g1)
   )
   (:action s1411_plan-holding-motion
          :parameters (#q7 #q16 o8 #g2)
          :precondition (and (isconf #q7) (isconf #q16) (isgrasp o8 #g2))
          :effect (isholdingmotion #q7 #t1395 #q16 o8 #g2)
   )
   (:action s1412_plan-holding-motion
          :parameters (#q7 #q16 o8 #g3)
          :precondition (and (isconf #q7) (isconf #q16) (isgrasp o8 #g3))
          :effect (isholdingmotion #q7 #t1396 #q16 o8 #g3)
   )
   (:action s1413_plan-holding-motion
          :parameters (#q7 #q16 o9 #g4)
          :precondition (and (isconf #q7) (isconf #q16) (isgrasp o9 #g4))
          :effect (isholdingmotion #q7 #t1397 #q16 o9 #g4)
   )
   (:action s1414_plan-holding-motion
          :parameters (#q7 #q16 o9 #g5)
          :precondition (and (isconf #q7) (isconf #q16) (isgrasp o9 #g5))
          :effect (isholdingmotion #q7 #t1398 #q16 o9 #g5)
   )
   (:action s1415_plan-holding-motion
          :parameters (#q7 #q17 o8 #g0)
          :precondition (and (isconf #q7) (isconf #q17) (isgrasp o8 #g0))
          :effect (isholdingmotion #q7 #t1399 #q17 o8 #g0)
   )
   (:action s1416_plan-holding-motion
          :parameters (#q7 #q17 o9 #g1)
          :precondition (and (isconf #q7) (isconf #q17) (isgrasp o9 #g1))
          :effect (isholdingmotion #q7 #t1400 #q17 o9 #g1)
   )
   (:action s1417_plan-holding-motion
          :parameters (#q7 #q17 o8 #g2)
          :precondition (and (isconf #q7) (isconf #q17) (isgrasp o8 #g2))
          :effect (isholdingmotion #q7 #t1401 #q17 o8 #g2)
   )
   (:action s1418_plan-holding-motion
          :parameters (#q7 #q17 o8 #g3)
          :precondition (and (isconf #q7) (isconf #q17) (isgrasp o8 #g3))
          :effect (isholdingmotion #q7 #t1402 #q17 o8 #g3)
   )
   (:action s1419_plan-holding-motion
          :parameters (#q7 #q17 o9 #g4)
          :precondition (and (isconf #q7) (isconf #q17) (isgrasp o9 #g4))
          :effect (isholdingmotion #q7 #t1403 #q17 o9 #g4)
   )
   (:action s1420_plan-holding-motion
          :parameters (#q7 #q17 o9 #g5)
          :precondition (and (isconf #q7) (isconf #q17) (isgrasp o9 #g5))
          :effect (isholdingmotion #q7 #t1404 #q17 o9 #g5)
   )
   (:action s1421_plan-holding-motion
          :parameters (#q8 q808 o8 #g0)
          :precondition (and (isconf #q8) (isconf q808) (isgrasp o8 #g0))
          :effect (isholdingmotion #q8 #t1405 q808 o8 #g0)
   )
   (:action s1422_plan-holding-motion
          :parameters (#q8 q808 o9 #g1)
          :precondition (and (isconf #q8) (isconf q808) (isgrasp o9 #g1))
          :effect (isholdingmotion #q8 #t1406 q808 o9 #g1)
   )
   (:action s1423_plan-holding-motion
          :parameters (#q8 q808 o8 #g2)
          :precondition (and (isconf #q8) (isconf q808) (isgrasp o8 #g2))
          :effect (isholdingmotion #q8 #t1407 q808 o8 #g2)
   )
   (:action s1424_plan-holding-motion
          :parameters (#q8 q808 o8 #g3)
          :precondition (and (isconf #q8) (isconf q808) (isgrasp o8 #g3))
          :effect (isholdingmotion #q8 #t1408 q808 o8 #g3)
   )
   (:action s1425_plan-holding-motion
          :parameters (#q8 q808 o9 #g4)
          :precondition (and (isconf #q8) (isconf q808) (isgrasp o9 #g4))
          :effect (isholdingmotion #q8 #t1409 q808 o9 #g4)
   )
   (:action s1426_plan-holding-motion
          :parameters (#q8 q808 o9 #g5)
          :precondition (and (isconf #q8) (isconf q808) (isgrasp o9 #g5))
          :effect (isholdingmotion #q8 #t1410 q808 o9 #g5)
   )
   (:action s1427_plan-holding-motion
          :parameters (#q8 #q0 o8 #g0)
          :precondition (and (isconf #q8) (isconf #q0) (isgrasp o8 #g0))
          :effect (isholdingmotion #q8 #t1411 #q0 o8 #g0)
   )
   (:action s1428_plan-holding-motion
          :parameters (#q8 #q0 o9 #g1)
          :precondition (and (isconf #q8) (isconf #q0) (isgrasp o9 #g1))
          :effect (isholdingmotion #q8 #t1412 #q0 o9 #g1)
   )
   (:action s1429_plan-holding-motion
          :parameters (#q8 #q0 o8 #g2)
          :precondition (and (isconf #q8) (isconf #q0) (isgrasp o8 #g2))
          :effect (isholdingmotion #q8 #t1413 #q0 o8 #g2)
   )
   (:action s1430_plan-holding-motion
          :parameters (#q8 #q0 o8 #g3)
          :precondition (and (isconf #q8) (isconf #q0) (isgrasp o8 #g3))
          :effect (isholdingmotion #q8 #t1414 #q0 o8 #g3)
   )
   (:action s1431_plan-holding-motion
          :parameters (#q8 #q0 o9 #g4)
          :precondition (and (isconf #q8) (isconf #q0) (isgrasp o9 #g4))
          :effect (isholdingmotion #q8 #t1415 #q0 o9 #g4)
   )
   (:action s1432_plan-holding-motion
          :parameters (#q8 #q0 o9 #g5)
          :precondition (and (isconf #q8) (isconf #q0) (isgrasp o9 #g5))
          :effect (isholdingmotion #q8 #t1416 #q0 o9 #g5)
   )
   (:action s1433_plan-holding-motion
          :parameters (#q8 #q1 o8 #g0)
          :precondition (and (isconf #q8) (isconf #q1) (isgrasp o8 #g0))
          :effect (isholdingmotion #q8 #t1417 #q1 o8 #g0)
   )
   (:action s1434_plan-holding-motion
          :parameters (#q8 #q1 o9 #g1)
          :precondition (and (isconf #q8) (isconf #q1) (isgrasp o9 #g1))
          :effect (isholdingmotion #q8 #t1418 #q1 o9 #g1)
   )
   (:action s1435_plan-holding-motion
          :parameters (#q8 #q1 o8 #g2)
          :precondition (and (isconf #q8) (isconf #q1) (isgrasp o8 #g2))
          :effect (isholdingmotion #q8 #t1419 #q1 o8 #g2)
   )
   (:action s1436_plan-holding-motion
          :parameters (#q8 #q1 o8 #g3)
          :precondition (and (isconf #q8) (isconf #q1) (isgrasp o8 #g3))
          :effect (isholdingmotion #q8 #t1420 #q1 o8 #g3)
   )
   (:action s1437_plan-holding-motion
          :parameters (#q8 #q1 o9 #g4)
          :precondition (and (isconf #q8) (isconf #q1) (isgrasp o9 #g4))
          :effect (isholdingmotion #q8 #t1421 #q1 o9 #g4)
   )
   (:action s1438_plan-holding-motion
          :parameters (#q8 #q1 o9 #g5)
          :precondition (and (isconf #q8) (isconf #q1) (isgrasp o9 #g5))
          :effect (isholdingmotion #q8 #t1422 #q1 o9 #g5)
   )
   (:action s1439_plan-holding-motion
          :parameters (#q8 #q2 o8 #g0)
          :precondition (and (isconf #q8) (isconf #q2) (isgrasp o8 #g0))
          :effect (isholdingmotion #q8 #t1423 #q2 o8 #g0)
   )
   (:action s1440_plan-holding-motion
          :parameters (#q8 #q2 o9 #g1)
          :precondition (and (isconf #q8) (isconf #q2) (isgrasp o9 #g1))
          :effect (isholdingmotion #q8 #t1424 #q2 o9 #g1)
   )
   (:action s1441_plan-holding-motion
          :parameters (#q8 #q2 o8 #g2)
          :precondition (and (isconf #q8) (isconf #q2) (isgrasp o8 #g2))
          :effect (isholdingmotion #q8 #t1425 #q2 o8 #g2)
   )
   (:action s1442_plan-holding-motion
          :parameters (#q8 #q2 o8 #g3)
          :precondition (and (isconf #q8) (isconf #q2) (isgrasp o8 #g3))
          :effect (isholdingmotion #q8 #t1426 #q2 o8 #g3)
   )
   (:action s1443_plan-holding-motion
          :parameters (#q8 #q2 o9 #g4)
          :precondition (and (isconf #q8) (isconf #q2) (isgrasp o9 #g4))
          :effect (isholdingmotion #q8 #t1427 #q2 o9 #g4)
   )
   (:action s1444_plan-holding-motion
          :parameters (#q8 #q2 o9 #g5)
          :precondition (and (isconf #q8) (isconf #q2) (isgrasp o9 #g5))
          :effect (isholdingmotion #q8 #t1428 #q2 o9 #g5)
   )
   (:action s1445_plan-holding-motion
          :parameters (#q8 #q3 o8 #g0)
          :precondition (and (isconf #q8) (isconf #q3) (isgrasp o8 #g0))
          :effect (isholdingmotion #q8 #t1429 #q3 o8 #g0)
   )
   (:action s1446_plan-holding-motion
          :parameters (#q8 #q3 o9 #g1)
          :precondition (and (isconf #q8) (isconf #q3) (isgrasp o9 #g1))
          :effect (isholdingmotion #q8 #t1430 #q3 o9 #g1)
   )
   (:action s1447_plan-holding-motion
          :parameters (#q8 #q3 o8 #g2)
          :precondition (and (isconf #q8) (isconf #q3) (isgrasp o8 #g2))
          :effect (isholdingmotion #q8 #t1431 #q3 o8 #g2)
   )
   (:action s1448_plan-holding-motion
          :parameters (#q8 #q3 o8 #g3)
          :precondition (and (isconf #q8) (isconf #q3) (isgrasp o8 #g3))
          :effect (isholdingmotion #q8 #t1432 #q3 o8 #g3)
   )
   (:action s1449_plan-holding-motion
          :parameters (#q8 #q3 o9 #g4)
          :precondition (and (isconf #q8) (isconf #q3) (isgrasp o9 #g4))
          :effect (isholdingmotion #q8 #t1433 #q3 o9 #g4)
   )
   (:action s1450_plan-holding-motion
          :parameters (#q8 #q3 o9 #g5)
          :precondition (and (isconf #q8) (isconf #q3) (isgrasp o9 #g5))
          :effect (isholdingmotion #q8 #t1434 #q3 o9 #g5)
   )
   (:action s1451_plan-holding-motion
          :parameters (#q8 #q4 o8 #g0)
          :precondition (and (isconf #q8) (isconf #q4) (isgrasp o8 #g0))
          :effect (isholdingmotion #q8 #t1435 #q4 o8 #g0)
   )
   (:action s1452_plan-holding-motion
          :parameters (#q8 #q4 o9 #g1)
          :precondition (and (isconf #q8) (isconf #q4) (isgrasp o9 #g1))
          :effect (isholdingmotion #q8 #t1436 #q4 o9 #g1)
   )
   (:action s1453_plan-holding-motion
          :parameters (#q8 #q4 o8 #g2)
          :precondition (and (isconf #q8) (isconf #q4) (isgrasp o8 #g2))
          :effect (isholdingmotion #q8 #t1437 #q4 o8 #g2)
   )
   (:action s1454_plan-holding-motion
          :parameters (#q8 #q4 o8 #g3)
          :precondition (and (isconf #q8) (isconf #q4) (isgrasp o8 #g3))
          :effect (isholdingmotion #q8 #t1438 #q4 o8 #g3)
   )
   (:action s1455_plan-holding-motion
          :parameters (#q8 #q4 o9 #g4)
          :precondition (and (isconf #q8) (isconf #q4) (isgrasp o9 #g4))
          :effect (isholdingmotion #q8 #t1439 #q4 o9 #g4)
   )
   (:action s1456_plan-holding-motion
          :parameters (#q8 #q4 o9 #g5)
          :precondition (and (isconf #q8) (isconf #q4) (isgrasp o9 #g5))
          :effect (isholdingmotion #q8 #t1440 #q4 o9 #g5)
   )
   (:action s1457_plan-holding-motion
          :parameters (#q8 #q5 o8 #g0)
          :precondition (and (isconf #q8) (isconf #q5) (isgrasp o8 #g0))
          :effect (isholdingmotion #q8 #t1441 #q5 o8 #g0)
   )
   (:action s1458_plan-holding-motion
          :parameters (#q8 #q5 o9 #g1)
          :precondition (and (isconf #q8) (isconf #q5) (isgrasp o9 #g1))
          :effect (isholdingmotion #q8 #t1442 #q5 o9 #g1)
   )
   (:action s1459_plan-holding-motion
          :parameters (#q8 #q5 o8 #g2)
          :precondition (and (isconf #q8) (isconf #q5) (isgrasp o8 #g2))
          :effect (isholdingmotion #q8 #t1443 #q5 o8 #g2)
   )
   (:action s1460_plan-holding-motion
          :parameters (#q8 #q5 o8 #g3)
          :precondition (and (isconf #q8) (isconf #q5) (isgrasp o8 #g3))
          :effect (isholdingmotion #q8 #t1444 #q5 o8 #g3)
   )
   (:action s1461_plan-holding-motion
          :parameters (#q8 #q5 o9 #g4)
          :precondition (and (isconf #q8) (isconf #q5) (isgrasp o9 #g4))
          :effect (isholdingmotion #q8 #t1445 #q5 o9 #g4)
   )
   (:action s1462_plan-holding-motion
          :parameters (#q8 #q5 o9 #g5)
          :precondition (and (isconf #q8) (isconf #q5) (isgrasp o9 #g5))
          :effect (isholdingmotion #q8 #t1446 #q5 o9 #g5)
   )
   (:action s1463_plan-holding-motion
          :parameters (#q8 #q6 o8 #g0)
          :precondition (and (isconf #q8) (isconf #q6) (isgrasp o8 #g0))
          :effect (isholdingmotion #q8 #t1447 #q6 o8 #g0)
   )
   (:action s1464_plan-holding-motion
          :parameters (#q8 #q6 o9 #g1)
          :precondition (and (isconf #q8) (isconf #q6) (isgrasp o9 #g1))
          :effect (isholdingmotion #q8 #t1448 #q6 o9 #g1)
   )
   (:action s1465_plan-holding-motion
          :parameters (#q8 #q6 o8 #g2)
          :precondition (and (isconf #q8) (isconf #q6) (isgrasp o8 #g2))
          :effect (isholdingmotion #q8 #t1449 #q6 o8 #g2)
   )
   (:action s1466_plan-holding-motion
          :parameters (#q8 #q6 o8 #g3)
          :precondition (and (isconf #q8) (isconf #q6) (isgrasp o8 #g3))
          :effect (isholdingmotion #q8 #t1450 #q6 o8 #g3)
   )
   (:action s1467_plan-holding-motion
          :parameters (#q8 #q6 o9 #g4)
          :precondition (and (isconf #q8) (isconf #q6) (isgrasp o9 #g4))
          :effect (isholdingmotion #q8 #t1451 #q6 o9 #g4)
   )
   (:action s1468_plan-holding-motion
          :parameters (#q8 #q6 o9 #g5)
          :precondition (and (isconf #q8) (isconf #q6) (isgrasp o9 #g5))
          :effect (isholdingmotion #q8 #t1452 #q6 o9 #g5)
   )
   (:action s1469_plan-holding-motion
          :parameters (#q8 #q7 o8 #g0)
          :precondition (and (isconf #q8) (isconf #q7) (isgrasp o8 #g0))
          :effect (isholdingmotion #q8 #t1453 #q7 o8 #g0)
   )
   (:action s1470_plan-holding-motion
          :parameters (#q8 #q7 o9 #g1)
          :precondition (and (isconf #q8) (isconf #q7) (isgrasp o9 #g1))
          :effect (isholdingmotion #q8 #t1454 #q7 o9 #g1)
   )
   (:action s1471_plan-holding-motion
          :parameters (#q8 #q7 o8 #g2)
          :precondition (and (isconf #q8) (isconf #q7) (isgrasp o8 #g2))
          :effect (isholdingmotion #q8 #t1455 #q7 o8 #g2)
   )
   (:action s1472_plan-holding-motion
          :parameters (#q8 #q7 o8 #g3)
          :precondition (and (isconf #q8) (isconf #q7) (isgrasp o8 #g3))
          :effect (isholdingmotion #q8 #t1456 #q7 o8 #g3)
   )
   (:action s1473_plan-holding-motion
          :parameters (#q8 #q7 o9 #g4)
          :precondition (and (isconf #q8) (isconf #q7) (isgrasp o9 #g4))
          :effect (isholdingmotion #q8 #t1457 #q7 o9 #g4)
   )
   (:action s1474_plan-holding-motion
          :parameters (#q8 #q7 o9 #g5)
          :precondition (and (isconf #q8) (isconf #q7) (isgrasp o9 #g5))
          :effect (isholdingmotion #q8 #t1458 #q7 o9 #g5)
   )
   (:action s1475_plan-holding-motion
          :parameters (#q8 #q8 o8 #g0)
          :precondition (and (isconf #q8) (isconf #q8) (isgrasp o8 #g0))
          :effect (isholdingmotion #q8 #t1459 #q8 o8 #g0)
   )
   (:action s1476_plan-holding-motion
          :parameters (#q8 #q8 o9 #g1)
          :precondition (and (isconf #q8) (isconf #q8) (isgrasp o9 #g1))
          :effect (isholdingmotion #q8 #t1460 #q8 o9 #g1)
   )
   (:action s1477_plan-holding-motion
          :parameters (#q8 #q8 o8 #g2)
          :precondition (and (isconf #q8) (isconf #q8) (isgrasp o8 #g2))
          :effect (isholdingmotion #q8 #t1461 #q8 o8 #g2)
   )
   (:action s1478_plan-holding-motion
          :parameters (#q8 #q8 o8 #g3)
          :precondition (and (isconf #q8) (isconf #q8) (isgrasp o8 #g3))
          :effect (isholdingmotion #q8 #t1462 #q8 o8 #g3)
   )
   (:action s1479_plan-holding-motion
          :parameters (#q8 #q8 o9 #g4)
          :precondition (and (isconf #q8) (isconf #q8) (isgrasp o9 #g4))
          :effect (isholdingmotion #q8 #t1463 #q8 o9 #g4)
   )
   (:action s1480_plan-holding-motion
          :parameters (#q8 #q8 o9 #g5)
          :precondition (and (isconf #q8) (isconf #q8) (isgrasp o9 #g5))
          :effect (isholdingmotion #q8 #t1464 #q8 o9 #g5)
   )
   (:action s1481_plan-holding-motion
          :parameters (#q8 #q9 o8 #g0)
          :precondition (and (isconf #q8) (isconf #q9) (isgrasp o8 #g0))
          :effect (isholdingmotion #q8 #t1465 #q9 o8 #g0)
   )
   (:action s1482_plan-holding-motion
          :parameters (#q8 #q9 o9 #g1)
          :precondition (and (isconf #q8) (isconf #q9) (isgrasp o9 #g1))
          :effect (isholdingmotion #q8 #t1466 #q9 o9 #g1)
   )
   (:action s1483_plan-holding-motion
          :parameters (#q8 #q9 o8 #g2)
          :precondition (and (isconf #q8) (isconf #q9) (isgrasp o8 #g2))
          :effect (isholdingmotion #q8 #t1467 #q9 o8 #g2)
   )
   (:action s1484_plan-holding-motion
          :parameters (#q8 #q9 o8 #g3)
          :precondition (and (isconf #q8) (isconf #q9) (isgrasp o8 #g3))
          :effect (isholdingmotion #q8 #t1468 #q9 o8 #g3)
   )
   (:action s1485_plan-holding-motion
          :parameters (#q8 #q9 o9 #g4)
          :precondition (and (isconf #q8) (isconf #q9) (isgrasp o9 #g4))
          :effect (isholdingmotion #q8 #t1469 #q9 o9 #g4)
   )
   (:action s1486_plan-holding-motion
          :parameters (#q8 #q9 o9 #g5)
          :precondition (and (isconf #q8) (isconf #q9) (isgrasp o9 #g5))
          :effect (isholdingmotion #q8 #t1470 #q9 o9 #g5)
   )
   (:action s1487_plan-holding-motion
          :parameters (#q8 #q10 o8 #g0)
          :precondition (and (isconf #q8) (isconf #q10) (isgrasp o8 #g0))
          :effect (isholdingmotion #q8 #t1471 #q10 o8 #g0)
   )
   (:action s1488_plan-holding-motion
          :parameters (#q8 #q10 o9 #g1)
          :precondition (and (isconf #q8) (isconf #q10) (isgrasp o9 #g1))
          :effect (isholdingmotion #q8 #t1472 #q10 o9 #g1)
   )
   (:action s1489_plan-holding-motion
          :parameters (#q8 #q10 o8 #g2)
          :precondition (and (isconf #q8) (isconf #q10) (isgrasp o8 #g2))
          :effect (isholdingmotion #q8 #t1473 #q10 o8 #g2)
   )
   (:action s1490_plan-holding-motion
          :parameters (#q8 #q10 o8 #g3)
          :precondition (and (isconf #q8) (isconf #q10) (isgrasp o8 #g3))
          :effect (isholdingmotion #q8 #t1474 #q10 o8 #g3)
   )
   (:action s1491_plan-holding-motion
          :parameters (#q8 #q10 o9 #g4)
          :precondition (and (isconf #q8) (isconf #q10) (isgrasp o9 #g4))
          :effect (isholdingmotion #q8 #t1475 #q10 o9 #g4)
   )
   (:action s1492_plan-holding-motion
          :parameters (#q8 #q10 o9 #g5)
          :precondition (and (isconf #q8) (isconf #q10) (isgrasp o9 #g5))
          :effect (isholdingmotion #q8 #t1476 #q10 o9 #g5)
   )
   (:action s1493_plan-holding-motion
          :parameters (#q8 #q11 o8 #g0)
          :precondition (and (isconf #q8) (isconf #q11) (isgrasp o8 #g0))
          :effect (isholdingmotion #q8 #t1477 #q11 o8 #g0)
   )
   (:action s1494_plan-holding-motion
          :parameters (#q8 #q11 o9 #g1)
          :precondition (and (isconf #q8) (isconf #q11) (isgrasp o9 #g1))
          :effect (isholdingmotion #q8 #t1478 #q11 o9 #g1)
   )
   (:action s1495_plan-holding-motion
          :parameters (#q8 #q11 o8 #g2)
          :precondition (and (isconf #q8) (isconf #q11) (isgrasp o8 #g2))
          :effect (isholdingmotion #q8 #t1479 #q11 o8 #g2)
   )
   (:action s1496_plan-holding-motion
          :parameters (#q8 #q11 o8 #g3)
          :precondition (and (isconf #q8) (isconf #q11) (isgrasp o8 #g3))
          :effect (isholdingmotion #q8 #t1480 #q11 o8 #g3)
   )
   (:action s1497_plan-holding-motion
          :parameters (#q8 #q11 o9 #g4)
          :precondition (and (isconf #q8) (isconf #q11) (isgrasp o9 #g4))
          :effect (isholdingmotion #q8 #t1481 #q11 o9 #g4)
   )
   (:action s1498_plan-holding-motion
          :parameters (#q8 #q11 o9 #g5)
          :precondition (and (isconf #q8) (isconf #q11) (isgrasp o9 #g5))
          :effect (isholdingmotion #q8 #t1482 #q11 o9 #g5)
   )
   (:action s1499_plan-holding-motion
          :parameters (#q8 #q12 o8 #g0)
          :precondition (and (isconf #q8) (isconf #q12) (isgrasp o8 #g0))
          :effect (isholdingmotion #q8 #t1483 #q12 o8 #g0)
   )
   (:action s1500_plan-holding-motion
          :parameters (#q8 #q12 o9 #g1)
          :precondition (and (isconf #q8) (isconf #q12) (isgrasp o9 #g1))
          :effect (isholdingmotion #q8 #t1484 #q12 o9 #g1)
   )
   (:action s1501_plan-holding-motion
          :parameters (#q8 #q12 o8 #g2)
          :precondition (and (isconf #q8) (isconf #q12) (isgrasp o8 #g2))
          :effect (isholdingmotion #q8 #t1485 #q12 o8 #g2)
   )
   (:action s1502_plan-holding-motion
          :parameters (#q8 #q12 o8 #g3)
          :precondition (and (isconf #q8) (isconf #q12) (isgrasp o8 #g3))
          :effect (isholdingmotion #q8 #t1486 #q12 o8 #g3)
   )
   (:action s1503_plan-holding-motion
          :parameters (#q8 #q12 o9 #g4)
          :precondition (and (isconf #q8) (isconf #q12) (isgrasp o9 #g4))
          :effect (isholdingmotion #q8 #t1487 #q12 o9 #g4)
   )
   (:action s1504_plan-holding-motion
          :parameters (#q8 #q12 o9 #g5)
          :precondition (and (isconf #q8) (isconf #q12) (isgrasp o9 #g5))
          :effect (isholdingmotion #q8 #t1488 #q12 o9 #g5)
   )
   (:action s1505_plan-holding-motion
          :parameters (#q8 #q13 o8 #g0)
          :precondition (and (isconf #q8) (isconf #q13) (isgrasp o8 #g0))
          :effect (isholdingmotion #q8 #t1489 #q13 o8 #g0)
   )
   (:action s1506_plan-holding-motion
          :parameters (#q8 #q13 o9 #g1)
          :precondition (and (isconf #q8) (isconf #q13) (isgrasp o9 #g1))
          :effect (isholdingmotion #q8 #t1490 #q13 o9 #g1)
   )
   (:action s1507_plan-holding-motion
          :parameters (#q8 #q13 o8 #g2)
          :precondition (and (isconf #q8) (isconf #q13) (isgrasp o8 #g2))
          :effect (isholdingmotion #q8 #t1491 #q13 o8 #g2)
   )
   (:action s1508_plan-holding-motion
          :parameters (#q8 #q13 o8 #g3)
          :precondition (and (isconf #q8) (isconf #q13) (isgrasp o8 #g3))
          :effect (isholdingmotion #q8 #t1492 #q13 o8 #g3)
   )
   (:action s1509_plan-holding-motion
          :parameters (#q8 #q13 o9 #g4)
          :precondition (and (isconf #q8) (isconf #q13) (isgrasp o9 #g4))
          :effect (isholdingmotion #q8 #t1493 #q13 o9 #g4)
   )
   (:action s1510_plan-holding-motion
          :parameters (#q8 #q13 o9 #g5)
          :precondition (and (isconf #q8) (isconf #q13) (isgrasp o9 #g5))
          :effect (isholdingmotion #q8 #t1494 #q13 o9 #g5)
   )
   (:action s1511_plan-holding-motion
          :parameters (#q8 #q14 o8 #g0)
          :precondition (and (isconf #q8) (isconf #q14) (isgrasp o8 #g0))
          :effect (isholdingmotion #q8 #t1495 #q14 o8 #g0)
   )
   (:action s1512_plan-holding-motion
          :parameters (#q8 #q14 o9 #g1)
          :precondition (and (isconf #q8) (isconf #q14) (isgrasp o9 #g1))
          :effect (isholdingmotion #q8 #t1496 #q14 o9 #g1)
   )
   (:action s1513_plan-holding-motion
          :parameters (#q8 #q14 o8 #g2)
          :precondition (and (isconf #q8) (isconf #q14) (isgrasp o8 #g2))
          :effect (isholdingmotion #q8 #t1497 #q14 o8 #g2)
   )
   (:action s1514_plan-holding-motion
          :parameters (#q8 #q14 o8 #g3)
          :precondition (and (isconf #q8) (isconf #q14) (isgrasp o8 #g3))
          :effect (isholdingmotion #q8 #t1498 #q14 o8 #g3)
   )
   (:action s1515_plan-holding-motion
          :parameters (#q8 #q14 o9 #g4)
          :precondition (and (isconf #q8) (isconf #q14) (isgrasp o9 #g4))
          :effect (isholdingmotion #q8 #t1499 #q14 o9 #g4)
   )
   (:action s1516_plan-holding-motion
          :parameters (#q8 #q14 o9 #g5)
          :precondition (and (isconf #q8) (isconf #q14) (isgrasp o9 #g5))
          :effect (isholdingmotion #q8 #t1500 #q14 o9 #g5)
   )
   (:action s1517_plan-holding-motion
          :parameters (#q8 #q15 o8 #g0)
          :precondition (and (isconf #q8) (isconf #q15) (isgrasp o8 #g0))
          :effect (isholdingmotion #q8 #t1501 #q15 o8 #g0)
   )
   (:action s1518_plan-holding-motion
          :parameters (#q8 #q15 o9 #g1)
          :precondition (and (isconf #q8) (isconf #q15) (isgrasp o9 #g1))
          :effect (isholdingmotion #q8 #t1502 #q15 o9 #g1)
   )
   (:action s1519_plan-holding-motion
          :parameters (#q8 #q15 o8 #g2)
          :precondition (and (isconf #q8) (isconf #q15) (isgrasp o8 #g2))
          :effect (isholdingmotion #q8 #t1503 #q15 o8 #g2)
   )
   (:action s1520_plan-holding-motion
          :parameters (#q8 #q15 o8 #g3)
          :precondition (and (isconf #q8) (isconf #q15) (isgrasp o8 #g3))
          :effect (isholdingmotion #q8 #t1504 #q15 o8 #g3)
   )
   (:action s1521_plan-holding-motion
          :parameters (#q8 #q15 o9 #g4)
          :precondition (and (isconf #q8) (isconf #q15) (isgrasp o9 #g4))
          :effect (isholdingmotion #q8 #t1505 #q15 o9 #g4)
   )
   (:action s1522_plan-holding-motion
          :parameters (#q8 #q15 o9 #g5)
          :precondition (and (isconf #q8) (isconf #q15) (isgrasp o9 #g5))
          :effect (isholdingmotion #q8 #t1506 #q15 o9 #g5)
   )
   (:action s1523_plan-holding-motion
          :parameters (#q8 #q16 o8 #g0)
          :precondition (and (isconf #q8) (isconf #q16) (isgrasp o8 #g0))
          :effect (isholdingmotion #q8 #t1507 #q16 o8 #g0)
   )
   (:action s1524_plan-holding-motion
          :parameters (#q8 #q16 o9 #g1)
          :precondition (and (isconf #q8) (isconf #q16) (isgrasp o9 #g1))
          :effect (isholdingmotion #q8 #t1508 #q16 o9 #g1)
   )
   (:action s1525_plan-holding-motion
          :parameters (#q8 #q16 o8 #g2)
          :precondition (and (isconf #q8) (isconf #q16) (isgrasp o8 #g2))
          :effect (isholdingmotion #q8 #t1509 #q16 o8 #g2)
   )
   (:action s1526_plan-holding-motion
          :parameters (#q8 #q16 o8 #g3)
          :precondition (and (isconf #q8) (isconf #q16) (isgrasp o8 #g3))
          :effect (isholdingmotion #q8 #t1510 #q16 o8 #g3)
   )
   (:action s1527_plan-holding-motion
          :parameters (#q8 #q16 o9 #g4)
          :precondition (and (isconf #q8) (isconf #q16) (isgrasp o9 #g4))
          :effect (isholdingmotion #q8 #t1511 #q16 o9 #g4)
   )
   (:action s1528_plan-holding-motion
          :parameters (#q8 #q16 o9 #g5)
          :precondition (and (isconf #q8) (isconf #q16) (isgrasp o9 #g5))
          :effect (isholdingmotion #q8 #t1512 #q16 o9 #g5)
   )
   (:action s1529_plan-holding-motion
          :parameters (#q8 #q17 o8 #g0)
          :precondition (and (isconf #q8) (isconf #q17) (isgrasp o8 #g0))
          :effect (isholdingmotion #q8 #t1513 #q17 o8 #g0)
   )
   (:action s1530_plan-holding-motion
          :parameters (#q8 #q17 o9 #g1)
          :precondition (and (isconf #q8) (isconf #q17) (isgrasp o9 #g1))
          :effect (isholdingmotion #q8 #t1514 #q17 o9 #g1)
   )
   (:action s1531_plan-holding-motion
          :parameters (#q8 #q17 o8 #g2)
          :precondition (and (isconf #q8) (isconf #q17) (isgrasp o8 #g2))
          :effect (isholdingmotion #q8 #t1515 #q17 o8 #g2)
   )
   (:action s1532_plan-holding-motion
          :parameters (#q8 #q17 o8 #g3)
          :precondition (and (isconf #q8) (isconf #q17) (isgrasp o8 #g3))
          :effect (isholdingmotion #q8 #t1516 #q17 o8 #g3)
   )
   (:action s1533_plan-holding-motion
          :parameters (#q8 #q17 o9 #g4)
          :precondition (and (isconf #q8) (isconf #q17) (isgrasp o9 #g4))
          :effect (isholdingmotion #q8 #t1517 #q17 o9 #g4)
   )
   (:action s1534_plan-holding-motion
          :parameters (#q8 #q17 o9 #g5)
          :precondition (and (isconf #q8) (isconf #q17) (isgrasp o9 #g5))
          :effect (isholdingmotion #q8 #t1518 #q17 o9 #g5)
   )
   (:action s1535_plan-holding-motion
          :parameters (#q9 q808 o8 #g0)
          :precondition (and (isconf #q9) (isconf q808) (isgrasp o8 #g0))
          :effect (isholdingmotion #q9 #t1519 q808 o8 #g0)
   )
   (:action s1536_plan-holding-motion
          :parameters (#q9 q808 o9 #g1)
          :precondition (and (isconf #q9) (isconf q808) (isgrasp o9 #g1))
          :effect (isholdingmotion #q9 #t1520 q808 o9 #g1)
   )
   (:action s1537_plan-holding-motion
          :parameters (#q9 q808 o8 #g2)
          :precondition (and (isconf #q9) (isconf q808) (isgrasp o8 #g2))
          :effect (isholdingmotion #q9 #t1521 q808 o8 #g2)
   )
   (:action s1538_plan-holding-motion
          :parameters (#q9 q808 o8 #g3)
          :precondition (and (isconf #q9) (isconf q808) (isgrasp o8 #g3))
          :effect (isholdingmotion #q9 #t1522 q808 o8 #g3)
   )
   (:action s1539_plan-holding-motion
          :parameters (#q9 q808 o9 #g4)
          :precondition (and (isconf #q9) (isconf q808) (isgrasp o9 #g4))
          :effect (isholdingmotion #q9 #t1523 q808 o9 #g4)
   )
   (:action s1540_plan-holding-motion
          :parameters (#q9 q808 o9 #g5)
          :precondition (and (isconf #q9) (isconf q808) (isgrasp o9 #g5))
          :effect (isholdingmotion #q9 #t1524 q808 o9 #g5)
   )
   (:action s1541_plan-holding-motion
          :parameters (#q9 #q0 o8 #g0)
          :precondition (and (isconf #q9) (isconf #q0) (isgrasp o8 #g0))
          :effect (isholdingmotion #q9 #t1525 #q0 o8 #g0)
   )
   (:action s1542_plan-holding-motion
          :parameters (#q9 #q0 o9 #g1)
          :precondition (and (isconf #q9) (isconf #q0) (isgrasp o9 #g1))
          :effect (isholdingmotion #q9 #t1526 #q0 o9 #g1)
   )
   (:action s1543_plan-holding-motion
          :parameters (#q9 #q0 o8 #g2)
          :precondition (and (isconf #q9) (isconf #q0) (isgrasp o8 #g2))
          :effect (isholdingmotion #q9 #t1527 #q0 o8 #g2)
   )
   (:action s1544_plan-holding-motion
          :parameters (#q9 #q0 o8 #g3)
          :precondition (and (isconf #q9) (isconf #q0) (isgrasp o8 #g3))
          :effect (isholdingmotion #q9 #t1528 #q0 o8 #g3)
   )
   (:action s1545_plan-holding-motion
          :parameters (#q9 #q0 o9 #g4)
          :precondition (and (isconf #q9) (isconf #q0) (isgrasp o9 #g4))
          :effect (isholdingmotion #q9 #t1529 #q0 o9 #g4)
   )
   (:action s1546_plan-holding-motion
          :parameters (#q9 #q0 o9 #g5)
          :precondition (and (isconf #q9) (isconf #q0) (isgrasp o9 #g5))
          :effect (isholdingmotion #q9 #t1530 #q0 o9 #g5)
   )
   (:action s1547_plan-holding-motion
          :parameters (#q9 #q1 o8 #g0)
          :precondition (and (isconf #q9) (isconf #q1) (isgrasp o8 #g0))
          :effect (isholdingmotion #q9 #t1531 #q1 o8 #g0)
   )
   (:action s1548_plan-holding-motion
          :parameters (#q9 #q1 o9 #g1)
          :precondition (and (isconf #q9) (isconf #q1) (isgrasp o9 #g1))
          :effect (isholdingmotion #q9 #t1532 #q1 o9 #g1)
   )
   (:action s1549_plan-holding-motion
          :parameters (#q9 #q1 o8 #g2)
          :precondition (and (isconf #q9) (isconf #q1) (isgrasp o8 #g2))
          :effect (isholdingmotion #q9 #t1533 #q1 o8 #g2)
   )
   (:action s1550_plan-holding-motion
          :parameters (#q9 #q1 o8 #g3)
          :precondition (and (isconf #q9) (isconf #q1) (isgrasp o8 #g3))
          :effect (isholdingmotion #q9 #t1534 #q1 o8 #g3)
   )
   (:action s1551_plan-holding-motion
          :parameters (#q9 #q1 o9 #g4)
          :precondition (and (isconf #q9) (isconf #q1) (isgrasp o9 #g4))
          :effect (isholdingmotion #q9 #t1535 #q1 o9 #g4)
   )
   (:action s1552_plan-holding-motion
          :parameters (#q9 #q1 o9 #g5)
          :precondition (and (isconf #q9) (isconf #q1) (isgrasp o9 #g5))
          :effect (isholdingmotion #q9 #t1536 #q1 o9 #g5)
   )
   (:action s1553_plan-holding-motion
          :parameters (#q9 #q2 o8 #g0)
          :precondition (and (isconf #q9) (isconf #q2) (isgrasp o8 #g0))
          :effect (isholdingmotion #q9 #t1537 #q2 o8 #g0)
   )
   (:action s1554_plan-holding-motion
          :parameters (#q9 #q2 o9 #g1)
          :precondition (and (isconf #q9) (isconf #q2) (isgrasp o9 #g1))
          :effect (isholdingmotion #q9 #t1538 #q2 o9 #g1)
   )
   (:action s1555_plan-holding-motion
          :parameters (#q9 #q2 o8 #g2)
          :precondition (and (isconf #q9) (isconf #q2) (isgrasp o8 #g2))
          :effect (isholdingmotion #q9 #t1539 #q2 o8 #g2)
   )
   (:action s1556_plan-holding-motion
          :parameters (#q9 #q2 o8 #g3)
          :precondition (and (isconf #q9) (isconf #q2) (isgrasp o8 #g3))
          :effect (isholdingmotion #q9 #t1540 #q2 o8 #g3)
   )
   (:action s1557_plan-holding-motion
          :parameters (#q9 #q2 o9 #g4)
          :precondition (and (isconf #q9) (isconf #q2) (isgrasp o9 #g4))
          :effect (isholdingmotion #q9 #t1541 #q2 o9 #g4)
   )
   (:action s1558_plan-holding-motion
          :parameters (#q9 #q2 o9 #g5)
          :precondition (and (isconf #q9) (isconf #q2) (isgrasp o9 #g5))
          :effect (isholdingmotion #q9 #t1542 #q2 o9 #g5)
   )
   (:action s1559_plan-holding-motion
          :parameters (#q9 #q3 o8 #g0)
          :precondition (and (isconf #q9) (isconf #q3) (isgrasp o8 #g0))
          :effect (isholdingmotion #q9 #t1543 #q3 o8 #g0)
   )
   (:action s1560_plan-holding-motion
          :parameters (#q9 #q3 o9 #g1)
          :precondition (and (isconf #q9) (isconf #q3) (isgrasp o9 #g1))
          :effect (isholdingmotion #q9 #t1544 #q3 o9 #g1)
   )
   (:action s1561_plan-holding-motion
          :parameters (#q9 #q3 o8 #g2)
          :precondition (and (isconf #q9) (isconf #q3) (isgrasp o8 #g2))
          :effect (isholdingmotion #q9 #t1545 #q3 o8 #g2)
   )
   (:action s1562_plan-holding-motion
          :parameters (#q9 #q3 o8 #g3)
          :precondition (and (isconf #q9) (isconf #q3) (isgrasp o8 #g3))
          :effect (isholdingmotion #q9 #t1546 #q3 o8 #g3)
   )
   (:action s1563_plan-holding-motion
          :parameters (#q9 #q3 o9 #g4)
          :precondition (and (isconf #q9) (isconf #q3) (isgrasp o9 #g4))
          :effect (isholdingmotion #q9 #t1547 #q3 o9 #g4)
   )
   (:action s1564_plan-holding-motion
          :parameters (#q9 #q3 o9 #g5)
          :precondition (and (isconf #q9) (isconf #q3) (isgrasp o9 #g5))
          :effect (isholdingmotion #q9 #t1548 #q3 o9 #g5)
   )
   (:action s1565_plan-holding-motion
          :parameters (#q9 #q4 o8 #g0)
          :precondition (and (isconf #q9) (isconf #q4) (isgrasp o8 #g0))
          :effect (isholdingmotion #q9 #t1549 #q4 o8 #g0)
   )
   (:action s1566_plan-holding-motion
          :parameters (#q9 #q4 o9 #g1)
          :precondition (and (isconf #q9) (isconf #q4) (isgrasp o9 #g1))
          :effect (isholdingmotion #q9 #t1550 #q4 o9 #g1)
   )
   (:action s1567_plan-holding-motion
          :parameters (#q9 #q4 o8 #g2)
          :precondition (and (isconf #q9) (isconf #q4) (isgrasp o8 #g2))
          :effect (isholdingmotion #q9 #t1551 #q4 o8 #g2)
   )
   (:action s1568_plan-holding-motion
          :parameters (#q9 #q4 o8 #g3)
          :precondition (and (isconf #q9) (isconf #q4) (isgrasp o8 #g3))
          :effect (isholdingmotion #q9 #t1552 #q4 o8 #g3)
   )
   (:action s1569_plan-holding-motion
          :parameters (#q9 #q4 o9 #g4)
          :precondition (and (isconf #q9) (isconf #q4) (isgrasp o9 #g4))
          :effect (isholdingmotion #q9 #t1553 #q4 o9 #g4)
   )
   (:action s1570_plan-holding-motion
          :parameters (#q9 #q4 o9 #g5)
          :precondition (and (isconf #q9) (isconf #q4) (isgrasp o9 #g5))
          :effect (isholdingmotion #q9 #t1554 #q4 o9 #g5)
   )
   (:action s1571_plan-holding-motion
          :parameters (#q9 #q5 o8 #g0)
          :precondition (and (isconf #q9) (isconf #q5) (isgrasp o8 #g0))
          :effect (isholdingmotion #q9 #t1555 #q5 o8 #g0)
   )
   (:action s1572_plan-holding-motion
          :parameters (#q9 #q5 o9 #g1)
          :precondition (and (isconf #q9) (isconf #q5) (isgrasp o9 #g1))
          :effect (isholdingmotion #q9 #t1556 #q5 o9 #g1)
   )
   (:action s1573_plan-holding-motion
          :parameters (#q9 #q5 o8 #g2)
          :precondition (and (isconf #q9) (isconf #q5) (isgrasp o8 #g2))
          :effect (isholdingmotion #q9 #t1557 #q5 o8 #g2)
   )
   (:action s1574_plan-holding-motion
          :parameters (#q9 #q5 o8 #g3)
          :precondition (and (isconf #q9) (isconf #q5) (isgrasp o8 #g3))
          :effect (isholdingmotion #q9 #t1558 #q5 o8 #g3)
   )
   (:action s1575_plan-holding-motion
          :parameters (#q9 #q5 o9 #g4)
          :precondition (and (isconf #q9) (isconf #q5) (isgrasp o9 #g4))
          :effect (isholdingmotion #q9 #t1559 #q5 o9 #g4)
   )
   (:action s1576_plan-holding-motion
          :parameters (#q9 #q5 o9 #g5)
          :precondition (and (isconf #q9) (isconf #q5) (isgrasp o9 #g5))
          :effect (isholdingmotion #q9 #t1560 #q5 o9 #g5)
   )
   (:action s1577_plan-holding-motion
          :parameters (#q9 #q6 o8 #g0)
          :precondition (and (isconf #q9) (isconf #q6) (isgrasp o8 #g0))
          :effect (isholdingmotion #q9 #t1561 #q6 o8 #g0)
   )
   (:action s1578_plan-holding-motion
          :parameters (#q9 #q6 o9 #g1)
          :precondition (and (isconf #q9) (isconf #q6) (isgrasp o9 #g1))
          :effect (isholdingmotion #q9 #t1562 #q6 o9 #g1)
   )
   (:action s1579_plan-holding-motion
          :parameters (#q9 #q6 o8 #g2)
          :precondition (and (isconf #q9) (isconf #q6) (isgrasp o8 #g2))
          :effect (isholdingmotion #q9 #t1563 #q6 o8 #g2)
   )
   (:action s1580_plan-holding-motion
          :parameters (#q9 #q6 o8 #g3)
          :precondition (and (isconf #q9) (isconf #q6) (isgrasp o8 #g3))
          :effect (isholdingmotion #q9 #t1564 #q6 o8 #g3)
   )
   (:action s1581_plan-holding-motion
          :parameters (#q9 #q6 o9 #g4)
          :precondition (and (isconf #q9) (isconf #q6) (isgrasp o9 #g4))
          :effect (isholdingmotion #q9 #t1565 #q6 o9 #g4)
   )
   (:action s1582_plan-holding-motion
          :parameters (#q9 #q6 o9 #g5)
          :precondition (and (isconf #q9) (isconf #q6) (isgrasp o9 #g5))
          :effect (isholdingmotion #q9 #t1566 #q6 o9 #g5)
   )
   (:action s1583_plan-holding-motion
          :parameters (#q9 #q7 o8 #g0)
          :precondition (and (isconf #q9) (isconf #q7) (isgrasp o8 #g0))
          :effect (isholdingmotion #q9 #t1567 #q7 o8 #g0)
   )
   (:action s1584_plan-holding-motion
          :parameters (#q9 #q7 o9 #g1)
          :precondition (and (isconf #q9) (isconf #q7) (isgrasp o9 #g1))
          :effect (isholdingmotion #q9 #t1568 #q7 o9 #g1)
   )
   (:action s1585_plan-holding-motion
          :parameters (#q9 #q7 o8 #g2)
          :precondition (and (isconf #q9) (isconf #q7) (isgrasp o8 #g2))
          :effect (isholdingmotion #q9 #t1569 #q7 o8 #g2)
   )
   (:action s1586_plan-holding-motion
          :parameters (#q9 #q7 o8 #g3)
          :precondition (and (isconf #q9) (isconf #q7) (isgrasp o8 #g3))
          :effect (isholdingmotion #q9 #t1570 #q7 o8 #g3)
   )
   (:action s1587_plan-holding-motion
          :parameters (#q9 #q7 o9 #g4)
          :precondition (and (isconf #q9) (isconf #q7) (isgrasp o9 #g4))
          :effect (isholdingmotion #q9 #t1571 #q7 o9 #g4)
   )
   (:action s1588_plan-holding-motion
          :parameters (#q9 #q7 o9 #g5)
          :precondition (and (isconf #q9) (isconf #q7) (isgrasp o9 #g5))
          :effect (isholdingmotion #q9 #t1572 #q7 o9 #g5)
   )
   (:action s1589_plan-holding-motion
          :parameters (#q9 #q8 o8 #g0)
          :precondition (and (isconf #q9) (isconf #q8) (isgrasp o8 #g0))
          :effect (isholdingmotion #q9 #t1573 #q8 o8 #g0)
   )
   (:action s1590_plan-holding-motion
          :parameters (#q9 #q8 o9 #g1)
          :precondition (and (isconf #q9) (isconf #q8) (isgrasp o9 #g1))
          :effect (isholdingmotion #q9 #t1574 #q8 o9 #g1)
   )
   (:action s1591_plan-holding-motion
          :parameters (#q9 #q8 o8 #g2)
          :precondition (and (isconf #q9) (isconf #q8) (isgrasp o8 #g2))
          :effect (isholdingmotion #q9 #t1575 #q8 o8 #g2)
   )
   (:action s1592_plan-holding-motion
          :parameters (#q9 #q8 o8 #g3)
          :precondition (and (isconf #q9) (isconf #q8) (isgrasp o8 #g3))
          :effect (isholdingmotion #q9 #t1576 #q8 o8 #g3)
   )
   (:action s1593_plan-holding-motion
          :parameters (#q9 #q8 o9 #g4)
          :precondition (and (isconf #q9) (isconf #q8) (isgrasp o9 #g4))
          :effect (isholdingmotion #q9 #t1577 #q8 o9 #g4)
   )
   (:action s1594_plan-holding-motion
          :parameters (#q9 #q8 o9 #g5)
          :precondition (and (isconf #q9) (isconf #q8) (isgrasp o9 #g5))
          :effect (isholdingmotion #q9 #t1578 #q8 o9 #g5)
   )
   (:action s1595_plan-holding-motion
          :parameters (#q9 #q9 o8 #g0)
          :precondition (and (isconf #q9) (isconf #q9) (isgrasp o8 #g0))
          :effect (isholdingmotion #q9 #t1579 #q9 o8 #g0)
   )
   (:action s1596_plan-holding-motion
          :parameters (#q9 #q9 o9 #g1)
          :precondition (and (isconf #q9) (isconf #q9) (isgrasp o9 #g1))
          :effect (isholdingmotion #q9 #t1580 #q9 o9 #g1)
   )
   (:action s1597_plan-holding-motion
          :parameters (#q9 #q9 o8 #g2)
          :precondition (and (isconf #q9) (isconf #q9) (isgrasp o8 #g2))
          :effect (isholdingmotion #q9 #t1581 #q9 o8 #g2)
   )
   (:action s1598_plan-holding-motion
          :parameters (#q9 #q9 o8 #g3)
          :precondition (and (isconf #q9) (isconf #q9) (isgrasp o8 #g3))
          :effect (isholdingmotion #q9 #t1582 #q9 o8 #g3)
   )
   (:action s1599_plan-holding-motion
          :parameters (#q9 #q9 o9 #g4)
          :precondition (and (isconf #q9) (isconf #q9) (isgrasp o9 #g4))
          :effect (isholdingmotion #q9 #t1583 #q9 o9 #g4)
   )
   (:action s1600_plan-holding-motion
          :parameters (#q9 #q9 o9 #g5)
          :precondition (and (isconf #q9) (isconf #q9) (isgrasp o9 #g5))
          :effect (isholdingmotion #q9 #t1584 #q9 o9 #g5)
   )
   (:action s1601_plan-holding-motion
          :parameters (#q9 #q10 o8 #g0)
          :precondition (and (isconf #q9) (isconf #q10) (isgrasp o8 #g0))
          :effect (isholdingmotion #q9 #t1585 #q10 o8 #g0)
   )
   (:action s1602_plan-holding-motion
          :parameters (#q9 #q10 o9 #g1)
          :precondition (and (isconf #q9) (isconf #q10) (isgrasp o9 #g1))
          :effect (isholdingmotion #q9 #t1586 #q10 o9 #g1)
   )
   (:action s1603_plan-holding-motion
          :parameters (#q9 #q10 o8 #g2)
          :precondition (and (isconf #q9) (isconf #q10) (isgrasp o8 #g2))
          :effect (isholdingmotion #q9 #t1587 #q10 o8 #g2)
   )
   (:action s1604_plan-holding-motion
          :parameters (#q9 #q10 o8 #g3)
          :precondition (and (isconf #q9) (isconf #q10) (isgrasp o8 #g3))
          :effect (isholdingmotion #q9 #t1588 #q10 o8 #g3)
   )
   (:action s1605_plan-holding-motion
          :parameters (#q9 #q10 o9 #g4)
          :precondition (and (isconf #q9) (isconf #q10) (isgrasp o9 #g4))
          :effect (isholdingmotion #q9 #t1589 #q10 o9 #g4)
   )
   (:action s1606_plan-holding-motion
          :parameters (#q9 #q10 o9 #g5)
          :precondition (and (isconf #q9) (isconf #q10) (isgrasp o9 #g5))
          :effect (isholdingmotion #q9 #t1590 #q10 o9 #g5)
   )
   (:action s1607_plan-holding-motion
          :parameters (#q9 #q11 o8 #g0)
          :precondition (and (isconf #q9) (isconf #q11) (isgrasp o8 #g0))
          :effect (isholdingmotion #q9 #t1591 #q11 o8 #g0)
   )
   (:action s1608_plan-holding-motion
          :parameters (#q9 #q11 o9 #g1)
          :precondition (and (isconf #q9) (isconf #q11) (isgrasp o9 #g1))
          :effect (isholdingmotion #q9 #t1592 #q11 o9 #g1)
   )
   (:action s1609_plan-holding-motion
          :parameters (#q9 #q11 o8 #g2)
          :precondition (and (isconf #q9) (isconf #q11) (isgrasp o8 #g2))
          :effect (isholdingmotion #q9 #t1593 #q11 o8 #g2)
   )
   (:action s1610_plan-holding-motion
          :parameters (#q9 #q11 o8 #g3)
          :precondition (and (isconf #q9) (isconf #q11) (isgrasp o8 #g3))
          :effect (isholdingmotion #q9 #t1594 #q11 o8 #g3)
   )
   (:action s1611_plan-holding-motion
          :parameters (#q9 #q11 o9 #g4)
          :precondition (and (isconf #q9) (isconf #q11) (isgrasp o9 #g4))
          :effect (isholdingmotion #q9 #t1595 #q11 o9 #g4)
   )
   (:action s1612_plan-holding-motion
          :parameters (#q9 #q11 o9 #g5)
          :precondition (and (isconf #q9) (isconf #q11) (isgrasp o9 #g5))
          :effect (isholdingmotion #q9 #t1596 #q11 o9 #g5)
   )
   (:action s1613_plan-holding-motion
          :parameters (#q9 #q12 o8 #g0)
          :precondition (and (isconf #q9) (isconf #q12) (isgrasp o8 #g0))
          :effect (isholdingmotion #q9 #t1597 #q12 o8 #g0)
   )
   (:action s1614_plan-holding-motion
          :parameters (#q9 #q12 o9 #g1)
          :precondition (and (isconf #q9) (isconf #q12) (isgrasp o9 #g1))
          :effect (isholdingmotion #q9 #t1598 #q12 o9 #g1)
   )
   (:action s1615_plan-holding-motion
          :parameters (#q9 #q12 o8 #g2)
          :precondition (and (isconf #q9) (isconf #q12) (isgrasp o8 #g2))
          :effect (isholdingmotion #q9 #t1599 #q12 o8 #g2)
   )
   (:action s1616_plan-holding-motion
          :parameters (#q9 #q12 o8 #g3)
          :precondition (and (isconf #q9) (isconf #q12) (isgrasp o8 #g3))
          :effect (isholdingmotion #q9 #t1600 #q12 o8 #g3)
   )
   (:action s1617_plan-holding-motion
          :parameters (#q9 #q12 o9 #g4)
          :precondition (and (isconf #q9) (isconf #q12) (isgrasp o9 #g4))
          :effect (isholdingmotion #q9 #t1601 #q12 o9 #g4)
   )
   (:action s1618_plan-holding-motion
          :parameters (#q9 #q12 o9 #g5)
          :precondition (and (isconf #q9) (isconf #q12) (isgrasp o9 #g5))
          :effect (isholdingmotion #q9 #t1602 #q12 o9 #g5)
   )
   (:action s1619_plan-holding-motion
          :parameters (#q9 #q13 o8 #g0)
          :precondition (and (isconf #q9) (isconf #q13) (isgrasp o8 #g0))
          :effect (isholdingmotion #q9 #t1603 #q13 o8 #g0)
   )
   (:action s1620_plan-holding-motion
          :parameters (#q9 #q13 o9 #g1)
          :precondition (and (isconf #q9) (isconf #q13) (isgrasp o9 #g1))
          :effect (isholdingmotion #q9 #t1604 #q13 o9 #g1)
   )
   (:action s1621_plan-holding-motion
          :parameters (#q9 #q13 o8 #g2)
          :precondition (and (isconf #q9) (isconf #q13) (isgrasp o8 #g2))
          :effect (isholdingmotion #q9 #t1605 #q13 o8 #g2)
   )
   (:action s1622_plan-holding-motion
          :parameters (#q9 #q13 o8 #g3)
          :precondition (and (isconf #q9) (isconf #q13) (isgrasp o8 #g3))
          :effect (isholdingmotion #q9 #t1606 #q13 o8 #g3)
   )
   (:action s1623_plan-holding-motion
          :parameters (#q9 #q13 o9 #g4)
          :precondition (and (isconf #q9) (isconf #q13) (isgrasp o9 #g4))
          :effect (isholdingmotion #q9 #t1607 #q13 o9 #g4)
   )
   (:action s1624_plan-holding-motion
          :parameters (#q9 #q13 o9 #g5)
          :precondition (and (isconf #q9) (isconf #q13) (isgrasp o9 #g5))
          :effect (isholdingmotion #q9 #t1608 #q13 o9 #g5)
   )
   (:action s1625_plan-holding-motion
          :parameters (#q9 #q14 o8 #g0)
          :precondition (and (isconf #q9) (isconf #q14) (isgrasp o8 #g0))
          :effect (isholdingmotion #q9 #t1609 #q14 o8 #g0)
   )
   (:action s1626_plan-holding-motion
          :parameters (#q9 #q14 o9 #g1)
          :precondition (and (isconf #q9) (isconf #q14) (isgrasp o9 #g1))
          :effect (isholdingmotion #q9 #t1610 #q14 o9 #g1)
   )
   (:action s1627_plan-holding-motion
          :parameters (#q9 #q14 o8 #g2)
          :precondition (and (isconf #q9) (isconf #q14) (isgrasp o8 #g2))
          :effect (isholdingmotion #q9 #t1611 #q14 o8 #g2)
   )
   (:action s1628_plan-holding-motion
          :parameters (#q9 #q14 o8 #g3)
          :precondition (and (isconf #q9) (isconf #q14) (isgrasp o8 #g3))
          :effect (isholdingmotion #q9 #t1612 #q14 o8 #g3)
   )
   (:action s1629_plan-holding-motion
          :parameters (#q9 #q14 o9 #g4)
          :precondition (and (isconf #q9) (isconf #q14) (isgrasp o9 #g4))
          :effect (isholdingmotion #q9 #t1613 #q14 o9 #g4)
   )
   (:action s1630_plan-holding-motion
          :parameters (#q9 #q14 o9 #g5)
          :precondition (and (isconf #q9) (isconf #q14) (isgrasp o9 #g5))
          :effect (isholdingmotion #q9 #t1614 #q14 o9 #g5)
   )
   (:action s1631_plan-holding-motion
          :parameters (#q9 #q15 o8 #g0)
          :precondition (and (isconf #q9) (isconf #q15) (isgrasp o8 #g0))
          :effect (isholdingmotion #q9 #t1615 #q15 o8 #g0)
   )
   (:action s1632_plan-holding-motion
          :parameters (#q9 #q15 o9 #g1)
          :precondition (and (isconf #q9) (isconf #q15) (isgrasp o9 #g1))
          :effect (isholdingmotion #q9 #t1616 #q15 o9 #g1)
   )
   (:action s1633_plan-holding-motion
          :parameters (#q9 #q15 o8 #g2)
          :precondition (and (isconf #q9) (isconf #q15) (isgrasp o8 #g2))
          :effect (isholdingmotion #q9 #t1617 #q15 o8 #g2)
   )
   (:action s1634_plan-holding-motion
          :parameters (#q9 #q15 o8 #g3)
          :precondition (and (isconf #q9) (isconf #q15) (isgrasp o8 #g3))
          :effect (isholdingmotion #q9 #t1618 #q15 o8 #g3)
   )
   (:action s1635_plan-holding-motion
          :parameters (#q9 #q15 o9 #g4)
          :precondition (and (isconf #q9) (isconf #q15) (isgrasp o9 #g4))
          :effect (isholdingmotion #q9 #t1619 #q15 o9 #g4)
   )
   (:action s1636_plan-holding-motion
          :parameters (#q9 #q15 o9 #g5)
          :precondition (and (isconf #q9) (isconf #q15) (isgrasp o9 #g5))
          :effect (isholdingmotion #q9 #t1620 #q15 o9 #g5)
   )
   (:action s1637_plan-holding-motion
          :parameters (#q9 #q16 o8 #g0)
          :precondition (and (isconf #q9) (isconf #q16) (isgrasp o8 #g0))
          :effect (isholdingmotion #q9 #t1621 #q16 o8 #g0)
   )
   (:action s1638_plan-holding-motion
          :parameters (#q9 #q16 o9 #g1)
          :precondition (and (isconf #q9) (isconf #q16) (isgrasp o9 #g1))
          :effect (isholdingmotion #q9 #t1622 #q16 o9 #g1)
   )
   (:action s1639_plan-holding-motion
          :parameters (#q9 #q16 o8 #g2)
          :precondition (and (isconf #q9) (isconf #q16) (isgrasp o8 #g2))
          :effect (isholdingmotion #q9 #t1623 #q16 o8 #g2)
   )
   (:action s1640_plan-holding-motion
          :parameters (#q9 #q16 o8 #g3)
          :precondition (and (isconf #q9) (isconf #q16) (isgrasp o8 #g3))
          :effect (isholdingmotion #q9 #t1624 #q16 o8 #g3)
   )
   (:action s1641_plan-holding-motion
          :parameters (#q9 #q16 o9 #g4)
          :precondition (and (isconf #q9) (isconf #q16) (isgrasp o9 #g4))
          :effect (isholdingmotion #q9 #t1625 #q16 o9 #g4)
   )
   (:action s1642_plan-holding-motion
          :parameters (#q9 #q16 o9 #g5)
          :precondition (and (isconf #q9) (isconf #q16) (isgrasp o9 #g5))
          :effect (isholdingmotion #q9 #t1626 #q16 o9 #g5)
   )
   (:action s1643_plan-holding-motion
          :parameters (#q9 #q17 o8 #g0)
          :precondition (and (isconf #q9) (isconf #q17) (isgrasp o8 #g0))
          :effect (isholdingmotion #q9 #t1627 #q17 o8 #g0)
   )
   (:action s1644_plan-holding-motion
          :parameters (#q9 #q17 o9 #g1)
          :precondition (and (isconf #q9) (isconf #q17) (isgrasp o9 #g1))
          :effect (isholdingmotion #q9 #t1628 #q17 o9 #g1)
   )
   (:action s1645_plan-holding-motion
          :parameters (#q9 #q17 o8 #g2)
          :precondition (and (isconf #q9) (isconf #q17) (isgrasp o8 #g2))
          :effect (isholdingmotion #q9 #t1629 #q17 o8 #g2)
   )
   (:action s1646_plan-holding-motion
          :parameters (#q9 #q17 o8 #g3)
          :precondition (and (isconf #q9) (isconf #q17) (isgrasp o8 #g3))
          :effect (isholdingmotion #q9 #t1630 #q17 o8 #g3)
   )
   (:action s1647_plan-holding-motion
          :parameters (#q9 #q17 o9 #g4)
          :precondition (and (isconf #q9) (isconf #q17) (isgrasp o9 #g4))
          :effect (isholdingmotion #q9 #t1631 #q17 o9 #g4)
   )
   (:action s1648_plan-holding-motion
          :parameters (#q9 #q17 o9 #g5)
          :precondition (and (isconf #q9) (isconf #q17) (isgrasp o9 #g5))
          :effect (isholdingmotion #q9 #t1632 #q17 o9 #g5)
   )
   (:action s1649_plan-holding-motion
          :parameters (#q10 q808 o8 #g0)
          :precondition (and (isconf #q10) (isconf q808) (isgrasp o8 #g0))
          :effect (isholdingmotion #q10 #t1633 q808 o8 #g0)
   )
   (:action s1650_plan-holding-motion
          :parameters (#q10 q808 o9 #g1)
          :precondition (and (isconf #q10) (isconf q808) (isgrasp o9 #g1))
          :effect (isholdingmotion #q10 #t1634 q808 o9 #g1)
   )
   (:action s1651_plan-holding-motion
          :parameters (#q10 q808 o8 #g2)
          :precondition (and (isconf #q10) (isconf q808) (isgrasp o8 #g2))
          :effect (isholdingmotion #q10 #t1635 q808 o8 #g2)
   )
   (:action s1652_plan-holding-motion
          :parameters (#q10 q808 o8 #g3)
          :precondition (and (isconf #q10) (isconf q808) (isgrasp o8 #g3))
          :effect (isholdingmotion #q10 #t1636 q808 o8 #g3)
   )
   (:action s1653_plan-holding-motion
          :parameters (#q10 q808 o9 #g4)
          :precondition (and (isconf #q10) (isconf q808) (isgrasp o9 #g4))
          :effect (isholdingmotion #q10 #t1637 q808 o9 #g4)
   )
   (:action s1654_plan-holding-motion
          :parameters (#q10 q808 o9 #g5)
          :precondition (and (isconf #q10) (isconf q808) (isgrasp o9 #g5))
          :effect (isholdingmotion #q10 #t1638 q808 o9 #g5)
   )
   (:action s1655_plan-holding-motion
          :parameters (#q10 #q0 o8 #g0)
          :precondition (and (isconf #q10) (isconf #q0) (isgrasp o8 #g0))
          :effect (isholdingmotion #q10 #t1639 #q0 o8 #g0)
   )
   (:action s1656_plan-holding-motion
          :parameters (#q10 #q0 o9 #g1)
          :precondition (and (isconf #q10) (isconf #q0) (isgrasp o9 #g1))
          :effect (isholdingmotion #q10 #t1640 #q0 o9 #g1)
   )
   (:action s1657_plan-holding-motion
          :parameters (#q10 #q0 o8 #g2)
          :precondition (and (isconf #q10) (isconf #q0) (isgrasp o8 #g2))
          :effect (isholdingmotion #q10 #t1641 #q0 o8 #g2)
   )
   (:action s1658_plan-holding-motion
          :parameters (#q10 #q0 o8 #g3)
          :precondition (and (isconf #q10) (isconf #q0) (isgrasp o8 #g3))
          :effect (isholdingmotion #q10 #t1642 #q0 o8 #g3)
   )
   (:action s1659_plan-holding-motion
          :parameters (#q10 #q0 o9 #g4)
          :precondition (and (isconf #q10) (isconf #q0) (isgrasp o9 #g4))
          :effect (isholdingmotion #q10 #t1643 #q0 o9 #g4)
   )
   (:action s1660_plan-holding-motion
          :parameters (#q10 #q0 o9 #g5)
          :precondition (and (isconf #q10) (isconf #q0) (isgrasp o9 #g5))
          :effect (isholdingmotion #q10 #t1644 #q0 o9 #g5)
   )
   (:action s1661_plan-holding-motion
          :parameters (#q10 #q1 o8 #g0)
          :precondition (and (isconf #q10) (isconf #q1) (isgrasp o8 #g0))
          :effect (isholdingmotion #q10 #t1645 #q1 o8 #g0)
   )
   (:action s1662_plan-holding-motion
          :parameters (#q10 #q1 o9 #g1)
          :precondition (and (isconf #q10) (isconf #q1) (isgrasp o9 #g1))
          :effect (isholdingmotion #q10 #t1646 #q1 o9 #g1)
   )
   (:action s1663_plan-holding-motion
          :parameters (#q10 #q1 o8 #g2)
          :precondition (and (isconf #q10) (isconf #q1) (isgrasp o8 #g2))
          :effect (isholdingmotion #q10 #t1647 #q1 o8 #g2)
   )
   (:action s1664_plan-holding-motion
          :parameters (#q10 #q1 o8 #g3)
          :precondition (and (isconf #q10) (isconf #q1) (isgrasp o8 #g3))
          :effect (isholdingmotion #q10 #t1648 #q1 o8 #g3)
   )
   (:action s1665_plan-holding-motion
          :parameters (#q10 #q1 o9 #g4)
          :precondition (and (isconf #q10) (isconf #q1) (isgrasp o9 #g4))
          :effect (isholdingmotion #q10 #t1649 #q1 o9 #g4)
   )
   (:action s1666_plan-holding-motion
          :parameters (#q10 #q1 o9 #g5)
          :precondition (and (isconf #q10) (isconf #q1) (isgrasp o9 #g5))
          :effect (isholdingmotion #q10 #t1650 #q1 o9 #g5)
   )
   (:action s1667_plan-holding-motion
          :parameters (#q10 #q2 o8 #g0)
          :precondition (and (isconf #q10) (isconf #q2) (isgrasp o8 #g0))
          :effect (isholdingmotion #q10 #t1651 #q2 o8 #g0)
   )
   (:action s1668_plan-holding-motion
          :parameters (#q10 #q2 o9 #g1)
          :precondition (and (isconf #q10) (isconf #q2) (isgrasp o9 #g1))
          :effect (isholdingmotion #q10 #t1652 #q2 o9 #g1)
   )
   (:action s1669_plan-holding-motion
          :parameters (#q10 #q2 o8 #g2)
          :precondition (and (isconf #q10) (isconf #q2) (isgrasp o8 #g2))
          :effect (isholdingmotion #q10 #t1653 #q2 o8 #g2)
   )
   (:action s1670_plan-holding-motion
          :parameters (#q10 #q2 o8 #g3)
          :precondition (and (isconf #q10) (isconf #q2) (isgrasp o8 #g3))
          :effect (isholdingmotion #q10 #t1654 #q2 o8 #g3)
   )
   (:action s1671_plan-holding-motion
          :parameters (#q10 #q2 o9 #g4)
          :precondition (and (isconf #q10) (isconf #q2) (isgrasp o9 #g4))
          :effect (isholdingmotion #q10 #t1655 #q2 o9 #g4)
   )
   (:action s1672_plan-holding-motion
          :parameters (#q10 #q2 o9 #g5)
          :precondition (and (isconf #q10) (isconf #q2) (isgrasp o9 #g5))
          :effect (isholdingmotion #q10 #t1656 #q2 o9 #g5)
   )
   (:action s1673_plan-holding-motion
          :parameters (#q10 #q3 o8 #g0)
          :precondition (and (isconf #q10) (isconf #q3) (isgrasp o8 #g0))
          :effect (isholdingmotion #q10 #t1657 #q3 o8 #g0)
   )
   (:action s1674_plan-holding-motion
          :parameters (#q10 #q3 o9 #g1)
          :precondition (and (isconf #q10) (isconf #q3) (isgrasp o9 #g1))
          :effect (isholdingmotion #q10 #t1658 #q3 o9 #g1)
   )
   (:action s1675_plan-holding-motion
          :parameters (#q10 #q3 o8 #g2)
          :precondition (and (isconf #q10) (isconf #q3) (isgrasp o8 #g2))
          :effect (isholdingmotion #q10 #t1659 #q3 o8 #g2)
   )
   (:action s1676_plan-holding-motion
          :parameters (#q10 #q3 o8 #g3)
          :precondition (and (isconf #q10) (isconf #q3) (isgrasp o8 #g3))
          :effect (isholdingmotion #q10 #t1660 #q3 o8 #g3)
   )
   (:action s1677_plan-holding-motion
          :parameters (#q10 #q3 o9 #g4)
          :precondition (and (isconf #q10) (isconf #q3) (isgrasp o9 #g4))
          :effect (isholdingmotion #q10 #t1661 #q3 o9 #g4)
   )
   (:action s1678_plan-holding-motion
          :parameters (#q10 #q3 o9 #g5)
          :precondition (and (isconf #q10) (isconf #q3) (isgrasp o9 #g5))
          :effect (isholdingmotion #q10 #t1662 #q3 o9 #g5)
   )
   (:action s1679_plan-holding-motion
          :parameters (#q10 #q4 o8 #g0)
          :precondition (and (isconf #q10) (isconf #q4) (isgrasp o8 #g0))
          :effect (isholdingmotion #q10 #t1663 #q4 o8 #g0)
   )
   (:action s1680_plan-holding-motion
          :parameters (#q10 #q4 o9 #g1)
          :precondition (and (isconf #q10) (isconf #q4) (isgrasp o9 #g1))
          :effect (isholdingmotion #q10 #t1664 #q4 o9 #g1)
   )
   (:action s1681_plan-holding-motion
          :parameters (#q10 #q4 o8 #g2)
          :precondition (and (isconf #q10) (isconf #q4) (isgrasp o8 #g2))
          :effect (isholdingmotion #q10 #t1665 #q4 o8 #g2)
   )
   (:action s1682_plan-holding-motion
          :parameters (#q10 #q4 o8 #g3)
          :precondition (and (isconf #q10) (isconf #q4) (isgrasp o8 #g3))
          :effect (isholdingmotion #q10 #t1666 #q4 o8 #g3)
   )
   (:action s1683_plan-holding-motion
          :parameters (#q10 #q4 o9 #g4)
          :precondition (and (isconf #q10) (isconf #q4) (isgrasp o9 #g4))
          :effect (isholdingmotion #q10 #t1667 #q4 o9 #g4)
   )
   (:action s1684_plan-holding-motion
          :parameters (#q10 #q4 o9 #g5)
          :precondition (and (isconf #q10) (isconf #q4) (isgrasp o9 #g5))
          :effect (isholdingmotion #q10 #t1668 #q4 o9 #g5)
   )
   (:action s1685_plan-holding-motion
          :parameters (#q10 #q5 o8 #g0)
          :precondition (and (isconf #q10) (isconf #q5) (isgrasp o8 #g0))
          :effect (isholdingmotion #q10 #t1669 #q5 o8 #g0)
   )
   (:action s1686_plan-holding-motion
          :parameters (#q10 #q5 o9 #g1)
          :precondition (and (isconf #q10) (isconf #q5) (isgrasp o9 #g1))
          :effect (isholdingmotion #q10 #t1670 #q5 o9 #g1)
   )
   (:action s1687_plan-holding-motion
          :parameters (#q10 #q5 o8 #g2)
          :precondition (and (isconf #q10) (isconf #q5) (isgrasp o8 #g2))
          :effect (isholdingmotion #q10 #t1671 #q5 o8 #g2)
   )
   (:action s1688_plan-holding-motion
          :parameters (#q10 #q5 o8 #g3)
          :precondition (and (isconf #q10) (isconf #q5) (isgrasp o8 #g3))
          :effect (isholdingmotion #q10 #t1672 #q5 o8 #g3)
   )
   (:action s1689_plan-holding-motion
          :parameters (#q10 #q5 o9 #g4)
          :precondition (and (isconf #q10) (isconf #q5) (isgrasp o9 #g4))
          :effect (isholdingmotion #q10 #t1673 #q5 o9 #g4)
   )
   (:action s1690_plan-holding-motion
          :parameters (#q10 #q5 o9 #g5)
          :precondition (and (isconf #q10) (isconf #q5) (isgrasp o9 #g5))
          :effect (isholdingmotion #q10 #t1674 #q5 o9 #g5)
   )
   (:action s1691_plan-holding-motion
          :parameters (#q10 #q6 o8 #g0)
          :precondition (and (isconf #q10) (isconf #q6) (isgrasp o8 #g0))
          :effect (isholdingmotion #q10 #t1675 #q6 o8 #g0)
   )
   (:action s1692_plan-holding-motion
          :parameters (#q10 #q6 o9 #g1)
          :precondition (and (isconf #q10) (isconf #q6) (isgrasp o9 #g1))
          :effect (isholdingmotion #q10 #t1676 #q6 o9 #g1)
   )
   (:action s1693_plan-holding-motion
          :parameters (#q10 #q6 o8 #g2)
          :precondition (and (isconf #q10) (isconf #q6) (isgrasp o8 #g2))
          :effect (isholdingmotion #q10 #t1677 #q6 o8 #g2)
   )
   (:action s1694_plan-holding-motion
          :parameters (#q10 #q6 o8 #g3)
          :precondition (and (isconf #q10) (isconf #q6) (isgrasp o8 #g3))
          :effect (isholdingmotion #q10 #t1678 #q6 o8 #g3)
   )
   (:action s1695_plan-holding-motion
          :parameters (#q10 #q6 o9 #g4)
          :precondition (and (isconf #q10) (isconf #q6) (isgrasp o9 #g4))
          :effect (isholdingmotion #q10 #t1679 #q6 o9 #g4)
   )
   (:action s1696_plan-holding-motion
          :parameters (#q10 #q6 o9 #g5)
          :precondition (and (isconf #q10) (isconf #q6) (isgrasp o9 #g5))
          :effect (isholdingmotion #q10 #t1680 #q6 o9 #g5)
   )
   (:action s1697_plan-holding-motion
          :parameters (#q10 #q7 o8 #g0)
          :precondition (and (isconf #q10) (isconf #q7) (isgrasp o8 #g0))
          :effect (isholdingmotion #q10 #t1681 #q7 o8 #g0)
   )
   (:action s1698_plan-holding-motion
          :parameters (#q10 #q7 o9 #g1)
          :precondition (and (isconf #q10) (isconf #q7) (isgrasp o9 #g1))
          :effect (isholdingmotion #q10 #t1682 #q7 o9 #g1)
   )
   (:action s1699_plan-holding-motion
          :parameters (#q10 #q7 o8 #g2)
          :precondition (and (isconf #q10) (isconf #q7) (isgrasp o8 #g2))
          :effect (isholdingmotion #q10 #t1683 #q7 o8 #g2)
   )
   (:action s1700_plan-holding-motion
          :parameters (#q10 #q7 o8 #g3)
          :precondition (and (isconf #q10) (isconf #q7) (isgrasp o8 #g3))
          :effect (isholdingmotion #q10 #t1684 #q7 o8 #g3)
   )
   (:action s1701_plan-holding-motion
          :parameters (#q10 #q7 o9 #g4)
          :precondition (and (isconf #q10) (isconf #q7) (isgrasp o9 #g4))
          :effect (isholdingmotion #q10 #t1685 #q7 o9 #g4)
   )
   (:action s1702_plan-holding-motion
          :parameters (#q10 #q7 o9 #g5)
          :precondition (and (isconf #q10) (isconf #q7) (isgrasp o9 #g5))
          :effect (isholdingmotion #q10 #t1686 #q7 o9 #g5)
   )
   (:action s1703_plan-holding-motion
          :parameters (#q10 #q8 o8 #g0)
          :precondition (and (isconf #q10) (isconf #q8) (isgrasp o8 #g0))
          :effect (isholdingmotion #q10 #t1687 #q8 o8 #g0)
   )
   (:action s1704_plan-holding-motion
          :parameters (#q10 #q8 o9 #g1)
          :precondition (and (isconf #q10) (isconf #q8) (isgrasp o9 #g1))
          :effect (isholdingmotion #q10 #t1688 #q8 o9 #g1)
   )
   (:action s1705_plan-holding-motion
          :parameters (#q10 #q8 o8 #g2)
          :precondition (and (isconf #q10) (isconf #q8) (isgrasp o8 #g2))
          :effect (isholdingmotion #q10 #t1689 #q8 o8 #g2)
   )
   (:action s1706_plan-holding-motion
          :parameters (#q10 #q8 o8 #g3)
          :precondition (and (isconf #q10) (isconf #q8) (isgrasp o8 #g3))
          :effect (isholdingmotion #q10 #t1690 #q8 o8 #g3)
   )
   (:action s1707_plan-holding-motion
          :parameters (#q10 #q8 o9 #g4)
          :precondition (and (isconf #q10) (isconf #q8) (isgrasp o9 #g4))
          :effect (isholdingmotion #q10 #t1691 #q8 o9 #g4)
   )
   (:action s1708_plan-holding-motion
          :parameters (#q10 #q8 o9 #g5)
          :precondition (and (isconf #q10) (isconf #q8) (isgrasp o9 #g5))
          :effect (isholdingmotion #q10 #t1692 #q8 o9 #g5)
   )
   (:action s1709_plan-holding-motion
          :parameters (#q10 #q9 o8 #g0)
          :precondition (and (isconf #q10) (isconf #q9) (isgrasp o8 #g0))
          :effect (isholdingmotion #q10 #t1693 #q9 o8 #g0)
   )
   (:action s1710_plan-holding-motion
          :parameters (#q10 #q9 o9 #g1)
          :precondition (and (isconf #q10) (isconf #q9) (isgrasp o9 #g1))
          :effect (isholdingmotion #q10 #t1694 #q9 o9 #g1)
   )
   (:action s1711_plan-holding-motion
          :parameters (#q10 #q9 o8 #g2)
          :precondition (and (isconf #q10) (isconf #q9) (isgrasp o8 #g2))
          :effect (isholdingmotion #q10 #t1695 #q9 o8 #g2)
   )
   (:action s1712_plan-holding-motion
          :parameters (#q10 #q9 o8 #g3)
          :precondition (and (isconf #q10) (isconf #q9) (isgrasp o8 #g3))
          :effect (isholdingmotion #q10 #t1696 #q9 o8 #g3)
   )
   (:action s1713_plan-holding-motion
          :parameters (#q10 #q9 o9 #g4)
          :precondition (and (isconf #q10) (isconf #q9) (isgrasp o9 #g4))
          :effect (isholdingmotion #q10 #t1697 #q9 o9 #g4)
   )
   (:action s1714_plan-holding-motion
          :parameters (#q10 #q9 o9 #g5)
          :precondition (and (isconf #q10) (isconf #q9) (isgrasp o9 #g5))
          :effect (isholdingmotion #q10 #t1698 #q9 o9 #g5)
   )
   (:action s1715_plan-holding-motion
          :parameters (#q10 #q10 o8 #g0)
          :precondition (and (isconf #q10) (isconf #q10) (isgrasp o8 #g0))
          :effect (isholdingmotion #q10 #t1699 #q10 o8 #g0)
   )
   (:action s1716_plan-holding-motion
          :parameters (#q10 #q10 o9 #g1)
          :precondition (and (isconf #q10) (isconf #q10) (isgrasp o9 #g1))
          :effect (isholdingmotion #q10 #t1700 #q10 o9 #g1)
   )
   (:action s1717_plan-holding-motion
          :parameters (#q10 #q10 o8 #g2)
          :precondition (and (isconf #q10) (isconf #q10) (isgrasp o8 #g2))
          :effect (isholdingmotion #q10 #t1701 #q10 o8 #g2)
   )
   (:action s1718_plan-holding-motion
          :parameters (#q10 #q10 o8 #g3)
          :precondition (and (isconf #q10) (isconf #q10) (isgrasp o8 #g3))
          :effect (isholdingmotion #q10 #t1702 #q10 o8 #g3)
   )
   (:action s1719_plan-holding-motion
          :parameters (#q10 #q10 o9 #g4)
          :precondition (and (isconf #q10) (isconf #q10) (isgrasp o9 #g4))
          :effect (isholdingmotion #q10 #t1703 #q10 o9 #g4)
   )
   (:action s1720_plan-holding-motion
          :parameters (#q10 #q10 o9 #g5)
          :precondition (and (isconf #q10) (isconf #q10) (isgrasp o9 #g5))
          :effect (isholdingmotion #q10 #t1704 #q10 o9 #g5)
   )
   (:action s1721_plan-holding-motion
          :parameters (#q10 #q11 o8 #g0)
          :precondition (and (isconf #q10) (isconf #q11) (isgrasp o8 #g0))
          :effect (isholdingmotion #q10 #t1705 #q11 o8 #g0)
   )
   (:action s1722_plan-holding-motion
          :parameters (#q10 #q11 o9 #g1)
          :precondition (and (isconf #q10) (isconf #q11) (isgrasp o9 #g1))
          :effect (isholdingmotion #q10 #t1706 #q11 o9 #g1)
   )
   (:action s1723_plan-holding-motion
          :parameters (#q10 #q11 o8 #g2)
          :precondition (and (isconf #q10) (isconf #q11) (isgrasp o8 #g2))
          :effect (isholdingmotion #q10 #t1707 #q11 o8 #g2)
   )
   (:action s1724_plan-holding-motion
          :parameters (#q10 #q11 o8 #g3)
          :precondition (and (isconf #q10) (isconf #q11) (isgrasp o8 #g3))
          :effect (isholdingmotion #q10 #t1708 #q11 o8 #g3)
   )
   (:action s1725_plan-holding-motion
          :parameters (#q10 #q11 o9 #g4)
          :precondition (and (isconf #q10) (isconf #q11) (isgrasp o9 #g4))
          :effect (isholdingmotion #q10 #t1709 #q11 o9 #g4)
   )
   (:action s1726_plan-holding-motion
          :parameters (#q10 #q11 o9 #g5)
          :precondition (and (isconf #q10) (isconf #q11) (isgrasp o9 #g5))
          :effect (isholdingmotion #q10 #t1710 #q11 o9 #g5)
   )
   (:action s1727_plan-holding-motion
          :parameters (#q10 #q12 o8 #g0)
          :precondition (and (isconf #q10) (isconf #q12) (isgrasp o8 #g0))
          :effect (isholdingmotion #q10 #t1711 #q12 o8 #g0)
   )
   (:action s1728_plan-holding-motion
          :parameters (#q10 #q12 o9 #g1)
          :precondition (and (isconf #q10) (isconf #q12) (isgrasp o9 #g1))
          :effect (isholdingmotion #q10 #t1712 #q12 o9 #g1)
   )
   (:action s1729_plan-holding-motion
          :parameters (#q10 #q12 o8 #g2)
          :precondition (and (isconf #q10) (isconf #q12) (isgrasp o8 #g2))
          :effect (isholdingmotion #q10 #t1713 #q12 o8 #g2)
   )
   (:action s1730_plan-holding-motion
          :parameters (#q10 #q12 o8 #g3)
          :precondition (and (isconf #q10) (isconf #q12) (isgrasp o8 #g3))
          :effect (isholdingmotion #q10 #t1714 #q12 o8 #g3)
   )
   (:action s1731_plan-holding-motion
          :parameters (#q10 #q12 o9 #g4)
          :precondition (and (isconf #q10) (isconf #q12) (isgrasp o9 #g4))
          :effect (isholdingmotion #q10 #t1715 #q12 o9 #g4)
   )
   (:action s1732_plan-holding-motion
          :parameters (#q10 #q12 o9 #g5)
          :precondition (and (isconf #q10) (isconf #q12) (isgrasp o9 #g5))
          :effect (isholdingmotion #q10 #t1716 #q12 o9 #g5)
   )
   (:action s1733_plan-holding-motion
          :parameters (#q10 #q13 o8 #g0)
          :precondition (and (isconf #q10) (isconf #q13) (isgrasp o8 #g0))
          :effect (isholdingmotion #q10 #t1717 #q13 o8 #g0)
   )
   (:action s1734_plan-holding-motion
          :parameters (#q10 #q13 o9 #g1)
          :precondition (and (isconf #q10) (isconf #q13) (isgrasp o9 #g1))
          :effect (isholdingmotion #q10 #t1718 #q13 o9 #g1)
   )
   (:action s1735_plan-holding-motion
          :parameters (#q10 #q13 o8 #g2)
          :precondition (and (isconf #q10) (isconf #q13) (isgrasp o8 #g2))
          :effect (isholdingmotion #q10 #t1719 #q13 o8 #g2)
   )
   (:action s1736_plan-holding-motion
          :parameters (#q10 #q13 o8 #g3)
          :precondition (and (isconf #q10) (isconf #q13) (isgrasp o8 #g3))
          :effect (isholdingmotion #q10 #t1720 #q13 o8 #g3)
   )
   (:action s1737_plan-holding-motion
          :parameters (#q10 #q13 o9 #g4)
          :precondition (and (isconf #q10) (isconf #q13) (isgrasp o9 #g4))
          :effect (isholdingmotion #q10 #t1721 #q13 o9 #g4)
   )
   (:action s1738_plan-holding-motion
          :parameters (#q10 #q13 o9 #g5)
          :precondition (and (isconf #q10) (isconf #q13) (isgrasp o9 #g5))
          :effect (isholdingmotion #q10 #t1722 #q13 o9 #g5)
   )
   (:action s1739_plan-holding-motion
          :parameters (#q10 #q14 o8 #g0)
          :precondition (and (isconf #q10) (isconf #q14) (isgrasp o8 #g0))
          :effect (isholdingmotion #q10 #t1723 #q14 o8 #g0)
   )
   (:action s1740_plan-holding-motion
          :parameters (#q10 #q14 o9 #g1)
          :precondition (and (isconf #q10) (isconf #q14) (isgrasp o9 #g1))
          :effect (isholdingmotion #q10 #t1724 #q14 o9 #g1)
   )
   (:action s1741_plan-holding-motion
          :parameters (#q10 #q14 o8 #g2)
          :precondition (and (isconf #q10) (isconf #q14) (isgrasp o8 #g2))
          :effect (isholdingmotion #q10 #t1725 #q14 o8 #g2)
   )
   (:action s1742_plan-holding-motion
          :parameters (#q10 #q14 o8 #g3)
          :precondition (and (isconf #q10) (isconf #q14) (isgrasp o8 #g3))
          :effect (isholdingmotion #q10 #t1726 #q14 o8 #g3)
   )
   (:action s1743_plan-holding-motion
          :parameters (#q10 #q14 o9 #g4)
          :precondition (and (isconf #q10) (isconf #q14) (isgrasp o9 #g4))
          :effect (isholdingmotion #q10 #t1727 #q14 o9 #g4)
   )
   (:action s1744_plan-holding-motion
          :parameters (#q10 #q14 o9 #g5)
          :precondition (and (isconf #q10) (isconf #q14) (isgrasp o9 #g5))
          :effect (isholdingmotion #q10 #t1728 #q14 o9 #g5)
   )
   (:action s1745_plan-holding-motion
          :parameters (#q10 #q15 o8 #g0)
          :precondition (and (isconf #q10) (isconf #q15) (isgrasp o8 #g0))
          :effect (isholdingmotion #q10 #t1729 #q15 o8 #g0)
   )
   (:action s1746_plan-holding-motion
          :parameters (#q10 #q15 o9 #g1)
          :precondition (and (isconf #q10) (isconf #q15) (isgrasp o9 #g1))
          :effect (isholdingmotion #q10 #t1730 #q15 o9 #g1)
   )
   (:action s1747_plan-holding-motion
          :parameters (#q10 #q15 o8 #g2)
          :precondition (and (isconf #q10) (isconf #q15) (isgrasp o8 #g2))
          :effect (isholdingmotion #q10 #t1731 #q15 o8 #g2)
   )
   (:action s1748_plan-holding-motion
          :parameters (#q10 #q15 o8 #g3)
          :precondition (and (isconf #q10) (isconf #q15) (isgrasp o8 #g3))
          :effect (isholdingmotion #q10 #t1732 #q15 o8 #g3)
   )
   (:action s1749_plan-holding-motion
          :parameters (#q10 #q15 o9 #g4)
          :precondition (and (isconf #q10) (isconf #q15) (isgrasp o9 #g4))
          :effect (isholdingmotion #q10 #t1733 #q15 o9 #g4)
   )
   (:action s1750_plan-holding-motion
          :parameters (#q10 #q15 o9 #g5)
          :precondition (and (isconf #q10) (isconf #q15) (isgrasp o9 #g5))
          :effect (isholdingmotion #q10 #t1734 #q15 o9 #g5)
   )
   (:action s1751_plan-holding-motion
          :parameters (#q10 #q16 o8 #g0)
          :precondition (and (isconf #q10) (isconf #q16) (isgrasp o8 #g0))
          :effect (isholdingmotion #q10 #t1735 #q16 o8 #g0)
   )
   (:action s1752_plan-holding-motion
          :parameters (#q10 #q16 o9 #g1)
          :precondition (and (isconf #q10) (isconf #q16) (isgrasp o9 #g1))
          :effect (isholdingmotion #q10 #t1736 #q16 o9 #g1)
   )
   (:action s1753_plan-holding-motion
          :parameters (#q10 #q16 o8 #g2)
          :precondition (and (isconf #q10) (isconf #q16) (isgrasp o8 #g2))
          :effect (isholdingmotion #q10 #t1737 #q16 o8 #g2)
   )
   (:action s1754_plan-holding-motion
          :parameters (#q10 #q16 o8 #g3)
          :precondition (and (isconf #q10) (isconf #q16) (isgrasp o8 #g3))
          :effect (isholdingmotion #q10 #t1738 #q16 o8 #g3)
   )
   (:action s1755_plan-holding-motion
          :parameters (#q10 #q16 o9 #g4)
          :precondition (and (isconf #q10) (isconf #q16) (isgrasp o9 #g4))
          :effect (isholdingmotion #q10 #t1739 #q16 o9 #g4)
   )
   (:action s1756_plan-holding-motion
          :parameters (#q10 #q16 o9 #g5)
          :precondition (and (isconf #q10) (isconf #q16) (isgrasp o9 #g5))
          :effect (isholdingmotion #q10 #t1740 #q16 o9 #g5)
   )
   (:action s1757_plan-holding-motion
          :parameters (#q10 #q17 o8 #g0)
          :precondition (and (isconf #q10) (isconf #q17) (isgrasp o8 #g0))
          :effect (isholdingmotion #q10 #t1741 #q17 o8 #g0)
   )
   (:action s1758_plan-holding-motion
          :parameters (#q10 #q17 o9 #g1)
          :precondition (and (isconf #q10) (isconf #q17) (isgrasp o9 #g1))
          :effect (isholdingmotion #q10 #t1742 #q17 o9 #g1)
   )
   (:action s1759_plan-holding-motion
          :parameters (#q10 #q17 o8 #g2)
          :precondition (and (isconf #q10) (isconf #q17) (isgrasp o8 #g2))
          :effect (isholdingmotion #q10 #t1743 #q17 o8 #g2)
   )
   (:action s1760_plan-holding-motion
          :parameters (#q10 #q17 o8 #g3)
          :precondition (and (isconf #q10) (isconf #q17) (isgrasp o8 #g3))
          :effect (isholdingmotion #q10 #t1744 #q17 o8 #g3)
   )
   (:action s1761_plan-holding-motion
          :parameters (#q10 #q17 o9 #g4)
          :precondition (and (isconf #q10) (isconf #q17) (isgrasp o9 #g4))
          :effect (isholdingmotion #q10 #t1745 #q17 o9 #g4)
   )
   (:action s1762_plan-holding-motion
          :parameters (#q10 #q17 o9 #g5)
          :precondition (and (isconf #q10) (isconf #q17) (isgrasp o9 #g5))
          :effect (isholdingmotion #q10 #t1746 #q17 o9 #g5)
   )
   (:action s1763_plan-holding-motion
          :parameters (#q11 q808 o8 #g0)
          :precondition (and (isconf #q11) (isconf q808) (isgrasp o8 #g0))
          :effect (isholdingmotion #q11 #t1747 q808 o8 #g0)
   )
   (:action s1764_plan-holding-motion
          :parameters (#q11 q808 o9 #g1)
          :precondition (and (isconf #q11) (isconf q808) (isgrasp o9 #g1))
          :effect (isholdingmotion #q11 #t1748 q808 o9 #g1)
   )
   (:action s1765_plan-holding-motion
          :parameters (#q11 q808 o8 #g2)
          :precondition (and (isconf #q11) (isconf q808) (isgrasp o8 #g2))
          :effect (isholdingmotion #q11 #t1749 q808 o8 #g2)
   )
   (:action s1766_plan-holding-motion
          :parameters (#q11 q808 o8 #g3)
          :precondition (and (isconf #q11) (isconf q808) (isgrasp o8 #g3))
          :effect (isholdingmotion #q11 #t1750 q808 o8 #g3)
   )
   (:action s1767_plan-holding-motion
          :parameters (#q11 q808 o9 #g4)
          :precondition (and (isconf #q11) (isconf q808) (isgrasp o9 #g4))
          :effect (isholdingmotion #q11 #t1751 q808 o9 #g4)
   )
   (:action s1768_plan-holding-motion
          :parameters (#q11 q808 o9 #g5)
          :precondition (and (isconf #q11) (isconf q808) (isgrasp o9 #g5))
          :effect (isholdingmotion #q11 #t1752 q808 o9 #g5)
   )
   (:action s1769_plan-holding-motion
          :parameters (#q11 #q0 o8 #g0)
          :precondition (and (isconf #q11) (isconf #q0) (isgrasp o8 #g0))
          :effect (isholdingmotion #q11 #t1753 #q0 o8 #g0)
   )
   (:action s1770_plan-holding-motion
          :parameters (#q11 #q0 o9 #g1)
          :precondition (and (isconf #q11) (isconf #q0) (isgrasp o9 #g1))
          :effect (isholdingmotion #q11 #t1754 #q0 o9 #g1)
   )
   (:action s1771_plan-holding-motion
          :parameters (#q11 #q0 o8 #g2)
          :precondition (and (isconf #q11) (isconf #q0) (isgrasp o8 #g2))
          :effect (isholdingmotion #q11 #t1755 #q0 o8 #g2)
   )
   (:action s1772_plan-holding-motion
          :parameters (#q11 #q0 o8 #g3)
          :precondition (and (isconf #q11) (isconf #q0) (isgrasp o8 #g3))
          :effect (isholdingmotion #q11 #t1756 #q0 o8 #g3)
   )
   (:action s1773_plan-holding-motion
          :parameters (#q11 #q0 o9 #g4)
          :precondition (and (isconf #q11) (isconf #q0) (isgrasp o9 #g4))
          :effect (isholdingmotion #q11 #t1757 #q0 o9 #g4)
   )
   (:action s1774_plan-holding-motion
          :parameters (#q11 #q0 o9 #g5)
          :precondition (and (isconf #q11) (isconf #q0) (isgrasp o9 #g5))
          :effect (isholdingmotion #q11 #t1758 #q0 o9 #g5)
   )
   (:action s1775_plan-holding-motion
          :parameters (#q11 #q1 o8 #g0)
          :precondition (and (isconf #q11) (isconf #q1) (isgrasp o8 #g0))
          :effect (isholdingmotion #q11 #t1759 #q1 o8 #g0)
   )
   (:action s1776_plan-holding-motion
          :parameters (#q11 #q1 o9 #g1)
          :precondition (and (isconf #q11) (isconf #q1) (isgrasp o9 #g1))
          :effect (isholdingmotion #q11 #t1760 #q1 o9 #g1)
   )
   (:action s1777_plan-holding-motion
          :parameters (#q11 #q1 o8 #g2)
          :precondition (and (isconf #q11) (isconf #q1) (isgrasp o8 #g2))
          :effect (isholdingmotion #q11 #t1761 #q1 o8 #g2)
   )
   (:action s1778_plan-holding-motion
          :parameters (#q11 #q1 o8 #g3)
          :precondition (and (isconf #q11) (isconf #q1) (isgrasp o8 #g3))
          :effect (isholdingmotion #q11 #t1762 #q1 o8 #g3)
   )
   (:action s1779_plan-holding-motion
          :parameters (#q11 #q1 o9 #g4)
          :precondition (and (isconf #q11) (isconf #q1) (isgrasp o9 #g4))
          :effect (isholdingmotion #q11 #t1763 #q1 o9 #g4)
   )
   (:action s1780_plan-holding-motion
          :parameters (#q11 #q1 o9 #g5)
          :precondition (and (isconf #q11) (isconf #q1) (isgrasp o9 #g5))
          :effect (isholdingmotion #q11 #t1764 #q1 o9 #g5)
   )
   (:action s1781_plan-holding-motion
          :parameters (#q11 #q2 o8 #g0)
          :precondition (and (isconf #q11) (isconf #q2) (isgrasp o8 #g0))
          :effect (isholdingmotion #q11 #t1765 #q2 o8 #g0)
   )
   (:action s1782_plan-holding-motion
          :parameters (#q11 #q2 o9 #g1)
          :precondition (and (isconf #q11) (isconf #q2) (isgrasp o9 #g1))
          :effect (isholdingmotion #q11 #t1766 #q2 o9 #g1)
   )
   (:action s1783_plan-holding-motion
          :parameters (#q11 #q2 o8 #g2)
          :precondition (and (isconf #q11) (isconf #q2) (isgrasp o8 #g2))
          :effect (isholdingmotion #q11 #t1767 #q2 o8 #g2)
   )
   (:action s1784_plan-holding-motion
          :parameters (#q11 #q2 o8 #g3)
          :precondition (and (isconf #q11) (isconf #q2) (isgrasp o8 #g3))
          :effect (isholdingmotion #q11 #t1768 #q2 o8 #g3)
   )
   (:action s1785_plan-holding-motion
          :parameters (#q11 #q2 o9 #g4)
          :precondition (and (isconf #q11) (isconf #q2) (isgrasp o9 #g4))
          :effect (isholdingmotion #q11 #t1769 #q2 o9 #g4)
   )
   (:action s1786_plan-holding-motion
          :parameters (#q11 #q2 o9 #g5)
          :precondition (and (isconf #q11) (isconf #q2) (isgrasp o9 #g5))
          :effect (isholdingmotion #q11 #t1770 #q2 o9 #g5)
   )
   (:action s1787_plan-holding-motion
          :parameters (#q11 #q3 o8 #g0)
          :precondition (and (isconf #q11) (isconf #q3) (isgrasp o8 #g0))
          :effect (isholdingmotion #q11 #t1771 #q3 o8 #g0)
   )
   (:action s1788_plan-holding-motion
          :parameters (#q11 #q3 o9 #g1)
          :precondition (and (isconf #q11) (isconf #q3) (isgrasp o9 #g1))
          :effect (isholdingmotion #q11 #t1772 #q3 o9 #g1)
   )
   (:action s1789_plan-holding-motion
          :parameters (#q11 #q3 o8 #g2)
          :precondition (and (isconf #q11) (isconf #q3) (isgrasp o8 #g2))
          :effect (isholdingmotion #q11 #t1773 #q3 o8 #g2)
   )
   (:action s1790_plan-holding-motion
          :parameters (#q11 #q3 o8 #g3)
          :precondition (and (isconf #q11) (isconf #q3) (isgrasp o8 #g3))
          :effect (isholdingmotion #q11 #t1774 #q3 o8 #g3)
   )
   (:action s1791_plan-holding-motion
          :parameters (#q11 #q3 o9 #g4)
          :precondition (and (isconf #q11) (isconf #q3) (isgrasp o9 #g4))
          :effect (isholdingmotion #q11 #t1775 #q3 o9 #g4)
   )
   (:action s1792_plan-holding-motion
          :parameters (#q11 #q3 o9 #g5)
          :precondition (and (isconf #q11) (isconf #q3) (isgrasp o9 #g5))
          :effect (isholdingmotion #q11 #t1776 #q3 o9 #g5)
   )
   (:action s1793_plan-holding-motion
          :parameters (#q11 #q4 o8 #g0)
          :precondition (and (isconf #q11) (isconf #q4) (isgrasp o8 #g0))
          :effect (isholdingmotion #q11 #t1777 #q4 o8 #g0)
   )
   (:action s1794_plan-holding-motion
          :parameters (#q11 #q4 o9 #g1)
          :precondition (and (isconf #q11) (isconf #q4) (isgrasp o9 #g1))
          :effect (isholdingmotion #q11 #t1778 #q4 o9 #g1)
   )
   (:action s1795_plan-holding-motion
          :parameters (#q11 #q4 o8 #g2)
          :precondition (and (isconf #q11) (isconf #q4) (isgrasp o8 #g2))
          :effect (isholdingmotion #q11 #t1779 #q4 o8 #g2)
   )
   (:action s1796_plan-holding-motion
          :parameters (#q11 #q4 o8 #g3)
          :precondition (and (isconf #q11) (isconf #q4) (isgrasp o8 #g3))
          :effect (isholdingmotion #q11 #t1780 #q4 o8 #g3)
   )
   (:action s1797_plan-holding-motion
          :parameters (#q11 #q4 o9 #g4)
          :precondition (and (isconf #q11) (isconf #q4) (isgrasp o9 #g4))
          :effect (isholdingmotion #q11 #t1781 #q4 o9 #g4)
   )
   (:action s1798_plan-holding-motion
          :parameters (#q11 #q4 o9 #g5)
          :precondition (and (isconf #q11) (isconf #q4) (isgrasp o9 #g5))
          :effect (isholdingmotion #q11 #t1782 #q4 o9 #g5)
   )
   (:action s1799_plan-holding-motion
          :parameters (#q11 #q5 o8 #g0)
          :precondition (and (isconf #q11) (isconf #q5) (isgrasp o8 #g0))
          :effect (isholdingmotion #q11 #t1783 #q5 o8 #g0)
   )
   (:action s1800_plan-holding-motion
          :parameters (#q11 #q5 o9 #g1)
          :precondition (and (isconf #q11) (isconf #q5) (isgrasp o9 #g1))
          :effect (isholdingmotion #q11 #t1784 #q5 o9 #g1)
   )
   (:action s1801_plan-holding-motion
          :parameters (#q11 #q5 o8 #g2)
          :precondition (and (isconf #q11) (isconf #q5) (isgrasp o8 #g2))
          :effect (isholdingmotion #q11 #t1785 #q5 o8 #g2)
   )
   (:action s1802_plan-holding-motion
          :parameters (#q11 #q5 o8 #g3)
          :precondition (and (isconf #q11) (isconf #q5) (isgrasp o8 #g3))
          :effect (isholdingmotion #q11 #t1786 #q5 o8 #g3)
   )
   (:action s1803_plan-holding-motion
          :parameters (#q11 #q5 o9 #g4)
          :precondition (and (isconf #q11) (isconf #q5) (isgrasp o9 #g4))
          :effect (isholdingmotion #q11 #t1787 #q5 o9 #g4)
   )
   (:action s1804_plan-holding-motion
          :parameters (#q11 #q5 o9 #g5)
          :precondition (and (isconf #q11) (isconf #q5) (isgrasp o9 #g5))
          :effect (isholdingmotion #q11 #t1788 #q5 o9 #g5)
   )
   (:action s1805_plan-holding-motion
          :parameters (#q11 #q6 o8 #g0)
          :precondition (and (isconf #q11) (isconf #q6) (isgrasp o8 #g0))
          :effect (isholdingmotion #q11 #t1789 #q6 o8 #g0)
   )
   (:action s1806_plan-holding-motion
          :parameters (#q11 #q6 o9 #g1)
          :precondition (and (isconf #q11) (isconf #q6) (isgrasp o9 #g1))
          :effect (isholdingmotion #q11 #t1790 #q6 o9 #g1)
   )
   (:action s1807_plan-holding-motion
          :parameters (#q11 #q6 o8 #g2)
          :precondition (and (isconf #q11) (isconf #q6) (isgrasp o8 #g2))
          :effect (isholdingmotion #q11 #t1791 #q6 o8 #g2)
   )
   (:action s1808_plan-holding-motion
          :parameters (#q11 #q6 o8 #g3)
          :precondition (and (isconf #q11) (isconf #q6) (isgrasp o8 #g3))
          :effect (isholdingmotion #q11 #t1792 #q6 o8 #g3)
   )
   (:action s1809_plan-holding-motion
          :parameters (#q11 #q6 o9 #g4)
          :precondition (and (isconf #q11) (isconf #q6) (isgrasp o9 #g4))
          :effect (isholdingmotion #q11 #t1793 #q6 o9 #g4)
   )
   (:action s1810_plan-holding-motion
          :parameters (#q11 #q6 o9 #g5)
          :precondition (and (isconf #q11) (isconf #q6) (isgrasp o9 #g5))
          :effect (isholdingmotion #q11 #t1794 #q6 o9 #g5)
   )
   (:action s1811_plan-holding-motion
          :parameters (#q11 #q7 o8 #g0)
          :precondition (and (isconf #q11) (isconf #q7) (isgrasp o8 #g0))
          :effect (isholdingmotion #q11 #t1795 #q7 o8 #g0)
   )
   (:action s1812_plan-holding-motion
          :parameters (#q11 #q7 o9 #g1)
          :precondition (and (isconf #q11) (isconf #q7) (isgrasp o9 #g1))
          :effect (isholdingmotion #q11 #t1796 #q7 o9 #g1)
   )
   (:action s1813_plan-holding-motion
          :parameters (#q11 #q7 o8 #g2)
          :precondition (and (isconf #q11) (isconf #q7) (isgrasp o8 #g2))
          :effect (isholdingmotion #q11 #t1797 #q7 o8 #g2)
   )
   (:action s1814_plan-holding-motion
          :parameters (#q11 #q7 o8 #g3)
          :precondition (and (isconf #q11) (isconf #q7) (isgrasp o8 #g3))
          :effect (isholdingmotion #q11 #t1798 #q7 o8 #g3)
   )
   (:action s1815_plan-holding-motion
          :parameters (#q11 #q7 o9 #g4)
          :precondition (and (isconf #q11) (isconf #q7) (isgrasp o9 #g4))
          :effect (isholdingmotion #q11 #t1799 #q7 o9 #g4)
   )
   (:action s1816_plan-holding-motion
          :parameters (#q11 #q7 o9 #g5)
          :precondition (and (isconf #q11) (isconf #q7) (isgrasp o9 #g5))
          :effect (isholdingmotion #q11 #t1800 #q7 o9 #g5)
   )
   (:action s1817_plan-holding-motion
          :parameters (#q11 #q8 o8 #g0)
          :precondition (and (isconf #q11) (isconf #q8) (isgrasp o8 #g0))
          :effect (isholdingmotion #q11 #t1801 #q8 o8 #g0)
   )
   (:action s1818_plan-holding-motion
          :parameters (#q11 #q8 o9 #g1)
          :precondition (and (isconf #q11) (isconf #q8) (isgrasp o9 #g1))
          :effect (isholdingmotion #q11 #t1802 #q8 o9 #g1)
   )
   (:action s1819_plan-holding-motion
          :parameters (#q11 #q8 o8 #g2)
          :precondition (and (isconf #q11) (isconf #q8) (isgrasp o8 #g2))
          :effect (isholdingmotion #q11 #t1803 #q8 o8 #g2)
   )
   (:action s1820_plan-holding-motion
          :parameters (#q11 #q8 o8 #g3)
          :precondition (and (isconf #q11) (isconf #q8) (isgrasp o8 #g3))
          :effect (isholdingmotion #q11 #t1804 #q8 o8 #g3)
   )
   (:action s1821_plan-holding-motion
          :parameters (#q11 #q8 o9 #g4)
          :precondition (and (isconf #q11) (isconf #q8) (isgrasp o9 #g4))
          :effect (isholdingmotion #q11 #t1805 #q8 o9 #g4)
   )
   (:action s1822_plan-holding-motion
          :parameters (#q11 #q8 o9 #g5)
          :precondition (and (isconf #q11) (isconf #q8) (isgrasp o9 #g5))
          :effect (isholdingmotion #q11 #t1806 #q8 o9 #g5)
   )
   (:action s1823_plan-holding-motion
          :parameters (#q11 #q9 o8 #g0)
          :precondition (and (isconf #q11) (isconf #q9) (isgrasp o8 #g0))
          :effect (isholdingmotion #q11 #t1807 #q9 o8 #g0)
   )
   (:action s1824_plan-holding-motion
          :parameters (#q11 #q9 o9 #g1)
          :precondition (and (isconf #q11) (isconf #q9) (isgrasp o9 #g1))
          :effect (isholdingmotion #q11 #t1808 #q9 o9 #g1)
   )
   (:action s1825_plan-holding-motion
          :parameters (#q11 #q9 o8 #g2)
          :precondition (and (isconf #q11) (isconf #q9) (isgrasp o8 #g2))
          :effect (isholdingmotion #q11 #t1809 #q9 o8 #g2)
   )
   (:action s1826_plan-holding-motion
          :parameters (#q11 #q9 o8 #g3)
          :precondition (and (isconf #q11) (isconf #q9) (isgrasp o8 #g3))
          :effect (isholdingmotion #q11 #t1810 #q9 o8 #g3)
   )
   (:action s1827_plan-holding-motion
          :parameters (#q11 #q9 o9 #g4)
          :precondition (and (isconf #q11) (isconf #q9) (isgrasp o9 #g4))
          :effect (isholdingmotion #q11 #t1811 #q9 o9 #g4)
   )
   (:action s1828_plan-holding-motion
          :parameters (#q11 #q9 o9 #g5)
          :precondition (and (isconf #q11) (isconf #q9) (isgrasp o9 #g5))
          :effect (isholdingmotion #q11 #t1812 #q9 o9 #g5)
   )
   (:action s1829_plan-holding-motion
          :parameters (#q11 #q10 o8 #g0)
          :precondition (and (isconf #q11) (isconf #q10) (isgrasp o8 #g0))
          :effect (isholdingmotion #q11 #t1813 #q10 o8 #g0)
   )
   (:action s1830_plan-holding-motion
          :parameters (#q11 #q10 o9 #g1)
          :precondition (and (isconf #q11) (isconf #q10) (isgrasp o9 #g1))
          :effect (isholdingmotion #q11 #t1814 #q10 o9 #g1)
   )
   (:action s1831_plan-holding-motion
          :parameters (#q11 #q10 o8 #g2)
          :precondition (and (isconf #q11) (isconf #q10) (isgrasp o8 #g2))
          :effect (isholdingmotion #q11 #t1815 #q10 o8 #g2)
   )
   (:action s1832_plan-holding-motion
          :parameters (#q11 #q10 o8 #g3)
          :precondition (and (isconf #q11) (isconf #q10) (isgrasp o8 #g3))
          :effect (isholdingmotion #q11 #t1816 #q10 o8 #g3)
   )
   (:action s1833_plan-holding-motion
          :parameters (#q11 #q10 o9 #g4)
          :precondition (and (isconf #q11) (isconf #q10) (isgrasp o9 #g4))
          :effect (isholdingmotion #q11 #t1817 #q10 o9 #g4)
   )
   (:action s1834_plan-holding-motion
          :parameters (#q11 #q10 o9 #g5)
          :precondition (and (isconf #q11) (isconf #q10) (isgrasp o9 #g5))
          :effect (isholdingmotion #q11 #t1818 #q10 o9 #g5)
   )
   (:action s1835_plan-holding-motion
          :parameters (#q11 #q11 o8 #g0)
          :precondition (and (isconf #q11) (isconf #q11) (isgrasp o8 #g0))
          :effect (isholdingmotion #q11 #t1819 #q11 o8 #g0)
   )
   (:action s1836_plan-holding-motion
          :parameters (#q11 #q11 o9 #g1)
          :precondition (and (isconf #q11) (isconf #q11) (isgrasp o9 #g1))
          :effect (isholdingmotion #q11 #t1820 #q11 o9 #g1)
   )
   (:action s1837_plan-holding-motion
          :parameters (#q11 #q11 o8 #g2)
          :precondition (and (isconf #q11) (isconf #q11) (isgrasp o8 #g2))
          :effect (isholdingmotion #q11 #t1821 #q11 o8 #g2)
   )
   (:action s1838_plan-holding-motion
          :parameters (#q11 #q11 o8 #g3)
          :precondition (and (isconf #q11) (isconf #q11) (isgrasp o8 #g3))
          :effect (isholdingmotion #q11 #t1822 #q11 o8 #g3)
   )
   (:action s1839_plan-holding-motion
          :parameters (#q11 #q11 o9 #g4)
          :precondition (and (isconf #q11) (isconf #q11) (isgrasp o9 #g4))
          :effect (isholdingmotion #q11 #t1823 #q11 o9 #g4)
   )
   (:action s1840_plan-holding-motion
          :parameters (#q11 #q11 o9 #g5)
          :precondition (and (isconf #q11) (isconf #q11) (isgrasp o9 #g5))
          :effect (isholdingmotion #q11 #t1824 #q11 o9 #g5)
   )
   (:action s1841_plan-holding-motion
          :parameters (#q11 #q12 o8 #g0)
          :precondition (and (isconf #q11) (isconf #q12) (isgrasp o8 #g0))
          :effect (isholdingmotion #q11 #t1825 #q12 o8 #g0)
   )
   (:action s1842_plan-holding-motion
          :parameters (#q11 #q12 o9 #g1)
          :precondition (and (isconf #q11) (isconf #q12) (isgrasp o9 #g1))
          :effect (isholdingmotion #q11 #t1826 #q12 o9 #g1)
   )
   (:action s1843_plan-holding-motion
          :parameters (#q11 #q12 o8 #g2)
          :precondition (and (isconf #q11) (isconf #q12) (isgrasp o8 #g2))
          :effect (isholdingmotion #q11 #t1827 #q12 o8 #g2)
   )
   (:action s1844_plan-holding-motion
          :parameters (#q11 #q12 o8 #g3)
          :precondition (and (isconf #q11) (isconf #q12) (isgrasp o8 #g3))
          :effect (isholdingmotion #q11 #t1828 #q12 o8 #g3)
   )
   (:action s1845_plan-holding-motion
          :parameters (#q11 #q12 o9 #g4)
          :precondition (and (isconf #q11) (isconf #q12) (isgrasp o9 #g4))
          :effect (isholdingmotion #q11 #t1829 #q12 o9 #g4)
   )
   (:action s1846_plan-holding-motion
          :parameters (#q11 #q12 o9 #g5)
          :precondition (and (isconf #q11) (isconf #q12) (isgrasp o9 #g5))
          :effect (isholdingmotion #q11 #t1830 #q12 o9 #g5)
   )
   (:action s1847_plan-holding-motion
          :parameters (#q11 #q13 o8 #g0)
          :precondition (and (isconf #q11) (isconf #q13) (isgrasp o8 #g0))
          :effect (isholdingmotion #q11 #t1831 #q13 o8 #g0)
   )
   (:action s1848_plan-holding-motion
          :parameters (#q11 #q13 o9 #g1)
          :precondition (and (isconf #q11) (isconf #q13) (isgrasp o9 #g1))
          :effect (isholdingmotion #q11 #t1832 #q13 o9 #g1)
   )
   (:action s1849_plan-holding-motion
          :parameters (#q11 #q13 o8 #g2)
          :precondition (and (isconf #q11) (isconf #q13) (isgrasp o8 #g2))
          :effect (isholdingmotion #q11 #t1833 #q13 o8 #g2)
   )
   (:action s1850_plan-holding-motion
          :parameters (#q11 #q13 o8 #g3)
          :precondition (and (isconf #q11) (isconf #q13) (isgrasp o8 #g3))
          :effect (isholdingmotion #q11 #t1834 #q13 o8 #g3)
   )
   (:action s1851_plan-holding-motion
          :parameters (#q11 #q13 o9 #g4)
          :precondition (and (isconf #q11) (isconf #q13) (isgrasp o9 #g4))
          :effect (isholdingmotion #q11 #t1835 #q13 o9 #g4)
   )
   (:action s1852_plan-holding-motion
          :parameters (#q11 #q13 o9 #g5)
          :precondition (and (isconf #q11) (isconf #q13) (isgrasp o9 #g5))
          :effect (isholdingmotion #q11 #t1836 #q13 o9 #g5)
   )
   (:action s1853_plan-holding-motion
          :parameters (#q11 #q14 o8 #g0)
          :precondition (and (isconf #q11) (isconf #q14) (isgrasp o8 #g0))
          :effect (isholdingmotion #q11 #t1837 #q14 o8 #g0)
   )
   (:action s1854_plan-holding-motion
          :parameters (#q11 #q14 o9 #g1)
          :precondition (and (isconf #q11) (isconf #q14) (isgrasp o9 #g1))
          :effect (isholdingmotion #q11 #t1838 #q14 o9 #g1)
   )
   (:action s1855_plan-holding-motion
          :parameters (#q11 #q14 o8 #g2)
          :precondition (and (isconf #q11) (isconf #q14) (isgrasp o8 #g2))
          :effect (isholdingmotion #q11 #t1839 #q14 o8 #g2)
   )
   (:action s1856_plan-holding-motion
          :parameters (#q11 #q14 o8 #g3)
          :precondition (and (isconf #q11) (isconf #q14) (isgrasp o8 #g3))
          :effect (isholdingmotion #q11 #t1840 #q14 o8 #g3)
   )
   (:action s1857_plan-holding-motion
          :parameters (#q11 #q14 o9 #g4)
          :precondition (and (isconf #q11) (isconf #q14) (isgrasp o9 #g4))
          :effect (isholdingmotion #q11 #t1841 #q14 o9 #g4)
   )
   (:action s1858_plan-holding-motion
          :parameters (#q11 #q14 o9 #g5)
          :precondition (and (isconf #q11) (isconf #q14) (isgrasp o9 #g5))
          :effect (isholdingmotion #q11 #t1842 #q14 o9 #g5)
   )
   (:action s1859_plan-holding-motion
          :parameters (#q11 #q15 o8 #g0)
          :precondition (and (isconf #q11) (isconf #q15) (isgrasp o8 #g0))
          :effect (isholdingmotion #q11 #t1843 #q15 o8 #g0)
   )
   (:action s1860_plan-holding-motion
          :parameters (#q11 #q15 o9 #g1)
          :precondition (and (isconf #q11) (isconf #q15) (isgrasp o9 #g1))
          :effect (isholdingmotion #q11 #t1844 #q15 o9 #g1)
   )
   (:action s1861_plan-holding-motion
          :parameters (#q11 #q15 o8 #g2)
          :precondition (and (isconf #q11) (isconf #q15) (isgrasp o8 #g2))
          :effect (isholdingmotion #q11 #t1845 #q15 o8 #g2)
   )
   (:action s1862_plan-holding-motion
          :parameters (#q11 #q15 o8 #g3)
          :precondition (and (isconf #q11) (isconf #q15) (isgrasp o8 #g3))
          :effect (isholdingmotion #q11 #t1846 #q15 o8 #g3)
   )
   (:action s1863_plan-holding-motion
          :parameters (#q11 #q15 o9 #g4)
          :precondition (and (isconf #q11) (isconf #q15) (isgrasp o9 #g4))
          :effect (isholdingmotion #q11 #t1847 #q15 o9 #g4)
   )
   (:action s1864_plan-holding-motion
          :parameters (#q11 #q15 o9 #g5)
          :precondition (and (isconf #q11) (isconf #q15) (isgrasp o9 #g5))
          :effect (isholdingmotion #q11 #t1848 #q15 o9 #g5)
   )
   (:action s1865_plan-holding-motion
          :parameters (#q11 #q16 o8 #g0)
          :precondition (and (isconf #q11) (isconf #q16) (isgrasp o8 #g0))
          :effect (isholdingmotion #q11 #t1849 #q16 o8 #g0)
   )
   (:action s1866_plan-holding-motion
          :parameters (#q11 #q16 o9 #g1)
          :precondition (and (isconf #q11) (isconf #q16) (isgrasp o9 #g1))
          :effect (isholdingmotion #q11 #t1850 #q16 o9 #g1)
   )
   (:action s1867_plan-holding-motion
          :parameters (#q11 #q16 o8 #g2)
          :precondition (and (isconf #q11) (isconf #q16) (isgrasp o8 #g2))
          :effect (isholdingmotion #q11 #t1851 #q16 o8 #g2)
   )
   (:action s1868_plan-holding-motion
          :parameters (#q11 #q16 o8 #g3)
          :precondition (and (isconf #q11) (isconf #q16) (isgrasp o8 #g3))
          :effect (isholdingmotion #q11 #t1852 #q16 o8 #g3)
   )
   (:action s1869_plan-holding-motion
          :parameters (#q11 #q16 o9 #g4)
          :precondition (and (isconf #q11) (isconf #q16) (isgrasp o9 #g4))
          :effect (isholdingmotion #q11 #t1853 #q16 o9 #g4)
   )
   (:action s1870_plan-holding-motion
          :parameters (#q11 #q16 o9 #g5)
          :precondition (and (isconf #q11) (isconf #q16) (isgrasp o9 #g5))
          :effect (isholdingmotion #q11 #t1854 #q16 o9 #g5)
   )
   (:action s1871_plan-holding-motion
          :parameters (#q11 #q17 o8 #g0)
          :precondition (and (isconf #q11) (isconf #q17) (isgrasp o8 #g0))
          :effect (isholdingmotion #q11 #t1855 #q17 o8 #g0)
   )
   (:action s1872_plan-holding-motion
          :parameters (#q11 #q17 o9 #g1)
          :precondition (and (isconf #q11) (isconf #q17) (isgrasp o9 #g1))
          :effect (isholdingmotion #q11 #t1856 #q17 o9 #g1)
   )
   (:action s1873_plan-holding-motion
          :parameters (#q11 #q17 o8 #g2)
          :precondition (and (isconf #q11) (isconf #q17) (isgrasp o8 #g2))
          :effect (isholdingmotion #q11 #t1857 #q17 o8 #g2)
   )
   (:action s1874_plan-holding-motion
          :parameters (#q11 #q17 o8 #g3)
          :precondition (and (isconf #q11) (isconf #q17) (isgrasp o8 #g3))
          :effect (isholdingmotion #q11 #t1858 #q17 o8 #g3)
   )
   (:action s1875_plan-holding-motion
          :parameters (#q11 #q17 o9 #g4)
          :precondition (and (isconf #q11) (isconf #q17) (isgrasp o9 #g4))
          :effect (isholdingmotion #q11 #t1859 #q17 o9 #g4)
   )
   (:action s1876_plan-holding-motion
          :parameters (#q11 #q17 o9 #g5)
          :precondition (and (isconf #q11) (isconf #q17) (isgrasp o9 #g5))
          :effect (isholdingmotion #q11 #t1860 #q17 o9 #g5)
   )
   (:action s1877_plan-holding-motion
          :parameters (#q12 q808 o8 #g0)
          :precondition (and (isconf #q12) (isconf q808) (isgrasp o8 #g0))
          :effect (isholdingmotion #q12 #t1861 q808 o8 #g0)
   )
   (:action s1878_plan-holding-motion
          :parameters (#q12 q808 o9 #g1)
          :precondition (and (isconf #q12) (isconf q808) (isgrasp o9 #g1))
          :effect (isholdingmotion #q12 #t1862 q808 o9 #g1)
   )
   (:action s1879_plan-holding-motion
          :parameters (#q12 q808 o8 #g2)
          :precondition (and (isconf #q12) (isconf q808) (isgrasp o8 #g2))
          :effect (isholdingmotion #q12 #t1863 q808 o8 #g2)
   )
   (:action s1880_plan-holding-motion
          :parameters (#q12 q808 o8 #g3)
          :precondition (and (isconf #q12) (isconf q808) (isgrasp o8 #g3))
          :effect (isholdingmotion #q12 #t1864 q808 o8 #g3)
   )
   (:action s1881_plan-holding-motion
          :parameters (#q12 q808 o9 #g4)
          :precondition (and (isconf #q12) (isconf q808) (isgrasp o9 #g4))
          :effect (isholdingmotion #q12 #t1865 q808 o9 #g4)
   )
   (:action s1882_plan-holding-motion
          :parameters (#q12 q808 o9 #g5)
          :precondition (and (isconf #q12) (isconf q808) (isgrasp o9 #g5))
          :effect (isholdingmotion #q12 #t1866 q808 o9 #g5)
   )
   (:action s1883_plan-holding-motion
          :parameters (#q12 #q0 o8 #g0)
          :precondition (and (isconf #q12) (isconf #q0) (isgrasp o8 #g0))
          :effect (isholdingmotion #q12 #t1867 #q0 o8 #g0)
   )
   (:action s1884_plan-holding-motion
          :parameters (#q12 #q0 o9 #g1)
          :precondition (and (isconf #q12) (isconf #q0) (isgrasp o9 #g1))
          :effect (isholdingmotion #q12 #t1868 #q0 o9 #g1)
   )
   (:action s1885_plan-holding-motion
          :parameters (#q12 #q0 o8 #g2)
          :precondition (and (isconf #q12) (isconf #q0) (isgrasp o8 #g2))
          :effect (isholdingmotion #q12 #t1869 #q0 o8 #g2)
   )
   (:action s1886_plan-holding-motion
          :parameters (#q12 #q0 o8 #g3)
          :precondition (and (isconf #q12) (isconf #q0) (isgrasp o8 #g3))
          :effect (isholdingmotion #q12 #t1870 #q0 o8 #g3)
   )
   (:action s1887_plan-holding-motion
          :parameters (#q12 #q0 o9 #g4)
          :precondition (and (isconf #q12) (isconf #q0) (isgrasp o9 #g4))
          :effect (isholdingmotion #q12 #t1871 #q0 o9 #g4)
   )
   (:action s1888_plan-holding-motion
          :parameters (#q12 #q0 o9 #g5)
          :precondition (and (isconf #q12) (isconf #q0) (isgrasp o9 #g5))
          :effect (isholdingmotion #q12 #t1872 #q0 o9 #g5)
   )
   (:action s1889_plan-holding-motion
          :parameters (#q12 #q1 o8 #g0)
          :precondition (and (isconf #q12) (isconf #q1) (isgrasp o8 #g0))
          :effect (isholdingmotion #q12 #t1873 #q1 o8 #g0)
   )
   (:action s1890_plan-holding-motion
          :parameters (#q12 #q1 o9 #g1)
          :precondition (and (isconf #q12) (isconf #q1) (isgrasp o9 #g1))
          :effect (isholdingmotion #q12 #t1874 #q1 o9 #g1)
   )
   (:action s1891_plan-holding-motion
          :parameters (#q12 #q1 o8 #g2)
          :precondition (and (isconf #q12) (isconf #q1) (isgrasp o8 #g2))
          :effect (isholdingmotion #q12 #t1875 #q1 o8 #g2)
   )
   (:action s1892_plan-holding-motion
          :parameters (#q12 #q1 o8 #g3)
          :precondition (and (isconf #q12) (isconf #q1) (isgrasp o8 #g3))
          :effect (isholdingmotion #q12 #t1876 #q1 o8 #g3)
   )
   (:action s1893_plan-holding-motion
          :parameters (#q12 #q1 o9 #g4)
          :precondition (and (isconf #q12) (isconf #q1) (isgrasp o9 #g4))
          :effect (isholdingmotion #q12 #t1877 #q1 o9 #g4)
   )
   (:action s1894_plan-holding-motion
          :parameters (#q12 #q1 o9 #g5)
          :precondition (and (isconf #q12) (isconf #q1) (isgrasp o9 #g5))
          :effect (isholdingmotion #q12 #t1878 #q1 o9 #g5)
   )
   (:action s1895_plan-holding-motion
          :parameters (#q12 #q2 o8 #g0)
          :precondition (and (isconf #q12) (isconf #q2) (isgrasp o8 #g0))
          :effect (isholdingmotion #q12 #t1879 #q2 o8 #g0)
   )
   (:action s1896_plan-holding-motion
          :parameters (#q12 #q2 o9 #g1)
          :precondition (and (isconf #q12) (isconf #q2) (isgrasp o9 #g1))
          :effect (isholdingmotion #q12 #t1880 #q2 o9 #g1)
   )
   (:action s1897_plan-holding-motion
          :parameters (#q12 #q2 o8 #g2)
          :precondition (and (isconf #q12) (isconf #q2) (isgrasp o8 #g2))
          :effect (isholdingmotion #q12 #t1881 #q2 o8 #g2)
   )
   (:action s1898_plan-holding-motion
          :parameters (#q12 #q2 o8 #g3)
          :precondition (and (isconf #q12) (isconf #q2) (isgrasp o8 #g3))
          :effect (isholdingmotion #q12 #t1882 #q2 o8 #g3)
   )
   (:action s1899_plan-holding-motion
          :parameters (#q12 #q2 o9 #g4)
          :precondition (and (isconf #q12) (isconf #q2) (isgrasp o9 #g4))
          :effect (isholdingmotion #q12 #t1883 #q2 o9 #g4)
   )
   (:action s1900_plan-holding-motion
          :parameters (#q12 #q2 o9 #g5)
          :precondition (and (isconf #q12) (isconf #q2) (isgrasp o9 #g5))
          :effect (isholdingmotion #q12 #t1884 #q2 o9 #g5)
   )
   (:action s1901_plan-holding-motion
          :parameters (#q12 #q3 o8 #g0)
          :precondition (and (isconf #q12) (isconf #q3) (isgrasp o8 #g0))
          :effect (isholdingmotion #q12 #t1885 #q3 o8 #g0)
   )
   (:action s1902_plan-holding-motion
          :parameters (#q12 #q3 o9 #g1)
          :precondition (and (isconf #q12) (isconf #q3) (isgrasp o9 #g1))
          :effect (isholdingmotion #q12 #t1886 #q3 o9 #g1)
   )
   (:action s1903_plan-holding-motion
          :parameters (#q12 #q3 o8 #g2)
          :precondition (and (isconf #q12) (isconf #q3) (isgrasp o8 #g2))
          :effect (isholdingmotion #q12 #t1887 #q3 o8 #g2)
   )
   (:action s1904_plan-holding-motion
          :parameters (#q12 #q3 o8 #g3)
          :precondition (and (isconf #q12) (isconf #q3) (isgrasp o8 #g3))
          :effect (isholdingmotion #q12 #t1888 #q3 o8 #g3)
   )
   (:action s1905_plan-holding-motion
          :parameters (#q12 #q3 o9 #g4)
          :precondition (and (isconf #q12) (isconf #q3) (isgrasp o9 #g4))
          :effect (isholdingmotion #q12 #t1889 #q3 o9 #g4)
   )
   (:action s1906_plan-holding-motion
          :parameters (#q12 #q3 o9 #g5)
          :precondition (and (isconf #q12) (isconf #q3) (isgrasp o9 #g5))
          :effect (isholdingmotion #q12 #t1890 #q3 o9 #g5)
   )
   (:action s1907_plan-holding-motion
          :parameters (#q12 #q4 o8 #g0)
          :precondition (and (isconf #q12) (isconf #q4) (isgrasp o8 #g0))
          :effect (isholdingmotion #q12 #t1891 #q4 o8 #g0)
   )
   (:action s1908_plan-holding-motion
          :parameters (#q12 #q4 o9 #g1)
          :precondition (and (isconf #q12) (isconf #q4) (isgrasp o9 #g1))
          :effect (isholdingmotion #q12 #t1892 #q4 o9 #g1)
   )
   (:action s1909_plan-holding-motion
          :parameters (#q12 #q4 o8 #g2)
          :precondition (and (isconf #q12) (isconf #q4) (isgrasp o8 #g2))
          :effect (isholdingmotion #q12 #t1893 #q4 o8 #g2)
   )
   (:action s1910_plan-holding-motion
          :parameters (#q12 #q4 o8 #g3)
          :precondition (and (isconf #q12) (isconf #q4) (isgrasp o8 #g3))
          :effect (isholdingmotion #q12 #t1894 #q4 o8 #g3)
   )
   (:action s1911_plan-holding-motion
          :parameters (#q12 #q4 o9 #g4)
          :precondition (and (isconf #q12) (isconf #q4) (isgrasp o9 #g4))
          :effect (isholdingmotion #q12 #t1895 #q4 o9 #g4)
   )
   (:action s1912_plan-holding-motion
          :parameters (#q12 #q4 o9 #g5)
          :precondition (and (isconf #q12) (isconf #q4) (isgrasp o9 #g5))
          :effect (isholdingmotion #q12 #t1896 #q4 o9 #g5)
   )
   (:action s1913_plan-holding-motion
          :parameters (#q12 #q5 o8 #g0)
          :precondition (and (isconf #q12) (isconf #q5) (isgrasp o8 #g0))
          :effect (isholdingmotion #q12 #t1897 #q5 o8 #g0)
   )
   (:action s1914_plan-holding-motion
          :parameters (#q12 #q5 o9 #g1)
          :precondition (and (isconf #q12) (isconf #q5) (isgrasp o9 #g1))
          :effect (isholdingmotion #q12 #t1898 #q5 o9 #g1)
   )
   (:action s1915_plan-holding-motion
          :parameters (#q12 #q5 o8 #g2)
          :precondition (and (isconf #q12) (isconf #q5) (isgrasp o8 #g2))
          :effect (isholdingmotion #q12 #t1899 #q5 o8 #g2)
   )
   (:action s1916_plan-holding-motion
          :parameters (#q12 #q5 o8 #g3)
          :precondition (and (isconf #q12) (isconf #q5) (isgrasp o8 #g3))
          :effect (isholdingmotion #q12 #t1900 #q5 o8 #g3)
   )
   (:action s1917_plan-holding-motion
          :parameters (#q12 #q5 o9 #g4)
          :precondition (and (isconf #q12) (isconf #q5) (isgrasp o9 #g4))
          :effect (isholdingmotion #q12 #t1901 #q5 o9 #g4)
   )
   (:action s1918_plan-holding-motion
          :parameters (#q12 #q5 o9 #g5)
          :precondition (and (isconf #q12) (isconf #q5) (isgrasp o9 #g5))
          :effect (isholdingmotion #q12 #t1902 #q5 o9 #g5)
   )
   (:action s1919_plan-holding-motion
          :parameters (#q12 #q6 o8 #g0)
          :precondition (and (isconf #q12) (isconf #q6) (isgrasp o8 #g0))
          :effect (isholdingmotion #q12 #t1903 #q6 o8 #g0)
   )
   (:action s1920_plan-holding-motion
          :parameters (#q12 #q6 o9 #g1)
          :precondition (and (isconf #q12) (isconf #q6) (isgrasp o9 #g1))
          :effect (isholdingmotion #q12 #t1904 #q6 o9 #g1)
   )
   (:action s1921_plan-holding-motion
          :parameters (#q12 #q6 o8 #g2)
          :precondition (and (isconf #q12) (isconf #q6) (isgrasp o8 #g2))
          :effect (isholdingmotion #q12 #t1905 #q6 o8 #g2)
   )
   (:action s1922_plan-holding-motion
          :parameters (#q12 #q6 o8 #g3)
          :precondition (and (isconf #q12) (isconf #q6) (isgrasp o8 #g3))
          :effect (isholdingmotion #q12 #t1906 #q6 o8 #g3)
   )
   (:action s1923_plan-holding-motion
          :parameters (#q12 #q6 o9 #g4)
          :precondition (and (isconf #q12) (isconf #q6) (isgrasp o9 #g4))
          :effect (isholdingmotion #q12 #t1907 #q6 o9 #g4)
   )
   (:action s1924_plan-holding-motion
          :parameters (#q12 #q6 o9 #g5)
          :precondition (and (isconf #q12) (isconf #q6) (isgrasp o9 #g5))
          :effect (isholdingmotion #q12 #t1908 #q6 o9 #g5)
   )
   (:action s1925_plan-holding-motion
          :parameters (#q12 #q7 o8 #g0)
          :precondition (and (isconf #q12) (isconf #q7) (isgrasp o8 #g0))
          :effect (isholdingmotion #q12 #t1909 #q7 o8 #g0)
   )
   (:action s1926_plan-holding-motion
          :parameters (#q12 #q7 o9 #g1)
          :precondition (and (isconf #q12) (isconf #q7) (isgrasp o9 #g1))
          :effect (isholdingmotion #q12 #t1910 #q7 o9 #g1)
   )
   (:action s1927_plan-holding-motion
          :parameters (#q12 #q7 o8 #g2)
          :precondition (and (isconf #q12) (isconf #q7) (isgrasp o8 #g2))
          :effect (isholdingmotion #q12 #t1911 #q7 o8 #g2)
   )
   (:action s1928_plan-holding-motion
          :parameters (#q12 #q7 o8 #g3)
          :precondition (and (isconf #q12) (isconf #q7) (isgrasp o8 #g3))
          :effect (isholdingmotion #q12 #t1912 #q7 o8 #g3)
   )
   (:action s1929_plan-holding-motion
          :parameters (#q12 #q7 o9 #g4)
          :precondition (and (isconf #q12) (isconf #q7) (isgrasp o9 #g4))
          :effect (isholdingmotion #q12 #t1913 #q7 o9 #g4)
   )
   (:action s1930_plan-holding-motion
          :parameters (#q12 #q7 o9 #g5)
          :precondition (and (isconf #q12) (isconf #q7) (isgrasp o9 #g5))
          :effect (isholdingmotion #q12 #t1914 #q7 o9 #g5)
   )
   (:action s1931_plan-holding-motion
          :parameters (#q12 #q8 o8 #g0)
          :precondition (and (isconf #q12) (isconf #q8) (isgrasp o8 #g0))
          :effect (isholdingmotion #q12 #t1915 #q8 o8 #g0)
   )
   (:action s1932_plan-holding-motion
          :parameters (#q12 #q8 o9 #g1)
          :precondition (and (isconf #q12) (isconf #q8) (isgrasp o9 #g1))
          :effect (isholdingmotion #q12 #t1916 #q8 o9 #g1)
   )
   (:action s1933_plan-holding-motion
          :parameters (#q12 #q8 o8 #g2)
          :precondition (and (isconf #q12) (isconf #q8) (isgrasp o8 #g2))
          :effect (isholdingmotion #q12 #t1917 #q8 o8 #g2)
   )
   (:action s1934_plan-holding-motion
          :parameters (#q12 #q8 o8 #g3)
          :precondition (and (isconf #q12) (isconf #q8) (isgrasp o8 #g3))
          :effect (isholdingmotion #q12 #t1918 #q8 o8 #g3)
   )
   (:action s1935_plan-holding-motion
          :parameters (#q12 #q8 o9 #g4)
          :precondition (and (isconf #q12) (isconf #q8) (isgrasp o9 #g4))
          :effect (isholdingmotion #q12 #t1919 #q8 o9 #g4)
   )
   (:action s1936_plan-holding-motion
          :parameters (#q12 #q8 o9 #g5)
          :precondition (and (isconf #q12) (isconf #q8) (isgrasp o9 #g5))
          :effect (isholdingmotion #q12 #t1920 #q8 o9 #g5)
   )
   (:action s1937_plan-holding-motion
          :parameters (#q12 #q9 o8 #g0)
          :precondition (and (isconf #q12) (isconf #q9) (isgrasp o8 #g0))
          :effect (isholdingmotion #q12 #t1921 #q9 o8 #g0)
   )
   (:action s1938_plan-holding-motion
          :parameters (#q12 #q9 o9 #g1)
          :precondition (and (isconf #q12) (isconf #q9) (isgrasp o9 #g1))
          :effect (isholdingmotion #q12 #t1922 #q9 o9 #g1)
   )
   (:action s1939_plan-holding-motion
          :parameters (#q12 #q9 o8 #g2)
          :precondition (and (isconf #q12) (isconf #q9) (isgrasp o8 #g2))
          :effect (isholdingmotion #q12 #t1923 #q9 o8 #g2)
   )
   (:action s1940_plan-holding-motion
          :parameters (#q12 #q9 o8 #g3)
          :precondition (and (isconf #q12) (isconf #q9) (isgrasp o8 #g3))
          :effect (isholdingmotion #q12 #t1924 #q9 o8 #g3)
   )
   (:action s1941_plan-holding-motion
          :parameters (#q12 #q9 o9 #g4)
          :precondition (and (isconf #q12) (isconf #q9) (isgrasp o9 #g4))
          :effect (isholdingmotion #q12 #t1925 #q9 o9 #g4)
   )
   (:action s1942_plan-holding-motion
          :parameters (#q12 #q9 o9 #g5)
          :precondition (and (isconf #q12) (isconf #q9) (isgrasp o9 #g5))
          :effect (isholdingmotion #q12 #t1926 #q9 o9 #g5)
   )
   (:action s1943_plan-holding-motion
          :parameters (#q12 #q10 o8 #g0)
          :precondition (and (isconf #q12) (isconf #q10) (isgrasp o8 #g0))
          :effect (isholdingmotion #q12 #t1927 #q10 o8 #g0)
   )
   (:action s1944_plan-holding-motion
          :parameters (#q12 #q10 o9 #g1)
          :precondition (and (isconf #q12) (isconf #q10) (isgrasp o9 #g1))
          :effect (isholdingmotion #q12 #t1928 #q10 o9 #g1)
   )
   (:action s1945_plan-holding-motion
          :parameters (#q12 #q10 o8 #g2)
          :precondition (and (isconf #q12) (isconf #q10) (isgrasp o8 #g2))
          :effect (isholdingmotion #q12 #t1929 #q10 o8 #g2)
   )
   (:action s1946_plan-holding-motion
          :parameters (#q12 #q10 o8 #g3)
          :precondition (and (isconf #q12) (isconf #q10) (isgrasp o8 #g3))
          :effect (isholdingmotion #q12 #t1930 #q10 o8 #g3)
   )
   (:action s1947_plan-holding-motion
          :parameters (#q12 #q10 o9 #g4)
          :precondition (and (isconf #q12) (isconf #q10) (isgrasp o9 #g4))
          :effect (isholdingmotion #q12 #t1931 #q10 o9 #g4)
   )
   (:action s1948_plan-holding-motion
          :parameters (#q12 #q10 o9 #g5)
          :precondition (and (isconf #q12) (isconf #q10) (isgrasp o9 #g5))
          :effect (isholdingmotion #q12 #t1932 #q10 o9 #g5)
   )
   (:action s1949_plan-holding-motion
          :parameters (#q12 #q11 o8 #g0)
          :precondition (and (isconf #q12) (isconf #q11) (isgrasp o8 #g0))
          :effect (isholdingmotion #q12 #t1933 #q11 o8 #g0)
   )
   (:action s1950_plan-holding-motion
          :parameters (#q12 #q11 o9 #g1)
          :precondition (and (isconf #q12) (isconf #q11) (isgrasp o9 #g1))
          :effect (isholdingmotion #q12 #t1934 #q11 o9 #g1)
   )
   (:action s1951_plan-holding-motion
          :parameters (#q12 #q11 o8 #g2)
          :precondition (and (isconf #q12) (isconf #q11) (isgrasp o8 #g2))
          :effect (isholdingmotion #q12 #t1935 #q11 o8 #g2)
   )
   (:action s1952_plan-holding-motion
          :parameters (#q12 #q11 o8 #g3)
          :precondition (and (isconf #q12) (isconf #q11) (isgrasp o8 #g3))
          :effect (isholdingmotion #q12 #t1936 #q11 o8 #g3)
   )
   (:action s1953_plan-holding-motion
          :parameters (#q12 #q11 o9 #g4)
          :precondition (and (isconf #q12) (isconf #q11) (isgrasp o9 #g4))
          :effect (isholdingmotion #q12 #t1937 #q11 o9 #g4)
   )
   (:action s1954_plan-holding-motion
          :parameters (#q12 #q11 o9 #g5)
          :precondition (and (isconf #q12) (isconf #q11) (isgrasp o9 #g5))
          :effect (isholdingmotion #q12 #t1938 #q11 o9 #g5)
   )
   (:action s1955_plan-holding-motion
          :parameters (#q12 #q12 o8 #g0)
          :precondition (and (isconf #q12) (isconf #q12) (isgrasp o8 #g0))
          :effect (isholdingmotion #q12 #t1939 #q12 o8 #g0)
   )
   (:action s1956_plan-holding-motion
          :parameters (#q12 #q12 o9 #g1)
          :precondition (and (isconf #q12) (isconf #q12) (isgrasp o9 #g1))
          :effect (isholdingmotion #q12 #t1940 #q12 o9 #g1)
   )
   (:action s1957_plan-holding-motion
          :parameters (#q12 #q12 o8 #g2)
          :precondition (and (isconf #q12) (isconf #q12) (isgrasp o8 #g2))
          :effect (isholdingmotion #q12 #t1941 #q12 o8 #g2)
   )
   (:action s1958_plan-holding-motion
          :parameters (#q12 #q12 o8 #g3)
          :precondition (and (isconf #q12) (isconf #q12) (isgrasp o8 #g3))
          :effect (isholdingmotion #q12 #t1942 #q12 o8 #g3)
   )
   (:action s1959_plan-holding-motion
          :parameters (#q12 #q12 o9 #g4)
          :precondition (and (isconf #q12) (isconf #q12) (isgrasp o9 #g4))
          :effect (isholdingmotion #q12 #t1943 #q12 o9 #g4)
   )
   (:action s1960_plan-holding-motion
          :parameters (#q12 #q12 o9 #g5)
          :precondition (and (isconf #q12) (isconf #q12) (isgrasp o9 #g5))
          :effect (isholdingmotion #q12 #t1944 #q12 o9 #g5)
   )
   (:action s1961_plan-holding-motion
          :parameters (#q12 #q13 o8 #g0)
          :precondition (and (isconf #q12) (isconf #q13) (isgrasp o8 #g0))
          :effect (isholdingmotion #q12 #t1945 #q13 o8 #g0)
   )
   (:action s1962_plan-holding-motion
          :parameters (#q12 #q13 o9 #g1)
          :precondition (and (isconf #q12) (isconf #q13) (isgrasp o9 #g1))
          :effect (isholdingmotion #q12 #t1946 #q13 o9 #g1)
   )
   (:action s1963_plan-holding-motion
          :parameters (#q12 #q13 o8 #g2)
          :precondition (and (isconf #q12) (isconf #q13) (isgrasp o8 #g2))
          :effect (isholdingmotion #q12 #t1947 #q13 o8 #g2)
   )
   (:action s1964_plan-holding-motion
          :parameters (#q12 #q13 o8 #g3)
          :precondition (and (isconf #q12) (isconf #q13) (isgrasp o8 #g3))
          :effect (isholdingmotion #q12 #t1948 #q13 o8 #g3)
   )
   (:action s1965_plan-holding-motion
          :parameters (#q12 #q13 o9 #g4)
          :precondition (and (isconf #q12) (isconf #q13) (isgrasp o9 #g4))
          :effect (isholdingmotion #q12 #t1949 #q13 o9 #g4)
   )
   (:action s1966_plan-holding-motion
          :parameters (#q12 #q13 o9 #g5)
          :precondition (and (isconf #q12) (isconf #q13) (isgrasp o9 #g5))
          :effect (isholdingmotion #q12 #t1950 #q13 o9 #g5)
   )
   (:action s1967_plan-holding-motion
          :parameters (#q12 #q14 o8 #g0)
          :precondition (and (isconf #q12) (isconf #q14) (isgrasp o8 #g0))
          :effect (isholdingmotion #q12 #t1951 #q14 o8 #g0)
   )
   (:action s1968_plan-holding-motion
          :parameters (#q12 #q14 o9 #g1)
          :precondition (and (isconf #q12) (isconf #q14) (isgrasp o9 #g1))
          :effect (isholdingmotion #q12 #t1952 #q14 o9 #g1)
   )
   (:action s1969_plan-holding-motion
          :parameters (#q12 #q14 o8 #g2)
          :precondition (and (isconf #q12) (isconf #q14) (isgrasp o8 #g2))
          :effect (isholdingmotion #q12 #t1953 #q14 o8 #g2)
   )
   (:action s1970_plan-holding-motion
          :parameters (#q12 #q14 o8 #g3)
          :precondition (and (isconf #q12) (isconf #q14) (isgrasp o8 #g3))
          :effect (isholdingmotion #q12 #t1954 #q14 o8 #g3)
   )
   (:action s1971_plan-holding-motion
          :parameters (#q12 #q14 o9 #g4)
          :precondition (and (isconf #q12) (isconf #q14) (isgrasp o9 #g4))
          :effect (isholdingmotion #q12 #t1955 #q14 o9 #g4)
   )
   (:action s1972_plan-holding-motion
          :parameters (#q12 #q14 o9 #g5)
          :precondition (and (isconf #q12) (isconf #q14) (isgrasp o9 #g5))
          :effect (isholdingmotion #q12 #t1956 #q14 o9 #g5)
   )
   (:action s1973_plan-holding-motion
          :parameters (#q12 #q15 o8 #g0)
          :precondition (and (isconf #q12) (isconf #q15) (isgrasp o8 #g0))
          :effect (isholdingmotion #q12 #t1957 #q15 o8 #g0)
   )
   (:action s1974_plan-holding-motion
          :parameters (#q12 #q15 o9 #g1)
          :precondition (and (isconf #q12) (isconf #q15) (isgrasp o9 #g1))
          :effect (isholdingmotion #q12 #t1958 #q15 o9 #g1)
   )
   (:action s1975_plan-holding-motion
          :parameters (#q12 #q15 o8 #g2)
          :precondition (and (isconf #q12) (isconf #q15) (isgrasp o8 #g2))
          :effect (isholdingmotion #q12 #t1959 #q15 o8 #g2)
   )
   (:action s1976_plan-holding-motion
          :parameters (#q12 #q15 o8 #g3)
          :precondition (and (isconf #q12) (isconf #q15) (isgrasp o8 #g3))
          :effect (isholdingmotion #q12 #t1960 #q15 o8 #g3)
   )
   (:action s1977_plan-holding-motion
          :parameters (#q12 #q15 o9 #g4)
          :precondition (and (isconf #q12) (isconf #q15) (isgrasp o9 #g4))
          :effect (isholdingmotion #q12 #t1961 #q15 o9 #g4)
   )
   (:action s1978_plan-holding-motion
          :parameters (#q12 #q15 o9 #g5)
          :precondition (and (isconf #q12) (isconf #q15) (isgrasp o9 #g5))
          :effect (isholdingmotion #q12 #t1962 #q15 o9 #g5)
   )
   (:action s1979_plan-holding-motion
          :parameters (#q12 #q16 o8 #g0)
          :precondition (and (isconf #q12) (isconf #q16) (isgrasp o8 #g0))
          :effect (isholdingmotion #q12 #t1963 #q16 o8 #g0)
   )
   (:action s1980_plan-holding-motion
          :parameters (#q12 #q16 o9 #g1)
          :precondition (and (isconf #q12) (isconf #q16) (isgrasp o9 #g1))
          :effect (isholdingmotion #q12 #t1964 #q16 o9 #g1)
   )
   (:action s1981_plan-holding-motion
          :parameters (#q12 #q16 o8 #g2)
          :precondition (and (isconf #q12) (isconf #q16) (isgrasp o8 #g2))
          :effect (isholdingmotion #q12 #t1965 #q16 o8 #g2)
   )
   (:action s1982_plan-holding-motion
          :parameters (#q12 #q16 o8 #g3)
          :precondition (and (isconf #q12) (isconf #q16) (isgrasp o8 #g3))
          :effect (isholdingmotion #q12 #t1966 #q16 o8 #g3)
   )
   (:action s1983_plan-holding-motion
          :parameters (#q12 #q16 o9 #g4)
          :precondition (and (isconf #q12) (isconf #q16) (isgrasp o9 #g4))
          :effect (isholdingmotion #q12 #t1967 #q16 o9 #g4)
   )
   (:action s1984_plan-holding-motion
          :parameters (#q12 #q16 o9 #g5)
          :precondition (and (isconf #q12) (isconf #q16) (isgrasp o9 #g5))
          :effect (isholdingmotion #q12 #t1968 #q16 o9 #g5)
   )
   (:action s1985_plan-holding-motion
          :parameters (#q12 #q17 o8 #g0)
          :precondition (and (isconf #q12) (isconf #q17) (isgrasp o8 #g0))
          :effect (isholdingmotion #q12 #t1969 #q17 o8 #g0)
   )
   (:action s1986_plan-holding-motion
          :parameters (#q12 #q17 o9 #g1)
          :precondition (and (isconf #q12) (isconf #q17) (isgrasp o9 #g1))
          :effect (isholdingmotion #q12 #t1970 #q17 o9 #g1)
   )
   (:action s1987_plan-holding-motion
          :parameters (#q12 #q17 o8 #g2)
          :precondition (and (isconf #q12) (isconf #q17) (isgrasp o8 #g2))
          :effect (isholdingmotion #q12 #t1971 #q17 o8 #g2)
   )
   (:action s1988_plan-holding-motion
          :parameters (#q12 #q17 o8 #g3)
          :precondition (and (isconf #q12) (isconf #q17) (isgrasp o8 #g3))
          :effect (isholdingmotion #q12 #t1972 #q17 o8 #g3)
   )
   (:action s1989_plan-holding-motion
          :parameters (#q12 #q17 o9 #g4)
          :precondition (and (isconf #q12) (isconf #q17) (isgrasp o9 #g4))
          :effect (isholdingmotion #q12 #t1973 #q17 o9 #g4)
   )
   (:action s1990_plan-holding-motion
          :parameters (#q12 #q17 o9 #g5)
          :precondition (and (isconf #q12) (isconf #q17) (isgrasp o9 #g5))
          :effect (isholdingmotion #q12 #t1974 #q17 o9 #g5)
   )
   (:action s1991_plan-holding-motion
          :parameters (#q13 q808 o8 #g0)
          :precondition (and (isconf #q13) (isconf q808) (isgrasp o8 #g0))
          :effect (isholdingmotion #q13 #t1975 q808 o8 #g0)
   )
   (:action s1992_plan-holding-motion
          :parameters (#q13 q808 o9 #g1)
          :precondition (and (isconf #q13) (isconf q808) (isgrasp o9 #g1))
          :effect (isholdingmotion #q13 #t1976 q808 o9 #g1)
   )
   (:action s1993_plan-holding-motion
          :parameters (#q13 q808 o8 #g2)
          :precondition (and (isconf #q13) (isconf q808) (isgrasp o8 #g2))
          :effect (isholdingmotion #q13 #t1977 q808 o8 #g2)
   )
   (:action s1994_plan-holding-motion
          :parameters (#q13 q808 o8 #g3)
          :precondition (and (isconf #q13) (isconf q808) (isgrasp o8 #g3))
          :effect (isholdingmotion #q13 #t1978 q808 o8 #g3)
   )
   (:action s1995_plan-holding-motion
          :parameters (#q13 q808 o9 #g4)
          :precondition (and (isconf #q13) (isconf q808) (isgrasp o9 #g4))
          :effect (isholdingmotion #q13 #t1979 q808 o9 #g4)
   )
   (:action s1996_plan-holding-motion
          :parameters (#q13 q808 o9 #g5)
          :precondition (and (isconf #q13) (isconf q808) (isgrasp o9 #g5))
          :effect (isholdingmotion #q13 #t1980 q808 o9 #g5)
   )
   (:action s1997_plan-holding-motion
          :parameters (#q13 #q0 o8 #g0)
          :precondition (and (isconf #q13) (isconf #q0) (isgrasp o8 #g0))
          :effect (isholdingmotion #q13 #t1981 #q0 o8 #g0)
   )
   (:action s1998_plan-holding-motion
          :parameters (#q13 #q0 o9 #g1)
          :precondition (and (isconf #q13) (isconf #q0) (isgrasp o9 #g1))
          :effect (isholdingmotion #q13 #t1982 #q0 o9 #g1)
   )
   (:action s1999_plan-holding-motion
          :parameters (#q13 #q0 o8 #g2)
          :precondition (and (isconf #q13) (isconf #q0) (isgrasp o8 #g2))
          :effect (isholdingmotion #q13 #t1983 #q0 o8 #g2)
   )
   (:action s2000_plan-holding-motion
          :parameters (#q13 #q0 o8 #g3)
          :precondition (and (isconf #q13) (isconf #q0) (isgrasp o8 #g3))
          :effect (isholdingmotion #q13 #t1984 #q0 o8 #g3)
   )
   (:action s2001_plan-holding-motion
          :parameters (#q13 #q0 o9 #g4)
          :precondition (and (isconf #q13) (isconf #q0) (isgrasp o9 #g4))
          :effect (isholdingmotion #q13 #t1985 #q0 o9 #g4)
   )
   (:action s2002_plan-holding-motion
          :parameters (#q13 #q0 o9 #g5)
          :precondition (and (isconf #q13) (isconf #q0) (isgrasp o9 #g5))
          :effect (isholdingmotion #q13 #t1986 #q0 o9 #g5)
   )
   (:action s2003_plan-holding-motion
          :parameters (#q13 #q1 o8 #g0)
          :precondition (and (isconf #q13) (isconf #q1) (isgrasp o8 #g0))
          :effect (isholdingmotion #q13 #t1987 #q1 o8 #g0)
   )
   (:action s2004_plan-holding-motion
          :parameters (#q13 #q1 o9 #g1)
          :precondition (and (isconf #q13) (isconf #q1) (isgrasp o9 #g1))
          :effect (isholdingmotion #q13 #t1988 #q1 o9 #g1)
   )
   (:action s2005_plan-holding-motion
          :parameters (#q13 #q1 o8 #g2)
          :precondition (and (isconf #q13) (isconf #q1) (isgrasp o8 #g2))
          :effect (isholdingmotion #q13 #t1989 #q1 o8 #g2)
   )
   (:action s2006_plan-holding-motion
          :parameters (#q13 #q1 o8 #g3)
          :precondition (and (isconf #q13) (isconf #q1) (isgrasp o8 #g3))
          :effect (isholdingmotion #q13 #t1990 #q1 o8 #g3)
   )
   (:action s2007_plan-holding-motion
          :parameters (#q13 #q1 o9 #g4)
          :precondition (and (isconf #q13) (isconf #q1) (isgrasp o9 #g4))
          :effect (isholdingmotion #q13 #t1991 #q1 o9 #g4)
   )
   (:action s2008_plan-holding-motion
          :parameters (#q13 #q1 o9 #g5)
          :precondition (and (isconf #q13) (isconf #q1) (isgrasp o9 #g5))
          :effect (isholdingmotion #q13 #t1992 #q1 o9 #g5)
   )
   (:action s2009_plan-holding-motion
          :parameters (#q13 #q2 o8 #g0)
          :precondition (and (isconf #q13) (isconf #q2) (isgrasp o8 #g0))
          :effect (isholdingmotion #q13 #t1993 #q2 o8 #g0)
   )
   (:action s2010_plan-holding-motion
          :parameters (#q13 #q2 o9 #g1)
          :precondition (and (isconf #q13) (isconf #q2) (isgrasp o9 #g1))
          :effect (isholdingmotion #q13 #t1994 #q2 o9 #g1)
   )
   (:action s2011_plan-holding-motion
          :parameters (#q13 #q2 o8 #g2)
          :precondition (and (isconf #q13) (isconf #q2) (isgrasp o8 #g2))
          :effect (isholdingmotion #q13 #t1995 #q2 o8 #g2)
   )
   (:action s2012_plan-holding-motion
          :parameters (#q13 #q2 o8 #g3)
          :precondition (and (isconf #q13) (isconf #q2) (isgrasp o8 #g3))
          :effect (isholdingmotion #q13 #t1996 #q2 o8 #g3)
   )
   (:action s2013_plan-holding-motion
          :parameters (#q13 #q2 o9 #g4)
          :precondition (and (isconf #q13) (isconf #q2) (isgrasp o9 #g4))
          :effect (isholdingmotion #q13 #t1997 #q2 o9 #g4)
   )
   (:action s2014_plan-holding-motion
          :parameters (#q13 #q2 o9 #g5)
          :precondition (and (isconf #q13) (isconf #q2) (isgrasp o9 #g5))
          :effect (isholdingmotion #q13 #t1998 #q2 o9 #g5)
   )
   (:action s2015_plan-holding-motion
          :parameters (#q13 #q3 o8 #g0)
          :precondition (and (isconf #q13) (isconf #q3) (isgrasp o8 #g0))
          :effect (isholdingmotion #q13 #t1999 #q3 o8 #g0)
   )
   (:action s2016_plan-holding-motion
          :parameters (#q13 #q3 o9 #g1)
          :precondition (and (isconf #q13) (isconf #q3) (isgrasp o9 #g1))
          :effect (isholdingmotion #q13 #t2000 #q3 o9 #g1)
   )
   (:action s2017_plan-holding-motion
          :parameters (#q13 #q3 o8 #g2)
          :precondition (and (isconf #q13) (isconf #q3) (isgrasp o8 #g2))
          :effect (isholdingmotion #q13 #t2001 #q3 o8 #g2)
   )
   (:action s2018_plan-holding-motion
          :parameters (#q13 #q3 o8 #g3)
          :precondition (and (isconf #q13) (isconf #q3) (isgrasp o8 #g3))
          :effect (isholdingmotion #q13 #t2002 #q3 o8 #g3)
   )
   (:action s2019_plan-holding-motion
          :parameters (#q13 #q3 o9 #g4)
          :precondition (and (isconf #q13) (isconf #q3) (isgrasp o9 #g4))
          :effect (isholdingmotion #q13 #t2003 #q3 o9 #g4)
   )
   (:action s2020_plan-holding-motion
          :parameters (#q13 #q3 o9 #g5)
          :precondition (and (isconf #q13) (isconf #q3) (isgrasp o9 #g5))
          :effect (isholdingmotion #q13 #t2004 #q3 o9 #g5)
   )
   (:action s2021_plan-holding-motion
          :parameters (#q13 #q4 o8 #g0)
          :precondition (and (isconf #q13) (isconf #q4) (isgrasp o8 #g0))
          :effect (isholdingmotion #q13 #t2005 #q4 o8 #g0)
   )
   (:action s2022_plan-holding-motion
          :parameters (#q13 #q4 o9 #g1)
          :precondition (and (isconf #q13) (isconf #q4) (isgrasp o9 #g1))
          :effect (isholdingmotion #q13 #t2006 #q4 o9 #g1)
   )
   (:action s2023_plan-holding-motion
          :parameters (#q13 #q4 o8 #g2)
          :precondition (and (isconf #q13) (isconf #q4) (isgrasp o8 #g2))
          :effect (isholdingmotion #q13 #t2007 #q4 o8 #g2)
   )
   (:action s2024_plan-holding-motion
          :parameters (#q13 #q4 o8 #g3)
          :precondition (and (isconf #q13) (isconf #q4) (isgrasp o8 #g3))
          :effect (isholdingmotion #q13 #t2008 #q4 o8 #g3)
   )
   (:action s2025_plan-holding-motion
          :parameters (#q13 #q4 o9 #g4)
          :precondition (and (isconf #q13) (isconf #q4) (isgrasp o9 #g4))
          :effect (isholdingmotion #q13 #t2009 #q4 o9 #g4)
   )
   (:action s2026_plan-holding-motion
          :parameters (#q13 #q4 o9 #g5)
          :precondition (and (isconf #q13) (isconf #q4) (isgrasp o9 #g5))
          :effect (isholdingmotion #q13 #t2010 #q4 o9 #g5)
   )
   (:action s2027_plan-holding-motion
          :parameters (#q13 #q5 o8 #g0)
          :precondition (and (isconf #q13) (isconf #q5) (isgrasp o8 #g0))
          :effect (isholdingmotion #q13 #t2011 #q5 o8 #g0)
   )
   (:action s2028_plan-holding-motion
          :parameters (#q13 #q5 o9 #g1)
          :precondition (and (isconf #q13) (isconf #q5) (isgrasp o9 #g1))
          :effect (isholdingmotion #q13 #t2012 #q5 o9 #g1)
   )
   (:action s2029_plan-holding-motion
          :parameters (#q13 #q5 o8 #g2)
          :precondition (and (isconf #q13) (isconf #q5) (isgrasp o8 #g2))
          :effect (isholdingmotion #q13 #t2013 #q5 o8 #g2)
   )
   (:action s2030_plan-holding-motion
          :parameters (#q13 #q5 o8 #g3)
          :precondition (and (isconf #q13) (isconf #q5) (isgrasp o8 #g3))
          :effect (isholdingmotion #q13 #t2014 #q5 o8 #g3)
   )
   (:action s2031_plan-holding-motion
          :parameters (#q13 #q5 o9 #g4)
          :precondition (and (isconf #q13) (isconf #q5) (isgrasp o9 #g4))
          :effect (isholdingmotion #q13 #t2015 #q5 o9 #g4)
   )
   (:action s2032_plan-holding-motion
          :parameters (#q13 #q5 o9 #g5)
          :precondition (and (isconf #q13) (isconf #q5) (isgrasp o9 #g5))
          :effect (isholdingmotion #q13 #t2016 #q5 o9 #g5)
   )
   (:action s2033_plan-holding-motion
          :parameters (#q13 #q6 o8 #g0)
          :precondition (and (isconf #q13) (isconf #q6) (isgrasp o8 #g0))
          :effect (isholdingmotion #q13 #t2017 #q6 o8 #g0)
   )
   (:action s2034_plan-holding-motion
          :parameters (#q13 #q6 o9 #g1)
          :precondition (and (isconf #q13) (isconf #q6) (isgrasp o9 #g1))
          :effect (isholdingmotion #q13 #t2018 #q6 o9 #g1)
   )
   (:action s2035_plan-holding-motion
          :parameters (#q13 #q6 o8 #g2)
          :precondition (and (isconf #q13) (isconf #q6) (isgrasp o8 #g2))
          :effect (isholdingmotion #q13 #t2019 #q6 o8 #g2)
   )
   (:action s2036_plan-holding-motion
          :parameters (#q13 #q6 o8 #g3)
          :precondition (and (isconf #q13) (isconf #q6) (isgrasp o8 #g3))
          :effect (isholdingmotion #q13 #t2020 #q6 o8 #g3)
   )
   (:action s2037_plan-holding-motion
          :parameters (#q13 #q6 o9 #g4)
          :precondition (and (isconf #q13) (isconf #q6) (isgrasp o9 #g4))
          :effect (isholdingmotion #q13 #t2021 #q6 o9 #g4)
   )
   (:action s2038_plan-holding-motion
          :parameters (#q13 #q6 o9 #g5)
          :precondition (and (isconf #q13) (isconf #q6) (isgrasp o9 #g5))
          :effect (isholdingmotion #q13 #t2022 #q6 o9 #g5)
   )
   (:action s2039_plan-holding-motion
          :parameters (#q13 #q7 o8 #g0)
          :precondition (and (isconf #q13) (isconf #q7) (isgrasp o8 #g0))
          :effect (isholdingmotion #q13 #t2023 #q7 o8 #g0)
   )
   (:action s2040_plan-holding-motion
          :parameters (#q13 #q7 o9 #g1)
          :precondition (and (isconf #q13) (isconf #q7) (isgrasp o9 #g1))
          :effect (isholdingmotion #q13 #t2024 #q7 o9 #g1)
   )
   (:action s2041_plan-holding-motion
          :parameters (#q13 #q7 o8 #g2)
          :precondition (and (isconf #q13) (isconf #q7) (isgrasp o8 #g2))
          :effect (isholdingmotion #q13 #t2025 #q7 o8 #g2)
   )
   (:action s2042_plan-holding-motion
          :parameters (#q13 #q7 o8 #g3)
          :precondition (and (isconf #q13) (isconf #q7) (isgrasp o8 #g3))
          :effect (isholdingmotion #q13 #t2026 #q7 o8 #g3)
   )
   (:action s2043_plan-holding-motion
          :parameters (#q13 #q7 o9 #g4)
          :precondition (and (isconf #q13) (isconf #q7) (isgrasp o9 #g4))
          :effect (isholdingmotion #q13 #t2027 #q7 o9 #g4)
   )
   (:action s2044_plan-holding-motion
          :parameters (#q13 #q7 o9 #g5)
          :precondition (and (isconf #q13) (isconf #q7) (isgrasp o9 #g5))
          :effect (isholdingmotion #q13 #t2028 #q7 o9 #g5)
   )
   (:action s2045_plan-holding-motion
          :parameters (#q13 #q8 o8 #g0)
          :precondition (and (isconf #q13) (isconf #q8) (isgrasp o8 #g0))
          :effect (isholdingmotion #q13 #t2029 #q8 o8 #g0)
   )
   (:action s2046_plan-holding-motion
          :parameters (#q13 #q8 o9 #g1)
          :precondition (and (isconf #q13) (isconf #q8) (isgrasp o9 #g1))
          :effect (isholdingmotion #q13 #t2030 #q8 o9 #g1)
   )
   (:action s2047_plan-holding-motion
          :parameters (#q13 #q8 o8 #g2)
          :precondition (and (isconf #q13) (isconf #q8) (isgrasp o8 #g2))
          :effect (isholdingmotion #q13 #t2031 #q8 o8 #g2)
   )
   (:action s2048_plan-holding-motion
          :parameters (#q13 #q8 o8 #g3)
          :precondition (and (isconf #q13) (isconf #q8) (isgrasp o8 #g3))
          :effect (isholdingmotion #q13 #t2032 #q8 o8 #g3)
   )
   (:action s2049_plan-holding-motion
          :parameters (#q13 #q8 o9 #g4)
          :precondition (and (isconf #q13) (isconf #q8) (isgrasp o9 #g4))
          :effect (isholdingmotion #q13 #t2033 #q8 o9 #g4)
   )
   (:action s2050_plan-holding-motion
          :parameters (#q13 #q8 o9 #g5)
          :precondition (and (isconf #q13) (isconf #q8) (isgrasp o9 #g5))
          :effect (isholdingmotion #q13 #t2034 #q8 o9 #g5)
   )
   (:action s2051_plan-holding-motion
          :parameters (#q13 #q9 o8 #g0)
          :precondition (and (isconf #q13) (isconf #q9) (isgrasp o8 #g0))
          :effect (isholdingmotion #q13 #t2035 #q9 o8 #g0)
   )
   (:action s2052_plan-holding-motion
          :parameters (#q13 #q9 o9 #g1)
          :precondition (and (isconf #q13) (isconf #q9) (isgrasp o9 #g1))
          :effect (isholdingmotion #q13 #t2036 #q9 o9 #g1)
   )
   (:action s2053_plan-holding-motion
          :parameters (#q13 #q9 o8 #g2)
          :precondition (and (isconf #q13) (isconf #q9) (isgrasp o8 #g2))
          :effect (isholdingmotion #q13 #t2037 #q9 o8 #g2)
   )
   (:action s2054_plan-holding-motion
          :parameters (#q13 #q9 o8 #g3)
          :precondition (and (isconf #q13) (isconf #q9) (isgrasp o8 #g3))
          :effect (isholdingmotion #q13 #t2038 #q9 o8 #g3)
   )
   (:action s2055_plan-holding-motion
          :parameters (#q13 #q9 o9 #g4)
          :precondition (and (isconf #q13) (isconf #q9) (isgrasp o9 #g4))
          :effect (isholdingmotion #q13 #t2039 #q9 o9 #g4)
   )
   (:action s2056_plan-holding-motion
          :parameters (#q13 #q9 o9 #g5)
          :precondition (and (isconf #q13) (isconf #q9) (isgrasp o9 #g5))
          :effect (isholdingmotion #q13 #t2040 #q9 o9 #g5)
   )
   (:action s2057_plan-holding-motion
          :parameters (#q13 #q10 o8 #g0)
          :precondition (and (isconf #q13) (isconf #q10) (isgrasp o8 #g0))
          :effect (isholdingmotion #q13 #t2041 #q10 o8 #g0)
   )
   (:action s2058_plan-holding-motion
          :parameters (#q13 #q10 o9 #g1)
          :precondition (and (isconf #q13) (isconf #q10) (isgrasp o9 #g1))
          :effect (isholdingmotion #q13 #t2042 #q10 o9 #g1)
   )
   (:action s2059_plan-holding-motion
          :parameters (#q13 #q10 o8 #g2)
          :precondition (and (isconf #q13) (isconf #q10) (isgrasp o8 #g2))
          :effect (isholdingmotion #q13 #t2043 #q10 o8 #g2)
   )
   (:action s2060_plan-holding-motion
          :parameters (#q13 #q10 o8 #g3)
          :precondition (and (isconf #q13) (isconf #q10) (isgrasp o8 #g3))
          :effect (isholdingmotion #q13 #t2044 #q10 o8 #g3)
   )
   (:action s2061_plan-holding-motion
          :parameters (#q13 #q10 o9 #g4)
          :precondition (and (isconf #q13) (isconf #q10) (isgrasp o9 #g4))
          :effect (isholdingmotion #q13 #t2045 #q10 o9 #g4)
   )
   (:action s2062_plan-holding-motion
          :parameters (#q13 #q10 o9 #g5)
          :precondition (and (isconf #q13) (isconf #q10) (isgrasp o9 #g5))
          :effect (isholdingmotion #q13 #t2046 #q10 o9 #g5)
   )
   (:action s2063_plan-holding-motion
          :parameters (#q13 #q11 o8 #g0)
          :precondition (and (isconf #q13) (isconf #q11) (isgrasp o8 #g0))
          :effect (isholdingmotion #q13 #t2047 #q11 o8 #g0)
   )
   (:action s2064_plan-holding-motion
          :parameters (#q13 #q11 o9 #g1)
          :precondition (and (isconf #q13) (isconf #q11) (isgrasp o9 #g1))
          :effect (isholdingmotion #q13 #t2048 #q11 o9 #g1)
   )
   (:action s2065_plan-holding-motion
          :parameters (#q13 #q11 o8 #g2)
          :precondition (and (isconf #q13) (isconf #q11) (isgrasp o8 #g2))
          :effect (isholdingmotion #q13 #t2049 #q11 o8 #g2)
   )
   (:action s2066_plan-holding-motion
          :parameters (#q13 #q11 o8 #g3)
          :precondition (and (isconf #q13) (isconf #q11) (isgrasp o8 #g3))
          :effect (isholdingmotion #q13 #t2050 #q11 o8 #g3)
   )
   (:action s2067_plan-holding-motion
          :parameters (#q13 #q11 o9 #g4)
          :precondition (and (isconf #q13) (isconf #q11) (isgrasp o9 #g4))
          :effect (isholdingmotion #q13 #t2051 #q11 o9 #g4)
   )
   (:action s2068_plan-holding-motion
          :parameters (#q13 #q11 o9 #g5)
          :precondition (and (isconf #q13) (isconf #q11) (isgrasp o9 #g5))
          :effect (isholdingmotion #q13 #t2052 #q11 o9 #g5)
   )
   (:action s2069_plan-holding-motion
          :parameters (#q13 #q12 o8 #g0)
          :precondition (and (isconf #q13) (isconf #q12) (isgrasp o8 #g0))
          :effect (isholdingmotion #q13 #t2053 #q12 o8 #g0)
   )
   (:action s2070_plan-holding-motion
          :parameters (#q13 #q12 o9 #g1)
          :precondition (and (isconf #q13) (isconf #q12) (isgrasp o9 #g1))
          :effect (isholdingmotion #q13 #t2054 #q12 o9 #g1)
   )
   (:action s2071_plan-holding-motion
          :parameters (#q13 #q12 o8 #g2)
          :precondition (and (isconf #q13) (isconf #q12) (isgrasp o8 #g2))
          :effect (isholdingmotion #q13 #t2055 #q12 o8 #g2)
   )
   (:action s2072_plan-holding-motion
          :parameters (#q13 #q12 o8 #g3)
          :precondition (and (isconf #q13) (isconf #q12) (isgrasp o8 #g3))
          :effect (isholdingmotion #q13 #t2056 #q12 o8 #g3)
   )
   (:action s2073_plan-holding-motion
          :parameters (#q13 #q12 o9 #g4)
          :precondition (and (isconf #q13) (isconf #q12) (isgrasp o9 #g4))
          :effect (isholdingmotion #q13 #t2057 #q12 o9 #g4)
   )
   (:action s2074_plan-holding-motion
          :parameters (#q13 #q12 o9 #g5)
          :precondition (and (isconf #q13) (isconf #q12) (isgrasp o9 #g5))
          :effect (isholdingmotion #q13 #t2058 #q12 o9 #g5)
   )
   (:action s2075_plan-holding-motion
          :parameters (#q13 #q13 o8 #g0)
          :precondition (and (isconf #q13) (isconf #q13) (isgrasp o8 #g0))
          :effect (isholdingmotion #q13 #t2059 #q13 o8 #g0)
   )
   (:action s2076_plan-holding-motion
          :parameters (#q13 #q13 o9 #g1)
          :precondition (and (isconf #q13) (isconf #q13) (isgrasp o9 #g1))
          :effect (isholdingmotion #q13 #t2060 #q13 o9 #g1)
   )
   (:action s2077_plan-holding-motion
          :parameters (#q13 #q13 o8 #g2)
          :precondition (and (isconf #q13) (isconf #q13) (isgrasp o8 #g2))
          :effect (isholdingmotion #q13 #t2061 #q13 o8 #g2)
   )
   (:action s2078_plan-holding-motion
          :parameters (#q13 #q13 o8 #g3)
          :precondition (and (isconf #q13) (isconf #q13) (isgrasp o8 #g3))
          :effect (isholdingmotion #q13 #t2062 #q13 o8 #g3)
   )
   (:action s2079_plan-holding-motion
          :parameters (#q13 #q13 o9 #g4)
          :precondition (and (isconf #q13) (isconf #q13) (isgrasp o9 #g4))
          :effect (isholdingmotion #q13 #t2063 #q13 o9 #g4)
   )
   (:action s2080_plan-holding-motion
          :parameters (#q13 #q13 o9 #g5)
          :precondition (and (isconf #q13) (isconf #q13) (isgrasp o9 #g5))
          :effect (isholdingmotion #q13 #t2064 #q13 o9 #g5)
   )
   (:action s2081_plan-holding-motion
          :parameters (#q13 #q14 o8 #g0)
          :precondition (and (isconf #q13) (isconf #q14) (isgrasp o8 #g0))
          :effect (isholdingmotion #q13 #t2065 #q14 o8 #g0)
   )
   (:action s2082_plan-holding-motion
          :parameters (#q13 #q14 o9 #g1)
          :precondition (and (isconf #q13) (isconf #q14) (isgrasp o9 #g1))
          :effect (isholdingmotion #q13 #t2066 #q14 o9 #g1)
   )
   (:action s2083_plan-holding-motion
          :parameters (#q13 #q14 o8 #g2)
          :precondition (and (isconf #q13) (isconf #q14) (isgrasp o8 #g2))
          :effect (isholdingmotion #q13 #t2067 #q14 o8 #g2)
   )
   (:action s2084_plan-holding-motion
          :parameters (#q13 #q14 o8 #g3)
          :precondition (and (isconf #q13) (isconf #q14) (isgrasp o8 #g3))
          :effect (isholdingmotion #q13 #t2068 #q14 o8 #g3)
   )
   (:action s2085_plan-holding-motion
          :parameters (#q13 #q14 o9 #g4)
          :precondition (and (isconf #q13) (isconf #q14) (isgrasp o9 #g4))
          :effect (isholdingmotion #q13 #t2069 #q14 o9 #g4)
   )
   (:action s2086_plan-holding-motion
          :parameters (#q13 #q14 o9 #g5)
          :precondition (and (isconf #q13) (isconf #q14) (isgrasp o9 #g5))
          :effect (isholdingmotion #q13 #t2070 #q14 o9 #g5)
   )
   (:action s2087_plan-holding-motion
          :parameters (#q13 #q15 o8 #g0)
          :precondition (and (isconf #q13) (isconf #q15) (isgrasp o8 #g0))
          :effect (isholdingmotion #q13 #t2071 #q15 o8 #g0)
   )
   (:action s2088_plan-holding-motion
          :parameters (#q13 #q15 o9 #g1)
          :precondition (and (isconf #q13) (isconf #q15) (isgrasp o9 #g1))
          :effect (isholdingmotion #q13 #t2072 #q15 o9 #g1)
   )
   (:action s2089_plan-holding-motion
          :parameters (#q13 #q15 o8 #g2)
          :precondition (and (isconf #q13) (isconf #q15) (isgrasp o8 #g2))
          :effect (isholdingmotion #q13 #t2073 #q15 o8 #g2)
   )
   (:action s2090_plan-holding-motion
          :parameters (#q13 #q15 o8 #g3)
          :precondition (and (isconf #q13) (isconf #q15) (isgrasp o8 #g3))
          :effect (isholdingmotion #q13 #t2074 #q15 o8 #g3)
   )
   (:action s2091_plan-holding-motion
          :parameters (#q13 #q15 o9 #g4)
          :precondition (and (isconf #q13) (isconf #q15) (isgrasp o9 #g4))
          :effect (isholdingmotion #q13 #t2075 #q15 o9 #g4)
   )
   (:action s2092_plan-holding-motion
          :parameters (#q13 #q15 o9 #g5)
          :precondition (and (isconf #q13) (isconf #q15) (isgrasp o9 #g5))
          :effect (isholdingmotion #q13 #t2076 #q15 o9 #g5)
   )
   (:action s2093_plan-holding-motion
          :parameters (#q13 #q16 o8 #g0)
          :precondition (and (isconf #q13) (isconf #q16) (isgrasp o8 #g0))
          :effect (isholdingmotion #q13 #t2077 #q16 o8 #g0)
   )
   (:action s2094_plan-holding-motion
          :parameters (#q13 #q16 o9 #g1)
          :precondition (and (isconf #q13) (isconf #q16) (isgrasp o9 #g1))
          :effect (isholdingmotion #q13 #t2078 #q16 o9 #g1)
   )
   (:action s2095_plan-holding-motion
          :parameters (#q13 #q16 o8 #g2)
          :precondition (and (isconf #q13) (isconf #q16) (isgrasp o8 #g2))
          :effect (isholdingmotion #q13 #t2079 #q16 o8 #g2)
   )
   (:action s2096_plan-holding-motion
          :parameters (#q13 #q16 o8 #g3)
          :precondition (and (isconf #q13) (isconf #q16) (isgrasp o8 #g3))
          :effect (isholdingmotion #q13 #t2080 #q16 o8 #g3)
   )
   (:action s2097_plan-holding-motion
          :parameters (#q13 #q16 o9 #g4)
          :precondition (and (isconf #q13) (isconf #q16) (isgrasp o9 #g4))
          :effect (isholdingmotion #q13 #t2081 #q16 o9 #g4)
   )
   (:action s2098_plan-holding-motion
          :parameters (#q13 #q16 o9 #g5)
          :precondition (and (isconf #q13) (isconf #q16) (isgrasp o9 #g5))
          :effect (isholdingmotion #q13 #t2082 #q16 o9 #g5)
   )
   (:action s2099_plan-holding-motion
          :parameters (#q13 #q17 o8 #g0)
          :precondition (and (isconf #q13) (isconf #q17) (isgrasp o8 #g0))
          :effect (isholdingmotion #q13 #t2083 #q17 o8 #g0)
   )
   (:action s2100_plan-holding-motion
          :parameters (#q13 #q17 o9 #g1)
          :precondition (and (isconf #q13) (isconf #q17) (isgrasp o9 #g1))
          :effect (isholdingmotion #q13 #t2084 #q17 o9 #g1)
   )
   (:action s2101_plan-holding-motion
          :parameters (#q13 #q17 o8 #g2)
          :precondition (and (isconf #q13) (isconf #q17) (isgrasp o8 #g2))
          :effect (isholdingmotion #q13 #t2085 #q17 o8 #g2)
   )
   (:action s2102_plan-holding-motion
          :parameters (#q13 #q17 o8 #g3)
          :precondition (and (isconf #q13) (isconf #q17) (isgrasp o8 #g3))
          :effect (isholdingmotion #q13 #t2086 #q17 o8 #g3)
   )
   (:action s2103_plan-holding-motion
          :parameters (#q13 #q17 o9 #g4)
          :precondition (and (isconf #q13) (isconf #q17) (isgrasp o9 #g4))
          :effect (isholdingmotion #q13 #t2087 #q17 o9 #g4)
   )
   (:action s2104_plan-holding-motion
          :parameters (#q13 #q17 o9 #g5)
          :precondition (and (isconf #q13) (isconf #q17) (isgrasp o9 #g5))
          :effect (isholdingmotion #q13 #t2088 #q17 o9 #g5)
   )
   (:action s2105_plan-holding-motion
          :parameters (#q14 q808 o8 #g0)
          :precondition (and (isconf #q14) (isconf q808) (isgrasp o8 #g0))
          :effect (isholdingmotion #q14 #t2089 q808 o8 #g0)
   )
   (:action s2106_plan-holding-motion
          :parameters (#q14 q808 o9 #g1)
          :precondition (and (isconf #q14) (isconf q808) (isgrasp o9 #g1))
          :effect (isholdingmotion #q14 #t2090 q808 o9 #g1)
   )
   (:action s2107_plan-holding-motion
          :parameters (#q14 q808 o8 #g2)
          :precondition (and (isconf #q14) (isconf q808) (isgrasp o8 #g2))
          :effect (isholdingmotion #q14 #t2091 q808 o8 #g2)
   )
   (:action s2108_plan-holding-motion
          :parameters (#q14 q808 o8 #g3)
          :precondition (and (isconf #q14) (isconf q808) (isgrasp o8 #g3))
          :effect (isholdingmotion #q14 #t2092 q808 o8 #g3)
   )
   (:action s2109_plan-holding-motion
          :parameters (#q14 q808 o9 #g4)
          :precondition (and (isconf #q14) (isconf q808) (isgrasp o9 #g4))
          :effect (isholdingmotion #q14 #t2093 q808 o9 #g4)
   )
   (:action s2110_plan-holding-motion
          :parameters (#q14 q808 o9 #g5)
          :precondition (and (isconf #q14) (isconf q808) (isgrasp o9 #g5))
          :effect (isholdingmotion #q14 #t2094 q808 o9 #g5)
   )
   (:action s2111_plan-holding-motion
          :parameters (#q14 #q0 o8 #g0)
          :precondition (and (isconf #q14) (isconf #q0) (isgrasp o8 #g0))
          :effect (isholdingmotion #q14 #t2095 #q0 o8 #g0)
   )
   (:action s2112_plan-holding-motion
          :parameters (#q14 #q0 o9 #g1)
          :precondition (and (isconf #q14) (isconf #q0) (isgrasp o9 #g1))
          :effect (isholdingmotion #q14 #t2096 #q0 o9 #g1)
   )
   (:action s2113_plan-holding-motion
          :parameters (#q14 #q0 o8 #g2)
          :precondition (and (isconf #q14) (isconf #q0) (isgrasp o8 #g2))
          :effect (isholdingmotion #q14 #t2097 #q0 o8 #g2)
   )
   (:action s2114_plan-holding-motion
          :parameters (#q14 #q0 o8 #g3)
          :precondition (and (isconf #q14) (isconf #q0) (isgrasp o8 #g3))
          :effect (isholdingmotion #q14 #t2098 #q0 o8 #g3)
   )
   (:action s2115_plan-holding-motion
          :parameters (#q14 #q0 o9 #g4)
          :precondition (and (isconf #q14) (isconf #q0) (isgrasp o9 #g4))
          :effect (isholdingmotion #q14 #t2099 #q0 o9 #g4)
   )
   (:action s2116_plan-holding-motion
          :parameters (#q14 #q0 o9 #g5)
          :precondition (and (isconf #q14) (isconf #q0) (isgrasp o9 #g5))
          :effect (isholdingmotion #q14 #t2100 #q0 o9 #g5)
   )
   (:action s2117_plan-holding-motion
          :parameters (#q14 #q1 o8 #g0)
          :precondition (and (isconf #q14) (isconf #q1) (isgrasp o8 #g0))
          :effect (isholdingmotion #q14 #t2101 #q1 o8 #g0)
   )
   (:action s2118_plan-holding-motion
          :parameters (#q14 #q1 o9 #g1)
          :precondition (and (isconf #q14) (isconf #q1) (isgrasp o9 #g1))
          :effect (isholdingmotion #q14 #t2102 #q1 o9 #g1)
   )
   (:action s2119_plan-holding-motion
          :parameters (#q14 #q1 o8 #g2)
          :precondition (and (isconf #q14) (isconf #q1) (isgrasp o8 #g2))
          :effect (isholdingmotion #q14 #t2103 #q1 o8 #g2)
   )
   (:action s2120_plan-holding-motion
          :parameters (#q14 #q1 o8 #g3)
          :precondition (and (isconf #q14) (isconf #q1) (isgrasp o8 #g3))
          :effect (isholdingmotion #q14 #t2104 #q1 o8 #g3)
   )
   (:action s2121_plan-holding-motion
          :parameters (#q14 #q1 o9 #g4)
          :precondition (and (isconf #q14) (isconf #q1) (isgrasp o9 #g4))
          :effect (isholdingmotion #q14 #t2105 #q1 o9 #g4)
   )
   (:action s2122_plan-holding-motion
          :parameters (#q14 #q1 o9 #g5)
          :precondition (and (isconf #q14) (isconf #q1) (isgrasp o9 #g5))
          :effect (isholdingmotion #q14 #t2106 #q1 o9 #g5)
   )
   (:action s2123_plan-holding-motion
          :parameters (#q14 #q2 o8 #g0)
          :precondition (and (isconf #q14) (isconf #q2) (isgrasp o8 #g0))
          :effect (isholdingmotion #q14 #t2107 #q2 o8 #g0)
   )
   (:action s2124_plan-holding-motion
          :parameters (#q14 #q2 o9 #g1)
          :precondition (and (isconf #q14) (isconf #q2) (isgrasp o9 #g1))
          :effect (isholdingmotion #q14 #t2108 #q2 o9 #g1)
   )
   (:action s2125_plan-holding-motion
          :parameters (#q14 #q2 o8 #g2)
          :precondition (and (isconf #q14) (isconf #q2) (isgrasp o8 #g2))
          :effect (isholdingmotion #q14 #t2109 #q2 o8 #g2)
   )
   (:action s2126_plan-holding-motion
          :parameters (#q14 #q2 o8 #g3)
          :precondition (and (isconf #q14) (isconf #q2) (isgrasp o8 #g3))
          :effect (isholdingmotion #q14 #t2110 #q2 o8 #g3)
   )
   (:action s2127_plan-holding-motion
          :parameters (#q14 #q2 o9 #g4)
          :precondition (and (isconf #q14) (isconf #q2) (isgrasp o9 #g4))
          :effect (isholdingmotion #q14 #t2111 #q2 o9 #g4)
   )
   (:action s2128_plan-holding-motion
          :parameters (#q14 #q2 o9 #g5)
          :precondition (and (isconf #q14) (isconf #q2) (isgrasp o9 #g5))
          :effect (isholdingmotion #q14 #t2112 #q2 o9 #g5)
   )
   (:action s2129_plan-holding-motion
          :parameters (#q14 #q3 o8 #g0)
          :precondition (and (isconf #q14) (isconf #q3) (isgrasp o8 #g0))
          :effect (isholdingmotion #q14 #t2113 #q3 o8 #g0)
   )
   (:action s2130_plan-holding-motion
          :parameters (#q14 #q3 o9 #g1)
          :precondition (and (isconf #q14) (isconf #q3) (isgrasp o9 #g1))
          :effect (isholdingmotion #q14 #t2114 #q3 o9 #g1)
   )
   (:action s2131_plan-holding-motion
          :parameters (#q14 #q3 o8 #g2)
          :precondition (and (isconf #q14) (isconf #q3) (isgrasp o8 #g2))
          :effect (isholdingmotion #q14 #t2115 #q3 o8 #g2)
   )
   (:action s2132_plan-holding-motion
          :parameters (#q14 #q3 o8 #g3)
          :precondition (and (isconf #q14) (isconf #q3) (isgrasp o8 #g3))
          :effect (isholdingmotion #q14 #t2116 #q3 o8 #g3)
   )
   (:action s2133_plan-holding-motion
          :parameters (#q14 #q3 o9 #g4)
          :precondition (and (isconf #q14) (isconf #q3) (isgrasp o9 #g4))
          :effect (isholdingmotion #q14 #t2117 #q3 o9 #g4)
   )
   (:action s2134_plan-holding-motion
          :parameters (#q14 #q3 o9 #g5)
          :precondition (and (isconf #q14) (isconf #q3) (isgrasp o9 #g5))
          :effect (isholdingmotion #q14 #t2118 #q3 o9 #g5)
   )
   (:action s2135_plan-holding-motion
          :parameters (#q14 #q4 o8 #g0)
          :precondition (and (isconf #q14) (isconf #q4) (isgrasp o8 #g0))
          :effect (isholdingmotion #q14 #t2119 #q4 o8 #g0)
   )
   (:action s2136_plan-holding-motion
          :parameters (#q14 #q4 o9 #g1)
          :precondition (and (isconf #q14) (isconf #q4) (isgrasp o9 #g1))
          :effect (isholdingmotion #q14 #t2120 #q4 o9 #g1)
   )
   (:action s2137_plan-holding-motion
          :parameters (#q14 #q4 o8 #g2)
          :precondition (and (isconf #q14) (isconf #q4) (isgrasp o8 #g2))
          :effect (isholdingmotion #q14 #t2121 #q4 o8 #g2)
   )
   (:action s2138_plan-holding-motion
          :parameters (#q14 #q4 o8 #g3)
          :precondition (and (isconf #q14) (isconf #q4) (isgrasp o8 #g3))
          :effect (isholdingmotion #q14 #t2122 #q4 o8 #g3)
   )
   (:action s2139_plan-holding-motion
          :parameters (#q14 #q4 o9 #g4)
          :precondition (and (isconf #q14) (isconf #q4) (isgrasp o9 #g4))
          :effect (isholdingmotion #q14 #t2123 #q4 o9 #g4)
   )
   (:action s2140_plan-holding-motion
          :parameters (#q14 #q4 o9 #g5)
          :precondition (and (isconf #q14) (isconf #q4) (isgrasp o9 #g5))
          :effect (isholdingmotion #q14 #t2124 #q4 o9 #g5)
   )
   (:action s2141_plan-holding-motion
          :parameters (#q14 #q5 o8 #g0)
          :precondition (and (isconf #q14) (isconf #q5) (isgrasp o8 #g0))
          :effect (isholdingmotion #q14 #t2125 #q5 o8 #g0)
   )
   (:action s2142_plan-holding-motion
          :parameters (#q14 #q5 o9 #g1)
          :precondition (and (isconf #q14) (isconf #q5) (isgrasp o9 #g1))
          :effect (isholdingmotion #q14 #t2126 #q5 o9 #g1)
   )
   (:action s2143_plan-holding-motion
          :parameters (#q14 #q5 o8 #g2)
          :precondition (and (isconf #q14) (isconf #q5) (isgrasp o8 #g2))
          :effect (isholdingmotion #q14 #t2127 #q5 o8 #g2)
   )
   (:action s2144_plan-holding-motion
          :parameters (#q14 #q5 o8 #g3)
          :precondition (and (isconf #q14) (isconf #q5) (isgrasp o8 #g3))
          :effect (isholdingmotion #q14 #t2128 #q5 o8 #g3)
   )
   (:action s2145_plan-holding-motion
          :parameters (#q14 #q5 o9 #g4)
          :precondition (and (isconf #q14) (isconf #q5) (isgrasp o9 #g4))
          :effect (isholdingmotion #q14 #t2129 #q5 o9 #g4)
   )
   (:action s2146_plan-holding-motion
          :parameters (#q14 #q5 o9 #g5)
          :precondition (and (isconf #q14) (isconf #q5) (isgrasp o9 #g5))
          :effect (isholdingmotion #q14 #t2130 #q5 o9 #g5)
   )
   (:action s2147_plan-holding-motion
          :parameters (#q14 #q6 o8 #g0)
          :precondition (and (isconf #q14) (isconf #q6) (isgrasp o8 #g0))
          :effect (isholdingmotion #q14 #t2131 #q6 o8 #g0)
   )
   (:action s2148_plan-holding-motion
          :parameters (#q14 #q6 o9 #g1)
          :precondition (and (isconf #q14) (isconf #q6) (isgrasp o9 #g1))
          :effect (isholdingmotion #q14 #t2132 #q6 o9 #g1)
   )
   (:action s2149_plan-holding-motion
          :parameters (#q14 #q6 o8 #g2)
          :precondition (and (isconf #q14) (isconf #q6) (isgrasp o8 #g2))
          :effect (isholdingmotion #q14 #t2133 #q6 o8 #g2)
   )
   (:action s2150_plan-holding-motion
          :parameters (#q14 #q6 o8 #g3)
          :precondition (and (isconf #q14) (isconf #q6) (isgrasp o8 #g3))
          :effect (isholdingmotion #q14 #t2134 #q6 o8 #g3)
   )
   (:action s2151_plan-holding-motion
          :parameters (#q14 #q6 o9 #g4)
          :precondition (and (isconf #q14) (isconf #q6) (isgrasp o9 #g4))
          :effect (isholdingmotion #q14 #t2135 #q6 o9 #g4)
   )
   (:action s2152_plan-holding-motion
          :parameters (#q14 #q6 o9 #g5)
          :precondition (and (isconf #q14) (isconf #q6) (isgrasp o9 #g5))
          :effect (isholdingmotion #q14 #t2136 #q6 o9 #g5)
   )
   (:action s2153_plan-holding-motion
          :parameters (#q14 #q7 o8 #g0)
          :precondition (and (isconf #q14) (isconf #q7) (isgrasp o8 #g0))
          :effect (isholdingmotion #q14 #t2137 #q7 o8 #g0)
   )
   (:action s2154_plan-holding-motion
          :parameters (#q14 #q7 o9 #g1)
          :precondition (and (isconf #q14) (isconf #q7) (isgrasp o9 #g1))
          :effect (isholdingmotion #q14 #t2138 #q7 o9 #g1)
   )
   (:action s2155_plan-holding-motion
          :parameters (#q14 #q7 o8 #g2)
          :precondition (and (isconf #q14) (isconf #q7) (isgrasp o8 #g2))
          :effect (isholdingmotion #q14 #t2139 #q7 o8 #g2)
   )
   (:action s2156_plan-holding-motion
          :parameters (#q14 #q7 o8 #g3)
          :precondition (and (isconf #q14) (isconf #q7) (isgrasp o8 #g3))
          :effect (isholdingmotion #q14 #t2140 #q7 o8 #g3)
   )
   (:action s2157_plan-holding-motion
          :parameters (#q14 #q7 o9 #g4)
          :precondition (and (isconf #q14) (isconf #q7) (isgrasp o9 #g4))
          :effect (isholdingmotion #q14 #t2141 #q7 o9 #g4)
   )
   (:action s2158_plan-holding-motion
          :parameters (#q14 #q7 o9 #g5)
          :precondition (and (isconf #q14) (isconf #q7) (isgrasp o9 #g5))
          :effect (isholdingmotion #q14 #t2142 #q7 o9 #g5)
   )
   (:action s2159_plan-holding-motion
          :parameters (#q14 #q8 o8 #g0)
          :precondition (and (isconf #q14) (isconf #q8) (isgrasp o8 #g0))
          :effect (isholdingmotion #q14 #t2143 #q8 o8 #g0)
   )
   (:action s2160_plan-holding-motion
          :parameters (#q14 #q8 o9 #g1)
          :precondition (and (isconf #q14) (isconf #q8) (isgrasp o9 #g1))
          :effect (isholdingmotion #q14 #t2144 #q8 o9 #g1)
   )
   (:action s2161_plan-holding-motion
          :parameters (#q14 #q8 o8 #g2)
          :precondition (and (isconf #q14) (isconf #q8) (isgrasp o8 #g2))
          :effect (isholdingmotion #q14 #t2145 #q8 o8 #g2)
   )
   (:action s2162_plan-holding-motion
          :parameters (#q14 #q8 o8 #g3)
          :precondition (and (isconf #q14) (isconf #q8) (isgrasp o8 #g3))
          :effect (isholdingmotion #q14 #t2146 #q8 o8 #g3)
   )
   (:action s2163_plan-holding-motion
          :parameters (#q14 #q8 o9 #g4)
          :precondition (and (isconf #q14) (isconf #q8) (isgrasp o9 #g4))
          :effect (isholdingmotion #q14 #t2147 #q8 o9 #g4)
   )
   (:action s2164_plan-holding-motion
          :parameters (#q14 #q8 o9 #g5)
          :precondition (and (isconf #q14) (isconf #q8) (isgrasp o9 #g5))
          :effect (isholdingmotion #q14 #t2148 #q8 o9 #g5)
   )
   (:action s2165_plan-holding-motion
          :parameters (#q14 #q9 o8 #g0)
          :precondition (and (isconf #q14) (isconf #q9) (isgrasp o8 #g0))
          :effect (isholdingmotion #q14 #t2149 #q9 o8 #g0)
   )
   (:action s2166_plan-holding-motion
          :parameters (#q14 #q9 o9 #g1)
          :precondition (and (isconf #q14) (isconf #q9) (isgrasp o9 #g1))
          :effect (isholdingmotion #q14 #t2150 #q9 o9 #g1)
   )
   (:action s2167_plan-holding-motion
          :parameters (#q14 #q9 o8 #g2)
          :precondition (and (isconf #q14) (isconf #q9) (isgrasp o8 #g2))
          :effect (isholdingmotion #q14 #t2151 #q9 o8 #g2)
   )
   (:action s2168_plan-holding-motion
          :parameters (#q14 #q9 o8 #g3)
          :precondition (and (isconf #q14) (isconf #q9) (isgrasp o8 #g3))
          :effect (isholdingmotion #q14 #t2152 #q9 o8 #g3)
   )
   (:action s2169_plan-holding-motion
          :parameters (#q14 #q9 o9 #g4)
          :precondition (and (isconf #q14) (isconf #q9) (isgrasp o9 #g4))
          :effect (isholdingmotion #q14 #t2153 #q9 o9 #g4)
   )
   (:action s2170_plan-holding-motion
          :parameters (#q14 #q9 o9 #g5)
          :precondition (and (isconf #q14) (isconf #q9) (isgrasp o9 #g5))
          :effect (isholdingmotion #q14 #t2154 #q9 o9 #g5)
   )
   (:action s2171_plan-holding-motion
          :parameters (#q14 #q10 o8 #g0)
          :precondition (and (isconf #q14) (isconf #q10) (isgrasp o8 #g0))
          :effect (isholdingmotion #q14 #t2155 #q10 o8 #g0)
   )
   (:action s2172_plan-holding-motion
          :parameters (#q14 #q10 o9 #g1)
          :precondition (and (isconf #q14) (isconf #q10) (isgrasp o9 #g1))
          :effect (isholdingmotion #q14 #t2156 #q10 o9 #g1)
   )
   (:action s2173_plan-holding-motion
          :parameters (#q14 #q10 o8 #g2)
          :precondition (and (isconf #q14) (isconf #q10) (isgrasp o8 #g2))
          :effect (isholdingmotion #q14 #t2157 #q10 o8 #g2)
   )
   (:action s2174_plan-holding-motion
          :parameters (#q14 #q10 o8 #g3)
          :precondition (and (isconf #q14) (isconf #q10) (isgrasp o8 #g3))
          :effect (isholdingmotion #q14 #t2158 #q10 o8 #g3)
   )
   (:action s2175_plan-holding-motion
          :parameters (#q14 #q10 o9 #g4)
          :precondition (and (isconf #q14) (isconf #q10) (isgrasp o9 #g4))
          :effect (isholdingmotion #q14 #t2159 #q10 o9 #g4)
   )
   (:action s2176_plan-holding-motion
          :parameters (#q14 #q10 o9 #g5)
          :precondition (and (isconf #q14) (isconf #q10) (isgrasp o9 #g5))
          :effect (isholdingmotion #q14 #t2160 #q10 o9 #g5)
   )
   (:action s2177_plan-holding-motion
          :parameters (#q14 #q11 o8 #g0)
          :precondition (and (isconf #q14) (isconf #q11) (isgrasp o8 #g0))
          :effect (isholdingmotion #q14 #t2161 #q11 o8 #g0)
   )
   (:action s2178_plan-holding-motion
          :parameters (#q14 #q11 o9 #g1)
          :precondition (and (isconf #q14) (isconf #q11) (isgrasp o9 #g1))
          :effect (isholdingmotion #q14 #t2162 #q11 o9 #g1)
   )
   (:action s2179_plan-holding-motion
          :parameters (#q14 #q11 o8 #g2)
          :precondition (and (isconf #q14) (isconf #q11) (isgrasp o8 #g2))
          :effect (isholdingmotion #q14 #t2163 #q11 o8 #g2)
   )
   (:action s2180_plan-holding-motion
          :parameters (#q14 #q11 o8 #g3)
          :precondition (and (isconf #q14) (isconf #q11) (isgrasp o8 #g3))
          :effect (isholdingmotion #q14 #t2164 #q11 o8 #g3)
   )
   (:action s2181_plan-holding-motion
          :parameters (#q14 #q11 o9 #g4)
          :precondition (and (isconf #q14) (isconf #q11) (isgrasp o9 #g4))
          :effect (isholdingmotion #q14 #t2165 #q11 o9 #g4)
   )
   (:action s2182_plan-holding-motion
          :parameters (#q14 #q11 o9 #g5)
          :precondition (and (isconf #q14) (isconf #q11) (isgrasp o9 #g5))
          :effect (isholdingmotion #q14 #t2166 #q11 o9 #g5)
   )
   (:action s2183_plan-holding-motion
          :parameters (#q14 #q12 o8 #g0)
          :precondition (and (isconf #q14) (isconf #q12) (isgrasp o8 #g0))
          :effect (isholdingmotion #q14 #t2167 #q12 o8 #g0)
   )
   (:action s2184_plan-holding-motion
          :parameters (#q14 #q12 o9 #g1)
          :precondition (and (isconf #q14) (isconf #q12) (isgrasp o9 #g1))
          :effect (isholdingmotion #q14 #t2168 #q12 o9 #g1)
   )
   (:action s2185_plan-holding-motion
          :parameters (#q14 #q12 o8 #g2)
          :precondition (and (isconf #q14) (isconf #q12) (isgrasp o8 #g2))
          :effect (isholdingmotion #q14 #t2169 #q12 o8 #g2)
   )
   (:action s2186_plan-holding-motion
          :parameters (#q14 #q12 o8 #g3)
          :precondition (and (isconf #q14) (isconf #q12) (isgrasp o8 #g3))
          :effect (isholdingmotion #q14 #t2170 #q12 o8 #g3)
   )
   (:action s2187_plan-holding-motion
          :parameters (#q14 #q12 o9 #g4)
          :precondition (and (isconf #q14) (isconf #q12) (isgrasp o9 #g4))
          :effect (isholdingmotion #q14 #t2171 #q12 o9 #g4)
   )
   (:action s2188_plan-holding-motion
          :parameters (#q14 #q12 o9 #g5)
          :precondition (and (isconf #q14) (isconf #q12) (isgrasp o9 #g5))
          :effect (isholdingmotion #q14 #t2172 #q12 o9 #g5)
   )
   (:action s2189_plan-holding-motion
          :parameters (#q14 #q13 o8 #g0)
          :precondition (and (isconf #q14) (isconf #q13) (isgrasp o8 #g0))
          :effect (isholdingmotion #q14 #t2173 #q13 o8 #g0)
   )
   (:action s2190_plan-holding-motion
          :parameters (#q14 #q13 o9 #g1)
          :precondition (and (isconf #q14) (isconf #q13) (isgrasp o9 #g1))
          :effect (isholdingmotion #q14 #t2174 #q13 o9 #g1)
   )
   (:action s2191_plan-holding-motion
          :parameters (#q14 #q13 o8 #g2)
          :precondition (and (isconf #q14) (isconf #q13) (isgrasp o8 #g2))
          :effect (isholdingmotion #q14 #t2175 #q13 o8 #g2)
   )
   (:action s2192_plan-holding-motion
          :parameters (#q14 #q13 o8 #g3)
          :precondition (and (isconf #q14) (isconf #q13) (isgrasp o8 #g3))
          :effect (isholdingmotion #q14 #t2176 #q13 o8 #g3)
   )
   (:action s2193_plan-holding-motion
          :parameters (#q14 #q13 o9 #g4)
          :precondition (and (isconf #q14) (isconf #q13) (isgrasp o9 #g4))
          :effect (isholdingmotion #q14 #t2177 #q13 o9 #g4)
   )
   (:action s2194_plan-holding-motion
          :parameters (#q14 #q13 o9 #g5)
          :precondition (and (isconf #q14) (isconf #q13) (isgrasp o9 #g5))
          :effect (isholdingmotion #q14 #t2178 #q13 o9 #g5)
   )
   (:action s2195_plan-holding-motion
          :parameters (#q14 #q14 o8 #g0)
          :precondition (and (isconf #q14) (isconf #q14) (isgrasp o8 #g0))
          :effect (isholdingmotion #q14 #t2179 #q14 o8 #g0)
   )
   (:action s2196_plan-holding-motion
          :parameters (#q14 #q14 o9 #g1)
          :precondition (and (isconf #q14) (isconf #q14) (isgrasp o9 #g1))
          :effect (isholdingmotion #q14 #t2180 #q14 o9 #g1)
   )
   (:action s2197_plan-holding-motion
          :parameters (#q14 #q14 o8 #g2)
          :precondition (and (isconf #q14) (isconf #q14) (isgrasp o8 #g2))
          :effect (isholdingmotion #q14 #t2181 #q14 o8 #g2)
   )
   (:action s2198_plan-holding-motion
          :parameters (#q14 #q14 o8 #g3)
          :precondition (and (isconf #q14) (isconf #q14) (isgrasp o8 #g3))
          :effect (isholdingmotion #q14 #t2182 #q14 o8 #g3)
   )
   (:action s2199_plan-holding-motion
          :parameters (#q14 #q14 o9 #g4)
          :precondition (and (isconf #q14) (isconf #q14) (isgrasp o9 #g4))
          :effect (isholdingmotion #q14 #t2183 #q14 o9 #g4)
   )
   (:action s2200_plan-holding-motion
          :parameters (#q14 #q14 o9 #g5)
          :precondition (and (isconf #q14) (isconf #q14) (isgrasp o9 #g5))
          :effect (isholdingmotion #q14 #t2184 #q14 o9 #g5)
   )
   (:action s2201_plan-holding-motion
          :parameters (#q14 #q15 o8 #g0)
          :precondition (and (isconf #q14) (isconf #q15) (isgrasp o8 #g0))
          :effect (isholdingmotion #q14 #t2185 #q15 o8 #g0)
   )
   (:action s2202_plan-holding-motion
          :parameters (#q14 #q15 o9 #g1)
          :precondition (and (isconf #q14) (isconf #q15) (isgrasp o9 #g1))
          :effect (isholdingmotion #q14 #t2186 #q15 o9 #g1)
   )
   (:action s2203_plan-holding-motion
          :parameters (#q14 #q15 o8 #g2)
          :precondition (and (isconf #q14) (isconf #q15) (isgrasp o8 #g2))
          :effect (isholdingmotion #q14 #t2187 #q15 o8 #g2)
   )
   (:action s2204_plan-holding-motion
          :parameters (#q14 #q15 o8 #g3)
          :precondition (and (isconf #q14) (isconf #q15) (isgrasp o8 #g3))
          :effect (isholdingmotion #q14 #t2188 #q15 o8 #g3)
   )
   (:action s2205_plan-holding-motion
          :parameters (#q14 #q15 o9 #g4)
          :precondition (and (isconf #q14) (isconf #q15) (isgrasp o9 #g4))
          :effect (isholdingmotion #q14 #t2189 #q15 o9 #g4)
   )
   (:action s2206_plan-holding-motion
          :parameters (#q14 #q15 o9 #g5)
          :precondition (and (isconf #q14) (isconf #q15) (isgrasp o9 #g5))
          :effect (isholdingmotion #q14 #t2190 #q15 o9 #g5)
   )
   (:action s2207_plan-holding-motion
          :parameters (#q14 #q16 o8 #g0)
          :precondition (and (isconf #q14) (isconf #q16) (isgrasp o8 #g0))
          :effect (isholdingmotion #q14 #t2191 #q16 o8 #g0)
   )
   (:action s2208_plan-holding-motion
          :parameters (#q14 #q16 o9 #g1)
          :precondition (and (isconf #q14) (isconf #q16) (isgrasp o9 #g1))
          :effect (isholdingmotion #q14 #t2192 #q16 o9 #g1)
   )
   (:action s2209_plan-holding-motion
          :parameters (#q14 #q16 o8 #g2)
          :precondition (and (isconf #q14) (isconf #q16) (isgrasp o8 #g2))
          :effect (isholdingmotion #q14 #t2193 #q16 o8 #g2)
   )
   (:action s2210_plan-holding-motion
          :parameters (#q14 #q16 o8 #g3)
          :precondition (and (isconf #q14) (isconf #q16) (isgrasp o8 #g3))
          :effect (isholdingmotion #q14 #t2194 #q16 o8 #g3)
   )
   (:action s2211_plan-holding-motion
          :parameters (#q14 #q16 o9 #g4)
          :precondition (and (isconf #q14) (isconf #q16) (isgrasp o9 #g4))
          :effect (isholdingmotion #q14 #t2195 #q16 o9 #g4)
   )
   (:action s2212_plan-holding-motion
          :parameters (#q14 #q16 o9 #g5)
          :precondition (and (isconf #q14) (isconf #q16) (isgrasp o9 #g5))
          :effect (isholdingmotion #q14 #t2196 #q16 o9 #g5)
   )
   (:action s2213_plan-holding-motion
          :parameters (#q14 #q17 o8 #g0)
          :precondition (and (isconf #q14) (isconf #q17) (isgrasp o8 #g0))
          :effect (isholdingmotion #q14 #t2197 #q17 o8 #g0)
   )
   (:action s2214_plan-holding-motion
          :parameters (#q14 #q17 o9 #g1)
          :precondition (and (isconf #q14) (isconf #q17) (isgrasp o9 #g1))
          :effect (isholdingmotion #q14 #t2198 #q17 o9 #g1)
   )
   (:action s2215_plan-holding-motion
          :parameters (#q14 #q17 o8 #g2)
          :precondition (and (isconf #q14) (isconf #q17) (isgrasp o8 #g2))
          :effect (isholdingmotion #q14 #t2199 #q17 o8 #g2)
   )
   (:action s2216_plan-holding-motion
          :parameters (#q14 #q17 o8 #g3)
          :precondition (and (isconf #q14) (isconf #q17) (isgrasp o8 #g3))
          :effect (isholdingmotion #q14 #t2200 #q17 o8 #g3)
   )
   (:action s2217_plan-holding-motion
          :parameters (#q14 #q17 o9 #g4)
          :precondition (and (isconf #q14) (isconf #q17) (isgrasp o9 #g4))
          :effect (isholdingmotion #q14 #t2201 #q17 o9 #g4)
   )
   (:action s2218_plan-holding-motion
          :parameters (#q14 #q17 o9 #g5)
          :precondition (and (isconf #q14) (isconf #q17) (isgrasp o9 #g5))
          :effect (isholdingmotion #q14 #t2202 #q17 o9 #g5)
   )
   (:action s2219_plan-holding-motion
          :parameters (#q15 q808 o8 #g0)
          :precondition (and (isconf #q15) (isconf q808) (isgrasp o8 #g0))
          :effect (isholdingmotion #q15 #t2203 q808 o8 #g0)
   )
   (:action s2220_plan-holding-motion
          :parameters (#q15 q808 o9 #g1)
          :precondition (and (isconf #q15) (isconf q808) (isgrasp o9 #g1))
          :effect (isholdingmotion #q15 #t2204 q808 o9 #g1)
   )
   (:action s2221_plan-holding-motion
          :parameters (#q15 q808 o8 #g2)
          :precondition (and (isconf #q15) (isconf q808) (isgrasp o8 #g2))
          :effect (isholdingmotion #q15 #t2205 q808 o8 #g2)
   )
   (:action s2222_plan-holding-motion
          :parameters (#q15 q808 o8 #g3)
          :precondition (and (isconf #q15) (isconf q808) (isgrasp o8 #g3))
          :effect (isholdingmotion #q15 #t2206 q808 o8 #g3)
   )
   (:action s2223_plan-holding-motion
          :parameters (#q15 q808 o9 #g4)
          :precondition (and (isconf #q15) (isconf q808) (isgrasp o9 #g4))
          :effect (isholdingmotion #q15 #t2207 q808 o9 #g4)
   )
   (:action s2224_plan-holding-motion
          :parameters (#q15 q808 o9 #g5)
          :precondition (and (isconf #q15) (isconf q808) (isgrasp o9 #g5))
          :effect (isholdingmotion #q15 #t2208 q808 o9 #g5)
   )
   (:action s2225_plan-holding-motion
          :parameters (#q15 #q0 o8 #g0)
          :precondition (and (isconf #q15) (isconf #q0) (isgrasp o8 #g0))
          :effect (isholdingmotion #q15 #t2209 #q0 o8 #g0)
   )
   (:action s2226_plan-holding-motion
          :parameters (#q15 #q0 o9 #g1)
          :precondition (and (isconf #q15) (isconf #q0) (isgrasp o9 #g1))
          :effect (isholdingmotion #q15 #t2210 #q0 o9 #g1)
   )
   (:action s2227_plan-holding-motion
          :parameters (#q15 #q0 o8 #g2)
          :precondition (and (isconf #q15) (isconf #q0) (isgrasp o8 #g2))
          :effect (isholdingmotion #q15 #t2211 #q0 o8 #g2)
   )
   (:action s2228_plan-holding-motion
          :parameters (#q15 #q0 o8 #g3)
          :precondition (and (isconf #q15) (isconf #q0) (isgrasp o8 #g3))
          :effect (isholdingmotion #q15 #t2212 #q0 o8 #g3)
   )
   (:action s2229_plan-holding-motion
          :parameters (#q15 #q0 o9 #g4)
          :precondition (and (isconf #q15) (isconf #q0) (isgrasp o9 #g4))
          :effect (isholdingmotion #q15 #t2213 #q0 o9 #g4)
   )
   (:action s2230_plan-holding-motion
          :parameters (#q15 #q0 o9 #g5)
          :precondition (and (isconf #q15) (isconf #q0) (isgrasp o9 #g5))
          :effect (isholdingmotion #q15 #t2214 #q0 o9 #g5)
   )
   (:action s2231_plan-holding-motion
          :parameters (#q15 #q1 o8 #g0)
          :precondition (and (isconf #q15) (isconf #q1) (isgrasp o8 #g0))
          :effect (isholdingmotion #q15 #t2215 #q1 o8 #g0)
   )
   (:action s2232_plan-holding-motion
          :parameters (#q15 #q1 o9 #g1)
          :precondition (and (isconf #q15) (isconf #q1) (isgrasp o9 #g1))
          :effect (isholdingmotion #q15 #t2216 #q1 o9 #g1)
   )
   (:action s2233_plan-holding-motion
          :parameters (#q15 #q1 o8 #g2)
          :precondition (and (isconf #q15) (isconf #q1) (isgrasp o8 #g2))
          :effect (isholdingmotion #q15 #t2217 #q1 o8 #g2)
   )
   (:action s2234_plan-holding-motion
          :parameters (#q15 #q1 o8 #g3)
          :precondition (and (isconf #q15) (isconf #q1) (isgrasp o8 #g3))
          :effect (isholdingmotion #q15 #t2218 #q1 o8 #g3)
   )
   (:action s2235_plan-holding-motion
          :parameters (#q15 #q1 o9 #g4)
          :precondition (and (isconf #q15) (isconf #q1) (isgrasp o9 #g4))
          :effect (isholdingmotion #q15 #t2219 #q1 o9 #g4)
   )
   (:action s2236_plan-holding-motion
          :parameters (#q15 #q1 o9 #g5)
          :precondition (and (isconf #q15) (isconf #q1) (isgrasp o9 #g5))
          :effect (isholdingmotion #q15 #t2220 #q1 o9 #g5)
   )
   (:action s2237_plan-holding-motion
          :parameters (#q15 #q2 o8 #g0)
          :precondition (and (isconf #q15) (isconf #q2) (isgrasp o8 #g0))
          :effect (isholdingmotion #q15 #t2221 #q2 o8 #g0)
   )
   (:action s2238_plan-holding-motion
          :parameters (#q15 #q2 o9 #g1)
          :precondition (and (isconf #q15) (isconf #q2) (isgrasp o9 #g1))
          :effect (isholdingmotion #q15 #t2222 #q2 o9 #g1)
   )
   (:action s2239_plan-holding-motion
          :parameters (#q15 #q2 o8 #g2)
          :precondition (and (isconf #q15) (isconf #q2) (isgrasp o8 #g2))
          :effect (isholdingmotion #q15 #t2223 #q2 o8 #g2)
   )
   (:action s2240_plan-holding-motion
          :parameters (#q15 #q2 o8 #g3)
          :precondition (and (isconf #q15) (isconf #q2) (isgrasp o8 #g3))
          :effect (isholdingmotion #q15 #t2224 #q2 o8 #g3)
   )
   (:action s2241_plan-holding-motion
          :parameters (#q15 #q2 o9 #g4)
          :precondition (and (isconf #q15) (isconf #q2) (isgrasp o9 #g4))
          :effect (isholdingmotion #q15 #t2225 #q2 o9 #g4)
   )
   (:action s2242_plan-holding-motion
          :parameters (#q15 #q2 o9 #g5)
          :precondition (and (isconf #q15) (isconf #q2) (isgrasp o9 #g5))
          :effect (isholdingmotion #q15 #t2226 #q2 o9 #g5)
   )
   (:action s2243_plan-holding-motion
          :parameters (#q15 #q3 o8 #g0)
          :precondition (and (isconf #q15) (isconf #q3) (isgrasp o8 #g0))
          :effect (isholdingmotion #q15 #t2227 #q3 o8 #g0)
   )
   (:action s2244_plan-holding-motion
          :parameters (#q15 #q3 o9 #g1)
          :precondition (and (isconf #q15) (isconf #q3) (isgrasp o9 #g1))
          :effect (isholdingmotion #q15 #t2228 #q3 o9 #g1)
   )
   (:action s2245_plan-holding-motion
          :parameters (#q15 #q3 o8 #g2)
          :precondition (and (isconf #q15) (isconf #q3) (isgrasp o8 #g2))
          :effect (isholdingmotion #q15 #t2229 #q3 o8 #g2)
   )
   (:action s2246_plan-holding-motion
          :parameters (#q15 #q3 o8 #g3)
          :precondition (and (isconf #q15) (isconf #q3) (isgrasp o8 #g3))
          :effect (isholdingmotion #q15 #t2230 #q3 o8 #g3)
   )
   (:action s2247_plan-holding-motion
          :parameters (#q15 #q3 o9 #g4)
          :precondition (and (isconf #q15) (isconf #q3) (isgrasp o9 #g4))
          :effect (isholdingmotion #q15 #t2231 #q3 o9 #g4)
   )
   (:action s2248_plan-holding-motion
          :parameters (#q15 #q3 o9 #g5)
          :precondition (and (isconf #q15) (isconf #q3) (isgrasp o9 #g5))
          :effect (isholdingmotion #q15 #t2232 #q3 o9 #g5)
   )
   (:action s2249_plan-holding-motion
          :parameters (#q15 #q4 o8 #g0)
          :precondition (and (isconf #q15) (isconf #q4) (isgrasp o8 #g0))
          :effect (isholdingmotion #q15 #t2233 #q4 o8 #g0)
   )
   (:action s2250_plan-holding-motion
          :parameters (#q15 #q4 o9 #g1)
          :precondition (and (isconf #q15) (isconf #q4) (isgrasp o9 #g1))
          :effect (isholdingmotion #q15 #t2234 #q4 o9 #g1)
   )
   (:action s2251_plan-holding-motion
          :parameters (#q15 #q4 o8 #g2)
          :precondition (and (isconf #q15) (isconf #q4) (isgrasp o8 #g2))
          :effect (isholdingmotion #q15 #t2235 #q4 o8 #g2)
   )
   (:action s2252_plan-holding-motion
          :parameters (#q15 #q4 o8 #g3)
          :precondition (and (isconf #q15) (isconf #q4) (isgrasp o8 #g3))
          :effect (isholdingmotion #q15 #t2236 #q4 o8 #g3)
   )
   (:action s2253_plan-holding-motion
          :parameters (#q15 #q4 o9 #g4)
          :precondition (and (isconf #q15) (isconf #q4) (isgrasp o9 #g4))
          :effect (isholdingmotion #q15 #t2237 #q4 o9 #g4)
   )
   (:action s2254_plan-holding-motion
          :parameters (#q15 #q4 o9 #g5)
          :precondition (and (isconf #q15) (isconf #q4) (isgrasp o9 #g5))
          :effect (isholdingmotion #q15 #t2238 #q4 o9 #g5)
   )
   (:action s2255_plan-holding-motion
          :parameters (#q15 #q5 o8 #g0)
          :precondition (and (isconf #q15) (isconf #q5) (isgrasp o8 #g0))
          :effect (isholdingmotion #q15 #t2239 #q5 o8 #g0)
   )
   (:action s2256_plan-holding-motion
          :parameters (#q15 #q5 o9 #g1)
          :precondition (and (isconf #q15) (isconf #q5) (isgrasp o9 #g1))
          :effect (isholdingmotion #q15 #t2240 #q5 o9 #g1)
   )
   (:action s2257_plan-holding-motion
          :parameters (#q15 #q5 o8 #g2)
          :precondition (and (isconf #q15) (isconf #q5) (isgrasp o8 #g2))
          :effect (isholdingmotion #q15 #t2241 #q5 o8 #g2)
   )
   (:action s2258_plan-holding-motion
          :parameters (#q15 #q5 o8 #g3)
          :precondition (and (isconf #q15) (isconf #q5) (isgrasp o8 #g3))
          :effect (isholdingmotion #q15 #t2242 #q5 o8 #g3)
   )
   (:action s2259_plan-holding-motion
          :parameters (#q15 #q5 o9 #g4)
          :precondition (and (isconf #q15) (isconf #q5) (isgrasp o9 #g4))
          :effect (isholdingmotion #q15 #t2243 #q5 o9 #g4)
   )
   (:action s2260_plan-holding-motion
          :parameters (#q15 #q5 o9 #g5)
          :precondition (and (isconf #q15) (isconf #q5) (isgrasp o9 #g5))
          :effect (isholdingmotion #q15 #t2244 #q5 o9 #g5)
   )
   (:action s2261_plan-holding-motion
          :parameters (#q15 #q6 o8 #g0)
          :precondition (and (isconf #q15) (isconf #q6) (isgrasp o8 #g0))
          :effect (isholdingmotion #q15 #t2245 #q6 o8 #g0)
   )
   (:action s2262_plan-holding-motion
          :parameters (#q15 #q6 o9 #g1)
          :precondition (and (isconf #q15) (isconf #q6) (isgrasp o9 #g1))
          :effect (isholdingmotion #q15 #t2246 #q6 o9 #g1)
   )
   (:action s2263_plan-holding-motion
          :parameters (#q15 #q6 o8 #g2)
          :precondition (and (isconf #q15) (isconf #q6) (isgrasp o8 #g2))
          :effect (isholdingmotion #q15 #t2247 #q6 o8 #g2)
   )
   (:action s2264_plan-holding-motion
          :parameters (#q15 #q6 o8 #g3)
          :precondition (and (isconf #q15) (isconf #q6) (isgrasp o8 #g3))
          :effect (isholdingmotion #q15 #t2248 #q6 o8 #g3)
   )
   (:action s2265_plan-holding-motion
          :parameters (#q15 #q6 o9 #g4)
          :precondition (and (isconf #q15) (isconf #q6) (isgrasp o9 #g4))
          :effect (isholdingmotion #q15 #t2249 #q6 o9 #g4)
   )
   (:action s2266_plan-holding-motion
          :parameters (#q15 #q6 o9 #g5)
          :precondition (and (isconf #q15) (isconf #q6) (isgrasp o9 #g5))
          :effect (isholdingmotion #q15 #t2250 #q6 o9 #g5)
   )
   (:action s2267_plan-holding-motion
          :parameters (#q15 #q7 o8 #g0)
          :precondition (and (isconf #q15) (isconf #q7) (isgrasp o8 #g0))
          :effect (isholdingmotion #q15 #t2251 #q7 o8 #g0)
   )
   (:action s2268_plan-holding-motion
          :parameters (#q15 #q7 o9 #g1)
          :precondition (and (isconf #q15) (isconf #q7) (isgrasp o9 #g1))
          :effect (isholdingmotion #q15 #t2252 #q7 o9 #g1)
   )
   (:action s2269_plan-holding-motion
          :parameters (#q15 #q7 o8 #g2)
          :precondition (and (isconf #q15) (isconf #q7) (isgrasp o8 #g2))
          :effect (isholdingmotion #q15 #t2253 #q7 o8 #g2)
   )
   (:action s2270_plan-holding-motion
          :parameters (#q15 #q7 o8 #g3)
          :precondition (and (isconf #q15) (isconf #q7) (isgrasp o8 #g3))
          :effect (isholdingmotion #q15 #t2254 #q7 o8 #g3)
   )
   (:action s2271_plan-holding-motion
          :parameters (#q15 #q7 o9 #g4)
          :precondition (and (isconf #q15) (isconf #q7) (isgrasp o9 #g4))
          :effect (isholdingmotion #q15 #t2255 #q7 o9 #g4)
   )
   (:action s2272_plan-holding-motion
          :parameters (#q15 #q7 o9 #g5)
          :precondition (and (isconf #q15) (isconf #q7) (isgrasp o9 #g5))
          :effect (isholdingmotion #q15 #t2256 #q7 o9 #g5)
   )
   (:action s2273_plan-holding-motion
          :parameters (#q15 #q8 o8 #g0)
          :precondition (and (isconf #q15) (isconf #q8) (isgrasp o8 #g0))
          :effect (isholdingmotion #q15 #t2257 #q8 o8 #g0)
   )
   (:action s2274_plan-holding-motion
          :parameters (#q15 #q8 o9 #g1)
          :precondition (and (isconf #q15) (isconf #q8) (isgrasp o9 #g1))
          :effect (isholdingmotion #q15 #t2258 #q8 o9 #g1)
   )
   (:action s2275_plan-holding-motion
          :parameters (#q15 #q8 o8 #g2)
          :precondition (and (isconf #q15) (isconf #q8) (isgrasp o8 #g2))
          :effect (isholdingmotion #q15 #t2259 #q8 o8 #g2)
   )
   (:action s2276_plan-holding-motion
          :parameters (#q15 #q8 o8 #g3)
          :precondition (and (isconf #q15) (isconf #q8) (isgrasp o8 #g3))
          :effect (isholdingmotion #q15 #t2260 #q8 o8 #g3)
   )
   (:action s2277_plan-holding-motion
          :parameters (#q15 #q8 o9 #g4)
          :precondition (and (isconf #q15) (isconf #q8) (isgrasp o9 #g4))
          :effect (isholdingmotion #q15 #t2261 #q8 o9 #g4)
   )
   (:action s2278_plan-holding-motion
          :parameters (#q15 #q8 o9 #g5)
          :precondition (and (isconf #q15) (isconf #q8) (isgrasp o9 #g5))
          :effect (isholdingmotion #q15 #t2262 #q8 o9 #g5)
   )
   (:action s2279_plan-holding-motion
          :parameters (#q15 #q9 o8 #g0)
          :precondition (and (isconf #q15) (isconf #q9) (isgrasp o8 #g0))
          :effect (isholdingmotion #q15 #t2263 #q9 o8 #g0)
   )
   (:action s2280_plan-holding-motion
          :parameters (#q15 #q9 o9 #g1)
          :precondition (and (isconf #q15) (isconf #q9) (isgrasp o9 #g1))
          :effect (isholdingmotion #q15 #t2264 #q9 o9 #g1)
   )
   (:action s2281_plan-holding-motion
          :parameters (#q15 #q9 o8 #g2)
          :precondition (and (isconf #q15) (isconf #q9) (isgrasp o8 #g2))
          :effect (isholdingmotion #q15 #t2265 #q9 o8 #g2)
   )
   (:action s2282_plan-holding-motion
          :parameters (#q15 #q9 o8 #g3)
          :precondition (and (isconf #q15) (isconf #q9) (isgrasp o8 #g3))
          :effect (isholdingmotion #q15 #t2266 #q9 o8 #g3)
   )
   (:action s2283_plan-holding-motion
          :parameters (#q15 #q9 o9 #g4)
          :precondition (and (isconf #q15) (isconf #q9) (isgrasp o9 #g4))
          :effect (isholdingmotion #q15 #t2267 #q9 o9 #g4)
   )
   (:action s2284_plan-holding-motion
          :parameters (#q15 #q9 o9 #g5)
          :precondition (and (isconf #q15) (isconf #q9) (isgrasp o9 #g5))
          :effect (isholdingmotion #q15 #t2268 #q9 o9 #g5)
   )
   (:action s2285_plan-holding-motion
          :parameters (#q15 #q10 o8 #g0)
          :precondition (and (isconf #q15) (isconf #q10) (isgrasp o8 #g0))
          :effect (isholdingmotion #q15 #t2269 #q10 o8 #g0)
   )
   (:action s2286_plan-holding-motion
          :parameters (#q15 #q10 o9 #g1)
          :precondition (and (isconf #q15) (isconf #q10) (isgrasp o9 #g1))
          :effect (isholdingmotion #q15 #t2270 #q10 o9 #g1)
   )
   (:action s2287_plan-holding-motion
          :parameters (#q15 #q10 o8 #g2)
          :precondition (and (isconf #q15) (isconf #q10) (isgrasp o8 #g2))
          :effect (isholdingmotion #q15 #t2271 #q10 o8 #g2)
   )
   (:action s2288_plan-holding-motion
          :parameters (#q15 #q10 o8 #g3)
          :precondition (and (isconf #q15) (isconf #q10) (isgrasp o8 #g3))
          :effect (isholdingmotion #q15 #t2272 #q10 o8 #g3)
   )
   (:action s2289_plan-holding-motion
          :parameters (#q15 #q10 o9 #g4)
          :precondition (and (isconf #q15) (isconf #q10) (isgrasp o9 #g4))
          :effect (isholdingmotion #q15 #t2273 #q10 o9 #g4)
   )
   (:action s2290_plan-holding-motion
          :parameters (#q15 #q10 o9 #g5)
          :precondition (and (isconf #q15) (isconf #q10) (isgrasp o9 #g5))
          :effect (isholdingmotion #q15 #t2274 #q10 o9 #g5)
   )
   (:action s2291_plan-holding-motion
          :parameters (#q15 #q11 o8 #g0)
          :precondition (and (isconf #q15) (isconf #q11) (isgrasp o8 #g0))
          :effect (isholdingmotion #q15 #t2275 #q11 o8 #g0)
   )
   (:action s2292_plan-holding-motion
          :parameters (#q15 #q11 o9 #g1)
          :precondition (and (isconf #q15) (isconf #q11) (isgrasp o9 #g1))
          :effect (isholdingmotion #q15 #t2276 #q11 o9 #g1)
   )
   (:action s2293_plan-holding-motion
          :parameters (#q15 #q11 o8 #g2)
          :precondition (and (isconf #q15) (isconf #q11) (isgrasp o8 #g2))
          :effect (isholdingmotion #q15 #t2277 #q11 o8 #g2)
   )
   (:action s2294_plan-holding-motion
          :parameters (#q15 #q11 o8 #g3)
          :precondition (and (isconf #q15) (isconf #q11) (isgrasp o8 #g3))
          :effect (isholdingmotion #q15 #t2278 #q11 o8 #g3)
   )
   (:action s2295_plan-holding-motion
          :parameters (#q15 #q11 o9 #g4)
          :precondition (and (isconf #q15) (isconf #q11) (isgrasp o9 #g4))
          :effect (isholdingmotion #q15 #t2279 #q11 o9 #g4)
   )
   (:action s2296_plan-holding-motion
          :parameters (#q15 #q11 o9 #g5)
          :precondition (and (isconf #q15) (isconf #q11) (isgrasp o9 #g5))
          :effect (isholdingmotion #q15 #t2280 #q11 o9 #g5)
   )
   (:action s2297_plan-holding-motion
          :parameters (#q15 #q12 o8 #g0)
          :precondition (and (isconf #q15) (isconf #q12) (isgrasp o8 #g0))
          :effect (isholdingmotion #q15 #t2281 #q12 o8 #g0)
   )
   (:action s2298_plan-holding-motion
          :parameters (#q15 #q12 o9 #g1)
          :precondition (and (isconf #q15) (isconf #q12) (isgrasp o9 #g1))
          :effect (isholdingmotion #q15 #t2282 #q12 o9 #g1)
   )
   (:action s2299_plan-holding-motion
          :parameters (#q15 #q12 o8 #g2)
          :precondition (and (isconf #q15) (isconf #q12) (isgrasp o8 #g2))
          :effect (isholdingmotion #q15 #t2283 #q12 o8 #g2)
   )
   (:action s2300_plan-holding-motion
          :parameters (#q15 #q12 o8 #g3)
          :precondition (and (isconf #q15) (isconf #q12) (isgrasp o8 #g3))
          :effect (isholdingmotion #q15 #t2284 #q12 o8 #g3)
   )
   (:action s2301_plan-holding-motion
          :parameters (#q15 #q12 o9 #g4)
          :precondition (and (isconf #q15) (isconf #q12) (isgrasp o9 #g4))
          :effect (isholdingmotion #q15 #t2285 #q12 o9 #g4)
   )
   (:action s2302_plan-holding-motion
          :parameters (#q15 #q12 o9 #g5)
          :precondition (and (isconf #q15) (isconf #q12) (isgrasp o9 #g5))
          :effect (isholdingmotion #q15 #t2286 #q12 o9 #g5)
   )
   (:action s2303_plan-holding-motion
          :parameters (#q15 #q13 o8 #g0)
          :precondition (and (isconf #q15) (isconf #q13) (isgrasp o8 #g0))
          :effect (isholdingmotion #q15 #t2287 #q13 o8 #g0)
   )
   (:action s2304_plan-holding-motion
          :parameters (#q15 #q13 o9 #g1)
          :precondition (and (isconf #q15) (isconf #q13) (isgrasp o9 #g1))
          :effect (isholdingmotion #q15 #t2288 #q13 o9 #g1)
   )
   (:action s2305_plan-holding-motion
          :parameters (#q15 #q13 o8 #g2)
          :precondition (and (isconf #q15) (isconf #q13) (isgrasp o8 #g2))
          :effect (isholdingmotion #q15 #t2289 #q13 o8 #g2)
   )
   (:action s2306_plan-holding-motion
          :parameters (#q15 #q13 o8 #g3)
          :precondition (and (isconf #q15) (isconf #q13) (isgrasp o8 #g3))
          :effect (isholdingmotion #q15 #t2290 #q13 o8 #g3)
   )
   (:action s2307_plan-holding-motion
          :parameters (#q15 #q13 o9 #g4)
          :precondition (and (isconf #q15) (isconf #q13) (isgrasp o9 #g4))
          :effect (isholdingmotion #q15 #t2291 #q13 o9 #g4)
   )
   (:action s2308_plan-holding-motion
          :parameters (#q15 #q13 o9 #g5)
          :precondition (and (isconf #q15) (isconf #q13) (isgrasp o9 #g5))
          :effect (isholdingmotion #q15 #t2292 #q13 o9 #g5)
   )
   (:action s2309_plan-holding-motion
          :parameters (#q15 #q14 o8 #g0)
          :precondition (and (isconf #q15) (isconf #q14) (isgrasp o8 #g0))
          :effect (isholdingmotion #q15 #t2293 #q14 o8 #g0)
   )
   (:action s2310_plan-holding-motion
          :parameters (#q15 #q14 o9 #g1)
          :precondition (and (isconf #q15) (isconf #q14) (isgrasp o9 #g1))
          :effect (isholdingmotion #q15 #t2294 #q14 o9 #g1)
   )
   (:action s2311_plan-holding-motion
          :parameters (#q15 #q14 o8 #g2)
          :precondition (and (isconf #q15) (isconf #q14) (isgrasp o8 #g2))
          :effect (isholdingmotion #q15 #t2295 #q14 o8 #g2)
   )
   (:action s2312_plan-holding-motion
          :parameters (#q15 #q14 o8 #g3)
          :precondition (and (isconf #q15) (isconf #q14) (isgrasp o8 #g3))
          :effect (isholdingmotion #q15 #t2296 #q14 o8 #g3)
   )
   (:action s2313_plan-holding-motion
          :parameters (#q15 #q14 o9 #g4)
          :precondition (and (isconf #q15) (isconf #q14) (isgrasp o9 #g4))
          :effect (isholdingmotion #q15 #t2297 #q14 o9 #g4)
   )
   (:action s2314_plan-holding-motion
          :parameters (#q15 #q14 o9 #g5)
          :precondition (and (isconf #q15) (isconf #q14) (isgrasp o9 #g5))
          :effect (isholdingmotion #q15 #t2298 #q14 o9 #g5)
   )
   (:action s2315_plan-holding-motion
          :parameters (#q15 #q15 o8 #g0)
          :precondition (and (isconf #q15) (isconf #q15) (isgrasp o8 #g0))
          :effect (isholdingmotion #q15 #t2299 #q15 o8 #g0)
   )
   (:action s2316_plan-holding-motion
          :parameters (#q15 #q15 o9 #g1)
          :precondition (and (isconf #q15) (isconf #q15) (isgrasp o9 #g1))
          :effect (isholdingmotion #q15 #t2300 #q15 o9 #g1)
   )
   (:action s2317_plan-holding-motion
          :parameters (#q15 #q15 o8 #g2)
          :precondition (and (isconf #q15) (isconf #q15) (isgrasp o8 #g2))
          :effect (isholdingmotion #q15 #t2301 #q15 o8 #g2)
   )
   (:action s2318_plan-holding-motion
          :parameters (#q15 #q15 o8 #g3)
          :precondition (and (isconf #q15) (isconf #q15) (isgrasp o8 #g3))
          :effect (isholdingmotion #q15 #t2302 #q15 o8 #g3)
   )
   (:action s2319_plan-holding-motion
          :parameters (#q15 #q15 o9 #g4)
          :precondition (and (isconf #q15) (isconf #q15) (isgrasp o9 #g4))
          :effect (isholdingmotion #q15 #t2303 #q15 o9 #g4)
   )
   (:action s2320_plan-holding-motion
          :parameters (#q15 #q15 o9 #g5)
          :precondition (and (isconf #q15) (isconf #q15) (isgrasp o9 #g5))
          :effect (isholdingmotion #q15 #t2304 #q15 o9 #g5)
   )
   (:action s2321_plan-holding-motion
          :parameters (#q15 #q16 o8 #g0)
          :precondition (and (isconf #q15) (isconf #q16) (isgrasp o8 #g0))
          :effect (isholdingmotion #q15 #t2305 #q16 o8 #g0)
   )
   (:action s2322_plan-holding-motion
          :parameters (#q15 #q16 o9 #g1)
          :precondition (and (isconf #q15) (isconf #q16) (isgrasp o9 #g1))
          :effect (isholdingmotion #q15 #t2306 #q16 o9 #g1)
   )
   (:action s2323_plan-holding-motion
          :parameters (#q15 #q16 o8 #g2)
          :precondition (and (isconf #q15) (isconf #q16) (isgrasp o8 #g2))
          :effect (isholdingmotion #q15 #t2307 #q16 o8 #g2)
   )
   (:action s2324_plan-holding-motion
          :parameters (#q15 #q16 o8 #g3)
          :precondition (and (isconf #q15) (isconf #q16) (isgrasp o8 #g3))
          :effect (isholdingmotion #q15 #t2308 #q16 o8 #g3)
   )
   (:action s2325_plan-holding-motion
          :parameters (#q15 #q16 o9 #g4)
          :precondition (and (isconf #q15) (isconf #q16) (isgrasp o9 #g4))
          :effect (isholdingmotion #q15 #t2309 #q16 o9 #g4)
   )
   (:action s2326_plan-holding-motion
          :parameters (#q15 #q16 o9 #g5)
          :precondition (and (isconf #q15) (isconf #q16) (isgrasp o9 #g5))
          :effect (isholdingmotion #q15 #t2310 #q16 o9 #g5)
   )
   (:action s2327_plan-holding-motion
          :parameters (#q15 #q17 o8 #g0)
          :precondition (and (isconf #q15) (isconf #q17) (isgrasp o8 #g0))
          :effect (isholdingmotion #q15 #t2311 #q17 o8 #g0)
   )
   (:action s2328_plan-holding-motion
          :parameters (#q15 #q17 o9 #g1)
          :precondition (and (isconf #q15) (isconf #q17) (isgrasp o9 #g1))
          :effect (isholdingmotion #q15 #t2312 #q17 o9 #g1)
   )
   (:action s2329_plan-holding-motion
          :parameters (#q15 #q17 o8 #g2)
          :precondition (and (isconf #q15) (isconf #q17) (isgrasp o8 #g2))
          :effect (isholdingmotion #q15 #t2313 #q17 o8 #g2)
   )
   (:action s2330_plan-holding-motion
          :parameters (#q15 #q17 o8 #g3)
          :precondition (and (isconf #q15) (isconf #q17) (isgrasp o8 #g3))
          :effect (isholdingmotion #q15 #t2314 #q17 o8 #g3)
   )
   (:action s2331_plan-holding-motion
          :parameters (#q15 #q17 o9 #g4)
          :precondition (and (isconf #q15) (isconf #q17) (isgrasp o9 #g4))
          :effect (isholdingmotion #q15 #t2315 #q17 o9 #g4)
   )
   (:action s2332_plan-holding-motion
          :parameters (#q15 #q17 o9 #g5)
          :precondition (and (isconf #q15) (isconf #q17) (isgrasp o9 #g5))
          :effect (isholdingmotion #q15 #t2316 #q17 o9 #g5)
   )
   (:action s2333_plan-holding-motion
          :parameters (#q16 q808 o8 #g0)
          :precondition (and (isconf #q16) (isconf q808) (isgrasp o8 #g0))
          :effect (isholdingmotion #q16 #t2317 q808 o8 #g0)
   )
   (:action s2334_plan-holding-motion
          :parameters (#q16 q808 o9 #g1)
          :precondition (and (isconf #q16) (isconf q808) (isgrasp o9 #g1))
          :effect (isholdingmotion #q16 #t2318 q808 o9 #g1)
   )
   (:action s2335_plan-holding-motion
          :parameters (#q16 q808 o8 #g2)
          :precondition (and (isconf #q16) (isconf q808) (isgrasp o8 #g2))
          :effect (isholdingmotion #q16 #t2319 q808 o8 #g2)
   )
   (:action s2336_plan-holding-motion
          :parameters (#q16 q808 o8 #g3)
          :precondition (and (isconf #q16) (isconf q808) (isgrasp o8 #g3))
          :effect (isholdingmotion #q16 #t2320 q808 o8 #g3)
   )
   (:action s2337_plan-holding-motion
          :parameters (#q16 q808 o9 #g4)
          :precondition (and (isconf #q16) (isconf q808) (isgrasp o9 #g4))
          :effect (isholdingmotion #q16 #t2321 q808 o9 #g4)
   )
   (:action s2338_plan-holding-motion
          :parameters (#q16 q808 o9 #g5)
          :precondition (and (isconf #q16) (isconf q808) (isgrasp o9 #g5))
          :effect (isholdingmotion #q16 #t2322 q808 o9 #g5)
   )
   (:action s2339_plan-holding-motion
          :parameters (#q16 #q0 o8 #g0)
          :precondition (and (isconf #q16) (isconf #q0) (isgrasp o8 #g0))
          :effect (isholdingmotion #q16 #t2323 #q0 o8 #g0)
   )
   (:action s2340_plan-holding-motion
          :parameters (#q16 #q0 o9 #g1)
          :precondition (and (isconf #q16) (isconf #q0) (isgrasp o9 #g1))
          :effect (isholdingmotion #q16 #t2324 #q0 o9 #g1)
   )
   (:action s2341_plan-holding-motion
          :parameters (#q16 #q0 o8 #g2)
          :precondition (and (isconf #q16) (isconf #q0) (isgrasp o8 #g2))
          :effect (isholdingmotion #q16 #t2325 #q0 o8 #g2)
   )
   (:action s2342_plan-holding-motion
          :parameters (#q16 #q0 o8 #g3)
          :precondition (and (isconf #q16) (isconf #q0) (isgrasp o8 #g3))
          :effect (isholdingmotion #q16 #t2326 #q0 o8 #g3)
   )
   (:action s2343_plan-holding-motion
          :parameters (#q16 #q0 o9 #g4)
          :precondition (and (isconf #q16) (isconf #q0) (isgrasp o9 #g4))
          :effect (isholdingmotion #q16 #t2327 #q0 o9 #g4)
   )
   (:action s2344_plan-holding-motion
          :parameters (#q16 #q0 o9 #g5)
          :precondition (and (isconf #q16) (isconf #q0) (isgrasp o9 #g5))
          :effect (isholdingmotion #q16 #t2328 #q0 o9 #g5)
   )
   (:action s2345_plan-holding-motion
          :parameters (#q16 #q1 o8 #g0)
          :precondition (and (isconf #q16) (isconf #q1) (isgrasp o8 #g0))
          :effect (isholdingmotion #q16 #t2329 #q1 o8 #g0)
   )
   (:action s2346_plan-holding-motion
          :parameters (#q16 #q1 o9 #g1)
          :precondition (and (isconf #q16) (isconf #q1) (isgrasp o9 #g1))
          :effect (isholdingmotion #q16 #t2330 #q1 o9 #g1)
   )
   (:action s2347_plan-holding-motion
          :parameters (#q16 #q1 o8 #g2)
          :precondition (and (isconf #q16) (isconf #q1) (isgrasp o8 #g2))
          :effect (isholdingmotion #q16 #t2331 #q1 o8 #g2)
   )
   (:action s2348_plan-holding-motion
          :parameters (#q16 #q1 o8 #g3)
          :precondition (and (isconf #q16) (isconf #q1) (isgrasp o8 #g3))
          :effect (isholdingmotion #q16 #t2332 #q1 o8 #g3)
   )
   (:action s2349_plan-holding-motion
          :parameters (#q16 #q1 o9 #g4)
          :precondition (and (isconf #q16) (isconf #q1) (isgrasp o9 #g4))
          :effect (isholdingmotion #q16 #t2333 #q1 o9 #g4)
   )
   (:action s2350_plan-holding-motion
          :parameters (#q16 #q1 o9 #g5)
          :precondition (and (isconf #q16) (isconf #q1) (isgrasp o9 #g5))
          :effect (isholdingmotion #q16 #t2334 #q1 o9 #g5)
   )
   (:action s2351_plan-holding-motion
          :parameters (#q16 #q2 o8 #g0)
          :precondition (and (isconf #q16) (isconf #q2) (isgrasp o8 #g0))
          :effect (isholdingmotion #q16 #t2335 #q2 o8 #g0)
   )
   (:action s2352_plan-holding-motion
          :parameters (#q16 #q2 o9 #g1)
          :precondition (and (isconf #q16) (isconf #q2) (isgrasp o9 #g1))
          :effect (isholdingmotion #q16 #t2336 #q2 o9 #g1)
   )
   (:action s2353_plan-holding-motion
          :parameters (#q16 #q2 o8 #g2)
          :precondition (and (isconf #q16) (isconf #q2) (isgrasp o8 #g2))
          :effect (isholdingmotion #q16 #t2337 #q2 o8 #g2)
   )
   (:action s2354_plan-holding-motion
          :parameters (#q16 #q2 o8 #g3)
          :precondition (and (isconf #q16) (isconf #q2) (isgrasp o8 #g3))
          :effect (isholdingmotion #q16 #t2338 #q2 o8 #g3)
   )
   (:action s2355_plan-holding-motion
          :parameters (#q16 #q2 o9 #g4)
          :precondition (and (isconf #q16) (isconf #q2) (isgrasp o9 #g4))
          :effect (isholdingmotion #q16 #t2339 #q2 o9 #g4)
   )
   (:action s2356_plan-holding-motion
          :parameters (#q16 #q2 o9 #g5)
          :precondition (and (isconf #q16) (isconf #q2) (isgrasp o9 #g5))
          :effect (isholdingmotion #q16 #t2340 #q2 o9 #g5)
   )
   (:action s2357_plan-holding-motion
          :parameters (#q16 #q3 o8 #g0)
          :precondition (and (isconf #q16) (isconf #q3) (isgrasp o8 #g0))
          :effect (isholdingmotion #q16 #t2341 #q3 o8 #g0)
   )
   (:action s2358_plan-holding-motion
          :parameters (#q16 #q3 o9 #g1)
          :precondition (and (isconf #q16) (isconf #q3) (isgrasp o9 #g1))
          :effect (isholdingmotion #q16 #t2342 #q3 o9 #g1)
   )
   (:action s2359_plan-holding-motion
          :parameters (#q16 #q3 o8 #g2)
          :precondition (and (isconf #q16) (isconf #q3) (isgrasp o8 #g2))
          :effect (isholdingmotion #q16 #t2343 #q3 o8 #g2)
   )
   (:action s2360_plan-holding-motion
          :parameters (#q16 #q3 o8 #g3)
          :precondition (and (isconf #q16) (isconf #q3) (isgrasp o8 #g3))
          :effect (isholdingmotion #q16 #t2344 #q3 o8 #g3)
   )
   (:action s2361_plan-holding-motion
          :parameters (#q16 #q3 o9 #g4)
          :precondition (and (isconf #q16) (isconf #q3) (isgrasp o9 #g4))
          :effect (isholdingmotion #q16 #t2345 #q3 o9 #g4)
   )
   (:action s2362_plan-holding-motion
          :parameters (#q16 #q3 o9 #g5)
          :precondition (and (isconf #q16) (isconf #q3) (isgrasp o9 #g5))
          :effect (isholdingmotion #q16 #t2346 #q3 o9 #g5)
   )
   (:action s2363_plan-holding-motion
          :parameters (#q16 #q4 o8 #g0)
          :precondition (and (isconf #q16) (isconf #q4) (isgrasp o8 #g0))
          :effect (isholdingmotion #q16 #t2347 #q4 o8 #g0)
   )
   (:action s2364_plan-holding-motion
          :parameters (#q16 #q4 o9 #g1)
          :precondition (and (isconf #q16) (isconf #q4) (isgrasp o9 #g1))
          :effect (isholdingmotion #q16 #t2348 #q4 o9 #g1)
   )
   (:action s2365_plan-holding-motion
          :parameters (#q16 #q4 o8 #g2)
          :precondition (and (isconf #q16) (isconf #q4) (isgrasp o8 #g2))
          :effect (isholdingmotion #q16 #t2349 #q4 o8 #g2)
   )
   (:action s2366_plan-holding-motion
          :parameters (#q16 #q4 o8 #g3)
          :precondition (and (isconf #q16) (isconf #q4) (isgrasp o8 #g3))
          :effect (isholdingmotion #q16 #t2350 #q4 o8 #g3)
   )
   (:action s2367_plan-holding-motion
          :parameters (#q16 #q4 o9 #g4)
          :precondition (and (isconf #q16) (isconf #q4) (isgrasp o9 #g4))
          :effect (isholdingmotion #q16 #t2351 #q4 o9 #g4)
   )
   (:action s2368_plan-holding-motion
          :parameters (#q16 #q4 o9 #g5)
          :precondition (and (isconf #q16) (isconf #q4) (isgrasp o9 #g5))
          :effect (isholdingmotion #q16 #t2352 #q4 o9 #g5)
   )
   (:action s2369_plan-holding-motion
          :parameters (#q16 #q5 o8 #g0)
          :precondition (and (isconf #q16) (isconf #q5) (isgrasp o8 #g0))
          :effect (isholdingmotion #q16 #t2353 #q5 o8 #g0)
   )
   (:action s2370_plan-holding-motion
          :parameters (#q16 #q5 o9 #g1)
          :precondition (and (isconf #q16) (isconf #q5) (isgrasp o9 #g1))
          :effect (isholdingmotion #q16 #t2354 #q5 o9 #g1)
   )
   (:action s2371_plan-holding-motion
          :parameters (#q16 #q5 o8 #g2)
          :precondition (and (isconf #q16) (isconf #q5) (isgrasp o8 #g2))
          :effect (isholdingmotion #q16 #t2355 #q5 o8 #g2)
   )
   (:action s2372_plan-holding-motion
          :parameters (#q16 #q5 o8 #g3)
          :precondition (and (isconf #q16) (isconf #q5) (isgrasp o8 #g3))
          :effect (isholdingmotion #q16 #t2356 #q5 o8 #g3)
   )
   (:action s2373_plan-holding-motion
          :parameters (#q16 #q5 o9 #g4)
          :precondition (and (isconf #q16) (isconf #q5) (isgrasp o9 #g4))
          :effect (isholdingmotion #q16 #t2357 #q5 o9 #g4)
   )
   (:action s2374_plan-holding-motion
          :parameters (#q16 #q5 o9 #g5)
          :precondition (and (isconf #q16) (isconf #q5) (isgrasp o9 #g5))
          :effect (isholdingmotion #q16 #t2358 #q5 o9 #g5)
   )
   (:action s2375_plan-holding-motion
          :parameters (#q16 #q6 o8 #g0)
          :precondition (and (isconf #q16) (isconf #q6) (isgrasp o8 #g0))
          :effect (isholdingmotion #q16 #t2359 #q6 o8 #g0)
   )
   (:action s2376_plan-holding-motion
          :parameters (#q16 #q6 o9 #g1)
          :precondition (and (isconf #q16) (isconf #q6) (isgrasp o9 #g1))
          :effect (isholdingmotion #q16 #t2360 #q6 o9 #g1)
   )
   (:action s2377_plan-holding-motion
          :parameters (#q16 #q6 o8 #g2)
          :precondition (and (isconf #q16) (isconf #q6) (isgrasp o8 #g2))
          :effect (isholdingmotion #q16 #t2361 #q6 o8 #g2)
   )
   (:action s2378_plan-holding-motion
          :parameters (#q16 #q6 o8 #g3)
          :precondition (and (isconf #q16) (isconf #q6) (isgrasp o8 #g3))
          :effect (isholdingmotion #q16 #t2362 #q6 o8 #g3)
   )
   (:action s2379_plan-holding-motion
          :parameters (#q16 #q6 o9 #g4)
          :precondition (and (isconf #q16) (isconf #q6) (isgrasp o9 #g4))
          :effect (isholdingmotion #q16 #t2363 #q6 o9 #g4)
   )
   (:action s2380_plan-holding-motion
          :parameters (#q16 #q6 o9 #g5)
          :precondition (and (isconf #q16) (isconf #q6) (isgrasp o9 #g5))
          :effect (isholdingmotion #q16 #t2364 #q6 o9 #g5)
   )
   (:action s2381_plan-holding-motion
          :parameters (#q16 #q7 o8 #g0)
          :precondition (and (isconf #q16) (isconf #q7) (isgrasp o8 #g0))
          :effect (isholdingmotion #q16 #t2365 #q7 o8 #g0)
   )
   (:action s2382_plan-holding-motion
          :parameters (#q16 #q7 o9 #g1)
          :precondition (and (isconf #q16) (isconf #q7) (isgrasp o9 #g1))
          :effect (isholdingmotion #q16 #t2366 #q7 o9 #g1)
   )
   (:action s2383_plan-holding-motion
          :parameters (#q16 #q7 o8 #g2)
          :precondition (and (isconf #q16) (isconf #q7) (isgrasp o8 #g2))
          :effect (isholdingmotion #q16 #t2367 #q7 o8 #g2)
   )
   (:action s2384_plan-holding-motion
          :parameters (#q16 #q7 o8 #g3)
          :precondition (and (isconf #q16) (isconf #q7) (isgrasp o8 #g3))
          :effect (isholdingmotion #q16 #t2368 #q7 o8 #g3)
   )
   (:action s2385_plan-holding-motion
          :parameters (#q16 #q7 o9 #g4)
          :precondition (and (isconf #q16) (isconf #q7) (isgrasp o9 #g4))
          :effect (isholdingmotion #q16 #t2369 #q7 o9 #g4)
   )
   (:action s2386_plan-holding-motion
          :parameters (#q16 #q7 o9 #g5)
          :precondition (and (isconf #q16) (isconf #q7) (isgrasp o9 #g5))
          :effect (isholdingmotion #q16 #t2370 #q7 o9 #g5)
   )
   (:action s2387_plan-holding-motion
          :parameters (#q16 #q8 o8 #g0)
          :precondition (and (isconf #q16) (isconf #q8) (isgrasp o8 #g0))
          :effect (isholdingmotion #q16 #t2371 #q8 o8 #g0)
   )
   (:action s2388_plan-holding-motion
          :parameters (#q16 #q8 o9 #g1)
          :precondition (and (isconf #q16) (isconf #q8) (isgrasp o9 #g1))
          :effect (isholdingmotion #q16 #t2372 #q8 o9 #g1)
   )
   (:action s2389_plan-holding-motion
          :parameters (#q16 #q8 o8 #g2)
          :precondition (and (isconf #q16) (isconf #q8) (isgrasp o8 #g2))
          :effect (isholdingmotion #q16 #t2373 #q8 o8 #g2)
   )
   (:action s2390_plan-holding-motion
          :parameters (#q16 #q8 o8 #g3)
          :precondition (and (isconf #q16) (isconf #q8) (isgrasp o8 #g3))
          :effect (isholdingmotion #q16 #t2374 #q8 o8 #g3)
   )
   (:action s2391_plan-holding-motion
          :parameters (#q16 #q8 o9 #g4)
          :precondition (and (isconf #q16) (isconf #q8) (isgrasp o9 #g4))
          :effect (isholdingmotion #q16 #t2375 #q8 o9 #g4)
   )
   (:action s2392_plan-holding-motion
          :parameters (#q16 #q8 o9 #g5)
          :precondition (and (isconf #q16) (isconf #q8) (isgrasp o9 #g5))
          :effect (isholdingmotion #q16 #t2376 #q8 o9 #g5)
   )
   (:action s2393_plan-holding-motion
          :parameters (#q16 #q9 o8 #g0)
          :precondition (and (isconf #q16) (isconf #q9) (isgrasp o8 #g0))
          :effect (isholdingmotion #q16 #t2377 #q9 o8 #g0)
   )
   (:action s2394_plan-holding-motion
          :parameters (#q16 #q9 o9 #g1)
          :precondition (and (isconf #q16) (isconf #q9) (isgrasp o9 #g1))
          :effect (isholdingmotion #q16 #t2378 #q9 o9 #g1)
   )
   (:action s2395_plan-holding-motion
          :parameters (#q16 #q9 o8 #g2)
          :precondition (and (isconf #q16) (isconf #q9) (isgrasp o8 #g2))
          :effect (isholdingmotion #q16 #t2379 #q9 o8 #g2)
   )
   (:action s2396_plan-holding-motion
          :parameters (#q16 #q9 o8 #g3)
          :precondition (and (isconf #q16) (isconf #q9) (isgrasp o8 #g3))
          :effect (isholdingmotion #q16 #t2380 #q9 o8 #g3)
   )
   (:action s2397_plan-holding-motion
          :parameters (#q16 #q9 o9 #g4)
          :precondition (and (isconf #q16) (isconf #q9) (isgrasp o9 #g4))
          :effect (isholdingmotion #q16 #t2381 #q9 o9 #g4)
   )
   (:action s2398_plan-holding-motion
          :parameters (#q16 #q9 o9 #g5)
          :precondition (and (isconf #q16) (isconf #q9) (isgrasp o9 #g5))
          :effect (isholdingmotion #q16 #t2382 #q9 o9 #g5)
   )
   (:action s2399_plan-holding-motion
          :parameters (#q16 #q10 o8 #g0)
          :precondition (and (isconf #q16) (isconf #q10) (isgrasp o8 #g0))
          :effect (isholdingmotion #q16 #t2383 #q10 o8 #g0)
   )
   (:action s2400_plan-holding-motion
          :parameters (#q16 #q10 o9 #g1)
          :precondition (and (isconf #q16) (isconf #q10) (isgrasp o9 #g1))
          :effect (isholdingmotion #q16 #t2384 #q10 o9 #g1)
   )
   (:action s2401_plan-holding-motion
          :parameters (#q16 #q10 o8 #g2)
          :precondition (and (isconf #q16) (isconf #q10) (isgrasp o8 #g2))
          :effect (isholdingmotion #q16 #t2385 #q10 o8 #g2)
   )
   (:action s2402_plan-holding-motion
          :parameters (#q16 #q10 o8 #g3)
          :precondition (and (isconf #q16) (isconf #q10) (isgrasp o8 #g3))
          :effect (isholdingmotion #q16 #t2386 #q10 o8 #g3)
   )
   (:action s2403_plan-holding-motion
          :parameters (#q16 #q10 o9 #g4)
          :precondition (and (isconf #q16) (isconf #q10) (isgrasp o9 #g4))
          :effect (isholdingmotion #q16 #t2387 #q10 o9 #g4)
   )
   (:action s2404_plan-holding-motion
          :parameters (#q16 #q10 o9 #g5)
          :precondition (and (isconf #q16) (isconf #q10) (isgrasp o9 #g5))
          :effect (isholdingmotion #q16 #t2388 #q10 o9 #g5)
   )
   (:action s2405_plan-holding-motion
          :parameters (#q16 #q11 o8 #g0)
          :precondition (and (isconf #q16) (isconf #q11) (isgrasp o8 #g0))
          :effect (isholdingmotion #q16 #t2389 #q11 o8 #g0)
   )
   (:action s2406_plan-holding-motion
          :parameters (#q16 #q11 o9 #g1)
          :precondition (and (isconf #q16) (isconf #q11) (isgrasp o9 #g1))
          :effect (isholdingmotion #q16 #t2390 #q11 o9 #g1)
   )
   (:action s2407_plan-holding-motion
          :parameters (#q16 #q11 o8 #g2)
          :precondition (and (isconf #q16) (isconf #q11) (isgrasp o8 #g2))
          :effect (isholdingmotion #q16 #t2391 #q11 o8 #g2)
   )
   (:action s2408_plan-holding-motion
          :parameters (#q16 #q11 o8 #g3)
          :precondition (and (isconf #q16) (isconf #q11) (isgrasp o8 #g3))
          :effect (isholdingmotion #q16 #t2392 #q11 o8 #g3)
   )
   (:action s2409_plan-holding-motion
          :parameters (#q16 #q11 o9 #g4)
          :precondition (and (isconf #q16) (isconf #q11) (isgrasp o9 #g4))
          :effect (isholdingmotion #q16 #t2393 #q11 o9 #g4)
   )
   (:action s2410_plan-holding-motion
          :parameters (#q16 #q11 o9 #g5)
          :precondition (and (isconf #q16) (isconf #q11) (isgrasp o9 #g5))
          :effect (isholdingmotion #q16 #t2394 #q11 o9 #g5)
   )
   (:action s2411_plan-holding-motion
          :parameters (#q16 #q12 o8 #g0)
          :precondition (and (isconf #q16) (isconf #q12) (isgrasp o8 #g0))
          :effect (isholdingmotion #q16 #t2395 #q12 o8 #g0)
   )
   (:action s2412_plan-holding-motion
          :parameters (#q16 #q12 o9 #g1)
          :precondition (and (isconf #q16) (isconf #q12) (isgrasp o9 #g1))
          :effect (isholdingmotion #q16 #t2396 #q12 o9 #g1)
   )
   (:action s2413_plan-holding-motion
          :parameters (#q16 #q12 o8 #g2)
          :precondition (and (isconf #q16) (isconf #q12) (isgrasp o8 #g2))
          :effect (isholdingmotion #q16 #t2397 #q12 o8 #g2)
   )
   (:action s2414_plan-holding-motion
          :parameters (#q16 #q12 o8 #g3)
          :precondition (and (isconf #q16) (isconf #q12) (isgrasp o8 #g3))
          :effect (isholdingmotion #q16 #t2398 #q12 o8 #g3)
   )
   (:action s2415_plan-holding-motion
          :parameters (#q16 #q12 o9 #g4)
          :precondition (and (isconf #q16) (isconf #q12) (isgrasp o9 #g4))
          :effect (isholdingmotion #q16 #t2399 #q12 o9 #g4)
   )
   (:action s2416_plan-holding-motion
          :parameters (#q16 #q12 o9 #g5)
          :precondition (and (isconf #q16) (isconf #q12) (isgrasp o9 #g5))
          :effect (isholdingmotion #q16 #t2400 #q12 o9 #g5)
   )
   (:action s2417_plan-holding-motion
          :parameters (#q16 #q13 o8 #g0)
          :precondition (and (isconf #q16) (isconf #q13) (isgrasp o8 #g0))
          :effect (isholdingmotion #q16 #t2401 #q13 o8 #g0)
   )
   (:action s2418_plan-holding-motion
          :parameters (#q16 #q13 o9 #g1)
          :precondition (and (isconf #q16) (isconf #q13) (isgrasp o9 #g1))
          :effect (isholdingmotion #q16 #t2402 #q13 o9 #g1)
   )
   (:action s2419_plan-holding-motion
          :parameters (#q16 #q13 o8 #g2)
          :precondition (and (isconf #q16) (isconf #q13) (isgrasp o8 #g2))
          :effect (isholdingmotion #q16 #t2403 #q13 o8 #g2)
   )
   (:action s2420_plan-holding-motion
          :parameters (#q16 #q13 o8 #g3)
          :precondition (and (isconf #q16) (isconf #q13) (isgrasp o8 #g3))
          :effect (isholdingmotion #q16 #t2404 #q13 o8 #g3)
   )
   (:action s2421_plan-holding-motion
          :parameters (#q16 #q13 o9 #g4)
          :precondition (and (isconf #q16) (isconf #q13) (isgrasp o9 #g4))
          :effect (isholdingmotion #q16 #t2405 #q13 o9 #g4)
   )
   (:action s2422_plan-holding-motion
          :parameters (#q16 #q13 o9 #g5)
          :precondition (and (isconf #q16) (isconf #q13) (isgrasp o9 #g5))
          :effect (isholdingmotion #q16 #t2406 #q13 o9 #g5)
   )
   (:action s2423_plan-holding-motion
          :parameters (#q16 #q14 o8 #g0)
          :precondition (and (isconf #q16) (isconf #q14) (isgrasp o8 #g0))
          :effect (isholdingmotion #q16 #t2407 #q14 o8 #g0)
   )
   (:action s2424_plan-holding-motion
          :parameters (#q16 #q14 o9 #g1)
          :precondition (and (isconf #q16) (isconf #q14) (isgrasp o9 #g1))
          :effect (isholdingmotion #q16 #t2408 #q14 o9 #g1)
   )
   (:action s2425_plan-holding-motion
          :parameters (#q16 #q14 o8 #g2)
          :precondition (and (isconf #q16) (isconf #q14) (isgrasp o8 #g2))
          :effect (isholdingmotion #q16 #t2409 #q14 o8 #g2)
   )
   (:action s2426_plan-holding-motion
          :parameters (#q16 #q14 o8 #g3)
          :precondition (and (isconf #q16) (isconf #q14) (isgrasp o8 #g3))
          :effect (isholdingmotion #q16 #t2410 #q14 o8 #g3)
   )
   (:action s2427_plan-holding-motion
          :parameters (#q16 #q14 o9 #g4)
          :precondition (and (isconf #q16) (isconf #q14) (isgrasp o9 #g4))
          :effect (isholdingmotion #q16 #t2411 #q14 o9 #g4)
   )
   (:action s2428_plan-holding-motion
          :parameters (#q16 #q14 o9 #g5)
          :precondition (and (isconf #q16) (isconf #q14) (isgrasp o9 #g5))
          :effect (isholdingmotion #q16 #t2412 #q14 o9 #g5)
   )
   (:action s2429_plan-holding-motion
          :parameters (#q16 #q15 o8 #g0)
          :precondition (and (isconf #q16) (isconf #q15) (isgrasp o8 #g0))
          :effect (isholdingmotion #q16 #t2413 #q15 o8 #g0)
   )
   (:action s2430_plan-holding-motion
          :parameters (#q16 #q15 o9 #g1)
          :precondition (and (isconf #q16) (isconf #q15) (isgrasp o9 #g1))
          :effect (isholdingmotion #q16 #t2414 #q15 o9 #g1)
   )
   (:action s2431_plan-holding-motion
          :parameters (#q16 #q15 o8 #g2)
          :precondition (and (isconf #q16) (isconf #q15) (isgrasp o8 #g2))
          :effect (isholdingmotion #q16 #t2415 #q15 o8 #g2)
   )
   (:action s2432_plan-holding-motion
          :parameters (#q16 #q15 o8 #g3)
          :precondition (and (isconf #q16) (isconf #q15) (isgrasp o8 #g3))
          :effect (isholdingmotion #q16 #t2416 #q15 o8 #g3)
   )
   (:action s2433_plan-holding-motion
          :parameters (#q16 #q15 o9 #g4)
          :precondition (and (isconf #q16) (isconf #q15) (isgrasp o9 #g4))
          :effect (isholdingmotion #q16 #t2417 #q15 o9 #g4)
   )
   (:action s2434_plan-holding-motion
          :parameters (#q16 #q15 o9 #g5)
          :precondition (and (isconf #q16) (isconf #q15) (isgrasp o9 #g5))
          :effect (isholdingmotion #q16 #t2418 #q15 o9 #g5)
   )
   (:action s2435_plan-holding-motion
          :parameters (#q16 #q16 o8 #g0)
          :precondition (and (isconf #q16) (isconf #q16) (isgrasp o8 #g0))
          :effect (isholdingmotion #q16 #t2419 #q16 o8 #g0)
   )
   (:action s2436_plan-holding-motion
          :parameters (#q16 #q16 o9 #g1)
          :precondition (and (isconf #q16) (isconf #q16) (isgrasp o9 #g1))
          :effect (isholdingmotion #q16 #t2420 #q16 o9 #g1)
   )
   (:action s2437_plan-holding-motion
          :parameters (#q16 #q16 o8 #g2)
          :precondition (and (isconf #q16) (isconf #q16) (isgrasp o8 #g2))
          :effect (isholdingmotion #q16 #t2421 #q16 o8 #g2)
   )
   (:action s2438_plan-holding-motion
          :parameters (#q16 #q16 o8 #g3)
          :precondition (and (isconf #q16) (isconf #q16) (isgrasp o8 #g3))
          :effect (isholdingmotion #q16 #t2422 #q16 o8 #g3)
   )
   (:action s2439_plan-holding-motion
          :parameters (#q16 #q16 o9 #g4)
          :precondition (and (isconf #q16) (isconf #q16) (isgrasp o9 #g4))
          :effect (isholdingmotion #q16 #t2423 #q16 o9 #g4)
   )
   (:action s2440_plan-holding-motion
          :parameters (#q16 #q16 o9 #g5)
          :precondition (and (isconf #q16) (isconf #q16) (isgrasp o9 #g5))
          :effect (isholdingmotion #q16 #t2424 #q16 o9 #g5)
   )
   (:action s2441_plan-holding-motion
          :parameters (#q16 #q17 o8 #g0)
          :precondition (and (isconf #q16) (isconf #q17) (isgrasp o8 #g0))
          :effect (isholdingmotion #q16 #t2425 #q17 o8 #g0)
   )
   (:action s2442_plan-holding-motion
          :parameters (#q16 #q17 o9 #g1)
          :precondition (and (isconf #q16) (isconf #q17) (isgrasp o9 #g1))
          :effect (isholdingmotion #q16 #t2426 #q17 o9 #g1)
   )
   (:action s2443_plan-holding-motion
          :parameters (#q16 #q17 o8 #g2)
          :precondition (and (isconf #q16) (isconf #q17) (isgrasp o8 #g2))
          :effect (isholdingmotion #q16 #t2427 #q17 o8 #g2)
   )
   (:action s2444_plan-holding-motion
          :parameters (#q16 #q17 o8 #g3)
          :precondition (and (isconf #q16) (isconf #q17) (isgrasp o8 #g3))
          :effect (isholdingmotion #q16 #t2428 #q17 o8 #g3)
   )
   (:action s2445_plan-holding-motion
          :parameters (#q16 #q17 o9 #g4)
          :precondition (and (isconf #q16) (isconf #q17) (isgrasp o9 #g4))
          :effect (isholdingmotion #q16 #t2429 #q17 o9 #g4)
   )
   (:action s2446_plan-holding-motion
          :parameters (#q16 #q17 o9 #g5)
          :precondition (and (isconf #q16) (isconf #q17) (isgrasp o9 #g5))
          :effect (isholdingmotion #q16 #t2430 #q17 o9 #g5)
   )
   (:action s2447_plan-holding-motion
          :parameters (#q17 q808 o8 #g0)
          :precondition (and (isconf #q17) (isconf q808) (isgrasp o8 #g0))
          :effect (isholdingmotion #q17 #t2431 q808 o8 #g0)
   )
   (:action s2448_plan-holding-motion
          :parameters (#q17 q808 o9 #g1)
          :precondition (and (isconf #q17) (isconf q808) (isgrasp o9 #g1))
          :effect (isholdingmotion #q17 #t2432 q808 o9 #g1)
   )
   (:action s2449_plan-holding-motion
          :parameters (#q17 q808 o8 #g2)
          :precondition (and (isconf #q17) (isconf q808) (isgrasp o8 #g2))
          :effect (isholdingmotion #q17 #t2433 q808 o8 #g2)
   )
   (:action s2450_plan-holding-motion
          :parameters (#q17 q808 o8 #g3)
          :precondition (and (isconf #q17) (isconf q808) (isgrasp o8 #g3))
          :effect (isholdingmotion #q17 #t2434 q808 o8 #g3)
   )
   (:action s2451_plan-holding-motion
          :parameters (#q17 q808 o9 #g4)
          :precondition (and (isconf #q17) (isconf q808) (isgrasp o9 #g4))
          :effect (isholdingmotion #q17 #t2435 q808 o9 #g4)
   )
   (:action s2452_plan-holding-motion
          :parameters (#q17 q808 o9 #g5)
          :precondition (and (isconf #q17) (isconf q808) (isgrasp o9 #g5))
          :effect (isholdingmotion #q17 #t2436 q808 o9 #g5)
   )
   (:action s2453_plan-holding-motion
          :parameters (#q17 #q0 o8 #g0)
          :precondition (and (isconf #q17) (isconf #q0) (isgrasp o8 #g0))
          :effect (isholdingmotion #q17 #t2437 #q0 o8 #g0)
   )
   (:action s2454_plan-holding-motion
          :parameters (#q17 #q0 o9 #g1)
          :precondition (and (isconf #q17) (isconf #q0) (isgrasp o9 #g1))
          :effect (isholdingmotion #q17 #t2438 #q0 o9 #g1)
   )
   (:action s2455_plan-holding-motion
          :parameters (#q17 #q0 o8 #g2)
          :precondition (and (isconf #q17) (isconf #q0) (isgrasp o8 #g2))
          :effect (isholdingmotion #q17 #t2439 #q0 o8 #g2)
   )
   (:action s2456_plan-holding-motion
          :parameters (#q17 #q0 o8 #g3)
          :precondition (and (isconf #q17) (isconf #q0) (isgrasp o8 #g3))
          :effect (isholdingmotion #q17 #t2440 #q0 o8 #g3)
   )
   (:action s2457_plan-holding-motion
          :parameters (#q17 #q0 o9 #g4)
          :precondition (and (isconf #q17) (isconf #q0) (isgrasp o9 #g4))
          :effect (isholdingmotion #q17 #t2441 #q0 o9 #g4)
   )
   (:action s2458_plan-holding-motion
          :parameters (#q17 #q0 o9 #g5)
          :precondition (and (isconf #q17) (isconf #q0) (isgrasp o9 #g5))
          :effect (isholdingmotion #q17 #t2442 #q0 o9 #g5)
   )
   (:action s2459_plan-holding-motion
          :parameters (#q17 #q1 o8 #g0)
          :precondition (and (isconf #q17) (isconf #q1) (isgrasp o8 #g0))
          :effect (isholdingmotion #q17 #t2443 #q1 o8 #g0)
   )
   (:action s2460_plan-holding-motion
          :parameters (#q17 #q1 o9 #g1)
          :precondition (and (isconf #q17) (isconf #q1) (isgrasp o9 #g1))
          :effect (isholdingmotion #q17 #t2444 #q1 o9 #g1)
   )
   (:action s2461_plan-holding-motion
          :parameters (#q17 #q1 o8 #g2)
          :precondition (and (isconf #q17) (isconf #q1) (isgrasp o8 #g2))
          :effect (isholdingmotion #q17 #t2445 #q1 o8 #g2)
   )
   (:action s2462_plan-holding-motion
          :parameters (#q17 #q1 o8 #g3)
          :precondition (and (isconf #q17) (isconf #q1) (isgrasp o8 #g3))
          :effect (isholdingmotion #q17 #t2446 #q1 o8 #g3)
   )
   (:action s2463_plan-holding-motion
          :parameters (#q17 #q1 o9 #g4)
          :precondition (and (isconf #q17) (isconf #q1) (isgrasp o9 #g4))
          :effect (isholdingmotion #q17 #t2447 #q1 o9 #g4)
   )
   (:action s2464_plan-holding-motion
          :parameters (#q17 #q1 o9 #g5)
          :precondition (and (isconf #q17) (isconf #q1) (isgrasp o9 #g5))
          :effect (isholdingmotion #q17 #t2448 #q1 o9 #g5)
   )
   (:action s2465_plan-holding-motion
          :parameters (#q17 #q2 o8 #g0)
          :precondition (and (isconf #q17) (isconf #q2) (isgrasp o8 #g0))
          :effect (isholdingmotion #q17 #t2449 #q2 o8 #g0)
   )
   (:action s2466_plan-holding-motion
          :parameters (#q17 #q2 o9 #g1)
          :precondition (and (isconf #q17) (isconf #q2) (isgrasp o9 #g1))
          :effect (isholdingmotion #q17 #t2450 #q2 o9 #g1)
   )
   (:action s2467_plan-holding-motion
          :parameters (#q17 #q2 o8 #g2)
          :precondition (and (isconf #q17) (isconf #q2) (isgrasp o8 #g2))
          :effect (isholdingmotion #q17 #t2451 #q2 o8 #g2)
   )
   (:action s2468_plan-holding-motion
          :parameters (#q17 #q2 o8 #g3)
          :precondition (and (isconf #q17) (isconf #q2) (isgrasp o8 #g3))
          :effect (isholdingmotion #q17 #t2452 #q2 o8 #g3)
   )
   (:action s2469_plan-holding-motion
          :parameters (#q17 #q2 o9 #g4)
          :precondition (and (isconf #q17) (isconf #q2) (isgrasp o9 #g4))
          :effect (isholdingmotion #q17 #t2453 #q2 o9 #g4)
   )
   (:action s2470_plan-holding-motion
          :parameters (#q17 #q2 o9 #g5)
          :precondition (and (isconf #q17) (isconf #q2) (isgrasp o9 #g5))
          :effect (isholdingmotion #q17 #t2454 #q2 o9 #g5)
   )
   (:action s2471_plan-holding-motion
          :parameters (#q17 #q3 o8 #g0)
          :precondition (and (isconf #q17) (isconf #q3) (isgrasp o8 #g0))
          :effect (isholdingmotion #q17 #t2455 #q3 o8 #g0)
   )
   (:action s2472_plan-holding-motion
          :parameters (#q17 #q3 o9 #g1)
          :precondition (and (isconf #q17) (isconf #q3) (isgrasp o9 #g1))
          :effect (isholdingmotion #q17 #t2456 #q3 o9 #g1)
   )
   (:action s2473_plan-holding-motion
          :parameters (#q17 #q3 o8 #g2)
          :precondition (and (isconf #q17) (isconf #q3) (isgrasp o8 #g2))
          :effect (isholdingmotion #q17 #t2457 #q3 o8 #g2)
   )
   (:action s2474_plan-holding-motion
          :parameters (#q17 #q3 o8 #g3)
          :precondition (and (isconf #q17) (isconf #q3) (isgrasp o8 #g3))
          :effect (isholdingmotion #q17 #t2458 #q3 o8 #g3)
   )
   (:action s2475_plan-holding-motion
          :parameters (#q17 #q3 o9 #g4)
          :precondition (and (isconf #q17) (isconf #q3) (isgrasp o9 #g4))
          :effect (isholdingmotion #q17 #t2459 #q3 o9 #g4)
   )
   (:action s2476_plan-holding-motion
          :parameters (#q17 #q3 o9 #g5)
          :precondition (and (isconf #q17) (isconf #q3) (isgrasp o9 #g5))
          :effect (isholdingmotion #q17 #t2460 #q3 o9 #g5)
   )
   (:action s2477_plan-holding-motion
          :parameters (#q17 #q4 o8 #g0)
          :precondition (and (isconf #q17) (isconf #q4) (isgrasp o8 #g0))
          :effect (isholdingmotion #q17 #t2461 #q4 o8 #g0)
   )
   (:action s2478_plan-holding-motion
          :parameters (#q17 #q4 o9 #g1)
          :precondition (and (isconf #q17) (isconf #q4) (isgrasp o9 #g1))
          :effect (isholdingmotion #q17 #t2462 #q4 o9 #g1)
   )
   (:action s2479_plan-holding-motion
          :parameters (#q17 #q4 o8 #g2)
          :precondition (and (isconf #q17) (isconf #q4) (isgrasp o8 #g2))
          :effect (isholdingmotion #q17 #t2463 #q4 o8 #g2)
   )
   (:action s2480_plan-holding-motion
          :parameters (#q17 #q4 o8 #g3)
          :precondition (and (isconf #q17) (isconf #q4) (isgrasp o8 #g3))
          :effect (isholdingmotion #q17 #t2464 #q4 o8 #g3)
   )
   (:action s2481_plan-holding-motion
          :parameters (#q17 #q4 o9 #g4)
          :precondition (and (isconf #q17) (isconf #q4) (isgrasp o9 #g4))
          :effect (isholdingmotion #q17 #t2465 #q4 o9 #g4)
   )
   (:action s2482_plan-holding-motion
          :parameters (#q17 #q4 o9 #g5)
          :precondition (and (isconf #q17) (isconf #q4) (isgrasp o9 #g5))
          :effect (isholdingmotion #q17 #t2466 #q4 o9 #g5)
   )
   (:action s2483_plan-holding-motion
          :parameters (#q17 #q5 o8 #g0)
          :precondition (and (isconf #q17) (isconf #q5) (isgrasp o8 #g0))
          :effect (isholdingmotion #q17 #t2467 #q5 o8 #g0)
   )
   (:action s2484_plan-holding-motion
          :parameters (#q17 #q5 o9 #g1)
          :precondition (and (isconf #q17) (isconf #q5) (isgrasp o9 #g1))
          :effect (isholdingmotion #q17 #t2468 #q5 o9 #g1)
   )
   (:action s2485_plan-holding-motion
          :parameters (#q17 #q5 o8 #g2)
          :precondition (and (isconf #q17) (isconf #q5) (isgrasp o8 #g2))
          :effect (isholdingmotion #q17 #t2469 #q5 o8 #g2)
   )
   (:action s2486_plan-holding-motion
          :parameters (#q17 #q5 o8 #g3)
          :precondition (and (isconf #q17) (isconf #q5) (isgrasp o8 #g3))
          :effect (isholdingmotion #q17 #t2470 #q5 o8 #g3)
   )
   (:action s2487_plan-holding-motion
          :parameters (#q17 #q5 o9 #g4)
          :precondition (and (isconf #q17) (isconf #q5) (isgrasp o9 #g4))
          :effect (isholdingmotion #q17 #t2471 #q5 o9 #g4)
   )
   (:action s2488_plan-holding-motion
          :parameters (#q17 #q5 o9 #g5)
          :precondition (and (isconf #q17) (isconf #q5) (isgrasp o9 #g5))
          :effect (isholdingmotion #q17 #t2472 #q5 o9 #g5)
   )
   (:action s2489_plan-holding-motion
          :parameters (#q17 #q6 o8 #g0)
          :precondition (and (isconf #q17) (isconf #q6) (isgrasp o8 #g0))
          :effect (isholdingmotion #q17 #t2473 #q6 o8 #g0)
   )
   (:action s2490_plan-holding-motion
          :parameters (#q17 #q6 o9 #g1)
          :precondition (and (isconf #q17) (isconf #q6) (isgrasp o9 #g1))
          :effect (isholdingmotion #q17 #t2474 #q6 o9 #g1)
   )
   (:action s2491_plan-holding-motion
          :parameters (#q17 #q6 o8 #g2)
          :precondition (and (isconf #q17) (isconf #q6) (isgrasp o8 #g2))
          :effect (isholdingmotion #q17 #t2475 #q6 o8 #g2)
   )
   (:action s2492_plan-holding-motion
          :parameters (#q17 #q6 o8 #g3)
          :precondition (and (isconf #q17) (isconf #q6) (isgrasp o8 #g3))
          :effect (isholdingmotion #q17 #t2476 #q6 o8 #g3)
   )
   (:action s2493_plan-holding-motion
          :parameters (#q17 #q6 o9 #g4)
          :precondition (and (isconf #q17) (isconf #q6) (isgrasp o9 #g4))
          :effect (isholdingmotion #q17 #t2477 #q6 o9 #g4)
   )
   (:action s2494_plan-holding-motion
          :parameters (#q17 #q6 o9 #g5)
          :precondition (and (isconf #q17) (isconf #q6) (isgrasp o9 #g5))
          :effect (isholdingmotion #q17 #t2478 #q6 o9 #g5)
   )
   (:action s2495_plan-holding-motion
          :parameters (#q17 #q7 o8 #g0)
          :precondition (and (isconf #q17) (isconf #q7) (isgrasp o8 #g0))
          :effect (isholdingmotion #q17 #t2479 #q7 o8 #g0)
   )
   (:action s2496_plan-holding-motion
          :parameters (#q17 #q7 o9 #g1)
          :precondition (and (isconf #q17) (isconf #q7) (isgrasp o9 #g1))
          :effect (isholdingmotion #q17 #t2480 #q7 o9 #g1)
   )
   (:action s2497_plan-holding-motion
          :parameters (#q17 #q7 o8 #g2)
          :precondition (and (isconf #q17) (isconf #q7) (isgrasp o8 #g2))
          :effect (isholdingmotion #q17 #t2481 #q7 o8 #g2)
   )
   (:action s2498_plan-holding-motion
          :parameters (#q17 #q7 o8 #g3)
          :precondition (and (isconf #q17) (isconf #q7) (isgrasp o8 #g3))
          :effect (isholdingmotion #q17 #t2482 #q7 o8 #g3)
   )
   (:action s2499_plan-holding-motion
          :parameters (#q17 #q7 o9 #g4)
          :precondition (and (isconf #q17) (isconf #q7) (isgrasp o9 #g4))
          :effect (isholdingmotion #q17 #t2483 #q7 o9 #g4)
   )
   (:action s2500_plan-holding-motion
          :parameters (#q17 #q7 o9 #g5)
          :precondition (and (isconf #q17) (isconf #q7) (isgrasp o9 #g5))
          :effect (isholdingmotion #q17 #t2484 #q7 o9 #g5)
   )
   (:action s2501_plan-holding-motion
          :parameters (#q17 #q8 o8 #g0)
          :precondition (and (isconf #q17) (isconf #q8) (isgrasp o8 #g0))
          :effect (isholdingmotion #q17 #t2485 #q8 o8 #g0)
   )
   (:action s2502_plan-holding-motion
          :parameters (#q17 #q8 o9 #g1)
          :precondition (and (isconf #q17) (isconf #q8) (isgrasp o9 #g1))
          :effect (isholdingmotion #q17 #t2486 #q8 o9 #g1)
   )
   (:action s2503_plan-holding-motion
          :parameters (#q17 #q8 o8 #g2)
          :precondition (and (isconf #q17) (isconf #q8) (isgrasp o8 #g2))
          :effect (isholdingmotion #q17 #t2487 #q8 o8 #g2)
   )
   (:action s2504_plan-holding-motion
          :parameters (#q17 #q8 o8 #g3)
          :precondition (and (isconf #q17) (isconf #q8) (isgrasp o8 #g3))
          :effect (isholdingmotion #q17 #t2488 #q8 o8 #g3)
   )
   (:action s2505_plan-holding-motion
          :parameters (#q17 #q8 o9 #g4)
          :precondition (and (isconf #q17) (isconf #q8) (isgrasp o9 #g4))
          :effect (isholdingmotion #q17 #t2489 #q8 o9 #g4)
   )
   (:action s2506_plan-holding-motion
          :parameters (#q17 #q8 o9 #g5)
          :precondition (and (isconf #q17) (isconf #q8) (isgrasp o9 #g5))
          :effect (isholdingmotion #q17 #t2490 #q8 o9 #g5)
   )
   (:action s2507_plan-holding-motion
          :parameters (#q17 #q9 o8 #g0)
          :precondition (and (isconf #q17) (isconf #q9) (isgrasp o8 #g0))
          :effect (isholdingmotion #q17 #t2491 #q9 o8 #g0)
   )
   (:action s2508_plan-holding-motion
          :parameters (#q17 #q9 o9 #g1)
          :precondition (and (isconf #q17) (isconf #q9) (isgrasp o9 #g1))
          :effect (isholdingmotion #q17 #t2492 #q9 o9 #g1)
   )
   (:action s2509_plan-holding-motion
          :parameters (#q17 #q9 o8 #g2)
          :precondition (and (isconf #q17) (isconf #q9) (isgrasp o8 #g2))
          :effect (isholdingmotion #q17 #t2493 #q9 o8 #g2)
   )
   (:action s2510_plan-holding-motion
          :parameters (#q17 #q9 o8 #g3)
          :precondition (and (isconf #q17) (isconf #q9) (isgrasp o8 #g3))
          :effect (isholdingmotion #q17 #t2494 #q9 o8 #g3)
   )
   (:action s2511_plan-holding-motion
          :parameters (#q17 #q9 o9 #g4)
          :precondition (and (isconf #q17) (isconf #q9) (isgrasp o9 #g4))
          :effect (isholdingmotion #q17 #t2495 #q9 o9 #g4)
   )
   (:action s2512_plan-holding-motion
          :parameters (#q17 #q9 o9 #g5)
          :precondition (and (isconf #q17) (isconf #q9) (isgrasp o9 #g5))
          :effect (isholdingmotion #q17 #t2496 #q9 o9 #g5)
   )
   (:action s2513_plan-holding-motion
          :parameters (#q17 #q10 o8 #g0)
          :precondition (and (isconf #q17) (isconf #q10) (isgrasp o8 #g0))
          :effect (isholdingmotion #q17 #t2497 #q10 o8 #g0)
   )
   (:action s2514_plan-holding-motion
          :parameters (#q17 #q10 o9 #g1)
          :precondition (and (isconf #q17) (isconf #q10) (isgrasp o9 #g1))
          :effect (isholdingmotion #q17 #t2498 #q10 o9 #g1)
   )
   (:action s2515_plan-holding-motion
          :parameters (#q17 #q10 o8 #g2)
          :precondition (and (isconf #q17) (isconf #q10) (isgrasp o8 #g2))
          :effect (isholdingmotion #q17 #t2499 #q10 o8 #g2)
   )
   (:action s2516_plan-holding-motion
          :parameters (#q17 #q10 o8 #g3)
          :precondition (and (isconf #q17) (isconf #q10) (isgrasp o8 #g3))
          :effect (isholdingmotion #q17 #t2500 #q10 o8 #g3)
   )
   (:action s2517_plan-holding-motion
          :parameters (#q17 #q10 o9 #g4)
          :precondition (and (isconf #q17) (isconf #q10) (isgrasp o9 #g4))
          :effect (isholdingmotion #q17 #t2501 #q10 o9 #g4)
   )
   (:action s2518_plan-holding-motion
          :parameters (#q17 #q10 o9 #g5)
          :precondition (and (isconf #q17) (isconf #q10) (isgrasp o9 #g5))
          :effect (isholdingmotion #q17 #t2502 #q10 o9 #g5)
   )
   (:action s2519_plan-holding-motion
          :parameters (#q17 #q11 o8 #g0)
          :precondition (and (isconf #q17) (isconf #q11) (isgrasp o8 #g0))
          :effect (isholdingmotion #q17 #t2503 #q11 o8 #g0)
   )
   (:action s2520_plan-holding-motion
          :parameters (#q17 #q11 o9 #g1)
          :precondition (and (isconf #q17) (isconf #q11) (isgrasp o9 #g1))
          :effect (isholdingmotion #q17 #t2504 #q11 o9 #g1)
   )
   (:action s2521_plan-holding-motion
          :parameters (#q17 #q11 o8 #g2)
          :precondition (and (isconf #q17) (isconf #q11) (isgrasp o8 #g2))
          :effect (isholdingmotion #q17 #t2505 #q11 o8 #g2)
   )
   (:action s2522_plan-holding-motion
          :parameters (#q17 #q11 o8 #g3)
          :precondition (and (isconf #q17) (isconf #q11) (isgrasp o8 #g3))
          :effect (isholdingmotion #q17 #t2506 #q11 o8 #g3)
   )
   (:action s2523_plan-holding-motion
          :parameters (#q17 #q11 o9 #g4)
          :precondition (and (isconf #q17) (isconf #q11) (isgrasp o9 #g4))
          :effect (isholdingmotion #q17 #t2507 #q11 o9 #g4)
   )
   (:action s2524_plan-holding-motion
          :parameters (#q17 #q11 o9 #g5)
          :precondition (and (isconf #q17) (isconf #q11) (isgrasp o9 #g5))
          :effect (isholdingmotion #q17 #t2508 #q11 o9 #g5)
   )
   (:action s2525_plan-holding-motion
          :parameters (#q17 #q12 o8 #g0)
          :precondition (and (isconf #q17) (isconf #q12) (isgrasp o8 #g0))
          :effect (isholdingmotion #q17 #t2509 #q12 o8 #g0)
   )
   (:action s2526_plan-holding-motion
          :parameters (#q17 #q12 o9 #g1)
          :precondition (and (isconf #q17) (isconf #q12) (isgrasp o9 #g1))
          :effect (isholdingmotion #q17 #t2510 #q12 o9 #g1)
   )
   (:action s2527_plan-holding-motion
          :parameters (#q17 #q12 o8 #g2)
          :precondition (and (isconf #q17) (isconf #q12) (isgrasp o8 #g2))
          :effect (isholdingmotion #q17 #t2511 #q12 o8 #g2)
   )
   (:action s2528_plan-holding-motion
          :parameters (#q17 #q12 o8 #g3)
          :precondition (and (isconf #q17) (isconf #q12) (isgrasp o8 #g3))
          :effect (isholdingmotion #q17 #t2512 #q12 o8 #g3)
   )
   (:action s2529_plan-holding-motion
          :parameters (#q17 #q12 o9 #g4)
          :precondition (and (isconf #q17) (isconf #q12) (isgrasp o9 #g4))
          :effect (isholdingmotion #q17 #t2513 #q12 o9 #g4)
   )
   (:action s2530_plan-holding-motion
          :parameters (#q17 #q12 o9 #g5)
          :precondition (and (isconf #q17) (isconf #q12) (isgrasp o9 #g5))
          :effect (isholdingmotion #q17 #t2514 #q12 o9 #g5)
   )
   (:action s2531_plan-holding-motion
          :parameters (#q17 #q13 o8 #g0)
          :precondition (and (isconf #q17) (isconf #q13) (isgrasp o8 #g0))
          :effect (isholdingmotion #q17 #t2515 #q13 o8 #g0)
   )
   (:action s2532_plan-holding-motion
          :parameters (#q17 #q13 o9 #g1)
          :precondition (and (isconf #q17) (isconf #q13) (isgrasp o9 #g1))
          :effect (isholdingmotion #q17 #t2516 #q13 o9 #g1)
   )
   (:action s2533_plan-holding-motion
          :parameters (#q17 #q13 o8 #g2)
          :precondition (and (isconf #q17) (isconf #q13) (isgrasp o8 #g2))
          :effect (isholdingmotion #q17 #t2517 #q13 o8 #g2)
   )
   (:action s2534_plan-holding-motion
          :parameters (#q17 #q13 o8 #g3)
          :precondition (and (isconf #q17) (isconf #q13) (isgrasp o8 #g3))
          :effect (isholdingmotion #q17 #t2518 #q13 o8 #g3)
   )
   (:action s2535_plan-holding-motion
          :parameters (#q17 #q13 o9 #g4)
          :precondition (and (isconf #q17) (isconf #q13) (isgrasp o9 #g4))
          :effect (isholdingmotion #q17 #t2519 #q13 o9 #g4)
   )
   (:action s2536_plan-holding-motion
          :parameters (#q17 #q13 o9 #g5)
          :precondition (and (isconf #q17) (isconf #q13) (isgrasp o9 #g5))
          :effect (isholdingmotion #q17 #t2520 #q13 o9 #g5)
   )
   (:action s2537_plan-holding-motion
          :parameters (#q17 #q14 o8 #g0)
          :precondition (and (isconf #q17) (isconf #q14) (isgrasp o8 #g0))
          :effect (isholdingmotion #q17 #t2521 #q14 o8 #g0)
   )
   (:action s2538_plan-holding-motion
          :parameters (#q17 #q14 o9 #g1)
          :precondition (and (isconf #q17) (isconf #q14) (isgrasp o9 #g1))
          :effect (isholdingmotion #q17 #t2522 #q14 o9 #g1)
   )
   (:action s2539_plan-holding-motion
          :parameters (#q17 #q14 o8 #g2)
          :precondition (and (isconf #q17) (isconf #q14) (isgrasp o8 #g2))
          :effect (isholdingmotion #q17 #t2523 #q14 o8 #g2)
   )
   (:action s2540_plan-holding-motion
          :parameters (#q17 #q14 o8 #g3)
          :precondition (and (isconf #q17) (isconf #q14) (isgrasp o8 #g3))
          :effect (isholdingmotion #q17 #t2524 #q14 o8 #g3)
   )
   (:action s2541_plan-holding-motion
          :parameters (#q17 #q14 o9 #g4)
          :precondition (and (isconf #q17) (isconf #q14) (isgrasp o9 #g4))
          :effect (isholdingmotion #q17 #t2525 #q14 o9 #g4)
   )
   (:action s2542_plan-holding-motion
          :parameters (#q17 #q14 o9 #g5)
          :precondition (and (isconf #q17) (isconf #q14) (isgrasp o9 #g5))
          :effect (isholdingmotion #q17 #t2526 #q14 o9 #g5)
   )
   (:action s2543_plan-holding-motion
          :parameters (#q17 #q15 o8 #g0)
          :precondition (and (isconf #q17) (isconf #q15) (isgrasp o8 #g0))
          :effect (isholdingmotion #q17 #t2527 #q15 o8 #g0)
   )
   (:action s2544_plan-holding-motion
          :parameters (#q17 #q15 o9 #g1)
          :precondition (and (isconf #q17) (isconf #q15) (isgrasp o9 #g1))
          :effect (isholdingmotion #q17 #t2528 #q15 o9 #g1)
   )
   (:action s2545_plan-holding-motion
          :parameters (#q17 #q15 o8 #g2)
          :precondition (and (isconf #q17) (isconf #q15) (isgrasp o8 #g2))
          :effect (isholdingmotion #q17 #t2529 #q15 o8 #g2)
   )
   (:action s2546_plan-holding-motion
          :parameters (#q17 #q15 o8 #g3)
          :precondition (and (isconf #q17) (isconf #q15) (isgrasp o8 #g3))
          :effect (isholdingmotion #q17 #t2530 #q15 o8 #g3)
   )
   (:action s2547_plan-holding-motion
          :parameters (#q17 #q15 o9 #g4)
          :precondition (and (isconf #q17) (isconf #q15) (isgrasp o9 #g4))
          :effect (isholdingmotion #q17 #t2531 #q15 o9 #g4)
   )
   (:action s2548_plan-holding-motion
          :parameters (#q17 #q15 o9 #g5)
          :precondition (and (isconf #q17) (isconf #q15) (isgrasp o9 #g5))
          :effect (isholdingmotion #q17 #t2532 #q15 o9 #g5)
   )
   (:action s2549_plan-holding-motion
          :parameters (#q17 #q16 o8 #g0)
          :precondition (and (isconf #q17) (isconf #q16) (isgrasp o8 #g0))
          :effect (isholdingmotion #q17 #t2533 #q16 o8 #g0)
   )
   (:action s2550_plan-holding-motion
          :parameters (#q17 #q16 o9 #g1)
          :precondition (and (isconf #q17) (isconf #q16) (isgrasp o9 #g1))
          :effect (isholdingmotion #q17 #t2534 #q16 o9 #g1)
   )
   (:action s2551_plan-holding-motion
          :parameters (#q17 #q16 o8 #g2)
          :precondition (and (isconf #q17) (isconf #q16) (isgrasp o8 #g2))
          :effect (isholdingmotion #q17 #t2535 #q16 o8 #g2)
   )
   (:action s2552_plan-holding-motion
          :parameters (#q17 #q16 o8 #g3)
          :precondition (and (isconf #q17) (isconf #q16) (isgrasp o8 #g3))
          :effect (isholdingmotion #q17 #t2536 #q16 o8 #g3)
   )
   (:action s2553_plan-holding-motion
          :parameters (#q17 #q16 o9 #g4)
          :precondition (and (isconf #q17) (isconf #q16) (isgrasp o9 #g4))
          :effect (isholdingmotion #q17 #t2537 #q16 o9 #g4)
   )
   (:action s2554_plan-holding-motion
          :parameters (#q17 #q16 o9 #g5)
          :precondition (and (isconf #q17) (isconf #q16) (isgrasp o9 #g5))
          :effect (isholdingmotion #q17 #t2538 #q16 o9 #g5)
   )
   (:action s2555_plan-holding-motion
          :parameters (#q17 #q17 o8 #g0)
          :precondition (and (isconf #q17) (isconf #q17) (isgrasp o8 #g0))
          :effect (isholdingmotion #q17 #t2539 #q17 o8 #g0)
   )
   (:action s2556_plan-holding-motion
          :parameters (#q17 #q17 o9 #g1)
          :precondition (and (isconf #q17) (isconf #q17) (isgrasp o9 #g1))
          :effect (isholdingmotion #q17 #t2540 #q17 o9 #g1)
   )
   (:action s2557_plan-holding-motion
          :parameters (#q17 #q17 o8 #g2)
          :precondition (and (isconf #q17) (isconf #q17) (isgrasp o8 #g2))
          :effect (isholdingmotion #q17 #t2541 #q17 o8 #g2)
   )
   (:action s2558_plan-holding-motion
          :parameters (#q17 #q17 o8 #g3)
          :precondition (and (isconf #q17) (isconf #q17) (isgrasp o8 #g3))
          :effect (isholdingmotion #q17 #t2542 #q17 o8 #g3)
   )
   (:action s2559_plan-holding-motion
          :parameters (#q17 #q17 o9 #g4)
          :precondition (and (isconf #q17) (isconf #q17) (isgrasp o9 #g4))
          :effect (isholdingmotion #q17 #t2543 #q17 o9 #g4)
   )
   (:action s2560_plan-holding-motion
          :parameters (#q17 #q17 o9 #g5)
          :precondition (and (isconf #q17) (isconf #q17) (isgrasp o9 #g5))
          :effect (isholdingmotion #q17 #t2544 #q17 o9 #g5)
   )
)
