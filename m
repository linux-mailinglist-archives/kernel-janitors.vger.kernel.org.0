Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6C137203F2C
	for <lists+kernel-janitors@lfdr.de>; Mon, 22 Jun 2020 20:32:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730168AbgFVScq (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Mon, 22 Jun 2020 14:32:46 -0400
Received: from smtp02.smtpout.orange.fr ([80.12.242.124]:22131 "EHLO
        smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730139AbgFVScq (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 22 Jun 2020 14:32:46 -0400
Received: from [10.0.2.15] ([92.148.198.76])
        by mwinf5d78 with ME
        id uJYd2200E1fPLi403JYePN; Mon, 22 Jun 2020 20:32:43 +0200
X-ME-Helo: [10.0.2.15]
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Mon, 22 Jun 2020 20:32:43 +0200
X-ME-IP: 92.148.198.76
Subject: Re: new TODO list item
To:     Christoph Hellwig <hch@infradead.org>,
        kernel-janitors@vger.kernel.org
References: <20200421081257.GA131897@infradead.org>
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Message-ID: <9a92878b-2cf2-7c14-86ce-f1c139f0a9ba@wanadoo.fr>
Date:   Mon, 22 Jun 2020 20:32:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200421081257.GA131897@infradead.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Le 21/04/2020 à 10:12, Christoph Hellwig a écrit :
> Hi Janitors,
> 
> if someone feels like helping with a fairly trivial legacy API, the
> wrappers in include/linux/pci-dma-compat.h should go away.  This is
> mostly trivially scriptable, except for dma_alloc_coherent, where
> the GFP_ATOMIC passed by pci_alloc_consisteny should usually be replaced
> with GFP_KERNEL when not calling from an atomic context.
> 

Hi,
what would be the best approach to work on, it?

I've processed the current tree, with the coccinelle script below.
For 'dma_alloc_coherent' calls, I've left a GFP_ on purpose, so that one 
need to wonder which flag is the best.

'make'ing the files before sending patches should spot the places were a 
correct flag has not been defined.

What puzzles me is that the script below >20k lines file and the 
diffstat is:
     288 files changed, 3963 insertions(+), 3857 deletions(-)


1. Does sending patches one file at a time makes sense?
2. Should the PCI_DMA_ --> DMA_ conversion should be handled first? (the 
#defined values are the same, it should be straightforward)
3. Should a huge patch series be sent to fix all at once?
4. Should we update everything except 'dma_alloc_coherent' all at once, 
then one file at a time for the allocation with correct GFP_ flag?


I could help with 1. or 2nd step of 4. This could go in the right 
direction, but would require time.

Other tree wide approaches look complex to me.


CJ


-------------------------------------
@@
@@
-    PCI_DMA_BIDIRECTIONAL
+    DMA_BIDIRECTIONAL

@@
@@
-    PCI_DMA_TODEVICE
+    DMA_TO_DEVICE

@@
@@
-    PCI_DMA_FROMDEVICE
+    DMA_FROM_DEVICE

@@
@@
-    PCI_DMA_NONE
+    DMA_NONE

@@
expression e1, e2, e3;
@@
-    pci_alloc_consistent(e1, e2, e3)
+    dma_alloc_coherent(&e1->dev, e2, e3, GFP_)

@@
expression e1, e2, e3;
@@
-    pci_zalloc_consistent(e1, e2, e3)
+    dma_alloc_coherent(&e1->dev, e2, e3, GFP_)

@@
expression e1, e2, e3, e4;
@@
-    pci_free_consistent(e1, e2, e3, e4)
+    dma_free_coherent(&e1->dev, e2, e3, e4)

@@
expression e1, e2, e3, e4;
@@
-    pci_map_single(e1, e2, e3, e4)
+    dma_map_single(&e1->dev, e2, e3, e4)

@@
expression e1, e2, e3, e4;
@@
-    pci_unmap_single(e1, e2, e3, e4)
+    dma_unmap_single(&e1->dev, e2, e3, e4)

@@
expression e1, e2, e3, e4, e5;
@@
-    pci_map_page(e1, e2, e3, e4, e5)
+    dma_map_page(&e1->dev, e2, e3, e4, e5)

@@
expression e1, e2, e3, e4;
@@
-    pci_unmap_page(e1, e2, e3, e4)
+    dma_unmap_page(&e1->dev, e2, e3, e4)

@@
expression e1, e2, e3, e4;
@@
-    pci_map_sg(e1, e2, e3, e4)
+    dma_map_sg(&e1->dev, e2, e3, e4)

@@
expression e1, e2, e3, e4;
@@
-    pci_unmap_sg(e1, e2, e3, e4)
+    dma_unmap_sg(&e1->dev, e2, e3, e4)

@@
expression e1, e2, e3, e4;
@@
-    pci_dma_sync_single_for_cpu(e1, e2, e3, e4)
+    dma_sync_single_for_cpu(&e1->dev, e2, e3, e4)

@@
expression e1, e2, e3, e4;
@@
-    pci_dma_sync_single_for_device(e1, e2, e3, e4)
+    dma_sync_single_for_device(&e1->dev, e2, e3, e4)

@@
expression e1, e2, e3, e4;
@@
-    pci_dma_sync_sg_for_cpu(e1, e2, e3, e4)
+    dma_sync_sg_for_cpu(&e1->dev, e2, e3, e4)

@@
expression e1, e2, e3, e4;
@@
-    pci_dma_sync_sg_for_device(e1, e2, e3, e4)
+    dma_sync_sg_for_device(&e1->dev, e2, e3, e4)

@@
expression e1, e2;
@@
-    pci_dma_mapping_error(e1, e2)
+    dma_mapping_error(&e1->dev, e2)

@@
expression e1, e2;
@@
-    pci_set_dma_mask(e1, e2)
+    dma_set_mask(&e1->dev, e2)

@@
expression e1, e2;
@@
-    pci_set_consistent_dma_mask(e1, e2)
+    dma_set_coherent_mask(&e1->dev, e2)

----------------------------------------
