Return-Path: <kernel-janitors+bounces-5378-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C9B4976520
	for <lists+kernel-janitors@lfdr.de>; Thu, 12 Sep 2024 11:05:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E92481F24872
	for <lists+kernel-janitors@lfdr.de>; Thu, 12 Sep 2024 09:05:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCBE619258D;
	Thu, 12 Sep 2024 09:05:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="aCUFUUto";
	dkim=pass (1024-bit key) header.d=amazonses.com header.i=@amazonses.com header.b="XNjiDcpC"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from a7-44.smtp-out.eu-west-1.amazonses.com (a7-44.smtp-out.eu-west-1.amazonses.com [54.240.7.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D0E2136338;
	Thu, 12 Sep 2024 09:05:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.240.7.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726131913; cv=none; b=qoSiK71L9lBjGEVnNoDmAGfXCjuLI3up2qCAJhcTV8JMPXZ5DNeYwcTp0f0lrKmenDDzQYWn421M6OIlCYNHhcueztMBj2IIY7RoGa4uDnyck+Fjw75FrHZD4AhiLOcbkU3P39XpgN9eGaIKz8h7wccA2kvnSjLGUDQtvUK4h4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726131913; c=relaxed/simple;
	bh=cU5d1gV2+5V9tfSQ7PLewaaCXoMfhGGhE2QKuS1Cbb4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BdTztKJm8N+JpidlSdR4h8bKysAJDii5bP+Ai8VsvhB9fJkqXFbDpfocqrKJaRlow7XqRDYdCWMZ7K7a63UEYUFSKnvz0NzRQBf1LBvcRGzcSmOWZWWtonk/fTjTD1ogsBmjcZ2AgGdBk/wLPe+r6m6mJeBBUvfd2Y6ZX5ZOk5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=amazonses.collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=aCUFUUto; dkim=pass (1024-bit key) header.d=amazonses.com header.i=@amazonses.com header.b=XNjiDcpC; arc=none smtp.client-ip=54.240.7.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazonses.collabora.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=4232tfv5ebdrjdwkr5zzm7kytdkokgug; d=collabora.com; t=1726131909;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=cU5d1gV2+5V9tfSQ7PLewaaCXoMfhGGhE2QKuS1Cbb4=;
	b=aCUFUUtoA6CaviWyQUW8BFB5LSp7jxDQJASTzRZyljZ2NGVHgwHPy+yFMvrrZkli
	sigAY1NBIXlivAa+SiEDhWg3TOmEtvdqiww7YuI/A9aa3aLihWSbQAxVeYeQ5LxOyQ/
	HqV2DtubHM8UH4WEuxClMOmZ6dofFu53NQdNCjoFHxGpPXe2kNBctzJauPskY0vWEnr
	MR9A9d5JxsN8ynf6nnv/1bU1DBALmQRvc/ovzd9DDNtzaxz59fXmQbEXPEcq2wzhWmD
	WWseEc+rRCqekmVGCbVHIV7xfCSnB/LEFNdbEll/G8HawdAe8az+PfZ6TkZMmyLUofC
	XRULCmMBnw==
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=uku4taia5b5tsbglxyj6zym32efj7xqv; d=amazonses.com; t=1726131909;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Feedback-ID;
	bh=cU5d1gV2+5V9tfSQ7PLewaaCXoMfhGGhE2QKuS1Cbb4=;
	b=XNjiDcpCvS80r6n8buYYjtUVfC+b8ki7uKSY1vF2aSJnotG1AYmi/hnkmG1WjRat
	KLNSgdZr3+133CzYSs/PJYGlm+bC86tKUKjBbtnz93qszw4TzDKgqwrIv/Oicdyjntt
	25hZtya2gSfxhvKHG9k5M12xVfY6bBA1VG4eILgQ=
Message-ID: <01020191e57ab41a-424e6c2f-08fb-43db-b45a-af4aaa22ef0b-000000@eu-west-1.amazonses.com>
Date: Thu, 12 Sep 2024 09:05:09 +0000
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/mediatek: Fix potential NULL dereference in
 mtk_crtc_destroy()
To: Dan Carpenter <dan.carpenter@linaro.org>, 
	Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kernel-janitors@vger.kernel.org, 
	=?UTF-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>
References: <cc537bd6-837f-4c85-a37b-1a007e268310@stanley.mountain>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <cc537bd6-837f-4c85-a37b-1a007e268310@stanley.mountain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Feedback-ID: ::1.eu-west-1.YpP9ZbxnARFfy3Cb5pfsLd/pdsXBCNK0KEM7HforL4k=:AmazonSES
X-SES-Outgoing: 2024.09.12-54.240.7.44

Il 12/09/24 10:44, Dan Carpenter ha scritto:
> In mtk_crtc_create(), if the call to mbox_request_channel() fails then we
> set the "mtk_crtc->cmdq_client.chan" pointer to NULL.  In that situation,
> we do not call cmdq_pkt_create().
> 
> During the cleanup, we need to check if the "mtk_crtc->cmdq_client.chan"
> is NULL first before calling cmdq_pkt_destroy().  Calling
> cmdq_pkt_destroy() is unnecessary if we didn't call cmdq_pkt_create() and
> it will result in a NULL pointer dereference.
> 
> Fixes: 7627122fd1c0 ("drm/mediatek: Add cmdq_handle in mtk_crtc")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



