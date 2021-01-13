Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 60E3C2F4795
	for <lists+kernel-janitors@lfdr.de>; Wed, 13 Jan 2021 10:32:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727011AbhAMJ13 (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Wed, 13 Jan 2021 04:27:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46889 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726768AbhAMJ12 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 13 Jan 2021 04:27:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1610529961;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=vhGBheygAegbfi9rXHPYkyAW71b1XQ8FOLJsWiApa9k=;
        b=B+f+xsC2bRee1DDVxijrjhMu43jEpF57ih6dQLPl4x/ex4T5q6MMnfAyctiyLlT/mP515T
        u6w8DokO0H0uQuuCiGjw7RBijh60pkGDSsTL/F/mQIWAq8ySc/gkIrQycKxe1rAevZyVfJ
        kMTZySRwGOmyTLFtODnHayNwBjNPIw0=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-561-3Cp2-IEBON2GYtwGOE8bbw-1; Wed, 13 Jan 2021 04:25:58 -0500
X-MC-Unique: 3Cp2-IEBON2GYtwGOE8bbw-1
Received: by mail-ed1-f72.google.com with SMTP id g6so589938edw.13
        for <kernel-janitors@vger.kernel.org>; Wed, 13 Jan 2021 01:25:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=vhGBheygAegbfi9rXHPYkyAW71b1XQ8FOLJsWiApa9k=;
        b=ULZq3NFBbnL0+/G3xWS8GIlRTJLsXYpXDAkV2VyozEqYJW/eK6QsUj26El8pC4sAku
         yqy1W1JdzPylj+lsn3Xw8A+TVwRjtUFWDOvIKnvWtdn2om2JuM5xHAN0no4NBDDSGZJw
         5AML1Vpi0KkDFz2HWUF8mMzgELzmQkUhph5sMWqGZCUlf0drl8/WMuxrxpmWB662NW+P
         q8CZUWe8nnYUPPmupyAEkZM1561AOg3pz5ZQfW+q7uAN5b4Yi5TbdL0MFzW+KayACb+/
         7U5k07zuxoD7DLvAKaIJ7rRc6KpzHZSxGrjKbzRUjUAlxlRgcDeGp/QprmxuDF/Rmpsl
         2hdg==
X-Gm-Message-State: AOAM530xnPWbxUmT/V++V08TZFFSg5c8dvJ1KnHd4lDbct9rnoOI3+Xn
        kPOy0mVTck4qIBXbrpaEyaAS5WRabOkvZQBXz0DFcEI306rDbLR6NQ8iEVd7hXzG2sFrs1CsVX0
        OpLi8yPOOECxaYc0fDLZO3CKJGgEq
X-Received: by 2002:a50:d60f:: with SMTP id x15mr1023699edi.224.1610529957615;
        Wed, 13 Jan 2021 01:25:57 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxppPFuiEj429kT4UmRf8AVmVPxSIzK+1V4paib69p0+KuGMTPwkvEoW4ilQaa533kik78OkQ==
X-Received: by 2002:a50:d60f:: with SMTP id x15mr1023686edi.224.1610529957437;
        Wed, 13 Jan 2021 01:25:57 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-37a3-353b-be90-1238.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:37a3:353b:be90:1238])
        by smtp.gmail.com with ESMTPSA id m24sm465153ejo.52.2021.01.13.01.25.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Jan 2021 01:25:56 -0800 (PST)
Subject: Re: [PATCH][next] platform/surface: fix potential integer overflow on
 shift of a int
To:     Colin King <colin.king@canonical.com>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Mark Gross <mgross@linux.intel.com>,
        platform-driver-x86@vger.kernel.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210111144648.20498-1-colin.king@canonical.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <e4092c8d-8857-ad95-065b-f72e774dfbb6@redhat.com>
Date:   Wed, 13 Jan 2021 10:25:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20210111144648.20498-1-colin.king@canonical.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hi,

On 1/11/21 3:46 PM, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The left shift of int 32 bit integer constant 1 is evaluated using 32 bit
> arithmetic and then passed as a 64 bit function argument. In the case where
> func is 32 or more this can lead to an oveflow.  Avoid this by shifting
> using the BIT_ULL macro instead.
> 
> Addresses-Coverity: ("Unintentional integer overflow")
> Fixes: fc00bc8ac1da ("platform/surface: Add Surface ACPI Notify driver")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

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
>  drivers/platform/surface/surface_acpi_notify.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/surface/surface_acpi_notify.c b/drivers/platform/surface/surface_acpi_notify.c
> index 8cd67a669c86..ef9c1f8e8336 100644
> --- a/drivers/platform/surface/surface_acpi_notify.c
> +++ b/drivers/platform/surface/surface_acpi_notify.c
> @@ -188,7 +188,7 @@ static int san_acpi_notify_event(struct device *dev, u64 func,
>  	union acpi_object *obj;
>  	int status = 0;
>  
> -	if (!acpi_check_dsm(san, &SAN_DSM_UUID, SAN_DSM_REVISION, 1 << func))
> +	if (!acpi_check_dsm(san, &SAN_DSM_UUID, SAN_DSM_REVISION, BIT_ULL(func)))
>  		return 0;
>  
>  	dev_dbg(dev, "notify event %#04llx\n", func);
> 

