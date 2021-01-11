Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E40372F1D7A
	for <lists+kernel-janitors@lfdr.de>; Mon, 11 Jan 2021 19:07:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390042AbhAKSGw (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Mon, 11 Jan 2021 13:06:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56208 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390040AbhAKSGv (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 11 Jan 2021 13:06:51 -0500
Received: from mail-ua1-x92d.google.com (mail-ua1-x92d.google.com [IPv6:2607:f8b0:4864:20::92d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E9925C0617A2
        for <kernel-janitors@vger.kernel.org>; Mon, 11 Jan 2021 10:06:10 -0800 (PST)
Received: by mail-ua1-x92d.google.com with SMTP id j59so131885uad.5
        for <kernel-janitors@vger.kernel.org>; Mon, 11 Jan 2021 10:06:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xJ8YDKbxR0sQku70wpmYgvX7eELSwUoWloC9fmHXNmU=;
        b=q81pozcj3Pmf2bhfGxlxs45cc6b4Bi2QA/SNd554PItVmnmZvr7dRJD6TYeMPs93I4
         vs/ynhU0C+GkVk3GXMJDmYg4vy88LUGD8M66RHqLJ8Zn71V7hNAO4GSK+Czpj63fd4Us
         rLAo6UdovtS3qpibGylZ4UzNZ6N6nHwxOhc5pW3FsDmF14bAvo29O4ZZwt0JA0A5hOdC
         WPu4Cisg73iJ9as4Znr7mYATYR2t3yZ/t21wo8Lhhz4yvrvfSm0e4hWxn1+p/HO00DQm
         uujiQGAunZIoKzQqMrb+Y/kbeo2nD8JEKaP8vV829Sql0lgY961m3ob6Nft/QdA1jOfb
         2K+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xJ8YDKbxR0sQku70wpmYgvX7eELSwUoWloC9fmHXNmU=;
        b=BB2ycOZTE9rehIl8AF7Qo8Sdx2Poh1KQ8oxUcvJfY/PeFFYIrcGJDiQ/M+LaB8VixL
         dBNLkDfdNk1FsLx17Nwn8VZ05P4btavP8WXNM7Ixf+ZUTsN1/ozNbCTSb9hE0pRX9pXS
         5Fj1auYOuEDHsJLe/FIlwkCZQWb74HNHcS5HOcDg0szxPVUxCn1ORB4ql0uydk2E2lVz
         v85nxfrcfX3MSy9jCtWHKhor0hoTc4IKU5E9VBW0eJdZZaTlo+ItD/cqfsSwvDdPM15a
         9zJCieohEIiXQKfzpQyyhfX/UE5L17sZWEZp5fHLSKL/uQFiplNX9jz9MUFWTXKhHnWm
         tptg==
X-Gm-Message-State: AOAM532L6xS2IrF4myzSF5OzSE/sJF22q8v+sxCpjsMRuJhW/LNZ95xh
        tc4cERMkLTz1bKLuiPnKFIDNI5GCh3JcsSYaKCcGNQ==
X-Google-Smtp-Source: ABdhPJxVD2cdVp2AVtGa1ryKzW4m7SdkdXsEsZoLJJ4o0s5acV7JwdRmehxkyvB93BGQZc6120EmdPQ7nwIAkb+AweY=
X-Received: by 2002:a9f:204e:: with SMTP id 72mr655260uam.19.1610388370170;
 Mon, 11 Jan 2021 10:06:10 -0800 (PST)
MIME-Version: 1.0
References: <20201209194202.54099-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20201209194202.54099-1-christophe.jaillet@wanadoo.fr>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Mon, 11 Jan 2021 19:05:32 +0100
Message-ID: <CAPDyKFqPnbig9s2h43c07c8tyDt12sFgDZFnQ+mfh=bbtdmRcg@mail.gmail.com>
Subject: Re: [PATCH] mmc: owl-mmc: Fix a resource leak in an error handling
 path and in the remove function
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc:     =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Wed, 9 Dec 2020 at 20:42, Christophe JAILLET
<christophe.jaillet@wanadoo.fr> wrote:
>
> 'dma_request_chan()' calls should be balanced by a corresponding
> 'dma_release_channel()' call.
>
> Add the missing call both in the error handling path of the probe function
> and in the remove function.
>
> Fixes: ff65ffe46d28 ("mmc: Add Actions Semi Owl SoCs SD/MMC driver")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  drivers/mmc/host/owl-mmc.c | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/mmc/host/owl-mmc.c b/drivers/mmc/host/owl-mmc.c
> index 53b81582f1af..5490962dc8e5 100644
> --- a/drivers/mmc/host/owl-mmc.c
> +++ b/drivers/mmc/host/owl-mmc.c
> @@ -640,7 +640,7 @@ static int owl_mmc_probe(struct platform_device *pdev)
>         owl_host->irq = platform_get_irq(pdev, 0);
>         if (owl_host->irq < 0) {
>                 ret = -EINVAL;
> -               goto err_free_host;
> +               goto err_release_channel;
>         }
>
>         ret = devm_request_irq(&pdev->dev, owl_host->irq, owl_irq_handler,
> @@ -648,19 +648,21 @@ static int owl_mmc_probe(struct platform_device *pdev)
>         if (ret) {
>                 dev_err(&pdev->dev, "Failed to request irq %d\n",
>                         owl_host->irq);
> -               goto err_free_host;
> +               goto err_release_channel;
>         }
>
>         ret = mmc_add_host(mmc);
>         if (ret) {
>                 dev_err(&pdev->dev, "Failed to add host\n");
> -               goto err_free_host;
> +               goto err_release_channel;
>         }
>
>         dev_dbg(&pdev->dev, "Owl MMC Controller Initialized\n");
>
>         return 0;
>
> +err_release_channel:
> +       dma_release_channel(owl_host->dma);
>  err_free_host:
>         mmc_free_host(mmc);
>
> @@ -674,6 +676,7 @@ static int owl_mmc_remove(struct platform_device *pdev)
>
>         mmc_remove_host(mmc);
>         disable_irq(owl_host->irq);
> +       dma_release_channel(owl_host->dma);
>         mmc_free_host(mmc);
>
>         return 0;
> --
> 2.27.0
>
