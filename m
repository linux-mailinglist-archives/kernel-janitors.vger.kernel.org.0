Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D9601173D50
	for <lists+kernel-janitors@lfdr.de>; Fri, 28 Feb 2020 17:44:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726791AbgB1Qnx (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Fri, 28 Feb 2020 11:43:53 -0500
Received: from mail-qk1-f195.google.com ([209.85.222.195]:35718 "EHLO
        mail-qk1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726103AbgB1Qnx (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 28 Feb 2020 11:43:53 -0500
Received: by mail-qk1-f195.google.com with SMTP id 145so3576384qkl.2
        for <kernel-janitors@vger.kernel.org>; Fri, 28 Feb 2020 08:43:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=gHDxDO8TDc5u4ZNxLNS+33PTzco5vMggiWWW76WodtA=;
        b=RvJrc8FlyuHOKcny5m+BwW8XSJoU2B88Hx6Gq0HI6prgJ4vhorOigPsuhgTL+UPk2H
         vAHPXcyT/eukU41x+e3u5euF45lYa2lvbJYEdqgpyPiZbwNF5MOSJeC5Hj1RHxMCkvJ3
         Omf7SzHUFmaR4flCAkE+fE6IVVDsBzmfhHL2OfWLY4WGHd1up25Vik5CeE3Yz2X/8Wk0
         5rwvJ6TlIF8rMNSuwVurXc9TMs6uIycZJeA3jwMniWbmCSBxuDvttnzlDPETQo7aBB1B
         z4AeNKedwPGr7WrScRGa8jnLjZCDu3jAbqemhkK+wJn56/jXYkDgrTO0fKGjZ3LaINgF
         houQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=gHDxDO8TDc5u4ZNxLNS+33PTzco5vMggiWWW76WodtA=;
        b=SJaN33b/i3fNi8N2CHjxALeAsscmFmWpIPHVe+6dEO403gGfgEr0yhdSfAqo3FWRGa
         DkdpXoH9BjOjmvw4jEVcUv2AhtePz8obdiVmmb30ohMw1gOpN3k42UwMclSPtK7sybTi
         fyxVWYpx/4Akjycws+rC9M9Dml7CG/TlutZ6RCa3u4R4D5YzmmwqobmiZK0Hf6z/rD9N
         Vx5RlXiW9YCWqrB3SiZdG2aZhLsjfmb7/4B6bEMXIqBzss3R/7TrEskgClfbRnRscocd
         fvl46oHlpiGvQndlj9BOAHSHa/sHjAY2n6UsFb2nkAAXIuMj1xh6/0IIoipmqbR2HNaR
         S/ug==
X-Gm-Message-State: APjAAAWS6XojLjYwpX+mbcB0xoF82v+12qXUQVGYXMKaqYMcE1FeU7Mr
        coQqflEsSaJiUIZyLZgljkaXEw==
X-Google-Smtp-Source: APXvYqzBhOX0/kLPJk49mxXMzogAU84GKqlm3r8j1HUFxZpyRXpvN3hPumnCHPyW4VENNJ4odofEnQ==
X-Received: by 2002:a37:4a16:: with SMTP id x22mr5481103qka.88.1582908232233;
        Fri, 28 Feb 2020 08:43:52 -0800 (PST)
Received: from ziepe.ca (hlfxns017vw-142-68-57-212.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.68.57.212])
        by smtp.gmail.com with ESMTPSA id j18sm5193793qka.95.2020.02.28.08.43.51
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 28 Feb 2020 08:43:51 -0800 (PST)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
        (envelope-from <jgg@ziepe.ca>)
        id 1j7ijv-0001se-FT; Fri, 28 Feb 2020 12:43:51 -0400
Date:   Fri, 28 Feb 2020 12:43:51 -0400
From:   Jason Gunthorpe <jgg@ziepe.ca>
To:     YueHaibing <yuehaibing@huawei.com>
Cc:     Selvin Xavier <selvin.xavier@broadcom.com>,
        Devesh Sharma <devesh.sharma@broadcom.com>,
        Somnath Kotur <somnath.kotur@broadcom.com>,
        Sriharsha Basavapatna <sriharsha.basavapatna@broadcom.com>,
        Doug Ledford <dledford@redhat.com>, linux-rdma@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        Hulk Robot <hulkci@huawei.com>
Subject: Re: [PATCH -next] RDMA/bnxt_re: Remove set but not used variable
 'dev_attr'
Message-ID: <20200228164351.GB7181@ziepe.ca>
References: <20200227064542.91205-1-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200227064542.91205-1-yuehaibing@huawei.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Thu, Feb 27, 2020 at 06:45:42AM +0000, YueHaibing wrote:
> Fixes gcc '-Wunused-but-set-variable' warning:
> 
> drivers/infiniband/hw/bnxt_re/ib_verbs.c: In function 'bnxt_re_create_gsi_qp':
> drivers/infiniband/hw/bnxt_re/ib_verbs.c:1283:30: warning:
>  variable 'dev_attr' set but not used [-Wunused-but-set-variable]
> 
> commit 8dae419f9ec7 ("RDMA/bnxt_re: Refactor queue pair creation code")
> involved this, but not used, so remove it.
> 
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> ---
>  drivers/infiniband/hw/bnxt_re/ib_verbs.c | 2 --
>  1 file changed, 2 deletions(-)

Applied to for-next, thanks

Jason
