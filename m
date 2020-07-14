Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9D79921F505
	for <lists+kernel-janitors@lfdr.de>; Tue, 14 Jul 2020 16:44:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729407AbgGNOnk (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Tue, 14 Jul 2020 10:43:40 -0400
Received: from mga14.intel.com ([192.55.52.115]:13686 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728932AbgGNOja (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 14 Jul 2020 10:39:30 -0400
IronPort-SDR: haEmmWhF0hCTSBvPn36iYccKwWnaalxk7K2Q3XOXRU7L40vC99N2e8mOPxf/LYt3t0rc2tPxIJ
 UzlbCFP/QcPA==
X-IronPort-AV: E=McAfee;i="6000,8403,9681"; a="148045341"
X-IronPort-AV: E=Sophos;i="5.75,350,1589266800"; 
   d="scan'208";a="148045341"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jul 2020 07:39:30 -0700
IronPort-SDR: pwfsk84DrvanZWdQk3oMJGqMrEoRuXYfHDJODGhjCJz4w//qW35PP5n+Y7Wd7c5+jyZMWDEMgU
 fwVo4g9EOYlQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,350,1589266800"; 
   d="scan'208";a="325857745"
Received: from gruberda-mobl2.ger.corp.intel.com (HELO [10.249.32.254]) ([10.249.32.254])
  by orsmga007.jf.intel.com with ESMTP; 14 Jul 2020 07:39:26 -0700
Subject: Re: [PATCH v2] drm/i915/selftest: Fix an error code in live_noa_gpr()
To:     Dan Carpenter <dan.carpenter@oracle.com>,
        Jani Nikula <jani.nikula@linux.intel.com>
Cc:     Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Chris Wilson <chris@chris-wilson.co.uk>,
        =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
        Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
        Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
        intel-gfx@lists.freedesktop.org, kernel-janitors@vger.kernel.org
References: <20200714143652.GA337376@mwanda>
From:   Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
 Swindon SN3 1RJ
Message-ID: <29d5e25e-45e1-fca0-7d09-fd5e303b9eea@intel.com>
Date:   Tue, 14 Jul 2020 17:39:21 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200714143652.GA337376@mwanda>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On 14/07/2020 17:36, Dan Carpenter wrote:
> The error code needs to be set on this path.  It currently returns
> success.
>
> Fixes: ed2690a9ca89 ("drm/i915/selftest: Check that GPR are restored across noa_wait")
> Reported-by: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> v2: Fix a different bug instead.  :P  Colin fixed mine already.
>
>   drivers/gpu/drm/i915/selftests/i915_perf.c | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/i915/selftests/i915_perf.c b/drivers/gpu/drm/i915/selftests/i915_perf.c
> index 0aa151501fb3..c232194c60a2 100644
> --- a/drivers/gpu/drm/i915/selftests/i915_perf.c
> +++ b/drivers/gpu/drm/i915/selftests/i915_perf.c
> @@ -358,6 +358,7 @@ static int live_noa_gpr(void *arg)
>   		cs = intel_ring_begin(rq, 4);
>   		if (IS_ERR(cs)) {
>   			i915_request_add(rq);
> +			err = PTR_ERR(cs);
>   			goto out_rq;
>   		}
>   

Reviewed-by: Lionel Landwerlin <lionel.g.landwerlin@intel.com>

