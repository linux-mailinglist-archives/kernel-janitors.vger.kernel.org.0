Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D61D011D3CA
	for <lists+kernel-janitors@lfdr.de>; Thu, 12 Dec 2019 18:27:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730096AbfLLR1I (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Thu, 12 Dec 2019 12:27:08 -0500
Received: from mga02.intel.com ([134.134.136.20]:8516 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730023AbfLLR1I (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 12 Dec 2019 12:27:08 -0500
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 12 Dec 2019 09:27:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,306,1571727600"; 
   d="scan'208";a="204035372"
Received: from mdroper-desk1.fm.intel.com (HELO mdroper-desk1.amr.corp.intel.com) ([10.1.27.64])
  by orsmga007.jf.intel.com with ESMTP; 12 Dec 2019 09:27:07 -0800
Date:   Thu, 12 Dec 2019 09:27:07 -0800
From:   Matt Roper <matthew.d.roper@intel.com>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Jani Nikula <jani.nikula@intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Ville =?iso-8859-1?Q?Syrj=E4l=E4?= 
        <ville.syrjala@linux.intel.com>,
        Lucas De Marchi <lucas.demarchi@intel.com>,
        =?iso-8859-1?Q?Jos=E9?= Roberto de Souza 
        <jose.souza@intel.com>, Imre Deak <imre.deak@intel.com>,
        intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] drm/i915/bios: fix off by one in parse_generic_dtd()
Message-ID: <20191212172707.GF85422@mdroper-desk1.amr.corp.intel.com>
References: <20191212091130.zf2g53njf5u24wk6@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191212091130.zf2g53njf5u24wk6@kili.mountain>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Thu, Dec 12, 2019 at 12:11:30PM +0300, Dan Carpenter wrote:
> The "num_dtd" variable is the number of elements in the
> generic_dtd->dtd[] array so the > needs to be >= to prevent reading one
> element beyond the end of the array.
> 
> Fixes: 33ef6d4fd8df ("drm/i915/vbt: Handle generic DTD block")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/i915/display/intel_bios.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_bios.c b/drivers/gpu/drm/i915/display/intel_bios.c
> index 1aeecdd02293..d1e27ee86e53 100644
> --- a/drivers/gpu/drm/i915/display/intel_bios.c
> +++ b/drivers/gpu/drm/i915/display/intel_bios.c
> @@ -338,7 +338,7 @@ parse_generic_dtd(struct drm_i915_private *dev_priv,
>  
>  	num_dtd = (get_blocksize(generic_dtd) -
>  		   sizeof(struct bdb_generic_dtd)) / generic_dtd->gdtd_size;
> -	if (dev_priv->vbt.panel_type > num_dtd) {
> +	if (dev_priv->vbt.panel_type >= num_dtd) {
>  		DRM_ERROR("Panel type %d not found in table of %d DTD's\n",
>  			  dev_priv->vbt.panel_type, num_dtd);
>  		return;
> -- 
> 2.11.0
> 

-- 
Matt Roper
Graphics Software Engineer
VTT-OSGC Platform Enablement
Intel Corporation
(916) 356-2795
