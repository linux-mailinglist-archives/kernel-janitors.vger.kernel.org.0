Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2568B155184
	for <lists+kernel-janitors@lfdr.de>; Fri,  7 Feb 2020 05:25:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727068AbgBGEZg (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Thu, 6 Feb 2020 23:25:36 -0500
Received: from mail-pg1-f195.google.com ([209.85.215.195]:41441 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726674AbgBGEZf (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 6 Feb 2020 23:25:35 -0500
Received: by mail-pg1-f195.google.com with SMTP id l3so441472pgi.8
        for <kernel-janitors@vger.kernel.org>; Thu, 06 Feb 2020 20:25:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=rNcYUtTsPqkrH6ZfJIfLrMnGelkyhmdQa1AyNh1VxbQ=;
        b=MiHRdw7uACrDHqHDakCZSDRYpDsUjXL2Kyi5hv8QZDyo+X5O+kUk1Hdo1wHTMo6vbz
         1tGmqV3qVQl3ihj17GfJ+D8Ju4eC4ne8z7BFTblczI6tnytqe47p9lNauJUKS2ICOcaD
         pHdMF64lFByvQ22Em+1oGqXNIymcFiusRbegDh4NhING/mqV6UFgD9AfpVCbY8eAi01R
         PMCQC/J+5oZUUsNCZZTfp5gxPMR5mViHS0ZhiUPPVAYdaEf2wRbPfCbqs2nmsrFDlu0F
         92iqNSU3ly9dX7mtu0L0WGVZjayn7VvxA178ryPFFxbvHZYlx7HzsQBBNYQApSCEH3zv
         oybA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=rNcYUtTsPqkrH6ZfJIfLrMnGelkyhmdQa1AyNh1VxbQ=;
        b=fmKr/d84TCzOtLs01jJtwga7CWQhrR3zN3ZaRF1EitxJEwpAgwyYvfJfGhV2TdKay+
         ZIwflnHrj6PM/mh/hTZWTkEAd/u7U1MECVYOUko6I8M+0c6kJqpSbzWFdlLXjvS6ilVF
         RBxsmMby/gzr5bjLjOgsNHzdLQrwqXX/mpnF2hfyebuLkjVfh3cGt5l95tT7e1wzl3mm
         RNdT1SSKsRLMF2HT1VQ6i9aKZXvrtIZO7eqXYpNlZcTU4M6muP6ialsMMl7uvzcT72lN
         f7Hs1uI/544jMGUFuMjPzv+ggx9Pq1rGl7o6kd6Wi4UDK9HfhHLg6lYYUDDDlXxEUoSM
         Fxiw==
X-Gm-Message-State: APjAAAVk5Hf9ZajrhXNTTy9iTmFK0e8SA3UK6aNo4gH/+3hUAeVbYsf6
        YHilTj8Ty8unWJ873T268gSE/GzJP3U=
X-Google-Smtp-Source: APXvYqwbj1LOAB7Q0rVogoZppMmiC9WAS8IonLQ3JSwpMPj6jXu3d4sUkvA6Ej4CYQbF8vsemAzkcg==
X-Received: by 2002:a65:6402:: with SMTP id a2mr7663930pgv.142.1581049535185;
        Thu, 06 Feb 2020 20:25:35 -0800 (PST)
Received: from localhost ([122.172.141.204])
        by smtp.gmail.com with ESMTPSA id p123sm952706pfg.84.2020.02.06.20.25.34
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 06 Feb 2020 20:25:34 -0800 (PST)
Date:   Fri, 7 Feb 2020 09:55:32 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Vaibhav Agarwal <vaibhav.sr@gmail.com>,
        Dinko Mironov <dmironov@mm-sol.com>,
        devel@driverdev.osuosl.org, Alex Elder <elder@kernel.org>,
        kernel-janitors@vger.kernel.org, Johan Hovold <johan@kernel.org>,
        greybus-dev@lists.linaro.org,
        Greg Kroah-Hartman <gregkh@google.com>
Subject: Re: [greybus-dev] [PATCH] staging: greybus: use after free in
 gb_audio_manager_remove_all()
Message-ID: <20200207042532.wwd6jh6cfuptr7tz@vireshk-i7>
References: <20200205123217.jreendkyxulqsool@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200205123217.jreendkyxulqsool@kili.mountain>
User-Agent: NeoMutt/20180716-391-311a52
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On 05-02-20, 15:32, Dan Carpenter wrote:
> When we call kobject_put() and it's the last reference to the kobject
> then it calls gb_audio_module_release() and frees module.  We dereference
> "module" on the next line which is a use after free.
> 
> Fixes: c77f85bbc91a ("greybus: audio: Fix incorrect counting of 'ida'")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  drivers/staging/greybus/audio_manager.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/greybus/audio_manager.c b/drivers/staging/greybus/audio_manager.c
> index 9b19ea9d3fa1..9a3f7c034ab4 100644
> --- a/drivers/staging/greybus/audio_manager.c
> +++ b/drivers/staging/greybus/audio_manager.c
> @@ -92,8 +92,8 @@ void gb_audio_manager_remove_all(void)
>  
>  	list_for_each_entry_safe(module, next, &modules_list, list) {
>  		list_del(&module->list);
> -		kobject_put(&module->kobj);
>  		ida_simple_remove(&module_id, module->id);
> +		kobject_put(&module->kobj);
>  	}
>  
>  	is_empty = list_empty(&modules_list);

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
