Return-Path: <kernel-janitors+bounces-726-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 42565817932
	for <lists+kernel-janitors@lfdr.de>; Mon, 18 Dec 2023 18:52:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DF6BB2878B7
	for <lists+kernel-janitors@lfdr.de>; Mon, 18 Dec 2023 17:52:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F26B7147F;
	Mon, 18 Dec 2023 17:50:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arista.com header.i=@arista.com header.b="Ybtf4nWf"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C935D5D739
	for <kernel-janitors@vger.kernel.org>; Mon, 18 Dec 2023 17:50:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=arista.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arista.com
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-40c256ffdbcso41845935e9.2
        for <kernel-janitors@vger.kernel.org>; Mon, 18 Dec 2023 09:50:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=arista.com; s=google; t=1702921849; x=1703526649; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Occqa1d1wrIZ9JrkFxA0ptrItrzkGFf6vJHCa/yFOBc=;
        b=Ybtf4nWfX+W36bNomyQ67b8ig1z4ey95P3ksvnYWaLtD3j/TXLYm1iUB1lqPz+ZDoq
         aksQun5dEdQiepFHG/jsKTKZphoJYsuOLKh5gbi2dbh3sDjYZZTMGwf48hMUDIaBGCoI
         HqgoWG++SbhAJwKhibnNQAIGTKZ73gvcbKgG0IF+LCbia43uc1nkuuBPwaz6B7V8zPmt
         E2K8KoYGFNPO0TOgydRakwzJwKxZ5XGx7qdXSv67gF7hxWyeF979+OliAifVRBFvuzWG
         cppN/dlOd5cDW4JhQ+bEAR8Za9/gDGGBwizFrgPu/6+wtX/2KLrDR4M1T+ycfhTTEgtu
         FwYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702921849; x=1703526649;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Occqa1d1wrIZ9JrkFxA0ptrItrzkGFf6vJHCa/yFOBc=;
        b=dYpeYBILv43BND0t619ngcagfBxIzwbRwACY13MpAtlkpQBkGnhf3OCd4QBhB3oDNQ
         7xV1x0QfTOHQuU2W9G7yLgbVPrEhETpr2xA5e7hnhOgWGV3zIKuWBD0UJVIyOowtGdv9
         JbTlgsIFLnqAOCCOCDVqyS5YN9bcLgcUI2FEcKIbgyE4Cq/rRFS79lRb0Lu70XrATZYs
         RvpwmyrlPmZWJIWSniWgmuJVsQOzFNK7qDEB7PqY5mYBsTuEXadKaCzwuCnxTPZiOA8d
         BvlmR1h/cjR0/AS5K5c0y48mcwugN/vbUS+3eH8fArme0LcMb86J3uCrW5Z8SWGzQHru
         nNMQ==
X-Gm-Message-State: AOJu0YxRBWZraDh6a7zmmNEEsNXNfwEUumeK73BjVtmFuQFHWRrLtHmk
	0KbKF7I4wX/MjapTqqqkXjoTPQ==
X-Google-Smtp-Source: AGHT+IEzdWkqKi1MfYmTW3wl7a4FaBZpV6heiMEnBKo7jRC4v2GKBHRpFX/j1mba8zTFSD5PlUMeJg==
X-Received: by 2002:a05:600c:a3af:b0:40c:2c36:2a23 with SMTP id hn47-20020a05600ca3af00b0040c2c362a23mr8185591wmb.180.1702921849029;
        Mon, 18 Dec 2023 09:50:49 -0800 (PST)
Received: from [10.83.37.178] ([217.173.96.166])
        by smtp.gmail.com with ESMTPSA id ay35-20020a05600c1e2300b0040b2b38a1fasm43508366wmb.4.2023.12.18.09.50.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Dec 2023 09:50:48 -0800 (PST)
Message-ID: <3ff06ca1-95ef-4b94-a6a7-1731fef40d8a@arista.com>
Date: Mon, 18 Dec 2023 17:50:49 +0000
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH][next] selftests/net: Fix various spelling mistakes in
 TCP-AO tests
Content-Language: en-US
To: Colin Ian King <colin.i.king@gmail.com>,
 "David S . Miller" <davem@davemloft.net>, Paolo Abeni <pabeni@redhat.com>,
 Shuah Khan <shuah@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Eric Dumazet <edumazet@google.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, linux-kselftest@vger.kernel.org
References: <20231218133022.321069-1-colin.i.king@gmail.com>
From: Dmitry Safonov <dima@arista.com>
In-Reply-To: <20231218133022.321069-1-colin.i.king@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12/18/23 13:30, Colin Ian King wrote:
> There are a handful of spelling mistakes in test messages in the
> TCP-AIO selftests. Fix these.
> 
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>

Thank you, Colin.

The patch looks good to me, my grammar and typos - not so much :-)

Reviewed-by: Dmitry Safonov <dima@arista.com>

> ---
>  tools/testing/selftests/net/tcp_ao/connect-deny.c      | 2 +-
>  tools/testing/selftests/net/tcp_ao/lib/proc.c          | 4 ++--
>  tools/testing/selftests/net/tcp_ao/setsockopt-closed.c | 2 +-
>  tools/testing/selftests/net/tcp_ao/unsigned-md5.c      | 2 +-
>  4 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/tools/testing/selftests/net/tcp_ao/connect-deny.c b/tools/testing/selftests/net/tcp_ao/connect-deny.c
> index 1ca78040d8b7..185a2f6e5ff3 100644
> --- a/tools/testing/selftests/net/tcp_ao/connect-deny.c
> +++ b/tools/testing/selftests/net/tcp_ao/connect-deny.c
> @@ -55,7 +55,7 @@ static void try_accept(const char *tst_name, unsigned int port, const char *pwd,
>  	err = test_wait_fd(lsk, timeout, 0);
>  	if (err == -ETIMEDOUT) {
>  		if (!fault(TIMEOUT))
> -			test_fail("timeouted for accept()");
> +			test_fail("timed out for accept()");
>  	} else if (err < 0) {
>  		test_error("test_wait_fd()");
>  	} else {
> diff --git a/tools/testing/selftests/net/tcp_ao/lib/proc.c b/tools/testing/selftests/net/tcp_ao/lib/proc.c
> index 2322f4d4676d..2fb6dd8adba6 100644
> --- a/tools/testing/selftests/net/tcp_ao/lib/proc.c
> +++ b/tools/testing/selftests/net/tcp_ao/lib/proc.c
> @@ -227,7 +227,7 @@ void netstat_print_diff(struct netstat *nsa, struct netstat *nsb)
>  		}
>  
>  		if (nsb->counters_nr < nsa->counters_nr)
> -			test_error("Unexpected: some counters dissapeared!");
> +			test_error("Unexpected: some counters disappeared!");
>  
>  		for (j = 0, i = 0; i < nsb->counters_nr; i++) {
>  			if (strcmp(nsb->counters[i].name, nsa->counters[j].name)) {
> @@ -244,7 +244,7 @@ void netstat_print_diff(struct netstat *nsa, struct netstat *nsb)
>  			j++;
>  		}
>  		if (j != nsa->counters_nr)
> -			test_error("Unexpected: some counters dissapeared!");
> +			test_error("Unexpected: some counters disappeared!");
>  
>  		nsb = nsb->next;
>  		nsa = nsa->next;
> diff --git a/tools/testing/selftests/net/tcp_ao/setsockopt-closed.c b/tools/testing/selftests/net/tcp_ao/setsockopt-closed.c
> index 7e4601b3f6a3..a329f42f40ce 100644
> --- a/tools/testing/selftests/net/tcp_ao/setsockopt-closed.c
> +++ b/tools/testing/selftests/net/tcp_ao/setsockopt-closed.c
> @@ -427,7 +427,7 @@ static void test_einval_del_key(void)
>  
>  	sk = prepare_defs(TCP_AO_DEL_KEY, &del);
>  	del.set_current = 1;
> -	setsockopt_checked(sk, TCP_AO_DEL_KEY, &del, ENOENT, "set non-exising current key");
> +	setsockopt_checked(sk, TCP_AO_DEL_KEY, &del, ENOENT, "set non-existing current key");
>  
>  	sk = prepare_defs(TCP_AO_DEL_KEY, &del);
>  	del.set_rnext = 1;
> diff --git a/tools/testing/selftests/net/tcp_ao/unsigned-md5.c b/tools/testing/selftests/net/tcp_ao/unsigned-md5.c
> index 7cffde02d2be..14addfd46468 100644
> --- a/tools/testing/selftests/net/tcp_ao/unsigned-md5.c
> +++ b/tools/testing/selftests/net/tcp_ao/unsigned-md5.c
> @@ -72,7 +72,7 @@ static void try_accept(const char *tst_name, unsigned int port,
>  	err = test_wait_fd(lsk, timeout, 0);
>  	if (err == -ETIMEDOUT) {
>  		if (!fault(TIMEOUT))
> -			test_fail("timeouted for accept()");
> +			test_fail("timed out for accept()");
>  	} else if (err < 0) {
>  		test_error("test_wait_fd()");
>  	} else {

Thanks,
            Dmitry


