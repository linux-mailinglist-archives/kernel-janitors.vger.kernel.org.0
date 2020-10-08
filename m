Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5F40F2871B3
	for <lists+kernel-janitors@lfdr.de>; Thu,  8 Oct 2020 11:38:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729207AbgJHJiH (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Thu, 8 Oct 2020 05:38:07 -0400
Received: from mx2.suse.de ([195.135.220.15]:33274 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726019AbgJHJiH (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 8 Oct 2020 05:38:07 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id F004EABC1;
        Thu,  8 Oct 2020 09:38:05 +0000 (UTC)
Message-ID: <ba10795b535daf1b430db97d3b1388c7407f0058.camel@suse.de>
Subject: Re: [PATCH v2] staging: vchiq: Fix list_for_each exit tests
From:   Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Marcelo Diop-Gonzalez <marcgonzalez@google.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Jamal Shareef <jamal.k.shareef@gmail.com>,
        Stefan Wahren <stefan.wahren@i2se.com>,
        bcm-kernel-feedback-list@broadcom.com,
        linux-rpi-kernel@lists.infradead.org, devel@driverdev.osuosl.org,
        kernel-janitors@vger.kernel.org
Date:   Thu, 08 Oct 2020 11:38:04 +0200
In-Reply-To: <20201006134748.GA2076872@mwanda>
References: <20201006134748.GA2076872@mwanda>
Content-Type: multipart/signed; micalg="pgp-sha256";
        protocol="application/pgp-signature"; boundary="=-bJZNEHK0zokYDxMMYOJM"
User-Agent: Evolution 3.36.5 
MIME-Version: 1.0
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org


--=-bJZNEHK0zokYDxMMYOJM
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2020-10-06 at 16:47 +0300, Dan Carpenter wrote:
> After a list_for_each_entry() loop, the list iterator is always non-NULL
> so these conditions don't work.  If the "waiter" is not found then this
> results in an out of bounds access.
>=20
> I have fixed it by introducing a new "found" variable.  In one case, I
> used an else statement for readability.
>=20
> Fixes: 46e4b9ec4fa4 ("staging: vchiq_arm: use list_for_each_entry when ac=
cessing bulk_waiter_list")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---

Reviewed-by: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>


--=-bJZNEHK0zokYDxMMYOJM
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEErOkkGDHCg2EbPcGjlfZmHno8x/4FAl9+3fwACgkQlfZmHno8
x/577Qf/daJSMYN1mVGd6kbFmgeUNSamil+eQQmoE3RQSpYvT4Z7pCUFg7RggER3
0aRrcagMt0mZ2qrQdr+CEEMz2Xx9nK9s/bn1HX1QqyTpitm3zDCIDqlpqLBy8bBU
tI8Ba6sFktxj4wS4bahtGG8vQvYQDu9shuip+8jUDNqLj9ufp6rhMpDuiyPfXrKj
4IMs8tohRI6eED/MvLrTqg6hjjZOPYDH7brsszdoJqf4OjPA7Od9VkErR439zkaZ
G5REV/XkIShJo5IOf+toT6IAEl7eDR8xzKr2goe7hN+miLVoKtd22uM05NWINBnI
uavRa8OK57hu/cZVUcEB2PgavmZjBA==
=45fL
-----END PGP SIGNATURE-----

--=-bJZNEHK0zokYDxMMYOJM--

