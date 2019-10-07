Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 083B7CE91C
	for <lists+kernel-janitors@lfdr.de>; Mon,  7 Oct 2019 18:25:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728059AbfJGQZz (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Mon, 7 Oct 2019 12:25:55 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:38379 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727801AbfJGQZz (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 7 Oct 2019 12:25:55 -0400
Received: by mail-wr1-f68.google.com with SMTP id w12so16094837wro.5
        for <kernel-janitors@vger.kernel.org>; Mon, 07 Oct 2019 09:25:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=dFgexOM9IsttNkHQUS7h3ZyAQVlKbfcnv7lks064QYM=;
        b=usjRic7q5VlYwsBNjkevIQkhz4Aowo8HnQrZWd01Oy9PQLqhlqwGMb3QLANYjEMjl8
         guetWX8c7viX7BSIgc+2WYiKR7bjip6IWdf9cBaS3+BaoYHfMxdfq+xuTDVzNsOt29HA
         GMIhBvQ9PP+5Ko13cCNsGoqEEpfbNa+pYuWwwUTdMzdrGtsF72qjFcw9jmj3clDekphV
         uqDyBCe08MpTvLe4NFgDFls+eYKNFTKWs1SzWHuqqlDbeBd3WUWqKwXe2om5Tr0GLWoL
         xDBNjh6qUxRkwvUKc65njls/c63I1dJ+Z/lc6a3X0xr3urdrVYGjg/NdpF9Nqf7xKYGm
         XcYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=dFgexOM9IsttNkHQUS7h3ZyAQVlKbfcnv7lks064QYM=;
        b=POpe3hKm5eoA8CcLpWQsfDFFMUZ8WL5rxcWV1ewfne42tcGI3dqjXhfDqpV2auS0S7
         xFljJwk8RpUtkep7qAAJKvAJFUTc61QEGs2efY1tmkSAHBQcqvO9rXOFiuCATXpkY6pA
         RnfeyKLqRNYALkYrcg+XVjSEGY9t6EqzTb9Vn58IiulQI7OHbDBa8UPmfrprV0OkR9jP
         UlvUzB4Uuj/aYCdHJdOwWLmdpdmrmJC6/emNGKQ9IJW+Jg+sOp9DnqmRkdw2BqoNgOfi
         w6p33I7p74d40z9mau7RJOHmVQaPuNrqc+o5dFV1Ty9FZpwl/G67qA9Pi1O1u3W1Y3EI
         kcOg==
X-Gm-Message-State: APjAAAXulWHLP9rU8Z3EMdU7ndOMxTUAmQRFnSfhmNMQxLRC4+DbrI6z
        G+MAO3lJrw9OyRs3FDI5LWTt8VH7SQLIgzoPjbl5pRG8
X-Google-Smtp-Source: APXvYqx8toSebirTyjDUOKQh8LLa0tvtKtQbQxF7t5JQIY7+ZfoIg4f2HTGKWpMNjDDGrIX0kjwIYfnBNjIdZk/i4aA=
X-Received: by 2002:adf:fa0e:: with SMTP id m14mr18222912wrr.11.1570465552751;
 Mon, 07 Oct 2019 09:25:52 -0700 (PDT)
MIME-Version: 1.0
References: <20191007090206.GD3865@mwanda> <MN2PR12MB32963D6B4480B85DC9DC379FA29B0@MN2PR12MB3296.namprd12.prod.outlook.com>
In-Reply-To: <MN2PR12MB32963D6B4480B85DC9DC379FA29B0@MN2PR12MB3296.namprd12.prod.outlook.com>
From:   Alex Deucher <alexdeucher@gmail.com>
Date:   Mon, 7 Oct 2019 12:25:38 -0400
Message-ID: <CADnq5_PVO79Y-2YyZjovuXW9JYBg3Kfp9F7hL0-whzwhbKOr5A@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/powerplay: Fix error handling in smu_init_fb_allocations()
To:     "Wang, Kevin(Yang)" <Kevin1.Wang@amd.com>
Cc:     Dan Carpenter <dan.carpenter@oracle.com>,
        Rex Zhu <rex.zhu@amd.com>,
        "Zhou, David(ChunMing)" <David1.Zhou@amd.com>,
        David Airlie <airlied@linux.ie>,
        "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>,
        "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
        "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        "Deucher, Alexander" <Alexander.Deucher@amd.com>,
        "Quan, Evan" <Evan.Quan@amd.com>,
        "Koenig, Christian" <Christian.Koenig@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Applied.  Thanks!

Alex

On Mon, Oct 7, 2019 at 6:32 AM Wang, Kevin(Yang) <Kevin1.Wang@amd.com> wrot=
e:
>
> thanks correct it.
>
> Reviewed-by: Kevin Wang <kevin1.wang@amd.com>
>
> Best Regards,
> Kevin
> ________________________________
> From: Dan Carpenter <dan.carpenter@oracle.com>
> Sent: Monday, October 7, 2019 5:02 PM
> To: Rex Zhu <rex.zhu@amd.com>; Wang, Kevin(Yang) <Kevin1.Wang@amd.com>
> Cc: Quan, Evan <Evan.Quan@amd.com>; Deucher, Alexander <Alexander.Deucher=
@amd.com>; Koenig, Christian <Christian.Koenig@amd.com>; Zhou, David(ChunMi=
ng) <David1.Zhou@amd.com>; David Airlie <airlied@linux.ie>; Daniel Vetter <=
daniel@ffwll.ch>; amd-gfx@lists.freedesktop.org <amd-gfx@lists.freedesktop.=
org>; dri-devel@lists.freedesktop.org <dri-devel@lists.freedesktop.org>; ke=
rnel-janitors@vger.kernel.org <kernel-janitors@vger.kernel.org>
> Subject: [PATCH] drm/amd/powerplay: Fix error handling in smu_init_fb_all=
ocations()
>
> The error handling is off by one.  We should not free the first
> "tables[i].bo" without decrementing "i" because that might result in a
> double free.  The second problem is that when an error occurs, then the
> zeroth element "tables[0].bo" isn't freed.
>
> I had make "i" signed int for the error handling to work, so I just
> updated "ret" as well as a clean up.
>
> Fixes: f96357a991b9 ("drm/amd/powerplay: implement smu_init(fini)_fb_allo=
cations function")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  drivers/gpu/drm/amd/powerplay/amdgpu_smu.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/powerplay/amdgpu_smu.c b/drivers/gpu/drm=
/amd/powerplay/amdgpu_smu.c
> index f1fbbc8b77ee..c9266ea70331 100644
> --- a/drivers/gpu/drm/amd/powerplay/amdgpu_smu.c
> +++ b/drivers/gpu/drm/amd/powerplay/amdgpu_smu.c
> @@ -896,8 +896,7 @@ static int smu_init_fb_allocations(struct smu_context=
 *smu)
>          struct amdgpu_device *adev =3D smu->adev;
>          struct smu_table_context *smu_table =3D &smu->smu_table;
>          struct smu_table *tables =3D smu_table->tables;
> -       uint32_t i =3D 0;
> -       int32_t ret =3D 0;
> +       int ret, i;
>
>          for (i =3D 0; i < SMU_TABLE_COUNT; i++) {
>                  if (tables[i].size =3D=3D 0)
> @@ -915,7 +914,7 @@ static int smu_init_fb_allocations(struct smu_context=
 *smu)
>
>          return 0;
>  failed:
> -       for (; i > 0; i--) {
> +       while (--i >=3D 0) {
>                  if (tables[i].size =3D=3D 0)
>                          continue;
>                  amdgpu_bo_free_kernel(&tables[i].bo,
> --
> 2.20.1
>
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx
