Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7173557E196
	for <lists+kernel-janitors@lfdr.de>; Fri, 22 Jul 2022 14:48:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229936AbiGVMsN (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Fri, 22 Jul 2022 08:48:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34298 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234930AbiGVMsN (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 22 Jul 2022 08:48:13 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B01297A33;
        Fri, 22 Jul 2022 05:48:12 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 23F7DB828E4;
        Fri, 22 Jul 2022 12:48:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC1E3C341C6;
        Fri, 22 Jul 2022 12:48:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1658494089;
        bh=Ud3fBR4hc4FZQPjJjdty/gcZtKe01RBLo5RSfrJ4kTk=;
        h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
        b=l3H0RKwTwMDx67icvsToIO5/v3V3Nmp6Dq3sfF1fTbToHFGdb+86SnzaJpQBt7eyU
         PSONXtKy58OZBr39XNwDIO7SvzKTEwROvbUOk0gosHsKCdkQEqD/V4okZJ5mCuIN7Z
         pWW4D/6e2IeYe1jzqCuv64AiW/1o8szC3c8Cxx0sFpTwYCloW5EyKqRiXpEYcreKFr
         OiYqXBj8pnIAI6TEB5YHBo3r2lSfOvwfVXEOsenfyNgpup33Rc0of3V38pDiEOuyv/
         vACdshTHIjYML1c6BT7av8oSU/Q6v11YmcybWDl2bQaEMfjbfXjcMqDPoVZMWUzk1y
         Rb+hvvL+1F59A==
From:   Mark Brown <broonie@kernel.org>
To:     Takashi Iwai <tiwai@suse.com>,
        Banajit Goswami <bgoswami@quicinc.com>,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Jaroslav Kysela <perex@perex.cz>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc:     kernel-janitors@vger.kernel.org, alsa-devel@alsa-project.org,
        linux-kernel@vger.kernel.org
In-Reply-To: <0fca3271649736053eb9649d87e1ca01b056be40.1658394124.git.christophe.jaillet@wanadoo.fr>
References: <0fca3271649736053eb9649d87e1ca01b056be40.1658394124.git.christophe.jaillet@wanadoo.fr>
Subject: Re: [PATCH] ASoC: qcom: q6dsp: Fix an off-by-one in q6adm_alloc_copp()
Message-Id: <165849408745.139149.18056511362358872922.b4-ty@kernel.org>
Date:   Fri, 22 Jul 2022 13:48:07 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-d952f
X-Spam-Status: No, score=-7.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Thu, 21 Jul 2022 11:02:22 +0200, Christophe JAILLET wrote:
> find_first_zero_bit() returns MAX_COPPS_PER_PORT at max here.
> So 'idx' should be tested with ">=" or the test can't match.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: qcom: q6dsp: Fix an off-by-one in q6adm_alloc_copp()
      commit: 673f58f62ca6fc98979d1cf3fe89c3ff33f29b2e

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
