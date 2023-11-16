Return-Path: <kernel-janitors+bounces-301-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 453607EDAA7
	for <lists+kernel-janitors@lfdr.de>; Thu, 16 Nov 2023 05:19:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EE6631F23547
	for <lists+kernel-janitors@lfdr.de>; Thu, 16 Nov 2023 04:19:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9502C2DF;
	Thu, 16 Nov 2023 04:19:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: kernel-janitors@vger.kernel.org
Received: from mail.nfschina.com (unknown [42.101.60.195])
	by lindbergh.monkeyblade.net (Postfix) with SMTP id 0F791196;
	Wed, 15 Nov 2023 20:19:10 -0800 (PST)
Received: from localhost.localdomain (unknown [180.167.10.98])
	by mail.nfschina.com (Maildata Gateway V2.8.8) with ESMTPA id 1FDC2605DAF55;
	Thu, 16 Nov 2023 12:19:02 +0800 (CST)
X-MD-Sfrom: suhui@nfschina.com
X-MD-SrcIP: 180.167.10.98
From: Su Hui <suhui@nfschina.com>
To: sre@kernel.org,
	nathan@kernel.org,
	ndesaulniers@google.com,
	trix@redhat.com
Cc: Su Hui <suhui@nfschina.com>,
	r-rivera-matos@ti.com,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	kernel-janitors@vger.kernel.org
Subject: [PATCH] power: supply: bq256xx: fix some problem in bq256xx_hw_init
Date: Thu, 16 Nov 2023 12:18:23 +0800
Message-Id: <20231116041822.1378758-1-suhui@nfschina.com>
X-Mailer: git-send-email 2.30.2
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

smatch complains that there is a buffer overflow and clang complains
'ret' is never read.

Smatch error:
drivers/power/supply/bq256xx_charger.c:1578 bq256xx_hw_init() error:
buffer overflow 'bq256xx_watchdog_time' 4 <= 4

Clang static checker:
Value stored to 'ret' is never read.

Add check for buffer overflow and error code from regmap_update_bits().

Fixes: 32e4978bb920 ("power: supply: bq256xx: Introduce the BQ256XX charger driver")
Signed-off-by: Su Hui <suhui@nfschina.com>
---
 drivers/power/supply/bq256xx_charger.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/power/supply/bq256xx_charger.c b/drivers/power/supply/bq256xx_charger.c
index 789a31bd70c3..1a935bc88510 100644
--- a/drivers/power/supply/bq256xx_charger.c
+++ b/drivers/power/supply/bq256xx_charger.c
@@ -1574,13 +1574,16 @@ static int bq256xx_hw_init(struct bq256xx_device *bq)
 			wd_reg_val = i;
 			break;
 		}
-		if (bq->watchdog_timer > bq256xx_watchdog_time[i] &&
+		if (i + 1 < BQ256XX_NUM_WD_VAL &&
+		    bq->watchdog_timer > bq256xx_watchdog_time[i] &&
 		    bq->watchdog_timer < bq256xx_watchdog_time[i + 1])
 			wd_reg_val = i;
 	}
 	ret = regmap_update_bits(bq->regmap, BQ256XX_CHARGER_CONTROL_1,
 				 BQ256XX_WATCHDOG_MASK, wd_reg_val <<
 						BQ256XX_WDT_BIT_SHIFT);
+	if (ret)
+		return ret;
 
 	ret = power_supply_get_battery_info(bq->charger, &bat_info);
 	if (ret == -ENOMEM)
-- 
2.30.2


