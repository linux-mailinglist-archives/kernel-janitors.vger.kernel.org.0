Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D7BE713099
	for <lists+kernel-janitors@lfdr.de>; Fri,  3 May 2019 16:41:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726444AbfECOlR (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Fri, 3 May 2019 10:41:17 -0400
Received: from usa-sjc-mx-foss1.foss.arm.com ([217.140.101.70]:35088 "EHLO
        foss.arm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725283AbfECOlR (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 3 May 2019 10:41:17 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CD048374;
        Fri,  3 May 2019 07:41:16 -0700 (PDT)
Received: from e110455-lin.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.72.51.249])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9B1DC3F5C1;
        Fri,  3 May 2019 07:41:16 -0700 (PDT)
Received: by e110455-lin.cambridge.arm.com (Postfix, from userid 1000)
        id DF83E68240F; Fri,  3 May 2019 15:41:14 +0100 (BST)
Date:   Fri, 3 May 2019 15:41:14 +0100
From:   Liviu Dudau <liviu.dudau@arm.com>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     "James (Qian) Wang" <james.qian.wang@arm.com>,
        Brian Starkey <brian.starkey@arm.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        dri-devel@lists.freedesktop.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] drm/komeda: Potential error pointer dereference
Message-ID: <20190503144114.GF15144@e110455-lin.cambridge.arm.com>
References: <20190503122525.GA29695@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190503122525.GA29695@mwanda>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Fri, May 03, 2019 at 03:25:25PM +0300, Dan Carpenter wrote:
> We need to check whether drm_atomic_get_crtc_state() returns an error
> pointer before dereferencing "crtc_st".
> 
> Fixes: 7d31b9e7a550 ("drm/komeda: Add komeda_plane/plane_helper_funcs")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Acked-by: Liviu Dudau <liviu.dudau@arm.com>

I'll pull this and send it as a fix after -rc1.

Best regards,
Liviu

> ---
>  drivers/gpu/drm/arm/display/komeda/komeda_plane.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_plane.c b/drivers/gpu/drm/arm/display/komeda/komeda_plane.c
> index 07ed0cc1bc44..c7e5fc6e5500 100644
> --- a/drivers/gpu/drm/arm/display/komeda/komeda_plane.c
> +++ b/drivers/gpu/drm/arm/display/komeda/komeda_plane.c
> @@ -64,7 +64,7 @@ komeda_plane_atomic_check(struct drm_plane *plane,
>  		return 0;
>  
>  	crtc_st = drm_atomic_get_crtc_state(state->state, state->crtc);
> -	if (!crtc_st->enable) {
> +	if (IS_ERR(crtc_st) || !crtc_st->enable) {
>  		DRM_DEBUG_ATOMIC("Cannot update plane on a disabled CRTC.\n");
>  		return -EINVAL;
>  	}
> -- 
> 2.18.0
> 

-- 
====================
| I would like to |
| fix the world,  |
| but they're not |
| giving me the   |
 \ source code!  /
  ---------------
    ¯\_(ツ)_/¯
