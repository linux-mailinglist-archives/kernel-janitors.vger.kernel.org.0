Return-Path: <kernel-janitors+bounces-3122-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 255068C4833
	for <lists+kernel-janitors@lfdr.de>; Mon, 13 May 2024 22:27:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D4239280EB8
	for <lists+kernel-janitors@lfdr.de>; Mon, 13 May 2024 20:27:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B2EE7F496;
	Mon, 13 May 2024 20:27:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=melexis.com header.i=@melexis.com header.b="KMVSlbKC"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com [209.85.160.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23C297E575
	for <kernel-janitors@vger.kernel.org>; Mon, 13 May 2024 20:27:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715632056; cv=none; b=L2YtTuoPYb6ywAtupwnSkkslbJnByZSdeVHZHlkAn2+r8ebosppkW8g93SsyXa9Txd6i8aAQamHXuIFW+K3EhkbTYLaWE27i2+sevY2oABPpTuBQ9WAy7yXxMzW8asAv4aMXpgcPelIC9cn8U7EBP2Atwk+sCqwRrgTy77eF+X0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715632056; c=relaxed/simple;
	bh=z9KO7ku6yvMz7x1mK14tqW2eKiUIAIQbx62bkD2qGs4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TaX+IOylk0cidgdWQqTHYM7HoYoN/q3afOKg8e8DAb+T4M+lXT6+aztYFj/ebt2cz2v0xv/ZxS1AboiiJotjfkZ6x0c/DDGUGti/+umhdoD+Gav/spRQk9VvBJhsCBFNQXAXN9a87RUXf7f0uY7DzGen6Pce7qtAwtAgiZi/4Zo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=melexis.com; spf=pass smtp.mailfrom=melexis.com; dkim=pass (2048-bit key) header.d=melexis.com header.i=@melexis.com header.b=KMVSlbKC; arc=none smtp.client-ip=209.85.160.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=melexis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=melexis.com
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-23ee34c33ceso3175310fac.3
        for <kernel-janitors@vger.kernel.org>; Mon, 13 May 2024 13:27:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=melexis.com; s=google; t=1715632053; x=1716236853; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=hf1RQRx8b6W3UeIlseZbddGJQzB0uZh+0KePHqIC66w=;
        b=KMVSlbKCdTsPG+N5tEg1Wx/qbF06piXBpL53ohRaGRPXuvseytp31a0n6YgXjsUXO8
         YMeRbqBsFQW52xoQ1Lh+uHLz1dgSKlHO+XqB1CrB+ADPUAB+S36Iq4+RFcY7KFIPmcTj
         q/UQrPeIG/YBGrmlhSfO38r5kLLBiI0DqlfEJ70+mYnf8CIytmLIyAZwWQPbStPvuVTn
         6CDajIVLhVN+VUm0Tvb5sC0ObSKWJ5Fl1T30Z+gQiLVQrkt8gTORw6K56DC/hJj8IrPd
         ah8xAUcehVNchhfiIPrOzWeV3d1yBVjwHhoJl9Znm+SkQ72H7JtLDKgoeD1DGbNsoOvW
         T0SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715632053; x=1716236853;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hf1RQRx8b6W3UeIlseZbddGJQzB0uZh+0KePHqIC66w=;
        b=QfRdiiufP1B45AsQQcd6vlQXA1NYjmQlx3SnETInITMJAJPpQAAeHEmUCSwdsHRZ+Q
         CgRvO1U7uFoMDYItXAogcCYpbhuKHu51NtYZrQYz/xN6UymRFvmG2bZVF5SYdiZb85qu
         cEDLIeVd3dEVry/+oCU2QAoTR+dN57Z4kZPORrmHF3i21OII4aT1bYbVAWJ2HXCDaYZ8
         juIvBd4nWFogoffkh5pjCcTVYk0iqPahA77SoohIuoIGy9m7eo2S6yDkc31Ytdqp4GPa
         I0WXhl32RI9a7wi0xahfjwkQrSqLY64Q6WbHOCIp6H4iWGRrh+kjpAMH1D8B/bp/hu28
         vRnQ==
X-Forwarded-Encrypted: i=1; AJvYcCVx3PmHFtDNEqAFbqXWEH9bl5pJonPqttKF6V36rjLQQ1t1d3hkvHmg+UO13NJ0UinaAJr1Nbx5j6f62pVweH2XZFNd8kAkWdBfJSbsvwcw
X-Gm-Message-State: AOJu0Yw5Hsws1gdekxZAxpFzwEY+UQnxEJRa8HL8Ji9dLnUxxISDEQor
	8auY9EqAyc6y7TER4sPF2US0P8eFUf7sh4GOr+iqsMwUsJA9JhnlmmpF9Pa506z4ZW3VwEsTRXL
	DbwNB7txUoogdRqzRRzOhwtAqCIlZaVO2qkBz
X-Google-Smtp-Source: AGHT+IFR8N5IYXFWob+zRch61N8BiaVJTq7N9z6xSculvkewWfVNMsAZwPELhMWeYYvUXXrdbEdF3t/ywjHDs/Lkcfs=
X-Received: by 2002:a05:6870:b9a:b0:240:62bb:ec01 with SMTP id
 586e51a60fabf-24172fcde6emr12466027fac.56.1715632053134; Mon, 13 May 2024
 13:27:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240513184514.3200222-1-harshit.m.mogalapalli@oracle.com>
 <CAKv63uvAe=RkZ6ytWfNkM5exy5ys5n2NwcJER=VMVAP+61-+rw@mail.gmail.com> <b83a3b5a-884e-4b9b-b962-3a625b3072b5@oracle.com>
In-Reply-To: <b83a3b5a-884e-4b9b-b962-3a625b3072b5@oracle.com>
From: Crt Mori <cmo@melexis.com>
Date: Mon, 13 May 2024 22:26:57 +0200
Message-ID: <CAKv63uumotFnisr9Z8JDF+UFL_cH7-iaDiTs9Vp1PVtbo-8jSg@mail.gmail.com>
Subject: Re: [PATCH] iio: temperature: mlx90635: Fix ERR_PTR dereference in mlx90635_probe()
To: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
Cc: Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, linux-iio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, dan.carpenter@linaro.org, 
	kernel-janitors@vger.kernel.org, error27@gmail.com
Content-Type: text/plain; charset="UTF-8"

On Mon, 13 May 2024 at 22:24, Harshit Mogalapalli
<harshit.m.mogalapalli@oracle.com> wrote:
>
> Hi Crt,
>
> On 14/05/24 01:32, Crt Mori wrote:
> > Hi,
> > I agree it is is copy-paste error. Minor remark below and a few typo
> > fixes in commit message. Thanks for your contribution.
> >
> > Reviewed-by: Crt Mori<cmo@melexis.com>
> >
>
> Thanks for the review.
>
>
> > On Mon, 13 May 2024 at 20:47, Harshit Mogalapalli
> > <harshit.m.mogalapalli@oracle.com> wrote:
> >>
> >> When devm_regmap_init_i2c() fails, ragmap_ee could be error pointer,
> > When devm_regmap_init_i2c() fails, regmap_ee could be error pointer,
> >
>
> Oops, sorry for the typo, I will fix it in V2.
>
> >> instead of checking for IS_ERR(ragmap_ee), regmap is checked which looks
> > instead of checking for IS_ERR(regmap_ee), regmap is checked which looks

There is another typo here in case you missed it.

> >> like a copy paste error.
> >>
> >> Fixes: a1d1ba5e1c28 ("iio: temperature: mlx90635 MLX90635 IR Temperature sensor")
> >> Signed-off-by: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
> >> ---
> >> This is found using smatch, only compile tested.
> >> ---
> >>   drivers/iio/temperature/mlx90635.c | 4 ++--
> >>   1 file changed, 2 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/drivers/iio/temperature/mlx90635.c b/drivers/iio/temperature/mlx90635.c
> >> index 1f5c962c1818..2b61489d5ee0 100644
> >> --- a/drivers/iio/temperature/mlx90635.c
> >> +++ b/drivers/iio/temperature/mlx90635.c
> >> @@ -947,8 +947,8 @@ static int mlx90635_probe(struct i2c_client *client)
> >>                                       "failed to allocate regmap\n");
> >>
> >>          regmap_ee = devm_regmap_init_i2c(client, &mlx90635_regmap_ee);
> >> -       if (IS_ERR(regmap))
> >> -               return dev_err_probe(&client->dev, PTR_ERR(regmap),
> >> +       if (IS_ERR(regmap_ee))
> >> +               return dev_err_probe(&client->dev, PTR_ERR(regmap_ee),
> >>                                       "failed to allocate regmap\n");
> >
> > Maybe fix her would also be to this regmap error message to include
> > regmap EEPROM?
> >
> Should we make it like:
>
> "failed to allocate EEPROM regmap\n" ?
>

Sure, we can change it to that. Descriptive enough.

> Thanks,
> Harshit
>
>
> >>
> >>          mlx90635 = iio_priv(indio_dev);
> >> --
> >> 2.39.3
> >>
>

