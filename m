Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D3E05D0BE5
	for <lists+kernel-janitors@lfdr.de>; Wed,  9 Oct 2019 11:53:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730761AbfJIJw0 (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Wed, 9 Oct 2019 05:52:26 -0400
Received: from mga03.intel.com ([134.134.136.65]:7292 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725935AbfJIJwX (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 9 Oct 2019 05:52:23 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 09 Oct 2019 02:52:22 -0700
X-IronPort-AV: E=Sophos;i="5.67,273,1566889200"; 
   d="scan'208";a="187581234"
Received: from jnikula-mobl3.fi.intel.com (HELO localhost) ([10.237.66.161])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 09 Oct 2019 02:52:18 -0700
From:   Jani Nikula <jani.nikula@linux.intel.com>
To:     Colin King <colin.king@canonical.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH][next] drm/i915: remove redundant variable err
In-Reply-To: <20191009093935.17895-1-colin.king@canonical.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20191009093935.17895-1-colin.king@canonical.com>
Date:   Wed, 09 Oct 2019 12:52:15 +0300
Message-ID: <87h84igsa8.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Wed, 09 Oct 2019, Colin King <colin.king@canonical.com> wrote:
> From: Colin Ian King <colin.king@canonical.com>
>
> An earlier commit removed any error assignments to err and we
> are now left with a zero assignment to err and a check that is
> always false. Clean this up by removing the redundant variable
> err and the error check.
>
> Addresses-Coverity: ("'Constant' variable guard")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Fixes: b1e3177bd1d8 ("drm/i915: Coordinate i915_active with its own mutex")
Reviewed-by: Jani Nikula <jani.nikula@intel.com>


BR,
Jani.


> ---
>  drivers/gpu/drm/i915/i915_active.c | 3 ---
>  1 file changed, 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/i915_active.c b/drivers/gpu/drm/i915/i915_active.c
> index aa37c07004b9..67305165c12a 100644
> --- a/drivers/gpu/drm/i915/i915_active.c
> +++ b/drivers/gpu/drm/i915/i915_active.c
> @@ -438,7 +438,6 @@ static void enable_signaling(struct i915_active_fence *active)
>  int i915_active_wait(struct i915_active *ref)
>  {
>  	struct active_node *it, *n;
> -	int err = 0;
>  
>  	might_sleep();
>  
> @@ -456,8 +455,6 @@ int i915_active_wait(struct i915_active *ref)
>  	/* Any fence added after the wait begins will not be auto-signaled */
>  
>  	i915_active_release(ref);
> -	if (err)
> -		return err;
>  
>  	if (wait_var_event_interruptible(ref, i915_active_is_idle(ref)))
>  		return -EINTR;

-- 
Jani Nikula, Intel Open Source Graphics Center
