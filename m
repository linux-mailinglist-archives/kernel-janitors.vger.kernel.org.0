Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2226444DB93
	for <lists+kernel-janitors@lfdr.de>; Thu, 11 Nov 2021 19:25:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234360AbhKKS2S (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Thu, 11 Nov 2021 13:28:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54144 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234434AbhKKS2P (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 11 Nov 2021 13:28:15 -0500
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F1A0C061766
        for <kernel-janitors@vger.kernel.org>; Thu, 11 Nov 2021 10:25:25 -0800 (PST)
Received: by mail-ed1-x52b.google.com with SMTP id w1so27692786edd.10
        for <kernel-janitors@vger.kernel.org>; Thu, 11 Nov 2021 10:25:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=txXLZF+9GfwagVnL9c9/R4fXHlgcGjXwIQ9SEznOgw0=;
        b=DsB69FvhZeAIbA18E5lHyHhIB+6y0QEHISA/MG0eDH6ZxBcMLGUWVQ73YJDeYYAuHw
         e6V86fgWC1PkbhMVTYclUPfSFPLWwo492vk1iDlCsBGyKY/2zadSes9BDcjIiMh/01rd
         LPCk0ucKKmeu6HPFTyXRbZ9bD/1Be5x3+UyrvsuuAv+XlPY+sXKphDeW2InKsrnoHSqe
         XgUh6JVC7DlIInCuCaKz0thozytIvWre7vRcqx25k4CO7zYNJR7ZjncGFTzqMMPWHlEu
         JQBbd/cULS7+E+9oGsIMEUZw5VX4IeNRzDW9pJqmZgopfUrOgBy6giZ0dNaaCDDd5gG5
         MGug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=txXLZF+9GfwagVnL9c9/R4fXHlgcGjXwIQ9SEznOgw0=;
        b=hE7TdKWBGDw9JnYpl5avZ+cX66KA0edgnvz4aN0Xv5w6WaXxtX07SikyHRPLxrMvmC
         FqvHoVMdCZH3u+K75pM1LXrvtUdvk8GCMSlCszWfXu6PXjXYdwxZJOTBp7V7gjJUbsVK
         8gbASTrOege8gYUCkR0gt5XGPlg0f95JHk3J+drSO8cL64LlUDxaHW8+oVY1SP+cfYA1
         WfDFaQbi0075DNUPEaSNtBCm0RrUjNWo8pgHATXY2a43nzRL78BmskzTyWoijE0YvPSN
         s5+Hc1fkHig1MJPMT3H39OE5qL9wfQBW2WXMzgbcqF3EmrtEwwi+wlQa4GP6gnV85joZ
         lAYA==
X-Gm-Message-State: AOAM533Qn+HHPytoKaXi7kavp35lZai/Qe4CuPXGsojvynEbkW8kp+P2
        53b7C0SDNWxGpmmySJQ/Kg7fwci+E6uz6+Y1MO7Drw==
X-Google-Smtp-Source: ABdhPJxFE9orYhB3+TLnpd1AnZFajEuUTnGFTtb8ntq5zjW336ZzFGuMzgIOFqm93IGf+xvcyleIp9lOGq1fKGp/DkU=
X-Received: by 2002:a05:6402:280d:: with SMTP id h13mr12768202ede.346.1636655124051;
 Thu, 11 Nov 2021 10:25:24 -0800 (PST)
MIME-Version: 1.0
References: <a4b8454f560b70cedf0e4d06275787f08d576ee5.1635964610.git.christophe.jaillet@wanadoo.fr>
In-Reply-To: <a4b8454f560b70cedf0e4d06275787f08d576ee5.1635964610.git.christophe.jaillet@wanadoo.fr>
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
Date:   Thu, 11 Nov 2021 11:25:12 -0700
Message-ID: <CANLsYkxQu1Prfg64qqWF7fRMp_rVXoL6PG1trWaX8bSNnaiY4g@mail.gmail.com>
Subject: Re: [PATCH v2] coresight: Use devm_bitmap_zalloc when applicable
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc:     Suzuki.Poulose@arm.com, mike.leach@linaro.org, leo.yan@linaro.org,
        alexander.shishkin@linux.intel.com, mcoquelin.stm32@gmail.com,
        alexandre.torgue@foss.st.com, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hi Christophe,

On Wed, 3 Nov 2021 at 12:39, Christophe JAILLET
<christophe.jaillet@wanadoo.fr> wrote:
>
> 'drvdata->chs.guaranteed' is a bitmap. So use 'devm_bitmap_kzalloc()' to
> simplify code, improve the semantic and avoid some open-coded arithmetic
> in allocator arguments.
>
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
> v1 --> v2: remove the 'guaranteed' variable to be even less verbose
> ---
>  drivers/hwtracing/coresight/coresight-stm.c | 10 +++-------
>  1 file changed, 3 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/hwtracing/coresight/coresight-stm.c b/drivers/hwtracing/coresight/coresight-stm.c
> index 58062a5a8238..bb14a3a8a921 100644
> --- a/drivers/hwtracing/coresight/coresight-stm.c
> +++ b/drivers/hwtracing/coresight/coresight-stm.c
> @@ -856,13 +856,11 @@ static int stm_probe(struct amba_device *adev, const struct amba_id *id)
>  {
>         int ret;
>         void __iomem *base;
> -       unsigned long *guaranteed;
>         struct device *dev = &adev->dev;
>         struct coresight_platform_data *pdata = NULL;
>         struct stm_drvdata *drvdata;
>         struct resource *res = &adev->res;
>         struct resource ch_res;
> -       size_t bitmap_size;
>         struct coresight_desc desc = { 0 };
>
>         desc.name = coresight_alloc_device_name(&stm_devs, dev);
> @@ -904,12 +902,10 @@ static int stm_probe(struct amba_device *adev, const struct amba_id *id)
>         else
>                 drvdata->numsp = stm_num_stimulus_port(drvdata);
>
> -       bitmap_size = BITS_TO_LONGS(drvdata->numsp) * sizeof(long);
> -
> -       guaranteed = devm_kzalloc(dev, bitmap_size, GFP_KERNEL);
> -       if (!guaranteed)
> +       drvdata->chs.guaranteed = devm_bitmap_zalloc(dev, drvdata->numsp,
> +                                                    GFP_KERNEL);
> +       if (!drvdata->chs.guaranteed)
>                 return -ENOMEM;
> -       drvdata->chs.guaranteed = guaranteed;

I will pick up this patch when -rc1 gets released.

Thanks,
Mathieu

>
>         spin_lock_init(&drvdata->spinlock);
>
> --
> 2.30.2
>
