Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 56C53DB7AA
	for <lists+kernel-janitors@lfdr.de>; Thu, 17 Oct 2019 21:39:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2437554AbfJQTjb (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Thu, 17 Oct 2019 15:39:31 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:40417 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730180AbfJQTjb (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 17 Oct 2019 15:39:31 -0400
Received: by mail-wm1-f68.google.com with SMTP id b24so3747824wmj.5
        for <kernel-janitors@vger.kernel.org>; Thu, 17 Oct 2019 12:39:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=UT7xyfmARtbEtz9Y3P51WBO86VZDU8L5BW9LMX2rhrk=;
        b=fdnqU84kyd8LvUPwLhr4cU06XsQnW+iWOwh9twDQARCEVUUCeR/EG9BQnruYq5KaUq
         U0J+C4bu06SKnm5OI6m/GqQz/uWYB486DTxbeSORe9UK/4sKl8GRzKSFb08sSR2RVjdw
         IlRsy9gjFXiCgzttMxmuXAyqGVoLL+pbE3qmz5W24lfpyB0vvFef+It3zFnLE2h5F67e
         MP51W49M4gws0b1zF4k1uJSE2N3Ac3kQYzRHbSeJQc2F9FKW1oORO5UueuY4lw1ptGho
         n6cQXkPVqE/DlQ3cI54zFqGNgn6L6Ryzjpi7ZEk70eIiKdFC3t1xrIkME7nOoMcH280C
         AWkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=UT7xyfmARtbEtz9Y3P51WBO86VZDU8L5BW9LMX2rhrk=;
        b=Lxjf3CB33WvMiHALwlcqhhGcIUQr1KNY5aX6Gf0AZidQXmm2+o5PCY96VQJZbB2+FU
         JLDIMQlN9UHj5iK0otJFNFtCkPVtCWFxjDaLpMRmpiPfLhJYTJGEVFByIW9tFEJYZFad
         IlhtDrzgNDj54bxF5l92JRd9fGBN2qAdkTfGzq+DIRhNHCiHzrtLwSALcMsotHCPhCdG
         f6qrnDagHVeHBG0BB1idFtu5QqzIurzEykAFS+r40n5l1EK8xxL3c47HIoiyHVQkCvgc
         j28fDh5vZRSVEZZbVawdDCE5n9yeOVKi3nkgih6qfQslnhxDi4ATUvSgc/GEdT6u9Fkp
         +gug==
X-Gm-Message-State: APjAAAV3YsxT3IeAdelxXvJ4k7+tU1EkgQ4QMKZIOaUQQGWLPq+fIM4B
        c+oltNVLQU+NK6mfkG+eDf+YSmm2JIRpTfilS2ksDg==
X-Google-Smtp-Source: APXvYqxFc+O7akcYwllXsKik8VtXmNju27+Py4FJrgLhvBrH3SJUxpMt75kL12Si+WJaOepzoTSxsq6QlFhuCtYQfzU=
X-Received: by 2002:a1c:968b:: with SMTP id y133mr4217351wmd.141.1571341168937;
 Thu, 17 Oct 2019 12:39:28 -0700 (PDT)
MIME-Version: 1.0
References: <20191017091216.GA31278@mwanda>
In-Reply-To: <20191017091216.GA31278@mwanda>
From:   Alex Deucher <alexdeucher@gmail.com>
Date:   Thu, 17 Oct 2019 15:39:14 -0400
Message-ID: <CADnq5_N50-qL9KStb9_1kSqHgXb3fO=AzqOgAVzKDHSONZPXvw@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu/vi: silence an uninitialized variable warning
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Rex Zhu <rex.zhu@amd.com>, Jim Qu <Jim.Qu@amd.com>,
        "David (ChunMing) Zhou" <David1.Zhou@amd.com>,
        David Airlie <airlied@linux.ie>,
        kernel-janitors@vger.kernel.org,
        amd-gfx list <amd-gfx@lists.freedesktop.org>,
        Maling list - DRI developers 
        <dri-devel@lists.freedesktop.org>, Daniel Vetter <daniel@ffwll.ch>,
        Alex Deucher <alexander.deucher@amd.com>,
        Evan Quan <evan.quan@amd.com>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="UTF-8"
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Thu, Oct 17, 2019 at 5:12 AM Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> Smatch complains that we need to initialized "*cap" otherwise it can
> lead to an uninitialized variable bug in the caller.  This seems like a
> reasonable warning and it doesn't hurt to silence it at least.
>
> drivers/gpu/drm/amd/amdgpu/vi.c:767 vi_asic_reset_method() error: uninitialized symbol 'baco_reset'.
>
> Fixes: 425db2553e43 ("drm/amdgpu: expose BACO interfaces to upper level from PP")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied.  thanks!

Alex

> ---
>  drivers/gpu/drm/amd/powerplay/amd_powerplay.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/amd/powerplay/amd_powerplay.c b/drivers/gpu/drm/amd/powerplay/amd_powerplay.c
> index 83196b79edd5..f4ff15378e61 100644
> --- a/drivers/gpu/drm/amd/powerplay/amd_powerplay.c
> +++ b/drivers/gpu/drm/amd/powerplay/amd_powerplay.c
> @@ -1421,6 +1421,7 @@ static int pp_get_asic_baco_capability(void *handle, bool *cap)
>  {
>         struct pp_hwmgr *hwmgr = handle;
>
> +       *cap = false;
>         if (!hwmgr)
>                 return -EINVAL;
>
> --
> 2.20.1
>
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx
