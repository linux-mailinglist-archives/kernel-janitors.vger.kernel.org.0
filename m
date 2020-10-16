Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 014CE290853
	for <lists+kernel-janitors@lfdr.de>; Fri, 16 Oct 2020 17:29:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405614AbgJPP3M (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Fri, 16 Oct 2020 11:29:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35354 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2395514AbgJPP3L (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 16 Oct 2020 11:29:11 -0400
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C848DC0613D3
        for <kernel-janitors@vger.kernel.org>; Fri, 16 Oct 2020 08:29:11 -0700 (PDT)
Received: by mail-pl1-x643.google.com with SMTP id d23so1466899pll.7
        for <kernel-janitors@vger.kernel.org>; Fri, 16 Oct 2020 08:29:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=ATPJ8G5Rmg2jkq9+2I73bf4/KgUptQXil2wgPNMHeQk=;
        b=Q44QOqngKKJ/Zmzmj6EmNbdx8ZS2w3pCGWlQWQVYcPlSztZkmr/0S1llaVBI1hiDJB
         1d6/uTZOJ4LAmH5oKWTI/3bgjb3zMQAzvIk0xgLmrnpD+BjG8muHCv4tZIhJtnq6Wpx2
         hEzspvd1UFlDMse7XufdYo7lR3ph/OdbAEgupMV7hT4MtQWne11+S1qKp2XHW7MIoCkX
         ceQohpfd6pXkCn3eWKVA4gYr0KiYkyQCyrCvJ1fTNbr54ubMlx6gsjKJHGoL6IwP8Dgx
         bO2HY/c1FCDbBNNbTW1owULlU5Ys6+1FkAmDX1KgOrB6quRjz8QL7CrHE4l8e4iJEQv7
         sUPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ATPJ8G5Rmg2jkq9+2I73bf4/KgUptQXil2wgPNMHeQk=;
        b=Cr7HuHCz/FaS3Gh6IcN1goOumBLPKBWP8TFbj+N8rD74ttAcXGpjPb+KHZUwDb/APY
         9QgT2ac6aZeWTphKmOhtbCIFEqwVP0M8zZ+J2/AfF0CZqeq94RZ9OlEUnujizGWlXj2c
         Hr9ZTKYoMXWdViAZdaC2upW+HJVU26SdhYA8VdvigF6AcJshzwMEsc/HicFPBr2xTBPY
         +15gHa4R+ByxeYUTOoCLmaADvuRYTaDYdWrYx0KvsdS7kPgXiBY2HLiw95FZlRsnOMkE
         vEhI3nLPLI77dCuqB7+Okro5954/NiPJ+aZbiN8Nsskw+uqJZxKs0u4gLbOUmdENUgRX
         8qcw==
X-Gm-Message-State: AOAM530iqpvCohJnJnPcfCVWGoZH4q6qNAdL1DzeariXLxjC7fXstnVn
        usyKLXBavsAR8FPiJdwMtdz5uw==
X-Google-Smtp-Source: ABdhPJyCjZq9ngO0zedh/4UnOXi8mIRRpTCWkpmy4XRTD6RWyWtogUjES0IBbmEJUp22Yke7kN59dg==
X-Received: by 2002:a17:902:c408:b029:d4:c99a:19e8 with SMTP id k8-20020a170902c408b02900d4c99a19e8mr4674795plk.8.1602862151187;
        Fri, 16 Oct 2020 08:29:11 -0700 (PDT)
Received: from [192.168.1.134] ([66.219.217.173])
        by smtp.gmail.com with ESMTPSA id q5sm3210581pfb.184.2020.10.16.08.29.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Oct 2020 08:29:10 -0700 (PDT)
Subject: Re: [PATCH] lightnvm: fix out-of-bounds write to array
 devices->info[]
To:     Colin King <colin.king@canonical.com>,
        Matias Bjorling <mb@lightnvm.io>,
        =?UTF-8?Q?Matias_Bj=c3=b8rling?= <m@bjorling.me>,
        linux-block@vger.kernel.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20201016143351.677352-1-colin.king@canonical.com>
From:   Jens Axboe <axboe@kernel.dk>
Message-ID: <36ff7b17-eb2f-780d-17ca-269a8f5d4aac@kernel.dk>
Date:   Fri, 16 Oct 2020 09:29:09 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201016143351.677352-1-colin.king@canonical.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On 10/16/20 8:33 AM, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> There is an off-by-one array check that can lead to a out-of-bounds
> write to devices->info[i].  Fix this by checking by using >= rather
> than > for the size check. Also replace hard-coded array size limit
> with ARRAY_SIZE on the array.

Applied, thanks.

-- 
Jens Axboe

