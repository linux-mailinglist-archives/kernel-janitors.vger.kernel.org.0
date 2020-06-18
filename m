Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9B88C1FF989
	for <lists+kernel-janitors@lfdr.de>; Thu, 18 Jun 2020 18:45:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731820AbgFRQpV (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Thu, 18 Jun 2020 12:45:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48046 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728090AbgFRQpU (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 18 Jun 2020 12:45:20 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F17F8C06174E
        for <kernel-janitors@vger.kernel.org>; Thu, 18 Jun 2020 09:45:19 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id r9so5828018wmh.2
        for <kernel-janitors@vger.kernel.org>; Thu, 18 Jun 2020 09:45:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:autocrypt:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=wE3Hof+fqWlqQcrDCyyvVA/YndyPZZfHGkmPaucOAeI=;
        b=EqyEiT91OMp4QI8FXWlveBeqHyyWz1o2vymK/BiltsHPHYprm8t1o1vZSXcYE5Qtx1
         Y1ni/H84QqPRcNpwyRArKqbKZryUar7UTM+PozbGvR3jjEmAie/bCu5jDO1zYztS/4kS
         GQMemI4b07NxjnZTNAmL7K/Ie9E8IGGBqQAftbeCx7Mfgklly2dZHUAmiiJ3ashaSHgi
         gIqpf7d6dMFYzWBLEsDKj65NyHMsG3LoWmJvNeSL1sdGycjlqPf7nnyi65dYzz7yp9/g
         XNIxI6/CRUF75Nl9XPyDofm7Wm4e3uWn2J3YvLGKb6btmOHx0y8yR2PrPBWt38/nwbM0
         O7dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-transfer-encoding:content-language;
        bh=wE3Hof+fqWlqQcrDCyyvVA/YndyPZZfHGkmPaucOAeI=;
        b=txWAL1leBT1b7YYsSKdqT06dighv9vUDfpMA4dv83UbUt+sTHCmzVHzz7yq9uEjrYm
         iMp7HJtH/KVYFPxqUdzw8Ri1FkciGgAqnqu9iNswDMWjYRQQNRwVRDXjdttOsPstyUEa
         0hEhqFAY3RGmgzKKCZJXYDmBXC8ZaNFskUBUXUTrieZLTXURz0WmvH7ryvR1t1/4A+Gw
         SN8D27SLfnptKEzKv923FRavY02rLnVnB3Ibwbt7eaUcAg3At+PEn9AXZ/0RZoW28do4
         Dgcu1QNw2yWRdP7MZMp83XLboc2wF69aeIyd3zz5DLV19iQHGbOYez2Kk/8dr8F9d9wP
         iZVQ==
X-Gm-Message-State: AOAM532p0mJc90a21oNHDDTPHT/PZDtVTMXUAAmLm2FxHWysJoVbR+vJ
        h11HtoFaGLnH/m7MUn1EEbs=
X-Google-Smtp-Source: ABdhPJz6jRY8q1JJyUqygop69jS0R1VvmTJyw3VlgoKwzrc47i7QI0F4bhTf//yfcRPDwHZzqFr6oA==
X-Received: by 2002:a1c:9acf:: with SMTP id c198mr4884077wme.172.1592498718258;
        Thu, 18 Jun 2020 09:45:18 -0700 (PDT)
Received: from [192.168.0.3] (host-82-61-132-230.retail.telecomitalia.it. [82.61.132.230])
        by smtp.gmail.com with ESMTPSA id y132sm4485818wmb.11.2020.06.18.09.45.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Jun 2020 09:45:17 -0700 (PDT)
Subject: Re: [help][coccinelle] coccicheck failed
To:     Julia Lawall <julia.lawall@inria.fr>
Cc:     kernel-janitors@vger.kernel.org,
        Randy Dunlap <rdunlap@infradead.org>
References: <47cba5b5-0d49-f6e8-09db-557a4c15f285@gmail.com>
 <alpine.DEB.2.22.394.2006181722410.2367@hadrien>
From:   Giacomo Picchiarelli <gpicchiarelli@gmail.com>
Autocrypt: addr=gpicchiarelli@gmail.com; keydata=
 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
Message-ID: <b4e2ddf9-1f58-025d-3583-cef8d994bb1c@gmail.com>
Date:   Thu, 18 Jun 2020 18:45:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.22.394.2006181722410.2367@hadrien>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

make coccicheck MODE=patch DEBUG_FILE=cocci3.err

result:

/usr/local/bin/spatch -D patch --very-quiet --cocci-file ./scripts/coccinelle/api/alloc/alloc_cast.cocci --no-includes --include-headers --dir . -I ./arch/x86/include -I ./arch/x86/include/generated -I ./include -I ./arch/x86/include/uapi -I ./arch/x86/include/generated/uapi -I ./include/uapi -I ./include/generated/uapi --include ./include/linux/kconfig.h --jobs 8 --chunksize 1

Python error: No module named coccilib.elems

Suggestions? Missing something?


On 18/06/20 17:23, Julia Lawall wrote:
>
> On Thu, 18 Jun 2020, Giacomo Picchiarelli wrote:
>
>> Newbie here. I couldn't try the patch attached.
> Hi,
>
> I'm not sure what you are trying to do.  The patch attached is a real
> patch, not a Coccinelle semantic patch.
>
>> I'm using coccinelle (spatch version 1.0.4 with Python support and with PCRE support),
>> I'm having issues with the following command:
>>
>> make coccicheck MODE=patch
>>
>> "./tools/testing/selftests/net/hwtstamp_config.c:74:45-46: WARNING: Use ARRAY_SIZE
>>
>> 807 811
>>
>> coccicheck failed"
> Randy's suggestion about DEBUG is good.  You can also get a more modern
> version of Coccinelle from github.
>
> julia

Hi Julia,
I'm actually having some issues with coccinelle compilation, I'm going to try with the newest version as soon as possible.
Thanks.

>
>
>> Applied to: commit 1b5044021070efa3259f3e9548dc35d1eb6aa844 (HEAD -> master, origin/master, origin/HEAD)
>> Merge: 69119673bd50 dbed452a078d
>> Author: Linus Torvalds <torvalds@linux-foundation.org>
>> Date:   Wed Jun 17 11:29:37 2020 -0700
>>
>> Suggestions?
>>
>> --
>> Giacomo Picchiarelli <gpicchiarelli@gmail.com>
>> GPG Key: 2E51 2591 F3E8 7CDC F504  140F 8559 3ACF 4691 ACC0
>>
>>
-- 
Giacomo Picchiarelli <gpicchiarelli@gmail.com>
GPG Key: 2E51 2591 F3E8 7CDC F504  140F 8559 3ACF 4691 ACC0

