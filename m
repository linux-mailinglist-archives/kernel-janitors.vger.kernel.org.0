Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 83DEB10A34E
	for <lists+kernel-janitors@lfdr.de>; Tue, 26 Nov 2019 18:24:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728628AbfKZRYY (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Tue, 26 Nov 2019 12:24:24 -0500
Received: from mail-pg1-f196.google.com ([209.85.215.196]:40011 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728616AbfKZRYX (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 26 Nov 2019 12:24:23 -0500
Received: by mail-pg1-f196.google.com with SMTP id e17so9321135pgd.7
        for <kernel-janitors@vger.kernel.org>; Tue, 26 Nov 2019 09:24:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=b8USDfSi67+n5QmIEjkqw0xHLSOXAD0OKre/+CsAlyY=;
        b=WqR17hHpNHnT+OqFRxTnECAS6VxLuaUlXpRH400dg8yDi0QCb70FLtGHRex2nhWb6N
         fiHQ0CeQQfxkEqKC9XY/3rV6VseUdrWcnOzVetR7FyEtoO2mrMoUfiOGpeANag7mkKig
         /KgO5C4Pybs6agJUVTwQP/orGZxfvTQ2vBS/rk9vl3U5k+Y2F3pyOJPnxSqcZIjJ4B7b
         2qYeGUNVeXNz6e0a00Kueu0vrwXffguwYy6gbAMRHHRxdC47BHras4DyBdeEvNxv+t1G
         dfvoYBEEX6QM8sqkAk97/sKndtdjP/1VrKV8iTArz2J3HjH2k8QEI0lf9fCLZPSj6Sxf
         X3GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=b8USDfSi67+n5QmIEjkqw0xHLSOXAD0OKre/+CsAlyY=;
        b=lOdc1iVFKhG9bzU0fZUKspAO/L6klv4LmxsvV1p/Y0s18o3w6pswoztGXwYQ8bNLja
         lOGnJNgBvirTIaa2GdxvpftymmFaYZ/axGfDYZq0fFPpXsU3bH4oUyu7QtSVKidn11ZR
         Nrt2O5W2fPvZFDpxbd//3x5QxroQaN8DpzKjKlughHj0Fmr0/y2eeWRy/dxuLftmwLnv
         81PsKFjIYcUC022Xk4th8iTHhoSN4Mi6znx+NviLL1c/QAPLwSQRRC9F6ec0izcJt/ZW
         NJKV7koPTJYPbsqjs0aGoFF7UzoC6IPfuXe55IGkeAAH7Gl/b3BABblCkWE/kGwacPP2
         KRUA==
X-Gm-Message-State: APjAAAUhm4K0LbhUx+NSq3/ihhhDE6BcPHq0IhRnqeitvWKhnxWnFcIu
        nUw4lW5a5Q7fpsYuJmxByZfG7w4Oy/oWaSN22AkDkw==
X-Google-Smtp-Source: APXvYqxzcS+75MzEmr6shKwAMsNS2Rq8w6QNu6ay3w2CWPTSa6uH/xkHc0jBu5We2OgC5xS3qXodaJZPCjUoosyFhpk=
X-Received: by 2002:aa7:9151:: with SMTP id 17mr43002593pfi.3.1574789061374;
 Tue, 26 Nov 2019 09:24:21 -0800 (PST)
MIME-Version: 1.0
References: <20191126161255.323992-1-colin.king@canonical.com>
In-Reply-To: <20191126161255.323992-1-colin.king@canonical.com>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Tue, 26 Nov 2019 09:24:10 -0800
Message-ID: <CAKwvOdmG8Az=DFCODtehGTcLRYjEO2B6ZcDd=eNAF40dV-gw6Q@mail.gmail.com>
Subject: Re: [PATCH] KVM: x86/mmu: fix comparison of u8 with -1
To:     Colin King <colin.king@canonical.com>
Cc:     Paolo Bonzini <pbonzini@redhat.com>,
        =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@redhat.com>,
        Sean Christopherson <sean.j.christopherson@intel.com>,
        Vitaly Kuznetsov <vkuznets@redhat.com>,
        Wanpeng Li <wanpengli@tencent.com>,
        Jim Mattson <jmattson@google.com>,
        Joerg Roedel <joro@8bytes.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        "H . Peter Anvin" <hpa@zytor.com>,
        "maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>,
        kvm@vger.kernel.org,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        kernel-janitors@vger.kernel.org,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Tue, Nov 26, 2019 at 8:21 AM Colin King <colin.king@canonical.com> wrote:
>
> From: Colin Ian King <colin.king@canonical.com>
>
> The comparison of the u8 value __entry->u with -1 is always
> going to be false because a __entry-u can never be negative.
> Fix this by casting it to a s8 integer.
>
> Addresses clang warning:
> arch/x86/kvm/./mmutrace.h:360:16: warning: result of comparison
> of constant -1 with expression of type 'u8' (aka 'unsigned char')
> is always false [-Wtautological-constant-out-of-range-compare]

(__entry->u is defined as a u8)

>
> Fixes: 335e192a3fa4 ("KVM: x86: add tracepoints around __direct_map and FNAME(fetch)")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  arch/x86/kvm/mmutrace.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/x86/kvm/mmutrace.h b/arch/x86/kvm/mmutrace.h
> index 7ca8831c7d1a..3466cd528a67 100644
> --- a/arch/x86/kvm/mmutrace.h
> +++ b/arch/x86/kvm/mmutrace.h
> @@ -357,7 +357,7 @@ TRACE_EVENT(
>                   __entry->r ? "r" : "-",
>                   __entry->spte & PT_WRITABLE_MASK ? "w" : "-",
>                   __entry->x ? "x" : "-",
> -                 __entry->u == -1 ? "" : (__entry->u ? "u" : "-"),
> +                 (s8)__entry->u == -1 ? "" : (__entry->u ? "u" : "-"),

Or could compare against 0xFF instead of -1.  Either way, thanks for the patch.
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

>                   __entry->level, __entry->sptep
>         )
>  );


-- 
Thanks,
~Nick Desaulniers
