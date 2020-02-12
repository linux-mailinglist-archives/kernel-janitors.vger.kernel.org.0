Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BDBAF15AF07
	for <lists+kernel-janitors@lfdr.de>; Wed, 12 Feb 2020 18:49:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727231AbgBLRtB (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Wed, 12 Feb 2020 12:49:01 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:37898 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726728AbgBLRtB (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 12 Feb 2020 12:49:01 -0500
Received: by mail-wr1-f66.google.com with SMTP id y17so3471078wrh.5
        for <kernel-janitors@vger.kernel.org>; Wed, 12 Feb 2020 09:49:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=4Eaih2PdVYHdSmGENYMMSvWX3QyJJ7JrEJNGJH9JEZU=;
        b=ln4kQduxSGiB5upIehVjBRreX39kBmypfJnssW3OR7RBZZNtuWYO3PqGR3+VgMzG1t
         fa9tTXjW/mwmKjAgXpIxVleaxl6QZ4/3q+qO7Ce+c6+XTGL1jyyQI79R1r0j4b7vQgQ/
         0giUrSnhVOczxC/pcXBFkME/GWYYro3bw5H/Du+GSaTXnnBtjd0xXQGMQHYlrrXMiPPL
         Nh9W7/FCigmutz6cmAHrh85TUYtPb6TqSxlBS3lCJwxQtZy/NaOGaVYj54k8cMTS3OTC
         cxzmFp/11lt6qUiJ6PAh9KgGVyxJ4yD2jiibjccYRvnAScTPGzywaKb3RT9C2VgYTfBf
         T5Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=4Eaih2PdVYHdSmGENYMMSvWX3QyJJ7JrEJNGJH9JEZU=;
        b=Rrbg7z2IezTSLZP/kJRnuPylMYBeaxYl+QmMaB5TM7TV0wti0UTRhJsvDdApdhg6t4
         jRaaDxoQLA8JSjqeGKf6Ptem41xpbBfBeVOQgGSl7xPq0INYJIyU2j7ESfm6UzoEtnhB
         XA1ScKNdGyoOff/wjnHU17+Ar+OfZ1igL7Y3vfxaHvTJr4KzJBDmtITmKbMWF3Ws88yC
         FJHvirZYFU3ZV6wat8SB1eYJEiC+4PEvvW0kMRZJaIlJ8773buezkOIhOhcONXZgzSHS
         PeUyzFwecDB6YHIHM1L2BzVmTlfYM/HlEKFqPM8ZoYMy0u/KeBYxAg1AfDCAHuDMCLIK
         FiwA==
X-Gm-Message-State: APjAAAUgwxjQ0Gqxd6168yBNxxNZ210VzeByBuZlyfYcACg4edj98zrS
        YkVzu6EQ3xVtz8h1D1oeJczdsWeBarPaa11GelE=
X-Google-Smtp-Source: APXvYqx3M86yfLlIgx1VvNO16WAstGtVaFP4WF01P7QzT8uTU/GnS9aP6ymoBfxD6s/TY5Pq13OYRf4QZYzPO33ezTs=
X-Received: by 2002:adf:ec4c:: with SMTP id w12mr17200827wrn.124.1581529740131;
 Wed, 12 Feb 2020 09:49:00 -0800 (PST)
MIME-Version: 1.0
References: <20200212120759.dokjxbk4cqln55sc@kili.mountain> <577d76db-3c2d-545d-6237-1c66f17ec178@amd.com>
In-Reply-To: <577d76db-3c2d-545d-6237-1c66f17ec178@amd.com>
From:   Alex Deucher <alexdeucher@gmail.com>
Date:   Wed, 12 Feb 2020 12:48:49 -0500
Message-ID: <CADnq5_N7E8RK5AEpRrofv5FpMEt4r21U6Qj2V9yfFtO9MS6KyA@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: return -EFAULT if copy_to_user() fails
To:     =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc:     Dan Carpenter <dan.carpenter@oracle.com>,
        Alex Deucher <alexander.deucher@amd.com>,
        Jonathan Kim <Jonathan.Kim@amd.com>,
        Philip Yang <Philip.Yang@amd.com>,
        David Airlie <airlied@linux.ie>,
        Felix Kuehling <Felix.Kuehling@amd.com>,
        "Tianci.Yin" <tianci.yin@amd.com>, kernel-janitors@vger.kernel.org,
        amd-gfx list <amd-gfx@lists.freedesktop.org>,
        Maling list - DRI developers 
        <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Wed, Feb 12, 2020 at 7:12 AM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
> Am 12.02.20 um 13:07 schrieb Dan Carpenter:
> > The copy_to_user() function returns the number of bytes remaining to be
> > copied, but we want to return a negative error code to the user.
> >
> > Fixes: 030d5b97a54b ("drm/amdgpu: use amdgpu_device_vram_access in amdg=
pu_ttm_vram_read")
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>
> Reviewed-by: Christian K=C3=B6nig <christian.koenig@amd.com>
>
> Alex do you want to pick that up or should I do this?
>

Applied.  thanks!

Alex

> Thanks,
> Christian.
>
> > ---
> >   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c | 6 ++----
> >   1 file changed, 2 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/=
amd/amdgpu/amdgpu_ttm.c
> > index 15f5451d312d..660867cf2597 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> > @@ -2280,7 +2280,6 @@ static ssize_t amdgpu_ttm_vram_read(struct file *=
f, char __user *buf,
> >   {
> >       struct amdgpu_device *adev =3D file_inode(f)->i_private;
> >       ssize_t result =3D 0;
> > -     int r;
> >
> >       if (size & 0x3 || *pos & 0x3)
> >               return -EINVAL;
> > @@ -2294,9 +2293,8 @@ static ssize_t amdgpu_ttm_vram_read(struct file *=
f, char __user *buf,
> >               uint32_t value[AMDGPU_TTM_VRAM_MAX_DW_READ];
> >
> >               amdgpu_device_vram_access(adev, *pos, value, bytes, false=
);
> > -             r =3D copy_to_user(buf, value, bytes);
> > -             if (r)
> > -                     return r;
> > +             if (copy_to_user(buf, value, bytes))
> > +                     return -EFAULT;
> >
> >               result +=3D bytes;
> >               buf +=3D bytes;
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
