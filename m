Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BEA6B4A5B35
	for <lists+kernel-janitors@lfdr.de>; Tue,  1 Feb 2022 12:32:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237272AbiBALcA (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Tue, 1 Feb 2022 06:32:00 -0500
Received: from pegase2.c-s.fr ([93.17.235.10]:56529 "EHLO pegase2.c-s.fr"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237268AbiBALb7 (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 1 Feb 2022 06:31:59 -0500
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
        by localhost (Postfix) with ESMTP id 4Jp2p50jzKz9sSn;
        Tue,  1 Feb 2022 12:31:57 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
        by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id D3CPxDswQAuy; Tue,  1 Feb 2022 12:31:57 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
        by pegase2.c-s.fr (Postfix) with ESMTP id 4Jp2p46txLz9sSg;
        Tue,  1 Feb 2022 12:31:56 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
        by messagerie.si.c-s.fr (Postfix) with ESMTP id D9D6B8B840;
        Tue,  1 Feb 2022 12:31:56 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
        by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
        with ESMTP id ryWDZpz1U5iu; Tue,  1 Feb 2022 12:31:56 +0100 (CET)
Received: from [192.168.5.118] (unknown [192.168.5.118])
        by messagerie.si.c-s.fr (Postfix) with ESMTP id 341EF8B839;
        Tue,  1 Feb 2022 12:31:56 +0100 (CET)
Message-ID: <1ea13a2a-90fd-07d3-2031-19e81ea349b4@csgroup.eu>
Date:   Tue, 1 Feb 2022 12:31:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH] powerpc/xive: Add some error handling code to
 'xive_spapr_init()'
Content-Language: fr-FR
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        benh@kernel.crashing.org, paulus@samba.org, mpe@ellerman.id.au,
        allison@lohutok.net, tglx@linutronix.de, clg@kaod.org,
        groug@kaod.org
Cc:     kernel-janitors@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-kernel@vger.kernel.org
References: <20190801110956.8517-1-christophe.jaillet@wanadoo.fr>
From:   Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <20190801110956.8517-1-christophe.jaillet@wanadoo.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hi,

Le 01/08/2019 à 13:09, Christophe JAILLET a écrit :
> 'xive_irq_bitmap_add()' can return -ENOMEM.
> In this case, we should free the memory already allocated and return
> 'false' to the caller.
> 
> Also add an error path which undoes the 'tima = ioremap(...)'

This old patch doesn't apply, if it is still relevant can you please 
rebase ?

Thanks
Christophe

> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
> NOT compile tested (I don't have a cross compiler and won't install one).
> So if some correction or improvement are needed, feel free to propose and
> commit it directly.
> ---
>   arch/powerpc/sysdev/xive/spapr.c | 36 +++++++++++++++++++++++++-------
>   1 file changed, 28 insertions(+), 8 deletions(-)
> 
> diff --git a/arch/powerpc/sysdev/xive/spapr.c b/arch/powerpc/sysdev/xive/spapr.c
> index 52198131c75e..b3ae0b76c433 100644
> --- a/arch/powerpc/sysdev/xive/spapr.c
> +++ b/arch/powerpc/sysdev/xive/spapr.c
> @@ -64,6 +64,17 @@ static int xive_irq_bitmap_add(int base, int count)
>   	return 0;
>   }
>   
> +static void xive_irq_bitmap_remove_all(void)
> +{
> +	struct xive_irq_bitmap *xibm, *tmp;
> +
> +	list_for_each_entry_safe(xibm, tmp, &xive_irq_bitmaps, list) {
> +		list_del(&xibm->list);
> +		kfree(xibm->bitmap);
> +		kfree(xibm);
> +	}
> +}
> +
>   static int __xive_irq_bitmap_alloc(struct xive_irq_bitmap *xibm)
>   {
>   	int irq;
> @@ -723,7 +734,7 @@ bool __init xive_spapr_init(void)
>   	u32 val;
>   	u32 len;
>   	const __be32 *reg;
> -	int i;
> +	int i, err;
>   
>   	if (xive_spapr_disabled())
>   		return false;
> @@ -748,23 +759,26 @@ bool __init xive_spapr_init(void)
>   	}
>   
>   	if (!xive_get_max_prio(&max_prio))
> -		return false;
> +		goto err_unmap;
>   
>   	/* Feed the IRQ number allocator with the ranges given in the DT */
>   	reg = of_get_property(np, "ibm,xive-lisn-ranges", &len);
>   	if (!reg) {
>   		pr_err("Failed to read 'ibm,xive-lisn-ranges' property\n");
> -		return false;
> +		goto err_unmap;
>   	}
>   
>   	if (len % (2 * sizeof(u32)) != 0) {
>   		pr_err("invalid 'ibm,xive-lisn-ranges' property\n");
> -		return false;
> +		goto err_unmap;
>   	}
>   
> -	for (i = 0; i < len / (2 * sizeof(u32)); i++, reg += 2)
> -		xive_irq_bitmap_add(be32_to_cpu(reg[0]),
> -				    be32_to_cpu(reg[1]));
> +	for (i = 0; i < len / (2 * sizeof(u32)); i++, reg += 2) {
> +		err = xive_irq_bitmap_add(be32_to_cpu(reg[0]),
> +					  be32_to_cpu(reg[1]));
> +		if (err < 0)
> +			goto err_mem_free;
> +	}
>   
>   	/* Iterate the EQ sizes and pick one */
>   	of_property_for_each_u32(np, "ibm,xive-eq-sizes", prop, reg, val) {
> @@ -775,8 +789,14 @@ bool __init xive_spapr_init(void)
>   
>   	/* Initialize XIVE core with our backend */
>   	if (!xive_core_init(&xive_spapr_ops, tima, TM_QW1_OS, max_prio))
> -		return false;
> +		goto err_mem_free;
>   
>   	pr_info("Using %dkB queues\n", 1 << (xive_queue_shift - 10));
>   	return true;
> +
> +err_mem_free:
> +	xive_irq_bitmap_remove_all();
> +err_unmap:
> +	iounmap(tima);
> +	return false;
>   }
