Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BDA1C2DBFA
	for <lists+kernel-janitors@lfdr.de>; Wed, 29 May 2019 13:35:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726843AbfE2LfP (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Wed, 29 May 2019 07:35:15 -0400
Received: from aserp2130.oracle.com ([141.146.126.79]:58036 "EHLO
        aserp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726101AbfE2LfP (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 29 May 2019 07:35:15 -0400
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
        by aserp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x4TBT3Su069315;
        Wed, 29 May 2019 11:35:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2018-07-02;
 bh=+b6PzCmzHOqCAsONZWcgBpVTvrx2iz0jbNueJJ48hsc=;
 b=ngoqhXYOn+ufxF85iD8LeCi6ji04piM98Lvi/UcN/Av9Oia6uLxEptBuHJ3XGNGzJFfo
 5RriIyCarntnSmkgthf+7cnUD9bwkZu6Q3ThaOqcdeS2cwhNBPQukicx920yrGhbqdZv
 /4CQtNmmk6nSsXS/fQgqTG7M/+XAxGoCV3VlnwhJGmR0eG15INKRF5Z7Kaa0K13oYdAS
 Kd2GmuDxIOchPmyQEu1z8kzjwEKHabRkdgm7+vsN3vK7byASgWdtjoVCp4fNv+oW8PbS
 gxkF30zBZs1YYPI/3jWAtItiKr8+cS186kUUT2ZgmH+nEEnGdGCcwEgRkRc3/NmsLr1/ 8Q== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
        by aserp2130.oracle.com with ESMTP id 2spu7dh8w4-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 29 May 2019 11:35:08 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
        by aserp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x4TBYDZb058353;
        Wed, 29 May 2019 11:35:08 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
        by aserp3030.oracle.com with ESMTP id 2srbdxb84a-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 29 May 2019 11:35:08 +0000
Received: from abhmp0011.oracle.com (abhmp0011.oracle.com [141.146.116.17])
        by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x4TBZ688029299;
        Wed, 29 May 2019 11:35:06 GMT
Received: from mwanda (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Wed, 29 May 2019 04:35:05 -0700
Date:   Wed, 29 May 2019 14:34:58 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        dri-devel@lists.freedesktop.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] drm/mcde: Fix an uninitialized variable
Message-ID: <20190529113458.GG19119@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9271 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1810050000 definitions=main-1905290078
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9271 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1905290078
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

We never set "vblank" to "false".

Current versions of GCC will initialize it to zero automatically at
certain optimization levels so that's probably why this didn't show up
in testing.

Fixes: 5fc537bfd000 ("drm/mcde: Add new driver for ST-Ericsson MCDE")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/gpu/drm/mcde/mcde_display.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mcde/mcde_display.c b/drivers/gpu/drm/mcde/mcde_display.c
index f3ef108a41d9..751454ae3cd1 100644
--- a/drivers/gpu/drm/mcde/mcde_display.c
+++ b/drivers/gpu/drm/mcde/mcde_display.c
@@ -65,7 +65,7 @@ enum mcde_dsi_formatter {
 void mcde_display_irq(struct mcde *mcde)
 {
 	u32 mispp, misovl, mischnl;
-	bool vblank;
+	bool vblank = false;
 
 	/* Handle display IRQs */
 	mispp = readl(mcde->regs + MCDE_MISPP);
-- 
2.20.1

