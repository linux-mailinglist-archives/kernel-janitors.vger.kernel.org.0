Return-Path: <kernel-janitors+bounces-242-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 82AED7E96B2
	for <lists+kernel-janitors@lfdr.de>; Mon, 13 Nov 2023 07:32:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2A950B20A65
	for <lists+kernel-janitors@lfdr.de>; Mon, 13 Nov 2023 06:32:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B3778BED;
	Mon, 13 Nov 2023 06:32:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: kernel-janitors@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 004F71FAE
	for <kernel-janitors@vger.kernel.org>; Mon, 13 Nov 2023 06:32:06 +0000 (UTC)
Received: from mail.nfschina.com (unknown [42.101.60.195])
	by lindbergh.monkeyblade.net (Postfix) with SMTP id 2F1F3D4C;
	Sun, 12 Nov 2023 22:32:05 -0800 (PST)
Received: from [172.30.11.106] (unknown [180.167.10.98])
	by mail.nfschina.com (Maildata Gateway V2.8.8) with ESMTPSA id 3389A604D5B99;
	Mon, 13 Nov 2023 14:32:01 +0800 (CST)
Message-ID: <042b7f36-aa38-0840-adc0-08ee52ec1c10@nfschina.com>
Date: Mon, 13 Nov 2023 14:32:00 +0800
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH] scsi: pm8001: return error code if no attached dev
Content-Language: en-US
To: Jason Yan <yanaijie@huawei.com>, jinpu.wang@cloud.ionos.com,
 jejb@linux.ibm.com, martin.petersen@oracle.com, nathan@kernel.org,
 ndesaulniers@google.com, trix@redhat.com
Cc: damien.lemoal@opensource.wdc.com, johannes.thumshirn@wdc.com,
 linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev, kernel-janitors@vger.kernel.org
X-MD-Sfrom: suhui@nfschina.com
X-MD-SrcIP: 180.167.10.98
From: Su Hui <suhui@nfschina.com>
In-Reply-To: <d34527f0-f708-8ec0-33ea-6fd9d4260a6b@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 2023/11/13 13:56, Jason Yan wrote:
> Hi, Su
>
> On 2023/11/13 13:01, Su Hui wrote:
>> Clang static analyzer complains that value stored to 'res' is never 
>> read.
>> Return the error code when sas_find_attached_phy_id() failed.
>>
>> Fixes: ec64858657a8 ("scsi: pm8001: Use sas_find_attached_phy_id() 
>> instead of open coding it")
>
> This 'Fixes' tag is not right. This commit is only a refactor and did 
> not change the original logic here.
>
Hi, Jason

Thanks for your reply. But I think the logic of this code is changed.

>> Signed-off-by: Su Hui <suhui@nfschina.com>
>> ---
>>   drivers/scsi/pm8001/pm8001_sas.c | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/drivers/scsi/pm8001/pm8001_sas.c 
>> b/drivers/scsi/pm8001/pm8001_sas.c
>> index a5a31dfa4512..a1f58bfff5c0 100644
>> --- a/drivers/scsi/pm8001/pm8001_sas.c
>> +++ b/drivers/scsi/pm8001/pm8001_sas.c
>> @@ -662,6 +662,8 @@ static int pm8001_dev_found_notify(struct 
>> domain_device *dev)
>>                      SAS_ADDR(dev->sas_addr),
>>                      SAS_ADDR(parent_dev->sas_addr));
>>               res = phy_id;
>> +            pm8001_free_dev(pm8001_device);
>> +            goto found_out;

Before this patch, we won't go to label 'found_out', and will call 
PM8001_CHIP_DISP->reg_dev_req() ....

After this patch, we just free the 'pm8001_device' and return the error 
code.

Or maybe I misunderstand somewhere?

Su Hui


