Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 225F05051C
	for <lists+kernel-janitors@lfdr.de>; Mon, 24 Jun 2019 11:05:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728241AbfFXJFI (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Mon, 24 Jun 2019 05:05:08 -0400
Received: from mail-io1-f68.google.com ([209.85.166.68]:41712 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728043AbfFXJFI (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 24 Jun 2019 05:05:08 -0400
Received: by mail-io1-f68.google.com with SMTP id w25so397430ioc.8
        for <kernel-janitors@vger.kernel.org>; Mon, 24 Jun 2019 02:05:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=RT4lEk5fN7HFZePgHSc4vHCyrKek0LAJIXSg/6ONn94=;
        b=kW6SnZC7+SUahHh8QHkx5EZO/GZhKr4MN2xFKG6Z/Co/A/pvQ9gv2RhrPctSMF99KF
         +cfWXOTaaJm4GiBRUfZ0cy9jj/bbs1jdkzVt/lTnjwNqmBC57ka2rlCnKqyhbfDNVOud
         e2RIkO2eXyOqr1R6unsFUNSfSuiXVYw8V8RvyIJ0GofaU9F/iB7SpA6VPbuBkCd2q3HL
         adQl4q5OSRajsSaqC2clbe9eMtqdmrRJUY6I5mvO+Z5Qa/3UGF/XnZV5nj6rbnGWARz+
         TGzy31TkZOdhiA+Gfiyhn2id34l4xHli2ieBUUIy1uJTH0t1dointiClqCTGlVSQBQRJ
         IXdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=RT4lEk5fN7HFZePgHSc4vHCyrKek0LAJIXSg/6ONn94=;
        b=mieCxmREnQur4BChT8Ks0Gzsuuu7D1PRwY9OLmL5i4xnH2zAoyCCRfc49u99bbhDRv
         fOitpcv0oU8BC+ZDnsBGnBiTi7+THs53GYY0CpPPaEFiIO+SeTr5V6uihEShMfb4/NNU
         TXH9WOv+gsgOl7apFTJ3E8WOp9l2Q7hEEhNxD2oPd6AyUgSyLNhePU3M3QRZXheKGoyQ
         K0ig4Ys0r8uL7aiQtz7smRFds8px0VrTrXQm/MvvWkPB4dhQgmWIBWZrJh1GXq0xvBdq
         LKSRFk4/M1XSAbRjbOEm5wFxHNTtNIoZpPHUH5s8h2Cx0wssYhZ3c+nsj2uvMOOQ8dBp
         5hsA==
X-Gm-Message-State: APjAAAV+LhdRAlGt1fS0fjmclv0Zv9wk8ZYrBqpzDHA56itj+WINghZV
        CTWtO0lzu26zAwBfdYlWR9iGfsVTd8+Iz6opSS1EIA==
X-Google-Smtp-Source: APXvYqxs+X/MEHIFWNknlHNPwtoAj/m9emqJBt5qpPpYunxdVJPOqth+WqIc74mICJHshxgtlxM3+DrIEe3yOspremU=
X-Received: by 2002:a5d:9c46:: with SMTP id 6mr8686796iof.6.1561367107600;
 Mon, 24 Jun 2019 02:05:07 -0700 (PDT)
MIME-Version: 1.0
References: <20190617113109.24689-1-colin.king@canonical.com>
 <CAMpxmJVxg2+2mdAQDSo5LTq=w7+ccXnwRmK+iz=4zkNhepE6pQ@mail.gmail.com> <20190624090339.GW28859@kadam>
In-Reply-To: <20190624090339.GW28859@kadam>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 24 Jun 2019 11:04:56 +0200
Message-ID: <CAMRc=MfvzJadT2E7MN=bUjhhjFHoFs7cH2YDmuOFm-fMgDmC7A@mail.gmail.com>
Subject: Re: [PATCH][next] clocksource: davinci-timer: fix memory leak of
 clockevent on error return
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Colin King <colin.king@canonical.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        kernel-janitors@vger.kernel.org,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

pon., 24 cze 2019 o 11:04 Dan Carpenter <dan.carpenter@oracle.com> napisa=
=C5=82(a):
>
> On Mon, Jun 24, 2019 at 10:28:10AM +0200, Bartosz Golaszewski wrote:
> > pon., 17 cze 2019 o 13:31 Colin King <colin.king@canonical.com> napisa=
=C5=82(a):
> > >
> > > From: Colin Ian King <colin.king@canonical.com>
> > >
> > > Currently when the call to request_irq falls there is a memory leak o=
f
> > > clockevent on the error return path. Fix this by kfree'ing clockevent=
.
> > >
> > > Addresses-Coverity: ("Resource leak")
> > > Fixes: fe3b8194f274 ("clocksource: davinci-timer: add support for clo=
ckevents")
> > > Signed-off-by: Colin Ian King <colin.king@canonical.com>
> > > ---
> > >  drivers/clocksource/timer-davinci.c | 1 +
> > >  1 file changed, 1 insertion(+)
> > >
> > > diff --git a/drivers/clocksource/timer-davinci.c b/drivers/clocksourc=
e/timer-davinci.c
> > > index a9ca02390b66..8512f12e250a 100644
> > > --- a/drivers/clocksource/timer-davinci.c
> > > +++ b/drivers/clocksource/timer-davinci.c
> > > @@ -300,6 +300,7 @@ int __init davinci_timer_register(struct clk *clk=
,
> > >                          "clockevent/tim12", clockevent);
> > >         if (rv) {
> > >                 pr_err("Unable to request the clockevent interrupt");
> > > +               kfree(clockevent);
> > >                 return rv;
> > >         }
> > >
> > > --
> > > 2.20.1
> > >
> >
> > Hi Colin,
> >
> > I omitted the error checking in this driver on purpose - it doesn't
> > make sense as the system won't boot without a timer.
>
> One way to silence these static checker warnings is to use
> "GFP_KERNEL | __GFP_NOFAIL".
>
> regards,
> dan carpenter
>

Noted, I'll be sending a new version of this driver to Daniel anyway,
so I'll include it.

Thanks,
Bart
