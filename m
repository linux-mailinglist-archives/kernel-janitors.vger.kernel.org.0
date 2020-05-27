Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0203E1E35B1
	for <lists+kernel-janitors@lfdr.de>; Wed, 27 May 2020 04:32:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727837AbgE0Ccp (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Tue, 26 May 2020 22:32:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46484 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725267AbgE0Cco (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 26 May 2020 22:32:44 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB086C061A0F;
        Tue, 26 May 2020 19:32:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
        Subject:Sender:Reply-To:Content-ID:Content-Description;
        bh=vqwX3nL62hnsRYTjzd+HcapKI7p+3ZeyHRfwu1jSGt4=; b=k+Ap19YG+6FFlnEaB6/6ZCYL22
        P9G76GMxMGoCFeZ2AUwNRyjBkopvQ+fLvyaXKy0lCl++uOevjNwPPXBc8Klj0RPyeIfdsmmtdoohn
        +9ViMDMt7IbYruW+ftVHBFxjz/t300hm1sw+Hpo1nzUugn5wdMNUcUhMePYe2tB5tlZe96/skD0Ru
        8tirmuWwObHydjOHHMtjE9U9Nlq5frEuxd7aAQqaNCNXuor0ko4I1Kc+SFcYJM6GHYkZgg9t4Xm0+
        k39no0NoZ8AFHWGnexqCP9bBwQKXy6YqoGAA3GqN7D5WVhwlUdpxl+z2XlwAAIZUMGJtzKVQcJuqD
        0YOAOyYg==;
Received: from [2601:1c0:6280:3f0::19c2]
        by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1jdls1-0005Uk-By; Wed, 27 May 2020 02:32:41 +0000
Subject: Re: [PATCH -next] hwmon: amd_energy: Missing
 platform_driver_unregister() on error in amd_energy_init()
To:     "Chatradhi, Naveen Krishna" <NaveenKrishna.Chatradhi@amd.com>,
        Wei Yongjun <weiyongjun1@huawei.com>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>,
        Hulk Robot <hulkci@huawei.com>
References: <20200527022417.105620-1-weiyongjun1@huawei.com>
 <BY5PR12MB42125FF6FEE5F146C428E295E8B10@BY5PR12MB4212.namprd12.prod.outlook.com>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <5b96a406-3aea-fa63-03fb-580011728629@infradead.org>
Date:   Tue, 26 May 2020 19:32:40 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <BY5PR12MB42125FF6FEE5F146C428E295E8B10@BY5PR12MB4212.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On 5/26/20 7:28 PM, Chatradhi, Naveen Krishna wrote:
> [AMD Official Use Only - Internal Distribution Only]
> 
> Hi Yongjun,
> 
> Thanks,
> Acked-by: Naveen krishna Chatradhi <nchatrad@amd.com>
> 
> -----Original Message-----
> From: linux-hwmon-owner@vger.kernel.org <linux-hwmon-owner@vger.kernel.org> On Behalf Of Wei Yongjun
> Sent: Wednesday, May 27, 2020 7:54 AM
> To: Chatradhi, Naveen Krishna <NaveenKrishna.Chatradhi@amd.com>; Jean Delvare <jdelvare@suse.com>; Guenter Roeck <linux@roeck-us.net>
> Cc: Wei Yongjun <weiyongjun1@huawei.com>; linux-hwmon@vger.kernel.org; kernel-janitors@vger.kernel.org; Hulk Robot <hulkci@huawei.com>
> Subject: [PATCH -next] hwmon: amd_energy: Missing platform_driver_unregister() on error in amd_energy_init()
> 
> [CAUTION: External Email]
> 
> Add the missing platform_driver_unregister() before return from amd_energy_init() in the error handling case.
> 
> Fixes: 8abee9566b7e ("hwmon: Add amd_energy driver to report energy counters")
> Reported-by: Hulk Robot <hulkci@huawei.com>

Hi Yongjun,

Does this Reported-by: say (imply) that hulkci is doing semantic analysis?

Is there any writeup or summary of what hulkci does?

> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> ---
>  drivers/hwmon/amd_energy.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/hwmon/amd_energy.c b/drivers/hwmon/amd_energy.c index bc8b643a37d5..e95b7426106e 100644
> --- a/drivers/hwmon/amd_energy.c
> +++ b/drivers/hwmon/amd_energy.c
> @@ -379,8 +379,10 @@ static int __init amd_energy_init(void)
>                 return ret;
> 
>         amd_energy_platdev = platform_device_alloc(DRVNAME, 0);
> -       if (!amd_energy_platdev)
> +       if (!amd_energy_platdev) {
> +               platform_driver_unregister(&amd_energy_driver);
>                 return -ENOMEM;
> +       }
> 
>         ret = platform_device_add(amd_energy_platdev);
>         if (ret) {
> 


thanks.
-- 
~Randy

