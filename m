Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A3D6138679
	for <lists+kernel-janitors@lfdr.de>; Fri,  7 Jun 2019 10:43:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726829AbfFGInJ (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Fri, 7 Jun 2019 04:43:09 -0400
Received: from userp2130.oracle.com ([156.151.31.86]:44592 "EHLO
        userp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726671AbfFGInJ (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 7 Jun 2019 04:43:09 -0400
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
        by userp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x578YOgX124219;
        Fri, 7 Jun 2019 08:43:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2018-07-02;
 bh=vJGEWWpf5K8n5xRsab55mPyZbI2BvfcY5plotcFGVzI=;
 b=hJTBtF+05m8K0Cy1dGTAVKGTKajnWfJqok8GkyXayZecqKh2C3SfZZWDubI6F5z5EITl
 kNVoJokUwgZkYeZmL4Ai256xvzNrJve6f62wBzZXmml8ImkeAOV639qVhjhSvYtqDix1
 X60v9g5dyjZng+3S8e0Ejuriahhzg9kLJTat3F1GSgF7NyDYhnvOfeV90o2xVG1l/PTh
 KBbqHW8TjWLXKBqeSHzkXlPF8o4ZBJSK4AajiLpkh656U8AJa3xTwQY8N1p5yJIMBRcW
 ytECrCc8cabqVs/Gn9GZlGm25w2NjAzkSM/e+pZBICr/vYrYg1VWEvOJwZrJZJo4pB6r 9A== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
        by userp2130.oracle.com with ESMTP id 2sugstw1dp-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 07 Jun 2019 08:43:06 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
        by userp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x578h60V000983;
        Fri, 7 Jun 2019 08:43:06 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
        by userp3030.oracle.com with ESMTP id 2swngmy3sc-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 07 Jun 2019 08:43:06 +0000
Received: from abhmp0014.oracle.com (abhmp0014.oracle.com [141.146.116.20])
        by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id x578h23s019394;
        Fri, 7 Jun 2019 08:43:02 GMT
Received: from mwanda (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Fri, 07 Jun 2019 01:43:01 -0700
Date:   Fri, 7 Jun 2019 11:42:56 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     dsahern@gmail.com
Cc:     kernel-janitors@vger.kernel.org
Subject: [bug report] ipv4: Plumb support for nexthop object in a fib_info
Message-ID: <20190607084256.GA380@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9280 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=3 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1810050000 definitions=main-1906070063
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9280 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 suspectscore=3 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1906070062
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hello David Ahern,

The patch 4c7e8084fd46: "ipv4: Plumb support for nexthop object in a
fib_info" from Jun 3, 2019, leads to the following static checker
warning:

	net/ipv4/fib_semantics.c:1482 fib_create_info()
	error: we previously assumed 'nh' could be null (see line 1357)

net/ipv4/fib_semantics.c
  1280  struct fib_info *fib_create_info(struct fib_config *cfg,
  1281                                   struct netlink_ext_ack *extack)
  1282  {
  1283          int err;
  1284          struct fib_info *fi = NULL;
  1285          struct nexthop *nh = NULL;
                                ^^^^^^^^^
The problem starts here where "nh" is NULL.


  1286          struct fib_info *ofi;
  1287          int nhs = 1;
  1288          struct net *net = cfg->fc_nlinfo.nl_net;
  1289  
  1290          if (cfg->fc_type > RTN_MAX)
  1291                  goto err_inval;
  1292  
  1293          /* Fast check to catch the most weird cases */
  1294          if (fib_props[cfg->fc_type].scope > cfg->fc_scope) {
  1295                  NL_SET_ERR_MSG(extack, "Invalid scope");
  1296                  goto err_inval;
  1297          }
  1298  
  1299          if (cfg->fc_flags & (RTNH_F_DEAD | RTNH_F_LINKDOWN)) {
  1300                  NL_SET_ERR_MSG(extack,
  1301                                 "Invalid rtm_flags - can not contain DEAD or LINKDOWN");
  1302                  goto err_inval;
  1303          }
  1304  
  1305  #ifdef CONFIG_IP_ROUTE_MULTIPATH
  1306          if (cfg->fc_mp) {
  1307                  nhs = fib_count_nexthops(cfg->fc_mp, cfg->fc_mp_len, extack);
  1308                  if (nhs == 0)
  1309                          goto err_inval;
  1310          }
  1311  #endif
  1312  
  1313          err = -ENOBUFS;
  1314          if (fib_info_cnt >= fib_info_hash_size) {
  1315                  unsigned int new_size = fib_info_hash_size << 1;
  1316                  struct hlist_head *new_info_hash;
  1317                  struct hlist_head *new_laddrhash;
  1318                  unsigned int bytes;
  1319  
  1320                  if (!new_size)
  1321                          new_size = 16;
  1322                  bytes = new_size * sizeof(struct hlist_head *);
  1323                  new_info_hash = fib_info_hash_alloc(bytes);
  1324                  new_laddrhash = fib_info_hash_alloc(bytes);
  1325                  if (!new_info_hash || !new_laddrhash) {
  1326                          fib_info_hash_free(new_info_hash, bytes);
  1327                          fib_info_hash_free(new_laddrhash, bytes);
  1328                  } else
  1329                          fib_info_hash_move(new_info_hash, new_laddrhash, new_size);
  1330  
  1331                  if (!fib_info_hash_size)
  1332                          goto failure;
  1333          }
  1334  
  1335          fi = kzalloc(struct_size(fi, fib_nh, nhs), GFP_KERNEL);
  1336          if (!fi)
  1337                  goto failure;
  1338          fi->fib_metrics = ip_fib_metrics_init(fi->fib_net, cfg->fc_mx,
  1339                                                cfg->fc_mx_len, extack);
  1340          if (IS_ERR(fi->fib_metrics)) {
  1341                  err = PTR_ERR(fi->fib_metrics);
  1342                  kfree(fi);
  1343                  return ERR_PTR(err);
  1344          }
  1345  
  1346          fib_info_cnt++;
  1347          fi->fib_net = net;
  1348          fi->fib_protocol = cfg->fc_protocol;
  1349          fi->fib_scope = cfg->fc_scope;
  1350          fi->fib_flags = cfg->fc_flags;
  1351          fi->fib_priority = cfg->fc_priority;
  1352          fi->fib_prefsrc = cfg->fc_prefsrc;
  1353          fi->fib_type = cfg->fc_type;
  1354          fi->fib_tb_id = cfg->fc_table;
  1355  
  1356          fi->fib_nhs = nhs;
  1357          if (nh) {

"nh" is still NULL so this path is dead code.

  1358                  if (!nexthop_get(nh)) {
  1359                          NL_SET_ERR_MSG(extack, "Nexthop has been deleted");
  1360                          err = -EINVAL;
  1361                  } else {
  1362                          err = 0;
  1363                          fi->nh = nh;
                                ^^^^^^^^^^^
Dead code.

  1364                  }
  1365          } else {
  1366                  change_nexthops(fi) {
  1367                          nexthop_nh->nh_parent = fi;
  1368                  } endfor_nexthops(fi)
  1369  
  1370                  if (cfg->fc_mp)
  1371                          err = fib_get_nhs(fi, cfg->fc_mp, cfg->fc_mp_len, cfg,
  1372                                            extack);
  1373                  else
  1374                          err = fib_nh_init(net, fi->fib_nh, cfg, 1, extack);
  1375          }
  1376  
  1377          if (err != 0)
  1378                  goto failure;
  1379  
  1380          if (fib_props[cfg->fc_type].error) {
  1381                  if (cfg->fc_gw_family || cfg->fc_oif || cfg->fc_mp) {
  1382                          NL_SET_ERR_MSG(extack,
  1383                                         "Gateway, device and multipath can not be specified for this route type");
  1384                          goto err_inval;
  1385                  }
  1386                  goto link_it;
  1387          } else {
  1388                  switch (cfg->fc_type) {
  1389                  case RTN_UNICAST:
  1390                  case RTN_LOCAL:
  1391                  case RTN_BROADCAST:
  1392                  case RTN_ANYCAST:
  1393                  case RTN_MULTICAST:
  1394                          break;
  1395                  default:
  1396                          NL_SET_ERR_MSG(extack, "Invalid route type");
  1397                          goto err_inval;
  1398                  }
  1399          }
  1400  
  1401          if (cfg->fc_scope > RT_SCOPE_HOST) {
  1402                  NL_SET_ERR_MSG(extack, "Invalid scope");
  1403                  goto err_inval;
  1404          }
  1405  
  1406          if (fi->nh) {
                    ^^^^^^
Dead code.

  1407                  err = fib_check_nexthop(fi->nh, cfg->fc_scope, extack);
  1408                  if (err)
  1409                          goto failure;
  1410          } else if (cfg->fc_scope == RT_SCOPE_HOST) {
  1411                  struct fib_nh *nh = fi->fib_nh;
                                       ^^^^^^^^^^^^^^^
nh is non-NULL now.

  1412  
  1413                  /* Local address is added. */
  1414                  if (nhs != 1) {
  1415                          NL_SET_ERR_MSG(extack,
  1416                                         "Route with host scope can not have multiple nexthops");
  1417                          goto err_inval;
  1418                  }
  1419                  if (nh->fib_nh_gw_family) {
  1420                          NL_SET_ERR_MSG(extack,
  1421                                         "Route with host scope can not have a gateway");
  1422                          goto err_inval;
  1423                  }
  1424                  nh->fib_nh_scope = RT_SCOPE_NOWHERE;
  1425                  nh->fib_nh_dev = dev_get_by_index(net, nh->fib_nh_oif);
  1426                  err = -ENODEV;
  1427                  if (!nh->fib_nh_dev)
  1428                          goto failure;
  1429          } else {
  1430                  int linkdown = 0;
  1431  
  1432                  change_nexthops(fi) {
  1433                          err = fib_check_nh(cfg->fc_nlinfo.nl_net, nexthop_nh,
  1434                                             cfg->fc_table, cfg->fc_scope,
  1435                                             extack);
  1436                          if (err != 0)
  1437                                  goto failure;
  1438                          if (nexthop_nh->fib_nh_flags & RTNH_F_LINKDOWN)
  1439                                  linkdown++;
  1440                  } endfor_nexthops(fi)
  1441                  if (linkdown == fi->fib_nhs)
  1442                          fi->fib_flags |= RTNH_F_LINKDOWN;
  1443          }
  1444  
  1445          if (fi->fib_prefsrc && !fib_valid_prefsrc(cfg, fi->fib_prefsrc)) {
  1446                  NL_SET_ERR_MSG(extack, "Invalid prefsrc address");
  1447                  goto err_inval;
  1448          }
  1449  
  1450          if (!fi->nh) {
  1451                  change_nexthops(fi) {
  1452                          fib_info_update_nhc_saddr(net, &nexthop_nh->nh_common,
  1452                          fib_info_update_nhc_saddr(net, &nexthop_nh->nh_common,
  1453                                                    fi->fib_scope);
  1454                          if (nexthop_nh->fib_nh_gw_family == AF_INET6)
  1455                                  fi->fib_nh_is_v6 = true;
  1456                  } endfor_nexthops(fi)
  1457  
  1458                  fib_rebalance(fi);
  1459          }
  1460  
  1461  link_it:
  1462          ofi = fib_find_info(fi);
  1463          if (ofi) {
  1464                  fi->fib_dead = 1;
  1465                  free_fib_info(fi);
  1466                  ofi->fib_treeref++;
  1467                  return ofi;
  1468          }
  1469  
  1470          fi->fib_treeref++;
  1471          refcount_set(&fi->fib_clntref, 1);
  1472          spin_lock_bh(&fib_info_lock);
  1473          hlist_add_head(&fi->fib_hash,
  1474                         &fib_info_hash[fib_info_hashfn(fi)]);
  1475          if (fi->fib_prefsrc) {
  1476                  struct hlist_head *head;
  1477  
  1478                  head = &fib_info_laddrhash[fib_laddr_hashfn(fi->fib_prefsrc)];
  1479                  hlist_add_head(&fi->fib_lhash, head);
  1480          }
  1481          if (fi->nh) {
                    ^^^^^^
I think this is dead code?  Anyway Smatch gets confused by this
condition.

  1482                  list_add(&fi->nh_list, &nh->fi_list);
                                                ^^^^^^^^^^^
Warning.

  1483          } else {
  1484                  change_nexthops(fi) {
  1485                          struct hlist_head *head;
  1486                          unsigned int hash;
  1487  
  1488                          if (!nexthop_nh->fib_nh_dev)
  1489                                  continue;
  1490                          hash = fib_devindex_hashfn(nexthop_nh->fib_nh_dev->ifindex);
  1491                          head = &fib_info_devhash[hash];
  1492                          hlist_add_head(&nexthop_nh->nh_hash, head);
  1493                  } endfor_nexthops(fi)
  1494          }
  1495          spin_unlock_bh(&fib_info_lock);
  1496          return fi;
  1497  
  1498  err_inval:
  1499          err = -EINVAL;
  1500  
  1501  failure:
  1502          if (fi) {
  1503                  fi->fib_dead = 1;
  1504                  free_fib_info(fi);
  1505          }
  1506  
  1507          return ERR_PTR(err);
  1508  }

regards,
dan carpenter
