Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8DC3924D5BE
	for <lists+kernel-janitors@lfdr.de>; Fri, 21 Aug 2020 15:04:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728577AbgHUNEw (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Fri, 21 Aug 2020 09:04:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59292 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728723AbgHUNER (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 21 Aug 2020 09:04:17 -0400
Received: from mail-vs1-xe42.google.com (mail-vs1-xe42.google.com [IPv6:2607:f8b0:4864:20::e42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23E1EC061388
        for <kernel-janitors@vger.kernel.org>; Fri, 21 Aug 2020 06:04:17 -0700 (PDT)
Received: by mail-vs1-xe42.google.com with SMTP id j188so779921vsd.2
        for <kernel-janitors@vger.kernel.org>; Fri, 21 Aug 2020 06:04:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+gRZoMDKAOIDXbYKHsorub5SMcX/+MV1ACNs/3zjm+c=;
        b=dcbZN0MzYhATULNNwg/C5exRnna2Iqk4IyRb2YnEbb0zk2fEvE6NdekAVNLWfH//nP
         1dbTRt37RweqFyHOZ+KIInaHjHtjwoHIr1HUBqZV5LseTcc0ZaDR2zcEr4Zy0KSC56pC
         y/CXZyxa1u9OAQYp7Q9Zoi1LowhxkC13ex3BpeL/gDiaIrd3LyvYX4FxHXbWae0abAyN
         8nVGusIreCxDrab19+fPve5eOJRcbemGlmdUirZCkITAHGUYXc/1SvQt2KXgZF2cd0jT
         Vzh4LcOE0hhhXjsoJzChim0Z3nTufMbtKNcfYmhKXuNZVhdqiRoJ/535F/lu1dLSZCMn
         n4Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+gRZoMDKAOIDXbYKHsorub5SMcX/+MV1ACNs/3zjm+c=;
        b=rDSONqmosSQcs7CFsfPWelUQ5Q4dtCLlV81D2/Muwf0HGbkqtWVTmnCIhrRioWvY0u
         KJjYR5S/4XnB3Rg8ZI2Md19uLxkZkmT/FPKkw7JpiJX+moaExXJ+YWOybrD/wd41MJQU
         vtj5WnwIkMnzwXt0vnIUJzI2QVglwUm2g1POqoGw4egtVx0iBCSE/yyJ+WQ4haK7KHyQ
         WpsJTuKChh4ua/FitUM78X0IF4Um0kPw0PT4K286b1Fco4dd3ijTj/ESO5IsgPqBC7yT
         pBmK8V/qe+uvZpnm9p5LgYvGQtbtzPVa7oNmrymIukKZHTy4DcqIlBmThiViJ7Yk7URE
         Im8A==
X-Gm-Message-State: AOAM5319Cdet8SE7mIdRqL+p5cC3Bi0xo3QBOmBYpLnivbWiQd4s98X4
        E+/V+hOL8K78RV/2PJv2tVhNMGLP83fkMXGZrMW2WA==
X-Google-Smtp-Source: ABdhPJzoHZ6JdYATaZEbKdDSDIioiFDf0mMLFvpIKkkoAR6R1WkrPrj4MoENxOzeVBe8Uka9jGmUbILQXwUPR05Eark=
X-Received: by 2002:a67:6305:: with SMTP id x5mr1596992vsb.35.1598015056157;
 Fri, 21 Aug 2020 06:04:16 -0700 (PDT)
MIME-Version: 1.0
References: <20200810080247.47024-1-colin.king@canonical.com>
In-Reply-To: <20200810080247.47024-1-colin.king@canonical.com>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Fri, 21 Aug 2020 15:03:39 +0200
Message-ID: <CAPDyKFrS0798_ftgBti+hJY3F2UpSFmDkTQcPzRNXtFAALfDVA@mail.gmail.com>
Subject: Re: [PATCH] ms_block: fix spelling mistake "doesn'" -> "doesn't"
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

On Mon, 10 Aug 2020 at 10:02, Colin King <colin.king@canonical.com> wrote:
>
> From: Colin Ian King <colin.king@canonical.com>
>
> There is a spelling mistake in a debug message. Fix it.
>
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  drivers/memstick/core/ms_block.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/memstick/core/ms_block.c b/drivers/memstick/core/ms_block.c
> index d9ee8e3dc72d..ad1c6f2db089 100644
> --- a/drivers/memstick/core/ms_block.c
> +++ b/drivers/memstick/core/ms_block.c
> @@ -1223,7 +1223,7 @@ static int msb_read_boot_blocks(struct msb_data *msb)
>                 }
>
>                 if (be16_to_cpu(page->header.block_id) != MS_BLOCK_BOOT_ID) {
> -                       dbg("the pba at %d doesn' contain boot block ID", pba);
> +                       dbg("the pba at %d doesn't contain boot block ID", pba);
>                         continue;
>                 }
>
> --
> 2.27.0
>
