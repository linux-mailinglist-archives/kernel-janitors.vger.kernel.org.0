Return-Path: <kernel-janitors+bounces-233-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D6C307E9152
	for <lists+kernel-janitors@lfdr.de>; Sun, 12 Nov 2023 16:08:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A04C01C2080C
	for <lists+kernel-janitors@lfdr.de>; Sun, 12 Nov 2023 15:08:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0619012B97;
	Sun, 12 Nov 2023 15:08:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="CyH3It+l"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1337212B8D
	for <kernel-janitors@vger.kernel.org>; Sun, 12 Nov 2023 15:08:09 +0000 (UTC)
Received: from smtp.smtpout.orange.fr (smtp-19.smtpout.orange.fr [80.12.242.19])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4BFCE2D62
	for <kernel-janitors@vger.kernel.org>; Sun, 12 Nov 2023 07:08:07 -0800 (PST)
Received: from pop-os.home ([86.243.2.178])
	by smtp.orange.fr with ESMTPA
	id 2C4CrUKVuFh5i2C4CrGN2t; Sun, 12 Nov 2023 16:08:05 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1699801685;
	bh=HsPvZv0x+A3KoodF5NWXigZeG3z5ocFLVuOCH93t+Qg=;
	h=From:To:Cc:Subject:Date;
	b=CyH3It+lkPlnNtgWnGGIZlRHNIVvTEXPaf9I0NdXq2LolJUOESKjWozbDw47R37KF
	 zUkYSWt6GBsiJCv6puZYCx7moe2Sd0fY72z+hsmxMznUeLnacVPG4zwiHHiv3I2M5l
	 XgbulJd1u0Z4kb2opca5zN5Iq36XQOLl8CCSWL+UjOBjmg+ag0LAoIMFiZZmUn78tO
	 +DR9EPRdddqo0uxgmJJDOI/AhdzMlwaJtVzw7t3m/N88fcmYRvJMGqNRJkXP/fc9I9
	 aMK0r/mLfJdkw6JbdAb/Ixqjvm6PU7a1/j94QAIa9u3ac5DkIU2k9ZkgCz3TVz1qnn
	 Q4zKiXHv28r6g==
X-ME-Helo: pop-os.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sun, 12 Nov 2023 16:08:05 +0100
X-ME-IP: 86.243.2.178
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Sergey Shtylyov <s.shtylyov@omp.ru>,
	Damien Le Moal <dlemoal@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	linux-ide@vger.kernel.org
Subject: [PATCH] ata: pata_pxa: convert not to use dma_request_slave_channel()
Date: Sun, 12 Nov 2023 16:07:59 +0100
Message-Id: <f177835b7f0db810a132916c8a281bbdaf47f9d3.1699801657.git.christophe.jaillet@wanadoo.fr>
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

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/ata/pata_pxa.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/ata/pata_pxa.c b/drivers/ata/pata_pxa.c
index 5275c6464f57..0c9c9cf63d36 100644
--- a/drivers/ata/pata_pxa.c
+++ b/drivers/ata/pata_pxa.c
@@ -274,9 +274,8 @@ static int pxa_ata_probe(struct platform_device *pdev)
 	/*
 	 * Request the DMA channel
 	 */
-	data->dma_chan =
-		dma_request_slave_channel(&pdev->dev, "data");
-	if (!data->dma_chan)
+	data->dma_chan = dma_request_chan(&pdev->dev, "data");
+	if (IS_ERR(data->dma_chan))
 		return -EBUSY;
 	ret = dmaengine_slave_config(data->dma_chan, &config);
 	if (ret < 0) {
-- 
2.34.1


