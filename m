Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2A65E188BF7
	for <lists+kernel-janitors@lfdr.de>; Tue, 17 Mar 2020 18:27:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726564AbgCQR1N (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Tue, 17 Mar 2020 13:27:13 -0400
Received: from mail-vs1-f66.google.com ([209.85.217.66]:36614 "EHLO
        mail-vs1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726082AbgCQR1M (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 17 Mar 2020 13:27:12 -0400
Received: by mail-vs1-f66.google.com with SMTP id n6so14460498vsc.3
        for <kernel-janitors@vger.kernel.org>; Tue, 17 Mar 2020 10:27:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=kYxhd4YbdvKna+Hk3H++oy2r+2XxoGCrQ2OcQrBquQI=;
        b=VWLDmipX7IFDQ/yHjCAzFxlk/+VluSSJwe4qv5jpHr4e6B0U7gp1YOW3C9Csk4kZHd
         NXgx0kZ6qhPzwcHQS3y9Qvp7AMowj6bjIngubmHTjWmVhTh0fc8O7LbAKQh0NHGA4pJV
         mU73ACIJwkVyGoLSZZRtAPc2yjx+8+foKjquI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kYxhd4YbdvKna+Hk3H++oy2r+2XxoGCrQ2OcQrBquQI=;
        b=t7HaQHlOO2ql2d/lSL16DijM1Qnz190Av+GYoSYGYuDjsi+vBq2nJnjAnGwptfbYOu
         Cmvzm6r462U4GNr0tYYPfjrF9Wo515SYd191rMSm5g+4yzn8uytg8M61feexsjU2tPi5
         4FqQBdRUxyChjVZ08zNNNgekBNEzMwxGfiPfcLpC3lXnTJ2D7l33zWvPgCPjLs9Ao+oF
         i5QEtXXnqVh1vKyxsecbolth8SRWFX/9kiC/TMQtor59MNNYaPOOpK0/ZhkqXJJgY88q
         +EXA/aqxfjJczkLE/fd0q59fVuAlN5JrXT4hr6S58d+c8wUQNWdRSLE/yxHPqKc6Ro/w
         Go8Q==
X-Gm-Message-State: ANhLgQ0TayRYVdDkpqWBLNkz2q52lYs0WCnOQyH6odcvMDM4ukZzLmX8
        2K++EFbKE7icHU7rSljq17hBN7G7gp8=
X-Google-Smtp-Source: ADFU+vuJrf9z2pHxkl0cU/Ratp+qsATaHJ9ScTnLtSq2nBguAUKGNiDj+p9/8K6P74dj1zhTfDAiZw==
X-Received: by 2002:a67:ab43:: with SMTP id k3mr20338vsh.138.1584466029253;
        Tue, 17 Mar 2020 10:27:09 -0700 (PDT)
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com. [209.85.217.42])
        by smtp.gmail.com with ESMTPSA id v26sm1672721vsi.3.2020.03.17.10.27.07
        for <kernel-janitors@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Mar 2020 10:27:08 -0700 (PDT)
Received: by mail-vs1-f42.google.com with SMTP id z125so14443987vsb.13
        for <kernel-janitors@vger.kernel.org>; Tue, 17 Mar 2020 10:27:07 -0700 (PDT)
X-Received: by 2002:a67:e951:: with SMTP id p17mr22233vso.106.1584466026884;
 Tue, 17 Mar 2020 10:27:06 -0700 (PDT)
MIME-Version: 1.0
References: <20200315194239.28785-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20200315194239.28785-1-christophe.jaillet@wanadoo.fr>
From:   Doug Anderson <dianders@chromium.org>
Date:   Tue, 17 Mar 2020 10:26:55 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WrncW_y+dtXHU7Lj1J0Lh7w8Kw+d28KZF52-OMs=0pSQ@mail.gmail.com>
Message-ID: <CAD=FV=WrncW_y+dtXHU7Lj1J0Lh7w8Kw+d28KZF52-OMs=0pSQ@mail.gmail.com>
Subject: Re: [PATCH] drm/msm: Fix an error handling path 'msm_drm_init()'
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        LKML <linux-kernel@vger.kernel.org>,
        kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hi,

On Sun, Mar 15, 2020 at 12:42 PM Christophe JAILLET
<christophe.jaillet@wanadoo.fr> wrote:
>
> If this memory allocation fails, we have to go through the error handling
> path to perform some clean-up, as already done in other other paths of
> this function.
>
> Fixes: db735fc4036b ("drm/msm: Set dma maximum segment size for mdss")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
>  drivers/gpu/drm/msm/msm_drv.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)

This has already been posted as:

https://lore.kernel.org/r/20200309101410.GA18031@duo.ucw.cz
