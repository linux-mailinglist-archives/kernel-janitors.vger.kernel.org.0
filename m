Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BFC761BD3F6
	for <lists+kernel-janitors@lfdr.de>; Wed, 29 Apr 2020 07:22:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726470AbgD2FWS (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Wed, 29 Apr 2020 01:22:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60540 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726355AbgD2FWR (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 29 Apr 2020 01:22:17 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 70D9FC03C1AD
        for <kernel-janitors@vger.kernel.org>; Tue, 28 Apr 2020 22:22:17 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id g13so881287wrb.8
        for <kernel-janitors@vger.kernel.org>; Tue, 28 Apr 2020 22:22:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=colorfullife-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=DEbsinAYnhgND77W0440j0CYYAaV1ckk8I7Q+UgbDcE=;
        b=C1HKViVMPi9O3ikmc8ERzENlA0DlVA7lllj/Ll8eHLcFM+USsMHGCBwnkBQSj4zYp8
         +y7RpYhEHpGKpaYwpl5hA+ASTVJvBAnDssh2TXJVyrxkbFf8IzTFgRbsCzfT2TDmTbsx
         AEfX20aRfyQqy7kuYqlPPDcgP9IKCNX/+8jgZUeR3jtMtXdyh+NZEv2J5WET1bH+q9By
         g23WS/zLUEfVKPgT1HsRWBMrC0jVG1X+HMxlqXkXzDtIyRFOYELPx0n+5oC6E63NwtIJ
         YTPEfTMAQpzHfGzrUd5Bthx3jGNHzlCEWZi6KNmT7e8wzR7IqfSE/7pUzOr72MOgNFKd
         kD+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=DEbsinAYnhgND77W0440j0CYYAaV1ckk8I7Q+UgbDcE=;
        b=gf0SR3/UxZbQh5PcYTDaPV3A4OeZKPCM7XvTJj5X5E++qYvhZv8wWE0oBWMiJwwOGv
         4nhZcYlmjEP59qd2ebCpFgocvfyfjfXOl8g4dLE3KWrPlPd7vzn2ZhFhwr2+rVY6U5EC
         ZY/Rtg/s2kRCDCbbtmsMu7LJlyQ/l+xgwrQ1Xk/mabsyt59MO6eF/5CDljLxjb6w4Qj9
         f4dWiL9ygyYz6ndbMtoc+pdTvrCqcZAHWqhJoHQo3Xc7s1YskKu7T5SIEmBwE8s5mNMh
         9Vs1OwdtrK5MA0Xy0hwaqp5fBpldEbQ8lSflB9b24alR3oBm+6LDTWWbHW5eWtA0u2Cz
         oiQQ==
X-Gm-Message-State: AGi0PuY0sXcaX1Kqt6Gn7HvKBiRArPUZi85mgo8Vehq8FyO87WMpZo7t
        foiFoXSZVHZuCOClEuBJmw03Cp5+M796vw==
X-Google-Smtp-Source: APiQypJDHZsdHSZHimVi1uy9YR8FVAug0tPCPHfp4eLM9izaVf+4Cf4X311HWT9X9sKQd7WXUi3hEQ==
X-Received: by 2002:adf:ab18:: with SMTP id q24mr36172631wrc.214.1588137735214;
        Tue, 28 Apr 2020 22:22:15 -0700 (PDT)
Received: from linux.fritz.box (p200300D99705F8006FAD16D28CC8B8E9.dip0.t-ipconnect.de. [2003:d9:9705:f800:6fad:16d2:8cc8:b8e9])
        by smtp.googlemail.com with ESMTPSA id 91sm30533410wra.37.2020.04.28.22.22.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Apr 2020 22:22:14 -0700 (PDT)
Subject: Re: [PATCH -next] ipc: use GFP_ATOMIC under spin lock
To:     Matthew Wilcox <willy@infradead.org>,
        Wei Yongjun <weiyongjun1@huawei.com>
Cc:     Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Waiman Long <longman@redhat.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Alexey Dobriyan <adobriyan@gmail.com>,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
References: <20200428034736.27850-1-weiyongjun1@huawei.com>
 <20200428111403.GJ29705@bombadil.infradead.org>
From:   Manfred Spraul <manfred@colorfullife.com>
Message-ID: <a0f82756-3e51-d960-d901-e4cc3c7c4c19@colorfullife.com>
Date:   Wed, 29 Apr 2020 07:22:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200428111403.GJ29705@bombadil.infradead.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hello together,

On 4/28/20 1:14 PM, Matthew Wilcox wrote:
> On Tue, Apr 28, 2020 at 03:47:36AM +0000, Wei Yongjun wrote:
>> The function ipc_id_alloc() is called from ipc_addid(), in which
>> a spin lock is held, so we should use GFP_ATOMIC instead.
>>
>> Fixes: de5738d1c364 ("ipc: convert ipcs_idr to XArray")
>> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> I see why you think that, but it's not true.  Yes, we hold a spinlock, but
> the spinlock is in an object which is not reachable from any other CPU.

Is it really allowed that spin_lock()/spin_unlock may happen on 
different cpus?

CPU1: spin_lock()

CPU1: schedule() -> sleeps

CPU2: -> schedule() returns

CPU2: spin_unlock().


> Converting to GFP_ATOMIC is completely wrong.

What is your solution proposal?

xa_store() also gets a gfp_ flag. Thus even splitting _alloc() and 
_store() won't help

     xa_alloc(,entry=NULL,)
     new->seq = ...
     spin_lock();
     xa_store(,entry=new,GFP_KERNEL);

--

     Manfred


