Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4216E1CFECD
	for <lists+kernel-janitors@lfdr.de>; Tue, 12 May 2020 22:00:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730950AbgELUAD (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Tue, 12 May 2020 16:00:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33138 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728275AbgELUAD (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 12 May 2020 16:00:03 -0400
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com [IPv6:2607:f8b0:4864:20::742])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E3BECC061A0C
        for <kernel-janitors@vger.kernel.org>; Tue, 12 May 2020 13:00:02 -0700 (PDT)
Received: by mail-qk1-x742.google.com with SMTP id f189so9328896qkd.5
        for <kernel-janitors@vger.kernel.org>; Tue, 12 May 2020 13:00:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=hph7m+QWM+PUvHgFd6P1tSDWqCEm+ZM+VGd8EVir3aw=;
        b=WP/bUxOuH3O5G7JSrqrmQrrF0fMfSTYjDrTlDz2RvaMD6vs1v1g+fZk7mi/S01vDXN
         pfINNoqHpAfxVVQfu2kToT1A4Y2XVLZPFiULT+s0FUYfcOr+pvuzXYoBMRcRmNeNUQi/
         7XMOn/3orRnviOHNR/5gAeVdhfKA91T3vN8pBZ8hx+ZTf1YuYvpyaKvUJd1oL0o/Q+WZ
         7Kc27m/AcgUZHMvq65WVxdHOn1wP/ut/dkIphA2NjUqt4dJfF6S8R8d0JvSlsNAUyhWv
         oXf2+K3AmMc0uj6b52ag0hJ1U53T72eIpSkQ+aVTIZ0yH2m78oM9BXdtKIj+RbLB3o3L
         2b+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=hph7m+QWM+PUvHgFd6P1tSDWqCEm+ZM+VGd8EVir3aw=;
        b=pZOzyg4dfPjOghay0td6HcUR6UcoCOi4a0IAXi1lgGQg9K+1migfFSr/X5yvQYnF4+
         xuxlPNqo7GW+5D2O6w3pWJrWO6x+lorWxSnxuGBJa3pqn1sRcbm37VI+OoUXimqhiGfq
         bxNO/l125nK135Ge4gRjJhE6lBp0td0DnzKTVugWCzF3pRSwtgZhFbPNpzRIQEPrmsOs
         OqHU7FvWtKKgKPUjSYDu+gKeWSWAePEo8plT2l53Jw5T4Zg5iIgthh+Stsy66zfGbfx/
         6N+QqJ9ru6X01t++TKu13Na1z7N39IcCtcGVtjx2QoHq8E51JGMVMs5ANGpe3gtQzdfX
         6HAw==
X-Gm-Message-State: AGi0Pubs7Jl0EEziIQhj2O5Pemc/2TSg0kdkM7cIWUtV8Rr2GDtvFwYI
        a/gwT82F/MfMQ+CgnHBKAPrpog==
X-Google-Smtp-Source: APiQypJHPzfJAlIPmc2g23wMQ1YKV//K5WdTr4V6Hc5ZeYs71sdMaWrQNWo5kCI8va4xh9o/rSCNXA==
X-Received: by 2002:a37:b847:: with SMTP id i68mr15348735qkf.431.1589313602178;
        Tue, 12 May 2020 13:00:02 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-68-57-212.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.68.57.212])
        by smtp.gmail.com with ESMTPSA id z18sm12799888qti.47.2020.05.12.13.00.01
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 12 May 2020 13:00:01 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
        (envelope-from <jgg@ziepe.ca>)
        id 1jYb4L-0002PS-BY; Tue, 12 May 2020 17:00:01 -0300
Date:   Tue, 12 May 2020 17:00:01 -0300
From:   Jason Gunthorpe <jgg@ziepe.ca>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     =?utf-8?B?SsOpcsO0bWU=?= Glisse <jglisse@redhat.com>,
        Ralph Campbell <rcampbell@nvidia.com>, linux-mm@kvack.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] mm/hmm/test: Fix some copy_to_user() error handling
Message-ID: <20200512200001.GC9154@ziepe.ca>
References: <20200511183704.GA225608@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200511183704.GA225608@mwanda>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Mon, May 11, 2020 at 09:37:04PM +0300, Dan Carpenter wrote:
> The copy_to_user() function returns the number of bytes which weren't
> copied but we want to return negative error codes.  Also in dmirror_write()
> if the copy_from_user() fails then there is some cleanup needed before
> we can return so I fixed that as well.
> 
> Fixes: 5d5e54be8a1e3 ("mm/hmm/test: add selftest driver for HMM")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  lib/test_hmm.c | 41 +++++++++++++++++++++++++----------------
>  1 file changed, 25 insertions(+), 16 deletions(-)

Thank you, I squashed this into the original commit.

Jason
