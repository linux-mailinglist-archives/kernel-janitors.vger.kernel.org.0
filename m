Return-Path: <kernel-janitors+bounces-10098-lists+kernel-janitors=lfdr.de@vger.kernel.org>
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AJMSLUgugWl6EgMAu9opvQ
	(envelope-from <kernel-janitors+bounces-10098-lists+kernel-janitors=lfdr.de@vger.kernel.org>)
	for <lists+kernel-janitors@lfdr.de>; Tue, 03 Feb 2026 00:07:52 +0100
X-Original-To: lists+kernel-janitors@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 51DFED2981
	for <lists+kernel-janitors@lfdr.de>; Tue, 03 Feb 2026 00:07:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8783B3018765
	for <lists+kernel-janitors@lfdr.de>; Mon,  2 Feb 2026 23:07:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC88B38551C;
	Mon,  2 Feb 2026 23:07:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="HyNXgr0p"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE65F37AA83
	for <kernel-janitors@vger.kernel.org>; Mon,  2 Feb 2026 23:06:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770073620; cv=none; b=qZSlMfnm15YEryX907hq2PZ4/0AlvP7/UEGPiaXyuThsVPMacudOvFPufUh75u+aJp+IDWiXyk4Ex7kO0m+xETgYxyYhaD8S4MZ2ZOY9FeFom+qPD1LRv2pF0twF7KKaBNPS4urO8vKrPANNqiVH9hQu5QnhBY3LdS6c/WmMREo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770073620; c=relaxed/simple;
	bh=0fH9YxT6el6nAOYunQ7GfUEIZKSKjYrlP/DUEJJpERI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GVJPaKVIxpjzZ4QWE95rSsxczd/MC2XSxqfBGSTf3eb1AR2Ovd1EF3tDtnHABoFnSbXImETFizNS0PqAycT6njQOkQR+m/m1baIwWvmFgESWtEj2a66r3yZ8dE0s1oIbBxJZqvz53zu7/hMeL/XzKYycEyfjieu2RnXAjH6NFn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=HyNXgr0p; arc=none smtp.client-ip=209.85.210.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-7d18d9503eeso3768634a34.1
        for <kernel-janitors@vger.kernel.org>; Mon, 02 Feb 2026 15:06:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1770073617; x=1770678417; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9W2tEIPpOemC2y1227Ea2S2cPiUPDeGonw5JxA3WiVo=;
        b=HyNXgr0p8Lqh4QKdYUiFrZMO/Q9ptuF/7B+nCMI9iJMxGV12JlTJvAJn/c+yIkpibR
         QZb18Bj6HyqnFcE+jtf5r4IvtpeM8Q/s39+4n5seWXr4ZE3XUDvgW0eLmfNvRlDMiiuL
         NUwqNa87309auo5peyiV76IsFvlrLcIIQlr9L1Ha2j3gsRcmIEdAW/iRvlr17pQUNlFP
         5PP8W6AGkUz1ateALQgNhEcVwCTINynbGhM4OAKR0t4D/H1n05JsBgnfohtnvAyUERIX
         V20Ne7g27ESpSQlaAtyxhGpRwngRyHjXEFbCA738/r6L/v3+Bwu9laTdi96wrYCxsdsQ
         YxEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770073617; x=1770678417;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9W2tEIPpOemC2y1227Ea2S2cPiUPDeGonw5JxA3WiVo=;
        b=Kd1nC/ZXbyB4tJwV7KO1ELI4jWogyfWBxSqCcgWs07JCpJipGXTQJ4dzNUbiQ/CHa1
         njRtqiPvLcskPBtuyGQlKPzXSWcxCPDUQIMbgP39gXvtdyYIIoeKj33Ng/CEqWSgq6qc
         quu0E530KYPRfPL6zqtHO/LAsqxvKbGCw+fRuW4p0/hUhHDukZKLVQQIjthumXs2Ftgl
         c1/z/sbNpaYvhtevDnqMZr+esbDhCCmOw8PJE+9/mOEM8BsjubW5V4KRqUswYSst+XFo
         QSOhPBYwC+qAmukC8JPu55GbdUxz1/I9PQIH2qtkp3Jv6cQCuoP4fOYiczJ0Skq/urNK
         CFFQ==
X-Gm-Message-State: AOJu0YzjZq3gLFaJHtvRJa8N5Ixf/Fy4NUTr8htlenGQmBzuxoY/BTuH
	xzsB+UwvrjDjZDHCNYwqk2esKIxKBS51ql7rwH1tVihbBgd69Y5dwyhswNuTxJES+44=
X-Gm-Gg: AZuq6aKjR61SIgrO+YJf0qBmBnmgES6IHsSDN+zvG+wa2c8vVRERrdAw+AgQiAYUvFG
	nGHeshLDSzGEy243oasPY+NnYRaPdFsHUhYMPHgssM0E4CfxkDW42s066G4tzZ8ashBrT8ja0cF
	wVp4DSZ/mC6KhLu0K6tzIivDa8bxQ2VEX2T4ZRkntkpWAllBGgjs60dkd61CPrFNpxGerUUvz/S
	ZjuM6FhWBjCoDZA2Uyv4uOf4cpO7vNE0CTAI8YTKMTnPNJzrpk0ensESrKr6rls3jkqvGsXdKM5
	D5gbjc8vk1iAp4xmCSF/+w6zb1RN4SdgBjQPJppnVTBNoGgjRQWL9G3JzRFce/cBTmIaCxtV32k
	BjY/oRqgbkOIyxFcWTL3nLcqnE5ir4rhS88gvoyXsk/f8WfQ/+o3LuMmkb6oVFNNFDC0L/XUj+f
	aYjb6fga5qry27I4bJ/EeMKX0V0yVwjzMlS4xHCKJWScFb03urp8oehH+flfdm
X-Received: by 2002:a05:6830:6add:b0:7cf:e539:dcf0 with SMTP id 46e09a7af769-7d1a52974b0mr7884674a34.10.1770073617617;
        Mon, 02 Feb 2026 15:06:57 -0800 (PST)
Received: from ?IPV6:2600:8803:e7e4:500:3695:6954:27c2:42ef? ([2600:8803:e7e4:500:3695:6954:27c2:42ef])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7d18c67100fsm11635469a34.3.2026.02.02.15.06.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Feb 2026 15:06:57 -0800 (PST)
Message-ID: <62d09f1c-9869-412a-a2ea-3be81ec13ede@baylibre.com>
Date: Mon, 2 Feb 2026 17:06:56 -0600
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 next 2/5] iio: sca3000: switch IRQ handling to devm
 helpers
To: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>,
 Jonathan Cameron <jic23@kernel.org>, =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>,
 Andrew Ijano <andrew.ijano@gmail.com>,
 Antoniu Miclaus <antoniu.miclaus@analog.com>, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, error27@gmail.com,
 andriy.shevchenko@intel.com
References: <20260202194033.627967-1-harshit.m.mogalapalli@oracle.com>
 <20260202194033.627967-3-harshit.m.mogalapalli@oracle.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20260202194033.627967-3-harshit.m.mogalapalli@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_ALLOW(-0.20)[baylibre-com.20230601.gappssmtp.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-10098-lists,kernel-janitors=lfdr.de];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,intel.com];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[baylibre.com];
	FREEMAIL_TO(0.00)[oracle.com,kernel.org,analog.com,gmail.com,vger.kernel.org];
	DKIM_TRACE(0.00)[baylibre-com.20230601.gappssmtp.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dlechner@baylibre.com,kernel-janitors@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[kernel-janitors];
	DBL_BLOCKED_OPENRESOLVER(0.00)[baylibe.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:email,baylibre.com:mid,baylibre-com.20230601.gappssmtp.com:dkim]
X-Rspamd-Queue-Id: 51DFED2981
X-Rspamd-Action: no action

On 2/2/26 1:40 PM, Harshit Mogalapalli wrote:
> Convert the threaded IRQ registration to devm_request_threaded_irq() so
> that the probe and remove paths can drop manual freeing of irqs.
> 
> No functionality change.
> 
> Suggested-by: Andy Shevchenko <andriy.shevchenko@intel.com>
> Signed-off-by: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
> ---
> v1->v2: Fix indentation in devm_request_threaded_irq() call[ Thanks to
> Jonathan]
> ---
>  drivers/iio/accel/sca3000.c | 25 ++++++++-----------------
>  1 file changed, 8 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/iio/accel/sca3000.c b/drivers/iio/accel/sca3000.c
> index afe6ef61a53b..37ef724d5dc5 100644
> --- a/drivers/iio/accel/sca3000.c
> +++ b/drivers/iio/accel/sca3000.c
> @@ -1473,34 +1473,27 @@ static int sca3000_probe(struct spi_device *spi)
>  		return ret;
>  
>  	if (spi->irq) {
> -		ret = request_threaded_irq(spi->irq,
> -					   NULL,
> -					   &sca3000_event_handler,
> -					   IRQF_TRIGGER_FALLING | IRQF_ONESHOT,
> -					   "sca3000",
> -					   indio_dev);
> +		ret = devm_request_threaded_irq(dev, spi->irq, NULL,
> +						&sca3000_event_handler,
> +						IRQF_TRIGGER_FALLING | IRQF_ONESHOT,
> +						"sca3000",
> +						indio_dev);
>  		if (ret)
>  			return ret;
>  	}
>  	ret = sca3000_clean_setup(st);
>  	if (ret)
> -		goto error_free_irq;
> +		return ret;
>  
>  	ret = sca3000_print_rev(indio_dev);
>  	if (ret)
> -		goto error_free_irq;
> +		return ret;
>  
>  	ret = iio_device_register(indio_dev);
>  	if (ret)
> -		goto error_free_irq;
> +		return ret;
>  
>  	return 0;
Could return directly here already, but it gets cleaned up in a
later patch, so its OK.

Reviewed-by: David Lechner <dlechner@baylibe.com>

