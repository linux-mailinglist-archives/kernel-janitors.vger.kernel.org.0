Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EE3C2AFACB
	for <lists+kernel-janitors@lfdr.de>; Wed, 11 Sep 2019 12:50:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727079AbfIKKuE (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Wed, 11 Sep 2019 06:50:04 -0400
Received: from userp2120.oracle.com ([156.151.31.85]:43084 "EHLO
        userp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726762AbfIKKuE (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 11 Sep 2019 06:50:04 -0400
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
        by userp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x8BAmvG1176343;
        Wed, 11 Sep 2019 10:49:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2019-08-05;
 bh=O142t2Aqio/yATZmFf7buzHUM+fnfQ15Mwv2B5Kdx9I=;
 b=gnu1EySbhFaYMPRJGQRIq0RMkZFgSS0UG1E63/l+C/yfZ5kjAGLVYXX21U4zR5kR1BOl
 9IAztmXBHkd6TxTb+5XFGd9TzlozLndZctSp+uf5FRIx2xkE2sUxQCe/Xu/RhR849e9a
 x2HenBm3njMxDPgkbmYXZY/+JWBLhmBVdiuGjFRglmzNkMhN3CgdJDUmsfitVvNDHWUj
 SYM5d5OPmvOz0GIX8972hjy3jRoSO0MUjJGV0U+jTD+00yFX9RxXwTsWw/0pNQpl1Zyx
 0YrDPltY7tnME9DHLkAZVF4WhRtg8dgoPw2OYcCX5ZhtbPEkmdLDPnCeutWe+SswHcJk nw== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
        by userp2120.oracle.com with ESMTP id 2uw1jkh22g-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 11 Sep 2019 10:49:43 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
        by aserp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x8BAmgDu099560;
        Wed, 11 Sep 2019 10:49:42 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
        by aserp3030.oracle.com with ESMTP id 2uxj88nasg-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 11 Sep 2019 10:49:42 +0000
Received: from abhmp0006.oracle.com (abhmp0006.oracle.com [141.146.116.12])
        by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id x8BAnbYk021939;
        Wed, 11 Sep 2019 10:49:37 GMT
Received: from mwanda (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Wed, 11 Sep 2019 03:49:36 -0700
Date:   Wed, 11 Sep 2019 13:49:28 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc:     Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        dri-devel@lists.freedesktop.org, kernel-janitors@vger.kernel.org
Subject: [PATCH v3] drm: panel-lvds: Potential Oops in probe error handling
Message-ID: <20190911104928.GA15930@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9376 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1906280000 definitions=main-1909110099
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9376 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1906280000
 definitions=main-1909110099
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

The "lvds->backlight" pointer could be NULL in situations where
of_parse_phandle() returns NULL.  This code is cleaner if we use the
managed devm_of_find_backlight() so the clean up is automatic.

Fixes: 7c9dff5bd643 ("drm: panels: Add LVDS panel driver")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
v3: Use devm_of_find_backlight().  This version is quite a bit more
    ambitious, and I haven't tested it so please review carefully.
v2: Use backlight_put()

 drivers/gpu/drm/panel/panel-lvds.c | 21 ++++-----------------
 1 file changed, 4 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-lvds.c b/drivers/gpu/drm/panel/panel-lvds.c
index ad47cc95459e..bf5fcc3e5379 100644
--- a/drivers/gpu/drm/panel/panel-lvds.c
+++ b/drivers/gpu/drm/panel/panel-lvds.c
@@ -197,7 +197,6 @@ static int panel_lvds_parse_dt(struct panel_lvds *lvds)
 static int panel_lvds_probe(struct platform_device *pdev)
 {
 	struct panel_lvds *lvds;
-	struct device_node *np;
 	int ret;
 
 	lvds = devm_kzalloc(&pdev->dev, sizeof(*lvds), GFP_KERNEL);
@@ -243,14 +242,9 @@ static int panel_lvds_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	np = of_parse_phandle(lvds->dev->of_node, "backlight", 0);
-	if (np) {
-		lvds->backlight = of_find_backlight_by_node(np);
-		of_node_put(np);
-
-		if (!lvds->backlight)
-			return -EPROBE_DEFER;
-	}
+	lvds->backlight = devm_of_find_backlight(lvds->dev);
+	if (IS_ERR(lvds->backlight))
+		return PTR_ERR(lvds->backlight);
 
 	/*
 	 * TODO: Handle all power supplies specified in the DT node in a generic
@@ -266,14 +260,10 @@ static int panel_lvds_probe(struct platform_device *pdev)
 
 	ret = drm_panel_add(&lvds->panel);
 	if (ret < 0)
-		goto error;
+		return ret;
 
 	dev_set_drvdata(lvds->dev, lvds);
 	return 0;
-
-error:
-	put_device(&lvds->backlight->dev);
-	return ret;
 }
 
 static int panel_lvds_remove(struct platform_device *pdev)
@@ -284,9 +274,6 @@ static int panel_lvds_remove(struct platform_device *pdev)
 
 	panel_lvds_disable(&lvds->panel);
 
-	if (lvds->backlight)
-		put_device(&lvds->backlight->dev);
-
 	return 0;
 }
 
-- 
2.20.1

