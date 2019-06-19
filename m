Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 389514BCDD
	for <lists+kernel-janitors@lfdr.de>; Wed, 19 Jun 2019 17:33:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727068AbfFSPdn (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Wed, 19 Jun 2019 11:33:43 -0400
Received: from mga07.intel.com ([134.134.136.100]:30787 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725899AbfFSPdm (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 19 Jun 2019 11:33:42 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 19 Jun 2019 08:33:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,392,1557212400"; 
   d="scan'208";a="181659117"
Received: from mcostacx-wtg.ger.corp.intel.com (HELO localhost) ([10.249.47.136])
  by fmsmga001.fm.intel.com with ESMTP; 19 Jun 2019 08:33:27 -0700
From:   Jani Nikula <jani.nikula@linux.intel.com>
To:     Sean Paul <sean@poorly.run>,
        Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Maxime Ripard <maxime.ripard@bootlin.com>,
        kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org,
        David Airlie <airlied@linux.ie>,
        Sean Paul <seanpaul@chromium.org>
Subject: Re: [PATCH] drm: self_refresh: Fix a reversed condition in drm_self_refresh_helper_cleanup()
In-Reply-To: <20190619150339.GF25413@art_vandelay>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20190619100141.GA28596@mwanda> <20190619150339.GF25413@art_vandelay>
Date:   Wed, 19 Jun 2019 18:34:56 +0300
Message-ID: <877e9hlhb3.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Wed, 19 Jun 2019, Sean Paul <sean@poorly.run> wrote:
> On Wed, Jun 19, 2019 at 01:01:41PM +0300, Dan Carpenter wrote:
>> This test is flipped around so it either leads to a memory leak or a
>> NULL dereference.
>> 
>> Fixes: 1452c25b0e60 ("drm: Add helpers to kick off self refresh mode in drivers")
>> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>
> Thanks for the patch and your bug report! I've applied this to -misc-next and
> will dig into the bug report shortly.
>
>> ---
>> I'm not totally sure what the prefered patch prefix for this code.  One
>> thing that would help is when we're adding new files we should specify
>> the prefix that they're going to use:
>> 
>> - drm: Add helpers to kick off self refresh mode in drivers
>> + drm: refresh mode: Add helpers to kick off self refresh mode in drivers
>> 
>> It's a small thing and email always sounds whiny but I'm sending this
>> suggestion to everyone today so...
>
> There's no hard rule. For drivers we use drm/<driver>, and for core people
> use drm or drm/<file>.

checkpatch.pl should have a git log popularity contest based check for
the prefix. For new files, first come first served. ;)

BR,
Jani.


>
>> 
>>  drivers/gpu/drm/drm_self_refresh_helper.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>> 
>> diff --git a/drivers/gpu/drm/drm_self_refresh_helper.c b/drivers/gpu/drm/drm_self_refresh_helper.c
>> index 2b3daaf77841..e0d2ad1f070c 100644
>> --- a/drivers/gpu/drm/drm_self_refresh_helper.c
>> +++ b/drivers/gpu/drm/drm_self_refresh_helper.c
>> @@ -205,7 +205,7 @@ void drm_self_refresh_helper_cleanup(struct drm_crtc *crtc)
>>  	struct drm_self_refresh_data *sr_data = crtc->self_refresh_data;
>>  
>>  	/* Helper is already uninitialized */
>> -	if (sr_data)
>> +	if (!sr_data)
>>  		return;
>>  
>>  	crtc->self_refresh_data = NULL;
>> -- 
>> 2.20.1
>> 
>> _______________________________________________
>> dri-devel mailing list
>> dri-devel@lists.freedesktop.org
>> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- 
Jani Nikula, Intel Open Source Graphics Center
