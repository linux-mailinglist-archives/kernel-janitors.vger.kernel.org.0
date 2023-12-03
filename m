Return-Path: <kernel-janitors+bounces-547-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 90994802523
	for <lists+kernel-janitors@lfdr.de>; Sun,  3 Dec 2023 16:24:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 12E34B209E9
	for <lists+kernel-janitors@lfdr.de>; Sun,  3 Dec 2023 15:24:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF91B154B1;
	Sun,  3 Dec 2023 15:24:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="IOXgqwrk"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from smtp.smtpout.orange.fr (smtp-18.smtpout.orange.fr [80.12.242.18])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 90D2CEB
	for <kernel-janitors@vger.kernel.org>; Sun,  3 Dec 2023 07:24:19 -0800 (PST)
Received: from pop-os.home ([92.140.202.140])
	by smtp.orange.fr with ESMTPA
	id 9oKOre2IUxHPQ9oKOrhoyc; Sun, 03 Dec 2023 16:24:17 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1701617057;
	bh=gnbtnIix+v+CGc9OT23ytJpA1uN7CF77J/4touzfKKQ=;
	h=From:To:Cc:Subject:Date;
	b=IOXgqwrkOp7vaS9xb3U5gr7R2FeAR3ZWsbSp7zExv5vDAHpB52I3PnNrManjYY+LH
	 45mg7VkT6a9FT5ZSJf/jAtqViJwdajOJH3958WLb7WB/nZicsJ0GF551yUhuDABRAF
	 cublK6HjDKoK79HnEbEod0lWwc0OZHY39VVH3/7pzDk//OEisLXVzzTp2E7LChY06T
	 Avm5Sl6DWWQk/opdnRfwJr2jpsst+2r4l/DecCGiT+EMhjEVP9W60alo+XP449FnZe
	 3lDvbtfscEFsO8Y+0Zu1zuzGSdfz4Tq158efFYRvtuAe/So/vMCcjC77Dcch9snNLF
	 OrgCzmA5bAyug==
X-ME-Helo: pop-os.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sun, 03 Dec 2023 16:24:17 +0100
X-ME-IP: 92.140.202.140
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Jonas Malaco <jonas@protocubo.io>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>
Cc: linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Aleksa Savic <savicaleksa83@gmail.com>,
	linux-hwmon@vger.kernel.org
Subject: [PATCH] hwmon: nzxt: Fix some error handling path in kraken2_probe()
Date: Sun,  3 Dec 2023 16:24:05 +0100
Message-Id: <a768e69851a07a1f4e29f270f4e2559063f07343.1701617030.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There is no point in calling hid_hw_stop() if hid_hw_start() has failed.
There is no point in calling hid_hw_close() if hid_hw_open() has failed.

Update the error handling path accordingly.

Fixes: 82e3430dfa8c ("hwmon: add driver for NZXT Kraken X42/X52/X62/X72")
Reported-by: Aleksa Savic <savicaleksa83@gmail.com>
Closes: https://lore.kernel.org/all/121470f0-6c1f-418a-844c-7ec2e8a54b8e@gmail.com/
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
Closes added to please checkpatch, not sure if relevant here.
---
 drivers/hwmon/nzxt-kraken2.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/nzxt-kraken2.c b/drivers/hwmon/nzxt-kraken2.c
index 428c77b5fce5..7caf387eb144 100644
--- a/drivers/hwmon/nzxt-kraken2.c
+++ b/drivers/hwmon/nzxt-kraken2.c
@@ -161,13 +161,13 @@ static int kraken2_probe(struct hid_device *hdev,
 	ret = hid_hw_start(hdev, HID_CONNECT_HIDRAW);
 	if (ret) {
 		hid_err(hdev, "hid hw start failed with %d\n", ret);
-		goto fail_and_stop;
+		return ret;
 	}
 
 	ret = hid_hw_open(hdev);
 	if (ret) {
 		hid_err(hdev, "hid hw open failed with %d\n", ret);
-		goto fail_and_close;
+		goto fail_and_stop;
 	}
 
 	priv->hwmon_dev = hwmon_device_register_with_info(&hdev->dev, "kraken2",
-- 
2.34.1


