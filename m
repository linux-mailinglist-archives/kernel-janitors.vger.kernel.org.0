Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 13A16CD2A8
	for <lists+kernel-janitors@lfdr.de>; Sun,  6 Oct 2019 17:12:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727074AbfJFPMp (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Sun, 6 Oct 2019 11:12:45 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:55359 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726583AbfJFPMi (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sun, 6 Oct 2019 11:12:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1570374757;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Ayjqkd+6F5tmm8AS54Re2o3Pyp4pTiT6+zdlOJcfMbk=;
        b=D8l6XhWjrRsU1DomLrJdNABC3wKQghDFFKnqDOM2UB2xT6t3sWoFON/11o3cLrqZJPXtR+
        Ov11WbEH34tbSI/8VGvY+J/bGe8BjyMq5AXu4nhTyxX/ullR+XWBh24riJAjqJryp7yu6h
        S+iqEQ3irh3ywXQxKtXcKUhcZHtvDdY=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-65-EmPJrDO4O8y8OV0lNH0mCg-1; Sun, 06 Oct 2019 11:12:34 -0400
Received: by mail-ed1-f71.google.com with SMTP id t13so7356375edr.2
        for <kernel-janitors@vger.kernel.org>; Sun, 06 Oct 2019 08:12:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=BuDpUhvI7aRpTgMipmKvy1072necfiHV1oVcWtdfdWk=;
        b=AoOrXZCUtN/8Vbq4CsQOSIGRYFwAg7/EDCdKTxfpLEc/1um+0PjVCsn3OtGEkgc51t
         EoFydqgiA54y28RmsB/smSusOqqbNLvSu/sgtvzozbZ2cnNom/201pWzAExljVTP0Ma3
         7b0r7tjuPnyBZEJPGZePYBOk84aTrFkBdAI9viaXWgA+U1NK15HMB679lSnkpjwatCqT
         B4N8a8FAI4dyF4bLoQDLhloOhhxDLBWWNtSMFskEhIZxXAlR76MaKWztWiCF9y+PDym+
         naYMqqtef6o7gqrX9Qpnf4NA7IggXp+TmnFY+1wBxt6TL7ge4DC5xDUO+wwiAsBdQlpR
         eKag==
X-Gm-Message-State: APjAAAUG0K70GjItKBL9wBuywvsuJtWTSnf+lL67rZF9mOU7utJB2/V2
        1jaAOImGg+lfPgyQTvC+rJK+H+h90ZLMBiEGyjks0kNFJs+EZQN2qrpsgsQ3lxK0+yZwqYryixj
        zcxg71NFRzeG2avaYxyztBwQRWaNy
X-Received: by 2002:a50:d5c5:: with SMTP id g5mr25262074edj.57.1570374753787;
        Sun, 06 Oct 2019 08:12:33 -0700 (PDT)
X-Google-Smtp-Source: APXvYqx8xuAN6JoJIhDgzdot8v327ojmhlD04wuzq2pbA3tEuFPmtIbMqOD0YWQ9GkC5Sgd5GtB9dw==
X-Received: by 2002:a50:d5c5:: with SMTP id g5mr25262061edj.57.1570374753598;
        Sun, 06 Oct 2019 08:12:33 -0700 (PDT)
Received: from localhost.localdomain ([109.38.129.160])
        by smtp.gmail.com with ESMTPSA id n10sm168731ejr.82.2019.10.06.08.12.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 06 Oct 2019 08:12:32 -0700 (PDT)
Subject: Re: [PATCH] hwmon: abituguru: make array probe_order static, makes
 object smaller
To:     Colin King <colin.king@canonical.com>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20191006145231.24022-1-colin.king@canonical.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <1f7b29da-27f4-8dbb-c18b-e6cdc094d1dc@redhat.com>
Date:   Sun, 6 Oct 2019 17:12:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191006145231.24022-1-colin.king@canonical.com>
Content-Language: en-US
X-MC-Unique: EmPJrDO4O8y8OV0lNH0mCg-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hi,

On 10/6/19 4:52 PM, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
>=20
> Don't populate the array probe_order on the stack but instead make it
> static. Makes the object code smaller by 94 bytes.
>=20
> Before:
>     text=09   data=09    bss=09    dec=09    hex=09filename
>    41473=09  13448=09    320=09  55241=09   d7c9=09drivers/hwmon/abitugur=
u.o
>=20
> After:
>     text=09   data=09    bss=09    dec=09    hex=09filename
>    41315=09  13512=09    320=09  55147=09   d76b=09drivers/hwmon/abitugur=
u.o
>=20
> (gcc version 9.2.1, amd64)
>=20
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans



> ---
>   drivers/hwmon/abituguru.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/hwmon/abituguru.c b/drivers/hwmon/abituguru.c
> index a5cf6b2a6e49..681f0623868f 100644
> --- a/drivers/hwmon/abituguru.c
> +++ b/drivers/hwmon/abituguru.c
> @@ -1264,7 +1264,7 @@ static int abituguru_probe(struct platform_device *=
pdev)
>   =09 * El weirdo probe order, to keep the sysfs order identical to the
>   =09 * BIOS and window-appliction listing order.
>   =09 */
> -=09const u8 probe_order[ABIT_UGURU_MAX_BANK1_SENSORS] =3D {
> +=09static const u8 probe_order[ABIT_UGURU_MAX_BANK1_SENSORS] =3D {
>   =09=090x00, 0x01, 0x03, 0x04, 0x0A, 0x08, 0x0E, 0x02,
>   =09=090x09, 0x06, 0x05, 0x0B, 0x0F, 0x0D, 0x07, 0x0C };
>  =20
>=20

