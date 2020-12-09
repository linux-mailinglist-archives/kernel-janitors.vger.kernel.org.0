Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 550E42D4069
	for <lists+kernel-janitors@lfdr.de>; Wed,  9 Dec 2020 11:58:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730272AbgLIK5e (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Wed, 9 Dec 2020 05:57:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60184 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730261AbgLIK5e (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 9 Dec 2020 05:57:34 -0500
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E849CC0613CF
        for <kernel-janitors@vger.kernel.org>; Wed,  9 Dec 2020 02:56:53 -0800 (PST)
Received: by mail-pf1-x443.google.com with SMTP id c79so785943pfc.2
        for <kernel-janitors@vger.kernel.org>; Wed, 09 Dec 2020 02:56:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7VihS8UZRpLZrdHjYOKQ2pp7IsLDsu9GnvDVWQGO/T0=;
        b=R++eJ29cYWxAN+/F/3ChxmEWxhJgn5BVqlVzAlVejga10koM7L39MsylEZw3A2QorG
         x53uTZoW0SzI+tTpQNOsB8RZOL1SVzch3wHzb0jlRAcGE3Y4049nAlxJT6aYWq6dDVG4
         wVrk/oQ7B5karjipcYl0GIT9lBWDYtf7N2YTW6xsOLIfZYDCpOdYddNucKJQU4seDxQo
         0w7XqhRq4OVq7u24z+TWx4OYq7Qlzq0kc6aXfmroahkviJW4tA+Uj9pD42/sATEddAMe
         xLXa3SAfjhKVMytZZSE/IKm2SRl3A4o9tTLBUDTpg8Lxw8k/ctiRkyeRNURkuSzyy/aB
         Qm0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7VihS8UZRpLZrdHjYOKQ2pp7IsLDsu9GnvDVWQGO/T0=;
        b=PA4rz4fW+92n44QUL+Az3NnMEdwXWCbYQLO5aqTaXx/KPmeFIw2lXn9+Pjoo+7c+nC
         H63TgZDh2vyP6V0sxQ1NH0CwCjGIy+fvudS79lGpK/suUYyVnHC7o9UcTp+LydYWZ6m7
         AUVooRQwDTwh7UgULZ0LL7XUUw1o09KGdxgk+tkOQLWoEkllirD6vf1YyY/K70q/uz9K
         TGWgiZBezzfwQtNTsWX3YF478KlsHha01lyYSkdJy098nKLNB5OJ5O1x4M6pBLBGHvwy
         Mb/T+UgOiYAFA+6n+dZw8F1pVvHa1ImxEkCl8Z/SzJVO01UD8oE1H2nTIplnZhs6LSXy
         vyfA==
X-Gm-Message-State: AOAM5317MnEUQl3LiqM145AehIcrVgNz3UcVE18/drgm0iV7KrBqBef1
        j6vg8MlwRCCMTcEqZWjNFHKfMavhg3w7PZbjUjzwZg==
X-Google-Smtp-Source: ABdhPJzLaiyGpxIFRGP60i7SgoyYNy5UI77xOAibOeDYqF4rGR+pWCgiM53zWz3su6YV8uM6t3HbFAW3boTRFA5qOEA=
X-Received: by 2002:a05:6a00:2382:b029:198:15a2:aaf9 with SMTP id
 f2-20020a056a002382b029019815a2aaf9mr1582890pfc.39.1607511413578; Wed, 09 Dec
 2020 02:56:53 -0800 (PST)
MIME-Version: 1.0
References: <X9BzujGgPAM/s+rG@mwanda> <X9Bz8pRFNhR2x11I@mwanda>
In-Reply-To: <X9Bz8pRFNhR2x11I@mwanda>
From:   Robert Foss <robert.foss@linaro.org>
Date:   Wed, 9 Dec 2020 11:56:38 +0100
Message-ID: <CAG3jFytWd3p3sBoC8PLUES-SJFu=DxQWED9jGmLO7zCaCXdRFg@mail.gmail.com>
Subject: Re: [PATCH 2/2] media: camss: missing error code in msm_video_register()
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Todor Tomov <todor.too@gmail.com>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hansverk@cisco.com>,
        linux-media <linux-media@vger.kernel.org>,
        kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Thanks for submitting this Dan.

Reviewed-by: Robert Foss <robert.foss@linaro.org>

On Wed, 9 Dec 2020 at 07:51, Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> This error path returns success but it should return -EINVAL.
>
> Fixes: cba3819d1e93 ("media: camss: Format configuration per hardware version")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  drivers/media/platform/qcom/camss/camss-video.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/media/platform/qcom/camss/camss-video.c b/drivers/media/platform/qcom/camss/camss-video.c
> index 2fa3214775d5..97cea7c4d769 100644
> --- a/drivers/media/platform/qcom/camss/camss-video.c
> +++ b/drivers/media/platform/qcom/camss/camss-video.c
> @@ -961,6 +961,7 @@ int msm_video_register(struct camss_video *video, struct v4l2_device *v4l2_dev,
>                         video->nformats = ARRAY_SIZE(formats_rdi_8x96);
>                 }
>         } else {
> +               ret = -EINVAL;
>                 goto error_video_register;
>         }
>
> --
> 2.29.2
>
