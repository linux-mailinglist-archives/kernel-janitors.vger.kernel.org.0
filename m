Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 343985A9DD9
	for <lists+kernel-janitors@lfdr.de>; Thu,  1 Sep 2022 19:14:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232673AbiIAROg (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Thu, 1 Sep 2022 13:14:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44278 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231843AbiIAROe (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 1 Sep 2022 13:14:34 -0400
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4CC009A9C8
        for <kernel-janitors@vger.kernel.org>; Thu,  1 Sep 2022 10:14:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1662052474; x=1693588474;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=ToBueJ6KJo9UXPq1sRlObbiXpCNJdNlpcCfh6mbCNgA=;
  b=AFLiWYm68qWUUcdheOEcjUTkI7UvrnFabBgI7od+y0t8SjxYikFgy+lv
   q4dZ+5xEJntzVk0CFQpwy4q0sN9O0ld4U9zeJhWHIL8jxD+beeYl3DMpq
   Fd6j47J55+cZcU6iyTRuB70q7vqYjMkhNnnQsMMrvYYeyxZkDA1N7FhmD
   1y9rkAwFB4+cq1XYmhsnozRowvtsWFaV/p9dSLgTDZiqgL21eW25NxA6i
   9a5TA+xfBghA/3RqNf3BCFesheJk4fZpcGjTHLPMbwudL0SoIFwzdF9Ct
   OSMwc14+8Eo9HKYY6gcz3DWDKgwBLHMMGP6xsgHp3B/MJHuSYXJfvh26u
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10457"; a="275523949"
X-IronPort-AV: E=Sophos;i="5.93,281,1654585200"; 
   d="scan'208";a="275523949"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2022 10:14:33 -0700
X-IronPort-AV: E=Sophos;i="5.93,281,1654585200"; 
   d="scan'208";a="940938718"
Received: from ahajda-mobl.ger.corp.intel.com (HELO [10.213.20.60]) ([10.213.20.60])
  by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2022 10:14:31 -0700
Message-ID: <811c976d-1346-64c4-f45b-195654f4a138@intel.com>
Date:   Thu, 1 Sep 2022 19:14:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.13.0
Subject: Re: [Intel-gfx] [PATCH] drm/i915: prevent integer overflow in
 query_engine_info()
Content-Language: en-US
To:     Dan Carpenter <dan.carpenter@oracle.com>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc:     David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org,
        kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Chris Wilson <chris@chris-wilson.co.uk>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>
References: <YxDSAj6tIrTZv5Y5@kili>
From:   Andrzej Hajda <andrzej.hajda@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <YxDSAj6tIrTZv5Y5@kili>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_MED,SPF_HELO_PASS,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On 01.09.2022 17:38, Dan Carpenter wrote:
> This code uses struct_size() but it stores the result in an int so the
> integer overflow checks are not effective.  Record the types as size_t
> to prevent the size from being truncated.
> 
> Fixes: bf3c50837506 ("drm/i915/query: Use struct_size() helper")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>

Regards
Andrzej
> ---
> I do not know if the integer overflow can happen.  This is a hardenning
> patch just like the conversion to struct_size().
> 
>   drivers/gpu/drm/i915/i915_query.c | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/i915_query.c b/drivers/gpu/drm/i915/i915_query.c
> index 6ec9c9fb7b0d..43a499fbdc8d 100644
> --- a/drivers/gpu/drm/i915/i915_query.c
> +++ b/drivers/gpu/drm/i915/i915_query.c
> @@ -13,7 +13,7 @@
>   #include <uapi/drm/i915_drm.h>
>   
>   static int copy_query_item(void *query_hdr, size_t query_sz,
> -			   u32 total_length,
> +			   size_t total_length,
>   			   struct drm_i915_query_item *query_item)
>   {
>   	if (query_item->length == 0)
> @@ -135,7 +135,8 @@ query_engine_info(struct drm_i915_private *i915,
>   	struct drm_i915_engine_info info = { };
>   	unsigned int num_uabi_engines = 0;
>   	struct intel_engine_cs *engine;
> -	int len, ret;
> +	size_t len;
> +	int ret;
>   
>   	if (query_item->flags)
>   		return -EINVAL;

