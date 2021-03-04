Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B23EA32C9DE
	for <lists+kernel-janitors@lfdr.de>; Thu,  4 Mar 2021 02:20:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237463AbhCDBO3 (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Wed, 3 Mar 2021 20:14:29 -0500
Received: from mail.kernel.org ([198.145.29.99]:32882 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1452905AbhCDA5L (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 3 Mar 2021 19:57:11 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4CE3C64E86;
        Thu,  4 Mar 2021 00:56:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1614819390;
        bh=HTFsv6Fv1iYZbTyUPYTDVHFZqM3lA61amO6iQi9gLgU=;
        h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
        b=RmOiUzLtiSBt3o6wiPFTH/7CT6WnBQdjuEL4dQjWNhho1+B5vpNaFuEBU1P6uVTlY
         jGXkSWC3Ei62k9+vSdzEEYKWn4LRUPvAvZZNmAgWHa3ahVuIShNcjKbkWKStqZ//uI
         zbCnkL96OGJdTfNcanMJ8tujdTxYJGDmCVzFHL5GNAE4VjAVhxp+VBgNzU7VnkBC53
         U44g+O0RvJ6s3nEao8PxuCphPWOB1GP8HQyz8wzILRFQ3vCkZuxpaFyjfPCbDklEXx
         qvKYf4snK+6fjxHfF5zd6r7R0BAkXs7xGX0p0Ge4hO99r20Z6SImNUx0UVSKElmqcv
         mIILruaj7Jc0A==
From:   Mark Brown <broonie@kernel.org>
To:     Colin King <colin.king@canonical.com>,
        linuxppc-dev@lists.ozlabs.org, Jaroslav Kysela <perex@perex.cz>,
        alsa-devel@alsa-project.org, Fabio Estevam <festevam@gmail.com>,
        Shengjiu Wang <shengjiu.wang@gmail.com>,
        Timur Tabi <timur@kernel.org>,
        Nicolin Chen <nicoleotsuka@gmail.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Xiubo Li <Xiubo.Lee@gmail.com>, Takashi Iwai <tiwai@suse.com>
Cc:     linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
In-Reply-To: <20210303091835.5024-1-colin.king@canonical.com>
References: <20210303091835.5024-1-colin.king@canonical.com>
Subject: Re: [PATCH][next] ASoC: fsl: fsl_easrc: Fix uninitialized variable st2_mem_alloc
Message-Id: <161481924070.9553.9267870549828564094.b4-ty@kernel.org>
Date:   Thu, 04 Mar 2021 00:54:00 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Wed, 3 Mar 2021 09:18:35 +0000, Colin King wrote:
> A previous cleanup commit removed the ininitialization of st2_mem_alloc.
> Fix this by restoring the original behaviour by initializing it to zero.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: fsl: fsl_easrc: Fix uninitialized variable st2_mem_alloc
      commit: 84e4eb57ed620adc0371579a5662c4924a72a306

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
