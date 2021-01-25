Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D929E302759
	for <lists+kernel-janitors@lfdr.de>; Mon, 25 Jan 2021 16:58:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730476AbhAYP4l (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Mon, 25 Jan 2021 10:56:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34254 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730382AbhAYPuw (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 25 Jan 2021 10:50:52 -0500
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com [IPv6:2607:f8b0:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 75FA0C06178C
        for <kernel-janitors@vger.kernel.org>; Mon, 25 Jan 2021 07:50:12 -0800 (PST)
Received: by mail-oi1-x229.google.com with SMTP id x71so15187423oia.9
        for <kernel-janitors@vger.kernel.org>; Mon, 25 Jan 2021 07:50:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+SCPV4BZFoyRsHuoLx615eoKnvKtVamQHxepBfbqx7M=;
        b=oPAF8mPxf3i/aKjZBVEehR7jPY0ZKjBs4W5tfaDX8FBGXmeNOcgnljk2/LlV1oaL+i
         P8QucBzErKiclBQCKzr6sYDKlN2QP64ihkJbt9iURUKtfnJkqwvuQ0bX5X39hbqEzyOw
         cH/qbiCmCTXeR1G662Fg/dVCHIx5tQ23EpagoaneJlHuGeontLbDMGgIDh89SO055zO8
         aan+fv3aP0W5wwazVL54wTSUraayjFi+b2SjV+b6jVTLjbc2KApSGAPrF/n29LvQMBBi
         bZIOW9tN8vaiww9COS2Vzf5/2MM/OMBAzOJUIWChGigI0R8OEgix1OqKAhOEGFzOOWgg
         gOmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+SCPV4BZFoyRsHuoLx615eoKnvKtVamQHxepBfbqx7M=;
        b=dHbhmnujS0niJCMRn24RIHs4GaZOJgl6z3pLJPxYEvtcrHQ6xei3rCtq61MmIvehiw
         CtAi463rzY6+GdRYORplqFZuFQsFc6LTdczX4E8TuwgRP4HwWhaPdzWZ4Nk/Nbo9h7Wt
         wKx0SMfd9Egtyn7OIzdeXPAv+n4kGtYgeIGEnuKdBAhvP4vrreEXu756Kyb+CN5xOBDv
         PP77WPI8tO3/MXQrv1psLqZwihF2Olfmr6Y5vKXqn0TNq8s+E3gQsKsi9ln79YaDC1X3
         TOJLuyM7GmovIB3sQLeXNF3mm04hokFJ7rXKY6JOEzKr9PpFmJND6lQNgoFl7bqg5kTt
         lXxA==
X-Gm-Message-State: AOAM532KO+tNycmNn5vKDQF2rkf0VR9XPeU32JgxLnc5yU0CiEuAw1uG
        9nVMqfM6yoOjjxuY9qtSCz8JsFLKf29ZjGaIy+4ezG6V
X-Google-Smtp-Source: ABdhPJxEAfCVI5pVrdHU3xIgVq8j5ev1W+mk3AfPWV2EUQT3sibZcsN0BKMA+6aUw2N0xb34Hp1cYBMybhgtQ6buGCg=
X-Received: by 2002:aca:1a17:: with SMTP id a23mr493083oia.120.1611589811978;
 Mon, 25 Jan 2021 07:50:11 -0800 (PST)
MIME-Version: 1.0
References: <YA6FW84XDSakXqNb@mwanda>
In-Reply-To: <YA6FW84XDSakXqNb@mwanda>
From:   Alex Deucher <alexdeucher@gmail.com>
Date:   Mon, 25 Jan 2021 10:50:00 -0500
Message-ID: <CADnq5_PL8baNFhVpydh02gDbk88aqeFC76wox9qZXXEXzf6uQQ@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: fix bitwise vs logical negate
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Alex Deucher <alexander.deucher@amd.com>,
        Aaron Liu <aaron.liu@amd.com>, David Airlie <airlied@linux.ie>,
        kernel-janitors@vger.kernel.org, Huang Rui <ray.huang@amd.com>,
        amd-gfx list <amd-gfx@lists.freedesktop.org>,
        Liu ChengZhe <ChengZhe.Liu@amd.com>,
        Luben Tuikov <luben.tuikov@amd.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jiansong Chen <Jiansong.Chen@amd.com>,
        Likun Gao <Likun.Gao@amd.com>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Hawking Zhang <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Mon, Jan 25, 2021 at 3:46 AM Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> There was a mixup between logical and bitwise negate so it just sets
> "data1" and "data2" to zero.
>
> Fixes: 3c9a7b7d6e75 ("drm/amdgpu: update mmhub mgcg&ls for mmhub_v2_3")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Someone else sent the same fix last week.  Applied that one.

Thanks!

Alex

> ---
>  drivers/gpu/drm/amd/amdgpu/mmhub_v2_3.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/mmhub_v2_3.c b/drivers/gpu/drm/amd/amdgpu/mmhub_v2_3.c
> index 1961745e89c7..ab9be5ad5a5f 100644
> --- a/drivers/gpu/drm/amd/amdgpu/mmhub_v2_3.c
> +++ b/drivers/gpu/drm/amd/amdgpu/mmhub_v2_3.c
> @@ -531,12 +531,12 @@ mmhub_v2_3_update_medium_grain_light_sleep(struct amdgpu_device *adev,
>
>         if (enable && (adev->cg_flags & AMD_CG_SUPPORT_MC_LS)) {
>                 data &= ~MM_ATC_L2_CGTT_CLK_CTRL__MGLS_OVERRIDE_MASK;
> -               data1 &= !(DAGB0_WR_CGTT_CLK_CTRL__LS_OVERRIDE_MASK |
> +               data1 &= ~(DAGB0_WR_CGTT_CLK_CTRL__LS_OVERRIDE_MASK |
>                         DAGB0_WR_CGTT_CLK_CTRL__LS_OVERRIDE_WRITE_MASK |
>                         DAGB0_WR_CGTT_CLK_CTRL__LS_OVERRIDE_READ_MASK |
>                         DAGB0_WR_CGTT_CLK_CTRL__LS_OVERRIDE_RETURN_MASK |
>                         DAGB0_WR_CGTT_CLK_CTRL__LS_OVERRIDE_REGISTER_MASK);
> -               data2 &= !(DAGB0_RD_CGTT_CLK_CTRL__LS_OVERRIDE_MASK |
> +               data2 &= ~(DAGB0_RD_CGTT_CLK_CTRL__LS_OVERRIDE_MASK |
>                         DAGB0_RD_CGTT_CLK_CTRL__LS_OVERRIDE_WRITE_MASK |
>                         DAGB0_RD_CGTT_CLK_CTRL__LS_OVERRIDE_READ_MASK |
>                         DAGB0_RD_CGTT_CLK_CTRL__LS_OVERRIDE_RETURN_MASK |
> --
> 2.29.2
>
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx
