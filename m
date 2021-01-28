Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AF9DA3076E8
	for <lists+kernel-janitors@lfdr.de>; Thu, 28 Jan 2021 14:17:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232082AbhA1NQa (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Thu, 28 Jan 2021 08:16:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55440 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231975AbhA1NQZ (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 28 Jan 2021 08:16:25 -0500
Received: from mail-il1-x12c.google.com (mail-il1-x12c.google.com [IPv6:2607:f8b0:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6354EC0613ED
        for <kernel-janitors@vger.kernel.org>; Thu, 28 Jan 2021 05:15:45 -0800 (PST)
Received: by mail-il1-x12c.google.com with SMTP id q5so5141843ilc.10
        for <kernel-janitors@vger.kernel.org>; Thu, 28 Jan 2021 05:15:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0PGdMQ0TDu9zKtvn6673ROuE0PDK2I1RtDiboapzC8s=;
        b=VYeclZwWQhLMD104jyE9AuQ8V+//JWv8yByb4SW8/15ARDJqwMEfMQOJq/Jgo08sga
         T4mmIc8Rbk+hn3vsCN8qC3BT1i5gS/T3DE6A7PrarvCM2J7uaDbUrC8aGAz3FYlHsXWY
         HkpFQD1mDL4d9+/5813MfTpGPVepimecKh++c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0PGdMQ0TDu9zKtvn6673ROuE0PDK2I1RtDiboapzC8s=;
        b=fK9AZTGEeHLpHIDqfPy9k80CSjzpcnR2KSYSz6nBQGpIZO+LyDxyrsVaZJlwEJHCVx
         j9SOUGzk26e9EtCFDor20gDotIpfMzGrdc08lRwVa9+uLmbcGGs+6f41myLHguvlYVAy
         E4d2vZEEtvxAr9yLFXtNrO4bo3EJ7zKiTi6JSWM/XIKO4XR+YMZyWuDPnWhldbPM4FgR
         pMTrvTzH6Qh51fp8s25r0TsNKHqhJWuN+Ayy7JRDCvVGSPbnz8kOgmtcXavtsduuUKUP
         s624g9Y+zPX15OiOiOwZm+uo0ViBsWC7g3xerJ/CCQE/IEJySrvIbEewPo9m7Uiy4Q2q
         OU/A==
X-Gm-Message-State: AOAM533t+Vq5tLQo2VWh2d4m8Vubc95qK8hftgnfg7lLzAvRxhASUxAt
        7WFaEA4zBEsqZSzA4potOmNHibI3fCheb05Y
X-Google-Smtp-Source: ABdhPJx7aSWLHjXOoiBy2RbBSdthFGfXh8MIW0D0STyFCGFTnTCG1fWHLLDTZTEOaxmT8uzKz53/Jg==
X-Received: by 2002:a92:358b:: with SMTP id c11mr12661872ilf.305.1611839744726;
        Thu, 28 Jan 2021 05:15:44 -0800 (PST)
Received: from mail-io1-f43.google.com (mail-io1-f43.google.com. [209.85.166.43])
        by smtp.gmail.com with ESMTPSA id 21sm2418076iog.52.2021.01.28.05.15.42
        for <kernel-janitors@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Jan 2021 05:15:43 -0800 (PST)
Received: by mail-io1-f43.google.com with SMTP id u17so5509785iow.1
        for <kernel-janitors@vger.kernel.org>; Thu, 28 Jan 2021 05:15:42 -0800 (PST)
X-Received: by 2002:a05:6602:154e:: with SMTP id h14mr11415923iow.1.1611839742551;
 Thu, 28 Jan 2021 05:15:42 -0800 (PST)
MIME-Version: 1.0
References: <20210128131054.637715-1-colin.king@canonical.com>
In-Reply-To: <20210128131054.637715-1-colin.king@canonical.com>
From:   Ricardo Ribalda <ribalda@chromium.org>
Date:   Thu, 28 Jan 2021 14:15:31 +0100
X-Gmail-Original-Message-ID: <CANiDSCs2WrwSHdiazPhvGtnXOvtRMsaZvMUFrpE5T5cOufnPWA@mail.gmail.com>
Message-ID: <CANiDSCs2WrwSHdiazPhvGtnXOvtRMsaZvMUFrpE5T5cOufnPWA@mail.gmail.com>
Subject: Re: [PATCH][next] media: uvcvideo: Fix memory leak when gpiod_to_irq fails
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

Hi Colin

Thanks a lot for the patch. It is definitely a bug.

On Thu, Jan 28, 2021 at 2:10 PM Colin King <colin.king@canonical.com> wrote:
>
> From: Colin Ian King <colin.king@canonical.com>
>
> Currently when the call to gpiod_to_irq fails the error return
> path does not kfree the recently allocated object 'unit'. Fix this
> by kfree'ing it before returning.
>
> Addresses-Coverity: ("Resource leak")
> Fixes: 2886477ff987 ("media: uvcvideo: Implement UVC_EXT_GPIO_UNIT")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/media/usb/uvc/uvc_driver.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> index 1abc122a0977..56f867790ef1 100644
> --- a/drivers/media/usb/uvc/uvc_driver.c
> +++ b/drivers/media/usb/uvc/uvc_driver.c
> @@ -1543,6 +1543,7 @@ static int uvc_gpio_parse(struct uvc_device *dev)
>                 if (irq != EPROBE_DEFER)
>                         dev_err(&dev->udev->dev,
>                                 "No IRQ for privacy GPIO (%d)\n", irq);
> +               kfree(unit);

Wouldn't it be better to swap the order of the resource handling?

1st: gpiod_to_irq
2nd: uvc_alloc_entity

Thanks

>                 return irq;
>         }
>
> --
> 2.29.2
>


-- 
Ricardo Ribalda
