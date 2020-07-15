Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 608B7220C8E
	for <lists+kernel-janitors@lfdr.de>; Wed, 15 Jul 2020 14:00:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728233AbgGOMA1 (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Wed, 15 Jul 2020 08:00:27 -0400
Received: from aserp2120.oracle.com ([141.146.126.78]:57406 "EHLO
        aserp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725852AbgGOMA1 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 15 Jul 2020 08:00:27 -0400
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
        by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 06FBv5GF009914;
        Wed, 15 Jul 2020 11:59:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=pqB/IF6h9Mi+ki2o18Kl7V7QbCw8kn75NUEbxuFB0t4=;
 b=mKwct2i/hO1Bxuj2qewXFsrEBd6d0ZUtYe1WNJIBGlmX2Uzvj0JAtdKySoTfi0PP4Ca0
 +VLjGjQMGACsP8H6QyHp0Obut7wdEV4BtKwj3S5jrFe5eh0qlTB7hLLnSfCrThMAyVVo
 4dJ1TtQIsT0pl6Hptl2H8AWb/cSTMQY+ixUYUkoUYqAhw+Zt9BoGjNKRyXNa2qd4vvgQ
 tfBandB87o0pPq9ZiPgUmPghagGqFcZtBfnOe+wmXiLf+dx2aBmAY1V6+9/4b3Iwhdii
 zXJMoKpl3RIx7BNDND3zoHV4ijc8HyXvW8gncMN4L3hRTv28/aXM0u3ANFynXoxzmzob Xg== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
        by aserp2120.oracle.com with ESMTP id 3275cmaw9m-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 15 Jul 2020 11:59:36 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
        by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 06FBvbt7184681;
        Wed, 15 Jul 2020 11:59:36 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
        by aserp3020.oracle.com with ESMTP id 327qb7bc5d-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 15 Jul 2020 11:59:35 +0000
Received: from abhmp0011.oracle.com (abhmp0011.oracle.com [141.146.116.17])
        by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 06FBxYgN021586;
        Wed, 15 Jul 2020 11:59:34 GMT
Received: from mwanda (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Wed, 15 Jul 2020 04:59:34 -0700
Date:   Wed, 15 Jul 2020 14:59:29 +0300
From:   <dan.carpenter@oracle.com>
To:     ioana.ciornei@nxp.com
Cc:     kernel-janitors@vger.kernel.org
Subject: [bug report] dpaa2-eth: send a scatter-gather FD instead of
 realloc-ing
Message-ID: <20200715115929.GA390833@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9682 signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=986 malwarescore=0
 mlxscore=0 spamscore=0 phishscore=0 suspectscore=3 bulkscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2007150101
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9682 signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=3 priorityscore=1501
 bulkscore=0 adultscore=0 lowpriorityscore=0 phishscore=0 spamscore=0
 impostorscore=0 malwarescore=0 mlxlogscore=984 clxscore=1011 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2007150101
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hello Ioana Ciornei,

The patch d70446ee1f40: "dpaa2-eth: send a scatter-gather FD instead
of realloc-ing" from Jun 29, 2020, leads to the following static
checker warning:

	drivers/net/ethernet/freescale/dpaa2/dpaa2-eth.c:719 build_sg_fd_single_buf()
	warn: overwrite may leak 'sgt_buf'

drivers/net/ethernet/freescale/dpaa2/dpaa2-eth.c
   694  static int build_sg_fd_single_buf(struct dpaa2_eth_priv *priv,
   695                                    struct sk_buff *skb,
   696                                    struct dpaa2_fd *fd)
   697  {
   698          struct device *dev = priv->net_dev->dev.parent;
   699          struct dpaa2_eth_sgt_cache *sgt_cache;
   700          struct dpaa2_sg_entry *sgt;
   701          struct dpaa2_eth_swa *swa;
   702          dma_addr_t addr, sgt_addr;
   703          void *sgt_buf = NULL;
   704          int sgt_buf_size;
   705          int err;
   706  
   707          /* Prepare the HW SGT structure */
   708          sgt_cache = this_cpu_ptr(priv->sgt_cache);
   709          sgt_buf_size = priv->tx_data_offset + sizeof(struct dpaa2_sg_entry);
   710  
   711          if (sgt_cache->count == 0)
   712                  sgt_buf = kzalloc(sgt_buf_size + DPAA2_ETH_TX_BUF_ALIGN,
   713                                    GFP_ATOMIC);
   714          else
   715                  sgt_buf = sgt_cache->buf[--sgt_cache->count];
   716          if (unlikely(!sgt_buf))
   717                  return -ENOMEM;
   718  
   719          sgt_buf = PTR_ALIGN(sgt_buf, DPAA2_ETH_TX_BUF_ALIGN);

Do we need to store the original "sgt_buf" pointer so we can kfree() it
at the end?

   720          sgt = (struct dpaa2_sg_entry *)(sgt_buf + priv->tx_data_offset);
   721  
   722          addr = dma_map_single(dev, skb->data, skb->len, DMA_BIDIRECTIONAL);
   723          if (unlikely(dma_mapping_error(dev, addr))) {
   724                  err = -ENOMEM;
   725                  goto data_map_failed;
   726          }
   727  
   728          /* Fill in the HW SGT structure */
   729          dpaa2_sg_set_addr(sgt, addr);
   730          dpaa2_sg_set_len(sgt, skb->len);
   731          dpaa2_sg_set_final(sgt, true);
   732  
   733          /* Store the skb backpointer in the SGT buffer */

regards,
dan carpenter
