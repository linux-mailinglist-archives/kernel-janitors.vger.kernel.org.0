Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BC5D2FCA51
	for <lists+kernel-janitors@lfdr.de>; Thu, 14 Nov 2019 16:54:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726984AbfKNPy2 (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Thu, 14 Nov 2019 10:54:28 -0500
Received: from mail-qt1-f194.google.com ([209.85.160.194]:37425 "EHLO
        mail-qt1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726640AbfKNPy2 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 14 Nov 2019 10:54:28 -0500
Received: by mail-qt1-f194.google.com with SMTP id g50so7303621qtb.4
        for <kernel-janitors@vger.kernel.org>; Thu, 14 Nov 2019 07:54:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=hHBp9Rngr0/24i035bFFf44VR2vxrTAay1OWpjjtXY0=;
        b=nzh5H/Rr4bG7FuXZ1Xz4g+iI0YNPS96ATAeGOknO8oj5zdPPXlt4R8PgYwVWRp6K0Y
         E1f943NVvvgL/oqVEfEQ/3uTi3qSOC6bnwnboZSY0I4OrztM+aSsFA8Tu4Q16iBh+xWJ
         TVJQbp3DGcacD7t9jV+2MggnZ7SxZI/aVoV02RgmV0IoJB8EcokprRnlOmcmyq3N6JCn
         /PwgdQpZViou3rjvQx+B1UHrh6skYu2olQUPJYobLEKtZEWM6wGmYHHLz81QqA8T65lc
         qWPmKSIx7CHXE5CzEHwGLUGl/Imp3zgExvdYC9UarSsE+G4QhgeAFueRQ7RELmL9y6LF
         hk/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=hHBp9Rngr0/24i035bFFf44VR2vxrTAay1OWpjjtXY0=;
        b=SHAiAXuXz67q0umjrQUBO/nW0KtQw80bdVDBBf6LFmut246m3F2ZZ5kMKQr3Uu8x0Y
         pplhU9RG6dX+R9MmNY3GhfgD6J7kbi5BfUxdKVvzhTUzRe6aEUfjJDpTvGwVJmvZ0B/W
         6D+MBu1xjoA+cnpyojKQa9whcYVc2ROy/h0KZXRIu8vSRQJh5YccrQRQ0Jjfq8hDXjfx
         NDcuB7q6Tw3xf7FQO6ctoqbtEzh+aGC+9qcqWX6xW+EhxclZGkVt5E69lfwXngRyLlUx
         0M2bKZOs34KLZo/YCwFpW7JMrYtB8kVvl7ioc4VqrckgjOEysMxTswR7dzgjh7xwjm8C
         wIhg==
X-Gm-Message-State: APjAAAXwdYLBTOidUEO1vQlO+YEyCvBIPCcvrc/NNTLVPNZkA50OQ09H
        I39RTmj/BenvuF7UhpYTIupiHw==
X-Google-Smtp-Source: APXvYqwpiXaK+rzDkvrMcpYhzU2ua+Ir1CVwJPJkiVyvP/2Ol1ns8TMFrdkZS8ztCtW8brsIYIbrQg==
X-Received: by 2002:ac8:2441:: with SMTP id d1mr8981400qtd.386.1573746867195;
        Thu, 14 Nov 2019 07:54:27 -0800 (PST)
Received: from ziepe.ca (hlfxns017vw-142-162-113-180.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.162.113.180])
        by smtp.gmail.com with ESMTPSA id s42sm3253153qtk.60.2019.11.14.07.54.26
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 14 Nov 2019 07:54:26 -0800 (PST)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
        (envelope-from <jgg@ziepe.ca>)
        id 1iVHRy-0007br-8c; Thu, 14 Nov 2019 11:54:26 -0400
Date:   Thu, 14 Nov 2019 11:54:26 -0400
From:   Jason Gunthorpe <jgg@ziepe.ca>
To:     Colin King <colin.king@canonical.com>
Cc:     Doug Ledford <dledford@redhat.com>, linux-rdma@vger.kernel.org,
        kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] infiniband: ocrdma: fix spelling mistake in variable name
Message-ID: <20191114155426.GB29207@ziepe.ca>
References: <20191107224855.417647-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191107224855.417647-1-colin.king@canonical.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Thu, Nov 07, 2019 at 10:48:55PM +0000, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> There is a spelling mistake in the variable nak_invalid_requst_errors,
> rename it to nak_invalid_request_errors.
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/infiniband/hw/ocrdma/ocrdma_sli.h   | 2 +-
>  drivers/infiniband/hw/ocrdma/ocrdma_stats.c | 4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)

Applied to for-next, thanks

Jason
