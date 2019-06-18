Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B133F4AB36
	for <lists+kernel-janitors@lfdr.de>; Tue, 18 Jun 2019 21:50:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730538AbfFRTuS (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Tue, 18 Jun 2019 15:50:18 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:43709 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730467AbfFRTuS (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 18 Jun 2019 15:50:18 -0400
Received: by mail-pg1-f193.google.com with SMTP id f25so8233295pgv.10
        for <kernel-janitors@vger.kernel.org>; Tue, 18 Jun 2019 12:50:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=wjifz5uHPldc8PDdCIO5f85gTwG04S/iIKsvaQyfdkE=;
        b=uo1cGiknudQ1DmCFoJu+xmQeQ2RwtsorW/AgOgRgz5ePe8JksVTzzAQCMOiHqsKF5t
         Gi/DoHlCUw0++GW308UhmYRN/rpi3H/RUiquyEAEmyQdKMt5CSxJaqip8s9vdwfuxbnQ
         1+sQlO+q9ECK0U9ayKPWpBg3Bo4QHSVQUtqUbKZyLpX88dwGBKkSkDN4V2pmterJYqeK
         AsGKz+aYxJtU79kA0yg6Z+mTzDUoUjFTNUAGbSwY4Jjivr3Ss5J2wLg5au7JTnMXSUbp
         Ri+v4EQF5tDhRLg3lCpDi9Q87Q+vtSKa1tcCioQkh3Sp/MnpwqPYY9HJ6YdqYGgTI4Af
         l3dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=wjifz5uHPldc8PDdCIO5f85gTwG04S/iIKsvaQyfdkE=;
        b=JENnxUb1hIAIFbmerVoV8wbQMyAOaGZ96o8wVzP7vOh8qUCsTuAJbQsCARFyPBQkfy
         VcNNWbDhBWpC9WVKBVpN7sk6ynk0IU4zpKHqR+4SIWTJqlzIYfBYUOmiLm6eZX/9w+9H
         tge/vMsq4wh/qSs2KLGnQsHURrrRtemWAgvPl1ZR9d4gQQbvQUqZgQaP4iqTrODOUHD8
         ED85wx97KaiQySGT6RmuC3slsLJin8hUQhUI281a0bC10e4co6LHtfjn27JicK0jkgG6
         tbYt81X/Q4HrxW7QDHKPhzE9109Vbh5PRPOzx3GUWyH04Hv7yl2CnvO0/D+FmH5HGjSy
         im7g==
X-Gm-Message-State: APjAAAU71PzAvlBPF1mhhL27AtKaRTuBh9qgeik4XasHk8gl3qgpXlJI
        5g53M8SCsnXgwd13G+Ze/XKViQ==
X-Google-Smtp-Source: APXvYqwPnu8RBmlL3E+Q7vpolsbVlPjST5zSI2vPiZwMCGYSPhgpa6ysjJMPAePvkMGJydTgegwmKw==
X-Received: by 2002:a17:90a:35e5:: with SMTP id r92mr7097863pjb.34.1560887416690;
        Tue, 18 Jun 2019 12:50:16 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:bc61:d85d:eb16:9036])
        by smtp.gmail.com with ESMTPSA id g17sm19819854pfb.56.2019.06.18.12.50.15
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 18 Jun 2019 12:50:15 -0700 (PDT)
Date:   Tue, 18 Jun 2019 12:50:11 -0700
From:   Benson Leung <bleung@google.com>
To:     Colin King <colin.king@canonical.com>
Cc:     Benson Leung <bleung@chromium.org>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Nick Crews <ncrews@chromium.org>,
        kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH][next] platform/chrome: wilco_ec: fix null pointer
 dereference on failed kzalloc
Message-ID: <20190618195011.GB209269@google.com>
References: <20190618153924.19491-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="6sX45UoQRIJXqkqR"
Content-Disposition: inline
In-Reply-To: <20190618153924.19491-1-colin.king@canonical.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org


--6sX45UoQRIJXqkqR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Colin,

On Tue, Jun 18, 2019 at 04:39:24PM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
>=20
> If the kzalloc of the entries queue q fails a null pointer dereference
> occurs when accessing q->capacity and q->lock.  Add a kzalloc failure
> check and handle the null return case in the calling function
> event_device_add.
>=20
> Addresses-Coverity: ("Dereference null return")
> Fixes: 75589e37d1dc ("platform/chrome: wilco_ec: Add circular buffer as e=
vent queue")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied. Thanks.

Benson

> ---
>  drivers/platform/chrome/wilco_ec/event.c | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/platform/chrome/wilco_ec/event.c b/drivers/platform/=
chrome/wilco_ec/event.c
> index c975b76e6255..e251a989b152 100644
> --- a/drivers/platform/chrome/wilco_ec/event.c
> +++ b/drivers/platform/chrome/wilco_ec/event.c
> @@ -112,8 +112,11 @@ module_param(queue_size, int, 0644);
>  static struct ec_event_queue *event_queue_new(int capacity)
>  {
>  	size_t entries_size =3D sizeof(struct ec_event *) * capacity;
> -	struct ec_event_queue *q =3D kzalloc(sizeof(*q) + entries_size,
> -					   GFP_KERNEL);
> +	struct ec_event_queue *q;
> +
> +	q =3D kzalloc(sizeof(*q) + entries_size, GFP_KERNEL);
> +	if (!q)
> +		return NULL;
> =20
>  	q->capacity =3D capacity;
>  	spin_lock_init(&q->lock);
> @@ -474,6 +477,11 @@ static int event_device_add(struct acpi_device *adev)
>  	/* Initialize the device data. */
>  	adev->driver_data =3D dev_data;
>  	dev_data->events =3D event_queue_new(queue_size);
> +	if (!dev_data->events) {
> +		kfree(dev_data);
> +		error =3D -ENOMEM;
> +		goto free_minor;
> +	}
>  	init_waitqueue_head(&dev_data->wq);
>  	dev_data->exist =3D true;
>  	atomic_set(&dev_data->available, 1);
> --=20
> 2.20.1
>=20

--=20
Benson Leung
Staff Software Engineer
Chrome OS Kernel
Google Inc.
bleung@google.com
Chromium OS Project
bleung@chromium.org

--6sX45UoQRIJXqkqR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQQCtZK6p/AktxXfkOlzbaomhzOwwgUCXQlAcwAKCRBzbaomhzOw
wr+OAQDkPiwWk7AV6oZD5PfPYh/XkD9jN7eDN/xgit4T9H45EAEA7vDa2nw7IoFX
InIF4BYsfI/ilZ9ZuBM8hpW43YKKswg=
=s73v
-----END PGP SIGNATURE-----

--6sX45UoQRIJXqkqR--
