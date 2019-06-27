Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BA81E57EC8
	for <lists+kernel-janitors@lfdr.de>; Thu, 27 Jun 2019 10:57:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726382AbfF0I5b (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Thu, 27 Jun 2019 04:57:31 -0400
Received: from foss.arm.com ([217.140.110.172]:49536 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726295AbfF0I5b (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 27 Jun 2019 04:57:31 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 577D82B;
        Thu, 27 Jun 2019 01:57:28 -0700 (PDT)
Received: from [192.168.1.18] (unknown [172.31.20.19])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E7E343F718;
        Thu, 27 Jun 2019 01:57:27 -0700 (PDT)
Subject: Re: [bug report] lib/vdso: Provide generic VDSO implementation
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     kernel-janitors@vger.kernel.org
References: <20190627071521.GA22903@mwanda>
From:   Vincenzo Frascino <vincenzo.frascino@arm.com>
Message-ID: <c23609d4-2aff-bc5e-afdf-53a4824a2ef7@arm.com>
Date:   Thu, 27 Jun 2019 09:58:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190627071521.GA22903@mwanda>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hi Dan,

thank you for testing my patches.

On 6/27/19 8:15 AM, Dan Carpenter wrote:
> Hello Vincenzo Frascino,
> 
> This is a semi-automatic email about new static checker warnings.
> 
> The patch 00b26474c2f1: "lib/vdso: Provide generic VDSO
> implementation" from Jun 21, 2019, leads to the following Smatch
> complaint:
> 
>     arch/x86/entry/vdso/vdso32/../../../../../lib/vdso/gettimeofday.c:120 __cvdso_clock_gettime32()
>     error: we previously assumed 'res' could be null (see line 107)
> 
> lib/vdso/gettimeofday.c
>    101  static __maybe_unused int
>    102  __cvdso_clock_gettime32(clockid_t clock, struct old_timespec32 *res)
>    103  {
>    104          struct __kernel_timespec ts;
>    105          int ret;
>    106	
>    107		if (res == NULL)
>                     ^^^^^^^^^^^
>    108			goto fallback;
>    109	
>    110		ret = __cvdso_clock_gettime(clock, &ts);
>    111	
>    112		if (ret == 0) {
>    113			res->tv_sec = ts.tv_sec;
>    114			res->tv_nsec = ts.tv_nsec;
>    115		}
>    116	
>    117		return ret;
>    118	
>    119	fallback:
>    120		return clock_gettime_fallback(clock, (struct __kernel_timespec *)res);
>                                                                                  ^^^
> On x86 this "res" always gets dereferenced.
> 
>    121	}
> 

I am not sure I understand the details of this bug report. As far as I can see
"res" is never dereferenced in the vDSO library in this case, but it is passed
to the system call unchanged.

static __always_inline
long clock_gettime_fallback(clockid_t _clkid, struct __kernel_timespec *_ts)
{
	long ret;

	asm ("syscall" : "=a" (ret), "=m" (*_ts) :
	     "0" (__NR_clock_gettime), "D" (_clkid), "S" (_ts) :
	     "rcx", "r11");

	return ret;
}

This is done to maintain consistency in between the returned error code of the
syscall and of the vDSO library.

Could you please elaborate on why this bug has been reported?

> regards,
> dan carpenter
> 

-- 
Regards,
Vincenzo
