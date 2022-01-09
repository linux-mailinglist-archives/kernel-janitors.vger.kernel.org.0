Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F25B748895C
	for <lists+kernel-janitors@lfdr.de>; Sun,  9 Jan 2022 13:30:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235503AbiAIMad (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Sun, 9 Jan 2022 07:30:33 -0500
Received: from smtp09.smtpout.orange.fr ([80.12.242.131]:65065 "EHLO
        smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231767AbiAIMad (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sun, 9 Jan 2022 07:30:33 -0500
Received: from pop-os.home ([90.11.185.88])
        by smtp.orange.fr with ESMTPA
        id 6XLCnCCcQUujj6XLCnIPoD; Sun, 09 Jan 2022 13:30:31 +0100
X-ME-Helo: pop-os.home
X-ME-Auth: YWZlNiIxYWMyZDliZWIzOTcwYTEyYzlhMmU3ZiQ1M2U2MzfzZDfyZTMxZTBkMTYyNDBjNDJlZmQ3ZQ==
X-ME-Date: Sun, 09 Jan 2022 13:30:31 +0100
X-ME-IP: 90.11.185.88
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     Seth Heasley <seth.heasley@intel.com>,
        Neil Horman <nhorman@tuxdriver.com>
Cc:     linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        linux-i2c@vger.kernel.org
Subject: [PATCH] i2c: ismt: Remove useless DMA-32 fallback configuration
Date:   Sun,  9 Jan 2022 13:29:45 +0100
Message-Id: <853d9f9d746864435abf93dfc822fccac5b04f37.1641731339.git.christophe.jaillet@wanadoo.fr>
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
 drivers/i2c/busses/i2c-ismt.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/i2c/busses/i2c-ismt.c b/drivers/i2c/busses/i2c-ismt.c
index f4820fd3dc13..951f3511afaa 100644
--- a/drivers/i2c/busses/i2c-ismt.c
+++ b/drivers/i2c/busses/i2c-ismt.c
@@ -920,11 +920,8 @@ ismt_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 
 	err = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(64));
 	if (err) {
-		err = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(32));
-		if (err) {
-			dev_err(&pdev->dev, "dma_set_mask fail\n");
-			return -ENODEV;
-		}
+		dev_err(&pdev->dev, "dma_set_mask fail\n");
+		return -ENODEV;
 	}
 
 	err = ismt_dev_init(priv);
-- 
2.32.0

