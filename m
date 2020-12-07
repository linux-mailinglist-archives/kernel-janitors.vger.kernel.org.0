Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 50E172D1573
	for <lists+kernel-janitors@lfdr.de>; Mon,  7 Dec 2020 17:02:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727414AbgLGQCu (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Mon, 7 Dec 2020 11:02:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54718 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725996AbgLGQCu (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 7 Dec 2020 11:02:50 -0500
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com [IPv6:2607:f8b0:4864:20::743])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC2D2C061793
        for <kernel-janitors@vger.kernel.org>; Mon,  7 Dec 2020 08:02:09 -0800 (PST)
Received: by mail-qk1-x743.google.com with SMTP id n142so2762194qkn.2
        for <kernel-janitors@vger.kernel.org>; Mon, 07 Dec 2020 08:02:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=S7Rpa44vVpK13982B8H0b8cHEVKk1I5bzX3iheCTUPc=;
        b=nbWNhnYJ3BORs1YbHp3dh688MRUQRm4wp0oDnRU0z6E4SglDPNKd/V6uf/R+4dM10c
         KVVXcS4SCye4GOhzchO2y5PDZlzvj+u6kuOmHaYLLYv48NUF0U0NplzsiUbnd+OvaWpM
         0sz8p8jHASySnbY5BH3135UlaBa/O+gaxoU4Sf2kUcVOWXZ9bKgHK+I3LF2DrtdWm+ut
         /t+NDkIxnKa4KzjC+29psRRQ4M/LtW45yV6XwL+qu71RXZVa5pAJRhRzSaz6lT6G+iMh
         jB5whsnsiCwTGqrsQO9Ha0BqR59VTHcLG6cHc/5QAeENpPHfwoKFnkWfUpmoi/wp4Fod
         T01g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=S7Rpa44vVpK13982B8H0b8cHEVKk1I5bzX3iheCTUPc=;
        b=VhXhnOj8qM2jG/qjfzLrNiY9X86AOavxNvSMgBSGZN5XUJlIWTuqCURhyixMukk72R
         BmaHnDS4eCA05NJW2vEIL/JSZXXkNdXG6+iH3bMka1TAX7SpAoL/wciijj0smlLI4lzu
         l5jxlz87zRi45L2UH3Wh3QJJ1qfdjIqzrNelQ8hRCUfDLz5fX2u2U+Y9G+4UusOw6ly/
         6piurAoEOIEMdEW/jgQgZc6OhyWpBW6a8Jd5XqF1k2qMhCFfqvTZAD7hmC6vcn+dQhBY
         zpkTovNhJ95Fd2iTplK9C5zFBBmmoHa1QLPuK/6OU6SVegjMzvA3+qBoqKc84qA4xdfc
         aqfw==
X-Gm-Message-State: AOAM531aCmqb402XX2hUj4jvRD3/zzyJ9SEyx/8LfVI8IbreuQdggtLN
        K+7WXNwjfKuWJIao+AunVVOOJ6acifHd/twmiTN7xA==
X-Google-Smtp-Source: ABdhPJxDIpQj1Ku/XylxtvaARHa1gt6tPurrlNUxhRdpeFP2dwv5QTDzjXFXESyhUAcLM1/oG6O06162hZ+0mTKJIbI=
X-Received: by 2002:a05:620a:15ce:: with SMTP id o14mr25341103qkm.231.1607356928374;
 Mon, 07 Dec 2020 08:02:08 -0800 (PST)
MIME-Version: 1.0
References: <X84nbdgv0a/ak2ef@mwanda> <20201207131446.GA852@paasikivi.fi.intel.com>
 <CAHp75Vftvtn4DhOU73w7hgOYpw9pJbJCJ0dSW6wUrQHA5HMn-A@mail.gmail.com>
In-Reply-To: <CAHp75Vftvtn4DhOU73w7hgOYpw9pJbJCJ0dSW6wUrQHA5HMn-A@mail.gmail.com>
From:   Dmitry Vyukov <dvyukov@google.com>
Date:   Mon, 7 Dec 2020 17:01:56 +0100
Message-ID: <CACT4Y+a3MnDamodmVi6C79+fUEse+71DSG8xPQH7S3Eg4i=S_A@mail.gmail.com>
Subject: Re: [PATCH] media: i2c: ov02a10: fix an uninitialized return
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Arnd Bergmann <arnd.bergmann@linaro.org>,
        kbuild test robot <lkp@intel.com>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        Dongchun Zhu <dongchun.zhu@mediatek.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        kernel-janitors@vger.kernel.org, workflows@vger.kernel.org,
        kernelci@groups.io
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Mon, Dec 7, 2020 at 4:55 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> +Cc: some people who involved in different kernel source checkers
>
> On Mon, Dec 7, 2020 at 3:19 PM Sakari Ailus
> <sakari.ailus@linux.intel.com> wrote:
> > On Mon, Dec 07, 2020 at 04:00:29PM +0300, Dan Carpenter wrote:
> > > The "ret" variable isn't set on the no-op path where we are setting to
> > > on/off and it's in the on or off state already.
> > >
> > > Fixes: 91807efbe8ec ("media: i2c: add OV02A10 image sensor driver")
> > > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> >
> > Thanks for the patch.
> >
> > This issue has been fixed by another patch here:
> >
> > <URL:https://patchwork.linuxtv.org/project/linux-media/patch/20201204082037.1658297-1-arnd@kernel.org/>
>
> This has been reported by 3 or 4 different people. I'm wondering if
> it's possible to introduce a common database to somehow reduce the
> amount of patches against the same findings.

+workflows and kernelci re multiple reports/patches for the same kernel bug

I think KernelCI DB effort has a goal of fighting this duplication of
efforts. But as far as I understand the exact mechanism for
deduplication is an open question.
