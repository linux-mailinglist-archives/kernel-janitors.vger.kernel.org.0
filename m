Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 97942297117
	for <lists+kernel-janitors@lfdr.de>; Fri, 23 Oct 2020 16:10:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1750311AbgJWOKH (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Fri, 23 Oct 2020 10:10:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:37683 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1750308AbgJWOKF (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 23 Oct 2020 10:10:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1603462204;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=rVRff8IalcLcFxZp8c6FdrS3ABLClcQs9SBrNtnDkw8=;
        b=NWvu2ofXK3EPB87adAseF4WH/q6/gfw6ayvq+Ie0t2juOrtH+g0zNdaWnhlOI8VT4hUi9X
        CXJjIa7R6ilr0aZMeFeNPxh6JEQP5qm2ZkxnBlvrzAC0Bp45yAUxWswQu6RapGgD7vXVrw
        0e7VOkNA/Vu9XHP16J0Jg9xwLK0FPKk=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-436-CC60sI1rPcO6AGrjC-Atnw-1; Fri, 23 Oct 2020 10:10:02 -0400
X-MC-Unique: CC60sI1rPcO6AGrjC-Atnw-1
Received: by mail-wr1-f70.google.com with SMTP id j15so627385wrd.16
        for <kernel-janitors@vger.kernel.org>; Fri, 23 Oct 2020 07:10:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=rVRff8IalcLcFxZp8c6FdrS3ABLClcQs9SBrNtnDkw8=;
        b=jdZe9xZPFiTOGUXwh+2L3TWFXzNDYD2gyQtBgCviUr9bBBbIS+zLbbYxRm9Vo+DZbL
         VsOwgUiGLdAbz+8EKtZlClL1rek4SEx1HwKQl0rfkA7mLkMZnBh9Pfq2gWmPTYMheDIv
         v8MGJz1LUacHY0rD8g29v2rPkQtPsqCl3o8+AQdpdh+HeK5dATxfPf0woFHabBA0pods
         OlQk7rYR9b4R9hSHEGSgU03Q1xIeRXnq/mtUsUo9S4tc4pJDT86NRiRkbd9IYV/Mn3Qs
         +pv0oQhJcLEMkOL1PQjYC9Jrg/cemqAcdyCcZm0QpX5prMxzaDYhqXayLFujZiwtjthN
         zXNg==
X-Gm-Message-State: AOAM533LbYjNUE1UHpH2Z/OX0bGP2rbrL5G+6JKf1O7PPX9X/A6xIE4k
        160lIzIxM2pk6Tpvh0mqeUG8KR5BvBiqjq+IlobJu5NR/MKDqpFBKTawWcIktG0DIBEK3y9M0kW
        zCYAg7l1WMeIJyV4enJgMk2ktYrhm
X-Received: by 2002:a7b:c741:: with SMTP id w1mr2200129wmk.67.1603462195578;
        Fri, 23 Oct 2020 07:09:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy/ohXINOadQoKRMbMO4rjSXcp5H+ohblZ7M/AnSdV3socDZSGjYZnpTkpuYZ0gzbQFumMEhA==
X-Received: by 2002:a7b:c741:: with SMTP id w1mr2200104wmk.67.1603462195366;
        Fri, 23 Oct 2020 07:09:55 -0700 (PDT)
Received: from steredhat (c-115-213.cust-q.wadsl.it. [212.43.115.213])
        by smtp.gmail.com with ESMTPSA id d129sm3848452wmd.5.2020.10.23.07.09.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2020 07:09:50 -0700 (PDT)
Date:   Fri, 23 Oct 2020 16:09:47 +0200
From:   Stefano Garzarella <sgarzare@redhat.com>
To:     Colin King <colin.king@canonical.com>
Cc:     "David S . Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>, netdev@vger.kernel.org,
        kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] vsock: ratelimit unknown ioctl error message
Message-ID: <20201023140947.kurglnklaqteovkp@steredhat>
References: <20201023122113.35517-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20201023122113.35517-1-colin.king@canonical.com>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Fri, Oct 23, 2020 at 01:21:13PM +0100, Colin King wrote:
>From: Colin Ian King <colin.king@canonical.com>
>
>When exercising the kernel with stress-ng with some ioctl tests the
>"Unknown ioctl" error message is spamming the kernel log at a high
>rate. Rate limit this message to reduce the noise.
>
>Signed-off-by: Colin Ian King <colin.king@canonical.com>
>---
> net/vmw_vsock/af_vsock.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>
>diff --git a/net/vmw_vsock/af_vsock.c b/net/vmw_vsock/af_vsock.c
>index 9e93bc201cc0..b8feb9223454 100644
>--- a/net/vmw_vsock/af_vsock.c
>+++ b/net/vmw_vsock/af_vsock.c
>@@ -2072,7 +2072,7 @@ static long vsock_dev_do_ioctl(struct file *filp,
> 		break;
>
> 	default:
>-		pr_err("Unknown ioctl %d\n", cmd);
>+		pr_err_ratelimited("Unknown ioctl %d\n", cmd);

Make sense, or maybe can we remove the error message returning only the
-EINVAL?

Both cases are fine for me:
Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>

> 		retval = -EINVAL;
> 	}
>
>-- 
>2.27.0
>

