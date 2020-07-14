Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BE54021F7F2
	for <lists+kernel-janitors@lfdr.de>; Tue, 14 Jul 2020 19:15:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728170AbgGNRPl convert rfc822-to-8bit (ORCPT
        <rfc822;lists+kernel-janitors@lfdr.de>);
        Tue, 14 Jul 2020 13:15:41 -0400
Received: from mail.fireflyinternet.com ([77.68.26.236]:65527 "EHLO
        fireflyinternet.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726169AbgGNRPk (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 14 Jul 2020 13:15:40 -0400
X-Default-Received-SPF: pass (skip=forwardok (res=PASS)) x-ip-name=78.156.65.138;
Received: from localhost (unverified [78.156.65.138]) 
        by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id 21818335-1500050 
        for multiple; Tue, 14 Jul 2020 18:15:23 +0100
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8BIT
In-Reply-To: <29d5e25e-45e1-fca0-7d09-fd5e303b9eea@intel.com>
References: <20200714143652.GA337376@mwanda> <29d5e25e-45e1-fca0-7d09-fd5e303b9eea@intel.com>
Subject: Re: [Intel-gfx] [PATCH v2] drm/i915/selftest: Fix an error code in live_noa_gpr()
From:   Chris Wilson <chris@chris-wilson.co.uk>
Cc:     David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org,
        kernel-janitors@vger.kernel.org
To:     Dan Carpenter <dan.carpenter@oracle.com>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Date:   Tue, 14 Jul 2020 18:15:22 +0100
Message-ID: <159474692212.3188.5286642208247298191@build.alporthouse.com>
User-Agent: alot/0.9
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Quoting Lionel Landwerlin (2020-07-14 15:39:21)
> On 14/07/2020 17:36, Dan Carpenter wrote:
> > The error code needs to be set on this path.  It currently returns
> > success.
> >
> > Fixes: ed2690a9ca89 ("drm/i915/selftest: Check that GPR are restored across noa_wait")
> > Reported-by: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> > ---
> > v2: Fix a different bug instead.  :P  Colin fixed mine already.

I was thinking that Colin already sent the patch for this one...

> >
> >   drivers/gpu/drm/i915/selftests/i915_perf.c | 1 +
> >   1 file changed, 1 insertion(+)
> >
> > diff --git a/drivers/gpu/drm/i915/selftests/i915_perf.c b/drivers/gpu/drm/i915/selftests/i915_perf.c
> > index 0aa151501fb3..c232194c60a2 100644
> > --- a/drivers/gpu/drm/i915/selftests/i915_perf.c
> > +++ b/drivers/gpu/drm/i915/selftests/i915_perf.c
> > @@ -358,6 +358,7 @@ static int live_noa_gpr(void *arg)
> >               cs = intel_ring_begin(rq, 4);
> >               if (IS_ERR(cs)) {
> >                       i915_request_add(rq);
> > +                     err = PTR_ERR(cs);
> >                       goto out_rq;
> >               }
> >   
> 
> Reviewed-by: Lionel Landwerlin <lionel.g.landwerlin@intel.com>

Ta,
-Chris
