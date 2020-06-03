Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 695361ECFC7
	for <lists+kernel-janitors@lfdr.de>; Wed,  3 Jun 2020 14:31:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725973AbgFCMb1 (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Wed, 3 Jun 2020 08:31:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38030 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725881AbgFCMb0 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 3 Jun 2020 08:31:26 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0DEADC08C5C0
        for <kernel-janitors@vger.kernel.org>; Wed,  3 Jun 2020 05:31:26 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id e4so2491469ljn.4
        for <kernel-janitors@vger.kernel.org>; Wed, 03 Jun 2020 05:31:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=L1NJYuTKReAQCzwmp21v6oxd6VH6o0/1AXhj3Xbp+FA=;
        b=GYLRyR3OR2you4gt5Qoe94eTqGpHQxHxJtDqtMFwAwycpFKpORilUHJ+cpxeyB10dZ
         HZZIncnj4Nc5euIkBmYg91PiCtTZXQoWLM//bJq/8ljVCqKGsEkudebxu1rD/xFge7XX
         gUcQtcfaYyLClnFKKSzUJFm9UdTCKp09CFDZ/ll0z2c+BjIUHXiTXK0/xIsaBmZFPgzW
         5PcPHAb51hM1T8b69zqjgmxhk7njDjDVmtYtpuT0xSkK8+vIbM4iI1M6M5/VlhCf0/Sn
         7xxUT6j3nTgizmvd+kLannVm19nUGA+BXHohp50BOfs5E71QhnvSDS02jxYWWK3eWHCv
         fbxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=L1NJYuTKReAQCzwmp21v6oxd6VH6o0/1AXhj3Xbp+FA=;
        b=KTW0W9IzaC1Pf0iqpa8CHJnpXSLNjSQlhw6Qj3ks37jjH8Quzd1OwsdeWbJtK9HHNT
         2smwaQZG/vQQx+X78Zp1WPTzgHagUK0i8g5Z7swOfw6YkE4iSn/vRpDahiMZ3MUXF5fX
         wNJcuGeS9uRbKxpYXC8zarwyUYC+PDdeZB4Y9HGMgLvy36xVxWgknLdb/ezbSwfRcDbM
         QRl1zeqXjpn/JrWY4dSs0ARQWW8K81iF22r5ZxCMd8L/hzvSeuU+EJs7mhPq/s4yigaL
         L33RZEpdbYDEM3sdFh8dSYBI7gLYhPkQHDDpZBaSUI1HnwCfQKoKgDrb9n76JLPtz8Vi
         rEuw==
X-Gm-Message-State: AOAM533NvpJcua1UuRUq3/UNCTKJ4s02p8oZMAKmjDRHoI8fUi5X03Vu
        NUM2e3iZyy4ItRHswRtGB2XBIbKA0ahEMGC0gEigcQ==
X-Google-Smtp-Source: ABdhPJzeYHCrqoAKbg/iXMZc2UHkSMqVGpsvQRy6zx+BK4rdk3W1fxIGP76BKw3wR0/nVnq2bumPP8UA4bGzDwuUJyc=
X-Received: by 2002:a2e:350a:: with SMTP id z10mr1920234ljz.104.1591187484286;
 Wed, 03 Jun 2020 05:31:24 -0700 (PDT)
MIME-Version: 1.0
References: <20200530201952.585798-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20200530201952.585798-1-christophe.jaillet@wanadoo.fr>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 3 Jun 2020 14:31:13 +0200
Message-ID: <CACRpkdYvoe8o8Db1mszfgcHA3XZF7LJ3P1u5pnKOfEfS99F0Ew@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: imxl: Fix an error handling path in 'imx1_pinctrl_core_probe()'
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc:     Dong Aisheng <aisheng.dong@nxp.com>,
        Fabio Estevam <festevam@gmail.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Stefan Agner <stefan@agner.ch>,
        Sascha Hauer <kernel@pengutronix.de>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        NXP Linux Team <linux-imx@nxp.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Sat, May 30, 2020 at 10:20 PM Christophe JAILLET
<christophe.jaillet@wanadoo.fr> wrote:

> When 'pinctrl_register()' has been turned into 'devm_pinctrl_register()',
> an error handling path has not been updated.
>
> Axe a now unneeded 'pinctrl_unregister()'.
>
> Fixes: e55e025d1687 ("pinctrl: imxl: Use devm_pinctrl_register() for pinctrl registration")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Patch applied.

Yours,
Linus Walleij
