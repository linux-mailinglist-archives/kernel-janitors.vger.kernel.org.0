Return-Path: <kernel-janitors+bounces-3804-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BCB890200D
	for <lists+kernel-janitors@lfdr.de>; Mon, 10 Jun 2024 12:58:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C9B87B26527
	for <lists+kernel-janitors@lfdr.de>; Mon, 10 Jun 2024 10:53:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE85A80C13;
	Mon, 10 Jun 2024 10:46:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jnq1xdTi"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5926E14A4FC;
	Mon, 10 Jun 2024 10:46:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718016368; cv=none; b=YvgMSxWFk/nkYKYdAATTx5uiGGvS72zr2n0DgOXJPs2dufZ3EIBHiGVpmAJ+5ZSNt2yRKHVB3byla8SpmiilT6AZ7t6HF3+DMFNlm4Wc9aTGXDBKuZwJZ20uXCMHsW/XAohgWBreREViBCzzM1YNIfEbm4sSJrEAk5URNVRWIqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718016368; c=relaxed/simple;
	bh=jHmfCgTv50mAeFlsqnzidtEUHiaK9qP6a3u139Rj6Ac=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=H6RA7jg+c2UiVIo8P8SkGa2MhBvMHaa0Am3W9DUAmlL6Qt1FJq7LMVj1Ia2TQblXRCiLrx8hmPCojp5BakfLYK7ZDvFFAehvmNsZACixUUnH0KKjHGmOisePxBzkHNPnXMJzKaxeiV8QZH+NIG/ckrLmX/rrtqNGwRnZ9GpusvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jnq1xdTi; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 891FCC2BBFC;
	Mon, 10 Jun 2024 10:46:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718016367;
	bh=jHmfCgTv50mAeFlsqnzidtEUHiaK9qP6a3u139Rj6Ac=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=jnq1xdTiz+n9gsuwRh329YAT3+L/0vd3W/QXu3ICCr81VlNaty07ajSF0iicpBbpE
	 VdGxZY9UkMqX62xVy4XY4xocQcM3ZxPOt5zuXm9Fp5ojg1lSdl6NYhHVEphLYsDa/V
	 MiJwM3Tc+qkNK+LZY0fH9owEphg6oPdN1DPIvY+tp7LZ7pbAvgCxoXxdsqYrV31bZw
	 NX043rLwLXzuiVmbXvZcGbjL4FS+Fq1tEsuiRpiCV4OinvPwkumodU7MVntwatlolu
	 nNCuq8hi4VN0hqv1dKFWz5ePPsiihXWF4e5N52x5HcpNJIQPflKXPF40wYDZM8J9l6
	 6QNzIohSuxr/w==
From: Maxime Ripard <mripard@kernel.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 kernel-janitors@vger.kernel.org
In-Reply-To: <20240609-md-drivers-gpu-drm-bridge-v1-1-b582c5c815d7@quicinc.com>
References: <20240609-md-drivers-gpu-drm-bridge-v1-1-b582c5c815d7@quicinc.com>
Subject: Re: (subset) [PATCH] drm/bridge: add missing MODULE_DESCRIPTION()
 macros
Message-Id: <171801636547.423417.6877237960333833102.b4-ty@kernel.org>
Date: Mon, 10 Jun 2024 12:46:05 +0200
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

On Sun, 09 Jun 2024 10:06:17 -0700, Jeff Johnson wrote:
> make allmodconfig && make W=1 C=1 reports:
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpu/drm/bridge/lontium-lt9611.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpu/drm/bridge/lontium-lt9611uxc.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpu/drm/bridge/sil-sii8620.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpu/drm/bridge/sii9234.o
> 
> Add the missing invocations of the MODULE_DESCRIPTION() macro.
> 
> [...]

Applied to misc/kernel.git (drm-misc-next).

Thanks!
Maxime


