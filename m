Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E40DA1F5154
	for <lists+kernel-janitors@lfdr.de>; Wed, 10 Jun 2020 11:43:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727842AbgFJJns (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Wed, 10 Jun 2020 05:43:48 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:23216 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1727007AbgFJJnr (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 10 Jun 2020 05:43:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1591782226;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=cqenDkPII+w3N9PhboDRPWmnWtl237duUuxheBtHmo8=;
        b=G76ln/OnIfxWU3eNFgDtyNtLlhgPloY4BX8h32WuQAKMMpMK28C1m1v8Zli+0UjAsCmrr2
        +Ao2Esb1z3SavZJffwQYXAdldb/V1BXbGJqHEVAvlDJ1C1c69MAIvjYOQ+LqvyQmBW1V8z
        9+5aaequMhziMHX/DbzLHmxFGoibPCc=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-223-0u-MJCVGNNOwphSE_seZsg-1; Wed, 10 Jun 2020 05:43:45 -0400
X-MC-Unique: 0u-MJCVGNNOwphSE_seZsg-1
Received: by mail-wr1-f70.google.com with SMTP id n6so846932wrv.6
        for <kernel-janitors@vger.kernel.org>; Wed, 10 Jun 2020 02:43:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:content-transfer-encoding:from:mime-version
         :subject:date:message-id:references:cc:in-reply-to:to;
        bh=cqenDkPII+w3N9PhboDRPWmnWtl237duUuxheBtHmo8=;
        b=m4m0boQRhueN0z1QtWOiK/CPkNoO3iQ91mfMBNlqccoIx1tYETKcliTlBKImv+LAyo
         PMfpa/Pf5s8Fw9cqaysioGjXJdmzwCk7KT916tzsYxAGwN6/+QjTcR7TAJQPa5xuweoZ
         mSyqtTklE5OuAwJekepduB/sLiM9K3glP8sUrsNrR3Kk0QtKAq2h3pAjLb+dccXYsSjd
         /E8UoFAze1yQEn6Nw4ZlUTCL3xZxNVYTjXRbXBwt8cg9rRCACnjUnf3vdA0PRS7BczDD
         BBoa64vHQqBgXBcd6XiEWENy/UFGDFLLMsL7WXpbUCRwWk8o0xIzfX0x0Ssb3jE3IwwO
         Xw5Q==
X-Gm-Message-State: AOAM5334SwJNBSD2eq4Saa0jK+2fZHonlTynxwQ916QdjLlc1BM2qU25
        PZhoKfgWooNlFEb+cwlo1bO57QeIttaepxl6art9NTjam8vSVLfXJchrXY755n906WgwVooA8ip
        wnDNq5P9KmmY9nF8YYsQvttlS6Xrm
X-Received: by 2002:adf:ecc2:: with SMTP id s2mr2948661wro.60.1591782224277;
        Wed, 10 Jun 2020 02:43:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzVmcr+jf7/ZMdNhZWn5hNRs0ZgnnoTFCWKF9letJebZyLdzd6sY5umcaFiaoilisOKVzp02w==
X-Received: by 2002:adf:ecc2:: with SMTP id s2mr2948642wro.60.1591782224092;
        Wed, 10 Jun 2020 02:43:44 -0700 (PDT)
Received: from [192.168.3.122] (p4ff23dec.dip0.t-ipconnect.de. [79.242.61.236])
        by smtp.gmail.com with ESMTPSA id r5sm7527242wrq.0.2020.06.10.02.43.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Jun 2020 02:43:42 -0700 (PDT)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From:   David Hildenbrand <david@redhat.com>
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH] virtio-mem: silence a static checker warning
Date:   Wed, 10 Jun 2020 11:43:42 +0200
Message-Id: <56B2561B-33AC-40AB-9991-97EC72F9613F@redhat.com>
References: <20200610085911.GC5439@mwanda>
Cc:     David Hildenbrand <david@redhat.com>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Jason Wang <jasowang@redhat.com>,
        virtualization@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
In-Reply-To: <20200610085911.GC5439@mwanda>
To:     Dan Carpenter <dan.carpenter@oracle.com>
X-Mailer: iPhone Mail (17E262)
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org



> Am 10.06.2020 um 10:59 schrieb Dan Carpenter <dan.carpenter@oracle.com>:
>=20
> =EF=BB=BFSmatch complains that "rc" can be uninitialized if we hit the "br=
eak;"
> statement on the first iteration through the loop.  I suspect that this
> can't happen in real life, but returning a zero literal is cleaner and
> silence the static checker warning.
>=20

Right, it=E2=80=98s impossible in real life. Thanks!

Acked-by: David Hildenbrand <david@redhat.com>

> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> drivers/virtio/virtio_mem.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/virtio/virtio_mem.c b/drivers/virtio/virtio_mem.c
> index f658fe9149beb..893ef18060a02 100644
> --- a/drivers/virtio/virtio_mem.c
> +++ b/drivers/virtio/virtio_mem.c
> @@ -1192,7 +1192,7 @@ static int virtio_mem_mb_plug_any_sb(struct virtio_m=
em *vm, unsigned long mb_id,
>                        VIRTIO_MEM_MB_STATE_OFFLINE);
>    }
>=20
> -    return rc;
> +    return 0;
> }
>=20
> /*
> --=20
> 2.26.2
>=20

