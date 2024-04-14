Return-Path: <kernel-janitors+bounces-2509-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E57C08A21C6
	for <lists+kernel-janitors@lfdr.de>; Fri, 12 Apr 2024 00:36:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A9E0928441E
	for <lists+kernel-janitors@lfdr.de>; Thu, 11 Apr 2024 22:36:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9008846542;
	Thu, 11 Apr 2024 22:35:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GOKeKENm"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E142317C8D;
	Thu, 11 Apr 2024 22:35:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712874958; cv=none; b=mQQHxakZgzIDA7paw6+AypYUNyuGIjyzTG3M1YRhyopYUZZbUUe5IfTi6GgOPQ80l0lb6zC2bqmJfMg/8LTKDYGydOUmcw2LuDhI5uaCL+dXzrwRj1O98W4/qQiIsY2dJepPjaO9dqj4W/r2F9w/A9PXjrcsAaRQLgBqLFYKSGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712874958; c=relaxed/simple;
	bh=ZgKCfsWFqENGu2Mnw8GcJWs4r368JeG6kTQENU1jAkw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=m8fk8gcAOEUY8xjn8ps/Et0xIIZrukR6PxawXaKaBvcMvjiPS0SEpsK58TT9m94B17HZ4QMq10J1i+fFuGQ/hRUhZKzVN8Ci4nZBV4vz4+XcV5HO3dK4pWbykMdQICvtw4IKZuowQiTbVIYZVGt2UqcX4T41eIXZ2oQWIItBEVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GOKeKENm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7DD48C072AA;
	Thu, 11 Apr 2024 22:35:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712874957;
	bh=ZgKCfsWFqENGu2Mnw8GcJWs4r368JeG6kTQENU1jAkw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=GOKeKENm2iBE7FcHqURXogLvsi1VM/SOP+bnihaC34q1pf5cC0YxmAU3RB69q2IU7
	 qRlB7GrGAhUthAcVE9Nb+kl2dD07dQreOwOlCWoM+EYYLtsT2X4qctULVfmYqEwa8i
	 xBr9kt68BlyRlTaq8ueOR48JFobItbNt1zjQ7EKX7GxLn2cf5Hm/t+Z3FTgR5zaUH+
	 p2dlk0GbzsCfoRVzOb5qPo8ISM5hSua+WNUC2KMfwSkYx7M3VcvHF/PXVjOHp75ohb
	 ZXdVJ3aCvU4Y4NoFXN6tqIATZo0SncP7FXrA4HZs1SbEOVTKkduTIjYocK21umR2H3
	 pbaVp7pVlDdqw==
From: Mark Brown <broonie@kernel.org>
To: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, 
 Baojun Xu <baojun.xu@ti.com>, Liam Girdwood <lgirdwood@gmail.com>, 
 alsa-devel@alsa-project.org, linux-sound@vger.kernel.org, 
 Lukas Bulwahn <lbulwahn@redhat.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Lukas Bulwahn <lukas.bulwahn@redhat.com>
In-Reply-To: <20240411075803.53657-1-lukas.bulwahn@redhat.com>
References: <20240411075803.53657-1-lukas.bulwahn@redhat.com>
Subject: Re: [PATCH] MAINTAINERS: adjust file entry in TEXAS INSTRUMENTS
 AUDIO (ASoC/HDA) DRIVERS
Message-Id: <171287495520.96963.7535991617111488759.b4-ty@kernel.org>
Date: Thu, 11 Apr 2024 23:35:55 +0100
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14-dev

On Thu, 11 Apr 2024 09:58:03 +0200, Lukas Bulwahn wrote:
> Commit 8167bd1c8a45 ("ASoC: dt-bindings: ti,pcm1681: Convert to dtschema")
> converts ti,pcm1681.txt to ti,pcm1681.yaml, but misses to adjust the file
> entry in TEXAS INSTRUMENTS AUDIO (ASoC/HDA) DRIVERS.
> 
> Hence, ./scripts/get_maintainer.pl --self-test=patterns complains about a
> broken reference.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/1] MAINTAINERS: adjust file entry in TEXAS INSTRUMENTS AUDIO (ASoC/HDA) DRIVERS
      commit: 82116e539ffb7ce0c317c208d53d2126cdcee687

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


