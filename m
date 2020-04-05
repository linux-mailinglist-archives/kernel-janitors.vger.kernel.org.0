Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1867419ECE1
	for <lists+kernel-janitors@lfdr.de>; Sun,  5 Apr 2020 19:27:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726830AbgDER1w (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Sun, 5 Apr 2020 13:27:52 -0400
Received: from smtp06.smtpout.orange.fr ([80.12.242.128]:56354 "EHLO
        smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726696AbgDER1w (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sun, 5 Apr 2020 13:27:52 -0400
Received: from [192.168.42.210] ([93.22.135.177])
        by mwinf5d11 with ME
        id P5Tn2200J3poyyd035ToWx; Sun, 05 Apr 2020 19:27:48 +0200
X-ME-Helo: [192.168.42.210]
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sun, 05 Apr 2020 19:27:48 +0200
X-ME-IP: 93.22.135.177
Subject: Re: [PATCH] gpu/drm: ingenic: Delete an error message in
 ingenic_drm_probe()
Cc:     Julia Lawall <Julia.Lawall@lip6.fr>
References: <e03e7106-0f22-99c4-ad21-b288e8990b5a@web.de>
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     kernel-janitors@vger.kernel.org
Message-ID: <a0a0c054-f71e-a23e-ba47-c1f6554b79e6@wanadoo.fr>
Date:   Sun, 5 Apr 2020 19:27:49 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <e03e7106-0f22-99c4-ad21-b288e8990b5a@web.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Le 05/04/2020 à 11:30, Markus Elfring a écrit :
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Sun, 5 Apr 2020 11:25:30 +0200
>
> The function “platform_get_irq” can log an error already.
> Thus omit a redundant message for the exception handling in the
> calling function.
>
> This issue was detected by using the Coccinelle software.
>
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---
>   drivers/gpu/drm/ingenic/ingenic-drm.c | 4 +---
>   1 file changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/ingenic/ingenic-drm.c b/drivers/gpu/drm/ingenic/ingenic-drm.c
> index 9dfe7cb530e1..06ca752b76ee 100644
> --- a/drivers/gpu/drm/ingenic/ingenic-drm.c
> +++ b/drivers/gpu/drm/ingenic/ingenic-drm.c
> @@ -661,10 +661,8 @@ static int ingenic_drm_probe(struct platform_device *pdev)
>   	}
>
>   	irq = platform_get_irq(pdev, 0);
> -	if (irq < 0) {
> -		dev_err(dev, "Failed to get platform irq");

Some 'dev_err' or equivalent functions sometimes don't have a trailing 
'\n'. (just like here)
Do you think that it worth fixing? Or is it to low level value?

According to a few grep, there seems to be quite a lot of them to fix.

Julia, can 'coccinelle' be used for that?

CJ

> +	if (irq < 0)
>   		return irq;
> -	}
>
>   	if (soc_info->needs_dev_clk) {
>   		priv->lcd_clk = devm_clk_get(dev, "lcd");
> --
> 2.26.0
>
>

