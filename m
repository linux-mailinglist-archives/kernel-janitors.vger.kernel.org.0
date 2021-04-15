Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9C5F8360856
	for <lists+kernel-janitors@lfdr.de>; Thu, 15 Apr 2021 13:35:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232524AbhDOLfd (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Thu, 15 Apr 2021 07:35:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56504 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230056AbhDOLfd (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 15 Apr 2021 07:35:33 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 01EF9C061574
        for <kernel-janitors@vger.kernel.org>; Thu, 15 Apr 2021 04:35:09 -0700 (PDT)
Received: from gallifrey.ext.pengutronix.de ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=bjornoya.blackshift.org)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mkl@pengutronix.de>)
        id 1lX0H4-0004Ji-90; Thu, 15 Apr 2021 13:35:06 +0200
Received: from pengutronix.de (unknown [IPv6:2a03:f580:87bc:d400:983:856d:54dc:ee1c])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (Client did not present a certificate)
        (Authenticated sender: mkl-all@blackshift.org)
        by smtp.blackshift.org (Postfix) with ESMTPSA id 4081960F62E;
        Thu, 15 Apr 2021 11:35:03 +0000 (UTC)
Date:   Thu, 15 Apr 2021 13:35:02 +0200
From:   Marc Kleine-Budde <mkl@pengutronix.de>
To:     Colin King <colin.king@canonical.com>
Cc:     Wolfgang Grandegger <wg@grandegger.com>,
        "David S . Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>,
        Vincent Mailhol <mailhol.vincent@wanadoo.fr>,
        Arunachalam Santhanam <arunachalam.santhanam@in.bosch.com>,
        linux-can@vger.kernel.org, netdev@vger.kernel.org,
        kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH][next] can: etas_es58x: Fix a couple of spelling mistakes
Message-ID: <20210415113502.onga2bsnb3iwtenh@pengutronix.de>
References: <20210415113050.1942333-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="vjzv32frs7mxesai"
Content-Disposition: inline
In-Reply-To: <20210415113050.1942333-1-colin.king@canonical.com>
X-SA-Exim-Connect-IP: 2001:67c:670:201:5054:ff:fe8d:eefb
X-SA-Exim-Mail-From: mkl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: kernel-janitors@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org


--vjzv32frs7mxesai
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 15.04.2021 12:30:50, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
>=20
> There are spelling mistakes in netdev_dbg and netdev_dbg messages,
> fix these.
>=20
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied to linux-can-next/testing.

Tnx,
Marc

--=20
Pengutronix e.K.                 | Marc Kleine-Budde           |
Embedded Linux                   | https://www.pengutronix.de  |
Vertretung West/Dortmund         | Phone: +49-231-2826-924     |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-5555 |

--vjzv32frs7mxesai
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEK3kIWJt9yTYMP3ehqclaivrt76kFAmB4JOMACgkQqclaivrt
76nlqQf+N6mHncWWGn2F1Ui0prby17+RS+qSvnFNoRu7Pvx0CDKttRj/vdXCeYfK
aQtqtzNSxxe3xLThQzgSf6sRWRj75n23437zw7gOxz0blanvE3yHVKOkuUplw60Z
0OYm37Ip3vwoyF6PrYc5nLPwUc342Qu7tXRvM4Nc/2W7HW5PwUcA+gDj1e7NScnn
ZE+4Hufl40ugyMtF8eFdUqjY01t342nVGnR8i3dOR1+3Q77kMvXyXTXCadXKDS4c
V3NLyFjXA3WX96e0IBh0Aq/dpp++iWUK/hKCWCw8bmlF73UiN3WiXO/07/FkUbhC
gXdKzjltFfIWoS0UODH00dHyOqXnEQ==
=t83b
-----END PGP SIGNATURE-----

--vjzv32frs7mxesai--
