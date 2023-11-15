Return-Path: <kernel-janitors+bounces-42-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 34CC17DBA1C
	for <lists+kernel-janitors@lfdr.de>; Mon, 30 Oct 2023 13:47:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 661BB1C20AE1
	for <lists+kernel-janitors@lfdr.de>; Mon, 30 Oct 2023 12:47:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DB48156C1;
	Mon, 30 Oct 2023 12:47:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aXQSBd9+"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 139C1D505
	for <kernel-janitors@vger.kernel.org>; Mon, 30 Oct 2023 12:47:07 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C04A6C6;
	Mon, 30 Oct 2023 05:47:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698670026; x=1730206026;
  h=message-id:date:mime-version:subject:from:to:cc:
   references:in-reply-to:content-transfer-encoding;
  bh=acCrsCNmaOONI9brAj/EA4NAdkInhvJZ2O3IwgG1etU=;
  b=aXQSBd9+GmreSxzvBdAjvkyjFZdOBQsxzJ//YoVQIYH13Qf5F+WPf2lI
   4nMkd4evf3Eg3Cry2Vu5DDxjD8IFZ1cGG5eCCEXc9KFAcoYRK6i1dWizn
   /PjyONKXVC1g3daPQhNwcoxEnFhnWkTW/qo6/EkirYwopymmhlDTIN4U/
   rmMDNNCVp9DDlCM0IXWX4GFtQJ+w0hJJdX5hOsOMSzvoY7Mb1QxFqznsp
   EYrudwZiBxUMtToTXmLKTRmE/bvZUEXC+Q1AaC4AIMrSQMCZQk6lf8toL
   etmb06ohEKWc5TcPjA6U7IVqoorzS1ePzuqnj8NgrAzUda3iL04EGCAJW
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10878"; a="9596831"
X-IronPort-AV: E=Sophos;i="6.03,263,1694761200"; 
   d="scan'208";a="9596831"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2023 05:47:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,263,1694761200"; 
   d="scan'208";a="1502059"
Received: from igherghe-mobl1.ger.corp.intel.com (HELO [10.213.220.192]) ([10.213.220.192])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2023 05:47:02 -0700
Message-ID: <2e9df6e9-fa6e-46d5-b2ff-4da0efb44d74@linux.intel.com>
Date: Mon, 30 Oct 2023 12:47:00 +0000
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] i915/perf: Fix NULL deref bugs with drm_dbg() calls
Content-Language: en-US
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Lionel Landwerlin <lionel.g.landwerlin@intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: dan.carpenter@linaro.org, kernel-janitors@vger.kernel.org,
 error27@gmail.com, Tvrtko Ursulin <tvrtko.ursulin@intel.com>
References: <20231027172822.2753059-1-harshit.m.mogalapalli@oracle.com>
 <29c2bf2b-82b1-457d-ba42-29b0b30ecf32@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <29c2bf2b-82b1-457d-ba42-29b0b30ecf32@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 27/10/2023 18:38, Tvrtko Ursulin wrote:
> 
> On 27/10/2023 18:28, Harshit Mogalapalli wrote:
>> When i915 perf interface is not available dereferencing it will lead to
>> NULL dereferences.
>>
>> As returning -ENOTSUPP is pretty clear return when perf interface is not
>> available.
>>
>> Fixes: 2fec539112e8 ("i915/perf: Replace DRM_DEBUG with driver 
>> specific drm_dbg call")
>> Suggested-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>> Signed-off-by: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
>> ---
>> v1 --> v2: Remove the debug calls as they don't add much value and
>> -ENOTSUPP is a good enough return value.
>> ---
>>   drivers/gpu/drm/i915/i915_perf.c | 15 +++------------
>>   1 file changed, 3 insertions(+), 12 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/i915_perf.c 
>> b/drivers/gpu/drm/i915/i915_perf.c
>> index 2f3ecd7d4804..7b1c8de2f9cb 100644
>> --- a/drivers/gpu/drm/i915/i915_perf.c
>> +++ b/drivers/gpu/drm/i915/i915_perf.c
>> @@ -4227,11 +4227,8 @@ int i915_perf_open_ioctl(struct drm_device 
>> *dev, void *data,
>>       u32 known_open_flags;
>>       int ret;
>> -    if (!perf->i915) {
>> -        drm_dbg(&perf->i915->drm,
>> -            "i915 perf interface not available for this system\n");
>> +    if (!perf->i915)
>>           return -ENOTSUPP;
>> -    }
>>       known_open_flags = I915_PERF_FLAG_FD_CLOEXEC |
>>                  I915_PERF_FLAG_FD_NONBLOCK |
>> @@ -4607,11 +4604,8 @@ int i915_perf_add_config_ioctl(struct 
>> drm_device *dev, void *data,
>>       struct i915_oa_reg *regs;
>>       int err, id;
>> -    if (!perf->i915) {
>> -        drm_dbg(&perf->i915->drm,
>> -            "i915 perf interface not available for this system\n");
>> +    if (!perf->i915)
>>           return -ENOTSUPP;
>> -    }
>>       if (!perf->metrics_kobj) {
>>           drm_dbg(&perf->i915->drm,
>> @@ -4773,11 +4767,8 @@ int i915_perf_remove_config_ioctl(struct 
>> drm_device *dev, void *data,
>>       struct i915_oa_config *oa_config;
>>       int ret;
>> -    if (!perf->i915) {
>> -        drm_dbg(&perf->i915->drm,
>> -            "i915 perf interface not available for this system\n");
>> +    if (!perf->i915)
>>           return -ENOTSUPP;
>> -    }
>>       if (i915_perf_stream_paranoid && !perfmon_capable()) {
>>           drm_dbg(&perf->i915->drm,
> 
> Thanks for re-spinning it so quickly! LGTM.
> 
> Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Now merged to drm-intel-gt-next. Thanks again!

Regards,

Tvrtko

