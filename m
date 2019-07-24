Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 91725738AF
	for <lists+kernel-janitors@lfdr.de>; Wed, 24 Jul 2019 21:32:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387598AbfGXTcE (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Wed, 24 Jul 2019 15:32:04 -0400
Received: from mail-qk1-f195.google.com ([209.85.222.195]:38549 "EHLO
        mail-qk1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388575AbfGXTcA (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 24 Jul 2019 15:32:00 -0400
Received: by mail-qk1-f195.google.com with SMTP id a27so34654959qkk.5
        for <kernel-janitors@vger.kernel.org>; Wed, 24 Jul 2019 12:31:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=JInymQc+r2pImT3B/SmMJqhNX9Hf0EsstZD4VE2LjQM=;
        b=kqZlOYO69x/UMTO3KbfUun+RUej+Y76S6n3UnFY6G3wqJzkvqWxwRxlpmvMwx+lWQp
         5P9Ndi1/9ULn3zbXOvj43rZB0qedEiDhjIQyLZpqiO5jWvvjUpbuSLTz6gw40pIyuntD
         cggriFRIBnzO0dFwBsK1LW9AG+oSsbnKRqd9uBFaiBHzjjfM7TJVfClTjmOZ8ugBiuap
         e+wEr5Hxo0frnDbySkZTeLae0KrjbsyVtLi40YtQfm//ENZepIaOs2io14Ncx3Had2jj
         BXr+eLZ5gyA77h7uoSpLFR7S/AV7V7Gd6/I2q8XVXeVOcxH6jFEGqEsXWRMTP5SwFtzV
         786A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=JInymQc+r2pImT3B/SmMJqhNX9Hf0EsstZD4VE2LjQM=;
        b=p1mxuBpF/j7IdqDq39xeiurjHNa6zJrOrOwzNaDgraDhzw+sQ37slWVBD7nnoQ4off
         dut9apNYhrYbEfbYZnkxmQZkxZdk9ehFmN5ef6dQO46zbXMTjotZcrnYvaFgguwFgpi+
         sSPzBvyOQKEJDanQJu8nK1mg5xlPmsQWjKi7rqkRWDRXI132rF2zaoauWoO2wFbjmDl1
         NjZZ8aajeySsuFGHfUOxp6mXbzkEH+XnFLazoU2TUDzKn1OHpLlnNvLYim+CoAva4YY2
         tSuCMHIvAExjden3Q6JLz/ws0ZPxXebvbIoIZTXiTeyCclA9s0DbFbluMaV2mSlshrlg
         TnjQ==
X-Gm-Message-State: APjAAAW2fMBaoi+TVhfiwNURyJsPVhJB+0/AEquuXxLebKpPg7YVvgTr
        Pkg5j/UTcQQG8RwcHZrlATpYZg==
X-Google-Smtp-Source: APXvYqxLDN1MDxYfhjO8ggCE8CbyvO+EWhy5R2UY8hExLnegRMJl96uiWmL/0ruwscoK42+uMywHnw==
X-Received: by 2002:a37:7604:: with SMTP id r4mr53902933qkc.395.1563996718992;
        Wed, 24 Jul 2019 12:31:58 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-156-34-55-100.dhcp-dynamic.fibreop.ns.bellaliant.net. [156.34.55.100])
        by smtp.gmail.com with ESMTPSA id u4sm21157159qkb.16.2019.07.24.12.31.58
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 24 Jul 2019 12:31:58 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
        (envelope-from <jgg@ziepe.ca>)
        id 1hqMzW-0001jO-03; Wed, 24 Jul 2019 16:31:58 -0300
Date:   Wed, 24 Jul 2019 16:31:57 -0300
From:   Jason Gunthorpe <jgg@ziepe.ca>
To:     Colin King <colin.king@canonical.com>
Cc:     Lijun Ou <oulijun@huawei.com>, Wei Hu <xavier.huwei@huawei.com>,
        Doug Ledford <dledford@redhat.com>, linux-rdma@vger.kernel.org,
        kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2][next] RDMA/hns: fix comparison of unsigned long
 variable 'end' with less than zero
Message-ID: <20190724193157.GA6620@ziepe.ca>
References: <20190531092101.28772-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190531092101.28772-1-colin.king@canonical.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Fri, May 31, 2019 at 10:21:00AM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Currently the comparison of end with less than zero is always false
> because end is an unsigned long.  Also, replace checks of end with
> non-zero with end > 0 as it is possible that the #defined decrement
> may be changed in the future causing end to step over zero and go
> negative.
> 
> The initialization of end with 0 is also redundant as this value is
> never read and is later set to HW_SYNC_TIMEOUT_MSECS, so fix this by
> initializing it with this value to begin with.
> 
> Addresses-Coverity: ("Unsigned compared against 0")
> Fixes: 669cefb654cb ("RDMA/hns: Remove jiffies operation in disable interrupt context")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/infiniband/hw/hns/hns_roce_hem.c   |  4 ++--
>  drivers/infiniband/hw/hns/hns_roce_hw_v1.c | 12 ++++++------
>  2 files changed, 8 insertions(+), 8 deletions(-)

Applied to for-next, thanks

Jason
