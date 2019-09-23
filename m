Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6890CBBDCD
	for <lists+kernel-janitors@lfdr.de>; Mon, 23 Sep 2019 23:23:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2503025AbfIWVXP (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Mon, 23 Sep 2019 17:23:15 -0400
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:35152 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388117AbfIWVXP (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 23 Sep 2019 17:23:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
        Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
        List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
        List-Archive; bh=Dqx0t8oApf8vJTD+XdXWJkomG/Wt3YhGIuSXYOi8rJA=; b=kXBLMxdLEvos
        52f3fYbL0FtBMgpR09dpcZQFApPFqDWR4cpw3v78cgWpx6VhUf82MWYFAzJpgoryhWlUmPm2gIQjB
        33sUldPvjlOLdlnW1Ho+odY/fLRw6fLIuwBQmEj8Ai6ThB5D4zuK3kdQwYwyZwHtID2n8DimqlQpH
        LWrWo=;
Received: from [12.157.10.114] (helo=fitzroy.sirena.org.uk)
        by heliosphere.sirena.org.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <broonie@sirena.org.uk>)
        id 1iCVnP-0005WR-Lf; Mon, 23 Sep 2019 21:22:59 +0000
Received: by fitzroy.sirena.org.uk (Postfix, from userid 1000)
        id D95BED02FCA; Mon, 23 Sep 2019 22:22:57 +0100 (BST)
From:   Mark Brown <broonie@kernel.org>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     alsa-devel@alsa-project.org, Jaroslav Kysela <perex@perex.cz>,
        kernel-janitors@vger.kernel.org,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>
Subject: Applied "ASoC: soc-component: fix a couple missing error assignments" to the asoc tree
In-Reply-To: <20190923142257.GB31251@mwanda>
X-Patchwork-Hint: ignore
Message-Id: <20190923212257.D95BED02FCA@fitzroy.sirena.org.uk>
Date:   Mon, 23 Sep 2019 22:22:57 +0100 (BST)
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

The patch

   ASoC: soc-component: fix a couple missing error assignments

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

From 901e822b2e365dac4727e0ddffb444a2554b0a89 Mon Sep 17 00:00:00 2001
From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 23 Sep 2019 17:22:57 +0300
Subject: [PATCH] ASoC: soc-component: fix a couple missing error assignments

There were a couple places where the return value wasn't assigned so the
error handling wouldn't trigger.

Fixes: 5c0769af4caf ("ASoC: soc-dai: add snd_soc_dai_bespoke_trigger()")
Fixes: 95aef3553384 ("ASoC: soc-dai: add snd_soc_dai_trigger()")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
Link: https://lore.kernel.org/r/20190923142257.GB31251@mwanda
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/soc-pcm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index e163dde5eab1..a1b99ac57d9e 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -1070,7 +1070,7 @@ static int soc_pcm_trigger(struct snd_pcm_substream *substream, int cmd)
 			return ret;
 	}
 
-	snd_soc_dai_trigger(cpu_dai, substream, cmd);
+	ret = snd_soc_dai_trigger(cpu_dai, substream, cmd);
 	if (ret < 0)
 		return ret;
 
@@ -1097,7 +1097,7 @@ static int soc_pcm_bespoke_trigger(struct snd_pcm_substream *substream,
 			return ret;
 	}
 
-	snd_soc_dai_bespoke_trigger(cpu_dai, substream, cmd);
+	ret = snd_soc_dai_bespoke_trigger(cpu_dai, substream, cmd);
 	if (ret < 0)
 		return ret;
 
-- 
2.20.1

