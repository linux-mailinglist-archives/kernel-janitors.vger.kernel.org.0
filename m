Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 33D5A488961
	for <lists+kernel-janitors@lfdr.de>; Sun,  9 Jan 2022 13:34:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235526AbiAIMeh (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Sun, 9 Jan 2022 07:34:37 -0500
Received: from smtp09.smtpout.orange.fr ([80.12.242.131]:53110 "EHLO
        smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233804AbiAIMeg (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sun, 9 Jan 2022 07:34:36 -0500
Received: from pop-os.home ([90.11.185.88])
        by smtp.orange.fr with ESMTPA
        id 6XP8nCEJLUujj6XP9nIQKw; Sun, 09 Jan 2022 13:34:35 +0100
X-ME-Helo: pop-os.home
X-ME-Auth: YWZlNiIxYWMyZDliZWIzOTcwYTEyYzlhMmU3ZiQ1M2U2MzfzZDfyZTMxZTBkMTYyNDBjNDJlZmQ3ZQ==
X-ME-Date: Sun, 09 Jan 2022 13:34:35 +0100
X-ME-IP: 90.11.185.88
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     Elie Morisse <syniurge@gmail.com>,
        Nehal Shah <nehal-bakulchandra.shah@amd.com>,
        Shyam Sundar S K <shyam-sundar.s-k@amd.com>
Cc:     linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        linux-i2c@vger.kernel.org
Subject: [PATCH] i2c: amd-mp2: Remove useless DMA-32 fallback configuration
Date:   Sun,  9 Jan 2022 13:34:18 +0100
Message-Id: <80f5c9b0f496d769882d807008c21aad192139f9.1641731644.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

As stated in [1], dma_set_mask() with a 64-bit mask never fails if
dev->dma_mask is non-NULL.
So, if it fails, the 32 bits case will also fail for the same reason.


Simplify code and remove some dead code accordingly.

[1]: https://lkml.org/lkml/2021/6/7/398

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/i2c/busses/i2c-amd-mp2-pci.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/i2c/busses/i2c-amd-mp2-pci.c b/drivers/i2c/busses/i2c-amd-mp2-pci.c
index adf0e8c1ec01..f57077a7448d 100644
--- a/drivers/i2c/busses/i2c-amd-mp2-pci.c
+++ b/drivers/i2c/busses/i2c-amd-mp2-pci.c
@@ -308,11 +308,8 @@ static int amd_mp2_pci_init(struct amd_mp2_dev *privdata,
 	pci_set_master(pci_dev);
 
 	rc = dma_set_mask(&pci_dev->dev, DMA_BIT_MASK(64));
-	if (rc) {
-		rc = dma_set_mask(&pci_dev->dev, DMA_BIT_MASK(32));
-		if (rc)
-			goto err_dma_mask;
-	}
+	if (rc)
+		goto err_dma_mask;
 
 	/* Set up intx irq */
 	writel(0, privdata->mmio + AMD_P2C_MSG_INTEN);
-- 
2.32.0

