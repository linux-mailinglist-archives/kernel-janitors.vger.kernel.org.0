Return-Path: <kernel-janitors+bounces-3488-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D33FA8D6EAA
	for <lists+kernel-janitors@lfdr.de>; Sat,  1 Jun 2024 09:27:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8EF1628387F
	for <lists+kernel-janitors@lfdr.de>; Sat,  1 Jun 2024 07:27:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2405182B5;
	Sat,  1 Jun 2024 07:27:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="bG+5p/3v"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D9E114F6C
	for <kernel-janitors@vger.kernel.org>; Sat,  1 Jun 2024 07:27:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717226855; cv=none; b=b0dLpXH+ykv89wozZrtKi3Xc4wpVdqA0JvzZeL1dRdpNsDG5ptAp0A3PyIgbDxQWbvM5iCdqLafPVhv4rfX0AdMkNbeIpf+93HXf7nWOZ0ikcZOsfvwErmUNcrWgEAxFdAo1z0nj5Q/bhKC4omul4QLFG1OljHGLPXEDbU7PVAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717226855; c=relaxed/simple;
	bh=PCJyMuyEUt6FOSKpRSAJIF1DJ6gHGxPxtSzQDAWBqFA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ga/gDD05MIx2QNEIHto2npx0qstSz4RsShdgs3Pfsl1C5M4GTD3Eo20V3LhJwKG5RTSMhSyJN0lIIbbw8o2VljkWy53ZpxiASAozdZ2M2acGSYm9NJxU+xPmeMcE+xbiIrwuM+z4Nax9DHf+WoMwac7qI5g1EmVFq82jeqLjX0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=bG+5p/3v; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2e95a883101so35488741fa.3
        for <kernel-janitors@vger.kernel.org>; Sat, 01 Jun 2024 00:27:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1717226850; x=1717831650; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Hge4VyxWituyIOOJfd321VcyqziYhhPj3o4Ih55xN00=;
        b=bG+5p/3vyb4go8ANYQmZhD5TOLvBKYOZtyna3vgPdFAicvteo9XLLhyqvcVEfExBcD
         B2Hphqk7brJzIaUXkIJkymckLcBMIzxZWmeo7Q3LFFnkrZ5EGNzEczwBkrnWWxpRAOv7
         nIF3kci1SwqPE0lruSFN6mmekFJ1SDeEvoO77rNAyV5aa/d8bzLVOT2av2RqHAXuzH+T
         tAlMETqBrMLWoqwYofytlpbcK8Dt2NAPIaNMrsWsUYlIGJbi3rcCsDXWnqGTSDAeQOFz
         2KiZXj0wTSiQQwoQtQy+PB/BM/QDDxQUwbMwBkxGOBZ/r1N1P2dKpdAI0+fVDy7Mts1n
         20Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717226850; x=1717831650;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Hge4VyxWituyIOOJfd321VcyqziYhhPj3o4Ih55xN00=;
        b=DGyfylo4WSI92y5GbO+kPZvN2dLLth+fZbsUKyQ3Pdu81oOpTkQRGYBGaK9HuEcnh4
         EBwDHHFXCxskCq0hXtGGALgOxJhUyu3oh4Opq3hmfjlWpOfBDQs/s9meXzF7H6oEQ7Et
         8N3mjdQHXMx52Y3RHlGrV6nGHRm/7UaJEUTrUTGtPu39ro9a2iUbAo4TXT+A1dOHiQMX
         AgIV3NkW4b/UK+Q5yD+gOHxFCTjdhsYMOv+g1s/gRy0MffyBnJHASO3KPBH41JizgxPF
         BXhiGLYBAcQASWWd2Z1F5qXmscBoR9mX3ohsTjGR1hxnFYKEdT5Zhq6cj6A5fK4dtMEn
         o4eg==
X-Forwarded-Encrypted: i=1; AJvYcCWFYNm00pfZANu5QY8crFkSxaIdTQILnog73NZffykcdPgGYsosEkM/ljAYewrlPDpou3w3adbutlSIwSkBMEEQ3zVurbZdedkWUjk4bbt8
X-Gm-Message-State: AOJu0YyVm90wyFJ14ARbeMQ1/JxJPRSHCVkR2jzr640qVF+v+dBMguqT
	dX1ewpZbHMdYH82g3R0B+XnosxcaA5irdu0osN/SQOV8VhQ4D6dv8pi1ULTgLSM=
X-Google-Smtp-Source: AGHT+IGNPhItELQLzA+6LD+5jArBZ6BmBN1IYQZrt8rOBPmW+ThPAYNFbxwNdlDHZheUKtu5Am8cBg==
X-Received: by 2002:a2e:6a19:0:b0:2df:b7cf:9607 with SMTP id 38308e7fff4ca-2ea95114215mr28008081fa.22.1717226850126;
        Sat, 01 Jun 2024 00:27:30 -0700 (PDT)
Received: from ?IPV6:2a10:bac0:b000:5de0:5af9:fc8:27d7:ba3d? ([2a10:bac0:b000:5de0:5af9:fc8:27d7:ba3d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4212b838b4asm46873915e9.6.2024.06.01.00.27.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 01 Jun 2024 00:27:29 -0700 (PDT)
Message-ID: <a54db95c-e22a-4e13-ae4b-6a5a67d1c49b@suse.com>
Date: Sat, 1 Jun 2024 10:27:28 +0300
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/boot: add prototype for __fortify_panic()
To: Kees Cook <kees@kernel.org>, Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
 kernel-janitors@vger.kernel.org
References: <20240529-fortify_panic-v1-1-9923d5c77657@quicinc.com>
 <0d3f7c58-7fc0-4e8b-b6fb-c4d0d9969ce7@suse.com>
 <e42c4984-d4a2-45b1-b93d-7471000766b7@quicinc.com>
 <202405310923.78257B2B3@keescook>
Content-Language: en-US
From: Nikolay Borisov <nik.borisov@suse.com>
In-Reply-To: <202405310923.78257B2B3@keescook>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 31.05.24 г. 19:28 ч., Kees Cook wrote:
> On Thu, May 30, 2024 at 09:23:36AM -0700, Jeff Johnson wrote:
>> On 5/30/2024 8:42 AM, Nikolay Borisov wrote:
>>>
>>>
>>> On 29.05.24 г. 21:09 ч., Jeff Johnson wrote:
>>>> As discussed in [1] add a prototype for __fortify_panic() to fix the
>>>> 'make W=1 C=1' warning:
>>>>
>>>> arch/x86/boot/compressed/misc.c:535:6: warning: symbol '__fortify_panic' was not declared. Should it be static?
>>>
>>> Actually doesn't it make sense to have this defined under ../string.h ?
>>> Actually given that we don't have any string fortification under the
>>> boot/  why have the fortify _* functions at all ?
>>
>> I'll let Kees answer these questions since I just took guidance from him :)
> 
> Ah-ha, I see what's happening. When not built with
> CONFIG_FORTIFY_SOURCE, fortify-string.h isn't included. But since misc.c
> has the function definition, we get a warning that the function
> declaration was never seen. This is likely the better solution:

fortify-strings.h is used in include/linux/string.h. However all the 
files in the decompressor are using a local copy of string.h and not the 
kernel-wide. When pre-processing misc.c with FORTIFY_SOURCE enabled 
here's the status:

$ grep -i fortify  arch/x86/boot/compressed/misc.i
void __fortify_panic(const u8 reason, size_t avail, size_t size)

It seems the decompressor is not using fortify-string at all because 
it's not using the global string.h ?



> 
> 
> diff --git a/arch/x86/boot/compressed/misc.c b/arch/x86/boot/compressed/misc.c
> index b70e4a21c15f..3f21a5e218f8 100644
> --- a/arch/x86/boot/compressed/misc.c
> +++ b/arch/x86/boot/compressed/misc.c
> @@ -532,7 +532,9 @@ asmlinkage __visible void *extract_kernel(void *rmode, unsigned char *output)
>   	return output + entry_offset;
>   }
>   
> +#ifdef CONFIG_FORTIFY_SOURCE
>   void __fortify_panic(const u8 reason, size_t avail, size_t size)
>   {
>   	error("detected buffer overflow");
>   }
> +#endif
> 
> 
> Jeff, can you test this? (I still haven't been able to reproduce the
> warning.)
> 

