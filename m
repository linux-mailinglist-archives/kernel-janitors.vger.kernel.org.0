Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6083412759D
	for <lists+kernel-janitors@lfdr.de>; Fri, 20 Dec 2019 07:17:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727148AbfLTGRn (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Fri, 20 Dec 2019 01:17:43 -0500
Received: from mail-pl1-f195.google.com ([209.85.214.195]:41314 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725853AbfLTGRn (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 20 Dec 2019 01:17:43 -0500
Received: by mail-pl1-f195.google.com with SMTP id bd4so3643785plb.8
        for <kernel-janitors@vger.kernel.org>; Thu, 19 Dec 2019 22:17:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Y/VwZZiAktPRsPlg7z3TfsUsPtzRVqVqEaZ9WF2lDAQ=;
        b=lI1MJNM4B1B4trhjV7SS/pdjdGPyfxLJeao3OzcO96yVxmp4Z+bvEvAcPjbyWXW2So
         Em5LR6F8omNNfqdbXFtkXsNYo58SXEm0AyrncaqFMf+1IuC+w6zbrs9OXxHHki7U6gFQ
         cwZ5yiPJC8kXR5+rdR3sZ/hrXoCPyhL6YcY2kDyqrDg0fK8aXm0sdidvOr5FK/WCpBbD
         QyHt3JKK3ASDgpZ+qQtYxuvnx9IaIVmUcjAFIx1Ve5TquoFi2t5Oecwye0g4zx3kwoY4
         bwkh6CvhnF3nntciS5j+FCgLxAgmLj4RO8AwmVL31FI7cVWdmDwx+r8zrRqF7e7Vi1yW
         iZbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Y/VwZZiAktPRsPlg7z3TfsUsPtzRVqVqEaZ9WF2lDAQ=;
        b=ER5eBD1hnz7ln2bfUKgOE0lBa6yMmnQUdjBNmjdXDIyHlA8WmGR9G/xRKa9RWADn3o
         vgQcFeslhgV5CJSapAo959XaVLxaLzBJW9QmdEPR3HZqdN2Lg96rgL0ZcwPeaFyaZI+G
         E1k53p0Wcblv7+roE0dlp0Vd+cZjQHb16FsWVc5CNDUAp7/FSyyx5M0h49AQIBSjNHzX
         AgPQLiaChar5yijt3nWevsR2cTgCuKKl1dXq9plWn7EY5Lq7ZEp4NUkCFbeRMEi1htGP
         9ADbToUKIIWe2JdT47DG5CLy9tpF0WAkXZnzYKbY0z28eRYtvLODrSOeUyG9s8LX32Eg
         hrsQ==
X-Gm-Message-State: APjAAAVsWh4Yf7sFsfqx3zzRIOknhAxlFZD5M7DEhB6AQhdrYRbUeqel
        +VXK4R+K2zspDZwNE3C8K7V+/A==
X-Google-Smtp-Source: APXvYqypqw/ur4GeHFoIAL5efmFJPOtc8xI8QfLi9ehafysp8Pe46O9YOZWxgdZCEdwJm4Y4rS+6CA==
X-Received: by 2002:a17:902:b68c:: with SMTP id c12mr13212978pls.126.1576822661504;
        Thu, 19 Dec 2019 22:17:41 -0800 (PST)
Received: from localhost ([122.171.234.168])
        by smtp.gmail.com with ESMTPSA id w66sm11240696pfw.102.2019.12.19.22.17.40
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 19 Dec 2019 22:17:40 -0800 (PST)
Date:   Fri, 20 Dec 2019 11:47:38 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Amit Daniel Kachhap <amit.kachhap@gmail.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Javi Merino <javi.merino@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>,
        Amit Kucheria <amit.kucheria@verdurent.com>,
        linux-pm@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] thermal/drivers/cpu_cooling: Fix an IS_ERR() vs NULL bug
Message-ID: <20191220061738.jf6iiaddnaqtrqqs@vireshk-i7>
References: <20191220053750.4wcxgieqmceyhwo5@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191220053750.4wcxgieqmceyhwo5@kili.mountain>
User-Agent: NeoMutt/20180716-391-311a52
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On 20-12-19, 08:40, Dan Carpenter wrote:
> The idle_inject_register() function returns NULL on error, it never
> returns error pointers.
> 
> Fixes: 1e044f70e5c2 ("thermal/drivers/cpu_cooling: Introduce the cpu idle cooling driver")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  drivers/thermal/cpuidle_cooling.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/thermal/cpuidle_cooling.c b/drivers/thermal/cpuidle_cooling.c
> index 6d778acefeec..ab48387ce868 100644
> --- a/drivers/thermal/cpuidle_cooling.c
> +++ b/drivers/thermal/cpuidle_cooling.c
> @@ -187,8 +187,8 @@ __init cpuidle_of_cooling_register(struct device_node *np,
>  	}
>  
>  	ii_dev = idle_inject_register(drv->cpumask);
> -	if (IS_ERR(ii_dev)) {
> -		ret = PTR_ERR(ii_dev);
> +	if (!ii_dev) {
> +		ret = -ENOMEM;
>  		goto out_id;
>  	}

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
