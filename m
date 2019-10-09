Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6D252D13E8
	for <lists+kernel-janitors@lfdr.de>; Wed,  9 Oct 2019 18:22:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731385AbfJIQW2 (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Wed, 9 Oct 2019 12:22:28 -0400
Received: from mail-oi1-f195.google.com ([209.85.167.195]:46289 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729644AbfJIQW2 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 9 Oct 2019 12:22:28 -0400
Received: by mail-oi1-f195.google.com with SMTP id k25so2234643oiw.13
        for <kernel-janitors@vger.kernel.org>; Wed, 09 Oct 2019 09:22:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=IUUKEe0zhlcZFtagTSvrUaS/BWmjpqqusKCPMPNT3Lg=;
        b=cxALGUnxRvrQGDezHD9t6ZPKJl+Ssz7AIhSQxFiBfK59tSQ66omb3puTw8ObHhW08e
         1OuwuqX/8B/WoHg54T7F4hRL2wDKdnNX5V/0X6CQaJnnB6es3GOlfEGAYioVI98V19og
         OzvDrJwvnoLmfKcURJnZ/RecO6dEpeHYwssrD0pZPbifGbH0RlVaC6m3ppv+ZFMiIkaS
         d5ezpvYSSBxjOnw6SwYgvZ80RRGaitAhRHc3uKS7fckn0oXZ4mLg5GmMAQvgwggERSMh
         rZD3dN/ltEJcpPwIjlSvv8Kw2zB6zwpqnxrtl+PgJ2mk7CTH+uP9+Q9X9vL4TDQ7O88U
         ll4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=IUUKEe0zhlcZFtagTSvrUaS/BWmjpqqusKCPMPNT3Lg=;
        b=a0IojujJrZtonRQmaU6xQj2QvUfTf0AqwAHhEnOFtZu+YDgWKN3orNCHtGY1x7SKKW
         WBx4vh09DhrEIyI80R+ObaRaDJnAWsFt0s6GxANjycryI+KdVTFcG+NxB91ytYjLsWqO
         5SIZZXRPzQ9wTZeb3v+AyrrWqmV8W8RGU0+muKsvkPoLk6jY6BePIEMFH25oxrZWK+2b
         NW1A+npFdvua+D6bzBRI6z35x4FaW14hgD0hvB7YnCH45gu7jWriDd1RpTqeQuB+dLZc
         SUopbLdoKdxw/VhrElklvCOERRP0bQbTzQILJVtUCZtdXjIY0fOhZ0yLj6D6v99bmoL9
         N+QA==
X-Gm-Message-State: APjAAAXbxplbSvp23qzQR+RzFWi8056wDsBZcAx4VhQuiaWTqVC3ACy/
        cI95qrc6mEQZu8jx0j9iPL96L9ZKiRSF9XkD1bgv6A==
X-Google-Smtp-Source: APXvYqx6lfGfo/boL8j+9ojYBWWa9RaTdZhBcBheUrc8BZB4HqCgAePVDLR7waJHdW48hJrLBL+JRYSovHqKR6Y9inE=
X-Received: by 2002:aca:5c06:: with SMTP id q6mr3225521oib.175.1570638147577;
 Wed, 09 Oct 2019 09:22:27 -0700 (PDT)
MIME-Version: 1.0
References: <20191006144256.23733-1-colin.king@canonical.com> <20191006150759.GA68457@icarus>
In-Reply-To: <20191006150759.GA68457@icarus>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Wed, 9 Oct 2019 18:22:16 +0200
Message-ID: <CAMpxmJWHiFF-525GHf-5RzSkxafAuQmTXvcCuvSJ+NVb_D8-hg@mail.gmail.com>
Subject: Re: [PATCH] gpio: 104-idi-48e: make array register_offset static,
 makes object smaller
To:     William Breathitt Gray <vilhelm.gray@gmail.com>
Cc:     Colin King <colin.king@canonical.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        kernel-janitors@vger.kernel.org,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

niedz., 6 pa=C5=BA 2019 o 17:08 William Breathitt Gray
<vilhelm.gray@gmail.com> napisa=C5=82(a):
>
> On Sun, Oct 06, 2019 at 03:42:56PM +0100, Colin King wrote:
> > From: Colin Ian King <colin.king@canonical.com>
> >
> > Don't populate the array register_offset on the stack but instead make =
it
> > static. Makes the object code smaller by 63 bytes.  Also add the int ty=
pe
> > specifier to clean up a checkpatch warning.
> >
> > Before:
> >    text          data     bss     dec     hex filename
> >    9212          5712    1408   16332    3fcc drivers/gpio/gpio-104-idi=
-48.o
> >
> > After:
> >    text          data     bss     dec     hex filename
> >    9085          5776    1408   16269    3f8d drivers/gpio/gpio-104-idi=
-48.o
> >
> > (gcc version 9.2.1, amd64)
> >
> > Signed-off-by: Colin Ian King <colin.king@canonical.com>
> > ---
> >  drivers/gpio/gpio-104-idi-48.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpio/gpio-104-idi-48.c b/drivers/gpio/gpio-104-idi=
-48.c
> > index ff53887bdaa8..c95c93ec0bd7 100644
> > --- a/drivers/gpio/gpio-104-idi-48.c
> > +++ b/drivers/gpio/gpio-104-idi-48.c
> > @@ -65,7 +65,7 @@ static int idi_48_gpio_get(struct gpio_chip *chip, un=
signed offset)
> >  {
> >       struct idi_48_gpio *const idi48gpio =3D gpiochip_get_data(chip);
> >       unsigned i;
> > -     const unsigned register_offset[6] =3D { 0, 1, 2, 4, 5, 6 };
> > +     static const unsigned int register_offset[6] =3D { 0, 1, 2, 4, 5,=
 6 };
> >       unsigned base_offset;
> >       unsigned mask;
> >
> > --
> > 2.20.1
>
> Acked-by: William Breathitt Gray <vilhelm.gray@gmail.com>

Applied for next.

Bart
