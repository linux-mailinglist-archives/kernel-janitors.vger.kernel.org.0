Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 29220BF1E4
	for <lists+kernel-janitors@lfdr.de>; Thu, 26 Sep 2019 13:42:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726236AbfIZLmN (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Thu, 26 Sep 2019 07:42:13 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:52345 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725975AbfIZLmN (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 26 Sep 2019 07:42:13 -0400
Received: by mail-wm1-f66.google.com with SMTP id r19so2370053wmh.2
        for <kernel-janitors@vger.kernel.org>; Thu, 26 Sep 2019 04:42:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=xonFLYW+K9R2/V+E4nxIJtaZUYsUbdcdHfLF2kKtcoo=;
        b=Ps5n17nT4qWciZsC9oJ6IGnJHFHbWG4ZlXnBU/vo5CoFtTTcFz1daOUpKD/ipU4JTw
         ihs76iwMZ80RxUQMFVHFi5rvs5M1rcujs9NFUDyQiF6XVkF7SXmgG5B5WQ8wviB0n/0h
         viAE+GuDsrSXXAsyoxOa/u6wTXedWKEzGWG5iTpCje/HyXMDQP1QKsdJjeT8SaTNVvM9
         i5p1PVAP4pUIcDVmmC2qPUG+ZcG/GbmHpma7NTM9SxfdP5B5FUU7xlF/mHrARsTiCPop
         zVz4CSRj4Q1mP/877rHOBVyN5jMUa4ylMJrwXwyxxRAIiR9nZ+CFHeifrJsIveeE+ygL
         45Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=xonFLYW+K9R2/V+E4nxIJtaZUYsUbdcdHfLF2kKtcoo=;
        b=KhAnYCj+MZ+n8NYGi+tYmv6WE8+qomz+2lZPIy54xWMumsplJFB0QnjID3Pd0TzLFS
         gsZozgucH27QqmHNQDrdKW5X1u59rCQfzb7oro1J6MXNdelZc9+B6HbzofGXaTYQMrNt
         CpUmBdYt8sHmVxp4G5EAFaO5pYq0dvMNu5QTCTLPk32Qbf37EWZN50t0AR4wbQZDYjy4
         DV1Ut467y8usbvR4ITjReDHjLuIPK3ewtFpBuM742wIYCkBuWIL/gF51J+hsN3yyS7TX
         XyjnzP2Y2GZn5Rhn3kKe9Nn4Y2ivgBgXaMllJkWR425d3ou2cs811oUGQam4dp7qH4dK
         Xf7g==
X-Gm-Message-State: APjAAAVlkzIRD1MSXofrIOO0JqnnV6s6+ydFAK7YwYtSTORbLd3FRXVJ
        WLjOB62rBQ/Ay6TTOdFtN449Yw==
X-Google-Smtp-Source: APXvYqxnyNJu0dpuhkbD8V2MUn3DG+U46V6RIU4ma0y5/B8D4fyvBCvbpFOmizCk0WSq3Se6YEHEdw==
X-Received: by 2002:a1c:1981:: with SMTP id 123mr2593496wmz.88.1569498129864;
        Thu, 26 Sep 2019 04:42:09 -0700 (PDT)
Received: from [192.168.1.145] ([65.39.69.237])
        by smtp.gmail.com with ESMTPSA id s12sm5719744wra.82.2019.09.26.04.42.08
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 26 Sep 2019 04:42:09 -0700 (PDT)
Subject: Re: [PATCH][next] io_uring: ensure variable ret is initialized to
 zero
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Colin King <colin.king@canonical.com>,
        Alexander Viro <viro@zeniv.linux.org.uk>,
        linux-block@vger.kernel.org, linux-fsdevel@vger.kernel.org,
        kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20190926095012.31826-1-colin.king@canonical.com>
 <3aa821ea-3041-fb56-2458-ec643963c511@kernel.dk>
 <20190926113329.GE27389@kadam>
From:   Jens Axboe <axboe@kernel.dk>
Message-ID: <04262621-68fd-a4bb-ab0c-83954c03fbb0@kernel.dk>
Date:   Thu, 26 Sep 2019 13:42:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190926113329.GE27389@kadam>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On 9/26/19 1:33 PM, Dan Carpenter wrote:
> On Thu, Sep 26, 2019 at 11:56:30AM +0200, Jens Axboe wrote:
>> On 9/26/19 11:50 AM, Colin King wrote:
>>> From: Colin Ian King <colin.king@canonical.com>
>>>
>>> In the case where sig is NULL the error variable ret is not initialized
>>> and may contain a garbage value on the final checks to see if ret is
>>> -ERESTARTSYS.  Best to initialize ret to zero before the do loop to
>>> ensure the ret does not accidentially contain -ERESTARTSYS before the
>>> loop.
>>
>> Oops, weird it didn't complain. I've folded in this fix, as that commit
>> isn't upstream yet. Thanks!
> 
> There is a bug in GCC where at certain optimization levels, instead of
> complaining, it initializes it to zero.

That's awfully nice of it ;-)

Tried with -O0 and still didn't complain for me.

$ gcc --version
gcc (Ubuntu 9.1.0-2ubuntu2~18.04) 9.1.0

Tried gcc 5/6/7/8 as well. Might have to go look at what code it's
generating.

-- 
Jens Axboe

