Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C0F092355AE
	for <lists+kernel-janitors@lfdr.de>; Sun,  2 Aug 2020 08:26:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726409AbgHBG0Z (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Sun, 2 Aug 2020 02:26:25 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:52688 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726132AbgHBG0Y (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sun, 2 Aug 2020 02:26:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1596349582;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=qtRwpw8KaYzbjOwsQk1RkKr/x7ohfyLS11IO8SCvDmU=;
        b=N/4hoMMpDntozC/YLWPXOkpRUJTYUKEOJOp9DZItDedN2u1EpEtfaEYBm4bC6/s0TBBcVD
        nTMkoDusDNtI/qv6r3OV+uodw5ztcGQtgRwFck28rcLF3tKw/KO1y+nXx+NH8wVzinVpNH
        55GlVNjbqvAalZhM7s/aErU6mt+ffJw=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-220-KxfFAts2N_qq0ZTpNR6Z4Q-1; Sun, 02 Aug 2020 02:26:21 -0400
X-MC-Unique: KxfFAts2N_qq0ZTpNR6Z4Q-1
Received: by mail-wr1-f72.google.com with SMTP id b18so7297415wrn.6
        for <kernel-janitors@vger.kernel.org>; Sat, 01 Aug 2020 23:26:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=qtRwpw8KaYzbjOwsQk1RkKr/x7ohfyLS11IO8SCvDmU=;
        b=FBeR7h29Xqu1ld0MmBabbU8h3/3Ei74FI4WBQGeQ9QHHLbUE+fgNzye3KncjZQozOz
         MQ8tPlSQrcEgeYN5m6o+azYMc5T7qaKXCJK2jRFDpOF+6gFWZFQH8nQmZndW6Sg6ol9C
         1UJXFw72ItRPt3cCnqp0dtFv/3W06KHpmiNu4yc2o/4AceHZDhascRbZSTpK6QXnWbBB
         Bpeieq7cPdZ4RZq6jvJdOYQY7p508s/sBCl1BokljX3kyyR9s/bTke+F4Hem2jGjWSHN
         9F7d3l3PncvTqhGaDykXsIcVq6Et5KdBJSRj9YGPo9IKIbiHMlL3pstBPH6RtVxTYBFw
         KQxw==
X-Gm-Message-State: AOAM533lP9oevTc9DhEvWqa3kR5JR5CF85UZtpCwUa7oRdjeFNxGcRme
        3qot5g67V+p9qEXLqc3ryc2fGHtbiZ9fgKR/3lDgTlP3WIMbj4AL1I8hCDQo0xOwNUKIhAJ3t3d
        uuoLNuw5/4jzB4g2TouztK2h+pH8g
X-Received: by 2002:a7b:ca5a:: with SMTP id m26mr10442561wml.27.1596349579713;
        Sat, 01 Aug 2020 23:26:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzvAvq/rmcOFNmC2cQwRvUGwvvyAevu+DIBOVOyEZmkvs+orMCEXN40U/UCKI6wBOhbPYCqoA==
X-Received: by 2002:a7b:ca5a:: with SMTP id m26mr10442550wml.27.1596349579514;
        Sat, 01 Aug 2020 23:26:19 -0700 (PDT)
Received: from redhat.com (bzq-79-179-105-63.red.bezeqint.net. [79.179.105.63])
        by smtp.gmail.com with ESMTPSA id 65sm20037688wre.6.2020.08.01.23.26.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Aug 2020 23:26:18 -0700 (PDT)
Date:   Sun, 2 Aug 2020 02:26:16 -0400
From:   "Michael S. Tsirkin" <mst@redhat.com>
To:     Mao Wenan <wenan.mao@linux.alibaba.com>
Cc:     jasowang@redhat.com, virtualization@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH -next v2] virtio_net: Avoid loop in virtnet_poll
Message-ID: <20200802022549-mutt-send-email-mst@kernel.org>
References: <20200802003818-mutt-send-email-mst@kernel.org>
 <1596347793-55894-1-git-send-email-wenan.mao@linux.alibaba.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1596347793-55894-1-git-send-email-wenan.mao@linux.alibaba.com>
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org


Just noticed the subject is wrong: this is no longer
a virtio_net patch.

On Sun, Aug 02, 2020 at 01:56:33PM +0800, Mao Wenan wrote:
> The loop may exist if vq->broken is true,
> virtqueue_get_buf_ctx_packed or virtqueue_get_buf_ctx_split
> will return NULL, so virtnet_poll will reschedule napi to
> receive packet, it will lead cpu usage(si) to 100%.
> 
> call trace as below:
> virtnet_poll
> 	virtnet_receive
> 		virtqueue_get_buf_ctx
> 			virtqueue_get_buf_ctx_packed
> 			virtqueue_get_buf_ctx_split
> 	virtqueue_napi_complete
> 		virtqueue_poll           //return true
> 		virtqueue_napi_schedule //it will reschedule napi
> 
> To fix this, return false if vq is broken in virtqueue_poll.
> 
> Signed-off-by: Mao Wenan <wenan.mao@linux.alibaba.com>
> ---
>  v1->v2: fix it in virtqueue_poll suggested by Michael S. Tsirkin <mst@redhat.com>
>  drivers/virtio/virtio_ring.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/virtio/virtio_ring.c b/drivers/virtio/virtio_ring.c
> index 58b96ba..4f7c73e 100644
> --- a/drivers/virtio/virtio_ring.c
> +++ b/drivers/virtio/virtio_ring.c
> @@ -1960,6 +1960,9 @@ bool virtqueue_poll(struct virtqueue *_vq, unsigned last_used_idx)
>  {
>  	struct vring_virtqueue *vq = to_vvq(_vq);
>  
> +	if (unlikely(vq->broken))
> +		return false;
> +
>  	virtio_mb(vq->weak_barriers);
>  	return vq->packed_ring ? virtqueue_poll_packed(_vq, last_used_idx) :
>  				 virtqueue_poll_split(_vq, last_used_idx);
> -- 
> 1.8.3.1

