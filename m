Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3567B1D0C8F
	for <lists+kernel-janitors@lfdr.de>; Wed, 13 May 2020 11:44:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729917AbgEMJom (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Wed, 13 May 2020 05:44:42 -0400
Received: from aserp2120.oracle.com ([141.146.126.78]:37596 "EHLO
        aserp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726532AbgEMJom (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 13 May 2020 05:44:42 -0400
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
        by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 04D9h7L2021465;
        Wed, 13 May 2020 09:44:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=CqEotzK6nQD/0Q7SQNmyOVX9sntRWK4KGEuUznZHTa0=;
 b=k5VgYvjGFH+F3FqGaJzYhdoQ/RtcRg6ClF6s7gAhpUlBdivzyt0G+mTzeW5ecihp1Wn1
 GkC3c71VcZkzvXvTNnIHuutzNC9e5wB3vW6511DdWfMm5bbrvmdjkBrPf/hBcIBZmEwh
 YLgs0lO//7EHJEM508qU1oMuhIC0O3w10ii808yMcoJLeXiRpP/ydHn/eepmP0IbWx6i
 9QNE/tuWJV2PczQ6ooIMWPc9/wMyDNNmXVYbbEKDLv9syk7qCNrsOunfzsCHA1922GJm
 LvhC+8Ms3ULB5Szav8gE38nt/MerHiPblnk8eIbjbR7x0ohuZwFyHJOTrbgY/TLk2d3h tw== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
        by aserp2120.oracle.com with ESMTP id 3100xwb611-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 13 May 2020 09:44:36 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
        by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 04D9c99m111664;
        Wed, 13 May 2020 09:42:36 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
        by aserp3030.oracle.com with ESMTP id 3100ya794q-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 13 May 2020 09:42:36 +0000
Received: from abhmp0005.oracle.com (abhmp0005.oracle.com [141.146.116.11])
        by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 04D9gYs7023475;
        Wed, 13 May 2020 09:42:34 GMT
Received: from mwanda (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Wed, 13 May 2020 02:42:31 -0700
Date:   Wed, 13 May 2020 12:42:25 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     =?iso-8859-1?B?Suly9G1l?= Glisse <jglisse@redhat.com>,
        Ralph Campbell <rcampbell@nvidia.com>
Cc:     linux-mm@kvack.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] mm/hmm/test: fix an error code in hmm_dmirror_init()
Message-ID: <20200513094225.GE347693@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9619 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 malwarescore=0 phishscore=0
 adultscore=0 suspectscore=0 mlxscore=0 mlxlogscore=999 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2005130087
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9619 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 lowpriorityscore=0
 suspectscore=0 mlxlogscore=999 clxscore=1015 cotscore=-2147483648
 mlxscore=0 phishscore=0 adultscore=0 impostorscore=0 bulkscore=0
 malwarescore=0 priorityscore=1501 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2004280000 definitions=main-2005130088
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

If the allocation fails, then this should return -ENOMEM instead of
success.

Fixes: a149d2eb654b ("mm/hmm/test: add selftest driver for HMM")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 lib/test_hmm.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/lib/test_hmm.c b/lib/test_hmm.c
index 00bca6116f930..b4d9434e49e72 100644
--- a/lib/test_hmm.c
+++ b/lib/test_hmm.c
@@ -1119,8 +1119,10 @@ static int __init hmm_dmirror_init(void)
 	 * make the code here simpler (i.e., we need a struct page for it).
 	 */
 	dmirror_zero_page = alloc_page(GFP_HIGHUSER | __GFP_ZERO);
-	if (!dmirror_zero_page)
+	if (!dmirror_zero_page) {
+		ret = -ENOMEM;
 		goto err_chrdev;
+	}
 
 	pr_info("HMM test module loaded. This is only for testing HMM.\n");
 	return 0;
-- 
2.26.2

