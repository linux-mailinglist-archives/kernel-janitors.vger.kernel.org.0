Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6F547E883B
	for <lists+kernel-janitors@lfdr.de>; Tue, 29 Oct 2019 13:32:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732248AbfJ2McB (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Tue, 29 Oct 2019 08:32:01 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:53984 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728317AbfJ2McA (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 29 Oct 2019 08:32:00 -0400
Received: by mail-wm1-f66.google.com with SMTP id n7so2383338wmc.3
        for <kernel-janitors@vger.kernel.org>; Tue, 29 Oct 2019 05:31:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=xhbeap0zYq8ygksM/mgoVa+Q+7s8AmV30mQ95BsGCuI=;
        b=aMwSkpUUD4qCjCpYYh/dcGfZlB4t4tBaRbhrhL5fDucT5n7u0Ynl3DtWQQwf4HlCTM
         rKFMOHpNkXgVmOAd4mmFVOdyGb+fsnND/8mLve+obduh6/AL1DnAU4t1XILZqJOLlUjF
         ZagYWfnBaHNPpPOPsqAGeyUk9QIBLNONLRNrARMybq/lB8q4pxNeD2tsa1kDnn5O51ag
         sD5737K5U1pwBa7gVr0PC6xsFtc6MWUcKe0KY5U+ut9aSdCmRtcKnZnIKy/JHlhq6HUD
         ayWw49ec8kSC4nWIapkQpGYPADXHMVfHaxhWrSOyCSQ15DoULCFPOiB6Z8BL6y2t5gVJ
         EFXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=xhbeap0zYq8ygksM/mgoVa+Q+7s8AmV30mQ95BsGCuI=;
        b=AYjbt0S3/rgrT1JX/agIApriM4Z3WqQo7JqIPnfl/ifhPU4MCCnA0+zFxglVkLle7m
         K2tgxs6kKqmYNxu/Jocw17TZywg0Dh8Z/DF7J7bvFZjPiY9H6Sb97gOAS2WEfeI2xVMD
         UeBfPXnRsJAw2G+i6FGKcDsJtfw/S2QGpOQdbAIa2kgq++PStYAtD62WX7ri+Bz77dcK
         /a+o26Id3obdjpK6Vwo+utytDyLdoPbhcdFyQlcwAOS2HzfnhKfHrnEqsLeRac4IlP1p
         FOe1zxE+ZY0Rzf9efdrZS82V4CX+3tFOTTghoGhkeO6hJGI9YVBlHHhrG3yKAhyFnMfg
         yiOA==
X-Gm-Message-State: APjAAAWI232Dbe25QNT30DdWnHoFAq/vvlrJ7L2BI9n5ji2KdEo+82xB
        UuEF8idBbRJNG6Z+KtaFhj7Hj1orTsO7Uw==
X-Google-Smtp-Source: APXvYqyHjKu+2Ja4N9z0bwSJPnfrhxCySVoKSvAPuhefGUh9brsbc6qd1X+u4ZTKMm2DxUjis/WSXQ==
X-Received: by 2002:a1c:560b:: with SMTP id k11mr4182419wmb.153.1572352317183;
        Tue, 29 Oct 2019 05:31:57 -0700 (PDT)
Received: from Red ([2a01:cb1d:147:7200:2e56:dcff:fed2:c6d6])
        by smtp.googlemail.com with ESMTPSA id s13sm2874256wmc.28.2019.10.29.05.31.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Oct 2019 05:31:55 -0700 (PDT)
Date:   Tue, 29 Oct 2019 13:31:52 +0100
From:   LABBE Corentin <clabbe@baylibre.com>
To:     Colin King <colin.king@canonical.com>
Cc:     Herbert Xu <herbert@gondor.apana.org.au>,
        "David S . Miller" <davem@davemloft.net>,
        Neil Armstrong <narmstrong@baylibre.com>,
        linux-crypto@vger.kernel.org, kernel-janitors@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH][next] crypto: amlogic: ensure error variable err is set
 before returning it
Message-ID: <20191029123152.GA18754@Red>
References: <20191029113230.7050-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191029113230.7050-1-colin.king@canonical.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Tue, Oct 29, 2019 at 11:32:30AM +0000, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Currently when the call to crypto_engine_alloc_init fails the error
> return path returns an uninitialized value in the variable err. Fix
> this by setting err to -ENOMEM.
> 
> Addresses-Coverity: ("Uninitialized scalar variable")
> Fixes: 48fe583fe541 ("crypto: amlogic - Add crypto accelerator for amlogic GXL")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/crypto/amlogic/amlogic-gxl-core.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/crypto/amlogic/amlogic-gxl-core.c b/drivers/crypto/amlogic/amlogic-gxl-core.c
> index db5b421e88d8..fa05fce1c0de 100644
> --- a/drivers/crypto/amlogic/amlogic-gxl-core.c
> +++ b/drivers/crypto/amlogic/amlogic-gxl-core.c
> @@ -162,6 +162,7 @@ static int meson_allocate_chanlist(struct meson_dev *mc)
>  		if (!mc->chanlist[i].engine) {
>  			dev_err(mc->dev, "Cannot allocate engine\n");
>  			i--;
> +			err = -ENOMEM;
>  			goto error_engine;
>  		}
>  		err = crypto_engine_start(mc->chanlist[i].engine);
> -- 
> 2.20.1
> 

Acked-by: Corentin Labbe <clabbe@baylibre.com>

Thanks
