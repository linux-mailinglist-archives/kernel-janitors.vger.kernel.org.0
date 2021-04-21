Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 337B8367376
	for <lists+kernel-janitors@lfdr.de>; Wed, 21 Apr 2021 21:32:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241793AbhDUTc6 (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Wed, 21 Apr 2021 15:32:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44424 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S238081AbhDUTc5 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 21 Apr 2021 15:32:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1619033543;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=1BBZbDPdoILFAbDCTmIR8WakICnxwYOnEVliMh8JCfw=;
        b=JoXskYRY3okldpqpUJjAYNpJ028kQUPyfEVzaXI4IRXMacAEJJuwZl6G+Vn+XA5YcaamQ3
        uXUzeJyCSnQ7JdLLR7wZQmFOIa+KSevxmKYXA/xsQcTVKW7kymqTHP4S7I3UkqfBMtZ6Vj
        iqloTTyedESY+X2qu15XYn78RSGdudY=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-488-fWmPzDK0OsmgtZ3Qx320xQ-1; Wed, 21 Apr 2021 15:32:22 -0400
X-MC-Unique: fWmPzDK0OsmgtZ3Qx320xQ-1
Received: by mail-ed1-f72.google.com with SMTP id w14-20020aa7da4e0000b02903834aeed684so13799793eds.13
        for <kernel-janitors@vger.kernel.org>; Wed, 21 Apr 2021 12:32:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=1BBZbDPdoILFAbDCTmIR8WakICnxwYOnEVliMh8JCfw=;
        b=Gqc5i/+tn9Zu9D6HlfJP7GXRyX0N4aTrbJ7KdkSwGFK6SigBlHwDAp/w8DT1c6+lcF
         kd8Bjh7k0Y7AMJSDMU1nSmEd7PPoPYTo3iJBuFtwMC0HQAO4cNNsYF1V3XisG8m9kwjO
         uhgtktrJb1816JWz7whTBHAhy4Nv/+iVSX3d670tEepfFhIC+4GYz5mFlUhij/2ptTBz
         xykgLCg9584wUG11/VN0J6F5QBlzcgRPiQFKreP8KFGuBZl2rbyFnGjp9LAuWKFG3c7S
         xI86qWYVPWN3K5lWR3rA9Nfa7m5EvXc/gRPsxdJm3c38n3VnuCy352mQ0j6Ezan0j1uI
         MZMA==
X-Gm-Message-State: AOAM531eqtAMKCprkl6Sag2fsovRWXBAcGVaOKZVybJhmkC3weyB8Hy2
        j+Pk27p565GRgKvQioZxIR3m4mJzFWaqOJ6QH+JCpAngoodePiZxcSEXb5zd5JJ/88yK8g9WFII
        75PPQmAhXTHJneX+lGJj1frHgnHFtDgs2GjyUaF1zU3kMoDAt3Wnvei6QotAFd5GR2T3OoVyZGr
        1XUdX7
X-Received: by 2002:a17:906:49c1:: with SMTP id w1mr35176159ejv.178.1619033540696;
        Wed, 21 Apr 2021 12:32:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxdRpxiINqsS4aMzDxg+dVxuQVoOGhMEjSyLCURLTc1al9CQeb0bDFM8n1U/vBFgVyVwEwFUw==
X-Received: by 2002:a17:906:49c1:: with SMTP id w1mr35176126ejv.178.1619033540350;
        Wed, 21 Apr 2021 12:32:20 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id gn19sm287812ejc.68.2021.04.21.12.32.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Apr 2021 12:32:19 -0700 (PDT)
Subject: Re: [PATCH v2] platform/x86: intel_pmc_core: Uninitialized data in
 pmc_core_lpm_latch_mode_write()
To:     Dan Carpenter <dan.carpenter@oracle.com>,
        Rajneesh Bhardwaj <irenic.rajneesh@gmail.com>
Cc:     David E Box <david.e.box@intel.com>,
        Mark Gross <mgross@linux.intel.com>,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org
References: <YIBCf+G9Ef8wrGJw@mwanda>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <ad05f502-b3dc-b62f-1f9f-ca8c806e1e3c@redhat.com>
Date:   Wed, 21 Apr 2021 21:32:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YIBCf+G9Ef8wrGJw@mwanda>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hi,

On 4/21/21 5:19 PM, Dan Carpenter wrote:
> The simple_write_to_buffer() can return success if even a single byte
> is copied from user space.  In this case it can result in using
> uninitalized data if the buf[] array is not fully initialized.  Really
> we should only succeed if the whole buffer is copied.
> 
> Just using copy_from_user() is simpler and more appropriate.
> 
> Fixes: 8074a79fad2e ("platform/x86: intel_pmc_core: Add option to set/clear LPM mode")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> v2: The first version of this patch returned -EINVAL if userspace didn't
> give us NUL terminated strings.  That's not necessarily a good
> assumption.
> 
> This patch is just simpler as well.  No need to introduce the "len"
> variable because "count" is capped at the start of the function.

Much better, thank you.

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




>  drivers/platform/x86/intel_pmc_core.c | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/platform/x86/intel_pmc_core.c b/drivers/platform/x86/intel_pmc_core.c
> index d174aeb492e0..b0e486a6bdfb 100644
> --- a/drivers/platform/x86/intel_pmc_core.c
> +++ b/drivers/platform/x86/intel_pmc_core.c
> @@ -1360,17 +1360,13 @@ static ssize_t pmc_core_lpm_latch_mode_write(struct file *file,
>  	struct pmc_dev *pmcdev = s->private;
>  	bool clear = false, c10 = false;
>  	unsigned char buf[8];
> -	ssize_t ret;
>  	int idx, m, mode;
>  	u32 reg;
>  
>  	if (count > sizeof(buf) - 1)
>  		return -EINVAL;
> -
> -	ret = simple_write_to_buffer(buf, sizeof(buf) - 1, ppos, userbuf, count);
> -	if (ret < 0)
> -		return ret;
> -
> +	if (copy_from_user(buf, userbuf, count))
> +		return -EFAULT;
>  	buf[count] = '\0';
>  
>  	/*
> 

