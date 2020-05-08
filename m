Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C03EA1CB2DE
	for <lists+kernel-janitors@lfdr.de>; Fri,  8 May 2020 17:32:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727829AbgEHPbz (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Fri, 8 May 2020 11:31:55 -0400
Received: from 8bytes.org ([81.169.241.247]:41818 "EHLO theia.8bytes.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727826AbgEHPby (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 8 May 2020 11:31:54 -0400
Received: by theia.8bytes.org (Postfix, from userid 1000)
        id 8B21C423; Fri,  8 May 2020 17:31:51 +0200 (CEST)
Date:   Fri, 8 May 2020 17:31:49 +0200
From:   Joerg Roedel <joro@8bytes.org>
To:     Julia Lawall <Julia.Lawall@inria.fr>
Cc:     Jean-Philippe Brucker <jean-philippe@linaro.org>,
        kernel-janitors@vger.kernel.org,
        virtualization@lists.linux-foundation.org,
        iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
        eugene.volanschi@inria.fr
Subject: Re: [PATCH] iommu/virtio: reverse arguments to list_add
Message-ID: <20200508153149.GA10908@8bytes.org>
References: <1588704467-13431-1-git-send-email-Julia.Lawall@inria.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1588704467-13431-1-git-send-email-Julia.Lawall@inria.fr>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Tue, May 05, 2020 at 08:47:47PM +0200, Julia Lawall wrote:
> Elsewhere in the file, there is a list_for_each_entry with
> &vdev->resv_regions as the second argument, suggesting that
> &vdev->resv_regions is the list head.  So exchange the
> arguments on the list_add call to put the list head in the
> second argument.
> 
> Fixes: 2a5a31487445 ("iommu/virtio: Add probe request")
> Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>

Applied for v5.7, thanks.
