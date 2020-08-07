Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4AAD123E51F
	for <lists+kernel-janitors@lfdr.de>; Fri,  7 Aug 2020 02:27:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726149AbgHGA1z (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Thu, 6 Aug 2020 20:27:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57494 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725947AbgHGA1y (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 6 Aug 2020 20:27:54 -0400
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com [IPv6:2607:f8b0:4864:20::742])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A0DCC061574
        for <kernel-janitors@vger.kernel.org>; Thu,  6 Aug 2020 17:27:54 -0700 (PDT)
Received: by mail-qk1-x742.google.com with SMTP id p25so307617qkp.2
        for <kernel-janitors@vger.kernel.org>; Thu, 06 Aug 2020 17:27:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=DGA8+gwrB3sAonXBmChAGNY7ZvvzV2hTqZrY8zZK8EE=;
        b=Xso+VvmrMIUE21k+VszWrrK9Wx9Dkz6fhw6UZwNM31KX0l0YZsv4hPHNk6NsBhrO4/
         EhySBd8R4ixubMzTBx47NcLptPEQcc9nhOQRSp68KR5MF7H5V+wmK/wQWIIHDavV0fkZ
         SBKvHvdritZ9w4z/GVNAyhuj5yZkOHVWHB5YiuwjLvq9gihTrGRPhgrFnz6kLD7KFFmc
         hyuKGOnA8rf9hKzlwP+5JbQlcQvsg8aQEn+cF8l1n95oGqvimoPoe8kUzqyAJdVU/T6M
         VFIfkNNn2/SGiyNeFabIps/1SCSDV1oMpNeo24un+tlqQ9PIyRVW8Wu29+Ri2l+HBok/
         n9Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DGA8+gwrB3sAonXBmChAGNY7ZvvzV2hTqZrY8zZK8EE=;
        b=JUqHt0mQmuzTpRJQlEReEO1x5201S8D1Q05fM7hx9u3HCjE1YxTxRU4JKY0ttkMd6g
         EP3LB8Vv4rPykEBuBQRb1Lob4kQLAhC/HLy6M1rIpH6zXNRMPqMcG7O7IHiWzpFIYe85
         c8QrvNzG8dSSK2Wy2b3yHt6pQzta5wEGWEDl83ROGcRaPmzyTDWo0vNOidZYSgasXPsQ
         PhESzuHLX7zOUR9bY4hGaDIxzkv745LWnlvaBS1ta0BG2v9aVMMNKZESfN2E8yY/0xog
         foWNML+1fRFxJG+haMIKZWkuqGl02GRB1zh4D9Arcpsb6caFAHgcYvTPluTuj+/Y1Uwt
         o0yQ==
X-Gm-Message-State: AOAM533Qyq7wUBTusENs4aS1wAAg3t29r/t+U5/csIBYQfZiRF6klDQB
        btYkx+jy2NhbKY9z93SPyYqAURwWiyaQTdsrZspY+w==
X-Google-Smtp-Source: ABdhPJxYSpi1BHzeBCHwCIqOzLWVTcTjGnDSiBqngNyrcb+IxPDN8WOHCv0iGeIsP7xXL3Opes7weirBZfL8IM+8VEk=
X-Received: by 2002:a37:a088:: with SMTP id j130mr11365723qke.147.1596760073565;
 Thu, 06 Aug 2020 17:27:53 -0700 (PDT)
MIME-Version: 1.0
References: <20200805112655.17696-1-colin.king@canonical.com>
In-Reply-To: <20200805112655.17696-1-colin.king@canonical.com>
From:   Hridya Valsaraju <hridya@google.com>
Date:   Thu, 6 Aug 2020 17:27:17 -0700
Message-ID: <CA+wgaPPL_sdo+fkQa3pqNmTadg9X6mfJZy5nyR5YTt4L6pHWtg@mail.gmail.com>
Subject: Re: [PATCH] staging: ion: fix spelling mistake in function name
 "detatch" -> "detach"
To:     Colin King <colin.king@canonical.com>
Cc:     Laura Abbott <labbott@redhat.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        =?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>,
        Todd Kjos <tkjos@android.com>,
        Martijn Coenen <maco@android.com>,
        Joel Fernandes <joel@joelfernandes.org>,
        Christian Brauner <christian@brauner.io>,
        Suren Baghdasaryan <surenb@google.com>,
        "open list:ANDROID DRIVERS" <devel@driverdev.osuosl.org>,
        dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
        linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Wed, Aug 5, 2020 at 4:26 AM Colin King <colin.king@canonical.com> wrote:
>
> From: Colin Ian King <colin.king@canonical.com>
>
> There is a spelling mistake in the function name ion_dma_buf_detatch.
> Fix it by removing the extraneous t.
>
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---

Thanks Colin!
Acked-by: Hridya Valsaraju <hridya@google.com>

>  drivers/staging/android/ion/ion.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/staging/android/ion/ion.c b/drivers/staging/android/ion/ion.c
> index 3c9f09506ffa..e1fe03ceb7f1 100644
> --- a/drivers/staging/android/ion/ion.c
> +++ b/drivers/staging/android/ion/ion.c
> @@ -205,8 +205,8 @@ static int ion_dma_buf_attach(struct dma_buf *dmabuf,
>         return 0;
>  }
>
> -static void ion_dma_buf_detatch(struct dma_buf *dmabuf,
> -                               struct dma_buf_attachment *attachment)
> +static void ion_dma_buf_detach(struct dma_buf *dmabuf,
> +                              struct dma_buf_attachment *attachment)
>  {
>         struct ion_dma_buf_attachment *a = attachment->priv;
>         struct ion_buffer *buffer = dmabuf->priv;
> @@ -331,7 +331,7 @@ static const struct dma_buf_ops dma_buf_ops = {
>         .mmap = ion_mmap,
>         .release = ion_dma_buf_release,
>         .attach = ion_dma_buf_attach,
> -       .detach = ion_dma_buf_detatch,
> +       .detach = ion_dma_buf_detach,
>         .begin_cpu_access = ion_dma_buf_begin_cpu_access,
>         .end_cpu_access = ion_dma_buf_end_cpu_access,
>  };
> --
> 2.27.0
>
