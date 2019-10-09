Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7C7E6D16DE
	for <lists+kernel-janitors@lfdr.de>; Wed,  9 Oct 2019 19:34:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732103AbfJIReK (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Wed, 9 Oct 2019 13:34:10 -0400
Received: from mail-pg1-f181.google.com ([209.85.215.181]:34750 "EHLO
        mail-pg1-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731922AbfJIReK (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 9 Oct 2019 13:34:10 -0400
Received: by mail-pg1-f181.google.com with SMTP id y35so1866963pgl.1
        for <kernel-janitors@vger.kernel.org>; Wed, 09 Oct 2019 10:34:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=UjqBpI06iiBQsYq2V/w1u3B49phxB0GEC0jogQFNuAQ=;
        b=VpbQlUwjjLfHn3Nl+VhVs9C7cU3yzf7C0n4quuU8lytEoqyUJC0yVNtMeHEZxONwBG
         +eV+gN3RZwnzE7CxdlcBlpmJZraEgcFjy2kIGL6jfc/1KK+D8rNWCiTKduAB3N91NGvj
         cQhRgcL9EpWrytbjz1xyIeg327Oyr2RrgIQn04UvW3L7ffdwYj/uGlzs5ITF5lphYCOT
         8RTQY1UykssE6uoOOc8lVJG8jdMk3eNpBL6a1Er12MGcEzMBrhbz/GG0unCR7nXMnCZs
         W/OHJSaChQcwRhiX4KQjVyBnvdmlpCn+i1k6ns8NjGzkY2C5ENY+sqH72upAzEDIjRkh
         uN4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=UjqBpI06iiBQsYq2V/w1u3B49phxB0GEC0jogQFNuAQ=;
        b=k0Ppda9D/BfqOsyQuOtyx3/DxO7MqBU9grrkXgrH07PAGmLWE30vkLefIP6N1Uh5yU
         DNOGGouI6w0/jeFUkZjj73jppxcOD9nZRRkDtlPQ7i9zZyrHuURHPzCadCg+X6m7lAnt
         6iR8VwbdYL5bj/blQHE+AjIXXaVtop4tLIy3vYeC3AbPRAGF/+fNY/BbYRYtB74GhQwU
         ddV/jasPIdHgf28LUtCgfVUD+5An0dA597l5K0K1OAUmkrEpmbtoiMrNPEmNvRuUVJAF
         qfb4GK/sBDFY4eTVfGooAL3H1KkZ9/YUG3X9Q8w6zMiPNWr8kqMuPAtJBfVxpeOIE1/P
         rbDQ==
X-Gm-Message-State: APjAAAXtT0DP6hEKNa3byPyu4XLx8jkFxra0y4iSRWCIG9HnEuXHp+fD
        ZFUodujWZpBjrqil7y/rGLhpJPa3BVs35SIrFngc7g==
X-Google-Smtp-Source: APXvYqwqUks7z0CCplcskgsaNVDeVXtoWQQW90hGAq5OkREAcD/1wk1zlhagtSzy/wUXtmb6E4JS72pJV8olbVRaXeg=
X-Received: by 2002:a63:5a03:: with SMTP id o3mr5500405pgb.381.1570642448938;
 Wed, 09 Oct 2019 10:34:08 -0700 (PDT)
MIME-Version: 1.0
References: <75f70e5e-9ece-d6d1-a2c5-2f3ad79b9ccb@web.de> <20191009110943.7ff3a08a@gandalf.local.home>
 <CAKwvOdk3OTaAVmbV9Cu+Dzg8zuojjU6ENZfu4cUPaKS2a58d3w@mail.gmail.com>
 <20191009122735.17415f9c@gandalf.local.home> <CAKwvOdkvgeHnQ_SyR7QUqpsmtMPRe1SCJ_XJLQYv-gvLB6rbLg@mail.gmail.com>
 <b8bdfb25-deb8-9da0-3572-408b19bb0507@web.de>
In-Reply-To: <b8bdfb25-deb8-9da0-3572-408b19bb0507@web.de>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Wed, 9 Oct 2019 10:33:57 -0700
Message-ID: <CAKwvOd=Jo5UkQN9A9rTJf0WtsxXNjaJ=jxf2gwHFdW8om-fbTQ@mail.gmail.com>
Subject: Re: string.h: Mark 34 functions with __must_check
To:     Markus Elfring <Markus.Elfring@web.de>
Cc:     Steven Rostedt <rostedt@goodmis.org>,
        kernel-janitors@vger.kernel.org,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Joe Perches <joe@perches.com>,
        Kees Cook <keescook@chromium.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Wed, Oct 9, 2019 at 10:04 AM Markus Elfring <Markus.Elfring@web.de> wrote:
>
> > Ah, granted, I was surprised, too.
>
> Thanks for this view.

I mean, it's a good thing that we don't have any issues that this
patch would catch today.  Seems Steven and I were surprised
(pessimistic?).

>
>
> > Maybe would be helpful to mention that in the commit message.
>
> My Linux software build resources might be too limited to take
> more system configuration variations safely into account
> for this issue.

That's understandable. I think if the patch bakes in linux-next, it
might flush out some problematic cases in other ARCH's.

> Would you like to achieve further checks here?

I reviewed the functions here and believe the ones you added checks
for all look good.  I value Rasmus' feedback, so I'd like to hear what
he thinks about my earlier comments.  I have no comment if we should
go further/annotate more, other than that that can be done in a follow
up patch.  Though Joe's comment on the relative order of where the
annotation appears in the function declarations should be addressed in
a V2 IMO.
-- 
Thanks,
~Nick Desaulniers
