Return-Path: <kernel-janitors+bounces-2902-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 845418B996B
	for <lists+kernel-janitors@lfdr.de>; Thu,  2 May 2024 12:47:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3C0B01F25282
	for <lists+kernel-janitors@lfdr.de>; Thu,  2 May 2024 10:47:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DD895E060;
	Thu,  2 May 2024 10:47:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ngeCUwC1"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC91459B68
	for <kernel-janitors@vger.kernel.org>; Thu,  2 May 2024 10:47:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714646850; cv=none; b=cwVLeL0zWynDaACgPnISAIPnmEix1EVkFfnLNJkHBHPh4TKO10SxsbBicsAIPMo0rFxxgZWalvcMFqp1EZLoRrhoPMll4BwkGIpNHOi0//vg/ynU2vWox3sxn5AcoUEdg3ahgP6NfIuf/zrEn6ovqicZcA/8/QhB32VYCsll2vs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714646850; c=relaxed/simple;
	bh=0snrwj/IadpQ05qbdQCyEP+zwd+JBxii2GMgzUKIB/k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Inp9cIsnGImzof2AYQYh4ZoUu24lWQBL9MeVdYEpym/TCrrL/TafO/WU6vCWyAxV2VUJ22qhuwaTJGOLYBuMcaMW1ZmOiXnzpLmWtr6El9oW/O80mRtIWiHSoQ4bsDZUz1B8ne+foQXOaLVqxyGOPYrHTWWTbPFM6kXRW6M4ZY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ngeCUwC1; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-41b4ff362a8so72582295e9.0
        for <kernel-janitors@vger.kernel.org>; Thu, 02 May 2024 03:47:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714646847; x=1715251647; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nJZoBD0R+PUXOUgPNDoGdJNquKDNmlZwcM5ObQ89ibM=;
        b=ngeCUwC1Dw6rwH14OdDQe5zFyhil2+iOuLQpkd4pUN4TNiQE2txc6BUaGD1lRR/cPU
         diescJjH9ARwP1E4gy0GWWMr84ig16JPYNTqHlwkjPmGQ+wYp/7M1z5GgX/9IP1vLI4j
         xg6HJXVPui76Uy1vb26THunqC0h5Uiz3iLTXvdGOpLfMcI7liR9+F/XgnfM8S6+fQdBu
         WyeE9pXhOxNH2OXsxuVl5qt3B2qh8hQCp8ZxpoKqpA6Fh8eE9OvYYofMB1/lsa98zcjT
         lcOzSDxWtOeQ8zlz3BacSGYL/pTd2I9popbEEgu/WXzW7UOJqIC4xGaHakHsmjSxqHUn
         VkEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714646847; x=1715251647;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nJZoBD0R+PUXOUgPNDoGdJNquKDNmlZwcM5ObQ89ibM=;
        b=BZvYmipWkbFSlN7wTiD86SRG1KW7J0jrW49n9IlRC7HpYovXRZAZxzz0LADJIJOdf0
         umGL9GIuL6s12XNtfQRYJXxitPDH2by1Yd06dljHhDPoq1EmqW3O041xLoMPjq3m1fgG
         I5RKiku1NPiMEkzWUIaH3C2toKPN+uBSUaGAho2G3+of5ikKKRspyV0hN3cmVPPZ4cp6
         2z20h1gXZ9CoqevqHD+BaMqNuvoutE/tatC4kSjXw3FoKmmEeBlgAmDMcJ2UhQfTeg9c
         G2LCb98ppQerydXoXrhMu/fvKei5RsHTkmN5o4t8Eu+fWzPNnSU8GlLxZ8pb8RKjuvB8
         by4g==
X-Forwarded-Encrypted: i=1; AJvYcCUqvp0QUFbCZAmqtN9uzfn9IGAim/j0tZPlk++ZN8h5bysNCGGOG/8IVzZvQuSWSuYtlXonYFoIeOb/x5ijRFFLIPAwmC63+5Kbb7WCThzt
X-Gm-Message-State: AOJu0Yy21qhE/dhe9sZhaueSV1r83ZF9X9LaGsXju/6MdDNOlHiWcSAz
	WFORFiCq0DhkZf7wUkbhgK+aFMZzazJmpJCF8TY3O4gqJXrjpv+QfFuk3EWuTbM=
X-Google-Smtp-Source: AGHT+IHYcTmM8b1pD4V0PoReRNQd+u9RU4mMwpYBZRoy8NI6vUsWmFxNt7MUWFZQQqQdDGVwLcgQbw==
X-Received: by 2002:a05:600c:4f52:b0:41a:adc3:f777 with SMTP id m18-20020a05600c4f5200b0041aadc3f777mr4552975wmq.16.1714646846928;
        Thu, 02 May 2024 03:47:26 -0700 (PDT)
Received: from [192.168.10.46] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id hn26-20020a05600ca39a00b0041a68d4fe76sm5943076wmb.0.2024.05.02.03.47.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 May 2024 03:47:26 -0700 (PDT)
Message-ID: <74f5abc6-4f79-4dd8-bc36-b37669652573@linaro.org>
Date: Thu, 2 May 2024 12:47:25 +0200
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clocksource/drivers/timer-ti-dm: Remove an unused field
 in struct dmtimer
Content-Language: en-US
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Thomas Gleixner <tglx@linutronix.de>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
References: <c9f7579922c587fce334a1aa9651f3189de7a00b.1714513336.git.christophe.jaillet@wanadoo.fr>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <c9f7579922c587fce334a1aa9651f3189de7a00b.1714513336.git.christophe.jaillet@wanadoo.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 30/04/2024 23:42, Christophe JAILLET wrote:
> In "struct dmtimer", the 'rate' field is unused.
> Remove it.
> 
> Found with cppcheck, unusedStructMember.
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---

Applied, thanks

-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog


