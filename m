Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DCDBC2DB09C
	for <lists+kernel-janitors@lfdr.de>; Tue, 15 Dec 2020 16:56:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730510AbgLOPzj (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Tue, 15 Dec 2020 10:55:39 -0500
Received: from frasgout.his.huawei.com ([185.176.79.56]:2261 "EHLO
        frasgout.his.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729699AbgLOPza (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 15 Dec 2020 10:55:30 -0500
Received: from fraeml738-chm.china.huawei.com (unknown [172.18.147.207])
        by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4CwN6k0fdjz67Q2C;
        Tue, 15 Dec 2020 23:51:58 +0800 (CST)
Received: from lhreml724-chm.china.huawei.com (10.201.108.75) by
 fraeml738-chm.china.huawei.com (10.206.15.219) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Tue, 15 Dec 2020 16:54:48 +0100
Received: from [10.210.171.187] (10.210.171.187) by
 lhreml724-chm.china.huawei.com (10.201.108.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Tue, 15 Dec 2020 15:54:47 +0000
Subject: Re: [bug report] driver core: platform: Add
 devm_platform_get_irqs_affinity()
To:     Dan Carpenter <dan.carpenter@oracle.com>
CC:     "Rafael J. Wysocki" <rafael@kernel.org>,
        <kernel-janitors@vger.kernel.org>, Marc Zyngier <maz@kernel.org>,
        "Thomas Gleixner" <tglx@linutronix.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <X9jCzrzqfyEHIi26@mwanda>
From:   John Garry <john.garry@huawei.com>
Message-ID: <dde25c4d-8aee-76a7-742e-4beda275ee97@huawei.com>
Date:   Tue, 15 Dec 2020 15:54:05 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.2
MIME-Version: 1.0
In-Reply-To: <X9jCzrzqfyEHIi26@mwanda>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.210.171.187]
X-ClientProxiedBy: lhreml713-chm.china.huawei.com (10.201.108.64) To
 lhreml724-chm.china.huawei.com (10.201.108.75)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On 15/12/2020 14:06, Dan Carpenter wrote:
> Hello John Garry,

+

> 
> The patch e15f2fa959f2: "driver core: platform: Add
> devm_platform_get_irqs_affinity()" from Dec 2, 2020, leads to the
> following static checker warning:
> 
> 	drivers/base/platform.c:370 devm_platform_get_irqs_affinity()
> 	warn: 'nvec' possible negative type promoted to high
> 
> drivers/base/platform.c
>     351  int devm_platform_get_irqs_affinity(struct platform_device *dev,
>     352                                      struct irq_affinity *affd,
>     353                                      unsigned int minvec,
>     354                                      unsigned int maxvec,
>     355                                      int **irqs)
>     356  {
>     357          struct irq_affinity_devres *ptr;
>     358          struct irq_affinity_desc *desc;
>     359          size_t size;
>     360          int i, ret, nvec;
>     361
>     362          if (!affd)
>     363                  return -EPERM;
>     364
>     365          if (maxvec < minvec)
>     366                  return -ERANGE;
>     367
>     368          nvec = platform_irq_count(dev);
>     369
>     370          if (nvec < minvec)
>                      ^^^^
> If "nvec" is -EPROBE_DEFER then "minvec" is an unsigned int so it gets
> type promoted to a very high positive so it's > minvec.

Today this is kinda safe as the only in-tree user calls 
platform_get_irq() and tests for -EPROBE_DEFER prior to the 
devm_platform_get_irqs_affinity() call.

But, indeed, I should test for -EPROBE_DEFER here. And I can remove that 
platform_get_irq() I mentioned, which existed for another reason.

Thanks,
John

> 
>     371                  return -ENOSPC;
>     372
>     373          nvec = irq_calc_affinity_vectors(minvec, nvec, affd);
>     374          if (nvec < minvec)
>     375                  return -ENOSPC;
>     376
>     377          if (nvec > maxvec)
>     378                  nvec = maxvec;
>     379
>     380          size = sizeof(*ptr) + sizeof(unsigned int) * nvec;
> 
> regards,
> dan carpenter
> .
> 

