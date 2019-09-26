Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 57B5FBFB63
	for <lists+kernel-janitors@lfdr.de>; Fri, 27 Sep 2019 00:44:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727071AbfIZWoK (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Thu, 26 Sep 2019 18:44:10 -0400
Received: from mail-io1-f65.google.com ([209.85.166.65]:34698 "EHLO
        mail-io1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725943AbfIZWoK (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 26 Sep 2019 18:44:10 -0400
Received: by mail-io1-f65.google.com with SMTP id q1so10998303ion.1
        for <kernel-janitors@vger.kernel.org>; Thu, 26 Sep 2019 15:44:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=h2RBa1Aq2wGyPCj/7NlPZ9URqEf7+Teb++mDJA7G0Fo=;
        b=bVUqyu6ChxtpXtfiAdnqCFhnpn95dZG9LsB8SnMa2HrY0EnNnfcizsMzc4RMtHmS0I
         UIFIBwHZslqumlqW2bq6oplOBKDgAdjfce6m/uVb6cT54vZYeYhm8gsRXo4edasSPOKx
         jnAssqn6Lvaq7GGV6547JB9H7OqFIQY6bKxJU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=h2RBa1Aq2wGyPCj/7NlPZ9URqEf7+Teb++mDJA7G0Fo=;
        b=qakmhPPXXQSa1tFOfkOErieWF8Cp0Sw9zp5fEdbLw2P5bdaZAHVlTyi65nY3IrnUmH
         S2viSv86iJupdJ3gZaOBhvUB1lla+zL3IQ1RsmN9FTgcxBIecjt1DGLSuo1NwMDDoH52
         JjM/uKNb+vsZjJZz42RPLEd8JV+869CVWyt15WAVHM3NR+K0ka8PEtgVSakgM01FxsZG
         cVStDn7bTeUW7/KtouQX1eWeEMQCoSoG4qxwYoN6jjt1VfhG7FCgbSFHXlUWWQxMOCQL
         tdgBXjPcoVbdk3FHyvvE9hBoFGuFHgg0aQfclAlHQEHzC5KZivOGqtMcPcbKjY9TygdO
         ygOg==
X-Gm-Message-State: APjAAAUsFLkx1/q26ysoWakC9q/SlfbOREJb2k7AIbbYe7bE50WD4Jeg
        K45Jf9PwYL2bMzYxPrxmh9fdnEXAarJXYQIvxJUxiw==
X-Google-Smtp-Source: APXvYqw8FTmRK4wP2wIFDoFi+w++dkhFz+C9SJs7D69ow+DQYhh4fIa+FB0mXfMV2n7rI+lrzuwKIV0YTLJfU30T/Ok=
X-Received: by 2002:a5e:8704:: with SMTP id y4mr1779026ioj.103.1569537848894;
 Thu, 26 Sep 2019 15:44:08 -0700 (PDT)
MIME-Version: 1.0
References: <20190621135907.112232-1-yuehaibing@huawei.com> <CAHX4x86qUKPTkRFWvWMgTMh1VY8ogJfr55khsSJTakS0emiyFA@mail.gmail.com>
In-Reply-To: <CAHX4x86qUKPTkRFWvWMgTMh1VY8ogJfr55khsSJTakS0emiyFA@mail.gmail.com>
From:   Benson Leung <bleung@chromium.org>
Date:   Thu, 26 Sep 2019 15:43:56 -0700
Message-ID: <CANLzEkvw-UGKh-OE91PiHUvOnjjdbTngnUNwFC4f54h8e3v+9A@mail.gmail.com>
Subject: Re: [PATCH -next] platform/chrome: wilco_ec: Use kmemdup in enqueue_events()
To:     Nick Crews <ncrews@chromium.org>
Cc:     YueHaibing <yuehaibing@huawei.com>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hey Nick,
On Fri, Jun 21, 2019 at 7:51 AM Nick Crews <ncrews@chromium.org> wrote:
>
> Thanks Yue, looks good to me.
>
> Nick
>
> On Fri, Jun 21, 2019 at 7:59 AM YueHaibing <yuehaibing@huawei.com> wrote:
> >
> > Use kmemdup rather than duplicating its implementation
> >
> > Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> > ---
> >  drivers/platform/chrome/wilco_ec/event.c | 3 +--
> >  1 file changed, 1 insertion(+), 2 deletions(-)
> >
> > diff --git a/drivers/platform/chrome/wilco_ec/event.c b/drivers/platform/chrome/wilco_ec/event.c
> > index c975b76e6255..70156e75047e 100644
> > --- a/drivers/platform/chrome/wilco_ec/event.c
> > +++ b/drivers/platform/chrome/wilco_ec/event.c
> > @@ -248,10 +248,9 @@ static int enqueue_events(struct acpi_device *adev, const u8 *buf, u32 length)
> >                 offset += event_size;
> >
> >                 /* Copy event into the queue */
> > -               queue_event = kzalloc(event_size, GFP_KERNEL);
> > +               queue_event = kmemdup(event, event_size, GFP_KERNEL);
> >                 if (!queue_event)
> >                         return -ENOMEM;
> > -               memcpy(queue_event, event, event_size);
> >                 event_queue_push(dev_data->events, queue_event);
> >         }
> >
> >
> >

Looks like this was already incorporated into your commit,
platform/chrome: wilco_ec: Use kmemdup in enqueue_events().

Thanks!
Benson

-- 
Benson Leung
Staff Software Engineer
Chrome OS Kernel
Google Inc.
bleung@google.com
Chromium OS Project
bleung@chromium.org
