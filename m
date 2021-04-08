Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 293DB358A41
	for <lists+kernel-janitors@lfdr.de>; Thu,  8 Apr 2021 18:56:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232431AbhDHQzy (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Thu, 8 Apr 2021 12:55:54 -0400
Received: from mail.kernel.org ([198.145.29.99]:41864 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232418AbhDHQzx (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 8 Apr 2021 12:55:53 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id B840A61158;
        Thu,  8 Apr 2021 16:55:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1617900942;
        bh=I1Rg2nveovVTb3EpMQgIGYLULEwlNQWKYxhFMmedRtM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=q5r0xaTF+ERvgelyEYxIg7OzPZRFkbgewP8I0Qrp58CHKwvJ56tqWn6QeqKIuKlun
         ZErLhPkzpBRZl3bssOO11Jq+vEubqeUWxQnE9zdkLma9H0GLJRoc0ue3/HOkBNcj9D
         JklwhmGphaYpfqdK41KQKVtClMXQlsAHFbG4vGhhRcQZMKiJaRZlgh0b2xidDZyRsV
         JBNQb3WCWi53+2oJN6m6M9WNRijmoQbXWEPc9Clv0EojhDO6IJnmzq/qyjWwF5bd9Y
         ftJtdzaA2ClO/6GZd3Vwt064wiT5hudntVi3gvkqKmPV7NbWvmEBC+A9zt8VQpSc02
         xIKTlQecaRAxA==
From:   Mark Brown <broonie@kernel.org>
To:     Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
        Ye Bin <yebin10@huawei.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Jaroslav Kysela <perex@perex.cz>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Takashi Iwai <tiwai@suse.com>
Cc:     Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org,
        alsa-devel@alsa-project.org, Hulk Robot <hulkci@huawei.com>,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH -next] ASoC: cx2072x: constify static struct snd_soc_dai_ops
Date:   Thu,  8 Apr 2021 17:54:42 +0100
Message-Id: <161790012551.16915.11291748382496909531.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210408062656.803606-1-yebin10@huawei.com>
References: <20210408062656.803606-1-yebin10@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Thu, 8 Apr 2021 14:26:56 +0800, Ye Bin wrote:
> The snd_soc_dai_ops structures is only stored in the ops field of a
> snd_soc_dai_driver structure, so make the snd_soc_dai_ops structure
> const to allow the compiler to put it in read-only memory.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: cx2072x: constify static struct snd_soc_dai_ops
      commit: e9a216d8f14ac4d926078885e7e772db08e6aad9

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
