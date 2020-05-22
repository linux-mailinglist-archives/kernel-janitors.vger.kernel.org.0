Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BCA9C1DED81
	for <lists+kernel-janitors@lfdr.de>; Fri, 22 May 2020 18:41:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730613AbgEVQlT (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Fri, 22 May 2020 12:41:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46206 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730364AbgEVQlT (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 22 May 2020 12:41:19 -0400
Received: from mail-qv1-xf42.google.com (mail-qv1-xf42.google.com [IPv6:2607:f8b0:4864:20::f42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E8DC2C061A0E
        for <kernel-janitors@vger.kernel.org>; Fri, 22 May 2020 09:41:18 -0700 (PDT)
Received: by mail-qv1-xf42.google.com with SMTP id p4so4992370qvr.10
        for <kernel-janitors@vger.kernel.org>; Fri, 22 May 2020 09:41:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Gic/1R/3waf7AEbQmqRilav4LMcZDIm9OqkrPl/dkdw=;
        b=DElrh53nseZZ1yD/ZQp65i6zsVsBBVHY12bldCdkwCt4iRHoIjs3Ih3IocvxPI7Be+
         T13Wj28LaLIE/ghO6OxYczOIO5PG7hDaPXclu9BTjpDQgQPDu8Bb+IMDpwkuQ9RFXPWl
         1DVGbvTNqX5BBzHwFqP2XdGX5ZXCUpxAVQuZNsWscvW/gqYFdE2q9J2iVT0uqfoqTuNr
         y/onfJxz+1nGbbNLO/oh5GBoYj6f0XKphOV6GzxhZrOvbi1jKZsi5OD3UPyUZsfSD5/t
         CTz7+RRHcmxa49u5/+SofSW0aSwudQKnUBjgtIXJ1rL1AWgOy6yTQ1hQtYnqwQZ4Qqb+
         ZETw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Gic/1R/3waf7AEbQmqRilav4LMcZDIm9OqkrPl/dkdw=;
        b=GVnrEZhZmHVDBGIeTTKvX9dmoqeNtk0bdJo8W/Hn4LRXhI/KpzJRgrJVvDY2rTYvF+
         SDtDa9yKdVXTYYcta7jNXhmm+pDddTSSlP058gE2HsKay/JQq8UnZHRM4hWK4hdfZ4VX
         ca+64GpO5knKUoYny1d45+smJH6H+BbfM4Dzr0jXnYPwRSXDf8ETVGMSRGHHfpH4uH+U
         fXJ9Cr8VCHG380AX2rm+aw5mEacsRLQOsVSGrqTFV3vqJgLfUVijHBr31ciQJVQSuIpg
         EYC54g3rRAQ61jeFi8A5Snwh14eggkji9rzb18r1MkevVR/aGOPNzsvmfnw1oihOVaXQ
         b+jQ==
X-Gm-Message-State: AOAM533Ej4kN9sdJjjAEN4GW4meO3FkmKOnESsyJoD7/XhS2HSxkxZVK
        rcpKfc7CXZFnKXT9JKcE79vE+g==
X-Google-Smtp-Source: ABdhPJzfZmjxB95p6UPPpZEUJqs6F8nDa2qW9dBg6llK23fiXXCME4T1/ceTY4MQppy88PcB99Terw==
X-Received: by 2002:a05:6214:104a:: with SMTP id l10mr4584181qvr.98.1590165678134;
        Fri, 22 May 2020 09:41:18 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-156-34-48-30.dhcp-dynamic.fibreop.ns.bellaliant.net. [156.34.48.30])
        by smtp.gmail.com with ESMTPSA id d6sm7573800qkj.72.2020.05.22.09.41.17
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 22 May 2020 09:41:17 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
        (envelope-from <jgg@ziepe.ca>)
        id 1jcAjV-0006cz-75; Fri, 22 May 2020 13:41:17 -0300
Date:   Fri, 22 May 2020 13:41:17 -0300
From:   Jason Gunthorpe <jgg@ziepe.ca>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Jinpu Wang <jinpu.wang@cloud.ionos.com>,
        Danil Kipnis <danil.kipnis@cloud.ionos.com>,
        Jens Axboe <axboe@kernel.dk>,
        Bart Van Assche <bvanassche@acm.org>,
        linux-block@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] block/rnbd: Fix an IS_ERR() vs NULL check in
 find_or_create_sess()
Message-ID: <20200522164117.GJ17583@ziepe.ca>
References: <20200519120347.GD42765@mwanda>
 <CAMGffEnuk2WfWmwjKy_Sqcuf_xKwzrPpE_o8j3nHM30ADr8HVw@mail.gmail.com>
 <CAMGffEmC215iOmtT_iZizey=jnbgWneE5f5zapYvdJi5WYDM1w@mail.gmail.com>
 <20200522144831.GH17583@ziepe.ca>
 <20200522154403.GN30374@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200522154403.GN30374@kadam>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Fri, May 22, 2020 at 06:44:03PM +0300, Dan Carpenter wrote:
> On Fri, May 22, 2020 at 11:48:31AM -0300, Jason Gunthorpe wrote:
> > On Fri, May 22, 2020 at 07:13:08AM +0200, Jinpu Wang wrote:
> > > On Tue, May 19, 2020 at 2:52 PM Jinpu Wang <jinpu.wang@cloud.ionos.com> wrote:
> > > >
> > > > On Tue, May 19, 2020 at 2:04 PM Dan Carpenter <dan.carpenter@oracle.com> wrote:
> > > > >
> > > > > The alloc_sess() function returns error pointers, it never returns NULL.
> > > > >
> > > > > Fixes: f7a7a5c228d4 ("block/rnbd: client: main functionality")
> > > > > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> > > > Thanks Dan,
> > > > Reviewed-by: Jack Wang <jinpu.wang@cloud.ionos.com>
> > > 
> > > Hi Jason,
> > > 
> > > Could you also queue this fix for for-next?
> > 
> > Uhh.. Yes OK, but if it doesn't get cc'd to linux-rdma I won't see it..
> > 
> 
> I suspect that we should update MAINTAINERS so that
> ./scripts/get_maintainer.pl gives the right lists.  Proabably all
> drivers/block/rnbd/ patches are supposed to go through you?

I think Jens will take then once everything is merged, it is just for
the next few weeks

Jason
