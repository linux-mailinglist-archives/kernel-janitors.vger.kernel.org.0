Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 95E81D16DC
	for <lists+kernel-janitors@lfdr.de>; Wed,  9 Oct 2019 19:34:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731940AbfJIRd6 (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Wed, 9 Oct 2019 13:33:58 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:39752 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731636AbfJIRd5 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 9 Oct 2019 13:33:57 -0400
Received: by mail-pg1-f194.google.com with SMTP id e1so1853875pgj.6
        for <kernel-janitors@vger.kernel.org>; Wed, 09 Oct 2019 10:33:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=64S7upTOSmWG0FCz/0I/kvz+kUrhwKMMzAjL3YUfyOs=;
        b=DSdoE+uZ8L84E0Kcmx2jHsU0q/gI//xKqNOllvCfYRUntJA+pUlFzfJtSXTEcLXyX4
         j1EwkWD7j+gFVNlodHVCQYxqxjmF3q7orwFpAqRUEkSd4pdrjK798MkkMZX1wNZGUH9/
         Pw7IIbBkSkicTTKgr/5eE51cPxnC6i1khe24LxPRdLtgbzTjKL0eKDsEENONEeDCwTTr
         ZnTicT40oNjua9Qf63YTQTeTC0i45A8GkMa6t0POwzb+Q/e55Ghn8KzmzDWFWgIz4fk3
         3nZ9muHXPRbMvDgmr1Esod5fKkg/MiCLzRcsnSGTXsI4nTX3CU0vbpb+Y0o5ur5f+k1O
         VWiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=64S7upTOSmWG0FCz/0I/kvz+kUrhwKMMzAjL3YUfyOs=;
        b=rA6rwRTQHAR8pE1ovngIXMAV2jrOiPCZPQBTD7oxqGJ8jd1tbHeOLuLIBeDadMhPZy
         2yp1BaJZC+tO/EUzfLQetAuGYAZlrLNCtmJgYbDD3JtLF0ukO/GyFIuMiTxtf5Ldyim5
         h51EiL9y5D7xp82L5ib6SIRvwTJrp1zrCF8Ipg6l52xuBCzHlcoZfx7JxV3Jr53/cRGB
         kfM8s0o25zK0zFJP+jheZq7Wn+8RV1W+bYE6hw5tWhwGsNRhzogypuRwCoreJ7WiLHDb
         MZbq3D9BIKoRRGT/czZbX8QSJvIqBrJMPkgnK3AW03jNRxfNBBYnni8XDc7pw9qoej4G
         qr8A==
X-Gm-Message-State: APjAAAV7HJlMYSoYWY6Q9siw+URAFogewUzVNAj6T1dLCCqWzLRngw4I
        uaqWCWXs1xo3n/emUo6n5IewTf3gCKocWSjihfvNQw==
X-Google-Smtp-Source: APXvYqyYmowyP3iUTgyzvcK5h0aRQld1QATwfs+5wymVcbcvYv0z8ISTaj+tGweCKO4zq9qsyd9/i890PgqX3lydTWg=
X-Received: by 2002:a17:90a:aa81:: with SMTP id l1mr1002058pjq.73.1570642436661;
 Wed, 09 Oct 2019 10:33:56 -0700 (PDT)
MIME-Version: 1.0
References: <75f70e5e-9ece-d6d1-a2c5-2f3ad79b9ccb@web.de> <20191009110943.7ff3a08a@gandalf.local.home>
 <CAKwvOdk3OTaAVmbV9Cu+Dzg8zuojjU6ENZfu4cUPaKS2a58d3w@mail.gmail.com> <4d890cae9cbbd873096cb1fadb477cf4632ddb9a.camel@perches.com>
In-Reply-To: <4d890cae9cbbd873096cb1fadb477cf4632ddb9a.camel@perches.com>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Wed, 9 Oct 2019 10:33:45 -0700
Message-ID: <CAKwvOdntBXd3OPiCV5adcDjXor886-XnsSxcStAjYBJpuEBrqQ@mail.gmail.com>
Subject: Re: [PATCH] string.h: Mark 34 functions with __must_check
To:     Joe Perches <joe@perches.com>
Cc:     Steven Rostedt <rostedt@goodmis.org>,
        Markus Elfring <Markus.Elfring@web.de>,
        kernel-janitors@vger.kernel.org,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Kees Cook <keescook@chromium.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Wed, Oct 9, 2019 at 9:38 AM Joe Perches <joe@perches.com> wrote:
>
> On Wed, 2019-10-09 at 09:13 -0700, Nick Desaulniers wrote:
> > On Wed, Oct 9, 2019 at 8:09 AM Steven Rostedt <rostedt@goodmis.org> wro=
te:
> > > On Wed, 9 Oct 2019 14:14:28 +0200 Markus Elfring <Markus.Elfring@web.=
de> wrote:
> []
> > > > Several functions return values with which useful data processing
> > > > should be performed. These values must not be ignored then.
> > > > Thus use the annotation =E2=80=9C__must_check=E2=80=9D in the shown=
 function declarations.
> []
> > > I'm curious. How many warnings showed up when you applied this patch?
> >
> > I got zero for x86_64 and arm64 defconfig builds of linux-next with
> > this applied.  Hopefully that's not an argument against the more
> > liberal application of it?  I view __must_check as a good thing, and
> > encourage its application, unless someone can show that a certain
> > function would be useful to call without it.
>
> stylistic trivia, neither agreeing nor disagreeing with the patch
> as I generally avoid reading Markus' patches.
>
> I believe __must_check is best placed before the return type as
> that makes grep for function return type easier to parse.
>
> i.e. prefer
>         [static inline] __must_check <type> <function>(<args...>);
> over
>         [static inline] <type> __must_check <function>(<args...>);
>

+ Miguel
So I just checked `__cold`, and `__cold` is all over the board in
style.  I see it:
1. before anything fs/btrfs/super.c#L101
2. after static before return type (what you recommend) fs/btrfs/super.c#L2=
318
3. after return type fs/btrfs/inode.c#L9426

Can we pick a style and enforce it via checkpatch? (It's probably not
fun to check for each function attribute in
include/linux/compiler_attributes.h).
--=20
Thanks,
~Nick Desaulniers
