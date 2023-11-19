Return-Path: <kernel-janitors+bounces-328-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DC3CE7F0841
	for <lists+kernel-janitors@lfdr.de>; Sun, 19 Nov 2023 19:19:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0CA581C208C8
	for <lists+kernel-janitors@lfdr.de>; Sun, 19 Nov 2023 18:19:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B55818656;
	Sun, 19 Nov 2023 18:19:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="fpRScPKM"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from smtp.smtpout.orange.fr (smtp-21.smtpout.orange.fr [80.12.242.21])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A258C2
	for <kernel-janitors@vger.kernel.org>; Sun, 19 Nov 2023 10:19:20 -0800 (PST)
Received: from pop-os.home ([86.243.2.178])
	by smtp.orange.fr with ESMTPA
	id 4mO4rHH6TKXaI4mO4rjQGZ; Sun, 19 Nov 2023 19:19:18 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1700417958;
	bh=v36kBeiXHBlulGsqm4t8mIM6WVjX9B0mFdYlDs6g1xw=;
	h=From:To:Cc:Subject:Date;
	b=fpRScPKMrqKeXhyz4MqvrhJjX0RmIUvFR0GXjoqehVAevah4egLamyLT9klwXEXNh
	 YchO1YhEoHBvQi2X5+LbfCKEkpZESWINA0hM2+e7vunj1qT513QKFJZt5Qrq9EpXFM
	 olernFTY6R99soCBz1fxdCJPjGFdJvI8VmR2ybdueCD6cESG0UhEKw0RyjgSzgzf7O
	 ceedL0Do0vtg7/Phlefjevbw7iW7ctphrG+KB1cEYmlLzGAmExaPxm3O/iW1bwWU3L
	 nwd/6WsY5PqGSrsUcGTxfHel8amSMeRxnYZ4FuepOWv6kLyR3E0d+Ly0xIAjxjWdyn
	 ASPHAaL0PMlYg==
X-ME-Helo: pop-os.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sun, 19 Nov 2023 19:19:18 +0100
X-ME-IP: 86.243.2.178
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	linux-sound@vger.kernel.org
Subject: [PATCH] ASoC: sh: convert not to use dma_request_slave_channel()
Date: Sun, 19 Nov 2023 19:19:14 +0100
Message-Id: <1a837f96f056fa3dcb02a77afa5892d40b354cb1.1700417934.git.christophe.jaillet@wanadoo.fr>
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
This patch is NOT compile tested. I've not been able to find a correct
setting so that CONFIG_SERIAL_SH_SCI_DMA is set.
---
 sound/soc/sh/fsi.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/sound/soc/sh/fsi.c b/sound/soc/sh/fsi.c
index 2ef47aa2c778..84601ba43b7d 100644
--- a/sound/soc/sh/fsi.c
+++ b/sound/soc/sh/fsi.c
@@ -1379,7 +1379,9 @@ static int fsi_dma_probe(struct fsi_priv *fsi, struct fsi_stream *io, struct dev
 	io->chan = dma_request_channel(mask, shdma_chan_filter,
 				       (void *)io->dma_id);
 #else
-	io->chan = dma_request_slave_channel(dev, is_play ? "tx" : "rx");
+	io->chan = dma_request_chan(dev, is_play ? "tx" : "rx");
+	if (IS_ERR(io->chan))
+		io->chan = NULL;
 #endif
 	if (io->chan) {
 		struct dma_slave_config cfg = {};
-- 
2.34.1


