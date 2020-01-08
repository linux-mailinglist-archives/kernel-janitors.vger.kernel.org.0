Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1FC23133C79
	for <lists+kernel-janitors@lfdr.de>; Wed,  8 Jan 2020 08:53:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726789AbgAHHx1 (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Wed, 8 Jan 2020 02:53:27 -0500
Received: from mail-oi1-f195.google.com ([209.85.167.195]:35495 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726180AbgAHHx1 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 8 Jan 2020 02:53:27 -0500
Received: by mail-oi1-f195.google.com with SMTP id k4so1888668oik.2
        for <kernel-janitors@vger.kernel.org>; Tue, 07 Jan 2020 23:53:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=camziUii29p0luivFHpHfiIofvd34K0/ntq20cnWejQ=;
        b=EYsjZsFAsUzuW2XCUGVOeJWRTDpsijA5eG5WJTpjNPOKwMOlWw6m74WmBpygMw4Wal
         CHfd15+K/BxFl/GhaT6DN+6B6+5nGqFEgtbS87PFoKKF44WyOu59XGPLdRtdKjUOyCV6
         d4aWD2Xh3x5tCfggne33yy9ezgsieutkI6AXqPXkYIZI8vMDMsimzfC5yfaslwdYKx0T
         KINyphhUgkHEd8YOel3atJFy5i4FBC9bCRSI7pQxWUVe7+S2BkNzWsohuJ1BDQzbpb2G
         0tQY7yXDvwPrQMH6R+Cz4bfge1cUOvyUnR/n4ZfuAseGuET2OvABs6s2SHmxbtHAcQ7w
         Uf+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=camziUii29p0luivFHpHfiIofvd34K0/ntq20cnWejQ=;
        b=lyDxhG//v1VF4YZIY2ThOdcfXn3cdENjjEWIzXZNYGwIV/HwyE9acsillvstYtRLNz
         lmBWG2r6x8/kpg6ciuH5F0dB9n1cCgLO3uDuhK8MiX+qU842XhJanAG5FCY/+eoHILI+
         28DcQimRuoJqrWMmul8drpRhqI+D2E5rr0dmCYZ5AKvUHvh97BJEJPBa7Sengs9mWArE
         lVEH2sAhrI6oD0jD4reQNM3NN/cFprBKYHk5ugRj444r2HyQAek2KjtP+NdtUZ7jtfgR
         1QXaXCQxzV5ICYdxgCgDHOIadec8X0u/p6uq5gGkA0DpZMfUyOI9CGekYxvmqnE5y6H3
         7nEg==
X-Gm-Message-State: APjAAAX777nGxWbZIh5ecyeOvtNi/0Ih6BnC0G0GMiUJ/c5fFG8y6Gg/
        4MLNPwJadrPb+eVjnniFNxI8I23raC4Omwx4Ur9l2Q==
X-Google-Smtp-Source: APXvYqxsAtXexafEFaXtmUeIIS4EH/aSV390STPoMyxFSIwMe1yBuRA3WSSQE9MEkVKLcLWGmgrgMHKiWL6UBoFX72g=
X-Received: by 2002:a05:6808:b37:: with SMTP id t23mr2101890oij.149.1578470006357;
 Tue, 07 Jan 2020 23:53:26 -0800 (PST)
MIME-Version: 1.0
References: <20200107143601.105321-1-colin.king@canonical.com> <747f9c93-7465-99aa-0b91-a05fd64c7d1f@amd.com>
In-Reply-To: <747f9c93-7465-99aa-0b91-a05fd64c7d1f@amd.com>
From:   Jens Wiklander <jens.wiklander@linaro.org>
Date:   Wed, 8 Jan 2020 08:53:15 +0100
Message-ID: <CAHUa44E7H0wPWQFNQrmAuDtOw=514mxx6fHVAcTpH05HKPvtzA@mail.gmail.com>
Subject: Re: [PATCH][next] tee: fix memory allocation failure checks on
 drv_data and amdtee
To:     "Thomas, Rijo-john" <Rijo-john.Thomas@amd.com>
Cc:     Colin King <colin.king@canonical.com>,
        Devaraj Rangasamy <Devaraj.Rangasamy@amd.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        Gary R Hook <gary.hook@amd.com>,
        "tee-dev @ lists . linaro . org" <tee-dev@lists.linaro.org>,
        "linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>,
        kernel-janitors@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Wed, Jan 8, 2020 at 8:03 AM Thomas, Rijo-john
<Rijo-john.Thomas@amd.com> wrote:
>
> +linux-crypto
>
> On 07/01/20 8:06 pm, Colin King wrote:
> > From: Colin Ian King <colin.king@canonical.com>
> >
> > Currently the memory allocation failure checks on drv_data and
> > amdtee are using IS_ERR rather than checking for a null pointer.
> > Fix these checks to use the conventional null pointer check.
> >
> > Addresses-Coverity: ("Dereference null return")
> > Fixes: 757cc3e9ff1d ("tee: add AMD-TEE driver")
> > Signed-off-by: Colin Ian King <colin.king@canonical.com>
>
> Reviewed-by: Rijo Thomas <Rijo-john.Thomas@amd.com>

Acked-by: Jens Wiklander <jens.wiklander@linaro.org>

Thanks,
Jens

>
> > ---
> >  drivers/tee/amdtee/core.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/tee/amdtee/core.c b/drivers/tee/amdtee/core.c
> > index 9d0cee1c837f..5fda810c79dc 100644
> > --- a/drivers/tee/amdtee/core.c
> > +++ b/drivers/tee/amdtee/core.c
> > @@ -444,11 +444,11 @@ static int __init amdtee_driver_init(void)
> >               goto err_fail;
> >
> >       drv_data = kzalloc(sizeof(*drv_data), GFP_KERNEL);
> > -     if (IS_ERR(drv_data))
> > +     if (!drv_data)
> >               return -ENOMEM;
> >
> >       amdtee = kzalloc(sizeof(*amdtee), GFP_KERNEL);
> > -     if (IS_ERR(amdtee)) {
> > +     if (!amdtee) {
> >               rc = -ENOMEM;
> >               goto err_kfree_drv_data;
> >       }
> >
