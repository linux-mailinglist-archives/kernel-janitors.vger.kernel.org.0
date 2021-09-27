Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AE7CF4196DB
	for <lists+kernel-janitors@lfdr.de>; Mon, 27 Sep 2021 16:58:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234944AbhI0PAb (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Mon, 27 Sep 2021 11:00:31 -0400
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:46470
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234898AbhI0PAb (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 27 Sep 2021 11:00:31 -0400
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com [209.85.167.69])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id B9D3C4082A
        for <kernel-janitors@vger.kernel.org>; Mon, 27 Sep 2021 14:58:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1632754728;
        bh=YkQD8yFd4O8EbKG+9cSOvBRyN2Xne4dO4Y5DpUxHX54=;
        h=To:Cc:References:From:Subject:Message-ID:Date:MIME-Version:
         In-Reply-To:Content-Type;
        b=A+/rji+y/JKtqxSnI38p/4p7m+RJxytbdz9lO/uhFqhuDTfcD5Y7cSiVRliwxdpqT
         8m7/2wb+RWapffyRrK114UvWq0PKj3c5FWimurWnONUSVKhFIoMdAKoeXiyhz2d0GL
         pACVGxeUyBK++TkVOkB8GT23kt6wzD2EPrJZPx4ItYV4ip9O3HNm2lKxY3I83xHuuZ
         PUzhCjgjYubQTdS/vuucpF9dLQ/uP1rGxvGKmjY6IAU4pz/UlNaz8hTYSyeVuAfkyX
         ib3lH5NlBNSvC6EWfUv7UVmI4ED39rSzmGfMsutxNYQK887EikhVq0pgW0Zc5V2f+d
         Ce01wKhNZvNvw==
Received: by mail-lf1-f69.google.com with SMTP id m2-20020ac24ac2000000b003f524eae63eso16196696lfp.10
        for <kernel-janitors@vger.kernel.org>; Mon, 27 Sep 2021 07:58:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:to:cc:references:from:subject:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=YkQD8yFd4O8EbKG+9cSOvBRyN2Xne4dO4Y5DpUxHX54=;
        b=wag4gUGbBRYhBNK/KCLk4m2IZGvqbTlbg3Qoj2eiccL/mo+BZr4/yxMHMDEwz6+7sN
         FbwT0w8fDNivkQOknEdEGQI6ESFiGHr09DVZC9oAbsHQgdEtfrHrGYmekf3bjPrCaPG1
         Lzm8cGFd5zvMH3sUWtjh6lgONNEYZnpnLK22c1x6AQGAJ2d3OcBfCx84rU0vdEtDjdkc
         GutRMtXa8+lsSva8QrzedbZh85if+zX9jXdH3y75hrH0QCCBewlJJAoxdWYhhggesAsz
         yo4+lyShFILsqbSoPb+irWD8TYM3exZYicrWp43IUjZ3eyQLBRcyduggeCeO79s+wSD2
         JJ1A==
X-Gm-Message-State: AOAM531WF90zsjrpa71eHBrZPBl4Xo+NpH7LpyySJEqZJfZ9aCxVsz3t
        hDPjkilnoosBIUMS6HVy31FYamM7Y1Etmr9gLEdUJwYD6x8SIe8e3r9p9JSDqkzdL2Ecwu+0Lql
        iDz+X01JMQJ1iUcMVKi8HwVteOBUvT6P3PgpvHWlW6ZiSLg==
X-Received: by 2002:a05:651c:1549:: with SMTP id y9mr294327ljp.105.1632754727920;
        Mon, 27 Sep 2021 07:58:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxGQEcQZvq0mLm/sCvA+U9F40boKH/+y9ERdfUVb3b4eyeDP+ncRyKGhhLRvzSjD1ZIm36oeQ==
X-Received: by 2002:a05:651c:1549:: with SMTP id y9mr294309ljp.105.1632754727731;
        Mon, 27 Sep 2021 07:58:47 -0700 (PDT)
Received: from [192.168.0.20] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id m25sm711242lji.52.2021.09.27.07.58.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Sep 2021 07:58:47 -0700 (PDT)
To:     Jakub Kicinski <kuba@kernel.org>
Cc:     Dan Carpenter <dan.carpenter@oracle.com>,
        Samuel Ortiz <sameo@linux.intel.com>,
        "David S. Miller" <davem@davemloft.net>,
        "John W. Linville" <linville@tuxdriver.com>,
        netdev@vger.kernel.org, kernel-janitors@vger.kernel.org
References: <20210923065051.GA25122@kili>
 <3760c70c-299c-89bf-5a4a-22e8d564ef92@canonical.com>
 <20210923122220.GB2083@kadam>
 <47358bea-e761-b823-dfbd-cd8e0a2a69a6@canonical.com>
 <20210924131441.6598ba3a@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
 <81b648d2-0e20-e5ac-e2ff-a1b8b8ea83a8@canonical.com>
 <20210927072605.45291daf@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Subject: Re: [PATCH net] nfc: avoid potential race condition
Message-ID: <1af270c3-8a4f-6c62-bb6c-b454a507f443@canonical.com>
Date:   Mon, 27 Sep 2021 16:58:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210927072605.45291daf@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On 27/09/2021 16:26, Jakub Kicinski wrote:
> On Mon, 27 Sep 2021 09:44:08 +0200 Krzysztof Kozlowski wrote:
>> On 24/09/2021 22:14, Jakub Kicinski wrote:
>>> On Fri, 24 Sep 2021 10:21:33 +0200 Krzysztof Kozlowski wrote:  
>>>> Indeed. The code looks reasonable, though, so even if race is not really
>>>> reproducible:
>>>>
>>>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>  
>>>
>>> Would you mind making a call if this is net (which will mean stable) or
>>> net-next material (without the Fixes tags) and reposting? Thanks! :)  
>>
>> Hi Jakub,
>>
>> Material is net-next. However I don't understand why it should be
>> without "Fixes" in such case?
>>
>> The material going to current release (RC, so I understood: net), should
>> fix only issues introduced in current merge window. Linus made it clear
>> several times.
> 
> Oh, really? I've never heard about this rule, would you be able to dig
> up references?

Not that easy to go through thousands of emails, but I'll try:

"One thing that does bother him is developers who send him fixes in the
-rc2 or -rc3 time frame for things that never worked in the first place.
If something never worked, then the fact that it doesn't work now is not
a regression, so the fixes should just wait for the next merge window.
Those fixes are, after all, essentially development work."
https://lwn.net/Articles/705245/

"The rc stuff is for regressions, and for things that actually are
nasty problems (security, keeping people from getting work done)."
https://lore.kernel.org/lkml/CA+55aFyn1matXDTkeDA1d2+tHBSVkBvS5kP-7Ngh86=uut+yyg@mail.gmail.com/

"NONE of this seems really to be appropriate for this stage. It doesn't
fix regressions, it doesn't fix security stuff, it doesn't really fix
major oopses."
https://lore.kernel.org/lkml/CA+55aFyvW38WU93CqegHiKt-ReO8yNfAOUGZRFGY3-Aq0UsETw@mail.gmail.com/

"No, I definitely don't want anything now unless it's a major
regression or security issue. Other stuff can wait until the merge
window and perhaps be marked for stable if required. That way they'll
get testing."
https://lore.kernel.org/lkml/CA+55aFyWcdmy3ACAWmRq70kQDpJ3bkjv1nROd1Gvab1Aa-GHqA@mail.gmail.com/

Linux seems to be flexible around that as he also pulls several fixes
which were broken before.


> This strikes me as odd, most fixes we merge are for previous releases.
> In fact when I write -rc pull requests to Linus I break them down by
> current release vs previous - and he never complained.

True, I noticed it. Maybe the rule is much less stricter than I
understood it.

> 
>> The issue here was introduced long time ago, not in current merge
>> window, however it is still an issue to fix. It's still a bug which
>> should have a commit with "Fixes" for all the stable tress and
>> downstream distros relying on stable kernels. Also for some statistics
>> on LWN.
> 
> Stable will not pull the commit from net-next, tho. Stable is more
> restrictive than rc (or at least so I think) so "we want it in stable,
> please merge it to net-next" does not compute with the preconceptions 
> I have.

There is no single need for stable to pull the commit from net-next. The
net-next commits will reach the Linus' tree sometime in the future (next
merge window) and then it will go to stable. That's the process. No need
to push such fix earlier, in a rush, for something broken long time ago
and not being a significant regression or bug.


Best regards,
Krzysztof
