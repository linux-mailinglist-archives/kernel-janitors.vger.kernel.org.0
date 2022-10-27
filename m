Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6900F60EE76
	for <lists+kernel-janitors@lfdr.de>; Thu, 27 Oct 2022 05:20:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234105AbiJ0DU3 (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Wed, 26 Oct 2022 23:20:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49476 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233553AbiJ0DUY (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 26 Oct 2022 23:20:24 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6640931DF0;
        Wed, 26 Oct 2022 20:20:18 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id A3B33B824A4;
        Thu, 27 Oct 2022 03:20:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 41A48C433D7;
        Thu, 27 Oct 2022 03:20:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1666840816;
        bh=+QTo+KlsmRvp9qwJjCtzcCdbec7fHRjr5muDnIaMFtY=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=u/HACuPRRDxujYqxsxDdrftpbKqSItfTRggt4t5hjDOKl4HOreqHg7J+ObXjD7Yyi
         KjdlIqF9BqbZcaMo/oHIyqQvI5qz/ifsqkXVrHYjcu1/7yTunbQQxkM9ogi84DtySW
         wPvXajpqct6eHOUCgRNoVm8zwqhGA24gkmbvgn1sriQK0I6A4srKSj9Zr2UK6GR/ma
         uS2tKqeBHlZW5BwLIGVr/2V8UZnAAwxQO9GUfSU7sH9GiY+DXYjQRGvThNTBQAXbno
         2fwweNC/mccw9i3/+ZvPhFIci1J1Ma1LtjrIUhHE2hiO3Q36To9vmD4JIw9a4vDBI0
         sO/5M7GdfDB3A==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 23451E270DC;
        Thu, 27 Oct 2022 03:20:16 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] net/rds: remove variable total_copied
From:   patchwork-bot+netdevbpf@kernel.org
Message-Id: <166684081613.26512.10280372865742214083.git-patchwork-notify@kernel.org>
Date:   Thu, 27 Oct 2022 03:20:16 +0000
References: <20221024135046.2159523-1-colin.i.king@gmail.com>
In-Reply-To: <20221024135046.2159523-1-colin.i.king@gmail.com>
To:     Colin Ian King <colin.i.king@gmail.com>
Cc:     santosh.shilimkar@oracle.com, davem@davemloft.net,
        edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
        netdev@vger.kernel.org, linux-rdma@vger.kernel.org,
        rds-devel@oss.oracle.com, kernel-janitors@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Spam-Status: No, score=-7.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hello:

This patch was applied to netdev/net-next.git (master)
by Jakub Kicinski <kuba@kernel.org>:

On Mon, 24 Oct 2022 14:50:46 +0100 you wrote:
> Variable total_copied is just being incremented and it's never used
> anywhere else. The variable and the increment are redundant so
> remove it.
> 
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
> ---
>  net/rds/message.c | 2 --
>  1 file changed, 2 deletions(-)

Here is the summary with links:
  - net/rds: remove variable total_copied
    https://git.kernel.org/netdev/net-next/c/b65ef50e0647

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


