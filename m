Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AB8F465A32F
	for <lists+kernel-janitors@lfdr.de>; Sat, 31 Dec 2022 09:10:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229523AbiLaIK2 (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Sat, 31 Dec 2022 03:10:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46608 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229560AbiLaIK0 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sat, 31 Dec 2022 03:10:26 -0500
Received: from smtp.smtpout.orange.fr (smtp-16.smtpout.orange.fr [80.12.242.16])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A67E7E03D
        for <kernel-janitors@vger.kernel.org>; Sat, 31 Dec 2022 00:10:23 -0800 (PST)
Received: from pop-os.home ([86.243.100.34])
        by smtp.orange.fr with ESMTPA
        id BWwcp2uHMTOlqBWwcpenvO; Sat, 31 Dec 2022 09:10:21 +0100
X-ME-Helo: pop-os.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sat, 31 Dec 2022 09:10:21 +0100
X-ME-IP: 86.243.100.34
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Broadcom internal kernel review list 
        <bcm-kernel-feedback-list@broadcom.com>
Cc:     linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        linux-watchdog@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH] watchdog: bcm7038: Use devm_clk_get_enabled() helper
Date:   Sat, 31 Dec 2022 09:10:17 +0100
Message-Id: <9c055911e9f557b7239000c8e6cfa0cc393a19e9.1672474203.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

The devm_clk_get_enabled() helper:
   - calls devm_clk_get()
   - calls clk_prepare_enable() and registers what is needed in order to
     call clk_disable_unprepare() when needed, as a managed resource.

This simplifies the code and avoids the need of a dedicated function used
with devm_add_action_or_reset().

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/watchdog/bcm7038_wdt.c | 15 +--------------
 1 file changed, 1 insertion(+), 14 deletions(-)

diff --git a/drivers/watchdog/bcm7038_wdt.c b/drivers/watchdog/bcm7038_wdt.c
index 9388838899ac..e038dd66b819 100644
--- a/drivers/watchdog/bcm7038_wdt.c
+++ b/drivers/watchdog/bcm7038_wdt.c
@@ -127,11 +127,6 @@ static const struct watchdog_ops bcm7038_wdt_ops = {
 	.get_timeleft	= bcm7038_wdt_get_timeleft,
 };
 
-static void bcm7038_clk_disable_unprepare(void *data)
-{
-	clk_disable_unprepare(data);
-}
-
 static int bcm7038_wdt_probe(struct platform_device *pdev)
 {
 	struct bcm7038_wdt_platform_data *pdata = pdev->dev.platform_data;
@@ -153,17 +148,9 @@ static int bcm7038_wdt_probe(struct platform_device *pdev)
 	if (pdata && pdata->clk_name)
 		clk_name = pdata->clk_name;
 
-	wdt->clk = devm_clk_get(dev, clk_name);
+	wdt->clk = devm_clk_get_enabled(dev, clk_name);
 	/* If unable to get clock, use default frequency */
 	if (!IS_ERR(wdt->clk)) {
-		err = clk_prepare_enable(wdt->clk);
-		if (err)
-			return err;
-		err = devm_add_action_or_reset(dev,
-					       bcm7038_clk_disable_unprepare,
-					       wdt->clk);
-		if (err)
-			return err;
 		wdt->rate = clk_get_rate(wdt->clk);
 		/* Prevent divide-by-zero exception */
 		if (!wdt->rate)
-- 
2.34.1

