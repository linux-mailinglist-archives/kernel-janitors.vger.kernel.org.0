Return-Path: <kernel-janitors+bounces-55-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 28B0B7DC32B
	for <lists+kernel-janitors@lfdr.de>; Tue, 31 Oct 2023 00:33:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 373E1B20E0E
	for <lists+kernel-janitors@lfdr.de>; Mon, 30 Oct 2023 23:33:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABA8419450;
	Mon, 30 Oct 2023 23:33:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fGSKkIFu"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98E4A1A700
	for <kernel-janitors@vger.kernel.org>; Mon, 30 Oct 2023 23:33:03 +0000 (UTC)
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC8F0C2;
	Mon, 30 Oct 2023 16:33:01 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-507adc3381cso7244501e87.3;
        Mon, 30 Oct 2023 16:33:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698708780; x=1699313580; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TYzQy61n4OpQizbkMFZEMwiE1E2OOTWr3NUjWoPbxLQ=;
        b=fGSKkIFueXKjkdnPyQZJAs2Owq5zZVoAdhRMv34VYAoVP7OelJRl9VhO0pSoqIkJ2h
         jnXQJ0PLQCSXm3NlyoTCNpVvfyPuy4Ecs0CZt5QtI1lPkFshdiIMcumi3ajILhsQRS8P
         hm9APZ3F9AF+xyjtJyJdhv9nSrDov5yfTiZEcYClfIOAVD1bwqS0b9lzuOKdQdvqK+ei
         M4kACEr5Loro46rrD3wPoVuw9DodIZx4Tly7JBcsAVnBaXtR8BVPOz0FaInYDbIr+p7N
         1RLwsY2VD9x41kY4x9MQxuyk8qRGobFZQnrPq0D0dyAVZ6sSyRZvLvjYO1Fa4ohPHzyd
         ojmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698708780; x=1699313580;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TYzQy61n4OpQizbkMFZEMwiE1E2OOTWr3NUjWoPbxLQ=;
        b=CuP3HEgrDoof/mmjU1YV/PopV2mFvHbJ7cqocb4Tw+qUXyCF4xbgmTYOpWcO1tEmkw
         kfawf8lzjwyHFiWIzOQA+hJ/SDNMyHTQB3EKNtdQd0cvvO29lA+w0whJiHORTz6yvF+l
         nbJ5n0VdDsX3NvbmH3tgfl58VcBPPn2qHBNAWeJIcosrGSvZl4NSWk28TCtEFzxXwW1X
         +vKN8g9LN4gJpYTZPPu7tTIlzn43RKYG3Br5/id7TJnwtExujSqRj3hiZGmrvpqTJeQz
         Sxoxx8+K5O8RrUE91b6OIurHII5aFCMokf+wCs5UuD7QGDXxNtQ3Nvt6qdZrBLLCIsYi
         /BZw==
X-Gm-Message-State: AOJu0YwGRjh2SL23eRahQw0LBqXWtoDrm6TUHO9ApWcSdUBHGGJWvGjp
	XrHAye8uaBWDEOQKx4ZVi7Y=
X-Google-Smtp-Source: AGHT+IHX/xKq0tp9DABrucx3glLbnJxxbHBzclrIoU4uhOMhN+Lkw3rXuc7gQXaxtsHWmolNqt5atg==
X-Received: by 2002:a05:6512:3b97:b0:507:9777:a34a with SMTP id g23-20020a0565123b9700b005079777a34amr11418761lfv.39.1698708779583;
        Mon, 30 Oct 2023 16:32:59 -0700 (PDT)
Received: from mobilestation ([89.113.151.243])
        by smtp.gmail.com with ESMTPSA id t7-20020ac243a7000000b0050420b0a642sm2548lfl.91.2023.10.30.16.32.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Oct 2023 16:32:59 -0700 (PDT)
Date: Tue, 31 Oct 2023 02:32:56 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Xiaowei Song <songxiaowei@hisilicon.com>, 
	Binghui Wang <wangbinghui@hisilicon.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, Rob Herring <robh@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Jingoo Han <jingoohan1@gmail.com>, linux-kernel@vger.kernel.org, 
	kernel-janitors@vger.kernel.org, linux-pci@vger.kernel.org
Subject: Re: [PATCH] PCI: kirin: Fix an error path in kirin_pcie_probe()
Message-ID: <gpmjckwgbbccsnjcexg7wtvw2oshj6wuwqomlbbo2ebok5oe3g@ky6mfxdutnt4>
References: <e2b83334ab204ee905fe36ac01cfc297a5a2a7be.1698654061.git.christophe.jaillet@wanadoo.fr>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e2b83334ab204ee905fe36ac01cfc297a5a2a7be.1698654061.git.christophe.jaillet@wanadoo.fr>

On Mon, Oct 30, 2023 at 09:21:16AM +0100, Christophe JAILLET wrote:
> If an error occurs after a successful kirin_pcie_power_on(),
> kirin_pcie_power_off() should be called, as already done in the remove
> function.
> 
> Fixes: fc5165db245a ("PCI: kirin: Add HiSilicon Kirin SoC PCIe controller driver")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
> Not sure of the Fixes tag.
> ---
>  drivers/pci/controller/dwc/pcie-kirin.c | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/pci/controller/dwc/pcie-kirin.c b/drivers/pci/controller/dwc/pcie-kirin.c
> index 2ee146767971..0b93de9d2d06 100644
> --- a/drivers/pci/controller/dwc/pcie-kirin.c
> +++ b/drivers/pci/controller/dwc/pcie-kirin.c
> @@ -813,7 +813,15 @@ static int kirin_pcie_probe(struct platform_device *pdev)
>  	if (ret)
>  		return ret;
>  
> -	return dw_pcie_host_init(&pci->pp);
> +	ret = dw_pcie_host_init(&pci->pp);
> +	if (ret)
> +		goto err_power_off;
> +
> +	return 0;
> +
> +err_power_off:
> +	kirin_pcie_power_off(kirin_pcie);
> +	return ret;

From the current driver implementation point of view this looks
correct. So
Reviewed-by: Serge Semin <fancer.lancer@gmail.com>

But the design of the power on/off procedures seems very unfortunate:
1. Calling antagonist from the respective protagonist is a bad
solution for maintainability, because shall you need to add something
to the protagonist you'll need to somehow take into account that it is
reverted in the antagonist only if it was executed, which in its
turn will get to be impossible if there are several conditional
steps need to be implemented.
2. There is a logical split up between the hi3660 and other
controllers. Wherein the hi3660-specific code is implemented as a set
of various coherent functions, meanwhile the code for the other
controllers is placed directly to the kirin_pcie_power_on() and
kirin_pcie_power_off() functions. It looks clumsy and hard-readable.
3. kirin_pcie->gpio_id_dwc_perst is requested and switched to output,
but is never freed and got back to input or level zero.

-Serge(y)

>  }
>  
>  static struct platform_driver kirin_pcie_driver = {
> -- 
> 2.34.1
> 

