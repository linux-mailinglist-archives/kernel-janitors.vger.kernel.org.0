Return-Path: <kernel-janitors+bounces-5664-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D8EA989BC0
	for <lists+kernel-janitors@lfdr.de>; Mon, 30 Sep 2024 09:43:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 38FA51C21623
	for <lists+kernel-janitors@lfdr.de>; Mon, 30 Sep 2024 07:43:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5B4D161313;
	Mon, 30 Sep 2024 07:43:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=perex.cz header.i=@perex.cz header.b="yB8lRDFK"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20D5115C13A;
	Mon, 30 Sep 2024 07:43:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=77.48.224.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727682214; cv=none; b=RpLo8Y1BWVfR1pVyUuUDtx4mLpCgCgcvD4xG/+349/GmZSNx/tZs/N0UqFRY1xFTd8DfPLSB0Wx7NObYgrYXAX1Ye1U5v9nDyJRUET/vRpZGuA/8fmtkWlLascGUHd5Sv304/YPTZj+hFsFHqJWrR9zr0sMwk8O99+hJKD3ISN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727682214; c=relaxed/simple;
	bh=9JP1YXLm1fI562pg8E/zs94XKuWw/JrEhziHBFR0omk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=c0UGZL3EphjTOlf2AdTtPLUHTMclTqFXsXvzdGSJ4fHGgjMtTtLiSUBbHbY0fROPKdOSEoxdP9q08wapWn+tuPiOsZgmgzRkHc88Q74+EXjVmk2F7E9GGecWUT1nlPHNcwgV5VpbL+rOOVPNVHPOgDejibKhQJdbVe7NQpJzJ/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=perex.cz; spf=pass smtp.mailfrom=perex.cz; dkim=pass (1024-bit key) header.d=perex.cz header.i=@perex.cz header.b=yB8lRDFK; arc=none smtp.client-ip=77.48.224.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=perex.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=perex.cz
Received: from mail1.perex.cz (localhost [127.0.0.1])
	by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 7FB6F411F;
	Mon, 30 Sep 2024 09:35:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 7FB6F411F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
	t=1727681733; bh=PFC8KMsPMRhmf+d1qYDzAf3QsCpwsLMFyEZT9wvMNiA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=yB8lRDFKWj2sB8KXzSckxji2dlq8uHIgB6k/wM+KMsdOs03ajUmgXz5JkqOrs/Oc9
	 aG+8B2sSXKBXORdTPxLcwdmsExQcsdUK/MetDOQb/k3ld3S0lDXNJ8aSnzc7QcpX8Z
	 7OvK8VgYTW+FvWXQuJBFAe5viD/ob+X6LDZanOk4=
Received: from [192.168.100.98] (unknown [192.168.100.98])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: perex)
	by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
	Mon, 30 Sep 2024 09:35:26 +0200 (CEST)
Message-ID: <22ea267f-2326-4128-a182-a4e90d4cfb68@perex.cz>
Date: Mon, 30 Sep 2024 09:35:25 +0200
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ALSA: silence integer wrapping warning
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Takashi Iwai <tiwai@suse.com>, Mark Brown <broonie@kernel.org>,
 Takashi Sakamoto <o-takashi@sakamocchi.jp>, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
References: <5457e8c1-01ff-4dd9-b49c-15b817f65ee7@stanley.mountain>
Content-Language: en-US
From: Jaroslav Kysela <perex@perex.cz>
Autocrypt: addr=perex@perex.cz; keydata=
 xsFNBFvNeCsBEACUu2ZgwoGXmVFGukNPWjA68/7eMWI7AvNHpekSGv3z42Iy4DGZabs2Jtvk
 ZeWulJmMOh9ktP9rVWYKL9H54gH5LSdxjYYTQpSCPzM37nisJaksC8XCwD4yTDR+VFCtB5z/
 E7U0qujGhU5jDTne3dZpVv1QnYHlVHk4noKxLjvEQIdJWzsF6e2EMp4SLG/OXhdC9ZeNt5IU
 HQpcKgyIOUdq+44B4VCzAMniaNLKNAZkTQ6Hc0sz0jXdq+8ZpaoPEgLlt7IlztT/MUcH3ABD
 LwcFvCsuPLLmiczk6/38iIjqMtrN7/gP8nvZuvCValLyzlArtbHFH8v7qO8o/5KXX62acCZ4
 aHXaUHk7ahr15VbOsaqUIFfNxpthxYFuWDu9u0lhvEef5tDWb/FX+TOa8iSLjNoe69vMCj1F
 srZ9x2gjbqS2NgGfpQPwwoBxG0YRf6ierZK3I6A15N0RY5/KSFCQvJOX0aW8TztisbmJvX54
 GNGzWurrztj690XLp/clewmfIUS3CYFqKLErT4761BpiK5XWUB4oxYVwc+L8btk1GOCOBVsp
 4xAVD2m7M+9YKitNiYM4RtFiXwqfLk1uUTEvsaFkC1vu3C9aVDn3KQrZ9M8MBh/f2c8VcKbN
 njxs6x6tOdF5IhUc2E+janDLPZIfWDjYJ6syHadicPiATruKvwARAQABzSBKYXJvc2xhdiBL
 eXNlbGEgPHBlcmV4QHBlcmV4LmN6PsLBjgQTAQgAOBYhBF7f7LZepM3UTvmsRTCsxHw/elMJ
 BQJbzXgrAhsDBQsJCAcCBhUKCQgLAgQWAgMBAh4BAheAAAoJEDCsxHw/elMJDGAP/ReIRiRw
 lSzijpsGF/AslLEljncG5tvb/xHwCxK5JawIpViwwyJss06/IAvdY5vn5AdfUfCl2J+OakaR
 VM/hdHjCYNu4bdBYZQBmEiKsPccZG2YFDRudEmiaoaJ1e8ZsiA3rSf4SiWWsbcBOYHr/unTf
 4KQsdUHzPUt8Ffi9HrAFzI2wjjiyV5yUGp3x58ZypAIMcKFtA1aDwhA6YmQ6lb8/bC0LTC6l
 cAAS1tj7YF5nFfXsodCOKK5rKf5/QOF0OCD2Gy+mGLNQnq6S+kD+ujQfOLaUHeyfcNBEBxda
 nZID7gzd65bHUMAeWttZr3m5ESrlt2SaNBddbN7NVpVa/292cuwDCLw2j+fAZbiVOYyqMSY4
 LaNqmfa0wJAv30BMKeRAovozJy62j0AnntqrvtDqqvuXgYirj2BEDxx0OhZVqlI8o5qB6rA5
 Pfp2xKRE8Fw3mASYRDNad08JDhJgsR/N5JDGbh4+6sznOA5J63TJ+vCFGM37M5WXInrZJBM3
 ABicmpClXn42zX3Gdf/GMM3SQBrIriBtB9iEHQcRG/F+kkGOY4QDi4BZxo45KraANGmCkDk0
 +xLZVfWh8YOBep+x2Sf83up5IMmIZAtYnxr77VlMYHDWjnpFnfuja+fcnkuzvvy7AHJZUO1A
 aKexwcBjfTxtlX4BiNoK+MgrjYywzsFNBFvNeCsBEACb8FXFMOw1g+IGVicWVB+9AvOLOhqI
 FMhUuDWmlsnT8B/aLxcRVUTXoNgJpt0y0SpWD3eEJOkqjHuvHfk+VhKWDsg6vlNUmF1Ttvob
 18rce0UH1s+wlE8YX8zFgODbtRx8h/BpykwnuWNTiotu9itlE83yOUbv/kHOPUz4Ul1+LoCf
 V2xXssYSEnNr+uUG6/xPnaTvKj+pC7YCl38Jd5PgxsP3omW2Pi9T3rDO6cztu6VvR9/vlQ8Z
 t0p+eeiGqQV3I+7k+S0J6TxMEHI8xmfYFcaVDlKeA5asxkqu5PDZm3Dzgb0XmFbVeakI0be8
 +mS6s0Y4ATtn/D84PQo4bvYqTsqAAJkApEbHEIHPwRyaXjI7fq5BTXfUO+++UXlBCkiH8Sle
 2a8IGI1aBzuL7G9suORQUlBCxy+0H7ugr2uku1e0S/3LhdfAQRUAQm+K7NfSljtGuL8RjXWQ
 f3B6Vs7vo+17jOU7tzviahgeRTcYBss3e264RkL62zdZyyArbVbK7uIU6utvv0eYqG9cni+o
 z7CAe7vMbb5KfNOAJ16+znlOFTieKGyFQBtByHkhh86BQNQn77aESJRQdXvo5YCGX3BuRUaQ
 zydmrgwauQTSnIhgLZPv5pphuKOmkzvlCDX+tmaCrNdNc+0geSAXNe4CqYQlSnJv6odbrQlD
 Qotm9QARAQABwsF2BBgBCAAgFiEEXt/stl6kzdRO+axFMKzEfD96UwkFAlvNeCsCGwwACgkQ
 MKzEfD96Uwlkjg/+MZVS4M/vBbIkH3byGId/MWPy13QdDzBvV0WBqfnr6n99lf7tKKp85bpB
 y7KRAPtXu+9WBzbbIe42sxmWJtDFIeT0HJxPn64l9a1btPnaILblE1mrfZYAxIOMk3UZA3PH
 uFdyhQDJbDGi3LklDhsJFTAhBZI5xMSnqhaMmWCL99OWwfyJn2omp8R+lBfAJZR31vW6wzsj
 ssOvKIbgBpV/o3oGyAofIXPYzhY+jhWgOYtiPw9bknu748K+kK3fk0OeEG6doO4leB7LuWig
 dmLZkcLlJzSE6UhEwHZ8WREOMIGJnMF51WcF0A3JUeKpYYEvSJNDEm7dRtpb0x/Y5HIfrg5/
 qAKutAYPY7ClQLu5RHv5uqshiwyfGPaiE8Coyphvd5YbOlMm3mC/DbEstHG7zA89fN9gAzsJ
 0TFL5lNz1s/fo+//ktlG9H28EHD8WOwkpibsngpvY+FKUGfJgIxpmdXVOkiORWQpndWyRIqw
 k8vz1gDNeG7HOIh46GnKIrQiUXVzAuUvM5vI9YaW3YRNTcn3pguQRt+Tl9Y6G+j+yvuLL173
 m4zRUU6DOygmpQAVYSOJvKAJ07AhQGaWAAi5msM6BcTU4YGcpW7FHr6+xaFDlRHzf1lkvavX
 WoxP1IA1DFuBMeYMzfyi4qDWjXc+C51ZaQd39EulYMh+JVaWRoY=
In-Reply-To: <5457e8c1-01ff-4dd9-b49c-15b817f65ee7@stanley.mountain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 30. 09. 24 9:19, Dan Carpenter wrote:
> This patch doesn't change runtime at all, it's just for kernel hardening.
> 
> The "count" here comes from the user and on 32bit systems, it leads to
> integer wrapping when we pass it to compute_user_elem_size():
> 
> 	alloc_size = compute_user_elem_size(private_size, count);
> 
> However, the integer over is harmless because later "count" is checked
> when we pass it to snd_ctl_new():
> 
> 	err = snd_ctl_new(&kctl, count, access, file);
> 
> These days as part of kernel hardening we're trying to avoid integer
> overflows when they affect size_t type.  So to avoid the integer overflow
> copy the check from snd_ctl_new() and do it at the start of the
> snd_ctl_elem_add() function as well.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
> I'm going to write a blog about this which explains the kernel hardening
> proposal in more detail.
> 
> The problem is that integer overflows are really hard to analyze
> because the integer overflow itself is harmless.  The harmful thing comes
> later.  Not only are integer overflows harmless, but many of them are
> done deliberately.
> 
> So what we're doing is we're saying that size_t types should not overflow.
> This eliminates many deliberate integer overflows handling time values for
> example.  We're also ignoring deliberate idiomatic integer overflows such
> as if (a + b < a) {.
> 
> We're going to detect these integer overflows using static analysis and at
> runtime using UBSan and Syzbot.
> 
> The other thing, actually, is the we're planning to only work on 64bit
> systems for now so if you want to ignore this patch then that's fine.  There
> are a lot more (like 10x more) integer overflows on 32bit systems but most
> people are on 64bit.  So it's less work and more impact to focus on 64bit
> at first.
> 
>   sound/core/control.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/sound/core/control.c b/sound/core/control.c
> index 4f55f64c42e1..82b9d14f4ee3 100644
> --- a/sound/core/control.c
> +++ b/sound/core/control.c
> @@ -1641,6 +1641,8 @@ static int snd_ctl_elem_add(struct snd_ctl_file *file,
>   	count = info->owner;
>   	if (count == 0)
>   		count = 1;
> +	if (count > MAX_CONTROL_COUNT)
> +		return -EINVAL;
>   
>   	/* Arrange access permissions if needed. */
>   	access = info->access;

It looks safe and this check is already in snd_ctl_new(). Perhaps, it may be 
clever to add a direct comment to the code about purpose of this extra 
(double) check.

Reviewed-by: Jaroslav Kysela <perex@perex.cz>


				Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.


