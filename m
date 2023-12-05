Return-Path: <kernel-janitors+bounces-580-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 84B36804704
	for <lists+kernel-janitors@lfdr.de>; Tue,  5 Dec 2023 04:34:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E3341B20D04
	for <lists+kernel-janitors@lfdr.de>; Tue,  5 Dec 2023 03:33:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4076C8F6B;
	Tue,  5 Dec 2023 03:33:52 +0000 (UTC)
X-Original-To: kernel-janitors@vger.kernel.org
Received: from mail.nfschina.com (unknown [42.101.60.195])
	by lindbergh.monkeyblade.net (Postfix) with SMTP id 50F4E11F;
	Mon,  4 Dec 2023 19:33:46 -0800 (PST)
Received: from [172.30.20.54] (unknown [180.167.10.98])
	by mail.nfschina.com (Maildata Gateway V2.8.8) with ESMTPSA id 93A09605CC808;
	Tue,  5 Dec 2023 11:33:36 +0800 (CST)
Message-ID: <56b21cd8-7634-895e-6610-2a087ce8fc13@nfschina.com>
Date: Tue, 5 Dec 2023 11:33:36 +0800
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v2 0/3] scsi: aic7xxx: fix some problem of return value
Content-Language: en-US
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: hare@suse.com, jejb@linux.ibm.com, martin.petersen@oracle.com,
 linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org
X-MD-Sfrom: suhui@nfschina.com
X-MD-SrcIP: 180.167.10.98
From: Su Hui <suhui@nfschina.com>
In-Reply-To: <d37560ef-d67f-4493-a7bf-1d192ff7351d@suswa.mountain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2023/12/1 15:53, Dan Carpenter wrote:
> On Fri, Dec 01, 2023 at 10:59:53AM +0800, Su Hui wrote:
>> v2:
>>   - fix some problems and split v1 patch into this patch set.(Thanks to
>>     Dan)
>>
>> v1:
>>   - https://lore.kernel.org/all/20231130024122.1193324-1-suhui@nfschina.com/
>>
> Would have been better with Fixes tags probably.  Otherwise, it looks
> good to me.

Hi, Dan

Sorry for the late reply.

I'm not sure if it's worth to add Fixes tags.
These codes are very old which come from "Linux-2.6.12-rc2".
It's seems like a cleanup or improvement.

Umm, should I send v3 patches to add Fixes tags?

Su Hui



