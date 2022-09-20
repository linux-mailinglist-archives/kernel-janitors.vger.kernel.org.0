Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0AEC55BDD84
	for <lists+kernel-janitors@lfdr.de>; Tue, 20 Sep 2022 08:43:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229731AbiITGnr (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Tue, 20 Sep 2022 02:43:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32800 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230116AbiITGnh (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 20 Sep 2022 02:43:37 -0400
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9DF936241;
        Mon, 19 Sep 2022 23:43:36 -0700 (PDT)
Received: by verein.lst.de (Postfix, from userid 2407)
        id AE82868AFE; Tue, 20 Sep 2022 08:43:32 +0200 (CEST)
Date:   Tue, 20 Sep 2022 08:43:32 +0200
From:   Christoph Hellwig <hch@lst.de>
To:     Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc:     Christoph Hellwig <hch@lst.de>, iommu@lists.linux.dev,
        Juergen Gross <jgross@suse.com>,
        Stefano Stabellini <sstabellini@kernel.org>,
        kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] MAINTAINERS: refurbish SWIOTLB SUBSYSTEM sections
 after refactoring
Message-ID: <20220920064332.GA17325@lst.de>
References: <20220919084744.3043-1-lukas.bulwahn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220919084744.3043-1-lukas.bulwahn@gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Sorry for coming up with this only now, but what about just dropping
the separate swiotlb entry entirely, and just add include/linux/swiotlb.h
to the dma-mapping entry?
