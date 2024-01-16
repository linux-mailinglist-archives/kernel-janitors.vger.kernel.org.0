Return-Path: <kernel-janitors+bounces-1336-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5459F82F20B
	for <lists+kernel-janitors@lfdr.de>; Tue, 16 Jan 2024 17:00:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 044BB286412
	for <lists+kernel-janitors@lfdr.de>; Tue, 16 Jan 2024 16:00:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 647171C6B2;
	Tue, 16 Jan 2024 16:00:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="caKS5xvO"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEDA91C2AF;
	Tue, 16 Jan 2024 16:00:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5A19FC433A6;
	Tue, 16 Jan 2024 16:00:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705420829;
	bh=Q/U5cHI34D7iQHCMpS7ulp8B3+pXweDFeLpHjBFz4ZA=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=caKS5xvOt27ddopWasFjL+XlQ2cACq+fqQRXv0tG6HB7lXTDwK2aNFlqWK3ufzJBw
	 hErAhJnKtv/BTGLDM5ykNmSAfMli6tC7aitwagNKYdIZ1Wi6jYRztQXJpwCEtX2ALr
	 ota72LHOt8NjwvN3Mb3dp8aFUjhnUy7/23YwSSs6qy7XCPsQmtMf+KHIO5qbrvdl+X
	 bzgV1jV0DOj6Phnu6JvL4QA9jMzHNa/XmdJM+WF96w56hHslFHiTfj3oHu2UXoNYzp
	 DToIg9l+UpBCs3Z47cA3fmKqRe24AV4kcj7WNhC/EJ014VYBQmq6w89IiIMAnEOhiO
	 lg2nqbdI7ICzA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 40CF8D8C985;
	Tue, 16 Jan 2024 16:00:29 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] Bluetooth: Remove usage of the deprecated ida_simple_xx() API
From: patchwork-bot+bluetooth@kernel.org
Message-Id: 
 <170542082925.25552.2942845437512167526.git-patchwork-notify@kernel.org>
Date: Tue, 16 Jan 2024 16:00:29 +0000
References: <3b3523b475d0f5cadf81b3131bb1a38b7476b020.1705349526.git.christophe.jaillet@wanadoo.fr>
In-Reply-To: <3b3523b475d0f5cadf81b3131bb1a38b7476b020.1705349526.git.christophe.jaillet@wanadoo.fr>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: marcel@holtmann.org, johan.hedberg@gmail.com, luiz.dentz@gmail.com,
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
 linux-bluetooth@vger.kernel.org

Hello:

This patch was applied to bluetooth/bluetooth-next.git (master)
by Luiz Augusto von Dentz <luiz.von.dentz@intel.com>:

On Mon, 15 Jan 2024 21:12:19 +0100 you wrote:
> ida_alloc() and ida_free() should be preferred to the deprecated
> ida_simple_get() and ida_simple_remove().
> 
> Note that the upper limit of ida_simple_get() is exclusive, but the one of
> ida_alloc_max() is inclusive. So a -1 has been added when needed.
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> 
> [...]

Here is the summary with links:
  - Bluetooth: Remove usage of the deprecated ida_simple_xx() API
    https://git.kernel.org/bluetooth/bluetooth-next/c/6061d66bd0e5

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



