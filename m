Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 42C862F15EC
	for <lists+kernel-janitors@lfdr.de>; Mon, 11 Jan 2021 14:47:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387449AbhAKNq1 convert rfc822-to-8bit (ORCPT
        <rfc822;lists+kernel-janitors@lfdr.de>);
        Mon, 11 Jan 2021 08:46:27 -0500
Received: from mail.fireflyinternet.com ([77.68.26.236]:58646 "EHLO
        fireflyinternet.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1731285AbhAKNK4 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 11 Jan 2021 08:10:56 -0500
X-Default-Received-SPF: pass (skip=forwardok (res=PASS)) x-ip-name=78.156.65.138;
Received: from localhost (unverified [78.156.65.138]) 
        by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id 23559224-1500050 
        for multiple; Mon, 11 Jan 2021 13:10:05 +0000
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8BIT
In-Reply-To: <X/xMdcewtft7+QFM@mwanda>
References: <X/xMdcewtft7+QFM@mwanda>
Subject: Re: [PATCH] drm/i915/selftests: Fix some error codes
From:   Chris Wilson <chris@chris-wilson.co.uk>
Cc:     Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Mika Kuoppala <mika.kuoppala@linux.intel.com>,
        Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
        Andi Shyti <andi.shyti@intel.com>,
        Matthew Auld <matthew.auld@intel.com>,
        intel-gfx@lists.freedesktop.org, kernel-janitors@vger.kernel.org
To:     Dan Carpenter <dan.carpenter@oracle.com>,
        Jani Nikula <jani.nikula@linux.intel.com>
Date:   Mon, 11 Jan 2021 13:10:02 +0000
Message-ID: <161037060292.28181.5373987654669273170@build.alporthouse.com>
User-Agent: alot/0.9
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Quoting Dan Carpenter (2021-01-11 13:02:45)
> These error paths return success instead of negative error codes as
> intended.
> 
> Fixes: c92724de6db1 ("drm/i915/selftests: Try to detect rollback during batchbuffer preemption")
> Fixes: 2d19a71ce68f ("drm/i915/selftests: Exercise long preemption chains")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  drivers/gpu/drm/i915/gt/selftest_lrc.c | 12 +++++++++---
>  1 file changed, 9 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/selftest_lrc.c b/drivers/gpu/drm/i915/gt/selftest_lrc.c
> index 95d41c01d0e0..0f9fbae98158 100644
> --- a/drivers/gpu/drm/i915/gt/selftest_lrc.c
> +++ b/drivers/gpu/drm/i915/gt/selftest_lrc.c
> @@ -2679,8 +2679,10 @@ static int create_gang(struct intel_engine_cs *engine,
>                 goto err_obj;
>  
>         cs = i915_gem_object_pin_map(obj, I915_MAP_WC);
> -       if (IS_ERR(cs))
> +       if (IS_ERR(cs)) {
> +               err = PTR_ERR(cs);
>                 goto err_obj;
> +       }
>  
>         /* Semaphore target: spin until zero */
>         *cs++ = MI_ARB_ON_OFF | MI_ARB_ENABLE;
> @@ -2707,8 +2709,10 @@ static int create_gang(struct intel_engine_cs *engine,
>         i915_gem_object_unpin_map(obj);
>  
>         rq = intel_context_create_request(ce);
> -       if (IS_ERR(rq))
> +       if (IS_ERR(rq)) {
> +               err = PTR_ERR(rq);
>                 goto err_obj;
> +       }

Smatch already caught this pair for us, thanks.

>         rq->batch = i915_vma_get(vma);
>         i915_request_get(rq);
> @@ -3264,8 +3268,10 @@ static int live_preempt_user(void *arg)
>  
>                         rq = create_gpr_client(engine, global,
>                                                NUM_GPR * i * sizeof(u32));
> -                       if (IS_ERR(rq))
> +                       if (IS_ERR(rq)) {
> +                               err = PTR_ERR(rq);
>                                 goto end_test;
> +                       }

But it hasn't yet caught this one.

Reviewed-by: Chris Wilson <chris@chris-wilson.co.uk>
-Chris
