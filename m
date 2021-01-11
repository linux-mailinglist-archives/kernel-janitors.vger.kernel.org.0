Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A3C032F1D88
	for <lists+kernel-janitors@lfdr.de>; Mon, 11 Jan 2021 19:09:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390061AbhAKSH3 (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Mon, 11 Jan 2021 13:07:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56348 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389348AbhAKSH2 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 11 Jan 2021 13:07:28 -0500
Received: from mail-vk1-xa2e.google.com (mail-vk1-xa2e.google.com [IPv6:2607:f8b0:4864:20::a2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A0B2C0617A5
        for <kernel-janitors@vger.kernel.org>; Mon, 11 Jan 2021 10:06:16 -0800 (PST)
Received: by mail-vk1-xa2e.google.com with SMTP id a6so45575vkb.8
        for <kernel-janitors@vger.kernel.org>; Mon, 11 Jan 2021 10:06:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7rSaSXYtTxYYwGraW6wIoFcN9Tx4ZDoszxpT3cBQ0d8=;
        b=PsqDgtDluvIkHbnqK8iRlcVzhhDU4dNLs+8Ut7PCKvLva3uRThDp9DA/vcJGkWTmbU
         3VdJt9hRopVglpRijAKhO02irQRFWA1ce/A853mESG1pqf8+JdvAmo9Xl7KjVCV6QkDS
         MLXQszD8IIrZUGkdQbcM539sNcUGeHUUzPcgJti4UCnQ2XZUPk5myGDKOgeNQCo+FLSd
         n6WuS8t2TPXEUyJDCz0QWAgxIvJ7jzLFgHFvQWpZF8WFyqugntKazxyxFCAn3CZd/yVS
         C554VEFPi0t9fNL9Ln2aiskpbgDo2b2W8DMEQnT3nRlZAF59tRUWvS9kCe5f3rO1i2Gx
         Qipw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7rSaSXYtTxYYwGraW6wIoFcN9Tx4ZDoszxpT3cBQ0d8=;
        b=aQymsvm/rnpG1NjOTMJEKJHJvFniOUWu4xFyJcZ/0ZMOtHSSrJNc5kzFTsY7mJ/K2J
         RxPNGqy4bHdJNFfBIJjZpCdr5KK7S8sz85wTUuJ7hPOWDKfdorS6uDkKJ/zckII2+s0I
         zX3ZcPB5tb+oIjwSOJM1Fu0XiaJgqqPkAPoofENKGt9HvD9XRGS7EsbtOGWkCjdhUZQr
         4ujB8bCTJnasMIdyzZeB9xZ/r566J2be4gUW/4ms24v34ZI0pXcGPPwFbaazWo/fkm/j
         qvbgaaRz0VMn76AM3D64/iOFzdyp78jM30yoJ6wWT1HBB7MqopUYFNW8pgQ2m3WSIJGC
         Og9g==
X-Gm-Message-State: AOAM533Y9BpX2JF3acq4eLKU1rpWVCn53Z5o+kCWIuAN6Xt3jGPNUHFh
        d/u25oPXek3p87rlqadrrixtatRtCFk9K1zrymV1ow==
X-Google-Smtp-Source: ABdhPJz5IpKmaBI8f06AQHheAyxdA5nwONp4Xr1ZdvX4/H2yLOuhWSdmB8UEF3//it2G3/sT7yfjtU2JAMXQB6BkWhg=
X-Received: by 2002:a1f:2b58:: with SMTP id r85mr1159961vkr.6.1610388375412;
 Mon, 11 Jan 2021 10:06:15 -0800 (PST)
MIME-Version: 1.0
References: <20201217204236.163446-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20201217204236.163446-1-christophe.jaillet@wanadoo.fr>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Mon, 11 Jan 2021 19:05:36 +0100
Message-ID: <CAPDyKFq=va4qpY-GuGB_KKpeWHO8_7oMHv+P=d-8sUc_oHpvYA@mail.gmail.com>
Subject: Re: [PATCH] mmc: sdhci-sprd: Fix some resource leaks in the remove function
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc:     Adrian Hunter <adrian.hunter@intel.com>,
        Orson Zhai <orsonzhai@gmail.com>,
        Baolin Wang <baolin.wang7@gmail.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Thu, 17 Dec 2020 at 21:42, Christophe JAILLET
<christophe.jaillet@wanadoo.fr> wrote:
>
> 'sdhci_remove_host()' and 'sdhci_pltfm_free()' should be used in place of
> 'mmc_remove_host()' and 'mmc_free_host()'.
>
> This avoids some resource leaks, is more in line with the error handling
> path of the probe function, and is more consistent with other drivers.
>
> Fixes: fb8bd90f83c4 ("mmc: sdhci-sprd: Add Spreadtrum's initial host controller")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Applied for next, thanks!

Kind regards
Uffe


> ---
> Other adjustment may be needed.
> I'm not sure at all of the 0 passed to 'sdhci_remove_host()'. Some drivers
> pass 0, some have some more complicated computation.
> ---
>  drivers/mmc/host/sdhci-sprd.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/mmc/host/sdhci-sprd.c b/drivers/mmc/host/sdhci-sprd.c
> index f85171edabeb..5dc36efff47f 100644
> --- a/drivers/mmc/host/sdhci-sprd.c
> +++ b/drivers/mmc/host/sdhci-sprd.c
> @@ -708,14 +708,14 @@ static int sdhci_sprd_remove(struct platform_device *pdev)
>  {
>         struct sdhci_host *host = platform_get_drvdata(pdev);
>         struct sdhci_sprd_host *sprd_host = TO_SPRD_HOST(host);
> -       struct mmc_host *mmc = host->mmc;
>
> -       mmc_remove_host(mmc);
> +       sdhci_remove_host(host, 0);
> +
>         clk_disable_unprepare(sprd_host->clk_sdio);
>         clk_disable_unprepare(sprd_host->clk_enable);
>         clk_disable_unprepare(sprd_host->clk_2x_enable);
>
> -       mmc_free_host(mmc);
> +       sdhci_pltfm_free(pdev);
>
>         return 0;
>  }
> --
> 2.27.0
>
