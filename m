Return-Path: <kernel-janitors+bounces-317-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 93CCA7EFE8C
	for <lists+kernel-janitors@lfdr.de>; Sat, 18 Nov 2023 09:42:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2B9A9B20A4A
	for <lists+kernel-janitors@lfdr.de>; Sat, 18 Nov 2023 08:42:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CD9DDDBC;
	Sat, 18 Nov 2023 08:42:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="gYp0LcfN"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from smtp.smtpout.orange.fr (smtp-25.smtpout.orange.fr [80.12.242.25])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C5540D72
	for <kernel-janitors@vger.kernel.org>; Sat, 18 Nov 2023 00:42:10 -0800 (PST)
Received: from pop-os.home ([86.243.2.178])
	by smtp.orange.fr with ESMTPA
	id 4Gu0rJpY1TzFX4Gu0rZIvI; Sat, 18 Nov 2023 09:42:09 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1700296929;
	bh=ndyYzPGfIFWFzQxlHxzHKrwnfoAbUHaX6A64uMZYaoc=;
	h=From:To:Cc:Subject:Date;
	b=gYp0LcfNEYwN0zUxtUeKOT/rQuzhU9R0EE8KjvCPmCW+wIXE3s8icUkzMQLXrDsMp
	 oCpgI3aGdfkw/6e9kqYSnl86DnLlkRygox1xlhomCKruir/A9pMFR7LcVjxSJ1RV8+
	 szp2/KVxKQIESghWu29zfJ1I5dHXBN92wAdYskb/5C8kfWPXvTEE/YeonTXyN9iQ74
	 R5TxlbqLXxFuZFv+b+IHwIYDduCeZQ6GWO6PX3BZwcCIE6Mcc7aZwAkE/2/dHzA03e
	 tn77Rbd6SEfBn/GWyZXo2wOwH9mX8HGCfeBEoh9ETjlxjX5cPsX9fF5uKV5VsuB1Qj
	 +Sjsp76aHicfg==
X-ME-Helo: pop-os.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sat, 18 Nov 2023 09:42:09 +0100
X-ME-IP: 86.243.2.178
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Sergey Shtylyov <s.shtylyov@omp.ru>,
	Damien Le Moal <dlemoal@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	linux-ide@vger.kernel.org
Subject: [PATCH v2] ata: pata_pxa: convert not to use dma_request_slave_channel()
Date: Sat, 18 Nov 2023 09:42:07 +0100
Message-Id: <497fe3c81b83ea74c4850bc44ea09acf15886b7e.1700296910.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

dma_request_slave_channel() is deprecated. dma_request_chan() should
be used directly instead.

Switch to the preferred function and update the error handling accordingly.
While at it, also propagate the error code that is now available.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
v2: Propagate the error code   [Sergey Shtylyov]

v1: https://lore.kernel.org/all/f177835b7f0db810a132916c8a281bbdaf47f9d3.1699801657.git.christophe.jaillet@wanadoo.fr/
---
 drivers/ata/pata_pxa.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/ata/pata_pxa.c b/drivers/ata/pata_pxa.c
index 5275c6464f57..538bd3423d85 100644
--- a/drivers/ata/pata_pxa.c
+++ b/drivers/ata/pata_pxa.c
@@ -274,10 +274,9 @@ static int pxa_ata_probe(struct platform_device *pdev)
 	/*
 	 * Request the DMA channel
 	 */
-	data->dma_chan =
-		dma_request_slave_channel(&pdev->dev, "data");
-	if (!data->dma_chan)
-		return -EBUSY;
+	data->dma_chan = dma_request_chan(&pdev->dev, "data");
+	if (IS_ERR(data->dma_chan))
+		return PTR_ERR(data->dma_chan);
 	ret = dmaengine_slave_config(data->dma_chan, &config);
 	if (ret < 0) {
 		dev_err(&pdev->dev, "dma configuration failed: %d\n", ret);
-- 
2.34.1


