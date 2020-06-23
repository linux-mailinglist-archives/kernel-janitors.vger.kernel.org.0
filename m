Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D9C00204C60
	for <lists+kernel-janitors@lfdr.de>; Tue, 23 Jun 2020 10:28:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731862AbgFWI2Z (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Tue, 23 Jun 2020 04:28:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54774 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731675AbgFWI2Z (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 23 Jun 2020 04:28:25 -0400
X-Greylist: delayed 1367 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Tue, 23 Jun 2020 01:28:25 PDT
Received: from casper.infradead.org (unknown [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2744DC061573
        for <kernel-janitors@vger.kernel.org>; Tue, 23 Jun 2020 01:28:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=VFE1OhRJl1pKmkOHmfPog0qqCiyjbWRGXzumJXTdAn0=; b=EigUWxJt0oNs3LMh2z1ZPVI1PZ
        PixTn6TDkKt4+N0yYw0zMK+ulcUC12RiMb5JcLzG68ntt38ag0G5JN8qsKX9ZcfhFYojg2vUu7FQe
        4uPcXG9h9fNKKV0TETav4HRE2gZsuVnyBn+fVjOyuKTSmiGShR1UsXO4pILY3MLcm7BRgqF5g80Tn
        MLuNunnih4dsrTyEd5fRAfuyY0cTWBD2RJ38TKJvPdqJp836zMEqq2tresWm4GytN84ksBhPt0XBC
        k4Hy+HCOrmXjZqnMEDbtSFrJ3R+cMNJEOCLGXrqyf1M5f8IAlUAKvSAaKeHiExm6VUyz2dbPpqsaz
        b/XJO7VA==;
Received: from hch by casper.infradead.org with local (Exim 4.92.3 #3 (Red Hat Linux))
        id 1jndvl-0007RM-5Q; Tue, 23 Jun 2020 08:05:21 +0000
Date:   Tue, 23 Jun 2020 09:05:21 +0100
From:   Christoph Hellwig <hch@infradead.org>
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc:     Christoph Hellwig <hch@infradead.org>,
        kernel-janitors@vger.kernel.org
Subject: Re: new TODO list item
Message-ID: <20200623080521.GA27583@infradead.org>
References: <20200421081257.GA131897@infradead.org>
 <9a92878b-2cf2-7c14-86ce-f1c139f0a9ba@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9a92878b-2cf2-7c14-86ce-f1c139f0a9ba@wanadoo.fr>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Mon, Jun 22, 2020 at 08:32:36PM +0200, Christophe JAILLET wrote:
> Le 21/04/2020 ?? 10:12, Christoph Hellwig a ??crit??:
> > Hi Janitors,
> > 
> > if someone feels like helping with a fairly trivial legacy API, the
> > wrappers in include/linux/pci-dma-compat.h should go away.  This is
> > mostly trivially scriptable, except for dma_alloc_coherent, where
> > the GFP_ATOMIC passed by pci_alloc_consisteny should usually be replaced
> > with GFP_KERNEL when not calling from an atomic context.
> > 
> 
> Hi,
> what would be the best approach to work on, it?
> 
> I've processed the current tree, with the coccinelle script below.
> For 'dma_alloc_coherent' calls, I've left a GFP_ on purpose, so that one
> need to wonder which flag is the best.
> 
> 'make'ing the files before sending patches should spot the places were a
> correct flag has not been defined.
> 
> What puzzles me is that the script below >20k lines file and the diffstat
> is:
>     288 files changed, 3963 insertions(+), 3857 deletions(-)
> 
> 
> 1. Does sending patches one file at a time makes sense?

File is a little too small.  Split on a subsystem, or for subsystems
that have a lot of drivers (e.g. scsi or net) on  per-driver basis.

> 2. Should the PCI_DMA_ --> DMA_ conversion should be handled first? (the
> #defined values are the same, it should be straightforward)

I wouldn't bother.

> 3. Should a huge patch series be sent to fix all at once?

I don't think that is helpful.  Just one series (or single patch)
per subsystem.

> 4. Should we update everything except 'dma_alloc_coherent' all at once, then
> one file at a time for the allocation with correct GFP_ flag?

I don't think so.

Btw, we have an issue with drivers/message/fusion where the GFP_ATOMIC
removal would be really useful as in fixing a regression caused by
another change. Can you do that as a trial ASAP and also Cc
Robin Murphy <robin.murphy@arm.com>, Guenter Roeck <linux@roeck-us.net>
and Geert Uytterhoeven <geert@linux-m68k.org>
