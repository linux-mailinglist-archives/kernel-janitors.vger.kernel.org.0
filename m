Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5DF2D17091D
	for <lists+kernel-janitors@lfdr.de>; Wed, 26 Feb 2020 20:57:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727341AbgBZT5q (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Wed, 26 Feb 2020 14:57:46 -0500
Received: from youngberry.canonical.com ([91.189.89.112]:59007 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727244AbgBZT5q (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 26 Feb 2020 14:57:46 -0500
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
        by youngberry.canonical.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <colin.king@canonical.com>)
        id 1j72oN-0000Ge-8y; Wed, 26 Feb 2020 19:57:39 +0000
From:   Colin King <colin.king@canonical.com>
To:     Lee Jones <lee.jones@linaro.org>,
        Daniel Thompson <daniel.thompson@linaro.org>,
        Jingoo Han <jingoohan1@gmail.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Gyungoh Yoo <jack.yoo@skyworksinc.com>,
        Bryan Wu <cooloney@gmail.com>, dri-devel@lists.freedesktop.org,
        linux-fbdev@vger.kernel.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] backlight: sky81452: unsure while loop does not allow negative array indexing
Date:   Wed, 26 Feb 2020 19:57:39 +0000
Message-Id: <20200226195739.6462-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

In the unlikely event that num_entry is zero, the while loop
pre-decrements num_entry to cause negative array indexing into the
array sources. Fix this by iterating only if num_entry >= 0.

Addresses-Coverity: ("Out-of-bounds read")
Fixes: f705806c9f35 ("backlight: Add support Skyworks SKY81452 backlight driver")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/video/backlight/sky81452-backlight.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/video/backlight/sky81452-backlight.c b/drivers/video/backlight/sky81452-backlight.c
index 2355f00f5773..f456930ce78e 100644
--- a/drivers/video/backlight/sky81452-backlight.c
+++ b/drivers/video/backlight/sky81452-backlight.c
@@ -200,7 +200,7 @@ static struct sky81452_bl_platform_data *sky81452_bl_parse_dt(
 		}
 
 		pdata->enable = 0;
-		while (--num_entry)
+		while (--num_entry >= 0)
 			pdata->enable |= (1 << sources[num_entry]);
 	}
 
-- 
2.25.0

