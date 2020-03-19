Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A241D18B3C0
	for <lists+kernel-janitors@lfdr.de>; Thu, 19 Mar 2020 13:50:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727228AbgCSMuS (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Thu, 19 Mar 2020 08:50:18 -0400
Received: from mail-il1-f196.google.com ([209.85.166.196]:46200 "EHLO
        mail-il1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727027AbgCSMuS (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 19 Mar 2020 08:50:18 -0400
Received: by mail-il1-f196.google.com with SMTP id e8so2029587ilc.13
        for <kernel-janitors@vger.kernel.org>; Thu, 19 Mar 2020 05:50:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=e2kRurvNRM6yJzR/tywfoZ+TsjmSQexwGw7pldqtlqk=;
        b=dwGyMTV+lnE39ADUBbCiSV54RllY6/ZrunDbBcmCIqYLE7xf1n6YCb+gx24/cvPT8f
         9DtLO0kdvWE61ngyTg54esmsjShJ5Kj6AMVNhMoFPqsw5m2jBcsAPti/ezD4xt4FTiuF
         JAX7/45IJvFEQ40iFyGkBe70H1NkCJ0d5I6Po=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=e2kRurvNRM6yJzR/tywfoZ+TsjmSQexwGw7pldqtlqk=;
        b=VPFp9RZ4sGlsp+yUOua9gFNkai6XnN3jxh2IwC23k+ACC74HzX/36xeLNjBdMrLOrd
         vydBupctOfB3+uHiUnFWMoHmAHoUfjzalO+Etv3XrYyE9rGXygeqquOn6+cew2rca5iP
         gwA4cm1dlkRimMlHKe5pyY/i6EO+YyccU7eeqC2fHExZAV0VG/Du3s84uTfhxFp3p/yV
         O70wTAtZyeXb3ino8f/wKU3rGS/6Qz6LA4v4tqbdF7/9MQ/1G1nC8NLr/CtAGsD8P05D
         5FGsH0BlstzyQxn33t4Rh3yQLIX4n/jslMzkC0RsrEVvFUslhsZYmyk7IAfY+7ximlvT
         6OYA==
X-Gm-Message-State: ANhLgQ1Tj3I4BrzZNK+tYRVTfJDDLj/LRSvI+lou+XM0EZy7LbOpvnf0
        F9myH4jfQLhbNo+PoFYimCNrkLPFfj8=
X-Google-Smtp-Source: ADFU+vtW4tOKwBSP7HLQaofhdLlA0VZBLwtDh8p7i6jklH5PQzpCLqXseqN+0EB8U4rzGzpSruKZWQ==
X-Received: by 2002:a05:6e02:1090:: with SMTP id r16mr3092532ilj.198.1584622216888;
        Thu, 19 Mar 2020 05:50:16 -0700 (PDT)
Received: from [172.22.22.26] (c-73-185-129-58.hsd1.mn.comcast.net. [73.185.129.58])
        by smtp.googlemail.com with ESMTPSA id i189sm817601ild.0.2020.03.19.05.50.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Mar 2020 05:50:16 -0700 (PDT)
Subject: Re: [PATCH net-next] net: ipa: Remove unused including
 <linux/version.h>
To:     YueHaibing <yuehaibing@huawei.com>, Alex Elder <elder@kernel.org>,
        "David S . Miller" <davem@davemloft.net>
Cc:     netdev@vger.kernel.org, kernel-janitors@vger.kernel.org
References: <20200319121200.31214-1-yuehaibing@huawei.com>
From:   Alex Elder <elder@ieee.org>
Message-ID: <d47072c5-3d10-7097-1e01-5c814bb5c919@ieee.org>
Date:   Thu, 19 Mar 2020 07:50:11 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200319121200.31214-1-yuehaibing@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On 3/19/20 7:12 AM, YueHaibing wrote:
> Remove including <linux/version.h> that don't need it.
> 
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>

Looks good.  Thanks for the patches.

Reviewed-by: Alex Elder <elder@linaro.org>

> ---
>  drivers/net/ipa/ipa_endpoint.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/net/ipa/ipa_endpoint.c b/drivers/net/ipa/ipa_endpoint.c
> index 915b4cd05dd2..217cbf337ad7 100644
> --- a/drivers/net/ipa/ipa_endpoint.c
> +++ b/drivers/net/ipa/ipa_endpoint.c
> @@ -9,7 +9,6 @@
>  #include <linux/slab.h>
>  #include <linux/bitfield.h>
>  #include <linux/if_rmnet.h>
> -#include <linux/version.h>
>  #include <linux/dma-direction.h>
>  
>  #include "gsi.h"
> 
> 
> 

