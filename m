Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D5C6930C628
	for <lists+kernel-janitors@lfdr.de>; Tue,  2 Feb 2021 17:40:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235882AbhBBQkb (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Tue, 2 Feb 2021 11:40:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55392 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236396AbhBBQjk (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 2 Feb 2021 11:39:40 -0500
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com [IPv6:2607:f8b0:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 060F7C061573
        for <kernel-janitors@vger.kernel.org>; Tue,  2 Feb 2021 08:39:00 -0800 (PST)
Received: by mail-ot1-x32d.google.com with SMTP id i30so20429709ota.6
        for <kernel-janitors@vger.kernel.org>; Tue, 02 Feb 2021 08:38:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=gEB6YhLiShPxcpG0N7ia5oN52NnO6sE8qIUDaGWPBqA=;
        b=H/dmYbhX8sl+0ST7w5MlKdD/viYei2HClPFduE5wjMtX0MTvQ+FFssg71dRZuHNgzJ
         iJWHq/aO5YwpXS+D6hXPkHrjRA5X7QXN+OIF/CzTxRfQESJxI+gpwYrbdY1ERM604qrQ
         iXVL7sUj7738Mq//8BiZavNoWWDDFYOAP4TXBcWFyTyH9twY4JOd90yTEuJttZGcDp7A
         Hy5uhVN1BfEo2PLEQvJHGj00eq5aiPJwurj+52SRd8ZnQGX1S1FjssM3O7V4ThrrhA+6
         ExWR+kLq/PjzCKP02j/F20TaLHXW5yh5br8M8DlrtNgzgA6Ej12SMjymNxAzor92P75l
         bg1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=gEB6YhLiShPxcpG0N7ia5oN52NnO6sE8qIUDaGWPBqA=;
        b=AhtsimG/3FvChk4MKdlESxzZgqVQMo8QwMlPoo0eR749YZmCgPYa/HT5ey6LaKRd/R
         dFRvs1ErruzMGo5quWb0k/iTgfLLPeUFw7E8jXicGd8ZVIRe8Eg0K2vgsCsC7uF0vwWj
         cMLlTt9A4GTFp3cx1NYNnt4WDWRq1FCTQ8MpUdqMJnsI/giI8T+k3PYlmARoblzHEnMf
         mFHaIKGALLJBMI22nDcO8W/xfKT4THXpJZmlUD39YFNQIkOFqEAOrSQVKNjQ7Q4ex2bW
         RPqAqkdkmmABUWDHg1ar1Tn6FH362QxXuKxhINhMEAll8qOnmLyOu08jl8kLypYdCEDV
         NPGw==
X-Gm-Message-State: AOAM5333DMjrF9ehNSYtiHL3Jxs3z4Ir3VR8ddKpp4g6QZ3HM8RXDylA
        nWvzf+eMZ8PlKvEc6TKpBe6R7wDs3ssiSJTWof5RXIH5
X-Google-Smtp-Source: ABdhPJzQZdEDqjoPyL5u/GjncG3C5HgSbpUNlogxNxADbL5hCcP/xjRntfr0srln2kwPoWRfUuARVrNICr8iVQb3zZ8=
X-Received: by 2002:a9d:ec7:: with SMTP id 65mr11172551otj.311.1612283939430;
 Tue, 02 Feb 2021 08:38:59 -0800 (PST)
MIME-Version: 1.0
References: <YBjplLOof9J1E2o5@mwanda>
In-Reply-To: <YBjplLOof9J1E2o5@mwanda>
From:   Alex Deucher <alexdeucher@gmail.com>
Date:   Tue, 2 Feb 2021 11:38:48 -0500
Message-ID: <CADnq5_Mw+wjzRLhNaGUC7VFS92=GeZ0UwvrhiHMjnXpF1=nMHw@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: Prevent shift wrapping in amdgpu_read_mask()
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Alex Deucher <alexander.deucher@amd.com>,
        Xiaojian Du <Xiaojian.Du@amd.com>,
        David Airlie <airlied@linux.ie>,
        kernel-janitors@vger.kernel.org, Kevin Wang <kevin1.wang@amd.com>,
        Huang Rui <ray.huang@amd.com>,
        amd-gfx list <amd-gfx@lists.freedesktop.org>,
        Nirmoy Das <nirmoy.das@amd.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Eric Huang <JinHuiEric.Huang@amd.com>,
        Evan Quan <evan.quan@amd.com>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Tue, Feb 2, 2021 at 12:57 AM Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> If the user passes a "level" value which is higher than 31 then that
> leads to shift wrapping.  The undefined behavior will lead to a
> syzkaller stack dump.
>
> Fixes: 5632708f4452 ("drm/amd/powerplay: add dpm force multiple levels on cz/tonga/fiji/polaris (v2)")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied.  Thanks!

Alex

> ---
>  drivers/gpu/drm/amd/pm/amdgpu_pm.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/pm/amdgpu_pm.c b/drivers/gpu/drm/amd/pm/amdgpu_pm.c
> index e9b569b76716..1a4010fcf561 100644
> --- a/drivers/gpu/drm/amd/pm/amdgpu_pm.c
> +++ b/drivers/gpu/drm/amd/pm/amdgpu_pm.c
> @@ -1094,7 +1094,7 @@ static ssize_t amdgpu_get_pp_dpm_sclk(struct device *dev,
>  static ssize_t amdgpu_read_mask(const char *buf, size_t count, uint32_t *mask)
>  {
>         int ret;
> -       long level;
> +       unsigned long level;
>         char *sub_str = NULL;
>         char *tmp;
>         char buf_cpy[AMDGPU_MASK_BUF_MAX + 1];
> @@ -1109,9 +1109,9 @@ static ssize_t amdgpu_read_mask(const char *buf, size_t count, uint32_t *mask)
>         tmp = buf_cpy;
>         while (tmp[0]) {
>                 sub_str = strsep(&tmp, delimiter);
> -               if (strlen(sub_str)) {
> -                       ret = kstrtol(sub_str, 0, &level);
> -                       if (ret)
> +               if (sub_str[0]) {
> +                       ret = kstrtoul(sub_str, 0, &level);
> +                       if (ret || level > 31)
>                                 return -EINVAL;
>                         *mask |= 1 << level;
>                 } else
> --
> 2.29.2
>
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx
