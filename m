Return-Path: <kernel-janitors+bounces-1787-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E7BB85AA9B
	for <lists+kernel-janitors@lfdr.de>; Mon, 19 Feb 2024 19:11:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 819D11C219C0
	for <lists+kernel-janitors@lfdr.de>; Mon, 19 Feb 2024 18:11:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B29BF482D7;
	Mon, 19 Feb 2024 18:11:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="F6tpps14"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from smtp.smtpout.orange.fr (smtp-30.smtpout.orange.fr [80.12.242.30])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18EC5481B2
	for <kernel-janitors@vger.kernel.org>; Mon, 19 Feb 2024 18:11:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708366284; cv=none; b=LQMbXF7NhxFpKtn6EhPU20VVwCbHBrroJD0lkoYLxIGpOGzP7vPfHMI47oeZ5On+VX+1bWFxqk1wZwQbAa2T/XFb3lXd0QE5EYFq/tA5gW7uIG0qzI26t6vHhAsjVj6UD+PSrXLdFkM32DOm4Xck7gpycTX/4ZDQ74lTLlPWFC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708366284; c=relaxed/simple;
	bh=VMG0FUPd+kO1UMfam5hKqmeC8mpbpmgr7NCRClOWnXk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ex0UaYzw5GM+PvTAr/0nqWk6iNi8AhGxo8i4C7iGJED+MJ2lb5x+Ih+PCdiUPSQuNNw/gamfyVLetGet55M2su1wceYwk8vKXF4Gyh84OHHj0KYC1RwlMgq14jYSMnFkCchhuBHcqCcXh2LCj5+KTRZX2wZLrSANzo3LvE0MILY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=F6tpps14; arc=none smtp.client-ip=80.12.242.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Received: from [192.168.1.18] ([92.140.202.140])
	by smtp.orange.fr with ESMTPA
	id c85irVcPB58CZc85irrhO1; Mon, 19 Feb 2024 19:10:11 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1708366211;
	bh=tLmysCFqJCBp4TBWVrdLLgYXDPccma3RhSmnyQ0EwgI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=F6tpps144gVlrYjHGIDYz/gTXAJluqaebMaqobJjJk71MNEprsG3bMLFkMMFlswrQ
	 O+DJDNWCgS+VL43hGZ8FUBk3SXWbNrfWsR+g7f82QU1LHMM8uSyA20YYIuWLJ0wXCH
	 D7cYPhd54wh8HTfyiXihFZeDLMd6QY0Ci5oblWtsreh6li3xEOz2fdrNit11sBPPX+
	 Pb5ZxP2IDZchfteFz7WwEIa1HZ2Lukc+xmOJPtd4FFSnKXgBZtvoWKfOEez0sZ5t4k
	 qrJA2z8QHkyOs0kxKk5pO2CDk6biRxXX11dzHb05JZV0Kvg95J6lfsalRN3khLR0R/
	 x1uI3iPoh+kQA==
X-ME-Helo: [192.168.1.18]
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Mon, 19 Feb 2024 19:10:11 +0100
X-ME-IP: 92.140.202.140
Message-ID: <c745c4d3-a084-440d-bc07-0ecbcfe10e37@wanadoo.fr>
Date: Mon, 19 Feb 2024 19:10:10 +0100
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] bcachefs: Avoid a potential useless over memory
 allocation in bch2_prt_[v]printf()
Content-Language: en-MW
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: Brian Foster <bfoster@redhat.com>, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org, linux-bcachefs@vger.kernel.org
References: <4c614db674887346ea418acaeafd6bf86502ec77.1708272713.git.christophe.jaillet@wanadoo.fr>
 <pmyezdskyr3t2iyald4diibl6b7lttf46d6sskxfu2wq3pub7r@gmyezjb3wfeu>
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <pmyezdskyr3t2iyald4diibl6b7lttf46d6sskxfu2wq3pub7r@gmyezjb3wfeu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Le 19/02/2024 à 04:39, Kent Overstreet a écrit :
> On Sun, Feb 18, 2024 at 05:12:28PM +0100, Christophe JAILLET wrote:
>> 2 issues related to incorrect available space in the output buffer
>> computation may lead to some extra memory allocation.
>>
>>
>> First: vsnprintf() takes the size of the buffer, *including* the space for
>> the trailing null.
>>
>> But printbuf_remaining() returns the number of characters we can print
>> to the output buffer, *excluding* the terminating null.
>>
>> So, use printbuf_remaining_size(), which includes the space for the
>> terminating null.
> 
> nope, buggy.
> 
> passing printbuf_remaining_size() to snprintf() is correct, but
> snprintf() returns the number of charecters wrote _excluding_ the null

Hi,

I think that the patch is correct.

snprintf() returns the number of characters wrote _excluding_ the null. 
That is why the test is: len >= size_of_the_buffer   ==>  more space is 
needed.
The case you describe is handled by the == part of >=.

On the contrary, if len is < size_of_the_buffer, then we have at least 1 
place for the terminating NULL. It will then eventually lead to:
   len_of_the_string + space_for_'\0' ==  size_of_the_buffer
So it does not overflow.


Anyway, feel free to ignore the patch completely if it sounds too risky, 
take only half of it (s/printbuf_remaining/printbuf_remaining_size/) if 
you are more confident with it, or the complete patch if the explanation 
above convinced you.

 From my PoV, the 3 options lead to the same run-time output, with more 
or less memory allocated.

Best regards.

CJ


> 
>>
>>
>> Second: if the return value of vsnprintf() is greater than or equal to the
>> passed size, the resulting string is truncated.
>> So, in order to see if some extra space is needed, the check needs to be
>> changed.
>>
>> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
>> ---
>> Un-tested
>>
>> v2: - Use printbuf_remaining_size() instead of hand-writing it.  [Brian Foster]
>>      - Reword the commit log, hoping it is clearer.
>>      - Synch with -next-20240215
>>
>> v1: https://lore.kernel.org/all/0f40108bed3e084057223bdbe32c4b37f8500ff3.1694845203.git.christophe.jaillet@wanadoo.fr/
>> ---
>>   fs/bcachefs/printbuf.c | 10 ++++++----
>>   1 file changed, 6 insertions(+), 4 deletions(-)
>>
>> diff --git a/fs/bcachefs/printbuf.c b/fs/bcachefs/printbuf.c
>> index b27d22925929..8cee9c2f88c4 100644
>> --- a/fs/bcachefs/printbuf.c
>> +++ b/fs/bcachefs/printbuf.c
>> @@ -55,9 +55,10 @@ void bch2_prt_vprintf(struct printbuf *out, const char *fmt, va_list args)
>>   		va_list args2;
>>   
>>   		va_copy(args2, args);
>> -		len = vsnprintf(out->buf + out->pos, printbuf_remaining(out), fmt, args2);
>> +		len = vsnprintf(out->buf + out->pos, printbuf_remaining_size(out),
>> +				fmt, args2);
>>   		va_end(args2);
>> -	} while (len + 1 >= printbuf_remaining(out) &&
>> +	} while (len >= printbuf_remaining_size(out) &&
>>   		 !bch2_printbuf_make_room(out, len + 1));
>>   
>>   	len = min_t(size_t, len,
>> @@ -72,9 +73,10 @@ void bch2_prt_printf(struct printbuf *out, const char *fmt, ...)
>>   
>>   	do {
>>   		va_start(args, fmt);
>> -		len = vsnprintf(out->buf + out->pos, printbuf_remaining(out), fmt, args);
>> +		len = vsnprintf(out->buf + out->pos, printbuf_remaining_size(out),
>> +				fmt, args);
>>   		va_end(args);
>> -	} while (len + 1 >= printbuf_remaining(out) &&
>> +	} while (len >= printbuf_remaining_size(out) &&
>>   		 !bch2_printbuf_make_room(out, len + 1));
>>   
>>   	len = min_t(size_t, len,
>> -- 
>> 2.43.2
>>
> 
> 


