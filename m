Return-Path: <kernel-janitors+bounces-248-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BC1887E98F6
	for <lists+kernel-janitors@lfdr.de>; Mon, 13 Nov 2023 10:30:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 153BB280BE2
	for <lists+kernel-janitors@lfdr.de>; Mon, 13 Nov 2023 09:30:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F87B1A27D;
	Mon, 13 Nov 2023 09:30:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Yp02YClF"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4334D19BBD
	for <kernel-janitors@vger.kernel.org>; Mon, 13 Nov 2023 09:30:26 +0000 (UTC)
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5560310D0;
	Mon, 13 Nov 2023 01:30:24 -0800 (PST)
Received: by mail-lj1-x229.google.com with SMTP id 38308e7fff4ca-2c72e275d96so57179801fa.2;
        Mon, 13 Nov 2023 01:30:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699867822; x=1700472622; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BFLwO1MEkjZNVx3zv0RItJg/q41xvxnn7YY3auNWQXc=;
        b=Yp02YClFC1vwh1xEUISqcbYUKKAHN5WGdDK0zEbZOcLQl/Gd3DD3ivfOAR5UxF/yNj
         /Vv/2YGMUISE8a/EQwn7fR+2uRO9bs5sR5FVKMu8eolyGnhV9BAy2ykyun16PBqjpW9W
         3l8o5c42vK73aqyQ61cYloXdoHiUL1+nO298NZm0R/Mc01C/BHC/Y0DiHHz9httXvPqm
         gl+kN1ZBL8SHAMfhAigo1rm8npdJ30RbTBwdVN4VKcd4sans3+CTd1tFGRdSkvi/4m26
         PFEffKfVM9GnZlJRFA8qDdqo4710fGjUw6QZKxmOEU4ettVXSHVpyIJDiJA8qJYcWBO7
         RPDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699867822; x=1700472622;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BFLwO1MEkjZNVx3zv0RItJg/q41xvxnn7YY3auNWQXc=;
        b=ZPc1ssmFK4gLa12iEyTSly5Q2YpKhFGrM2sdcOdH9wjc5u5E4iOkE33wn2QIEnBbqZ
         kmSrsYjakDgoWer+ShrfkTZkDl0EJJI0DolEViji7yXu//gxHv+mdQCQYJunqkgQshw9
         oAzZ64VGORDC6vhmKptePOzIvLs0mOCLscNrVslcw5pbWC8LXB/jXUNno01P1CLE4jPN
         YIlTprkPfU1y7w0351B3uJZUcfnN0pKWfMmD4KbWqq7RWG47okdyyUMMBQHoVjU4BwBs
         c3g2H9Ht/hcjC4rzBlbP/Fv+BwVmwQONoapJDWdgMB96ow5hnuF/nMfjcKjpEHld97K1
         8bxg==
X-Gm-Message-State: AOJu0YwgHUEJYAzt+P5KtQxvKhurFhwUM00NMtJludJDzPXc6Srwm7lC
	Lr3xTbKFAPi6Gl6obcMlGj2glg2uZ7w=
X-Google-Smtp-Source: AGHT+IFO1L5y4VCYchUO/+Ru5DQJLpUskWOSpOWPlKQgLGuKmBaWcFPS1HVVv7QSvPdjU/uY5cEqXg==
X-Received: by 2002:a2e:a4db:0:b0:2bd:1f83:8d4 with SMTP id p27-20020a2ea4db000000b002bd1f8308d4mr4074045ljm.22.1699867822192;
        Mon, 13 Nov 2023 01:30:22 -0800 (PST)
Received: from mobilestation ([178.176.56.174])
        by smtp.gmail.com with ESMTPSA id t4-20020a2e9d04000000b002bf7fd1d336sm923551lji.14.2023.11.13.01.30.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Nov 2023 01:30:21 -0800 (PST)
Date: Mon, 13 Nov 2023 12:30:18 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Xiaowei Song <songxiaowei@hisilicon.com>, 
	Binghui Wang <wangbinghui@hisilicon.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, Rob Herring <robh@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, 
	linux-pci@vger.kernel.org
Subject: Re: [PATCH] PCI: kirin: Use devm_kasprintf()
Message-ID: <nx24ea6ur7mbhrmb46cwf3hrierz3qryzqhq6a6eo5ynem477g@fju4d4zmt4mz>
References: <085fc5ac70fc8d73d5da197967e76d18f2ab5208.1699774592.git.christophe.jaillet@wanadoo.fr>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <085fc5ac70fc8d73d5da197967e76d18f2ab5208.1699774592.git.christophe.jaillet@wanadoo.fr>

On Sun, Nov 12, 2023 at 08:37:01AM +0100, Christophe JAILLET wrote:
> Use devm_kasprintf() instead of hand writing it.
> This saves the need of an intermediate buffer.
> 
> There was also no reason to use the _const() version of devm_kstrdup().
> The string was known be not constant.
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Neat cleanup. Thanks!
Reviewed-by: Serge Semin <fancer.lancer@gmail.com>

-Serge(y)

> ---
>  drivers/pci/controller/dwc/pcie-kirin.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/pci/controller/dwc/pcie-kirin.c b/drivers/pci/controller/dwc/pcie-kirin.c
> index 2ee146767971..d9e3514de0a0 100644
> --- a/drivers/pci/controller/dwc/pcie-kirin.c
> +++ b/drivers/pci/controller/dwc/pcie-kirin.c
> @@ -366,7 +366,6 @@ static int kirin_pcie_get_gpio_enable(struct kirin_pcie *pcie,
>  				      struct platform_device *pdev)
>  {
>  	struct device *dev = &pdev->dev;
> -	char name[32];
>  	int ret, i;
>  
>  	/* This is an optional property */
> @@ -387,9 +386,8 @@ static int kirin_pcie_get_gpio_enable(struct kirin_pcie *pcie,
>  		if (pcie->gpio_id_clkreq[i] < 0)
>  			return pcie->gpio_id_clkreq[i];
>  
> -		sprintf(name, "pcie_clkreq_%d", i);
> -		pcie->clkreq_names[i] = devm_kstrdup_const(dev, name,
> -							    GFP_KERNEL);
> +		pcie->clkreq_names[i] = devm_kasprintf(dev, GFP_KERNEL,
> +						       "pcie_clkreq_%d", i);
>  		if (!pcie->clkreq_names[i])
>  			return -ENOMEM;
>  	}
> -- 
> 2.34.1
> 

