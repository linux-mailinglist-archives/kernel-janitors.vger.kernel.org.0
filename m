Return-Path: <kernel-janitors+bounces-8884-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B5E3FB1E803
	for <lists+kernel-janitors@lfdr.de>; Fri,  8 Aug 2025 14:10:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C4263563AB8
	for <lists+kernel-janitors@lfdr.de>; Fri,  8 Aug 2025 12:10:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62B2D27602E;
	Fri,  8 Aug 2025 12:10:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QW/bLZ98"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB78B1E51E1;
	Fri,  8 Aug 2025 12:10:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754655029; cv=none; b=rZFDkcC16bdC3VqKdhdrxUdoBC82CgLcE2Vk3v+c2oGf3yxPmVHaRN15gt/Ws8iIdEBVmn0l6ftozRGNA+VMQDPiN3HKwoiLbWtu6YvOeRFQS/dSx8b/Z2lyE22QWde3a+2hGLlOkJBVeF67Awj+62GuKA+sQreNi40vMp2nT38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754655029; c=relaxed/simple;
	bh=hp4rqAiFCt5lwwd25Hgflr1TBa/scWIpW6Aj/Q47xZg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JQRwUL+E19z69QqnfT/KFe3CqHYC2ULOXGO8aMoYWdV9YM9E9eYJOBjYX4J2Eph34nsQBrXQO6dnHlLRNny+NNnbul4btLZt9bO0UFraNz4+L/lUG2tFc9mC2Ju9iRy5sfiYEwFHR6vHdXsnipWv++2ePIxBNQZwMVgf75cQW8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QW/bLZ98; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9EDDFC4CEED;
	Fri,  8 Aug 2025 12:10:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754655029;
	bh=hp4rqAiFCt5lwwd25Hgflr1TBa/scWIpW6Aj/Q47xZg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QW/bLZ98labLEvtZ64TZa4BtaafaQTPq0BAzENHzPEBRm8ib5q5ADzEWfHrd+WXIg
	 knEO6UyrH7NrX1fXgotpITtFeOblo7y5JpfWUSGJBT8q7fs8wbfo19ly2iUAUnEjgI
	 v57Zm2XygywYmDYL424Celb4Z+RCBAl5T/9Z3vIIE4kkjvwz7es6F7kOE5vnHEn1+1
	 YFcL5OgZlAzlCvBSH0FHIAF32PHs4wZbwRq3LBmG24MYsljwg8rZiraYtbWd1iz8HD
	 nfAH03xnV2nmj4jYbbyWtd7Hhcc47bdfdk2q6rSUy45Lmts+9az8dXDWToxiiaSxRy
	 9H60uLKbRnOzg==
Date: Fri, 8 Aug 2025 13:10:24 +0100
From: Mark Brown <broonie@kernel.org>
To: "Colin King (gmail)" <colin.i.king@gmail.com>
Cc: Kiseok Jo <kiseok.jo@irondevice.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org, kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH][next] ASoC: codec: sma1307: replace spelling mistake
 with new error message
Message-ID: <91c874a0-5897-4019-ac35-e34187382061@sirena.org.uk>
References: <20250808105324.829883-1-colin.i.king@gmail.com>
 <f646f36e-7835-415d-8da7-fc632c57e4e2@sirena.org.uk>
 <bb06d3bf-684b-4479-8b86-72aed622e453@gmail.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="FpBC8UcrkcOVUKr5"
Content-Disposition: inline
In-Reply-To: <bb06d3bf-684b-4479-8b86-72aed622e453@gmail.com>
X-Cookie: What an artist dies with me!


--FpBC8UcrkcOVUKr5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Aug 08, 2025 at 12:35:40PM +0100, Colin King (gmail) wrote:
> On 08/08/2025 12:30, Mark Brown wrote:
> > On Fri, Aug 08, 2025 at 11:53:24AM +0100, Colin Ian King wrote:

> > > -		dev_err(sma1307->dev, "%s: failed by dismatch \"%s\"\n",
> > > +		dev_err(sma1307->dev, "%s: checksum failed \"%s\"\n",

> > It's definitely an unusual term and the reword makes sense but that does
> > make sense to me as a word, I don't think it's a spelling error as such.

> "Dismatch" is not a standard English word. It's likely a misspelling of
> "mismatch" or a neologism formed by adding the prefix "dis-" to "match". I
> understand it a niche term, I just think it is preferable not to use it for
> folk who's first language isn't English.

My comment was specifically that it doesn't look like a spelling
mistake.

--FpBC8UcrkcOVUKr5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmiV6TAACgkQJNaLcl1U
h9ALFwf7BOQLzGyGmC7ql9p2Hv+cCvogsAj4/l63KRNHa6nBFzvVJUzZ/hOYyTFh
PznPBbm3e23txYD/QhpcYcrE1ShiFxkWwNYuNGC9saqDl7rgUO5m58TPCWHPLmcS
LxzY9PX4bvAKamrCdO/yF1iPc9L1q++ciBbvTP8mWmpn0hv1Pa8FPedoO2a6OUW3
KfWfwmo1Mcb1fukV3xiJKfrqiCeKU5F2GjbWiaRELFZ1MkOqM6jrL5LqSkuaQG3y
I67TyHJNsVqXbcB4b9WDM8bmwli10GHpbRHoiBXeQkM1npbjB2MeC8VLW3lzJZIA
ZTRKqcmCp1oWJ8rTafO/EJ6JvYwIMQ==
=+4nP
-----END PGP SIGNATURE-----

--FpBC8UcrkcOVUKr5--

