Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D102A1C57C6
	for <lists+kernel-janitors@lfdr.de>; Tue,  5 May 2020 16:02:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729202AbgEEOCb (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Tue, 5 May 2020 10:02:31 -0400
Received: from mga07.intel.com ([134.134.136.100]:59050 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728135AbgEEOCb (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 5 May 2020 10:02:31 -0400
IronPort-SDR: jeQnvHRsA38Fnw2hH6WUZVJWTW0XwTKvzOpBEBQxFWOyX+jdjtwRp4nD7dK/QUs86wpHFdsUVK
 gITLkNzxwTDg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2020 07:02:30 -0700
IronPort-SDR: 93rJmCyoHhkk+rriwwq3sVSXMgxCQaTQojB+DsunC9tjC67mNz+cjOU3RtLcD95EOedRbxzTAR
 aFKET6KsZ2CQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,355,1583222400"; 
   d="scan'208";a="434495389"
Received: from marshy.an.intel.com (HELO [10.122.105.159]) ([10.122.105.159])
  by orsmga005.jf.intel.com with ESMTP; 05 May 2020 07:02:29 -0700
Subject: Re: [PATCH 4/4 v2] firmware: stratix10-svc: Slightly simplify code
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        gregkh@linuxfoundation.org, atull@kernel.org
Cc:     linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
References: <cover.1588142343.git.christophe.jaillet@wanadoo.fr>
 <8c505c686438c54da61ad4fe15e1eae722011153.1588142343.git.christophe.jaillet@wanadoo.fr>
 <1f8ae50d-6830-7fbb-e999-3e8110fe7cd6@linux.intel.com>
 <c7ac6b7c-a1d5-e001-964b-0881707c41b1@wanadoo.fr>
 <2a1de0d5-444a-2680-10b5-8578c2670d54@linux.intel.com>
 <dab419d3-5942-fa89-a352-e8917ced0744@wanadoo.fr>
From:   Richard Gong <richard.gong@linux.intel.com>
Message-ID: <b3b70de2-73af-f136-749c-51e40be9ffdc@linux.intel.com>
Date:   Tue, 5 May 2020 09:18:43 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <dab419d3-5942-fa89-a352-e8917ced0744@wanadoo.fr>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hi,

On 5/2/20 3:49 AM, Christophe JAILLET wrote:
> Le 01/05/2020 à 18:55, Richard Gong a écrit :
>> Hi,
>>
>> On 5/1/20 10:48 AM, Christophe JAILLET wrote:
>>> Le 01/05/2020 à 17:40, Richard Gong a écrit :
>>>> Hi,
>>>>
>>>> On 4/29/20 1:52 AM, Christophe JAILLET wrote:
>>>>> Replace 'devm_kmalloc_array(... | __GFP_ZERO)' with the equivalent and
>>>>> shorter 'devm_kcalloc(...)'.
>>>>>
>>>> It doesn't make much sense.
>>>> Actually devm_kcalloc returns devm_kmalloc_array(.., flag | 
>>>> __GFP_ZERO).
>>>>
>>> The only goal is to have a sightly less verbose code.
>>> This saves one line of code and there is no need to wonder why we 
>>> explicitly pass __GFP_ZERO to kmalloc_array.
>>>
>>> Mostly a matter of taste.
>> I prefer this part remain unchanged.
>>
> 
> The easiest would be just to ignore this patch entirely
Yes, please.
  but if you need
> a v3 for the series, could you tell me if you have any comments on the 3 
> other patches?
> 
I added some comments in your patch #3, also recommend putting all 
changes in one patch.

Regards,
Richard

> CJ
> 
> 
>> Regards,
>> Richard
>>
>>>
>>> 'devm_kcalloc' is inlined, so the binary should be exactly the same. >
>>> CJ
>>>
>>>>> 'ctrl->genpool' can not be NULL, so axe a useless test in the remove
>>>>> function.
>>>>>
>>>>> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
>>>>> ---
>>>>>   drivers/firmware/stratix10-svc.c | 6 ++----
>>>>>   1 file changed, 2 insertions(+), 4 deletions(-)
>>>>>
>>>>> diff --git a/drivers/firmware/stratix10-svc.c 
>>>>> b/drivers/firmware/stratix10-svc.c
>>>>> index 739004398877..c228337cb0a1 100644
>>>>> --- a/drivers/firmware/stratix10-svc.c
>>>>> +++ b/drivers/firmware/stratix10-svc.c
>>>>> @@ -1002,8 +1002,7 @@ static int stratix10_svc_drv_probe(struct 
>>>>> platform_device *pdev)
>>>>>       if (!controller)
>>>>>           return -ENOMEM;
>>>>>   -    chans = devm_kmalloc_array(dev, SVC_NUM_CHANNEL,
>>>>> -                   sizeof(*chans), GFP_KERNEL | __GFP_ZERO);
>>>>> +    chans = devm_kcalloc(dev, SVC_NUM_CHANNEL, sizeof(*chans), 
>>>>> GFP_KERNEL);
>>>>>       if (!chans)
>>>>>           return -ENOMEM;
>>>>>   @@ -1086,8 +1085,7 @@ static int stratix10_svc_drv_remove(struct 
>>>>> platform_device *pdev)
>>>>>           kthread_stop(ctrl->task);
>>>>>           ctrl->task = NULL;
>>>>>       }
>>>>> -    if (ctrl->genpool)
>>>>> -        gen_pool_destroy(ctrl->genpool);
>>>>> +    gen_pool_destroy(ctrl->genpool);
>>>>>       list_del(&ctrl->node);
>>>>>         return 0;
>>>>>
>>>>
>>>> Regards,
>>>> Richard
>>>>
>>>
>>
> 
