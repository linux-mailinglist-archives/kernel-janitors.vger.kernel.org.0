Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 62E9C7367C
	for <lists+kernel-janitors@lfdr.de>; Wed, 24 Jul 2019 20:23:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387471AbfGXSXs (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Wed, 24 Jul 2019 14:23:48 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:38250 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726810AbfGXSXs (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 24 Jul 2019 14:23:48 -0400
Received: by mail-pg1-f194.google.com with SMTP id f5so12806799pgu.5
        for <kernel-janitors@vger.kernel.org>; Wed, 24 Jul 2019 11:23:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=message-id:mime-version:content-transfer-encoding:in-reply-to
         :references:subject:to:cc:from:user-agent:date;
        bh=/UTQACYWihs+D96UuX0GSdpYwsPs5H8hc15Sw9zwTZk=;
        b=Wvl4GBEqyyXdTe4u0bb1ApAIBbHmw53V4/SCd/PG9Hdm2RRbDxwGy/KcZW2mMIdi5a
         tpVV3GgCiX2Vy9+6tZqQYkL4DQVKkJdpNQZitry9DyjVa79VYejx92ybrBYjGgO0pCgA
         UBE74+Xcccczump72mYfNZ9Oh7H8HMvmSagws=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:mime-version
         :content-transfer-encoding:in-reply-to:references:subject:to:cc:from
         :user-agent:date;
        bh=/UTQACYWihs+D96UuX0GSdpYwsPs5H8hc15Sw9zwTZk=;
        b=LofspjQKvQOLuVLarWoyrEwCD72EVArtWHuaHU7E22j0rSHrW2T1JhU1lQILBvoowS
         3ff+llJUOrGrkmip7dPB6WwBrFOsQSY9KK1BSMh+6tjqW693ZeuXnCfsxW5uS/3B9/3m
         isK44ocgr7HKOT3FbBWQ9MSPeppbS+6AcHmF9VByMlmHWuwz67wkoh4vlQ/dVPNDo+Yw
         bh20KhBpQ4Pimfj/rW4CK2bRIkg6/a1+lGIokmSo0jaIpMHMVNuV5mNfmVvZqQ9rNts1
         Ya9QJaIkiOchwsCq1XB11Dw9tErM7XXrZm2EU3ylGxJ1m2oT+RkyljRPA7huXXU7O9m3
         v72Q==
X-Gm-Message-State: APjAAAVJFhV/9z77MBJW/YEYAmii7BqfigBQlMYSnX2Fo1HevTHmJF3b
        iShGK+Urh1UjzxKkVf4bJWbmvQ==
X-Google-Smtp-Source: APXvYqxE7IY+6hLQMkntNC/0nJx+QAa8wu/tGuTS6Mzp5neZx5a6cta2lYffYGzN4+PvPsCRBu0miQ==
X-Received: by 2002:aa7:9516:: with SMTP id b22mr12525506pfp.106.1563992627374;
        Wed, 24 Jul 2019 11:23:47 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id i3sm50422950pfo.138.2019.07.24.11.23.46
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Wed, 24 Jul 2019 11:23:46 -0700 (PDT)
Message-ID: <5d38a232.1c69fb81.f85f4.67e3@mx.google.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <9b5d8470-dd6e-4358-141f-6b6c40774de1@web.de>
References: <20190723181624.203864-4-swboyd@chromium.org> <9b5d8470-dd6e-4358-141f-6b6c40774de1@web.de>
Subject: Re: [PATCH v4 3/3] coccinelle: Add script to check for platform_get_irq() excessive prints
To:     Gilles Muller <Gilles.Muller@lip6.fr>,
        Julia Lawall <Julia.Lawall@lip6.fr>,
        Markus Elfring <Markus.Elfring@web.de>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Nicolas Palix <nicolas.palix@imag.fr>, cocci@systeme.lip6.fr,
        kernel-janitors@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, Andrzej Hajda <a.hajda@samsung.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Javier Martinez Canillas <javierm@redhat.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Mark Brown <broonie@kernel.org>,
        "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
        Rob Herring <robh@kernel.org>,
        Russell King <linux@armlinux.org.uk>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.8.1
Date:   Wed, 24 Jul 2019 11:23:46 -0700
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Quoting Markus Elfring (2019-07-24 06:18:35)
> > +@script:python depends on org@
> > +p1 << r.p1;
> > +@@
> > +
> > +cocci.print_main(p1)
>=20
> Will an additional message be helpful at this place?
>=20
>=20
> Will further software development considerations become more interesting
> also around a contribution like =E2=80=9CCoccinelle: Add a SmPL script for
> the reconsideration of redundant dev_err() calls=E2=80=9D?
> https://lore.kernel.org/lkml/2744a3fc-9e67-8113-1dd9-43669e06386a@web.de/
> https://lore.kernel.org/patchwork/patch/1095937/
> https://lkml.org/lkml/2019/7/1/145
> https://systeme.lip6.fr/pipermail/cocci/2019-July/006071.html
>=20

Did this patch ever get merged? It seems better to amend that patch
instead of introduce another one.

