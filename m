Return-Path: <kernel-janitors+bounces-199-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8894D7E7A11
	for <lists+kernel-janitors@lfdr.de>; Fri, 10 Nov 2023 09:24:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E510F28161A
	for <lists+kernel-janitors@lfdr.de>; Fri, 10 Nov 2023 08:24:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19DE4CA44;
	Fri, 10 Nov 2023 08:24:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MA+Z08jI"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E41EDCA73
	for <kernel-janitors@vger.kernel.org>; Fri, 10 Nov 2023 08:24:14 +0000 (UTC)
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC7A793F8;
	Fri, 10 Nov 2023 00:24:12 -0800 (PST)
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-9e62f903e88so52901866b.2;
        Fri, 10 Nov 2023 00:24:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699604651; x=1700209451; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dfDqdLzyNfvzEFCK1mMeur3z08aolTVmbywuBZUz1vU=;
        b=MA+Z08jIs82cmRdMOD5hNQXFRYVkv7x+WtSST6BHCA/1XvVS0npm11Cx0wAoJ3Gwyd
         Kqf5khoeqq+iNOG9eHm2Hwy9RRAeTKs+L/iPwhvCscXwDTPU/xEJz0WUSRRnfO9hoi3C
         NzLPIanPWiyma8Hv7/pFYQiasVKQ27Gb8OZqUwNfvc4ZPcSxkLz3ZvLyTbq3gdfed9vv
         tDGucZBVdkDjzZG8xUtgIgkmZcWyOWJyNFeKYHXWZcqu633vftdmW5pPj+3dxKG206yc
         d7qL/XUtp085VsOHM0qDTOBjP/UCWKs/2nAjEczYXuxhoLczFrs22EYAS4G0D/YQg1TP
         lWLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699604651; x=1700209451;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dfDqdLzyNfvzEFCK1mMeur3z08aolTVmbywuBZUz1vU=;
        b=o0+kSR7m63CC3fQMNkGQ97V7UampvKwGJnEriVplUNFC7wfChRLB9v8ZxOE/IOxT7s
         BMWgAiegdiRWuU8AfTY8g1fGvi6iRXGzOpkOUakyFMflkWjBR4jklebkyrYKwiITu30d
         BJBZscL6G2fZGR8/9VDQ21QsYK/owbwxy6jYopmYvSC4L17tIn7f0Eh2STNDDSzyFEIz
         V5kRf/x5M6ivdxHA6Ys7W7LtQQfinIqEkyOawC4QuURsghM0X8RcwbtdwoZtPvk2tZ/2
         6dNtoryzpc23dY0byMh1fbN+leeCQbsXLj9HykTLpbW9fG2k/IIvJKtVD5vQ9WcfJf9v
         Rx+g==
X-Gm-Message-State: AOJu0YysBg8wOrf6C0uVtcK90pmHPqukPEOg/lSPXJcFw7rRYeEQS/4b
	C7K8tjuN11K1jRiQFp762Mk=
X-Google-Smtp-Source: AGHT+IGkpJsaD7eeUdyoGD79V/8B2egxHqY2C1lshUye5coKMtJR/c8Pik98l7xCGozscEO7liUzOQ==
X-Received: by 2002:a17:907:60ca:b0:9b2:b9ff:dc35 with SMTP id hv10-20020a17090760ca00b009b2b9ffdc35mr5204085ejc.70.1699604651029;
        Fri, 10 Nov 2023 00:24:11 -0800 (PST)
Received: from orome.fritz.box (p200300e41f0fa600f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f0f:a600:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id qc20-20020a170906d8b400b009a193a5acffsm3551379ejb.121.2023.11.10.00.24.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Nov 2023 00:24:10 -0800 (PST)
Date: Fri, 10 Nov 2023 09:24:08 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Dan Carpenter <dan.carpenter@linaro.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-pwm@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH v2 1/2] pwm: samsung: Fix a bit test in
 pwm_samsung_resume()
Message-ID: <ZU3oqBduYubWPho3@orome.fritz.box>
References: <e031db45-add0-4da7-97fa-dee95ee936ad@moroto.mountain>
 <20231025121103.ptck4z62wvndgdlr@pengutronix.de>
 <20231106104304.cq6353tj5pfdffyc@pengutronix.de>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="FrW2o9lj2SGdyZ01"
Content-Disposition: inline
In-Reply-To: <20231106104304.cq6353tj5pfdffyc@pengutronix.de>
User-Agent: Mutt/2.2.12 (2023-09-09)


--FrW2o9lj2SGdyZ01
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 06, 2023 at 11:43:04AM +0100, Uwe Kleine-K=C3=B6nig wrote:
> Hello Thierry,
>=20
> On Wed, Oct 25, 2023 at 02:11:03PM +0200, Uwe Kleine-K=C3=B6nig wrote:
> > On Wed, Oct 25, 2023 at 02:57:34PM +0300, Dan Carpenter wrote:
> > > The PWMF_REQUESTED enum is supposed to be used with test_bit() and not
> > > used as in a bitwise AND.  In this specific code the flag will never =
be
> > > set so the function is effectively a no-op.
> > >=20
> > > Fixes: e3fe982b2e4e ("pwm: samsung: Put per-channel data into driver =
data")
> > > Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> >=20
> > Reviewed-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
> >=20
> > @Thierry: e3fe982b2e4e is currently in your for-next branch. So it would
> > be good to get Dan's patch into your PR for 6.7-rc1.
>=20
> I saw you updated your for-next branch but didn't add this patch yet.
> Would be great to get this one in to not get a known-broken state into
> 6.7-rc1.

Yeah, I missed this when I was skimming the list for last-minute things
to include. I've applied these now and will send a follow-up PR.

Thierry

--FrW2o9lj2SGdyZ01
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmVN6KgACgkQ3SOs138+
s6G3RhAAwpdVRWzezfhVpLWty49CIg9DegWa6IFQCTca/seHCuTVnE4tRyMuRk0a
2+eZvRyFUKBOCkI/sDov8WFZhluiOxQbboevmig/Z3yJm0grdzO2/LI7lrhTTudW
+PM8EKbPHRe8rSSlXWMXSD5Dw5Uqi2sAEFTLCcFhkCSO6cugR/U/b4k66XiNVN4D
zEPxqvoE94YyYiMVEMyIwuN0SGBlHGjXu8vdCU830FW55UP2ffYJn2Al6okn5/Y+
1nCc5Y9mr1Qv+HEsQtqGaGH2ej7UWGKzUF2ASkoGaZ/FckH7Pmucvub4ISWCIgQD
cEDH7Wc/20MR+CoLUiim71bKZo4BEMQVpbTHLK+dde42Fx+sbN/jgs2AvNZsq7Y8
1gKucOq8kraZ6EG8j7M3nj3DzID0OlrMuPSW46m3w7qz7qz0xtP6Cu6aUEuQ7wMn
858pVW9XVMihlZUi1lChwukq8FmZss9KNKFwwh5P+9RQDPABcjMzxFy7oohfTEzh
DBBz27EijR0iwdCew9si4GGTRT1Fhe1tU5OM9ocjM1Qxiq8bRZ4RpOpTcHsy8CfJ
JyDy+fayQJ4DjFkWapp0NRJjPFdhPKiaaGBluzXYBkj4TyW+S+Jy0Mr4MJmmrVAb
WJT2SS5PK880dZkCBFxIaKWYkCh1diBfM2YzngrKNkaHZlsj8jU=
=yin9
-----END PGP SIGNATURE-----

--FrW2o9lj2SGdyZ01--

