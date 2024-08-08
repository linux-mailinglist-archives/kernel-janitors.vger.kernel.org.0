Return-Path: <kernel-janitors+bounces-4957-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A67D94B9EF
	for <lists+kernel-janitors@lfdr.de>; Thu,  8 Aug 2024 11:46:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2DAE7281F4C
	for <lists+kernel-janitors@lfdr.de>; Thu,  8 Aug 2024 09:46:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C38D7189F2D;
	Thu,  8 Aug 2024 09:46:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="YO2BeQ7m"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from msa.smtpout.orange.fr (smtp-74.smtpout.orange.fr [80.12.242.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD80973466;
	Thu,  8 Aug 2024 09:46:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723110382; cv=none; b=CKkCY/w9anuNW4za3mC4ICO7bPUGqpyn9OTAHzGUWltBYswq9FopTGVmB69TmI9CDezTBzwLFfV/VTYhS2O7d0fJjdRr31pffclWtOzIszRyjuzZVJXK3KUboMGIZ7+VrOZj+Zm05ycHm93D9X9dZddOXQF5pjaxj+0gLTy8CuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723110382; c=relaxed/simple;
	bh=bumPGr+ZtUkPsb174Ov4HOwOhiZCqiX0cTRRdQHd/iI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=C5c7XuhOjQynWC6ekQXYdorkm5uRInoFBK38ld0XFpGxxnMfjNujt9KNydTOmzwqqqnRvy6KRoHkSUnkLokKk0RzMkfskDyT+Rl+Pjl4F6qaIsN1uSwEsvWDYkN4fyALAdrM/ogdeyRxN88dwwr+C16l8veM055bKSjk1QjeqHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=YO2BeQ7m; arc=none smtp.client-ip=80.12.242.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Received: from fedora.home ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id bzipsrAPUHEYLbzipszOrg; Thu, 08 Aug 2024 11:46:16 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1723110376;
	bh=ya2xzpSe2RMDa9pYPN22dbVPek6YtgZI0yveQDSkuLk=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=YO2BeQ7magrcKLdEkaEIDMDjzQb6CwsJZhL914LoddIA57elZMI+ZfYrM0oVKdoqa
	 DNhCfR07NPJzmTow59qUwKsj527OFI5lSPCBTQ46y7tF+owmHHy6tmJOxXzRGYVFSL
	 qbErfS3RejWvEGVvpj95ee2Z774m+AUMG+6SE+5lXYysnTaVxDJcyuOY5zG92upOiV
	 lif5FsnOE9eRikrbUzL1c1y4ucLgznOVItWkoipsh1mTyOBaqkhuMUfq5D/Ww7AOyd
	 cbiQVbo0MHqtwUh1088ZuxgIQeQ0fYphoynjg4ZI1vbUlJ8Cd8k0xohkrT3mop2kL6
	 NHIh24i0u2xrQ==
X-ME-Helo: fedora.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Thu, 08 Aug 2024 11:46:16 +0200
X-ME-IP: 90.11.132.44
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Helge Deller <deller@gmx.de>
Cc: linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	linux-omap@vger.kernel.org,
	linux-fbdev@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH] fbdev: omapfb: panel-sony-acx565akm: Simplify show_cabc_available_modes()
Date: Thu,  8 Aug 2024 11:46:11 +0200
Message-ID: <91fc9049558a4865d441930c8f4732461f478eca.1723110340.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.46.0
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use sysfs_emit_at() instead of snprintf() + custom logic.
Using sysfs_emit_at() is much more simple.

Also, sysfs_emit() is already used in this function, so using
sysfs_emit_at() is more consistent.

Also simplify the logic:
  - always add a space after an entry
  - change the last space into a '\n'

Finally it is easy to see that, given the size of cabc_modes, PAGE_SIZE
can not be reached.
So better keep everything simple (and correct).

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 .../omap2/omapfb/displays/panel-sony-acx565akm.c  | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/video/fbdev/omap2/omapfb/displays/panel-sony-acx565akm.c b/drivers/video/fbdev/omap2/omapfb/displays/panel-sony-acx565akm.c
index 71d2e015960c..fc975615d5c9 100644
--- a/drivers/video/fbdev/omap2/omapfb/displays/panel-sony-acx565akm.c
+++ b/drivers/video/fbdev/omap2/omapfb/displays/panel-sony-acx565akm.c
@@ -466,19 +466,20 @@ static ssize_t show_cabc_available_modes(struct device *dev,
 		char *buf)
 {
 	struct panel_drv_data *ddata = dev_get_drvdata(dev);
-	int len;
+	int len = 0;
 	int i;
 
 	if (!ddata->has_cabc)
 		return sysfs_emit(buf, "%s\n", cabc_modes[0]);
 
-	for (i = 0, len = 0;
-	     len < PAGE_SIZE && i < ARRAY_SIZE(cabc_modes); i++)
-		len += snprintf(&buf[len], PAGE_SIZE - len, "%s%s%s",
-			i ? " " : "", cabc_modes[i],
-			i == ARRAY_SIZE(cabc_modes) - 1 ? "\n" : "");
+	for (i = 0; i < ARRAY_SIZE(cabc_modes); i++)
+		len += sysfs_emit_at(buf, len, "%s ", cabc_modes[i]);
+
+	/* Remove the trailing space */
+	if (len)
+		buf[len - 1] = '\n';
 
-	return len < PAGE_SIZE ? len : PAGE_SIZE - 1;
+	return len;
 }
 
 static DEVICE_ATTR(cabc_mode, S_IRUGO | S_IWUSR,
-- 
2.46.0


