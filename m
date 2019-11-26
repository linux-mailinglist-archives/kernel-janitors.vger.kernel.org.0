Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 49F3710A1F0
	for <lists+kernel-janitors@lfdr.de>; Tue, 26 Nov 2019 17:23:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727313AbfKZQXx (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Tue, 26 Nov 2019 11:23:53 -0500
Received: from mail-wr1-f68.google.com ([209.85.221.68]:33543 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726983AbfKZQXx (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 26 Nov 2019 11:23:53 -0500
Received: by mail-wr1-f68.google.com with SMTP id w9so23259452wrr.0
        for <kernel-janitors@vger.kernel.org>; Tue, 26 Nov 2019 08:23:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=SqVK1rUp5UtzJClBKJOgHqdUJMmWis3RBtvucLshmlo=;
        b=RIRHSz4A9mBUNbvlVIvad78dxTLh3dnIxYdMNyKBbqGSgJA/u9CkLt1NLqkG2YUz+x
         bZkUxzGhRiyFDr4I5Ihv699xm540fVYJx2BqiBZ8YdPg8C7Pvk1UM7AbwcTQlzr/s6Ap
         gt9s9X2jur2rG8nbuHGb1o9VLSX9kB4lFByxFpUwCl7ggPV5Ug0aA5FezG7prCvMjsAt
         bdT0PWbDBOzFFE54zP6j6d+iWDpXWYdmvH0aqN6Hx+IJKR5rFJXRUyYgL33qhroTsk8b
         WdaARZPGCTULIrAdSQxGs1y2QUTa3Ylpe9ti2QFNp/G/WHcWjMsP4sGxV3OxmMF7TjZb
         JBvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=SqVK1rUp5UtzJClBKJOgHqdUJMmWis3RBtvucLshmlo=;
        b=Llt7WEm9JoEXuK74zmZw1h2J5TxctS/GrXmqU7D8EB2NV8EdUWi7d/QGShTbAYYW0q
         RFVmDbptG+/3YDrGJiAuu1zccTgpKs6iX1+DCfNhuKpzlOjuStb2ZFiuUSuFFNQoilk+
         /99iL+8N0jWx4+FcvwGNw1AJ/ry3fcg0FQN2U2t8ajSY5RtY7rK1a/7tUKH7XBFPUacr
         q6PsvHJ/IOv9HNCoycS0Ize5Xv2BpILe6TNY8iTwvS2DFUzLwDXvHaR/vlVGkwJ7KAZh
         qk9ikX5FhtUr7pJlA8XXGOf8BWS4BEj5WuMnJuaUUPUCVIIg4s1wBEarsOyfu/x2o1B5
         YYGA==
X-Gm-Message-State: APjAAAWRm9HQXix74zK2hfkpiJQoMfrvuB3LXjxuzEfgk1Z9ejz68g+R
        WBbAlA5rJE/vu9RxTrVxxFSBZOLpxnkcLkBkURA=
X-Google-Smtp-Source: APXvYqx/4aCgU1TY8rQD+RRf5p+AdIHEziucqDIoe9tFBgToO/cDoZMMlHEqpWO63vySWN+i6pv+fbtjEFS2hfw3CaU=
X-Received: by 2002:adf:f54c:: with SMTP id j12mr20010569wrp.40.1574785431496;
 Tue, 26 Nov 2019 08:23:51 -0800 (PST)
MIME-Version: 1.0
References: <20191126121029.3tye7e3gyduxryfr@kili.mountain>
In-Reply-To: <20191126121029.3tye7e3gyduxryfr@kili.mountain>
From:   Alex Deucher <alexdeucher@gmail.com>
Date:   Tue, 26 Nov 2019 11:23:38 -0500
Message-ID: <CADnq5_MB-M_AdArX3Bvg765iMiTR-rJLUpJjDmA=azrXAYTa-g@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: Fix a bug in jpeg_v1_0_start()
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Alex Deucher <alexander.deucher@amd.com>,
        Leo Liu <leo.liu@amd.com>, David Airlie <airlied@linux.ie>,
        kernel-janitors@vger.kernel.org,
        Maling list - DRI developers 
        <dri-devel@lists.freedesktop.org>,
        amd-gfx list <amd-gfx@lists.freedesktop.org>,
        "Christian K??nig" <christian.koenig@amd.com>
Content-Type: text/plain; charset="UTF-8"
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Tue, Nov 26, 2019 at 7:10 AM Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> Originally the last WREG32_SOC15() was a part of the if statement block
> but the curly braces are on the wrong line.
>
> Fixes: bb0db70f3f75 ("drm/amdgpu: separate JPEG1.0 code out from VCN1.0")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied.  Thanks!

Alex

> ---
> From static analysis (Smatch).  Not tested.
>
>  drivers/gpu/drm/amd/amdgpu/jpeg_v1_0.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/jpeg_v1_0.c b/drivers/gpu/drm/amd/amdgpu/jpeg_v1_0.c
> index 553506df077d..a141408dfb23 100644
> --- a/drivers/gpu/drm/amd/amdgpu/jpeg_v1_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/jpeg_v1_0.c
> @@ -522,7 +522,8 @@ void jpeg_v1_0_start(struct amdgpu_device *adev, int mode)
>                 WREG32_SOC15(JPEG, 0, mmUVD_LMI_JRBC_RB_64BIT_BAR_HIGH, upper_32_bits(ring->gpu_addr));
>                 WREG32_SOC15(JPEG, 0, mmUVD_JRBC_RB_RPTR, 0);
>                 WREG32_SOC15(JPEG, 0, mmUVD_JRBC_RB_WPTR, 0);
> -       }       WREG32_SOC15(JPEG, 0, mmUVD_JRBC_RB_CNTL, UVD_JRBC_RB_CNTL__RB_RPTR_WR_EN_MASK);
> +               WREG32_SOC15(JPEG, 0, mmUVD_JRBC_RB_CNTL, UVD_JRBC_RB_CNTL__RB_RPTR_WR_EN_MASK);
> +       }
>
>         /* initialize wptr */
>         ring->wptr = RREG32_SOC15(JPEG, 0, mmUVD_JRBC_RB_WPTR);
> --
> 2.11.0
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
