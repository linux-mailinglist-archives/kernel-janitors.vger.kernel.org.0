Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6C322377805
	for <lists+kernel-janitors@lfdr.de>; Sun,  9 May 2021 21:12:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229941AbhEITNf (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Sun, 9 May 2021 15:13:35 -0400
Received: from smtp04.smtpout.orange.fr ([80.12.242.126]:49794 "EHLO
        smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229693AbhEITNd (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sun, 9 May 2021 15:13:33 -0400
Received: from localhost.localdomain ([86.243.172.93])
        by mwinf5d60 with ME
        id 2jCT2500B21Fzsu03jCU58; Sun, 09 May 2021 21:12:28 +0200
X-ME-Helo: localhost.localdomain
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sun, 09 May 2021 21:12:28 +0200
X-ME-IP: 86.243.172.93
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     olteanv@gmail.com, broonie@kernel.org, maitysanchayan@gmail.com
Cc:     linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH] spi: spi-fsl-dspi: Fix a resource leak in an error handling path
Date:   Sun,  9 May 2021 21:12:27 +0200
Message-Id: <d51caaac747277a1099ba8dea07acd85435b857e.1620587472.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

'dspi_request_dma()' should be undone by a 'dspi_release_dma()' call in the
error handling path of the probe function, as already done in the remove
function

Fixes: 90ba37033cb9 ("spi: spi-fsl-dspi: Add DMA support for Vybrid")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/spi/spi-fsl-dspi.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/spi/spi-fsl-dspi.c b/drivers/spi/spi-fsl-dspi.c
index 028736687488..fb45e6af6638 100644
--- a/drivers/spi/spi-fsl-dspi.c
+++ b/drivers/spi/spi-fsl-dspi.c
@@ -1375,11 +1375,13 @@ static int dspi_probe(struct platform_device *pdev)
 	ret = spi_register_controller(ctlr);
 	if (ret != 0) {
 		dev_err(&pdev->dev, "Problem registering DSPI ctlr\n");
-		goto out_free_irq;
+		goto out_release_dma;
 	}
 
 	return ret;
 
+out_release_dma:
+	dspi_release_dma(dspi);
 out_free_irq:
 	if (dspi->irq)
 		free_irq(dspi->irq, dspi);
-- 
2.30.2

