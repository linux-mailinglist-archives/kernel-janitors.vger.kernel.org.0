Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2D6621DE404
	for <lists+kernel-janitors@lfdr.de>; Fri, 22 May 2020 12:16:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728506AbgEVKQH (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Fri, 22 May 2020 06:16:07 -0400
Received: from userp2120.oracle.com ([156.151.31.85]:60056 "EHLO
        userp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728281AbgEVKQG (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 22 May 2020 06:16:06 -0400
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
        by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 04MADUHs177430;
        Fri, 22 May 2020 10:16:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=NkbCtqM2RDZc7Z3ctguyTALDxoUtePgWHarK3BFiSsA=;
 b=d3RcGkhoOIXGERjowkj8ls05bkiB7I5ocwopSq+F3WLeh2cH3Jw92KbgrJ/TUOPr74UB
 l+tiNDGpC+qB+HFKfsip//WzpvUU16LZq/Qq4J02rlqwYfTS3Ki+Bh4/tphZIjV8FeOh
 acXv2OV6P9qTRPhsdHfP+7kIWYDsUQs0f03zqka1yFNdSLwg6aZh8Wl3CTDHU2j47NR2
 Z0LI5FnzAHBdW55HwDLGvpe8EJ5bvycBix62GRx0Piz2fIw+WHsNL9iKs0591JZ8wj5E
 1DcBnfsZ05DCuZrx1Okn3t366MgRgXcn/eJK0PVcys66shr1F868+sjN4LSAtESnzhSO xQ== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
        by userp2120.oracle.com with ESMTP id 31501rkhtv-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 22 May 2020 10:16:03 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
        by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 04MADHlI099954;
        Fri, 22 May 2020 10:16:02 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
        by aserp3020.oracle.com with ESMTP id 312t3e3mf5-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 22 May 2020 10:16:02 +0000
Received: from abhmp0002.oracle.com (abhmp0002.oracle.com [141.146.116.8])
        by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 04MAG18W022529;
        Fri, 22 May 2020 10:16:01 GMT
Received: from mwanda (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Fri, 22 May 2020 03:16:01 -0700
Date:   Fri, 22 May 2020 13:15:53 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     boris.sukholitko@broadcom.com
Cc:     Edward Cree <ecree@solarflare.com>, kernel-janitors@vger.kernel.org
Subject: [bug report] __netif_receive_skb_core: pass skb by reference
Message-ID: <20200522101553.GA41044@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9628 signatures=668686
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 spamscore=0 mlxlogscore=959
 phishscore=0 mlxscore=0 malwarescore=0 suspectscore=3 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2005220083
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9628 signatures=668686
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 lowpriorityscore=0 spamscore=0
 mlxlogscore=981 clxscore=1011 priorityscore=1501 cotscore=-2147483648
 impostorscore=0 bulkscore=0 adultscore=0 malwarescore=0 phishscore=0
 mlxscore=0 suspectscore=3 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2004280000 definitions=main-2005220083
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hello Boris Sukholitko,

The patch c0bbbdc32feb: "__netif_receive_skb_core: pass skb by
reference" from May 19, 2020, leads to the following static checker
warning:

	net/core/dev.c:5256 __netif_receive_skb_core()
	warn: 'skb' was already freed.

net/core/dev.c
  5230          }
  5231  
  5232          if (pt_prev) {
  5233                  if (unlikely(skb_orphan_frags_rx(skb, GFP_ATOMIC)))
  5234                          goto drop;
  5235                  *ppt_prev = pt_prev;
  5236          } else {
  5237  drop:
  5238                  if (!deliver_exact)
  5239                          atomic_long_inc(&skb->dev->rx_dropped);
  5240                  else
  5241                          atomic_long_inc(&skb->dev->rx_nohandler);
  5242                  kfree_skb(skb);
                                  ^^^

  5243                  /* Jamal, now you will not able to escape explaining
  5244                   * me how you were going to use this. :-)
  5245                   */
  5246                  ret = NET_RX_DROP;
  5247          }
  5248  
  5249  out:
  5250          /* The invariant here is that if *ppt_prev is not NULL
  5251           * then skb should also be non-NULL.
  5252           *
  5253           * Apparently *ppt_prev assignment above holds this invariant due to
  5254           * skb dereferencing near it.
  5255           */
  5256          *pskb = skb;
                ^^^^^^^^^^^^
Freed and also used in the caller.

  5257          return ret;
  5258  }

regards,
dan carpenter
