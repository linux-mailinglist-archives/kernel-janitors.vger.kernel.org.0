Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 462E31F505A
	for <lists+kernel-janitors@lfdr.de>; Wed, 10 Jun 2020 10:33:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726817AbgFJIdC (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Wed, 10 Jun 2020 04:33:02 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:33365 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726809AbgFJIdC (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 10 Jun 2020 04:33:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1591777980;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=/CzDQqYRGgoycRXVjpGii7I26mAUdaOWbacFoesUyuU=;
        b=R3aZvon1E294tGk8eeqTC+pM9y2GzzTwdGpgLNxyneB7jWhNJOpEdLBbRCgHxdZ+T00evt
        AIzT3qXwptekTYx9zWHx3KoL7PmMae4qTTISecX3rwHWTYh8WTDBINo92pqZ/2bHxgu0+S
        tVu71RztIYpVk96MNWMqPrMF85oWnL8=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-102--wyA8oGVMzaNi36SvKWaCA-1; Wed, 10 Jun 2020 04:32:58 -0400
X-MC-Unique: -wyA8oGVMzaNi36SvKWaCA-1
Received: by mail-ej1-f72.google.com with SMTP id i17so755456ejb.9
        for <kernel-janitors@vger.kernel.org>; Wed, 10 Jun 2020 01:32:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
         :message-id:mime-version;
        bh=/CzDQqYRGgoycRXVjpGii7I26mAUdaOWbacFoesUyuU=;
        b=nIW5MfLZa2eQpYOm9biTDGolndnsXDUO6i5Z5qyzy4VgQQUjq1/hyGBAZ5pDuapZru
         cVeGZttShqBULXdcl9QJCFrsrKd6egUvoNBfSmRdaWxY4Cm1Jehe6mjgjNWnKVrpEvx4
         4crNYZy2OuAq0iiDA8TaVvcjv1qzCSW167RYeDv7erJqd1U9lcBO+ohXDSo4/A8Voeik
         h/ZPoJEH+JQjSo1xyQmz4CdMD6Ct9YCLJ7S7D7A29cTzr+AHbCo8TJE8HKM3VSOQrZwY
         5FuPrg2urcWg18BS62pLz25yb4tr5VeQ5HJFpLAMPe3aiH0NsbJSbmR2cgG0VEbyLhLP
         qhPA==
X-Gm-Message-State: AOAM532RTBNL0V6qOhV8hAac/YgYQUCGaZSthmNb3VFKzQwO3W+/NlME
        KUKmlbWJWiZrtUUqpJX0STacWp/nUrXe/fCsfzB0jY3I1RNKT8yInrlYCmhifkc0IGebml8VR2V
        ox9/4YKuG0cExOQtxU9Gh8QhFYA/D
X-Received: by 2002:aa7:c4c7:: with SMTP id p7mr1548533edr.271.1591777977419;
        Wed, 10 Jun 2020 01:32:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyRDXVgnf8jf3KQtAoZpcPajfcKWk4OSBUiV1BVsb+L5Lx8Bk89ta016RNTLmlCPlXXZtcimg==
X-Received: by 2002:aa7:c4c7:: with SMTP id p7mr1548507edr.271.1591777977145;
        Wed, 10 Jun 2020 01:32:57 -0700 (PDT)
Received: from vitty.brq.redhat.com (g-server-2.ign.cz. [91.219.240.2])
        by smtp.gmail.com with ESMTPSA id ok21sm14043099ejb.82.2020.06.10.01.32.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2020 01:32:56 -0700 (PDT)
From:   Vitaly Kuznetsov <vkuznets@redhat.com>
To:     Colin King <colin.king@canonical.com>
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
        Paolo Bonzini <pbonzini@redhat.com>,
        Sean Christopherson <sean.j.christopherson@intel.com>,
        Wanpeng Li <wanpengli@tencent.com>,
        Jim Mattson <jmattson@google.com>,
        Joerg Roedel <joro@8bytes.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        x86@kernel.org, "H . Peter Anvin" <hpa@zytor.com>,
        kvm@vger.kernel.org
Subject: Re: [PATCH] kvm: i8254: remove redundant assignment to pointer s
In-Reply-To: <20200609233121.1118683-1-colin.king@canonical.com>
References: <20200609233121.1118683-1-colin.king@canonical.com>
Date:   Wed, 10 Jun 2020 10:32:55 +0200
Message-ID: <875zbzb9s8.fsf@vitty.brq.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Colin King <colin.king@canonical.com> writes:

> From: Colin Ian King <colin.king@canonical.com>
>
> The pointer s is being assigned a value that is never read, the
> assignment is redundant and can be removed.
>
> Addresses-Coverity: ("Unused value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

It seems it wasn't used since the very beginning,

Fixes: 7837699fa6d7 ("KVM: In kernel PIT model")

QEMU code (from where KVM's implementation originates), however, 
does make use of 's' here as it open codes pit_latch_status().

> ---
>  arch/x86/kvm/i8254.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/arch/x86/kvm/i8254.c b/arch/x86/kvm/i8254.c
> index febca334c320..a6e218c6140d 100644
> --- a/arch/x86/kvm/i8254.c
> +++ b/arch/x86/kvm/i8254.c
> @@ -462,7 +462,6 @@ static int pit_ioport_write(struct kvm_vcpu *vcpu,
>  		if (channel == 3) {
>  			/* Read-Back Command. */
>  			for (channel = 0; channel < 3; channel++) {
> -				s = &pit_state->channels[channel];
>  				if (val & (2 << channel)) {
>  					if (!(val & 0x20))
>  						pit_latch_count(pit, channel);

Reviewed-by: Vitaly Kuznetsov <vkuznets@redhat.com>

-- 
Vitaly

