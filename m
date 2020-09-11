Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5A2C126606B
	for <lists+kernel-janitors@lfdr.de>; Fri, 11 Sep 2020 15:39:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726197AbgIKNjQ (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Fri, 11 Sep 2020 09:39:16 -0400
Received: from 3.mo4.mail-out.ovh.net ([46.105.57.129]:50128 "EHLO
        3.mo4.mail-out.ovh.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726290AbgIKN2m (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 11 Sep 2020 09:28:42 -0400
X-Greylist: delayed 2380 seconds by postgrey-1.27 at vger.kernel.org; Fri, 11 Sep 2020 09:28:41 EDT
Received: from player687.ha.ovh.net (unknown [10.108.42.215])
        by mo4.mail-out.ovh.net (Postfix) with ESMTP id D965E24D324
        for <kernel-janitors@vger.kernel.org>; Fri, 11 Sep 2020 14:11:17 +0200 (CEST)
Received: from etezian.org (213-243-141-64.bb.dnainternet.fi [213.243.141.64])
        (Authenticated sender: andi@etezian.org)
        by player687.ha.ovh.net (Postfix) with ESMTPSA id 75C9B16043999;
        Fri, 11 Sep 2020 12:11:08 +0000 (UTC)
Authentication-Results: garm.ovh; auth=pass (GARM-98R00271dcdf64-20b9-4627-bc39-206d89f9c972,
                    3D0851B72870E27FC52B1A01C0C35111A9395DFF) smtp.auth=andi@etezian.org
Date:   Fri, 11 Sep 2020 15:11:07 +0300
From:   Andi Shyti <andi@etezian.org>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Jani Nikula <jani.nikula@linux.intel.com>,
        kernel-janitors@vger.kernel.org, David Airlie <airlied@linux.ie>,
        intel-gfx@lists.freedesktop.org,
        Chris Wilson <chris@chris-wilson.co.uk>,
        Thomas =?iso-8859-15?Q?Hellstr=F6m?= <thomas.hellstrom@intel.com>,
        Matthew Auld <matthew.auld@intel.com>
Subject: Re: [Intel-gfx] [PATCH] drm/i915/selftests: test the correct
 variable in igt_gem_ww_ctx()
Message-ID: <20200911121107.GA2330@jack.zhora.eu>
References: <20200911113414.GC367487@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200911113414.GC367487@mwanda>
X-Ovh-Tracer-Id: 7594476348348744296
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduiedrudehledghedvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvffukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpeetnhguihcuufhhhihtihcuoegrnhguihesvghtvgiiihgrnhdrohhrgheqnecuggftrfgrthhtvghrnheptdfgudduhfefueeujeefieehtdeftefggeevhefgueellefhudetgeeikeduieefnecukfhppedtrddtrddtrddtpddvudefrddvgeefrddugedurdeigeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehplhgrhigvrheikeejrdhhrgdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheprghnughisegvthgviihirghnrdhorhhgpdhrtghpthhtohepkhgvrhhnvghlqdhjrghnihhtohhrshesvhhgvghrrdhkvghrnhgvlhdrohhrgh
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hi Dan,

> There is a copy and paste error here.  The "obj" should be "obj2".  The
> current code could result in an Oops.
> 
> Fixes: 80f0b679d6f0 ("drm/i915: Add an implementation for i915_gem_ww_ctx locking, v2.")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  drivers/gpu/drm/i915/selftests/i915_gem.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/selftests/i915_gem.c b/drivers/gpu/drm/i915/selftests/i915_gem.c
> index 23a6132c5f4e..412e21604a05 100644
> --- a/drivers/gpu/drm/i915/selftests/i915_gem.c
> +++ b/drivers/gpu/drm/i915/selftests/i915_gem.c
> @@ -211,8 +211,8 @@ static int igt_gem_ww_ctx(void *arg)
>  		return PTR_ERR(obj);
>  
>  	obj2 = i915_gem_object_create_internal(i915, PAGE_SIZE);
> -	if (IS_ERR(obj)) {
> -		err = PTR_ERR(obj);
> +	if (IS_ERR(obj2)) {
> +		err = PTR_ERR(obj2);
>  		goto put1;
>  	}

ops...

Reviewed-by: Andi Shyti <andi.shyti@intel.com>

Thanks,
Andi
