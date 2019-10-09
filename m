Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ED163D1111
	for <lists+kernel-janitors@lfdr.de>; Wed,  9 Oct 2019 16:21:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731133AbfJIOVZ (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Wed, 9 Oct 2019 10:21:25 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:39144 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728019AbfJIOVY (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 9 Oct 2019 10:21:24 -0400
Received: by mail-lf1-f68.google.com with SMTP id 72so1812740lfh.6
        for <kernel-janitors@vger.kernel.org>; Wed, 09 Oct 2019 07:21:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rasmusvillemoes.dk; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=qjoBWNah/ifg5o3F6/ggCjuw7oqH/AZ2UOt9h6CGFbo=;
        b=I00cEMC2A7RAbE1W1pCwIixhLBGWr52k0GxZdw/bzo/vHaGVtYJNzsa3mvqv9fMuuz
         LDOZ1HkZC0eA1/W04lDYWq1c+2t6zT+xn5qVWOR4JqcXgJlwlvqtqoud48LR2Ih7lfSV
         wPdILcXkMgC0QS+RWPjvT5aQ+tdQ6WSOiD+y8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=qjoBWNah/ifg5o3F6/ggCjuw7oqH/AZ2UOt9h6CGFbo=;
        b=X5PXuR/nAEhybG8HPUdcnu/kWwCmkjW0v1GBuvIE3uX7Wwquc9ZncxFxuVMh58/vsc
         hZ2jD5so++2ea6cEqErXSVNRcZH2hN6PxY7TBKUysSFDYOfDWDXx0sZSy83ImI6s0Rlj
         WFa78Ps2BRjiWDV54yZdCd/WlhOCNPVz3rQnwlOgQMdijDq9gW0w2ZOP1OD7VZNOD76U
         26jr1O4UoCXIdWaGEu+UpMv9JbwjxaVpWq3X1g6f1/ASwiaDRw8FyElZsGODoKaopQB6
         +9buiSRli8PUmRBQISRaQ4i5thhzOZPNtg5NyQRzqJTYYExJgcsv+URqdNhxT/IdDRR+
         W0Hg==
X-Gm-Message-State: APjAAAW6jz8ZpBgJAjJxEiS17bkr+0xxQES1we3QOng/fdPqEUlragPP
        QHe7zgLFbMn+rY3i56Xr3BPR7gSnMcrZ/F2l
X-Google-Smtp-Source: APXvYqw+L3aQZrBXdYzZVx3ZDCtDAid9DfB/cNu5zr1fHVVnQlV8aAMeEHf6VZoH2ijwjIhvKJkGLw==
X-Received: by 2002:a19:ae05:: with SMTP id f5mr2216670lfc.165.1570630882856;
        Wed, 09 Oct 2019 07:21:22 -0700 (PDT)
Received: from [172.16.11.28] ([81.216.59.226])
        by smtp.gmail.com with ESMTPSA id z14sm500967lfh.30.2019.10.09.07.21.21
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 09 Oct 2019 07:21:22 -0700 (PDT)
Subject: Re: [PATCH] string.h: Mark 34 functions with __must_check
To:     Dan Carpenter <dan.carpenter@oracle.com>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>
Cc:     Markus Elfring <Markus.Elfring@web.de>,
        kernel-janitors@vger.kernel.org,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Joe Perches <joe@perches.com>,
        Kees Cook <keescook@chromium.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        LKML <linux-kernel@vger.kernel.org>
References: <75f70e5e-9ece-d6d1-a2c5-2f3ad79b9ccb@web.de>
 <954c5d70-742f-7b0e-57ad-ea967e93be89@rasmusvillemoes.dk>
 <20191009135522.GA20194@kadam>
From:   Rasmus Villemoes <linux@rasmusvillemoes.dk>
Message-ID: <b1f055ec-b4ec-d0ed-a03d-7d9828fa9440@rasmusvillemoes.dk>
Date:   Wed, 9 Oct 2019 16:21:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191009135522.GA20194@kadam>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On 09/10/2019 15.56, Dan Carpenter wrote:
> [ I haven't reviewed the original patch ]
> 
> On Wed, Oct 09, 2019 at 03:26:18PM +0200, Rasmus Villemoes wrote:
>> On 09/10/2019 14.14, Markus Elfring wrote:
>>> From: Markus Elfring <elfring@users.sourceforge.net>
>>> Date: Wed, 9 Oct 2019 13:53:59 +0200
>>>
>>> Several functions return values with which useful data processing
>>> should be performed. These values must not be ignored then.
>>> Thus use the annotation “__must_check” in the shown function declarations.
>>
>> This _might_ make sense for those that are basically kmalloc() wrappers
>> in one way or another [1]. But what's the point of annotating pure
>> functions such as strchr, strstr, memchr etc? Nobody is calling those
>> for their side effects (they don't have any...), so obviously the return
>> value is used. If somebody does a strcmp() without using the result, so
>> what? OK, it's odd code that might be worth flagging, but I don't think
>> that's the kind of thing one accidentally adds.
> 
> 
> 	if (ret) {
> 		-EINVAL;
> 	}
> 
> People do occasionally make mistakes like this.  It can't hurt to
> warn them as early as possible about nonsense code.

In that case, ret (which I guess comes from one of these functions) is
indeed used. And gcc should already complain about that "statement with
no effect" for the -EINVAL; line. So I don't see how adding these
annotations would change anything.

>> And, for the
>> standard C functions, -Wall already seems to warn about an unused
>> call:
>>
>>  #include <string.h>
>> int f(const char *s)
>> {
>> 	strlen(s);
>> 	return 3;
>> }
>> $ gcc -Wall -o a.o -c a.c
>> a.c: In function ‘f’:
>> a.c:5:2: warning: statement with no effect [-Wunused-value]
>>   strlen(s);
>>   ^~~~~~~~~
> 
> That's because glibc strlen is annotated with __attribute_pure__ which
> means it has no side effects.

I know, except it has nothing to do with glibc headers. Just try the
same thing in the kernel. gcc itself knows this about __builtin_strlen()
etc. If anything, we could annotate some of our non-standard functions
(say, memchr_inv) with __pure - then we'd both get the Wunused-value in
the nonsense cases, and allow gcc to optimize or reorder the calls.

Rasmus
