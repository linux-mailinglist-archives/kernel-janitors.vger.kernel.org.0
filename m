Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 42A34AD46E
	for <lists+kernel-janitors@lfdr.de>; Mon,  9 Sep 2019 10:08:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388621AbfIIIIv (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Mon, 9 Sep 2019 04:08:51 -0400
Received: from mail-ot1-f65.google.com ([209.85.210.65]:40281 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725875AbfIIIIv (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 9 Sep 2019 04:08:51 -0400
Received: by mail-ot1-f65.google.com with SMTP id y39so11604914ota.7
        for <kernel-janitors@vger.kernel.org>; Mon, 09 Sep 2019 01:08:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=gJqsNk537Ee698eaMI/WoUOzxOSMBJRuyaZH39TduDU=;
        b=tV4CHDh5/x14CjSLzPXNjSrr+KO5ZwGNjsO+eJCUJDD55ojKGrvIW0WwrwhhnPM/Uc
         M9W7qCVu2FfrQezi90405Ev7XmnTRT0jU/Srfeta7Em2TjWMZ5+DVbFQ5mY5CsF9MkgO
         8sZCeSi/jr3WgU3CfycmGdJJuxo/BZIHDR07YGaybbOf/DbBMrK1qgSuMT1ha8gxzcmm
         n9LV0Nf+cK21w/c5ljuBJYA0pSdgQDFuuVP6lVRnqZb3GeQRJjNVdgurG6XLX14Ydf/E
         xN+Sda6Fh9zifoRjwGCOsgckLP23ivlvAt51xQ+fWcrSyqbWnRPl1/QBQNWMnJZ9xWmW
         TLHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=gJqsNk537Ee698eaMI/WoUOzxOSMBJRuyaZH39TduDU=;
        b=iA1+zyrTpbDsyzEkBopAjn1zOiDwspOQGx5BECMXCib5H+xNoiZ+ZfznJSPtitDDGi
         lmSB6yNqJhiV5pFWfR/joZ0sps/uN+ygW1oZJdIJ1ajuGdZHC8i95zfHIe5tztZtTh1x
         2abNmj1t9kteVVqGcf9fKsC/AslriEf7TCUzJRaOm1ID9JkRWLoW2m1/fStVOCRA0ny4
         /vXTUSXE8djMq4XSa1o+UatTr55asTt+Xdbc4WM8ukwDzkmbxHc6sy/J+Cw9raDIUUsf
         raI5h/ynej8704A7C9nhMumEu0aIiPEnKXUTFSNE2cm6WGGFNOfaW2jsszHiP5y2jmn4
         u+aQ==
X-Gm-Message-State: APjAAAWONRsfy/IPC+vjR2seqQp4AWQ+hI07mkhMlxrR1o4hN9ugzNwI
        Ketv5IDI1f8xeV1+ZMz/8N0dgXczu0jeLv5PsxtceA==
X-Google-Smtp-Source: APXvYqxE+jEqaxY/ZswNBiISMkKeCPo7b4iQVVMhabwK63I4ZoYPjGGjobrNUVzpsqIa33svZwabA4fI7Ba4C4w6eBQ=
X-Received: by 2002:a9d:5a06:: with SMTP id v6mr17519979oth.250.1568016530212;
 Mon, 09 Sep 2019 01:08:50 -0700 (PDT)
MIME-Version: 1.0
References: <20190904141834.195294-1-weiyongjun1@huawei.com> <CAMpxmJWJr0uBCs_oGX+h1uFmQ2f7Axo1iqtD6rzwgT-bbZdD6g@mail.gmail.com>
In-Reply-To: <CAMpxmJWJr0uBCs_oGX+h1uFmQ2f7Axo1iqtD6rzwgT-bbZdD6g@mail.gmail.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Mon, 9 Sep 2019 10:08:39 +0200
Message-ID: <CAMpxmJVyYVd-B=6x2sNk3Qa1TTsOHju7TKAG=_8h3Bo1zXxDzw@mail.gmail.com>
Subject: Re: [PATCH] gpio: mockup: add missing single_release()
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Wei Yongjun <weiyongjun1@huawei.com>,
        Bamvor Jian Zhang <bamv2005@gmail.com>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

=C5=9Br., 4 wrz 2019 o 16:54 Bartosz Golaszewski
<bgolaszewski@baylibre.com> napisa=C5=82(a):
>
> =C5=9Br., 4 wrz 2019 o 16:00 Wei Yongjun <weiyongjun1@huawei.com> napisa=
=C5=82(a):
> >
> > When using single_open() for opening, single_release() should be
> > used instead of seq_release(), otherwise there is a memory leak.
> >
> > Fixes: 2a9e27408e12 ("gpio: mockup: rework debugfs interface")
> > Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> > ---
> >  drivers/gpio/gpio-mockup.c | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/drivers/gpio/gpio-mockup.c b/drivers/gpio/gpio-mockup.c
> > index f1a9c0544e3f..213aedc97dc2 100644
> > --- a/drivers/gpio/gpio-mockup.c
> > +++ b/drivers/gpio/gpio-mockup.c
> > @@ -309,6 +309,7 @@ static const struct file_operations gpio_mockup_deb=
ugfs_ops =3D {
> >         .read =3D gpio_mockup_debugfs_read,
> >         .write =3D gpio_mockup_debugfs_write,
> >         .llseek =3D no_llseek,
> > +       .release =3D single_release,
> >  };
> >
> >  static void gpio_mockup_debugfs_setup(struct device *dev,
> >
> >
> >
>
> Good catch!
>
> Reviewed-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
>
> Linus: can you pick it up for your last pull-requests with fixes for v5.3=
?
>
> Bart

Nevermind - I applied it to my tree and will send it with two other
fixes in a PR.

Bart
