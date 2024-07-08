Return-Path: <kernel-janitors+bounces-4523-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B99FC92A4B4
	for <lists+kernel-janitors@lfdr.de>; Mon,  8 Jul 2024 16:31:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5B189B21CBE
	for <lists+kernel-janitors@lfdr.de>; Mon,  8 Jul 2024 14:31:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA48513D888;
	Mon,  8 Jul 2024 14:31:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FbTbhAuG"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D7E91C06;
	Mon,  8 Jul 2024 14:31:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720449063; cv=none; b=MWuwRGgIKRRExsX8qYu8CZiykDWaAymfyl5v28+7KAL0XafjGCGQq9Mh10KYpZXNenVpvsPgf8CbtI53dLl14o4errV6w3ZMbaK2pSO+oa03utIl/9aUSAodcOG34wUzxen17I4PhmnUr7HY0VC8koC3f5zn20Wjj49i0ntJp8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720449063; c=relaxed/simple;
	bh=O4KHSKXsoEZywc/kAvs//J+mO2AalE5uy6SSUGtRwlc=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=fQZvTKJh5hDwJjqUscXCoH8QasyUy3/9cdxK20L7s3HQqnKiZLf7ZCKapeiLVRo6u2ZD3nVGcL69fm5rSPHdaXCKo4E2MAaaN1bvjtq0OMnK5P2m4nCoh+L8Qv7tSxuIt5U/aQtdeaJHieTcmzbYDblDL0PWft7pWTW7zGysyCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FbTbhAuG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id A1C9BC4AF0C;
	Mon,  8 Jul 2024 14:31:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720449062;
	bh=O4KHSKXsoEZywc/kAvs//J+mO2AalE5uy6SSUGtRwlc=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=FbTbhAuGZsJzOvahJzQPVUf5HEi/ZsITmEGsHWJ8tSLbBsRlvz6GZ+fjk0yZMow20
	 37wUqdgVpnVAnGJxL2CyVUYlMMlOc6b6pGzcP7XcGnE+8kijpkCxiWea/5VkUt5bql
	 BodtaGlqy/Ui3Nn8HpwEmcq7nd4EsWzaXZYQ1d5OoNxAFrKQIzjWWMO+ztkX56YNzI
	 AqsOHrloVxb8sxYNIkCIsV5XQXEFvxensxf+7vkZCoL864wI7FvQ0UhF55E9oc2UzG
	 TMEIQh1maN37f7hZQ3wexSH7Ps+yfuwNoLkP6lZliM8DM5Aiw6jwM2SuL+1q8xUvAK
	 mxzvSsOZwBx6g==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 93C27DF370E;
	Mon,  8 Jul 2024 14:31:02 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH bpf-next] bpf: remove unnecessary loop in
 task_file_seq_get_next()
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <172044906260.22805.9209781347110456258.git-patchwork-notify@kernel.org>
Date: Mon, 08 Jul 2024 14:31:02 +0000
References: <ZoWJF51D4zWb6f5t@stanley.mountain>
In-Reply-To: <ZoWJF51D4zWb6f5t@stanley.mountain>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: yonghong.song@linux.dev, brauner@kernel.org, ast@kernel.org,
 daniel@iogearbox.net, andrii@kernel.org, martin.lau@linux.dev,
 eddyz87@gmail.com, song@kernel.org, john.fastabend@gmail.com,
 kpsingh@kernel.org, sdf@fomichev.me, haoluo@google.com, jolsa@kernel.org,
 bpf@vger.kernel.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org

Hello:

This patch was applied to bpf/bpf-next.git (master)
by Daniel Borkmann <daniel@iogearbox.net>:

On Thu, 4 Jul 2024 10:19:19 -0500 you wrote:
> After commit 0ede61d8589c ("file: convert to SLAB_TYPESAFE_BY_RCU") this
> loop always iterates exactly one time.  Delete the for statement and pull
> the code in a tab.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>  kernel/bpf/task_iter.c | 9 +++------
>  1 file changed, 3 insertions(+), 6 deletions(-)

Here is the summary with links:
  - [bpf-next] bpf: remove unnecessary loop in task_file_seq_get_next()
    https://git.kernel.org/bpf/bpf-next/c/bc239eb271e5

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



