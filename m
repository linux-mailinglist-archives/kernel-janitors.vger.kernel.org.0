Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A698F1F5C02
	for <lists+kernel-janitors@lfdr.de>; Wed, 10 Jun 2020 21:37:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729982AbgFJThA (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Wed, 10 Jun 2020 15:37:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54772 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727011AbgFJTg7 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 10 Jun 2020 15:36:59 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15143C03E96B
        for <kernel-janitors@vger.kernel.org>; Wed, 10 Jun 2020 12:36:59 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id r7so3659288wro.1
        for <kernel-janitors@vger.kernel.org>; Wed, 10 Jun 2020 12:36:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=zK9Na9bM9IaNoE4p4nOpguw7r1p99iLUMMW//x2Gu0c=;
        b=CZy/EcESP55U+vnTvyKyaWf+KdsrMo8yLlgBFIkxyURkI1TsR9rV1cBCs3ZiqVPeXj
         JQ4RZGnTAGfD/GTCPDXSDGpb+tRVYkrs+AwvoDsoRofpdSQUvktj8njNHU70+WyRWZDi
         l0K1aP7ZndaJIQAJZef9uAVh7Colw73aeLO44VFOoFkkVjHCZyomrv9sQWvzIuCMGgVZ
         id6Eui98tIKj1MKFkSCEykQbSHgaYN8aOFFOLM2UT+zRwDtDriZU16bwSWPvHYem6IvH
         9C+55LU9UzzPdbnGKgU3lxqFJgwgU2PLW5+LPYeFCQvPNj37Lj6x8iUH961zabPXtCgX
         Jq4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=zK9Na9bM9IaNoE4p4nOpguw7r1p99iLUMMW//x2Gu0c=;
        b=jBUrciSIFWbTwzj0jkAq0UTGFq8xhfxJ2ILSRQb863oItE1IvykC+d7G+gWl8aEq2v
         RhYQWtOkeyrh6tESnlUsDpr5dvzmGXvXGKRqtahxWItW+weuWopnqkNa3SVlks6j4M7i
         uxhhF8h0S5R2bXWqG3crNx7Ap5DTr2KhR30y/EdkMwjf/5ajdkmJOf9t9iQtiv0CdcJg
         Cu5XFaNr7fVS0JAIocJr7tP0FamdOV99CyF6pI29rQpgO8MZ/yGRk5YyzLa0sgXNiQ/d
         7YNVfyFqDAK0t3SunuVjgw30CesAEMLHid87nJrTkaQ+ZqqpNknPicj2r1Kho6CnWSts
         kkng==
X-Gm-Message-State: AOAM531CJ7omklzXDWny5Y4gN4K88BRYXg4XnUzIgSFhE63wsF+0QGVZ
        4woUcX41Kw0ZZkmCpG6VpOAi1bQk9UhiWoei9V8=
X-Google-Smtp-Source: ABdhPJzdnrAJ9XnOAge2SeI9sCnxMlkwX2bJfV3ZkxCAqaZKLwPyw3WK0bsN7RRXFvz+iWZMxi+6pa+KWG4bQr9peGs=
X-Received: by 2002:adf:fd41:: with SMTP id h1mr5625751wrs.374.1591817817732;
 Wed, 10 Jun 2020 12:36:57 -0700 (PDT)
MIME-Version: 1.0
References: <DM6PR12MB26194168100E5F96FF94D066E4820@DM6PR12MB2619.namprd12.prod.outlook.com>
 <20200610085653.GA5439@mwanda> <DM6PR12MB2619D7FBF176EEA50DB3E2AAE4830@DM6PR12MB2619.namprd12.prod.outlook.com>
In-Reply-To: <DM6PR12MB2619D7FBF176EEA50DB3E2AAE4830@DM6PR12MB2619.namprd12.prod.outlook.com>
From:   Alex Deucher <alexdeucher@gmail.com>
Date:   Wed, 10 Jun 2020 15:36:45 -0400
Message-ID: <CADnq5_MwY0Jme+K_Cdu2Gaq-P4DcHq-CzVP3BD1sE+F22z-a5w@mail.gmail.com>
Subject: Re: [PATCH v2] drm/amdgpu: Fix a buffer overflow handling the serial number
To:     "Quan, Evan" <Evan.Quan@amd.com>
Cc:     Dan Carpenter <dan.carpenter@oracle.com>,
        "Deucher, Alexander" <Alexander.Deucher@amd.com>,
        "Xiao, Jack" <Jack.Xiao@amd.com>,
        "Kim, Jonathan" <Jonathan.Kim@amd.com>,
        "Greathouse, Joseph" <Joseph.Greathouse@amd.com>,
        David Airlie <airlied@linux.ie>,
        "Kuehling, Felix" <Felix.Kuehling@amd.com>,
        "Zhou1, Tao" <Tao.Zhou1@amd.com>,
        "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>,
        "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
        "Ma, Le" <Le.Ma@amd.com>, Daniel Vetter <daniel@ffwll.ch>,
        "Koenig, Christian" <Christian.Koenig@amd.com>,
        "Zhang, Hawking" <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Wed, Jun 10, 2020 at 6:57 AM Quan, Evan <Evan.Quan@amd.com> wrote:
>
> [AMD Official Use Only - Internal Distribution Only]
>
> Reviewed-by: Evan Quan <evan.quan@amd.com>

Applied.  Thanks!

Alex


>
> -----Original Message-----
> From: Dan Carpenter <dan.carpenter@oracle.com>
> Sent: Wednesday, June 10, 2020 4:57 PM
> To: Deucher, Alexander <Alexander.Deucher@amd.com>
> Cc: Koenig, Christian <Christian.Koenig@amd.com>; David Airlie <airlied@l=
inux.ie>; Daniel Vetter <daniel@ffwll.ch>; Quan, Evan <Evan.Quan@amd.com>; =
Zhang, Hawking <Hawking.Zhang@amd.com>; Kuehling, Felix <Felix.Kuehling@amd=
.com>; Zhou1, Tao <Tao.Zhou1@amd.com>; Ma, Le <Le.Ma@amd.com>; Xiao, Jack <=
Jack.Xiao@amd.com>; Kim, Jonathan <Jonathan.Kim@amd.com>; Greathouse, Josep=
h <Joseph.Greathouse@amd.com>; amd-gfx@lists.freedesktop.org; kernel-janito=
rs@vger.kernel.org
> Subject: [PATCH v2] drm/amdgpu: Fix a buffer overflow handling the serial=
 number
>
> The comments say that the serial number is a 16-digit HEX string so the
> buffer needs to be at least 17 characters to hold the NUL terminator.
>
> The other issue is that "size" returned from sprintf() is the number of
> characters before the NUL terminator so the memcpy() wasn't copying the
> terminator.  The serial number needs to be NUL terminated so that it
> doesn't lead to a read overflow in amdgpu_device_get_serial_number().
> Also it's just cleaner and faster to sprintf() directly to adev->serial[]
> instead of using a temporary buffer.
>
> Fixes: 81a16241114b ("drm/amdgpu: Add unique_id and serial_number for Arc=
turus v3")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> v2: Change adev->serial.  The original patch would have just moved the
> overflow until amdgpu_device_get_serial_number() is called.
>
>  drivers/gpu/drm/amd/amdgpu/amdgpu.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu.h          | 2 +-
>  drivers/gpu/drm/amd/powerplay/arcturus_ppt.c | 6 ++----
>  2 files changed, 3 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/am=
dgpu/amdgpu.h
> index 135530286f34f..905cf0bac100c 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> @@ -986,7 +986,7 @@ struct amdgpu_device {
>  /* Chip product information */
>  charproduct_number[16];
>  charproduct_name[32];
> -charserial[16];
> +charserial[20];
>
>  struct amdgpu_autodumpautodump;
>
> diff --git a/drivers/gpu/drm/amd/powerplay/arcturus_ppt.c b/drivers/gpu/d=
rm/amd/powerplay/arcturus_ppt.c
> index df7b408319f76..d58146a5fa21d 100644
> --- a/drivers/gpu/drm/amd/powerplay/arcturus_ppt.c
> +++ b/drivers/gpu/drm/amd/powerplay/arcturus_ppt.c
> @@ -2265,8 +2265,7 @@ static void arcturus_i2c_eeprom_control_fini(struct=
 i2c_adapter *control)
>  static void arcturus_get_unique_id(struct smu_context *smu)
>  {
>  struct amdgpu_device *adev =3D smu->adev;
> -uint32_t top32, bottom32, smu_version, size;
> -char sn[16];
> +uint32_t top32, bottom32, smu_version;
>  uint64_t id;
>
>  if (smu_get_smc_version(smu, NULL, &smu_version)) {
> @@ -2289,8 +2288,7 @@ static void arcturus_get_unique_id(struct smu_conte=
xt *smu)
>  /* For Arcturus-and-later, unique_id =3D=3D serial_number, so convert it=
 to a
>   * 16-digit HEX string for convenience and backwards-compatibility
>   */
> -size =3D sprintf(sn, "%llx", id);
> -memcpy(adev->serial, &sn, size);
> +sprintf(adev->serial, "%llx", id);
>  }
>
>  static bool arcturus_is_baco_supported(struct smu_context *smu)
> --
> 2.26.2
>
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx
