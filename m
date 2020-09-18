Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 98FCB26FFF9
	for <lists+kernel-janitors@lfdr.de>; Fri, 18 Sep 2020 16:34:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726779AbgIROeK (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Fri, 18 Sep 2020 10:34:10 -0400
Received: from userp2130.oracle.com ([156.151.31.86]:45348 "EHLO
        userp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726126AbgIROeJ (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 18 Sep 2020 10:34:09 -0400
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
        by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 08IEXhQV045895;
        Fri, 18 Sep 2020 14:33:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=uUHSxBdvlTaBB3yAPiD9Ewb5z9pZFFbNre1sPJ+CaIc=;
 b=LMIeibOkwJ0NWuLNlL/2FwziQ2yFBnrwY1XM83L4suJKYEs7Tj1N6rEJWAHXIjZ9bUHO
 5PSvWFkKU1l6+/ArxPcHXJbLhhLRaePCvciBGXqRorHgzLLJ0sRHVCW4+rklDCJhOBPk
 CL9clTAtWnMeQKv9fIfHaNRCv/nygIisUgZf4IiqVKqwCtmCgRdiTjAbmkekH7wfjYl+
 +qb3SKiOvtpV2oMyaR0o37PEBU5Bejsd8ErLs0MB4rz/vrnk+LvrBgiLDnyCUU8w8jee
 g9fxZSS3UgojAscZZdYOvflzyaqYG4FEjlzXc1SW7UXxNmBJlFBvhFO97lZFjim7PUFJ xA== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
        by userp2130.oracle.com with ESMTP id 33gnrrfk54-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 18 Sep 2020 14:33:49 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
        by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 08IETbq7112470;
        Fri, 18 Sep 2020 14:33:48 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
        by aserp3020.oracle.com with ESMTP id 33h88epc1v-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 18 Sep 2020 14:33:48 +0000
Received: from abhmp0020.oracle.com (abhmp0020.oracle.com [141.146.116.26])
        by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 08IEXkEM017907;
        Fri, 18 Sep 2020 14:33:46 GMT
Received: from mwanda (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Fri, 18 Sep 2020 14:33:46 +0000
Date:   Fri, 18 Sep 2020 17:33:38 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mayulong <mayulong1@huawei.com>, devel@driverdev.osuosl.org,
        kernel-janitors@vger.kernel.org
Subject: [PATCH] staging: spmi: hisi-spmi-controller: Use devm_ version of
 ioremap().
Message-ID: <20200918143338.GE909725@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9747 signatures=668679
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 spamscore=0 adultscore=0
 suspectscore=0 phishscore=0 malwarescore=0 bulkscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2009180118
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9747 signatures=668679
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 spamscore=0
 lowpriorityscore=0 malwarescore=0 mlxscore=0 bulkscore=0 suspectscore=0
 clxscore=1011 mlxlogscore=999 adultscore=0 priorityscore=1501
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2009180119
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

The ioremap() was never unmapped in the probe error handling or in the
remove function.  The fix is to use the devm_ioremap() function so it
gets cleaned up automatically.

Fixes: 70f59c90c819 ("staging: spmi: add Hikey 970 SPMI controller driver")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/staging/hikey9xx/hisi-spmi-controller.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/hikey9xx/hisi-spmi-controller.c b/drivers/staging/hikey9xx/hisi-spmi-controller.c
index 5ffe79f45d9a..f831c43f4783 100644
--- a/drivers/staging/hikey9xx/hisi-spmi-controller.c
+++ b/drivers/staging/hikey9xx/hisi-spmi-controller.c
@@ -281,7 +281,8 @@ static int spmi_controller_probe(struct platform_device *pdev)
 		return -EINVAL;
 	}
 
-	spmi_controller->base = ioremap(iores->start, resource_size(iores));
+	spmi_controller->base = devm_ioremap(&pdev->dev, iores->start,
+					     resource_size(iores));
 	if (!spmi_controller->base) {
 		dev_err(&pdev->dev, "can not remap base addr!\n");
 		return -EADDRNOTAVAIL;
-- 
2.28.0

