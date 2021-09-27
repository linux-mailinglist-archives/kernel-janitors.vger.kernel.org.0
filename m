Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 71BC24197E4
	for <lists+kernel-janitors@lfdr.de>; Mon, 27 Sep 2021 17:27:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235167AbhI0P3A (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Mon, 27 Sep 2021 11:29:00 -0400
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:47866
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235216AbhI0P27 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 27 Sep 2021 11:28:59 -0400
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com [209.85.167.69])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 6F7B740760
        for <kernel-janitors@vger.kernel.org>; Mon, 27 Sep 2021 15:27:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1632756440;
        bh=TEvTmXawav3p3718sDFwHiUvr6LYpQ2ZH+Yv6spht5I=;
        h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
         In-Reply-To:Content-Type;
        b=TaMny9Qjss1EEE9f2DjmDf1/qQ8zwnhKJgWkym/pDth/pkaAQ4NFJDBYnU2XG1RiR
         1ih+JEx+9NrEkQ8Hf57sxAwcfnHtApZisx//DN6ZYtclht0F0rBSqj66377iVkoHNY
         xZcta/C0YDlFu/gIBhoFp3m/OuJraQoxz0i/1OAc+9vOF4mHk4yAW34xpMmXDzRKQN
         hI0cYFwtLtK451qOI8qUbmA6O4jrGTNfqnJE+Gzb9EVMZlSCnS7BGBebyLYml3incZ
         HoJc3/riN8B+kyDKDoUtWHJubBdH5ceO62Kutyk5Ie1pGGDuskzhN2grdVsC4fkYkP
         m6KnubDjinq7g==
Received: by mail-lf1-f69.google.com with SMTP id o4-20020a056512230400b003fc39bb96c7so16239948lfu.8
        for <kernel-janitors@vger.kernel.org>; Mon, 27 Sep 2021 08:27:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=TEvTmXawav3p3718sDFwHiUvr6LYpQ2ZH+Yv6spht5I=;
        b=2nHYntiZuEKQJLFhwUEdeZeszOh6j8IHfycwDkIZ6fqe9rdiqXm9VcIWfVZMcPeSZ1
         HF/WrDa9OczrlWURSz11AwgnGp7MGhLHFDpzxcGdeWC5dmZVJd7NehzonV+b+IdqYAfa
         9Tynwyn4t+PdwlSuOv/cze7Hxozyc3IlzOWrudtXBC0055WxZymqghvuC9u/2PA5rRQn
         wkkoGpWVHJCPsKq5Tnub/9mW7pyc5OKuC8GgeonoQaPqvjz385T7Or8+dY54SEewSff3
         41J/ZeC0N2MsqgSuCwc5i5ybK5nGOE9FvpLOJm3djQxSq96mHmYqnmajfUxYjqnPiLmR
         UZpw==
X-Gm-Message-State: AOAM532pRlROh2wsHOB9PDp2erbImFYkug3F1Oa90+uzInoug6aJ5Hz1
        7G4w76RsH81JjCeawvAP0sefxI26B8T/MiXh58w9UzKyPJ0rsY1Cz9AZ8pOfenau+5cPJL5un1/
        ycC1RBKwmBMeHMVSWZbURf6qK1VQN9fiXAXeOK2iTJlhSbQ==
X-Received: by 2002:ac2:53a5:: with SMTP id j5mr378278lfh.652.1632756439410;
        Mon, 27 Sep 2021 08:27:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzeGPaUVIewN3xJKSkoLfIVl/EUjkYs5iuKgww20KE4cYB95Dt5Frl7nfS8NkWWP+rwCj2Z6A==
X-Received: by 2002:ac2:53a5:: with SMTP id j5mr378257lfh.652.1632756439244;
        Mon, 27 Sep 2021 08:27:19 -0700 (PDT)
Received: from [192.168.0.20] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id z10sm2161162ljc.117.2021.09.27.08.27.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Sep 2021 08:27:18 -0700 (PDT)
Subject: Re: [PATCH net] nfc: avoid potential race condition
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Jakub Kicinski <kuba@kernel.org>,
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
 <1af270c3-8a4f-6c62-bb6c-b454a507f443@canonical.com>
 <20210927151325.GJ2083@kadam>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <b05d4811-d207-1bfc-a56a-81b44808b7bf@canonical.com>
Date:   Mon, 27 Sep 2021 17:27:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210927151325.GJ2083@kadam>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On 27/09/2021 17:13, Dan Carpenter wrote:
> On Mon, Sep 27, 2021 at 04:58:45PM +0200, Krzysztof Kozlowski wrote:
>> On 27/09/2021 16:26, Jakub Kicinski wrote:
>>> On Mon, 27 Sep 2021 09:44:08 +0200 Krzysztof Kozlowski wrote:
>>>> On 24/09/2021 22:14, Jakub Kicinski wrote:
>>>>> On Fri, 24 Sep 2021 10:21:33 +0200 Krzysztof Kozlowski wrote:  
>>>>>> Indeed. The code looks reasonable, though, so even if race is not really
>>>>>> reproducible:
>>>>>>
>>>>>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>  
>>>>>
>>>>> Would you mind making a call if this is net (which will mean stable) or
>>>>> net-next material (without the Fixes tags) and reposting? Thanks! :)  
>>>>
>>>> Hi Jakub,
>>>>
>>>> Material is net-next. However I don't understand why it should be
>>>> without "Fixes" in such case?
>>>>
>>>> The material going to current release (RC, so I understood: net), should
>>>> fix only issues introduced in current merge window. Linus made it clear
>>>> several times.
>>>
>>> Oh, really? I've never heard about this rule, would you be able to dig
>>> up references?
>>
>> Not that easy to go through thousands of emails, but I'll try:
>>
>> "One thing that does bother him is developers who send him fixes in the
>> -rc2 or -rc3 time frame for things that never worked in the first place.
>> If something never worked, then the fact that it doesn't work now is not
>> a regression, so the fixes should just wait for the next merge window.
>> Those fixes are, after all, essentially development work."
>> https://lwn.net/Articles/705245/ 
> 
> Yes.  He's talking about fixes to new features which don't work at all.

Here yes. In other places, it's narrower:
"The rc stuff is for regressions, and for things that actually are
nasty problems (security, keeping people from getting work done)."

> 
> I once discovered a module that had a bug in probe() and it had never
> once been able to probe without crashing.  It had been in the kernel for
> ten years.  The developer was like, "Yeah.  We knew it was crap and
> wanted to delete it but that was before git and Linus lost the patch."
>
> Anyway, this is a security bug (DoS at the minimum) so it should be
> merged into net and set to stable.

I don't mind, just take in mind that Sasha Levin was also pointing out
that quality of fixes applied for RC is poor and usually does not
receive proper testing or settle time.

Someone tested this fix? I did not.

Best regards,
Krzysztof
