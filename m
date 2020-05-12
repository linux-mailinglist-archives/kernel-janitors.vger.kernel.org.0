Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 823E71CFDE5
	for <lists+kernel-janitors@lfdr.de>; Tue, 12 May 2020 20:58:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728081AbgELS60 (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Tue, 12 May 2020 14:58:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51812 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725554AbgELS60 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 12 May 2020 14:58:26 -0400
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0745CC061A0C
        for <kernel-janitors@vger.kernel.org>; Tue, 12 May 2020 11:58:25 -0700 (PDT)
Received: by mail-pl1-x644.google.com with SMTP id g11so2539709plp.1
        for <kernel-janitors@vger.kernel.org>; Tue, 12 May 2020 11:58:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=tqJqrkQlOeeaa2aC/rVtq+THzafBAmOFZekSr7YovNs=;
        b=eLyBmK4uD/tLsZFaAduNimk2uSZAxJNelury6EMqIFUQrr2AMLinYxuRkH80L3/JGR
         aPPa5Q9Jbr6bEBVbQSb/il5yV0dKhB0WRlFXSFwPWc4kr7vi268YZRqn5XzW09HVGaGd
         zo2MKLH7p2S7BgWltW5tjh71VDFCco2cfZUtQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=tqJqrkQlOeeaa2aC/rVtq+THzafBAmOFZekSr7YovNs=;
        b=mkDsKqDxpwUmtB9S/mwzX3ZILmVxMGzFhzaG6EKRA7NV3fbZcxk2liIMQvF7CvwBjm
         IWiGSCW6jiZl38pLyrGenixjnpO/MEp9QgeVzuec/dFk2WEJnbaVyymCw+Jv1a9hGLJD
         8zgW+B+4iADlaZV3WVyBvsWrDTIt5avfMhadSOhD3FfhtCm+X+zQb9PC+kze4o/n4Kyy
         i1p1pXywceSO8Ny0dZqoPSo35ynEVuGtSoWHOhc731HXyOW8zFO+15VighCKbHLmORpK
         xufzMNqrzBeoqEZvELXICOA6KZm4Pe2l4TNRZoAIFVzeuy0KRNS2zZWwLhKdoXiNMGrX
         rQgQ==
X-Gm-Message-State: AGi0PuaY7rl6Meg7xNLLiANnGt1CWhr5iTNoiLZtiZUgcM5kgPndOAtW
        Ot8I3MIw6HB18+K4pf/IJgA8JQ==
X-Google-Smtp-Source: APiQypJBsVPRcjsL5leeuDbu+zRxGc76UfPGelH8aCgq0TZhTTiI4rvumMkjBky9sZVHEILQV+LE/w==
X-Received: by 2002:a17:90a:290f:: with SMTP id g15mr29587956pjd.93.1589309905462;
        Tue, 12 May 2020 11:58:25 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id s199sm12809112pfs.124.2020.05.12.11.58.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2020 11:58:24 -0700 (PDT)
Date:   Tue, 12 May 2020 11:58:23 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Colin King <colin.king@canonical.com>
Cc:     Anton Vorontsov <anton@enomsg.org>,
        Colin Cross <ccross@android.com>,
        Tony Luck <tony.luck@intel.com>,
        WeiXiong Liao <liaoweixiong@allwinnertech.com>,
        kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH][next] pstore/zone,blk: fix dereference of pointer before
 it has been null checked
Message-ID: <202005121158.4D49A98839@keescook>
References: <20200512170719.221514-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200512170719.221514-1-colin.king@canonical.com>
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Tue, May 12, 2020 at 06:07:19PM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Currently the assignment of ctx dereferences pointer 'record' before
> the pointer has been null checked. Fix this by only making this
> dereference after it has been null checked close to the point ctx
> is to be used.
> 
> Addresses-Coverity: ("Dereference before null check")
> Fixes: bb4ccd1e6f56 ("pstore/zone,blk: Add ftrace frontend support")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Thanks; applied.

-Kees

> ---
>  fs/pstore/zone.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/fs/pstore/zone.c b/fs/pstore/zone.c
> index bd8e194110fc..c5bf3b9f644f 100644
> --- a/fs/pstore/zone.c
> +++ b/fs/pstore/zone.c
> @@ -998,7 +998,7 @@ static ssize_t psz_kmsg_read(struct pstore_zone *zone,
>  static ssize_t psz_ftrace_read(struct pstore_zone *zone,
>  		struct pstore_record *record)
>  {
> -	struct psz_context *cxt = record->psi->data;
> +	struct psz_context *cxt;
>  	struct psz_buffer *buf;
>  	int ret;
>  
> @@ -1018,6 +1018,7 @@ static ssize_t psz_ftrace_read(struct pstore_zone *zone,
>  		return ret;
>  
>  out:
> +	cxt = record->psi->data;
>  	if (cxt->ftrace_read_cnt < cxt->ftrace_max_cnt)
>  		/* then, read next ftrace zone */
>  		return -ENOMSG;
> -- 
> 2.25.1
> 

-- 
Kees Cook
