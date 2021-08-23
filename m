Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 52F513F5106
	for <lists+kernel-janitors@lfdr.de>; Mon, 23 Aug 2021 21:08:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231516AbhHWTJZ (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Mon, 23 Aug 2021 15:09:25 -0400
Received: from mail.kernel.org ([198.145.29.99]:46594 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230192AbhHWTJY (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 23 Aug 2021 15:09:24 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id F3728613CF;
        Mon, 23 Aug 2021 19:08:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1629745721;
        bh=PLG7FBxLuX3/LDs1ORyJPnau1dlijqlSmrYO3kxYDQY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=UZBMhhNaNnCs4NE6zyqjsZZQxflcfOT+aeFIwthe59yd++NKXgNiiDUNewOphuTcl
         FRpHqiSUWD3fCHobPQPxMuCt8YX5UyPw1HkOInJbUZ7jQwoWOMB1eEKdzo3LR3PqPU
         6Zi6xRwAO3tMbQAMGtJFo+wnAisYpNOtZbMkBcZNFCRD1eEpLwxGq71kYRvwRd/jAp
         POWEVkB21/X2AqkjLwAdpJPNZ/6bJh9lrE6kowljzhbZfkN0GuSxv6VV3FY51zV7uc
         6e6nGlj10YjA06DZ8O4S360qjcLgVoReT8FKoUGwz9SSiTk1CgjHF2A6zVKZUGhXCi
         pslslOiTjA18A==
Date:   Mon, 23 Aug 2021 12:08:37 -0700
From:   Nathan Chancellor <nathan@kernel.org>
To:     Jani Nikula <jani.nikula@linux.intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc:     John Harrison <John.C.Harrison@intel.com>,
        Matthew Brost <matthew.brost@intel.com>,
        intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, clang-built-linux@googlegroups.com,
        kernel-janitors@vger.kernel.org,
        Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [Intel-gfx] [PATCH] drm/i915/selftest: Fix use of err in
 igt_reset_{fail, nop}_engine()
Message-ID: <YSPyNZ3I1LgvDYSw@Ryzen-9-3900X.localdomain>
References: <20210813171158.2665823-1-nathan@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210813171158.2665823-1-nathan@kernel.org>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Ping? This is a pretty clear bug and it is not fixed in -next or
drm-intel at this point.

On Fri, Aug 13, 2021 at 10:11:58AM -0700, Nathan Chancellor wrote:
> Clang warns:
> 
> In file included from drivers/gpu/drm/i915/gt/intel_reset.c:1514:
> drivers/gpu/drm/i915/gt/selftest_hangcheck.c:465:62: warning: variable
> 'err' is uninitialized when used here [-Wuninitialized]
>         pr_err("[%s] Create context failed: %d!\n", engine->name, err);
>                                                                   ^~~
> ...
> drivers/gpu/drm/i915/gt/selftest_hangcheck.c:580:62: warning: variable
> 'err' is uninitialized when used here [-Wuninitialized]
>         pr_err("[%s] Create context failed: %d!\n", engine->name, err);
>                                                                   ^~~
> ...
> 2 warnings generated.
> 
> This appears to be a copy and paste issue. Use ce directly using the %pe
> specifier to pretty print the error code so that err is not used
> uninitialized in these functions.
> 
> Fixes: 3a7b72665ea5 ("drm/i915/selftest: Bump selftest timeouts for hangcheck")
> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> ---
>  drivers/gpu/drm/i915/gt/selftest_hangcheck.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/selftest_hangcheck.c b/drivers/gpu/drm/i915/gt/selftest_hangcheck.c
> index 08f011f893b2..2c1ed32ca5ac 100644
> --- a/drivers/gpu/drm/i915/gt/selftest_hangcheck.c
> +++ b/drivers/gpu/drm/i915/gt/selftest_hangcheck.c
> @@ -462,7 +462,7 @@ static int igt_reset_nop_engine(void *arg)
>  
>  		ce = intel_context_create(engine);
>  		if (IS_ERR(ce)) {
> -			pr_err("[%s] Create context failed: %d!\n", engine->name, err);
> +			pr_err("[%s] Create context failed: %pe!\n", engine->name, ce);
>  			return PTR_ERR(ce);
>  		}
>  
> @@ -577,7 +577,7 @@ static int igt_reset_fail_engine(void *arg)
>  
>  		ce = intel_context_create(engine);
>  		if (IS_ERR(ce)) {
> -			pr_err("[%s] Create context failed: %d!\n", engine->name, err);
> +			pr_err("[%s] Create context failed: %pe!\n", engine->name, ce);
>  			return PTR_ERR(ce);
>  		}
>  
> 
> base-commit: 927dfdd09d8c03ba100ed0c8c3915f8e1d1f5556
> -- 
> 2.33.0.rc2
