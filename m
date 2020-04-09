Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D9CA51A3206
	for <lists+kernel-janitors@lfdr.de>; Thu,  9 Apr 2020 11:43:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726759AbgDIJnP (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Thu, 9 Apr 2020 05:43:15 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:45558 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726641AbgDIJnN (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 9 Apr 2020 05:43:13 -0400
Received: by mail-wr1-f67.google.com with SMTP id v5so11133070wrp.12
        for <kernel-janitors@vger.kernel.org>; Thu, 09 Apr 2020 02:43:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=GOxv76VTNJn0re7QfDmZ3EwQKAGpjmry3VNCaBN+aEQ=;
        b=IP59XrEseUrCjteD617L7bdHWtqsEZx8Lje5p2DC45Lafpf/q/phhPrG3hBxueq9Ag
         mFiuXzx5ii8IdBh8hvy21u1TxyLVcX0UHUlQQgQhzKwkUv5/qSlMKzJ6BQK6/ahmvV0K
         Ir9Uq+fOX4Z8TgsnRGv7fRCz2LaXFVDwAYdOHZztVpYY/zf/batqId6+Adzxf2oYB5oR
         kYc2dTbk+T761BuKJFa5qohcQ6l7yDLjEYFjTeURoq+WkkuBYEWoMKWIcmX6Jy3ttCKJ
         YTSTwkxhg2LqycUBJgIzGn+FMiBUutTRjSNI1g0uaD58HLt9VD7ITU4D8ywEDfFAL6iM
         gJPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=GOxv76VTNJn0re7QfDmZ3EwQKAGpjmry3VNCaBN+aEQ=;
        b=fqyjv4xbX8CAZ0duQeHOKtqzaQY0C8QVdiJNEOQaJLM0R2b2O32h9rkwowOrqmSDgK
         rjof5GUtMAoSQpJKtFAQgHh971Tsedwm+PzUUZBwyfhWx4EJzX738rES4mynG5x0lY5n
         5u6pUlT3YMq9mOdSsQ/yo0eRcalMj52UL5Gh+Pe/q3tvwq6EFva8GFlPnewmlPhp5i2R
         I1goxsTjs225e0Ooi91akDCvpB9254WAdMIoc3SXT+YR7IKakrkIooKTvnp74pNA60wO
         OTVw53uA5onzEE0y5+nQP9/vTywgA8pwUC+VMtScJbZ6W0RSc/OjrPYB5A7VK7M7FnlQ
         hhBg==
X-Gm-Message-State: AGi0PuajUXowfWSqXU4U/Pk5HgrAQD1okZEwsnz0vhFtip1o6QE3NDSy
        wrYe+SMX9B5Rce6HdSg6d09T9LzfUCE=
X-Google-Smtp-Source: APiQypIIn+KJTOqwwGo0FkMWMplK9DMO0NpY4o/cCriwOi5mFiBWE9LHKwJ1GNBC8+FkmGeRaP0qew==
X-Received: by 2002:adf:fa51:: with SMTP id y17mr14071155wrr.358.1586425390597;
        Thu, 09 Apr 2020 02:43:10 -0700 (PDT)
Received: from ?IPv6:2a01:e34:ed2f:f020:e1dc:4371:fecd:8292? ([2a01:e34:ed2f:f020:e1dc:4371:fecd:8292])
        by smtp.googlemail.com with ESMTPSA id f1sm41701387wrv.37.2020.04.09.02.43.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Apr 2020 02:43:09 -0700 (PDT)
Subject: Re: [PATCH] clocksource: davinci: avoid trailing '\n' hidden in
 pr_fmt()
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        tglx@linutronix.de
Cc:     linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
References: <20200409092543.14727-1-christophe.jaillet@wanadoo.fr>
From:   Daniel Lezcano <daniel.lezcano@linaro.org>
Message-ID: <54def81a-5065-93d6-3397-5086f2d86994@linaro.org>
Date:   Thu, 9 Apr 2020 11:43:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200409092543.14727-1-christophe.jaillet@wanadoo.fr>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On 09/04/2020 11:25, Christophe JAILLET wrote:
> pr_xxx() functions usually have '\n' at the end of the logging message.
> Here, this '\n' is added via the 'pr_fmt' macro.
> 
> In order to be more consistent with other files, use a more standard
> convention and put these '\n' back in the messages themselves and remove it
> from the pr_fmt macro.
> 
> While at it, remove a useless message in case of 'kzalloc' failure,
> especially with a __GFP_NOFAIL flag.
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Applied, thanks

> ---
> Not sure that the __GFP_NOFAIL is relevant here.

No, it is not relevant.


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
