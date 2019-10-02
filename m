Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6D8E6C92C0
	for <lists+kernel-janitors@lfdr.de>; Wed,  2 Oct 2019 22:06:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726978AbfJBUG6 (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Wed, 2 Oct 2019 16:06:58 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:33934 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726597AbfJBUG5 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 2 Oct 2019 16:06:57 -0400
Received: by mail-pg1-f193.google.com with SMTP id y35so209475pgl.1
        for <kernel-janitors@vger.kernel.org>; Wed, 02 Oct 2019 13:06:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=j7Oj9/NMOxxlIgyK+rsgtpkeEf8Sqt/NUKWjxaLjPJg=;
        b=cHRFCtRp3DATBrikB2f0LyWMSc83/gSCADBiAFa1Soi99gYQUDknOBH4kygMKEsecc
         6YAxpO8sFAQciMNcrj7gajbPZlQ5cg/uTOU+EfGdO5XKdL1oC9JT5K0o/pmeq3YFuZgv
         ch0tgm7SgDkNk7LnIy2NaX0hZ6cH+3u8MQNJE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=j7Oj9/NMOxxlIgyK+rsgtpkeEf8Sqt/NUKWjxaLjPJg=;
        b=jknL7yfBGpzMpcMKnkh5qVdHTY9xtHyvi8x5wWJRW0ItOzGw86h2Cs24moZFijveS6
         kJMABdzINocE1nHtp8sCvqMPn8c7AC/UDpO2kPamxgcxq5Rd4nPWXS/mSR1lPhdHInD5
         Ekn6KBSYTnrb0+C91CMjoYBgJJvjzE9pzX1wivyWqQOLYY4T0paXlLfi179TOjxNjql7
         v1y9kH18GG64sAgmhUxJePVDV5zcYcDXiPyU5LT4c42bawtbaWp6OY8l2Rx7MCyHMO4L
         gEAOo7k2npaibpBVOExs4E35T9joLG6y9gEJo0y/e+gizCFxv3FZGh3CdopHBDMdl3m8
         gC5Q==
X-Gm-Message-State: APjAAAVJ5eq7oHf9M5kivcQw5oIV5womQg2RasLwlHV9oOcRl24bYa7B
        vr1Q1n9Ek7Rwvj9ZnaWu0fziIz9nEVf6CHD4n36l5c/5P9mXSe9vecGfYUMDSOCDjNa/DD9sKbe
        M8UCt10CDzEv5x2Y6La2vooUN+osr/0TgnY4SyrkUFVosaojh0fAD4dIbLT21D2WDc1CC7LcT83
        R3C0FuNyGjV1zp
X-Google-Smtp-Source: APXvYqyu6n7HoKtW73I6bmR7b9yCXCzVyoPrRrWKJvExM8umAgR+ZD3X1S/OKEevg5PH5Sxrj6XJDQ==
X-Received: by 2002:a65:6709:: with SMTP id u9mr5780827pgf.59.1570046816188;
        Wed, 02 Oct 2019 13:06:56 -0700 (PDT)
Received: from [10.136.13.65] ([192.19.228.250])
        by smtp.gmail.com with ESMTPSA id x11sm8343937pja.3.2019.10.02.13.06.53
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 02 Oct 2019 13:06:55 -0700 (PDT)
Subject: Re: [PATCH] ns2: Fix off by one bugs in ns2_pinmux_enable()
To:     Dan Carpenter <dan.carpenter@oracle.com>,
        Ray Jui <rjui@broadcom.com>,
        Yendapally Reddy Dhananjaya Reddy 
        <yendapally.reddy@broadcom.com>
Cc:     Scott Branden <sbranden@broadcom.com>,
        bcm-kernel-feedback-list@broadcom.com,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org
References: <20190926081426.GB2332@mwanda>
From:   Scott Branden <scott.branden@broadcom.com>
Message-ID: <98717865-0417-96d7-58f3-84f6394a1bf3@broadcom.com>
Date:   Wed, 2 Oct 2019 13:06:52 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190926081426.GB2332@mwanda>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

thanks for fix.

On 2019-09-26 1:14 a.m., Dan Carpenter wrote:
> The pinctrl->functions[] array has pinctrl->num_functions elements and
> the pinctrl->groups[] array is the same way.  These are set in
> ns2_pinmux_probe().  So the > comparisons should be >= so that we don't
> read one element beyond the end of the array.
>
> Fixes: b5aa1006e4a9 ("pinctrl: ns2: add pinmux driver support for Broadcom NS2 SoC")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
Acked-by: Scott Branden <scott.branden@broadcom.com>
> ---
>   drivers/pinctrl/bcm/pinctrl-ns2-mux.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/pinctrl/bcm/pinctrl-ns2-mux.c b/drivers/pinctrl/bcm/pinctrl-ns2-mux.c
> index 2bf6af7df7d9..9fabc451550e 100644
> --- a/drivers/pinctrl/bcm/pinctrl-ns2-mux.c
> +++ b/drivers/pinctrl/bcm/pinctrl-ns2-mux.c
> @@ -640,8 +640,8 @@ static int ns2_pinmux_enable(struct pinctrl_dev *pctrl_dev,
>   	const struct ns2_pin_function *func;
>   	const struct ns2_pin_group *grp;
>   
> -	if (grp_select > pinctrl->num_groups ||
> -		func_select > pinctrl->num_functions)
> +	if (grp_select >= pinctrl->num_groups ||
> +		func_select >= pinctrl->num_functions)
>   		return -EINVAL;
>   
>   	func = &pinctrl->functions[func_select];

