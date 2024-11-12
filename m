Return-Path: <kernel-janitors+bounces-6420-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DE3669C5ECB
	for <lists+kernel-janitors@lfdr.de>; Tue, 12 Nov 2024 18:22:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A3612283853
	for <lists+kernel-janitors@lfdr.de>; Tue, 12 Nov 2024 17:22:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A34F212D16;
	Tue, 12 Nov 2024 17:22:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="QLDH6lZU"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from out-171.mta0.migadu.com (out-171.mta0.migadu.com [91.218.175.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD531189B8A
	for <kernel-janitors@vger.kernel.org>; Tue, 12 Nov 2024 17:22:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731432137; cv=none; b=fF60LB5LErCWCRWWq+rJSJt7ErIPu6XT0F4n16BHGczFjpknOKLRR3LQkk1MdnmOZn9hmCWN2v5feQWyMIyaG7xRZzDkU7LbLQLbFXEtp31kgNO7L1zkFgOwlJLJG/OwTzM2vcmc4LUgfjsfTvOu/IC6/JK9rAIrV4r6mtrC7hI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731432137; c=relaxed/simple;
	bh=r1Y26rWuL55b2h/Wg51aWlCb8jZ7cV/tlzqaXPQg+FA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=B/Rf9uqcG4yKKXtCagRpth0Dc9cy82WH9YNfOl+XXKrFEIXcInoGgH4edn5Qg4TuLqPao4Z5TaukHW6APPK9IbKrR5DgIfESSLXwhu3d09EG46XWf1P+2q+UJ6AVd6f/m5FNvF6aODOFWVWdp6Xzxc00N0zDbfqzQIg2kw0Hk6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=QLDH6lZU; arc=none smtp.client-ip=91.218.175.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Message-ID: <5c2c6883-d81a-4869-9f32-48d23c0728ea@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1731432130;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Rfw+wN9AUH3h9IWdAAjZRROFX4GdxCR15t9sueSJP5E=;
	b=QLDH6lZUK7ldFBFFY60D1IJpEJpv6E6CdX/D0wMreRUW5s13VDtpQ6iWetQwB2fRloelJT
	P3wvGndCwU3q+yyxxJhHZCgficVY9HnxmwVTsxE+/TdfnUFdIvMPCJ16mn43n+W3FxNnEw
	dh1Svbb5dK9UzKQS5LfKFQmN8wlWqLY=
Date: Tue, 12 Nov 2024 12:22:05 -0500
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH next] drm: zynqmp_dp: Unlock on error in
 zynqmp_dp_bridge_atomic_enable()
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Dan Carpenter <dan.carpenter@linaro.org>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Michal Simek <michal.simek@amd.com>, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org
References: <b4042bd9-c943-4738-a2e1-8647259137c6@stanley.mountain>
 <20241112052754.GB21062@pendragon.ideasonboard.com>
 <37be000a-3ef8-4df4-aefa-b4d73487ad27@linux.dev>
 <20241112164305.GA24067@pendragon.ideasonboard.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Sean Anderson <sean.anderson@linux.dev>
In-Reply-To: <20241112164305.GA24067@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

On 11/12/24 11:43, Laurent Pinchart wrote:
> On Tue, Nov 12, 2024 at 09:41:58AM -0500, Sean Anderson wrote:
>> On 11/12/24 00:27, Laurent Pinchart wrote:
>> > Hi Dan,
>> > 
>> > Thank you for the patch.
>> > 
>> > On Mon, Nov 11, 2024 at 12:06:10PM +0300, Dan Carpenter wrote:
>> >> We added some locking to this function, but accidentally forgot to unlock
>> >> if zynqmp_dp_mode_configure() failed.  Use a guard lock to fix it.
>> >> 
>> >> Fixes: a7d5eeaa57d7 ("drm: zynqmp_dp: Add locking")
>> >> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
>> > 
>> > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>> > 
>> > Sean, how about replacing all the mutex_lock()/mutex_unlock() calls
>> > you've added in a7d5eeaa57d7 with guards ?
>> 
>> I have no objection to that.
> 
> Would you send a patch ? Otherwise I can do it.
> 

I can send a patch, but it will not be for a week or two.

--Sean

