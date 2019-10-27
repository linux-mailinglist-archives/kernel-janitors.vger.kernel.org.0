Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 18B58E6527
	for <lists+kernel-janitors@lfdr.de>; Sun, 27 Oct 2019 20:56:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726940AbfJ0T4G (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Sun, 27 Oct 2019 15:56:06 -0400
Received: from mout.web.de ([212.227.15.4]:45547 "EHLO mout.web.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726444AbfJ0T4F (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Sun, 27 Oct 2019 15:56:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
        s=dbaedf251592; t=1572206151;
        bh=S+5gyOKr+ARwNkrg4UcLgqHG0pbtbH+v/M3v0ME89SU=;
        h=X-UI-Sender-Class:Cc:References:Subject:To:From:Date:In-Reply-To;
        b=QCMlP2DiqqfV1dHknpr7q4shXkfzMhxxrnOlLBv3WEsZuel6wC6izkjrzbo/IEq/r
         HFXWNL7aL/X8QSt71+GjyTW5cZrz6ghaN0IENM6O41OWKe4GTzVVARJCQuiFLtmCof
         AJ1NWyB4dfDgVuZ2vbgAm89senGrw1IFO6lnVyO4=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([93.132.56.174]) by smtp.web.de (mrweb004
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0LmxtE-1hmAVX0PTo-00h5Aa; Sun, 27
 Oct 2019 20:55:51 +0100
Cc:     Navid Emamdoost <emamd001@umn.edu>, Kangjie Lu <kjlu@umn.edu>,
        Stephen McCamant <smccaman@umn.edu>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>, Eric Anholt <eric@anholt.net>,
        LKML <linux-kernel@vger.kernel.org>,
        kernel-janitors@vger.kernel.org
References: <20191027173234.6449-1-navid.emamdoost@gmail.com>
Subject: Re: [PATCH] drm/tinydrm: Fix memroy leak in hx8357d_probe
To:     Navid Emamdoost <navid.emamdoost@gmail.com>,
        dri-devel@lists.freedesktop.org
From:   Markus Elfring <Markus.Elfring@web.de>
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
Message-ID: <85cb5ed9-66ba-3461-dd56-017b89ba70ce@web.de>
Date:   Sun, 27 Oct 2019 20:55:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <20191027173234.6449-1-navid.emamdoost@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:V7MW5M8iAruKle95RqhSpVNYxM9qFqhKA4pmswLNyMDELGYxjx2
 vcslc4aHozqIpNn9WRRABQUfhBvsqUyFfQt2tWvRy3VfeMY3mESF+1I+7QRXu9DqW7ifDu4
 LtylbbROrEJFOHAm3I3YtR2dUL87ISo5a5N042i2cOCIPiu3hskW2qzCbvrhWAmLK1aMBma
 aZB/6u+bLCo/OGWaEL5+g==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:lnrwGZG8EFg=:EoMYcfpeB0JPMDFX4gA8Sg
 moZvoe8BLN7e1FyVYeaozS6VOCup6q8cnrKKuOf1lgmqFZxIHXfU5QDB3x6F7mn7XJqmoCObO
 XbR8SwcIQWN68OvT3P4gesbbJTA5VROQu7AsR56G4jIYYSPvmHoSNTiWtBy11kRQZ/PWN8f5a
 kSjE3P1rZCjjl8ZC6nr4YBG0ZDzksj1sEdtB++DSPZmkEYOzg6sTlWbwVED5IOO2xck5PvYYW
 AjzQBvik3gFv+uF3/q8f2zJHQJdGQ/1uU3fY1gjVefNjR0r/I9iAwG8JTIF+t+dosC0YVqtWY
 jNOjV4gCB0ScYC1De66Mca1NWtcYzqmWP8WCJ3PmzbDI1ccS4xfRjUvo9TrQ/LssrEoly+kJh
 SFN4BmJyQBnVykdfZprk4YIuzcjZuiud6F0qUppnrgWRE+cayIPX/CbtOjONeC8LPhuDVoSjD
 najC84MbQphp/W5ycTLoeg95uP5FyIloKYYvVtsfb8HizoljK7Y3qCZ6AtRPU90Dv8+fPEvzm
 pVftWrHGwhlpZcn5grCSnFNxQHtrN/jySz/B1gb8+MA3hqhMZmQIJK3Tk0eFq1ckrMdJBxwya
 ME49rXbrvCZtHGHObpNxL9NNLFvceZYhUudRmDesR3s3s0OfOGXjt4bXif3qy4fzMOEgR3g/V
 nfbQI89B+Vl4d/EMoW42ZhvHJvUVo6JyHuDez2L08m2kiHnvaldaZn+BvjFkunZRlETKlQB7X
 OtmMw79XfIaRP9V0VOi82rzJQ+ivpQhNyaY57mmBHKG0FygPq+QkiRp08lwTeK3DbGvNLUXgG
 32iO174qK+RyaQ1dsa3ZovzzO4UqyA2EUw+1KanyXYIopB8WLDbXO3eYT+8zPikMP6shx6ST2
 S6Uc2rbCsncEVqrAkABswMcE1R4QgUEYf97LtPe16koRk2Z5fqnZtwVJP9AoimROb+9v8LK+e
 HFL7/1pr3W+W2OT/Auz9PUozEGOn6mAz4f2Qp/SipXSBMr78NdBLNSxarmUK+uNawgS8lMhE2
 cgh6aDPQzhg1iD6uxE4xDaQ0VEqCernhtG88vFtTYraEoLUISMtAsmwTVgJBTJvFFGDgXhvX9
 J9umttKUYl21gs2GfX20f1oD3W0O6Qq6a2wmGXUJngVH5sL2vUJ/bcyIsauVRoKDAhbEQ1+0O
 Az5wfOEgAGRwlS3V4sYnBUEcaEPyhBmtQt1U5hqZKjqxYtf9jIi+FS67q66DwMc/tJyhuncRB
 4mw5gdK9RtfCezryCOuGS2T2QAp5+5T0qyWbSG9BpzmpYmkeBIKev306pOFI=
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

=E2=80=A6
> +++ b/drivers/gpu/drm/tiny/hx8357d.c
> @@ -232,44 +232,49 @@ static int hx8357d_probe(struct spi_device *spi)
=E2=80=A6
> +		goto free_dbidev;
>
>  	spi_set_drvdata(spi, drm);

I got another development concern here.
Can it make sense to pass the variable =E2=80=9Cdbidev=E2=80=9D instead of=
 =E2=80=9Cdrm=E2=80=9D?


=E2=80=A6
> +free_dbidev:
> +	kfree(dbidev);
=E2=80=A6

I became curious if there is a need for such a memory release at another p=
lace.
How do you think about to add this function call also to the implementatio=
n
of the function =E2=80=9Chx8357d_remove=E2=80=9D?

Regards,
Markus
