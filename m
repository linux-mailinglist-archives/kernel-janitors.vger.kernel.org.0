Return-Path: <kernel-janitors+bounces-325-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 73ECD7F0762
	for <lists+kernel-janitors@lfdr.de>; Sun, 19 Nov 2023 17:13:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A53F01C204FC
	for <lists+kernel-janitors@lfdr.de>; Sun, 19 Nov 2023 16:13:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E4601400F;
	Sun, 19 Nov 2023 16:12:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="ChbdukEr"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from smtp.smtpout.orange.fr (smtp-24.smtpout.orange.fr [80.12.242.24])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 186FC11A
	for <kernel-janitors@vger.kernel.org>; Sun, 19 Nov 2023 08:12:53 -0800 (PST)
Received: from pop-os.home ([86.243.2.178])
	by smtp.orange.fr with ESMTPA
	id 4kPhraC9JxVPt4kPhrzakJ; Sun, 19 Nov 2023 17:12:51 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1700410371;
	bh=Cq+Ma44I5rcVPvAOPNh8K0fTdo2ud4VzNDLd8VR7lXI=;
	h=From:To:Cc:Subject:Date;
	b=ChbdukErzOOtfglZwCpdHBkaxrzADa93OvyXoTIXUi46MzloHVfMLE9En/DKorGUJ
	 P67PUvUMGM2Tuxtf2ZASz8tK/Ha20efRoGORtHBBZhklDdIUkI80oBd/bEW+BYYg9W
	 PGKQJBdN1GPrDtAaM78QjibbFvlRiI6FX7AWxIHUdDk6UTtvUmhzoOBmHv63yk3rnT
	 Al4Uo4eCuAVvBlyUfbHLrIttdWucFsU0OYo3HETEMaekfESvUW/Ml+7at0b7oqvDk2
	 oR8S8nSLKLLDDddjpWPU3hP3mkp2wWbGxh4pfjCP1WDB7uFgfZWjSfbSrJkY0RQg8w
	 QdkqQ9/u2in5A==
X-ME-Helo: pop-os.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sun, 19 Nov 2023 17:12:51 +0100
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
Subject: [PATCH] serial: imx: convert not to use dma_request_slave_channel()
Date: Sun, 19 Nov 2023 17:12:48 +0100
Message-Id: <a46b493c6b5cfa09417e3e138e304fd01b61e748.1700410346.git.christophe.jaillet@wanadoo.fr>
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
I don't think that the:
   sport->dma_chan_xx = NULL;
are really needed. I added it just to make sure that the behavior was
exactly the same as before.

Anyway, it can't hurt.

Changing the returned value from -EINVAL to something else is fine. The
only caller on check if == 0 or not.
---
 drivers/tty/serial/imx.c | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/drivers/tty/serial/imx.c b/drivers/tty/serial/imx.c
index 708b9852a575..5cb74d8f9d2a 100644
--- a/drivers/tty/serial/imx.c
+++ b/drivers/tty/serial/imx.c
@@ -1336,15 +1336,18 @@ static int imx_uart_dma_init(struct imx_port *sport)
 {
 	struct dma_slave_config slave_config = {};
 	struct device *dev = sport->port.dev;
+	struct dma_chan *chan;
 	int ret;
 
 	/* Prepare for RX : */
-	sport->dma_chan_rx = dma_request_slave_channel(dev, "rx");
-	if (!sport->dma_chan_rx) {
+	chan = dma_request_chan(dev, "rx");
+	if (IS_ERR(chan)) {
 		dev_dbg(dev, "cannot get the DMA channel.\n");
-		ret = -EINVAL;
+		sport->dma_chan_rx = NULL;
+		ret = PTR_ERR(chan);
 		goto err;
 	}
+	sport->dma_chan_rx = chan;
 
 	slave_config.direction = DMA_DEV_TO_MEM;
 	slave_config.src_addr = sport->port.mapbase + URXD0;
@@ -1366,12 +1369,14 @@ static int imx_uart_dma_init(struct imx_port *sport)
 	sport->rx_ring.buf = sport->rx_buf;
 
 	/* Prepare for TX : */
-	sport->dma_chan_tx = dma_request_slave_channel(dev, "tx");
-	if (!sport->dma_chan_tx) {
+	chan = dma_request_chan(dev, "tx");
+	if (IS_ERR(chan)) {
 		dev_err(dev, "cannot get the TX DMA channel!\n");
-		ret = -EINVAL;
+		sport->dma_chan_tx = NULL;
+		ret = PTR_ERR(chan);
 		goto err;
 	}
+	sport->dma_chan_tx = chan;
 
 	slave_config.direction = DMA_MEM_TO_DEV;
 	slave_config.dst_addr = sport->port.mapbase + URTX0;
-- 
2.34.1


