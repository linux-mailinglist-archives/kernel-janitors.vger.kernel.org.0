Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5C516AFEA7
	for <lists+kernel-janitors@lfdr.de>; Wed, 11 Sep 2019 16:21:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728268AbfIKOVx (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Wed, 11 Sep 2019 10:21:53 -0400
Received: from mail-vs1-f66.google.com ([209.85.217.66]:35414 "EHLO
        mail-vs1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726157AbfIKOVx (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 11 Sep 2019 10:21:53 -0400
Received: by mail-vs1-f66.google.com with SMTP id b11so13870711vsq.2
        for <kernel-janitors@vger.kernel.org>; Wed, 11 Sep 2019 07:21:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4LcH4mrEpWIl63AIHI/pwRNdziNLwRjJrkFFY14YbeE=;
        b=zo8DYVWgeCK/iLPF2aX29aG9tzw8iZslqJ6oYMTejjzaf4nQ2JDyVZhC+9uE9la4S/
         cRrMJYxaM4X7ZJRYrkEkQgnTz/XJ37/6VXvSRGlhNX992myto9o+0i4dYfmj0+Sh0UMm
         f9EXj3jIRavtrwbif0I0o2PJ3D6AY2BMQSw3tzuvSPoow8/CyGVBazCLyT114QMTaIkz
         /Issinhqo36IzD/A8M5W//FhM+UOZ92qNdREJR874qO3ED8yLqHSc7TlM5IuLeuxnlkx
         kfzeTTPqbtA2MtTCudmNA0Pak0yh3LztLn8IFgsURwF+5jQDqlsnBpnkRUP0VIJBgAy9
         WmIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4LcH4mrEpWIl63AIHI/pwRNdziNLwRjJrkFFY14YbeE=;
        b=Na6x5+0Ykn8I2p19GK3ejDlI/Yagz0stJ5uJq7rrJc0kGUbZq6whE31TwbVytlyKwt
         fyMimN1mayBKpFmlnoiCS0GM/BjCsD8T0VHwHvFAkM4+dzVawsBeLcMTgFJzjjg/XmPe
         Is/k3p1Y5f0fd4svtyTrZ9WF3LCFYymylvkyCLkxtdlgh6VZjJea2GFTGygZMRX7HV/6
         xo22Tv0tJAJg2YOzaKoqp7ZpkGAf7HTopOsBOG38S6VziNdWljFjqXz+JoTBpKjvZTZV
         HnjWkaMfTPg5oxjwq9Op+5qlOEY4HZAyDVpyA7bInT8+v0NXHVu9k+u+EJx2EXxufFhs
         Yw2w==
X-Gm-Message-State: APjAAAXSe07/t/d6tQJnhxvIHCdi2ye8T8AxQwc6/zyrBj3/ypqvkRyJ
        VfDpkKPFOsyYxzpgaZJyxTrwjmRFt7NcwF+VBcUfUQ==
X-Google-Smtp-Source: APXvYqwiZkdeK7FWgsnjGW9l7hY2CMI/Bo9ZfSKRAEanLN6oP51gZK/FoIoE47h2B6/zX+wKzvi3OXj3omxdGL9DjwQ=
X-Received: by 2002:a67:eb51:: with SMTP id x17mr10765838vso.34.1568211711983;
 Wed, 11 Sep 2019 07:21:51 -0700 (PDT)
MIME-Version: 1.0
References: <20190911103357.1744-1-colin.king@canonical.com>
In-Reply-To: <20190911103357.1744-1-colin.king@canonical.com>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Wed, 11 Sep 2019 16:21:16 +0200
Message-ID: <CAPDyKFrLOEQkv4SrBfYQo=EPRgcFs7XH3ez22ZyDerMqGDiZFw@mail.gmail.com>
Subject: Re: [PATCH] ms_block: fix spelling mistake "randomally" -> "randomly"
To:     Colin King <colin.king@canonical.com>
Cc:     Maxim Levitsky <maximlevitsky@gmail.com>,
        Alex Dubov <oakad@yahoo.com>, Jens Axboe <axboe@kernel.dk>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        kernel-janitors@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Wed, 11 Sep 2019 at 12:33, Colin King <colin.king@canonical.com> wrote:
>
> From: Colin Ian King <colin.king@canonical.com>
>
> There is a spelling mistake in a dbg_verbose message. Fix it.
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
> index 384927ebde74..d9ee8e3dc72d 100644
> --- a/drivers/memstick/core/ms_block.c
> +++ b/drivers/memstick/core/ms_block.c
> @@ -1087,7 +1087,7 @@ static u16 msb_get_free_block(struct msb_data *msb, int zone)
>
>         pos %= msb->free_block_count[zone];
>
> -       dbg_verbose("have %d choices for a free block, selected randomally: %d",
> +       dbg_verbose("have %d choices for a free block, selected randomly: %d",
>                 msb->free_block_count[zone], pos);
>
>         pba = find_next_zero_bit(msb->used_blocks_bitmap,
> --
> 2.20.1
>
