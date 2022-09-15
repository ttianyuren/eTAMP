;10:10:11 15/09

;Skeleton_SN = 1

(define (domain pick-and-place_propo_reorder)
   (:requirements :strips :equality :action-costs)

   (:types
          wuti grasp_dir grasp config pose trajectory propo_action propo_stream
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

   (:action a0_move_free
          :parameters (q80 #q0 #t21)
          :precondition (and (isfreemotion q80 #t21 #q0) (atconf q80) (handempty) (canmove) (_applicable _p0))
          :effect (and (atconf #q0) (not (atconf q80)) (not (canmove)) (canpick) (increase (total-cost) 100) (not (_applicable _p0)) (not (_unused _s37)) (not (_unused _s17)) (when (and (not (_unused _s1)) (not (_unused _s4)) (not (_unused _s5)) (not (_unused _s11)) (not (_unused _s12)) (not (_unused _s18)) (not (_unused _s20)) (not (_unused _s66)) (not (_unused _s149)) (not (_unused _s168))) (_applicable _p1)) (not (_unused _s37)) (not (_unused _s17)) (when (and (not (_unused _s1)) (not (_unused _s4)) (not (_unused _s5)) (not (_unused _s11)) (not (_unused _s12)) (not (_unused _s18)) (not (_unused _s20)) (not (_unused _s66)) (not (_unused _s149)) (not (_unused _s168))) (_applicable _p1)))
   )
   (:action a1_pick
          :parameters (o8 p912 #g0 #q0 #t1)
          :precondition (and (iskin o8 p912 #g0 #q0 #t1) (atpose o8 p912) (handempty) (atconf #q0) (canpick) (not (usedgrasp o8 p912 #g0)) (graspatpose #g0 p912) (_applicable _p1))
          :effect (and (atgrasp o8 #g0) (canmove) (not (atpose o8 p912)) (not (handempty)) (increase (total-cost) 100) (not (_applicable _p1)) (not (_unused _s11)) (not (_unused _s17)) (when (and (not (_unused _s1)) (not (_unused _s4)) (not (_unused _s5)) (not (_unused _s12)) (not (_unused _s18)) (not (_unused _s20)) (not (_unused _s37)) (not (_unused _s66)) (not (_unused _s149)) (not (_unused _s168))) (_applicable _p2)) (not (_unused _s11)) (not (_unused _s17)) (when (and (not (_unused _s1)) (not (_unused _s4)) (not (_unused _s5)) (not (_unused _s12)) (not (_unused _s18)) (not (_unused _s20)) (not (_unused _s37)) (not (_unused _s66)) (not (_unused _s149)) (not (_unused _s168))) (_applicable _p2)))
   )
   (:action a2_move_holding
          :parameters (#q0 #q3 o8 #g0 #t133)
          :precondition (and (isholdingmotion #q0 #t133 #q3 o8 #g0) (atconf #q0) (atgrasp o8 #g0) (canmove) (_applicable _p2))
          :effect (and (atconf #q3) (not (atconf #q0)) (not (canmove)) (canpick) (canplace) (increase (total-cost) 100) (not (_applicable _p2)) (not (_unused _s11)) (not (_unused _s17)) (not (_unused _s20)) (not (_unused _s149)) (when (and (not (_unused _s1)) (not (_unused _s4)) (not (_unused _s5)) (not (_unused _s12)) (not (_unused _s18)) (not (_unused _s37)) (not (_unused _s66)) (not (_unused _s168))) (_applicable _p3)) (not (_unused _s11)) (not (_unused _s17)) (not (_unused _s20)) (not (_unused _s149)) (when (and (not (_unused _s1)) (not (_unused _s4)) (not (_unused _s5)) (not (_unused _s12)) (not (_unused _s18)) (not (_unused _s37)) (not (_unused _s66)) (not (_unused _s168))) (_applicable _p3)))
   )
   (:action a3_place
          :parameters (o8 #p1 o7 #g0 #q3 #t4)
          :precondition (and (iskin o8 #p1 #g0 #q3 #t4) (issupport o8 #p1 o7) (atgrasp o8 #g0) (atconf #q3) (graspable o8) (fixed o7) (canplace) (_applicable _p3))
          :effect (and (atpose o8 #p1) (handempty) (canmove) (not (atgrasp o8 #g0)) (not (canpick)) (not (canplace)) (increase (total-cost) 100) (allowlocate) (not (located o8 #p1)) (usedgrasp o8 #p1 #g0) (not (_applicable _p3)) (not (_unused _s1)) (not (_unused _s11)) (not (_unused _s20)) (when (and (not (_unused _s4)) (not (_unused _s5)) (not (_unused _s12)) (not (_unused _s17)) (not (_unused _s18)) (not (_unused _s37)) (not (_unused _s66)) (not (_unused _s149)) (not (_unused _s168))) (_applicable _p4)) (not (_unused _s1)) (not (_unused _s11)) (not (_unused _s20)) (when (and (not (_unused _s4)) (not (_unused _s5)) (not (_unused _s12)) (not (_unused _s17)) (not (_unused _s18)) (not (_unused _s37)) (not (_unused _s66)) (not (_unused _s149)) (not (_unused _s168))) (_applicable _p4)))
   )
   (:action a4_move_free
          :parameters (#q3 #q1 #t50)
          :precondition (and (isfreemotion #q3 #t50 #q1) (atconf #q3) (handempty) (canmove) (_applicable _p4))
          :effect (and (atconf #q1) (not (atconf #q3)) (not (canmove)) (canpick) (increase (total-cost) 100) (not (_applicable _p4)) (not (_unused _s66)) (not (_unused _s20)) (not (_unused _s18)) (when (and (not (_unused _s1)) (not (_unused _s4)) (not (_unused _s5)) (not (_unused _s11)) (not (_unused _s12)) (not (_unused _s17)) (not (_unused _s37)) (not (_unused _s149)) (not (_unused _s168))) (_applicable _p5)) (not (_unused _s66)) (not (_unused _s20)) (not (_unused _s18)) (when (and (not (_unused _s1)) (not (_unused _s4)) (not (_unused _s5)) (not (_unused _s11)) (not (_unused _s12)) (not (_unused _s17)) (not (_unused _s37)) (not (_unused _s149)) (not (_unused _s168))) (_applicable _p5)))
   )
   (:action a5_pick
          :parameters (o9 p864 #g1 #q1 #t2)
          :precondition (and (iskin o9 p864 #g1 #q1 #t2) (atpose o9 p864) (handempty) (atconf #q1) (canpick) (not (usedgrasp o9 p864 #g1)) (graspatpose #g1 p864) (_applicable _p5))
          :effect (and (atgrasp o9 #g1) (canmove) (not (atpose o9 p864)) (not (handempty)) (increase (total-cost) 100) (not (_applicable _p5)) (not (_unused _s12)) (not (_unused _s18)) (when (and (not (_unused _s1)) (not (_unused _s4)) (not (_unused _s5)) (not (_unused _s11)) (not (_unused _s17)) (not (_unused _s20)) (not (_unused _s37)) (not (_unused _s66)) (not (_unused _s149)) (not (_unused _s168))) (_applicable _p6)) (not (_unused _s12)) (not (_unused _s18)) (when (and (not (_unused _s1)) (not (_unused _s4)) (not (_unused _s5)) (not (_unused _s11)) (not (_unused _s17)) (not (_unused _s20)) (not (_unused _s37)) (not (_unused _s66)) (not (_unused _s149)) (not (_unused _s168))) (_applicable _p6)))
   )
   (:action a6_move_holding
          :parameters (#q1 q80 o9 #g1 #t152)
          :precondition (and (isholdingmotion #q1 #t152 q80 o9 #g1) (atconf #q1) (atgrasp o9 #g1) (canmove) (_applicable _p6))
          :effect (and (atconf q80) (not (atconf #q1)) (not (canmove)) (canpick) (canplace) (increase (total-cost) 100) (not (_applicable _p6)) (not (_unused _s12)) (not (_unused _s168)) (not (_unused _s18)) (when (and (not (_unused _s1)) (not (_unused _s4)) (not (_unused _s5)) (not (_unused _s11)) (not (_unused _s17)) (not (_unused _s20)) (not (_unused _s37)) (not (_unused _s66)) (not (_unused _s149))) (_applicable _p7)) (not (_unused _s12)) (not (_unused _s168)) (not (_unused _s18)) (when (and (not (_unused _s1)) (not (_unused _s4)) (not (_unused _s5)) (not (_unused _s11)) (not (_unused _s17)) (not (_unused _s20)) (not (_unused _s37)) (not (_unused _s66)) (not (_unused _s149))) (_applicable _p7)))
   )
   (:action s1_sample-place
          :parameters (o8 o7)
          :precondition (stackable o8 o7)
          :effect (and (ispose o8 #p1) (issupport o8 #p1 o7) (_unused _s1))
   )
   (:action s4_sample-grasp-dir
          :parameters (o8 p912)
          :precondition (and (graspable o8) (ispose o8 p912))
          :effect (and (isgraspdir o8 p912 #d0) (_unused _s4))
   )
   (:action s5_sample-grasp-dir
          :parameters (o9 p864)
          :precondition (and (graspable o9) (ispose o9 p864))
          :effect (and (isgraspdir o9 p864 #d1) (_unused _s5))
   )
   (:action s11_sample-grasp
          :parameters (o8 p912 #d0)
          :precondition (isgraspdir o8 p912 #d0)
          :effect (and (graspatpose #g0 p912) (isgrasp o8 #g0) (not (_unused _s4)) (_unused _s11))
   )
   (:action s12_sample-grasp
          :parameters (o9 p864 #d1)
          :precondition (isgraspdir o9 p864 #d1)
          :effect (and (graspatpose #g1 p864) (isgrasp o9 #g1) (not (_unused _s5)) (_unused _s12))
   )
   (:action s17_inverse-kinematics
          :parameters (o8 p912 #g0)
          :precondition (and (ispose o8 p912) (isgrasp o8 #g0))
          :effect (and (isconf #q0) (istraj #t1) (iskin o8 p912 #g0 #q0 #t1) (not (_unused _s11)) (_unused _s17))
   )
   (:action s18_inverse-kinematics
          :parameters (o9 p864 #g1)
          :precondition (and (ispose o9 p864) (isgrasp o9 #g1))
          :effect (and (isconf #q1) (istraj #t2) (iskin o9 p864 #g1 #q1 #t2) (not (_unused _s12)) (_unused _s18))
   )
   (:action s20_inverse-kinematics
          :parameters (o8 #p1 #g0)
          :precondition (and (ispose o8 #p1) (isgrasp o8 #g0))
          :effect (and (isconf #q3) (istraj #t4) (iskin o8 #p1 #g0 #q3 #t4) (not (_unused _s1)) (not (_unused _s11)) (_unused _s20))
   )
   (:action s37_plan-free-motion
          :parameters (q80 #q0)
          :precondition (and (isconf q80) (isconf #q0))
          :effect (and (isfreemotion q80 #t21 #q0) (not (_unused _s17)) (_unused _s37))
   )
   (:action s66_plan-free-motion
          :parameters (#q3 #q1)
          :precondition (and (isconf #q3) (isconf #q1))
          :effect (and (isfreemotion #q3 #t50 #q1) (not (_unused _s20)) (not (_unused _s18)) (_unused _s66))
   )
   (:action s149_plan-holding-motion
          :parameters (#q0 #q3 o8 #g0)
          :precondition (and (isconf #q0) (isconf #q3) (isgrasp o8 #g0))
          :effect (and (isholdingmotion #q0 #t133 #q3 o8 #g0) (not (_unused _s11)) (not (_unused _s17)) (not (_unused _s20)) (_unused _s149))
   )
   (:action s168_plan-holding-motion
          :parameters (#q1 q80 o9 #g1)
          :precondition (and (isconf #q1) (isconf q80) (isgrasp o9 #g1))
          :effect (and (isholdingmotion #q1 #t152 q80 o9 #g1) (not (_unused _s12)) (not (_unused _s18)) (_unused _s168))
   )
)
