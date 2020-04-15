Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0A95D1A9C2A
	for <lists+kernel-janitors@lfdr.de>; Wed, 15 Apr 2020 13:26:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2896955AbgDOLZi (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Wed, 15 Apr 2020 07:25:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38430 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2896947AbgDOLZ1 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 15 Apr 2020 07:25:27 -0400
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E3322C061A0C
        for <kernel-janitors@vger.kernel.org>; Wed, 15 Apr 2020 04:25:26 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id g12so10696126wmh.3
        for <kernel-janitors@vger.kernel.org>; Wed, 15 Apr 2020 04:25:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:mail-followup-to:references
         :mime-version:content-disposition:in-reply-to;
        bh=apXLkj8/Y6/Je/J3pw9VYIeGtZznbEDSTaodMw9SIP8=;
        b=CtHkHYlCnlsa+tUc8/F7g7a0/P6u8ejT1ayfSACtu0kpWhs3EFaqXHsG66HdK2TqVO
         1YepPve4g/tteoWGzn/BId3gVqa0gSrcAXKoX7yewG/1H0vQN4Qe2Pn7YxQ/IdDn6tw3
         UgUpHRyZ0gelkfNm/V6/st91NhPu8ozpGjQpo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id
         :mail-followup-to:references:mime-version:content-disposition
         :in-reply-to;
        bh=apXLkj8/Y6/Je/J3pw9VYIeGtZznbEDSTaodMw9SIP8=;
        b=mbKR/unS/wpOCcRMuOkr9pjqQszP1D+DK22rjiTJpmphGBWymS+qbVTopDSkMp7jXM
         JMkR6H/NNY1CgAc/+ey6MW/myd762LZtdU21Z3sAT5Vtu5qh59ZL4kWfSZ6X3gP8Sweb
         G2Xyb+/BRHVMKMwKukr9gCybyoEMXkD8Ojfktf6GPPewwF4mxD9TA1M+netPp6qPYUGY
         t8OjM4VINVXqJPUrEhJL4eF+EZRLIqTcPzVH8YrgVPXGKaAomqfX/r3I7vUhB3RFQbMv
         rKJuyUbnYoxsbunh81vynIJejq7QQXnk1vHUe89wWi2XQA1mjdr1vH5xyQkSw3RGrfFd
         EEIw==
X-Gm-Message-State: AGi0PuaHO0VAVqphTNrMsOie24VxSOpJIDPTU/jg7Oj7GkbfxBQ3vwP0
        oQYiujFag9LqO6wNul8gdYkNXWJp09c=
X-Google-Smtp-Source: APiQypLPhakDBiE4HRC90MnW5/bRC2vpIu2AQD3Xvb6Y3wPK7412N1qq31ytrTaUWKirLB1NJ1AesQ==
X-Received: by 2002:a1c:7c13:: with SMTP id x19mr4706062wmc.124.1586949925687;
        Wed, 15 Apr 2020 04:25:25 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id w3sm4358429wrc.18.2020.04.15.04.25.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2020 04:25:25 -0700 (PDT)
Date:   Wed, 15 Apr 2020 13:25:23 +0200
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Colin King <colin.king@canonical.com>
Cc:     Sandy Huang <hjc@rock-chips.com>,
        Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        dri-devel@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org,
        kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH][next] drm/rockchip: fix spelling mistake "modifer" ->
 "modifier"
Message-ID: <20200415112523.GA3456981@phenom.ffwll.local>
Mail-Followup-To: Colin King <colin.king@canonical.com>,
        Sandy Huang <hjc@rock-chips.com>,
        Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>,
        David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, kernel-janitors@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20200415083420.366279-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200415083420.366279-1-colin.king@canonical.com>
X-Operating-System: Linux phenom 5.3.0-3-amd64 
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Wed, Apr 15, 2020 at 09:34:20AM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> There is a spelling mistake in a DRM_DEBUG_KMS debug message. Fix it.
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Queued for 5.8, thanks for your patch.
-Daniel

> ---
>  drivers/gpu/drm/rockchip/rockchip_drm_vop.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
> index b87d22eb6ae1..33463b79a37b 100644
> --- a/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
> +++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
> @@ -769,7 +769,7 @@ static bool rockchip_mod_supported(struct drm_plane *plane,
>  		return true;
>  
>  	if (!rockchip_afbc(modifier)) {
> -		DRM_DEBUG_KMS("Unsupported format modifer 0x%llx\n", modifier);
> +		DRM_DEBUG_KMS("Unsupported format modifier 0x%llx\n", modifier);
>  
>  		return false;
>  	}
> -- 
> 2.25.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
