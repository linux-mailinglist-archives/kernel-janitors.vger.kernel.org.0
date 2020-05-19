Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0E2C51D94BA
	for <lists+kernel-janitors@lfdr.de>; Tue, 19 May 2020 12:49:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728515AbgESKtz (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Tue, 19 May 2020 06:49:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50634 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726508AbgESKtz (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 19 May 2020 06:49:55 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC962C061A0C
        for <kernel-janitors@vger.kernel.org>; Tue, 19 May 2020 03:49:54 -0700 (PDT)
Received: from gallifrey.ext.pengutronix.de ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=localhost)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <l.stach@pengutronix.de>)
        id 1jazoU-00061m-TM; Tue, 19 May 2020 12:49:34 +0200
Message-ID: <20aa90bd9004e24d6e79968fa03a97d2030bf013.camel@pengutronix.de>
Subject: Re: [PATCH] drm/etnaviv: Fix a leak in submit_pin_objects()
From:   Lucas Stach <l.stach@pengutronix.de>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Russell King <linux+etnaviv@armlinux.org.uk>,
        Christian Gmeiner <christian.gmeiner@gmail.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Guido =?ISO-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        kernel-janitors@vger.kernel.org
Date:   Tue, 19 May 2020 12:49:33 +0200
In-Reply-To: <20200518112955.GA48709@mwanda>
References: <20200518112955.GA48709@mwanda>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.2 (3.36.2-1.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2001:67c:670:201:5054:ff:fe8d:eefb
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: kernel-janitors@vger.kernel.org
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Am Montag, den 18.05.2020, 14:29 +0300 schrieb Dan Carpenter:
> If the mapping address is wrong then we have to release the reference to
> it before returning -EINVAL.
> 
> Fixes: 088880ddc0b2 ("drm/etnaviv: implement softpin")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Thanks, applied to etnaviv/fixes.

Regards,
Lucas

> ---
> From static analysis.  Untested.
> 
>  drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c b/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c
> index 3b0afa156d92..54def341c1db 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c
> @@ -238,8 +238,10 @@ static int submit_pin_objects(struct etnaviv_gem_submit *submit)
>  		}
>  
>  		if ((submit->flags & ETNA_SUBMIT_SOFTPIN) &&
> -		     submit->bos[i].va != mapping->iova)
> +		     submit->bos[i].va != mapping->iova) {
> +			etnaviv_gem_mapping_unreference(mapping);
>  			return -EINVAL;
> +		}
>  
>  		atomic_inc(&etnaviv_obj->gpu_active);
>  

