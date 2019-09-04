Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2B53FA817E
	for <lists+kernel-janitors@lfdr.de>; Wed,  4 Sep 2019 13:52:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727351AbfIDLvG (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Wed, 4 Sep 2019 07:51:06 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:37458 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725965AbfIDLvG (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 4 Sep 2019 07:51:06 -0400
Received: from pendragon.ideasonboard.com (mobile-access-bceeb5-228.dhcp.inet.fi [188.238.181.228])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id A1CE3440;
        Wed,  4 Sep 2019 13:51:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1567597863;
        bh=J3hwPwoYhAyLjnMAABtRRMdtjX9XTxkKUkoIsIWChTU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=TS4TkaFmSUfACpth0zQfjpo/b7eb61QAnLvwXDJiN7i7EhGzyi8l6atUEU30/Uu0v
         jy/prfgfAkmEdcv6shKJHo7U67wX+e5hyYE6FP6W13YJ1HAJeky6u3zIKoU3xjPlI8
         4XEWlGMyQJfjMDRWmjaEQy/1pdVuLCnvKKyTz7GY=
Date:   Wed, 4 Sep 2019 14:50:57 +0300
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
Subject: Re: [PATCH] drm: panel-lvds: Potential Oops in probe error handling
Message-ID: <20190904115057.GC4811@pendragon.ideasonboard.com>
References: <20190904100329.GE7007@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190904100329.GE7007@mwanda>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hi Dan,

Thank you for the patch.

On Wed, Sep 04, 2019 at 01:03:29PM +0300, Dan Carpenter wrote:
> The "lvds->backlight" pointer could be NULl if of_parse_phandle()
> returns NULL.
> 
> Fixes: 7c9dff5bd643 ("drm: panels: Add LVDS panel driver")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  drivers/gpu/drm/panel/panel-lvds.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-lvds.c b/drivers/gpu/drm/panel/panel-lvds.c
> index ad47cc95459e..3b4eb959e994 100644
> --- a/drivers/gpu/drm/panel/panel-lvds.c
> +++ b/drivers/gpu/drm/panel/panel-lvds.c
> @@ -272,7 +272,8 @@ static int panel_lvds_probe(struct platform_device *pdev)
>  	return 0;
>  
>  error:
> -	put_device(&lvds->backlight->dev);
> +	if (lvds->backlight)
> +		put_device(&lvds->backlight->dev);

How about simply

-	put_device(&lvds->backlight->dev);
+	backlight_put(lvds->backlight);

?

>  	return ret;
>  }
>  

-- 
Regards,

Laurent Pinchart
