Return-Path: <kernel-janitors+bounces-4033-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D5C02908B8A
	for <lists+kernel-janitors@lfdr.de>; Fri, 14 Jun 2024 14:20:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7CAAE283932
	for <lists+kernel-janitors@lfdr.de>; Fri, 14 Jun 2024 12:20:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44125198E7F;
	Fri, 14 Jun 2024 12:20:44 +0000 (UTC)
X-Original-To: kernel-janitors@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 224EC195F03;
	Fri, 14 Jun 2024 12:20:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718367643; cv=none; b=mfQgkeIi+JLzznoGjW8dnaKIt+BktUufIhRvDmp0vBgdFRhuLYoEYCtLQvU1Mbn9wNJyu0IrVzXa85GpaMjhgcBn3qKyVH6dFDHhWhL/QmiMzJiQ7G/lP64zLtjdAIUCkeNl7gG9eS208opMWKkwNBYtMd9stuts5sidv0DgKE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718367643; c=relaxed/simple;
	bh=AQjmUgnkIYBObU9R4yF5y+8pGugJxUIcztwj75zUnTI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Fp8DOsRPzG9AChtm86ae5iiGV1r9MzzrcQW1FDvGLvbhLJO5tC0pTw8z0bvra+Or1fhEE7XokgfgOT1vlhhJ8hg6XY1oxu89Du1Tsmj6iIDwfoWb9gU/l0Np69dajtrUMYbM0z7iF1pmPHp56indN1lXAba25KRrZA/XCvToeYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 176E7FEC;
	Fri, 14 Jun 2024 05:21:06 -0700 (PDT)
Received: from [10.57.71.136] (unknown [10.57.71.136])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 572BD3F64C;
	Fri, 14 Jun 2024 05:20:40 -0700 (PDT)
Message-ID: <f22db70d-01da-4b49-a13c-6c4639215468@arm.com>
Date: Fri, 14 Jun 2024 13:20:39 +0100
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] iommu/iova: add missing MODULE_DESCRIPTION() macro
To: Jeff Johnson <quic_jjohnson@quicinc.com>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>
Cc: iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org
References: <20240613-md-arm-drivers-iommu-v1-1-1fe0bd953119@quicinc.com>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <20240613-md-arm-drivers-iommu-v1-1-1fe0bd953119@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2024-06-14 2:14 am, Jeff Johnson wrote:
> With ARCH=arm, make allmodconfig && make W=1 C=1 reports:
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/iommu/iova.o
> 
> Add the missing invocation of the MODULE_DESCRIPTION() macro.

Acked-by: Robin Murphy <robin.murphy@arm.com>

> Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> ---
>   drivers/iommu/iova.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/iommu/iova.c b/drivers/iommu/iova.c
> index d59d0ea2fd21..16c6adff3eb7 100644
> --- a/drivers/iommu/iova.c
> +++ b/drivers/iommu/iova.c
> @@ -1000,4 +1000,5 @@ void iova_cache_put(void)
>   EXPORT_SYMBOL_GPL(iova_cache_put);
>   
>   MODULE_AUTHOR("Anil S Keshavamurthy <anil.s.keshavamurthy@intel.com>");
> +MODULE_DESCRIPTION("IOMMU I/O Virtual Address management");
>   MODULE_LICENSE("GPL");
> 
> ---
> base-commit: 83a7eefedc9b56fe7bfeff13b6c7356688ffa670
> change-id: 20240613-md-arm-drivers-iommu-f637be6ec5c8
> 

