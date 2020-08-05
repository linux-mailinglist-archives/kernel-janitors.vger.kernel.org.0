Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D95EA23C604
	for <lists+kernel-janitors@lfdr.de>; Wed,  5 Aug 2020 08:35:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728119AbgHEGfv (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Wed, 5 Aug 2020 02:35:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36546 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726915AbgHEGfv (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 5 Aug 2020 02:35:51 -0400
Received: from mail-vs1-xe43.google.com (mail-vs1-xe43.google.com [IPv6:2607:f8b0:4864:20::e43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F1BE7C061756
        for <kernel-janitors@vger.kernel.org>; Tue,  4 Aug 2020 23:35:50 -0700 (PDT)
Received: by mail-vs1-xe43.google.com with SMTP id q13so15209222vsn.9
        for <kernel-janitors@vger.kernel.org>; Tue, 04 Aug 2020 23:35:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=uonOmW36XJQH6ERBJDEiOkV/Xd83b6uQ9CuqCDqqY3Y=;
        b=GH+n5u66NGqaRx+vkyRBiGeXbsSSZ4O3O0jxZV6VWv6g7No3rQBDNZjKfgGm1P64uG
         IHxq9jDlLW2YExdnF0+opYXN/gmyU0yTwb+r0iu2Cuc3+WyBkI+bj3IXNSsP5qkIdoVN
         NL0ClJWvva8eMonEUPstSrdSNxpwHVr8FtFePPMREt5gKEVJqH42PvBgV27todjv4IrD
         bH+evmcv8RguJrJ1PI9HTbWfkeNRtJDh2Utb3IapEqurPrRvtCmzGQJ1B6X93fw2nCJm
         VDL/CksT29cmw/5gNj569aa8RwYXztrM4Xe+vaDNkbKC5zspvrdfObDpxg8UkO4NNOW8
         Qmww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=uonOmW36XJQH6ERBJDEiOkV/Xd83b6uQ9CuqCDqqY3Y=;
        b=ETPnFN1bMSzHk+6OjiPuLTAXlENgcKUAHaNZ1bfxPC7Pbty7MuOWX+piLSrDHMdsN9
         cVRbALF/UDmdcXJt7+mMcrBBBV4+m+l8xxIaat4EVJO1Cp8MQ1P0AtZJVHWppfrNGf3I
         bw3/v4tu86hIUPwbZEB9XmV70eveaEbm0EtME6yA3qYMTV5XB/hwUEJJJVFpTogmCQE+
         wnB5SjRjQWbnhbMh22u/UrMlbWn8tl+ZXJDg9BBJm/epH/sn7BTujeyFpKKjR1YK9q0e
         hXCJK8wWSHJn1mSypjtaL8DfaOiUHX6VsvAF/JoasLzuwUDAhU3gpWDONQ9SWEEnwyMm
         c3xA==
X-Gm-Message-State: AOAM533SynizW+gC1bHXr0wWdQ7wImWFOOocth2tVue+mPKjrunOgEEi
        nHtJF5gA7ZerGwnHlJARnexdKQ6JULhheDc7mb3cyQ==
X-Google-Smtp-Source: ABdhPJzEtFM13M3YwlfkPlgZ9Anpw7bZdT49Yy928V+va9TgY5SOlVUD46185T0PzyGouSiD99+VEFcRfcjbSdapqT4=
X-Received: by 2002:a67:e45:: with SMTP id 66mr866561vso.191.1596609350177;
 Tue, 04 Aug 2020 23:35:50 -0700 (PDT)
MIME-Version: 1.0
References: <20200714141410.GB314989@mwanda>
In-Reply-To: <20200714141410.GB314989@mwanda>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Wed, 5 Aug 2020 08:35:13 +0200
Message-ID: <CAPDyKFp6PBT4h+pwv2fzifvDFtngOSoTZ+-KwJXuUA3qU0VY2Q@mail.gmail.com>
Subject: Re: [PATCH] mmc: sdhci: Fix a potential uninitialized variable
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Adrian Hunter <adrian.hunter@intel.com>,
        Veerabhadrarao Badiganti <vbadigan@codeaurora.org>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Tue, 14 Jul 2020 at 16:14, Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> Smatch complains that "ret" can be used without being initialized.
>
> drivers/mmc/host/sdhci.c
>   4383          if (!IS_ERR(mmc->supply.vqmmc)) {
>   4384                  if (enable_vqmmc) {
>                             ^^^^^^^^^^^^
>   4385                          ret = regulator_enable(mmc->supply.vqmmc);
>                                 ^^^^^
>   4386                          host->sdhci_core_to_disable_vqmmc = !ret;
>   4387                  }
>
> "ret" is only initialized when "enable_vqmmc" is true.
>
> Fixes: b13099a4dea6 ("mmc: sdhci: Fix potential null pointer access while accessing vqmmc")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied for next (a while ago), thanks!
Kind regards
Uffe



> ---
>  drivers/mmc/host/sdhci.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/mmc/host/sdhci.c b/drivers/mmc/host/sdhci.c
> index 8db06da55602..3ad394b40eb1 100644
> --- a/drivers/mmc/host/sdhci.c
> +++ b/drivers/mmc/host/sdhci.c
> @@ -4104,7 +4104,7 @@ int sdhci_setup_host(struct sdhci_host *host)
>         unsigned int ocr_avail;
>         unsigned int override_timeout_clk;
>         u32 max_clk;
> -       int ret;
> +       int ret = 0;
>         bool enable_vqmmc = false;
>
>         WARN_ON(host == NULL);
> --
> 2.27.0
>
