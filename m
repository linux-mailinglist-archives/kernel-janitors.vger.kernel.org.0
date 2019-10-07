Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 58F8CCE910
	for <lists+kernel-janitors@lfdr.de>; Mon,  7 Oct 2019 18:23:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728079AbfJGQXn (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Mon, 7 Oct 2019 12:23:43 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:33673 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728387AbfJGQXm (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 7 Oct 2019 12:23:42 -0400
Received: by mail-wr1-f68.google.com with SMTP id b9so16103060wrs.0
        for <kernel-janitors@vger.kernel.org>; Mon, 07 Oct 2019 09:23:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=OFlhJbSi23b2NFiSK6+YKaIl+Aw85wcuS6pgAqIhXRY=;
        b=SItsYgREmxzYuNcynIf8NfPJgmDqq38v6u6tdKmMTV7HpHdcXnEkL+ntMCEn720gsB
         VoGn8j+nU4yJl7L0akvUFNooPq4Iaa7B3GhUk9K6uqTqohMFGd9itxWhUITLfNq6jWv0
         l/hutITWJ7OGMJfdMQdGzsCOtg9QsLrt06R3GSx4Db4ZmNs96ywSjjVkM4rq6kE8HVVA
         9CAOl5mt9erRDCZ0YwY1pbi1U03U4ae6iR6MqM+oytK6LKkFunia7PamfsO7RkDXqip9
         bGJxvWJlXcdgDhRxsr04sQob4zFX+/OPpamIa1j+d74+Ek5BxzdLAgsTfEFgpI+Nwiiz
         ikWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=OFlhJbSi23b2NFiSK6+YKaIl+Aw85wcuS6pgAqIhXRY=;
        b=I2pP3HWUPj1AcDFjK8pXrftM6Cdkj2sdshM22aAw8LoUek9SuGekjth1GdtHPrNPKI
         KFcoyI0NIEMSpGZWyCIx7qQ89rgZykX0x7P195RfYJ6uWj3Voz/iVrZ4nsiXvrzPyxUs
         or3R6fcgPG5fgI3Zgm0bmusXIkoEXgYYoy4aRrHwud1kva7zdw6irUb5wR0Z7XVvI9Gp
         ynZZTfPQdYIfplzXjNLTPvC7QI5dkvIVeRN2iTSqSnRoqc4JCQY4sRlf+maTFiX/8GiP
         JxNkoQTbLGS5eaUm32tmdkpeO/zBvakBJvovj0dZIYsRL+Igo6nTlR//uVKVvZg/QhU0
         V9qQ==
X-Gm-Message-State: APjAAAXasOEt9e9+3kdEvzZPB36F/ObNiHyxACk38b58X+cnAMEpvNTE
        azSLvJCMjrI9bxlXrnOOEnhF3YABC8NYDYr3J80=
X-Google-Smtp-Source: APXvYqzHtsoox7+vQL8r8xNyNG2fI+P4YKL+4ELMDUE83Kc1Res1M3I9ltfd6U++IXXqArcxJLCXAg9VkSYS6k/8ba8=
X-Received: by 2002:a5d:6052:: with SMTP id j18mr12936827wrt.40.1570465420545;
 Mon, 07 Oct 2019 09:23:40 -0700 (PDT)
MIME-Version: 1.0
References: <20191007090454.GE3865@mwanda> <MN2PR12MB3296695EB3D9799B10971184A29B0@MN2PR12MB3296.namprd12.prod.outlook.com>
In-Reply-To: <MN2PR12MB3296695EB3D9799B10971184A29B0@MN2PR12MB3296.namprd12.prod.outlook.com>
From:   Alex Deucher <alexdeucher@gmail.com>
Date:   Mon, 7 Oct 2019 12:23:27 -0400
Message-ID: <CADnq5_N3=qpKJ2YaP4h=SMnNU1jP8Y9VhwqfhzYZos7txQgcMw@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/powerplay: unlock on error in smu_resume()
To:     "Wang, Kevin(Yang)" <Kevin1.Wang@amd.com>
Cc:     Dan Carpenter <dan.carpenter@oracle.com>,
        Rex Zhu <rex.zhu@amd.com>, "Quan, Evan" <Evan.Quan@amd.com>,
        David Airlie <airlied@linux.ie>,
        "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>,
        "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
        "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
        "Deucher, Alexander" <Alexander.Deucher@amd.com>,
        "Koenig, Christian" <Christian.Koenig@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Applied.  thanks!

Alex

On Mon, Oct 7, 2019 at 6:29 AM Wang, Kevin(Yang) <Kevin1.Wang@amd.com> wrot=
e:
>
> Reviewed-by: Kevin Wang <kevin1.wang@amd.com>
>
> Best Regards,
> Kevin
> ________________________________
> From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> on behalf of Dan Ca=
rpenter <dan.carpenter@oracle.com>
> Sent: Monday, October 7, 2019 5:04 PM
> To: Rex Zhu <rex.zhu@amd.com>; Quan, Evan <Evan.Quan@amd.com>
> Cc: Zhou, David(ChunMing) <David1.Zhou@amd.com>; David Airlie <airlied@li=
nux.ie>; kernel-janitors@vger.kernel.org <kernel-janitors@vger.kernel.org>;=
 amd-gfx@lists.freedesktop.org <amd-gfx@lists.freedesktop.org>; dri-devel@l=
ists.freedesktop.org <dri-devel@lists.freedesktop.org>; Daniel Vetter <dani=
el@ffwll.ch>; Deucher, Alexander <Alexander.Deucher@amd.com>; Koenig, Chris=
tian <Christian.Koenig@amd.com>
> Subject: [PATCH] drm/amd/powerplay: unlock on error in smu_resume()
>
> This function needs to drop the mutex before returning.
>
> Fixes: f7e3a5776fa6 ("drm/amd/powerplay: check SMU engine readiness befor=
e proceeding on S3 resume")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  drivers/gpu/drm/amd/powerplay/amdgpu_smu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/powerplay/amdgpu_smu.c b/drivers/gpu/drm=
/amd/powerplay/amdgpu_smu.c
> index 6a64f765fcd4..f1fbbc8b77ee 100644
> --- a/drivers/gpu/drm/amd/powerplay/amdgpu_smu.c
> +++ b/drivers/gpu/drm/amd/powerplay/amdgpu_smu.c
> @@ -1384,7 +1384,7 @@ static int smu_resume(void *handle)
>          ret =3D smu_start_smc_engine(smu);
>          if (ret) {
>                  pr_err("SMU is not ready yet!\n");
> -               return ret;
> +               goto failed;
>          }
>
>          ret =3D smu_smc_table_hw_init(smu, false);
> --
> 2.20.1
>
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
