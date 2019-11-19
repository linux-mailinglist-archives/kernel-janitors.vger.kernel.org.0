Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E1477102567
	for <lists+kernel-janitors@lfdr.de>; Tue, 19 Nov 2019 14:28:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727809AbfKSN2I (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Tue, 19 Nov 2019 08:28:08 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:49946 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725280AbfKSN1v (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 19 Nov 2019 08:27:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1574170070;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=bTHKmTWxG7SNPVC4OBKny3gsYqpJMsEsEatBKE18urw=;
        b=ghwzdH91dg0pmNTh6yld4nr+dxKo1kTZNc698x+/odZRtaEfOYPr5qYwdp0qq5jvqGW4u9
        mdeTCbIQaeeDAtKLba4BUBSuORyfe9ZEXTVdiqPsHr9mspQeqTzC+Oa3ljEg0q4lZfHsv0
        UW4ru26TwJGv7L0If2HsDJMcHLgU37A=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-92-dflixvjwPyaj8_SfO_tRbg-1; Tue, 19 Nov 2019 08:27:49 -0500
Received: by mail-wm1-f70.google.com with SMTP id y14so2418717wmi.4
        for <kernel-janitors@vger.kernel.org>; Tue, 19 Nov 2019 05:27:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
         :message-id:mime-version:content-transfer-encoding;
        bh=MpU09p/pEBjB9TbhpNZyv/NVevR6ROAbXIkSQhAzgFg=;
        b=ffyO/QK7KbrumUaBz53mfF5vD/mM0YxGHBBQ/Fsl76D5hJ13MW34ijXKQzGqEZZtUT
         wMz58in8u4yveZU1lBBWAEcCgAwwbEc+NYjuRdZcQ1t2myHwHeIkOyFcuDMzKWZP5wSf
         wnIGD6OuA5nXYAHqDhRfqqvsT71njQ14aB1zIoAXtiOKRJeyPHt2ANrOO6jR/bJ2EI6C
         Emdl1kYwEUVKEx4CdA2UQ+6qDVrP9QJYZ4nJxCxF1YRf4D5w0Ss67n9LxYZvGTM1XqhK
         J91WVX9JPODAswYyA3K224rmWb7k9pAs8kpgX9XCJwd+UDl5pzh5tGEEibMmZ9NsE2q6
         HYUQ==
X-Gm-Message-State: APjAAAU39sKPS7bEyeBAUxrBTXxjxb/v2IM3ETCdk5B2ZYvi5M3kpiCC
        ywdcUGfk12cU1x31wUbvyF9BwHdvr5DmYieg1gQgmJvgIm2w/k0sLFUQ3eiqhC90f56pcmjAg7M
        ERzuTvAiL7N5oELDjqhJJx5TWWuyN
X-Received: by 2002:adf:f20c:: with SMTP id p12mr34116066wro.379.1574170067307;
        Tue, 19 Nov 2019 05:27:47 -0800 (PST)
X-Google-Smtp-Source: APXvYqzhH5YB3qap0RHhoTXy40Ju7tdudN7Ig1TeR5/SpSHk8J69gCyAv5MQIKZz4xJnp9/ByLXgZw==
X-Received: by 2002:adf:f20c:: with SMTP id p12mr34116037wro.379.1574170067071;
        Tue, 19 Nov 2019 05:27:47 -0800 (PST)
Received: from vitty.brq.redhat.com (nat-pool-brq-t.redhat.com. [213.175.37.10])
        by smtp.gmail.com with ESMTPSA id g5sm3117460wma.43.2019.11.19.05.27.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Nov 2019 05:27:46 -0800 (PST)
From:   Vitaly Kuznetsov <vkuznets@redhat.com>
To:     maowenan <maowenan@huawei.com>
Cc:     kvm@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org, pbonzini@redhat.com,
        rkrcmar@redhat.com, sean.j.christopherson@intel.com,
        wanpengli@tencent.com, jmattson@google.com, joro@8bytes.org,
        tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, hpa@zytor.com
Subject: Re: [PATCH -next] KVM: x86: remove set but not used variable 'called'
In-Reply-To: <b164198f-2418-5f24-3f2f-cf8027af14b1@huawei.com>
References: <20191119030640.25097-1-maowenan@huawei.com> <87o8x8gjr5.fsf@vitty.brq.redhat.com> <b164198f-2418-5f24-3f2f-cf8027af14b1@huawei.com>
Date:   Tue, 19 Nov 2019 14:27:45 +0100
Message-ID: <877e3wgfn2.fsf@vitty.brq.redhat.com>
MIME-Version: 1.0
X-MC-Unique: dflixvjwPyaj8_SfO_tRbg-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

maowenan <maowenan@huawei.com> writes:

> =E5=9C=A8 2019/11/19 19:58, Vitaly Kuznetsov =E5=86=99=E9=81=93:
>> Mao Wenan <maowenan@huawei.com> writes:
>>=20
>>> Fixes gcc '-Wunused-but-set-variable' warning:
>>>
>>> arch/x86/kvm/x86.c: In function kvm_make_scan_ioapic_request_mask:
>>> arch/x86/kvm/x86.c:7911:7: warning: variable called set but not
>>> used [-Wunused-but-set-variable]
>>>
>>> It is not used since commit 7ee30bc132c6 ("KVM: x86: deliver KVM
>>> IOAPIC scan request to target vCPUs")
>>=20
>> Better expressed as=20
>>=20
>> Fixes: 7ee30bc132c6 ("KVM: x86: deliver KVM IOAPIC scan request to targe=
t vCPUs")
>
> This is just a cleanup, so Fixes tag is no need.
>>=20

Just a cleanup -- unless we compile with '-Werror'.

>>>
>>> Signed-off-by: Mao Wenan <maowenan@huawei.com>
>>> ---
>>>  arch/x86/kvm/x86.c | 5 ++---
>>>  1 file changed, 2 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
>>> index 0d0a682..870f0bc 100644
>>> --- a/arch/x86/kvm/x86.c
>>> +++ b/arch/x86/kvm/x86.c
>>> @@ -7908,12 +7908,11 @@ void kvm_make_scan_ioapic_request_mask(struct k=
vm *kvm,
>>>  =09=09=09=09       unsigned long *vcpu_bitmap)
>>>  {
>>>  =09cpumask_var_t cpus;
>>> -=09bool called;
>>> =20
>>>  =09zalloc_cpumask_var(&cpus, GFP_ATOMIC);
>>> =20
>>> -=09called =3D kvm_make_vcpus_request_mask(kvm, KVM_REQ_SCAN_IOAPIC,
>>> -=09=09=09=09=09     vcpu_bitmap, cpus);
>>> +=09kvm_make_vcpus_request_mask(kvm, KVM_REQ_SCAN_IOAPIC,
>>> +=09=09=09=09    vcpu_bitmap, cpus);
>>=20
>> IMHO as kvm_make_vcpus_request_mask() returns value it would probably
>> make sense to explicitly show that we're not interested in the result,
>>=20
>> (void)kvm_make_vcpus_request_mask()
>
> thanks, but I think is no need to add (void) before kvm_make_vcpus_reques=
t_mask()
> because we are not interested in it's return value.

Hm, that's exactly the reason why I suggested adding it there :-) Not a
big deal, feel free to ignore.

--=20
Vitaly

