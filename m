Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 958B14B5C7
	for <lists+kernel-janitors@lfdr.de>; Wed, 19 Jun 2019 12:02:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731263AbfFSKCH (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Wed, 19 Jun 2019 06:02:07 -0400
Received: from userp2120.oracle.com ([156.151.31.85]:41854 "EHLO
        userp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726479AbfFSKCH (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 19 Jun 2019 06:02:07 -0400
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
        by userp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x5J9xA9V010668;
        Wed, 19 Jun 2019 10:01:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2018-07-02;
 bh=kLj8ZQ4NWy3sWgqEOEEsZOAICsA5ZWqeqT2DhancBZQ=;
 b=ymkn3DZPcDzkFic/lihIYR4HQ0aCCLXtqNeYDCjT0FDfVey2F1t+g8UbWHNZ8nyte8wx
 93rE2Kx6DMscmh+Lm/yzUGhhe5gKr+6yRiopYV1o8kuobNCRgXXbaxZ0wXZb8UGlRo50
 6YnfdEKHioqJVtT9xeI+DsmumPOARw0k00TqnwIxaFVgHviWPjD3e9THxV3xPHJx6T27
 8YciTSoAdyUNmSTffrHG0Siv8zYk2cIpQewOJZXNp5hAF+45+tAP4a8LUNre98NVEBNM
 c9JBN0Un7PxZFozfChUYMCA98T4BRZfXYCO6J1FUHEiOGP2BObYlIbA8RRApXSQZvn8L 8A== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
        by userp2120.oracle.com with ESMTP id 2t7809aewc-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 19 Jun 2019 10:01:54 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
        by userp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x5JA19V6142777;
        Wed, 19 Jun 2019 10:01:53 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
        by userp3020.oracle.com with ESMTP id 2t77yn0bb7-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 19 Jun 2019 10:01:53 +0000
Received: from abhmp0018.oracle.com (abhmp0018.oracle.com [141.146.116.24])
        by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x5JA1mow025338;
        Wed, 19 Jun 2019 10:01:49 GMT
Received: from mwanda (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Wed, 19 Jun 2019 03:01:47 -0700
Date:   Wed, 19 Jun 2019 13:01:41 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Sean Paul <seanpaul@chromium.org>
Cc:     Maxime Ripard <maxime.ripard@bootlin.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        dri-devel@lists.freedesktop.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] drm: self_refresh: Fix a reversed condition in
 drm_self_refresh_helper_cleanup()
Message-ID: <20190619100141.GA28596@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9292 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1810050000 definitions=main-1906190082
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9292 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1906190083
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

This test is flipped around so it either leads to a memory leak or a
NULL dereference.

Fixes: 1452c25b0e60 ("drm: Add helpers to kick off self refresh mode in drivers")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
I'm not totally sure what the prefered patch prefix for this code.  One
thing that would help is when we're adding new files we should specify
the prefix that they're going to use:

- drm: Add helpers to kick off self refresh mode in drivers
+ drm: refresh mode: Add helpers to kick off self refresh mode in drivers

It's a small thing and email always sounds whiny but I'm sending this
suggestion to everyone today so...

 drivers/gpu/drm/drm_self_refresh_helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_self_refresh_helper.c b/drivers/gpu/drm/drm_self_refresh_helper.c
index 2b3daaf77841..e0d2ad1f070c 100644
--- a/drivers/gpu/drm/drm_self_refresh_helper.c
+++ b/drivers/gpu/drm/drm_self_refresh_helper.c
@@ -205,7 +205,7 @@ void drm_self_refresh_helper_cleanup(struct drm_crtc *crtc)
 	struct drm_self_refresh_data *sr_data = crtc->self_refresh_data;
 
 	/* Helper is already uninitialized */
-	if (sr_data)
+	if (!sr_data)
 		return;
 
 	crtc->self_refresh_data = NULL;
-- 
2.20.1

