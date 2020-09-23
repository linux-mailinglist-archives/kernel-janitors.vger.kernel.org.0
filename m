Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5D9EC275DAC
	for <lists+kernel-janitors@lfdr.de>; Wed, 23 Sep 2020 18:41:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726419AbgIWQlA (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Wed, 23 Sep 2020 12:41:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53676 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726381AbgIWQlA (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 23 Sep 2020 12:41:00 -0400
Received: from mail-oi1-x244.google.com (mail-oi1-x244.google.com [IPv6:2607:f8b0:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 19785C0613D1;
        Wed, 23 Sep 2020 09:41:00 -0700 (PDT)
Received: by mail-oi1-x244.google.com with SMTP id 26so524231ois.5;
        Wed, 23 Sep 2020 09:41:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=B3u4Sv9fEvV2mDMJBRoRA0Mqt83xc9oLBYBDXLutCqA=;
        b=aXZO9+R52lSmRz+kAx6duX5qUqhmalAANYOPPuRbO+82+MLihyZ17vCkmm4G9uDAfh
         +QCUT1svFJBO05EWxxXoWh6KT/cIudG4YNljP4ecdfIvsuuL48wzQ22Pw7YsmZ4tPq29
         Nk3IF3/9F5ZTklfVb2XVeKiuIviGrhpIZThZhCMwj98B2Uh0oHxsp3splKq2phDKZ+Vk
         TSjDidQVXpm5jP22U50DGOL6LU1wSDH8OtiKb+Qwu3sW+yoSx0aReIGUBOpGYR0I5UMS
         M2vnUzd3jPMBhPK1dcBSkNDXFTg4nUBuhdn/2pa6XU0seHG+RxQvi5Cez9otwOMP8GyK
         3naw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=B3u4Sv9fEvV2mDMJBRoRA0Mqt83xc9oLBYBDXLutCqA=;
        b=eBtDTEZm0LLDjBHG+OaC5GX6CPj8ilJWZRzTafHUs47GAxKfMIrBF22EXBlcSRAo2u
         JbbioCr+QJ2jWFQWxIA0YqtCdAKMdxmTc99UVpmOZHxgeH4Er+pXi0eJsbzF4IkxLK3w
         muOIx955suOWXNsJJg5roV0ruwNRfIklYf/lY2GX1nwvvfCo2ft7V+Dvg3U+EJrGJe+N
         ZGY8OnFGHbi42GP6TfcoiviYzD0c4sAx5HvCEy6sy4xOd5PZt+wTQx1JjMhWXAm4npTq
         8AZw3t/IDCH3jOW4tAnXgDW4ILTgWW9xyrE/06pzyWDei5LqFxEUgaOKQDF5eMeOc88b
         WetA==
X-Gm-Message-State: AOAM533peQYNmT0abNKcjs9GPqJWbRMOxgtnOJ4QERrjtQWd1exBl6GQ
        TZHEYDy1B300zAlRpRWKz1I=
X-Google-Smtp-Source: ABdhPJyVjaLp6vfOSbDa8g143oKkSXjsNAGELPHHFf8z8mqMkQ9nU2r59Sg5Zt+9IbpSWMpr7+xxmQ==
X-Received: by 2002:aca:1806:: with SMTP id h6mr244909oih.88.1600879259440;
        Wed, 23 Sep 2020 09:40:59 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id a5sm125217oti.30.2020.09.23.09.40.58
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 23 Sep 2020 09:40:59 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Wed, 23 Sep 2020 09:40:57 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Jean Delvare <jdelvare@suse.com>,
        "Dr. David Alan Gilbert" <linux@treblig.org>,
        linux-hwmon@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] hwmon: (w83627ehf) Fix a resource leak in probe
Message-ID: <20200923164057.GA170757@roeck-us.net>
References: <20200921125212.GA1128194@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200921125212.GA1128194@mwanda>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Mon, Sep 21, 2020 at 03:52:12PM +0300, Dan Carpenter wrote:
> Smatch has a new check for resource leaks which found a bug in probe:
> 
>     drivers/hwmon/w83627ehf.c:2417 w83627ehf_probe()
>     warn: 'res->start' not released on lines: 2412.
> 
> We need to clean up if devm_hwmon_device_register_with_info() fails.
> 
> Fixes: 266cd5835947 ("hwmon: (w83627ehf) convert to with_info interface")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> Reviewed-by: Dr. David Alan Gilbert <linux@treblig.org>

Applied.

Thanks,
Guenter

> ---
>  drivers/hwmon/w83627ehf.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/hwmon/w83627ehf.c b/drivers/hwmon/w83627ehf.c
> index 5a5120121e50..3964ceab2817 100644
> --- a/drivers/hwmon/w83627ehf.c
> +++ b/drivers/hwmon/w83627ehf.c
> @@ -1951,8 +1951,12 @@ static int w83627ehf_probe(struct platform_device *pdev)
>  							 data,
>  							 &w83627ehf_chip_info,
>  							 w83627ehf_groups);
> +	if (IS_ERR(hwmon_dev)) {
> +		err = PTR_ERR(hwmon_dev);
> +		goto exit_release;
> +	}
>  
> -	return PTR_ERR_OR_ZERO(hwmon_dev);
> +	return 0;
>  
>  exit_release:
>  	release_region(res->start, IOREGION_LENGTH);
