Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 488EA17CD6
	for <lists+kernel-janitors@lfdr.de>; Wed,  8 May 2019 17:09:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726869AbfEHPJD (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Wed, 8 May 2019 11:09:03 -0400
Received: from mail-vk1-f193.google.com ([209.85.221.193]:43476 "EHLO
        mail-vk1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726543AbfEHPJC (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 8 May 2019 11:09:02 -0400
Received: by mail-vk1-f193.google.com with SMTP id h72so373453vkh.10
        for <kernel-janitors@vger.kernel.org>; Wed, 08 May 2019 08:09:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=A8J0qnJ8havQgpBwxndFjEeiRIL08r2bIZgoFLIonko=;
        b=AQf5TTC+m4D1srb6ruLAqA6thPAWsN+VeCyPcRUQz0lBwC57hkXffZhI3HYEwhtdX3
         DRdB4YCcgAnQKqb/ZUOr7e/4C0k84noZ8MC1A2386UlhROWdoQ5eFO7GkB2IMCZPG+zQ
         YHxBJXTXoujPfvUQF2cTQVxh/2oqBp2W0qPag=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=A8J0qnJ8havQgpBwxndFjEeiRIL08r2bIZgoFLIonko=;
        b=Kyth2QUTIw3bwOEiXHtlhY0b1QZo6jQQKqA1w7No8Bwewa45p2tAwVKPGmWrKU9ySH
         2S66nraxgYAIN+/UjgARrg/4gnLUCFrHKvZW//PtyDAybefcC9xas3EtXdSiWXyFX1Q1
         cone5/RrFYrWHmmhrIm0dn4/e95bByStbnQWCpA95J8TsS+nYmaCgBTiyJyZZXece0Dg
         V1XkReLBgkuXzTeUcQeKQ8z6Dx3JVNCHAR8HUli/MfDemD7NRGkilOmW7aDcVPvpiwwz
         H/MGSCSK2Y1ULUQyzRne63FWx5GsnKbjmgXu7UI87K1frm0+RYkhbOvm1P1OgEpeGl38
         umvg==
X-Gm-Message-State: APjAAAWy9PXkctOpn1qJ1wbKjV/NZ0MqhGyGyPj7RSrki5dzUODIFv4m
        UFcRbEOff9aRk0HeV0Z7Ptn8SDX0fcI=
X-Google-Smtp-Source: APXvYqxnWP0Gge5Mo/np/83QUbfrXqfUnt5ZgZJ0F3bl+Tq1m1Fi3d1GdAN0Jcf8hRNCybdo8q4/Fw==
X-Received: by 2002:a1f:61c6:: with SMTP id v189mr20307690vkb.87.1557328141437;
        Wed, 08 May 2019 08:09:01 -0700 (PDT)
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com. [209.85.222.47])
        by smtp.gmail.com with ESMTPSA id c2sm16658664vsc.32.2019.05.08.08.08.57
        for <kernel-janitors@vger.kernel.org>
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Wed, 08 May 2019 08:08:59 -0700 (PDT)
Received: by mail-ua1-f47.google.com with SMTP id 94so5229257uaf.10
        for <kernel-janitors@vger.kernel.org>; Wed, 08 May 2019 08:08:57 -0700 (PDT)
X-Received: by 2002:ab0:59aa:: with SMTP id g39mr11441309uad.124.1557328136009;
 Wed, 08 May 2019 08:08:56 -0700 (PDT)
MIME-Version: 1.0
References: <20190506125018.GA13799@mwanda>
In-Reply-To: <20190506125018.GA13799@mwanda>
From:   Doug Anderson <dianders@chromium.org>
Date:   Wed, 8 May 2019 08:08:44 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WB=om5sPH+p0FN7i=RJfj0L+9-3YUz_djF4Nw30B221Q@mail.gmail.com>
Message-ID: <CAD=FV=WB=om5sPH+p0FN7i=RJfj0L+9-3YUz_djF4Nw30B221Q@mail.gmail.com>
Subject: Re: [PATCH] kdb: do a sanity check on the cpu in kdb_per_cpu()
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Jason Wessel <jason.wessel@windriver.com>,
        Daniel Thompson <daniel.thompson@linaro.org>,
        Christophe Leroy <christophe.leroy@c-s.fr>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Kees Cook <keescook@chromium.org>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        Nicholas Mc Guire <hofrat@osadl.org>,
        Johannes Weiner <hannes@cmpxchg.org>,
        kgdb-bugreport@lists.sourceforge.net,
        kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hi,

On Mon, May 6, 2019 at 5:50 AM Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> The "whichcpu" comes from argv[3].  The cpu_online() macro looks up the
> cpu in a bitmap of online cpus, but if the value is too high then it
> could read beyond the end of the bitmap and possibly Oops.
>
> Fixes: 5d5314d6795f ("kdb: core for kgdb back end (1 of 2)")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  kernel/debug/kdb/kdb_main.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
