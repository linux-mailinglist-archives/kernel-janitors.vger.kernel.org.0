Return-Path: <kernel-janitors+bounces-8398-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A337AE8BEB
	for <lists+kernel-janitors@lfdr.de>; Wed, 25 Jun 2025 20:04:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6559F4A3F39
	for <lists+kernel-janitors@lfdr.de>; Wed, 25 Jun 2025 18:04:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80C5429AB02;
	Wed, 25 Jun 2025 18:03:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="ZRLHZ2Yz"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from out-172.mta1.migadu.com (out-172.mta1.migadu.com [95.215.58.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0E7E1E102D
	for <kernel-janitors@vger.kernel.org>; Wed, 25 Jun 2025 18:03:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750874638; cv=none; b=LMmplVQ0GtZXmw3zuRCiFKAL6U0D0wVHMzwne80YGENtRbUPbaCUM4WYGQzJVOpEr4bf+A5HYGwDOH6AxfCfSkur9wSV4OyQOWRqMfzXDjIp2tTaZtZBo23ap4oA/O9Y9pFXUNyb1bn0w0J713MsnqM5iZHp8beMl+gFKuiHL1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750874638; c=relaxed/simple;
	bh=kTOVzbJXVGmBvAGjVwIPoNLXCVX7LhoBr+zKdn7qsAg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OGOkTM5P9MJaIW2UHzJUor2L1O21nXMNAujPeRxtUMf0kcwPSr3MpZ5USuP7gnKD8Kb4vQ66XXIXegqieq8cwe8Z5ycrp8ARIEVYDGc6b5E03kePdYc0HT7ANCsX+Jg8lLCTaw5J9p4F4mQBkKx76KpYNWKawyKqETgFi4GaBLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=ZRLHZ2Yz; arc=none smtp.client-ip=95.215.58.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Message-ID: <d72af2c1-2faf-46db-b212-0b800040c311@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1750874633;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bmEOTc35qmXDcWHfJYLwaXjxVpRNejQ+x5gurD+FuPA=;
	b=ZRLHZ2Yzhr9hA/kJDhbYSZquvZRJAZyVm37HS11+SLXa/PXi+soMKoTIObWca4ex53ha/7
	i3I6NdYxXVlWLPhKwTHo8YPiNHg+4rXeiPmUEcGkjBYgvNq+wGQI9YkDc5svIXg+6AbdmC
	zE5s3tODqmPisZegwo1fW3dLo8E0W1s=
Date: Wed, 25 Jun 2025 11:03:49 -0700
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH] RDMA/rxe: Fix a couple IS_ERR() vs NULL bugs
To: Dan Carpenter <dan.carpenter@linaro.org>,
 Zhu Yanjun <zyjzyj2000@gmail.com>
Cc: Jason Gunthorpe <jgg@ziepe.ca>, Leon Romanovsky <leon@kernel.org>,
 Daisuke Matsuda <dskmtsd@gmail.com>, linux-rdma@vger.kernel.org,
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
References: <685c1430.050a0220.18b0ef.da83@mx.google.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "yanjun.zhu" <yanjun.zhu@linux.dev>
In-Reply-To: <685c1430.050a0220.18b0ef.da83@mx.google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

On 6/25/25 8:22 AM, Dan Carpenter wrote:
> The lookup_mr() function returns NULL on error.  It never returns error
> pointers.

Yes, I agree with you. However, this commit is intended to fix an issue 
in the rdma-next tree. The corresponding repository is: 
https://git.kernel.org/pub/scm/linux/kernel/git/leon/linux-rdma.git.

Therefore, the subject should be: [PATCH rdma-next]

This problem does not exist in the upstream Linux kernel.

Other than that, I have no issues with the commit.

Reviewed-by: Zhu Yanjun <yanjun.zhu@linux.dev>

Zhu Yanjun

> 
> Fixes: 9284bc34c773 ("RDMA/rxe: Enable asynchronous prefetch for ODP MRs")
> Fixes: 3576b0df1588 ("RDMA/rxe: Implement synchronous prefetch for ODP MRs")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>   drivers/infiniband/sw/rxe/rxe_odp.c | 8 +++++---
>   1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/infiniband/sw/rxe/rxe_odp.c b/drivers/infiniband/sw/rxe/rxe_odp.c
> index 01a59d3f8ed4..f58e3ec6252f 100644
> --- a/drivers/infiniband/sw/rxe/rxe_odp.c
> +++ b/drivers/infiniband/sw/rxe/rxe_odp.c
> @@ -470,10 +470,10 @@ static int rxe_ib_prefetch_sg_list(struct ib_pd *ibpd,
>   		mr = lookup_mr(pd, IB_ACCESS_LOCAL_WRITE,
>   			       sg_list[i].lkey, RXE_LOOKUP_LOCAL);
>   
> -		if (IS_ERR(mr)) {
> +		if (!mr) {
>   			rxe_dbg_pd(pd, "mr with lkey %x not found\n",
>   				   sg_list[i].lkey);
> -			return PTR_ERR(mr);
> +			return -EINVAL;
>   		}
>   
>   		if (advice == IB_UVERBS_ADVISE_MR_ADVICE_PREFETCH_WRITE &&
> @@ -535,8 +535,10 @@ static int rxe_ib_advise_mr_prefetch(struct ib_pd *ibpd,
>   		/* Takes a reference, which will be released in the queued work */
>   		mr = lookup_mr(pd, IB_ACCESS_LOCAL_WRITE,
>   			       sg_list[i].lkey, RXE_LOOKUP_LOCAL);
> -		if (IS_ERR(mr))
> +		if (!mr) {
> +			mr = ERR_PTR(-EINVAL);
>   			goto err;
> +		}
>   
>   		work->frags[i].io_virt = sg_list[i].addr;
>   		work->frags[i].length = sg_list[i].length;


