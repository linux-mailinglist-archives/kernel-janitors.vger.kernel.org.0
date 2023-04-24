Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 81BEA6E7748
	for <lists+kernel-janitors@lfdr.de>; Wed, 19 Apr 2023 12:18:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232416AbjDSKR6 (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Wed, 19 Apr 2023 06:17:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37622 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231846AbjDSKR5 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 19 Apr 2023 06:17:57 -0400
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id CB0B95240
        for <kernel-janitors@vger.kernel.org>; Wed, 19 Apr 2023 03:17:56 -0700 (PDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 55BE0106F;
        Wed, 19 Apr 2023 03:18:40 -0700 (PDT)
Received: from [10.57.20.93] (unknown [10.57.20.93])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BFBE23F6C4;
        Wed, 19 Apr 2023 03:17:53 -0700 (PDT)
Message-ID: <5ab50a0f-fb75-7435-4b59-98adcc223dfd@arm.com>
Date:   Wed, 19 Apr 2023 11:17:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v2] KVM: arm64: Fix buffer overflow in
 kvm_arm_set_fw_reg()
Content-Language: en-GB
To:     Dan Carpenter <dan.carpenter@linaro.org>,
        Andre Przywara <andre.przywara@arm.com>
Cc:     Oliver Upton <oliver.upton@linux.dev>,
        James Morse <james.morse@arm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Zenghui Yu <yuzenghui@huawei.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Eric Auger <eric.auger@redhat.com>,
        linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
        kernel-janitors@vger.kernel.org
References: <4efbab8c-640f-43b2-8ac6-6d68e08280fe@kili.mountain>
From:   Steven Price <steven.price@arm.com>
In-Reply-To: <4efbab8c-640f-43b2-8ac6-6d68e08280fe@kili.mountain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.8 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On 19/04/2023 11:16, Dan Carpenter wrote:
> The KVM_REG_SIZE() comes from the ioctl and it can be a power of two
> between 0-32768 but if it is more than sizeof(long) this will corrupt
> memory.
> 
> Fixes: 99adb567632b ("KVM: arm/arm64: Add save/restore support for firmware workaround state")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

Reviewed-by: Steven Price <steven.price@arm.com>

Thanks,

Steve

> ---
> v2: The original patch was okay but checking for != sizeof(val) is
>     stricter and more Obviously Correct[tm].  Return -ENOENT instead of
>     -EINVAL in case future ioctls are added which take a different size.
> 
>  arch/arm64/kvm/hypercalls.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/arch/arm64/kvm/hypercalls.c b/arch/arm64/kvm/hypercalls.c
> index 2e16fc7b31bf..7fb4df0456de 100644
> --- a/arch/arm64/kvm/hypercalls.c
> +++ b/arch/arm64/kvm/hypercalls.c
> @@ -544,6 +544,8 @@ int kvm_arm_set_fw_reg(struct kvm_vcpu *vcpu, const struct kvm_one_reg *reg)
>  	u64 val;
>  	int wa_level;
>  
> +	if (KVM_REG_SIZE(reg->id) != sizeof(val))
> +		return -ENOENT;
>  	if (copy_from_user(&val, uaddr, KVM_REG_SIZE(reg->id)))
>  		return -EFAULT;
>  

