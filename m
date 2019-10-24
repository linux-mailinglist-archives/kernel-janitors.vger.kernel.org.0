Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 50864E32F0
	for <lists+kernel-janitors@lfdr.de>; Thu, 24 Oct 2019 14:49:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2502125AbfJXMts (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Thu, 24 Oct 2019 08:49:48 -0400
Received: from mail-ot1-f65.google.com ([209.85.210.65]:35884 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2502117AbfJXMts (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 24 Oct 2019 08:49:48 -0400
Received: by mail-ot1-f65.google.com with SMTP id c7so9764293otm.3
        for <kernel-janitors@vger.kernel.org>; Thu, 24 Oct 2019 05:49:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=PyaL5FR9d/jZB2FfWAIqD9mvnFhdj/C8GIiTAS5nB5E=;
        b=Ce2z1v+kSoWNglTt3WTllLp6U0xvVrQ58wmZZsFzSkJD2t3+lWNZy085pZDtxpY+zJ
         rUcaX977WLwXD5060KJzO2dq3EKxq+VND5w7OMOxURBBF+OASxA/W2pSivJdHp+2QiQp
         +cFIcuPS1SLujURbUtaSktkgsNnlh5lM3TVFM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PyaL5FR9d/jZB2FfWAIqD9mvnFhdj/C8GIiTAS5nB5E=;
        b=fhzgXmg1eaa5LuJ4KPLtxGjuMgQO4vrpvDHjyjdpjG5i6iB15FUkyycLDdHrKQdwau
         Yfe2Plue5dfen3L4OoicAhIkG/P8zZQxnIhydiW7giT+7vRRtkRCyTEq3/WahyAXOw8D
         bmN3bEZWFp/F6Lc6Om+F/1llSBvVjtwTyp6A77zjBiaQ7hyf9CtzZ9inEJpaJxqvCYxK
         pS0ApC3WZflthbDohIdxkK06/2s/nUmChan2w59xqc+BMS9YG6HeO0Doo5wThxWVs1eE
         BhbPvrRxjR9VTRUyw8Iu3YoSu+aZWw/Z2rCtrnW2nPYGe9j0h6MtUj+Q8VrWPoDbagp2
         8IsA==
X-Gm-Message-State: APjAAAV6uW/twz7ZaJZtUV/eyHusO0NZIlpqxb9nJU1VJnDVDQUDcbR7
        O5u18IgSMMXTWYPAgVupNvXhdUfrFT7AfYHNtKH2Ww==
X-Google-Smtp-Source: APXvYqyBIm/+WjVbGnSqvCqrpKyxMyAB4TFsKoUFfjuFU1JyyjPDGC0E5vf2MNMJj7EyC3WH+PQTxnzIDxkDciHoSKo=
X-Received: by 2002:a9d:b92:: with SMTP id 18mr12068647oth.188.1571921387385;
 Thu, 24 Oct 2019 05:49:47 -0700 (PDT)
MIME-Version: 1.0
References: <20191024104801.3122-1-colin.king@canonical.com>
 <20191024123853.GH11828@phenom.ffwll.local> <821f0799-1f37-c853-d2c6-dd95883e02d8@canonical.com>
In-Reply-To: <821f0799-1f37-c853-d2c6-dd95883e02d8@canonical.com>
From:   Daniel Vetter <daniel@ffwll.ch>
Date:   Thu, 24 Oct 2019 14:49:36 +0200
Message-ID: <CAKMK7uGbMx21+g2kQyGu5H-L7N-guKJhsZ6b1ROnz5+kDRt3LA@mail.gmail.com>
Subject: Re: [PATCH][next] drm/v3d: fix double free of bin
To:     Colin Ian King <colin.king@canonical.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Sean Paul <sean@poorly.run>,
        Maxime Ripard <mripard@kernel.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc:     Eric Anholt <eric@anholt.net>, David Airlie <airlied@linux.ie>,
        Navid Emamdoost <navid.emamdoost@gmail.com>,
        Iago Toral Quiroga <itoral@igalia.com>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        kernel-janitors@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Thu, Oct 24, 2019 at 2:43 PM Colin Ian King <colin.king@canonical.com> wrote:
>
> On 24/10/2019 13:38, Daniel Vetter wrote:
> > On Thu, Oct 24, 2019 at 11:48:01AM +0100, Colin King wrote:
> >> From: Colin Ian King <colin.king@canonical.com>
> >>
> >> Two different fixes have addressed the same memory leak of bin and
> >> this now causes a double free of bin.  While the individual memory
> >> leak fixes are fine, both fixes together are problematic.
> >>
> >> Addresses-Coverity: ("Double free")
> >> Fixes: 29cd13cfd762 ("drm/v3d: Fix memory leak in v3d_submit_cl_ioctl")
> >> Fixes: 0d352a3a8a1f (" rm/v3d: don't leak bin job if v3d_job_init fails.")
> >> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> >
> > That sounds like wrong merge resolution somewhere, and we don't have those
> > patches merged together in any final tree yet anywhere. What's this based
> > on?
> > -Daniel
>
> linux-next

Ok adding Stephen. There's a merge conflict between drm-misc-fixes and
drm-next (I think) and the merge double-added the kfree(bin). See
above for the relevant sha1. Dave is already on here as a heads-up,
but also adding drm-misc maintainers.

Cheers, Daniel

>
> Colin
> >
> >> ---
> >>  drivers/gpu/drm/v3d/v3d_gem.c | 1 -
> >>  1 file changed, 1 deletion(-)
> >>
> >> diff --git a/drivers/gpu/drm/v3d/v3d_gem.c b/drivers/gpu/drm/v3d/v3d_gem.c
> >> index 549dde83408b..37515e47b47e 100644
> >> --- a/drivers/gpu/drm/v3d/v3d_gem.c
> >> +++ b/drivers/gpu/drm/v3d/v3d_gem.c
> >> @@ -568,7 +568,6 @@ v3d_submit_cl_ioctl(struct drm_device *dev, void *data,
> >>              ret = v3d_job_init(v3d, file_priv, &bin->base,
> >>                                 v3d_job_free, args->in_sync_bcl);
> >>              if (ret) {
> >> -                    kfree(bin);
> >>                      v3d_job_put(&render->base);
> >>                      kfree(bin);
> >>                      return ret;
> >> --
> >> 2.20.1
> >>
> >
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel



-- 
Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch
