Return-Path: <kernel-janitors+bounces-3812-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BA4EF902154
	for <lists+kernel-janitors@lfdr.de>; Mon, 10 Jun 2024 14:12:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CF1D11C20E3A
	for <lists+kernel-janitors@lfdr.de>; Mon, 10 Jun 2024 12:12:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51A6D7E782;
	Mon, 10 Jun 2024 12:12:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="YHTFNpZ6"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DD1654650;
	Mon, 10 Jun 2024 12:12:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718021549; cv=none; b=IzqRfq9ZIrxKe2GWdvK6PHtX9QoOQsov5X5aYhwooAOQTg0e/+sz/oeNCJqAO7WfFbwUuIfK3sqBYq3lMrjdCf+GzxiezxwxeSgK0pntB40I4LPl4r+s1RK3ZV3vCcJsSvjR0qI5lrSnMOuqtv7GMLp0ymL50LA1MZFoM2yFDH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718021549; c=relaxed/simple;
	bh=CoWMTLN3xVMCKujiQ62WewBUqmIwUhZeSl46qqqThsw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jskYjNP5QuCHPSCmrWM+VycrpBsAu+WFuICtPKjlpk7hqEeVrLV0MkhKEp5fIfktbix9M++Tw6jkjIysOQnWAlq9kcxjmFlnmQDVHwQWmZkZViPDc4JjEmM8LGGEVZ8wTl4JlYyZOcKlmpd+IL2WvnO/8lPrHa70kPcp3cmFE5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=YHTFNpZ6; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=X7eB5tOr4Wtz0yyAy8Xe6lpdiamgY9NpFstiAYK532I=; b=YHTFNpZ6MEWDOBw6od4XW+32LY
	/g5YT6FOwEEanmRB1F8hkWFhzc7UxoWAaWNUjN22xwQCaA7WeDM6BY9MrT77az3W6eRR0DmyNNX5v
	wMvuOHuKyQFDMV4SlH2iHySeYPtyedn7HRUD8Z+PSsQfiVzq4QAJC2hKd3H/ncFauJ84=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1sGdsd-00HII0-5t; Mon, 10 Jun 2024 14:12:07 +0200
Date: Mon, 10 Jun 2024 14:12:07 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] irqchip: add missing MODULE_DESCRIPTION() macros
Message-ID: <91eae7c8-ecb5-4076-9d74-e0f073218875@lunn.ch>
References: <20240608-md-drivers-irqchip-v1-1-dd02c3229277@quicinc.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240608-md-drivers-irqchip-v1-1-dd02c3229277@quicinc.com>

On Sat, Jun 08, 2024 at 09:14:37AM -0700, Jeff Johnson wrote:
> On x86, make allmodconfig && make W=1 C=1 reports:
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/irqchip/irq-ts4800.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/irqchip/irq-meson-gpio.o
> 
> Add the missing invocation of the MODULE_DESCRIPTION() macro to all
> files which have a MODULE_LICENSE().  This includes a 3rd file,
> irq-mvebu-pic.c, which did not produce a warning with the x86
> allmodconfig, but which may cause this warning with other kernel
> configurations.
> 
> Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> ---
>  drivers/irqchip/irq-meson-gpio.c | 1 +
>  drivers/irqchip/irq-mvebu-pic.c  | 1 +

For the Marvell change, but the rest looks sensible as well:

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

