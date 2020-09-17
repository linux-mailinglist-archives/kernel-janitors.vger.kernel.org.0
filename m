Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4DD0D26D9B8
	for <lists+kernel-janitors@lfdr.de>; Thu, 17 Sep 2020 12:57:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726559AbgIQK47 (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Thu, 17 Sep 2020 06:56:59 -0400
Received: from mga03.intel.com ([134.134.136.65]:61473 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726285AbgIQK45 (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 17 Sep 2020 06:56:57 -0400
X-Greylist: delayed 435 seconds by postgrey-1.27 at vger.kernel.org; Thu, 17 Sep 2020 06:56:57 EDT
IronPort-SDR: cANJCM03YfLGfdYVRRgZUJdgpfjRqP58e2AoETm/QdF7G3VDNyGtxh84cktW4itigFH+ncJ0+J
 THL/HKsRw9Mw==
X-IronPort-AV: E=McAfee;i="6000,8403,9746"; a="159725150"
X-IronPort-AV: E=Sophos;i="5.76,436,1592895600"; 
   d="scan'208";a="159725150"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2020 03:49:39 -0700
IronPort-SDR: cQkJHJmiMdNqqGqmsHhuUzDnip2jjo6a1dsj7uQDH8WzYH8o2AMmMX49QP+IvwWB8k5o3wB3SU
 yT2cGXg6XorQ==
X-IronPort-AV: E=Sophos;i="5.76,436,1592895600"; 
   d="scan'208";a="483698085"
Received: from jroorda-mobl1.ger.corp.intel.com (HELO [10.252.40.25]) ([10.252.40.25])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2020 03:49:36 -0700
Subject: Re: [PATCH v2] drm/i915: Fix an error code i915_gem_object_copy_blt()
To:     Dan Carpenter <dan.carpenter@oracle.com>,
        Jani Nikula <jani.nikula@linux.intel.com>
Cc:     Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Chris Wilson <chris@chris-wilson.co.uk>,
        Mika Kuoppala <mika.kuoppala@linux.intel.com>,
        Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
        Matthew Auld <matthew.auld@intel.com>,
        Matt Roper <matthew.d.roper@intel.com>,
        intel-gfx@lists.freedesktop.org, kernel-janitors@vger.kernel.org
References: <20200911075243.GG12635@kadam>
From:   Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Message-ID: <7c10479e-31ad-5392-b2d6-0264cc845c3d@linux.intel.com>
Date:   Thu, 17 Sep 2020 12:49:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200911075243.GG12635@kadam>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Op 11-09-2020 om 09:52 schreef Dan Carpenter:
> This code should use "vma[1]" instead of "vma".  The "vma" variable is a
> valid pointer.
>
> Fixes: 6b05030496f7 ("drm/i915: Convert i915_gem_object/client_blt.c to use ww locking as well, v2.")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> Reviewed-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
> ---
> v2: Fix confusing typo in the commit message
>
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

Thanks, applied to drm-intel-gt-next. :)

