Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 562DEEA1A9
	for <lists+kernel-janitors@lfdr.de>; Wed, 30 Oct 2019 17:22:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727297AbfJ3QVz (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Wed, 30 Oct 2019 12:21:55 -0400
Received: from mail-oi1-f195.google.com ([209.85.167.195]:45135 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727279AbfJ3QVy (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 30 Oct 2019 12:21:54 -0400
Received: by mail-oi1-f195.google.com with SMTP id k2so2449881oij.12
        for <kernel-janitors@vger.kernel.org>; Wed, 30 Oct 2019 09:21:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=B4YfyDvcjYY9edtaAxaWe+R+x3fMKG/oWbf1ji+gZ9o=;
        b=SeJKbZ9buhy2hrsu7Su0+IXH+BHUtWsjdWMqxQ3NYmzMrpXlqJRZwiTeHesgNUwvKm
         hfSYTym4woJjWQD/xLJhZ6zpdhWHjyA2fa6nUk7U5FmsrnBjFi4Lc/mv77qRDLNHYfnq
         QxeLbVhmTcbMJ/GIeRZ9IkFXxissadJ3cqUNTpN+3V3JDuuNMJQQEdXsnfHl8VCAX4gO
         3z3gH6eCt4mrxl2slCES2KxCq61zzxU+EbTr7QxQw8HCzv/y0kpZYG33T5WpI1Vf+13J
         7ppEwSlA76oy9FWP0xMug3pXLkhQZ/NhOsr+THBOeyyDRtkz2O4Zl1JyB85bKdHa0Mms
         ytxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=B4YfyDvcjYY9edtaAxaWe+R+x3fMKG/oWbf1ji+gZ9o=;
        b=eKf41MDC22xtCBNmzaV40FiUZs5iM272UXeiTsKncpjKq04OqJlXFWuwIwkcsQBYlT
         ZXd/Pd8hGajeXk2Ajec5j4oYdsocWiq/uXL8gIoFxfVNrZ1LqdmHVm8+6XY2Oc1/iPcn
         1aYJ8GxXzkoZSxQDTA/LejDCWMnoIYpJSnXza0szpod/zfNdZKqrUGWxwB9JvvkPNSIx
         dNSsBGK3ZUS2OjbibxLBv0TU2x88ZiNWfzsOwoWPmnEs5UNtpqji4tKq8HdEI+x+WKDP
         NamKs1cxKDw+6RawamnoHXnnjQQu0xfsuhEqSgsKowyuePgqehuRB2kdyl0r7SX2RjE7
         7q0A==
X-Gm-Message-State: APjAAAWzjcZcYhC6PUct55dvokcmwfxtpWw39oTaI3TZAyQVPJIfls38
        HJ8jprvfMajdQciw2PnVf7Ky2nHE2pdb5gcSMV93ZA==
X-Google-Smtp-Source: APXvYqx/3LD0Wi6ZtOSveEWM/gRe/gZI+G4wG7E22gydAW8YY7t20K75PurFbX1LRPthN3mbGMzOaKzEU+05LiKmGXI=
X-Received: by 2002:a05:6808:a04:: with SMTP id n4mr47802oij.44.1572452512534;
 Wed, 30 Oct 2019 09:21:52 -0700 (PDT)
MIME-Version: 1.0
References: <20191030150253.10596-1-colin.king@canonical.com> <673b3e8f-9211-2fa2-c408-4560b03b4700@ti.com>
In-Reply-To: <673b3e8f-9211-2fa2-c408-4560b03b4700@ti.com>
From:   John Stultz <john.stultz@linaro.org>
Date:   Wed, 30 Oct 2019 09:21:41 -0700
Message-ID: <CALAqxLVvkd73zQria9C+QcyF1P2cZ7=pOpVQO+AyWzqJQ_q3Yw@mail.gmail.com>
Subject: Re: [PATCH][next] dma-buf: heaps: remove redundant assignment to
 variable ret
To:     "Andrew F. Davis" <afd@ti.com>
Cc:     Colin King <colin.king@canonical.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Benjamin Gaignard <benjamin.gaignard@linaro.org>,
        Liam Mark <lmark@codeaurora.org>,
        Laura Abbott <labbott@redhat.com>,
        Brian Starkey <brian.starkey@arm.com>,
        linux-media@vger.kernel.org,
        dri-devel <dri-devel@lists.freedesktop.org>,
        "moderated list:DMA BUFFER SHARING FRAMEWORK" 
        <linaro-mm-sig@lists.linaro.org>, kernel-janitors@vger.kernel.org,
        lkml <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Wed, Oct 30, 2019 at 8:45 AM Andrew F. Davis <afd@ti.com> wrote:
>
> On 10/30/19 11:02 AM, Colin King wrote:
> > From: Colin Ian King <colin.king@canonical.com>
> >
> > The variable ret is being assigned with a value that is never
> > read, it is being re-assigned the same value on the err0 exit
> > path. The assignment is redundant and hence can be removed.
> >
> > Addresses-Coverity: ("Unused value")
> > Fixes: 47a32f9c1226 ("dma-buf: heaps: Add system heap to dmabuf heaps")
> > Signed-off-by: Colin Ian King <colin.king@canonical.com>
> > ---
>
>
> The root of the issue is that ret is not used in the error path, it
> should be, I suggest this fix:
>
> > --- a/drivers/dma-buf/heaps/system_heap.c
> > +++ b/drivers/dma-buf/heaps/system_heap.c
> > @@ -98,7 +98,7 @@ static int system_heap_allocate(struct dma_heap *heap,
> >  err0:
> >         kfree(helper_buffer);
> >
> > -       return -ENOMEM;
> > +       return ret;
> >  }

Sounds good! If its ok I'll generate a commit crediting Colin for
reporting the issue and Andrew for the fix and submit it to Sumit.

Many thanks to you both!
-john
