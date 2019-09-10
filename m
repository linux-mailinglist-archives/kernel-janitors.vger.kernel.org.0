Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 17AB3AF017
	for <lists+kernel-janitors@lfdr.de>; Tue, 10 Sep 2019 19:02:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2436925AbfIJRCg (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Tue, 10 Sep 2019 13:02:36 -0400
Received: from mail-io1-f68.google.com ([209.85.166.68]:34288 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2436869AbfIJRCg (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 10 Sep 2019 13:02:36 -0400
Received: by mail-io1-f68.google.com with SMTP id k13so23961740ioj.1
        for <kernel-janitors@vger.kernel.org>; Tue, 10 Sep 2019 10:02:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=yHtCrm1vpXjKX4N1mnKNL5adU51DyAdSJlvxQv4V/NA=;
        b=jyrVkq/p5eQw4U+Mv8R/PTxlwrcoanUBD8qToBzvsm7AsDl6twYT9p4XWSZqJDNJ5p
         3VKo9ciCZHcmDF6KsWFpou1Ua10XLcrP1Lp0lYi5VwMKg9cf+5CHWorgM+lESrxz2jNl
         Q2vFyKqMjsqOEu06rZLI4vLvl9zU55j+RNlEkJf4oec3Qu8wgz95GMGcXoPOXgEmyQE+
         ovx2uST1e/+ZPGFjUZ72npKnofo3cQ/dj0PFpjC50V9PbhP8Xi3gfea+Swci9+6xPFUR
         Y/sC1rQpfHyWlpjKA5BDYVbt45e198hyp1rkKgkfQhot2HX0Z33FVRBIVG0qc3gP3Fxz
         v/xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=yHtCrm1vpXjKX4N1mnKNL5adU51DyAdSJlvxQv4V/NA=;
        b=d/c44Qml4jZPzEK8GrqORk7ad4or6aa6cL3dg1BXjDwA8anJJEgnSqoObnktJbE4DJ
         5CfVhxoHv8mh9RoIttyoLB4G8ydzEDayY1IVy0LjVYDGR48MFx3iwwivtbNOlAJslpZV
         GT/V5K0DHW3SxZMl0xAqrsEE0fQL2n0ThGczr3nBca3qNz/ofV+qEw/L3Ahr8HYt8dfB
         FMZUTcn8IKqrKAr7SkYVDc54EtxtNwbFqvNXVsQ795UBhedsb4PqIBdh3uJM/vSKhEdw
         JB+PUznjEFNUGHvLj6sM/GLUuLJn3EUwoU6yDnxuvOkZid0IfcBZFwTUtbgh6Nf+7pFc
         y63w==
X-Gm-Message-State: APjAAAVEFW8xRMkrhWoqkbRNkT7Glpy8GbYhCm62grqP54gqgDx4X1QZ
        6axD7b1xIVQKO+A8/U657u9pjwImeaDnv8AgWl2dm5b92CIemzYj
X-Google-Smtp-Source: APXvYqyrjjhYX1ifjAiN3g+ZP7Erd1VsBjPued7BNbEEL3rXO5YRWzGhAKzH27PO0NALlFJOKcpub1H1J61YN4gV0KI=
X-Received: by 2002:a6b:ac85:: with SMTP id v127mr4880488ioe.97.1568134955308;
 Tue, 10 Sep 2019 10:02:35 -0700 (PDT)
MIME-Version: 1.0
References: <20190818185349.15275-1-colin.king@canonical.com>
In-Reply-To: <20190818185349.15275-1-colin.king@canonical.com>
From:   Jon Mason <jdmason@kudzu.us>
Date:   Tue, 10 Sep 2019 18:02:27 +0100
Message-ID: <CAPoiz9z-e_oK2urbkWcoa2qqybAFbR54SR7gGzU1EA19zrxc=A@mail.gmail.com>
Subject: Re: [PATCH] NTB: ntb_transport: remove redundant assignment to rc
To:     Colin King <colin.king@canonical.com>
Cc:     Dave Jiang <dave.jiang@intel.com>, Allen Hubbe <allenbh@gmail.com>,
        linux-ntb <linux-ntb@googlegroups.com>,
        kernel-janitors@vger.kernel.org,
        linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Sun, Aug 18, 2019 at 7:53 PM Colin King <colin.king@canonical.com> wrote:
>
> From: Colin Ian King <colin.king@canonical.com>
>
> Variable rc is initialized to a value that is never read and it
> is re-assigned later. The initialization is redundant and can be
> removed.

Applied to ntb-next, thanks

> Addresses-Coverity: ("Unused value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/ntb/ntb_transport.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/ntb/ntb_transport.c b/drivers/ntb/ntb_transport.c
> index 40c90ca10729..00a5d5764993 100644
> --- a/drivers/ntb/ntb_transport.c
> +++ b/drivers/ntb/ntb_transport.c
> @@ -292,7 +292,7 @@ static int ntb_transport_bus_match(struct device *dev,
>  static int ntb_transport_bus_probe(struct device *dev)
>  {
>         const struct ntb_transport_client *client;
> -       int rc = -EINVAL;
> +       int rc;
>
>         get_device(dev);
>
> --
> 2.20.1
>
