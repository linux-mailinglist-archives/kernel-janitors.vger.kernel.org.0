Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C9221480DA5
	for <lists+kernel-janitors@lfdr.de>; Tue, 28 Dec 2021 23:20:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236393AbhL1WUA (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Tue, 28 Dec 2021 17:20:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47652 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234840AbhL1WT7 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 28 Dec 2021 17:19:59 -0500
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7BEE4C06173F
        for <kernel-janitors@vger.kernel.org>; Tue, 28 Dec 2021 14:19:59 -0800 (PST)
Received: by mail-pl1-x62b.google.com with SMTP id z3so14506027plg.8
        for <kernel-janitors@vger.kernel.org>; Tue, 28 Dec 2021 14:19:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pensando.io; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=Lf/S2LPQ9iI7bcBTT4neE6R0mg+6glQTGFFuCfpCfPU=;
        b=H27QTjm7//8xn5TkIeh4DbZhOQBBWPJMp9HmbhnsxgcUzz+QDTgPo5g1YVW2POQEXt
         7JH1x52wN7F2GPOv0WZxGqsKvO3KhlsZDC8nTS9UwNez14WdJ/VBnMSHf4KRvpqTBY2Z
         LsGJV+yTGEjBRGlfzNYKE9QE8PGX4SrP5IISidTwx35seExtzdFznI8Rw+NdQTuJJzdP
         bmX5FqpJhUqYiruuLiDFV1DVhWAhhnkf1fQKq1r1z52pq7G0iFNhzQIRQbT1cX8AErAr
         I2B8Kvmwk8nA4HNd5zSI77YHvMNse1hmJ5C8XEfu3GZ6onwwsD6/grrGKDZNCEIGCPxe
         Pfig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=Lf/S2LPQ9iI7bcBTT4neE6R0mg+6glQTGFFuCfpCfPU=;
        b=BsLHpPaVkorrqRy8iXIAfoxRHx+XIJHudYbMKSFY9SqUG0DJ2wVdwwvOX0SwL5jsfM
         KVt+zCdIJKBNFm3B1SFiwinqPpJfiLEjU+/108wXjAp6MF9Htrh43jnhChG37hbtWbm1
         UDsqot2XTT7iyML32Hs0KRSfU3P81lkTEyv9i04QaiSTkIr0eYN8my2XjbCAST3mZqJe
         qBdKE6Z5lgKpNGXjZcopKypkELTHO91EdKvfQXbzN2DzpqTZNwif5f36z65CzD2JEsCK
         nRP1TOtWDcpQkZjaUQqJ/pgmB1t/vm8Yf4uUf5TbBLUjBdmjLG7KhSonfFHmohS8ACwO
         vsbA==
X-Gm-Message-State: AOAM530oMGLZYwQT8oJqQU2/12JiKoswy4jqftXDN0gDztJzzZ3tSc20
        mZ+rGsLEae8WVpMMuJsk0Rd33Q==
X-Google-Smtp-Source: ABdhPJxbJ0Ghxhf4j2KXJuAZGS3rqzQ0STdUeiLcJPn08C8tH2xoq1KqTCRw10/cERp7eAdhkUvK+w==
X-Received: by 2002:a17:90b:4b0e:: with SMTP id lx14mr28606702pjb.132.1640729998902;
        Tue, 28 Dec 2021 14:19:58 -0800 (PST)
Received: from [192.168.0.2] ([50.53.47.17])
        by smtp.gmail.com with ESMTPSA id u33sm23597804pfg.4.2021.12.28.14.19.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Dec 2021 14:19:58 -0800 (PST)
Message-ID: <ffe00c2d-f2a6-1d64-e6d4-ba3063856879@pensando.io>
Date:   Tue, 28 Dec 2021 14:21:32 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.4.1
Subject: Re: [PATCH] ionic: Initialize the 'lif->dbid_inuse' bitmap
Content-Language: en-US
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        drivers@pensando.io, davem@davemloft.net, kuba@kernel.org,
        allenbh@pensando.io
Cc:     netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org
References: <6a478eae0b5e6c63774e1f0ddb1a3f8c38fa8ade.1640527506.git.christophe.jaillet@wanadoo.fr>
From:   Shannon Nelson <snelson@pensando.io>
In-Reply-To: <6a478eae0b5e6c63774e1f0ddb1a3f8c38fa8ade.1640527506.git.christophe.jaillet@wanadoo.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On 12/26/21 6:06 AM, Christophe JAILLET wrote:
> When allocated, this bitmap is not initialized. Only the first bit is set a
> few lines below.
>
> Use bitmap_zalloc() to make sure that it is cleared before being used.
>
> Fixes: 6461b446f2a0 ("ionic: Add interrupts and doorbells")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Signed-off-by: Shannon Nelson <snelson@pensando.io>

> ---
> The 'dbid_inuse' bitmap seems to be unused.
> So it is certainly better to remove it completely instead of "fixing" it.
>
> Let me know if it is the way to go or if it is there for future use.
>
> If it should be left in place, the corresponding kfree() should also be
> replaces by some bitmap_free() to keep consistency.

This looks like one of those small bits that creeps in from the 
out-of-tree incarnation, is expected to used Real Soon Now, but is not 
really useful yet.  Yes, this probably should come out until actually 
useful.  When we get back from the holiday vacations we'll take a closer 
look at it and make sure we're not causing any unforeseen issues by 
pulling it out for now.

Thanks,
sln

> ---
>   drivers/net/ethernet/pensando/ionic/ionic_lif.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/net/ethernet/pensando/ionic/ionic_lif.c b/drivers/net/ethernet/pensando/ionic/ionic_lif.c
> index 63f8a8163b5f..2ff7be17e5af 100644
> --- a/drivers/net/ethernet/pensando/ionic/ionic_lif.c
> +++ b/drivers/net/ethernet/pensando/ionic/ionic_lif.c
> @@ -3135,7 +3135,7 @@ int ionic_lif_init(struct ionic_lif *lif)
>   		return -EINVAL;
>   	}
>   
> -	lif->dbid_inuse = bitmap_alloc(lif->dbid_count, GFP_KERNEL);
> +	lif->dbid_inuse = bitmap_zalloc(lif->dbid_count, GFP_KERNEL);
>   	if (!lif->dbid_inuse) {
>   		dev_err(dev, "Failed alloc doorbell id bitmap, aborting\n");
>   		return -ENOMEM;

