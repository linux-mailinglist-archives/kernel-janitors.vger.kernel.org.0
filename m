Return-Path: <kernel-janitors+bounces-2150-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A1119875A1E
	for <lists+kernel-janitors@lfdr.de>; Thu,  7 Mar 2024 23:17:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EE917B20E06
	for <lists+kernel-janitors@lfdr.de>; Thu,  7 Mar 2024 22:17:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2858B13E7E7;
	Thu,  7 Mar 2024 22:17:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="lF9P/7XK"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from out-171.mta0.migadu.com (out-171.mta0.migadu.com [91.218.175.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B4FA12D744
	for <kernel-janitors@vger.kernel.org>; Thu,  7 Mar 2024 22:17:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709849865; cv=none; b=PX9odfFCx4mR3voV0vyie9L/onXAeaUwLa4TdkU1zOevdNw1u23nKbhWqacc/ali1kiU/oBcdf3NLf3QDpRoWnvndLHRU+2iDy/TK5FJSv8KjECtk8wUgME07B4Crtmkvy9Vm0f4Y9Oc/YZC672VIZ/dPcNjlt4nUQSdPXBF0Jw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709849865; c=relaxed/simple;
	bh=mcVv85Y4EzW+ezvYao5rOnNjIVcYIVFYdvdOhYlj1TM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=vGsWY5xQILcuwmLSqPQI8oJ8+yagoHqWUOzJL2fJdMNRrXtDNf5yvr5E3tbJq983cmMDgIAAk6jwAXBw1ChbMQI87vdeOo+hMJea9QBVBdUXK/Rc7BIaeS0DPNkMgNUV2YK3Vl4jg2wTUjY8ZAoxZj9AU9UOlCP0ZTRgX1kxYhQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=lF9P/7XK; arc=none smtp.client-ip=91.218.175.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Date: Thu, 7 Mar 2024 22:17:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1709849860;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vYSZIyK2isZFgtLWNp5tqo04dM1Ssq7AMjL+0jjmigk=;
	b=lF9P/7XKffvo6S5bw+4ysZaBIjZG/dHK8JhCDJA2mGMWzAK2oaEfpUzw7dj97wwGyTXJk0
	wC8kkhkP8rXTBQYQT+Ary6L3NMfXgHBNmuAleTwon/jqaZKHFBd56XfDWnar0Iu4xK/HZO
	2HBOd4bd6ljj8WvXppsSnlg3XzPOvPY=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Oliver Upton <oliver.upton@linux.dev>
To: Colin Ian King <colin.i.king@gmail.com>
Cc: Marc Zyngier <maz@kernel.org>, James Morse <james.morse@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	kvm@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org, kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH][next] KVM: selftests: Fix spelling mistake "trigged" ->
 "triggered"
Message-ID: <Zeo8_ulDb4wYI_rO@linux.dev>
References: <20240307081951.1954830-1-colin.i.king@gmail.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240307081951.1954830-1-colin.i.king@gmail.com>
X-Migadu-Flow: FLOW_OUT

Thanks for the fix Colin. Paolo/Anup, up to you how you want to play it,
I see the 6.9 PR is already out for riscv.

Acked-by: Oliver Upton <oliver.upton@linux.dev>

On Thu, Mar 07, 2024 at 08:19:51AM +0000, Colin Ian King wrote:
> There are spelling mistakes in __GUEST_ASSERT messages. Fix them.
> 
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
> ---
>  tools/testing/selftests/kvm/aarch64/arch_timer.c | 2 +-
>  tools/testing/selftests/kvm/riscv/arch_timer.c   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/tools/testing/selftests/kvm/aarch64/arch_timer.c b/tools/testing/selftests/kvm/aarch64/arch_timer.c
> index ddba2c2fb5de..16ac74d07d68 100644
> --- a/tools/testing/selftests/kvm/aarch64/arch_timer.c
> +++ b/tools/testing/selftests/kvm/aarch64/arch_timer.c
> @@ -136,7 +136,7 @@ static void guest_run_stage(struct test_vcpu_shared_data *shared_data,
>  		irq_iter = READ_ONCE(shared_data->nr_iter);
>  		__GUEST_ASSERT(config_iter + 1 == irq_iter,
>  				"config_iter + 1 = 0x%lx, irq_iter = 0x%lx.\n"
> -				"  Guest timer interrupt was not trigged within the specified\n"
> +				"  Guest timer interrupt was not triggered within the specified\n"
>  				"  interval, try to increase the error margin by [-e] option.\n",
>  				config_iter + 1, irq_iter);
>  	}
> diff --git a/tools/testing/selftests/kvm/riscv/arch_timer.c b/tools/testing/selftests/kvm/riscv/arch_timer.c
> index e22848f747c0..0f9cabd99fd4 100644
> --- a/tools/testing/selftests/kvm/riscv/arch_timer.c
> +++ b/tools/testing/selftests/kvm/riscv/arch_timer.c
> @@ -60,7 +60,7 @@ static void guest_run(struct test_vcpu_shared_data *shared_data)
>  		irq_iter = READ_ONCE(shared_data->nr_iter);
>  		__GUEST_ASSERT(config_iter + 1 == irq_iter,
>  				"config_iter + 1 = 0x%x, irq_iter = 0x%x.\n"
> -				"  Guest timer interrupt was not trigged within the specified\n"
> +				"  Guest timer interrupt was not triggered within the specified\n"
>  				"  interval, try to increase the error margin by [-e] option.\n",
>  				config_iter + 1, irq_iter);
>  	}
> -- 
> 2.39.2
> 

-- 
Thanks,
Oliver

