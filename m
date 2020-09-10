Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A3CBC26506D
	for <lists+kernel-janitors@lfdr.de>; Thu, 10 Sep 2020 22:17:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726984AbgIJURv (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Thu, 10 Sep 2020 16:17:51 -0400
Received: from mga06.intel.com ([134.134.136.31]:12178 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726810AbgIJUPa (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 10 Sep 2020 16:15:30 -0400
IronPort-SDR: P7zrXywnL1pFi4dL+b4AmdiFQ7yaAwcJLDFGd/h58MQ0rQONI0Wl77egwqNbQ7oJ+glZFyPozS
 1yZ41xp6SX1Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9740"; a="220185487"
X-IronPort-AV: E=Sophos;i="5.76,413,1592895600"; 
   d="scan'208";a="220185487"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2020 13:15:29 -0700
IronPort-SDR: iU6WmuOj95tuXMN26AGlY7HXvpF8obhUT7eQhJ3dBd8gVzrQmms8A+R9ll83FSqYnZAG3XY3rg
 yfVLm9vNee/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,413,1592895600"; 
   d="scan'208";a="342053032"
Received: from gaia.fi.intel.com ([10.237.72.192])
  by FMSMGA003.fm.intel.com with ESMTP; 10 Sep 2020 13:15:25 -0700
Received: by gaia.fi.intel.com (Postfix, from userid 1000)
        id 6677A5C2042; Thu, 10 Sep 2020 23:14:19 +0300 (EEST)
From:   Mika Kuoppala <mika.kuoppala@linux.intel.com>
To:     Dan Carpenter <dan.carpenter@oracle.com>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc:     Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Chris Wilson <chris@chris-wilson.co.uk>,
        Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
        Matthew Auld <matthew.auld@intel.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Matt Roper <matthew.d.roper@intel.com>,
        intel-gfx@lists.freedesktop.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] drm/i915: Fix an error code i915_gem_object_copy_blt()
In-Reply-To: <20200910100850.GD79916@mwanda>
References: <20200910100850.GD79916@mwanda>
Date:   Thu, 10 Sep 2020 23:14:19 +0300
Message-ID: <87363p4cf8.fsf@gaia.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Dan Carpenter <dan.carpenter@oracle.com> writes:

> This code should use "vma[1]" instead of "vma".  The "vma" is a variable
> is a valid pointer.

Not quite getting the last sentence with my non native english parser.
"vma" is array would make sense.

>
> Fixes: 6b05030496f7 ("drm/i915: Convert i915_gem_object/client_blt.c to use ww locking as well, v2.")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Reviewed-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>

> ---
>  drivers/gpu/drm/i915/gem/i915_gem_object_blt.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object_blt.c b/drivers/gpu/drm/i915/gem/i915_gem_object_blt.c
> index d93eb36160c9..aee7ad3cc3c6 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_object_blt.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_object_blt.c
> @@ -364,7 +364,7 @@ int i915_gem_object_copy_blt(struct drm_i915_gem_object *src,
>  
>  	vma[1] = i915_vma_instance(dst, vm, NULL);
>  	if (IS_ERR(vma[1]))
> -		return PTR_ERR(vma);
> +		return PTR_ERR(vma[1]);
>  
>  	i915_gem_ww_ctx_init(&ww, true);
>  	intel_engine_pm_get(ce->engine);
> -- 
> 2.28.0
