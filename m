Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 86E4C312B83
	for <lists+kernel-janitors@lfdr.de>; Mon,  8 Feb 2021 09:14:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229777AbhBHINz (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Mon, 8 Feb 2021 03:13:55 -0500
Received: from 8bytes.org ([81.169.241.247]:54778 "EHLO theia.8bytes.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229691AbhBHINy (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 8 Feb 2021 03:13:54 -0500
Received: by theia.8bytes.org (Postfix, from userid 1000)
        id 596013A7; Mon,  8 Feb 2021 09:13:03 +0100 (CET)
Date:   Mon, 8 Feb 2021 09:13:01 +0100
From:   Joerg Roedel <joro@8bytes.org>
To:     Yong Wu <yong.wu@mediatek.com>
Cc:     Lukas Bulwahn <lukas.bulwahn@gmail.com>,
        linux-mediatek@lists.infradead.org,
        iommu@lists.linux-foundation.org, Will Deacon <will@kernel.org>,
        Chun-Kuang Hu <chunkuang.hu@kernel.org>,
        Tomasz Figa <tfiga@chromium.org>,
        Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
        Pia Eichinger <pia.eichinger@st.oth-regensburg.de>,
        Joe Perches <joe@perches.com>, kernel-janitors@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MAINTAINERS: repair file pattern in MEDIATEK IOMMU DRIVER
Message-ID: <20210208081301.GB7302@8bytes.org>
References: <20210208061025.29198-1-lukas.bulwahn@gmail.com>
 <1612766125.19482.3.camel@mhfsdcap03>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1612766125.19482.3.camel@mhfsdcap03>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Mon, Feb 08, 2021 at 02:35:25PM +0800, Yong Wu wrote:
> On Mon, 2021-02-08 at 07:10 +0100, Lukas Bulwahn wrote:
> > Commit 6af4873852c4 ("MAINTAINERS: Add entry for MediaTek IOMMU") mentions
> > the pattern 'drivers/iommu/mtk-iommu*', but the files are actually named
> > with an underscore, not with a hyphen.
> > 
> > Hence, ./scripts/get_maintainer.pl --self-test=patterns complains:
> > 
> >   warning: no file matches  F:    drivers/iommu/mtk-iommu*
> > 
> > Repair this minor typo in the file pattern.
> > 
> > Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> > ---
> > applies cleanly on next-20210205
> > 
> > Yong, please ack.
> 
> +Joerg.
> 
> sorry for the typo.
> 
> Acked-by: Yong Wu <yong.wu@mediatek.com>

Applied, thanks.
