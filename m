Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5D23F20DED7
	for <lists+kernel-janitors@lfdr.de>; Mon, 29 Jun 2020 23:53:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732531AbgF2U3s (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Mon, 29 Jun 2020 16:29:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55898 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389044AbgF2U33 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 29 Jun 2020 16:29:29 -0400
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3404DC03E979
        for <kernel-janitors@vger.kernel.org>; Mon, 29 Jun 2020 13:29:29 -0700 (PDT)
Received: by mail-pl1-x642.google.com with SMTP id k1so7546858pls.2
        for <kernel-janitors@vger.kernel.org>; Mon, 29 Jun 2020 13:29:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=u03RiaGtlqzYCD4RuvVKRMMObH9Mbbvja6DS7CirGAE=;
        b=PpQ1P+ha/DYO3jk489n3VBpVZbntveZSxgs/hRGIO6pnEGbH52FyTZ7HjQSx8XZAfw
         XrUjaFKIZJHoimmQ629sshjfkTbMPQBjQX+3d+XPcL6TgaVXWRvVcc3e4Pi7HUhLStaE
         EJ5e0Tfuhs/ADOSQ9dwzsBZN0UIfmT2OiDdMZhD6oLeigELT9CWRToldqH94VxjVy3cE
         HNfykk6NY/xa8HO0zyQB1dHKegOAH8YOnvhgRgQ3e8PLQJceXwIU2TVkhXfR+8+6KVTD
         QbmKLPX2PI9MHwqVbsgG//nxJywoxUU7SyAXv53FUpYz7fc7QX5bM17ZGRTYZAGNutM/
         l4og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=u03RiaGtlqzYCD4RuvVKRMMObH9Mbbvja6DS7CirGAE=;
        b=Bqp6W1A+dx+yXF4sfjnVRmC/5l7LWmlX9Z/0G9gpqq8Dwj6040Q2uETCvPYPqnQPtE
         ug/OeYQwhqjn//onLLCgKU6GoMor1bqWbcL4i0Sbj/lKJ+WvJWuW/NFYZwV/AleIVpCN
         6TI/Si+t82bGU7+tmLoC/OURBYpe7e22xaQ/c//e8GrqhdYg9uiVs5Of6hspByPbSiSW
         yiRXvWLy9nHXDLWz7jcXtQuOsyH9/3NLhQ43NWoG/VqgNBVJxaDV/nHnBtqe1znoJzNZ
         gabmc8EwisE0np1yAEYY/uGQUCDEOpj6WXaeVLiT4topeDutpsPQJZgT5Eb447RQ3flU
         LsgA==
X-Gm-Message-State: AOAM533+NpD7GHKO4nu881tWmVvZQcSOE2RzPtDI5tSAifJu/CAQFVYk
        fj2+IZT5FhpblMLgA1VrntPtHw==
X-Google-Smtp-Source: ABdhPJyaDP2H6/oFfrrkpIQLa1e0rC9OCatRY+xr96oYLf9cmMyb+D8UkvrIOyu6IecgCJSqb2JbrQ==
X-Received: by 2002:a17:90b:94f:: with SMTP id dw15mr6834764pjb.209.1593462568590;
        Mon, 29 Jun 2020 13:29:28 -0700 (PDT)
Received: from xps15 (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id a17sm333021pjh.31.2020.06.29.13.29.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2020 13:29:28 -0700 (PDT)
Date:   Mon, 29 Jun 2020 14:29:26 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Mike Leach <mike.leach@linaro.org>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH v2] coresight: cti: Fix error handling in probe
Message-ID: <20200629202926.GA3732655@xps15>
References: <CAJ9a7Vjn-1gvOY0h5eiffXgqiNu4rz=Z18hgV33WExGnLEV-nA@mail.gmail.com>
 <20200617171549.GA9686@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200617171549.GA9686@kadam>
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Wed, Jun 17, 2020 at 08:15:50PM +0300, Dan Carpenter wrote:
> There were a couple problems with error handling in the probe function:
> 1)  If the "drvdata" allocation failed then it lead to a NULL
>     dereference.
> 2)  On several error paths we decremented "nr_cti_cpu" before it was
>     incremented which lead to a reference counting bug.
> 
> There were also some parts of the error handling which were not bugs but
> were messy.  The error handling was confusing to read.  It printed some
> unnecessary error messages.
> 
> The simplest way to fix these problems was to create a cti_pm_setup()
> function that did all the power management setup in one go.  That way
> when we call cti_pm_release() we don't have to deal with the
> complications of a partially configured power management config.
> 
> I reversed the "if (drvdata->ctidev.cpu >= 0)" condition in cti_pm_release()
> so that it mirros the new cti_pm_setup() function.
> 
> Fixes: 6a0953ce7de9 ("coresight: cti: Add CPU idle pm notifer to CTI devices")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> v2: I accidentally introduced a bug in cti_pm_release() in v1.

Thanks for the cleanup.  I'll send this to Greg for a 5.8 fixup.

Regards,
Mathieu

> 
>  drivers/hwtracing/coresight/coresight-cti.c | 96 ++++++++++++---------
>  1 file changed, 54 insertions(+), 42 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-cti.c b/drivers/hwtracing/coresight/coresight-cti.c
> index 40387d58c8e7..d2da5bf9f552 100644
> --- a/drivers/hwtracing/coresight/coresight-cti.c
> +++ b/drivers/hwtracing/coresight/coresight-cti.c
> @@ -747,17 +747,50 @@ static int cti_dying_cpu(unsigned int cpu)
>  	return 0;
>  }
>  
> +static int cti_pm_setup(struct cti_drvdata *drvdata)
> +{
> +	int ret;
> +
> +	if (drvdata->ctidev.cpu == -1)
> +		return 0;
> +
> +	if (nr_cti_cpu)
> +		goto done;
> +
> +	cpus_read_lock();
> +	ret = cpuhp_setup_state_nocalls_cpuslocked(
> +			CPUHP_AP_ARM_CORESIGHT_CTI_STARTING,
> +			"arm/coresight_cti:starting",
> +			cti_starting_cpu, cti_dying_cpu);
> +	if (ret) {
> +		cpus_read_unlock();
> +		return ret;
> +	}
> +
> +	ret = cpu_pm_register_notifier(&cti_cpu_pm_nb);
> +	cpus_read_unlock();
> +	if (ret) {
> +		cpuhp_remove_state_nocalls(CPUHP_AP_ARM_CORESIGHT_CTI_STARTING);
> +		return ret;
> +	}
> +
> +done:
> +	nr_cti_cpu++;
> +	cti_cpu_drvdata[drvdata->ctidev.cpu] = drvdata;
> +
> +	return 0;
> +}
> +
>  /* release PM registrations */
>  static void cti_pm_release(struct cti_drvdata *drvdata)
>  {
> -	if (drvdata->ctidev.cpu >= 0) {
> -		if (--nr_cti_cpu == 0) {
> -			cpu_pm_unregister_notifier(&cti_cpu_pm_nb);
> +	if (drvdata->ctidev.cpu == -1)
> +		return;
>  
> -			cpuhp_remove_state_nocalls(
> -				CPUHP_AP_ARM_CORESIGHT_CTI_STARTING);
> -		}
> -		cti_cpu_drvdata[drvdata->ctidev.cpu] = NULL;
> +	cti_cpu_drvdata[drvdata->ctidev.cpu] = NULL;
> +	if (--nr_cti_cpu == 0) {
> +		cpu_pm_unregister_notifier(&cti_cpu_pm_nb);
> +		cpuhp_remove_state_nocalls(CPUHP_AP_ARM_CORESIGHT_CTI_STARTING);
>  	}
>  }
>  
> @@ -823,19 +856,14 @@ static int cti_probe(struct amba_device *adev, const struct amba_id *id)
>  
>  	/* driver data*/
>  	drvdata = devm_kzalloc(dev, sizeof(*drvdata), GFP_KERNEL);
> -	if (!drvdata) {
> -		ret = -ENOMEM;
> -		dev_info(dev, "%s, mem err\n", __func__);
> -		goto err_out;
> -	}
> +	if (!drvdata)
> +		return -ENOMEM;
>  
>  	/* Validity for the resource is already checked by the AMBA core */
>  	base = devm_ioremap_resource(dev, res);
> -	if (IS_ERR(base)) {
> -		ret = PTR_ERR(base);
> -		dev_err(dev, "%s, remap err\n", __func__);
> -		goto err_out;
> -	}
> +	if (IS_ERR(base))
> +		return PTR_ERR(base);
> +
>  	drvdata->base = base;
>  
>  	dev_set_drvdata(dev, drvdata);
> @@ -854,8 +882,7 @@ static int cti_probe(struct amba_device *adev, const struct amba_id *id)
>  	pdata = coresight_cti_get_platform_data(dev);
>  	if (IS_ERR(pdata)) {
>  		dev_err(dev, "coresight_cti_get_platform_data err\n");
> -		ret =  PTR_ERR(pdata);
> -		goto err_out;
> +		return  PTR_ERR(pdata);
>  	}
>  
>  	/* default to powered - could change on PM notifications */
> @@ -867,35 +894,20 @@ static int cti_probe(struct amba_device *adev, const struct amba_id *id)
>  					       drvdata->ctidev.cpu);
>  	else
>  		cti_desc.name = coresight_alloc_device_name(&cti_sys_devs, dev);
> -	if (!cti_desc.name) {
> -		ret = -ENOMEM;
> -		goto err_out;
> -	}
> +	if (!cti_desc.name)
> +		return -ENOMEM;
>  
>  	/* setup CPU power management handling for CPU bound CTI devices. */
> -	if (drvdata->ctidev.cpu >= 0) {
> -		cti_cpu_drvdata[drvdata->ctidev.cpu] = drvdata;
> -		if (!nr_cti_cpu++) {
> -			cpus_read_lock();
> -			ret = cpuhp_setup_state_nocalls_cpuslocked(
> -				CPUHP_AP_ARM_CORESIGHT_CTI_STARTING,
> -				"arm/coresight_cti:starting",
> -				cti_starting_cpu, cti_dying_cpu);
> -
> -			if (!ret)
> -				ret = cpu_pm_register_notifier(&cti_cpu_pm_nb);
> -			cpus_read_unlock();
> -			if (ret)
> -				goto err_out;
> -		}
> -	}
> +	ret = cti_pm_setup(drvdata);
> +	if (ret)
> +		return ret;
>  
>  	/* create dynamic attributes for connections */
>  	ret = cti_create_cons_sysfs(dev, drvdata);
>  	if (ret) {
>  		dev_err(dev, "%s: create dynamic sysfs entries failed\n",
>  			cti_desc.name);
> -		goto err_out;
> +		goto pm_release;
>  	}
>  
>  	/* set up coresight component description */
> @@ -908,7 +920,7 @@ static int cti_probe(struct amba_device *adev, const struct amba_id *id)
>  	drvdata->csdev = coresight_register(&cti_desc);
>  	if (IS_ERR(drvdata->csdev)) {
>  		ret = PTR_ERR(drvdata->csdev);
> -		goto err_out;
> +		goto pm_release;
>  	}
>  
>  	/* add to list of CTI devices */
> @@ -927,7 +939,7 @@ static int cti_probe(struct amba_device *adev, const struct amba_id *id)
>  	dev_info(&drvdata->csdev->dev, "CTI initialized\n");
>  	return 0;
>  
> -err_out:
> +pm_release:
>  	cti_pm_release(drvdata);
>  	return ret;
>  }
> -- 
> 2.27.0
