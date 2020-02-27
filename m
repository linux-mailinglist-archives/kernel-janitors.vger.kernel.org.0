Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CED6617163B
	for <lists+kernel-janitors@lfdr.de>; Thu, 27 Feb 2020 12:46:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728926AbgB0Lq2 (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Thu, 27 Feb 2020 06:46:28 -0500
Received: from mail-wr1-f65.google.com ([209.85.221.65]:33890 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728918AbgB0Lq2 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 27 Feb 2020 06:46:28 -0500
Received: by mail-wr1-f65.google.com with SMTP id z15so2965891wrl.1
        for <kernel-janitors@vger.kernel.org>; Thu, 27 Feb 2020 03:46:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=cTBJSroA9RJ+8lBEwYkKnNGeXoVHBYBbqwTPMLg2F9o=;
        b=f6IaWn5/yo6zdY5X0ONlrcO/16bC0jHGTfMt38t7p56Jk/StSR2GrXddKXOery9A+q
         bsjgvdrg9L2Y5X/z9mPZ40VcKxSzvjl/BcWiURUpE3UAHihkGE+aNwqW/hQHYlzJgTgZ
         dfkiTG5kuvTJCd5dwZrlgZojGkh2FdtDn/Motiqg1mztRnu9q46TLh5KM8w8xNboLfWi
         8CDE32ktJ+g+I1TZDeJIVMR3WVojdFKmDI2+8Me3bjD1iR73YZ3bq3EhQ9l8C/B8ULlL
         F/KJj4448hTB1c4I+t6S2FwLOa1EMsR98TeyclEAn/s0Obty8TAwe9cBsru+gLOVAy96
         nLug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=cTBJSroA9RJ+8lBEwYkKnNGeXoVHBYBbqwTPMLg2F9o=;
        b=fHMaDlsWGNxqPgeY/3vNWmYWDIvBpf73IlzJfPBKNE5uudf052b786h0YL3idK1zLy
         kP8ShQbNtYSBhlYFVJkvFbznULzdeh9rgIvxCg8HsfFo6xvWPZfJsboNG4e612VSC1JL
         CF0oI+XNg9SmF4SlHCPxhIpzkQG+EbFz+HeyfoTHLJwajG/l65CuFghQloIyWSRm2hpk
         /zgk4lfg16CiEkNOG1tJcTEJP+NgLCxcZvSnkbn16yXoluQ+V4xDZAApDIytbqLGgBws
         6PgRxQP+YfdfJ13NodWrEtiP+5Bi5YjiHQwfdDC4/+a1XcJQ37fZfYom5eONLnK505VV
         Zheg==
X-Gm-Message-State: APjAAAXL+1vN7LdUZLYB+nPhFlN+rd+kOMkaomUOIdRSwNoj5evWOMsn
        PqBRmbaduu1/8NqCzdHzG54x1w==
X-Google-Smtp-Source: APXvYqz1InEhOPcHB1heYSDPHQuazWq7emWdftcDiZpOvuTUa9UVkpntp5/WkSSXkFxYObe7pXC9kQ==
X-Received: by 2002:adf:efc4:: with SMTP id i4mr4509410wrp.225.1582803986345;
        Thu, 27 Feb 2020 03:46:26 -0800 (PST)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net. [86.9.19.6])
        by smtp.gmail.com with ESMTPSA id 133sm7667950wme.32.2020.02.27.03.46.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2020 03:46:25 -0800 (PST)
Date:   Thu, 27 Feb 2020 11:46:23 +0000
From:   Daniel Thompson <daniel.thompson@linaro.org>
To:     Colin King <colin.king@canonical.com>
Cc:     Lee Jones <lee.jones@linaro.org>,
        Jingoo Han <jingoohan1@gmail.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Gyungoh Yoo <jack.yoo@skyworksinc.com>,
        Bryan Wu <cooloney@gmail.com>, dri-devel@lists.freedesktop.org,
        linux-fbdev@vger.kernel.org, kernel-janitors@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH][V2] backlight: sky81452: insure while loop does not
 allow negative array indexing
Message-ID: <20200227114623.vaevrdwiduxa2mqs@holly.lan>
References: <20200226195826.6567-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200226195826.6567-1-colin.king@canonical.com>
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Wed, Feb 26, 2020 at 07:58:26PM +0000, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> In the unlikely event that num_entry is zero, the while loop
> pre-decrements num_entry to cause negative array indexing into the
> array sources. Fix this by iterating only if num_entry >= 0.
> 
> Addresses-Coverity: ("Out-of-bounds read")
> Fixes: f705806c9f35 ("backlight: Add support Skyworks SKY81452 backlight driver")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
> 
> V2: fix typo in commit subject line

Isn't the correct spelling "ensure"?


> ---
>  drivers/video/backlight/sky81452-backlight.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/video/backlight/sky81452-backlight.c b/drivers/video/backlight/sky81452-backlight.c
> index 2355f00f5773..f456930ce78e 100644
> --- a/drivers/video/backlight/sky81452-backlight.c
> +++ b/drivers/video/backlight/sky81452-backlight.c
> @@ -200,7 +200,7 @@ static struct sky81452_bl_platform_data *sky81452_bl_parse_dt(
>  		}
>  
>  		pdata->enable = 0;
> -		while (--num_entry)
> +		while (--num_entry >= 0)
>  			pdata->enable |= (1 << sources[num_entry]);

This look still looks buggy to me (so I'd second Walter's request to
change it to a for loop). If the code genuinely does not contain a
bug then it probably needs a prominent comment explaining why it is
correct not to honour sources[0]!


Daniel.
