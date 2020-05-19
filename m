Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F2A1B1D97DD
	for <lists+kernel-janitors@lfdr.de>; Tue, 19 May 2020 15:35:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728052AbgESNfm (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Tue, 19 May 2020 09:35:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48272 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726471AbgESNfm (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 19 May 2020 09:35:42 -0400
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com [IPv6:2a00:1450:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F10E3C08C5C0
        for <kernel-janitors@vger.kernel.org>; Tue, 19 May 2020 06:35:41 -0700 (PDT)
Received: by mail-ed1-x541.google.com with SMTP id h16so11578462eds.5
        for <kernel-janitors@vger.kernel.org>; Tue, 19 May 2020 06:35:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.ionos.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Z1Dv3i/k7upzRwyNeFhQwiOindJlB20gpivaCGXYPIo=;
        b=g3tTzskZJ7L3iLaULQsGfB7cYADhU6G07XzuAbZLfIb/yVn+JDV97cotIA2oLWwZIu
         NrCNBdOwxb8YMZHi+XeKUtJcWFsHqnPdgI7kkfwGwGvgqe+uI7QFsk2t0NhMtz+ZAOiP
         zg2UGKP8AE6maOb4iChm4prudVegau1U/rr3jQI50S85RaW18kBo4vkDyx+9avdsjVIa
         mFVbejUKP3bHE2ANOXThWtggTazaGndM2J04StyHgqZOdRPbimjkIiwQ8ZJVR5D1Sdbg
         EpmGkFfzEg66jJuwi1SnAxcOQ9XU3g/Koufun4RsqcC9nJsD7PAagmi/Irue/k2/S1GW
         McPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Z1Dv3i/k7upzRwyNeFhQwiOindJlB20gpivaCGXYPIo=;
        b=S1ygK4FpfXMZPtNK6+90VwO8IFDmuPqQhkF1P/eXPXaqwG2uoNnrpfd+IYI8r+DFqe
         GBKpqez5flfEpU/leoamAwQTtOcqCC/8RsRH3wR2DdpZzdYN+kFXBzLujcY5PQU0yxVw
         wwUjw3/ccYJ44jdD1d/I4sTOMdt/OvQYQQCMksnAzgkSXr5vXwEMseY8HXNyU8jEC6fa
         tW+KGXs1aNxJgGkBZMuUJz0CR01XefMM497xFyJk39vtUGBify2eSjYaIc9Llqzuidpv
         019aHZbSrVDPN1TafnaiDJz/gdnXhzpgzv9qvVIPyQ6ngpVPF6RlPzVaeptsjfhTiWFM
         Po7A==
X-Gm-Message-State: AOAM530Cj3o/A6XQ5lr46L9ORVkpsEhIkhJzxxX7UWhv//omKpTDyuBC
        ACNZmSDbzTBFeYe1U2/3SEdsBINiyfLP5NlQWbZanA==
X-Google-Smtp-Source: ABdhPJzcOTdQUdYRPbq0X6Em5XMmSF34oNnGihGM9/WmWVoOKnOCIHJnAbHyVIlZp22ViZz2A0lhWRgiynj9U7Qwhwo=
X-Received: by 2002:a05:6402:68f:: with SMTP id f15mr18794299edy.89.1589895340543;
 Tue, 19 May 2020 06:35:40 -0700 (PDT)
MIME-Version: 1.0
References: <CAMGffEkkUVV9b=iMhP4C=ndBRcePcTQMiF4h-Et1DFEKYPA6mg@mail.gmail.com>
 <20200519133223.GN2078@kadam>
In-Reply-To: <20200519133223.GN2078@kadam>
From:   Jinpu Wang <jinpu.wang@cloud.ionos.com>
Date:   Tue, 19 May 2020 15:35:29 +0200
Message-ID: <CAMGffEnVdcUBsq21jHF7O1Fkiruy_Uz-cM6hKWprrFkTrY-Wbg@mail.gmail.com>
Subject: Re: [PATCH v2] RDMA/rtrs: Fix some signedness bugs in error handling
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Danil Kipnis <danil.kipnis@cloud.ionos.com>,
        Doug Ledford <dledford@redhat.com>,
        Jason Gunthorpe <jgg@ziepe.ca>, linux-rdma@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Tue, May 19, 2020 at 3:32 PM Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> The problem is that "req->sg_cnt" is an unsigned int so if "nr" is
> negative, it gets type promoted to a high positive value and the
> condition is false.  This patch fixes it by handling negatives separately.
>
> Fixes: 6a98d71daea1 ("RDMA/rtrs: client: main functionality")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
Thanks Dan,
Reviewed-by: Jack Wang <jinpu.wang@cloud.ionos.com>
> ---
> v2: propagate the correct error code instead of returning -EINVAL
>
>  drivers/infiniband/ulp/rtrs/rtrs-clt.c | 7 +++----
>  drivers/infiniband/ulp/rtrs/rtrs-srv.c | 2 +-
>  2 files changed, 4 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/infiniband/ulp/rtrs/rtrs-clt.c b/drivers/infiniband/ulp/rtrs/rtrs-clt.c
> index 468fdd0d8713..17f99f0962d0 100644
> --- a/drivers/infiniband/ulp/rtrs/rtrs-clt.c
> +++ b/drivers/infiniband/ulp/rtrs/rtrs-clt.c
> @@ -1047,11 +1047,10 @@ static int rtrs_map_sg_fr(struct rtrs_clt_io_req *req, size_t count)
>
>         /* Align the MR to a 4K page size to match the block virt boundary */
>         nr = ib_map_mr_sg(req->mr, req->sglist, count, NULL, SZ_4K);
> -       if (unlikely(nr < req->sg_cnt)) {
> -               if (nr < 0)
> -                       return nr;
> +       if (nr < 0)
> +               return nr;
> +       if (unlikely(nr < req->sg_cnt))
>                 return -EINVAL;
> -       }
>         ib_update_fast_reg_key(req->mr, ib_inc_rkey(req->mr->rkey));
>
>         return nr;
> diff --git a/drivers/infiniband/ulp/rtrs/rtrs-srv.c b/drivers/infiniband/ulp/rtrs/rtrs-srv.c
> index ba8ab33b94a2..eefd149ce7a4 100644
> --- a/drivers/infiniband/ulp/rtrs/rtrs-srv.c
> +++ b/drivers/infiniband/ulp/rtrs/rtrs-srv.c
> @@ -649,7 +649,7 @@ static int map_cont_bufs(struct rtrs_srv_sess *sess)
>                 }
>                 nr = ib_map_mr_sg(mr, sgt->sgl, sgt->nents,
>                                   NULL, max_chunk_size);
> -               if (nr < sgt->nents) {
> +               if (nr < 0 || nr < sgt->nents) {
>                         err = nr < 0 ? nr : -EINVAL;
>                         goto dereg_mr;
>                 }
> --
> 2.26.2
