Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 120B4453C5
	for <lists+kernel-janitors@lfdr.de>; Fri, 14 Jun 2019 07:03:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725775AbfFNFDs (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Fri, 14 Jun 2019 01:03:48 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:45298 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725767AbfFNFDs (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 14 Jun 2019 01:03:48 -0400
Received: by mail-pl1-f193.google.com with SMTP id bi6so474757plb.12
        for <kernel-janitors@vger.kernel.org>; Thu, 13 Jun 2019 22:03:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=vzWNfLLLAeGdx7iHT9n2mvQxcG6bp4wZCUilrxRaOBg=;
        b=bJWdlpRRGB15JzNuxSkj/0RPEWaKqcPRrFrQ3ai2ojLMIPqYEmt/4pm+l2yin+tUio
         jBug4MBdWstbYkD7RGKZf4N2VB4qY9sUdsxTHweadmHZD1aL/kiWCXzcnum364N04VKt
         FAIw+kKyYpxZALIoSQEwLjdUTDEzlcJs84i0A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=vzWNfLLLAeGdx7iHT9n2mvQxcG6bp4wZCUilrxRaOBg=;
        b=svBqtOEonrrQ8ZWNjj7VFN++evtb7Lfr5fcGhORcXMLeF3Z3YvzXcxC1HM1lc1UIMV
         gcoupX4Hopdn/ofnmtmlW9PwbYGgDSZPqV47aG/yVDXYHWpIoFbgYkRmMtudIGUI84bZ
         K7aq0y4qNeVpEBkurd4+PhR0QVzkIPoigwcJlj7asOdqK51Qdgmpb5LnlmAzNSHWmzp1
         +mhCfTzSzK5MyockFSf+XRJdR5FyTwwkZpW9zul3J0pi+XDU8lamrPGyv6ul2DG6B8Pd
         alDNu+x6ZqORK5tD1MxaWEe1IVQS6ufpKR6JZMGyYBthKpF5MBHo8h0R/JG9qeHrYCsJ
         CEvQ==
X-Gm-Message-State: APjAAAVZv//gV3uLxnFlt14vAIqeBNldfzJ90NtwgSij3YscVaRAR4n1
        +ct+MOJi5vorGchb9GMvuPZ7Xij3GxDOVA==
X-Google-Smtp-Source: APXvYqxfIpUPwU4twV+O8Jh78bNwx/c5+KBI1WBnJePmnmvrugbVR3lAaJt7s9ANLBo10/AmsAypzw==
X-Received: by 2002:a17:902:a60d:: with SMTP id u13mr22780924plq.144.1560488627524;
        Thu, 13 Jun 2019 22:03:47 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id d123sm1521005pfc.144.2019.06.13.22.03.46
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 13 Jun 2019 22:03:46 -0700 (PDT)
Date:   Thu, 13 Jun 2019 22:03:45 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Dan Carpenter <dan.carpenter@oracle.com>,
        Andrew Morton <akpm@linux-foundation.org>
Cc:     Christoph Lameter <cl@linux.com>,
        Pekka Enberg <penberg@kernel.org>,
        David Rientjes <rientjes@google.com>,
        Joonsoo Kim <iamjoonsoo.kim@lge.com>, linux-mm@kvack.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] mm/slab: restore IRQs in kfree()
Message-ID: <201906132202.9BF49E6B@keescook>
References: <20190613065637.GE16334@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190613065637.GE16334@mwanda>
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Thu, Jun 13, 2019 at 09:56:37AM +0300, Dan Carpenter wrote:
> We added a new return here but we need to restore the IRQs before
> we leave.
> 
> Fixes: 4f5d94fd4ed5 ("mm/slab: sanity-check page type when looking up cache")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Oh yes! Thank you for that catch! Andrew, if you haven't already, can
you pick this up?

Thanks!

-Kees

> ---
>  mm/slab.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/mm/slab.c b/mm/slab.c
> index 9e3eee5568b6..db01e9aae31b 100644
> --- a/mm/slab.c
> +++ b/mm/slab.c
> @@ -3745,8 +3745,10 @@ void kfree(const void *objp)
>  	local_irq_save(flags);
>  	kfree_debugcheck(objp);
>  	c = virt_to_cache(objp);
> -	if (!c)
> +	if (!c) {
> +		local_irq_restore(flags);
>  		return;
> +	}
>  	debug_check_no_locks_freed(objp, c->object_size);
>  
>  	debug_check_no_obj_freed(objp, c->object_size);
> -- 
> 2.20.1
> 

-- 
Kees Cook
