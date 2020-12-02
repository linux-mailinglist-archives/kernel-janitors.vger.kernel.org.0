Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CA7F22CC164
	for <lists+kernel-janitors@lfdr.de>; Wed,  2 Dec 2020 16:55:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730516AbgLBPzh (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Wed, 2 Dec 2020 10:55:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55922 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728445AbgLBPzg (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 2 Dec 2020 10:55:36 -0500
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 762E6C0613CF
        for <kernel-janitors@vger.kernel.org>; Wed,  2 Dec 2020 07:54:56 -0800 (PST)
Received: by mail-wm1-x341.google.com with SMTP id 3so9370909wmg.4
        for <kernel-janitors@vger.kernel.org>; Wed, 02 Dec 2020 07:54:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=9wSfeNEgiqafNB08squR/RO3i+fVSAtbeRf4xlfoOdo=;
        b=bz7pVrUHwPtzzjD6kMxKQOPOXMXIJbwt0qyGNtJuLCV7WHkHz3FtwjEFuzmlFYhyfo
         mWIuY67ZYpCZzNlFArdYsfozCpZykf+9i6Zx57MvGrpAPDb0oagQoixuYgPre0Q5iRPN
         9My/+gS6DrrB4hqFt4vkqIBqRNiMB+t3B5wM8cds7auXL7i4ObSFypOv+R6KMruxz8Oo
         HYXjStNj7L9v/8md4wgpfaN4zW0SCDnw9IEBfPqxzO0vHOqpkKNCleoSHyLl3ngW326d
         b4rnbiY8ExhaLXfQeAbiqHE0qLTUEYYlDOsm1/6HuzrBH7I4JpWHogIoyGSU5LgDflzb
         M84w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=9wSfeNEgiqafNB08squR/RO3i+fVSAtbeRf4xlfoOdo=;
        b=qagtu1hoVgeYHDILT/BZpJzrAQBaqFc8gD1CeXs7Ej53LlfvF9eqxVStE8l+Y5R+Kz
         kh8CyYE2sJz7as6i85HX8kjd9uV7xjSSyZmeHCZxvmT8sz9BBkzUJPzTYIA48MIcgcrC
         BiucadKoaePTbqYuHwczPBwMOCKBaGNF0TskpW+0nDTEUI7GxU8J3kDbeotn68MlHOqP
         Kao+rNmTkL50JiODO9Aqu/174jdnjRmckBC9x9hXV1BXw0Mgpmmd8f/5wgrookHzPQZp
         SHZgj1rFn+KnJSNbrjFBgE4WwV1wDk8XcpbO/Z+AsvpLEarRyE8AxJzIypZ/Gxn0nyvK
         Zizg==
X-Gm-Message-State: AOAM531ORIWW8KIECzX7XkMSbWpqkcIk6PwpfMyvU5oQlMnU8Akr9CGk
        QvSZRXnsuP+RyoSyL8PU91x2h+cYVvftABvb
X-Google-Smtp-Source: ABdhPJyX2g86rZ8Ob/k4O48RvuqMC9+TIF5kVxAf3vcYk0Ut3B+GysUn9LRWJCDlMDNL5PxGG4ZXqA==
X-Received: by 2002:a7b:ca4c:: with SMTP id m12mr3797813wml.11.1606924494939;
        Wed, 02 Dec 2020 07:54:54 -0800 (PST)
Received: from [192.168.86.34] (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
        by smtp.googlemail.com with ESMTPSA id h2sm2577163wrv.76.2020.12.02.07.54.53
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 02 Dec 2020 07:54:54 -0800 (PST)
Subject: Re: [PATCH] ASoC: codecs: lpass-va-macro: remove some dead code
To:     Dan Carpenter <dan.carpenter@oracle.com>,
        Liam Girdwood <lgirdwood@gmail.com>
Cc:     Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
        alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org
References: <X8c5gjZO7YN/CFsq@mwanda>
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <7e06abb2-a969-aa1a-6adc-6cdd72e3355c@linaro.org>
Date:   Wed, 2 Dec 2020 15:54:53 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <X8c5gjZO7YN/CFsq@mwanda>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Thanks Dan for the patch!

Do you use any tools to do this checks?


On 02/12/2020 06:51, Dan Carpenter wrote:
> The "decimator" variable is in the 0-7 range and it's unsigned so there
> is no need to check for negative values.
> 
> Fixes: 908e6b1df26e ("ASoC: codecs: lpass-va-macro: Add support to VA Macro")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

> ---
>   sound/soc/codecs/lpass-va-macro.c | 15 ++++-----------
>   1 file changed, 4 insertions(+), 11 deletions(-)
> 
> diff --git a/sound/soc/codecs/lpass-va-macro.c b/sound/soc/codecs/lpass-va-macro.c
> index 3e6bbef26dcb..91e6890d6efc 100644
> --- a/sound/soc/codecs/lpass-va-macro.c
> +++ b/sound/soc/codecs/lpass-va-macro.c
> @@ -844,17 +844,10 @@ static int va_macro_hw_params(struct snd_pcm_substream *substream,
>   
>   	for_each_set_bit(decimator, &va->active_ch_mask[dai->id],
>   			 VA_MACRO_DEC_MAX) {
> -		if (decimator >= 0) {
> -			tx_fs_reg = CDC_VA_TX0_TX_PATH_CTL +
> -				    VA_MACRO_TX_PATH_OFFSET * decimator;
> -			snd_soc_component_update_bits(component, tx_fs_reg,
> -						0x0F, tx_fs_rate);
> -		} else {
> -			dev_err(va_dev,
> -				"%s: ERROR: Invalid decimator: %d\n",
> -				__func__, decimator);
> -			return -EINVAL;
> -		}
> +		tx_fs_reg = CDC_VA_TX0_TX_PATH_CTL +
> +			    VA_MACRO_TX_PATH_OFFSET * decimator;
> +		snd_soc_component_update_bits(component, tx_fs_reg, 0x0F,
> +					      tx_fs_rate);
>   	}
>   	return 0;
>   }
> 
