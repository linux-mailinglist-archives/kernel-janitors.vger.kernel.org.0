Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 822157128F0
	for <lists+kernel-janitors@lfdr.de>; Fri, 26 May 2023 16:52:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237253AbjEZOwl (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Fri, 26 May 2023 10:52:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45490 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231470AbjEZOwk (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 26 May 2023 10:52:40 -0400
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2459D8
        for <kernel-janitors@vger.kernel.org>; Fri, 26 May 2023 07:52:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685112759; x=1716648759;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=TYHqY+6uZ4K+/S+mfbbQc3Y3deF/UlFCP2XDrRIQibQ=;
  b=O/lvJNfeE7uYMmbCYrnCTSJRAfn8FJs0LrvVTO6o5Cf5mzpym3wCLM0S
   r9PqSQvg8RzcU4HHlONs5imLFQIfXaMio6sgO74vLTm21foU89G1JUgyV
   aTl9Wf7WVRDh2ybXNyscy+MQnYOGZGHkbyeMyaQkgncHawQkL3a0bo++H
   Iau0S2HgBKytwurR8nbSDpllBJ/HQ47blzl4jyn5eY2uxhNGrVrd76WOR
   be0Sh/djFuiv9mZUI5D5IZWhFcVFLoTBzbX9P5Kkh2aG1GLRIecZ3AT4U
   HkRWkO9qXjg5NbAbxErhFcFAVGDQ7HYWnt6VLzT+sGGxE1/4uLDeUvH+F
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10722"; a="440572345"
X-IronPort-AV: E=Sophos;i="6.00,194,1681196400"; 
   d="scan'208";a="440572345"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2023 07:52:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10722"; a="655662574"
X-IronPort-AV: E=Sophos;i="6.00,194,1681196400"; 
   d="scan'208";a="655662574"
Received: from schoenfm-mobl1.ger.corp.intel.com (HELO intel.com) ([10.249.39.253])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2023 07:52:35 -0700
Date:   Fri, 26 May 2023 16:52:32 +0200
From:   Andi Shyti <andi.shyti@linux.intel.com>
To:     Dan Carpenter <dan.carpenter@linaro.org>
Cc:     Andi Shyti <andi.shyti@linux.intel.com>,
        Chris Wilson <chris@chris-wilson.co.uk>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Matthew Auld <matthew.auld@intel.com>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Thomas =?iso-8859-15?Q?Hellstr=F6m?= 
        <thomas.hellstrom@linux.intel.com>,
        intel-gfx@lists.freedesktop.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] drm/i915/selftests: fix an error code in copy()
Message-ID: <ZHDHsPpw5TRIbLkn@ashyti-mobl2.lan>
References: <f6b876f1-4dd7-4d96-bee5-966817cc1644@kili.mountain>
 <ZHCs2RU6+SNkq0GA@ashyti-mobl2.lan>
 <6b5fd74c-b98f-4e97-a562-e9739fd03873@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6b5fd74c-b98f-4e97-a562-e9739fd03873@kili.mountain>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hi Dan,

On Fri, May 26, 2023 at 04:14:25PM +0300, Dan Carpenter wrote:
> On Fri, May 26, 2023 at 02:58:01PM +0200, Andi Shyti wrote:
> > Hi Dan,
> > 
> > On Fri, May 26, 2023 at 02:59:31PM +0300, Dan Carpenter wrote:
> > > Return the error code if i915_gem_object_create_internal() fails,
> > > instead of returning success.
> > > 
> > > Fixes: cf586021642d ("drm/i915/gt: Pipelined page migration")
> > > Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> > > ---
> > >  drivers/gpu/drm/i915/gt/selftest_migrate.c | 4 +++-
> > >  1 file changed, 3 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/gpu/drm/i915/gt/selftest_migrate.c b/drivers/gpu/drm/i915/gt/selftest_migrate.c
> > > index e677f2da093d..a26429fd5326 100644
> > > --- a/drivers/gpu/drm/i915/gt/selftest_migrate.c
> > > +++ b/drivers/gpu/drm/i915/gt/selftest_migrate.c
> > > @@ -55,8 +55,10 @@ static int copy(struct intel_migrate *migrate,
> > >  
> > >  	sz = src->base.size;
> > >  	dst = i915_gem_object_create_internal(i915, sz);
> > > -	if (IS_ERR(dst))
> > > +	if (IS_ERR(dst)) {
> > > +		err = PTR_ERR(dst);
> > >  		goto err_free_src;
> > > +	}
> > 
> > I think it was intentional to return '0' when
> > i915_gem_object_create_internal() failed, as we are not testing
> > object creation here.
> > 
> > I don't really mind this patch, but, on the other hand, returning
> > an error value here might provide a biased information.
> 
> Something we could consider is to make it more obvious that it's
> intentional.  Smatch counts it as intentional if there is an "err = 0;"
> within a few lines of the goto.
> 
> But let's just leave it.  I've already marked this static checker
> warning as dealt with.  If I see it again and maybe that will motivate
> me to add an err = 0; assignment.  People imagine that kernel code must
> be 100% perfect with no static checker warnings etc but really it's
> almost the weekend and this is fine.

yes, I can accept an explicit "err = 0" with a comment on it. I
think it totally makes sense.

Do you want to do it or shall I take care of it?

Thanks,
Andi
