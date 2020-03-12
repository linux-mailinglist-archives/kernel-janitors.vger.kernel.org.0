Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D7B45182FDE
	for <lists+kernel-janitors@lfdr.de>; Thu, 12 Mar 2020 13:06:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726932AbgCLMGg (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Thu, 12 Mar 2020 08:06:36 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:45812 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726044AbgCLMGg (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 12 Mar 2020 08:06:36 -0400
Received: by mail-wr1-f67.google.com with SMTP id m9so7081436wro.12
        for <kernel-janitors@vger.kernel.org>; Thu, 12 Mar 2020 05:06:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=WpIF59sushRUzQN6JFPoJ2ob7mS8MGSjQgRAtDMNHBs=;
        b=IP3ABaitp1o1i8i4tS3GZkiE1lze4gcNrgfGixIs7X3iDBfMmRoX/QUCwfKK7Pubt3
         WJaqkGTvHbPJ2dZW3uq0Z6X7ryK1WqR33Nif/+lQatPxW9IsShhy+1yFhCCNChpDYWAq
         lecZu/uTsgJ7MIAF1utJOaOP9y9rggX0E47GI4019g6VNBxeKB56MhFtQb7GJRrresdF
         Xe7XEsR59mrvqopwsswO3pSiaKe+svMQ0B8GKFICSceRWiDXnt+9Vbvq9eBsatrtOkFT
         lHL8Qm0x/C7DNVKolSUtm5K7MTa0X0N/nXw52GHc4PHBrxxSyaykpCie5jqGmVqCl8Iw
         QyYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=WpIF59sushRUzQN6JFPoJ2ob7mS8MGSjQgRAtDMNHBs=;
        b=J5xL+lK8eTlZ+CEctsVpoQvJZqg0vHrUoYWkqKLqSzo09BHgeS2R+pEAE+RxrO+QC/
         dnvlGVzCXXfZL8ISrLRwhzvUKBu9ws4NMr5y6vxpapkmpJSAMQo2GjF2AHpkwlq/vk7t
         5NkZR3M+U0jMkBJX8h04ZVyMeJX7p+hfHMmMrgJ0l80b6izrLXy/xQdwJR4v5TVq+oPe
         C5DdiJQYSGgm404ytF+9xPltJnuANChzrM6LMlgaRgN0yR4mSjFVHXLCknX3Jz6FA7DF
         /OnMW3+VEoE1lydalrapmlZX09VUdke5z8e5W0N2JYuVfMBht2aFahqSFLNm/dtzfcto
         kGFg==
X-Gm-Message-State: ANhLgQ2FQC+patXKejLse8M4rybOHqkgk2KQfbbPgy4eEBXqfTMia4Ef
        YGaWlA5uUIbxpSfJccOqdLiWaWr0unvnanByid6pLQ==
X-Google-Smtp-Source: ADFU+vuG4nmHESpyz83ycBTMualHGTG00Wir4cgLn4BKFEmt3VQqAC1YdhwQi5UUXGr4YGTw3WJ7f7+rh1jsecG7oNs=
X-Received: by 2002:adf:e98c:: with SMTP id h12mr10978634wrm.345.1584014794085;
 Thu, 12 Mar 2020 05:06:34 -0700 (PDT)
MIME-Version: 1.0
References: <20200312113006.GA20562@mwanda>
In-Reply-To: <20200312113006.GA20562@mwanda>
From:   Alexander Potapenko <glider@google.com>
Date:   Thu, 12 Mar 2020 13:06:23 +0100
Message-ID: <CAG_fn=WP0xeCaWpWzhzvT-uxW4w1dvVvxZ=yBGKGTNFwjD=gJw@mail.gmail.com>
Subject: Re: [PATCH] lib/stackdepot.c: fix a condition in stack_depot_fetch()
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Thomas Gleixner <tglx@linutronix.de>,
        Andrew Morton <akpm@linux-foundation.org>,
        Josh Poimboeuf <jpoimboe@redhat.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Miles Chen <miles.chen@mediatek.com>,
        LKML <linux-kernel@vger.kernel.org>,
        kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Thu, Mar 12, 2020 at 12:30 PM Dan Carpenter <dan.carpenter@oracle.com> w=
rote:
>
> We should check for a NULL pointer first before adding the offset.
> Otherwise if the pointer is NULL and the offset is non-zero, it will
> lead to an Oops.

 Thanks!

> Fixes: d45048e65a59 ("lib/stackdepot.c: check depot_index before accessin=
g the stack slab")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Acked-by: Alexander Potapenko <glider@google.com>

> ---
>  lib/stackdepot.c | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)
>
> diff --git a/lib/stackdepot.c b/lib/stackdepot.c
> index da5d1880bf34..2caffc64e4c8 100644
> --- a/lib/stackdepot.c
> +++ b/lib/stackdepot.c
> @@ -207,18 +207,16 @@ unsigned int stack_depot_fetch(depot_stack_handle_t=
 handle,
>         size_t offset =3D parts.offset << STACK_ALLOC_ALIGN;
>         struct stack_record *stack;
>
> +       *entries =3D NULL;
>         if (parts.slabindex > depot_index) {
>                 WARN(1, "slab index %d out of bounds (%d) for stack id %0=
8x\n",
>                         parts.slabindex, depot_index, handle);
> -               *entries =3D NULL;
>                 return 0;
>         }
>         slab =3D stack_slabs[parts.slabindex];
> -       stack =3D slab + offset;
> -       if (!stack) {
> -               *entries =3D NULL;
> +       if (!slab)
>                 return 0;
> -       }
> +       stack =3D slab + offset;
>
>         *entries =3D stack->entries;
>         return stack->size;
> --
> 2.20.1
>


--=20
Alexander Potapenko
Software Engineer

Google Germany GmbH
Erika-Mann-Stra=C3=9Fe, 33
80636 M=C3=BCnchen

Gesch=C3=A4ftsf=C3=BChrer: Paul Manicle, Halimah DeLaine Prado
Registergericht und -nummer: Hamburg, HRB 86891
Sitz der Gesellschaft: Hamburg
