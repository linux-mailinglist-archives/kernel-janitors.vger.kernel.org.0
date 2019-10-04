Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 68DA7CB9E5
	for <lists+kernel-janitors@lfdr.de>; Fri,  4 Oct 2019 14:07:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730009AbfJDMH4 (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Fri, 4 Oct 2019 08:07:56 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:39483 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726002AbfJDMH4 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 4 Oct 2019 08:07:56 -0400
Received: by mail-wr1-f67.google.com with SMTP id r3so6891652wrj.6
        for <kernel-janitors@vger.kernel.org>; Fri, 04 Oct 2019 05:07:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=BdW+9Mux8Xy3MFNcNVfipPeeVfXEPHbL3cQVSS7KHjY=;
        b=CgDYWAICIsHL1H1yTpwOivNqlAyZsHKmwy+hBjEnEqq+8rajvn6WIgUEpXj0i4HiBq
         Q9REVH061gdwNTqIa7BvzdnfKmjxR2OZw2+nqk5hjxWGpJ9pQHijyJlK83AtZKkVUqEm
         +lB8Prfjliu2SaqdPvR3LUuUrTvGcUlEeQ0m6zSC7ArwxfJc/46z6A3wseROn6VSu8Sh
         q+J7a+IZWpg73E8mzN4oqQUlTbfGl97n97NrogJ//FQpPtVsVYjm77gXHqClnpA6+7MK
         gQyl2Pt1yCL/8qa+M6uGKwo17BP5F+R8swQrVctY2jbGGx+1w14CeuHGrwyQEp4GOTeY
         /sDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=BdW+9Mux8Xy3MFNcNVfipPeeVfXEPHbL3cQVSS7KHjY=;
        b=JOxE3MTUuKsQJ2NjtJs1ns9Jx+LDOXpGxqRvcpCEdRxzdWKSV70NwwallL7VWVB0bx
         FnS2UWJuNjG7QCD/ELv/Q79Fvh5Lyx6d2A41Ro567gxCUuHUtwfrq5/R+n2ebYYn4aVj
         u7uU5A7wjI1EegfSsRAsMH1siBhiWiJpwgAHU6Y1U7jGdkE57fEMfppHsnEZzUSKQHO2
         komcsOnczaM0hKzdFuCRHmyKC60LSd9u5jLH9K96n5ah9ebanBRA43KNSOOgo4XRhVFF
         RHcuSa5L2AxqM8MeCXRkJ38vmRde7A1HOnvYq8yVaHvsYYbxXFT75A6962PiPLxfqNvQ
         OwEg==
X-Gm-Message-State: APjAAAUGF5JIfHgHwRwuw5ZVe5Xq0tO/55cmOSn0SgVe5xF2l0LqqtS3
        JOZ7FUoMRKWVdPi3U+Qwiwhx68a87FQ=
X-Google-Smtp-Source: APXvYqyioV8godBqg5bZXDirA4WwtlIfhtI9Pg1jFdtyfEaWskHwFUhjh01Z4lPL0cpf538Gp/SBrw==
X-Received: by 2002:a05:6000:162e:: with SMTP id v14mr11816375wrb.112.1570190874325;
        Fri, 04 Oct 2019 05:07:54 -0700 (PDT)
Received: from dell ([2.27.167.122])
        by smtp.gmail.com with ESMTPSA id c4sm7746423wru.31.2019.10.04.05.07.53
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 04 Oct 2019 05:07:53 -0700 (PDT)
Date:   Fri, 4 Oct 2019 13:07:52 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Markus Elfring <Markus.Elfring@web.de>
Cc:     kernel-janitors@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Himanshu Jha <himanshujha199640@gmail.com>
Subject: Re: [PATCH] mfd: ipaq-micro: Use devm_platform_ioremap_resource() in
 micro_probe()
Message-ID: <20191004120752.GD18429@dell>
References: <d9990bcc-2daa-67ad-4de5-7a849668d038@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d9990bcc-2daa-67ad-4de5-7a849668d038@web.de>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Wed, 18 Sep 2019, Markus Elfring wrote:

> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Wed, 18 Sep 2019 13:40:30 +0200
> 
> Simplify this function implementation by using a known wrapper function.
> 
> This issue was detected by using the Coccinelle software.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---
>  drivers/mfd/ipaq-micro.c | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)

Applied, thanks.

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
