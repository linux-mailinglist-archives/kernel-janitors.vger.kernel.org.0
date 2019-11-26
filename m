Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 766BC109AF3
	for <lists+kernel-janitors@lfdr.de>; Tue, 26 Nov 2019 10:16:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727486AbfKZJQT (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Tue, 26 Nov 2019 04:16:19 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:32219 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727483AbfKZJQS (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 26 Nov 2019 04:16:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1574759777;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=vb+oxQxZRkNlkuBEQUYVCl/O5AvuVY4nZz95WVzmQq8=;
        b=EdpzRc8JhTiLchPwYZZW4ww4kbVEkgW9pr17buLOHPZQg9bexXfyw5LKraQ8SCG00g55Cn
        cCNU0TYQVW+q5hb2QOAwkWmLj5reGG/zAa+CS17olWpXpca5yGt7Kp27+AeYiY618tjxms
        1vnheu8hrmCQ+HES95LBzqpjO0VKbn0=
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com
 [209.85.208.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-376-4Sof4EulMXO4ffS668kq7g-1; Tue, 26 Nov 2019 04:16:14 -0500
Received: by mail-lj1-f197.google.com with SMTP id o20so3550160ljg.0
        for <kernel-janitors@vger.kernel.org>; Tue, 26 Nov 2019 01:16:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
         :message-id:mime-version:content-transfer-encoding;
        bh=+GixzF/KaQHv0D6//vs+c5ZE/FXLP7KWC/hh8q0IT38=;
        b=lliC4JHOFaM+51TuUwNokF7kDRhpb7B5wJpZMW0zDlLt7V4QRGoFBe6IYwXwT2g1Gb
         zWNm0SgDDvcKIE9wDFTBlgzqsTh0jlwZRoGF28PMMFQw5GoUS26FmfSblKo8MlkO7I/V
         q+1LvLTUt1/qVJfPQq1bQAgYJBZ/7kn6TXX6pQEo+NWZV46yfvkh9OFyfGeCikoH4lw1
         2WJ5yr08lUFOHeLYXOXnzyGcrycGkFxVrSsFpOOUeARkt+yeCKB+PI38k6cK8x+bi0Sl
         i9UpImQUyhs1Q46vQobA46qiqR1e31RrJCu/cr2QbGh9abhziNVZvGYk2wd9sBp9OGcY
         I2wg==
X-Gm-Message-State: APjAAAWCSaAJo5TB4sCj6UruAmcp9ZNu6xLdqE+QwdM+P50EMVcvnhdQ
        P3x9gNWi1egsuFfaOey5lVDDlziz7EY441OvGsnUe6reiKVsNvD/NQMch1Czhi0WZKTWzmENTX7
        8fNUmHCFs8yQrymTtCMh5iwSO8I30
X-Received: by 2002:a19:f811:: with SMTP id a17mr23461984lff.132.1574759772774;
        Tue, 26 Nov 2019 01:16:12 -0800 (PST)
X-Google-Smtp-Source: APXvYqxi4cxslTGXaPEgklZisShtCL52V7ndFFVsbgvulKaJ2kiSJRyrQs7o0m+akem1uQZYddlS3g==
X-Received: by 2002:a19:f811:: with SMTP id a17mr23461957lff.132.1574759772531;
        Tue, 26 Nov 2019 01:16:12 -0800 (PST)
Received: from alrua-x1.borgediget.toke.dk ([45.145.92.2])
        by smtp.gmail.com with ESMTPSA id s27sm4937135lfc.31.2019.11.26.01.16.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Nov 2019 01:16:11 -0800 (PST)
Received: by alrua-x1.borgediget.toke.dk (Postfix, from userid 1000)
        id DC18D1818BF; Tue, 26 Nov 2019 10:16:10 +0100 (CET)
From:   Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Felix Fietkau <nbd@nbd.name>,
        Lorenzo Bianconi <lorenzo.bianconi83@gmail.com>,
        Ryder Lee <ryder.lee@mediatek.com>,
        Roy Luo <royluo@google.com>, Kalle Valo <kvalo@codeaurora.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        linux-wireless@vger.kernel.org, linux-mediatek@lists.infradead.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] mt76: Off by one in mt76_calc_rx_airtime()
In-Reply-To: <20191126091150.GA1759@kadam>
References: <20191121213935.2cbgh3qmd4hv4v5a@kili.mountain> <87v9r7ysg0.fsf@toke.dk> <20191126091150.GA1759@kadam>
X-Clacks-Overhead: GNU Terry Pratchett
Date:   Tue, 26 Nov 2019 10:16:10 +0100
Message-ID: <87h82ryp45.fsf@toke.dk>
MIME-Version: 1.0
X-MC-Unique: 4Sof4EulMXO4ffS668kq7g-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Dan Carpenter <dan.carpenter@oracle.com> writes:

> On Tue, Nov 26, 2019 at 09:04:15AM +0100, Toke H=C3=B8iland-J=C3=B8rgense=
n wrote:
>> Dan Carpenter <dan.carpenter@oracle.com> writes:
>>=20
>> > The sband->bitrates[] array has "sband->n_bitrates" elements so this
>> > check needs to be >=3D instead of > or we could read beyond the end of=
 the
>> > array.
>> >
>> > These values come from when we call mt76_register_device():
>> >
>> > =09ret =3D mt76_register_device(&dev->mt76, true, mt7603_rates,
>> > =09=09=09=09   ARRAY_SIZE(mt7603_rates));
>> >
>> > Here sband->bitrates[] is mt7603_rates[] and ->n_bitrates is the
>> > ARRAY_SIZE()
>> >
>> > Fixes: 5ce09c1a7907 ("mt76: track rx airtime for airtime fairness and =
survey")
>> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>> > ---
>> >  drivers/net/wireless/mediatek/mt76/airtime.c | 2 +-
>> >  1 file changed, 1 insertion(+), 1 deletion(-)
>> >
>> > diff --git a/drivers/net/wireless/mediatek/mt76/airtime.c b/drivers/ne=
t/wireless/mediatek/mt76/airtime.c
>> > index 55116f395f9a..a4a785467748 100644
>> > --- a/drivers/net/wireless/mediatek/mt76/airtime.c
>> > +++ b/drivers/net/wireless/mediatek/mt76/airtime.c
>> > @@ -242,7 +242,7 @@ u32 mt76_calc_rx_airtime(struct mt76_dev *dev, str=
uct mt76_rx_status *status,
>> >  =09=09=09return 0;
>> > =20
>> >  =09=09sband =3D dev->hw->wiphy->bands[status->band];
>> > -=09=09if (!sband || status->rate_idx > sband->n_bitrates)
>> > +=09=09if (!sband || status->rate_idx >=3D sband->n_bitrates)
>> >  =09=09=09return 0;
>> > =20
>> >  =09=09rate =3D &sband->bitrates[status->rate_idx];
>>=20
>> This code has recently been ported to mac80211 (net/mac80211/airtime.c).
>> It seems that the bug is also present there; care to send a patch for
>> that as well? :)
>
> Oh.  Thanks for pointing that out.  I actually saw the static checker
> warning for that and ignored it thinking that it was the same code.
> :P

Well, it's copy-pasted from the same code ;)

The plan is to get rid of the version inside mt76; was waiting for the
trees to converge, though, so I guess after the merge window?

> I will send a fix for it.

Great, thanks!

-Toke

