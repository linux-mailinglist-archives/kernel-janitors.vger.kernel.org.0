Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AF0781E33AC
	for <lists+kernel-janitors@lfdr.de>; Wed, 27 May 2020 01:27:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725825AbgEZX1d (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Tue, 26 May 2020 19:27:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46158 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725265AbgEZX1b (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 26 May 2020 19:27:31 -0400
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 730B9C061A0F
        for <kernel-janitors@vger.kernel.org>; Tue, 26 May 2020 16:27:31 -0700 (PDT)
Received: by mail-pl1-x630.google.com with SMTP id x11so8360484plv.9
        for <kernel-janitors@vger.kernel.org>; Tue, 26 May 2020 16:27:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=BDU5QxHKfnniQjXMdNd8leB2OBRpea7hzh8IAFTe8mU=;
        b=JauNAD2t8UpfMd0AfJM6AP+1DoGowd7xydgMPaSmjV+fLvAy9vodadIFD7PfYMESGS
         43shPgE6gcLYWiC+Yqur4CdnHGtq9zSnYu6Uc5C9S1C0+feG2ccRpr7QXTaprCPMF/ku
         wqXWHDvfsGYQ/8qD/83YfNFBXkRosntbpscIyJg6upEH0L3wk/kbN3H/orwZeRHXr7eQ
         sLaB/gZUuhH1qd14FW9p8u2MjP3d8f++qtdHhK5lecoNGcHCtL3u+mFN4U4mh4c1t+JN
         H8jFLSnK8QGB3kE6GeerKBoSP4cHbf/0wlbrPqkRmt7E9gb/Ejrr3uUN11gLzQqcLPUd
         lrmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=BDU5QxHKfnniQjXMdNd8leB2OBRpea7hzh8IAFTe8mU=;
        b=owPgp8ViIiejWyTbT0S0ScrTwlPa3TXhItGNYtiOS8E4F1+c+H+XJdLM6bQN5jneym
         YvpD6gfO/VeKf9lVS67YZFtdSeEVg4BF+Uz1SQwiulV2XSJbqighOwukksqV4mu/zLO9
         rcmsqKZfZrQ7LKk8O8bqLockacRP8+HpX62YfmUe62rQM0HAUsxeFx7nkUwsidwBYUnN
         h/vuTxEAiIUIZHe9+sLdBm+s8lmxhRtRZGsqfDxF7J1K6xXQCdWEd+jfupUF+eqANLvi
         EhEpa0moExwf+xVwMEHr/ISVzGot8qjYzv6DdXHIv+SU6MLpP/k2erM7g4wB3pIuEEw7
         L7fw==
X-Gm-Message-State: AOAM533/ZdojRKSud2h6PVzM2L9cTg/4xJtt+umWwjCgUywV2lvtIfJU
        DQzgAE1q40E3e1gmIs/cj8G3EbgxYgs=
X-Google-Smtp-Source: ABdhPJzh/Y4lO8y3LbQ4vMbMOwF9wg80Ql+Tf/HfqKoSCDQt7lQYN6Fx9BcM4qcFibWghFVP7jsykg==
X-Received: by 2002:a17:90a:2e08:: with SMTP id q8mr1736397pjd.153.1590535650405;
        Tue, 26 May 2020 16:27:30 -0700 (PDT)
Received: from google.com (240.242.82.34.bc.googleusercontent.com. [34.82.242.240])
        by smtp.gmail.com with ESMTPSA id h7sm586267pgg.17.2020.05.26.16.27.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2020 16:27:29 -0700 (PDT)
Date:   Tue, 26 May 2020 23:27:25 +0000
From:   Satya Tangirala <satyat@google.com>
To:     Colin King <colin.king@canonical.com>
Cc:     Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org,
        kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH][next] block: blk-crypto-fallback: remove redundant
 initialization of variable err'
Message-ID: <20200526232725.GA41114@google.com>
References: <20200526224902.63975-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200526224902.63975-1-colin.king@canonical.com>
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Tue, May 26, 2020 at 11:49:02PM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The variable err is being initialized with a value that is never read
> and it is being updated later with a new value.  The initialization is
> redundant and can be removed.
> 
> Addresses-Coverity: ("Unused value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  block/blk-crypto-fallback.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/block/blk-crypto-fallback.c b/block/blk-crypto-fallback.c
> index 74ab137ae3ba..6e49688a2d80 100644
> --- a/block/blk-crypto-fallback.c
> +++ b/block/blk-crypto-fallback.c
> @@ -529,7 +529,7 @@ static bool blk_crypto_fallback_inited;
>  static int blk_crypto_fallback_init(void)
>  {
>  	int i;
> -	int err = -ENOMEM;
> +	int err;
>  
>  	if (blk_crypto_fallback_inited)
>  		return 0;
> -- 
Looks good to me - you can add:

Reviewed-by: Satya Tangirala <satyat@google.com>

Thanks!
> 2.25.1
> 
