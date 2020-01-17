Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EF51D140E19
	for <lists+kernel-janitors@lfdr.de>; Fri, 17 Jan 2020 16:45:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729191AbgAQPo1 (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Fri, 17 Jan 2020 10:44:27 -0500
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:53712 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729108AbgAQPoW (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 17 Jan 2020 10:44:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
        Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
        List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
        List-Archive; bh=8Fd9JrGlzE97H+p1Gp47dQ7I2EhtuAf7Is5IfV90Dvo=; b=LEYYaC/4VbEt
        dMy1I46NGPyVv290D7iyYXUSukX01id+emmBuxvHngWLF3u+52RogaXqY2H53SOWeX/Vfh57YmCLn
        KawFKtpcVKRDt5jYpeUsrSJhUIFZj68lNp2j7fzbsEE4agOhRpqQ7Qs0pP1fZuqmdW0M/v8Mh4IZ6
        g9Fjw=;
Received: from fw-tnat-cam4.arm.com ([217.140.106.52] helo=fitzroy.sirena.org.uk)
        by heliosphere.sirena.org.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <broonie@sirena.org.uk>)
        id 1isTnA-0006s9-Bg; Fri, 17 Jan 2020 15:44:12 +0000
Received: by fitzroy.sirena.org.uk (Postfix, from userid 1000)
        id 0E693D02C26; Fri, 17 Jan 2020 15:44:12 +0000 (GMT)
From:   Mark Brown <broonie@kernel.org>
To:     Wei Yongjun <weiyongjun1@huawei.com>
Cc:     alsa-devel@alsa-project.org, Bard Liao <bardliao@realtek.com>,
        Jaroslav Kysela <perex@perex.cz>,
        kernel-janitors@vger.kernel.org,
        Liam Girdwood <lgirdwood@gmail.com>,
        linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>,
        Oder Chiou <oder_chiou@realtek.com>,
        Shuming Fan <shumingf@realtek.com>,
        Takashi Iwai <tiwai@suse.com>
Subject: Applied "ASoC: rt700: fix return value check in rt700_sdw_probe()" to the asoc tree
In-Reply-To: <20200115143027.94364-1-weiyongjun1@huawei.com>
Message-Id: <applied-20200115143027.94364-1-weiyongjun1@huawei.com>
X-Patchwork-Hint: ignore
Date:   Fri, 17 Jan 2020 15:44:12 +0000 (GMT)
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

The patch

   ASoC: rt700: fix return value check in rt700_sdw_probe()

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.6

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

From 20435df1c1d708b44f58da17653f2ea609aee790 Mon Sep 17 00:00:00 2001
From: Wei Yongjun <weiyongjun1@huawei.com>
Date: Wed, 15 Jan 2020 14:30:27 +0000
Subject: [PATCH] ASoC: rt700: fix return value check in rt700_sdw_probe()

In case of error, the function devm_regmap_init() returns ERR_PTR() and
never returns NULL. The NULL test in the return value check should be
replaced with IS_ERR().

Fixes: 7d2a5f9ae41e ("ASoC: rt700: add rt700 codec driver")
Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
Link: https://lore.kernel.org/r/20200115143027.94364-1-weiyongjun1@huawei.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/rt700-sdw.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/rt700-sdw.c b/sound/soc/codecs/rt700-sdw.c
index 314103601af3..a4b95425886f 100644
--- a/sound/soc/codecs/rt700-sdw.c
+++ b/sound/soc/codecs/rt700-sdw.c
@@ -460,8 +460,8 @@ static int rt700_sdw_probe(struct sdw_slave *slave,
 
 	regmap = devm_regmap_init(&slave->dev, NULL,
 		&slave->dev, &rt700_regmap);
-	if (!regmap)
-		return -EINVAL;
+	if (IS_ERR(regmap))
+		return PTR_ERR(regmap);
 
 	rt700_init(&slave->dev, sdw_regmap, regmap, slave);
 
-- 
2.20.1

