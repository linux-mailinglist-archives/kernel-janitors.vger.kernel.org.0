Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C935735CFA8
	for <lists+kernel-janitors@lfdr.de>; Mon, 12 Apr 2021 19:46:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243442AbhDLRrL (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Mon, 12 Apr 2021 13:47:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238523AbhDLRrL (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 12 Apr 2021 13:47:11 -0400
Received: from mail.skyhub.de (mail.skyhub.de [IPv6:2a01:4f8:190:11c2::b:1457])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D813C061574;
        Mon, 12 Apr 2021 10:46:53 -0700 (PDT)
Received: from zn.tnic (p200300ec2f0521005fff421e7b463cbd.dip0.t-ipconnect.de [IPv6:2003:ec:2f05:2100:5fff:421e:7b46:3cbd])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 946C81EC01B5;
        Mon, 12 Apr 2021 19:46:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
        t=1618249610;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
        bh=qolHn0VJZ9fwmPKy18Rv5TlPWmvT6PVT6v0+9B+RFKM=;
        b=AQXfcjTTeN1wHzqrsySbsayXL6Ef9VA/sOKeXI/xz0RrYlLD3r8Ds4nX7E7cVzZpyuFP0k
        ZYSQ4ZrwC5FRuaPvEI/bD0zngsty2Lvm3ybjLtQCW9B8wCNB+7xyel7VOI9/z7W+1Z1hpF
        FLFhSr036pVYCZLOzUcXljYqGGC3GMg=
Date:   Mon, 12 Apr 2021 19:46:49 +0200
From:   Borislav Petkov <bp@alien8.de>
To:     Wei Yongjun <weiyongjun1@huawei.com>
Cc:     Jarkko Sakkinen <jarkko@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>,
        Sean Christopherson <sean.j.christopherson@intel.com>,
        x86@kernel.org, linux-sgx@vger.kernel.org,
        kernel-janitors@vger.kernel.org, Hulk Robot <hulkci@huawei.com>
Subject: Re: [PATCH -next] x86/sgx: Make symbol 'sgx_vepc_vm_ops' static
Message-ID: <20210412174649.GG24283@zn.tnic>
References: <20210412160023.193850-1-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210412160023.193850-1-weiyongjun1@huawei.com>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Mon, Apr 12, 2021 at 04:00:23PM +0000, Wei Yongjun wrote:
> The sparse tool complains as follows:
> 
> arch/x86/kernel/cpu/sgx/virt.c:95:35: warning:
>  symbol 'sgx_vepc_vm_ops' was not declared. Should it be static?
> 
> This symbol is not used outside of virt.c, so this
> commit marks it static.

For the future:

Avoid having "This patch" or "This commit" in the commit message. It is
tautologically useless.

Also, do

$ git grep 'This patch' Documentation/process

for more details.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
