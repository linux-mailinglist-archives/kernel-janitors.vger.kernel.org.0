Return-Path: <kernel-janitors+bounces-7568-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F2DC7A64AF2
	for <lists+kernel-janitors@lfdr.de>; Mon, 17 Mar 2025 11:53:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 780611884B0A
	for <lists+kernel-janitors@lfdr.de>; Mon, 17 Mar 2025 10:52:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2018F236A7B;
	Mon, 17 Mar 2025 10:52:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="D66pzehu"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB564225A22
	for <kernel-janitors@vger.kernel.org>; Mon, 17 Mar 2025 10:52:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742208724; cv=none; b=aqVM0mwUaGb5U2CQDEAuOZVQ9FqEZyDSN84L2gXglwFyiDJLu0UIebLxIIK9NV4cc/dpSuCmyl35Zl0DJ5DqogNDhgLQmLdIH9DCgASx3M0kVmMwu8b+Bc4nF6bp4uqtL52Nz9naw4zxIH8AXt13LT6Yka7zylW4gap7njOG2vA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742208724; c=relaxed/simple;
	bh=sVFBQhrcAWlKClBKcDG2mFfwLfjULiYni95nXG0ePBs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jV19+CnZr+Zs9ycOWTfkLQ/tig6FtFSqanLT2WascaJbtqBkzaQZ+26eFikpzJ1mJs/L6Wo07VcR3mDR/PnMhXWp3sxK53jKnDKW2JlibZNQvCUIlVj7mGPn68LO5P8WiqnwdvEshZTymQVueiIINwTUdOcVN95NuuE+lFbOTKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=D66pzehu; arc=none smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-6ef60e500d7so32497307b3.0
        for <kernel-janitors@vger.kernel.org>; Mon, 17 Mar 2025 03:52:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742208721; x=1742813521; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=lr2110cYvl7za6wMxgJOpzLaRT8Ay8EQwITnfCfbHks=;
        b=D66pzehu7JjmisGcpM+PY/lt7nkC8+5BWDRvHzgojKASojlVMPp6/n/lEFo00Uo5LA
         e3CHUMiorFtneyLasmIzP3+Q3qgruehLFG25K1WcAioU4IikVcFrBwSkHlWfzEkCZRvf
         qvcISQEO5s12xvHcNTNFHdi8+uoRtwGGDOgSTM9M37m5eMg7hDU/HtIKIOC555msoI8W
         kDxO7YqWAztr1TC5GviuxT0n+iYyNdHcay86vKxj6WBX8m6jI3iAFePLr4U2C5Kc9RM3
         Z8lhSVcCfRVW4dmwHhWkOMX4lZC9p3UH2+7W6PHBNW6xt4epaDp7gNAIg4qkPwnWZtiM
         9g+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742208721; x=1742813521;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lr2110cYvl7za6wMxgJOpzLaRT8Ay8EQwITnfCfbHks=;
        b=U5B3K80F7x6ZTixgAUrg/U7gIuoi7JO1663l8y4ld08Eq3iZY7oeTuJzl729tQkwWf
         WRTZOy0UVUpNmHmNDpzOW5W3fv+12GVwrdl/iiFIsOdwvpLFepjtD7edEWo1GRi5dSa7
         4olyiUBpqXixh0zeKpUiIgucZa+OQrq1+A7vxDnSnqAX4Pk6ShnFwlXL10V1w+fWWBtg
         cLD6CBKfbE7tUoC6cFCGZTSuUauqIpTAbcAUBQZsSq86nf/eefnf11W4TvRvsAd8uvpL
         EBLWt3V+XRcYevxZ+8TiRzmNHcS8cZjYNylpWRpYKuF50/QW3bQeD1yi6OdzUkPUxPU3
         weRg==
X-Forwarded-Encrypted: i=1; AJvYcCX7PQ7aXmdQySnR4ZzaaXFreVDnkzGodTZLYl2TpzVeEoW6Ea4L5MaL8gN4fbymCNoyZhYFZm8yiHBj5hh0k+k=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3MkHZqehBU+Z8vvJkj5zke06Zog+FuQRym8xqese8ZO6eZ7FN
	HmYxMFIVUtKKH6CTpiqPbC3HjYuscEtfbIOi9RPbTzG9XAGu6b1OOKAqy/0p6Hq6cIxRf8hcRXC
	i3GGLpw5oX5ygjkyXzTjKX3sZ0IHy8YJCLFrB/w==
X-Gm-Gg: ASbGncvoA2HllITCFAUBrFjKRmZDfCL3LM8AzLHjxFIMCohDwGrJAtPFZ5qcN17wC+D
	z/NRxQ2T9D4W5yjaZLqs9YPDfcXD12xRxjQNIvE9CL/ZwYNojnbMv8qD6PTEZOiZrTdUtzg/QVe
	54VgDlJXHVSAoMlavBpepGRpkF8as=
X-Google-Smtp-Source: AGHT+IFf7X3movNjHtqdVTvAfIHVx7pgogDuutwiMoW5qPqhCnfU9dayLqxs4JjWyA9VJmoQdVD/1A6kQ2keCggN8U8=
X-Received: by 2002:a05:690c:46c6:b0:6ff:26eb:fadd with SMTP id
 00721157ae682-6ff46074375mr148199567b3.26.1742208720778; Mon, 17 Mar 2025
 03:52:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <dc39e555-8ef7-4a39-9253-65bcf3e50c01@stanley.mountain>
In-Reply-To: <dc39e555-8ef7-4a39-9253-65bcf3e50c01@stanley.mountain>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 17 Mar 2025 11:51:25 +0100
X-Gm-Features: AQ5f1JpqClchOclXJ-ISZPJXO2_ekcieYheM6YIoLWy4nEFQ2I-b44apFo7Ppjc
Message-ID: <CAPDyKFpO0a+hg0HrgXm0yv0p5JwMrD3aMN43boM73JP-EMpDWw@mail.gmail.com>
Subject: Re: [PATCH next] mmc: renesas_sdhi: fix error code in renesas_sdhi_probe()
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, linux-mmc@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 14 Mar 2025 at 11:11, Dan Carpenter <dan.carpenter@linaro.org> wrote:
>
> If devm_regulator_register() fails then propagate the error code.  Don't
> return success.
>
> Fixes: fae80a99dc03 ("mmc: renesas_sdhi: Add support for RZ/G3E SoC")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  drivers/mmc/host/renesas_sdhi_core.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/mmc/host/renesas_sdhi_core.c b/drivers/mmc/host/renesas_sdhi_core.c
> index 396fa2816a15..fa6526be3638 100644
> --- a/drivers/mmc/host/renesas_sdhi_core.c
> +++ b/drivers/mmc/host/renesas_sdhi_core.c
> @@ -1178,6 +1178,7 @@ int renesas_sdhi_probe(struct platform_device *pdev,
>                 of_node_put(rcfg.of_node);
>                 if (IS_ERR(rdev)) {
>                         dev_err(dev, "regulator register failed err=%ld", PTR_ERR(rdev));
> +                       ret = PTR_ERR(rdev);
>                         goto efree;
>                 }
>                 priv->rdev = rdev;
> --
> 2.47.2
>

