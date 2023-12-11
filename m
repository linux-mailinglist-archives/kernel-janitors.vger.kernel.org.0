Return-Path: <kernel-janitors+bounces-650-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0414A80C52D
	for <lists+kernel-janitors@lfdr.de>; Mon, 11 Dec 2023 10:49:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B1DC42811C7
	for <lists+kernel-janitors@lfdr.de>; Mon, 11 Dec 2023 09:48:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37309219F4;
	Mon, 11 Dec 2023 09:48:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kJoMB1IA"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A05CBC;
	Mon, 11 Dec 2023 01:48:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702288129; x=1733824129;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=ic0GPJBgQ3YvW998HxkEiapTj7oEIaYPrJU331ugKoc=;
  b=kJoMB1IAuSxV2QBuYbp0VbXzRBG9m3eKQRr3ZnAC/5JVXso+8OKLmb41
   fLPN/Xjfz8QhUhAu54HaQOCbKk9kT9yQvRb9jjjyzqwsAJLiuPaJz6nt4
   sk0HnLBUa6FgtMylBie3I/eAo5pPCc/H2ytLDnYRoLZVBgb1gehIvTq2+
   IukBlBxg+VKSqE81vDoBPnlNQTcR4KxRj3H9E1yQhTnn/8rw+0b9Uznvg
   bC+n3CxfLEhWKx7x0xyGlcXBtUdPGLP1oNW94Ht/Gix/YjpuTG0it4ebu
   HYeJygJttxhGA7mKHT61FSffiM/yK7AVFnBiE//z+rwVBAdfuYEHp0R/7
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10920"; a="1433429"
X-IronPort-AV: E=Sophos;i="6.04,267,1695711600"; 
   d="scan'208";a="1433429"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2023 01:48:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10920"; a="749220838"
X-IronPort-AV: E=Sophos;i="6.04,267,1695711600"; 
   d="scan'208";a="749220838"
Received: from kbalak2x-mobl1.ger.corp.intel.com (HELO localhost) ([10.252.63.68])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2023 01:48:44 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Colin Ian King <colin.i.king@gmail.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH][next] drm/i915/selftests: Fix spelling mistake
 "initialiased" -> "initialised"
In-Reply-To: <20231209230541.4055786-1-colin.i.king@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20231209230541.4055786-1-colin.i.king@gmail.com>
Date: Mon, 11 Dec 2023 11:48:41 +0200
Message-ID: <87v895xe6e.fsf@intel.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Sat, 09 Dec 2023, Colin Ian King <colin.i.king@gmail.com> wrote:
> There is a spelling mistake in a pr_err error message. Fix it.
>
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>

Thanks, pushed to drm-intel-gt-next.

BR,
Jani.

> ---
>  drivers/gpu/drm/i915/gem/selftests/i915_gem_dmabuf.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/i915/gem/selftests/i915_gem_dmabuf.c b/drivers/gpu/drm/i915/gem/selftests/i915_gem_dmabuf.c
> index e57f9390076c..d684a70f2c04 100644
> --- a/drivers/gpu/drm/i915/gem/selftests/i915_gem_dmabuf.c
> +++ b/drivers/gpu/drm/i915/gem/selftests/i915_gem_dmabuf.c
> @@ -504,7 +504,7 @@ static int igt_dmabuf_export_vmap(void *arg)
>  	}
>  
>  	if (memchr_inv(ptr, 0, dmabuf->size)) {
> -		pr_err("Exported object not initialiased to zero!\n");
> +		pr_err("Exported object not initialised to zero!\n");
>  		err = -EINVAL;
>  		goto out;
>  	}

-- 
Jani Nikula, Intel

