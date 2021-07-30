Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 44CC83DB764
	for <lists+kernel-janitors@lfdr.de>; Fri, 30 Jul 2021 12:50:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238460AbhG3Ku5 (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Fri, 30 Jul 2021 06:50:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41770 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238383AbhG3Ku5 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 30 Jul 2021 06:50:57 -0400
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C454EC061765
        for <kernel-janitors@vger.kernel.org>; Fri, 30 Jul 2021 03:50:50 -0700 (PDT)
Received: by mail-wm1-x32f.google.com with SMTP id n21so5685715wmq.5
        for <kernel-janitors@vger.kernel.org>; Fri, 30 Jul 2021 03:50:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=9m/EKCN/FomdF8fORY1RUYBXPIVRzqaRTRpfCcIDSAQ=;
        b=djNGTQcKjfbqXno2TU4kzE8+bWPIkBcMS9BIhXTf9TNoDidYc9kqclfq8RmLqIk/lx
         2yfO3g/PgyOgDTNqcoH/4Kok8qtZbJ4zIiXXdk1VSZX8H1FNgWTdPa/UNwCmtkn4I7fX
         ksmlLD9CSZ387SMVfUWH9vit4yd1tAQGOMIbvLlXNcsxka/03bLKyKfni2CBiBmJOLX4
         V8PN6qDLQiP4QbQmCmqzpL2Jhc6a0IkTBj+gr6y54H84l2NNVEE74M6gpWORda3Emm7o
         WrtZFfwzLRNAFh7bN3ImcJwXB6qjkcKD0BHJQjg4L2VaCSavItXUvnXeJkL7vbeIQoBN
         hyFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=9m/EKCN/FomdF8fORY1RUYBXPIVRzqaRTRpfCcIDSAQ=;
        b=Q+VqFgKvwYN43zw2Fw1K1JbruCAXYyKqCy5hwnUFVyL3EdDhn64YZjsd6hqN7y3Cna
         XkhSkV8B3eM7vPZWGDH0Rm1tzdyU8fegDtQwHbPpEObF09WLVeIYI7RleNOLOpG2oLKB
         xF5bCtPg5dfiSjDIwrZJNqSDcS/D3EmesU7w1XVYgbZQjeMIxe9Ugle7rS9nHbvcPjsi
         aYkgVPnNlq/zjw01yTDpWYlChNZZCb5PnRfg6c3viJ9WTtFeXXtocbtxH3FJa8XL06Dw
         SER1xVKFAa9HUdkToBvCVguaGhgGA1UIFgF8VI8X25mFSF0lbB7gqDIoFTpv9LCVsGRn
         h1wQ==
X-Gm-Message-State: AOAM530DwMEDBgbpZuHnXtf/ZcQusZzQglYRGwQGQYb1qi7hHVBU03eh
        gErTdwF4m85F1ZXFiOiG76ReQeSJjem7uaow
X-Google-Smtp-Source: ABdhPJyX2LPYtmDUIpLqk9QfpHzwX2Hi9pA9KWy971nLG+S5hAFH4mLa1h+i1LAHXYSq0S9IbQRwfw==
X-Received: by 2002:a1c:a98a:: with SMTP id s132mr2128944wme.131.1627642248857;
        Fri, 30 Jul 2021 03:50:48 -0700 (PDT)
Received: from ?IPv6:2001:861:44c0:66c0:2c71:4cb8:38f7:a2a0? ([2001:861:44c0:66c0:2c71:4cb8:38f7:a2a0])
        by smtp.gmail.com with ESMTPSA id w13sm1265284wrq.91.2021.07.30.03.50.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Jul 2021 03:50:48 -0700 (PDT)
Subject: Re: [PATCH] media: meson-ge2d: Fix rotation parameter changes
 detection in 'ge2d_s_ctrl()'
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        mchehab@kernel.org, khilman@baylibre.com, jbrunet@baylibre.com,
        martin.blumenstingl@googlemail.com, hverkuil-cisco@xs4all.nl
Cc:     linux-media@vger.kernel.org, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org
References: <6cb8efcadcf8c856efb32b7692fc9bf3241e3bc3.1627588010.git.christophe.jaillet@wanadoo.fr>
From:   Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
Message-ID: <0fdd2990-7a4f-07cb-384e-e5c5a11452a8@baylibre.com>
Date:   Fri, 30 Jul 2021 12:50:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <6cb8efcadcf8c856efb32b7692fc9bf3241e3bc3.1627588010.git.christophe.jaillet@wanadoo.fr>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hi,

On 29/07/2021 21:49, Christophe JAILLET wrote:
> There is likely a typo here. To be consistent, we should compare
> 'fmt.height' with 'ctx->out.pix_fmt.height', not 'ctx->out.pix_fmt.width'.

You're right, it's typo.

> 
> Fixes: 59a635327ca7 ("media: meson: Add M2M driver for the Amlogic GE2D Accelerator Unit")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
> I've not looked deeply in the code, but why is this test needed in the
> first place?
> Couldn't we assigned 'ctx->out.pix_fmt = fmt' un-conditionally?

We could indeed, and with the typo you discovered it's already the case so the test could go away.

> ---
>  drivers/media/platform/meson/ge2d/ge2d.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/meson/ge2d/ge2d.c b/drivers/media/platform/meson/ge2d/ge2d.c
> index a1393fefa8ae..be22bb60e7cf 100644
> --- a/drivers/media/platform/meson/ge2d/ge2d.c
> +++ b/drivers/media/platform/meson/ge2d/ge2d.c
> @@ -780,7 +780,7 @@ static int ge2d_s_ctrl(struct v4l2_ctrl *ctrl)
>  		 * parameters, take them in account
>  		 */
>  		if (fmt.width != ctx->out.pix_fmt.width ||
> -		    fmt.height != ctx->out.pix_fmt.width ||
> +		    fmt.height != ctx->out.pix_fmt.height ||
>  		    fmt.bytesperline > ctx->out.pix_fmt.bytesperline ||
>  		    fmt.sizeimage > ctx->out.pix_fmt.sizeimage)
>  			ctx->out.pix_fmt = fmt;
> 

Acked-by: Neil Armstrong <narmstrong@baylibre.com>

(please keep it if you re-spin by removing the test entirely)

Neil
