Return-Path: <kernel-janitors+bounces-1487-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CB6783F4A3
	for <lists+kernel-janitors@lfdr.de>; Sun, 28 Jan 2024 09:39:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9CDFF1C21614
	for <lists+kernel-janitors@lfdr.de>; Sun, 28 Jan 2024 08:39:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51C77125C1;
	Sun, 28 Jan 2024 08:39:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="KkY1L1xm"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from smtp.smtpout.orange.fr (smtp-25.smtpout.orange.fr [80.12.242.25])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A500DDC4
	for <kernel-janitors@vger.kernel.org>; Sun, 28 Jan 2024 08:39:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706431171; cv=none; b=syqInP/4KHtQdLEusQg/OLHsFC9Kfyrz/N3dyC/jvbLLiXK4D9bHJG5K6NX6tOaFxwmq10ZRHJ+8ErK7IKcnZpMvlu8WfLlaM2uuKmrzGC53+ZIAD4znR2Z2t4tkI+BpmymcJcCr8aLMPqYnBBnMX59Rs8g/sKYNmFKbtaDIg9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706431171; c=relaxed/simple;
	bh=8r1VLIdtrkxcint45jps0p80JK8DBAEYsVjKQfZTKcA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uLDLzvqo/fN+WrljQGgf2ZCMoJVJ0jcfs5D2REv9mHvV112C4jb9JT827ESrNIvokl6eq5phN55zkhZEqB12cVyQvh66Dfz91U87CyiKobqIQPKwVjoGMm9ak26P1ACtpaxLVomVfIbTGfqLGYDOVfTxPgzi50RRBHd7pkKHTKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=KkY1L1xm; arc=none smtp.client-ip=80.12.242.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Received: from fedora.home ([92.140.202.140])
	by smtp.orange.fr with ESMTPA
	id U0gBr3CH8wnxGU0gCrvtYv; Sun, 28 Jan 2024 09:38:20 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1706431100;
	bh=RvZ5Io0RuJBaQqGXuTB/cV5lrPQkLLFNN0oKaea8T94=;
	h=From:To:Cc:Subject:Date;
	b=KkY1L1xm+CslAfCnBetSSorAkB+OaeXBaDHr4YV0PRu1JZB5Sy18yYAWI0OuvejoE
	 3yheer7k0bQlVvFFjbEDuXIbmoRotWyrxMNWW7Ec601FRIW8wTVOdGABkn69BH9iCh
	 7HyNoeovoBD7ul9yGBW3W9Tp2IRShtHCquEJOZNo4M/AiKlyOol1dh8MRF+wHc32Ib
	 YTc2anfLqXfHzeU3Kr38LtT2sWYHe1fJPDAL04XrgyX6GKl1mAzSIKCN6RkfcTrmST
	 fePLWsovz0bloH1y8a84RQHIPdcyjTj7Bs4/pGsc8bMJNvvsKQgbWOKqpy4q23lwnm
	 iTzRs1HT1NB+g==
X-ME-Helo: fedora.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sun, 28 Jan 2024 09:38:20 +0100
X-ME-IP: 92.140.202.140
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: "Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Balsam CHIHI <bchihi@baylibre.com>
Cc: linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
	linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH] thermal/drivers/mediatek/lvts_thermal: Fix a memory leak in an error handling path
Date: Sun, 28 Jan 2024 09:38:10 +0100
Message-ID: <481d345233862d58c3c305855a93d0dbc2bbae7e.1706431063.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If devm_krealloc() fails, then 'efuse' is leaking.
So free it to avoid a leak.

Fixes: f5f633b18234 ("thermal/drivers/mediatek: Add the Low Voltage Thermal Sensor driver")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/thermal/mediatek/lvts_thermal.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/thermal/mediatek/lvts_thermal.c b/drivers/thermal/mediatek/lvts_thermal.c
index 98d9c80bd4c6..fd4bd650c77a 100644
--- a/drivers/thermal/mediatek/lvts_thermal.c
+++ b/drivers/thermal/mediatek/lvts_thermal.c
@@ -719,8 +719,10 @@ static int lvts_calibration_read(struct device *dev, struct lvts_domain *lvts_td
 
 		lvts_td->calib = devm_krealloc(dev, lvts_td->calib,
 					       lvts_td->calib_len + len, GFP_KERNEL);
-		if (!lvts_td->calib)
+		if (!lvts_td->calib) {
+			kfree(efuse);
 			return -ENOMEM;
+		}
 
 		memcpy(lvts_td->calib + lvts_td->calib_len, efuse, len);
 
-- 
2.43.0


