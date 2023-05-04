Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 18A6A6F4621
	for <lists+kernel-janitors@lfdr.de>; Tue,  2 May 2023 16:32:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234321AbjEBOcn (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Tue, 2 May 2023 10:32:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45838 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234146AbjEBOcm (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 2 May 2023 10:32:42 -0400
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com [IPv6:2607:f8b0:4864:20::b29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 495561B6
        for <kernel-janitors@vger.kernel.org>; Tue,  2 May 2023 07:32:41 -0700 (PDT)
Received: by mail-yb1-xb29.google.com with SMTP id 3f1490d57ef6-b983027d0faso5878388276.0
        for <kernel-janitors@vger.kernel.org>; Tue, 02 May 2023 07:32:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683037960; x=1685629960;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=i0++0+/Ug+3JSWLaIqYWRl4j9BK08vqn/6MzYdH3xVU=;
        b=lq5bCU7hkAiaR1vzgXDVSiZj3Xf23I0UFt7KFomYM+XQ7+/5ES1SK9t+BJ/546wpXg
         kcXHiRzUr3f38IUFmcCGEEwdpkGfGMg3R/g3081ynaq0wG88n1LLAQmTDe6wBQnoSMYb
         wMmc48OdYEYj0JJSwIb8oIvotyDBJfRuNCR4RYnZO0vscKYwx/Mv85mne+/wnHyhTqwt
         N2YwWhfXSWziagxEOqGANQm7e5QzOUnCBnzFvvUXIta09rOeC6C2oQmmZRVCn3Yoeccj
         HECaotp6W3M2v6H++wb8mVNdHt/31VT6VuQPBO8lrK82BDTzVKdLAOix7qtYgiKEg1LZ
         Bycg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683037960; x=1685629960;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i0++0+/Ug+3JSWLaIqYWRl4j9BK08vqn/6MzYdH3xVU=;
        b=Lrohs04DBxZfQ10wnDPWjKiXOpk3BGy9yfUgASJfF8OpWcQWahLsiF7nc55if4TdRt
         gjOiVzlTvcgqvjjcGm2EVlFCsg3I/ul3mfYikY6R4VEqM7sb2YaMYpXC34zcBtbNFuFP
         OVkjYvmWsn1t8Vv+19Xns00tKZSUKgjIYfV3M4nY45/nUAHw/XPg1CEBRaTqZEo434qS
         J1Nb1hxKKsr2s6Hcs9K9bbMV1Zwt280jjiwo0i8K6HrIbp0zumQR7UmpsKwEDebWyNao
         dZ5sZMsxl+bMrIvHJC4tjGsOmU4NSBz+udvJ5LcLTRM1AtVXxDWU5aBGUBwMmK2/Pvqi
         mNhA==
X-Gm-Message-State: AC+VfDwAost4AjEcrLWHtL4iawDQkFUlRc51SC8ZpmAC5hY+3N9B7amW
        nsIgwNcfs5a+nq+xBveLfxBB6TlpS3EAj0ch/oLEbA==
X-Google-Smtp-Source: ACHHUZ7tjnkLLgQaXdBvE5eFMPW6xkR6z/FwUQkv+DxYwSsyPxdEOseu2rsUDojNZvfE/SQmivtt+QYdkCmuFVE9TNk=
X-Received: by 2002:a25:c1c2:0:b0:b9e:8a15:753b with SMTP id
 r185-20020a25c1c2000000b00b9e8a15753bmr1235964ybf.16.1683037960504; Tue, 02
 May 2023 07:32:40 -0700 (PDT)
MIME-Version: 1.0
References: <f61599a9ef23767c2d66e5af9c975f05ef1cec6b.1682430069.git.christophe.jaillet@wanadoo.fr>
In-Reply-To: <f61599a9ef23767c2d66e5af9c975f05ef1cec6b.1682430069.git.christophe.jaillet@wanadoo.fr>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Tue, 2 May 2023 16:32:04 +0200
Message-ID: <CAPDyKFqWD+w82N5AB0CJ867nPvg4tdHWuKDx=784qSXY4K6tNA@mail.gmail.com>
Subject: Re: [PATCH] mmc: sdhci-cadence: Fix an error handling path in sdhci_cdns_probe()
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc:     Adrian Hunter <adrian.hunter@intel.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Brad Larson <blarson@amd.com>, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org, linux-mmc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Tue, 25 Apr 2023 at 15:41, Christophe JAILLET
<christophe.jaillet@wanadoo.fr> wrote:
>
> If devm_reset_control_get_optional_exclusive() fails, some resources still
> need to be released. So branch to the error handling path instead of
> returning directly.
>
> Fixes: aad53d4ee756 ("mmc: sdhci-cadence: Support mmc hardware reset")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Applied for fixes, thanks!

Kind regards
Uffe

> ---
>  drivers/mmc/host/sdhci-cadence.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/mmc/host/sdhci-cadence.c b/drivers/mmc/host/sdhci-cadence.c
> index b24aa27da50c..d2f625054689 100644
> --- a/drivers/mmc/host/sdhci-cadence.c
> +++ b/drivers/mmc/host/sdhci-cadence.c
> @@ -540,9 +540,11 @@ static int sdhci_cdns_probe(struct platform_device *pdev)
>
>         if (host->mmc->caps & MMC_CAP_HW_RESET) {
>                 priv->rst_hw = devm_reset_control_get_optional_exclusive(dev, NULL);
> -               if (IS_ERR(priv->rst_hw))
> -                       return dev_err_probe(mmc_dev(host->mmc), PTR_ERR(priv->rst_hw),
> -                                            "reset controller error\n");
> +               if (IS_ERR(priv->rst_hw)) {
> +                       ret = dev_err_probe(mmc_dev(host->mmc), PTR_ERR(priv->rst_hw),
> +                                           "reset controller error\n");
> +                       goto free;
> +               }
>                 if (priv->rst_hw)
>                         host->mmc_host_ops.card_hw_reset = sdhci_cdns_mmc_hw_reset;
>         }
> --
> 2.34.1
>
