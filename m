Return-Path: <kernel-janitors+bounces-1263-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5753F82BC89
	for <lists+kernel-janitors@lfdr.de>; Fri, 12 Jan 2024 09:56:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5B68F1C24EBF
	for <lists+kernel-janitors@lfdr.de>; Fri, 12 Jan 2024 08:56:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 266D155C36;
	Fri, 12 Jan 2024 08:55:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="dGvORQPc"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FC1353E14
	for <kernel-janitors@vger.kernel.org>; Fri, 12 Jan 2024 08:55:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-40e55c885d7so31174245e9.0
        for <kernel-janitors@vger.kernel.org>; Fri, 12 Jan 2024 00:55:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1705049745; x=1705654545; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7G5JCs2E3NA9niXnI85rqEee13vxAYA2H1uMGFDFK9g=;
        b=dGvORQPcFwl9grBnHTQtfOgw4eX+KwEl2JNQCbbYq3Mi6eXXCmnfhoa3VkVvRxhnZ+
         /y9VxHeruAKNc5KgmoP5BEvDoYW8ZbJakaVszj2QH5Uhq+x7KNhwCut4lKMeTCUNboul
         HBmGVPCZ14RpLeX4ypYZD619ueDmA5izvL2xFGk2rR8/ePGrGBP+Yrrb+QniqR6opj03
         ylUV1YIpqMgLitbzqPlGITVfXEW/xP/9RluqgRFkOXWA6ShV+DAZEhErbBQjGR41jKx6
         D8K/sDYfZHwQeiTri+NQTbRg6Gmfr+dCFEUjRL0wrkZ384PB68e7JJYvDbIGQxFTbukj
         csjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705049745; x=1705654545;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7G5JCs2E3NA9niXnI85rqEee13vxAYA2H1uMGFDFK9g=;
        b=VnUnPZ1D3K/IXz/RFWUHUfNgTEiINdeYDuiWWKK+nj1bCq80TEGQeyaHTf55af9GWF
         bEs8rGPlXHDF4Hdzk5dyG0wsU0vVlEmXHO0cJRLti8ytRjwjhuqU3Z6Vji4p6noMxnZV
         jGoGKjcAH8t0sER+0fFVDr9eto6CcKn92v4XreiD6kMxXZbpf2URxPxN97IqrPngxKBl
         yoyVtQdXh0/fajdzg+kPM29xszx6D+uQoDO3YM2f4cWkuGFab0kSuhQMb01EP5zNwHER
         v5C5HBJwPe1VE6FWK/d1o/HPZJiZoPDBvHCWuoVFwXGOLUzLsc8ewUSL14j2BCDFuwQx
         pW/w==
X-Gm-Message-State: AOJu0Ywh5KsS2BTPpz5Ah2MJ6fXv63BieMzJ64o4vCU9UkR7bcyuQT0C
	13tWZx4MaFgFgySf7ptaR23UIpfwI+d1rQ==
X-Google-Smtp-Source: AGHT+IHvvOUrg/d5hylXJKJI/lur/delR7auHmvJguPeID2oSbkrwfKylEoPEAGZSG3DmGnGFfzyEQ==
X-Received: by 2002:a05:600c:c8:b0:40e:5181:63e4 with SMTP id u8-20020a05600c00c800b0040e518163e4mr553137wmm.165.1705049745359;
        Fri, 12 Jan 2024 00:55:45 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.5])
        by smtp.gmail.com with ESMTPSA id o12-20020a5d474c000000b00336aac53e75sm3230127wrs.97.2024.01.12.00.55.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Jan 2024 00:55:44 -0800 (PST)
Message-ID: <185128ab-f229-4b40-91cd-ebdc138e11ac@tuxon.dev>
Date: Fri, 12 Jan 2024 10:55:40 +0200
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] pinctrl: renesas: rzg2l: Fix double unlock in
 rzg2l_dt_subnode_to_map()
Content-Language: en-US
To: Dan Carpenter <dan.carpenter@linaro.org>,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
 Linus Walleij <linus.walleij@linaro.org>, linux-renesas-soc@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org
References: <f8c3a3a0-7c48-4e40-8af0-ed4e9d9b049f@moroto.mountain>
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <f8c3a3a0-7c48-4e40-8af0-ed4e9d9b049f@moroto.mountain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi, Dan,

Thanks for your patch!

On 10.01.2024 20:41, Dan Carpenter wrote:
> If rzg2l_map_add_config() fails then the error handling calls
> mutex_unlock(&pctrl->mutex) but we're not holding that mutex.  Move
> the unlocks to before the gotos to avoid this situation.
> 
> Fixes: d3aaa7203a17 ("pinctrl: renesas: rzg2l: Add pin configuration support for pinmux groups")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
> (Not tested).

I've tested it on RZ/G3S SoC and all is good.

However, I think, to keep the locking scheme unchanged and simpler (FMPOV),
commit d3aaa7203a17 ("pinctrl: renesas: rzg2l: Add pin configuration
support for pinmux groups") should have been call rzg2l_map_add_config()
just before the mutex is locked. That would be the following diff:

--- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
+++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
@@ -447,6 +447,16 @@ static int rzg2l_dt_subnode_to_map(struct pinctrl_dev
*pctldev,
 		name = np->name;
 	}

+	if (num_configs) {
+		ret = rzg2l_map_add_config(&maps[idx], name,
+					   PIN_MAP_TYPE_CONFIGS_GROUP,
+					   configs, num_configs);
+		if (ret < 0)
+			goto done;
+
+		idx++;
+	}
+
 	mutex_lock(&pctrl->mutex);

 	/* Register a single pin group listing all the pins we read from DT */
@@ -474,16 +484,6 @@ static int rzg2l_dt_subnode_to_map(struct pinctrl_dev
*pctldev,
 	maps[idx].data.mux.function = name;
 	idx++;

-	if (num_configs) {
-		ret = rzg2l_map_add_config(&maps[idx], name,
-					   PIN_MAP_TYPE_CONFIGS_GROUP,
-					   configs, num_configs);
-		if (ret < 0)
-			goto remove_group;
-
-		idx++;
-	}
-
 	dev_dbg(pctrl->dev, "Parsed %pOF with %d pins\n", np, num_pinmux);
 	ret = 0;
 	goto done;

Would you mind doing it like this?

Please, let me know if you want me to handle it.

Thank you,
Claudiu Beznea

> 
>  drivers/pinctrl/renesas/pinctrl-rzg2l.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/pinctrl/renesas/pinctrl-rzg2l.c b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> index 80fb5011c7bb..8bbfb0530538 100644
> --- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> +++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> @@ -453,7 +453,8 @@ static int rzg2l_dt_subnode_to_map(struct pinctrl_dev *pctldev,
>  	gsel = pinctrl_generic_add_group(pctldev, name, pins, num_pinmux, NULL);
>  	if (gsel < 0) {
>  		ret = gsel;
> -		goto unlock;
> +		mutex_unlock(&pctrl->mutex);
> +		goto done;
>  	}
>  
>  	/*
> @@ -464,6 +465,7 @@ static int rzg2l_dt_subnode_to_map(struct pinctrl_dev *pctldev,
>  	fsel = pinmux_generic_add_function(pctldev, name, pin_fn, 1, psel_val);
>  	if (fsel < 0) {
>  		ret = fsel;
> +		mutex_unlock(&pctrl->mutex);
>  		goto remove_group;
>  	}
>  
> @@ -490,8 +492,6 @@ static int rzg2l_dt_subnode_to_map(struct pinctrl_dev *pctldev,
>  
>  remove_group:
>  	pinctrl_generic_remove_group(pctldev, gsel);
> -unlock:
> -	mutex_unlock(&pctrl->mutex);
>  done:
>  	*index = idx;
>  	kfree(configs);

