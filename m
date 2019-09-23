Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B0103BB2DB
	for <lists+kernel-janitors@lfdr.de>; Mon, 23 Sep 2019 13:34:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730116AbfIWLeH (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Mon, 23 Sep 2019 07:34:07 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:42148 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728624AbfIWLeH (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 23 Sep 2019 07:34:07 -0400
Received: by mail-lj1-f196.google.com with SMTP id y23so13302194lje.9
        for <kernel-janitors@vger.kernel.org>; Mon, 23 Sep 2019 04:34:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=1iHVMQKqhTvi2xyeEpHSWZnbXdJb6BZcBgLx05z/RJY=;
        b=zAsyPvNJsGYcnnQeTbbprStzO4yMGANU4Wwf8P25L0D1n7azLLG750ich1xVRaWDAW
         IyAmTFGaVwCJP9xiUik/8q1b66zr5cFf/PG4QRArX19JS2/PwOhFis27q9CH5IQFsysc
         IgjgN8DM+EhVr1ffjmOsBsngMuGC94o0StTmi8fH6jmvYVS/LlBjgjM+UkpoZerHGp6z
         LXaU9ZShi7/y/Ab2WMrtyF6IRiCp2pmUvmooh3KCl4I4dI7zDmL/n2AFYqE3OsIifJyt
         6xY4M3QgfFH8s4DCfBRwSCg7ZbiUvuwl9kfgIS3JzDNAIos56QJeqRygXAFE+sMLd3YD
         aIHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=1iHVMQKqhTvi2xyeEpHSWZnbXdJb6BZcBgLx05z/RJY=;
        b=AC22IKvdgYW9oQvRlYXLzZkMxg7pcPnljWnIdFVbKfXAauMUB/eUdLbFwvxyKUWgUr
         asZswxiOrOm+5XgvKb3+nqtblYKgxJGWHNgqGMCCkcfIJ8RJAnZJyTk7iipNSvHosJZ5
         OOoV+IfDvgDa+r/p+ZUvn0ySVNPg0IYupCyBHElwc+K19bLuEEHpKNnyBRpSXvbi9E+D
         RcV8R9aFgsdrrkqEKEE6ZO+pZ//+ZKTFDRQKckU3bmMwhK0fZzppzgka/oXWXBx/OgD2
         5gfqQybKaog7zhlvlPGaeXmbCR+JDa9t7oR9NMrWj8vxpOJWivtOmDDNVDmchFvLTBoK
         vshA==
X-Gm-Message-State: APjAAAVWg6OwDR6TqIY/btHLIZ7+izMNDFn5nRraHeaEa4u9dUle26MB
        jhkYB9tbnHqF1xmPUZvAq8K6DA==
X-Google-Smtp-Source: APXvYqyLM/Stp8gNwOtRCJqDNGvGHQVfcCbloLsy0YfOl+HNNgEkESrWd92Ftx28l5PJGALh+qbOug==
X-Received: by 2002:a2e:8789:: with SMTP id n9mr17263051lji.52.1569238444804;
        Mon, 23 Sep 2019 04:34:04 -0700 (PDT)
Received: from localhost (h-93-159.A463.priv.bahnhof.se. [46.59.93.159])
        by smtp.gmail.com with ESMTPSA id 126sm2326083lfh.45.2019.09.23.04.34.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Sep 2019 04:34:04 -0700 (PDT)
Date:   Mon, 23 Sep 2019 13:34:03 +0200
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>
To:     Markus Elfring <Markus.Elfring@web.de>
Cc:     linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Tiffany Lin <tiffany.lin@mediatek.com>,
        LKML <linux-kernel@vger.kernel.org>,
        kernel-janitors@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Himanshu Jha <himanshujha199640@gmail.com>
Subject: Re: [PATCH] media: platform: Use devm_platform_ioremap_resource() in
 two functions
Message-ID: <20190923113403.GA14837@bigcity.dyn.berto.se>
References: <d80a685a-c3de-b9c9-ad32-e1da9308c393@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d80a685a-c3de-b9c9-ad32-e1da9308c393@web.de>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hi Markus,

Thanks for your patch.

On 2019-09-18 11:30:30 +0200, Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Wed, 18 Sep 2019 11:20:48 +0200
> 
> Simplify these function implementations by using a known wrapper function.
> 
> This issue was detected by using the Coccinelle software.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---
>  drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c | 8 +-------
>  drivers/media/platform/rcar-vin/rcar-core.c            | 7 +------

For rcar-vin:

Tested-by: Niklas S�derlund <niklas.soderlund@ragnatech.se>

>  2 files changed, 2 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
> index 00d090df11bb..944771ee5f5c 100644
> --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
> +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
> @@ -253,13 +253,7 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
>  	}
> 
>  	for (i = 0; i < NUM_MAX_VDEC_REG_BASE; i++) {
> -		res = platform_get_resource(pdev, IORESOURCE_MEM, i);
> -		if (res == NULL) {
> -			dev_err(&pdev->dev, "get memory resource failed.");
> -			ret = -ENXIO;
> -			goto err_res;
> -		}
> -		dev->reg_base[i] = devm_ioremap_resource(&pdev->dev, res);
> +		dev->reg_base[i] = devm_platform_ioremap_resource(pdev, i);
>  		if (IS_ERR((__force void *)dev->reg_base[i])) {
>  			ret = PTR_ERR((__force void *)dev->reg_base[i]);
>  			goto err_res;
> diff --git a/drivers/media/platform/rcar-vin/rcar-core.c b/drivers/media/platform/rcar-vin/rcar-core.c
> index 6993484ff0f3..334c62805959 100644
> --- a/drivers/media/platform/rcar-vin/rcar-core.c
> +++ b/drivers/media/platform/rcar-vin/rcar-core.c
> @@ -1282,7 +1282,6 @@ static int rcar_vin_probe(struct platform_device *pdev)
>  {
>  	const struct soc_device_attribute *attr;
>  	struct rvin_dev *vin;
> -	struct resource *mem;
>  	int irq, ret;
> 
>  	vin = devm_kzalloc(&pdev->dev, sizeof(*vin), GFP_KERNEL);
> @@ -1301,11 +1300,7 @@ static int rcar_vin_probe(struct platform_device *pdev)
>  	if (attr)
>  		vin->info = attr->data;
> 
> -	mem = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -	if (mem == NULL)
> -		return -EINVAL;
> -
> -	vin->base = devm_ioremap_resource(vin->dev, mem);
> +	vin->base = devm_platform_ioremap_resource(pdev, 0);
>  	if (IS_ERR(vin->base))
>  		return PTR_ERR(vin->base);
> 
> --
> 2.23.0
> 

-- 
Regards,
Niklas S�derlund
