Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F040BD140C
	for <lists+kernel-janitors@lfdr.de>; Wed,  9 Oct 2019 18:32:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731072AbfJIQby (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Wed, 9 Oct 2019 12:31:54 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:45102 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730490AbfJIQby (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 9 Oct 2019 12:31:54 -0400
Received: by mail-pf1-f193.google.com with SMTP id y72so1932308pfb.12
        for <kernel-janitors@vger.kernel.org>; Wed, 09 Oct 2019 09:31:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9nf7u/DpN+UvmOc+X6Pn/TOzCQgvjuIAoUeIrKDqhOs=;
        b=smeXb+TaQDZzPZI77MMQ6A+FAFRKVsfqu9h7bS9KWiVMXnCuy1IjjGiaJW7S2F+qnx
         Y8psAq4+fKEWqaspnehwoziKN/deGKig46ZPlKc5UXSknlPmtxAGqFByMwmcKThJv0wE
         uJLgBecBcDil6Rznj6xin25vBbInmRkAzb/dyqMIPOdsFpgFAnG1f8Q+8P/pdOcGPYiX
         dk9Fh/FOo/+HYbJiGAXdi5QUM5ZBWkWGcJDAd9E3m5X91OeNETZJEO0r8Qv5DTfwD7yb
         Ow1M92Pifwmih8DqNAKXrVyDvsVczkLkkcxybHBnrMJCBruFmQT3e5ad4Y/6FSJdGum1
         PF7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9nf7u/DpN+UvmOc+X6Pn/TOzCQgvjuIAoUeIrKDqhOs=;
        b=DhY8jekT2lpt8jR0nuNi37+Qwh26Dq7UbRTBz0cChciOD0T4Nbfo4inaGOvakKKmaQ
         DchpGVQ62m8dqS1ZNCfNTLseE+QhO4zVlzxff6yWC0swDNY4Hb9cEQwda8cC+xBbZyCf
         CcjxxoGzTU9Ko94OsznKWPMSniKT0j+39YUgDDWOCu0CIN6Zsd8k5KABQycKPh2Q+6Y3
         3MLoRYXbIChaZkgMWE76IZ/bCY/giXWZ9/zTwpHsJ9KTouBoTn6CWSm3I09zRKWhs/4F
         koSf8nM1fByN+uT/Z7elbkIq6y446d9qp0j+y6UX+W3glhPlPit735dReIGmHsMtWBML
         nJ+Q==
X-Gm-Message-State: APjAAAVetUTLQ8czi1cs0zL6S9ye4aItMuufvgBBbP5JhL7Uj75Nn1Ut
        xCcgLmV50LftWBeiGYd3SJ4mOpBfyK6VE3OkDsUm5g==
X-Google-Smtp-Source: APXvYqyWTYeRXxu0NnZwGgg4GtwrNDKfF3Z+RAYdz4/TLEgzyStHnPhscZc65pKeJf+euEPpuQikDtxAoadVPBfeVwo=
X-Received: by 2002:a65:464b:: with SMTP id k11mr5398978pgr.263.1570638712909;
 Wed, 09 Oct 2019 09:31:52 -0700 (PDT)
MIME-Version: 1.0
References: <75f70e5e-9ece-d6d1-a2c5-2f3ad79b9ccb@web.de> <954c5d70-742f-7b0e-57ad-ea967e93be89@rasmusvillemoes.dk>
 <20191009135522.GA20194@kadam> <b1f055ec-b4ec-d0ed-a03d-7d9828fa9440@rasmusvillemoes.dk>
 <20191009143000.GD13286@kadam>
In-Reply-To: <20191009143000.GD13286@kadam>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Wed, 9 Oct 2019 09:31:41 -0700
Message-ID: <CAKwvOd=Jkd_qJULB+i1u31VJAex6KB=wFAyXO04V0UcAAEZeXw@mail.gmail.com>
Subject: Re: [PATCH] string.h: Mark 34 functions with __must_check
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        Markus Elfring <Markus.Elfring@web.de>,
        kernel-janitors@vger.kernel.org,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Joe Perches <joe@perches.com>,
        Kees Cook <keescook@chromium.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Wed, Oct 9, 2019 at 7:30 AM Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> On Wed, Oct 09, 2019 at 04:21:20PM +0200, Rasmus Villemoes wrote:
> > On 09/10/2019 15.56, Dan Carpenter wrote:
> > > That's because glibc strlen is annotated with __attribute_pure__ which
> > > means it has no side effects.
> >
> > I know, except it has nothing to do with glibc headers. Just try the
> > same thing in the kernel. gcc itself knows this about __builtin_strlen()
> > etc. If anything, we could annotate some of our non-standard functions
> > (say, memchr_inv) with __pure - then we'd both get the Wunused-value in
> > the nonsense cases, and allow gcc to optimize or reorder the calls.
>
> Huh.  You're right.  GCC already knows.  So this patch is pointless like
> you say.

Is it? None of the functions in include/linux/string.h are currently
marked __pure today.  (Side note, I'm surprised that any function that
accepts a pointer could be considered pure. I could reassign pointed
to value without changing the pointers value. I can see strlen being
"pure" for string literals, but not for char[].  This is something
I'll play with more, I've already spotted one missed optimization in
LLVM: https://bugs.llvm.org/show_bug.cgi?id=43624).

I think it would be an interesting study to see how often functions
that have return codes are ok to not check vs aren't ok (in a large
production codebase like the Linux kernel), similar to how 97% of
cases fallthrough is unintentional (which to me sounds like maybe the
default behavior of the language is incorrect).
-- 
Thanks,
~Nick Desaulniers
