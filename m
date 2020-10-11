Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7CEA928A6C6
	for <lists+kernel-janitors@lfdr.de>; Sun, 11 Oct 2020 12:02:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387557AbgJKKCr (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Sun, 11 Oct 2020 06:02:47 -0400
Received: from mail2-relais-roc.national.inria.fr ([192.134.164.83]:27418 "EHLO
        mail2-relais-roc.national.inria.fr" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2387515AbgJKKCp (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sun, 11 Oct 2020 06:02:45 -0400
X-IronPort-AV: E=Sophos;i="5.77,362,1596492000"; 
   d="scan'208";a="471981618"
Received: from palace.rsr.lip6.fr (HELO palace.lip6.fr) ([132.227.105.202])
  by mail2-relais-roc.national.inria.fr with ESMTP/TLS/AES256-SHA256; 11 Oct 2020 12:02:41 +0200
From:   Julia Lawall <Julia.Lawall@inria.fr>
To:     Liam Girdwood <lgirdwood@gmail.com>
Cc:     =?UTF-8?q?Valdis=20Kl=C4=93tnieks?= <valdis.kletnieks@vt.edu>,
        Joe Perches <joe@perches.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        kernel-janitors@vger.kernel.org, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, patches@opensource.cirrus.com,
        alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/8] ASoC: wm8350: use semicolons rather than commas to separate statements
Date:   Sun, 11 Oct 2020 11:19:32 +0200
Message-Id: <1602407979-29038-2-git-send-email-Julia.Lawall@inria.fr>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1602407979-29038-1-git-send-email-Julia.Lawall@inria.fr>
References: <1602407979-29038-1-git-send-email-Julia.Lawall@inria.fr>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Replace commas with semicolons.  What is done is essentially described by
the following Coccinelle semantic patch (http://coccinelle.lip6.fr/):

// <smpl>
@@ expression e1,e2; @@
e1
-,
+;
e2
... when any
// </smpl>

Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>

---
 sound/soc/codecs/wm8350.c |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/wm8350.c b/sound/soc/codecs/wm8350.c
index a6aa212fa0c8..15d42ce3b21d 100644
--- a/sound/soc/codecs/wm8350.c
+++ b/sound/soc/codecs/wm8350.c
@@ -218,7 +218,8 @@ static void wm8350_pga_work(struct work_struct *work)
 
 	/* PGA volumes have 6 bits of resolution to ramp */
 	for (i = 0; i <= 63; i++) {
-		out1_complete = 1, out2_complete = 1;
+		out1_complete = 1;
+		out2_complete = 1;
 		if (out1->ramp != WM8350_RAMP_NONE)
 			out1_complete = wm8350_out1_ramp_step(wm8350_data);
 		if (out2->ramp != WM8350_RAMP_NONE)

