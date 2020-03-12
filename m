Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AD0271832BD
	for <lists+kernel-janitors@lfdr.de>; Thu, 12 Mar 2020 15:21:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727493AbgCLOVn (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Thu, 12 Mar 2020 10:21:43 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:42992 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727340AbgCLOVn (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 12 Mar 2020 10:21:43 -0400
Received: by mail-wr1-f65.google.com with SMTP id v11so7709763wrm.9
        for <kernel-janitors@vger.kernel.org>; Thu, 12 Mar 2020 07:21:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=XJG/XwUiq1n4axSZ1ZF7zkNZoQCEEbC5EZjNTBUv+jc=;
        b=k1GGPGY5/DNbDGMl3hFlWPe536Ta4D+hqwRNWxaKIWqzDzVKI9Suk16VDOLFcYBUqu
         +w3LNEq2zhvvVT3jhVYgu2mi3tAH9iSjkrGdAd7ecJjhN1e01/JEsBz2z48JSiB2j2Yr
         SiZq3QxR4qlcW3PaZktP0rqxWF8uzVCmH9dedAqYXJBmEf/BaV5BrwOCUIoD/HTZW9YX
         8hmpwDf8BRy1TKGaYOfcWBERQxdIgwmT050Qfdt6PnZRDhYUmGJ/t794trjGuwXmLrPC
         pSexWoRk0+M8OIsvuuxUkEVBha8EYQAX7Ytq9Y/to/kfoNU3ZKGnNccHjACgFDwkGtgi
         0J8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XJG/XwUiq1n4axSZ1ZF7zkNZoQCEEbC5EZjNTBUv+jc=;
        b=rYAFPPr8tL6d8BCjSFOKc0KO4tbH4uT/TgttuDhSN2qkN01O6kbDA89b4cPyO6QiiJ
         +fxb07MDXzwakUCsT4kYWB/n2k6sOiXLoAStoyaGPH2dheFcaS4s48uqkM9GkveqgdKb
         l3SiSsUD65B58DBAq61elzonQZjxdT0bm+8uiZMq6p//l6z5K+eApmy9TXOK1smaX/lT
         KC7xxNFY2OwYlf6dNiXP0OWyg9ZjZS1OtIvI4Yazz7JmM6rMO/xNHasmIo9cn+LK+RTC
         FxH166y9tq2Hh4IYUIUI8ADYDwEeYU9SNg0RhlPs+o9MxaVfO9556o97g2mM2kTjcHY5
         LcSQ==
X-Gm-Message-State: ANhLgQ3qaw6DbGT181uUpWm3VpmVCyzBZdbfRbwNgifTFwLlqHXhYi9I
        GwvGu/DTVK0lrsv+XVj/wHL6MYj4mhD9Sv3WOho=
X-Google-Smtp-Source: ADFU+vs4nsgFtOGVuH12c8H+kSgKm+ZH6oPkKk7v/hngJMd62YHERJwnmbDbSOhCtMIS4LfxCObxTPc6wxOB84rkztQ=
X-Received: by 2002:a5d:5446:: with SMTP id w6mr11767349wrv.419.1584022900733;
 Thu, 12 Mar 2020 07:21:40 -0700 (PDT)
MIME-Version: 1.0
References: <20200312113231.GD20562@mwanda>
In-Reply-To: <20200312113231.GD20562@mwanda>
From:   Alex Deucher <alexdeucher@gmail.com>
Date:   Thu, 12 Mar 2020 10:21:29 -0400
Message-ID: <CADnq5_O8CCdXR0LRfe5_Y_asydv0zDetWdYAteLt9=jw6DuVTg@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: clean up a condition in dmub_psr_copy_settings()
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Harry Wentland <harry.wentland@amd.com>,
        "David (ChunMing) Zhou" <David1.Zhou@amd.com>,
        Leo Li <sunpeng.li@amd.com>, kernel-janitors@vger.kernel.org,
        Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
        amd-gfx list <amd-gfx@lists.freedesktop.org>,
        Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Wyatt Wood <wyatt.wood@amd.com>,
        Alex Deucher <alexander.deucher@amd.com>,
        Nathan Chancellor <natechancellor@gmail.com>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="UTF-8"
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Thu, Mar 12, 2020 at 7:32 AM Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> We can remove the NULL check for "res_ctx" and
> "res_ctx->pipe_ctx[i].stream->link".  Also it's nicer to align the
> conditions using spaces so I re-indented a bit.
>
> Longer explanation: The "res_ctx" pointer points to an address in the
> middle of a struct so it can't be NULL.  For
> "res_ctx->pipe_ctx[i].stream->link" we know that it is equal to "link"
> and "link" is non-NULL.
>
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied.  thanks!

Alex

> ---
>  drivers/gpu/drm/amd/display/dc/dce/dmub_psr.c | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/dce/dmub_psr.c b/drivers/gpu/drm/amd/display/dc/dce/dmub_psr.c
> index 9c88a92bd96a..bc109d4fc6e6 100644
> --- a/drivers/gpu/drm/amd/display/dc/dce/dmub_psr.c
> +++ b/drivers/gpu/drm/amd/display/dc/dce/dmub_psr.c
> @@ -134,11 +134,9 @@ static bool dmub_psr_copy_settings(struct dmub_psr *dmub,
>         int i = 0;
>
>         for (i = 0; i < MAX_PIPES; i++) {
> -               if (res_ctx &&
> -                       res_ctx->pipe_ctx[i].stream &&
> -                       res_ctx->pipe_ctx[i].stream->link &&
> -                       res_ctx->pipe_ctx[i].stream->link == link &&
> -                       res_ctx->pipe_ctx[i].stream->link->connector_signal == SIGNAL_TYPE_EDP) {
> +               if (res_ctx->pipe_ctx[i].stream &&
> +                   res_ctx->pipe_ctx[i].stream->link == link &&
> +                   res_ctx->pipe_ctx[i].stream->link->connector_signal == SIGNAL_TYPE_EDP) {
>                         pipe_ctx = &res_ctx->pipe_ctx[i];
>                         break;
>                 }
> --
> 2.20.1
>
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx
