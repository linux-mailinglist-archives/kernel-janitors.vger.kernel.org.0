Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5488CEEE3
	for <lists+kernel-janitors@lfdr.de>; Tue, 30 Apr 2019 04:56:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729952AbfD3CzF (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Mon, 29 Apr 2019 22:55:05 -0400
Received: from mail-ot1-f66.google.com ([209.85.210.66]:33125 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729949AbfD3CzE (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 29 Apr 2019 22:55:04 -0400
Received: by mail-ot1-f66.google.com with SMTP id s11so6288369otp.0
        for <kernel-janitors@vger.kernel.org>; Mon, 29 Apr 2019 19:55:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Bt+90qKJU51hc2zj+wyErRDhxM+YorzWX9KYuojMxOI=;
        b=jsqMSj9X3fRj0YFL5jSMd0EkQP21EHUJHAXMgNHmoL+P90pUJ5Sx5iIkYBdG9IbkdK
         N/lC8T5N51Scf9+lteOZqHg11GKw1Zw1YYZkwUh0XE6gQntOv49m/ZOnjnkjEK+RW4Qp
         tnmIetz6h7k7KLL9Wdf5/HtGtxljTzrhtdbO7E2Qr9Mg1BxBU+jVuNPahRgP/m8xLeCc
         2KlGk+efpxRx1HbWHj89P8m4xoTFNguyNsVSdGBmDnwIYot26G9zwYgYD2XnarsXbOib
         CPSFjAi1ahzmuZ8yTK+aPPgJIA5DsJa5OdrdOO+TDiwjuJ/0C8poIZNt+ZFf1l7Jiszz
         rgag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Bt+90qKJU51hc2zj+wyErRDhxM+YorzWX9KYuojMxOI=;
        b=ObxQzYBoDc4hRNz4chI3L3AXqdYpgRVYibXmzzUHTVSZBj7b2pC7fpv8qf5Zpa1Ktv
         wOSNvU5XET6GeA248BTrKyHyd8Zn5X6HfOSgmblp0bvU98gnjiogBOQgNSMpyxoMCKtp
         IzUWOsuzlhhjn+HXvwvHUCk7nSkwa0RfU/a7vjLCfG37bmGdfdwCoDR0mZ0UK+J8zp04
         iWTipPJkoE976DXtv6eQ8BOC6zHBYgUB3v5mHQt61borQBJh6u9wgwuXbhK6/0Fm8euw
         IxHkyri7ijk1Caqj7nx+aciH6SujY45ZKKy2krkLa/p6UG4exnkUzDmC3p/CBWmwSjsV
         KM9g==
X-Gm-Message-State: APjAAAU0lR9Jf+H7O/Z4hxRctg7V5QGUhAV5KCsEZyPbsOwoeLUe/84k
        df75TrvL58zvKSZ1GyN2El2lq3RtoYOVKrhI4ORlgA==
X-Google-Smtp-Source: APXvYqza1fSMSoBvnt0Jo4oJAm75w947jdC8tfEOFgO4J39P16MQxMTnMDONNOU7uqQ8ZQ2JCrF+Y/d3FabU0N0gWDE=
X-Received: by 2002:a05:6830:b:: with SMTP id c11mr10056069otp.281.1556592903791;
 Mon, 29 Apr 2019 19:55:03 -0700 (PDT)
MIME-Version: 1.0
References: <20190429122512.59242-1-weiyongjun1@huawei.com>
In-Reply-To: <20190429122512.59242-1-weiyongjun1@huawei.com>
From:   Baolin Wang <baolin.wang@linaro.org>
Date:   Tue, 30 Apr 2019 10:54:51 +0800
Message-ID: <CAMz4kuJtMAyjbPR0Yf_FN1fhDwSi5=0WAgD_BNEuTB5GhcTYxQ@mail.gmail.com>
Subject: Re: [PATCH -next] ASoC: sprd: Fix return value check in sprd_mcdt_probe()
To:     Wei Yongjun <weiyongjun1@huawei.com>
Cc:     Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Orson Zhai <orsonzhai@gmail.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>,
        alsa-devel@alsa-project.org, LKML <linux-kernel@vger.kernel.org>,
        kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Mon, 29 Apr 2019 at 20:15, Wei Yongjun <weiyongjun1@huawei.com> wrote:
>
> In case of error, the function devm_ioremap_resource() returns ERR_PTR()
> and never returns NULL. The NULL test in the return value check should
> be replaced with IS_ERR().
>
> Fixes: d7bff893e04f ("ASoC: sprd: Add Spreadtrum multi-channel data transfer support")
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>

Thanks for fixing my mistake.
Reviewed-by: Baolin Wang <baolin.wang@linaro.org>

> ---
>  sound/soc/sprd/sprd-mcdt.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/sound/soc/sprd/sprd-mcdt.c b/sound/soc/sprd/sprd-mcdt.c
> index 28f5e649733d..e9318d7a4810 100644
> --- a/sound/soc/sprd/sprd-mcdt.c
> +++ b/sound/soc/sprd/sprd-mcdt.c
> @@ -951,8 +951,8 @@ static int sprd_mcdt_probe(struct platform_device *pdev)
>
>         res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>         mcdt->base = devm_ioremap_resource(&pdev->dev, res);
> -       if (!mcdt->base)
> -               return -ENOMEM;
> +       if (IS_ERR(mcdt->base))
> +               return PTR_ERR(mcdt->base);
>
>         mcdt->dev = &pdev->dev;
>         spin_lock_init(&mcdt->lock);
>
>
>


-- 
Baolin Wang
Best Regards
