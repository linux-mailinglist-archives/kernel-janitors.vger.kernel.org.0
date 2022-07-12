Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DA7E257180A
	for <lists+kernel-janitors@lfdr.de>; Tue, 12 Jul 2022 13:09:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232731AbiGLLJd (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Tue, 12 Jul 2022 07:09:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54246 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232553AbiGLLJb (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 12 Jul 2022 07:09:31 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E0E3B0269
        for <kernel-janitors@vger.kernel.org>; Tue, 12 Jul 2022 04:09:30 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id t1so9810200lft.8
        for <kernel-janitors@vger.kernel.org>; Tue, 12 Jul 2022 04:09:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=PDf3BoUtYX3hh7B0z9WYpVo707DKLqfuw9BowOK+j9c=;
        b=o1CktAttWi56z4qyeYomeZQNWZ2zu53S7mboNDsffxLkrAPHWpaTf+9+6jPQ9Ss9NB
         UVo7ZLByhKvBYi3hiCW+NY6XmDgH/2v5ccFcIaC3laRWT0Y15NwhczcJhjEqY/fW/cgo
         VmwqM01HE+FB+nCJfeniETlpyJp0n7qtfEU+tLmqtR6ZRGEOOCifFdUBXEGD//oz8tci
         PIJiYu1iOmkeLPWN1flkWOFeqgUbBhLe+kdmo/cllBFhBXharxZ3vU94QxdS4FanVnw1
         nLYzM6Sroa1Yi7d/lBPy9RA3RPtRMWwphpUjEoUR/hJz43Pv6bQA6KWINq625+tqEOd9
         AvZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PDf3BoUtYX3hh7B0z9WYpVo707DKLqfuw9BowOK+j9c=;
        b=OjDQSeQM3wLJI8kmI/kkC4KbfAH2KDeQ2ledc9CBsoqvBT0Q+/Srph2YhpgkWbDsgF
         cpdBHmt8dukbUR8OBoL7GSv7LxRH+Q02vkvVGw1OojApTHWxigO+HMQPQHhF5dX3NI0L
         FY5ylW+bSKSdEKpsxu875EPWGZpTtegwHG3aWXn7haNc/F2xGNHAuLs23JgqMGys/1kK
         x/T6iPQ+0w+hqApPgwCtOB5ejXvzbwbRQejIqqbBZgO+H8RQO5c0I0Wy2LaFQFT53qg3
         kTkXyKmMPyAw5Ne5ErZIl/l7MrxGwgvf6DdtpF4b0mjx7KrYcCvsIICsDn5RcF4Am/YS
         ff/Q==
X-Gm-Message-State: AJIora8XwV/5qmCd4Phdy+xydHZTYgqemgljN7fqbJPNXds8ivNWF3DK
        OZjVt2KFITdJ7ZmM3ahr4gUYXhTjBqEjDXUxk1NqPg==
X-Google-Smtp-Source: AGRyM1vxtHxODOV2BqJv2lSmKEpqsJBWS2XHiKMS+cv6EzKPF5vdgR28up/hA1Q0vsxHvBG4mFKanjJq8mBp4AcyOk8=
X-Received: by 2002:a05:6512:3d03:b0:47f:7023:2c57 with SMTP id
 d3-20020a0565123d0300b0047f70232c57mr14042987lfv.254.1657624168433; Tue, 12
 Jul 2022 04:09:28 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1656155715.git.christophe.jaillet@wanadoo.fr> <dbf633c48c24ae6d95f852557e8d8b3bbdef65fe.1656155715.git.christophe.jaillet@wanadoo.fr>
In-Reply-To: <dbf633c48c24ae6d95f852557e8d8b3bbdef65fe.1656155715.git.christophe.jaillet@wanadoo.fr>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Tue, 12 Jul 2022 13:08:50 +0200
Message-ID: <CAPDyKFq2QC7PkjfmLcgyG3gDgDHWROwd0X5+tjF3hFCc7xVs1w@mail.gmail.com>
Subject: Re: [PATCH 1/3] memstick/ms_block: Fix some incorrect memory allocation
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc:     Maxim Levitsky <maximlevitsky@gmail.com>,
        Alex Dubov <oakad@yahoo.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        linux-mmc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Sat, 25 Jun 2022 at 14:55, Christophe JAILLET
<christophe.jaillet@wanadoo.fr> wrote:
>
> Some functions of the bitmap API take advantage of the fact that a bitmap
> is an array of long.
>
> So, to make sure this assertion is correct, allocate bitmaps with
> bitmap_zalloc() instead of kzalloc()+hand-computed number of bytes.
>
> While at it, also use bitmap_free() instead of kfree() to keep the
> semantic.
>
> Fixes: 0ab30494bc4f ("memstick: add support for legacy memorysticks")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Applied for next, thanks!

Kind regards
Uffe


> ---
> I guess that it is not an issue in RL because memory allocation is
> certainly "rounding" to keep memory alignment.
> ---
>  drivers/memstick/core/ms_block.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/memstick/core/ms_block.c b/drivers/memstick/core/ms_block.c
> index 3993bdd4b519..f8f151163667 100644
> --- a/drivers/memstick/core/ms_block.c
> +++ b/drivers/memstick/core/ms_block.c
> @@ -1341,17 +1341,17 @@ static int msb_ftl_initialize(struct msb_data *msb)
>         msb->zone_count = msb->block_count / MS_BLOCKS_IN_ZONE;
>         msb->logical_block_count = msb->zone_count * 496 - 2;
>
> -       msb->used_blocks_bitmap = kzalloc(msb->block_count / 8, GFP_KERNEL);
> -       msb->erased_blocks_bitmap = kzalloc(msb->block_count / 8, GFP_KERNEL);
> +       msb->used_blocks_bitmap = bitmap_zalloc(msb->block_count, GFP_KERNEL);
> +       msb->erased_blocks_bitmap = bitmap_zalloc(msb->block_count, GFP_KERNEL);
>         msb->lba_to_pba_table =
>                 kmalloc_array(msb->logical_block_count, sizeof(u16),
>                               GFP_KERNEL);
>
>         if (!msb->used_blocks_bitmap || !msb->lba_to_pba_table ||
>                                                 !msb->erased_blocks_bitmap) {
> -               kfree(msb->used_blocks_bitmap);
> +               bitmap_free(msb->used_blocks_bitmap);
> +               bitmap_free(msb->erased_blocks_bitmap);
>                 kfree(msb->lba_to_pba_table);
> -               kfree(msb->erased_blocks_bitmap);
>                 return -ENOMEM;
>         }
>
> @@ -1946,7 +1946,7 @@ static DEFINE_MUTEX(msb_disk_lock); /* protects against races in open/release */
>  static void msb_data_clear(struct msb_data *msb)
>  {
>         kfree(msb->boot_page);
> -       kfree(msb->used_blocks_bitmap);
> +       bitmap_free(msb->used_blocks_bitmap);
>         kfree(msb->lba_to_pba_table);
>         kfree(msb->cache);
>         msb->card = NULL;
> --
> 2.34.1
>
