Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8288C135031
	for <lists+kernel-janitors@lfdr.de>; Thu,  9 Jan 2020 00:58:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727615AbgAHX6Q (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Wed, 8 Jan 2020 18:58:16 -0500
Received: from mail-vs1-f66.google.com ([209.85.217.66]:37056 "EHLO
        mail-vs1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726758AbgAHX6Q (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 8 Jan 2020 18:58:16 -0500
Received: by mail-vs1-f66.google.com with SMTP id x18so3102104vsq.4
        for <kernel-janitors@vger.kernel.org>; Wed, 08 Jan 2020 15:58:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+nZtXADyrfsNI2t3xLAuGKVhqb37ykNuxCZAZeGw7DM=;
        b=iAwp+fCZaLvX/muKgM754JeMKkD7idPOE2o7PBHbcHzg8JrSG9zoSSF8EWXOFtA401
         dJXpNx32dwiM/LpOeFiZzJj7024cqsQjZzo2+uHMPahH7M6q2DwhDj2xXlPMvBTB+HUX
         ERou0n5/WG8WT/ChA5nV37bgtXguRvx2iitV2vuHgfmeu28VT/JtjdL/ojyy3Yr8x2/a
         9yrz19jR9B86daH/XECUu6lf0GiA3kSGX7M2m/6/IDBixPzjlEkdxQdy0KsBfEBJLuhM
         Camx9I79Gv0kE74xTlqoDKMcOOuO94fWkejGl6H5xrTUhhUfNyuwy0Ksim/OArakUpsI
         araw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+nZtXADyrfsNI2t3xLAuGKVhqb37ykNuxCZAZeGw7DM=;
        b=nkl/zDm836WTzcIZjB3gwN7lX9db6veqkfPtC/30W2oJrwJTfRhxAkyz6N3DYcxOlM
         FiHvDxydwa7t6zILh7u9DcWLJhLTjWUWvKej6jskGnrFv7Y4MHIhHa6YL4zAy4YjFvVT
         UBVOqf0mV7VF9LxE6o8vsrCUPKGwQl9sOZjeOMsVuEz/n1vZSVYaC7xIzQakKEoFAgSi
         7UarDcOmlWAdy9JAJOpBfQ2Lm4io2oZu8R+lOmgTbRw26xIv79Z7COQeEUKIy02ssDlA
         n8H4KQztLlQVYj57CBgK26jBXDmaBlrlC6tLA91I3xLS33BS63KbgWKEMUu7N57rw6+s
         3v2g==
X-Gm-Message-State: APjAAAXP/XfXAnu1OIwrNgqS27czrdvIiyObzb8CIALUZcXSUnz1gu9i
        MCkLELCZRDHfYHBeL9ZJcgls+AH1eL8pThtB+bE=
X-Google-Smtp-Source: APXvYqxMq8zNTpaV3+2pz3t18Kf9P+tFw/MULex1slX6odPImj9OrwG/evNC/zqK9OvL+pybbZSddcdWPVmyb0WaKjQ=
X-Received: by 2002:a05:6102:3126:: with SMTP id f6mr4480683vsh.204.1578527895518;
 Wed, 08 Jan 2020 15:58:15 -0800 (PST)
MIME-Version: 1.0
References: <20200108054601.mdwwtcqqpge2iwca@kili.mountain>
In-Reply-To: <20200108054601.mdwwtcqqpge2iwca@kili.mountain>
From:   Ben Skeggs <skeggsb@gmail.com>
Date:   Thu, 9 Jan 2020 09:58:04 +1000
Message-ID: <CACAvsv4ifPYma15xDfu43yanyznpNFyN1vgFrYmao=tdhE6Qjg@mail.gmail.com>
Subject: Re: [PATCH] nouveau/secboot/gm20b: initialize pointer in gm20b_secboot_new()
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>,
        ML nouveau <nouveau@lists.freedesktop.org>,
        kernel-janitors@vger.kernel.org,
        ML dri-devel <dri-devel@lists.freedesktop.org>,
        Alexandre Courbot <acourbot@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Wed, 8 Jan 2020 at 15:46, Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> We accidentally set "psb" which is a no-op instead of "*psb" so it
> generates a static checker warning.  We should probably set it before
> the first error return so that it's always initialized.
You actually don't need to do either, *psb will be NULL already on
entry to the function.  But removing the assignment in the error path
should be done still.

Ben.

>
> Fixes: 923f1bd27bf1 ("drm/nouveau/secboot/gm20b: add secure boot support")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> Static analysis.  I'm not sure how this is called.
>
>  drivers/gpu/drm/nouveau/nvkm/subdev/secboot/gm20b.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/secboot/gm20b.c b/drivers/gpu/drm/nouveau/nvkm/subdev/secboot/gm20b.c
> index df8b919dcf09..ace6fefba428 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/secboot/gm20b.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/secboot/gm20b.c
> @@ -108,6 +108,7 @@ gm20b_secboot_new(struct nvkm_device *device, int index,
>         struct gm200_secboot *gsb;
>         struct nvkm_acr *acr;
>
> +       *psb = NULL;
>         acr = acr_r352_new(BIT(NVKM_SECBOOT_FALCON_FECS) |
>                            BIT(NVKM_SECBOOT_FALCON_PMU));
>         if (IS_ERR(acr))
> @@ -116,10 +117,8 @@ gm20b_secboot_new(struct nvkm_device *device, int index,
>         acr->optional_falcons = BIT(NVKM_SECBOOT_FALCON_PMU);
>
>         gsb = kzalloc(sizeof(*gsb), GFP_KERNEL);
> -       if (!gsb) {
> -               psb = NULL;
> +       if (!gsb)
>                 return -ENOMEM;
> -       }
>         *psb = &gsb->base;
>
>         ret = nvkm_secboot_ctor(&gm20b_secboot, acr, device, index, &gsb->base);
> --
> 2.11.0
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
