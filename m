Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C3E861285B2
	for <lists+kernel-janitors@lfdr.de>; Sat, 21 Dec 2019 00:51:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726485AbfLTXvK (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Fri, 20 Dec 2019 18:51:10 -0500
Received: from mail-pl1-f180.google.com ([209.85.214.180]:33015 "EHLO
        mail-pl1-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726470AbfLTXvJ (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 20 Dec 2019 18:51:09 -0500
Received: by mail-pl1-f180.google.com with SMTP id c13so4778573pls.0
        for <kernel-janitors@vger.kernel.org>; Fri, 20 Dec 2019 15:51:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=NKQ9URZBMeV3OPseAAh2Xx7y2pXyxLatIKtNl8iLvXQ=;
        b=ykJu8gvYo2ySI4MYq3KAx12I/84YrqF+Q/U5WMmy9QswF5KWC7Km1ht1FtGvNaAqEP
         O5N9mcr7Ry87YOOCeMm9G9FT4U2Eg8KXvUxER0cexg2PiLXMO8kzbyibp6yHj99A0BwQ
         azvWMwgMPEzz53V3OcaFGUZMscgQ49MExbyF4PTQYnrMpJNaDUSPsxshj/pv3lDgiSEa
         V6iwl5I4A5vmr+Ob3uN9MzIuG2rz8qbK9VqN9mLJejdnI3ZW3+2VKhK3LRj+FC/uePhi
         Swb8KNcr8jc974+Q3z6dOxdd6nhs7IAAlnnRfXigkKsfolnY0ljiBl0xJMN8YmjPXtYj
         1Gjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=NKQ9URZBMeV3OPseAAh2Xx7y2pXyxLatIKtNl8iLvXQ=;
        b=ZMIWXRmft8NgyWB3CRGRsSS+BVtHCZN46YzqbUPUzjPjxjTdT2n4HwYoC97N0QwvFM
         f1raB8T12liXd+huJWeqhjCIx38+lNMU11NrxLj1+Cpa/SIRqnEbbCvP0qLF5N0n+BWY
         tpM+9HP2FLYaq8MwJQZUyRbHWY/KuWHabQVA1OdcPbnwUqCY9crmcYEf72jYx1gVm6SQ
         2b9zp8bUezfkrscIu6cvp1tC3W530sQ0H1jx6fBZb1hvtoHZlusSVkvigM9L+OuhGzln
         +jkyZcAPwp02r3+efSFSCf2kmdOc67trtIHmniO7IgNz5DnVmcxG+JQ/2UkZz729cfPH
         pi8g==
X-Gm-Message-State: APjAAAXuvn31egQab5/a9MlItKy7vts8qlWe4yqVQL/d+R4GWC1mwKn/
        eAKSbXdx+/MWRDbTZkd3vDYu5g==
X-Google-Smtp-Source: APXvYqzmkZWiV7MicyHExsLOg3UvxPLhXwAkPmhB5mHQM5D5YzarwPE7bcTHy/sqhKiuGY4VEVe9RA==
X-Received: by 2002:a17:902:76c9:: with SMTP id j9mr8890271plt.21.1576885852697;
        Fri, 20 Dec 2019 15:50:52 -0800 (PST)
Received: from [192.168.1.188] ([66.219.217.145])
        by smtp.gmail.com with ESMTPSA id w38sm13024578pgk.45.2019.12.20.15.50.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Dec 2019 15:50:52 -0800 (PST)
Subject: Re: [PATCH][next] io_uring: fix missing error return when
 percpu_ref_init fails
To:     Colin Ian King <colin.king@canonical.com>,
        Alexander Viro <viro@zeniv.linux.org.uk>,
        io-uring@vger.kernel.org, linux-fsdevel@vger.kernel.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20191220233322.13599-1-colin.king@canonical.com>
 <398f514a-e2ce-8b4f-16cf-4edeec5fa1e7@kernel.dk>
 <cf270359-fd06-3175-d0ef-ec2adc628235@canonical.com>
From:   Jens Axboe <axboe@kernel.dk>
Message-ID: <a1a36f72-50ff-9cce-bcde-6639f7ab6406@kernel.dk>
Date:   Fri, 20 Dec 2019 16:50:50 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <cf270359-fd06-3175-d0ef-ec2adc628235@canonical.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On 12/20/19 4:49 PM, Colin Ian King wrote:
> On 20/12/2019 23:48, Jens Axboe wrote:
>> On 12/20/19 4:33 PM, Colin King wrote:
>>> From: Colin Ian King <colin.king@canonical.com>
>>>
>>> Currently when the call to percpu_ref_init fails ctx->file_data is
>>> set to null and because there is a missing return statement the
>>> following statement dereferences this null pointer causing an oops.
>>> Fix this by adding the missing -ENOMEM return to avoid the oops.
>>
>> Nice, thanks! I'm guessing I didn't have the necessary magic debug
>> options to allow failure injection for failing.
> 
> Fortunately we have Coverity to the rescue :-)

Indeed!

-- 
Jens Axboe

