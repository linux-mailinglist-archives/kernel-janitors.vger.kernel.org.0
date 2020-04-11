Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0FCB51A53F8
	for <lists+kernel-janitors@lfdr.de>; Sun, 12 Apr 2020 00:54:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726659AbgDKWyD (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Sat, 11 Apr 2020 18:54:03 -0400
Received: from mail-ed1-f65.google.com ([209.85.208.65]:42241 "EHLO
        mail-ed1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726329AbgDKWyD (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sat, 11 Apr 2020 18:54:03 -0400
Received: by mail-ed1-f65.google.com with SMTP id cw6so7032867edb.9
        for <kernel-janitors@vger.kernel.org>; Sat, 11 Apr 2020 15:54:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vanguardiasur-com-ar.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=nDoR7MPIZ0+UUjjouT8/iWH3LcwGrhQgihvzyqzRNGQ=;
        b=PHQmoASmZM1OUhZeppjw00AbiQw/QXc293IIO0lqpH8/odmnWcu8n+H26Y8XxezF5K
         t5UPPSPm56yRfv5e2FeetYzLaWtV3K+m4JmmKZ4XSAHlO6P7lEePVwucbuYr3mv0nEJz
         vubUUZ9mp/UNWDXEUMDp5KxT9Fv03QCbxQtyrnj8KWSjqrnb8lgUCI5IMPhxGa4PgtDo
         cNpbCbe64oSJl7wyKADWtt4zBbbr1539jwOFObOmYUTYyh7Ott+TeySlb9HdK+U2v816
         gBb0z5xXBGiAgCO+XPUN0PYCVGu8uog2ufHu7PZNDwXf2wUYZ3pjULQMxUrV7csE9s2g
         hqcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nDoR7MPIZ0+UUjjouT8/iWH3LcwGrhQgihvzyqzRNGQ=;
        b=TP5SIPxzChjo4TXINVIPpR0sKFsUhXYlOqAL0FWEyvMglpYB2hF0OnFtwUwtENDIjR
         sls0s0evuPIYWr3/WPvW6cTTLhvol69HCxSA+6wHoZSve8JYgFVmZ45ImDufAgql9XFH
         2DilRnaql9KGZ4ulwlkaIWJlB+X3jH8Wei9DyeZxLrr+OWn4qgUIue9bhJMuVnpupEJX
         C5brriaQGJnCJOYI4uZygMXzYIiDcCP4GycvNpzA1FqmKmkw1VJ9iW2ILU4BRq5s/3+0
         DFnl62OrS5VuXKeqgJWeiTDAI+0ggKIJry7wmMdrahddX13mPgzlp1bC5fn0iKcdsx1N
         6Gtw==
X-Gm-Message-State: AGi0PuaQSgluz3eZWtUdsGYnnbzioUYT2ZmKwEHKoWilXb12sjG/5qwq
        iW8RspquSF0C2jq6e0Z/A5YKYDrAmCw+pEGFIqaOqA==
X-Google-Smtp-Source: APiQypIR0ywLETIZ5z0ZHHvh3nP6YVmecVELlCDEPz+SUBLD+je5yymmncBzfHsVz8clXk2t9cvgaEC9Z15ShKlm6Cc=
X-Received: by 2002:a17:906:4301:: with SMTP id j1mr9880009ejm.46.1586645642328;
 Sat, 11 Apr 2020 15:54:02 -0700 (PDT)
MIME-Version: 1.0
References: <20200410113913.14430-1-colin.king@canonical.com>
In-Reply-To: <20200410113913.14430-1-colin.king@canonical.com>
From:   Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date:   Sat, 11 Apr 2020 19:53:51 -0300
Message-ID: <CAAEAJfCQaCCoShLPTA+EWUhMXdF6bKAxcOCj2SR5nPXMmk7LQg@mail.gmail.com>
Subject: Re: [PATCH] media: mantis: remove redundant assignment to variable err
To:     Colin King <colin.king@canonical.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media <linux-media@vger.kernel.org>,
        kernel-janitors@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hi Colin,

Thanks for your patch!

On Fri, 10 Apr 2020 at 08:39, Colin King <colin.king@canonical.com> wrote:
>
> From: Colin Ian King <colin.king@canonical.com>
>
> The variable err is being initialized with a value that is never read
> and it is being updated later with a new value.  The initialization is
> redundant and can be removed.
>
> Addresses-Coverity: ("Unused value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/media/pci/mantis/hopper_vp3028.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/media/pci/mantis/hopper_vp3028.c b/drivers/media/pci/mantis/hopper_vp3028.c
> index 37bd386f3ed8..ce1e8737b14b 100644
> --- a/drivers/media/pci/mantis/hopper_vp3028.c
> +++ b/drivers/media/pci/mantis/hopper_vp3028.c
> @@ -33,7 +33,7 @@ static int vp3028_frontend_init(struct mantis_pci *mantis, struct dvb_frontend *
>  {
>         struct i2c_adapter *adapter     = &mantis->adapter;
>         struct mantis_hwconfig *config  = mantis->hwconfig;
> -       int err = 0;
> +       int err;
>
>         mantis_gpio_set_bits(mantis, config->reset, 0);
>         msleep(100);

There's a redundant err assignment right below here,
which you can also get rid of:

-       err = mantis_frontend_power(mantis, POWER_ON);
+       mantis_frontend_power(mantis, POWER_ON);

I can't test this, but calling mantis_frontend_power twice
is possibly redundant.

Also, what's the gain from this cleanup? The driver is super
old, and it seems any modern compiler would be oblivious
of the redundant assignment.

Thanks!
Ezequiel
