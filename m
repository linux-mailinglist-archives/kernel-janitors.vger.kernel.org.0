Return-Path: <kernel-janitors+bounces-1396-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BFC898333BB
	for <lists+kernel-janitors@lfdr.de>; Sat, 20 Jan 2024 12:03:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 556D61F22144
	for <lists+kernel-janitors@lfdr.de>; Sat, 20 Jan 2024 11:03:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7838DDA7;
	Sat, 20 Jan 2024 11:03:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="GYpUNtW5"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from smtp.smtpout.orange.fr (smtp-13.smtpout.orange.fr [80.12.242.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AB25D266
	for <kernel-janitors@vger.kernel.org>; Sat, 20 Jan 2024 11:03:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705748619; cv=none; b=AG5mk1xmq4566m5scaG+yXAXZlxODl4LFB9XaNIyvehRMMlLFROW80iof6R0gQJ01G4mwAD6TE80g2o2O+9U2Zey84HDK8ydXaqnSRByC1nn1s78zrICBUMCKeM5+LgW5u4iZlh4g5B+WQLcrN0F2edBAHpseisMs6GL7+HBxKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705748619; c=relaxed/simple;
	bh=rq05Q3CTtTgQ1urJlIhpHt7f6eCXdIHqDcVdECHIwao=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Tyg4Mqny4FANvbBxqdpPpZqmKdEtll/piL3iCNE3CGzPYo7Yv1USkmhLbkcrG2s0iFHQREy1c6lzUFueOZN6+Mlskn0gB7me+ht1V7EUekR/jofFfa/LuZfZkr1oFuYIvl3guSzWOtfe7mavBs3rkkW0xU2IQ+PpV6lEYwD9hdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=GYpUNtW5; arc=none smtp.client-ip=80.12.242.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Received: from fedora.home ([92.140.202.140])
	by smtp.orange.fr with ESMTPA
	id R98NrmVHvBejiR98NrhEeh; Sat, 20 Jan 2024 12:03:32 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1705748612;
	bh=GxQFw8ZsE9hz9MpyTlvTEQNDbRZXAH6gthc9NucWNh0=;
	h=From:To:Cc:Subject:Date;
	b=GYpUNtW5ZgVk4Q0J2G/GpD92kEHqtkXbQNsn+2OVT4l1CvJVqbtfrxPFPpn4D+IFm
	 NFi71HNKYBRUyLvXBO52gApxR0o0YWhj/3ZaQewPxtx0cUUkJp/KejSd6OI22u59Xy
	 6DKRvlZbxzxOPIFwqUukl6EX48AEWgmKkUvSzTG+gTlen6Iq4ZzPr//NBd9xUuRKwf
	 r7fgS5X48SsnbO0Gu8VGY5aPV3g6WV6rrm1y3xMDvy+wno4yPBGp85Ddl3TyoNbl5O
	 4AlX9hK4p1g0xVqTSBFUR+0A1+BUvxzVHUM7iCr+2C8NOHgnhBNy7F8j1RJ8FGu67S
	 DxxAlI+cWtGnw==
X-ME-Helo: fedora.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sat, 20 Jan 2024 12:03:32 +0100
X-ME-IP: 92.140.202.140
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH] regulator: fixed-helper: Save a few bytes of memory when registering a 'nfc_llc' engine
Date: Sat, 20 Jan 2024 12:03:26 +0100
Message-ID: <3f990a7b80d72c31371735b24ed08acbb8392c80.1705748586.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

regulator_register_always_on() calls pass a string literal as the 'name'
parameter.

So kstrdup_const() can be used instead of kfree() to avoid a memory
allocation in such cases.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/regulator/fixed-helper.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/regulator/fixed-helper.c b/drivers/regulator/fixed-helper.c
index 0eb2442456f0..2d5a42b2b3d8 100644
--- a/drivers/regulator/fixed-helper.c
+++ b/drivers/regulator/fixed-helper.c
@@ -15,7 +15,7 @@ static void regulator_fixed_release(struct device *dev)
 {
 	struct fixed_regulator_data *data = container_of(dev,
 			struct fixed_regulator_data, pdev.dev);
-	kfree(data->cfg.supply_name);
+	kfree_const(data->cfg.supply_name);
 	kfree(data);
 }
 
@@ -36,7 +36,7 @@ struct platform_device *regulator_register_always_on(int id, const char *name,
 	if (!data)
 		return NULL;
 
-	data->cfg.supply_name = kstrdup(name, GFP_KERNEL);
+	data->cfg.supply_name = kstrdup_const(name, GFP_KERNEL);
 	if (!data->cfg.supply_name) {
 		kfree(data);
 		return NULL;
-- 
2.43.0


