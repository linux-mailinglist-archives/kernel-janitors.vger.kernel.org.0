Return-Path: <kernel-janitors+bounces-1394-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C00583335C
	for <lists+kernel-janitors@lfdr.de>; Sat, 20 Jan 2024 10:42:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B79D11F2218B
	for <lists+kernel-janitors@lfdr.de>; Sat, 20 Jan 2024 09:42:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 662EF8C05;
	Sat, 20 Jan 2024 09:42:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="kUTgD7yL"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from smtp.smtpout.orange.fr (smtp-25.smtpout.orange.fr [80.12.242.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC9DED502
	for <kernel-janitors@vger.kernel.org>; Sat, 20 Jan 2024 09:42:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705743746; cv=none; b=t3oKlJSAD2xvZGzp4eijN5IcBJ8Cdv2IBXW/eV1KbrJx3KgTIk8urBl+L+Z7SeDv6P+7GSjsWk+Q8vyorfaWXFFDDl6X3gwlw3QbaETFmJWCi6CPcugk97N5YKg0Oz5qK+9aJ/Pd3QbECrVPNrn7IDvIjZ6dk/4yShemdWyaMyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705743746; c=relaxed/simple;
	bh=1+N3YmtcT/VrFLO1mZria8sCoBSPBU080hcNWd3hcB8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=A5Bww2i7pLKQCOkYhBlx5ZssU+RMf4KkWjGcehNK1fA8RdQpe18rRMbTr5A0UTu0ZRR5iQuND9insyJBfHs2ySgJR1owkkZABH4eBfGNBm16gWbv94c0nnUWeukb+dYjHQOOUPIidfd3usGZFBgwd81Un/d407xPAqR20MLQUQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=kUTgD7yL; arc=none smtp.client-ip=80.12.242.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Received: from fedora.home ([92.140.202.140])
	by smtp.orange.fr with ESMTPA
	id R7rirLBJA6LbeR7rjrquA5; Sat, 20 Jan 2024 10:42:15 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1705743735;
	bh=jqkuByAneJ1tG1xwrZ5rETs0q0pFU+XkKF5W5mqRRsk=;
	h=From:To:Cc:Subject:Date;
	b=kUTgD7yLyeXMn4n1wcBXLPiynU/tLOC2Nv9PXTX52BE35qxpILX+MwppzmzvxZDW+
	 WZf7sAn5wNb7FHfuKvYgyEvZDAQ8lMyqX/qlRl1wu98svDV626XGe61Zk4Aajn3PKK
	 7y+3mDMw5nlqJ2xqs+YQI+Y3Ei/Rm72tbnnni0Cjy5IbHm2kt5PRGEYDWPpnVii5EZ
	 T/H93MbpVy+lWZrC7OSzJYFkxtzPbOIwg3ZyrEtSo/awvqmP1cb+saNd8QRLbrD6H5
	 +xOImqeUeLjEPHnW1Lq30gZ/7WSSPRYeyU+W613E6EpgJZv/ljs5b0UxMDQZVUe9e9
	 THA+q/8Zs8YwQ==
X-ME-Helo: fedora.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sat, 20 Jan 2024 10:42:15 +0100
X-ME-IP: 92.140.202.140
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	linux-sound@vger.kernel.org
Subject: [PATCH] ALSA: synth: Save a few bytes of memory when registering a 'snd_emux'
Date: Sat, 20 Jan 2024 10:42:12 +0100
Message-ID: <9e7b94c852a25ed4be5382e5e48a7dd77e8d4d1a.1705743706.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

snd_emux_register() calls pass a string literal as the 'name' parameter.

So kstrdup_const() can be used instead of kfree() to avoid a memory
allocation in such cases.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 include/sound/emux_synth.h | 2 +-
 sound/synth/emux/emux.c    | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/include/sound/emux_synth.h b/include/sound/emux_synth.h
index 1cc530434b97..3f7f365ed248 100644
--- a/include/sound/emux_synth.h
+++ b/include/sound/emux_synth.h
@@ -103,7 +103,7 @@ struct snd_emux {
 	int ports[SNDRV_EMUX_MAX_PORTS];	/* The ports for this device */
 	struct snd_emux_port *portptrs[SNDRV_EMUX_MAX_PORTS];
 	int used;	/* use counter */
-	char *name;	/* name of the device (internal) */
+	const char *name;	/* name of the device (internal) */
 	struct snd_rawmidi **vmidi;
 	struct timer_list tlist;	/* for pending note-offs */
 	int timer_active;
diff --git a/sound/synth/emux/emux.c b/sound/synth/emux/emux.c
index 0006c3ddb51d..a82af9374852 100644
--- a/sound/synth/emux/emux.c
+++ b/sound/synth/emux/emux.c
@@ -85,7 +85,7 @@ int snd_emux_register(struct snd_emux *emu, struct snd_card *card, int index, ch
 		return -EINVAL;
 
 	emu->card = card;
-	emu->name = kstrdup(name, GFP_KERNEL);
+	emu->name = kstrdup_const(name, GFP_KERNEL);
 	emu->voices = kcalloc(emu->max_voices, sizeof(struct snd_emux_voice),
 			      GFP_KERNEL);
 	if (emu->name == NULL || emu->voices == NULL)
@@ -140,7 +140,7 @@ int snd_emux_free(struct snd_emux *emu)
 	snd_emux_delete_hwdep(emu);
 	snd_sf_free(emu->sflist);
 	kfree(emu->voices);
-	kfree(emu->name);
+	kfree_const(emu->name);
 	kfree(emu);
 	return 0;
 }
-- 
2.43.0


