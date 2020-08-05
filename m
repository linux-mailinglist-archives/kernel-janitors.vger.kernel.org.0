Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0C85F23D167
	for <lists+kernel-janitors@lfdr.de>; Wed,  5 Aug 2020 22:00:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729844AbgHEUAC (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Wed, 5 Aug 2020 16:00:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45430 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727817AbgHEQkH (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 5 Aug 2020 12:40:07 -0400
Received: from mail-io1-xd41.google.com (mail-io1-xd41.google.com [IPv6:2607:f8b0:4864:20::d41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F728C03461E
        for <kernel-janitors@vger.kernel.org>; Wed,  5 Aug 2020 05:58:11 -0700 (PDT)
Received: by mail-io1-xd41.google.com with SMTP id g14so8274123iom.0
        for <kernel-janitors@vger.kernel.org>; Wed, 05 Aug 2020 05:58:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=LFybYJP0K+xpoNJr8Cd8LznlTLy8/ls0ruKF8gVrCrc=;
        b=XGBhzGghZj17zgNv/PX3ePTOX90VbQbHien8EpuiclPdgGDihzBtlhioQKZHo8/tNS
         UscvgxL7YUUw19Q6vo7J3nJf+NVPXRCBQv10ZDT6WOgBEV/STUh33iwil3Z3ofI7Sj93
         jR4AJ3Rc15T4OCx7BDESaalXbDcgDO1ZcHLGQlAtY6vF6iFIzIlel+8BqHK6qiohe4Oz
         7GEQwblrT0rrP1Bp56YpzNF3V49UgAKMccsbZVOoRuF7apRfgPlzvRMiPaLLb8scNPD6
         Xrh7hQFmVF5BtI+Ra1bjXXSMckPMHV9fT+Mtvpvm1jPA1/NmW6MVFB2j2/b3733AycxF
         8L4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=LFybYJP0K+xpoNJr8Cd8LznlTLy8/ls0ruKF8gVrCrc=;
        b=q+2xMo1A7uxtsYXsBsBrcNpwWEjnWBFyQ1VavcUVeHKdql4LS6UG5m21738Qc7bfeM
         ecdjY92Wp7MHE+rV7OnGFkiW+N/kzrGDhK9+aypv5ujG3CV4dyeTwK0LV3ZM38Yx38mq
         Ns/XWWAcjIJK4Bn5YbPksz8aNcmetI4GUi6DIVDG0B+ZVpE1/PW3g47p6nwrAn7BZCUj
         jw2yF7L9xHDD+wUwXWchHadhl2aIjUpVYWzr3dNYZE+YfwgVaZ1/gZ6MYW2nP8cQmI1n
         ihEYZ3YCCvR5zOWesY3o5RbQfshq6O3X7MPqFAXeSFVe27OURQP7MzFoXpItV1LPnQgo
         qlCQ==
X-Gm-Message-State: AOAM532JHUlE9hKuwUqq4fO0Fr5HM5h1JVxCFfFVn/0Uxp96n85qiDbO
        V8/1l7O9DDu89Y/QrRCLz+m25g==
X-Google-Smtp-Source: ABdhPJyrOWxqgs9tWgFajQY3gEAPaM/Qdc8BZUVmTFaz01Vj8R+YcF2s8wH3ny7m1URSfY+Oel+fbQ==
X-Received: by 2002:a05:6638:bc2:: with SMTP id g2mr4208605jad.21.1596632288715;
        Wed, 05 Aug 2020 05:58:08 -0700 (PDT)
Received: from [172.22.22.26] (c-73-185-129-58.hsd1.mn.comcast.net. [73.185.129.58])
        by smtp.googlemail.com with ESMTPSA id m2sm1140711ilc.26.2020.08.05.05.58.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Aug 2020 05:58:07 -0700 (PDT)
Subject: Re: [greybus-dev] [PATCH] staging: greybus: audio: Uninitialized
 variable in gbaudio_remove_controls()
To:     Dan Carpenter <dan.carpenter@oracle.com>,
        Johan Hovold <johan@kernel.org>,
        Vaibhav Agarwal <vaibhav.sr@gmail.com>
Cc:     devel@driverdev.osuosl.org, Alex Elder <elder@kernel.org>,
        kernel-janitors@vger.kernel.org, greybus-dev@lists.linaro.org
References: <20200804101601.GA392148@mwanda>
From:   Alex Elder <elder@linaro.org>
Message-ID: <655f7d92-308e-6c33-e517-2142f767d114@linaro.org>
Date:   Wed, 5 Aug 2020 07:58:06 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200804101601.GA392148@mwanda>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On 8/4/20 5:16 AM, Dan Carpenter wrote:
> The "err" variable is not meaningful so there is no need to print it.
> It's uninitialized on the first iteration through the loop.
> 
> Fixes: 510e340efe0c ("staging: greybus: audio: Add helper APIs for dynamic audio modules")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

This is a good fix, thanks.

Reviewed-by: Alex Elder <elder@linaro.org>

> ---
>  drivers/staging/greybus/audio_helper.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/greybus/audio_helper.c b/drivers/staging/greybus/audio_helper.c
> index 8b100a71f02e..237531ba60f3 100644
> --- a/drivers/staging/greybus/audio_helper.c
> +++ b/drivers/staging/greybus/audio_helper.c
> @@ -173,8 +173,7 @@ static int gbaudio_remove_controls(struct snd_card *card, struct device *dev,
>  		id.index = control->index;
>  		kctl = snd_ctl_find_id(card, &id);
>  		if (!kctl) {
> -			dev_err(dev, "%d: Failed to find %s\n", err,
> -				control->name);
> +			dev_err(dev, "Failed to find %s\n", control->name);
>  			continue;
>  		}
>  		err = snd_ctl_remove(card, kctl);
> 

