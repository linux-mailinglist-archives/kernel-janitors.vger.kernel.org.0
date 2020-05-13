Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 84B351D0B54
	for <lists+kernel-janitors@lfdr.de>; Wed, 13 May 2020 10:58:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730804AbgEMI54 (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Wed, 13 May 2020 04:57:56 -0400
Received: from 8bytes.org ([81.169.241.247]:42264 "EHLO theia.8bytes.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730237AbgEMI54 (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 13 May 2020 04:57:56 -0400
Received: by theia.8bytes.org (Postfix, from userid 1000)
        id A439D379; Wed, 13 May 2020 10:57:53 +0200 (CEST)
Date:   Wed, 13 May 2020 10:57:52 +0200
From:   Joerg Roedel <joro@8bytes.org>
To:     YueHaibing <yuehaibing@huawei.com>
Cc:     iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH -next] iommu/amd: Remove set but not used variable 'iommu'
Message-ID: <20200513085752.GF9820@8bytes.org>
References: <20200508134036.116569-1-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200508134036.116569-1-yuehaibing@huawei.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Fri, May 08, 2020 at 01:40:36PM +0000, YueHaibing wrote:
> Fixes gcc '-Wunused-but-set-variable' warning:
> 
> drivers/iommu/amd_iommu.c: In function 'amd_iommu_uninit_device':
> drivers/iommu/amd_iommu.c:422:20: warning:
>  variable 'iommu' set but not used [-Wunused-but-set-variable]
> 
> commit dce8d6964ebd ("iommu/amd: Convert to probe/release_device() call-backs")
> involved this, remove it.
> 
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> ---
>  drivers/iommu/amd_iommu.c | 3 ---
>  1 file changed, 3 deletions(-)

Thanks for the patch, but I already applied

	https://lore.kernel.org/r/20200509015645.3236-1-cai@lca.pw

Regards,

	Joerg

