Return-Path: <kernel-janitors+bounces-1436-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EF7E3838FE0
	for <lists+kernel-janitors@lfdr.de>; Tue, 23 Jan 2024 14:29:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 619981F2A072
	for <lists+kernel-janitors@lfdr.de>; Tue, 23 Jan 2024 13:29:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA9FA5EE8E;
	Tue, 23 Jan 2024 13:24:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cv3YdZh9"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0E005EE81
	for <kernel-janitors@vger.kernel.org>; Tue, 23 Jan 2024 13:24:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706016262; cv=none; b=m9ZTg7hDxLonO+zBt95uXaFhwUYIMhldUgFnc7pjp4bhdGcIEHcDMEubqVCRH4Z3lUQuTH/pt89GEcsb92JEqrx1/GTSF5V6wcOkL/ZQy6+TXz2m16Fa2LQSafsMd1hNs6/GCwsyVvKeIEBHCYXgeYuVFEV9umVP5rBn6DqJ/eA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706016262; c=relaxed/simple;
	bh=VBwivXq55bfpRaa4wqaENglWS6GluVV4xbf1H2HoBDU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oEvDvfffXGblNVmlEPcN8VLo4kE7m2u24MjrY6NBB+4sMwzQjGXij+MyBgWZDGNgGbU0SBuGY42gJzvzfist5UQRZnLlYXoPJ7YnLmgUWeHbZwvhYFtRQb2i/x0jxhB74Kslk5vBgxz+1Cee5q8hiGcPnl630g8auKQusHgAFBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cv3YdZh9; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-40eb95bd2c6so8450285e9.0
        for <kernel-janitors@vger.kernel.org>; Tue, 23 Jan 2024 05:24:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706016259; x=1706621059; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=GqOYdntBo4pOdAPj1+70e2GkSN3pr+fcWBsMbKAn17o=;
        b=cv3YdZh985Lr8T/VvN/SOIgeFJqjaEwdBvBlKwn1fG1vWumuy6HcZWNnIgurn5dTmt
         ++s6OB1lNBFTNsg95NKjya3xJqWljxLSi5IX94mVwxDkPW/pApN7pN5wfE7p+G60V3Qv
         aZgRforcZ928q4/wktAbP/vx29V9Srs9moMfZtRPTSVzWCHfJFFfyr3Pp3Xf1wQ+ujl0
         QVNaWlRMDFRXfhpHxod+5UA4lOUP2vTiOYW4F7zo6q/UcIqYpPR83rQuHSa8dj/EZrnx
         L4n+4ISjdyCyLCYLvnUm9G7Z6jVTHjrnzPPRn3De22I5KT3fk6ajL02dNy5VRooP+gIz
         +ChQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706016259; x=1706621059;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GqOYdntBo4pOdAPj1+70e2GkSN3pr+fcWBsMbKAn17o=;
        b=TE8o+d7cDRUBnu3OPBYLzGWnKQjTbRdM10M41f4f3ii+wHJ9ZYGhsBU+HT6DocW/GS
         Qd10j4VWAOrWbc/JP9nEWI61IeCnpcyB5qZKITD5W5CXB6cVQlTHlDzDnrCf7C4Sjx2M
         7nR3cdRV2MUTUWXExEW/k7OGqnumRo3esL+U/hEQpr44WpNR+V7rZ0y065Ik0Yp3vgFf
         zV3ZUXV9xHUvTb0XtF3DNYrgabqW5JxjNm0Jxkzaks/BAsTW19mxfS9WtSeSpV0VqppH
         VSLWLSS2Ki7f5WDpgQT1Pauo9a8gHJhb+47QDMGcB62gHFtayAisQ+o5u1hwMxGAJ0Nk
         F6LA==
X-Gm-Message-State: AOJu0YyCk8wL8ONdv22tB5KEKvcfKh5sxhvnsqGMyr5ZYdNNmdw6wqPC
	XinRhuofgZ6j27ZVC7S4S1GvyWZMyJoKvexUGMrwI/Mm44hfnfRFCWTrLNoNgeo=
X-Google-Smtp-Source: AGHT+IFY1InWtCjiR3+ILA4ArgqoyjSVdzR7UnsDdSOE917jAfFwm5T1seKnWROvi0oTQh/VKUSYpQ==
X-Received: by 2002:a05:600c:2d16:b0:40e:4614:492e with SMTP id x22-20020a05600c2d1600b0040e4614492emr120262wmf.69.1706016259023;
        Tue, 23 Jan 2024 05:24:19 -0800 (PST)
Received: from [192.168.1.20] ([178.197.215.66])
        by smtp.gmail.com with ESMTPSA id w4-20020a05600c474400b0040d5ae2906esm46714142wmo.30.2024.01.23.05.24.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Jan 2024 05:24:18 -0800 (PST)
Message-ID: <9415e571-50a1-41d3-8205-68e4128bbe6d@linaro.org>
Date: Tue, 23 Jan 2024 14:24:17 +0100
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] nfc: hci: Save a few bytes of memory when registering a
 'nfc_llc' engine
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
 netdev@vger.kernel.org
References: <6d2b8c390907dcac2e4dc6e71f1b2db2ef8abef1.1705744530.git.christophe.jaillet@wanadoo.fr>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <6d2b8c390907dcac2e4dc6e71f1b2db2ef8abef1.1705744530.git.christophe.jaillet@wanadoo.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 20/01/2024 10:56, Christophe JAILLET wrote:
> nfc_llc_register() calls pass a string literal as the 'name' parameter.
> 
> So kstrdup_const() can be used instead of kfree() to avoid a memory
> allocation in such cases.
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

You probably need to resend it, because that time net-next was closed.
If resending, keep my tag.

Best regards,
Krzysztof


