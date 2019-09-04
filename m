Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 80F4EA7FFB
	for <lists+kernel-janitors@lfdr.de>; Wed,  4 Sep 2019 12:06:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729020AbfIDKGK (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Wed, 4 Sep 2019 06:06:10 -0400
Received: from aserp2120.oracle.com ([141.146.126.78]:55986 "EHLO
        aserp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727722AbfIDKGJ (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 4 Sep 2019 06:06:09 -0400
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
        by aserp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x84A4CCN123300;
        Wed, 4 Sep 2019 10:05:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2019-08-05;
 bh=1pbyPUZ5EEtRV82fn90ZdgEccg0SrdakAzKxHScHT/U=;
 b=b0aetbA7LwUIAYLLZ7f7Uk/p74nbKkUflQXc0F6FIvbrJyIrbReJWw/j+6yGC8ne3noE
 fIIRbfho/5iqK2JVbrbnC2vjyYzdW5ImzJLChQ0me3Ux5V32y4NkNyqLReh0yFgpVzfm
 1gNyO7KHi6DIRqVATi+WfmbHcj8aZG4tOL8tWxhHi33Nl3mNeyZkvkkwwWfyBuH4NIyz
 OjNSt4XrN78fiW/do+lFruewMenInkVSgnUYishq3qvRKqfvB97S+WuOrZ31w0iG9u1o
 Zp+tFFPN8xyIrXV1DgDzIuuzqOoysAOjA7j/+DwbJRHZk3j3po9PxZeoEEDDSw6Kem7X 5w== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
        by aserp2120.oracle.com with ESMTP id 2utb5yr0ng-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 04 Sep 2019 10:05:49 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
        by aserp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x84A3UTr124734;
        Wed, 4 Sep 2019 10:03:42 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
        by aserp3020.oracle.com with ESMTP id 2us5phxehv-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 04 Sep 2019 10:03:42 +0000
Received: from abhmp0007.oracle.com (abhmp0007.oracle.com [141.146.116.13])
        by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x84A3b00028553;
        Wed, 4 Sep 2019 10:03:37 GMT
Received: from mwanda (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Wed, 04 Sep 2019 03:03:36 -0700
Date:   Wed, 4 Sep 2019 13:03:29 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc:     Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        dri-devel@lists.freedesktop.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] drm: panel-lvds: Potential Oops in probe error handling
Message-ID: <20190904100329.GE7007@mwanda>
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

The "lvds->backlight" pointer could be NULl if of_parse_phandle()
returns NULL.

Fixes: 7c9dff5bd643 ("drm: panels: Add LVDS panel driver")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/gpu/drm/panel/panel-lvds.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panel/panel-lvds.c b/drivers/gpu/drm/panel/panel-lvds.c
index ad47cc95459e..3b4eb959e994 100644
--- a/drivers/gpu/drm/panel/panel-lvds.c
+++ b/drivers/gpu/drm/panel/panel-lvds.c
@@ -272,7 +272,8 @@ static int panel_lvds_probe(struct platform_device *pdev)
 	return 0;
 
 error:
-	put_device(&lvds->backlight->dev);
+	if (lvds->backlight)
+		put_device(&lvds->backlight->dev);
 	return ret;
 }
 
-- 
2.20.1

