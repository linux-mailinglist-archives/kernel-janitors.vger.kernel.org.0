Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2BBE83B5FB
	for <lists+kernel-janitors@lfdr.de>; Mon, 10 Jun 2019 15:28:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390182AbfFJN2v (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Mon, 10 Jun 2019 09:28:51 -0400
Received: from mail-qk1-f195.google.com ([209.85.222.195]:45956 "EHLO
        mail-qk1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389756AbfFJN2v (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 10 Jun 2019 09:28:51 -0400
Received: by mail-qk1-f195.google.com with SMTP id s22so5484529qkj.12
        for <kernel-janitors@vger.kernel.org>; Mon, 10 Jun 2019 06:28:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=QuNGikApppPlg0NjWKKrBOd/y46mu13TvQokHY9jymY=;
        b=dRCMPRmC4+wostK1DLkuHVBJYkHjafHfZyRDoauespSItE5FxreYUh5iJ4zrJNYE/s
         knM+UwfJmj4GQfOa9BSME1zKsqYtD1sa/Y6Ud7giKFp1StdGQDTLbD3n8VPshrHMnEA0
         AK+QgF3y7Z0XAz+xCC3ddz3b+WtcpFneogqYuq1NmW1fHOPeATrqTaFnTGhmdeunVGo5
         ouVQOTzLrIDjHSwasVdcx+fd8e6jdXy60K0blnK9H5rdMKRlof13acfz6EvA52YHUdTd
         gHodtboDZ6WulBSLFdAZLcjjX/UZZtR+AqfqCpoJ872IjCZDE49jWI47okyhXLbf1EZu
         2ZFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=QuNGikApppPlg0NjWKKrBOd/y46mu13TvQokHY9jymY=;
        b=bsaa6rCHq3WqFU8kpTpiwp8nwPK2MhfXpfPBEutF+GpzLt5pyPVm3z26yDOuyg1+hp
         TAJ38VPcuR1eDS+VNFtfsix10D2FzVumvdSLVsjaPnOCAF/vo+rgIpuPUlx+qh7ua5xG
         rPGg+cCgGtU/jHA4Dm938anm9kGHmL8FFLr7s+4viE+0N0rlcY1lN8Dzpv88gP2Edizh
         F8o8DBjznWgcXzfmmFSkTwh6OX0eS4jZxEE9YqNDy1iXt3fNsxa7Zfk2810jLiazXc2x
         gP5wWp5KLs3cb4uNt9KpJ4KoziNpNHOJVrBwTJ0Bn4CY+qKJvaqtrEexNOBKofEr4S81
         Orew==
X-Gm-Message-State: APjAAAXHlYS7ooskkCya+usnpbucH+MIm1RNjywZhKz9CzlOerO4HtPG
        r4TP5NfADNtcCws4mZKE1zWE4A==
X-Google-Smtp-Source: APXvYqw9KHhM3oHMB8yDNq7/Zm1qKpKlNMxma8Rlg6pAIXhuhNWj8ray+L0bOOV4P9zgblFWFYvlnw==
X-Received: by 2002:a37:9a50:: with SMTP id c77mr55972280qke.12.1560173330662;
        Mon, 10 Jun 2019 06:28:50 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-156-34-55-100.dhcp-dynamic.fibreop.ns.bellaliant.net. [156.34.55.100])
        by smtp.gmail.com with ESMTPSA id j9sm4706582qkg.30.2019.06.10.06.28.50
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 10 Jun 2019 06:28:50 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
        (envelope-from <jgg@ziepe.ca>)
        id 1haKLx-0001qn-Sk; Mon, 10 Jun 2019 10:28:49 -0300
Date:   Mon, 10 Jun 2019 10:28:49 -0300
From:   Jason Gunthorpe <jgg@ziepe.ca>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Yishai Hadas <yishaih@mellanox.com>,
        Doug Ledford <dledford@redhat.com>, linux-rdma@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] IB/mlx4: prevent undefined shift in set_user_sq_size()
Message-ID: <20190610132849.GD18468@ziepe.ca>
References: <20190608092231.GA28890@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190608092231.GA28890@mwanda>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Sat, Jun 08, 2019 at 12:22:31PM +0300, Dan Carpenter wrote:
> The ucmd->log_sq_bb_count is a u8 that comes from the user.  If it's
> larger than the number of bits in an int then that's undefined behavior.
> It turns out this doesn't really cause an issue at runtime but it's
> still nice to clean it up.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  drivers/infiniband/hw/mlx4/qp.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/infiniband/hw/mlx4/qp.c b/drivers/infiniband/hw/mlx4/qp.c
> index 5221c0794d1d..9f6eb23e8044 100644
> --- a/drivers/infiniband/hw/mlx4/qp.c
> +++ b/drivers/infiniband/hw/mlx4/qp.c
> @@ -439,7 +439,8 @@ static int set_user_sq_size(struct mlx4_ib_dev *dev,
>  			    struct mlx4_ib_create_qp *ucmd)
>  {
>  	/* Sanity check SQ size before proceeding */
> -	if ((1 << ucmd->log_sq_bb_count) > dev->dev->caps.max_wqes	 ||
> +	if (ucmd->log_sq_bb_count > 31					 ||
> +	    (1 << ucmd->log_sq_bb_count) > dev->dev->caps.max_wqes	 ||

Surely this should use check_shl_overflow() ?

Jason
