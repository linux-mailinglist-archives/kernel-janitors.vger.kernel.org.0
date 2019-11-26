Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C2C511099EA
	for <lists+kernel-janitors@lfdr.de>; Tue, 26 Nov 2019 09:04:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725817AbfKZIEX (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Tue, 26 Nov 2019 03:04:23 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:54121 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1725372AbfKZIEW (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 26 Nov 2019 03:04:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1574755461;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=p0QjVXdu4Y2AOINMSIfcze5ED2P1CMqFasZGrM6CNSw=;
        b=EOljQEuAhS2stHtrsafrzB2zzXQ1CKrm3bpDYOx3DSJaghqEkOfsl+ZDVtUTe1HEGxKfF9
        TjeoYbLvl9TCjbP9shqxMOhDXk83KcT7gm7FFzuu0eqJPSJWxpnAzZRHD3L2XF7cG7Lrio
        beDORihE6zcWk0nYKEsNB53YKVP6w2M=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-151-kuIjnRWbOhuuXr7V4gOxUg-1; Tue, 26 Nov 2019 03:04:20 -0500
Received: by mail-lf1-f72.google.com with SMTP id u14so1972568lfg.3
        for <kernel-janitors@vger.kernel.org>; Tue, 26 Nov 2019 00:04:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
         :message-id:mime-version;
        bh=xAdyr+rwPBLDYub0Hn/ky8FJbrCeMk6nQjNxbDanCII=;
        b=mpdCjaNR+Lvp51QkqkuvYMzJDgW2Dg5as+nfNE+taUoQ6CfLn8Wn0c+MbxPM+yxikm
         /a5NClAJ05MSLGUrlSSvnuRZweHvktUW3qL4yCc8HLtI5wKhNH4P4pYIgQnkA17FPiiS
         8mbnQF9HlQDV+TE+KejN+YwAagZdaZaPmnOj7d6eucEOz2XyvhtGEGp1WgUzABiBvEco
         dGgFdKhFdgDVofT2Dx4T3Yz0sAOITsp7fD5FVKdTkT5Iimnn6zTS2Lz9LXEtLqrKMShh
         4MlHaAocsgcvw7a8406uLhbbos6TReUVmWdG69p+4BLWluarIfhlvwecEmUU6zRYVzER
         CNlQ==
X-Gm-Message-State: APjAAAWPrtyl1V8ZiPSXu8SFJNhqvT1Tc+lsi/E2i6V3JOoP5iA1661F
        B2E2c54nL7GJSN/ukTruJijUWoP9fumMyuRi+DQkp5hWjhEj6EtZUb8ySaQjKMfZtiVEoUdTtp/
        vkvJJoJnp1S6cdQVgq8e0ikZ+h7++
X-Received: by 2002:ac2:4553:: with SMTP id j19mr24471016lfm.142.1574755458233;
        Tue, 26 Nov 2019 00:04:18 -0800 (PST)
X-Google-Smtp-Source: APXvYqw32eL/XdPUwR/CzkaxG5SqjRG2kkpXaZKBrJPo2BO5WZZmA6tdOKC/JAyRfetBu+oBmdQytA==
X-Received: by 2002:ac2:4553:: with SMTP id j19mr24470996lfm.142.1574755458008;
        Tue, 26 Nov 2019 00:04:18 -0800 (PST)
Received: from alrua-x1.borgediget.toke.dk ([2a0c:4d80:42:443::2])
        by smtp.gmail.com with ESMTPSA id n14sm4744577lfe.40.2019.11.26.00.04.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Nov 2019 00:04:17 -0800 (PST)
Received: by alrua-x1.borgediget.toke.dk (Postfix, from userid 1000)
        id 5460B1818BF; Tue, 26 Nov 2019 09:04:15 +0100 (CET)
From:   Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
To:     Dan Carpenter <dan.carpenter@oracle.com>,
        Felix Fietkau <nbd@nbd.name>
Cc:     Lorenzo Bianconi <lorenzo.bianconi83@gmail.com>,
        Ryder Lee <ryder.lee@mediatek.com>,
        Roy Luo <royluo@google.com>, Kalle Valo <kvalo@codeaurora.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        linux-wireless@vger.kernel.org, linux-mediatek@lists.infradead.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] mt76: Off by one in mt76_calc_rx_airtime()
In-Reply-To: <20191121213935.2cbgh3qmd4hv4v5a@kili.mountain>
References: <20191121213935.2cbgh3qmd4hv4v5a@kili.mountain>
X-Clacks-Overhead: GNU Terry Pratchett
Date:   Tue, 26 Nov 2019 09:04:15 +0100
Message-ID: <87v9r7ysg0.fsf@toke.dk>
MIME-Version: 1.0
X-MC-Unique: kuIjnRWbOhuuXr7V4gOxUg-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Dan Carpenter <dan.carpenter@oracle.com> writes:

> The sband->bitrates[] array has "sband->n_bitrates" elements so this
> check needs to be >=3D instead of > or we could read beyond the end of th=
e
> array.
>
> These values come from when we call mt76_register_device():
>
> =09ret =3D mt76_register_device(&dev->mt76, true, mt7603_rates,
> =09=09=09=09   ARRAY_SIZE(mt7603_rates));
>
> Here sband->bitrates[] is mt7603_rates[] and ->n_bitrates is the
> ARRAY_SIZE()
>
> Fixes: 5ce09c1a7907 ("mt76: track rx airtime for airtime fairness and sur=
vey")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  drivers/net/wireless/mediatek/mt76/airtime.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/net/wireless/mediatek/mt76/airtime.c b/drivers/net/w=
ireless/mediatek/mt76/airtime.c
> index 55116f395f9a..a4a785467748 100644
> --- a/drivers/net/wireless/mediatek/mt76/airtime.c
> +++ b/drivers/net/wireless/mediatek/mt76/airtime.c
> @@ -242,7 +242,7 @@ u32 mt76_calc_rx_airtime(struct mt76_dev *dev, struct=
 mt76_rx_status *status,
>  =09=09=09return 0;
> =20
>  =09=09sband =3D dev->hw->wiphy->bands[status->band];
> -=09=09if (!sband || status->rate_idx > sband->n_bitrates)
> +=09=09if (!sband || status->rate_idx >=3D sband->n_bitrates)
>  =09=09=09return 0;
> =20
>  =09=09rate =3D &sband->bitrates[status->rate_idx];

This code has recently been ported to mac80211 (net/mac80211/airtime.c).
It seems that the bug is also present there; care to send a patch for
that as well? :)

-Toke

