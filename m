Return-Path: <kernel-janitors+bounces-9140-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FB5BB517AB
	for <lists+kernel-janitors@lfdr.de>; Wed, 10 Sep 2025 15:11:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0625216B482
	for <lists+kernel-janitors@lfdr.de>; Wed, 10 Sep 2025 13:11:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B5D2319852;
	Wed, 10 Sep 2025 13:11:02 +0000 (UTC)
X-Original-To: kernel-janitors@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6235E31D73B
	for <kernel-janitors@vger.kernel.org>; Wed, 10 Sep 2025 13:10:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757509861; cv=none; b=IPTf1q0x11d+Bef3FdPmB70//iG+94Q0cCU8wQVO2wMt/0MHl5boKI5RfSSFOmAV8pnBsVN8yzGqQcqTwhqkTi9IWJXjjsTZTD3NwAirbp6mAXqXEHdcDdq1ATk/ANmg79X69VTBU6TC1Ejuozqq/FrrdxXMUiO+hk65S6sAz4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757509861; c=relaxed/simple;
	bh=gO2Ks0VHsePKcc510DSGBUvhSSCMEAo5Wf85gCZL4zA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fdfUEQSQuE82nNumQjfu1l/2RD9isdy3IyuCDEn6l9Ur20HQSMH2FIc/65uAN3MWktEKfvIKMFtRA1rfJJUyLQozeocubF4MlmhDZ2jyFu+vrE0WjAMsaSsJ3cf6BGDDq+ciDs6PhF9i3Rw/cissuRvlUAqK344htm73FPHmMqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[IPV6:::1])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.92)
	(envelope-from <s.kerkmann@pengutronix.de>)
	id 1uwKb0-0006er-EU; Wed, 10 Sep 2025 15:10:46 +0200
Message-ID: <c3f3370f-1f2c-4e35-81a4-4303aed2d438@pengutronix.de>
Date: Wed, 10 Sep 2025 15:10:44 +0200
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH next] wifi: mwifiex: fix double free in
 mwifiex_send_rgpower_table()
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Brian Norris <briannorris@chromium.org>,
 Francesco Dolcini <francesco@dolcini.it>,
 Johannes Berg <johannes.berg@intel.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, Jeff Chen <jeff.chen_1@nxp.com>,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org
References: <aLqZBh5_dSHUb4AE@stanley.mountain>
From: Stefan Kerkmann <s.kerkmann@pengutronix.de>
Content-Language: en-US, de-DE
In-Reply-To: <aLqZBh5_dSHUb4AE@stanley.mountain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: s.kerkmann@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: kernel-janitors@vger.kernel.org

Hi Dan,

thanks for spotting and fixing the double free error. I converted the 
code to use the cleanup helper late in the dev process and forgot to 
remove the call. I sent a patch for the endianness bug as well.

On 05.09.25 10:02, Dan Carpenter wrote:
> The "hostcmd" is freed using cleanup.h, so calling kfree() will lead to
> a double free.  Delete the kfree().
> 
> Fixes: 7b6f16a25806 ("wifi: mwifiex: add rgpower table loading support")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>   drivers/net/wireless/marvell/mwifiex/sta_cmd.c | 4 +---
>   1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/net/wireless/marvell/mwifiex/sta_cmd.c b/drivers/net/wireless/marvell/mwifiex/sta_cmd.c
> index 6d9e2af29a69..91d5098081e8 100644
> --- a/drivers/net/wireless/marvell/mwifiex/sta_cmd.c
> +++ b/drivers/net/wireless/marvell/mwifiex/sta_cmd.c
> @@ -1521,10 +1521,8 @@ int mwifiex_send_rgpower_table(struct mwifiex_private *priv, const u8 *data,
>   		return -ENOMEM;
>   
>   	_data = kmemdup(data, size, GFP_KERNEL);
> -	if (!_data) {
> -		kfree(hostcmd);
> +	if (!_data)
>   		return -ENOMEM;
> -	}
>   
>   	pos = _data;
>   	ptr = hostcmd->cmd;

Thank you,
Stefan

-- 
Pengutronix e.K.                       | Stefan Kerkmann             |
Steuerwalder Str. 21                   | https://www.pengutronix.de/ |
31137 Hildesheim, Germany              | Phone: +49-5121-206917-128  |
Amtsgericht Hildesheim, HRA 2686       | Fax:   +49-5121-206917-9    |


