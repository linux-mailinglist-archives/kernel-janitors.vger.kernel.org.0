Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E7B3A2A4E12
	for <lists+kernel-janitors@lfdr.de>; Tue,  3 Nov 2020 19:14:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729151AbgKCSOp (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Tue, 3 Nov 2020 13:14:45 -0500
Received: from mail.kernel.org ([198.145.29.99]:37872 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729148AbgKCSOo (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 3 Nov 2020 13:14:44 -0500
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A7E6B20757;
        Tue,  3 Nov 2020 18:14:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1604427284;
        bh=rlaodbKclAkC6Coj6nq020T6JzZzry/zVFbMTiBgf1o=;
        h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
        b=zsDp7ISlclZ5eOKZg9+BpvDhGoB7xlEUO/gxt02fz5rkS45pKBV/eEvEZyEKVVnBB
         xJ8Ds3TH0WBAKxCIZ8mvbyeeGbw1w79iHlgU2sPriYeUNKnKwzugFQ2Pv+u+TxJZl2
         kd6QIy7KHWteqBQC4v6BO79CiPJVy5XQYLkHGCRs=
Date:   Tue, 03 Nov 2020 18:14:35 +0000
From:   Mark Brown <broonie@kernel.org>
To:     Dan Carpenter <dan.carpenter@oracle.com>,
        Patrick Lai <plai@codeaurora.org>
Cc:     Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
        alsa-devel@alsa-project.org,
        Banajit Goswami <bgoswami@codeaurora.org>,
        kernel-janitors@vger.kernel.org
In-Reply-To: <20201103101853.GD1127762@mwanda>
References: <20201103101853.GD1127762@mwanda>
Subject: Re: [PATCH] ASoC: qcom: sc7180: Fix some indenting in sc7180_lpass_alloc_dma_channel()
Message-Id: <160442726962.14840.1588435496192621655.b4-ty@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Tue, 3 Nov 2020 13:18:53 +0300, Dan Carpenter wrote:
> This code is correct, but it should be indented one more tab.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: qcom: sc7180: Fix some indenting in sc7180_lpass_alloc_dma_channel()
      commit: 3d13ea9b8db71515d8f4795ec7a044e75999bd83

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
