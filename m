Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0CC205048D
	for <lists+kernel-janitors@lfdr.de>; Mon, 24 Jun 2019 10:29:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727885AbfFXI3r (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Mon, 24 Jun 2019 04:29:47 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:35841 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726700AbfFXI3r (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 24 Jun 2019 04:29:47 -0400
Received: by mail-ot1-f67.google.com with SMTP id r6so12675491oti.3
        for <kernel-janitors@vger.kernel.org>; Mon, 24 Jun 2019 01:29:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=ko8aLEfz7VyLjGG2Rud4lWnzC784JMvOo3wvqWrCylY=;
        b=O27JYQHjrIVYtYPY96KP6/xDcPJQgEaFAHlXqjg5fywCA5MavXzZsPvV4g/C96xkrp
         u1113gVP75+1RepfG5TcDqwYMHtYYYaUOz8HYL5rsvLX9ka2UI9dPqkCf4WQ/XUqDNrH
         03oTYPII0Gm/Dr9s6Yt9whFrHb1nXUBdx0+kF7k6tC78MXC/Vabo+KZCByPIFoETRLZW
         TufrwEcpb5nF6inzvhBK0f6T9bNDbctr9r2KdzkW/4t/brO134v7819BJWt+wOLVJWTx
         6b63YjzgWyLQ/3WQ6hfZU0RSthxVTZT6H+fI49zO4gZZOOL3zWQRx179ba7Bg1D2TiO7
         1gwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=ko8aLEfz7VyLjGG2Rud4lWnzC784JMvOo3wvqWrCylY=;
        b=Rkyc9m+wX2FDTIFQFgYtD5c83Et83yY8xmsN2lrK0pZqAWCwMQUfyIZz3I+c7t5aX4
         Bg0OUbV4Se/v9/+GMwGrx8m5ol7bELTUPcd3U4AbKYmiWysFAYzZRCNPnddh5052M1zd
         scImvfmUW8dBTP4NLaUjUXSDY20O1L1Td1D04vfiU+yD5K99UQT3Bz3OgbQISCXcLsZA
         a8dLIZQLYwMS9EHf0Uzwh6VouEccq0vfZ1b0q0bUzJhudayo+GRDHzj9LIZtpM4E1b48
         KZ+4T7FzavAAm9a82VHIqf9lYOS/Z4rk+fHL8AALa+2kBd9YyanSKlJNtQXBMjfdprwV
         Yo+Q==
X-Gm-Message-State: APjAAAURabnjbybKA393KnXCnZLQRSU07PARslKdqG7H52+JhbHt9otd
        BE0hGdgAHEGyjHW577JzCgROUUkA0DdeqWgmAO/6Ow==
X-Google-Smtp-Source: APXvYqyDMtZ2MXAaR5ez0lNQhMjjgJFRQ44etX1glmyGsTzNbGz2M7BOeIyot5fGBxeHw0eh2LFK1mEXOseX0FkrGCE=
X-Received: by 2002:a9d:7352:: with SMTP id l18mr16004836otk.292.1561364986392;
 Mon, 24 Jun 2019 01:29:46 -0700 (PDT)
MIME-Version: 1.0
References: <20190221162627.3476-1-brgl@bgdev.pl> <9efcbce2-4d49-7197-a3d8-0e83850892d5@web.de>
In-Reply-To: <9efcbce2-4d49-7197-a3d8-0e83850892d5@web.de>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Mon, 24 Jun 2019 10:29:35 +0200
Message-ID: <CAMpxmJX-wXQ-ff1RWkPmJBWSsP_v2MjZrA3fhj3HQX0_zM0eZA@mail.gmail.com>
Subject: Re: [PATCH] drivers: Adjust scope for CONFIG_HAS_IOMEM before devm_platform_ioremap_resource()
To:     Markus Elfring <Markus.Elfring@web.de>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Keerthy <j-keerthy@ti.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        kernel-janitors@vger.kernel.org,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

pt., 14 cze 2019 o 18:50 Markus Elfring <Markus.Elfring@web.de> napisa=C5=
=82(a):
>
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Fri, 14 Jun 2019 17:45:13 +0200
>
> Move the preprocessor statement =E2=80=9C#ifdef CONFIG_HAS_IOMEM=E2=80=9D=
 so that
> the corresponding scope for conditional compilation includes also comment=
s
> for this function implementation.
>
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---
>  drivers/base/platform.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/base/platform.c b/drivers/base/platform.c
> index 4d1729853d1a..a5f40974a6ef 100644
> --- a/drivers/base/platform.c
> +++ b/drivers/base/platform.c
> @@ -78,6 +78,7 @@ struct resource *platform_get_resource(struct platform_=
device *dev,
>         return NULL;
>  }
>  EXPORT_SYMBOL_GPL(platform_get_resource);
> +#ifdef CONFIG_HAS_IOMEM
>
>  /**
>   * devm_platform_ioremap_resource - call devm_ioremap_resource() for a p=
latform
> @@ -87,7 +88,6 @@ EXPORT_SYMBOL_GPL(platform_get_resource);
>   *        resource management
>   * @index: resource index
>   */
> -#ifdef CONFIG_HAS_IOMEM
>  void __iomem *devm_platform_ioremap_resource(struct platform_device *pde=
v,
>                                              unsigned int index)
>  {
> --
> 2.22.0
>

And what is the purpose of that?

Bart
