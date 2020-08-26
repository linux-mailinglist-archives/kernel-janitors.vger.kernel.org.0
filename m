Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 265C8252F66
	for <lists+kernel-janitors@lfdr.de>; Wed, 26 Aug 2020 15:16:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730129AbgHZNOR (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Wed, 26 Aug 2020 09:14:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46728 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730019AbgHZNOQ (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 26 Aug 2020 09:14:16 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A8DEEC061756
        for <kernel-janitors@vger.kernel.org>; Wed, 26 Aug 2020 06:14:14 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id k18so958145pfp.7
        for <kernel-janitors@vger.kernel.org>; Wed, 26 Aug 2020 06:14:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.ionos.com; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=96S2fyCwnO5jCulVGmko8MP9KCX2ee5EN88+HjU48Rg=;
        b=TPgbvM9sgbnQN3gFBEX46yoi+agIKZQidqifjf7QTXQiSxMgdOmp5A7ro03P7oxEex
         RVUyU32bwFKzkvdbZqZxkef70k6GnVNmNrSZFswhcmi5EcsoxnUBuRvX65HL0WK6v/pe
         4BPgh0/aZUsdYeuj93HrdUsO2wFjQ6pOBCRI6UzZs08NTiITlUOx6hIJJ42aK1Lc5kZm
         y0j3GOCqBhNz1kIJt2IN+nRUM7p+EJBYCnTb1YGFs9ihEn5dYe4PDtxcIyrOeu7PSyH0
         NLyIpKJ4tAua7JmcCwS5Q8HoigByB1F98eNFJHexX3J7M0Boj7T4fXsvZrKWCyGPXxNz
         Jgxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=96S2fyCwnO5jCulVGmko8MP9KCX2ee5EN88+HjU48Rg=;
        b=MxzA2RSRNBZxpmSYYWET6kTf52dMZuYkhQ3XdT6V4xkr6mKLs6bznfKKhJ9xRPyqzn
         9Z/z/vmftXLnZ/+cTBgVkxqS1nexqx+j9V4jXr/CQLSTVykkTQnyUzBUpU0+7Ft67ur+
         MiH5BGqQvhGSSUhK20lU3pqL26wOWS+LXyxbqNA2tEsLEld3u555kJPog56AiBNQQwnn
         ULTaWj8muYjX5MzuXTByykBEVpmBPAPMtGXw1A78m2LDQT64I4jlRmc6AE3iRFJWmPmU
         orUi30SMyA5Cxi1LEoDy19W/JDNBU3nV4SzYABakne7/SoJYHkF8bUHlZDjvR/BqdR92
         FjeA==
X-Gm-Message-State: AOAM531NH93I6ZyoslQqNYcdDgUftNXbmdUSJOJC3rqLcJqKpvBPIEyz
        zQhRQEIbuDOOlC60Uz3gHnlQ07erJPMyrA==
X-Google-Smtp-Source: ABdhPJydYo6ciBCCbIhLTRCkFEu/Rwx2WGVfCABYeKC2M4EKPPOfYYLmlHbUOVtfkZSKN+kGJuzIQA==
X-Received: by 2002:a63:4451:: with SMTP id t17mr9620534pgk.92.1598447651834;
        Wed, 26 Aug 2020 06:14:11 -0700 (PDT)
Received: from [10.8.0.34] ([89.187.161.160])
        by smtp.gmail.com with ESMTPSA id o16sm3226483pfu.188.2020.08.26.06.14.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Aug 2020 06:14:10 -0700 (PDT)
Subject: Re: [PATCH] rnbd: Fix an error code in process_rdma()
To:     Dan Carpenter <dan.carpenter@oracle.com>,
        Danil Kipnis <danil.kipnis@cloud.ionos.com>
Cc:     Jack Wang <jinpu.wang@cloud.ionos.com>,
        Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org,
        kernel-janitors@vger.kernel.org
References: <20200826113242.GC393664@mwanda>
From:   Guoqing Jiang <guoqing.jiang@cloud.ionos.com>
Message-ID: <85d5a2a9-a304-a32e-1bfd-143f42cd0b50@cloud.ionos.com>
Date:   Wed, 26 Aug 2020 15:13:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200826113242.GC393664@mwanda>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org



On 8/26/20 13:32, Dan Carpenter wrote:
> The error code is uninitialized on this error path.
>
> Fixes: 735d77d4fd28 ("rnbd: remove rnbd_dev_submit_io")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>   drivers/block/rnbd/rnbd-srv.c | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/drivers/block/rnbd/rnbd-srv.c b/drivers/block/rnbd/rnbd-srv.c
> index 0fb94843a495..5b69bc56b225 100644
> --- a/drivers/block/rnbd/rnbd-srv.c
> +++ b/drivers/block/rnbd/rnbd-srv.c
> @@ -149,6 +149,7 @@ static int process_rdma(struct rtrs_srv *sess,
>   	bio = rnbd_bio_map_kern(data, sess_dev->rnbd_dev->ibd_bio_set, datalen, GFP_KERNEL);
>   	if (IS_ERR(bio)) {
>   		rnbd_srv_err(sess_dev, "Failed to generate bio, err: %ld\n", PTR_ERR(bio));
> +		err = PTR_ERR(bio);
>   		goto sess_dev_put;
>   	}
>   

Thanks for the fix, Acked-by: Guoqing Jiang <guoqing.jiang@cloud.ionos.com>

Guoqing
