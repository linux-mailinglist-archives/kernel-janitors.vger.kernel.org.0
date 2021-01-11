Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 17D082F1D81
	for <lists+kernel-janitors@lfdr.de>; Mon, 11 Jan 2021 19:07:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390120AbhAKSHc (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Mon, 11 Jan 2021 13:07:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56366 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389777AbhAKSHb (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 11 Jan 2021 13:07:31 -0500
Received: from mail-vs1-xe2e.google.com (mail-vs1-xe2e.google.com [IPv6:2607:f8b0:4864:20::e2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2591AC0617AA
        for <kernel-janitors@vger.kernel.org>; Mon, 11 Jan 2021 10:06:21 -0800 (PST)
Received: by mail-vs1-xe2e.google.com with SMTP id s2so18653vsk.2
        for <kernel-janitors@vger.kernel.org>; Mon, 11 Jan 2021 10:06:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Hg1atIMlfVq1CP0ks7g47kbF5lVAshm+wDf+UA9H608=;
        b=ZnxO3hgYHJMFo1HJ+QXvvTvE9r0omRXacK/rY3GV4B9tu290Yt76oktPalxYMs9L7l
         yemXzNuqvelGbKVk6uyOeKYaYbki7C4cMrdzZVXZFVe+wZ5cgBlIhKP4tBPM5FcEjPD6
         5zEWM+CPY80IUO0oQYDWFksPCbOUEHJbw+CXw170EO+AazxbEuagx0RKkYu+LaeS32wd
         5YF4QPm4pDkWqAzPsYb/hDBC4q1haWES8x7PdJqAUSfr1rEloM5LKAg09bhvEj6DYbsY
         kjw0fT4M3HfmU63quHpRKpV5VDEEw49AAYVNXvzlgRrTu7UAoIw6MAyeYnlUGoLrNmKl
         N+Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Hg1atIMlfVq1CP0ks7g47kbF5lVAshm+wDf+UA9H608=;
        b=nwQynlbZD80tKBtJXjKel4ohuyG1oznpRswY+/pPP4MRH6NCVWZRDVlUZN8M45s4k9
         29C0DuN+ftjE0UA0purR6Z2oSOiFKtG1u6PxPTMcoggaiYrkrtDKsQW8jobMLkMzFFIj
         HqCaFM3GKiUQf5ucNmxKxRkwJmXlwoKXu+PZFP24NFSgwwzdsjC70XAdmYCrVjil6Wmr
         8vUJ5CjjzvqYhok79bHWFg851q8Hnxjs3a+emmVM+dLKqZiOHtzEXUo1ToFBPHsj+Qof
         4ibN2DQqmxGlrjCX83oZUlIn+gJhcKGguYnzC9xgErtL2H32WOAW0Ubuw/GsDovlGi6v
         8JqQ==
X-Gm-Message-State: AOAM533Xoj9N/sWVfIMDt1jizIjyIOR3B5YAG0y7vx8Y5rS8pEhPs2Uf
        SUjGxNGYdko3WepvH4yIQPeRBKaAcLn4NjU0UGk+Eg==
X-Google-Smtp-Source: ABdhPJytzIhVay23HpNWh/83mbi09JAvKFNGkwcFjs0CFwDbUYxfHWcfLIRVQyGOz6/yc0oV7LXjcbdS+YWrgv5pp3I=
X-Received: by 2002:a05:6102:2127:: with SMTP id f7mr861047vsg.48.1610388380405;
 Mon, 11 Jan 2021 10:06:20 -0800 (PST)
MIME-Version: 1.0
References: <20201217210922.165340-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20201217210922.165340-1-christophe.jaillet@wanadoo.fr>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Mon, 11 Jan 2021 19:05:41 +0100
Message-ID: <CAPDyKFo_dxAkUVZ0kj60OQeKoV8OeqWWQejh_NL0OcNjDLfA9Q@mail.gmail.com>
Subject: Re: [PATCH] mmc: usdhi6rol0: Fix a resource leak in the error
 handling path of the probe
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc:     Jesper Nilsson <jesper.nilsson@axis.com>,
        Lars Persson <lars.persson@axis.com>,
        Guennadi Liakhovetski <g.liakhovetski@gmx.de>,
        Chris Ball <chris@printf.net>, linux-arm-kernel@axis.com,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Thu, 17 Dec 2020 at 22:09, Christophe JAILLET
<christophe.jaillet@wanadoo.fr> wrote:
>
> A call to 'ausdhi6_dma_release()' to undo a previous call to
> 'usdhi6_dma_request()' is missing in the error handling path of the probe
> function.
>
> It is already present in the remove function.
>
> Fixes: 75fa9ea6e3c0 ("mmc: add a driver for the Renesas usdhi6rol0 SD/SDIO host controller")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  drivers/mmc/host/usdhi6rol0.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/mmc/host/usdhi6rol0.c b/drivers/mmc/host/usdhi6rol0.c
> index e2d5112d809d..615f3d008af1 100644
> --- a/drivers/mmc/host/usdhi6rol0.c
> +++ b/drivers/mmc/host/usdhi6rol0.c
> @@ -1858,10 +1858,12 @@ static int usdhi6_probe(struct platform_device *pdev)
>
>         ret = mmc_add_host(mmc);
>         if (ret < 0)
> -               goto e_clk_off;
> +               goto e_release_dma;
>
>         return 0;
>
> +e_release_dma:
> +       usdhi6_dma_release(host);
>  e_clk_off:
>         clk_disable_unprepare(host->clk);
>  e_free_mmc:
> --
> 2.27.0
>
