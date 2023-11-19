Return-Path: <kernel-janitors+bounces-326-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C4E67F076E
	for <lists+kernel-janitors@lfdr.de>; Sun, 19 Nov 2023 17:22:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1BF2E280DBC
	for <lists+kernel-janitors@lfdr.de>; Sun, 19 Nov 2023 16:22:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 061A6134D7;
	Sun, 19 Nov 2023 16:22:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="enN28/GC"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from smtp.smtpout.orange.fr (smtp-26.smtpout.orange.fr [80.12.242.26])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C03DB11A
	for <kernel-janitors@vger.kernel.org>; Sun, 19 Nov 2023 08:22:24 -0800 (PST)
Received: from pop-os.home ([86.243.2.178])
	by smtp.orange.fr with ESMTPA
	id 4kYvrrFxYgbbT4kYvreJzl; Sun, 19 Nov 2023 17:22:22 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1700410942;
	bh=kEuqgZIEPcB/w+zrez3UmGeoQW8VSNG01XU6Pt+hyqs=;
	h=From:To:Cc:Subject:Date;
	b=enN28/GCg/o1MtohjakZQm91u1MvRpCSbQuHhXWFMR6UvfttSKKILWBIsfbftK5aA
	 CowZAZeDniDETM4+CmkQOq+OVHiUhBEC+LHslvrat23jziV0EgQKbrRzukdfzcVwrH
	 Lmvg9rsTpPuqXHPhgHcfut0o/Q2YjxYPc1XTTIp2B+Dc5+i9WESPIAN1/rw5WTCkKl
	 tSNDNG/MbMBNND77Tl46u2cQERux4HBllG7ElqCF7BQTvPIY6PXo1xCDfJZ67efZPF
	 mNGBosP2DFpJaAkpreGbS07hRlZnmcXAs73qtYybR5YDvtRoRm/+58bVlgN1EF813W
	 f9nBg1Y1KqXqg==
X-ME-Helo: pop-os.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sun, 19 Nov 2023 17:22:22 +0100
X-ME-IP: 86.243.2.178
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	NXP Linux Team <linux-imx@nxp.com>
Cc: linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	linux-serial@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] serial: mxs-auart: convert not to use dma_request_slave_channel()
Date: Sun, 19 Nov 2023 17:22:20 +0100
Message-Id: <94812f7063e4db5590254ec45fe9bb3c6569509e.1700410918.git.christophe.jaillet@wanadoo.fr>
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
I don't think that setting s->xx_dma_chan to NULL in case of error is
needed, because their would be some other problems or leak if it was
needed.
---
 drivers/tty/serial/mxs-auart.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/tty/serial/mxs-auart.c b/drivers/tty/serial/mxs-auart.c
index 8eeecf8ad359..1bbe8f2e2fcc 100644
--- a/drivers/tty/serial/mxs-auart.c
+++ b/drivers/tty/serial/mxs-auart.c
@@ -904,21 +904,27 @@ static void mxs_auart_dma_exit(struct mxs_auart_port *s)
 
 static int mxs_auart_dma_init(struct mxs_auart_port *s)
 {
+	struct dma_chan *chan;
+
 	if (auart_dma_enabled(s))
 		return 0;
 
 	/* init for RX */
-	s->rx_dma_chan = dma_request_slave_channel(s->dev, "rx");
-	if (!s->rx_dma_chan)
+	chan = dma_request_chan(s->dev, "rx");
+	if (IS_ERR(chan))
 		goto err_out;
+	s->rx_dma_chan = chan;
+
 	s->rx_dma_buf = kzalloc(UART_XMIT_SIZE, GFP_KERNEL | GFP_DMA);
 	if (!s->rx_dma_buf)
 		goto err_out;
 
 	/* init for TX */
-	s->tx_dma_chan = dma_request_slave_channel(s->dev, "tx");
-	if (!s->tx_dma_chan)
+	chan = dma_request_chan(s->dev, "tx");
+	if (IS_ERR(chan))
 		goto err_out;
+	s->tx_dma_chan = chan;
+
 	s->tx_dma_buf = kzalloc(UART_XMIT_SIZE, GFP_KERNEL | GFP_DMA);
 	if (!s->tx_dma_buf)
 		goto err_out;
-- 
2.34.1


