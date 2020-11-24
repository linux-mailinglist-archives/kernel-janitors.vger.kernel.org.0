Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D58C32C24E3
	for <lists+kernel-janitors@lfdr.de>; Tue, 24 Nov 2020 12:45:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732917AbgKXLoO (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Tue, 24 Nov 2020 06:44:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21975 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1732523AbgKXLoO (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 24 Nov 2020 06:44:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1606218253;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=4NrSc8wihaHmFWeUfPDKBxbk/YM1ofsoDJ23X2QLggQ=;
        b=Qie0VHmMOEtT2D7a5b6ZuOc6pYhiutDsfnw87BkEzj5F+29OEJAQOgRxBIhEbU3tMWSwDZ
        xh7NaNvs6tzLABZ54Y02+VcaJPTRDmMI+8+5yjm5IMWyjiweBECKWGj2GmTlGaNDf38K5q
        qm4aGxdiqyuZBdM0PenJg9vJw8lwyGY=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-261-pEjv4KpROhGXnx8V6hUcWg-1; Tue, 24 Nov 2020 06:44:11 -0500
X-MC-Unique: pEjv4KpROhGXnx8V6hUcWg-1
Received: by mail-ej1-f70.google.com with SMTP id pv11so668479ejb.5
        for <kernel-janitors@vger.kernel.org>; Tue, 24 Nov 2020 03:44:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=4NrSc8wihaHmFWeUfPDKBxbk/YM1ofsoDJ23X2QLggQ=;
        b=X1vlVvhUsjzA7hEgt7rlXVzN6KkZKZhYY2fgg/xG+TlhOsvxDwItTjR3LGrvMBskzN
         zrkKathNrZr2wPLy7/cswf/UeKMDKcX+PHKbrmpdLnGaTbcLKSBfzb4iXY2REM+FG+Qm
         +ao3IAaJKxCvSDWWsp/inyLpLBO1ztT3LyVPKmxocP8dFE9rJkZUAM6EOCO7m7HVciSF
         iM7Eaqq1YsBbCNWP2bRQEHi7HeZipC+jQDtvPpaiYZGJxQV8CWHl8+TledRu9KjmXiBV
         MtGiMi6I5Sk9pk4pee5Oq45RGX+ECPUKgjwHd2ZwbRt0K1JZz5OFi6LzkUKVcK8y+RSY
         Ct8Q==
X-Gm-Message-State: AOAM532lFUVJQf+FVWoKrIfqT2ZCRJTVLv/FQT+xX5f174TO3rSJR74H
        ZKHbomb9pER8e4/3wJ8eF0054wHklkUuKGpQIPBiYJyXQdkPpoqJHL5+J6fMGqBWRJNqvMDqxW5
        4l/UP2Y51oU7PueyPyae5rURgZf84KtHLf6yERxoc9+RItLQREf2rkX3lfPpPZwUuuNmPpEQCzG
        HxoruB
X-Received: by 2002:a17:906:6c93:: with SMTP id s19mr3903950ejr.544.1606218250378;
        Tue, 24 Nov 2020 03:44:10 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyqeAEBo8mx23ukw9XW1uC+amQFfgZkj7hPg4gx5bQ2PGxT2SPXRHV2NUknaBSKxNMUIpb6Ug==
X-Received: by 2002:a17:906:6c93:: with SMTP id s19mr3903927ejr.544.1606218250181;
        Tue, 24 Nov 2020 03:44:10 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-6c10-fbf3-14c4-884c.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:6c10:fbf3:14c4:884c])
        by smtp.gmail.com with ESMTPSA id p25sm4272540eju.63.2020.11.24.03.44.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2020 03:44:09 -0800 (PST)
Subject: Re: [PATCH] platform/x86: pmt: Fix a potential Oops on error in probe
To:     Dan Carpenter <dan.carpenter@oracle.com>,
        "David E. Box" <david.e.box@linux.intel.com>,
        Alexander Duyck <alexander.h.duyck@linux.intel.com>
Cc:     Mark Gross <mgross@linux.intel.com>,
        Lee Jones <lee.jones@linaro.org>,
        platform-driver-x86@vger.kernel.org,
        kernel-janitors@vger.kernel.org
References: <20201117072251.GC1111239@mwanda>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <3a84cc88-25d2-7265-6183-41337109df87@redhat.com>
Date:   Tue, 24 Nov 2020 12:44:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201117072251.GC1111239@mwanda>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hi,

On 11/17/20 8:22 AM, Dan Carpenter wrote:
> The "ns->attr_grp" pointer can be NULL so this error handling code needs
> to check for that to avoid an Oops.
> 
> Fixes: e2729113ce66 ("platform/x86: Intel PMT class driver")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Thank you for your patch, I've applied this patch to my review-hans 
branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans

Note it will show up in my review-hans branch once I've pushed my
local branch there, which might take a while.

Once I've run some tests on this branch the patches there will be
added to the platform-drivers-x86/for-next branch and eventually
will be included in the pdx86 pull-request to Linus for the next
merge-window.

Regards,

Hans

> ---
>  drivers/platform/x86/intel_pmt_class.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/intel_pmt_class.c b/drivers/platform/x86/intel_pmt_class.c
> index aa88dc23bbde..c8939fba4509 100644
> --- a/drivers/platform/x86/intel_pmt_class.c
> +++ b/drivers/platform/x86/intel_pmt_class.c
> @@ -225,7 +225,8 @@ static int intel_pmt_dev_register(struct intel_pmt_entry *entry,
>  		return 0;
>  
>  fail_ioremap:
> -	sysfs_remove_group(entry->kobj, ns->attr_grp);
> +	if (ns->attr_grp)
> +		sysfs_remove_group(entry->kobj, ns->attr_grp);
>  fail_sysfs:
>  	device_unregister(dev);
>  fail_dev_create:
> 

