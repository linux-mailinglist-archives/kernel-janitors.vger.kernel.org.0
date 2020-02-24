Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F267616A3F3
	for <lists+kernel-janitors@lfdr.de>; Mon, 24 Feb 2020 11:33:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726778AbgBXKds (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Mon, 24 Feb 2020 05:33:48 -0500
Received: from userp2130.oracle.com ([156.151.31.86]:39790 "EHLO
        userp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726216AbgBXKds (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 24 Feb 2020 05:33:48 -0500
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
        by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 01OAVLNB169371;
        Mon, 24 Feb 2020 10:33:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=33/Y6rLPLGiMZCFX0tg30kYzGV0vSPS54BmuQAnCqwY=;
 b=uTiODDcxuVxGjO/jsogB8zGuKqt84QceJ7o9NC5CRLBySUQa0MOHi/NfAFYSrk2b4unx
 yfFQxJHcpDtws9qHbmfGH0FnEiroXJnoQc5RVVOpQ7UKQATO5LmSNDcjmifBAFsu1lh1
 EPHMj3xRCGiiGTK/yrCaDpd0bbG7CG8yW7uL778mjJQmJqXVvZTlMoU7+kGLUveNehVT
 qH0gemTqcksK/zjYSy2rKINIXnmpKAMCQGHPZdKKpE4OtmRWdpNmAKrR9FbqasWBX7Ne
 Tu7NVK29zLzCQiD0d7kUHGrAG+mqPmAUMvfghXmCViz+052yyUTHEsxXvMB60JgXm6vL SA== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
        by userp2130.oracle.com with ESMTP id 2yauqu6fse-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 24 Feb 2020 10:33:37 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
        by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 01OAWYi7146550;
        Mon, 24 Feb 2020 10:33:36 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
        by aserp3020.oracle.com with ESMTP id 2yby5bdd44-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 24 Feb 2020 10:33:36 +0000
Received: from abhmp0001.oracle.com (abhmp0001.oracle.com [141.146.116.7])
        by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 01OAXXDu000879;
        Mon, 24 Feb 2020 10:33:33 GMT
Received: from kili.mountain (/129.205.23.165)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Mon, 24 Feb 2020 02:33:32 -0800
Date:   Mon, 24 Feb 2020 13:33:25 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Simon =?iso-8859-1?Q?Sandstr=F6m?= <simon@nikanor.nu>,
        Jeremy Sowden <jeremy@azazel.net>, devel@driverdev.osuosl.org,
        kernel-janitors@vger.kernel.org
Subject: [PATCH] staging: kpc2000: prevent underflow in cpld_reconfigure()
Message-ID: <20200224103325.hrxdnaeqsthplu42@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
User-Agent: NeoMutt/20170113 (1.7.2)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9540 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 mlxscore=0 bulkscore=0
 suspectscore=0 mlxlogscore=999 phishscore=0 adultscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2001150001
 definitions=main-2002240090
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9540 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 bulkscore=0
 clxscore=1011 malwarescore=0 impostorscore=0 adultscore=0 phishscore=0
 priorityscore=1501 mlxlogscore=999 spamscore=0 mlxscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2002240090
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

This function should not allow negative values of "wr_val".  If
negatives are allowed then capping the upper bound at 7 is
meaningless.  Let's make it unsigned.

Fixes: 7dc7967fc39a ("staging: kpc2000: add initial set of Daktronics drivers")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/staging/kpc2000/kpc2000/core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/kpc2000/kpc2000/core.c b/drivers/staging/kpc2000/kpc2000/core.c
index 93cf28febdf6..7b00d7069e21 100644
--- a/drivers/staging/kpc2000/kpc2000/core.c
+++ b/drivers/staging/kpc2000/kpc2000/core.c
@@ -110,10 +110,10 @@ static ssize_t cpld_reconfigure(struct device *dev,
 				const char *buf, size_t count)
 {
 	struct kp2000_device *pcard = dev_get_drvdata(dev);
-	long wr_val;
+	unsigned long wr_val;
 	int rv;
 
-	rv = kstrtol(buf, 0, &wr_val);
+	rv = kstrtoul(buf, 0, &wr_val);
 	if (rv < 0)
 		return rv;
 	if (wr_val > 7)
-- 
2.11.0

