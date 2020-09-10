Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C0BD72643BB
	for <lists+kernel-janitors@lfdr.de>; Thu, 10 Sep 2020 12:20:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727018AbgIJKUk (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Thu, 10 Sep 2020 06:20:40 -0400
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:45417 "EHLO
        out4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730588AbgIJKUI (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 10 Sep 2020 06:20:08 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.nyi.internal (Postfix) with ESMTP id 89FF35C1160;
        Thu, 10 Sep 2020 06:20:07 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Thu, 10 Sep 2020 06:20:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm3; bh=h9dKsfZElOLIOTm7Da/tNPTY10k
        5L5HmDLJR9oS3z6c=; b=ZJMp5JBxpxJwTnBBVenMqoIcLK3N4YPQRG2YS17VNWg
        iAM2clGBb6HVgzgu2hLskjDTam45Bk1Ycgb/FBYe/jnV9qn7cKLpJfJ0z4hGiJTb
        p7phTPHDH2LmFRrA7R8bK//SA5y09hPUxNHH+5B6CEhIhGRkV+8sRDqjTkVwzoa7
        f2hmyoWp3RCP+mSdbn80nx/HACHp9ejIEGHy20inte2VhCUUt7W+qQkIRU922cbZ
        63DN80T2ANrPFnFhtOGXC1miAaP5s6/NpNKHpnVlLn3MRSI5ua6NZG7+fDf/rF5T
        Km7xvpOwhlWQ7frb6LT6mFyfxxxegq6LyopPZ3JtvyQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=h9dKsf
        ZElOLIOTm7Da/tNPTY10k5L5HmDLJR9oS3z6c=; b=gxTI79L8o18xkzl7EU0Zq7
        2cak5khnE3AsY7Kgm1pA4DoXQ4S7vNYL3Lr12e/koqEf5T8yqzTuKpv70Nf0YGsl
        6VTIGTKZTBT+u/Dc+x6q0pzGLZWqQ0spqmh1XEvjLUvD5uthQ8xQt1L1kggtw0Ou
        uSPcTvL7Q1tZxNnsuvHvmg2VGs7l7sNQEjF9qcA08rH+Pi4S2VzRodlCeKpaFRdF
        plKeRk0P3CMZ/402U2QNbZobkmvOJ9rsO+jmeH+8eay6Nzyl5mhnPKwzVXcqc79r
        0bta+8ZBGCZQOHpuylfQn7qB7CziAjv3aVTgZht9pTG+c3esld/lkVxC+4fKbGtA
        ==
X-ME-Sender: <xms:1_1ZX_soTByC1OGZAVEtl7KN0PNxF-hH4pLKJnLRiuPDGKsMRqzoFw>
    <xme:1_1ZXwcRmTKYvGyvQSrox5qVifVacFnGpNqoOQfvrE4PTrqDbKPmdY1VIrGYC_eNr
    heKR3d5Q533zOysLTs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrudehjedgvddtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
    vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
    htvghrnhepleekgeehhfdutdeljefgleejffehfffgieejhffgueefhfdtveetgeehieeh
    gedunecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgepudenuc
    frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:1_1ZXyziTMw7j1jHySLH75LAQVjjh6dtBvE4dj4GIIKM_BsLvT0Caw>
    <xmx:1_1ZX-NAY_1rujcr_5_YRPfIHEDX_iWGBxhIO9utFAQMi3LLuKOOaw>
    <xmx:1_1ZX_9WFvdE_OaEnKNMrCfqltY0j-RgK_QXgW68wNo5Vsx9J0r83w>
    <xmx:1_1ZX7Z5HYRM_U4aTDt6S1-r9e8VpqaRMdGa7MQVnfZEPJsZ4yrpOw>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        by mail.messagingengine.com (Postfix) with ESMTPA id 2AD423064688;
        Thu, 10 Sep 2020 06:20:07 -0400 (EDT)
Date:   Thu, 10 Sep 2020 12:20:05 +0200
From:   Maxime Ripard <maxime@cerno.tech>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Eric Anholt <eric@anholt.duckdns.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        dri-devel@lists.freedesktop.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] drm/vc4: hdmi: Fix NULL vs IS_ERR() checks in
 vc5_hdmi_init_resources()
Message-ID: <20200910102005.puj7gscpnfczdrll@gilmour.lan>
References: <20200910100825.GC79916@mwanda>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="ry3egkt6pariiyt3"
Content-Disposition: inline
In-Reply-To: <20200910100825.GC79916@mwanda>
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org


--ry3egkt6pariiyt3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 10, 2020 at 01:08:25PM +0300, Dan Carpenter wrote:
> The devm_ioremap() function never returns error pointers, it returns
> NULL.
>=20
> Fixes: 8323989140f3 ("drm/vc4: hdmi: Support the BCM2711 HDMI controllers=
")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied, thanks!
Maxime

--ry3egkt6pariiyt3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCX1n91QAKCRDj7w1vZxhR
xVV4AQD88CcY9D0XYtm4MoYKOItUhKdUW84yZ2VzgqVPja0a8AEA6EoiURAIXd0L
ZlJXZg8kdHtpbegQw4NfyW8cwZ0oywk=
=lspq
-----END PGP SIGNATURE-----

--ry3egkt6pariiyt3--
