Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 73906A8908
	for <lists+kernel-janitors@lfdr.de>; Wed,  4 Sep 2019 21:23:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730556AbfIDOyT (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Wed, 4 Sep 2019 10:54:19 -0400
Received: from mail-ot1-f65.google.com ([209.85.210.65]:35102 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730065AbfIDOyT (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 4 Sep 2019 10:54:19 -0400
Received: by mail-ot1-f65.google.com with SMTP id 100so20932311otn.2
        for <kernel-janitors@vger.kernel.org>; Wed, 04 Sep 2019 07:54:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=5zV9A0Ata4tMQdZh+AwuadaWR8ym+Y4RneU8wNATTrs=;
        b=vG9icw4d+VqW3bcV6WLKRyJzz73yDvPpmA0p3yHTNkY1seMK7ZEZfcAt4LEYJgjydI
         7C4X54TqP/xiyu3XzzP4Aiz8xxj9L7xBBiJJkSsKoKwNj1maGo19o9102Wd+bSg+yEe9
         6DFQV8Jnkm0ueFeM3n916QBWkzGjjWZszvbGa6Al0sYhamaXVHVKlg8q+0I8hC6PfsQk
         Ie4ZxL6hWu2UDdDCvSxp5jnsgtbdNEJArch8ZrzwvBme61nZ83dUYvT6mOoFSHh4U2gm
         cfA0ocV0MX6sL+nIBNX0LEKm3/SdCiXZ/xo7Pr7dJ/his6DHpraccwckUrf3EjXn9PTA
         T3aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=5zV9A0Ata4tMQdZh+AwuadaWR8ym+Y4RneU8wNATTrs=;
        b=PzI0nmf7aI1eAfUwS8OiiehKn4ylYpSf0Wh0ncscggXHAUjSJT/UHUQxS1FhpY4LES
         UX8femhynbKPYgeqEr978o9It5zMH3URp1v2SOdJK75MexDxh79n8+nzOdd0rhkHczlV
         AeHqcCP/SyEHYbUvojm5+hx0fHCjQKT97tO/La7scKbYjYYNA4QAO8luJDa/kuk9tt6/
         152mfGa7wwqCLrVf4VqNMgqwcYYCz/WBViii/a3O6lCm8N/3oRkaXaLTDgpfi9C+xK+l
         jjzjX2cSQnOh7IT8ro16VRcqRNnFrkSrYVkecX9SnNvUH0BuupvjTP0KWhyrK8LnFXM3
         MnzQ==
X-Gm-Message-State: APjAAAVi/zk1refSVfGodw8bU8dkrUgtjEiZl/lqJ8ssGTkE86AczTj8
        Pk+X+qQeKupZGWEyNDTNOR+1lgzAB2SIifhhKPiRqQ==
X-Google-Smtp-Source: APXvYqwUSf12y7wuehDTFY7naXt93ZG8G6JhQJzrNpZN+yIOuQ7ul/zuM3uCOukHIlaERnjQBfM9OqRdGrnmgvFa7UM=
X-Received: by 2002:a9d:62c3:: with SMTP id z3mr3082007otk.194.1567608858331;
 Wed, 04 Sep 2019 07:54:18 -0700 (PDT)
MIME-Version: 1.0
References: <20190904141834.195294-1-weiyongjun1@huawei.com>
In-Reply-To: <20190904141834.195294-1-weiyongjun1@huawei.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Wed, 4 Sep 2019 16:54:07 +0200
Message-ID: <CAMpxmJWJr0uBCs_oGX+h1uFmQ2f7Axo1iqtD6rzwgT-bbZdD6g@mail.gmail.com>
Subject: Re: [PATCH] gpio: mockup: add missing single_release()
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Wei Yongjun <weiyongjun1@huawei.com>,
        Bamvor Jian Zhang <bamv2005@gmail.com>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

=C5=9Br., 4 wrz 2019 o 16:00 Wei Yongjun <weiyongjun1@huawei.com> napisa=C5=
=82(a):
>
> When using single_open() for opening, single_release() should be
> used instead of seq_release(), otherwise there is a memory leak.
>
> Fixes: 2a9e27408e12 ("gpio: mockup: rework debugfs interface")
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> ---
>  drivers/gpio/gpio-mockup.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpio/gpio-mockup.c b/drivers/gpio/gpio-mockup.c
> index f1a9c0544e3f..213aedc97dc2 100644
> --- a/drivers/gpio/gpio-mockup.c
> +++ b/drivers/gpio/gpio-mockup.c
> @@ -309,6 +309,7 @@ static const struct file_operations gpio_mockup_debug=
fs_ops =3D {
>         .read =3D gpio_mockup_debugfs_read,
>         .write =3D gpio_mockup_debugfs_write,
>         .llseek =3D no_llseek,
> +       .release =3D single_release,
>  };
>
>  static void gpio_mockup_debugfs_setup(struct device *dev,
>
>
>

Good catch!

Reviewed-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Linus: can you pick it up for your last pull-requests with fixes for v5.3?

Bart
