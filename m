Return-Path: <kernel-janitors+bounces-7246-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 56B00A4A0CB
	for <lists+kernel-janitors@lfdr.de>; Fri, 28 Feb 2025 18:49:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 920773BBC40
	for <lists+kernel-janitors@lfdr.de>; Fri, 28 Feb 2025 17:49:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE7CF1B81DC;
	Fri, 28 Feb 2025 17:49:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=natalie.vock@gmx.de header.b="gzCsLIq5"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E02D1F4CB1;
	Fri, 28 Feb 2025 17:49:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740764958; cv=none; b=HYrwctqsEc9U45oOlkx5Y0H8rZuJ3hrSNxaT/WGr1e28D213JzpqJPdA8B59+1Y2JSNz2qGYJPIdhprIbpCwmaOQDQhstMb0Cq+C1hZcB19p8Fr08zuxS23P4LPEGhPSyj9ahbFNDTk9jhMyRGki6PIJug4vTid9LkF2wbVo/ws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740764958; c=relaxed/simple;
	bh=08K4zbL4moVh6XPPzT6eKUWH2fqmPJidrieCbWuG0Qc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fcWQH67Ufx/+PniHsi7l43/EclwfQGxhzToBgWz8ZFZ1Bnw3GYREWju/01SicdLQ79+ih+ZhOew6odf5bWVGN2nrjO62ZRa95zvwVRAW+2M/UH2oTPECeTwPQq6eiA5XnFuLcZIdWSc6aipVWAqC+0Joh9+9AbCLZT7GHwO1df0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=natalie.vock@gmx.de header.b=gzCsLIq5; arc=none smtp.client-ip=212.227.15.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1740764953; x=1741369753; i=natalie.vock@gmx.de;
	bh=TysCmGGP5Rt/4MMj9mBlLj3WIXNFtvvwb0fijWQQBEs=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=gzCsLIq5mLpcIiVtJIo9uJa0WDhblgB+5wiIy3xTh/0vsJ3I/RSt+zyaYn/++IUU
	 VqzIYI0e6nkqtioBiHP4Svt4TDsr6AJXhZaAr0JgjSEt6IZ2fB0aXvrByS8HYcFeo
	 bDo/i8NKbsYhEr+E8cfj0O+uYmjL1iNxHgVIQvG347P01zXaeyny003e+nHjNBpF/
	 krEE6HcwQSD4zsExoJ0J8ZE7Qj/GgHo0xNnlrmCl7K1K/EyxmloMu42eo1m49iHlb
	 Zvz2cEarSE4/smBnOp67Oy84YBNZZc17FVle5EqXqhEGPL/a4z/hA3QmlZkcZ4esW
	 JQYnGiHF0mw+KkrH9A==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.3] ([109.91.201.165]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MRTRH-1tbbdU07oT-00U8Ps; Fri, 28
 Feb 2025 18:49:13 +0100
Message-ID: <642022b6-ba71-407c-99d0-fffb58df2be7@gmx.de>
Date: Fri, 28 Feb 2025 18:49:12 +0100
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/radeon: Simplify maximum determination in
 radeon_uvd_calc_upll_dividers()
To: Markus Elfring <Markus.Elfring@web.de>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org,
 Qasim Ijaz <qasdev00@gmail.com>
References: <225be170-472d-40c1-95ed-71b452740ae7@web.de>
Content-Language: en-US
From: Natalie Vock <natalie.vock@gmx.de>
In-Reply-To: <225be170-472d-40c1-95ed-71b452740ae7@web.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:pfjZqJ9EAd9/+f5S1bPNi20hb76HzRttQuCU8sST9HqzSn3C5EQ
 YEs7SXMxt0jTQWTKzWgcvwRstllrbmjOkBTRP9r0411JXNu3ZiQDzbMwLFF1Ztaibu0bNh7
 CvIOpWCvo9N/Ac7iGI1c1ITI6zHbPGQLoLE8hizfh2Xd3/zqizzTeXD8CIxbkwvUU0gIepP
 nvS8WyRp4QRl+dup8enkA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:Uc1rwjwZJ8A=;tsNj3Qj3va+BSO8M3orHrkhF7lM
 0gQ4cbk7A6tp5MK6F8nZFkC5ilAnJgcuIcEetDyHMKbQKSZyMFRYy7CU0lA+0Q65TlR8PtbLF
 84QHor1XOL27bglb1DoJDSPKqKSnj1fcMjsqbS7cAZv3W6oXbgX1DobiCTc4jc1Oha0vv1yxs
 9fPgqUy5UBxge7s//45E9BabSCMMq1y3w33g9fCm/uTfAxdKkxCUvIGP16IL0INy8mE12V/8h
 TumUxqf3B6xt6ICw+8SFMZxvcNlas6PaF3CnjU1Rr3TfyVdkGSc+pngGEfOjFgagaSiLbU8wz
 Nzq3aJwk3tVaxEfqyK7C3TUA6nwSrzlfuaAuat8Z5sEkGMtrCaEiYz6Ft4PyCUqK3l4fFiBIO
 2cmaOl45duPyx73r1caEFe45cZBJXweQ1N0cqoetP/TpwST3oKi4bXOTqfX0QAXFAgJACvfru
 GcAXR/Vn03+JybR0Ie08aDIiJ+2SutWtOnqY0Rc1WmOi4IqzzwbKsMMmRwc1ctHMd5p+fycc9
 nT5LAvzyy12iTydnS5O3FE3NIiwTPU6TM4Gv8yiYRwdFEGmxW6KX2xdVRu+qVln6mF14jctOt
 Q+LOLHHSqqZhLHFSCnMkP/lGTG+8b5qYZKarKgpDhXIjr6xwLj1bSOkz8qCpkAV5TNCjhhVBK
 kyFHsGW7xzLsKtiMKf8C+KexbXWP9PZ4XPSq2ycJ89K51xbRnse7bmnC5QkZmzljZcZIJIVXh
 aFZwwDsJ7Z6zegPWJdEJUUU8jLFnvHKCReQ6QjGHORUzFSIrdhcSJk6DlK6JFQYJ8Am0KLAo7
 x5/dSdyvMS1NY0pV+/cjPPd6ggWHUw3IU3CHkmZ9ywimEA6ediLmnkZ18e//zkpR9eQgbxiBC
 AEtyTCoVnZeyXVRqMl/cHRTy2jnvTexBYhrvlcZY7/9SuIv9IeL14SvdQ4o+4xvG0iGQwFWag
 949zE1NzkhDwIxA8xmRVjM/gxVmM/u0QdOTwDa96kSnOE5m9wY5g0EkCF50JFChHqbcWdF5GB
 aoKv8EtHS9J4IYzKRJ2SNgg5YDP4Arn4TSU5vV0VaL7e4Ojtt5FVAcaXjawiE14DmfzXZ6BOU
 ASOm4hGix7foCrQh+lSs28PWLsqtNDRG73kxc6tPPDjX4DhFSik3Xmhp13nhpn8c1WiyYKOAJ
 Iay3QoS9vkCUdfyKkz+RmdzOScAscclgyGAGociNcsjA4zvOJZziitlPOL7fuik8Z+DVnGntY
 Y0WxNre7gb5KOLJdFbic7jRTI4t0Hh3vhPjyuisEFsa5Qc/iM89Zs24T1cuE/mRO5h3gZufot
 2UhKTL7FxnaWbTJBPOaSMKzI3wQEoH0KfYRNXYJ/uPB7YUtKXeu4pktrBl2Uk6WvUJOvRrq89
 Xi9MQN1czbTSKqSXpLfAra/i1SWrTyqxtI8ba1LELYBKlEk9kgd5ONsLWp

On 28.02.25 17:36, Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Fri, 28 Feb 2025 17:32:45 +0100
>
> Replace nested max() calls by single max3() call in this
> function implementation.
>
> This issue was transformed by using the Coccinelle software.

How about something like "this change was made" or "this code was
transformed"? Coccinelle didn't transform the issue, it transformed the
code to solve the issue.

Cheers,
Natalie

>
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---
>   drivers/gpu/drm/radeon/radeon_uvd.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/radeon/radeon_uvd.c b/drivers/gpu/drm/radeo=
n/radeon_uvd.c
> index 058a1c8451b2..ded5747a58d1 100644
> --- a/drivers/gpu/drm/radeon/radeon_uvd.c
> +++ b/drivers/gpu/drm/radeon/radeon_uvd.c
> @@ -961,7 +961,7 @@ int radeon_uvd_calc_upll_dividers(struct radeon_devi=
ce *rdev,
>   	unsigned optimal_score =3D ~0;
>
>   	/* loop through vco from low to high */
> -	vco_min =3D max(max(vco_min, vclk), dclk);
> +	vco_min =3D max3(vco_min, vclk, dclk);
>   	for (vco_freq =3D vco_min; vco_freq <=3D vco_max; vco_freq +=3D 100) =
{
>
>   		uint64_t fb_div =3D (uint64_t)vco_freq * fb_factor;
> --
> 2.48.1
>


