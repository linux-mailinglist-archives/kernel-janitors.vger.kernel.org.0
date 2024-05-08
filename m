Return-Path: <kernel-janitors+bounces-3006-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 747E28BF50F
	for <lists+kernel-janitors@lfdr.de>; Wed,  8 May 2024 05:49:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 90D331C22BF9
	for <lists+kernel-janitors@lfdr.de>; Wed,  8 May 2024 03:49:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E46D714AA3;
	Wed,  8 May 2024 03:49:28 +0000 (UTC)
X-Original-To: kernel-janitors@vger.kernel.org
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61258AD5B;
	Wed,  8 May 2024 03:49:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715140168; cv=none; b=C9eMha8XxVIadA2OaziosOWqvJjZsoolbD72eCm2Pfa2RaN1hogJ9y/ws7JZfjQ4hdYky7jw9dEc+iz1e752e6lhXk06mSifg1Wjl6v4pFUgVMOW7MydUxRDSu7WcGLf8aieOSeeRPOs9YQ90BFPq0Rd1XLDgAvKyl96m+0DLiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715140168; c=relaxed/simple;
	bh=7GxyO2bLX5sQWe1IVy7frJduJI83AxcYRZpzlC+vU6s=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=SM0Ihh3oKSf/Ral276qyVUrxte9gCH9NBOdDt3SZziRNcbZY3I7382Sqh8B312mtgpWcqZgCKXiJFEdxJWrQuKmQHROHFeL1KIgMFH/gdp6zsNVwzK9Tn52p+XJ9Xm6wtS6F7XN+vHwzVanNRXB6LvvWiwhdJVDPpwRH+pkiIOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.20.42.173])
	by gateway (Coremail) with SMTP id _____8CxJvA99jpmpTIJAA--.24600S3;
	Wed, 08 May 2024 11:49:17 +0800 (CST)
Received: from [10.20.42.173] (unknown [10.20.42.173])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8DxtFY69jpmlCIVAA--.24508S3;
	Wed, 08 May 2024 11:49:16 +0800 (CST)
Subject: Re: [PATCH v5] LoongArch: KVM: Add PMU support
To: Song Gao <gaosong@loongson.cn>, Markus.Elfring@web.de
Cc: pbonzini@redhat.com, zhaotianrui@loongson.cn, chenhuacai@kernel.org,
 kernel@xen0n.name, loongarch@lists.linux.dev, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org
References: <20240507120140.3119714-1-gaosong@loongson.cn>
From: maobibo <maobibo@loongson.cn>
Message-ID: <bcb7baef-6042-8e3f-dda5-69084274a0de@loongson.cn>
Date: Wed, 8 May 2024 11:49:12 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20240507120140.3119714-1-gaosong@loongson.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8DxtFY69jpmlCIVAA--.24508S3
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBj9fXoW3uF43uw1DurWrtFWxAFWfCrX_yoW8Gw1kZo
	Wxtan29rWrJw43Aw4DKr12qayUZrW8uw4kAFy5Awn5u3W7J34YgrW8Gw4rtr13WF98ur17
	ua42qa1vgFyxt3WDl-sFpf9Il3svdjkaLaAFLSUrUUUUbb8apTn2vfkv8UJUUUU8wcxFpf
	9Il3svdxBIdaVrn0xqx4xG64xvF2IEw4CE5I8CrVC2j2Jv73VFW2AGmfu7bjvjm3AaLaJ3
	UjIYCTnIWjp_UUUY47kC6x804xWl14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI
	8IcIk0rVWrJVCq3wAFIxvE14AKwVWUXVWUAwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xG
	Y2AK021l84ACjcxK6xIIjxv20xvE14v26r1I6r4UM28EF7xvwVC0I7IYx2IY6xkF7I0E14
	v26r4j6F4UM28EF7xvwVC2z280aVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx
	1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1Y6r17McIj6I8E87Iv
	67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7I2V7IY0VAS07
	AlzVAYIcxG8wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02
	F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GF
	ylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7Cj
	xVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r
	1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU8zw
	Z7UUUUU==

Reviewed-by: Bibo Mao <maobibo@loongson.cn>

On 2024/5/7 下午8:01, Song Gao wrote:
> On LoongArch, the host and guest have their own PMU CSRs registers
> and they share PMU hardware resources. A set of PMU CSRs consists of
> a CTRL register and a CNTR register. We can set which PMU CSRs are used
> by the guest by writing to the GCFG register [24: 26] bits.
> 
> On KVM side:
> - we save the host PMU CSRs into structure kvm_context.
> - If the host supports the PMU feature.
>    - When entering guest mode. we save the host PMU CSRs and restore the guest PMU CSRs.
>    - When exiting guest mode, we save the guest PMU CSRs and restore the host PMU CSRs.
> 
> Signed-off-by: Song Gao <gaosong@loongson.cn>
> ---
> V5:
>    - When restoring the PMU context, resotre the CNTR register before the CTRL register.
>    - Link to V4: https://lore.kernel.org/all/20240429093401.2612430-1-gaosong@loongson.cn/
> 
> V4:
>    - Use the macro kvm_read_clear_hw_gcsr to optimize the code
>      and remove redundant code.
>    - Link to V3: https://lore.kernel.org/all/20240424091813.1471440-1-gaosong@loongson.cn/
> 
> V3:
>    - When saving the PMU context, clear the CTRL register
>       before reading the CNTR register.
>    - Put kvm_lose_pmu() in kvm_handler_exit().
>    - Link to V2: https://lore.kernel.org/all/20240417065236.500011-1-gaosong@loongson.cn/
> 
> V2:
>    - Add new vcpu->request flag KVM_REQ_PMU. If we use PMU,
>      We need to set this flag;
>    - Add kvm_check_pmu() to kvm_pre_enter_guest();
>    - On _kvm_setcsr(), after modifying the PMU CSR register value,
>       if we use PMU, we need to set KVM_REQ_PMU.
>    - Link to V1: https://lore.kernel.org/all/20240410095812.2943706-1-gaosong@loongson.cn/
> 
>   arch/loongarch/include/asm/kvm_csr.h   |   7 +
>   arch/loongarch/include/asm/kvm_host.h  |  20 +++
>   arch/loongarch/include/asm/loongarch.h |   1 +
>   arch/loongarch/kvm/exit.c              |   8 ++
>   arch/loongarch/kvm/vcpu.c              | 173 ++++++++++++++++++++++++-
>   5 files changed, 207 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/loongarch/include/asm/kvm_csr.h b/arch/loongarch/include/asm/kvm_csr.h
> index 724ca8b7b401..0a52f115a87e 100644
> --- a/arch/loongarch/include/asm/kvm_csr.h
> +++ b/arch/loongarch/include/asm/kvm_csr.h
> @@ -30,6 +30,7 @@
>   		: [val] "+r" (__v)				\
>   		: [reg] "i" (csr)				\
>   		: "memory");					\
> +	__v;							\
>   })
>   
>   #define gcsr_xchg(v, m, csr)					\
> @@ -180,6 +181,7 @@ __BUILD_GCSR_OP(tlbidx)
>   
>   #define kvm_save_hw_gcsr(csr, gid)	(csr->csrs[gid] = gcsr_read(gid))
>   #define kvm_restore_hw_gcsr(csr, gid)	(gcsr_write(csr->csrs[gid], gid))
> +#define kvm_read_clear_hw_gcsr(csr, gid)	(csr->csrs[gid] = gcsr_write(0, gid))
>   
>   int kvm_emu_iocsr(larch_inst inst, struct kvm_run *run, struct kvm_vcpu *vcpu);
>   
> @@ -208,4 +210,9 @@ static __always_inline void kvm_change_sw_gcsr(struct loongarch_csrs *csr,
>   	csr->csrs[gid] |= val & _mask;
>   }
>   
> +#define KVM_PMU_EVENT_ENABLED	(CSR_PERFCTRL_PLV0 |		\
> +					CSR_PERFCTRL_PLV1 |	\
> +					CSR_PERFCTRL_PLV2 |	\
> +					CSR_PERFCTRL_PLV3)
> +
>   #endif	/* __ASM_LOONGARCH_KVM_CSR_H__ */
> diff --git a/arch/loongarch/include/asm/kvm_host.h b/arch/loongarch/include/asm/kvm_host.h
> index 2d62f7b0d377..e1d64e26e7cb 100644
> --- a/arch/loongarch/include/asm/kvm_host.h
> +++ b/arch/loongarch/include/asm/kvm_host.h
> @@ -51,9 +51,14 @@ struct kvm_arch_memory_slot {
>   	unsigned long flags;
>   };
>   
> +#define KVM_REQ_PMU			KVM_ARCH_REQ(0)
> +#define HOST_MAX_PMNUM			16
>   struct kvm_context {
>   	unsigned long vpid_cache;
>   	struct kvm_vcpu *last_vcpu;
> +	/* Save host pmu csr */
> +	u64 perf_ctrl[HOST_MAX_PMNUM];
> +	u64 perf_cntr[HOST_MAX_PMNUM];
>   };
>   
>   struct kvm_world_switch {
> @@ -99,6 +104,8 @@ enum emulation_result {
>   #define KVM_LARCH_LASX		(0x1 << 2)
>   #define KVM_LARCH_SWCSR_LATEST	(0x1 << 3)
>   #define KVM_LARCH_HWCSR_USABLE	(0x1 << 4)
> +#define KVM_GUEST_PMU_ENABLE	(0x1 << 5)
> +#define KVM_GUEST_PMU_ACTIVE	(0x1 << 6)
>   
>   struct kvm_vcpu_arch {
>   	/*
> @@ -136,6 +143,9 @@ struct kvm_vcpu_arch {
>   	/* CSR state */
>   	struct loongarch_csrs *csr;
>   
> +	/* Guest max PMU CSR id */
> +	int max_pmu_csrid;
> +
>   	/* GPR used as IO source/target */
>   	u32 io_gpr;
>   
> @@ -195,6 +205,16 @@ static inline bool kvm_guest_has_lasx(struct kvm_vcpu_arch *arch)
>   	return arch->cpucfg[2] & CPUCFG2_LASX;
>   }
>   
> +static inline bool kvm_guest_has_pmu(struct kvm_vcpu_arch *arch)
> +{
> +	return arch->cpucfg[LOONGARCH_CPUCFG6] & CPUCFG6_PMP;
> +}
> +
> +static inline int kvm_get_pmu_num(struct kvm_vcpu_arch *arch)
> +{
> +	return (arch->cpucfg[LOONGARCH_CPUCFG6] & CPUCFG6_PMNUM) >> CPUCFG6_PMNUM_SHIFT;
> +}
> +
>   /* Debug: dump vcpu state */
>   int kvm_arch_vcpu_dump_regs(struct kvm_vcpu *vcpu);
>   
> diff --git a/arch/loongarch/include/asm/loongarch.h b/arch/loongarch/include/asm/loongarch.h
> index 46366e783c84..644380b6ebec 100644
> --- a/arch/loongarch/include/asm/loongarch.h
> +++ b/arch/loongarch/include/asm/loongarch.h
> @@ -119,6 +119,7 @@
>   #define  CPUCFG6_PMP			BIT(0)
>   #define  CPUCFG6_PAMVER			GENMASK(3, 1)
>   #define  CPUCFG6_PMNUM			GENMASK(7, 4)
> +#define  CPUCFG6_PMNUM_SHIFT		4
>   #define  CPUCFG6_PMBITS			GENMASK(13, 8)
>   #define  CPUCFG6_UPM			BIT(14)
>   
> diff --git a/arch/loongarch/kvm/exit.c b/arch/loongarch/kvm/exit.c
> index ed1d89d53e2e..636cd1500135 100644
> --- a/arch/loongarch/kvm/exit.c
> +++ b/arch/loongarch/kvm/exit.c
> @@ -83,6 +83,14 @@ static int kvm_handle_csr(struct kvm_vcpu *vcpu, larch_inst inst)
>   	rj = inst.reg2csr_format.rj;
>   	csrid = inst.reg2csr_format.csr;
>   
> +	if (csrid >= LOONGARCH_CSR_PERFCTRL0 && csrid <= vcpu->arch.max_pmu_csrid) {
> +		if (kvm_guest_has_pmu(&vcpu->arch)) {
> +			vcpu->arch.pc -= 4;
> +			kvm_make_request(KVM_REQ_PMU, vcpu);
> +			return EMULATE_DONE;
> +		}
> +	}
> +
>   	/* Process CSR ops */
>   	switch (rj) {
>   	case 0: /* process csrrd */
> diff --git a/arch/loongarch/kvm/vcpu.c b/arch/loongarch/kvm/vcpu.c
> index 3a8779065f73..df7ede36755f 100644
> --- a/arch/loongarch/kvm/vcpu.c
> +++ b/arch/loongarch/kvm/vcpu.c
> @@ -30,6 +30,131 @@ const struct kvm_stats_header kvm_vcpu_stats_header = {
>   		       sizeof(kvm_vcpu_stats_desc),
>   };
>   
> +static inline void kvm_save_host_pmu(struct kvm_vcpu *vcpu)
> +{
> +	struct kvm_context *context;
> +
> +	context = this_cpu_ptr(vcpu->kvm->arch.vmcs);
> +	context->perf_ctrl[0] = write_csr_perfctrl0(0);
> +	context->perf_ctrl[1] = write_csr_perfctrl1(0);
> +	context->perf_ctrl[2] = write_csr_perfctrl2(0);
> +	context->perf_ctrl[3] = write_csr_perfctrl3(0);
> +	context->perf_cntr[0] = read_csr_perfcntr0();
> +	context->perf_cntr[1] = read_csr_perfcntr1();
> +	context->perf_cntr[2] = read_csr_perfcntr2();
> +	context->perf_cntr[3] = read_csr_perfcntr3();
> +}
> +
> +static inline void kvm_restore_host_pmu(struct kvm_vcpu *vcpu)
> +{
> +	struct kvm_context *context;
> +
> +	context = this_cpu_ptr(vcpu->kvm->arch.vmcs);
> +	write_csr_perfcntr0(context->perf_cntr[0]);
> +	write_csr_perfcntr1(context->perf_cntr[1]);
> +	write_csr_perfcntr2(context->perf_cntr[2]);
> +	write_csr_perfcntr3(context->perf_cntr[3]);
> +	write_csr_perfctrl0(context->perf_ctrl[0]);
> +	write_csr_perfctrl1(context->perf_ctrl[1]);
> +	write_csr_perfctrl2(context->perf_ctrl[2]);
> +	write_csr_perfctrl3(context->perf_ctrl[3]);
> +}
> +
> +
> +static inline void kvm_save_guest_pmu(struct kvm_vcpu *vcpu)
> +{
> +	struct loongarch_csrs *csr = vcpu->arch.csr;
> +
> +	kvm_read_clear_hw_gcsr(csr, LOONGARCH_CSR_PERFCTRL0);
> +	kvm_read_clear_hw_gcsr(csr, LOONGARCH_CSR_PERFCTRL1);
> +	kvm_read_clear_hw_gcsr(csr, LOONGARCH_CSR_PERFCTRL2);
> +	kvm_read_clear_hw_gcsr(csr, LOONGARCH_CSR_PERFCTRL3);
> +	kvm_save_hw_gcsr(csr, LOONGARCH_CSR_PERFCNTR0);
> +	kvm_save_hw_gcsr(csr, LOONGARCH_CSR_PERFCNTR1);
> +	kvm_save_hw_gcsr(csr, LOONGARCH_CSR_PERFCNTR2);
> +	kvm_save_hw_gcsr(csr, LOONGARCH_CSR_PERFCNTR3);
> +}
> +
> +static inline void kvm_restore_guest_pmu(struct kvm_vcpu *vcpu)
> +{
> +	struct loongarch_csrs *csr = vcpu->arch.csr;
> +
> +	kvm_restore_hw_gcsr(csr, LOONGARCH_CSR_PERFCNTR0);
> +	kvm_restore_hw_gcsr(csr, LOONGARCH_CSR_PERFCNTR1);
> +	kvm_restore_hw_gcsr(csr, LOONGARCH_CSR_PERFCNTR2);
> +	kvm_restore_hw_gcsr(csr, LOONGARCH_CSR_PERFCNTR3);
> +	kvm_restore_hw_gcsr(csr, LOONGARCH_CSR_PERFCTRL0);
> +	kvm_restore_hw_gcsr(csr, LOONGARCH_CSR_PERFCTRL1);
> +	kvm_restore_hw_gcsr(csr, LOONGARCH_CSR_PERFCTRL2);
> +	kvm_restore_hw_gcsr(csr, LOONGARCH_CSR_PERFCTRL3);
> +}
> +
> +static void kvm_lose_pmu(struct kvm_vcpu *vcpu)
> +{
> +	unsigned long val;
> +	struct loongarch_csrs *csr = vcpu->arch.csr;
> +
> +	if (!(vcpu->arch.aux_inuse & KVM_GUEST_PMU_ENABLE))
> +		return;
> +	if (!(vcpu->arch.aux_inuse & KVM_GUEST_PMU_ACTIVE))
> +		return;
> +
> +	kvm_save_guest_pmu(vcpu);
> +	/* Disable pmu access from guest */
> +	write_csr_gcfg(read_csr_gcfg() & ~CSR_GCFG_GPERF);
> +
> +	/*
> +	 * Clear KVM_GUEST_PMU_ENABLE if the guest is not using PMU CSRs
> +	 * when exiting the guest, so that the next time trap into the guest.
> +	 * we don't need to deal with PMU CSRs contexts.
> +	 */
> +	val = kvm_read_sw_gcsr(csr, LOONGARCH_CSR_PERFCTRL0);
> +	val |= kvm_read_sw_gcsr(csr, LOONGARCH_CSR_PERFCTRL1);
> +	val |= kvm_read_sw_gcsr(csr, LOONGARCH_CSR_PERFCTRL2);
> +	val |= kvm_read_sw_gcsr(csr, LOONGARCH_CSR_PERFCTRL3);
> +	if (!(val & KVM_PMU_EVENT_ENABLED))
> +		vcpu->arch.aux_inuse &= ~KVM_GUEST_PMU_ENABLE;
> +	kvm_restore_host_pmu(vcpu);
> +
> +	/* KVM_GUEST_PMU_ACTIVE needs to be cleared when exiting the guest */
> +	vcpu->arch.aux_inuse &= ~KVM_GUEST_PMU_ACTIVE;
> +}
> +
> +static void kvm_own_pmu(struct kvm_vcpu *vcpu)
> +{
> +	unsigned long val;
> +
> +	kvm_save_host_pmu(vcpu);
> +	/* Set PM0-PM(num) to guest */
> +	val = read_csr_gcfg() & ~CSR_GCFG_GPERF;
> +	val |= (kvm_get_pmu_num(&vcpu->arch) + 1) << CSR_GCFG_GPERF_SHIFT;
> +	write_csr_gcfg(val);
> +	kvm_restore_guest_pmu(vcpu);
> +}
> +
> +static void kvm_restore_pmu(struct kvm_vcpu *vcpu)
> +{
> +	if (!(vcpu->arch.aux_inuse & KVM_GUEST_PMU_ENABLE))
> +		return;
> +
> +	kvm_make_request(KVM_REQ_PMU, vcpu);
> +}
> +
> +static void kvm_check_pmu(struct kvm_vcpu *vcpu)
> +{
> +	if (!kvm_check_request(KVM_REQ_PMU, vcpu))
> +		return;
> +
> +	kvm_own_pmu(vcpu);
> +
> +	/*
> +	 * Set KVM_GUEST PMU_ENABLE and GUEST_PMU_ACTIVE
> +	 * when guest has KVM_REQ_PMU request.
> +	 */
> +	vcpu->arch.aux_inuse |= KVM_GUEST_PMU_ENABLE;
> +	vcpu->arch.aux_inuse |= KVM_GUEST_PMU_ACTIVE;
> +}
> +
>   /*
>    * kvm_check_requests - check and handle pending vCPU requests
>    *
> @@ -100,6 +225,7 @@ static int kvm_pre_enter_guest(struct kvm_vcpu *vcpu)
>   		/* Make sure the vcpu mode has been written */
>   		smp_store_mb(vcpu->mode, IN_GUEST_MODE);
>   		kvm_check_vpid(vcpu);
> +		kvm_check_pmu(vcpu);
>   		vcpu->arch.host_eentry = csr_read64(LOONGARCH_CSR_EENTRY);
>   		/* Clear KVM_LARCH_SWCSR_LATEST as CSR will change when enter guest */
>   		vcpu->arch.aux_inuse &= ~KVM_LARCH_SWCSR_LATEST;
> @@ -130,6 +256,8 @@ static int kvm_handle_exit(struct kvm_run *run, struct kvm_vcpu *vcpu)
>   	/* Set a default exit reason */
>   	run->exit_reason = KVM_EXIT_UNKNOWN;
>   
> +	kvm_lose_pmu(vcpu);
> +
>   	guest_timing_exit_irqoff();
>   	guest_state_exit_irqoff();
>   	local_irq_enable();
> @@ -295,6 +423,21 @@ static int _kvm_setcsr(struct kvm_vcpu *vcpu, unsigned int id, u64 val)
>   
>   	kvm_write_sw_gcsr(csr, id, val);
>   
> +	/*
> +	 * After modifying the PMU CSR register value of the vcpu.
> +	 * If the PMU CSRs are used, we need to set KVM_REQ_PMU.
> +	 */
> +	if (id >= LOONGARCH_CSR_PERFCTRL0 && id <= LOONGARCH_CSR_PERFCNTR3) {
> +		unsigned long val;
> +
> +		val = kvm_read_sw_gcsr(csr, LOONGARCH_CSR_PERFCTRL0);
> +		val |= kvm_read_sw_gcsr(csr, LOONGARCH_CSR_PERFCTRL1);
> +		val |= kvm_read_sw_gcsr(csr, LOONGARCH_CSR_PERFCTRL2);
> +		val |= kvm_read_sw_gcsr(csr, LOONGARCH_CSR_PERFCTRL3);
> +		if (val & KVM_PMU_EVENT_ENABLED)
> +			kvm_make_request(KVM_REQ_PMU, vcpu);
> +	}
> +
>   	return ret;
>   }
>   
> @@ -333,6 +476,12 @@ static int _kvm_get_cpucfg_mask(int id, u64 *v)
>   	case LOONGARCH_CPUCFG5:
>   		*v = GENMASK(31, 0);
>   		return 0;
> +	case LOONGARCH_CPUCFG6:
> +		if (cpu_has_pmp)
> +			*v = GENMASK(14, 0);
> +		else
> +			*v = 0;
> +		return 0;
>   	case LOONGARCH_CPUCFG16:
>   		*v = GENMASK(16, 0);
>   		return 0;
> @@ -351,7 +500,7 @@ static int _kvm_get_cpucfg_mask(int id, u64 *v)
>   
>   static int kvm_check_cpucfg(int id, u64 val)
>   {
> -	int ret;
> +	int ret, host;
>   	u64 mask = 0;
>   
>   	ret = _kvm_get_cpucfg_mask(id, &mask);
> @@ -377,6 +526,18 @@ static int kvm_check_cpucfg(int id, u64 val)
>   			/* LASX architecturally implies LSX and FP but val does not satisfy that */
>   			return -EINVAL;
>   		return 0;
> +	case LOONGARCH_CPUCFG6:
> +		if (val & CPUCFG6_PMP) {
> +			host = read_cpucfg(LOONGARCH_CPUCFG6);
> +			if ((val & CPUCFG6_PMBITS) != (host & CPUCFG6_PMBITS))
> +				/* Guest pmbits must be the same with host */
> +				return -EINVAL;
> +			if ((val & CPUCFG6_PMNUM) > (host & CPUCFG6_PMNUM))
> +				return -EINVAL;
> +			if ((val & CPUCFG6_UPM) && !(host & CPUCFG6_UPM))
> +				return -EINVAL;
> +		}
> +		return 0;
>   	default:
>   		/*
>   		 * Values for the other CPUCFG IDs are not being further validated
> @@ -459,6 +620,10 @@ static int kvm_set_one_reg(struct kvm_vcpu *vcpu,
>   		if (ret)
>   			break;
>   		vcpu->arch.cpucfg[id] = (u32)v;
> +		if (id == LOONGARCH_CPUCFG6) {
> +			vcpu->arch.max_pmu_csrid = LOONGARCH_CSR_PERFCTRL0 +
> +							2 * kvm_get_pmu_num(&vcpu->arch) + 1;
> +		}
>   		break;
>   	case KVM_REG_LOONGARCH_KVM:
>   		switch (reg->id) {
> @@ -552,7 +717,8 @@ static int kvm_loongarch_cpucfg_has_attr(struct kvm_vcpu *vcpu,
>   					 struct kvm_device_attr *attr)
>   {
>   	switch (attr->attr) {
> -	case 2:
> +	case LOONGARCH_CPUCFG2:
> +	case LOONGARCH_CPUCFG6:
>   		return 0;
>   	default:
>   		return -ENXIO;
> @@ -982,6 +1148,9 @@ static int _kvm_vcpu_load(struct kvm_vcpu *vcpu, int cpu)
>   	/* Control guest page CCA attribute */
>   	change_csr_gcfg(CSR_GCFG_MATC_MASK, CSR_GCFG_MATC_ROOT);
>   
> +	/* Restore hardware PMU CSRs */
> +	kvm_restore_pmu(vcpu);
> +
>   	/* Don't bother restoring registers multiple times unless necessary */
>   	if (vcpu->arch.aux_inuse & KVM_LARCH_HWCSR_USABLE)
>   		return 0;
> 


