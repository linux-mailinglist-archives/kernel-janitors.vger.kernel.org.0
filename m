Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C65502D73CD
	for <lists+kernel-janitors@lfdr.de>; Fri, 11 Dec 2020 11:19:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732853AbgLKKRm (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Fri, 11 Dec 2020 05:17:42 -0500
Received: from aserp2120.oracle.com ([141.146.126.78]:46364 "EHLO
        aserp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2392190AbgLKKOw (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 11 Dec 2020 05:14:52 -0500
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
        by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0BBA9WVM134936;
        Fri, 11 Dec 2020 10:14:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=FNgcbvekq0t3JHkWHIlt7bqpEDwnJ3novWxxvB9389I=;
 b=HnbFQOZR2v4EckWDVxevE0HtAruS5UxnYG7a3wzvRt6oR9uCTVSiF0dGyt3X3VtVCSBQ
 iBRu7mYlc8w1V9r6XXyAhEoPZpyZtYnThatyBVv8BHRJcNk4LBhsjNSMscrQstbYeQTj
 hfqfeXiUPUraQQdNcM5Dci9mb5arzRY+H9iwqTz28ElIN0UHrSjk16bRg+JA9EOfmCfj
 xgtCFauigM+4WImOZ+yVXRODLMndD0+NpQlhVJOGl2T4JoS4MRhjaQkFw+BD7xmoT2d+
 KOWCCHN0Yw6mRqiQNdtA9cjqb2qIu8bZVIirCRRAOo0hCPweK4SZ1y/bc7ftHQJL4u/U ZQ== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
        by aserp2120.oracle.com with ESMTP id 35825mhx29-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 11 Dec 2020 10:14:07 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
        by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0BBA9rBN083963;
        Fri, 11 Dec 2020 10:14:06 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
        by userp3030.oracle.com with ESMTP id 358m53n8ra-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 11 Dec 2020 10:14:06 +0000
Received: from abhmp0006.oracle.com (abhmp0006.oracle.com [141.146.116.12])
        by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 0BBAE5xW012966;
        Fri, 11 Dec 2020 10:14:05 GMT
Received: from mwanda (/102.36.221.92)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Fri, 11 Dec 2020 02:14:05 -0800
Date:   Fri, 11 Dec 2020 13:13:57 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Mike Kravetz <mike.kravetz@oracle.com>,
        Mina Almasry <almasrymina@google.com>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        David Rientjes <rientjes@google.com>, linux-mm@kvack.org,
        kernel-janitors@vger.kernel.org
Subject: [PATCH] hugetlb: Fix an error code in hugetlb_reserve_pages()
Message-ID: <X9NGZWnZl5/Mt99R@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9831 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 spamscore=0 suspectscore=0
 bulkscore=0 malwarescore=0 phishscore=0 adultscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2012110062
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9831 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 adultscore=0 bulkscore=0
 phishscore=0 mlxlogscore=999 clxscore=1011 priorityscore=1501 mlxscore=0
 spamscore=0 lowpriorityscore=0 malwarescore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2012110062
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Preserve the error code from region_add() instead of returning success.

Fixes: 0db9d74ed884 ("hugetlb: disable region_add file_region coalescing")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
From static analysis.  Untested.

 mm/hugetlb.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/mm/hugetlb.c b/mm/hugetlb.c
index 1f3bf1710b66..ac2e48b9f1d7 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -5113,6 +5113,7 @@ int hugetlb_reserve_pages(struct inode *inode,
 
 		if (unlikely(add < 0)) {
 			hugetlb_acct_memory(h, -gbl_reserve);
+			ret = add;
 			goto out_put_pages;
 		} else if (unlikely(chg > add)) {
 			/*
-- 
2.29.2

