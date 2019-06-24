Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DD1AD5048B
	for <lists+kernel-janitors@lfdr.de>; Mon, 24 Jun 2019 10:28:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727135AbfFXI2W (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Mon, 24 Jun 2019 04:28:22 -0400
Received: from mail-ot1-f66.google.com ([209.85.210.66]:37885 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726331AbfFXI2W (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 24 Jun 2019 04:28:22 -0400
Received: by mail-ot1-f66.google.com with SMTP id s20so12684741otp.4
        for <kernel-janitors@vger.kernel.org>; Mon, 24 Jun 2019 01:28:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=aOYWBoaLwTAQVgKv1wpzsu0smLvbq1hrhMNb9sUg/Dc=;
        b=ZxUTj92wU6U7njtskwtF0VBplk2QFyERO4znO5hRAes3vk4U/+ZAR+RJoRI+jrwN6f
         7tmfntz4sq7tD1SFggGDPT70Ui51nofjKjjXjWyCwyLjf+dZhPH22btOlR88Sjqy4LAW
         3DgcApR0/zJi1WrAyf0SJQ/+G0+Z41ZCo3iUAbSVcGOVdQh/HcHuGrLQesvovM8/ZyYl
         Jy7mpeVwOuTOidxAk1YV81iPgk3Lu/wtEDPmouMz44bbvMZTOKCyJW1QIBRBvQoiX4LC
         IaESNxSDO1uDQsTqHGAmjtb/KWbrJ/vLxOmNolvST1XHvC4oRiBPBO/mZralck9/ffGP
         No2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=aOYWBoaLwTAQVgKv1wpzsu0smLvbq1hrhMNb9sUg/Dc=;
        b=g6EOIHh0l3PX9oC+5gWehHbW273TAUVkMz3zBwNLFIOfEWK0SnJTUM0SQcc+j7dJiX
         sdB/F3y3OdmdlQHD9W2axzXLp9n4EzQAtPJ1KAbfvAqBPKXv+0T4Iw6wbunbo1NCdEHh
         ok9iEk2X+XrSNmJakbWrDgaehoJk6Z7oieOXWVPyKDzCPfswSYbVXCxo8NC9DZEb7ele
         8+Wn1HDYNk/SNiPy5BKm1XxIZJlkf0H6L4TpYSEfDp31xdNB38/xmrbFo8UJIfBIqlAD
         G6vd/2B7ceTvUMK8PxqKpG+9MFQHLAU4gbFZxUP69f/nivUsOn6b8AlbPKRD67jAOrpR
         2aGQ==
X-Gm-Message-State: APjAAAX9goF4Jey9tj+6iuulN6Iq/lcmNZvDPiF46NeqhsP054l5Nn2o
        ekclnEsIe2LXCvtVhkhXUF0PtGEbqbNyzDJf9UgDKw==
X-Google-Smtp-Source: APXvYqxcbcfSBUXbkJ1410ov+h25xcs0mRqAI79f3B02ZRT3jscAE0QqdTlHmovtNMgUL2grby+vNCzzhAfvaGQ0J48=
X-Received: by 2002:a05:6830:1681:: with SMTP id k1mr66217365otr.256.1561364901506;
 Mon, 24 Jun 2019 01:28:21 -0700 (PDT)
MIME-Version: 1.0
References: <20190617113109.24689-1-colin.king@canonical.com>
In-Reply-To: <20190617113109.24689-1-colin.king@canonical.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Mon, 24 Jun 2019 10:28:10 +0200
Message-ID: <CAMpxmJVxg2+2mdAQDSo5LTq=w7+ccXnwRmK+iz=4zkNhepE6pQ@mail.gmail.com>
Subject: Re: [PATCH][next] clocksource: davinci-timer: fix memory leak of
 clockevent on error return
To:     Colin King <colin.king@canonical.com>
Cc:     Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        kernel-janitors@vger.kernel.org,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

pon., 17 cze 2019 o 13:31 Colin King <colin.king@canonical.com> napisa=C5=
=82(a):
>
> From: Colin Ian King <colin.king@canonical.com>
>
> Currently when the call to request_irq falls there is a memory leak of
> clockevent on the error return path. Fix this by kfree'ing clockevent.
>
> Addresses-Coverity: ("Resource leak")
> Fixes: fe3b8194f274 ("clocksource: davinci-timer: add support for clockev=
ents")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/clocksource/timer-davinci.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/clocksource/timer-davinci.c b/drivers/clocksource/ti=
mer-davinci.c
> index a9ca02390b66..8512f12e250a 100644
> --- a/drivers/clocksource/timer-davinci.c
> +++ b/drivers/clocksource/timer-davinci.c
> @@ -300,6 +300,7 @@ int __init davinci_timer_register(struct clk *clk,
>                          "clockevent/tim12", clockevent);
>         if (rv) {
>                 pr_err("Unable to request the clockevent interrupt");
> +               kfree(clockevent);
>                 return rv;
>         }
>
> --
> 2.20.1
>

Hi Colin,

I omitted the error checking in this driver on purpose - it doesn't
make sense as the system won't boot without a timer.

Bart
