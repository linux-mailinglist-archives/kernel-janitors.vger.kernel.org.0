Return-Path: <kernel-janitors+bounces-8044-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id BABA3AB2B05
	for <lists+kernel-janitors@lfdr.de>; Sun, 11 May 2025 22:43:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6E4C77A9A5C
	for <lists+kernel-janitors@lfdr.de>; Sun, 11 May 2025 20:41:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7C3B25E45A;
	Sun, 11 May 2025 20:42:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="P4EaMbCD"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from smtp.smtpout.orange.fr (smtp-20.smtpout.orange.fr [80.12.242.20])
	(using TLSv1.2 with cipher AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BA881E2613
	for <kernel-janitors@vger.kernel.org>; Sun, 11 May 2025 20:42:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746996172; cv=none; b=EXfbE+WCtZcWpYSNVH63lKzMiJfQPenC2LzDUiJwvtqWkJagKGTZGivZURcQADOGled5kOXUE8vN4WzVOtmnJr3tv+peDgCAtzU0E/yyyr3Cl7YE9EwoGpa7ANtirCvEAd6Qkdx8DjdFhwDDjaoBtkRpIveOyuJ3s2MrEJxolVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746996172; c=relaxed/simple;
	bh=QO9Us24guXO7K1H3GL85QEqLXQSOyN8JKGmUgEofzWs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BfVyWhe1rKrNjLrBz0VONwWSFkykpXcAFe+cxOtV4ZMjXNWmSyEXSejhgrVRY2iGi22sBtez+4BJqVfnKYu509Si+6MSWVETkwbQX+EF4ZSc3HuzBa39cREpDICoVthpJy+9gT7Rwqo6TUBPak9Zx3bQz25v8ypLidx2z+PuUbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=P4EaMbCD; arc=none smtp.client-ip=80.12.242.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Received: from localhost.localdomain ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id EDVQuI5SpMKVkEDVQuUuGG; Sun, 11 May 2025 22:42:41 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1746996161;
	bh=vq4pnI3/bwP4UzZRYsyqLZSR+Zib5+2trP04/UCsHps=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=P4EaMbCDQ3bULuHyvFRovLhrdNg2qPivYPuciFBS42Eufn3N5ZsRZ+09VR+cQbixn
	 CJe+3jQcnQcZ+I6n5TFb+8fPmMgRtWDnnBh4NuEAtdkCcDxEon2gfyzhHYCqcXGPgN
	 E+DvZq9FYmkaxrsCL6/ZXEjwPUS+l9uj4aQieRszLutRsrr29aP25gXEPr69pCflkk
	 fyR/xPzAVSFYLZiJ4DxhWZXIeihUdFOtg8MXRdKqsTorRptuHdPZs0qxOREfBDtn96
	 IVao7WPZ1wXUOpkgT3lo5WCEPjZZWerqpPqTL2Wdm+Xi4mVWBdDH3PFT111marZALO
	 sJdRlmmWQsbiQ==
X-ME-Helo: localhost.localdomain
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sun, 11 May 2025 22:42:41 +0200
X-ME-IP: 90.11.132.44
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Karel Balej <balejk@matfyz.cz>,
	Lee Jones <lee@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH] mfd: 88pm886: Constify struct regmap_irq_chip and some other structures
Date: Sun, 11 May 2025 22:42:30 +0200
Message-ID: <1681629840761e30494cb8920668710df60a81b8.1746996137.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

'struct regmap_irq_chip' is not modified in this driver.

Constifying this structure moves some data to a read-only section, so
increase overall security, especially when the structure holds some
function pointers.

While at it, also constify some other structures.

On a x86_64, with allmodconfig, as an example:
Before:
======
   text	   data	    bss	    dec	    hex	filename
   5032	   3304	     64	   8400	   20d0	drivers/mfd/88pm886.o

After:
=====
   text	   data	    bss	    dec	    hex	filename
   5800	   2536	     64	   8400	   20d0	drivers/mfd/88pm886.o

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
Compile tested-only.
---
 drivers/mfd/88pm886.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/mfd/88pm886.c b/drivers/mfd/88pm886.c
index 891fdce5d8c1..bbf9dd449d41 100644
--- a/drivers/mfd/88pm886.c
+++ b/drivers/mfd/88pm886.c
@@ -16,11 +16,11 @@ static const struct regmap_config pm886_regmap_config = {
 	.max_register = PM886_REG_RTC_SPARE6,
 };
 
-static struct regmap_irq pm886_regmap_irqs[] = {
+static const struct regmap_irq pm886_regmap_irqs[] = {
 	REGMAP_IRQ_REG(PM886_IRQ_ONKEY, 0, PM886_INT_ENA1_ONKEY),
 };
 
-static struct regmap_irq_chip pm886_regmap_irq_chip = {
+static const struct regmap_irq_chip pm886_regmap_irq_chip = {
 	.name = "88pm886",
 	.irqs = pm886_regmap_irqs,
 	.num_irqs = ARRAY_SIZE(pm886_regmap_irqs),
@@ -30,11 +30,11 @@ static struct regmap_irq_chip pm886_regmap_irq_chip = {
 	.unmask_base = PM886_REG_INT_ENA_1,
 };
 
-static struct resource pm886_onkey_resources[] = {
+static const struct resource pm886_onkey_resources[] = {
 	DEFINE_RES_IRQ_NAMED(PM886_IRQ_ONKEY, "88pm886-onkey"),
 };
 
-static struct mfd_cell pm886_devs[] = {
+static const struct mfd_cell pm886_devs[] = {
 	MFD_CELL_RES("88pm886-onkey", pm886_onkey_resources),
 	MFD_CELL_NAME("88pm886-regulator"),
 	MFD_CELL_NAME("88pm886-rtc"),
-- 
2.49.0


