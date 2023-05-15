Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 69B25703FE9
	for <lists+kernel-janitors@lfdr.de>; Mon, 15 May 2023 23:38:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245599AbjEOViA (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Mon, 15 May 2023 17:38:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33742 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245437AbjEOVhx (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 15 May 2023 17:37:53 -0400
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com [IPv6:2607:f8b0:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 77A9F59FF;
        Mon, 15 May 2023 14:37:52 -0700 (PDT)
Received: by mail-ot1-x335.google.com with SMTP id 46e09a7af769-6ab032b33cdso8791433a34.0;
        Mon, 15 May 2023 14:37:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684186672; x=1686778672;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FVMuxsS2AyLD1/V6++7XAV6yzgy8hSgIj+BDEQpjE54=;
        b=W9HDZcGnI9+ek1B7bA8FaHB9lwyhGmNZ1EgymTz3gar98sh3Or8gWpjTUZc98Vvuxu
         RLCv0qc+o81LEY28txxkm6OUX5ktmYkyrWoYejBEnUjE1FXTTECubtbB+xCc1wfchBho
         YjtINtPiVfdbLFbnZyW8aqLfOcBlqmf7Vg/mcugnITYr5ttiwln0rsGs0SYqlimKhpYe
         kvnh3BcyRJFam57GY671VH2x7ZcUq4kZWhA4fLrDKpjLKMHfhbkFm+CysfYuYtejBUi3
         NNc/1943cCWeqscFO2U7Pgy7P3uk+7LuYKdtfhgT5cujuwq9lnBBRjAMXKCOD//R02r/
         Rdyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684186672; x=1686778672;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FVMuxsS2AyLD1/V6++7XAV6yzgy8hSgIj+BDEQpjE54=;
        b=SDCzH1A1kSwjrKLiWG7ZdUzPMbvEEA37Jk5xGs9ZfdajS3+CuoUR4FRedSfdKbe5li
         bu6xiFoyi2ISwXIl1OWN7IPrDEquMlfYvLS824C52DDjxo0GwwMq6I2mO10K0k9yDdf+
         GjUI9/AzOqc1IjUtU8L0kEV3kZ7QNJGH/qnCxviyiljZlFm8wT/5X57Xpbh9KWahY6sS
         Ipe5mFhV581xTavE6pL8TNIRgV2wxxvM+/6y38BCrnK5Dv5Xd1jatFFEtWIZfMbNy2iH
         6AhT2aOORFwVo6vKZjd3RNnPNwMI/M3qd6j6QI9aNUunG18K6AAfe0fAiKhIv2iLqQfy
         IGEw==
X-Gm-Message-State: AC+VfDwMn7wR0oFXak1ml2oKyH4oxWUD0Exd/lcvdHeBNtk2bG416sJr
        kxzTTO0R7+iJmyjJb4p2iceph6u6IXkeFsI3NiCM0nEH
X-Google-Smtp-Source: ACHHUZ5K6xhtdZFLWfE9KZFvociY3IW0kLIpPtgnTWZicz58dwr3NJLbILYSjo9mLv2/bBwnM3yBG58OdClHpPvuPN8=
X-Received: by 2002:a05:6808:211f:b0:395:dd60:852c with SMTP id
 r31-20020a056808211f00b00395dd60852cmr5465165oiw.43.1684186671678; Mon, 15
 May 2023 14:37:51 -0700 (PDT)
MIME-Version: 1.0
References: <20230515013428.38798-1-suhui@nfschina.com>
In-Reply-To: <20230515013428.38798-1-suhui@nfschina.com>
From:   Alex Deucher <alexdeucher@gmail.com>
Date:   Mon, 15 May 2023 17:37:40 -0400
Message-ID: <CADnq5_ND5fdXh0=HubG9xh9D30ZNQSQwVgQ9GasxmwB_mtWdMA@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: remove unnecessary (void*) conversions
To:     Su Hui <suhui@nfschina.com>
Cc:     Alex Deucher <alexander.deucher@amd.com>, christian.koenig@amd.com,
        Xinhui.Pan@amd.com, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org,
        amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Applied.  Thanks!

Alex

On Mon, May 15, 2023 at 3:18=E2=80=AFAM Su Hui <suhui@nfschina.com> wrote:
>
> No need cast (void*) to (struct amdgpu_device *).
>
> Signed-off-by: Su Hui <suhui@nfschina.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c | 4 ++--
>  drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c   | 2 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c     | 2 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ib.c      | 2 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c     | 2 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c     | 2 +-
>  6 files changed, 7 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c b/drivers/gpu/dr=
m/amd/amdgpu/amdgpu_debugfs.c
> index f60753f97ac5..c837e0bf2cfc 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
> @@ -1470,7 +1470,7 @@ int amdgpu_debugfs_regs_init(struct amdgpu_device *=
adev)
>
>  static int amdgpu_debugfs_test_ib_show(struct seq_file *m, void *unused)
>  {
> -       struct amdgpu_device *adev =3D (struct amdgpu_device *)m->private=
;
> +       struct amdgpu_device *adev =3D m->private;
>         struct drm_device *dev =3D adev_to_drm(adev);
>         int r =3D 0, i;
>
> @@ -1581,7 +1581,7 @@ static int amdgpu_debugfs_benchmark(void *data, u64=
 val)
>
>  static int amdgpu_debugfs_vm_info_show(struct seq_file *m, void *unused)
>  {
> -       struct amdgpu_device *adev =3D (struct amdgpu_device *)m->private=
;
> +       struct amdgpu_device *adev =3D m->private;
>         struct drm_device *dev =3D adev_to_drm(adev);
>         struct drm_file *file;
>         int r;
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c b/drivers/gpu/drm/=
amd/amdgpu/amdgpu_fence.c
> index f52d0ba91a77..f0615a43b3cc 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
> @@ -835,7 +835,7 @@ static const struct dma_fence_ops amdgpu_job_fence_op=
s =3D {
>  #if defined(CONFIG_DEBUG_FS)
>  static int amdgpu_debugfs_fence_info_show(struct seq_file *m, void *unus=
ed)
>  {
> -       struct amdgpu_device *adev =3D (struct amdgpu_device *)m->private=
;
> +       struct amdgpu_device *adev =3D m->private;
>         int i;
>
>         for (i =3D 0; i < AMDGPU_MAX_RINGS; ++i) {
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c b/drivers/gpu/drm/am=
d/amdgpu/amdgpu_gem.c
> index 863cb668e000..28f79cf8c3fb 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
> @@ -948,7 +948,7 @@ int amdgpu_mode_dumb_create(struct drm_file *file_pri=
v,
>  #if defined(CONFIG_DEBUG_FS)
>  static int amdgpu_debugfs_gem_info_show(struct seq_file *m, void *unused=
)
>  {
> -       struct amdgpu_device *adev =3D (struct amdgpu_device *)m->private=
;
> +       struct amdgpu_device *adev =3D m->private;
>         struct drm_device *dev =3D adev_to_drm(adev);
>         struct drm_file *file;
>         int r;
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ib.c b/drivers/gpu/drm/amd=
/amdgpu/amdgpu_ib.c
> index 4ff348e10e4d..49a4238a120e 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ib.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ib.c
> @@ -436,7 +436,7 @@ int amdgpu_ib_ring_tests(struct amdgpu_device *adev)
>
>  static int amdgpu_debugfs_sa_info_show(struct seq_file *m, void *unused)
>  {
> -       struct amdgpu_device *adev =3D (struct amdgpu_device *)m->private=
;
> +       struct amdgpu_device *adev =3D m->private;
>
>         seq_printf(m, "--------------------- DELAYED --------------------=
- \n");
>         amdgpu_sa_bo_dump_debug_info(&adev->ib_pools[AMDGPU_IB_POOL_DELAY=
ED],
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c b/drivers/gpu/drm/am=
d/amdgpu/amdgpu_kms.c
> index 0efb38539d70..9f9274249b57 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
> @@ -1441,7 +1441,7 @@ void amdgpu_disable_vblank_kms(struct drm_crtc *crt=
c)
>
>  static int amdgpu_debugfs_firmware_info_show(struct seq_file *m, void *u=
nused)
>  {
> -       struct amdgpu_device *adev =3D (struct amdgpu_device *)m->private=
;
> +       struct amdgpu_device *adev =3D m->private;
>         struct drm_amdgpu_info_firmware fw_info;
>         struct drm_amdgpu_query_fw query_fw;
>         struct atom_context *ctx =3D adev->mode_info.atom_context;
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/am=
d/amdgpu/amdgpu_ttm.c
> index 2cd081cbf706..21f340ed4cca 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> @@ -2164,7 +2164,7 @@ int amdgpu_ttm_evict_resources(struct amdgpu_device=
 *adev, int mem_type)
>
>  static int amdgpu_ttm_page_pool_show(struct seq_file *m, void *unused)
>  {
> -       struct amdgpu_device *adev =3D (struct amdgpu_device *)m->private=
;
> +       struct amdgpu_device *adev =3D m->private;
>
>         return ttm_pool_debugfs(&adev->mman.bdev.pool, m);
>  }
> --
> 2.30.2
>
