Return-Path: <kernel-janitors+bounces-1022-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AD18821BC1
	for <lists+kernel-janitors@lfdr.de>; Tue,  2 Jan 2024 13:39:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A18661C21F41
	for <lists+kernel-janitors@lfdr.de>; Tue,  2 Jan 2024 12:38:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF0FAF9DE;
	Tue,  2 Jan 2024 12:38:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ikAR5Lo/"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3FEF101E6
	for <kernel-janitors@vger.kernel.org>; Tue,  2 Jan 2024 12:38:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1704199092;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aOiIVnrfw3j/25sx9mj6iBNj7SDjBTnZ0tIKGyspww8=;
	b=ikAR5Lo/TqjUsbwgHXAxOMyP79ZSpaBMDcZeXOTE2967eoaduSfZlPm7zgPdupsxktuu+7
	XGte4mp1u3phcnOL73gtxq1dgPRdXKRf3RsBqQuUzBokf8qziH+JVUuzMCBRA/KixlhMjn
	xrmgDS/z31Vh/RV+ao2bzsIUHAlp4Aw=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-532-l28esZPgPzyaYWx7WlIpIA-1; Tue, 02 Jan 2024 07:38:06 -0500
X-MC-Unique: l28esZPgPzyaYWx7WlIpIA-1
Received: by mail-ed1-f72.google.com with SMTP id 4fb4d7f45d1cf-5567953c4acso513827a12.3
        for <kernel-janitors@vger.kernel.org>; Tue, 02 Jan 2024 04:38:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704199085; x=1704803885;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aOiIVnrfw3j/25sx9mj6iBNj7SDjBTnZ0tIKGyspww8=;
        b=OnkwSDUs5lwA6K0EKP+eM4/xdTePxFNvl2qFoptE+BvsHeaQybMwRTBsgfUzOC6tVz
         fjUY1m+udlzrX5E2S4GB8uiA8kubeBB+ukMH7ycQH1likC5KOnBTK2Xd2ScHe5LGsBw3
         QWXaentDIKgwi7NkhtiMBIrPHB2EEUCUIxPIIM//RINmxIohNxAdAwaTsdJtfpb5LNOC
         2XYiVNyfbSXIsDW++VajD70QS7Wl+G9pcY9VvTheLE094/8hHrzEQfncuyX80eVkmnRF
         D0iiaUT1RQDOKHnusX9PNPoRNWx91JpmGS7IJFmMpsHGdIJpPb0ci5XqcQ3sbuv1YE//
         sm9w==
X-Gm-Message-State: AOJu0Yyajy15D6Hh60GhNxueZdu1OchDv/UwBvzvPOh3qElx2SoVB7U/
	3gUJxwN63f4WRAf3phBASsFyvS7deV7/6zPlN7EvOT5bAJCO4CwCIdEBwmBL60KsKGMoLONg+2A
	4irvlOVs22yAyqGCja4eQ4smfUKjnkScFnQ8S
X-Received: by 2002:a50:d5cd:0:b0:552:2b83:30b7 with SMTP id g13-20020a50d5cd000000b005522b8330b7mr10842117edj.32.1704199085143;
        Tue, 02 Jan 2024 04:38:05 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEPhlfX49TZaOLQEbBJT0HoKBu157QSyNXUEAnI1EhtZHwGiRzr/5Z4syQ6r5VhLZ+aNCcRZg==
X-Received: by 2002:a50:d5cd:0:b0:552:2b83:30b7 with SMTP id g13-20020a50d5cd000000b005522b8330b7mr10842107edj.32.1704199084781;
        Tue, 02 Jan 2024 04:38:04 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id fd23-20020a056402389700b00553a86b7821sm15857865edb.74.2024.01.02.04.38.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Jan 2024 04:38:04 -0800 (PST)
Message-ID: <517ab423-4e10-489c-a56f-e5583a213b3a@redhat.com>
Date: Tue, 2 Jan 2024 13:38:03 +0100
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/x86/amd/pmf: Return a status code only as a
 constant in two functions
Content-Language: en-US, nl
To: Markus Elfring <Markus.Elfring@web.de>,
 platform-driver-x86@vger.kernel.org, kernel-janitors@vger.kernel.org,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Cc: LKML <linux-kernel@vger.kernel.org>
References: <0d0c4876-37d7-4bee-912e-56324495454f@web.de>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <0d0c4876-37d7-4bee-912e-56324495454f@web.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

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


Hi,

On 12/28/23 10:54, Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Thu, 28 Dec 2023 10:48:16 +0100
> 
> Return a status code without storing it in an intermediate variable.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>


> ---
>  drivers/platform/x86/amd/pmf/acpi.c | 15 +++++----------
>  1 file changed, 5 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/platform/x86/amd/pmf/acpi.c b/drivers/platform/x86/amd/pmf/acpi.c
> index 4ec7957eb707..ce00dd9a5391 100644
> --- a/drivers/platform/x86/amd/pmf/acpi.c
> +++ b/drivers/platform/x86/amd/pmf/acpi.c
> @@ -111,7 +111,6 @@ int apmf_os_power_slider_update(struct amd_pmf_dev *pdev, u8 event)
>  	struct os_power_slider args;
>  	struct acpi_buffer params;
>  	union acpi_object *info;
> -	int err = 0;
> 
>  	args.size = sizeof(args);
>  	args.slider_event = event;
> @@ -121,10 +120,10 @@ int apmf_os_power_slider_update(struct amd_pmf_dev *pdev, u8 event)
> 
>  	info = apmf_if_call(pdev, APMF_FUNC_OS_POWER_SLIDER_UPDATE, &params);
>  	if (!info)
> -		err = -EIO;
> +		return -EIO;
> 
>  	kfree(info);
> -	return err;
> +	return 0;
>  }
> 
>  static void apmf_sbios_heartbeat_notify(struct work_struct *work)
> @@ -148,7 +147,6 @@ int apmf_update_fan_idx(struct amd_pmf_dev *pdev, bool manual, u32 idx)
>  	union acpi_object *info;
>  	struct apmf_fan_idx args;
>  	struct acpi_buffer params;
> -	int err = 0;
> 
>  	args.size = sizeof(args);
>  	args.fan_ctl_mode = manual;
> @@ -158,14 +156,11 @@ int apmf_update_fan_idx(struct amd_pmf_dev *pdev, bool manual, u32 idx)
>  	params.pointer = (void *)&args;
> 
>  	info = apmf_if_call(pdev, APMF_FUNC_SET_FAN_IDX, &params);
> -	if (!info) {
> -		err = -EIO;
> -		goto out;
> -	}
> +	if (!info)
> +		return -EIO;
> 
> -out:
>  	kfree(info);
> -	return err;
> +	return 0;
>  }
> 
>  int apmf_get_auto_mode_def(struct amd_pmf_dev *pdev, struct apmf_auto_mode *data)
> --
> 2.43.0
> 


