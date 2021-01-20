Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 32FFF2FC756
	for <lists+kernel-janitors@lfdr.de>; Wed, 20 Jan 2021 03:02:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731123AbhATBvJ (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Tue, 19 Jan 2021 20:51:09 -0500
Received: from mail.kernel.org ([198.145.29.99]:53144 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731104AbhATBuv (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 19 Jan 2021 20:50:51 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 7B2AD2251D;
        Wed, 20 Jan 2021 01:50:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1611107410;
        bh=GNj2MIJf8RtOcX7Wh6NXVAF3Lf0JF12Jnse9VPAkcDs=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=Rb2mol4m5NZ+U3dN4EUK7Go5NCK9xRzM18VU/O7lvnqeyRglvo+5AMTf3dF1VYRLM
         oqVjiotUxbyoYR6XElxxHl5hqwFTOFUWcRfvsu6VO3A/3QQpipu4ebsuZEun6RYS0A
         yyZC9wfHWYunKxx35lx8lZXGVHCzDiRuzWz1bbXt1FlUSYGt07zAzmDJElmOHm180C
         ChsIcTvqK23IyNdvUvaolBBipNoaYr0jvJ6SamutLzpegUXt2ZTiDzwjnH5NVDLDGs
         o2T9qtV0wfiXDG8RRsHEdUCmXBGMl35SwQpnoWes/+EM1A6HgVDaxKurHOL5GQDngw
         QMV7WLaHiZaBw==
Received: from pdx-korg-docbuild-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-1.ci.codeaurora.org (Postfix) with ESMTP id 74C9760584;
        Wed, 20 Jan 2021 01:50:10 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH][next] selftests: forwarding: Fix spelling mistake "succeded"
 -> "succeeded"
From:   patchwork-bot+netdevbpf@kernel.org
Message-Id: <161110741047.23772.11114014464496090991.git-patchwork-notify@kernel.org>
Date:   Wed, 20 Jan 2021 01:50:10 +0000
References: <20210118111902.71096-1-colin.king@canonical.com>
In-Reply-To: <20210118111902.71096-1-colin.king@canonical.com>
To:     Colin King <colin.king@canonical.com>
Cc:     davem@davemloft.net, kuba@kernel.org, shuah@kernel.org,
        netdev@vger.kernel.org, linux-kselftest@vger.kernel.org,
        kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hello:

This patch was applied to netdev/net-next.git (refs/heads/master):

On Mon, 18 Jan 2021 11:19:02 +0000 you wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> There are two spelling mistakes in check_fail messages. Fix them.
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  tools/testing/selftests/net/forwarding/tc_chains.sh | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Here is the summary with links:
  - [next] selftests: forwarding: Fix spelling mistake "succeded" -> "succeeded"
    https://git.kernel.org/netdev/net-next/c/eaaf61122865

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


