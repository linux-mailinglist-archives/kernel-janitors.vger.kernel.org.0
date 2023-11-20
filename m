Return-Path: <kernel-janitors+bounces-334-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 25C917F0CD4
	for <lists+kernel-janitors@lfdr.de>; Mon, 20 Nov 2023 08:25:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A12B0B20EB7
	for <lists+kernel-janitors@lfdr.de>; Mon, 20 Nov 2023 07:25:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B41C463D4;
	Mon, 20 Nov 2023 07:25:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: kernel-janitors@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF29CAA
	for <kernel-janitors@vger.kernel.org>; Sun, 19 Nov 2023 23:25:30 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1r4yeo-00057c-1y; Mon, 20 Nov 2023 08:25:22 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1r4yen-00AIZo-1F; Mon, 20 Nov 2023 08:25:21 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1r4yem-0049UU-Ny; Mon, 20 Nov 2023 08:25:20 +0100
Date: Mon, 20 Nov 2023 08:25:17 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	NXP Linux Team <linux-imx@nxp.com>,
	linux-arm-kernel@lists.infradead.org,
	kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org
Subject: Re: [PATCH] serial: imx: convert not to use
 dma_request_slave_channel()
Message-ID: <20231120072517.7b22ghddzs2w2w36@pengutronix.de>
References: <a46b493c6b5cfa09417e3e138e304fd01b61e748.1700410346.git.christophe.jaillet@wanadoo.fr>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="4eph6aoa3f7dk5an"
Content-Disposition: inline
In-Reply-To: <a46b493c6b5cfa09417e3e138e304fd01b61e748.1700410346.git.christophe.jaillet@wanadoo.fr>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: kernel-janitors@vger.kernel.org


--4eph6aoa3f7dk5an
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Christophe,

I didn't look at the patch, but only noticed the Subject while browsing
my mail. In my (German) ear the sentence is broken. I'd do

	s/not to/to not/

(Not converting the driver could also be an empty patch :-)

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--4eph6aoa3f7dk5an
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmVbCd0ACgkQj4D7WH0S
/k6XJwf9FLhqB6dJ+NKyS2zYYu1CXC78TdfsG/Ct8GT4IvlI4pvClIA58mkVSbre
K2/C9v9woHDO0vfRXy/8BJr4eM+qAsC8FkCcQK15TVdCb3FpfAZPIElh5EHY4DL7
yaqwpY5i9CmeG6yip9vww2D/0jcNb7F5gjv6znQFzn/8xXXaz4rw5BDaLXrMPtUu
mKdkla0yUbXURFnZNsK3A3XBoqOzPsejKjUmUzMavf69x1lUkZcAn/4DhER8rjVm
3mxiuwpdF3/sSu5QCLplvFKhGTAn2ew6u4yCtKlLnxNWEVnk+CNktcYt1hrG9C4B
PjV2VzGX/OZkUEnz3/PXLtMjbgRqBw==
=bLaO
-----END PGP SIGNATURE-----

--4eph6aoa3f7dk5an--

