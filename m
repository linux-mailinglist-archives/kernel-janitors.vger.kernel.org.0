Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B59563FC576
	for <lists+kernel-janitors@lfdr.de>; Tue, 31 Aug 2021 12:28:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240888AbhHaKMV (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Tue, 31 Aug 2021 06:12:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33282 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240882AbhHaKMU (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 31 Aug 2021 06:12:20 -0400
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com [IPv6:2607:f8b0:4864:20::b30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 77A42C06175F
        for <kernel-janitors@vger.kernel.org>; Tue, 31 Aug 2021 03:11:25 -0700 (PDT)
Received: by mail-yb1-xb30.google.com with SMTP id c206so13162173ybb.12
        for <kernel-janitors@vger.kernel.org>; Tue, 31 Aug 2021 03:11:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Euvaq+g0tY7RjoHZfXjeT8BwGAPATqwa9RvQNSUth7A=;
        b=h5BMK3FLAt8Dn4Hntcw7B5P7PMwzmuZqb0qpIorzfxOuDOvqg4Z+3s+OVcV3pX1USs
         DwXJPrG/zDG3AXLzZOd2mDHnC9jbXcASBD4MDXzGmllH5+X7KJKOqFcfrZUsyR7oY5k/
         7Zz6W65IRPrR7tVIhl4j5eNbqlwdnVxNtg616q8HSHlkzRNpdquRyPoJWn0GyRzUp2E2
         WKNmhTkW6o9UJBLGfVY/NcnL2mz4o9HZQmRJOhw2I6hvGjbvgEHGMCtR47ddWrLlVZ3C
         zIMFcQvYr6f7sqDGehJGiextNSxkcwh3/ryScWU4FiFH8Qgi9Hrz3OJFR2waFzY9sRlf
         gwPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Euvaq+g0tY7RjoHZfXjeT8BwGAPATqwa9RvQNSUth7A=;
        b=d/HhjWStcI8Uce46M8lQIXz8TvmzWbUCpuS3VcAJgCkIweIb+NSQSnFsEhOUfQYjGP
         raS3UYx9WHqebqeGz0x2gSKEAym292SsgQhGQJ8t0CMD7cmLJwHYAvyw1YzM5tdQi55+
         ZtaLdSIWN2Qqmg7v2pZx9IAR2bj66hVIZazVvKFdjd61MdH8FKm8me/4sw/YnaK95XXU
         AXGYtY/uBdd9WuBbiKqnppmko5rXMt7X9rren/Duwn3S4KMftE1y+dLJwewP412T52CZ
         uEGHFKo0n9YBGmDjxnXvS42OMer+l+adPDQl+ke0tixuYLNa+Ygnph44i4jVjnm16/0W
         R0mA==
X-Gm-Message-State: AOAM5327a+BKCLJ9amr8IK1cM5XAtzNrnbwuHCAVycgZLo7UYblF/GPr
        CNBsbfDRc0i8kAL1y5tC/7PZHzOuiEI7u51rbxkorw==
X-Google-Smtp-Source: ABdhPJzOhsBzuj9Qu0IwBiI643w/tDEioYa0Ma8MGFW2IU+AtZqLzQFgXxDfsUwVFf/Ha58G+vHpvWq+G41Q6bHtZEg=
X-Received: by 2002:a25:e70a:: with SMTP id e10mr27471979ybh.302.1630404684772;
 Tue, 31 Aug 2021 03:11:24 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1629472813.git.christophe.jaillet@wanadoo.fr> <b8af1f01cc987d78a8677fcc3709595f8e5b0f38.1629472813.git.christophe.jaillet@wanadoo.fr>
In-Reply-To: <b8af1f01cc987d78a8677fcc3709595f8e5b0f38.1629472813.git.christophe.jaillet@wanadoo.fr>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Tue, 31 Aug 2021 12:11:14 +0200
Message-ID: <CAMpxmJU-t3+2GhiJUXCBWoN9LW5+mjt6KnimiY3a8kWZSb--Fg@mail.gmail.com>
Subject: Re: [PATCH 3/3] gpio: mpc8xxx: Use 'devm_gpiochip_add_data()' to
 simplify the code and avoid a leak
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        alexandru.marginean@nxp.com, Laurentiu.Tudor@nxp.com,
        Hui Song <hui.song_1@nxp.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Ran Wang <ran.wang_1@nxp.com>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        kernel-janitors <kernel-janitors@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Fri, Aug 20, 2021 at 5:38 PM Christophe JAILLET
<christophe.jaillet@wanadoo.fr> wrote:
>
> If an error occurs after a 'gpiochip_add_data()' call it must be undone by
> a corresponding 'gpiochip_remove()' as already done in the remove function.
>
> To simplify the code a fix a leak in the error handling path of the probe,
> use the managed version instead (i.e. 'devm_gpiochip_add_data()')
>
> Fixes: 698b8eeaed72 ("gpio/mpc8xxx: change irq handler from chained to normal")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
>  drivers/gpio/gpio-mpc8xxx.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/drivers/gpio/gpio-mpc8xxx.c b/drivers/gpio/gpio-mpc8xxx.c
> index fa4aaeced3f1..70d6ae20b1da 100644
> --- a/drivers/gpio/gpio-mpc8xxx.c
> +++ b/drivers/gpio/gpio-mpc8xxx.c
> @@ -380,7 +380,7 @@ static int mpc8xxx_probe(struct platform_device *pdev)
>             is_acpi_node(fwnode))
>                 gc->write_reg(mpc8xxx_gc->regs + GPIO_IBE, 0xffffffff);
>
> -       ret = gpiochip_add_data(gc, mpc8xxx_gc);
> +       ret = devm_gpiochip_add_data(&pdev->dev, gc, mpc8xxx_gc);
>         if (ret) {
>                 dev_err(&pdev->dev,
>                         "GPIO chip registration failed with status %d\n", ret);
> @@ -429,8 +429,6 @@ static int mpc8xxx_remove(struct platform_device *pdev)
>                 irq_domain_remove(mpc8xxx_gc->irq);
>         }
>
> -       gpiochip_remove(&mpc8xxx_gc->gc);
> -
>         return 0;
>  }
>
> --
> 2.30.2
>

Applied, thanks!

Bart
