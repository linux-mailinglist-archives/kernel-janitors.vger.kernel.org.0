Return-Path: <kernel-janitors+bounces-165-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 80A257E1EB6
	for <lists+kernel-janitors@lfdr.de>; Mon,  6 Nov 2023 11:43:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B11341C208CF
	for <lists+kernel-janitors@lfdr.de>; Mon,  6 Nov 2023 10:43:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D40F817736;
	Mon,  6 Nov 2023 10:43:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: kernel-janitors@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD6BC156D4
	for <kernel-janitors@vger.kernel.org>; Mon,  6 Nov 2023 10:43:14 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B6A3A4
	for <kernel-janitors@vger.kernel.org>; Mon,  6 Nov 2023 02:43:13 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1qzx4T-0006mM-Gc; Mon, 06 Nov 2023 11:43:05 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qzx4S-0070Mg-UN; Mon, 06 Nov 2023 11:43:04 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qzx4S-00DYxW-L9; Mon, 06 Nov 2023 11:43:04 +0100
Date: Mon, 6 Nov 2023 11:43:04 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Dan Carpenter <dan.carpenter@linaro.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-pwm@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH v2 1/2] pwm: samsung: Fix a bit test in
 pwm_samsung_resume()
Message-ID: <20231106104304.cq6353tj5pfdffyc@pengutronix.de>
References: <e031db45-add0-4da7-97fa-dee95ee936ad@moroto.mountain>
 <20231025121103.ptck4z62wvndgdlr@pengutronix.de>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="sf7jdeeib2wrdg7j"
Content-Disposition: inline
In-Reply-To: <20231025121103.ptck4z62wvndgdlr@pengutronix.de>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: kernel-janitors@vger.kernel.org


--sf7jdeeib2wrdg7j
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Thierry,

On Wed, Oct 25, 2023 at 02:11:03PM +0200, Uwe Kleine-K=F6nig wrote:
> On Wed, Oct 25, 2023 at 02:57:34PM +0300, Dan Carpenter wrote:
> > The PWMF_REQUESTED enum is supposed to be used with test_bit() and not
> > used as in a bitwise AND.  In this specific code the flag will never be
> > set so the function is effectively a no-op.
> >=20
> > Fixes: e3fe982b2e4e ("pwm: samsung: Put per-channel data into driver da=
ta")
> > Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
>=20
> Reviewed-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>
>=20
> @Thierry: e3fe982b2e4e is currently in your for-next branch. So it would
> be good to get Dan's patch into your PR for 6.7-rc1.

I saw you updated your for-next branch but didn't add this patch yet.
Would be great to get this one in to not get a known-broken state into
6.7-rc1.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--sf7jdeeib2wrdg7j
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmVIwzcACgkQj4D7WH0S
/k6HfggAuLzuNztYJ90zdJk4FBdCGz7VtSi2zRm4cN+QJ3PRBuR1akw07gRXBBLD
D08odKKsrPo33GScRHaBPUtFEbBcKyoE5xl0pHps7pgpS+WhCHsryDrrZ4uCEqBK
7aUWFwzLUKgv/MMuFTrbhHSkK6LwMRi1vbiGO4/QlMjty8vZadE1Tx+S5Qww4Oc2
f4jDt9f74a8OWDWdygHdai3W1Xn8c/N5CZ4kV4p5BjdcaG277WwTRreEVsQAleIV
+HSEmxxib6VvUxpf7Ha8r0rnIFgrzLHfB41XajJYWw7snmr4ZVteUDnUEsJswP0T
BaJ+o4P1knAaw0z66JqRb6t+eQ9TaQ==
=Xh6W
-----END PGP SIGNATURE-----

--sf7jdeeib2wrdg7j--

