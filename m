Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5F604579FF0
	for <lists+kernel-janitors@lfdr.de>; Tue, 19 Jul 2022 15:47:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237319AbiGSNrA (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Tue, 19 Jul 2022 09:47:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50904 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237387AbiGSNqn (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 19 Jul 2022 09:46:43 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id CB2D54F640
        for <kernel-janitors@vger.kernel.org>; Tue, 19 Jul 2022 05:59:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1658235570;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Iige8/LVm6VVY2/ZBSwmWyk6JzLbyvYk5pU1/kh9Fs8=;
        b=MGqfqhoQnzFSXqSosM67DISvKbSghIa/Psu4R2+MJK3IfO/I5B1qKGoxnVp3GnUvmpKvta
        8r7Z0C2aVTcErfiiB5ZlOJI0QJLMimwQU7katIokQWvUe577fu7lj+zqxLWXIcfkDeOqbg
        /7+nFjVOxuZV5Xn3/FOcMlRbXKEZ7ks=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-10-TiIM78aQPSuqZ3Z-JPNyTg-1; Tue, 19 Jul 2022 08:59:29 -0400
X-MC-Unique: TiIM78aQPSuqZ3Z-JPNyTg-1
Received: by mail-ed1-f69.google.com with SMTP id x21-20020a05640226d500b0043abb7ac086so9861928edd.14
        for <kernel-janitors@vger.kernel.org>; Tue, 19 Jul 2022 05:59:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=Iige8/LVm6VVY2/ZBSwmWyk6JzLbyvYk5pU1/kh9Fs8=;
        b=ftqB7GMd+9EsPptI/AX/Wj+w1BMb+BvG6pY+DYr2UhABy6NyM04XkcBolC1zelZx5J
         WPPxPgesYYpwqk4Li3d6Wruo8AfoK0l2kygSHYVdTRkyurHJBupAQYme+XOc6JNdub7P
         IBHIf/Apx+OltI6wm0O2YbkKTb/vkSVMrsW5gAfRQV35RXQFD+v2NZgaVC5ssEI0Fbq6
         Vmx+l6WOXnRJX3r/01bo0wzCCC6BEbmsr/8cvUmEndMBjGy5rxjMccrbPH/amNwasA91
         5ORQBVDZWKdLqV5FJn/8KjrMITze6e5sTMqahHjmoc32Jof0AJABOnMo7cOevvF74vpv
         uJWA==
X-Gm-Message-State: AJIora/El9V1ztfrtx2OM3BOpUcbfMT4zJ24MUYzwGh623J60kYI7hOF
        GgIjuWML3bhIKBVzf8NB9QkjIQdeoLUXKSPcHLoTplky5SRdQYP3jNaA5lsATl+SoMKxRTzZ9gp
        ISiMwqh3Esfw9LDrxOJPPHbCjfH1u
X-Received: by 2002:a17:907:a06e:b0:72b:2cba:da35 with SMTP id ia14-20020a170907a06e00b0072b2cbada35mr30253419ejc.358.1658235568236;
        Tue, 19 Jul 2022 05:59:28 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1ucBpxGGw0oeFdDnqSzMzwRP5NnWN8dyfASt8XvpZCKrqNEiQIraMSzMUU7yVcJJ46ejvHV7w==
X-Received: by 2002:a17:907:a06e:b0:72b:2cba:da35 with SMTP id ia14-20020a170907a06e00b0072b2cbada35mr30253405ejc.358.1658235568008;
        Tue, 19 Jul 2022 05:59:28 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:9af8:e5f5:7516:fa89? ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
        by smtp.googlemail.com with ESMTPSA id wc23-20020a170907125700b0072b41776dd1sm6622559ejb.24.2022.07.19.05.59.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Jul 2022 05:59:27 -0700 (PDT)
Message-ID: <e51fb350-265f-7123-c0e5-38df64734e9c@redhat.com>
Date:   Tue, 19 Jul 2022 14:59:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH] KVM: selftests: fix bit test in is_steal_time_supported()
Content-Language: en-US
To:     Dan Carpenter <dan.carpenter@oracle.com>,
        Sean Christopherson <seanjc@google.com>
Cc:     Shuah Khan <shuah@kernel.org>, kvm@vger.kernel.org,
        linux-kselftest@vger.kernel.org, kernel-janitors@vger.kernel.org
References: <YtZ/Rnrm8Y+uPjDq@kili>
From:   Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <YtZ/Rnrm8Y+uPjDq@kili>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On 7/19/22 11:54, Dan Carpenter wrote:
> The KVM_FEATURE_STEAL_TIME (5) define is the BIT() value so we need to
> do shift for this to work correctly.
> 
> Fixes: 998016048221 ("KVM: selftests: Convert steal_time away from VCPU_ID")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>   tools/testing/selftests/kvm/steal_time.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tools/testing/selftests/kvm/steal_time.c b/tools/testing/selftests/kvm/steal_time.c
> index d122f1e05cdd..b89f0cfa2dc3 100644
> --- a/tools/testing/selftests/kvm/steal_time.c
> +++ b/tools/testing/selftests/kvm/steal_time.c
> @@ -62,7 +62,7 @@ static bool is_steal_time_supported(struct kvm_vcpu *vcpu)
>   {
>   	struct kvm_cpuid_entry2 *cpuid = kvm_get_supported_cpuid_entry(KVM_CPUID_FEATURES);
>   
> -	return cpuid && (cpuid->eax & KVM_FEATURE_STEAL_TIME);
> +	return cpuid && (cpuid->eax & (1 << KVM_FEATURE_STEAL_TIME));
>   }
>   
>   static void steal_time_init(struct kvm_vcpu *vcpu, uint32_t i)

This is already fixed in kvm/queue, but also actually the Fixes tag 
would have to date back to commit 94c4b76b88d4 ("KVM: selftests: 
Introduce steal-time test", 2020-03-16).

Paolo

