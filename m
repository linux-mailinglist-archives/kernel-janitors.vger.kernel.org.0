Return-Path: <kernel-janitors+bounces-7993-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B504AAF3E1
	for <lists+kernel-janitors@lfdr.de>; Thu,  8 May 2025 08:40:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A24867BB8E6
	for <lists+kernel-janitors@lfdr.de>; Thu,  8 May 2025 06:39:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C34A621A44C;
	Thu,  8 May 2025 06:40:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CkVsDYMz"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CC392192FA
	for <kernel-janitors@vger.kernel.org>; Thu,  8 May 2025 06:40:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746686433; cv=none; b=My0tGj4s9g97Z/mWbUwd4kF+ACtktd7TwWK6FOA1Q/oAHmNJ3k+ud0wkqb/xbTC3Qp+KR/3pzBEF9WLLZIU+3rng+v1wHCpGN6KwJsUe8N8bhoegDVEYvHGob9dVtoT6nWhmuAcrcC6R4dkRg5aMFjYe2xeWYGzXL8VC5vQdECk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746686433; c=relaxed/simple;
	bh=mo7aBOYxy2laS+VfZHPupXplp+OJ0XZ0QwmwUj+Cx7E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=odTm66gk4Pw5ThpWiS3A48j0ZRjFCu9A94JLgDHSsLSsjWvix0ICltrrlqlWPUV9cJ8RWOb73z4B7bkGXJkU1WXKqJaVVoKxVHYsvrCe1DQV7PShPJLdjrXlM/G4pXMQJc0ZXh+X/HZtJt3ppIIMQ92azkQAfsLThAWzXmPJR5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CkVsDYMz; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-43ea40a6e98so6081495e9.1
        for <kernel-janitors@vger.kernel.org>; Wed, 07 May 2025 23:40:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746686429; x=1747291229; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=m0BYhiXUdA6i9dCcFIqo30mmGVKS8d1Kjub/7fShZA0=;
        b=CkVsDYMzDpzRHRO6FcVVzzHLgRGY4XxjKvk3TqtyBCrBQQMfFO0SleHFkpRLJZPB89
         terLxyDUCkNb/9OW1fmRTLcNTGnDwWS3OB/mCPUR28HD8+j8WA3IeQQEyItIgOK/gnUR
         88VcAsrNKud4mY4WMJ87NrUHoiBzwFP8LGA7qag3DYb+QG4dAQGjwIgH22k445UE2fDv
         tsNpQhiTladg92zjGW2oS90vcZ5JzZG2nfHeWwj15lJgXJjks1lTSPL7j+EnmNFIAVV/
         1RXk5sRaPtimqAnJjb/VnHsH5PQnsJuAS731kwCsv9xO8SYMHqfKvQh/TeX0LOa/RyNX
         7Ihg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746686429; x=1747291229;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m0BYhiXUdA6i9dCcFIqo30mmGVKS8d1Kjub/7fShZA0=;
        b=keHtBRSpRJQ5TYFRUiLZLF0//YAfitPvGZLGjG2D3LEStHPIHvhtu3Jc5jA9joVuHY
         G86QcU5pvuirGKZgOaJMX6G1m1QCnL0cm1oOkIbzbim+3UcBXYqufXEDa3zcvLkzZLHE
         BsWXMuBj+AuWTmgvh/u+9cTHAaRL8WrB85Mnk4k3Kac3RMPrEmOROrDe5ujZPoef/YdA
         gl2yyxcGfIwrF9SMW2L4dXnAx2/0vY3krgaOOMyvLnwMJHVj/6Q/ALoiwXxO7nShrifO
         DOUMcbTbucRC1VPAhsdpRzaJW+yS5hMg9ebBqQD4N+An8Qg3FvMS4q9qkvVWGjmPRE/8
         aWDg==
X-Forwarded-Encrypted: i=1; AJvYcCVMPGqE8RPTTA29FkPHFfdXZ9XSk/eTFXMpefkKMcoZnyEko7HSpmRW3wITw+NXCAF3278uAsb0D7PhHncK/Hk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwEcl+dfCO+VNJwm/NVO1Ob6w/9UmhwkWvBhBD3QvEZhcMoci6V
	1yTOPQAjr+YIcfgg4nvU8bTTxDQfZSVN9f9h3csUYEB60iZHRnWgpKk30MAETlE=
X-Gm-Gg: ASbGncsgIKXLYpakzCPx4OU6kVreB8SqMgqu3ley2kH7YRfu0hD2c76P0E26WpN5XyR
	rcTjbVR4MC+erdKjzLJHlYURBNcke8VXBGNfCwU63ekq1veeNaPMTVQG1+80txdsvTFoxfaEUbT
	KyqCbVtdkTlRbIZxBeAAB/R/rhMdUhxdrOumv2a52ipE7LDQVDP/aUwNaMIR4aa+WP7NaUq7fEh
	sIPRZzWy0x5YKmZSJmMImCRz4q0AmRxtDK7PPsRZTXmix0LJndQyuRZpqJrT+R4axCgQyeWS1Gu
	/ML/0oZxvEtxbGcR8zLC6hReQNjP5QTbvQNlS5SXcxr5BONfbHus8vPS
X-Google-Smtp-Source: AGHT+IFZRIfE5PxRRbMe4B54cwayzKdn3VEZhgxzfmBDRkxcWCbiRLfEqYjfrSNjGm+C2f+T0IBaxg==
X-Received: by 2002:a05:600c:628d:b0:43d:fa:1f9a with SMTP id 5b1f17b1804b1-441d44e3359mr67512805e9.30.1746686429396;
        Wed, 07 May 2025 23:40:29 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-442cd35f40asm25158595e9.27.2025.05.07.23.40.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 23:40:28 -0700 (PDT)
Date: Thu, 8 May 2025 09:40:26 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Naresh Kamboju <naresh.kamboju@linaro.org>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>,
	linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	stable@vger.kernel.org, patches@lists.linux.dev,
	torvalds@linux-foundation.org, akpm@linux-foundation.org,
	linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
	lkft-triage@lists.linaro.org, pavel@denx.de, jonathanh@nvidia.com,
	f.fainelli@gmail.com, sudipm.mukherjee@gmail.com,
	srw@sladewatkins.net, rwarsow@gmx.de, conor@kernel.org,
	hargar@microsoft.com, broonie@kernel.org,
	Arnd Bergmann <arnd@arndb.de>, Liam Girdwood <lgirdwood@gmail.com>,
	Frieder Schrempf <frieder.schrempf@kontron.de>,
	Marek Vasut <marex@denx.de>,
	Anders Roxell <anders.roxell@linaro.org>
Subject: Re: [PATCH] rpmsg: qcom_smd: Fix uninitialized return variable in
 __qcom_smd_send()
Message-ID: <aBxR2nnW1GZ7dN__@stanley.mountain>
References: <CA+G9fYs+z4-aCriaGHnrU=5A14cQskg=TMxzQ5MKxvjq_zCX6g@mail.gmail.com>
 <aAkhvV0nSbrsef1P@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aAkhvV0nSbrsef1P@stanley.mountain>

Hi Greg,

I'm sorry I forgot to add the:

Cc: stable@vger.kernel.org

to this patch.  Could we backport it to stable, please?

regards,
dan carpenter

On Wed, Apr 23, 2025 at 08:22:05PM +0300, Dan Carpenter wrote:
> The "ret" variable isn't initialized if we don't enter the loop.  For
> example,  if "channel->state" is not SMD_CHANNEL_OPENED.
> 
> Fixes: 33e3820dda88 ("rpmsg: smd: Use spinlock in tx path")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
> Naresh, could you test this patch and see if it fixes the boot
> problems you saw?
> 
>  drivers/rpmsg/qcom_smd.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/rpmsg/qcom_smd.c b/drivers/rpmsg/qcom_smd.c
> index 40d386809d6b..bb161def3175 100644
> --- a/drivers/rpmsg/qcom_smd.c
> +++ b/drivers/rpmsg/qcom_smd.c
> @@ -746,7 +746,7 @@ static int __qcom_smd_send(struct qcom_smd_channel *channel, const void *data,
>  	__le32 hdr[5] = { cpu_to_le32(len), };
>  	int tlen = sizeof(hdr) + len;
>  	unsigned long flags;
> -	int ret;
> +	int ret = 0;
>  
>  	/* Word aligned channels only accept word size aligned data */
>  	if (channel->info_word && len % 4)
> -- 
> 2.47.2

