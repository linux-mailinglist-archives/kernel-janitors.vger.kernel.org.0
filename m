Return-Path: <kernel-janitors+bounces-618-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C42B380A68C
	for <lists+kernel-janitors@lfdr.de>; Fri,  8 Dec 2023 16:06:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6D8E51F21314
	for <lists+kernel-janitors@lfdr.de>; Fri,  8 Dec 2023 15:06:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DEA8A208D5;
	Fri,  8 Dec 2023 15:06:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="j5tsOrKq"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CCDF2122;
	Fri,  8 Dec 2023 07:06:24 -0800 (PST)
Received: by mail.gandi.net (Postfix) with ESMTPSA id DCDF440007;
	Fri,  8 Dec 2023 15:06:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1702047983;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=IXV0DYoRQotwA20i111wDe8hYdhC1f2YduLzVN5R2tA=;
	b=j5tsOrKqA3qIr0oG1AwXQOLwYrcPTn0nWpWWO3ojA1yo09CuZ9qq1egetdd/dkHRro9N1T
	6RKjzZQFqMTSyRWZHgSIEWlmUeOREkfmG2yLumqmBgPF4vHMr7eCldF0hLZFDDTykXxeTT
	TRhQU6TNSpZmQ2DThOmorRfTwvM2hTez3C2AW9I239Vcqz5yy1ybTzpUMFT1gxsQSDHndX
	irJRO9VpWe+x2qwqP2rLgnUpZYEzzHIbQcmNPt36O9zw8er7FKR53Gi3hlkxOJxMozl9uT
	/QeJF6RnL+/qkv6Tk0ozl4k7w28T2FE5k4mlUzmdSvQe1aKI+jWuTI5cEv1lfQ==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Lukas
 Bulwahn <lukas.bulwahn@gmail.com>
Subject: Re: [PATCH] MAINTAINERS: add Marvell MBus driver to Marvell EBU
 SoCs support
In-Reply-To: <20231121093414.11926-1-lukas.bulwahn@gmail.com>
References: <20231121093414.11926-1-lukas.bulwahn@gmail.com>
Date: Fri, 08 Dec 2023 16:06:21 +0100
Message-ID: <87cyvgente.fsf@BL-laptop>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-GND-Sasl: gregory.clement@bootlin.com

Lukas Bulwahn <lukas.bulwahn@gmail.com> writes:

> While doing some code cleanup in drivers/bus/, I noticed that the file
> drivers/bus/mvebu-mbus.c has no maintainer.
>
> Although the file has not been touched a lot lately, the git history tells
> us that Gregory Clement and Andrew Lunn integrated patches specific to
> this driver code. Further, the driver's config depends on config
> PLAT_ORION, and the code for this platform is defined in
> arch/arm/plat-orion/, which is part of ARM/Marvell Dove/MV78xx0/Orion SOC
> support with Gregory and Andrew already being its maintainer.
>
> Add drivers/bus/mvebu-mbus.c to ARM/Marvell Dove/MV78xx0/Orion SOC support.
>
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>

Applied on mvebu/arm

Thanks,

Gregory
> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index e9cbf6e353bd..9613c9c3cc97 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2317,6 +2317,7 @@ F:	arch/arm/mach-dove/
>  F:	arch/arm/mach-mv78xx0/
>  F:	arch/arm/mach-orion5x/
>  F:	arch/arm/plat-orion/
> +F:	drivers/bus/mvebu-mbus.c
>  F:	drivers/soc/dove/
>  
>  ARM/Marvell Kirkwood and Armada 370, 375, 38x, 39x, XP, 3700, 7K/8K, CN9130 SOC support
> -- 
> 2.17.1
>

-- 
Gregory Clement, Bootlin
Embedded Linux and Kernel engineering
http://bootlin.com

