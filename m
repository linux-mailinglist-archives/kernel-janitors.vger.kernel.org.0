Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 655301C1A07
	for <lists+kernel-janitors@lfdr.de>; Fri,  1 May 2020 17:48:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729903AbgEAPss (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Fri, 1 May 2020 11:48:48 -0400
Received: from smtp09.smtpout.orange.fr ([80.12.242.131]:35637 "EHLO
        smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729126AbgEAPsr (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 1 May 2020 11:48:47 -0400
Received: from [192.168.42.210] ([93.22.134.90])
        by mwinf5d84 with ME
        id ZToi220061xBBP903ToioQ; Fri, 01 May 2020 17:48:45 +0200
X-ME-Helo: [192.168.42.210]
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Fri, 01 May 2020 17:48:45 +0200
X-ME-IP: 93.22.134.90
Subject: Re: [PATCH 4/4 v2] firmware: stratix10-svc: Slightly simplify code
To:     Richard Gong <richard.gong@linux.intel.com>,
        gregkh@linuxfoundation.org, atull@kernel.org
Cc:     linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
References: <cover.1588142343.git.christophe.jaillet@wanadoo.fr>
 <8c505c686438c54da61ad4fe15e1eae722011153.1588142343.git.christophe.jaillet@wanadoo.fr>
 <1f8ae50d-6830-7fbb-e999-3e8110fe7cd6@linux.intel.com>
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Message-ID: <c7ac6b7c-a1d5-e001-964b-0881707c41b1@wanadoo.fr>
Date:   Fri, 1 May 2020 17:48:40 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <1f8ae50d-6830-7fbb-e999-3e8110fe7cd6@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Le 01/05/2020 à 17:40, Richard Gong a écrit :
> Hi,
>
> On 4/29/20 1:52 AM, Christophe JAILLET wrote:
>> Replace 'devm_kmalloc_array(... | __GFP_ZERO)' with the equivalent and
>> shorter 'devm_kcalloc(...)'.
>>
> It doesn't make much sense.
> Actually devm_kcalloc returns devm_kmalloc_array(.., flag | __GFP_ZERO).
>
The only goal is to have a sightly less verbose code.
This saves one line of code and there is no need to wonder why we 
explicitly pass __GFP_ZERO to kmalloc_array.

Mostly a matter of taste.

'devm_kcalloc' is inlined, so the binary should be exactly the same.

CJ

>> 'ctrl->genpool' can not be NULL, so axe a useless test in the remove
>> function.
>>
>> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
>> ---
>>   drivers/firmware/stratix10-svc.c | 6 ++----
>>   1 file changed, 2 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/firmware/stratix10-svc.c 
>> b/drivers/firmware/stratix10-svc.c
>> index 739004398877..c228337cb0a1 100644
>> --- a/drivers/firmware/stratix10-svc.c
>> +++ b/drivers/firmware/stratix10-svc.c
>> @@ -1002,8 +1002,7 @@ static int stratix10_svc_drv_probe(struct 
>> platform_device *pdev)
>>       if (!controller)
>>           return -ENOMEM;
>>   -    chans = devm_kmalloc_array(dev, SVC_NUM_CHANNEL,
>> -                   sizeof(*chans), GFP_KERNEL | __GFP_ZERO);
>> +    chans = devm_kcalloc(dev, SVC_NUM_CHANNEL, sizeof(*chans), 
>> GFP_KERNEL);
>>       if (!chans)
>>           return -ENOMEM;
>>   @@ -1086,8 +1085,7 @@ static int stratix10_svc_drv_remove(struct 
>> platform_device *pdev)
>>           kthread_stop(ctrl->task);
>>           ctrl->task = NULL;
>>       }
>> -    if (ctrl->genpool)
>> -        gen_pool_destroy(ctrl->genpool);
>> +    gen_pool_destroy(ctrl->genpool);
>>       list_del(&ctrl->node);
>>         return 0;
>>
>
> Regards,
> Richard
>

