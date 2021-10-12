Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5E24642A79B
	for <lists+kernel-janitors@lfdr.de>; Tue, 12 Oct 2021 16:47:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237248AbhJLOtg (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Tue, 12 Oct 2021 10:49:36 -0400
Received: from mga04.intel.com ([192.55.52.120]:17640 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236637AbhJLOtd (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 12 Oct 2021 10:49:33 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10135"; a="225943036"
X-IronPort-AV: E=Sophos;i="5.85,367,1624345200"; 
   d="scan'208";a="225943036"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2021 07:47:30 -0700
X-IronPort-AV: E=Sophos;i="5.85,367,1624345200"; 
   d="scan'208";a="625975427"
Received: from pmnk-mobl1.gar.corp.intel.com (HELO [10.249.254.42]) ([10.249.254.42])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2021 07:47:27 -0700
Message-ID: <c49654d9-7174-f6db-e64b-bec3ecde7b5c@linux.intel.com>
Date:   Tue, 12 Oct 2021 16:47:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH][next] drm/i915: Fix dereference of pointer backup before
 it is null checked
Content-Language: en-US
To:     Colin King <colin.king@canonical.com>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Matthew Auld <matthew.auld@intel.com>,
        intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20211012132549.260089-1-colin.king@canonical.com>
From:   =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= 
        <thomas.hellstrom@linux.intel.com>
In-Reply-To: <20211012132549.260089-1-colin.king@canonical.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hi,

On 10/12/21 15:25, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
>
> The assignment of pointer backup_bo dereferences pointer backup before
> backup is null checked, this could lead to a null pointer dereference
> issue. Fix this by only assigning backup_bo after backup has been null
> checked.
>
> Addresses-Coverity: ("Dereference before null check")
> Fixes: c56ce9565374 ("drm/i915 Implement LMEM backup and restore for suspend / resume")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

There's not really a pointer dereference here, just pointer arithmetics, 
so the code should be safe (but admittedly fragile), so to keep Coverity 
happy,

Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>



> ---
>   drivers/gpu/drm/i915/gem/i915_gem_ttm_pm.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm_pm.c b/drivers/gpu/drm/i915/gem/i915_gem_ttm_pm.c
> index 3b6d14b5c604..4ec6c557083a 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_ttm_pm.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm_pm.c
> @@ -149,7 +149,7 @@ static int i915_ttm_restore(struct i915_gem_apply_to_region *apply,
>   	struct i915_gem_ttm_pm_apply *pm_apply =
>   		container_of(apply, typeof(*pm_apply), base);
>   	struct drm_i915_gem_object *backup = obj->ttm.backup;
> -	struct ttm_buffer_object *backup_bo = i915_gem_to_ttm(backup);
> +	struct ttm_buffer_object *backup_bo;
>   	struct ttm_operation_ctx ctx = {};
>   	int err;
>   
> @@ -163,6 +163,8 @@ static int i915_ttm_restore(struct i915_gem_apply_to_region *apply,
>   	if (err)
>   		return err;
>   
> +	backup_bo = i915_gem_to_ttm(backup);
> +
>   	/* Content may have been swapped. */
>   	err = ttm_tt_populate(backup_bo->bdev, backup_bo->ttm, &ctx);
>   	if (!err) {
