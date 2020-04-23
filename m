Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 930781B5E2D
	for <lists+kernel-janitors@lfdr.de>; Thu, 23 Apr 2020 16:46:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728536AbgDWOp4 (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Thu, 23 Apr 2020 10:45:56 -0400
Received: from mail.kernel.org ([198.145.29.99]:50904 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726380AbgDWOp4 (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 23 Apr 2020 10:45:56 -0400
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C1C2F2074F;
        Thu, 23 Apr 2020 14:45:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1587653156;
        bh=ANqknJSxVOzlNxsyyTwkD/70QAGgpY8SByw/9DBpl70=;
        h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
        b=ru1gOba4KuQhYQr69+Ue5CA1nHDc7RKD/v/hHPrWGOixDUP3cqFyHcd++D4/E742t
         Ap80b1l07EsIu1XQXZrcVjBSVaSNCd6G0gy0URpbdN6XEqvGk8l63iEEfm/gHfMVf7
         BfTnRVXjYEi0ngQ/lbcBcNZPgG3kp2ZBjNxTXCXM=
Date:   Thu, 23 Apr 2020 15:45:53 +0100
From:   Mark Brown <broonie@kernel.org>
To:     alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org,
        Timur Tabi <timur@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Nicolin Chen <nicoleotsuka@gmail.com>,
        Jaroslav Kysela <perex@perex.cz>,
        Xiubo Li <Xiubo.Lee@gmail.com>,
        Fabio Estevam <festevam@gmail.com>,
        Takashi Iwai <tiwai@suse.com>,
        Colin King <colin.king@canonical.com>
Cc:     linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
In-Reply-To: <20200423083922.8159-1-colin.king@canonical.com>
References: <20200423083922.8159-1-colin.king@canonical.com>
Subject: Re: [PATCH][next] ASoC: fsl_easrc: fix spelling mistake "prefitler" -> "prefilter"
Message-Id: <158765314784.33774.8027671793681805498.b4-ty@kernel.org>
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Thu, 23 Apr 2020 09:39:22 +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> There is a spelling mistake in a deb_dbg message, fix it.
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  sound/soc/fsl/fsl_easrc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.8

Thanks!

[1/1] ASoC: fsl_easrc: fix spelling mistake "prefitler" -> "prefilter"
      commit: 76ec4aea9fd8117f064caa63ee6f7fbcb70eeb2c

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
