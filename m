Return-Path: <kernel-janitors+bounces-10100-lists+kernel-janitors=lfdr.de@vger.kernel.org>
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aPFWE/cugWl6EgMAu9opvQ
	(envelope-from <kernel-janitors+bounces-10100-lists+kernel-janitors=lfdr.de@vger.kernel.org>)
	for <lists+kernel-janitors@lfdr.de>; Tue, 03 Feb 2026 00:10:47 +0100
X-Original-To: lists+kernel-janitors@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A087DD29AB
	for <lists+kernel-janitors@lfdr.de>; Tue, 03 Feb 2026 00:10:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BE7A0301A719
	for <lists+kernel-janitors@lfdr.de>; Mon,  2 Feb 2026 23:10:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3443938BF81;
	Mon,  2 Feb 2026 23:10:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="WDbKpL6R"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5640D37E306
	for <kernel-janitors@vger.kernel.org>; Mon,  2 Feb 2026 23:09:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770073799; cv=none; b=SL/RB1iJhv0f3s30oB8PDsuK21y9B47AnpV7G5rt/LAh7mhFAJt4T0tdK91EADHF74qy9apW0R20/iISjNEqkZz1uzVySL62V3alJ5CnKZ/lzLHOLMdGsFVoVqYF8n863dWbRswglRuVEAR9iIOkxQNjYL0kpwy78+sTWKFQnwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770073799; c=relaxed/simple;
	bh=5OwP7q4JflPXr1BxsMJT6j9uWfDTSyk/w2tuUQEZiBg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Z37/4wqVD4dmwxk7S/52fRXDe2mv+zL//eLp1pNxQrDhs2dfOju7vUSjCesFIXA/tPDr8YNDmmtUtgSJOICZIrQYfRq3vx7E5moZKNr9wuEA230dC5xW1bhHZqNUYBxrgXddP1y6Konz0KN3w4nDLpxTOepUiOeWxT72FuC3nnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=WDbKpL6R; arc=none smtp.client-ip=209.85.167.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-oi1-f174.google.com with SMTP id 5614622812f47-45efd53148eso1802348b6e.0
        for <kernel-janitors@vger.kernel.org>; Mon, 02 Feb 2026 15:09:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1770073797; x=1770678597; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tTPsyWXhp7gQeVnDTqTm1vjlVom157BoSWwibsPzNJQ=;
        b=WDbKpL6RhMiQXem/sIvc5FhLzWF2nmBxVtNyQ1W9SVPCbtUL6VGUtytJel/wN+9GzK
         ufYEvBqWOpcNkwO2RhqsPItiW9dpj2FBAsLFSNYhb5w4hAJagv5UiIr4e8t/SiwgRFoK
         MH27RwRFYOjiPF9mOXU1xc7VyEUIFTfpdtLK1sJ3PRPkiJAe2uZNepoYLIiKdwq2JwaS
         nXChOUwElKgL8bEKE9v0IaORNI8uH8plTiXKVQnaPWtFB9paKye3jiBjMwZjFfYzTHVr
         4vqYKC41LQ8PbH6FPN/bfyxAZ3CghRhkF4eXcDjB5YKZbl2oMzAoxURAhNMgfgXHmbOx
         z9XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770073797; x=1770678597;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tTPsyWXhp7gQeVnDTqTm1vjlVom157BoSWwibsPzNJQ=;
        b=Gq8mJwQGnEGnr0ssu5my2uSfcVYrm0FKaAgGlzjEF6tkEGILOEi6TRm15T3LZdJCEM
         d6k0Ee/yB8mhyLlfTRPzZYoiwUoJkMU7k3U6oOUQ5gJHNumbADhq0Ag0u8YHfvB6wlSG
         n1wF+k9k5X7LFgH28TCcJ4O7SEUcxXPO3FpBjY+54fp2tsOvs+ezKrZMZcmXTZ0o67ni
         6PTKh309fD/4MByXKXIJ0Yj7dnjj9zPMA2HMqNCWr9xFGjLbhR7F8f8z18mi8g3Uq+Ad
         NLey062b5CtziHiS3pLn/OGtfPeLR9M17nicYDNB++1TPDcLwoAJStnldRCrSARC/ygf
         sc3A==
X-Gm-Message-State: AOJu0YxRF91APepI6IE/GG1lp4oUaNm7iULipmpjvSlnowKYs992Afgn
	ZCUV4E45L24GIswIndgBwjKWgLwSekwDM2tNxZSeUIyx4rHQBTC9DvP/9qS+eiVBBcc=
X-Gm-Gg: AZuq6aIjp79SkjeWaq9uV0nf1/M2jm0o2QFRO9GiV1mb6JAWLJ1S+xn9vrl1j1Jxb9X
	euqKndF2whsPXqqCzL/4Lk1kIGSCIMe/7ts6KfOeg1jjPeCuhnXotKlsQx2D830smB60U4pzvhr
	akq4wxmmTrYi/nBnR+DaHifcwHUQ8134B5UKYZ+KyAxcXLRrTbXAzRJ+19N15e1S+OpYzbh5KcV
	Z1sLLbM64Fp+x7F61n8e4lmkZE12Rt6X/osh9gbLhTw0adAB0kPda506+lyE/CLczBeNTe39GQP
	y0ySEZhgRGI2IVdZrJWr4Qpzrpq4N61BqUybgm1Kp/0kNa2CdKrql2vpcR9A6Z0vatrb6Tg6TpF
	brA93F7QtPfS3AeErvEeSGubQj6J9CkIf+VGcMAqW2pLUeIiHvEMpAaN0JARYSRuKBYxOEqBlRa
	9z8a8K2Plmzb+aio1xPtScr29upbEkzB8g6eVJmpkj/gzPiLqmrsjcPNiaFxkH
X-Received: by 2002:a05:6808:11c9:b0:450:44b9:68e0 with SMTP id 5614622812f47-45f34b12ef3mr6948473b6e.11.1770073797185;
        Mon, 02 Feb 2026 15:09:57 -0800 (PST)
Received: from ?IPV6:2600:8803:e7e4:500:3695:6954:27c2:42ef? ([2600:8803:e7e4:500:3695:6954:27c2:42ef])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-45f08e23c09sm10292692b6e.9.2026.02.02.15.09.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Feb 2026 15:09:56 -0800 (PST)
Message-ID: <737546d0-31ea-4d24-b097-f869451d1146@baylibre.com>
Date: Mon, 2 Feb 2026 17:09:54 -0600
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 next 5/5] iio: sca3000: use guard(mutex) to simplify
 return paths
To: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>,
 Jonathan Cameron <jic23@kernel.org>, =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>,
 Gustavo Bastos <gustavobastos@usp.br>,
 Antoniu Miclaus <antoniu.miclaus@analog.com>,
 Andrew Ijano <andrew.ijano@gmail.com>, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, error27@gmail.com,
 andriy.shevchenko@intel.com
References: <20260202194033.627967-1-harshit.m.mogalapalli@oracle.com>
 <20260202194033.627967-6-harshit.m.mogalapalli@oracle.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20260202194033.627967-6-harshit.m.mogalapalli@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[baylibre-com.20230601.gappssmtp.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-10100-lists,kernel-janitors=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[oracle.com,kernel.org,analog.com,usp.br,gmail.com,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_NA(0.00)[baylibre.com];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,intel.com];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dlechner@baylibre.com,kernel-janitors@vger.kernel.org];
	DKIM_TRACE(0.00)[baylibre-com.20230601.gappssmtp.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[kernel-janitors];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[baylibre-com.20230601.gappssmtp.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,baylibre.com:mid,oracle.com:email,baylibe.com:email]
X-Rspamd-Queue-Id: A087DD29AB
X-Rspamd-Action: no action

On 2/2/26 1:40 PM, Harshit Mogalapalli wrote:
> Switch sca3000_stop_all_interrupts() to use guard(mutex).

Should always say why this patch should be considered in the commit
message. E.g. in this one we simplify the code by avoiding a goto.

> 
> Suggested-by: Jonathan Cameron <jic23@kernel.org>
> Signed-off-by: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
> ---
Reviewed-by: David Lechner <dlechner@baylibe.com>

