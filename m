Return-Path: <kernel-janitors+bounces-5860-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 32B529916F4
	for <lists+kernel-janitors@lfdr.de>; Sat,  5 Oct 2024 15:16:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AA2EE1F229E3
	for <lists+kernel-janitors@lfdr.de>; Sat,  5 Oct 2024 13:16:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C714115278E;
	Sat,  5 Oct 2024 13:16:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dYLI82jO"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97E8D7F6
	for <kernel-janitors@vger.kernel.org>; Sat,  5 Oct 2024 13:16:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728134170; cv=none; b=WB064yOspcig2bvtK5CW8XISGPqqk+iJwOCeqXRk14ZYdCyucveq/Nwafv6YgheRydi/MUAWf88qI9GTGfMd5lWhyDEF20BISDMkNck81PZpDSqzLYCrpk+uufHfaz8VewsWRzBGH0UIZN+ZD8H5eQOYOHO10qrtXLgYhVZUJHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728134170; c=relaxed/simple;
	bh=SnCouw/0CAfr+j4atpTs6tFU262mQXs1o9AF4aVWNIo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=stzfSwLGf7OojWkjWZOC8vZlGSMVNsmuZEUzSyG7AC/6iRMWN8voiEwneZcqVvXJ5d5NC9gY/U1YvO1g/2aPxxrRGPuNRIAocSMpd28ct+UgYS6NnrVmqc7eLNJxJgBp7YfYuTbfdgoXhpS1yOhXUaz1NnGtex9btLRaAsBLP2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=dYLI82jO; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1728134167;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NtXWlJU5HafQ0O79u3ZV8qo7ew1Goc3SkHZ1tqX1xb0=;
	b=dYLI82jOQcziQ/YISSuliT2GbcFo1AgKOYlb/yJhS02vlJs6pcfvRt80FOcYZOFO+12UN+
	9REQECMmFnOrz6ccWoG32sAGNDK1/78nxOT9EDetoCVoLny1Ti4my07ylRWSdjKjjiO+h1
	2jrhapT7zE/yMe1oxkhE4UnA/HxEEcY=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-632-c71QJftaOkG34wAxWdCCLw-1; Sat, 05 Oct 2024 09:16:05 -0400
X-MC-Unique: c71QJftaOkG34wAxWdCCLw-1
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-37cd4acb55aso2345071f8f.0
        for <kernel-janitors@vger.kernel.org>; Sat, 05 Oct 2024 06:16:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728134165; x=1728738965;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NtXWlJU5HafQ0O79u3ZV8qo7ew1Goc3SkHZ1tqX1xb0=;
        b=tfSgRq/6f5b3LyeKAA/0vDn8yefl3klKChxve2kIN99t/uRWZ6JSxJ5cNnpGavE2dt
         U9xbK/zuK1cfM9zmwTgf0obB+IrxmWXhNY5/wj1kdzMZ3F0+12DZFyVusP5ubFdIBCpQ
         z61F6X0TRbqnrSpteD3IBNw5CM2IiylolmpbxtD7NaIP+EmAYjNMxkF0J4XVptkurjJR
         scwQatPJ9M3xNAY4Ogoomh68H5cjEYF4XcqgFp6FnZMpYUZpvnM11/n+bgdhQmhlDIon
         rLmObIguVE+UhcA5xH9kf1Vb+g3mUHuzBVAe2ZpsyefhEyRq32d4y9S44OOBjiGygmsi
         rE7g==
X-Gm-Message-State: AOJu0YwUz2W+qoH7/QrNQ7WtdRl1oYqv8sGRtxvr7j6t20orHQ04hkDB
	ARQ2oelKON8tt28CNaA0eUPj9BHgNfqW4pZPPboeCTjkmCtQ3RjfJRkbITzf9Bcvz9DbMlXPb9B
	wOI+RKVJpotwcrID1DPNMkIaZb0CFMszrieGdJT0KNvgYborqAQtMoYN6P3pq1yuDeg==
X-Received: by 2002:a05:6000:400d:b0:37c:cea2:826f with SMTP id ffacd0b85a97d-37d0e6ea949mr6837615f8f.2.1728134164626;
        Sat, 05 Oct 2024 06:16:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFHIVFOTI5XI6jlg/ZTrlk/dkgYkJ/jdRmq2oxhmffIjVYZZkCgnpltydn6NVaGkYR5Aejtig==
X-Received: by 2002:a05:6000:400d:b0:37c:cea2:826f with SMTP id ffacd0b85a97d-37d0e6ea949mr6837593f8f.2.1728134164290;
        Sat, 05 Oct 2024 06:16:04 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a992e784666sm131559566b.100.2024.10.05.06.16.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 05 Oct 2024 06:16:03 -0700 (PDT)
Message-ID: <a2170a4a-d994-4729-9ade-aa20de4fefa1@redhat.com>
Date: Sat, 5 Oct 2024 15:16:02 +0200
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/x86:intel/pmc: fix IS_ENABLED() check
To: Lukas Bulwahn <lbulwahn@redhat.com>,
 Rajneesh Bhardwaj <irenic.rajneesh@gmail.com>,
 David E Box <david.e.box@intel.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Arnd Bergmann <arnd@arndb.de>, Daniel Lezcano <daniel.lezcano@linaro.org>,
 platform-driver-x86@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 Lukas Bulwahn <lukas.bulwahn@redhat.com>
References: <20240924084056.48447-1-lukas.bulwahn@redhat.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20240924084056.48447-1-lukas.bulwahn@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

Lukas, thank you for your patch.

On 24-Sep-24 10:40 AM, Lukas Bulwahn wrote:
> From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
> 
> Commit d7a87891e2f5 ("platform/x86:intel/pmc: fix build regression with
> pmtimer turned off") accidentally slips in some CONFIG_CONFIG_X86_PM_TIMER
> (note the duplicated CONFIG prefix) in the IS_ENABLED() check.
> 
> Fortunately, ./scripts/checkkconfigsymbols.py notices this accident. Fix up
> the IS_ENABLED() check with the intended config name.
> 
> Fixes: d7a87891e2f5 ("platform/x86:intel/pmc: fix build regression with pmtimer turned off")
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>

I see that d7a87891e2f5 ("platform/x86:intel/pmc: fix build
regression with pmtimer turned off") does not exist in
Torvald's tree yet.

This comes from http://git.linaro.org/people/daniel.lezcano/linux.git/log/?h=timers/drivers/next

Daniel, I appreciate you picking this up, but now that everything
has been merged together again in v6.12-rc1 I would prefer to
handle any further changes limited to drivers/platform/x86/intel/
through the pdx86 tree.

Also since this is a build fix it really should be send as a fix
fro the 6.12 cycle.

Daniel judging by the timers/drivers/next branch name I guess these
are not fixes targeting 6.12, right ?

In that case can you please drop d7a87891e2f5 ("platform/x86:intel/pmc:
fix build regression with pmtimer turned off") ?  Then I'll pick that
up and squash in this typo fix.

Or if you do plan to send things out as fixes to Linus, then please
add this patch too.

Regards,

Hans





> ---
>  drivers/platform/x86/intel/pmc/core.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/platform/x86/intel/pmc/core.c b/drivers/platform/x86/intel/pmc/core.c
> index 0431a599ba26..4387b5103701 100644
> --- a/drivers/platform/x86/intel/pmc/core.c
> +++ b/drivers/platform/x86/intel/pmc/core.c
> @@ -1546,7 +1546,7 @@ static int pmc_core_probe(struct platform_device *pdev)
>  			       pmc_core_adjust_slp_s0_step(primary_pmc, 1));
>  
>  	map = primary_pmc->map;
> -	if (IS_ENABLED(CONFIG_CONFIG_X86_PM_TIMER) &&
> +	if (IS_ENABLED(CONFIG_X86_PM_TIMER) &&
>  	    map->acpi_pm_tmr_ctl_offset)
>  		acpi_pmtmr_register_suspend_resume_callback(pmc_core_acpi_pm_timer_suspend_resume,
>  							 pmcdev);
> @@ -1563,7 +1563,7 @@ static void pmc_core_remove(struct platform_device *pdev)
>  	const struct pmc *pmc = pmcdev->pmcs[PMC_IDX_MAIN];
>  	const struct pmc_reg_map *map = pmc->map;
>  
> -	if (IS_ENABLED(CONFIG_CONFIG_X86_PM_TIMER) &&
> +	if (IS_ENABLED(CONFIG_X86_PM_TIMER) &&
>  	    map->acpi_pm_tmr_ctl_offset)
>  		acpi_pmtmr_unregister_suspend_resume_callback();
>  


