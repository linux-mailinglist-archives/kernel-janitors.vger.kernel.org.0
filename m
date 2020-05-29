Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 065351E867E
	for <lists+kernel-janitors@lfdr.de>; Fri, 29 May 2020 20:20:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726970AbgE2SUk (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Fri, 29 May 2020 14:20:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48430 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725839AbgE2SUj (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 29 May 2020 14:20:39 -0400
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com [IPv6:2607:f8b0:4864:20::842])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD7FBC03E969
        for <kernel-janitors@vger.kernel.org>; Fri, 29 May 2020 11:20:38 -0700 (PDT)
Received: by mail-qt1-x842.google.com with SMTP id z1so2739403qtn.2
        for <kernel-janitors@vger.kernel.org>; Fri, 29 May 2020 11:20:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=ChhpnWyJyVmgjoRJH/BNQYkEfM9pIhC10bAvWTPw9XM=;
        b=c66p9MDvjQCkyYqa100k4vINobxzfBj3Y8NAHDbCTmPN2OlFwO9UjZ77O+0kLagv1C
         Md7C4SzY2b7uC2D0Ollg2/GVJ0OjI967BJktCv4ewd205aOc/ZIGMyhTyw19AEcuCO0S
         hZi9xcL3OGY1kMaCrZl5oWir32Fgyskj7wUy1mmuEMs7rI97GVNLZHIQgSqaWq3ElDRQ
         ljsVyrwbs5qw3W7z4DB9+VED2DPnrWttEuNcq5aXlIRM7y2rAYlbGWh5qcjNtWVc+eTf
         uhWW5roqtjd+1dFeF4gEBZk6o7adDpMnH0OIDkbv6TCA1Xt165RTNufO0FULaBbkEQGf
         1ldw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=ChhpnWyJyVmgjoRJH/BNQYkEfM9pIhC10bAvWTPw9XM=;
        b=I2B8IWnJsVIBMWPGKplAz6vb2J42Km4PMEUF9lvaJZjEJ5oWdm5tjZuWYxn3oiqQQY
         HH3Jtwaf8a3zjSskCEg5TCVw/ZbPPBdBsRxf+oqyJRAfuXwDLEjM9/IXKKRQRI9AphMm
         Xu9Eeax0kCpGCmygr3+tPfb9IajngR7QKvBVWKiCVZh/KdXEWXnZGl2PcvcomQwI+jGw
         ITL5rJKqTHwndtm9V3Xn8CeQ5xulty3hAAvqUI16QBLFjf5+qZ1A2cr+UeV6agsEmpwW
         I1xwtF9j0dbRb5b9ztse2hCkfYBF61vkSlTYbZLfvchVyhhiXTkCImt/zvLOWqGNxDHl
         5PUA==
X-Gm-Message-State: AOAM531J1TvMYrvYYWg9Qs+6j/gSsHFzWk5soDJ4aT8LTIWUohCFZJ4k
        HVBwdb8wy8UcY3h1swYd29Lcpw==
X-Google-Smtp-Source: ABdhPJwH+mpV+w1wzbF6SpCDz5Hec20m/pxhmwzvv09S/bv5dTD2l+BeoIE6q4qxus4G05ygIRJ+8A==
X-Received: by 2002:ac8:bc4:: with SMTP id p4mr10318652qti.72.1590776437985;
        Fri, 29 May 2020 11:20:37 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-156-34-48-30.dhcp-dynamic.fibreop.ns.bellaliant.net. [156.34.48.30])
        by smtp.gmail.com with ESMTPSA id v69sm7734321qkb.96.2020.05.29.11.20.37
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 29 May 2020 11:20:37 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
        (envelope-from <jgg@ziepe.ca>)
        id 1jejcS-0002xt-Uq; Fri, 29 May 2020 15:20:36 -0300
Date:   Fri, 29 May 2020 15:20:36 -0300
From:   Jason Gunthorpe <jgg@ziepe.ca>
To:     Colin King <colin.king@canonical.com>
Cc:     Lijun Ou <oulijun@huawei.com>, Wei Hu <huwei87@hisilicon.com>,
        Weihang Li <liweihang@huawei.com>,
        Doug Ledford <dledford@redhat.com>, linux-rdma@vger.kernel.org,
        kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH][next] RDMA/hns: remove duplicate assignment to pointer
 raq
Message-ID: <20200529182036.GA11361@ziepe.ca>
References: <20200528150427.420624-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200528150427.420624-1-colin.king@canonical.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Thu, May 28, 2020 at 04:04:27PM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The pointer raq is being assigned twice. Fix this by removing
> one of the redundant assignments.
> 
> Fixes: 14ba87304bf9 ("RDMA/hns: Remove redundant type cast for general pointers")
> Addressses-Coverity: ("Evaluation order violation")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/infiniband/hw/hns/hns_roce_hw_v1.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to for-next

Thanks,
Jason
