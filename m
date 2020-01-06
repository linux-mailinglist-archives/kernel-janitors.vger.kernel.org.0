Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 191581313DA
	for <lists+kernel-janitors@lfdr.de>; Mon,  6 Jan 2020 15:40:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726467AbgAFOkO (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Mon, 6 Jan 2020 09:40:14 -0500
Received: from mail-wr1-f68.google.com ([209.85.221.68]:39961 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726303AbgAFOkN (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 6 Jan 2020 09:40:13 -0500
Received: by mail-wr1-f68.google.com with SMTP id c14so49845226wrn.7
        for <kernel-janitors@vger.kernel.org>; Mon, 06 Jan 2020 06:40:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:autocrypt:organization:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=7eUvJTSlSuf2nqxGLFafW7DiwXtpRvmtmLkuYANuajc=;
        b=WuLLNNQCQvLJeF7rsGrFGVPBwgw6XzSHTNMZjk4iRHt1lnjZU3Sm1+tdOvPZIATIsA
         nOolD8wfAzx1WPQ9suFMvJtq7gEFxXbLU4HpZHr3Yh088C7D1fHyaZU1rqNPbmI09Q2Z
         yrCSnm1EDInTdNVJUWmy28qHpd7IK2+w6r6R9UNlOJvYUab+ACmB5QryApa+Fg//8LMY
         B2rjT/o5+LbEAcLW8yMznD6AehDYHYIyBm/vLgfGOp9LhK85krrd8R6L/6AWXY1LJNsR
         FEzcscXASSJv7yfIaZqFNyp7Ho8y3LwQKBU2fBGgMMgnHJhbL5phQY74SoZhnw2wtlJF
         sPtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:autocrypt
         :organization:message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=7eUvJTSlSuf2nqxGLFafW7DiwXtpRvmtmLkuYANuajc=;
        b=tqlq+y0N4SILXQ2u7gmNAu3wGd+uiMajGSwySqVfOR3B47fE20u7xaa/kwKm+Gxfpa
         2epnkYfsXNAHuLboGlKtB228e7K9TbfOUXNJtRwLMO8qoxyEykEiqE/k+OMbGZfHznsn
         Cj3guxCjdARlNWbaqa6BnHmq8riJmBMFdDRb4EsQYgpHHK9ObCunbB2WjKHEn2OCWg0T
         mfmyG45OK3xdq+S8812auZRMsb/RN1YAXh8UtpkTq0outxL+5/OnmlNkelcTCuvO7Zqz
         T0u802FN2SajVp5F6Wtn8qbUCSDBEJDp20qtQTasfh6Fi9Gu1xOZcgT8fxSuzlxfEnaN
         zSZg==
X-Gm-Message-State: APjAAAV1jwL1Rycpnt0OVBR4cEykuoSyBdwee/fIDI/grmjCzJs2xIhe
        FcIj42ByWcgfxE2jd4/p3zzyQAIiHOfSBA==
X-Google-Smtp-Source: APXvYqzSBfjXYIdW6Mt/MPZEeEwKE2x29GqGOIp2n9XmZmOEcy9GzBVV4v4OgRTV7eApFFRZYOrWFg==
X-Received: by 2002:adf:90e7:: with SMTP id i94mr100745504wri.47.1578321611019;
        Mon, 06 Jan 2020 06:40:11 -0800 (PST)
Received: from [10.1.2.12] (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id q6sm77351194wrx.72.2020.01.06.06.40.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jan 2020 06:40:10 -0800 (PST)
Subject: Re: [PATCH 15/16] drm: bridge: dw-hdmi: constify copied structure
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Julia Lawall <Julia.Lawall@inria.fr>
Cc:     Andrzej Hajda <a.hajda@samsung.com>,
        kernel-janitors@vger.kernel.org, Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <1577864614-5543-1-git-send-email-Julia.Lawall@inria.fr>
 <1577864614-5543-16-git-send-email-Julia.Lawall@inria.fr>
 <20200101145242.GA4855@pendragon.ideasonboard.com>
From:   Neil Armstrong <narmstrong@baylibre.com>
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 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
 BSwxi7g3Mu7u5kUByanqHyA=
Organization: Baylibre
Message-ID: <6fe74afe-6fc3-b1e5-56a3-dd5b9e3c2d62@baylibre.com>
Date:   Mon, 6 Jan 2020 15:40:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200101145242.GA4855@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On 01/01/2020 15:52, Laurent Pinchart wrote:
> Hi Julia,
> 
> Thank you for the patch.
> 
> On Wed, Jan 01, 2020 at 08:43:33AM +0100, Julia Lawall wrote:
>> The dw_hdmi_hw structure is only copied into another structure,
>> so make it const.
>>
>> The opportunity for this change was found using Coccinelle.
>>
>> Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> 
>> ---
>>  drivers/gpu/drm/bridge/synopsys/dw-hdmi-ahb-audio.c |    2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-ahb-audio.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-ahb-audio.c
>> index 2b7539701b42..dd56996fe9c7 100644
>> --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-ahb-audio.c
>> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-ahb-audio.c
>> @@ -291,7 +291,7 @@ static irqreturn_t snd_dw_hdmi_irq(int irq, void *data)
>>  	return IRQ_HANDLED;
>>  }
>>  
>> -static struct snd_pcm_hardware dw_hdmi_hw = {
>> +static const struct snd_pcm_hardware dw_hdmi_hw = {
>>  	.info = SNDRV_PCM_INFO_INTERLEAVED |
>>  		SNDRV_PCM_INFO_BLOCK_TRANSFER |
>>  		SNDRV_PCM_INFO_MMAP |
> 

Applied to drm-misc-next

Neil
