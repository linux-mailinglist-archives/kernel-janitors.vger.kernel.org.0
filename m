Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C0EEDAAD3B
	for <lists+kernel-janitors@lfdr.de>; Thu,  5 Sep 2019 22:41:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390466AbfIEUlw (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Thu, 5 Sep 2019 16:41:52 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:41129 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388260AbfIEUlw (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 5 Sep 2019 16:41:52 -0400
Received: by mail-wr1-f65.google.com with SMTP id h7so3259623wrw.8;
        Thu, 05 Sep 2019 13:41:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=QuArjzMf2knHsrXJUNnbQwGWPd7vhHRxYUrOA3Vg1dg=;
        b=SF+FgKjyyZhCmG8WF2kZLrPYG9BaEvJDAEj5G7wjUGt3dcUUAj5dXroZBd+hOpObMY
         UUu8kVozvEnvUfjisxElAkeN/K8c/j7PIZT2gsYK/cAyebpj36DC1+T0bz2swwXCOIb5
         d3xc44BrsDvhbhHdsrQJja+WGQeaggnArdV45/hHjENXFl0cfNRucXmshwIJ8o9wKCen
         BaN7nZXVJLuL+t0hw1d5spFNrKr2GvL8PUpSKcJB28rUI7tXe8+59rcpxJ3quPzi3bbI
         Yp4+qs8/OA3sEup4/hneA3C9gKF8gApOPO2DnwES9HPr8MOCJ3BuU7z3uSPGvlE00fVZ
         ShFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=QuArjzMf2knHsrXJUNnbQwGWPd7vhHRxYUrOA3Vg1dg=;
        b=oJvk1/ez3saKYMzV+YsU7HwMAcbZRWXjHhyNlHbaDroSXhhgbCJyf/Lrq4tTNyk6v3
         Wgb0aR7tQLHQw0h5NDMoLqfwdOkzvWPc+5vUVwdKBl1HS0vCJR7hafJMFjw2XpyuaK8U
         djgOGBPGmtvC4vMbrjn9KaYVYDEkIguxjx94P14WDLdiSsaqVeLiBVgKYDZomDYHVTaW
         bmsszggfvNx0NYVN87U2K+JIEUs6qndJ2aZgYhaQkt7qddHlDDpR6rNnDvbmYBnKvoZm
         A8cvOyOmrAYLt6uAGT+49iS195Tu4xd9AnCHa+MvK0j82/PX5rCfF+w+WkgdEIH1oxRc
         jvZw==
X-Gm-Message-State: APjAAAUN3sZY3J94TQaX6h5FGtR7FuVmictS8ggVcU7aWrFkEx032Pen
        l5SuJxel/Uo3UCQaw5yklimvOfB2
X-Google-Smtp-Source: APXvYqxtax4X4dmR/lcEqmfeLfq9gIQM/EzJWvg7u+5Sq/9YmpkPxU7bdMXoprGkavpIycll+aLWJw==
X-Received: by 2002:a05:6000:152:: with SMTP id r18mr4506951wrx.153.1567716108924;
        Thu, 05 Sep 2019 13:41:48 -0700 (PDT)
Received: from [192.168.1.19] (chd230.neoplus.adsl.tpnet.pl. [83.31.1.230])
        by smtp.gmail.com with ESMTPSA id d12sm3316374wme.33.2019.09.05.13.41.46
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 05 Sep 2019 13:41:47 -0700 (PDT)
Subject: Re: [PATCH] led: triggers: Fix NULL dereference in led_trigger_set()
 error handling
To:     =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
        Oleh Kravchenko <oleg@kaa.org.ua>
Cc:     Dan Carpenter <dan.carpenter@oracle.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        linux-leds@vger.kernel.org, kernel-janitors@vger.kernel.org
References: <20190905095728.GA26005@mwanda>
 <20190905120626.hyegecmy6hf5lvhj@pengutronix.de>
 <BC1CA967-2B9F-44A4-A1A9-FD9C6E874991@kaa.org.ua>
 <20190905124641.eo4a6ld77q2f2prl@pengutronix.de>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=jacek.anaszewski@gmail.com; prefer-encrypt=mutual; keydata=
 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
Message-ID: <f6944fdb-5285-c88c-d227-88c1fef04568@gmail.com>
Date:   Thu, 5 Sep 2019 22:41:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190905124641.eo4a6ld77q2f2prl@pengutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On 9/5/19 2:46 PM, Uwe Kleine-König wrote:
> On Thu, Sep 05, 2019 at 03:23:21PM +0300, Oleh Kravchenko wrote:
>> Hello Jacek,
>>
>>> 5 вер. 2019 р. о 3:06 пп Uwe Kleine-König <u.kleine-koenig@pengutronix.de> написав(ла):
>>>
>>> Hello,
>>>
>>> On Thu, Sep 05, 2019 at 12:57:28PM +0300, Dan Carpenter wrote:
>>>> The problem is we set "led_cdev->trigger = NULL;" and then dereference
>>>> it when we call write_lock_irqsave():
>>>>
>>>> 	write_lock_irqsave(&led_cdev->trigger->leddev_list_lock, flags);
>>>>                            ^^^^^^^^^^^^^^^^^
>>>>
>>>> Fixes: 2282e125a406 ("leds: triggers: let struct led_trigger::activate() return an error code")
>>>> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>>>
>>> Obviously right. Thanks for catching.
>>>
>>> Reviewed-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
>>>
>>> Did you find this at runtime or by using some static checker?
>>
>> Let me summarize the chronology of the last activities below:
>> 1. I have sent the patch for the bugs that I have found by static analyzer at PVS-Studio
>>     Date: Wed, 4 Sep 2019 00:18:19 +0300
>>     https://www.spinics.net/lists/linux-leds/msg13181.html
>>
>> 2. At 5 Sep 2019 12:57:19 +0300 Time Dan Cartpen has sent the patch with the same proposal
>> 3. Uwe Kleine-König started to discuss his results of review by asking Dan on how he was found it.
>>
>> Would you mine if you will keep me as a Original author of this patch based on fact 1?
> 
> I don't care much personally but it seems fair to take Oleh's version. I
> didn't see Oleh's patch before as only Dan's was Cc:d to me.
> 
> Feel free to add my Reviewed-by also to Oleh's patch of course.

I've applied the patch from Oleh then, and added your Reviewed-by.

-- 
Best regards,
Jacek Anaszewski
