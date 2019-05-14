Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0E8161C669
	for <lists+kernel-janitors@lfdr.de>; Tue, 14 May 2019 11:49:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726075AbfENJtc (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Tue, 14 May 2019 05:49:32 -0400
Received: from userp2120.oracle.com ([156.151.31.85]:50408 "EHLO
        userp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725916AbfENJtc (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 14 May 2019 05:49:32 -0400
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
        by userp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x4E9mxdf133544;
        Tue, 14 May 2019 09:49:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2018-07-02;
 bh=yXZWPuYsBJQU51FZxtlr/lRy+n1pYmOuIx9kQkSjius=;
 b=LGZVVrvqCGE3Qr1Abmc4VTnnirxNnz+/2AXxtXkNYWGAJC7EGhBvCrsOkX91f/tq7Vjg
 MFAHU9eP7xEbQUUJrp1RT940WTifX+zb30/40kShh6x2zwEGRAk3XhKI9BaAss5zDY+V
 8ATC1Rqoibyg+5n2h2W9E0UMArvp3/8st4qxZMdl350NxECCAJjmlP7oN8lWa2qgy7KV
 1d+d1VG0/nio0sgP/IkpQoTwWQ1IELCen9UKxrK1XI4QFEpm4BdDusEneqd4eU0kXtvL
 R16sj/AI/EkThFkK5WY3bfrcBqi+/0U/TYyyGdI1A2+tG8xwo72TVqUD/tdpI+zk0PGy Rg== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
        by userp2120.oracle.com with ESMTP id 2sdq1qcn9v-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 14 May 2019 09:49:29 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
        by userp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x4E9llME171678;
        Tue, 14 May 2019 09:49:29 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
        by userp3020.oracle.com with ESMTP id 2sdnqjf6br-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 14 May 2019 09:49:28 +0000
Received: from abhmp0020.oracle.com (abhmp0020.oracle.com [141.146.116.26])
        by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x4E9nSrp013418;
        Tue, 14 May 2019 09:49:28 GMT
Received: from mwanda (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Tue, 14 May 2019 02:49:27 -0700
Date:   Tue, 14 May 2019 12:49:21 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     m-karicheri2@ti.com
Cc:     kernel-janitors@vger.kernel.org
Subject: [bug report] net: netcp: Add Keystone NetCP core ethernet driver
Message-ID: <20190514094921.GA27527@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Proofpoint-Virus-Version: vendor=nai engine=5900 definitions=9256 signatures=668686
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=1 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=951
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1810050000 definitions=main-1905140071
X-Proofpoint-Virus-Version: vendor=nai engine=5900 definitions=9256 signatures=668686
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=977 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1905140071
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hello Karicheri, Muralidharan,

The patch 84640e27f230: "net: netcp: Add Keystone NetCP core ethernet
driver" from Jan 15, 2015, leads to the following static checker
warning:

	drivers/net/ethernet/ti/netcp_core.c:1599 netcp_setup_navigator_resources()
	warn: passing zero to 'PTR_ERR'

drivers/net/ethernet/ti/netcp_core.c
  1583  static int netcp_setup_navigator_resources(struct net_device *ndev)
  1584  {
  1585          struct netcp_intf *netcp = netdev_priv(ndev);
  1586          struct knav_queue_notify_config notify_cfg;
  1587          struct knav_dma_cfg config;
  1588          u32 last_fdq = 0;
  1589          u8 name[16];
  1590          int ret;
  1591          int i;
  1592  
  1593          /* Create Rx/Tx descriptor pools */
  1594          snprintf(name, sizeof(name), "rx-pool-%s", ndev->name);
  1595          netcp->rx_pool = knav_pool_create(name, netcp->rx_pool_size,
  1596                                                  netcp->rx_pool_region_id);
  1597          if (IS_ERR_OR_NULL(netcp->rx_pool)) {
  1598                  dev_err(netcp->ndev_dev, "Couldn't create rx pool\n");
  1599                  ret = PTR_ERR(netcp->rx_pool);
  1600                  goto fail;
  1601          }
  1602  
  1603          snprintf(name, sizeof(name), "tx-pool-%s", ndev->name);
  1604          netcp->tx_pool = knav_pool_create(name, netcp->tx_pool_size,
  1605                                                  netcp->tx_pool_region_id);
  1606          if (IS_ERR_OR_NULL(netcp->tx_pool)) {
                    ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Assume this is NULL.

When a function returns a mix of error pointers and NULL that means the
the feature can be disabled.  Like an error pointer is straight forward,
it means that something is broken.  But a NULL just means the feature is
disabled so it's not an error but we also don't have a pointer to the
feature because it doesn't exist.

In this case, how can the driver function without memory pools?  It
doesn't make sense that the user should be able to disable it.

  1607                  dev_err(netcp->ndev_dev, "Couldn't create tx pool\n");

If it's not an error, we shouldn't print an error message.

  1608                  ret = PTR_ERR(netcp->tx_pool);

PTR_ERR(NULL) is zero/success.

  1609                  goto fail;
  1610          }
  1611  

This driver mentions ERR_PTR_OR_NULL() a lot but all the mentions I saw
were wrong.  :(  I can't compile the driver myself or I would send a
patch.

regards,
dan carpenter
