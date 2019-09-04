Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 43DB0A9576
	for <lists+kernel-janitors@lfdr.de>; Wed,  4 Sep 2019 23:48:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727741AbfIDVs5 (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Wed, 4 Sep 2019 17:48:57 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:42516 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726495AbfIDVs5 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 4 Sep 2019 17:48:57 -0400
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1A148440;
        Wed,  4 Sep 2019 23:48:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1567633735;
        bh=FF47Dv2MuaZGR4dKhfX7YrzdQJYDYjE+xebiIodI5es=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=kMEKkIQbDyY+/u3uxevrlz90++LR+HHIrtTbs+xgc1TaHEGYlOz2F0UyeQi0wQuZn
         KTH0ZsYl+M59Vj36rWw++bYKtWyN8fxzI6RWlA20MC8GLy8LZG1Uv7oME+lE6y3j5f
         xzLMW+I3/vzWmS4fqzAkF140JPjvas276o8eyXeo=
Date:   Thu, 5 Sep 2019 00:48:49 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        dri-devel@lists.freedesktop.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH v2] drm: panel-lvds: Potential Oops in probe error
 handling
Message-ID: <20190904214849.GM5433@pendragon.ideasonboard.com>
References: <20190904115057.GC4811@pendragon.ideasonboard.com>
 <20190904185507.GA3634@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190904185507.GA3634@mwanda>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hi Dan,

Thank you for the patch.

On Wed, Sep 04, 2019 at 09:55:07PM +0300, Dan Carpenter wrote:
> The "lvds->backlight" pointer could be NULL in situations were
> of_parse_phandle() returns NULL.  Also it's slightly cleaner to use
> backlight_put() which already has a check for NULL built in.
> 
> Fixes: 7c9dff5bd643 ("drm: panels: Add LVDS panel driver")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Sam, would you be able to pick this patch ?

> ---
> v2: Use backlight_put().  Thanks, Laurent!
> 
>  drivers/gpu/drm/panel/panel-lvds.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-lvds.c b/drivers/gpu/drm/panel/panel-lvds.c
> index ad47cc95459e..05e8885db7ed 100644
> --- a/drivers/gpu/drm/panel/panel-lvds.c
> +++ b/drivers/gpu/drm/panel/panel-lvds.c
> @@ -272,7 +272,7 @@ static int panel_lvds_probe(struct platform_device *pdev)
>  	return 0;
>  
>  error:
> -	put_device(&lvds->backlight->dev);
> +	backlight_put(lvds->backlight);
>  	return ret;
>  }
>  

-- 
Regards,

Laurent Pinchart
