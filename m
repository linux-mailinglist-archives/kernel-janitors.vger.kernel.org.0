Return-Path: <kernel-janitors+bounces-1112-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AE9682678D
	for <lists+kernel-janitors@lfdr.de>; Mon,  8 Jan 2024 05:16:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B5342281A11
	for <lists+kernel-janitors@lfdr.de>; Mon,  8 Jan 2024 04:16:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A69179F4;
	Mon,  8 Jan 2024 04:16:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H96c5Lae"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 797E27F;
	Mon,  8 Jan 2024 04:16:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-67f5c0be04cso15450016d6.0;
        Sun, 07 Jan 2024 20:16:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704687388; x=1705292188; darn=vger.kernel.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=G39BbRFm9oOt8R6geou4KSFAkCT2cUdc4etIgTklN44=;
        b=H96c5LaejS7QBID25VnfOHq617crTlRo92sxNKkZqB0m2hDnFYPGrOqtzaYAPSxn8m
         bCZqVkAdbk34+dJK0TO7JuO0Z6je/RaKfK1sFxxPkHgr4DRZNpytdtMm99nmTbT6whFl
         C2T16FHZyUXzjnNLamnCtgoKqYlPanXMp4oDQ9nlrQvfVa8LFfunsLshowKfnO5kQNYH
         GO21McEaqqIjxy8482h/FAowo4wtZkQhR0r7jqzru+QustEuYrISzdP3wYlQ3k/S4X3/
         q1gVusPZyD7rbeOknxQWMPJDB6+l0MS0sOSGdGf/lzLph4+dc1rdR2syTsPLXGLgJ3pj
         G9cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704687388; x=1705292188;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=G39BbRFm9oOt8R6geou4KSFAkCT2cUdc4etIgTklN44=;
        b=ZGvXXwnIA2X/YDZxzzuE3+ESwhvTtnupITo1cazci+OVHdMNGgoD1mQJ7GEzYlqAo7
         I/i0gCWeJ1cos2ipF8QcPI3MQ4B5L4wD/UbsehimBMhR4L4+bnOfwsAxVo/2urHeHmsw
         Z65htmkXq4TvTc9+NW3HV0urSyuSSn6Zi5kXWLS82l73ouwbn6rgINl6+1Xo0McUvll/
         UbVJc7tHzl5dSHXS/StNinyb9SyoisJNV2sbowDrOgW4+g9b3wmAS7utojLjxnw/yA5f
         L1OAJWE61+VcS0DoZFZ0DF5fCwcAUXpU3cmd0bMT422YgPIGUpP7EAPuaZ3F5y7kxHaG
         yV8w==
X-Gm-Message-State: AOJu0YyOl0/WWAmOC0J0pQScWnMIP5wlxwmkOioEbf8H92r822mdD2wK
	VQhejvAAFpAGbjbjQSj91qQ=
X-Google-Smtp-Source: AGHT+IG/oR/Aw3I3ZED06i/9TypHwct1p3w9mSILSkmYQYA2akipYcjP1zEkSnbEOOCppFNiicYa0A==
X-Received: by 2002:ad4:5aab:0:b0:67f:641e:bfc5 with SMTP id u11-20020ad45aab000000b0067f641ebfc5mr4757391qvg.26.1704687388243;
        Sun, 07 Jan 2024 20:16:28 -0800 (PST)
Received: from [192.168.2.14] ([174.88.31.222])
        by smtp.gmail.com with ESMTPSA id mx20-20020a0562142e1400b0067f802d373bsm2557852qvb.89.2024.01.07.20.16.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 07 Jan 2024 20:16:27 -0800 (PST)
Message-ID: <02eea90d-5a3a-415f-9123-36e81ff9511a@gmail.com>
Date: Sun, 7 Jan 2024 23:16:18 -0500
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:115.0) Gecko/20100101
 Thunderbird/115.6.0
Subject: Re: [PATCH 1/2] drm/sched: One function call less in drm_sched_init()
 after error detection
To: Markus Elfring <Markus.Elfring@web.de>, dri-devel@lists.freedesktop.org,
 kernel-janitors@vger.kernel.org, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: LKML <linux-kernel@vger.kernel.org>, cocci@inria.fr
References: <12b3e9cb-3241-40cc-b7a4-43c45b9eedc9@web.de>
 <85066512-983d-480c-a44d-32405ab1b80e@web.de>
Content-Language: en-CA, en-US
From: Luben Tuikov <ltuikov89@gmail.com>
Autocrypt: addr=ltuikov89@gmail.com; keydata=
 xjMEZTohOhYJKwYBBAHaRw8BAQdAWSq76k+GsENjDTMVCy9Vr4fAO9Rb57/bPT1APnbnnRHN
 Ikx1YmVuIFR1aWtvdiA8bHR1aWtvdjg5QGdtYWlsLmNvbT7CmQQTFgoAQRYhBJkj7+VmFO9b
 eaAl10wVR5QxozSvBQJlOiE6AhsDBQkJZgGABQsJCAcCAiICBhUKCQgLAgQWAgMBAh4HAheA
 AAoJEEwVR5QxozSvSm4BAOwCpX53DTQhE20FBGlTMqKCOQyJqlMcIQ9SO1qPWX1iAQCv3vfy
 JwktF7REl1yt7IU2Sye1qmQMfJxdt9JMbMNNBs44BGU6IToSCisGAQQBl1UBBQEBB0BT9wSP
 cCE8uGe7FWo8C+nTSyWPXKTx9F0gpEnlqReRBwMBCAfCfgQYFgoAJhYhBJkj7+VmFO9beaAl
 10wVR5QxozSvBQJlOiE6AhsMBQkJZgGAAAoJEEwVR5QxozSvSsYA/2LIFjbxQ2ikbU5S0pKo
 aMDzO9eGz69uNhNWJcvIKJK6AQC9228Mqc1JeZMIyjYWr2HKYHi8S2q2/zHrSZwAWYYwDA==
In-Reply-To: <85066512-983d-480c-a44d-32405ab1b80e@web.de>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------akJcGWK3GfgbDEfTJY9Ui4oZ"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------akJcGWK3GfgbDEfTJY9Ui4oZ
Content-Type: multipart/mixed; boundary="------------j0wM5t9os3GxcVz0WOntpr3w";
 protected-headers="v1"
From: Luben Tuikov <ltuikov89@gmail.com>
To: Markus Elfring <Markus.Elfring@web.de>, dri-devel@lists.freedesktop.org,
 kernel-janitors@vger.kernel.org, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: LKML <linux-kernel@vger.kernel.org>, cocci@inria.fr
Message-ID: <02eea90d-5a3a-415f-9123-36e81ff9511a@gmail.com>
Subject: Re: [PATCH 1/2] drm/sched: One function call less in drm_sched_init()
 after error detection
References: <12b3e9cb-3241-40cc-b7a4-43c45b9eedc9@web.de>
 <85066512-983d-480c-a44d-32405ab1b80e@web.de>
In-Reply-To: <85066512-983d-480c-a44d-32405ab1b80e@web.de>

--------------j0wM5t9os3GxcVz0WOntpr3w
Content-Type: multipart/mixed; boundary="------------NXadqVeg3RFjjwx8Fg5PFeCc"

--------------NXadqVeg3RFjjwx8Fg5PFeCc
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 2023-12-26 10:56, Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Tue, 26 Dec 2023 16:30:25 +0100
>=20
> The kfree() function was called in one case by the
> drm_sched_init() function during error handling
> even if the passed data structure member contained a null pointer.
> This issue was detected by using the Coccinelle software.
>=20
> Thus adjust a jump target.
>=20
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

Thank you Markus for this patch.

Reviewed-by: Luben Tuikov <ltuikov89@gmail.com>

Pushed to drm-misc-next.
--=20
Regards,
Luben

> ---
>  drivers/gpu/drm/scheduler/sched_main.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/s=
cheduler/sched_main.c
> index 550492a7a031..b99d4e9ff109 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -1289,7 +1289,7 @@ int drm_sched_init(struct drm_gpu_scheduler *sche=
d,
>  	sched->sched_rq =3D kmalloc_array(num_rqs, sizeof(*sched->sched_rq),
>  					GFP_KERNEL | __GFP_ZERO);
>  	if (!sched->sched_rq)
> -		goto Out_free;
> +		goto Out_check_own;
>  	sched->num_rqs =3D num_rqs;
>  	for (i =3D DRM_SCHED_PRIORITY_KERNEL; i < sched->num_rqs; i++) {
>  		sched->sched_rq[i] =3D kzalloc(sizeof(*sched->sched_rq[i]), GFP_KERN=
EL);
> @@ -1314,9 +1314,10 @@ int drm_sched_init(struct drm_gpu_scheduler *sch=
ed,
>  Out_unroll:
>  	for (--i ; i >=3D DRM_SCHED_PRIORITY_KERNEL; i--)
>  		kfree(sched->sched_rq[i]);
> -Out_free:
> +
>  	kfree(sched->sched_rq);
>  	sched->sched_rq =3D NULL;
> +Out_check_own:
>  	if (sched->own_submit_wq)
>  		destroy_workqueue(sched->submit_wq);
>  	drm_err(sched, "%s: Failed to setup GPU scheduler--out of memory\n", =
__func__);
> --
> 2.43.0
>=20

--------------NXadqVeg3RFjjwx8Fg5PFeCc
Content-Type: application/pgp-keys; name="OpenPGP_0x4C15479431A334AF.asc"
Content-Disposition: attachment; filename="OpenPGP_0x4C15479431A334AF.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

xjMEZTohOhYJKwYBBAHaRw8BAQdAWSq76k+GsENjDTMVCy9Vr4fAO9Rb57/bPT1A
PnbnnRHNIkx1YmVuIFR1aWtvdiA8bHR1aWtvdjg5QGdtYWlsLmNvbT7CmQQTFgoA
QRYhBJkj7+VmFO9beaAl10wVR5QxozSvBQJlOiE6AhsDBQkJZgGABQsJCAcCAiIC
BhUKCQgLAgQWAgMBAh4HAheAAAoJEEwVR5QxozSvSm4BAOwCpX53DTQhE20FBGlT
MqKCOQyJqlMcIQ9SO1qPWX1iAQCv3vfyJwktF7REl1yt7IU2Sye1qmQMfJxdt9JM
bMNNBs44BGU6IToSCisGAQQBl1UBBQEBB0BT9wSPcCE8uGe7FWo8C+nTSyWPXKTx
9F0gpEnlqReRBwMBCAfCfgQYFgoAJhYhBJkj7+VmFO9beaAl10wVR5QxozSvBQJl
OiE6AhsMBQkJZgGAAAoJEEwVR5QxozSvSsYA/2LIFjbxQ2ikbU5S0pKoaMDzO9eG
z69uNhNWJcvIKJK6AQC9228Mqc1JeZMIyjYWr2HKYHi8S2q2/zHrSZwAWYYwDA=3D=3D
=3DqCaZ
-----END PGP PUBLIC KEY BLOCK-----

--------------NXadqVeg3RFjjwx8Fg5PFeCc--

--------------j0wM5t9os3GxcVz0WOntpr3w--

--------------akJcGWK3GfgbDEfTJY9Ui4oZ
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQSZI+/lZhTvW3mgJddMFUeUMaM0rwUCZZt3EgUDAAAAAAAKCRBMFUeUMaM0r2Z2
AP9SVEcM87yBgCEEumb7RrTcowF28fJe4at5i5gRwqqH9AD/fIedeYxvDzo+bgS6qnGXXomI7lqZ
tF/sjFL/xiKcBAI=
=xKWp
-----END PGP SIGNATURE-----

--------------akJcGWK3GfgbDEfTJY9Ui4oZ--

