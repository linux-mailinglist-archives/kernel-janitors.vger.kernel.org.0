Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8AA512317E
	for <lists+kernel-janitors@lfdr.de>; Mon, 20 May 2019 12:40:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731692AbfETKkP (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Mon, 20 May 2019 06:40:15 -0400
Received: from mail-wr1-f51.google.com ([209.85.221.51]:39484 "EHLO
        mail-wr1-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731122AbfETKkO (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 20 May 2019 06:40:14 -0400
Received: by mail-wr1-f51.google.com with SMTP id w8so14012210wrl.6
        for <kernel-janitors@vger.kernel.org>; Mon, 20 May 2019 03:40:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=L40/9N0FOi4fpbA4yRORuDUGlUkCJfKErs8txqBEf2U=;
        b=s+exNjyAO1yW8ZnPONU6yf3zwfsCc+aa749x3R/BFvgXlPNfmuAV8N7Qe3toNjb5OJ
         1NhtjaSE9fIf/UHGL6eFuGqRFCzxzvZl38NxLswbuxBzebeY6z4DZe//vObhLTS6KDIe
         AHeqJfdQYB4HbuzIjcr/3dnAQZbDYNih9A/jNlxxMq16BMUIb5VbewOSLxMg19fjrDUN
         lCiiJifSxlN1kEVTcpY6PyMQecTiJ8sEdfKH9WemSHmSXWaLWrhfqgRNOR4Qpdx9nSFe
         mOtmbRiFmWtq+oAMBtFy9TrQZkjkpfg2nhUfYHsc8q7SS9+IedbLIylfp+kJhN9h2Bk9
         2QKQ==
X-Gm-Message-State: APjAAAX+iVEZLZOw/P70cKsc2JJwHYw+XHNPZI9DW2hUkULXcNtrfdDF
        fhW+CxKe1u4SgZ10tCyQBgV1Og==
X-Google-Smtp-Source: APXvYqxOmIBkPyBKkJ5XOGuZSP6eL3M8c0ltZGH5TrDJrlndsDsKgcarA1AxoSc5ZM1uJoSxO82Dxw==
X-Received: by 2002:adf:9c8a:: with SMTP id d10mr28788521wre.9.1558348813001;
        Mon, 20 May 2019 03:40:13 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:ac04:eef9:b257:b844? ([2001:b07:6468:f312:ac04:eef9:b257:b844])
        by smtp.gmail.com with ESMTPSA id a4sm22483616wmf.45.2019.05.20.03.40.12
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Mon, 20 May 2019 03:40:12 -0700 (PDT)
Subject: Re: [PATCH -next] KVM: s390: fix typo in parameter description
To:     Christian Borntraeger <borntraeger@de.ibm.com>,
        Wei Yongjun <weiyongjun1@huawei.com>,
        Janosch Frank <frankja@linux.ibm.com>,
        David Hildenbrand <david@redhat.com>,
        Cornelia Huck <cohuck@redhat.com>,
        Martin Schwidefsky <schwidefsky@de.ibm.com>,
        Heiko Carstens <heiko.carstens@de.ibm.com>
Cc:     linux-s390@vger.kernel.org, kernel-janitors@vger.kernel.org,
        =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@redhat.com>
References: <20190504065145.53665-1-weiyongjun1@huawei.com>
 <1fdd0337-6d73-99aa-2dea-25f5d10c8107@de.ibm.com>
 <a6d67ef5-2db8-5373-04ae-d54f5bdb79db@de.ibm.com>
From:   Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <44f535b4-a89c-748d-b275-2876d5223689@redhat.com>
Date:   Mon, 20 May 2019 12:40:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <a6d67ef5-2db8-5373-04ae-d54f5bdb79db@de.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On 20/05/19 09:41, Christian Borntraeger wrote:
> On 06.05.19 09:52, Christian Borntraeger wrote:
>>
>>
>> On 04.05.19 08:51, Wei Yongjun wrote:
>>> Fix typo in parameter description.
>>>
>>> Fixes: 8b905d28ee17 ("KVM: s390: provide kvm_arch_no_poll function")
>>> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
>>
>> Acked-by: Christian Borntraeger <borntraeger@de.ibm.com>
> 
> Since I have another fix pending, I now picked this up myself and
> this will be in my next pull request for 5.2-rc2.

Ok, I'll wait for it before sending my own pending fixes to Linus.

Paolo
