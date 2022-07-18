Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5B7C0577A2E
	for <lists+kernel-janitors@lfdr.de>; Mon, 18 Jul 2022 06:51:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229700AbiGREvA (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Mon, 18 Jul 2022 00:51:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54582 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233080AbiGREu7 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 18 Jul 2022 00:50:59 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D82E11174
        for <kernel-janitors@vger.kernel.org>; Sun, 17 Jul 2022 21:50:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
        :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=oQ2Oy2vE4Y+KSIGzjxEVBp2pts3FTmVlEXlZ7nc293g=; b=HOQX7vYq8SDzOd7E1gdk0oWwnQ
        r2ThWkQ5otK1i9cJw6HVmC7V5VEtI4CzC1MziwEGCj09Zmy+n5qwXZCIoEKg8KC9Nbz663MSLe8O4
        RUi6ApchxmPdLmLLq+m02IPHoTtCRrckHfMircsexKN6lyHm2LJVPbCPXz2m3qSZ8ejz+MEJ52ISg
        tUCnpVTFsGnASsreImdTvmDhO9TjVorzwPVHgPbNU7PrXr8G9AwlFrZzMsd2Tr7T64OL6Mruv7iE5
        gG+k/U5ImJ+n1ikCfdAOlx5v+Q3g9LvHAx6w/rlmjVkXYE0KT32kvwo2AaXFQiOD44txtgFS2T8t3
        ddJhXLYg==;
Received: from hch by bombadil.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
        id 1oDIiX-00Avjs-PI; Mon, 18 Jul 2022 04:50:49 +0000
Date:   Sun, 17 Jul 2022 21:50:49 -0700
From:   Christoph Hellwig <hch@infradead.org>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Christoph Hellwig <hch@infradead.org>,
        Tianyu Lan <Tianyu.Lan@microsoft.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Robin Murphy <robin.murphy@arm.com>, iommu@lists.linux.dev,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] swiotlb: Fix use after free on error handling path
Message-ID: <YtTmqRvo2ZFYz1op@infradead.org>
References: <YtEjJkxyiZouY7d3@kili>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YtEjJkxyiZouY7d3@kili>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Thanks, applied.
