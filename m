Return-Path: <kernel-janitors+bounces-353-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F5657F192E
	for <lists+kernel-janitors@lfdr.de>; Mon, 20 Nov 2023 17:55:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6D0811C21020
	for <lists+kernel-janitors@lfdr.de>; Mon, 20 Nov 2023 16:55:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45DF31EA7D;
	Mon, 20 Nov 2023 16:55:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hoHroQ0B"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 911341BDFB
	for <kernel-janitors@vger.kernel.org>; Mon, 20 Nov 2023 16:55:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27CE8C433C8;
	Mon, 20 Nov 2023 16:55:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700499340;
	bh=MGF7xaDM2yhd8xR3ZAVbFdVe7AAYUmj0We9ffdF28qc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=hoHroQ0Bqn+Vo82WU7c9eiB+RslcmRK597GhGPEVVJf+QtWeqGixaNvg0bk7MthF5
	 AIoEMPIes4JVVMsWNPy1aHuxaU/sg9rAyY1/aVF4eVx4fwjuxKTwX266971pEvwkuK
	 Imvugym29y6DGTnnlUVoNYDCV6NCkyONVEJMBU2RpHgF314VFIv1/EGhVqb7Y2Eb9K
	 XssE7aEfa7LFGiMJ6U6PDF4U2liuNJgnVMYEgibzGKGUjZOk3FjomYA8TMZoE+APhf
	 C3BI3G/XTZhWN+psJOLr+KZefRIRIi2saLfnp2jUBGF8EYxq57+V6gvnwVOlADBXZE
	 BzCfY/Wh3FaXA==
From: Mark Brown <broonie@kernel.org>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, 
 linux-spi@vger.kernel.org
In-Reply-To: <1c88236b5d6bff0af902492ea9e066c8cb0dfef5.1700391566.git.christophe.jaillet@wanadoo.fr>
References: <1c88236b5d6bff0af902492ea9e066c8cb0dfef5.1700391566.git.christophe.jaillet@wanadoo.fr>
Subject: Re: [PATCH] spi: ingenic: convert not to use
 dma_request_slave_channel()
Message-Id: <170049933886.658720.721164714596647527.b4-ty@kernel.org>
Date: Mon, 20 Nov 2023 16:55:38 +0000
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-0438c

On Sun, 19 Nov 2023 11:59:50 +0100, Christophe JAILLET wrote:
> dma_request_slave_channel() is deprecated. dma_request_chan() should
> be used directly instead.
> 
> Switch to the preferred function and update the error handling accordingly.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/1] spi: ingenic: convert not to use dma_request_slave_channel()
      commit: d3bb2cb0f1769cb3424f3102ebcde51d18065424

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark


