Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BAEC819F83E
	for <lists+kernel-janitors@lfdr.de>; Mon,  6 Apr 2020 16:51:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728773AbgDFOvM (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Mon, 6 Apr 2020 10:51:12 -0400
Received: from mail-qk1-f194.google.com ([209.85.222.194]:38508 "EHLO
        mail-qk1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728768AbgDFOvL (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 6 Apr 2020 10:51:11 -0400
Received: by mail-qk1-f194.google.com with SMTP id h14so16398665qke.5
        for <kernel-janitors@vger.kernel.org>; Mon, 06 Apr 2020 07:51:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=QLcJLS6gh3Pyw1Kb8Qcjn7YnCly0p8aglXTQ552vZuY=;
        b=fp1TsRVJUgrD0C5YqaopF+9Lazs5FzJC/aUPVwr2KhStCASxgpleYVJGoYD3aluwj5
         KfOVAnuDgo8BK7Dd06ievhU1TIr4+L77KQ3IbF66ACNcGxRhTvwu26A+Nj9MBh4RGpr/
         6P6oT4zivnfu6E97Yb1mm836i1ipVG+65bxxVXeZ0SQ2lMFrK1qD1hp+2bbUvXQ9p2Y8
         OC/xWSMDpM1pOWP1AwqTSME0bAEtvz8XpwBatlv9Gs6AXGamACzXh6sX9JleQrNz32Ak
         Gk+t0DQ7qPAHiqr4WBQa4Ta7k5Ke7focVwgutedc9SMAebxJFVrsN8QU/gwMSemZnv2X
         H21g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=QLcJLS6gh3Pyw1Kb8Qcjn7YnCly0p8aglXTQ552vZuY=;
        b=dopv2akPbu1s0uCAgHA4Xf/pubjx49sGI1Dy27tBiiy6Bm60IeXz6tZRNwl/k6/r7u
         90vI/2tmU2XKw4Haa1dvPhgtYqz79DVjL6ES7QlN9APuSZmp/qDIa7P1U3hfY2DN0Q5s
         8EyVu7X6r3zLyCKelnMm7jXo2KJVrCETMoAQNQmGEuXIzaJEQcYgnndg9fsoTrue/ja1
         uxnhwLEJ9gKwmipLuiOBBWMNdiYhwE54jNDg0ATGN0BUcnJcx74767qIE/JLKgrNRSmk
         AbkHZLZu5U4cHy3JuEalQI8uc21yCboe5a5L3m2oSUGDVkmnuFjSzv102UhO0Djpfs9X
         GFxQ==
X-Gm-Message-State: AGi0PubVi0yzIVcLYmaN8ccVTH2X9FaOeMVOAoQz5Ky6zn+ZvYuM1Pnm
        naLDBdC7CwVtuhXw3PXbJmCIzw==
X-Google-Smtp-Source: APiQypIjI6lG1ooeDObkWABulcNgWH7LhaRsQCl2qp2qdvNjPo6uYknax/IMVDXJg1lKOfXm5V6K3w==
X-Received: by 2002:a37:7605:: with SMTP id r5mr19728783qkc.345.1586184670672;
        Mon, 06 Apr 2020 07:51:10 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-68-57-212.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.68.57.212])
        by smtp.gmail.com with ESMTPSA id f127sm14675009qkd.74.2020.04.06.07.51.09
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 06 Apr 2020 07:51:10 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
        (envelope-from <jgg@ziepe.ca>)
        id 1jLT5h-0005YO-Da; Mon, 06 Apr 2020 11:51:09 -0300
Date:   Mon, 6 Apr 2020 11:51:09 -0300
From:   Jason Gunthorpe <jgg@ziepe.ca>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Doug Ledford <dledford@redhat.com>,
        Leon Romanovsky <leon@kernel.org>,
        Danit Goldberg <danitg@mellanox.com>,
        Parav Pandit <parav@mellanox.com>, linux-rdma@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] RDMA/cm: Fix an error check in cm_alloc_id_priv()
Message-ID: <20200406145109.GQ20941@ziepe.ca>
References: <20200406144335.GD68494@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200406144335.GD68494@mwanda>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Mon, Apr 06, 2020 at 05:43:35PM +0300, Dan Carpenter wrote:
> The xa_alloc_cyclic_irq() function returns either 0 or 1 on success and
> negatives on error.  This code treats 1 as an error and returns
> ERR_PTR(1) which will cause an Oops in the caller.
> 
> Fixes: e8dc4e885c45 ("RDMA/cm: Fix ordering of xa_alloc_cyclic() in ib_create_cm_id()")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> The Fixes tag may not be correct.  That's the patch which introduces an
> Oops but we may want to backport this further back.

Right it should be

Fixes: ae78ff3a0f0c ("RDMA/cm: Convert local_id_table to XArray")

Thanks,
Jason
