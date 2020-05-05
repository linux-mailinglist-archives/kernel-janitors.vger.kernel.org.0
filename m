Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 42E951C546B
	for <lists+kernel-janitors@lfdr.de>; Tue,  5 May 2020 13:33:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728827AbgEELdb (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Tue, 5 May 2020 07:33:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51592 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728821AbgEELdb (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 5 May 2020 07:33:31 -0400
Received: from mail-ua1-x944.google.com (mail-ua1-x944.google.com [IPv6:2607:f8b0:4864:20::944])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E8CEDC061A10
        for <kernel-janitors@vger.kernel.org>; Tue,  5 May 2020 04:33:30 -0700 (PDT)
Received: by mail-ua1-x944.google.com with SMTP id y10so278102uao.8
        for <kernel-janitors@vger.kernel.org>; Tue, 05 May 2020 04:33:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zWH30cDTv/mW4LSsjfg5y+wdXCQ6XsUppCOM3mjB+tg=;
        b=q7g9mIEorASHM/wLjrD6CpdX2fYOHNNB5AgTPwip6/cQ+kQ1cPiKvJak2VBecomUn+
         o8f0vx2+6I/bIXUup0x8wuyAMX4CszyRiQDjrzGPvIT7iwJ8cm7GEa9rw3oc1ry88F7Z
         2Obq3qsTnnS0JBZPkoXlDrrDOVluxg9teAvIoiw5S+SO5+DAAJNVsHhlyYZN/aUZIhb/
         dVYDR15FZ+DDWdiwjP0naPJVubaXIhGsaN2GsNWkarALSgsWvZJHZwgiVn0b50yho8gq
         L6q8r8t/DnOdiYaKY/j9R0NgLm2VQ+OtpKGwhkqk0HggAwm+S+lOjhAsMHbL4Y8c05XI
         UDXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zWH30cDTv/mW4LSsjfg5y+wdXCQ6XsUppCOM3mjB+tg=;
        b=BAXhgezJduMdUSoNokW8DNmaMZ0nRAtIujjJPkXL9fyOljt3ZXfsm/rDIAHi+V3ROx
         nHgXpxWdMpaVnQsN7M5tuz80legCde0oYOEvgz7BBce7W7lwWblqylWa7EbFPNL7RAkg
         OXFrD9c84tDDB4zglIRJHZ85vrdD65dpXvuMCeOz8o3IyosI6lTxKJcVwcYEuNTXwoKa
         svXN/HVYX4CNG0AZjyiH7FcC7jxiGANXDO/B+3Tey27gGJrrzEkRLLGR49rDEMToIc8x
         35e3gRikQYiBLM4fVJ+T4veUyKtT6DjasuR7OYleMf6AqWURlUu1hQtrAkSDT0fyPh63
         e52Q==
X-Gm-Message-State: AGi0PubFwo+KjNYVMMfCMlPs5VBh6WF2qvr695RczmCasGcTCQ/NOTbT
        JMjlemeZPIR1WCtH9DFjFuQ7/TLvlUcxCVuVo7YVpQ==
X-Google-Smtp-Source: APiQypIw+v1DHRU8T/46FjpFdUD3XIrT7wwa7yHXoU2exLoWvs0Z7ug1nUhg3yF/q56vMR7Fk8tIR089tCHLe7nhqpI=
X-Received: by 2002:ab0:544a:: with SMTP id o10mr1706787uaa.15.1588678410175;
 Tue, 05 May 2020 04:33:30 -0700 (PDT)
MIME-Version: 1.0
References: <20200426202355.43055-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20200426202355.43055-1-christophe.jaillet@wanadoo.fr>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Tue, 5 May 2020 13:32:53 +0200
Message-ID: <CAPDyKFo9kSZ6nnHrq+AuP2MSNWLr=82D5vmT-Rxk3EGR8R_Yrw@mail.gmail.com>
Subject: Re: [PATCH] mmc: alcor: Fix a resource leak in an error handling path
 in 'alcor_pci_sdmmc_drv_probe()'
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc:     Daniel Drake <drake@endlessm.com>,
        Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>,
        Colin King <colin.king@canonical.com>,
        Oleksij Rempel <linux@rempel-privat.de>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Sun, 26 Apr 2020 at 22:23, Christophe JAILLET
<christophe.jaillet@wanadoo.fr> wrote:
>
> If 'devm_request_threaded_irq()' fails, resources allocated by
> 'mmc_alloc_host()' must be freed.
>
> Fixes: c5413ad815a6 ("mmc: add new Alcor Micro Cardreader SD/MMC driver")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Applied for fixes, thanks!

Kind regards
Uffe


> ---
>  drivers/mmc/host/alcor.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/mmc/host/alcor.c b/drivers/mmc/host/alcor.c
> index 1aee485d56d4..026ca9194ce5 100644
> --- a/drivers/mmc/host/alcor.c
> +++ b/drivers/mmc/host/alcor.c
> @@ -1104,7 +1104,7 @@ static int alcor_pci_sdmmc_drv_probe(struct platform_device *pdev)
>
>         if (ret) {
>                 dev_err(&pdev->dev, "Failed to get irq for data line\n");
> -               return ret;
> +               goto free_host;
>         }
>
>         mutex_init(&host->cmd_mutex);
> @@ -1116,6 +1116,10 @@ static int alcor_pci_sdmmc_drv_probe(struct platform_device *pdev)
>         dev_set_drvdata(&pdev->dev, host);
>         mmc_add_host(mmc);
>         return 0;
> +
> +free_host:
> +       mmc_free_host(mmc);
> +       return ret;
>  }
>
>  static int alcor_pci_sdmmc_drv_remove(struct platform_device *pdev)
> --
> 2.25.1
>
