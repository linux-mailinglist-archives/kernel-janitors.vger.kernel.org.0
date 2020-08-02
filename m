Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B5A5C2355AB
	for <lists+kernel-janitors@lfdr.de>; Sun,  2 Aug 2020 08:25:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725866AbgHBGZv (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Sun, 2 Aug 2020 02:25:51 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:46850 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1725798AbgHBGZv (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sun, 2 Aug 2020 02:25:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1596349549;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=S6OYCdbGW3vcu3y+tw3bsh0JBnWwiCW5p61nwH6OSdk=;
        b=Q/XP8a2T99FM3ItA1jY9At27hJM5likCSB7In+3kCCjIblwiiHTtUYPDkNyDkU8KSCdfqw
        tWVDnSxZwR5dvizcJwStq2JRvagJrevSlpLW/2A6yUQ5qLuYMOf4Am7Xy5J4xnMif57nmC
        yPW6x8R8BQZ3Y+dNEui2joeLnpeJQ6Q=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-299-ajw9HE2FM56g_8DQ1FTsLw-1; Sun, 02 Aug 2020 02:25:47 -0400
X-MC-Unique: ajw9HE2FM56g_8DQ1FTsLw-1
Received: by mail-wr1-f70.google.com with SMTP id j16so10379055wrw.3
        for <kernel-janitors@vger.kernel.org>; Sat, 01 Aug 2020 23:25:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=S6OYCdbGW3vcu3y+tw3bsh0JBnWwiCW5p61nwH6OSdk=;
        b=LRKg1sUASbf+88ExIG5RluepLVwevfuopaKNAHA+PBpkZ8965ShDrohDJ2QQq/qcmN
         jsNxSj1fuxIAmsNAGwTN5Gz8Z87ObEsU9LnGhiylliSlMoN0UjJ48drW9USHFSarOUce
         dpOFg3X5FeGcP0sX2+n+te9+DpnUh4rYMZQHIC5e09mutlLs4/cy/ro3iWFzQIYCrzvv
         MwY6TfXg3r8euP+ZzRGJo5cIO4C5uP+htIVjYItIgi8NvRHx1Zxxd/PKNQPuxjhmWXcZ
         zj8Jl6/bEbTAPvGglCEeWSiU8Lv4zYDiA59mWF/g4M7Wv6fPNCiX9Dj9oAx3LKMMKHjS
         rUzQ==
X-Gm-Message-State: AOAM533z1mhwT1mFc2WAsoiSykxpN8IXkGp3Dl2yayNSorCC+I3QQKuB
        2VbWOX7lqjaPA0mIGSVg5KCcYroGRNy5nz7k+5v3jiNiHTzuf5XmivUEfwoMHNWgjeoDxn/EtmX
        5TQw1f7BmQHq2H/sl0jw98mpwzd28
X-Received: by 2002:a7b:c154:: with SMTP id z20mr11102327wmi.118.1596349545753;
        Sat, 01 Aug 2020 23:25:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJynZI0DXpqHK+lKgKMB/Q7mJUqK4kYuqt49mPCgR78Fj5Qunpo174be0PRlqdzVRrBirQfRJw==
X-Received: by 2002:a7b:c154:: with SMTP id z20mr11102318wmi.118.1596349545515;
        Sat, 01 Aug 2020 23:25:45 -0700 (PDT)
Received: from redhat.com (bzq-79-179-105-63.red.bezeqint.net. [79.179.105.63])
        by smtp.gmail.com with ESMTPSA id 68sm19668139wra.39.2020.08.01.23.25.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Aug 2020 23:25:44 -0700 (PDT)
Date:   Sun, 2 Aug 2020 02:25:42 -0400
From:   "Michael S. Tsirkin" <mst@redhat.com>
To:     Mao Wenan <wenan.mao@linux.alibaba.com>
Cc:     jasowang@redhat.com, virtualization@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH -next v2] virtio_net: Avoid loop in virtnet_poll
Message-ID: <20200802022521-mutt-send-email-mst@kernel.org>
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

Looks good:
Acked-by: Michael S. Tsirkin <mst@redhat.com>

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

