Return-Path: <kernel-janitors+bounces-6396-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D53709C40EB
	for <lists+kernel-janitors@lfdr.de>; Mon, 11 Nov 2024 15:29:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 84CB71F23093
	for <lists+kernel-janitors@lfdr.de>; Mon, 11 Nov 2024 14:29:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA47F1A01DD;
	Mon, 11 Nov 2024 14:29:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="rCmAHFyt"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from out-187.mta1.migadu.com (out-187.mta1.migadu.com [95.215.58.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E65C015A85A
	for <kernel-janitors@vger.kernel.org>; Mon, 11 Nov 2024 14:29:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731335359; cv=none; b=m2pFu+KqKbJDnWP7ruZ8GPzt6TAYM3CPbxl0FQiw++apNNpgHtiFJBJ05lDP3q3O9xYLvFB+ncX/dUvsqf5WVfFcACcnYTspHLOAP3azKcZKSpiz6mhN0nhJIvEgNpI2riGUIISvxpU+vh5i41LP9D04zzjyN/1jzW2p8gU8GYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731335359; c=relaxed/simple;
	bh=tpRW8AWpeWuf1ejQeWaaBEjfeU0GbVtqmgneeggtGSA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JyVZCYSDG6/dPofT4QPQ/wSM6CNEeBT+b3Bf+AdcTrkDaOVG2q4/Qtwp7lnhQO8SqV+Wgd8fTz/+Gz1bvAg07mG31rlYlpicVtVdhW6MJ6fxVJtyLumPIEaUYf59XeRbbfF7G48NNc+CFO0CfSobDncEykarLyTVm0/kXPff+5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=rCmAHFyt; arc=none smtp.client-ip=95.215.58.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Message-ID: <295ec119-b862-4ab9-bc24-c1a98313cd39@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1731335353;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3Ln2j19kFbUmJ8iVDewbftH/CZUQmtLyzIATkBOnw74=;
	b=rCmAHFytQ5/ZUTUZ2PSgwSERD83R8BbD6/6IHj9Kwd19otl+lEUNZGEFDQY7QEjhWoduXa
	99ZTZVbjHx3m187hglFCaSO9tcSOh+jEQlo+weGMYnUeGbNMU/Hi+x+WWmn7Z/VWqGGa2R
	TLyjtfP3GlV/XG1toAPtrtF7AT5H3B4=
Date: Mon, 11 Nov 2024 09:29:08 -0500
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH next] drm: zynqmp_dp: Unlock on error in
 zynqmp_dp_bridge_atomic_enable()
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Michal Simek <michal.simek@amd.com>, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org
References: <b4042bd9-c943-4738-a2e1-8647259137c6@stanley.mountain>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Sean Anderson <sean.anderson@linux.dev>
In-Reply-To: <b4042bd9-c943-4738-a2e1-8647259137c6@stanley.mountain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

On 11/11/24 04:06, Dan Carpenter wrote:
> We added some locking to this function, but accidentally forgot to unlock
> if zynqmp_dp_mode_configure() failed.  Use a guard lock to fix it.
> 
> Fixes: a7d5eeaa57d7 ("drm: zynqmp_dp: Add locking")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>  drivers/gpu/drm/xlnx/zynqmp_dp.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xlnx/zynqmp_dp.c b/drivers/gpu/drm/xlnx/zynqmp_dp.c
> index 25c5dc61ee88..0bea908b281e 100644
> --- a/drivers/gpu/drm/xlnx/zynqmp_dp.c
> +++ b/drivers/gpu/drm/xlnx/zynqmp_dp.c
> @@ -1537,7 +1537,7 @@ static void zynqmp_dp_bridge_atomic_enable(struct drm_bridge *bridge,
>  
>  	pm_runtime_get_sync(dp->dev);
>  
> -	mutex_lock(&dp->lock);
> +	guard(mutex)(&dp->lock);
>  	zynqmp_dp_disp_enable(dp, old_bridge_state);
>  
>  	/*
> @@ -1598,7 +1598,6 @@ static void zynqmp_dp_bridge_atomic_enable(struct drm_bridge *bridge,
>  	zynqmp_dp_write(dp, ZYNQMP_DP_SOFTWARE_RESET,
>  			ZYNQMP_DP_SOFTWARE_RESET_ALL);
>  	zynqmp_dp_write(dp, ZYNQMP_DP_MAIN_STREAM_ENABLE, 1);
> -	mutex_unlock(&dp->lock);
>  }
>  
>  static void zynqmp_dp_bridge_atomic_disable(struct drm_bridge *bridge,

Reviewed-by: Sean Anderson <sean.anderson@linux.dev>

Although this reverses the order of pm_runtime_put and mutex_unlock in
the error case, I don't think it matters.

