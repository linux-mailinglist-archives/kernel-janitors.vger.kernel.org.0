Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F04DB2B5A40
	for <lists+kernel-janitors@lfdr.de>; Tue, 17 Nov 2020 08:23:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726560AbgKQHX1 (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Tue, 17 Nov 2020 02:23:27 -0500
Received: from aserp2120.oracle.com ([141.146.126.78]:60924 "EHLO
        aserp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725770AbgKQHX0 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 17 Nov 2020 02:23:26 -0500
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
        by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0AH7MVKg104227;
        Tue, 17 Nov 2020 07:23:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=hVocWAkSkkJiKiXJ9eCZxuiBxwNYcQOEz5St/9x2ilo=;
 b=kjnhVBYF+jOEV68EU+afIWGIufPGBGqtB4k/NhJOl9SftKdaz/YBPCh1wEFi5SpIs55N
 YPL6oo9d6dMPGIWXrcIPIaRQthJmq3Nw/wsV0gYJgUXgi5e0tCccBJesENNtefE5CpSX
 10sJQKc/muKgKxmUlpYOtJMR6tRyYME1orSzRdI3TCWDMVRCAe0BZV9nCrP2gLJ5+6Yt
 IIKA60tpOywg/N/4+8jT6+nB7/rfvghQA/gz5dlF4McosZEK65lKy1paoNAvxYw99Bel
 5DAY2MSNC8A91fGW8hVNOXCaMDuVnFYeAO7zk5mxMDZjD0GvFJmyuYdLhIml7fD5b+SM ow== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
        by aserp2120.oracle.com with ESMTP id 34t76kryh3-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 17 Nov 2020 07:23:16 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
        by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0AH7FZMp093506;
        Tue, 17 Nov 2020 07:21:16 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
        by aserp3030.oracle.com with ESMTP id 34uspt0egt-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 17 Nov 2020 07:21:16 +0000
Received: from abhmp0019.oracle.com (abhmp0019.oracle.com [141.146.116.25])
        by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 0AH7LAYY012455;
        Tue, 17 Nov 2020 07:21:10 GMT
Received: from mwanda (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Mon, 16 Nov 2020 23:21:09 -0800
Date:   Tue, 17 Nov 2020 10:21:03 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Anitha Chrisanthus <anitha.chrisanthus@intel.com>
Cc:     Edmund Dea <edmund.j.dea@intel.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Sam Ravnborg <sam@ravnborg.org>,
        dri-devel@lists.freedesktop.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] drm/kmb: Fix possible oops in probe error handling
Message-ID: <20201117072103.GA1111239@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9807 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 malwarescore=0
 mlxscore=0 bulkscore=0 suspectscore=0 adultscore=0 spamscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2011170051
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9807 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 phishscore=0
 adultscore=0 priorityscore=1501 bulkscore=0 clxscore=1015 mlxlogscore=999
 malwarescore=0 mlxscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2011170052
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

If kmb_dsi_init() fails the error handling will dereference an error
pointer which will cause an Oops.

Fixes: 7f7b96a8a0a1 ("drm/kmb: Add support for KeemBay Display")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/gpu/drm/kmb/kmb_drv.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/kmb/kmb_drv.c b/drivers/gpu/drm/kmb/kmb_drv.c
index a31a840ce634..8c43b136765c 100644
--- a/drivers/gpu/drm/kmb/kmb_drv.c
+++ b/drivers/gpu/drm/kmb/kmb_drv.c
@@ -504,7 +504,7 @@ static int kmb_probe(struct platform_device *pdev)
 	if (IS_ERR(kmb->kmb_dsi)) {
 		drm_err(&kmb->drm, "failed to initialize DSI\n");
 		ret = PTR_ERR(kmb->kmb_dsi);
-		goto err_free1;
+		goto err_clear_drvdata;
 	}
 
 	kmb->kmb_dsi->dev = &dsi_pdev->dev;
@@ -540,8 +540,9 @@ static int kmb_probe(struct platform_device *pdev)
 	drm_crtc_cleanup(&kmb->crtc);
 	drm_mode_config_cleanup(&kmb->drm);
  err_free1:
-	dev_set_drvdata(dev, NULL);
 	kmb_dsi_host_unregister(kmb->kmb_dsi);
+ err_clear_drvdata:
+	dev_set_drvdata(dev, NULL);
 
 	return ret;
 }
-- 
2.28.0

