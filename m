Return-Path: <kernel-janitors+bounces-4295-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B8679148D6
	for <lists+kernel-janitors@lfdr.de>; Mon, 24 Jun 2024 13:34:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BEC761C22E9C
	for <lists+kernel-janitors@lfdr.de>; Mon, 24 Jun 2024 11:34:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7AC4113A3E3;
	Mon, 24 Jun 2024 11:34:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="VlVCjkRj"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 765D0139587
	for <kernel-janitors@vger.kernel.org>; Mon, 24 Jun 2024 11:34:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719228842; cv=none; b=PCS4WyigrNFXvCZz8c2p3z85vThk5bJF3vZbuEYyPXk/9595w3/xcMsG3TVpQg9TmVEC+5ex1XyyNnRgqWhYIxiVZz7+6qHhGD03uWtswQpmcA7VUeXB/ySpBGGgjBWBGGfKSr1ybW5LDorb4NkbJbLb1kKPOnRJ5xahQvAl/No=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719228842; c=relaxed/simple;
	bh=E27VeBp0L3wh/lWcmKu18PcxmDIts+AAE8lfLuX8e6g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tW5l7bbwtT1vIn51CjLltcfl4BzoXx4xMgxZhKCyO32HHreq0tNr4oaRqJUxx5DRABcEz5Y5/r//Ooe1ZhfU8WMaOIlkoZxQDykC1OWsA0vke4PGY3djD4uRTPskxqg+70EWU/ew30rI4ajJvHSATS22J4+VCN5VBtgQawDfhwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=VlVCjkRj; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1719228840;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ihp+f25iG3MeuRzLeQNN9+ypX1FQGCz6g9Ryzz3fUzw=;
	b=VlVCjkRjf8FirulsRLh/nyE2UFuw/eXSwHl93QZf22r1z+3yUP05SbY0VtjmjN1vsUl4yk
	jggDHus5dXD5uhVabHMnTqN601CRWriAFq8vJhW/20quH1LLJrbX8bsW+T/I3aHcfJzTeP
	ohoLkgOW5fiIppMBD7AMRLcgkJ650XI=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-208-7Vf7BCVkNuykXS2n32kdeQ-1; Mon, 24 Jun 2024 07:33:58 -0400
X-MC-Unique: 7Vf7BCVkNuykXS2n32kdeQ-1
Received: by mail-ed1-f70.google.com with SMTP id 4fb4d7f45d1cf-57d241a4d14so2076785a12.1
        for <kernel-janitors@vger.kernel.org>; Mon, 24 Jun 2024 04:33:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719228837; x=1719833637;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ihp+f25iG3MeuRzLeQNN9+ypX1FQGCz6g9Ryzz3fUzw=;
        b=MxqBdLZ1TPwiuEklUq8NhsMBJYygr5TcTQvHu7M67YV1tXPPCQVKGHPTPHyrOCDqNg
         Yw5kDKyBJJ1Vgm8oiGOTdI9lgqr5xAzN5hDm4Xn1JuUgIifJVVfqt9JFC8OSz1R6jKEE
         NCd5nikdC02dE2C2d3dWEEI32I0HRDrkBaQWPkAzVjTFfb4VwEEU2BYUrr9PwlAMdELj
         ls8g6gvYbOXXQkJUqqv5HdzCIQoyLCNFSbdB/FtnR8FQPRKdZoLCafka75CpIx2Gm12l
         bRNeF36X1JKp+HDB56PooOU3TKcJneihdZs+XDoRxqQAF7ehVOBmZu/mD4SM206HNoG/
         7vOQ==
X-Forwarded-Encrypted: i=1; AJvYcCWyCS5PfFzqteRfaktRzWimyvEJzsH4InV4TLk1tS7pqdYjO8tzddQNVUKJQj/YhJK5nx0lDyDL7bHXUjV+k8KIt0eHhWKza8X9ioZ7qCDQ
X-Gm-Message-State: AOJu0YwSxHf+x1xWF9WI5VxFM9+iyGbIMN5F/o+odLL1WaIA81WesJ3A
	+zJJhjtfSo9cpIqMVHZUMc75u/BDPfO57Im9GdmiCVHIMYFBnelVq0HyFINQYq7lHnP6qqmv/U6
	40SBDCRSuJ/y93ILUR9/D3H3kg84bgN3wGQk8OBVk3fxzYYIvF+zv2jf8L0SlF5iKLQ==
X-Received: by 2002:a50:d552:0:b0:57d:4d2:83fa with SMTP id 4fb4d7f45d1cf-57d4bd53811mr3457373a12.9.1719228837653;
        Mon, 24 Jun 2024 04:33:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFOAkJEJmUJrVPcuILZOvyw7ds3cfckFPT0OK/leclOB4nL8YBWpcF86g6vY2d4xNKx5JPhDQ==
X-Received: by 2002:a50:d552:0:b0:57d:4d2:83fa with SMTP id 4fb4d7f45d1cf-57d4bd53811mr3457352a12.9.1719228837180;
        Mon, 24 Jun 2024 04:33:57 -0700 (PDT)
Received: from [10.40.98.157] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-57d31f33086sm4406438a12.61.2024.06.24.04.33.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Jun 2024 04:33:56 -0700 (PDT)
Message-ID: <7941463e-1d2c-4d5a-a772-bf8f60db58a7@redhat.com>
Date: Mon, 24 Jun 2024 13:33:55 +0200
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/x86/siemens: add missing MODULE_DESCRIPTION()
 macros
To: Jeff Johnson <quic_jjohnson@quicinc.com>,
 Gerd Haeussler <gerd.haeussler.ext@siemens.com>,
 Xing Tong Wu <xingtong.wu@siemens.com>,
 Tobias Schaffner <tobias.schaffner@siemens.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org
References: <20240611-md-drivers-platform-x86-siemens-v1-1-b399d7d6ae64@quicinc.com>
Content-Language: en-US
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20240611-md-drivers-platform-x86-siemens-v1-1-b399d7d6ae64@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 6/12/24 6:25 AM, Jeff Johnson wrote:
> With ARCH=x86, make allmodconfig && make W=1 C=1 reports:
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/platform/x86/siemens/simatic-ipc.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/platform/x86/siemens/simatic-ipc-batt.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/platform/x86/siemens/simatic-ipc-batt-apollolake.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/platform/x86/siemens/simatic-ipc-batt-elkhartlake.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/platform/x86/siemens/simatic-ipc-batt-f7188x.o
> 
> Add the missing invocations of the MODULE_DESCRIPTION() macro.
> 
> Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>

Thank you for your patch, I've applied this patch to my review-hans 
branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans

Note it will show up in my review-hans branch once I've pushed my
local branch there, which might take a while.

I will include this patch in my next fixes pull-req to Linus
for the current kernel development cycle.

Regards,

Hans


> ---
>  drivers/platform/x86/siemens/simatic-ipc-batt-apollolake.c  | 1 +
>  drivers/platform/x86/siemens/simatic-ipc-batt-elkhartlake.c | 1 +
>  drivers/platform/x86/siemens/simatic-ipc-batt-f7188x.c      | 1 +
>  drivers/platform/x86/siemens/simatic-ipc-batt.c             | 1 +
>  drivers/platform/x86/siemens/simatic-ipc.c                  | 1 +
>  5 files changed, 5 insertions(+)
> 
> diff --git a/drivers/platform/x86/siemens/simatic-ipc-batt-apollolake.c b/drivers/platform/x86/siemens/simatic-ipc-batt-apollolake.c
> index 31a139d87d9a..5edc294de6e4 100644
> --- a/drivers/platform/x86/siemens/simatic-ipc-batt-apollolake.c
> +++ b/drivers/platform/x86/siemens/simatic-ipc-batt-apollolake.c
> @@ -45,6 +45,7 @@ static struct platform_driver simatic_ipc_batt_driver = {
>  
>  module_platform_driver(simatic_ipc_batt_driver);
>  
> +MODULE_DESCRIPTION("CMOS Battery monitoring for Simatic IPCs based on Apollo Lake GPIO");
>  MODULE_LICENSE("GPL");
>  MODULE_ALIAS("platform:" KBUILD_MODNAME);
>  MODULE_SOFTDEP("pre: simatic-ipc-batt platform:apollolake-pinctrl");
> diff --git a/drivers/platform/x86/siemens/simatic-ipc-batt-elkhartlake.c b/drivers/platform/x86/siemens/simatic-ipc-batt-elkhartlake.c
> index a7676f224075..e6a56d14b505 100644
> --- a/drivers/platform/x86/siemens/simatic-ipc-batt-elkhartlake.c
> +++ b/drivers/platform/x86/siemens/simatic-ipc-batt-elkhartlake.c
> @@ -45,6 +45,7 @@ static struct platform_driver simatic_ipc_batt_driver = {
>  
>  module_platform_driver(simatic_ipc_batt_driver);
>  
> +MODULE_DESCRIPTION("CMOS Battery monitoring for Simatic IPCs based on Elkhart Lake GPIO");
>  MODULE_LICENSE("GPL");
>  MODULE_ALIAS("platform:" KBUILD_MODNAME);
>  MODULE_SOFTDEP("pre: simatic-ipc-batt platform:elkhartlake-pinctrl");
> diff --git a/drivers/platform/x86/siemens/simatic-ipc-batt-f7188x.c b/drivers/platform/x86/siemens/simatic-ipc-batt-f7188x.c
> index 5e77e05fdb5d..f8849d0e48a8 100644
> --- a/drivers/platform/x86/siemens/simatic-ipc-batt-f7188x.c
> +++ b/drivers/platform/x86/siemens/simatic-ipc-batt-f7188x.c
> @@ -81,6 +81,7 @@ static struct platform_driver simatic_ipc_batt_driver = {
>  
>  module_platform_driver(simatic_ipc_batt_driver);
>  
> +MODULE_DESCRIPTION("CMOS Battery monitoring for Simatic IPCs based on Nuvoton GPIO");
>  MODULE_LICENSE("GPL");
>  MODULE_ALIAS("platform:" KBUILD_MODNAME);
>  MODULE_SOFTDEP("pre: simatic-ipc-batt gpio_f7188x platform:elkhartlake-pinctrl platform:alderlake-pinctrl");
> diff --git a/drivers/platform/x86/siemens/simatic-ipc-batt.c b/drivers/platform/x86/siemens/simatic-ipc-batt.c
> index c6dd263b4ee3..d9aff10608cf 100644
> --- a/drivers/platform/x86/siemens/simatic-ipc-batt.c
> +++ b/drivers/platform/x86/siemens/simatic-ipc-batt.c
> @@ -247,6 +247,7 @@ static struct platform_driver simatic_ipc_batt_driver = {
>  
>  module_platform_driver(simatic_ipc_batt_driver);
>  
> +MODULE_DESCRIPTION("CMOS core battery driver for Siemens Simatic IPCs");
>  MODULE_LICENSE("GPL");
>  MODULE_ALIAS("platform:" KBUILD_MODNAME);
>  MODULE_AUTHOR("Henning Schild <henning.schild@siemens.com>");
> diff --git a/drivers/platform/x86/siemens/simatic-ipc.c b/drivers/platform/x86/siemens/simatic-ipc.c
> index 8ca6e277fa03..7039874d8f11 100644
> --- a/drivers/platform/x86/siemens/simatic-ipc.c
> +++ b/drivers/platform/x86/siemens/simatic-ipc.c
> @@ -231,6 +231,7 @@ static void __exit simatic_ipc_exit_module(void)
>  module_init(simatic_ipc_init_module);
>  module_exit(simatic_ipc_exit_module);
>  
> +MODULE_DESCRIPTION("Siemens SIMATIC IPC platform driver");
>  MODULE_LICENSE("GPL v2");
>  MODULE_AUTHOR("Gerd Haeussler <gerd.haeussler.ext@siemens.com>");
>  MODULE_ALIAS("dmi:*:svnSIEMENSAG:*");
> 
> ---
> base-commit: 83a7eefedc9b56fe7bfeff13b6c7356688ffa670
> change-id: 20240611-md-drivers-platform-x86-siemens-9e7c20b9ca24
> 


