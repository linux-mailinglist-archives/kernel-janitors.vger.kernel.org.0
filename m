Return-Path: <kernel-janitors+bounces-4432-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 928519239AE
	for <lists+kernel-janitors@lfdr.de>; Tue,  2 Jul 2024 11:20:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 52AE72852EA
	for <lists+kernel-janitors@lfdr.de>; Tue,  2 Jul 2024 09:20:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CAB6415218A;
	Tue,  2 Jul 2024 09:20:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="BnZ7BS3Y"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21AF0150994
	for <kernel-janitors@vger.kernel.org>; Tue,  2 Jul 2024 09:20:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719912021; cv=none; b=EKz6Ozy1Xk8S47DUiFaLNBe/JSHdV4buZSlU+6TdtCqA3DZJ4Y5nw6WzZTWTYcPqn083Ugw8on0OZHFVuMMAUvhJXF1VnT8Rcn9MsJ1mOiLSbc7kqV4vYe+oW5pBKTbas4Qa63InxVStbvK7MSEWW3zDc7bXuBWb+2ehZDtvVrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719912021; c=relaxed/simple;
	bh=FBGGUF9yGhtpSD7KFZanwXm4og4Pep/4VZR5qRW1nRQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Jb4L8gvfc/zgRfEQC8G6gPJNxn+vrI875ahX5H6BTRXEvgNASQ/6hupoVbhIHN7jayFu0QGVuf5MYoPNCsUQsWYQmHZzxxP2zqucFFjYFBxBlITluaOYFBkQq9TDQlTyZVk8sQ69eg3qoia0GG1qP3afGSOGtrWskCZxu6Tgxfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=BnZ7BS3Y; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-58bac81f341so353961a12.0
        for <kernel-janitors@vger.kernel.org>; Tue, 02 Jul 2024 02:20:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1719912017; x=1720516817; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Am5AKU5CYVlzXMlBULleGZdt7dqJl3EdYaCR7jwAFu8=;
        b=BnZ7BS3YbfR7DKAmnawPycgH0Yr1Ua7Mmww1jXxzJT2cYDi/PuCVRbe5iRKO6uTJWF
         mQVkrTKjc3UdJN8M7uFFZPoeqGbQn5VGDeVGk/VQP2qZmDQnBb/JsUbCw6mAVJAqucd8
         6MGtb+CSl2kF4cp3Qo/pAoSfQR2dSoZaRP4WLLd/kPP1vCH7KMAN/Q+YAr6OWzCPFCz1
         pT7qEPMOUhcrAdsiyjQyggEJdo2tMqsSJYN6R/p5hGc0jqNEqNfnKGIz05s4D7P+Mkwb
         uiL7d1a8M1VG3twpPn5Td2bu9hNsDCDkg98VSk+pYBYqZInnbzJwne4Rm5rpXFYSqNRF
         fdBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719912017; x=1720516817;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Am5AKU5CYVlzXMlBULleGZdt7dqJl3EdYaCR7jwAFu8=;
        b=YLC++oBpk9gLqViqXnUyE3jNeoHdNwgYXaD52km+6JqQOA6Bpdf6zipVkkgXDH0p6x
         Gn9wDvp351LPo8NZ9NK35pAXIovV51sZVzHwsnf/AQCqo6Bri/T0GAuwLL/DNrd7CKyT
         NYbixAE4v3bOFUljErS7iFv0M3UG8NDQ0T3zndP7UjSryPtxUDNLdELHzZOVxPDgETMK
         pZLE0AswuvXe/5tq8Whxsskpvgd0Ll8oSRGevZJDn665QKnex7Jn2fvT5wim7QoKK57c
         u6ZkDgeHQhav/R9VMbebu6wS5yxLcYds4OJpZapc/jAB6qxsh3zVHx3gICiKgl3SX5IL
         BqCQ==
X-Forwarded-Encrypted: i=1; AJvYcCXNUPsvf2LMxPwszVNXNvtVY4hCQ0X71F3EbuwxSu0OxjhaF/I5YCuQIusWxepx6Di5phsL+cZVtJyOXoL33fgtCGyjjlZA48mmzKxi8fiX
X-Gm-Message-State: AOJu0YwZRDGYjhDojDjT8FglXrP1ZRAWmd8HBwKWTtlwMloefSNJ/Uub
	I2eTAxUA+H9cGiHhc7NNoxV6Ap8E9BtN1kaqCbTDcfNwFx78QyOet9robsLKaJY=
X-Google-Smtp-Source: AGHT+IEoCb87+tFLwRVVwSSbEyVxUK6Qfov0xOk39+vIaDdYOByLb4JEhPWggGYmh2GtQFsbWQdvgw==
X-Received: by 2002:a05:6402:2786:b0:582:7e6d:6816 with SMTP id 4fb4d7f45d1cf-5879f0c6348mr5915930a12.8.1719912017377;
        Tue, 02 Jul 2024 02:20:17 -0700 (PDT)
Received: from ?IPV6:2003:e5:8729:4000:29eb:6d9d:3214:39d2? (p200300e58729400029eb6d9d321439d2.dip0.t-ipconnect.de. [2003:e5:8729:4000:29eb:6d9d:3214:39d2])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-58614d50464sm5374524a12.69.2024.07.02.02.20.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Jul 2024 02:20:17 -0700 (PDT)
Message-ID: <e31d626f-d806-41ad-bc5a-82eb5fe68ea1@suse.com>
Date: Tue, 2 Jul 2024 11:20:16 +0200
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen: add missing MODULE_DESCRIPTION() macros
To: Jeff Johnson <quic_jjohnson@quicinc.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Cc: xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org
References: <20240611-md-drivers-xen-v1-1-1eb677364ca6@quicinc.com>
 <2ecfd10e-c8f2-458c-bf07-e4472d22bcfe@quicinc.com>
Content-Language: en-US
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
In-Reply-To: <2ecfd10e-c8f2-458c-bf07-e4472d22bcfe@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 26.06.24 18:46, Jeff Johnson wrote:
> On 6/11/2024 4:54 PM, Jeff Johnson wrote:
>> With ARCH=x86, make allmodconfig && make W=1 C=1 reports:
>> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/xen/xen-pciback/xen-pciback.o
>> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/xen/xen-evtchn.o
>> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/xen/xen-privcmd.o
>>
>> Add the missing invocations of the MODULE_DESCRIPTION() macro.
>>
>> Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>
>> ---
>> Corrections to these descriptions are welcomed. I'm not an expert in
>> this code so in most cases I've taken these descriptions directly from
>> code comments, Kconfig descriptions, or git logs.  History has shown
>> that in some cases these are originally wrong due to cut-n-paste
>> errors, and in other cases the drivers have evolved such that the
>> original information is no longer accurate.
>> ---
>>   drivers/xen/evtchn.c               | 1 +
>>   drivers/xen/privcmd-buf.c          | 1 +
>>   drivers/xen/privcmd.c              | 1 +
>>   drivers/xen/xen-pciback/pci_stub.c | 1 +
>>   4 files changed, 4 insertions(+)
>>
>> diff --git a/drivers/xen/evtchn.c b/drivers/xen/evtchn.c
>> index f6a2216c2c87..9b7fcc7dbb38 100644
>> --- a/drivers/xen/evtchn.c
>> +++ b/drivers/xen/evtchn.c
>> @@ -729,4 +729,5 @@ static void __exit evtchn_cleanup(void)
>>   module_init(evtchn_init);
>>   module_exit(evtchn_cleanup);
>>   
>> +MODULE_DESCRIPTION("Xen /dev/xen/evtchn device driver");
>>   MODULE_LICENSE("GPL");
>> diff --git a/drivers/xen/privcmd-buf.c b/drivers/xen/privcmd-buf.c
>> index 2fa10ca5be14..0f0dad427d7e 100644
>> --- a/drivers/xen/privcmd-buf.c
>> +++ b/drivers/xen/privcmd-buf.c
>> @@ -19,6 +19,7 @@
>>   
>>   #include "privcmd.h"
>>   
>> +MODULE_DESCRIPTION("Xen Mmap of hypercall buffers");
>>   MODULE_LICENSE("GPL");
>>   
>>   struct privcmd_buf_private {
>> diff --git a/drivers/xen/privcmd.c b/drivers/xen/privcmd.c
>> index 67dfa4778864..b9b784633c01 100644
>> --- a/drivers/xen/privcmd.c
>> +++ b/drivers/xen/privcmd.c
>> @@ -48,6 +48,7 @@
>>   
>>   #include "privcmd.h"
>>   
>> +MODULE_DESCRIPTION("Xen hypercall passthrough driver");
>>   MODULE_LICENSE("GPL");
>>   
>>   #define PRIV_VMA_LOCKED ((void *)1)
>> diff --git a/drivers/xen/xen-pciback/pci_stub.c b/drivers/xen/xen-pciback/pci_stub.c
>> index e34b623e4b41..4faebbb84999 100644
>> --- a/drivers/xen/xen-pciback/pci_stub.c
>> +++ b/drivers/xen/xen-pciback/pci_stub.c
>> @@ -1708,5 +1708,6 @@ static void __exit xen_pcibk_cleanup(void)
>>   module_init(xen_pcibk_init);
>>   module_exit(xen_pcibk_cleanup);
>>   
>> +MODULE_DESCRIPTION("Xen PCI-device stub driver");
>>   MODULE_LICENSE("Dual BSD/GPL");
>>   MODULE_ALIAS("xen-backend:pci");
>>
>> ---
>> base-commit: 83a7eefedc9b56fe7bfeff13b6c7356688ffa670
>> change-id: 20240611-md-drivers-xen-522fc8e7ef08
>>
> 
> Following up to see if anything else is needed from me. Hoping to see this in
> linux-next so I can remove it from my tracking spreadsheet :)

I've pushed the patch to the xen/tip.git for-next branch.


Juergen

