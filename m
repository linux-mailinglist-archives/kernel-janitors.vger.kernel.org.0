Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F06816CC0BF
	for <lists+kernel-janitors@lfdr.de>; Tue, 28 Mar 2023 15:28:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229971AbjC1N2b (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Tue, 28 Mar 2023 09:28:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48638 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229532AbjC1N2b (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 28 Mar 2023 09:28:31 -0400
Received: from mail.8bytes.org (mail.8bytes.org [IPv6:2a01:238:42d9:3f00:e505:6202:4f0c:f051])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id B1F3B1B6
        for <kernel-janitors@vger.kernel.org>; Tue, 28 Mar 2023 06:28:29 -0700 (PDT)
Received: from 8bytes.org (p200300c27714bc0086ad4f9d2505dd0d.dip0.t-ipconnect.de [IPv6:2003:c2:7714:bc00:86ad:4f9d:2505:dd0d])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.8bytes.org (Postfix) with ESMTPSA id 04315243E72;
        Tue, 28 Mar 2023 15:28:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
        s=default; t=1680010108;
        bh=N8ejcUWpQfYs16FWNBvAx22Mygy8fNuSfssyZNAHsVA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=S2J83d/sK5H3vZbLIwLROix4mqLAb2VDHvOFSNiknrxfQKKaKJo0d6rpw9uVZs7XT
         b9cAav6Wvck0r7qIh2fcfocaENy4y5CIQMW7evRm5h3AcJyeKWSgA0r9QLYehPaOFd
         JfiBYLs7Zm93B87i7fzVk6yprFq0blc/151RIIB2k9zcqMMfXHKdeYS52TGw4QTu93
         +SHgeIuCQdR9W6l/YYAR6+f0Ju48+XvZ6Med50yaCi5ImeJffSvsfITt4vNtEnA+Fm
         exnQ4/+G2YYeQuAc5qSBwalmLudOdhQhc3KFEHWJfcZ67kRHmIEa9/xqilbXxIBXPq
         Ul0YyTHUQVaVg==
Date:   Tue, 28 Mar 2023 15:28:26 +0200
From:   Joerg Roedel <joro@8bytes.org>
To:     Dan Carpenter <error27@gmail.com>
Cc:     Yong Wu <yong.wu@mediatek.com>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        "Chengci.Xu" <chengci.xu@mediatek.com>, iommu@lists.linux.dev,
        linux-mediatek@lists.infradead.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] iommu/mediatek: fix a reversed test in probe
Message-ID: <ZCLreuVYNcXtkCHH@8bytes.org>
References: <88c83ce7-5d1a-44a8-b9bf-0d01cfea24db@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <88c83ce7-5d1a-44a8-b9bf-0d01cfea24db@kili.mountain>
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Sat, Mar 25, 2023 at 02:07:52PM +0300, Dan Carpenter wrote:
> The dma_set_mask() function returns negative error codes on failure but
> this code is testing for zero instead.
> 
> Fixes: f4b49c7c5e67 ("iommu/mediatek: Set dma_mask for PGTABLE_PA_35_EN")
> Signed-off-by: Dan Carpenter <error27@gmail.com>
> ---
>  drivers/iommu/mtk_iommu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Thanks for the fix, but I replaced above commit with v3, which I
overlooked when applying it. The v3 post has this already fixed.

Regards,

	Joerg
