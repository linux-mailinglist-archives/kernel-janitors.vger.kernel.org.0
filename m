Return-Path: <kernel-janitors+bounces-339-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 107E87F0F11
	for <lists+kernel-janitors@lfdr.de>; Mon, 20 Nov 2023 10:28:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 41FD31C2154D
	for <lists+kernel-janitors@lfdr.de>; Mon, 20 Nov 2023 09:28:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2EB1F111B8;
	Mon, 20 Nov 2023 09:28:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: kernel-janitors@vger.kernel.org
Received: from mail.nfschina.com (unknown [42.101.60.195])
	by lindbergh.monkeyblade.net (Postfix) with SMTP id 3AAF2A7;
	Mon, 20 Nov 2023 01:28:34 -0800 (PST)
Received: from [172.30.11.106] (unknown [180.167.10.98])
	by mail.nfschina.com (Maildata Gateway V2.8.8) with ESMTPSA id 9E0EA633B0343;
	Mon, 20 Nov 2023 17:28:30 +0800 (CST)
Message-ID: <5c98fc07-36a9-92cc-f8d6-c4efdc0c34aa@nfschina.com>
Date: Mon, 20 Nov 2023 17:28:30 +0800
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH] misc: mei: client.c: fix some error code problem in
 mei_cl_write
Content-Language: en-US
To: Greg KH <gregkh@linuxfoundation.org>
Cc: tomas.winkler@intel.com, arnd@arndb.de, nathan@kernel.org,
 ndesaulniers@google.com, trix@redhat.com, alexander.usyskin@intel.com,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
 kernel-janitors@vger.kernel.org
X-MD-Sfrom: suhui@nfschina.com
X-MD-SrcIP: 180.167.10.98
From: Su Hui <suhui@nfschina.com>
In-Reply-To: <2023112010-ceremony-salad-145b@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2023/11/20 17:14, Greg KH wrote:
> On Mon, Nov 20, 2023 at 04:53:45PM +0800, Su Hui wrote:
>> Clang static analyzer complains that value stored to 'rets' is never
>> read. Remove some useless code, and let 'buf_len = -EOVERFLOW' to make
>> sure we can return '-EOVERFLOW'.
>>
>> mei_msg_hdr_init() return negative error code, rets should be
>> 'PTR_ERR(mei_hdr)' rather than '-PTR_ERR(mei_hdr)'.
>>
>> Fixes: 0cd7c01a60f8 ("mei: add support for mei extended header.")
>> Fixes: 8c8d964ce90f ("mei: move hbuf_depth from the mei device to the hw modules")
>> Signed-off-by: Su Hui <suhui@nfschina.com>
>> ---
>>   drivers/misc/mei/client.c | 6 ++----
>>   1 file changed, 2 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/misc/mei/client.c b/drivers/misc/mei/client.c
>> index 9c8fc87938a7..00dac0a47da0 100644
>> --- a/drivers/misc/mei/client.c
>> +++ b/drivers/misc/mei/client.c
>> @@ -2011,7 +2011,7 @@ ssize_t mei_cl_write(struct mei_cl *cl, struct mei_cl_cb *cb, unsigned long time
>>   
>>   	mei_hdr = mei_msg_hdr_init(cb);
>>   	if (IS_ERR(mei_hdr)) {
>> -		rets = -PTR_ERR(mei_hdr);
>> +		rets = PTR_ERR(mei_hdr);
> This looks like a bugfix, while the other changes here are just a normal
> cleanup.  Can you please split this up into different patches?
I will split this right now.
Thanks for your suggestion!

Su Hui

>
> thanks,
>
> greg k-h

