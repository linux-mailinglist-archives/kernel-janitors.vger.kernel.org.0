Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 33DA13B500A
	for <lists+kernel-janitors@lfdr.de>; Sat, 26 Jun 2021 22:16:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230310AbhFZUSW (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Sat, 26 Jun 2021 16:18:22 -0400
Received: from mail3-relais-sop.national.inria.fr ([192.134.164.104]:44850
        "EHLO mail3-relais-sop.national.inria.fr" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230107AbhFZUSV (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sat, 26 Jun 2021 16:18:21 -0400
IronPort-HdrOrdr: =?us-ascii?q?A9a23=3A7ODs7KEPDnBm+VZOpLqE78eALOsnbusQ8zAX?=
 =?us-ascii?q?PiFKOHhom6Oj/PxG8M5w6fawslcssRIb6LW90cu7IU80nKQdibX5f43SPzUO01?=
 =?us-ascii?q?HHEGgN1+ffKnHbak/D398Y5ONbf69yBMaYNzVHpMzxiTPWL+od?=
X-IronPort-AV: E=Sophos;i="5.83,302,1616454000"; 
   d="scan'208";a="386249508"
Received: from 173.121.68.85.rev.sfr.net (HELO hadrien) ([85.68.121.173])
  by mail3-relais-sop.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 26 Jun 2021 22:15:57 +0200
Date:   Sat, 26 Jun 2021 22:15:56 +0200 (CEST)
From:   Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>
cc:     Julia.Lawall@inria.fr, Gilles.Muller@inria.fr,
        nicolas.palix@imag.fr, michal.lkml@markovi.net,
        cocci@systeme.lip6.fr, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] Coccinelle: Update and rename
 api/alloc/pci_free_consistent.cocci
In-Reply-To: <edc2fdb429d184d05a70956ced00845bca2d4fe9.1623871406.git.christophe.jaillet@wanadoo.fr>
Message-ID: <alpine.DEB.2.22.394.2106262215080.3562@hadrien>
References: <edc2fdb429d184d05a70956ced00845bca2d4fe9.1623871406.git.christophe.jaillet@wanadoo.fr>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org



On Wed, 16 Jun 2021, Christophe JAILLET wrote:

> 'pci_alloc_consistent()' is about to be removed from the kernel.
> It is now more useful to check for dma_alloc_coherent/dma_free_coherent.
>
> So change the script accordingly and rename it.

There also seem to be a lot of false positives, where the value is used in
unexpected ways, such as:

        for (i = 0; i < nr_pages; ++i) {
                cpu_addr = dma_alloc_coherent(dma_dev, PAGE_SIZE, &dma_addr,
                                              CIO_DMA_GFP);
                if (!cpu_addr)
                        return gp_dma;
                gen_pool_add_virt(gp_dma, (unsigned long) cpu_addr,
                                  dma_addr, PAGE_SIZE, -1);
        }

Maybe the rule should be dropped?

julia

>
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
> Not sure that the script works.
> There are 718 'dma_alloc_coherent' calls in 5.13-rc6. It is surprising
> to have no match at all, not even a single false positive.
> ---
>  ..._consistent.cocci => dma_free_coherent.cocci} | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
>  rename scripts/coccinelle/free/{pci_free_consistent.cocci => dma_free_coherent.cocci} (52%)
>
> diff --git a/scripts/coccinelle/free/pci_free_consistent.cocci b/scripts/coccinelle/free/dma_free_coherent.cocci
> similarity index 52%
> rename from scripts/coccinelle/free/pci_free_consistent.cocci
> rename to scripts/coccinelle/free/dma_free_coherent.cocci
> index d51e92556b42..75f159e7b6d7 100644
> --- a/scripts/coccinelle/free/pci_free_consistent.cocci
> +++ b/scripts/coccinelle/free/dma_free_coherent.cocci
> @@ -1,10 +1,10 @@
>  // SPDX-License-Identifier: GPL-2.0-only
> -/// Find missing pci_free_consistent for every pci_alloc_consistent.
> +/// Find missing dma_free_coherent for every dma_alloc_coherent.
>  ///
>  // Confidence: Moderate
>  // Copyright: (C) 2013 Petr Strnad.
>  // URL: http://coccinelle.lip6.fr/
> -// Keywords: pci_free_consistent, pci_alloc_consistent
> +// Keywords: dma_free_coherent, dma_alloc_coherent
>  // Options: --no-includes --include-headers
>
>  virtual report
> @@ -17,12 +17,12 @@ position p1,p2;
>  type T;
>  @@
>
> -id = pci_alloc_consistent@p1(x,y,&z)
> +id = dma_alloc_coherent@p1(x,y,&z)
>  ... when != e = id
>  if (id == NULL || ...) { ... return ...; }
> -... when != pci_free_consistent(x,y,id,z)
> -    when != if (id) { ... pci_free_consistent(x,y,id,z) ... }
> -    when != if (y) { ... pci_free_consistent(x,y,id,z) ... }
> +... when != dma_free_coherent(x,y,id,z)
> +    when != if (id) { ... dma_free_coherent(x,y,id,z) ... }
> +    when != if (y) { ... dma_free_coherent(x,y,id,z) ... }
>      when != e = (T)id
>      when exists
>  (
> @@ -40,7 +40,7 @@ p1 << search.p1;
>  p2 << search.p2;
>  @@
>
> -msg = "ERROR: missing pci_free_consistent; pci_alloc_consistent on line %s and return without freeing on line %s" % (p1[0].line,p2[0].line)
> +msg = "ERROR: missing dma_free_coherent; dma_alloc_coherent on line %s and return without freeing on line %s" % (p1[0].line,p2[0].line)
>  coccilib.report.print_report(p2[0],msg)
>
>  @script:python depends on org@
> @@ -48,6 +48,6 @@ p1 << search.p1;
>  p2 << search.p2;
>  @@
>
> -msg = "ERROR: missing pci_free_consistent; pci_alloc_consistent on line %s and return without freeing on line %s" % (p1[0].line,p2[0].line)
> +msg = "ERROR: missing dma_free_coherent; dma_alloc_coherent on line %s and return without freeing on line %s" % (p1[0].line,p2[0].line)
>  cocci.print_main(msg,p1)
>  cocci.print_secs("",p2)
> --
> 2.30.2
>
>
