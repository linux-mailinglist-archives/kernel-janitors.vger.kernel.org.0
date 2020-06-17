Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EF8251FCB41
	for <lists+kernel-janitors@lfdr.de>; Wed, 17 Jun 2020 12:49:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726329AbgFQKt2 (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Wed, 17 Jun 2020 06:49:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53108 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725554AbgFQKt0 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 17 Jun 2020 06:49:26 -0400
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com [IPv6:2a00:1450:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 68A9DC06174E
        for <kernel-janitors@vger.kernel.org>; Wed, 17 Jun 2020 03:49:26 -0700 (PDT)
Received: by mail-ej1-x642.google.com with SMTP id k11so1780238ejr.9
        for <kernel-janitors@vger.kernel.org>; Wed, 17 Jun 2020 03:49:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=c0YiZR/0JogxadNuaaf1uQ0iU9Zfr56Svwi+PMNymt4=;
        b=K1KPVfsxzHMmy9fFx5TCa+VwhEgU/e8ZBg2F3UkpgXxdN5XZqlTjHnmP38cJpaM0oY
         W/XxM/SF1mHgF1ecLbATLqlovmJ8QclxKXduTR7uKbSGd5qEXkthT9/KKJgBCpaSAi3l
         ppGRHB2k7Cfn/C65Urk2ph0mzzE6zxisuUsVD1HHrfO7/+4q4Do1plJ/3AKshuwxysMx
         LCwik5506H0V9e4rlgKqdTVXuPQd7EmwoXMrADuXRrFLnYYhKA6EkWC8+f1sYSGgb6TH
         RdO0Vu27zk8c0bhS9RzaaOQRhYHwwd5A8B+ZQSDn9s66b9bjlwEehWDTkbtGOIpHNMYC
         Sj1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=c0YiZR/0JogxadNuaaf1uQ0iU9Zfr56Svwi+PMNymt4=;
        b=RIR1Gzod3Y4SJ2LETOu9p/p6pN+3YOxXl6q97NV0J7jISSKLCHxvaRd9H1SPfVhBqb
         2u8/gkNGDXfoTqlCTcJpKPpXsxwwuDI26CDNxB/Z+5dQeVxxt5uoiZ2wSKxHUhUd1xFy
         4HQ+COwyDO6TwZIrWOkyGO+BQxFgdmK4MC84OazSn8Jri51bPEghqjIF6UAY+OhTaEKF
         /5ePwDZ2jc9yRkLYUMExnAePvQcm7rQ95y73EaAQK3czOuKCbhuPC0Ca5rL14ebtJrR9
         //YXlWCQCpebjaA09V9fEQaLXcvpS5Z0CXJBYC3iUO3xYL6SOGic9ZG81q89gtV98UsS
         rIrA==
X-Gm-Message-State: AOAM532LzmYvVUUwdEKidQta8EQBfWeR1VZ9uRJgfKRiPGM42bYX3jJO
        XHdmEx8mopJ/gssbCv+zKBa0CEz8O1NCwTkPLv3Htg==
X-Google-Smtp-Source: ABdhPJxDwEr5BsQAWQrAu//fxP1TYSqxwr9HgBkoD24SU35NquqXv8kuCkH1hQYja/PGg7/nkg+18AREK64cWzXXCQY=
X-Received: by 2002:a17:907:9484:: with SMTP id dm4mr7298323ejc.56.1592390964917;
 Wed, 17 Jun 2020 03:49:24 -0700 (PDT)
MIME-Version: 1.0
References: <20200612121047.GF4282@kadam> <20200612121133.GA1139533@mwanda>
In-Reply-To: <20200612121133.GA1139533@mwanda>
From:   Mike Leach <mike.leach@linaro.org>
Date:   Wed, 17 Jun 2020 11:49:14 +0100
Message-ID: <CAJ9a7Vjn-1gvOY0h5eiffXgqiNu4rz=Z18hgV33WExGnLEV-nA@mail.gmail.com>
Subject: Re: [PATCH] coresight: cti: Fix error handling in probe
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Mathieu Poirier <mathieu.poirier@linaro.org>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hi Dan,

Thanks for looking at this. I agree with the patch, other than the one
change below.
I have compiled and run on my DB410 system, against 5.8-rc1.

On Fri, 12 Jun 2020 at 14:46, Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
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
> Please note!!!  I cannot compile this patch.  Mike can you review it?
>
>  drivers/hwtracing/coresight/coresight-cti.c | 96 ++++++++++++---------
>  1 file changed, 54 insertions(+), 42 deletions(-)
>
> diff --git a/drivers/hwtracing/coresight/coresight-cti.c b/drivers/hwtracing/coresight/coresight-cti.c
> index 40387d58c8e7..d2da5bf9f552 100644
> --- a/drivers/hwtracing/coresight/coresight-cti.c
> +++ b/drivers/hwtracing/coresight/coresight-cti.c
> @@ -747,17 +747,50 @@ static int cti_dying_cpu(unsigned int cpu)
>         return 0;
>  }
>
> +static int cti_pm_setup(struct cti_drvdata *drvdata)
> +{
> +       int ret;
> +
> +       if (drvdata->ctidev.cpu == -1)
> +               return 0;
> +
> +       if (nr_cti_cpu)
> +               goto done;
> +
> +       cpus_read_lock();
> +       ret = cpuhp_setup_state_nocalls_cpuslocked(
> +                       CPUHP_AP_ARM_CORESIGHT_CTI_STARTING,
> +                       "arm/coresight_cti:starting",
> +                       cti_starting_cpu, cti_dying_cpu);
> +       if (ret) {
> +               cpus_read_unlock();
> +               return ret;
> +       }
> +
> +       ret = cpu_pm_register_notifier(&cti_cpu_pm_nb);
> +       cpus_read_unlock();
> +       if (ret) {
> +               cpuhp_remove_state_nocalls(CPUHP_AP_ARM_CORESIGHT_CTI_STARTING);
> +               return ret;
> +       }
> +
> +done:
> +       nr_cti_cpu++;
> +       cti_cpu_drvdata[drvdata->ctidev.cpu] = drvdata;
> +
> +       return 0;
> +}
> +
>  /* release PM registrations */
>  static void cti_pm_release(struct cti_drvdata *drvdata)
>  {
> -       if (drvdata->ctidev.cpu >= 0) {
> -               if (--nr_cti_cpu == 0) {
> -                       cpu_pm_unregister_notifier(&cti_cpu_pm_nb);
> +       if (drvdata->ctidev.cpu == -1)
> +               return;
>
> -                       cpuhp_remove_state_nocalls(
> -                               CPUHP_AP_ARM_CORESIGHT_CTI_STARTING);
> -               }
> -               cti_cpu_drvdata[drvdata->ctidev.cpu] = NULL;
> +       cti_cpu_drvdata[drvdata->ctidev.cpu] = drvdata;

This should remain as  cti_cpu_drvdata[drvdata->ctidev.cpu] = NULL;
here. We are reversing the assignment in cti_pm_setup().

> +       if (--nr_cti_cpu == 0) {
> +               cpu_pm_unregister_notifier(&cti_cpu_pm_nb);
> +               cpuhp_remove_state_nocalls(CPUHP_AP_ARM_CORESIGHT_CTI_STARTING);
>         }
>  }
>
> @@ -823,19 +856,14 @@ static int cti_probe(struct amba_device *adev, const struct amba_id *id)
>
>         /* driver data*/
>         drvdata = devm_kzalloc(dev, sizeof(*drvdata), GFP_KERNEL);
> -       if (!drvdata) {
> -               ret = -ENOMEM;
> -               dev_info(dev, "%s, mem err\n", __func__);
> -               goto err_out;
> -       }
> +       if (!drvdata)
> +               return -ENOMEM;
>
>         /* Validity for the resource is already checked by the AMBA core */
>         base = devm_ioremap_resource(dev, res);
> -       if (IS_ERR(base)) {
> -               ret = PTR_ERR(base);
> -               dev_err(dev, "%s, remap err\n", __func__);
> -               goto err_out;
> -       }
> +       if (IS_ERR(base))
> +               return PTR_ERR(base);
> +
>         drvdata->base = base;
>
>         dev_set_drvdata(dev, drvdata);
> @@ -854,8 +882,7 @@ static int cti_probe(struct amba_device *adev, const struct amba_id *id)
>         pdata = coresight_cti_get_platform_data(dev);
>         if (IS_ERR(pdata)) {
>                 dev_err(dev, "coresight_cti_get_platform_data err\n");
> -               ret =  PTR_ERR(pdata);
> -               goto err_out;
> +               return  PTR_ERR(pdata);
>         }
>
>         /* default to powered - could change on PM notifications */
> @@ -867,35 +894,20 @@ static int cti_probe(struct amba_device *adev, const struct amba_id *id)
>                                                drvdata->ctidev.cpu);
>         else
>                 cti_desc.name = coresight_alloc_device_name(&cti_sys_devs, dev);
> -       if (!cti_desc.name) {
> -               ret = -ENOMEM;
> -               goto err_out;
> -       }
> +       if (!cti_desc.name)
> +               return -ENOMEM;
>
>         /* setup CPU power management handling for CPU bound CTI devices. */
> -       if (drvdata->ctidev.cpu >= 0) {
> -               cti_cpu_drvdata[drvdata->ctidev.cpu] = drvdata;
> -               if (!nr_cti_cpu++) {
> -                       cpus_read_lock();
> -                       ret = cpuhp_setup_state_nocalls_cpuslocked(
> -                               CPUHP_AP_ARM_CORESIGHT_CTI_STARTING,
> -                               "arm/coresight_cti:starting",
> -                               cti_starting_cpu, cti_dying_cpu);
> -
> -                       if (!ret)
> -                               ret = cpu_pm_register_notifier(&cti_cpu_pm_nb);
> -                       cpus_read_unlock();
> -                       if (ret)
> -                               goto err_out;
> -               }
> -       }
> +       ret = cti_pm_setup(drvdata);
> +       if (ret)
> +               return ret;
>
>         /* create dynamic attributes for connections */
>         ret = cti_create_cons_sysfs(dev, drvdata);
>         if (ret) {
>                 dev_err(dev, "%s: create dynamic sysfs entries failed\n",
>                         cti_desc.name);
> -               goto err_out;
> +               goto pm_release;
>         }
>
>         /* set up coresight component description */
> @@ -908,7 +920,7 @@ static int cti_probe(struct amba_device *adev, const struct amba_id *id)
>         drvdata->csdev = coresight_register(&cti_desc);
>         if (IS_ERR(drvdata->csdev)) {
>                 ret = PTR_ERR(drvdata->csdev);
> -               goto err_out;
> +               goto pm_release;
>         }
>
>         /* add to list of CTI devices */
> @@ -927,7 +939,7 @@ static int cti_probe(struct amba_device *adev, const struct amba_id *id)
>         dev_info(&drvdata->csdev->dev, "CTI initialized\n");
>         return 0;
>
> -err_out:
> +pm_release:
>         cti_pm_release(drvdata);
>         return ret;
>  }
> --
> 2.27.0
>

Reviewed-by Mike Leach <mike.leach@linaro.org>


-- 
Mike Leach
Principal Engineer, ARM Ltd.
Manchester Design Centre. UK
