Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2511E24B912
	for <lists+kernel-janitors@lfdr.de>; Thu, 20 Aug 2020 13:39:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729738AbgHTLie (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Thu, 20 Aug 2020 07:38:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48542 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729398AbgHTLiV (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 20 Aug 2020 07:38:21 -0400
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 33217C061385
        for <kernel-janitors@vger.kernel.org>; Thu, 20 Aug 2020 04:38:21 -0700 (PDT)
Received: by mail-wm1-x343.google.com with SMTP id o21so1300924wmc.0
        for <kernel-janitors@vger.kernel.org>; Thu, 20 Aug 2020 04:38:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=PCqH5LYqH1fQoc2ZlhhcJpxej9fx4SNk/neUhLB5CXQ=;
        b=kWqe/UA4IlH3O+11v3/2px5lEMFfQ31ZebCjBKikx+V66zCdAJ6QLVvHLBkY70i761
         wF8hZrIdwtgxAuHYBU2TDAMny5PvAVi5kMr3WCKAZ6FdMxZXpNosxy+pu+j16mG/P7uy
         aQQltE97czfbBK1YLITqKzGzI1/kf/GquhMGxLZo5txY/v3gbLAjlM895Af/QZV/VORd
         HjIcHMUVyEWjZ6vgziSlnrCppksKhT6SwjVD5f9CprcPFHSI87duwPVtC6dVG6dk7UNB
         b1haTbJ+tAx0cSoR/WeoIxmT2JA4DwlEF35dQe+BcS0Fq0zF/SId8/OOc6gz3Me5kSnU
         9zbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=PCqH5LYqH1fQoc2ZlhhcJpxej9fx4SNk/neUhLB5CXQ=;
        b=IkOemgYF4pfo9nlF4jZAZdWP1Vg1esVRsu60KC+xpgY3oJAU6xZMVCpzWpEFDrmNIr
         +9q8a4dOPamlauiUYLXkgfgjSywpV/bxcXm1hY/9R2hyJ4GMs8NPnHtC49E9vBkkBK7G
         9DpqTDzuJCPWz6JrP5lujv3MEvYLIBBPPBkFBJ/oMh9UsVz38mngDnqDF11gL3BzAF1H
         LFN6SqWjJh7r0zRX4TCkcgWRewVoBkvmr1BCy7q4SH1twK3gpGCyvcQD3+7EhL3fW/Tc
         JP2DNQGZRtkK3PDU0xkZqHJa1/tj8Twhzjn0L8hznAj703IxzXHDG4caJrC3Ye3tnE0j
         AtfA==
X-Gm-Message-State: AOAM533uF2kCjac8YX0U8Gn2SWrZ6Q6FqTbq5enj2cN7DvfuurbDgDWb
        PUlOX3bZAN2oV5KKpzyVuWfgyg==
X-Google-Smtp-Source: ABdhPJz1Apj5RkSqr5Zdm+oy3sNRrie8RiOBYxfJ9CWqRIIWRLTwgUwaX0GjKX0vwV4cMAhQPZlwAQ==
X-Received: by 2002:a05:600c:2157:: with SMTP id v23mr3002981wml.38.1597923499804;
        Thu, 20 Aug 2020 04:38:19 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net. [86.9.19.6])
        by smtp.gmail.com with ESMTPSA id j11sm3792749wrw.79.2020.08.20.04.38.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2020 04:38:19 -0700 (PDT)
Date:   Thu, 20 Aug 2020 12:38:17 +0100
From:   Daniel Thompson <daniel.thompson@linaro.org>
To:     Lee Jones <lee.jones@linaro.org>
Cc:     dinghao.liu@zju.edu.cn, Markus Elfring <Markus.Elfring@web.de>,
        dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Bryan Wu <cooloney@gmail.com>,
        Gyungoh Yoo <jack.yoo@skyworksinc.com>,
        Jingoo Han <jingoohan1@gmail.com>, Kangjie Lu <kjlu@umn.edu>
Subject: Re: [PATCH] video: backlight: sky81452-backlight: Fix reference
 count imbalance on error
Message-ID: <20200820113817.742yvjvdy7a642ew@holly.lan>
References: <321fb03d-2307-7f60-f437-cfb99184dfd6@web.de>
 <20200819165702.GC3248864@dell>
 <217e3c0c.b58c.17409fd7496.Coremail.dinghao.liu@zju.edu.cn>
 <20200820062301.GD3248864@dell>
 <3f9fbdb1.bc96.1740a9560d5.Coremail.dinghao.liu@zju.edu.cn>
 <20200820074916.GE3248864@dell>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200820074916.GE3248864@dell>
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Thu, Aug 20, 2020 at 08:49:16AM +0100, Lee Jones wrote:
> On Thu, 20 Aug 2020, dinghao.liu@zju.edu.cn wrote:
> 
> > > On Thu, 20 Aug 2020, dinghao.liu@zju.edu.cn wrote:
> > > 
> > > > > On Wed, 19 Aug 2020, Markus Elfring wrote:
> > > > > 
> > > > > > > When of_property_read_u32_array() returns an error code,
> > > > > > > a pairing refcount decrement is needed to keep np's refcount balanced.
> > > > > > 
> > > > > > Can another imperative wording be helpful for the change description?
> > > > > > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/submitting-patches.rst?id=18445bf405cb331117bc98427b1ba6f12418ad17#n151
> > > > > > 
> > > > > > Would an other commit message be a bit nicer?
> > > > > > 
> > > > > > 
> > > > > > …
> > > > > > > +++ b/drivers/video/backlight/sky81452-backlight.c
> > > > > > > @@ -217,6 +217,7 @@ static struct sky81452_bl_platform_data *sky81452_bl_parse_dt(
> > > > > > >  					num_entry);
> > > > > > >  		if (ret < 0) {
> > > > > > >  			dev_err(dev, "led-sources node is invalid.\n");
> > > > > > > +			of_node_put(np);
> > > > > > >  			return ERR_PTR(-EINVAL);
> > > > > > >  		}
> > > > > > 
> > > > > > I propose to add the jump target “put_node” so that a bit of common exception
> > > > > > handling code can be better reused at the end of this function implementation.
> > > > > > 
> > > > > > Regards,
> > > > > > Markus
> > > > > 
> > > > > You can safely ignore any review comments from Markus!
> > > > > 
> > > > > However, this patch doesn't appear to be in my inbox.
> > > > > 
> > > > > Any ideas as to why?
> > > > > 
> > > > 
> > > > Thank you for your advice. My outbox shows that this patch
> > > > has reached your email server successfully. Maybe this
> > > > ended up in your junk mail file?
> > > 
> > > This has happened recently, so I was sure to check.
> > > 
> > > Not there either unfortunately.
> > > 
> > > Would you be kind enough to bounce/resend please?
> > 
> > Sure.
> 
> Looks like you sent it *only* to me.  Please keep everyone else in Cc
> when doing that, or I can't respond to everyone.
> 
> Anyway, besides the subject line (which I can fix easily), the patch
> looks good to me, but Daniel T must review.

I've already offered a Reviewed-by for this patch. Perhaps it landed in
the same place as the original patch...


Daniel.

> 
> Reviewed-by: Lee Jones <lee.jones@linaro.org>

> 
> --
> Lee Jones [李琼斯]
> Senior Technical Lead - Developer Services
> Linaro.org │ Open source software for Arm SoCs
> Follow Linaro: Facebook | Twitter | Blog
