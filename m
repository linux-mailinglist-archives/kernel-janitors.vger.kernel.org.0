Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D8C043F6123
	for <lists+kernel-janitors@lfdr.de>; Tue, 24 Aug 2021 16:57:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238074AbhHXO6P (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Tue, 24 Aug 2021 10:58:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56240 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238078AbhHXO6O (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 24 Aug 2021 10:58:14 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C25EAC0613D9
        for <kernel-janitors@vger.kernel.org>; Tue, 24 Aug 2021 07:57:26 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id f10so31368915lfv.6
        for <kernel-janitors@vger.kernel.org>; Tue, 24 Aug 2021 07:57:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ooVGmVvjHjbzvW+YTmOJ93vbyXkdTp43IteCkyHC+AQ=;
        b=eiJOneqIBTKg4ojNsqRv0j8G6QPRp25tz1bg/b+b4VHsapKFf32Jo8qq5z6X5oTZ+d
         DXtru1MfyVLpfuzsivaJ8mIa84RPyPKM7onAJNAvT752gLx/YGrBI4CwzOoBDFyckP8V
         FStfrANgK5w7XgxWAdqSZ8HDmvOlD2cm5MxLftOz2xqfTyYeEro+TTwyiErxSxigzfqD
         XjPWhqtBs6Mn5hoqWBrlay5CZe4LMbj1S60oaCScRkcQnizVSNGJA5ona3eQWz9ng91O
         8ejLT4D3tEW38zjiRvZUuWQTV2iTBomm+HN2A3iFTrpZMWsXi9JMMTRLRhyqptHJzFRF
         ZaDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ooVGmVvjHjbzvW+YTmOJ93vbyXkdTp43IteCkyHC+AQ=;
        b=AhqF3iIwMxfcBlRs9Lk6QbLyMuc4Z4sjYdmyD6cD8wBF/PY4okvXM5dzXE2qcbeuYm
         zrtQ0DU2Tr6dFtR96qAIUy6jmdbMNVnZqSm4zqDwxFNByAlVPb7ORjA+PkJHr89TvJmx
         OKQzIrObyq+ewmbz707U7SKMK6WEacMpiptH5VxuVun3aqA++uMyC0WbNs5eFYbcuO7n
         2GnKXxXr1Bvpd/On0tVSypdaHRw8BBAAWd1NTXhs57wMN7xpKEdSheqf11vkLIwJhqBQ
         WDPRARPLwuoU0Km5rHpETN05A6QxXvEa/8D4cxKIL7g/5jrm9NM0lcUBgvDWoNZ6xOYD
         QlAw==
X-Gm-Message-State: AOAM532TaXWosTfRKMYiZkzR8bPeoawGRy2CFVuOmNwsbFw8z8T5vfoF
        yWDzPRxg6WeNfvL2EkSjbZnj+Jt/sBKox1U+EoE+3A==
X-Google-Smtp-Source: ABdhPJwcH8p6iuPCAIOwuXsc8WMgc0wI7gJo7Gp5iLEaZcr4EUA0qlkeVvcsMng4N9S6qN5N808jfK3AQpcMCpkzPaA=
X-Received: by 2002:a19:655e:: with SMTP id c30mr2010927lfj.142.1629817045202;
 Tue, 24 Aug 2021 07:57:25 -0700 (PDT)
MIME-Version: 1.0
References: <258f76acc73d5c448b9cb5dab4c39d80d517c7a9.1629580585.git.christophe.jaillet@wanadoo.fr>
In-Reply-To: <258f76acc73d5c448b9cb5dab4c39d80d517c7a9.1629580585.git.christophe.jaillet@wanadoo.fr>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Tue, 24 Aug 2021 16:56:48 +0200
Message-ID: <CAPDyKFqwwfXUwOb1xgWFm5d-79qTGtU02PHmeSnrd_uE6cUzhA@mail.gmail.com>
Subject: Re: [PATCH] memstick: r592: Change the name of the 'pci_driver'
 structure to be consistent
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc:     Maxim Levitsky <maximlevitsky@gmail.com>,
        Alex Dubov <oakad@yahoo.com>,
        linux-mmc <linux-mmc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Sat, 21 Aug 2021 at 23:17, Christophe JAILLET
<christophe.jaillet@wanadoo.fr> wrote:
>
> This driver is all about r592.
>
> Axe the reference to r852 in the 'pci_driver' structure name. This is
> likely a copy/paste typo left as is when the driver has been created.
>
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  drivers/memstick/host/r592.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/memstick/host/r592.c b/drivers/memstick/host/r592.c
> index 7ed984360349..e79a0218c492 100644
> --- a/drivers/memstick/host/r592.c
> +++ b/drivers/memstick/host/r592.c
> @@ -876,7 +876,7 @@ static SIMPLE_DEV_PM_OPS(r592_pm_ops, r592_suspend, r592_resume);
>
>  MODULE_DEVICE_TABLE(pci, r592_pci_id_tbl);
>
> -static struct pci_driver r852_pci_driver = {
> +static struct pci_driver r592_pci_driver = {
>         .name           = DRV_NAME,
>         .id_table       = r592_pci_id_tbl,
>         .probe          = r592_probe,
> @@ -884,7 +884,7 @@ static struct pci_driver r852_pci_driver = {
>         .driver.pm      = &r592_pm_ops,
>  };
>
> -module_pci_driver(r852_pci_driver);
> +module_pci_driver(r592_pci_driver);
>
>  module_param_named(enable_dma, r592_enable_dma, bool, S_IRUGO);
>  MODULE_PARM_DESC(enable_dma, "Enable usage of the DMA (default)");
> --
> 2.30.2
>
