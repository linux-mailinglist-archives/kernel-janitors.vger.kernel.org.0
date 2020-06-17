Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 309AE1FCB70
	for <lists+kernel-janitors@lfdr.de>; Wed, 17 Jun 2020 12:54:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726519AbgFQKxz (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Wed, 17 Jun 2020 06:53:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53796 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726497AbgFQKxw (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 17 Jun 2020 06:53:52 -0400
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com [IPv6:2a00:1450:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 419A5C06174E
        for <kernel-janitors@vger.kernel.org>; Wed, 17 Jun 2020 03:53:51 -0700 (PDT)
Received: by mail-ej1-x642.google.com with SMTP id dp18so1799762ejc.8
        for <kernel-janitors@vger.kernel.org>; Wed, 17 Jun 2020 03:53:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=lCVEonbpFZmz0/ZeZBC256oe8W32YGcEqtUscl42Jjk=;
        b=N6FV9zn0+vHCrQgrVC1C0J/mPAwm539PdN5uB7k0b9RkMCTH5U+h4TNko9RWYTFJS0
         aycV7lZQuWVgH8fVnSepk8Xz4VRR0fWiURSOHJK9kMY/TeSTYqHhqujymcLZK8nILAq8
         YRnZdRC+EuIeN9ZsLl8ItTHgnLXHEd4/8J1RICT4DwDfOwhleGOwVqvM5R9dnz8aZtuO
         BJrqqCIPEirrFFQ+oaDBvgOulTo2An6MX+DdR6/Q8wn/r+pwJkOrMtEF6QcvlqVKRjrt
         Q3wuXeWMZBbTXMuBU1zwm5ArFFPkRslx4tiWzIl5cKnTCZggSehVm90BWCG6qsbLOv9E
         86nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lCVEonbpFZmz0/ZeZBC256oe8W32YGcEqtUscl42Jjk=;
        b=b7zkTEV45xA3N9PnD7Apokn6wnw3OjYqrHiHPmuIOFpNS51fThwQ/mIB5ptzwk1E/s
         MId3QMBP+1qTowXfg2jJ3KSEjL3tvHofIUEfhqqjdzJm8OHtaV1k2Nfc5cTUw7cQBgC+
         TLVTlJTx/SqWmaRnsQ2Qqd1CB7tYZBhH9fhPjqpGGNWx21s6q82kyPDzxqVjcc+4koDF
         jztoKyF4+e7GuOrgFcAifFvVgz1U6Uvy/JRj+EtMBFKZtHe9RN9aHoF2cRHIdrHgd81M
         6vrLsGDgQlZsWzUzmrNhwFgVBagTjnBjx8DOFUeqaWboOsNvOuC1KtF1txAXwCb1djr7
         FlHg==
X-Gm-Message-State: AOAM5325Io07ewvWSFyhU3FxVDEBSl2bTCfBmdDjSCyP70Vzc6OmorC6
        lrJSiyYCEqKfbbD41rVHc1eudEfeQenPpZQ+CxqtJw==
X-Google-Smtp-Source: ABdhPJzM/QMiOA2pfu6giruDymL/vgxx992VCpmzw/lfID1zaGXgd0e96O1FEVsGBiSkriQxR1i1J10b+Xiy3GtvffU=
X-Received: by 2002:a17:906:118b:: with SMTP id n11mr7055515eja.328.1592391230007;
 Wed, 17 Jun 2020 03:53:50 -0700 (PDT)
MIME-Version: 1.0
References: <20200612121047.GF4282@kadam> <20200612121133.GA1139533@mwanda> <20200612174215.GI4282@kadam>
In-Reply-To: <20200612174215.GI4282@kadam>
From:   Mike Leach <mike.leach@linaro.org>
Date:   Wed, 17 Jun 2020 11:53:39 +0100
Message-ID: <CAJ9a7ViP_PTiSnYnOYbH=LRXUroWT04rmdswZEdakoWjevUi4Q@mail.gmail.com>
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

On Fri, 12 Jun 2020 at 18:43, Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> On Fri, Jun 12, 2020 at 03:11:33PM +0300, Dan Carpenter wrote:
> > +static int cti_pm_setup(struct cti_drvdata *drvdata)
> > +{
> > +     int ret;
> > +
> > +     if (drvdata->ctidev.cpu == -1)
> > +             return 0;
> > +
> > +     if (nr_cti_cpu)
> > +             goto done;
> > +
> > +     cpus_read_lock();
>         ^^^^^^^^^^^^^^^^
> One thing which I do wonder is why we have locking here but not in the
> cti_pm_release() function.  That was how the original code was so the
> patch doesn't change anything, but I am curious.
>

Good point - the CTI PM code was modelled on the same code in the ETM
drivers, which show the same pattern.
Perhaps something we need to revisit in both drivers.

Regards

Mike

> > +     ret = cpuhp_setup_state_nocalls_cpuslocked(
> > +                     CPUHP_AP_ARM_CORESIGHT_CTI_STARTING,
> > +                     "arm/coresight_cti:starting",
> > +                     cti_starting_cpu, cti_dying_cpu);
> > +     if (ret) {
> > +             cpus_read_unlock();
> > +             return ret;
> > +     }
> > +
> > +     ret = cpu_pm_register_notifier(&cti_cpu_pm_nb);
> > +     cpus_read_unlock();
> > +     if (ret) {
> > +             cpuhp_remove_state_nocalls(CPUHP_AP_ARM_CORESIGHT_CTI_STARTING);
> > +             return ret;
> > +     }
> > +
> > +done:
> > +     nr_cti_cpu++;
> > +     cti_cpu_drvdata[drvdata->ctidev.cpu] = drvdata;
> > +
> > +     return 0;
> > +}
> > +
> >  /* release PM registrations */
> >  static void cti_pm_release(struct cti_drvdata *drvdata)
> >  {
> > -     if (drvdata->ctidev.cpu >= 0) {
> > -             if (--nr_cti_cpu == 0) {
> > -                     cpu_pm_unregister_notifier(&cti_cpu_pm_nb);
> > +     if (drvdata->ctidev.cpu == -1)
> > +             return;
> >
> > -                     cpuhp_remove_state_nocalls(
> > -                             CPUHP_AP_ARM_CORESIGHT_CTI_STARTING);
> > -             }
> > -             cti_cpu_drvdata[drvdata->ctidev.cpu] = NULL;
> > +     cti_cpu_drvdata[drvdata->ctidev.cpu] = drvdata;
> > +     if (--nr_cti_cpu == 0) {
> > +             cpu_pm_unregister_notifier(&cti_cpu_pm_nb);
> > +             cpuhp_remove_state_nocalls(CPUHP_AP_ARM_CORESIGHT_CTI_STARTING);
> >       }
> >  }
>
> regards,
> dan carpenter
>


-- 
Mike Leach
Principal Engineer, ARM Ltd.
Manchester Design Centre. UK
