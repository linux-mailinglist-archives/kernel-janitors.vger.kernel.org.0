Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C1D366995A2
	for <lists+kernel-janitors@lfdr.de>; Thu, 16 Feb 2023 14:23:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230092AbjBPNXr (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Thu, 16 Feb 2023 08:23:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37164 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230063AbjBPNXq (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 16 Feb 2023 08:23:46 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 58AC854579;
        Thu, 16 Feb 2023 05:23:45 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id E915661FF5;
        Thu, 16 Feb 2023 13:23:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7B6BC433AE;
        Thu, 16 Feb 2023 13:23:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1676553824;
        bh=erojs45d0jxAXUZzIrxqgpVrUG2ZaS/aS/eC0hZuboI=;
        h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
        b=lhe5WQZAQvK0ZORtMx+VxuBKOxoltzMeXuIw/vRX/QWh2PXtQ3ZigajQ3FUCBh8CL
         l1QbiszyVlESLDuseiONsvU/T8RNJ4NPnNUltraDFXaS7uomry6SRjwhrjqAhQMRo4
         yhOYtbqPxHy4rtEcIKkKhYK6KlzXH1sZXYo1eYKkfnMZWDCfUImgWkjvIIT1F2nk5R
         PXQ3V4uFLakjYr/Lqq0B4SzXKojBuLVsCKAqw2PprPq4rv3pRKh4LBqZ0aNqu1tRrN
         KMRnYp93VFpZTalVPR582oodi7N4PY2VVfqloPZ68o67uogcAR00APWlRu+08U2rSo
         yZdYURlLU8zfQ==
From:   Mark Brown <broonie@kernel.org>
To:     William Zhang <william.zhang@broadcom.com>,
        Dan Carpenter <error27@gmail.com>
Cc:     Kursad Oney <kursad.oney@broadcom.com>,
        Jonas Gorski <jonas.gorski@gmail.com>,
        Broadcom internal kernel review list 
        <bcm-kernel-feedback-list@broadcom.com>, linux-spi@vger.kernel.org,
        kernel-janitors@vger.kernel.org
In-Reply-To: <Y+zmoGH6LubPhiI0@kili>
References: <Y+zmoGH6LubPhiI0@kili>
Subject: Re: [PATCH] spi: bcm63xx-hsspi: fix error code in probe
Message-Id: <167655382233.3676429.7341927577915213769.b4-ty@kernel.org>
Date:   Thu, 16 Feb 2023 13:23:42 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.0
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Wed, 15 Feb 2023 17:05:20 +0300, Dan Carpenter wrote:
> This code accidentally returns success instead of a negative error code.
> 
> 

Applied to

   broonie/spi.git for-next

Thanks!

[1/1] spi: bcm63xx-hsspi: fix error code in probe
      commit: 97b7cea04f52c3263a74b945a4738f678181b117

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

