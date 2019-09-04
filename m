Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 43428A7FF8
	for <lists+kernel-janitors@lfdr.de>; Wed,  4 Sep 2019 12:05:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728843AbfIDKFz (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Wed, 4 Sep 2019 06:05:55 -0400
Received: from aserp2120.oracle.com ([141.146.126.78]:55614 "EHLO
        aserp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727722AbfIDKFz (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 4 Sep 2019 06:05:55 -0400
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
        by aserp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x84A4gHn123479;
        Wed, 4 Sep 2019 10:05:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2019-08-05;
 bh=wZiA2MC7EN7k/993lQcH6emTtjuEHiadr/nw0E+LSJw=;
 b=GD2IqqoFBCAMshmoEaGXf1aKgTMMy7fmimnKHahVKWkdho59HRL1+NVjn7/SVjIMaED7
 VluLgw3ZOW069pSAtq6mrrfX0JBKqkl/R6LHH4xIcBOxK7C/jB36ewxgDmlbhMStoxJc
 erCF8KMCQbzpvqV9ezZN9cZNCjhqZ40E+IKLEpZUip5CTvkD0oCkhlrMI0QkVW04CLV8
 OqO1qcvfLMV3TvfawuMRAwwwG0gDSCi5RGysYkPpXRGxKlYhdtRXGS6n87TB2cAmNHGP
 Ry3RQHV8l4dEkMom4HmiPXW1/kY9XkD7mN3sNYNCSuB8wEB0rNkdXu8ZoqDhp6fUTPBO 6g== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
        by aserp2120.oracle.com with ESMTP id 2utb5yr0jh-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 04 Sep 2019 10:05:35 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
        by aserp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x84A3VF5124839;
        Wed, 4 Sep 2019 10:03:35 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
        by aserp3020.oracle.com with ESMTP id 2us5phxdux-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 04 Sep 2019 10:03:34 +0000
Received: from abhmp0012.oracle.com (abhmp0012.oracle.com [141.146.116.18])
        by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id x84A2jYF010026;
        Wed, 4 Sep 2019 10:02:46 GMT
Received: from mwanda (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Wed, 04 Sep 2019 03:02:45 -0700
Date:   Wed, 4 Sep 2019 13:02:39 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <yuchao0@huawei.com>
Cc:     Chao Yu <chao@kernel.org>, linux-f2fs-devel@lists.sourceforge.net,
        kernel-janitors@vger.kernel.org
Subject: [PATCH] f2fs: signedness bug in f2fs_fname_setup_ci_filename()
Message-ID: <20190904100239.GC7007@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9369 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1906280000 definitions=main-1909040100
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9369 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1906280000
 definitions=main-1909040100
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

The error handling doesn't work because "cf_name->len" is unsigned.

Fixes: fbce5d4ab3ab ("f2fs: optimize case-insensitive lookups")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 fs/f2fs/dir.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/f2fs/dir.c b/fs/f2fs/dir.c
index 9de688a4e115..c83b666f9d7e 100644
--- a/fs/f2fs/dir.c
+++ b/fs/f2fs/dir.c
@@ -157,7 +157,7 @@ void f2fs_fname_setup_ci_filename(struct inode *dir,
 	cf_name->len = utf8_casefold(sbi->s_encoding,
 					iname, cf_name->name,
 					F2FS_NAME_LEN);
-	if (cf_name->len <= 0) {
+	if ((int)cf_name->len <= 0) {
 		kvfree(cf_name->name);
 		cf_name->name = NULL;
 	}
-- 
2.20.1

