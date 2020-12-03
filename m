Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 13F592CD45D
	for <lists+kernel-janitors@lfdr.de>; Thu,  3 Dec 2020 12:13:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730162AbgLCLNM (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Thu, 3 Dec 2020 06:13:12 -0500
Received: from mga12.intel.com ([192.55.52.136]:34550 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728548AbgLCLNM (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 3 Dec 2020 06:13:12 -0500
IronPort-SDR: IjYvIlkS3jmgsOerwr7jji3bOji3OHf6ElGCLtTmodtiRspDIHLP+4opD1ZKVoyAUmd8CHj9ly
 RWtbYETCp31g==
X-IronPort-AV: E=McAfee;i="6000,8403,9823"; a="152427912"
X-IronPort-AV: E=Sophos;i="5.78,389,1599548400"; 
   d="scan'208";a="152427912"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2020 03:12:31 -0800
IronPort-SDR: gfY19NmtkxHDKSG4JVnhmnvQWWEwwwE4BKcTynSEGMQ4YCIeMCgbsqio2Oc+fj5qz7BRs9OkxQ
 sjKua80N/W6Q==
X-IronPort-AV: E=Sophos;i="5.78,389,1599548400"; 
   d="scan'208";a="550445583"
Received: from pjfraser-mobl.ger.corp.intel.com (HELO intel.com) ([10.252.11.14])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2020 03:12:27 -0800
Date:   Thu, 3 Dec 2020 13:12:24 +0200
From:   Andi Shyti <andi.shyti@intel.com>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Jani Nikula <jani.nikula@linux.intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Chris Wilson <chris@chris-wilson.co.uk>,
        Mika Kuoppala <mika.kuoppala@linux.intel.com>,
        Thomas =?iso-8859-15?Q?Hellstr=F6m?= <thomas.hellstrom@intel.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] drm/i915: Check the correct variable
Message-ID: <X8jH5D//XHDsXKtQ@intel.intel>
References: <X8ilneOcJAjwqU4t@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <X8ilneOcJAjwqU4t@mwanda>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hi Dan,

> There is a copy and paste bug in this code.  It's supposed to check
> "obj2" instead of checking "obj" a second time.
> 
> Fixes: 80f0b679d6f0 ("drm/i915: Add an implementation for i915_gem_ww_ctx locking, v2.")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  drivers/gpu/drm/i915/selftests/i915_gem.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/selftests/i915_gem.c b/drivers/gpu/drm/i915/selftests/i915_gem.c
> index 23a6132c5f4e..412e21604a05 100644
> --- a/drivers/gpu/drm/i915/selftests/i915_gem.c
> +++ b/drivers/gpu/drm/i915/selftests/i915_gem.c
> @@ -211,8 +211,8 @@ static int igt_gem_ww_ctx(void *arg)
>  		return PTR_ERR(obj);
>  
>  	obj2 = i915_gem_object_create_internal(i915, PAGE_SIZE);
> -	if (IS_ERR(obj)) {
> -		err = PTR_ERR(obj);
> +	if (IS_ERR(obj2)) {
> +		err = PTR_ERR(obj2);

Reviewed-by: Andi Shyti <andi.shyti@intel.com>

Thanks,
Andi
