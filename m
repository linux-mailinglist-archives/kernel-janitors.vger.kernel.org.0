Return-Path: <kernel-janitors+bounces-5369-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FE66975DD6
	for <lists+kernel-janitors@lfdr.de>; Thu, 12 Sep 2024 02:10:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E40FD2854CC
	for <lists+kernel-janitors@lfdr.de>; Thu, 12 Sep 2024 00:10:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A86174685;
	Thu, 12 Sep 2024 00:10:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q3UkPlUf"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07A48137E;
	Thu, 12 Sep 2024 00:10:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726099831; cv=none; b=hCJeHrjPop5Yavwlv7hzn5o7eYmZQkm8E2H7D0aGD59tXjumGHGwS9ekPenz1QpbXXyhnlbf7TFBiUXYoHLXXkx3DxrPG6/NHb0iuklkC9gR9yrzuMl1PV2ES4+Jq0eSLfdTmAbPuggyr6ZncgY1CQEnIoPc7UuiOJGmIkj2MBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726099831; c=relaxed/simple;
	bh=8szpGKsPyE2ggZ+fRL53OKU95x+zzxKFLvmT9LonEHM=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=ODCLbo29NdfKTbImBXJ6038WWBhxpKS0SBS8+xVGXdp0XiNXUEi/2G0eVV0KPSFRFmorGDSayfVSDttePNJyNGJw6zost7vg3kJQgctcy3xpXBdbqSlCn4zxbV6uFDE95AIc/fPcIrsMfAE73/8yalsJ8T9HR0u/gKjKthBxi0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q3UkPlUf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF8DBC4CED0;
	Thu, 12 Sep 2024 00:10:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726099830;
	bh=8szpGKsPyE2ggZ+fRL53OKU95x+zzxKFLvmT9LonEHM=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=Q3UkPlUf34kbhKPc4MTXH8wCCxMZVn5bpfbFcbGjd+pVVcm7BwR7w0EX1AIZ9w+jq
	 qBq4d2T60uHuSDb/bkfIrZlpwunNt9X+zzaWJVJFojCD6oF+7Wu6mRIDe12NPH+Nuf
	 04VYxaQSqgljnnNkKf2G/dne1E+VjvUk4TOBDlcKl2iW4eVTC8lGOM2/vMx2qWZYTc
	 Foj2OQ52HXMk3zf6Mu0xIHJ3R8+18qgvn52BKafNcB1UdHg9I6VgzuXNqxwR2K+Vl+
	 rSrkr/2Hf4mOEmB3nQ85M2FMmJGR2ZBLxcLp4579F+ZvNTU1YCjzy8xP5DYEbPGV93
	 xzutCbtbdAyxg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 341383806656;
	Thu, 12 Sep 2024 00:10:33 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH][next][V2] qlcnic: make read-only const array key static
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <172609983202.1114191.463835337083384525.git-patchwork-notify@kernel.org>
Date: Thu, 12 Sep 2024 00:10:32 +0000
References: <20240910120635.115266-1-colin.i.king@gmail.com>
In-Reply-To: <20240910120635.115266-1-colin.i.king@gmail.com>
To: Colin Ian King <colin.i.king@gmail.com>
Cc: shshaikh@marvell.com, manishc@marvell.com, GR-Linux-NIC-Dev@marvell.com,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 netdev@vger.kernel.org, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org

Hello:

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Tue, 10 Sep 2024 13:06:35 +0100 you wrote:
> Don't populate the const read-only array key on the stack at
> run time, instead make it static.
> 
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
> 
> ---
> 
> [...]

Here is the summary with links:
  - [next,V2] qlcnic: make read-only const array key static
    https://git.kernel.org/netdev/net-next/c/af647fe240a9

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



