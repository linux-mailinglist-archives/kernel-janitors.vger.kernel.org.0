Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 17FDB1739A4
	for <lists+kernel-janitors@lfdr.de>; Fri, 28 Feb 2020 15:18:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726751AbgB1OSj convert rfc822-to-8bit (ORCPT
        <rfc822;lists+kernel-janitors@lfdr.de>);
        Fri, 28 Feb 2020 09:18:39 -0500
Received: from mail.fireflyinternet.com ([109.228.58.192]:63423 "EHLO
        fireflyinternet.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1725796AbgB1OSj (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 28 Feb 2020 09:18:39 -0500
X-Default-Received-SPF: pass (skip=forwardok (res=PASS)) x-ip-name=78.156.65.138;
Received: from localhost (unverified [78.156.65.138]) 
        by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id 20386155-1500050 
        for multiple; Fri, 28 Feb 2020 14:18:36 +0000
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8BIT
To:     Dan Carpenter <dan.carpenter@oracle.com>,
        Jani Nikula <jani.nikula@linux.intel.com>
From:   Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <20200228141413.qfjf4abr323drlo4@kili.mountain>
Cc:     Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Matthew Auld <matthew.auld@intel.com>,
        Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
        Abdiel Janulgue <abdiel.janulgue@linux.intel.com>,
        Imre Deak <imre.deak@intel.com>,
        intel-gfx@lists.freedesktop.org, kernel-janitors@vger.kernel.org
References: <20200228141413.qfjf4abr323drlo4@kili.mountain>
Message-ID: <158289951401.24106.17765805022733010158@skylake-alporthouse-com>
User-Agent: alot/0.6
Subject: Re: [PATCH] drm/i915/selftests: Fix return in assert_mmap_offset()
Date:   Fri, 28 Feb 2020 14:18:34 +0000
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Quoting Dan Carpenter (2020-02-28 14:14:13)
> The assert_mmap_offset() returns type bool so if we return an error
> pointer that is "return true;" or success.  If we have an error, then
> we should return false.
> 
> Fixes: 3d81d589d6e3 ("drm/i915: Test exhaustion of the mmap space")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> Not tested.  In theory it's correct, but when you're adding new error
> paths it's always good to test.
> 
>  drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c b/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c
> index ef7c74cff28a..43912e9b683d 100644
> --- a/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c
> +++ b/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c
> @@ -570,7 +570,7 @@ static bool assert_mmap_offset(struct drm_i915_private *i915,
>  
>         obj = i915_gem_object_create_internal(i915, size);
>         if (IS_ERR(obj))
> -               return PTR_ERR(obj);
> +               return false;

"This is not the error you are looking for"

Fits the use,
Reviewed-by: Chris Wilson <chris@chris-wilson.co.uk>
-Chris
