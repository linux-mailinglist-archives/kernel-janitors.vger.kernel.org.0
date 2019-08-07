Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7540E84C2C
	for <lists+kernel-janitors@lfdr.de>; Wed,  7 Aug 2019 14:59:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387962AbfHGM7o (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Wed, 7 Aug 2019 08:59:44 -0400
Received: from mail-qk1-f194.google.com ([209.85.222.194]:35700 "EHLO
        mail-qk1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387476AbfHGM7o (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 7 Aug 2019 08:59:44 -0400
Received: by mail-qk1-f194.google.com with SMTP id r21so65741369qke.2
        for <kernel-janitors@vger.kernel.org>; Wed, 07 Aug 2019 05:59:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=dzgoky5Zev+Q1N9hll80WSgidandNp3vygGJN2vBaUE=;
        b=JhpZY+WuGa3wWaHH0RtDzN/ip6wkXi2gCQ2mpvwrESrkORN4zJAS0nakwH28P0HAsK
         dDj7BUjTEeYs57mAHx7tSGQm1rNDjbVcA8PFT4m4Lk46fTPmIoMBrenWuyhuQEsnH0VO
         wFkjsmbXTRmaJucYnHx72Hl5JptaUNz9osm6va92tuNEt3Rmom5GfDlNm5C/Ppuixb0H
         U+Os9WNPd2As7jwaxjRY597+EDFCzWvuJCUMWdyPbSXfts1MyLh1MNyTbW2t38SqAsWz
         OAAFUqZQnn9DJ6j8fMiNLhGsdeytM0wKyizvSj4XYwaUTSpQQKST5XeTIDJdzkDHKSXY
         +emA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=dzgoky5Zev+Q1N9hll80WSgidandNp3vygGJN2vBaUE=;
        b=shiVhV/nCgNtPTgNjuV60bGxbhtse8JcpHVqFGzodPGSbSy5614ii54tAdAqWDoI2q
         gVQZU/snfD4E0wSdJ+80cQY0ggiP85d4MJtD2TIKrNA/G1LOZlk7b410A8dxR+DFBBYR
         aVQZQjH1VCm7n3XycdRlFXJu/Nka3pH7XH6MNOtEVCTldB2nZIKuw6JQGz6XpWyrpzQL
         6rezOjFaeqQOnTS9NjHY2Rs2Yv0tiP8rBAR9fJ+i9B/VQ7boHz6hdgrNRaKnhV6FdzTL
         douTggk4y8PxWIXZP4NEfcnyvaAT/ZwAJeIUaj/ihaRPbG/PfTxpK9BBFH/OsJ97A6sn
         9toA==
X-Gm-Message-State: APjAAAWbP4acCkk2qMUdSKMkkIjXCAAFoOinFBC88GK+KLaogaZT+6i9
        8bSqB9o5cXeQPTSb5Qvm7/jZ0A==
X-Google-Smtp-Source: APXvYqzx3k2qpoh40GOiJgkiPQgaLElvmesHihMQ/UQlq0C4mF3WmC0mtH2oEO2cfGA/7jDHW+zhaw==
X-Received: by 2002:a37:c408:: with SMTP id d8mr8047328qki.18.1565182783633;
        Wed, 07 Aug 2019 05:59:43 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-156-34-55-100.dhcp-dynamic.fibreop.ns.bellaliant.net. [156.34.55.100])
        by smtp.gmail.com with ESMTPSA id u11sm37216444qkk.76.2019.08.07.05.59.43
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 07 Aug 2019 05:59:43 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
        (envelope-from <jgg@ziepe.ca>)
        id 1hvLXa-0001ck-Nc; Wed, 07 Aug 2019 09:59:42 -0300
Date:   Wed, 7 Aug 2019 09:59:42 -0300
From:   Jason Gunthorpe <jgg@ziepe.ca>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Leon Romanovsky <leon@kernel.org>,
        Yishai Hadas <yishaih@mellanox.com>,
        Doug Ledford <dledford@redhat.com>, linux-rdma@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] IB/mlx5: Check the correct variable in error handling
 code
Message-ID: <20190807125942.GG1557@ziepe.ca>
References: <20190807123236.GA11452@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190807123236.GA11452@mwanda>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Wed, Aug 07, 2019 at 03:32:36PM +0300, Dan Carpenter wrote:
> The code accidentally checks "event_sub" instead of "event_sub->eventfd".
> 
> Fixes: 759738537142 ("IB/mlx5: Enable subscription for device events over DEVX")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  drivers/infiniband/hw/mlx5/devx.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Jason Gunthorpe <jgg@mellanox.com>

Jason
