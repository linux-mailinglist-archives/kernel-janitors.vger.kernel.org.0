Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8EE02F8A89
	for <lists+kernel-janitors@lfdr.de>; Tue, 12 Nov 2019 09:34:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725944AbfKLIec (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Tue, 12 Nov 2019 03:34:32 -0500
Received: from mail-oi1-f196.google.com ([209.85.167.196]:37459 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725834AbfKLIec (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 12 Nov 2019 03:34:32 -0500
Received: by mail-oi1-f196.google.com with SMTP id y194so14083491oie.4
        for <kernel-janitors@vger.kernel.org>; Tue, 12 Nov 2019 00:34:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=MTG7lQ0u9d8+q6rZMou9pMrXlqU/RMiDOcUJ4lZKiNI=;
        b=CdDTpHJF5JfhHDfSz4685fIPM0bW1Po430XfabG9F39pJJ1M9kCJeqGRakUVSC+FLC
         tT8Vos+VLGJcTMF0Sb1FEJtfUC0msCmnXmvPehTqz0iJYxwaGKWSN/j1cIbr07RzNQHs
         H5SlgF0t/HyHHC/YDR1W/r3rulnzQmYVK56eZvmgcUwREDnf60xguJnI18NNXp0Sh5GD
         j0lVfM/Q1du8kbgLkazEg4HXI6gmX5A0tYsNGm8wI1Nc9BRWeUGgIOh1dBx+XLO12fhU
         DwqlDy022kjhZFw+BQthvhXTui3Z06Aq+ubLFo4UmJYb+6zCs+YUAIZy/SiCfXvvmp4y
         CfLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=MTG7lQ0u9d8+q6rZMou9pMrXlqU/RMiDOcUJ4lZKiNI=;
        b=lVGNWwQfLpFMd0sOuc7CknTViI/zS/QAo3ZnAo+VDyWCPviIqR1Ef6tFPrXA0HuDQ/
         1uF9PYCDmouTUt3CsLU3smn+sBz5BFaA5gEJTCtk0VhdtmaBo3NjFZx5A26+KgcDfYwn
         ZIT/LyHSDszjCaMbDAk3Vjv7+4qeqkKB6+h9o1b2ys/pvwNRZ52WWNez8zi/c4yEinM1
         i1hb4oz/p4MN4t3nymNkgP7C6XaihqL9eKUUmbHXwna3fMPEglkUZBEYgX50oEldEpiO
         XEwN80k5sLaultPP1Qu/4uNAFXkukLqCH2A4jIwZTNXwZxu80GwWjAv7NBqrKk76uFxx
         eewQ==
X-Gm-Message-State: APjAAAXNVcdh6p2G2gdT7/ZesTc8hJsnlXAuH/+CAzdnyotGJMcBHO73
        IK1gxah2Ar0h3schPeZLclC10pyn8Dzq2Vub1yNwJhKb
X-Google-Smtp-Source: APXvYqzZSK4e0j7BXXGNWcEizolV+MKKXgi6/U6VUYoFSuN01kfxTSzYRyGOR2AKFnJjEAXlcGYuPy+laClqHV/y/cA=
X-Received: by 2002:a05:6808:9a1:: with SMTP id e1mr2995041oig.175.1573547671896;
 Tue, 12 Nov 2019 00:34:31 -0800 (PST)
MIME-Version: 1.0
References: <20191109155836.223635-1-colin.king@canonical.com>
 <CAMpxmJVC5GGhR0z_4CkF7Opfw-5HpEKD8fUrKsgBZTbz0wDd-Q@mail.gmail.com> <alpine.DEB.2.21.1911120033220.1833@nanos.tec.linutronix.de>
In-Reply-To: <alpine.DEB.2.21.1911120033220.1833@nanos.tec.linutronix.de>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Tue, 12 Nov 2019 09:34:21 +0100
Message-ID: <CAMpxmJVjVNXBu5t9Mv8PT854Fh=hH6K-L-BTjhEFMt3nkCcwUA@mail.gmail.com>
Subject: Re: [PATCH] clocksource/drivers/davinci: fix memory leak on
 clockevent on error return
To:     Thomas Gleixner <tglx@linutronix.de>
Cc:     Daniel Lezcano <daniel.lezcano@linaro.org>,
        Colin King <colin.king@canonical.com>,
        LKML <linux-kernel@vger.kernel.org>,
        kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

wt., 12 lis 2019 o 00:37 Thomas Gleixner <tglx@linutronix.de> napisa=C5=82(=
a):
>
> Bartosz,
>
> On Sun, 10 Nov 2019, Bartosz Golaszewski wrote:
> > sob., 9 lis 2019 o 16:58 Colin King <colin.king@canonical.com> napisa=
=C5=82(a):
> > >
> > > From: Colin Ian King <colin.king@canonical.com>
> > >
> > > In the case where request_irq fails, the return path does not kfree
> > > clockevent and hence we have a memory leak.  Fix this by kfree'ing
>
> s/we have/creates/  or whatever verb you prefer.
>
> > > clockevent before returning.
> > >
> > > Addresses-Coverity: ("Resource leak")
> > > Fixes: 721154f972aa ("clocksource/drivers/davinci: Add support for cl=
ockevents")
> > > Signed-off-by: Colin Ian King <colin.king@canonical.com>
> > > ---
> > >  drivers/clocksource/timer-davinci.c | 1 +
> > >  1 file changed, 1 insertion(+)
> > >
> > > diff --git a/drivers/clocksource/timer-davinci.c b/drivers/clocksourc=
e/timer-davinci.c
> > > index 62745c962049..910d4d2f0d64 100644
> > > --- a/drivers/clocksource/timer-davinci.c
> > > +++ b/drivers/clocksource/timer-davinci.c
> > > @@ -299,6 +299,7 @@ int __init davinci_timer_register(struct clk *clk=
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
> > Hi Daniel,
> >
> > this is what I think the third time someone tries to "fix" this
> > driver's "memory leaks". I'm not sure what the general approach in
> > clocksource is but it doesn't make sense to free resources on
> > non-recoverable errors, does it? Should I add a comment about it or
> > you'll just take those "fixes" to stop further such submissions?
>
> There are two ways to deal with that:
>
>   1) If the error is really unrecoverable, panic right there. No point
>      to continue.

Fair enough.

Acked-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>

>
>   2) If there is even a minimal chance to survive, free the memory and
>      return.
>
> Adding a comment is just a useless non-option.
>
> Thanks,
>
>         tglx
