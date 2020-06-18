Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7DFB21FFA0D
	for <lists+kernel-janitors@lfdr.de>; Thu, 18 Jun 2020 19:20:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732091AbgFRRUE (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Thu, 18 Jun 2020 13:20:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53374 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732087AbgFRRUE (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 18 Jun 2020 13:20:04 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C2B4C06174E
        for <kernel-janitors@vger.kernel.org>; Thu, 18 Jun 2020 10:20:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
        Subject:Sender:Reply-To:Content-ID:Content-Description;
        bh=wkXi8Ctf84pDB93s9pKfHjXr0AmbeF0pBJtd1w9g0eY=; b=MSReDTI+HSfF2PRF8TrjR2C5y9
        nV/tyWTZydOaFYbIcghNmL44nJPVf20l/JG1X3/6Oy7VFJ5QwhITan0g8CYCYKJBAbxFGsUfTuXl7
        66ciAGrZ74QhEVZKWt/Seq1e7U9xlv9AAWYw4c5sjZa5yxHbOaV4kYUEYD2E14/Mb4WHQ94rYItN2
        yGA4lk2CCaW+cSJQ/rYfg00gbGPGtBURSwF67pJ017UVO35B94bJciFYZsIYwpx9v9MeJRP3z2+xl
        v0tdOj15l70awb1bz7dsn3e1g2i3d01TZeEQXDv1QKBkSBWBoEd27xrd3u0+4FzVIXpDnxSyDEyTT
        00d4iVeg==;
Received: from [2601:1c0:6280:3f0::19c2]
        by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1jlyCk-00066w-To; Thu, 18 Jun 2020 17:19:58 +0000
Subject: Re: [help][coccinelle] coccicheck failed
To:     Giacomo Picchiarelli <gpicchiarelli@gmail.com>,
        Julia Lawall <julia.lawall@inria.fr>
Cc:     kernel-janitors@vger.kernel.org
References: <47cba5b5-0d49-f6e8-09db-557a4c15f285@gmail.com>
 <alpine.DEB.2.22.394.2006181722410.2367@hadrien>
 <b4e2ddf9-1f58-025d-3583-cef8d994bb1c@gmail.com>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <86fca9ee-4926-af6e-1d3b-da1e7a6ca3c9@infradead.org>
Date:   Thu, 18 Jun 2020 10:19:57 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <b4e2ddf9-1f58-025d-3583-cef8d994bb1c@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On 6/18/20 9:45 AM, Giacomo Picchiarelli wrote:
> make coccicheck MODE=patch DEBUG_FILE=cocci3.err
> 
> result:
> 
> /usr/local/bin/spatch -D patch --very-quiet --cocci-file ./scripts/coccinelle/api/alloc/alloc_cast.cocci --no-includes --include-headers --dir . -I ./arch/x86/include -I ./arch/x86/include/generated -I ./include -I ./arch/x86/include/uapi -I ./arch/x86/include/generated/uapi -I ./include/uapi -I ./include/generated/uapi --include ./include/linux/kconfig.h --jobs 8 --chunksize 1
> 
> Python error: No module named coccilib.elems
> 
> Suggestions? Missing something?
> 

It's looking in the wrong location for the library files.
(We went thru this just last week.)

This is what fixed it for me:

$ cd /usr/local/lib
$ sudo ln ../lib64/coccinelle coccinelle

so that spatch can find the library file(s) in /usr/local/lib64
instead of in /usr/local/lib.


> 
> On 18/06/20 17:23, Julia Lawall wrote:
>>
>> On Thu, 18 Jun 2020, Giacomo Picchiarelli wrote:
>>
>>> Newbie here. I couldn't try the patch attached.
>> Hi,
>>
>> I'm not sure what you are trying to do.  The patch attached is a real
>> patch, not a Coccinelle semantic patch.
>>
>>> I'm using coccinelle (spatch version 1.0.4 with Python support and with PCRE support),
>>> I'm having issues with the following command:
>>>
>>> make coccicheck MODE=patch
>>>
>>> "./tools/testing/selftests/net/hwtstamp_config.c:74:45-46: WARNING: Use ARRAY_SIZE
>>>
>>> 807 811
>>>
>>> coccicheck failed"
>> Randy's suggestion about DEBUG is good.  You can also get a more modern
>> version of Coccinelle from github.
>>
>> julia
> 
> Hi Julia,
> I'm actually having some issues with coccinelle compilation, I'm going to try with the newest version as soon as possible.
> Thanks.
> 
>>
>>
>>> Applied to: commit 1b5044021070efa3259f3e9548dc35d1eb6aa844 (HEAD -> master, origin/master, origin/HEAD)
>>> Merge: 69119673bd50 dbed452a078d
>>> Author: Linus Torvalds <torvalds@linux-foundation.org>
>>> Date:   Wed Jun 17 11:29:37 2020 -0700
>>>
>>> Suggestions?
>>>
>>> --
>>> Giacomo Picchiarelli <gpicchiarelli@gmail.com>
>>> GPG Key: 2E51 2591 F3E8 7CDC F504  140F 8559 3ACF 4691 ACC0
>>>
>>>


-- 
~Randy
Reported-by: Randy Dunlap <rdunlap@infradead.org>
