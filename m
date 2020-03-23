Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D380518F388
	for <lists+kernel-janitors@lfdr.de>; Mon, 23 Mar 2020 12:14:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728123AbgCWLOf (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Mon, 23 Mar 2020 07:14:35 -0400
Received: from mail-vs1-f68.google.com ([209.85.217.68]:36431 "EHLO
        mail-vs1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728051AbgCWLOe (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 23 Mar 2020 07:14:34 -0400
Received: by mail-vs1-f68.google.com with SMTP id n6so8468797vsc.3
        for <kernel-janitors@vger.kernel.org>; Mon, 23 Mar 2020 04:14:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=MAiWRKEXAyRQFJfsxR6WCAQNazeZOJnLHhtRsQi0so0=;
        b=XLTlSXcnZvLStMq6xWIjt7gUqpgyShU3l1jhj7uyo4W/EBeJptZafYXL+55Ot1jRh6
         2raRYIB+jzyrYe5pT7oN6pOz+yfE7FB8nevJc5VpN+GIQQu0mVAVyGmrsICGFv7fNmlZ
         TMxQVO3sBKSZqit2wKMSpTkwKqM+3fZlfiAkWmRrXIrnjfY7E76JYZG3kqRjmKagOjl6
         mwh2OY9B+RSMvmCFW5RbcGiK4Si6k6Uy3EGiWf8VtcrrcCG0vs0iiqkLPJRHdwYJ29vF
         yhHUkIk6KZTnOJM0iPBQMVpQD6Qyf2mSEUP4HaQjQnnE6G9WxgbYDxiu2UxNUgB8s2Nh
         g9RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MAiWRKEXAyRQFJfsxR6WCAQNazeZOJnLHhtRsQi0so0=;
        b=pk616JDTktRNoX1ug5mp50FadAhTH+2KSO3pFNWynwY23kxEWdz2bm1tdueOk3g9m1
         Dln1ELN+2SA2ujxolNLRtcEL4CXtPxWLlON0kJicFKGPy0Ft/4R+678MTKWGWUskNZf8
         ULlh3+ypiSVV9HdU/u54MR31IT3CdrsdIKSRQBCEEpLUJQIM403fxrgFsv6n1oVTzexI
         gR+hUS38IJey3hgnApqSsP++vsxxrgDP2CUy0qiquYMIrnwCpjz7I4z5+2nOpjG4Z4E6
         RBrhpZrEH+FN7wrlSW5gTg9JuOvGWCVTrZFYkNZ2AnY7PkMhfNt4OqQxJ827/jBVwazZ
         QqDA==
X-Gm-Message-State: ANhLgQ29hAq1BuBCupYq9VQ9qGEjkB4kv/8i++zvr5OCu7U5JbW0iITi
        7PgL+PAU/WnAoyA0VzM0SgEMK5XFA5afO2yql2M=
X-Google-Smtp-Source: ADFU+vutlzdjUedg8us2quK3xm80fTCg+xe4TNgGIZ30332v3xwKq5807/piYycyJZIc7WTTFhQjRRsNJzmeghhbo9g=
X-Received: by 2002:a67:c592:: with SMTP id h18mr5351236vsk.118.1584962073626;
 Mon, 23 Mar 2020 04:14:33 -0700 (PDT)
MIME-Version: 1.0
References: <20200320132334.GC95012@mwanda>
In-Reply-To: <20200320132334.GC95012@mwanda>
From:   Emil Velikov <emil.l.velikov@gmail.com>
Date:   Mon, 23 Mar 2020 11:13:22 +0000
Message-ID: <CACvgo51xwgF2hJPOESWGpJ16WittQSVixdd+62KwFsZaHO-Dpg@mail.gmail.com>
Subject: Re: [PATCH] drm/gem: Fix a leak in drm_gem_objects_lookup()
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@linux.ie>,
        kernel-janitors@vger.kernel.org,
        ML dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hi Dan,

On Fri, 20 Mar 2020 at 13:23, Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> If the "handles" allocation or the copy_from_user() fails then we leak
> "objs".  It's supposed to be freed in panfrost_job_cleanup().
>
> Fixes: c117aa4d8701 ("drm: Add a drm_gem_objects_lookup helper")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  drivers/gpu/drm/drm_gem.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
> index a9e4a610445a..f28724f2eb69 100644
> --- a/drivers/gpu/drm/drm_gem.c
> +++ b/drivers/gpu/drm/drm_gem.c
> @@ -710,6 +710,8 @@ int drm_gem_objects_lookup(struct drm_file *filp, void __user *bo_handles,
>         if (!objs)
>                 return -ENOMEM;
>
> +       *objs_out = objs;
> +
>         handles = kvmalloc_array(count, sizeof(u32), GFP_KERNEL);
>         if (!handles) {
>                 ret = -ENOMEM;
> @@ -723,8 +725,6 @@ int drm_gem_objects_lookup(struct drm_file *filp, void __user *bo_handles,
>         }
>
>         ret = objects_lookup(filp, handles, count, objs);
> -       *objs_out = objs;
> -
>  out:
>         kvfree(handles);
>         return ret;

It seems that this will return error to the caller, mangle the output
pointer and effectively still leak the objs.

Better option IMHO is to:
- move the __user/copy_from_user into the caller
Removes a silly kvmalloc_array(1,...) in ~90+ users and drops the "out" label.
Extra bonus, this is the only instance in drm_gem with __user -
consistency is nice.
- add "err" or similar label, where the objs is freed before returning an error.

-Emil
