Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F310D4334D7
	for <lists+kernel-janitors@lfdr.de>; Tue, 19 Oct 2021 13:37:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235418AbhJSLkB (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Tue, 19 Oct 2021 07:40:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53128 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235442AbhJSLj5 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 19 Oct 2021 07:39:57 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ACD6FC061770
        for <kernel-janitors@vger.kernel.org>; Tue, 19 Oct 2021 04:37:32 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id x27so6773526lfu.5
        for <kernel-janitors@vger.kernel.org>; Tue, 19 Oct 2021 04:37:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=D5PzwEBrOldlaIz/yoBnECaUyGI46VY83yvfxIz1ZF4=;
        b=WXLTnuVzOfIvphbQT4ZFrAt0wNTFY+MOeJZN7s04aT4LzVae1rULH5dGy0LzUllzwz
         2I4HFJQR5QtcmWPoKV+r+z10l5H05Rzls7CPnkijH4T6AEiHheOanmzBjxzEQ6qUxQME
         k4oVD0v2jt2O4MWMDbs4klhoyOG7bMYoHh5YdkRVDZFUl9eE1b7WqwkPZqczaB2BDBB2
         IFs/RI6e7oQxWn2EIZdL68Snl+58JXtiGJpflTE9bgI067dDWM1naY3dh1uRG/qfmZ5+
         5Ji72Gr0JlOP1Ij/DTKFk+dzrGseMPb1EWaEFK4otMo4H4NaGZIaDuk/JgFMvPPmf7wu
         kSWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=D5PzwEBrOldlaIz/yoBnECaUyGI46VY83yvfxIz1ZF4=;
        b=vGbjMqf+wgHEWJ/OC5c9sJXB+G/esSoaxNeUzJDRmug+ACpvLkwm778ujw7yYWr259
         N/d8IpXdzonWBmqTFE4YcoKay1FcbLCmLtDRCA7X3nQOcw1yz5upHAEg3rrqyhdD7rsU
         kXUBQLvcAP/J9fZ0r7dFRPjQenhs8vUl9gq9LCQ2FFfifaamHRbXZePb3/Q71e0QqYF+
         YicMMMe5XWDsSNI1YKsw36I5CPLW6tJhNX6JH1vB6infLCmp3MuVykLDJ8111rw2qFsF
         hDwwHdKwtF6OZAWmdwAp8Lr3EoLcZtaIp/ATW+z4GehEdUpU4RkpLLNT7zotGgyV1uZ1
         T0kA==
X-Gm-Message-State: AOAM53174MQpeC5y5NxCYEhoB78xY7ibnhHqfosnlL2WC2OheD9mFk32
        GQeG9sWSs4S1LZuz1VgORI2ojl2UouEZG14WPpzZdg==
X-Google-Smtp-Source: ABdhPJxI1KBn0TsgDp3DyQqblAi01bephKSl6c86Z7+PTcABb14fvdzOS9EMLr3KRGaiG817ECkKj2j23M8q4eSma5I=
X-Received: by 2002:ac2:4293:: with SMTP id m19mr5618302lfh.254.1634643451083;
 Tue, 19 Oct 2021 04:37:31 -0700 (PDT)
MIME-Version: 1.0
References: <4aadb3c97835f7b80f00819c3d549e6130384e67.1634365151.git.christophe.jaillet@wanadoo.fr>
In-Reply-To: <4aadb3c97835f7b80f00819c3d549e6130384e67.1634365151.git.christophe.jaillet@wanadoo.fr>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Tue, 19 Oct 2021 13:36:54 +0200
Message-ID: <CAPDyKFo-ahKB8naaBFBdrCy3f_a08s_2e9FnjwOqsDc1-gWYvg@mail.gmail.com>
Subject: Re: [PATCH] mmc: mxs-mmc: disable regulator on error and in the
 remove function
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc:     Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Sascha Hauer <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        dl-linux-imx <linux-imx@nxp.com>, Chris Ball <cjb@laptop.org>,
        linux-mmc <linux-mmc@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Sat, 16 Oct 2021 at 08:21, Christophe JAILLET
<christophe.jaillet@wanadoo.fr> wrote:
>
> The 'reg_vmmc' regulator is enabled in the probe. It is never disabled.
> Neither in the error handling path of the probe nor in the remove
> function.
>
> Register a devm_action to disable it when needed.
>
> Fixes: 4dc5a79f1350 ("mmc: mxs-mmc: enable regulator for mmc slot")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  drivers/mmc/host/mxs-mmc.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/drivers/mmc/host/mxs-mmc.c b/drivers/mmc/host/mxs-mmc.c
> index 947581de7860..8c3655d3be96 100644
> --- a/drivers/mmc/host/mxs-mmc.c
> +++ b/drivers/mmc/host/mxs-mmc.c
> @@ -552,6 +552,11 @@ static const struct of_device_id mxs_mmc_dt_ids[] = {
>  };
>  MODULE_DEVICE_TABLE(of, mxs_mmc_dt_ids);
>
> +static void mxs_mmc_regulator_disable(void *regulator)
> +{
> +       regulator_disable(regulator);
> +}
> +
>  static int mxs_mmc_probe(struct platform_device *pdev)
>  {
>         struct device_node *np = pdev->dev.of_node;
> @@ -591,6 +596,11 @@ static int mxs_mmc_probe(struct platform_device *pdev)
>                                 "Failed to enable vmmc regulator: %d\n", ret);
>                         goto out_mmc_free;
>                 }
> +
> +               ret = devm_add_action_or_reset(&pdev->dev, mxs_mmc_regulator_disable,
> +                                              reg_vmmc);
> +               if (ret)
> +                       goto out_mmc_free;
>         }
>
>         ssp->clk = devm_clk_get(&pdev->dev, NULL);
> --
> 2.30.2
>
