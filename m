Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 25F732F92AA
	for <lists+kernel-janitors@lfdr.de>; Sun, 17 Jan 2021 14:44:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729238AbhAQNn4 (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Sun, 17 Jan 2021 08:43:56 -0500
Received: from smtp08.smtpout.orange.fr ([80.12.242.130]:57875 "EHLO
        smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729140AbhAQNlR (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sun, 17 Jan 2021 08:41:17 -0500
Received: from localhost.localdomain ([92.131.99.25])
        by mwinf5d43 with ME
        id HpfU240070Ys01Y03pfUiX; Sun, 17 Jan 2021 14:39:31 +0100
X-ME-Helo: localhost.localdomain
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sun, 17 Jan 2021 14:39:31 +0100
X-ME-IP: 92.131.99.25
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     mporter@kernel.crashing.org, alex.bou9@gmail.com
Cc:     linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH] rapidio/tsi721: Use dma_set_mask_and_coherent to simplify code
Date:   Sun, 17 Jan 2021 14:39:29 +0100
Message-Id: <20210117133929.563645-1-christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

'pci_set_dma_mask()' + 'pci_set_consistent_dma_mask()' can be replaced by
an equivalent 'dma_set_mask_and_coherent()' which is much less verbose.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/rapidio/devices/tsi721.c | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/drivers/rapidio/devices/tsi721.c b/drivers/rapidio/devices/tsi721.c
index 4dd31dd9feea..1e296b4d7bf2 100644
--- a/drivers/rapidio/devices/tsi721.c
+++ b/drivers/rapidio/devices/tsi721.c
@@ -2836,19 +2836,12 @@ static int tsi721_probe(struct pci_dev *pdev,
 	}
 
 	/* Configure DMA attributes. */
-	if (pci_set_dma_mask(pdev, DMA_BIT_MASK(64))) {
-		err = pci_set_dma_mask(pdev, DMA_BIT_MASK(32));
+	if (dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(64))) {
+		err = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(32));
 		if (err) {
 			tsi_err(&pdev->dev, "Unable to set DMA mask");
 			goto err_unmap_bars;
 		}
-
-		if (pci_set_consistent_dma_mask(pdev, DMA_BIT_MASK(32)))
-			tsi_info(&pdev->dev, "Unable to set consistent DMA mask");
-	} else {
-		err = pci_set_consistent_dma_mask(pdev, DMA_BIT_MASK(64));
-		if (err)
-			tsi_info(&pdev->dev, "Unable to set consistent DMA mask");
 	}
 
 	BUG_ON(!pci_is_pcie(pdev));
-- 
2.27.0

