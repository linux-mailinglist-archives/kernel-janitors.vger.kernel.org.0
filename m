Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2D729802CF
	for <lists+kernel-janitors@lfdr.de>; Sat,  3 Aug 2019 00:33:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392427AbfHBWdS (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Fri, 2 Aug 2019 18:33:18 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:43821 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726626AbfHBWdS (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 2 Aug 2019 18:33:18 -0400
Received: by mail-lf1-f65.google.com with SMTP id c19so53968429lfm.10
        for <kernel-janitors@vger.kernel.org>; Fri, 02 Aug 2019 15:33:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=M5Sp+aw1xGfAJw6QQ7rI2FkSiegHLKhpr8F21Ebetbk=;
        b=agYUxtlAJg6Nuq0Z4pOkV/qkhu5fGOG7yxfzXCPzIr9tvqg2tmo0JrpRc43X4E6hWk
         kWJXFk93I3bPSGiBuplmcRbTusctRRiqlRp3kPXo8IJvKYlEovKuL8w4iNdnO/52K1Kx
         IfATW5sW4KgaKC6xVtutGBErt6QG5wMLLFzB6qC0z39b3jaS7rX51eCQLZ1GwUsIKIkg
         UGThbfIZXsZ4zg9DBLAxJDvk1i8bfkbx4Bwe8wt+BJ713vYmhcz2K2jUZ0BdC6pljKH8
         mhUFBZgAZhnnyug7Tf1cc7RYN3BwK1yOoobbKIifu8cIu5cKtS5LSt9U9LMp1lwk7FGK
         eJJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=M5Sp+aw1xGfAJw6QQ7rI2FkSiegHLKhpr8F21Ebetbk=;
        b=cOhupM5brS/FpEqzETcRgBVCm11m0SwMZnSyip0dUuwrjReGBlzQZIwSklxkI3sCMN
         mqpIGiy/TU0AQQ7z3eQ24tRj7zgn1sbnTfQastYFxouSm40Np/pGKkXStdrOxJUpfSeM
         GuUIb0roWdy8Xx/uXFIQU9fM/x3xjhNfzgfLv95qTcvRfeqA6NzNExMIbsukwHJes7s4
         /S02TK1S1YRM6KJ5bIuLoEAX8JWShyb2ikvgqpSCs7AZovEMlrZGeR57YHv07KeZ498p
         M26fL0Ot2Tq0qTMAIYyk7LPOdWPDkssS1bM3B3ecX99jidIlFxlk+Cqe9u5Ph3+A1ycR
         1tTA==
X-Gm-Message-State: APjAAAUqSxamhEhz2E5LW7hYxAs4ZXQvwRqhLAkNtAHQJuuEYOkblKxf
        JtGxLwTP8veU4qtPmmV0FCZM6/+0pYaDMOSqzCECYA==
X-Google-Smtp-Source: APXvYqxzoYu1mREI8w9eHSP7z3qdwPPm93bIZ2yKBLR4oSDfl4Qngc4P+Cg25YKu8pbFy/+hAq+JJriRM0/TyVE7vJg=
X-Received: by 2002:a19:e006:: with SMTP id x6mr64184291lfg.165.1564785196301;
 Fri, 02 Aug 2019 15:33:16 -0700 (PDT)
MIME-Version: 1.0
References: <20190719032414.85369-1-yuehaibing@huawei.com>
In-Reply-To: <20190719032414.85369-1-yuehaibing@huawei.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sat, 3 Aug 2019 00:33:05 +0200
Message-ID: <CACRpkdbLFj=Oce_L42btBjvXCOJ8y-cyia57UFYH8DW=SZr94A@mail.gmail.com>
Subject: Re: [PATCH -next] pinctrl: sprd: Fix platform_no_drv_owner.cocci warnings
To:     YueHaibing <yuehaibing@huawei.com>
Cc:     Orson Zhai <orsonzhai@gmail.com>,
        Baolin Wang <baolin.wang@linaro.org>,
        Chunyan Zhang <zhang.lyra@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kate Stewart <kstewart@linuxfoundation.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Randy Dunlap <rdunlap@infradead.org>,
        Richard Fontana <rfontana@redhat.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Fri, Jul 19, 2019 at 5:18 AM YueHaibing <yuehaibing@huawei.com> wrote:

> Remove .owner field if calls are used which set it automatically
> Generated by: scripts/coccinelle/api/platform_no_drv_owner.cocci
>
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>

Patch applied.

Yours,
Linus Walleij
