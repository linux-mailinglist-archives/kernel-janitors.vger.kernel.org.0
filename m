Return-Path: <kernel-janitors+bounces-245-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 57EDF7E96CF
	for <lists+kernel-janitors@lfdr.de>; Mon, 13 Nov 2023 07:56:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0B2121F21064
	for <lists+kernel-janitors@lfdr.de>; Mon, 13 Nov 2023 06:56:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD7BD11710;
	Mon, 13 Nov 2023 06:55:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: kernel-janitors@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97ABEF9EC
	for <kernel-janitors@vger.kernel.org>; Mon, 13 Nov 2023 06:55:57 +0000 (UTC)
Received: from mail.nfschina.com (unknown [42.101.60.195])
	by lindbergh.monkeyblade.net (Postfix) with SMTP id 389C710E6;
	Sun, 12 Nov 2023 22:55:55 -0800 (PST)
Received: from [172.30.11.106] (unknown [180.167.10.98])
	by mail.nfschina.com (Maildata Gateway V2.8.8) with ESMTPSA id 19AC8605006E4;
	Mon, 13 Nov 2023 14:55:50 +0800 (CST)
Message-ID: <8a872467-fbf4-59dd-02eb-bc69efc5bcec@nfschina.com>
Date: Mon, 13 Nov 2023 14:55:49 +0800
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
In-Reply-To: <f576b808-d99a-77f5-a1fc-f1366f6d6f4b@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2023/11/13 14:43, Jason Yan wrote:
> On 2023/11/13 14:32, Su Hui wrote:
>> On 2023/11/13 13:56, Jason Yan wrote:
>>> Hi, Su
>>>
>>> On 2023/11/13 13:01, Su Hui wrote:
>>>> Clang static analyzer complains that value stored to 'res' is never 
>>>> read.
>>>> Return the error code when sas_find_attached_phy_id() failed.
>>>>
>>>> Fixes: ec64858657a8 ("scsi: pm8001: Use sas_find_attached_phy_id() 
>>>> instead of open coding it")
>>>
>>> This 'Fixes' tag is not right. This commit is only a refactor and 
>>> did not change the original logic here.
>>>
>> Hi, Jason
>>
>> Thanks for your reply. But I think the logic of this code is changed.
>
> I,m talking about the Fixes tag: ec64858657a8 ("scsi: pm8001: Use 
> sas_find_attached_phy_id() instead of open coding it"
>
> That commit did not change the original logic. So your patch is not 
> fixing that commit.
Oh, got it.
Really thanks for your reminder! I will send v2 patch soon:).

Su Hui


