Return-Path: <kernel-janitors+bounces-240-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 67C2B7E968C
	for <lists+kernel-janitors@lfdr.de>; Mon, 13 Nov 2023 06:57:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 182451F210C1
	for <lists+kernel-janitors@lfdr.de>; Mon, 13 Nov 2023 05:57:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B23311C9F;
	Mon, 13 Nov 2023 05:56:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: kernel-janitors@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78F6611C9D
	for <kernel-janitors@vger.kernel.org>; Mon, 13 Nov 2023 05:56:50 +0000 (UTC)
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 882561716;
	Sun, 12 Nov 2023 21:56:48 -0800 (PST)
Received: from canpemm100004.china.huawei.com (unknown [172.30.72.54])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4STJWX5g96zrV6B;
	Mon, 13 Nov 2023 13:53:28 +0800 (CST)
Received: from [10.174.179.14] (10.174.179.14) by
 canpemm100004.china.huawei.com (7.192.105.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.31; Mon, 13 Nov 2023 13:56:45 +0800
Subject: Re: [PATCH] scsi: pm8001: return error code if no attached dev
To: Su Hui <suhui@nfschina.com>, <jinpu.wang@cloud.ionos.com>,
	<jejb@linux.ibm.com>, <martin.petersen@oracle.com>, <nathan@kernel.org>,
	<ndesaulniers@google.com>, <trix@redhat.com>
CC: <damien.lemoal@opensource.wdc.com>, <johannes.thumshirn@wdc.com>,
	<linux-scsi@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<llvm@lists.linux.dev>, <kernel-janitors@vger.kernel.org>
References: <20231113050147.80818-1-suhui@nfschina.com>
From: Jason Yan <yanaijie@huawei.com>
Message-ID: <d34527f0-f708-8ec0-33ea-6fd9d4260a6b@huawei.com>
Date: Mon, 13 Nov 2023 13:56:45 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20231113050147.80818-1-suhui@nfschina.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.179.14]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 canpemm100004.china.huawei.com (7.192.105.92)
X-CFilter-Loop: Reflected

Hi, Su

On 2023/11/13 13:01, Su Hui wrote:
> Clang static analyzer complains that value stored to 'res' is never read.
> Return the error code when sas_find_attached_phy_id() failed.
> 
> Fixes: ec64858657a8 ("scsi: pm8001: Use sas_find_attached_phy_id() instead of open coding it")

This 'Fixes' tag is not right. This commit is only a refactor and did 
not change the original logic here.

Thanks,
Jason

> Signed-off-by: Su Hui <suhui@nfschina.com>
> ---
>   drivers/scsi/pm8001/pm8001_sas.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/scsi/pm8001/pm8001_sas.c b/drivers/scsi/pm8001/pm8001_sas.c
> index a5a31dfa4512..a1f58bfff5c0 100644
> --- a/drivers/scsi/pm8001/pm8001_sas.c
> +++ b/drivers/scsi/pm8001/pm8001_sas.c
> @@ -662,6 +662,8 @@ static int pm8001_dev_found_notify(struct domain_device *dev)
>   				   SAS_ADDR(dev->sas_addr),
>   				   SAS_ADDR(parent_dev->sas_addr));
>   			res = phy_id;
> +			pm8001_free_dev(pm8001_device);
> +			goto found_out;
>   		} else {
>   			pm8001_device->attached_phy = phy_id;
>   		}
> 

