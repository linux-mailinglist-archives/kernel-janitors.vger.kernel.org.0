Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C9ED34B352
	for <lists+kernel-janitors@lfdr.de>; Wed, 19 Jun 2019 09:49:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731227AbfFSHtC (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Wed, 19 Jun 2019 03:49:02 -0400
Received: from mail-ed1-f67.google.com ([209.85.208.67]:39796 "EHLO
        mail-ed1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731187AbfFSHtC (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 19 Jun 2019 03:49:02 -0400
Received: by mail-ed1-f67.google.com with SMTP id m10so25756854edv.6
        for <kernel-janitors@vger.kernel.org>; Wed, 19 Jun 2019 00:49:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=sender:date:from:to:cc:subject:message-id:mail-followup-to
         :references:mime-version:content-disposition
         :content-transfer-encoding:in-reply-to:user-agent;
        bh=9yRPqLsy9SzgWIOIK5gO9H41NqMgtH7z8Lf0epnTSe8=;
        b=jWHFk6XqsoYXocFpSE0gn/gHZJ/0TrxElZKm42Ipe0ZdlxBiXBmyo9fX4/WGgeDDO3
         8AYZ0F+ufO1zlDHVBmH9vwwSvpWZI8HJCpZq3I4Sx2ZL54GWsm81cgHwZAzplxF8c3Me
         oI3KswqH2dD74mtl53UCCeWZ6zPk1dUxbOPMc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :mail-followup-to:references:mime-version:content-disposition
         :content-transfer-encoding:in-reply-to:user-agent;
        bh=9yRPqLsy9SzgWIOIK5gO9H41NqMgtH7z8Lf0epnTSe8=;
        b=rr8qMhthRCVMna2LdFbKd/bFQOHxHpXHHuZT/W7bAPBYaGNsr9wWYPqiI7OhuFSVku
         YIRlCFX9vJkZtSL2/S2WZuWgaNIg0idBCRQ6hxVEvMbDdHtHIjM2LC1zD/oSdimGWKZY
         /C0H/FthOPMtXapPO7PVliem/toHhH3yL4HGqTN1TFen3qho+NDpQyyEa3hNgS1LS5oY
         8dGULwbSQw8S8vlYrHVSY/xCCoSPk8BEQveH/MARWz0q7U8bAm7sY7hpW8e5yHriEzlK
         Q1CsBAHFZ4F6C5025Xs2VoLQZAQqgiYCJZLJ4+t/l5+aOX5juwyFUXxkpxWfPB5ChAB8
         Xuhg==
X-Gm-Message-State: APjAAAXs3U1cr/7FxJ8CfCZIfHc0h1fG5yX2ZQVBXICh/qDuBtaWAhqB
        XjECYYdKqGuYVRQAimD64kj9lw==
X-Google-Smtp-Source: APXvYqzcQ/qJVFreUUsYyuaxNjvBsBySdJhnXRVOLZg1dyo7u4fZwHatDwiE/NN42tCU6BsQTm39fg==
X-Received: by 2002:a50:883b:: with SMTP id b56mr36295341edb.178.1560930540342;
        Wed, 19 Jun 2019 00:49:00 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
        by smtp.gmail.com with ESMTPSA id x4sm5546030eda.22.2019.06.19.00.48.59
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Wed, 19 Jun 2019 00:48:59 -0700 (PDT)
Date:   Wed, 19 Jun 2019 09:48:56 +0200
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
Cc:     Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org, intel-gfx@lists.freedesktop.org
Subject: Re: [PATCH V4] drm/drm_vblank: Change EINVAL by the correct errno
Message-ID: <20190619074856.GJ12905@phenom.ffwll.local>
Mail-Followup-To: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org, intel-gfx@lists.freedesktop.org
References: <20190619020750.swzerehjbvx6sbk2@smtp.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190619020750.swzerehjbvx6sbk2@smtp.gmail.com>
X-Operating-System: Linux phenom 4.19.0-5-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Tue, Jun 18, 2019 at 11:07:50PM -0300, Rodrigo Siqueira wrote:
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
> Change since V3:
>  - Return EINVAL for _DRM_VBLANK_SIGNAL (Daniel)
> 
> Change since V2:
>  Daniel Vetter and Chris Wilson
>  - Replace ENOTTY by EOPNOTSUPP
>  - Return EINVAL if the parameters are wrong
> 

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

Apologies for the confusion on the last time around. btw if someone tells
you "r-b (or a-b) with these changes", then just apply the r-b/a-b tag
next time around. Otherwise people will re-review the same thing over and
over again.
-Daniel

> Signed-off-by: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
> ---
>  drivers/gpu/drm/drm_vblank.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/drm_vblank.c b/drivers/gpu/drm/drm_vblank.c
> index 603ab105125d..bed233361614 100644
> --- a/drivers/gpu/drm/drm_vblank.c
> +++ b/drivers/gpu/drm/drm_vblank.c
> @@ -1582,7 +1582,7 @@ int drm_wait_vblank_ioctl(struct drm_device *dev, void *data,
>  	unsigned int flags, pipe, high_pipe;
>  
>  	if (!dev->irq_enabled)
> -		return -EINVAL;
> +		return -EOPNOTSUPP;
>  
>  	if (vblwait->request.type & _DRM_VBLANK_SIGNAL)
>  		return -EINVAL;
> -- 
> 2.21.0

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
