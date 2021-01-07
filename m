Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E9C172ED4ED
	for <lists+kernel-janitors@lfdr.de>; Thu,  7 Jan 2021 18:02:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728196AbhAGRBr (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Thu, 7 Jan 2021 12:01:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51834 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727650AbhAGRBq (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 7 Jan 2021 12:01:46 -0500
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7DE0EC0612F5
        for <kernel-janitors@vger.kernel.org>; Thu,  7 Jan 2021 09:01:06 -0800 (PST)
Received: by mail-wr1-x433.google.com with SMTP id d13so6285867wrc.13
        for <kernel-janitors@vger.kernel.org>; Thu, 07 Jan 2021 09:01:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Vttw+Zkl+9Ah7Xh5FObZhnPUhdIHiql1qR6Q3zLfcl8=;
        b=wjNejtZWix8AIq/WCJKlNl0O71DrWwUsS4GXR73oPvL1cGstP4euxFcPgOOzvfeEhw
         aLypN2b+UGPJAkpIrLbQzhNRBMeYBPGNIYHXZNbK2pGePIpRzZZlouuwvl/DBK/MQQZk
         jqZf90ubxY+9MBvyrB4rkguSWPBRt2E/gi8yGYOt99iDL6FvtJd7fqZL+EPShdiVoBYQ
         p9UDsGzu371tfablQV1D4XdRnSvWe0KuhIzUhNy2i4jN7jRDFKK7qG+dZW+Grt1jBPmD
         eT/gDwwVdwJcxvE5VM6tc3jaDJ5Dhw8eda7gaNmrT3387kIcv+F0vSdReo8y7bK1Ql77
         r+5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Vttw+Zkl+9Ah7Xh5FObZhnPUhdIHiql1qR6Q3zLfcl8=;
        b=DTtky7rG8Wes/+080zs4FSV/3kcdqIiGb1ZJ78NSu7f6ep6xii4epIwYHnvFfS7pQR
         XU9gqmjEMkYZ3TcVdqxFdrtB/PvHnf/BAZuPeDuEz7XmM59qm0CmoUA10xbBIunfC0CX
         TZVyEyPEP5WVnVVabBKNWHtI/zdWLpsQ9MvXpwNN9C+Y/dX7KJIDJdmECCeyWfpd4Y9T
         IhO+oF7VtwXXuIZ8YX00n6VYIpzYHJG7m/Mdo8ynLIlYJPbD6GA/nfO18ZTyHmWbVHFT
         T0jPFyOrU0Wmu3wM3BV9wgSi0uF8+wkq8f9bX7/EXE+6vaSntK3cFyo+L3gC0/UzeNfS
         4xyQ==
X-Gm-Message-State: AOAM530U0Ew2iYJZqPW5g7+XuAJFfDbl7epe74fXbKYgLajMJRdsRxnd
        HQXG2INMC/OcI/SOS00vSsn5jEhrphiAXQ==
X-Google-Smtp-Source: ABdhPJwqXrnz9hTfu/rPz6op+5RLzAXutbdfAGEVgyFO9eXWyv0MwrXKSeaXyIh/gSQjkFdcC3lNcw==
X-Received: by 2002:adf:c40e:: with SMTP id v14mr9810801wrf.163.1610038864835;
        Thu, 07 Jan 2021 09:01:04 -0800 (PST)
Received: from [192.168.0.41] (lns-bzn-59-82-252-152-224.adsl.proxad.net. [82.252.152.224])
        by smtp.googlemail.com with ESMTPSA id v20sm9740333wra.19.2021.01.07.09.01.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Jan 2021 09:01:04 -0800 (PST)
Subject: Re: [PATCH 2/3] powercap/drivers/dtpm: Fix some missing unlock bugs
To:     Dan Carpenter <dan.carpenter@oracle.com>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc:     Lukasz Luba <lukasz.luba@arm.com>, linux-pm@vger.kernel.org,
        kernel-janitors@vger.kernel.org
References: <X/V3pV//ui0rcxbs@mwanda>
From:   Daniel Lezcano <daniel.lezcano@linaro.org>
Message-ID: <8fe7e742-56dd-f4b9-e857-7e27b8b734cc@linaro.org>
Date:   Thu, 7 Jan 2021 18:01:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <X/V3pV//ui0rcxbs@mwanda>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On 06/01/2021 09:41, Dan Carpenter wrote:
> We need to unlock on these paths before returning.
> 
> Fixes: a20d0ef97abf ("powercap/drivers/dtpm: Add API for dynamic thermal power management")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Acked-by: Daniel Lezcano <daniel.lezcano@linaro.org>


> ---
>  drivers/powercap/dtpm.c | 17 ++++++++++++-----
>  1 file changed, 12 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/powercap/dtpm.c b/drivers/powercap/dtpm.c
> index d49df0569cd4..470a1182b868 100644
> --- a/drivers/powercap/dtpm.c
> +++ b/drivers/powercap/dtpm.c
> @@ -147,13 +147,17 @@ static void __dtpm_add_power(struct dtpm *dtpm)
>   */
>  int dtpm_update_power(struct dtpm *dtpm, u64 power_min, u64 power_max)
>  {
> +	int ret = 0;
> +
>  	mutex_lock(&dtpm_lock);
>  
>  	if (power_min == dtpm->power_min && power_max == dtpm->power_max)
> -		return 0;
> +		goto unlock;
>  
> -	if (power_max < power_min)
> -		return -EINVAL;
> +	if (power_max < power_min) {
> +		ret = -EINVAL;
> +		goto unlock;
> +	}
>  
>  	__dtpm_sub_power(dtpm);
>  
> @@ -164,9 +168,10 @@ int dtpm_update_power(struct dtpm *dtpm, u64 power_min, u64 power_max)
>  
>  	__dtpm_add_power(dtpm);
>  
> +unlock:
>  	mutex_unlock(&dtpm_lock);
>  
> -	return 0;
> +	return ret;
>  }
>  
>  /**
> @@ -187,8 +192,10 @@ int dtpm_release_zone(struct powercap_zone *pcz)
>  
>  	mutex_lock(&dtpm_lock);
>  
> -	if (!list_empty(&dtpm->children))
> +	if (!list_empty(&dtpm->children)) {
> +		mutex_unlock(&dtpm_lock);
>  		return -EBUSY;
> +	}
>  
>  	if (parent)
>  		list_del(&dtpm->sibling);
> 


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
