Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1D6321E66E1
	for <lists+kernel-janitors@lfdr.de>; Thu, 28 May 2020 17:55:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404812AbgE1PzP (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Thu, 28 May 2020 11:55:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55536 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404650AbgE1PzN (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 28 May 2020 11:55:13 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8386BC08C5C7
        for <kernel-janitors@vger.kernel.org>; Thu, 28 May 2020 08:55:12 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id l11so28549269wru.0
        for <kernel-janitors@vger.kernel.org>; Thu, 28 May 2020 08:55:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cumulusnetworks.com; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=rPnjGxRsCWeo1VTeDEJmk4OeDZHaRPMkdFbDM+u0itI=;
        b=XfMisC5oOam+U4xw6XrPGGVCSfLiK/gq2dhLxiol2VGNCge2T7s/WJbv2fzeF+qT7L
         9kiXhrXs+6QaM5DKfmK40xckvafwDHPbqR6h+9931sThTrH6zNwfGVEw9v82UtrcHGhr
         Qgzn9YdyjKRqLw09txzM22qJ647mLxizuT1KQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=rPnjGxRsCWeo1VTeDEJmk4OeDZHaRPMkdFbDM+u0itI=;
        b=f1P5DZnHly4naoWqyHle6xvxyKxQreSDLxyeIUyz7dNDQKIuQI7RAS6FfqHK7NMMDy
         61rWl+bAq0zgIPhEKhF9wPBOJV9R0jhnrBeBLs8zDPhDMTJdAZBFlUTXojn25QsL451Y
         pQuExaC8kDVBQbNMsvqTOB+aWdnwcVUFSBXbTUGtLWPV++QDVbUYHOQGkQ3lRwJK2ygt
         proxkDGziJyGveNnCBfN/k8iNRhOySdmDyF+4i+VtgK3/gH3fS0eokTvgbdUr5rRbFe6
         42PLWKIqFq1XVNNw1KEswIjlmB23NTRse4o7k/urErdrNuyFwPTxJP2cFP7u9iGZVXge
         n1dA==
X-Gm-Message-State: AOAM530Hw2L3Fj3oP/o43iUE1SkISz4dp96Bvl8eD2HjB28wBQ/rGlJP
        BMuMo8Op3Og9z5SZlJJ3nos6qA==
X-Google-Smtp-Source: ABdhPJz2Yq5gIDJWXEeL+lkV+hX987rQm2RhtCDhU9wMvl60O/uC897n1c/+s40srdnjxMDgkdO35w==
X-Received: by 2002:adf:a55c:: with SMTP id j28mr4004820wrb.369.1590681311222;
        Thu, 28 May 2020 08:55:11 -0700 (PDT)
Received: from [192.168.51.243] ([78.128.78.220])
        by smtp.gmail.com with ESMTPSA id h15sm6158467wrt.73.2020.05.28.08.55.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 May 2020 08:55:10 -0700 (PDT)
Subject: Re: [PATCH][net-next] nexthop: fix incorrect allocation failure on
 nhg->spare
To:     Colin Ian King <colin.king@canonical.com>,
        David Ahern <dsahern@kernel.org>,
        "David S . Miller" <davem@davemloft.net>,
        Alexey Kuznetsov <kuznet@ms2.inr.ac.ru>,
        Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>,
        Jakub Kicinski <kuba@kernel.org>, netdev@vger.kernel.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20200528145114.420100-1-colin.king@canonical.com>
 <8b73e872-c05e-e93f-1d2d-3466da4ddbcc@cumulusnetworks.com>
 <b0852a83-c3a5-a1be-6554-dc035e5b3d6e@cumulusnetworks.com>
 <b9cedb4b-d1bf-fd6d-f85e-444840c3924b@canonical.com>
From:   Nikolay Aleksandrov <nikolay@cumulusnetworks.com>
Message-ID: <e2c038f3-4990-d958-84a8-2aeaba8195f5@cumulusnetworks.com>
Date:   Thu, 28 May 2020 18:55:09 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <b9cedb4b-d1bf-fd6d-f85e-444840c3924b@canonical.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On 28/05/2020 18:53, Colin Ian King wrote:
> On 28/05/2020 15:55, Nikolay Aleksandrov wrote:
>> On 28/05/2020 17:53, Nikolay Aleksandrov wrote:
>>> On 28/05/2020 17:51, Colin King wrote:
>>>> From: Colin Ian King <colin.king@canonical.com>
>>>>
>>>> The allocation failure check for nhg->spare is currently checking
>>>> the pointer nhg rather than nhg->spare which is never false. Fix
>>>> this by checking nhg->spare instead.
>>>>
>>>> Addresses-Coverity: ("Logically dead code")
>>>> Fixes: 430a049190de ("nexthop: Add support for nexthop groups")
>>>> Signed-off-by: Colin Ian King <colin.king@canonical.com>
>>>> ---
>>>>  net/ipv4/nexthop.c | 2 +-
>>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>>
>>>> diff --git a/net/ipv4/nexthop.c b/net/ipv4/nexthop.c
>>>> index ebafa5ed91ac..97423d6f2de9 100644
>>>> --- a/net/ipv4/nexthop.c
>>>> +++ b/net/ipv4/nexthop.c
>>>> @@ -1185,7 +1185,7 @@ static struct nexthop *nexthop_create_group(struct net *net,
>>>>  
>>>>  	/* spare group used for removals */
>>>>  	nhg->spare = nexthop_grp_alloc(num_nh);
>>>> -	if (!nhg) {
>>>> +	if (!nhg->spare) {
>>>>  		kfree(nhg);
>>>>  		kfree(nh);
>>>>  		return NULL;
>>>>
>>>
>>> Good catch, embarrassing copy paste error :-/
>>> Acked-by: Nikolay Aleksandrov <nikolay@cumulusnetworks.com>
>>>
>>
>> Wait - that should be targeted at -net, that's where the fixes went.
>> And the fixes tag is wrong, nhg->spare was very recently added by:
>> commit 90f33bffa382
>> Author: Nikolay Aleksandrov <nikolay@cumulusnetworks.com>
>> Date:   Tue May 26 12:56:15 2020 -0600
>>
>>     nexthops: don't modify published nexthop groups
>>
> 
> Do you require me to fix this up and re-send?
> 
> Colin
> 

Up to you, it will go to the same stable releases as that fix used the same
Fixes tag, so it's really not an issue.

