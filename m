Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CEBBB86F0C
	for <lists+kernel-janitors@lfdr.de>; Fri,  9 Aug 2019 03:02:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405051AbfHIBCn (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Thu, 8 Aug 2019 21:02:43 -0400
Received: from mga11.intel.com ([192.55.52.93]:56680 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725785AbfHIBCn (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 8 Aug 2019 21:02:43 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 08 Aug 2019 18:02:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,363,1559545200"; 
   d="asc'?scan'208";a="258892297"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.13.116])
  by orsmga001.jf.intel.com with ESMTP; 08 Aug 2019 18:02:40 -0700
Date:   Fri, 9 Aug 2019 08:58:40 +0800
From:   Zhenyu Wang <zhenyuw@linux.intel.com>
To:     Chris Wilson <chris@chris-wilson.co.uk>
Cc:     Dan Carpenter <dan.carpenter@oracle.com>,
        Xiong Zhang <xiong.y.zhang@intel.com>,
        Zhenyu Wang <zhenyuw@linux.intel.com>,
        David Airlie <airlied@linux.ie>,
        intel-gfx@lists.freedesktop.org, kernel-janitors@vger.kernel.org,
        dri-devel@lists.freedesktop.org,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        intel-gvt-dev@lists.freedesktop.org,
        Zhi Wang <zhi.a.wang@intel.com>
Subject: Re: [PATCH] drm/i915: Use after free in error path in
 intel_vgpu_create_workload()
Message-ID: <20190809005840.GA7032@zhen-hp.sh.intel.com>
Reply-To: Zhenyu Wang <zhenyuw@linux.intel.com>
References: <20190808103236.GB30506@mwanda>
 <156526106102.20411.17520131390381233492@skylake-alporthouse-com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="FCuugMFkClbJLl1L"
Content-Disposition: inline
In-Reply-To: <156526106102.20411.17520131390381233492@skylake-alporthouse-com>
User-Agent: Mutt/1.10.0 (2018-05-17)
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org


--FCuugMFkClbJLl1L
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2019.08.08 11:44:21 +0100, Chris Wilson wrote:
> Quoting Dan Carpenter (2019-08-08 11:32:36)
> > We can't free "workload" until after the printk or it's a use after
> > free.
> >=20
> > Fixes: 2089a76ade90 ("drm/i915/gvt: Checking workload's gma earlier")
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>=20
> That's the simpler patch,
> Reviewed-by: Chris Wilson <chris@chris-wilson.co.uk>

Thanks a lot, will queue this up.

--=20
Open Source Technology Center, Intel ltd.

$gpg --keyserver wwwkeys.pgp.net --recv-keys 4D781827

--FCuugMFkClbJLl1L
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCXUzFQAAKCRCxBBozTXgY
J5EAAJkBRaKvljSknayoIbjCoWwSQK+1XgCeKPC2dx9VcLD8Sd9OLXGHqHyWtS8=
=O1aB
-----END PGP SIGNATURE-----

--FCuugMFkClbJLl1L--
