Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 35E6C2D7FB1
	for <lists+kernel-janitors@lfdr.de>; Fri, 11 Dec 2020 20:52:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390525AbgLKTuf (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Fri, 11 Dec 2020 14:50:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37650 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2394411AbgLKTuU (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 11 Dec 2020 14:50:20 -0500
Received: from mail-vk1-xa44.google.com (mail-vk1-xa44.google.com [IPv6:2607:f8b0:4864:20::a44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 45453C0613CF
        for <kernel-janitors@vger.kernel.org>; Fri, 11 Dec 2020 11:49:40 -0800 (PST)
Received: by mail-vk1-xa44.google.com with SMTP id w190so2349060vkg.13
        for <kernel-janitors@vger.kernel.org>; Fri, 11 Dec 2020 11:49:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Zf6uTTAIY9G26MStfdbgptTIf5sVivxH9li5sbNjMeM=;
        b=NNb8lyO8GY6UdwDmpdFrKC1riD4dEmOguYuXybsnGceq3vIRglEIQqe25SxdtwFn9+
         xEEaqKiTR30Cg8cPzEaRLwaHg03VRRNknDHAVROxCJbci4quh4g5tuHgrcPVQ4q9r+B/
         yKM5fGHa4C+5Fod20Wcc3OdpNkckG2kOP/o4aGRVBawKWUxGI+eIWhTxjn/0T87gvCat
         +0ZbcwZAKUaKgAC/3JXlaYFlM6cY+5leDfDpxoR74Kv8Onp0rNEh4e5nJ5wqbhm5amhH
         kUKgIq43UFWp5xu/JO/K8oFqGy8NkeOpmfeNU6X0xyYyCUkIExMq2sIe4a44zVqZAtKe
         aVKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Zf6uTTAIY9G26MStfdbgptTIf5sVivxH9li5sbNjMeM=;
        b=mpzxAtlBG5FwkD2yxNsv8KnYtKXIU8Phc2OtNlAs8u5MO920VH9XNO21uV1jT3YoJD
         wVJ17w1CZA1Mp+XtpZibXA+3xHo88HzgXzct6Lxc1BWHJ7DOG01Ble0sNg92NhmmJCf1
         Sdl+s54lBg/qh59UgHBGYXjYlhyKCG5PmBI4z2Cd1l0AZcN1xhfjHMyA+7EpcwGncMef
         eiLt78V0Qr3hOrX+OLXBwK05w99w8flYx9eHwJJ97MoHWoB/8j+frJcqX86jREUdg4ck
         kww0NFXU6WCYWPFTPJlHHE92DlllsyTZIrWPGnYZ4DEhY9y+wQYqkl6kiu8hmuCKQC9v
         n4tA==
X-Gm-Message-State: AOAM530hjoRWwO4ZG887aSetkojBVSHmVyTA9wS3mewzvavuqhVWmfzj
        V9Y/yImvT/FLdL61Cp2vIDq2WRU6Mj+p5gxbdEk=
X-Google-Smtp-Source: ABdhPJzPqnOGn+hEf8rf1SrAcyvd3s4D7C/t7rnTf4FoN2TujEzSJQT1uugjLm4kHJj6CAbb26K/dAUjNQ0DBZxz398=
X-Received: by 2002:a1f:8f48:: with SMTP id r69mr15747930vkd.6.1607716179509;
 Fri, 11 Dec 2020 11:49:39 -0800 (PST)
MIME-Version: 1.0
References: <X9NGZWnZl5/Mt99R@mwanda>
In-Reply-To: <X9NGZWnZl5/Mt99R@mwanda>
From:   Souptick Joarder <jrdr.linux@gmail.com>
Date:   Sat, 12 Dec 2020 01:19:28 +0530
Message-ID: <CAFqt6zYtQ0BR_KZjJsicmmGDT1WYyYYOHqEVe1Vd5ZWLBSAVWA@mail.gmail.com>
Subject: Re: [PATCH] hugetlb: Fix an error code in hugetlb_reserve_pages()
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Mike Kravetz <mike.kravetz@oracle.com>,
        Mina Almasry <almasrymina@google.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        David Rientjes <rientjes@google.com>,
        Linux-MM <linux-mm@kvack.org>, kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hi Dan,

On Fri, Dec 11, 2020 at 3:44 PM Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> Preserve the error code from region_add() instead of returning success.
>
> Fixes: 0db9d74ed884 ("hugetlb: disable region_add file_region coalescing")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> From static analysis.  Untested.
>
>  mm/hugetlb.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/mm/hugetlb.c b/mm/hugetlb.c
> index 1f3bf1710b66..ac2e48b9f1d7 100644
> --- a/mm/hugetlb.c
> +++ b/mm/hugetlb.c
> @@ -5113,6 +5113,7 @@ int hugetlb_reserve_pages(struct inode *inode,
>
>                 if (unlikely(add < 0)) {
>                         hugetlb_acct_memory(h, -gbl_reserve);
> +                       ret = add;

This function returns int but ret is long type.
Does it need correction ?

>                         goto out_put_pages;
>                 } else if (unlikely(chg > add)) {
>                         /*
> --
> 2.29.2
>
>
