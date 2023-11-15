Return-Path: <kernel-janitors+bounces-298-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A89267ECFE0
	for <lists+kernel-janitors@lfdr.de>; Wed, 15 Nov 2023 20:51:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6240528173C
	for <lists+kernel-janitors@lfdr.de>; Wed, 15 Nov 2023 19:51:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6357F3BB43;
	Wed, 15 Nov 2023 19:51:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ERrwPOZZ"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 844BAAB;
	Wed, 15 Nov 2023 11:51:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700077878; x=1731613878;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=ngiPfeziv8PT2BpwQ1I8V9zHtCUA2oybBprQ4dI1p18=;
  b=ERrwPOZZo5J9JMwCDDOziEKjTFyJL9QKbG+UZCfZGQRMMdh2LXvBLNiv
   s0TpFMLQJCT3ikWBgm3aTpFabujzQg47gi18Hp1KuTr1n8vi0AwhoLb0E
   wr00hyjoetxG/t7DOpyFlQx/eRaEWaH26G/ZI/WVyN/DZF9txiJ4rRO96
   SeoN7qlVRyl58rhpmfSE53Xu2ex14RlxQ11tEJV0B5Gu+Mid+sBJNaNRM
   O9SkdlEBga1/GNRn4JFwfcBb2+glar9jBqlDASnOsVRl41Lc24nZafM/b
   d1uZLdBTuWIGoAmD89HXLn6iaIwst7iquebIGldYRyUCff8Hu4VduMNp4
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="477165501"
X-IronPort-AV: E=Sophos;i="6.03,305,1694761200"; 
   d="scan'208";a="477165501"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2023 11:51:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="741528085"
X-IronPort-AV: E=Sophos;i="6.03,305,1694761200"; 
   d="scan'208";a="741528085"
Received: from ipaliych-mobl2.amr.corp.intel.com (HELO [10.212.183.137]) ([10.212.183.137])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2023 11:51:15 -0800
Message-ID: <05147111-e46b-42a5-9e99-ec289e61730f@linux.intel.com>
Date: Wed, 15 Nov 2023 13:51:14 -0600
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] soundwire: amd: add an error code check in
 amd_sdw_clock_stop_exit
Content-Language: en-US
To: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>, Su Hui
 <suhui@nfschina.com>, vkoul@kernel.org, yung-chuan.liao@linux.intel.com,
 sanyog.r.kale@intel.com, nathan@kernel.org, ndesaulniers@google.com,
 trix@redhat.com
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev, kernel-janitors@vger.kernel.org
References: <20231115095407.1059704-1-suhui@nfschina.com>
 <3e461bb5-fa6b-4729-8ff5-ccc1d2887066@linux.intel.com>
 <5729c613-182b-43d2-a2ed-caff046b68e7@amd.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <5729c613-182b-43d2-a2ed-caff046b68e7@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


>>> diff --git a/drivers/soundwire/amd_manager.c b/drivers/soundwire/amd_manager.c
>>> index 3a99f6dcdfaf..f391b541f4b7 100644
>>> --- a/drivers/soundwire/amd_manager.c
>>> +++ b/drivers/soundwire/amd_manager.c
>>> @@ -1029,6 +1029,10 @@ static int amd_sdw_clock_stop_exit(struct amd_sdw_manager *amd_manager)
>>>  		ret = readl_poll_timeout(amd_manager->mmio + ACP_SW_CLK_RESUME_CTRL, val,
>>>  					 (val & AMD_SDW_CLK_RESUME_DONE), ACP_DELAY_US,
>>>  					 AMD_SDW_TIMEOUT);
>>> +		if (ret)
>>> +			dev_err(amd_manager->dev, "%s: timed out: %pe\n", __func__,
>>> +				ERR_PTR(ret));
>> Is this really the desired behavior?
>>
>> This patch fixes the static analysis issue by logging the error code,
>> but does it make sense to continue resuming here and trying to exit from
>> the clock stop mode?
>>
>> At this point a bus reset might be a more relevant behavior...
> As per earlier discussion, when we sent the initial patch series,
> It was communicated that even clock stop sequence fails,
> return '0' in suspend/resume callbacks that why we returned
> status as zero.

clock stop is for suspend and clock stop exit for resume. Different
problems.

> In this scenario, it's not continuing resume when clock stop exit
> sequence fails. Even In Intel's case, if the clock stop sequence fails,
> just code is exiting from that sequence.

that's right, in the Intel SoundWire drivers we never prevent the
pm_runtime suspend from happening, and discard any errors. In the resume
step we do a bus reset anyways.

But that's different here, this is the clock stop exit which happens on
resume and IIRC there is no bus reset. If the resume fails, what is the
expected behavior? If you keep going then you are going to have other
issues down the road.

>>
>>>  		if (val & AMD_SDW_CLK_RESUME_DONE) {
>>>  			writel(0, amd_manager->mmio + ACP_SW_CLK_RESUME_CTRL);
>>>  			ret = sdw_bus_exit_clk_stop(&amd_manager->bus);
> 

