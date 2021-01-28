Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 367CF307796
	for <lists+kernel-janitors@lfdr.de>; Thu, 28 Jan 2021 15:04:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231259AbhA1OCf (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Thu, 28 Jan 2021 09:02:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37094 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231148AbhA1OCe (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 28 Jan 2021 09:02:34 -0500
Received: from mail-il1-x130.google.com (mail-il1-x130.google.com [IPv6:2607:f8b0:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 014F9C061756
        for <kernel-janitors@vger.kernel.org>; Thu, 28 Jan 2021 06:01:54 -0800 (PST)
Received: by mail-il1-x130.google.com with SMTP id e7so5275512ile.7
        for <kernel-janitors@vger.kernel.org>; Thu, 28 Jan 2021 06:01:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=C80bQsEcnaePuA0JEDUFX5G4Fu9IWpgz8bhre8oY+Wk=;
        b=YJRB0NzOhuGIf7X/tpXVaLJ11JAIZH+y9CtgerkGasPD16ONKCfqbohJb2Vygv2NTn
         NnBiuE387xCBQHg6+gtLKYOMLro6+nm2Yq5+maax5YJcYItKdXE4tz9bUCO1A2uPEp/v
         daBigDPnSc/JlCr7O+/eee/TNIiYXK5tUuJ1Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=C80bQsEcnaePuA0JEDUFX5G4Fu9IWpgz8bhre8oY+Wk=;
        b=o72QQ1Ytu1Esn6itKETa4fb5Ab3kqfu0w7NkibLLdbkulHLH+QUci6yE+/g+Yisswl
         rtdlwnJbG5GxzrqsDQzMij969AKgsYbx1ThYumiRkQSqhLxVJgI/nvKUibkw2XQXC7Zh
         8hhza+JSQz6inzeXBSE8DF/P+Jw1BaHiyyrhKESzz1s1muvKm5Tfs7pR/22QZ+n9mK6J
         N76q/LfpG91W+BVGEW7JlAtSXd4E5dS99k8za0P8yNf0sMar0VPTcji/qEfPCFgund7p
         Z1EzcSCNHD3lnWjlndr+EgZSiXwZsFXACUjGWo9BkWWyoxNifD+pYIGQN5JHw9Io6HG0
         rF/w==
X-Gm-Message-State: AOAM531lFHBlckQLEvJjrwrFCRMwKFH7V7hhRA5ETyuO63G+KDk0fIys
        bn3dfXd1W5h1zv5vjmD77JQETM+8jxF9RGf5
X-Google-Smtp-Source: ABdhPJw+S9f7QQbriH0+VanQ25gTT3r/cCuU0x3w5i6SnVM3KqTJpZSJo2iu+y+DPTsl7av4x9jOQQ==
X-Received: by 2002:a92:7d14:: with SMTP id y20mr12528368ilc.196.1611842513222;
        Thu, 28 Jan 2021 06:01:53 -0800 (PST)
Received: from mail-io1-f42.google.com (mail-io1-f42.google.com. [209.85.166.42])
        by smtp.gmail.com with ESMTPSA id x7sm2541163ioa.48.2021.01.28.06.01.52
        for <kernel-janitors@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Jan 2021 06:01:52 -0800 (PST)
Received: by mail-io1-f42.google.com with SMTP id d81so5656765iof.3
        for <kernel-janitors@vger.kernel.org>; Thu, 28 Jan 2021 06:01:52 -0800 (PST)
X-Received: by 2002:a05:6602:20c9:: with SMTP id 9mr11194877ioz.51.1611842511627;
 Thu, 28 Jan 2021 06:01:51 -0800 (PST)
MIME-Version: 1.0
References: <20210128135923.638480-1-colin.king@canonical.com>
In-Reply-To: <20210128135923.638480-1-colin.king@canonical.com>
From:   Ricardo Ribalda <ribalda@chromium.org>
Date:   Thu, 28 Jan 2021 15:01:40 +0100
X-Gmail-Original-Message-ID: <CANiDSCuBc1iSLUZzP1=h912EVCyzP0XGzmemw7q5hXYdYZszTw@mail.gmail.com>
Message-ID: <CANiDSCuBc1iSLUZzP1=h912EVCyzP0XGzmemw7q5hXYdYZszTw@mail.gmail.com>
Subject: Re: [PATCH][V2][next] media: uvcvideo: Fix memory leak when
 gpiod_to_irq fails
To:     Colin King <colin.king@canonical.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        kernel-janitors@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Thanks for the fix!

On Thu, Jan 28, 2021 at 2:59 PM Colin King <colin.king@canonical.com> wrote:
>
> From: Colin Ian King <colin.king@canonical.com>
>
> Currently when the call to gpiod_to_irq fails the error return
> path does not kfree the recently allocated object 'unit'. Fix this
> swapping the order of the irq call and the allocation of unit.
>
> Thanks to Ricardo Ribalda for suggesting this fix.
>
> Addresses-Coverity: ("Resource leak")
> Fixes: 2886477ff987 ("media: uvcvideo: Implement UVC_EXT_GPIO_UNIT")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>

> ---
>
> V2: swap order of gpiod_to_irq call and allocation of unit to simplify
>     error cleanup.
>
> ---
>  drivers/media/usb/uvc/uvc_driver.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> index 1abc122a0977..f62e6cb66daf 100644
> --- a/drivers/media/usb/uvc/uvc_driver.c
> +++ b/drivers/media/usb/uvc/uvc_driver.c
> @@ -1534,10 +1534,6 @@ static int uvc_gpio_parse(struct uvc_device *dev)
>         if (IS_ERR_OR_NULL(gpio_privacy))
>                 return PTR_ERR_OR_ZERO(gpio_privacy);
>
> -       unit = uvc_alloc_entity(UVC_EXT_GPIO_UNIT, UVC_EXT_GPIO_UNIT_ID, 0, 1);
> -       if (!unit)
> -               return -ENOMEM;
> -
>         irq = gpiod_to_irq(gpio_privacy);
>         if (irq < 0) {
>                 if (irq != EPROBE_DEFER)
> @@ -1546,6 +1542,10 @@ static int uvc_gpio_parse(struct uvc_device *dev)
>                 return irq;
>         }
>
> +       unit = uvc_alloc_entity(UVC_EXT_GPIO_UNIT, UVC_EXT_GPIO_UNIT_ID, 0, 1);
> +       if (!unit)
> +               return -ENOMEM;
> +
>         unit->gpio.gpio_privacy = gpio_privacy;
>         unit->gpio.irq = irq;
>         unit->gpio.bControlSize = 1;
> --
> 2.29.2
>


-- 
Ricardo Ribalda
