Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4DD4844D44B
	for <lists+kernel-janitors@lfdr.de>; Thu, 11 Nov 2021 10:47:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232587AbhKKJuO (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Thu, 11 Nov 2021 04:50:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22955 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232516AbhKKJuN (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 11 Nov 2021 04:50:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1636624044;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=LZMGVBi1WJ/do0+s09ZqM+DEvJGBRijkiBcXTXBsjMY=;
        b=iAjo0XyQuUHNJ9HnyP70vJCc5tri8FhPLf15xk5wLQG/lciWi38gm7My+aYK7/IR9ox+sm
        1A+Bh892Kxob3KYwysZ79m96XCUKWSwd+VNevEKKp0A5HMjsgVpjU4ffnc9wiSq+8bM8nk
        gklGxDluwScyNPYhTxHEp1PTV9Lubn0=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-539--0-M9XSZMciQN1wiGUy1PQ-1; Thu, 11 Nov 2021 04:47:23 -0500
X-MC-Unique: -0-M9XSZMciQN1wiGUy1PQ-1
Received: by mail-ed1-f71.google.com with SMTP id z21-20020a05640240d500b003e3340a215aso4933312edb.10
        for <kernel-janitors@vger.kernel.org>; Thu, 11 Nov 2021 01:47:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=LZMGVBi1WJ/do0+s09ZqM+DEvJGBRijkiBcXTXBsjMY=;
        b=KBQtuvsaLLD1zLT8aLJMjwtIZxZMjOebijlOBlW7Y/h5qTYMKF1IKyM+CMRjk49/M9
         86R7Md3hJIYKRzdmjpzCNZxyPaan4ks0Zbz/PrxDVBKyw1sEFOIUy0qrzjfOgnxzXo2f
         /u5GidWluFJdBlxajz50hz6lPtrvhF2ONdaA/yzngi3CD+Gr3rjh6bEaCI54GvV/lquc
         qGg4UKom39Cdgiv+QXDHwpdJfVu4rvQ3R9+Vw3O4nNTeeBaYGHkrgytoDupFOQEFZGDC
         UXC5q0WSExzM9qSoPNO0iLem/d1E/IfAMOuwNTJvU7IB24OCHFgwt4+HDgh+fNFZcG54
         F2rg==
X-Gm-Message-State: AOAM530h9RRYwQvxVUP+St77mGMNYvnVidjSWohIUSEMw75GS+plWatV
        mHYnQLS5QH1JVmmFHq/CLB8h1Fs9RU/ZzoykahfVU80M3wrqGJW/ymvHq0PvbsEPWCzQLE5oaTk
        fdCmL2lOpe7lRAqXWbbRP4h9dC9ck
X-Received: by 2002:a17:907:628b:: with SMTP id nd11mr2634068ejc.114.1636624042160;
        Thu, 11 Nov 2021 01:47:22 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxwgJGs5QCPoY9JhAxHn4JnudzBNsH69YXFp0vFFrO9V81K73N3VoMBrKW+QGGXDhNN+aeH6A==
X-Received: by 2002:a17:907:628b:: with SMTP id nd11mr2634046ejc.114.1636624042014;
        Thu, 11 Nov 2021 01:47:22 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:1054:9d19:e0f0:8214? (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id gt18sm1018254ejc.88.2021.11.11.01.47.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Nov 2021 01:47:21 -0800 (PST)
Message-ID: <12650b8d-6f4b-bbf1-f570-d9476e3850bf@redhat.com>
Date:   Thu, 11 Nov 2021 10:47:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH] platform/mellanox: mlxreg-lc: fix error code in
 mlxreg_lc_create_static_devices()
Content-Language: en-US
To:     Dan Carpenter <dan.carpenter@oracle.com>,
        Vadim Pasternak <vadimp@nvidia.com>
Cc:     Mark Gross <markgross@kernel.org>,
        Michael Shych <michaelsh@nvidia.com>,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org
References: <20211110074346.GB5176@kili>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20211110074346.GB5176@kili>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hi,

On 11/10/21 08:43, Dan Carpenter wrote:
> This code should be using PTR_ERR() instead of IS_ERR().  And because
> it's using the wrong "dev->client" pointer, the IS_ERR() check will be
> false, meaning the function returns success.
> 
> Fixes: 62f9529b8d5c ("platform/mellanox: mlxreg-lc: Add initial support for Nvidia line card devices")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

I will add this fix to my tree once 5.16-rc1 is out and
I will include this fix in my first pdx86 fixes pull-req
for 5.16.

Regards,

Hans

> ---
>  drivers/platform/mellanox/mlxreg-lc.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/platform/mellanox/mlxreg-lc.c b/drivers/platform/mellanox/mlxreg-lc.c
> index 0b7f58feb701..c897a2f15840 100644
> --- a/drivers/platform/mellanox/mlxreg-lc.c
> +++ b/drivers/platform/mellanox/mlxreg-lc.c
> @@ -413,7 +413,7 @@ mlxreg_lc_create_static_devices(struct mlxreg_lc *mlxreg_lc, struct mlxreg_hotpl
>  				int size)
>  {
>  	struct mlxreg_hotplug_device *dev = devs;
> -	int i;
> +	int i, ret;
>  
>  	/* Create static I2C device feeding by auxiliary or main power. */
>  	for (i = 0; i < size; i++, dev++) {
> @@ -423,6 +423,7 @@ mlxreg_lc_create_static_devices(struct mlxreg_lc *mlxreg_lc, struct mlxreg_hotpl
>  				dev->brdinfo->type, dev->nr, dev->brdinfo->addr);
>  
>  			dev->adapter = NULL;
> +			ret = PTR_ERR(dev->client);
>  			goto fail_create_static_devices;
>  		}
>  	}
> @@ -435,7 +436,7 @@ mlxreg_lc_create_static_devices(struct mlxreg_lc *mlxreg_lc, struct mlxreg_hotpl
>  		i2c_unregister_device(dev->client);
>  		dev->client = NULL;
>  	}
> -	return IS_ERR(dev->client);
> +	return ret;
>  }
>  
>  static void
> 

