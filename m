Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B15011EC64D
	for <lists+kernel-janitors@lfdr.de>; Wed,  3 Jun 2020 02:36:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728187AbgFCAgN (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Tue, 2 Jun 2020 20:36:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40212 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726214AbgFCAgJ (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 2 Jun 2020 20:36:09 -0400
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com [IPv6:2607:f8b0:4864:20::842])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 895BAC08C5C0
        for <kernel-janitors@vger.kernel.org>; Tue,  2 Jun 2020 17:36:08 -0700 (PDT)
Received: by mail-qt1-x842.google.com with SMTP id y1so588069qtv.12
        for <kernel-janitors@vger.kernel.org>; Tue, 02 Jun 2020 17:36:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=ZDyu11+uzJ9R+6JCcZBH8+VKsi1c+9TLG+xONMv+Rm4=;
        b=S8qECI/akVQWNTmF1OlK/qSV0xbddTynf0excoMRnoWTuQYOrMZ41fk/m6beJ1GD6+
         2RpqWdKWzZdrFPFsDxBUpUt4ZjP2keuRW9t2lsjRPs4eHHHknWj93boD4/oxb9lwkojN
         XfdQdMx4A+PXVd9ml9kyj++gVsaRL4ktNvOIWmWyNzzpx5gSTb3NdCegU+Mj65zQQisk
         CUujStwVfb4ecmDvAabeRoeUzq3a0nKH0tVHed6UP6Hh0Qr8rpHMkS/D5a4ZhfAI/AUr
         HfYHDXJf5oWzsIitW/bwP4mxd3V+Jqde2ikX3vk+0j4Q1Wez7lltlh+zS2/VaeIVA8i0
         yYDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ZDyu11+uzJ9R+6JCcZBH8+VKsi1c+9TLG+xONMv+Rm4=;
        b=jR/cFvRO1bfo38H71TJSmrxavA6kGo6+VwIqlfLo+DcahEPJpiJoAUTNP7zftg5faM
         +3FAjKs2NSIFcbdL570egVXMNjckFcLT6M24m61AfRyW6nI/GEDu+oMMuxN0G8sej7gC
         bcfrwXnz//GXz5aZyghGQcGI50JhZs9/09t9rJ8hBBuAfP5WtLIBMtIfdTTWacZxnb/V
         25EUOV6H96V+p7Z6MFclsbJnqfpNipDpymTtOO2bv2vd4xFltUY3NB8fG4XZ9V+ldkmV
         UHN4Xys8p1Y+PchYEStQFIxnGDljttmsSg6aE+n95UYv27wa3qBLGK0xUnowD1FndSLP
         OGRA==
X-Gm-Message-State: AOAM532x7RB0f92z3T8m5xfODKr2bjBqD5zTF+OayRqH6yip36Wyncqq
        VTHfjpxxk/amjC/ZLqixpdoNdA==
X-Google-Smtp-Source: ABdhPJw+NP9vqZzh5B4ezhB8Uc90ff1uDKVcWJiS5ZWSOvk4f8fyWHsBExI+P/HHGJdm566y5qdL5g==
X-Received: by 2002:aed:3aa3:: with SMTP id o32mr31597656qte.364.1591144567614;
        Tue, 02 Jun 2020 17:36:07 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-156-34-48-30.dhcp-dynamic.fibreop.ns.bellaliant.net. [156.34.48.30])
        by smtp.gmail.com with ESMTPSA id m53sm530387qtb.64.2020.06.02.17.36.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2020 17:36:06 -0700 (PDT)
Received: from jgg by mlx with local (Exim 4.93)
        (envelope-from <jgg@ziepe.ca>)
        id 1jgHO2-000YYG-8d; Tue, 02 Jun 2020 21:36:06 -0300
Date:   Tue, 2 Jun 2020 21:36:06 -0300
From:   Jason Gunthorpe <jgg@ziepe.ca>
To:     YueHaibing <yuehaibing@huawei.com>
Cc:     mike.marciniszyn@intel.com, dennis.dalessandro@intel.com,
        dledford@redhat.com, sadanand.warrier@intel.com,
        grzegorz.andrejczuk@intel.com, linux-rdma@vger.kernel.org,
        linux-kernel@vger.kernel.org, dan.carpenter@oracle.com,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH -next] IB/hfi1: Use free_netdev() in hfi1_netdev_free()
Message-ID: <20200603003606.GA132773@ziepe.ca>
References: <20200601135644.GD4872@ziepe.ca>
 <20200602061635.31224-1-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200602061635.31224-1-yuehaibing@huawei.com>
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Tue, Jun 02, 2020 at 02:16:35PM +0800, YueHaibing wrote:
> dummy_netdev shold be freed by free_netdev() instead of
> kfree(). Also remove unneeded variable 'priv'
> 
> Fixes: 4730f4a6c6b2 ("IB/hfi1: Activate the dummy netdev")
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> Reported-by: kbuild test robot <lkp@intel.com>
> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> Reviewed-by: Dennis Dalessandro <dennis.dalessandro@intel.com>
> ---
>  drivers/infiniband/hw/hfi1/netdev_rx.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)

Applied to for-next, thanks

Jason
