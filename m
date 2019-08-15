Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 546958E7CC
	for <lists+kernel-janitors@lfdr.de>; Thu, 15 Aug 2019 11:09:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730982AbfHOJI6 (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Thu, 15 Aug 2019 05:08:58 -0400
Received: from mga17.intel.com ([192.55.52.151]:17214 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730212AbfHOJI6 (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 15 Aug 2019 05:08:58 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 15 Aug 2019 02:08:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,388,1559545200"; 
   d="scan'208";a="194728760"
Received: from jnikula-mobl3.fi.intel.com (HELO localhost) ([10.237.66.150])
  by fmsmga001.fm.intel.com with ESMTP; 15 Aug 2019 02:08:54 -0700
From:   Jani Nikula <jani.nikula@linux.intel.com>
To:     Dan Carpenter <dan.carpenter@oracle.com>,
        =?utf-8?Q?Jos=C3=A9?= Roberto de Souza <jose.souza@intel.com>
Cc:     Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] drm/i915/tgl: Fix TGL_TRANS_DDI_FUNC_CTL_VAL_TO_PORT() macro
In-Reply-To: <20190815083336.GE27238@mwanda>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20190815083336.GE27238@mwanda>
Date:   Thu, 15 Aug 2019 12:08:53 +0300
Message-ID: <87lfvug5i2.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Thu, 15 Aug 2019, Dan Carpenter <dan.carpenter@oracle.com> wrote:
> This macro doesn't work because the right shift has higher precedence
> than bitwise AND.
>
> Fixes: 9749a5b6c09f ("drm/i915/tgl: Fix the read of the DDI that transcoder is attached to")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Thanks, already fixed by 1cdd8705c7ac ("drm/i915/tgl: Fix missing
parentheses on TGL_TRANS_DDI_FUNC_CTL_VAL_TO_PORT").

BR,
Jani.

> ---
>  drivers/gpu/drm/i915/i915_reg.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
> index 4a947bd0a294..def6dbdc7e2e 100644
> --- a/drivers/gpu/drm/i915/i915_reg.h
> +++ b/drivers/gpu/drm/i915/i915_reg.h
> @@ -9433,7 +9433,7 @@ enum skl_power_gate {
>  #define  TRANS_DDI_SELECT_PORT(x)	((x) << TRANS_DDI_PORT_SHIFT)
>  #define  TGL_TRANS_DDI_SELECT_PORT(x)	(((x) + 1) << TGL_TRANS_DDI_PORT_SHIFT)
>  #define  TRANS_DDI_FUNC_CTL_VAL_TO_PORT(val)	 (((val) & TRANS_DDI_PORT_MASK) >> TRANS_DDI_PORT_SHIFT)
> -#define  TGL_TRANS_DDI_FUNC_CTL_VAL_TO_PORT(val) (((val) & TGL_TRANS_DDI_PORT_MASK >> TGL_TRANS_DDI_PORT_SHIFT) - 1)
> +#define  TGL_TRANS_DDI_FUNC_CTL_VAL_TO_PORT(val) ((((val) & TGL_TRANS_DDI_PORT_MASK) >> TGL_TRANS_DDI_PORT_SHIFT) - 1)
>  #define  TRANS_DDI_MODE_SELECT_MASK	(7 << 24)
>  #define  TRANS_DDI_MODE_SELECT_HDMI	(0 << 24)
>  #define  TRANS_DDI_MODE_SELECT_DVI	(1 << 24)

-- 
Jani Nikula, Intel Open Source Graphics Center
