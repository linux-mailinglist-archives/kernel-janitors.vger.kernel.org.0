Return-Path: <kernel-janitors+bounces-127-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EB327DF8A6
	for <lists+kernel-janitors@lfdr.de>; Thu,  2 Nov 2023 18:25:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DD339281CDA
	for <lists+kernel-janitors@lfdr.de>; Thu,  2 Nov 2023 17:25:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6006620317;
	Thu,  2 Nov 2023 17:25:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bTbBN7Vx"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 268EC200B7
	for <kernel-janitors@vger.kernel.org>; Thu,  2 Nov 2023 17:25:34 +0000 (UTC)
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6578A123;
	Thu,  2 Nov 2023 10:25:33 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-509109104e2so1389505e87.3;
        Thu, 02 Nov 2023 10:25:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698945931; x=1699550731; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uNZVlyzQ1sL4l4gGZgfOvYzM1lLpkdtOhbOEpCB9H7k=;
        b=bTbBN7VxXSA2ECARdfbNcJGc3fXTbPWb71voIgvQyjQPCAmvW7J4m6tKeIGlOoipaA
         VfrhJB2MwKTXSWclqkyI5ROLmqC7256U35ilFNoIOdwIh3ezDgwd4tAKEJT3rM6gF94s
         eb1cJxL0y3lg3J99st2QoVEZS/9EWvaGQjH0tbzFutwo0SJTn5w1pEadvxXcH34eJh9q
         bTSk8rV+8uqnCPq0+wF1e47C5xQpmxU0xZNKKljru3rR0R4hWRWOj5w63PtPfl8Rr8Bc
         frxcZ/y9OcZUDH4enw+Grao80FSjPbX8zT/LLDv2DvbYV1gYS+Qg6wv8G85kbOGB4LD3
         li1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698945931; x=1699550731;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uNZVlyzQ1sL4l4gGZgfOvYzM1lLpkdtOhbOEpCB9H7k=;
        b=QVecksxuChQJ0pHBa7roqipVw277vCM54JzxZlVUMWvn5U+QKAEJ94GyCRKOzka2UU
         BTa5hUehBy11gD+52dYwufX8awwYDu+DPj8Cl0tnHIG2aDlS0aHO/6L/BMewt0TZVe10
         FMh1/9B0vSbOqE+i2gSOzj3tcSMJiB6pLjdxQbYPfjbvkZyYXB/oRLF7gbne4uE1QPjQ
         egaiGS+qHvamz6P9kqYTYsFUL2Xbnlzk8DbIsTKnUkECftVV/cjWpFBpU6IE2HaU5f8R
         KcX7sbhzuw3ZhT3vv0XgBsmCLq6TURgKh+1mxG/vSo+nM4vx+rbWNctc6Ja5QpTrqvM/
         xXwg==
X-Gm-Message-State: AOJu0YwlygBQDjv6hG2s7BNa+ibZwOcrRqxviISTFd3x/y7q5h/Jc1nQ
	APnLwRCq04Qmg3dWvEqdBdBcGUvLcaw=
X-Google-Smtp-Source: AGHT+IGNcflDK5tx9dXHxqAkZ0BhsAWy/q3GpGaWNvhx3Ti1pY8diRK8GPvFwdgYGKxvkIcqpyKRIA==
X-Received: by 2002:a19:644d:0:b0:509:44b6:e3ac with SMTP id b13-20020a19644d000000b0050944b6e3acmr2964636lfj.61.1698945931285;
        Thu, 02 Nov 2023 10:25:31 -0700 (PDT)
Received: from [192.168.0.101] (cpc154979-craw9-2-0-cust193.16-3.cable.virginm.net. [80.193.200.194])
        by smtp.googlemail.com with ESMTPSA id v6-20020a5d5906000000b0032f7cfac0fesm856147wrd.51.2023.11.02.10.25.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Nov 2023 10:25:30 -0700 (PDT)
Message-ID: <b8183f5e-7c4f-48c1-8130-54b77e55349d@gmail.com>
Date: Thu, 2 Nov 2023 17:25:29 +0000
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/lib: Fix overflow of variable m when val >=
 1410065408
To: Dave Hansen <dave.hansen@intel.com>, Thomas Gleixner
 <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, "H . Peter Anvin" <hpa@zytor.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20231101153237.2214698-1-colin.i.king@gmail.com>
 <203cf76c-3855-408c-9a7c-8ff3f74a88bd@intel.com>
Content-Language: en-US
From: "Colin King (gmail)" <colin.i.king@gmail.com>
In-Reply-To: <203cf76c-3855-408c-9a7c-8ff3f74a88bd@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 02/11/2023 16:38, Dave Hansen wrote:
> On 11/1/23 08:32, Colin Ian King wrote:
> ...
>>   int num_digits(int val)
>>   {
>> -	int m = 10;
>> +	long m = 10;
>>   	int d = 1;
>>   
>>   	if (val < 0) {
> 
> Isn't this still broken on 32-bit where sizeof(long) == sizeof(int)?
> Seems like we need 'm' to be able to hold values that are ~10x larger
> than 'val' if we need this to work for the entire int range.

Good point, long long is required for 32 bit,

sizes:
arch     int   long   long long
i386     4     4      8
x86_64   4     8      8

I'll send a V2.


> 
> Also, performance doesn't matter here at *all* with the current use in
> a couple of printk()'s.  Just making 'm' 'long long' or u64 probably be
> just fine.


