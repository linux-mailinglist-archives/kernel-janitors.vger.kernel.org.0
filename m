Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9A91D1348CB
	for <lists+kernel-janitors@lfdr.de>; Wed,  8 Jan 2020 18:06:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729579AbgAHRGY (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Wed, 8 Jan 2020 12:06:24 -0500
Received: from mail-lf1-f67.google.com ([209.85.167.67]:35316 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729540AbgAHRGY (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 8 Jan 2020 12:06:24 -0500
Received: by mail-lf1-f67.google.com with SMTP id 15so3013880lfr.2
        for <kernel-janitors@vger.kernel.org>; Wed, 08 Jan 2020 09:06:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ZG5mwCvO/8hHzDnaJkWUXAlThWqWwO0oMCIc1jFVaF8=;
        b=TS8kRNJ63oRSoj916IeOJ0PSYySbhpJVts40N/G6X/Liosb+K6ymAHraHW/2+OH/67
         e3eJjovLYr3Ci6qG5WYWYT9rkVkqlI50jkBp3TP9GZRr2Oge/dVfEZaCDebNkdcyLppo
         haAUiiVrcK7Y56QF9jZ571DcYLvG2NInKbOja7r62OAi/VqD7dt04zVVIFr8iE533lwp
         AoTpiaJHNmxiLeGW0U08Rd0AZYoiqtEVqyQrTZHhXEIQbE3rCqdVjgisd27wysNXFasU
         alVEi0kDrmLKaKWG1rBKga3afcDzjQrT1vO8vYiBRztodkPw73R0gKFEfOlvIP5IBvqb
         STsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ZG5mwCvO/8hHzDnaJkWUXAlThWqWwO0oMCIc1jFVaF8=;
        b=isgmwoyOfvhob1qWsAemHDXy3SquzdobmFhX4TsCE3iaJnQRgxuGe6iAOt29gIQ3i8
         GKHPPWAoTc/YVjBNtpOyEYvOsFb3EetE2RPhVLFOGFIQ3I486XUWv/c54EIR5KeGwqc9
         boPJbF/JwypYFgtO/BQjAyOuYYpO/8CBftdaUTBqjcJ+lz4Cmz6tulqBdmehL9wmcIZY
         Uk+suDKNe3y/f0B4GpDNJPm/mhdPhzAjuNmyzTJqZaI+mhg2AgEk4AtVRmu8hTin7Ghb
         XbZ0f45jQtDNCA3QcbcdtYcrw4hN40R2mGNjwfH1PC7yTvs0RaZan9VcFlZKNsBcW65w
         ii7g==
X-Gm-Message-State: APjAAAU4n9O79P1GSe3iT6FanY5ixSbl0x7rRjWZBI4UUawxtfrC+OHQ
        JkT4Z9SoKS37TvvDvIBlST+T2tQCTeE0yD1rtVa52Q==
X-Google-Smtp-Source: APXvYqy4CrhXJ4b/8g3RMkCam7ca/MhZfkbfOrlpD7xBB9Cw6TsTScAGa+ViToMmlgE2pl5ieDU41zioyn0u52uwhcU=
X-Received: by 2002:ac2:5e78:: with SMTP id a24mr3376017lfr.5.1578503182554;
 Wed, 08 Jan 2020 09:06:22 -0800 (PST)
MIME-Version: 1.0
References: <20200108015322.51103-1-yuehaibing@huawei.com>
In-Reply-To: <20200108015322.51103-1-yuehaibing@huawei.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 8 Jan 2020 18:06:11 +0100
Message-ID: <CACRpkdYz0UwAj0Ncs9SKWbN8vN-5E14GHL2KkANMb6H5OqEW7A@mail.gmail.com>
Subject: Re: [PATCH -next] leds: leds-bd2802: remove set but not used variable 'pdata'
To:     YueHaibing <yuehaibing@huawei.com>
Cc:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Linux LED Subsystem <linux-leds@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Wed, Jan 8, 2020 at 2:57 AM YueHaibing <yuehaibing@huawei.com> wrote:

> Fixes gcc '-Wunused-but-set-variable' warning:
>
> drivers/leds/leds-bd2802.c: In function 'bd2802_probe':
> drivers/leds/leds-bd2802.c:663:35: warning:
>  variable 'pdata' set but not used [-Wunused-but-set-variable]
>
> commit 4c3718f9d6a6 ("leds: bd2802: Convert to use GPIO descriptors")
> left behind this unused variable.
>
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
