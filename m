Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 155604BC40
	for <lists+kernel-janitors@lfdr.de>; Wed, 19 Jun 2019 17:03:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726246AbfFSPDl (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Wed, 19 Jun 2019 11:03:41 -0400
Received: from mail-qt1-f196.google.com ([209.85.160.196]:37412 "EHLO
        mail-qt1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725899AbfFSPDl (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 19 Jun 2019 11:03:41 -0400
Received: by mail-qt1-f196.google.com with SMTP id y57so20302869qtk.4
        for <kernel-janitors@vger.kernel.org>; Wed, 19 Jun 2019 08:03:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=poorly.run; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=aIIEMxX1FhMaJIgNIe0yPO26KaoH+R3kuzA5ZNJYtLw=;
        b=OMU2qxzW1ptmufAkQijFshFcDuhkZSmya5ShEIlgEaFLx0CWQlXVpFdsxbTlUWwM2V
         iIcB2K52RO5sK1LgMYGbraYEUcU0rZpYI0yyT+gKBmy3MuBj4rAggeFLRS0iMFbe1ZhS
         e2GBFJOSsb+wof/yq6QNct2nRB77TXUdOO2vtAzj88gxCX4O/hpwAoG963LHvSUMjABw
         sKJ5afgI1Z/3p2J3oyudj7P1ZXDghPqIOSjNPganpLJHLL4VTNK/1Kru8g1eENETbDlQ
         gJawkD15I5Ticj9lf5309BEzxzMuuU3j9D9SQR1a3e7OCaQPqOfcr2WCIBxedwFo3wHl
         NO1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=aIIEMxX1FhMaJIgNIe0yPO26KaoH+R3kuzA5ZNJYtLw=;
        b=SkpnbnTDha2iSQvhC8Qmwh705jrSMOoFpaWRu2XxBl51hTeMO6zhvhwXa8U/kHR/ad
         BBPwl7b205ZdP9KCbwtVmSMCSjsqoSOlcPFCBhl8+p3S+QH0cqWlITLxqjFIW7CBgrE1
         gXOXp1rNc+ZpdkkiN0wSQwIihM24F62DqdR+DnqnysEwBkv8uHJBw6NsmVVIZFavJYBA
         8zXSzPUG1kLELyhPF2IfezobAKqlMGn0foHrIhwk8dFodxNiHNOByUIKSnNbuf+Id7rX
         gOrfgG/v0l+9Qstzhpo+oWdMlxCarwcR9v/6icXkT5AOnk8YpJWxjChcVUkqwxMgk/kr
         UjYQ==
X-Gm-Message-State: APjAAAUzrRxHpdj3VvAnPby8MjM6+aSqM+E8dbefsvkU9018eVjlL7PQ
        E95YwMvfPgUIM1+u3JdWt15Ybg==
X-Google-Smtp-Source: APXvYqzHcbV/44f9OZWLhrG3lWYAtmysCKUEDcOfy8nWb4FSdg3BA+TVk0XvkrDNhEHFUl4fGGvUeA==
X-Received: by 2002:ac8:7611:: with SMTP id t17mr37487129qtq.112.1560956619957;
        Wed, 19 Jun 2019 08:03:39 -0700 (PDT)
Received: from localhost ([2620:0:1013:11:89c6:2139:5435:371d])
        by smtp.gmail.com with ESMTPSA id g10sm9393646qkk.91.2019.06.19.08.03.39
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Wed, 19 Jun 2019 08:03:39 -0700 (PDT)
Date:   Wed, 19 Jun 2019 11:03:39 -0400
From:   Sean Paul <sean@poorly.run>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Sean Paul <seanpaul@chromium.org>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        David Airlie <airlied@linux.ie>,
        kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] drm: self_refresh: Fix a reversed condition in
 drm_self_refresh_helper_cleanup()
Message-ID: <20190619150339.GF25413@art_vandelay>
References: <20190619100141.GA28596@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190619100141.GA28596@mwanda>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Wed, Jun 19, 2019 at 01:01:41PM +0300, Dan Carpenter wrote:
> This test is flipped around so it either leads to a memory leak or a
> NULL dereference.
> 
> Fixes: 1452c25b0e60 ("drm: Add helpers to kick off self refresh mode in drivers")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Thanks for the patch and your bug report! I've applied this to -misc-next and
will dig into the bug report shortly.

> ---
> I'm not totally sure what the prefered patch prefix for this code.  One
> thing that would help is when we're adding new files we should specify
> the prefix that they're going to use:
> 
> - drm: Add helpers to kick off self refresh mode in drivers
> + drm: refresh mode: Add helpers to kick off self refresh mode in drivers
> 
> It's a small thing and email always sounds whiny but I'm sending this
> suggestion to everyone today so...

There's no hard rule. For drivers we use drm/<driver>, and for core people
use drm or drm/<file>.

> 
>  drivers/gpu/drm/drm_self_refresh_helper.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/drm_self_refresh_helper.c b/drivers/gpu/drm/drm_self_refresh_helper.c
> index 2b3daaf77841..e0d2ad1f070c 100644
> --- a/drivers/gpu/drm/drm_self_refresh_helper.c
> +++ b/drivers/gpu/drm/drm_self_refresh_helper.c
> @@ -205,7 +205,7 @@ void drm_self_refresh_helper_cleanup(struct drm_crtc *crtc)
>  	struct drm_self_refresh_data *sr_data = crtc->self_refresh_data;
>  
>  	/* Helper is already uninitialized */
> -	if (sr_data)
> +	if (!sr_data)
>  		return;
>  
>  	crtc->self_refresh_data = NULL;
> -- 
> 2.20.1
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- 
Sean Paul, Software Engineer, Google / Chromium OS
