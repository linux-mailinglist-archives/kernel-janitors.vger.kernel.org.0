Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 966CD154485
	for <lists+kernel-janitors@lfdr.de>; Thu,  6 Feb 2020 14:06:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727325AbgBFNGk (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Thu, 6 Feb 2020 08:06:40 -0500
Received: from mail-ua1-f68.google.com ([209.85.222.68]:41385 "EHLO
        mail-ua1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726744AbgBFNGk (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 6 Feb 2020 08:06:40 -0500
Received: by mail-ua1-f68.google.com with SMTP id f7so2209768uaa.8
        for <kernel-janitors@vger.kernel.org>; Thu, 06 Feb 2020 05:06:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zxNga9z+bqzzVroxYEdiyYn2FBBMLZCuOvPY3yafzJU=;
        b=P8XnrlpnQsgs3sznto87ELk4PCOJmkRV8oIwNvqnmXfj3Hv2Yv4JdgZcjLfj1cGtOg
         C65z/wU5y/GWSoiF550OO+pSVN8ABbqq/FyseKpMTkqEFmfu1mMvTFPPXnDEVABHhKaG
         87NKDTdAz6hnTG1ycRowpNFoDfRFM5gtkPSq6bt8ovtMcd9YWZpV3A0/qworN410DXPj
         JgUry1vmQbXudcxYIsl3wSFvf4phruxGg4E//DvMHDrs674hMqehMYRP3ZZAdO1Bk+3E
         MFkctBi5aXeN0hQpplAwosEzu6pmOZmrDrgIsGtSSUo2UuN+NzcOqEFq4Yky8jVGa2Vl
         408Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zxNga9z+bqzzVroxYEdiyYn2FBBMLZCuOvPY3yafzJU=;
        b=JSiL5DcHbL3wCMf2GR+t/tEmN/aHUC3ux41BOede1GyfgV3J/BLuL6SVIFvEfNjEzR
         LGT2CVHwM4sin5B8rgrOxP0onilk5xS1OioLyAu5pyaYG/2QyJmNpLCUmR5VKMDqaSTP
         GKTPz8GM8ylmQVNRi/ibu5wGrgcy/Wz4qEvkmjluW7riH3hmoSvwiVd48tU49fjyWoGs
         TYyGQz5Id+I6OSHSTcTKU93aXkz14fvO7gl5Ro/6q0E2hGDv0Vh+BJ2M3bAR9QxA7vm5
         Dn21VOKWAvrE5yDKwa2x+pZHqcCkwQ6HHHG/yUtMeIzO/XE2vCS2nBymZkDCTVYLI5fI
         L68Q==
X-Gm-Message-State: APjAAAWnKHJW+ypVtYnvKYNaRflzPG57XNue0iUphW+KJ9YUWwLQZb3n
        3b5QSKjQ/OaqBzlFcIioEkg6MqU3WeIMXTl1CP8=
X-Google-Smtp-Source: APXvYqyiepijoYXT0w9jOthh76NhSwBKvoO3RDIjDnpJgrONVnEegbSic/ZQrxHIRDnlt2kTh5uRvNlVc09YuGaXBMg=
X-Received: by 2002:ab0:7025:: with SMTP id u5mr1585116ual.52.1580994398017;
 Thu, 06 Feb 2020 05:06:38 -0800 (PST)
MIME-Version: 1.0
References: <20200205123217.jreendkyxulqsool@kili.mountain>
In-Reply-To: <20200205123217.jreendkyxulqsool@kili.mountain>
From:   Vaibhav Agarwal <vaibhav.sr@gmail.com>
Date:   Thu, 6 Feb 2020 18:36:01 +0530
Message-ID: <CAAs364-wmtnpfF0eQERhP5pUgRV1SCucW+hLPQgu0GKnFx982g@mail.gmail.com>
Subject: Re: [PATCH] staging: greybus: use after free in gb_audio_manager_remove_all()
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Dinko Mironov <dmironov@mm-sol.com>,
        Mark Greer <mgreer@animalcreek.com>,
        Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
        Greg Kroah-Hartman <gregkh@google.com>,
        greybus-dev@lists.linaro.org, devel@driverdev.osuosl.org,
        kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Wed, Feb 5, 2020 at 6:02 PM Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> When we call kobject_put() and it's the last reference to the kobject
> then it calls gb_audio_module_release() and frees module.  We dereference
> "module" on the next line which is a use after free.
>
> Fixes: c77f85bbc91a ("greybus: audio: Fix incorrect counting of 'ida'")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  drivers/staging/greybus/audio_manager.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/staging/greybus/audio_manager.c b/drivers/staging/greybus/audio_manager.c
> index 9b19ea9d3fa1..9a3f7c034ab4 100644
> --- a/drivers/staging/greybus/audio_manager.c
> +++ b/drivers/staging/greybus/audio_manager.c
> @@ -92,8 +92,8 @@ void gb_audio_manager_remove_all(void)
>
>         list_for_each_entry_safe(module, next, &modules_list, list) {
>                 list_del(&module->list);
> -               kobject_put(&module->kobj);
>                 ida_simple_remove(&module_id, module->id);
> +               kobject_put(&module->kobj);
>         }
>
>         is_empty = list_empty(&modules_list);
> --
> 2.11.0
>
Thanks Dan for sharing the fix.

Reviewed-by: Vaibhav Agarwal <vaibhav.sr@gmail.com>
