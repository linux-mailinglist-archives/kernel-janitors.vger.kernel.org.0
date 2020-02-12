Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8499E15A937
	for <lists+kernel-janitors@lfdr.de>; Wed, 12 Feb 2020 13:32:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727827AbgBLMcH (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Wed, 12 Feb 2020 07:32:07 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:46874 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725887AbgBLMcG (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 12 Feb 2020 07:32:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1581510725;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=jFhBtgSX0/7uUXEHu3xDi09Duj0eAVawgfKR4aU8SAY=;
        b=fGuHm0I/3TF2njitMa76wN27CuXNV4/uXq3oLtwW75lNibyCAd6qWxlHocSBCdkbUOgeXb
        cr7u6a9l2q3QGpt8zDpB3+845Ns/bA+auY+6y34KKmk/Ty2KNq6ZLxnHTYP8Rz4fdoUkbk
        MnKiuhlwIBRWNL9ZXzWOgI9hZjlQRb8=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-21-Aj8T5HaNOIyX0J5_6nrmyQ-1; Wed, 12 Feb 2020 07:32:03 -0500
X-MC-Unique: Aj8T5HaNOIyX0J5_6nrmyQ-1
Received: by mail-wm1-f69.google.com with SMTP id o24so671915wmh.0
        for <kernel-janitors@vger.kernel.org>; Wed, 12 Feb 2020 04:32:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=jFhBtgSX0/7uUXEHu3xDi09Duj0eAVawgfKR4aU8SAY=;
        b=hAIyxOLzwqFZ4RsJtsc/qRsFYFhQMcA5NkmrQbiO+6mqoaApMOp3Kwboz6+I5ejONU
         Zmd5jRykuY3rJ7LYAjeyscG/T3kNIJ9wXwGy5OmBFyEpKK2QZzvoP5POAhvZsfpx/Wm/
         zoQyPX1OXAKEeqy+MiFt1BOunslqK+/AgXcZiDPmP2lH8LtQEmiCK7JbI4lCAMV6nzxi
         rX34S/Q3uyLNPhYDr4TvtITJwQJwWT9N+CPvTW2gZYE5qzJQKDcJsIskjHl5rOTpJ1Rx
         SX/NZs9krDtrNSJac5fNoLzrr8OnjbpKp/xMt0GISwWzDJ8r5eqzqmHyvfK8dW3iNxwm
         yRQg==
X-Gm-Message-State: APjAAAVtk0c00RxWaHp/Xud6ruzHKmKcGZ5qFEJqvhyfZAHdI4L75Vm5
        ZKX4kfMzEGZmSp2duPThEt5b1xgB4MF/UTnsx/wX2kJeNu1sz8VK95oViyD9dGvgIe4G4DzUxOW
        Qm53N76zwXu9G+Spv55+tYcSnVjcU
X-Received: by 2002:a5d:6886:: with SMTP id h6mr15144932wru.154.1581510721845;
        Wed, 12 Feb 2020 04:32:01 -0800 (PST)
X-Google-Smtp-Source: APXvYqybL8KNyituH0wLu6xowOVQevPeXsPTUSxO/YMHGX038NBFDetmNWKvBDmZgdVL2znEi+z6BQ==
X-Received: by 2002:a5d:6886:: with SMTP id h6mr15144913wru.154.1581510721587;
        Wed, 12 Feb 2020 04:32:01 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:652c:29a6:517b:66d9? ([2001:b07:6468:f312:652c:29a6:517b:66d9])
        by smtp.gmail.com with ESMTPSA id l15sm453755wrv.39.2020.02.12.04.32.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Feb 2020 04:32:01 -0800 (PST)
Subject: Re: [PATCH][next] KVM: x86: remove redundant WARN_ON check of an
 unsigned less than zero
To:     Sean Christopherson <sean.j.christopherson@intel.com>,
        Colin King <colin.king@canonical.com>
Cc:     Vitaly Kuznetsov <vkuznets@redhat.com>,
        Wanpeng Li <wanpengli@tencent.com>,
        Jim Mattson <jmattson@google.com>,
        Joerg Roedel <joro@8bytes.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        "H . Peter Anvin" <hpa@zytor.com>, x86@kernel.org,
        kvm@vger.kernel.org, kernel-janitors@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20200207231813.786224-1-colin.king@canonical.com>
 <20200208004722.GB15581@linux.intel.com>
From:   Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <21975038-ae1a-50a1-7fa0-38a1445abe8d@redhat.com>
Date:   Wed, 12 Feb 2020 13:32:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20200208004722.GB15581@linux.intel.com>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On 08/02/20 01:47, Sean Christopherson wrote:
> On Fri, Feb 07, 2020 at 11:18:13PM +0000, Colin King wrote:
>> From: Colin Ian King <colin.king@canonical.com>
>>
>> The check cpu->hv_clock.system_time < 0 is redundant since system_time
>> is a u64 and hence can never be less than zero. Remove it.
>>
>> Addresses-Coverity: ("Macro compares unsigned to 0")
>> Signed-off-by: Colin Ian King <colin.king@canonical.com>
>> ---
>>  arch/x86/kvm/x86.c | 1 -
>>  1 file changed, 1 deletion(-)
>>
>> diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
>> index fbabb2f06273..d4967ac47e68 100644
>> --- a/arch/x86/kvm/x86.c
>> +++ b/arch/x86/kvm/x86.c
>> @@ -2448,7 +2448,6 @@ static int kvm_guest_time_update(struct kvm_vcpu *v)
>>  	vcpu->hv_clock.tsc_timestamp = tsc_timestamp;
>>  	vcpu->hv_clock.system_time = kernel_ns + v->kvm->arch.kvmclock_offset;
>>  	vcpu->last_guest_tsc = tsc_timestamp;
>> -	WARN_ON(vcpu->hv_clock.system_time < 0);
> 
> Don't know this code well, but @kernel_ns and @v->kvm->arch.kvmclock_offset
> are both s64, so maybe this was intended and/or desirable?
> 
> 	WARN_ON((s64)vcpu->hv_clock.system_time < 0);

Yes, that's related to the bugfix where kvmclock would get negative.  I
queued the patch with the (s64) cast added.  Thanks to both of you!

Paolo

