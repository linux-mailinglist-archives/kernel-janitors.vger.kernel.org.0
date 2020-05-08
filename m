Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 516581CBB0F
	for <lists+kernel-janitors@lfdr.de>; Sat,  9 May 2020 01:05:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728287AbgEHXFD (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Fri, 8 May 2020 19:05:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44376 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728255AbgEHXFD (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 8 May 2020 19:05:03 -0400
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com [IPv6:2607:f8b0:4864:20::743])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1701AC05BD43
        for <kernel-janitors@vger.kernel.org>; Fri,  8 May 2020 16:05:03 -0700 (PDT)
Received: by mail-qk1-x743.google.com with SMTP id n14so3559102qke.8
        for <kernel-janitors@vger.kernel.org>; Fri, 08 May 2020 16:05:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=PiUVa5mVO89jeXQmai25H32mWUhzjICjk7pOMJIJk4M=;
        b=aeIWvzPXDXfpoIWJD4RSKGQirPc8lgF0hCA7z+WnsTXlqRhUtPwt4ABFjTPGSQ4MmW
         co9aA/P0GUUUWqi2b2tLG/UGKjI5T4MsFL7wOEefM5SJJFRdXctIb9yoofcvfMBAhpvX
         J/QuNRxp4qHlOOtTwNwjrBQweLSXxjbnyo68o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PiUVa5mVO89jeXQmai25H32mWUhzjICjk7pOMJIJk4M=;
        b=bZBOHKk0axX1W4gk5/EC+T8PXRAAIFByWHW/ADgIHrRSoQ1eL7L7mxQxXjuEYHR9yO
         REgGmM+Nkory431WAdZNQlvWXshtebsWRgDrZKO7mS9r8CQlqe1oDGaWopUug8mT5E5o
         99A3ILcrkUmAi8VOPmBtklSl7GkWstCPusCWzqpKm26RdutzTe8XIjavszGPJrBZOSYf
         7P/dnpEj0hmxkUEME+S0c/IExf7MLTC92pGfbvli6y4rbeNzq7hPrWYFIdF1F2P0l6vl
         VUcIkymCP58zqvJmOjl7PJQBfG1rxYtwgb9/HT0DQhI9fjW4GkzU71mTATGO6EmAWpHd
         G1eQ==
X-Gm-Message-State: AGi0PuaBfBvScXzLc0BT/Q6Bc2F15m74y2geGSDn4knYNRX0uDKI8lJa
        hOV9/fihW1vmaSAz9VHNwZWpv9z9Sz7Sjfr3+iam8A==
X-Google-Smtp-Source: APiQypKgAkoL81J9siZ6ExsdQxNJg8FR8V54RCPQtvmozJqNCBpzRhfXUIlX/5mNKADU/Vf82qndSg3c1Brdxm5ukPo=
X-Received: by 2002:a05:620a:4f0:: with SMTP id b16mr5114221qkh.165.1588979101996;
 Fri, 08 May 2020 16:05:01 -0700 (PDT)
MIME-Version: 1.0
References: <20200508225301.484094-1-colin.king@canonical.com>
In-Reply-To: <20200508225301.484094-1-colin.king@canonical.com>
From:   Michael Chan <michael.chan@broadcom.com>
Date:   Fri, 8 May 2020 16:04:50 -0700
Message-ID: <CACKFLinpQFupdmq63RH527sDrAj4nrV4vcR+eDy5zh4KqLh8Dg@mail.gmail.com>
Subject: Re: [PATCH] net: tg3: tidy up loop, remove need to compute off with a multiply
To:     Colin King <colin.king@canonical.com>
Cc:     Siva Reddy Kallam <siva.kallam@broadcom.com>,
        Prashant Sreedharan <prashant@broadcom.com>,
        Michael Chan <mchan@broadcom.com>,
        "David S . Miller" <davem@davemloft.net>,
        Netdev <netdev@vger.kernel.org>, kernel-janitors@vger.kernel.org,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Fri, May 8, 2020 at 3:53 PM Colin King <colin.king@canonical.com> wrote:
>
> From: Colin Ian King <colin.king@canonical.com>
>
> Currently the value for 'off' is computed using a multiplication and
> a couple of statements later off is being incremented by len and
> this value is never read.  Clean up the code by removing the
> multiplication and just increment off by len on each iteration. Also
> use len instead of TG3_OCIR_LEN.
>
> Addresses-Coverity: ("Unused value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/net/ethernet/broadcom/tg3.c | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/net/ethernet/broadcom/tg3.c b/drivers/net/ethernet/broadcom/tg3.c
> index ff98a82b7bc4..9dd9bd506bcc 100644
> --- a/drivers/net/ethernet/broadcom/tg3.c
> +++ b/drivers/net/ethernet/broadcom/tg3.c
> @@ -10798,16 +10798,14 @@ static int tg3_init_hw(struct tg3 *tp, bool reset_phy)
>  static void tg3_sd_scan_scratchpad(struct tg3 *tp, struct tg3_ocir *ocir)
>  {
>         int i;
> +       u32 off, len = TG3_OCIR_LEN;

Please use reverse X-mas tree style variable declarations.  Other than
that, it looks good.

Thanks.

>
> -       for (i = 0; i < TG3_SD_NUM_RECS; i++, ocir++) {
> -               u32 off = i * TG3_OCIR_LEN, len = TG3_OCIR_LEN;
> -
> +       for (i = 0, off = 0; i < TG3_SD_NUM_RECS; i++, ocir++, off += len) {
>                 tg3_ape_scratchpad_read(tp, (u32 *) ocir, off, len);
> -               off += len;
>
>                 if (ocir->signature != TG3_OCIR_SIG_MAGIC ||
>                     !(ocir->version_flags & TG3_OCIR_FLAG_ACTIVE))
> -                       memset(ocir, 0, TG3_OCIR_LEN);
> +                       memset(ocir, 0, len);
>         }
>  }
>
> --
> 2.25.1
>
