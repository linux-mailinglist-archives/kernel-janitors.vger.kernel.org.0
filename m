Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4D25F35A31F
	for <lists+kernel-janitors@lfdr.de>; Fri,  9 Apr 2021 18:24:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234243AbhDIQYh (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Fri, 9 Apr 2021 12:24:37 -0400
Received: from mail.kernel.org ([198.145.29.99]:60932 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234222AbhDIQY1 (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 9 Apr 2021 12:24:27 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9BEDA611AE;
        Fri,  9 Apr 2021 16:24:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1617985454;
        bh=u+yMz9sTai8LTSnsmwKVcgcxO9gvfLc4Y4/q7OTEhCM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=dWIQmAabbDh/HcS3qeAwu1qmsH5h200FJgIG7BN1GaQYkZ34d5kdTMmXCHJo0jeC6
         Aq9BcYdYl+4DO/QplmAjHiOpxjDzRHQKT8W2VJfRZw66Mm7ax3GAb42DVnh2App4av
         tLcv9xOD7rWPCfF0GfvKetcqosm/y9bhvSCBCOdPvxtuQ0i9JL8n/z92fYtTJn3hiC
         1Opab0gfQgW9AaCtU0cI2w+DPMTHZBkXUDXEn2w0azKA1W02E5dr5F5ef/xJKWHP+T
         rhq5L0zYbXlexveaRmkwdBcpkuVXqnyR8Dke49h2KFfDPIzgp3LEXv8sE4pV12Yne0
         pIwxSQ3xUIBiw==
From:   Mark Brown <broonie@kernel.org>
To:     Jaroslav Kysela <perex@perex.cz>, Ye Bin <yebin10@huawei.com>,
        Oder Chiou <oder_chiou@realtek.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Takashi Iwai <tiwai@suse.com>
Cc:     Mark Brown <broonie@kernel.org>, alsa-devel@alsa-project.org,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        Hulk Robot <hulkci@huawei.com>
Subject: Re: [PATCH -next] ASoC: rt715-sdca: Constify static struct snd_soc_dai_ops
Date:   Fri,  9 Apr 2021 17:22:59 +0100
Message-Id: <161798344184.47643.14354986986103091724.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210408062654.803538-1-yebin10@huawei.com>
References: <20210408062654.803538-1-yebin10@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Thu, 8 Apr 2021 14:26:54 +0800, Ye Bin wrote:
> The snd_soc_dai_ops structures is only stored in the ops field of a
> snd_soc_dai_driver structure, so make the snd_soc_dai_ops structure
> const to allow the compiler to put it in read-only memory.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: rt715-sdca: Constify static struct snd_soc_dai_ops
      commit: 1f34084cc85d654a542c547df6714dae8a32d3c9

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
