Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7615E4EB26
	for <lists+kernel-janitors@lfdr.de>; Fri, 21 Jun 2019 16:51:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726504AbfFUOvM (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Fri, 21 Jun 2019 10:51:12 -0400
Received: from mail-oi1-f195.google.com ([209.85.167.195]:37084 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726494AbfFUOvL (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 21 Jun 2019 10:51:11 -0400
Received: by mail-oi1-f195.google.com with SMTP id t76so4850383oih.4
        for <kernel-janitors@vger.kernel.org>; Fri, 21 Jun 2019 07:51:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=MPOaRO8S8j6POsMNSOTvAi8picol4QkFsiK82NYjeMA=;
        b=RYjOHKu4v4FBjwrmpg/XxNrJWp9TG6JbyeCz1eQLWDQoOGdY/5iG65aqUI3F3KnXts
         2celWDauYGUjP7iRcdEXGRR6dI9+w4gvjojJfTAj7Ilijq64pMIXsOouT8SPWDshlgUo
         s57tD5x+JoSF8tbpkbb+vX2hBvX3BiF1lMA98=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MPOaRO8S8j6POsMNSOTvAi8picol4QkFsiK82NYjeMA=;
        b=fYCFADfZpgqlCC7ah0yL15j0mOQGQFH6S9bjAUhgAQE6Lca97REp3CVKHVaAIzDpne
         uVfKfsT4f8kIgYaZiHzDLaTcmX648O9Wlunop2nvOYadyZ7ZibfvTC57/4VX1c0SwZ12
         K5KaF5YRYL39mCPEBuDl19SDhJEUHhjqp6a+dh80+F7Hkp8pWGP3A7DxU6BtkhCxouUW
         emUWdzhDStiLxkrsfgFrU7EoGTWoLFlGFVKGon43RpoGek28v/QrN8cPU7zX8ylnMIOj
         ltKsAw0fZVAzGrGNzLOw5HIPrfhVBVju76R2miwIwMb/753iV/Vfwggy8b6yB+H/MGy6
         eDkw==
X-Gm-Message-State: APjAAAUI2QG0CjfRgx4aqtobQFFJiBQ9ZPlsDz73rx+FEguXUQojgeoC
        2RQLh71G4eM7FH+7zcwspyty3aa4Chg=
X-Google-Smtp-Source: APXvYqwtGvDqHklnqZq1admjZIeUfGMRBCAdnILpjiBeozvXD+yEo37xYdKI35CeG6IXDwJLXo5qaw==
X-Received: by 2002:aca:4d0a:: with SMTP id a10mr2824714oib.123.1561128670550;
        Fri, 21 Jun 2019 07:51:10 -0700 (PDT)
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com. [209.85.210.50])
        by smtp.gmail.com with ESMTPSA id b138sm1143140oii.7.2019.06.21.07.51.09
        for <kernel-janitors@vger.kernel.org>
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Fri, 21 Jun 2019 07:51:09 -0700 (PDT)
Received: by mail-ot1-f50.google.com with SMTP id 43so1747866otf.8
        for <kernel-janitors@vger.kernel.org>; Fri, 21 Jun 2019 07:51:09 -0700 (PDT)
X-Received: by 2002:a9d:2c41:: with SMTP id f59mr53563597otb.268.1561128669207;
 Fri, 21 Jun 2019 07:51:09 -0700 (PDT)
MIME-Version: 1.0
References: <20190621135907.112232-1-yuehaibing@huawei.com>
In-Reply-To: <20190621135907.112232-1-yuehaibing@huawei.com>
From:   Nick Crews <ncrews@chromium.org>
Date:   Fri, 21 Jun 2019 08:50:57 -0600
X-Gmail-Original-Message-ID: <CAHX4x86qUKPTkRFWvWMgTMh1VY8ogJfr55khsSJTakS0emiyFA@mail.gmail.com>
Message-ID: <CAHX4x86qUKPTkRFWvWMgTMh1VY8ogJfr55khsSJTakS0emiyFA@mail.gmail.com>
Subject: Re: [PATCH -next] platform/chrome: wilco_ec: Use kmemdup in enqueue_events()
To:     YueHaibing <yuehaibing@huawei.com>
Cc:     Benson Leung <bleung@chromium.org>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Thanks Yue, looks good to me.

Nick

On Fri, Jun 21, 2019 at 7:59 AM YueHaibing <yuehaibing@huawei.com> wrote:
>
> Use kmemdup rather than duplicating its implementation
>
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> ---
>  drivers/platform/chrome/wilco_ec/event.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/platform/chrome/wilco_ec/event.c b/drivers/platform/chrome/wilco_ec/event.c
> index c975b76e6255..70156e75047e 100644
> --- a/drivers/platform/chrome/wilco_ec/event.c
> +++ b/drivers/platform/chrome/wilco_ec/event.c
> @@ -248,10 +248,9 @@ static int enqueue_events(struct acpi_device *adev, const u8 *buf, u32 length)
>                 offset += event_size;
>
>                 /* Copy event into the queue */
> -               queue_event = kzalloc(event_size, GFP_KERNEL);
> +               queue_event = kmemdup(event, event_size, GFP_KERNEL);
>                 if (!queue_event)
>                         return -ENOMEM;
> -               memcpy(queue_event, event, event_size);
>                 event_queue_push(dev_data->events, queue_event);
>         }
>
>
>
