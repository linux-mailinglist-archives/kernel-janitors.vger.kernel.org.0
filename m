Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5200C799F3B
	for <lists+kernel-janitors@lfdr.de>; Sun, 10 Sep 2023 20:00:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235624AbjIJSA2 (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Sun, 10 Sep 2023 14:00:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58958 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235350AbjIJSA0 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sun, 10 Sep 2023 14:00:26 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5FA24188;
        Sun, 10 Sep 2023 11:00:22 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D277FC433C8;
        Sun, 10 Sep 2023 18:00:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1694368821;
        bh=7pMVydPneVg3URKXwfaH+adzpHN2LLjVZsTSGuRN/Dc=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=WNCcNX0j78tRLBxMWD5xHUNdVWsV4X1c4GJprcT9133xluNlViXTJ+y1MbbMmvw4S
         9l6p0mwmq1ciXkoHmtsYyK8lFvb1p3EVodnEbrR25eIRn+6jRHWBjTxm2wzjyRS6Mh
         /jvEouU2JwW8Gm/EnKA/L+ncaZS7ANxE1SqxSdP9VAlRZQQbAQGSZNr44Pfjzomk2O
         YmugA3EJ+2/4ZTwGg7O1MhyTBgt+SEpxLAiqRaqU5NrZ9WSluxkkNsOvrlaLWdV7jR
         voEyBX1vKb3bWRjPhlJDd4v26hqNBBRPVghPsTewXgHu/u+K2aUEWjjrhAgY/J0FrG
         nZp7NWsEXqO2w==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id B8F74F1D6A8;
        Sun, 10 Sep 2023 18:00:21 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH 00/11] add missing of_node_put
From:   patchwork-bot+netdevbpf@kernel.org
Message-Id: <169436882175.20878.16500068409286410519.git-patchwork-notify@kernel.org>
Date:   Sun, 10 Sep 2023 18:00:21 +0000
References: <20230907095521.14053-1-Julia.Lawall@inria.fr>
In-Reply-To: <20230907095521.14053-1-Julia.Lawall@inria.fr>
To:     Julia Lawall <julia.lawall@inria.fr>
Cc:     alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org,
        rui.zhang@intel.com, amitk@kernel.org, linux-pm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
        bcm-kernel-feedback-list@broadcom.com,
        linux-kernel@vger.kernel.org, npiggin@gmail.com,
        christophe.leroy@csgroup.eu, linuxppc-dev@lists.ozlabs.org,
        linux-mmc@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-mediatek@lists.infradead.org,
        angelogioacchino.delregno@collabora.com,
        linux-media@vger.kernel.org
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hello:

This patch was applied to netdev/net.git (main)
by David S. Miller <davem@davemloft.net>:

On Thu,  7 Sep 2023 11:55:10 +0200 you wrote:
> Add of_node_put on a break out of an of_node loop.
> 
> ---
> 
>  arch/powerpc/kexec/file_load_64.c                    |    8 ++++++--
>  arch/powerpc/platforms/powermac/low_i2c.c            |    4 +++-
>  arch/powerpc/platforms/powermac/smp.c                |    4 +++-
>  drivers/bus/arm-cci.c                                |    4 +++-
>  drivers/genpd/ti/ti_sci_pm_domains.c                 |    8 ++++++--
>  drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c      |    4 +++-
>  drivers/gpu/drm/mediatek/mtk_drm_drv.c               |    4 +++-
>  drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.c |    1 +
>  drivers/mmc/host/atmel-mci.c                         |    8 ++++++--
>  drivers/net/ethernet/broadcom/asp2/bcmasp.c          |    1 +
>  drivers/soc/dove/pmu.c                               |    5 ++++-
>  drivers/thermal/thermal_of.c                         |    8 ++++++--
>  sound/soc/sh/rcar/core.c                             |    1 +
>  13 files changed, 46 insertions(+), 14 deletions(-)

Here is the summary with links:
  - [02/11] net: bcmasp: add missing of_node_put
    https://git.kernel.org/netdev/net/c/e73d1ab6cd7e

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


