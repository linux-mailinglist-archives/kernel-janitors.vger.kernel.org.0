Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 92FCC2FE609
	for <lists+kernel-janitors@lfdr.de>; Thu, 21 Jan 2021 10:14:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728418AbhAUJNx (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Thu, 21 Jan 2021 04:13:53 -0500
Received: from mga01.intel.com ([192.55.52.88]:28621 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728448AbhAUJNS (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 21 Jan 2021 04:13:18 -0500
IronPort-SDR: EZ18APNkK6iXEht959Av5r8eDOEpM8q8imJDw9MasvMdcVDHyc+v+aTj0hvKdqy69rjllDhC3D
 ephOstVurwQQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9870"; a="197976659"
X-IronPort-AV: E=Sophos;i="5.79,363,1602572400"; 
   d="scan'208";a="197976659"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2021 01:12:37 -0800
IronPort-SDR: OcxemuhgOh+7wtcay4TZjrZMPYMUAqh1uOwhNdq7sp1zWZadlIoy2QB8GivzzPNujIM7fWKtMw
 6F/J07n5BjRg==
X-IronPort-AV: E=Sophos;i="5.79,363,1602572400"; 
   d="scan'208";a="385226668"
Received: from cohrs-mobl.ger.corp.intel.com (HELO localhost) ([10.252.51.23])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2021 01:12:30 -0800
From:   Jani Nikula <jani.nikula@linux.intel.com>
To:     Dan Carpenter <dan.carpenter@oracle.com>,
        Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Cc:     Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
        Imre Deak <imre.deak@intel.com>,
        Uma Shankar <uma.shankar@intel.com>,
        Manasi Navare <manasi.d.navare@intel.com>,
        Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>,
        Wambui Karuga <wambui.karugax@gmail.com>,
        Sean Paul <seanpaul@chromium.org>,
        Lucas De Marchi <lucas.demarchi@intel.com>,
        intel-gfx@lists.freedesktop.org, kernel-janitors@vger.kernel.org,
        Chris Wilson <chris@chris-wilson.co.uk>
Subject: Re: [PATCH] drm/i915/dp: Fix a logical vs bitwise OR bug
In-Reply-To: <YAkaBa22zvbXKd4E@mwanda>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <YAkaBa22zvbXKd4E@mwanda>
Date:   Thu, 21 Jan 2021 11:12:27 +0200
Message-ID: <87h7namz5w.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Thu, 21 Jan 2021, Dan Carpenter <dan.carpenter@oracle.com> wrote:
> This was supposed to be | instead of ||.
>
> Fixes: 522508b665df ("drm/i915/display: Let PCON convert from RGB to YCbCr if it can")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Thanks, but we already have the fix [1] for this that I thought was
pushed by now [2].

Chris?


BR,
Jani.


[1] http://lore.kernel.org/r/20201223103917.14687-1-chris@chris-wilson.co.uk
[2] http://lore.kernel.org/r/161069893278.19482.3803444937046587332@build.alporthouse.com

> ---
>  drivers/gpu/drm/i915/display/intel_dp.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
> index 8a00e609085f..9c6f427b2703 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> @@ -6955,8 +6955,8 @@ intel_dp_update_420(struct intel_dp *intel_dp)
>  							intel_dp->downstream_ports);
>  	rgb_to_ycbcr = drm_dp_downstream_rgb_to_ycbcr_conversion(intel_dp->dpcd,
>  								 intel_dp->downstream_ports,
> -								 DP_DS_HDMI_BT601_RGB_YCBCR_CONV ||
> -								 DP_DS_HDMI_BT709_RGB_YCBCR_CONV ||
> +								 DP_DS_HDMI_BT601_RGB_YCBCR_CONV |
> +								 DP_DS_HDMI_BT709_RGB_YCBCR_CONV |
>  								 DP_DS_HDMI_BT2020_RGB_YCBCR_CONV);
>  
>  	if (INTEL_GEN(i915) >= 11) {

-- 
Jani Nikula, Intel Open Source Graphics Center
