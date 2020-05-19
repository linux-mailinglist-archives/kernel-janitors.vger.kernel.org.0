Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E97871D96B4
	for <lists+kernel-janitors@lfdr.de>; Tue, 19 May 2020 14:52:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728892AbgESMwS (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Tue, 19 May 2020 08:52:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41438 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728890AbgESMwS (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 19 May 2020 08:52:18 -0400
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com [IPv6:2a00:1450:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DBBFBC08C5C1
        for <kernel-janitors@vger.kernel.org>; Tue, 19 May 2020 05:52:17 -0700 (PDT)
Received: by mail-ej1-x641.google.com with SMTP id a2so2066090ejb.10
        for <kernel-janitors@vger.kernel.org>; Tue, 19 May 2020 05:52:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.ionos.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wIcUZ7C1LAKSWsRdI2jG1Nd5S0BLUFvQTt1XC6fwVts=;
        b=QbdXq0appwo/j1PlYPVCPxYVoISJhJsk9eUpbLKaNo7YVMRhCKRTMEGFrz6QOzWbAV
         tj1GhYsh1Wgc3/AG2SSdCJayDNUZ0nhesi6wY1STKwT6/tFEpMkej41KXDs1oXMLeSL8
         Fuv5EQnbyQk2ZoMorDo8P1gVaHoYCD8IjyEr3rrhtrDQ2mA2zzRFNk7PfM7SG08eo2Cr
         eI5ugl0o5u4bELeY6dGUESXTiy7fE6j28qy6j9TvedWEwZL5/KzwUsTUee/3BrJIqO51
         MM53GI7qrgEpB2nAOZL4SPO7ZLrljX649xBNQgvPck6n6poDnIUVsY33Vpvt1f0sLPTv
         U1Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wIcUZ7C1LAKSWsRdI2jG1Nd5S0BLUFvQTt1XC6fwVts=;
        b=QmrPx4p0+asGYtMWw8/a8l3jjCxR/jQ/Pf65654zg7N08okrfHZQuxIICDJPvKCm3D
         rBOlM/EsrJee4uEfUtPEeekyXBERZAJRHjtWc+LOyHrqXhNM6cQ8EzeEqkEeV8iaRLg/
         WKW9z1Knuw02xiLYVIyKjpaTambeDfNPMPWH0mijgJDHOCRRCba5rX6qcKnjiSccNSUs
         5wgj129/yh52K5Z2Mtv5IBsoVGC8jDurtBbXobMWXQyZlzHlXyWMq2aPKQSTD4JfCiRW
         WjU+EClMJnjnK7NTzpO6p0qGZ+wQo2gNYqB9fdIlV0ItD+thixUrl73yFNkdpRXKQA7M
         VkEQ==
X-Gm-Message-State: AOAM5339f9ktVpTYPe+GaFOyGz6MxRrJDDX8XuUiJduVIt0PyUMuhsLn
        +vDS50zn3qGkLEV6Ivcztr9GG8sQ1E+/x3ahfgePdw==
X-Google-Smtp-Source: ABdhPJxDx02vXloAFzBCWin/oX5yz6dLwo2wJ80DWwFZ4BcIRLDv2NgAReklr3J3HAkzBxEIRAnsFN23uVshcjmSQjE=
X-Received: by 2002:a17:906:7016:: with SMTP id n22mr497264ejj.389.1589892736356;
 Tue, 19 May 2020 05:52:16 -0700 (PDT)
MIME-Version: 1.0
References: <20200519120347.GD42765@mwanda>
In-Reply-To: <20200519120347.GD42765@mwanda>
From:   Jinpu Wang <jinpu.wang@cloud.ionos.com>
Date:   Tue, 19 May 2020 14:52:05 +0200
Message-ID: <CAMGffEnuk2WfWmwjKy_Sqcuf_xKwzrPpE_o8j3nHM30ADr8HVw@mail.gmail.com>
Subject: Re: [PATCH] block/rnbd: Fix an IS_ERR() vs NULL check in find_or_create_sess()
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Danil Kipnis <danil.kipnis@cloud.ionos.com>,
        Jens Axboe <axboe@kernel.dk>, Jason Gunthorpe <jgg@ziepe.ca>,
        Bart Van Assche <bvanassche@acm.org>,
        linux-block@vger.kernel.org, kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Tue, May 19, 2020 at 2:04 PM Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> The alloc_sess() function returns error pointers, it never returns NULL.
>
> Fixes: f7a7a5c228d4 ("block/rnbd: client: main functionality")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
Thanks Dan,
Reviewed-by: Jack Wang <jinpu.wang@cloud.ionos.com>

> ---
>  drivers/block/rnbd/rnbd-clt.c | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/block/rnbd/rnbd-clt.c b/drivers/block/rnbd/rnbd-clt.c
> index 55bff3b1be71..a033247281da 100644
> --- a/drivers/block/rnbd/rnbd-clt.c
> +++ b/drivers/block/rnbd/rnbd-clt.c
> @@ -923,13 +923,12 @@ rnbd_clt_session *find_or_create_sess(const char *sessname, bool *first)
>         sess = __find_and_get_sess(sessname);
>         if (!sess) {
>                 sess = alloc_sess(sessname);
> -               if (sess) {
> -                       list_add(&sess->list, &sess_list);
> -                       *first = true;
> -               } else {
> +               if (IS_ERR(sess)) {
>                         mutex_unlock(&sess_lock);
> -                       return ERR_PTR(-ENOMEM);
> +                       return sess;
>                 }
> +               list_add(&sess->list, &sess_list);
> +               *first = true;
>         } else
>                 *first = false;
>         mutex_unlock(&sess_lock);
> --
> 2.26.2
>
