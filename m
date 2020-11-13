Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D599F2B1941
	for <lists+kernel-janitors@lfdr.de>; Fri, 13 Nov 2020 11:43:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726308AbgKMKnT (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Fri, 13 Nov 2020 05:43:19 -0500
Received: from mx2.suse.de ([195.135.220.15]:43680 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726237AbgKMKnT (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 13 Nov 2020 05:43:19 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 2163FABD1;
        Fri, 13 Nov 2020 10:43:18 +0000 (UTC)
Subject: Re: [PATCH] drm/udl: Fix missing error code in udl_handle_damage()
To:     Dan Carpenter <dan.carpenter@oracle.com>,
        Dave Airlie <airlied@redhat.com>
Cc:     Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Emil Velikov <emil.velikov@collabora.com>,
        Gerd Hoffmann <kraxel@redhat.com>,
        dri-devel@lists.freedesktop.org, kernel-janitors@vger.kernel.org
References: <20201113101502.GD168908@mwanda>
From:   Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <3c055831-29e4-e03e-c7cc-3acb791688c7@suse.de>
Date:   Fri, 13 Nov 2020 11:43:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201113101502.GD168908@mwanda>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hi

Am 13.11.20 um 11:15 schrieb Dan Carpenter:
> If udl_get_urb() fails then this should return a negative error code
> but currently it returns success.
> 
> Fixes: 798ce3fe1c3a ("drm/udl: Begin/end access to imported buffers in damage-handler")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>

Thanks for the patch. As it has a Fixes tag, it's probably worth taking
for silencing compiler warnings alone. I'll add it to the tree.

In practice, it doesn't really matter. udl_handle_damage() is running
during the DRM commit phase and it's too late to handle errors. We could
as well convert the the function to void.

Best regards
Thomas

> ---
>  drivers/gpu/drm/udl/udl_modeset.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/udl/udl_modeset.c b/drivers/gpu/drm/udl/udl_modeset.c
> index 42eeba1dfdbf..9d34ec9d03f6 100644
> --- a/drivers/gpu/drm/udl/udl_modeset.c
> +++ b/drivers/gpu/drm/udl/udl_modeset.c
> @@ -305,8 +305,10 @@ static int udl_handle_damage(struct drm_framebuffer *fb, int x, int y,
>  	vaddr = map.vaddr; /* TODO: Use mapping abstraction properly */
>  
>  	urb = udl_get_urb(dev);
> -	if (!urb)
> +	if (!urb) {
> +		ret = -ENOMEM;
>  		goto out_drm_gem_shmem_vunmap;
> +	}
>  	cmd = urb->transfer_buffer;
>  
>  	for (i = clip.y1; i < clip.y2; i++) {
> 

-- 
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 Nürnberg, Germany
(HRB 36809, AG Nürnberg)
Geschäftsführer: Felix Imendörffer
