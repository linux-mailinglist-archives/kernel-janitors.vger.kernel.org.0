Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 51BD8C991B
	for <lists+kernel-janitors@lfdr.de>; Thu,  3 Oct 2019 09:43:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728345AbfJCHnL (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Thu, 3 Oct 2019 03:43:11 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:37582 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725497AbfJCHnL (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 3 Oct 2019 03:43:11 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: pq)
        with ESMTPSA id 03BAA28F5FD
Date:   Thu, 3 Oct 2019 10:42:58 +0300
From:   Pekka Paalanen <pekka.paalanen@collabora.com>
To:     Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
Cc:     Keith Packard <keithp@keithp.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Ville =?UTF-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
        Chris Wilson <chris@chris-wilson.co.uk>,
        Daniel Vetter <daniel@ffwll.ch>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org, intel-gfx@lists.freedesktop.org
Subject: Re: [PATCH V6] drm/drm_vblank: Change EINVAL by the correct errno
Message-ID: <20191003104258.119d72e9.pekka.paalanen@collabora.com>
In-Reply-To: <20191002140516.adeyj3htylimmlmg@smtp.gmail.com>
References: <20191002140516.adeyj3htylimmlmg@smtp.gmail.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/o+JZAc3u12D=Y2_U=czydx8"; protocol="application/pgp-signature"
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

--Sig_/o+JZAc3u12D=Y2_U=czydx8
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, 2 Oct 2019 11:05:16 -0300
Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com> wrote:

> For historical reasons, the function drm_wait_vblank_ioctl always return
> -EINVAL if something gets wrong. This scenario limits the flexibility
> for the userspace to make detailed verification of any problem and take
> some action. In particular, the validation of =E2=80=9Cif (!dev->irq_enab=
led)=E2=80=9D
> in the drm_wait_vblank_ioctl is responsible for checking if the driver
> support vblank or not. If the driver does not support VBlank, the
> function drm_wait_vblank_ioctl returns EINVAL, which does not represent
> the real issue; this patch changes this behavior by return EOPNOTSUPP.
> Additionally, drm_crtc_get_sequence_ioctl and
> drm_crtc_queue_sequence_ioctl, also returns EINVAL if vblank is not
> supported; this patch also changes the return value to EOPNOTSUPP in
> these functions. Lastly, these functions are invoked by libdrm, which is
> used by many compositors; because of this, it is important to check if
> this change breaks any compositor. In this sense, the following projects
> were examined:
>=20
> * Drm-hwcomposer
> * Kwin
> * Sway
> * Wlroots
> * Wayland
> * Weston
> * Mutter
> * Xorg (67 different drivers)
>=20
> For each repository the verification happened in three steps:
>=20
> * Update the main branch
> * Look for any occurrence of "drmCrtcQueueSequence",
>   "drmCrtcGetSequence", and "drmWaitVBlank" with the command git grep -n
>   "STRING".
> * Look in the git history of the project with the command
> git log -S<STRING>
>=20
> None of the above projects validate the use of EINVAL when using
> drmWaitVBlank(), which make safe, at least for these projects, to change
> the return values. On the other hand, mesa and xserver project uses
> drmCrtcQueueSequence() and drmCrtcGetSequence(); this change is harmless
> for both projects.
>=20
> Change since V5 (Pekka Paalanen):
>  - Check if the change also affects Mutter
>=20
> Change since V4 (Daniel):
>  - Also return EOPNOTSUPP in drm_crtc_[get|queue]_sequence_ioctl
>=20
> Change since V3:
>  - Return EINVAL for _DRM_VBLANK_SIGNAL (Daniel)
>=20
> Change since V2:
>  Daniel Vetter and Chris Wilson
>  - Replace ENOTTY by EOPNOTSUPP
>  - Return EINVAL if the parameters are wrong
>=20
> Cc: Keith Packard <keithp@keithp.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> Cc: Chris Wilson <chris@chris-wilson.co.uk>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Pekka Paalanen <pekka.paalanen@collabora.com>
> Signed-off-by: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
> ---
>  drivers/gpu/drm/drm_vblank.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/drm_vblank.c b/drivers/gpu/drm/drm_vblank.c
> index 9c6899758bc9..71cf2633ac58 100644
> --- a/drivers/gpu/drm/drm_vblank.c
> +++ b/drivers/gpu/drm/drm_vblank.c
> @@ -1610,7 +1610,7 @@ int drm_wait_vblank_ioctl(struct drm_device *dev, v=
oid *data,
>  	unsigned int flags, pipe, high_pipe;
> =20
>  	if (!dev->irq_enabled)
> -		return -EINVAL;
> +		return -EOPNOTSUPP;
> =20
>  	if (vblwait->request.type & _DRM_VBLANK_SIGNAL)
>  		return -EINVAL;

Hi,

this part looks safe for Weston indeed, so this part:

Acked-by: Pekka Paalanen <pekka.paalanen@collabora.com>

There is no need to check the "Wayland" project, it will never do
anything with DRM.

(What looks extremely suspicious though is the libdrm implementation of
drmWaitVblank() in case the ioctl returns EINTR, but that's unrelated.)


Thanks,
pq

--Sig_/o+JZAc3u12D=Y2_U=czydx8
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAl2VpoIACgkQI1/ltBGq
qqdxlRAAjTrqbU3NrK1kJ8lgwsXFGgwwlLVU2uu56fq5vVb6wyZb0coZEe01/OP8
KCunoHBG0e6I7HKgmay2y73JKvy9HA93YZ4tm0ErI4KqTIc+EqnKVCMfnVr3HSCh
cbEqjVdAVmfYRHmEu4UczgQdeGg1Vqfvfq5UVCI0v2vrPzVpAnqfJ6btVYX8f4tM
FkXUAAyVgPyHojcwUopU+XiuKruDekrfv/n5edC2uP9gi/bM5n2Gu3Nq+s7+kzGZ
PW01We28veJ9b1jjWhrvbW1J8M2ot35HXRtgNwDBcpoWtb8qcZk/n3M2+J2CdjCx
W8Q7ZLfq/j6ee0XlE4ZJRzy19FNzyl2lLzhp3GxR5vbZ7ml3A4yUY5vjQxpcADgu
dUjXLSdw2VPyJmzsc8A5hGjjH8Pv17Va3zkjOtKJiW6Bmq1D0z8m7hdcFy6zxZKh
/SrcBq/U6y8Cvo33tRElcsDVQ3zQWECAJFmaZ4AG3xtVXvO17fmly4saU7jwOx1f
/2K5NiENNhJ8vpHBh3jz6KDRHiiVmDC5DtLStk4O7JqDvErlMRUMHdY0V6XMoRqu
CWRvYDB3+E5FykEPYIoTpOf/LLX41I0EpFXuzh6tWmOHgtl8CgIUrQS5HX0u/Oo8
JjOBP+oWKotSmqD7eS95ug7N3EVuk4/9bWun+kFe8pKzLDg+Ws4=
=AcvH
-----END PGP SIGNATURE-----

--Sig_/o+JZAc3u12D=Y2_U=czydx8--
