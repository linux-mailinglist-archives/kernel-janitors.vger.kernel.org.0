Return-Path: <kernel-janitors+bounces-579-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 25AA58044E8
	for <lists+kernel-janitors@lfdr.de>; Tue,  5 Dec 2023 03:30:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 56DDD1C20C07
	for <lists+kernel-janitors@lfdr.de>; Tue,  5 Dec 2023 02:30:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CD5A8BEC;
	Tue,  5 Dec 2023 02:30:52 +0000 (UTC)
X-Original-To: kernel-janitors@vger.kernel.org
Received: from mail.nfschina.com (unknown [42.101.60.195])
	by lindbergh.monkeyblade.net (Postfix) with SMTP id 95CEAD4C;
	Mon,  4 Dec 2023 18:30:47 -0800 (PST)
Received: from [172.30.20.54] (unknown [180.167.10.98])
	by mail.nfschina.com (Maildata Gateway V2.8.8) with ESMTPSA id A473660598E85;
	Tue,  5 Dec 2023 10:30:22 +0800 (CST)
Message-ID: <098b1c0f-f303-3708-939a-28ecaf2185c3@nfschina.com>
Date: Tue, 5 Dec 2023 10:30:22 +0800
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v3] misc: mei: client.c: fix problem of return
 '-EOVERFLOW' in mei_cl_write
Content-Language: en-US
To: alexander.usyskin@intel.com, Greg KH <gregkh@linuxfoundation.org>,
 Dan Carpenter <dan.carpenter@linaro.org>
Cc: tomas.winkler@intel.com, arnd@arndb.de, nathan@kernel.org,
 ndesaulniers@google.com, trix@redhat.com, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev, kernel-janitors@vger.kernel.org
X-MD-Sfrom: suhui@nfschina.com
X-MD-SrcIP: 180.167.10.98
From: Su Hui <suhui@nfschina.com>
In-Reply-To: <2023120425-broaden-image-fdc9@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2023/12/4 21:17, Greg KH wrote:
> On Mon, Dec 04, 2023 at 04:11:31PM +0300, Dan Carpenter wrote:
>> On Mon, Dec 04, 2023 at 09:00:42AM +0100, Greg KH wrote:
>>>> diff --git a/drivers/misc/mei/client.c b/drivers/misc/mei/client.c
>>>> index 7ea80779a0e2..0489bec4fded 100644
>>>> --- a/drivers/misc/mei/client.c
>>>> +++ b/drivers/misc/mei/client.c
>>>> @@ -2033,7 +2033,7 @@ ssize_t mei_cl_write(struct mei_cl *cl, struct mei_cl_cb *cb, unsigned long time
>>>>   	hbuf_slots = mei_hbuf_empty_slots(dev);
>>>>   	if (hbuf_slots < 0) {
>>>>   		rets = -EOVERFLOW;
>>>> -		goto out;
>>>> +		goto err;
>>> Please prove that this is correct, as based on the code logic, it seems
>>> very wrong.  I can't take this unless the code is tested properly.
>> Hi Greg,
>>
>> When Su Hui sent the v2 patch you sent an auto response about adding
>> stable to the CC list.
>> https://lore.kernel.org/all/2023112042-napped-snoring-b766@gregkh/
>>
>> However, it appears that you still applied the v2 patch.  It's in
>> linux-next as commit ee6236027218 ("misc: mei: client.c: fix problem of
>> return '-EOVERFLOW' in mei_cl_write").
>>
>> When I use `git am` to apply this patch, then it doesn't apply.  However,
>> when I use cat email.txt | patch -p1 then it tries to reverse the patch
>> and apply it to a different function.
> Odd, I missed that I had already applied the first one, nevermind, that
> one is correct, this one was wrong :)

Hi,

Oh, sorry...
I'm not familiar with mei device, I send this v3 patch because of Sasha' 
s suggestion.[1]
Could Sasha give some advice about this ?
Thanks a lot :)

https://lore.kernel.org/all/CY5PR11MB63668F464A281A239FA12B6AEDBDA@CY5PR11MB6366.namprd11.prod.outlook.com/



