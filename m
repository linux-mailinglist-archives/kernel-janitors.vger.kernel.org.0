Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 039D214A5C0
	for <lists+kernel-janitors@lfdr.de>; Mon, 27 Jan 2020 15:09:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728931AbgA0OJU (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Mon, 27 Jan 2020 09:09:20 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:21487 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728899AbgA0OJU (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 27 Jan 2020 09:09:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1580134158;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=J0tWyHYw98UjELXx0eG2rBwfSBPRrMQ58+BFQIrIctE=;
        b=EiNRxAfnaoi8LrUk7DWl+WZfAOF2z+NNOYsooU5MsocWzEgyWBhiSLt0kXF7cc57/HdE43
        Aj6asnaOAM0u22UGLtgn/o+O1oFhI6RYHEcheT2Kb7def8V8AQNo0a0y4kLIDBj3mwcDGl
        eTsixNsZ6aOsQ3CiErUPATJRtWiWCcE=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-143-gEv1iovLPvmwllRTsXzQ5g-1; Mon, 27 Jan 2020 09:09:17 -0500
X-MC-Unique: gEv1iovLPvmwllRTsXzQ5g-1
Received: by mail-wr1-f70.google.com with SMTP id r2so6095653wrp.7
        for <kernel-janitors@vger.kernel.org>; Mon, 27 Jan 2020 06:09:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=J0tWyHYw98UjELXx0eG2rBwfSBPRrMQ58+BFQIrIctE=;
        b=YZJ2ogZP8eTm7AgKt1DK/d7saySD3r4yLg63JhhWzEhR1vWRd1Q0W3h9/QdFSnnbIj
         /iaoUF+Fa0hDwZKISkU5GcPJdo+EkFF8aoYyEvrNBF7PTO+9AQLAlDHvVSlQ0bxSfQ1+
         C//rBW213Hek8ZD39MAxTP4zYUvSZtm35iJt0EoKM/K6ofRvAjEJh7sNlN4Lp73PUChl
         ghVFB9TOFfMwc2bvykz/ac4rZStAQNzfij+dYyJegFoozTyudAayZHLbb5nA799ERZpv
         LzWHQ65bwXdXyddU9giHlzZBTubh1QVqSckLoRGw1ZMYWrcVrx/Xbl2iHT3M85HnSng4
         yRjw==
X-Gm-Message-State: APjAAAV/U4VmT2rgW8I5mKuCZgIypAUO2A1vjQzVOwJRiGyxA8dBlDW+
        qgnO9NzkyFH2UybXNJGEangeEHSBdKCc/zHrwsjjvj4GNavqjukALZYVzq2yuD7JosXs34N0ziK
        9Lg5EgRyMytsQB+CpSnVMFFdLMuVk
X-Received: by 2002:a1c:9d08:: with SMTP id g8mr13430011wme.141.1580134155793;
        Mon, 27 Jan 2020 06:09:15 -0800 (PST)
X-Google-Smtp-Source: APXvYqxL1mkRTXScdallzJa6atatfMWFPsRST+u2+CId8f49QKDBROlfW8LGzAMTi5X6FzaKHo4AVQ==
X-Received: by 2002:a1c:9d08:: with SMTP id g8mr13430001wme.141.1580134155613;
        Mon, 27 Jan 2020 06:09:15 -0800 (PST)
Received: from shalem.localdomain (2001-1c00-0c0c-fe00-7e79-4dac-39d0-9c14.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:7e79:4dac:39d0:9c14])
        by smtp.gmail.com with ESMTPSA id x11sm19143881wmg.46.2020.01.27.06.09.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jan 2020 06:09:15 -0800 (PST)
Subject: Re: [PATCH] staging: rtl8723bs: fix copy of overlapping memory
To:     Colin King <colin.king@canonical.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        devel@driverdev.osuosl.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20200126220549.9849-1-colin.king@canonical.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <32254b45-be59-a83b-0036-6a6d9fe86379@redhat.com>
Date:   Mon, 27 Jan 2020 15:09:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200126220549.9849-1-colin.king@canonical.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

HI,

On 26-01-2020 23:05, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Currently the rtw_sprintf prints the contents of thread_name
> onto thread_name and this can lead to a potential copy of a
> string over itself. Avoid this by printing the literal string RTWHALXT
> instread of the contents of thread_name.
> 
> Addresses-Coverity: ("copy of overlapping memory")
> Fixes: 554c0a3abf21 ("staging: Add rtl8723bs sdio wifi driver")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans


> ---
>   drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c | 5 ++---
>   1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c b/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c
> index b44e902ed338..890e0ecbeb2e 100644
> --- a/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c
> +++ b/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c
> @@ -476,14 +476,13 @@ int rtl8723bs_xmit_thread(void *context)
>   	s32 ret;
>   	struct adapter *padapter;
>   	struct xmit_priv *pxmitpriv;
> -	u8 thread_name[20] = "RTWHALXT";
> -
> +	u8 thread_name[20];
>   
>   	ret = _SUCCESS;
>   	padapter = context;
>   	pxmitpriv = &padapter->xmitpriv;
>   
> -	rtw_sprintf(thread_name, 20, "%s-"ADPT_FMT, thread_name, ADPT_ARG(padapter));
> +	rtw_sprintf(thread_name, 20, "RTWHALXT-" ADPT_FMT, ADPT_ARG(padapter));
>   	thread_enter(thread_name);
>   
>   	DBG_871X("start "FUNC_ADPT_FMT"\n", FUNC_ADPT_ARG(padapter));
> 

