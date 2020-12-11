Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7EC972D7D4B
	for <lists+kernel-janitors@lfdr.de>; Fri, 11 Dec 2020 18:52:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388518AbgLKRvG (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Fri, 11 Dec 2020 12:51:06 -0500
Received: from mail.kernel.org ([198.145.29.99]:60182 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2436541AbgLKRum (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 11 Dec 2020 12:50:42 -0500
From:   Mark Brown <broonie@kernel.org>
Authentication-Results: mail.kernel.org; dkim=permerror (bad message/signature format)
To:     Dan Carpenter <dan.carpenter@oracle.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Tzung-Bi Shih <tzungbi@google.com>
Cc:     Takashi Iwai <tiwai@suse.com>, kernel-janitors@vger.kernel.org,
        linux-mediatek@lists.infradead.org, alsa-devel@alsa-project.org,
        Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <X9NFg3KVm16Gx6Io@mwanda>
References: <X9NFg3KVm16Gx6Io@mwanda>
Subject: Re: [PATCH] ASoC: mediatek: mt8183: delete some unreachable code
Message-Id: <160770898112.26354.4365158422154864954.b4-ty@kernel.org>
Date:   Fri, 11 Dec 2020 17:49:41 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Fri, 11 Dec 2020 13:10:11 +0300, Dan Carpenter wrote:
> This has a goto followed by an unreachable return statement.  The goto
> is correct because it cleans up so the current runtime behavior is fine.
> Let's delete the unreachable return statement.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: mediatek: mt8183: delete some unreachable code
      commit: 1688dbe7a730e1c1ed05b9dde497288494d75ad4

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
