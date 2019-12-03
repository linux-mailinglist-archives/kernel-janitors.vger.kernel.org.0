Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1CF4E10FC01
	for <lists+kernel-janitors@lfdr.de>; Tue,  3 Dec 2019 11:48:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725997AbfLCKs1 (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Tue, 3 Dec 2019 05:48:27 -0500
Received: from userp2130.oracle.com ([156.151.31.86]:49656 "EHLO
        userp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725829AbfLCKs0 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 3 Dec 2019 05:48:26 -0500
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
        by userp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id xB3AiShK094243;
        Tue, 3 Dec 2019 10:48:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2019-08-05;
 bh=hi4CpXGuNnCcVu3hArJhrhjnnFKS2F7ytcnPm3zQ5TY=;
 b=lcl97AFlhSk6RGv2P5UCdj4bGS8CzEVlbpioW0IsNNtcXup7Kee854gFYchw4FGdK0rG
 Z65pnHEYWuALsajyfD8VeEfgZfWvSlDg1mtBIpFeRap7oFyuX1DUJDF2n6JT7+qsdxpn
 0fpew7wWdkbqgMQTSlN2yBY0Wmg5Nrs3jFXx/jwZ7us0vBEkgbsVgiFtCu2zPdN6AVya
 v6sar/e9iStq0eM0BOLT3InRcskltt3PRmCB7m0AkxNOmoxJLvkDYzl7iwPAV8+aA7f7
 ininp/nLJV71HCEGIEcK4c1taUXN0o+tCQSmhh2r2n5069YcABf3hdt+TMLT2pWUP1EC WQ== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
        by userp2130.oracle.com with ESMTP id 2wkfuu6wc1-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 03 Dec 2019 10:48:24 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
        by aserp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id xB3Ai7pk043362;
        Tue, 3 Dec 2019 10:48:23 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
        by aserp3030.oracle.com with ESMTP id 2wn8k2dehe-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 03 Dec 2019 10:48:23 +0000
Received: from abhmp0016.oracle.com (abhmp0016.oracle.com [141.146.116.22])
        by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id xB3AmMl1012420;
        Tue, 3 Dec 2019 10:48:22 GMT
Received: from kili.mountain (/129.205.23.165)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Tue, 03 Dec 2019 02:48:22 -0800
Date:   Tue, 3 Dec 2019 13:48:16 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     timur@codeaurora.org
Cc:     kernel-janitors@vger.kernel.org
Subject: [bug report] net: emac: emac gigabit ethernet controller driver
Message-ID: <20191203104816.qdozqfywtvtmr4ie@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: NeoMutt/20170113 (1.7.2)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9459 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=1 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=520
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1911140001 definitions=main-1912030087
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9459 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=584 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1911140001
 definitions=main-1912030087
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hello Timur Tabi,

The patch b9b17debc69d: "net: emac: emac gigabit ethernet controller
driver" from Aug 31, 2016, leads to the following static checker
warning:

	drivers/net/ethernet/qualcomm/emac/emac-mac.c:1463 emac_mac_tx_buf_send()
	error: dereferencing freed memory 'skb'

drivers/net/ethernet/qualcomm/emac/emac-mac.c
  1412           * so it will be freed after unmap
  1413           */
  1414          tpbuf->skb = skb;
  1415  
  1416          return;
  1417  
  1418  error:
  1419          /* One of the memory mappings failed, so undo everything */
  1420          tx_q->tpd.produce_idx = first;
  1421  
  1422          while (count--) {
  1423                  tpbuf = GET_TPD_BUFFER(tx_q, first);
  1424                  dma_unmap_page(adpt->netdev->dev.parent, tpbuf->dma_addr,
  1425                                 tpbuf->length, DMA_TO_DEVICE);
  1426                  tpbuf->dma_addr = 0;
  1427                  tpbuf->length = 0;
  1428  
  1429                  if (++first == tx_q->tpd.count)
  1430                          first = 0;
  1431          }
  1432  
  1433          dev_kfree_skb(skb);
                              ^^^
The caller has no way to know if skb is freed or not.

  1434  }

regards,
dan carpenter
