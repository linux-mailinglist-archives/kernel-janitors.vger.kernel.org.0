Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 691B421F3B8
	for <lists+kernel-janitors@lfdr.de>; Tue, 14 Jul 2020 16:17:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728095AbgGNOQ5 (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Tue, 14 Jul 2020 10:16:57 -0400
Received: from mga14.intel.com ([192.55.52.115]:11364 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726062AbgGNOQ5 (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 14 Jul 2020 10:16:57 -0400
IronPort-SDR: HBUNFHxYK3s84fuItTfzPgSbu+PEeC+bWLPUBTJOWRm3vYwHFVGWWMkN5cxCypmdeghwMNDPlP
 mwf/id74NlKw==
X-IronPort-AV: E=McAfee;i="6000,8403,9681"; a="148035740"
X-IronPort-AV: E=Sophos;i="5.75,350,1589266800"; 
   d="scan'208";a="148035740"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jul 2020 07:16:41 -0700
IronPort-SDR: YU6dLP1DNLMURLAnRyH0/ToXPzukvGtC8bpWPbwcPGhBJaSgyj1GfhPu9Ymdxq/gckaOxafLvR
 6xoooXJnMkRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,350,1589266800"; 
   d="scan'208";a="325852274"
Received: from gruberda-mobl2.ger.corp.intel.com (HELO [10.249.32.254]) ([10.249.32.254])
  by orsmga007.jf.intel.com with ESMTP; 14 Jul 2020 07:16:38 -0700
Subject: Re: [PATCH] drm/i915/selftest: Fix an error code in live_noa_gpr()
To:     Dan Carpenter <dan.carpenter@oracle.com>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Chris Wilson <chris@chris-wilson.co.uk>
Cc:     Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
        Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
        Mika Kuoppala <mika.kuoppala@linux.intel.com>,
        intel-gfx@lists.freedesktop.org, kernel-janitors@vger.kernel.org
References: <20200714141216.GA314989@mwanda>
From:   Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
 Swindon SN3 1RJ
Message-ID: <71508ba9-6cad-45f9-a3b1-b3401ac0a1d5@intel.com>
Date:   Tue, 14 Jul 2020 17:16:33 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200714141216.GA314989@mwanda>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On 14/07/2020 17:12, Dan Carpenter wrote:
> The error code is not set on this error path.  It's either zero or
> uninitialized at this point.
>
> Fixes: ed2690a9ca89 ("drm/i915/selftest: Check that GPR are restored across noa_wait")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>   drivers/gpu/drm/i915/selftests/i915_perf.c | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/i915/selftests/i915_perf.c b/drivers/gpu/drm/i915/selftests/i915_perf.c
> index deb6dec1b5ab..7aa73bb03381 100644
> --- a/drivers/gpu/drm/i915/selftests/i915_perf.c
> +++ b/drivers/gpu/drm/i915/selftests/i915_perf.c
> @@ -329,6 +329,7 @@ static int live_noa_gpr(void *arg)
>   	cs = intel_ring_begin(rq, 2 * 32 + 2);
>   	if (IS_ERR(cs)) {
>   		i915_request_add(rq);
> +		err = PTR_ERR(cs);
>   		goto out_rq;
>   	}
>   

Looks like there is another below :

cs = intel_ring_begin(rq, 4);
if (IS_ERR(cs)) {
         i915_request_add(rq);
         goto out_rq;
}

-Lionel

