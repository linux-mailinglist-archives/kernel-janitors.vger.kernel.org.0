Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 47F251D936A
	for <lists+kernel-janitors@lfdr.de>; Tue, 19 May 2020 11:36:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726632AbgESJge (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Tue, 19 May 2020 05:36:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39182 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726333AbgESJge (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 19 May 2020 05:36:34 -0400
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7597C061A0C
        for <kernel-janitors@vger.kernel.org>; Tue, 19 May 2020 02:36:33 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id m12so2350217wmc.0
        for <kernel-janitors@vger.kernel.org>; Tue, 19 May 2020 02:36:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.ionos.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=bs6Izm0ww7RlGW+J1y4Tjy30dkTU2hAWy2o3D+sO2kk=;
        b=bm83j9J0GnUXS7tCrv2N6dvh4SZUNeMCSa8Lxkj7llo6KCKXT2sQ2/fOxuL8TTFy6h
         FfiPlLjzb3tXtCvFZCc5bZKjseYsggMG3ys7At+9Mz8S4l79AwbYLqJ9Yo62OmYxZ2W0
         I6jorLj54njoJYTSYOtjxoh9DdXh5rhBrx2eF2Nim1xtw7hadnDTYqIxbulj4+XiGbMw
         2qWzVzyGywOW1qOWYzSYJDie2cjd0SmekZwPUfmMrBGkvJnHry2mAiZ/8hGVlFQKtVGR
         WW4fxGVEyjrwP5riXs+Pqjq7YJSmLZ7SRgcxn+DqbL9DdjLJbaicfUc0wDhfrhHC8aId
         plfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=bs6Izm0ww7RlGW+J1y4Tjy30dkTU2hAWy2o3D+sO2kk=;
        b=NLzYTOX5oEE8wAb/1oS2ao1aqYvoKn7CXJscp8V7E5XUg2dAl+R6LOSzhU8Nh2DBJW
         aF+AzaC54IFrhXit6SOVZRIjXh8JYs2jEepf/ggW3sVxyGoaLEgYAuxIQ7hIn8+yCwZc
         L2z8mgnJ1Pf7vECtjfj3H1bJNLYhrYqkMgZF+/UkrMOvajGV1W7Ku6lNnbw6cWhN73Yv
         RyCuhwcoVfAjDyIXlLzNuUqrd7NW8MUjvOAu6E+DZ91RlPZDRhKLneLC+oFlrlQ3LyuV
         uQaJnuIO1vZwwmZ+jDqovGwWyMxJCrI1sC4HG+dUBNgeLz0LBUJj95hMl3FO3wbBks3S
         +oDw==
X-Gm-Message-State: AOAM532MQM2qnBfVYsfkRGyqEYimjKfg7ZEZ5fwHkBeFXBmLuZ+nvT0l
        gwNbYsyghHPk0EWDvz+pL6f3kj7KkVRgbthRk38efN6fTq2U
X-Google-Smtp-Source: ABdhPJx8KddI6xOBKAtBT3MNAvDPf8ZR1YV5tr6yRDmjr4W3Szf61rxuKncs8dvrdHZTra8UpszBnrvkpIJMQ9MF0Bo=
X-Received: by 2002:a1c:a3c5:: with SMTP id m188mr4465160wme.160.1589880992394;
 Tue, 19 May 2020 02:36:32 -0700 (PDT)
MIME-Version: 1.0
References: <20200519091912.134358-1-weiyongjun1@huawei.com>
In-Reply-To: <20200519091912.134358-1-weiyongjun1@huawei.com>
From:   Danil Kipnis <danil.kipnis@cloud.ionos.com>
Date:   Tue, 19 May 2020 11:36:21 +0200
Message-ID: <CAHg0HuzqtZXzwXG4zBE5=kXomUunMP5y8ytZRsNKh1_XYdEdNw@mail.gmail.com>
Subject: Re: [PATCH -next] RDMA/rtrs: server: fix some error return code
To:     Wei Yongjun <weiyongjun1@huawei.com>
Cc:     Jack Wang <jinpu.wang@cloud.ionos.com>,
        Doug Ledford <dledford@redhat.com>,
        Jason Gunthorpe <jgg@ziepe.ca>, linux-rdma@vger.kernel.org,
        kernel-janitors@vger.kernel.org, Hulk Robot <hulkci@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Tue, May 19, 2020 at 11:16 AM Wei Yongjun <weiyongjun1@huawei.com> wrote:
>
> Fix to return negative error code -ENOMEM from the some error handling
> cases instead of 0, as done elsewhere in this function.
>
> Fixes: 9cb837480424 ("RDMA/rtrs: server: main functionality")
> Fixes: 91b11610af8d ("RDMA/rtrs: server: sysfs interface functions")
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> ---
>  drivers/infiniband/ulp/rtrs/rtrs-srv.c | 8 +++++---
>  drivers/infiniband/ulp/rtrs/rtrs-srv-sysfs.c | 1 +
>  2 file changed, 6 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/infiniband/ulp/rtrs/rtrs-srv.c b/drivers/infiniband/ulp/rtrs/rtrs-srv.c
> index ba8ab33b94a2..526433580b96 100644
> --- a/drivers/infiniband/ulp/rtrs/rtrs-srv.c
> +++ b/drivers/infiniband/ulp/rtrs/rtrs-srv.c
> @@ -660,8 +660,8 @@ static int map_cont_bufs(struct rtrs_srv_sess *sess)
>                                         GFP_KERNEL, sess->s.dev->ib_dev,
>                                         DMA_TO_DEVICE, rtrs_srv_rdma_done);
>                         if (!srv_mr->iu) {
> -                               rtrs_err(ss, "rtrs_iu_alloc(), err: %d\n",
> -                                         -ENOMEM);
> +                               err = -ENOMEM;
> +                               rtrs_err(ss, "rtrs_iu_alloc(), err: %d\n", err);
>                                 goto free_iu;
>                         }
>                 }
> @@ -2150,8 +2150,10 @@ static int __init rtrs_server_init(void)
>                 goto out_chunk_pool;
>         }
>         rtrs_wq = alloc_workqueue("rtrs_server_wq", WQ_MEM_RECLAIM, 0);
> -       if (!rtrs_wq)
> +       if (!rtrs_wq) {
> +               err = -ENOMEM;
>                 goto out_dev_class;
> +       }
>
>         return 0;
>
> diff --git a/drivers/infiniband/ulp/rtrs/rtrs-srv-sysfs.c b/drivers/infiniband/ulp/rtrs/rtrs-srv-sysfs.c
> index 0cf015634338..3d7877534bcc 100644
> --- a/drivers/infiniband/ulp/rtrs/rtrs-srv-sysfs.c
> +++ b/drivers/infiniband/ulp/rtrs/rtrs-srv-sysfs.c
> @@ -189,6 +189,7 @@ static int rtrs_srv_create_once_sysfs_root_folders(struct rtrs_srv_sess *sess)
>         }
>         srv->kobj_paths = kobject_create_and_add("paths", &srv->dev.kobj);
>         if (!srv->kobj_paths) {
> +               err = -ENOMEM;
>                 pr_err("kobject_create_and_add(): %d\n", err);
>                 device_unregister(&srv->dev);
>                 goto unlock;
>

Thanks a lot Wei!
Reviewed-by: Danil Kipnis <danil.kipnis@cloud.ionos.com>
