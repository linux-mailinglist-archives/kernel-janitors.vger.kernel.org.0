Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5AF9D4BBE82
	for <lists+kernel-janitors@lfdr.de>; Fri, 18 Feb 2022 18:37:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234511AbiBRRh6 (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Fri, 18 Feb 2022 12:37:58 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:37374 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238621AbiBRRh6 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 18 Feb 2022 12:37:58 -0500
Received: from smtp.smtpout.orange.fr (smtp01.smtpout.orange.fr [80.12.242.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D83427B27
        for <kernel-janitors@vger.kernel.org>; Fri, 18 Feb 2022 09:37:41 -0800 (PST)
Received: from pop-os.home ([90.126.236.122])
        by smtp.orange.fr with ESMTPA
        id L7CNnW9vTFTgbL7CNniBOp; Fri, 18 Feb 2022 18:37:40 +0100
X-ME-Helo: pop-os.home
X-ME-Auth: YWZlNiIxYWMyZDliZWIzOTcwYTEyYzlhMmU3ZiQ1M2U2MzfzZDfyZTMxZTBkMTYyNDBjNDJlZmQ3ZQ==
X-ME-Date: Fri, 18 Feb 2022 18:37:40 +0100
X-ME-IP: 90.126.236.122
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     Hans de Goede <hdegoede@redhat.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>,
        Purism Kernel Team <kernel@puri.sm>,
        Sebastian Reichel <sre@kernel.org>
Cc:     linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        linux-pm@vger.kernel.org
Subject: [PATCH V2] power: supply: max17042_battery: Use devm_work_autocancel()
Date:   Fri, 18 Feb 2022 18:37:37 +0100
Message-Id: <670ea51361f96035f49852c617325af10ffa07ea.1645205558.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Use devm_work_autocancel() instead of hand-writing it.
This saves a few lines of code.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
V2: s/devm_delayed_work_autocancel/devm_work_autocancel/

 drivers/power/supply/max17042_battery.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/drivers/power/supply/max17042_battery.c b/drivers/power/supply/max17042_battery.c
index 87128cf0d577..ab031bbfbe78 100644
--- a/drivers/power/supply/max17042_battery.c
+++ b/drivers/power/supply/max17042_battery.c
@@ -9,6 +9,7 @@
 // This driver is based on max17040_battery.c
 
 #include <linux/acpi.h>
+#include <linux/devm-helpers.h>
 #include <linux/init.h>
 #include <linux/module.h>
 #include <linux/slab.h>
@@ -1030,13 +1031,6 @@ static const struct power_supply_desc max17042_no_current_sense_psy_desc = {
 	.num_properties	= ARRAY_SIZE(max17042_battery_props) - 2,
 };
 
-static void max17042_stop_work(void *data)
-{
-	struct max17042_chip *chip = data;
-
-	cancel_work_sync(&chip->work);
-}
-
 static int max17042_probe(struct i2c_client *client,
 			const struct i2c_device_id *id)
 {
@@ -1142,8 +1136,8 @@ static int max17042_probe(struct i2c_client *client,
 
 	regmap_read(chip->regmap, MAX17042_STATUS, &val);
 	if (val & STATUS_POR_BIT) {
-		INIT_WORK(&chip->work, max17042_init_worker);
-		ret = devm_add_action(&client->dev, max17042_stop_work, chip);
+		ret = devm_work_autocancel(&client->dev, &chip->work,
+					   max17042_init_worker);
 		if (ret)
 			return ret;
 		schedule_work(&chip->work);
-- 
2.32.0

