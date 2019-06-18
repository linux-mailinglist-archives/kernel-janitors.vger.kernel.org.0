Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0DF694A7F8
	for <lists+kernel-janitors@lfdr.de>; Tue, 18 Jun 2019 19:15:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729794AbfFRRPR (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Tue, 18 Jun 2019 13:15:17 -0400
Received: from mail-ot1-f65.google.com ([209.85.210.65]:44505 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729319AbfFRRPR (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 18 Jun 2019 13:15:17 -0400
Received: by mail-ot1-f65.google.com with SMTP id b7so15950635otl.11
        for <kernel-janitors@vger.kernel.org>; Tue, 18 Jun 2019 10:15:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xf9JaMcfMTpA+95buSp6V+RKo2piqDxI9Pf5r4xWOgw=;
        b=DQ/prbm6F/jVALB23o1UX7hNkF+klFj23vBoHAQ0naQTfSoTf2YsYc4H+xShOvuJ/I
         wii73VN4+ZQ8Sflop7Vp3eleYkzqlaMuNgBF38D3NACNU4Vk86EV5lPAaA2nA8Kq+tvG
         8lc5ZSXaDohScGj3b3YdhrjE02Cz5WEBLJZDQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xf9JaMcfMTpA+95buSp6V+RKo2piqDxI9Pf5r4xWOgw=;
        b=sYz/t0/djlUd7xbIwN91IfcQ7MERnHwhAZHYnG9L4YO6NU/v5tdjwqe4vmA1sQ/w2a
         cINR2585MzpvNICIoIUYYRsDPayB2wXgmgozBF/sZ8xHvB3UXsMPRNfBvYKKqJpPTZdY
         JfiAkZkQxBaf45ya7vjlwm3oNB2fSkfDYil2PjyzjITvZjFqSG4UqAz05PnSQPkQ/BSu
         k+o+jlzrc7NSSItBgFxEiDH2HAZzr5QF+tumrHjFf0w72lQlz+ICwGRIBdCMVEbjAl4F
         qlOwJjV85Q1V6/GARwvAGPQ9zpIjaCTG+Iag/Q0KWMmHw4/j8wofwrzm+9xYTljzeYBR
         etlg==
X-Gm-Message-State: APjAAAUnVFsr7pEuRsZeRKuL/DnZv3DcQDZSqPkjQvPc0Jyo11yYi5tO
        DR0VK735MVj+YXpvc6sSksMAbkdA53g=
X-Google-Smtp-Source: APXvYqzmoXENRcDdWyDcCdYkJ7RvOM/CLFoo2MmvX11YqGoENAOx26ByHJQh0qibjVdIegCLLe0YGA==
X-Received: by 2002:a05:6830:93:: with SMTP id a19mr5395298oto.127.1560878116230;
        Tue, 18 Jun 2019 10:15:16 -0700 (PDT)
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com. [209.85.210.42])
        by smtp.gmail.com with ESMTPSA id p13sm5694912otq.15.2019.06.18.10.15.15
        for <kernel-janitors@vger.kernel.org>
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Tue, 18 Jun 2019 10:15:15 -0700 (PDT)
Received: by mail-ot1-f42.google.com with SMTP id r21so13078384otq.6
        for <kernel-janitors@vger.kernel.org>; Tue, 18 Jun 2019 10:15:15 -0700 (PDT)
X-Received: by 2002:a9d:2c41:: with SMTP id f59mr40634751otb.268.1560878114700;
 Tue, 18 Jun 2019 10:15:14 -0700 (PDT)
MIME-Version: 1.0
References: <20190618153924.19491-1-colin.king@canonical.com>
In-Reply-To: <20190618153924.19491-1-colin.king@canonical.com>
From:   Nick Crews <ncrews@chromium.org>
Date:   Tue, 18 Jun 2019 11:15:03 -0600
X-Gmail-Original-Message-ID: <CAHX4x85sETNNS8gdQYQniCM=K35DjMjdHOihJ76pGPrAoB9gyA@mail.gmail.com>
Message-ID: <CAHX4x85sETNNS8gdQYQniCM=K35DjMjdHOihJ76pGPrAoB9gyA@mail.gmail.com>
Subject: Re: [PATCH][next] platform/chrome: wilco_ec: fix null pointer
 dereference on failed kzalloc
To:     Colin King <colin.king@canonical.com>
Cc:     Benson Leung <bleung@chromium.org>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        kernel-janitors@vger.kernel.org,
        linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Thanks Colin, good catch.

Enric, could you squash this into the real commit?

On Tue, Jun 18, 2019 at 9:39 AM Colin King <colin.king@canonical.com> wrote:
>
> From: Colin Ian King <colin.king@canonical.com>
>
> If the kzalloc of the entries queue q fails a null pointer dereference
> occurs when accessing q->capacity and q->lock.  Add a kzalloc failure
> check and handle the null return case in the calling function
> event_device_add.
>
> Addresses-Coverity: ("Dereference null return")
> Fixes: 75589e37d1dc ("platform/chrome: wilco_ec: Add circular buffer as event queue")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/platform/chrome/wilco_ec/event.c | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/platform/chrome/wilco_ec/event.c b/drivers/platform/chrome/wilco_ec/event.c
> index c975b76e6255..e251a989b152 100644
> --- a/drivers/platform/chrome/wilco_ec/event.c
> +++ b/drivers/platform/chrome/wilco_ec/event.c
> @@ -112,8 +112,11 @@ module_param(queue_size, int, 0644);
>  static struct ec_event_queue *event_queue_new(int capacity)
>  {
>         size_t entries_size = sizeof(struct ec_event *) * capacity;
> -       struct ec_event_queue *q = kzalloc(sizeof(*q) + entries_size,
> -                                          GFP_KERNEL);
> +       struct ec_event_queue *q;
> +
> +       q = kzalloc(sizeof(*q) + entries_size, GFP_KERNEL);
> +       if (!q)
> +               return NULL;
>
>         q->capacity = capacity;
>         spin_lock_init(&q->lock);
> @@ -474,6 +477,11 @@ static int event_device_add(struct acpi_device *adev)
>         /* Initialize the device data. */
>         adev->driver_data = dev_data;
>         dev_data->events = event_queue_new(queue_size);
> +       if (!dev_data->events) {
> +               kfree(dev_data);
> +               error = -ENOMEM;
> +               goto free_minor;
> +       }
>         init_waitqueue_head(&dev_data->wq);
>         dev_data->exist = true;
>         atomic_set(&dev_data->available, 1);

Signed-off-by: Nick Crews <ncrews@chromium.org>

> --
> 2.20.1
>
