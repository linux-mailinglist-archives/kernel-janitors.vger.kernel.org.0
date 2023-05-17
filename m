Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 28CE47060B5
	for <lists+kernel-janitors@lfdr.de>; Wed, 17 May 2023 09:06:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229769AbjEQHGH (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Wed, 17 May 2023 03:06:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43036 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229638AbjEQHGB (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 17 May 2023 03:06:01 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D1F2640EF
        for <kernel-janitors@vger.kernel.org>; Wed, 17 May 2023 00:05:57 -0700 (PDT)
Received: from moin.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::7b] helo=bjornoya.blackshift.org)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mkl@pengutronix.de>)
        id 1pzBEI-0003Y1-5h; Wed, 17 May 2023 09:05:46 +0200
Received: from pengutronix.de (unknown [172.20.34.65])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (Client did not present a certificate)
        (Authenticated sender: mkl-all@blackshift.org)
        by smtp.blackshift.org (Postfix) with ESMTPSA id 23D171C6CDD;
        Wed, 17 May 2023 07:05:44 +0000 (UTC)
Date:   Wed, 17 May 2023 09:05:43 +0200
From:   Marc Kleine-Budde <mkl@pengutronix.de>
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc:     Pavel Pisa <pisa@cmp.felk.cvut.cz>,
        Ondrej Ille <ondrej.ille@gmail.com>,
        Wolfgang Grandegger <wg@grandegger.com>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Martin Jerabek <martin.jerabek01@gmail.com>,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        linux-can@vger.kernel.org, netdev@vger.kernel.org
Subject: Re: [PATCH] can: ctucanfd: Fix an error handling path in
 ctucan_probe_common()
Message-ID: <20230517-lugged-wreckage-65f6d28379ac-mkl@pengutronix.de>
References: <4b78c848826fde1b8a3ccd53f32b80674812cb12.1684182962.git.christophe.jaillet@wanadoo.fr>
 <20230515-finisher-plating-8ab57747fea5-mkl@pengutronix.de>
 <86ff131e-c1d2-ca1f-89a4-37cec62877f4@wanadoo.fr>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="cb56oybfxv4tulij"
Content-Disposition: inline
In-Reply-To: <86ff131e-c1d2-ca1f-89a4-37cec62877f4@wanadoo.fr>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:b01:1d::7b
X-SA-Exim-Mail-From: mkl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: kernel-janitors@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org


--cb56oybfxv4tulij
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 16.05.2023 18:47:17, Christophe JAILLET wrote:
> Le 15/05/2023 =C3=A0 22:51, Marc Kleine-Budde a =C3=A9crit=C2=A0:
> > On 15.05.2023 22:36:28, Christophe JAILLET wrote:
> > > If register_candev() fails, a previous netif_napi_add() needs to be u=
ndone.
> > > Add the missing netif_napi_del() in the error handling path.
> >=20
> > What about this path:
> > free_candev(ndev) -> free_netdev() -> netif_napi_del()
> >=20
> > | https://elixir.bootlin.com/linux/v6.3.2/source/net/core/dev.c#L10714
> >=20
> > Marc
> >=20
>=20
> Ok, thanks for the review,
>=20
> so in fact this is the netif_napi_del() call in ctucan_platform_remove()
> that can be removed instead.
>=20
> Harmless, but would be more consistent.
> I'll send a patch for that.

Make it so!

regards,
Marc

--=20
Pengutronix e.K.                 | Marc Kleine-Budde          |
Embedded Linux                   | https://www.pengutronix.de |
Vertretung N=C3=BCrnberg              | Phone: +49-5121-206917-129 |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-9   |

--cb56oybfxv4tulij
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEDs2BvajyNKlf9TJQvlAcSiqKBOgFAmRkfMQACgkQvlAcSiqK
BOgosQf/XCnxCLojV+HufFxherLeMBZXjrkGa6+8BZsdUIlbCtcwNnEu9Zg2kSyH
dz6D/3L9JPbkedMiJvoExn+Rw5vMPmPLR2+uVwvUIppjZcvCXKTwzRfPx2XqeH4h
zlGG+RziMo+yxWI/zE4DIMfuTzcETxkPsceifGxIdkxKJopdXzkojo6/I2bGtjOg
ZDbrcrGy7KYHDErY0j0gKgjzsRcR0mP8wrsQJO33VtRuGnUIiOrTWysJlqzU0gt8
nH8a/Se7jgFJ6mNjGChPykhCASUDKNFxtxrSPW0yb2YIUvE2DnhbpDdkJcOFxdaU
G/BSiE3NUIIl+xF7oXOAnthhrNCBDQ==
=YZRf
-----END PGP SIGNATURE-----

--cb56oybfxv4tulij--
