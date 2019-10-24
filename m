Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 20B9CE3ED6
	for <lists+kernel-janitors@lfdr.de>; Fri, 25 Oct 2019 00:10:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730188AbfJXWKB (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Thu, 24 Oct 2019 18:10:01 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:48645 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730093AbfJXWKB (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 24 Oct 2019 18:10:01 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 46zhHm5lwFz9sPV;
        Fri, 25 Oct 2019 09:09:56 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1571954999;
        bh=4Y38mloP/COkWRlmk8I38YGK2MWQcjBMKZ2IaNZo8ek=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=fY8Flu4ZPj0Fe1ewyMcKa9lBkhdktoPridKY+P8mSIXMBdPm8CbZVDYBkSIbrcDS5
         dMeMf4iK3s4uWKexu1Or02U4awvwoKq/N9Bis12dvwdJi+DpHrYjVVe1Y7IrhshJbV
         ns2NKaYoSio330wdjcnh2cbpeYfxV5ue4zD9q5f2vWpDcwkMhsHBmScFTCvKcZlW+X
         2By8v0ONn2tVU+iTDafwe3/eS/KlN6oU3H2Vq9nXs2ocX77dRscwQof1VHm4BnE02e
         E0wUtV2sgJpWTiZGTqFkr0sEIoBoBxKVa8Vwmfjad/2JSVTi1a4sto18pelkIBfsxL
         89Olhsuqz6p9A==
Date:   Fri, 25 Oct 2019 09:09:56 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Eric Anholt <eric@anholt.net>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        dri-devel@lists.freedesktop.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] drm/v3d: Fix double free in v3d_submit_cl_ioctl()
Message-ID: <20191025090956.0bd40095@canb.auug.org.au>
In-Reply-To: <20191024205306.GA14416@mwanda>
References: <20191024205306.GA14416@mwanda>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/4bVL9=DKNMyJYmPOU7U_Uo9";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

--Sig_/4bVL9=DKNMyJYmPOU7U_Uo9
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Dan,

On Thu, 24 Oct 2019 23:53:06 +0300 Dan Carpenter <dan.carpenter@oracle.com>=
 wrote:
>
> Originally this error path used to leak "bin" but then we accidentally
> applied two separate commits to fix it and ended up with a double free.
>=20
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> Hi Stephen,
>=20
> I think this one is actually just a linux-next issue and the Fixes tag
> would point to commit f8593384f83f ("Merge remote-tracking branch
> 'drm/drm-next'").
>=20
> The original commits are 0d352a3a8a1f ("drm/v3d: don't leak bin job if
> v3d_job_init fails.") and commit 29cd13cfd762 ("drm/v3d: Fix memory leak
> in v3d_submit_cl_ioctl").
>=20
> I'm not totally sure how you guys address this normally but presumably
> you are experts at dealing with merge issues.  :)
>=20
>  drivers/gpu/drm/v3d/v3d_gem.c | 1 -
>  1 file changed, 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/v3d/v3d_gem.c b/drivers/gpu/drm/v3d/v3d_gem.c
> index 549dde83408b..37515e47b47e 100644
> --- a/drivers/gpu/drm/v3d/v3d_gem.c
> +++ b/drivers/gpu/drm/v3d/v3d_gem.c
> @@ -568,7 +568,6 @@ v3d_submit_cl_ioctl(struct drm_device *dev, void *dat=
a,
>  		ret =3D v3d_job_init(v3d, file_priv, &bin->base,
>  				   v3d_job_free, args->in_sync_bcl);
>  		if (ret) {
> -			kfree(bin);
>  			v3d_job_put(&render->base);
>  			kfree(bin);
>  			return ret;

I will just apply this as part of the drm tree merge until Dave merges
the drm-misc-fixes tree and fixes this up.

--=20
Cheers,
Stephen Rothwell

--Sig_/4bVL9=DKNMyJYmPOU7U_Uo9
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl2yITQACgkQAVBC80lX
0Gyd1Qf+PWEOF9qVO5Oz4D2TfN8Rw7FAJzMQ0OsgJocCWOaCH86/U9vQHCPIutvG
JOZLbYWP0v8pmE3XEGptNvUekQkGx3Gv6DZpxd/4dcf4Vb7PeWCpqt8d3sOpIRIu
oImlR7EbrSULvhR5OkP2KHycdv8Dn++J3xHB9hu/RDR/Krux7wqO8su/+/XeoApW
3AJ8ngwnlMYi6lkVXPx1AAXSY5PPiydcSdMR0bjbJ19jze42OADd8lNbaNaG5Hup
O39J5G3gHaKZOWVb8dH3FJoMkf1INplG+R+hx55fRoKQZEE7L0QNaUv8UqnkiIBn
2htAbc7tE3h3nBRgTDnpbJRDWYYUWA==
=JGmF
-----END PGP SIGNATURE-----

--Sig_/4bVL9=DKNMyJYmPOU7U_Uo9--
