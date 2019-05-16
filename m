Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 609F020C8B
	for <lists+kernel-janitors@lfdr.de>; Thu, 16 May 2019 18:06:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726761AbfEPQGn (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Thu, 16 May 2019 12:06:43 -0400
Received: from mail-yb1-f195.google.com ([209.85.219.195]:46802 "EHLO
        mail-yb1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726380AbfEPQGm (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 16 May 2019 12:06:42 -0400
Received: by mail-yb1-f195.google.com with SMTP id z22so793453ybi.13
        for <kernel-janitors@vger.kernel.org>; Thu, 16 May 2019 09:06:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=omnibond-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=CHWyz1LU+xHA4Q1ska4TffuV2AfB2TvrKTO3gR0GbGE=;
        b=Y0mXezBZVxIxseokZsbxqalDY+MaBWbgOOboidAQf5Pma6GdOx6ZZxVHR30++t/Y7q
         P4kua8WZMlbWVIE1t/ywUPS4L/qmMs+NyeEkbC5QIECT0cXdsBYd+UxeuKIbXXG6cx+1
         GY+oD0njrg6/P9nBGOCHBvBWGQRZfp5OOeFqsacn0cJDfuCyPZFJ3UECh54jrCIETv2A
         ebwlOHH7So5wen48Z0j33UczjRMSJT+kNffsRx55e6kC/3la9syO+SwhKOvdhx2DrBqo
         x1GWHEYxpzdmhD2PZmvHYLIkmozTXQny5F7/UQOE1XrIru48Nw44/P9PWTS4gBKhljp5
         3dsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=CHWyz1LU+xHA4Q1ska4TffuV2AfB2TvrKTO3gR0GbGE=;
        b=PiNrkV4HNtA4HSBGzTL1XvvmDMdJ+ytzOwV9rZZL2VYv1tBQqkhnAtDV1RFtmy87ny
         I4cF6eAUqgs574imzUDCgoEiN/RaZbOZcHmnujUXpCNog7g1LIyNGuUAmiDz3HsT4QcR
         eSnrYVHT8dXaoq9/QposQYxH81kYs78t/YU7c+rJEWs/wqgTUhGgZ0DtweV877A41eQn
         46Kt0s1IZcCJHQLvmJZbFdfqGqWXJrT4lXdxhIMrU+usjwXZAhq4Muno0bzy9FfDm61b
         ZSfbZf9BlgaRQz6NAdO1Bmhj/PZfZJ+/w8cY274w/WMGtbDSCO50vE4WopzTPAVqVfrO
         r/PA==
X-Gm-Message-State: APjAAAXpeEbhU5uP+BUpB0K8X6AJDHQ2CeCgpZzoDOcmpH5eYM0IBjaX
        w1qs3vAS/g+TvC209eB6rcxRiSRkXi6+1a5Ie83tFiEZ
X-Google-Smtp-Source: APXvYqwTwUep44gjhL50pdhBMWRKO6w6XgfCToc9A83ssp6llyoXZB/UrsVDxWm82O0MyBEOv0DQEWDkOmlNKpI2j8A=
X-Received: by 2002:a25:26c7:: with SMTP id m190mr22880219ybm.486.1558022802021;
 Thu, 16 May 2019 09:06:42 -0700 (PDT)
MIME-Version: 1.0
References: <20190511132700.4862-1-colin.king@canonical.com>
In-Reply-To: <20190511132700.4862-1-colin.king@canonical.com>
From:   Mike Marshall <hubcap@omnibond.com>
Date:   Thu, 16 May 2019 12:06:31 -0400
Message-ID: <CAOg9mSQt42NQu-3nwZOCGOPx45y7G8aaiDaVe4SwotGnD9iY1A@mail.gmail.com>
Subject: Re: [PATCH] orangefs: remove redundant assignment to variable buffer_index
To:     Colin King <colin.king@canonical.com>
Cc:     Martin Brandenburg <martin@omnibond.com>, devel@lists.orangefs.org,
        kernel-janitors@vger.kernel.org,
        LKML <linux-kernel@vger.kernel.org>,
        Mike Marshall <hubcap@omnibond.com>
Content-Type: text/plain; charset="UTF-8"
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hi Colin...

Thanks for the patch. Before I initialized buffer_index, Dan Williams sent
in a warning that a particular error path could try to use ibuffer_index
uninitialized. I could induce the problem he described with one
of the xfstests resulting in a crashed kernel. I will try to refactor
the code to fix the problem some other way than initializing
buffer_index in the declaration.

-Mike

On Sat, May 11, 2019 at 9:27 AM Colin King <colin.king@canonical.com> wrote:
>
> From: Colin Ian King <colin.king@canonical.com>
>
> The variable buffer_index is being initialized however this is never
> read and later it is being reassigned to a new value. The initialization
> is redundant and hence can be removed.
>
> Addresses-Coverity: ("Unused Value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  fs/orangefs/file.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/fs/orangefs/file.c b/fs/orangefs/file.c
> index a35c17017210..80f06ee794c5 100644
> --- a/fs/orangefs/file.c
> +++ b/fs/orangefs/file.c
> @@ -52,7 +52,7 @@ ssize_t wait_for_direct_io(enum ORANGEFS_io_type type, struct inode *inode,
>         struct orangefs_inode_s *orangefs_inode = ORANGEFS_I(inode);
>         struct orangefs_khandle *handle = &orangefs_inode->refn.khandle;
>         struct orangefs_kernel_op_s *new_op = NULL;
> -       int buffer_index = -1;
> +       int buffer_index;
>         ssize_t ret;
>         size_t copy_amount;
>
> --
> 2.20.1
>
