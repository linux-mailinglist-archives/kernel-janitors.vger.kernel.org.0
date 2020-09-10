Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A561F265383
	for <lists+kernel-janitors@lfdr.de>; Thu, 10 Sep 2020 23:36:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728186AbgIJVgq (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Thu, 10 Sep 2020 17:36:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38102 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726539AbgIJVgC (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 10 Sep 2020 17:36:02 -0400
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com [IPv6:2a00:1450:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 28357C061756
        for <kernel-janitors@vger.kernel.org>; Thu, 10 Sep 2020 14:35:55 -0700 (PDT)
Received: by mail-ej1-x642.google.com with SMTP id nw23so10896567ejb.4
        for <kernel-janitors@vger.kernel.org>; Thu, 10 Sep 2020 14:35:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=VdtUto+8UVa+utOykTSZtVbT+HAuZQ1RHs3Ji6ziDM4=;
        b=J6v0x4H4AlS7GM1DTSncQeQVHo5LjwGEVBL75InjolvlYUGtT6xNx3thTQr6DuaMag
         hvMHqqsGaDS+Wgewib+ZgUzn1JVPSEgcvR/udk0buWBUATjUrNO3lT6LFPlqY38aJlSI
         5mSssQKop+Zk01z+f+9O8RCG38FSgXlXy7vODJlwioZoxe353iaVptkoHs2fupw7krbX
         rDgV71uRspd5Gl6rsEfYHYC12ilu7s96YIjrRANdkgEPoPYhC6sBd+/I0I897IpolfWm
         pJPEm46EuUvdtcWzKs1Ql1EMLXtB7jpXROwgWbMQW5jg8OBkJY6aq3HErBL8wGGcUArY
         HWKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VdtUto+8UVa+utOykTSZtVbT+HAuZQ1RHs3Ji6ziDM4=;
        b=kSMy4dcHhC34ckKVfaMfnCV6naGPvMj64gJzVWRNmjCgUbk/5ttqoSbWfKcP3cTfQN
         Je/zPG6TJMvGhfnCFApyjNrgV4wXGpM5v5BMYDKyVHnRfLX3pkEOhp3ghmwwu5xj6xCt
         I6bL5/mVv+zc6uUYXqe3gUGS9IXUGmjxmr5105dPvnS6KmeGzmg65g0rLWriWZFR6rzy
         +3g4+uYBPFuxcmPvx0EDRPMv5H1NM6ZUmW2AXfLcR/pWUzlffyEULZ/X+66kaKfJbbM0
         DxB7z702sryZj5Af4T8DuEoKzVTmWyLC0cD9fvn7bv62FyAYE7b7CRKj/4B1mJ9Xwy18
         /iow==
X-Gm-Message-State: AOAM532HtIb6GFYVaZ08BM1Y6h0QMhG9ndMXm4S7AXeG4qHytE1jpxoC
        kOua4hW9hYmkbD2WXaiQwib8yjZKOh0kootL7vCw+Q==
X-Google-Smtp-Source: ABdhPJy1Ak3QJSIu8NxHxo3J0ITswUZlpAfKZRfg4oOneT5cmIRFzUVld6KFQE599iv5QEcUkm3ey9iJMOG4Q5PIaIY=
X-Received: by 2002:a17:906:b156:: with SMTP id bt22mr10802676ejb.481.1599773754039;
 Thu, 10 Sep 2020 14:35:54 -0700 (PDT)
MIME-Version: 1.0
References: <20200910151221.751464-1-colin.king@canonical.com>
In-Reply-To: <20200910151221.751464-1-colin.king@canonical.com>
From:   Todd Kjos <tkjos@google.com>
Date:   Thu, 10 Sep 2020 14:35:41 -0700
Message-ID: <CAHRSSEzAtyDpR6xRVXyaDzDyBV3CvyiezSSK4hGU9BdbvJYiHQ@mail.gmail.com>
Subject: Re: [PATCH][next] binder: remove redundant assignment to pointer n
To:     Colin King <colin.king@canonical.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        =?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>,
        Todd Kjos <tkjos@android.com>,
        Martijn Coenen <maco@android.com>,
        Joel Fernandes <joel@joelfernandes.org>,
        Christian Brauner <christian@brauner.io>,
        Hridya Valsaraju <hridya@google.com>,
        Suren Baghdasaryan <surenb@google.com>,
        "open list:ANDROID DRIVERS" <devel@driverdev.osuosl.org>,
        kernel-janitors@vger.kernel.org,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Thu, Sep 10, 2020 at 8:12 AM Colin King <colin.king@canonical.com> wrote:
>
> From: Colin Ian King <colin.king@canonical.com>
>
> The pointer n is being initialized with a value that is
> never read and it is being updated later with a new value. The
> initialization is redundant and can be removed.
>
> Addresses-Coverity: ("Unused value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Acked-by: Todd Kjos <tkjos@google.com>

> ---
>  drivers/android/binder_alloc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/android/binder_alloc.c b/drivers/android/binder_alloc.c
> index 910c53ba2c91..2f846b7ae8b8 100644
> --- a/drivers/android/binder_alloc.c
> +++ b/drivers/android/binder_alloc.c
> @@ -347,7 +347,7 @@ static void debug_low_async_space_locked(struct binder_alloc *alloc, int pid)
>          * and at some point we'll catch them in the act. This is more efficient
>          * than keeping a map per pid.
>          */
> -       struct rb_node *n = alloc->free_buffers.rb_node;
> +       struct rb_node *n;
>         struct binder_buffer *buffer;
>         size_t total_alloc_size = 0;
>         size_t num_buffers = 0;
> --
> 2.27.0
>
