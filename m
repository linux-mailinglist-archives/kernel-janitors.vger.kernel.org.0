Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8FF813773F9
	for <lists+kernel-janitors@lfdr.de>; Sat,  8 May 2021 22:24:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229640AbhEHUYj (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Sat, 8 May 2021 16:24:39 -0400
Received: from smtp07.smtpout.orange.fr ([80.12.242.129]:33745 "EHLO
        smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229593AbhEHUYj (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sat, 8 May 2021 16:24:39 -0400
Received: from localhost.localdomain ([86.243.172.93])
        by mwinf5d65 with ME
        id 2LPa2500521Fzsu03LPaNR; Sat, 08 May 2021 22:23:36 +0200
X-ME-Helo: localhost.localdomain
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sat, 08 May 2021 22:23:36 +0200
X-ME-IP: 86.243.172.93
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     krzysztof.h1@wp.pl, akpm@linux-foundation.org, imre.deak@nokia.com,
        juha.yrjola@solidboot.com
Cc:     linux-fbdev@vger.kernel.org, linux-omap@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH] video: fbdev: lcd_mipid: Fix a memory leak in an error handling path
Date:   Sat,  8 May 2021 22:23:33 +0200
Message-Id: <8b82e34724755b69f34f15dddb288cd373080390.1620505229.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

If 'mipid_detect()' fails, we must free 'md' to avoid a memory leak.

While at it, modernize the function:
   - remove a useless message in case of memory allocation failure
   - change a '== NULL' into a '!'

Fixes: 66d2f99d0bb5 ("omapfb: add support for MIPI-DCS compatible LCDs")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/video/fbdev/omap/lcd_mipid.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/video/fbdev/omap/lcd_mipid.c b/drivers/video/fbdev/omap/lcd_mipid.c
index a75ae0c9b14c..b4b93ff4b41a 100644
--- a/drivers/video/fbdev/omap/lcd_mipid.c
+++ b/drivers/video/fbdev/omap/lcd_mipid.c
@@ -551,10 +551,8 @@ static int mipid_spi_probe(struct spi_device *spi)
 	int r;
 
 	md = kzalloc(sizeof(*md), GFP_KERNEL);
-	if (md == NULL) {
-		dev_err(&spi->dev, "out of memory\n");
+	if (!md)
 		return -ENOMEM;
-	}
 
 	spi->mode = SPI_MODE_0;
 	md->spi = spi;
@@ -563,11 +561,15 @@ static int mipid_spi_probe(struct spi_device *spi)
 
 	r = mipid_detect(md);
 	if (r < 0)
-		return r;
+		goto free_md;
 
 	omapfb_register_panel(&md->panel);
 
 	return 0;
+
+free_md:
+	kfree(md);
+	return r;
 }
 
 static int mipid_spi_remove(struct spi_device *spi)
-- 
2.30.2

