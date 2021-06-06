Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4C9A039CFA4
	for <lists+kernel-janitors@lfdr.de>; Sun,  6 Jun 2021 16:49:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230050AbhFFOvO (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Sun, 6 Jun 2021 10:51:14 -0400
Received: from smtp02.smtpout.orange.fr ([80.12.242.124]:45149 "EHLO
        smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230085AbhFFOvL (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sun, 6 Jun 2021 10:51:11 -0400
Received: from localhost.localdomain ([86.243.172.93])
        by mwinf5d04 with ME
        id DqpK2500C21Fzsu03qpKgY; Sun, 06 Jun 2021 16:49:21 +0200
X-ME-Helo: localhost.localdomain
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sun, 06 Jun 2021 16:49:21 +0200
X-ME-IP: 86.243.172.93
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     wim@linux-watchdog.org, linux@roeck-us.net,
        martyn.welch@gefanuc.com
Cc:     linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH] watchdog: gef_wdt:  Fix an error handling path in 'gef_wdt_probe()'
Date:   Sun,  6 Jun 2021 16:49:18 +0200
Message-Id: <3d775a5ac7e26fa5dd4c47f75fef6d5f336de1e3.1622990863.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

If an error occurs after a successful 'of_iomap()' call, it must be undone
by a corresponding 'iounmap()' call, as already done in the remove
function.

Fixes: 3268b5618f38 ("[WATCHDOG] Basic support for GE Fanuc's FPGA based watchdog timer")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/watchdog/gef_wdt.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/watchdog/gef_wdt.c b/drivers/watchdog/gef_wdt.c
index df5406aa7d25..52573176101f 100644
--- a/drivers/watchdog/gef_wdt.c
+++ b/drivers/watchdog/gef_wdt.c
@@ -264,6 +264,7 @@ static int gef_wdt_probe(struct platform_device *dev)
 {
 	int timeout = 10;
 	u32 freq;
+	int ret;
 
 	bus_clk = 133; /* in MHz */
 
@@ -280,7 +281,15 @@ static int gef_wdt_probe(struct platform_device *dev)
 
 	gef_wdt_handler_disable();	/* in case timer was already running */
 
-	return misc_register(&gef_wdt_miscdev);
+	ret = misc_register(&gef_wdt_miscdev);
+	if (ret)
+		goto iounmap_err;
+
+	return 0;
+
+iounmap_err:
+	iounmap(gef_wdt_regs);
+	return ret;
 }
 
 static int gef_wdt_remove(struct platform_device *dev)
-- 
2.30.2

