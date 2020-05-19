Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 85EB61D95DD
	for <lists+kernel-janitors@lfdr.de>; Tue, 19 May 2020 14:06:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728854AbgESMGo (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Tue, 19 May 2020 08:06:44 -0400
Received: from 8bytes.org ([81.169.241.247]:43860 "EHLO theia.8bytes.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728853AbgESMGn (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 19 May 2020 08:06:43 -0400
Received: by theia.8bytes.org (Postfix, from userid 1000)
        id 10E3E386; Tue, 19 May 2020 14:06:40 +0200 (CEST)
Date:   Tue, 19 May 2020 14:06:38 +0200
From:   Joerg Roedel <joro@8bytes.org>
To:     Wei Yongjun <weiyongjun1@huawei.com>
Cc:     Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Maxime Ripard <maxime@cerno.tech>,
        iommu@lists.linux-foundation.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org, Hulk Robot <hulkci@huawei.com>
Subject: Re: [PATCH -next] iommu/sun50i: Fix return value check in
 sun50i_iommu_probe()
Message-ID: <20200519120638.GG18353@8bytes.org>
References: <20200519091857.134170-1-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200519091857.134170-1-weiyongjun1@huawei.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Tue, May 19, 2020 at 09:18:57AM +0000, Wei Yongjun wrote:
> In case of error, the function devm_platform_ioremap_resource() returns
> ERR_PTR() not NULL. The NULL test in the return value check must be
> replaced with IS_ERR().
> 
> Fixes: 4100b8c229b3 ("iommu: Add Allwinner H6 IOMMU driver")
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> ---
>  drivers/iommu/sun50i-iommu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied, thanks.

