Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1EA722D9ECE
	for <lists+kernel-janitors@lfdr.de>; Mon, 14 Dec 2020 19:20:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2440690AbgLNSSq (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Mon, 14 Dec 2020 13:18:46 -0500
Received: from mail.kernel.org ([198.145.29.99]:42130 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2440685AbgLNSSc (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 14 Dec 2020 13:18:32 -0500
From:   Mark Brown <broonie@kernel.org>
Authentication-Results: mail.kernel.org; dkim=permerror (bad message/signature format)
To:     Dan Carpenter <dan.carpenter@oracle.com>,
        Cezary Rojewski <cezary.rojewski@intel.com>,
        Guneshwor Singh <guneshwor.o.singh@intel.com>
Cc:     Takashi Iwai <tiwai@suse.com>, kernel-janitors@vger.kernel.org,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
        alsa-devel@alsa-project.org,
        Liam Girdwood <liam.r.girdwood@linux.intel.com>,
        Jie Yang <yang.jie@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
In-Reply-To: <X9NEvCzuN+IObnTN@mwanda>
References: <X9NEvCzuN+IObnTN@mwanda>
Subject: Re: [PATCH] ASoC: Intel: fix error code cnl_set_dsp_D0()
Message-Id: <160796986130.45789.8331512610981299314.b4-ty@kernel.org>
Date:   Mon, 14 Dec 2020 18:17:41 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Fri, 11 Dec 2020 13:06:52 +0300, Dan Carpenter wrote:
> Return -ETIMEDOUT if the dsp boot times out instead of returning
> success.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: Intel: fix error code cnl_set_dsp_D0()
      commit: f373a811fd9a69fc8bafb9bcb41d2cfa36c62665

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
