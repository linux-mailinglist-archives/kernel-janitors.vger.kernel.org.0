Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 89F08173DE9
	for <lists+kernel-janitors@lfdr.de>; Fri, 28 Feb 2020 18:05:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726561AbgB1RFl (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Fri, 28 Feb 2020 12:05:41 -0500
Received: from mail-lj1-f196.google.com ([209.85.208.196]:39572 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725827AbgB1RFk (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 28 Feb 2020 12:05:40 -0500
Received: by mail-lj1-f196.google.com with SMTP id o15so4104666ljg.6
        for <kernel-janitors@vger.kernel.org>; Fri, 28 Feb 2020 09:05:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=UBP7QsMdsRzii497sQdvXMivqxHUi8KnMTi6DqPb4vI=;
        b=ac7tlk8Cze2jl3gZVHvkWEQ+IDeanfETwQry/6b+4HJyNtzQI4p6CcR3GQlgXi4t6x
         Rg9mhL4QPsYU2oVXZNwbLx51ZQjNza8AK3S/wS3bOTdoOjoXhdA+ou5H5ld+BAaa/g5h
         pK39NtvbrvXOQ9faTLoFO6V73vTxG7t4cRK1LuBmRNeOvROWzeg3piJtXOyRLqpsIjP5
         CSXHYLC82a3qe81vsAFGjbPYLLtXr18QliXwVCVW8dqOtXn7sRfek8UXC3zt/1vHN8dw
         XslVappftofRLHztKIhpGGLIUU6spBf00Hcv/oyZMBykifmTfd3rkCd9izBGI5TpwJFX
         0qlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=UBP7QsMdsRzii497sQdvXMivqxHUi8KnMTi6DqPb4vI=;
        b=oQzB10wjvv6tFGjOGOIegPHaVVIu84v7UDchvHzdxxDTsSX0Tn1a/9zjZVOVdFYYXF
         DTwegwvhXoJzH2onWieOhkGIleCzIy5eC1jdxAFEy9ffHBWAzSU4oDK5YM+JughoJE+o
         4C36mFyqoDxyHTLrq5YjFN8KQDthlTxEvxuOWLFMBYPesmZauwaS/szut71QCAPlHb9V
         pwxwVq2ZCmFptafKiaXnGPlNLuTEV/v+p5kTavJET2BhUdRLEcHDiXhr8PuTu2O7gHWv
         OzzU5LCnJcnTtZzV5ooERUtql7iWxIujrwUUDRENb0UGTe6zXyCvmxRN+sz66M4AnMw0
         zvVQ==
X-Gm-Message-State: ANhLgQ2qMNpbAlnp1k+1r+boMJ3vGnjyAuATJrnykmlC+rFRFrqJbuje
        N6QP7VXDWeKiwolmWBuOSZSpr6PC9cGz9sTx0bG/Rw==
X-Google-Smtp-Source: ADFU+vtSr6VQwF7m2+8Lo3WnbSGTzU2AUlIfQZYijuxBt0BqYCrk6rzyB34udEirfvaR+UlGIovaqzwfjvJEyyD0Mtg=
X-Received: by 2002:a2e:8754:: with SMTP id q20mr3417402ljj.258.1582909537024;
 Fri, 28 Feb 2020 09:05:37 -0800 (PST)
MIME-Version: 1.0
References: <20200228063338.4099-1-lukas.bulwahn@gmail.com>
In-Reply-To: <20200228063338.4099-1-lukas.bulwahn@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 28 Feb 2020 18:05:25 +0100
Message-ID: <CACRpkdabUZYhr7S8fcOX-dOgUEfDTnhUZjqsadyghpuTDCoqpw@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: adjust to renaming physmap_of_versatile.c
To:     Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc:     Boris Brezillon <boris.brezillon@bootlin.com>,
        Sebastian Duda <sebastian.duda@fau.de>,
        Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Joe Perches <joe@perches.com>, kernel-janitors@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Fri, Feb 28, 2020 at 7:33 AM Lukas Bulwahn <lukas.bulwahn@gmail.com> wrote:

> Commit 6ca15cfa0788 ("mtd: maps: Rename physmap_of_{versatile, gemini}
> into physmap-{versatile, gemini}") renamed physmap_of_versatile.c to
> physmap-versatile.c, but did not adjust the MAINTAINERS entry.
>
> Since then, ./scripts/get_maintainer.pl --self-test complains:
>
>   warning: no file matches F: drivers/mtd/maps/physmap_of_versatile.c
>
> Rectify the ARM INTEGRATOR, VERSATILE AND REALVIEW SUPPORT entry and now
> also cover drivers/mtd/maps/physmap-versatile.h while at it.
>
> Co-developed-by: Sebastian Duda <sebastian.duda@fau.de>
> Signed-off-by: Sebastian Duda <sebastian.duda@fau.de>
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
