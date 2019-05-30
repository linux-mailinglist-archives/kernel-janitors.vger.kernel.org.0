Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4425130229
	for <lists+kernel-janitors@lfdr.de>; Thu, 30 May 2019 20:47:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726501AbfE3SrL (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Thu, 30 May 2019 14:47:11 -0400
Received: from mail-qt1-f195.google.com ([209.85.160.195]:34328 "EHLO
        mail-qt1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726462AbfE3SrL (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 30 May 2019 14:47:11 -0400
Received: by mail-qt1-f195.google.com with SMTP id h1so8300874qtp.1
        for <kernel-janitors@vger.kernel.org>; Thu, 30 May 2019 11:47:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=diBaFFpQOlJHpKJW383mUN2AuWiME+bQ0o/ZMr4CX7g=;
        b=UFO9adfCo/18SlB8rmLEWfhdTO1VLvgTQXQr+f5VpR5Vn+60DZpIydGbIK9797GNFq
         Xy3XecSK+3Fky6d/uUhIOfVwldEY9gVT5EHyOwpoqoQHpyOYbSKtoo44D3q14TNBPFFB
         HLkXYxRF66RbP7Iw8709C5bOahsIRVvGRhKkVYwmwFBW10BpF6wfOXwSIr4s5EVbMEno
         X3oe+DWVYOcR3duLcUBWTxcsHVu+Kd0Vr4/BwFmTxhlre4bXP1T3gGRc0betIe8ua/vg
         GAh+WcYICUA8+boK+8aWE7aEsf8CePt5RcjY9ljTbCmx1xq0/17bFvBsTH6/JNLOaFpO
         sLrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=diBaFFpQOlJHpKJW383mUN2AuWiME+bQ0o/ZMr4CX7g=;
        b=qSZ5dZVSc6uzNAehFWHPqbj4is8vGXBUMBDvoDD5aiS+Nb9vd9AjKkkQ6HpXB0Bwdy
         jdu4ESP+fEehSSG8yWARDrKPV30eAyr09zlKSkvt9X+Jpe8kn8wqjiXjlxx8aplBUlyU
         CskMFowPeloGmsn3IypIZ3SbsMg0LK01wNtleC2JWRw44UKOzuA08SqdDPsDr4S1k7RS
         7uv4hJe2jdy5D2sXriWbRdV0yUefIJyasxmadMtavEPH54rLhnw9i1MA+XQPilt+b1Nd
         9/a/Hqrvn8FximU1bQZ0XfjTKYJNxQe5J8HVf03HLfvGshvm0vWic9YXKHfkesSa1MID
         RLqQ==
X-Gm-Message-State: APjAAAUEdaA2/i4631d454gkniqJhhWP0DKHhhSl2dVhWelkEK1007Tp
        xGJNdZfukLLDX1AHd7w0SEtF3w==
X-Google-Smtp-Source: APXvYqwDry+6XP937lrELkrm98AM/hLZ9gH2okpbVOKmcOx5qydqW0tC4kDYVRTSKn5XTtjb5r/lvQ==
X-Received: by 2002:ac8:30a7:: with SMTP id v36mr4983567qta.119.1559242030613;
        Thu, 30 May 2019 11:47:10 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-156-34-55-100.dhcp-dynamic.fibreop.ns.bellaliant.net. [156.34.55.100])
        by smtp.gmail.com with ESMTPSA id j33sm2185547qtc.10.2019.05.30.11.47.10
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 30 May 2019 11:47:10 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
        (envelope-from <jgg@ziepe.ca>)
        id 1hWQ4z-0000Gn-OX; Thu, 30 May 2019 15:47:09 -0300
Date:   Thu, 30 May 2019 15:47:09 -0300
From:   Jason Gunthorpe <jgg@ziepe.ca>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Doug Ledford <dledford@redhat.com>,
        Leon Romanovsky <leon@kernel.org>,
        Yishai Hadas <yishaih@mellanox.com>,
        linux-rdma@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] RDMA/uverbs: check for allocation failure in
 uapi_add_elm()
Message-ID: <20190530184709.GA982@ziepe.ca>
References: <20190530082024.GA11836@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190530082024.GA11836@mwanda>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Thu, May 30, 2019 at 11:20:24AM +0300, Dan Carpenter wrote:
> If the kzalloc() fails then we should return ERR_PTR(-ENOMEM).  In the
> current code it's possible that the kzalloc() fails and the
> radix_tree_insert() inserts the NULL pointer successfully and we return
> the NULL "elm" pointer to the caller.  That results in a NULL pointer
> dereference.
> 
> Fixes: 9ed3e5f44772 ("IB/uverbs: Build the specs into a radix tree at runtime")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  drivers/infiniband/core/uverbs_uapi.c | 2 ++
>  1 file changed, 2 insertions(+)

Applied to for-next, thanks

Jason
