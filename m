Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 09AB973671
	for <lists+kernel-janitors@lfdr.de>; Wed, 24 Jul 2019 20:17:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728144AbfGXSRz (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Wed, 24 Jul 2019 14:17:55 -0400
Received: from mail-pl1-f194.google.com ([209.85.214.194]:33149 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727284AbfGXSRy (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 24 Jul 2019 14:17:54 -0400
Received: by mail-pl1-f194.google.com with SMTP id c14so22258557plo.0
        for <kernel-janitors@vger.kernel.org>; Wed, 24 Jul 2019 11:17:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=message-id:mime-version:content-transfer-encoding:in-reply-to
         :references:subject:to:cc:from:user-agent:date;
        bh=64VEudo8O/wtH6l4p/XqXhB+pkLzJ9hf6Gzrj+C81S4=;
        b=Qqasr8OYtknXSmYcgeOfBomaYAOs40Q5Ji/pPOYAb/xkQlK3p9Gh8ZUGJjbEakX0jm
         g+ZZ6Yxbipzny57R8nL5nQc6QxHagLdlNyaQa8mgzJ2diBAvX+FItnpgFRw50+IdKjLn
         0ZN2vv+ALhyJy/kDcEn/nplL4ev46fxTMjuTg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:mime-version
         :content-transfer-encoding:in-reply-to:references:subject:to:cc:from
         :user-agent:date;
        bh=64VEudo8O/wtH6l4p/XqXhB+pkLzJ9hf6Gzrj+C81S4=;
        b=VpqVitQEPHpap987mSlXX6Hew26uqbS3jZKC0DY50t0eUErzqmP7keY0Lrb8STyZfN
         KZnFnJJpebVKOlN7hIIzhiFbe991FgNcUgegGoEaVbvKAkXPQ+eIluSG0bnTMmyzAztu
         NOKAK3kUT/mlEZyC/EYbnBH2oGtcI+e3FQf0PTaAi1eqtdBhtokGMA5d318fr8iX1sqj
         yIu1p07ugpEwFbQM1mjEnxNeozvz9847Uqc9ru2P/OFHp4L29gCvy6xSD5MvrPmVsR/f
         uz2kSHp7FSy7jcs3Di7krj4GL574PcmrTERtwfOtqbe0XVJHqaJWDY6r1C0a6mau/iAx
         3udQ==
X-Gm-Message-State: APjAAAWdz66dot4v2FNHlUTYnhQcaG14yDXpkAnnEGzotd3EiiwfIl3o
        a+PXXbkjJEL7OAYPYH8o8LWpgw==
X-Google-Smtp-Source: APXvYqxK0qMUscVeGe+4+IEh/oz8xs62peAkQnZxB09uo26n6J6UINiNUvD9t4Qbbh70TRdYbsyTkA==
X-Received: by 2002:a17:902:684:: with SMTP id 4mr87320935plh.138.1563992274074;
        Wed, 24 Jul 2019 11:17:54 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id p15sm44575510pjf.27.2019.07.24.11.17.53
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Wed, 24 Jul 2019 11:17:53 -0700 (PDT)
Message-ID: <5d38a0d1.1c69fb81.4e830.7802@mx.google.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <d12a32e6-fd82-71f8-c320-ea6e844db3f4@web.de>
References: <20190723181624.203864-2-swboyd@chromium.org> <d12a32e6-fd82-71f8-c320-ea6e844db3f4@web.de>
Subject: Re: [PATCH v4 1/3] driver core: platform: Add an error message to platform_get_irq*()
To:     "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Markus Elfring <Markus.Elfring@web.de>,
        kernel-janitors@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, Andrzej Hajda <a.hajda@samsung.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Javier Martinez Canillas <javierm@redhat.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
        Russell King <linux@armlinux.org.uk>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.8.1
Date:   Wed, 24 Jul 2019 11:17:52 -0700
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Quoting Markus Elfring (2019-07-24 08:00:43)
> > Let's consolidate all these error messages into the API itself,
> > allowing us to get rid of the error messages in each driver.
>=20
> Such information from the commit descriptions sounds positive.
>=20
>=20
> > +++ b/drivers/base/platform.c
> =E2=80=A6
> > @@ -163,6 +158,22 @@ int platform_get_irq(struct platform_device *dev, =
unsigned int num)
> =E2=80=A6
> > +/**
> > + * platform_get_irq - get an IRQ for a device
> > + * @dev: platform device
> > + * @num: IRQ number index
> > + */
>=20
> Do you find the provided description for the programming interface
> really sufficient then?
> Would it be more helpful to indicate the existence of an appropriate erro=
r message
> also in this software documentation (besides the C source code)?
>=20

Sure. I'll add some more documentation in this patch too so that
developers can easily see that they shouldn't print an error message
themselves.

