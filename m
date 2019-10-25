Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 77B43E4E29
	for <lists+kernel-janitors@lfdr.de>; Fri, 25 Oct 2019 16:05:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2632779AbfJYN4H (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Fri, 25 Oct 2019 09:56:07 -0400
Received: from mail-io1-f44.google.com ([209.85.166.44]:38402 "EHLO
        mail-io1-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2505227AbfJYN4E (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 25 Oct 2019 09:56:04 -0400
Received: by mail-io1-f44.google.com with SMTP id u8so2509753iom.5
        for <kernel-janitors@vger.kernel.org>; Fri, 25 Oct 2019 06:56:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20150623.gappssmtp.com; s=20150623;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=DN/boTIWxa8MaNmxPDzQ/RzCmNnBTB12r1M0NQaPgf4=;
        b=qPW1lQp3D1B6cgueUqjGz5fEvkXdXC95H5/2b3GdD4rOqNskoNNTqIYmK3fpW90clN
         78dU+wproOmKEhQM1QINUK2U083V/y2XUJz1p7pX5PLnl6O2la3tGjUqLMa6+KAYf15q
         fszcDsr6ktdUB0QvIsSlMGCupeW0RZqbSP9X5tr3DSi/+fWhkSUnEJtwZ12xmwJAZl/X
         h8YmanVa+hHnZ5Xmziwc94S4QcKqODMMaD51Hv6UbpVKfnKWl0KAEohHyeowzQwzrChQ
         2DSVzANzDaQqD1a+jBl5pm28Npai9PVHdgWj5hzKy0RirFUxr62lnzwui3bk1sNF3zSy
         AU5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=DN/boTIWxa8MaNmxPDzQ/RzCmNnBTB12r1M0NQaPgf4=;
        b=ubOZiu9rYKpk5fjlaSfAEkcvfJMFJG4mqKc/rF/C4k5M7QwaLixPpYtqrtrJ5QDjdM
         ahCfL1NGMa7kgFrP0OHKn6fkWyFSK2bUuzzvs1abrwMCJDXznxt3xJDk0OZETxsX9r/z
         HAoUyN6NBb4osA75DFMZWaXz1Y4VjAKDed3djMpqCsyXI88dJ9FsgXh66vJJfMQ3xmY2
         sq5aQ7mA1PRL4zI4qjcaiHLT/2xSncUXqVzIIeQiHmtxHxNFEw/k6Yb+47gQAB914X/J
         00k8gMu/dWl1LJFqh+BoXavqzwbIXdj7VkqxvfeB+H5DA7tlVeniOj1GHgN7sX5Vna0n
         9Arg==
X-Gm-Message-State: APjAAAVj+LcmDZAf/E8oRV+2wZAD9katNN+echmgmYAey/jpxBQTU2BD
        Vq6IokOqYH/krL4iZGuefHYqYruW7Ucrpw==
X-Google-Smtp-Source: APXvYqy6JeyOVDx2zUMS3zZ9Ddjo7Oa/bQ9LFZhInqkZ2QErefqQfJ9tx988Jl+EOGBObqtsgpgupA==
X-Received: by 2002:a6b:400e:: with SMTP id k14mr3818319ioa.254.1572011762416;
        Fri, 25 Oct 2019 06:56:02 -0700 (PDT)
Received: from [192.168.1.159] ([65.144.74.34])
        by smtp.gmail.com with ESMTPSA id l23sm262266ion.76.2019.10.25.06.56.00
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 25 Oct 2019 06:56:01 -0700 (PDT)
Subject: Re: [PATCH][next] io-wq: fix unintentional integer overflow on left
 shift
From:   Jens Axboe <axboe@kernel.dk>
To:     Colin King <colin.king@canonical.com>,
        Alexander Viro <viro@zeniv.linux.org.uk>,
        linux-fsdevel@vger.kernel.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20191025124315.21742-1-colin.king@canonical.com>
 <fc23061e-31ec-8a66-2b62-771121d182de@kernel.dk>
Message-ID: <02517010-9244-771f-d0ce-558bbebe6a63@kernel.dk>
Date:   Fri, 25 Oct 2019 07:56:00 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <fc23061e-31ec-8a66-2b62-771121d182de@kernel.dk>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On 10/25/19 6:54 AM, Jens Axboe wrote:
> On 10/25/19 6:43 AM, Colin King wrote:
>> From: Colin Ian King <colin.king@canonical.com>
>>
>> Shifting the integer value 1U is evaluated with type unsigned int
>> using 32-bit arithmetic and then used in an expression that expects
>> a 64-bit value, so there is potentially an integer overflow. Fix this
>> by using the BIT_ULL macro to perform the shift and avoid the overflow.
> 
> Good catch, that should indeed have been 1ULL. I'll fold in your
> fix, thanks!

BTW, this missed the same issue on the clear side of it, in
io_worker_handle_work(). I've fixed that one up the same way.

-- 
Jens Axboe

