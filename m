Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5BC765306C4
	for <lists+kernel-janitors@lfdr.de>; Mon, 23 May 2022 02:04:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231863AbiEWAEc (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Sun, 22 May 2022 20:04:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51764 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231642AbiEWAEb (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sun, 22 May 2022 20:04:31 -0400
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com [IPv6:2607:f8b0:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08CA337A20
        for <kernel-janitors@vger.kernel.org>; Sun, 22 May 2022 17:04:30 -0700 (PDT)
Received: by mail-pf1-x42d.google.com with SMTP id 202so5250316pfu.0
        for <kernel-janitors@vger.kernel.org>; Sun, 22 May 2022 17:04:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=UOkp6y7r1hyFZ2vnER+rfHPHB1ZMRtCyHLtXupopRVs=;
        b=L5norIkD2/0eKjGrCfCgo8okCTMPpLZnVhagra8ytcJ+NqzPu6x/2R7NqJL+m4eVM3
         m+chb5S0ZTZ746sExJuRMGC/HY3Z+uBdGOR8VlAQVpyYQTsvERx1/wX5ahxmFKV/0q0U
         w8gqzzNr/AaXQWTA7ukpK0LQhkvmnwAgt079bzOrbu+6Ozi5p7GUywbW3rM5Ck7HN7WN
         qek8AVXXIEVsi88DuzdLagpD627tlhH51VD2bRw5oAx1tbs1ypNg8XOBRXlgZ2+h4Lmw
         reS53S3vnpRkDq9pMiCwM0tFKvONa+ArjAcY5LxMWlWKaDDDdyMUBJVisMSS70LkGYQQ
         yKWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=UOkp6y7r1hyFZ2vnER+rfHPHB1ZMRtCyHLtXupopRVs=;
        b=R5s3t8lrHhv9YZtcF8ehmF1yhrwxaS1EQGB8/oNrjz9uzSSVOvRFAJzvOsBSxpoOaN
         R05bzSzjlxgPbRoXaLKosFpn10hZRkMDXWBSa8jSjgQdTMsnm/jji+33Jgi3s9Bk3RoM
         RjgUSAsWtOj8iNh1i0oJ1jbsb5icMQyEKF8V9WkIXVXngXsn28yzsP70qt4ZRuJ+CktX
         LfEK0wlxEpCt68PvCbv4VbfUNUwTJ/B5cLXcCn0MF/JU9Ma5aQBh0XdEXdlaPiREeSfD
         TPYla2d4XRQaCBmdMIRtx7WppHB0mJTDYqhbK/d11zqAWkcrfu6qaW6cqZJrXEg8ybVW
         qG1g==
X-Gm-Message-State: AOAM532ljqTvTnJN8gJWRnlm/phU9Iw2wcRW21NMpq8G1w27k2S1rSXC
        hbYpIXWmFYQXzsbgZ5IYH7339Q==
X-Google-Smtp-Source: ABdhPJyieONJVyrim8+r73DTQxdtaOachQAxcnAsYPRbDhwAjKhsWoR+2/4pBO5djbaQpNB7VNd92Q==
X-Received: by 2002:a63:581:0:b0:3f2:6b21:4733 with SMTP id 123-20020a630581000000b003f26b214733mr18172416pgf.90.1653264269517;
        Sun, 22 May 2022 17:04:29 -0700 (PDT)
Received: from [10.255.89.252] ([139.177.225.239])
        by smtp.gmail.com with ESMTPSA id mj10-20020a17090b368a00b001cd4989ff44sm5762831pjb.11.2022.05.22.17.04.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 May 2022 17:04:28 -0700 (PDT)
Message-ID: <bf18d5b7-5364-79d2-5b57-df9dc4b284a5@bytedance.com>
Date:   Mon, 23 May 2022 08:00:28 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH] virtio-crypto: Fix an error handling path in
 virtio_crypto_alg_skcipher_close_session()
Content-Language: en-US
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Gonglei <arei.gonglei@huawei.com>
Cc:     linux-kernel@vger.kernel.org, dan.carpenter@oracle.com,
        Jason Wang <jasowang@redhat.com>,
        kernel-janitors@vger.kernel.org,
        virtualization@lists.linux-foundation.org,
        linux-crypto@vger.kernel.org,
        "David S. Miller" <davem@davemloft.net>,
        Herbert Xu <herbert@gondor.apana.org.au>
References: <068d2824cf592748cbd9b75cf4cb6c29600e213c.1653224817.git.christophe.jaillet@wanadoo.fr>
From:   zhenwei pi <pizhenwei@bytedance.com>
In-Reply-To: <068d2824cf592748cbd9b75cf4cb6c29600e213c.1653224817.git.christophe.jaillet@wanadoo.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org



On 5/22/22 21:07, Christophe JAILLET wrote:
> Now that a private buffer is allocated (see commit in the Fixes tag),
> it must be released in all error handling paths.
> 
> Add the missing goto to avoid a leak in the error handling path.
> 
> Fixes: 42e6ac99e417 ("virtio-crypto: use private buffer for control request")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
>   drivers/crypto/virtio/virtio_crypto_skcipher_algs.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/crypto/virtio/virtio_crypto_skcipher_algs.c b/drivers/crypto/virtio/virtio_crypto_skcipher_algs.c
> index e553ccadbcbc..e5876286828b 100644
> --- a/drivers/crypto/virtio/virtio_crypto_skcipher_algs.c
> +++ b/drivers/crypto/virtio/virtio_crypto_skcipher_algs.c
> @@ -239,7 +239,8 @@ static int virtio_crypto_alg_skcipher_close_session(
>   		pr_err("virtio_crypto: Close session failed status: %u, session_id: 0x%llx\n",
>   			ctrl_status->status, destroy_session->session_id);
>   
> -		return -EINVAL;
> +		err = -EINVAL;
> +		goto out;
>   	}
>   
>   	err = 0;


This looks good to me, thanks!
Acked-by: zhenwei pi <pizhenwei@bytedance.com>

-- 
zhenwei pi
