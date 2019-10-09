Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3C7CBD0FF9
	for <lists+kernel-janitors@lfdr.de>; Wed,  9 Oct 2019 15:26:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731331AbfJIN0Y (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Wed, 9 Oct 2019 09:26:24 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:45325 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731255AbfJIN0X (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 9 Oct 2019 09:26:23 -0400
Received: by mail-lj1-f196.google.com with SMTP id q64so2460311ljb.12
        for <kernel-janitors@vger.kernel.org>; Wed, 09 Oct 2019 06:26:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rasmusvillemoes.dk; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=WJWP5QMUkAgHs6BnCYZNp8h84d1YBL5Bm1yud/rHHZg=;
        b=Jm+mF2rDsCJLcrUlB0SLiwko2Z9Ves98s22gSAsrBVZEVcVXfdwdOX7ZJbB2fF3d2T
         vKttvPExXAug4yqPWc4vwbzwUhsxX/Uy7mwYXY4KALSDq+YjoBb0exsJD8/Ho6kGT+bE
         dqiCaslb16ZKB+zIWqGcpDxrd2wnBcHzk+Hzg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=WJWP5QMUkAgHs6BnCYZNp8h84d1YBL5Bm1yud/rHHZg=;
        b=VOjUz3o89vhh0P6ZDRub1PInVjcGo7DckbzpzKL2TAAFsjWoyTikKaInlkAGUHBXdh
         463uaeQE4TjkFKgbirmyp/Hh2S+uqEimUgEggEvuk3MT0o+wyx4kY2Q7YOkTi/RA3Gnf
         vFdoj8loQkKg8k0w0F/tMKjy6fzgitdvtWi21JRT0vZxzFsODUG7OTPmo7Tscv9L80z5
         u4Iw8xEFU+sU2ZTpCwkDpeZEEOrd5cIES9Ng3ictnFobhlS/A5iVA9N6QHGPm/tT5e8L
         NviLoWjpX8Ey45Ylf4nbJMaoHAyzzTxpf+4RfRB9vLxyQrsj00RtoW8241YSj5VdIdJp
         CGLg==
X-Gm-Message-State: APjAAAUiVPWV6MkNSxwyaF+ZJfUdWn7/qVrj8ItuduqsZjAqz3UaZ0xb
        rW23haHSrLh3M08ARNv2pakxaQ==
X-Google-Smtp-Source: APXvYqy4mU7KScbhHDcIf4/Gp+K03M2QERvYtcI9RxomBaOLKIoCVSOFjmrd7KC6npByX6cOnQC0jw==
X-Received: by 2002:a2e:2943:: with SMTP id u64mr2382988lje.241.1570627580325;
        Wed, 09 Oct 2019 06:26:20 -0700 (PDT)
Received: from [172.16.11.28] ([81.216.59.226])
        by smtp.gmail.com with ESMTPSA id r19sm472597ljd.95.2019.10.09.06.26.18
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 09 Oct 2019 06:26:19 -0700 (PDT)
Subject: Re: [PATCH] string.h: Mark 34 functions with __must_check
To:     Markus Elfring <Markus.Elfring@web.de>,
        kernel-janitors@vger.kernel.org,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Joe Perches <joe@perches.com>,
        Kees Cook <keescook@chromium.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Steven Rostedt <rostedt@goodmis.org>
Cc:     LKML <linux-kernel@vger.kernel.org>
References: <75f70e5e-9ece-d6d1-a2c5-2f3ad79b9ccb@web.de>
From:   Rasmus Villemoes <linux@rasmusvillemoes.dk>
Message-ID: <954c5d70-742f-7b0e-57ad-ea967e93be89@rasmusvillemoes.dk>
Date:   Wed, 9 Oct 2019 15:26:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <75f70e5e-9ece-d6d1-a2c5-2f3ad79b9ccb@web.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On 09/10/2019 14.14, Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Wed, 9 Oct 2019 13:53:59 +0200
> 
> Several functions return values with which useful data processing
> should be performed. These values must not be ignored then.
> Thus use the annotation “__must_check” in the shown function declarations.

This _might_ make sense for those that are basically kmalloc() wrappers
in one way or another [1]. But what's the point of annotating pure
functions such as strchr, strstr, memchr etc? Nobody is calling those
for their side effects (they don't have any...), so obviously the return
value is used. If somebody does a strcmp() without using the result, so
what? OK, it's odd code that might be worth flagging, but I don't think
that's the kind of thing one accidentally adds. You're also not
consistent - strlen() is not annotated. And, for the standard C
functions, -Wall already seems to warn about an unused call:

 #include <string.h>
int f(const char *s)
{
	strlen(s);
	return 3;
}
$ gcc -Wall -o a.o -c a.c
a.c: In function ‘f’:
a.c:5:2: warning: statement with no effect [-Wunused-value]
  strlen(s);
  ^~~~~~~~~

[1] Just might. The problem is the __must_check does not mean that the
return value must be followed by a comparison to NULL and bailing out
(that can't really be checked), it simply ensures the return value is
assigned somewhere or used in an if(). So foo->bar = kstrdup() not
followed by a check of foo->bar won't warn. So one would essentially
only catch instant-leaks. __must_check is much better suited for
functions that mutate a passed-in or global object, e.g.
start_engine(engine).

Rasmus
