Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7C9E5216722
	for <lists+kernel-janitors@lfdr.de>; Tue,  7 Jul 2020 09:16:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726933AbgGGHQD (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Tue, 7 Jul 2020 03:16:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41706 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725825AbgGGHQC (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 7 Jul 2020 03:16:02 -0400
Received: from mail-ua1-x942.google.com (mail-ua1-x942.google.com [IPv6:2607:f8b0:4864:20::942])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74963C061755
        for <kernel-janitors@vger.kernel.org>; Tue,  7 Jul 2020 00:16:02 -0700 (PDT)
Received: by mail-ua1-x942.google.com with SMTP id j21so1022207ual.11
        for <kernel-janitors@vger.kernel.org>; Tue, 07 Jul 2020 00:16:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wULRYb8hTQ3DSK0waXDTahHo3SLIrsIw0jdCnMxAKcA=;
        b=wcKWsYuJHcCaZBBYXq+uak+cU00WVu2UgYkovzrsp2rvH7fV8jVNnFn0xBKxwAF2Ae
         uWdnbQRiEK6JyTL9+FutmmrqTR3CC+lasw9LeA6aw0fQQSzkQYqjEbzn6cJbo7ptrWdQ
         xGTIzf4ImUSRJoQMT+3OMQTx5AVpNVC3uq6QieRnLDtFAvv6iql5C1xW3TRRE9H5zW/1
         TLCi3BH+Aafjz00IRsYJlvW5DyHGtm5u8uX9WfwWO32F8TishTYObMok5gWvtCg2XBjD
         eVLL9QOY7EwPrs099vYX04X/yY7hsRooQcG8m+svdn/kyzzQ4IFCc/ThOlUtXtLlZUOu
         8IYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wULRYb8hTQ3DSK0waXDTahHo3SLIrsIw0jdCnMxAKcA=;
        b=CGDjnujuINKoYIG0i9JNuRb6gL7qf1ufD0EhDAK0ST2fiJ95Hw+PloJqVJ9HqX7MYb
         sQ336YH/WWWHTbrDhp2wWXuP2xqjP5uRWyZQ9DxnGOFcYe89sDwsdcCPJ8s8i8vr/+zI
         s2NoBteOs3R5pz0qSO70MZfOJ3aYj/p118QlozI53w2Fpsy3qjnSpYKGrxex2lQBLbtd
         OnLZRnv39D+jh20pxo7dRQScovYCe6qmC61lt0aO3oyusH5pr/D2PGYEprxDaRReC6pu
         DcnLnxCoDhxdG78g4tgSujjJGqt0o/u0WsND4jnLf3EAUJZh+AO3+ClhTaYQZ+Rcz4+M
         sgmA==
X-Gm-Message-State: AOAM533vcKwCvktKvN5TeZZIR0TYn83hOJ0VTDcILbYqjGh0HHrdQ6Ob
        IZNt3Tzlo0qMtLk9GrPiOFGfVeTQJuSLdz6ayGdxiA==
X-Google-Smtp-Source: ABdhPJwMwTl3YpAgByVRV5/0CyJMIT9UexQ3ZB6gZc+BkUJfj4jbLurrY4uFc+j16UQ+IYEihjoOLDUK2mNhKiKB2zQ=
X-Received: by 2002:a9f:22e1:: with SMTP id 88mr36772869uan.19.1594106161737;
 Tue, 07 Jul 2020 00:16:01 -0700 (PDT)
MIME-Version: 1.0
References: <20200706163031.503431-1-colin.king@canonical.com>
In-Reply-To: <20200706163031.503431-1-colin.king@canonical.com>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Tue, 7 Jul 2020 09:15:25 +0200
Message-ID: <CAPDyKFqtcw+zccgR4LOPqYAs3dQ02Hu7SmpNq7aNgOs23dzJ5g@mail.gmail.com>
Subject: Re: [PATCH] mmc: dw_mmc-exynos: remove redundant initialization of
 variable 'found'
To:     Colin King <colin.king@canonical.com>
Cc:     Jaehoon Chung <jh80.chung@samsung.com>,
        Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
        kernel-janitors@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Mon, 6 Jul 2020 at 18:30, Colin King <colin.king@canonical.com> wrote:
>
> From: Colin Ian King <colin.king@canonical.com>
>
> The variable 'found' is being initialized with a value that is never read
> and it is being updated later with a new value.  The initialization is
> redundant and can be removed.
>
> Addresses-Coverity: ("Unused value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  drivers/mmc/host/dw_mmc-exynos.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/mmc/host/dw_mmc-exynos.c b/drivers/mmc/host/dw_mmc-exynos.c
> index 5e3d95b63676..99b900008a03 100644
> --- a/drivers/mmc/host/dw_mmc-exynos.c
> +++ b/drivers/mmc/host/dw_mmc-exynos.c
> @@ -472,7 +472,7 @@ static int dw_mci_exynos_execute_tuning(struct dw_mci_slot *slot, u32 opcode)
>         struct dw_mci_exynos_priv_data *priv = host->priv;
>         struct mmc_host *mmc = slot->mmc;
>         u8 start_smpl, smpl, candiates = 0;
> -       s8 found = -1;
> +       s8 found;
>         int ret = 0;
>
>         start_smpl = dw_mci_exynos_get_clksmpl(host);
> --
> 2.27.0
>
