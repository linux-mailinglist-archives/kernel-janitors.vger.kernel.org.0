Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 04607319904
	for <lists+kernel-janitors@lfdr.de>; Fri, 12 Feb 2021 05:18:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229559AbhBLESd (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Thu, 11 Feb 2021 23:18:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:45951 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229505AbhBLESc (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 11 Feb 2021 23:18:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1613103425;
        h=from:from:reply-to:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=uGSTJ+HM+7VqDqFE+Eky32FecMVzs7Bcg9hDuw+mgkU=;
        b=dA61rgb0/bar4ZXZcTnfk/Nwrw0f1RsZ1RgTuqRXOxHAwexSJlPkuIqYFDwJj/FIsKA3N9
        mHCz0E16MwH18LtUXUEHo5adKbnwTdCaxZMSonKYsSZC0A1pLvzAwABr0JbHbsCc9wSaku
        DKHaHdyl4sgEYa+JlLdNmu0DQ5Bel2M=
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-540-5vcIKVEeNBq-eEe6L7a5yg-1; Thu, 11 Feb 2021 23:17:01 -0500
X-MC-Unique: 5vcIKVEeNBq-eEe6L7a5yg-1
Received: by mail-pf1-f199.google.com with SMTP id j7so6388811pfa.14
        for <kernel-janitors@vger.kernel.org>; Thu, 11 Feb 2021 20:17:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:reply-to:subject:to:cc:references:from
         :organization:message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=uGSTJ+HM+7VqDqFE+Eky32FecMVzs7Bcg9hDuw+mgkU=;
        b=kEjEN15+ZqBCkmpWK5Brudoz14vZahteQE0o8QkZ0hNMUmRK9NFNeUtLRL5kaX2j9p
         uSlwk41jM6wDUNtExLNDfKCIpPiVrSscgQUcAq26CJrnW7HRgDzOfnbZWi5pWHdhm63G
         eZY3jYz74euOdbWueMTeZtkRqCqNEZOYcFqpz2M/fXGkuFtGY+dD1LObIVp/rotWdo+M
         uXNaeUEB66Wh/mTIDbM3eC3+jiQBQkiGNDEJhESedn/xSjZuCqq7pQrktUpl0MXf+nh8
         4GCWXAt8xZH3kupdTMQr2tF1nhI7miBY6eKhnf8Jvh6jx0QZCjojV9bpxOWO3RXFUt3R
         23PA==
X-Gm-Message-State: AOAM531kHTv3nB+ji8yNrTVLqmgQEDsUhxErzJa/wl4sXI5FlX1ZPBXn
        I0+qBtL9l9wNR7CeCOBlurIYGJ/D3yhWnYzkhCSKAUlUJn9rGCGzXR30LIdG+OY4A/8D9JPSHsf
        2YeisEaE+2jUI2FfASpd4A+DRBRS4
X-Received: by 2002:a63:f044:: with SMTP id s4mr1347267pgj.355.1613103420219;
        Thu, 11 Feb 2021 20:17:00 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyduJ+VUkuvUWyn8zdfdOMBfeRnXsDPGGc6LXBWFnQ5eLwYhOE3VLPCITfJhujNVxCd1nLFog==
X-Received: by 2002:a63:6203:: with SMTP id w3mr1415657pgb.224.1613103016659;
        Thu, 11 Feb 2021 20:10:16 -0800 (PST)
Received: from [172.24.0.1] ([122.169.13.134])
        by smtp.gmail.com with ESMTPSA id nl12sm8449191pjb.2.2021.02.11.20.10.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Feb 2021 20:10:10 -0800 (PST)
Reply-To: mgandhi@redhat.com
Subject: Re: [PATCH v2] scsi: qla2xxx: Removed extra space in variable
 declaration.
To:     Himanshu Madhani <himanshu.madhani@oracle.com>,
        Bart Van Assche <bvanassche@acm.org>,
        kernel-janitors@vger.kernel.org
Cc:     GR-QLogic-Storage-Upstream@marvell.com, linux-scsi@vger.kernel.org,
        njavali@marvell.com, jejb@linux.ibm.com, martin.petersen@oracle.com
References: <20210211131628.GA10754@machine1>
 <ccf393f7-cbfc-fb8c-6f73-bb502eaa54f3@acm.org>
 <b44bd29e-389c-634f-333d-edc88b3d7be9@oracle.com>
From:   "Milan P. Gandhi" <mgandhi@redhat.com>
Organization: Red Hat
Message-ID: <9da0412a-6bf0-1f09-85af-2aec025ee3ec@redhat.com>
Date:   Fri, 12 Feb 2021 09:40:06 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <b44bd29e-389c-634f-333d-edc88b3d7be9@oracle.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hi Bart, Himanshu,

On 2/11/21 10:18 PM, Himanshu Madhani wrote:
> Hi Milan,
> 
> On 2/11/21 9:57 AM, Bart Van Assche wrote:
>> On 2/11/21 5:16 AM, Milan P. Gandhi wrote:
>>> Removed extra space in variable declaration in qla2x00_sysfs_write_nvram
>>>
>>> Signed-off-by: Milan P. Gandhi <mgandhi@redhat.com>
>>> ---
>>> changes v2:
>>>   - Added a small note about change.
>>> ---
>>> diff --git a/drivers/scsi/qla2xxx/qla_attr.c b/drivers/scsi/qla2xxx/qla_attr.c
>>> index ab45ac1e5a72..7f2db8badb6d 100644
>>> --- a/drivers/scsi/qla2xxx/qla_attr.c
>>> +++ b/drivers/scsi/qla2xxx/qla_attr.c
>>> @@ -226,7 +226,7 @@ qla2x00_sysfs_write_nvram(struct file *filp, struct kobject *kobj,
>>>       struct scsi_qla_host *vha = shost_priv(dev_to_shost(container_of(kobj,
>>>           struct device, kobj)));
>>>       struct qla_hw_data *ha = vha->hw;
>>> -    uint16_t    cnt;
>>> +    uint16_t cnt;
>>>         if (!capable(CAP_SYS_ADMIN) || off != 0 || count != ha->nvram_size ||
>>>           !ha->isp_ops->write_nvram)
>>
>> I'm not sure if such a patch is considered substantial enough to be
>> included upstream.
>>
>> For future patches, please follow the guidelines for submitting patches
>> and use the imperative mood for the subject (Removed -> Remove) and do
>> not end the patch subject with a dot. See also
>> Documentation/process/submitting-patches.rst
>>
>> Bart.
>>
>>
> Agree with Bart here.
> 
> What was motivation behind this patch?
> 
> if you scroll through code, i am pretty sure you will find more than one place where spaces are not consistent (especially 15+ yr old code).
> 
I thought it was a typo and extra space was left, so just fixed it.
But it looks that there are many other places in qla2xxx source with similar declarations.
I apologize for the noise.

Thanks,
Milan.

