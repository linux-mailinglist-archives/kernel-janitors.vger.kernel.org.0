Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F2CE51BA4C9
	for <lists+kernel-janitors@lfdr.de>; Mon, 27 Apr 2020 15:32:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727040AbgD0Nch (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Mon, 27 Apr 2020 09:32:37 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:23138 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726769AbgD0Ncg (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 27 Apr 2020 09:32:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1587994356;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=2LT51u9otw+gs5DgyXsOGVkP616YYrBH99RtvAZlWeU=;
        b=HaTccGl0Mz8KLfRB2NyPU8RZtlaFqATVTcto8TSpxB/vdVV/BYXaa7kmwrMvXZAF15HhAa
        FScracOPX6f8OuwxS/5C8YteK+6MOsoaefQAUtlLES/4y4fnz3qJ1Xww2GmgWEg5Y1ouR4
        PpQEZ5c81f6EOrptZk/VqY875WeuAAE=
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com
 [209.85.161.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-378-fqMNllLHMq-tDw9GrsVycg-1; Mon, 27 Apr 2020 09:32:34 -0400
X-MC-Unique: fqMNllLHMq-tDw9GrsVycg-1
Received: by mail-oo1-f70.google.com with SMTP id h26so16084554oos.13
        for <kernel-janitors@vger.kernel.org>; Mon, 27 Apr 2020 06:32:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2LT51u9otw+gs5DgyXsOGVkP616YYrBH99RtvAZlWeU=;
        b=VOqPMB45+6DK9s7fNKln9xWgegI9mxq9MVrUom/bLWiXTKH1QhKVZEeuofucOseOY4
         4WwzzuJi+AAZ++rLnnnCzNBB0Vp6g2PPqlrhBkQ4sCww0qiEYcmSZktGdCQqnXJueHhj
         M2OvmIJLegFocZVE/S6RCDJwsoBtcOtKNH7gTuLQJdZnZ9DPXpFRmtUfAXdKmYO7zq1Z
         Z0x2jSstgP8wqPtJbTpQxyd6wHU7/gx56FEYSD46tKG6D7I4Ddo9a+6UrKNjxav4IfhQ
         biqOJF4rBfO2kg+XcVkF4YI2dIr5vRb4RCqDXLeUm5EbWwwB92yDNHm00UFrflwWpIdL
         FKBw==
X-Gm-Message-State: AGi0PuYxJtQux1ob/ZQ7PEaNy8KhHkCYPq/GrnE5Xqmz9GCNN8pwsdFD
        TKc5Pi2uUNAYUgXC8wDAjoXx5P6oHXVG0i8Z0E6b4fnIaTbseTYVbTd7u2xTNbg9E3fw7FdwvLJ
        BvxE0h363iff+j4vUhm1SF54TdVBUkk3QNYR6QqAAV6+l
X-Received: by 2002:aca:488a:: with SMTP id v132mr16161720oia.166.1587994353352;
        Mon, 27 Apr 2020 06:32:33 -0700 (PDT)
X-Google-Smtp-Source: APiQypK/7DWfUR4RvdmdpQLIe9SKGRJdi3fjHddkMBu5dJ706WHTX/xNlJyrtNePEnp8012Ky/1J1Gb10kQ1VCgiMEY=
X-Received: by 2002:aca:488a:: with SMTP id v132mr16161704oia.166.1587994353145;
 Mon, 27 Apr 2020 06:32:33 -0700 (PDT)
MIME-Version: 1.0
References: <20200427124935.130432-1-weiyongjun1@huawei.com>
In-Reply-To: <20200427124935.130432-1-weiyongjun1@huawei.com>
From:   Ondrej Mosnacek <omosnace@redhat.com>
Date:   Mon, 27 Apr 2020 15:32:22 +0200
Message-ID: <CAFqZXNvWYK4pdcYTH3Zp-4c3K6oeP2D+K2AMRH3jFcN8XgOFoQ@mail.gmail.com>
Subject: Re: [PATCH -next] selinux: fix error return code in cond_read_list()
To:     Wei Yongjun <weiyongjun1@huawei.com>
Cc:     Paul Moore <paul@paul-moore.com>,
        Stephen Smalley <stephen.smalley.work@gmail.com>,
        Eric Paris <eparis@parisplace.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        SElinux list <selinux@vger.kernel.org>,
        kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Mon, Apr 27, 2020 at 2:48 PM Wei Yongjun <weiyongjun1@huawei.com> wrote:
> Fix to return negative error code -ENOMEM from the error handling
> case instead of 0, as done elsewhere in this function.
>
> Fixes: 60abd3181db2 ("selinux: convert cond_list to array")
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> ---
>  security/selinux/ss/conditional.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/security/selinux/ss/conditional.c b/security/selinux/ss/conditional.c
> index 939a74fd8fb4..da94a1b4bfda 100644
> --- a/security/selinux/ss/conditional.c
> +++ b/security/selinux/ss/conditional.c
> @@ -429,7 +429,7 @@ int cond_read_list(struct policydb *p, void *fp)
>
>         p->cond_list = kcalloc(len, sizeof(*p->cond_list), GFP_KERNEL);
>         if (!p->cond_list)
> -               return rc;
> +               return -ENOMEM;
>
>         rc = avtab_alloc(&(p->te_cond_avtab), p->te_avtab.nel);
>         if (rc)
>
>
>

Reviewed-by: Ondrej Mosnacek <omosnace@redhat.com>

Thanks!

-- 
Ondrej Mosnacek <omosnace at redhat dot com>
Software Engineer, Security Technologies
Red Hat, Inc.

