Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 03B16C9B9B
	for <lists+kernel-janitors@lfdr.de>; Thu,  3 Oct 2019 12:05:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728486AbfJCKCi (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Thu, 3 Oct 2019 06:02:38 -0400
Received: from mail-vs1-f66.google.com ([209.85.217.66]:36405 "EHLO
        mail-vs1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726772AbfJCKCh (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 3 Oct 2019 06:02:37 -0400
Received: by mail-vs1-f66.google.com with SMTP id v19so1294968vsv.3
        for <kernel-janitors@vger.kernel.org>; Thu, 03 Oct 2019 03:02:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=U9Fa4yuZV+yNNVmG4y4IONb8CE9OdpsQv913KmzPPVk=;
        b=wamW/PGz7QxYKC7aex34HmgrUbYwUNZfadON3You+egcMNTVG/fiz0r7aPlf+38BKn
         Z40KY8z6Eu3hRdvxxqTGKTbirVr4SeB3dXFMYFxq/s801AD3IZVP3buAQ3EUDGgu6cXE
         jwrG1fnr6rKXOZFP6v2Ri35YC8DPzGc1XhfjckKVWATxeUPJ+Gb1c0Z9vvE7Izyw3wue
         5mhjcMOawOnHvZZXpm7Dqw7oX2D87MXm0zpkYOjxjC6ACuVPX03tH1P+fYDF5LvoI+Te
         0LTiRpJQ8ch5C3f70Mb3Obh5b9XrxQpk609wjCXElliJnKUfEDcv73/Zkxg5dGWVlYqY
         UTnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=U9Fa4yuZV+yNNVmG4y4IONb8CE9OdpsQv913KmzPPVk=;
        b=kxkzrjv3PuELr0xqQkkIOA9fY50vIJgj4BFyh4EzRs8Ts+zmVhDnRCO5ovqZMUxgJ6
         +ZM1WDHgZubJ3P+doFUsM4nBCaqtyMgCvudvC3MB3gXtlZ34agwzHMcwYoWhg3YM8+Qr
         Ukf573Tm/WI0mhoPztCZJKjn99EyOszpY0dUiuDIjErJ4knEsTdSy/aQMuNoIcrUoZZq
         RyOwy+UG3xsHMTPbgpQtQ88iZRg6qQkN6oRWLurDUCHBU1UuE19FOawlgZIBP9E8E8YU
         HsT+TCOtTq90Yf4HDbTp00F7uVZKaFyMAOlZQIW3d8mpbdmO0GBFJ1sp5LAis/pCDI3t
         QKMQ==
X-Gm-Message-State: APjAAAVxUV07TmktQrg1yMgeQSWCoYNmppREUvKPWZsaKYkPvKuwn7CU
        2PB2uNpkesrPmGirFGZAxa6eKqVApWZxqrHEPeY6+g==
X-Google-Smtp-Source: APXvYqy07bQ30ZUxjsJZ7LLIEWlQogU+k8LuBf1/tloHW/fGz2UWLfvIktmGW9rTnJ7PADa6qd1ashL7c+YzgHy+//Y=
X-Received: by 2002:a67:fc5a:: with SMTP id p26mr4509364vsq.200.1570096955793;
 Thu, 03 Oct 2019 03:02:35 -0700 (PDT)
MIME-Version: 1.0
References: <20190922114700.10563-1-colin.king@canonical.com>
In-Reply-To: <20190922114700.10563-1-colin.king@canonical.com>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Thu, 3 Oct 2019 12:01:57 +0200
Message-ID: <CAPDyKFqnzLNQXwAn2j821LM8EkW4yagDd8Tp4BaFFy-rFMhs8Q@mail.gmail.com>
Subject: Re: [PATCH] memstick: jmb38x_ms: clean up indentation issue
To:     Colin King <colin.king@canonical.com>
Cc:     Maxim Levitsky <maximlevitsky@gmail.com>,
        Alex Dubov <oakad@yahoo.com>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        kernel-janitors@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Sun, 22 Sep 2019 at 13:47, Colin King <colin.king@canonical.com> wrote:
>
> From: Colin Ian King <colin.king@canonical.com>
>
> There is a hunk of code that is indented one level too deep, fix
> this by removing the extraneous tabs.
>
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  drivers/memstick/host/jmb38x_ms.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/memstick/host/jmb38x_ms.c b/drivers/memstick/host/jmb38x_ms.c
> index 32747425297d..3394164a7968 100644
> --- a/drivers/memstick/host/jmb38x_ms.c
> +++ b/drivers/memstick/host/jmb38x_ms.c
> @@ -433,13 +433,13 @@ static int jmb38x_ms_issue_cmd(struct memstick_host *msh)
>                 writel(((1 << 16) & BLOCK_COUNT_MASK)
>                        | (data_len & BLOCK_SIZE_MASK),
>                        host->addr + BLOCK);
> -                       t_val = readl(host->addr + INT_STATUS_ENABLE);
> -                       t_val |= host->req->data_dir == READ
> -                                ? INT_STATUS_FIFO_RRDY
> -                                : INT_STATUS_FIFO_WRDY;
> +               t_val = readl(host->addr + INT_STATUS_ENABLE);
> +               t_val |= host->req->data_dir == READ
> +                        ? INT_STATUS_FIFO_RRDY
> +                        : INT_STATUS_FIFO_WRDY;
>
> -                       writel(t_val, host->addr + INT_STATUS_ENABLE);
> -                       writel(t_val, host->addr + INT_SIGNAL_ENABLE);
> +               writel(t_val, host->addr + INT_STATUS_ENABLE);
> +               writel(t_val, host->addr + INT_SIGNAL_ENABLE);
>         } else {
>                 cmd &= ~(TPC_DATA_SEL | 0xf);
>                 host->cmd_flags |= REG_DATA;
> --
> 2.20.1
>
