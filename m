Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E169B29A79D
	for <lists+kernel-janitors@lfdr.de>; Tue, 27 Oct 2020 10:18:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2505521AbgJ0JSS (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Tue, 27 Oct 2020 05:18:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28309 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2407415AbgJ0JSM (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 27 Oct 2020 05:18:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1603790291;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=PP9XfWWYs/ZL8eWntPMtO6Zbh5hoxUuR0KDIP5S05yQ=;
        b=PByU6ptqiii+UK1rqDAOq5U/gFKkaWYVeL7Vyts2KmXS5RoITPiCT3SUvgECy4jzAEggj8
        FJ4ebV6W/WkS+SwAPyypl+QWujz7H7Vz7o9XRMOwT2CVeSBlY9rGpx7+0ynd4gMVYiLvPH
        dVGvd3pksjYiJuXlJAWc5zK7q7wL3KU=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-171-uR8t7FKzNM2kCAllvmnHrQ-1; Tue, 27 Oct 2020 05:18:08 -0400
X-MC-Unique: uR8t7FKzNM2kCAllvmnHrQ-1
Received: by mail-wm1-f72.google.com with SMTP id f191so178016wmf.9
        for <kernel-janitors@vger.kernel.org>; Tue, 27 Oct 2020 02:18:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=PP9XfWWYs/ZL8eWntPMtO6Zbh5hoxUuR0KDIP5S05yQ=;
        b=NWLjo2jp952bgq5vQgfCpFjftSF5pXeDi9CWcgg410g5ChHn9riW4biZ/u2wMhNIT6
         51K8jSm2nX98NeiiJ+FRC+PLcMXfJTLKGgtiPk2gAj70rfXUrve+0NzP+NiqNGLeabCj
         TTXkCp+TATnr3OLv79ilAa7wjKtkKKwHp/5bLRZadeY/Ugn9M2UcWa3EKsc1ojjIRaAE
         lyrGHZmRCiowk4DFNbLoGeZs4B0jTLG9WD+gRsfZgr7Og0tcZy8g/L9DA27Zn66iHYb/
         cj/HwmLHReUZvDnxA526+CySV1aSPqQI8gz4VLwjnM8i5y4dwbvfZPJAirl4KBRVy0ze
         CWuQ==
X-Gm-Message-State: AOAM531T4J7udAkfgPE74lVbdQMAqa5BMPi20F1rJ6R0lJzSPlj4yCE1
        pzgmCzc1B6APfrKYyDEVK/OEvfcokG8p8GNzykCztCPYKkEiAGD8bhfolxBpm1ZQEkXAoYwsFOJ
        cGwoeCcVDhAD4TZvyoV1pQ7uXU+kX
X-Received: by 2002:a1c:28d4:: with SMTP id o203mr1612041wmo.143.1603790287167;
        Tue, 27 Oct 2020 02:18:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzIilyoqRxGaUl7p9JKTfBssuH7mohx3h+nf+wqghU8Ac68i7Wh1Yp/SFLOvnj3tU5GpJwc5Q==
X-Received: by 2002:a1c:28d4:: with SMTP id o203mr1612024wmo.143.1603790286960;
        Tue, 27 Oct 2020 02:18:06 -0700 (PDT)
Received: from steredhat (host-79-17-248-215.retail.telecomitalia.it. [79.17.248.215])
        by smtp.gmail.com with ESMTPSA id x64sm1166853wmg.33.2020.10.27.02.18.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2020 02:18:06 -0700 (PDT)
Date:   Tue, 27 Oct 2020 10:18:04 +0100
From:   Stefano Garzarella <sgarzare@redhat.com>
To:     Colin King <colin.king@canonical.com>
Cc:     "David S . Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>, netdev@vger.kernel.org,
        kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] vsock: fix the error return when an invalid ioctl
 command is used
Message-ID: <20201027091804.7mpad5yaxzfmbva6@steredhat>
References: <20201027090942.14916-1-colin.king@canonical.com>
 <20201027090942.14916-3-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20201027090942.14916-3-colin.king@canonical.com>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Tue, Oct 27, 2020 at 09:09:42AM +0000, Colin King wrote:
>From: Colin Ian King <colin.king@canonical.com>
>
>Currently when an invalid ioctl command is used the error return
>is -EINVAL.  Fix this by returning the correct error -ENOIOCTLCMD.
>
>Signed-off-by: Colin Ian King <colin.king@canonical.com>
>---
> net/vmw_vsock/af_vsock.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>

>
>diff --git a/net/vmw_vsock/af_vsock.c b/net/vmw_vsock/af_vsock.c
>index 865331b809e4..597c86413089 100644
>--- a/net/vmw_vsock/af_vsock.c
>+++ b/net/vmw_vsock/af_vsock.c
>@@ -2072,7 +2072,7 @@ static long vsock_dev_do_ioctl(struct file *filp,
> 		break;
>
> 	default:
>-		retval = -EINVAL;
>+		retval = -ENOIOCTLCMD;
> 	}
>
> 	return retval;
>-- 
>2.27.0
>

