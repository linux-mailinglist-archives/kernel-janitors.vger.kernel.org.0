Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ED26957EF7
	for <lists+kernel-janitors@lfdr.de>; Thu, 27 Jun 2019 11:08:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726385AbfF0JIq (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Thu, 27 Jun 2019 05:08:46 -0400
Received: from foss.arm.com ([217.140.110.172]:49686 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725385AbfF0JIq (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 27 Jun 2019 05:08:46 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BEE6C2B;
        Thu, 27 Jun 2019 02:08:45 -0700 (PDT)
Received: from [192.168.1.18] (unknown [172.31.20.19])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5DDB93F718;
        Thu, 27 Jun 2019 02:08:45 -0700 (PDT)
Subject: Re: [bug report] lib/vdso: Provide generic VDSO implementation
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     kernel-janitors@vger.kernel.org
References: <20190627071521.GA22903@mwanda>
 <c23609d4-2aff-bc5e-afdf-53a4824a2ef7@arm.com> <20190627090734.GD5715@kadam>
From:   Vincenzo Frascino <vincenzo.frascino@arm.com>
Message-ID: <0d9880ff-b4a4-c0a2-f22a-a72bbc0ab754@arm.com>
Date:   Thu, 27 Jun 2019 10:09:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190627090734.GD5715@kadam>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hi Dan,

On 6/27/19 10:07 AM, Dan Carpenter wrote:
> On Thu, Jun 27, 2019 at 09:58:18AM +0100, Vincenzo Frascino wrote:
>>>    119	fallback:
>>>    120		return clock_gettime_fallback(clock, (struct __kernel_timespec *)res);
>>>                                                                                  ^^^
>>> On x86 this "res" always gets dereferenced.
>>>
>>>    121	}
>>>
>>
>> I am not sure I understand the details of this bug report. As far as I can see
>> "res" is never dereferenced in the vDSO library in this case, but it is passed
>> to the system call unchanged.
>>
> 
> Oh yeah.  Sorry.  My bad.  False positive.  clock_gettime_fallback()
> doesn't necessarily dereference "res".
> 

No problem, better a false positive than an ignored negative :-)

> regards,
> dan carpenter
> 

-- 
Regards,
Vincenzo
