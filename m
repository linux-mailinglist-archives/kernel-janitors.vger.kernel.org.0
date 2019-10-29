Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 475CFE8870
	for <lists+kernel-janitors@lfdr.de>; Tue, 29 Oct 2019 13:42:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731059AbfJ2MmX (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Tue, 29 Oct 2019 08:42:23 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:41409 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726048AbfJ2MmX (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 29 Oct 2019 08:42:23 -0400
Received: by mail-wr1-f66.google.com with SMTP id p4so13472588wrm.8
        for <kernel-janitors@vger.kernel.org>; Tue, 29 Oct 2019 05:42:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=BPXp7xNo1ijPMANZMC0OJQTiJUBGfJGREatgOxfICDA=;
        b=oLxdOYd2VPtLQZ8doEBWg3jJLtOOjZP0nu8AK0107eeu0xUi1HabO38UPUHtrxB2vJ
         r2mpnITzdzYIIqJ/W3iu+aEU8bgU4W0LncSrHb+UQAu7yhrjvZI4vKFMOCu2U9pFXqvi
         +5xbARGaMsnVr6r9l4LLzbw7OBSPNHSspPiIO0ZVlEYHkjpEBRj6pbDsjuIcyXnBmLTr
         LladgHavdxtVP4r13zbSlUYLXfn2vMjbA7T9FSdKXeaQbQXd+XiBUhQOrQ9IEcwF2azi
         q3OobcCUiDAGnX66Oc5MQpSpIzVfs2BYD9l8AoBtaj1Ri+QnV0jQr/Zi2OM9ICYyL8H5
         mh2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=BPXp7xNo1ijPMANZMC0OJQTiJUBGfJGREatgOxfICDA=;
        b=uJCXEK8xx8daf4/CpMw8HOG0dgZdSYS14t93AIb55cG9WYzEyJ+8UuAzsGjrp0xBTo
         Cskz5shJY/DIMV62SbhjbI5t5eKyreYmufLq4CfNesjLTmCKX75hJqfqIpYkTJHMAF4b
         lk65SZt7ztBz0jlbCMg3zFtvWCUOgTXHJL0C27KvZNHBfo8ucU7zHH+IXAjPGY7tutlc
         Cos9wpFCX9LS9yHWB3CWE6QIeGyZ1o7jiz2kf+xxF+TT3ZXcbX4eZ7eh2PxTr50L0mrc
         Sv+1tCNmvc7lE0qpP3LQljs+5H8nS6/PNyR9Jp/ff1gFE5xZP6wV7GjjjVaUDF+TxCxR
         pQhA==
X-Gm-Message-State: APjAAAVLKMjpU7laQxiKQKa7BA2koUOkpK0XFuULjDxsgq6Iij69x4tL
        LOJvcPzYHIfIuqCjSYxCrRHLIA==
X-Google-Smtp-Source: APXvYqwqHf4wuK2I5AO9f/kEeooVPfRaL4aX5EEIOq9YjaTwHJCt7yKNkRGNPtbE0yZCGA/QU/7aIQ==
X-Received: by 2002:adf:fbc4:: with SMTP id d4mr1318049wrs.265.1572352940992;
        Tue, 29 Oct 2019 05:42:20 -0700 (PDT)
Received: from Red ([2a01:cb1d:147:7200:2e56:dcff:fed2:c6d6])
        by smtp.googlemail.com with ESMTPSA id f143sm3375496wme.40.2019.10.29.05.42.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Oct 2019 05:42:20 -0700 (PDT)
Date:   Tue, 29 Oct 2019 13:42:03 +0100
From:   LABBE Corentin <clabbe@baylibre.com>
To:     YueHaibing <yuehaibing@huawei.com>
Cc:     Herbert Xu <herbert@gondor.apana.org.au>,
        linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH -next] crypto: amlogic - Use kmemdup in meson_aes_setkey()
Message-ID: <20191029124203.GB18754@Red>
References: <20191029015523.126987-1-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191029015523.126987-1-yuehaibing@huawei.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Tue, Oct 29, 2019 at 01:55:23AM +0000, YueHaibing wrote:
> Use kmemdup rather than duplicating its implementation
> 
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> ---
>  drivers/crypto/amlogic/amlogic-gxl-cipher.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/crypto/amlogic/amlogic-gxl-cipher.c b/drivers/crypto/amlogic/amlogic-gxl-cipher.c
> index e9283ffdbd23..78e776c58705 100644
> --- a/drivers/crypto/amlogic/amlogic-gxl-cipher.c
> +++ b/drivers/crypto/amlogic/amlogic-gxl-cipher.c
> @@ -372,10 +372,9 @@ int meson_aes_setkey(struct crypto_skcipher *tfm, const u8 *key,
>  		kfree(op->key);
>  	}
>  	op->keylen = keylen;
> -	op->key = kmalloc(keylen, GFP_KERNEL | GFP_DMA);
> +	op->key = kmemdup(key, keylen, GFP_KERNEL | GFP_DMA);
>  	if (!op->key)
>  		return -ENOMEM;
> -	memcpy(op->key, key, keylen);
>  
>  	return crypto_sync_skcipher_setkey(op->fallback_tfm, key, keylen);
>  }
> 
> 
> 

Acked-by: Corentin Labbe <clabbe@baylibre.com>

Thanks
