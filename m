Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 191E72AE1E8
	for <lists+kernel-janitors@lfdr.de>; Tue, 10 Nov 2020 22:39:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731813AbgKJVi7 (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Tue, 10 Nov 2020 16:38:59 -0500
Received: from mail.kernel.org ([198.145.29.99]:40612 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730618AbgKJViS (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 10 Nov 2020 16:38:18 -0500
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id BACBE20781;
        Tue, 10 Nov 2020 21:38:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1605044298;
        bh=Dnn9xhJQuhx3Vu8Th8XlsV0/yj6/XXQ3FI+0tcVaL24=;
        h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
        b=nd7qsKYf8nStOia/h2+74tunlWUmQC4lvIYBfAa65hF2aNPnKwik5AG8THdg9mq/D
         auTCgg1v5m6f/rcptmgwKZiQtN3r7vDZJYfeifVSCdOwKDz9ndjcRL9uU98baG65mA
         PKnt49STGhSd4nT3CXRcSh49Apuaan29LR4lozRE=
Date:   Tue, 10 Nov 2020 21:38:04 +0000
From:   Mark Brown <broonie@kernel.org>
To:     Dinghao Liu <dinghao.liu@zju.edu.cn>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Patrick Lai <plai@codeaurora.org>
Cc:     Banajit Goswami <bgoswami@codeaurora.org>,
        kernel-janitors@vger.kernel.org, alsa-devel@alsa-project.org,
        Liam Girdwood <lgirdwood@gmail.com>,
        Takashi Iwai <tiwai@suse.com>
In-Reply-To: <20201105125154.GA176426@mwanda>
References: <20201105125154.GA176426@mwanda>
Subject: Re: [PATCH] ASoC: qcom: common: Fix refcounting in qcom_snd_parse_of()
Message-Id: <160504428419.41991.2200034841116895694.b4-ty@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Thu, 5 Nov 2020 15:51:54 +0300, Dan Carpenter wrote:
> There are two issues in this function.
> 
> 1) We can't drop the refrences on "cpu", "codec" and "platform" before
>    we take the reference.  This doesn't cause a problem on the first
>    iteration because those pointers start as NULL so the of_node_put()
>    is a no-op.  But on the subsequent iterations, it will lead to a use
>    after free.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: qcom: common: Fix refcounting in qcom_snd_parse_of()
      commit: 4e59dd249cd513a211e2ecce2cb31f4e29a5ce5b

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
