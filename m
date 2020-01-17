Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4EB14140995
	for <lists+kernel-janitors@lfdr.de>; Fri, 17 Jan 2020 13:16:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727289AbgAQMQT (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Fri, 17 Jan 2020 07:16:19 -0500
Received: from mail-ot1-f68.google.com ([209.85.210.68]:35731 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727040AbgAQMQQ (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 17 Jan 2020 07:16:16 -0500
Received: by mail-ot1-f68.google.com with SMTP id i15so22367489oto.2
        for <kernel-janitors@vger.kernel.org>; Fri, 17 Jan 2020 04:16:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=OLdYBE/MVxP+IEJf5xYlwkMrALul6wc+ioyfNkUWx5I=;
        b=g7pz9kl1SZ/Rtizxe7LcT2bFiTs+MSNviUNGniWPuzf45z2CYzL4iGWTrXAGs2wWGZ
         EyXJFu8BIuzwBomcBYL/A+bXs32khfiabuAK2svc8iM1uDRZGHgjKn88EgfPDwX9S5X6
         SDFUCbO/O9xR2SsCQ8Z5cznpog8IU9TZ9OxIw1befHw/r4+lSKAX1GGztcvA7Nyx26Kw
         bvahlLr5o0k1MQHyx6bPEH1u/boYopqP6Vg2/U5ijC9+y3fBL5yIgWav4qRoyPbu0abz
         qBsayuGbjmAupos/roG3h4teNpMMYntyCbdo+Qb0Exs0+bN+TBEGmApbtLWp96xtyIMw
         0m5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OLdYBE/MVxP+IEJf5xYlwkMrALul6wc+ioyfNkUWx5I=;
        b=lKXBPFVzZkn3+QlXhXo7EUB5yAMuugAj09NBX8Y9HLAiZYsdNdwXjHAFjhSB1b8tN0
         63GSq7ajTcNXyYLHJWiPZw6wkfNb5mD4EIzfbR0AR3Dc8Ba0U+CIu5dd7x2F+HEqvq90
         EtD7jg6yt//kdYBfRbdh/r8fP7A4tQ/K3Ahh9vS5mCe3rbN3imvdMB9UYaDxmhjT4/4c
         /dvKN8CP3C8SkwAYv6CDki8FROGzS0zVQHoxC7ly48zm3AE3N20AHBPabCxaSTRedC8u
         zqJWYpxNmE206xTI6/8nrCmQdeMa2GfyJ0nnc9xO9AvfeDlTGSTrzsrCryJmUKWnT3BX
         LOMw==
X-Gm-Message-State: APjAAAVmY3Cts/tEIx6b44gJRbRlmolHCMhl0Sepu48bQjV4HbRdA0Om
        xtjLZMzoCmP65j+TGtCmnNqZVxJ7BUJsbcVXr6CrMw==
X-Google-Smtp-Source: APXvYqwUSNCN2VPjDlM+0347SqxocVqyJCbtMj2edv7XT6B2yU4dwOF6tZWsqNRaBrPa01DezuFaq6ETWxnNC4uSscs=
X-Received: by 2002:a9d:6e14:: with SMTP id e20mr6073905otr.283.1579263374814;
 Fri, 17 Jan 2020 04:16:14 -0800 (PST)
MIME-Version: 1.0
References: <20200116154852.84532-1-colin.king@canonical.com> <e6fd526e-316f-539d-9f5e-c039041c4f2e@amd.com>
In-Reply-To: <e6fd526e-316f-539d-9f5e-c039041c4f2e@amd.com>
From:   Jens Wiklander <jens.wiklander@linaro.org>
Date:   Fri, 17 Jan 2020 13:16:03 +0100
Message-ID: <CAHUa44FFshAu+4Ue3Q4MDb_+sHCr20KjM3N=usJZsANvdr47eg@mail.gmail.com>
Subject: Re: [PATCH][next][V2] tee: fix memory allocation failure checks on
 drv_data and amdtee
To:     "Thomas, Rijo-john" <Rijo-john.Thomas@amd.com>
Cc:     Colin King <colin.king@canonical.com>,
        Devaraj Rangasamy <Devaraj.Rangasamy@amd.com>,
        Gary R Hook <gary.hook@amd.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "open list:HARDWARE RANDOM NUMBER GENERATOR CORE" 
        <linux-crypto@vger.kernel.org>, kernel-janitors@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Fri, Jan 17, 2020 at 7:40 AM Thomas, Rijo-john
<Rijo-john.Thomas@amd.com> wrote:
>
>
>
> On 16/01/20 9:18 pm, Colin King wrote:
> > From: Colin Ian King <colin.king@canonical.com>
> >
> > Currently the memory allocation failure checks on drv_data and
> > amdtee are using IS_ERR rather than checking for a null pointer.
> > Fix these checks to use the conventional null pointer check.
> >
> > Addresses-Coverity: ("Dereference null return")
> > Fixes: 757cc3e9ff1d ("tee: add AMD-TEE driver")
> > Signed-off-by: Colin Ian King <colin.king@canonical.com>
>
> Reviewed-by: Rijo Thomas <Rijo-john.Thomas@amd.com>

Acked-by: Jens Wiklander <jens.wiklander@linaro.org>

Thanks,
Jens

>
> Thanks,
> Rijo
>
> > ---
> > V2: update to apply against cryptodev-2.6 tree tip
> > ---
> >  drivers/tee/amdtee/core.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/tee/amdtee/core.c b/drivers/tee/amdtee/core.c
> > index be8937eb5d43..6370bb55f512 100644
> > --- a/drivers/tee/amdtee/core.c
> > +++ b/drivers/tee/amdtee/core.c
> > @@ -446,11 +446,11 @@ static int __init amdtee_driver_init(void)
> >       }
> >
> >       drv_data = kzalloc(sizeof(*drv_data), GFP_KERNEL);
> > -     if (IS_ERR(drv_data))
> > +     if (!drv_data)
> >               return -ENOMEM;
> >
> >       amdtee = kzalloc(sizeof(*amdtee), GFP_KERNEL);
> > -     if (IS_ERR(amdtee)) {
> > +     if (!amdtee) {
> >               rc = -ENOMEM;
> >               goto err_kfree_drv_data;
> >       }
> >
