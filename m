Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 079541BBEE8
	for <lists+kernel-janitors@lfdr.de>; Tue, 28 Apr 2020 15:20:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726866AbgD1NUU (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Tue, 28 Apr 2020 09:20:20 -0400
Received: from userp2120.oracle.com ([156.151.31.85]:59442 "EHLO
        userp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726798AbgD1NUU (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 28 Apr 2020 09:20:20 -0400
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
        by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 03SDJLAO005508;
        Tue, 28 Apr 2020 13:20:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=y2hBFMz86w0Dd+EN/Jwwq7oMFiNL4j2NlkSqLa1lm4s=;
 b=Gc8H2fxEum79ChMV7g0L/m4xN3fJt0i+DY42uNgepQRprBv1fTEg+AqYWl8ZYu5l/bt1
 cxnhoptbg/wN2S/wQvwacd8mRCjHAURWlUOGNsfc6zn0iBDmeNrdjNS7ATePTLnE9ub4
 QHTHryiT90n1rrK2GlLDCVyOq2x/BqoHTG/TK5Zmzj4kEd8gvY5fxOsi8t+Z9kI1ikOj
 LMMSxUA/97gPnE928rRPMHTA/JoD+cJqrNE0daK88DfXaR9IGhxTAOM7hQhUELcXLUki
 DhALyn2veDn1IKEWIemntoi+woMuHdiMcifjr31R0m7vTuYb0kVIiDz1Ql3rYxutS19x Qw== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
        by userp2120.oracle.com with ESMTP id 30p2p058ty-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 28 Apr 2020 13:20:15 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
        by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 03SDI2St057641;
        Tue, 28 Apr 2020 13:20:14 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
        by aserp3030.oracle.com with ESMTP id 30mxrsj5q3-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 28 Apr 2020 13:20:14 +0000
Received: from abhmp0013.oracle.com (abhmp0013.oracle.com [141.146.116.19])
        by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 03SDKDaX023454;
        Tue, 28 Apr 2020 13:20:13 GMT
Received: from mwanda (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Tue, 28 Apr 2020 06:20:13 -0700
Date:   Tue, 28 Apr 2020 16:20:08 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     ioana.ciornei@nxp.com
Cc:     kernel-janitors@vger.kernel.org
Subject: [bug report] dpaa2-eth: use bulk enqueue in .ndo_xdp_xmit
Message-ID: <20200428132008.GA696615@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9604 signatures=668686
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 phishscore=0 suspectscore=3
 mlxlogscore=899 malwarescore=0 bulkscore=0 spamscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2003020000
 definitions=main-2004280104
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9604 signatures=668686
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 phishscore=0 clxscore=1011
 bulkscore=0 adultscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0
 mlxscore=0 suspectscore=3 mlxlogscore=963 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2003020000
 definitions=main-2004280104
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hello Ioana Ciornei,

The patch 8665d9780e6e: "dpaa2-eth: use bulk enqueue in
.ndo_xdp_xmit" from Apr 22, 2020, leads to the following static
checker warning:

	drivers/net/ethernet/freescale/dpaa2/dpaa2-eth.c:1972 dpaa2_eth_xdp_xmit()
	error: uninitialized symbol 'enqueued'.

drivers/net/ethernet/freescale/dpaa2/dpaa2-eth.c
  1932  static int dpaa2_eth_xdp_xmit(struct net_device *net_dev, int n,
  1933                                struct xdp_frame **frames, u32 flags)
  1934  {
  1935          struct dpaa2_eth_priv *priv = netdev_priv(net_dev);
  1936          int total_enqueued = 0, retries = 0, enqueued;
  1937          struct dpaa2_eth_drv_stats *percpu_extras;
  1938          struct rtnl_link_stats64 *percpu_stats;
  1939          int num_fds, i, err, max_retries;
  1940          struct dpaa2_eth_fq *fq;
  1941          struct dpaa2_fd *fds;
  1942  
  1943          if (unlikely(flags & ~XDP_XMIT_FLAGS_MASK))
  1944                  return -EINVAL;
  1945  
  1946          if (!netif_running(net_dev))
  1947                  return -ENETDOWN;
  1948  
  1949          fq = &priv->fq[smp_processor_id()];
  1950          fds = fq->xdp_fds;
  1951  
  1952          percpu_stats = this_cpu_ptr(priv->percpu_stats);
  1953          percpu_extras = this_cpu_ptr(priv->percpu_extras);
  1954  
  1955          /* create a FD for each xdp_frame in the list received */
  1956          for (i = 0; i < n; i++) {
  1957                  err = dpaa2_eth_xdp_create_fd(net_dev, frames[i], &fds[i]);
  1958                  if (err)
  1959                          break;
  1960          }
  1961          num_fds = i;
  1962  
  1963          /* try to enqueue all the FDs until the max number of retries is hit */
  1964          max_retries = num_fds * DPAA2_ETH_ENQUEUE_RETRIES;
  1965          while (total_enqueued < num_fds && retries < max_retries) {
  1966                  err = priv->enqueue(priv, fq, &fds[total_enqueued],
  1967                                      0, num_fds - total_enqueued, &enqueued);
  1968                  if (err == -EBUSY) {
                            ^^^^^^^^^^^^^
Smatch is complaining here because some -enqueue() implementations
return other error codes as well as -EBUSY.  The
dpaa2_io_service_enqueue_multiple_desc_fq() function returns -ENODEV
for example.

  1969                          percpu_extras->tx_portal_busy += ++retries;
  1970                          continue;
  1971                  }
  1972                  total_enqueued += enqueued;
  1973          }
  1974  
  1975          /* update statistics */
  1976          percpu_stats->tx_packets += total_enqueued;
  1977          for (i = 0; i < total_enqueued; i++)

regards,
dan carpenter
