Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5CC0F50B416
	for <lists+kernel-janitors@lfdr.de>; Fri, 22 Apr 2022 11:30:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1446026AbiDVJdL (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Fri, 22 Apr 2022 05:33:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49222 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1446104AbiDVJdH (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 22 Apr 2022 05:33:07 -0400
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D710B4EF6C;
        Fri, 22 Apr 2022 02:30:14 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id 3EE7BCE282F;
        Fri, 22 Apr 2022 09:30:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 792D3C385AE;
        Fri, 22 Apr 2022 09:30:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1650619811;
        bh=4BJZmEVhYZrUvVU6UDMs/63mofJAqQXx7Fh//ZtPELE=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=oXcUm3/OfvUQrRqFPjGM0708vHge2XT6eA9yNra/Z7rzAVXzJMqznGzwyGKUaa3dE
         4HJ59SaClIzZs1Y7BSyRnpPhRmvjpaLO6XsUvvhm5cvtg2rihNhc0txbyFMKJB7f8q
         yhn18KnB9MmT3eWZxf4gdyMVwbO/t9kLAQwM24rtFp9qETAbwL3+2PTAML8ZHFYu2C
         xVl3jjrKTJjKe9u/XKGNao9v4vliuvgxKrnrK6KrOZbxljUv9Z8HnJkJ07gBWjS1jg
         2TECGWebuJH+N7WByXUuMnDt2gxguJosqQzrCzbAj/JYqXSzNWHov40yo+5a5VSy1V
         8wegkRaY0Ckfw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 65203E85D90;
        Fri, 22 Apr 2022 09:30:11 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] myri10ge: remove redundant assignment to variable status
From:   patchwork-bot+netdevbpf@kernel.org
Message-Id: <165061981141.24106.14578807719178720929.git-patchwork-notify@kernel.org>
Date:   Fri, 22 Apr 2022 09:30:11 +0000
References: <20220418143759.85626-1-colin.i.king@gmail.com>
In-Reply-To: <20220418143759.85626-1-colin.i.king@gmail.com>
To:     Colin Ian King <colin.i.king@gmail.com>
Cc:     christopher.lee@cspi.com, davem@davemloft.net, kuba@kernel.org,
        pabeni@redhat.com, netdev@vger.kernel.org,
        kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
        llvm@lists.linux.dev
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hello:

This patch was applied to netdev/net-next.git (master)
by David S. Miller <davem@davemloft.net>:

On Mon, 18 Apr 2022 15:37:59 +0100 you wrote:
> Variable status is being assigned a value that is never read, it is
> being re-assigned again later on. The assignment is redundant and can
> be removed.
> 
> Cleans up clang scan build warning:
> drivers/net/ethernet/myricom/myri10ge/myri10ge.c:582:7: warning: Although
> the value stored to 'status' is used in the enclosing expression, the
> value is never actually read from 'status' [deadcode.DeadStores]
> 
> [...]

Here is the summary with links:
  - myri10ge: remove redundant assignment to variable status
    https://git.kernel.org/netdev/net-next/c/1c604f91b773

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


