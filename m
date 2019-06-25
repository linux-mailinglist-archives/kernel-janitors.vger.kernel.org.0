Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C663F52413
	for <lists+kernel-janitors@lfdr.de>; Tue, 25 Jun 2019 09:10:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729863AbfFYHKi (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Tue, 25 Jun 2019 03:10:38 -0400
Received: from mail-io1-f66.google.com ([209.85.166.66]:40677 "EHLO
        mail-io1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726856AbfFYHKi (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 25 Jun 2019 03:10:38 -0400
Received: by mail-io1-f66.google.com with SMTP id n5so587036ioc.7
        for <kernel-janitors@vger.kernel.org>; Tue, 25 Jun 2019 00:10:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=de69OCjWLEoJOVupj+z2Vrj9cMrX8EO/TnQ/3IPkUjg=;
        b=rUbw2h7m31+afZF5Hr38OLSiDf3+gH/T9QJYuR6ow/SKpzay6u1adULGW2w8WI8swO
         6TmWtb1H2tnA2eRTp1XhJ6xFuV4KKqYxxLZpwjhmbpDtKoazMS1JkdiWshJKB9fi9y1C
         1jqjTA8vWAYQ0NXea3jrS/F0o9/oU5bt/JIJ9e4QCjjXBLjnQMqG/VhToI+VHR+Hww/F
         dh6G+zJ0dDyqFCGAEVZzU2trUTWDnuygPYSNubyDA4UaCzt64ekqZtQRAN7b7kJwJvLR
         Q4nxcNbstX9ZKADAEFWAVYHsfTVuuk+cJyHNV0276iR6KFhboN5emsKeB/TC9ePB5QM/
         K3LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=de69OCjWLEoJOVupj+z2Vrj9cMrX8EO/TnQ/3IPkUjg=;
        b=rlZPJnDrHApEiT6EO2gOvdq4lsC4SXezTnHrzOW1OvO2zATwEHidKRsdNlBsiaJR88
         nkOllHZOxrAfa06kk9aM2nEPexaX46FsqPP11J83gLAwD1DT1Ba2U4gi9pPFMdBCUwEP
         DyXnc/Wx2t7hvt8uP4eJyb8+TjeJ5fApFlkEXlwLieWe2ihrUjhloJ+FvvmS9oAoFQ91
         UpfZywblBEYevtPioHwcVNKMtDaF+QuBwcd1dsu2/fsPKWirRKtoLgOg0xp1wx2F6B/q
         0AJlZ5fOg8NsKXBJuBWAWHk1Qnmch2zJr9WIUB1MRP8I7xaxj0k5n1UHrxHjm4kjnE2M
         d6VQ==
X-Gm-Message-State: APjAAAVYBXpGHuZUKcm7V0VGJPMYZIaMdOrmA/0sjY+zxlilT4FPCjbG
        pDsSMDuB2xbVUITRfr/ynT3uS6O/ZeOTNg3oO7OKUQ==
X-Google-Smtp-Source: APXvYqwt9FUPbNuPIYl40S3Z6LGQFhKnprVrc15JCgOBrx5+zp4ftaGlrybHhDlwTUDwZpPQdqmFp5GLjNd6LUptR+I=
X-Received: by 2002:a6b:f80b:: with SMTP id o11mr2262547ioh.40.1561446636658;
 Tue, 25 Jun 2019 00:10:36 -0700 (PDT)
MIME-Version: 1.0
References: <20190221162627.3476-1-brgl@bgdev.pl> <9efcbce2-4d49-7197-a3d8-0e83850892d5@web.de>
 <CAMpxmJX-wXQ-ff1RWkPmJBWSsP_v2MjZrA3fhj3HQX0_zM0eZA@mail.gmail.com>
 <39ae399a-c606-c6de-f84d-35e39d0410c0@metux.net> <CAMRc=McepqowJNi6ay6x9KKoHOC8aCxP_ob12SgbsnJU_sKQng@mail.gmail.com>
 <1dd52704-0e41-db31-33f4-c9f446a47344@metux.net>
In-Reply-To: <1dd52704-0e41-db31-33f4-c9f446a47344@metux.net>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Tue, 25 Jun 2019 09:10:25 +0200
Message-ID: <CAMRc=Mfp85diy849r_8UHKS9eao26djrsMF0_iwE--d62mQ5jg@mail.gmail.com>
Subject: Re: [PATCH] drivers: Adjust scope for CONFIG_HAS_IOMEM before devm_platform_ioremap_resource()
To:     "Enrico Weigelt, metux IT consult" <lkml@metux.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Markus Elfring <Markus.Elfring@web.de>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Keerthy <j-keerthy@ti.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        kernel-janitors@vger.kernel.org,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

pon., 24 cze 2019 o 20:22 Enrico Weigelt, metux IT consult
<lkml@metux.net> napisa=C5=82(a):
>
> On 24.06.19 12:46, Bartosz Golaszewski wrote:
>
> >> The patch seems pretty trivial and doesn't change any actual code, so
> >> I don't see hard resons for rejecting it.
> >>
> >
> > In its current form it makes the code even less readable. The #ifdef
> > should actually be one line lower and touch the comment instead of the
> > EXPORT_SYMBOL() related to a different function.
>
> Okay, that missing newline should be fixed (as well as the extra one
> after the #ifdef). Besides that, I don't see any further problems.
>

Are we sure this even changes something? Does kernel documentation get
generated according to current config options? I really think this
patch just pollutes the history for now apparent reason.

Greg, could you give your opinion on this?

Bart
