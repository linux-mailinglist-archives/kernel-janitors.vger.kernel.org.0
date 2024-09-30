Return-Path: <kernel-janitors+bounces-5729-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B0D9198AF08
	for <lists+kernel-janitors@lfdr.de>; Mon, 30 Sep 2024 23:28:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4C583B229DC
	for <lists+kernel-janitors@lfdr.de>; Mon, 30 Sep 2024 21:28:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95C2F1A4B61;
	Mon, 30 Sep 2024 21:26:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a7XRU9hh"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA9181A3BCE;
	Mon, 30 Sep 2024 21:26:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727731599; cv=none; b=c8nz85/31JDAIwIqy+RYnBWB0bclYZK3jYAPT0KU2E9q854dTJ1lV5HKliM5gNSZuJdvpzWQk2ebYidhl+LShGRop95ubsFumj9K6LajujVD5bvlnQ6hQhhVBHi+yQpkkw/tUyQf+ht3+EkOwh4vPP6PLR+AxBhK0q3tB17G3g8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727731599; c=relaxed/simple;
	bh=qVOQbnU07UKZSQKhSejQqsuASHD/Xw2aPKIM2Eas070=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=qodM7pIsIawbbJfYaX0+ZgaI/dgu10Dbx2Jpnk7bC/jzSdUJXExp8Ta5Gf6qcA75YdVZpAJC40dXrp9VXV5sfMOoKyMGz/gJE4eoQVOxVtKKSBU5Fw2SccgNc/yorypeHjiexyQk49DwGY52jbL7j2x3LrnB6kUNH2l0NgokyDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a7XRU9hh; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 510C6C4CED4;
	Mon, 30 Sep 2024 21:26:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727731598;
	bh=qVOQbnU07UKZSQKhSejQqsuASHD/Xw2aPKIM2Eas070=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=a7XRU9hhJ+n3XoWhWC2T7wlmrr+f4U2U8i1MZQTqCbryzGEryE+m/ClqMKdlP/AlK
	 85oz3MQLwDieXPaEJ1vzihahT75bfyoHQoYFQkQ8G5c8O242xCTBNSpgysMwpEdFzZ
	 CftoCCzoTnYm6EjQNnfCGfEShcshWuCWrUV6/9Z6FbtnetQCA1JinIQo3qakOHE+gA
	 gT4ThyJB+FnD9wcdS5diZNwrZhoaqTUVXXkptEOX8t3pAZjzqMEuMGDL38qre26DFL
	 3VYqfWGt3uJz56BJAjuhCPW4jkkloR+oeEneAOvhGSZ8TPkS+yhGr/jPF7pWGyzUC6
	 4jh9i5YGdQvRg==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org, 
 Colin Ian King <colin.i.king@gmail.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20240923120325.836918-1-colin.i.king@gmail.com>
References: <20240923120325.836918-1-colin.i.king@gmail.com>
Subject: Re: [PATCH] ASoC: codecs: aw88399: Fix spelling mistake
 "unsupport" -> "unsupported"
Message-Id: <172773159711.2197048.2796100769345264453.b4-ty@kernel.org>
Date: Mon, 30 Sep 2024 22:26:37 +0100
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-99b12

On Mon, 23 Sep 2024 13:03:25 +0100, Colin Ian King wrote:
> There is a spelling mistake in a dev_err message. Fix it.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: codecs: aw88399: Fix spelling mistake "unsupport" -> "unsupported"
      commit: 04e800fc328e6eba9f4ec3df375f2b500802653a

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


