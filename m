Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2A7FD251CB8
	for <lists+kernel-janitors@lfdr.de>; Tue, 25 Aug 2020 17:53:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726948AbgHYPxv (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Tue, 25 Aug 2020 11:53:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46656 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727078AbgHYPxi (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 25 Aug 2020 11:53:38 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A37CC061574
        for <kernel-janitors@vger.kernel.org>; Tue, 25 Aug 2020 08:53:38 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id c15so13199290wrs.11
        for <kernel-janitors@vger.kernel.org>; Tue, 25 Aug 2020 08:53:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ngF6uQU7ixuw1XTRo+qAFuLlBMgKSvdUAuJUoOBqwdY=;
        b=oENxH/IXbCa/MPNT8mGgy1BtL89X9h94SDCQwQl6tUx0iUKzrqpfP45kt0ebBHNq7b
         OySqEWJUENyZqq8yEOyjca0OPruEEFawqb+hMxLlfAICzl1ISqM1YKh1HFrExLSpXOEl
         iPo5/2xoKKqeOl8hQe+whRwZBmV+uGbpIbG02POnN/W6MgYohaVTV3XKwT4Ri6/jo+1T
         gUb+J+y55v4CXi1X8pOQUzousxQ1BfJWC8Cek4kDiZZmBeoyGu5ZA/Sei0UZCr+o9Rnf
         7UtpSL6E5lC2p0QBcjf+9k6GZKZXG0/JRARQTNC/sw3Pp2b5ZQ4a74aVvPwxq2wr8tMG
         SQgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ngF6uQU7ixuw1XTRo+qAFuLlBMgKSvdUAuJUoOBqwdY=;
        b=BmnKuoYGgC2fJc9heFTxwHfVdBQ7KAqflkzbt3nOOT1rjRlYjGn2kQsI4xZVX1ul7J
         /lcI+mevdJ4rWiDi9+QwFYCjJCw5/J1AaY1p/hMOZ6DzBYkm/PNsF6xl4y0TIN8kCapV
         jMGn8S0Wl71mhO7AV4iRrEcM/MsBljzqLmcrSl58skQqzIIn7JkX2wXSh3Q3OJc2hMYE
         j6qkNOvOlhn/UERjP9ggeOMi3lolTh7hPGegcR1J+ztFmleGTz4k7HrBi4Ji0XPgfIvC
         7xQuCp6n6btLxZWxeyGSIvDRXzCJyKhoQhWn4aAb/+XIXAviPwkzlTUQ+3aJIcn/fKWj
         AALw==
X-Gm-Message-State: AOAM532oHQeDLKUpoNz4UgZ8xagUINu3+Ab+4RR44yWznVBxypNETB9U
        sc8zH6GrWQAQ6+hTo7206INz9baKSP61DoHb0VA=
X-Google-Smtp-Source: ABdhPJwcSV0L9bNnZQyxrgFaK3WFC/84MX5EFoIJAAr/QfLV3IcsmFfcULizfNldA9Qq0O10yVKdLzISnQftAl9vzaE=
X-Received: by 2002:a5d:6085:: with SMTP id w5mr11115815wrt.362.1598370816918;
 Tue, 25 Aug 2020 08:53:36 -0700 (PDT)
MIME-Version: 1.0
References: <20200825111843.GA285523@mwanda>
In-Reply-To: <20200825111843.GA285523@mwanda>
From:   Alex Deucher <alexdeucher@gmail.com>
Date:   Tue, 25 Aug 2020 11:53:25 -0400
Message-ID: <CADnq5_O0f7NdR92PSKFS0zrN4oFb_WJXX1E_HQ9uHzM-4NL2OQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] drm/amdgpu/si: Fix buffer overflow in si_get_register_value()
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Alex Deucher <alexander.deucher@amd.com>,
        Alex Jivin <alex.jivin@amd.com>,
        Frederick Lawler <fred@fredlawl.com>,
        David Airlie <airlied@linux.ie>,
        kernel-janitors@vger.kernel.org,
        amd-gfx list <amd-gfx@lists.freedesktop.org>,
        Sonny Jiang <sonny.jiang@amd.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Helgaas <bhelgaas@google.com>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Monk Liu <Monk.Liu@amd.com>,
        Hawking Zhang <Hawking.Zhang@amd.com>
Content-Type: multipart/mixed; boundary="000000000000c3237905adb5b4d3"
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

--000000000000c3237905adb5b4d3
Content-Type: text/plain; charset="UTF-8"

On Tue, Aug 25, 2020 at 7:21 AM Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> The values for "se_num" and "sh_num" come from the user in the ioctl.
> They can be in the 0-255 range but if they're more than
> AMDGPU_GFX_MAX_SE (4) or AMDGPU_GFX_MAX_SH_PER_SE (2) then it results in
> an out of bounds read.
>
> I split this function into to two to make the error handling simpler.
>
> Fixes: dd5dfa61b4ff ("drm/amdgpu: refine si_read_register")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Good catch.  This is more defensive, but It's a much simpler check to
validate these in the caller.  See the attached patch.

Alex

> ---
>  drivers/gpu/drm/amd/amdgpu/si.c | 157 +++++++++++++++++---------------
>  1 file changed, 85 insertions(+), 72 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/si.c b/drivers/gpu/drm/amd/amdgpu/si.c
> index e330884edd19..ccf39a6932ae 100644
> --- a/drivers/gpu/drm/amd/amdgpu/si.c
> +++ b/drivers/gpu/drm/amd/amdgpu/si.c
> @@ -1051,81 +1051,90 @@ static struct amdgpu_allowed_register_entry si_allowed_read_registers[] = {
>         {PA_SC_RASTER_CONFIG, true},
>  };
>
> -static uint32_t si_get_register_value(struct amdgpu_device *adev,
> -                                     bool indexed, u32 se_num,
> -                                     u32 sh_num, u32 reg_offset)
> -{
> -       if (indexed) {
> -               uint32_t val;
> -               unsigned se_idx = (se_num == 0xffffffff) ? 0 : se_num;
> -               unsigned sh_idx = (sh_num == 0xffffffff) ? 0 : sh_num;
> -
> -               switch (reg_offset) {
> -               case mmCC_RB_BACKEND_DISABLE:
> -                       return adev->gfx.config.rb_config[se_idx][sh_idx].rb_backend_disable;
> -               case mmGC_USER_RB_BACKEND_DISABLE:
> -                       return adev->gfx.config.rb_config[se_idx][sh_idx].user_rb_backend_disable;
> -               case mmPA_SC_RASTER_CONFIG:
> -                       return adev->gfx.config.rb_config[se_idx][sh_idx].raster_config;
> -               }
> +static int si_get_register_value_indexed(struct amdgpu_device *adev,
> +                                         u32 se_num, u32 sh_num,
> +                                         u32 reg_offset, u32 *value)
> +{
> +       unsigned se_idx = (se_num == 0xffffffff) ? 0 : se_num;
> +       unsigned sh_idx = (sh_num == 0xffffffff) ? 0 : sh_num;
>
> -               mutex_lock(&adev->grbm_idx_mutex);
> -               if (se_num != 0xffffffff || sh_num != 0xffffffff)
> -                       amdgpu_gfx_select_se_sh(adev, se_num, sh_num, 0xffffffff);
> +       if (se_idx >= AMDGPU_GFX_MAX_SE ||
> +           sh_idx >= AMDGPU_GFX_MAX_SH_PER_SE)
> +               return -EINVAL;
>
> -               val = RREG32(reg_offset);
> +       switch (reg_offset) {
> +       case mmCC_RB_BACKEND_DISABLE:
> +               *value = adev->gfx.config.rb_config[se_idx][sh_idx].rb_backend_disable;
> +               return 0;
> +       case mmGC_USER_RB_BACKEND_DISABLE:
> +               *value = adev->gfx.config.rb_config[se_idx][sh_idx].user_rb_backend_disable;
> +               return 0;
> +       case mmPA_SC_RASTER_CONFIG:
> +               *value = adev->gfx.config.rb_config[se_idx][sh_idx].raster_config;
> +               return 0;
> +       }
>
> -               if (se_num != 0xffffffff || sh_num != 0xffffffff)
> -                       amdgpu_gfx_select_se_sh(adev, 0xffffffff, 0xffffffff, 0xffffffff);
> -               mutex_unlock(&adev->grbm_idx_mutex);
> -               return val;
> -       } else {
> -               unsigned idx;
> -
> -               switch (reg_offset) {
> -               case mmGB_ADDR_CONFIG:
> -                       return adev->gfx.config.gb_addr_config;
> -               case mmMC_ARB_RAMCFG:
> -                       return adev->gfx.config.mc_arb_ramcfg;
> -               case mmGB_TILE_MODE0:
> -               case mmGB_TILE_MODE1:
> -               case mmGB_TILE_MODE2:
> -               case mmGB_TILE_MODE3:
> -               case mmGB_TILE_MODE4:
> -               case mmGB_TILE_MODE5:
> -               case mmGB_TILE_MODE6:
> -               case mmGB_TILE_MODE7:
> -               case mmGB_TILE_MODE8:
> -               case mmGB_TILE_MODE9:
> -               case mmGB_TILE_MODE10:
> -               case mmGB_TILE_MODE11:
> -               case mmGB_TILE_MODE12:
> -               case mmGB_TILE_MODE13:
> -               case mmGB_TILE_MODE14:
> -               case mmGB_TILE_MODE15:
> -               case mmGB_TILE_MODE16:
> -               case mmGB_TILE_MODE17:
> -               case mmGB_TILE_MODE18:
> -               case mmGB_TILE_MODE19:
> -               case mmGB_TILE_MODE20:
> -               case mmGB_TILE_MODE21:
> -               case mmGB_TILE_MODE22:
> -               case mmGB_TILE_MODE23:
> -               case mmGB_TILE_MODE24:
> -               case mmGB_TILE_MODE25:
> -               case mmGB_TILE_MODE26:
> -               case mmGB_TILE_MODE27:
> -               case mmGB_TILE_MODE28:
> -               case mmGB_TILE_MODE29:
> -               case mmGB_TILE_MODE30:
> -               case mmGB_TILE_MODE31:
> -                       idx = (reg_offset - mmGB_TILE_MODE0);
> -                       return adev->gfx.config.tile_mode_array[idx];
> -               default:
> -                       return RREG32(reg_offset);
> -               }
> +       mutex_lock(&adev->grbm_idx_mutex);
> +       if (se_num != 0xffffffff || sh_num != 0xffffffff)
> +               amdgpu_gfx_select_se_sh(adev, se_num, sh_num, 0xffffffff);
> +
> +       *value = RREG32(reg_offset);
> +
> +       if (se_num != 0xffffffff || sh_num != 0xffffffff)
> +               amdgpu_gfx_select_se_sh(adev, 0xffffffff, 0xffffffff, 0xffffffff);
> +       mutex_unlock(&adev->grbm_idx_mutex);
> +       return 0;
> +}
> +
> +static uint32_t si_get_register_value(struct amdgpu_device *adev,
> +                                     u32 reg_offset)
> +{
> +       unsigned idx;
> +
> +       switch (reg_offset) {
> +       case mmGB_ADDR_CONFIG:
> +               return adev->gfx.config.gb_addr_config;
> +       case mmMC_ARB_RAMCFG:
> +               return adev->gfx.config.mc_arb_ramcfg;
> +       case mmGB_TILE_MODE0:
> +       case mmGB_TILE_MODE1:
> +       case mmGB_TILE_MODE2:
> +       case mmGB_TILE_MODE3:
> +       case mmGB_TILE_MODE4:
> +       case mmGB_TILE_MODE5:
> +       case mmGB_TILE_MODE6:
> +       case mmGB_TILE_MODE7:
> +       case mmGB_TILE_MODE8:
> +       case mmGB_TILE_MODE9:
> +       case mmGB_TILE_MODE10:
> +       case mmGB_TILE_MODE11:
> +       case mmGB_TILE_MODE12:
> +       case mmGB_TILE_MODE13:
> +       case mmGB_TILE_MODE14:
> +       case mmGB_TILE_MODE15:
> +       case mmGB_TILE_MODE16:
> +       case mmGB_TILE_MODE17:
> +       case mmGB_TILE_MODE18:
> +       case mmGB_TILE_MODE19:
> +       case mmGB_TILE_MODE20:
> +       case mmGB_TILE_MODE21:
> +       case mmGB_TILE_MODE22:
> +       case mmGB_TILE_MODE23:
> +       case mmGB_TILE_MODE24:
> +       case mmGB_TILE_MODE25:
> +       case mmGB_TILE_MODE26:
> +       case mmGB_TILE_MODE27:
> +       case mmGB_TILE_MODE28:
> +       case mmGB_TILE_MODE29:
> +       case mmGB_TILE_MODE30:
> +       case mmGB_TILE_MODE31:
> +               idx = (reg_offset - mmGB_TILE_MODE0);
> +               return adev->gfx.config.tile_mode_array[idx];
> +       default:
> +               return RREG32(reg_offset);
>         }
>  }
> +
>  static int si_read_register(struct amdgpu_device *adev, u32 se_num,
>                              u32 sh_num, u32 reg_offset, u32 *value)
>  {
> @@ -1138,8 +1147,12 @@ static int si_read_register(struct amdgpu_device *adev, u32 se_num,
>                 if (reg_offset != si_allowed_read_registers[i].reg_offset)
>                         continue;
>
> -               *value = si_get_register_value(adev, indexed, se_num, sh_num,
> -                                              reg_offset);
> +               if (indexed)
> +                       return si_get_register_value_indexed(adev,
> +                                                            se_num, sh_num,
> +                                                            reg_offset, value);
> +
> +               *value = si_get_register_value(adev, reg_offset);
>                 return 0;
>         }
>         return -EINVAL;
> --
> 2.28.0
>
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx

--000000000000c3237905adb5b4d3
Content-Type: text/x-patch; charset="US-ASCII"; 
	name="0001-drm-amdgpu-Fix-buffer-overflow-in-INFO-ioctl.patch"
Content-Disposition: attachment; 
	filename="0001-drm-amdgpu-Fix-buffer-overflow-in-INFO-ioctl.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_kea4oh2s0>
X-Attachment-Id: f_kea4oh2s0

RnJvbSAyZDZjMWFiYWVhYjU0NTYxNDUyYjE0YzVkNzAyZjUxMjM1YWU1YTcwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5j
b20+CkRhdGU6IFR1ZSwgMjUgQXVnIDIwMjAgMTE6NDM6NDUgLTA0MDAKU3ViamVjdDogW1BBVENI
XSBkcm0vYW1kZ3B1OiBGaXggYnVmZmVyIG92ZXJmbG93IGluIElORk8gaW9jdGwKClRoZSB2YWx1
ZXMgZm9yICJzZV9udW0iIGFuZCAic2hfbnVtIiBjb21lIGZyb20gdGhlIHVzZXIgaW4gdGhlIGlv
Y3RsLgpUaGV5IGNhbiBiZSBpbiB0aGUgMC0yNTUgcmFuZ2UgYnV0IGlmIHRoZXkncmUgbW9yZSB0
aGFuCkFNREdQVV9HRlhfTUFYX1NFICg0KSBvciBBTURHUFVfR0ZYX01BWF9TSF9QRVJfU0UgKDIp
IHRoZW4gaXQgcmVzdWx0cyBpbgphbiBvdXQgb2YgYm91bmRzIHJlYWQuCgpSZXBvcnRlZC1ieTog
RGFuIENhcnBlbnRlciA8ZGFuLmNhcnBlbnRlckBvcmFjbGUuY29tPgpTaWduZWQtb2ZmLWJ5OiBB
bGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2ttcy5jIHwgNCArKysrCiAxIGZpbGUgY2hhbmdlZCwgNCBp
bnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1k
Z3B1X2ttcy5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2ttcy5jCmluZGV4
IDdhZThiMGVlNDYxMC4uOWY4MGVhZWFmMGFlIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9hbWRncHVfa21zLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
YW1kZ3B1X2ttcy5jCkBAIC02NjksOCArNjY5LDEyIEBAIHN0YXRpYyBpbnQgYW1kZ3B1X2luZm9f
aW9jdGwoc3RydWN0IGRybV9kZXZpY2UgKmRldiwgdm9pZCAqZGF0YSwgc3RydWN0IGRybV9maWxl
CiAJCSAqIGluIHRoZSBiaXRmaWVsZHMgKi8KIAkJaWYgKHNlX251bSA9PSBBTURHUFVfSU5GT19N
TVJfU0VfSU5ERVhfTUFTSykKIAkJCXNlX251bSA9IDB4ZmZmZmZmZmY7CisJCWVsc2UgaWYgKHNl
X251bSA+PSBBTURHUFVfR0ZYX01BWF9TRSkKKwkJCXJldHVybiAtRUlOVkFMOwogCQlpZiAoc2hf
bnVtID09IEFNREdQVV9JTkZPX01NUl9TSF9JTkRFWF9NQVNLKQogCQkJc2hfbnVtID0gMHhmZmZm
ZmZmZjsKKwkJZWxzZSBpZiAoc2hfbnVtID49IEFNREdQVV9HRlhfTUFYX1NIX1BFUl9TRSkKKwkJ
CXJldHVybiAtRUlOVkFMOwogCiAJCWlmIChpbmZvLT5yZWFkX21tcl9yZWcuY291bnQgPiAxMjgp
CiAJCQlyZXR1cm4gLUVJTlZBTDsKLS0gCjIuMjUuNAoK
--000000000000c3237905adb5b4d3--
