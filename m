Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6F6E4191D1A
	for <lists+kernel-janitors@lfdr.de>; Tue, 24 Mar 2020 23:49:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727324AbgCXWte (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Tue, 24 Mar 2020 18:49:34 -0400
Received: from mail-qt1-f195.google.com ([209.85.160.195]:39823 "EHLO
        mail-qt1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727132AbgCXWte (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 24 Mar 2020 18:49:34 -0400
Received: by mail-qt1-f195.google.com with SMTP id f20so517459qtq.6
        for <kernel-janitors@vger.kernel.org>; Tue, 24 Mar 2020 15:49:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=wyre3unUyh1VElX8qQhfnuJe+QdabugraqvEEHKN5YY=;
        b=JHxWKsrHre+Ce4pqLceZTwJslN4U/dAs+9ebExo+k14lMpfIb+6utSRVDoFt3DfKB6
         gmgtze8t9WvmSoxBdR4uF+gQQcAqqQgaNzZRNa2Qkvq3FxtuiL1+oEBVzipVmSLeZH1u
         AkPQnXx4ZR2YjQfROHmvO8kUd48krZ++1H5PMkkewe9zzLOMy3si5FWidbfOEzzRxIYw
         lVsP2uXCaktz7Jag9+j2HvUJFu9wpvD2gdwIKbS6oRPDgPA2lm62qgL5ZdJrrzaZMUqf
         1edRMPYdNHRPxhXrONQsHyyJ+ynwEZINfJRyaPSk7m5QPXMhpHbbk7IlW/HFkz3A8M3k
         klkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=wyre3unUyh1VElX8qQhfnuJe+QdabugraqvEEHKN5YY=;
        b=ne58JZSpX3nHoDoQagL4W9buuvHU8DQgm8MCr6AvpNXtvgvFeQGTEJzP8l+azlXOM/
         FN7PQKOGv4I7+Ds9aQ/Fx7hdsVdvL7tO8zto1vLft0zQX5uEjTgLsKAETQ2M9/oDYDnb
         8gJXKlpWFvXWJilEZGbMrnyF+1l3bGm55HisJ/hdeK3f4l3cM4Lo52n3d4VfWaoWuGAr
         SKOW/eY3CTpYnMxmUUYz+xUyMCdBpykNB7lex5+sTSCaJWj0U7upF7q8ShxqB8BjGs6r
         ycg3xF2Fm8d2R9aRl1Q0DTn2209z7wumOYZklGyDph2t4F5in78/Awq2TdW5dMUcibq+
         hQsA==
X-Gm-Message-State: ANhLgQ0Aox6eR+2mVAtzxRF5vu64ADvZII8vdsLJovrUV8l86LHCsNUm
        RikGJUBHOSUr8Cr/XC0hXIqNGA==
X-Google-Smtp-Source: ADFU+vt9bpUw3FK771MMLlRTjLi7t80bcVF9NWM8TbZifYI3XyUssP/a/KNH8DQ1koq0V4GiQsASMw==
X-Received: by 2002:aed:2a55:: with SMTP id k21mr185313qtf.159.1585090173412;
        Tue, 24 Mar 2020 15:49:33 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-68-57-212.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.68.57.212])
        by smtp.gmail.com with ESMTPSA id v126sm14541082qkb.107.2020.03.24.15.49.32
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 24 Mar 2020 15:49:32 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
        (envelope-from <jgg@ziepe.ca>)
        id 1jGsMW-0007PL-37; Tue, 24 Mar 2020 19:49:32 -0300
Date:   Tue, 24 Mar 2020 19:49:32 -0300
From:   Jason Gunthorpe <jgg@ziepe.ca>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Leon Romanovsky <leon@kernel.org>,
        Yishai Hadas <yishaih@mellanox.com>,
        Doug Ledford <dledford@redhat.com>, linux-rdma@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] IB/mlx5: Fix a NULL vs IS_ERR() check
Message-ID: <20200324224932.GA28435@ziepe.ca>
References: <20200320132641.GF95012@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200320132641.GF95012@mwanda>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Fri, Mar 20, 2020 at 04:26:41PM +0300, Dan Carpenter wrote:
> The kzalloc() function returns NULL, not error pointers.
> 
> Fixes: 30f2fe40c72b ("IB/mlx5: Introduce UAPIs to manage packet pacing")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> Acked-by: Leon Romanovsky <leonro@mellanox.com>
> ---
>  drivers/infiniband/hw/mlx5/qos.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Applied to for-next, thanks

Jason
