Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4E6E772B9ED
	for <lists+kernel-janitors@lfdr.de>; Mon, 12 Jun 2023 10:12:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232030AbjFLIMq (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Mon, 12 Jun 2023 04:12:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49496 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232065AbjFLIMS (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 12 Jun 2023 04:12:18 -0400
X-Greylist: delayed 2198 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Mon, 12 Jun 2023 01:11:56 PDT
Received: from out-16.mta1.migadu.com (out-16.mta1.migadu.com [95.215.58.16])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 48071170D
        for <kernel-janitors@vger.kernel.org>; Mon, 12 Jun 2023 01:11:56 -0700 (PDT)
Date:   Mon, 12 Jun 2023 07:32:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
        t=1686555176;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=SULM+6FThJzvyXwxyj7QV3ZUjutT1xQE2B8Rpur3KF0=;
        b=YhBOPHhqecDo0QBxQKFf6UUQcHLixyhGC06NV3PEDYOaLxc7CA6VTowu4E1L6pbHCrsSR4
        mrVV/B8dk/NzdAbAohKWuD8TfuiEOqKgNJnQFPWoaNu4nD+UW7tj6QmSDd6FKwQR9frLIS
        Zt3OTxpCy5JykEGumS6rHt26OjZvCmE=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From:   Oliver Upton <oliver.upton@linux.dev>
To:     Dan Carpenter <dan.carpenter@linaro.org>
Cc:     Marc Zyngier <maz@kernel.org>,
        Christoffer Dall <christoffer.dall@arm.com>,
        James Morse <james.morse@arm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Zenghui Yu <yuzenghui@huawei.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] KVM: arm64: timers: Fix resource leaks in
 kvm_timer_hyp_init()
Message-ID: <ZIbKJPx2RR0Le7Zl@linux.dev>
References: <e0dd820f-52d2-4c54-97f3-5aa02e0bd6e0@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e0dd820f-52d2-4c54-97f3-5aa02e0bd6e0@kili.mountain>
X-Migadu-Flow: FLOW_OUT
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hi Dan,

Thanks for fixing this. Couple of small comments:

On Mon, Jun 12, 2023 at 10:07:46AM +0300, Dan Carpenter wrote:
> Smatch detected this bug:
>     arch/arm64/kvm/arch_timer.c:1425 kvm_timer_hyp_init()
>     warn: missing unwind goto?
> 
> There are a couple error paths which do not release their resources
> correctly.  Fix them.
> 
> Fixes: 9e01dc76be6a ("KVM: arm/arm64: arch_timer: Assign the phys timer on VHE systems")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>  arch/arm64/kvm/arch_timer.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/kvm/arch_timer.c b/arch/arm64/kvm/arch_timer.c
> index 05b022be885b..c2df8332d2bd 100644
> --- a/arch/arm64/kvm/arch_timer.c
> +++ b/arch/arm64/kvm/arch_timer.c
> @@ -1422,7 +1422,7 @@ int __init kvm_timer_hyp_init(bool has_gic)
>  		if (err) {
>  			kvm_err("kvm_arch_timer: can't request ptimer interrupt %d (%d)\n",
>  				host_ptimer_irq, err);
> -			return err;
> +			goto out_free_irq;
>  		}
>  
>  		if (has_gic) {
> @@ -1430,7 +1430,7 @@ int __init kvm_timer_hyp_init(bool has_gic)
>  						    kvm_get_running_vcpus());
>  			if (err) {
>  				kvm_err("kvm_arch_timer: error setting vcpu affinity\n");
> -				goto out_free_irq;
> +				goto out_free_ptimer_irq;
>  			}
>  		}
>  
> @@ -1443,6 +1443,10 @@ int __init kvm_timer_hyp_init(bool has_gic)
>  	}
>  
>  	return 0;
> +
> +out_free_ptimer_irq:
> +	if (info->physical_irq > 0)
> +		free_percpu_irq(host_ptimer_irq, kvm_get_running_vcpus());

nit: we shouldn't even jump to this label in the first place if
there was no ptimer irq to set up... Maybe just drop the condition?

>  out_free_irq:

I'd prefer this label be renamed 'out_free_vtimer_irq' to make it
unambiguous.

>  	free_percpu_irq(host_vtimer_irq, kvm_get_running_vcpus());
>  	return err;
> -- 
> 2.39.2
> 

-- 
Thanks,
Oliver
