Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 21FD82F4E9C
	for <lists+kernel-janitors@lfdr.de>; Wed, 13 Jan 2021 16:29:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726289AbhAMP20 (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Wed, 13 Jan 2021 10:28:26 -0500
Received: from mail.kernel.org ([198.145.29.99]:32872 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725846AbhAMP20 (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 13 Jan 2021 10:28:26 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1FFAD2339F;
        Wed, 13 Jan 2021 15:27:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1610551665;
        bh=yF8t4IHeXMhyMj1FVUZptqNcSclfnGbYPmGrQchj5Xk=;
        h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
        b=UMa9xUp/G2wDgYytwRzx5tk2LEPYmPcva5TN1KUwUWyLc5CfG2j5EnfnPuYHJYrdE
         5IixulTcTWhMuExTXlg6uDvyjPUeEIqVr/ABlEGC24fgltCA/tU91LKrEmArRLKS6H
         o0kvze5qyR7vbEagnzAzcGUH1QsPNh6naXKFszTXJ5PM+AR/uGlcPT8980TON9G6l/
         QpK/3bBTIwtpWt8Mcwy8z0H6ouzmQOUYFgHq0GVdBTVmCRVf0nbdlN8F53ttDE6NDP
         pNhAlyuzKKi/mDIQFlBiY/vqGJsuosGHWjQCFwDwJFf3GIUPHBb2d6icOHR6TVxMxh
         9ZsOm5ccP6B8w==
From:   Mark Brown <broonie@kernel.org>
To:     Brian Austin <brian.austin@cirrus.com>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        James Schulman <james.schulman@cirrus.com>
Cc:     Takashi Iwai <tiwai@suse.com>,
        David Rhodes <david.rhodes@cirrus.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        patches@opensource.cirrus.com, kernel-janitors@vger.kernel.org,
        alsa-devel@alsa-project.org
In-Reply-To: <X9NE/9nK9/TuxuL+@mwanda>
References: <X9NE/9nK9/TuxuL+@mwanda>
Subject: Re: [PATCH] ASoC: cs42l56: fix up error handling in probe
Message-Id: <161055160365.21623.3967340008515664713.b4-ty@kernel.org>
Date:   Wed, 13 Jan 2021 15:26:43 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Fri, 11 Dec 2020 13:07:59 +0300, Dan Carpenter wrote:
> There are two issues with this code.  The first error path forgot to set
> the error code and instead returns success.  The second error path
> doesn't clean up.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: cs42l56: fix up error handling in probe
      commit: 856fe64da84c95a1d415564b981ae3908eea2a76

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
