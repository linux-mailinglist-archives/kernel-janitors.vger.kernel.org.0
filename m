Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1CE2F294FD2
	for <lists+kernel-janitors@lfdr.de>; Wed, 21 Oct 2020 17:20:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2502391AbgJUPUH (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Wed, 21 Oct 2020 11:20:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44870 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2502339AbgJUPUG (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 21 Oct 2020 11:20:06 -0400
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com [IPv6:2a00:1450:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E8EAEC0613CF
        for <kernel-janitors@vger.kernel.org>; Wed, 21 Oct 2020 08:20:05 -0700 (PDT)
Received: by mail-lf1-x143.google.com with SMTP id z2so3655173lfr.1
        for <kernel-janitors@vger.kernel.org>; Wed, 21 Oct 2020 08:20:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=cLcG8lvZq4hgK/VaoRnkMULOJQjO5EInk9g+zvCqUnE=;
        b=MAl/r4jqE+KR+6HrB1QvElLmxWwwM0yeVDZmh9oL+39m6yRG4uAWO4X987YERTSAEz
         DXHAHUB/vqvig4pg86f5KMONuMrmAJHRqiAWA+i5ROD/Wskva+HM3Z1wuYKyF8EjZPLe
         nGu8JDvSKQRU/5I6kzv9LGVKkG5z0lYl8Ored5bfoQdh2QVWZaDVhD5KMVDqIP2WZNMD
         Gj+vj8rkYilmwuzbB3mT3x/SfQO/zG2pmiISKdzTq1wZ7Mek8YBgInt3ITLhz5tYT1I7
         Rc8Cr/J7e28upXDXhRqLDSOaohbtS/zs7MPDhkOd9kQL/EFGT4fLwPG537iuMY1aiGr3
         R8QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cLcG8lvZq4hgK/VaoRnkMULOJQjO5EInk9g+zvCqUnE=;
        b=UEj+Ds/AUIsg79VGsXBGC/rRiBFd4OypsLsnutzhz0KeBdzRotLrocDxZyGIlDmpF0
         6nbIkEErPUJkc0iXfqZHNKfzxPEHvySqrx8KDuFuExYRMYcj8qdGYVkmer0oxJD3lwQ6
         kLYEcqooRS6uogZmh9W1zQwGq3er1289obSH5LPl3ih/5EwGcTxX8hgULFMAkDU3RoKG
         68dIidKHMrQX0HYZDHSoXR3uiUvJg816JagHG4FX5ok0dywo3EFnkVdzeD0GSHkjCs/q
         CAefW/MHCglYAvfgaxBUCOZAmiTHvI2HtjNBWvewosEMOgBghzE/xBdcnE5aAdnrsRVH
         ubxw==
X-Gm-Message-State: AOAM532VQWxISI28e6AtcIlhC2joa9z2VHwYh60ANdoF16zFbX6sosKX
        AodMUtuWmBmGEqe4yDbsNXFBt+QFBUsjdBcZrJyBIQ==
X-Google-Smtp-Source: ABdhPJxh45xMUoIAO1fqQeMLB7+/MFKy1enZ2D42K2i4BqZ+QN2XbRGLVllTzusQVEaBm3qaw/c//PjEv9Sc9wiFOuI=
X-Received: by 2002:a19:d10:: with SMTP id 16mr1375520lfn.385.1603293604386;
 Wed, 21 Oct 2020 08:20:04 -0700 (PDT)
MIME-Version: 1.0
References: <1603211879-1064-1-git-send-email-Julia.Lawall@inria.fr>
 <20201021112038.GC32041@suse.de> <20201021122532.GA30733@vingu-book>
 <20201021124700.GE32041@suse.de> <alpine.DEB.2.22.394.2010211452100.8475@hadrien>
 <20201021131827.GF32041@suse.de> <alpine.DEB.2.22.394.2010211522340.57356@hadrien>
 <20201021150800.GG32041@suse.de>
In-Reply-To: <20201021150800.GG32041@suse.de>
From:   Vincent Guittot <vincent.guittot@linaro.org>
Date:   Wed, 21 Oct 2020 17:19:53 +0200
Message-ID: <CAKfTPtDs1t6mt7fPgoGg+fT-JKmaqWybNVBN3kZhag6M4+8RUg@mail.gmail.com>
Subject: Re: [PATCH] sched/fair: check for idle core
To:     Mel Gorman <mgorman@suse.de>
Cc:     Julia Lawall <julia.lawall@inria.fr>,
        Ingo Molnar <mingo@redhat.com>,
        kernel-janitors@vger.kernel.org,
        Peter Zijlstra <peterz@infradead.org>,
        Juri Lelli <juri.lelli@redhat.com>,
        Dietmar Eggemann <dietmar.eggemann@arm.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Ben Segall <bsegall@google.com>,
        Daniel Bristot de Oliveira <bristot@redhat.com>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Valentin Schneider <valentin.schneider@arm.com>,
        Gilles Muller <Gilles.Muller@inria.fr>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Wed, 21 Oct 2020 at 17:08, Mel Gorman <mgorman@suse.de> wrote:
>
> On Wed, Oct 21, 2020 at 03:24:48PM +0200, Julia Lawall wrote:
> > > I worry it's overkill because prev is always used if it is idle even
> > > if it is on a node remote to the waker. It cuts off the option of a
> > > wakee moving to a CPU local to the waker which is not equivalent to the
> > > original behaviour.
> >
> > But it is equal to the original behavior in the idle prev case if you go
> > back to the runnable load average days...
> >
>
> It is similar but it misses the sync treatment and sd->imbalance_pct part of
> wake_affine_weight which has unpredictable consequences. The data
> available is only on the fully utilised case.

In fact It's the same because runnable_load_avg was null when cpu is idle, so
if prev_cpu was idle, we were selecting prev_idle

>
> > The problem seems impossible to solve, because there is no way to know by
> > looking only at prev and this whether the thread would prefer to stay
> > where it was or go to the waker.
> >
>
> Yes, this is definitely true. Looking at prev_cpu and this_cpu is a
> crude approximation and the path is heavily limited in terms of how
> clever it can be.
>
> --
> Mel Gorman
> SUSE Labs
