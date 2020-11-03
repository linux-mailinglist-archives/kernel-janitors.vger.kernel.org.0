Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AD67F2A470F
	for <lists+kernel-janitors@lfdr.de>; Tue,  3 Nov 2020 14:57:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729454AbgKCN5t (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Tue, 3 Nov 2020 08:57:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42028 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729375AbgKCN43 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 3 Nov 2020 08:56:29 -0500
Received: from theia.8bytes.org (8bytes.org [IPv6:2a01:238:4383:600:38bc:a715:4b6d:a889])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D045C0613D1
        for <kernel-janitors@vger.kernel.org>; Tue,  3 Nov 2020 05:56:29 -0800 (PST)
Received: by theia.8bytes.org (Postfix, from userid 1000)
        id B62C0433; Tue,  3 Nov 2020 14:56:26 +0100 (CET)
Date:   Tue, 3 Nov 2020 14:56:25 +0100
From:   Joerg Roedel <joro@8bytes.org>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Jacob Pan <jacob.pan.linux@gmail.com>,
        Jean-Philippe Brucker <jean-philippe@linaro.org>,
        Liu Yi L <yi.l.liu@intel.com>,
        Eric Auger <eric.auger@redhat.com>,
        iommu@lists.linux-foundation.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] iommu: fix a check in iommu_check_bind_data()
Message-ID: <20201103135625.GK22888@8bytes.org>
References: <20201103101623.GA1127762@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201103101623.GA1127762@mwanda>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Tue, Nov 03, 2020 at 01:16:23PM +0300, Dan Carpenter wrote:
> The "data->flags" variable is a u64 so if one of the high 32 bits is
> set the original code will allow it, but it should be rejected.  The
> fix is to declare "mask" as a u64 instead of a u32.
> 
> Fixes: d90573812eea ("iommu/uapi: Handle data and argsz filled by users")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  drivers/iommu/iommu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied for v5.10, thanks.
