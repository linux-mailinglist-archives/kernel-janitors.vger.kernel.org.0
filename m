Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DF9561F5143
	for <lists+kernel-janitors@lfdr.de>; Wed, 10 Jun 2020 11:39:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727842AbgFJJj2 (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Wed, 10 Jun 2020 05:39:28 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:28351 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727007AbgFJJj1 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 10 Jun 2020 05:39:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1591781966;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=ZHhN+DXAIMHw8hGd/EZXD/3ZlKq/Nb955xAU2QRluu4=;
        b=Hqo34pcexwZZW+IzxLwM3bVrn7wpLjoydXBCWT9tN0OQP/IQOo/nmDvR0oJez2eVXnQr+o
        in+ibCPG+P+cfjZeyjvC2v3TuxLhcW0+62QAchrzjO8oT16bEm4BAktMF1Z5WZK3Ftj23r
        UYNlbS8ETWJNWhY6E4cg57mZMSwUQB8=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-228-ioWkoDZ8PYOZ410WsmX5eA-1; Wed, 10 Jun 2020 05:39:25 -0400
X-MC-Unique: ioWkoDZ8PYOZ410WsmX5eA-1
Received: by mail-wr1-f71.google.com with SMTP id n6so842622wrv.6
        for <kernel-janitors@vger.kernel.org>; Wed, 10 Jun 2020 02:39:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ZHhN+DXAIMHw8hGd/EZXD/3ZlKq/Nb955xAU2QRluu4=;
        b=UK62HRiVFXiOrwD9Lz4Fx2SA0KF7melB92604m3Ezz8CQJ+9J1lr1KQLL838Wf2fhW
         3Z0M3NKqX6/cobQA8Exa0u7Nvtk7iXfaz6z+kacCRPvpi/T9OLBemWpkTk+O/6Q6XzxO
         6o9JnKu78GUQhMFfUDOPNIlExTkyf4/UOE6HPJ2PY9nK47OdCCeOZgj8LBALKjxStZIO
         YYb1jFsPORAY7zPwqpX5B3zpD0jpvek02roCvNp/EdjHJqHPongOeK5OU5jOWHEK/LHV
         HNj4fOjc+I4vbGWf+TqWlETkGeP7HCGtTc+K3mcVs2b8BM9XtnmMB5yTJPNBfFxP+baG
         ywmw==
X-Gm-Message-State: AOAM531t6BGbN297Lm7D2hlU85y3xdZSST0S9Oexst3GMnILwa2CCs8m
        2FpV0Cfc/j+5tb/mmQU/GYD9/kDIyTR724uk2mVVmyzDronaevYlxjvvRt4rqqffEh6lLG3jsmn
        VuxuWKKdHWWhtdYzXnfDxqn8s8mwP
X-Received: by 2002:a1c:154:: with SMTP id 81mr2260873wmb.23.1591781963788;
        Wed, 10 Jun 2020 02:39:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzQX9a47BGmJoqN+JImhK5ZUe/6waoIaFpAVaxQJvVOjhT3XwxiiPuNU8njX16wSPNDegWrSA==
X-Received: by 2002:a1c:154:: with SMTP id 81mr2260855wmb.23.1591781963549;
        Wed, 10 Jun 2020 02:39:23 -0700 (PDT)
Received: from redhat.com ([212.92.121.57])
        by smtp.gmail.com with ESMTPSA id n19sm6011219wmi.33.2020.06.10.02.39.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2020 02:39:22 -0700 (PDT)
Date:   Wed, 10 Jun 2020 05:39:19 -0400
From:   "Michael S. Tsirkin" <mst@redhat.com>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     David Hildenbrand <david@redhat.com>,
        Jason Wang <jasowang@redhat.com>,
        virtualization@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] virtio-mem: silence a static checker warning
Message-ID: <20200610053912-mutt-send-email-mst@kernel.org>
References: <20200610085911.GC5439@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200610085911.GC5439@mwanda>
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Wed, Jun 10, 2020 at 11:59:11AM +0300, Dan Carpenter wrote:
> Smatch complains that "rc" can be uninitialized if we hit the "break;"
> statement on the first iteration through the loop.  I suspect that this
> can't happen in real life, but returning a zero literal is cleaner and
> silence the static checker warning.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  drivers/virtio/virtio_mem.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied, thanks.

> diff --git a/drivers/virtio/virtio_mem.c b/drivers/virtio/virtio_mem.c
> index f658fe9149beb..893ef18060a02 100644
> --- a/drivers/virtio/virtio_mem.c
> +++ b/drivers/virtio/virtio_mem.c
> @@ -1192,7 +1192,7 @@ static int virtio_mem_mb_plug_any_sb(struct virtio_mem *vm, unsigned long mb_id,
>  						VIRTIO_MEM_MB_STATE_OFFLINE);
>  	}
>  
> -	return rc;
> +	return 0;
>  }
>  
>  /*
> -- 
> 2.26.2

