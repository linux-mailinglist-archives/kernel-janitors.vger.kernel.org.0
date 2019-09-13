Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0C02AB21B8
	for <lists+kernel-janitors@lfdr.de>; Fri, 13 Sep 2019 16:19:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387977AbfIMOTm (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Fri, 13 Sep 2019 10:19:42 -0400
Received: from mail-pl1-f194.google.com ([209.85.214.194]:43864 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387693AbfIMOTm (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 13 Sep 2019 10:19:42 -0400
Received: by mail-pl1-f194.google.com with SMTP id 4so13300576pld.10
        for <kernel-janitors@vger.kernel.org>; Fri, 13 Sep 2019 07:19:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=gnSzZp3FjaQTG+oAyna9aH/N38uYMw8V989iNhUz2ow=;
        b=SgOcdWGvvobPVg19eLYSqeHsUm+duk2IV06bJHY1iI8tplUwKQGATFpXq/AJMmMFg7
         fI5blZthSSXvciETwCsHQNZLrfe06m7lbcdSjK6BWyHPTRo9UDqxMxhPdYzRzVP9PtBe
         CxAAkrcdP4bn9cgnF6iNmPHyJ6fdVm/a/8wsGPiohKjQ5URUR83IvlqcFzXE3/YMneAZ
         u6Kn4GxnRs4eEpxlws66F1D3Lns8wfk33/6WmdYHMazw6xj8RuRa9Qu1KQFQrZl0IudN
         M6sQqJ9qUh1nFg+SwMWB0qy9AGjXufF3Pegunj5dKJmM3ynzznrfsvnrs4Ig5tBE++8r
         FrdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=gnSzZp3FjaQTG+oAyna9aH/N38uYMw8V989iNhUz2ow=;
        b=RW3aYUq1GwcMHNGoDGoinRhHatDkfs3zUFQg0KDVpekpHJB0lO1ltA4LG33q/QD2HZ
         uFjnqmua06IdwTbFwX9VnxfOsmIJbaPWzNJqzoYRMYkfNEXIKnMMk/nYHIlAP0UdVihG
         d0q164yCcpnVh0Jfn2osebm6SCUEpXVrZd9snBCnnLf/jqIMM5bmzFYQIRh5x9ctNoYd
         wNzQbdfWD3mMnxoz+sdoGWUMm09ynrzW2t2x347bOrlCv/qGhT8td0p4rZSBdjJLrOPI
         2LltlZ1oObubEmu9zzJ0+OFmItwXCjmOX6ILmLJ13S41ZTmTQI/DO+yPj81aH7QIjGWf
         qCOA==
X-Gm-Message-State: APjAAAXi+4uAitM7axqJ/Z2Dpe+X8zk0CzZqGcnUoIVOofCVV5qYLsL+
        cQ7pD7i7CqE8F6TrlGn1SF4=
X-Google-Smtp-Source: APXvYqxk+32mdB6olsyPCQ91cJKq+4hqp+6qMQrMCNFb5t49r7lfv3K5V6XQePMULHJ4Jh0MDwUzvg==
X-Received: by 2002:a17:902:b288:: with SMTP id u8mr8260306plr.127.1568384381158;
        Fri, 13 Sep 2019 07:19:41 -0700 (PDT)
Received: from SARKAR ([1.186.12.73])
        by smtp.gmail.com with ESMTPSA id n66sm47178256pfn.90.2019.09.13.07.19.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Sep 2019 07:19:40 -0700 (PDT)
Date:   Fri, 13 Sep 2019 19:49:35 +0530
From:   Rohit Sarkar <rohitsarkar5398@gmail.com>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     kernel-janitors@vger.kernel.org, kernelnewbies@kernelnewbies.org
Subject: Re: Queries of an aspiring kernel developer
Message-ID: <20190913141935.GA309@SARKAR>
References: <20190912142517.GA22751@SARKAR>
 <20190913132310.GQ20699@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190913132310.GQ20699@kadam>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Fri, Sep 13, 2019 at 04:23:10PM +0300, Dan Carpenter wrote:
> On Thu, Sep 12, 2019 at 07:55:17PM +0530, Rohit Sarkar wrote:
> > Hi Dan,
> > First things first, I know that sending private emails is frowned upon
> > but I was unsure if this would belong in the list.
> 
> This does belong on the list.  Especially the kernel-janitor list.

Added kernel-janitors and kernel-newbies to the thread.
> > Secondly I will keep
> > this as short as possible. (I know you are lazy :) )
> > 
> > I have been interested in kernel development for a long time and want to
> > contribute to the community while learning and having fun.
> > Till now I have sent some minor patches:
> > [1]: Fixes typo
> > [2]: Checkpatch fix
> > [3]: Replaces snprintf with scnprintf
> > 
> > I now would like to work on something that is not too trivial (like a
> > typo/checkpatch fix) and not too complex. I am finding it difficult to
> > come up with something substantial to work on.
> 
> The various intern project probably have ideas.  Julia Lawall may know.
> 
Sure, will get in touch with her.

> > It would really help me if you could point me in a direction where I could
> > focus my efforts on.
> 
> What I always tell people is to pick a small driver from staging.  The
> iio drivers are pretty small.  Just try to fix it as much as possible.
> Read it and re-read it and patch it and patch it.  As you go you will
> learn more until you are the expert of that driver.  Try to get it
> moved out of staging.

This sounds nice. Would this require any external hardware for testing? 
> regards,
> dan carpenter
Thanks a lot for taking the time to reply.

Regards,
Rohit Sarkar
