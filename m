Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D070D5F5A2D
	for <lists+kernel-janitors@lfdr.de>; Wed,  5 Oct 2022 20:54:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230518AbiJESyn (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Wed, 5 Oct 2022 14:54:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60542 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230343AbiJESyj (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 5 Oct 2022 14:54:39 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2233E1028;
        Wed,  5 Oct 2022 11:54:38 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id CBD4BB81EC9;
        Wed,  5 Oct 2022 18:54:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5BABC433C1;
        Wed,  5 Oct 2022 18:54:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1664996075;
        bh=Fv8WWLI8j/tXBN3sp2EjSI3Ee/trf7uCP8oSXWZXXi8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=PR6/0fdyNDeS86OxDD23bLnn8qmamxb7V7MckIU6WPslKMUo5PPQaXYXoHmIUbmOi
         WoLOY03djsF60NEk9qRa/ztlnDbiGJeKwRckI5HVoswHX/g0/A0aOrwODLaVhYwvsJ
         /xYP/2SwzO9PyEzaxAbZuq2HJQmfdebg60puvGaOnxWgMMP/gSwblBD4KLULgKrJx0
         3mHo3nb50kjMbwg6i05fzvP6bI5FKGIq4VwNj5zAfVSWXwMag+ieOGf2VCnwSkSY/8
         Xhj1baB1T3xZi/Ez67aS99i0IfqKmxZZCPw+2oczK2rJvHbaYcw6sR/VRnWOssybF4
         Ur4IkmOZjUBdw==
Date:   Wed, 5 Oct 2022 20:54:30 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Muhammad Usama Anjum <usama.anjum@collabora.com>
Cc:     Tharun Kumar P <tharunkumar.pasumarthi@microchip.com>,
        Kumaravel Thiagarajan <kumaravel.thiagarajan@microchip.com>,
        Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>,
        kernel@collabora.com, kernel-janitors@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: microchip: pci1xxxx: Use signed variable
Message-ID: <Yz3S5ldInNk3Ck3Y@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Muhammad Usama Anjum <usama.anjum@collabora.com>,
        Tharun Kumar P <tharunkumar.pasumarthi@microchip.com>,
        Kumaravel Thiagarajan <kumaravel.thiagarajan@microchip.com>,
        Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>,
        kernel@collabora.com, kernel-janitors@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20221004072615.550797-1-usama.anjum@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="ShG5B+tnqtc02Ay1"
Content-Disposition: inline
In-Reply-To: <20221004072615.550797-1-usama.anjum@collabora.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org


--ShG5B+tnqtc02Ay1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 04, 2022 at 12:26:15PM +0500, Muhammad Usama Anjum wrote:
> Use signed variable to store the negative values correctly to compare
> them later with negative values.
>=20
> Signed-off-by: Muhammad Usama Anjum <usama.anjum@collabora.com>

Thank you, but I appled a better fix (taking care of types) instead:

http://patchwork.ozlabs.org/project/linux-i2c/patch/20221004192715.173210-1=
-colin.i.king@gmail.com/


--ShG5B+tnqtc02Ay1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmM90uYACgkQFA3kzBSg
KbZ3tg//XG4eV9YigmyfmTEoQHQrq8oawW48UtTb29Ofoj+D4w2LFPJvXtXHZKU1
0R0tfK/+tDv1QFEWFVybDxjxlj0AFb+aBVDxfDWf1vNmoHWc4g1OU6kV4QEYY6ok
PBvzRBDOJdJmk+/d85e4fJFfUoa2h3Nsj9fcCGf+hqosY9P56U9qITMgaN4SKPAa
WBCdwpAd9DIWgnyvLQ6MMTaPqiq5MqCpkcNClUEod/L1qe/Yb7+xFZhbtvwI5BOg
X4v1hHPmx3VxP4twpOUUIiLVUQt+YO4U/EWl24++Na47kYjhR9XUayOJvf4XFEX5
sMvyEoOgWIP9W4UeLOp4y9sEFJXHntGhq7I4Dax0C00voa6xqQQvEObki8orApnd
mBfsYukOafI0tSfvtRCuiMVSorCIamYaV4TeqYYYOcsJTchd3ga+bY12mZL7opnJ
5GzO94ZQywU7RqbcayNOsv4Uksqapfbhu43HozqThHU/Tnog+PhZdWtLZy0qhrRt
OM8t/0w4sCOyaM66CRlwWXHgr5Gis/T6ycgG5WgjZg3W3lxjtc4EScZyAWX4j86F
/FNoveB3Mu05Dut/BhMprtbE4y7jtsmkGze2vum/MRZmvshhyEFvdr13YZruE/+F
bjq0HPjtWVZayw0P+7dfAqeg6EEaB/sv+Tm2y8a6sNDUArWCnU8=
=A4SE
-----END PGP SIGNATURE-----

--ShG5B+tnqtc02Ay1--
