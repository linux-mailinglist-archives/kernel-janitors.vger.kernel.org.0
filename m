Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4DF126E1535
	for <lists+kernel-janitors@lfdr.de>; Thu, 13 Apr 2023 21:33:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229681AbjDMTdk (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Thu, 13 Apr 2023 15:33:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36888 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229598AbjDMTdj (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 13 Apr 2023 15:33:39 -0400
Received: from smtp.smtpout.orange.fr (smtp-14.smtpout.orange.fr [80.12.242.14])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 286A34EF6
        for <kernel-janitors@vger.kernel.org>; Thu, 13 Apr 2023 12:33:36 -0700 (PDT)
Received: from pop-os.home ([86.243.2.178])
        by smtp.orange.fr with ESMTPA
        id n2hIpROm9XvOIn2hIpu4Sp; Thu, 13 Apr 2023 21:33:34 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=orange.fr;
        s=t20230301; t=1681414414;
        bh=p8tlc8IxZvfAdUY/OUcVwiltoaAGfLctXu29jYVg/I8=;
        h=From:To:Cc:Subject:Date;
        b=O1nSWm5I/r5qvZA21kpDd+5nm9utlh0pLDctDWI6qhe9pMxWHGl3FKFAkV9XIvdZe
         O2rzxDasWVMEDDDqazKOsHUwLg/RL01XBSx30NTtQ+vODdZ30eikuQ7WdPzU6N8hUq
         RyaiwbxXSQnx6wmRHLOA8wNOyiuhUESX6al0N9RLm1Z+VHWqGQJDvpB1oJVZllR4MW
         NgwIjZdez5HmAyDpPgXqfrAxo8tEVU+JunpWeklzDgpVQHPOwm3P4fw3frTsJm8wOm
         4CMU//G17rDAly5FRWiMlKfu5rvQTRLIfK0m7j04wMjF/8pP6s8wS9a8B7pPKJ3PpY
         RFvqGJzpe32fg==
X-ME-Helo: pop-os.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Thu, 13 Apr 2023 21:33:34 +0200
X-ME-IP: 86.243.2.178
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     Helge Deller <deller@gmx.de>, Cai Huoqing <cai.huoqing@linux.dev>
Cc:     linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: [PATCH] video: fbdev: mmp: Fix deferred clk handling in mmphw_probe()
Date:   Thu, 13 Apr 2023 21:33:17 +0200
Message-Id: <685f452cacc74f4983aaff2bc28a02a95e8aa8b7.1681414375.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

When dev_err_probe() is called, 'ret' holds the value of the previous
successful devm_request_irq() call.
'ret' should be assigned with a meaningful value before being used in
dev_err_probe().

While at it, use and return "PTR_ERR(ctrl->clk)" instead of a hard-coded
"-ENOENT" so that -EPROBE_DEFER is handled and propagated correctly.

Fixes: 81b63420564d ("video: fbdev: mmp: Make use of the helper function dev_err_probe()")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/video/fbdev/mmp/hw/mmp_ctrl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/video/fbdev/mmp/hw/mmp_ctrl.c b/drivers/video/fbdev/mmp/hw/mmp_ctrl.c
index a9df8ee79810..51fbf02a0343 100644
--- a/drivers/video/fbdev/mmp/hw/mmp_ctrl.c
+++ b/drivers/video/fbdev/mmp/hw/mmp_ctrl.c
@@ -514,9 +514,9 @@ static int mmphw_probe(struct platform_device *pdev)
 	/* get clock */
 	ctrl->clk = devm_clk_get(ctrl->dev, mi->clk_name);
 	if (IS_ERR(ctrl->clk)) {
+		ret = PTR_ERR(ctrl->clk);
 		dev_err_probe(ctrl->dev, ret,
 			      "unable to get clk %s\n", mi->clk_name);
-		ret = -ENOENT;
 		goto failed;
 	}
 	clk_prepare_enable(ctrl->clk);
-- 
2.34.1

