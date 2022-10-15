Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 40A485FF9A3
	for <lists+kernel-janitors@lfdr.de>; Sat, 15 Oct 2022 12:20:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229653AbiJOKUX (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Sat, 15 Oct 2022 06:20:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46894 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229540AbiJOKUW (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sat, 15 Oct 2022 06:20:22 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6ED932B19A;
        Sat, 15 Oct 2022 03:20:18 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 4FAC6B80884;
        Sat, 15 Oct 2022 10:20:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 10239C433C1;
        Sat, 15 Oct 2022 10:20:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1665829216;
        bh=7LzI11ajSie64NWw5QlbTj7xN/wVydnL5snX5iTZpKk=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=qVeFpQ8Q1IHRuhaCQceLOx4QkOqtCUrY8wVwu6o5hCcFwxGcolUMsG5Oh0R3FwWbF
         ucYghCHYGLLBVwqf34JxQ3NfQovaYElCEo9rrc/E+AfYY1CxZFn7J9V8gjZq9Abbbq
         WAnG5UU1VUrss7EclTrOJovjvJCWJf296JqBSb0gtAjHYW7XW8EPvS5jdeG5nkWnrM
         JIYFbD1S70DyJWQ6UDwCEJEFWD4I7aq5rz5P8J64pocObnG0CLBeuwCCXvNARxT0OP
         goQ/Vj4+TJnP2myV8h8nUuackT8aV7oZ0ZhJERB4wo+ctyxD7aMrpSosbwA5MPO0Ic
         T6kdSHE/LXANw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id E625AE50D91;
        Sat, 15 Oct 2022 10:20:15 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net] net: dsa: uninitialized variable in
 dsa_slave_netdevice_event()
From:   patchwork-bot+netdevbpf@kernel.org
Message-Id: <166582921593.1299.4105942154478484272.git-patchwork-notify@kernel.org>
Date:   Sat, 15 Oct 2022 10:20:15 +0000
References: <Y0l7d6Kcs31oErzx@kili>
In-Reply-To: <Y0l7d6Kcs31oErzx@kili>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     andrew@lunn.ch, olteanv@gmail.com, vivien.didelot@gmail.com,
        f.fainelli@gmail.com, davem@davemloft.net, edumazet@google.com,
        kuba@kernel.org, pabeni@redhat.com, netdev@vger.kernel.org,
        kernel-janitors@vger.kernel.org
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hello:

This patch was applied to netdev/net.git (master)
by David S. Miller <davem@davemloft.net>:

On Fri, 14 Oct 2022 18:08:39 +0300 you wrote:
> Return zero if both dsa_slave_dev_check() and netdev_uses_dsa() are false.
> 
> Fixes: acc43b7bf52a ("net: dsa: allow masters to join a LAG")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> (Vladimir helped me with this patch)
> 
> [...]

Here is the summary with links:
  - [net] net: dsa: uninitialized variable in dsa_slave_netdevice_event()
    https://git.kernel.org/netdev/net/c/0a6d58a70a39

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


