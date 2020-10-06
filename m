Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AC1D5284EC4
	for <lists+kernel-janitors@lfdr.de>; Tue,  6 Oct 2020 17:20:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726442AbgJFPUn (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Tue, 6 Oct 2020 11:20:43 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:48921 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726087AbgJFPUj (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 6 Oct 2020 11:20:39 -0400
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
        by youngberry.canonical.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <colin.king@canonical.com>)
        id 1kPolM-0003j9-On; Tue, 06 Oct 2020 15:20:24 +0000
From:   Colin King <colin.king@canonical.com>
To:     Codrin Ciubotariu <codrin.ciubotariu@microchip.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Ludovic Desroches <ludovic.desroches@microchip.com>,
        alsa-devel@alsa-project.org, linux-arm-kernel@lists.infradead.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH][next] ASoC: mchp-spdifrx: fix spelling mistake "overrrun" -> "overrun"
Date:   Tue,  6 Oct 2020 16:20:24 +0100
Message-Id: <20201006152024.542418-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a spelling mistake in a dev_warn message. Fix it.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 sound/soc/atmel/mchp-spdifrx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/atmel/mchp-spdifrx.c b/sound/soc/atmel/mchp-spdifrx.c
index 726e4951d9a5..e6ded6f8453f 100644
--- a/sound/soc/atmel/mchp-spdifrx.c
+++ b/sound/soc/atmel/mchp-spdifrx.c
@@ -338,7 +338,7 @@ static irqreturn_t mchp_spdif_interrupt(int irq, void *dev_id)
 	}
 
 	if (pending & SPDIFRX_IR_OVERRUN) {
-		dev_warn(dev->dev, "Overrrun detected\n");
+		dev_warn(dev->dev, "Overrun detected\n");
 		ret = IRQ_HANDLED;
 	}
 
-- 
2.27.0

