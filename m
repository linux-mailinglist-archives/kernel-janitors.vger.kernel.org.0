Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5590329FDD3
	for <lists+kernel-janitors@lfdr.de>; Fri, 30 Oct 2020 07:33:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725779AbgJ3GdF (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Fri, 30 Oct 2020 02:33:05 -0400
Received: from smtp11.smtpout.orange.fr ([80.12.242.133]:49908 "EHLO
        smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725355AbgJ3GdF (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 30 Oct 2020 02:33:05 -0400
Received: from [192.168.42.210] ([81.185.168.250])
        by mwinf5d46 with ME
        id m6Z2230035QVFy9036Z2Qn; Fri, 30 Oct 2020 07:33:03 +0100
X-ME-Helo: [192.168.42.210]
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Fri, 30 Oct 2020 07:33:03 +0100
X-ME-IP: 81.185.168.250
Subject: Re: new TODO list item
To:     Christoph Hellwig <hch@infradead.org>,
        kernel-janitors@vger.kernel.org
References: <20200421081257.GA131897@infradead.org>
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Message-ID: <d9e3c0f2-a2ea-a279-9df4-0c8a908bba14@wanadoo.fr>
Date:   Fri, 30 Oct 2020 07:33:02 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <20200421081257.GA131897@infradead.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Le 21/04/2020 à 10:12, Christoph Hellwig a écrit :
> Hi Janitors,
> 
> if someone feels like helping with a fairly trivial legacy API, the
> wrappers in include/linux/pci-dma-compat.h should go away.  This is
> mostly trivially scriptable, except for dma_alloc_coherent, where
> the GFP_ATOMIC passed by pci_alloc_consistent should usually be replaced
> with GFP_KERNEL when not calling from an atomic context.
> 

Hi,
just a small update on the work on progress:

https://elixir.bootlin.com/linux/v5.8/A/ident/pci_alloc_consistent
    --> 88 files
https://elixir.bootlin.com/linux/v5.9/A/ident/pci_alloc_consistent
    --> 62 files
https://elixir.bootlin.com/linux/v5.10-rc1/A/ident/pci_alloc_consistent
    --> 32 files

https://elixir.bootlin.com/linux/v5.8/A/ident/pci_zalloc_consistent
    --> 26 files
https://elixir.bootlin.com/linux/v5.9/A/ident/pci_zalloc_consistent
    --> 19 files
https://elixir.bootlin.com/linux/v5.10-rc1/A/ident/pci_zalloc_consistent
    --> 11 files


None of the drivers/media/pci/* patches has been accepted yet.


CJ
