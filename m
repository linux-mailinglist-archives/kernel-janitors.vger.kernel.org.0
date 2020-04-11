Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E5ADF1A57E0
	for <lists+kernel-janitors@lfdr.de>; Sun, 12 Apr 2020 01:26:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730456AbgDKX0E (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Sat, 11 Apr 2020 19:26:04 -0400
Received: from mail-ed1-f68.google.com ([209.85.208.68]:36169 "EHLO
        mail-ed1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730030AbgDKXL4 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sat, 11 Apr 2020 19:11:56 -0400
Received: by mail-ed1-f68.google.com with SMTP id i7so7113380edq.3
        for <kernel-janitors@vger.kernel.org>; Sat, 11 Apr 2020 16:11:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vanguardiasur-com-ar.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=j1v+KX0c0vN9YAU7uM6QypK1ttzUW4y+OxpBn0M3m3M=;
        b=S6ObeyaX8+WvxpzJV4Jp692S50a2yGFQh+4wOaDJVvpFjCLDrfQyw1CF8MiCC/Hkoo
         Wu2yLceSH7wqAkDDS78Nm3CM0oxEYnNWKTuOzNspGDbKt70Ov+mkz08p+UqjRthkXDQe
         7g+ywrKByPcQX7Z4VirISCe93FyM5bqM/Cd59h6IO7TQQfn6Ng/bQpFzYYyC988z8brO
         WuH/iPJkS3KW0lt7gA2tvIDd86Q1P6r+mGijPNe3owwUZGobTjXFX8e6fSWQ1NTiM+AQ
         JfKFxArsy6uKqudGjR9mqyzywvRJikOWlwke+x9Hw9HGnRe5ql+mTFQAETohZEZ+DwUZ
         T40Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=j1v+KX0c0vN9YAU7uM6QypK1ttzUW4y+OxpBn0M3m3M=;
        b=Hm1wgUv3afUKJU6qw5QnHtZn5Aue8XIw9rAEbOdFJlALaLhI6cmxIZK2vDniuWx6av
         0k9ShZb4vUIyHt9ppYst4Nq4xGXXRY8QmzYEQz0M3KURKxN7nfSyKS5q36wDGP2X6vg+
         QsJGfLL5LRQM2F3gM8FKPIrkmLYAlUF6h0YHJ6rqrUcsM8hW4GjwjDLtkV/6MsvLMmXU
         /H9uPAQ/Oe8ba8HvnGeB18bPzsroHqOm5H4hUQXn3pmLWBxO7TLh261GeR0YMLHlMeBD
         sEqItWApkHzbAXjQhHjxalE2eb4QryTm/0hSsxMHeQ11TgqzCvRNggfemZc264nfGt6J
         6JsQ==
X-Gm-Message-State: AGi0PuYA4SJNaOhp6akPxcdQOjeWOYr9ST4FHqbJYFlxyd5BX0GFJd45
        yaFzcdYpQiz4gufBXtxlJZNY+f1JPsmkC/AUYErI7w==
X-Google-Smtp-Source: APiQypIQV+O4plRu4V7wCIyi5dxeIfE6EeeB3ExaZvqvAUx/G7mUWqkxg21V766Y2OZi676a3KrW4JA/WqDlJwvAoNw=
X-Received: by 2002:a17:906:2994:: with SMTP id x20mr9475367eje.156.1586646714555;
 Sat, 11 Apr 2020 16:11:54 -0700 (PDT)
MIME-Version: 1.0
References: <20200410141813.29497-1-colin.king@canonical.com>
In-Reply-To: <20200410141813.29497-1-colin.king@canonical.com>
From:   Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date:   Sat, 11 Apr 2020 20:11:43 -0300
Message-ID: <CAAEAJfB3D7KxruC2TzeEhyeF8qGHOWUa2hKmqcptub5gciSAxQ@mail.gmail.com>
Subject: Re: [PATCH] media: gspca: remove redundant assignment to variable status
To:     Colin King <colin.king@canonical.com>
Cc:     Hans Verkuil <hverkuil@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media <linux-media@vger.kernel.org>,
        kernel-janitors@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Fri, 10 Apr 2020 at 11:18, Colin King <colin.king@canonical.com> wrote:
>
> From: Colin Ian King <colin.king@canonical.com>
>
> The variable status is being assigned a value that is never read.
> The assignment is redundant and can be removed.
>
> Addresses-Coverity: ("Unused value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Reviewed-by: Ezequiel Garcia <ezequiel@collabora.com>

> ---
>  drivers/media/usb/gspca/mr97310a.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/drivers/media/usb/gspca/mr97310a.c b/drivers/media/usb/gspca/mr97310a.c
> index 502fc2eaffe0..464aa61cd914 100644
> --- a/drivers/media/usb/gspca/mr97310a.c
> +++ b/drivers/media/usb/gspca/mr97310a.c
> @@ -287,7 +287,6 @@ static int zero_the_pointer(struct gspca_dev *gspca_dev)
>                         return err_code;
>
>                 err_code = cam_get_response16(gspca_dev, 0x21, 0);
> -               status = data[0];
>                 tries++;
>                 if (err_code < 0)
>                         return err_code;
> --
> 2.25.1
>
