Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 64B64307416
	for <lists+kernel-janitors@lfdr.de>; Thu, 28 Jan 2021 11:51:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231422AbhA1Ktw (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Thu, 28 Jan 2021 05:49:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52258 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231154AbhA1Ktn (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 28 Jan 2021 05:49:43 -0500
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 77322C0613D6
        for <kernel-janitors@vger.kernel.org>; Thu, 28 Jan 2021 02:49:03 -0800 (PST)
Received: by mail-wr1-x42e.google.com with SMTP id z6so4844657wrq.10
        for <kernel-janitors@vger.kernel.org>; Thu, 28 Jan 2021 02:49:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=to:cc:references:from:subject:message-id:date:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=FiLg8koZzFFIIjcPeegfAacRaJIBA7V42bfPp42lOV8=;
        b=sm+wd3C8tunflXHyxlaQRjfer+D7EeWBR7dOtqLatBkedelPvSMdK89rZVUTbJ4vCQ
         u7IYHIr4xnQel8ULjvNl0yjSpUURbhaqo88Ip2fUKMZoFkd3ryyECcCTP2kf2Z146vVB
         Pmc0vpK+lZsAAe+/a94WSrdygKRlxLU9vBHOc6WrvLck3dvjSUoEUjXzebpexN15bF9k
         jM+P8kcl5+rRUpsizPVfYZOunen0CwTGjtG8vprE50WHsVsjVNGdQYS2/8HhyOzRlw7C
         iPa1zD86w80Ho9H/jGyirHFxodc+XPuOh8Q2OUDQwI3nKa8mR74SHy4Vuk/PA9iRJBez
         C0Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:cc:references:from:subject:message-id:date
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=FiLg8koZzFFIIjcPeegfAacRaJIBA7V42bfPp42lOV8=;
        b=GSWeTNHx/PEKJ2BZR+ul4sXrxdE594CM1TK56z/QTwVU54BdkpLdv5hBUm0Dl7J6w/
         Nqa+q+4MgrOtyRMajZIhifazYKJ9PF0qXI167/24yvo/++v/moLTtTLBlvRf6GIYQvI8
         X5fPam+ZTx4iCXwYq40BvXJ2/MYsRoHffFCrtZuRfQSt6erstIery3plHm7pDAtImsaq
         8DLYG/AlkrvYD7f9Ao/TW7myZ7Vss7x2fbyJS7ZVv6jXTpB8+lsPKdGY9doXO/qY7dgE
         62UqUWnQzYQaZL5UHA/fBS3CPPbw9ogLHXBk71BcV2VSEv9lZP4mOGICu41548h0Q98F
         51vA==
X-Gm-Message-State: AOAM532IEsVCqOcJjcFvZ8oClpfeHm+Edq/gx7LN0zaEPutDYk4K9EXs
        RV/nFoOMT28ZLcF3/4ZykCR2vFkgxtgmRA==
X-Google-Smtp-Source: ABdhPJyFCP6jRG7uwA6TDz/h9WJOEs9xc4fD/ffZsngV7ExqzXZqyPkNyKjeEFDrQmQZX6RW5QSwrA==
X-Received: by 2002:adf:f6c4:: with SMTP id y4mr15193598wrp.127.1611830942202;
        Thu, 28 Jan 2021 02:49:02 -0800 (PST)
Received: from [10.44.66.8] ([212.45.67.2])
        by smtp.googlemail.com with ESMTPSA id u10sm5334118wmj.40.2021.01.28.02.49.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Jan 2021 02:49:01 -0800 (PST)
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        stanimir.varbanov@linaro.org, agross@kernel.org,
        bjorn.andersson@linaro.org, mchehab@kernel.org
Cc:     linux-media@vger.kernel.org, linux-arm-msm@lists.infradead.org,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
References: <20210127201732.743938-1-christophe.jaillet@wanadoo.fr>
From:   Georgi Djakov <georgi.djakov@linaro.org>
Subject: Re: [PATCH] media: venus: core: Fix some resource leaks in the error
 path of 'venus_probe()'
Message-ID: <309678ef-c3b9-0269-0715-05a469c04345@linaro.org>
Date:   Thu, 28 Jan 2021 12:49:00 +0200
MIME-Version: 1.0
In-Reply-To: <20210127201732.743938-1-christophe.jaillet@wanadoo.fr>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hi Christophe,

Thanks for the fix!

On 1/27/21 22:17, Christophe JAILLET wrote:
> If an error occurs after a successful 'of_icc_get()' call, it must be
> undone by a corresponding 'icc_put()' call.

This works, but why not switch to devm_of_icc_get() instead?

Thanks,
Georgi

> 
> Add it in the error handling path of the probe function as already done in
> the remove function.
> 
> Fixes: 32f0a6ddc8c9 ("media: venus: Use on-chip interconnect API")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
>   drivers/media/platform/qcom/venus/core.c | 31 +++++++++++++++++-------
>   1 file changed, 22 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
> index 0bde19edac86..8fd5da941067 100644
> --- a/drivers/media/platform/qcom/venus/core.c
> +++ b/drivers/media/platform/qcom/venus/core.c
> @@ -200,27 +200,35 @@ static int venus_probe(struct platform_device *pdev)
>   		return PTR_ERR(core->video_path);
>   
>   	core->cpucfg_path = of_icc_get(dev, "cpu-cfg");
> -	if (IS_ERR(core->cpucfg_path))
> -		return PTR_ERR(core->cpucfg_path);
> +	if (IS_ERR(core->cpucfg_path)) {
> +		ret = PTR_ERR(core->cpucfg_path);
> +		goto err_video_path_put;
> +	}
>   
>   	core->irq = platform_get_irq(pdev, 0);
> -	if (core->irq < 0)
> -		return core->irq;
> +	if (core->irq < 0) {
> +		ret = core->irq;
> +		goto err_cpucfg_path_put;
> +	}
>   
>   	core->res = of_device_get_match_data(dev);
> -	if (!core->res)
> -		return -ENODEV;
> +	if (!core->res) {
> +		ret = -ENODEV;
> +		goto err_cpucfg_path_put;
> +	}
>   
>   	mutex_init(&core->pm_lock);
>   
>   	core->pm_ops = venus_pm_get(core->res->hfi_version);
> -	if (!core->pm_ops)
> -		return -ENODEV;
> +	if (!core->pm_ops) {
> +		ret = -ENODEV;
> +		goto err_cpucfg_path_put;
> +	}
>   
>   	if (core->pm_ops->core_get) {
>   		ret = core->pm_ops->core_get(dev);
>   		if (ret)
> -			return ret;
> +			goto err_cpucfg_path_put;
>   	}
>   
>   	ret = dma_set_mask_and_coherent(dev, core->res->dma_mask);
> @@ -305,6 +313,11 @@ static int venus_probe(struct platform_device *pdev)
>   err_core_put:
>   	if (core->pm_ops->core_put)
>   		core->pm_ops->core_put(dev);
> +err_cpucfg_path_put:
> +	icc_put(core->cpucfg_path);
> +err_video_path_put:
> +	icc_put(core->video_path);
> +
>   	return ret;
>   }
>   
> 
