Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 044ED162623
	for <lists+kernel-janitors@lfdr.de>; Tue, 18 Feb 2020 13:31:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726557AbgBRMbp (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Tue, 18 Feb 2020 07:31:45 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:47932 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726338AbgBRMbn (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 18 Feb 2020 07:31:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1582029101;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=8SlpuMhxEkNsVu++R0qzZ0u0OpROVAfPhZWy1e0dEb8=;
        b=b9jPDwNhgHW6pQ/ivHxq9yoNq13hAo72+D+SA8qy1qLfamlgHIPBKV+giAtDWszM3ozp8c
        GsVGAo4GK7mGeDCFEdiR1lc6BFqGXgemlZXLgKFB7ysLQkTffDaey+uZQrB2lhLSSzghPl
        czKAzwMySXAeXe4G4fwAWGa39fHPFoI=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-10-jRzAlt7jOwKpvSfIBzsQwQ-1; Tue, 18 Feb 2020 07:31:40 -0500
X-MC-Unique: jRzAlt7jOwKpvSfIBzsQwQ-1
Received: by mail-wr1-f72.google.com with SMTP id j4so10730476wrs.13
        for <kernel-janitors@vger.kernel.org>; Tue, 18 Feb 2020 04:31:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=8SlpuMhxEkNsVu++R0qzZ0u0OpROVAfPhZWy1e0dEb8=;
        b=dVMzcNPlkaTP7NrJnnBLClTxsbyW4eZCMZP/m+/p1Ja1NuY+YXxOtlVH85GXM1opNy
         A+813BUw3WPEAj9AlR8WSGSJY+IwBU1Rm7BC+QOiz6E++Bz5LHYXsFFun5ZkTFAQ6MAY
         nGqxAhZQ5yODk7CzE0Y2oywUM7ch+J8pR7ivIj5R4BvuYnbM63GMU4LBZEXeaCSMjdht
         yVIU0K/bqkNUaBi8VcRcgGZEEbwxnty+ug+lGusZpW+p5M+9AXmydA6mS6fgayoGyjcj
         kJqklcmtcQzE24QI1eIv/yWg2flIOMkGjNCusGZsKXlu9MxmuRwDSE4tGYVexyz6531a
         965w==
X-Gm-Message-State: APjAAAVQexHM/I5tIxx/6axt0T054r2PuvKyOOEzw2XdlDj4wyTKKtey
        Y7chglkhC/ChI0RLXz3+GumTc7+qRtse1jNhcgx4UegdCcTFGLSxLD2b9hIXf5/HLn9ErLxRt6m
        S/nZUUYuhUaNVhXUPKV68C92AyxjF
X-Received: by 2002:a5d:6151:: with SMTP id y17mr28368351wrt.110.1582029098848;
        Tue, 18 Feb 2020 04:31:38 -0800 (PST)
X-Google-Smtp-Source: APXvYqyX7L8WQTkUFJv9QhdUj6RJA4xdxAXKjDQbK3r6resoWQuxm7d2+WUtLLTRQZ1zvQ/gtSV0vQ==
X-Received: by 2002:a5d:6151:: with SMTP id y17mr28368330wrt.110.1582029098553;
        Tue, 18 Feb 2020 04:31:38 -0800 (PST)
Received: from steredhat (host209-4-dynamic.27-79-r.retail.telecomitalia.it. [79.27.4.209])
        by smtp.gmail.com with ESMTPSA id b16sm3283514wmj.39.2020.02.18.04.31.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Feb 2020 04:31:37 -0800 (PST)
Date:   Tue, 18 Feb 2020 13:31:35 +0100
From:   Stefano Garzarella <sgarzare@redhat.com>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Jens Axboe <axboe@kernel.dk>,
        Alexander Viro <viro@zeniv.linux.org.uk>,
        io-uring@vger.kernel.org, linux-fsdevel@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] io_uring: remove unnecessary NULL checks
Message-ID: <20200218123135.5iihagj3lkwx4h52@steredhat>
References: <20200217143945.ua4lawkg22ggfihr@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200217143945.ua4lawkg22ggfihr@kili.mountain>
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Mon, Feb 17, 2020 at 05:39:45PM +0300, Dan Carpenter wrote:
> The "kmsg" pointer can't be NULL and we have already dereferenced it so
> a check here would be useless.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  fs/io_uring.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/fs/io_uring.c b/fs/io_uring.c
> index 72bc378edebc..e9f339453ddb 100644
> --- a/fs/io_uring.c
> +++ b/fs/io_uring.c
> @@ -3065,7 +3065,7 @@ static int io_sendmsg(struct io_kiocb *req, struct io_kiocb **nxt,
>  			if (req->io)
>  				return -EAGAIN;
>  			if (io_alloc_async_ctx(req)) {
> -				if (kmsg && kmsg->iov != kmsg->fast_iov)
> +				if (kmsg->iov != kmsg->fast_iov)
>  					kfree(kmsg->iov);
>  				return -ENOMEM;
>  			}
> @@ -3219,7 +3219,7 @@ static int io_recvmsg(struct io_kiocb *req, struct io_kiocb **nxt,
>  			if (req->io)
>  				return -EAGAIN;
>  			if (io_alloc_async_ctx(req)) {
> -				if (kmsg && kmsg->iov != kmsg->fast_iov)
> +				if (kmsg->iov != kmsg->fast_iov)
>  					kfree(kmsg->iov);
>  				return -ENOMEM;
>  			}

Make sense.

Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>

Thanks,
Stefano

