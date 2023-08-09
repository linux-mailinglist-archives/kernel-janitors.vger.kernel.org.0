Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B4D58775D29
	for <lists+kernel-janitors@lfdr.de>; Wed,  9 Aug 2023 13:34:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234015AbjHILe3 (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Wed, 9 Aug 2023 07:34:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40826 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234010AbjHILe2 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 9 Aug 2023 07:34:28 -0400
Received: from mail-yw1-x1131.google.com (mail-yw1-x1131.google.com [IPv6:2607:f8b0:4864:20::1131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 291251FCE
        for <kernel-janitors@vger.kernel.org>; Wed,  9 Aug 2023 04:34:28 -0700 (PDT)
Received: by mail-yw1-x1131.google.com with SMTP id 00721157ae682-586a3159588so11907287b3.0
        for <kernel-janitors@vger.kernel.org>; Wed, 09 Aug 2023 04:34:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691580867; x=1692185667;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=zrCQCNTr7PmrFVQwXDBalv2S/rUXoounsLWJzHy5nZs=;
        b=MoHKr8BUDiCxVsI9iHGBgaZxbG8dCYCsEslVfJbIA3n1/7siRMzKno5Cc1zHSeSzad
         2ol9dYCh7bJj7YmpSthOWoqueqNbPgP/i146CnufGBj93bFfvCPNDVbxFVE04ga63NLD
         LlqGl68OCDz+JHbHYoAbRUPPemYYanf7+/XpgmMh0Ems9vkm1HG/3mV3LTL86iPcOski
         Bzo2z4PFJanjigjp9TPiDZetakq6wUCW7FS8AjmA9CuekSDfsJpUxqdQqtame9mFwA1m
         VFK/bJV5GhMP29twYqsdsuOPGWsTQYsvOKvnbjW/Go0+Jo8XqxNwIfPoc3KBIUb+VBhI
         EMRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691580867; x=1692185667;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zrCQCNTr7PmrFVQwXDBalv2S/rUXoounsLWJzHy5nZs=;
        b=FauWVix7so+2+XwXlbURRmt9H7eoHuvIFUnE4c6JA+jtJ04pn1uKz4y53Gpf8kBh86
         P4Qx1fvuSCaLsIfBQ8wJF4XeeqE3Xn251RWIpZvllKV59vTyMRYsUq9OTVS6yNiQCojz
         QDyIwQUsfy2MxDIy39Ot1safYqxW0z0n737rNqbI3FR3R4ClmP5g5JjVNWvsf3DuK1Kk
         OaNxTb0198tk+Lc42OvDNMT/X1/GDUFyoWciml5Nuj1wgfNUIRl2eQF8N8QAY4CTuLup
         0al1bkeS/zZizGk1FFMdTzo+glMmxxpeaR8xYDb0iOEaQdIGUuz0PiY3BvDTUIehbHh+
         coUQ==
X-Gm-Message-State: AOJu0Yw6AVyfK6MzRfxj5oAq3inZy9/5G7GNz3l0Q1+sbysB5Kk0bwEr
        L374D2HKc6ZBQAZUaDJD34Udc5C+vCmEJA/0dDK8MA==
X-Google-Smtp-Source: AGHT+IFBt+QKwu19ghXHub6TTlceqXVlnEQR3xuUMmLYBp9ZlvijQF3zUnRUNo5RnpNcOMkCVm3WNHD3MWIQBUJ2OWo=
X-Received: by 2002:a81:6c4f:0:b0:583:4f67:d5bd with SMTP id
 h76-20020a816c4f000000b005834f67d5bdmr2020845ywc.20.1691580867398; Wed, 09
 Aug 2023 04:34:27 -0700 (PDT)
MIME-Version: 1.0
References: <20230809071812.547229-1-harshit.m.mogalapalli@oracle.com> <20230809071812.547229-2-harshit.m.mogalapalli@oracle.com>
In-Reply-To: <20230809071812.547229-2-harshit.m.mogalapalli@oracle.com>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Wed, 9 Aug 2023 13:33:51 +0200
Message-ID: <CAPDyKFqHnHCpsi+GBAQ2vmESf17rDMGyUK+EtZbhJT5AngvmBg@mail.gmail.com>
Subject: Re: [PATCH next v2 2/2] mmc: sunplus: Fix platform_get_irq() error checking
To:     Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
Cc:     tonyhuang.sunplus@gmail.com, lhjeff911@gmail.com,
        dan.carpenter@linaro.org, arnd@arndb.de, linux-mmc@vger.kernel.org,
        linux-kernel@vger.kernel.org, error27@gmail.com,
        kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Wed, 9 Aug 2023 at 09:19, Harshit Mogalapalli
<harshit.m.mogalapalli@oracle.com> wrote:
>
> The platform_get_irq() function returns negative error codes on failure.
>
> Fixes: 4e268fed8b18 ("mmc: Add mmc driver for Sunplus SP7021")
> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> Closes: https://lore.kernel.org/all/a3829ed3-d827-4b9d-827e-9cc24a3ec3bc@moroto.mountain/
> Signed-off-by: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>

Applied for fixes and by adding a stable tag, thanks!

Kind regards
Uffe


> ---
> v1->v2: Split into two patches as they are doing different things.
>
> This is based on static analysis with smatch, only compile tested.
> ---
>  drivers/mmc/host/sunplus-mmc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/mmc/host/sunplus-mmc.c b/drivers/mmc/host/sunplus-mmc.c
> index 2bdebeb1f8e4..e9cb1a57cb75 100644
> --- a/drivers/mmc/host/sunplus-mmc.c
> +++ b/drivers/mmc/host/sunplus-mmc.c
> @@ -885,7 +885,7 @@ static int spmmc_drv_probe(struct platform_device *pdev)
>                 return dev_err_probe(&pdev->dev, PTR_ERR(host->rstc), "rst get fail\n");
>
>         host->irq = platform_get_irq(pdev, 0);
> -       if (host->irq <= 0)
> +       if (host->irq < 0)
>                 return host->irq;
>
>         ret = devm_request_threaded_irq(&pdev->dev, host->irq,
> --
> 2.39.3
>
