Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BE459134AF7
	for <lists+kernel-janitors@lfdr.de>; Wed,  8 Jan 2020 19:51:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729487AbgAHSv3 (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Wed, 8 Jan 2020 13:51:29 -0500
Received: from mail-wm1-f66.google.com ([209.85.128.66]:32928 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729479AbgAHSv3 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 8 Jan 2020 13:51:29 -0500
Received: by mail-wm1-f66.google.com with SMTP id d139so296685wmd.0
        for <kernel-janitors@vger.kernel.org>; Wed, 08 Jan 2020 10:51:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=eN+hXr5eBKpt1ztp3NuaboZ7DHSPkAz5GKoRsde+TT4=;
        b=XMM6zGO1EO3trQQoyvOMb4qSTOIfv57RK7vkC7tFnQ+RYj1va/QNSJfervVIMsSceW
         40SV/C8QiJeglg46Za9VvO1fWS6GNDBORleOlrIXRDWZJz1jso0jBEj10fWHqlM6J5Ts
         KThwjWnrINw8j6Hw9qYjpYnEiNRLpEknKyDiU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=eN+hXr5eBKpt1ztp3NuaboZ7DHSPkAz5GKoRsde+TT4=;
        b=PO4jlvePXyDo35YAqh8vWN2YcjUKeIStXGWPJ9G3g51Lw/ZVEroDgWdoiXWPNyoN2X
         vs3UpPwuDkh44vDASjLANW71kOWdBDvb646QdHWa5DhZqzDMPJ6FKrnhm+jCXFRMDjPZ
         QHIAVbNbPLRjsuhtcPxR0hTK/pnluK/2KMjTDXQ1GwQxHm/Ri2gfHCcWjvKJBUGl+6fO
         0hYypUxnmRJTZCLrOEEl7j+9hyoC7LPjhvwD4GwbLYkPP71GK2z9OfAbJcxCZONbT4pG
         /gc5TLibsp2BZHdZHA0F5yE7Z7Dwckd1fnqbdwTutxX07B/ZhnLNByXIjE9OchJHEC8T
         ylSQ==
X-Gm-Message-State: APjAAAUZdccrd+5402I/SFo0CCTR17gx0+wxd51ENM4wF0og6kQUBnA1
        GM9YDvoUUjPVEtpm2JYa1c/WwQ==
X-Google-Smtp-Source: APXvYqx7yGU3B6sFjaxjZa1yKnn8UVAi8M+Lwg0iGqjTkYZsweb3pFt3NLxBlU+XKuFu6VSDExRLKw==
X-Received: by 2002:a1c:f210:: with SMTP id s16mr15176wmc.57.1578509488026;
        Wed, 08 Jan 2020 10:51:28 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:564b:0:7567:bb67:3d7f:f863])
        by smtp.gmail.com with ESMTPSA id p18sm29510wmb.8.2020.01.08.10.51.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2020 10:51:27 -0800 (PST)
Date:   Wed, 8 Jan 2020 19:51:25 +0100
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        David Airlie <airlied@linux.ie>,
        Maxime Ripard <mripard@kernel.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        dri-devel@lists.freedesktop.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] gpu/drm: clean up white space in
 drm_legacy_lock_master_cleanup()
Message-ID: <20200108185125.GJ43062@phenom.ffwll.local>
References: <20200108054312.yzlj5wmbdktejgob@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200108054312.yzlj5wmbdktejgob@kili.mountain>
X-Operating-System: Linux phenom 5.3.0-3-amd64 
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Wed, Jan 08, 2020 at 08:43:12AM +0300, Dan Carpenter wrote:
> We moved this code to a different file and accidentally deleted a
> newline.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Oops, thanks for catching, patch applied!
-Daniel

> ---
>  drivers/gpu/drm/drm_lock.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/drm_lock.c b/drivers/gpu/drm/drm_lock.c
> index 2e8ce99d0baa..2c79e8199e3c 100644
> --- a/drivers/gpu/drm/drm_lock.c
> +++ b/drivers/gpu/drm/drm_lock.c
> @@ -360,7 +360,8 @@ void drm_legacy_lock_master_cleanup(struct drm_device *dev, struct drm_master *m
>  	/*
>  	 * Since the master is disappearing, so is the
>  	 * possibility to lock.
> -	 */	mutex_lock(&dev->struct_mutex);
> +	 */
> +	mutex_lock(&dev->struct_mutex);
>  	if (master->lock.hw_lock) {
>  		if (dev->sigdata.lock == master->lock.hw_lock)
>  			dev->sigdata.lock = NULL;
> -- 
> 2.11.0
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
