Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A0DCD43C2DD
	for <lists+kernel-janitors@lfdr.de>; Wed, 27 Oct 2021 08:20:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238503AbhJ0GXD (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Wed, 27 Oct 2021 02:23:03 -0400
Received: from verein.lst.de ([213.95.11.211]:36423 "EHLO verein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230381AbhJ0GXD (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 27 Oct 2021 02:23:03 -0400
Received: by verein.lst.de (Postfix, from userid 2407)
        id 712BC67373; Wed, 27 Oct 2021 08:20:36 +0200 (CEST)
Date:   Wed, 27 Oct 2021 08:20:36 +0200
From:   Christoph Hellwig <hch@lst.de>
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc:     hch@lst.de, m.szyprowski@samsung.com, robin.murphy@arm.com,
        iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] dma-mapping: Use 'bitmap_zalloc()' when applicable
Message-ID: <20211027062036.GA10277@lst.de>
References: <20976d6fd4af266dec589b40929b53dfddd64b75.1635097161.git.christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20976d6fd4af266dec589b40929b53dfddd64b75.1635097161.git.christophe.jaillet@wanadoo.fr>
User-Agent: Mutt/1.5.17 (2007-11-01)
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Thanks, applied.
