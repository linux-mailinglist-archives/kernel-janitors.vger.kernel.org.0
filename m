Return-Path: <kernel-janitors+bounces-3796-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E65A4901DC5
	for <lists+kernel-janitors@lfdr.de>; Mon, 10 Jun 2024 11:06:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 65546282056
	for <lists+kernel-janitors@lfdr.de>; Mon, 10 Jun 2024 09:06:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA8D8770FC;
	Mon, 10 Jun 2024 09:05:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="b3d3lJke"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3323173514
	for <kernel-janitors@vger.kernel.org>; Mon, 10 Jun 2024 09:05:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718010341; cv=none; b=lVkzbStoPIS3jIUOgQ00FPhpwY8JR0XNp+cbDcyrNom/1lGTvurRdTRArsfdsB6eJi5ZiQy5QGi7rbRVXCu1/2Px5RfPJGuU8hNvJGd9lvD+9XyGf9pXW/G50PUinkzxJD/bg5NByAqYHulIjJqlkOkvwQiRmvzAIKPzqdDZ1PI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718010341; c=relaxed/simple;
	bh=HEg0zyvw/V+cMw418J+Nfsgp8PdHvRrJzynNEBulD/w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g6jUdf1AKtb32Dk4f10S619OWhLuvcVQMF1Jyz5vKEUvKh1yDQR8/iUCflz97dwPRiBKgfwrp8ZI30PvqnBahgFjLMK6wurSIPzHtkiBW0zPLNnaEFPH+6/f2OCJ020BqqL+3ThrIChYG0TvaZyueFNwyl/SlxRn6TPl0E/2rKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=b3d3lJke; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-57c6d3e6606so2401554a12.0
        for <kernel-janitors@vger.kernel.org>; Mon, 10 Jun 2024 02:05:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1718010337; x=1718615137; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Z97Srw814CSk6XdmVlMPcCGnmoMkpcpqJTTh4MZ38CU=;
        b=b3d3lJkeKrEbLtTZr4R1OZWdGIQZFPncD6Y+TvfAnvUbPpF9t0V3hjGT5H2ChguXzG
         OPkANN6libICRfhi4s6n5KQxo0JKx6D+95sEUe2YTBQb5PE9I4/bGEadbvYpqY8/37+t
         Xt1Zis8yBgA2s+f9g+3fkag3JIv8YJH//6I+mkGuyhFEfPbUHrVQLZakXRwe/WI7+k3f
         VttLkn59hLbD2Mcet0Xj7MxGIfquvklMqZgl9JzzRGogBRH3yQ4gLiwRRgD7tzBXVUcA
         OFoVqOdfUm0fItxIK+/z2Sz8blTcrkNaUGrlTqzioFmuQQQa8/CnLHc0Jn0W6AB9J0Cu
         gymw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718010337; x=1718615137;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z97Srw814CSk6XdmVlMPcCGnmoMkpcpqJTTh4MZ38CU=;
        b=t+vmVIg8BWeB5qyjfapW8ywaOuhVWdrMnYEv98a4JtPvx300sBdEQdHi/ZUKowewdH
         PpdKAqGJzYtfQehRdoyGIi+FqHEEnOfEI3p6G8Y6TUQcW10J2/Ilb7eex8BW0X+qLnHr
         f7+oIZFa6EPd1kd9kDgm1OG/aWiIED8RU0WzU/6VvU2zZOdKZ7InBO3n6qthSPSEi5+e
         d5A06iecJ5VKduCL0CfppAAHKOUFmyscIgjCf3+oUbP50UduEzesLXW/baQ9eUjjcEsb
         UzucLCgVDlN7oGTpTogO4pK+/2bV7+Ewlo1EjppvV21Qm1QrhPvV7/xG5ZFxJflZsdpt
         zM+A==
X-Forwarded-Encrypted: i=1; AJvYcCVksesWNs8CPqQuym5580K3GImO3ALRczSs5rogIQgpw62vtXe7qiq2ixjXzCou2O5dekOfeMPXEBBwsJUJLyLxDgdpHehDXOcqlQcQ4KJ2
X-Gm-Message-State: AOJu0YxGpV3MF1b3IPkG9Kzc0y2b8ejZIHtvb0ac7wUc/1hr1OTs3O9b
	WFghSklfc4bds+13r6CQSp/OMAQvvDST2l24HPyZjidwJjqEHeBebBt5Cbbh1/s=
X-Google-Smtp-Source: AGHT+IFkyhcT1eyJNZMa+v9iD180qe0aqLoDogvtNodRry9SmYe35KOJ15PGipaMtMR7zBJCwHj8dA==
X-Received: by 2002:a17:906:840b:b0:a6f:dec:5a66 with SMTP id a640c23a62f3a-a6f0dec6614mr276844566b.5.1718010337430;
        Mon, 10 Jun 2024 02:05:37 -0700 (PDT)
Received: from localhost (p509153eb.dip0.t-ipconnect.de. [80.145.83.235])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6ef5285748sm412819866b.146.2024.06.10.02.05.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jun 2024 02:05:36 -0700 (PDT)
Date: Mon, 10 Jun 2024 11:05:36 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>, Matthias Brugger <matthias.bgg@gmail.com>, 
	linux-pwm@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] pwm: add missing MODULE_DESCRIPTION() macros
Message-ID: <g5u7xk2l625vu6dxleonlmshnwqoge5fiaigbqlcedayu2rate@o4vgz7g27vlv>
References: <20240607-md-drivers-pwm-v1-1-27237a2bec6a@quicinc.com>
 <ca6b4ce2-4ebf-409d-b87d-2024445b9392@collabora.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="q35kt4hkwtu27u62"
Content-Disposition: inline
In-Reply-To: <ca6b4ce2-4ebf-409d-b87d-2024445b9392@collabora.com>


--q35kt4hkwtu27u62
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Mon, Jun 10, 2024 at 10:06:49AM +0200, AngeloGioacchino Del Regno wrote:
> Il 07/06/24 18:02, Jeff Johnson ha scritto:
> > [...]
> > diff --git a/drivers/pwm/pwm-mediatek.c b/drivers/pwm/pwm-mediatek.c
> > index 19a87873ad60..0b5d68a90e83 100644
> > --- a/drivers/pwm/pwm-mediatek.c
> > +++ b/drivers/pwm/pwm-mediatek.c
> > @@ -395,4 +395,5 @@ static struct platform_driver pwm_mediatek_driver =
=3D {
> >   module_platform_driver(pwm_mediatek_driver);
> >   MODULE_AUTHOR("John Crispin <blogic@openwrt.org>");
> > +MODULE_DESCRIPTION("MediaTek Pulse Width Modulator driver");
>=20
> MediaTek SoCs have got two different PWM IPs, one of which is used exclus=
ively
> for the Display PWM, and it is located in the DDP block.
>=20
> So, there are two PWM IPs in one SoC:
>  - A general purpose PWM IP
>  - A DDP PWM IP
>=20
> This driver is for the general purpose PWM IP.. so, please, can we change=
 this
> to "MediaTek general purpose Pulse Width Modulator driver"?
>=20
> After which,
>=20
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>

Looks like a reasonable request.

@Jeff: Can you please resend with the suggested change, I dropped the
patch from for-next now.

Best regards
Uwe

--q35kt4hkwtu27u62
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmZmwdsACgkQj4D7WH0S
/k55zQf8CfuApQ1ZBtYAqa1Nbq+ZlBw/O21Uu1RabLwL/pyilctw+8HyD94rpw4l
fa2pQmjJNIpbxVLwqbSz/liyD5+xs3qysDJdfTjG2sc3iWXXtfEo2PSOgxGByXfx
53HHtTMGgwf4SGBDghqpOgBrfuPhjDbUC2xvVIYMwPFPliUjZhdQvNEUqZZiZxo1
Ueou9i3+1M0/jEBd4adgtcR1QlNVQO/4QJ3RJMAFe1tQDVdYrLG3xb0+4uxskJ5b
uuEuYScgNnItS4OISYQoo3R+M9RjhqBhiz+geuCDuHQOTK3GsLd6uJdvojmm1B1n
PTlKBhDnoqJUPIoyjB6XfukvubKsiA==
=P61q
-----END PGP SIGNATURE-----

--q35kt4hkwtu27u62--

