Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AADC62FDE56
	for <lists+kernel-janitors@lfdr.de>; Thu, 21 Jan 2021 02:01:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726634AbhAUBAF (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Wed, 20 Jan 2021 20:00:05 -0500
Received: from mail.kernel.org ([198.145.29.99]:54086 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731820AbhAUAIT (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 20 Jan 2021 19:08:19 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id AF17A2376E;
        Thu, 21 Jan 2021 00:07:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1611187659;
        bh=CH+pY4Va0MCe0xn1lwnpTiAE17DBzHissyzpbhiBDas=;
        h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
        b=B2H7uQ1hy70q5VBD1FFs9Kd2OcC9mMirzzcZXEIlbQF9KYC+LHcy3LDGcjxOsUqBh
         2DbgEol8O/6Tmt/ovCq2L9u7Z2bHRsVP1LZablVtalkxtOIwO6odtUiPgBZTswIhaJ
         mTSNs/gWJpqMmW6u1DPFSqr7Q43NpKmGbjXEHWze4dlFN1NpujNXTbJh1bf9sFyR8H
         sx5U4JJIVmF9O2eFGjfiJs4TQ33u/eQXS/kjAJLQzApckDanGwAHFGyyZoQVZhCUjn
         Ialwe8lJUKk/ZAsM62gNiKAmKoMkIplzMi2ZfZ4H0WNz7dbf5d+E6PIytYbQzwfJKs
         Y+Z7oBgQ16pXA==
From:   Mark Brown <broonie@kernel.org>
To:     Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        Liam Girdwood <lgirdwood@gmail.com>
Cc:     kernel-janitors@vger.kernel.org, alsa-devel@alsa-project.org,
        Takashi Iwai <tiwai@suse.com>
In-Reply-To: <YAf+8QZoOv+ct526@mwanda>
References: <YAf+8QZoOv+ct526@mwanda>
Subject: Re: [PATCH] ASoC: topology: Fix memory corruption in soc_tplg_denum_create_values()
Message-Id: <161118753484.45718.1419483152294927470.b4-ty@kernel.org>
Date:   Thu, 21 Jan 2021 00:05:34 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Wed, 20 Jan 2021 12:59:13 +0300, Dan Carpenter wrote:
> The allocation uses sizeof(u32) when it should use sizeof(unsigned long)
> so it leads to memory corruption later in the function when the data is
> initialized.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: topology: Fix memory corruption in soc_tplg_denum_create_values()
      commit: 543466ef3571069b8eb13a8ff7c7cfc8d8a75c43

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
