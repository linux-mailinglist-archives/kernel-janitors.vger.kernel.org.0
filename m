Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 06CB51BDF9D
	for <lists+kernel-janitors@lfdr.de>; Wed, 29 Apr 2020 15:54:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726862AbgD2NyZ convert rfc822-to-8bit (ORCPT
        <rfc822;lists+kernel-janitors@lfdr.de>);
        Wed, 29 Apr 2020 09:54:25 -0400
Received: from mail.fireflyinternet.com ([109.228.58.192]:54081 "EHLO
        fireflyinternet.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726853AbgD2NyZ (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 29 Apr 2020 09:54:25 -0400
X-Default-Received-SPF: pass (skip=forwardok (res=PASS)) x-ip-name=78.156.65.138;
Received: from localhost (unverified [78.156.65.138]) 
        by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id 21058883-1500050 
        for multiple; Wed, 29 Apr 2020 14:53:47 +0100
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8BIT
In-Reply-To: <20200429132425.GE815283@mwanda>
References: <20200429132425.GE815283@mwanda>
Subject: Re: [PATCH] drm/i915/selftests: fix error handling in __live_lrc_indirect_ctx_bb()
Cc:     Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Mika Kuoppala <mika.kuoppala@linux.intel.com>,
        Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
        Matthew Auld <matthew.auld@intel.com>,
        Andi Shyti <andi.shyti@intel.com>,
        intel-gfx@lists.freedesktop.org, kernel-janitors@vger.kernel.org
From:   Chris Wilson <chris@chris-wilson.co.uk>
To:     Dan Carpenter <dan.carpenter@oracle.com>,
        Jani Nikula <jani.nikula@linux.intel.com>
Message-ID: <158816842543.4620.13969605148556812046@build.alporthouse.com>
User-Agent: alot/0.8.1
Date:   Wed, 29 Apr 2020 14:53:45 +0100
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Quoting Dan Carpenter (2020-04-29 14:24:25)
> If intel_context_create() fails then it leads to an error pointer
> dereference.  I shuffled things around to make error handling easier.
> 
> Fixes: 1dd47b54baea ("drm/i915: Add live selftests for indirect ctx batchbuffers")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  drivers/gpu/drm/i915/gt/selftest_lrc.c | 30 +++++++++++++++-----------
>  1 file changed, 18 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/selftest_lrc.c b/drivers/gpu/drm/i915/gt/selftest_lrc.c
> index d3fa91aed7dee..c4bfad5c49dea 100644
> --- a/drivers/gpu/drm/i915/gt/selftest_lrc.c
> +++ b/drivers/gpu/drm/i915/gt/selftest_lrc.c
> @@ -5795,26 +5795,29 @@ static int indirect_ctx_bb_check(struct intel_context *ce)
>  static int __live_lrc_indirect_ctx_bb(struct intel_engine_cs *engine)
>  {
>         struct intel_context *a, *b;
> -       int err = 0;
> +       int err;
>  
>         a = intel_context_create(engine);
> -       b = intel_context_create(engine);
> -
> +       if (IS_ERR(a))
> +               return PTR_ERR(a);
>         err = intel_context_pin(a);
>         if (err)
> -               return err;
> +               goto put_a;
>  
> -       err = intel_context_pin(b);
> -       if (err) {
> -               intel_context_put(a);
> -               return err;
> +       b = intel_context_create(engine);
> +       if (IS_ERR(b)) {
> +               err = PTR_ERR(b);
> +               goto unpin_a;
>         }
> +       err = intel_context_pin(b);
> +       if (err)
> +               goto put_b;
>  
>         /* We use the already reserved extra page in context state */
>         if (!a->wa_bb_page) {
>                 GEM_BUG_ON(b->wa_bb_page);
>                 GEM_BUG_ON(INTEL_GEN(engine->i915) == 12);
> -               goto out;
> +               goto unpin_b;
>         }
>  
>         /*
> @@ -5829,14 +5832,17 @@ static int __live_lrc_indirect_ctx_bb(struct intel_engine_cs *engine)
>  
>         err = indirect_ctx_bb_check(a);
>         if (err)
> -               goto out;
> +               goto unpin_b;
>  
>         err = indirect_ctx_bb_check(b);
> -out:
> +
> +unpin_b:
>         intel_context_unpin(b);
> +put_b:
>         intel_context_put(b);
> -
> +unpin_a:
>         intel_context_unpin(a);
> +put_a:
>         intel_context_put(a);

Onion looks correct, and there should not be any issue with this
sequence of create/pin.

Reviewed-by: Chris Wilson <chris@chris-wilson.co.uk>
-Chris
