Return-Path: <kernel-janitors+bounces-322-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E54047F06F5
	for <lists+kernel-janitors@lfdr.de>; Sun, 19 Nov 2023 15:52:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 16C0B1C203B7
	for <lists+kernel-janitors@lfdr.de>; Sun, 19 Nov 2023 14:52:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA2A512B94;
	Sun, 19 Nov 2023 14:52:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="nr1WCNZ1"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from smtp.smtpout.orange.fr (smtp-14.smtpout.orange.fr [80.12.242.14])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4CABA11D
	for <kernel-janitors@vger.kernel.org>; Sun, 19 Nov 2023 06:52:44 -0800 (PST)
Received: from pop-os.home ([86.243.2.178])
	by smtp.orange.fr with ESMTPA
	id 4jA9ruwTOmTW54jA9rDjNP; Sun, 19 Nov 2023 15:52:42 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1700405562;
	bh=pAh5rfKWMlNtS3iglM7rvXZUQgMkHc1XA5sjN2Bujj0=;
	h=From:To:Cc:Subject:Date;
	b=nr1WCNZ17TxtLQoBclQyq/hfThLxHkEbPzeLuCWXz17pZ3yIGLXTEexG7YAO1Ykqr
	 /LNk7LDQms7vr5V7RZGWFaKhOLv1DeVys/wkB22wK5ng7xljxPxQ7yNI+AOs0CwUqo
	 BuzeFrzWCLR7m5spvt0AAugudqbH2pFKA4VA8JqUjm4f09OpsBwSD1AMxS7kSo9v0F
	 wIbgip2ykR2lE6zTJD5srTPeX9Zff+1wdEcxMIVVOe+DXn4mowsAJaaJMY3lpZTJ6z
	 PJ3xrlbJ+AHzgsEJXx6u1bSgStXLScOTflJYKrLF7MyugPVICwJIpAiuO0UE4YOpHU
	 WgvzA+/G/0pSQ==
X-ME-Helo: pop-os.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sun, 19 Nov 2023 15:52:42 +0100
X-ME-IP: 86.243.2.178
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Russell King <linux@armlinux.org.uk>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	linux-serial@vger.kernel.org
Subject: [PATCH] serial: amba-pl011: convert not to use dma_request_slave_channel()
Date: Sun, 19 Nov 2023 15:52:39 +0100
Message-Id: <6f76e22f77d776d6c1f176d56e7ee341314d8554.1700405529.git.christophe.jaillet@wanadoo.fr>
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
 drivers/tty/serial/amba-pl011.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/tty/serial/amba-pl011.c b/drivers/tty/serial/amba-pl011.c
index 61cc24cd90e4..6d7bfe9399db 100644
--- a/drivers/tty/serial/amba-pl011.c
+++ b/drivers/tty/serial/amba-pl011.c
@@ -444,9 +444,9 @@ static void pl011_dma_probe(struct uart_amba_port *uap)
 		 dma_chan_name(uap->dmatx.chan));
 
 	/* Optionally make use of an RX channel as well */
-	chan = dma_request_slave_channel(dev, "rx");
+	chan = dma_request_chan(dev, "rx");
 
-	if (!chan && plat && plat->dma_rx_param) {
+	if (IS_ERR(chan) && plat && plat->dma_rx_param) {
 		chan = dma_request_channel(mask, plat->dma_filter, plat->dma_rx_param);
 
 		if (!chan) {
@@ -455,7 +455,7 @@ static void pl011_dma_probe(struct uart_amba_port *uap)
 		}
 	}
 
-	if (chan) {
+	if (!IS_ERR(chan)) {
 		struct dma_slave_config rx_conf = {
 			.src_addr = uap->port.mapbase +
 				pl011_reg_to_offset(uap, REG_DR),
-- 
2.34.1


