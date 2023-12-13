Return-Path: <kernel-janitors+bounces-667-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 85E6C80F4FC
	for <lists+kernel-janitors@lfdr.de>; Tue, 12 Dec 2023 18:53:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6BC961C20BA8
	for <lists+kernel-janitors@lfdr.de>; Tue, 12 Dec 2023 17:53:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45D5A7D8BB;
	Tue, 12 Dec 2023 17:53:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="CaefnQSg"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from smtp.smtpout.orange.fr (smtp-16.smtpout.orange.fr [80.12.242.16])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 26554AD
	for <kernel-janitors@vger.kernel.org>; Tue, 12 Dec 2023 09:53:17 -0800 (PST)
Received: from [192.168.1.18] ([92.140.202.140])
	by smtp.orange.fr with ESMTPA
	id D6wUrQiNALMHAD6wUrlYvP; Tue, 12 Dec 2023 18:53:15 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1702403595;
	bh=L/MbAWs2OZrOLC1rYEO04nGayLDbwyeb69eSCqKczhU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=CaefnQSg6liXBIn+KC3ED6T/XyzXpAePPtyDK6t5uD2Qc3r89YqDv4DkKRbvCl3MQ
	 bEQhMKeLxr0vQoFwbaVJ9Pqe1iH4kjC8VJViLG1iI50rs8O3+XqPG5p/szOtLmSVTg
	 jANYxiamUO3YKTLDD/3rlm01zE/hTmHg8FKXByaiqDWFy5nDLjbaO/mHh4qvrUdqrb
	 ZfRqXJVKzxUfBCelUHiQ5C9IPotseImhXuzte/RmfHW/IcnWg0lJK7omwCRquKQ6aF
	 yLQcv7C+25Hfq/ft7LnPiyjthbIFsI8+3Z4D7XoAvZqgNYW1EntCN6U+Tc8qqvEAJY
	 R6+YK17E5J+9Q==
X-ME-Helo: [192.168.1.18]
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Tue, 12 Dec 2023 18:53:15 +0100
X-ME-IP: 92.140.202.140
Message-ID: <94c5f197-9459-40fe-9c34-06359779a51a@wanadoo.fr>
Date: Tue, 12 Dec 2023 18:53:13 +0100
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] cdx: Unlock on error path in rescan_store()
To: Dan Carpenter <dan.carpenter@linaro.org>,
 Abhijit Gangurde <abhijit.gangurde@amd.com>
Cc: Nipun Gupta <nipun.gupta@amd.com>, Nikhil Agarwal
 <nikhil.agarwal@amd.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
References: <8c79956b-bf8c-4511-97cc-a16833a0630f@moroto.mountain>
Content-Language: fr
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <8c79956b-bf8c-4511-97cc-a16833a0630f@moroto.mountain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Le 12/12/2023 à 10:20, Dan Carpenter a écrit :
> We added locking to this function but these two error paths were
> accidentally overlooked.
> 
> Fixes: f0af81683466 ("cdx: Introduce lock to protect controller ops")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>   drivers/cdx/cdx.c | 14 +++++++++-----
>   1 file changed, 9 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/cdx/cdx.c b/drivers/cdx/cdx.c
> index d84d153078d7..f4f9f0c88c09 100644
> --- a/drivers/cdx/cdx.c
> +++ b/drivers/cdx/cdx.c
> @@ -572,12 +572,16 @@ static ssize_t rescan_store(const struct bus_type *bus,
>   
>   	/* Rescan all the devices */
>   	for_each_compatible_node(np, NULL, compat_node_name) {
> -		if (!np)
> -			return -EINVAL;
> +		if (!np) {
> +			count = -EINVAL;
> +			goto unlock;
> +		}
>   
>   		pd = of_find_device_by_node(np);
> -		if (!pd)
> -			return -EINVAL;
> +		if (!pd) {
> +			count = -EINVAL;
> +			goto unlock;

Unrelated to your patch, but should we have a of_node_put(np); here, on 
early exit?

CJ

> +		}
>   
>   		cdx = platform_get_drvdata(pd);
>   		if (cdx && cdx->controller_registered && cdx->ops->scan)
> @@ -585,7 +589,7 @@ static ssize_t rescan_store(const struct bus_type *bus,
>   
>   		put_device(&pd->dev);
>   	}
> -
> +unlock:
>   	mutex_unlock(&cdx_controller_lock);
>   
>   	return count;


