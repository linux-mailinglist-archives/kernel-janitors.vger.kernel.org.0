Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8117B1741F4
	for <lists+kernel-janitors@lfdr.de>; Fri, 28 Feb 2020 23:25:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726167AbgB1WZ0 (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Fri, 28 Feb 2020 17:25:26 -0500
Received: from mail-wm1-f67.google.com ([209.85.128.67]:53528 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725957AbgB1WZZ (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 28 Feb 2020 17:25:25 -0500
Received: by mail-wm1-f67.google.com with SMTP id f15so5008946wml.3
        for <kernel-janitors@vger.kernel.org>; Fri, 28 Feb 2020 14:25:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=aF2aJyuvvTQuT5Yl5IlpYF+PKSKuzBGPNR0RRCHfSyE=;
        b=UMijP3dGnLH0Io7tAF7I8H2+a9oHXHHBQc/B446M2cE+aAcjtahgPh5qlAPQOFEmqT
         PBCLjCcClh8KLJcU0qtPuOD1qYEFaPTDIYu2WboLCUFJ0BWcss2NGUXnux14oC8tdp02
         AtiJh4EhP75KSfgCYtIO7uvOzLkppZGScCarVjjATlxJ/4AhEEsTIEgJ3daL1zUiZi99
         iSTG8QMu9WoyJlSArJ5VvmIvreUlagf8CROj+nzy7Pxv5FeCAKvJ5w6i8xDEoncFvmpH
         gLeRwual2uTwfFS/tFN+LD+q+KDBmiRYhuWzflSN7fVK+HeHYzk3MVcMgdo8JpprRUO7
         E5Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=aF2aJyuvvTQuT5Yl5IlpYF+PKSKuzBGPNR0RRCHfSyE=;
        b=sCu4ZkP2PpMJ439/NoC9VxwjKaeywJyzCFWwOuZ2t2HsAHvyEoChcmcHxTc/rjvxGe
         SvJp0RXaNnPZFPG6QtkUIj3+2Izflosqth/IW5SOYX23Qid0hvSvcxvSkl6JoV4IWzPs
         WTjvFFsz2th0EgutGjRGJZt4rqoPf7FV/5xkEU0twS+mkwxsPcNL2P8mqeAsMFmXyoiZ
         Hlyf6KJU9uSSdipNELhYRVnccrQO1IJchsxomFEg6lXZBZvEHX1YXX1wuecTeV112UUT
         SUlJY50hHl9MjVeJIKoFvMQ36KQn/JN1PDh1q86wBGY2ZlgZjZckvU20ctP75/OlnE8j
         sLPg==
X-Gm-Message-State: APjAAAWEWrwYfWCjGMEuN2MNMalaFz3bm9atnAZjmI6w5l8KYK1/WsKf
        FoxNttO8IqBG5tF3BYO7RNUWy1PdnvgVXucUTIc=
X-Google-Smtp-Source: APXvYqxYE/hjSqERv1tj0urbFkC7/8umE/kA7MUauldzYOiQ7RdpulLOcdkyiP8mvt8Kz9ler15Pn6D6xWa5Faa7yfg=
X-Received: by 2002:a05:600c:218b:: with SMTP id e11mr6826873wme.56.1582928723549;
 Fri, 28 Feb 2020 14:25:23 -0800 (PST)
MIME-Version: 1.0
References: <20200228105833.2jdsy7sxpeoo3lvy@kili.mountain> <e425f3fd-a517-c10b-aab4-05d8315983de@amd.com>
In-Reply-To: <e425f3fd-a517-c10b-aab4-05d8315983de@amd.com>
From:   Alex Deucher <alexdeucher@gmail.com>
Date:   Fri, 28 Feb 2020 17:25:12 -0500
Message-ID: <CADnq5_MkjfdaVe=7=sZhvAYUVMgNk1fHQb7VBcMSwsCXzc2jeA@mail.gmail.com>
Subject: Re: [PATCH v2] drm/amd/display: Fix dmub_psr_destroy()
To:     "Kazlauskas, Nicholas" <nicholas.kazlauskas@amd.com>
Cc:     Dan Carpenter <dan.carpenter@oracle.com>,
        Harry Wentland <harry.wentland@amd.com>,
        Wyatt Wood <wyatt.wood@amd.com>,
        "David (ChunMing) Zhou" <David1.Zhou@amd.com>,
        Leo Li <sunpeng.li@amd.com>, kernel-janitors@vger.kernel.org,
        Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
        amd-gfx list <amd-gfx@lists.freedesktop.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Alex Deucher <alexander.deucher@amd.com>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="UTF-8"
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Applied.  Thanks!

Alex

On Fri, Feb 28, 2020 at 8:08 AM Kazlauskas, Nicholas
<nicholas.kazlauskas@amd.com> wrote:
>
> On 2020-02-28 5:58 a.m., Dan Carpenter wrote:
> > This is freeing the wrong variable so it will crash.  It should be
> > freeing "*dmub" instead of "dmub".
> >
> > Fixes: 4c1a1335dfe0 ("drm/amd/display: Driverside changes to support PSR in DMCUB")
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>
> Reviewed-by: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
>
> Thanks!
>
> > ---
> >   drivers/gpu/drm/amd/display/dc/dce/dmub_psr.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/amd/display/dc/dce/dmub_psr.c b/drivers/gpu/drm/amd/display/dc/dce/dmub_psr.c
> > index 2c932c29f1f9..f0936cb3c056 100644
> > --- a/drivers/gpu/drm/amd/display/dc/dce/dmub_psr.c
> > +++ b/drivers/gpu/drm/amd/display/dc/dce/dmub_psr.c
> > @@ -235,6 +235,6 @@ struct dmub_psr *dmub_psr_create(struct dc_context *ctx)
> >    */
> >   void dmub_psr_destroy(struct dmub_psr **dmub)
> >   {
> > -     kfree(dmub);
> > +     kfree(*dmub);
> >       *dmub = NULL;
> >   }
> >
>
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx
