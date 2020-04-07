Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E4D0C1A1884
	for <lists+kernel-janitors@lfdr.de>; Wed,  8 Apr 2020 01:18:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726406AbgDGXSv (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Tue, 7 Apr 2020 19:18:51 -0400
Received: from mail-qk1-f194.google.com ([209.85.222.194]:41380 "EHLO
        mail-qk1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726380AbgDGXSv (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 7 Apr 2020 19:18:51 -0400
Received: by mail-qk1-f194.google.com with SMTP id y3so1296150qky.8
        for <kernel-janitors@vger.kernel.org>; Tue, 07 Apr 2020 16:18:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=arc0QwF9QkSbUYwece2kAdI0S4w2e8/g1Kg2BaIFivk=;
        b=joSVl4H3I2jYhGA+Vn8ARJtV17flaV4g5L4ydFwkGzaU4GKGFvvbA33H13/xHIoGGi
         IS8HLQ7QwG13HsWXu+MWcZp2sNzgpNZVje6mMr6PoJuvQ81zI3kZYI0lR3vleehqmKFO
         E+GcOu66YWlvOT5n/VkC5Fikld0uWFi9Wl74c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=arc0QwF9QkSbUYwece2kAdI0S4w2e8/g1Kg2BaIFivk=;
        b=kU9v2jnMAIM1840oxVEepJZSiHiac3rbzTy/Xl7rSpIBW0U4bxSeUTJ1wndg2rEhhG
         3vqtmAYyDd4BmA7J14oZhHf7YOfBTdLsm/XVqoD0xSqb7ykJBrbfh3bknvBlMKzjXfK4
         OsMOsVpVTPoXd3DydiYWYa+eEC7QtGdy7MBveEj6gNyl8Wy8UHxPdxNHL5XVivBaBFsU
         4MGudSxrbvLqjUv9VGiqZsCLzqvKemAXO2hD3VploZlSx1XPJlJ8hG7GYSYKtmKjev+V
         DKHN+W5BCbx/BWC0z9zGOgQnLrusN4KtjPH/up5Dmjym2AIQZyXgz/5Ery7fTTu7g2iC
         xSfA==
X-Gm-Message-State: AGi0PubiPwQK6gq8o05quzB7aS/eMuSyb85qWGMkVwJHqBNgzCOeh7Q2
        sHX3ShkzAd6+wp83Q1akOArvkxB9ExR3Cic0MeM=
X-Google-Smtp-Source: APiQypIlWOqiY3c2g2lCk10VKv2zHPQ+qXXZ0U8vk+OcVtVD3SHJ2bsOmTS2udT1T9Bm2A0alpCXLE1dDZOpotPlZn0=
X-Received: by 2002:a37:b285:: with SMTP id b127mr4735607qkf.292.1586301530231;
 Tue, 07 Apr 2020 16:18:50 -0700 (PDT)
MIME-Version: 1.0
References: <20200407122149.GA100026@mwanda>
In-Reply-To: <20200407122149.GA100026@mwanda>
From:   Joel Stanley <joel@jms.id.au>
Date:   Tue, 7 Apr 2020 23:18:38 +0000
Message-ID: <CACPK8XfA-4WvgVeEKi-hdC-LgEcicEhpV_0ivwymaEJKy15hGA@mail.gmail.com>
Subject: Re: [PATCH] ipmi: kcs: Fix aspeed_kcs_probe_of_v1()
To:     Dan Carpenter <dan.carpenter@oracle.com>,
        Andrew Jeffery <andrew@aj.id.au>
Cc:     Corey Minyard <minyard@acm.org>, Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Haiyue Wang <haiyue.wang@linux.intel.com>,
        openipmi-developer@lists.sourceforge.net,
        linux-aspeed <linux-aspeed@lists.ozlabs.org>,
        kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Tue, 7 Apr 2020 at 12:22, Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> This needs to return the newly allocated struct but instead it returns
> zero which leads to an immediate Oops in the caller.
>
> Fixes: 09f5f680707e ("ipmi: kcs: aspeed: Implement v2 bindings")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Thanks for the fix Dan.

Andrew, I think this means no one has used the v1 bindings in
mainline, so could remove that code?

> ---
>  drivers/char/ipmi/kcs_bmc_aspeed.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/char/ipmi/kcs_bmc_aspeed.c b/drivers/char/ipmi/kcs_bmc_aspeed.c
> index 9422d55a0476..a140203c079b 100644
> --- a/drivers/char/ipmi/kcs_bmc_aspeed.c
> +++ b/drivers/char/ipmi/kcs_bmc_aspeed.c
> @@ -271,7 +271,7 @@ static struct kcs_bmc *aspeed_kcs_probe_of_v1(struct platform_device *pdev)
>         kcs->ioreg = ast_kcs_bmc_ioregs[channel - 1];
>         aspeed_kcs_set_address(kcs, slave);
>
> -       return 0;
> +       return kcs;
>  }
>
>  static int aspeed_kcs_calculate_channel(const struct kcs_ioreg *regs)
> --
> 2.25.1
>
