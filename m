Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B1E4B1C1DA4
	for <lists+kernel-janitors@lfdr.de>; Fri,  1 May 2020 21:08:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730483AbgEATIc (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Fri, 1 May 2020 15:08:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47642 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1729766AbgEATIc (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 1 May 2020 15:08:32 -0400
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com [IPv6:2a00:1450:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD51FC061A0C
        for <kernel-janitors@vger.kernel.org>; Fri,  1 May 2020 12:08:31 -0700 (PDT)
Received: by mail-ed1-x541.google.com with SMTP id t12so8006005edw.3
        for <kernel-janitors@vger.kernel.org>; Fri, 01 May 2020 12:08:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jCkpkOtlwOsj6yyByDhOCENLq0uryXJZ7j98jV5XREE=;
        b=jZWHktIohCDrUqPhu/jEoxkztd3YJBuBCoZdjhaqYxp6ywGOHpItKmE1ZwKFb6QDCy
         V9TxOVv5hMV6eroo1tn29Nrdboy+WCIdhWlsVe1wfJBBrHeaJmE3DDhVKRDQA8D+vMUP
         iUiJQgOzvhvfXrEtFIdEU172W+57HypM/193TSbzIHpfZ10OD4y0dgwsUnA6QfprBA+z
         lt94UWriv9DYBZ17gKh9c1ovp8BC2M5Fx+OtX/JX1BBShbM7RA7KA1h2n80qK69zqV9/
         pU3tq4m3zHEIz9NFmyz0mkEJo5rB9bsWpbBMNhMOzeTrgjrD4yA8NNNPWnuKC80zBOEh
         ytlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jCkpkOtlwOsj6yyByDhOCENLq0uryXJZ7j98jV5XREE=;
        b=e//gTHNCAysOM3/9tgBwJOfLBtWCb3X1P/UmO5E4D3+8Ur+gddISzveY0i6QoM987x
         Kg8qwuC/taZIw2Tm9LkxOsnFiq0A1CF64kajXy029imr5qeE0RRoGLFM8T+N+BSqG1eH
         2+OEpdAmf8lk36YKCkg32YQMVJkIJJFbI5f2OJmmCY47YztUNAhDTLMUVNe6R/SmsDN7
         AvxdC/NAvRex5XVwfVHaSkbIWx7xIsa2pECkGMDUJ9+LIM6DVnBsWreasxUTuCFupOdW
         OzM1xwY+XlexzFTVvVRu5IcDTEf9/Q0sCaLmRSKa/5vP7kUS+T0yC2bhMcI5llP+Wai8
         yV4w==
X-Gm-Message-State: AGi0PuYebpTw/Rfp+Vodj1ll7Rgz+EgKALiPwapKYSbeCkc7+Ub9X6T4
        5i8fBVsaVku6pEciAp+/XSrqKyDoj/N21dcq2Efvfig=
X-Google-Smtp-Source: APiQypIORs+Cop9IBQicsbUSYN+TGqrD67m97odNJVFMYGwyyQGN1TOIF9907nZhf6eAobrIQN3gAawIrU+7oKHPMKQ=
X-Received: by 2002:aa7:cb0f:: with SMTP id s15mr4723691edt.164.1588360110335;
 Fri, 01 May 2020 12:08:30 -0700 (PDT)
MIME-Version: 1.0
References: <20200429073053.83660-1-weiyongjun1@huawei.com>
 <20200429130738.GQ2014@kadam> <CAFqZXNs=YTn-mnzSEssR1szRhSw7Ajdaqg=wy88O_F3gBL2rOQ@mail.gmail.com>
In-Reply-To: <CAFqZXNs=YTn-mnzSEssR1szRhSw7Ajdaqg=wy88O_F3gBL2rOQ@mail.gmail.com>
From:   Paul Moore <paul@paul-moore.com>
Date:   Fri, 1 May 2020 15:08:18 -0400
Message-ID: <CAHC9VhTxDkrLP4nvwsUTZDNiLPQJn0=gqTr609MCTrXQU40arw@mail.gmail.com>
Subject: Re: [PATCH -next] selinux: fix error return code in policydb_read()
To:     Ondrej Mosnacek <omosnace@redhat.com>
Cc:     Dan Carpenter <dan.carpenter@oracle.com>,
        Wei Yongjun <weiyongjun1@huawei.com>,
        Stephen Smalley <stephen.smalley.work@gmail.com>,
        Eric Paris <eparis@parisplace.org>,
        Jeff Vander Stoep <jeffv@google.com>,
        SElinux list <selinux@vger.kernel.org>,
        kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Wed, Apr 29, 2020 at 9:32 AM Ondrej Mosnacek <omosnace@redhat.com> wrote:
> On Wed, Apr 29, 2020 at 3:15 PM Dan Carpenter <dan.carpenter@oracle.com> wrote:
> > On Wed, Apr 29, 2020 at 07:30:53AM +0000, Wei Yongjun wrote:
> > > Fix to return negative error code -ENOMEM from the kvcalloc() error
> > > handling case instead of 0, as done elsewhere in this function.
> > >
> >
> > Please add a Fixes tag and Cc Kent.
> >
> > Fixes: acdf52d97f82 ("selinux: convert to kvmalloc")
> >
> >
> > > Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> > > ---
> > >  security/selinux/ss/policydb.c | 1 +
> > >  1 file changed, 1 insertion(+)
> > >
> > > diff --git a/security/selinux/ss/policydb.c b/security/selinux/ss/policydb.c
> > > index a0b3dc152468..a51e051df2cc 100644
> > > --- a/security/selinux/ss/policydb.c
> > > +++ b/security/selinux/ss/policydb.c
> > > @@ -2638,6 +2638,7 @@ int policydb_read(struct policydb *p, void *fp)
> > >       if (rc)
> > >               goto bad;
> > >
> > > +     rc = -ENOMEM;
> > >       p->type_attr_map_array = kvcalloc(p->p_types.nprim,
> > >                                         sizeof(*p->type_attr_map_array),
> > >                                         GFP_KERNEL);
> >
> > There is another bug earlier in the function as well:
> >
> > security/selinux/ss/policydb.c
> >   2537
> >   2538          rc = next_entry(buf, fp, sizeof(u32));
> >   2539          if (rc)
> >   2540                  goto bad;
> >   2541          nel = le32_to_cpu(buf[0]);
> >   2542
> >   2543          p->role_tr = hashtab_create(role_trans_hash, role_trans_cmp, nel);
> >   2544          if (!p->role_tr)
> >   2545                  goto bad;
> >                         ^^^^^^^^
> >
> >   2546          for (i = 0; i < nel; i++) {
> >   2547                  rc = -ENOMEM;
> >
> > This style of setting the error code seems very bug prone.
> >
> > The Fixes tag for this one is:
> > Fixes: e67b2ec9f617 ("selinux: store role transitions in a hash table")
>
> FYI, this one is also indirectly fixed by this patch, which is
> currently pending review:
> https://patchwork.kernel.org/patch/11514495/

If we know the code is broken, let's fix it independently of a feature
patch.  Ondrej, I believe the original patch is yours so please send
me a new patch with just the fix, thank you.

-- 
paul moore
www.paul-moore.com
