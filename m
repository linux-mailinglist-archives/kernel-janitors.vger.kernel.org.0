Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EFAF01C87C7
	for <lists+kernel-janitors@lfdr.de>; Thu,  7 May 2020 13:13:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726864AbgEGLNh (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Thu, 7 May 2020 07:13:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46600 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726825AbgEGLNg (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 7 May 2020 07:13:36 -0400
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com [IPv6:2607:f8b0:4864:20::741])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A97EBC05BD09
        for <kernel-janitors@vger.kernel.org>; Thu,  7 May 2020 04:13:36 -0700 (PDT)
Received: by mail-qk1-x741.google.com with SMTP id k81so5480128qke.5
        for <kernel-janitors@vger.kernel.org>; Thu, 07 May 2020 04:13:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=iILzUb916EgutYDcIgI/xSm4YIGbMvYcWtp7OsyVVfE=;
        b=suJvfqeSlQTohtjnyDDJvicZXejWfvwoPGX0Lpli5EN/xKF4AgzWc4EreI+9QPKmX9
         DeVapG5CjEhIk1uHT/vAUodqd8C7BzWqd+9bVmfJ1YHVGRYULDmFJNxL3GBvhFbOP+jd
         dZKWg0bOsdsRDAUv3Q514xbA6krj4zxyldz8QyGb5+vPGybNQkRbG4+0yIxyhoWc2MwV
         ewi0IEr1nVVtGaQj3IiwPIL5DpE+9l1qNzp4Y/8ibmHaFq/AW8QOciPHx07zc4W55Lhh
         iPS0idX9Yw+UWBMJooZxUCBn1qU9V6Q9LOi9pfgo5zCQ2dFKuLMvNpUDVLq4l03SKzD0
         xiBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=iILzUb916EgutYDcIgI/xSm4YIGbMvYcWtp7OsyVVfE=;
        b=cSuzFjnaNzjIcPtR17yB95pQNJxtcrL5ZolTaLrDTo3rIzN/zaGtxhsj/ChfJ3ERWW
         DVBtMq02uv6VbKVHXqI/FqgPYKc6SlfXyLIBacEV57wKMA29H8qtc0oJeYVXSn04RmYf
         QW1YLpg6wUWybW0quwYPHm8DL8btm4OEG6ohGuS1YXb7ZpLCmFkm4oqBvTbISYEbhukM
         GCDllVea7I12OBWxkDy4GndKulIH6z5rYGVL3y04fb6AxX6uhpPN9l42TmHJByG9bedq
         zMvbPHB9YYTJjYYtFvjilFotjxmxPqIqheKFygojYkOzYWLcvCmKxgk1Z/hFsW/BP34k
         XRaA==
X-Gm-Message-State: AGi0PuaN1LrbuJl8azRSJRTC+BsF0NXSPVZarZbstyt9QAWiCYHzvdjb
        rQgN+3o7vkNuILFRtWxIzQP0cEnj4sPQJKZSg3x79Q==
X-Google-Smtp-Source: APiQypKy/HxL/kKChlxsdqcGGCiw2sMuaxq1Z0JMLoV4zr0YX9pwiSplug5DLkcu7RiDX7JjIENsk6iOvU7viNKfq6g=
X-Received: by 2002:a05:620a:1395:: with SMTP id k21mr13725272qki.120.1588850015861;
 Thu, 07 May 2020 04:13:35 -0700 (PDT)
MIME-Version: 1.0
References: <20200506124256.87628-1-weiyongjun1@huawei.com>
In-Reply-To: <20200506124256.87628-1-weiyongjun1@huawei.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Thu, 7 May 2020 13:13:24 +0200
Message-ID: <CAMpxmJVuqJyvm92Siv6CLgmphGf36A_fjHmEOzH3h1ct=ypC3Q@mail.gmail.com>
Subject: Re: [PATCH -next] gpio: exar: Fix error return code in gpio_exar_probe()
To:     Wei Yongjun <weiyongjun1@huawei.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Kangjie Lu <kjlu@umn.edu>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

=C5=9Br., 6 maj 2020 o 14:39 Wei Yongjun <weiyongjun1@huawei.com> napisa=C5=
=82(a):
>
> Fix to return a negative error code from the error handling
> case instead of 0, as done elsewhere in this function.
>
> Fixes: 7ecced0934e5 ("gpio: exar: add a check for the return value of ida=
_simple_get fails")
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> ---
>  drivers/gpio/gpio-exar.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpio/gpio-exar.c b/drivers/gpio/gpio-exar.c
> index da1ef0b1c291..c5c3fa5b519f 100644
> --- a/drivers/gpio/gpio-exar.c
> +++ b/drivers/gpio/gpio-exar.c
> @@ -148,8 +148,10 @@ static int gpio_exar_probe(struct platform_device *p=
dev)
>         mutex_init(&exar_gpio->lock);
>
>         index =3D ida_simple_get(&ida_index, 0, 0, GFP_KERNEL);
> -       if (index < 0)
> +       if (index < 0) {
> +               ret =3D index;
>                 goto err_destroy;
> +       }
>
>         sprintf(exar_gpio->name, "exar_gpio%d", index);
>         exar_gpio->gpio_chip.label =3D exar_gpio->name;
>
>
>

This is already fixed in my for-current branch.

Bart
