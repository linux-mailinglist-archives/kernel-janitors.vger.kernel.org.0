Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5286519ED73
	for <lists+kernel-janitors@lfdr.de>; Sun,  5 Apr 2020 20:52:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727076AbgDESwY (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Sun, 5 Apr 2020 14:52:24 -0400
Received: from smtp11.smtpout.orange.fr ([80.12.242.133]:48122 "EHLO
        smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726771AbgDESwY (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sun, 5 Apr 2020 14:52:24 -0400
Received: from [192.168.42.210] ([93.22.135.177])
        by mwinf5d21 with ME
        id P6sM2200R3poyyd036sMVn; Sun, 05 Apr 2020 20:52:22 +0200
X-ME-Helo: [192.168.42.210]
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sun, 05 Apr 2020 20:52:22 +0200
X-ME-IP: 93.22.135.177
Subject: Re: [PATCH] gpu/drm: ingenic: Delete an error message in
 ingenic_drm_probe()
To:     Julia Lawall <julia.lawall@inria.fr>
Cc:     kernel-janitors@vger.kernel.org
References: <e03e7106-0f22-99c4-ad21-b288e8990b5a@web.de>
 <a0a0c054-f71e-a23e-ba47-c1f6554b79e6@wanadoo.fr>
 <alpine.DEB.2.21.2004051948120.3208@hadrien>
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Message-ID: <178751cb-10db-2f1b-3eca-6c0e6fb0fb17@wanadoo.fr>
Date:   Sun, 5 Apr 2020 20:52:23 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2004051948120.3208@hadrien>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Le 05/04/2020 à 19:54, Julia Lawall a écrit :
>
> On Sun, 5 Apr 2020, Christophe JAILLET wrote:
>
>> Le 05/04/2020 à 11:30, Markus Elfring a écrit :
>>> From: Markus Elfring <elfring@users.sourceforge.net>
>>> Date: Sun, 5 Apr 2020 11:25:30 +0200
>>>
>>> The function “platform_get_irq” can log an error already.
>>> Thus omit a redundant message for the exception handling in the
>>> calling function.
>>>
>>> This issue was detected by using the Coccinelle software.
>>>
>>> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
>>> ---
>>>    drivers/gpu/drm/ingenic/ingenic-drm.c | 4 +---
>>>    1 file changed, 1 insertion(+), 3 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/ingenic/ingenic-drm.c
>>> b/drivers/gpu/drm/ingenic/ingenic-drm.c
>>> index 9dfe7cb530e1..06ca752b76ee 100644
>>> --- a/drivers/gpu/drm/ingenic/ingenic-drm.c
>>> +++ b/drivers/gpu/drm/ingenic/ingenic-drm.c
>>> @@ -661,10 +661,8 @@ static int ingenic_drm_probe(struct platform_device
>>> *pdev)
>>>    	}
>>>
>>>    	irq = platform_get_irq(pdev, 0);
>>> -	if (irq < 0) {
>>> -		dev_err(dev, "Failed to get platform irq");
>> Some 'dev_err' or equivalent functions sometimes don't have a trailing '\n'.
>> (just like here)
>> Do you think that it worth fixing? Or is it to low level value?
>>
>> According to a few grep, there seems to be quite a lot of them to fix.
>>
>> Julia, can 'coccinelle' be used for that?
> Yes, it should be possible by writing some script code.
>
> Something like
>
> @initialize:python@
> @@
> ... // define check_for_missing_nl (returning a boolean) and add_newline
>
> @r@
> constant str : script:python() { check_for_missing_nl str };
> expression e;
> @@
>
> dev_err(e,str,...)
>
> @script:python s@
> str << r.str;
> strnl;
> @@
>
> coccinelle.strnl = add_newline str
>
> @@
> constant r.str;
> identifier s.strnl;
> @@
>
> dev_err(e,
> - str
> + strnl
>    ,...)
>
> One would have to be a bit careful in add_newline to keep the "s even
> though the code pretends that strnl is an identifier.
>
> julia

Hi Julia,
thx for the sample, I'll give it a try.

CJ

>> CJ
>>
>>> +	if (irq < 0)
>>>    		return irq;
>>> -	}
>>>
>>>    	if (soc_info->needs_dev_clk) {
>>>    		priv->lcd_clk = devm_clk_get(dev, "lcd");
>>> --
>>> 2.26.0
>>>
>>>
> >


