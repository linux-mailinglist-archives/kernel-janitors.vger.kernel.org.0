Return-Path: <kernel-janitors+bounces-1099-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 954718263AD
	for <lists+kernel-janitors@lfdr.de>; Sun,  7 Jan 2024 11:02:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4AA1F1F21B6B
	for <lists+kernel-janitors@lfdr.de>; Sun,  7 Jan 2024 10:02:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B783012B94;
	Sun,  7 Jan 2024 10:02:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="NVbya2GM"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from smtp.smtpout.orange.fr (smtp-29.smtpout.orange.fr [80.12.242.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C00C212E7F
	for <kernel-janitors@vger.kernel.org>; Sun,  7 Jan 2024 10:02:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Received: from pop-os.home ([92.140.202.140])
	by smtp.orange.fr with ESMTPA
	id MPysrRwtE9WXyMPz3rZ58J; Sun, 07 Jan 2024 11:02:22 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1704621742;
	bh=aJxzVqIgfQ6I8zkGzF9gzvRPzwUJvo/hE6MLhe9DP3E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=NVbya2GMo5OoRxXFFv5NHUY1L5eI3ttmziRZBoCzBx3k2g4l0RVemOhW3s3ev15Xv
	 JP/ka/4sMZzNpbbS8uvsrd3/rztuz7RryCRIJMQGZFUSLh8VnkKFzr7RVGnExUiksG
	 DEXImPZ8BoBYIrbooWiLi9qNF1goQR+I9HAlwxQVfMQVLwrQCadDteRFR7XJL6CKOO
	 LlUeOs+jWHBgAkrJt5vBJGUAHhaAlVRss9zch1nNUEm58zs3yDixHuNLxi6zKqJo/6
	 bChNKkx+GYaL1pRF5lQXh79VqNUNTWZRIU6ShctpGHEUEtsiVfFhuGCBmZo2vjYwSJ
	 9G/EdahnL8X9g==
X-ME-Helo: pop-os.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sun, 07 Jan 2024 11:02:22 +0100
X-ME-IP: 92.140.202.140
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: vkoul@kernel.org,
	jiaheng.fan@nxp.com,
	peng.ma@nxp.com,
	wen.he_1@nxp.com
Cc: dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH 2/3] dmaengine: fsl-qdma: Fix a memory leak related to the queue command DMA
Date: Sun,  7 Jan 2024 11:02:04 +0100
Message-Id: <7f66aa14f59d32b13672dde28602b47deb294e1f.1704621515.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1704621515.git.christophe.jaillet@wanadoo.fr>
References: <cover.1704621515.git.christophe.jaillet@wanadoo.fr>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This dma_alloc_coherent() is undone neither in the remove function, nor in
the error handling path of fsl_qdma_probe().

Switch to the managed version to fix both issues.

Fixes: b092529e0aa0 ("dmaengine: fsl-qdma: Add qDMA controller driver for Layerscape SoCs")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/dma/fsl-qdma.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/dma/fsl-qdma.c b/drivers/dma/fsl-qdma.c
index 38409e06040a..3a5595a1d442 100644
--- a/drivers/dma/fsl-qdma.c
+++ b/drivers/dma/fsl-qdma.c
@@ -514,11 +514,11 @@ static struct fsl_qdma_queue
 			queue_temp = queue_head + i + (j * queue_num);
 
 			queue_temp->cq =
-			dma_alloc_coherent(&pdev->dev,
-					   sizeof(struct fsl_qdma_format) *
-					   queue_size[i],
-					   &queue_temp->bus_addr,
-					   GFP_KERNEL);
+			dmam_alloc_coherent(&pdev->dev,
+					    sizeof(struct fsl_qdma_format) *
+					    queue_size[i],
+					    &queue_temp->bus_addr,
+					    GFP_KERNEL);
 			if (!queue_temp->cq)
 				return NULL;
 			queue_temp->block_base = fsl_qdma->block_base +
-- 
2.34.1


