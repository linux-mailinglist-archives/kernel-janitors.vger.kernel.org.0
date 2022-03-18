Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F35994DD906
	for <lists+kernel-janitors@lfdr.de>; Fri, 18 Mar 2022 12:35:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235762AbiCRLg5 (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Fri, 18 Mar 2022 07:36:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55868 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230412AbiCRLg5 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 18 Mar 2022 07:36:57 -0400
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C5A92BB7C2
        for <kernel-janitors@vger.kernel.org>; Fri, 18 Mar 2022 04:35:38 -0700 (PDT)
Received: by mail-ed1-x535.google.com with SMTP id b24so9884469edu.10
        for <kernel-janitors@vger.kernel.org>; Fri, 18 Mar 2022 04:35:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=PvnbZcDCgkYNSLP/yg+3XNnpLOW7ZH/onRa1mY+vpE8=;
        b=c4am+y3ktiacNDRaupRCY7pgsa3Au0OGzqCZEID2LZKMaNX1+4LqPgDfMagUZcLq9L
         2fAGJ/R9klpu35iHbgT5sgghYA0Yl7eyweWBv6myoD2YFVNRNfLOmpWPEUETg0AHbzXd
         fUVHnqWbBR34bGc3NUZbFPZss3iXSXxD/nHJP1/abr9OKzu+2ThZU3y2rzWmNIbJhCtp
         BIr9w+W/cuAcaa/P2qpnrV3KT53jU/P3fehNhEndPD0MZfEbJDh+vtasFdFppmppkpAZ
         P1rXj5XDspmtiNFVuvROi0jBLzEgqsm7bIk5yOXRCoZ6+MBsfbM8ZhqlQjpzuHHz+I4R
         xaZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PvnbZcDCgkYNSLP/yg+3XNnpLOW7ZH/onRa1mY+vpE8=;
        b=S6gHbPWHhcbmfXmyMQ4l0rOE05685vgQNEKnFMO4qOdzUcjMbuLDKfUk4C58BB1pbw
         sWPHNDj/1moP4AaBfpUsdIMDPnQd3shQLmvDm/DcKXXq8CjuRxFGkxdKZvQq26oIMNfq
         jeBzg+JGSWgWjFnrVXBPG1BFwu8U0gq4Donpg46mMkk5he2gR4pUbUDIx5uZ08rh32TC
         IfFTpJmt8w9LdEoxiyoEuZWKq6VNVrB4O+xOup5RHoCbGaKwH9Dm7dOV7fFOdSQoVxFa
         VhNy3GuTrqkJsp2VpM2mltUpaYZpQm6LhJfYDTtz1BD/2YDQlqIz9Ljv/tqdMkXoN2Dl
         Up0A==
X-Gm-Message-State: AOAM5313Exb2CF4cS6EqguCNbJWk1876nDhuyzQ5q3jYQ47kuxmTzYlW
        ogqRVYzfiNXQ0qqAJnJIrOyXXjyO4cEQWCbkNtY26w==
X-Google-Smtp-Source: ABdhPJwlYfQib+cOLIidlYcjtpVcZAnKceZWAkBTEp+mhLE+Frrgy2MkVVbrdB8gu+9vVP98vk1yA0ZchvfLOtStoIc=
X-Received: by 2002:a05:6402:3715:b0:410:a415:fd95 with SMTP id
 ek21-20020a056402371500b00410a415fd95mr8991954edb.288.1647603336540; Fri, 18
 Mar 2022 04:35:36 -0700 (PDT)
MIME-Version: 1.0
References: <20220318103729.157574-22-Julia.Lawall@inria.fr>
In-Reply-To: <20220318103729.157574-22-Julia.Lawall@inria.fr>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Fri, 18 Mar 2022 12:35:25 +0100
Message-ID: <CAMRc=McwxPAe1z48HGwYDgqNc+kachZXax6GBw04nNm0ij_ftw@mail.gmail.com>
Subject: Re: [PATCH] ARM: davinci: fix typos in comments
To:     Julia Lawall <Julia.Lawall@inria.fr>
Cc:     Sekhar Nori <nsekhar@ti.com>, kernel-janitors@vger.kernel.org,
        Russell King <linux@armlinux.org.uk>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Fri, Mar 18, 2022 at 11:37 AM Julia Lawall <Julia.Lawall@inria.fr> wrote:
>
> Various spelling mistakes in comments.
> Detected with the help of Coccinelle.
>
> Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>
>
> ---
>  arch/arm/mach-davinci/board-dm355-evm.c  |    4 ++--
>  arch/arm/mach-davinci/board-dm365-evm.c  |    2 +-
>  arch/arm/mach-davinci/board-dm644x-evm.c |    2 +-
>  arch/arm/mach-davinci/devices.c          |    2 +-
>  4 files changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/arch/arm/mach-davinci/board-dm355-evm.c b/arch/arm/mach-davinci/board-dm355-evm.c
> index 3c5a9e3c128a..36983dd73904 100644
> --- a/arch/arm/mach-davinci/board-dm355-evm.c
> +++ b/arch/arm/mach-davinci/board-dm355-evm.c
> @@ -222,7 +222,7 @@ static struct v4l2_input tvp5146_inputs[] = {
>
>  /*
>   * this is the route info for connecting each input to decoder
> - * ouput that goes to vpfe. There is a one to one correspondence
> + * output that goes to vpfe. There is a one to one correspondence
>   * with tvp5146_inputs
>   */
>  static struct vpfe_route tvp5146_routes[] = {
> @@ -295,7 +295,7 @@ static struct vpbe_enc_mode_info dm355evm_enc_preset_timing[] = {
>  #define VENC_STD_ALL   (V4L2_STD_NTSC | V4L2_STD_PAL)
>
>  /*
> - * The outputs available from VPBE + ecnoders. Keep the
> + * The outputs available from VPBE + encoders. Keep the
>   * the order same as that of encoders. First those from venc followed by that
>   * from encoders. Index in the output refers to index on a particular encoder.
>   * Driver uses this index to pass it to encoder when it supports more than
> diff --git a/arch/arm/mach-davinci/board-dm365-evm.c b/arch/arm/mach-davinci/board-dm365-evm.c
> index b3bef74c982a..21cf356fcd01 100644
> --- a/arch/arm/mach-davinci/board-dm365-evm.c
> +++ b/arch/arm/mach-davinci/board-dm365-evm.c
> @@ -535,7 +535,7 @@ static struct vpbe_enc_mode_info dm365evm_enc_preset_timing[] = {
>  #define VENC_STD_ALL   (V4L2_STD_NTSC | V4L2_STD_PAL)
>
>  /*
> - * The outputs available from VPBE + ecnoders. Keep the
> + * The outputs available from VPBE + encoders. Keep the
>   * the order same as that of encoders. First those from venc followed by that
>   * from encoders. Index in the output refers to index on a particular
>   * encoder.Driver uses this index to pass it to encoder when it supports more
> diff --git a/arch/arm/mach-davinci/board-dm644x-evm.c b/arch/arm/mach-davinci/board-dm644x-evm.c
> index cce3a621eb20..1493f4a77e29 100644
> --- a/arch/arm/mach-davinci/board-dm644x-evm.c
> +++ b/arch/arm/mach-davinci/board-dm644x-evm.c
> @@ -260,7 +260,7 @@ static struct v4l2_input dm644xevm_tvp5146_inputs[] = {
>
>  /*
>   * this is the route info for connecting each input to decoder
> - * ouput that goes to vpfe. There is a one to one correspondence
> + * output that goes to vpfe. There is a one to one correspondence
>   * with tvp5146_inputs
>   */
>  static struct vpfe_route dm644xevm_tvp5146_routes[] = {
> diff --git a/arch/arm/mach-davinci/devices.c b/arch/arm/mach-davinci/devices.c
> index 849e811fade7..781a619af1e1 100644
> --- a/arch/arm/mach-davinci/devices.c
> +++ b/arch/arm/mach-davinci/devices.c
> @@ -245,7 +245,7 @@ void __init davinci_setup_mmc(int module, struct davinci_mmc_config *config)
>                         /* Power-on 3.3V IO cells */
>                         __raw_writel(0,
>                                 DAVINCI_SYSMOD_VIRT(SYSMOD_VDD3P3VPWDN));
> -                       /*Set up the pull regiter for MMC */
> +                       /*Set up the pull register for MMC */

While at it you could add a missic space.

With that:

Reviewed-by: Bartosz Golaszewski <brgl@bgdev.pl>

>                         davinci_cfg_reg(DM644X_MSTK);
>                 }
>
>
