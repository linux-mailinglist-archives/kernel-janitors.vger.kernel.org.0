Return-Path: <kernel-janitors+bounces-1304-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 819E282D6CA
	for <lists+kernel-janitors@lfdr.de>; Mon, 15 Jan 2024 11:08:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3035228246A
	for <lists+kernel-janitors@lfdr.de>; Mon, 15 Jan 2024 10:08:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC6B9F501;
	Mon, 15 Jan 2024 10:08:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="BwZ5vyuh"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EAE5F50D
	for <kernel-janitors@vger.kernel.org>; Mon, 15 Jan 2024 10:08:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-4b71cdbc788so1313821e0c.0
        for <kernel-janitors@vger.kernel.org>; Mon, 15 Jan 2024 02:08:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1705313304; x=1705918104; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=efODqsh/Wl08N/goCwZasLOsqyP/O3Ymn4r3aDCKE3g=;
        b=BwZ5vyuhFfCRgjLFHnALuvJInkFjQSaHaU2lfG0HlcK61zwCaCAjSlH0PVAPFZ2WM+
         ObDpwfiTzIxnzBwj97H0RWvaZpX8HbQgD3o0kYddYMXVBZSHJiq1FC6Wj5prTrQxSmbB
         h/GHvmX9lTnTNprvv0MEXB5EY3/sYJ/X9mzBBc98xBpcLqdRLRbO7Xt8qUlC7A804UlM
         LztxhRsIDpZt9RV6AAOsToIGY+/R1i4bTkuo1m9N3NWkz7b2M0o9SpDCzRcNBl78Dpnr
         IIgcgnGYqsxwX3uHDKBg4hQIpn2x2EpAuAvnuaT3PSDshZSVAP7YtMQhfR4ithUl4Ml8
         q2qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705313304; x=1705918104;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=efODqsh/Wl08N/goCwZasLOsqyP/O3Ymn4r3aDCKE3g=;
        b=tvdkWs1t9WgVyPmss0goXVlPYWoi9X0mSsr1moy4N+UzLa3gwXuAWmmSosLbMKr0ai
         4Yqg4CSsP58aFEQK8kuXSL3ZuF72R4i10D9s3Lp+Fdb/qJntrS4dMAKXiNfkecaTFRd2
         6TyMPOrCtJv/ajqZBXxkdvHOPTdfdiPlPRlXGJyKDtmT/HN1bpi+pgTi5pjtVD7NWxFZ
         +sgW2a/EbwkpnnYrsDWbrcVmWzoR6y17f6ubIaHehsbIzJkouiqeikHMwtEnS7TFT7zR
         bpb+ygInk4gHgeg3HqSZ8Rk2NxXGpRBpC39tJeHm/o9CGE1J0eBtRYNDYVN0rX1e1XaB
         i6lA==
X-Gm-Message-State: AOJu0Yy4hAuANvv4rgZQm96sL1bPZZ76BPc0n70C0EbNSLkm5XAOAHb6
	bf6O3nA4S/vKgP/6w//uVA/HJd0andvV/NLGVsHL1/gqQttocQ==
X-Google-Smtp-Source: AGHT+IETlR4T5bCqb5OYA+dXN5zKz34DkovXoN/ieCB58XwGeJaG3G1kreKuWxdb7fvxB3tN+vfWOFMBughb34hu0kc=
X-Received: by 2002:a05:6122:1988:b0:4b7:8794:17cf with SMTP id
 bv8-20020a056122198800b004b7879417cfmr1557938vkb.18.1705313303911; Mon, 15
 Jan 2024 02:08:23 -0800 (PST)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <46566e85-4afa-4c55-93b2-0d0b71d76b12@moroto.mountain>
In-Reply-To: <46566e85-4afa-4c55-93b2-0d0b71d76b12@moroto.mountain>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 15 Jan 2024 11:08:12 +0100
Message-ID: <CAMRc=McCVRNpWjifPC=LTW7icF9SkbaQ9jEryM=TcHFy-tQ7dQ@mail.gmail.com>
Subject: Re: [PATCH] gpio: rtd: Fix signedness bug in probe
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Tzuyi Chang <tychang@realtek.com>, Linus Walleij <linus.walleij@linaro.org>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 12, 2024 at 7:55=E2=80=AFAM Dan Carpenter <dan.carpenter@linaro=
.org> wrote:
>
> The "data->irqs[]" array holds unsigned int so this error handling will
> not work correctly.
>
> Fixes: eee636bff0dc ("gpio: rtd: Add support for Realtek DHC(Digital Home=
 Center) RTD SoCs")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>  drivers/gpio/gpio-rtd.c | 15 +++++++++------
>  1 file changed, 9 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpio/gpio-rtd.c b/drivers/gpio/gpio-rtd.c
> index a7939bd0aa56..bf7f008f58d7 100644
> --- a/drivers/gpio/gpio-rtd.c
> +++ b/drivers/gpio/gpio-rtd.c
> @@ -525,18 +525,21 @@ static int rtd_gpio_probe(struct platform_device *p=
dev)
>         struct device *dev =3D &pdev->dev;
>         struct gpio_irq_chip *irq_chip;
>         struct rtd_gpio *data;
> +       int ret;
>
>         data =3D devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
>         if (!data)
>                 return -ENOMEM;
>
> -       data->irqs[0] =3D platform_get_irq(pdev, 0);
> -       if (data->irqs[0] < 0)
> -               return data->irqs[0];
> +       ret =3D platform_get_irq(pdev, 0);
> +       if (ret < 0)
> +               return ret;
> +       data->irqs[0] =3D ret;
>
> -       data->irqs[1] =3D platform_get_irq(pdev, 1);
> -       if (data->irqs[1] < 0)
> -               return data->irqs[1];
> +       ret =3D platform_get_irq(pdev, 1);
> +       if (ret < 0)
> +               return ret;
> +       data->irqs[1] =3D ret;
>
>         data->info =3D device_get_match_data(dev);
>         if (!data->info)
> --
> 2.43.0
>

Applied, thanks!

Bartosz

