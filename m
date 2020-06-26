Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4E03D20AFED
	for <lists+kernel-janitors@lfdr.de>; Fri, 26 Jun 2020 12:42:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728033AbgFZKmP (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Fri, 26 Jun 2020 06:42:15 -0400
Received: from aserp2120.oracle.com ([141.146.126.78]:41262 "EHLO
        aserp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726311AbgFZKmN (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 26 Jun 2020 06:42:13 -0400
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
        by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 05QAg1Ck006277;
        Fri, 26 Jun 2020 10:42:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=RHxwyeVS5cVxjzQlLvucfrCmMRunelFnmc9UNc4AOJs=;
 b=0hclN/aE3ZulouZJnTF0hTMqggN+tISfVMYaXm6l6IqF6JbZPevnnEO94gfugcjp6JhM
 K5mvPnAgHA4a7gVy72DWLF/2Wt6rPRUH7Qk581Kex304/mkZto+eytKwPL/zjXOiSPZL
 Q5k7LoD3NeUilo0FELdlq6ioHkWWdkknSZ8BUJIRPj3nEyyQ0zsKH43WZJ5irKOtjesC
 fVrQnhjL8v3qjnD3Q695nWat1nwpJSoiU4YvxOocl23Ansmy78lUMQe9jUoSXRUDn767
 hZcKH3PXEZHnL/6M1TX/kX9b7xcdpGCZT+M8b537D/t6qBYbvhh+wnEC2U4rlAGyhxDO Dg== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
        by aserp2120.oracle.com with ESMTP id 31uusu5dkf-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 26 Jun 2020 10:42:08 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
        by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 05QAdW8n157394;
        Fri, 26 Jun 2020 10:40:07 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
        by userp3030.oracle.com with ESMTP id 31uurtytr7-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 26 Jun 2020 10:40:07 +0000
Received: from abhmp0007.oracle.com (abhmp0007.oracle.com [141.146.116.13])
        by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 05QAe6rk029613;
        Fri, 26 Jun 2020 10:40:06 GMT
Received: from mwanda (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Fri, 26 Jun 2020 10:40:05 +0000
Date:   Fri, 26 Jun 2020 13:39:59 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     VMware Graphics <linux-graphics-maintainer@vmware.com>,
        Thomas Hellstrom <thellstrom@vmware.com>
Cc:     Roland Scheidegger <sroland@vmware.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Sinclair Yeh <syeh@vmware.com>,
        dri-devel@lists.freedesktop.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] drm/vmwgfx: Fix two list_for_each loop exit tests
Message-ID: <20200626103959.GC314359@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9663 signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 phishscore=0 mlxscore=0
 spamscore=0 mlxlogscore=999 bulkscore=0 suspectscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2006260077
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9663 signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 bulkscore=0
 cotscore=-2147483648 malwarescore=0 mlxscore=0 clxscore=1011
 lowpriorityscore=0 mlxlogscore=999 phishscore=0 priorityscore=1501
 spamscore=0 impostorscore=0 adultscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2006260078
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

These if statements are supposed to be true if we ended the
list_for_each_entry() loops without hitting a break statement but they
don't work.

In the first loop, we increment "i" after the "if (i == unit)" condition
so we don't necessarily know that "i" is not equal to unit at the end of
the loop.

In the second loop we exit when mode is not pointing to a valid
drm_display_mode struct so it doesn't make sense to check "mode->type".

Fixes: a278724aa23c ("drm/vmwgfx: Implement fbdev on kms v2")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
I reversed the second condition as well, just because I was copy and
pasting the exit condition.  Plus I always feel like error handling is
better than success handling.  If anyone feel strongly, then I can send
a v2.

 drivers/gpu/drm/vmwgfx/vmwgfx_kms.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
index 3c97654b5a43..44168a7d7b44 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
@@ -2576,7 +2576,7 @@ int vmw_kms_fbdev_init_data(struct vmw_private *dev_priv,
 		++i;
 	}
 
-	if (i != unit) {
+	if (&con->head == &dev_priv->dev->mode_config.connector_list) {
 		DRM_ERROR("Could not find initial display unit.\n");
 		ret = -EINVAL;
 		goto out_unlock;
@@ -2600,13 +2600,13 @@ int vmw_kms_fbdev_init_data(struct vmw_private *dev_priv,
 			break;
 	}
 
-	if (mode->type & DRM_MODE_TYPE_PREFERRED)
-		*p_mode = mode;
-	else {
+	if (&mode->head == &con->modes) {
 		WARN_ONCE(true, "Could not find initial preferred mode.\n");
 		*p_mode = list_first_entry(&con->modes,
 					   struct drm_display_mode,
 					   head);
+	} else {
+		*p_mode = mode;
 	}
 
  out_unlock:
-- 
2.27.0

