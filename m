Return-Path: <kernel-janitors+bounces-1215-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 468FE82A2D1
	for <lists+kernel-janitors@lfdr.de>; Wed, 10 Jan 2024 21:50:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EE39C1F21A61
	for <lists+kernel-janitors@lfdr.de>; Wed, 10 Jan 2024 20:50:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 250D95025B;
	Wed, 10 Jan 2024 20:47:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Kd1d86jR"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C00494F5EA
	for <kernel-janitors@vger.kernel.org>; Wed, 10 Jan 2024 20:47:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-557bbcaa4c0so2706a12.1
        for <kernel-janitors@vger.kernel.org>; Wed, 10 Jan 2024 12:47:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1704919666; x=1705524466; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xvBmw5llKRqXLv2AVOUBOB+EBAoZUU0XXok8fk9QCec=;
        b=Kd1d86jR/r8ZBfg1k3LtqHAvoignRipYYPSn6/Q9vnC45YhQd7+soq+Gu5JWbFaFCO
         /n/lw+VgNwocPO3CeSMJg5Cu2q0O+MYqOSRSWtoNXgPGRRSa3C4lefkvL7qdNXflVa/o
         UZWwAdu69Nm6plHafOPnJRF8pFv2ZCUEd2xClYOIj+d5a39TDRljKQwLT+HdiDTLxwip
         +yv8n3kPQ56rkShpcuwB7vLm8x3eTgYPuq7o2P3tkdCOYCBtN6v/1YdfVj8l5qHcQDWe
         E/jpMuxwjD/4iBx6KQyAzXNE5yn2Y9vkQQ2weYmuUEbb7U+jUKki2tL8kIw93e2wvB8c
         gpZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704919666; x=1705524466;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xvBmw5llKRqXLv2AVOUBOB+EBAoZUU0XXok8fk9QCec=;
        b=rN9Hxvh7aO48ilR5pmKgKy3SfifXPYEEP6RZNmNxnCmhg5Q7IC268cjvZOB6bhsB5Z
         Q1z8LgAW9M4Qmkue/+0VesPYextjgQjJqEGShfD+flCMkcgIHJxmHUj7xlRDfqPa35xf
         JWBmVux5p2S1tnVSRZ/OdtBbCC3RqwbKXpFTkVTCqXcQ621JBwt/P3OHWpGgeTpxwiqF
         rKZdEsGlk+DWM1a+peos1g0uIbqwE3g7FbeVhXC7dhABUzYuf/0bDbDlpJEIgICWNuAj
         2ryeIfdukMNZgSEPSz+e81fXHWKtZB3CHNfP0awqG5y03VvZzc+svViybDXlpYY0po3S
         r9Uw==
X-Gm-Message-State: AOJu0Yz9y0v05krTwUsc7S/T0nqHTc1mz8r9mAhhT9QzEfPMUm1JTxhm
	vQkhz9Xuo6uhVoEjoLx5SkFbFtQzV3/cVzM6I5Cn7pulbavCyyQiZPmPfRWuvkWumg+Bch51qcz
	P44w7fpIMJjhxYrLcYO7idL4nd40LUasL8w+T
X-Google-Smtp-Source: AGHT+IGtYzXbQuQsCnI/M6Q+esb1oyG+cSLNvXEfHcMNZQwzYizAo0y4rLdBTsGPj6jtJN2l+a5JBfS1TuhLD2s4xM8=
X-Received: by 2002:a05:6402:683:b0:557:8cb9:90a1 with SMTP id
 f3-20020a056402068300b005578cb990a1mr46842edy.6.1704919665842; Wed, 10 Jan
 2024 12:47:45 -0800 (PST)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <39b4278f-35d2-4071-a3aa-ec49705272af@moroto.mountain>
In-Reply-To: <39b4278f-35d2-4071-a3aa-ec49705272af@moroto.mountain>
From: Rae Moar <rmoar@google.com>
Date: Wed, 10 Jan 2024 15:47:34 -0500
Message-ID: <CA+GJov5jz+qSA=eGW_E7VoMpHm=eBfAkxwv4r8EsFpRYBBq0Zg@mail.gmail.com>
Subject: Re: [PATCH] kunit: Fix a NULL vs IS_ERR() bug
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Brendan Higgins <brendan.higgins@linux.dev>, David Gow <davidgow@google.com>, 
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 10, 2024 at 1:55=E2=80=AFPM Dan Carpenter <dan.carpenter@linaro=
.org> wrote:
>
> The kunit_device_register() function doesn't return NULL, it returns
> error pointers.  Change the KUNIT_ASSERT_NOT_NULL() to check for
> ERR_OR_NULL().
>
> Fixes: d03c720e03bd ("kunit: Add APIs for managing devices")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

This change looks good to me! Thanks!
-Rae

Reviewed-by: Rae Moar <rmoar@google.com>

> ---
> It's a pity that there isn't a KUNIT_ASSERT_NOT_ERR_PTR() macro...
>
>  lib/kunit/kunit-test.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/lib/kunit/kunit-test.c b/lib/kunit/kunit-test.c
> index c4259d910356..f7980ef236a3 100644
> --- a/lib/kunit/kunit-test.c
> +++ b/lib/kunit/kunit-test.c
> @@ -720,7 +720,7 @@ static void kunit_device_cleanup_test(struct kunit *t=
est)
>         long action_was_run =3D 0;
>
>         test_device =3D kunit_device_register(test, "my_device");
> -       KUNIT_ASSERT_NOT_NULL(test, test_device);
> +       KUNIT_ASSERT_NOT_ERR_OR_NULL(test, test_device);
>
>         /* Add an action to verify cleanup. */
>         devm_add_action(test_device, test_dev_action, &action_was_run);
> --
> 2.43.0
>
> --
> You received this message because you are subscribed to the Google Groups=
 "KUnit Development" group.
> To unsubscribe from this group and stop receiving emails from it, send an=
 email to kunit-dev+unsubscribe@googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgi=
d/kunit-dev/39b4278f-35d2-4071-a3aa-ec49705272af%40moroto.mountain.

