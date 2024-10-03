Return-Path: <kernel-janitors+bounces-5809-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 18AA298F07C
	for <lists+kernel-janitors@lfdr.de>; Thu,  3 Oct 2024 15:34:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 160F81C219AA
	for <lists+kernel-janitors@lfdr.de>; Thu,  3 Oct 2024 13:34:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 797A519CC03;
	Thu,  3 Oct 2024 13:34:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="hrJLXP5w"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 293201386BF;
	Thu,  3 Oct 2024 13:33:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727962441; cv=none; b=DOv8mD7EIut3EDglcnjvrL562GYhPKp70qitcXWWgsra9wzRYjbwEQZaeLm/7ktO3pKbn5wwtnoUA5UCtkU9bRXCp7DXETrNEboDV/roJ51snjmVHOjs+o1JlTfF7QRfKU/f5YG283pZULeHilXM4X4dg/96yHdBNlbMxCubc4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727962441; c=relaxed/simple;
	bh=kDkGldLwAsOfUsEBIxIpYsOMwP0o3rK3yuOfGjV0TQI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Oqr+UgMAi9luunR5OG1Mb2mXTSLQZ0nXfU5GeYkD8orIXauQXlfjqA2HafbW1lMs4pTXZ14DmwiIKqX7ZJXR0ZuEyI9xz+8M+z2Ns3vbj23G1njlhtgGQiOFksoAKBUvhi/JlPXEx7ByA9anbqyJ9g4bD/rsFf+bNGuLzlRUG7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=hrJLXP5w; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.88.20] (91-156-87-48.elisa-laajakaista.fi [91.156.87.48])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id E9F99593;
	Thu,  3 Oct 2024 15:32:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1727962345;
	bh=kDkGldLwAsOfUsEBIxIpYsOMwP0o3rK3yuOfGjV0TQI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=hrJLXP5wCQq2DNql2od5FbYFC+bszF2kWVzOzc0V/EL1/Uk9aIaM+oaloAKvL6NoD
	 R+b6be7U0yR/Vfib2NOV7Wz56xyj64tx4fCH1zBmWVEPWfnypw4eSGZmDjw5uXZF4u
	 xwlQsTOR/WxMeIwrlDiK9qrLaWf+8abI5RbhbHfc=
Message-ID: <ea1c37b3-0430-4bce-9228-5d761ff94425@ideasonboard.com>
Date: Thu, 3 Oct 2024 16:33:54 +0300
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH][next] media: i2c: ds90ub960: Fix missing return check on
 ub960_rxport_read call
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Colin Ian King <colin.i.king@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20241002165329.957739-1-colin.i.king@gmail.com>
 <Zv40EQSR__JDN_0M@kekkonen.localdomain>
 <f1e973fd-9933-49ed-8f9c-71b8283e6fb8@ideasonboard.com>
 <Zv6Z6P0cjYCkyJh9@kekkonen.localdomain>
Content-Language: en-US
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Autocrypt: addr=tomi.valkeinen@ideasonboard.com; keydata=
 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
In-Reply-To: <Zv6Z6P0cjYCkyJh9@kekkonen.localdomain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 03/10/2024 16:19, Sakari Ailus wrote:
> Moi,
> 
> On Thu, Oct 03, 2024 at 03:52:17PM +0300, Tomi Valkeinen wrote:
>> Hi,
>>
>> On 03/10/2024 09:05, Sakari Ailus wrote:
>>> Hi Colin,
>>>
>>> On Wed, Oct 02, 2024 at 05:53:29PM +0100, Colin Ian King wrote:
>>>> The function ub960_rxport_read is being called and afterwards ret is
>>>> being checked for any failures, however ret is not being assigned to
>>>> the return of the function call. Fix this by assigning ret to the
>>>> return of the call which appears to be missing.
>>>>
>>>> Fixes: afe267f2d368 ("media: i2c: add DS90UB960 driver")
>>>> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
>>>> ---
>>>>    drivers/media/i2c/ds90ub960.c | 2 +-
>>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/media/i2c/ds90ub960.c b/drivers/media/i2c/ds90ub960.c
>>>> index ffe5f25f8647..58424d8f72af 100644
>>>> --- a/drivers/media/i2c/ds90ub960.c
>>>> +++ b/drivers/media/i2c/ds90ub960.c
>>>> @@ -1286,7 +1286,7 @@ static int ub960_rxport_get_strobe_pos(struct ub960_data *priv,
>>>>    	clk_delay += v & UB960_IR_RX_ANA_STROBE_SET_CLK_DELAY_MASK;
>>>> -	ub960_rxport_read(priv, nport, UB960_RR_SFILTER_STS_1, &v);
>>>> +	ret = ub960_rxport_read(priv, nport, UB960_RR_SFILTER_STS_1, &v);
>>>>    	if (ret)
>>>>    		return ret;
>>>
>>> There seems to be a similar issues all around the driver. It'd be good to
>>> fix them at the same time.
>>
>> With similar issues, do you mean the code not checking the return value at
>> all for i2c reads and writes?
>>
>> In this particular case the code already checks the return value, but
>> setting the return value was missing. With a quick browse, I didn't see
>> other like this.
> 
> See e.g. ub960_clear_rx_errors(), ub960_log_status(),
> ub960_rxport_set_strobe_pos() and ub960_rxport_set_strobe_range.

Right, those don't check the return value. So they're not the same as 
the one fixed in this patch.

I'm not arguing against adding error checks, but that's a big work and I 
think this patch is a different kind of fix which should be applied 
whether the additional error checks are added or not.

Also, while still not arguing against adding the checks, it looks quite 
common to not check the returns values. E.g. it's not just a few errors 
I see if I add __must_check to cci functions.

  Tomi


