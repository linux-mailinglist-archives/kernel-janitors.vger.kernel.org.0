Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 64770E655F
	for <lists+kernel-janitors@lfdr.de>; Sun, 27 Oct 2019 21:41:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727458AbfJ0Ul1 (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Sun, 27 Oct 2019 16:41:27 -0400
Received: from mout.web.de ([212.227.15.3]:35545 "EHLO mout.web.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726956AbfJ0Ul1 (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Sun, 27 Oct 2019 16:41:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
        s=dbaedf251592; t=1572208824;
        bh=fdTyo7vV8Ygs0smEv7TKyxgVnbINnmuc14/pBYAD8O8=;
        h=X-UI-Sender-Class:Cc:References:Subject:From:To:Date:In-Reply-To;
        b=DdxdYJybEKNcEHdVTcA1wfPlnCCpi1JHbOYWZZAemoHJOzTYBUio3G+LJoNXm8a64
         UgqUGuMfQhAiekzGUTH/L6t4t+ahJzVnX1nts4XgLxKsFePHpCjjU5Z+7SK/n3rUF0
         RsAPqQ1h30OVdhNFgxJMb3EcTSXQ217i+84HgWjA=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([93.132.56.174]) by smtp.web.de (mrweb004
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0M1lTm-1i95w53Zko-00toSL; Sun, 27
 Oct 2019 21:40:24 +0100
Cc:     Navid Emamdoost <emamd001@umn.edu>, Kangjie Lu <kjlu@umn.edu>,
        Stephen McCamant <smccaman@umn.edu>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jaroslav Kysela <perex@perex.cz>,
        Richard Fontana <rfontana@redhat.com>,
        Takashi Iwai <tiwai@suse.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        kernel-janitors@vger.kernel.org,
        LKML <linux-kernel@vger.kernel.org>
References: <20191027191206.30820-1-navid.emamdoost@gmail.com>
Subject: Re: [PATCH] ALSA: pci: Fix memory leak in snd_korg1212_create
From:   Markus Elfring <Markus.Elfring@web.de>
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
To:     Navid Emamdoost <navid.emamdoost@gmail.com>,
        alsa-devel@alsa-project.org
Message-ID: <47c90b48-8706-7860-3b87-30a7bbb726c0@web.de>
Date:   Sun, 27 Oct 2019 21:40:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <20191027191206.30820-1-navid.emamdoost@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:VhIY9yFjZXbtQ6qV9/ZOcz6TJkURhYZR0SJqiaWNfE+L5z/1UZi
 FkcIk7wdeyuAg3vJyvl+YjZTzpOuaSfJ/6njo9prBrAPchWMajontD35RmGAtTFoI7XhHaK
 20SqfpbEJs5FP9naT28l0uRKY6X4bMampz53e5NiDgKMxIooGACVij6M3MkvzOXFqAr5AGC
 XiBoA30vqGtcAsp/BgUnA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:yRaZ95qpk3o=:sdaI6nuqkPpaGsXk7urmt/
 nJwu1TKvvqna9hJhB+uQoDCoqNJOxpYT1gdXDrH2rBPA7jfEIkrkPPPgXrP839FtEkoKH/TZ5
 Us/RO6Kloaw0aoqaUQ3BDUOh4tq7WBNQKpcMM/poQdDrr2fgjbn7mvQ3yAf0UBB1ifRCmrtmy
 JFmsg6C6iqCBqg8hDYi/k1ZjsoNZFJoUQyB4205DGA2bSJwT0KevQ7CPi87sTblobtSECHFwZ
 A0AnLKsbOG83MyLCA0qUcZV7dcuVHWJ1u2gnTyxhIFZto1+4RYRl1b1Z35VMDEIEIzYHgi5fT
 lWq6hJ1qrdahOHxi3YSy313Ow+vQjp+hH5pXlPjUwhLK40mUEuoaDrcQVrJr8WzqVlG/KULaC
 RquFECUAjI6HkTLj5fAAZ+kpLjPpxdzyJ6Y6O/6Pb9gZL1KsQ1FtN2kTqrL3/C2K32Jnt0W51
 OkKgghCf0XN4XNh9OpJ8e7HZQWEeExZis19h80Yn0bx5O/PXTCjLfcDTLnDJ7wnG9YPPqCYAx
 ZisbQrXTzQ0iiV9ZVqdShmFwZrPA+JHp3uLsTvncff7INl/bFnB7S9hC5g+L/FeOnsDk8VfRH
 bzZijdAfufaX9LDQxBCzb2gYu+KPcKYz1kfDpasrsfkq1me/TPqruGzG9mdgwilbikB7tcC5x
 932Dw53qZjWEJ+HPDwQvVQZK0YLI90io44TH/Iwak3vZZlR1wB7FklNWx5t8TmTNgwwkw3JmG
 O/m3UodBonyHdYxa5PWpH4jgPCUXnyq5zpk3cFnpjctMzkyyGl4v6oYv64jfrSTfTHYcrEmBO
 AeyP07O15rWVeZQtY/ocncYO3xV1IhYvOERCKDBeyg6bJGdWdRacs942RdWRhc7de2oXPj1fq
 83QdBUdqh55dgCqgHnNhJVwCs1W5jQRU+YGiQM9Om6hQdCx6tEc2gh0dNQuKFhGVKPmSUSghT
 jnLL8WAKvs+uHZsL14SBv7IIawSmKAHC8B08q83rc3O/hzTTkCBziei7p3+dMjFQlyt5IZdqU
 VSdcBfYVItKzhp5+bvj7QUKCbf2tzjSgVL/2j2LMfmbD8+aHa5vZ2JEGrU0W1spHxxl2u3naT
 6C4Geo3TiC0c4a/Kcm/FjK1cYsG65g7YyHitZH7F0pVviLLGkwIi0sYYV4JoLyiM8S7Sd9LM9
 nwV33epE/vSxDluY3B9VCQiaqyNzr2W/mtD9cR5xCKGA1CxHr5m54zjzM6Cc6oNwyqKwMv1vy
 r1MksjdnZVLsP501JJnOpNPf4Kz6D3eaW0kgqjxp8qar/GGgY3C+GeFdRlH0=
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

=E2=80=A6
> +++ b/sound/pci/korg1212/korg1212.c
=E2=80=A6
> @@ -2398,8 +2403,10 @@ static int snd_korg1212_create(struct snd_card *c=
ard, struct pci_dev *pci,
>
>          for (i =3D 0; i < ARRAY_SIZE(snd_korg1212_controls); i++) {
>                  err =3D snd_ctl_add(korg1212->card, snd_ctl_new1(&snd_k=
org1212_controls[i], korg1212));
> -                if (err < 0)
> +		if (err < 0) {
> +			snd_korg1212_free(korg1212);
>                          return err;
> +		}

I suggest to add a jump target according to the Linux coding style
so that duplicate exception handling code can be reduced.

 	return 0;

+free_korg:
+	snd_korg1212_free(korg1212);
+	return err;
 }


Regards,
Markus
