Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AE5912E345B
	for <lists+kernel-janitors@lfdr.de>; Mon, 28 Dec 2020 06:38:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727785AbgL1FiW (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Mon, 28 Dec 2020 00:38:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36246 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726511AbgL1FiW (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 28 Dec 2020 00:38:22 -0500
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 079B0C061794
        for <kernel-janitors@vger.kernel.org>; Sun, 27 Dec 2020 21:37:41 -0800 (PST)
Received: by mail-pj1-x102b.google.com with SMTP id b5so5926903pjk.2
        for <kernel-janitors@vger.kernel.org>; Sun, 27 Dec 2020 21:37:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=zegu0X9sZDxNvLaLEb6B1P2y6YF1mpAuGwZH8pLcUFA=;
        b=kGu4z+nkVQp+gc3xdhla18BclFTp67yzoxD+9RMY/GNIXQuJexMdOsKGqMSyUf1E/l
         5CB7kIpM6JGNNbciDg+zesEBaWdz1pBhFlY7EJdHT1T+liJT84FxCNu+mMoBZeWEkzJ6
         Q52JQkCXPH4rhP8Y3QYUtl/ZOCyEeePFYh74dpzixQjAYGJzhX0cD3gFD3E4Eid1d7Cx
         dbWFydxsZnVIzQxYWP6sy6nbUdVlaeyP3LjdaasrPTmMxEQNIXRasuR6qjl9MS/p7E33
         gSVdelpIQSxrGGuumL9cdg5LYxRoRR5Z2A6zoM3Tu5mCXTZu/cfiGCDdoolQJxZB1rfa
         axIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=zegu0X9sZDxNvLaLEb6B1P2y6YF1mpAuGwZH8pLcUFA=;
        b=EKA6J4o8Q5dWDJTRZQdsr4N9s3JMX033iljJxFZrgFHh2F6fp1FnreX67vzVTqcqHc
         p64rDDLEZCnZhzL4EqH0A6jDil5M3+vSM3EsT+5vPs9xYTUN41ljU7WssdbUJNMol+yQ
         tYZUHVNsKcaW1BfWX31mbjB2eGcrenMWdzScJR1lX/N8z8NL9grAus64VTrph5LxlB7+
         XYp8HqSdMhx/q7qW8y/Ae0bkWyVuVtGvTRThrkGiP7SCvo3RzpSDF8QOfj+JqbFHXiqz
         xk0xOs26VmpgTAnSxf+g4RDHhUfNWnavRHRF45tCsC5hKTtMOs3T+/pZj1d+ffvwXq0n
         UoVA==
X-Gm-Message-State: AOAM533SJI+rZevkJZnkhv4Q3v4busZiwUNPlU0ZOf7FO1qD/Ywm/hro
        vc2sFo3TfrInL8HJ6Z0+gi2kDi+D8qE6EQ==
X-Google-Smtp-Source: ABdhPJxZONjSIasQCRp/1pDOfNWPBn0hTvHIEA8MIs0tOmtvQDHZvqlafaqvzNUcqKO4wHrWxx/3HA==
X-Received: by 2002:a17:90a:ee8e:: with SMTP id i14mr19562217pjz.190.1609133861327;
        Sun, 27 Dec 2020 21:37:41 -0800 (PST)
Received: from localhost ([122.172.20.109])
        by smtp.gmail.com with ESMTPSA id d124sm36711730pgc.68.2020.12.27.21.37.40
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 27 Dec 2020 21:37:40 -0800 (PST)
Date:   Mon, 28 Dec 2020 11:07:38 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc:     mmayer@broadcom.com, bcm-kernel-feedback-list@broadcom.com,
        rjw@rjwysocki.net, f.fainelli@gmail.com, linux-pm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] cpufreq: brcmstb-avs-cpufreq: Fix some resource leaks in
 the error handling path of the probe function
Message-ID: <20201228053738.6b6uaz2ipzjpwzet@vireshk-i7>
References: <20201219101751.181783-1-christophe.jaillet@wanadoo.fr>
 <20201222043505.rq3cmajc3mxv3p2z@vireshk-i7>
 <a7e1f78c-b4c9-4ef5-7ca4-94a65fefd299@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a7e1f78c-b4c9-4ef5-7ca4-94a65fefd299@wanadoo.fr>
User-Agent: NeoMutt/20180716-391-311a52
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On 27-12-20, 18:22, Christophe JAILLET wrote:
> Le 22/12/2020 � 05:35, Viresh Kumar a �crit�:
> > On 19-12-20, 11:17, Christophe JAILLET wrote:
> > > If 'cpufreq_register_driver()' fails, we must release the resources
> > > allocated in 'brcm_avs_prepare_init()' as already done in the remove
> > > function.
> > > 
> > > To do that, introduce a new function 'brcm_avs_prepare_uninit()' in order
> > > to avoid code duplication. This also makes the code more readable (IMHO).
> > > 
> > > Fixes: de322e085995 ("cpufreq: brcmstb-avs-cpufreq: AVS CPUfreq driver for Broadcom STB SoCs")
> > > Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> > > ---
> > > I'm not sure that the existing error handling in the remove function is
> > > correct and/or needed.
> > > ---
> > >   drivers/cpufreq/brcmstb-avs-cpufreq.c | 25 ++++++++++++++++++++-----
> > >   1 file changed, 20 insertions(+), 5 deletions(-)
> > > 
> > > diff --git a/drivers/cpufreq/brcmstb-avs-cpufreq.c b/drivers/cpufreq/brcmstb-avs-cpufreq.c
> > > index 3e31e5d28b79..750ca7cfccb0 100644
> > > --- a/drivers/cpufreq/brcmstb-avs-cpufreq.c
> > > +++ b/drivers/cpufreq/brcmstb-avs-cpufreq.c
> > > @@ -597,6 +597,16 @@ static int brcm_avs_prepare_init(struct platform_device *pdev)
> > >   	return ret;
> > >   }
> > > +static void brcm_avs_prepare_uninit(struct platform_device *pdev)
> > > +{
> > > +	struct private_data *priv;
> > > +
> > > +	priv = platform_get_drvdata(pdev);
> > > +
> > > +	iounmap(priv->avs_intr_base);
> > > +	iounmap(priv->base);
> > > +}
> > > +
> > >   static int brcm_avs_cpufreq_init(struct cpufreq_policy *policy)
> > >   {
> > >   	struct cpufreq_frequency_table *freq_table;
> > > @@ -732,21 +742,26 @@ static int brcm_avs_cpufreq_probe(struct platform_device *pdev)
> > >   	brcm_avs_driver.driver_data = pdev;
> > > -	return cpufreq_register_driver(&brcm_avs_driver);
> > > +	ret = cpufreq_register_driver(&brcm_avs_driver);
> > > +	if (ret)
> > > +		goto err_uninit;
> > > +
> > > +	return 0;
> > > +
> > > +err_uninit:
> > > +	brcm_avs_prepare_uninit(pdev);
> > > +	return ret;
> > 
> > Maybe rewrite as:
> > 
> > 	ret = cpufreq_register_driver(&brcm_avs_driver);
> > 	if (ret)
> >                  brcm_avs_prepare_uninit(pdev);
> > 	return ret;
> > 
> 
> Personlaly, I prefer what I have proposed. Having a clear and dedicated
> error handling path is more future proff, IMHO.

I would have agreed to that if there were other things we were handling in the
error path, but right now we are adding an extra label, goto, etc without any
need. If in future this needs a change, we can always come back to it and update
with a label. But right now I would suggest to keep it simple.

> > >   }
> > >   static int brcm_avs_cpufreq_remove(struct platform_device *pdev)
> > >   {
> > > -	struct private_data *priv;
> > >   	int ret;
> > >   	ret = cpufreq_unregister_driver(&brcm_avs_driver);
> > >   	if (ret)
> > >   		return ret;
> > 
> > Instead of returning here, it can be just WARN_ON(ret); and then go on and free
> > the resources and this needs to be done in a separate patch.
> 
> Ok, I agree (see my comment below the --- in my patch).
> I'll send a patch for it when the first patch will be applied, unless you
> prefer if I resend as a serie.

Based on the above comment from me, I am expecting another version from you for
this patch. So you can fix both the issues in the same patchset.

-- 
viresh
