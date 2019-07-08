Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0F33861ABD
	for <lists+kernel-janitors@lfdr.de>; Mon,  8 Jul 2019 08:37:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729044AbfGHGgz (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Mon, 8 Jul 2019 02:36:55 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:39391 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728807AbfGHGgy (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 8 Jul 2019 02:36:54 -0400
Received: by mail-wm1-f65.google.com with SMTP id z23so15078545wma.4
        for <kernel-janitors@vger.kernel.org>; Sun, 07 Jul 2019 23:36:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=4XQUJtwFCPubD2c81CREAUVgFw9rYm1UoaxaFdnnNdo=;
        b=kVwkmPHNEJB2whTCj7Hri7TN3H0Ok4sdeM5HMvBye0w8ir6Vt3JF8ZnYJ0jyORbsIE
         rMB0Kp4pC5ErQmTNwAoFY8UUjUcq6wuQocxvHv5VTlPRQvkeiu8SXeVry9qJnNu6iW+B
         h1hOBOkABCBZ9unLqhCzvqwOP/X/HrP+UveABdIk9TBKC+idtVWe7HAaroxPCu1q4rXT
         2urnOQkRWuUq5EBl77zqXXVrXmYIg2uCNMtVeMAGYiqgChJQpm2m8341qu9qFoFDQ74q
         6hmOW1VwzmlED5el7XISCNx8xRy4LQagIJyt/i3RoEzXWtO5mJphXxVQXtkIhS44SmlA
         7cDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=4XQUJtwFCPubD2c81CREAUVgFw9rYm1UoaxaFdnnNdo=;
        b=dGSy6SWKo6Ata74zez/nH0r60aHvopFZUWDialPuYsCO0hpd+u7kyS/gMI190ndGbC
         etkaycrCGtZBo4/u7YXMbiwRiVRAM8JGKeW/iKdr1Fqo5Po6aDzrU+aLZ2vyGFZmR/JW
         6Vr6XYmEcBL9tT8GWulO5hushr7on+3fhi8d5rod7E6IwA86R30HuLaeIf37ruJgf/UX
         uLp6qTpuUnljIqlzSPC0hokneGVappza86etUkZ/BON8OuYMfZ9u3ITQF7AjELvPXIwR
         aKKmg0tj3OKQua/Wz+vuQLpGBa+BGHqiSt0tBxmrVus8cFh7pbZm1J5Bn+BaTSyOzXxA
         n3Ug==
X-Gm-Message-State: APjAAAWn3USAE1Neh3BlHkOg4lWKwFGhHlnFD2SStzEy8OuZYymiE4vV
        cJtISrBWj8zKug5OJEGEcmMGNQ==
X-Google-Smtp-Source: APXvYqwSNgc9S2iC3V5CvgiU/2zkAD/yGZ0BqC+lBVBbcliz34DQX1ZB4h5yyXS0VjK2R2oLvwvezQ==
X-Received: by 2002:a1c:228b:: with SMTP id i133mr15042590wmi.140.1562567811920;
        Sun, 07 Jul 2019 23:36:51 -0700 (PDT)
Received: from dell ([2.27.35.164])
        by smtp.gmail.com with ESMTPSA id f12sm16775878wrg.5.2019.07.07.23.36.51
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 07 Jul 2019 23:36:51 -0700 (PDT)
Date:   Mon, 8 Jul 2019 07:36:49 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Markus Elfring <Markus.Elfring@web.de>
Cc:     kernel-janitors@vger.kernel.org,
        LKML <linux-kernel@vger.kernel.org>,
        Al Viro <viro@zeniv.linux.org.uk>
Subject: Re: [PATCH] mfd: asic3: One function call less in asic3_irq_probe()
Message-ID: <20190708063649.GA4800@dell>
References: <01f6a8cd-0205-8d34-2aa3-e4b691e7eb95@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <01f6a8cd-0205-8d34-2aa3-e4b691e7eb95@web.de>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Fri, 05 Jul 2019, Markus Elfring wrote:

> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Fri, 5 Jul 2019 20:22:26 +0200
> 
> Avoid an extra function call by using a ternary operator instead of
> a conditional statement.
> 
> This issue was detected by using the Coccinelle software.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---
>  drivers/mfd/asic3.c | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/mfd/asic3.c b/drivers/mfd/asic3.c
> index 83b18c998d6f..50f5368fb170 100644
> --- a/drivers/mfd/asic3.c
> +++ b/drivers/mfd/asic3.c
> @@ -401,11 +401,10 @@ static int __init asic3_irq_probe(struct platform_device *pdev)
>  	irq_base = asic->irq_base;
> 
>  	for (irq = irq_base; irq < irq_base + ASIC3_NR_IRQS; irq++) {
> -		if (irq < asic->irq_base + ASIC3_NUM_GPIOS)
> -			irq_set_chip(irq, &asic3_gpio_irq_chip);
> -		else
> -			irq_set_chip(irq, &asic3_irq_chip);
> -
> +		irq_set_chip(irq,
> +			     (irq < asic->irq_base + ASIC3_NUM_GPIOS)
> +			     ? &asic3_gpio_irq_chip
> +			     : &asic3_irq_chip);

The comparison better suits an if statement IMHO.

How about:

  		struct irq_chip *chip;

		if (irq < asic->irq_base + ASIC3_NUM_GPIOS)
			chip = &asic3_gpio_irq_chip;
		else
			chip = &asic3_irq_chip);

		irq_set_chip(irq, chip);

>  		irq_set_chip_data(irq, asic);
>  		irq_set_handler(irq, handle_level_irq);
>  		irq_clear_status_flags(irq, IRQ_NOREQUEST | IRQ_NOPROBE);

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
