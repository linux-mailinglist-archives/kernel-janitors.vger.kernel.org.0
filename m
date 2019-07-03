Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 510EE5DEC1
	for <lists+kernel-janitors@lfdr.de>; Wed,  3 Jul 2019 09:20:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727004AbfGCHU2 (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Wed, 3 Jul 2019 03:20:28 -0400
Received: from mail.kernel.org ([198.145.29.99]:41230 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726327AbfGCHU2 (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 3 Jul 2019 03:20:28 -0400
Received: from localhost (unknown [37.142.3.125])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 152AE2187F;
        Wed,  3 Jul 2019 07:20:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1562138427;
        bh=7ganS0XAuLMClxCIPzDFzc0b49GPzuPWuvoSCEkle78=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=EzZUMOUBTMu0A+uLWYyBEDHzfacOTDyJrOm8mS+ShcZf4FPgWoUq/216VpMrrxGQo
         bt6HWsiGAn21KcsoSLPOrVAVstKRaQnpddWTQlaYwfP7RjzP9gl/3KKtJllvRkGWa4
         EpmwBVvlqu8t236dTixINeixYK5s317pl4obysPw=
Date:   Wed, 3 Jul 2019 10:20:23 +0300
From:   Leon Romanovsky <leon@kernel.org>
To:     YueHaibing <yuehaibing@huawei.com>
Cc:     Lijun Ou <oulijun@huawei.com>,
        "Wei Hu(Xavier)" <xavier.huwei@huawei.com>,
        Doug Ledford <dledford@redhat.com>,
        Jason Gunthorpe <jgg@ziepe.ca>, linux-rdma@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH -next] RDMA/hns: Remove set but not used variable
 'fclr_write_fail_flag'
Message-ID: <20190703072023.GY4727@mtr-leonro.mtl.com>
References: <20190703031021.14896-1-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190703031021.14896-1-yuehaibing@huawei.com>
User-Agent: Mutt/1.12.0 (2019-05-25)
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
>

Thanks,
Reviewed-by: Leon Romanovsky <leonro@mellanox.com>
