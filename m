Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A21DA41850B
	for <lists+kernel-janitors@lfdr.de>; Sun, 26 Sep 2021 00:54:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230156AbhIYW4O (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Sat, 25 Sep 2021 18:56:14 -0400
Received: from smtp-relay-canonical-1.canonical.com ([185.125.188.121]:37690
        "EHLO smtp-relay-canonical-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230078AbhIYW4N (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sat, 25 Sep 2021 18:56:13 -0400
Received: from localhost (1.general.cking.uk.vpn [10.172.193.212])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPSA id 39DA94017D;
        Sat, 25 Sep 2021 22:54:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1632610477;
        bh=AG12UD5GriQyZRsgo14qtdKvfNVSCkgR37Dg0qaOmc0=;
        h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type;
        b=dKN4sJPMlwObnLl1dEaMjayZxqCCMu2zWiEm8cJ/792OMYftatnp+AoUvWClN6Ggp
         bmUxT/VYf/yC5j+bCdZLdxguIopdu/TY3wcxXcTb5ZdI3KHoapL8cUZgR4PGK+7VlG
         F5/o1bP024knrFoI3l+0POYNHPlPZkqvvLmhKlDai94HbMPI57iEvIVfKFZPm5zXIu
         grtwq8V9nmPkCHDNdH5gM7znZJr3iVls59zGUZfBZmWPkIq9JpTHlKagnwo8MgKe4a
         ZPS30SUBxiojnD1cTXLv2hsk3sPNqyHOQgQkgB/zfA4tAaUeNIGMAPgqZlkitt+5J5
         PHXUpLh0mp0ZQ==
From:   Colin King <colin.king@canonical.com>
To:     dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] video: fbdev: pxa168fb: Initialize pointers with NULL and not plain integer 0
Date:   Sat, 25 Sep 2021 23:54:36 +0100
Message-Id: <20210925225436.183770-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Pointers info and fbi are being initialized with plain integer zeros. Fix
this by initializing them with NULLs.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/video/fbdev/pxa168fb.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/video/fbdev/pxa168fb.c b/drivers/video/fbdev/pxa168fb.c
index 47e6a1d0d229..461fedf9bf24 100644
--- a/drivers/video/fbdev/pxa168fb.c
+++ b/drivers/video/fbdev/pxa168fb.c
@@ -593,8 +593,8 @@ static void pxa168fb_init_mode(struct fb_info *info,
 static int pxa168fb_probe(struct platform_device *pdev)
 {
 	struct pxa168fb_mach_info *mi;
-	struct fb_info *info = 0;
-	struct pxa168fb_info *fbi = 0;
+	struct fb_info *info = NULL;
+	struct pxa168fb_info *fbi = NULL;
 	struct resource *res;
 	struct clk *clk;
 	int irq, ret;
-- 
2.32.0

