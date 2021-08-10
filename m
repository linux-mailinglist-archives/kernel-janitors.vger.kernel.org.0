Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8BE113E55E0
	for <lists+kernel-janitors@lfdr.de>; Tue, 10 Aug 2021 10:49:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237898AbhHJItj (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Tue, 10 Aug 2021 04:49:39 -0400
Received: from smtp-relay-canonical-1.canonical.com ([185.125.188.121]:39728
        "EHLO smtp-relay-canonical-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S237571AbhHJIti (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 10 Aug 2021 04:49:38 -0400
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com [209.85.218.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPS id 90D044061A
        for <kernel-janitors@vger.kernel.org>; Tue, 10 Aug 2021 08:49:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1628585353;
        bh=CAgpG6WrguxqP2IRH8Bsd0WkckHriXozJ08neyhr3cI=;
        h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
         In-Reply-To:Content-Type;
        b=JWFi+ZDbq6bwz22bOA5b8cCyluHW+ZCYfAO7G58QBs8Td2VTaJBP9toRBhgY5lCt5
         o/vxQrYu1Q4MPKoA4xOVpyGrX57l+JbsMX0Yl/tOedtoLBwr/kzCu1G6twLohsFVtw
         XOHICZRCvtBOZ6KW3ouHSBVMoxkbE0NupFlmxZQijff2wUvwEiimmvUTZw80BWcBCq
         ZzuUXnR7ZkFO4c0AbCwbDjzta+aDkYKoYZBVTOVPdaQFrO6pw6wV/ObL7JW3mqnopu
         lF0C6mzv8spP0uq15DUooi8WWsb+9fG7zzE91hbwwJGWuQcVFf6+HMh2/RdknMUtZh
         RL5kMFIQgveaw==
Received: by mail-ej1-f70.google.com with SMTP id h17-20020a1709070b11b02905b5ced62193so287004ejl.1
        for <kernel-janitors@vger.kernel.org>; Tue, 10 Aug 2021 01:49:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=CAgpG6WrguxqP2IRH8Bsd0WkckHriXozJ08neyhr3cI=;
        b=OksNQ39ylInDgYtSMc5x9EuPWqGzznacGNYSAqSmYIE7dhn9FeX6ZhB9H8R9344xT2
         nBVKsysdLQQ0uIbHR4YpQ22fHJ76u+VbkjjjagB5gkPIgacgANAqSV8wvsYj+AYg8RGs
         26BaWZBnhF6DRmiPQUknvSTk7KcuQlBoeWWoJ9XbPP+eM8XExB4Zl/UpymKBmE6XW6hO
         UKCumDL7onwq26Coa3NOYcz7dZfs62uFUTYEhKA8vKQl9TSZ0kCFYNuuzGYeYjGfw13M
         2XTG0rK7BvveOWix6eDa9VW55STQwu1g2qD6G9/wvNe7SQOWisl6CmkkY/TqI4N/OB+f
         87bw==
X-Gm-Message-State: AOAM5311+tw9gZrypK//Sx2nijQxN8MJf/ofSfL6F3FVkLc2tmA/a77U
        lGkFXPpBYOgxg1x3D2JaRZYZQxiIziZ8UBzQpCyyEudHvgz1IJi5TTNGKaio1LWF/A25+xDZEzI
        wwE+9KgglIdz+cJoGAKk+OhQaWn7oe176FggM43HUmiW0Gw==
X-Received: by 2002:aa7:d815:: with SMTP id v21mr3613316edq.262.1628585352914;
        Tue, 10 Aug 2021 01:49:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz77fy9fLXSFWJs9Es0lAOffB7mrFKyLwbEVB/OFWy0HcQWY8xncNUb2Z+7ZIpeUXJe0xIKOA==
X-Received: by 2002:aa7:d815:: with SMTP id v21mr3613305edq.262.1628585352799;
        Tue, 10 Aug 2021 01:49:12 -0700 (PDT)
Received: from [192.168.8.102] ([86.32.42.198])
        by smtp.gmail.com with ESMTPSA id ee11sm6556872edb.26.2021.08.10.01.49.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Aug 2021 01:49:12 -0700 (PDT)
Subject: Re: [PATCH] thermal: exynos: Fix an error code in exynos_tmu_probe()
To:     Dan Carpenter <dan.carpenter@oracle.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Abhilash Kesavan <a.kesavan@samsung.com>
Cc:     Zhang Rui <rui.zhang@intel.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Amit Kucheria <amitk@kernel.org>,
        Eduardo Valentin <edubezval@gmail.com>,
        Lukasz Majewski <l.majewski@samsung.com>,
        linux-pm@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
References: <20210810084413.GA23810@kili>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <dfa9cdf6-5dc6-586f-9db3-300d4232acf0@canonical.com>
Date:   Tue, 10 Aug 2021 10:49:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210810084413.GA23810@kili>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On 10/08/2021 10:44, Dan Carpenter wrote:
> This error path return success but it should propagate the negative
> error code from devm_clk_get().
> 
> Fixes: 6c247393cfdd ("thermal: exynos: Add TMU support for Exynos7 SoC")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  drivers/thermal/samsung/exynos_tmu.c | 1 +
>  1 file changed, 1 insertion(+)
> 

Thanks, good catch!

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>


Best regards,
Krzysztof
