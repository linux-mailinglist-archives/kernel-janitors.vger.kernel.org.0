Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5FCC41A0ED7
	for <lists+kernel-janitors@lfdr.de>; Tue,  7 Apr 2020 16:04:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728997AbgDGOE4 (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Tue, 7 Apr 2020 10:04:56 -0400
Received: from mail-yb1-f193.google.com ([209.85.219.193]:39322 "EHLO
        mail-yb1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728482AbgDGOEz (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 7 Apr 2020 10:04:55 -0400
Received: by mail-yb1-f193.google.com with SMTP id h205so1875837ybg.6
        for <kernel-janitors@vger.kernel.org>; Tue, 07 Apr 2020 07:04:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qFhf4b23hAhN9ntIc8HfeFUPJ0b/AfsKkLUD8hFqeP4=;
        b=O0SSpYh51JmY8toQaX5SFfrB9lg0L8Y/2bhfTWnlOyUvQGGsFVdNSazHKHRnIWBEHp
         r0WpvQGTNDxQIC2hmLcmXQJlovxhYOjwiQBMyurDgLQFLY1n1DVxXRfoxfiLJloFPygR
         yeKJtr7VV5Z0dvbQMbt+4dAYSzumJR6NSOR0+Cde3BdisY97O7fu8cf7TyBIGbF2oj6F
         O7gks8Y1PB+ugQX1FKTTJjVnzlNyPH88BcTODrgSROeZeckX9GmAE5OB/bbNiNG6Oczh
         JZ20KkkyaDgSfphzljeaLQnfz1WkOtF1fMr9gCJag+yG9Ooha+/AV9h+QlzGgtp9hJph
         8pgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qFhf4b23hAhN9ntIc8HfeFUPJ0b/AfsKkLUD8hFqeP4=;
        b=kIrru9hblEwH0uBAbJYl0V18llmLWzazrlvJm0qKRz8UBNdLrNj1QOMnpN97QtvJCD
         Jfd0X7gS/Z0SSFp8FPBK1kMs+6ZJJmI0VPoY64IpHPyMR1S+rwGrv4r33UgLTHlKQsRX
         Y8NHmoOYjZ45uPdLN+O9xFJXkauEm89D+CTTUV2z2Io5/hmmeKKUA9LN9H1P/q7qTGyk
         vdIt5dxnvf+Uit/CFg4ATUHGCTMhHgIGr4J79QZ3TXfMPDk6R5/NkmMinF7vNdpG48Ov
         4ymt8KxK1lPykWtWuZ+Cc+s2hSXCIX9+6CvhHdSIbr4mwsncgc1AoQIBXEIq7ugDnm/8
         47ng==
X-Gm-Message-State: AGi0PuYdU5TPU7nFGYjJfcwWou2xTRioEeTB+i12KF2npeDKhuLOgf9l
        dhSxUnE7IZ34SLj68HFcdvBYS+yAiFW1TJveKjQOCw==
X-Google-Smtp-Source: APiQypIHI2YRX4VIUgbLu1rl+8KAxWSFLNj+kRo/9Tfaswt2LYjhOw7LFCwSekaiRTTUVNNFcnkPwhxribJJePrDC14=
X-Received: by 2002:a25:740d:: with SMTP id p13mr4241220ybc.277.1586268294458;
 Tue, 07 Apr 2020 07:04:54 -0700 (PDT)
MIME-Version: 1.0
References: <20200407092935.GJ68494@mwanda>
In-Reply-To: <20200407092935.GJ68494@mwanda>
From:   Guenter Roeck <groeck@google.com>
Date:   Tue, 7 Apr 2020 07:04:43 -0700
Message-ID: <CABXOdTehw76P0aTZ5CuT0E0S8qSzNbCrt5neLYM=WFE3Kxwdng@mail.gmail.com>
Subject: Re: [PATCH] platform/chrome: cros_ec_sensorhub: Off by one in cros_sensorhub_send_sample()
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Benson Leung <bleung@chromium.org>,
        Gwendal Grignou <gwendal@chromium.org>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Guenter Roeck <groeck@chromium.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Tue, Apr 7, 2020 at 2:31 AM Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> The sensorhub->push_data[] array has sensorhub->sensor_num elements.
> It's allocated in cros_ec_sensorhub_ring_add().  So the > should be >=
> to prevent a read one element beyond the end of the array.
>
> Fixes: 145d59baff59 ("platform/chrome: cros_ec_sensorhub: Add FIFO support")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Reviewed-by: Guenter Roeck <groeck@chromium.org>

> ---
>  drivers/platform/chrome/cros_ec_sensorhub_ring.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/platform/chrome/cros_ec_sensorhub_ring.c b/drivers/platform/chrome/cros_ec_sensorhub_ring.c
> index 230e6cf3da2f..85e8ba782f0c 100644
> --- a/drivers/platform/chrome/cros_ec_sensorhub_ring.c
> +++ b/drivers/platform/chrome/cros_ec_sensorhub_ring.c
> @@ -40,7 +40,7 @@ cros_sensorhub_send_sample(struct cros_ec_sensorhub *sensorhub,
>         int id = sample->sensor_id;
>         struct iio_dev *indio_dev;
>
> -       if (id > sensorhub->sensor_num)
> +       if (id >= sensorhub->sensor_num)
>                 return -EINVAL;
>
>         cb = sensorhub->push_data[id].push_data_cb;
> --
> 2.25.1
>
