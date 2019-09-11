Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 71E69AFEA5
	for <lists+kernel-janitors@lfdr.de>; Wed, 11 Sep 2019 16:21:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728236AbfIKOVs (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Wed, 11 Sep 2019 10:21:48 -0400
Received: from mail-vs1-f66.google.com ([209.85.217.66]:37382 "EHLO
        mail-vs1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728032AbfIKOVs (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 11 Sep 2019 10:21:48 -0400
Received: by mail-vs1-f66.google.com with SMTP id q9so13856418vsl.4
        for <kernel-janitors@vger.kernel.org>; Wed, 11 Sep 2019 07:21:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=SE8uv0620DszQIIqIp0PxyUJ6JTkZhRtluqSwePzHjw=;
        b=jbGWlG/fZofyHg1AjrnEcVtreKeWj+MwNubg9oxIHHP267Ghc0/E2+C8uMrwIl69go
         HA3HXaeo0eVPhNZw2UVhX4PHs4f5jlZsfKYEZJahGz/5VFYsXh4x17PXHguT4aS3oY5a
         6CNanWI7Z/pTfiDzXPjIQOGd9O1pXM8ijzyhMseiFhJHjuT4osQ6G2Bfv5DttnMQIPl5
         nG/ABXcryPJf3QQgxhPJbQrIDzrhgD0GuV1HqnxTArLkPKPginX4zIBOj39gEriHZnPs
         7FYMgo8Ekzg2F7rTkjR6VZ6DrJsxDtWE10i1B7+1wcU/NSt8EkkWHkCLbzAsfUUJqw9s
         FZhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=SE8uv0620DszQIIqIp0PxyUJ6JTkZhRtluqSwePzHjw=;
        b=KbRj0VT4zHafssnQYgcSE8Ln/gyhpmeljyhhC3sW96MXv/QnU9J1UvVIiAZoTFr3nW
         +5wdHpXa0ubH1Dtohvlp27QN00EfCS52vRWjQdjzVcUSbvAldHDlTcQBM3M8+gEHHV79
         jFImiayB9IlgJcLv8BaGx6ywK+v17OLKSpAs3ChcOXtdNL1UW2pInMQkrkftgTIPzWf+
         t8vsrmUDhBmvR6Y8QgpHwutx7lWUhmgrtL0Gr51WNTYJyT5DhiaSOnt4Jhu2KtCv4OAT
         jyCes+8/Tmeb4PrKL7ctultzQQM0TGyOj+c8kjW5P/mJdsM2y9S4K5vcXapw8NXDvHLe
         gcFw==
X-Gm-Message-State: APjAAAVM+mOKUBkHsqVz9COqcXNISMPI1VeTtx9YxSLYVfvrFM2k0x6s
        Ep8s5ehhpCj0j5zH5kZv6bPiYOTJc20JZaK/NM3ZCA==
X-Google-Smtp-Source: APXvYqxLO/N6RIaYCa3g/6C9VO4qOYNMICb4ruutrNimvJNFOZl7tnk35z7d5rSoqmOeAWgEFUSoUo4Y6m6XP29/sI4=
X-Received: by 2002:a67:983:: with SMTP id 125mr20385963vsj.191.1568211706866;
 Wed, 11 Sep 2019 07:21:46 -0700 (PDT)
MIME-Version: 1.0
References: <20190906091719.24886-1-colin.king@canonical.com>
In-Reply-To: <20190906091719.24886-1-colin.king@canonical.com>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Wed, 11 Sep 2019 16:21:10 +0200
Message-ID: <CAPDyKFqriNuywSzk-c77==abgJQLWRXuKWSn_04jVy+gaB8h-Q@mail.gmail.com>
Subject: Re: [PATCH] mmc: dw_mmc: hi3798cv200: make array degrees static
 const, makes object smaller
To:     Colin King <colin.king@canonical.com>
Cc:     Jaehoon Chung <jh80.chung@samsung.com>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        kernel-janitors@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Fri, 6 Sep 2019 at 11:17, Colin King <colin.king@canonical.com> wrote:
>
> From: Colin Ian King <colin.king@canonical.com>
>
> Don't populate the array degrees on the stack but instead make it
> static const. Makes the object code smaller by 46 bytes.
>
> Before:
>    text    data     bss     dec     hex filename
>    5356    1560       0    6916    1b04 dw_mmc-hi3798cv200.o
>
> After:
>    text    data     bss     dec     hex filename
>    5214    1656       0    6870    1ad6 dw_mmc-hi3798cv200.o
>
> (gcc version 9.2.1, amd64)
>
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  drivers/mmc/host/dw_mmc-hi3798cv200.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/mmc/host/dw_mmc-hi3798cv200.c b/drivers/mmc/host/dw_mmc-hi3798cv200.c
> index bc51cef47c47..83e1bad0a008 100644
> --- a/drivers/mmc/host/dw_mmc-hi3798cv200.c
> +++ b/drivers/mmc/host/dw_mmc-hi3798cv200.c
> @@ -66,7 +66,7 @@ static void dw_mci_hi3798cv200_set_ios(struct dw_mci *host, struct mmc_ios *ios)
>  static int dw_mci_hi3798cv200_execute_tuning(struct dw_mci_slot *slot,
>                                              u32 opcode)
>  {
> -       int degrees[] = { 0, 45, 90, 135, 180, 225, 270, 315 };
> +       static const int degrees[] = { 0, 45, 90, 135, 180, 225, 270, 315 };
>         struct dw_mci *host = slot->host;
>         struct hi3798cv200_priv *priv = host->priv;
>         int raise_point = -1, fall_point = -1;
> --
> 2.20.1
>
