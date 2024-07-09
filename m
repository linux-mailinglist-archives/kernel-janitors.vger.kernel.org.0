Return-Path: <kernel-janitors+bounces-4555-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E09E192C4BD
	for <lists+kernel-janitors@lfdr.de>; Tue,  9 Jul 2024 22:40:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 856C3B21E33
	for <lists+kernel-janitors@lfdr.de>; Tue,  9 Jul 2024 20:40:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF2D718561C;
	Tue,  9 Jul 2024 20:39:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="rOiW0UEG"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from msa.smtpout.orange.fr (out-66.smtpout.orange.fr [193.252.22.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3AC717B05E
	for <kernel-janitors@vger.kernel.org>; Tue,  9 Jul 2024 20:39:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.252.22.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720557550; cv=none; b=lILyS2EdAl16JlO4i4Fm5/v9wN6RCiaqqGzu5S+UAyBeI8OiF3wf/x4xcCtYx/+lU56GWBLLuLd+X48CkfAEz+HA8yT5mJaEzZktkaP7cw3ufrroUey6JeE6v0Mcpy81+sLQeYU/WbTN8x+9IOrJME/FUxYLDjeYS9T5TdsKvto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720557550; c=relaxed/simple;
	bh=i1N+Z/2ISYoU2xkqMv8KVqdJajIRRXpo+2JbHMcYGJA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KZ5hAOYpWucYLJ6sfT+rnOnfB1HoHjJjN6+ihk8dA7pW+np0J64JQWBBy+JJVrUgIevxMYZEAaJkc+sBmxla491px+hT0+zQFkit5gcsqsZiYV2AZPSkLLKWm1neLyYO+Qb19aWaABzysM2PhzNU3bm2vGvxNGfy8FPPy4ucBUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=rOiW0UEG; arc=none smtp.client-ip=193.252.22.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Received: from fedora.. ([77.130.249.53])
	by smtp.orange.fr with ESMTPA
	id RHavsh9C6phyvRHaysZbWF; Tue, 09 Jul 2024 22:37:52 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1720557472;
	bh=dMg7mTXfpctFZkkNyoWDAtldXD4ACEocdjQPCli4wGs=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=rOiW0UEGBfbia/zNC+vi7VqxdJ0RlXu5LhpKjSDa2lYBWLrqlvYasIQeieiUlw5EE
	 vAEB/swjiNqLWgppLzT6a861T5FfbgeX7Jb/ho/sqk2o5Z+NIQ5Z3p9zgBfvdIuuta
	 oKDaKHN10p1eVHboI8+Q4fUGwAj+DSoFS3u+WOi3f+XJF3aHH8+9U8Wz6pO67lHz1H
	 4MDRkBmZh3pDSeLF0AA+PAEN7ZUIlGbArEOU7tffqcCjVI1c7TgkRBCaSd+Qe6ac99
	 wqiTShfm8wjxqoyzs7nvH2UoEw6EvDpsG6mrGsGbrx7roJ4cOPifntRsSfd7gI8toA
	 m0ej8Y30Ojv5g==
X-ME-Helo: fedora..
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Tue, 09 Jul 2024 22:37:52 +0200
X-ME-IP: 77.130.249.53
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: linus.walleij@linaro.org,
	lokeshvutla@ti.com,
	nm@ti.com,
	robh@kernel.org,
	tony@atomide.com
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH 1/3] pinctrl: ti: ti-iodelay: Fix some error handling paths
Date: Tue,  9 Jul 2024 22:37:43 +0200
Message-ID: <0220fa5b925bd08e361be8206a5438f6229deaac.1720556038.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <cover.1720556038.git.christophe.jaillet@wanadoo.fr>
References: <cover.1720556038.git.christophe.jaillet@wanadoo.fr>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In the probe, if an error occurs after the ti_iodelay_pinconf_init_dev()
call, it is likely that ti_iodelay_pinconf_deinit_dev() should be called,
as already done in the remove function.

Also in ti_iodelay_pinconf_init_dev(), if an error occurs after the first
regmap_update_bits() call, it is also likely that the deinit() function
should be called.

The easier way to fix it is to add a devm_add_action_or_reset() at the
rigtht place to have ti_iodelay_pinconf_deinit_dev() called when needed.

Doing so, the .remove() function can be removed, and the associated
platform_set_drvdata() call in the probe as well.

Fixes: 003910ebc83b ("pinctrl: Introduce TI IOdelay configuration driver")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
Compile tested-only.

This patch is speculative, review with care!
---
 drivers/pinctrl/ti/pinctrl-ti-iodelay.c | 52 ++++++++++---------------
 1 file changed, 21 insertions(+), 31 deletions(-)

diff --git a/drivers/pinctrl/ti/pinctrl-ti-iodelay.c b/drivers/pinctrl/ti/pinctrl-ti-iodelay.c
index f5e5a23d2226..451801acdc40 100644
--- a/drivers/pinctrl/ti/pinctrl-ti-iodelay.c
+++ b/drivers/pinctrl/ti/pinctrl-ti-iodelay.c
@@ -273,6 +273,22 @@ static int ti_iodelay_pinconf_set(struct ti_iodelay_device *iod,
 	return r;
 }
 
+/**
+ * ti_iodelay_pinconf_deinit_dev() - deinit the iodelay device
+ * @data:	IODelay device
+ *
+ * Deinitialize the IODelay device (basically just lock the region back up.
+ */
+static void ti_iodelay_pinconf_deinit_dev(void *data)
+{
+	struct ti_iodelay_device *iod = data;
+	const struct ti_iodelay_reg_data *reg = iod->reg_data;
+
+	/* lock the iodelay region back again */
+	regmap_update_bits(iod->regmap, reg->reg_global_lock_offset,
+			   reg->global_lock_mask, reg->global_lock_val);
+}
+
 /**
  * ti_iodelay_pinconf_init_dev() - Initialize IODelay device
  * @iod: iodelay device
@@ -295,6 +311,11 @@ static int ti_iodelay_pinconf_init_dev(struct ti_iodelay_device *iod)
 	if (r)
 		return r;
 
+	r = devm_add_action_or_reset(iod->dev, ti_iodelay_pinconf_deinit_dev,
+				     iod);
+	if (r)
+		return r;
+
 	/* Read up Recalibration sequence done by bootloader */
 	r = regmap_read(iod->regmap, reg->reg_refclk_offset, &val);
 	if (r)
@@ -353,21 +374,6 @@ static int ti_iodelay_pinconf_init_dev(struct ti_iodelay_device *iod)
 	return 0;
 }
 
-/**
- * ti_iodelay_pinconf_deinit_dev() - deinit the iodelay device
- * @iod:	IODelay device
- *
- * Deinitialize the IODelay device (basically just lock the region back up.
- */
-static void ti_iodelay_pinconf_deinit_dev(struct ti_iodelay_device *iod)
-{
-	const struct ti_iodelay_reg_data *reg = iod->reg_data;
-
-	/* lock the iodelay region back again */
-	regmap_update_bits(iod->regmap, reg->reg_global_lock_offset,
-			   reg->global_lock_mask, reg->global_lock_val);
-}
-
 /**
  * ti_iodelay_get_pingroup() - Find the group mapped by a group selector
  * @iod: iodelay device
@@ -877,27 +883,11 @@ static int ti_iodelay_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	platform_set_drvdata(pdev, iod);
-
 	return pinctrl_enable(iod->pctl);
 }
 
-/**
- * ti_iodelay_remove() - standard remove
- * @pdev: platform device
- */
-static void ti_iodelay_remove(struct platform_device *pdev)
-{
-	struct ti_iodelay_device *iod = platform_get_drvdata(pdev);
-
-	ti_iodelay_pinconf_deinit_dev(iod);
-
-	/* Expect other allocations to be freed by devm */
-}
-
 static struct platform_driver ti_iodelay_driver = {
 	.probe = ti_iodelay_probe,
-	.remove_new = ti_iodelay_remove,
 	.driver = {
 		   .name = DRIVER_NAME,
 		   .of_match_table = ti_iodelay_of_match,
-- 
2.45.2


