Return-Path: <kernel-janitors+bounces-2097-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 51711871EC8
	for <lists+kernel-janitors@lfdr.de>; Tue,  5 Mar 2024 13:15:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 87C5CB22467
	for <lists+kernel-janitors@lfdr.de>; Tue,  5 Mar 2024 12:15:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE5465B208;
	Tue,  5 Mar 2024 12:15:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wLOGT55Q"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB6675A783
	for <kernel-janitors@vger.kernel.org>; Tue,  5 Mar 2024 12:15:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709640913; cv=none; b=l6BaDKpSB3Ac4tvbtEFqre80ND8/oaaBwFrlQ2ID9/vYOmoPA47cw5gdk3HO8T58xyjzFzjeq8bdGtJvhWejNaqQefG5eiVAqWscBwRvL7QCwhHzAM3DtN15PRvL3vU5lGnMS5zPa1UkwjnyNKiqTefCVoLug2Oh9XpwVRVjNiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709640913; c=relaxed/simple;
	bh=m2XLzbTrVi/fBCh2IbtLEuHFob/HQaZ+4VoWQFYrgVo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=o6JKXzoQgof163kfz/jZSu2fSRRu1RF7uPUSXt0/axKDcEVPVqb+xK7vdHW57EnN5OoK43+wUn25BBzf3nkXrmkK/bGmnGTMXdmJLYSM40XxSJXSEPUtO0ehaEZA+9L1eI+rQHVRadOCSDMjF6g6glXgjWT7xJVgfaNLJM811sI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wLOGT55Q; arc=none smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-607c5679842so56127507b3.2
        for <kernel-janitors@vger.kernel.org>; Tue, 05 Mar 2024 04:15:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709640911; x=1710245711; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ACz/8EKu2pqQ60QwCisE00yzmLGt/nj9yGvDIzzvWK4=;
        b=wLOGT55Qjr5AwUrQIQa21h3quBYh7+bv83zSPAkWpl36UTgqToWz+hxwXIRMqS4UOM
         /sB964u+JJ3umnW7T81PFGSMRl6DP+utGeFPx+duAU+RiV4pv5/xP3Lqtr2OqHGucRk1
         xeng3v5bOfkVfVpUNy6HXz39Zswx4yrD6Tt34Gr9rtI//UvFk39QUwaQGgwo/lkIdfwU
         Wd3lcEvQtT2iXhXcexk+xDVdlqbfyIYdpjKX8Ydc6HnsENeNoUMnLJD0Tj7PKvwTwI/0
         E5W8kRqPLmaL6NvEa+2pEoLqFtEKZqAYDJIdbAY+gXlH0yqCPlBZyao30U4z/iSP4DB4
         aZ8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709640911; x=1710245711;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ACz/8EKu2pqQ60QwCisE00yzmLGt/nj9yGvDIzzvWK4=;
        b=AzqSD6W2fr1KCnS63HClJzqx5FPHfKBEAq853XJ10vZLwYL3QPpN9wjtSsKfxgzMn0
         b1E4SUoO7q4dW84qJajVQuYOVX/oF44Rb8UXNQLj+A6Fuey9HhxzPambYRojfdMcEUb8
         QQYDlyU3mho5dWQaw6S+B4n5+elMlKqSd50kAFJbjtukjEOJE/V0BQkOPCsV+YbQY72Z
         32SbRAgU4gdIyYkoDzzL/KyEPbATKu/sGVAbDNW9cznkpRXA4rPwCKCp1hTnaivX23zB
         xiCzXXpGuYKzaFjYSUPVKjh5IeYIuXalCFplzdBmxZDvP3G/HzN80UcFKjk8JWlbcp59
         GxlQ==
X-Forwarded-Encrypted: i=1; AJvYcCVjoTccjgpFLf6uiswmNYniL5BYcjwVUPnnvlBea34xGJT8R8t5p+wKqVbq9ZVRvOPqDeGwSHXulQV5LNAfYt6T25jduchGyaTNFGydrDBe
X-Gm-Message-State: AOJu0YzwP07dZRDZicHOLZMmssdMnWng8/62KYgtW8V1ZY99E46Yk27C
	WC5PV285spZqBECx7DbXrw9EUSzZEHcH1MLeDE7a0cet0dOQQmfkfk3De8wnMRs+76X7Q9KqxSS
	3h68pCID6ETjdfH658M/9oWs0PMYNhqmlXeNpqg==
X-Google-Smtp-Source: AGHT+IE3VvLHkTZjsHbESyjaoia0k5m27DVB+/PFifZl/dghz8naoPYwRD7/1H8nf7a1HryxQ+jy/j7swWzpKe2ban4=
X-Received: by 2002:a25:2648:0:b0:dcc:7c0f:2222 with SMTP id
 m69-20020a252648000000b00dcc7c0f2222mr9133998ybm.22.1709640910540; Tue, 05
 Mar 2024 04:15:10 -0800 (PST)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <bb0bb1ed1e18de55e8c0547625bde271e64b8c31.1708983064.git.christophe.jaillet@wanadoo.fr>
In-Reply-To: <bb0bb1ed1e18de55e8c0547625bde271e64b8c31.1708983064.git.christophe.jaillet@wanadoo.fr>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 5 Mar 2024 13:14:34 +0100
Message-ID: <CAPDyKFpp3ODa+7z-Nx+ZLc2fqe6-=4MRQsQbKNVWb99u5-WasA@mail.gmail.com>
Subject: Re: [PATCH] mmc: wmt-sdmmc: remove an incorrect release_mem_region()
 call in the .remove function
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: cjb@laptop.org, linux-arm-kernel@lists.infradead.org, 
	linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 26 Feb 2024 at 22:37, Christophe JAILLET
<christophe.jaillet@wanadoo.fr> wrote:
>
> This looks strange to call release_mem_region() in a remove function
> without any request_mem_region() in the probe or "struct resource"
> somewhere.
>
> So remove the corresponding code.
>
> Fixes: 3a96dff0f828 ("mmc: SD/MMC Host Controller for Wondermedia WM8505/WM8650")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Applied for next, thanks!

> ---
> This patch is speculative. Review with care.
> Compile tested only.

It looks to me that $subject patch doesn't make things any worse.

Potentially we may want to call request|release_resource() (or
similar) during probe/remove, but as that isn't done during probe
today, I decided to pick this up as is.

Kind regards
Uffe


> ---
>  drivers/mmc/host/wmt-sdmmc.c | 4 ----
>  1 file changed, 4 deletions(-)
>
> diff --git a/drivers/mmc/host/wmt-sdmmc.c b/drivers/mmc/host/wmt-sdmmc.c
> index 77d5f1d24489..860380931b6c 100644
> --- a/drivers/mmc/host/wmt-sdmmc.c
> +++ b/drivers/mmc/host/wmt-sdmmc.c
> @@ -883,7 +883,6 @@ static void wmt_mci_remove(struct platform_device *pdev)
>  {
>         struct mmc_host *mmc;
>         struct wmt_mci_priv *priv;
> -       struct resource *res;
>         u32 reg_tmp;
>
>         mmc = platform_get_drvdata(pdev);
> @@ -911,9 +910,6 @@ static void wmt_mci_remove(struct platform_device *pdev)
>         clk_disable_unprepare(priv->clk_sdmmc);
>         clk_put(priv->clk_sdmmc);
>
> -       res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -       release_mem_region(res->start, resource_size(res));
> -
>         mmc_free_host(mmc);
>
>         dev_info(&pdev->dev, "WMT MCI device removed\n");
> --
> 2.43.2
>

