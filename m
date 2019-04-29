Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 698D7E0C5
	for <lists+kernel-janitors@lfdr.de>; Mon, 29 Apr 2019 12:45:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727967AbfD2Kpg (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Mon, 29 Apr 2019 06:45:36 -0400
Received: from mail-vs1-f68.google.com ([209.85.217.68]:36545 "EHLO
        mail-vs1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727916AbfD2Kpg (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 29 Apr 2019 06:45:36 -0400
Received: by mail-vs1-f68.google.com with SMTP id x78so3170491vsc.3
        for <kernel-janitors@vger.kernel.org>; Mon, 29 Apr 2019 03:45:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=DrWyAdy2TVzxFRDk8v9J6xtJJiMI+7T59fsv/7DwBTc=;
        b=kn3KGTG/7TDCcRl9xzVIg6H2ttncroaQ/UoHUU8sPjMlFly28J+wUc2Fxpd/JtiN07
         LxCbCXA1dJcXpdUlDfH6yJWUCHiHmSdbH7e94/jzVXWTAvwJfEeyK++7aBQBvAde4SVJ
         n6/ffjpJyVm9Zy1v2Eb0xDVbv6jmqJM3NIYzSvRaVUAMLnsCZzfESzh1aYGSkm+glTSn
         fOxkqMLq3RStmWoQ6mGAGBoysIzAVhLsxCTwitxMlLfOpo0SYEuAW/c7N/w0ZfA5AZxD
         XH+k92rvUI2A+4P66CU9t/1WWd9P3xgNPcrOUDB2m4+zDTJ8aZdG93l7H+PWmtbBwVGP
         NDeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DrWyAdy2TVzxFRDk8v9J6xtJJiMI+7T59fsv/7DwBTc=;
        b=TCSmArmCLOPkHlBGISgykAYTXtTA5v0ygi7ZGL+6py7mL/YSRdP4oMyAjdoeFNMEe7
         R2D4ooVjxfYZzB7uonSpyDKAj+lRXnQgpEruBzvF4/aUznwTPzSPZVXNQZ0K017nLuXX
         XcNymTIvXKRm3VzF9LDClrNKfk8Wa/GDWx8CHL3WIEDOke2HnX4njPpgFqA5jWE8CwRV
         ywqMjY05at8sXYaH90U+asW0pBJFEGqtf1kKGHQuea6mbzkbMroLezbQfVoJyb8Q60ma
         pwWKUxYaJkHJCGObxuLD/fRJ39m1aqycF+2f8KiiPEcnTdK4MygxlVZKng9nBNmHGVpm
         dp1Q==
X-Gm-Message-State: APjAAAWfbV3rZYdDrSi1pU4xT2p2hZ3cGodT2zkdO/XNrsmtzTZENKLi
        bQiT3b7a7KjvEGmtSiMs2nxpQ/hFMBzR9XsfLp7rHg==
X-Google-Smtp-Source: APXvYqzCF6xzEu2YJZblkuaHFW5fkXagcR0s/+o/AB0FpdTLP8UO07EB2JYup+xn7/1r7+KkpE3mB2NvuKaWr1PpqUQ=
X-Received: by 2002:a67:e83:: with SMTP id 125mr20023211vso.35.1556534735104;
 Mon, 29 Apr 2019 03:45:35 -0700 (PDT)
MIME-Version: 1.0
References: <20190425020332.45980-1-yuehaibing@huawei.com>
In-Reply-To: <20190425020332.45980-1-yuehaibing@huawei.com>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Mon, 29 Apr 2019 12:44:59 +0200
Message-ID: <CAPDyKFqEoaNKqz-7RQwaHsWP7L=7rYcwo4=tfhbafZ+NXu3e=Q@mail.gmail.com>
Subject: Re: [PATCH -next] memstick: tifm: remove set but not used variable 'data'
To:     YueHaibing <yuehaibing@huawei.com>
Cc:     Alex Dubov <oakad@yahoo.com>,
        Maxim Levitsky <maximlevitsky@gmail.com>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Thu, 25 Apr 2019 at 03:53, YueHaibing <yuehaibing@huawei.com> wrote:
>
> Fixes gcc '-Wunused-but-set-variable' warning:
>
> drivers/memstick/host/tifm_ms.c: In function 'tifm_ms_issue_cmd':
> drivers/memstick/host/tifm_ms.c:259:17: warning:
>  variable 'data' set but not used [-Wunused-but-set-variable]
>
> It's not used any more since commit 92b22d935fed ("tifm: fix the
> MemoryStick host fifo handling code")
>
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  drivers/memstick/host/tifm_ms.c | 3 ---
>  1 file changed, 3 deletions(-)
>
> diff --git a/drivers/memstick/host/tifm_ms.c b/drivers/memstick/host/tifm_ms.c
> index 1bbb2ead9556..6b13ac56eb27 100644
> --- a/drivers/memstick/host/tifm_ms.c
> +++ b/drivers/memstick/host/tifm_ms.c
> @@ -256,7 +256,6 @@ static unsigned int tifm_ms_transfer_data(struct tifm_ms *host)
>  static int tifm_ms_issue_cmd(struct tifm_ms *host)
>  {
>         struct tifm_dev *sock = host->dev;
> -       unsigned char *data;
>         unsigned int data_len, cmd, sys_param;
>
>         host->cmd_flags = 0;
> @@ -265,8 +264,6 @@ static int tifm_ms_issue_cmd(struct tifm_ms *host)
>         host->io_word = 0;
>         host->cmd_flags = 0;
>
> -       data = host->req->data;
> -
>         host->use_dma = !no_dma;
>
>         if (host->req->long_data) {
>
>
>
