Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 54868ECFE0
	for <lists+kernel-janitors@lfdr.de>; Sat,  2 Nov 2019 18:12:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727054AbfKBRMD convert rfc822-to-8bit (ORCPT
        <rfc822;lists+kernel-janitors@lfdr.de>);
        Sat, 2 Nov 2019 13:12:03 -0400
Received: from mx1.redhat.com ([209.132.183.28]:38634 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726944AbfKBRMD (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Sat, 2 Nov 2019 13:12:03 -0400
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com [209.85.210.72])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id 314BA85536
        for <kernel-janitors@vger.kernel.org>; Sat,  2 Nov 2019 17:12:03 +0000 (UTC)
Received: by mail-ot1-f72.google.com with SMTP id s1so7958260oth.15
        for <kernel-janitors@vger.kernel.org>; Sat, 02 Nov 2019 10:12:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=zl9fDks+mlVguzbhaExkNR5P4dBXCVz91rnRw1qkYoM=;
        b=cQEQxSQBaAZnEOu06M7WqcFhUJqe4s9XeANuRLHBC/nOlEmKhiHudCVVhZtwQwSKc3
         SL25q9/d8L/mpNNUEU9lpqLHvT6Ujpcu/mSEwqLKRnjjLAV0zL6/er4K1o0ecmAh8ke7
         DjHxFaXFTWMjwLGgYfVr4YZfrvgtqEgugMRHiz6JJVFdxJUtXOSXFdDu/ivBXmZsziIo
         yxdLgjuQAQvJj9Sb1M2M2bAo8YWtJVen0+yns64gjJeb7WLt+0vbmskVvrsLwZIty0QS
         aFdaQZkpWxCIK+mXvbvLvu+bb7A7a398Ax8m+MjKKl5ltQyLtL5CcooP2shawBMfQCgY
         mLNA==
X-Gm-Message-State: APjAAAV1egBCSsr+CqYZJBzkVZpd3Cw0uMB7LRqA0GunTUKdGPrlckS/
        16g7YSrq0H3Db8XefQpAuFUHsHjwG6bTgUO3ieTppCKg4RwpPcommvyr5vUc/32+uifo2043aES
        swZSFpKJ21LdvCF3WQFvCXnozqqnGSgytm5gKgSuJNxgR
X-Received: by 2002:aca:b03:: with SMTP id 3mr8429419oil.24.1572714722653;
        Sat, 02 Nov 2019 10:12:02 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzBeIHHDezjGUM47ip6RrosGeU264dgnNDsmFABP4CYUabIN4mVl/m2b8xL3KrISyeUZ+KMCTs+c2qfLxq5oBI=
X-Received: by 2002:aca:b03:: with SMTP id 3mr8429400oil.24.1572714722376;
 Sat, 02 Nov 2019 10:12:02 -0700 (PDT)
MIME-Version: 1.0
References: <20191031064741.4567-1-christophe.jaillet@wanadoo.fr>
 <c7a0b6b0-96cd-1fd3-3d98-94a3692bda38@cogentembedded.com> <1b33ca33-a02b-1923-cbee-814e520b9700@wanadoo.fr>
In-Reply-To: <1b33ca33-a02b-1923-cbee-814e520b9700@wanadoo.fr>
From:   Stefano Garzarella <sgarzare@redhat.com>
Date:   Sat, 2 Nov 2019 18:11:50 +0100
Message-ID: <CAGxU2F5wS9VnNu5ETFbbFcyaCx+UPD9jqjBPVp_rKKZ0-am1tQ@mail.gmail.com>
Subject: Re: [PATCH] vsock: Simplify '__vsock_release()'
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc:     Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        "David S. Miller" <davem@davemloft.net>, sunilmut@microsoft.com,
        Willem de Bruijn <willemb@google.com>,
        Stefan Hajnoczi <stefanha@redhat.com>, ytht.net@gmail.com,
        Arnd Bergmann <arnd@arndb.de>, tglx@linutronix.de,
        Dexuan Cui <decui@microsoft.com>, netdev@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Thu, Oct 31, 2019 at 10:49 AM Christophe JAILLET
<christophe.jaillet@wanadoo.fr> wrote:
>
> Le 31/10/2019 à 10:36, Sergei Shtylyov a écrit :
> > Hello!
> >
> > On 31.10.2019 9:47, Christophe JAILLET wrote:
> >
> >> Use '__skb_queue_purge()' instead of re-implementing it.
> >
> >    In don't see that double underscore below...
> This is a typo in the commit message.
>
> There is no need for __ because skb_dequeue was used.
>
> Could you fix it directly in the commit message (preferred solution for
> me) or should I send a V2?
>

I think is better if you send a v2 fixing this and including the R-b tags.
My R-b stays with that fixed :-)

Thanks,
Stefano
