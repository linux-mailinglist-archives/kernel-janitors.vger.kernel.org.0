Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AE17027E693
	for <lists+kernel-janitors@lfdr.de>; Wed, 30 Sep 2020 12:27:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729018AbgI3K15 (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Wed, 30 Sep 2020 06:27:57 -0400
Received: from mout.kundenserver.de ([212.227.17.13]:50947 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728500AbgI3K15 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 30 Sep 2020 06:27:57 -0400
X-Greylist: delayed 302 seconds by postgrey-1.27 at vger.kernel.org; Wed, 30 Sep 2020 06:27:57 EDT
Received: from mail-qk1-f171.google.com ([209.85.222.171]) by
 mrelayeu.kundenserver.de (mreue106 [212.227.15.145]) with ESMTPSA (Nemesis)
 id 1MeC5x-1kwcxd2EI3-00bNBT for <kernel-janitors@vger.kernel.org>; Wed, 30
 Sep 2020 12:22:54 +0200
Received: by mail-qk1-f171.google.com with SMTP id w12so823197qki.6
        for <kernel-janitors@vger.kernel.org>; Wed, 30 Sep 2020 03:22:54 -0700 (PDT)
X-Gm-Message-State: AOAM530RmGOWNdparW9v0p/HWuK+t+rRCuM7zJHyYcXKtmNIJ42+WC7n
        fAK2WQnpw5lwQkOMBGLQPKk1MXY/vdR+Yy3H5JA=
X-Google-Smtp-Source: ABdhPJzbp1ree7OnLK3wvVArvoiDQadBs0pygzava7j+b3qT05utAOWO3J1rLFwcXA64KjCr9Zap1oKqinCzol0q+MY=
X-Received: by 2002:a37:5d8:: with SMTP id 207mr1859009qkf.352.1601461373212;
 Wed, 30 Sep 2020 03:22:53 -0700 (PDT)
MIME-Version: 1.0
References: <20200930090238.GA621698@mwanda>
In-Reply-To: <20200930090238.GA621698@mwanda>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Wed, 30 Sep 2020 12:22:37 +0200
X-Gmail-Original-Message-ID: <CAK8P3a1m3kaGK17A2ADgA7b9i7GeEYhX=xVoU=Yet8_T93Q2JA@mail.gmail.com>
Message-ID: <CAK8P3a1m3kaGK17A2ADgA7b9i7GeEYhX=xVoU=Yet8_T93Q2JA@mail.gmail.com>
Subject: Re: [PATCH] staging: vchiq: silence an uninitialized variable warning
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Marcelo Diop-Gonzalez <marcgonzalez@google.com>,
        Jamal Shareef <jamal.k.shareef@gmail.com>,
        bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
        "moderated list:BROADCOM BCM2835 ARM ARCHITECTURE" 
        <linux-rpi-kernel@lists.infradead.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        driverdevel <devel@driverdev.osuosl.org>,
        kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:8LwwTIuwrdoI43eqbu8GAFiybBXpseoie4b4KQc9NB8JRvWgq5/
 O+kyUNX59xDmrp7pQ1Mip5QZAezCx11efFKmnYFrTKW1ZsAavGGvpBqysvUP4hCygghoc4p
 d/L3rDKyXlQbSAB/v5m6C/yMPlyY2zw+GaGy180CFcZCAG/ouROFyW5kZcdgapeZAgXCcFe
 fVajZsg7jM3pjT898/jRw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:p0haXGhm7ME=:ygR4u9ZxWlxplFxPAhfVCa
 UmC799sz6dLBjg/G54bju1y6xPxr7t+ZCNL8UFVYZ/ZPu8044hIzyfbyXtZRFCAgsCC3i3B4w
 jjacM1gDWjp9hbXdJc6Urn1jZ6FiTH0LbATe9vnzK48a01KKAnGtO6PVtue/mmDM2MAABmaoi
 8Ixg/CCNFJ+JJ6ugpz7OlCfHz2VP8srWtKJwQdIAWt617ocaf1KVpj3mBr56Sk0Z2YcuIo/Ol
 cp0Yq2axyDII5prlxMbGQNiy4mjVhhCCC8NrK33MewhB9Dhaz8AN2fy7QOjLv0/VVVgu9FCu6
 lmPedaWmd0zJ2IO00qJp1SNTT/Uu/NrB5TY3Vg7EpELvaAiOLyoNrJs4xoVbklySGwRtMYiAx
 i7sZbC/zb5My/WV6HlOkRQI2b4s6Qy628OBqVh9Qpp3GSMR79GPdNoxk9yg9oTFkgFwK8Bmvs
 5SftRfHjMRJIIgyRPvxIhIiMe6Q6t5kINqKRgnpdNJmmspfKL8nKovDZS8UnzmydLdv5cntXC
 ptm4um1R7SCLtzFy4xh2lSxpc/DwI7q4KRD0jdJNK3WULw4A77VlRKWbr80NqaaB5fkLIhWK8
 KKK4QFLCtJu6kku3bb2wvWhIVZimCpjGXrHJXWRV2MugWlfCRlfSVAT1FoQ4scC8su5mZ9ZeR
 HGE29x4h+gtLkCeqtjhQUc+6nZ2QGeWzyICu35V5Xh8wnFNVkqHe62Vn2p6zwrKm0DSKDwmE2
 pm8T4pgPB7vdLQhWfMuvGHm7nmdlblFlN2U4gado+vmf7/s2xXKzvWz8bIc9nU2S6BSmXxmbM
 gLS3l8cnWbkn9BmV3g+dA/Toid8QZ17ofUtho/Dgt8DKpqYG9fJr+V0yAIP1oI5eEYzXxSE
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Wed, Sep 30, 2020 at 11:02 AM Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> Smatch complains that "userdata" can be passed to vchiq_bulk_transfer()
> without being initialized.  Smatch is correct, however, in that
> situation the "userdata" is not used so it doesn't cause a problem.
> Passing an uninitialized variable will trigger a UBSan warning at
> runtime so this warning is worth silencing by setting "userdata" to
> NULL.
>
> Fixes: a4367cd2b231 ("staging: vchiq: convert compat bulk transfer")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

The change looks fine, but I wonder if it's actually worse and the
uninitialized pointer can end up getting copied back to user space
in the completion.

In either case, thanks for the fix!

Acked-by: Arnd Bergmann <arnd@arndb.de>
