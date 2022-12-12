Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 65654649D3C
	for <lists+kernel-janitors@lfdr.de>; Mon, 12 Dec 2022 12:10:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232107AbiLLLKt (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Mon, 12 Dec 2022 06:10:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53168 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232057AbiLLLJ6 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 12 Dec 2022 06:09:58 -0500
Received: from mail.8bytes.org (mail.8bytes.org [IPv6:2a01:238:42d9:3f00:e505:6202:4f0c:f051])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id BE4B129D
        for <kernel-janitors@vger.kernel.org>; Mon, 12 Dec 2022 03:06:41 -0800 (PST)
Received: from 8bytes.org (p4ff2b8a9.dip0.t-ipconnect.de [79.242.184.169])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.8bytes.org (Postfix) with ESMTPSA id 47E902208DD;
        Mon, 12 Dec 2022 12:06:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
        s=default; t=1670843200;
        bh=Wx/FQOa0twYM0J5vE2YN6rDdN+so7uRjoO2kTY5Jbi0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=dW4pqcZewOZIBby4X/JgUMfAZGaEUzvnd6vMsAkbBHkhFy+Ob6GJzF0jf7dAi/rpk
         NFHRYkUI7faJCB7GChDJX3aCOGeNFuDgOyEqsKieXlFO2M0gzpTn5NI+POC0fhZASL
         auv0ddRDic9vhY9c4mqkpM1JfvccQUCTCArArvyfsVgAmAK74J3/eQlQRXuIBtaQHd
         Y667DXckjktnMd9xO172C3U4nEDHIOl7BoIQcr5eHtceKXgt6FmGj/QfdJPpLP/rUs
         28pCd9MX2lyZOOaUlGzDAWw6Wls7GKT5enuhfaJ48OeHc4otRH7bjYgbtHNh2xud6X
         DKhQ/4Wxp4jRQ==
Date:   Mon, 12 Dec 2022 12:06:39 +0100
From:   Joerg Roedel <joro@8bytes.org>
To:     Dan Carpenter <error27@gmail.com>
Cc:     Yong Wu <yong.wu@mediatek.com>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>, iommu@lists.linux.dev,
        linux-mediatek@lists.infradead.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] iommu/mediatek: Fix forever loop in error handling
Message-ID: <Y5cLPzaQzMadY4Yk@8bytes.org>
References: <Y5C3mTam2nkbaz6o@kili>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y5C3mTam2nkbaz6o@kili>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Wed, Dec 07, 2022 at 06:56:09PM +0300, Dan Carpenter wrote:
> There is a typo so this loop does i++ where i-- was intended.  It will
> result in looping until the kernel crashes.
> 
> Fixes: 26593928564c ("iommu/mediatek: Add error path for loop of mm_dts_parse")
> Signed-off-by: Dan Carpenter <error27@gmail.com>
> ---
>  drivers/iommu/mtk_iommu.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)

Applied, thanks.
