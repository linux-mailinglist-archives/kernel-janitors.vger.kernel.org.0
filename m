Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5041938B8C5
	for <lists+kernel-janitors@lfdr.de>; Thu, 20 May 2021 23:08:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229996AbhETVJr (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Thu, 20 May 2021 17:09:47 -0400
Received: from mail.kernel.org ([198.145.29.99]:40070 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229971AbhETVJn (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 20 May 2021 17:09:43 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 956B361355;
        Thu, 20 May 2021 21:08:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1621544902;
        bh=8ELMlxBpUUAE7ubz9VhApkiJhq+FPqvYh5sDquV8mog=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=leBo93YJ55CgttPP6pHoPbXyLt4Ym7IO2Srph5Gz8wPur9dc2dCGiLMWWBi8VsUUM
         ZrXujb8yx0koSMCOjblPCCKm4dmV2i6A9gnOzvJojpKn7NhrJdL+ZrsgCMhqd2EQoc
         aZehVbn81PFcAkbfm71xtz0e5AUAcPFnL5TTftP4Ly+bS7xf55ognPcaRjp146mDQS
         6f3RvzNNkLIj9JAeKuPL9pHPiHPIVaugOOzHc7X8rkHOxglBOMcVxws+qlYFDprOgK
         g6N570YbnmiTXO2ABx7O9RwzQFocJynnL/dZhX7cmJ3EZ0xV6vT2MK64fe95Q0zAUe
         txwBZu3N+z1dA==
From:   Mark Brown <broonie@kernel.org>
To:     Dan Carpenter <dan.carpenter@oracle.com>,
        James Schulman <james.schulman@cirrus.com>
Cc:     Mark Brown <broonie@kernel.org>,
        Paul Handrigan <Paul.Handrigan@cirrus.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Takashi Iwai <tiwai@suse.com>,
        David Rhodes <david.rhodes@cirrus.com>,
        alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: Re: [PATCH] ASoC: cs35l33: fix an error code in probe()
Date:   Thu, 20 May 2021 22:08:04 +0100
Message-Id: <162154465460.5161.4887908906712264006.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <YKXuyGEzhPT35R3G@mwanda>
References: <YKXuyGEzhPT35R3G@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Thu, 20 May 2021 08:08:24 +0300, Dan Carpenter wrote:
> This error path returns zero (success) but it should return -EINVAL.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: cs35l33: fix an error code in probe()
      commit: 833bc4cf9754643acc69b3c6b65988ca78df4460

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
