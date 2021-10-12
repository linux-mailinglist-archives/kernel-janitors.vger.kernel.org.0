Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B49B1429FCC
	for <lists+kernel-janitors@lfdr.de>; Tue, 12 Oct 2021 10:28:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234587AbhJLIaY (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Tue, 12 Oct 2021 04:30:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32844 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234916AbhJLIaU (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 12 Oct 2021 04:30:20 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40C24C061570
        for <kernel-janitors@vger.kernel.org>; Tue, 12 Oct 2021 01:28:19 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id c16so29599258lfb.3
        for <kernel-janitors@vger.kernel.org>; Tue, 12 Oct 2021 01:28:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=o1ZztMBYmzv83GFbNWWe68+g7TqpIa2kZ3wjuSu78d0=;
        b=BqfpXeUHxs5pbtOBHZfthved0D8TnTF2GT7OeUk9T4s+eL32oB5UqlHNO66MQXlHZ5
         /iQf4eIAD2p+G/D7rQSqLiiVs5vwRK7Jiywp4N7X0aXbNA/DbCY0lvLLHmXOMcjG20AS
         yUxKhS8Ms6SvxpfdjWWCgwsJypCBH4HagStn41B/t6vK7XKknlKxhvb7sJq3/4uwI3cs
         vppVJAxU/msJxwrbM7mzPeZsxGRlJrvRtWm3gGMky2SCC4yfpu/FaJNYVOiVRJYJV0L1
         OatOiwCR1Kr7YPMdzFJTnuj/j6PswtrPirX0Mhj/0CKdokOKZIf1DaVYBNIgRDsda94S
         Lo6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=o1ZztMBYmzv83GFbNWWe68+g7TqpIa2kZ3wjuSu78d0=;
        b=QZSH+9P7dZUFsGW58kt7SE6Gxy/LoR92cTx7GsHiQZg/cv4OpSAQ13wzjQcIPIKeb0
         G5dA2cSmzKc3eutKoHH/z5wtpxxBcro2TudcqNz4WIXCv9tcp0qwLH719HZ1T2+bDrwp
         ow0LjE+ENXnAzqB8lYsyYHxl5v354XxTY2PXxQaq/zyAr2yJ4am3Q5bUcXvDo03oMXMH
         h2ZOb/0XojkJuOfhguwyc4zHCYrZoSZfnt7VyVXGCnGYXyr2++KFAC89eh+1PfulXnoD
         ZJkwn4GzpglMGdTYp2CLmkhr4F+gy1BJ8jqydg6uihn6LYwbCZKtcJ542FrTkeZ5Ud+2
         +iLg==
X-Gm-Message-State: AOAM533e8+FtcnWviRx6vQ/IJJwHvwDC6buNcnreCoXyoRYUbwTKst+o
        PjF6fzNXvyXq27wsLmVL5marOb5kPetJ16OmUSeb5Q==
X-Google-Smtp-Source: ABdhPJzff+s2Y/ekd2c7B1Nj/HSGb9p+cQWpDYRXLwHUd/eY9EiSd1c+yfB88GH1pNji4N5J0D3VCtgUKX7rYBsV2p4=
X-Received: by 2002:a05:6512:3084:: with SMTP id z4mr10969771lfd.167.1634027297659;
 Tue, 12 Oct 2021 01:28:17 -0700 (PDT)
MIME-Version: 1.0
References: <20211011123912.GD15188@kili>
In-Reply-To: <20211011123912.GD15188@kili>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Tue, 12 Oct 2021 10:27:41 +0200
Message-ID: <CAPDyKFpCTph6pbn+8MhiVag5QjHewc23FLJebANQzmeALw0G=g@mail.gmail.com>
Subject: Re: [PATCH] memstick: jmb38x_ms: use appropriate free function in jmb38x_ms_alloc_host()
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Maxim Levitsky <maximlevitsky@gmail.com>,
        Alex Dubov <oakad@yahoo.com>, Len Baker <len.baker@gmx.com>,
        Tom Rix <trix@redhat.com>,
        linux-mmc <linux-mmc@vger.kernel.org>,
        kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Mon, 11 Oct 2021 at 14:39, Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> The "msh" pointer is device managed, meaning that memstick_alloc_host()
> calls device_initialize() on it.  That means that it can't be free
> using kfree() but must instead be freed with memstick_free_host().
> Otherwise it leads to a tiny memory leak of device resources.
>
> Fixes: 60fdd931d577 ("memstick: add support for JMicron jmb38x MemoryStick host controller")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  drivers/memstick/host/jmb38x_ms.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/memstick/host/jmb38x_ms.c b/drivers/memstick/host/jmb38x_ms.c
> index a7a0f0caea15..21cb2a786058 100644
> --- a/drivers/memstick/host/jmb38x_ms.c
> +++ b/drivers/memstick/host/jmb38x_ms.c
> @@ -882,7 +882,7 @@ static struct memstick_host *jmb38x_ms_alloc_host(struct jmb38x_ms *jm, int cnt)
>
>         iounmap(host->addr);
>  err_out_free:
> -       kfree(msh);
> +       memstick_free_host(msh);
>         return NULL;
>  }
>
> --
> 2.20.1
>
