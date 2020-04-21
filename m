Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9856D1B250C
	for <lists+kernel-janitors@lfdr.de>; Tue, 21 Apr 2020 13:26:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728480AbgDUL0R (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Tue, 21 Apr 2020 07:26:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48508 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726403AbgDUL0Q (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 21 Apr 2020 07:26:16 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A8EF1C061A0F
        for <kernel-janitors@vger.kernel.org>; Tue, 21 Apr 2020 04:26:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
        :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=UVZlwSSJRSI8jmx6VYQHvFhAnnv4xVjcXNeW1lEGS5E=; b=rqiDVaq6CIoNToYCj/l/k5RXXW
        6OKEEzfWi1qnB+Yk9Vn+6x6Fm9GDSGhrUGXjFYKQr+rwskC2qaHgaQif9sKvq335iTpIEhYXMgTBc
        ch5WoQxduYHgvuz+wrk9Ffj6qvL0WFswxe6qPdg0mRLiZupl1cIgafQ/ZUiCKhy8HQFmmWwH5nfx1
        abH9JiEdY8nMjmiZdiTvZUcVwccDCp21xmKvRXL9xR/fZxsjr1V/4WMcIgs0OnxqbU61JEtEZAI94
        /HEOWtbWUJ9KeetxdiOj3sZip63GObLYhu3XB2PI85c8hapziKjI3au1RgkSUJ2As3uy3l3qLMfTv
        8qv/nEjw==;
Received: from hch by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red Hat Linux))
        id 1jQr2e-0001sa-9r; Tue, 21 Apr 2020 11:26:16 +0000
Date:   Tue, 21 Apr 2020 04:26:16 -0700
From:   Christoph Hellwig <hch@infradead.org>
To:     Suraj Upadhyay <usuraj35@gmail.com>
Cc:     Christoph Hellwig <hch@infradead.org>,
        kernel-janitors@vger.kernel.org
Subject: Re: new TODO list item
Message-ID: <20200421112616.GA29634@infradead.org>
References: <20200421081257.GA131897@infradead.org>
 <20200421082324.GA32008@blackclown>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200421082324.GA32008@blackclown>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Tue, Apr 21, 2020 at 01:53:25PM +0530, Suraj Upadhyay wrote:
> On Tue, Apr 21, 2020 at 10:12:57AM +0200, Christoph Hellwig wrote:
> > Hi Janitors,
> > 
> > if someone feels like helping with a fairly trivial legacy API, the
> > wrappers in include/linux/pci-dma-compat.h should go away.  This is
> > mostly trivially scriptable, except for dma_alloc_coherent, where
> > the GFP_ATOMIC passed by pci_alloc_consisteny should usually be replaced
> > with GFP_KERNEL when not calling from an atomic context.
> 
> Hii Christoph,
> 	This is my first time posting to kernel-janitors. I would be glad to
> help with this task but suggest me if I should get started with
> something else.

Sure, feel free to get started.  A coccinelle script to do the grunt
work might be useful, though.
