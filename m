Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B5B8B39A126
	for <lists+kernel-janitors@lfdr.de>; Thu,  3 Jun 2021 14:35:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230412AbhFCMg5 (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Thu, 3 Jun 2021 08:36:57 -0400
Received: from aserp2130.oracle.com ([141.146.126.79]:37634 "EHLO
        aserp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230400AbhFCMg4 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 3 Jun 2021 08:36:56 -0400
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
        by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 153CUv3S088402;
        Thu, 3 Jun 2021 12:34:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=umhuKUbm8gjwABm6opsKffTVYqL1p4//Cl+iUJGjF40=;
 b=oDRjLsIwUsnhPRd89rA8XCd6AFnRJ1HdwWCBtljjvA6/svAgCjaEmwKOkk1MWK/Vvwu6
 ri2EjvIZWVsboOtt+6Xu/mk/CXbj1wKsKcDKzGH/aXLqxY9lERGB/zBNlvAV2HabZpIC
 oWRoRKsWKgzsbfy1uYGos22n2AEXwlioGbQwgKWv+EjMIrvJDYN1ud9r3f/PGSALRyUE
 S6PJ50PYml3exfTslXESedPtWhcTf2qo42ZdNpG6LUaqAr9d6VQ4wvyj5SBOwx+lOLy4
 IapCzZJZL+ER+zOGasHxvG1F81piMtZVOcoR+hCkRo+ZRqx3h/Dud68vCpkyxEIcwdTx 2A== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
        by aserp2130.oracle.com with ESMTP id 38ub4cu953-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 03 Jun 2021 12:34:53 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
        by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 153CVpxK114924;
        Thu, 3 Jun 2021 12:34:53 GMT
Received: from pps.reinject (localhost [127.0.0.1])
        by aserp3020.oracle.com with ESMTP id 38udeevu57-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 03 Jun 2021 12:34:53 +0000
Received: from aserp3020.oracle.com (aserp3020.oracle.com [127.0.0.1])
        by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 153CY0XV128340;
        Thu, 3 Jun 2021 12:34:52 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
        by aserp3020.oracle.com with ESMTP id 38udeevu3d-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 03 Jun 2021 12:34:52 +0000
Received: from abhmp0003.oracle.com (abhmp0003.oracle.com [141.146.116.9])
        by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 153CYorj003418;
        Thu, 3 Jun 2021 12:34:51 GMT
Received: from mwanda (/10.175.206.145)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Thu, 03 Jun 2021 12:34:49 +0000
Date:   Thu, 3 Jun 2021 15:34:43 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Richard Weinberger <richard@nod.at>
Cc:     Artem Bityutskiy <Artem.Bityutskiy@nokia.com>,
        Adrian Hunter <ext-adrian.hunter@nokia.com>,
        linux-mtd@lists.infradead.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] ubifs: fix an IS_ERR() vs NULL check
Message-ID: <YLjMYy9E6U2/flhP@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-Proofpoint-GUID: oiKughyiwmpH2gMde8IxRVk0DRcxAxMM
X-Proofpoint-ORIG-GUID: oiKughyiwmpH2gMde8IxRVk0DRcxAxMM
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10003 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 mlxscore=0
 mlxlogscore=999 malwarescore=0 bulkscore=0 phishscore=0 lowpriorityscore=0
 clxscore=1011 impostorscore=0 adultscore=0 suspectscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2106030085
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

The ubifs_fast_find_frdi_idx() function returns NULL on error, it
doesn't return error pointers.  Update the check accordingly.

Fixes: 1e51764a3c2a ("UBIFS: add new flash file system")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 fs/ubifs/gc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/ubifs/gc.c b/fs/ubifs/gc.c
index dc3e26e9ed7b..7cc22d7317ea 100644
--- a/fs/ubifs/gc.c
+++ b/fs/ubifs/gc.c
@@ -895,8 +895,8 @@ int ubifs_gc_start_commit(struct ubifs_info *c)
 	/* Record index freeable LEBs for unmapping after commit */
 	while (1) {
 		lp = ubifs_fast_find_frdi_idx(c);
-		if (IS_ERR(lp)) {
-			err = PTR_ERR(lp);
+		if (!lp) {
+			err = -ENOMEM;
 			goto out;
 		}
 		if (!lp)
-- 
2.30.2

