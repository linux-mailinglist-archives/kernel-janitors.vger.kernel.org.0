Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9942F133B3
	for <lists+kernel-janitors@lfdr.de>; Fri,  3 May 2019 20:45:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726531AbfECSpU (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Fri, 3 May 2019 14:45:20 -0400
Received: from mail-ot1-f65.google.com ([209.85.210.65]:34680 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725997AbfECSpU (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 3 May 2019 14:45:20 -0400
Received: by mail-ot1-f65.google.com with SMTP id n15so6225775ota.1
        for <kernel-janitors@vger.kernel.org>; Fri, 03 May 2019 11:45:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QFIm1hDHtUjLdOYqNjnkn9Poy1ZSguPT9bbKFukhSS8=;
        b=YMODis9sBj4XZd9MlvfJoI3CbW00K76GzXKxVJ9NjVU/3eQZADqKzdnC/cZ0ffQfoN
         lQvddYFg93ENY3JXkaTX4wcdNv+9ZCa+9gQEztFV46xC9XHucupEgDThMXJEGT43f92m
         vDtbQsOMJ5kSV26pnIHC/GJ/wUj8K8e9SF0I617OhUNJ0IO9Gm2TnZuQXgs1kivXci1h
         bl/VdttMavDflJRCS2fa1PjqfktLV8PAFo76pVBsHKEkF6DrbTPwh4+qSdUIm1dq2uHq
         FAmY4REnYy194a2W8ix0ozwhB0fkv/a176Hk2Hngdf8wvHw+PqWFNzEyjFtZxoeAY3KO
         //AA==
X-Gm-Message-State: APjAAAVIJY4Zxvi8+YwnakPy6Lxn1wVcDOPpQSlRtC6BGI0/NSuYVSn9
        cTM2yDZ3J1fv15GUnhwQ8uvUXOFn
X-Google-Smtp-Source: APXvYqxKZ4j3Yx1jP6mxN/G0sPTVLyzbhqsAwQfH/kscRwaI4qd45dPkZ88rQl8e8qDaE37dKNxNGQ==
X-Received: by 2002:a05:6830:16c3:: with SMTP id l3mr7972786otr.359.1556909119351;
        Fri, 03 May 2019 11:45:19 -0700 (PDT)
Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com. [209.85.167.181])
        by smtp.gmail.com with ESMTPSA id s26sm1051533otk.24.2019.05.03.11.45.18
        for <kernel-janitors@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 03 May 2019 11:45:18 -0700 (PDT)
Received: by mail-oi1-f181.google.com with SMTP id v23so5191006oif.8
        for <kernel-janitors@vger.kernel.org>; Fri, 03 May 2019 11:45:18 -0700 (PDT)
X-Received: by 2002:aca:b50b:: with SMTP id e11mr102116oif.51.1556909118233;
 Fri, 03 May 2019 11:45:18 -0700 (PDT)
MIME-Version: 1.0
References: <20190503131551.GB1236@mwanda>
In-Reply-To: <20190503131551.GB1236@mwanda>
From:   Li Yang <leoyang.li@nxp.com>
Date:   Fri, 3 May 2019 13:45:07 -0500
X-Gmail-Original-Message-ID: <CADRPPNTGovYXL8vo7B6d73xu5BzpZBJLV=sGXK9HXrad-3HMeg@mail.gmail.com>
Message-ID: <CADRPPNTGovYXL8vo7B6d73xu5BzpZBJLV=sGXK9HXrad-3HMeg@mail.gmail.com>
Subject: Re: [PATCH] soc: fsl: qe: gpio: Fix an error code in qe_pin_request()
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Qiang Zhao <qiang.zhao@nxp.com>,
        Grant Likely <grant.likely@secretlab.ca>,
        kernel-janitors@vger.kernel.org,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Fri, May 3, 2019 at 8:19 AM Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> There was a missing error code in this path.  It meant that we returned
> ERR_PTR(0) which is NULL and would result in a NULL dereference in the
> caller.

Thanks Dan.  An early version of this patch has been included in a
pending pull request to arm-soc.
https://lkml.org/lkml/2019/5/1/506


>
> Fixes: 1a2d397a6eb5 ("gpio/powerpc: Eliminate duplication of of_get_named_gpio_flags()")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  drivers/soc/fsl/qe/gpio.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/soc/fsl/qe/gpio.c b/drivers/soc/fsl/qe/gpio.c
> index 819bed0f5667..51b3a47b5a55 100644
> --- a/drivers/soc/fsl/qe/gpio.c
> +++ b/drivers/soc/fsl/qe/gpio.c
> @@ -179,8 +179,10 @@ struct qe_pin *qe_pin_request(struct device_node *np, int index)
>         if (err < 0)
>                 goto err0;
>         gc = gpio_to_chip(err);
> -       if (WARN_ON(!gc))
> +       if (WARN_ON(!gc)) {
> +               err = -ENODEV;
>                 goto err0;
> +       }
>
>         if (!of_device_is_compatible(gc->of_node, "fsl,mpc8323-qe-pario-bank")) {
>                 pr_debug("%s: tried to get a non-qe pin\n", __func__);
> --
> 2.18.0
>
