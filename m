Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 187F0266174
	for <lists+kernel-janitors@lfdr.de>; Fri, 11 Sep 2020 16:45:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726182AbgIKOo4 (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Fri, 11 Sep 2020 10:44:56 -0400
Received: from mga18.intel.com ([134.134.136.126]:7894 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726191AbgIKNCj (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 11 Sep 2020 09:02:39 -0400
IronPort-SDR: essByzYA2iu0FuVwnkacosJqQe0YkGUu5boWExB0IZ8yP9kguQPPygj3orsaMCEaram6zozXvh
 n9sL8g49dnEA==
X-IronPort-AV: E=McAfee;i="6000,8403,9740"; a="146480436"
X-IronPort-AV: E=Sophos;i="5.76,415,1592895600"; 
   d="scan'208";a="146480436"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2020 06:02:38 -0700
IronPort-SDR: Nx+vspf96P+MLYgSd6gs6IYGfBXEM5+kyYtjZjE821A3B6Ry7IitqVB4Rs7NVIf1ANfrhF6Y5V
 GztvL2/GwPWQ==
X-IronPort-AV: E=Sophos;i="5.76,415,1592895600"; 
   d="scan'208";a="481318453"
Received: from mlankri-mobl.ger.corp.intel.com (HELO [10.214.208.240]) ([10.214.208.240])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2020 06:02:32 -0700
Subject: Re: [Intel-gfx] [PATCH] drm/i915/selftests: test the correct variable
 in igt_gem_ww_ctx()
To:     Dan Carpenter <dan.carpenter@oracle.com>,
        Jani Nikula <jani.nikula@linux.intel.com>
Cc:     kernel-janitors@vger.kernel.org, David Airlie <airlied@linux.ie>,
        intel-gfx@lists.freedesktop.org,
        Chris Wilson <chris@chris-wilson.co.uk>,
        =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@intel.com>,
        Matthew Auld <matthew.auld@intel.com>
References: <20200911113414.GC367487@mwanda>
From:   Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
Message-ID: <2c117e1e-2d51-a649-62df-7f9034dfe6cd@linux.intel.com>
Date:   Fri, 11 Sep 2020 14:02:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200911113414.GC367487@mwanda>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org


On 11/09/2020 12:34, Dan Carpenter wrote:
> There is a copy and paste error here.  The "obj" should be "obj2".  The
> current code could result in an Oops.
> 
> Fixes: 80f0b679d6f0 ("drm/i915: Add an implementation for i915_gem_ww_ctx locking, v2.")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>   drivers/gpu/drm/i915/selftests/i915_gem.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/selftests/i915_gem.c b/drivers/gpu/drm/i915/selftests/i915_gem.c
> index 23a6132c5f4e..412e21604a05 100644
> --- a/drivers/gpu/drm/i915/selftests/i915_gem.c
> +++ b/drivers/gpu/drm/i915/selftests/i915_gem.c
> @@ -211,8 +211,8 @@ static int igt_gem_ww_ctx(void *arg)
>   		return PTR_ERR(obj);
>   
>   	obj2 = i915_gem_object_create_internal(i915, PAGE_SIZE);
> -	if (IS_ERR(obj)) {
> -		err = PTR_ERR(obj);
> +	if (IS_ERR(obj2)) {
> +		err = PTR_ERR(obj2);
>   		goto put1;
>   	}
>   
> 
Oopsie I did point this out in review! (msgid 
c03481f1-92c2-24ad-b56e-a92fbb70f9fe@linux.intel.com)

Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Regards,

Tvrtko
