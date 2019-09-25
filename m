Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BEFA1BE0F4
	for <lists+kernel-janitors@lfdr.de>; Wed, 25 Sep 2019 17:13:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726335AbfIYPNW (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Wed, 25 Sep 2019 11:13:22 -0400
Received: from fieldses.org ([173.255.197.46]:60570 "EHLO fieldses.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726287AbfIYPNW (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 25 Sep 2019 11:13:22 -0400
Received: by fieldses.org (Postfix, from userid 2815)
        id 1D0981511; Wed, 25 Sep 2019 11:13:22 -0400 (EDT)
Date:   Wed, 25 Sep 2019 11:13:22 -0400
From:   "J . Bruce Fields" <bfields@fieldses.org>
To:     Colin King <colin.king@canonical.com>
Cc:     Chuck Lever <chuck.lever@oracle.com>,
        Trond Myklebust <trond.myklebust@hammerspace.com>,
        Anna Schumaker <anna.schumaker@netapp.com>,
        "David S . Miller" <davem@davemloft.net>,
        linux-nfs@vger.kernel.org, netdev@vger.kernel.org,
        kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] sunrpc: clean up indentation issue
Message-ID: <20190925151322.GA8581@fieldses.org>
References: <20190925130930.13076-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190925130930.13076-1-colin.king@canonical.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Applied, thanks.--b.

On Wed, Sep 25, 2019 at 02:09:30PM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> There are statements that are indented incorrectly, remove the
> extraneous spacing.
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  net/sunrpc/svc.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/net/sunrpc/svc.c b/net/sunrpc/svc.c
> index 220b79988000..d11b70552c33 100644
> --- a/net/sunrpc/svc.c
> +++ b/net/sunrpc/svc.c
> @@ -1233,8 +1233,8 @@ svc_generic_init_request(struct svc_rqst *rqstp,
>  
>  	if (rqstp->rq_vers >= progp->pg_nvers )
>  		goto err_bad_vers;
> -	  versp = progp->pg_vers[rqstp->rq_vers];
> -	  if (!versp)
> +	versp = progp->pg_vers[rqstp->rq_vers];
> +	if (!versp)
>  		goto err_bad_vers;
>  
>  	/*
> -- 
> 2.20.1
