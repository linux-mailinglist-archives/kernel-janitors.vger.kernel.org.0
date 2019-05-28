Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6CC3D2C994
	for <lists+kernel-janitors@lfdr.de>; Tue, 28 May 2019 17:07:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727026AbfE1PHH (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Tue, 28 May 2019 11:07:07 -0400
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:42758 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726439AbfE1PHF (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 28 May 2019 11:07:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
        Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
        List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
        List-Archive; bh=fVgcuqF7q19syIEOumZgng3f1f8DLd588A3MOka13os=; b=x1Mm+kz2fvrr
        s2jvA/MfeLVJ/A6vI7LN1JF9Q2WxT5/NP0KM4niu4d8o36srAbLODy1CQL4KlKOePovMfKsl2zVTx
        UU2Xb4aw7XoU0vAQfE/WdpZ0P+v872PfwYeN/rl0yMI2BTaPkRbJj+vcXVwFnPJE2f1j01e/60x9R
        eui5I=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net ([82.37.168.47] helo=finisterre.sirena.org.uk)
        by heliosphere.sirena.org.uk with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <broonie@sirena.org.uk>)
        id 1hVdgl-0002ne-Gh; Tue, 28 May 2019 15:06:55 +0000
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
        id CCB04440046; Tue, 28 May 2019 16:06:54 +0100 (BST)
From:   Mark Brown <broonie@kernel.org>
To:     Colin Ian King <colin.king@canonical.com>
Cc:     alsa-devel@alsa-project.org, Jaroslav Kysela <perex@perex.cz>,
        kernel-janitors@vger.kernel.org,
        Liam Girdwood <lgirdwood@gmail.com>,
        linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>,
        Takashi Iwai <tiwai@suse.com>
Subject: Applied "ASoC: cx2072x: fix spelling mistake "configued" -> "configured"" to the asoc tree
In-Reply-To: <20190525203244.7829-1-colin.king@canonical.com>
X-Patchwork-Hint: ignore
Message-Id: <20190528150654.CCB04440046@finisterre.sirena.org.uk>
Date:   Tue, 28 May 2019 16:06:54 +0100 (BST)
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

The patch

   ASoC: cx2072x: fix spelling mistake "configued" -> "configured"

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.3

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

From 9aa37874d1930da139a08f4db1eff5d305f2ddc8 Mon Sep 17 00:00:00 2001
From: Colin Ian King <colin.king@canonical.com>
Date: Sat, 25 May 2019 21:32:44 +0100
Subject: [PATCH] ASoC: cx2072x: fix spelling mistake "configued" ->
 "configured"

There is a spelling mistake in a dev_err error message. Fit it.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
Reviewed-by: Takashi Iwai <tiwai@suse.de>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/cx2072x.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/cx2072x.c b/sound/soc/codecs/cx2072x.c
index ed762546eaee..8b0830854bb3 100644
--- a/sound/soc/codecs/cx2072x.c
+++ b/sound/soc/codecs/cx2072x.c
@@ -933,7 +933,7 @@ static int cx2072x_hw_params(struct snd_pcm_substream *substream,
 		return frame_size;
 
 	if (cx2072x->mclk_rate == 0) {
-		dev_err(dev, "Master clock rate is not configued\n");
+		dev_err(dev, "Master clock rate is not configured\n");
 		return -EINVAL;
 	}
 
-- 
2.20.1

