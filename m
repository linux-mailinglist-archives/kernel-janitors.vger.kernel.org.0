Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B78C52D0E58
	for <lists+kernel-janitors@lfdr.de>; Mon,  7 Dec 2020 11:45:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726328AbgLGKot (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Mon, 7 Dec 2020 05:44:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:42056 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726327AbgLGKos (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 7 Dec 2020 05:44:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1607337802;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=pwKlCP/t2sQULfcoxLw2Zg751ofmdpjb51ZHupMe4Mc=;
        b=Xu9n/oKTmwwsgUmrr5GFYMYt6xD3thh24YfCrgg0E+VB6ajOzIn5eAo9tKqPRV7NnByIaH
        Gr+od6NBlZ/AsiY5XkHMXHelYljiTU7ksXiK9dKCszw43cv3cd3ND2Lpux/WAKj5giyQHH
        F+mvR03/Ho+YTjNI28oIcob/EwOgei8=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-208-Rkw9WPTHM-m6n9W-rfJ_tg-1; Mon, 07 Dec 2020 05:43:20 -0500
X-MC-Unique: Rkw9WPTHM-m6n9W-rfJ_tg-1
Received: by mail-ej1-f71.google.com with SMTP id t17so3739010ejd.12
        for <kernel-janitors@vger.kernel.org>; Mon, 07 Dec 2020 02:43:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=pwKlCP/t2sQULfcoxLw2Zg751ofmdpjb51ZHupMe4Mc=;
        b=MVaRXsote6CVrtvnbmGge8ZtAq3WfKazXYbaxgIPzI45/b4mJi0CB+i25rb0z2olBQ
         8++boNy6tZUd6oeUDX8/twj3Odsh1WlAHQvmqGKAmbrf2a0gufett8IH8IxNwim3i/ek
         9Bc+7UtyvvxboaBhi2Ui9j4U1RGTxcvuMS/OUe687YsdeSHM/f5AT0GzF95n9oe/ihz0
         vxnQcFAwETOSTtp3O+lfD3jX1/XGBm+Y7oPVZJEfiTIbz33qyYxoEA0B3nDvVgMdJSDL
         Xv4Q6MHf7RnndKmsg8Fkl9mefd717r9puk/tOtijKaaQ+D16RmhO5m/LRGosZEOfM+Wy
         fXEg==
X-Gm-Message-State: AOAM531IQf6PXmrU4xbtCPRyXVwvbhs6KVm1OjD1wlpv7B0Hxgu4unnE
        t7DMtuxUBigwuNCr3gEjFyOwqTsDPv8jv65M3kFyqmvP/lup58PmwPPkCQK/BaquYGxHLmKw2Eh
        a5XSb6NwtQOv3QJ063tMh7BzGysDmqxZTyr3WvQlancXuuDknHP/0Cwhya55r4LRfj/TBh+aGTH
        zosv6B
X-Received: by 2002:a17:906:c087:: with SMTP id f7mr12651114ejz.492.1607337798947;
        Mon, 07 Dec 2020 02:43:18 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw8JoAbJ32CqoOcnxFU/qzKXyjlj3mNwmNSdY9XWaaUcbruFvVgrRWFEt76gKFin9C0Bq5aZA==
X-Received: by 2002:a17:906:c087:: with SMTP id f7mr12651095ejz.492.1607337798716;
        Mon, 07 Dec 2020 02:43:18 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
        by smtp.gmail.com with ESMTPSA id u23sm11668922ejy.87.2020.12.07.02.43.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Dec 2020 02:43:18 -0800 (PST)
Subject: Re: [PATCH] x86/platform/uv: Fix an error code in uv_hubs_init()
To:     "Ernst, Justin" <justin.ernst@hpe.com>,
        Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Mark Gross <mgross@linux.intel.com>, Borislav Petkov <bp@suse.de>,
        "Wahl, Steve" <steve.wahl@hpe.com>,
        "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>,
        "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>
References: <X8eoN/jMAJb3H3iv@mwanda>
 <AT5PR8401MB1300A04A58C46C822424F46787F30@AT5PR8401MB1300.NAMPRD84.PROD.OUTLOOK.COM>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <9e3c4e1c-b7fa-1b1f-342d-cb23e0065a56@redhat.com>
Date:   Mon, 7 Dec 2020 11:43:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <AT5PR8401MB1300A04A58C46C822424F46787F30@AT5PR8401MB1300.NAMPRD84.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hi,

On 12/2/20 9:50 PM, Ernst, Justin wrote:
>> Return -ENOMEM on allocation failure instead of returning success.
>>
>> Fixes: 4fc2cf1f2daf ("x86/platform/uv: Add new uv_sysfs platform driver")
>> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> Thank you for taking the time to find this.
> 
> Reviewed-by: Justin Ernst <justin.ernst@hpe.com> 
> (With an acknowledgement of Boris's 's/success/random stack memory contents/' comment)

ATM the drivers/platform/x86/uv_sysfs.c only exists in the tip/x86 tree -next
branch, so this fix needs to be merged through the tip/x86 tree, here is my ack
for merging it that way:

Acked-by: Hans de Goede <hdegoede@redhat.com>

(either with a fixed up commit-msg as suggested by Borislav, or feel
free to add it to a fixed v2 of the patch)

Regards,

Hans



> 
>> ---
>>  drivers/platform/x86/uv_sysfs.c | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/platform/x86/uv_sysfs.c b/drivers/platform/x86/uv_sysfs.c
>> index 54c342579f1c..e17ce8c4cdad 100644
>> --- a/drivers/platform/x86/uv_sysfs.c
>> +++ b/drivers/platform/x86/uv_sysfs.c
>> @@ -248,6 +248,7 @@ static int uv_hubs_init(void)
>>  		uv_hubs[i] = kzalloc(sizeof(*uv_hubs[i]), GFP_KERNEL);
>>  		if (!uv_hubs[i]) {
>>  			i--;
>> +			ret = -ENOMEM;
>>  			goto err_hubs;
>>  		}
>>
>> --
>> 2.29.2
> 

