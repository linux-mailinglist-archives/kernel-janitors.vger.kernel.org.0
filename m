Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3172E775A75
	for <lists+kernel-janitors@lfdr.de>; Wed,  9 Aug 2023 13:08:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233190AbjHILIi (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Wed, 9 Aug 2023 07:08:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47344 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233182AbjHILIh (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 9 Aug 2023 07:08:37 -0400
Received: from mail-yw1-x1129.google.com (mail-yw1-x1129.google.com [IPv6:2607:f8b0:4864:20::1129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D6D611724
        for <kernel-janitors@vger.kernel.org>; Wed,  9 Aug 2023 04:08:36 -0700 (PDT)
Received: by mail-yw1-x1129.google.com with SMTP id 00721157ae682-579de633419so65466717b3.3
        for <kernel-janitors@vger.kernel.org>; Wed, 09 Aug 2023 04:08:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691579316; x=1692184116;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=lFOUEDGDfnO6FgesixYMbqfbNJGm4+REhXT9PFqBZFw=;
        b=sN3Bjk9MMzThJz+d2fP+SCRGKYstwupZu4+xtUswcVVDr1aGRsPt2b4JDKwZ6bdQD1
         zj1vKtGoI2f0QY8xhbIDtS/S1YYLimgbbj6UpdTBRDOVxP0NhmfcUJw3KCB+A8oCxBgc
         DELXJa4x+NWhB5TyqzPYxVDcNBMwyctYsbRVjz00jvo2GYMDkIeRQ7YHrEfEZobpZqC9
         1MsIjtQ4CXIpUvPDSnmLuvSPED3K7OcRv6Ax9RoJwxmcg6tit1p9VKKdQuIsMWU5WWj5
         UKg+m67k66XJ1z8E2GKliTzhPBc7rLztCFLKMvPFY/FazBeU3YT7t3upj7UVvecBNGQv
         th1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691579316; x=1692184116;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lFOUEDGDfnO6FgesixYMbqfbNJGm4+REhXT9PFqBZFw=;
        b=aR4E3F9KtiHnlP/yxC9RXamRNch1wgvi3uVevHw46ZKAJzzDsXraaOXvh3G0T9KqBS
         qPjBOO/UBWYxctTymVLKVH9XbvL8Sf2yIp364ggn+Fjae0n47oYR6apo4Dp2nU9wV+6F
         qfKFoMm6FOpJpYnwTpTLCk4vHRgPTkhEvBmd3m/K1VliKI6zmelBjuzuT40As0E+fDt+
         4V4CLkEwDYBLMFYkT2UzoGDV94ipSGT+27q/Ow74d7nJJOpKEjtvsLh+j3EDoGFDBTAl
         oKsWYpvQhiFW0Oux9R/hXq3ubG7NRJk/JjI9RYyVwUaPuGklcUIMNe2fkcWx5ToU0VFG
         JJ8g==
X-Gm-Message-State: AOJu0YyF/MlV9eE3xjLqORWoY+hDdctgyFh8VedXP2j1pMhM4P0VVngD
        Y9eVlxQSmn7x3vrgegVYX09JXRSygvgNo5fSqOS+Og==
X-Google-Smtp-Source: AGHT+IGXZvc0nxLvJQpMtI9VDNoLiiLmHzs1jY0vww3PJij+qW2rMhBTktgwiRk2RJaMxh85O3Qrq6BiC/EuDSR8SC8=
X-Received: by 2002:a25:d383:0:b0:d37:d0f4:f0b2 with SMTP id
 e125-20020a25d383000000b00d37d0f4f0b2mr2599136ybf.19.1691579316090; Wed, 09
 Aug 2023 04:08:36 -0700 (PDT)
MIME-Version: 1.0
References: <20230809071812.547229-1-harshit.m.mogalapalli@oracle.com>
In-Reply-To: <20230809071812.547229-1-harshit.m.mogalapalli@oracle.com>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Wed, 9 Aug 2023 13:08:00 +0200
Message-ID: <CAPDyKFrstv47OdXeFvSArKwAh40Lq=JXLYfbd8LNCOwAT=b5Cw@mail.gmail.com>
Subject: Re: [PATCH next v2 1/2] mmc: sunplus: Fix error handling in spmmc_drv_probe()
To:     Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
Cc:     tonyhuang.sunplus@gmail.com, lhjeff911@gmail.com,
        dan.carpenter@linaro.org, arnd@arndb.de, linux-mmc@vger.kernel.org,
        linux-kernel@vger.kernel.org, error27@gmail.com,
        kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Wed, 9 Aug 2023 at 09:18, Harshit Mogalapalli
<harshit.m.mogalapalli@oracle.com> wrote:
>
> When mmc allocation succeeds, the error paths are not freeing mmc.
>
> Fix the above issue by changing mmc_alloc_host() to devm_mmc_alloc_host()
> to simplify the error handling. Remove label 'probe_free_host' as devm_*
> api takes care of freeing, also remove mmc_free_host() from remove
> function as devm_* takes care of freeing.
>
> Fixes: 4e268fed8b18 ("mmc: Add mmc driver for Sunplus SP7021")
> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> Closes: https://lore.kernel.org/all/a3829ed3-d827-4b9d-827e-9cc24a3ec3bc@moroto.mountain/
> Signed-off-by: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>

This doesn't apply on my next branch, please rebase it.

Moreover, it looks like you should replace a few more "goto
probe_free_host;" with "return ret;". Please have a closer look.

Kind regards
Uffe

> ---
> This is based on static analysis with smatch, only compile tested.
>
> v1->v2: Simplify code by using devm_mmc_alloc_host() instead of
> mmc_alloc_host() (Ulf Hansson's suggestion)
> ---
>  drivers/mmc/host/sunplus-mmc.c | 14 +++-----------
>  1 file changed, 3 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/mmc/host/sunplus-mmc.c b/drivers/mmc/host/sunplus-mmc.c
> index a55a87f64d2a..2bdebeb1f8e4 100644
> --- a/drivers/mmc/host/sunplus-mmc.c
> +++ b/drivers/mmc/host/sunplus-mmc.c
> @@ -863,11 +863,9 @@ static int spmmc_drv_probe(struct platform_device *pdev)
>         struct spmmc_host *host;
>         int ret = 0;
>
> -       mmc = mmc_alloc_host(sizeof(*host), &pdev->dev);
> -       if (!mmc) {
> -               ret = -ENOMEM;
> -               goto probe_free_host;
> -       }
> +       mmc = devm_mmc_alloc_host(&pdev->dev, sizeof(struct spmmc_host));
> +       if (!mmc)
> +               return -ENOMEM;
>
>         host = mmc_priv(mmc);
>         host->mmc = mmc;
> @@ -938,11 +936,6 @@ static int spmmc_drv_probe(struct platform_device *pdev)
>
>  clk_disable:
>         clk_disable_unprepare(host->clk);
> -
> -probe_free_host:
> -       if (mmc)
> -               mmc_free_host(mmc);
> -
>         return ret;
>  }
>
> @@ -956,7 +949,6 @@ static int spmmc_drv_remove(struct platform_device *dev)
>         pm_runtime_put_noidle(&dev->dev);
>         pm_runtime_disable(&dev->dev);
>         platform_set_drvdata(dev, NULL);
> -       mmc_free_host(host->mmc);
>
>         return 0;
>  }
> --
> 2.39.3
>
