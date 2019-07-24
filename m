Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4009773678
	for <lists+kernel-janitors@lfdr.de>; Wed, 24 Jul 2019 20:22:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387403AbfGXSV5 (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Wed, 24 Jul 2019 14:21:57 -0400
Received: from mail-pl1-f171.google.com ([209.85.214.171]:45660 "EHLO
        mail-pl1-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726698AbfGXSV5 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 24 Jul 2019 14:21:57 -0400
Received: by mail-pl1-f171.google.com with SMTP id y8so22321956plr.12
        for <kernel-janitors@vger.kernel.org>; Wed, 24 Jul 2019 11:21:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=message-id:mime-version:content-transfer-encoding:in-reply-to
         :references:subject:to:cc:from:user-agent:date;
        bh=STM42I/99+hliAUzw485JNYg3BolU1kKr1GKH8Q1t9I=;
        b=IWAnfb2ugCtB1EBhfQSgHsGQsUEsxIqW7A7ukiDBQvQT5Me0WMINTtmbfEzCHy0wc4
         I3Y6tctNtmhFT8lD70VthrwItZZw3HgLyfzMucpvqm5hEPoKxBVuOktErIXGlOUIUzsm
         pxk83Ri/IIHLUxYTSWGkZz2k0uoYv5nMp12tY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:mime-version
         :content-transfer-encoding:in-reply-to:references:subject:to:cc:from
         :user-agent:date;
        bh=STM42I/99+hliAUzw485JNYg3BolU1kKr1GKH8Q1t9I=;
        b=pbG1gF5T+Yic9B5myTm/cpDV4P5/0AfyARcOYrQvwW+pxlUl6admIPMJ5CNAPJkyEe
         qC5gEnqWZrCD2X5gxlTPD8KZa3W8RqYNhynewCQ5Fdem+rEbPlCUkRJeYwHQIzYmLIe1
         QLJBzTujW3Qi5IWJ1Ah87up51TAQy00QmpHvY/HAKlpdyk9g6p8mAEKujrR9aEx0ZFQN
         K3nnoT/spuqtttxKaMmLX/eVk/m4XuE0MgA3IMSgiT91zdOtzguYl3cocTXM85Wgt2kV
         jF2nEmsXgYO2+l327G8J2g9jrNVUpGPMJlXToZ7wFsa6MxUftjUl3uwygcpZ1nzgHosq
         INgQ==
X-Gm-Message-State: APjAAAUCZ0DsUfNhDKNjaOwxTXJzpnOAAOzdC73gQDo3jIB5TZ6csKTT
        KmjOmqw7gCkDs/4BH6fk9d6DHw==
X-Google-Smtp-Source: APXvYqwHS2YQ0e8I05dRILy8sF+cOXkqamKTErem/TXY2mRfrUuw1ajiREW82Lm7aKcyrNj9x3L0Cg==
X-Received: by 2002:a17:902:be03:: with SMTP id r3mr88009941pls.156.1563992516692;
        Wed, 24 Jul 2019 11:21:56 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id e6sm53313708pfn.71.2019.07.24.11.21.55
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Wed, 24 Jul 2019 11:21:55 -0700 (PDT)
Message-ID: <5d38a1c3.1c69fb81.2b26a.b585@mx.google.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <c98b8f50-1adf-ea95-a91c-ec451e9fefe2@web.de>
References: <20190723181624.203864-4-swboyd@chromium.org> <c98b8f50-1adf-ea95-a91c-ec451e9fefe2@web.de>
Subject: Re: [PATCH v4 3/3] coccinelle: Add script to check for platform_get_irq() excessive prints
To:     Markus Elfring <Markus.Elfring@web.de>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Nicolas Palix <nicolas.palix@imag.fr>, cocci@systeme.lip6.fr,
        kernel-janitors@vger.kernel.org
Cc:     Gilles Muller <Gilles.Muller@lip6.fr>,
        Julia Lawall <Julia.Lawall@lip6.fr>,
        linux-kernel@vger.kernel.org, Andrzej Hajda <a.hajda@samsung.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Javier Martinez Canillas <javierm@redhat.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
        Russell King <linux@armlinux.org.uk>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.8.1
Date:   Wed, 24 Jul 2019 11:21:54 -0700
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Quoting Markus Elfring (2019-07-24 02:30:16)
> I would prefer to concentrate the usage of SmPL disjunctions on changing
> implementation details so that the specification of duplicate code
> can be avoided.
>=20
>=20
> > +(
> > +platform_get_irq(E, ...)
> > +|
> > +platform_get_irq_byname(E, ...)
> > +);
>=20
> Function names:
>=20
> +(platform_get_irq
> +|platform_get_irq_byname
> +)(E, ...);
>=20
>=20
> > +if ( \( ret < 0 \| ret <=3D 0 \) )
>=20
> Comparison operators:
>=20
> +if (ret \( < \| <=3D \) 0)
>=20

Thanks. Will fold the above two in.

>=20
> > +if (ret !=3D -EPROBE_DEFER)
>=20
> Is it appropriate to treat this error code check as optional
> by the shown transformation approach?
> Can this case distinction be omitted?

I don't know what you mean here. Do you want me to drop this part so
that EPROBE_DEFER checks don't get removed?

