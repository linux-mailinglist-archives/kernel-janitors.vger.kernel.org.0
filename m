Return-Path: <kernel-janitors+bounces-2420-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DBAA5899654
	for <lists+kernel-janitors@lfdr.de>; Fri,  5 Apr 2024 09:14:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8C14A1F28F61
	for <lists+kernel-janitors@lfdr.de>; Fri,  5 Apr 2024 07:14:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98F352C69B;
	Fri,  5 Apr 2024 07:14:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tweaklogic.com header.i=@tweaklogic.com header.b="F4rmytWg"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CB1B26AFD
	for <kernel-janitors@vger.kernel.org>; Fri,  5 Apr 2024 07:14:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712301281; cv=none; b=Pc5/83mWBnfBbeJv4Q0F1FBKlMgHFNroFD1zJNKVUT3H7Yl4I1CPqoAxjWsnPBgfIqWQJPGkIzTIyzHXiDKXlQwKkWhSCY4cAQ7cHjZsgITSDJUjeH1EchqJaghpZD7To/Pfd0uL8LRNpX8VPWrO2kwpcYQtmCaVO79Fv5uFb1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712301281; c=relaxed/simple;
	bh=SaiKRf3RQbp8FV10MR4XbyWuycnREfYo3jf47AiQHiI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=S4iMcVEl1e7OhxLcwmC4tUqbwvyZD96K2uFIAiQkAMR3pEfJeCmrXEaaP4AfyADQmnW3JmF1v8tbyKFlEmFUZC+ATEnDESa5gICdRSNzqSrYKQ+sf0EBC/nnFkVQMvU9FN7gAx4a17sxS2XlBgiMXkS4P8OZwMMNPt3eSE5n7Bg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tweaklogic.com; spf=pass smtp.mailfrom=tweaklogic.com; dkim=pass (2048-bit key) header.d=tweaklogic.com header.i=@tweaklogic.com header.b=F4rmytWg; arc=none smtp.client-ip=209.85.210.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tweaklogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tweaklogic.com
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-6e6a5bd015dso814067a34.2
        for <kernel-janitors@vger.kernel.org>; Fri, 05 Apr 2024 00:14:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tweaklogic.com; s=google; t=1712301278; x=1712906078; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=M9skp/veFntESVv5IBHSeh0fw1XOzAJyP4HZp0g89cM=;
        b=F4rmytWgo6milu2bsaV3MoFR738b7PdQOldSqtJSnokLVD6WG9h3QzVYbt1nqH5YqJ
         E9/w4YutP8rKGE4qP3HBoJSxhDqasAAjLxknPBAYADa2kftYv3viLE3EvXBb9Vj9EzgI
         RX8P9gyrzk9BqhcQkNXY+yurwKkvyjEHQcyjhO6rYjTr8B1UoFAgc93Ow/PAXVgVr6m3
         PVFHZzFCB+AZL3pJCcGkE7H7kjOtvhwR+iLjzdOUjuL7iN77B/E6P4wKFcSLYOrSxSUx
         WJzZvURGaWnC6U+p1Sic1tDD4jkMqTeYlBfhs19GwNL7zNfeZJNcWENjyAD5t/PJnLws
         ZKZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712301278; x=1712906078;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=M9skp/veFntESVv5IBHSeh0fw1XOzAJyP4HZp0g89cM=;
        b=LsxZYWu0lKC+DejFVZmDyjjigg3ik8jm5IdinX9B/VCXdLy1GJ8EEOVV1eBCjcanJn
         jCyxXT9ZIKaB7K1FJ4HASDcPadmufacxPEVFhBWETL1BiMhR5x00pjMX+iA0hvkRiPgu
         aBESFQnIzeHRHXmKUI5MaNKLWYH803RJc7jjJs/tcufat6jBhOXFX6AeIWDD8b0rB71O
         LVKZEYfjyTAJiQZIp2c8vyyrh193NM85CjpuTW0E8Z8QFQBSZAWaSu/BIsweP8ALiMcG
         WqhKbvbmjjVHV79KceBgsg58nWYZipZqiuryii8GcTEpPVelqjpIqHFh7SDwC3cF+PoS
         4Pug==
X-Forwarded-Encrypted: i=1; AJvYcCUvEBDn9VRi4CvWOEf0SQemw9DvhoRe61Hs3zqg80eYj9niDwBl5aDznAnpD9Q3Nq1T1w/k63JgE0zPCEieLbRwsM4Lkb0r9z4ofsfsFg6U
X-Gm-Message-State: AOJu0YxDVlklN/Ha0WLmAfacq9lADZvAJe9Yx0Mfp7TCXBEQMsDpjtK/
	kCm7J0kCUaZLkBqYb4sRCnxRuO8RXRdP9OzgBXJS5NcCYt3Q7A5ngx7tayV1ziE=
X-Google-Smtp-Source: AGHT+IGja6uppOhisB7znHWGeozcffmJLxLnLmJLpdn9gQKm01/J3UU1NMKfhr8BvFaTqUkqaPpdbw==
X-Received: by 2002:a9d:7dce:0:b0:6e6:b9ed:694b with SMTP id k14-20020a9d7dce000000b006e6b9ed694bmr674113otn.26.1712301278118;
        Fri, 05 Apr 2024 00:14:38 -0700 (PDT)
Received: from [192.168.20.11] ([180.150.112.31])
        by smtp.gmail.com with ESMTPSA id n17-20020a635911000000b005dc3fc53f19sm784922pgb.7.2024.04.05.00.14.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Apr 2024 00:14:37 -0700 (PDT)
Message-ID: <7a54d993-8aff-472f-8132-85e0ca79ff13@tweaklogic.com>
Date: Fri, 5 Apr 2024 17:44:31 +1030
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] iio: light: apds9306: Fix off by one in
 apds9306_sampling_freq_get()
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen
 <lars@metafoo.de>, linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org
References: <69c5cb83-0209-40ff-a276-a0ae5e81c528@moroto.mountain>
Content-Language: en-US
From: Subhajit Ghosh <subhajit.ghosh@tweaklogic.com>
In-Reply-To: <69c5cb83-0209-40ff-a276-a0ae5e81c528@moroto.mountain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/4/24 18:01, Dan Carpenter wrote:
> The > comparison needs to be >= to prevent an out of bounds access.
> 
> Fixes: 620d1e6c7a3f ("iio: light: Add support for APDS9306 Light Sensor")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>   drivers/iio/light/apds9306.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/iio/light/apds9306.c b/drivers/iio/light/apds9306.c
> index 4d8490602cd7..49fa6b7d5170 100644
> --- a/drivers/iio/light/apds9306.c
> +++ b/drivers/iio/light/apds9306.c
> @@ -635,7 +635,7 @@ static int apds9306_sampling_freq_get(struct apds9306_data *data, int *val,
>   	if (ret)
>   		return ret;
>   
> -	if (repeat_rate_idx > ARRAY_SIZE(apds9306_repeat_rate_freq))
> +	if (repeat_rate_idx >= ARRAY_SIZE(apds9306_repeat_rate_freq))
>   		return -EINVAL;
Good find.

Reviewed-by: Subhajit Ghosh <subhajit.ghosh@tweaklogic.com>

Regards,
Subhajit Ghosh
>   
>   	*val = apds9306_repeat_rate_freq[repeat_rate_idx][0];


