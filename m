Return-Path: <kernel-janitors+bounces-7443-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 366FFA5781D
	for <lists+kernel-janitors@lfdr.de>; Sat,  8 Mar 2025 04:51:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 423B7189A771
	for <lists+kernel-janitors@lfdr.de>; Sat,  8 Mar 2025 03:51:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8609197A76;
	Sat,  8 Mar 2025 03:50:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h/axxXag"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E18F6F06A;
	Sat,  8 Mar 2025 03:50:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741405812; cv=none; b=jX8FSME9ehgypqdtMQ2O4bCXsjiLBGz39YCJrRmW0Tx+uwMXcunl0LanFrH29OEqKflkQdajb5Th//UDWqs+V6P8bazOTdqsC3CSFEJhSv6c/mdvZmV15LKxrSl9IQCzcShyvgbe0jdhG5Tb/bN0X2hiyTzR5d5Vtyc0YTcuuF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741405812; c=relaxed/simple;
	bh=EvOt4jJxxOLnycn11LVaohhvkGyXLiKm2QafWJlvfHo=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=PHFn8kie6ppszoYWjXk5k2GMgYIFiVh7Lbi3DrFF8iKLJer83aQDyG4HiSBK0x00eqyIK0gX3BxYg8KroHzHlYhs2ZFXAvW8yqGdap0fcRqJ8QeXwz5J6wdBlXv0xje0W1c9mgOJE2DKwVhl1+D+baztIQ7SDb+XGm3vfQT0Gd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h/axxXag; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9CCCEC4CEE0;
	Sat,  8 Mar 2025 03:50:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741405811;
	bh=EvOt4jJxxOLnycn11LVaohhvkGyXLiKm2QafWJlvfHo=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=h/axxXagqRs00AsWqBv1Ma/qrAy501G3rmm7Tra/4JiOvsP/QaXLMWfLqrnZkMNEd
	 Ua8qTAUy/VAqZCVlD8YkYV1KiyfMRc/RQ1cjHgsZPtaM7DQ+w++JOioA13gA/sA6CA
	 izzo6XJahms2ePzKFLajXtCRhEn5VhWknbvzv3xEqPIzEwrEryybYIzzJKvaVQzfs9
	 Zi988yF+pAA50oynXE7ekKXTYSgx64E0wijVsQZVzXr0tmDqvo5wHoOblRV/D8dc/d
	 ZJyrqYOh1rryJAAeHs4Z/w59uKtUH4psGV0SdLmLnXGT6+tUhu9c2S0+r6r8HCkyKv
	 2bWS6v6bJ2iTQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70C79380CFFB;
	Sat,  8 Mar 2025 03:50:46 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] MAINTAINERS: adjust entry in AIROHA ETHERNET DRIVER
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <174140584498.2568613.17989680709317106014.git-patchwork-notify@kernel.org>
Date: Sat, 08 Mar 2025 03:50:44 +0000
References: <20250306094636.63709-1-lukas.bulwahn@redhat.com>
In-Reply-To: <20250306094636.63709-1-lukas.bulwahn@redhat.com>
To: Lukas Bulwahn <lbulwahn@redhat.com>
Cc: lorenzo@kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 netdev@vger.kernel.org, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org, lukas.bulwahn@redhat.com

Hello:

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Thu,  6 Mar 2025 10:46:36 +0100 you wrote:
> From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
> 
> Commit fb3dda82fd38 ("net: airoha: Move airoha_eth driver in a dedicated
> folder") moves the driver to drivers/net/ethernet/airoha/, but misses to
> adjust the AIROHA ETHERNET DRIVER section in MAINTAINERS. Hence,
> ./scripts/get_maintainer.pl --self-test=patterns complains about a broken
> reference.
> 
> [...]

Here is the summary with links:
  - MAINTAINERS: adjust entry in AIROHA ETHERNET DRIVER
    https://git.kernel.org/netdev/net-next/c/730f8d1c611c

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



