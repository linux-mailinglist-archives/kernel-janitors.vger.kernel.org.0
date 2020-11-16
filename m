Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D5A522B550A
	for <lists+kernel-janitors@lfdr.de>; Tue, 17 Nov 2020 00:33:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730126AbgKPXde (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Mon, 16 Nov 2020 18:33:34 -0500
Received: from mail.kernel.org ([198.145.29.99]:40930 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726227AbgKPXde (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 16 Nov 2020 18:33:34 -0500
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 6B2F122280;
        Mon, 16 Nov 2020 23:33:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1605569614;
        bh=t4gH+xslHGEpbSUE9Eg3+imKJ2LMXsAoQ97uWxZ0ZtQ=;
        h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
        b=cL1Oa9Ix9Q75bJYgoFopJvlyodkHC/YzxNqOaedkRH7A3vssk9BPOcD/UqKhXYuLe
         7OXmOD6z33ZkJyo0TUn5NEknCcu5r3DHR2eT5NvEDBJv2nBBWhq4QClZxfIv1v1yNR
         5sCUzu0dRNh7Azwic4TcIXBdC34qlDaCoALiTFWA=
Date:   Mon, 16 Nov 2020 23:33:15 +0000
From:   Mark Brown <broonie@kernel.org>
To:     Patrick Lai <plai@codeaurora.org>,
        xuyuqing <xuyuqing@huaqin.corp-partner.google.com>,
        Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Banajit Goswami <bgoswami@codeaurora.org>,
        Takashi Iwai <tiwai@suse.com>, kernel-janitors@vger.kernel.org,
        Liam Girdwood <lgirdwood@gmail.com>,
        alsa-devel@alsa-project.org
In-Reply-To: <20201116125950.GA44063@mwanda>
References: <20201116125950.GA44063@mwanda>
Subject: Re: [PATCH] ASoC: qcom: sc7180: initialize the "no_headphone" variable
Message-Id: <160556956526.29683.11951945809418219234.b4-ty@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Mon, 16 Nov 2020 15:59:50 +0300, Dan Carpenter wrote:
> The "no_headphone" variable is never set to "false" so it could be
> uninitialized.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: qcom: sc7180: initialize the "no_headphone" variable
      commit: 7141f25f14e03a0b049ffb2010b12abf652a10f3

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
