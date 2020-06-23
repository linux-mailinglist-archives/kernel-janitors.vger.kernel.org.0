Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2DCF220540E
	for <lists+kernel-janitors@lfdr.de>; Tue, 23 Jun 2020 16:02:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732732AbgFWOCo (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Tue, 23 Jun 2020 10:02:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50408 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732657AbgFWOCo (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 23 Jun 2020 10:02:44 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B1798C061755
        for <kernel-janitors@vger.kernel.org>; Tue, 23 Jun 2020 07:02:43 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id e4so23566679ljn.4
        for <kernel-janitors@vger.kernel.org>; Tue, 23 Jun 2020 07:02:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+mDKHqL9XaZmj7XcsJJwYzkkEK6i2Pe8R8fplxjQ0ik=;
        b=JvX0MDxxQ7q45iyUquGhnRAfIa6C8NJAargxgnJLVJ1QKDLMHSQdE4DHqkXQDQQvMA
         0BlItz+1HrqAU843jnYC7PfhRIxKT0JH19lnfBaqxGSiKEfVwkV0H5AeiwaryqbwipQ+
         n5g+jwL4+9Joj4DgkA5NywYvIjzDIitw+83lU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+mDKHqL9XaZmj7XcsJJwYzkkEK6i2Pe8R8fplxjQ0ik=;
        b=ilOksnto91LP4nk4Oap5phy5j1pXUMoP0Z6tgMU9qgUqnI09FwabriHk1nObhav07W
         isoZ0xsoyBwnUZb+H/Kx545R/4R12B3QuTKwiOT+9KD3mu2yadZpER2Fl6XT+T16TUC8
         EixFZ+I6Zo8xNKflkDgc/FDBEuesbyPDtcm1dHmZyJUygw3XuTcqVOyK8nDC6yLRMbMM
         X5QVQEdg/9VLjXEoUTfprDoaC7bcjLr77cxIUOJdTxc4q3roVV3u93P6VZ9lzvZvwbn9
         MmijIRzY+nOKBeYd25b/E9HQ5xXtWrhjrD7VOjz5PDZvNcpvkiFe9ryWFNXZwm9+PzbI
         5ldA==
X-Gm-Message-State: AOAM530yTFRz6P3B2p1O7//TGiKFtQU3Sjrc4esXeD5MI7Q//BNgcQrQ
        zaBuJPFdXR9H2piJlEaUHqO6KGtF+w/WBi+IqvBxdg==
X-Google-Smtp-Source: ABdhPJwkp7xO233qrwVR3p5tSB1yZTt9QFCbp0qjfLwtRcyVzpREtRGELz74ul+4qEqtniyRgrWITwvGeGjIWMKuSHU=
X-Received: by 2002:a2e:3603:: with SMTP id d3mr10508629lja.259.1592920961167;
 Tue, 23 Jun 2020 07:02:41 -0700 (PDT)
MIME-Version: 1.0
References: <20200622153546.49880-1-colin.king@canonical.com>
 <20200622182816.GF4151@kadam> <B926444035E5E2439431908E3842AFD2514C4B@DGGEMI525-MBS.china.huawei.com>
 <baf5a045-40f3-254b-fe0f-ad00cdf4b775@canonical.com>
In-Reply-To: <baf5a045-40f3-254b-fe0f-ad00cdf4b775@canonical.com>
From:   Vitaly Wool <vitaly.wool@konsulko.com>
Date:   Tue, 23 Jun 2020 16:02:29 +0200
Message-ID: <CAM4kBB+v+FJaoKx+zL3pfnV1e1pk8sVRX1=7-aq9OGdXXuBxJA@mail.gmail.com>
Subject: Re: [PATCH][next] mm/zswap: fix a couple of memory leaks and rework
 kzalloc failure check
To:     Colin Ian King <colin.king@canonical.com>
Cc:     "Song Bao Hua (Barry Song)" <song.bao.hua@hisilicon.com>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        Seth Jennings <sjenning@redhat.com>,
        Dan Streetman <ddstreet@ieee.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        "linux-mm@kvack.org" <linux-mm@kvack.org>,
        "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Tue, Jun 23, 2020, 1:12 PM Colin Ian King <colin.king@canonical.com> wrote:
>
> On 22/06/2020 20:55, Song Bao Hua (Barry Song) wrote:
> >
> >
> >> -----Original Message-----
> >> From: Dan Carpenter [mailto:dan.carpenter@oracle.com]
> >> Sent: Tuesday, June 23, 2020 6:28 AM
> >> To: Colin King <colin.king@canonical.com>
> >> Cc: Seth Jennings <sjenning@redhat.com>; Dan Streetman
> >> <ddstreet@ieee.org>; Vitaly Wool <vitaly.wool@konsulko.com>; Andrew
> >> Morton <akpm@linux-foundation.org>; Song Bao Hua (Barry Song)
> >> <song.bao.hua@hisilicon.com>; Stephen Rothwell <sfr@canb.auug.org.au>;
> >> linux-mm@kvack.org; kernel-janitors@vger.kernel.org;
> >> linux-kernel@vger.kernel.org
> >> Subject: Re: [PATCH][next] mm/zswap: fix a couple of memory leaks and
> >> rework kzalloc failure check
> >>
> >> On Mon, Jun 22, 2020 at 04:35:46PM +0100, Colin King wrote:
> >>> From: Colin Ian King <colin.king@canonical.com>
> >>>
> >>> kzalloc failures return NULL on out of memory errors, so replace the
> >>> IS_ERR_OR_NULL check with the usual null pointer check.  Fix two memory
> >>> leaks with on acomp and acomp_ctx by ensuring these objects are free'd
> >>> on the error return path.
> >>>
> >>> Addresses-Coverity: ("Resource leak")
> >>> Fixes: d4f86abd6e35 ("mm/zswap: move to use crypto_acomp API for
> >> hardware acceleration")
> >>> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> >
> >
> > Colin, thanks for your patch. I am sorry I did the same thing with you here:
> > https://lkml.org/lkml/2020/6/22/347
>
> Thanks for fixing this correctly, I ran out of time yesterday to re-do
> the fix.
>
> Colin

I think this has gotten out of hand. Barry, could you please come up
with a replacement for the initial patch rather than doing it
incrementally?

Thanks,
   Vitaly

>
> >
> >
> >>> ---
> >>>  mm/zswap.c | 16 +++++++++++-----
> >>>  1 file changed, 11 insertions(+), 5 deletions(-)
> >>>
> >>> diff --git a/mm/zswap.c b/mm/zswap.c
> >>> index 0d914ba6b4a0..14839cbac7ff 100644
> >>> --- a/mm/zswap.c
> >>> +++ b/mm/zswap.c
> >>> @@ -433,23 +433,23 @@ static int zswap_cpu_comp_prepare(unsigned int
> >> cpu, struct hlist_node *node)
> >>>             return 0;
> >>>
> >>>     acomp_ctx = kzalloc(sizeof(*acomp_ctx), GFP_KERNEL);
> >>> -   if (IS_ERR_OR_NULL(acomp_ctx)) {
> >>> +   if (!acomp_ctx) {
> >>>             pr_err("Could not initialize acomp_ctx\n");
> >>>             return -ENOMEM;
> >>>     }
> >>>     acomp = crypto_alloc_acomp(pool->tfm_name, 0, 0);
> >>> -   if (IS_ERR_OR_NULL(acomp)) {
> >>> +   if (!acomp) {
> >>
> >> This should be IS_ERR(acomp).  Please preserve the error code.
> >>
> >>>             pr_err("could not alloc crypto acomp %s : %ld\n",
> >>>                             pool->tfm_name, PTR_ERR(acomp));
> >>> -           return -ENOMEM;
> >>> +           goto free_acomp_ctx;
> >>>     }
> >>>     acomp_ctx->acomp = acomp;
> >>>
> >>>     req = acomp_request_alloc(acomp_ctx->acomp);
> >>> -   if (IS_ERR_OR_NULL(req)) {
> >>> +   if (!req) {
> >>>             pr_err("could not alloc crypto acomp %s : %ld\n",
> >>>                    pool->tfm_name, PTR_ERR(acomp));
> >>> -           return -ENOMEM;
> >>> +           goto free_acomp;
> >>>     }
> >>>     acomp_ctx->req = req;
> >>>
> >>> @@ -462,6 +462,12 @@ static int zswap_cpu_comp_prepare(unsigned int
> >> cpu, struct hlist_node *node)
> >>>     *per_cpu_ptr(pool->acomp_ctx, cpu) = acomp_ctx;
> >>>
> >>>     return 0;
> >>> +
> >>> +free_acomp:
> >>> +   kfree(acomp);
> >>
> >> The kfree() isn't correct.  It needs to be:
> >>
> >>      crypto_free_acomp(acomp);
> >>
> >>> +free_acomp_ctx:
> >>> +   kfree(acomp_ctx);
> >>> +   return -ENOMEM;
> >>
> >> regards,
> >> dan carpenter
> >
>
