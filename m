Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 39E3C2557A4
	for <lists+kernel-janitors@lfdr.de>; Fri, 28 Aug 2020 11:29:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728867AbgH1J3M (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Fri, 28 Aug 2020 05:29:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37412 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728555AbgH1J3I (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 28 Aug 2020 05:29:08 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 32300C061264
        for <kernel-janitors@vger.kernel.org>; Fri, 28 Aug 2020 02:29:08 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id f7so653155wrw.1
        for <kernel-janitors@vger.kernel.org>; Fri, 28 Aug 2020 02:29:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=4xTbc6V9CmKW0Xfag25GTFqmyB1j/7yz22pA4imxIiw=;
        b=EhIxwGsEYrapIc1v+zaLKLGIYcC14GvP6v+Z6CbxQZEMa/D/jJzWG5jBVvI11WHLPo
         3nbqhUnLrekuaF+/5TmAc6ZtRnfsKh4Jr+fvwq/Jp+FH0oZBjMmsrJd4w2nE63zwXClW
         hMjUznVbCdsTmian9+uE5iwihyJv1HGcojCE+qijrQsxB+r7l5/2PPW1B6r4CpwiDoEN
         YUZcSvX7jukQFfuZtUH+Q+6u2Mk+KqxuSYWB6+x1KtjzB6Uz8ueSeTYY5MfPlQlxvzUR
         IDghGWFM91DUAtGWnxd+zn0anWrhpiwEDPlMD9q1z6XTm41DemxHQGzQiO3Ls2fj+TeU
         MT3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=4xTbc6V9CmKW0Xfag25GTFqmyB1j/7yz22pA4imxIiw=;
        b=FLGZesIqvUJ8MsOXTxx8plHXeL1HkaikKbqNTbDM2QlMrZOfruJgj35A/nip72xY/n
         fUqfuX6zn7goKWkNGzN3K/QyAGWuZW72Nd8m9YzYGqs2zIzRtG64KdfJHJ0tKJlBDtjf
         uqsUJNBYSDYOWcK4OFRoEbuqEYJHjGPE9lZc4f5b/N0W5xGTYHkWZMGMxkll5XhtcvY2
         qNaoGxR9ZfWprgfHY7xpjJtgLH0KsgUBSNM5cSylXxc8OZfsueSkMu76zuvojUKuY0NF
         MHVytpXNdCDiUWzIp/5wJG5cspfwHyo2A953w8M5ZblsBx6SDGZ0Ef3L2ukhEH6HPSwD
         uYVw==
X-Gm-Message-State: AOAM532Y5LHkffDIdgHj5X6Hy+BFWtfRZL0g0tzyCmqviP6V2joq5Qpe
        ikbW13a5moSdqWAGNM2btRKE3w==
X-Google-Smtp-Source: ABdhPJwKFt/IiE8F76uSnjKmApF3H699HkDMx4kQ2ZsuOSzw96rNCHbjHHh1HSyEmO6pjlBVe4DCjg==
X-Received: by 2002:a05:6000:4f:: with SMTP id k15mr642732wrx.316.1598606946784;
        Fri, 28 Aug 2020 02:29:06 -0700 (PDT)
Received: from dell ([91.110.221.141])
        by smtp.gmail.com with ESMTPSA id j7sm1254885wmj.38.2020.08.28.02.29.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2020 02:29:06 -0700 (PDT)
Date:   Fri, 28 Aug 2020 10:29:04 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Daniel Thompson <daniel.thompson@linaro.org>
Cc:     dinghao.liu@zju.edu.cn, Markus Elfring <Markus.Elfring@web.de>,
        dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Bryan Wu <cooloney@gmail.com>,
        Gyungoh Yoo <jack.yoo@skyworksinc.com>,
        Jingoo Han <jingoohan1@gmail.com>, Kangjie Lu <kjlu@umn.edu>
Subject: Re: [PATCH] video: backlight: sky81452-backlight: Fix reference
 count imbalance on error
Message-ID: <20200828092904.GD1826686@dell>
References: <321fb03d-2307-7f60-f437-cfb99184dfd6@web.de>
 <20200819165702.GC3248864@dell>
 <217e3c0c.b58c.17409fd7496.Coremail.dinghao.liu@zju.edu.cn>
 <20200820062301.GD3248864@dell>
 <3f9fbdb1.bc96.1740a9560d5.Coremail.dinghao.liu@zju.edu.cn>
 <20200820074916.GE3248864@dell>
 <20200820113817.742yvjvdy7a642ew@holly.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200820113817.742yvjvdy7a642ew@holly.lan>
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Thu, 20 Aug 2020, Daniel Thompson wrote:

> On Thu, Aug 20, 2020 at 08:49:16AM +0100, Lee Jones wrote:
> > On Thu, 20 Aug 2020, dinghao.liu@zju.edu.cn wrote:
> > 
> > > > On Thu, 20 Aug 2020, dinghao.liu@zju.edu.cn wrote:
> > > > 
> > > > > > On Wed, 19 Aug 2020, Markus Elfring wrote:
> > > > > > 
> > > > > > > > When of_property_read_u32_array() returns an error code,
> > > > > > > > a pairing refcount decrement is needed to keep np's refcount balanced.
> > > > > > > 
> > > > > > > Can another imperative wording be helpful for the change description?
> > > > > > > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/submitting-patches.rst?id=18445bf405cb331117bc98427b1ba6f12418ad17#n151
> > > > > > > 
> > > > > > > Would an other commit message be a bit nicer?
> > > > > > > 
> > > > > > > 
> > > > > > > …
> > > > > > > > +++ b/drivers/video/backlight/sky81452-backlight.c
> > > > > > > > @@ -217,6 +217,7 @@ static struct sky81452_bl_platform_data *sky81452_bl_parse_dt(
> > > > > > > >  					num_entry);
> > > > > > > >  		if (ret < 0) {
> > > > > > > >  			dev_err(dev, "led-sources node is invalid.\n");
> > > > > > > > +			of_node_put(np);
> > > > > > > >  			return ERR_PTR(-EINVAL);
> > > > > > > >  		}
> > > > > > > 
> > > > > > > I propose to add the jump target “put_node” so that a bit of common exception
> > > > > > > handling code can be better reused at the end of this function implementation.
> > > > > > > 
> > > > > > > Regards,
> > > > > > > Markus
> > > > > > 
> > > > > > You can safely ignore any review comments from Markus!
> > > > > > 
> > > > > > However, this patch doesn't appear to be in my inbox.
> > > > > > 
> > > > > > Any ideas as to why?
> > > > > > 
> > > > > 
> > > > > Thank you for your advice. My outbox shows that this patch
> > > > > has reached your email server successfully. Maybe this
> > > > > ended up in your junk mail file?
> > > > 
> > > > This has happened recently, so I was sure to check.
> > > > 
> > > > Not there either unfortunately.
> > > > 
> > > > Would you be kind enough to bounce/resend please?
> > > 
> > > Sure.
> > 
> > Looks like you sent it *only* to me.  Please keep everyone else in Cc
> > when doing that, or I can't respond to everyone.
> > 
> > Anyway, besides the subject line (which I can fix easily), the patch
> > looks good to me, but Daniel T must review.
> 
> I've already offered a Reviewed-by for this patch. Perhaps it landed in
> the same place as the original patch...

Patch applied, thanks.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
