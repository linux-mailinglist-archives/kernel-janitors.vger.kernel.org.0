Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D74A41B5B2B
	for <lists+kernel-janitors@lfdr.de>; Thu, 23 Apr 2020 14:15:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726392AbgDWMPY (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Thu, 23 Apr 2020 08:15:24 -0400
Received: from mout.web.de ([212.227.15.3]:55209 "EHLO mout.web.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726121AbgDWMPX (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 23 Apr 2020 08:15:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
        s=dbaedf251592; t=1587644090;
        bh=1SKzE4Q2FpgGEwUDDVzFQzRLWubTgqwnZLfvXfb0+ZQ=;
        h=X-UI-Sender-Class:To:Cc:Subject:From:Date;
        b=hXFnrrmBdJKOhkCU+WE8reYaNWVDUVxsvvUp3pSIEKiLZ7C5xhuw3DX0lkvZZEOFk
         blvnEHLdZv38q6W/xWdis4zfObjS/B6/BYwcQybTMSCGsbkqUqsBnjIr6bnbgcZA5h
         A7CGF/hVQCNsMI30Hd9p4gGSEtY1EZ7mmnksqrhA=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([78.49.69.235]) by smtp.web.de (mrweb003
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0Llncm-1isFw13qW8-00ZMyt; Thu, 23
 Apr 2020 14:14:50 +0200
To:     Dejin Zheng <zhengdejin5@gmail.com>,
        dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
        Teddy Wang <teddy.wang@siliconmotion.com>
Cc:     linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v1] fbdev: sm712fb: fix an issue about iounmap for a wrong
 address
From:   Markus Elfring <Markus.Elfring@web.de>
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
Message-ID: <bb6ba7c9-ad92-9c54-e1c4-91d2f7d0f5f8@web.de>
Date:   Thu, 23 Apr 2020 14:14:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:fNl1cgofnTwAo5SJnX+oCy/NEF1B/UCFW519u4Hpg0ptC1sJLg2
 Lgj12RzQSsSjYV5m1/DHaJzegclx/eSNoh1r5k//wRS5zMUgC9Lrt2HJs/fTqwOLs13QgbT
 2n0nkbFV5jiGwI3L/xUbZrEPLuluP8Fky8h39z9rIqSrLn+xkuDJ47lSEpS/HcclvwrYm9O
 aLXNjNhlma/j5HSigomOw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:ZKe2MMTCh5s=:TvG8BqpKT2GzCaKluhcfSy
 kB41QablcGOHx7krOy1EAlWK3bb+35IcWpQLqSgrS/JTIsh2oga1Zh0Ml/A0TjIFTRPlSZKkk
 ACd88BRBqnwsxCdTaqPtjrRzub+ug1qWae7hlkdsfG3vLbCN4I0igyKuFJHRE/dbjxM+pPbUm
 aEkgcoVb6xhkx3sEVY+NlZTtfobK5b3bkC47Dgu8OMnsQb+M+Md28w9Lh80/DhiaBgkhZv+jD
 Kiy8g5zuAafBU+SuyQJSFjYp72b7L8TkdK6CI0vQrOEDr4NWyEgwViDUmQYHZ8AqrsbVRS92+
 Z7vus94bMvaJNV0OCcZhJEQ+GfRAYTAstLP4RcEvQRaSsXQ5sCCgIKNqYApEMy5h169xBjSBH
 iy19lAZSl296Qswm3+n9TOrgVaDVpGCDO91LydWcjHbwB0xHQf0jIYWZNcDi5Cvitp7Vi4zRl
 xp4JlWz3K3HGD5SIFuSbtVNVaF196JRuYL4HnqLiz5i8vuRB4tTQEPAgQczNRyl6k0nuojWv3
 og/F2xr3f49ORUhlnNo/EWpqz3mf/VYIosYcPdABIlimywt+RAne0plOfuO8euRp/pD5cFlqk
 hYH99n/wLbZRgH00vxyPOyGvi4wv7Z2cZErrTGmGg3FyzUzMZv49YE8J2CrXvYSZGdTu7ASzr
 QJnKXrZIT+9ar0whJZavRB7fMH4M6MbGEMK2MrTmU+dVV8PFB2t3IZ7Pa0uIZJ0QjxTNWxoJk
 O/EAfi7Z5dhtlS6Jb1Rb4XAgp/nWDAfUaDx6aWC3AQDJn2OTFqr8rx2MiUvqAh634mg4Lv+80
 6NAC8HKVOBvxhQ5kfxaby+afxo1sKsoWfn6UuYnxxynVc0hDTeXtP3ObhtCDuFXYzHYp06o2S
 wGaAP4cvCkCMh0GythDdhbYNQfv6y6xTDHi1CB/4c7G0Kx3HFPMBrEzVZXe+Uu3vWV1PqcARt
 5pbm3UAgYdJybfVd9Sjw0NVzjMXVbQqosx6ynbyyEFl7BRP8F5DDr3WKpR8fFQSAO0GYSQkh5
 e7gi/Co3W5Nbf8OOyQTljy+3h1g/ZdWGdR2bnMaH1aTPlppbz+TfLVSSs/7qXEFfzfDBzgCk6
 Ekr8V+4vQHVWxLSDwoJ6CUTJ+mdvIyB17RyHndMfps6OqCPU0ATm5GM41rYn7Y8UxB8xIVluM
 xjqzG9HgjVhr/3uDBV14MA3qwJGrA8Y6a5as6qcRNLtxooMxS6XACtzjl3iOGR6vQcKgD46VJ
 veHKKNSOE/9WfqMKQ
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

> the sfb->fb->screen_base is not save the value get by iounmap() when
> the chip id is 0x720.

I suggest to improve this change description.
How did you determine relevant differences for the mentioned chip model?


> so iounmap() for address sfb->fb->screen_base is not right.

Will another imperative wording become helpful here?


=E2=80=A6
> +++ b/drivers/video/fbdev/sm712fb.c
> @@ -1429,6 +1429,8 @@  static int smtc_map_smem(struct smtcfb_info *sfb,
>  static void smtc_unmap_smem(struct smtcfb_info *sfb)
>  {
>  	if (sfb && sfb->fb->screen_base) {
> +		if (sfb->chip_id =3D=3D 0x720)
> +			sfb->fb->screen_base -=3D 0x00200000;
>  		iounmap(sfb->fb->screen_base);

How do you think about to use descriptive identifiers for
the shown constants?

Would you like to clarify any related software analysis approaches?

Regards,
Markus
