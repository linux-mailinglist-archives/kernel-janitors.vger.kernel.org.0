Return-Path: <kernel-janitors+bounces-4842-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EB16E93C9D9
	for <lists+kernel-janitors@lfdr.de>; Thu, 25 Jul 2024 22:49:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 27EF61C22008
	for <lists+kernel-janitors@lfdr.de>; Thu, 25 Jul 2024 20:49:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62D72148303;
	Thu, 25 Jul 2024 20:48:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="JHCHykUz"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from msa.smtpout.orange.fr (msa-217.smtpout.orange.fr [193.252.23.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 648F1143759
	for <kernel-janitors@vger.kernel.org>; Thu, 25 Jul 2024 20:48:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.252.23.217
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721940496; cv=none; b=oyJRdqg1gPIx/ac9+ygDaC6q3XHP9pyipX0/WUAXrDEdet/INW4rQ0lVbN/JXc/cxWD4ZfCzm797T09Fc6SLgytzrDzr4eqxfJdRv2+B0t3+qL0b6/00aDb1z1SpgTebjp9BERFGayCGuCcA5f4bWVBmGIzZT0G0wi13THZw9Ng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721940496; c=relaxed/simple;
	bh=JHDXKeWytPW/ro4uzW8sk6fYfCOgjS6eqK7o1zZy53g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ixo2IHx7rmZzBchL0WFU2+GEOYOu6shXZJDDmvtsx4Y2dcDGURUVTn/L0SkdIRtvMHAX/mjyfzkxQdZ1weGr1PhbMqWL4mMUhKO3HTMGoDevDBtmdCFxEj14vxXwdrBLQpAANGmBIXjrmFHYait8b0TAbTq4C9+4ENvcXaeP4J0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=JHCHykUz; arc=none smtp.client-ip=193.252.23.217
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Received: from fedora.home ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id X5MSsJCR06bu3X5Mbs696W; Thu, 25 Jul 2024 22:47:03 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1721940423;
	bh=O3ZVT0Ujn9hJ7jDCPbtGlOBgrRHSOXl/SJzBREYLERg=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=JHCHykUzoFQDo6moseWVMxr3phGNAXoZAwrR5hJo0TQIehH5Sw5sR1/P3azDW5VP5
	 dTFuSjrySH1iW+3GFgjFIM/hbs77WjbjR3f6nE/Hq+YfmD9Z2Y76Jkg6UCUd8Y7klw
	 VSmqzABFeUioO8eKfMvVVJZrOGMjFaeKjgcjm7zcSvQvaw7heh/LwTQckU5k4RMWZU
	 gVCP2t/BNOLhcIxZGuy1rwwK9R+23uIf47QXg5aFkOf4qpG1pWK0HoTaAspcxcvq9m
	 hge9vciqNUvw7jnUvAK0r+j9q1E85f7j+J6GRmIaQNUieQNgTPMUmtloqv9EHALnN2
	 yf2gq719CMNhA==
X-ME-Helo: fedora.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Thu, 25 Jul 2024 22:47:03 +0200
X-ME-IP: 90.11.132.44
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: dmitry.torokhov@gmail.com,
	vipulkumar.samar@st.com,
	viresh.kumar@linaro.org
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH 2/2] Input: spear-keyboard - Switch to devm_clk_get_prepared()
Date: Thu, 25 Jul 2024 22:46:50 +0200
Message-ID: <ea855328eb4396cd1c44d2b6acc1fc394fcb1508.1721939824.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <cover.1721939824.git.christophe.jaillet@wanadoo.fr>
References: <cover.1721939824.git.christophe.jaillet@wanadoo.fr>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use devm_clk_get_prepared() in order to remove a clk_unprepare() in an
error handling path of the probe and completely remove the .remove()
function.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
Compile tested only.
---
 drivers/input/keyboard/spear-keyboard.c | 15 +--------------
 1 file changed, 1 insertion(+), 14 deletions(-)

diff --git a/drivers/input/keyboard/spear-keyboard.c b/drivers/input/keyboard/spear-keyboard.c
index 5d9fc8dc9433..1df4feb8ba01 100644
--- a/drivers/input/keyboard/spear-keyboard.c
+++ b/drivers/input/keyboard/spear-keyboard.c
@@ -222,7 +222,7 @@ static int spear_kbd_probe(struct platform_device *pdev)
 	if (IS_ERR(kbd->io_base))
 		return PTR_ERR(kbd->io_base);
 
-	kbd->clk = devm_clk_get(&pdev->dev, NULL);
+	kbd->clk = devm_clk_get_prepared(&pdev->dev, NULL);
 	if (IS_ERR(kbd->clk))
 		return PTR_ERR(kbd->clk);
 
@@ -255,14 +255,9 @@ static int spear_kbd_probe(struct platform_device *pdev)
 		return error;
 	}
 
-	error = clk_prepare(kbd->clk);
-	if (error)
-		return error;
-
 	error = input_register_device(input_dev);
 	if (error) {
 		dev_err(&pdev->dev, "Unable to register keyboard device\n");
-		clk_unprepare(kbd->clk);
 		return error;
 	}
 
@@ -272,13 +267,6 @@ static int spear_kbd_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static void spear_kbd_remove(struct platform_device *pdev)
-{
-	struct spear_kbd *kbd = platform_get_drvdata(pdev);
-
-	clk_unprepare(kbd->clk);
-}
-
 static int spear_kbd_suspend(struct device *dev)
 {
 	struct platform_device *pdev = to_platform_device(dev);
@@ -372,7 +360,6 @@ MODULE_DEVICE_TABLE(of, spear_kbd_id_table);
 
 static struct platform_driver spear_kbd_driver = {
 	.probe		= spear_kbd_probe,
-	.remove_new	= spear_kbd_remove,
 	.driver		= {
 		.name	= "keyboard",
 		.pm	= pm_sleep_ptr(&spear_kbd_pm_ops),
-- 
2.45.2


