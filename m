Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5369E23A2B9
	for <lists+kernel-janitors@lfdr.de>; Mon,  3 Aug 2020 12:29:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726394AbgHCK12 (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Mon, 3 Aug 2020 06:27:28 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:23329 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1725933AbgHCK12 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 3 Aug 2020 06:27:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1596450447;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=FgweyaoU1uHNy0URH0Fh2hsAsdHBpTAtSbV2WfKVsyM=;
        b=YpOp3zvw5LENTsI7eHYBjFH4Vt08ni2M1/inEDs3jNwqUWtUiqSCRnGz0XW5GUamwdOiOh
        pnSdvR0Ci28UJD287yqCfBV+r24hUUBPkhsUMMm3CC6SYJY4gV+tQLahJOKlLUBA/FiL5U
        c7yk5+TK6bCl36cjbwGGEOcvvwW4Z0c=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-50-oHUiU-i1PNeJSougJ48CjA-1; Mon, 03 Aug 2020 06:27:23 -0400
X-MC-Unique: oHUiU-i1PNeJSougJ48CjA-1
Received: by mail-wm1-f70.google.com with SMTP id u144so1922969wmu.3
        for <kernel-janitors@vger.kernel.org>; Mon, 03 Aug 2020 03:27:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=FgweyaoU1uHNy0URH0Fh2hsAsdHBpTAtSbV2WfKVsyM=;
        b=OGfEGe06/0vfA0nRm7la68u6154H6QtYkzS0jZkyIqXKVcFOV9u/O6PidkV+OVgkO7
         rsf02+P+YeDpKrN6iRIAkL15TKQqVnDR6DB+jF0ksESfctd5N9ONy2P8Q+rKpvTHpw1C
         +8xco3WrB4mpiLo1guJmA/eIQG/PqOt8+G0N9Us/B3XxGUizwvB5TZBzExX93AVFH/iw
         ZheukL+MgeL+t+0ASJJ7tkZQ9fJmY45EUDVLu0WCUflq+THQ1yMyu7tcCcr1nTOEJvdm
         4+QWjEBpemOAKW2Bwo0iuejrb+yRzcgH//Z9DpJ5HE5dohTjnq5H4qJIpCjS2IHGDnx7
         Zw/g==
X-Gm-Message-State: AOAM532oBfVjYFvUDOErZwP+jwjSIRqom3O+BnnWvwEOCV/IDRN2pC2V
        6wn7YglWdj92WOkbRAMCCMnV0JFcKB415aDL3bwc12kdVtxkiUb1eJezCTSA0orp7z9DDqPH8N4
        NRwfwA4RDCP7GzA+2JBwFW5Mljoq/
X-Received: by 2002:adf:81c5:: with SMTP id 63mr15131698wra.185.1596450442561;
        Mon, 03 Aug 2020 03:27:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwrg0aV3Z3PdF/J4QoXV3umcZ/Nc56wepMXP/rpTQH7mPwywtlK1jfx+z3A+Kqq/eCtJNOZGw==
X-Received: by 2002:adf:81c5:: with SMTP id 63mr15131666wra.185.1596450442181;
        Mon, 03 Aug 2020 03:27:22 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:310b:68e5:c01a:3778? ([2001:b07:6468:f312:310b:68e5:c01a:3778])
        by smtp.gmail.com with ESMTPSA id z207sm25102477wmc.2.2020.08.03.03.27.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Aug 2020 03:27:21 -0700 (PDT)
Subject: Re: [PATCH] KVM: SVM: Fix sev_pin_memory() error handling
To:     Sean Christopherson <sean.j.christopherson@intel.com>,
        Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Vitaly Kuznetsov <vkuznets@redhat.com>,
        Wanpeng Li <wanpengli@tencent.com>,
        Jim Mattson <jmattson@google.com>,
        Joerg Roedel <joro@8bytes.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
        kvm@vger.kernel.org, kernel-janitors@vger.kernel.org
References: <20200714142351.GA315374@mwanda>
 <20200731201859.GF31451@linux.intel.com>
From:   Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <37d241e2-6d21-c923-b9be-991fe42ebd4a@redhat.com>
Date:   Mon, 3 Aug 2020 12:27:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200731201859.GF31451@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On 31/07/20 22:18, Sean Christopherson wrote:
> On Tue, Jul 14, 2020 at 05:23:51PM +0300, Dan Carpenter wrote:
>> The sev_pin_memory() function was modified to return error pointers
>> instead of NULL but there are two problems.  The first problem is that
>> if "npages" is zero then it still returns NULL.  Secondly, several of
>> the callers were not updated to check for error pointers instead of
>> NULL.
>>
>> Either one of these issues will lead to an Oops.
>>
>> Fixes: a8d908b5873c ("KVM: x86: report sev_pin_memory errors with PTR_ERR")
> 
> Explicit Cc: to stable needed for KVM patches.
> 
>> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> Reviewed-by: Sean Christopherson <sean.j.christopherson@intel.com>
> 

Fortunately it's only broken in 5.9.  Queued, thanks.

Paolo

