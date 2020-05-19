Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C6AE91D9BE2
	for <lists+kernel-janitors@lfdr.de>; Tue, 19 May 2020 18:00:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729360AbgESQAx (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Tue, 19 May 2020 12:00:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42740 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729055AbgESQAx (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 19 May 2020 12:00:53 -0400
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D461FC08C5C0
        for <kernel-janitors@vger.kernel.org>; Tue, 19 May 2020 09:00:52 -0700 (PDT)
Received: by mail-wm1-x343.google.com with SMTP id h4so3594549wmb.4
        for <kernel-janitors@vger.kernel.org>; Tue, 19 May 2020 09:00:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.ionos.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=BmLSEBizF5QwZ0w8Jva6N+7I89XZ83pvn5mbF9AauMU=;
        b=HUye97v9LyaMSqw+E/FpZNDbsO1SE7ChWSkscNuv36LxUKxH75OYus+P3faHzhBoqi
         rj3XrNuC46MBLrShN1dnuZCq/p1g10z0xrFWbyR6ZQ4bI+jQOv6PxOzZWOBoxYPB4PYQ
         qD02Ae2iMjJ03oj8UUmIxDfqXCnVUZkJCHfm11m7Uo7y2Cg0Hyhz1koszly6B0XEM+Ht
         pXCSUG/KYJQ7z1PkuDcPE1AfAMCSqxeh5Gm7rdsvniueOTeOAgH00AMlcPh/qaVZdrE+
         zqOSt+Gs4dMmsPNa+5nzpyXtscCz4Qf3qLQD23/WpAv1zrnUy/oEyN4BIF+uuiRqqEl3
         fL8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BmLSEBizF5QwZ0w8Jva6N+7I89XZ83pvn5mbF9AauMU=;
        b=JW4g3ZXqmhnDR2c59lSG4r6PHyZcPx2HrHt/nojSjmQOE2mSugxztgAIFkt9syR0EZ
         3oMxqshajEE4lzSgAJzd8Onz+cr+KTD+Hb6a1PjkixORi94ILXV5rMZ2Ip6Swaqi9or/
         +/4hKgPzm6lF3LSblSGD7MlXnpdeMrNeG+utvAGLLM8o09O2xZwANTMYgIF9llu3V8dX
         UMYllOIHyWylQY42JR0pFnSrsKuHnWEQ59Gi6k0TcouNH+WpBIWYnah23vp7QYOxfsJ3
         N0EJok91sirUYzdLdE2c/M0clc+PdlQLzUEbhb6WNAG6xa4twy0sPsYBm5ed3Sr7rodE
         WPAw==
X-Gm-Message-State: AOAM533NT4q2P/9wIuagQYuFn7jwGtQR93XQK3qqeT0naSD5fmzoxzuF
        qRrPRDuyhWehBCMkM/lvslJP+YHCQ+T4rsbJKBF1
X-Google-Smtp-Source: ABdhPJw/YCnRJY1GgnQdvj+SGYyFtn5wisFibQeDNsvksIsO3xMvENa+bKnM4fLCF0BfmetWSDDTVY4TjPINiLA/d9w=
X-Received: by 2002:a1c:5402:: with SMTP id i2mr44858wmb.185.1589904051546;
 Tue, 19 May 2020 09:00:51 -0700 (PDT)
MIME-Version: 1.0
References: <CAHg0Huz39q9nWwTrtCY=SgU=T9oZJQdchx6c1LOPbSQiywzrqw@mail.gmail.com>
 <20200519154525.GA66801@mwanda>
In-Reply-To: <20200519154525.GA66801@mwanda>
From:   Danil Kipnis <danil.kipnis@cloud.ionos.com>
Date:   Tue, 19 May 2020 18:00:40 +0200
Message-ID: <CAHg0HuzLo8jYtmkdvm2qJ_n2va61Xq-4NE3uxnHHpaUf9YESEw@mail.gmail.com>
Subject: Re: [PATCH] RDMA/rtrs: Fix a couple off by one bugs in rtrs_srv_rdma_done()
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Jack Wang <jinpu.wang@cloud.ionos.com>,
        Doug Ledford <dledford@redhat.com>,
        Jason Gunthorpe <jgg@ziepe.ca>, linux-rdma@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Tue, May 19, 2020 at 5:45 PM Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> These > comparisons should be >= to prevent accessing one element
> beyond the end of the buffer.
>
> Fixes: 9cb837480424 ("RDMA/rtrs: server: main functionality")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  drivers/infiniband/ulp/rtrs/rtrs-srv.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/infiniband/ulp/rtrs/rtrs-srv.c b/drivers/infiniband/ulp/rtrs/rtrs-srv.c
> index 658c8999cb0d..0b53b79b0e27 100644
> --- a/drivers/infiniband/ulp/rtrs/rtrs-srv.c
> +++ b/drivers/infiniband/ulp/rtrs/rtrs-srv.c
> @@ -1213,8 +1213,8 @@ static void rtrs_srv_rdma_done(struct ib_cq *cq, struct ib_wc *wc)
>
>                         msg_id = imm_payload >> sess->mem_bits;
>                         off = imm_payload & ((1 << sess->mem_bits) - 1);
> -                       if (unlikely(msg_id > srv->queue_depth ||
> -                                    off > max_chunk_size)) {
> +                       if (unlikely(msg_id >= srv->queue_depth ||
> +                                    off >= max_chunk_size)) {
>                                 rtrs_err(s, "Wrong msg_id %u, off %u\n",
>                                           msg_id, off);
>                                 close_sess(sess);
> --
> 2.26.2
>

Thanks a lot, Dan!
Acked-by: Danil Kipnis <danil.kipnis@cloud.ionos.com>
