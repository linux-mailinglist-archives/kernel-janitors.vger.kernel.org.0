Return-Path: <kernel-janitors+bounces-1934-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7588B86ABA5
	for <lists+kernel-janitors@lfdr.de>; Wed, 28 Feb 2024 10:51:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F209BB225BB
	for <lists+kernel-janitors@lfdr.de>; Wed, 28 Feb 2024 09:51:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE6083613E;
	Wed, 28 Feb 2024 09:51:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b="0RSKe4Sk"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AEC7339A8
	for <kernel-janitors@vger.kernel.org>; Wed, 28 Feb 2024 09:51:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709113879; cv=none; b=hEgSBk58JlTxDERHoiZFrU5p38HXsxqWEGgsHzbDfAs8L8mtyRmQ4uuFUuitZwpxm3mpkBFF8lvVR8O2x21LJQbFnJ9iLaneUWDE3La3UfwbHAiNpHcycDYLPzp3iAk5HORJ0Tx2KaiZjk8gqyxN0AFLsPxBIKNT1dG0ady38ak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709113879; c=relaxed/simple;
	bh=s8RRMzYpwsgS7/6fo5fbyQvyzCSLLaKP69VHlB8a1iw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KRhXKlk8PYRSt9VjmydZOGHJenklqy1VsBgOveubOXqN1+LmLF3JXmtuzhcf/my9pVcPVMfCwnaLEhWaX2pd9jWoAMP1ML1pyW1sOPp5rHe491CA0JoTyjGDl175+3tgwzQpKZYDvQiiSrHDz8wsy4CJYiF9YEqL23Z8K/yOSUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us; spf=none smtp.mailfrom=resnulli.us; dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b=0RSKe4Sk; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=resnulli.us
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-513181719easo713777e87.3
        for <kernel-janitors@vger.kernel.org>; Wed, 28 Feb 2024 01:51:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20230601.gappssmtp.com; s=20230601; t=1709113876; x=1709718676; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4im3iLarn+fVDeLiii7X0Q81Iw4mK1e/JWWrlhbYVWI=;
        b=0RSKe4SkpsKXa8tVldOIlomFXyLrEg3cD1vQcrbauNAX421WmTJn4f7U0c3P5jckdT
         tpyWpXy6/FpX7hclSdo8QkcvW/8iKtxhFH75NWZaCm7wQOzdiCsx6DhqsaKkZ2kzAjNR
         ov7uPDKmlnb8SjgZvATlbIMDuoVBeRRzVOO9drThnmmKZ6uOkmU1AwP9TCef1JeR4eOd
         xGHDVpGYP027yX6+oN1KCCuAPYYMohUnS1GXkk2WzPi3Ym/45PutjjfmqhOtfyQ/vP/y
         BsKSFNDlYj4eEjZ28XiuKRukKOj1x+tmZCWi2OrLLVuNhInYawaB7ELNxP/KAT2o2qD/
         eKNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709113876; x=1709718676;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4im3iLarn+fVDeLiii7X0Q81Iw4mK1e/JWWrlhbYVWI=;
        b=nNKBODyz1bo3OFwBBwitWY3XhyWnOnr7elgKtzrDuXRCbU02yYaFNe33oEZe545Irh
         E1ce/9RUkdOlee+VpE7tVKsAJ47IdlzqGok9U0/2WWBwnwhVeQ9WgJJPefjBe7iB0zrv
         sgrm5JJQYELqnbG0+76M9Bmly4rD0uS471FdY/XhRZhAauMPtjK6GJ29vGdf7BrzQWba
         kPAPp0K0K6A7KS4QsJ5P13dIpBZ16344xk4hNVeqyl5NrE6NWBSKGwQ8CtN4mwc2ikHm
         A2yg5owVc5/GlC6/E7qRNR9N4u3Jt7s8xltSMvNCDY3MeZVSWARDkFIMOHbcDZQu/r0f
         P25g==
X-Forwarded-Encrypted: i=1; AJvYcCUQupluJKGknLGKjfi7vcwCrEasLTnPvB44AcrG8hhZeQoD/isX8OKdd92IuS1USJedP/13WIUiASNIhStCGU/X3p9cQ+cbEfXvQdvkhVQS
X-Gm-Message-State: AOJu0YzrUsjsLfohGIkOQIVX00hKqfAb6hlDV2RZn+89c0+Zssc+SHRz
	swa+9SetFpVUbz7VFn9aOo4f0iJqIsBNPZmgIhjBPOV63hD825Pn8g+3jpBbaLg=
X-Google-Smtp-Source: AGHT+IE9Cgc15gAcIviadOB2K14AmCJF6uxTTVrM3FL0KsxJOhVvLqJW+cMJNBaeOSwbkx20kticDQ==
X-Received: by 2002:a05:6512:b1b:b0:513:c2:95a9 with SMTP id w27-20020a0565120b1b00b0051300c295a9mr5686175lfu.54.1709113875720;
        Wed, 28 Feb 2024 01:51:15 -0800 (PST)
Received: from localhost ([193.47.165.251])
        by smtp.gmail.com with ESMTPSA id k3-20020adff5c3000000b0033d8ce120f2sm13910002wrp.95.2024.02.28.01.51.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Feb 2024 01:51:15 -0800 (PST)
Date: Wed, 28 Feb 2024 10:51:12 +0100
From: Jiri Pirko <jiri@resnulli.us>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: andy@greyhouse.net, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH net 1/2] net: tehuti: Fix a missing pci_disable_msi() in
 the error handling path of bdx_probe()
Message-ID: <Zd8CEAng7emsvaxg@nanopsycho>
References: <cover.1709066709.git.christophe.jaillet@wanadoo.fr>
 <011588ecfd6689e27237f96213acdb7a3543f981.1709066709.git.christophe.jaillet@wanadoo.fr>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <011588ecfd6689e27237f96213acdb7a3543f981.1709066709.git.christophe.jaillet@wanadoo.fr>

Tue, Feb 27, 2024 at 09:50:55PM CET, christophe.jaillet@wanadoo.fr wrote:
>If an error occurs after a successful call to pci_enable_msi(),
>pci_disable_msi() should be called as already done in the remove function.
>
>Add a new label and the missing pci_disable_msi() call.
>
>Fixes: 1a348ccc1047 ("[NET]: Add Tehuti network driver.")
>Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
>---
>Compile tested only.
>---
> drivers/net/ethernet/tehuti/tehuti.c | 9 +++++++--
> 1 file changed, 7 insertions(+), 2 deletions(-)
>
>diff --git a/drivers/net/ethernet/tehuti/tehuti.c b/drivers/net/ethernet/tehuti/tehuti.c
>index ca409515ead5..938a5caf5a3b 100644
>--- a/drivers/net/ethernet/tehuti/tehuti.c
>+++ b/drivers/net/ethernet/tehuti/tehuti.c
>@@ -1965,7 +1965,7 @@ bdx_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
> 		ndev = alloc_etherdev(sizeof(struct bdx_priv));
> 		if (!ndev) {
> 			err = -ENOMEM;
>-			goto err_out_iomap;
>+			goto err_out_disable_msi;
> 		}
> 
> 		ndev->netdev_ops = &bdx_netdev_ops;
>@@ -2031,7 +2031,7 @@ bdx_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
> 		if (bdx_read_mac(priv)) {
> 			pr_err("load MAC address failed\n");
> 			err = -EFAULT;
>-			goto err_out_iomap;
>+			goto err_out_disable_msi;
> 		}
> 		SET_NETDEV_DEV(ndev, &pdev->dev);
> 		err = register_netdev(ndev);
>@@ -2048,6 +2048,11 @@ bdx_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
> 
> err_out_free:
> 	free_netdev(ndev);
>+err_out_disable_msi:
>+#ifdef BDX_MSI

ifdef does not seem to be necessary here. The irq_type check should be
enough.

pw-bot: cr


>+	if (nic->irq_type == IRQ_MSI)
>+		pci_disable_msi(pdev);
>+#endif
> err_out_iomap:
> 	iounmap(nic->regs);
> err_out_res:
>-- 
>2.43.2
>
>

