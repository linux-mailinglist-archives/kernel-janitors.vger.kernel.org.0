Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 006D3ABCAB
	for <lists+kernel-janitors@lfdr.de>; Fri,  6 Sep 2019 17:36:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404908AbfIFPgX (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Fri, 6 Sep 2019 11:36:23 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:42801 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404892AbfIFPgX (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 6 Sep 2019 11:36:23 -0400
Received: by mail-pg1-f193.google.com with SMTP id p3so3695882pgb.9
        for <kernel-janitors@vger.kernel.org>; Fri, 06 Sep 2019 08:36:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pensando.io; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=HpjEWsWBbxV4+yzrMPtf/mM7e0LTvbXiTW1Tj/dUZfQ=;
        b=cI9wCRY/+Zs4kwkoG8G6ewDFIMjERMpaVUNWJndg2lLdw/vbiaHM50YzqNm/erXVcL
         VuoQULwl8ySyMXiHkiC1KNseoTxGP0pk7QLaYEC4CJ+AFbvJxkoFT7ty73DeWMtgl8t8
         osmIHlTw376akMu8IOoUET4m7PbVo/9YZPh6k3WGI/GFzosqf8X6HSuORCYbpd5udMxv
         vmkIjipT9Oz3Cj/a+YUtvfsLzGpUznCtmXQWWX7ovgJR1+ri/OxNWv5Pwvr3K6+x8tLg
         SIIcwTHiBxppkx2+QHgSJ1zoLJqpNIxJaXsiyxIGkhTV8TWVkBBVltqLWsxAaAcmiIlB
         RieA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=HpjEWsWBbxV4+yzrMPtf/mM7e0LTvbXiTW1Tj/dUZfQ=;
        b=FgXXkPdw9HlV/wyAQHo5llvuYgWOJVo0pPNJ2eyU9/eNzGK6Sqgs/mMv42WDI0bZM8
         WjDG2rnXE7Pgvsu74/nKthNlkFvUcMljaxn+1i4SrKK0CmUdPXsRhQNVbOkg2BQZrsH9
         YVNZoQfCOwsb6xChWLwaCMA6g8joR2tJRmiW75P6KT2KOBE2ZWFnwNbD2ci4Ck7KV6+0
         LJ+vyH+K5eI67ziNt48dkt6Pi5rfUIgzmWkhgOnZC6QzVvBpWsv113ojs3Ka5o29Uju2
         /BOs4Hm+B08zN2kgrs3KOLFUfPlbMUElEV4fVh7vsof8uhLu8NKPDsMrOCWmMpQ1Ytqu
         8lUg==
X-Gm-Message-State: APjAAAXqOYk9lL6RhoWY5AZh+e4nIPShWFWUxOVRlzQGXePlBl3458mr
        0bFvVpdI+rDL4XCwqbhDZP96kS9M69Fxqg==
X-Google-Smtp-Source: APXvYqzY2AzbiTR6TecAkR9TlFGCfaBVlv/TcplEgRsaAi8ZTZk4Zr61REn7DjEbXjlq7t4rD8KlDg==
X-Received: by 2002:a63:dd16:: with SMTP id t22mr8516756pgg.140.1567784181828;
        Fri, 06 Sep 2019 08:36:21 -0700 (PDT)
Received: from Shannons-MacBook-Pro.local ([12.1.37.26])
        by smtp.gmail.com with ESMTPSA id k14sm4817415pgi.20.2019.09.06.08.36.20
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 06 Sep 2019 08:36:21 -0700 (PDT)
Subject: Re: [PATCH net-next] ionic: Remove unused including <linux/version.h>
To:     YueHaibing <yuehaibing@huawei.com>,
        Pensando Drivers <drivers@pensando.io>,
        "David S . Miller" <davem@davemloft.net>
Cc:     netdev@vger.kernel.org, kernel-janitors@vger.kernel.org
References: <20190906095410.107596-1-yuehaibing@huawei.com>
From:   Shannon Nelson <snelson@pensando.io>
Message-ID: <3556b355-0cd5-ed28-8821-525d24197d07@pensando.io>
Date:   Fri, 6 Sep 2019 08:36:19 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
 Gecko/20100101 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190906095410.107596-1-yuehaibing@huawei.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org


On 9/6/19 2:54 AM, YueHaibing wrote:
> Remove including <linux/version.h> that don't need it.
>
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> ---
>   drivers/net/ethernet/pensando/ionic/ionic_main.c | 1 -
>   1 file changed, 1 deletion(-)
>
> diff --git a/drivers/net/ethernet/pensando/ionic/ionic_main.c b/drivers/net/ethernet/pensando/ionic/ionic_main.c
> index 5ec67f3f1853..15e432386b35 100644
> --- a/drivers/net/ethernet/pensando/ionic/ionic_main.c
> +++ b/drivers/net/ethernet/pensando/ionic/ionic_main.c
> @@ -2,7 +2,6 @@
>   /* Copyright(c) 2017 - 2019 Pensando Systems, Inc */
>   
>   #include <linux/module.h>
> -#include <linux/version.h>
>   #include <linux/netdevice.h>
>   #include <linux/utsname.h>
>
>

Acked-by: Shannon Nelson <snelson@pensando.io>

