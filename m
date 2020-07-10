Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7E31F21B07C
	for <lists+kernel-janitors@lfdr.de>; Fri, 10 Jul 2020 09:47:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726664AbgGJHrB (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Fri, 10 Jul 2020 03:47:01 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:53976 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726201AbgGJHrA (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 10 Jul 2020 03:47:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1594367218;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=JdHl2OiH4p6Iz0SiMtzkS/pKFwgmTmJSXShGkd+cqo8=;
        b=LaBraUAAu855uHZIJ53FP5j90b46GkV/PUb2FpBWXyYeuJI49n/q5DGc7l/3p53+yjagc2
        YP8WH8hWSNG9+OdJeYexv+KrADPXaPlgx6uMQWwsCsj/+ipxQTLVP7oN310WZvVTg+EqLt
        rYp/VSfqr5JfCSeGukwWRmcvWKYIbnE=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-194-HqmFeputN3qH9erQoP_RLg-1; Fri, 10 Jul 2020 03:46:57 -0400
X-MC-Unique: HqmFeputN3qH9erQoP_RLg-1
Received: by mail-wr1-f71.google.com with SMTP id j3so5053671wrq.9
        for <kernel-janitors@vger.kernel.org>; Fri, 10 Jul 2020 00:46:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=JdHl2OiH4p6Iz0SiMtzkS/pKFwgmTmJSXShGkd+cqo8=;
        b=ZoA24EZ5PaK7wkm/wS4FP+iNrw7h4wYVlQpaOCgqcNAqlVCvKll8aJl0wVJdlpf5E3
         juWCW9Hhanz5xtGSy2wKb+15tas2se0YbDT7ND69WX493Em+PxodBmLtw36fc8bKTqjK
         vCQsOeCEnuIy/3WAQoxhKdLQ45qIMFJKem4r/awfi5FNaj4L3BCeeqEn3Jk2C8PEBHjq
         vYyhZXTP5R+WGqAclbkgEMComLP/iwxdxn0lA3bs9lQhK12zGafN0FN+6dD0ARXewNvs
         YkypPuXzWXwkMwptEjhwK8Fev7Dh17tlDDIfjOSmVvvu2vbjtuQuXl1a+1ivy+Uv3TUt
         PA4w==
X-Gm-Message-State: AOAM530NgrQlb7Haq0Nfft5neTvkPJk8/GYZ0ZWM2411mBmJoyg+B9u6
        entF6knq5fQ8W+hYfOE5VwS3ZoHfVUyDjxBdbPtBUQTvg2Ngi7KPtgbAXiKNQVXSia8N9xk2g3c
        UhzXKWW8wqz/4OX7AVC95Nt/JvfTb
X-Received: by 2002:a1c:b686:: with SMTP id g128mr3986795wmf.145.1594367215831;
        Fri, 10 Jul 2020 00:46:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyuGy1axXIP4NvsxIBSy6jkXMCqPU4GtMCNiYKIfYo8qhu5JkSK8NP7Ezs/ydWQoVmvN6gUlw==
X-Received: by 2002:a1c:b686:: with SMTP id g128mr3986767wmf.145.1594367215569;
        Fri, 10 Jul 2020 00:46:55 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:9541:9439:cb0f:89c? ([2001:b07:6468:f312:9541:9439:cb0f:89c])
        by smtp.gmail.com with ESMTPSA id k18sm8954712wrx.34.2020.07.10.00.46.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jul 2020 00:46:55 -0700 (PDT)
Subject: Re: [PATCH] scsi: virtio_scsi: Remove unnecessary condition checks
To:     Markus Elfring <Markus.Elfring@web.de>,
        Xianting Tian <xianting_tian@126.com>,
        linux-scsi@vger.kernel.org,
        virtualization@lists.linux-foundation.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
        "James E. J. Bottomley" <jejb@linux.ibm.com>,
        Jason Wang <jasowang@redhat.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Stefan Hajnoczi <stefanha@redhat.com>
References: <a197f532-7020-0d8e-21bf-42bb66e8daec@web.de>
 <e87746e6-813e-7c0e-e21e-5921e759da5d@redhat.com>
 <8eb9a827-45f1-e71c-0cbf-1c29acd8e310@web.de>
 <58e3feb8-1ffb-f77f-cf3a-75222b3cd524@redhat.com>
 <9815ef2d-d0da-d197-49d7-83559d750ff1@web.de>
From:   Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <d052b441-cc4d-4b2b-1442-b1a30bed2fdb@redhat.com>
Date:   Fri, 10 Jul 2020 09:46:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <9815ef2d-d0da-d197-49d7-83559d750ff1@web.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On 10/07/20 09:40, Markus Elfring wrote:
>>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/scsi/virtio_scsi.c?id=42f82040ee66db13525dc6f14b8559890b2f4c1c#n980
>>>
>>>  	if (!virtscsi_cmd_cache) {
>>>  		pr_err("kmem_cache_create() for virtscsi_cmd_cache failed\n");
>>> -		goto error;
>>> +		return -ENOMEM;
>>>  	}
>>
>> Could be doable, but I don't see a particular benefit.
> 
> Can a bit more “compliance” (with the Linux coding style) matter here?

No.

>> Having a single error loop is an advantage by itself.
> 
> I do not see that a loop is involved in the implementation of the function “init”.

s/loop/label/ sorry.

Paolo

