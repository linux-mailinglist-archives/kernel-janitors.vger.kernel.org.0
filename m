Return-Path: <kernel-janitors+bounces-7290-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 03E1FA4BC4D
	for <lists+kernel-janitors@lfdr.de>; Mon,  3 Mar 2025 11:32:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EFFCF16F7A7
	for <lists+kernel-janitors@lfdr.de>; Mon,  3 Mar 2025 10:32:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEA301F4297;
	Mon,  3 Mar 2025 10:30:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="gbOreJ2B"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 444B01F2B99
	for <kernel-janitors@vger.kernel.org>; Mon,  3 Mar 2025 10:30:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740997853; cv=none; b=Op5RYuHv3Adsun/vdotco8QnqD8xaKDIv8rIMM7VL2co+JlrRuoJmf8GlTJrAOjSlYLRKUC2aSvztrKlBmtPumuyuO9CMG3ULgDGHmao9fXVmgW8tuIXkdeAJWL1X922/GjJ0EcpC0LU/inFNy3lPktpp/kR7PVlbaWpIPKjmGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740997853; c=relaxed/simple;
	bh=YOKNIjJrYk3beqqvelnnK1DyZo8zD6Bu7MA1IsL+RaA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Tga37USjRw91/zvCeciNhDyR90/lo+5EJhkhGD775ON78gFKl+Le4I3uZSsoWMzrhKqVn5a3AmZa70KyAAHdjXeF1USe9LD5wfvpNUX9OtLRZdFGPuK5sE38CjfKoygZCKMfekm0S/roMd5Z2kvLv7bEqioYbkM2f4+NQ7i1bL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=gbOreJ2B; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-43bc0b8520cso4544475e9.1
        for <kernel-janitors@vger.kernel.org>; Mon, 03 Mar 2025 02:30:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1740997848; x=1741602648; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bVbo8Bp188ctbON8ZulP+OSFSxe/rMczkjpmYA+ieRQ=;
        b=gbOreJ2BuqR5/h11au9IMo/Io15opOnW+V1yhNtHlFUPDO5WjJhOSGXVBTKrQOE6tG
         eBv6O/PF1+HvocI0A2gKShZaloVODZ7SXP4iYus+5OLQmh+F+40AiQFlTz7cS90kcMWU
         RUop0bNrKayKXWqrjz5i+K09laZtbc/V9A17lWUOE9Z2aTkbCRAsF9dM9Z9s2SQ7jwJx
         TLf2oOZttBiWzGMx4adyz3ZrBUnomZSHecYGMFgVqA6DSYuZlAQSz5KRAuT1ha0O6Zdv
         FtNXf/A+shjFLP4dBSQukM2ZLt9phfQ6Kmrzg+fI49PHLSvxFrPtqAJQdM4PmtGvW+AN
         09rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740997848; x=1741602648;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bVbo8Bp188ctbON8ZulP+OSFSxe/rMczkjpmYA+ieRQ=;
        b=W6idBMhXHI9RZniEqF73evMwVuVlsV+arJPgNicWFHM4S+PDB3G0/8oEhVd3hzSdQD
         eD+FArHJTZHCG7STSHEtt8zxJ2w/br0MHLxAf9BTwk6OMl2CDAjD1FwwAEJGf2NxSbt8
         P3aCM3fcCUrVKjJ5TLnJRoNO3qZkgsbe/qZkoQbaFSs/h3fdZ/Ukn5cJdqHqpJ6Wc0ca
         9U7LLHYCRAAumwRzJ54UwvHbSOfw7g+50e64o3PUD1Ag9GxrRCXUWDhghMPld7u38JNK
         gHa5sZ4jeXKoZnJaO54SuFUe18mMUFJgf9Xkae0x10UkB7T90cNz2ysIs7ZAkSDmCDaL
         e/+w==
X-Forwarded-Encrypted: i=1; AJvYcCU7IBpzVhpPx70NkIOFmEqZ3T9J7628+EkPWERRJQ6cea2CZW4KI4bTvxBYjiEYOf+tN1BnzYCXFe+HeFunMkg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7fcNBUCqN9qlv3A0RX/CbSjXruqkOSooGVeXmr6uvl5VFhgA3
	T/hZWbji5CK8lUKBjw8qvB/AU0wfbA9yCX/mN0gYcbjw0lLaflW52udvQ00SAOc=
X-Gm-Gg: ASbGnctXVIqZeFnD0GchiiVKis14PnsfAFCIsG0UuuTEDv+SIK/IxC3+Ur1B7SGWIL1
	g+xF/633UvLBpfEnP7gky+QkKNjbxPER92pjJsjN89kvxWlLbZ1dAsf5CZE8MH5j7aRbJ9hN2vm
	wIIZ7U64XxppceeZWBMlvndEXapxTSZatjWwU8RYWGSUlhj6gJdCEJ9HSgqcF6+A6h4sGsMDM7x
	w6BkUzZMrCakJqRhdcPi00wYfF1bd8dLQO7VEHohMNkMTqImN5BoApaDzDW9lSvIr+H/LsNUs6z
	Ml/802f6i5Tlge9jShcxPc27h75QfyxxlGExI42BWmeWZy2oiv/p4ZHrJzc7kWphR1Unv3z6lJ6
	hjNrncxPNjIfyX6sq5kYAxaEw4w==
X-Google-Smtp-Source: AGHT+IH9VAhW9tJPNhTeqngSyn+en5grFHwVORQOd7xIovLbkp/2JtR0igU6P17pWqd3YNtGaZA2uw==
X-Received: by 2002:a05:600c:3513:b0:439:9f42:c137 with SMTP id 5b1f17b1804b1-43ba66e218emr116219575e9.11.1740997848443;
        Mon, 03 Mar 2025 02:30:48 -0800 (PST)
Received: from localhost (amontpellier-556-1-148-206.w109-210.abo.wanadoo.fr. [109.210.4.206])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43b737043aasm153133835e9.14.2025.03.03.02.30.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Mar 2025 02:30:47 -0800 (PST)
Date: Mon, 3 Mar 2025 11:30:46 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Markus Elfring <Markus.Elfring@web.de>, 
	kernel-janitors@vger.kernel.org, linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	Antonino Daplas <adaplas@pol.net>, Helge Deller <deller@gmx.de>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Yihao Han <hanyihao@vivo.com>, cocci@inria.fr, 
	LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH RESEND] video: au1100fb: Move a variable assignment
 behind a null pointer check in au1100fb_setmode()
Message-ID: <hwk2nf62owdo3olxrwt5tu7nwfpjkrr3yawizfpb3xn6ydeekx@xwz7nh5ece2c>
References: <40c60719-4bfe-b1a4-ead7-724b84637f55@web.de>
 <1a11455f-ab57-dce0-1677-6beb8492a257@web.de>
 <86551e6f-d529-1ff6-6ce6-b9669d10e6cb@web.de>
 <3f1e7aaa-501a-44f1-8122-28e9efa0a33c@web.de>
 <ugymllbkcsg22ffgyofvkquh5afbvoyv2nna5udmy3xfhv2rjz@jhgghzldzm4u>
 <eebf8c0c-7a6a-405f-aaab-2a8a8c2bd91f@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="w37fhouumevfpx4n"
Content-Disposition: inline
In-Reply-To: <eebf8c0c-7a6a-405f-aaab-2a8a8c2bd91f@stanley.mountain>


--w37fhouumevfpx4n
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH RESEND] video: au1100fb: Move a variable assignment
 behind a null pointer check in au1100fb_setmode()
MIME-Version: 1.0

On Mon, Mar 03, 2025 at 01:08:29PM +0300, Dan Carpenter wrote:
> On Mon, Mar 03, 2025 at 10:19:06AM +0100, Uwe Kleine-K=C3=B6nig wrote:
> > Hello,
> >=20
> > On Sun, Mar 02, 2025 at 07:02:12PM +0100, Markus Elfring wrote:
> > > From: Markus Elfring <elfring@users.sourceforge.net>
> > > Date: Thu, 13 Apr 2023 21:35:36 +0200
> > >=20
> > > The address of a data structure member was determined before
> > > a corresponding null pointer check in the implementation of
> > > the function =E2=80=9Cau1100fb_setmode=E2=80=9D.
> > >=20
> > > Thus avoid the risk for undefined behaviour by moving the assignment
> > > for the variable =E2=80=9Cinfo=E2=80=9D behind the null pointer check.
> > >=20
> > > This issue was detected by using the Coccinelle software.
> > >=20
> > > Fixes: 3b495f2bb749 ("Au1100 FB driver uplift for 2.6.")
> > > Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> >=20
> > Acked-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@baylibre.com>
> >=20
> > Should also get
> >=20
> > Cc: stable@vger.kernel.org
> >=20
> > to ensure this is backported to stable.
>=20
> It's not a bugfix, it's a cleanup.  That's not a dereference, it's
> just pointer math.  It shouldn't have a Fixes tag.
>=20
> Real bugs where we dereference a pointer and then check for NULL don't
> last long in the kernel.  Most of the stuff Markus is sending is false
> positives like this.

I thought a compiler translating the code

	struct fb_info *info =3D &fbdev->info;

	if (!fbdev)
		return -EINVAL;

is free (and expected) to just drop the if block. I wasn't aware that
this only applies when the pointer is actually dereferenced. Testing
that with arm-linux-gnueabihf-gcc 14.2.0 seems to confirm what you're
saying.

Thanks for letting me know. With that learned I agree that the Fixes tag
should be dropped (and Cc: stable not added).

Best regards
Uwe

--w37fhouumevfpx4n
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmfFhNMACgkQj4D7WH0S
/k5nPwgAstc+P1JFVJcAu2QOmJtpmMvfsusSqi09w0aEnPTXJ7eWgHQj2HCmKJ2A
tpsfvf8kA5JHjm0dDyhnnr8MT+SSDNDnXQX6Ql4rFwC61a+xBBYE+68xUYe5XyHF
98yWGWsnGV5liC6rrj5PcRpur1bml3Wj3UEbsTiGyaTNzOAbQyw8ygwvkHH60sIe
XtvnKO/KgD8nSdHP8GE8uPv//BbKJmM4n/Tnvm9t4W9IeVnwC9RedLmElvgbOimt
YVRPNPNG/KDOW0VIfUv1zmx/xXpnbqUhQmls/wYjc7ZF85CYgjm7eFm3xKhfquTC
sEGbyzVTmAU0THTQ7X7Odz9uKL8q0A==
=j/U6
-----END PGP SIGNATURE-----

--w37fhouumevfpx4n--

