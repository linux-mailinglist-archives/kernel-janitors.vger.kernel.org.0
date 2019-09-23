Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B7DA3BB0F3
	for <lists+kernel-janitors@lfdr.de>; Mon, 23 Sep 2019 11:07:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727989AbfIWJHq (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Mon, 23 Sep 2019 05:07:46 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:34280 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726089AbfIWJHn (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 23 Sep 2019 05:07:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1569229662;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=T8T8RjJYcGGqEc0WFaCwZbXoPKLFlizfkrKrigbsteU=;
        b=PJ5JO5M8r2zK0d+m2CRrEJ5zWlHAtuE0gYdY6n1GNzB5qTrXUzUMp0EmM7NSkgGwHAQPtx
        /R0E0iPhchgITwyuSugrqx2/geBkpsh3Nhfy+ODs+zBpQf/sDsC3gKE7GufpJ4JutHmcm+
        YTxz487GjSg1ywkgfidFb0goo7bt9mo=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-222-Ln7r2X_cP16QFrW_iTTDAA-1; Mon, 23 Sep 2019 05:07:41 -0400
Received: by mail-ed1-f71.google.com with SMTP id h3so3640526edd.7
        for <kernel-janitors@vger.kernel.org>; Mon, 23 Sep 2019 02:07:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=z5+JUdEcNbNbYnUHKbmarfCuTHHHOe0SmXNsWUScQrU=;
        b=sBpkSg1IcrLVDCaxSppmTKbV91WovU1/Q3XurQ5bhLxtNgj3asHRWEL/BwhC0ci6+6
         627nZwIaGEL8B5uFbKAya8U4skMpIfXYhoellwFSU3RthcI3rhyOSjiPxLqMN2u3MyTE
         /eftlDD4qTOU7sBSAkV2X1/pw8IS10aqhNJsLN91RrZriDJxE7CpRd52FctOCzmESJLS
         PbC9oMOYMhnbZv7s+wkvBwjmk1LyANESKGOUOd4jarVRQO4o0nIZaFijkw665p8N3FqX
         6SYgenbmd6JSlWX55LkjJH0VpAM9EINvkSZCy8T6R2c+7mrMmPDhkHOkAxL4rI6M3eLD
         LcqQ==
X-Gm-Message-State: APjAAAVNHMX3vA8EuyvneaGMm94GWQPXww7mSSLuIHkuoMEkgwOo6dCV
        AaR5VJWGsPISTczfvQ7rcgq+cJNMfLd3S6UqEWbHhMA7b6snRtrYDdgJisueC7DpVmEZLaotlU+
        iwv4gX83WGpUgogvPW3l+6CdJJTdZ
X-Received: by 2002:a50:fc0c:: with SMTP id i12mr34693070edr.82.1569229659514;
        Mon, 23 Sep 2019 02:07:39 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyCzq+l6MJPGlCUee90zOAQDFcFCUx0OtBxlJM4Nzjg7r/Nu6TdCyo4uiEsmUp7Cb5ztI+lUw==
X-Received: by 2002:a50:fc0c:: with SMTP id i12mr34693051edr.82.1569229659394;
        Mon, 23 Sep 2019 02:07:39 -0700 (PDT)
Received: from shalem.localdomain (84-106-84-65.cable.dynamic.v4.ziggo.nl. [84.106.84.65])
        by smtp.gmail.com with ESMTPSA id s16sm2244451edd.39.2019.09.23.02.07.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Sep 2019 02:07:38 -0700 (PDT)
Subject: Re: [PATCH] ata: libahci_platform: Use common error handling code in
 ahci_platform_get_resources()
To:     Markus Elfring <Markus.Elfring@web.de>, linux-ide@vger.kernel.org,
        Jens Axboe <axboe@kernel.dk>,
        Nishka Dasgupta <nishkadg.linux@gmail.com>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        kernel-janitors@vger.kernel.org
References: <6ca97aeb-0892-ed0e-a149-b25848adf324@web.de>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <7463a1d5-e76f-99a6-5a1e-f9477da3c1da@redhat.com>
Date:   Mon, 23 Sep 2019 11:07:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.0
MIME-Version: 1.0
In-Reply-To: <6ca97aeb-0892-ed0e-a149-b25848adf324@web.de>
Content-Language: en-US
X-MC-Unique: Ln7r2X_cP16QFrW_iTTDAA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hi,

On 22-09-2019 15:55, Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Sun, 22 Sep 2019 15:42:46 +0200
>=20
> Convert the call of the function =E2=80=9Cof_node_put=E2=80=9D to another=
 jump target
> so that it can be better reused at three places in this function.
>=20
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

Patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans



> ---
>   drivers/ata/libahci_platform.c | 17 +++++++----------
>   1 file changed, 7 insertions(+), 10 deletions(-)
>=20
> diff --git a/drivers/ata/libahci_platform.c b/drivers/ata/libahci_platfor=
m.c
> index e742780950de..7b2e364f3bd5 100644
> --- a/drivers/ata/libahci_platform.c
> +++ b/drivers/ata/libahci_platform.c
> @@ -497,8 +497,7 @@ struct ahci_host_priv *ahci_platform_get_resources(st=
ruct platform_device *pdev,
>=20
>   =09=09=09if (of_property_read_u32(child, "reg", &port)) {
>   =09=09=09=09rc =3D -EINVAL;
> -=09=09=09=09of_node_put(child);
> -=09=09=09=09goto err_out;
> +=09=09=09=09goto err_put_node;
>   =09=09=09}
>=20
>   =09=09=09if (port >=3D hpriv->nports) {
> @@ -515,18 +514,14 @@ struct ahci_host_priv *ahci_platform_get_resources(=
struct platform_device *pdev,
>   =09=09=09if (port_dev) {
>   =09=09=09=09rc =3D ahci_platform_get_regulator(hpriv, port,
>   =09=09=09=09=09=09=09=09&port_dev->dev);
> -=09=09=09=09if (rc =3D=3D -EPROBE_DEFER) {
> -=09=09=09=09=09of_node_put(child);
> -=09=09=09=09=09goto err_out;
> -=09=09=09=09}
> +=09=09=09=09if (rc =3D=3D -EPROBE_DEFER)
> +=09=09=09=09=09goto err_put_node;
>   =09=09=09}
>   #endif
>=20
>   =09=09=09rc =3D ahci_platform_get_phy(hpriv, port, dev, child);
> -=09=09=09if (rc) {
> -=09=09=09=09of_node_put(child);
> -=09=09=09=09goto err_out;
> -=09=09=09}
> +=09=09=09if (rc)
> +=09=09=09=09goto err_put_node;
>=20
>   =09=09=09enabled_ports++;
>   =09=09}
> @@ -558,6 +553,8 @@ struct ahci_host_priv *ahci_platform_get_resources(st=
ruct platform_device *pdev,
>   =09devres_remove_group(dev, NULL);
>   =09return hpriv;
>=20
> +err_put_node:
> +=09of_node_put(child);
>   err_out:
>   =09devres_release_group(dev, NULL);
>   =09return ERR_PTR(rc);
> --
> 2.23.0
>=20

