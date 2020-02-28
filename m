Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A77CD173D4C
	for <lists+kernel-janitors@lfdr.de>; Fri, 28 Feb 2020 17:43:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726764AbgB1Qnj (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Fri, 28 Feb 2020 11:43:39 -0500
Received: from mail-qv1-f67.google.com ([209.85.219.67]:36462 "EHLO
        mail-qv1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725876AbgB1Qnj (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 28 Feb 2020 11:43:39 -0500
Received: by mail-qv1-f67.google.com with SMTP id ff2so1635569qvb.3
        for <kernel-janitors@vger.kernel.org>; Fri, 28 Feb 2020 08:43:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=N5DuvvXCYfN5Z8wUyFBZOEu002Rcl+4Tlaf2CcJH4oc=;
        b=TBWGkZw8FyUBgrSPpJqOqUV9xpDNQ0C7F/csa70uN+LZ/aBoLIt/BUh0sl8ElozZXO
         nIE2mp7pEVHUaom6XwSruLfLtrQEXV10JbbQaxaOBYBIYSfJxihlwCoG3+BBKCYfWuBL
         ySnNcW5cdm7NO8lz/O0cWSmKMKpEwv9riC9Kr+7nlnMx6ssjYbKpcNMVEnKE7qfeS+yj
         jy9e6jdl/G9dujVOl7TXnk9z9Rdlg+Wy9SFqdv7e9a+dS3xAv5E3VxJuzyPkYEaGr178
         mLFk159kZyuW6VpJbEZiCGsIOFmiC3e3aY16qxz6s62DUSxRp5cLOh3zhHBT3NSVn5Bf
         8HXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=N5DuvvXCYfN5Z8wUyFBZOEu002Rcl+4Tlaf2CcJH4oc=;
        b=BD8fZMS8gqyGB7vsoGNGtjANcr9QGP9SkctenDE2zWVci6m7app4qxkL8RmW4gfDAr
         o/UzUva9NQkLbCi4DXh+RI1VLOyVrfQRgEYcQmuXA17WMaJw7bJadx/3pPsx4jNhJfom
         qulMIT3f48xN9xXXEyl+jZB4OHlX1KsqUzVgIF7SxPf4n2t/H6oqvoDeY+B64HHlf71I
         dq/KbqqxY5O6dz5IyMi5iA8EzMDqyjkq7kVfKorvOttEApWLj88+ow3SvifuW/K9ftbB
         1fV2Q0j2Ij2PGdqJQKswjjYgmGWiKb/Yn8Sa+fTKUprYbFmwiPRYlrkL8Rh0II43VTJm
         Hmkg==
X-Gm-Message-State: APjAAAXIat57iWKcjbvjI1CpXw0bA+s9yD18Mb2d7qH0WuKa4F4If+lU
        hv3Rhs8a2GP53qFj9AqPepqERg==
X-Google-Smtp-Source: APXvYqyKbjA+aHK7zP+EgOT4mAeWwV8yOTRizbNS46wTLSoevCeRyAkuih70S9h++ucv03CF+VJ56g==
X-Received: by 2002:a05:6214:bc5:: with SMTP id ff5mr4455494qvb.18.1582908218696;
        Fri, 28 Feb 2020 08:43:38 -0800 (PST)
Received: from ziepe.ca (hlfxns017vw-142-68-57-212.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.68.57.212])
        by smtp.gmail.com with ESMTPSA id r37sm5260137qtj.44.2020.02.28.08.43.38
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 28 Feb 2020 08:43:38 -0800 (PST)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
        (envelope-from <jgg@ziepe.ca>)
        id 1j7ijh-0001sL-Qw; Fri, 28 Feb 2020 12:43:37 -0400
Date:   Fri, 28 Feb 2020 12:43:37 -0400
From:   Jason Gunthorpe <jgg@ziepe.ca>
To:     YueHaibing <yuehaibing@huawei.com>
Cc:     Selvin Xavier <selvin.xavier@broadcom.com>,
        Devesh Sharma <devesh.sharma@broadcom.com>,
        Somnath Kotur <somnath.kotur@broadcom.com>,
        Sriharsha Basavapatna <sriharsha.basavapatna@broadcom.com>,
        Doug Ledford <dledford@redhat.com>, linux-rdma@vger.kernel.org,
        kernel-janitors@vger.kernel.org, Hulk Robot <hulkci@huawei.com>
Subject: Re: [PATCH -next] RDMA/bnxt_re: Remove set but not used variable
 'pg_size'
Message-ID: <20200228164337.GA7181@ziepe.ca>
References: <20200227064209.87893-1-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200227064209.87893-1-yuehaibing@huawei.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Thu, Feb 27, 2020 at 06:42:09AM +0000, YueHaibing wrote:
> Fixes gcc '-Wunused-but-set-variable' warning:
> 
> drivers/infiniband/hw/bnxt_re/qplib_res.c: In function '__alloc_pbl':
> drivers/infiniband/hw/bnxt_re/qplib_res.c:109:13: warning:
>  variable 'pg_size' set but not used [-Wunused-but-set-variable]
> 
> commit 0c4dcd602817 ("RDMA/bnxt_re: Refactor hardware queue memory allocation")
> involved this, but not used, so remove it.
> 
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> ---
>  drivers/infiniband/hw/bnxt_re/qplib_res.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)

Applied to for-next, thanks

Jason
