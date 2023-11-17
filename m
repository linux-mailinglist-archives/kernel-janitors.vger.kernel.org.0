Return-Path: <kernel-janitors+bounces-311-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C4A297EEAA5
	for <lists+kernel-janitors@lfdr.de>; Fri, 17 Nov 2023 02:22:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6ABE0281097
	for <lists+kernel-janitors@lfdr.de>; Fri, 17 Nov 2023 01:22:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A017C1368;
	Fri, 17 Nov 2023 01:22:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: kernel-janitors@vger.kernel.org
Received: from mail.nfschina.com (unknown [42.101.60.195])
	by lindbergh.monkeyblade.net (Postfix) with SMTP id A8FA6C5;
	Thu, 16 Nov 2023 17:22:44 -0800 (PST)
Received: from [172.30.11.106] (unknown [180.167.10.98])
	by mail.nfschina.com (Maildata Gateway V2.8.8) with ESMTPSA id 04EF860107C73;
	Fri, 17 Nov 2023 09:22:25 +0800 (CST)
Message-ID: <2722c6df-9247-3d8b-272e-9810d5e19c4b@nfschina.com>
Date: Fri, 17 Nov 2023 09:22:25 +0800
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 1/2] phy: mapphone-mdm6600: fix an error code problem in
 phy_mdm6600_device_power_on
Content-Language: en-US
To: Vinod Koul <vkoul@kernel.org>
Cc: kishon@kernel.org, u.kleine-koenig@pengutronix.de,
 linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org
X-MD-Sfrom: suhui@nfschina.com
X-MD-SrcIP: 180.167.10.98
From: Su Hui <suhui@nfschina.com>
In-Reply-To: <ZVX8W8+cM0U4j6Wh@matsya>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2023/11/16 19:26, Vinod Koul wrote:
> On 20-10-23, 17:14, Su Hui wrote:
>> When wait_for_completion_timeout() failed, error is assigned
>> '-ETIMEDOUT'. But this error code is never used. Return '-ETIMEDOUT'
>> directly to fix this problem.
> Where is patch 2/2?

Hi,

Sorry, I send a error patch 2/2 because of my carelessness.

This is the address of patch 2/2 which is irrelevant about this patch.

https://lore.kernel.org/all/7f81d365-0440-de01-8be4-9c8d3ab9d69c@nfschina.com/

Su Hui

>> Signed-off-by: Su Hui <suhui@nfschina.com>
>> ---
>>
>> I'm not sure that return directly is true or not, maybe need some
>> process before return directly.
>>
>>   drivers/phy/motorola/phy-mapphone-mdm6600.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/phy/motorola/phy-mapphone-mdm6600.c b/drivers/phy/motorola/phy-mapphone-mdm6600.c
>> index 1d567604b650..e84e3390bff0 100644
>> --- a/drivers/phy/motorola/phy-mapphone-mdm6600.c
>> +++ b/drivers/phy/motorola/phy-mapphone-mdm6600.c
>> @@ -421,8 +421,8 @@ static int phy_mdm6600_device_power_on(struct phy_mdm6600 *ddata)
>>   			dev_info(ddata->dev, "Powered up OK\n");
>>   	} else {
>>   		ddata->enabled = false;
>> -		error = -ETIMEDOUT;
>>   		dev_err(ddata->dev, "Timed out powering up\n");
>> +		return -ETIMEDOUT;
>>   	}
>>   
>>   	/* Reconfigure mode1 GPIO as input for OOB wake */
>> -- 
>> 2.30.2

