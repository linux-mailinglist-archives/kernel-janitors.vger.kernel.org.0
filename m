Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B77B62D7D4C
	for <lists+kernel-janitors@lfdr.de>; Fri, 11 Dec 2020 18:52:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2436579AbgLKRvG (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Fri, 11 Dec 2020 12:51:06 -0500
Received: from mail.kernel.org ([198.145.29.99]:60354 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2436551AbgLKRvA (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 11 Dec 2020 12:51:00 -0500
From:   Mark Brown <broonie@kernel.org>
Authentication-Results: mail.kernel.org; dkim=permerror (bad message/signature format)
To:     Charles Keepax <ckeepax@opensource.cirrus.com>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        Liam Girdwood <lgirdwood@gmail.com>
Cc:     Luo Meng <luomeng12@huawei.com>, Takashi Iwai <tiwai@suse.com>,
        James Schulman <james.schulman@cirrus.com>,
        David Rhodes <david.rhodes@cirrus.com>,
        kernel-janitors@vger.kernel.org, patches@opensource.cirrus.com,
        Vlad Karpovich <Vlad.Karpovich@cirrus.com>,
        alsa-devel@alsa-project.org,
        Adam Brickman <Adam.Brickman@cirrus.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <X9B0keV/02wrx9Xs@mwanda>
References: <X9B0keV/02wrx9Xs@mwanda>
Subject: Re: [PATCH] ASoC: wm_adsp: remove "ctl" from list on error in wm_adsp_create_control()
Message-Id: <160770898111.26354.10129109008284234263.b4-ty@kernel.org>
Date:   Fri, 11 Dec 2020 17:49:41 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Wed, 9 Dec 2020 09:54:09 +0300, Dan Carpenter wrote:
> The error handling frees "ctl" but it's still on the "dsp->ctl_list"
> list so that could result in a use after free.  Remove it from the list
> before returning.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: wm_adsp: remove "ctl" from list on error in wm_adsp_create_control()
      commit: 85a7555575a0e48f9b73db310d0d762a08a46d63

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
