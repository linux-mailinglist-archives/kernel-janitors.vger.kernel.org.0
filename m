Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4F174443BB
	for <lists+kernel-janitors@lfdr.de>; Thu, 13 Jun 2019 18:34:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389084AbfFMQbr (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Thu, 13 Jun 2019 12:31:47 -0400
Received: from mail-ed1-f67.google.com ([209.85.208.67]:45128 "EHLO
        mail-ed1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730867AbfFMIVw (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 13 Jun 2019 04:21:52 -0400
Received: by mail-ed1-f67.google.com with SMTP id a14so28066286edv.12
        for <kernel-janitors@vger.kernel.org>; Thu, 13 Jun 2019 01:21:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=sender:date:from:to:cc:subject:message-id:mail-followup-to
         :references:mime-version:content-disposition
         :content-transfer-encoding:in-reply-to:user-agent;
        bh=/5Q5aUaRAcEEPNriaL09NE2LBrtuC+UfFWkB6hD3AL0=;
        b=CNPZ9BSaAlskYq9oJPK3nw+RHvlOS+kmhCaPVmRqdv2KGR7tiu8aOdrFbya1btWYrV
         /LL4gCUeCIqqlSTrQRyon/4otVWW808zDERPOuLa1zZ/UvAr46hYZgQ5D+TFonXqs0e5
         6FRikD9geEaT5shYlUm40D03a+O3W7C6AcYwE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :mail-followup-to:references:mime-version:content-disposition
         :content-transfer-encoding:in-reply-to:user-agent;
        bh=/5Q5aUaRAcEEPNriaL09NE2LBrtuC+UfFWkB6hD3AL0=;
        b=ERtb3vKfRGLbyVL2c9gjJYAaG0tqrDZ+2q+lbhDqltQt9YkJsIH9PmSwKuAMApKBj8
         lO70zs3lrEmFoRagxoA/nsWEf02SS8XjTUN6FdhgMPeGWRCE8/8p17/L2mBqplvfqLub
         6n+i5HvryBg3LvRZvTJmJ4rCK11hPvbmIrlTCeQZHGjDKYegvUgBRWVRbpzcNp5qBG/G
         K/iabVmf2h6JnwrekG7Rany1UTXZnTus4wMuE/mcrFN4ykRhheIanByvRAeROIr6BZkf
         c0fW+s320JCgcFLLyPl4PnzwilqnnDSZd0oVXIwWuSQrbBIaiUdCZap65RSsOAdzSW2p
         ddDQ==
X-Gm-Message-State: APjAAAWTOsor0sUHvCLz5ovIMfCwzhaYzp+PBUEUI2b+L1bt5X3M65PC
        WJ3zr2YFtpntREtJUCbBVlPmng==
X-Google-Smtp-Source: APXvYqyuHNHI3b36rm4k6jVjf5YQ4S6ebCAH64O/yrmvhY4OJMhpcxY3jnmxNU5QJu6XRHEVCYxqiw==
X-Received: by 2002:a50:97c8:: with SMTP id f8mr45283000edb.176.1560414110413;
        Thu, 13 Jun 2019 01:21:50 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
        by smtp.gmail.com with ESMTPSA id z10sm684614edl.35.2019.06.13.01.21.49
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Thu, 13 Jun 2019 01:21:49 -0700 (PDT)
Date:   Thu, 13 Jun 2019 10:21:47 +0200
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
Cc:     Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org, intel-gfx@lists.freedesktop.org
Subject: Re: [RESEND PATCH V3] drm/drm_vblank: Change EINVAL by the correct
 errno
Message-ID: <20190613082147.GG23020@phenom.ffwll.local>
Mail-Followup-To: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org, intel-gfx@lists.freedesktop.org
References: <20190613021054.cdewdb3azy6zuoyw@smtp.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190613021054.cdewdb3azy6zuoyw@smtp.gmail.com>
X-Operating-System: Linux phenom 4.19.0-5-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Wed, Jun 12, 2019 at 11:10:54PM -0300, Rodrigo Siqueira wrote:
> For historical reason, the function drm_wait_vblank_ioctl always return
> -EINVAL if something gets wrong. This scenario limits the flexibility
> for the userspace make detailed verification of the problem and take
> some action. In particular, the validation of “if (!dev->irq_enabled)”
> in the drm_wait_vblank_ioctl is responsible for checking if the driver
> support vblank or not. If the driver does not support VBlank, the
> function drm_wait_vblank_ioctl returns EINVAL which does not represent
> the real issue; this patch changes this behavior by return EOPNOTSUPP.
> Additionally, some operations are unsupported by this function, and
> returns EINVAL; this patch also changes the return value to EOPNOTSUPP
> in this case. Lastly, the function drm_wait_vblank_ioctl is invoked by
> libdrm, which is used by many compositors; because of this, it is
> important to check if this change breaks any compositor. In this sense,
> the following projects were examined:
> 
> * Drm-hwcomposer
> * Kwin
> * Sway
> * Wlroots
> * Wayland-core
> * Weston
> * Xorg (67 different drivers)
> 
> For each repository the verification happened in three steps:
> 
> * Update the main branch
> * Look for any occurrence "drmWaitVBlank" with the command:
>   git grep -n "drmWaitVBlank"
> * Look in the git history of the project with the command:
>   git log -SdrmWaitVBlank
> 
> Finally, none of the above projects validate the use of EINVAL which
> make safe, at least for these projects, to change the return values.
> 
> Change since V2:
>  Daniel Vetter and Chris Wilson
>  - Replace ENOTTY by EOPNOTSUPP
>  - Return EINVAL if the parameters are wrong
> 
> Signed-off-by: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
> ---
> Update:
>   Now IGT has a way to validate if a driver has vblank support or not.
>   See: https://gitlab.freedesktop.org/drm/igt-gpu-tools/commit/2d244aed69165753f3adbbd6468db073dc1acf9A
> 
>  drivers/gpu/drm/drm_vblank.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_vblank.c b/drivers/gpu/drm/drm_vblank.c
> index 0d704bddb1a6..d76a783a7d4b 100644
> --- a/drivers/gpu/drm/drm_vblank.c
> +++ b/drivers/gpu/drm/drm_vblank.c
> @@ -1578,10 +1578,10 @@ int drm_wait_vblank_ioctl(struct drm_device *dev, void *data,
>  	unsigned int flags, pipe, high_pipe;
>  
>  	if (!dev->irq_enabled)
> -		return -EINVAL;
> +		return -EOPNOTSUPP;
>  
>  	if (vblwait->request.type & _DRM_VBLANK_SIGNAL)
> -		return -EINVAL;
> +		return -EOPNOTSUPP;

Not sure we want EINVAL here, that's kinda a "parameters are wrong"
version too. With that changed:

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

>  
>  	if (vblwait->request.type &
>  	    ~(_DRM_VBLANK_TYPES_MASK | _DRM_VBLANK_FLAGS_MASK |
> -- 
> 2.21.0



-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
