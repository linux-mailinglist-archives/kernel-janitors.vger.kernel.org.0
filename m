Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 654461AAB1A
	for <lists+kernel-janitors@lfdr.de>; Wed, 15 Apr 2020 17:01:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S371091AbgDOO44 (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Wed, 15 Apr 2020 10:56:56 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:49083 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S371187AbgDOO4w (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 15 Apr 2020 10:56:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1586962611;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=4LhKDhow9t4woo07RzJCC9BA6orwImyFYcMaIKVNQYo=;
        b=TzqRs97VvVnPF1S/AUh13ioMLeQ+2iWNapgWA/qMtVTQogIHTWlYRMayXL1P/Azjqrc+z9
        bkLB6JVbNaFo7UEdw7jpC9/n071MGzLyBd6/4FwsOhf186JuOlQ9AAUv34oDfvvehTTE0k
        b/UvUI3cmZWVbpRHPbDoRA+RwaawNZI=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-380-FrvKJ_B3MxyF0ptGoaas7w-1; Wed, 15 Apr 2020 10:56:49 -0400
X-MC-Unique: FrvKJ_B3MxyF0ptGoaas7w-1
Received: by mail-wm1-f69.google.com with SMTP id 14so5049429wmo.9
        for <kernel-janitors@vger.kernel.org>; Wed, 15 Apr 2020 07:56:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=4LhKDhow9t4woo07RzJCC9BA6orwImyFYcMaIKVNQYo=;
        b=dDwqDpXz6oxbB6htvyEvHBx8xDvqpgYcm000xqckyDNKjqIdtLSH16XrysY1VKyMMJ
         mSLt+ytca6+5M82d3Q1EDzdhoUfSQLT1iqr6uz7a5iVILvWQM+OtyYCbFxiRISL2yFts
         bs3wvM+OdQGgewbtgzdSqscnD2C00ntEjROEopyHljYKMUXv7VvKZu312fAzD2ORo7vi
         0rzUCVxDtv0k3d4+9PAlx1LxKyC5crfqAQBAOEow9xDS5dXc0B1n5OwiKfDWZoAY5L5F
         C2hBh0cQkIVUpm2yekF0VTiXyDJbeRDtYBij7GGJdDyIqmQCwFomUgrd6RmTNfNyQAjx
         5Jxg==
X-Gm-Message-State: AGi0PuZvlYN/xgM/y7Un9gktM2l5KYrTSYKT1nOKrgXz65Y/BBQJWNn1
        bgMx1HNqmXIcOQFJSz7cDNYr8NQC66/tdzWxEVTNac3BjjTFwg2d0tZcglxg1zvFz428vIrVqHY
        1tZfAOc6tRMIo3W2yI4KXd/ZfSFNf
X-Received: by 2002:a1c:3281:: with SMTP id y123mr5590628wmy.30.1586962608039;
        Wed, 15 Apr 2020 07:56:48 -0700 (PDT)
X-Google-Smtp-Source: APiQypJjilpHVeNKifN5eFrDuYwLsxn/vAfdpiQUm+CsSSmPNw/ELDy1FSOfPgEWE/zxFxJRvEgZQg==
X-Received: by 2002:a1c:3281:: with SMTP id y123mr5590604wmy.30.1586962607784;
        Wed, 15 Apr 2020 07:56:47 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:9066:4f2:9fbd:f90e? ([2001:b07:6468:f312:9066:4f2:9fbd:f90e])
        by smtp.gmail.com with ESMTPSA id n124sm23657617wma.11.2020.04.15.07.56.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Apr 2020 07:56:47 -0700 (PDT)
Subject: Re: [PATCH] KVM: remove redundant assignment to variable r
To:     Colin King <colin.king@canonical.com>, kvm@vger.kernel.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20200410113526.13822-1-colin.king@canonical.com>
From:   Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <6d66cb24-b517-1bc3-15c3-9b302215febf@redhat.com>
Date:   Wed, 15 Apr 2020 16:56:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200410113526.13822-1-colin.king@canonical.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On 10/04/20 13:35, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The variable r is being assigned  with a value that is never read
> and it is being updated later with a new value.  The initialization is
> redundant and can be removed.
> 
> Addresses-Coverity: ("Unused value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  virt/kvm/kvm_main.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
> index 74bdb7bf3295..03571f6acaa8 100644
> --- a/virt/kvm/kvm_main.c
> +++ b/virt/kvm/kvm_main.c
> @@ -3160,7 +3160,6 @@ static long kvm_vcpu_ioctl(struct file *filp,
>  	case KVM_SET_REGS: {
>  		struct kvm_regs *kvm_regs;
>  
> -		r = -ENOMEM;
>  		kvm_regs = memdup_user(argp, sizeof(*kvm_regs));
>  		if (IS_ERR(kvm_regs)) {
>  			r = PTR_ERR(kvm_regs);
> 

Queued, thanks.

Paolo

