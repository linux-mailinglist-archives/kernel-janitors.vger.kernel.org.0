Return-Path: <kernel-janitors+bounces-243-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D1DFD7E96C0
	for <lists+kernel-janitors@lfdr.de>; Mon, 13 Nov 2023 07:43:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4705E280D16
	for <lists+kernel-janitors@lfdr.de>; Mon, 13 Nov 2023 06:43:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88D52F9E5;
	Mon, 13 Nov 2023 06:43:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: kernel-janitors@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B8E6125A8
	for <kernel-janitors@vger.kernel.org>; Mon, 13 Nov 2023 06:43:24 +0000 (UTC)
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4FBAFD78;
	Sun, 12 Nov 2023 22:43:23 -0800 (PST)
Received: from canpemm100004.china.huawei.com (unknown [172.30.72.53])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4STKWr06n0zMmNZ;
	Mon, 13 Nov 2023 14:38:48 +0800 (CST)
Received: from [10.174.179.14] (10.174.179.14) by
 canpemm100004.china.huawei.com (7.192.105.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.31; Mon, 13 Nov 2023 14:43:21 +0800
Subject: Re: [PATCH] scsi: pm8001: return error code if no attached dev
To: Su Hui <suhui@nfschina.com>, <jinpu.wang@cloud.ionos.com>,
	<jejb@linux.ibm.com>, <martin.petersen@oracle.com>, <nathan@kernel.org>,
	<ndesaulniers@google.com>, <trix@redhat.com>
CC: <damien.lemoal@opensource.wdc.com>, <johannes.thumshirn@wdc.com>,
	<linux-scsi@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<llvm@lists.linux.dev>, <kernel-janitors@vger.kernel.org>
References: <042b7f36-aa38-0840-adc0-08ee52ec1c10@nfschina.com>
From: Jason Yan <yanaijie@huawei.com>
Message-ID: <f576b808-d99a-77f5-a1fc-f1366f6d6f4b@huawei.com>
Date: Mon, 13 Nov 2023 14:43:20 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <042b7f36-aa38-0840-adc0-08ee52ec1c10@nfschina.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.179.14]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 canpemm100004.china.huawei.com (7.192.105.92)
X-CFilter-Loop: Reflected

On 2023/11/13 14:32, Su Hui wrote:
> On 2023/11/13 13:56, Jason Yan wrote:
>> Hi, Su
>>
>> On 2023/11/13 13:01, Su Hui wrote:
>>> Clang static analyzer complains that value stored to 'res' is never 
>>> read.
>>> Return the error code when sas_find_attached_phy_id() failed.
>>>
>>> Fixes: ec64858657a8 ("scsi: pm8001: Use sas_find_attached_phy_id() 
>>> instead of open coding it")
>>
>> This 'Fixes' tag is not right. This commit is only a refactor and did 
>> not change the original logic here.
>>
> Hi, Jason
> 
> Thanks for your reply. But I think the logic of this code is changed.

I,m talking about the Fixes tag: ec64858657a8 ("scsi: pm8001: Use 
sas_find_attached_phy_id() instead of open coding it"

That commit did not change the original logic. So your patch is not 
fixing that commit.

> 
>>> Signed-off-by: Su Hui <suhui@nfschina.com>
>>> ---
>>>   drivers/scsi/pm8001/pm8001_sas.c | 2 ++
>>>   1 file changed, 2 insertions(+)
>>>
>>> diff --git a/drivers/scsi/pm8001/pm8001_sas.c 
>>> b/drivers/scsi/pm8001/pm8001_sas.c
>>> index a5a31dfa4512..a1f58bfff5c0 100644
>>> --- a/drivers/scsi/pm8001/pm8001_sas.c
>>> +++ b/drivers/scsi/pm8001/pm8001_sas.c
>>> @@ -662,6 +662,8 @@ static int pm8001_dev_found_notify(struct 
>>> domain_device *dev)
>>>                      SAS_ADDR(dev->sas_addr),
>>>                      SAS_ADDR(parent_dev->sas_addr));
>>>               res = phy_id;
>>> +            pm8001_free_dev(pm8001_device);
>>> +            goto found_out;
> 
> Before this patch, we won't go to label 'found_out', and will call 
> PM8001_CHIP_DISP->reg_dev_req() ....
> 
> After this patch, we just free the 'pm8001_device' and return the error 
> code.
> 
> Or maybe I misunderstand somewhere?

Sorry, but I'm not talking about your patch.

Thanks,
Jason

> 
> Su Hui
> 
> 
> .

