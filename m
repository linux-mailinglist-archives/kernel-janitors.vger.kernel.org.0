Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1EB292298EB
	for <lists+kernel-janitors@lfdr.de>; Wed, 22 Jul 2020 15:04:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732389AbgGVNDM (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Wed, 22 Jul 2020 09:03:12 -0400
Received: from 8bytes.org ([81.169.241.247]:58600 "EHLO theia.8bytes.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732353AbgGVNDL (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 22 Jul 2020 09:03:11 -0400
Received: by theia.8bytes.org (Postfix, from userid 1000)
        id D81502C8; Wed, 22 Jul 2020 15:03:08 +0200 (CEST)
Date:   Wed, 22 Jul 2020 15:03:07 +0200
From:   Joerg Roedel <joro@8bytes.org>
To:     Colin King <colin.king@canonical.com>
Cc:     Tony Lindgren <tony@atomide.com>,
        Hiroshi DOYU <Hiroshi.DOYU@nokia.com>,
        iommu@lists.linux-foundation.org, kernel-janitors@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] OMAP: iommu: check for failure of a call to
 omap_iommu_dump_ctx
Message-ID: <20200722130307.GC27672@8bytes.org>
References: <20200714192211.744776-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200714192211.744776-1-colin.king@canonical.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Tue, Jul 14, 2020 at 08:22:11PM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> It is possible for the call to omap_iommu_dump_ctx to return
> a negative error number, so check for the failure and return
> the error number rather than pass the negative value to
> simple_read_from_buffer.
> 
> Addresses-Coverity: ("Improper use of negative value")
> Fixes: 14e0e6796a0d ("OMAP: iommu: add initial debugfs support")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/iommu/omap-iommu-debug.c | 3 +++
>  1 file changed, 3 insertions(+)

Applied, thanks.
