Return-Path: <kernel-janitors+bounces-1814-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 22F2D85C423
	for <lists+kernel-janitors@lfdr.de>; Tue, 20 Feb 2024 19:58:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 549141C22C9B
	for <lists+kernel-janitors@lfdr.de>; Tue, 20 Feb 2024 18:58:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B96413AA2E;
	Tue, 20 Feb 2024 18:58:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="EbicfXdI"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from smtp.smtpout.orange.fr (smtp-18.smtpout.orange.fr [80.12.242.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5283112EBEC
	for <kernel-janitors@vger.kernel.org>; Tue, 20 Feb 2024 18:58:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708455520; cv=none; b=T1ccDBI7Z/Bmhaiie7+YEMa+Aemq2OPpd9yHXEYoik9pN+wm1B0ZlClOXvVHKBqyIVzFketIaz/N5hD3ypB0sRF3+UXr2x5wCvUwjuu+xu8KG9CtT2iRHiofIDf50cR/MP0GLRnkFcvEKVF1v34aokOPs5IcQgnJu0zyq/mh5ak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708455520; c=relaxed/simple;
	bh=8WzmXc4hkm/h23fftetZwBYuo4crh0kh/mv9qH7713g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VipJRRAYrsnt5Nl9epknpg+/4rrJ4wgAkn1b0lktbCUopcIqF1z8uRNvROanonPDAjN9sG8V6O5/eiA10oxQgq3tn2IzG9rDHbLo3PD+joDW0pOPhfAPUeo3pNylKlo6UU9k30Z+G6Hr2cyyFBfjDyMZbv/V/IgkBjbuj163wIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=EbicfXdI; arc=none smtp.client-ip=80.12.242.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Received: from [192.168.1.18] ([92.140.202.140])
	by smtp.orange.fr with ESMTPA
	id cVJ3rZRzMFu9DcVK5ruPxD; Tue, 20 Feb 2024 19:58:35 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1708455515;
	bh=bhyTkozSilaOI3wTa7vDeTF3frYTM4nImhWGYnX59p0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=EbicfXdI+a3tOLKcNT4u8AXMI7rRi5z4CZFujYjmHCy5vrdHE5yv95ghh07lElXDp
	 2DxvgFn7gJyTUAYse4z9umzGRzh0h52oaUk9UDtgMaPotThmucxgjguOg/hHSNQP8R
	 50eV2NEjKcYEIHljl/V9JoyKWR8dp2Yijpst9X//fyaM465h9din2Mxll7QLkR1w2v
	 7fs5wltDKP5VyjfPV4r7wA5uoz095fplA5olLFzWtd10b+CNJUJOSuNGuII9Q9MgZp
	 efneR4zRosgVOd4qCAdTs8LpdSjuS6TVEBv8EkRJa8RbA4/iwGq6Tv1x1ip46zqsP7
	 SE0UlUYX5ro1A==
X-ME-Helo: [192.168.1.18]
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Tue, 20 Feb 2024 19:58:35 +0100
X-ME-IP: 92.140.202.140
Message-ID: <521e55d5-37e2-41b3-9ed7-0986d503087c@wanadoo.fr>
Date: Tue, 20 Feb 2024 19:58:32 +0100
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/guc: Remove usage of the deprecated
 ida_simple_xx() API
Content-Language: en-MW
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 Oded Gabbay <ogabbay@kernel.org>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <d6a9ec9dc426fca372eaa1423a83632bd743c5d9.1705244938.git.christophe.jaillet@wanadoo.fr>
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <d6a9ec9dc426fca372eaa1423a83632bd743c5d9.1705244938.git.christophe.jaillet@wanadoo.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Le 14/01/2024 à 16:09, Christophe JAILLET a écrit :
> ida_alloc() and ida_free() should be preferred to the deprecated
> ida_simple_get() and ida_simple_remove().
> 
> Note that the upper limit of ida_simple_get() is exclusive, but the one of
> ida_alloc_max() is inclusive. So a -1 has been added when needed.
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
>   drivers/gpu/drm/xe/xe_guc_submit.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index 21ac68e3246f..11ffacd1dd58 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -311,7 +311,7 @@ static void __release_guc_id(struct xe_guc *guc, struct xe_exec_queue *q, u32 xa
>   				      q->guc->id - GUC_ID_START_MLRC,
>   				      order_base_2(q->width));
>   	else
> -		ida_simple_remove(&guc->submission_state.guc_ids, q->guc->id);
> +		ida_free(&guc->submission_state.guc_ids, q->guc->id);
>   }
>   
>   static int alloc_guc_id(struct xe_guc *guc, struct xe_exec_queue *q)
> @@ -335,8 +335,8 @@ static int alloc_guc_id(struct xe_guc *guc, struct xe_exec_queue *q)
>   		ret = bitmap_find_free_region(bitmap, GUC_ID_NUMBER_MLRC,
>   					      order_base_2(q->width));
>   	} else {
> -		ret = ida_simple_get(&guc->submission_state.guc_ids, 0,
> -				     GUC_ID_NUMBER_SLRC, GFP_NOWAIT);
> +		ret = ida_alloc_max(&guc->submission_state.guc_ids,
> +				    GUC_ID_NUMBER_SLRC - 1, GFP_NOWAIT);
>   	}
>   	if (ret < 0)
>   		return ret;

Hi,

gentle reminder.

All patches to remove the ida_simple API have been sent.
And Matthew Wilcox seems happy with the on going work. (see [1])

Based on next-20240220
$git grep ida_simple_get | wc -l
36

https://elixir.bootlin.com/linux/v6.8-rc3/A/ident/ida_simple_get
50

https://elixir.bootlin.com/linux/v6.7.4/A/ident/ida_simple_get
81

Thanks
CJ

[1]: https://lore.kernel.org/all/ZaqruGVz734zjxrZ@casper.infradead.org/

