Return-Path: <kernel-janitors+bounces-257-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DD057E9E14
	for <lists+kernel-janitors@lfdr.de>; Mon, 13 Nov 2023 15:05:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0D4CCB207DF
	for <lists+kernel-janitors@lfdr.de>; Mon, 13 Nov 2023 14:05:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23FE620B31;
	Mon, 13 Nov 2023 14:05:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lA4FOOmV"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66C3120B05
	for <kernel-janitors@vger.kernel.org>; Mon, 13 Nov 2023 14:05:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95728C433BF;
	Mon, 13 Nov 2023 14:05:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699884343;
	bh=sxsc1as84ufBJ/QWw+HF6gUxx16PTyNBJZX2C9hWzFg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=lA4FOOmVCxOsLUhsXylSsn0uQGk1cRkWNFFB6hIAml7Syoj4pWqKUW+f5D9ijJp+o
	 Xp7V5hUeMiGcWL6NiqOFEgsS7BQUKEDbDe/mpoD411tpclM83GCoAWtSuJoD/zahbk
	 VPg0CJR9J0cukizX6yczfOqSbmuDRo7ve9OMIv4hNaLd9HKNhlHpnz+nBTIWQ0bu7Y
	 w+7JoPKdOJqPRGqN04epRNOdRle7bJicQh95Sq6OGuCMGsrDxdLRKNWRk3jtRziMpX
	 M5rFjw/9gHgVU8bMuQPEEfYk4omp1HcrEisfzhbcWMraVsrJdMbuC13MSLKRc31IgD
	 l/kEmWi0paWpA==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, 
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, 
 linux-sound@vger.kernel.org, linux-tegra@vger.kernel.org
In-Reply-To: <b78685e4103f12931ddb09c1654bc6b04b640868.1699724240.git.christophe.jaillet@wanadoo.fr>
References: <b78685e4103f12931ddb09c1654bc6b04b640868.1699724240.git.christophe.jaillet@wanadoo.fr>
Subject: Re: [PATCH] ASoC: tegra: convert not to use
 dma_request_slave_channel()
Message-Id: <169988434099.3280890.15869529541068548630.b4-ty@kernel.org>
Date: Mon, 13 Nov 2023 14:05:40 +0000
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-0438c

On Sat, 11 Nov 2023 18:37:39 +0100, Christophe JAILLET wrote:
> dma_request_slave_channel() is deprecated. dma_request_chan() should
> be used directly instead.
> 
> Switch to the preferred function and update the error handling accordingly.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: tegra: convert not to use dma_request_slave_channel()
      commit: 8df735701a7051825254ec7a12a661307bb7bdc1

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


