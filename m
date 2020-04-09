Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 52D621A2D86
	for <lists+kernel-janitors@lfdr.de>; Thu,  9 Apr 2020 04:06:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726582AbgDICGo (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Wed, 8 Apr 2020 22:06:44 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:53712 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726552AbgDICGo (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 8 Apr 2020 22:06:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1586398004;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=jb0XW8Q7NTla9I4KOfElXRxKDzIVaSfCW8rC9NnVEEk=;
        b=VAaE04dUt5AHboIIqTwiZupvcWPj++7PDbmfyIMCSDkrrzmbs/rsIGgKmzJwOC1+Jnu73d
        2vYwKXDFXX+jUGP9SNjZCVT6043hwoUF6YxesYeZL+XbOr5QDqfAVfC3f3tXurRyDRHVIR
        snhJ2labvpHYbp3PUaRQdYk/+DVY9F8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-301-INAbm9-hMjWW_0xk6Fq6rQ-1; Wed, 08 Apr 2020 22:06:42 -0400
X-MC-Unique: INAbm9-hMjWW_0xk6Fq6rQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A49AC18AB2C3;
        Thu,  9 Apr 2020 02:06:41 +0000 (UTC)
Received: from [10.72.13.188] (ovpn-13-188.pek2.redhat.com [10.72.13.188])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 3AB451001DC2;
        Thu,  9 Apr 2020 02:06:36 +0000 (UTC)
Subject: Re: [PATCH 2/2] vdpa: Fix pointer math bug in vdpasim_get_config()
To:     Dan Carpenter <dan.carpenter@oracle.com>,
        "Michael S. Tsirkin" <mst@redhat.com>
Cc:     virtualization@lists.linux-foundation.org,
        kernel-janitors@vger.kernel.org
References: <20200406144552.GF68494@mwanda>
From:   Jason Wang <jasowang@redhat.com>
Message-ID: <d463d227-92ff-d35f-6b3c-b86b85613da1@redhat.com>
Date:   Thu, 9 Apr 2020 10:06:35 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200406144552.GF68494@mwanda>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Content-Transfer-Encoding: quoted-printable
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org


On 2020/4/6 =E4=B8=8B=E5=8D=8810:45, Dan Carpenter wrote:
> If "offset" is non-zero then we end up copying from beyond the end of
> the config because of pointer math.  We can fix this by casting the
> struct to a u8 pointer.
>
> Fixes: 2c53d0f64c06 ("vdpasim: vDPA device simulator")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> Is it really worth letting people specify the offset?
>
>   drivers/vdpa/vdpa_sim/vdpa_sim.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/vdpa/vdpa_sim/vdpa_sim.c b/drivers/vdpa/vdpa_sim/v=
dpa_sim.c
> index b3c800653056..e03c25765513 100644
> --- a/drivers/vdpa/vdpa_sim/vdpa_sim.c
> +++ b/drivers/vdpa/vdpa_sim/vdpa_sim.c
> @@ -509,7 +509,7 @@ static void vdpasim_get_config(struct vdpa_device *=
vdpa, unsigned int offset,
>   	struct vdpasim *vdpasim =3D vdpa_to_sim(vdpa);
>  =20
>   	if (offset + len < sizeof(struct virtio_net_config))
> -		memcpy(buf, &vdpasim->config + offset, len);
> +		memcpy(buf, (u8 *)&vdpasim->config + offset, len);
>   }
>  =20
>   static void vdpasim_set_config(struct vdpa_device *vdpa, unsigned int=
 offset,


Acked-by: Jason Wang <jasowang@redhat.com>



