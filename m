Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 46DEA1743B
	for <lists+kernel-janitors@lfdr.de>; Wed,  8 May 2019 10:49:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727128AbfEHIso (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Wed, 8 May 2019 04:48:44 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:52634 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726387AbfEHIsm (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 8 May 2019 04:48:42 -0400
Received: by mail-wm1-f67.google.com with SMTP id o25so2167169wmf.2
        for <kernel-janitors@vger.kernel.org>; Wed, 08 May 2019 01:48:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=pA4oZ7mGlzJnhNFULh/+qwzD5DlNWy+0yxQhURm3SoM=;
        b=fR+KBI9BQi0aN7Z9LOL4SDuWNDpgoqcdWrAwDWTc00t+R/d42BzfQfa0VQ1xVGByt7
         r+Z8lTtSJUlo7AHe5z+rn30iVMXiKBwP609Y61g+NyHMJvEska5fV5DbCA8a3T7OXD/N
         u6azZipWyuP0dFnZTuqhz/AcZDiXw7mvKAjn6yv4jK6sSN5LS/gBKIF4TqBjAPuhGWtS
         TnMf7nNAtnaWKmy4R8zO5fbnwja89AjFxDtDaRLF6Wr1RpQMfl51KHHL8d7ZWxsx5u9L
         F2pM6Ek6ulTxTfdZFbHZRaLURGY+b2J+2LuqYzSyrSHgjKbYP1mQI/ogOH6TyGmTfdsN
         LH+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=pA4oZ7mGlzJnhNFULh/+qwzD5DlNWy+0yxQhURm3SoM=;
        b=BDPTrNzvAku1GItRZCBD+pItugkZ3WHYnIkiogOK9L6NJ8LnCqNrMsm/tfBQ+Xd4Ht
         JBQP+SXLwmbQtDycXsG1Jnrtksp3lCqq+7UlJZV11yjBtu+EAgquUmEruRnE6NndNb4Z
         QDmvV5tr7OEnYASW3opOrnqwjRXwA3VFdEd1qU85iElcN8mHpMXvt/qfsWQKVZYgDRhZ
         pWJx6SGGhbxtwyT1RDKgPkM4ZwEH62OrMyvB7WZ74BIYrsgon8lY2cqAn63M92P2/YDb
         l+Lj1h/wwHYG7HGLDv3Gj/3Q4qcCRgQIuRvJaL+fCXkHg89AlpFQtDg1F9M3nK4fDLPS
         mq0w==
X-Gm-Message-State: APjAAAWcwcAzdVlEy3CMshKW57Hg5vN6y3FNa+j4jdqwwe08Lj06/Prp
        vuQEnzrsJkLCDUiZwfphAUr00g==
X-Google-Smtp-Source: APXvYqwPf1J9m8LDiRXqWVFpptl/XV9DXySpKB/Kv+9l1UywcROKBlFQHCh3ZjHr8Ii4O6DbKui6uA==
X-Received: by 2002:a1c:cb48:: with SMTP id b69mr2196684wmg.109.1557305321231;
        Wed, 08 May 2019 01:48:41 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net. [86.9.19.6])
        by smtp.gmail.com with ESMTPSA id s3sm32448144wre.97.2019.05.08.01.48.40
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 08 May 2019 01:48:40 -0700 (PDT)
Date:   Wed, 8 May 2019 09:48:38 +0100
From:   Daniel Thompson <daniel.thompson@linaro.org>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Jason Wessel <jason.wessel@windriver.com>,
        Douglas Anderson <dianders@chromium.org>,
        Christophe Leroy <christophe.leroy@c-s.fr>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Kees Cook <keescook@chromium.org>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        Nicholas Mc Guire <hofrat@osadl.org>,
        Johannes Weiner <hannes@cmpxchg.org>,
        kgdb-bugreport@lists.sourceforge.net,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] kdb: do a sanity check on the cpu in kdb_per_cpu()
Message-ID: <20190508084838.w7t3nwamobpmwgkv@holly.lan>
References: <20190506125018.GA13799@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190506125018.GA13799@mwanda>
User-Agent: NeoMutt/20180716
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Mon, May 06, 2019 at 03:50:18PM +0300, Dan Carpenter wrote:
> The "whichcpu" comes from argv[3].  The cpu_online() macro looks up the
> cpu in a bitmap of online cpus, but if the value is too high then it
> could read beyond the end of the bitmap and possibly Oops.
> 
> Fixes: 5d5314d6795f ("kdb: core for kgdb back end (1 of 2)")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Just out of interest... why isn't this copied to LKML? Omiting LKML makes
the patch hard to find in a patchwork instance.


Daniel.

> ---
>  kernel/debug/kdb/kdb_main.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/kernel/debug/kdb/kdb_main.c b/kernel/debug/kdb/kdb_main.c
> index fc96dbf8d9de..9ecfa37c7fbf 100644
> --- a/kernel/debug/kdb/kdb_main.c
> +++ b/kernel/debug/kdb/kdb_main.c
> @@ -2583,7 +2583,7 @@ static int kdb_per_cpu(int argc, const char **argv)
>  		diag = kdbgetularg(argv[3], &whichcpu);
>  		if (diag)
>  			return diag;
> -		if (!cpu_online(whichcpu)) {
> +		if (whichcpu >= nr_cpu_ids || !cpu_online(whichcpu)) {
>  			kdb_printf("cpu %ld is not online\n", whichcpu);
>  			return KDB_BADCPUNUM;
>  		}
> -- 
> 2.18.0
> 
