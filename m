Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0C5B0494922
	for <lists+kernel-janitors@lfdr.de>; Thu, 20 Jan 2022 09:08:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1358585AbiATIH5 (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Thu, 20 Jan 2022 03:07:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56886 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1359053AbiATIHt (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 20 Jan 2022 03:07:49 -0500
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A00DC061574
        for <kernel-janitors@vger.kernel.org>; Thu, 20 Jan 2022 00:07:49 -0800 (PST)
Received: by mail-ed1-x529.google.com with SMTP id m4so25010788edb.10
        for <kernel-janitors@vger.kernel.org>; Thu, 20 Jan 2022 00:07:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=H3t4OkghQku7xXgz/6WvF20S2dhu/vR+d7hHEot+6vI=;
        b=vKVmPzVNO8td9qCW8wCuWR6k8dS7VsMQzjigruhMZ/BzQA8E6weL9QKeOvsQrFk7p8
         2oHic7tKs6R+gacCfpFZ3OUkozMM4RB+3DS5uQGiu1EtCoy+JISGLsS/5e9Rad80PEb0
         KRGpcT3M2W1/79pn1lDcYIy7KzmkSlJaFXeGRIkJ13kZlVxGmAxZtJEiHjhqKe83Uwfx
         zgjFptB2efMxHB+ac2KOnYPy6SrNFHZoJtyrvKJGDr4pcSYQJFs6PLpq5rQQk7lSmVHt
         Q4w6sT+CF8XGOSjS9zTSQIsib0V9nO12C0d1MUAjrCC/9Cvq0VI83GHQYfpkY90xpQOG
         CPlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=H3t4OkghQku7xXgz/6WvF20S2dhu/vR+d7hHEot+6vI=;
        b=tjdw2QcwsOMdErl3rc4TSwWDQG+tetirvk8jbtW34vP4fo+Bw5uNbVm58mQhm8I2vB
         isnsljXYLCjy4/XzTwADiBHWeTHY7W/rgLKNVGdM0zGHgss9Jm+G3bqbnZfhmx3y2dA0
         bYdI+itISZTHO/h/WsN1wB8ByCS2jTM7yFdk4WegT0xMRjNg4VRIn0Q7NWi03GU9a24t
         mtf4tI0k3opC+aPvGGhAQ++uq0Vz851FBGYXg9Os09zN60KXmrkr6+KYeuCPmeTYwuaP
         bJGABHjRjX7gQeLLU4eYClxvuxj0K+KhvmP5KM4F3zKkYkPWzTkZXlNX8jBtSqVNQ7U8
         UTHQ==
X-Gm-Message-State: AOAM532pY3yfW3PJtnHC39VPKTuIzrt5Mqc6sn26O2S/oUKF3LNcFvkF
        iHm8SrLhMj/JR67f1/fM3IoR13cxRuqy/ebY/U+FZg==
X-Google-Smtp-Source: ABdhPJwewNpbpOvpC3oO6orjjXwKPfp0RxRIRr4U6buR8fwHsj4fILEa954gwsH5DgtxR5MbrXd8lmuj3i1xsIL5yL8=
X-Received: by 2002:a17:906:7948:: with SMTP id l8mr9838070ejo.636.1642666067732;
 Thu, 20 Jan 2022 00:07:47 -0800 (PST)
MIME-Version: 1.0
References: <20220120052018.GA9384@kili>
In-Reply-To: <20220120052018.GA9384@kili>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Thu, 20 Jan 2022 09:07:37 +0100
Message-ID: <CAMRc=Mf1ECTS1b6XSdKvKbRtbNGu6mNh5mjrSohUKPhJuJYwEw@mail.gmail.com>
Subject: Re: [PATCH] gpio: idt3243x: Fix signedness bug in probe
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Miaoqian Lin <linmq006@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Thu, Jan 20, 2022 at 6:20 AM Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> The "parent_irq" variable needs to be signed for the error handling to
> work.
>
> Fixes: 30fee1d7462a ("gpio: idt3243x: Fix IRQ check in idt_gpio_probe")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  drivers/gpio/gpio-idt3243x.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpio/gpio-idt3243x.c b/drivers/gpio/gpio-idt3243x.c
> index 08493b05be2d..52b8b72ded77 100644
> --- a/drivers/gpio/gpio-idt3243x.c
> +++ b/drivers/gpio/gpio-idt3243x.c
> @@ -132,7 +132,7 @@ static int idt_gpio_probe(struct platform_device *pdev)
>         struct device *dev = &pdev->dev;
>         struct gpio_irq_chip *girq;
>         struct idt_gpio_ctrl *ctrl;
> -       unsigned int parent_irq;
> +       int parent_irq;
>         int ngpios;
>         int ret;
>
> --
> 2.20.1
>

Hi Dan!

Fixes for this and the same issue in mpc8xxx have already been fixed by Yang Li.

Bart
