Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 40E0F25B777
	for <lists+kernel-janitors@lfdr.de>; Thu,  3 Sep 2020 01:59:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726900AbgIBX7O (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Wed, 2 Sep 2020 19:59:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43764 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726523AbgIBX7M (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 2 Sep 2020 19:59:12 -0400
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com [IPv6:2607:f8b0:4864:20::842])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4EF8CC061245
        for <kernel-janitors@vger.kernel.org>; Wed,  2 Sep 2020 16:59:12 -0700 (PDT)
Received: by mail-qt1-x842.google.com with SMTP id d27so634652qtg.4
        for <kernel-janitors@vger.kernel.org>; Wed, 02 Sep 2020 16:59:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=k+XXCDXSF8k3/5oiJ0DY2qz0pJ0OQTKQmzd5Mr1hMp0=;
        b=k1y0rDoDsr248x1CrTdDnmq7vHyf3zqzV66lGF84OfqFM/30fnlspewvTtRvX7gidt
         gKLDfuKNurlYK+R6LwvZ+qHdC4de+pqaJZSVppacYj9aI9LUH0L5tc0Uoh+Z/aj8M9ZJ
         R6FWg8miU37wLvY2KcR7jd2EIPJ1daC+4PIKYb7D8dOi77gNhJnXrhYPMOqh32KuvPP8
         XejcAUn4CvHG80LA/gFKzjQRuuelnO2jhZWs/wY/tECnRxVgNr/JnyNRnkRY/TttdGB/
         gU7CLgfyrHQVWJMKNbMqWZLm+o2LV+mlHDUmQZV7kjB8cqzryAmBAJ5nZ9CcRCfBnsZS
         7rVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=k+XXCDXSF8k3/5oiJ0DY2qz0pJ0OQTKQmzd5Mr1hMp0=;
        b=gouYrXIhDtZNpmbIZDtRVx9ldjCqWwzlRCe4MbGyzzGvuZKvTbCu9Jj4pnS2KisuPE
         R1pjNpnC/dbaiL6oCgA62i3fEvP9m73qlgeSw7t2jjAwnBOal/8aSJoXhYWgfOa5XwXw
         ytuEhTvD4R20DxSscGLMPZ7Dd3+Yq33J0YyYpw9atd3BJ2JhgZVWEVXXwDSkVakFp0R6
         Cy3Hk7i9h6SfyZ8gVHXKELuFptbIRzNXfPnGEEUE64ks74lLcnF2YuKKGO4Yuy/V8vJ9
         7AW3SUCftCqKz19Zbn+YIiEbDO9Hi8al2lBmPKpeFwhWTf26qA7mVHsgE/w/7dESNkBl
         7vSg==
X-Gm-Message-State: AOAM532Hfl69KDjwCcGFQcOptqZrhkVFDirw/j/JXCMmLiCfyE3qzbYo
        2UbUcx1FOwofCgrqIP0PDCpZjPlahsI13w==
X-Google-Smtp-Source: ABdhPJxPEvQzdmtHRU/dLJO3dr0rZQWH3nG+MoxQFCjUTeleYWtCUHQZIyapPQIwS1V6Ay7IjUZ3Og==
X-Received: by 2002:ac8:60d9:: with SMTP id i25mr716212qtm.209.1599091151435;
        Wed, 02 Sep 2020 16:59:11 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-156-34-48-30.dhcp-dynamic.fibreop.ns.bellaliant.net. [156.34.48.30])
        by smtp.gmail.com with ESMTPSA id b43sm762647qtk.84.2020.09.02.16.59.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2020 16:59:10 -0700 (PDT)
Received: from jgg by mlx with local (Exim 4.94)
        (envelope-from <jgg@ziepe.ca>)
        id 1kDcek-006Cfl-01; Wed, 02 Sep 2020 20:59:10 -0300
Date:   Wed, 2 Sep 2020 20:59:09 -0300
From:   Jason Gunthorpe <jgg@ziepe.ca>
To:     Colin King <colin.king@canonical.com>
Cc:     Doug Ledford <dledford@redhat.com>,
        Leon Romanovsky <leon@kernel.org>, linux-rdma@vger.kernel.org,
        kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH][next] RDMA/ucma: fix memory leak of mc on an xa_alloc
 failure
Message-ID: <20200902235909.GK24045@ziepe.ca>
References: <20200902162805.200436-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200902162805.200436-1-colin.king@canonical.com>
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Wed, Sep 02, 2020 at 05:28:05PM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Currently when an xa_alloc failure occurs the error exit path leaks
> the allocated object mc.  Fix this by adding an error return path
> that frees mc and rename error exit paths err3 to err4 and err2 to err3.
> 
> Fixes: 95fe51096b7a ("RDMA/ucma: Remove mc_list and rely on xarray")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/infiniband/core/ucma.c | 11 ++++++-----
>  1 file changed, 6 insertions(+), 5 deletions(-)

Alex beat you too it, so I will use his patch, thanks

Jason
