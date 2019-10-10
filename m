Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B1913D2BA6
	for <lists+kernel-janitors@lfdr.de>; Thu, 10 Oct 2019 15:46:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726833AbfJJNpu (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Thu, 10 Oct 2019 09:45:50 -0400
Received: from mail-ed1-f52.google.com ([209.85.208.52]:45317 "EHLO
        mail-ed1-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726065AbfJJNpt (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 10 Oct 2019 09:45:49 -0400
Received: by mail-ed1-f52.google.com with SMTP id h33so5487232edh.12
        for <kernel-janitors@vger.kernel.org>; Thu, 10 Oct 2019 06:45:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=sender:date:from:to:cc:subject:message-id:mail-followup-to
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=m/eFFXn0vur3dPmxW/iwC62E4sqoVqpwELmzMg990o4=;
        b=SzGg1Snpvro/ax8XbsReNLXCcQ7xMcVrZVaTG+BtPXx0xM09HqnNEaPaf187SrkLA5
         1tCRCyg04PdbAjuHlRlEdiQ9FdDWRXihCtDYZCKcOiocErL1waORxcIx+qP0wjlWt0x9
         JdgBsOo3wevXUV/HA2mxbAtugYD/3OGXFhWRk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :mail-followup-to:references:mime-version:content-disposition
         :in-reply-to:user-agent;
        bh=m/eFFXn0vur3dPmxW/iwC62E4sqoVqpwELmzMg990o4=;
        b=WuEW1JdayvTTXB+YoaldKdmEEBiZ8UxQuWaaug3oyiIbbiL0yUH//mq02LMG78QP6W
         ceyQK1ZahhhmL5RZ/r9HxWpbmh6XAquHzo4cyZSHP8p5xHG927UOu+blgh5KXshIJIBN
         1qW3YYCjqPvtMUUf6n4MUZaM4g1KgQA9knHFiOIa/xLYQRe742OPH2/UtOmYYP3EWOK4
         44QMKupQeYzwLwF42nhL61T47CVjEl/rzc/Qu/x9wQugSp4W4qvXqu/85q3HSs4ZFgZm
         dEdzWJnvLvJzaMI+OYaycO3QdmSL/0icEsQZGhSMmzN1a8IDd22WcIT+Yx5qfYl3XfFw
         R7Lw==
X-Gm-Message-State: APjAAAUf+fMofr1lxnwZmoIwU3mFkqlNEBXiYUewBF+nQdCJQ4ZV8L8o
        X1oRfBFNVJsTyQrBwKfag3oWog==
X-Google-Smtp-Source: APXvYqyuWp2Bw2sOuzsNu3Opsr6/6mUt7Z18v3AUK3CH32gupRxBQK38MTAyggaQcsUO8idYoi/bvQ==
X-Received: by 2002:a17:906:6d89:: with SMTP id h9mr7954865ejt.169.1570715148116;
        Thu, 10 Oct 2019 06:45:48 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net. [212.51.149.96])
        by smtp.gmail.com with ESMTPSA id q2sm923864edh.41.2019.10.10.06.45.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Oct 2019 06:45:47 -0700 (PDT)
Date:   Thu, 10 Oct 2019 15:45:45 +0200
From:   Daniel Vetter <daniel@ffwll.ch>
To:     YueHaibing <yuehaibing@huawei.com>
Cc:     Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
        Haneen Mohammed <hamohammed.sa@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH -next] drm/vkms: Remove duplicated include from vkms_drv.c
Message-ID: <20191010134545.GZ16989@phenom.ffwll.local>
Mail-Followup-To: YueHaibing <yuehaibing@huawei.com>,
        Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
        Haneen Mohammed <hamohammed.sa@gmail.com>,
        David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
References: <20191010115213.115706-1-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191010115213.115706-1-yuehaibing@huawei.com>
X-Operating-System: Linux phenom 5.2.0-2-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Thu, Oct 10, 2019 at 11:52:13AM +0000, YueHaibing wrote:
> Remove duplicated include.
> 
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>

Applied, thanks.
-Daniel

> ---
>  drivers/gpu/drm/vkms/vkms_drv.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/vkms_drv.c
> index 54703463d966..d1fe144aa289 100644
> --- a/drivers/gpu/drm/vkms/vkms_drv.c
> +++ b/drivers/gpu/drm/vkms/vkms_drv.c
> @@ -19,7 +19,6 @@
>  #include <drm/drm_drv.h>
>  #include <drm/drm_fb_helper.h>
>  #include <drm/drm_file.h>
> -#include <drm/drm_gem.h>
>  #include <drm/drm_gem_framebuffer_helper.h>
>  #include <drm/drm_ioctl.h>
>  #include <drm/drm_probe_helper.h>
> 
> 
> 
> 
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
