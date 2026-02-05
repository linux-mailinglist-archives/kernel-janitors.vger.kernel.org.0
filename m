Return-Path: <kernel-janitors+bounces-10150-lists+kernel-janitors=lfdr.de@vger.kernel.org>
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QPMACIhfhGng2gMAu9opvQ
	(envelope-from <kernel-janitors+bounces-10150-lists+kernel-janitors=lfdr.de@vger.kernel.org>)
	for <lists+kernel-janitors@lfdr.de>; Thu, 05 Feb 2026 10:14:48 +0100
X-Original-To: lists+kernel-janitors@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 97F1AF06DB
	for <lists+kernel-janitors@lfdr.de>; Thu, 05 Feb 2026 10:14:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 876743041D56
	for <lists+kernel-janitors@lfdr.de>; Thu,  5 Feb 2026 09:08:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7F7B392800;
	Thu,  5 Feb 2026 09:06:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=exactco.de header.i=@exactco.de header.b="eNTN+/Yl"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from exactco.de (exactco.de [176.9.10.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F21B2F5308;
	Thu,  5 Feb 2026 09:06:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=176.9.10.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770282394; cv=none; b=H+/58lXucGLhtoVYf9khVkuqBM2ZCwNJEXrwj5LgEmqox7LQKUnO57z5sRspM4fqMzCTErpZZBhHeZ6vbkBygXsjiH/PF/gy5EhL9+AcNf7iNJqLhbxG4TuIPWO3ZpFAltB3VUFJk5QxhZS+++ZSfCcp/UeoRtFlK6pfL/umCEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770282394; c=relaxed/simple;
	bh=CkKS9y6aRJsbAusQwozTRtjjZB5QaXQjJNMmbDyBAao=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=i8GslCTx1eEE1y+hGBaeFbfYw2gyrLtTW+zRmILmyskvOIeXQYEUIXdlhw+PqeOcmAzYpLYze4TZtyJA6KxY/CvIpBe844SdywJpiewokHIJxANTME+1yyDe2ObUO3PtOyzJxZBDilMZvqPyGyuUoKUWcaMpaVbUHu7fHjrkq5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=exactco.de; spf=pass smtp.mailfrom=exactco.de; dkim=pass (2048-bit key) header.d=exactco.de header.i=@exactco.de header.b=eNTN+/Yl; arc=none smtp.client-ip=176.9.10.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=exactco.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=exactco.de
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=exactco.de;
	s=x; h=To:References:Message-Id:Content-Transfer-Encoding:Cc:Date:In-Reply-To
	:From:Subject:Mime-Version:Content-Type:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=4y75qcVYgR38d17wD3n16fGetFs1+5TBWiIF0fUIsrI=; b=eNTN+/YlLbcmTclGkg6Qylmpb3
	Rw5pjalBIEall8brZldNEY5t3nXFu8WLCdXTVf1ptipiZWlS+Fz70vMdrcZLHhlxkmWdUocVKcs4j
	GYFnk3TTlpN18QKFrYlqfH2IGFwvrsOg9FxJGvBblCGSBC4h5l+IFSam0K9y5MnUt0pcvcnYYJhW/
	8kvk5JGz3x3aSI6GaM4a5B5q9xm/LzMbxTSNfDC9B4u1GSJYtzn2ax5CMd9AE1yPYT5lfcKcg9dbY
	x3FHfcQmQJTbR2JzqwaOFZhvJQd8F1j6ReSsxWUQd0E9y8LovQfJbEa4/+7JVeA57knomMU0sZ07J
	S8vir69Q==;
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.400.131.1.6\))
Subject: Re: [PATCH] HID: quirks: really enable the intended work around for
 appledisplay
From: =?utf-8?Q?Ren=C3=A9_Rebe?= <rene@exactco.de>
In-Reply-To: <20260205081131.426899-1-lukas.bulwahn@redhat.com>
Date: Thu, 5 Feb 2026 10:06:24 +0100
Cc: Jiri Kosina <jikos@kernel.org>,
 Benjamin Tissoires <bentiss@kernel.org>,
 linux-input@vger.kernel.org,
 kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Lukas Bulwahn <lukas.bulwahn@redhat.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <944F8139-6528-442E-BFC2-9609A7DACA2D@exactco.de>
References: <20260205081131.426899-1-lukas.bulwahn@redhat.com>
To: Lukas Bulwahn <lbulwahn@redhat.com>
X-Mailer: Apple Mail (2.3826.400.131.1.6)
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	R_DKIM_REJECT(1.00)[exactco.de:s=x];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MV_CASE(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_NEQ_ENVFROM(0.00)[rene@exactco.de,kernel-janitors@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-10150-lists,kernel-janitors=lfdr.de];
	DMARC_NA(0.00)[exactco.de];
	DKIM_TRACE(0.00)[exactco.de:-];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.983];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[kernel-janitors];
	RCPT_COUNT_SEVEN(0.00)[7];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 97F1AF06DB
X-Rspamd-Action: no action

Hi,

> On 5. Feb 2026, at 09:11, Lukas Bulwahn <lbulwahn@redhat.com> wrote:
>=20
> From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
>=20
> Commit c7fabe4ad921 ("HID: quirks: work around VID/PID conflict for
> appledisplay") intends to add a quirk for kernels built with Apple =
Cinema
> Display support, but it refers to the non-existing config option
> CONFIG_APPLEDISPLAY, whereas the config option for Apple Cinema =
Display
> support is named CONFIG_USB_APPLEDISPLAY.
>=20
> Refer to the intended config option CONFIG_USB_APPLEDISPLAY in the =
ifdef
> directive.
>=20
> Fixes: c7fabe4ad921 ("HID: quirks: work around VID/PID conflict for =
appledisplay")
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>
> ---
>=20
> Note this fix suggests that the patch of commit c7fabe4ad921 in this =
form
> was never effectively tested, checking the effect that the commit =
message
> claims it would have.

Thanks for spotting this. It was tested when I did this years ago. =
Though, maybe I
tested before adding the #if IS_ENABLED, anciently hit some key in Vim, =
o
something was renamed since then.

Either way, I=E2=80=99ll get the display out of the basement and re-test =
it the coming days.

	Ren=C3=A9

> drivers/hid/hid-quirks.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/hid/hid-quirks.c b/drivers/hid/hid-quirks.c
> index 3217e436c052..b91e081ef69c 100644
> --- a/drivers/hid/hid-quirks.c
> +++ b/drivers/hid/hid-quirks.c
> @@ -233,7 +233,7 @@ static const struct hid_device_id hid_quirks[] =3D =
{
>  * used as a driver. See hid_scan_report().
>  */
> static const struct hid_device_id hid_have_special_driver[] =3D {
> -#if IS_ENABLED(CONFIG_APPLEDISPLAY)
> +#if IS_ENABLED(CONFIG_USB_APPLEDISPLAY)
> { HID_USB_DEVICE(USB_VENDOR_ID_APPLE, 0x9218) },
> { HID_USB_DEVICE(USB_VENDOR_ID_APPLE, 0x9219) },
> { HID_USB_DEVICE(USB_VENDOR_ID_APPLE, 0x921c) },
> --=20
> 2.52.0
>=20

--=20
https://exactco.de =E2=80=A2 https://t2linux.com =E2=80=A2 =
https://patreon.com/renerebe


