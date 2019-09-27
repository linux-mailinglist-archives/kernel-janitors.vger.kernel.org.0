Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F1FAFC09F7
	for <lists+kernel-janitors@lfdr.de>; Fri, 27 Sep 2019 19:06:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727518AbfI0RG0 (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Fri, 27 Sep 2019 13:06:26 -0400
Received: from mail-oi1-f195.google.com ([209.85.167.195]:34582 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726251AbfI0RG0 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 27 Sep 2019 13:06:26 -0400
Received: by mail-oi1-f195.google.com with SMTP id 83so5832603oii.1
        for <kernel-janitors@vger.kernel.org>; Fri, 27 Sep 2019 10:06:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ALyAWMAI/62LhKP4HzTSdIuPJ7a2yvozUW+yWtavY40=;
        b=fIyWSvupwowEAIsu3jKA3dQhU1zT+i2O8SwrnljrD9weISuLv+5yqA+VP9e1IZRy9P
         GQ1ton4ajwL62G0DS9LJbV3Bi2i/jeksqu/rwtkpSyeYVn4mD94lF5QOzULXMvrJWFGT
         knxuDU3ljt4ja9JuTP7WzLGYfgRvceH1SCKVI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ALyAWMAI/62LhKP4HzTSdIuPJ7a2yvozUW+yWtavY40=;
        b=dseMPWSKRhQ9hSox4KUXBsvt4AEosaCtc63m1TADbGwCpVEsml70gp4ooYwTtwG1/F
         jbMyqcnTHn8t2h2nFLTU+NO/qgo70y5XZL0qk75FFF/odWOIWmmdkPtd5KH1pFs8kEgC
         M4sHjKsqmwkkgF0sr6tW/4BMApph3iKR+KkueEY0bFN2VUywUTx2XUzWBqvOhUaZ0pTg
         UkW5b/xTSfCVfPwTQIFG7RMole08F0dGxNdtex8u7UHFdwqv+SF0Bw6f1u9X5/POyNP5
         L5N0M7u3tx/OqqY/4K9jlZOEkFUgxCPPxwn0TeVl8pPTG2ruGjNZtsvOlVK7S1ZVJnBg
         UX1A==
X-Gm-Message-State: APjAAAUz1eYFzwZB9dj22FgatlYPiH1HC+kS+iE4UO1rp77++nT4zTts
        cqxTyMsT3p7/VBBYzCfL0Ja9Hhodyl8=
X-Google-Smtp-Source: APXvYqwRYGhZuUl3McsdCch6nDx2HJeS9RLJWNOU1oaR/hBPGUh4vvIqNBrbpqSxOs7jRY685vTCAw==
X-Received: by 2002:aca:ecd3:: with SMTP id k202mr7660734oih.64.1569603985417;
        Fri, 27 Sep 2019 10:06:25 -0700 (PDT)
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com. [209.85.210.52])
        by smtp.gmail.com with ESMTPSA id s1sm1002069otd.49.2019.09.27.10.06.24
        for <kernel-janitors@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Sep 2019 10:06:24 -0700 (PDT)
Received: by mail-ot1-f52.google.com with SMTP id f21so2823222otl.13
        for <kernel-janitors@vger.kernel.org>; Fri, 27 Sep 2019 10:06:24 -0700 (PDT)
X-Received: by 2002:a9d:621a:: with SMTP id g26mr3946061otj.236.1569603984106;
 Fri, 27 Sep 2019 10:06:24 -0700 (PDT)
MIME-Version: 1.0
References: <20190621135907.112232-1-yuehaibing@huawei.com>
 <CAHX4x86qUKPTkRFWvWMgTMh1VY8ogJfr55khsSJTakS0emiyFA@mail.gmail.com> <CANLzEkvw-UGKh-OE91PiHUvOnjjdbTngnUNwFC4f54h8e3v+9A@mail.gmail.com>
In-Reply-To: <CANLzEkvw-UGKh-OE91PiHUvOnjjdbTngnUNwFC4f54h8e3v+9A@mail.gmail.com>
From:   Nick Crews <ncrews@chromium.org>
Date:   Fri, 27 Sep 2019 11:06:12 -0600
X-Gmail-Original-Message-ID: <CAHX4x85wF=q7FxAB9Fpzm4qYiu0_Ad2gQDNJqReY81rDTYrXsg@mail.gmail.com>
Message-ID: <CAHX4x85wF=q7FxAB9Fpzm4qYiu0_Ad2gQDNJqReY81rDTYrXsg@mail.gmail.com>
Subject: Re: [PATCH -next] platform/chrome: wilco_ec: Use kmemdup in enqueue_events()
To:     Benson Leung <bleung@chromium.org>
Cc:     YueHaibing <yuehaibing@huawei.com>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Thu, Sep 26, 2019 at 4:43 PM Benson Leung <bleung@chromium.org> wrote:
>
> Hey Nick,
> On Fri, Jun 21, 2019 at 7:51 AM Nick Crews <ncrews@chromium.org> wrote:
> >
> > Thanks Yue, looks good to me.
> >
> > Nick
> >
> > On Fri, Jun 21, 2019 at 7:59 AM YueHaibing <yuehaibing@huawei.com> wrote:
> > >
> > > Use kmemdup rather than duplicating its implementation
> > >
> > > Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> > > ---
> > >  drivers/platform/chrome/wilco_ec/event.c | 3 +--
> > >  1 file changed, 1 insertion(+), 2 deletions(-)
> > >
> > > diff --git a/drivers/platform/chrome/wilco_ec/event.c b/drivers/platform/chrome/wilco_ec/event.c
> > > index c975b76e6255..70156e75047e 100644
> > > --- a/drivers/platform/chrome/wilco_ec/event.c
> > > +++ b/drivers/platform/chrome/wilco_ec/event.c
> > > @@ -248,10 +248,9 @@ static int enqueue_events(struct acpi_device *adev, const u8 *buf, u32 length)
> > >                 offset += event_size;
> > >
> > >                 /* Copy event into the queue */
> > > -               queue_event = kzalloc(event_size, GFP_KERNEL);
> > > +               queue_event = kmemdup(event, event_size, GFP_KERNEL);
> > >                 if (!queue_event)
> > >                         return -ENOMEM;
> > > -               memcpy(queue_event, event, event_size);
> > >                 event_queue_push(dev_data->events, queue_event);
> > >         }
> > >
> > >
> > >
>
> Looks like this was already incorporated into your commit,
> platform/chrome: wilco_ec: Use kmemdup in enqueue_events().

Thanks for the note Benson, but I think that must have
been a copy pasta error, it was actually included in
"platform/chrome: wilco_ec: Add circular buffer as event queue"
just so there isn't any confusion later :)

Nick

>
> Thanks!
> Benson
>
> --
> Benson Leung
> Staff Software Engineer
> Chrome OS Kernel
> Google Inc.
> bleung@google.com
> Chromium OS Project
> bleung@chromium.org
