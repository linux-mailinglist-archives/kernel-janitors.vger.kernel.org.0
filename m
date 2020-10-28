Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 66DB929DAD5
	for <lists+kernel-janitors@lfdr.de>; Thu, 29 Oct 2020 00:33:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390505AbgJ1XdK (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Wed, 28 Oct 2020 19:33:10 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:59477 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726859AbgJ1XdI (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 28 Oct 2020 19:33:08 -0400
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
        by youngberry.canonical.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <colin.king@canonical.com>)
        id 1kXjyy-0003ON-Nj; Wed, 28 Oct 2020 11:51:12 +0000
From:   Colin King <colin.king@canonical.com>
To:     Patrick Lai <plai@codeaurora.org>,
        Banajit Goswami <bgoswami@codeaurora.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        V Sujith Kumar Reddy <vsujithk@codeaurora.org>,
        Srinivasa Rao <srivasam@codeaurora.org>,
        alsa-devel@alsa-project.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH][next] ASoC: qcom: fix unsigned int bitwidth compared to less than zero
Date:   Wed, 28 Oct 2020 11:51:12 +0000
Message-Id: <20201028115112.109017-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The check for an error return from the call to snd_pcm_format_width
is never true as the unsigned int bitwidth can never be less than
zero. Fix this by making bitwidth an int.

Addresses-Coverity: ("Unsigned compared against 0")
Fixes: 7cb37b7bd0d3 ("ASoC: qcom: Add support for lpass hdmi driver")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 sound/soc/qcom/lpass-hdmi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/qcom/lpass-hdmi.c b/sound/soc/qcom/lpass-hdmi.c
index 172952d3a5d6..abfb8737a89f 100644
--- a/sound/soc/qcom/lpass-hdmi.c
+++ b/sound/soc/qcom/lpass-hdmi.c
@@ -24,7 +24,7 @@ static int lpass_hdmi_daiops_hw_params(struct snd_pcm_substream *substream,
 	unsigned int rate = params_rate(params);
 	unsigned int channels = params_channels(params);
 	unsigned int ret;
-	unsigned int bitwidth;
+	int bitwidth;
 	unsigned int word_length;
 	unsigned int ch_sts_buf0;
 	unsigned int ch_sts_buf1;
-- 
2.27.0

