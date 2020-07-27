Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D2C4E22F894
	for <lists+kernel-janitors@lfdr.de>; Mon, 27 Jul 2020 21:01:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728045AbgG0TBJ (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Mon, 27 Jul 2020 15:01:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52596 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727038AbgG0TBI (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 27 Jul 2020 15:01:08 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2CA72C061794
        for <kernel-janitors@vger.kernel.org>; Mon, 27 Jul 2020 12:01:08 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id f7so15962409wrw.1
        for <kernel-janitors@vger.kernel.org>; Mon, 27 Jul 2020 12:01:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=GWRD6aKtU2dG93H0mLRCtmpFUiWZc0dEN93+3wR1MEE=;
        b=fgmd1/3zIuSYEzYaYQBLkWbJuAkNkJeULpdCXrp+6VYCGj0y/9k6P1GgA0rrHAJdi6
         um24p+y96hkqfH4YAXHmiPsT0nR+IK7wKKUtAH+UIeJoySMd5KAjt8dNK5WwK+7cSZz0
         ZSLP1LqaJWveAnnuSipBZO8fqX9Bbx0j1eT7iZsLbzQ/UoyWbFOmYPs/SDvU1Qnho5CD
         5YqLwNaILCWw3RPFBJDS2gbVJsOVJYJukhNxUZASnrXXX9SMV8ocSIUq03GzeRgXeMHE
         RU5T9XVNALrRrr4/Nv/ZWdxVB8EpHTS0sKwxnBUrM6DT4fIdyQP9pqGi/vmXrvl3AApG
         9xhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GWRD6aKtU2dG93H0mLRCtmpFUiWZc0dEN93+3wR1MEE=;
        b=Hf51du8iPbYHo4PCenmNaq4+RGjnl/e+hYkOZi4+yTtgbwGHx30utPdIx/HDbTQS4p
         HnugT7w4g4WHR/eDR4vbWle5j3lLq87WBVAqJjJhtRV30HSOzbLflU/3BI+ymPfFV8U4
         M33Cv/1l0iIlVopyP3MleIebyOoVozc6xL088SeU9pYNS8eQEz35Nm+nd5pibR2H1uxG
         brxH7u2R2biejWs5VqHohnKQfGvStpfTcA7qipdFtj8qBgWU8J/usXi8jkP9O6Z9Z3kE
         QcxrcTEbfikMwvUlO/N0ALfoxwdi7v/FcHhmveUadys0/85u0Qjxa2ydN0lOS4yN5E4L
         YBvA==
X-Gm-Message-State: AOAM530q3Nawmdquom3AXm4S1nM2P/Bt/VrLDAfBf24njsSADNFmuR/u
        AC4wCa1xdxoQWTu0mCxin6zu6YGrPwbQgrAM6qY=
X-Google-Smtp-Source: ABdhPJwdbRTzHPdTpTv1KW68K17GZVNbp5Ov17maOv9B9lO82oHXjcOIhJAN9YwUIkkwKJbz6ZU16nYiuUxFxXTcgo8=
X-Received: by 2002:adf:a351:: with SMTP id d17mr21172751wrb.111.1595876466832;
 Mon, 27 Jul 2020 12:01:06 -0700 (PDT)
MIME-Version: 1.0
References: <20200727133940.GA391897@mwanda>
In-Reply-To: <20200727133940.GA391897@mwanda>
From:   Alex Deucher <alexdeucher@gmail.com>
Date:   Mon, 27 Jul 2020 15:00:55 -0400
Message-ID: <CADnq5_MDcYC08SRMhPPRR0QK70_ZeywtSY4f8ztAP3qCBkwTsA@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/powerplay: off by one bugs in smu_cmn_to_asic_specific_index()
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Evan Quan <evan.quan@amd.com>, David Airlie <airlied@linux.ie>,
        kernel-janitors@vger.kernel.org,
        amd-gfx list <amd-gfx@lists.freedesktop.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        Alex Deucher <alexander.deucher@amd.com>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="UTF-8"
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Mon, Jul 27, 2020 at 9:42 AM Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> These tables have _COUNT number of elements so the comparisons should be
> >= instead of > to prevent reading one element beyond the end of the
> array.
>
> Fixes: 8264ee69f0d8 ("drm/amd/powerplay: drop unused code")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied.  Thanks!

Alex

> ---
>  drivers/gpu/drm/amd/powerplay/smu_cmn.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/powerplay/smu_cmn.c b/drivers/gpu/drm/amd/powerplay/smu_cmn.c
> index be4b678d0e60..5c23c44c33bd 100644
> --- a/drivers/gpu/drm/amd/powerplay/smu_cmn.c
> +++ b/drivers/gpu/drm/amd/powerplay/smu_cmn.c
> @@ -166,7 +166,7 @@ int smu_cmn_to_asic_specific_index(struct smu_context *smu,
>
>         switch (type) {
>         case CMN2ASIC_MAPPING_MSG:
> -               if (index > SMU_MSG_MAX_COUNT ||
> +               if (index >= SMU_MSG_MAX_COUNT ||
>                     !smu->message_map)
>                         return -EINVAL;
>
> @@ -181,7 +181,7 @@ int smu_cmn_to_asic_specific_index(struct smu_context *smu,
>                 return msg_mapping.map_to;
>
>         case CMN2ASIC_MAPPING_CLK:
> -               if (index > SMU_CLK_COUNT ||
> +               if (index >= SMU_CLK_COUNT ||
>                     !smu->clock_map)
>                         return -EINVAL;
>
> @@ -192,7 +192,7 @@ int smu_cmn_to_asic_specific_index(struct smu_context *smu,
>                 return mapping.map_to;
>
>         case CMN2ASIC_MAPPING_FEATURE:
> -               if (index > SMU_FEATURE_COUNT ||
> +               if (index >= SMU_FEATURE_COUNT ||
>                     !smu->feature_map)
>                         return -EINVAL;
>
> @@ -203,7 +203,7 @@ int smu_cmn_to_asic_specific_index(struct smu_context *smu,
>                 return mapping.map_to;
>
>         case CMN2ASIC_MAPPING_TABLE:
> -               if (index > SMU_TABLE_COUNT ||
> +               if (index >= SMU_TABLE_COUNT ||
>                     !smu->table_map)
>                         return -EINVAL;
>
> @@ -214,7 +214,7 @@ int smu_cmn_to_asic_specific_index(struct smu_context *smu,
>                 return mapping.map_to;
>
>         case CMN2ASIC_MAPPING_PWR:
> -               if (index > SMU_POWER_SOURCE_COUNT ||
> +               if (index >= SMU_POWER_SOURCE_COUNT ||
>                     !smu->pwr_src_map)
>                         return -EINVAL;
>
> --
> 2.27.0
>
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx
