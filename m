Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 429D61DA5BF
	for <lists+kernel-janitors@lfdr.de>; Wed, 20 May 2020 01:44:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725998AbgESXob (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Tue, 19 May 2020 19:44:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59338 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726344AbgESXob (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 19 May 2020 19:44:31 -0400
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com [IPv6:2607:f8b0:4864:20::842])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 056B7C061A0F
        for <kernel-janitors@vger.kernel.org>; Tue, 19 May 2020 16:44:30 -0700 (PDT)
Received: by mail-qt1-x842.google.com with SMTP id m64so1199289qtd.4
        for <kernel-janitors@vger.kernel.org>; Tue, 19 May 2020 16:44:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=l6/TUMn0kemAWniMbQ+TW8Vwyo/kgFVa5klt/X0syHY=;
        b=SiB+4L7eyhIeL/NEPqO5t0hFi3YFHgzZten4DfuxDbMUkAqsYEtG+IoHRJ6PrbScGp
         LXKW8SHHL0stIdBiPBu5A9IUO+ROqbIJEhU4xedjaJUkF0P5xT5H3nnDdEHlYhv3K5b/
         fhaHDPq586vXNlsTeazu5POebcYmgqGxJVBugD4+sBvkvoqUpe9ugfNMFqf6MaxFQvF5
         Jw6bfoierY4Q6H//UC7HrGMtOTkfGxFn43dqNP1UKKtk6XyD54bVU8e6d31H0SwxUnBY
         Hc6sCtUh7rE9UwmtU6CKynTWQFX4rJ8R6tmpJrE8sf96UONm69NPLfOVc4gHBBQEccBX
         08bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=l6/TUMn0kemAWniMbQ+TW8Vwyo/kgFVa5klt/X0syHY=;
        b=BZ9NYB6+C2kFf73Me866P4hYqjZ7f9KB91tjHzBNRQTlkL7DcKfAvTFFu/vek0gjOA
         KhewXT/XcFvBZltcEZnNSrrE1OFNX/r8pOFpElQoU8wrs5FeIu0ZnCvoKY8uP6LmtRwC
         /KAq8v5AGF3mZE6t5yfxkzhcuccEQGHmwYmg6+T7G3R0Vp5n1/8R2sLXMj3HSf6BKiHh
         tloSWqmD2MmXOfyGjDW1xD1yeEh7272L6lbJlDX6pgq6E7uEcy9PgAaNN9U/GnNAP44K
         8LpTEvj9YKDfsUExdh8gIqytOhJmrhPOOLMDkebAnqWmNNEPyxifbmNDilQBcn/YF+eA
         kRnw==
X-Gm-Message-State: AOAM531UTiWvFWhGDip01A8VQHUyhyPmzDBdZ/xKGX0HVPiX2Ckwg60r
        R+OCJ3qUCCXSJXSU0Ky7D+Whqg==
X-Google-Smtp-Source: ABdhPJzsDk4ivo9nrvpze8Vvv9nUkgMjUT9d51xyrgT9JaiYw9juWcY+VNQCOaKAFaeLTojvx5w6Zw==
X-Received: by 2002:ac8:7304:: with SMTP id x4mr2661805qto.4.1589931870282;
        Tue, 19 May 2020 16:44:30 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-156-34-48-30.dhcp-dynamic.fibreop.ns.bellaliant.net. [156.34.48.30])
        by smtp.gmail.com with ESMTPSA id d140sm135131qkc.22.2020.05.19.16.44.29
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 19 May 2020 16:44:29 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
        (envelope-from <jgg@ziepe.ca>)
        id 1jbBuP-0007yM-6O; Tue, 19 May 2020 20:44:29 -0300
Date:   Tue, 19 May 2020 20:44:29 -0300
From:   Jason Gunthorpe <jgg@ziepe.ca>
To:     Wei Yongjun <weiyongjun1@huawei.com>
Cc:     Danil Kipnis <danil.kipnis@cloud.ionos.com>,
        Jack Wang <jinpu.wang@cloud.ionos.com>,
        Doug Ledford <dledford@redhat.com>, linux-rdma@vger.kernel.org,
        kernel-janitors@vger.kernel.org, Hulk Robot <hulkci@huawei.com>
Subject: Re: [PATCH -next] RDMA/rtrs: server: fix some error return code
Message-ID: <20200519234429.GA30609@ziepe.ca>
References: <20200519091912.134358-1-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200519091912.134358-1-weiyongjun1@huawei.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Tue, May 19, 2020 at 09:19:12AM +0000, Wei Yongjun wrote:
> Fix to return negative error code -ENOMEM from the some error handling
> cases instead of 0, as done elsewhere in this function.
> 
> Fixes: 9cb837480424 ("RDMA/rtrs: server: main functionality")
> Fixes: 91b11610af8d ("RDMA/rtrs: server: sysfs interface functions")
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> Reviewed-by: Danil Kipnis <danil.kipnis@cloud.ionos.com>
> ---
>  drivers/infiniband/ulp/rtrs/rtrs-srv.c | 8 +++++---
>  drivers/infiniband/ulp/rtrs/rtrs-srv-sysfs.c | 1 +
>  2 file changed, 6 insertions(+), 3 deletions(-)

Applied to for-next, thanks

Jason
