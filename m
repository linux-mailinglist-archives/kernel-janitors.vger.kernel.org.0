Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D59991BF05D
	for <lists+kernel-janitors@lfdr.de>; Thu, 30 Apr 2020 08:37:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726405AbgD3GhY (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Thu, 30 Apr 2020 02:37:24 -0400
Received: from mout.web.de ([212.227.15.3]:52409 "EHLO mout.web.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726180AbgD3GhX (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 30 Apr 2020 02:37:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
        s=dbaedf251592; t=1588228569;
        bh=KZCiJelB915GdDeY6yZOiv3DCz7MnMD9XgkS3Be+SHs=;
        h=X-UI-Sender-Class:Cc:Subject:From:To:Date;
        b=r81s+PrOwfrq8uHwSz10p7Lee7zBTtHWjcUs1NFIJ0exWID8z2nOUCi81l5PIFieP
         WwUACI7MEubSKKIVJ9cbxYKBfB+eE/m5DAC3zZMnsTLdzW20veRKZSm502xYe/l796
         g1B/b8UqVSVqowIrmGF6NOZR+B00J0QlMSaxdZFY=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([93.131.175.216]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MIyeU-1jippT0iyI-00KPWR; Thu, 30
 Apr 2020 08:36:09 +0200
Cc:     linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        Jaroslav Kysela <perex@perex.cz>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>, Takashi Iwai <tiwai@suse.com>
Subject: Re: [PATCH] ASoC: mxs-saif: Add variable dev to simplify code
From:   Markus Elfring <Markus.Elfring@web.de>
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
To:     Tang Bin <tangbin@cmss.chinamobile.com>,
        Zhang Shengju <zhangshengju@cmss.chinamobile.com>,
        alsa-devel@alsa-project.org, linux-arm-kernel@lists.infradead.org
Message-ID: <a397e9c0-343c-685a-dd3f-53be09429a70@web.de>
Date:   Thu, 30 Apr 2020 08:36:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
X-Provags-ID: V03:K1:pFXJmbLz0evcvGeJgjU24her/TXjelDrCuPpmwp4KZfCHczWWO4
 Fcn2Zut66ov8Kp57rxjbt8qy/SM0Xk9G4TY2vhIGgZMnz6OrN183qHTSHZWpNigcwdXgjW1
 sdml72J1sf2//3oP9Dyj3M+6B1f4Bo/WlTlfS5SS99SRI4sVsQHRblpo6S0P6m66Pl7bjwO
 m1nrmC9OI7OA8tbaKU99g==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:jK6EbBZbMPo=:nOdHmU5SnJtTlrZ16YLujs
 jtRmq1V6HMvuuHnQN9fpvM85soOVxe+dmdS0/+sobUw68ggI+3pnym/+mzuCoauiCkMgJjz3v
 UzoOHgaMnGsfLtfJyKM1GFOIhPWnHXbieeDCPEUNX+iz51oDkg3NEYVzsDCKQ1VMswpvM8dbB
 wiDG6ByM5rbyQQNaDYW4ckp8nqoNpqU7uYcLnXPj/HMer/y+Drz//pWE5XMu6DuDxK5LqCg4M
 sgxTYQd733Jzl6bFd6LYbc8WLYHbTHqC84XpeL7dQ3BMSOBA8QF4SHL6vp+IfuNZlZfEanmRJ
 SUWHsOJ93N8QTHn0wxiMKl4jJFHpBWyikUbWTzKyvgdaHHzmC0OpGrxcdcXtdOXlM1Mq6dAgP
 mF8YS1RpCatR3a3YrWEzBwWJsZHoZ4zIthPGmnm5WJ9wXnO83wc09+HQWPZcGWxwJy7JJY7S0
 TuOgMYoYQhV9jQzJxVARQPN+7ZT7+JApeIxXdNMiVGtUSDvpXPvUi8NgwzCervpqQKRLHWD6D
 J62iQmXGmQbm2VK8uXbj86TE3sHmVv1D2VhpF50jDZUkhQ2WCCyl76z40jbyyEOIdGJlvfX1r
 FuLYsZdrMWBw1e3UeCCgET580myHthW4/36cHog7zlG3fBMoi21BYtA1GkKEEGVqqmL1t7vkE
 O9HYkdBKpmRm/OkAITodPnRKsSVox+sfX6kIILahING+6ck0vJtuei+45FEP9YSTWutEAJFZF
 vfD9+b6Gj5sRDWi1BWp/rHPrjRLXNaWXVP+YVleDJgQS2Mdx7ZAg2Dkuwf9/dWCov04lcAzpK
 +C525+o3E9a+tIvXcqPAUCp01HxMCb1n2VTQ0CIQdj9K+UBeAraGWbFIDua+TjfTSVgsBz5rM
 QV1MyW69V//ClSSdCkIvjNirkJeYsaBMYGVa1ShqI+8YtQMSVkm3SRCrG7uFRDvSMBBBYuXzL
 Cx39xL7hVypBjHKnDtQgatZJGL1w19e8wmitgqjoLl4DaUHU6g6dsa4OZHYHinY7UWmdQhy+/
 xsX4Rpn/yPlXPMLf0WFWFPGjaoDU9WHOVa1b7eUc5VdV6BPhMB7MZP8X4A6pUz4vQFNP1BxKO
 TgOv1PnNb+LslgPZBuZN3BDRy5myGqHsyG7wik7H3VDhBv2paKiVwuiqr3qACwWCM6Qvbcskl
 A+RCcRcuTA13WLvxYGcmyiWhVIszFkKkWtTleFFwIAPCgKXQnLMMeMaGt+MwdmFTQLcnVvlRZ
 5GI1x10iJRgAHi5sl
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

> Add variable 'dev' to make the code cleaner in the function
> mxs_saif_probe(). And now that the function mxs_saif_mclk_init()
> have defined the variables 'ret' as the error returned value,
> then it should be used instead in this place.

I find it clearer to integrate such source code adjustments by separate patches
together with improved commit messages.
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/submitting-patches.rst?id=1d2cc5ac6f6668cc15216d51051103c61467d7e8#n138


Would you become interested to search for similar update candidates
by the means of the semantic patch language (Coccinelle software)?

Regards,
Markus
