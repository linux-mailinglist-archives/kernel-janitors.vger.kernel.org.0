Return-Path: <kernel-janitors+bounces-4029-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C28590842A
	for <lists+kernel-janitors@lfdr.de>; Fri, 14 Jun 2024 09:04:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D6267282AC0
	for <lists+kernel-janitors@lfdr.de>; Fri, 14 Jun 2024 07:04:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DED6314882D;
	Fri, 14 Jun 2024 07:03:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fH/MV2++"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 189CD146D55
	for <kernel-janitors@vger.kernel.org>; Fri, 14 Jun 2024 07:03:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718348639; cv=none; b=F65SOm1SuSUq0BhkoI2wBO37ES2jF2FXQzkm0NGUaDxxceJw8AcTepODBMqWfko8eCF1riTlcIf2d3NDFKwkg3eBvFjSyu9TRbVvSETJ46361WH8MIOybIqZGNfGQ/OBtxUDAxV9zJcCM4NRSMG/TT830U77Pj3CjwZjpYYKOmg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718348639; c=relaxed/simple;
	bh=MNbfEaigD6aPLWW54LgFWKSKSsvzTT7J6aOZ31OO87c=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=s+W/0XH2xnzrNUl9LTn13PZLzYWvGUJ+VNkbhV7Gf+2M9pJqcOJLPnD45LOgZyWPI5+GD6Krwtn4hPownRDDNVNMmpnRBhCdtGZZVMBDDy6+TFG/iJqgPjF08TfM3HEVbq80lZIge607WtrYsxZX0jbiJaCLN9lDWo/IfMzzpSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fH/MV2++; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-421d32fda86so20984115e9.0
        for <kernel-janitors@vger.kernel.org>; Fri, 14 Jun 2024 00:03:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718348635; x=1718953435; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p4TNjSLKkh/gyKR6pHDFcT9hwwp7eBZGwBalltj+b7Q=;
        b=fH/MV2++fbvhpL2hDr7kUBcXdWAuDhM2zqCa4cDui7BX6PmzRhiXuarPAmQQZnKCfL
         mkSWPTLd+3SrlFihmp3bTuvsYRYArvHvrHx8bCza2CqdBzbBFQV04J9v0S6J+N8fZgui
         XwWEP3+nmiI8EmRBrECKadO/Pfm3QKeM5HUTtD09aiSSGxEqe0y5mlAM6+PBTajJ1TZe
         uC3jyBqWmFrM1ccN79YC31Xk+G7ZhmGkgLWCdcoza2DaYRa7wLZD9Yw0jIc6/Pxsri3S
         OsEx4TTqfOw6n4/yjj9r7SlUG/PyqXW7Eu37VB3RSgrOYCnmu/bY7rBDfU4MTMFYs/3o
         e2ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718348635; x=1718953435;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=p4TNjSLKkh/gyKR6pHDFcT9hwwp7eBZGwBalltj+b7Q=;
        b=vmwjzI2sAvkURMLW5V/LX+KhkFPdgTxyKiwIRVBRFPmPVf435tu3Z0mf61SCum3ynG
         n9AaHeaBJYXp1bEOMZJIW9rudjSlpxsqW31NMEF6Zvor20ZViiJEKtiK1ktY12QepMiq
         swNPXMpL/jhJhTLcXSvmtRCkLM+eIGs8uqwPtD2x9DAcciASTV5XVKneMhPCJv7h4vNJ
         9sA+xUhQ6YEuTonQz17uys/5T+RoV0bleDk/Jq1dGgau/CFJx9MB2zfUG7pJ611wl9VO
         jaDBElhviRqOgL39HGsbvdj2j7mSDjeponaywQo09CViULTxgHHBlugnNJ83mDSdrAgm
         q4tA==
X-Forwarded-Encrypted: i=1; AJvYcCUKy4mzllOF0UrxEqi5EducI3kA9wADKy//nqAQ7bpNqE5tJ8OxdIhC08l7hXS5eJAk+1vGKOAYLEtFgo+r6Q3I27Iv0lfu83jJEtKMX3c1
X-Gm-Message-State: AOJu0Yx4rRFA4xrisLX4Kb9SzreRxzmZmTdBy409GYEjD+hs4/uPa5Fk
	mSN5k2etn2Qu4rTnYX1UPQPj40wvX7jPqm9y42DSrahOtNqrJnS7yvnWsMGMRsY=
X-Google-Smtp-Source: AGHT+IHAglRk9laq/PIfLee3Z5IGuhgrv0laafxD6GLaZVL31iAoc0E90SWCdrFlPsghFo7Ds38cTA==
X-Received: by 2002:a05:600c:3c9a:b0:41c:2313:da8d with SMTP id 5b1f17b1804b1-4230483252bmr21763455e9.0.1718348635126;
        Fri, 14 Jun 2024 00:03:55 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:261a:269e:a3a8:a2cc? ([2a01:e0a:982:cbb0:261a:269e:a3a8:a2cc])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-422874de623sm87193705e9.31.2024.06.14.00.03.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Jun 2024 00:03:54 -0700 (PDT)
Message-ID: <ef7015e9-53b8-414c-802c-a56b98506755@linaro.org>
Date: Fri, 14 Jun 2024 09:03:53 +0200
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH] firmware: meson_sm: add missing MODULE_DESCRIPTION()
 macro
To: Jeff Johnson <quic_jjohnson@quicinc.com>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
References: <20240613-md-arm64-drivers-firmware-meson-v1-1-28e4138a8597@quicinc.com>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <20240613-md-arm64-drivers-firmware-meson-v1-1-28e4138a8597@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 13/06/2024 23:18, Jeff Johnson wrote:
> With ARCH=arm64, make allmodconfig && make W=1 C=1 reports:
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/firmware/meson/meson_sm.o
> 
> Add the missing invocation of the MODULE_DESCRIPTION() macro.
> 
> Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> ---
>   drivers/firmware/meson/meson_sm.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/firmware/meson/meson_sm.c b/drivers/firmware/meson/meson_sm.c
> index 5d7f62fe1d5f..f25a9746249b 100644
> --- a/drivers/firmware/meson/meson_sm.c
> +++ b/drivers/firmware/meson/meson_sm.c
> @@ -340,4 +340,5 @@ static struct platform_driver meson_sm_driver = {
>   	},
>   };
>   module_platform_driver_probe(meson_sm_driver, meson_sm_probe);
> +MODULE_DESCRIPTION("Amlogic Secure Monitor driver");
>   MODULE_LICENSE("GPL v2");
> 
> ---
> base-commit: 83a7eefedc9b56fe7bfeff13b6c7356688ffa670
> change-id: 20240613-md-arm64-drivers-firmware-meson-2ce24a9a9de9
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

