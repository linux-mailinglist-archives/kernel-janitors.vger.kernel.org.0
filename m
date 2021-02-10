Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D90A33167A1
	for <lists+kernel-janitors@lfdr.de>; Wed, 10 Feb 2021 14:14:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231325AbhBJNNY (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Wed, 10 Feb 2021 08:13:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53362 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229761AbhBJNNW (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 10 Feb 2021 08:13:22 -0500
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 482DBC061786
        for <kernel-janitors@vger.kernel.org>; Wed, 10 Feb 2021 05:12:41 -0800 (PST)
Received: by mail-wm1-x32c.google.com with SMTP id t142so1799337wmt.1
        for <kernel-janitors@vger.kernel.org>; Wed, 10 Feb 2021 05:12:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:mail-followup-to:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=06TLiUMrg/gK1BCnrYazHzAso9O/vviLp5XeKWLC8Nc=;
        b=TcF3i2gwx5Tmi229Lswr8tHwSUp4FnGe8selhPmEPLFiHGwzECmsrru4FPqmpaOiXn
         wEWmtRqKhpxLqH1/SA7hB9H8LmOxmMCIoeyx5No97BLmyBg+mUPvPgK5qScOYkzG8Hjm
         LPMMTACRlQpSKp5yoKEl1ljjux4prEN58bKsQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id
         :mail-followup-to:references:mime-version:content-disposition
         :content-transfer-encoding:in-reply-to;
        bh=06TLiUMrg/gK1BCnrYazHzAso9O/vviLp5XeKWLC8Nc=;
        b=JA+who6ZE2js0GsZgOWRIgYlGV5UG3RpxePKkToyjH5k65GQbPQCA5ppi7rpV+xlKO
         QS5r/1Oe+a94NSBvrl1pARpRR1K+3Fb6XBH8VVNFphYTik2G8eOm1r6VBddJfD90UFTG
         AvAcUN47Mr0HOjsvxyp9V4btSGKCbOQ+UVmarQaKle4DeKPd+lrRhkGfsT2/K3IsAxz3
         VLkIHpRTplQ2TbfYBUIyoiBCXAtvb57I1rMwhabvZ6T/0f8vlg6ImaCU78ItpOUjhrbe
         wdwoI6sHOvd5jO+uDX8psDdKj+KOeEU7mCvkl/Ogx4UbkwaMSqp8wPS3HbeRw3zlnHKt
         EBEg==
X-Gm-Message-State: AOAM531u5FRSj6pRp2ZIE11gBXa0W3I06RUyjOtL9yEo9BDoa0lCvjxC
        hdoohEFGPFrA2mG6XiaJHiG9Mg==
X-Google-Smtp-Source: ABdhPJy4ZuPo59mA1wIBRKapj8He5a/779Cqw/Hlzs8kQbtN9+Z+zVO8u1tp1fHi0Wh5ZYDbsodCMQ==
X-Received: by 2002:a1c:49d7:: with SMTP id w206mr2842211wma.63.1612962760064;
        Wed, 10 Feb 2021 05:12:40 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id z15sm2907980wrt.8.2021.02.10.05.12.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Feb 2021 05:12:39 -0800 (PST)
Date:   Wed, 10 Feb 2021 14:12:37 +0100
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Lee Jones <lee.jones@linaro.org>
Cc:     Julia Lawall <Julia.Lawall@inria.fr>,
        Daniel Thompson <daniel.thompson@linaro.org>,
        linux-kernel@vger.kernel.org,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Jingoo Han <jingoohan1@gmail.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        kernel-janitors@vger.kernel.org,
        Michal Simek <michal.simek@xilinx.com>,
        dri-devel@lists.freedesktop.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-fbdev@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Shawn Guo <shawnguo@kernel.org>, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] video: use getter/setter functions
Message-ID: <YCPbxSHWMipTz+mB@phenom.ffwll.local>
Mail-Followup-To: Lee Jones <lee.jones@linaro.org>,
        Julia Lawall <Julia.Lawall@inria.fr>,
        Daniel Thompson <daniel.thompson@linaro.org>,
        linux-kernel@vger.kernel.org,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Jingoo Han <jingoohan1@gmail.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        kernel-janitors@vger.kernel.org,
        Michal Simek <michal.simek@xilinx.com>,
        dri-devel@lists.freedesktop.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>, NXP Linux Team <linux-imx@nxp.com>,
        linux-fbdev@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Shawn Guo <shawnguo@kernel.org>, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <20210209211325.1261842-1-Julia.Lawall@inria.fr>
 <20210210082341.GH220368@dell>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210210082341.GH220368@dell>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Wed, Feb 10, 2021 at 08:23:41AM +0000, Lee Jones wrote:
> On Tue, 09 Feb 2021, Julia Lawall wrote:
> 
> > Use getter and setter functions, for platform_device structures and a
> > spi_device structure.
> > 
> > Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>
> > 
> > ---
> >  drivers/video/backlight/qcom-wled.c                                  |    2 +-
> 
> This patch is fine.
> 
> Could you please split it out and submit it separately though please.

Or just apply the entire patch through backlight tree, there's nothing
going on in fbdev anyway I think.

Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> 
> >  drivers/video/fbdev/amifb.c                                          |    4 ++--
> >  drivers/video/fbdev/da8xx-fb.c                                       |    4 ++--
> >  drivers/video/fbdev/imxfb.c                                          |    2 +-
> >  drivers/video/fbdev/omap2/omapfb/displays/panel-lgphilips-lb035q02.c |    6 +++---
> >  drivers/video/fbdev/omap2/omapfb/dss/dpi.c                           |    4 ++--
> >  drivers/video/fbdev/omap2/omapfb/dss/dsi.c                           |    4 ++--
> >  drivers/video/fbdev/omap2/omapfb/dss/hdmi4.c                         |    2 +-
> >  drivers/video/fbdev/omap2/omapfb/dss/hdmi5.c                         |    2 +-
> >  drivers/video/fbdev/xilinxfb.c                                       |    2 +-
> >  10 files changed, 16 insertions(+), 16 deletions(-)
> 
> ...]
> 
> > diff --git a/drivers/video/backlight/qcom-wled.c b/drivers/video/backlight/qcom-wled.c
> > index 3bc7800eb0a9..091f07e7c145 100644
> > --- a/drivers/video/backlight/qcom-wled.c
> > +++ b/drivers/video/backlight/qcom-wled.c
> > @@ -1692,7 +1692,7 @@ static int wled_probe(struct platform_device *pdev)
> >  
> >  static int wled_remove(struct platform_device *pdev)
> >  {
> > -	struct wled *wled = dev_get_drvdata(&pdev->dev);
> > +	struct wled *wled = platform_get_drvdata(pdev);
> >  
> >  	mutex_destroy(&wled->lock);
> >  	cancel_delayed_work_sync(&wled->ovp_work);
> 
> For my own reference (apply this as-is to your sign-off block):
> 
>   Acked-for-Backlight-by: Lee Jones <lee.jones@linaro.org>
> 
> -- 
> Lee Jones [李琼斯]
> Senior Technical Lead - Developer Services
> Linaro.org │ Open source software for Arm SoCs
> Follow Linaro: Facebook | Twitter | Blog
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
