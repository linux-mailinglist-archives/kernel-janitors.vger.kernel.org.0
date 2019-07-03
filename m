Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6668C5EAF1
	for <lists+kernel-janitors@lfdr.de>; Wed,  3 Jul 2019 19:54:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726957AbfGCRyp (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Wed, 3 Jul 2019 13:54:45 -0400
Received: from mail-qt1-f196.google.com ([209.85.160.196]:43560 "EHLO
        mail-qt1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726678AbfGCRyp (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 3 Jul 2019 13:54:45 -0400
Received: by mail-qt1-f196.google.com with SMTP id w17so1582997qto.10
        for <kernel-janitors@vger.kernel.org>; Wed, 03 Jul 2019 10:54:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=xYbWxbQ9bU/COmgfpbJvDysro2k80ZAmR6BetjJdynA=;
        b=IXR7dcANSTpJ6izWqwpNiIII3NYPGoxld/ncaXoycL2TE3+T/r/iu6wo1GOHu6r4Vq
         EgVgGaW1m7pvjeBxhhWkjbsL/qTV+R7g2wXwkP4IfoO2mkhmvXY5j4qszyuJL2KxEhED
         gCAGXKpuwpzAfvtjW6zL8+pNhwmaZdeUUYDp3kgbDkP1HOxsb3oXBxCErHi9R1bnWmWD
         jMukYsa1NbGumrRYnxMTmcTFZ3fbcvgPUHI4jUA9qXn0xdDuwnz/y9+npio22pNjQlwo
         iGwwWgl8JuCzZOmWFHTJzKRwiX1yLij4Ey9ED2oW9N9cnqWTwdNN9BwRENCk6wcqjfJY
         +gyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=xYbWxbQ9bU/COmgfpbJvDysro2k80ZAmR6BetjJdynA=;
        b=VaTuAhf6RZWMLbOqVA7LcGGhtnAZgrEKU5yb3uy8iBRBIC+RSqoc4gR/VdVyKiBF6z
         oAnNMc1shRGu59jfauMfLUcVpklkPrqVOiQQ1x/9QZSjb+M6PEUC1KYEw025LmkU+bsu
         qpRVdde8bcOm6Fs9yapFdxNfSGNkfBn6o2cIYohlol6uyG0UFiFF27c3bEFAqi0+FrIM
         ag9KwblAvk+JFeBMsX9ZjpMsy6ICOjYAg1g35b167LmYvxQnvO3YRh/tz6o9uUUAWfJL
         eKf5odLs27/DkVSZ1kbm3FonWrNTPb6MLYeRnIwbZocqlgN6ydTrQoEXHL/gtSfTxaWF
         YnjA==
X-Gm-Message-State: APjAAAVrhD9SciN5wHNaCe5jfJ3/MrVX1Lze4Vg2NjcCsF1RG0gBVIrb
        fvn0KwagmLdeXURSUcLTCZEW4Q==
X-Google-Smtp-Source: APXvYqwthrZmSP1wtsuemifvdr68BnT1eWw5pu7E9dXAn8otZVJFzfmyU3bc3980Jcq5gaQHRIq5Uw==
X-Received: by 2002:a0c:95c6:: with SMTP id t6mr34220109qvt.134.1562176484398;
        Wed, 03 Jul 2019 10:54:44 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-156-34-55-100.dhcp-dynamic.fibreop.ns.bellaliant.net. [156.34.55.100])
        by smtp.gmail.com with ESMTPSA id l123sm1280163qkc.9.2019.07.03.10.54.43
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 03 Jul 2019 10:54:43 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
        (envelope-from <jgg@ziepe.ca>)
        id 1hijSt-0006jA-IA; Wed, 03 Jul 2019 14:54:43 -0300
Date:   Wed, 3 Jul 2019 14:54:43 -0300
From:   Jason Gunthorpe <jgg@ziepe.ca>
To:     YueHaibing <yuehaibing@huawei.com>
Cc:     Lijun Ou <oulijun@huawei.com>,
        "Wei Hu(Xavier)" <xavier.huwei@huawei.com>,
        Doug Ledford <dledford@redhat.com>, linux-rdma@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH -next] RDMA/hns: Remove set but not used variable
 'fclr_write_fail_flag'
Message-ID: <20190703175443.GA25838@ziepe.ca>
References: <20190703031021.14896-1-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190703031021.14896-1-yuehaibing@huawei.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Wed, Jul 03, 2019 at 03:10:21AM +0000, YueHaibing wrote:
> Fixes gcc '-Wunused-but-set-variable' warning:
> 
> drivers/infiniband/hw/hns/hns_roce_hw_v2.c: In function 'hns_roce_function_clear':
> drivers/infiniband/hw/hns/hns_roce_hw_v2.c:1135:7: warning:
>  variable 'fclr_write_fail_flag' set but not used [-Wunused-but-set-variable]
> 
> It is never used, so can be removed.
> 
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> ---
>  drivers/infiniband/hw/hns/hns_roce_hw_v2.c | 2 --
>  1 file changed, 2 deletions(-)

Applied to for-next, thanks

Jason
