Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 49B6072E2A2
	for <lists+kernel-janitors@lfdr.de>; Tue, 13 Jun 2023 14:16:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242040AbjFMMQY (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Tue, 13 Jun 2023 08:16:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56610 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234823AbjFMMQY (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 13 Jun 2023 08:16:24 -0400
Received: from out-28.mta1.migadu.com (out-28.mta1.migadu.com [95.215.58.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 49A89E5
        for <kernel-janitors@vger.kernel.org>; Tue, 13 Jun 2023 05:16:22 -0700 (PDT)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
        t=1686658580;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=KSAEPk899fFIeec6HHaSoIZTwAJnWOrWf2em/FZAvE0=;
        b=ClpOLb+zqfw4RK3yxKIxW5y1+8cGDnRq77JdHFXZuP3cMEqwRLlSS+TD55Fnp8uHKO0zkK
        gRfVUhBm3yzUkAuRvhqxS4H8NRfaF0dWXFJXi5vwwvitbTX7xVyxpMAMXZpg2IbXmZvZZI
        xwShBVMuIUYeDtAj2xOcehf123cu2Z8=
From:   Oliver Upton <oliver.upton@linux.dev>
To:     Dan Carpenter <dan.carpenter@linaro.org>,
        Christoffer Dall <christoffer.dall@arm.com>
Cc:     Oliver Upton <oliver.upton@linux.dev>,
        Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>,
        kernel-janitors@vger.kernel.org, kvmarm@lists.linux.dev,
        Catalin Marinas <catalin.marinas@arm.com>,
        Zenghui Yu <yuzenghui@huawei.com>,
        James Morse <james.morse@arm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2] KVM: arm64: timers: Fix resource leaks in kvm_timer_hyp_init()
Date:   Tue, 13 Jun 2023 12:16:01 +0000
Message-ID: <168665854177.2681974.14382421414038699730.b4-ty@linux.dev>
In-Reply-To: <72fffc35-7669-40b1-9d14-113c43269cf3@kili.mountain>
References: <72fffc35-7669-40b1-9d14-113c43269cf3@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Tue, 13 Jun 2023 09:43:39 +0300, Dan Carpenter wrote:
> Smatch detected this bug:
>     arch/arm64/kvm/arch_timer.c:1425 kvm_timer_hyp_init()
>     warn: missing unwind goto?
> 
> There are two resources to be freed the vtimer and ptimer.  The
> line that Smatch complains about should free the vtimer first
> before returning and then after that cleanup code should free
> the ptimer.
> 
> [...]

Applied to kvmarm/next, thanks!

[1/1] KVM: arm64: timers: Fix resource leaks in kvm_timer_hyp_init()
      https://git.kernel.org/kvmarm/kvmarm/c/21e87daece5a

--
Best,
Oliver
