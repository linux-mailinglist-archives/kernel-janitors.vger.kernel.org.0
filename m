Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2F96D571810
	for <lists+kernel-janitors@lfdr.de>; Tue, 12 Jul 2022 13:09:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232964AbiGLLJr (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Tue, 12 Jul 2022 07:09:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54594 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232913AbiGLLJk (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 12 Jul 2022 07:09:40 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 181DFB0F9C
        for <kernel-janitors@vger.kernel.org>; Tue, 12 Jul 2022 04:09:36 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id t25so13348481lfg.7
        for <kernel-janitors@vger.kernel.org>; Tue, 12 Jul 2022 04:09:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qtKSUMpZJw+fu84zLRlJO6MjozPPrekM/BZueYyrvAA=;
        b=dpZmTVwz9BJjjbK9ykVFWxFIFj9/BTKakkDrE83e5iJIE1YPwgbp2t0bQyUxpNXQdE
         y5E2Ni9PYJqcOpmdia8fyiQ8nTQ1naeygnbab02L87Ah4DKn806hy+2DHg/lvEofMf/b
         KI+2bkzkHTMDAulyq4c0+wCEmYjTDa1PjXD7EhokPDzK8p60HDxW9zzjS62NcepZ37yH
         CrC7OXrI/nH7FzOPfu/ow15GGCS0IyfwPYhmxvb2+sz2mait+aXBST0ay4K/Xxy+cdJE
         lwchfRKC0mcRc0+m3LvfdCZBGlTYmXNJeFuNAHJtGcxPsV5fKY98VT5okNRpavfYZ/Bt
         QjUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qtKSUMpZJw+fu84zLRlJO6MjozPPrekM/BZueYyrvAA=;
        b=uMO8qq4TBbQRgRSm0l8lRW/aAHUAu37SLNOWtWjq5hIKjDyhQsJnxcLLm5O0WZyDZv
         CDw8otUDWwQwcx/eSnCDkFbgMf4B6e7Og1OKKfBp1LVko8culac1aEP1oncXVgTA0GVa
         Hf0RpGiN/mOmIEHOyWdESRdMVkBQcUVASWaNNict7bPi4tC3wN9K1iDueyIvlR++3ifo
         qTT+92bxtkIXFs0Oo5eZHlPVPZTSt4XB5qK7GjdNMyMBrXgovj+XGodxKRFn89gn+Hy5
         wrRxR/mK06OGc2F1zdZT/YNSG+sVq00Gqvhn/NM8LsQnK6eJoHLMU4wMJbMA8LfBqejb
         75MQ==
X-Gm-Message-State: AJIora8f65Kbidi9mcvvxUmxhTpxEjlc3ycJNz9IrpKDz1naJQAT6wBY
        xjA0iP1x+02nW8Gi/iptD+O+2Y4aIrC4un0cb/CEIQ==
X-Google-Smtp-Source: AGRyM1sdgovgZIpqFjv05+JJMOy7PP/DsLxQvjdR86ykqJS8oJpjV4Z8e08ny5YY7PKmxYSaf5Oova9atuFb2+AHaTM=
X-Received: by 2002:a05:6512:c0a:b0:489:cf39:d750 with SMTP id
 z10-20020a0565120c0a00b00489cf39d750mr10733405lfu.233.1657624175220; Tue, 12
 Jul 2022 04:09:35 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1656155715.git.christophe.jaillet@wanadoo.fr> <b216df8798f765ab14bce65739c220643320f376.1656155715.git.christophe.jaillet@wanadoo.fr>
In-Reply-To: <b216df8798f765ab14bce65739c220643320f376.1656155715.git.christophe.jaillet@wanadoo.fr>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Tue, 12 Jul 2022 13:08:57 +0200
Message-ID: <CAPDyKFoKxY6EyBpyE+ZhMBBkFo6uEcs9E6-wMCPYHZ4uh6iNjQ@mail.gmail.com>
Subject: Re: [PATCH 3/3] memstick/ms_block: Use the bitmap API when applicable
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc:     Maxim Levitsky <maximlevitsky@gmail.com>,
        Alex Dubov <oakad@yahoo.com>, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org, linux-mmc@vger.kernel.org
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

On Sat, 25 Jun 2022 at 14:56, Christophe JAILLET
<christophe.jaillet@wanadoo.fr> wrote:
>
> Use bitmap_equal() instead of hand writing it. It improves semantic and
> avoids some explicit computation to convert a number of bits to a number of
> bytes.
>
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  drivers/memstick/core/ms_block.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/memstick/core/ms_block.c b/drivers/memstick/core/ms_block.c
> index f8fdf88fb240..c05edfc1c841 100644
> --- a/drivers/memstick/core/ms_block.c
> +++ b/drivers/memstick/core/ms_block.c
> @@ -2245,8 +2245,8 @@ static int msb_resume(struct memstick_dev *card)
>                 goto out;
>
>         if (msb->block_count != new_msb->block_count ||
> -               memcmp(msb->used_blocks_bitmap, new_msb->used_blocks_bitmap,
> -                                                       msb->block_count / 8))
> +           !bitmap_equal(msb->used_blocks_bitmap, new_msb->used_blocks_bitmap,
> +                                                       msb->block_count))
>                 goto out;
>
>         card_dead = false;
> --
> 2.34.1
>
