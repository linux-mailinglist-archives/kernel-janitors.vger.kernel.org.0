Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BC6722CD2CD
	for <lists+kernel-janitors@lfdr.de>; Thu,  3 Dec 2020 10:46:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728962AbgLCJqp (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Thu, 3 Dec 2020 04:46:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52294 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725902AbgLCJqo (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 3 Dec 2020 04:46:44 -0500
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 94A09C061A4D
        for <kernel-janitors@vger.kernel.org>; Thu,  3 Dec 2020 01:45:58 -0800 (PST)
Received: by mail-lj1-x244.google.com with SMTP id z1so1833748ljn.4
        for <kernel-janitors@vger.kernel.org>; Thu, 03 Dec 2020 01:45:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=BTlGzfvUDypCFqBvmwFfmXu7/Iijd722QkVqWCD+4QI=;
        b=bOPBTRe50dYnkJ7KzuNO3KMBoOL5eDeV4gnBOgpirA/GmSas8uJIVl/0AipZZfHHgU
         izUtY2aDaCqgfgibTyhMfxUI3Ef650Dyhe/Af/T6Ml1aotfBZhD0ssZMQ8alTNgB9rlf
         KxqACJO6bCDMENd3UGRJuqM1bmlgMalk1kJn6ekpbu7vcda2NQSEHQuwwelZIWovIYv+
         sePPGyTUFPvDUVZKJy8yx3nmU22zyii42ryEO/hQtDIoIJB5UGhYDEe8qZPCKoAkc5EK
         MEmZqomFiLTuOiFQ0bd+9JA4UNIVGuOUUFlRceY200NI+d3QFu5RWT8Ly0JAMchrMVyC
         VCzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BTlGzfvUDypCFqBvmwFfmXu7/Iijd722QkVqWCD+4QI=;
        b=aYmbQFTrOUaIYHk/I2EtsP8AB+O4Pmx8+aEtdwRZdMyVGtZ/VTtC+hb9r7ZAtAX3bw
         GSzkoFW54DWzdIj1SLqHyobXz9wz/r+PWcZCNwZjG/EnDuIVipVYTHfgwLRrCdLp7a+f
         wqAV7DKvjDZKzUL8uK1LZvUP877mMDLiv8MAcUJqeDNNw78dQloLm7W8mW46uJb2Z0ZR
         X4VvuF/ExzIkA/JfNxz0skblw4o/aZAX20nAWVajFgTA/Y9jJJxtWnQKGm5QMKhmdxle
         WICtdm2tFhF70VLmFfJZsa9kQxSfWhZyvTyzQNNinm9U+gePFNadxLBGJ8xJmJdt1ROk
         R6Cg==
X-Gm-Message-State: AOAM532bf1iP9Tok9O7Im2Oz0rn4tD1i8y4FxWfBvBnxPew/a7fb91Yj
        444OTNUElUsyWyjR4apv5jptzAT4TosIm02VcrA=
X-Google-Smtp-Source: ABdhPJznT/PWInkyvV39FGkv6HV6ouOsc33obT6CjacNijL/qI0gOOjcVcvRx4jTpI/e2HMMVnBgfsYiRZjlIEW/5fQ=
X-Received: by 2002:a2e:89d7:: with SMTP id c23mr895401ljk.397.1606988757039;
 Thu, 03 Dec 2020 01:45:57 -0800 (PST)
MIME-Version: 1.0
References: <X8ikkAqZfnDO2lu6@mwanda>
In-Reply-To: <X8ikkAqZfnDO2lu6@mwanda>
From:   Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Date:   Thu, 3 Dec 2020 10:45:46 +0100
Message-ID: <CAMeQTsZYx7KB2mUfv7uwOJ+FJ5-UUj-YH7m7y0bTB-LsPm4xvw@mail.gmail.com>
Subject: Re: [PATCH] gma500: clean up error handling in init
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        Dave Airlie <airlied@redhat.com>,
        Alan Cox <alan@linux.intel.com>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Thu, Dec 3, 2020 at 9:41 AM Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> The main problem with this error handling was that it didn't clean up if
> i2c_add_numbered_adapter() failed.  This code is pretty old, and doesn't
> match with today's checkpatch.pl standards so I took the opportunity to
> tidy it up a bit.  I changed the NULL comparison, and removed the
> WARNING message if kzalloc() fails and updated the label names.

Thanks! Looks good.

I'll apply this to drm-misc-next

-Patrik

>
> Fixes: 1b082ccf5901 ("gma500: Add Oaktrail support")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  drivers/gpu/drm/gma500/oaktrail_hdmi_i2c.c | 22 +++++++++++++---------
>  1 file changed, 13 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/gpu/drm/gma500/oaktrail_hdmi_i2c.c b/drivers/gpu/drm/gma500/oaktrail_hdmi_i2c.c
> index e28107061148..fc9a34ed58bd 100644
> --- a/drivers/gpu/drm/gma500/oaktrail_hdmi_i2c.c
> +++ b/drivers/gpu/drm/gma500/oaktrail_hdmi_i2c.c
> @@ -279,11 +279,8 @@ int oaktrail_hdmi_i2c_init(struct pci_dev *dev)
>         hdmi_dev = pci_get_drvdata(dev);
>
>         i2c_dev = kzalloc(sizeof(struct hdmi_i2c_dev), GFP_KERNEL);
> -       if (i2c_dev == NULL) {
> -               DRM_ERROR("Can't allocate interface\n");
> -               ret = -ENOMEM;
> -               goto exit;
> -       }
> +       if (!i2c_dev)
> +               return -ENOMEM;
>
>         i2c_dev->adap = &oaktrail_hdmi_i2c_adapter;
>         i2c_dev->status = I2C_STAT_INIT;
> @@ -300,16 +297,23 @@ int oaktrail_hdmi_i2c_init(struct pci_dev *dev)
>                           oaktrail_hdmi_i2c_adapter.name, hdmi_dev);
>         if (ret) {
>                 DRM_ERROR("Failed to request IRQ for I2C controller\n");
> -               goto err;
> +               goto free_dev;
>         }
>
>         /* Adapter registration */
>         ret = i2c_add_numbered_adapter(&oaktrail_hdmi_i2c_adapter);
> -       return ret;
> +       if (ret) {
> +               DRM_ERROR("Failed to add I2C adapter\n");
> +               goto free_irq;
> +       }
>
> -err:
> +       return 0;
> +
> +free_irq:
> +       free_irq(dev->irq, hdmi_dev);
> +free_dev:
>         kfree(i2c_dev);
> -exit:
> +
>         return ret;
>  }
>
> --
> 2.29.2
>
