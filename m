Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F197D2B5C17
	for <lists+kernel-janitors@lfdr.de>; Tue, 17 Nov 2020 10:47:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727454AbgKQJqt (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Tue, 17 Nov 2020 04:46:49 -0500
Received: from ns3.fnarfbargle.com ([103.4.19.87]:49392 "EHLO
        ns3.fnarfbargle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727397AbgKQJqs (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 17 Nov 2020 04:46:48 -0500
X-Greylist: delayed 1179 seconds by postgrey-1.27 at vger.kernel.org; Tue, 17 Nov 2020 04:46:47 EST
Received: from srv.home ([10.8.0.1] ident=heh10628)
        by ns3.fnarfbargle.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.84_2)
        (envelope-from <brad@fnarfbargle.com>)
        id 1kexFE-0007sE-EP; Tue, 17 Nov 2020 17:25:48 +0800
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=fnarfbargle.com; s=mail;
        h=To:In-Reply-To:Cc:References:Message-Id:Date:Subject:Mime-Version:From:Content-Transfer-Encoding:Content-Type; bh=jQwuWGsEr6HoLEFv5xrzW4ziIa+qGOFZsaqabKCar7M=;
        b=vYjhNbTDltqJxf6qFqFZhPVKnC60gJ695v7V0zmK/pFwyS+om8lvOiwgxOdr0n8kTVnWhbX+dqiDvSDG8BEvllPfj1E1JOyoPenT0FnGfxKO6UsAykkLAi9UPnQoGw1nHVsqCJB4XVe4K2AMjzNvtXS8gLJaVUH30OgrKjmyPUg=;
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From:   Brad Campbell <brad@fnarfbargle.com>
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH] hwmon: (applesmc) Fix smc_sane() function
Date:   Tue, 17 Nov 2020 20:25:41 +1100
Message-Id: <A530B4BD-89E0-4806-8F63-A967D02CD3CB@fnarfbargle.com>
References: <20201117072401.GE1111239@mwanda>
Cc:     Henrik Rydberg <rydberg@bitmath.org>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        linux-hwmon@vger.kernel.org, kernel-janitors@vger.kernel.org
In-Reply-To: <20201117072401.GE1111239@mwanda>
To:     Dan Carpenter <dan.carpenter@oracle.com>
X-Mailer: iPad Mail (17H35)
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

G=E2=80=99day Dan,

Have you tested that change on hardware?

Sent from an annoyingly small mobile device with no keyboard.

> On 17 Nov 2020, at 7:52 pm, Dan Carpenter <dan.carpenter@oracle.com> wrote=
:
>=20
> =EF=BB=BFThis test is reversed so the function will return without sending=

> the APPLESMC_READ_CMD or completing the rest of the function.
>=20
> Fixes: 4d64bb4ba5ec ("hwmon: (applesmc) Re-work SMC comms")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> drivers/hwmon/applesmc.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/hwmon/applesmc.c b/drivers/hwmon/applesmc.c
> index 79b498f816fe..289b39537683 100644
> --- a/drivers/hwmon/applesmc.c
> +++ b/drivers/hwmon/applesmc.c
> @@ -227,7 +227,7 @@ static int smc_sane(void)
>    int ret;
>=20
>    ret =3D wait_status(0, SMC_STATUS_BUSY);
> -    if (!ret)
> +    if (ret)
>        return ret;
>    ret =3D send_command(APPLESMC_READ_CMD);
>    if (ret)
> --=20
> 2.29.2
>=20
>=20

