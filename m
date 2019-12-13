Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0B0DA11DED1
	for <lists+kernel-janitors@lfdr.de>; Fri, 13 Dec 2019 08:47:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725882AbfLMHrj (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Fri, 13 Dec 2019 02:47:39 -0500
Received: from mail-wm1-f68.google.com ([209.85.128.68]:36958 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725809AbfLMHrj (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 13 Dec 2019 02:47:39 -0500
Received: by mail-wm1-f68.google.com with SMTP id f129so5475029wmf.2
        for <kernel-janitors@vger.kernel.org>; Thu, 12 Dec 2019 23:47:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vTSxvUqfa6FoEiQTgKaCRKQ961VVqjF3zVcNDPTqeUQ=;
        b=FygEFXPkvDTEqQFNc95GmEPQFaOALol3FJZVABII8mgatRtgdG31UxBB+q2f85tioV
         YaDq76YgKg19kavCxLDGCXYdqM9e4pt1+h8vMM1af+h493sGTqtu8x0x0Y7pDZ9rZODl
         D0Tmu44OHSSAi7XTfiw3ezo4lLtG/fvqKXr9UP1I7ioXEwEcTuWWl+MwWhGJYbEnMq+w
         ALx7B4du4u7jUwnaaQoo9t+S3X/fO96NeqeTQ28Ffuy5wSsYUMg78UyAtuMEUmLPhSNZ
         lUUoOAhyKE5fSjw0CUYEi+vy/hxr1Eua69Uhw+w3KzjGJP3OD8JUBE+JCzVqCd/mRebH
         8ZnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vTSxvUqfa6FoEiQTgKaCRKQ961VVqjF3zVcNDPTqeUQ=;
        b=C1NLGUVg2kROzvR3pJ6o9FSrwu5I0H0CuOyEmSlhaz1h0RLlSz74+drBJmtCzbsX8s
         M4MAkzFVMg/kqxBL5lYwUlfgxkhYql4wIeE/MsX54iJGUD30ybdfyPj833oRTNjqgWVw
         lrDjpxGIkyF03ytbQuDtttQh63Dh6wvtQyAHVmsnPIx4H62kuycMQVna00L5mtY/g129
         uKnSbxgkZy5rHsDvs21FwtVwyLu6jYojhtJQHkuzBsTLx+KrawTxc5sQP4mia8RQwNDc
         ai92670uxi4BUgu0LLkiYCno+zM0aMaq3+BxVNZaQf+lJG/E6wSQOGF7Bf4ZmQY1mSm1
         9O2Q==
X-Gm-Message-State: APjAAAXVf9AVC4rU1fW//aEUhvmELgaTo6fbu9iU2i+zJilts6icQe8l
        +PoO6aOBH3FiuCznTXDEiA73nK9c3xh/nS0Y4qePoQ==
X-Google-Smtp-Source: APXvYqwNVH+CrxZcMnxSwclo0S3v7qgeIyd4KN1mrRn3wdEhUWxce27y0yPjv6LZIAM/PDIfAV+2naYwlAPl2eY/5zg=
X-Received: by 2002:a7b:cd84:: with SMTP id y4mr1059323wmj.57.1576223256882;
 Thu, 12 Dec 2019 23:47:36 -0800 (PST)
MIME-Version: 1.0
References: <20191204141159.1432387-1-colin.king@canonical.com> <20191205080611.GY93017@google.com>
In-Reply-To: <20191205080611.GY93017@google.com>
From:   Maxime Jourdan <mjourdan@baylibre.com>
Date:   Fri, 13 Dec 2019 08:47:26 +0100
Message-ID: <CAMO6naxT0syj74xvcectWXyVGmHfOU341A+15tC+GW4hsq+yJQ@mail.gmail.com>
Subject: Re: [PATCH] media: meson: add missing allocation failure check on new_buf
To:     Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>
Cc:     Colin King <colin.king@canonical.com>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        linux-amlogic@lists.infradead.org, devel@driverdev.osuosl.org,
        linux-arm-kernel@lists.infradead.org,
        kernel-janitors@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Thu, Dec 5, 2019 at 9:06 AM Sergey Senozhatsky
<sergey.senozhatsky.work@gmail.com> wrote:
>
> On (19/12/04 14:11), Colin King wrote:
> [..]
> > diff --git a/drivers/staging/media/meson/vdec/vdec.c b/drivers/staging/media/meson/vdec/vdec.c
> > index 0a1a04fd5d13..8dd1396909d7 100644
> > --- a/drivers/staging/media/meson/vdec/vdec.c
> > +++ b/drivers/staging/media/meson/vdec/vdec.c
> > @@ -133,6 +133,8 @@ vdec_queue_recycle(struct amvdec_session *sess, struct vb2_buffer *vb)
> >       struct amvdec_buffer *new_buf;
> >
> >       new_buf = kmalloc(sizeof(*new_buf), GFP_KERNEL);
> > +     if (!new_buf)
> > +             return;
> >       new_buf->vb = vb;

Thanks for the patch Colin.

>
> So the buffer is not getting recycled? IOW is leaked?
>
>         -ss

The "recycle" mechanism in the meson vdec is a way to tell the
firmware that "hey, both userspace and kernel are done using this
buffer, you can start using it again".

Not queuing it for recycling means that the firmware won't use this
buffer again, it's not desirable of course, but if there is no memory
left to allocate a simple list element then there are bigger problems
at hand.

Either way, failing this allocation and returning instantly doesn't
leak anything or do any damage kernel-side.
