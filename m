Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0347B22EB0E
	for <lists+kernel-janitors@lfdr.de>; Mon, 27 Jul 2020 13:20:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728075AbgG0LUK (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Mon, 27 Jul 2020 07:20:10 -0400
Received: from userp2130.oracle.com ([156.151.31.86]:37592 "EHLO
        userp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726324AbgG0LUK (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 27 Jul 2020 07:20:10 -0400
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
        by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 06RBCk0I079745;
        Mon, 27 Jul 2020 11:20:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=gdzlRR7Dl2md/usOgLqjpLQUBbd/vEcANr8xjxM+vKI=;
 b=gQIy+mnAR2yUl9hZT/TUrDPJoX+HD9zzeWKEwymCAFc2/5/9VDfjRRMRPVD45JCufO6w
 J5oH03z48eYvYYiJQVStEOz3YIP1b7gSQ+Xg2e/xJBxOIo2KvaoBifto6G5pMIgo5oz4
 ThjfXjn7SxP0IUxTiqrUNMclsATFPPPQq05GgKbAFypz69fEQ96tSSqKt89EJ+GqHy5K
 M10mzcSITVvElJm1OF+dFAK0LQbN7mrMtZx6+YaWu0u9ChWEDzwObfIL6UqKPs7l3Rzb
 FLO4ASlelPDHILQ9nq60FN2PRwSAEmIjxzqZqtrFkyRmKSGehvcCBMCskpeWhQSTxzJZ nQ== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
        by userp2130.oracle.com with ESMTP id 32hu1j0xfx-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 27 Jul 2020 11:20:06 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
        by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 06RBEJG0045838;
        Mon, 27 Jul 2020 11:18:06 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
        by userp3030.oracle.com with ESMTP id 32hu5qgp6n-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 27 Jul 2020 11:18:06 +0000
Received: from abhmp0013.oracle.com (abhmp0013.oracle.com [141.146.116.19])
        by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 06RBI5h2015197;
        Mon, 27 Jul 2020 11:18:05 GMT
Received: from mwanda (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Mon, 27 Jul 2020 04:18:04 -0700
Date:   Mon, 27 Jul 2020 14:17:59 +0300
From:   <dan.carpenter@oracle.com>
To:     vishal@chelsio.com
Cc:     kernel-janitors@vger.kernel.org
Subject: [bug report] cxgb4: add loopback ethtool self-test
Message-ID: <20200727111759.GA389488@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9694 signatures=668679
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 mlxlogscore=999 mlxscore=0
 suspectscore=3 bulkscore=0 malwarescore=0 spamscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2007270083
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9694 signatures=668679
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 clxscore=1015
 malwarescore=0 spamscore=0 suspectscore=3 bulkscore=0 priorityscore=1501
 phishscore=0 mlxlogscore=999 lowpriorityscore=0 impostorscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2007270083
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hello Vishal Kulkarni,

The patch 7235ffae3d2c: "cxgb4: add loopback ethtool self-test" from
Jul 23, 2020, leads to the following static checker warning:

	drivers/net/ethernet/chelsio/cxgb4/sge.c:2571 cxgb4_selftest_lb_pkt()
	warn: struct type mismatch 'fw_eth_tx_pkt_wr vs tx_desc'

drivers/net/ethernet/chelsio/cxgb4/sge.c
  2542  int cxgb4_selftest_lb_pkt(struct net_device *netdev)
  2543  {
  2544          struct port_info *pi = netdev_priv(netdev);
  2545          struct adapter *adap = pi->adapter;
  2546          struct cxgb4_ethtool_lb_test *lb;
  2547          int ret, i = 0, pkt_len, credits;
  2548          struct fw_eth_tx_pkt_wr *wr;
                ^^^^^^^^^^^^^^^^^^^^^^^^^^^

  2549          struct cpl_tx_pkt_core *cpl;
  2550          u32 ctrl0, ndesc, flits;
  2551          struct sge_eth_txq *q;
  2552          u8 *sgl;
  2553  
  2554          pkt_len = ETH_HLEN + sizeof(CXGB4_SELFTEST_LB_STR);
  2555  
  2556          flits = DIV_ROUND_UP(pkt_len + sizeof(struct cpl_tx_pkt) +
  2557                               sizeof(*wr), sizeof(__be64));
  2558          ndesc = flits_to_desc(flits);
  2559  
  2560          lb = &pi->ethtool_lb;
  2561          lb->loopback = 1;
  2562  
  2563          q = &adap->sge.ethtxq[pi->first_qset];
  2564  
  2565          reclaim_completed_tx(adap, &q->q, -1, true);
  2566          credits = txq_avail(&q->q) - ndesc;
  2567          if (unlikely(credits < 0))
  2568                  return -ENOMEM;
  2569  
  2570          wr = (void *)&q->q.desc[q->q.pidx];
  2571          memset(wr, 0, sizeof(struct tx_desc));
                              ^^^^^^^^^^^^^^^^^^^^^
Is this type correct?

  2572  
  2573          wr->op_immdlen = htonl(FW_WR_OP_V(FW_ETH_TX_PKT_WR) |
  2574                                 FW_WR_IMMDLEN_V(pkt_len +
  2575                                 sizeof(*cpl)));
  2576          wr->equiq_to_len16 = htonl(FW_WR_LEN16_V(DIV_ROUND_UP(flits, 2)));
  2577          wr->r3 = cpu_to_be64(0);
  2578  
  2579          cpl = (void *)(wr + 1);
  2580          sgl = (u8 *)(cpl + 1);
  2581  

regards,
dan carpenter
