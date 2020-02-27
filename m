Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B3E1D17225C
	for <lists+kernel-janitors@lfdr.de>; Thu, 27 Feb 2020 16:39:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729223AbgB0PjH (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Thu, 27 Feb 2020 10:39:07 -0500
Received: from mail-oi1-f193.google.com ([209.85.167.193]:43715 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729089AbgB0PjH (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 27 Feb 2020 10:39:07 -0500
Received: by mail-oi1-f193.google.com with SMTP id p125so3679477oif.10
        for <kernel-janitors@vger.kernel.org>; Thu, 27 Feb 2020 07:39:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=j+/gk6insjQWfguayyY5n+PVyGC/gCinrUvHWhUy8D0=;
        b=RYQSewaQgzrYtqteA/pDUko0J97YWrSX2+24l5pM5+AOPBykdIjFRx0y0GDQrttgyn
         BNCKKEee4nHeC13XJ7H7TiHd6GJVh+s5tTKGK1EfLjyXYNPV8yak+ybu0KOafEHDE54E
         WZnyuJhtqVQYG5rmiYKVi1nwIq+iPZvqov/9E4fZY5SOy/QkJ4JifNToKUPD/M1Yzr1b
         E3gJtRhylZpeBbdXmDumXIZXDheyg93muaWequLynYUMYbU0FfOVGH29IwN/WpwFieMQ
         ZnFW/VQDMvVdcUzdGRxOHKj5GsB6KRmxsueqk8hIikMwTj69HkxpmQN8ee2glTNg2o5W
         bOvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=j+/gk6insjQWfguayyY5n+PVyGC/gCinrUvHWhUy8D0=;
        b=cHDwwXqhRZwfPXKDEUNyYRoHwMrX0tol9/B1dMWIL/0wTLq/0ZYCj72BBpaTWLE+zN
         A4YmLyIwh7jqnAMcJT2IArgVtk9s7FOO3OLo8hty3N2wntqdxbCLStM32hqHadVzTN2m
         WQTe1uIjM8vTsPO66yh2d6qpBSZ8U+BVJZrbyiWXjvKHT5OOgr4nBr7Y/ESSwBmChxa3
         Fdr/ZYLB5HC0enEXE5p4gSU8bJ0peAXQAm3133e0mRCxGxjwUG9sPxmOgpHuiEN4msI4
         b8wXiegY5NDxmeaW083pBrsfbJ/voxhqjxBM2i9V26VFQPhTAd5wdT3KyZmBO26bgorg
         RPFw==
X-Gm-Message-State: APjAAAUhdE8/XKnYTpT4+bb4/FE08ebvSTWEKE4Amsk7UsWRBWSIqgbd
        1EIkRSS1lhcpsTLXy6bNuJHifYHVYszcf/Fuexcouw==
X-Google-Smtp-Source: APXvYqwaHHiJ+zYxpNMylDFbW3TVqhXB7XpshSNfKkF75F+wtc70gjiL0uezHZQk/wVomE8autQrz4jALvVEIvINwCU=
X-Received: by 2002:aca:1215:: with SMTP id 21mr2064338ois.5.1582817946193;
 Thu, 27 Feb 2020 07:39:06 -0800 (PST)
MIME-Version: 1.0
References: <20200224105139.b5nweo2guprmxteu@kili.mountain> <80bbfd17-b1d3-31f5-a2d7-c2163dc4d874@amd.com>
In-Reply-To: <80bbfd17-b1d3-31f5-a2d7-c2163dc4d874@amd.com>
From:   Jens Wiklander <jens.wiklander@linaro.org>
Date:   Thu, 27 Feb 2020 16:38:55 +0100
Message-ID: <CAHUa44G_40N4u8bqsmMm3oTwY+o0sr0APbUe64igXH83dJdv6A@mail.gmail.com>
Subject: Re: [PATCH v2] tee: amdtee: fix memory leak in amdtee_open_session()
To:     Rijo Thomas <Rijo-john.Thomas@amd.com>
Cc:     Dan Carpenter <dan.carpenter@oracle.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        Gary R Hook <gary.hook@amd.com>,
        Devaraj Rangasamy <Devaraj.Rangasamy@amd.com>,
        "tee-dev @ lists . linaro . org" <tee-dev@lists.linaro.org>,
        kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Tue, Feb 25, 2020 at 1:06 PM Rijo Thomas <Rijo-john.Thomas@amd.com> wrote:
>
>
>
> On 24/02/20 4:21 pm, Dan Carpenter wrote:
> > On these error paths the "sess" variable isn't freed.  It's a refcounted
> > pointer so we need to call kref_put().  I re-arranged the code a bit so
> > the error case is always handled before the success case and the error
> > paths are indented two tabs.
> >
> > Fixes: 757cc3e9ff1d ("tee: add AMD-TEE driver")
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>
> Reviewed-by: Rijo Thomas <Rijo-john.Thomas@amd.com>

I'm picking up this.

Thanks,
Jens
