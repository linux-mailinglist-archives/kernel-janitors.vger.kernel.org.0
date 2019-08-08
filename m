Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3081985FAF
	for <lists+kernel-janitors@lfdr.de>; Thu,  8 Aug 2019 12:32:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389978AbfHHKcc (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Thu, 8 Aug 2019 06:32:32 -0400
Received: from userp2120.oracle.com ([156.151.31.85]:55272 "EHLO
        userp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389810AbfHHKcb (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 8 Aug 2019 06:32:31 -0400
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
        by userp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x78ASZmx040049;
        Thu, 8 Aug 2019 10:32:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2019-08-05;
 bh=eMELLNBfA8V5hTIjtVqrrncIqhLVp4Emd0YDFn2j2O4=;
 b=XDoeAbi5oaRit+HQfeAh4uZXHmb/uKIrVWvjMqjvXdENzjumHkcftrK2gbCv0js0APmS
 lnCgw0sg5f9mRA36uQuPGYUsvnWzX08gKaN4xOc31ndY+3OU1hPO98ZQBwkoigJyi0pH
 A8HFO/qacLU582kG7DlQhktaxf9Yg6k4FFzzATAqoZt90/Q8p3sToO7KbZLckwAQo7oH
 zidQkEdudu2Vk7q07gm2zeuKJaSBOajEr22lMFnfRKN37/uDI9FNt42XzoKf2/mGMNX6
 aeSHKVfzuStUuFxROcfZMqm7foWBWaCV4TvxjXy/WZO25O3mvVL5svDcHOQi1eUpjGb2 iQ== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2018-07-02;
 bh=eMELLNBfA8V5hTIjtVqrrncIqhLVp4Emd0YDFn2j2O4=;
 b=CYVtt9PR3c6MhFa6I3O29OTT1vOGSn3z4qOZjvwMhi0KfrNG+fU1a9lpVxbhUXnQNew2
 iDw+X2Cj6jVujMpvPRWg8qdqYJii5FFvkV2hjeWGpEIkme4p9K6RXLxDDhUVAk9AXvgQ
 +ysW8RVOPUlMFy146gx2/fmegx7V/1GOelJm2bb0eTHCp0uAiN9P9PLzgSCz2FFCWYBL
 /P0VmZcml5WfVIfNvHuBahTTuoWbqzt3jQvn60AkNZjGrelUatdxQlbAUYkcMkfreTNy
 PgE1jZGOPyk+F3SGi5agA+88KzVH0F9RkFPJEF1E0nc/FhAAgy2nokW4fP9m/hOt4CMt CA== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
        by userp2120.oracle.com with ESMTP id 2u8hgp07uc-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 08 Aug 2019 10:32:20 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
        by userp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x78AS6RZ006664;
        Thu, 8 Aug 2019 10:32:20 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
        by userp3030.oracle.com with ESMTP id 2u7668x9cx-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 08 Aug 2019 10:32:20 +0000
Received: from abhmp0020.oracle.com (abhmp0020.oracle.com [141.146.116.26])
        by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id x78AWEPT005668;
        Thu, 8 Aug 2019 10:32:15 GMT
Received: from mwanda (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Thu, 08 Aug 2019 03:32:14 -0700
Date:   Thu, 8 Aug 2019 13:32:07 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Saravana Kannan <saravanak@google.com>
Cc:     Frank Rowand <frowand.list@gmail.com>,
        Anton Vorontsov <anton@enomsg.org>,
        Colin Cross <ccross@android.com>,
        Tony Luck <tony.luck@intel.com>, devicetree@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: [PATCH] of/platform: Clean up a return type in of_link_property()
Message-ID: <20190808103207.GA30506@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9342 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1906280000 definitions=main-1908080114
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9342 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1906280000
 definitions=main-1908080115
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

This function is supposed to return zero on success and negative
error codes on failure but currently it returns true on failure.  The
caller only checks for zero and non-zero so this mixup doesn't cause any
runtime issues.

Fixes: 690ff7881b26 ("of/platform: Add functional dependency link from DT bindings")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/of/platform.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/of/platform.c b/drivers/of/platform.c
index 21838226d68a..86fb8ab8c012 100644
--- a/drivers/of/platform.c
+++ b/drivers/of/platform.c
@@ -625,7 +625,7 @@ static const struct supplier_bindings bindings[] = {
 	{ },
 };
 
-static bool of_link_property(struct device *dev, struct device_node *con_np,
+static int of_link_property(struct device *dev, struct device_node *con_np,
 			     const char *prop)
 {
 	struct device_node *phandle;
-- 
2.20.1

