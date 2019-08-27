Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9CE4E9E7E1
	for <lists+kernel-janitors@lfdr.de>; Tue, 27 Aug 2019 14:28:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729208AbfH0M2M (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Tue, 27 Aug 2019 08:28:12 -0400
Received: from mx1.redhat.com ([209.132.183.28]:36562 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726539AbfH0M2M (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 27 Aug 2019 08:28:12 -0400
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com [209.85.128.72])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id 620BA85540
        for <kernel-janitors@vger.kernel.org>; Tue, 27 Aug 2019 12:28:12 +0000 (UTC)
Received: by mail-wm1-f72.google.com with SMTP id u21so1009904wml.4
        for <kernel-janitors@vger.kernel.org>; Tue, 27 Aug 2019 05:28:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
         :message-id:mime-version;
        bh=/Q0E+7BYMqeSKrr8rrbLIrnvEziyebT5UAawMArD2vA=;
        b=SloWbTW1uQ+wzou6UAFiqL2RCoaii5gkQ/OagaNzCcmszxPyWiIjLCItnRywh1JTZu
         Tg8fgrGOFJWCdMBfGpNr7wMo0X+lh4sEBTdnXfFj/pYIlApj4BMc73KRxy2fugTywogd
         /9kD6UIEeY+FHxhgVhufGDoo9geqwFYiumsELukN3AYVM/ZKsrHslYZQJOfl3prY0dlt
         pJkMgbJfmSjZC0mWFhlPvLXfPGofCpe01wvsJmBjY6XOA6PZNXE7oeS9Zbvr/o2ziLDs
         ZOcAYL+zQPmQ3FVOMOQixvwMRUvgWdpU6aoNRteAQ07y7ybc+VbW7wN5a0zUmFx2zdj5
         4BSw==
X-Gm-Message-State: APjAAAXgOJlAQ86DgSCx8VwQ6KZPvQK1cByH9NwgAC1ueFGiY9JZiIqO
        pJleRlteOoPssQr3nd7xVdOJCn/C9HAjK2VY8o8iCWowtWEbydmaO6e1LEsnRl7yceAd/Xmrz3o
        DoVN2ZwrnWMW9UEokIKkBsa+VQx+5
X-Received: by 2002:adf:d187:: with SMTP id v7mr6382608wrc.33.1566908890792;
        Tue, 27 Aug 2019 05:28:10 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwA+4Ie02Oy9bFLyljo1OWGlyEeQPD6lPKKcFhAUegYtJfvEJDgLnQHVy2ReGyaTzUzjUQBPg==
X-Received: by 2002:adf:d187:: with SMTP id v7mr6382567wrc.33.1566908890575;
        Tue, 27 Aug 2019 05:28:10 -0700 (PDT)
Received: from vitty.brq.redhat.com (nat-pool-brq-t.redhat.com. [213.175.37.10])
        by smtp.gmail.com with ESMTPSA id l14sm19944936wrn.42.2019.08.27.05.28.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Aug 2019 05:28:09 -0700 (PDT)
From:   Vitaly Kuznetsov <vkuznets@redhat.com>
To:     Dan Carpenter <dan.carpenter@oracle.com>,
        Paolo Bonzini <pbonzini@redhat.com>
Cc:     Radim =?utf-8?B?S3LEjW3DocWZ?= <rkrcmar@redhat.com>,
        Sean Christopherson <sean.j.christopherson@intel.com>,
        Wanpeng Li <wanpengli@tencent.com>,
        Jim Mattson <jmattson@google.com>,
        Joerg Roedel <joro@8bytes.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org,
        kvm@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] x86: KVM: svm: Fix a check in nested_svm_vmrun()
In-Reply-To: <20190827093852.GA8443@mwanda>
References: <20190827093852.GA8443@mwanda>
Date:   Tue, 27 Aug 2019 14:28:09 +0200
Message-ID: <871rx6n67a.fsf@vitty.brq.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Dan Carpenter <dan.carpenter@oracle.com> writes:

> We refactored this code a bit and accidentally deleted the "-" character
> from "-EINVAL".  The kvm_vcpu_map() function never returns positive
> EINVAL.
>
> Fixes: c8e16b78c614 ("x86: KVM: svm: eliminate hardcoded RIP advancement from vmrun_interception()")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> From static analysis.  I don't really know the impact.
>
>
>  arch/x86/kvm/svm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/x86/kvm/svm.c b/arch/x86/kvm/svm.c
> index 1f220a85514f..ef646e22d1ab 100644
> --- a/arch/x86/kvm/svm.c
> +++ b/arch/x86/kvm/svm.c
> @@ -3598,7 +3598,7 @@ static int nested_svm_vmrun(struct vcpu_svm *svm)
>  	vmcb_gpa = svm->vmcb->save.rax;
>  
>  	ret = kvm_vcpu_map(&svm->vcpu, gpa_to_gfn(vmcb_gpa), &map);
> -	if (ret == EINVAL) {
> +	if (ret == -EINVAL) {
>  		kvm_inject_gp(&svm->vcpu, 0);
>  		return 1;
>  	} else if (ret) {

I was hoping that my patch was OK and Paolo screwed it upon commit but
no, it's the same in my local branch and I'm left without excuses :-)

Reviewed-by: Vitaly Kuznetsov <vkuznets@redhat.com>

-- 
Vitaly
