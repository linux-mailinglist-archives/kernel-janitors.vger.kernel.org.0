Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A2F009F3A7
	for <lists+kernel-janitors@lfdr.de>; Tue, 27 Aug 2019 21:59:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731412AbfH0T6t (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Tue, 27 Aug 2019 15:58:49 -0400
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:49106 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731247AbfH0T6t (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 27 Aug 2019 15:58:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
        Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
        List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
        List-Archive; bh=Z4B62Rk/JMSGgsuF34/JSBkYZVjMAerIvx/5tvsYHFg=; b=G2ligliOmrXs
        YZWZd3Hou4ZJCouG3bc9CcHFsBFJJlm3IF5oK/kAuakkc9bDNmUli4Dg1q9cj2+TP1XF2jc+QfRgc
        raOsoGrNgiR0zQtk1+ODkdl6VZ/0l/5GzOHVJY3F6HMJy2YZ9ilrfxKkvi79IVfzPLUqujlH6znll
        uixJc=;
Received: from 188.28.18.107.threembb.co.uk ([188.28.18.107] helo=fitzroy.sirena.org.uk)
        by heliosphere.sirena.org.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <broonie@sirena.org.uk>)
        id 1i2hbY-0001CU-J2; Tue, 27 Aug 2019 19:58:12 +0000
Received: by fitzroy.sirena.org.uk (Postfix, from userid 1000)
        id 443E9D02CE8; Tue, 27 Aug 2019 20:58:10 +0100 (BST)
From:   Mark Brown <broonie@kernel.org>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     alsa-devel@alsa-project.org, Daniel Baluta <daniel.baluta@nxp.com>,
        Fabio Estevam <festevam@gmail.com>,
        Jaroslav Kysela <perex@perex.cz>,
        kernel-janitors@vger.kernel.org,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        NXP Linux Team <linux-imx@nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>, Takashi Iwai <tiwai@suse.com>
Subject: Applied "ASoC: SOF: imx8: Fix an is IS_ERR() vs NULL check" to the asoc tree
In-Reply-To: <20190826131855.GA6840@mwanda>
X-Patchwork-Hint: ignore
Message-Id: <20190827195810.443E9D02CE8@fitzroy.sirena.org.uk>
Date:   Tue, 27 Aug 2019 20:58:10 +0100 (BST)
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

The patch

   ASoC: SOF: imx8: Fix an is IS_ERR() vs NULL check

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.4

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.  

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

From a325c7bc3a92f1d5ba8cff10d7ab93a989cdeb80 Mon Sep 17 00:00:00 2001
From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 26 Aug 2019 16:18:55 +0300
Subject: [PATCH] ASoC: SOF: imx8: Fix an is IS_ERR() vs NULL check

The device_link_add() function only returns NULL on error, it doesn't
return error pointers.

Fixes: 202acc565a1f ("ASoC: SOF: imx: Add i.MX8 HW support")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
Link: https://lore.kernel.org/r/20190826131855.GA6840@mwanda
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/sof/imx/imx8.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/sof/imx/imx8.c b/sound/soc/sof/imx/imx8.c
index c9d849ced54a..2a22b18e5ec0 100644
--- a/sound/soc/sof/imx/imx8.c
+++ b/sound/soc/sof/imx/imx8.c
@@ -227,8 +227,8 @@ static int imx8_probe(struct snd_sof_dev *sdev)
 						DL_FLAG_STATELESS |
 						DL_FLAG_PM_RUNTIME |
 						DL_FLAG_RPM_ACTIVE);
-		if (IS_ERR(priv->link[i])) {
-			ret = PTR_ERR(priv->link[i]);
+		if (!priv->link[i]) {
+			ret = -ENOMEM;
 			dev_pm_domain_detach(priv->pd_dev[i], false);
 			goto exit_unroll_pm;
 		}
-- 
2.20.1

