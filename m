Return-Path: <kernel-janitors+bounces-3161-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 03A848C879F
	for <lists+kernel-janitors@lfdr.de>; Fri, 17 May 2024 15:56:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 34EA31C2233E
	for <lists+kernel-janitors@lfdr.de>; Fri, 17 May 2024 13:56:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B89956477;
	Fri, 17 May 2024 13:56:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Aiz3rQCs"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2729455E49
	for <kernel-janitors@vger.kernel.org>; Fri, 17 May 2024 13:56:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715954205; cv=none; b=gWQOoE9GF4Udu22kdWUUoCjEzTmp9FoaMfWLPXHelTYr6qy8fOk1F7WXGQkI+emqOnlS1U0sRrkHbJIG1CUxaQATosueuAJYDMH5SdF8Y6dKtddHqAxtZ4eWAFEhqxHJK3jB79i35br4ZNOxw6nBZQxefNthCU3AQ8lPooR+q9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715954205; c=relaxed/simple;
	bh=85xZDnDHg0ctOUONvLSzzw2Gjs8WKUZf9n6mO7yIEvs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bxyviDZFoCM8fsdwe/itTJmd0Frsf6QjNSoo6LUOWE1FwukgxvcJ8o/+/o1SBqb11DEn1rrgl4Ff2RyVLVzJQhF3XJ2hXIuEB7UXiPYiPOs4DOmQPXil+9Q6d1g3NbBspRrctMln8ETdaJ3CGgR0Cz9Om5U7Qg59FwP8XpGeiPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Aiz3rQCs; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1715954203;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=P7da4zZe/RF0iDJq87qxBFBAAOnLcIktWW2v8Eq4LzE=;
	b=Aiz3rQCsjGdQ8X/X0bqHwex37o/OC8iw2BlOAtYkx3Ij7Bk53kF5K8Bym3jR+3CPKKmzin
	GOE/H9nmF/cetTMKTF5alkFCGVIaldRgVzzUV5mmBCvfmKZD+BvpK3t+OAlNeet4edBKYS
	Pxt4QyY1N+5L3dwLRfZb9HrNHCgRJXw=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-648-p4RSWFwmMhWQOw7ywZEitA-1; Fri, 17 May 2024 09:56:41 -0400
X-MC-Unique: p4RSWFwmMhWQOw7ywZEitA-1
Received: by mail-ed1-f69.google.com with SMTP id 4fb4d7f45d1cf-5732229087bso3087828a12.0
        for <kernel-janitors@vger.kernel.org>; Fri, 17 May 2024 06:56:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715954200; x=1716559000;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=P7da4zZe/RF0iDJq87qxBFBAAOnLcIktWW2v8Eq4LzE=;
        b=h/8PGD8giBsURYVx2iZftN9UVRh+LjffezrWoIQazbbopkZFfkwRo5K85Ptrw7Ym+Z
         yz9jvwcXNzyFJVr4tKExRQHqDMsXpK1t40gciKf/j+xrZQ+aVzwSwcnhxSDR8EuTxG8d
         QaxR8b67zphTy9pGod6PEzVA9O03f1Byee9V7c4TN4QZPqQrXeTr8fIQm4AhhK6pO1xd
         TLzMS14Y+uEDYsfe7LTK9sfuVkzJk7B9K+4V8vyXBclzapyGnExKXow2ba+3h0Zcy1qk
         MZDggRuoQNDLuQJb/f/tpYvmkCnDp0hrGk5zxFkgE1vpfViknRyPSVyKIywxptHWDJK7
         AvUQ==
X-Forwarded-Encrypted: i=1; AJvYcCWfXeHR/9czHlUpMkP3stfUgOvMhpcFsQmjOlFUvkZhBJ96z8dv3pnTeAdowLMpYg5Wv+VE6ISlTgOyu3Ukd9rN3b7jh1TJwLUHIfQYGZDI
X-Gm-Message-State: AOJu0YyyOIf1uxK+hGhDdQbw+mWu6rDbkwZ0/oblOigA7gQ8RxzjmfkS
	B/EVLJYz4VUL7B60k9rDcedxExAkdyj42dK8b+FSUAAzuQWkgeUla2Io6PVwcZaB+/ZKUasrL0O
	bU2cISMdhqjXRfAYklMQGI7WMSIJENgcz4FgTWyWKMfDLYjgPxa3gTN7yRonklNNvtw==
X-Received: by 2002:a50:99da:0:b0:572:a731:dd16 with SMTP id 4fb4d7f45d1cf-5734d67f01amr17872666a12.28.1715954200282;
        Fri, 17 May 2024 06:56:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGDnhd61w8IViEbd5Wb5xJ7rYxtWXpCIrhQZrwnP2FPvfYqXbBDQtp/u50nwrTnTZ5fqaAwng==
X-Received: by 2002:a50:99da:0:b0:572:a731:dd16 with SMTP id 4fb4d7f45d1cf-5734d67f01amr17872642a12.28.1715954199928;
        Fri, 17 May 2024 06:56:39 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5752136c97bsm316897a12.77.2024.05.17.06.56.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 May 2024 06:56:39 -0700 (PDT)
Message-ID: <b5a5db11-43f4-4543-bedd-c46daf840e9a@redhat.com>
Date: Fri, 17 May 2024 15:56:38 +0200
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/x86: ISST: fix use-after-free in
 tpmi_sst_dev_remove()
To: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>,
 Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Zhang Rui <rui.zhang@intel.com>, platform-driver-x86@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: dan.carpenter@linaro.org, kernel-janitors@vger.kernel.org,
 error27@gmail.com
References: <20240514092656.3462832-1-harshit.m.mogalapalli@oracle.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20240514092656.3462832-1-harshit.m.mogalapalli@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 5/14/24 11:26 AM, Harshit Mogalapalli wrote:
> In tpmi_sst_dev_remove(), tpmi_sst is dereferenced after being freed. Fix this by reordering the kfree() post the dereference.
> 
> Fixes: 9d1d36268f3d ("platform/x86: ISST: Support partitioned systems")
> Signed-off-by: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>

This looks obviously correct to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Still would be nice if one of the Intel maintainers for this
can ack it.

Either way I'll merge this for the first pdx86 fixes pull-request
for 6.10 (when I get around to merging the first round of fixes).

Regards,

Hans




> ---
> This is found by smatch and only compile tested.
> ---
>  drivers/platform/x86/intel/speed_select_if/isst_tpmi_core.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/intel/speed_select_if/isst_tpmi_core.c b/drivers/platform/x86/intel/speed_select_if/isst_tpmi_core.c
> index 7bac7841ff0a..7fa360073f6e 100644
> --- a/drivers/platform/x86/intel/speed_select_if/isst_tpmi_core.c
> +++ b/drivers/platform/x86/intel/speed_select_if/isst_tpmi_core.c
> @@ -1610,8 +1610,8 @@ void tpmi_sst_dev_remove(struct auxiliary_device *auxdev)
>  	tpmi_sst->partition_mask_current &= ~BIT(plat_info->partition);
>  	/* Free the package instance when the all partitions are removed */
>  	if (!tpmi_sst->partition_mask_current) {
> -		kfree(tpmi_sst);
>  		isst_common.sst_inst[tpmi_sst->package_id] = NULL;
> +		kfree(tpmi_sst);
>  	}
>  	mutex_unlock(&isst_tpmi_dev_lock);
>  }


