Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B3ACB2E0567
	for <lists+kernel-janitors@lfdr.de>; Tue, 22 Dec 2020 05:36:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725780AbgLVEfv (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Mon, 21 Dec 2020 23:35:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33178 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725931AbgLVEfv (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 21 Dec 2020 23:35:51 -0500
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com [IPv6:2607:f8b0:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04ACCC061793
        for <kernel-janitors@vger.kernel.org>; Mon, 21 Dec 2020 20:35:10 -0800 (PST)
Received: by mail-pg1-x52c.google.com with SMTP id n10so7588497pgl.10
        for <kernel-janitors@vger.kernel.org>; Mon, 21 Dec 2020 20:35:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=efVgO12y6qfjlIavBoObF8HNxu4Hvm/8sbVusrJEyQg=;
        b=gcGcsrRKLFZqUishLYUK2rrAojhE9KbDilt+wO3akI1bUTMp6W4g6QDuvluwKINvEL
         LPQJwcQesfB7tbcvglhfu/eDlPpLMgIABhch24FsZA3KmDR5YnK4Jf8Ij8kyMStXn0PD
         eWrEAmPy2T8neKZkvacTysW0dP1CPT0DnemUt9jwi+Nx4w2NaxhUEDnLXb1QS18HYoks
         r2JGrQ7jj61jt/hpzITPtrXoSmH3d5GRx/0w2CbDGyKlSWKXNYq53HXZCg8RcdvG2LID
         +lGBlkcfXuKgcYgzovKXbGfJNYLh782NpxjOHrljhj2ug57mZoDd8Nu++wsQhMiCD6G4
         yKWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=efVgO12y6qfjlIavBoObF8HNxu4Hvm/8sbVusrJEyQg=;
        b=BREAqxFL3AaWN55cKNUWJJLibDyLjjeV5zRCPvpsvEU5NZ0oKzVgEMPyOQfyy3/b25
         C5W5cpaCdGR71hFUzG5s9EK32kHaIziUdjPFdKji1hom8WbmuCgQ57QxDOLpVOo3Kt0O
         ++5G7yWa9u68BbM0zk6cRtUvBCwyKYcQUTlBe3hXk0pAh/RLgeP5vLHs8XzOdWcXl8b+
         xylIX8ZXVzVSfF2O7U8xPBMuAGJ4K8rX31Xto69Q493O6112pqs15yrbPKbVjPEEvaLk
         NA1iR0EO0u2ZYKc4oSTy8KG4eNGs00j/eQUK3dT4FVvUhAi4CLstpJE1BDeEO4O2wGYV
         LzYg==
X-Gm-Message-State: AOAM531jfT/Ps7JOnOMk9xRGRQHuvne/jSvzI0Vyh9wKXVH6sEZ0kN2c
        L52FvHGOt2Z+6xyY/2BpDzCOPQ==
X-Google-Smtp-Source: ABdhPJyIViesLe5L57QCib4Tc30kaHqp521NAFEgLLhIV79uAFs5gXWHG0AJbrltGyBakJ301c0CIQ==
X-Received: by 2002:a65:5b47:: with SMTP id y7mr16390380pgr.221.1608611710462;
        Mon, 21 Dec 2020 20:35:10 -0800 (PST)
Received: from localhost ([122.172.20.109])
        by smtp.gmail.com with ESMTPSA id 6sm18090487pfj.216.2020.12.21.20.35.09
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 21 Dec 2020 20:35:09 -0800 (PST)
Date:   Tue, 22 Dec 2020 10:05:05 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc:     mmayer@broadcom.com, bcm-kernel-feedback-list@broadcom.com,
        rjw@rjwysocki.net, f.fainelli@gmail.com, linux-pm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] cpufreq: brcmstb-avs-cpufreq: Fix some resource leaks in
 the error handling path of the probe function
Message-ID: <20201222043505.rq3cmajc3mxv3p2z@vireshk-i7>
References: <20201219101751.181783-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201219101751.181783-1-christophe.jaillet@wanadoo.fr>
User-Agent: NeoMutt/20180716-391-311a52
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On 19-12-20, 11:17, Christophe JAILLET wrote:
> If 'cpufreq_register_driver()' fails, we must release the resources
> allocated in 'brcm_avs_prepare_init()' as already done in the remove
> function.
> 
> To do that, introduce a new function 'brcm_avs_prepare_uninit()' in order
> to avoid code duplication. This also makes the code more readable (IMHO).
> 
> Fixes: de322e085995 ("cpufreq: brcmstb-avs-cpufreq: AVS CPUfreq driver for Broadcom STB SoCs")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
> I'm not sure that the existing error handling in the remove function is
> correct and/or needed.
> ---
>  drivers/cpufreq/brcmstb-avs-cpufreq.c | 25 ++++++++++++++++++++-----
>  1 file changed, 20 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/cpufreq/brcmstb-avs-cpufreq.c b/drivers/cpufreq/brcmstb-avs-cpufreq.c
> index 3e31e5d28b79..750ca7cfccb0 100644
> --- a/drivers/cpufreq/brcmstb-avs-cpufreq.c
> +++ b/drivers/cpufreq/brcmstb-avs-cpufreq.c
> @@ -597,6 +597,16 @@ static int brcm_avs_prepare_init(struct platform_device *pdev)
>  	return ret;
>  }
>  
> +static void brcm_avs_prepare_uninit(struct platform_device *pdev)
> +{
> +	struct private_data *priv;
> +
> +	priv = platform_get_drvdata(pdev);
> +
> +	iounmap(priv->avs_intr_base);
> +	iounmap(priv->base);
> +}
> +
>  static int brcm_avs_cpufreq_init(struct cpufreq_policy *policy)
>  {
>  	struct cpufreq_frequency_table *freq_table;
> @@ -732,21 +742,26 @@ static int brcm_avs_cpufreq_probe(struct platform_device *pdev)
>  
>  	brcm_avs_driver.driver_data = pdev;
>  
> -	return cpufreq_register_driver(&brcm_avs_driver);
> +	ret = cpufreq_register_driver(&brcm_avs_driver);
> +	if (ret)
> +		goto err_uninit;
> +
> +	return 0;
> +
> +err_uninit:
> +	brcm_avs_prepare_uninit(pdev);
> +	return ret;

Maybe rewrite as:

	ret = cpufreq_register_driver(&brcm_avs_driver);
	if (ret)
                brcm_avs_prepare_uninit(pdev);
	return ret;

>  }
>  
>  static int brcm_avs_cpufreq_remove(struct platform_device *pdev)
>  {
> -	struct private_data *priv;
>  	int ret;
>  
>  	ret = cpufreq_unregister_driver(&brcm_avs_driver);
>  	if (ret)
>  		return ret;

Instead of returning here, it can be just WARN_ON(ret); and then go on and free
the resources and this needs to be done in a separate patch.

>  
> -	priv = platform_get_drvdata(pdev);
> -	iounmap(priv->base);
> -	iounmap(priv->avs_intr_base);
> +	brcm_avs_prepare_uninit(pdev);
>  
>  	return 0;
>  }

-- 
viresh
