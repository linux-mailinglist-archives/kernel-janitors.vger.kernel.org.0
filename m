Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0F28A1A2D7F
	for <lists+kernel-janitors@lfdr.de>; Thu,  9 Apr 2020 04:05:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726530AbgDICFX (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Wed, 8 Apr 2020 22:05:23 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:23943 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726510AbgDICFW (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 8 Apr 2020 22:05:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1586397921;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=JBPKhyG0v+2jRPxdQ/UjCeONAim5perez3xpMch6z0c=;
        b=CWcOGg3/vbv8ewAf23dis5ifdef5mVEooKe+eMTFayRR5S6URIpmQzJiOqihnRHbsSaVDC
        7YzpLlqIY4vIXn7X+JXN95NxRPSSeX9WQPZGXHmgOIQ91TV77j8KJF4/25QiTdJJ7DfNmz
        ouiJZS4/OXq7r2QVnxxQcuRNHuFwjNA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-502-wrVzGKVsN_yQvblvbPGyDg-1; Wed, 08 Apr 2020 22:05:20 -0400
X-MC-Unique: wrVzGKVsN_yQvblvbPGyDg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0CBC41800D71;
        Thu,  9 Apr 2020 02:05:19 +0000 (UTC)
Received: from [10.72.13.188] (ovpn-13-188.pek2.redhat.com [10.72.13.188])
        by smtp.corp.redhat.com (Postfix) with ESMTP id C572860BFB;
        Thu,  9 Apr 2020 02:05:14 +0000 (UTC)
Subject: Re: [PATCH 1/2] vdpa: Signedness bugs in vdpasim_work()
To:     Dan Carpenter <dan.carpenter@oracle.com>,
        "Michael S. Tsirkin" <mst@redhat.com>
Cc:     virtualization@lists.linux-foundation.org,
        kernel-janitors@vger.kernel.org
References: <20200406144509.GE68494@mwanda>
From:   Jason Wang <jasowang@redhat.com>
Message-ID: <6d817506-221a-7a50-540d-58ed34a18df3@redhat.com>
Date:   Thu, 9 Apr 2020 10:05:12 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200406144509.GE68494@mwanda>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Content-Transfer-Encoding: quoted-printable
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org


On 2020/4/6 =E4=B8=8B=E5=8D=8810:45, Dan Carpenter wrote:
> The "read" and "write" variables need to be signed for the error
> handling to work.
>
> Fixes: 2c53d0f64c06 ("vdpasim: vDPA device simulator")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>   drivers/vdpa/vdpa_sim/vdpa_sim.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/vdpa/vdpa_sim/vdpa_sim.c b/drivers/vdpa/vdpa_sim/v=
dpa_sim.c
> index 6e8a0cf2fdeb..b3c800653056 100644
> --- a/drivers/vdpa/vdpa_sim/vdpa_sim.c
> +++ b/drivers/vdpa/vdpa_sim/vdpa_sim.c
> @@ -132,7 +132,8 @@ static void vdpasim_work(struct work_struct *work)
>   						 vdpasim, work);
>   	struct vdpasim_virtqueue *txq =3D &vdpasim->vqs[1];
>   	struct vdpasim_virtqueue *rxq =3D &vdpasim->vqs[0];
> -	size_t read, write, total_write;
> +	ssize_t read, write;
> +	size_t total_write;
>   	int err;
>   	int pkts =3D 0;
>  =20


Acked-by: Jason Wang <jasowang@redhat.com>


