Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 947EB36EC5D
	for <lists+kernel-janitors@lfdr.de>; Thu, 29 Apr 2021 16:27:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237406AbhD2O2L (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Thu, 29 Apr 2021 10:28:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39978 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237338AbhD2O2K (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 29 Apr 2021 10:28:10 -0400
Received: from mail-il1-x12f.google.com (mail-il1-x12f.google.com [IPv6:2607:f8b0:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 51BCEC06138B
        for <kernel-janitors@vger.kernel.org>; Thu, 29 Apr 2021 07:27:21 -0700 (PDT)
Received: by mail-il1-x12f.google.com with SMTP id y6so420257ilq.10
        for <kernel-janitors@vger.kernel.org>; Thu, 29 Apr 2021 07:27:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=oX7qYgxXYUDTnDWIrAAdrMAk23CW1FWOs8hQTp5c3yY=;
        b=U4mbRlv5UHD7sn2yKKFCrR+4XJ13UgOrePmZ9r2zi4LgU/UxNb72eYOLK/TvO7VUlz
         30WM7WkrcRFNI/x/ite+fOcgwI2QEtgUxsjoskRUTfetp2ZeV8V6EvbTQJQ8k/LVqLSz
         LkoD3TnCV+fTaXYxRE35BxH8SiXnv7w1dxW3bIcojZXcQEWKEdKLy4tpks1Cw+gUrAkq
         VuQqMkHFdQ0zszYyHwo5cmhjNf9iphNdIiDdkLefNDM7yiRp1rrPoe+45r/HOSWh/7WI
         vNsgd2MnuJMVvW5PuGtKQDv4GD6uCtf2xJAILqgH4/102fTtZdT3o7pZTZtcy7g1yg4X
         791A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=oX7qYgxXYUDTnDWIrAAdrMAk23CW1FWOs8hQTp5c3yY=;
        b=rbzeWYhHkh3CXv6h7ySsgmG8HvXSEiGRHUB/07K/AGleUNKl95Av0UeMfz66Pj1Jjg
         eOpMdStCsAG/+WYXHs1kihCEYfKBUeNCUCOmOE0Q9glaIpuOBoQ399Skux05Js6Sdjr1
         G0zh/rmJLYDMo+I/tBXo1mtiiKfsJsWuo6CjJ14CHD3lglfzDnoHYKxB/SI4gxdq0F8U
         J+j+GvMxXET7bAtB7Bg+NJ2A6yHsObWCp9mA3xYk40DoY/m8PXxpB+Q3Ka4L6QgZQaoa
         BsasF3UHovOpTQmOajBUgVkcekhbukApqRSVXdm/zhAAsCdsxBceu9wWKudElcIiETWM
         aOcA==
X-Gm-Message-State: AOAM531XkbRD5uYUg4m1l59Iq7h7GBgrufQsB/QigdDo423cXHI5gBfN
        ocH1GHDkImMWessTaFQ+G/WQZA==
X-Google-Smtp-Source: ABdhPJzWaBrIbWy1Gn3RmYAqSSx+0mMumwirKFFqogCYQtG1qxtNM3so9mUBItXCb//RX9HCWkhDEg==
X-Received: by 2002:a05:6e02:20ed:: with SMTP id q13mr26252658ilv.235.1619706440821;
        Thu, 29 Apr 2021 07:27:20 -0700 (PDT)
Received: from [192.168.1.30] ([65.144.74.34])
        by smtp.gmail.com with ESMTPSA id p1sm1453223ilp.10.2021.04.29.07.27.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Apr 2021 07:27:20 -0700 (PDT)
Subject: Re: [PATCH][next][V2] io_uring: Fix premature return from loop and
 memory leak
To:     Colin King <colin.king@canonical.com>,
        Pavel Begunkov <asml.silence@gmail.com>,
        io-uring@vger.kernel.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210429104602.62676-1-colin.king@canonical.com>
From:   Jens Axboe <axboe@kernel.dk>
Message-ID: <8513d853-fd44-c90f-26ba-45b763b8879a@kernel.dk>
Date:   Thu, 29 Apr 2021 08:27:20 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210429104602.62676-1-colin.king@canonical.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On 4/29/21 4:46 AM, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Currently the -EINVAL error return path is leaking memory allocated
> to data. Fix this by not returning immediately but instead setting
> the error return variable to -EINVAL and breaking out of the loop.
> 
> Kudos to Pavel Begunkov for suggesting a correct fix.

Applied, thanks.

-- 
Jens Axboe

