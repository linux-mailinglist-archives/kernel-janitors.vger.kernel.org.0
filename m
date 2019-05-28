Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E764C2C1B1
	for <lists+kernel-janitors@lfdr.de>; Tue, 28 May 2019 10:53:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726619AbfE1IxW (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Tue, 28 May 2019 04:53:22 -0400
Received: from mail-ua1-f67.google.com ([209.85.222.67]:33261 "EHLO
        mail-ua1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726649AbfE1IxV (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 28 May 2019 04:53:21 -0400
Received: by mail-ua1-f67.google.com with SMTP id 49so7549530uas.0
        for <kernel-janitors@vger.kernel.org>; Tue, 28 May 2019 01:53:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ZB21roceA2zBtxGGuWfdc7oMMf+SBHpS283kkrPrf5k=;
        b=vuuJ8Pdrjmw9rhc/dcx5GD5/WyeukxvdjKIFasveCHnD1gjfiexhPqmUdhgTeO6oVg
         sPP1+S66ChFfhy9fjm6kLr0Kpv5e/spIMdUZg6H2B7eA0e+YQ4Z5MuMdxvV78EAqA1ix
         1xrB42Z7L5yZZit6nWNJCqdvLbF3WJEpGqpRl+Si4wiqpmZX8682CXpG4tNlyEakE0lV
         VY4hIqqK9e9hEhJSSHhLBfNWQra478T6+11xnyonNQKVXGsbEZr/YDb5u/obUAvmychc
         yz9kZm6Qjc7UfoKLrCdqBz2h6IcXsgbN0zKINQ+H7lzOLO1PAT/t/Rwz92DFV1z3P0YY
         AgHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ZB21roceA2zBtxGGuWfdc7oMMf+SBHpS283kkrPrf5k=;
        b=A1KJnNsPy701Hz0fEpKgM+27aW0avOtavFsi2LIBPtnbR98z3kjiqUvmpi7aovG8/D
         nqVnLU5hfWGyh0jJAtm+Gg11wn8eWMRESYpx7sp2GrJT7OYvL9SuwrsFA+LWWcl9gjef
         eJgZ5lKsThvpVI9Y6+bRkk4QrltrZHfWKvEgKxCsWvTw7ITZsiGWRh/9qVXToJGij+IY
         ITP+yibv4d7gtscpJhP1f7o+Cv+5C3kCIDfzbp/IhFcNROowKz67KLr+LCHqkbPwxlPy
         Ybp00CiD25F0+DkI4F33O0WN2WvnhQzd3OHGe+yql6bQ7xYwHKzibU+DccKrMiOJ7SxQ
         ms1g==
X-Gm-Message-State: APjAAAWlwRqOwolhQ2dSMJNVj6dOxsUDK/RPfE5Mjo1mAqloI9prbbc3
        C7okONdV37AW/SmarnKZNfMRuYpyNt+KZtSgH6BV4Q==
X-Google-Smtp-Source: APXvYqxL/AbbYn4vMq0qF/T+EATO+MHj3ZK4a8PRqtDLseDl8u0YgCAyRaU2KE4eKgW1AZhe32Dn5iutQ3YDB6OnSiw=
X-Received: by 2002:ab0:5608:: with SMTP id y8mr52224176uaa.129.1559033600354;
 Tue, 28 May 2019 01:53:20 -0700 (PDT)
MIME-Version: 1.0
References: <20190510112440.GA22858@mwanda>
In-Reply-To: <20190510112440.GA22858@mwanda>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Tue, 28 May 2019 10:52:44 +0200
Message-ID: <CAPDyKFoGshb2AsHdeYmF4o1Kj+gPRbxSkrs=cBy-zkfepq8Exw@mail.gmail.com>
Subject: Re: [PATCH] mspro_block: Fix an error code in mspro_block_issue_req()
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Maxim Levitsky <maximlevitsky@gmail.com>,
        Jens Axboe <axboe@kernel.dk>, Alex Dubov <oakad@yahoo.com>,
        Hannes Reinecke <hare@suse.de>,
        Martin Wilck <martin.wilck@suse.com>,
        Bart Van Assche <bvanassche@acm.org>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Fri, 10 May 2019 at 13:25, Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> We accidentally changed the error code from -EAGAIN to 1 when we did the
> blk-mq conversion.
>
> Maybe a contributing factor to this mistake is that it wasn't obvious
> that the "while (chunk) {" condition is always true.  I have cleaned
> that up as well.
>
> Fixes: d0be12274dad ("mspro_block: convert to blk-mq")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied for fixes and by adding a stable tag, thanks!

Kind regards
Uffe


> ---
>  drivers/memstick/core/mspro_block.c | 13 ++++++-------
>  1 file changed, 6 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/memstick/core/mspro_block.c b/drivers/memstick/core/mspro_block.c
> index aba50ec98b4d..9fc22c755dbf 100644
> --- a/drivers/memstick/core/mspro_block.c
> +++ b/drivers/memstick/core/mspro_block.c
> @@ -694,13 +694,13 @@ static void h_mspro_block_setup_cmd(struct memstick_dev *card, u64 offset,
>
>  /*** Data transfer ***/
>
> -static int mspro_block_issue_req(struct memstick_dev *card, bool chunk)
> +static int mspro_block_issue_req(struct memstick_dev *card)
>  {
>         struct mspro_block_data *msb = memstick_get_drvdata(card);
>         u64 t_off;
>         unsigned int count;
>
> -       while (chunk) {
> +       while (true) {
>                 msb->current_page = 0;
>                 msb->current_seg = 0;
>                 msb->seg_count = blk_rq_map_sg(msb->block_req->q,
> @@ -709,6 +709,7 @@ static int mspro_block_issue_req(struct memstick_dev *card, bool chunk)
>
>                 if (!msb->seg_count) {
>                         unsigned int bytes = blk_rq_cur_bytes(msb->block_req);
> +                       bool chunk;
>
>                         chunk = blk_update_request(msb->block_req,
>                                                         BLK_STS_RESOURCE,
> @@ -718,7 +719,7 @@ static int mspro_block_issue_req(struct memstick_dev *card, bool chunk)
>                         __blk_mq_end_request(msb->block_req,
>                                                 BLK_STS_RESOURCE);
>                         msb->block_req = NULL;
> -                       break;
> +                       return -EAGAIN;
>                 }
>
>                 t_off = blk_rq_pos(msb->block_req);
> @@ -735,8 +736,6 @@ static int mspro_block_issue_req(struct memstick_dev *card, bool chunk)
>                 memstick_new_req(card->host);
>                 return 0;
>         }
> -
> -       return 1;
>  }
>
>  static int mspro_block_complete_req(struct memstick_dev *card, int error)
> @@ -779,7 +778,7 @@ static int mspro_block_complete_req(struct memstick_dev *card, int error)
>                 chunk = blk_update_request(msb->block_req,
>                                 errno_to_blk_status(error), t_len);
>                 if (chunk) {
> -                       error = mspro_block_issue_req(card, chunk);
> +                       error = mspro_block_issue_req(card);
>                         if (!error)
>                                 goto out;
>                 } else {
> @@ -849,7 +848,7 @@ static blk_status_t mspro_queue_rq(struct blk_mq_hw_ctx *hctx,
>         msb->block_req = bd->rq;
>         blk_mq_start_request(bd->rq);
>
> -       if (mspro_block_issue_req(card, true))
> +       if (mspro_block_issue_req(card))
>                 msb->block_req = NULL;
>
>         spin_unlock_irq(&msb->q_lock);
> --
> 2.18.0
>
