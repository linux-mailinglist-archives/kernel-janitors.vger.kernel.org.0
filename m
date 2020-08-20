Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8A09124B05F
	for <lists+kernel-janitors@lfdr.de>; Thu, 20 Aug 2020 09:49:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725824AbgHTHt2 (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Thu, 20 Aug 2020 03:49:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41410 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725882AbgHTHtY (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 20 Aug 2020 03:49:24 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37F19C061383
        for <kernel-janitors@vger.kernel.org>; Thu, 20 Aug 2020 00:49:24 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id c15so1026285wrs.11
        for <kernel-janitors@vger.kernel.org>; Thu, 20 Aug 2020 00:49:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=XgD7oAraMYDOqNsfZffx0IqUVAmFZfcgzGRKvwI8mIc=;
        b=XlaONjDnEdsYg/6xqFFyWyTH0yWrgNaxkmvE+JWcDVZbLe+f/V7HKdjYROy7dyRpgD
         0dP7O6uThUl2ocYIR33bisbTsV7PY13WDhwdzpoG+1juP2BKSoKiEUd4Vt3PTFRroRgA
         CKWIaTIqQLz/3rnEaEMJlfnH2LOTDEFgtejdx0YcZnIibXmUIW8mrTOAvdg1MlPqsu01
         n4D3DHqkiUh/PUQcvUhn/MDFi/qLIJr1VljuscrpP3WooR3pcPufopgFHfsC1aJqsMPG
         YS204VOVM7RsVE5k9miArRNcssfkXrf1ORtWY/QTAhKAThyjJpNspv/DCPSgCLSS8wMB
         aMUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=XgD7oAraMYDOqNsfZffx0IqUVAmFZfcgzGRKvwI8mIc=;
        b=CY/6sKYZdQhZTQDllhS1iYKOqIpvI2K4QajVKVLroV7/OQtSHXrgIIb2LlTMk+pWLD
         kR55GePJcmE8G49h2JV8qlHugpc2wGIHU37SGSUupC2iE+WaC1RU2EMxaMkl8kp4dbcS
         P/htx8OBZxAxcR5kzQgtADGHtSGCZBHJTBIjzfo07yWDGWMiscjQWTzajbQUfD6f4r0N
         6a8O7+mZpTVCgVK1Q9vZUsVPhQog/RZbmpLMSVd8PWvN6SCWLTMQ+fRs7d9V/bRHjnNX
         gFaJiu3XHGpg9Tmzx4q4yTn6WVN/F5I0smWviyxusWL9lReXgJKgnyxhkAqE+Sn4fQac
         rA0w==
X-Gm-Message-State: AOAM5309CtLoQex5FpkL9USVVdCZQi3P/5d2s+gjFpzu+NAuaffmkPDV
        NMHp/7kZcJVCMU1bvzPnU0MEYQ==
X-Google-Smtp-Source: ABdhPJyboEGZAaF6RXm5GpaE/mKR6TYvk3Fye/goK+ikDC5z1N0gxsGJDDrfdepMKqxed6kq885b0w==
X-Received: by 2002:a5d:60cb:: with SMTP id x11mr1737733wrt.281.1597909761789;
        Thu, 20 Aug 2020 00:49:21 -0700 (PDT)
Received: from dell ([95.149.164.62])
        by smtp.gmail.com with ESMTPSA id s2sm2438068wrr.55.2020.08.20.00.49.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2020 00:49:21 -0700 (PDT)
Date:   Thu, 20 Aug 2020 08:49:16 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     dinghao.liu@zju.edu.cn
Cc:     Markus Elfring <Markus.Elfring@web.de>,
        dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Bryan Wu <cooloney@gmail.com>,
        Daniel Thompson <daniel.thompson@linaro.org>,
        Gyungoh Yoo <jack.yoo@skyworksinc.com>,
        Jingoo Han <jingoohan1@gmail.com>, Kangjie Lu <kjlu@umn.edu>
Subject: Re: Re: Re: [PATCH] video: backlight: sky81452-backlight: Fix
 reference count imbalance on error
Message-ID: <20200820074916.GE3248864@dell>
References: <321fb03d-2307-7f60-f437-cfb99184dfd6@web.de>
 <20200819165702.GC3248864@dell>
 <217e3c0c.b58c.17409fd7496.Coremail.dinghao.liu@zju.edu.cn>
 <20200820062301.GD3248864@dell>
 <3f9fbdb1.bc96.1740a9560d5.Coremail.dinghao.liu@zju.edu.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3f9fbdb1.bc96.1740a9560d5.Coremail.dinghao.liu@zju.edu.cn>
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Thu, 20 Aug 2020, dinghao.liu@zju.edu.cn wrote:

> > On Thu, 20 Aug 2020, dinghao.liu@zju.edu.cn wrote:
> > 
> > > > On Wed, 19 Aug 2020, Markus Elfring wrote:
> > > > 
> > > > > > When of_property_read_u32_array() returns an error code,
> > > > > > a pairing refcount decrement is needed to keep np's refcount balanced.
> > > > > 
> > > > > Can another imperative wording be helpful for the change description?
> > > > > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/submitting-patches.rst?id=18445bf405cb331117bc98427b1ba6f12418ad17#n151
> > > > > 
> > > > > Would an other commit message be a bit nicer?
> > > > > 
> > > > > 
> > > > > …
> > > > > > +++ b/drivers/video/backlight/sky81452-backlight.c
> > > > > > @@ -217,6 +217,7 @@ static struct sky81452_bl_platform_data *sky81452_bl_parse_dt(
> > > > > >  					num_entry);
> > > > > >  		if (ret < 0) {
> > > > > >  			dev_err(dev, "led-sources node is invalid.\n");
> > > > > > +			of_node_put(np);
> > > > > >  			return ERR_PTR(-EINVAL);
> > > > > >  		}
> > > > > 
> > > > > I propose to add the jump target “put_node” so that a bit of common exception
> > > > > handling code can be better reused at the end of this function implementation.
> > > > > 
> > > > > Regards,
> > > > > Markus
> > > > 
> > > > You can safely ignore any review comments from Markus!
> > > > 
> > > > However, this patch doesn't appear to be in my inbox.
> > > > 
> > > > Any ideas as to why?
> > > > 
> > > 
> > > Thank you for your advice. My outbox shows that this patch
> > > has reached your email server successfully. Maybe this
> > > ended up in your junk mail file?
> > 
> > This has happened recently, so I was sure to check.
> > 
> > Not there either unfortunately.
> > 
> > Would you be kind enough to bounce/resend please?
> 
> Sure.

Looks like you sent it *only* to me.  Please keep everyone else in Cc
when doing that, or I can't respond to everyone.

Anyway, besides the subject line (which I can fix easily), the patch
looks good to me, but Daniel T must review.

Reviewed-by: Lee Jones <lee.jones@linaro.org>

--
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
