Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 24BF8AFE0F
	for <lists+kernel-janitors@lfdr.de>; Wed, 11 Sep 2019 15:51:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728193AbfIKNvF (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Wed, 11 Sep 2019 09:51:05 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:44197 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727307AbfIKNvF (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 11 Sep 2019 09:51:05 -0400
Received: by mail-lj1-f194.google.com with SMTP id u14so20047422ljj.11
        for <kernel-janitors@vger.kernel.org>; Wed, 11 Sep 2019 06:51:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=NoMqRKmSHDNSonXcVU6fMQXm+z8bwoc4kZBnKFdCowk=;
        b=U3w+OKyBdOmsh6TvHMeNg2QShNoGWJKQGgwwHt3oI+sJpfMGXbMmZAW4xPIAm37vUf
         eHS2BZ9FeUkb+xCURTh9+1atnbXo8i0O4a0ONkSg9pFunDi8U2UOmSKJo1csyqw42lFA
         Mtkq+qxIiq+2bjH3m880tHaH0bAkOzrbgg0bCQxQuUQHe6UfpQX4gtCSowLb48kYe9H8
         UDScj59r1OpzGwKEUTtY0PSMfA669A1lqJPtmTOGCnfVHZP26XqHbb0caZ6Vh8TRf0Xv
         FKUWnGmrKvVL/6XJ5Hq/UgLcW9DyKpOfdnw39veCqa1inGv0zjOMM6xtfSIokn3qL7oh
         WaEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=NoMqRKmSHDNSonXcVU6fMQXm+z8bwoc4kZBnKFdCowk=;
        b=CzjVYozVfmdg4EeRfj5zWL4zgbt/g3lZu4Sn9EPT6DKwGySOP1ghVOa5HmXnA+d93w
         fnR3lMDb9mVRNfzTd8GewFPfnivCmIesIDzQcnNTJ/Kr31Qrn0KKTwMENrR7SJrzzioo
         8Ydb30IMzA8kUYJzz6MCmel9gvBkQz/V5Nf4nsbo8fr7o1xcCFcwqUyCmGAkAFnL0KkK
         l9m8TBYYieGsyD1bvfZZVBd+n3gU2VUVPBGplwguEaDFisGOlKAHpPxjOyMs1x0kX0/f
         rLkKugqmGo1IkwMxKWraq1qJBvxgv6XdBlxQYisZBmX6BY0uzRQ2iFd01bvl6mOCQWV7
         tfoA==
X-Gm-Message-State: APjAAAWsJ4fDWHHvQEDfpgTubbzeaN7EExl/zCamiBm3BPcjHOZ2Fh9U
        4wuQ24XqHpRpzLXqsf2EpsyjyCXUmnvhWYiLqkJL1c/GrB0OJQ==
X-Google-Smtp-Source: APXvYqwfZnw3PjgDOxtmmaDanHc/yotTXP96wDhdzPOnMRhDpWyM2WFlorifP/kb36RfTEmUgCFHL3JnFqi8Mce9Hw8=
X-Received: by 2002:a2e:884d:: with SMTP id z13mr22437077ljj.62.1568209863184;
 Wed, 11 Sep 2019 06:51:03 -0700 (PDT)
MIME-Version: 1.0
References: <20190906131032.22148-1-yuehaibing@huawei.com>
In-Reply-To: <20190906131032.22148-1-yuehaibing@huawei.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 11 Sep 2019 14:50:51 +0100
Message-ID: <CACRpkdZgH9Q9OMUV4C6zADPj_NN+QrxQOLUDcOqJ_oYCxWP7vg@mail.gmail.com>
Subject: Re: [PATCH -next] gpio: creg-snps: use devm_platform_ioremap_resource()
 to simplify code
To:     YueHaibing <yuehaibing@huawei.com>
Cc:     Eugeniy.Paltsev@synopsys.com,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Fri, Sep 6, 2019 at 2:48 PM YueHaibing <yuehaibing@huawei.com> wrote:

> Use devm_platform_ioremap_resource() to simplify the code a bit.
> This is detected by coccinelle.
>
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>

Patch applied with Eugeniy's ACK!

Yours,
Linus Walleij
