Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 941C81CA4CC
	for <lists+kernel-janitors@lfdr.de>; Fri,  8 May 2020 09:08:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726036AbgEHHIm (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Fri, 8 May 2020 03:08:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35760 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725991AbgEHHIm (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 8 May 2020 03:08:42 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3D5CC05BD09
        for <kernel-janitors@vger.kernel.org>; Fri,  8 May 2020 00:08:41 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id z8so602449wrw.3
        for <kernel-janitors@vger.kernel.org>; Fri, 08 May 2020 00:08:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:mail-followup-to:references
         :mime-version:content-disposition:in-reply-to;
        bh=DmTzp+J4aS4CxYYhCILNVwYfVehwX/dqCJCx5jKGlEM=;
        b=CEhHuPS/Sdlv7SlOF1Hc4wrg/jxQ0bfVMANuWCZjoRc8dNc/HsdgEoZO7HGBHXwoaf
         ruEIoF3gHK5AY6lSz66A+ROgs5JDNmxQyX5jJA9tVa0h0eLsOpexhZTVa8lNea46FiWB
         /GPsBiQ9zAcTAkVD8gFbnjr8OjE1EkxiL9eto=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id
         :mail-followup-to:references:mime-version:content-disposition
         :in-reply-to;
        bh=DmTzp+J4aS4CxYYhCILNVwYfVehwX/dqCJCx5jKGlEM=;
        b=UbAfJVj9amDJmkRoBCxgps/hu5WlfwhIsgofQgx0EhJ3aCB3RlrJEcCcm+jQSp2yUY
         my8z54PzZpQQjTCW5y7/q3P0siQxYlGAUNOlNxJkZtRD87Ymhzshkd4qRwTSVbqiCozJ
         j/iwKlmPFgil/SHyFXRgwqCP3ivV/23MtX7p7LT/k865zvmdLMHjjH4R9yJkL7mbDLub
         41edh5vu5qDDBVF7V0i5oPYe46AhKzzJhl04mDAuMnP5MAhhDi6JLlJ+zY7bD/yyIKsR
         2hFyhEA+MHkncVihMtNDyMP1IksDg9/ix3CS5EkeIs5zsRGdFUz/HCEZNjXN8atcbSNV
         MGvQ==
X-Gm-Message-State: AGi0PuZ2CuN1GLfjqxvz0c9dz1KfiI4B0WIhNPccST3nrAujp/Y+rODh
        DUah5zP4iunsq7oPP9xLg943tg==
X-Google-Smtp-Source: APiQypIdXHZDbCY1mjOHI7A02KN/NFXcXdx0OSG3FPCPhGoilD6eSlbRaDrFn+uMA+JdV38nVB2Qsw==
X-Received: by 2002:adf:e791:: with SMTP id n17mr1265834wrm.217.1588921720359;
        Fri, 08 May 2020 00:08:40 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id s24sm12302509wmj.28.2020.05.08.00.08.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2020 00:08:39 -0700 (PDT)
Date:   Fri, 8 May 2020 09:08:37 +0200
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Colin King <colin.king@canonical.com>
Cc:     Inki Dae <inki.dae@samsung.com>,
        Joonyoung Shim <jy0922.shim@samsung.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        dri-devel@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, kernel-janitors@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/exynos: remove redundant initialization to variable
 'start'
Message-ID: <20200508070837.GF1383626@phenom.ffwll.local>
Mail-Followup-To: Colin King <colin.king@canonical.com>,
        Inki Dae <inki.dae@samsung.com>,
        Joonyoung Shim <jy0922.shim@samsung.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        David Airlie <airlied@linux.ie>, Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        dri-devel@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, kernel-janitors@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20200507202237.64350-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200507202237.64350-1-colin.king@canonical.com>
X-Operating-System: Linux phenom 5.4.0-4-amd64 
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Thu, May 07, 2020 at 09:22:37PM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The variable 'start' is being initialized with a value that is never read
> and it is being updated later with a new value.  The initialization is
> redundant and can be removed.
> 
> Addresses-Coverity: ("Unused value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> ---
>  drivers/gpu/drm/exynos/exynos_drm_dsi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> index 902938d2568f..b0b9cb1ec18f 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> @@ -1150,7 +1150,7 @@ static bool exynos_dsi_transfer_finish(struct exynos_dsi *dsi)
>  {
>  	struct exynos_dsi_transfer *xfer;
>  	unsigned long flags;
> -	bool start = true;
> +	bool start;
>  
>  	spin_lock_irqsave(&dsi->transfer_lock, flags);
>  
> -- 
> 2.25.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
