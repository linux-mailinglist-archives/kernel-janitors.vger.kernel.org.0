Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DEA8B1E212B
	for <lists+kernel-janitors@lfdr.de>; Tue, 26 May 2020 13:48:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388964AbgEZLr6 (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Tue, 26 May 2020 07:47:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49642 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388554AbgEZLr5 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 26 May 2020 07:47:57 -0400
Received: from mail-io1-xd43.google.com (mail-io1-xd43.google.com [IPv6:2607:f8b0:4864:20::d43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B3779C03E97E
        for <kernel-janitors@vger.kernel.org>; Tue, 26 May 2020 04:47:55 -0700 (PDT)
Received: by mail-io1-xd43.google.com with SMTP id u23so8473916iot.12
        for <kernel-janitors@vger.kernel.org>; Tue, 26 May 2020 04:47:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=hJWyNDI0dfOMiXPBsmO+dJ6NmJrMxzXQ5Ah4k+Qs48w=;
        b=Ln9sdbULjWwPzlacZB8rZ6PRBCoMN35xWcPIhFiVHRN+l+p5kz033Lg4NZbcE9qlSC
         8/8I1bJPinluxO1gQSp4mVEi7GJeMgX6NS8doJOdA/HFrCChbWzfg0DDlLAFYo19MK2T
         oQ71pbogTkXQvYihDrqpUBUsdiI8WTR+CTNfdY2BCdZQxYRGic3AAf/GBLVJ4kWXSXzP
         mv+Q1/lQ778qIFZm7oL7XykcUCYX0NONhMYNIKn924VyhMy8e3N0kXZdQxaz71qslH/8
         G6g79t7cfjrCF9Z3AZUsup+qMxxavvIC19G/oIMhkgEj4J8fUkleuEd29ZVR0Ui2ImWu
         wfAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=hJWyNDI0dfOMiXPBsmO+dJ6NmJrMxzXQ5Ah4k+Qs48w=;
        b=nTzmrsCzA2CgQQf+dpCXxnepNsIO5Tg+Zn58yF20wBNeTHLrBaKguHg03yUIOXbhmB
         pShwGYFeAlD6IIRQ5vvxGsXeS/+wl4BgnC4M9ZRq/g96EGw/Uyxhd8U4MU+w1lf+DI8q
         FKAVwn6F/T2sQ3VqEvi6YYIG5RbAJqWyszFBzq38euMvhwUhPeDL55kOkHU6HE5zFuVd
         KUQ9XB7Pscr9Dipb8imxYJ7ooHwOg5M3xv6uXa3BulsjG0vuYt8SdggfYbALAZohTI91
         +XbCStzCIS+rURpEzAnO5Spc8NeirfzCp8dmOySoikH3crUZk6K7syP/N4CH1HgktUa/
         w7cg==
X-Gm-Message-State: AOAM533H1nisA+bqeEzcXZl2LQItaeff1ZQKA9Tagj36u9rXvNZp+Bjz
        NvXDmAemzPg5F1AbCOOkWv0g5w==
X-Google-Smtp-Source: ABdhPJy0M+WccaWArZBw7Fw3A9iFpuwKZUZ+p5F5jSHlp7eANhyKNnAqMHBtfFpufyqF/l/67UYxdg==
X-Received: by 2002:a02:948e:: with SMTP id x14mr557913jah.3.1590493663850;
        Tue, 26 May 2020 04:47:43 -0700 (PDT)
Received: from [172.22.22.4] (c-73-185-129-58.hsd1.mn.comcast.net. [73.185.129.58])
        by smtp.googlemail.com with ESMTPSA id v76sm11165378ill.73.2020.05.26.04.47.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 May 2020 04:47:43 -0700 (PDT)
Subject: Re: [greybus-dev] [PATCH] staging: greybus: loopback: fix a spelling
 error.
To:     Till Varoquaux <till.varoquaux@gmail.com>,
        kernel-janitors@vger.kernel.org, pure.logic@nexus-software.ie
Cc:     devel@driverdev.osuosl.org, Alex Elder <elder@kernel.org>,
        trivial@kernel.org, Johan Hovold <johan@kernel.org>,
        linux-kernel@vger.kernel.org, greybus-dev@lists.linaro.org
References: <20200518051314.1785567-1-till.varoquaux@gmail.com>
From:   Alex Elder <elder@linaro.org>
Message-ID: <3f610a0c-fb15-e929-0f94-447f732659a0@linaro.org>
Date:   Tue, 26 May 2020 06:47:41 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200518051314.1785567-1-till.varoquaux@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On 5/25/20 1:10 AM, Till Varoquaux wrote:
> Successed -> succeeded.
> 
> Signed-off-by: Till Varoquaux <till.varoquaux@gmail.com>

Looks good.

Reviewed-by: Alex Elder <elder@linaro.org>

> ---
>   drivers/staging/greybus/loopback.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/greybus/loopback.c b/drivers/staging/greybus/loopback.c
> index 583d9708a191..2471448ba42a 100644
> --- a/drivers/staging/greybus/loopback.c
> +++ b/drivers/staging/greybus/loopback.c
> @@ -135,7 +135,7 @@ static ssize_t name##_##field##_show(struct device *dev,	\
>   			    char *buf)					\
>   {									\
>   	struct gb_loopback *gb = dev_get_drvdata(dev);			\
> -	/* Report 0 for min and max if no transfer successed */		\
> +	/* Report 0 for min and max if no transfer succeeded */		\
>   	if (!gb->requests_completed)					\
>   		return sprintf(buf, "0\n");				\
>   	return sprintf(buf, "%" #type "\n", gb->name.field);		\
> 

