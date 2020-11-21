Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C69942BBDF5
	for <lists+kernel-janitors@lfdr.de>; Sat, 21 Nov 2020 09:17:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727021AbgKUIQu (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Sat, 21 Nov 2020 03:16:50 -0500
Received: from smtp05.smtpout.orange.fr ([80.12.242.127]:47277 "EHLO
        smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726659AbgKUIQu (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sat, 21 Nov 2020 03:16:50 -0500
Received: from localhost.localdomain ([81.185.161.242])
        by mwinf5d61 with ME
        id uwGk2300J5E5lq903wGkm7; Sat, 21 Nov 2020 09:16:46 +0100
X-ME-Helo: localhost.localdomain
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sat, 21 Nov 2020 09:16:46 +0100
X-ME-IP: 81.185.161.242
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     perex@perex.cz, tiwai@suse.com, dan.carpenter@oracle.com
Cc:     alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH] ALSA: emu10k1: Use dma_set_mask_and_coherent to simplify code
Date:   Sat, 21 Nov 2020 09:16:32 +0100
Message-Id: <20201121081632.1330159-1-christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

'pci_set_dma_mask()' + 'pci_set_consistent_dma_mask()' can be replaced by
an equivalent 'dma_set_mask_and_coherent()' which is much less verbose.

With at it replace the 'card->dev' parameter passed to a 'dev_err()' call
by an equivalent '&pci->dev' which is more consistent with the test just
one line above.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 sound/pci/emu10k1/emu10k1x.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/pci/emu10k1/emu10k1x.c b/sound/pci/emu10k1/emu10k1x.c
index def8161cde4c..f2b6fd434474 100644
--- a/sound/pci/emu10k1/emu10k1x.c
+++ b/sound/pci/emu10k1/emu10k1x.c
@@ -894,9 +894,9 @@ static int snd_emu10k1x_create(struct snd_card *card,
 
 	if ((err = pci_enable_device(pci)) < 0)
 		return err;
-	if (pci_set_dma_mask(pci, DMA_BIT_MASK(28)) < 0 ||
-	    pci_set_consistent_dma_mask(pci, DMA_BIT_MASK(28)) < 0) {
-		dev_err(card->dev, "error to set 28bit mask DMA\n");
+
+	if (dma_set_mask_and_coherent(&pci->dev, DMA_BIT_MASK(28)) < 0) {
+		dev_err(&pci->dev, "error to set 28bit mask DMA\n");
 		pci_disable_device(pci);
 		return -ENXIO;
 	}
-- 
2.27.0

