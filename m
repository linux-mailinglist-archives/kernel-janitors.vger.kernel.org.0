Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1F48B15393E
	for <lists+kernel-janitors@lfdr.de>; Wed,  5 Feb 2020 20:43:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727309AbgBETnZ (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Wed, 5 Feb 2020 14:43:25 -0500
Received: from mail-wm1-f68.google.com ([209.85.128.68]:50874 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727085AbgBETnZ (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 5 Feb 2020 14:43:25 -0500
Received: by mail-wm1-f68.google.com with SMTP id a5so3793876wmb.0
        for <kernel-janitors@vger.kernel.org>; Wed, 05 Feb 2020 11:43:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=SO/yJ+CxLWdlzSzvECpxjBgfng5aHRexC/OIl5nXatw=;
        b=tm7U5PG9ZNs1PTr3+vNBvUgYP4V0OtlInjm+sLI/Sr6Ukigb0rL6F+GaQUGq/ks5PS
         GTn/fP42y4UwRlKwUZlF+NE5X7sPsUThZQPxZehITfD2VjPj7Zgw+aL/vWij/LQl1UTl
         JBNt8UqxE1rwRT6R8qsa1qyNymJbiAF8TpD1ygafl6ur8ERSU8aLL8Le4LT2ztiZOQZ5
         dbft7c8yd9oDos1kRI0b6ZYVEK9xZ79UVhXmEYmrJB0SIvFddrsYW9K7W0d51Bmk2AxH
         iIbSCRotAZOl8DupPIpOqOUaIVPf3SHir7phZlNleBFk6opILxXMPznlXwILLEcuaHSH
         IhQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=SO/yJ+CxLWdlzSzvECpxjBgfng5aHRexC/OIl5nXatw=;
        b=qE5YkVU4f4n29HcKJU23/Mc3gTxASxGry31AaRY4xKAvlr/Rqugz20vUu+YFCKJ7N4
         N2L24YVG8w6JZQKpoPJMoLLQplNH69oTWy4odDn93cfb3nCsb+rYcMjye1F5lreU2eC+
         1+RrGQCVcAuJlKvPVWry8EVDDxrbND00UG5ZxyeGigCCs/nbnfZuUlcO+bbiFv5RUp1T
         TX0iJjZEFHsKRm7YMOga4ij4vqGFIflDLEXrd/RLLgO80VwIE/JDQyllwkoj6QQRedqU
         FXPryMS6H8JNQiJh7K3/YGAMxQeI6l3kXbu9espAhepOp01jbMW9EfA1fJxWtZbvV8IK
         FxiQ==
X-Gm-Message-State: APjAAAV4QzGLv4UmFaYCpy2KnyIx7AqjzWPgJqyXw6rgD41rnP0qwFMb
        Y3rrCjpuSVfZtsm8orjtlQdIH1L+4VObSsNx1Ypt5g==
X-Google-Smtp-Source: APXvYqxIxtXoHtTYG5ylAB7gXVxDFgOzGgFWCRiAV4cXnT5LMYKpT5GVtyZfz4DAD2Mcg/SZ2SQEnZ6vugyLxxJn784=
X-Received: by 2002:a1c:f009:: with SMTP id a9mr7326145wmb.73.1580931803092;
 Wed, 05 Feb 2020 11:43:23 -0800 (PST)
MIME-Version: 1.0
References: <20200205183714.6t5c7ewyovwjicm6@kili.mountain> <b9a18739-cada-05e8-d894-be8dcba9fb43@amd.com>
In-Reply-To: <b9a18739-cada-05e8-d894-be8dcba9fb43@amd.com>
From:   Alex Deucher <alexdeucher@gmail.com>
Date:   Wed, 5 Feb 2020 14:43:11 -0500
Message-ID: <CADnq5_PF2ofuZM9NNeDoWHo-atHQd=ExcWNFDg9yCC9R4v9Tuw@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: Fix some use after free bugs
To:     Bhawanpreet Lakha <Bhawanpreet.lakha@amd.com>
Cc:     Dan Carpenter <dan.carpenter@oracle.com>,
        Harry Wentland <harry.wentland@amd.com>,
        "David (ChunMing) Zhou" <David1.Zhou@amd.com>,
        kernel-janitors@vger.kernel.org, Leo Li <sunpeng.li@amd.com>,
        Zhan Liu <zhan.liu@amd.com>,
        Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
        amd-gfx list <amd-gfx@lists.freedesktop.org>,
        zhengbin <zhengbin13@huawei.com>,
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

On Wed, Feb 5, 2020 at 1:44 PM Bhawanpreet Lakha
<Bhawanpreet.lakha@amd.com> wrote:
>
> Reviewed-by: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
>
> On 2020-02-05 1:38 p.m., Dan Carpenter wrote:
> > These frees need to be re-ordered so that we don't dereference "hdcp_work"
> > right after it's freed.  Also in hdcp_create_workqueue() there is a
> > problem that "hdcp_work" can be NULL if the allocation fails so it would
> > lead to a NULL dereference in the cleanup code.
> >
> > Fixes: 9aeb8a134a0a ("drm/amd/display: Add sysfs interface for set/get srm")
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> > ---
> >   drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_hdcp.c | 9 +++++----
> >   1 file changed, 5 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_hdcp.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_hdcp.c
> > index 1768a33b1dc3..f3330df782a4 100644
> > --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_hdcp.c
> > +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_hdcp.c
> > @@ -380,9 +380,9 @@ void hdcp_destroy(struct hdcp_workqueue *hdcp_work)
> >               cancel_delayed_work_sync(&hdcp_work[i].watchdog_timer_dwork);
> >       }
> >
> > -     kfree(hdcp_work);
> >       kfree(hdcp_work->srm);
> >       kfree(hdcp_work->srm_temp);
> > +     kfree(hdcp_work);
> >   }
> >
> >   static void update_config(void *handle, struct cp_psp_stream_config *config)
> > @@ -555,11 +555,12 @@ struct hdcp_workqueue *hdcp_create_workqueue(struct amdgpu_device *adev, struct
> >   {
> >
> >       int max_caps = dc->caps.max_links;
> > -     struct hdcp_workqueue *hdcp_work = kzalloc(max_caps*sizeof(*hdcp_work), GFP_KERNEL);
> > +     struct hdcp_workqueue *hdcp_work;
> >       int i = 0;
> >
> > +     hdcp_work = kcalloc(max_caps, sizeof(*hdcp_work), GFP_KERNEL);
> >       if (hdcp_work == NULL)
> > -             goto fail_alloc_context;
> > +             return NULL;
> >
> >       hdcp_work->srm = kcalloc(PSP_HDCP_SRM_FIRST_GEN_MAX_SIZE, sizeof(*hdcp_work->srm), GFP_KERNEL);
> >
> > @@ -602,9 +603,9 @@ struct hdcp_workqueue *hdcp_create_workqueue(struct amdgpu_device *adev, struct
> >       return hdcp_work;
> >
> >   fail_alloc_context:
> > -     kfree(hdcp_work);
> >       kfree(hdcp_work->srm);
> >       kfree(hdcp_work->srm_temp);
> > +     kfree(hdcp_work);
> >
> >       return NULL;
> >
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx
