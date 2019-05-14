Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E51571C380
	for <lists+kernel-janitors@lfdr.de>; Tue, 14 May 2019 08:57:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726481AbfENG5O (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Tue, 14 May 2019 02:57:14 -0400
Received: from mga04.intel.com ([192.55.52.120]:58531 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726314AbfENG5O (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 14 May 2019 02:57:14 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 13 May 2019 23:57:13 -0700
X-ExtLoop1: 1
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.13.116])
  by orsmga001.jf.intel.com with ESMTP; 13 May 2019 23:57:10 -0700
Date:   Tue, 14 May 2019 14:56:26 +0800
From:   Zhenyu Wang <zhenyuw@linux.intel.com>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Zhenyu Wang <zhenyuw@linux.intel.com>,
        Aleksei Gimbitskii <aleksei.gimbitskii@intel.com>,
        David Airlie <airlied@linux.ie>,
        intel-gfx@lists.freedesktop.org,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        kernel-janitors@vger.kernel.org,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        intel-gvt-dev@lists.freedesktop.org,
        Zhi Wang <zhi.a.wang@intel.com>
Subject: Re: [PATCH] drm/i915/gvt: Fix an error code in
 ppgtt_populate_spt_by_guest_entry()
Message-ID: <20190514065626.GK12913@zhen-hp.sh.intel.com>
Reply-To: Zhenyu Wang <zhenyuw@linux.intel.com>
References: <20190513092244.GA12077@mwanda>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="/Q1T9Q8JmUrFqdou"
Content-Disposition: inline
In-Reply-To: <20190513092244.GA12077@mwanda>
User-Agent: Mutt/1.10.0 (2018-05-17)
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org


--/Q1T9Q8JmUrFqdou
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2019.05.13 12:22:44 +0300, Dan Carpenter wrote:
> "ret" is uninitialized on this path but it should be -EINVAL.
>=20
> Fixes: 930c8dfea4b8 ("drm/i915/gvt: Check if get_next_pt_type() always re=
turns a valid value")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  drivers/gpu/drm/i915/gvt/gtt.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/i915/gvt/gtt.c b/drivers/gpu/drm/i915/gvt/gt=
t.c
> index 08c74e65836b..244ad1729764 100644
> --- a/drivers/gpu/drm/i915/gvt/gtt.c
> +++ b/drivers/gpu/drm/i915/gvt/gtt.c
> @@ -1076,8 +1076,10 @@ static struct intel_vgpu_ppgtt_spt *ppgtt_populate=
_spt_by_guest_entry(
>  	} else {
>  		int type =3D get_next_pt_type(we->type);
> =20
> -		if (!gtt_type_is_pt(type))
> +		if (!gtt_type_is_pt(type)) {
> +			ret =3D -EINVAL;
>  			goto err;
> +		}
> =20
>  		spt =3D ppgtt_alloc_spt_gfn(vgpu, type, ops->get_pfn(we), ips);
>  		if (IS_ERR(spt)) {
> --=20

Applied this, thanks!

--=20
Open Source Technology Center, Intel ltd.

$gpg --keyserver wwwkeys.pgp.net --recv-keys 4D781827

--/Q1T9Q8JmUrFqdou
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCXNpmmgAKCRCxBBozTXgY
J8PrAJ9hmMJUVJA/WcxFVYDp5dmrCIWThACfXEUodqTtaZAUTakJt7C3vBzTioI=
=FjA+
-----END PGP SIGNATURE-----

--/Q1T9Q8JmUrFqdou--
