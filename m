Return-Path: <kernel-janitors+bounces-454-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E7EC57F9BB8
	for <lists+kernel-janitors@lfdr.de>; Mon, 27 Nov 2023 09:30:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 29FC2280DA9
	for <lists+kernel-janitors@lfdr.de>; Mon, 27 Nov 2023 08:30:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5AC1B12E6E;
	Mon, 27 Nov 2023 08:30:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xMae0OGa"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 16FD7183
	for <kernel-janitors@vger.kernel.org>; Mon, 27 Nov 2023 00:30:00 -0800 (PST)
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-332f4ad27d4so1123637f8f.2
        for <kernel-janitors@vger.kernel.org>; Mon, 27 Nov 2023 00:30:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701073798; x=1701678598; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2CdZagPBNXqbD/b1Zs1TWZBKxImZV6/P7uarWOkiV20=;
        b=xMae0OGarg23UsAdbLH5y+CDMD0rquxSioFprZC/RurORG+2uUwKnYXh0zNrNi5Tyg
         DKlZo2BYuVphBisaRSf+8nWH3YD+W2Tz4GHIEW3+n6mneCwZeGScD9qY/0F6BDEPbRH6
         j3eRuVmvo4j/WCvVVdr+Yaay//4jJY02DM6maN+QM2DxZysjZuGF68J3Zh6kX7WVDYc6
         2ZPOY19UVir3PGQ4edq1isdYeRBfmPdIZjJCNbzJ74ubm2GWHgcPJ/ulACux+xFry37r
         +PwCfztGKM4vWLmx9l8+5/9tRqBONaT+RjC08HOKx19MBnjMZSmBa1NmrdaMBPhnL1kz
         kuiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701073798; x=1701678598;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2CdZagPBNXqbD/b1Zs1TWZBKxImZV6/P7uarWOkiV20=;
        b=lqzxexFGLbsE6u+ZuZVcNi5+cHBIAUBPwIJJIwZVyU4rLwLeYYCbWajMXVFAOjkMw/
         ZDqcTtvFZ2yt3U4uhglopIv4L9/5+J2UNR5PMO9Kz08OE6CFBT7yCv9pIa4A56YN2ipB
         D6LSpd4L6zAm4gkLEmj0w2nDpAyDeQLtn2sYKAgf9RfBtNqBF0COX9oyXkwaIjPsCj25
         FT5EYd+RtT7oBxKatCjTbVGi6fKUWJ+BvIIUy3lIieo2xfIiNnnO99YPT06Axa/sXamQ
         k+h6XICsdmS6EOSrcMYJoGQt2bHTIUWOPsOEvvWb3dxIiTeBQwkg4O+Pu0WQGA1U/zGC
         x63w==
X-Gm-Message-State: AOJu0YwpgLWbI7JOb5Rt9ru0Aottsy8n5eHNnOtwX86jdaE6RxmgHU6W
	6DIIb1ElsQ0b4s5UychnMZE/Iw==
X-Google-Smtp-Source: AGHT+IHwm8g6hZ3Vl9KSBq7O269APfEEEnP5IbVc0hpRh7KvLTRgo5PytufR1YXdZhec67eFvPpDng==
X-Received: by 2002:adf:f48d:0:b0:332:e4cc:6a38 with SMTP id l13-20020adff48d000000b00332e4cc6a38mr6966002wro.57.1701073798517;
        Mon, 27 Nov 2023 00:29:58 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id o10-20020adfcf0a000000b00332cda91c85sm11225013wrj.12.2023.11.27.00.29.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Nov 2023 00:29:58 -0800 (PST)
Date: Mon, 27 Nov 2023 11:29:55 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Peter Rosin <peda@axentia.se>, Kees Cook <keescook@chromium.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH 1/2] mux: Turn 'mux' into a flexible array in 'struct
 mux_chip'
Message-ID: <19d7ddce-f911-481e-ac89-bc942e40fbe1@suswa.mountain>
References: <d17bd9b622dbe3f7cb2f18736ef3138a6927f86c.1700986053.git.christophe.jaillet@wanadoo.fr>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d17bd9b622dbe3f7cb2f18736ef3138a6927f86c.1700986053.git.christophe.jaillet@wanadoo.fr>

On Sun, Nov 26, 2023 at 09:08:11AM +0100, Christophe JAILLET wrote:
> The 'mux' array stored in 'struct mux_chip' can be changed into a flexible
> array.
> 
> This saves:
>    - a pointer in the structure
>    - an indirection when accessing the array
>    - some pointer arithmetic when computing and storing the address in
>      'mux'
> 
> It is also now possible to use __counted_by() and struct_size() for
> additional safety.
> 
> The address for the 'priv' memory is computed with mux_chip_priv(). It
> should work as good with a flexible array.
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
> The struct_size() goodies only work if sizeof_priv is 0. Adding an
> additional size_add() would make it safe in all cases but would make code
> less readable (IMHO).

Once people start using size_add() then we'll get used to reading it.

The controllers value comes from device tree.  For example, in
mux_mmio_probe().

	ret = of_property_count_u32_elems(np, "mux-reg-masks");

I should make Smatch parse device trees.  So that it will know the
correct range for ret in that assignment.  Eventually, I will.

KTODO: make Smatch understand device tree values

regards,
dan carpenter


