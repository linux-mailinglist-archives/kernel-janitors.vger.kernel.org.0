Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5C65D30BD60
	for <lists+kernel-janitors@lfdr.de>; Tue,  2 Feb 2021 12:49:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230221AbhBBLs4 (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Tue, 2 Feb 2021 06:48:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49394 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230058AbhBBLsy (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 2 Feb 2021 06:48:54 -0500
Received: from mail-il1-x12e.google.com (mail-il1-x12e.google.com [IPv6:2607:f8b0:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23B75C06174A
        for <kernel-janitors@vger.kernel.org>; Tue,  2 Feb 2021 03:48:14 -0800 (PST)
Received: by mail-il1-x12e.google.com with SMTP id a16so1086376ilq.5
        for <kernel-janitors@vger.kernel.org>; Tue, 02 Feb 2021 03:48:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=i8yjWv7ZYVQ87c8yLM3My2cCeuFw/bHz0Id/b7ZzflI=;
        b=g1bjm1Cw4dRx9KuSznNwNqd9zMQxQ8mh/yPrLOZIv2NVpVGDtDfMGVabbrqiubOOz6
         QEERr305GVQlhPfuD4A1r0tkvP90qZ4m0UQBQzKLtKq8Sywf15xP5pwELhTkU1pzySgX
         4pzlOZF4NXUvhNa7Cq+XO/G2GwSWxIkjNc5JY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=i8yjWv7ZYVQ87c8yLM3My2cCeuFw/bHz0Id/b7ZzflI=;
        b=IpadDct0v6UKTQ6U/RhY0A9QaVnw9HUBjfhV4wbg0SByXNFMDJqgyczHTgXILTmXGd
         lvrd7912HlYZrtNdkK0nqG3hXadiXOyDd8IovIAcrdklXNtVehZRaChMw54H7dO0U7BF
         1HoFV1BH6f9A1LLbXy1BhHvlqTF77aJWD4IP6fpGMlLYdGtvhQoMqyE+IQlrVoHc6lzH
         WtR/B1rVFnBf36esrK82BWmHyT0jnnwVzutvFdEkPdW0CCc3m4lWLvHhHO4wBBpGaks/
         Q1Nj09KoG+lfkySFLw5IVFrBHysq1z+5xj7k8v0eMbw5zQTLv+kPIS0VdbArh929UOc9
         jR+A==
X-Gm-Message-State: AOAM533/FItZHBVzg4PH/X3TDVLtAAHYN/zVFAwwu/ZfDwAz62uSgqWI
        6Ab9q/OwdyUVzthSd3Gi8qZJLjjKEx18Cw==
X-Google-Smtp-Source: ABdhPJz0wwATr5H/UtuNxpv0rTHAbjagxB2WPYjGve68R6vxpl2aolDKibNUmvaHUK5vQ+GagzOt6Q==
X-Received: by 2002:a05:6e02:48f:: with SMTP id b15mr18473415ils.144.1612266493375;
        Tue, 02 Feb 2021 03:48:13 -0800 (PST)
Received: from [172.22.22.26] (c-73-185-129-58.hsd1.mn.comcast.net. [73.185.129.58])
        by smtp.googlemail.com with ESMTPSA id j25sm9762363iog.27.2021.02.02.03.48.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Feb 2021 03:48:12 -0800 (PST)
Subject: Re: [PATCH net] net: ipa: pass correct dma_handle to
 dma_free_coherent()
To:     Dan Carpenter <dan.carpenter@oracle.com>,
        Alex Elder <elder@kernel.org>
Cc:     "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>, netdev@vger.kernel.org,
        kernel-janitors@vger.kernel.org
References: <YBjpTU2oejkNIULT@mwanda>
From:   Alex Elder <elder@ieee.org>
Message-ID: <cc689bd3-90d8-5ad5-661b-e2c3b76c7341@ieee.org>
Date:   Tue, 2 Feb 2021 05:48:11 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <YBjpTU2oejkNIULT@mwanda>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On 2/1/21 11:55 PM, Dan Carpenter wrote:
> The "ring->addr = addr;" assignment is done a few lines later so we
> can't use "ring->addr" yet.  The correct dma_handle is "addr".
> 
> Fixes: 650d1603825d ("soc: qcom: ipa: the generic software interface")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Yikes.  Thank you for the fix.

Reviewed-by: Alex Elder <elder@linaro.org>

> ---
> Smatch also complians about:
> 
>     drivers/net/ipa/gsi.c:1739 gsi_channel_setup()
>     warn: missing error code 'ret'
> 
> It probably should return -EINVAL, but I'm not positive.
> 
>  drivers/net/ipa/gsi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/net/ipa/gsi.c b/drivers/net/ipa/gsi.c
> index f79cf3c327c1..b559d14271e2 100644
> --- a/drivers/net/ipa/gsi.c
> +++ b/drivers/net/ipa/gsi.c
> @@ -1373,7 +1373,7 @@ static int gsi_ring_alloc(struct gsi *gsi, struct gsi_ring *ring, u32 count)
>  	/* Hardware requires a 2^n ring size, with alignment equal to size */
>  	ring->virt = dma_alloc_coherent(dev, size, &addr, GFP_KERNEL);
>  	if (ring->virt && addr % size) {
> -		dma_free_coherent(dev, size, ring->virt, ring->addr);
> +		dma_free_coherent(dev, size, ring->virt, addr);
>  		dev_err(dev, "unable to alloc 0x%zx-aligned ring buffer\n",
>  			size);
>  		return -EINVAL;	/* Not a good error value, but distinct */
> 

