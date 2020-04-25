Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 033D71B89DB
	for <lists+kernel-janitors@lfdr.de>; Sun, 26 Apr 2020 01:00:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726271AbgDYXAH (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Sat, 25 Apr 2020 19:00:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34886 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726232AbgDYXAH (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sat, 25 Apr 2020 19:00:07 -0400
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com [IPv6:2607:f8b0:4864:20::743])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4382C09B04F
        for <kernel-janitors@vger.kernel.org>; Sat, 25 Apr 2020 16:00:06 -0700 (PDT)
Received: by mail-qk1-x743.google.com with SMTP id s63so14289953qke.4
        for <kernel-janitors@vger.kernel.org>; Sat, 25 Apr 2020 16:00:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=2/3PKFH4+Dgb7ByQk7h++0OjX0dIa7Z5llVx9VERmM0=;
        b=X6n1+GJstCa1UOknoW/4jU9lM8Eu5DFFhopt138f9UsIkKweqKEdSHZCrGnWHJdS+U
         nyRtIFLIsVDgcKApmA0L1GM5O+RJYDGfDa/Hgd2jsws2wtwDVplcB8lc5O46TAdRRRSM
         gE/YUx1r8fEhclpqE5xvaszMieDGPVkX9uvpwAhBNWMQp7KZH4ckWnQLjFpsvzs3oCWJ
         Q+qunQ25WroqlaxLxVAAY2arL+AmOhGNxMJbRbihjcClxqNxdOi8cRGWVtXaXXsC3Tbr
         qgsgnvs62+QHuFV5/BPnZjZvFQoOle4scmsm0MtQvUIVzMSHyO9Bf6iOnH0HVRlRxh3l
         BJmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=2/3PKFH4+Dgb7ByQk7h++0OjX0dIa7Z5llVx9VERmM0=;
        b=s+ZGScrV6QRvi41nM3fI9HE053f9lBO395JvzVktaiENn/njC4GSRlV3HkaO8l2ftq
         s+NQ3h9XB/tu/MWmgC9efWkhqwa1Qj8e0a3/qXPIvhd/FElNlvIgbZv3S0hixyFk9Drl
         hqTpT0WrCOCEFtqDYDfWdlmRLKOqUiFloPYT7f0LHL+4IA+enWzAw2dRN4XnwDnTROYi
         ylNey52s8Sb/rfVmus2UYJo0GGfqlzCXu3Dgz0gaK5hI8/19tvzh/BcYjtb8X0by//Wn
         1tZTAEhJKqY6ODl24QTCgqOkrsRFdInaWqx8trCp/IvkhkQrWZnOBzOQnryBcGMYdrKD
         3dqg==
X-Gm-Message-State: AGi0PuZhfGMsXubQYYqjvS0HXZMi/uJoCeopYuC/JnZP0KxyRVFlJqDr
        Vv5vkPv/Nc3RUUqfHSyZCQnePA==
X-Google-Smtp-Source: APiQypKNJi8s73zrdACrBIXMEnQ714azX1svadGwXvKQqstUgKeEfDqSrKoNAlSQld/ERLfh3u8oFQ==
X-Received: by 2002:a37:7202:: with SMTP id n2mr14027797qkc.427.1587855605811;
        Sat, 25 Apr 2020 16:00:05 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-68-57-212.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.68.57.212])
        by smtp.gmail.com with ESMTPSA id k127sm6611978qkb.35.2020.04.25.16.00.05
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 25 Apr 2020 16:00:05 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
        (envelope-from <jgg@ziepe.ca>)
        id 1jSTmG-0006Fh-GX; Sat, 25 Apr 2020 20:00:04 -0300
Date:   Sat, 25 Apr 2020 20:00:04 -0300
From:   Jason Gunthorpe <jgg@ziepe.ca>
To:     Dan Carpenter <dan.carpenter@oracle.com>,
        Shiraz Saleem <shiraz.saleem@intel.com>
Cc:     Faisal Latif <faisal.latif@intel.com>,
        Doug Ledford <dledford@redhat.com>,
        Shannon Nelson <shannon.nelson@intel.com>,
        Anjali Singhai Jain <anjali.singhai@intel.com>,
        linux-rdma@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] i40iw: Fix error handling in i40iw_manage_arp_cache()
Message-ID: <20200425230004.GA23991@ziepe.ca>
References: <20200422092211.GA195357@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200422092211.GA195357@mwanda>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Wed, Apr 22, 2020 at 12:22:11PM +0300, Dan Carpenter wrote:
> The i40iw_arp_table() function can return -EOVERFLOW if
> i40iw_alloc_resource() fails so we can't just test for "== -1".
> 
> Fixes: 4e9042e647ff ("i40iw: add hw and utils files")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>  drivers/infiniband/hw/i40iw/i40iw_hw.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/infiniband/hw/i40iw/i40iw_hw.c b/drivers/infiniband/hw/i40iw/i40iw_hw.c
> index 55a1fbf0e670..ae8b97c30665 100644
> +++ b/drivers/infiniband/hw/i40iw/i40iw_hw.c
> @@ -534,7 +534,7 @@ void i40iw_manage_arp_cache(struct i40iw_device *iwdev,
>  	int arp_index;
>  
>  	arp_index = i40iw_arp_table(iwdev, ip_addr, ipv4, mac_addr, action);
> -	if (arp_index == -1)
> +	if (arp_index < 0)
>  		return;
>  	cqp_request = i40iw_get_cqp_request(&iwdev->cqp, false);
>  	if (!cqp_request)

It is right Shiraz?

Jason
