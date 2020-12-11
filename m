Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 60C0F2D7369
	for <lists+kernel-janitors@lfdr.de>; Fri, 11 Dec 2020 11:08:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405769AbgLKKH1 (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Fri, 11 Dec 2020 05:07:27 -0500
Received: from userp2130.oracle.com ([156.151.31.86]:36186 "EHLO
        userp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388316AbgLKKG5 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 11 Dec 2020 05:06:57 -0500
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
        by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0BBA03lF145224;
        Fri, 11 Dec 2020 10:06:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=W1eNTHQxgdyXsKgTBImbofhNLh70lNcnXYCvQhl4jvI=;
 b=Kzlz/MVOfKGJQ/ms+XdQrcjgISw4gcjJVE8J6wP0SZcMeao/bFfI+9j4JZxfFvUO5TJB
 OS5oun9KEaOGGULDDLOj/HnlWT08NDBHdUOMzijg5Gp6GtkfQ1kpmSWEN56r8CO6tHgY
 bpW+J+TWRi3zWdz02Tr3SjJA/sNOvkYGF1t54Cj3KZGr5TI1V6s9pl68ukbT3OOy7mAh
 PGo97OR2uVoxeRejczqy3NKgC8Hz5BVuJXohFfOqbH9Sh6Q2UEcGKm9qSQivPTpe2vkb
 LzdX9H+iP9gzIhf/VfDwblmaJWo5G6l3YywhJ1uuHNXhJ36E5gKN1wrBHu+uJ2sEJuGm Iw== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
        by userp2130.oracle.com with ESMTP id 3581mr9up9-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 11 Dec 2020 10:06:03 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
        by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0BBA0fMV022932;
        Fri, 11 Dec 2020 10:06:02 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
        by aserp3020.oracle.com with ESMTP id 358m437x07-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 11 Dec 2020 10:06:02 +0000
Received: from abhmp0007.oracle.com (abhmp0007.oracle.com [141.146.116.13])
        by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 0BBA5vaA009524;
        Fri, 11 Dec 2020 10:05:58 GMT
Received: from mwanda (/102.36.221.92)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Fri, 11 Dec 2020 02:05:57 -0800
Date:   Fri, 11 Dec 2020 13:05:50 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Neil Armstrong <narmstrong@baylibre.com>
Cc:     Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        dri-devel@lists.freedesktop.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] drm/panel: khadas: Fix error code in khadas_ts050_panel_add()
Message-ID: <X9NEfmgGilaXJs2R@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9831 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 malwarescore=0 adultscore=0
 bulkscore=0 phishscore=0 suspectscore=0 mlxscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2012110061
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9831 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 mlxlogscore=999
 clxscore=1011 malwarescore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 phishscore=0 spamscore=0 impostorscore=0 mlxscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012110061
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

There is a copy and paste bug so it didn't return the correct error
code.

Fixes: b215212117f7 ("drm: panel: add Khadas TS050 panel driver")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/gpu/drm/panel/panel-khadas-ts050.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panel/panel-khadas-ts050.c b/drivers/gpu/drm/panel/panel-khadas-ts050.c
index 87aa2cc8ec2a..8f6ac1a40c31 100644
--- a/drivers/gpu/drm/panel/panel-khadas-ts050.c
+++ b/drivers/gpu/drm/panel/panel-khadas-ts050.c
@@ -786,7 +786,7 @@ static int khadas_ts050_panel_add(struct khadas_ts050_panel *khadas_ts050)
 	khadas_ts050->enable_gpio = devm_gpiod_get(dev, "enable",
 						   GPIOD_OUT_HIGH);
 	if (IS_ERR(khadas_ts050->enable_gpio))
-		return dev_err_probe(dev, PTR_ERR(khadas_ts050->reset_gpio),
+		return dev_err_probe(dev, PTR_ERR(khadas_ts050->enable_gpio),
 				     "failed to get enable gpio");
 
 	drm_panel_init(&khadas_ts050->base, &khadas_ts050->link->dev,
-- 
2.29.2

