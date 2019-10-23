Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6CDD8E1446
	for <lists+kernel-janitors@lfdr.de>; Wed, 23 Oct 2019 10:33:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390364AbfJWIc7 (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Wed, 23 Oct 2019 04:32:59 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:36451 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390020AbfJWIc6 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 23 Oct 2019 04:32:58 -0400
Received: by mail-ot1-f68.google.com with SMTP id c7so5916538otm.3
        for <kernel-janitors@vger.kernel.org>; Wed, 23 Oct 2019 01:32:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=L8bkA9mtw+vWpI8oRxFifBMw8ummqV2rsVRmeQUbBco=;
        b=viCUfLzzS1NUVQ5Tnwemu4lRHQh7rs8CcijmjomS/9Miv9Fu+1airI68eF8A8nJSyM
         546inlstZ+rsV3j10IwzBsycIFGDPHrgXpTekkK2mvUwZ8G3lCLjyeEM7EQy/lZHZhaB
         E5ZzJt4Q/pPYmawXeV71ABnjju8sA8DJIMrKRYDgXJbiwCuKZsPLIjF+dRKIDvkcbLbB
         PqQsxIkRG98Hk2GjN6zHwsA4r1gwOzIDXX1ehjEkdS0m14uNImJD2Ybj2n3J9f6LxhoR
         vIFuKY91tEAHwK1Lh0VLR3AqD94qvyZtf73j7lbvTR4BDSKOqQihceTRTuyCyrprb6I3
         jZlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=L8bkA9mtw+vWpI8oRxFifBMw8ummqV2rsVRmeQUbBco=;
        b=mtyfLU6UpoW3yJTtu3spj4sSDpiHPirwPnyLW+nv49T3zm7AmaLjh5QNDRr/b5N4NU
         6THnQk5PtOrytJbgbAD74s/tlaMUxAaGovHs7t0ci0Wc3tQg4gN1+gpizH8/DjOBK7IR
         OfuTxCfODFK1HhSntgjzUMwlYk1t5g6+xOBW5TDZbUcrBgr3CztBJYTBPT9RLJTI8Y2C
         /fR8riiDlTZFCDqkfm5VlmzRBQSvqaYDF3nt1/fziePn2eNeOvsKeXIQ1FEVk2IZVGJS
         dCNlYKaWkLT4MxFOjJY6QGQY7hpkxxPH1NQOnzp4Uj+RbZ3VDq90/dq2NcxlXisDnVe3
         kUxQ==
X-Gm-Message-State: APjAAAUq34fkAaJLdXxz1Awvjx2VhRVFQpmctWcX2z7enn1ilX7Lyz2L
        iFOBXzdPYLL7kzplzKSryfLQb3dWmBYQj7gZHqc7VQ==
X-Google-Smtp-Source: APXvYqx9C835htw9b+vjF88aUM7e4S/FRS+3eHUvwsbpuC8bReEl39lomHdHjZsPRkBvLfkVQLrdUBNmVyoQXSiyMP0=
X-Received: by 2002:a9d:7d12:: with SMTP id v18mr4103680otn.103.1571819576961;
 Wed, 23 Oct 2019 01:32:56 -0700 (PDT)
MIME-Version: 1.0
References: <20191023063103.44941-1-maowenan@huawei.com>
In-Reply-To: <20191023063103.44941-1-maowenan@huawei.com>
From:   Tzung-Bi Shih <tzungbi@google.com>
Date:   Wed, 23 Oct 2019 16:32:46 +0800
Message-ID: <CA+Px+wX7-tn-rXeKqnPtp74tU5cLxhJwF6XZ_jeQX-tnAfvO5g@mail.gmail.com>
Subject: Re: [PATCH] ASoC: mediatek: Check SND_SOC_CROS_EC_CODEC dependency
To:     Mao Wenan <maowenan@huawei.com>
Cc:     Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        =?UTF-8?B?U2h1bmxpIFdhbmcgKOeOi+mhuuWIqSk=?= 
        <shunli.wang@mediatek.com>, yuehaibing@huawei.com,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        tglx@linutronix.de, KaiChieh Chuang <kaichieh.chuang@mediatek.com>,
        ALSA development <alsa-devel@alsa-project.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Wed, Oct 23, 2019 at 2:31 PM Mao Wenan <maowenan@huawei.com> wrote:
>
> If SND_SOC_MT8183_MT6358_TS3A227E_MAX98357A=y,
> below errors can be seen:
> sound/soc/codecs/cros_ec_codec.o: In function `send_ec_host_command':
> cros_ec_codec.c:(.text+0x534): undefined reference to `cros_ec_cmd_xfer_status'
> cros_ec_codec.c:(.text+0x101c): undefined reference to `cros_ec_get_host_event'
>
> This is because it will select SND_SOC_CROS_EC_CODEC
> after commit 2cc3cd5fdc8b ("ASoC: mediatek: mt8183: support WoV"),
> but SND_SOC_CROS_EC_CODEC depends on CROS_EC.
>
> Fixes: 2cc3cd5fdc8b ("ASoC: mediatek: mt8183: support WoV")
> Signed-off-by: Mao Wenan <maowenan@huawei.com>
> ---
>  sound/soc/mediatek/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/sound/soc/mediatek/Kconfig b/sound/soc/mediatek/Kconfig
> index 8b29f39..a656d20 100644
> --- a/sound/soc/mediatek/Kconfig
> +++ b/sound/soc/mediatek/Kconfig
> @@ -125,7 +125,7 @@ config SND_SOC_MT8183_MT6358_TS3A227E_MAX98357A
>         select SND_SOC_MAX98357A
>         select SND_SOC_BT_SCO
>         select SND_SOC_TS3A227E
> -       select SND_SOC_CROS_EC_CODEC
> +       select SND_SOC_CROS_EC_CODEC if CROS_EC
>         help
>           This adds ASoC driver for Mediatek MT8183 boards
>           with the MT6358 TS3A227E MAX98357A audio codec.
> --
> 2.7.4
>

Just realized your patch seems not showing in the list
(https://mailman.alsa-project.org/pipermail/alsa-devel/2019-October/thread.html).
I have no idea why.
