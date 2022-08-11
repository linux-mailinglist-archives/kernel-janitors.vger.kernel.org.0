Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A8C9C590793
	for <lists+kernel-janitors@lfdr.de>; Thu, 11 Aug 2022 22:52:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235462AbiHKUwU (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Thu, 11 Aug 2022 16:52:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56352 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235054AbiHKUwS (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 11 Aug 2022 16:52:18 -0400
Received: from smtp.smtpout.orange.fr (smtp-22.smtpout.orange.fr [80.12.242.22])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36520BCAD
        for <kernel-janitors@vger.kernel.org>; Thu, 11 Aug 2022 13:52:17 -0700 (PDT)
Received: from [192.168.1.18] ([90.11.190.129])
        by smtp.orange.fr with ESMTPA
        id MFA5oKDSTAOp2MFA5ogqBf; Thu, 11 Aug 2022 22:52:15 +0200
X-ME-Helo: [192.168.1.18]
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Thu, 11 Aug 2022 22:52:15 +0200
X-ME-IP: 90.11.190.129
Message-ID: <3f1f9300-1d5e-22f8-f544-475a9840d14c@wanadoo.fr>
Date:   Thu, 11 Aug 2022 22:52:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] watchdog: ftwdt010_wdt: fix test for platform_get_irq()
 failure
Content-Language: en-US
To:     Dan Carpenter <dan.carpenter@oracle.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     Guenter Roeck <linux@roeck-us.net>, linux-watchdog@vger.kernel.org,
        kernel-janitors@vger.kernel.org
References: <YvTgRk/ABp62/hNA@kili>
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <YvTgRk/ABp62/hNA@kili>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Le 11/08/2022 à 12:56, Dan Carpenter a écrit :
> This code assumes that platform_get_irq() function returns zero on
> failure.  In fact, platform_get_irq() never returns zero.  It returns
> negative error codes or positive non-zero values on success.
> 
> Fixes: eca10ae6000d ("watchdog: add driver for Cortina Gemini watchdog")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>   drivers/watchdog/ftwdt010_wdt.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/watchdog/ftwdt010_wdt.c b/drivers/watchdog/ftwdt010_wdt.c
> index 21dcc7765688..02112fc264bd 100644
> --- a/drivers/watchdog/ftwdt010_wdt.c
> +++ b/drivers/watchdog/ftwdt010_wdt.c
> @@ -156,7 +156,7 @@ static int ftwdt010_wdt_probe(struct platform_device *pdev)
>   	}
>   
>   	irq = platform_get_irq(pdev, 0);
> -	if (irq) {
> +	if (irq > 0) {
>   		ret = devm_request_irq(dev, irq, ftwdt010_wdt_interrupt, 0,
>   				       "watchdog bark", gwdt);
>   		if (ret)

Hi,
can't platform_get_irq() return 0?
All the paths in platform_get_irq() look like 0 is a valid value.

The other patches you just sent are "< 0 ==> error", so ">= 0 ==> valid"

Any reason here for >0?

CJ
