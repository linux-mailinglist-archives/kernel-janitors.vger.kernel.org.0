Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D55E11C1E12
	for <lists+kernel-janitors@lfdr.de>; Fri,  1 May 2020 21:52:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726698AbgEATwi (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Fri, 1 May 2020 15:52:38 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:49062 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726377AbgEATwi (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 1 May 2020 15:52:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1588362756;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=5csxLzWMNUcydmBkcgvRvOKjFPEoRujRS5w0gzdFVv4=;
        b=HjSprGBHVuKXcdVBe4+W5PN1G9xYZoj4VIBEPwYp3wJuei5louhEwxhWEBSR1jtGBldcAk
        PU9duuW5kX5byp2k97XIJUUn26CySeHy8ukavWoXGOsn/JRUKvqmR6MQPaZjSuJWqWUcK8
        RTHj/G5sXuJkX0KhhuvyHl72nHvWExM=
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com
 [209.85.167.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-313-ZJEm3dvsPXycPKaksba-2g-1; Fri, 01 May 2020 15:52:27 -0400
X-MC-Unique: ZJEm3dvsPXycPKaksba-2g-1
Received: by mail-oi1-f199.google.com with SMTP id u64so505786oie.22
        for <kernel-janitors@vger.kernel.org>; Fri, 01 May 2020 12:52:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5csxLzWMNUcydmBkcgvRvOKjFPEoRujRS5w0gzdFVv4=;
        b=aNqNrEeTziJbCMHum8IXtcx0gDN4TwrZFA0dgBOiOpU1G1NH+gyFsOhVV06XPXlqEf
         aUCmBBFszQiDjBHaaCaXnKiGSyfHvVTYdgsZAAzauveQFHTRtQSvVItTy1QT1KWLZEdN
         +7HdLXgEZgDZy5K2GTt2xbgW0XHxA2rPpiTUVpZrcIoa/Pl4L12+jBXd+rtZrkaLAMd7
         W0WW2NUTQLjMkBtkdVBdhusZiNFagu8E63UbKxLaG0ip4m5fjw9VjoeiZTsfz49d9VdU
         vF8Aenw6e3dtJWnaLtSKS4LBBrC3NLaald3b9MLfrvS8AzuQPCsT2wXh3eUtTs3bG0YD
         4rQA==
X-Gm-Message-State: AGi0PuYe6OhMjVYpg+O+VQA+BxkYrKWOBNvgHm5N1u/MqUWc6R7Jh9ie
        eWUzT4wODawMlUT7hDF5s6TP2lF+I7ykgPxys88obT8mhwi8fshhir3XjEMqbIQIowkTNm7NSEW
        Hceq5pGB01/gbdnEeegL4JBhbtfvAHLfmMmnBP9VoFxqX
X-Received: by 2002:aca:b6c2:: with SMTP id g185mr972487oif.166.1588362746675;
        Fri, 01 May 2020 12:52:26 -0700 (PDT)
X-Google-Smtp-Source: APiQypK6/aBvUt5PEeHemBtXJFQ0+CwnrU00PHWw1MXfKSj+ePVs/ARQT37gMoZUVxJrKw17sbAdRRbhIT8wfrlPVHA=
X-Received: by 2002:aca:b6c2:: with SMTP id g185mr972470oif.166.1588362746403;
 Fri, 01 May 2020 12:52:26 -0700 (PDT)
MIME-Version: 1.0
References: <20200429073053.83660-1-weiyongjun1@huawei.com>
 <20200429130738.GQ2014@kadam> <CAFqZXNs=YTn-mnzSEssR1szRhSw7Ajdaqg=wy88O_F3gBL2rOQ@mail.gmail.com>
 <CAHC9VhTxDkrLP4nvwsUTZDNiLPQJn0=gqTr609MCTrXQU40arw@mail.gmail.com>
In-Reply-To: <CAHC9VhTxDkrLP4nvwsUTZDNiLPQJn0=gqTr609MCTrXQU40arw@mail.gmail.com>
From:   Ondrej Mosnacek <omosnace@redhat.com>
Date:   Fri, 1 May 2020 21:52:15 +0200
Message-ID: <CAFqZXNthwrGDOWei-8ET8A-3sE+Ecg3DquHy-EB2YCmDtHAaWg@mail.gmail.com>
Subject: Re: [PATCH -next] selinux: fix error return code in policydb_read()
To:     Paul Moore <paul@paul-moore.com>
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

On Fri, May 1, 2020 at 9:08 PM Paul Moore <paul@paul-moore.com> wrote:
> On Wed, Apr 29, 2020 at 9:32 AM Ondrej Mosnacek <omosnace@redhat.com> wrote:
> > On Wed, Apr 29, 2020 at 3:15 PM Dan Carpenter <dan.carpenter@oracle.com> wrote:
> > > On Wed, Apr 29, 2020 at 07:30:53AM +0000, Wei Yongjun wrote:
> > > > Fix to return negative error code -ENOMEM from the kvcalloc() error
> > > > handling case instead of 0, as done elsewhere in this function.
> > > >
> > >
> > > Please add a Fixes tag and Cc Kent.
> > >
> > > Fixes: acdf52d97f82 ("selinux: convert to kvmalloc")
> > >
> > >
> > > > Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> > > > ---
> > > >  security/selinux/ss/policydb.c | 1 +
> > > >  1 file changed, 1 insertion(+)
> > > >
> > > > diff --git a/security/selinux/ss/policydb.c b/security/selinux/ss/policydb.c
> > > > index a0b3dc152468..a51e051df2cc 100644
> > > > --- a/security/selinux/ss/policydb.c
> > > > +++ b/security/selinux/ss/policydb.c
> > > > @@ -2638,6 +2638,7 @@ int policydb_read(struct policydb *p, void *fp)
> > > >       if (rc)
> > > >               goto bad;
> > > >
> > > > +     rc = -ENOMEM;
> > > >       p->type_attr_map_array = kvcalloc(p->p_types.nprim,
> > > >                                         sizeof(*p->type_attr_map_array),
> > > >                                         GFP_KERNEL);
> > >
> > > There is another bug earlier in the function as well:
> > >
> > > security/selinux/ss/policydb.c
> > >   2537
> > >   2538          rc = next_entry(buf, fp, sizeof(u32));
> > >   2539          if (rc)
> > >   2540                  goto bad;
> > >   2541          nel = le32_to_cpu(buf[0]);
> > >   2542
> > >   2543          p->role_tr = hashtab_create(role_trans_hash, role_trans_cmp, nel);
> > >   2544          if (!p->role_tr)
> > >   2545                  goto bad;
> > >                         ^^^^^^^^
> > >
> > >   2546          for (i = 0; i < nel; i++) {
> > >   2547                  rc = -ENOMEM;
> > >
> > > This style of setting the error code seems very bug prone.
> > >
> > > The Fixes tag for this one is:
> > > Fixes: e67b2ec9f617 ("selinux: store role transitions in a hash table")
> >
> > FYI, this one is also indirectly fixed by this patch, which is
> > currently pending review:
> > https://patchwork.kernel.org/patch/11514495/
>
> If we know the code is broken, let's fix it independently of a feature
> patch.  Ondrej, I believe the original patch is yours so please send
> me a new patch with just the fix, thank you.

Sure, here you go:
https://lore.kernel.org/selinux/20200501195111.3335258-1-omosnace@redhat.com/T/

-- 
Ondrej Mosnacek <omosnace at redhat dot com>
Software Engineer, Security Technologies
Red Hat, Inc.

