Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0183D2F53CD
	for <lists+kernel-janitors@lfdr.de>; Wed, 13 Jan 2021 21:03:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728695AbhAMUDZ (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Wed, 13 Jan 2021 15:03:25 -0500
Received: from smtp01.smtpout.orange.fr ([80.12.242.123]:51434 "EHLO
        smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728552AbhAMUDZ (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 13 Jan 2021 15:03:25 -0500
Received: from [192.168.1.41] ([92.131.99.25])
        by mwinf5d54 with ME
        id GL1a2400E0Ys01Y03L1bq2; Wed, 13 Jan 2021 21:01:38 +0100
X-ME-Helo: [192.168.1.41]
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Wed, 13 Jan 2021 21:01:38 +0100
X-ME-IP: 92.131.99.25
Subject: Re: new TODO list item
From:   Marion & Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     Christoph Hellwig <hch@infradead.org>,
        kernel-janitors@vger.kernel.org
References: <20200421081257.GA131897@infradead.org>
 <d9e3c0f2-a2ea-a279-9df4-0c8a908bba14@wanadoo.fr>
Message-ID: <df8bd5f1-fdd0-97be-4fc7-d003faf83af6@wanadoo.fr>
Date:   Wed, 13 Jan 2021 21:01:37 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <d9e3c0f2-a2ea-a279-9df4-0c8a908bba14@wanadoo.fr>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: fr
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org


  Le 21/04/2020 à 10:12, Christoph Hellwig a écrit :
> Hi Janitors,
>
> if someone feels like helping with a fairly trivial legacy API, the
> wrappers in include/linux/pci-dma-compat.h should go away.  This is
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
  https://elixir.bootlin.com/linux/v5.10-rc1/A/ident/pci_alloc_consistent
      --> 20 files

  https://elixir.bootlin.com/linux/v5.8/A/ident/pci_zalloc_consistent
      --> 26 files
  https://elixir.bootlin.com/linux/v5.9/A/ident/pci_zalloc_consistent
      --> 19 files
  https://elixir.bootlin.com/linux/v5.10-rc1/A/ident/pci_zalloc_consistent
      --> 11 files
  https://elixir.bootlin.com/linux/v5.11-rc1/A/ident/pci_zalloc_consistent
      --> 4 files


  CJ

