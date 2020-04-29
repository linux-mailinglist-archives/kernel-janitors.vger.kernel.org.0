Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 91F751BDDAE
	for <lists+kernel-janitors@lfdr.de>; Wed, 29 Apr 2020 15:32:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727090AbgD2Nce (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Wed, 29 Apr 2020 09:32:34 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:34070 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726913AbgD2Ncd (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 29 Apr 2020 09:32:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1588167152;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=Bf3kxis0btJgtVhJQlPwmJnY9M8HIdjbWMpOD7tiVrY=;
        b=JFMmioxPFbeyP0ohK95WUUEsbfixvJo4hQ+wUsgiyeRluljFmpLA7WXF56FVaqDu4zlrGn
        rMHKOs+Kn954b8GLTvzTYyAOOJDW66G279QwSwL1uMqXzTmYckXxCuZUx+2OWe/IYxPijF
        CqV6xQ01tO8Bh0W+xpJDcuLdydf6bIE=
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com
 [209.85.161.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-142-d1lLiabSNnq139-mTnq8vg-1; Wed, 29 Apr 2020 09:32:26 -0400
X-MC-Unique: d1lLiabSNnq139-mTnq8vg-1
Received: by mail-oo1-f69.google.com with SMTP id j4so2424126oot.10
        for <kernel-janitors@vger.kernel.org>; Wed, 29 Apr 2020 06:32:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Bf3kxis0btJgtVhJQlPwmJnY9M8HIdjbWMpOD7tiVrY=;
        b=NPPjRfu9cYcrEHDc5nE/ZDsKPi9mDhkTBWe1yuRO78WU7jQAj4H3aaC2EzHyHyUqPE
         LoN+V01GWEH42qEAB2Wy478MNfhu4YdWxQ/gApt0PjrTtwCMre76pCcoGwbIH41JTEOY
         NraPOcS9Wgu137+nxNZ6toJe2SVJCOVruVxuMLVdjmy7UVOlGhIbvSkdUXmwCiISIK7p
         n08ijpqL2JQYAv3twIUpDr4QNGEodYMdaG5LTg4/WBW05WMvINl4smwQ6wuy7AiQaoCT
         wmiEJYVFhh8dbbv0Hzs9jGJpKRzyEc8j9hqLCzm0bXf747zi4sA6oNRi86qNoI4ULMz/
         Ch7w==
X-Gm-Message-State: AGi0PuZUQIHjIJHhgKWGyApAgaXfDq5vmCbPzjR8zURtVMQ3As4/mpof
        wn1mKJ7bL9EbE0R0ggGE9fHv5FWGyvMsGZxg7OolRAXNHVg5wegtfJ4IHrcaZj2DvoqbN1slF/8
        Rb5XRaTeBWCp9QAd59URjdDoULcNcGUpHRj/TZ5v/TdED
X-Received: by 2002:a4a:7011:: with SMTP id r17mr27113650ooc.17.1588167145495;
        Wed, 29 Apr 2020 06:32:25 -0700 (PDT)
X-Google-Smtp-Source: APiQypJOKx2XaJ21j+Of+N8/HPxm0iumAt04qu3nEx6pVAxonv7aNRyTotycK9QIHj8gO7y/qxKfQ233mGEPk7rsAkk=
X-Received: by 2002:a4a:7011:: with SMTP id r17mr27113618ooc.17.1588167145179;
 Wed, 29 Apr 2020 06:32:25 -0700 (PDT)
MIME-Version: 1.0
References: <20200429073053.83660-1-weiyongjun1@huawei.com> <20200429130738.GQ2014@kadam>
In-Reply-To: <20200429130738.GQ2014@kadam>
From:   Ondrej Mosnacek <omosnace@redhat.com>
Date:   Wed, 29 Apr 2020 15:32:13 +0200
Message-ID: <CAFqZXNs=YTn-mnzSEssR1szRhSw7Ajdaqg=wy88O_F3gBL2rOQ@mail.gmail.com>
Subject: Re: [PATCH -next] selinux: fix error return code in policydb_read()
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Wei Yongjun <weiyongjun1@huawei.com>,
        Paul Moore <paul@paul-moore.com>,
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

On Wed, Apr 29, 2020 at 3:15 PM Dan Carpenter <dan.carpenter@oracle.com> wrote:
> On Wed, Apr 29, 2020 at 07:30:53AM +0000, Wei Yongjun wrote:
> > Fix to return negative error code -ENOMEM from the kvcalloc() error
> > handling case instead of 0, as done elsewhere in this function.
> >
>
> Please add a Fixes tag and Cc Kent.
>
> Fixes: acdf52d97f82 ("selinux: convert to kvmalloc")
>
>
> > Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> > ---
> >  security/selinux/ss/policydb.c | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/security/selinux/ss/policydb.c b/security/selinux/ss/policydb.c
> > index a0b3dc152468..a51e051df2cc 100644
> > --- a/security/selinux/ss/policydb.c
> > +++ b/security/selinux/ss/policydb.c
> > @@ -2638,6 +2638,7 @@ int policydb_read(struct policydb *p, void *fp)
> >       if (rc)
> >               goto bad;
> >
> > +     rc = -ENOMEM;
> >       p->type_attr_map_array = kvcalloc(p->p_types.nprim,
> >                                         sizeof(*p->type_attr_map_array),
> >                                         GFP_KERNEL);
>
> There is another bug earlier in the function as well:
>
> security/selinux/ss/policydb.c
>   2537
>   2538          rc = next_entry(buf, fp, sizeof(u32));
>   2539          if (rc)
>   2540                  goto bad;
>   2541          nel = le32_to_cpu(buf[0]);
>   2542
>   2543          p->role_tr = hashtab_create(role_trans_hash, role_trans_cmp, nel);
>   2544          if (!p->role_tr)
>   2545                  goto bad;
>                         ^^^^^^^^
>
>   2546          for (i = 0; i < nel; i++) {
>   2547                  rc = -ENOMEM;
>
> This style of setting the error code seems very bug prone.
>
> The Fixes tag for this one is:
> Fixes: e67b2ec9f617 ("selinux: store role transitions in a hash table")

FYI, this one is also indirectly fixed by this patch, which is
currently pending review:
https://patchwork.kernel.org/patch/11514495/

>
> Just put both tags in the commit message.

-- 
Ondrej Mosnacek <omosnace at redhat dot com>
Software Engineer, Security Technologies
Red Hat, Inc.

