Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 07EA727E47B
	for <lists+kernel-janitors@lfdr.de>; Wed, 30 Sep 2020 11:06:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728149AbgI3JGB (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Wed, 30 Sep 2020 05:06:01 -0400
Received: from userp2120.oracle.com ([156.151.31.85]:60818 "EHLO
        userp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725776AbgI3JGB (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 30 Sep 2020 05:06:01 -0400
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
        by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 08U955UQ067425;
        Wed, 30 Sep 2020 09:05:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=FoZz65iP5Iq/vDCXSnQLuQn1743Y/uvJf3efBhGPlJs=;
 b=0dI77ddL9IOsy23JZj3xlrPmXBM8XCAD343R7KxNzLWOgJdpMjlCXIaKb1kF2XuJjhyY
 Gs8KdXEZ3oJf+p5VehWzUvUl50CHz3u4zj/7BKQetAZgikTXX5Tomb30DgI9gBWwDyNj
 lI6TOo74g24TZBNrWCDUuyq81AD5bfmBC73+jYaaEsovHwRltRNZWeA0Yf9gT1P0mlvP
 N0sZjNUjmdZWJZFZLaCiVoh8rVsqFRvf1IqNzWJ1JWixoDruTqajF0MbAqb85sEznBcu
 9iuPgUJQnLKs90dT/6k1jIMAmQKT0siP4/VV0FC7TSQF+bxZKA/SXKI+7/b0N9os7gHG Yg== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
        by userp2120.oracle.com with ESMTP id 33sx9n7bub-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 30 Sep 2020 09:05:47 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
        by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 08U90ttu055613;
        Wed, 30 Sep 2020 09:03:47 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
        by aserp3030.oracle.com with ESMTP id 33uv2f2nyv-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 30 Sep 2020 09:03:47 +0000
Received: from abhmp0016.oracle.com (abhmp0016.oracle.com [141.146.116.22])
        by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 08U93eFI022378;
        Wed, 30 Sep 2020 09:03:40 GMT
Received: from mwanda (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Wed, 30 Sep 2020 02:03:40 -0700
Date:   Wed, 30 Sep 2020 12:03:34 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Eddie James <eajames@linux.ibm.com>
Cc:     Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
        linux-aspeed@lists.ozlabs.org,
        linux-arm-kernel@lists.infradead.org,
        kernel-janitors@vger.kernel.org
Subject: [PATCH] soc: aspeed: xdma: Return -EFAULT if copy_from_user() fails
Message-ID: <20200930090334.GB621698@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9759 signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 spamscore=0 adultscore=0
 suspectscore=0 malwarescore=0 bulkscore=0 mlxlogscore=999 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2009300072
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9759 signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 suspectscore=0
 phishscore=0 mlxscore=0 lowpriorityscore=0 adultscore=0 clxscore=1011
 spamscore=0 impostorscore=0 malwarescore=0 bulkscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2009300073
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

The copy_from_user() function returns the number of bytes remaining
which we weren't able to copy.  This should return -EFAULT to the
user.

Fixes: 86609baa4217 ("soc: aspeed: xdma: Add user interface")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/soc/aspeed/aspeed-xdma.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/soc/aspeed/aspeed-xdma.c b/drivers/soc/aspeed/aspeed-xdma.c
index 91b51a3de8df..e6b4744bda64 100644
--- a/drivers/soc/aspeed/aspeed-xdma.c
+++ b/drivers/soc/aspeed/aspeed-xdma.c
@@ -569,9 +569,8 @@ static ssize_t aspeed_xdma_write(struct file *file, const char __user *buf,
 	if (len != sizeof(op))
 		return -EINVAL;
 
-	rc = copy_from_user(&op, buf, len);
-	if (rc)
-		return rc;
+	if (copy_from_user(&op, buf, len))
+		return -EFAULT;
 
 	if (!op.len || op.len > client->size ||
 	    op.direction > ASPEED_XDMA_DIRECTION_UPSTREAM)
-- 
2.28.0

