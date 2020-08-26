Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DCAEB2531CA
	for <lists+kernel-janitors@lfdr.de>; Wed, 26 Aug 2020 16:48:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727081AbgHZOr6 (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Wed, 26 Aug 2020 10:47:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33160 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726977AbgHZOrz (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 26 Aug 2020 10:47:55 -0400
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com [IPv6:2a00:1450:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DFA53C061574
        for <kernel-janitors@vger.kernel.org>; Wed, 26 Aug 2020 07:47:53 -0700 (PDT)
Received: by mail-ej1-x644.google.com with SMTP id e23so2468781ejb.4
        for <kernel-janitors@vger.kernel.org>; Wed, 26 Aug 2020 07:47:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jpXoOzxjmaSPieMUrMwjgj+f7eMHv3D0MiHLZevapy8=;
        b=uuviY+HHY4G/qSfupdmikJBac7QR65ENkowJ6J/jYfnCePd8Xn9EiwqHhGK6jIRITH
         a5Ep6mk1NvA/fuR+G8ichkTPQwvkzP/b3MyrRRTinYparaXT/281yKXIj/TpRYdqsI6I
         5g6azBhlombBDx76l6r3mMxwJbwbzZ332F9aN5vanV+W1jG8CuvLqfa45p36iPiLfgcX
         aFEkVindyv2dVZDV1qIptDPZ9WkKPuSIrA6dN4bs21tIv/aKU9gbU+RKZxkgnY6iIs4S
         ++3D7x6o/4rTIV7zlf0n6Xr4eWd8x+fZliorBKrrERgW/wA9Mr4GSs4fq3+oqfodZeNI
         dGng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jpXoOzxjmaSPieMUrMwjgj+f7eMHv3D0MiHLZevapy8=;
        b=OJRaONLGgZ0nMUA4+mLN9OmB/pEuOw6rY4/joNbF+Jlu2IL4Q4rSupqRuwusqvjfyJ
         b7Mn7uKsrpstdbDM7Nz/Bh0i3R1wNPyUXx3w7YV3HU8VKwz/Q351ceEgSDwQ3bDKvRZA
         J3NqovkTR5TsVTyOMiS4bhpmGzUBGSpbRoMVvunqvExdR49wv48f6hGzH0VStLzksCvb
         MRqib9VOdY7pJgfQLc5ZzerXMoIP/kCuw2MFoTEUAkZUvlbPcVjKmljwsnzbSjnr+ouk
         iy0THGeKAws9/1hqcC6laECL769daGAb71W3DI+AX1YwVHjHGK/Kl6IC1ptM9lJ+VXJe
         r5GQ==
X-Gm-Message-State: AOAM533lIpVLj229VcuvaKl1tmhs7K9ITfoALjCObs8WaSNyRai2BfdH
        nu8YH1GrnYb5/q61CgkcLQ0L9GH6jkf61EEXK0kP
X-Google-Smtp-Source: ABdhPJwhDdM4MFlfS7uVJxwKo58ItpXS0jchBQaNhFwzkwJQ2+x5TiuLQ5UN8rBk15kg9aXEbq2ho8wi0ftQGSuFQAI=
X-Received: by 2002:a17:906:f955:: with SMTP id ld21mr766045ejb.398.1598453272483;
 Wed, 26 Aug 2020 07:47:52 -0700 (PDT)
MIME-Version: 1.0
References: <20200826113148.GA393664@mwanda> <CAEjxPJ45hfBr6S1jT3iSOcSiccfWWFcqJC-q9R5qbRndT_DNCA@mail.gmail.com>
In-Reply-To: <CAEjxPJ45hfBr6S1jT3iSOcSiccfWWFcqJC-q9R5qbRndT_DNCA@mail.gmail.com>
From:   Paul Moore <paul@paul-moore.com>
Date:   Wed, 26 Aug 2020 10:47:41 -0400
Message-ID: <CAHC9VhScNuz0X610=ZjrH2-xT1Gz6y=AMA1=Eg=ubNxpM02VYw@mail.gmail.com>
Subject: Re: [PATCH] selinux: fix error handling bugs in security_load_policy()
To:     Stephen Smalley <stephen.smalley.work@gmail.com>,
        Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Eric Paris <eparis@parisplace.org>,
        Ondrej Mosnacek <omosnace@redhat.com>,
        Jeff Vander Stoep <jeffv@google.com>,
        SElinux list <selinux@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Wed, Aug 26, 2020 at 8:49 AM Stephen Smalley
<stephen.smalley.work@gmail.com> wrote:
> On Wed, Aug 26, 2020 at 7:32 AM Dan Carpenter <dan.carpenter@oracle.com> wrote:
> >
> > There are a few bugs in the error handling for security_load_policy().
> >
> > 1) If the newpolicy->sidtab allocation fails then it leads to a NULL
> >    dereference.  Also the error code was not set to -ENOMEM on that
> >    path.
> > 2) If policydb_read() failed then we call policydb_destroy() twice
> >    which meands we call kvfree(p->sym_val_to_name[i]) twice.
> > 3) If policydb_load_isids() failed then we call sidtab_destroy() twice
> >    and that results in a double free in the sidtab_destroy_tree()
> >    function because entry.ptr_inner and entry.ptr_leaf are not set to
> >    NULL.
> >
> > One thing that makes this code nice to deal with is that none of the
> > functions return partially allocated data.  In other words, the
> > policydb_read() either allocates everything successfully or it frees
> > all the data it allocates.  It never returns a mix of allocated and
> > not allocated data.
> >
> > I re-wrote this to only free the successfully allocated data which
> > avoids the double frees.  I also re-ordered selinux_policy_free() so
> > it's in the reverse order of the allocation function.
> >
> > Fixes: c7c556f1e81b ("selinux: refactor changing booleans")
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>
> I guess this wasn't against current selinux next branch?
>
> patching file security/selinux/ss/services.c
> Hunk #1 succeeded at 2145 (offset 18 lines).
> Hunk #2 succeeded at 2263 (offset 39 lines).
> Hunk #3 succeeded at 2303 with fuzz 1 (offset 47 lines).
> Hunk #4 succeeded at 2323 (offset 42 lines).
>
> But otherwise it looked good to me.
>
> Acked-by: Stephen Smalley <stephen.smalley.work@gmail.com>

My guess is that Dan was using selinux/next, just not the latest.

Anyway, the patch is now merged into selinux/next but I had to do some
manual fixes so please double check that it looks okay to you.  Thanks
everyone.

-- 
paul moore
www.paul-moore.com
