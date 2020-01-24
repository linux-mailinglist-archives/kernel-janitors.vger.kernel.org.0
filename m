Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D6F62148EAC
	for <lists+kernel-janitors@lfdr.de>; Fri, 24 Jan 2020 20:24:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391783AbgAXTYi (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Fri, 24 Jan 2020 14:24:38 -0500
Received: from mail-il1-f196.google.com ([209.85.166.196]:36433 "EHLO
        mail-il1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389871AbgAXTYh (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 24 Jan 2020 14:24:37 -0500
Received: by mail-il1-f196.google.com with SMTP id b15so2506008iln.3
        for <kernel-janitors@vger.kernel.org>; Fri, 24 Jan 2020 11:24:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.ionos.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zTrhZTWTBa6fbnuanJX9UETavS1HBvI+zV8WEYtCar4=;
        b=WxKKIIml4Ui5ytxZYSYxc5mWUe2jiNCMFWp9WRNlNHm9byXQ4jO9tXIdnU98JOyeSf
         zMcvd+f18CJKEOcPStuvL5N6sOEoFTzuREXpJwPJjzZQi0W3GpXVsRH6kWZaYF+NvW/1
         ATH3Qv7ZH6hG0NxOEJGdjVQyJ+noXMSYeY3OIq5nrk0QIR/sPKWzIbBZu9hK4NP8CFtx
         sJLuPDhBAOfga+YrpC6XBzcS7HoCT/At5VQrxHLbJNFk9u7q6/SNrZ4ulujm2xbT1hSD
         h0JplRXR5w/wVU59hXvKU+70c5A0uKaLyXzf9lu56ICNKCLZd/zYV6X044DSR/HSWYiV
         VOpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zTrhZTWTBa6fbnuanJX9UETavS1HBvI+zV8WEYtCar4=;
        b=B6FZwgAO12UlKBAM3VXN35ZboA2mjzf5QrpoVw/zOCYlKe8XfiATrboIRv5aeG2KE7
         uxzUQKomm/Tnmw116zw4QTAqG2jRayjB2gkMq8HPuP7xFD9ZlfCAqWnO/TINYykFEolX
         Ne+oHg9xNn2RiUgoZFbumcNSp1PnsS1y94UcGOot2F9Uj7zKuhW66syrNzj4+LFAU4PT
         Fud2EX+iJZmG6k9rx52ESIp7Q9xaCtcFLJXZtodFNp7QWv6ru52rQQv/dqR17kG9KkUj
         pyYkGt2TOFmj4FaE8ujVC9NNw9QHMIPeXh2gyms7A6jAs6tC3gj2UphYLx1Omb3R1V2z
         99YA==
X-Gm-Message-State: APjAAAVkwCDszi3rvGkMWy2SQ/r9zWiRTfVTgZW9Wa66o7t7qFcCzR9k
        vp9YCagHLD4K2ZWNjTE01bBzkKOho+da7L7LhZNnrQ==
X-Google-Smtp-Source: APXvYqxu3gXyV2O9AvGS2dPitr9zp0vFAbhvXmnKMEXqes1zfto3DseyBApJ2k7vkTKq+SI6psjzJkriamJ/KMjw/Oo=
X-Received: by 2002:a92:d2:: with SMTP id 201mr4689380ila.22.1579893877312;
 Fri, 24 Jan 2020 11:24:37 -0800 (PST)
MIME-Version: 1.0
References: <20200123005706.2834281-1-colin.king@canonical.com>
In-Reply-To: <20200123005706.2834281-1-colin.king@canonical.com>
From:   Jinpu Wang <jinpu.wang@cloud.ionos.com>
Date:   Fri, 24 Jan 2020 20:24:28 +0100
Message-ID: <CAMGffEmhGxasQ=-S4akOLnDvVBpY1e42R=pvaFqKTH0R+TM-6w@mail.gmail.com>
Subject: Re: [PATCH] scsi: pm80xx: fix spelling mistake "to" -> "too"
To:     Colin King <colin.king@canonical.com>
Cc:     "James E . J . Bottomley" <jejb@linux.ibm.com>,
        "Martin K . Petersen" <martin.petersen@oracle.com>,
        Linux SCSI Mailinglist <linux-scsi@vger.kernel.org>,
        kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Thu, Jan 23, 2020 at 1:57 AM Colin King <colin.king@canonical.com> wrote:
>
> From: Colin Ian King <colin.king@canonical.com>
>
> There is a spelling mistake in a pm8001_printk message. Fix it.
>
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
Acked-by: Jack Wang <jinpu.wang@cloud.ionos.com>

Thanks Colin.
> ---
>  drivers/scsi/pm8001/pm80xx_hwi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/scsi/pm8001/pm80xx_hwi.c b/drivers/scsi/pm8001/pm80xx_hwi.c
> index 98dcdbd146d5..d1d95f1a2c6a 100644
> --- a/drivers/scsi/pm8001/pm80xx_hwi.c
> +++ b/drivers/scsi/pm8001/pm80xx_hwi.c
> @@ -2377,7 +2377,7 @@ mpi_sata_completion(struct pm8001_hba_info *pm8001_ha, void *piomb)
>                                 ts->buf_valid_size = sizeof(*resp);
>                         } else
>                                 PM8001_IO_DBG(pm8001_ha,
> -                                       pm8001_printk("response to large\n"));
> +                                       pm8001_printk("response too large\n"));
>                 }
>                 if (pm8001_dev)
>                         pm8001_dev->running_req--;
> --
> 2.24.0
>
