Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 402FE298A6C
	for <lists+kernel-janitors@lfdr.de>; Mon, 26 Oct 2020 11:31:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1769864AbgJZKbT (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Mon, 26 Oct 2020 06:31:19 -0400
Received: from wout5-smtp.messagingengine.com ([64.147.123.21]:50463 "EHLO
        wout5-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1769230AbgJZKbT (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 26 Oct 2020 06:31:19 -0400
X-Greylist: delayed 445 seconds by postgrey-1.27 at vger.kernel.org; Mon, 26 Oct 2020 06:31:19 EDT
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
        by mailout.west.internal (Postfix) with ESMTP id 1464F882;
        Mon, 26 Oct 2020 06:23:54 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute6.internal (MEProxy); Mon, 26 Oct 2020 06:23:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm1; bh=jc6i7Hc8w3myh56ikM0OiwRh+JM
        PRpvORY5WoqXgr78=; b=LZyueJ3DSYyiVR1GRFVcIS+SXDcYl4Rkbzpaa5jxqAw
        /Z84FilFPDAiJV10LFuUORv8rvIzyQU/Of8Kc1i4WRWbV7gYI6KuLtjMi7rtFUSr
        RAfrgX93AgYVgUSXTdD3agnfKx9/+JE7JCpTB6jSgBBuSscyP03zHx58FTjqRtKH
        guQONG3NStL315XYRXfp/diTgq7DswxdapPeBXTT9LxSeMltah7nHfoS6SIb1u/R
        EmkcBd1J6X1dNjo5yZhEBKSP1WF4BVOvSmzzDGVVFcyJGIs9lmQrYJd7SQRjNDPM
        3n6yOqmUH+MzuhJwYNx7XsPUFMNx8CKRhecIpqk6DKw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=jc6i7H
        c8w3myh56ikM0OiwRh+JMPRpvORY5WoqXgr78=; b=eLfMoa7qh8ojvsC6dFwsS9
        tc7BicTJnn3TMgEyh6A2hIs3Zc7xE+h00PejrpVvB2VRHZEqKaDkXy1cpUEcz593
        7g/PbI3jY/IatwRlxqTNDHi+Q273EnA4CQ9fF5s8y5FkCC7Z3JjQGDo+WvAKaTwt
        yQItavrGzSVSo5VgffoBqoVjMx4Mex239zBhNV6Og9yK0JfXsEC8O0yUBD+Yc4kP
        QcTnO/XujJfqc2tULntawvizllxFSsQCO089jZCn6U9zmCf/Ueia5pDKeGCP/CSV
        AXRp2SlBdlq3Ek4gPmINMownmJ2EEgJhuWrYNljqgTtZ61YwOUd7bhJYwdPVF8aA
        ==
X-ME-Sender: <xms:uKOWX9sjjsR41ZYWiNluL1-hYos7mqyMDTy0uioIL00HZR-aviiftw>
    <xme:uKOWX2cilqS2dy8NeA4zXmVy6TyUr1wLRDyt5bSFQ8rf1CQ9ZQVubnDTpnZwPMTmd
    L0MN2o5cb2TBb72vHI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrkeeigdduhecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihimhgv
    ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
    gvrhhnpeelkeeghefhuddtleejgfeljeffheffgfeijefhgfeufefhtdevteegheeiheeg
    udenucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpedtnecurf
    grrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:uKOWXwyIKfcLsgZngEA7d96oEKO5MMKDva0B15Kd4Up4WpjhCydLIQ>
    <xmx:uKOWX0Mh3aQGQRDE-ryFbh3RQKvczjgb_q706vTDL5-Hdvs7NvO4hg>
    <xmx:uKOWX98fEd7dmdobpFFCFLPeJFgBo5pRPyCLCUuRHD9nq3I7JPJG6w>
    <xmx:uaOWX4bRnIE8TjRPBOWI7r9m4wrSkMaMjXZCBdt4RM8mopi6tGeP4A>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        by mail.messagingengine.com (Postfix) with ESMTPA id 988B13064680;
        Mon, 26 Oct 2020 06:23:52 -0400 (EDT)
Date:   Mon, 26 Oct 2020 11:23:51 +0100
From:   Maxime Ripard <maxime@cerno.tech>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Eric Anholt <eric@anholt.duckdns.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        David Airlie <airlied@linux.ie>,
        kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH resend] drm/v3d: Fix double free in v3d_submit_cl_ioctl()
Message-ID: <20201026102351.yhiuuklu6q5xba6k@gilmour.lan>
References: <20191024205306.GA14416@mwanda>
 <20201026094905.GA1634423@mwanda>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="wqc7vvjf6t3frdq3"
Content-Disposition: inline
In-Reply-To: <20201026094905.GA1634423@mwanda>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org


--wqc7vvjf6t3frdq3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 26, 2020 at 12:49:05PM +0300, Dan Carpenter wrote:
> Originally this error path used to leak "bin" but then we accidentally
> applied two separate commits to fix it and ended up with a double free.
>=20
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> Resending a year later because it was confusing at the time who should
> apply this and it fell through the cracks.  For some reason the kbuild
> bot flagged it as a new warning so it showed up on my radar again.

Applied, thanks!
Maxime

--wqc7vvjf6t3frdq3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCX5ajtwAKCRDj7w1vZxhR
xbsOAP9+wXjpnneXqYX/IW1SAYx+BadjnZcNpZ81x9nrkrL2bAEAvKpyfpvc/yGA
RYGsUWFVwQTl/qoRUSzoFkNmeBsYrAg=
=yJd/
-----END PGP SIGNATURE-----

--wqc7vvjf6t3frdq3--
