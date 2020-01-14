Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3591313A06A
	for <lists+kernel-janitors@lfdr.de>; Tue, 14 Jan 2020 06:09:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725860AbgANFJX (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Tue, 14 Jan 2020 00:09:23 -0500
Received: from userp2130.oracle.com ([156.151.31.86]:55292 "EHLO
        userp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725306AbgANFJW (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 14 Jan 2020 00:09:22 -0500
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
        by userp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id 00E53VVR104071;
        Tue, 14 Jan 2020 05:09:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2019-08-05;
 bh=FFkb9dUxlR4b36xvK0yY4DOE0GIA2jJ1lfGv3hBEnsY=;
 b=gHNGf1ez8G+enHPFVUqPNj6uYqSpFZN12ELD6W3EWiF5MsrsuLSCGmCndyrHNSsYiBKS
 j78WZf6e3/D8ctxrBHBwyfbI9QewdWtrx8Tpse8kyZSuJ50XzVASYHFxSRos+YKfF/AJ
 iJ85sSKgmA1HBXqC7Cjsg2fG0Ft1MIjGbD/O99tfYOf/jjyu3SXbmxhDApUUxu87C83i
 BGW8JnSVeIzjTS+HhpGi1aS4JzNHwuBAI4WHTCpypEbVc/SU+E09NmvwSuYqMp5I5d9P
 oBY/8BR3HV0YizTS84X30Ks96h9ztUDeSgQDhTh//GoGC3vYnDEBciztjK1GE/3ljzHI 4Q== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
        by userp2130.oracle.com with ESMTP id 2xf74s3hqy-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 14 Jan 2020 05:09:13 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
        by aserp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id 00E53UXE165200;
        Tue, 14 Jan 2020 05:09:12 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
        by aserp3030.oracle.com with ESMTP id 2xh2tn2eps-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 14 Jan 2020 05:09:12 +0000
Received: from abhmp0019.oracle.com (abhmp0019.oracle.com [141.146.116.25])
        by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 00E59Alh016266;
        Tue, 14 Jan 2020 05:09:10 GMT
Received: from kili.mountain (/129.205.23.165)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Mon, 13 Jan 2020 21:09:09 -0800
Date:   Tue, 14 Jan 2020 08:09:02 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Seth Jennings <sjenning@redhat.com>,
        Vitaly Wool <vitaly.wool@konsulko.com>
Cc:     Dan Streetman <ddstreet@ieee.org>,
        Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org,
        kernel-janitors@vger.kernel.org
Subject: [PATCH] zswap: potential NULL dereference on error in init_zswap()
Message-ID: <20200114050902.og32fkllkod5ycf5@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
User-Agent: NeoMutt/20170113 (1.7.2)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9499 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1911140001 definitions=main-2001140044
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9499 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1911140001
 definitions=main-2001140044
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

The "pool" pointer can be NULL at the end of the init_zswap().  (We
would allocate a new pool later in that situation.)  So in the error
handling then we need to make sure pool is a valid pointer before
calling "zswap_pool_destroy(pool);" because that function dereferences
the argument.

Fixes: 93d4dfa9fbd0 ("mm/zswap.c: add allocation hysteresis if pool limit is hit")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 mm/zswap.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/mm/zswap.c b/mm/zswap.c
index 7ec8bd912d13..55094e63b72d 100644
--- a/mm/zswap.c
+++ b/mm/zswap.c
@@ -1359,7 +1359,8 @@ static int __init init_zswap(void)
 	return 0;
 
 fallback_fail:
-	zswap_pool_destroy(pool);
+	if (pool)
+		zswap_pool_destroy(pool);
 hp_fail:
 	cpuhp_remove_state(CPUHP_MM_ZSWP_MEM_PREPARE);
 dstmem_fail:
-- 
2.11.0

