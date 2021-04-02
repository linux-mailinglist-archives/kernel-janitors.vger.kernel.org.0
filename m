Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2E817352EF0
	for <lists+kernel-janitors@lfdr.de>; Fri,  2 Apr 2021 20:06:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235836AbhDBSGV (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Fri, 2 Apr 2021 14:06:21 -0400
Received: from mail1.perex.cz ([77.48.224.245]:55518 "EHLO mail1.perex.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234628AbhDBSGV (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 2 Apr 2021 14:06:21 -0400
Received: from mail1.perex.cz (localhost [127.0.0.1])
        by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id A592BA0046;
        Fri,  2 Apr 2021 19:57:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz A592BA0046
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
        t=1617386245; bh=RVleIpY/mLf83IbsmzQeD3t+vKouLd0KP0S9kGC+PyI=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=ZO3ELAp+9aTtTlksGGNOMC/vhBK/6WQIH3zM4exTvo7pDYqIUbjsSpO4VrY32CnCv
         R3o2OI9le8BGs/DOeWGDSakT0tphzDuP+/CrVk2tNmvNhUq7zlLFTe2YVbrzHCfb5l
         c0sKHQT/ybGAeSH6V0QCFNzRtFAuIDduZNdL5auQ=
Received: from p1gen2.localdomain (unknown [192.168.100.98])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: perex)
        by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
        Fri,  2 Apr 2021 19:57:21 +0200 (CEST)
Subject: Re: [PATCH 1/2] ALSA: control - fix a leak in snd_ctl_led_init()
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
        kernel-janitors@vger.kernel.org
References: <YGcDETcdqVUIl1+y@mwanda>
From:   Jaroslav Kysela <perex@perex.cz>
Message-ID: <ec7285f6-a257-d7a4-5cae-b36c95ef9efd@perex.cz>
Date:   Fri, 2 Apr 2021 19:57:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <YGcDETcdqVUIl1+y@mwanda>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Dne 02. 04. 21 v 13:42 Dan Carpenter napsal(a):
> This unwind loop needs to free snd_ctl_leds[0] as well.
> 
> Fixes: cb17fe0045aa ("ALSA: control - add sysfs support to the LED trigger module")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  sound/core/control_led.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/sound/core/control_led.c b/sound/core/control_led.c
> index d4fb8b873f34..202b475d0bf3 100644
> --- a/sound/core/control_led.c
> +++ b/sound/core/control_led.c
> @@ -712,7 +712,7 @@ static struct snd_ctl_layer_ops snd_ctl_led_lops = {
>  static int __init snd_ctl_led_init(void)
>  {
>  	struct snd_ctl_led *led;
> -	unsigned int group;
> +	int group;
>  
>  	device_initialize(&snd_ctl_led_dev);
>  	snd_ctl_led_dev.class = sound_class;
> @@ -730,7 +730,7 @@ static int __init snd_ctl_led_init(void)
>  		dev_set_name(&led->dev, led->name);
>  		if (device_add(&led->dev)) {
>  			put_device(&led->dev);
> -			for (; group > 0; group--) {
> +			for (; group >= 0; group--) {
>  				led = &snd_ctl_leds[group];

It's not correct. This assignent should be 'led = &snd_ctl_leds[group - 1];'
without other changes, because the put_device() is enough when device_add() fails.

Could you resend the correction?

					Jaroslav

>  				device_del(&led->dev);
>  			}
> 


-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
