Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9F75A2FE731
	for <lists+kernel-janitors@lfdr.de>; Thu, 21 Jan 2021 11:11:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728996AbhAUKKl (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Thu, 21 Jan 2021 05:10:41 -0500
Received: from mga18.intel.com ([134.134.136.126]:48564 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728699AbhAUKKH (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 21 Jan 2021 05:10:07 -0500
IronPort-SDR: bLtF/mVBJ6wKO7FeJvEUkVgiJghUf1ZVCAxkC3Hw+EyopjhmFvlsrDKesPNNKCwWJ//E97JNOr
 kix+ksVLGdNg==
X-IronPort-AV: E=McAfee;i="6000,8403,9870"; a="166918797"
X-IronPort-AV: E=Sophos;i="5.79,363,1602572400"; 
   d="scan'208";a="166918797"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2021 02:09:12 -0800
IronPort-SDR: trg05fUx44tFYlknrtnoHUlYLYHDJLg5uEnLeCfcvYLyzF3X6+x4nwo2zzEKhD4rBeooEC6Hs1
 UoxFwG+s+A9w==
X-IronPort-AV: E=Sophos;i="5.79,363,1602572400"; 
   d="scan'208";a="385244216"
Received: from cohrs-mobl.ger.corp.intel.com (HELO localhost) ([10.252.51.23])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2021 02:09:08 -0800
From:   Jani Nikula <jani.nikula@linux.intel.com>
To:     Chris Wilson <chris@chris-wilson.co.uk>,
        Ankit Nautiyal <ankit.k.nautiyal@intel.com>,
        Dan Carpenter <dan.carpenter@oracle.com>
Cc:     David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org,
        Lucas De Marchi <lucas.demarchi@intel.com>,
        Sean Paul <seanpaul@chromium.org>,
        intel-gfx@lists.freedesktop.org,
        Wambui Karuga <wambui.karugax@gmail.com>
Subject: Re: [Intel-gfx] [PATCH] drm/i915/dp: Fix a logical vs bitwise OR bug
In-Reply-To: <161122078664.32666.16504061212673044761@build.alporthouse.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <YAkaBa22zvbXKd4E@mwanda> <87h7namz5w.fsf@intel.com> <161122078664.32666.16504061212673044761@build.alporthouse.com>
Date:   Thu, 21 Jan 2021 12:09:05 +0200
Message-ID: <87eeiemwji.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Thu, 21 Jan 2021, Chris Wilson <chris@chris-wilson.co.uk> wrote:
> Quoting Jani Nikula (2021-01-21 09:12:27)
>> On Thu, 21 Jan 2021, Dan Carpenter <dan.carpenter@oracle.com> wrote:
>> > This was supposed to be | instead of ||.
>> >
>> > Fixes: 522508b665df ("drm/i915/display: Let PCON convert from RGB to YCbCr if it can")
>> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>> 
>> Thanks, but we already have the fix [1] for this that I thought was
>> pushed by now [2].
>> 
>> Chris?
>
> 6b20b734bbf1 ("drm/i915/display: Bitwise or the conversion colour specifier together")
> in
>   remotes/drm-intel/drm-intel-next
>   remotes/drm-intel/for-linux-next
> should be visible.

Oh, it totally is. Where's my brown paper bag when I need it?

BR,
Jani.


-- 
Jani Nikula, Intel Open Source Graphics Center
