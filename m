Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 416455807C
	for <lists+kernel-janitors@lfdr.de>; Thu, 27 Jun 2019 12:35:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726375AbfF0KfZ (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Thu, 27 Jun 2019 06:35:25 -0400
Received: from foss.arm.com ([217.140.110.172]:51218 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726308AbfF0KfZ (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 27 Jun 2019 06:35:25 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A6BE32B;
        Thu, 27 Jun 2019 03:35:24 -0700 (PDT)
Received: from [10.37.13.7] (unknown [10.37.13.7])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0EE2D3F718;
        Thu, 27 Jun 2019 03:35:23 -0700 (PDT)
Subject: Re: [bug report] lib/vdso: Provide generic VDSO implementation
To:     Dan Carpenter <dan.carpenter@oracle.com>,
        walter harms <wharms@bfs.de>
Cc:     kernel-janitors@vger.kernel.org
References: <20190627071521.GA22903@mwanda>
 <c23609d4-2aff-bc5e-afdf-53a4824a2ef7@arm.com> <20190627090734.GD5715@kadam>
 <0d9880ff-b4a4-c0a2-f22a-a72bbc0ab754@arm.com> <5D1499BE.9090701@bfs.de>
 <20190627103330.GA19015@kadam>
From:   Vincenzo Frascino <vincenzo.frascino@arm.com>
Message-ID: <657f28ef-91c8-d627-1903-142af38eebe5@arm.com>
Date:   Thu, 27 Jun 2019 11:36:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <20190627103330.GA19015@kadam>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org


On 6/27/19 11:33 AM, Dan Carpenter wrote:
> On Thu, Jun 27, 2019 at 12:26:06PM +0200, walter harms wrote:
>>
>>
>> Am 27.06.2019 11:09, schrieb Vincenzo Frascino:
>>> Hi Dan,
>>>
>>> On 6/27/19 10:07 AM, Dan Carpenter wrote:
>>>> On Thu, Jun 27, 2019 at 09:58:18AM +0100, Vincenzo Frascino wrote:
>>>>>>    119	fallback:
>>>>>>    120		return clock_gettime_fallback(clock, (struct __kernel_timespec *)res);
>>>>>>                                                                                  ^^^
>>>>>> On x86 this "res" always gets dereferenced.
>>>>>>
>>>>>>    121	}
>>>>>>
>>>>>
>>>>> I am not sure I understand the details of this bug report. As far as I can see
>>>>> "res" is never dereferenced in the vDSO library in this case, but it is passed
>>>>> to the system call unchanged.
>>>>>
>>>>
>>>> Oh yeah.  Sorry.  My bad.  False positive.  clock_gettime_fallback()
>>>> doesn't necessarily dereference "res".
>>>>
>>>
>>> No problem, better a false positive than an ignored negative :-)
>>>
>>
>> maybe it would be clever to add a comment here indicating that this
>> is intended and no problem ?
>>
> 
> No.  The correct response is to fix Smatch.  I will do it.
>

Agreed. Smatch should not report legitimate usages.

> regards,
> dan carpenter
> 

-- 
Regards,
Vincenzo
