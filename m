Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0FC792B1D3
	for <lists+kernel-janitors@lfdr.de>; Mon, 27 May 2019 12:05:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726071AbfE0KF4 (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Mon, 27 May 2019 06:05:56 -0400
Received: from aserp2130.oracle.com ([141.146.126.79]:33938 "EHLO
        aserp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725973AbfE0KF4 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 27 May 2019 06:05:56 -0400
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
        by aserp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x4R9xYAv176745;
        Mon, 27 May 2019 10:05:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2018-07-02;
 bh=EtKqNvtnWOGTPaSl+1nE1fVnwtP1OIagmgKbAlzWgj0=;
 b=UGOk8HKkYs4kKAWDo1hS10PQaxemKffflvFVeRxmiFK3MGnd1EUiOTupVamEfIrtAAIT
 JID+XjAiSZXgaUEBFcaTyKFNWdInHLvBs/muzJstBX+tCwx742n2OIvED6m8YE92rwS9
 tTJMV3ki2TSmw0N79Is6m7Mn+54BCMWhD8se8FLtOKBhINSs8kAo0AUyQ9pjr8Dfq3Gc
 M01cGRZADLAvOHulH62Nujsk2jcedDpm85iYjoNhx8uszcZvpYsU1eMDKEmeBUBznh22
 DDs2E5qgLohKts/j9Cwq085vuudRWsja5ZLygwovisxSMTdlhwN6A62DNutk2eu1KK/M Qg== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
        by aserp2130.oracle.com with ESMTP id 2spu7d5s4d-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 27 May 2019 10:05:47 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
        by aserp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x4RA5lId146677;
        Mon, 27 May 2019 10:05:47 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
        by aserp3030.oracle.com with ESMTP id 2srbdwa2uf-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 27 May 2019 10:05:47 +0000
Received: from abhmp0003.oracle.com (abhmp0003.oracle.com [141.146.116.9])
        by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id x4RA5jmI026135;
        Mon, 27 May 2019 10:05:46 GMT
Received: from mwanda (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Mon, 27 May 2019 03:05:45 -0700
Date:   Mon, 27 May 2019 13:05:39 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     esben@geanix.com
Cc:     kernel-janitors@vger.kernel.org
Subject: [bug report] net: ll_temac: Cleanup multicast filter on change
Message-ID: <20190527100539.GA31007@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9269 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=1 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=795
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1810050000 definitions=main-1905270071
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9269 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=825 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1905270071
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hello Esben Haabendal,

The patch 1b3fa5cf859b: "net: ll_temac: Cleanup multicast filter on
change" from May 23, 2019, leads to the following static checker
warning:

	drivers/net/ethernet/xilinx/ll_temac_main.c:490 temac_set_multicast_list()
	error: uninitialized symbol 'i'.

drivers/net/ethernet/xilinx/ll_temac_main.c
   451  static void temac_set_multicast_list(struct net_device *ndev)
   452  {
   453          struct temac_local *lp = netdev_priv(ndev);
   454          u32 multi_addr_msw, multi_addr_lsw;
   455          int i;
                ^^^^^

   456          unsigned long flags;
   457          bool promisc_mode_disabled = false;
   458  
   459          if (ndev->flags & (IFF_PROMISC | IFF_ALLMULTI) ||
   460              (netdev_mc_count(ndev) > MULTICAST_CAM_TABLE_NUM)) {
   461                  temac_indirect_out32(lp, XTE_AFM_OFFSET, XTE_AFM_EPPRM_MASK);
   462                  dev_info(&ndev->dev, "Promiscuous mode enabled.\n");
   463                  return;
   464          }
   465  
   466          spin_lock_irqsave(lp->indirect_lock, flags);
   467  
   468          if (!netdev_mc_empty(ndev)) {
   469                  struct netdev_hw_addr *ha;
   470  
   471                  i = 0;
                        ^^^^^
This is not initialized on the false path.

   472                  netdev_for_each_mc_addr(ha, ndev) {
   473                          if (WARN_ON(i >= MULTICAST_CAM_TABLE_NUM))
   474                                  break;
   475                          multi_addr_msw = ((ha->addr[3] << 24) |
   476                                            (ha->addr[2] << 16) |
   477                                            (ha->addr[1] << 8) |
   478                                            (ha->addr[0]));
   479                          temac_indirect_out32_locked(lp, XTE_MAW0_OFFSET,
   480                                                      multi_addr_msw);
   481                          multi_addr_lsw = ((ha->addr[5] << 8) |
   482                                            (ha->addr[4]) | (i << 16));
   483                          temac_indirect_out32_locked(lp, XTE_MAW1_OFFSET,
   484                                                      multi_addr_lsw);
   485                          i++;
   486                  }
   487          }
   488  
   489          /* Clear all or remaining/unused address table entries */
   490          while (i < MULTICAST_CAM_TABLE_NUM) {
                       ^
Uninitialized.

   491                  temac_indirect_out32_locked(lp, XTE_MAW0_OFFSET, 0);
   492                  temac_indirect_out32_locked(lp, XTE_MAW1_OFFSET, i << 16);
   493                  i++;
   494          }

regards,
dan carpenter
